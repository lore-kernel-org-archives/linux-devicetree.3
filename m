Received: from mail-ed1-f42.google.com (mail-ed1-f42.google.com [209.85.208.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EBC863D8915
	for <devicetree@vger.kernel.org>; Mon,  8 Jun 2026 14:22:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780928559; cv=none; b=tnn5trMNMWeLO+d6P6ZAllPa3f4TuBw6FBMUl+jzGHSsfu/6uOgXJPiC0wk7u0yQtU7DY4qG2wwG2cau5I3bVCr7Y3xk7qfcefenv43EcsIA2kAQZ73UXQL8qhhQCwptFBzKDaCOGt3pzCBKZAOZjIiAtS4iecl+cCgjMk6TYdY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780928559; c=relaxed/simple;
	bh=u9m2WwsAUh5Coh/I3NjhlkfL1KrpsMcmoa+vDwMzK1s=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=DL4Tw1X+ClTJbNLXqDV/dZC2eTMq/5t+KOn+GtH7gOgsjQK8xhBRJ+avXF6KSFxDYZi86d7R093/htI2E2sUairwRGH6YSOE0PSGbo1vY0nj7W3X92Yb3QMMB/CDcI5qqNTHpPXNMNEGZkYa5r9+OwiM7N80UnBLJ3M7fHBPJog=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=amarulasolutions.com; spf=pass smtp.mailfrom=amarulasolutions.com; dkim=pass (1024-bit key) header.d=amarulasolutions.com header.i=@amarulasolutions.com header.b=A8F/G/v6; arc=none smtp.client-ip=209.85.208.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=amarulasolutions.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=amarulasolutions.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amarulasolutions.com header.i=@amarulasolutions.com header.b="A8F/G/v6"
Received: by mail-ed1-f42.google.com with SMTP id 4fb4d7f45d1cf-687ed9aabb3so8625597a12.1
        for <devicetree@vger.kernel.org>; Mon, 08 Jun 2026 07:22:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google; t=1780928555; x=1781533355; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=O50jeHT7n6IfAQOe8+U4Hub9w56VMIy6Werwz+99kvc=;
        b=A8F/G/v65Egz1Nx+ybnn9zbsRQAOcUtpAaiZGq5Ubzha4v70RUdVqH4Z25WWGibjSl
         oIZCs0tyU5Rdm0jwheHMaujKyBI6Ukc2NhowGxtM/rOI7czVvg+YG+p4nRnEBhYwI71k
         DGeBRgNLq+NN3X9LgdVXgf2LzrYniegnTFxJ0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780928555; x=1781533355;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=O50jeHT7n6IfAQOe8+U4Hub9w56VMIy6Werwz+99kvc=;
        b=N6pwswaGRqsPKc3tlE/GNCKiKBNsTdTn1pC9aD4M7B/vzwyDXAFaj4RqX0vupSyioY
         d9le1cVg/poskPPRJ2FH9J5b4TbkfhWM0QLDKP6x7RJ2RIg3mfiXtAbohm6zmQLXCIhm
         rdKOeDc+l8A78ruflIu/fyze6y6mJh3tpCoyi0BD9LW8wykz/a+/o0KP6suXxY5XldQc
         lIL4tq9E0B2309gBOwLOz2nXm62L75AOLrQagsqIJFK72PKAqbPCUQyKiiERDmoDlnu5
         bzGYTNB4I+34GIyI8ivuOfNHvJufQXqUtJQimDV9pWA1qn+dgmMSiPkMFypW463XoLVE
         K0Fg==
X-Forwarded-Encrypted: i=1; AFNElJ8/Fh57X/6ifwUTWqUjDHz1vUAuIaq29pkcUTC+D+FfIfShtXjXlF4NEWqFpeE0tHEnA7jiPaccJ4l/@vger.kernel.org
X-Gm-Message-State: AOJu0YxCkKJ06MV3L3D9q2hOBueTnkNIjB/JtD7v/cM7KqyqVrJcZDd0
	ogSCGTabN4y9fYathQqvOI/29slSsSNeKoZvlPBYWfB9FOQro1UysnS78EAFHC4EX+g=
X-Gm-Gg: Acq92OGy3/L67p4D/mdl1l02ObjxElnV29YULf62veiIAvIiXaia5bV6xp4CYgFsr/w
	7iaKIL4ohrb+OQxypiNv2W0BRX2H7I4/33R5e1VsRijppdPQ/vzchG+qzKRsDR47zwp6x3fA70n
	OWhRMTp9AkXqUWsyeul8Vg64tZtZRkbzLWbCqQr1MPk+U5dZNfPdUyeIoUuhb9k1RJ3hWrE87t/
	bjQnZzNXl+tHMtNGLS8gc+Ak6v2Q/nOhTOVSWZ8YNQzAMnuShPs11zwpnNzOHGG/EDnn1nsS8YZ
	RH8RiFfJ0QxsNyiJGlpomgHrEAu8RMTOH11PoRkKPon+5fQ2JmLnptyd8Jp4VN0rE4sQ1Nf7K3J
	Yk101F1SlEyC8U1DgCQbpdrSGSeTDcFw699hXMpuH7gAzk/eqnQ3syR8EgMBrrlwMwShl16gPRg
	XHAlDB4BLrPuru2hTgGYB9fGzOGR2vKNvAQe/uZpTJI0FXQ3ekJ5txwoz96HoyYwt9m57ODWGr3
	/0WoTKIS6uS+Z4submiDaoRvdYtlNvOkW7He2QR7i5V4w93XkB6AHr8b3NmQXq2R63T2A==
X-Received: by 2002:a17:907:a44:b0:bd5:2c3c:616a with SMTP id a640c23a62f3a-bf3743e3051mr763130166b.37.1780928555274;
        Mon, 08 Jun 2026 07:22:35 -0700 (PDT)
Received: from dario-ThinkPad-P14s-Gen-5.amarulasolutions.com ([2.196.42.139])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-bf055307a35sm881847066b.52.2026.06.08.07.22.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 08 Jun 2026 07:22:34 -0700 (PDT)
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
To: linux-kernel@vger.kernel.org
Cc: linux-amarula@amarulasolutions.com,
	domenico.acri@engicam.com,
	michael@amarulasolutions.com,
	francesco.utel@engicam.com,
	Dario Binacchi <dario.binacchi@amarulasolutions.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Conor Dooley <conor+dt@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Rob Herring <robh@kernel.org>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-stm32@st-md-mailman.stormreply.com
Subject: [PATCH v5 05/16] arm64: dts: st: add CAN1 support on stm32mp25
Date: Mon,  8 Jun 2026 16:20:22 +0200
Message-ID: <20260608142221.952245-6-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260608142221.952245-1-dario.binacchi@amarulasolutions.com>
References: <20260608142221.952245-1-dario.binacchi@amarulasolutions.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The controller is compliant with ISO 11898-1: 2015 (CAN protocol
specification version 2.0 part A, B) and CAN FD protocol specification
version 1.0.

Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>

---

(no changes since v2)

Changes in v2:
- Add resets property to dts CAN node. Suggested by Sashiko.

 arch/arm64/boot/dts/st/stm32mp253.dtsi | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)

diff --git a/arch/arm64/boot/dts/st/stm32mp253.dtsi b/arch/arm64/boot/dts/st/stm32mp253.dtsi
index eeceb086252b..7e82f01fdc10 100644
--- a/arch/arm64/boot/dts/st/stm32mp253.dtsi
+++ b/arch/arm64/boot/dts/st/stm32mp253.dtsi
@@ -43,6 +43,22 @@ &optee {
 };
 
 &rifsc {
+	m_can1: can@402d0000 {
+		compatible = "bosch,m_can";
+		reg = <0x402d0000 0x400>, <0x40310000 0xd50>;
+		reg-names = "m_can", "message_ram";
+		interrupts = <GIC_SPI 91 IRQ_TYPE_LEVEL_HIGH>,
+			     <GIC_SPI 94 IRQ_TYPE_LEVEL_HIGH>;
+		interrupt-names = "int0", "int1";
+		clocks = <&rcc CK_BUS_FDCAN>, <&rcc CK_KER_FDCAN>;
+		clock-names = "hclk", "cclk";
+		resets = <&rcc FDCAN_R>;
+		bosch,mram-cfg = <0x0 0 0 32 0 0 2 2>;
+		access-controllers = <&rifsc 56>;
+		power-domains = <&CLUSTER_PD>;
+		status = "disabled";
+	};
+
 	ethernet2: ethernet@482d0000 {
 		compatible = "st,stm32mp25-dwmac", "snps,dwmac-5.20";
 		reg = <0x482d0000 0x4000>;
-- 
2.43.0

