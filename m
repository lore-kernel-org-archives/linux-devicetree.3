Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.44
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794308360;
	b=yWrumpF9dyBfm9bxJ9E1VwJ3C70rSE5EPaD2pswuJjZ2YpRDS/sIg/Aa7iHLQhTWmzwO
	 SfqzU3Tzn9v7DZc4EhhJI3s3JTnl6LwWuCOFfWQMrDuJL0O2rx+VcsjUMGDV/EHMIGA95
	 RxOjx3nuumPUiKwRsdkNYRZTWe69j/psL23T88QxmxLb+PoOhbuAEJ6zsv26rKH08i2L/
	 DeBqWZ0pnyOaApG3du+44iQlhyokC4NmHTUHpKJoE2fd9equNKd9WRvCxKsHmjRqHmZZt
	 r0LPLgeIqcU9yzLyfzGGf9fMN/NJHIRAk5eEYMgf2OvfTBR4zoh8zxBr6oLcGY7wuRQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794308360;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:Date:Subject:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:
	 References:In-Reply-To:To:Cc:X-Mailer:X-Developer-Signature:
	 X-Developer-Key;
	bh=IjKNZxEaQEGxyYCtiVf+mg2UfD7EYalaSDJP9l6NSp8=;
	b=aOnRlKhNxIKlgxh6It80mA933/0wH82KR1RNHIA8RggbhOifIaxdAciCteNE+M1eAG6x
	 IgI2c0+ZMK5QwCAF9AGlfJOmno23dLas9ibb3p5tntAp6IUNLTgcSGmGGj6cF1nsruNEP
	 3r5wvmr+Cqywhz7EFRm01Y9DDXg8WmOpfpyACXscnZvELRZjP2zy78DjUd61fmQfm2U9l
	 /8hDlPbUT66c4zNXvW3UVWcsWTQeo4OeoRTEmeYCny0auc42FszYR8Ep6X9LObK59b1lt
	 BVUM5LUFO/3V8BU3aPopXbI8X+0dijixCxJonLKwxQNJlGnzvsaHiaNWogvlh/DXP8Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=pgRceA7o;
	arc=none smtp.remote-ip=209.85.221.44
Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A8BF9606A334
	for <devicetree@vger.kernel.org>; Tue, 10 Nov 2026 10:59:19 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A8BF9606A334
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=pgRceA7o
Received: by mail-wr1-f44.google.com with SMTP id ffacd0b85a97d-48e10a70540so1125749f8f.1
        for <devicetree@vger.kernel.org>; Tue, 10 Nov 2026 02:59:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794308358; x=1794913158; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=IjKNZxEaQEGxyYCtiVf+mg2UfD7EYalaSDJP9l6NSp8=;
        b=pgRceA7o5OESaKQnru6wYq3FjMC/Ed41tcOp6bsZ1kapycQC7S+U/CkAjSQvN5wbc3
         dRQwjR2Y+/V90wBCLl7HRFS/yswDRTYAIwraRhUjhpHD/yAOPPu7IQcTM86D4+7Qxt44
         d8I8aSb4DlGspytXKpDsveCCcuJc1CqYS+jaXNLzpXYlZbqehzqmhTN/aTsmeLOdS0og
         +h1pT6aWTiUpn+7BbLJBkBjojCp6CNRTCBNTBu38LQdqG/AM1lALwTloZHsumbSP/ADn
         sYUEiPNVPDhYaVMR5Nuv9yYkPKCyFKekWP9Qi22zP+5TRo41jvFj80ytPyixT8nqusJE
         4NPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794308358; x=1794913158;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=IjKNZxEaQEGxyYCtiVf+mg2UfD7EYalaSDJP9l6NSp8=;
        b=EwYbwwo4SGeUNoGSdiuuSwigWE+kKk3j9Ros3HDS16oS+MiI/AqljsPFJ/W308Is2l
         ko9+WuigOWuckC2O798GokJai4WAZz2TdXrCaBJYRELV60z7s2i4j5xjn/WOKo0z/NKg
         /QU16G9gKDTiODuIkOwddT6FeaInpPtk5y7m+uE9ROEYh29o34ga2PvSSifgQvGER6cp
         yfOL06EI1U0ETpH7EZIZMxVo8KfHse2ubfBSiSxv4uMaywCwVHDBtHfpXc0qhvgmxoKv
         z+jsSokyFTw0J66GVhbKfYcACZ+iY4lpOK12ZbjjH/1tz11Li2efzFc51u6AbIz6Ke7O
         KmHQ==
X-Gm-Message-State: APuU4Z90OZ1O4c1+syab9ExNeU8WY7eZS6x4VNNCF3O4XLWVY3F1gNoI
	jofoM2mX7ly+Ybkw7TcvGv5jGVTJJ7iWoOJZO1lerAUB2btKGXTRTZjACeQfCTfN
X-Gm-Gg: AYBFou1TxPTjVHlxCHi8G+k3PuaAgGREbAxw+PUOXTgNOdLK1O65oNGIbCtjsHUWcSw
	WM0T+IQ5fKN13gW4w4/7Pen8PP3j93v8YGFCdoF9Uv9EWwQEgFshm1Y2DmboH1/R9mGf0lJUXBA
	2ojbJLFM+LVdyUlHGl6CtKBgygXKfhq18W6IXAUFs8zOr+ViZZSVRztfYFI5gZYxL476nF4i0va
	twUTAKcPKXoAgRIQYQuhBsydqaT3n/5ppKXWC8ZkOP/5WtAqXMXksb2vMR2MFvKfm16ecYijVV5
	rfzNSfFslkYhK/a601C1HN5RYJ3ZKl3F2DWaFnvB1SaZYq8js3ywi+YgRlfu2Yww9MAJPddoBhr
	fxrwidVhuUkp/HJbtwrvwUuqp2IfoftLHnCL3y9GGbTR/QECdiDlKr2qH+WurMeGRgg+vGfEZMT
	i2njyFxYbyYIWBiuWM+b82QqCrNU7ApZr1tizfnM6y6p1X7fIPFbu5VaeCUq90qHBVNud46ch1+
	jFrUbi+2xMwhsw0/DQv6Tb+9KqjwFPz03Maeq/OIg2jSbqDgyvqP2Y7ezqD7dGbPrFkZTUMmyED
	QbJRIA5yRjA1TgoMiRw5GMc0rt6mM3/efW7EKhARiTagh7NfYvyRvYFacsc7PJYF0LkKYiHBUIt
	qhQEB8B+nz5TYXg2qxltDoQFXRp9fVqoHFHcwSn50BGS9GMkDYx4=
X-Received: by 2002:a05:6000:993:b0:48f:d7cd:a5ac with SMTP id ffacd0b85a97d-49828d36961mr4278277f8f.0.1794308357856;
        Tue, 10 Nov 2026 02:59:17 -0800 (PST)
Received: from [10.0.1.33] (248.201.173.83.static.wline.lns.sme.cust.swisscom.ch. [83.173.201.248])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4988bdef64dsm2933551f8f.20.2026.11.10.02.59.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Nov 2026 02:59:17 -0800 (PST)
From: Antoine Gouby <antoine.gouby@gmail.com>
Date: Tue, 10 Nov 2026 11:59:13 +0100
Subject: [PATCH v2 1/6] ARM: dts: imx: Add generic HDMI overlay
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
Message-Id: <20261110-colibri-imx6-overlays-v2-1-9776c186d953@toradex.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1482;
 i=antoine.gouby@toradex.com; h=from:subject:message-id;
 bh=a0eIgXbh+uCZSw0edG05JIfZzW/ZFfMGZsGT3FOJLus=;
 b=owGbwMvMwCWm0rPo7MxLN2YynlZLYsj69JO5ZeElmX8df7/dmxifWr//6Lsm0bVnWB2FxEQN2
 O5nTloQ3lHKwiDGxSArpsiS8URVkE8hRNaDozkZZg4rE8gQBi5OAZhIUgTD/8oXOWsjGTq7l/xe
 kXR1wvdvcSYnH1+OuJzEnKAm/Xsaw2aGf8YRlW1fFnkVs0wJuW+8XKrc5c+fc7KbZ8QtOHfHIqy
 slwEA
X-Developer-Key: i=antoine.gouby@toradex.com; a=openpgp;
 fpr=68E425110E20541D48088363248CA2CD99D2D899

From: Antoine Gouby <antoine.gouby@toradex.com>

Add a generic device tree overlay that enables the HDMI transmitter on
i.MX6QDL SoCs, to be shared by the boards where enabling the &hdmi node
is the only change required for the HDMI output.

Suggested-by: Frank Li <Frank.Li@nxp.com>
Signed-off-by: Antoine Gouby <antoine.gouby@toradex.com>
---
 arch/arm/boot/dts/nxp/imx/Makefile      |  1 +
 arch/arm/boot/dts/nxp/imx/imx-hdmi.dtso | 14 ++++++++++++++
 2 files changed, 15 insertions(+)

diff --git a/arch/arm/boot/dts/nxp/imx/Makefile b/arch/arm/boot/dts/nxp/imx/Makefile
index a0ad7ee583e8..d03a8d2845e9 100644
--- a/arch/arm/boot/dts/nxp/imx/Makefile
+++ b/arch/arm/boot/dts/nxp/imx/Makefile
@@ -85,6 +85,7 @@ imx6qdl-dhcom-picoitx-overlay-626-100-x2-ch101olhlwh-dtbs := \
 	imx6qdl-dhcom-picoitx-overlay-626-100-x2-ch101olhlwh.dtbo
 
 dtb-$(CONFIG_SOC_IMX6Q) += \
+	imx-hdmi.dtbo \
 	imx6dl-alti6p.dtb \
 	imx6dl-apf6dev.dtb \
 	imx6dl-aristainetos_4.dtb \
diff --git a/arch/arm/boot/dts/nxp/imx/imx-hdmi.dtso b/arch/arm/boot/dts/nxp/imx/imx-hdmi.dtso
new file mode 100644
index 000000000000..efb7dd5c16ae
--- /dev/null
+++ b/arch/arm/boot/dts/nxp/imx/imx-hdmi.dtso
@@ -0,0 +1,14 @@
+// SPDX-License-Identifier: GPL-2.0-only OR MIT
+/*
+ * Copyright (c) Toradex
+ *
+ * Generic overlay enabling the HDMI transmitter of i.MX6QDL SoCs,
+ * for boards where no other change is needed to enable HDMI output.
+ */
+
+/dts-v1/;
+/plugin/;
+
+&hdmi {
+	status = "okay";
+};

-- 
2.55.0

