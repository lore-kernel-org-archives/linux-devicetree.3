Received: from mail-pj1-f42.google.com (mail-pj1-f42.google.com [209.85.216.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 351244279FE
	for <devicetree@vger.kernel.org>; Sun, 18 Oct 2026 05:57:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792303076; cv=none; b=Fw0wzKiDOOvlKyOPh4eJnUJZtdBnLszX6N1UHSkX2Y02uRP7ecf77qJoRKouMclPUQqeBj4w5UOhcN6y3VwRVzoevGwcn6PF7yS2WXkYcLX9s/jll7HvqunVjUusQ2g1XsjfFM3CI2TnwemaS67MTX1rUeHJDLeQRHSaEHcNchk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792303076; c=relaxed/simple;
	bh=nr9+CGWG20c/KVGlppqHBL9R7cNwf/g9iBmeoDmHgmY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=pFpoFsHEtkzjZICDGjVqLDU3Z/33QiKNZUyWXmqp9vilhGjLWHQsKW4V6FmeMoCQEQSlX2OR4yGzh3BdXlgD4c/J/IGeuQHzz+O0TYKNZGqgW2DjXhWB85tmPiZpWyKDSxyGemYJc5Y1RGGbhFtEmPyuNlhGUgw57XA/vtWAPDc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=GFnJlv1Z; arc=none smtp.client-ip=209.85.216.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="GFnJlv1Z"
Received: by mail-pj1-f42.google.com with SMTP id 98e67ed59e1d1-3ac6794fe45so1001641a91.0
        for <devicetree@vger.kernel.org>; Sat, 17 Oct 2026 22:57:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792303074; x=1792907874; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=pMJIf3eDmeaMzHhnQzRW/7JZUIebuAdZzOruphxa9D8=;
        b=GFnJlv1ZSebKdOD/sCb5pWEco/8KRfYm2bM4hkE/T76OsYSTVArxMH6nWFzNG2feBw
         4QX8AyjSPC+DbFuDie3R2qqEhLeHCxFRvYpp06TxeyXt90DOAI7iqWrNGIKaiZIkF5qD
         apNvHjAxmkNmonsTFcvZEtoQ9dxIwmtbup4YG388zDbnDSTkuyZjmf5znNPi3L3lt3Rn
         x165/SMKTMVobH+3sXnNsmC3OuiYpiQS90/SGDlgtdJ70h1dvGz1TsiwAqdtBWnxbU2z
         hGrFslXIJPOj/quFEu+KlZ8kxHWwLTGz8dA/Qxc2dGjhnF8r2vCNCUueQuYOSu8tKs2M
         3KfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792303074; x=1792907874;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=pMJIf3eDmeaMzHhnQzRW/7JZUIebuAdZzOruphxa9D8=;
        b=v4k0ENmiQVkkQRVRCmOm9o/vGc3JGOdP3LMtxl1snfA/PZzBDv4Y0n7VU9kaQnZfmu
         zlY04lp53ATaBGb/La+p2/gRK3Hw+0umYE2bY/lgODMuVBkqFLkNvaXTF0rxcBG2cl03
         QpdR2CbqOqpChA2n+i/q7q0l0SiHBIX6MuJGisRRYHntgqcPGsNIFxd1hfeLB7UAXJto
         4gTc5x7lfKjIx3LhZymzJK5pTSIFY1QTQx3fnqMVDxIgV+zHafPGvtr0YFG2LKmxMDFw
         rOvJ3QFEX3CoFEXCrOD7+L0VfFgGAnnnBHWZJYc4O5baabZLwWhXFywQdQTDNtjRV+Eq
         Ku2A==
X-Forwarded-Encrypted: i=1; AKwUvBxvBJjxbK5iMHx/ZlpdAmkn1qiZW1t+VIlI7JQr109619o+Rz0YsoQQ3qFtgX3STVLO2BOebQo5ytSm@vger.kernel.org
X-Gm-Message-State: AFq9FYI+URE4oQOd1u9jwdtqtcoJqhHNa6Q2sG4P0Rpqf5GpcbLlSZyH
	6OT7c1aKPu8kddHQpC4AmlD4U+OvXAEG/cbNEWoyZ4RDPwmrkU3z3GwE
X-Gm-Gg: AYBFou3gF6QcPa1mAZ6XsoL4z09G108GCmw6NQpxw9xRC801568QWt6l9VT4e4Nd3xt
	NhU1YB2F4o233u1AeFVyNPB7p6qZnRCm1QeqhOWcTTtRFcp1HNxjclh5RQA7SmVrVU9lJnrMb6P
	NuwK89+EISjubhfHCwT/k5DgE1DL49wJ61mfcpuMTtSOH/QlGfdkHgIYJtm/9PAmpL/QnNpXdvW
	qweCIxr9hItL1dAEY7i+mu0qq/dwhV9DM2Ygx+fJ22D70JL5HthB3QUVkaAU/igCPknCaoaHdua
	fqpgiydNOIQHdgL2CoAnvO4WZeeSR0f92+iEzcFv3qK8agaelKdehYoJR/86DZZVFRK8W8nhZGS
	1fhQUnaKyC3SEmN1D4sBJh5SP5bQc6vahkC/do8F2LfFZg475TUj4rhnZAzxWVBCUYEhKoh7ei3
	sIF9IR64RkgBqB3FuPff3O18tMRxWJDqPJUKDPBWjg6kgvkWKZoyce9EedOdxaCYmzzO3lGcNFS
	2nU9QIp2ld6XBgQP3kUQ9FWcMR85FlNEAnOCn6p6hM19FE12bmFq2TwoYqvYgZxgWwK5JBfeDtX
	JosyJDQ+R1WQBF/TztP3SzpaE/LVRv55VAv9ZVrACpppBAlA9N2QkDOi
X-Received: by 2002:a17:90b:1d4f:b0:3a0:ca1d:b40d with SMTP id 98e67ed59e1d1-3acef3ce33fmr3975115a91.55.1792303073667;
        Sat, 17 Oct 2026 22:57:53 -0700 (PDT)
Received: from [10.0.70.21] ([2403:581e:d87e:0:fc2d:ed31:e80e:412d])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3acd0cde4fdsm5511292a91.4.2026.10.17.22.57.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 17 Oct 2026 22:57:53 -0700 (PDT)
From: James Calligeros <jcalligeros99@gmail.com>
Date: Sun, 18 Oct 2026 15:54:15 +1000
Subject: [PATCH v3 21/21] arm64: dts: apple: t602x-j47x: Add
 speaker/headset jack nodes
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261018-macaudio-v3-21-abdff7741dea@gmail.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=2504;
 i=jcalligeros99@gmail.com; h=from:subject:message-id;
 bh=nr9+CGWG20c/KVGlppqHBL9R7cNwf/g9iBmeoDmHgmY=;
 b=owGbwMvMwCV2xczoYuD3ygTG02pJDFlX4vnkDzg9mCoWcqDjxoT0H5LPMpd8KQzJi39uzituw
 3EwIuRfxwQWBjEuBksxRZYNTUIes43YbvaLVO6FmcPKBDJEWqSBAQhYGPhyE/NKjXSM9Ey1DfUM
 jXSMdYwYuDgFYKonzGZkaH696/E3gdUNqtv36a7ffLLu7PqI1sLuRZn5AuecV22J9mH4seAo+80
 gXbd9iRv3zVguMP3KCd34U3KbTt6Ojz+emHaHFQA=
X-Developer-Key: i=jcalligeros99@gmail.com; a=openpgp;
 fpr=B08212489B3206D98F1479BDD43632D151F77960

The M2 Pro/Max/Ultra Mac mini and Mac Studio integrate Apple-specific
variants of the TI TAS2764 and Cirrus CS42L42. Add these nodes and
advertise them to the machine driver via the sound node.

Signed-off-by: James Calligeros <jcalligeros99@gmail.com>
---
 .../arm64/boot/dts/apple/t6020-j474s.dts |  5 +++++
 .../arm64/boot/dts/apple/t6021-j475c.dts |  5 +++++
 .../arm64/boot/dts/apple/t6022-j475d.dts |  5 +++++
 .../boot/dts/apple/t602x-j474-j475.dtsi  | 10 ++++++++++
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

