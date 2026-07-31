Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D8BA234A794;
	Fri, 31 Jul 2026 03:24:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785468280; cv=none; b=XSrDElzzCRkCKoIta7u/B81BbeBBP8glg8IrL2PVEiR0gFezuJDFZw/tsbQq+sa+S6lsnsgxcKhidlqbN/yAuFj1su6Si7wa/bObh1qpumP6vjQuVm1yXQSmLtCGqj73EtEFINzEPFLWQhy/42ZoIkUoVbZpnSQWoMPY9fPTT7E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785468280; c=relaxed/simple;
	bh=qnpQ3C8tQGBhiH8+1xx7PGgCFO6nxvLoFbSifEJaN1w=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=KvYzwN9iZsvk1uEBnzZrpuPxoLD/vom7zDXIfMdO/X/223OPZTiK0gHw7pBb37lT7U0SNdQHql5fKRs0obx9khzFgh4IJMou7mvFBI7LDe1ZJ5MPdvPWt1D40iDfd1Iki54pclfHk0oFzewqPqNR2tl2+kY7JMCsE6tHHML169s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=KBwJk+/a; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="KBwJk+/a"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D83FD1F00A3D;
	Fri, 31 Jul 2026 03:24:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785468279;
	bh=umkrpUBEPc8SIINgE+7qFjJJf8smKomRBsYMgg+ta+g=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=KBwJk+/abdiMqShKcCa8h0Zob0h++kRf7nK4pDJXGXJVlAjSiANwAEQPBBkdGJBTH
	 HQdZhZp5dmUe6pACM8sXL+ARoLx8miEvV6NJf32WjgTNKEqpIbIBQ79OB592ETHxZk
	 3vYQTwykqiwmh/dJac4vA0OtRfFAKZ3FwV6nc8EMAQkvDKXby9FV+US8gi8l1a96ND
	 9C5PdpONJgq/ac2fKI/Us7s2iH1+LiIJZISERbZ/PEx4Py0fsxFCBVyRpcm1eImfb/
	 HlW7N3HK9vUOCxqkSYHjpTL+kWgSpM7SK8DMGOsRzeC0kJ9eCa83WaDwLO0+/Qn5AW
	 bry1aivYghwxw==
From: Bjorn Andersson <andersson@kernel.org>
To: Konrad Dybcio <konradybcio@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
	Raviteja Laggyshetty <raviteja.laggyshetty@oss.qualcomm.com>,
	Imran Shaik <imran.shaik@oss.qualcomm.com>
Cc: Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
	Taniya Das <taniya.das@oss.qualcomm.com>,
	Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>,
	linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] arm64: dts: qcom: talos: Fix cpu6 1094.4MHz OPP frequency typo
Date: Thu, 30 Jul 2026 22:24:12 -0500
Message-ID: <178546826835.316815.15711657746061443702.b4-ty@kernel.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260730-talos-cpu6-opp-fix-v1-1-f4886fdff13f@oss.qualcomm.com>
References: <20260730-talos-cpu6-opp-fix-v1-1-f4886fdff13f@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Thu, 30 Jul 2026 15:45:10 +0530, Imran Shaik wrote:
> opp-1094400000 in cpu6_opp_table has a typo in opp-hz, missing a trailing
> zero. Fix it to resolve the following OPP update failures:
> 
> cpu cpu6: Voltage update failed freq=1094400
> cpu cpu6: failed to update OPP for freq=1094400
> 
> 
> [...]

Applied, thanks!

[1/1] arm64: dts: qcom: talos: Fix cpu6 1094.4MHz OPP frequency typo
      commit: f2eb18c66b98fbfcbab4daef42c04f4becba7d79

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>
