Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.53
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792673493;
	b=3tNoWaQjoLqwcU3aW610oOqi6niOQKb7iTkiQ06oVJFCDi2SGfpS2U+2orUfUb4kirty
	 eqr2OkQZGQyAzh4boc1uWG4H7Gn3difmrJuK3GUMWyA5UNynKg6GV/KHz2Yn+j5FoRG9w
	 EhsIu6WiiYUaPp5ykCE+jPfrF9MLleFYW3FlI6WU1vFIvMYmlOdHcNSqa/UJkDr1O4Ydx
	 xj5Upwim2UYOnWWfj+qtg2vOCGViGykNiXNqXmqriZJvmhgpCdHvg1CAybkfl2yYLrSGb
	 9hmCGFZUvh6XRTJYgu+2JZEW9fJUVzHM5gv5uzpk6Dbl8ZjnupqF6dxU+MA3mjKf8Mg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792673493;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer;
	bh=hNm/9g8tvXvdrBfPLA0jc0/PXVgX5xc+si2+Vq6b1jY=;
	b=ARGdpOkM0HQNFeVvC2h+gCjIEZemnIn06Wp3GDSfTyoN+T61u35EDKup8Y0Vcwyb4PqZ
	 5blWqLXzWQjAo6FvdFANAEZ+bu1ui/DtfY68QhmdN2T0Tiscy0S9fC9aB4RTAEhy5wWEt
	 8HxjCpL1u0wLjNbqBrnd0K4x9xCXPXgA7PnR6MTIM1UHbz0NPaYf9/EKe9WVzTMFiQWDK
	 GF62G9zY2GLCgmBKCvsWrPHBtEqhNn/+zj4JTR/F1enk716921PZMH3Agjh4x+rRrm7Xt
	 js9DG1JWvDxLXTNI0NDLUn0BUSimu1s7vBkAcMJgF6v8HfW9oSJhezm/Mf9y++gqTyw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=E1w25YHn;
	arc=none smtp.remote-ip=209.85.128.53
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 59FA6606A32D
	for <devicetree@vger.kernel.org>; Thu, 22 Oct 2026 12:51:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 59FA6606A32D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=E1w25YHn
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-4a20bde60a0so3783105e9.3
        for <devicetree@vger.kernel.org>; Thu, 22 Oct 2026 05:51:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792673492; x=1793278292; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=hNm/9g8tvXvdrBfPLA0jc0/PXVgX5xc+si2+Vq6b1jY=;
        b=E1w25YHny1AJRGVNYW78qTt8QgfUcTbK1RntrWXZukPC77/wsdZDvJi9GZdjZWf3jE
         OBz+gO8vt6Bh4LEyLm0FrSG504PUUpaOzxSSmsh46jSmy8XnSO3InWEMfkO1S5z0ppno
         7uMiDLVGpHo1QAnuyrw7330CPAycwzBfw49FlzAxESOtRvthkG8mHhofsRHPjGVGUm3G
         UfbNIVjgvaq2kF49mzHU7gVufhIqIS4Jg68Rd5n5yclLKINTiX+rpKWMksglpu/u98FP
         AA1Eq/I/dBlJN0y2sqvLmwEUchoQtVRrEkVg/nRDNerg1mAkKA2v5VQJjw/CgJyTyUQC
         Ge3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792673492; x=1793278292;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=hNm/9g8tvXvdrBfPLA0jc0/PXVgX5xc+si2+Vq6b1jY=;
        b=l1HO9UdnViKXjJPT+I7PFx/c2xDK7WIntzOfmOw+i+RVOsFZE8j6bn3Ag7w70QpLsy
         ZaXnRLJ0aemJcR1KgT5WDF0q0MqqtNueB7ygTljrdaauk5KN6bsY0JXkyg90i522OX87
         m/tY4Bn3U4lojnWrKI17C/ZE+4PPOJ3Ch+iwvSZqUGhUA1Ox7h/FdB1RT2rFiAzWl37Q
         6dj41RCXNVQD+httPKorVyIaxiyDGRpRTVEsSpMzWsQpO6y3BGaGtmt4BRthFKPcdL0U
         CZgRyriGIEoImlMrGXRBiyV2wSjQILYMyL5WpfklkDOLUdFcLN8MDQMAMSHmnZFoeOxY
         7wxA==
X-Forwarded-Encrypted: i=1; AKwUvBxrYgFutRQnotlqrGsWTJ6xUeKNd/pw4wIG3Vo6IWXFm4uea+reHCvs6+sm0j+rvnnOEqgmzW6geKg3@vger.kernel.org
X-Gm-Message-State: AFq9FYJPlu3U0v8MHjwaF2RjsiaB/FD06C2PDHzEsKbPsP7OEfCrYXXY
	DY96R8aYlvFRPJzWPlUgx3CYiUI7lRRsvBNwvmKBLuSWoEe74u3L3R20
X-Gm-Gg: AYBFou1HlfixzrtDUz3pzo9q+y1p+8bI0xUvXhFYalqhpcgNJFxxyHjylt+O2HVQb9o
	3yDsNVI3+0m4P1cvuAArJ/0wTGbjsEpdXaA9AtTXQLwFfnn+heaRm/D92s65p4UhYsL2Pk9yfwy
	skbfeBSg9GZ6QskYLgBviVYqT5waWEJhj44nX4wnPlkhQVhZ8Cx36HM0IFU+DENwY6jv7izxmFQ
	gB7T80MYJ+VIZiZEFIe11UWdj4fvdMSranOv/hFG1IHIqlCREXI+9glH+Y2vaSQZwZmPeRzk8mE
	RU3w58TDL7HWXnz9BfwWxVVFE1w64GVq/iVDOdVR7A4QwhG4tKVGvrV+sa+fu0akZfiNy3s3psS
	j0iF6jDMks+ANNMIyYJDuK00eCP7JEPHMG8vCDsGeT8ChmLwcJUKun64dxyr/eV/jTjLcFA2Spn
	GnhH069h7I+/v+b7M/Q83pqxF0/AH6oufx5qrRY/SUgTJ0/xkutA8zX/OUozvHHQkB9n1k55u5h
	P7n1P8VmKGtlBPV7ELCwI9eiN/iX5FGxkYhZtV93COcHfeKgRHxib1PRT67rKM1urRWBbKW/4+l
	fWGYpOsqHnYugykWdeI6HKyTrlo9fYkK1a1ebbh6PEWIeztv4y2AoF4=
X-Received: by 2002:a05:600c:1c2a:b0:4a1:e57b:667c with SMTP id 5b1f17b1804b1-4a1fdd4fe80mr121580035e9.26.1792673491651;
        Thu, 22 Oct 2026 05:51:31 -0700 (PDT)
Received: from ernest.hoecke-nb (248.201.173.83.static.wline.lns.sme.cust.swisscom.ch. [83.173.201.248])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a203a0f243sm64112995e9.5.2026.10.22.05.51.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Oct 2026 05:51:31 -0700 (PDT)
From: Ernest Van Hoecke <ernestvanhoecke@gmail.com>
Date: Thu, 22 Oct 2026 14:51:07 +0200
Subject: [PATCH v2 3/5] arm64: dts: freescale: imx8-apalis: Add NAU8822
 Bridge Tied Load
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261022-imx-nau8822-btl-v2-3-b4221ed43650@toradex.com>
References: <20261022-imx-nau8822-btl-v2-0-b4221ed43650@toradex.com>
In-Reply-To: <20261022-imx-nau8822-btl-v2-0-b4221ed43650@toradex.com>
To: Frank Li <Frank.Li@nxp.com>, Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Ernest Van Hoecke <ernest.vanhoecke@toradex.com>
X-Mailer: b4 0.13.0

From: Ernest Van Hoecke <ernest.vanhoecke@toradex.com>

The NAU8822 on the Apalis Evaluation Board V1.2 is labelled nau8822_1a,
like on the Verdin Development Board, and can use the same Bridge Tied
Load (BTL) overlay.

Combine the overlay with the Apalis iMX8QM V1.1 on Evaluation Board
V1.2 device tree to provide a ready-to-use DTB, and mention the board in
the overlay description. The overlay supports both Apalis iMX8QM and
iMX8QP modules.

Signed-off-by: Ernest Van Hoecke <ernest.vanhoecke@toradex.com>
---
 arch/arm64/boot/dts/freescale/Makefile                 | 3 +++
 arch/arm64/boot/dts/freescale/imx-tdx-nau8822-btl.dtso | 5 +++--
 2 files changed, 6 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/boot/dts/freescale/Makefile b/arch/arm64/boot/dts/freescale/Makefile
index 3821e3f16210..0b8f497c5c6e 100644
--- a/arch/arm64/boot/dts/freescale/Makefile
+++ b/arch/arm64/boot/dts/freescale/Makefile
@@ -810,12 +810,15 @@ dtb-$(CONFIG_ARCH_MXC) += imx8qm-apalis-eval-v1.2.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx8qm-apalis-ixora-v1.1.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx8qm-apalis-v1.1-eval.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx8qm-apalis-v1.1-eval-v1.2.dtb
+dtb-$(CONFIG_ARCH_MXC) += imx8qm-apalis-v1.1-eval-v1.2-nau8822-btl.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx8qm-apalis-v1.1-ixora-v1.1.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx8qm-apalis-v1.1-ixora-v1.2.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx8qm-mek.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx8qm-tqma8qm-mba8x.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx8qm-var-som-symphony.dtb
 
+imx8qm-apalis-v1.1-eval-v1.2-nau8822-btl-dtbs := imx8qm-apalis-v1.1-eval-v1.2.dtb imx-tdx-nau8822-btl.dtbo
+
 imx8qm-mek-ov5640-csi0-dtbs := imx8qm-mek.dtb imx8qm-mek-ov5640-csi0.dtbo
 dtb-${CONFIG_ARCH_MXC} += imx8qm-mek-ov5640-csi0.dtb
 imx8qm-mek-ov5640-csi1-dtbs := imx8qm-mek.dtb imx8qm-mek-ov5640-csi1.dtbo
diff --git a/arch/arm64/boot/dts/freescale/imx-tdx-nau8822-btl.dtso b/arch/arm64/boot/dts/freescale/imx-tdx-nau8822-btl.dtso
index e4b662519a6b..cdbe7bb1ba90 100644
--- a/arch/arm64/boot/dts/freescale/imx-tdx-nau8822-btl.dtso
+++ b/arch/arm64/boot/dts/freescale/imx-tdx-nau8822-btl.dtso
@@ -2,8 +2,9 @@
 /*
  * Copyright (c) Toradex
  *
- * Enable Bridge Tied Load (BTL) speaker mode on the Verdin Development Board,
- * combining the two loudspeaker outputs for higher output power.
+ * Enable Bridge Tied Load (BTL) speaker mode on the Verdin Development Board
+ * and the Apalis Evaluation Board V1.2, combining the two loudspeaker outputs
+ * for higher output power.
  */
 
 /dts-v1/;

-- 
2.43.0

