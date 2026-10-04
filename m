Received: from mail-pj2-f40.google.com (mail-pj2-f40.google.com [74.125.227.168])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8A9613F4DD2
	for <devicetree@vger.kernel.org>; Sun,  4 Oct 2026 06:05:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.168
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791093956; cv=none; b=FWszDzrNyQjK1fAkCXsRgoK3uspe6KgqsGqPmG5XoYCxVAnYjFw+vUg7CZO0oUXRWlixEDq0ssxmoGq3HvxjDPeNLP6Fcmzj/wAhUZ+vDDiLk5XSbG94RnM+j3wjUjW6J/Tyu1mPDyggV2XhMz17UKZ7yIpZ72XoIETlvtr3Zg8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791093956; c=relaxed/simple;
	bh=YcqdYPkEPgiJniI3m1/5Z4GxljDKdHVHbbdhKHfnQAU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=iU9caLsyzfhe+MQ+Qa15IqRFH7vlfVAo8vXSVHsKf7hfC3Vhmm8iUtux8m05D892YpWgfDT3T2/esmSJ9rNDPedERXyQU+/wwoup+Hl4xkPBFrbI6Fa5OxIyGVKwA48GdgCkkrzq7FHmS80Owy6nbN1jGfmYZv+Z0MEtxjA1hhQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=S2GRdQRk; arc=none smtp.client-ip=74.125.227.168
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="S2GRdQRk"
Received: by mail-pj2-f40.google.com with SMTP id 98e67ed59e1d1-3a0eeda3e03so270841a91.1
        for <devicetree@vger.kernel.org>; Sat, 03 Oct 2026 23:05:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791093953; x=1791698753; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=X5SKZmWzqnGYCKYVWh4hl4aFlpfm+yAAED38A57h1ak=;
        b=S2GRdQRkuM3/+XF71ucv30FSSWIrTmegQhcT19Z/COjnrjiPWHEr7bN/A9TtfUdj7T
         uFSXAmEcLrRYy6m8jQqlaOVIbUMPB1mt/SXnIxzl9HT9pXjpSkp6hknGb1zTm4yjCZOf
         b0M9Ai0WAaMUiyJ5HdSHm7fOO05p+4CA8ASssIWKTfufewrrwSGphVSjOUxvs6BmIj9C
         bhOeOmkdRVaMxkQ+P5eckdV1JJWH2CiL2c7jUlvuYkmnSsoeHkgD6psMphIleQ2rZRxZ
         PzpmUb0Mu9DX3BZ7AEnDTOVOs0eiV4vXZw5X3iBzKFPQfBSH45KOS2kBh399hSd8qbxm
         dVqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791093953; x=1791698753;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=X5SKZmWzqnGYCKYVWh4hl4aFlpfm+yAAED38A57h1ak=;
        b=2GqBWTjkWV0uyeapUQLFdVMeOoBks21ArWpsq/CmyvY2E5gFC+61h3cHCxuDLEf4w5
         qKxZc0LX5SPceJgAYZHXoszNvyH5BhqC+e6R+2wLnAhzpmdvU48rHc/CP6GPipam89J/
         41RTA7bwvvi6xC3PN8+hDzM4Aizizm1jEbMYBG/fIx+UYUKqUD30qI1i8qv+9OagjxYk
         CkxMYqFSKIohK+tIuUsrzhk7NO6TzZRqqAP+WU8Qig4Y5OLuJDGqobpOU0v/JafPGSnc
         fzK1UouDUt79gzww9oP32msp8Vg/XgtY7M5nCoJSTFaZPKITl/zq3WUitUnRPVCSBp+M
         GpIg==
X-Forwarded-Encrypted: i=1; AKwUvBz2SEMQ24WFjYNhmVE5YkHJt/VcjxuPgbXSgZZSdFiYqQ0Nm5wT/0LP3aXQ0sqbo6Rv3+iAikRsCoeJ@vger.kernel.org
X-Gm-Message-State: AFq9FYKDTbaVsPZc26PiZ/5eJZjg7CVx27yexu7HwdlhGVMSrZddXLjy
	vAxf8hfvkWU+IKXBk3dV4+muFy57h6L5OeDpUeRxwZmzXxTGd3d4USwb
X-Gm-Gg: AYBFou1z1pbRUdFt2Pws8GFMFnNE6IuYQFZfB7/4eQ+oMJdQfmEQkzqFa4UFZ5cAyL8
	XJdEpUdrQyeq2kEsM13MCwcRheeV+UvCqIJMzlSEZ3hDStyAKc8bnVCAdkwvPSIogKoL6wdL2wS
	tN+hWN+74Jb66mQbfXsKJvr0meNw4/+ZwWQRvstCEZheI3UUILbmR53qcT0hSYDRfOwXZ428Bn1
	jrDp0g8fxRHHwjF1iOptYpdSmRrWc73FkiaGgdNDdT4eBeaN0HVCiFpsB9WJbMlPNCqBzAmYtcP
	HK5gAcNrlSoVjvodojD0ffOq5kW7fNgWa8xXqVvJUlRIwkz44yTcZnMBNpuxRBGMjJIm/BniB2o
	MsFjoT+a/jLvFVfXXwBDWgke3uIyu7JiMAU85dVO8t59SVT6RYeRvunEAN+QiBj/bPMZXIz8WTu
	BpAfalYqYYUxdAQRyo4O40Ht8txfG6+UGmlxATf4/oYKuHaqalt9XOxVwQRbi4MFHfHwuX4yw9c
	QMN3PG2HCk0JD09oLHFIc0CD2jMRRC2+bbq7zjuUye5GxA5HvBDavoXySXXHQeLbSBbvVYMNDI4
	HVzAmY3qES0g8olCmMXuqqkPn5/smXQGkhoRRvQ5XtzUq4I=
X-Received: by 2002:a17:90b:39b0:b0:3a4:c8d2:6c2c with SMTP id 98e67ed59e1d1-3a6ce845d78mr2965260a91.49.1791093952798;
        Sat, 03 Oct 2026 23:05:52 -0700 (PDT)
Received: from [192.168.2.3] ([2403:581e:d87e:0:fc2d:ed31:e80e:412d])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3a78d4a869esm5844094a91.2.2026.10.03.23.05.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 03 Oct 2026 23:05:52 -0700 (PDT)
From: James Calligeros <jcalligeros99@gmail.com>
Date: Sun, 04 Oct 2026 16:03:37 +1000
Subject: [PATCH v2 10/21] arm64: dts: apple: t8103-j274: Add
 speaker/headset jack nodes
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261004-macaudio-v2-10-7b47ed6335a8@gmail.com>
References: <20261004-macaudio-v2-0-7b47ed6335a8@gmail.com>
In-Reply-To: <20261004-macaudio-v2-0-7b47ed6335a8@gmail.com>
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
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1879;
 i=jcalligeros99@gmail.com; h=from:subject:message-id;
 bh=YcqdYPkEPgiJniI3m1/5Z4GxljDKdHVHbbdhKHfnQAU=;
 b=owGbwMvMwCV2xczoYuD3ygTG02pJDFkH3+QWXGpdu8z133+eZ64Lnup8sujus3zwc7tQzqf9Y
 uuKT+Ws7pjIwiDGxWAppsiyoUnIY7YR281+kcq9MHNYmUCGSIs0MAABCwNfbmJeqZGOkZ6ptqGe
 oZGOsY4RAxenAEw1Cwsjw06nGQ5barf4Td6WU/r7ituvn5LT5msFFjB0rn1gLbuwazsjw+w1bTU
 7D/Zd69RfL6+UNX937tHpsh2djX+uCe0/ZhtfwgQA
X-Developer-Key: i=jcalligeros99@gmail.com; a=openpgp;
 fpr=B08212489B3206D98F1479BDD43632D151F77960

The M1 Mac mini integrates Apple-specific variants of the TI TAS2770
and Cirrus CS42L42. Add these nodes and advertise them to the machine
driver via the sound node.

Signed-off-by: James Calligeros <jcalligeros99@gmail.com>
---
 arch/arm64/boot/dts/apple/t8103-j274.dts | 67 +++++++++++++++++++++++++
 1 file changed, 67 insertions(+)

diff --git a/arch/arm64/boot/dts/apple/t8103-j274.dts b/arch/arm64/boot/dts/apple/t8103-j274.dts
index 1212852251e0..6121e3a89a0f 100644
--- a/arch/arm64/boot/dts/apple/t8103-j274.dts
+++ b/arch/arm64/boot/dts/apple/t8103-j274.dts
@@ -75,4 +75,71 @@ &i2c2 {
 	status = "okay";
 };
 
+/* Audio codecs */
+&i2c1 {
+	status = "okay";
+
+	speaker: codec@31 {
+		compatible = "ti,tas5770l";
+		reg = <0x31>;
+		interrupts-extended = <&pinctrl_ap 182 IRQ_TYPE_LEVEL_LOW>;
+		shutdown-gpios = <&pinctrl_ap 181 GPIO_ACTIVE_HIGH>;
+		#sound-dai-cells = <0>;
+		ti,imon-slot-no = <0>;
+		ti,vmon-slot-no = <2>;
+	};
+};
+
+&i2c2 {
+	status = "okay";
+
+	jack_codec: codec@48 {
+		compatible = "cirrus,cs42l83";
+		reg = <0x48>;
+		interrupts-extended = <&pinctrl_ap 183 IRQ_TYPE_LEVEL_LOW>;
+		reset-gpios = <&pinctrl_nub 11 GPIO_ACTIVE_HIGH>;
+		#sound-dai-cells = <0>;
+		sound-name-prefix = "Jack";
+		cirrus,ts-inv = <1>;
+	};
+};
+
+/ {
+	sound: sound {
+		compatible = "apple,j274-macaudio";
+		model = "Mac mini J274";
+
+		#address-cells = <1>;
+		#size-cells = <0>;
+
+		dai-link@0 {
+			reg = <0>;
+
+			link-name = "Speaker";
+
+			codec {
+				sound-dai = <&speaker>;
+			};
+
+			cpu {
+				sound-dai = <&mca 0>;
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
 #include "hwmon-mini.dtsi"

-- 
2.55.0

