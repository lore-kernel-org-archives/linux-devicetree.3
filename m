Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.51
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795565204;
	b=htvHIfONfFVJTaK8oEp5zmRh38bEa0lvtbUb7eQstvhae7//Vrx23SEqdaj4rj5/cGmH
	 sYQfvhiICyNxHx0relNnj22nwqHl0vld0Q4yoYn3GoHgfm1u4jUbNYpCOHttXLbJhWgxr
	 NHd31etuBeS23O2K30R8oQy1HkjgXdQRFjDSKBx7SbzFbLHn9IbObx+SjGqP48rdu7X+k
	 9bh4PPhxdAVA6kn1COQKWqe0dNJSD8tqxqcTtn3KxI2RS1X00uZDLFsZEG3H1Y6SVYxI4
	 ReLfmAKAUH3UL8IUTtmk+UyjFHLxAZ8QVZw4nH/uYeS7N0RX2FwAVAz91GLq8IOTjRg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795565204;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=Occbyy3y/jP5HHZRTJX5SBTdt340G7hZawKGF+Iladg=;
	b=t4AdCf2drGN+f/SxHaab1MyagjCJJTzyn5xRSr8YvDo1HN9ld2YBoLyCaMvdwDKfPiHA
	 gIYj0hy3J/NfE+7XGU5/jKMH7HkvsIDTp67MmvWPPJtl4wTCNF4o9Tpx9zQo6aH44TXzO
	 bd880kokYnj+UBJRGLbiWYmjD3kfu4UBWF4cBB03g+h77skq3FJ3zqBMqtEohR1llJaiG
	 JgsdM1xpM7CSnM1xp6fodSw2M8Bcfp645SfwTdUTL++YLR4oY+tSoNUx0Vy6KDcxhN/I+
	 ND8SORlf+R7+4Aip9Pb/UBLnB4eXr+lHQ0QLgQVhZFzGLDi+tuCFhs1haXPbV3hhhQw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=chromium.org;
	spf=pass smtp.mailfrom=chromium.org;
	dkim=pass header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=We0+k+E8;
	arc=none smtp.remote-ip=74.125.82.51
Received: from mail-dl1-f51.google.com (mail-dl1-f51.google.com [74.125.82.51])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B36D4606A687
	for <devicetree@vger.kernel.org>; Wed, 25 Nov 2026 00:06:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B36D4606A687
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=We0+k+E8
Received: by mail-dl1-f51.google.com with SMTP id a92af1059eb24-1b3a05f8b5bso6724541c88.1
        for <devicetree@vger.kernel.org>; Tue, 24 Nov 2026 16:06:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1795565203; x=1796170003; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Occbyy3y/jP5HHZRTJX5SBTdt340G7hZawKGF+Iladg=;
        b=We0+k+E8apvFC8oDCQ4Ni1loE4cRlKkdtWtdGverI04xuZIjOgNg/axR8lHVexp6p2
         rQWIMcXPidmO751A+qWQr23g3zg1fSMgEhdljKUN2aGhUVl1I2t7XojrwFYn50o2V/Ed
         rDCAhKWJrcbgqlEPKF4cqEyV5myL8qy4Blk2k=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795565203; x=1796170003;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Occbyy3y/jP5HHZRTJX5SBTdt340G7hZawKGF+Iladg=;
        b=A+oGT1BDyeJLNvXQX3tKzbdjt3AEG6N2W4YrtdSfQgBFherYBqBvMH3bOUxJYX9XWl
         +sVMvSDIm/qYMCbiOaxNnzY/GCRpcbNpTbbnanOkdP8xRETnYEowzakTVpkL/wIXAI/G
         STLFW4edSNSNkrqvSAPUF+39mJhJzRyXbuUYIDukfSy5n4kcexTJNsdxti7ALSqUnk5Q
         A/3P0MPKWqcTVGDMZ/3b7YjExtADuIKQs7yc+vAhSV/k2FGFCZXf2pgiE5faBHRHvcFr
         Wc/HwPw2HRgG8liqqVyaHKyPklYALnMWRKgjPCqqbsE72D839qhy3iVDMZ9kOrq1TwxX
         M08A==
X-Forwarded-Encrypted: i=1; AL+hErESmADv/wKNvhjo6w0YVnUeUBqnF8CHtP+Nn6MLotPciTS2NouuNqxoeLQyjO3oh/DXa6t6knDOUN6S@vger.kernel.org
X-Gm-Message-State: APuU4Z/rCzFg4yZwJJLrpgah6iC3KvOZV5wCOLIrXNss2mwr9s0S6yQZ
	g3mVjlqbdi/LEHfWScl+JvWiAyQJB1dXpQLkcBlTU4ryDjI3fVc5fmA8z+c9lqpGAw==
X-Gm-Gg: AZFdTZeetaBZiFCPderlBW8jCBKDl00PG7jFTAottUdXPgvRhdyNFoqePs3f9KpE3Ap
	InQ8/0dO08CwO4mRjE7z+PqX9jvn7mSmRCp8NHtCQkuKmxBCfCXprpydJdbE0zlsbW+xE7gS5Pv
	DyL5RGrCsCv6sTNZUd9Zl69DcUbq9GbN58unsrpolq7JXPrA/+DTiJEA69RtylXjTzaUgCumcd+
	Ctei80uH5+OyHCwNzR0BrFrhnEl74Nlh8crBNUElvNr7eZLy9SBh4mfrtiF9Sz8tFtzYZKo3KnS
	l8hn07xOYp7A00VlRwHFIYIRZNytwtVl5r+bpkbsWnCMeeVvds2aTqr56FGY7LVyCLw8xUrIkWt
	FPkNy/gQezRYcprpGDNZv6Ywij8P1l/sGqQe8kvlC3uuddQy0P253nAjdpePdq5NbMeI/txHehw
	RPgKrz+p2v6LXP1266BxwY2UDJx5CBbUNver2ZO3Zr8ZFalxKEXctacM+8WWp36M+N53bAzqQxt
	aMBU7Eqs4l379T1r+IH9LeyqUoxjKQIbhTKKC/KCc80UJmukjibpxp17gpnZFAV0i45obz1s3d4
	a1FCPEbbaBpXZ0X5kXOz3tq+P4+hdE0zzbq/J09wF6jI6sY34vdeGLdx6OKPQ98AeXAYWVMUFx/
	xR9ZFKipxYJxWmQ==
X-Received: by 2002:a05:7022:3d14:b0:151:6e80:baa9 with SMTP id a92af1059eb24-1b55687f17dmr25268239c88.12.1795565202763;
        Tue, 24 Nov 2026 16:06:42 -0800 (PST)
Received: from localhost ([2a00:79e0:2e7c:8:ea9b:d8a3:ba44:2d0a])
        by smtp.gmail.com with UTF8SMTPSA id a92af1059eb24-1b5567e2bd1sm36588977c88.3.2026.11.24.16.06.41
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 24 Nov 2026 16:06:42 -0800 (PST)
From: Brian Norris <briannorris@chromium.org>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Stephen Boyd <sboyd@kernel.org>,
	Brian Masney <bmasney+clk@redhat.com>,
	Jerome Brunet <jbrunet+clk@baylibre.com>,
	Thomas Gleixner <tglx@kernel.org>,
	Ulf Hansson <ulfh@kernel.org>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Peter Griffin <peter.griffin@linaro.org>
Cc: Tudor Ambarus <tudor.ambarus@linaro.org>,
	=?UTF-8?q?Andr=C3=A9=20Draszik?= <andre.draszik@linaro.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Radu Rendec <radu@rendec.net>,
	=?UTF-8?q?Jakub=20G=C5=82owacki?= <jglow@google.com>,
	linux-clk@vger.kernel.org,
	Douglas Anderson <dianders@chromium.org>,
	devicetree@vger.kernel.org,
	linux-pm@vger.kernel.org,
	Mariano Marciello <mmarciello@google.com>,
	google-soc@lists.linux.dev,
	Brian Norris <briannorris@chromium.org>
Subject: [PATCH v2 8/9] arm64: dts: google: Add Laguna CPM node
Date: Tue, 24 Nov 2026 16:03:42 -0800
Message-ID: <20261124160343.v2.8.I4778aeffbdc796147efa8114431efcb201063b59@changeid>
X-Mailer: git-send-email 2.56.1.831.g720f3f5937-goog
In-Reply-To: <20261125000349.3385325-1-briannorris@chromium.org>
References: <20261125000349.3385325-1-briannorris@chromium.org>
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

The Central Power Manager (CPM) is a co-processor on the Google Tensor
SoCs, as used on Pixel phones. CPM supports power-management and a
number of other features.

The Application Processor communicates with CPM over a pair of mailbox
channels. CPM provides clock, power-domain, reset, and interrupt
services, so we include the appropriate cell-definitions for those.

Because this also adds clock, reset, and power-domain support, we add
them to the UART node at the same time.

Note the use of dts-local headers:

 - lga-lpcm.h: these are firmware IDs as defined by the CPM firmware,
   for use in #reset-cells specifiers. They are not strictly a
   "binding", so they don't belong in include/dt-bindings/ -- they are
   used for naming documentation.

   Notably, these are also used by the clock driver (where there's more
   complexity, and so the firmware addressing is kept out of the device
   tree), so we'll have a duplicate copy there too.

 - lga-cpm-reset.h: these are also defined by the CPM firmware. We keep
   them in a header here for naming documentation.

Signed-off-by: Brian Norris <briannorris@chromium.org>
---

Changes in v2:
 * Rename cpm node to power-controller
 * Switch to #clock-cells = <1>
 * Add lga-lpcm.h instead of keeping them in dt-bindings/
 * Move reset IDs to a dts-local header; these are only for naming
   documentation, not really a "binding"

 arch/arm64/boot/dts/google/lga-cpm-reset.h | 175 +++++++++++++++++++++
 arch/arm64/boot/dts/google/lga-lpcm.h      |  54 +++++++
 arch/arm64/boot/dts/google/lga.dtsi        |  20 +++
 3 files changed, 249 insertions(+)
 create mode 100644 arch/arm64/boot/dts/google/lga-cpm-reset.h
 create mode 100644 arch/arm64/boot/dts/google/lga-lpcm.h

diff --git a/arch/arm64/boot/dts/google/lga-cpm-reset.h b/arch/arm64/boot/dts/google/lga-cpm-reset.h
new file mode 100644
index 000000000000..0628247ede55
--- /dev/null
+++ b/arch/arm64/boot/dts/google/lga-cpm-reset.h
@@ -0,0 +1,175 @@
+/* SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause) */
+
+#ifndef __DTS_GOOGLE_LGA_CPM_RESET_H
+#define __DTS_GOOGLE_LGA_CPM_RESET_H
+
+/* HSIO_N */
+#define RST_HSIO_N_PCIE_PERST			0
+#define RST_HSIO_N_PCIE_APP_HOLD_PHY		1
+#define RST_HSIO_N_PCIE_INIT			2
+#define RST_HSIO_N_PCIE_PWR_UP			3
+#define RST_HSIO_N_USB_DP_CFG			4
+#define RST_HSIO_N_DP_PCLK			5
+#define RST_HSIO_N_USB_TOP_CSR			6
+#define RST_HSIO_N_PIXEL_CK0			7
+#define RST_HSIO_N_PIXEL_CK1			8
+#define RST_HSIO_N_U2PHY_APB			9
+#define RST_HSIO_N_USBC_NON_STICKY		10
+#define RST_HSIO_N_USBC_STICKY			11
+#define RST_HSIO_N_USB_DRD_BUS			12
+#define RST_HSIO_N_USB2_PHY			13
+#define RST_HSIO_N_USB3DP_PHY			14
+#define RST_HSIO_N_EBU				15
+
+/* HSIO_S */
+#define RST_HSIO_S_PCIE_PERST			0
+#define RST_HSIO_S_PCIE_APP_HOLD_PHY		1
+#define RST_HSIO_S_PCIE_PWR_UP			2
+#define RST_HSIO_S_UFS_PHY			3
+#define RST_HSIO_S_PCIE_INIT			4
+
+/* LSIO_S */
+#define RST_LSIO_S_CLI0_I2C_IC_CFG		0
+#define RST_LSIO_S_CLI0_I3C_IC_CFG		1
+#define RST_LSIO_S_CLI0_UART_IC_CFG		2
+#define RST_LSIO_S_CLI0_SPI_IC_CFG		3
+#define RST_LSIO_S_CLI1_I2C_IC_CFG		4
+#define RST_LSIO_S_CLI1_I3C_IC_CFG		5
+#define RST_LSIO_S_CLI1_UART_IC_CFG		6
+#define RST_LSIO_S_CLI1_SPI_IC_CFG		7
+#define RST_LSIO_S_CLI2_I2C_IC_CFG		8
+#define RST_LSIO_S_CLI2_I3C_IC_CFG		9
+#define RST_LSIO_S_CLI2_UART_IC_CFG		10
+#define RST_LSIO_S_CLI2_SPI_IC_CFG		11
+#define RST_LSIO_S_CLI3_I2C_IC_CFG		12
+#define RST_LSIO_S_CLI3_I3C_IC_CFG		13
+#define RST_LSIO_S_CLI3_UART_IC_CFG		14
+#define RST_LSIO_S_CLI3_SPI_IC_CFG		15
+#define RST_LSIO_S_CLI4_I2C_IC_CFG		16
+#define RST_LSIO_S_CLI4_I3C_IC_CFG		17
+#define RST_LSIO_S_CLI4_UART_IC_CFG		18
+#define RST_LSIO_S_CLI4_SPI_IC_CFG		19
+#define RST_LSIO_S_CLI5_I2C_IC_CFG		20
+#define RST_LSIO_S_CLI5_I3C_IC_CFG		21
+#define RST_LSIO_S_CLI5_UART_IC_CFG		22
+#define RST_LSIO_S_CLI5_SPI_IC_CFG		23
+#define RST_LSIO_S_CLI6_I2C_IC_CFG		24
+#define RST_LSIO_S_CLI6_I3C_IC_CFG		25
+#define RST_LSIO_S_CLI6_UART_IC_CFG		26
+#define RST_LSIO_S_CLI6_SPI_IC_CFG		27
+#define RST_LSIO_S_CLI0_SPI_IC			28
+#define RST_LSIO_S_CLI1_SPI_IC			29
+#define RST_LSIO_S_CLI2_SPI_IC			30
+#define RST_LSIO_S_CLI3_SPI_IC			31
+#define RST_LSIO_S_CLI4_SPI_IC			32
+#define RST_LSIO_S_CLI5_SPI_IC			33
+#define RST_LSIO_S_CLI6_SPI_IC			34
+#define RST_LSIO_S_CLI0_SPI_CFG			35
+#define RST_LSIO_S_CLI1_SPI_CFG			36
+#define RST_LSIO_S_CLI2_SPI_CFG			37
+#define RST_LSIO_S_CLI3_SPI_CFG			38
+#define RST_LSIO_S_CLI4_SPI_CFG			39
+#define RST_LSIO_S_CLI5_SPI_CFG			40
+#define RST_LSIO_S_CLI6_SPI_CFG			41
+#define RST_LSIO_S_PWM_IC			42
+#define RST_LSIO_S_PWM_CFG			43
+#define RST_LSIO_S_GPIO_IC			44
+
+/* LSIO_N */
+#define RST_LSIO_N_CLI15_I2C_IC_CFG		0
+#define RST_LSIO_N_CLI15_I3C_IC_CFG		1
+#define RST_LSIO_N_CLI15_UART_IC_CFG		2
+#define RST_LSIO_N_CLI15_SPI_IC_CFG		3
+#define RST_LSIO_N_CLI16_I2C_IC_CFG		4
+#define RST_LSIO_N_CLI16_I3C_IC_CFG		5
+#define RST_LSIO_N_CLI16_UART_IC_CFG		6
+#define RST_LSIO_N_CLI16_SPI_IC_CFG		7
+#define RST_LSIO_N_CLI17_INT0_I2C_IC_CFG	8
+#define RST_LSIO_N_CLI17_INT0_I3C_IC_CFG	9
+#define RST_LSIO_N_CLI17_INT0_UART_IC_CFG	10
+#define RST_LSIO_N_CLI17_INT0_SPI_IC_CFG	11
+#define RST_LSIO_N_CLI18_INT1_I2C_IC_CFG	12
+#define RST_LSIO_N_CLI18_INT1_I3C_IC_CFG	13
+#define RST_LSIO_N_CLI18_INT1_UART_IC_CFG	14
+#define RST_LSIO_N_CLI18_INT1_SPI_IC_CFG	15
+#define RST_LSIO_N_CLI19_INT2_I2C_IC_CFG	16
+#define RST_LSIO_N_CLI19_INT2_I3C_IC_CFG	17
+#define RST_LSIO_N_CLI19_INT2_UART_IC_CFG	18
+#define RST_LSIO_N_CLI19_INT2_SPI_IC_CFG	19
+#define RST_LSIO_N_CLI20_INT3_I2C_IC_CFG	20
+#define RST_LSIO_N_CLI20_INT3_I3C_IC_CFG	21
+#define RST_LSIO_N_CLI20_INT3_UART_IC_CFG	22
+#define RST_LSIO_N_CLI20_INT3_SPI_IC_CFG	23
+#define RST_LSIO_N_CLI21_INT4_I2C_IC_CFG	24
+#define RST_LSIO_N_CLI21_INT4_I3C_IC_CFG	25
+#define RST_LSIO_N_CLI21_INT4_UART_IC_CFG	26
+#define RST_LSIO_N_CLI21_INT4_SPI_IC_CFG	27
+#define RST_LSIO_N_CLI15_SPI_IC			28
+#define RST_LSIO_N_CLI16_SPI_IC			29
+#define RST_LSIO_N_CLI17_INT0_SPI_IC		30
+#define RST_LSIO_N_CLI18_INT1_SPI_IC		31
+#define RST_LSIO_N_CLI19_INT2_SPI_IC		32
+#define RST_LSIO_N_CLI20_INT3_SPI_IC		33
+#define RST_LSIO_N_CLI21_INT4_SPI_IC		34
+#define RST_LSIO_N_CLI15_SPI_CFG		35
+#define RST_LSIO_N_CLI16_SPI_CFG		36
+#define RST_LSIO_N_CLI17_INT0_SPI_CFG		37
+#define RST_LSIO_N_CLI18_INT1_SPI_CFG		38
+#define RST_LSIO_N_CLI19_INT2_SPI_CFG		39
+#define RST_LSIO_N_CLI20_INT3_SPI_CFG		40
+#define RST_LSIO_N_CLI21_INT4_SPI_CFG		41
+#define RST_LSIO_N_GPIO_IC			42
+
+/* LSIO_E */
+#define RST_LSIO_E_CLI7_I2C_IC_CFG		0
+#define RST_LSIO_E_CLI7_I3C_IC_CFG		1
+#define RST_LSIO_E_CLI7_UART_IC_CFG		2
+#define RST_LSIO_E_CLI7_SPI_IC_CFG		3
+#define RST_LSIO_E_CLI8_I2C_IC_CFG		4
+#define RST_LSIO_E_CLI8_I3C_IC_CFG		5
+#define RST_LSIO_E_CLI8_UART_IC_CFG		6
+#define RST_LSIO_E_CLI8_SPI_IC_CFG		7
+#define RST_LSIO_E_CLI9_I2C_IC_CFG		8
+#define RST_LSIO_E_CLI9_I3C_IC_CFG		9
+#define RST_LSIO_E_CLI9_UART_IC_CFG		10
+#define RST_LSIO_E_CLI9_SPI_IC_CFG		11
+#define RST_LSIO_E_CLI10_I2C_IC_CFG		12
+#define RST_LSIO_E_CLI10_I3C_IC_CFG		13
+#define RST_LSIO_E_CLI10_UART_IC_CFG		14
+#define RST_LSIO_E_CLI10_SPI_IC_CFG		15
+#define RST_LSIO_E_CLI11_I2C_IC_CFG		16
+#define RST_LSIO_E_CLI11_I3C_IC_CFG		17
+#define RST_LSIO_E_CLI11_UART_IC_CFG		18
+#define RST_LSIO_E_CLI11_SPI_IC_CFG		19
+#define RST_LSIO_E_CLI12_I2C_IC_CFG		20
+#define RST_LSIO_E_CLI12_I3C_IC_CFG		21
+#define RST_LSIO_E_CLI12_UART_IC_CFG		22
+#define RST_LSIO_E_CLI12_SPI_IC_CFG		23
+#define RST_LSIO_E_CLI13_I2C_IC_CFG		24
+#define RST_LSIO_E_CLI13_I3C_IC_CFG		25
+#define RST_LSIO_E_CLI13_UART_IC_CFG		26
+#define RST_LSIO_E_CLI13_SPI_IC_CFG		27
+#define RST_LSIO_E_CLI14_I2C_IC_CFG		28
+#define RST_LSIO_E_CLI14_I3C_IC_CFG		29
+#define RST_LSIO_E_CLI14_UART_IC_CFG		30
+#define RST_LSIO_E_CLI14_SPI_IC_CFG		31
+#define RST_LSIO_E_CLI7_SPI_IC			32
+#define RST_LSIO_E_CLI8_SPI_IC			33
+#define RST_LSIO_E_CLI9_SPI_IC			34
+#define RST_LSIO_E_CLI10_SPI_IC			35
+#define RST_LSIO_E_CLI11_SPI_IC			36
+#define RST_LSIO_E_CLI12_SPI_IC			37
+#define RST_LSIO_E_CLI13_SPI_IC			38
+#define RST_LSIO_E_CLI14_SPI_IC			39
+#define RST_LSIO_E_CLI7_SPI_CFG			40
+#define RST_LSIO_E_CLI8_SPI_CFG			41
+#define RST_LSIO_E_CLI9_SPI_CFG			42
+#define RST_LSIO_E_CLI10_SPI_CFG		43
+#define RST_LSIO_E_CLI11_SPI_CFG		44
+#define RST_LSIO_E_CLI12_SPI_CFG		45
+#define RST_LSIO_E_CLI13_SPI_CFG		46
+#define RST_LSIO_E_CLI14_SPI_CFG		47
+#define RST_LSIO_E_GPIO_IC			48
+#define RST_LSIO_E_SPMI				49
+
+#endif /* __DTS_GOOGLE_LGA_CPM_RESET_H */
diff --git a/arch/arm64/boot/dts/google/lga-lpcm.h b/arch/arm64/boot/dts/google/lga-lpcm.h
new file mode 100644
index 000000000000..4180c1f0175f
--- /dev/null
+++ b/arch/arm64/boot/dts/google/lga-lpcm.h
@@ -0,0 +1,54 @@
+/* SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause) */
+
+#ifndef __DTS_GOOGLE_LGA_LPCM_H
+#define __DTS_GOOGLE_LGA_LPCM_H
+
+/*
+ * LPCM IDs of each SSWRP.
+ */
+#define LPCM_CPM		0
+#define LPCM_AOC		1
+#define LPCM_LSIO_E		2
+#define LPCM_LSIO_N		3
+#define LPCM_LSIO_S		4
+#define LPCM_HSIO_N		5
+#define LPCM_HSIO_S		6
+#define LPCM_GPCA		7
+#define LPCM_FABHBW		8
+#define LPCM_MEMSS		9
+#define LPCM_FABMED		10
+#define LPCM_FABRT		11
+#define LPCM_FABSTBY		12
+#define LPCM_FABSYSS		13
+#define LPCM_CPU		14
+#define LPCM_CPU_MAIN		15
+#define LPCM_CPU_CCM0		16
+#define LPCM_CPU_CCM1A		17
+#define LPCM_CPU_CCM1B		18
+#define LPCM_CPU_CCM2		19
+#define LPCM_EH			20
+#define LPCM_AURORA		21
+#define LPCM_CODEC_3P		22
+#define LPCM_G2D		23
+#define LPCM_GSW		24
+#define LPCM_ISPBE		25
+#define LPCM_ISPFE		26
+#define LPCM_INF_TCU		27
+#define LPCM_GPU		28
+#define LPCM_GPU_REMOTE_FLL	29
+#define LPCM_GPU_REMOTE_SENSOR	30
+#define LPCM_TPU		31
+#define LPCM_TPU_REMOTE		32
+#define LPCM_BMSM		33
+#define LPCM_CPUACC		34
+#define LPCM_DPU		35
+#define LPCM_GDMC		36
+#define LPCM_GMC0		37
+#define LPCM_GMC1		38
+#define LPCM_GMC2		39
+#define LPCM_GMC3		40
+#define LPCM_GPCM		41
+#define LPCM_GPDMA		42
+#define LPCM_GSA		43
+
+#endif /* __DTS_GOOGLE_LGA_LPCM_H */
diff --git a/arch/arm64/boot/dts/google/lga.dtsi b/arch/arm64/boot/dts/google/lga.dtsi
index 6ceb9ea6a100..5213745b9366 100644
--- a/arch/arm64/boot/dts/google/lga.dtsi
+++ b/arch/arm64/boot/dts/google/lga.dtsi
@@ -7,8 +7,13 @@
 
 /dts-v1/;
 
+#include <dt-bindings/clock/google,lga-cpm.h>
 #include <dt-bindings/interrupt-controller/arm-gic.h>
 #include <dt-bindings/interrupt-controller/irq.h>
+#include <dt-bindings/power/google,lga-cpm.h>
+
+#include "lga-cpm-reset.h"
+#include "lga-lpcm.h"
 
 / {
 	#address-cells = <2>;
@@ -356,6 +361,16 @@ abl@be000000 {
 		};
 	};
 
+	cpm: power-controller {
+		compatible = "google,lga-cpm";
+		#clock-cells = <1>;
+		#power-domain-cells = <1>;
+		#reset-cells = <2>;
+		interrupt-controller;
+		#interrupt-cells = <1>;
+		mboxes = <&cpm_ap_ns_req_mba>, <&cpm_ap_ns_resp_mba>;
+	};
+
 	soc: soc@0 {
 		compatible = "simple-bus";
 		ranges = <0x0 0x0 0x0 0x0 0x10 0x0>;
@@ -423,9 +438,14 @@ lsion_cli16_uart: serial@db62000 {
 			reg = <0x0 0x0db62000 0x0 0x100>;
 
 			clock-frequency = <200000000>;
+			clocks = <&cpm CLK_LSIO_N_CLI16_UART>,
+				 <&cpm CLK_LSIO_N_CLI16_CFG>;
+			clock-names = "baudclk", "apb_pclk";
 			interrupts = <GIC_SPI 688 IRQ_TYPE_LEVEL_HIGH 0>;
+			power-domains = <&cpm PD_LSIO_N_CLI_GPIO>;
 			reg-io-width = <4>;
 			reg-shift = <2>;
+			resets = <&cpm LPCM_LSIO_N RST_LSIO_N_CLI16_UART_IC_CFG>;
 
 			status = "disabled";
 		};
-- 
2.56.1.831.g720f3f5937-goog

