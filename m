Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.45
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793691768;
	b=AejUbq6V4pGg6ej1N3jj3p92gcd+6Ay7pyjcK/2dWcdBLpuOqSAJySzI/Si8KTinl0mj
	 9dNNUfZ2lmQ1nCaI0wBZlUESLOq+eEBgKFwdm2PEDouilx3Rmwq6nQfyaNGn0C0IjVGTG
	 ldmOvXSZvnNLvDIemHOo9vXIySLuZjwzDBbGDHfDPG+TChl6lKHA5WrQdscdVsqQNzvU1
	 QEVzZi4W86oZb/mzdML3XXL3wHniNYuPoVLAfnRTvmGLGEBznT5PXdS3cg/gmB8RKCou+
	 XS3zkAdCrf9Y71BI6r57tSuZUTzS5LgYvNHb7HfRy/qGTC0hjtYuqJODWzx4TDcTuEw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793691768;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key;
	bh=sZetKM+Ta3nWU+g4aVmYGtlY4mbrOL38eozs+DIfj3o=;
	b=ZekpLoHeqwZS2bQ855Zrx7rfe3uydM7b3OVCxf2GDLKNahH+tLF8lU2k42+3ljS1hw4P
	 lDYmBAzHRUAdvQeLYsvJ7zkagVjfUKYz+yYnqWSRTJRRoz+QdzTxDfo8Bt2AHDC5FE9n6
	 IlrfppIASdN+FheuLdaAyBX88h94XFW9XlEZXPi7aFHq7qhnnk0BpNAV8RrTgYUQvJBZm
	 SMHCcbGJ7e6txwDRoh3EZXxJt/cTV3v2dYr9Osh5BkBkEx9Tu3TzjONiEQC8Rnx2X2Gxl
	 i3Mdz3PnuWXo+e9Jt/m2qrwRl0MynTuO+/zIKNOy+YRE6F+nbLLmyenOYqdGHPOSWGA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=V3bqAphT;
	arc=none smtp.remote-ip=209.85.216.45
Received: from mail-pj1-f45.google.com (mail-pj1-f45.google.com [209.85.216.45])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 90C62606A329
	for <devicetree@vger.kernel.org>; Tue,  3 Nov 2026 07:42:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 90C62606A329
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=V3bqAphT
Received: by mail-pj1-f45.google.com with SMTP id 98e67ed59e1d1-3ac77270fbfso1867890a91.2
        for <devicetree@vger.kernel.org>; Mon, 02 Nov 2026 23:42:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793691767; x=1794296567; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=sZetKM+Ta3nWU+g4aVmYGtlY4mbrOL38eozs+DIfj3o=;
        b=V3bqAphTUc9TeQgAfjQ+2zHGFsAgaxhG7Hbh0gvvjkB7wd1H4YaDcv1TadS3Qn4vB/
         4iCDd7EX/7tFUsAEfnPv383nO/WVwmD3zjL+M85tFJbAx5OB5PI7MotsrXyPO/il9eQ6
         vNzhwmfqqzIzOQUBZt7kxdMwoCBhkRhKXL5pOZZG7WhLehx0cdNuSqgZ9/oMXzfNnMaX
         IiSxJrEx7IGHacaPk9xTygEFrYY/y8isngO2RvGz8YPk+IZVEfqTxeLGueslbGJGW+LB
         U0ed5siEhfS5gNjd8WL4MbVZ+9MOp4mOxN5k8psw2ZJ3mFr8ZeTXbJekDvtoKX2uwCCN
         jGLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793691767; x=1794296567;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=sZetKM+Ta3nWU+g4aVmYGtlY4mbrOL38eozs+DIfj3o=;
        b=ndRKOiRdESRrv48TUbDR4lIhzmH0r7m0ushtOJeqGBahTEvBrBzHAwoEilJfZ7RoTm
         44Ulj0Rt99JCp5h/MXzyrRySLgnQdJSviupc6ufMlt0PuEa1O2zPEgj8bdtRehR6jh5y
         b/CBUNdtfzDcDuKskufl7V/akd6ECwF62kWiab+44H46LDpH43OuP+0E8OZGfpG9BKxj
         mv0WG16dP7gQTQl/iPJ1oxP9IOWoLnk4qpQrakJf06uI7jtLGD74cUaRuIJX009lQ+J3
         yzhxZ4aWXsquwF/JZZGAPcT3I9riZnXLox90lDBCIZfS1mV5C1OPWGF9SuW3AJR44sUL
         lZHQ==
X-Forwarded-Encrypted: i=1; AKwUvBxjYNprZc/SN0orK9xhLkMR4IKOE1mqfLooe++c5q8qMd9D53gV/ZKO/wnD5OPVLDARRNErtt0hvMqT@vger.kernel.org
X-Gm-Message-State: APuU4Z+Aj9hgZNVsv3E5bHJE/TWjbJ/wd5dl32QqUaW83quwi4oFsSyN
	nSDrHj6mPyH5QY9P2qRL95w0j5m1A7sPXJp6YVoHhu82t4HbQxwvVIo2
X-Gm-Gg: AYBFou3VI1JrQLFF8MFnYhMwOrf7Wya6hZEMuiHKKi/hYKljO8S+NXRNuLDHSS+kBp4
	417WoZWT1N289fVO2ZYXHXRZyZaBGoh6p4lum6ENh+C4SW2ihDnrzWT/8WxpP6SKqHB6kJm4lNZ
	w8PDTWR/4lwJCQCCMQZesk8/zQ02lkEzs3y4lsFoaX9fkQK1GZxpISQenaMWcr2zF2Ov0vBjd1c
	iO0C6R0gAn89KEvJzjbAOaqoCrk6MKJmq4Hgsn7L1mhs96kg/78PPufwd8EsrxJm6SlTpOQ3kEA
	i3pxXq40Y2EASTtGO2bFpeS9AJvfjOUuqDn0Cucws88B198WBXdLAf5QbZzAUHxfbMftCA9+maP
	KwXbpv5qwOt9vZ1DevIWLcR6DzmY4T2YZLAMiFJl+qX2KylH4cGYa9Ns8610oljHuAeZvLLET1T
	3rpB5Q04rR/qT/6aILiWj8N1EPYo48d1TET2sxy4jl6qxgK1KCo8sOmTh2F/9bkaeFDefQxgy12
	JTu9ga6vc92jKzimJ9gtRIKsHs4nqnrGht4cLZ8umWnzL4bzGjZ1FCgwlfIocbYTT3mH/RrCK7+
	vPkbUv5xMOi8g74insE7z3e+ot5WIzWuBg/6yFRLBeZYah7ytf2TBuvmEe/fvqL02HPMjzXRd7v
	qSnAXtNm6k/DEBuNrLVjCl360eOvFdOpwgGC+V6jXyUdfgR/U9A03xPoHrqA4Ktw3Gz4boL4O+6
	24gyw=
X-Received: by 2002:a17:90b:5847:b0:3ac:17c:6e89 with SMTP id 98e67ed59e1d1-3ae89773f17mr9382729a91.19.1793691766813;
        Mon, 02 Nov 2026 23:42:46 -0800 (PST)
Received: from [192.168.2.34] ([2403:581e:d87e:0:739f:50a5:e171:f133])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b07c903d0dsm2956769a91.12.2026.11.02.23.42.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Nov 2026 23:42:46 -0800 (PST)
From: James Calligeros <jcalligeros99@gmail.com>
Date: Tue, 03 Nov 2026 17:40:06 +1000
Subject: [PATCH v4 18/22] arm64: dts: apple: t8112-j493: Add
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
Message-Id: <20261103-macaudio-v4-18-637484efe46d@gmail.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=3235;
 i=jcalligeros99@gmail.com; h=from:subject:message-id;
 bh=8fzOK0BtAM9BKavKDtzvC9SkMIH3VaTohkyi9BTYOYQ=;
 b=owGbwMvMwCV2xczoYuD3ygTG02pJDFkv+88bPdw7+8zxaeJR3g1PXwjIeS0/LufRYzbxXFvRF
 sbQSU8aOiayMIhxMViKKbJsaBLymG3EdrNfpHIvzBxWJpAh0iINDEDAwsCXm5hXaqRjpGeqbahn
 aKRjrGPEwMUpAFN9ajkjwzoGp3vpF83+FtboLflt1byU6xkrr57qIumIVLazKrVXdzH84Z7/WCp
 jd6xtRMr1hR8S35z10Ou0ZEixmRvEKzjfMmcCIwA=
X-Developer-Key: i=jcalligeros99@gmail.com; a=openpgp;
 fpr=B08212489B3206D98F1479BDD43632D151F77960

The M2 MacBook Pro integrates Apple-specific variants of the TI TAS2764
and Cirrus CS42L42. Add these nodes and advertise them to the machine
driver via the sound node.

Signed-off-by: James Calligeros <jcalligeros99@gmail.com>
---
 arch/arm64/boot/dts/apple/t8112-j493.dts | 104 +++++++++++++++++++++++++++++++
 1 file changed, 104 insertions(+)

diff --git a/arch/arm64/boot/dts/apple/t8112-j493.dts b/arch/arm64/boot/dts/apple/t8112-j493.dts
index 7cea5c594810..832c18538cab 100644
--- a/arch/arm64/boot/dts/apple/t8112-j493.dts
+++ b/arch/arm64/boot/dts/apple/t8112-j493.dts
@@ -147,5 +147,109 @@ touchbar0: touchbar@0 {
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
+	};
+};
+
 #include "hwmon-laptop.dtsi"
 #include "hwmon-fan.dtsi"

-- 
2.56.0

