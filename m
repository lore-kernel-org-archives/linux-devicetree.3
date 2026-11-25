Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.53
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795629808;
	b=Mhjou+WXhQObbgZaThAbj3J7zzzS/w8aGdyVjzpavSWJ3b6RBpcY62S4LbEI7uJiaapI
	 Z0m22U2Pq6yN7nX8azy6D6+RET4wHDh/G43mfQMMJOeCko2yjjTePBB2QSscBBmQYwu7S
	 mKITiepQLiqjEutjf8qiJxIfeaK5M+WINZFQoN9ypZTdRgBoTI0TmKQeouKlfQuvBtbIn
	 DBo1zekAxE6lkFnTfuDgDAR+fqjcVbuWqdlVdUm3vUEiU6ZZSPOpCAX5zajguyfrEnim2
	 ZPv+7zVoIcCI3lsQ1AOcbAGohDGKp+QNX5GiZpdP222aAb5BfmjFi1ZTGhbGyJmHBaA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795629808;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=9SB42I57ppceG6E1W7wOKk3sONGmJq77q2GPQ6ZHdGs=;
	b=Nv6U6pfzKJdkGhHL3ooQtYpo+OlOP+G0F3qgavmmWd4rYum2jYQtdYJfrvk6kNADk25p
	 UHsJ34l59c3FIxKaWCC1eiwKrLSz48ObDSq9PZ/5gtcJVYeFMJoR5QDSMISfwFJU3kzxq
	 RCV8T9Qayw0nm3cvIGfpnsvWNZ0TK8pDEDziuyeoBLzco6uwp0aeWQh27YZ+BzOVSX44A
	 v68Jl48RKlAJnk+sBbuUucR+/Zeq2ngOYWt3DdfLxlcwMTteCfd2OycMYQsucLGjQliQC
	 dCbkLhGxqicwj2MzVRJWpMjTTlW5DB1tAi+PNljvFA5KgjXZi7kl1dkx0+QwULsL2Bg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=amarulasolutions.com;
	spf=pass smtp.mailfrom=amarulasolutions.com;
	dkim=pass header.d=amarulasolutions.com header.i=@amarulasolutions.com header.a=rsa-sha256 header.s=google header.b=h3sDblAN;
	arc=none smtp.remote-ip=209.85.221.53
Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D051A606A329
	for <devicetree@vger.kernel.org>; Wed, 25 Nov 2026 18:03:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D051A606A329
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=amarulasolutions.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=amarulasolutions.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amarulasolutions.com header.i=@amarulasolutions.com header.a=rsa-sha256 header.s=google header.b=h3sDblAN
Received: by mail-wr1-f53.google.com with SMTP id ffacd0b85a97d-4aa5833c263so5866095f8f.2
        for <devicetree@vger.kernel.org>; Wed, 25 Nov 2026 10:03:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google; t=1795629806; x=1796234606; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=9SB42I57ppceG6E1W7wOKk3sONGmJq77q2GPQ6ZHdGs=;
        b=h3sDblANI2RVIH4Yr1D2FwtABrU8bG7C5+5LH6yS+nJ97AEgYBfR7aMEQxPGDgO95Y
         Zr2DOHNRZr0pXgomunrD7vqyUhO83dYa9b16yM2JuS3ig3q0qwRAYn3LpTAJoA/UvUGE
         jXlvsx55c0FAot7DH5NCm+PYK0hwOnNVlIy+w=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795629806; x=1796234606;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=9SB42I57ppceG6E1W7wOKk3sONGmJq77q2GPQ6ZHdGs=;
        b=XOOiiNmjEYvlX0Wi8pAm3VNnvQR0Z4WLHJzYSeyyIfjYN/vBk0ZJqXM1QQRwZfJF4k
         HN6RKAWfdlXX741ZsVUXLjWj1A3o49rFsc7JSyML2+0pMmjROyz6yZPDvbQJ+seV9rgR
         sVyOiGoxcGRxFs1u7KRaJD7RRktPJ+A6jKATUKheShjdLCEJbzUBCW2k3xo4rbgbzNOI
         d5PSXsnnXe3gBMm8mQsCSuqlI+HJeylKN7KMSIyfqWxJMaVKNLFOO1N8VHw65WX7GcXn
         nDTf8C5Mep8zAlMvrBRQWwfV9hPnCNQqm3ho+YjjcMUOYrFmQv7cA+R9goTMcLxzArRQ
         1bkQ==
X-Forwarded-Encrypted: i=1; AL+hErFRn5d9RmyemFxKXQoBfMPXWZSYTdYMKlGRQP6rEHyOQPNjxGTfzxj+bK0juZMH6sIu/lIvs2byTm9R@vger.kernel.org
X-Gm-Message-State: APuU4Z/VnUrlXbjE0tGG1Jsol3MQ+lToiwd97LyhKLsYKnhzVELElm+1
	HRT3suCtDXAdLIPUg2CpJXAi3x2zFxCe7ZZtqLpOqPy+maMAlYiFX5qhS1PaRRVZDXA=
X-Gm-Gg: AZFdTZfeV1ooJ54WuZRuaJ9nqjhcI/dJd3gSZGXWGxPHailGHnnF4Pme1UdAT6bC9k+
	mz3n4OBwbHDEOgpJynwO4ecliG2iymee/UP/UgT0K09HW5gg22+4ZGs5PoFtoxpJgWChpEDC4Tc
	2wYRlBnam89BbQ+0QLShpj6tmnhpH6kSk/uzxgpwnFyiw2NJ1TVXehTLhZd2w/dkaufpXn4VDO+
	/h3hdSVC1pBXXjUpD+zW7jUs119R+HLFhDEejL0J4Y0qRxoQd02pwxjErITt9l4ccyTUzxnXwXA
	RwonRw07FLjC3mn3pnYV5nrNnxJk4FDicZXc47hCzfBTTdHZIPk5/rgsmjmFM8YdS3LpPFfgfxm
	GEBZ6n7w5XDfSbAhepRVGl82G+6PCjTrGkZ52iJnyoUrJXATK4QdSHgVyz9a70/P8BZbOqYK8HR
	ZdirC7OLqfRl0GawAyNoIDp5ttUAVt+kgP3fNDCA0GCq9ixomXcR6rbLT1OV68vf/rLLyn+yXl8
	E6dkQ6fdr59B/NLF4lkfUZ/yvaP/cBCl1oLR+o9PWBNATFOuCoBBrBrBWA/8zjz5OXDEcXjFLAA
	FhU3y2YSVnp8UXc2bjl/paJeEqp7Rs0wwQKwP1oTxJSsan0nl+72/euENSw4c01RMwyY7vx92ge
	SfTlD64DLUrH9D4qnAcXgHglURjmw5pjBGUaaF21iELe4hy7d6D/qX/V4mvpHYq6cTR2avTFWLM
	uKQpDRvKQRUkBcbFW2KXN+
X-Received: by 2002:adf:e00a:0:20b0:490:1881:80ec with SMTP id ffacd0b85a97d-4abb3a4d2camr26718119f8f.36.1795629806160;
        Wed, 25 Nov 2026 10:03:26 -0800 (PST)
Received: from dario-ThinkPad-P14s-Gen-5.amarulasolutions.com (host-79-14-29-58.business.telecomitalia.it. [79.14.29.58])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4b34e9c3ffesm19644251f8f.19.2026.11.25.10.03.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Nov 2026 10:03:25 -0800 (PST)
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
To: Frank Li <Frank.Li@nxp.com>
Cc: michael@amarulasolutions.com,
	linux-amarula@amarulasolutions.com,
	Dario Binacchi <dario.binacchi@amarulasolutions.com>,
	Akhil Narayanan <akhil.narayanan@in.bosch.com>,
	Conor Dooley <conor+dt@kernel.org>,
	Fabio Estevam <festevam@gmail.com>,
	Florian Ager <florian.ager@bshg.com>,
	Haoning Cheng <Haoning.CHENG@cn.bosch.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Qiu Guochang <guochang.qiu@cn.bosch.com>,
	Rob Herring <robh@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2] ARM: dts: imx6ulz-bsh-smm-m2: add boot phase properties
Date: Wed, 25 Nov 2026 19:03:11 +0100
Message-ID: <20261125180316.882220-1-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add boot phase properties to the resources needed during the boot
process.

The BSH SMM M2 and M2B need UART and NAND access.

Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>

---

Changes in v2:
- Rebase on imx/dt

 arch/arm/boot/dts/nxp/imx/imx6ulz-bsh-smm-m2-common.dtsi | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/arch/arm/boot/dts/nxp/imx/imx6ulz-bsh-smm-m2-common.dtsi b/arch/arm/boot/dts/nxp/imx/imx6ulz-bsh-smm-m2-common.dtsi
index 96f084b6ade4..c1ab536bb1c2 100644
--- a/arch/arm/boot/dts/nxp/imx/imx6ulz-bsh-smm-m2-common.dtsi
+++ b/arch/arm/boot/dts/nxp/imx/imx6ulz-bsh-smm-m2-common.dtsi
@@ -17,6 +17,7 @@ &gpmi {
 	pinctrl-0 = <&pinctrl_gpmi_nand>;
 	nand-on-flash-bbt;
 	fsl,use-minimum-ecc;
+	bootph-all;
 	status = "okay";
 };
 
@@ -33,6 +34,7 @@ &uart2 {
 &uart4 {
 	pinctrl-names = "default";
 	pinctrl-0 = <&pinctrl_uart4>;
+	bootph-all;
 	status = "okay";
 };
 
@@ -75,6 +77,7 @@ pinctrl_uart4: uart4grp {
 			MX6UL_PAD_UART4_TX_DATA__UART4_DCE_TX	0x1b0b1
 			MX6UL_PAD_UART4_RX_DATA__UART4_DCE_RX	0x1b0b1
 		>;
+		bootph-all;
 	};
 
 	pinctrl_uart2: uart2grp {
---
base-commit: d868355562901bd5043b52ab903811bd95a7d65a
branch: imx6ulz-bsh-smm-m2-bootph

-- 
2.43.0

