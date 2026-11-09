Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.41
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794217319;
	b=ElltGqLcgGNTjsF0mmxcwWuAiK4+wJLXhCwNf8BbyYp1K45osz/rrZFi4a2boFaL5FXG
	 3gMA5FA7VSu0NqCwG1YGKlcKlxdJPDBzvms+NX7eL/hq4AWERNCICxPk2LBYE3OGBe13X
	 kL2mY2PXNuHAFpOujmrtHEoLkiZJeDjRupPadD4TGU1ZwTDsu5eYyMpTTfgEXLEj8d0Vg
	 k4ViB3YMo9XTi+emRcnempLXsGH4R0uDu20fv0w1Xt8NZN+m9Bph1wnTUKjttbNne16kJ
	 vb4rATXAdMl5V5MLcu2jM/llc2lCx1m1zxnM04KNH77gZzA2bmZyHF2xuFH7IEog3Cw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794217319;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key;
	bh=W8kDBNUIMx2RoBkmuROfXgDia+iOaYLZ3FqEGuScl8o=;
	b=15i5sHUljbJMSEoG+rTI3x/M2I5D4tR1y5yTLigs8bS8ND2gNFYruJrUEx6SAJ+C4OM8
	 vs4XretpAExrX4Rp8MHZhQiaGAUHBSdsaFlgoKKhkUXfK7vxFaWjE7T8U4bz/8+wM9SH+
	 eAN0PQd8BMqqdACyEeeoHhtx8upmVFn0VVdzZM9WrSqYeVtCtJn/p2ZDitS09I1Z9tr10
	 TMxbcRx84GuQD1ysALVT92Eh6yOuTkWk9QzpEkWeKF/aakolNIQqLi9dvZoVwYQ2AFh/O
	 3pMAlMq3m+gfDy57HgpXF1oavYOm3Wcyw5ZEFxMCxjeXh9IgYCobMfpsaNoBZPQLbog==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=flipper.net;
	spf=pass smtp.mailfrom=flipper.net;
	dkim=pass header.d=flipper.net header.i=@flipper.net header.a=rsa-sha256 header.s=google header.b=0v8RVuJY;
	arc=none smtp.remote-ip=209.85.221.41
Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 91B1F606D80D
	for <devicetree@vger.kernel.org>; Mon,  9 Nov 2026 09:41:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 91B1F606D80D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=flipper.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flipper.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=flipper.net header.i=@flipper.net header.a=rsa-sha256 header.s=google header.b=0v8RVuJY
Received: by mail-wr1-f41.google.com with SMTP id ffacd0b85a97d-492fcbfaa88so437309f8f.3
        for <devicetree@vger.kernel.org>; Mon, 09 Nov 2026 01:41:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=flipper.net; s=google; t=1794217318; x=1794822118; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=W8kDBNUIMx2RoBkmuROfXgDia+iOaYLZ3FqEGuScl8o=;
        b=0v8RVuJYQLkq49h1HUX3+eCQxsNRfvzpszYmfS1TBy/1IGbftYqH13gdDKNLopUQLK
         66OF/7/MIJX3zTKH01SCp2P1KuOrx5CR0ODam9MoC4zZuS9KokMf7xwBrQqQb/qJ0uMl
         rOTPC+PAdpUW0BZaTClXnl5xhcw7AZYE6C5XRXH1k6CWdpWTnILjZaTTv7wzf1eMSUZm
         kDvtbz2CHM20Eu8q6LL4YwBl80hWm0YVascDFiuvCq6oeKrqiAv5knF+HoL9tuxPbPgU
         DNHjz5RJfTIRipDaXRGLQ09dypB6SnPizYdBax8aMEFblKc5ynyGm96tLpZ3lFJ5bQ2P
         Q/cw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794217318; x=1794822118;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=W8kDBNUIMx2RoBkmuROfXgDia+iOaYLZ3FqEGuScl8o=;
        b=0OWuKZsNLz5984CnUd14GcityRWpMfeULp813G81Z14jkDneD2hch2JlrCL05BmrsI
         SAJ9hfCAcO/IHSVmW5WNSe6ilPskuDEpDEO3iRANrcUKFkTUjkW6u+TQHT0UOHPxhtQ+
         u+JVSNtFAoaT5OJEOc54tdMC+iXvNyUzr2GN6musJJNWSDUyPbU9+GTpLnc2p8fMnG3T
         5mOUCN0JnYaq0+6qc4vp/Vgkin/KEb0I/YE+swnLtNo0d+x7t0cIKZZsA6e52tZA+Kmp
         HEq3hQxQqW7FcLRAnhazDFbiazA7O7J74bbKSCu1olOuaB2BcDIf+k1+aUKdDUtzVjr8
         oR2A==
X-Forwarded-Encrypted: i=1; AL+hErEQkd3n876/NHymYdPlAxZx/5qbDWMdZdxJ05IVqL7xHdDB6rStIghn1W4CwA6pa92Rm+jSt5jCcXoa@vger.kernel.org
X-Gm-Message-State: APuU4Z8xrWUEyaV8qyBTibaBuc9comIo8MOnXSbb1luyIN3J33cFSSqL
	5dVJXCk9rSYqtObC48Hh66J5x21keSq7xEBRySfvFqoCqoHYb+TntAOi+4oMAfIZxDg=
X-Gm-Gg: AYBFou2CseAhoND8hNiQBwhZBjp0kkWAtXAD08Sg7OuHRQgYYogWLDXKANYRLvkJb3i
	f/Vszlz8PPnyjuubdkd05nDphIY5fTbwDoKWlGju1i2rM6P+SaMh4bd6M1Sll0IeOSizRKCsWrx
	7Y62U6iJyAWDzGgSDyfOcBK4kCMTdrL5jOArlhW6kQfy+jVS9HvDgWNaK1ywgS2j/6bMj0Vjrpx
	ftWKFRQIwZt3pEhZgdaeFzVs1XYONbpt6DZTPKJj/oKsyqO/5FoExc0TfbpZJF6zbD5X3XXj0yY
	6py4aMaQXm/Y4bM1DM/CUp1WXr7Wrtti2dN9yf6sW4cQDJXQLATccRRdhuLXZG/ceYplARO5UmE
	moluLG2+4Z/pr/xOX+SYSKLBbQYQfFHNHtOUCfi4rITW+hq9MaaJimCtei2byeW4QtrLNyIwHT3
	sLRV2PkQzalhiWvosTc/ZYjpKrKZQg/4qbZad2rqhYVJasLGnwLVZhmNGo7I583s60pA+48hTO3
	+8I7UlgTPspACNKVSjKcIHSDeSc51TiSoNcWp3TTcgMFTVSe52gafEnWJnJ+w/ANhzjGrbfQ3zl
	v1ICnyYnZKmTbC89kq2B6lea6KqzoGPTW0h3FFcPogXR8vhUqXehZhpe5jL+MMVh74s86P71DG6
	ne1Sgq0c/
X-Received: by 2002:a5d:5f47:0:b0:492:820d:1e with SMTP id ffacd0b85a97d-49582badd84mr6917514f8f.11.1794217317932;
        Mon, 09 Nov 2026 01:41:57 -0800 (PST)
Received: from alchark-surface.localdomain (bba-86-98-194-229.alshamil.net.ae. [86.98.194.229])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-496150c6e90sm7278409f8f.2.2026.11.09.01.41.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Nov 2026 01:41:57 -0800 (PST)
From: Alexey Charkov <alchark@flipper.net>
Date: Mon, 09 Nov 2026 13:41:49 +0400
Subject: [PATCH 2/3] power: supply: core: Read the charging temperature
 range and alert settings
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
Message-Id: <20261109-battery-charge-temp-range-v1-2-a967abd8b80c@flipper.net>
References: <20261109-battery-charge-temp-range-v1-0-a967abd8b80c@flipper.net>
In-Reply-To: <20261109-battery-charge-temp-range-v1-0-a967abd8b80c@flipper.net>
To: Sebastian Reichel <sre@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-pm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Alexey Charkov <alchark@flipper.net>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=5179; i=alchark@flipper.net;
 h=from:subject:message-id; bh=1QdZ87I+aN0vOgr82I+rhB7jLzR731jKRnCpiXvHmVM=;
 b=owGbwMvMwCW2adGNfoHIK0sZT6slMWR9nBr/qNJ8i+9jvamiHsvyGh72ut6YXTTn4UHPdsPv6
 4I+X5gv2zGRhUGMi8FSTJFl7rcltlON+Gbt8vD4CjOHlQlkiLRIAwMQsDDw5SbmlRrpGOmZahvq
 GRrpGOsYMXBxCsBUR7oy/BX7e6V4RmCu6+E3P/fenvythfGV/HMd6bojjvwO1/0WWKkxMhz8HfP
 6sWVhUe4s/eXfI3UmJ93iuryxca2eyqoT7/002NkA
X-Developer-Key: i=alchark@flipper.net; a=openpgp;
 fpr=9DF6A43D95320E9ABA4848F5B2A2D88F1059D4A5

Read charge-temp-range-celsius into new temp_charge_min and
temp_charge_max fields, falling back to the operating range when it is
absent, so that a charger can stop charging outside a narrower range
while the battery stays in use. Read the alert-*-temp-charge-*
properties into the existing alert_*_temp_charge_* fields, which no
firmware description could set before, and document them as applying
between the alert and charging limits.

Signed-off-by: Alexey Charkov <alchark@flipper.net>
---
 drivers/power/supply/power_supply_core.c | 16 ++++++++++++++++
 include/linux/power_supply.h             | 16 ++++++++++++----
 2 files changed, 28 insertions(+), 4 deletions(-)

diff --git a/drivers/power/supply/power_supply_core.c b/drivers/power/supply/power_supply_core.c
index de15314ef954..3bfc4fb8687e 100644
--- a/drivers/power/supply/power_supply_core.c
+++ b/drivers/power/supply/power_supply_core.c
@@ -855,6 +855,14 @@ int power_supply_get_battery_info(struct power_supply *psy,
 			     &info->constant_charge_voltage_max_uv);
 	fwnode_property_read_u32(fwnode, "factory-internal-resistance-micro-ohms",
 			     &info->factory_internal_resistance_uohm);
+	fwnode_property_read_u32(fwnode, "alert-low-temp-charge-current-microamp",
+			     &info->alert_low_temp_charge_current_ua);
+	fwnode_property_read_u32(fwnode, "alert-low-temp-charge-voltage-microvolt",
+			     &info->alert_low_temp_charge_voltage_uv);
+	fwnode_property_read_u32(fwnode, "alert-high-temp-charge-current-microamp",
+			     &info->alert_high_temp_charge_current_ua);
+	fwnode_property_read_u32(fwnode, "alert-high-temp-charge-voltage-microvolt",
+			     &info->alert_high_temp_charge_voltage_uv);
 
 	if (!fwnode_property_read_u32_array(fwnode, "ambient-celsius",
 					    min_max, ARRAY_SIZE(min_max))) {
@@ -871,6 +879,14 @@ int power_supply_get_battery_info(struct power_supply *psy,
 		info->temp_min = min_max[0];
 		info->temp_max = min_max[1];
 	}
+	if (!fwnode_property_read_u32_array(fwnode, "charge-temp-range-celsius",
+					    min_max, ARRAY_SIZE(min_max))) {
+		info->temp_charge_min = min_max[0];
+		info->temp_charge_max = min_max[1];
+	} else {
+		info->temp_charge_min = info->temp_min;
+		info->temp_charge_max = info->temp_max;
+	}
 
 	len = fwnode_property_count_u32(fwnode, "ocv-capacity-celsius");
 	if (len < 0 && len != -EINVAL) {
diff --git a/include/linux/power_supply.h b/include/linux/power_supply.h
index cce61137aef4..246fba40ea78 100644
--- a/include/linux/power_supply.h
+++ b/include/linux/power_supply.h
@@ -559,15 +559,15 @@ struct power_supply_maintenance_charge_table {
  *   maintenance_charge.
  * @alert_low_temp_charge_current_ua: The charging current to use if the battery
  *   enters low alert temperature, i.e. if the internal temperature is between
- *   temp_alert_min and temp_min. No matter the charging phase, this
+ *   temp_charge_min and temp_alert_min. No matter the charging phase, this
  *   and alert_high_temp_charge_voltage_uv will be applied.
  * @alert_low_temp_charge_voltage_uv: Same as alert_low_temp_charge_current_ua,
  *   but for the charging voltage.
  * @alert_high_temp_charge_current_ua: The charging current to use if the
  *   battery enters high alert temperature, i.e. if the internal temperature is
- *   between temp_alert_max and temp_max. No matter the charging phase, this
- *   and alert_high_temp_charge_voltage_uv will be applied, usually lowering
- *   the charging current as an evasive manouver.
+ *   between temp_alert_max and temp_charge_max. No matter the charging phase,
+ *   this and alert_high_temp_charge_voltage_uv will be applied, usually
+ *   lowering the charging current as an evasive manouver.
  * @alert_high_temp_charge_voltage_uv: Same as
  *   alert_high_temp_charge_current_ua, but for the charging voltage.
  * @factory_internal_resistance_uohm: the internal resistance of the battery
@@ -603,6 +603,12 @@ struct power_supply_maintenance_charge_table {
  * @temp_max: the battery will go outside of operating conditions when
  *   the internal temperature goes above this temperature in degrees Celsius.
  *   Normally this means the system should shut down.
+ * @temp_charge_min: the battery must not be charged when the internal
+ *   temperature is below this temperature in degrees Celsius. Defaults to
+ *   temp_min.
+ * @temp_charge_max: the battery must not be charged when the internal
+ *   temperature is above this temperature in degrees Celsius. Defaults to
+ *   temp_max.
  * @ocv_table: for each entry in ocv_temp there is a corresponding entry in
  *   ocv_table and a size for each entry in ocv_table_size. These arrays
  *   determine the capacity in percent in relation to the voltage in microvolts
@@ -826,6 +832,8 @@ struct power_supply_battery_info {
 	int temp_alert_max;
 	int temp_min;
 	int temp_max;
+	int temp_charge_min;
+	int temp_charge_max;
 	const struct power_supply_battery_ocv_table *ocv_table[POWER_SUPPLY_OCV_TEMP_MAX];
 	int ocv_table_size[POWER_SUPPLY_OCV_TEMP_MAX];
 	const struct power_supply_resistance_temp_table *resist_table;

-- 
2.56.0

