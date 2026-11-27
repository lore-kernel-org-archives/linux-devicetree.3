Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.222.46
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795800928;
	b=sLuroQLNPyYrU/VLkAuwcS2vNKZdrc/ZH2iTbMeXeT8nmP9PGz4xjEpofL9JzeskBYON
	 Ua2Mez1mkoN8tRH/dS4J2aFBDrQK+OHrOPBB3H6rp4DlAgdzjP65d7DEI74HpKwhZ/Isp
	 JBDEgGiRFPq0WvnAs42HUnG928mDzngq+PQyH9tNJhV1Mzm4Z/aTBB0OgssYmIbclVs7T
	 r1QjvFplJq++RBZGa88AceLhDBhvisPL30OrPYR52SUSwFMqnRQmzxPev9nPaB9NrExCG
	 6Nasy7wov0E1X7sCKmxbdpYS4W8FIXj2rIyAQ5vVMUdH1FOnVIqR8m1Frz3/QXjL57w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795800928;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:X-B4-Tracking:To:Cc:X-Mailer:X-Developer-Signature:
	 X-Developer-Key;
	bh=lyzGhuMOMHlziF4wP2PnDrjLAU20OQZJbENrKw1pfsE=;
	b=zNKZIgeD7qGdMdE6a7aFi7Il1LpKV77l3GoT4e2e4c6fE9JWbd1xX/7kLMIVzAyMpa5Q
	 pJq9RVtLPdcVuxS9+A1D2H3/SfEl5OOrWy25O5sOVzTUIkFyMYxcWf7ZAtSeqaA45CYVe
	 uCDdWAwIEtAKjrm11LbsbNZ7A1GKsOT+vAlRd5Uf3/xSnbOPgXwTAqpQyfP9kjDF+R15U
	 ROwtv8k9vJ7MMo9P1U2eo3O98sAWJVma2P+t8XQVquvUXLSI/O+AzO4YQjg7Tvp8nkZqd
	 dcc6aiB9vWhNXDyKesYVqoLrV3Glq4jaTrmsXdNPMsLdwcaBwUovoreryzpgKrv2/TA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="S/SvVStQ";
	arc=none smtp.remote-ip=209.85.222.46
Received: from mail-ua1-f46.google.com (mail-ua1-f46.google.com [209.85.222.46])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0FEF1606A326
	for <devicetree@vger.kernel.org>; Fri, 27 Nov 2026 17:35:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0FEF1606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=S/SvVStQ
Received: by mail-ua1-f46.google.com with SMTP id a1e0cc1a2514c-98fea7e52b7so5000456241.0
        for <devicetree@vger.kernel.org>; Fri, 27 Nov 2026 09:35:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795800927; x=1796405727; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=lyzGhuMOMHlziF4wP2PnDrjLAU20OQZJbENrKw1pfsE=;
        b=S/SvVStQ9BV/S2eTTDgJun4UmOgunU3vwvBrgNrWH9Dizpk97OCwK7FV25aNhv6kgX
         WND/5PjMvY1SHa6c8XIzM4l+rpUN4MqfnP7TIr6AFNjx5CYLysFffAqvGa6rAjel6y6g
         KwNuALiw6Dns3YgddLc8jij/3gd6+zzVaLsKtfDMZEW2M5ShwAt9fCU1DoBUhFld4wEE
         xrgKnmsZAUBW2PToiVR3Kc79b+jc+5LdAc8gXvIyM8vM1uAcjdKOFzt2GTdiR1zSwOmx
         EJyUlDjLTzRuJfo61I1LBCS1ssN392+7+cM7r8dp2vwVk2wva1aIS9/G0GrXC3gWuPrA
         wgPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795800927; x=1796405727;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=lyzGhuMOMHlziF4wP2PnDrjLAU20OQZJbENrKw1pfsE=;
        b=s9A2WSPHxkdopcSZAVVY4jH9+Q3EcoAzn3yg18GERXo4azud9cc54QvT2osTw2EP07
         1VBCLuHj9CnexBQlawzgaq5Vdyzdi5BgYSy9njdpi8DgtDgGaGDKy+5ZmxlaJsr+D8QN
         UsxlpYWP9tEMqTv5baJxP8C3PEGme1mPplMwK/+j7vnBsLMW/OoYT26JEBOwJ2XbTx0s
         dQEgxOff2z0gGMfcDkW8LnPTKb+dbii7laquYUFrZ16sbKicO/11bMiNT7BfiDIgHAXE
         ALqbXzy4lNi4wv8e+ZbFABgJIiyZKMUs/wQsYKnufl7/sQFg7HK1w582+E6rC0ujfDS5
         BnGg==
X-Forwarded-Encrypted: i=1; AL+hErHxquNYekiu+rafP0Kq1z8gUEFhxOkRVyxThOK0y9lB5IN2u+gZQMcS2aTOMpCt5J1JszSxFy6GY2Mq@vger.kernel.org
X-Gm-Message-State: APuU4Z8gQBr/kFGun3ZcBMAOuknqVG7zyuMJ5FNuGPD9OpK0pbEyLkVV
	qE5teqVNKNtMPxI2L/j3OBpaKa+82h9NjzhtY8CM9dn6Hf3mboz1hADT
X-Gm-Gg: AZFdTZcJkkfM45UmLCMDWvfmD9iCg5gshhuDGKi3bnT+y5mjY4uSEN9fsPgzlL7D1xx
	5rTxQwocxSrOqsTRf5FAWssGV5AqKuJRDPplxCmDXqH+nig+QhoDKFCRbMiE5tmyd1yWCFW5WZZ
	OISIV4t+xOB62iL/JY/pTI8ujQUx6N/WGQXIuKAYCompm7OYh2CBoLsG54MwOFMxmbNU98wmCEU
	styQ4o6+o5mJXSOgg/nziCxnAMU2icrtw77uSdnipO3Au/De5vNe0Jcd3tzNhe/pcFcQCC5fFNS
	niuRtcRPpSL81iJYAGBjID79v7sZSUcgrSxbN8/S8LcqCGrvuTfnlD1cqoIkmsWpNiNXvchgjNv
	q6WtBwS5ISTLJX8e8oIxuEh+4mhiV8LaSaOp0yy5xof2b2Vni4oGa112bvVNo3+7rHqmZsNIJgV
	U0hZdYFp77GkPEW94I7l/nrdM58jFd6KXfeEWSbxN5IPObIpmZD882a+Ro37F5hTlkq4+BwsjeF
	UhqBr2slwHw49s0Z3LwajL4mV8UpwMyczDL6EuNqQL1rMM0qamgfFz+EPVI7kpVrtZJqls4cqfM
	S8Gq74XAb2MqztL+JVVxiq1IWbPBrcCScg==
X-Received: by 2002:a05:6102:b03:b0:7c3:c0b9:9028 with SMTP id ada2fe7eead31-7d739450a75mr15786710137.24.1795800926783;
        Fri, 27 Nov 2026 09:35:26 -0800 (PST)
Received: from [127.0.1.1] ([2804:1b3:a700:1033:f688:69e1:e4d:ce91])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-99e6e0686b1sm26107747241.10.2026.11.27.09.35.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Nov 2026 09:35:26 -0800 (PST)
From: Leonardo Costa <leoreis.costa@gmail.com>
Date: Fri, 27 Nov 2026 14:34:52 -0300
Subject: [PATCH] arm64: dts: imx95-aquila-lotus: Add internal voltage
 monitoring
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
Message-Id: <20261127-v1-aquila-imx95-lotus-add-missing-nodes-v1-1-162c7ad8c302@toradex.com>
X-B4-Tracking: v=1; b=H4sIADy/CWsC/x3NwQrCMAyA4VcZORtoiivoq4iHsGQzsLXauDEYe
 3eLx+/y/we4VlOHe3dA1c3cSm6gSwfDi/OkaNIMMcREFBNuhPxZbWa0Zb/1OJfv6sgiuJi75Ql
 zEXWUkJh7CqOGK7Tau+po+//0eJ7nD3Ngo5t5AAAA
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Frank Li <Frank.Li@nxp.com>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>
Cc: linux-bsp@toradex.com, devicetree@vger.kernel.org, imx@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Leonardo Costa <leonardo.costa@toradex.com>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795800922; l=1592;
 i=leonardo.costa@toradex.com; s=20261001; h=from:subject:message-id;
 bh=ZxK2MgG5q/LBAnoBWmanwjQtuKQAwsd2KRSb3AQNx0U=;
 b=fZ3SskkRL+/kfEm2nx7HRYt46R1l2PAl/6TN9QxLtD4GvefiuN0cqUMqFN68SMXgstgNXiBP8
 sY8QNLeMM/vBzuFC3QyrLocz+cMYwskiJBnsKtSaP6+1StD2RJak0PX
X-Developer-Key: i=leonardo.costa@toradex.com; a=ed25519;
 pk=4xvoVLDt+NxIz9D8BJHhT0fD43Ig6XgSDw4jRN/gHzk=

From: Leonardo Costa <leonardo.costa@toradex.com>

The Lotus Carrier board routes its 5V, 3.3V and 1.8V internal voltages
through resistor dividers to ADC_[123]. Add the voltage dividers so that
the internal voltages can be monitored.

Signed-off-by: Leonardo Costa <leonardo.costa@toradex.com>
---
 .../boot/dts/freescale/imx95-aquila-lotus.dts      | 24 ++++++++++++++++++++++
 1 file changed, 24 insertions(+)

diff --git a/arch/arm64/boot/dts/freescale/imx95-aquila-lotus.dts b/arch/arm64/boot/dts/freescale/imx95-aquila-lotus.dts
index 4ae600636106b..7c20df249eb20 100644
--- a/arch/arm64/boot/dts/freescale/imx95-aquila-lotus.dts
+++ b/arch/arm64/boot/dts/freescale/imx95-aquila-lotus.dts
@@ -34,6 +34,30 @@ dp_1_connector_in: endpoint {
 		};
 	};
 
+	lotus-1v8-voltage {
+		compatible = "voltage-divider";
+		full-ohms = <39000>; /* 12k + 27k */
+		/* Aquila ADC_3 */
+		io-channels = <&adc1 2>;
+		output-ohms = <27000>;
+	};
+
+	lotus-3v3-voltage {
+		compatible = "voltage-divider";
+		full-ohms = <54000>; /* 27k + 27k */
+		/* Aquila ADC_2 */
+		io-channels = <&adc1 1>;
+		output-ohms = <27000>;
+	};
+
+	lotus-5v-voltage {
+		compatible = "voltage-divider";
+		full-ohms = <39000>; /* 27k + 12k */
+		/* Aquila ADC_1 */
+		io-channels = <&adc1 0>;
+		output-ohms = <12000>;
+	};
+
 	reg_dp_3p3v: regulator-dp-3p3v {
 		compatible = "regulator-fixed";
 		pinctrl-names = "default";

---
base-commit: ebe46fb6c3c40292eb647d0bfd5d1beb05b923c4
change-id: 20261126-v1-aquila-imx95-lotus-add-missing-nodes-d06aa510fe04

Best regards,
-- 
Leonardo Costa <leonardo.costa@toradex.com>

