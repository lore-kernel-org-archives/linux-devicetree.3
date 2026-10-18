Received: from mail-pj1-f41.google.com (mail-pj1-f41.google.com [209.85.216.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8F0D33BBFD5
	for <devicetree@vger.kernel.org>; Sun, 18 Oct 2026 05:57:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792303037; cv=none; b=dk46TJZBxvc7HT4dv4p/h6hFJgNiHaTUhnOpKVyes7EOH6IWn4kAJQuEs2SEUrAXh7rd9UzwJ/5A0CJFtYzg4ZBv2iWyqqYHovziv1FfDt/svFiekf6RGCMsA03h8U1TOj6hNEG1+DL/AMORLrHaUIyCeh/Cwiyz8Jpbei6vYCU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792303037; c=relaxed/simple;
	bh=Ra2ADqrZxWw8PcYD08Ad73OxCM3L+RBKl//X4m5oIQM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=J/YNvkysDWso7+7BP1aMBJzMuo9nkVdG5t/xRd1Uc8vw5vQnThL1ImaDTuEFFgIxjVZ3kTZxyBJhgYUXFQ+X2DpMpETachA/tNm8OQiE7Jm4ELoCZpv+ip0AMheXFGadcQyyldsHwUkucp6a4IYEx23gkDaY+sW/U4ntoBH8ShQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=r7QZWhEV; arc=none smtp.client-ip=209.85.216.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="r7QZWhEV"
Received: by mail-pj1-f41.google.com with SMTP id 98e67ed59e1d1-3ac677668a9so978658a91.2
        for <devicetree@vger.kernel.org>; Sat, 17 Oct 2026 22:57:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792303036; x=1792907836; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=6uj/FtW3Fwh1R62fLY15kbSsO1v6D6kwyz703Fo9gvw=;
        b=r7QZWhEVQ9XswgcSgrYVcVFFR2AqFxteoaGsW4DBeq+T2OXtUMGtNu0DoH1h1zRKmN
         /Z774s07uN4KS1zGeEQy5dPKdzZbj7nrzDlGplcxHgEj4byWkvpIYDHHGGjC6uIQgUi1
         AdlFg5eYlhkuufYZf8MfyacdEPfMx5WbRNNdx2a7Ljq8hthTQZGkb3Uv9weP39S12RX7
         AeMUdhwldBMNuDKYFU4E9YJFY9+sk25a/Kf707LsgHtq/Yz33pwI6Gv/L2xj37kHlREC
         icWNEo/Aww4ujZXu22iUQSbI4h0Z4kF2s9Vi/X7z1S/dv5G7fhkRs0GAv15d2n0q1pld
         2Lmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792303036; x=1792907836;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=6uj/FtW3Fwh1R62fLY15kbSsO1v6D6kwyz703Fo9gvw=;
        b=ug1usURlGJVGDVPQNX9wTedQ7bXGlk3V4xzjF6BxyG1WEuP0XRS9r/reNaD/3j8DMh
         +clRFIbOC4JxyjUvuP7x/OtYti+Qe2m3ZRfCyS4KPNZG8hqdm9KGTWYhL36n7/u07Xl3
         I4CgjwgagFdKJdiONsrp0s2VPnWOeieEFngjjBhei+dWHmAQSZSKb+6eAt+QXpvRZPnT
         wEi/rZWMf3kL+zKoLW4IGptm4lH9Ge42ZEQCsqf9IfMi3vDpU5iXA/fSlKEcbRzbJHsc
         C12odACjewZuqZ/fcmScaRiIa1Z6iqNzX254AGVS99LN9Hy6kZPA/DkJkedERqGWqtbq
         SInA==
X-Forwarded-Encrypted: i=1; AKwUvBwyO98cOgCx2SHVwXWbyyOB9MfW6mAcjevj2iADJVXsGoT3ZhPUXA4IgKeIcfvCu4DKMmhHh+YBvgpk@vger.kernel.org
X-Gm-Message-State: AFq9FYLrMRawILKQ8ggDSVI9vKORQH1vugGB9sBZRxuAMNurxu0uatAa
	iSX/j74H9mJsfQyOQdG5JbqyUPgf93Y+Pcw3Opkv0hgZW9TJguPSAaEv
X-Gm-Gg: AYBFou18LiCDWCcHV1vRdYvjIwZXEk9SDT5vRVDCegDMYCVbbr4NfyQqRqCyKV+Zb+J
	L1sPfv5l2z0Z7tZVmU5pgz1ZQyJzoSGMzg8RXlX6XfkBUBRt6pM1mqlGCAK2gyOnYKsgpljV0It
	cyuo/AOe6+wghEypgc/RyTdkWaNAFStL1F+Wyi2V4K1M2CMU9NTN1a+AIEjrafJjIExXv333g1Y
	yCaQj7/zuvyQRfIr27WrG0y1NQ/G87C2VWwKW4oefbfArf2yyjV1Hc+Tmunu1GvWXyIKdWZUeGR
	m+aySImBGpeQ6KNDu/c80v4+DUi+9S5tZxZKm+tKhw6o4q6PWB4DxMDhHs+7Y1fXLCVb7paBjtW
	W7ye4hRei1B4g0ufplKZtuhPwBR9aBWgwH4RYFZI53TWZww2bLUCSPgZQO3T+Xzro1VgSqmpcge
	xOg7x1qDeqRDfHI2NScg2GmzbPhqvebrbV8aKkhqibK6E0oVOfJHr4uIz8y0+vpCnpYHgn7+rQU
	yyia7hARQ8ZbZt/Ecd+Qh35UX726PDWhhFM7Zv5lbCpkwWWwGGJuhTpml70Ka1zVj1rVMgAYCrP
	2yLwg1Vlcu4bvKCvFvp6vzs3zdPjLXdFa6rBz37mi0Fr4HQ=
X-Received: by 2002:a17:90a:fc48:b0:3ac:452b:4a63 with SMTP id 98e67ed59e1d1-3acef51e2a9mr4377352a91.55.1792303036007;
        Sat, 17 Oct 2026 22:57:16 -0700 (PDT)
Received: from [10.0.70.21] ([2403:581e:d87e:0:fc2d:ed31:e80e:412d])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3acd0cde4fdsm5511292a91.4.2026.10.17.22.57.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 17 Oct 2026 22:57:15 -0700 (PDT)
From: James Calligeros <jcalligeros99@gmail.com>
Date: Sun, 18 Oct 2026 15:54:11 +1000
Subject: [PATCH v3 17/21] arm64: dts: apple: t8112-j493: Add
 speaker/headset jack nodes
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261018-macaudio-v3-17-abdff7741dea@gmail.com>
References: <20261018-macaudio-v3-0-abdff7741dea@gmail.com>
In-Reply-To: <20261018-macaudio-v3-0-abdff7741dea@gmail.com>
To: David Rhodes <david.rhodes@cirrus.com>, 
 Richard Fitzgerald <rf@opensource.cirrus.com>, 
 =?utf-8?q?Martin_Povi=C5=A1er?= <povik+lin@cutebit.org>, 
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 James Calligeros <jcalligeros99@gmail.com>, 
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Shenghao Ding <shenghao-ding@ti.com>, Kevin Lu <kevin-lu@ti.com>, 
 Baojun Xu <baojun.xu@ti.com>, Sen Wang <sen@ti.com>, 
 Sven Peter <sven@kernel.org>, Janne Grunau <j@jannau.net>, 
 Neal Gompa <neal@gompa.dev>
Cc: asahi@lists.linux.dev, linux-sound@vger.kernel.org, 
 patches@opensource.cirrus.com, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-mediatek@lists.infradead.org
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=3253;
 i=jcalligeros99@gmail.com; h=from:subject:message-id;
 bh=Ra2ADqrZxWw8PcYD08Ad73OxCM3L+RBKl//X4m5oIQM=;
 b=owGbwMvMwCV2xczoYuD3ygTG02pJDFlX4vm8RPZdtn//cm8/66ZbZ3qkfylJuE6dvH9y69mAU
 5EfcvsyOyayMIhxMViKKbJsaBLymG3EdrNfpHIvzBxWJpAh0iINDEDAwsCXm5hXaqRjpGeqbahn
 aKRjrGPEwMUpAFMt+Inhf1Ziz499nNYf3vmJb0hZXCkrl79m/eGqY8e1N81jnj75WSojwxrLe/Y
 H4/2tN4qrdy8w23DGfcGM8G8LQ9em3DuTeyj3HQcA
X-Developer-Key: i=jcalligeros99@gmail.com; a=openpgp;
 fpr=B08212489B3206D98F1479BDD43632D151F77960

The M2 MacBook Pro integrates Apple-specific variants of the TI TAS2764
and Cirrus CS42L42. Add these nodes and advertise them to the machine
driver via the sound node.

Signed-off-by: James Calligeros <jcalligeros99@gmail.com>
---
 arch/arm64/boot/dts/apple/t8112-j493.dts | 108 +++++++++++++++++++++++++
 1 file changed, 108 insertions(+)

diff --git a/arch/arm64/boot/dts/apple/t8112-j493.dts b/arch/arm64/boot/dts/apple/t8112-j493.dts
index 7cea5c594810..8993775da9ab 100644
--- a/arch/arm64/boot/dts/apple/t8112-j493.dts
+++ b/arch/arm64/boot/dts/apple/t8112-j493.dts
@@ -147,5 +147,113 @@ touchbar0: touchbar@0 {
 	};
 };
 
+/* Audio codecs */
+&i2c1 {
+	status = "okay";
+
+	speaker_left_rear: codec@38 {
+		compatible = "ti,sn012776";
+		reg = <0x38>;
+		interrupts-extended = <&pinctrl_ap 11 IRQ_TYPE_LEVEL_LOW>;
+		shutdown-gpios = <&pinctrl_ap 88 GPIO_ACTIVE_HIGH>;
+		#sound-dai-cells = <0>;
+		sound-name-prefix = "Left Rear";
+		ti,imon-slot-no = <8>;
+		ti,vmon-slot-no = <10>;
+	};
+
+	speaker_left_front: codec@39 {
+		compatible = "ti,sn012776";
+		reg = <0x39>;
+		interrupts-extended = <&pinctrl_ap 11 IRQ_TYPE_LEVEL_LOW>;
+		shutdown-gpios = <&pinctrl_ap 88 GPIO_ACTIVE_HIGH>;
+		#sound-dai-cells = <0>;
+		sound-name-prefix = "Left Front";
+		ti,imon-slot-no = <0>;
+		ti,vmon-slot-no = <2>;
+	};
+};
+
+&i2c3 {
+	status = "okay";
+
+	speaker_right_rear: codec@3b {
+		compatible = "ti,sn012776";
+		reg = <0x3b>;
+		interrupts-extended = <&pinctrl_ap 11 IRQ_TYPE_LEVEL_LOW>;
+		shutdown-gpios = <&pinctrl_ap 88 GPIO_ACTIVE_HIGH>;
+		#sound-dai-cells = <0>;
+		sound-name-prefix = "Right Rear";
+		ti,imon-slot-no = <12>;
+		ti,vmon-slot-no = <14>;
+	};
+
+	speaker_right_front: codec@3c {
+		compatible = "ti,sn012776";
+		reg = <0x3c>;
+		interrupts-extended = <&pinctrl_ap 11 IRQ_TYPE_LEVEL_LOW>;
+		shutdown-gpios = <&pinctrl_ap 88 GPIO_ACTIVE_HIGH>;
+		#sound-dai-cells = <0>;
+		sound-name-prefix = "Right Front";
+		ti,imon-slot-no = <4>;
+		ti,vmon-slot-no = <6>;
+	};
+
+	jack_codec: codec@4b {
+		compatible = "cirrus,cs42l84";
+		reg = <0x4b>;
+		interrupts-extended = <&pinctrl_ap 149 IRQ_TYPE_LEVEL_LOW>;
+		reset-gpios = <&pinctrl_nub 12 GPIO_ACTIVE_HIGH>;
+		#sound-dai-cells = <0>;
+		sound-name-prefix = "Jack";
+	};
+};
+
+/ {
+	sound: sound {
+		compatible = "apple,j493-macaudio", "apple,j293-macaudio";
+		model = "MacBook Pro J493";
+
+		#address-cells = <1>;
+		#size-cells = <0>;
+
+		dai-link@0 {
+			reg = <0>;
+
+			dai-tdm-idle-mode-0 = "zero";
+			dai-tdm-idle-mode-2 = "zero";
+			dai-tdm-slot-tx-idle-mask-0 = <0xf0f0>;
+			dai-tdm-slot-tx-idle-mask-2 = <0x0f0f>;
+
+			link-name = "Speakers";
+
+			codec {
+				sound-dai = <&speaker_left_front>,
+					    <&speaker_left_rear>,
+					    <&speaker_right_front>,
+					    <&speaker_right_rear>;
+			};
+
+			cpu {
+				sound-dai = <&mca 0>, <&mca 1>;
+			};
+		};
+
+		dai-link@1 {
+			reg = <1>;
+
+			link-name = "Headphone Jack";
+
+			codec {
+				sound-dai = <&jack_codec>;
+			};
+
+			cpu {
+				sound-dai = <&mca 2>;
+			};
+		};
+	};
+};
+
 #include "hwmon-laptop.dtsi"
 #include "hwmon-fan.dtsi"

-- 
2.56.0

