Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.161.44
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793036922;
	b=NaW9LniARbGV8jOk05Znp50f62gzNuqWIDhK7uMbDgGX1raiGStyWSDDOafZYsr9Z9+h
	 Gq4JIG02lJrp0yQ3A1TWXrbcodTtysqiq372jcezIUMXyPQLRrL6anxeMpmKqs5dSJeae
	 9/zg3f9Rl6TOWd5R/ctSUEyqCtCTj6bvUbA4i11Rxp1RzvsWXiUtTSMrlYf/05xQH6hyU
	 8BLC1u2SCT/iP1Cp0HSLi6oOLsNHtk+e09lghZIHQeaVe7VT+DRjZmhoiK4RIPtZy5QNi
	 qm9gaI/wJey2Ot9il0Ia03v1Wb0akIa/qt/MQc8RHVVazvpe64zUdUyj0L7KoiGEfXQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793036922;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=j6K6VKKr5G0aLKZ1oiFgfUauuoWvD3xUE8KiOwmhjtg=;
	b=FiTfHxCTvJEKWEf8z48k0msHmR4knjzHm09ndI3mISRhkkjXlevo/JpWEZsVxWu/IKDa
	 8gvgHykflx50RDxCTRH9adrSDTYHR/nUtiyv93FnHdVvhTyxc/6ybiga2XHf1luAwvyFv
	 xlg++5F/vz4d1IQF9X7gbDwV4CeT0ENsEitQ3PKtwpOMt2ptLDpLDcGYWHRXJM52F7GYM
	 8hBwJOZ7P6uz3qPwtdMr0cfxwAiTJwP0zWktBZ+TMajabit51rQdPRXnSYPtGfpMB9N6n
	 0VwPngOJFezajk6XG1WCFRQ9/pFrHc+2zsFIPbnJsegsA7Cry0RnPk9+Ar2ULBhdgXw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=nx2ymOjQ;
	arc=none smtp.remote-ip=209.85.161.44
Received: from mail-oo1-f44.google.com (mail-oo1-f44.google.com [209.85.161.44])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5FC66606A330
	for <devicetree@vger.kernel.org>; Mon, 26 Oct 2026 17:48:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5FC66606A330
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=nx2ymOjQ
Received: by mail-oo1-f44.google.com with SMTP id 006d021491bc7-6d68de53053so1656445eaf.0
        for <devicetree@vger.kernel.org>; Mon, 26 Oct 2026 10:48:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1793036920; x=1793641720; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=j6K6VKKr5G0aLKZ1oiFgfUauuoWvD3xUE8KiOwmhjtg=;
        b=nx2ymOjQtdxiDwOgcCJEorKB8T+aUnhglDkWNayeITWyPbO/b4TEPtSDBInBbEhZ1p
         wZAbs7fjHOY7rUNDdBPojySnYqjyTLimc1T5W1O9p7NE2byW4JT+kyBLzRbKorRSw9PQ
         PAWSBDRNXB3H5D6TL8icMI6PlIZNT3uAN5ZUwMZMgqHeDjjQ4TW9nwLk4cA/3jv/49Tw
         XOrbPGJnBWAdV+Y4LqqD2IL8Loj14htvaANkTKr6d2tdzV1kQ2KbFE9YW4chj+nv5TTR
         QoGNB/pRqwWAZHCnnHosm/iCyAuMt/DGMN9Y7zL2NeoxDLJBKIhBmDCt+hP40ZBfC1QL
         N4TQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793036920; x=1793641720;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=j6K6VKKr5G0aLKZ1oiFgfUauuoWvD3xUE8KiOwmhjtg=;
        b=nxdtpWcJBf84JKWaUu2XZZVp6VqRvXBy1d6KASYMr/mNg+ppzL+heD9yFyKAkvHnBq
         JpDHKmm6OdHQ4L+QYxdWaqt9fECuMh+A7LQiD5R5bUVpM3Dna/cLxhcpGFnUO5tV6qME
         Lh3SgJ8eKYQ5IivEuUOt79dlYunpDue35GFnq52ZhMYwVu49MSvX3sXxJAJ5hPt7fVaU
         3Nc8Yczh5vtF9WAlARp4IPjAHd2PAQwHK94qIQljAeIohAhgyma/lKSNoJ8xxNVSkqPR
         URaTjfOSt5tD3rsXABqQWIFiDjyxdIRMbfH0XQclqEf/6nXrXJ6ALfFHudsYgu5tpUKj
         8eUg==
X-Forwarded-Encrypted: i=1; AKwUvBygfNtNuqe+BN68TGd6kdyJFTybSOkLEVuVd6gM7AND5UnOd94Q2ZbQLb6cn/8eokhEoY25u4nDgDum@vger.kernel.org
X-Gm-Message-State: AFq9FYJYEerKFiehh7dRh6yDqGLYorU6trXse8GKpzpxJuwV7qMkZVZc
	d1VeBiVfzAowM3ogHbyit8EpDU3/ANl2MtQEKVEwfc9HP+sSFTnMknQH
X-Gm-Gg: AYBFou1D2Z8BREK4fWZyd2WnZRpNQaZzSqtyYL3v6zVysNE5sBiK/Ln/bQNi7gQ6Laz
	QpTVT+O5hRyT7E4AXgrDY/XPMCZiJDQyRhZ+pmAZkxf751LqQwAA5q20eHAVlZNTcnqZqZhnyNX
	J7WCmir8fd8/r+gT4+C3OW1vNPdN6dRGBPXy6viqme4BNgN+aPr7HNuhSKZ4IuQ79c9TgpY6i8o
	hhHP7Z0MEoo7P/omwkN9cZub5bCpQjjuyk+6BSrL9vG4YG/kFz36zsCL7RY1AtKoKhcTGJTGK6f
	rwVP269rdsKJcxJJ4LEYxgSoAwsWzHK1V0epIAfwy/kV9WXMBqj2ID5MtEa7I1vPd7f6usV/HPi
	vdRlIzzugmv8y5+sOu6Z5b90/3S4hxW8vYDBRJKai/7d1QHh8UEOdU1JB1Vqm+20BxoI0DBUCfi
	olxHCWiPRC9EFSnhb5fgECuv7WsMO2Fs4KpPqwrr33/OUu0uEqbjGjmGEmCdpGvxeXZax3pHLA7
	nQtVpGjn2Zo0U6cNNs5WUv750ScF41tCyDuS37PMMB3ZYBKb1gBOnbb
X-Received: by 2002:a05:6820:820:b0:6f5:467a:aec7 with SMTP id 006d021491bc7-70ba0dcd56cmr3790438eaf.30.1793036920211;
        Mon, 26 Oct 2026 10:48:40 -0700 (PDT)
Received: from neuromancer ([75.28.21.198])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-4a842e89e33sm5034753fac.1.2026.10.26.10.48.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Oct 2026 10:48:39 -0700 (PDT)
From: Chris Morgan <macroalpha82@gmail.com>
To: linux-pm@vger.kernel.org
Cc: linux-rockchip@lists.infradead.org,
	devicetree@vger.kernel.org,
	maccraft123mc@gmail.com,
	zhangqing@rock-chips.com,
	zyw@rock-chips.com,
	sre@kernel.org,
	heiko@sntech.de,
	conor+dt@kernel.org,
	krzk+dt@kernel.org,
	robh@kernel.org,
	lee@kernel.org,
	Chris Morgan <macromorgan@hotmail.com>,
	Jacob Cook <jacobmcook1984@gmail.com>
Subject: [PATCH 3/5] power: supply: rk817-charger: Correct the gauge across system sleep
Date: Mon, 26 Oct 2026 12:48:32 -0500
Message-ID: <20261026174834.1652309-4-macroalpha82@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261026174834.1652309-1-macroalpha82@gmail.com>
References: <20261026174834.1652309-1-macroalpha82@gmail.com>
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

From: Chris Morgan <macromorgan@hotmail.com>

The coulomb counter is erratic while the system sleeps. On an RG353M
charging at 1.4A, one 15 minute sleep registered 69% of the metered
charge and another 139%, and a charge that finished during sleep still
showed the pre-sleep percentage at wake. The signals that could correct
it are gone by the time the driver runs again: RELAX_STS clears as soon
as the wakeup load exceeds the relax threshold (300mA here, less than
an idle UI draws), and CHARGE_FINISH disappears while the charger
re-detects its input. The BSP driver corrects at resume from sleep time
times current and from the relax voltage. Do the same from evidence
that persists:

- At suspend, stamp boottime, charge, current and charging state, and
  clear the relax-updated flags.

- At resume, recompute the soc from the counter, capped at full. A
  relax pair with its flags set was latched during this sleep:
  recalibrate from it without demanding a live RELAX_STS. Otherwise,
  if the system slept charging, credit elapsed * current where the
  counter fell short, saturating at full, which also covers a charge
  that finished during sleep.

The constant-current estimate reads high across a CV taper; the cap
bounds it and the next rested pair corrects the remainder.

Log the counter at suspend and resume, the battery voltage and the
relax pair, so the path taken can be read from the log.

Suggested-by: Jacob Cook <jacobmcook1984@gmail.com>
Co-developed-by: Jacob Cook <jacobmcook1984@gmail.com>
Signed-off-by: Jacob Cook <jacobmcook1984@gmail.com>
Signed-off-by: Chris Morgan <macromorgan@hotmail.com>
Assisted-by: Claude:claude-5-fable
---
 drivers/power/supply/rk817_charger.c | 109 +++++++++++++++++++++++++--
 1 file changed, 104 insertions(+), 5 deletions(-)

diff --git a/drivers/power/supply/rk817_charger.c b/drivers/power/supply/rk817_charger.c
index 50fbea298127..b6714d8e4fed 100644
--- a/drivers/power/supply/rk817_charger.c
+++ b/drivers/power/supply/rk817_charger.c
@@ -10,6 +10,7 @@
 
 #include <linux/unaligned.h>
 #include <linux/devm-helpers.h>
+#include <linux/math64.h>
 #include <linux/mfd/rk808.h>
 #include <linux/irq.h>
 #include <linux/of.h>
@@ -104,6 +105,12 @@ struct rk817_charger {
 	/* Retained for the ocv-capacity table the recalibration needs. */
 	struct power_supply_battery_info *bat_info;
 
+	/* Stamped at system suspend to correct the gauge across sleep. */
+	time64_t slp_boottime;
+	int slp_charge_uah;
+	int slp_cur_ua;
+	bool slp_charging;
+
 	/* Values updated periodically by driver for display. */
 	int charge_now_uah;
 	int volt_avg_uv;
@@ -355,14 +362,20 @@ static int rk817_bat_voltage_uv(struct rk817_charger *charger, unsigned int reg)
 /*
  * Voltage the gauge latched while the battery was resting. Relax mode only
  * samples below RELAX_THRE_CUR, so this is a true open circuit voltage with
- * no resistance term. Returns 0 unless the battery is resting now and the
- * latched pair is inside the pack's design range.
+ * no resistance term. The update flags are cleared at init and at suspend,
+ * so a pair with them set postdates the last of those; live_only also
+ * requires the battery to be resting now. Returns 0 if there is no usable
+ * pair inside the pack's design range.
  */
-static int rk817_bat_relax_voltage_uv(struct rk817_charger *charger)
+static int rk817_bat_relax_voltage_uv(struct rk817_charger *charger,
+				      bool live_only)
 {
-	unsigned int need = RK817_RELAX_STS | RK817_RELAX_VOL_UPD;
+	unsigned int need = RK817_RELAX_VOL_UPD;
 	int ret, sts, vol;
 
+	if (live_only)
+		need |= RK817_RELAX_STS;
+
 	ret = regmap_read(charger->rk808->regmap, RK817_GAS_GAUGE_GG_STS, &sts);
 	if (ret < 0 || (sts & need) != need)
 		return 0;
@@ -472,7 +485,7 @@ static void rk817_read_props(struct rk817_charger *charger)
 		charger->charger_input_volt_avg_uv = 0;
 	}
 
-	charger->relax_voltage_uv = rk817_bat_relax_voltage_uv(charger);
+	charger->relax_voltage_uv = rk817_bat_relax_voltage_uv(charger, true);
 
 	/* Calibrate battery capacity and soc. */
 	rk817_bat_calib_cap(charger);
@@ -1323,12 +1336,96 @@ static int rk817_charger_probe(struct platform_device *pdev)
 	return 0;
 }
 
+/*
+ * The coulomb counter is erratic while the system sleeps, and the signals
+ * that could correct it (a live relax status, a finished charge) are gone
+ * before the monitor runs again. Correct from what persists instead, as
+ * the BSP driver does.
+ */
+static void rk817_bat_sleep_adjust(struct rk817_charger *charger)
+{
+	struct rk808 *rk808 = charger->rk808;
+	time64_t elapsed = ktime_get_boottime_seconds() - charger->slp_boottime;
+	int expected_uah, moved_uah, charge_uah, credit_uah, tmp;
+	unsigned int sts;
+	u8 bulk_reg[4];
+
+	if (!charger->battery_present || elapsed <= 0)
+		return;
+
+	regmap_read(rk808->regmap, RK817_SYS_STS, &sts);
+	charger->plugged_in = (sts & RK817_PLUG_IN_STS);
+
+	/* Start from what the counter did during sleep, not the pre-sleep soc. */
+	regmap_bulk_read(rk808->regmap, RK817_GAS_GAUGE_Q_PRES_H3,
+			 bulk_reg, 4);
+	tmp = get_unaligned_be32(bulk_reg);
+	charge_uah = tmp > 0 ? ADC_TO_CHARGE_UAH(tmp, charger->res_div) : 0;
+	if (charge_uah > charger->fcc_mah * 1000)
+		charge_uah = charger->fcc_mah * 1000;
+	charger->soc = div_s64((s64)charge_uah * 100, charger->fcc_mah);
+
+	/* Flags were cleared at suspend: any pair now is from this sleep. */
+	charger->relax_voltage_uv = rk817_bat_relax_voltage_uv(charger, false);
+	dev_dbg(charger->dev,
+		"resume after %llds: counter %d uAh (%d at suspend), battery %d uV, relax %d uV\n",
+		elapsed, charge_uah, charger->slp_charge_uah,
+		rk817_bat_voltage_uv(charger, RK817_GAS_GAUGE_BAT_VOL_H),
+		charger->relax_voltage_uv);
+	if (charger->relax_voltage_uv) {
+		rk817_bat_ocv_recalibrate(charger);
+		return;
+	}
+
+	if (!charger->slp_charging || !charger->plugged_in)
+		return;
+
+	moved_uah = charge_uah - charger->slp_charge_uah;
+	expected_uah = div_s64((s64)charger->slp_cur_ua * elapsed, 3600);
+	credit_uah = expected_uah - moved_uah;
+
+	dev_info(charger->dev,
+		 "slept charging for %llds: counter moved %d of expected %d uAh\n",
+		 (long long)elapsed, moved_uah, expected_uah);
+
+	if (credit_uah <= 0)
+		return;
+
+	/*
+	 * Credit the shortfall, saturating at full - covers a charge that
+	 * terminated during sleep. A constant-current estimate reads high
+	 * across a taper; the cap bounds it, the next rested pair corrects
+	 * the rest.
+	 */
+	charge_uah += credit_uah;
+	if (charge_uah > charger->fcc_mah * 1000)
+		charge_uah = charger->fcc_mah * 1000;
+
+	charger->soc = div_s64((s64)charge_uah * 100, charger->fcc_mah);
+	tmp = CHARGE_TO_ADC(charge_uah / 1000, charger->res_div);
+	put_unaligned_be32(tmp, bulk_reg);
+	regmap_bulk_write(rk808->regmap, RK817_GAS_GAUGE_Q_INIT_H3,
+			  bulk_reg, 4);
+	rk817_record_battery_nvram_values(charger);
+}
+
 static int __maybe_unused rk817_suspend(struct device *dev)
 {
 	struct rk817_charger *charger = dev_get_drvdata(dev);
 
 	cancel_delayed_work_sync(&charger->work);
 
+	charger->slp_boottime = ktime_get_boottime_seconds();
+	charger->slp_charge_uah = charger->charge_now_uah;
+	charger->slp_cur_ua = abs(charger->cur_avg_ua);
+	charger->slp_charging = charger->plugged_in &&
+				(charger->charge_status == CC_OR_CV_CHRG ||
+				 charger->charge_status == TRICKLE_CHRG);
+
+	/* Any relax pair found at resume will postdate this suspend. */
+	regmap_write_bits(charger->rk808->regmap, RK817_GAS_GAUGE_GG_STS,
+			  RK817_RELAX_VOL_UPD, 0);
+
 	return 0;
 }
 
@@ -1337,6 +1434,8 @@ static int __maybe_unused rk817_resume(struct device *dev)
 
 	struct rk817_charger *charger = dev_get_drvdata(dev);
 
+	rk817_bat_sleep_adjust(charger);
+
 	/* force an immediate update */
 	mod_delayed_work(system_percpu_wq, &charger->work, 0);
 
-- 
2.53.0

