Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.215.170
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793691802;
	b=EGu1kNhVxYfoFcRS7+i8PlRkoon+sUZvklLUHNzd2KQ4glGmTlgqR5xGXuta83LIgGww
	 5hgcuR21mFYFbxybfyWdakObej7SMGYr+4uoOEmQYRaIcXkH9c7QNMBdaPkamgZ/A/8e1
	 eb/sk1kxbHiwFxZjl9sJEpiz8NSw7AQsEL0k2Ak3fhOV2gVDjd8oYVsZlw30XNp3oT2/L
	 zgk/8/8jL4S5NPVNAUNkxaj176saHqYEMKfLeCSktLT7VV9E1WjuIJkJ6h/sViAwGiBHf
	 YcqZ+ecm/qeKKskQzpCdrbgSS9NKO4aeOCx4fchjLPO80S1o76RLDeN2WVatwDuAM8A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793691802;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key;
	bh=z65FbJFnjWHxVaxQI8JGYbEaf36adoL6Hch5QBpP1Jc=;
	b=vOiP4Ldaup0qtXTpgCOnuy0y6M9KvMPh6jKRvOm6DPsMQgFOj5WLq5ecWb6uzhXyYI17
	 csDewd5KiKhY5o56xIwn3C6icadie61RL0pkvNvA2psvDynsgdEs6NE9A/LQzqz0/Bmj7
	 hEeE7Ok0HkSomppbinnI1Tkh8sJmdBUT5P6gxiSUzgQZ//DUoPwZOLytb0qdaEbC9enTS
	 izavHVno7TkN14MvTa3uWe68LzJPiCgWaZ9IBYAGlxoJAq9XmrkoNdjhZm0oa9rgqcGoh
	 /cmPofmKAud/R6bLB/fGiibiBZJTc1i0SfQ9tGqDYjetUfUcLbAB37SK9QrZJtgLQJg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=JOMJs7wm;
	arc=none smtp.remote-ip=209.85.215.170
Received: from mail-pg1-f170.google.com (mail-pg1-f170.google.com [209.85.215.170])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 765B9606A32E
	for <devicetree@vger.kernel.org>; Tue,  3 Nov 2026 07:43:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 765B9606A32E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=JOMJs7wm
Received: by mail-pg1-f170.google.com with SMTP id 41be03b00d2f7-cdb2e0062bbso633284a12.1
        for <devicetree@vger.kernel.org>; Mon, 02 Nov 2026 23:43:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793691802; x=1794296602; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=z65FbJFnjWHxVaxQI8JGYbEaf36adoL6Hch5QBpP1Jc=;
        b=JOMJs7wm64L3SLWZU+8B/pCRUU08onnqAWFtbZGVHmVRi7yT6nH0gVq1sDd3yWBZsE
         y55EPlDsqqFNRCTrmYzAXT1Bsimojw7u0AurFUQvjEECf7k+Jv/lLUWIJ4WvBHpZlvQj
         bpQp1RG8cUlcN5qfwrovcIFq7DvoXiNJhbT/01mdLKHzHYtq1vNnTzfrUqlmD5InvfIM
         6UI17jZ9Irrb8B8Ht4f73SOYPNgYULsHeL1JOCwVGJHce/J9a0E7aUv5wMtRWpkHYUbs
         yeuqblaFBKOGT+bjB3pe0yzToWtSIqteNQM40kyBdO4TIp0lifCsjZ0QPZL03Ag7mo8/
         75KQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793691802; x=1794296602;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=z65FbJFnjWHxVaxQI8JGYbEaf36adoL6Hch5QBpP1Jc=;
        b=bSShz0aqLm/e7aQ2FvnWDNxBEmiuUXBNs5I0RVtYIyLKILQNfNxgqYjYvBQL1LaaOw
         UfEQ5HtaMa/1TTPmyoYugGJn87AjwAckK1aiWuiiTb0gocS5yfOBqOtBRcW9p3nHDL6a
         hiZLl7esmK42U/ffyK9mx9DoELQUNWiLAqdXHyp65/3Ngc2jcmAJICDHDhdDI70o8Uyc
         EXkTP9hKlJLJxiFre+5kd+xtFNnUm6anQm9zrOOT1sCixdLkAdk0tIUh2k0TDN55ZR4Y
         Av/0arIEBJhKGOKDibalMZrTI3L+3ZaKPqGLDDDoqWloET2xZOphMrqVo3tpVNYXjeHs
         Dn+A==
X-Forwarded-Encrypted: i=1; AKwUvBxm091yJwTsXiU15aXwqPluaXgDAtKiFP+LtYRh8ovnIH8l3SMnZqUofiaAqNA5FzV2yfNjYlryEuVS@vger.kernel.org
X-Gm-Message-State: APuU4Z/jntgt8luYFKIkUP4T3i297LXjzeI0NlTQjsgnew2zg5gnKyKL
	GUllqp9IsukVzo69FZlr0WZG5YGgNfFYfRqBxleTHf9q/iQU6WwPFs7K
X-Gm-Gg: AYBFou1h6W/KQvrhBxOxi7MKWxECc1LvwMUXCIXQ8sBx4J7uBHZ21WJZm04RZltQlwt
	eRSabfwr7J8rC2/vJ9tKoDJAB1aHasz9uIbvYLLxg4D6+Kt3pS57GqfNUNq/PtNupRnNIjOoCP5
	KUYdrBYsRvuAWN56qKHgh8rBVd/9I4OuWczOKh0YNCfiPdGC+v/oHGWN5HI/tx44s797LQLws64
	o4z8/fn0WNQF1U3JQGxpGAskp7BlccFhexNOvpkiCJrYNL2FDvlm67MIBmBlzcJyt1sVIFpQAcO
	JJ9brnOaXt86errGsBOT2qXqxfr26fCdD6QyO1xqd2R0G7SNB2w5iuJqmM2EBnGdJGTmstdwdbL
	pJGfrMiVDuqLqWj5gk9T3byJnTCjNJW/ARU5W7lI9wbt+Gj4p/5MSzzo9XROGiFBzl1ULwHIs9c
	CJrXjAnpSodvIHfu9FG1pcQgsZw0W68JzCpAEdVh3DM1JKUCV6/rmIhLs3LwpkliYWDmffiua5+
	V/JfDhotAbpbIoezqfBR7FuoKBRWjzM65B6uzKX1mutvlKDQRrRa+vLTOA27exyD9CWg+3XHyjK
	96zxfRK4wjSUrjH1df47ofu7Fz9ho87xClVuoku2X5C9H8wD5kOeHX0WXhuJI2dVPkpwAhbwQHg
	4L6sJajlHemlXW1usfJ5m0hQoVVHo0W/fF/ST99sEs95mQ+WI/CulWmfNLo+mHXqKXFmwfQmEHu
	1payU=
X-Received: by 2002:a17:90b:4c44:b0:3ad:9ecf:2b88 with SMTP id 98e67ed59e1d1-3ae897356e2mr9451595a91.19.1793691801674;
        Mon, 02 Nov 2026 23:43:21 -0800 (PST)
Received: from [192.168.2.34] ([2403:581e:d87e:0:739f:50a5:e171:f133])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b07c903d0dsm2956769a91.12.2026.11.02.23.43.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Nov 2026 23:43:21 -0800 (PST)
From: James Calligeros <jcalligeros99@gmail.com>
Date: Tue, 03 Nov 2026 17:40:10 +1000
Subject: [PATCH v4 22/22] arm64: dts: apple: t602x-j47x: Add
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
Message-Id: <20261103-macaudio-v4-22-637484efe46d@gmail.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=2528;
 i=jcalligeros99@gmail.com; h=from:subject:message-id;
 bh=Mpa6Lyvo5t3WwDhLa15s7MQvnpQJvZyAGw7Ghv9V1tE=;
 b=owGbwMvMwCV2xczoYuD3ygTG02pJDFkv+y/cXfot+mNMjqG8VQGnwRn3EyJWLF0yd4RXtmu/+
 PuK4dLTjoksDGJcDJZiiiwbmoQ8Zhux3ewXqdwLM4eVCWSItEgDAxCwMPDlJuaVGukY6ZlqG+oZ
 GukY6xgxcHEKwFT7czD895M+e0r0trTbnV0nPsxR/+sWH2Zbxmy//I3n/ESnsJq4dYwMZ+yOvLw
 gwH4mdKdQWcjzb8U8nGvO1fbvNZLOyU+ekd/KBwA=
X-Developer-Key: i=jcalligeros99@gmail.com; a=openpgp;
 fpr=B08212489B3206D98F1479BDD43632D151F77960

The M2 Pro/Max/Ultra Mac mini and Mac Studio integrate Apple-specific
variants of the TI TAS2764 and Cirrus CS42L42. Add these nodes and
advertise them to the machine driver via the sound node.

Signed-off-by: James Calligeros <jcalligeros99@gmail.com>
---
 arch/arm64/boot/dts/apple/t6020-j474s.dts      |  5 +++++
 arch/arm64/boot/dts/apple/t6021-j475c.dts      |  5 +++++
 arch/arm64/boot/dts/apple/t6022-j475d.dts      |  5 +++++
 arch/arm64/boot/dts/apple/t602x-j474-j475.dtsi | 10 ++++++++++
 4 files changed, 25 insertions(+)

diff --git a/arch/arm64/boot/dts/apple/t6020-j474s.dts b/arch/arm64/boot/dts/apple/t6020-j474s.dts
index e3c2635d84fa..f39697490365 100644
--- a/arch/arm64/boot/dts/apple/t6020-j474s.dts
+++ b/arch/arm64/boot/dts/apple/t6020-j474s.dts
@@ -46,4 +46,9 @@ &pcie0 {
 			<0x300 &pcie0_dart_3 1 1>;
 };
 
+&sound {
+	compatible = "apple,j474-macaudio", "apple,j473-macaudio";
+	model = "Mac mini J474";
+};
+
 #include "hwmon-mini.dtsi"
diff --git a/arch/arm64/boot/dts/apple/t6021-j475c.dts b/arch/arm64/boot/dts/apple/t6021-j475c.dts
index 9fe17f1f7f59..f8f776f9eb1e 100644
--- a/arch/arm64/boot/dts/apple/t6021-j475c.dts
+++ b/arch/arm64/boot/dts/apple/t6021-j475c.dts
@@ -36,4 +36,9 @@ &pcie0_dart_1 {
 	status = "okay";
 };
 
+&sound {
+	compatible = "apple,j475-macaudio", "apple,j375-macaudio";
+	model = "Mac Studio J475";
+};
+
 #include "hwmon-fan-dual.dtsi"
diff --git a/arch/arm64/boot/dts/apple/t6022-j475d.dts b/arch/arm64/boot/dts/apple/t6022-j475d.dts
index 32938a3bf96a..153899f1569b 100644
--- a/arch/arm64/boot/dts/apple/t6022-j475d.dts
+++ b/arch/arm64/boot/dts/apple/t6022-j475d.dts
@@ -73,3 +73,8 @@ &bluetooth0 {
 	compatible = "pci14e4,5f72";
 	brcm,board-type = "apple,canary";
 };
+
+&sound {
+	compatible = "apple,j475-macaudio", "apple,j375-macaudio";
+	model = "Mac Studio J475";
+};
diff --git a/arch/arm64/boot/dts/apple/t602x-j474-j475.dtsi b/arch/arm64/boot/dts/apple/t602x-j474-j475.dtsi
index 926bb4ab77af..7f1faefcf9bb 100644
--- a/arch/arm64/boot/dts/apple/t602x-j474-j475.dtsi
+++ b/arch/arm64/boot/dts/apple/t602x-j474-j475.dtsi
@@ -36,3 +36,13 @@ &hpm2 {
 &hpm3 {
 	interrupts = <44 IRQ_TYPE_LEVEL_LOW>;
 };
+
+&speaker {
+	interrupts-extended = <&pinctrl_ap 58 IRQ_TYPE_LEVEL_LOW>;
+	shutdown-gpios = <&pinctrl_ap 57 GPIO_ACTIVE_HIGH>;
+};
+
+&jack_codec {
+	interrupts-extended = <&pinctrl_ap 59 IRQ_TYPE_LEVEL_LOW>;
+	reset-gpios = <&pinctrl_nub 8 GPIO_ACTIVE_HIGH>;
+};

-- 
2.56.0

