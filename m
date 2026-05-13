Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 776D03D5C06
	for <devicetree@vger.kernel.org>; Wed, 13 May 2026 07:20:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778656807; cv=none; b=B6SO43LxFWzC82C/eNNwEdv/e5TMGDrV3FPn1FA69YrwO/VBrxZoUJyhZs4DS/Ny20gJf/7mgFOrE99GZqAOWt1BowgMP7LYwbG49XYQiUsy1iOWV0OyMsxBUEsztRdFRwFsgxvPICQ9IkHGTSi0jSiTA3UiC1aWR60SZWkpXNs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778656807; c=relaxed/simple;
	bh=iklbridFsEqlzLRtIsCn1I8N4zndIhcF2VeZfwqJ6WE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=BLKpeHWH3fO0sT9K8Xg+gMjJ0rcnzsey8Gie6CU8fQwHBZNoriq1BVnbWFUZ635nBNag2trLDeARi+s6GSBSFNC2hEyuxwQzVPgkOqFOvKne0TJYILvfYbQsce+UZxitRArjK9nuFvJRqb8YWT4Ez7GnesO53TmCoxLzqAWNc9U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=kdsslhNK; arc=none smtp.client-ip=209.85.128.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="kdsslhNK"
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-48e8132c6d0so26797295e9.1
        for <devicetree@vger.kernel.org>; Wed, 13 May 2026 00:20:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778656804; x=1779261604; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=p8ZnL1WlOqvrL+zZckD/oAptqRT3baQKqP00mGe80OY=;
        b=kdsslhNKdLbFSJreDH+/U/Np4GswVNJQ3L2vHugcC0XS2c7/A5QJLl5forzPPrun5M
         45YWScd2eXfxvEL0KjfU3H5DbCr3sY/g/gXLt12Q+R9a9AKMMiriWFUjPN9Q/rXywlfw
         xIVrlym/E6TqwPcYMU+ovWZHQGVjRNoB5AESfOs14lrrBtnp39hVVgj3xRbF+0HRfCS/
         gLw/bDb8utQJbnGJKczAG8AHAxdHo1CqnLUPeq8wZ3ckhQXengu1VCABSpyX9f1SpIch
         rBFDSmGx72XwKBP+KUC3RAnYwev6QYkNMXwrwgzh5tRCYYgn/MPKzY1TfDrCFUD9nrw+
         o+AA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778656804; x=1779261604;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=p8ZnL1WlOqvrL+zZckD/oAptqRT3baQKqP00mGe80OY=;
        b=ZAKDS17fS+4FPw1xazrvkaf8NoLGqjY4YHuk91zw9qefVt51hXdDd6k55qjxcdQFW3
         Xg9S33HhDjJsKzk0Zyzrx4W4JRNHvXl+xHIOxt3FRAj6KHF7lrEGCXtEImw08hGOwqMz
         /yo16bDVQHvTpOkbNVqP9hRt0rdnHczw6atN92T1zUjbloO07yJl89AXH0csLmVOLUiL
         xXzKTSeitLdPfkqCH07Oh/UH+Uc7vWHY398Zd28JsTCBFuOJrH9EiW9lGtBMdjeRwmZ2
         TCMbhZLBvgKSEGPom8jYB9MjzOhSVTE0T11G96EfP9d76HkceYc3y4nxyQeycdz+cSJD
         oqWQ==
X-Gm-Message-State: AOJu0YzlEFlyXVLYJItzzBSsS8syhlKs0DGi84thN6GEOrOxH4wYu8JN
	9HJQb5oE6S/LljYlxCbmMwjCXDJJcSWhhAAhUjYyTsmUfke+G1yjMqOT
X-Gm-Gg: Acq92OHKJdiCcgqKxq0X1DL4zARvNfoxtBkoyAooWyL1uGG7grt511UHAuCVjC99DOK
	QTcfjW3m3OthAPo44yma/cwRVU08TPAw/74khGK8TRUS9rBubO3L5BcprSyXIJy7ZOhgsQ8FR53
	qGnFtt3u4mqe5+9UpXVnLDx56Q8B7fp1lKmu1n2DIlJaIM02hYBqDYNQH8DpbKhXl3sM/B4qS/K
	TnLnspUdhcpjKHoxaoPoroTrKDyWhUDebIWsQv11VQW0CgAH/Bz7dPv56AS1ZeETD1cwNt6/dhL
	ThqJJu7FrRcqXjgSi8E6iq7M75QH2ehjGO0j0ez88/14bv9TmBJEd6S0ZvOch3H+PugFqSMDrj2
	RomZGEx5red3CtrwBwTsQcFlCPh58Nq2Tn+naQf5lAkvSeOkqcbG66yM6jGibneWHzdIwLXtfZj
	vZTHaFB88wylD/BzVo5f+9UXbF36pbIw1ongzN5eVii6HsAeG/W8aeBNyynvu4oPPL0A==
X-Received: by 2002:a05:600c:a11b:b0:485:364e:9328 with SMTP id 5b1f17b1804b1-48fce9eacb7mr12437505e9.16.1778656803757;
        Wed, 13 May 2026 00:20:03 -0700 (PDT)
Received: from mamamia.internal (a89-182-129-90.net-htp.de. [89.182.129.90])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48fc8d62422sm58498115e9.11.2026.05.13.00.20.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 13 May 2026 00:20:03 -0700 (PDT)
From: Andre Heider <a.heider@gmail.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Yixun Lan <dlan@gentoo.org>
Cc: devicetree@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	spacemit@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH v3 2/6] riscv: dts: spacemit: k1-musepi-pro: add 24c02 eeprom
Date: Wed, 13 May 2026 09:19:50 +0200
Message-ID: <20260513071958.29574-3-a.heider@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260513071958.29574-1-a.heider@gmail.com>
References: <20260513071958.29574-1-a.heider@gmail.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Enable i2c2 and add the connected GT24C02B EEPROM.

It contains an ONIE TLV table:
=> tlv_eeprom
TLV: 0
[  12.162] TlvInfo Header:
[  12.162]    Id String:    TlvInfo
[  12.165]    Version:      1
[  12.168]    Total Length: 58
[  12.171] TLV Name             Code Len Value
[  12.175] -------------------- ---- --- -----
[  12.179] Product Name         0x21  16 k1-x_MUSE-Pi-Pro
[  12.184] Serial Number        0x23  17 BPMIMXXXXXXXXXXXX
[  12.189] Unknown              0x41   1  0x02
[  12.194] Base MAC Address     0x24   6 FE:FE:FE:XX:XX:XX
[  12.199] MAC Addresses        0x2A   2 2
[  12.203] CRC-32               0xFE   4 0x395ECD34
[  12.207] Checksum is valid.

(With 0x41 as TLV_CODE_DDR_CSNUM)

Signed-off-by: Andre Heider <a.heider@gmail.com>
---
 .../riscv/boot/dts/spacemit/k1-musepi-pro.dts | 33 +++++++++++++++++++
 1 file changed, 33 insertions(+)

diff --git a/arch/riscv/boot/dts/spacemit/k1-musepi-pro.dts b/arch/riscv/boot/dts/spacemit/k1-musepi-pro.dts
index e0b585c50014b..41d7d6d20a797 100644
--- a/arch/riscv/boot/dts/spacemit/k1-musepi-pro.dts
+++ b/arch/riscv/boot/dts/spacemit/k1-musepi-pro.dts
@@ -17,6 +17,7 @@ / {
 	aliases {
 		ethernet0 = &eth0;
 		serial0 = &uart0;
+		i2c2 = &i2c2;
 		i2c8 = &i2c8;
 	};
 
@@ -82,6 +83,38 @@ &pdma {
 	status = "okay";
 };
 
+&i2c2 {
+	pinctrl-0 = <&i2c2_0_cfg>;
+	pinctrl-names = "default";
+	status = "okay";
+
+	eeprom@50 {
+		compatible = "atmel,24c02";
+		reg = <0x50>;
+		vcc-supply = <&buck3_1v8>; /* EEPROM_VCC1V8 */
+		pagesize = <8>;
+		read-only;
+		size = <256>;
+
+		nvmem-layout {
+			compatible = "onie,tlv-layout";
+
+			product-name {
+			};
+
+			serial-number {
+			};
+
+			mac-address {
+				#nvmem-cell-cells = <1>;
+			};
+
+			num-macs {
+			};
+		};
+	};
+};
+
 &i2c8 {
 	pinctrl-0 = <&i2c8_cfg>;
 	pinctrl-names = "default";
-- 
2.53.0

