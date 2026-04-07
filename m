Received: from mail-ed1-f52.google.com (mail-ed1-f52.google.com [209.85.208.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 09F5935AC29
	for <devicetree@vger.kernel.org>; Tue,  7 Apr 2026 15:11:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775574686; cv=none; b=J7nbNYG8I8m7x+J4bLqqm4gMgSUDaGup0my/KbcldBMsT0Ska2jVx2FZzEHCGOV74LZZdR/S+cWPhjuWwuQ2mgj6ZZycvE/DWK/iuapG506df2iwFBcMQ9qJb2NWsyubuRjON2ts9AUiN+g5zqaCdLGOunpfxGAlMJxYKqKaX2k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775574686; c=relaxed/simple;
	bh=lqy09Kbj3O0yY7bdWaeGADHmmTFPdpTQhu87yGhEEm4=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=NmRXXmK0ZjweF5jCPn/8/O5bWkj0FyQB7ztrqh83Vah9DI0yQeCO0rjT+6OyFRa7lnrokifEV9WLiM+zW1VnuJtCd6kEMSjZlfiUvlzq/INy0KMXCckojFylHdGeo5FNsVuc3hRAKHNCgo7yb228A/FawZSdJBpOtjUFPIJvPJA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fairphone.com; spf=pass smtp.mailfrom=fairphone.com; dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b=pLYnKQY4; arc=none smtp.client-ip=209.85.208.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fairphone.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fairphone.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b="pLYnKQY4"
Received: by mail-ed1-f52.google.com with SMTP id 4fb4d7f45d1cf-66e8cc747d8so4193956a12.1
        for <devicetree@vger.kernel.org>; Tue, 07 Apr 2026 08:11:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair; t=1775574683; x=1776179483; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Z8SJTbEuOYF9evENY//TwKuH5EWpBQYR81rCvHlGJIQ=;
        b=pLYnKQY4990byypb+jPCD3xWBqcofEyEeYsfxFDO+VURl7LNMqfoEP3PKVm5X7LRh9
         JVZZKccGi0XQpkOOv6BroI2kBRhatjUf8qk2wDIsg5w/6PCQ48OnnNAgr5YyjoC337vo
         mO8ETurkEpUKQUDNyplMSt9U6NL7s8cyfcjZOGubG2a7qCzuhGvKEIJk2C7q16gho9xX
         BZUEw6bNjuRTVZtWuybtIXACoILmnUEwwTBa4X4tinNC2htQEWsMmQPeUeZMHgqBCGGC
         /pRQlySh7XO/9nbiImz/PlYJQ6vXUrhAF7Dj/lcnk9C/fHlH4z06LiMgNeXaSrxZDU59
         c1aw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775574683; x=1776179483;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Z8SJTbEuOYF9evENY//TwKuH5EWpBQYR81rCvHlGJIQ=;
        b=ir/gUcRpXYvzNHNYTJSB/iJqMf1RF1Il2X53tsauRPOODwH45Lo5kbxnAYGo2GJu3h
         ++rCgMQGfoEt9Gt9cKiYNdNWIKucCFEj/sLIJ6konAVcCH1MyzObw/JwRxP795vheWrl
         MRfH5VzwptmhtQM6BqixO259d4TMYMY++aafupXdJM9YoH5YssCt4+NQUi12Rr9xLjbJ
         TgJnmhXTcH66ROhxOW5W4EaZVLedhgsvrhjld0ki5FfTUrlBI9ZXsXB4uBPZhXKDsGE9
         tw9F/sMoVUtXTJprUqlRll2cCZiGtySJrKTlPzTkJTgM4KWrnjTK1PBo1szWLTb2ihiL
         WJ4w==
X-Forwarded-Encrypted: i=1; AJvYcCVQ20TyWY2bKo6WWWE4vGEWhopuh+ReSsgRR3+EXb6ZiKR5OA68+F+Zejrp/zhFSiK81pnE4Me7+Syk@vger.kernel.org
X-Gm-Message-State: AOJu0Yz9c4InXj/2NUfNap5hlzpbeG7apUpfe2bcMVyi4WrL2ev1ekzh
	2gIOZeVRmgPKM6ZmWZz1NYX0CCyIS0Y8IzLXlxzB6ZjaDPTn7wT5TFhbqmzyJE3kYzFAF2cUHzC
	tBqlZLO4=
X-Gm-Gg: AeBDievauAJRJHBo2f29hTP7YdWnJQOoGnJdX8//Qa94Ma26BiVMD77olOiHn+40rGU
	sovWmrL+KfpLFgoP0sqBLPrdkvkmROz76a3aLpdMMS5ZZvzOjRA0aaXnPYs9dFKMS815+S+67xT
	ZKi5yAnG74LQHadX0oqmU2cjRVI+W4/aNbwELXVblExicukssG87On7ttpV6bTEkrZBF3Y3kyT/
	bTdRqnFoeAZwpCOJaSeYaGqFyeaf3eHBMSkH2b9pFUPwaNBMrVPVyTx33VeACqA5iqlSYU7F+Jo
	j/cg3iYnoy90LeiXJOdb0ElTipCEUxP2YH+b8jDKGPxO5e20irH8h5FeJQy4bFKgB+TCEDJLk/4
	sBeBQPFrpDptL5BAwiXecO1aYmfx0yLwQheVAXLXhOay7b92mOG7SmLgWrsR6H+3HTVNvBt3XZk
	tsgLD9+aD2FmNaeix1nPeLEO4tPkxvT2/OGFIQkh7t2Xt0k7Ew9/RbgHopRqxHBqVvQUHaD7X7y
	lP59w==
X-Received: by 2002:a05:6402:430f:b0:66e:c7c2:fdbf with SMTP id 4fb4d7f45d1cf-66ec7c2fe80mr4857561a12.22.1775574683352;
        Tue, 07 Apr 2026 08:11:23 -0700 (PDT)
Received: from [172.16.220.101] (144-178-202-139.static.ef-service.nl. [144.178.202.139])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-66e6f10834asm2753326a12.15.2026.04.07.08.11.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Apr 2026 08:11:22 -0700 (PDT)
From: Luca Weiss <luca.weiss@fairphone.com>
Subject: [PATCH v2 0/2] Describe IMEM on Milos
Date: Tue, 07 Apr 2026 17:11:09 +0200
Message-Id: <20260407-milos-imem-v2-0-5084a490340c@fairphone.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/22Oyw6CMBREf4XctTWlNBhZ+R+GRYsXuca22BaCI
 fy75bF0eZKZMzNDQE8YoMpm8DhSIGcTiFMGTafsExk9EoPgouSSF8zQ2wVGBg0rFC+kEPIqSwW
 p0Htsadpk93rnMOgXNnE1HAmPnyGtxD0GWgVkjTOGYpVZnCI7lgSsio5CdP673RvzrfHvyZgzz
 qSQErWWF55fbq0i33fO4jnJoV6W5QfcU+CF6wAAAA==
X-Change-ID: 20260403-milos-imem-3a034224946a
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>
Cc: ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org, 
 linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Luca Weiss <luca.weiss@fairphone.com>
X-Mailer: b4 0.15.1
X-Developer-Signature: v=1; a=ed25519-sha256; t=1775574682; l=726;
 i=luca.weiss@fairphone.com; s=20250611; h=from:subject:message-id;
 bh=lqy09Kbj3O0yY7bdWaeGADHmmTFPdpTQhu87yGhEEm4=;
 b=t8ws3HTAXyiAvzcnuJZO0pMo5EnFg9ixXGNLiV3mKbIx6VrCOeei/HrOt1so0kG4xP8sVq5th
 mJ4nKteG69fA4vCNYdvSfXyfeKsdgwFKv0bLmM07dUzEHmHv0oSUalh
X-Developer-Key: i=luca.weiss@fairphone.com; a=ed25519;
 pk=O1aw+AAust5lEmgrNJ1Bs7PTY0fEsJm+mdkjExA69q8=

Add a compatible and describe the IMEM for the Milos SoC.

Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
---
Changes in v2:
- Use mmio-sram for describing IMEM
- Link to v1: https://patch.msgid.link/20260403-milos-imem-v1-0-4244ebb47017@fairphone.com

---
Luca Weiss (2):
      dt-bindings: sram: Document qcom,milos-imem
      arm64: dts: qcom: milos: Add IMEM node

 Documentation/devicetree/bindings/sram/sram.yaml |  1 +
 arch/arm64/boot/dts/qcom/milos.dtsi              | 20 ++++++++++++++++++++
 2 files changed, 21 insertions(+)
---
base-commit: 83acad05dee54a5cff0c98dd7962e55d4c6b145a
change-id: 20260403-milos-imem-3a034224946a

Best regards,
--  
Luca Weiss <luca.weiss@fairphone.com>

