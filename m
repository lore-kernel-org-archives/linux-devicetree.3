Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.41
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793300327;
	b=hVZA7jiF78u5t97P2aNA3BIRzsrBmWAz5n9HmBzllrJZDDYNJ7elcpkQoW/CyvMU7gRY
	 lYs/fAQuG9OiF+SLNCc41qiLJL99/EyFn0uDNd+P6dpJshBnZ9ZuOdw8UPNFK6Rk3HpgZ
	 ixa5lata03b58pENEPnclczGXrbVPZvso/5Pvhrf7uulRKEqoJqSFHf5Y7ESnJEdil2uh
	 W2d74gsydlHzAvETDg7ldWd72ewg2B2yp8r/nRYezP8eUozmKR4NFEOdWdw8we0QS5rEk
	 NMvgTdkmLjyVda/3buljsjDiCXA1s57u6LasMIezbldT9iuhM/Q3k1Hm5BIaVdIQrQQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793300327;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key;
	bh=9tJApL13jYD80pBp1MzydfMpvJBp4BlcldlOMSU105M=;
	b=Vm3rL++AGWqzYx4oamo/qre+gDs1AL4+VaxXUgi7VZ5TVDMprAS8HLv/qTjtTjvlUbe4
	 RAD4kPstoA9tKw0xU9XK5oqGpsxqc4IOJz+Q3j0YbxSjmkTTV9iqS7wQ23viB2jlH5Giq
	 aBYPB32At82sLfB7be3EWe+4u82q0WyO6Kpz7zye6DMlTk5vHYFH3+OJTOBSB9wk+sQvW
	 6s/gu+e9YXdyxTT1dPxSNiH/fjNSW8D1dVg/xmlBdLYcrXDqbD9EjlF3pi5nZK4Byh7Ha
	 GlFIEk5q9Q1uokwRqSqMN1cB0tqX0HJxsXfeoMfykRd3EeupX2RHv0AYoOKiWFbZf6g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ROAa1Dd0;
	arc=none smtp.remote-ip=209.85.128.41
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7480860A2627
	for <devicetree@vger.kernel.org>; Thu, 29 Oct 2026 18:58:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7480860A2627
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ROAa1Dd0
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-4a7992e2f7dso23314755e9.3
        for <devicetree@vger.kernel.org>; Thu, 29 Oct 2026 11:58:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793300313; x=1793905113; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=9tJApL13jYD80pBp1MzydfMpvJBp4BlcldlOMSU105M=;
        b=ROAa1Dd045ooc7vRm7+fs8AEm4NbqvkKt7xrNMxkXeL5nrPzcY9TL2+t1ItP41Bj1h
         Gj0Yw+2kJ8l+kNSemYW2kESFfoEU8UMMacjqSSIW0bRFCNfz+Lg97csRo9ivybDKCx6b
         cpbEwu0jXyZr8ncG/j/5+cnp2WBt+SllE1qPUvK8h2/pez0d2nC/ltA0Fzb4kJ4coydJ
         PtGenoP6nkCrUHXTffi0WTzrtc4jcqZTiYNy9Wt8Pq5vm2GDHA99cb6G+ciEU108Ua7M
         /EkqG2KUYwMMnVXEb/aZ/6F3jJD+2ZTqNtV7cNmVggCU99JqaA8ai/SvML8G+PW4/+Ld
         VPVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793300313; x=1793905113;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=9tJApL13jYD80pBp1MzydfMpvJBp4BlcldlOMSU105M=;
        b=vnpn8Pf4h9Xwkp9uLeTFg2Y87vJ6Zg3W3Mm8icO4vXClEKrC9U6Jr7GdAKEdiJAdlj
         ox1WF974U1q0miovliuqBuF/i17WOW9Lhb+Xz3NqFBhbTXuK6BAAeQtij8Ucc4IBm0GZ
         7MSgr6x/dTeHAwNfkcMj+H3ukD0PVypp8e25JQBp/bxbJr/4t4oOIuQuBXp/im9xnTfQ
         RaeDbhPkIUxSCpWO5jeytdhREZV1uqoZwhLkCfGosLqN9/iJDZ2gkmGES2cTI/uEWUsz
         XEJcv9hpn3g4sOFP4Ci/XP9KSg6oIpDj1ZHBtUBcp/1zOG29LdeuqR9DvL530T4PRq0N
         k9Uw==
X-Forwarded-Encrypted: i=1; AKwUvByNEI/2bQZ4HDDEcrd9soF/qEgI+FjOlfMqvT/q887Ns5NmMEePLonHLsZPVDDWwX035PoZsL5aoHZl@vger.kernel.org
X-Gm-Message-State: AFq9FYL2wCk1wW1atdsOzFqlyH1NMXvX/pRq7R2pmfqblFXYi73SbHg+
	idMVzOesJa56XxrmRYoaVV0zjEtXOIHZvNg+W1NjzG2bPISM8gNuZKxL
X-Gm-Gg: AYBFou12c/Ec/2YXDmG54rBTQpLJ9x/q/ysn7G81y0dYTZqZoZ04TLIyWu/Cm+OqKSg
	WefdX7pxnL2b8bHlLNB61TEpq26Et/0sn66zdhJW2aVaedwitDHKRicjxtUGO04IA1Euw7gBYWg
	xRlS1umyJ494MbmdQz+DBBSU6Z4oQ7cgxkxTcQzPEFG2QmGAeqcIHqiDkBe7yjcIXZ26wnqli48
	9bCBJoQ1HAjZmxwt9kuVqcypqV+2uIJ5MQYXEsTTaTQag72Pt6o1H/3YgbFcvbC+OWFCXC2cJyk
	xHCd2tGuHgwTg4sNfPl4DuDDdej9XyoYnuj25tYlaG9VfvLhGQw1mxCAIe8tB5mT0gg/deW2hG3
	sXt6a1z0zdo6XZYSIpv0ZdmjtgZLZhitV6jxNaB3eDYXPA7qr3zI3FEoTh08draE4kwmaPF6dX7
	Uz8fFwHUKxKAjSNvB72mL+fGT+3cR/U5wJo6YcsNUA/246RwAt5Til16SRMY92PCJ1rBy/w3rPq
	zN16kjj8pBABSMK2FHqb6DQi90Vg9HKulkXGv1SNYQEHt6oGogZktj090nAq1CbCEPb4t8f5gxY
	h/3CtFajcU8VbczkXTheksZqyzQmS5uQ4Y8dXGLor95h4Gtuu7NeurBo9wFhyzHDGvQZoJ6fi8Y
	9Dglum4ApHOQ=
X-Received: by 2002:a05:600c:8183:b0:4a2:1a:a129 with SMTP id 5b1f17b1804b1-4a9677c92d0mr123815985e9.35.1793300312779;
        Thu, 29 Oct 2026 11:58:32 -0700 (PDT)
Received: from [127.0.1.1] ([2a00:23c4:a702:d301:eafc:6fb2:6c68:5ae0])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4aa81a896fesm94291535e9.10.2026.10.29.11.58.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Oct 2026 11:58:32 -0700 (PDT)
From: Biju Das <biju.das.au@gmail.com>
Date: Thu, 29 Oct 2026 18:58:28 +0000
Subject: [PATCH v9 7/7] pwm: rzg2l-gpt: Add RZ/G3E support
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
Content-Transfer-Encoding: 8bit
Message-Id: <20261029-gpt_rzg3e-v9-7-f3a5520388d3@bp.renesas.com>
References: <20261029-gpt_rzg3e-v9-0-f3a5520388d3@bp.renesas.com>
In-Reply-To: <20261029-gpt_rzg3e-v9-0-f3a5520388d3@bp.renesas.com>
To: =?utf-8?q?Uwe_Kleine-K=C3=B6nig?= <ukleinek@kernel.org>, 
 Geert Uytterhoeven <geert+renesas@glider.be>, 
 Magnus Damm <magnus.damm@gmail.com>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>
Cc: linux-pwm@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org, 
 Biju Das <biju.das.jz@bp.renesas.com>, 
 Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1793300303; l=5197;
 i=biju.das.jz@bp.renesas.com; s=20261020; h=from:subject:message-id;
 bh=rMti4nVWaXcqMBwGhXa7IT8v4yzgTB4dEpyc6qkRjiM=;
 b=MPzAnHk+d4TjXb6vN0vwjaqQCFI08wtO+hhJ/GBLBNIu4YFoESZUfTHGDuJ8KuU5HgAzDQTtj
 VL0IZpo1idQAMsc+lcltoqN5JKsbqXl5cxXaThMr+PUwBuPuYMHS08Z
X-Developer-Key: i=biju.das.jz@bp.renesas.com; a=ed25519;
 pk=yzD2T1OLS3lEYflbk64xhLlxhk75lZ+NoOtkTOqrlVw=

From: Biju Das <biju.das.jz@bp.renesas.com>

Add RZ/G3E GPT support. It has multiple clocks and resets compared to
RZ/G2L. Also prescale field width and factor for calculating prescale
are different.

Reviewed-by: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>
Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
---
v8->v9:
 * Updated a comment in limitation section '8 Channels'->'8 channels'.
v7->v8:
 * Updated rzg3e_gpt_calculate_prescale() with >= 64.
v6->v7:
 * No change.
v5->v6:
 * Updated rzg3e_gpt_calculate_prescale().
 * Updated comment in rzg2l_gpt_calculate_period_or_duty().
v4->v5:
 * No change.
v3->v4:
 * Added RZG3E_GTCR_TPCS bit definition for RZ/G3E and added to
   rzg3e_data.
v2->v3:
 * No change.
v1->v2:
 * Added link to hardware manual
 * Updated limitation section
 * Collected tag
---
 drivers/pwm/pwm-rzg2l-gpt.c | 45 ++++++++++++++++++++++++++++++++++++++++++---
 1 file changed, 42 insertions(+), 3 deletions(-)

diff --git a/drivers/pwm/pwm-rzg2l-gpt.c b/drivers/pwm/pwm-rzg2l-gpt.c
index 488839e99464..5ce662559263 100644
--- a/drivers/pwm/pwm-rzg2l-gpt.c
+++ b/drivers/pwm/pwm-rzg2l-gpt.c
@@ -6,15 +6,21 @@
  *
  * Hardware manual for this IP can be found here
  * https://www.renesas.com/eu/en/document/mah/rzg2l-group-rzg2lc-group-users-manual-hardware-0?language=en
+ * https://www.renesas.com/en/document/mah/rzg3e-group-users-manual-hardware
  *
  * Limitations:
  * - Counter must be stopped before modifying Mode and Prescaler.
  * - When PWM is disabled, the output is driven to inactive.
  * - While the hardware supports both polarities, the driver (for now)
  *   only handles normal polarity.
- * - General PWM Timer (GPT) has 8 HW channels for PWM operations and
- *   each HW channel have 2 IOs.
+ * - For RZ/G2L, the General PWM Timer (GPT) has 8 HW channels for PWM
+     operations and each HW channel have 2 IOs (GTIOCn{A, B}).
  * - Each IO is modelled as an independent PWM channel.
+ * - For RZ/G3E, the General PWM Timer (GPT) has 16 HW channels for PWM
+     operations (GPT0: 8 channels, GPT1: 8 channels) and each HW channel
+     have 4 IOs (GTIOCn{A,AN,B,BN}). The 2 extra IOs GTIOCnAN and GTIOCnBN
+     in RZ/G3E are anti-phase signals of GTIOCnA and GTIOCnB. The
+     anti-phase signals of RZ/G3E are not modelled as PWM channel.
  * - When both channels are used, disabling the channel on one stops the
  *   other.
  * - When both channels are used, the period of both IOs in the HW channel
@@ -47,6 +53,7 @@
 #define RZG2L_GTCR_CST		BIT(0)
 #define RZG2L_GTCR_MD		GENMASK(18, 16)
 #define RZG2L_GTCR_TPCS		GENMASK(26, 24)
+#define RZG3E_GTCR_TPCS		GENMASK(26, 23)
 
 #define RZG2L_GTCR_MD_SAW_WAVE_PWM_MODE	FIELD_PREP(RZG2L_GTCR_MD, 0)
 
@@ -147,6 +154,22 @@ static u8 rzg2l_gpt_calculate_prescale(u64 period_ticks)
 	return prescale;
 }
 
+static u8 rzg3e_gpt_calculate_prescale(u64 period_ticks)
+{
+	u32 prescaled_period_ticks;
+	u8 prescale;
+
+	prescaled_period_ticks = period_ticks >> 32;
+	if (prescaled_period_ticks >= 64 && prescaled_period_ticks < 256)
+		prescale = 8;
+	else if (prescaled_period_ticks >= 256)
+		prescale = 10;
+	else
+		prescale = fls(prescaled_period_ticks);
+
+	return prescale;
+}
+
 static int rzg2l_gpt_request(struct pwm_chip *chip, struct pwm_device *pwm)
 {
 	struct rzg2l_gpt_chip *rzg2l_gpt = to_rzg2l_gpt_chip(chip);
@@ -228,7 +251,8 @@ static u64 rzg2l_gpt_calculate_period_or_duty(struct rzg2l_gpt_chip *rzg2l_gpt,
 
 	/*
 	 * The calculation doesn't overflow a u64 because,
-	 * prescale ≤ 5 for info->prescale_mult = 2 and so
+	 * prescale ≤ 5 for info->prescale_mult = 2,
+	 * prescale ≤ 10 for info->prescale_mult = 1, and so
 	 * tmp = val << (info->prescale_mult * prescale) * NSEC_PER_MSEC
 	 *     < 2^32 * 2^10 * 10^6
 	 *     < 2^32 * 2^10 * 2^20
@@ -482,6 +506,14 @@ static int rzg2l_gpt_probe(struct platform_device *pdev)
 	if (IS_ERR(rstc))
 		return dev_err_probe(dev, PTR_ERR(rstc), "Cannot deassert reset control\n");
 
+	rstc = devm_reset_control_get_optional_exclusive_deasserted(dev, "rst_s");
+	if (IS_ERR(rstc))
+		return dev_err_probe(dev, PTR_ERR(rstc), "Cannot deassert rst_s reset\n");
+
+	clk = devm_clk_get_optional_enabled(dev, "bus");
+	if (IS_ERR(clk))
+		return dev_err_probe(dev, PTR_ERR(clk), "Cannot get bus clock\n");
+
 	clk = devm_clk_get_enabled(dev, NULL);
 	if (IS_ERR(clk))
 		return dev_err_probe(dev, PTR_ERR(clk), "Cannot get clock\n");
@@ -520,6 +552,12 @@ static int rzg2l_gpt_probe(struct platform_device *pdev)
 	return 0;
 }
 
+static const struct rzg2l_gpt_info rzg3e_data = {
+	.calculate_prescale = rzg3e_gpt_calculate_prescale,
+	.gtcr_tpcs = RZG3E_GTCR_TPCS,
+	.prescale_mult = 1,
+};
+
 static const struct rzg2l_gpt_info rzg2l_data = {
 	.calculate_prescale = rzg2l_gpt_calculate_prescale,
 	.gtcr_tpcs = RZG2L_GTCR_TPCS,
@@ -527,6 +565,7 @@ static const struct rzg2l_gpt_info rzg2l_data = {
 };
 
 static const struct of_device_id rzg2l_gpt_of_table[] = {
+	{ .compatible = "renesas,r9a09g047-gpt", .data = &rzg3e_data },
 	{ .compatible = "renesas,rzg2l-gpt", .data = &rzg2l_data },
 	{ /* Sentinel */ }
 };

-- 
2.43.0

