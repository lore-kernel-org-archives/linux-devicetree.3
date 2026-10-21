Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.182
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792586132;
	b=fvPnPdURPHDB+SlPJzS/+DpX+xKBL9eSP29AYdlRHOll5VpiLt1ZYqO3lQTGUYl3vWBe
	 hS1+SIgf9sz0iih8ScPPFsZdyciQDNpKlCdcXhmngCoEV+SmhdjAvFiw8S4ceoeBOtUT3
	 Dd9vjfLBWHMrLLl3pAiPx4H7dF4gqahS4q6fdeSMd4iBOS8isk2HbpiItkuu93kTmf0Dz
	 cHzGykMLar0LtY812LY0Yu+VdLamj9qbZJMUgjNPAzVpRZ8LaQx7ydKNQNmgFPhzcXCK7
	 pRXLz4S8xvCIO0GrNX+QcTHhyXyjwWMqaiYo7br3Z1HgYN3H3caxNr8ttne+0KiX1sQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792586132;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=EYl3M1lNXMEDde5L6u4dnJnpfbfwZtPoUfD3SBMHOns=;
	b=C9Gh5cyWuySVrS+Zj4QZ+/+JQGTO8SfTab4Y8siIE8OUoUn7QkrD+ze3OXZImuMxvkxA
	 X0CRZ+GNfkFNWIItbBZB4b8StXrWEt0QAAbME8rjXwyy4RPAdwY42yMbIKNZpFjIg3Jvi
	 zWzWChM5SAWQOm+PQC/6V2TlHSC2GhEjXE5hO38G2cwpr67+dFQK/GKbFHHBK9JeYfMaK
	 7IUdb/DIZUvIAhHKMX8R2Wk/4EtQMUJYvCJX3dXFroPdpNlfF6s/FoleFp9wlb5NzPv61
	 ihgHHUngEpL3y08RnQV+S1xzJeuAhgS4c2RahHJMlJzxuxn8/cx8FnnR0TZn+WNvjDg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=PjUj8vec;
	arc=none smtp.remote-ip=209.85.210.182
Received: from mail-pf1-f182.google.com (mail-pf1-f182.google.com [209.85.210.182])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 66755606ABC1
	for <devicetree@vger.kernel.org>; Wed, 21 Oct 2026 12:35:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 66755606ABC1
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=PjUj8vec
Received: by mail-pf1-f182.google.com with SMTP id d2e1a72fcca58-8a06ca6e8f4so473646b3a.1
        for <devicetree@vger.kernel.org>; Wed, 21 Oct 2026 05:35:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792586132; x=1793190932; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=EYl3M1lNXMEDde5L6u4dnJnpfbfwZtPoUfD3SBMHOns=;
        b=PjUj8vecJnPAGe8RjqByiqB9Srfv7qD+YdaBM9MTShzsDrCv3AH3hAc01+sYO+TKRb
         TkIsKinZrL9cGdn8qFZsc9EjFHEQyMTtqXTHYev2UIYSsHSq6027+d2XcC19O5SKBbBI
         e0cGzJbTCZapOzoWLitTWVVGHDKTelTsV8b+/m5Zwm9ghPJBcKeO82EPP7MnZEzbTDrl
         03s4vXZdPYi0bkhNWHy4/hU7TXOfYx922XT1dTUB2seX03OY5yShOt2w18IXjCsUllF9
         mnmz9oSvP5+bSFk652m05RKZ3n9vTsUkR/sJFcjf3cOXptD4ZTfR4llnP95fM5TdVmEU
         EiiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792586132; x=1793190932;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=EYl3M1lNXMEDde5L6u4dnJnpfbfwZtPoUfD3SBMHOns=;
        b=QnXVhmJhsDLbua+6JFjeUUo+PjCGpYTNMe4zSAwwfEytzq0eYbbUF9ekJJ64WvTz4d
         w4byNdff5OGxRJUABPdBQl3TWiDP6KzfFkM8IQu+uIlLMDfFP30JIrHwlVr9t1XU6SH2
         qV8u3OgrN0bC5+Be8hvv4LJiioi2HJsm1WXdwQ/L5bQXn7OMUjTPI8ee5vwDgT81XFzJ
         R1ROInBgOPSdA2jN8IjkcZdrStvs4s8cid0tbIO6HjrRF7aq292Baw+0Oq4byGzukXVy
         DrlJVJdDM0me8haVM8eTpEJoesqd6vPtjRyt1jneTNEoG9fynrcvSjqiTQoWfdMnxZJv
         m5iQ==
X-Forwarded-Encrypted: i=1; AKwUvBxLrKJ1NBEa8PyHtCg4GYiPbkVjUb9CU4Dotz4UcxNCNBG/lHcwu0XRH8jPLiPbl3ZUpRB0v4p+4LVq@vger.kernel.org
X-Gm-Message-State: AFq9FYKMiUmSTP/z6p+PhJLx+5+ota5/rXwSz40wyVjam74K1zLs7BeR
	zcGQAg7CGiyghTAtVDN9IM43Z9Lsi8MNkT2lsq1kpzhG7bbsb5clq7Ns
X-Gm-Gg: AYBFou1UvLhXIqL9VOoIdHbuF7MIrnG3+aOluk9NdYPxbg7OpTIaYnyCavm4QCrsF65
	tkb6n2NFVs1DWdud5purKkqMxj9auP8RLRlImvusqmq70A2jHKxx6mavovgI0UqfQG0yTStSRgD
	Vxm2/G4pKg1bLzAqFL+w0/qIgxsTL7Cha9+bWvkK9yyHAa/VG2xd0n1KQWwlxdh3Tp+dlUrfRWp
	ewjXTvQ1zuc+DO003r9DZiVomgjn4eIP5brRe0BfQFe1cqO+S3SP3xqrb408ggZz3hbeplN2Xi/
	v5q0zGR/NTh+g3EOlPVm8So0A+BXXGiIm0ebKf2sZIvOrxNA3sDg9IHzhUE2QF04hc32y+f+DdR
	lMhBI7jdj0cJfL2T2d/fHqigdLcmKhYtpxn0M7R5Hiznm49Y+E3zuCMfQMEbqQuS+SoiBB3QSBn
	xcCB+QvBGrn9GniPkf7uUmHx9ZBl5qE5X4MmBORxgpxF89s8wUn0ttumdjuDIpAa/bYZT17bHb2
	GFwLlp97W+PoGPLzGFRXVBH2RNx6/NZd1oX546+XLXAxb7ctMVjk/Otuc54r85LYV6xyeXJ9yd1
	fn28ZO0=
X-Received: by 2002:a05:6a00:998:b0:89f:1b32:29a5 with SMTP id d2e1a72fcca58-8a089c4294dmr1551510b3a.7.1792586131851;
        Wed, 21 Oct 2026 05:35:31 -0700 (PDT)
Received: from FLK-B04Q314.global.tektronix.net ([87.58.102.86])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8a0894b484esm825732b3a.13.2026.10.21.05.35.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 Oct 2026 05:35:30 -0700 (PDT)
From: Krzysztof Kaszubski <sympthicode@gmail.com>
To: Frank Li <Frank.Li@nxp.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: Fabio Estevam <festevam@gmail.com>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Alice Guo <alice.guo@nxp.com>,
	Peng Fan <peng.fan@nxp.com>,
	imx@lists.linux.dev,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2] ARM: dts: imx7ulp: Add TMP6 PWM node to i.MX7ULP
Date: Wed, 21 Oct 2026 14:35:19 +0200
Message-ID: <20261021123522.346317-1-sympthicode@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261021084602.121087-1-sympthicode@gmail.com>
References: <20261021084602.121087-1-sympthicode@gmail.com>
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add the Low Power Timer/Pulse Width Modulation Module 6 (TPM6)
node to the i.MX 7ULP device tree.

TPM6 is located in the Application Domain (Cortex-A7) at base
address 0x40a10000. This enables PWM and timer support for
peripherals connected to this domain, such as display backlight
controllers.

Signed-off-by: Krzysztof Kaszubski <sympthicode@gmail.com>
---
v2:
 - Move tpm6 node under ahbbridge1 (bus@40800000), before lpi2c6@40a40000
   (reported by DT bot)
 - Fix author/Signed-off-by email typo (simpthicode -> sympthicode)

 arch/arm/boot/dts/nxp/imx/imx7ulp.dtsi | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/arch/arm/boot/dts/nxp/imx/imx7ulp.dtsi b/arch/arm/boot/dts/nxp/imx/imx7ulp.dtsi
index 39e37ae9b2b1..6240750b84dc 100644
--- a/arch/arm/boot/dts/nxp/imx/imx7ulp.dtsi
+++ b/arch/arm/boot/dts/nxp/imx/imx7ulp.dtsi
@@ -366,6 +366,16 @@ ahbbridge1: bus@40800000 {
 		reg = <0x40800000 0x800000>;
 		ranges;
 
+		tpm6: pwm@40a10000 {
+			compatible = "fsl,imx7ulp-pwm";
+			reg = <0x40a10000 0x1000>;
+			assigned-clocks = <&pcc3 IMX7ULP_CLK_LPTPM6>;
+			assigned-clock-parents = <&scg1 IMX7ULP_CLK_SOSC_BUS_CLK>;
+			clocks = <&pcc3 IMX7ULP_CLK_LPTPM6>;
+			#pwm-cells = <3>;
+			status = "disabled";
+		};
+
 		lpi2c6: i2c@40a40000 {
 			compatible = "fsl,imx7ulp-lpi2c";
 			reg = <0x40a40000 0x10000>;
-- 
2.43.0

