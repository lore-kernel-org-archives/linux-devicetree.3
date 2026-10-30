Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.54
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793378156;
	b=zu8DbIRBaYTXDsguFU2Rqk4l43zXvDhvYnAkDwpGzms1rpWJok4SRTtPPQwDe7hVdasF
	 MQ7M1WqA/S2nf7f5q6o/wjbvheHaxL+PTJyIaHcWplAUEeCrPA5aqNR94M/NGByHKjB/o
	 OQaQ6vEkQxAI1Idto1ylcJBqpeo2KaF3d/RWvHDCywBnIQz7qW65gG8fJbu+5UFoRFORc
	 dZ9Sjpx1dx4dVWPin4cHUaNMVKCYWrZ8khppIzOKGtYkydULHhvwIjzMSlWLhz2IRP8Mq
	 Ta8vP/SxUvXXxWoVPQLTGOOhxgJAe5rL7YiTJ4fQQnSXPQEsqIiLmfU3q/ucJSs9WTA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793378156;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=pOuTQAzIAgHcyD+89OKp4L/Cpx4sAMbE9RsI11vwmkw=;
	b=CSommhZaYlfZCMkHLLZAC666kJ32DOGkiihCDzSBVaI3UBj6nNRS/SXsrsVCsAV35vHD
	 osnOVCZAFKhf/FXRXVT3wao8AiVENcWcq8MvBqliXSRFhRfd/hzj0krkPfT0Bvq4JTSa+
	 p7g3MSVKmogiPEk3BKklq+SwO6eg0AwrpNEqu2SgQPd5o24bEtXqxjXBqEmgILMzRTspj
	 JKYusCp9Rucfp4iDowHZDbVjkhsj8VnFGmtD4S23o1kC4De2hawEl47CfhnLfb/xpebK0
	 tM7NDC1LqHuFEGi6Izpgl5YtyCsWI/fbZqv+u99B3D1MsG7yyfDHIAvz9dun4K190nA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=amarulasolutions.com;
	spf=pass smtp.mailfrom=amarulasolutions.com;
	dkim=pass header.d=amarulasolutions.com header.i=@amarulasolutions.com header.a=rsa-sha256 header.s=google header.b=QIGZErHp;
	arc=none smtp.remote-ip=209.85.128.54
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 99141606A326
	for <devicetree@vger.kernel.org>; Fri, 30 Oct 2026 16:35:55 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 99141606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=amarulasolutions.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=amarulasolutions.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=amarulasolutions.com header.i=@amarulasolutions.com header.a=rsa-sha256 header.s=google header.b=QIGZErHp
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-4a59100fa83so8520445e9.0
        for <devicetree@vger.kernel.org>; Fri, 30 Oct 2026 09:35:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google; t=1793378154; x=1793982954; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=pOuTQAzIAgHcyD+89OKp4L/Cpx4sAMbE9RsI11vwmkw=;
        b=QIGZErHpvzxqaGa+rfbEtHPUs0SroWsOnAvpavbA8Z3W46csMPaaDCBoGv0rU8GIf5
         7vG3b6W2c4OKkb9g3PKAQMnahAt70gtMcuMtqqWeOvFUnC6LpzYhFbkgEX40Hl8J1R+z
         bdevsf3U/Ksp9ouemuljSiWC3bfec2V7+kFMA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793378154; x=1793982954;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=pOuTQAzIAgHcyD+89OKp4L/Cpx4sAMbE9RsI11vwmkw=;
        b=ipPITmFVxgI1A//x0TjcSJkXMVF+aSRqDQPu2Gtk/oGuvA4VaiJZkoAy6ztzS+Lr2l
         8atdV3S6tz4TePVhBiUD9m6HE1H4gdqwfYA3FXC/bIA15CKfEj1CtWTxcyH0T+Jyxg5X
         P5PZ+96HDc+8h8VV27OJTXULKH3NocF18tPeQDFNPjh8nBRNZncVei+2SbcispwdtUtl
         i8axVZf8ORN8SqVwIET6zKT8jg3zpo7o3p7sG//QXCG3B6UU2mDZQx1wrS3j4Qpxew2l
         ep3H/zaF1QJVrmWEP6DghC/IyUnHdmHgb4rfxMYeUo70cxLUOXR3nCBO3tg+ExmwRBBX
         Yung==
X-Forwarded-Encrypted: i=1; AKwUvBzYn+X+aeR+AJasYu/ZfFgnNfQJGFYoo5VlHa4u7oKcswhD4QFYJt36ohECTLZWitU2DXLjMZ2mwx0n@vger.kernel.org
X-Gm-Message-State: AFq9FYKlB6OTxKjK6rE+F6lum9evgeo5Z4FB/lXME1AMDzMuoKe1Sevm
	nFLKMjx3Zpb0FpEINKV+3/wtB4g24Jt9TLDBWnJ/LUu/Tob23oS/xJxavgWYowsDvBs=
X-Gm-Gg: AYBFou0RBHToHEh95LqbyxmDjAurq9q+eouMjnEfPEdv0Vy785sT6W8tvSsIg7MhYeC
	ncCQKB0wGnytyMgY4bl8MhpqrIgjRTEFKSmNyA44bfW2mXZGkm1rSU9tdnvmM5Y8GjPq0oc2nvS
	1BNx2rKDe+SHKdGBEDTE+aEBUhS0XR01IeYZpch97yqtYJqRjQhmuN3EhPCLnvEoyMjCyEEjJBH
	OHyiWOq7QSTnA6rUi1Olbu2tLUhoLXHfZ0fAc5/9RqDtcSN8xJz12lpJijvF6RQ0b6YQ8Dglcpi
	/4srptEW2+e2fSEmHjMGYl7E/Ec7bcHqj3jVxWXAEi1Qp/FnSl5E3HhD99b2PPLDxJxvNKIgxIV
	ms1rvfZAqtf9cv7zxDfepy1empcsJRDepj3zyl5Ot/HmnctO1YfjVonyDh4lBDkfWvW9saCkDWq
	5fSkrvxDvGppV9Ic1mIGZV2YOMDePBi/cPZCPLbVXDXsEaEuQ+Xmvj7EvVvpja+D5blMsBib6FE
	49JHmyKe6f2/pGJVDUvkTCG/RtC9PDR0lmgaa/51Tlp8LNC9Gg52a7+XuzmuNqrVQmCZrhtGq9C
	ImCxvDMrPFdTIA4Df79g2qeqvAfw9ti7g8NC1K3bEgee6DnBq7eAkDJCltVGHLlCrdpJqoolPyV
	Kx7GrroCXgd2VauHLT6Gu352XQGFS740cYONBM7C5NrNTUa8FUcd1zad1Br++jaHesDnjGsQSfw
	RhxO+b3MqpkfEL0U/GBfwanhld5w==
X-Received: by 2002:a05:600c:83c3:b0:4a9:18f4:925e with SMTP id 5b1f17b1804b1-4ac174711afmr61029555e9.18.1793378154030;
        Fri, 30 Oct 2026 09:35:54 -0700 (PDT)
Received: from dario-ThinkPad-P14s-Gen-5.homenet.telecomitalia.it (host-79-14-29-58.business.telecomitalia.it. [79.14.29.58])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e71b723fcsm4084806f8f.14.2026.10.30.09.35.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 Oct 2026 09:35:53 -0700 (PDT)
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
To: linux-kernel@vger.kernel.org
Cc: michael@amarulasolutions.com,
	linux-amarula@amarulasolutions.com,
	Dario Binacchi <dario.binacchi@amarulasolutions.com>,
	Conor Dooley <conor+dt@kernel.org>,
	Fabio Estevam <festevam@gmail.com>,
	Frank Li <Frank.Li@nxp.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Rob Herring <robh@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH 1/5] arm64: dts: imx8mp-icore-mx8mp: enable the watchdog
Date: Fri, 30 Oct 2026 17:35:40 +0100
Message-ID: <20261030163547.2682583-2-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261030163547.2682583-1-dario.binacchi@amarulasolutions.com>
References: <20261030163547.2682583-1-dario.binacchi@amarulasolutions.com>
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

Enable the watchdog, asserting WDOG_B on timeout. On the SoM the signal
is connected to the PMIC, which resets the whole board.

Tested on the i.Core MX8M Plus Fast Ethernet variant.

Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
---

 .../boot/dts/freescale/imx8mp-icore-mx8mp.dtsi      | 13 +++++++++++++
 1 file changed, 13 insertions(+)

diff --git a/arch/arm64/boot/dts/freescale/imx8mp-icore-mx8mp.dtsi b/arch/arm64/boot/dts/freescale/imx8mp-icore-mx8mp.dtsi
index affcc20b20c7..33066247cd2c 100644
--- a/arch/arm64/boot/dts/freescale/imx8mp-icore-mx8mp.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx8mp-icore-mx8mp.dtsi
@@ -122,6 +122,13 @@ &usdhc3 {
 	status = "okay";
 };
 
+&wdog1 {
+	pinctrl-names = "default";
+	pinctrl-0 = <&pinctrl_wdog>;
+	fsl,ext-reset-output;
+	status = "okay";
+};
+
 &iomuxc {
 	pinctrl_i2c1: i2c1grp {
 		fsl,pins = <
@@ -183,4 +190,10 @@ MX8MP_IOMUXC_NAND_CLE__USDHC3_DATA7	0x1d6
 			MX8MP_IOMUXC_NAND_CE1_B__USDHC3_STROBE	0x196
 		>;
 	};
+
+	pinctrl_wdog: wdoggrp {
+		fsl,pins = <
+			MX8MP_IOMUXC_GPIO1_IO02__WDOG1_WDOG_B	0xc6
+		>;
+	};
 };
-- 
2.43.0

