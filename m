Received: from mail-pj2-f12.google.com (mail-pj2-f12.google.com [74.125.227.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 94053403AE0
	for <devicetree@vger.kernel.org>; Sun,  4 Oct 2026 06:06:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791094000; cv=none; b=ZMFdwcB5TxoOVxUS5z8Fq1XzppFlh7MWSYnPh4Ufm4m3jon6gk1GVG1ntLcgThSiRqRzESvfuBjGzH5QHOoEJ+vI9B9bexSE7moPeDG8Z5J81e6QQ+vTFO7ig6XMhHZI0+FYaSrN5Fa43XF09IDoP8TFVoyddZvqCm3X/vj2XPg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791094000; c=relaxed/simple;
	bh=10CNjE6ELuFX66IXNrkb7f+2daPg1AbLL4enNg5zaBc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=LY2bFUdAuYQ9isE/Wj2waaWCGtQLFKII6bSc/6bMCb+irrZHHjBRZC9ML/5u/7qTjbH5C/HDusewl8k9qHpTKLkLTtQ2yjwKnUuQtZEXl5GrM/uTpGAEKyL1syCfNk5a+L30QleiS01L8+2FCgT1yTY8YmR6AVx8YajXvPxS+Tg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Wx1XBNnE; arc=none smtp.client-ip=74.125.227.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Wx1XBNnE"
Received: by mail-pj2-f12.google.com with SMTP id 98e67ed59e1d1-396ccc02279so441066a91.1
        for <devicetree@vger.kernel.org>; Sat, 03 Oct 2026 23:06:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791093998; x=1791698798; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=wzE/M5oT5vPZI1AJYKVf4l348+q+qKtnsytokZ7nT6A=;
        b=Wx1XBNnEo7x3iQwrOd95uPQTvoRLzFB3SDqM7SqcfXkzcC2JEicnqo5FhmWohOXrJO
         /ios3Q5oPUQ4Qo1pYjrc4ywkfqOAe2+sByLJDEweXb4fFy2V/t/nfTEUNoGm2gO/TaKd
         sWCchIY+8ssSrKpIE/O5gwREAFBLuSPJaR9YdXoMrRRlcJqyG1s8ABkrZ/RLY7/PGP4F
         fUrMgzFihEEqF01LHiZueGWr6iomO9fMHcnhw1y1mKN0q4eY/CaPM4E1GnaKi6vNXb9x
         Zv0bjdGWHGyqqfBEEwojBrfA9XhKr5n1fKGOkwxuQlNElxlX6As7mpyPVpbHs1/ufzgY
         qcIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791093998; x=1791698798;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=wzE/M5oT5vPZI1AJYKVf4l348+q+qKtnsytokZ7nT6A=;
        b=SqCeuT0Yvx5tw5tHz53ZvxIbkRqhFV5WtU6EQOD6wtocZrPfMB6vxMRVp0BygKGbnr
         pvvv/YMZDyGqww7akEbSD2dNYrlCSF0QPjPaEbnlbujlonrP9XrEUliaGVdUiLXwR1jA
         IWe6bgW7xYhx1XRdQNC3yrFPQaNK64fn3YMi0vVWVnPLDg4JRNVIfpnCebkQvJJxics3
         qrg0BgcDXSid0a3KZ/tLjRTeGBjefFQlw1aRq7aBBVEKndEe4FhsFoDmq1KaHxSXyoQf
         k2Tt42BOmUU7vJdQpljKgujR+Nk61mYNUV7HBkRRiE2h5OvJ/KwlsR0icsj7dnrJBWSO
         nRKA==
X-Forwarded-Encrypted: i=1; AKwUvBzm9c9Ml06xut5h8mTR/OEJssFEcEVcb6EmlkTzMwNUDQXLvMExIbsmsUP3qj6wMeuVR8pk3aOxViir@vger.kernel.org
X-Gm-Message-State: AFq9FYJ24yzwYIujYYEaHnyutfLFGFG6+0dLuZesoyeiADRtHqqlI5AY
	gnJwuOlc1V1E2lhmqjtzLredfbn17DhY/LFyjHlf3TH3dz9/3Yyzgcbi
X-Gm-Gg: AYBFou22cO4axqHjx6p7IbSCsBJIaF+mZDVqNLal/H6OVCiFuv6BKu0QcvPYnaM9krw
	PiPtuUh1R8lQXQ0n9xErU9tX92YcOfE0XvsqNuYcjmPmf7UHKwx3BIK1Ho5vZ1FJXXMwUvvO3ea
	BEJUKplXA6Cf9mcdFTM7WT5k2Fg4W7KpfR1gWXQHEre60DOH7V4p6s3aBoc/lCUp2+ur4SGuSau
	x4sk84EEAM2IoBYLwtrU12yTr8BkC3yEnBmESBcmRrMjfs0JJzDuDhyrb35nfGA+S4voQH3A1YE
	weK48sIN07jE6jbzuIoguNBAlf20l2fx42WJ209o+Skkh0r+2C4UHGs2mRaDIbRsAhPpk770JID
	VrZrhell6/NtqYOH8rsu0gGSrTbHIBkdpaUKr9B1fO8q5EDMjEuacURjBEVtU/tvAvgL44JFFdp
	vAHY1jWbQx8nSjelLCN2HFOBN84Kf1tIztaFfYKbb4HsqKbfOxnGdxomrNntMN6LqSgh6gFZ3jP
	1xxl2xxDsoc6bfYi9TM2wq0MOUGywtwrnMjr2PJ8aUYG5731skoa9Jay2ZTAwec+7VNo9H0+lfE
	1Q/95IO3GlyuVqt6/3SkaCqwGgxsWZeVVeHIYe/4SnefXvw=
X-Received: by 2002:a17:90b:4b83:b0:3a5:1c7:c2f with SMTP id 98e67ed59e1d1-3a6ce986288mr6844237a91.59.1791093997815;
        Sat, 03 Oct 2026 23:06:37 -0700 (PDT)
Received: from [192.168.2.3] ([2403:581e:d87e:0:fc2d:ed31:e80e:412d])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3a78d4a869esm5844094a91.2.2026.10.03.23.06.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 03 Oct 2026 23:06:37 -0700 (PDT)
From: James Calligeros <jcalligeros99@gmail.com>
Date: Sun, 04 Oct 2026 16:03:43 +1000
Subject: [PATCH v2 16/21] arm64: dts: apple: t8112-j473: Add
 speaker/headset jack nodes
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261004-macaudio-v2-16-7b47ed6335a8@gmail.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1828;
 i=jcalligeros99@gmail.com; h=from:subject:message-id;
 bh=10CNjE6ELuFX66IXNrkb7f+2daPg1AbLL4enNg5zaBc=;
 b=owGbwMvMwCV2xczoYuD3ygTG02pJDFkH3+SpT/mn9Yw/NPxbgufaM0+qi9NObXvIvuFI4oOQW
 a4ZNSyTOyayMIhxMViKKbJsaBLymG3EdrNfpHIvzBxWJpAh0iINDEDAwsCXm5hXaqRjpGeqbahn
 aKRjrGPEwMUpAFNdL8fIsO7XQYO6x03LbdPLE0oNPZ9W2QWKF4vWiTFNfTf5Jv8OYUaGLS7Obd+
 uv1v7zKW2L1qITXhHtfRz6+jmpDrmOtk7O1dyAQA=
X-Developer-Key: i=jcalligeros99@gmail.com; a=openpgp;
 fpr=B08212489B3206D98F1479BDD43632D151F77960

The M2 Mac mini integrates Apple-specific variants of the TI TAS2764
and Cirrus CS42L42. Add these nodes and advertise them to the machine
driver via the sound node.

Signed-off-by: James Calligeros <jcalligeros99@gmail.com>
---
 arch/arm64/boot/dts/apple/t8112-j473.dts | 62 +++++++++++++++++++++++++
 1 file changed, 62 insertions(+)

diff --git a/arch/arm64/boot/dts/apple/t8112-j473.dts b/arch/arm64/boot/dts/apple/t8112-j473.dts
index 105a9d118980..36f06c6e385d 100644
--- a/arch/arm64/boot/dts/apple/t8112-j473.dts
+++ b/arch/arm64/boot/dts/apple/t8112-j473.dts
@@ -85,4 +85,66 @@ &typec1 {
 	label = "USB-C Back-right";
 };
 
+/* Audio codecs */
+&i2c1 {
+	status = "okay";
+
+	speaker: codec@38 {
+		compatible = "ti,sn012776";
+		reg = <0x38>;
+		interrupts-extended = <&pinctrl_ap 11 IRQ_TYPE_LEVEL_LOW>;
+		shutdown-gpios = <&pinctrl_ap 88 GPIO_ACTIVE_HIGH>;
+		#sound-dai-cells = <0>;
+		ti,imon-slot-no = <0>;
+		ti,vmon-slot-no = <2>;
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
+		compatible = "apple,j473-macaudio";
+		model = "Mac mini J473";
+
+		#address-cells = <1>;
+		#size-cells = <0>;
+
+		dai-link@0 {
+			reg = <0>;
+
+			link-name = "Speakers";
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

