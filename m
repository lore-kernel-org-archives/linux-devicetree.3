Received: from mta0.migadu.com (out-66.mta0.migadu.com [91.218.175.66])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7860A552939
	for <devicetree@vger.kernel.org>; Wed, 23 Sep 2026 15:25:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.66
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790177142; cv=none; b=CX1O6fzkSIjBs6auNEIpDic/MuPn7B1nifKSAPb43UGVDuGzHyDLOpZAaKSr8b/gmo4aL+xc/EMnSdz4+dteNjQS1+XyxyCyJXoRwongK4IEWrntl2wNGjRpKckwGSn2ulAPb1hI5AlMHoTLDhkEa3aD03QVufQAzlMMLXLKdLw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790177142; c=relaxed/simple;
	bh=3ROL16dsAh+c8sg22iUPVfDiQwxBVc7mKsfDKO9pLq8=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=oOcn2pPfoCAzP3mQqP2rYXogcr6mrvQr/FGUBy37vnKp+gqaXkxZUVZQ5w4ZIcM/lweYE5+WS2I0UiURYLASxoTZYZB58BgWQsIr8BkklVhJtSNoTD2p/H4xE1maLE5MMTX8S1iiyw0nojOyn5vT2ot9Ih0JGJgUPNzvkMqP2oY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=akao.au; spf=pass smtp.mailfrom=akao.au; dkim=pass (2048-bit key) header.d=akao.au header.i=@akao.au header.b=eh3PIzuJ; arc=none smtp.client-ip=91.218.175.66
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=akao.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=akao.au
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=akao.au header.i=@akao.au header.b="eh3PIzuJ"
X-Envelope-To: devicetree@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=3ROL16dsAh+c8sg22iUPVfDiQwxBVc7mKsfDKO9pLq8=;
 c=simple/simple; d=akao.au;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1790177132; v=1; x=1790781932;
 b=eh3PIzuJdtkTzNASTqrfWxAHggwqNNw4+qddWx4WFrO/OwG7uAm8/REC+s2sbpQKwnqZ3yJ2
 KgupTGEexkHjpo6w6bHo/WCtVcRQhJmJHnAvrLPOQ1Sojqp+KHYrh58abERCy2xGJ3vFtfmpuxA
 ZrGM8dJuO9sPW3jQIcOIb4DNFQvoIOLEyiP4hjZTvQ2r/tyz6nHR4n3QAZilk9mDuf0mIiIYWyJ
 JYRPlMD2IfSZpeKPbPD5XaNnC4/DHR2REZ2nb7eI97A+ORNvtjGIxSXEjtPgZbBcNG4LRD4og2V
 3sKUSH3UHl0EsRVuyGjslnXwMksW+XNYOdRbAPjDF03Rg==
X-Envelope-To: devicetree@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id 80ca941ee9d5e72b;
	Wed, 23 Sep 2026 15:25:23 +0000
X-Mizu-Trace-ID: 80ca941ee9d5e72b
X-Migadu-Flow: FLOW_OUT
From: Charlie Garner <charlie@akao.au>
To: Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>
Cc: Abel Vesa <abelvesa@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Val Packett <val@packett.cool>,
	Laurentiu Tudor <laurentiu.tudor1@dell.com>,
	Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
	linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Charlie Garner <charlie@akao.au>
Subject: [PATCH 0/2] arm64: dts: qcom: Dell Inspiron 14 Plus 7441 backlight and touchscreen fixes
Date: Thu, 24 Sep 2026 00:55:04 +0930
Message-ID: <20260923152506.44989-1-charlie@akao.au>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Two fixes for the Dell Inspiron 14 Plus 7441.

Patch 1 gives the eDP panel a PWM backlight. The AUO B140QAX01.H panel
only supports PWM-pin brightness, so the DP AUX fallback registers a
backlight with max_brightness 0 and brightness cannot be changed. The PWM
wiring (PMK8550 gpio5 func3, pmk8550_pwm) matches the HP OmniBook X14.
It goes in the Inspiron DT rather than x1-dell-thena.dtsi, because the
Latitude 7455 was submitted with a different panel and a working
backlight, and only the Inspiron has been tested. The dtsi only gains a
panel label, which leaves the Latitude DTB functionally unchanged. If a
Latitude 7455 owner can confirm the same PWM wiring, this can move to the
dtsi.

Patch 2 moves the touchscreen from 0x10, where nothing responds, to 0x09.
That is where the HID-over-I2C device answers, where the firmware's DSDT
places it on this machine, and where the Latitude 7455 DT already has the
same part.

As far as I know, no Inspiron 14 Plus 7441 has its touchscreen at 0x10.
The original node matches the CRD, XPS 13 9345 and T14s nodes the DT was
based on.

Charlie Garner (2):
  arm64: dts: qcom: x1e80100-dell-inspiron-14-plus-7441: add PWM
    backlight
  arm64: dts: qcom: x1e80100-dell-inspiron-14-plus-7441: fix touchscreen
    i2c address

 arch/arm64/boot/dts/qcom/x1-dell-thena.dtsi   |  2 +-
 .../x1e80100-dell-inspiron-14-plus-7441.dts   | 31 +++++++++++++++++--
 2 files changed, 30 insertions(+), 3 deletions(-)


base-commit: 32afff1e816e10185bb571aa9d89dc2eb061d548
-- 
2.55.0

