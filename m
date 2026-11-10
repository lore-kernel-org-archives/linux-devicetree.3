Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.49
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794308360;
	b=AD2H/Ut8RULfsUNyj47BNuOSMSs97wfJJtWzLlmcXwgXbQdY2YhhoNq6But1SLQvBm2c
	 qwkHP7mZB16z+OmJAE8qBv8YMn3yBSkRLlm6NtJFsJ9DHAg03mzC5CItKJpxY8XFyQyup
	 lNmr2s/aFAFVRa7zoC+s70KAcW1tTW0u/UoHHhro4AYsVvWasFwJfxuM+FGHLAlxVE2IU
	 lx0uSiEYEvRlrE8GFAc5aAhGb2/lQZG7tB6ajhppJbwcTC3/hSyAGW3ef9aA7bvq+Sded
	 AVksPWQrl5E0+Cfc6bZz/GgRydaJJ+iD21WIf2VOjlmuEESFQkXOzivIHKD0RnVl9MQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794308360;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:Date:Subject:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:
	 References:In-Reply-To:To:Cc:X-Mailer:X-Developer-Signature:
	 X-Developer-Key;
	bh=yGHrtx5n1eB8ok7Jt62o7lZ8pEvwW6QKVgKkvamRcyA=;
	b=g96pkY9FfkSUj5LiWXLhP/abxXJMCcfK6uW93o48g+EVoV7uMgRqtCW15dY4fU9F0n+j
	 3YW/GtVT2eApPSNTSjE+vELVYGeCaPYmWwgY+HfpGVFi/cmC2QCzH3TrGb6Hzn3YIbFYx
	 DB/vfY7IUd9lv/nRuKIKAfgQRVACDxxGYWRA3CmpaL/AnmU+/jsoqU0YVMS2BSVyzY/+7
	 LipsqIohEKlB3hTYgBlL+Rb9Z+ljZwjVA8ZAd0vQ2fPJ7/lZsuYl+fXm1peg5sqTBejwy
	 GgchAjqVFqBVbNihwt3R7uukms6Rb2SB7JG9BYox7yi7xEKzsnCcwyxghf3XJfgBE8A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=lTmga4Fy;
	arc=none smtp.remote-ip=209.85.221.49
Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 66420606A31C
	for <devicetree@vger.kernel.org>; Tue, 10 Nov 2026 10:59:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 66420606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=lTmga4Fy
Received: by mail-wr1-f49.google.com with SMTP id ffacd0b85a97d-48dfc0421d9so1583017f8f.1
        for <devicetree@vger.kernel.org>; Tue, 10 Nov 2026 02:59:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794308359; x=1794913159; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=yGHrtx5n1eB8ok7Jt62o7lZ8pEvwW6QKVgKkvamRcyA=;
        b=lTmga4Fy7eTigGMleEKBHkLCbqiuAvlDGyTiSr8S5CKWGu0k4ymrnuhMo1bTnE5F+/
         fBHyIKF1bH3IsGbRubPB0xgbkKaBVZIgxcpCzlobZzXmzw2chj30sQ0bbUzRKxlI+sUO
         h9jrYx7gsPIP8/VSEC6jDdL7leqsRttrhkITbtp1XpFuwYS2Ie54BJYuUdPGgiEkVN4w
         huMFWOLnFN4KsKNmJUjzXtp7aTZjJZ5CrSt14Xh2eOaChx4H0xqbWGkNXkVCmPvAmexJ
         EtM2MjYNWWKLenHUaaandzuGIUyJ4xo7VmowVLFvUOVUGyES+2RMW176ZPU+U6HNdNf4
         4qfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794308359; x=1794913159;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=yGHrtx5n1eB8ok7Jt62o7lZ8pEvwW6QKVgKkvamRcyA=;
        b=eNnPMEMxDDZF0tVq6/IK1A0wd1xetq1gO0L9zVErdAoI9SHmZT3NxyohduU92bj/bz
         1aF2vpFFIaJKvXYYK8m94E/85b6TEPoJG4B0XilCI4hA4JRc/94EL17oTkJOYy5cGA6X
         2VDqeK5up0XnuBpSRUaB3OhIC0dY+s68UU82OkceeWO7cSjwCeqOTvLrWYwsBDTEkkEh
         BkKLy1z1lwpx3xR8i0zK5/tOsNvtQ9awsrC1WSHM1yUYf5JNeDVoT3b4MvarRHqDkPw5
         MC1rtTV+gmp+kF/95DNuovP/6EtTxcozC2FXAmZBaT4f9UVzWjx+simZHoZXxribmHOI
         r3xg==
X-Gm-Message-State: APuU4Z8KQ34SKgQujOiBaT2QfDlkvUiwGLRCIB7unZquBXWMWYm7tiko
	SI7Zh/fgre9FrAgwO+wfr24kzEPVaVxrSTiGTjg5AfC24VjGUmbXJBEPtRQecNt2
X-Gm-Gg: AYBFou1MtaCMf1parry9sWALeYq4yVbU8qYMV1CnaJ9cj6IaHXasWhLqCMW6+MVj0mq
	ZgmmXagC9TXBPaCUg3vg4PBxc8aT70X23qqcoEvdS1ocLchR5J68wIzSOJ1BkGrfmSDB5ynxRxX
	eh73CYkm2ZJ47hM/5FbgR30Uf+qq5QUJ9mREvo7gai90/0UvCCqlhTcpbeVCXD8xKNwh3MDb4Nj
	A8DORyx0Xv7qQDzf/AlMFIpu9cTt2B0PUZxnSJKSj59n1RFwytEvAeXQfa0L66qqSXImoWRHGH8
	KWmBmvZyMO9BELTAeXwPraPMAFHHei+mGj/3f4pFHUUGkth4eyu8mf+Wc8qQcw6YjNQnGIITkqu
	HYYMhWCHw16e4yg8a5yfJlANxMUi7jzvSrTknayqhhWuZi9bFDicPl86kmFEY7BMug6iYowHAKI
	OtUFCgblks1MAg67m0kzCWrHYFuZ8vmBL7F2PYpxBUoZM7SwpfNC7BphKKaTCGfErQsooccliLK
	Q8985bO+M3EZb1FpFd8AWwgPd8cfyE60QPzU2kNyQkaaV95LN4PVQUvYXyFDcIjVLOD1YNLOU8W
	i19vKvqERdBKKVXuCKf+UnO7Y2e7b/ELNFAc7XGZlRLzYf6rPY5+p+knwniTGoRHRKHEl+yUz+5
	ayTlpIHEgTnAxpHGYzCraxDhDOJYV+kwA2RkAV7ryKGsT4skLAMw=
X-Received: by 2002:a05:6000:25f1:b0:491:9fc1:e6c2 with SMTP id ffacd0b85a97d-498318067demr3878592f8f.51.1794308358680;
        Tue, 10 Nov 2026 02:59:18 -0800 (PST)
Received: from [10.0.1.33] (248.201.173.83.static.wline.lns.sme.cust.swisscom.ch. [83.173.201.248])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4988bdef64dsm2933551f8f.20.2026.11.10.02.59.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Nov 2026 02:59:18 -0800 (PST)
From: Antoine Gouby <antoine.gouby@gmail.com>
Date: Tue, 10 Nov 2026 11:59:14 +0100
Subject: [PATCH v2 2/6] ARM: dts: imx6dl-colibri: Add HDMI DTBs
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
Message-Id: <20261110-colibri-imx6-overlays-v2-2-9776c186d953@toradex.com>
References: <20261110-colibri-imx6-overlays-v2-0-9776c186d953@toradex.com>
In-Reply-To: <20261110-colibri-imx6-overlays-v2-0-9776c186d953@toradex.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Frank Li <Frank.Li@nxp.com>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, 
 Francesco Dolcini <francesco.dolcini@toradex.com>
Cc: devicetree@vger.kernel.org, imx@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Antoine Gouby <antoine.gouby@toradex.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=3399;
 i=antoine.gouby@toradex.com; h=from:subject:message-id;
 bh=GHGYqwad2/GX2e2ukD9rodYOQ4ugyd56E1reFr0Fgm8=;
 b=owGbwMvMwCWm0rPo7MxLN2YynlZLYsj69JM57YwY/5OWw3N9bT5oSubGevhsdjy4tI1LkOPaQ
 wvJBUxiHaUsDGJcDLJiiiwZT1QF+RRCZD04mpNh5rAygQxh4OIUgIl8bGH4X+f75cqef15Gzrnf
 na48MY9zdskKWCCp+D3lskzszPRvvAx/Re6HWVxjT55rznBBo/CW/kR2pdtzg98nG09brFqn9aq
 ZBwA=
X-Developer-Key: i=antoine.gouby@toradex.com; a=openpgp;
 fpr=68E425110E20541D48088363248CA2CD99D2D899

From: Antoine Gouby <antoine.gouby@toradex.com>

Combine the generic i.MX HDMI overlay with the Colibri iMX6 carrier
board device trees to provide ready-to-use DTBs with the HDMI output
enabled.

The HDMI interface is not available on the Colibri SODIMM connector, it
is exposed through a dedicated 24-pin FFC connector on the module. The
FFC cable connects either directly to the Colibri Evaluation Board and
Iris carrier boards, which provide their own display output connectors,
or to the Colibri HDMI Adapter, which provides an HDMI connector and can
also be used with carrier boards without a dedicated display FFC
connector, such as Aster.

The DTBs are provided for the various versions of the Aster, Evaluation
Board v3, Iris and Iris v2 carrier boards, including the Colibri iMX6
V1.2 variants.

Link: https://developer.toradex.com/hardware/colibri-som-family/modules/colibri-imx6/
Link: https://developer.toradex.com/hardware/colibri-som-family/add-ons/colibri-hdmi-adapter/
Link: https://developer.toradex.com/hardware/colibri-som-family/carrier-boards/colibri-evaluation-board/
Link: https://developer.toradex.com/hardware/colibri-som-family/carrier-boards/iris-carrier-board/
Signed-off-by: Antoine Gouby <antoine.gouby@toradex.com>
---
 arch/arm/boot/dts/nxp/imx/Makefile | 40 ++++++++++++++++++++++++++++++++++++++
 1 file changed, 40 insertions(+)

diff --git a/arch/arm/boot/dts/nxp/imx/Makefile b/arch/arm/boot/dts/nxp/imx/Makefile
index d03a8d2845e9..c72920658609 100644
--- a/arch/arm/boot/dts/nxp/imx/Makefile
+++ b/arch/arm/boot/dts/nxp/imx/Makefile
@@ -60,6 +60,38 @@ dtb-$(CONFIG_SOC_IMX53) += \
 imx53-qsb-hdmi-dtbs := imx53-qsb.dtb imx53-qsb-hdmi.dtbo
 imx53-qsrb-hdmi-dtbs := imx53-qsrb.dtb imx53-qsb-hdmi.dtbo
 
+imx6dl-colibri-aster-hdmi-dtbs := \
+	imx6dl-colibri-aster.dtb \
+	imx-hdmi.dtbo
+
+imx6dl-colibri-eval-v3-hdmi-dtbs := \
+	imx6dl-colibri-eval-v3.dtb \
+	imx-hdmi.dtbo
+
+imx6dl-colibri-iris-hdmi-dtbs := \
+	imx6dl-colibri-iris.dtb \
+	imx-hdmi.dtbo
+
+imx6dl-colibri-iris-v2-hdmi-dtbs := \
+	imx6dl-colibri-iris-v2.dtb \
+	imx-hdmi.dtbo
+
+imx6dl-colibri-v1.2-aster-hdmi-dtbs := \
+	imx6dl-colibri-v1.2-aster.dtb \
+	imx-hdmi.dtbo
+
+imx6dl-colibri-v1.2-eval-v3-hdmi-dtbs := \
+	imx6dl-colibri-v1.2-eval-v3.dtb \
+	imx-hdmi.dtbo
+
+imx6dl-colibri-v1.2-iris-hdmi-dtbs := \
+	imx6dl-colibri-v1.2-iris.dtb \
+	imx-hdmi.dtbo
+
+imx6dl-colibri-v1.2-iris-v2-hdmi-dtbs := \
+	imx6dl-colibri-v1.2-iris-v2.dtb \
+	imx-hdmi.dtbo
+
 imx6qdl-dhcom-pdk2-overlay-497-200-x12-dtbs := \
 	imx6q-dhcom-pdk2.dtb \
 	imx6qdl-dhcom-pdk2-overlay-497-200-x12.dtbo
@@ -93,13 +125,21 @@ dtb-$(CONFIG_SOC_IMX6Q) += \
 	imx6dl-aristainetos2_4.dtb \
 	imx6dl-aristainetos2_7.dtb \
 	imx6dl-colibri-aster.dtb \
+	imx6dl-colibri-aster-hdmi.dtb \
 	imx6dl-colibri-eval-v3.dtb \
+	imx6dl-colibri-eval-v3-hdmi.dtb \
 	imx6dl-colibri-iris.dtb \
+	imx6dl-colibri-iris-hdmi.dtb \
 	imx6dl-colibri-iris-v2.dtb \
+	imx6dl-colibri-iris-v2-hdmi.dtb \
 	imx6dl-colibri-v1.2-aster.dtb \
+	imx6dl-colibri-v1.2-aster-hdmi.dtb \
 	imx6dl-colibri-v1.2-eval-v3.dtb \
+	imx6dl-colibri-v1.2-eval-v3-hdmi.dtb \
 	imx6dl-colibri-v1.2-iris.dtb \
+	imx6dl-colibri-v1.2-iris-hdmi.dtb \
 	imx6dl-colibri-v1.2-iris-v2.dtb \
+	imx6dl-colibri-v1.2-iris-v2-hdmi.dtb \
 	imx6dl-cubox-i.dtb \
 	imx6dl-cubox-i-emmc-som-v15.dtb \
 	imx6dl-cubox-i-som-v15.dtb \

-- 
2.55.0

