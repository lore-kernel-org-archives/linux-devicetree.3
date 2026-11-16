Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.218.50
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794841846;
	b=y4K2h48rXRQy9ut0qqgBysx32+wIk/9cikQU4lmrxZdlrLslGxzy1FpSFFL8JQqOETzX
	 yay5ltLgQ/pSaz0lMPXriDHB9kY78ABoTdbLZBi2TZQQeLMItzHI5asK5B+0DeEubKfWH
	 PR1UZkr8q1WAb6/S9aU2l3I50FabzfmUc+aO4mhdPbKQLfRY4pttzJQp6MkELb/YLJkb2
	 4rJFnjdzvWDgzlBLxMj3RGrNMTYKf3hU4pfuuLoSy+NTGXvTmp4kTNpN7x2gt+gHfV/o4
	 3VztNMplo06IwDobSfAJ7FG0KNWxzovjt2wdywoVwIxsXQDPsKMsJSpPQ/GKcQEcsnA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794841846;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=/0T454X8zS9zgz5ElLHh1sft/p08/5DBKrLhd6S46iM=;
	b=aYGth+mLNgQzn7d69+pzdsRhPpJ9zKE0TQH5ihazZ/tivdfgFm8zW/7uctsd2ND8XejC
	 6eY0BacCMtTrGqrgUcxc//giXpjYaJkT6N9G+ySzgdYy5PUpGttD605vbqEtOzdbMszFe
	 JQb9Ixf2PB7FLiWQrQbiFq2ZoQbIZ02QZVBpRwasL8yyJgMjH80JvWiwxS/Ks15T7C+jz
	 LQaUT86I3wdi2UinkagId6QksIjhXEJr0y7kTn2zM5+rbKqtOKgJWOI9MAlyVvQAoSOBx
	 xoMylP0qfOtJgrbFUusN7XEhyF0V0rGujq+VplT205VTZnfLd1IR3YUzLM9tKxANN1A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=LNqwR422;
	arc=none smtp.remote-ip=209.85.218.50
Received: from mail-ej1-f50.google.com (mail-ej1-f50.google.com [209.85.218.50])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E6096606A889
	for <devicetree@vger.kernel.org>; Mon, 16 Nov 2026 15:10:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E6096606A889
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=LNqwR422
Received: by mail-ej1-f50.google.com with SMTP id a640c23a62f3a-c5067a2411bso541634466b.2
        for <devicetree@vger.kernel.org>; Mon, 16 Nov 2026 07:10:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794841844; x=1795446644; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=/0T454X8zS9zgz5ElLHh1sft/p08/5DBKrLhd6S46iM=;
        b=LNqwR422yB60GYitQLsFRMed4Yv+68D0kZG+iIFi4R1g/SRQdKsNBEyXnpf0wd0uTT
         A1TMWxouIwHhxfqxwYrk79cgTclH5yTHg+qrYh4kNnz3zhDYrAwTBz7mGmmA45Blelfh
         aViYRbzGOBDXBiR4ORtBEZCPgUzySxzh7/rOTmF3SoY/laaSlIlgcPuxg6Wuqferj0oo
         R5v/j/Nt5zpmsFHifVPZ+4fl9O/5zCPZ1Z1+tXTbT9XuxeYoqKvrA85qsB7Ndvwk+WlF
         v2Ir2fAAyTm0ehKmQdXn28u//rS7A+VWXUcMhHP/7DvkUFTF00+/xxN0fLjhkQID8jtU
         fZCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794841844; x=1795446644;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=/0T454X8zS9zgz5ElLHh1sft/p08/5DBKrLhd6S46iM=;
        b=uMOVbIkccLBI6FoJ7mV7bg7xXJ7p1vvuvYMYfzjSQR4IA6HhVxDDhyEkdka7wHJNer
         hzDMPzH99Hz+RR1LUlhl/Y9uDOwZ58M+ar19RureUQZqm+s9CGpvONT7G+ET6h9G+rY+
         ZhmD2W8G6plopgvrfJVYkx9ZAgFJjDxwpPkyy3KOQ2JcO1r7E0f7vSyIIj5zFUjSxYQ+
         nWrOb0AdRbpGQpajMkVNBXj/w5hTP2l5THM12hhXyPSGif+z0GgmaZvi6J62CT7facFU
         8udtClaSEr/T4D5gsaiojse08ctNTKat7o5VOTXl/o5xnbNRn+vfCkFtsx7JlL5kESYn
         KM5Q==
X-Forwarded-Encrypted: i=1; AL+hErH5KwEnJMMHfj5mw5T+tH5fXRAjNOtUs5CWXjDfqmMQZv0hoqYvRnoICzrQNwAU0OLwvSA07VLKIkVh@vger.kernel.org
X-Gm-Message-State: APuU4Z9PbDSZeh0KdSBqaBtfkTVyv2nuFWJEIOPigrLF7+tmjzBoMBC1
	Npm4e9/+Rb6+4ioBHcc7Z+dqVGxCz95oVi6pCjT1clRM+PUpIPvWqhM6
X-Gm-Gg: AYBFou1lWtnMNfm7sHxJ4M4khQpA1B9J1ZNXgZrI/kc8X6OzrCMOl0Q4lsiu4ivHy+t
	XEbx9NaXq0LZ0SXr/8iQ4TG1ALgetFBV9p2HwFqpe/HQMRZKr9+TfIdxv5eQeLtq3p9OG0R4Hdl
	W0mnRqf/9vCeFH5l/mPw6h5maBVb+xjC3F1+Ry1uQ69+MSQCh1MAq+9OqiBGoW4pD2MhMrXfaLf
	BNkw/XTWqtBGCSuOK5RLc18ilWVQ9E8vKHT3j/MmA3wsei4fQEWzC9koU7EhxiljC5TPoSnmbhi
	WnUedf4RxGvzcpAS9vPuom+cNj8JoCBcKVWMHFA1FtktGBuJQDVVy4K/nyY1sPRf4CBJvTkYygX
	Ud/Th6l/al0ZDfzSca/d4184it69cDN2yUwnK7SHC64EpAwIZESy1R2VlGUqNo1Az3xDY6+rAGf
	sr2NymjP78NKUkbc9xA5X0pC41LQXkwiDrZLKv1sD0dGqGx+6Nm0LjCky/e1wxVSJd0QgiqETWU
	EI5gbLHquFlj5sGKyWYr4AJ0gpOWo9oVNH6eL2u0WWfpBDhXCOrGhTTYt4gfZA0lz/zLYnZzQZo
	CQMF6MZerSg5DKTeojebL/bd48hLebfJwYMlDJyyvb6EYBN42OadE8ZpcA/3tqVeH7f1mfrLTAo
	RHke/4FaMuw==
X-Received: by 2002:a17:907:c13:b0:c29:f5d5:5a97 with SMTP id a640c23a62f3a-c5096442d6bmr855991066b.33.1794841844356;
        Mon, 16 Nov 2026 07:10:44 -0800 (PST)
Received: from xeon ([188.163.112.62])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c5095b93a85sm420868466b.84.2026.11.16.07.10.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Nov 2026 07:10:43 -0800 (PST)
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
Subject: [PATCH v7 06/12] drm/tegra: dc: Add elements required by Tegra MIPI DBI
Date: Mon, 16 Nov 2026 17:10:11 +0200
Message-ID: <20261116151017.274764-7-clamor95@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261116151017.274764-1-clamor95@gmail.com>
References: <20261116151017.274764-1-clamor95@gmail.com>
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

