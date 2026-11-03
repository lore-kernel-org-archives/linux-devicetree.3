Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.46
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793691717;
	b=JB2P+c0GPsCVjzJTrcQPF6CHJKbgAdwzQZxZ0vT6AsEgGNT2OUgtGCMc+zrD7gajRnrH
	 yCgSvMdN8QoDYpq0ZwHMfnw5r+mbNeU1P/lbndpOpq8JsmBSjp0+as9r5uM/An6fHfxYI
	 bEB9X7XzgkX6KbloMBgDPamtzEDSGSts2YLzdvUakdO9/C38xqeWuPdJyKe5ElPxbnCwH
	 Yar/NssYjtblgmnwqTw4S+segqf2wKwF9p42TBcPCKffHgR4N4MfwW2qPDgUVsK6Z08jI
	 N/A6b63zl6Et7kXjYNrZWXdB4646yK0IeR5aVDaJkeYOrBhLSWXeoYNaNPlacTP55zw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793691717;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key;
	bh=tfbhdXr+xU9IHzzXCCLrrQtJWTVcaGZ00j5M2dfE53A=;
	b=FlUlM9ma8QPGB0VKdKobgiRvyJ5S5K8om9M9k0ELXhrAAKhFlhsWCDp3T7RXShqlxZoQ
	 RtkfgvPsneananDReeQ3XCR9p4rPmZL26Gja2dX71wqdtWnVmp1neUyvIqMWYY72kx0lS
	 kU2mMvlji03RON1tt682rF63vZ8WdhbHMYbe2L+EHh04YpKjiDPUkVAFaROnVLKx2UCdF
	 Wkh6V24cq9lM4oYWLnT14gwxtlesd0+iTu9donkVOQqCKs348rn/DiDDe65ANN1OXg7nk
	 GWsQwBIbv9Lik8NJBxxq86lJpC+je6qjBfNwn/7oe+Yr+e/EXWIUa02Ef4XMHby4jXg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=eQDdsUpg;
	arc=none smtp.remote-ip=209.85.216.46
Received: from mail-pj1-f46.google.com (mail-pj1-f46.google.com [209.85.216.46])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D0B25606A32E
	for <devicetree@vger.kernel.org>; Tue,  3 Nov 2026 07:41:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D0B25606A32E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=eQDdsUpg
Received: by mail-pj1-f46.google.com with SMTP id 98e67ed59e1d1-3acdcfa2bd3so3016661a91.3
        for <devicetree@vger.kernel.org>; Mon, 02 Nov 2026 23:41:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793691716; x=1794296516; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=tfbhdXr+xU9IHzzXCCLrrQtJWTVcaGZ00j5M2dfE53A=;
        b=eQDdsUpgJOK1HVIexkTRJa/Q7nShHwzw7iUC+we/MY+PU4Tm+73KTQiiOBvf+qt4MZ
         jY4CA+Jm8pp1KTdxAJYvGZNnK7GajtffxeiY2RtaevnmgGImistjjW2btGL61fHWNcyb
         PfW90cWOt2/fLFb2VYWUtL/+ihliiFX6u0q5P4klOig8eUM+HHhRl2fvxmKmNReSvgX0
         7mZBGphU2BeI4nrPDBXuYto3JhZo3WrMQe9kq84XvHWAG5yauKNuX9cJLosNZ9j+DGmj
         FZhlya8yEtqQ8tsbxt7zMpVB0A3HGD6ZjMp/ZSgFtrxzx2Y9ss4t9MfvEp+VH4FLrZcV
         6ajA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793691716; x=1794296516;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=tfbhdXr+xU9IHzzXCCLrrQtJWTVcaGZ00j5M2dfE53A=;
        b=oj6cCrfeCcWcfyPXUCY0/NZuE6hW7x5job/9oJrWfQQrUtLJqX1qjJF1ii+H2r6xbU
         Taa2DDUxqKuDmzt2VLI/+ytTldMwUwc2EaPlBQIrTLNzuHhSUbK3vp35Z99sE6hf5vTK
         /CGOAo5PG2TwkqW12ZtDiVFtEax0AOa/9YGKnpxdoV3C6c58P3dT3iaWxE9WmHsQInRH
         vt8WBaOcgTwIemAL0qsl8CcGfx9V3WsiTZPcO/j/zk3a1IOOsT5jgDFoN6tncY/sZawi
         EB3KOqaOqlG37BvJE3eFjWa0k6JgkUfw52r6uIKYWJvrQroO7VF3Kg4M/vgperSwtx72
         U38w==
X-Forwarded-Encrypted: i=1; AKwUvBzSu4ybY4t8jteHds0i4s9wq6/nj63HrKsvvAmJIU3b1pRHtdUX0Xp3oqsSRQxw0JDR3tKD6Qz20Gjo@vger.kernel.org
X-Gm-Message-State: APuU4Z+joUz7uusOihnF1xNif8/w74MsMuNA5/UiRsLMEGfT3rObkUaE
	5E2J7IpOyVtgfZ6bsLIDxR/+BsDgmWEoMD/lLeLZj2DePPRqRxDM8S81
X-Gm-Gg: AYBFou2ZngUdxMhNhpwyyv0Asi4bTcxMnU3+GVeJHJG2xABsdOv590ZClhUYbtYHI+o
	59DXBmmyGwsqXr+cfjHewt0UO3xkyqDlxsl5vOCouUBZ3tyioXAkZed7prn3Y5u19bIKc+WkKvi
	zr0MJau7GyogdcsP21SqGSAzuZOiViyK6o15U+G0ODXbpfN5N198o+gTZM1V3nKl6Fm8q3/UIS+
	FZ3xC/3nXruc9RukFQ1bjct9KJFJJjPyK/V/cu/Ig5EEa+3AJT7iP1mJhTtMwIVv5B6CEu4t9lj
	u7smXc8Ne6p2/KQDEFJ/XRGMPZV2VM65XGusmUZ4Fsjy92ifXAPjYl7zmygoFat6uz8bn8o7S2X
	06LBCKzkl3wrvNuDFyuzmbf68ucJmuLj1znF92aXMpKlU/JLf9B2ezOSSNK9wFg8oeD/Sqo2130
	q81yx9Or5kyRzVobOxg41IRKBlUDh1Ou33NkKm3JYQ+GSAPrL/xw7aljLdiMtSw1v1i771lf63c
	da5TPZid/MKYsAwzhgKpudkt9lHVo5nC8kf3V1/pYWGhimWAgE21PpraiY45fLPG9RB83+aQrZY
	mC8B7gJAuXQEOZNuOwoLZSsV9YX6wU9v7uvISIy73I3sRE35JJP4AtUXTGtmQsodfRoUZmX122n
	ixiMbwxgEzsGiXPQrBcWcIPgNsA68qjo5otgaYnR4ALVbqNOkWyPSHG6lqTUNT++4n2kk8cIqrA
	JB5SU=
X-Received: by 2002:a17:90b:570c:b0:3a8:2c7e:8986 with SMTP id 98e67ed59e1d1-3ae897c8820mr11559333a91.17.1793691715180;
        Mon, 02 Nov 2026 23:41:55 -0800 (PST)
Received: from [192.168.2.34] ([2403:581e:d87e:0:739f:50a5:e171:f133])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b07c903d0dsm2956769a91.12.2026.11.02.23.41.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Nov 2026 23:41:54 -0800 (PST)
From: James Calligeros <jcalligeros99@gmail.com>
Date: Tue, 03 Nov 2026 17:40:00 +1000
Subject: [PATCH v4 12/22] arm64: dts: apple: t8103-j313: Add
 speaker/headset jack nodes
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
Message-Id: <20261103-macaudio-v4-12-637484efe46d@gmail.com>
References: <20261103-macaudio-v4-0-637484efe46d@gmail.com>
In-Reply-To: <20261103-macaudio-v4-0-637484efe46d@gmail.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=2524;
 i=jcalligeros99@gmail.com; h=from:subject:message-id;
 bh=5HKyFCsuZAaYnH07XINXm4pOIg/VsCVnTKPu6wyChjU=;
 b=owGbwMvMwCV2xczoYuD3ygTG02pJDFkv+8+v45h1uUCPY0rCtPuamc+e3xb9dDx4p/h/1bLYQ
 4rqZ3v/d0xkYRDjYrAUU2TZ0CTkMduI7Wa/SOVemDmsTCBDpEUaGICAhYEvNzGv1EjHSM9U21DP
 0EjHWMeIgYtTAKaa5zgjwzPGSSEL1Dcw92rcS622su/eaLvyVK7rFWHex0oz5Rc3T2FkmHHyR8Y
 RlQduJ2s6U7+IJa5tnFLfq8544XXu+R17O25f4QUA
X-Developer-Key: i=jcalligeros99@gmail.com; a=openpgp;
 fpr=B08212489B3206D98F1479BDD43632D151F77960

The M1 MacBook Air integrates Apple-specific variants of the TI TAS2770
and Cirrus CS42L42. Add these nodes and advertise them to the machine
driver via the sound node.

Signed-off-by: James Calligeros <jcalligeros99@gmail.com>
---
 arch/arm64/boot/dts/apple/t8103-j313.dts | 85 ++++++++++++++++++++++++++++++++
 1 file changed, 85 insertions(+)

diff --git a/arch/arm64/boot/dts/apple/t8103-j313.dts b/arch/arm64/boot/dts/apple/t8103-j313.dts
index f8b2b1637b9d..36c47734a1dc 100644
--- a/arch/arm64/boot/dts/apple/t8103-j313.dts
+++ b/arch/arm64/boot/dts/apple/t8103-j313.dts
@@ -55,4 +55,89 @@ &typec1 {
 	label = "USB-C Left-front";
 };
 
+/* Audio codecs */
+&i2c1 {
+	status = "okay";
+
+	speaker_left: codec@31 {
+		compatible = "ti,tas5770l";
+		reg = <0x31>;
+		interrupts-extended = <&pinctrl_ap 182 IRQ_TYPE_LEVEL_LOW>;
+		shutdown-gpios = <&pinctrl_ap 181 GPIO_ACTIVE_HIGH>;
+		#sound-dai-cells = <0>;
+		sound-name-prefix = "Left";
+		ti,imon-slot-no = <0>;
+		ti,vmon-slot-no = <2>;
+	};
+};
+
+&i2c3 {
+	status = "okay";
+
+	speaker_right: codec@34 {
+		compatible = "ti,tas5770l";
+		reg = <0x34>;
+		interrupts-extended = <&pinctrl_ap 182 IRQ_TYPE_LEVEL_LOW>;
+		shutdown-gpios = <&pinctrl_ap 181 GPIO_ACTIVE_HIGH>;
+		#sound-dai-cells = <0>;
+		sound-name-prefix = "Right";
+		ti,imon-slot-no = <4>;
+		ti,vmon-slot-no = <6>;
+	};
+
+	jack_codec: codec@48 {
+		compatible = "cirrus,cs42l83";
+		reg = <0x48>;
+		VA-supply = <&jack_va_reg>;
+		VCP-supply = <&jack_vcp_reg>;
+		VD_FILT-supply = <&jack_vd_reg>;
+		VL-supply = <&jack_vl_reg>;
+		VP-supply = <&jack_vp_reg>;
+
+		interrupts-extended = <&pinctrl_ap 183 IRQ_TYPE_LEVEL_LOW>;
+		reset-gpios = <&pinctrl_nub 11 GPIO_ACTIVE_HIGH>;
+
+		#sound-dai-cells = <0>;
+		sound-name-prefix = "Jack";
+		cirrus,ts-inv = <1>;
+	};
+};
+
+/ {
+	sound: sound {
+		compatible = "apple,j313-macaudio";
+		model = "MacBook Air J313";
+
+		#address-cells = <1>;
+		#size-cells = <0>;
+
+		headphone-dai-link {
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
+
+		speaker-dai-link {
+			dai-tdm-idle-mode-0 = "zero";
+			dai-tdm-idle-mode-1 = "zero";
+
+			link-name = "Speakers";
+
+			codec {
+				sound-dai = <&speaker_left>, <&speaker_right>;
+			};
+
+			cpu {
+				sound-dai = <&mca 0>, <&mca 1>;
+			};
+		};
+	};
+};
+
 #include "hwmon-laptop.dtsi"

-- 
2.56.0

