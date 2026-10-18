Received: from mail-pj1-f47.google.com (mail-pj1-f47.google.com [209.85.216.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1D585348C6D
	for <devicetree@vger.kernel.org>; Sun, 18 Oct 2026 05:56:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792302962; cv=none; b=RCEy7XRcg2fRL92TlPX6LJhiAqOYOe8ng2sYslKFA5W0Ke+teACX0ht/2KzhRd2StgprrHzfIKWi3EshxasasPDPO9D3g/RR8iHr4ptCwoGqGS6gt7Yp3X//hrzZiHshKM5U/+W6fIX7oI3Gmv0qHPpZJmrds/0kALi16BMMYco=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792302962; c=relaxed/simple;
	bh=KU3BimG1w/tGdivUHCFc4QDicVE1ue8ULpff7ZYuYZc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=G/r+ep6Rn+6hSnmz4jA2UdoyXD/g3PG8ci1eL959CIMMjnaKTX+0vdx1Pk3l0SJ5AvsgyEfWyuPXC/VOmdemcnhryCYn4flskX3/Vlq02K1sI9vSyWnycnEd0onu6Tq5nxI0Mauy8BmO0Qx+F2Va53D305VhB+TQYhI+d6BpSus=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=T383jBsw; arc=none smtp.client-ip=209.85.216.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="T383jBsw"
Received: by mail-pj1-f47.google.com with SMTP id 98e67ed59e1d1-3ab60ff4273so1099097a91.0
        for <devicetree@vger.kernel.org>; Sat, 17 Oct 2026 22:56:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792302960; x=1792907760; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=hF4JMWs272sSEGsqzXfRRdeL0HGexoAGbLW26/BzJH4=;
        b=T383jBsw0VBBZgdkYYREWsHHOWepocZ+YzmWz10xe9DLoilx4quKm3D5xjgzzwr4ju
         o97+o4zSqLwUUG773qoFVmDSmLAWQHIN2xTip7IcK9eJtTF6ivpG36RNdVksnnbqmXzz
         pPeVPVGR3ydke95O5eGMzxpY5zGQFd5zfl5aOb02RMtAnwaiOQ7spuxOIa+nPrRpH+R3
         fAevyoNiof7UsaGRjRcjj226FRi+jqOivnQjWc+qCuFv0miOH4r7sUBNBHPmDqzDiGPp
         cxUW+50ztGfDk2fz2T9+ja8PtPzgWdFMX2axQ1KxLbIu2DJ0mCzP1uNnpzqFsh4sMebz
         0fwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792302960; x=1792907760;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=hF4JMWs272sSEGsqzXfRRdeL0HGexoAGbLW26/BzJH4=;
        b=mG6ZTdrkGlqfFqdODqAMgawvBQwWIncfCyW/FonrBN52hL0nv++YyYXoQ5tQhW5yiP
         WpMvUfH8W1DcRdmXQ2+mCuuBBa13XaVzYV+cE7upaJnVcY9qnMe2OmKVLj800QTCExe2
         jSpfo2E+HZD7uJ6wD0j2Yoa8hHlUMH22EkdRgpVH8boLYYPRIAWTjPerq1cK10gO9Li6
         UewFGkJiHPeSblENYVylX5hSe+mSxca89Ls4G0pxTm5zFIfa+eJqfTYTjrr+mnyRDTvJ
         c+QJ9sBfYrawDqkUekTXjzymSPcbxwTEfLejjYwfK7OXjvkRr2cCzN8vmr0HW0WokVh3
         4ujQ==
X-Forwarded-Encrypted: i=1; AKwUvByFRiIulpwOeJG/G7WFFJrH2yBTAJxCEojLi3aF/hs/t7y6RSsdboI6n/+Oo/sXDPW4Nb1f+505t6lx@vger.kernel.org
X-Gm-Message-State: AFq9FYJmrBRTYpODBnWcub2H5AJIhKdPAOHF0XoW0Hkxb7qIX/p+OJ1q
	zK1uuTkXv8pJTscLT3dyjgwRr9ost9zOS6qESxSjWj1l+2e0VqmV384y
X-Gm-Gg: AYBFou2ncjoq87MS2UjefOaM/N3uC6iqbO/TGIJb+p4CbZn6BzS/aaeZTLkm/3wwfLZ
	hXC+9qlKu7yP3XQbfwaqlz+wYd3hHvvHHpOpx9eiIsZD6LoUqti/3COeIx1yWxUTubOXXux2bjG
	9bD2BF9pLHfgUyuz4msnzVbEje9DfFmTn/vdMd2efuCLI8Afb61XeKjiogks0Ez29tYnIeatPX2
	1Mkv1NWoq9F6smWKMuKtU+uqPxJRKexCBWQm/CdsMZ1D7FVDuPjHtQ2B9glgnS04xqnpzN4nWxC
	o2cEYGiTPXoWgcBNq7lpSnbvlb8sI3Jn8l19MRN9AgsK57PQvZ0+KkXYqR9U9cHIFUKZYdC7Fyu
	7c17GARbLNYNrFDlfKa+P5oM7fCWBgtpo83LYbAWE9S+pMY/Frx527TUFVTgWZ7YRw/pm0i2hAX
	6yBNcU+pGYenBXeDtanMN37Gao98rPJWbb+pUpq36UUzI6pxh3HiynyQR7qMm98JQWJkO9xg6zt
	OtvOXTb1dT3gY+O1lVKj6EXtHgs5BAIrhu4eCHfHVUNnGK9OEri2DqQxhXA5HWBGW1vzawkEX4N
	HZC+FMlzi1vpSuqxEzdnxAKfhm9hjsNmNtHANzbkgcY4Vw==
X-Received: by 2002:a17:90b:5643:b0:3ac:95d7:2f9e with SMTP id 98e67ed59e1d1-3acef4e492fmr3874379a91.38.1792302960536;
        Sat, 17 Oct 2026 22:56:00 -0700 (PDT)
Received: from [10.0.70.21] ([2403:581e:d87e:0:fc2d:ed31:e80e:412d])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3acd0cde4fdsm5511292a91.4.2026.10.17.22.55.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 17 Oct 2026 22:55:59 -0700 (PDT)
From: James Calligeros <jcalligeros99@gmail.com>
Date: Sun, 18 Oct 2026 15:54:03 +1000
Subject: [PATCH v3 09/21] arm64: dts: apple: t8103-jxxx: Add regulators for
 CS42L83 power supply
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261018-macaudio-v3-9-abdff7741dea@gmail.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1782;
 i=jcalligeros99@gmail.com; h=from:subject:message-id;
 bh=KU3BimG1w/tGdivUHCFc4QDicVE1ue8ULpff7ZYuYZc=;
 b=owGbwMvMwCV2xczoYuD3ygTG02pJDFlX4nkOfZBinBN/YGlX0O5SvnfvnwlviQh5vf3pG8Wow
 u1aYrPYOiayMIhxMViKKbJsaBLymG3EdrNfpHIvzBxWJpAh0iINDEDAwsCXm5hXaqRjpGeqbahn
 aKRjrGPEwMUpAFPtH8vwV0hFKrt3PdNppgyXZRkNSyQVK5OOKKUtnDtdWvvKqVv31RgZnvPLX/9
 g9pT3TfXN1ROaHBufK3Ku+GX6Y3bd+yu27Cw5TAA=
X-Developer-Key: i=jcalligeros99@gmail.com; a=openpgp;
 fpr=B08212489B3206D98F1479BDD43632D151F77960

The CS42L83 codec found on M1 series Apple Silicon Macs gets its voltages
from fixed regulators managed by the platform. Add these to the template
Devicetree so that they can be referenced on the relevant devices.

We do not (officially) know how the power is delivered to the chip
(voltage rail names, commoned pins, physical regulators, etc.) so
the regulators expressed here are just stand-ins.

Signed-off-by: James Calligeros <jcalligeros99@gmail.com>
---
 .../arm64/boot/dts/apple/t8103-jxxx.dtsi | 32 +++++++++++++++++++++++++
 1 file changed, 32 insertions(+)

diff --git a/arch/arm64/boot/dts/apple/t8103-jxxx.dtsi b/arch/arm64/boot/dts/apple/t8103-jxxx.dtsi
index 686fb1dd215d..7483fc5cbd20 100644
--- a/arch/arm64/boot/dts/apple/t8103-jxxx.dtsi
+++ b/arch/arm64/boot/dts/apple/t8103-jxxx.dtsi
@@ -38,6 +38,38 @@ memory@800000000 {
 		device_type = "memory";
 		reg = <0x8 0 0x2 0>; /* To be filled by loader */
 	};
+
+	/*
+	 * The CS42L83 found on all T8103 boards requires VA, VCP, VCP_FILT,
+	 * VL, VD and VP regulators. We don't (officially) know how power
+	 * gets to the codec, so these fixed regulators are stand-ins.
+	 */
+	jack_va_reg: regulator {
+		compatible = "regulator-fixed";
+		regulator-name = "jack-va";
+	};
+
+	/* CS42L83 VCP and VCP_FILT */
+	jack_vcp_reg: regulator {
+		compatible = "regulator-fixed";
+		regulator-name = "jack-vcp";
+	};
+
+	jack_vl_reg: regulator {
+		compatible = "regulator-fixed";
+		regulator-name = "jack-vl";
+	};
+
+	/* VD_FILT */
+	jack_vd_reg: regulator {
+		compatible = "regulator-fixed";
+		regulator-name = "jack-vd";
+	};
+
+	jack_vp_reg: regulator {
+		compatible = "regulator-fixed";
+		regulator-name = "jack-vp";
+	};
 };
 
 &serial0 {

-- 
2.56.0

