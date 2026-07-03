Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9CC3D3CF1E6
	for <devicetree@vger.kernel.org>; Fri,  3 Jul 2026 15:06:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783091216; cv=none; b=kUWAUfXTknepTMSsC/EJX+dh4tjL/Jd1P1g39zk/7ZxHqoDyvZkvYAzcUqsSjMoIaBqJx0+2AoB8Qby4s6dIYgBpcxuCvAPRxqbD7Z5H+w6y92sxb9W1IFtSPQjRT9g+5GjklVJwG6hP1X6yM2oL87AwNNYL2uXjFZJMO/XqUAs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783091216; c=relaxed/simple;
	bh=4Hl13iZh1j82GcdaqZI3qwLrftrHP4P1CgqtbfTerR0=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Qsmjpqo54JxJy/d+WE5HbuZVlt8Wts/EooCzMjeK9vxS7LYzy02UXnh/MRZuO16N0GqZVKkBFDIwPrRIHHMorkapumubB0M8LHUZcw1HkMAHcDKmB7fMq1fcQKxrucDmhQJnDdPkcmG7u+YpTWyjCmdpPh0hrrBVcr/zMFQfNqk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=VXA0BfNR; arc=none smtp.client-ip=209.85.221.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="VXA0BfNR"
Received: by mail-wr1-f53.google.com with SMTP id ffacd0b85a97d-476d8e647e9so598956f8f.0
        for <devicetree@vger.kernel.org>; Fri, 03 Jul 2026 08:06:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783091213; x=1783696013; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=0YKAhBBa9PGx36rHtTdnpndz/n8JA20wp16kInv0jHQ=;
        b=VXA0BfNR0YO46KSAko9/lup3trum66FNiosYFUrVmKtO3js6AsK94C0N8XgyUWsZp5
         QNn+6fAWy+MXo7KYF8bzocLX9kb+bL5zqDd7sks8icFNqNa5Cn4rXIZvOlKJpqXATVLQ
         2q/8rhs/hqVfoKE2MLENvIj/y0pH8n3OxUwWcI2mV5Z8yBqQ2K9IWFKr6540NiqkVgJV
         mY35XiO0Opqn7oKeo3GVdtA8tEBwXlNq6RorJP5JKPIDc1avQ61AaXcAJjN0sDLS/xnh
         f0DDBsnGcdGrdVTGrm0dTCla318h1hQ8KS2sbOWJozmzZs4wGCm7zxXRVP/ug9swFBmd
         0CYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783091213; x=1783696013;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0YKAhBBa9PGx36rHtTdnpndz/n8JA20wp16kInv0jHQ=;
        b=fVHYmyXLmEEwDLHeFNfPSjOr2WU7n3tA0zwiNW66alb95SCNDDHXrhocMtCMnXFmAM
         /sgw/JHgoxgXcZyB7nVgdhGUydGisuX/LPvLFOqnMTFn34UqsLuZxYVuQlhy11JTSIy4
         IGcjpVZIISwzYzOdZnn0b4JZK1Qp11rVJwmEAXKQ61/jSA/9MH1U1gHfqyyrNxATwEOm
         e6q3ln135UNfSVIhpgR+OsOEQjvHcztJLpOf60U2VApqDSP9oNf6UncA3vdyGA+HfkU8
         0TeHQ98eS3EaV5LyhQHo/oCLzIH6m1rGNEEf8nCM2g8RmyYy0Us/1Np7VAZFoakCM/FH
         EIhw==
X-Forwarded-Encrypted: i=1; AHgh+Rq3KlmkxBLai2EIWdZun44Id8XyEgxdsKN+ZP88JBZKA7LQkFKfWhRUJ2tflJaWbaXrTda8fDKLrKaL@vger.kernel.org
X-Gm-Message-State: AOJu0YwPexkYcK2Hh5uqYgBrvjbYftwztgRbOyZNM6LhS+3frChfEgsz
	zDx3nuiwz39ZP1nl+9eOKpX+SZEH65R+O4icKICBU43ba5j1PoqzG2mBKK+Rpw==
X-Gm-Gg: AfdE7clMieVdQemCvtBnniChdALRcdbslr37ZIlCCz7fds0OHJAPDEOv1G7qg+Qh5Vs
	Gx+itWE4VGVqttaxISKehtqVtNQ2l6ySB5ZtwGG9BYEeIMWqP3XEXum3Lo/Fa4CFezzyhjBZWYW
	MHkQ2xfhGZ09pXnVHtNTEvpb3izA/RLIUgap1e0HKMajQVfHoVrs3yfEovpbAYQux2JYmFwtgDG
	fjmKXmVay49Dx4WQmJphVNha1JQlp8516zy+pB3N8mkcd1YL1VOAWgV3lQjMP7UAQHAKQaTQ+ja
	L1t0MrWrMuo7nCwX6jL51G5/wMGFMGti5QwXFaNH4WjJBMVVdDDcANvXScs0mea39Hq1RqmEIKo
	YfnD6Ybwq7QkCV1kRDtSAOYZAgdzcKCtHOKfBu6/m1P37OtYK1AiSE2gS4coehCnTT/pQW3Qhhb
	0RYID0M+XMq/y+GbllNC5Q3F9I4deK3YDrlDW0YoAxAqA6wNNzkn3ThX2l2J3ZzoEzKAfD1rG+X
	1yOa1aBniXlUNaT1FPCEcz95R4=
X-Received: by 2002:a5d:540f:0:b0:475:f0d1:eb70 with SMTP id ffacd0b85a97d-4775d519803mr11861130f8f.61.1783091213061;
        Fri, 03 Jul 2026 08:06:53 -0700 (PDT)
Received: from Lord-Beerus.station (net-93-144-65-248.cust.vodafonedsl.it. [93.144.65.248])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47a9de1d905sm9487f8f.2.2026.07.03.08.06.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 Jul 2026 08:06:52 -0700 (PDT)
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
Subject: [PATCH v2 1/1] arm64: dts: freescale: imx95-var-dart: enable NETC block control
Date: Fri,  3 Jul 2026 17:06:49 +0200
Message-ID: <20260703150649.234680-1-stefano.r@variscite.com>
X-Mailer: git-send-email 2.47.3
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Stefano Radaelli <stefano.r@variscite.com>

Enable the NETC and NETCMIX block control nodes on the DART-MX95 SoM.

These block control nodes are required to enable and use the NETC
Ethernet ports.

Signed-off-by: Stefano Radaelli <stefano.r@variscite.com>
---
v1->v2:
 - Also enable the NETCMIX block control node

 arch/arm64/boot/dts/freescale/imx95-var-dart.dtsi | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/arch/arm64/boot/dts/freescale/imx95-var-dart.dtsi b/arch/arm64/boot/dts/freescale/imx95-var-dart.dtsi
index d43270a1d907..b4c55bd33858 100644
--- a/arch/arm64/boot/dts/freescale/imx95-var-dart.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx95-var-dart.dtsi
@@ -178,6 +178,10 @@ &mu7 {
 	status = "okay";
 };
 
+&netc_blk_ctrl {
+	status = "okay";
+};
+
 &netc_emdio {
 	pinctrl-names = "default";
 	pinctrl-0 = <&pinctrl_emdio>, <&pinctrl_phy0res>;
@@ -215,6 +219,10 @@ &netc_timer {
 	status = "okay";
 };
 
+&netcmix_blk_ctrl {
+	status = "okay";
+};
+
 &sai3 {
 	pinctrl-names = "default";
 	pinctrl-0 = <&pinctrl_sai3>;
-- 
2.47.3

