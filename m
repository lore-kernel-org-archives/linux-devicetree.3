Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.208.49
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795335538;
	b=CqIJgIvEmMV5xTAdDs0KaHNEPeRE+QKfGuDsk7Foapn0hbTJvtB987Q80crJGRsAazcp
	 bhjHqhZ+qtYPkeXoG8mzRs3tXhCb1A5x0JeY56vzrlY9cOw0GMniGm9oT/wdv7V3bNTpd
	 fWsSwr2kyw5buRg7yOpuMSjAGYgVkjwe4yA5ZXu/ZfLGeMTRNkDhLTmcx1APIr4HNriQy
	 kmDxLbzTvhqqELkMK94E4swGWkbjxcYjhVGKeCscwKIF9KCUmaDwS+Z/fZcXvAB6E/+9x
	 BPZQdv/R8fwjgVpHDZwOg6QnOjLf5rovg5C6EnAvkBnaOUnbvdiqaM5HEQ8zrBFQW2w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795335538;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=/0T454X8zS9zgz5ElLHh1sft/p08/5DBKrLhd6S46iM=;
	b=DXymWTWaz96F/jMXdXUhQlcWRYADxG2FNJeEfW1V5zGDmGH4i/K1CjTUGmrwRovwEEcs
	 wD4KlWsbpbOFHe585A2aV8aTJ/1Do6HXORI6AYbomNnN6ryDE1IKlyaHQYkZfQ6uAtBEo
	 ZpPOi4Nk7+A1H22eLtpuDiXHCgMfWlg1uoBO60NiV6DJkFUdO/ft5iiPJMfeCEC/66WSF
	 D7mDjnUyV95Eqx3sPiXIwcffN40gaqNT+/b3WtMCqSfnwt4QvCkZppV8uv9bxE3atEk7F
	 r71mCbvAebOcnezoZr8586P1vtO+YOn2EbmC2vrG+rK6n6Dm3qJ3YBqmNyb2+IzS79w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=b3gy01qA;
	arc=none smtp.remote-ip=209.85.208.49
Received: from mail-ed1-f49.google.com (mail-ed1-f49.google.com [209.85.208.49])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AB4FB606A33C
	for <devicetree@vger.kernel.org>; Sun, 22 Nov 2026 08:18:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org AB4FB606A33C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=b3gy01qA
Received: by mail-ed1-f49.google.com with SMTP id 4fb4d7f45d1cf-6a642495d81so3648110a12.2
        for <devicetree@vger.kernel.org>; Sun, 22 Nov 2026 00:18:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795335536; x=1795940336; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=/0T454X8zS9zgz5ElLHh1sft/p08/5DBKrLhd6S46iM=;
        b=b3gy01qAMNQg+E5iRsZZEbs3wyCgdjFYoytE433N125hdIDoIbmptbh3zROT4vXgF7
         UefW+fo1JRHTOohAvnIvVwbKCseuSJWSsab4CvYOXFNJQlhV7B8YpaUuPQo6C00WNusf
         w31SDWc5ajeXV17YAkN8VUKvDvUv4NoH5Y5AfRWckMp6JWj8TqYvaoVL/ijbIDOX5+Fs
         Cu0HBpsz1BI7H78fVTj6Q0NCBR7TKaSB+DC1ciuWhjVNylf6PISk9RXHVlcFMk1yyQ4c
         aO8fA60woAbKo0ptM/1HKG7YyZuynEFDMKC63XO1AmwFR2E+y5qtaag4wIsnBZSqm9TU
         Hiiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795335536; x=1795940336;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=/0T454X8zS9zgz5ElLHh1sft/p08/5DBKrLhd6S46iM=;
        b=etSWngDOitxuVS+7vgfpRAQTPT+9f/WyJDSc7jHf9bt2mt1h+wSeMJohEC8+6ftIPc
         1/qxSx2sbIArUObIlzH2BHyEm94aChASRZ4yp/vr9T1K8ra6lo/93Ni99SB6fEGQ8aI9
         fWWCtB4Y5vTvq8YEmD3/qZQzoJxZLjUHjBcfDZOHACp9w7zD3wEmC9GtxbDHwtAKiS/D
         3mI9dghSlSuhRpnV4JcxgCWrfdxhMquSji7dgpXY5aXbyXY/fvfwsiDtdxLGWWg3KMj0
         xT2F2ez4nOUKYoUbMPklPoDeyDZJnjRNskU9OpVgFqwrBFNMJNdtO/HmDUUTZoLIDBsb
         OyNA==
X-Forwarded-Encrypted: i=1; AL+hErF/aTzGp57qeJaAhYp5NztLCWqN4dwXMIoWeeH/c8pxKHwpPHTdYAN/mZBMfirrZRcWQLYKuUX/1nVB@vger.kernel.org
X-Gm-Message-State: APuU4Z8x3PxIjBl5L1AJwF6CaodzQzUO+/W8KuVBgnszG7QzBuaT4GDu
	bn9wWLagneba+FHF2ChLQ221pB+oXu3ETmTnB06iK9fkGe/noWkXPHmv
X-Gm-Gg: AZFdTZfd35M0+sdqmEB8AmBfZr1E7NtUzQ/1BXX0gcGfIHmrmHWPJ1AOu96MmCL6SAZ
	mTuee7aw7oodkdoIHxG8C6oH5BGuBV5gHjITDBzwqMs2dF9kdE5hE0oVhKq1CILgr+InmZxJq8D
	Wdz9QYVtIEOZnsM8b+Arms7DbWhPsP3i9v4LmwaUV6gBxpfLGc27wDj2Pmcm8KNZMGjl79Oud7k
	EPkZ/bMJZ8GWAnrY0be2ofIStJlQziSVw4x8k2E7PtgPFBoF9SK78h/A9cbzjync6jvv1N/T/dl
	B4M7Gv1TKojoM9c0mpfuW94wCxxRfPrxFhk3aXiVxcuMjIKJuGmi9hC+NXy5G2YnxxDHMOIHgO4
	pQwOf5fwfnR07KsaR9m/FPnywwQXKQKBD82b/XZmPaGrrIgezafd5RJSWRhBjZC6h4hZLxzlecL
	ZHwEI30PVX8kV1RHn5/StW5220srVuLwz7HBTcYknEKzYxDlnDiRralA8ME+dOGHj3u6pqOV+uk
	0Lt2Yb9HwO4qkInqf5IPGvXJPKCAmCtRrgP1p1prDDkwvLOb0MWBkDYIqEqMn7s2CEGS0r8kuTr
	iHq9byGTfisjJVd5UwMeiPsXJDX6RjhyUJGv+M1IevgkdGceRwvpYk6Vm9TSRUHiNEu5KePp08Q
	ztpSStUxvtvU=
X-Received: by 2002:aa7:d404:0:b0:6ba:1266:cd94 with SMTP id 4fb4d7f45d1cf-6ba37e89ce2mr4304301a12.39.1795335535882;
        Sun, 22 Nov 2026 00:18:55 -0800 (PST)
Received: from xeon ([188.163.112.62])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6ba370e8ad0sm3617167a12.18.2026.11.22.00.18.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 22 Nov 2026 00:18:55 -0800 (PST)
From: Svyatoslav Ryhel <clamor95@gmail.com>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Thierry Reding <thierry.reding@kernel.org>,
	Jonathan Hunter <jonathanh@nvidia.com>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Jessica Zhang <jesszhan0024@gmail.com>,
	Mikko Perttunen <mperttunen@nvidia.com>,
	Svyatoslav Ryhel <clamor95@gmail.com>
Cc: dri-devel@lists.freedesktop.org,
	devicetree@vger.kernel.org,
	linux-tegra@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v8 06/12] drm/tegra: dc: Add elements required by Tegra MIPI DBI
Date: Sun, 22 Nov 2026 10:18:14 +0200
Message-ID: <20261122081820.53199-7-clamor95@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261122081820.53199-1-clamor95@gmail.com>
References: <20261122081820.53199-1-clamor95@gmail.com>
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

Add DC register definitions with additional fields in preparation for
adding the 8-bit CPU interface (MIPI DBI).

Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
---
 drivers/gpu/drm/tegra/dc.h | 194 ++++++++++++++++++++++++++++++++++---
 1 file changed, 183 insertions(+), 11 deletions(-)

diff --git a/drivers/gpu/drm/tegra/dc.h b/drivers/gpu/drm/tegra/dc.h
index 0cb0515968b35..e8913c5530a2d 100644
--- a/drivers/gpu/drm/tegra/dc.h
+++ b/drivers/gpu/drm/tegra/dc.h
@@ -272,14 +272,150 @@ int tegra_dc_rgb_exit(struct tegra_dc *dc);
 #define  DC_COM_CRC_CONTROL_WAIT (1 << 1)
 #define  DC_COM_CRC_CONTROL_ENABLE (1 << 0)
 #define DC_COM_CRC_CHECKSUM			0x301
-#define DC_COM_PIN_OUTPUT_ENABLE(x) (0x302 + (x))
-#define DC_COM_PIN_OUTPUT_POLARITY(x) (0x306 + (x))
-#define LVS_OUTPUT_POLARITY_LOW (1 << 28)
-#define LHS_OUTPUT_POLARITY_LOW (1 << 30)
-#define DC_COM_PIN_OUTPUT_DATA(x) (0x30a + (x))
-#define DC_COM_PIN_INPUT_ENABLE(x) (0x30e + (x))
-#define DC_COM_PIN_INPUT_DATA(x) (0x312 + (x))
-#define DC_COM_PIN_OUTPUT_SELECT(x) (0x314 + (x))
+
+#define DC_COM_PIN_OUTPUT_ENABLE(x)		(0x302 + (x))
+#define DC_COM_PIN_OUTPUT_POLARITY(x)		(0x306 + (x))
+#define LVS_OUTPUT_POLARITY_LOW			BIT(28)
+#define LHS_OUTPUT_POLARITY_LOW			BIT(30)
+#define DC_COM_PIN_OUTPUT_DATA(x)		(0x30a + (x))
+/* Pin unmask is 1 bit above position of the pin in the OUTPUT_DATA register */
+#define PIN_UNMASK(x)				BIT((x) + 1)
+#define DC_COM_PIN_INPUT_ENABLE(x)		(0x30e + (x))
+
+/*
+ * The definitions below describe pin positions in the DC_COM_PIN_OUTPUT_ENABLE(x),
+ * DC_COM_PIN_OUTPUT_POLARITY(x), DC_COM_PIN_OUTPUT_DATA(x), and
+ * DC_COM_PIN_INPUT_ENABLE(x) registers. The comment before each group indicates
+ * the index of the register (the x value).
+ */
+
+/* 0 */
+#define PIN_LD0					0
+#define PIN_LD1					2
+#define PIN_LD2					4
+#define PIN_LD3					6
+#define PIN_LD4					8
+#define PIN_LD5					10
+#define PIN_LD6					12
+#define PIN_LD7					14
+#define PIN_LD8					16
+#define PIN_LD9					18
+#define PIN_LD10				20
+#define PIN_LD11				22
+#define PIN_LD12				24
+#define PIN_LD13				26
+#define PIN_LD14				28
+#define PIN_LD15				30
+
+/* 1 */
+#define PIN_LD16				0
+#define PIN_LD17				2
+#define PIN_LPW0				16
+#define PIN_LPW1				18
+#define PIN_LPW2				20
+#define PIN_LSC0				24
+#define PIN_LSC1				26
+#define PIN_LVS					28
+#define PIN_LHS					30
+
+/* 2 */
+#define PIN_LHP0				0
+#define PIN_LHP1				2
+#define PIN_LHP2				4
+#define PIN_LVP0				8
+#define PIN_LVP1				10
+#define PIN_LM0					16
+#define PIN_LM1					18
+#define PIN_LDI					20
+#define PIN_LPP					22
+
+/* 3 */
+#define PIN_LSCK				0
+#define PIN_LSDA				2
+#define PIN_LCSN				4
+#define PIN_LDC					6
+#define PIN_LSPI				8
+#define PIN_LSDI				10
+
+#define DC_COM_PIN_INPUT_DATA(x)		(0x312 + (x))
+
+/*
+ * DC_COM_PIN_OUTPUT_SELECT(x) is a set of 7 registers that allow selecting
+ * one of 7 functions for each pin using 3 bits. Clearing all bits sets
+ * the pin to its primary function, while setting them to 1 configures it
+ * as a GPIO output. Other functions are unique to each pin. For details,
+ * check "23.7.17 DC_COM_PIN_OUTPUT_SELECT0_0" in the Tegra30 TRM.
+ */
+#define DC_COM_PIN_OUTPUT_SELECT(x)		(0x314 + (x))
+#define PIN_OUTPUT_SELECT_MASK(x)		(0x7 << (x))
+#define PIN_OUTPUT_SELECT_PRIM(x)		(0 << (x))
+#define PIN_OUTPUT_SELECT_OUT(x)		(1 << (x))
+#define PIN_OUTPUT_SELECT_F2(x)			(2 << (x))
+#define PIN_OUTPUT_SELECT_F3(x)			(3 << (x))
+#define PIN_OUTPUT_SELECT_F4(x)			(4 << (x))
+#define PIN_OUTPUT_SELECT_F5(x)			(5 << (x))
+#define PIN_OUTPUT_SELECT_F6(x)			(6 << (x))
+#define PIN_OUTPUT_SELECT_F7(x)			(7 << (x))
+
+/*
+ * The definitions below describe pin offset in the DC_COM_PIN_OUTPUT_SELECT(x)
+ * registers. The comment before each group indicates the index of the register
+ * (the x value).
+ */
+
+/* 0 */
+#define PIN_OUTPUT_SELECT_LD0			0
+#define PIN_OUTPUT_SELECT_LD1			4
+#define PIN_OUTPUT_SELECT_LD2			8
+#define PIN_OUTPUT_SELECT_LD3			12
+#define PIN_OUTPUT_SELECT_LD4			16
+#define PIN_OUTPUT_SELECT_LD5			20
+#define PIN_OUTPUT_SELECT_LD6			24
+#define PIN_OUTPUT_SELECT_LD7			28
+
+/* 1 */
+#define PIN_OUTPUT_SELECT_LD8			0
+#define PIN_OUTPUT_SELECT_LD9			4
+#define PIN_OUTPUT_SELECT_LD10			8
+#define PIN_OUTPUT_SELECT_LD11			12
+#define PIN_OUTPUT_SELECT_LD12			16
+#define PIN_OUTPUT_SELECT_LD13			20
+#define PIN_OUTPUT_SELECT_LD14			24
+#define PIN_OUTPUT_SELECT_LD15			28
+
+/* 2 */
+#define PIN_OUTPUT_SELECT_LD16			0
+#define PIN_OUTPUT_SELECT_LD17			4
+
+/* 3 */
+#define PIN_OUTPUT_SELECT_LPW0			0
+#define PIN_OUTPUT_SELECT_LPW1			4
+#define PIN_OUTPUT_SELECT_LPW2			8
+#define PIN_OUTPUT_SELECT_LSC0			16
+#define PIN_OUTPUT_SELECT_LSC1			20
+#define PIN_OUTPUT_SELECT_LVS			24
+#define PIN_OUTPUT_SELECT_LHS			28
+
+/* 4 */
+#define PIN_OUTPUT_SELECT_LHP0			0
+#define PIN_OUTPUT_SELECT_LHP1			4
+#define PIN_OUTPUT_SELECT_LHP2			8
+#define PIN_OUTPUT_SELECT_LVP0			16
+#define PIN_OUTPUT_SELECT_LVP1			20
+
+/* 5 */
+#define PIN_OUTPUT_SELECT_LM0			0
+#define PIN_OUTPUT_SELECT_LM1			4
+#define PIN_OUTPUT_SELECT_LDI			8
+#define PIN_OUTPUT_SELECT_LPP			12
+
+/* 6 */
+#define PIN_OUTPUT_SELECT_LSCK			0
+#define PIN_OUTPUT_SELECT_LSDA			4
+#define PIN_OUTPUT_SELECT_LCSN			8
+#define PIN_OUTPUT_SELECT_LDC			12
+#define PIN_OUTPUT_SELECT_LSPI			16
+#define PIN_OUTPUT_SELECT_LSDI			20
 
 #define DC_COM_PIN_MISC_CONTROL			0x31b
 #define DC_COM_PIN_PM0_CONTROL			0x31c
@@ -303,9 +439,15 @@ int tegra_dc_rgb_exit(struct tegra_dc *dc);
 #define  UNDERFLOW_REPORT_ENABLE (1 << 0)
 
 #define DC_DISP_DISP_SIGNAL_OPTIONS0		0x400
-#define H_PULSE0_ENABLE (1 <<  8)
-#define H_PULSE1_ENABLE (1 << 10)
-#define H_PULSE2_ENABLE (1 << 12)
+#define H_PULSE0_ENABLE				BIT(8)
+#define H_PULSE1_ENABLE				BIT(10)
+#define H_PULSE2_ENABLE				BIT(12)
+#define V_PULSE0_ENABLE				BIT(16)
+#define V_PULSE1_ENABLE				BIT(18)
+#define V_PULSE2_ENABLE				BIT(19)
+#define V_PULSE3_ENABLE				BIT(20)
+#define M0_ENABLE				BIT(24)
+#define M1_ENABLE				BIT(26)
 
 #define DC_DISP_DISP_SIGNAL_OPTIONS1		0x401
 
@@ -456,6 +598,22 @@ int tegra_dc_rgb_exit(struct tegra_dc *dc);
 #define DC_DISP_SHIFT_CLOCK_OPTIONS		0x431
 #define  SC1_H_QUALIFIER_NONE	(1 << 16)
 #define  SC0_H_QUALIFIER_NONE	(1 <<  0)
+#define  SC0_H_QUALIFIER(x)			(((x) & 0x7) <<  0)
+#define  SC1_H_QUALIFIER(x)			(((x) & 0x7) << 16)
+#define  SC_H_QUALIFIER_DISABLE			0
+#define  SC_H_QUALIFIER_NONE			1
+#define  SC_H_QUALIFIER_HACTIVE			2
+#define  SC_H_QUALIFIER_EXT_HACTIVE		3
+#define  SC_H_QUALIFIER_HPULSE			4
+#define  SC_H_QUALIFIER_EXT_HPULSE		5
+#define  SC0_V_QUALIFIER(x)			(((x) & 0x7) <<  3)
+#define  SC1_V_QUALIFIER(x)			(((x) & 0x7) <<  19)
+#define  SC_V_QUALIFIER_NONE			0
+#define  SC_V_QUALIFIER_RSVD			1
+#define  SC_V_QUALIFIER_VACTIVE			2
+#define  SC_V_QUALIFIER_EXT_VACTIVE		3
+#define  SC_V_QUALIFIER_VPULSE			4
+#define  SC_V_QUALIFIER_EXT_VPULSE		5
 
 #define DC_DISP_DATA_ENABLE_OPTIONS		0x432
 #define DE_SELECT_ACTIVE_BLANK  (0 << 0)
@@ -493,6 +651,20 @@ int tegra_dc_rgb_exit(struct tegra_dc *dc);
 #define DC_DISP_CURSOR_POSITION_NS		0x441
 
 #define DC_DISP_INIT_SEQ_CONTROL		0x442
+#define SEND_INIT_SEQUENCE			BIT(0)
+#define INIT_SEQUENCE_MODE_SPI			BIT(1)
+#define INIT_SEQUENCE_MODE_PLCD			0
+#define INIT_SEQ_DC_SIGNAL_SHIFT		4
+#define INIT_SEQ_DC_SIGNAL_MASK			(0x7 << INIT_SEQ_DC_SIGNAL_SHIFT)
+#define NO_DC_SIGNAL				0
+#define DC_SIGNAL_VSYNC				1
+#define DC_SIGNAL_VPULSE0			2
+#define DC_SIGNAL_VPULSE1			3
+#define DC_SIGNAL_VPULSE2			4
+#define DC_SIGNAL_VPULSE3			5
+#define INIT_SEQ_DC_CONTROL_SHIFT		7
+#define FRAME_INIT_SEQ_CYCLES_SHIFT		8
+
 #define DC_DISP_SPI_INIT_SEQ_DATA_A		0x443
 #define DC_DISP_SPI_INIT_SEQ_DATA_B		0x444
 #define DC_DISP_SPI_INIT_SEQ_DATA_C		0x445
-- 
2.53.0

