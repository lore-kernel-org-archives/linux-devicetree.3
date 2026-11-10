Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.175
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794340385;
	b=vL14h6pzham8cAfnMeU896lF1AYKPTUVVo68FzirWc9sFgXn3p8e2fzFzutgeA61DQRA
	 ZpRtmVupkZ7n5pbi8x6STCCPN30s6+pa6bIFcWpxjLi7u/GRcjSdAlUjeBgWrs9mvxk5d
	 P/WaDOoD/w5csSjX7bsPPpBHyveY4ygCoGLz6BDw0Kok3yBQhJRsn3Szuh9RdyiSoH4yn
	 u4Qft994o+JqKSUdh6bqQgSJbElSm3fVdaIR4GPDaEmv8WQ7MSZNNT7t/MpR5+jrkI3Vy
	 Wcqjxjepzo1zrSkEUiRKt34kNYb0XPmgEt/wQH+/XvgRIc7DuxSHNyebwUq2GyXLZug==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794340385;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:Date:Subject:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:
	 References:In-Reply-To:To:Cc:X-Mailer:X-Developer-Signature:
	 X-Developer-Key;
	bh=pSRzgKFdhSIQOnswvBYG/q417XF3w0gkP44gTgkrKbo=;
	b=y9+R5BnO6cqwrOcQLbExQOpebkQq4diMndCqsk2SSWY4AK6rzlUkaVliz8nTXedaec77
	 SxyFtHVdkwvygHF260FqI1mTrfCHUkxWBK+4gVT01fvH1W5NGPd33mcjaQtoeS75UC4IN
	 98hmBR2m/7IMpuznyXB56Pj79sFXM/2eDX3xwkl1zgAIPC/fO0pVadtGM453/4bfZN5pf
	 DHj/I1lNYhumZYIXAJkCpt0xDlaNjtIbx7+GgSJlPd6nGE4EQ5uck38+UfCUnWkmRDevO
	 LW1mX/C6Esd4O+Op85kcX/SuhtlpGyhXMWrxYooap4uH7Af7/uUf/8sjMDTBcQOtKew==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=fDVKvpLw;
	arc=none smtp.remote-ip=74.125.82.175
Received: from mail-dy1-f175.google.com (mail-dy1-f175.google.com [74.125.82.175])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0104E60A2607
	for <devicetree@vger.kernel.org>; Tue, 10 Nov 2026 19:53:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0104E60A2607
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=fDVKvpLw
Received: by mail-dy1-f175.google.com with SMTP id 5a478bee46e88-3719e3cb82bso280947eec.3
        for <devicetree@vger.kernel.org>; Tue, 10 Nov 2026 11:53:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794340384; x=1794945184; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=pSRzgKFdhSIQOnswvBYG/q417XF3w0gkP44gTgkrKbo=;
        b=fDVKvpLwZtAwE0mpwItjhoI6qViFk+Y3n+QXg2xZ6GC1zOMNjgj6OvJwjO9m2LIGIB
         CYrc0d/taO7KEkcPBEaWt1imYx7Q+fFLH5BK8ajULilV84MpFVlmdI7zrhG/fvB4Sm3z
         T5f39ufBvYGLQ74ALGso8RP7d3bvfo+XtzudOHrWeTF/YzTcS93AqY/O0uzWxAz+SZCI
         goqDtOdDnTyn7QrBTbHM+N2FeueEFJXhlp5CYTDSytxIEoLA49RZZi0QumwSzMyKx7+J
         h4rj8ypjczkph7nuLemFL05NrYvyM644zkrU3fUOGBqSMd8OGQ6WWv31MJ8sR58Ef5tj
         yBlA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794340384; x=1794945184;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=pSRzgKFdhSIQOnswvBYG/q417XF3w0gkP44gTgkrKbo=;
        b=1Dp/BS7JKASCWCadlzXE3zc+uDQ+aIHk9mmwliL7swvltNDCjX9If4ldXEmTAGu2Qf
         wh1fEzTnGADx6+hXfGJL/qJNvMg7+8GXfupYb8k7IQ+bruQcE4CaAjrtYqBeGZ05Ib06
         INiJ1aeRvXrxK/x6RAEg5Cl6Tshkxc58sN6pI4zhdj8LIm132mZNXpR321ZBQ4wiRzDJ
         u66Dc7l9NY4DxnUpyDW7IuLT7wUQIoALUPSCgkqoiGmXlCBA451JHZY94VxG68yY9AO/
         ELPVLf/pbElDWocoKrXfgXOkMz61lX+z868P1QdKTKLvk9nq43LNHPDQC8GfHsFPPaQ9
         Oo5g==
X-Gm-Message-State: APuU4Z9L8qsSCWcTOTWueW46mGz8r1ij3jVIVQ8ko8QZ92n+dUDMD7Ts
	MeViYtEpmgHEucKwIEFntShB2hMiRsUuWzhJ3S4KcvQ1qUhEg6tpoXDY
X-Gm-Gg: AYBFou1huMNd9cbliv9SjSxJuIg+Kq6YCUu2BPBAy9+SVW+OJEXAPtabpKClHHqcH+g
	XKjlohhsFzfsn/Ub3VkryfZ5ZDO6jzc+7Euk4nd1JLAEwYuSpcZiZlDZMP/Gu0LEYEQeY0r4YmM
	ycQ/JW0Cs4eL1D8XJWa5sf+6F8djqwPMhAUBzHFE/0ij7Qals4XU6LJbDhmCqjbzyBYzEUkiP5Q
	cxpK94oNywqFs1Vqr66r2m2LyQGAAy1jozLnl6mZlwFAS+qnxawHLb8oP93ea7+2wQK0prGUXU9
	xEA36Q/JnHH7aKrC+chARfgyvjFpEgRKYFxAeM2ZHp7zGA0aCtP4bF37e3jFCffzgLk2zIlOxCr
	yY3hqlr8SfrmnS+F4usso4BTZD8W3ukzqEOsxmr7htFRBSLtoQfKVDrPyZu3IOseYQ6GIOur+9E
	gxcLvAcTUxuEQdCYGTsold3bPQU007JETzCi2KKMuoSkqTzWOSJ8k8yUzUPZ7pt3fKZsz8eT2QF
	d3z3qcYRkWJw5QHiadSP7sxtyx2EXlTu8I2IMjVE/dfPpZAVA5s12x917hhBdt41dNNvYb6ydl6
	y2cDX1tPF5yan/MnWnXtJnG0/Av1DWSsLA85Fxw7oPt+RlLmEO89xd9FDcSm
X-Received: by 2002:a05:693c:8113:b0:35f:ea17:d171 with SMTP id 5a478bee46e88-37684ceea1emr616995eec.2.1794340383613;
        Tue, 10 Nov 2026 11:53:03 -0800 (PST)
Received: from [192.168.1.11] ([2401:4900:881f:d9bc:11f3:620a:3333:518d])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3752060899asm8834225eec.11.2026.11.10.11.52.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Nov 2026 11:53:03 -0800 (PST)
From: Bhargav Joshi <j.bhargav.u@gmail.com>
Date: Wed, 11 Nov 2026 01:22:34 +0530
Subject: [PATCH 4/7] dt-bindings: arm: omap: document missing OMAP3, AM35,
 and OMAP5 boards
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
Message-Id: <20261111-ti-omap-dts-fix-v1-4-19022d1ff4b4@gmail.com>
References: <20261111-ti-omap-dts-fix-v1-0-19022d1ff4b4@gmail.com>
In-Reply-To: <20261111-ti-omap-dts-fix-v1-0-19022d1ff4b4@gmail.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Aaro Koskinen <aaro.koskinen@iki.fi>, 
 Andreas Kemnade <andreas@kemnade.info>, Kevin Hilman <khilman@baylibre.com>, 
 Roger Quadros <rogerq@kernel.org>, Tony Lindgren <tony@atomide.com>, 
 Mark Jackson <mpfj@newflow.co.uk>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-omap@vger.kernel.org, Bhargav Joshi <j.bhargav.u@gmail.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794340358; l=4346;
 i=j.bhargav.u@gmail.com; h=from:subject:message-id;
 bh=qHEkUUAoB617xwq/cQFfugK+/I80z/YbgdFdobeassY=;
 b=gKWgWqO1KWiTlb7NXwfQgrBk8K0mYi3ZaFAh4n/F22I9WnCufA/3VBWx4XAw/r3IwZNZGhje6
 rBQ/0AQnU8uCUqrpbx96ots2p3Qwq9izV1onMXy+nxahadmq5o9cNKM
X-Developer-Key: i=j.bhargav.u@gmail.com; a=ed25519;
 pk=IqNDwUZKECEA+n8wXctFLBbYL9NhFstZNbOznm/nX1k=

Several in-tree OMAP3, AM3517, and OMAP5 devicetrees fail dtbs_check
root node validation because their compatible tuples are missing or
incomplete in omap.yaml.
- Add missing "ti,omap3" const to the Gumstix Overo block.
- Document the IGEP OMAP3630 boards.
- Document CompuLab (CM-T3530, CM-T3730, CM-T3517, CM-T54), TechNexion
  TAO3530 and Incostartec LILLY-A83X based platforms.

Signed-off-by: Bhargav Joshi <j.bhargav.u@gmail.com>
---
 Documentation/devicetree/bindings/arm/ti/omap.yaml | 56 +++++++++++++++++++++-
 1 file changed, 55 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/arm/ti/omap.yaml b/Documentation/devicetree/bindings/arm/ti/omap.yaml
index e0af554388669..86c68f118c5a8 100644
--- a/Documentation/devicetree/bindings/arm/ti/omap.yaml
+++ b/Documentation/devicetree/bindings/arm/ti/omap.yaml
@@ -50,6 +50,24 @@ properties:
           - const: ti,omap3430
           - const: ti,omap3
 
+      - description: Compulab board variants based on TI OMAP3430
+        items:
+          - enum:
+              - compulab,omap3-sbc-t3530
+          - const: compulab,omap3-cm-t3530
+          - const: ti,omap3430
+          - const: ti,omap3
+
+      - description: TechNexion TAO3530 boards based on TI OMAP3430
+        items:
+          - enum:
+              - headacoustics,omap3-ha
+              - headacoustics,omap3-ha-lcd
+              - technexion,omap3-thunder
+          - const: technexion,omap3-tao3530
+          - const: ti,omap3430
+          - const: ti,omap3
+
       - description: Early BeagleBoard revisions A to B4 with a timer quirk
         items:
           - const: ti,omap3-beagle-ab4
@@ -72,6 +90,7 @@ properties:
           - enum:
               - ti,omap3430
               - ti,omap3630
+          - const: ti,omap3
 
       - description: TI OMAP3630 SoC based platforms
         items:
@@ -79,6 +98,10 @@ properties:
               - amazon,omap3-echo             # Amazon Echo (first generation)
               - compulab,omap3-cm-t3730
               - goldelico,gta04
+              - isee,omap3-igep0020
+              - isee,omap3-igep0020-rev-f
+              - isee,omap3-igep0030
+              - isee,omap3-igep0030-rev-g
               - lg,omap3-sniper               # LG Optimus Black
               - logicpd,dm3730-som-lv-devkit  # LogicPD Zoom DM3730 SOM-LV Development Kit
               - logicpd,dm3730-torpedo-devkit # LogicPD Zoom DM3730 Torpedo + Wireless Development Kit
@@ -91,16 +114,40 @@ properties:
           - const: ti,omap3630
           - const: ti,omap3
 
+      - description: Compulab board variants based on TI OMAP3630
+        items:
+          - enum:
+              - compulab,omap3-sbc-t3730
+          - const: compulab,omap3-cm-t3730
+          - const: ti,omap3630
+          - const: ti,omap3
+
+      - description: Incostartec board variants based on TI OMAP3630
+        items:
+          - enum:
+              - incostartec,omap3-lilly-dbb056
+          - const: incostartec,omap3-lilly-a83x
+          - const: ti,omap3630
+          - const: ti,omap3
+
       - description: TI AM35 SoC based platforms
         items:
           - enum:
-              - compulab,omap3-sbc-t3517 # CompuLab SBC-T3517 with CM-T3517
+              - compulab,omap3-cm-t3517
               - teejet,mt_ventoux
               - ti,am3517-craneboard     # TI AM3517 CraneBoard (TMDSEVM3517)
               - ti,am3517-evm            # TI AM3517 EVM (AM3517/05 TMDSEVM3517)
           - const: ti,am3517
           - const: ti,omap3
 
+      - description: Compulab board variants based on TI AM35
+        items:
+          - enum:
+              - compulab,omap3-sbc-t3517
+          - const: compulab,omap3-cm-t3517
+          - const: ti,am3517
+          - const: ti,omap3
+
       - description: TI AM33 based platform
         items:
           - enum:
@@ -241,6 +288,13 @@ properties:
               - ti,omap5-uevm
           - const: ti,omap5
 
+      - description: Compulab board variants based on TI OMAP5
+        items:
+          - enum:
+              - compulab,omap5-sbc-t54
+          - const: compulab,omap5-cm-t54
+          - const: ti,omap5
+
 additionalProperties: true
 
 ...

-- 
2.56.0

