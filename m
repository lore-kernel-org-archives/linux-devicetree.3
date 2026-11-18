Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.44
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795005531;
	b=ASaZUtKzQ/FTZ0Hw7VIe0m1TuNxZv1lug7fkIJs1PRvafejBCpDhvOmRxvgovTZQBfUg
	 tzuVay4QXlz0TdbDnk7so8a1Jd4Srw2DxACWhnr/EA9snUmo/P9EjeJHoli2xmO4Znqpo
	 ZTpLQ94cxIfes0dbBunCQK0paw3mtgkHizONwE78UeN3N3wP4OvdOU+W+HYz5DNZuhJ8J
	 0bGzuS1uBnv4mOkGciuJWWNPHcOuv++1txN2mmlmxjIUPBtT5TBNtzL1BJTguqHNwVLH/
	 Yx+xrYV+26z37Y6uKllnP0GeV+1kfDMC1yhGOhQYyd6A2CaqAEFWLaN7/uW7Kc9gsFQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795005531;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=PCeTG5B3FnqoW+qGoo1FXEjHCoH6J7aBegNAVVKMa/Q=;
	b=mrXJ1JLsrMqbCND5uAspTHctC1Zgu6FmEFprQHJEYLPUfvrvuaVdMYEzUeWung4JgF5B
	 mtZFIQMJle24tA8X6BJAL1Xog81gMzQl1UcZm1K9GpgDZBvCBmmso/icU2TGJ2pD0ShK6
	 1iCkL8J4aFpH1HrUUF7q6KUmY78KO9L16qNnixXI1VS+uo7IqjkxTPjNEj5CmJFwOCci/
	 Y66j204y8YrC9naX0NQ5z7pZREq4uBm1HapGPr44gtTIgGSNztoRQl36rxXCUlAJ8kV2D
	 7DzJ6TouBaY6OxUCh+OmbdeovIeYuR+FudKaVuGMSXXt1BtbG0tzKmby1430gFQVw7Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=fm2N1TPH;
	arc=none smtp.remote-ip=209.85.221.44
Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AAC11606A31C
	for <devicetree@vger.kernel.org>; Wed, 18 Nov 2026 12:38:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org AAC11606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=fm2N1TPH
Received: by mail-wr1-f44.google.com with SMTP id ffacd0b85a97d-4a7b8abe209so287190f8f.0
        for <devicetree@vger.kernel.org>; Wed, 18 Nov 2026 04:38:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795005529; x=1795610329; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=PCeTG5B3FnqoW+qGoo1FXEjHCoH6J7aBegNAVVKMa/Q=;
        b=fm2N1TPHFZW+8XtvDSptbIQXDAxVVWA4ZgVH2l0fys2x53gBJrZ2xbdy+Sh6Ei1ZZb
         roVAMsT/7+i/OxJFYFcBBU2yyEahq4CfLwaE8aWTMaDIHyelF9kPErugI/+sB4exacI3
         nL/jwB9Zfp9iQYYs2VtNwSIfHt0zfC0so2iUEk72FUihWnJHEmyBk1Iw6tDCtiQsRJqc
         P5MZjm+lZfvJLFPQqIXqpKyTANdl3Uwxqu3Ik/UfyPWmClZWy4NxSJnr8s18cJersPa9
         IWujiz/S5uJ7jDgTsHfGpank1G3/Z2d8M/7qOR9xGyQtjY8vHydwnVO5hNaP8uTTpiaC
         R0TA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795005529; x=1795610329;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=PCeTG5B3FnqoW+qGoo1FXEjHCoH6J7aBegNAVVKMa/Q=;
        b=QRX+MF6OolW4ABjAr/6CsckTk5uc3/81lkm6wAA/u0dHi0abjKzPjpGkjERMunCaZQ
         GCnrUkd7uGwemoR94RwidvUa/dsWcLDO908IGfASNYrz1nvahGjreKKf0xiTuszMAUTp
         Gkekb/AktxKkZZ3zymyIrwaEWIrv3bAcotRe4lCYlPb5W5viY73ihDCnMlHVaOWNghhS
         h+RnshnQXfOTZXwieK2SfiumW9ZKRI82rDtZs5y/VT+c1GV5dx3G1ZZeUGDAupwWwmN+
         o/eNDfhI/WrzqVGrUsIBul74FeqUJyXWAlE/GfkrfPyRwm9TzcLmFcWHZSf3IJfPKpqB
         Nc5w==
X-Forwarded-Encrypted: i=1; AL+hErF862sPMHiARvdOdeaxH7LdGwjQ/+HmFDT0XUUVaGGkiIT6mOYV0bdu/MRg/verrGq9Fs4bvKrTMm1O@vger.kernel.org
X-Gm-Message-State: APuU4Z84tw+9sBas7Dm3ke3zee/MY3crhPIX18axT1hCwlFCkzLcAZob
	yfYPSP4gpILYjVxnOpuM+qdPmZ6k4JRpD+wFZJ0AcnQiYYJtfJWU/Zhl
X-Gm-Gg: AZFdTZe3ARNyUnzK6nkhLMuaLVLdhtj8aIVOfEWIxAyzx399mlIrEr7lRN5eGq8Eor7
	MQ6UAvSSJwghfhLAfsFk+1CMU0Rh7yqqHshjm1LLIfMmNOt3Kz9MSbn84jcDTVjVn9yjGjxjxyK
	dgp1AiSk1AvEHMi9bx2/1V3OxAf4i+iD/hMeOU0sYUvhskHtPIWrev+6EfVhDAj7kkQjgp9rEaS
	aGkhyMzzwu6jMtEMDe7i8hGnurOJFvytOUlw8f4qsH5KSgZWgM9XQKF2s3Dsq0iqCRBwJP7x0ui
	CM6EzUpTawa+SRNWaoSmbytIGOj1tNLWVG2bKyrHMPDz05pEjx3SYys7f7tq0NRzE51hJ8Wcp7N
	68inhq5MhT4HG7MSdN2D1NSO80N65y4FkrzSc0772j31ofpSrTQhtYegntG7wUJQrN/fV7PXknz
	xpspYLh16IR0dtOlIXbCk4AObEMGkB7DGzQpvUQGILM80Kb8gRtr8hIKvjaHwv7TjNnfz3602MD
	BcuvaCmhRfyP4b0eYID0s73Wz6WScZNMwvdVlQBVYKP7blkVKoBPndqmB8lDKWIHqAh0zSKE3E4
	51RWV3HvtBD779YghBg6L01PIJl5Z5DrHw==
X-Received: by 2002:a05:6000:1a85:b0:4a7:ed95:7c9f with SMTP id ffacd0b85a97d-4a7ed957d61mr1616041f8f.22.1795005529035;
        Wed, 18 Nov 2026 04:38:49 -0800 (PST)
Received: from vitor-21h1cto1ww ([2001:8a0:c4c6:f00:370f:e244:9816:c590])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4a650d2efcdsm4539201f8f.5.2026.11.18.04.38.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Nov 2026 04:38:48 -0800 (PST)
From: Vitor Soares <ivitro@gmail.com>
To: Francesco Dolcini <francesco.dolcini@toradex.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Frank Li <Frank.Li@nxp.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>
Cc: Vitor Soares <vitor.soares@toradex.com>,
	linux-bsp@toradex.com,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	ath12k@lists.infradead.org
Subject: [PATCH] arm64: dts: freescale: imx95-aquila: Add ath12k calibration variant
Date: Wed, 18 Nov 2026 12:38:37 +0000
Message-ID: <20261118123837.651915-2-ivitro@gmail.com>
X-Mailer: git-send-email 2.53.0
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

From: Vitor Soares <vitor.soares@toradex.com>

The Aquila iMX95 has a Silex SX-PCEBE Wi-Fi module (WCN7850). The
module reports the same PCI and QMI IDs as other WCN7850 designs, and
its board data also comes in variants for different regulatory domains
(US/EU/JP, UK/CA low and high). The IDs alone therefore cannot identify
the right board data.

Describe the Wi-Fi device behind the PCIe1 root port and set
qcom,calibration-variant to the US/EU/JP board data.

Signed-off-by: Vitor Soares <vitor.soares@toradex.com>
---
Depends on the qcom,ath12k binding changes in ath-next:
- 75bc725cd92b ("dt-bindings: wireless: ath12k: allow calibration variant for WCN7850")
- "dt-bindings: wireless: ath12k: Make WCN7850 supplies optional"
  https://lore.kernel.org/all/20261117174154.549590-5-ivitro@gmail.com/

Until they are merged, dtbs_check reports the missing supplies and
qcom,calibration-variant for this node.
---
 arch/arm64/boot/dts/freescale/imx95-aquila.dtsi | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/arch/arm64/boot/dts/freescale/imx95-aquila.dtsi b/arch/arm64/boot/dts/freescale/imx95-aquila.dtsi
index a1870f7b2eca..a73d137af2c4 100644
--- a/arch/arm64/boot/dts/freescale/imx95-aquila.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx95-aquila.dtsi
@@ -621,6 +621,14 @@ &pcie1 {
 	status = "okay";
 };
 
+&pcie1_port0 {
+	wifi@0 {
+		compatible = "pci17cb,1107";
+		reg = <0x10000 0x0 0x0 0x0 0x0>;
+		qcom,calibration-variant = "Silex_SX-PCEBE_US_EU_JP";
+	};
+};
+
 /* Aquila I2S_1 */
 &sai2 {
 	pinctrl-names = "default";

base-commit: 33adc96ac217d6e95b7c44ac383c19ca4ae2ff52
-- 
2.53.0

