Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.217.43
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794585143;
	b=nNJ5BBQF8RO5P9EyDx2bXUz41v1rfGR17xvc6DOJyv40kspcWdSNDSWSpMTVnUd2PfCi
	 3jyqowtYrV/h4nIMXGoLyk2umC65fuTbkrecNylvdkqyHeoHAi1wDGJ2zOmZQ7vQES7gH
	 bKfm6PFWiawzbJeL/RlP99RGm8xZaB+2nK2dsU4M0k75nYH6AKwfP80BdErzvfDExnaod
	 nR3yUgXUeuxrhvqZngb7UcmyU9IE+p8mQscUHwySCSQP4YrmjeG7/1Jb5nvrJhNrvDUAQ
	 StR+9tX8lKHwq1edMAKD/Rzhlup0D0+C/vFyIX8DFN+IEJz5WGgxVHE+l/T3x+txXxQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794585143;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:Date:Subject:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:
	 References:In-Reply-To:To:Cc:X-Mailer:X-Developer-Signature:
	 X-Developer-Key;
	bh=+4Kob2gk2RGrwhPW94g+FkLDl6/7shaw/mXXHVd5Qk0=;
	b=NGLed0ZCdfCXRJOzyMqylj2fNwzWXQvtZidBTBSQmhhUQCGc+FYbH/4b5+oveBuxtmoR
	 urQfsy9jeb5RSCXJal+4YdJqeG56EcDIMK8iefVAisXszViFnBqPQvcY/3LRUbcJPQOnq
	 UsBkRo9/mbWQQPWATnK6U7HHF/FpoSNoVgoCEC6wJ7PbMVJfVkTJkGcGBGnKXUgHU9zhi
	 LvD72XZ1d+zZFHqA2TUJTGI3rNhV2cRBJJ1H1YU7SAxDOc/MTuln9uWKz7dSy573/CVJW
	 +X/a9U3x0vy86J7WwDPPRTrh/yxBzsalJGaQZp/e5YYScabVNNtVKY78hUk1o7bVqIw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ty1YDM3A;
	arc=none smtp.remote-ip=209.85.217.43
Received: from mail-vs1-f43.google.com (mail-vs1-f43.google.com [209.85.217.43])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DECFB606A330
	for <devicetree@vger.kernel.org>; Fri, 13 Nov 2026 15:52:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DECFB606A330
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ty1YDM3A
Received: by mail-vs1-f43.google.com with SMTP id ada2fe7eead31-7d2da166818so1475760137.0
        for <devicetree@vger.kernel.org>; Fri, 13 Nov 2026 07:52:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794585142; x=1795189942; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=+4Kob2gk2RGrwhPW94g+FkLDl6/7shaw/mXXHVd5Qk0=;
        b=ty1YDM3AVlYJqm0N76kE13BjO8w9TdIOnpTuFuOeWroj1FZsu9TuIwkC/BUP1/NA4P
         48TPHiFHI6Cn3LwbzA5R1Wymd+Ux8PvYbX7WROioGMkH/8Y7eldGGqYi1z5kh4MxMTr7
         hjWSktRzNy3ch6rceMZP/u+X0LNDJPdn7Lq2pZym0/Nzf5edSJhcZ2SeDmwr6aE8Ay8d
         adi9G2T+D9pvVX9OEP/53ltL6wGWAkwIYv7nO7mtn7t0raIOquZ845hFi/Idgw56DfBG
         sNJ1sir6E7mLKKG1MOObzYXNMmBbDeFdGjIhNaC2ZAHQ54vr27C+Z662OpGRm+7pFBDS
         X+VQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794585142; x=1795189942;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=+4Kob2gk2RGrwhPW94g+FkLDl6/7shaw/mXXHVd5Qk0=;
        b=1vsHi7Hg3BR66bRrDHFLmtxGeSlQcmUpc2IKYbZQH+jBXX1TDzhlwp2eBvAeYfRdZA
         JhfCvGc68SSRmZMqIYeAVRtBP/ZEaLWFTWHcsAEmyJtAfoeUqinPd7HiUwzbMOm7tRxG
         k5JjCNIX2Z91VAFgDEl8LQGAuCt/wpdtbJ0xN1FmL2K0Py21MAGIeZe0lH1WXZVZ+jNU
         hS5uEqW8Ig8LYL+/rG5CgOReEr4HPvdbdQPI91PT2Ph10LcdogqM+ytR3+uHkysEhusF
         P+cMN52JiSfAL3XGyOQMXv107op6A/9iv/0nAaOZDUcftRQ0P2Q60RC7/LDhyjNcIcxr
         Yo/g==
X-Gm-Message-State: APuU4Z9vfpm1nN/kWOROpBDmKUHoPVen/tEKHezJjXY+7tunjobRZwhh
	bLIkB4EkeZQFo3BsSumApKTmiUhFwuDA1FFuyomkh1/2sdA5SPlmT3nR
X-Gm-Gg: AYBFou0MqQsZLMmxZRFZA72Wp4qLj1fLm31giuGlnCrpfXcNIaEn7Fd3S4BMYiN+AIa
	/FvDG+EHDLktbeUmHDZuBWEEL9TN/K0WJFq79I5co5sB5DohwQKirLmGcj8m60++96ZMzKTn8gg
	a3lhPp93Is9JATmaw0upJ5q4TzcYNoue3h8c22MP7GhT7zQAkDuVrooFSl1gLcqbZ4WNPNjpDjA
	jSswC2m5u+JqqrG16ZwVVaPf1v7s2iCdbzGy3oH49TqFEn3ODnX27dodL6+xb/I6RE2ikokX4i1
	YelahUhCmhySKeLABT3lAzKv+UdXACodcgf0PdrnI4tQxzL787iOJcR64fF8BslmtW0j4dqla1K
	fzbm+LK7ujvRpD7IXUek2bpVzxG8A6ikO3cIGsIYfQjskw4NeiRpkc7CEimPzRAgvJ3pgDnznet
	kb++5uhWuks60/aBg8y6qeioy1Nc3CBCc5ndNIx+Mv6/Xvt5afPfr+CM/92oaHOCLJtosn0YYr3
	7DqJ7XCHcxv3ZEy4yO+iEHAYI5g84zdnboka6jaYjOgzSmVZByQh51Rhd20QNlsdtjIiDOtmvyd
	UxRPbi4IPW01kFZT3fuGFm7fYIm9BgFW
X-Received: by 2002:a05:6102:3f92:b0:7b4:879c:bb76 with SMTP id ada2fe7eead31-7d64d7b3c04mr1034478137.21.1794585141712;
        Fri, 13 Nov 2026 07:52:21 -0800 (PST)
Received: from [127.0.1.1] ([179.160.39.42])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-99c8428c7fcsm1635449241.9.2026.11.13.07.52.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Nov 2026 07:52:21 -0800 (PST)
From: Leonardo Costa <leoreis.costa@gmail.com>
Date: Fri, 13 Nov 2026 12:51:14 -0300
Subject: [PATCH v2 3/6] arm64: dts: freescale: imx8mp-toradex-smarc: Add
 on-carrier 3.3V regulator
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
Message-Id: <20261113-v1-arm-dts-freescale-imx8mp-toradex-smarc-add-lvds-displays-overlays-v2-3-327f5d37a9c5@toradex.com>
References: <20261113-v1-arm-dts-freescale-imx8mp-toradex-smarc-add-lvds-displays-overlays-v2-0-327f5d37a9c5@toradex.com>
In-Reply-To: <20261113-v1-arm-dts-freescale-imx8mp-toradex-smarc-add-lvds-displays-overlays-v2-0-327f5d37a9c5@toradex.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Frank Li <Frank.Li@nxp.com>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>
Cc: devicetree@vger.kernel.org, imx@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 ernest.vanhoecke@toradex.com, Leonardo Costa <leonardo.costa@toradex.com>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794585121; l=1182;
 i=leonardo.costa@toradex.com; s=20261001; h=from:subject:message-id;
 bh=ACMvTzpi3rzHKOD3OMtDyhYbpZE8JqAqCI1yxB7JH0w=;
 b=HoglfcWoz04OuPV1Vqs6i563kJXTViuwqXiS/eO2JdpSsEGKBUKtC3UYpYkiHWO3E1ZIQKdt+
 ldKgsbBl3/UAFWUXAlzaLfYPZA21o510HWbuOJ6lbP7HRwY//8EaqMI
X-Developer-Key: i=leonardo.costa@toradex.com; a=ed25519;
 pk=4xvoVLDt+NxIz9D8BJHhT0fD43Ig6XgSDw4jRN/gHzk=

From: Ernest Van Hoecke <ernest.vanhoecke@toradex.com>

Describe the fixed 3.3 V rail of the Toradex SMARC Development Board as
a regulator, like the existing on-carrier 1.8 V rail, so it can be
referenced as a supply by the devices it powers.

Signed-off-by: Ernest Van Hoecke <ernest.vanhoecke@toradex.com>
Signed-off-by: Leonardo Costa <leonardo.costa@toradex.com>
---
 arch/arm64/boot/dts/freescale/imx8mp-toradex-smarc-dev.dts | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/arch/arm64/boot/dts/freescale/imx8mp-toradex-smarc-dev.dts b/arch/arm64/boot/dts/freescale/imx8mp-toradex-smarc-dev.dts
index b31de307093c8..c28d63293149b 100644
--- a/arch/arm64/boot/dts/freescale/imx8mp-toradex-smarc-dev.dts
+++ b/arch/arm64/boot/dts/freescale/imx8mp-toradex-smarc-dev.dts
@@ -32,6 +32,13 @@ reg_carrier_1p8v: regulator-carrier-1p8v {
 		regulator-name = "On-carrier 1V8";
 	};
 
+	reg_carrier_3p3v: regulator-carrier-3p3v {
+		compatible = "regulator-fixed";
+		regulator-max-microvolt = <3300000>;
+		regulator-min-microvolt = <3300000>;
+		regulator-name = "On-carrier 3V3";
+	};
+
 	sound {
 		compatible = "simple-audio-card";
 		simple-audio-card,bitclock-master = <&codec_dai>;

-- 
2.43.0

