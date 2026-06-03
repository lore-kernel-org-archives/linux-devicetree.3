Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 46BF5478870
	for <devicetree@vger.kernel.org>; Wed,  3 Jun 2026 12:00:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780488010; cv=none; b=UahquB4FR/w2odAKbW3MEZxkgiIdBtTbtHKwtQ8iDl607GJN8gARvj+mwZ+lJJ9NktpsVJMqrk8sA1NbGamsqzGCDtVilQCAzCc/F4QzqmSugkIEjqmJrpziwAJqigwDmV14efHCsLbCOvfbefpXyz1JxqPzaP4VG+95YxqUeig=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780488010; c=relaxed/simple;
	bh=PGbBXyPSfP5yXW0TXTzdPz22YK+eL/YQBfFVYXU17pc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=M50JCc8dyEFG0Wr9FyslD41CDp0oFTLH8/rBWV5U9A/A0G96SnTbspv1DokJ83xytDVgqLGGvpy84u0DDRACa8bkv3LauAuPVnH3xEZjtz/UeaRzzMvJ01//MosPmzZPv+LZfOdii5aBdcE7lyNY4E6laxEJndKNIS9nMKWXjK0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=igfVI1ty; arc=none smtp.client-ip=209.85.128.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="igfVI1ty"
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-490b7866869so7374455e9.2
        for <devicetree@vger.kernel.org>; Wed, 03 Jun 2026 05:00:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780488008; x=1781092808; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=FEpNdkvG3qeZqCTI9NkgE9+3r/xOTGW4/MLX3MDeIt4=;
        b=igfVI1tyMsV65TKGY7YYfJOpG2nSTD8rBb3VBLwSKb3nj+bJwrCLiGqWHVjIdKtFz1
         /GiCI5TuBw2bXCEWZVeFxVaPjj9VKvjuHMAr0h6SqPlkFGjLDENIJV1m7yd0SGg/2Hcv
         Hr8Bcdh3WMdkjm7PaDhhsC0GUOSCUcgXOOzlo/kbSb2xUVGfKca+pm4nGlmWI3J5FIGq
         h0r0/QYspKH9Qtz97r3+L6DuRpTXSaB64SYal26HD76W7Bnshx+F3DqcN395TGJ/xJQ2
         8PAnJSQVpuMkDuJL0HDt3cmeOs02CG8DlkZm2MM7fKKGn8tcqZijQlHZa4F3aRYLpK5W
         eC9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780488008; x=1781092808;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=FEpNdkvG3qeZqCTI9NkgE9+3r/xOTGW4/MLX3MDeIt4=;
        b=Bw7oBCYDWlhxZl0F4h/LBREmFRJAewwnH324FnvDIIUO3QDmHfHBs1k0lGZqqt581q
         yMaYrjbKv/gjkXr2axXYpf1tp71pVv77pTHZfCZXVquA+q50Qa34vb2tG5FswA3/5LTU
         LKUkYz6KxBKRrL+47X7n9zMt48tlcizhLik7aHpLcgJ9CIZGtDGJZ7hqJ0LoCMM6JjYl
         sXp4hN68pAtswjTZ+QiAvubX0LFD2K+M9Bk+aPtJMjme6rirEb5mnh97BvBDQP9Uv7Z+
         xFpmzpE9khBy3dx18bsZxkcRLIJGZlVazu/ixBIG9L/mDDOBNbrebKGgsiv0AIW/7UbE
         UqBw==
X-Forwarded-Encrypted: i=1; AFNElJ+mbfuTUXSg+D9KJ6xWB4B99slt7sfj2EGs/bgJDzkrxJYhBiwZ6WAhrJh4mhSG2CpX0DF1TmuBdJ48@vger.kernel.org
X-Gm-Message-State: AOJu0YzZU9TZaVp0klfyg1JvyyEw9NwkN0y/4wFTJO4X0SxH/rw12wWN
	jdd5LGQkTc7irWTYFKdSxXxFrNDg0MfDLaN0vkFF416X8zjxa1Onp25S
X-Gm-Gg: Acq92OHw10zXkci0vM1iZnM1wE5iaOhbKvZaAbN/dwrg7409hlXjaOIIYO+xMP3/o5L
	W6GVRm6Rzgf6zjP6QBAMbmKATp9mlBN4aRxMfykQgRIwD4UHNATP4DUPPHBVwffhjElFDZRPsIH
	xP1rJIC/4aFp7/mg70wXM7kNsvw5cMy9W5nW9nA2IJnEgz2QvE/bXxsniCUqMXgZpcXpeBcsHne
	NEVAXA139cvskDWrgg3kehl4U50RrGpwMuX1JJwrI1qd8S0NWjhq04phMOEvHKDBWd8XXFxez66
	/L012r0VWpWXdR5/xxSL07d6+PJuIB8y7XYqawIhomGyTOV4gsTQwmtT8/Z99lRJR8cvMuzTDyI
	gdsXt+Ydg4qf/peXBAK7QTtsrJCqSGJDuNgItRtLSTvCV+Wi1FatqRJ2jdB2YMbCDTkGPjKcQmJ
	eAlIDs50ZTgPy7l/F8KlckyrI+mWpJLg4hg0DsS3pTuqWIc/Y79Os1PfCgUSN9+U8Hw1RYB7YTr
	AFj9ctykPUfDlsKKLjrfh0GhqibAhDuyQRqaxqtlBq6InWO
X-Received: by 2002:a05:600c:3e05:b0:48f:d5a0:284e with SMTP id 5b1f17b1804b1-490b6101131mr53564315e9.28.1780488007482;
        Wed, 03 Jun 2026 05:00:07 -0700 (PDT)
Received: from Lord-Beerus.station (net-93-144-65-244.cust.vodafonedsl.it. [93.144.65.244])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4601f344762sm7771928f8f.23.2026.06.03.05.00.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 Jun 2026 05:00:07 -0700 (PDT)
From: Stefano Radaelli <stefano.radaelli21@gmail.com>
X-Google-Original-From: Stefano Radaelli <stefano.r@variscite.com>
To: linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Cc: pierluigi.p@variscite.com,
	Stefano Radaelli <stefano.r@variscite.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Frank Li <Frank.Li@nxp.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>
Subject: [PATCH v1 07/12] arm64: dts: imx8mp-var-som-symphony: add HDMI support
Date: Wed,  3 Jun 2026 13:55:45 +0200
Message-ID: <35c4e4182d90db29f447d0ea96794d7230a75fac.1780487415.git.stefano.r@variscite.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1780487415.git.stefano.r@variscite.com>
References: <cover.1780487415.git.stefano.r@variscite.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Stefano Radaelli <stefano.r@variscite.com>

Enable HDMI output on Symphony iMX8MP Carrier Board along with audio
support.

Signed-off-by: Stefano Radaelli <stefano.r@variscite.com>
---
 .../dts/freescale/imx8mp-var-som-symphony.dts | 47 +++++++++++++++++++
 1 file changed, 47 insertions(+)

diff --git a/arch/arm64/boot/dts/freescale/imx8mp-var-som-symphony.dts b/arch/arm64/boot/dts/freescale/imx8mp-var-som-symphony.dts
index fe1699649414..6878b89c4db8 100644
--- a/arch/arm64/boot/dts/freescale/imx8mp-var-som-symphony.dts
+++ b/arch/arm64/boot/dts/freescale/imx8mp-var-som-symphony.dts
@@ -48,6 +48,18 @@ led-0 {
 		};
 	};
 
+	native-hdmi-connector {
+		compatible = "hdmi-connector";
+		label = "HDMI OUT";
+		type = "a";
+
+		port {
+			hdmi_in: endpoint {
+				remote-endpoint = <&hdmi_tx_out>;
+			};
+		};
+	};
+
 	pcie0_refclk: pcie0-refclk {
 		compatible = "fixed-clock";
 		#clock-cells = <0>;
@@ -74,6 +86,41 @@ reg_usdhc2_vqmmc: regulator-usdhc2-vqmmc {
 		states = <3300000 0x0 1800000 0x1>;
 		vin-supply = <&ldo5>;
 	};
+
+	sound-hdmi {
+		compatible = "fsl,imx-audio-hdmi";
+		model = "audio-hdmi";
+		audio-cpu = <&aud2htx>;
+		hdmi-out;
+	};
+};
+
+&aud2htx {
+	status = "okay";
+};
+
+&hdmi_pai {
+	status = "okay";
+};
+
+&hdmi_pvi {
+	status = "okay";
+};
+
+&hdmi_tx {
+	status = "okay";
+
+	ports {
+		port@1 {
+			hdmi_tx_out: endpoint {
+				remote-endpoint = <&hdmi_in>;
+			};
+		};
+	};
+};
+
+&hdmi_tx_phy {
+	status = "okay";
 };
 
 &i2c3 {
-- 
2.47.3

