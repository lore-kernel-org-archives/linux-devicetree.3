Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=185.171.202.116
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793094003;
	b=AqByJAyk1K/347cNSMOU1Zwysb9zaUtikgRZZtTx6/faFIE65wLxWlx8XSZ94WN09bTN
	 BH1Mf15wTw1Co9Z1UD6bNREPh/APeKuXUhiWVHihWRWe6C//0+WJCunvJvmPxysVsAHNQ
	 JwqeeG0vNZfsUxp50jHqRNSKWw/OnlFp2CgUXa2qRyP1yzwYtphbISk5CuEsth8+auV2T
	 yWbSYnRQDvyzPpXz2GHjhE9mWuBpKEuHttlV2W13RyeVcBZCA/YD0Brs5iub68Zk/xSXx
	 CsqtZRUv6RdlA30ISQ3RLiOhWjVEYKWI5HC9VIaCTGt5koXUmsplK3BtmdpRKumRI+w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793094003;
	h=DMARC-Filter:Received:Received:Received:DKIM-Signature:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Last-TLS-Session-Version;
	bh=E3QBAxZHErsKnGrS7f2HqfF8NImuiViCsGhVZ6vh0S4=;
	b=U82pQKPBPhYQMEAzpdF1Qqr6PnqKUOqMmnc3DHyNfS9E0rXE++CupCOZyd8iGRljrHg1
	 Dklcc5TbvNZ7RSEPG9ckKy0mcDfDcnfSgtJkwkKKO3r7Aknwk3wOqbcI47WfksJEiEEw3
	 C3FmqQKmO6bo7iH/L59p/ph0IU1bQZn0s6SBERUDoLiOrl4wHqeHVZrSyu0+jZtcvPNFF
	 3iNsrfkjFCuyqMvksu0Ej6MBnPwPsan2ahxXLzMglUzNnX+pjtQV7B3idSuIpDTIqZLO2
	 S8ly1pJSuF7M6CGJIBikbFMtUV3nWOgmkZeZIRJxqhPlewjd7BLXVgoMAYznfsycEww==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=bootlin.com;
	spf=pass smtp.mailfrom=bootlin.com;
	dkim=pass header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=oBufQpGr;
	arc=none smtp.remote-ip=185.171.202.116
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6EF4E606A323
	for <devicetree@vger.kernel.org>; Tue, 27 Oct 2026 09:40:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6EF4E606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=oBufQpGr
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id 98301C79AAE;
	Tue, 27 Oct 2026 09:41:02 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 2C46C603BD;
	Tue, 27 Oct 2026 09:40:01 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 6C7A810329081;
	Tue, 27 Oct 2026 10:39:57 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1793094000; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=E3QBAxZHErsKnGrS7f2HqfF8NImuiViCsGhVZ6vh0S4=;
	b=oBufQpGrAquPTzV8qdi9e9DJIqePZK056biwm4caDec09OMag3eepGYbaJ99L8OzQUH+NS
	DPpdyQR+GsHsfacXS8iPvEd6NKWqa0l1XJWVD9nO8vVM5q//djpux4IUh4D8P8Ck1MO94/
	uiXs7d2ydRmEZZN0DRxVOKlMwswdQFu+RtfnBc7Qh1Ew5Q1Oc7GcHY717hke9+XNCwS4xa
	0r9MO+LTtqBlncXBhyQxvHScxcTkGCEFEw05vCapo9wWXAOBXITMsKg5B/V8jDRQaTTvT3
	WZCLqR7zF/wnY7WMKG1r3jzENHpnutxDrTKZ9R9kPXpadRgzkcVNC19BfqVNLw==
From: Paul Louvel <paul.louvel@bootlin.com>
Date: Tue, 27 Oct 2026 10:39:25 +0100
Subject: [PATCH v2 3/4] regulator: core: Call set_over_voltage_protection()
 if OVP limit is fixed after setting new voltage
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
Message-Id: <20261027-paul-lm51772-v2-3-b2a767e34722@bootlin.com>
References: <20261027-paul-lm51772-v2-0-b2a767e34722@bootlin.com>
In-Reply-To: <20261027-paul-lm51772-v2-0-b2a767e34722@bootlin.com>
To: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, 
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 Herve Codina <herve.codina@bootlin.com>, 
 Miquel Raynal <miquel.raynal@bootlin.com>, 
 Paul Louvel <paul.louvel@bootlin.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1793093986; l=2652;
 i=paul.louvel@bootlin.com; s=20260313; h=from:subject:message-id;
 bh=3rfpxIiAJcTwkIUG89FV5MR0WYbhlzK9nKpVxjveJmk=;
 b=wvx5D+BRDJwyjOlLxox9wiCM+IPlAmjnD5KpieLQaw8GXqF799v4UOsHRxtf/LNpFFUjJLps4
 gu7QEUPiEd7BZO1+JYr2lsDzamT3ZK1FnyqJmQu9Xda5ZEvIbzdJvzs
X-Developer-Key: i=paul.louvel@bootlin.com; a=ed25519;
 pk=eLW50NT18UAvUT5cAcYf88zNbBCZDLFXuptpyLVhVIU=
X-Last-TLS-Session-Version: TLSv1.3

The over-voltage protection limit is defined as a microvolt offset from
the voltage configured on the regulator, and the hardware is programmed
with this limit once, at regulator registration.

Some devices cannot be configured with an offset because their OVP
threshold is a fixed value. For such devices, the protection must be
reprogrammed every time the output voltage changes.

Introduce a new 'fixed_ovp' member in struct regulator_desc to tell the
core that the registered regulator is such a device. The
set_over_voltage_protection() callback is then called after the
slew-rate delay, so that the protection is never programmed before the
output voltage has settled.

Signed-off-by: Paul Louvel <paul.louvel@bootlin.com>
---
 drivers/regulator/core.c         | 10 ++++++++++
 include/linux/regulator/driver.h |  4 ++++
 2 files changed, 14 insertions(+)

diff --git a/drivers/regulator/core.c b/drivers/regulator/core.c
index 14422cfe80e2..b1cabe50ac25 100644
--- a/drivers/regulator/core.c
+++ b/drivers/regulator/core.c
@@ -4014,6 +4014,16 @@ static int _regulator_do_set_voltage(struct regulator_dev *rdev,
 				     (void *)data);
 	}
 
+	if (old_uV != best_val) {
+		if (rdev->desc->fixed_ovp && ops->set_over_voltage_protection) {
+			ret = handle_notify_limits(
+				rdev, ops->set_over_voltage_protection,
+				&rdev->constraints->over_voltage_limits);
+			if (ret == -EOPNOTSUPP)
+				ret = 0;
+		}
+	}
+
 out:
 	trace_regulator_set_voltage_complete(rdev_get_name(rdev), best_val);
 
diff --git a/include/linux/regulator/driver.h b/include/linux/regulator/driver.h
index 8a0f3aebdade..248fd8565abc 100644
--- a/include/linux/regulator/driver.h
+++ b/include/linux/regulator/driver.h
@@ -311,6 +311,9 @@ enum regulator_type {
  * @vsel_range_mask: Mask for register bitfield used for range selector
  * @range_applied_by_vsel: A flag to indicate that changes to vsel_range_reg
  *			   are only effective after vsel_reg is written
+ * @fixed_ovp: A flag to indicate that over voltage protection is set with
+ *		           hardcoded value, and need to be set each time
+ *		           when a new voltage is set.
  * @vsel_reg: Register for selector when using ``regulator_map_*_voltage_*``
  * @vsel_reg_oversize: Indicates that the vsel_reg spans on two registers
  * @vsel_mask: Mask for register bitfield used for selector
@@ -405,6 +408,7 @@ struct regulator_desc {
 	unsigned int vsel_range_reg;
 	unsigned int vsel_range_mask;
 	bool range_applied_by_vsel;
+	bool fixed_ovp;
 	unsigned int vsel_reg;
 	bool vsel_reg_oversize;
 	unsigned int vsel_mask;

-- 
2.56.0

