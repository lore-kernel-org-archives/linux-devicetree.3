Received: from mail-pz2-f40.google.com (mail-pz2-f40.google.com [74.125.228.40])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 93C94403B0C
	for <devicetree@vger.kernel.org>; Sun,  4 Oct 2026 06:06:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.40
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791093985; cv=none; b=pQhHn3GwYwHEY6F627we8Yk5ZivtSVrO2vMuCldjCtcXkwXdZTs8iCk5hMl1jzKDQL8m7ECkjALlm6M8ldX+Z1nsrvP5MA4LF9Nc4vGQqhn37o9kE6AkMs1q2hEZLGI/tlSg4Z2p+/HARCMU1Wo9XTMwPNelu3/q8CKBi+tBpvE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791093985; c=relaxed/simple;
	bh=vCW3fxOJkBinIg7sVkVmqG3Z3g/7JrWUIeRSo8E+Iow=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=UTW3Fz5iDw6vzTFMQrf3oHT6Y+QpTaP8hCACUMpfW6a1RoyBbtW1+HQgwa940cBPNzbLjcQdjDPv9DlwS2RCKht6ifzQUBBqM0+ajqRXhvmuRqKh5R8JhZrl9MItbRkJNXo54ICkrYiUZc5vFDfnPymPShuUqnX609cKA38Zo9o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=nUrsrtDG; arc=none smtp.client-ip=74.125.228.40
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="nUrsrtDG"
Received: by mail-pz2-f40.google.com with SMTP id 41be03b00d2f7-cc74520b20bso117919a12.1
        for <devicetree@vger.kernel.org>; Sat, 03 Oct 2026 23:06:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791093983; x=1791698783; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=CEEmgDILRhIEA8VUTy7J3z7No/+m/NGeZn0Fr0Kfpew=;
        b=nUrsrtDGSiP1gQAIn0AwZS0pInp7oE5bv+SJ5RWRxuLuPsu6BMcRq/MSXWrvNUhLVe
         M9tgGOA/9gXmrUTix4rKue/MNPlOlVFmp9EhXYMHHiw2/zIzWHZ7vlS2/JZKptFO/pvS
         TmA74Vnj7nGjvZuVbqdhtEb9HL81N1mqRtbg1DEcrKKjT1zETVDUjkQ9UP6tlMp6Alvg
         z8fS45XX+G+VC3RYUNou5PIlqp3C8janpdanIdIzuEyfVEmHbkPI5/4AB50MxnJHgiTI
         juaXrlRFVtDqIT1wcCjcOhnjBOiSgKmN14HCFzF/lnQIamhMtY/KoyimgYZGOqMEECSJ
         9G5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791093983; x=1791698783;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=CEEmgDILRhIEA8VUTy7J3z7No/+m/NGeZn0Fr0Kfpew=;
        b=MuEKuo805EOQ1mOPtgZlibx9bcd3hAhkfBs0WfCjInUkWOJgNXnxx2GdqA3tmvCUzg
         c7ia4oK17a7hKcMW6cuMLBDabOdVEwjMj2qH/5mmkNV0urSV+M20YcRbosYK7f5EnwHA
         1oQpAZ3c6d5pQ2lYNcVfgfAo8GWhUpYfVZY4cwMhEaR47RwWvPw1oOTTLxVZtyopAADB
         Qd1kdpn2G2ZpjaMRqwhM87D679kZPtLjiTA04Lg2UOX8CKlqivlKLUKpdmpgZ9y4CR7S
         ZZMtoXrDOOITKjprYaPuuwv2IZEy7kAuZqmpmI04UeOTnqQlhHaim7gmRhV1ZmUQl7Mt
         crNQ==
X-Forwarded-Encrypted: i=1; AKwUvBz3KAeTkkn19sJUnRZXzJkAAJnvEBoNhWrn7fw0MekuYsXdn2JCMquLPY6uaHoWXtZAfFqkoejLbgNg@vger.kernel.org
X-Gm-Message-State: AFq9FYKQS+9SwHCcoRbJuWGhqSOTA0seCr6w9aTbL7AZfY+yQdJMmE6v
	ElBZE+HghMzR2Ff8W4U+U16o+aDKJvCh3gNTwkkg6EE87wE7GvMAPXfY
X-Gm-Gg: AYBFou1VhcoYTfvqIVXwvAcGmEQfrESUCb4xeEi55oHlSSdELwFROLWdNAJ+gQcLnde
	9OK6tubi1KfcICIwP7zHFTZJVBYA23QK/V+IDlrhIdCn50yrsEN/uitvTGibZuRZgwP2RJL29Lu
	wj9WPXV9D2nCJxNLswWX8jryxl1XdavYE+gHgCKd+mu2koS2j6HM3up15ZJvTlKDlzJOXG5Kse1
	gWGA4Yoljp61xB57Fjw0lfh8CLGWromfN0TdI2buk9mfKz+9tLNZm4sJzov8IC37lJi3ddSI2fz
	skkRsi23Lp6QM/FhU9K4fOOawr+LhlNiEajWWotUVr3znwyvZyv0zaKU5UvCygAeU/1pcy9yUyA
	dwXjLFnPPfEH8PjeAo1gNqZH7UylgOfXAOq/5tcRE49HdIUsQKY/aHCHkrXsIK48hGPkeuy57Yj
	mv+cojigY+R8WcdIePhiemO+wd/28gua3vuMf5Rsh2OB9qfLoQJrNgYSy7/GL7A4LYsF87QF0/X
	/krgtZm4VS+Q1CxQt7Ev7PCdn2Y+MgEIXUyELDde/vrUr9OTX7xXwPedlbbBrzXjOqucfhdRFde
	NC6yUbMasqO9V5aVJO21MWTq9BCnMc/aTjSuWToG0qP5pwwn
X-Received: by 2002:a17:90b:6c7:b0:3a0:cca0:4a8c with SMTP id 98e67ed59e1d1-3a6ce97d00bmr4272307a91.7.1791093982802;
        Sat, 03 Oct 2026 23:06:22 -0700 (PDT)
Received: from [192.168.2.3] ([2403:581e:d87e:0:fc2d:ed31:e80e:412d])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3a78d4a869esm5844094a91.2.2026.10.03.23.06.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 03 Oct 2026 23:06:22 -0700 (PDT)
From: James Calligeros <jcalligeros99@gmail.com>
Date: Sun, 04 Oct 2026 16:03:41 +1000
Subject: [PATCH v2 14/21] arm64: dts: apple: t8112-j413: Add
 speaker/headset jack nodes
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261004-macaudio-v2-14-7b47ed6335a8@gmail.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=3207;
 i=jcalligeros99@gmail.com; h=from:subject:message-id;
 bh=vCW3fxOJkBinIg7sVkVmqG3Z3g/7JrWUIeRSo8E+Iow=;
 b=owGbwMvMwCV2xczoYuD3ygTG02pJDFkH3+St/vRVrMtqLbPodA5vI7HnVZnR2lXxE8IMjM63n
 tA9emBFx0QWBjEuBksxRZYNTUIes43YbvaLVO6FmcPKBDJEWqSBAQhYGPhyE/NKjXSM9Ey1DfUM
 jXSMdYwYuDgFYKrzyhn+Suj37xTkrZ/kZvugg6exaKKM1GzuW+kn/x3XqStTmeaiwMjwW+Ny+45
 Gp/tbjzlvfpLv9djH+or04+zeuD/CTjX7/zzkAAA=
X-Developer-Key: i=jcalligeros99@gmail.com; a=openpgp;
 fpr=B08212489B3206D98F1479BDD43632D151F77960

The M2 MacBook Air integrates Apple-specific variants of the TI TAS2764
and Cirrus CS42L42. Add these nodes and advertise them to the machine
driver via the sound node.

Signed-off-by: James Calligeros <jcalligeros99@gmail.com>
---
 arch/arm64/boot/dts/apple/t8112-j413.dts | 108 +++++++++++++++++++++++++
 1 file changed, 108 insertions(+)

diff --git a/arch/arm64/boot/dts/apple/t8112-j413.dts b/arch/arm64/boot/dts/apple/t8112-j413.dts
index 7ccfceb08093..5f8768832e1e 100644
--- a/arch/arm64/boot/dts/apple/t8112-j413.dts
+++ b/arch/arm64/boot/dts/apple/t8112-j413.dts
@@ -92,4 +92,112 @@ &fpwm1 {
 	status = "okay";
 };
 
+/* Audio codecs */
+&i2c1 {
+	status = "okay";
+
+	speaker_left_woof: codec@38 {
+		compatible = "ti,sn012776";
+		reg = <0x38>;
+		interrupts-extended = <&pinctrl_ap 11 IRQ_TYPE_LEVEL_LOW>;
+		shutdown-gpios = <&pinctrl_ap 88 GPIO_ACTIVE_HIGH>;
+		#sound-dai-cells = <0>;
+		sound-name-prefix = "Left Woofer";
+		ti,imon-slot-no = <0>;
+		ti,vmon-slot-no = <2>;
+	};
+
+	speaker_left_tweet: codec@39 {
+		compatible = "ti,sn012776";
+		reg = <0x39>;
+		interrupts-extended = <&pinctrl_ap 11 IRQ_TYPE_LEVEL_LOW>;
+		shutdown-gpios = <&pinctrl_ap 88 GPIO_ACTIVE_HIGH>;
+		#sound-dai-cells = <0>;
+		sound-name-prefix = "Left Tweeter";
+		ti,imon-slot-no = <8>;
+		ti,vmon-slot-no = <10>;
+	};
+};
+
+&i2c3 {
+	status = "okay";
+
+	speaker_right_woof: codec@3b {
+		compatible = "ti,sn012776";
+		reg = <0x3b>;
+		interrupts-extended = <&pinctrl_ap 11 IRQ_TYPE_LEVEL_LOW>;
+		shutdown-gpios = <&pinctrl_ap 88 GPIO_ACTIVE_HIGH>;
+		#sound-dai-cells = <0>;
+		sound-name-prefix = "Right Woofer";
+		ti,imon-slot-no = <4>;
+		ti,vmon-slot-no = <6>;
+	};
+
+	speaker_right_tweet: codec@3c {
+		compatible = "ti,sn012776";
+		reg = <0x3c>;
+		interrupts-extended = <&pinctrl_ap 11 IRQ_TYPE_LEVEL_LOW>;
+		shutdown-gpios = <&pinctrl_ap 88 GPIO_ACTIVE_HIGH>;
+		#sound-dai-cells = <0>;
+		sound-name-prefix = "Right Tweeter";
+		ti,imon-slot-no = <12>;
+		ti,vmon-slot-no = <14>;
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
+		compatible = "apple,j413-macaudio";
+		model = "MacBook Air J413";
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
+				sound-dai = <&speaker_left_woof>,
+					    <&speaker_left_tweet>,
+					    <&speaker_right_woof>,
+					    <&speaker_right_tweet>;
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

-- 
2.55.0

