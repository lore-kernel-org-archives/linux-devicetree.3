Received: from mail-qk2-f43.google.com (mail-qk2-f43.google.com [74.125.230.235])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9BFD537E5C3
	for <devicetree@vger.kernel.org>; Tue, 22 Sep 2026 01:58:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.230.235
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790042286; cv=none; b=fomaUs9hXPI74ACKoAz2192JfCGUMAYyBrJj+55YbSNnNEGMXnOHzWAPU/Y+9aW17P5+UieQppS9D1sKfhKHfwCoRJETRwa4KWyt1q4geKiu4tdU/iFRNCH+Uf1f7wA2GnisD9pRGlmPpWpzRKSk3hUxzfOpk47KEsJSCXRZkGk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790042286; c=relaxed/simple;
	bh=MjxnF6HOxulAnMhkS0+u3uuOjdak2QW6orbfxS/AkP4=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=mYf7QlA4+4/P5G1IBovr2MgaeG8nO0Hn38lx7WQb4P10jTQaZQx9WOBpr++dmgv4zQysCeHr1I1FW+EySvUUoZ8An/coKoLHcpUPR15c6DVS0HiBZQ+aMwNoJ2gxHuQU9vFLHKcYxpGx7dK1dkVadxQEiJtg4U7pLOWNo3OAlYc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=i7SUw4np; arc=none smtp.client-ip=74.125.230.235
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="i7SUw4np"
Received: by mail-qk2-f43.google.com with SMTP id d75a77b69052e-52fb76ef19aso38011661cf.2
        for <devicetree@vger.kernel.org>; Mon, 21 Sep 2026 18:58:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790042283; x=1790647083; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=PaaIrl1ZxcY9+TLKyKoWNojTWFhfz/qoJwuiatwG6To=;
        b=i7SUw4npUdyTskTx2DB5yhkVcLgI8tTW7SW0MMDygDHnFrxf3pi4MSHRNTSO37357/
         goywr3Hbj6MlhwwTPHX1sWetEGfvNGCHB7UrRkI0El09H8YBXL93Lydrmnr+s6DQLOjb
         gc2h0AhQZwIWU0s61cpuCXXIPJo/tyQXn0kzY156DbBKg/SVfkwYohTlwCTyQ0TKhjUB
         jMWv8wP+ndtnWNUrweCgrQ82uN8ppktCcIls9lY22uF1eIUjRl7k2UZCN+dggqwQaiPG
         T25cn5KEUwyvp7p823GCoAjvHvWU5k4cQOb7AWFPLbntkMZByb4xU1ZuGN1Tp2EZ5WuL
         6+Sg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790042283; x=1790647083;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=PaaIrl1ZxcY9+TLKyKoWNojTWFhfz/qoJwuiatwG6To=;
        b=mlS8BerT0Zzw4AEVnd8GrLZte3OMDvMIa7FhqUDPsCY0VdZB6AV4uJCjR5RQaX4LxA
         TIOPyROcgygkD6SBTFPBJ1qeMSK0VorCMycYthTXiAcvF0pjRhROl7bSwg+SkCC0VGeI
         dSQPL9jf722DbXN3VxlWdy75IIYbDkPsLsmS3oiHy8KmZEEB3M9/rZV+yx946/QOICmV
         0ym7KlkY68gCvXYmLn1znOd16DT00eh1LYG0PR69WH0Q6H6ZRhyV6eey0dPrkl+tGh2l
         ZWCQ72UAJlBWLW3rDFuhH7icPpxmvvxz+CWhSJ7rE+Oa/IvMaC4SUQmqjzlZ8iMIbfwQ
         IRyQ==
X-Forwarded-Encrypted: i=1; AKwUvBwgCh2rPBLHr8gHRB2PYcLMVkvCnexi18eq3qEqvXJobVFZ8l8OpbjIYWkMlVGH6LOIX+GtX/frDLD0@vger.kernel.org
X-Gm-Message-State: AFuF++mgYmwW0QG2o+t7EL2IE4AowMixAdTPw7kDes5KcC0he4yC4GC5
	gIx9F+Sfg6OfasQv4qr9qztQwozr2Z+wijMjUbxa/NNJEZ/CO4ckMfij+TL8dA==
X-Gm-Gg: AYBFou1QsSiLeIX58/7J67IifYGnnZ65fsY8SwBz1tZIpxpgirucVndWGl227kURv5D
	lgnYLbiXg4KaqadiE2tOPz3olF4w2ZmG8ew5jAtdk3DjyPpcZdFCea+ltlW5+7937arbSZT3mFy
	z9F+eXaejLeBUa1O/EJSXME8GOy7xWyzY4OxV7DHCJu3uhcSt8YGHgLZ6hyEzddDJJ+x5R4uIBP
	khAYwuJpE3NJFWgOAnkMZ1kpsl9VeESurf+lkbVmYcYlM2WqBj/eHq/nFGwoUVpJCLZiosMEKSX
	WFN61OjBYSSbMNvN5BpnVVlyUJOLzRinkziV5FWoMlgXyKcdpWdy3N08JON+8VWMDhc2R2ljAh0
	tyQWAw7L3gxiVPF+53J8YI7WL1FVLerOcmPIZVRR0V/rKUFyzXhWbaQc7uGQpaPKqKtfB3KP7yq
	jpbfGNCXmYbSMLAydv//oU14C+CBIPuNgHGHTNz/ogh6oBuLuiWDrmdjXzZyhwCeWjVsE1LkWLb
	g==
X-Received: by 2002:a05:622a:190e:b0:532:9add:50b2 with SMTP id d75a77b69052e-532d8ebe347mr36832061cf.66.1790042283495;
        Mon, 21 Sep 2026 18:58:03 -0700 (PDT)
Received: from localhost ([142.181.121.230])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-9140249fcedsm4014716d6.12.2026.09.21.18.58.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Sep 2026 18:58:02 -0700 (PDT)
From: Richard Acayan <mailingradian@gmail.com>
To: Jassi Brar <jassisinghbrar@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Bjorn Andersson <andersson@kernel.org>,
	Mathieu Poirier <mathieu.poirier@linaro.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Abel Vesa <abelvesa@kernel.org>,
	Manivannan Sadhasivam <mani@kernel.org>,
	Andy Gross <agross@kernel.org>,
	linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-remoteproc@vger.kernel.org
Cc: Richard Acayan <mailingradian@gmail.com>
Subject: [PATCH 00/11] ADSP for SDM670 and sound on Google Pixel 3a
Date: Mon, 21 Sep 2026 21:57:50 -0400
Message-ID: <20260922015801.32373-1-mailingradian@gmail.com>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This series adds a user for the SDM660 sound support code [1]. It also
adds the ADSP remoteproc for SDM670.

[1] https://lore.kernel.org/r/20260730174353.108023-1-mailingradian@gmail.com

Richard Acayan (11):
  dt-bindings: soc: qcom,smp2p: add sleepstate support
  dt-bindings: mailbox: qcom: Add SDM670 APCS compatible
  dt-bindings: soc: qcom: aoss: Add compatible for SDM670
  dt-bindings: remoteproc: qcom: adsp: Add SDM670 ADSP compatible
  remoteproc: qcom: pas: Add SDM670 ADSP support
  arm64: dts: qcom: sdm670: add adsp
  arm64: dts: qcom: sdm670-google: enable adsp
  arm64: dts: qcom: sdm670-google: add sound card
  arm64: dts: qcom: pm660l: add analog audio codec
  arm64: dts: qcom: sdm670: add digital audio codec
  arm64: dts: qcom: sdm670-google: configure analog and digital codecs

 .../mailbox/qcom,apcs-kpss-global.yaml        |   1 +
 .../bindings/remoteproc/qcom,adsp.yaml        |   1 +
 .../bindings/soc/qcom/qcom,aoss-qmp.yaml      |   1 +
 .../bindings/soc/qcom/qcom,smp2p.yaml         |   2 +-
 arch/arm64/boot/dts/qcom/pm660l.dtsi          |  40 ++++
 .../boot/dts/qcom/sdm670-google-common.dtsi   | 149 ++++++++++++++
 arch/arm64/boot/dts/qcom/sdm670.dtsi          | 190 ++++++++++++++++++
 drivers/remoteproc/qcom_q6v5_pas.c            |   1 +
 8 files changed, 384 insertions(+), 1 deletion(-)

-- 
2.55.0

