Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 262923932CA
	for <devicetree@vger.kernel.org>; Mon, 13 Apr 2026 07:26:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776065206; cv=none; b=kPMvE4GoB/9dYfHNsVACjTYVk+l0xDb6Dl2yzJjTy47zgonYoaHpIpISFrW2wII8NU3AD9ayKB0FL/cuRWUsDhYT/+zQd0kPYgC/Ygo4U5bUX+2BCTp5NINO1nop5xys95BPI0wOl8TqYR9k3MvS/h/TIdMTspu5FftJ2sN/uLU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776065206; c=relaxed/simple;
	bh=1HbIW6/OtwG0nzFhm8AN7DBXkGaNxAyxn8jiZchQifc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=pQancWqio5HQ4cnuxZ1iXh8TtLdocMSjbS5kiOSIhitMmWvPvYS4L7SmOP019HTZ9e6kIN5s7c8KO4lBCxP0o35Na6lUTzzanGLo4lxhfCc0Uabz7MHrvAbzcpBcswmwyUVEruopi5cmjROdIfXZ7xyKA1m2EP1H/gdeCS7Ba/s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=l4Uem63c; arc=none smtp.client-ip=209.85.128.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="l4Uem63c"
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-488a8ca4aadso47666695e9.3
        for <devicetree@vger.kernel.org>; Mon, 13 Apr 2026 00:26:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776065203; x=1776670003; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jgUUdQtr/fVKD3Ff4J9UbF4I4wxaToLEFfaMYOrzMgY=;
        b=l4Uem63cxpZXFh7drjEKIzpx5hPVVTJSeLb7DdQs3E0OMPl3PuZVvJG9yrlQUH7fCL
         nF440n+yKZndVgayHykkLg4Gkthz3twEDv4p0+6EKfoz9ivc/VhSvrbz3CsTPPN4CzeW
         GDpxRciJ5vxVfnTNhkmep3Aeqt0ErqnZkh2yym5mPvv9E+zksWz+g4DjXl8Vvpb3OKok
         W6ljZWhhJlrahoKobNAUHxFqrUV4EiFKeiyXgSmkfiw03n7ZQmkV/BeOr2q2uh6/4EMJ
         0P3iEgx7K7yHuGOXFKwN/xhAT/E6VdnuksBN98dygRNmaqobLPSNvaM+3dj2cN7bPh82
         91uA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776065203; x=1776670003;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=jgUUdQtr/fVKD3Ff4J9UbF4I4wxaToLEFfaMYOrzMgY=;
        b=gFOK9klM/8wqC7KW15vRLvBE/0ibRnXqm75DwoI1RXfmv2/+GKZJr5Of10gdQ6IVEQ
         /DlYWkncHqcQgbvJeuYwgm//HTFdUqvc30a+u7a4UsM5uUPrY3FWIpchhgSoKauJi3UB
         JsMn5CmUe1bULYJB4j+dVMnmOTV8CNIvVP2qW2wrx6qyB3k8hf5HEtCi5bI5TzI2ViZ5
         ClTLuwp4WVFxn+F6c6kfn1TcylyvMPfonax/v7No6lqT1nKFwsFOwN/OBN3oQ+jtbq15
         3mWdRF8VLRbWfamLTwmQMPZ1gHNmcvApxf0VEae7WtlJZJXHrPO3V4GJFNVo33dKFb5Z
         XZCw==
X-Forwarded-Encrypted: i=1; AFNElJ9ux7Si4JmuXjxJfE/g6Rs2I+PlnZY50eWdeG1EIzdO9uO2QmpLGlxF4em8okkBQ9PFCYFAqh3PwDLg@vger.kernel.org
X-Gm-Message-State: AOJu0YxpYaGPcScYMukbas5m447aBvYW+Q6Jfvo232kQ+gY4UFNG/fyB
	tjwhMt4HthXjo/ud/pNoc5tKihbSuwhX532JVGG+yFIBqR4StWud131V
X-Gm-Gg: AeBDievkFBVPS5xkhJexrxqZ8KAslDlOFPqVRVlbfFrgj1WJcPkrURac6tU2cg7SNaS
	j9uIHc1aE7k/BCUEFRGO98zjMaV6Sf5hi7ztFLV0m7QOD5iahpUBkxPYVqIdJ0nGyLYBCGaeW4e
	qYVJEmh/ib/vkPvhK6JuVuxCCa80f2HSGKLgdU0c7mpl6s1/SEqrRixiWNc5uTzf0F+CbeYM7Pc
	WejGuL7b9znqR39VsOzAx+PY7Xw/pGx31Az/cQi0PDlxbbbbhnRxYv0Pf9P9MYLvFArDUgpDQUd
	YhwMnTX7gNN//Pp6Jj+ENaz72/A6QGiyXjmBFt/6wlxnINv5yo6T+N8L0gknJNIacPH4nxcC+Jd
	xCXUbSW+IyZVmjFfIYtVABNgk+MUYDRy4gksz48bQagSvzOjj6ZA9hhprm8K64zcMqhjzx+zH+k
	D5YIlPUGNIGfwd4gtkJ/NUXQ8dzn9iTRpRqYnpdojC22yuqdj2ZjBSFLTT4ZQgRVu4
X-Received: by 2002:a05:600c:609a:b0:485:30f7:6e88 with SMTP id 5b1f17b1804b1-488d68a10d7mr175221425e9.31.1776065203465;
        Mon, 13 Apr 2026 00:26:43 -0700 (PDT)
Received: from ipedrosa-thinkpadx1carbongen12.rmtes.csb ([67.218.239.37])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-488e4d0ed99sm85734235e9.12.2026.04.13.00.26.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Apr 2026 00:26:43 -0700 (PDT)
From: Iker Pedrosa <ikerpedrosam@gmail.com>
To: Ulf Hansson <ulf.hansson@linaro.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Adrian Hunter <adrian.hunter@intel.com>,
	Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Yixun Lan <dlan@kernel.org>
Cc: Iker Pedrosa <ikerpedrosam@gmail.com>,
	Troy Mitchell <troy.mitchell@linux.dev>,
	Michael Opdenacker <michael.opdenacker@rootcommit.com>,
	Javier Martinez Canillas <javierm@redhat.com>,
	linux-mmc@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	spacemit@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Anand Moon <linux.amoon@gmail.com>,
	Trevor Gamblin <tgamblin@baylibre.com>,
	Vincent Legoll <legoll@online.fr>
Subject: [PATCH v7 7/9] riscv: dts: spacemit: k1-orangepi-rv2: add SD card support with UHS modes
Date: Mon, 13 Apr 2026 09:24:49 +0200
Message-ID: <20260413-orangepi-sd-card-uhs-v7-7-16650f49c022@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260413-orangepi-sd-card-uhs-v7-0-16650f49c022@gmail.com>
References: <20260413-orangepi-sd-card-uhs-v7-0-16650f49c022@gmail.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
X-Mailer: b4 0.14.3
Content-Transfer-Encoding: 8bit

Add complete SD card controller support with UHS high-speed modes.

- Enable sdhci0 controller with 4-bit bus width
- Configure card detect GPIO with inversion
- Connect vmmc-supply to buck4 for 3.3V card power
- Connect vqmmc-supply to aldo1 for 1.8V/3.3V I/O switching
- Add dual pinctrl states for voltage-dependent pin configuration
- Support UHS-I SDR25, SDR50, and SDR104 modes

This enables full SD card functionality including high-speed UHS modes
for improved performance.

Tested-by: Anand Moon <linux.amoon@gmail.com>
Tested-by: Trevor Gamblin <tgamblin@baylibre.com>
Tested-by: Michael Opdenacker <michael.opdenacker@rootcommit.com>
Tested-by: Vincent Legoll <legoll@online.fr>
Signed-off-by: Iker Pedrosa <ikerpedrosam@gmail.com>
---
 arch/riscv/boot/dts/spacemit/k1-orangepi-rv2.dts | 19 +++++++++++++++++++
 1 file changed, 19 insertions(+)

diff --git a/arch/riscv/boot/dts/spacemit/k1-orangepi-rv2.dts b/arch/riscv/boot/dts/spacemit/k1-orangepi-rv2.dts
index 9c417a483f6b..95cfb4681ced 100644
--- a/arch/riscv/boot/dts/spacemit/k1-orangepi-rv2.dts
+++ b/arch/riscv/boot/dts/spacemit/k1-orangepi-rv2.dts
@@ -140,3 +140,22 @@ aldo1: aldo1 {
 		};
 	};
 };
+
+&sdhci0 {
+	pinctrl-names = "default", "uhs";
+	pinctrl-0 = <&mmc1_cfg>;
+	pinctrl-1 = <&mmc1_uhs_cfg>;
+	bus-width = <4>;
+	cd-gpios = <&gpio K1_GPIO(80) GPIO_ACTIVE_HIGH>;
+	cd-inverted;
+	no-mmc;
+	no-sdio;
+	disable-wp;
+	cap-sd-highspeed;
+	vmmc-supply = <&buck4>;
+	vqmmc-supply = <&aldo1>;
+	sd-uhs-sdr25;
+	sd-uhs-sdr50;
+	sd-uhs-sdr104;
+	status = "okay";
+};

-- 
2.53.0

