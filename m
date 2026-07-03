Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D2C8B2EA732
	for <devicetree@vger.kernel.org>; Fri,  3 Jul 2026 15:51:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783093921; cv=none; b=qYBhEKUj0KlHGGGuzPw45QHuRLk/cMFmm20M68QT2K6K47mnktuApteImjBsZD9jn0QNngZZ6r19uPj3B6+Rlr4NUdlXI3aCHk81hx44ebSHXKLv1Ok2+Y982MRD9yU9TL+tOeTbBInxJ2Og/lF6ZSpcKwozdDZ05Q5BYJaNfK8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783093921; c=relaxed/simple;
	bh=lMEezlRl7UB8pNkOdE/LvPfi73YIs9Z7Z/E7bHKc93A=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=GDzEdHjXPliEjb3MjbfTiI1/trDH7Jx4JHRc9XRe4n8lV5uBdkY5JRv8czaYt7R8HRSicRJlTON0GKCgKRzFrkujSoYAJs6u9sPa1nyHJL89Z3jqADvoxx6OEVOMyJ5Kh4Q2fKlYZ4UrNF4xGDz5oawQOTL8hTlrRObb2BnYx5g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=tb2kYVKA; arc=none smtp.client-ip=209.85.128.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="tb2kYVKA"
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-493ce08a75bso2665115e9.1
        for <devicetree@vger.kernel.org>; Fri, 03 Jul 2026 08:51:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1783093917; x=1783698717; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=YBk6Poj1k6/y0ZxnA9P27hj+o9UIvkcLF1wC8BW5Ufg=;
        b=tb2kYVKAQADV56MR/OIaUCxvM+XBMsohaN3Qi5BHhbApXY9ztgRj3a5enr2MY18pa1
         mx8sSvLAu7KTQViy70BAPUmnQQ9CX/aEBZVuzFyZbSddp60l1bowxx3qT0Ss2v2g474N
         MsRTJ8kntU1VC1DHlNccC2h4wiHF04TGwiDcJV9xH10ly4C7ReEHfsf8I/U0sDkPa49H
         z+QTKsiBJ0VuGjiY+bp5xWZiu1Ep0W0f9qvWuW3ZXLUKiXbofUGCLn4aSQZ6e2I0Qzk8
         GBSS8C73N9cm4rxV8/9Fj+8Ml2git9O+CiUVyNHhBJyaJbergW5kglE1HQnGuZo9/5Qb
         X8VQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783093917; x=1783698717;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=YBk6Poj1k6/y0ZxnA9P27hj+o9UIvkcLF1wC8BW5Ufg=;
        b=H7WQwbq7bZqP5ZMSk+rYEhulKAu1CWXxktvAO6m0HFHau1QXiXlbPZmOkORAee7rxt
         Us3K/L+93CaA9HF9tVcvYcA+2OnEDQ47v0ncvd0dxZ8x++J0TW/0eoejtKcEVcoDPOpt
         3pjqx3u5HiBL5f8PIktAjI2rzgpdAhZK8kzaPI+CWKCSWBwyXeLx6YR7UzTRznbgcOI3
         MHpFpU72nF7/+lNONpxm3DL+JimQNMJysh0KVwnTkg39sJjXUFcE0Eaugg9o5u2Tk2Nf
         6JPKAS0s+snQjGPMn9DHo8JqrpbiG+O/RAIft9nPB3wwN1fMLNm32yZTCJKUayL7p490
         uLjQ==
X-Forwarded-Encrypted: i=1; AFNElJ+18u034dQAdHwl10h17D01GUfTHD62jr0MpQNKtLOA37wmR4RMl/IgL4PegPvNHNohgW+y3aWcK6mK@vger.kernel.org
X-Gm-Message-State: AOJu0YxClviFyOCTThHfECYddKt7yYrgo+Ty6N9aOsM5/fwLw38+PGvJ
	44XV+D/tF6AahxDL0eNyiQjpK9sGPneC4j5zp4h82sbpW13rU4IxNqIMFYtB12jdFD0=
X-Gm-Gg: AfdE7cm/CEb+0g22GPOFYN/4YJo2d7yGBL9djp2Nzaf2WUQ159fcY7JAAthIvs33VPU
	TfD3KI/pwC5ww6kW71OGrxovh2xY4TbRlPinrimjF6d9SODWmGLEYxwn75Zp2fWuTsfXhccJcc+
	dJZ4Kd1y2fej0/w3M50Dh8C1kUCanb++jqdTa10izuyoJjqhsXbKTXiRMFz88coxwR/aNykDPVF
	Dl1uEi/EubVJJqb3PveeegEAjlvsjeMC2CU22WbtxzesDZZB/k6HuQvk7Q70RAHZJmajbg5XJ3n
	czDJgzN+qZ/+8XNUmCJI/dxUH7o2CE2QgwrLA2Npkpq4Q5HSJWZAQhLJRnd7fTDX9vPvaymDGNV
	h+kaQhpSVGfHRiHmWquC+oo14vgdwkzR3f248AqSRx8fRWnRov3OIahYk2A2WZdTimESrCGymYQ
	ZMWz5TCA==
X-Received: by 2002:a05:600c:49a6:b0:493:cb96:7658 with SMTP id 5b1f17b1804b1-493d0f097c1mr3391475e9.2.1783093917050;
        Fri, 03 Jul 2026 08:51:57 -0700 (PDT)
Received: from [127.0.0.1] ([78.152.220.181])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-493c63ba97csm141294655e9.12.2026.07.03.08.51.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 Jul 2026 08:51:56 -0700 (PDT)
From: "Bryan O'Donoghue" <bryan.odonoghue@linaro.org>
X-Google-Original-From: Bryan O'Donoghue <bod@kernel.org>
Date: Fri, 03 Jul 2026 16:51:50 +0100
Subject: [PATCH 6/7] media: qcom: camss: Switch on ICP and BPS as make
 options
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260703-qcom-laptops-v6-18-rc4-camss-icp-bps-ipe-icp-boots-stats-b4-v1-6-595df9e67790@kernel.org>
References: <20260703-qcom-laptops-v6-18-rc4-camss-icp-bps-ipe-icp-boots-stats-b4-v1-0-595df9e67790@kernel.org>
In-Reply-To: <20260703-qcom-laptops-v6-18-rc4-camss-icp-bps-ipe-icp-boots-stats-b4-v1-0-595df9e67790@kernel.org>
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Robert Foss <rfoss@kernel.org>, 
 Todor Tomov <todor.too@gmail.com>, 
 Bryan O'Donoghue <bryan.odonoghue@linaro.org>, 
 Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-media@vger.kernel.org, 
 Bryan O'Donoghue <bod@kernel.org>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2086; i=bod@kernel.org;
 h=from:subject:message-id; bh=lMEezlRl7UB8pNkOdE/LvPfi73YIs9Z7Z/E7bHKc93A=;
 b=owEBbQKS/ZANAwAKASJxO7Ohjcg6AcsmYgBqR9qUdw/sqL1EwVcyotvmJX4pYXP7e3Hr8wFq/
 Pu2nPDDAK6JAjMEAAEKAB0WIQTmk/sqq6Nt4Rerb7QicTuzoY3IOgUCakfalAAKCRAicTuzoY3I
 Ou9xD/9Pm444dRgXV6l59T2ETWbxdfNgvHfcZ5vMK6lKhmRKBGl65rJ5ire0kOJnY8NZpMZdV4j
 zCrZC/NMjSmNOBsK6IvosAlrvtaE11AlsZMawSv3vYeBrDvHdpsLF77Jt7Uf9Nv5unLGJkUZizS
 63X6pb1RqXqGclzs0xEryDZtb9M2HMdrzr2IuvyIw8EDJwyjhiKwmeRQgZ+wklPfUkgUZSv3V8A
 XxAFcEYpqPmlnzy+3EK7Zz7x98cr3IvP8XPx37+moEYDyYQzvW9NiEFMfQe4Lrul3rWZreFyicG
 +LYdqdBVfqHlvr+3tIdYKxVgMOyiclHWfjqQ+FOIwR5YmWT/U3LACtU+lv3YPsdyk2+KgB4YLv5
 cFpOFnO5HZQd2Ntf/3mANETMWAu9lg6Q8HpsHInal52K9Kz6VMpktn5erYBI3WLVj4jG8BLlF0m
 E42SFUG3XN067HqZNgOxkKghU9EtIEy25HMgjillMs/LTYYO9ldvouiB6Vt0XfSEJHrhlsgsijq
 2GjoxG4A5VB8diCuXV4WSI7fvoyWxXE7QlcUUYRGNa79IJJGJEAfNqp+NctzNxCB+FnBBzhHLAP
 GmWlbberksNQVaxG4HG5J2+7mKi7xhQzVPNObhaHVm3bp8p2HudP7BVFjchyXicVh2NH73hywgM
 1jBmPFw9avz0LmQ==
X-Developer-Key: i=bod@kernel.org; a=openpgp;
 fpr=E693FB2AABA36DE117AB6FB422713BB3A18DC83A

Signed-off-by: Bryan O'Donoghue <bod@kernel.org>
---
 drivers/media/platform/qcom/camss/Kconfig  | 24 ++++++++++++++++++++++++
 drivers/media/platform/qcom/camss/Makefile |  8 ++++++++
 2 files changed, 32 insertions(+)

diff --git a/drivers/media/platform/qcom/camss/Kconfig b/drivers/media/platform/qcom/camss/Kconfig
index 1edc5e5a1829e..d62d5f6b383f8 100644
--- a/drivers/media/platform/qcom/camss/Kconfig
+++ b/drivers/media/platform/qcom/camss/Kconfig
@@ -8,3 +8,27 @@ config VIDEO_QCOM_CAMSS
 	select VIDEOBUF2_DMA_SG
 	select V4L2_FWNODE
 	select PHY_QCOM_MIPI_CSI2
+
+config VIDEO_QCOM_CAMSS_HARD_ISP
+	tristate "Qualcomm CAMSS Hardware ISP (ICP/IPE/BPS)"
+	depends on VIDEO_QCOM_CAMSS
+	depends on QCOM_MDT_LOADER
+	depends on QCOM_SCM
+	depends on VIDEO_DEV
+	select VIDEOBUF2_DMA_CONTIG
+	select V4L2_MEM2MEM_DEV
+	help
+	  Enable support for the hardware ISP found in Qualcomm camera
+	  subsystems on SoCs like X1E80100. This includes:
+
+	  - ICP (Image Control Processor): Tensilica LX7 that runs
+	    camera firmware and provides HFI interface
+	  - IPE (Image Processing Engine): V4L2 m2m device for noise
+	    reduction, sharpening, and scaling
+	  - BPS (Bayer Processing Segment): V4L2 m2m device for
+	    demosaicing raw Bayer data
+
+	  If unsure, say N.
+
+	  To compile this as modules, choose M here. The modules will
+	  be called camss-icp, camss-ipe, and camss-bps, respecitvely.
diff --git a/drivers/media/platform/qcom/camss/Makefile b/drivers/media/platform/qcom/camss/Makefile
index 5e349b4915130..940af23da5675 100644
--- a/drivers/media/platform/qcom/camss/Makefile
+++ b/drivers/media/platform/qcom/camss/Makefile
@@ -29,3 +29,11 @@ qcom-camss-objs += \
 		camss-format.o \
 
 obj-$(CONFIG_VIDEO_QCOM_CAMSS) += qcom-camss.o
+
+qcom-camss-icp-objs += camss-icp.o \
+		       camss-icp-hfi.o
+obj-$(CONFIG_VIDEO_QCOM_CAMSS_HARD_ISP) += qcom-camss-icp.o
+
+qcom-camss-bps-objs += camss-bps.o \
+		       camss-bps-cmd.o
+obj-$(CONFIG_VIDEO_QCOM_CAMSS_HARD_ISP) += qcom-camss-bps.o

-- 
2.54.0

