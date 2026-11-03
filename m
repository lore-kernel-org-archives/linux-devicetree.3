Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.215.177
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793691794;
	b=MyuUTSPFy/FCKTJSIO/XQhqaIprknD39m9xFI3meVY2eNussyrf3q8cfcXRozCeMadPU
	 EEpCbr6qHmswgfKwvHV/Cf2U0WRQBw96zNCkILt3LtJREeOiMiRIXVzg7QZziRcPRsxTW
	 8lavAV/5qibke60brnh8vkxfzm8v43HrzE6B2jtj9CHU30Ev44obsxaxJ3YgO3qd3ZAYE
	 sEnUcA7uKJSG/DLSUvMMexgzdOd9UrT68xwVeUdhALabBQS16n7Y+qMXvcZmTU4cXBiDn
	 cu3OKrvCJ2NykKWCiQihSQx9LZTnetL9TTvw2REmCZ+RN9GOvAR6NLD1qQjyKBUguRQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793691794;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key;
	bh=60XJaMYLbT/o6HXjRlwFTyr3vUVptClPltCAojDk0R0=;
	b=VMga/JJc9PBbnKanhpFWpEaYCvtQ1rz72i46c9HtJwgl7EryTRhH3lc9cfA0BF2YGeyv
	 vvZCDQzhe0EuEqES/84vPgBm/cKHdiq+E3UWB9/nlrLkoZ7n4Ia5BfYzZlsf1ILyabc5W
	 nq+1osuDUQcPUW5EFGQXb3IusrHQjkkVBHPcMd+qgfIhOykbDzS4lItwSD1An3w6cuwvr
	 6G7LpdXlU4FWkmfC+JkT6TzIL9bZTBDVWsPr7+ImMnM1/uinHLx2vJ9H6pEfuCuU6jLuY
	 Fy8TP+K/TDEIsYmQmUSGC2cohIDqR0Xm2+d/Bbolbuem5NDTwXBVP1+pAmc3rmRr8oQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	arc=none smtp.remote-ip=209.85.215.177
Received: from mail-pg1-f177.google.com (mail-pg1-f177.google.com [209.85.215.177])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C32FB606A329
	for <devicetree@vger.kernel.org>; Tue,  3 Nov 2026 07:43:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C32FB606A329
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pg1-f177.google.com with SMTP id 41be03b00d2f7-cd6acc50b8dso1382194a12.3
        for <devicetree@vger.kernel.org>; Mon, 02 Nov 2026 23:43:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793691793; x=1794296593; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=60XJaMYLbT/o6HXjRlwFTyr3vUVptClPltCAojDk0R0=;
        b=n4zKvvA2Ks462iJH3QATVJq4VUjpdSMQ89hWNHewVHAINcRR7rmjNVms0wzU1dX+Sz
         zEOa/1Ax2FtAcTiEqXlJI4bAMi0dOxnBo5jRYahFg3hGPtzg7qGeLesAa8F5+enPTLWE
         rRv7KBgOYQJzjTkuNF8ibN8H5TlJA/FJ8sRVKoM2XIjFMebSHvAgGl/X9xCoH1DoxD4y
         MqafcXTFWDLWI23P/zm9l8jeL2Wn02qYUpx6qVq81UKjk+CU1SVCzopQInRcR5vFIdy7
         4aTtlrRJ5/8uMKXCBWsAF/GE+Eut1UyqAqHIEQncVT5i3O3Sfu23P+NSg9+a/tJfwUN1
         V5JQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793691793; x=1794296593;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=60XJaMYLbT/o6HXjRlwFTyr3vUVptClPltCAojDk0R0=;
        b=k0qpWp4tX4dxfYTVu8o0f5YXm9Sq20xOZkaMGelraQJSDK+QAhKrbg+NnEoglTD3rY
         lghkZpWDOn9rVPLxorxMG+L7KEXpy7UTd1lxdP7/FcmsF+oSiqpFue08egfqhhrTeViY
         6QQBM7/30F4WVJjiNVJb+yOWYSwf9dFjO/EA91cotZHOxUTwy27uCAwao8N3hhno45Kw
         YZSvpko5Db7QaN1gxh3t+IgAUAo40klaQPpgB0pKtWH+KNk9I9yxaV4ik4fbhVdIsalF
         wdpmpGP5WQ0mFl2WT+y3pwg55L7nQPzI1TkKPUAnGW5lpy6wwjKuBplgIfXx8QCo3CWS
         H/MA==
X-Forwarded-Encrypted: i=1; AKwUvBzuBHeSwL4vNFpFSAN4JL3sZUoRW04Gji5CJFFptCHe3PFM0SgY1mI17Gq7Hop5XspnswwladOYTxUW@vger.kernel.org
X-Gm-Message-State: APuU4Z/a0KX7uV7DF36GY2JHEMENyKW+uJI81UaV8HmZrWjq1W44nZLa
	KCtlv8ByT4KXweRxqP84X8u2NCmNq4EHd2ALiVKd2y8xQUmAfvfFtKc6
X-Gm-Gg: AYBFou3PfMCxUFEJiB/6wzBV9msfEu+01L+9G3ouo5LvR7z+WbjlZAOYsjM+ziJ0qaY
	YCEoU38u+iROohUZEEaxuHk6mIUCEJtXrEVK1tPpnwkOH5yRSzrjbLAJWNomSnXHUNHgG/cKOE+
	cOtSpy36QEqRHrg3VmL8pw/uhRiL6338dWNJz6fSiPAzq6IYlhsYna6UGUdbYF3zg6nccinOg0+
	lNLHMfxxyy4E5N5Ztbk+KFyPfqR9GsGMDWFjKIya3a4oZF323MNN7+WGSR88znqe3rwiaW/UyIA
	zd2jOSGPXiPY7vUvhiRZTtYzyhNWXj0wMVaFLVKpR1ZzaCyqNAqaDNvrfD9fxKrWZ3hmW1Ht4X6
	UIf9ObZ8tuXAcspTCUI/OPMizTt4dnhlQLn3bSiif15VT7QB/paKV9pNPQ0IzPrwns14dVq95Oq
	+RWK/8UOg6yFhu4l2kIcGhHYq0BJRtTnUGzMC9B+PsVQb5QmxSWSAASqYcG4jy0EZkihbfB+xQF
	Vz37baSxtZPv+d5Ah8QXAhb9VF7NMMl294gNiZE906sNKqN10VDcX+reKfEe2tCbg93bQe6Cgt1
	Qa3zdkBSXVufbtj1oCoF83K1RxygsK82r6UdF4q7h5QUf9/z5PMrb9IJx5hN5QfcXr04rL3FSmn
	tDVswKFFgmKVrBj2rfvl7S5Ue640ES4yX1rlMN4w33mxObbUXLg1eqWokonVktnmWGjp1MaCBCb
	G5Ddubw/tQ5lAmsfw3SujQwkv0
X-Received: by 2002:a17:90b:17cb:b0:3ac:9ed8:f309 with SMTP id 98e67ed59e1d1-3ae89736030mr10686171a91.29.1793691793151;
        Mon, 02 Nov 2026 23:43:13 -0800 (PST)
Received: from [192.168.2.34] ([2403:581e:d87e:0:739f:50a5:e171:f133])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b07c903d0dsm2956769a91.12.2026.11.02.23.43.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Nov 2026 23:43:12 -0800 (PST)
From: James Calligeros <jcalligeros99@gmail.com>
Date: Tue, 03 Nov 2026 17:40:09 +1000
Subject: [PATCH v4 21/22] arm64: dts: apple: t602x-j41x: Add
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
Message-Id: <20261103-macaudio-v4-21-637484efe46d@gmail.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=3735;
 i=jcalligeros99@gmail.com; h=from:subject:message-id;
 bh=Y5xIM4BZ0PHyivynw40OAddi1sDRIGnERSTTSJ+mmxQ=;
 b=owGbwMvMwCV2xczoYuD3ygTG02pJDFkv+y9wRso3TUh9auS6Msk2fH98Z+jd93PUc9fpqf65K
 rjLdKdTx0QWBjEuBksxRZYNTUIes43YbvaLVO6FmcPKBDJEWqSBAQhYGPhyE/NKjXSM9Ey1DfUM
 jXSMdYwYuDgFYKqNRBgZ/l1zC6o+0FBrukKdT0arUvvX43dRzcYnMjyW5bUY1ApOZ/jFXCG+ve/
 1Wrd0w8Dr8vOtLfWkeWfWpr8tnvh/bZh6Ix8jAA==
X-Developer-Key: i=jcalligeros99@gmail.com; a=openpgp;
 fpr=B08212489B3206D98F1479BDD43632D151F77960

The M2 Pro/Max MacBooks  integrate Apple-specific variants of
the TI TAS2764 and Cirrus CS42L42. Add these nodes and advertise
them to the machine driver via the sound node.

Signed-off-by: James Calligeros <jcalligeros99@gmail.com>
---
 arch/arm64/boot/dts/apple/t6020-j414s.dts      |  5 ++++
 arch/arm64/boot/dts/apple/t6020-j416s.dts      |  5 ++++
 arch/arm64/boot/dts/apple/t6021-j414c.dts      |  5 ++++
 arch/arm64/boot/dts/apple/t6021-j416c.dts      |  5 ++++
 arch/arm64/boot/dts/apple/t602x-j414-j416.dtsi | 35 ++++++++++++++++++++++++++
 5 files changed, 55 insertions(+)

diff --git a/arch/arm64/boot/dts/apple/t6020-j414s.dts b/arch/arm64/boot/dts/apple/t6020-j414s.dts
index 631c54c5f03d..2df6a39c719d 100644
--- a/arch/arm64/boot/dts/apple/t6020-j414s.dts
+++ b/arch/arm64/boot/dts/apple/t6020-j414s.dts
@@ -24,3 +24,8 @@ &wifi0 {
 &bluetooth0 {
 	brcm,board-type = "apple,tokara";
 };
+
+&sound {
+	compatible = "apple,j414-macaudio", "apple,j314-macaudio";
+	model = "MacBook Pro J414";
+};
diff --git a/arch/arm64/boot/dts/apple/t6020-j416s.dts b/arch/arm64/boot/dts/apple/t6020-j416s.dts
index c277ed5889a2..7f3f0d6eee87 100644
--- a/arch/arm64/boot/dts/apple/t6020-j416s.dts
+++ b/arch/arm64/boot/dts/apple/t6020-j416s.dts
@@ -24,3 +24,8 @@ &wifi0 {
 &bluetooth0 {
 	brcm,board-type = "apple,amami";
 };
+
+&sound {
+	compatible = "apple,j416-macaudio", "apple,j316-macaudio";
+	model = "MacBook Pro J416";
+};
diff --git a/arch/arm64/boot/dts/apple/t6021-j414c.dts b/arch/arm64/boot/dts/apple/t6021-j414c.dts
index cdcf0740714d..ec4050ec0ecf 100644
--- a/arch/arm64/boot/dts/apple/t6021-j414c.dts
+++ b/arch/arm64/boot/dts/apple/t6021-j414c.dts
@@ -24,3 +24,8 @@ &wifi0 {
 &bluetooth0 {
 	brcm,board-type = "apple,tokara";
 };
+
+&sound {
+	compatible = "apple,j414-macaudio", "apple,j314-macaudio";
+	model = "MacBook Pro J414";
+};
diff --git a/arch/arm64/boot/dts/apple/t6021-j416c.dts b/arch/arm64/boot/dts/apple/t6021-j416c.dts
index 6d8146b94170..0037346959a5 100644
--- a/arch/arm64/boot/dts/apple/t6021-j416c.dts
+++ b/arch/arm64/boot/dts/apple/t6021-j416c.dts
@@ -24,3 +24,8 @@ &wifi0 {
 &bluetooth0 {
 	brcm,board-type = "apple,amami";
 };
+
+&sound {
+	compatible = "apple,j416-macaudio", "apple,j316-macaudio";
+	model = "MacBook Pro J416";
+};
diff --git a/arch/arm64/boot/dts/apple/t602x-j414-j416.dtsi b/arch/arm64/boot/dts/apple/t602x-j414-j416.dtsi
index 0e806d8ddf81..852fbcd6277a 100644
--- a/arch/arm64/boot/dts/apple/t602x-j414-j416.dtsi
+++ b/arch/arm64/boot/dts/apple/t602x-j414-j416.dtsi
@@ -43,3 +43,38 @@ &wifi0 {
 &bluetooth0 {
 	compatible = "pci14e4,5f72";
 };
+
+&speaker_left_tweet {
+	interrupts-extended = <&pinctrl_ap 58 IRQ_TYPE_LEVEL_LOW>;
+	shutdown-gpios = <&pinctrl_ap 57 GPIO_ACTIVE_HIGH>;
+};
+
+&speaker_left_woof1 {
+	interrupts-extended = <&pinctrl_ap 58 IRQ_TYPE_LEVEL_LOW>;
+	shutdown-gpios = <&pinctrl_ap 57 GPIO_ACTIVE_HIGH>;
+};
+
+&speaker_left_woof2 {
+	interrupts-extended = <&pinctrl_ap 58 IRQ_TYPE_LEVEL_LOW>;
+	shutdown-gpios = <&pinctrl_ap 57 GPIO_ACTIVE_HIGH>;
+};
+
+&speaker_right_tweet {
+	interrupts-extended = <&pinctrl_ap 58 IRQ_TYPE_LEVEL_LOW>;
+	shutdown-gpios = <&pinctrl_ap 57 GPIO_ACTIVE_HIGH>;
+};
+
+&speaker_right_woof1 {
+	interrupts-extended = <&pinctrl_ap 58 IRQ_TYPE_LEVEL_LOW>;
+	shutdown-gpios = <&pinctrl_ap 57 GPIO_ACTIVE_HIGH>;
+};
+
+&speaker_right_woof2 {
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

