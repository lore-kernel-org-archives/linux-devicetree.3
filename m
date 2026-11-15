Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.218.45
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794733126;
	b=AY+CLIe9GkE3IjdwIPReMjPyECH3bhhzwRp7mZJAfTyq18qLYgZGGiX85f6t3HXxXXWP
	 liXHkH6Rwih7iR+59Rzg5tEsyL22MbuyyB9muyGsf4RvryLyqPhkh2oamGJkge8vrCY6m
	 PpUpPLBR2CKohdRmqCdDtUKKudAQHzt9yLDoZhfBcXbILTfuiDIagaCJ4I6MNJ+UO+dKP
	 IO8smsIsGSWlXHkLM8h4V3aInHm3Xo1pv+yB0XAKkqXFZgNMonGvD5HXbuVwWScwE5Whg
	 7HFHMSYFUW0gIoj0FNqLji5BmvBGDo0UXClD462HL5qzwDmUXsBYAABYs/h1URcwf3A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794733126;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=Yu1iUE5tUZZVSrKcPtur6Bk4ggWxQJ9hvoe00qeVCog=;
	b=g5tZM41cExaayDTi90ir7tEpMDF3xHc0FV+frQKMKJD1Kv+CHl31/wXxsdPDL9Zrz9eM
	 VMpXbZ9zHX3uSoh92IkBMhCsbb+cpCICnVjLF47g/A8l08dew0kFuo2AgQ/su2UFAhMUj
	 kmhTzzXIcviK87OxH2gGic/n5ymLTO0sH3obltefgh7o1+S8ZT4tdCIJHKq4rkJUhZspw
	 sxSI/gwfSvQ6eccBWxELu1Kpw4FeIXo9p81K9UN+nTHMcbkyZmCi9DUGfRl0yrjN7u9nF
	 e5ketP3aXeb0oe0037/tiWdp9IlXtlHNABCtf9orc/P2WQqkN3V96V9UTkFJRd5N27Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=IyceJaFL;
	arc=none smtp.remote-ip=209.85.218.45
Received: from mail-ej1-f45.google.com (mail-ej1-f45.google.com [209.85.218.45])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 37CD7606A88A
	for <devicetree@vger.kernel.org>; Sun, 15 Nov 2026 08:58:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 37CD7606A88A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=IyceJaFL
Received: by mail-ej1-f45.google.com with SMTP id a640c23a62f3a-c50604721c8so430245866b.3
        for <devicetree@vger.kernel.org>; Sun, 15 Nov 2026 00:58:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794733125; x=1795337925; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Yu1iUE5tUZZVSrKcPtur6Bk4ggWxQJ9hvoe00qeVCog=;
        b=IyceJaFL1RD5Uj2cIYVkpqUJGYpAsQmAs62+dHkJSyi1OeJRjqJV5iWG8HiRIEvz6+
         v5bG7Tc3+GvJfr5w7o9rrzpV/rP+kCSDWiQLTz0uL/yh0n9UJ0cDcqT4+1mMHh6BH3TU
         tjBwUBiKEAkPZMNOXDM+/DrtE487igK2CgmXQ1by5XPLosztCslliB4+2MfTUt0TiVH+
         KDpQMayiU84XyR8THqFWcLn0ogiBtJoiX1HGHBFaOm5Dg4EnXHWYhCzhSiT59U1edPB2
         HKuVttmS3CGSoBUYcdz9icL5De7Rx8yMBwVwS0r2hvKsPk2y0d3E3HZHNXbZt9ZiVx7s
         H/CA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794733125; x=1795337925;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Yu1iUE5tUZZVSrKcPtur6Bk4ggWxQJ9hvoe00qeVCog=;
        b=Dxas5hqo27e+zleKrqjFh0V5kerZ+R7rDKxIt5cxz+y7Qv0ogq2G9IAXaP6Ha1cFAJ
         i0yr+wOfRVBWpR0kr+9GiQwPNSFozmgWR8Jx9qS6cy+u1o0OmaDrXttAe8tsjidslZEt
         qJR+kpfDnqGkHMIQO/u1C3OFPEgmGTdpZMfYcnGOlU+9F5oSjlaAw+SQM10xThJEqVIb
         aBwJbG31SftzwL6KL5TnsFhFX3Jxy+Sd49EpB7GyoH6Fl3kJxoBZFqSgOhXsgzTu47yk
         oW/AqHCL58ibqN6kZhVq2J+u56Ym2vtBfo8B7C7bnerVrDewTq2R+DdNtrC5QSqwjpy9
         GQlg==
X-Forwarded-Encrypted: i=1; AL+hErGaMGX1Dfl/XyeS3A6ighPoVvAP2FXy2g1TW6wv0FT1vISEsMhnWsT72VtA8SxF7YPX3ZwnNAzjlOBT@vger.kernel.org
X-Gm-Message-State: APuU4Z+HG/LpwjAbwRHWS9ZvDV3A+Fw4AMEfjHkgMtQwlreuncLDvFOV
	qu+uABVDyu2NX0tSv0aBqx5cREkn0rPFiAfkN1rDyvsl7bLfO7AChzum
X-Gm-Gg: AYBFou0iPeKbtXiFROdLSU6N/viYZypse5XHifCbEPsLW1TwMosl8nTcSy8pfcU5pmc
	5vyccyIigp9lCDt0OG7j4W+68brsXCRMjgp0zqt5ScAWBw5bT2G7YduZ1Gx2msFEhpVbVsZcfNi
	XlU8V28SDdkjOCm8fDZ/4CcFThOl7zVvBxTMhJB+o5LnEwpbvrswRKlw89C+UGNd3dhropZvqCw
	gp2EqRAAeSt5rKcW4IBbaO61Bq1wTMDctG7lW5xby/B72hXMQGRkA5BVhTvkgZavVWXAMAo5Qxn
	Is7I+idrqRUZi5mhIKncy/ssr2FF2FUAq1yFPevxpaJp67gmHeQIKbAv1QxRlBSNJyzAjRKJJpu
	DH3GEpqvTQCS3tAcPY5rVOvDZJH0X7Um+d9atAWks+9u8Y45LSKjuL0N+lW0une36IAbMauF7SD
	FgolNdM3ol0Sa5tCoJm6quRKE1DJz3eL8IZkDbAspKGkp7akF0BTR4vKocAQ8I2krDr5HXcL57p
	cHamV0EzhLdx3/FfBc3MqkhKrDnscS2TlxNsl/+lqmbwHAqKbXXHmx9uYt4cVhX8HY7ocRjTSJs
	b94JZ9hNWbVGRUfH7KuINjgeA5xjuG8LQYGzVYK7eIS4THcTxuiTiMs8NR9Ee3koWz6tsjCTSyn
	sxs0DLZaiKQ==
X-Received: by 2002:a17:907:5cb:b0:c50:95b7:d189 with SMTP id a640c23a62f3a-c5095dd72f4mr610171066b.0.1794733124625;
        Sun, 15 Nov 2026 00:58:44 -0800 (PST)
Received: from xeon ([188.163.112.62])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c5095a5c4b7sm287613266b.1.2026.11.15.00.58.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 15 Nov 2026 00:58:43 -0800 (PST)
From: Svyatoslav Ryhel <clamor95@gmail.com>
To: Lee Jones <lee@kernel.org>,
	Pavel Machek <pavel@kernel.org>,
	Griffin Kroah-Hartman <griffin@kroah.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Daniel Thompson <danielt@kernel.org>,
	Jingoo Han <jingoohan1@gmail.com>,
	Svyatoslav Ryhel <clamor95@gmail.com>
Cc: linux-leds@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	mfd@lists.linux.dev,
	dri-devel@lists.freedesktop.org
Subject: [PATCH v7 4/4] mfd: aat2870: Add support for VIN and IN-LDO power supplies
Date: Sun, 15 Nov 2026 10:58:25 +0200
Message-ID: <20261115085826.89641-5-clamor95@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261115085826.89641-1-clamor95@gmail.com>
References: <20261115085826.89641-1-clamor95@gmail.com>
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

The AAT2870 supports a dedicated main power supply input alongside parent
power supply for its internal regulators.

Add support for retrieving and managing these supply regulators
(vin-supply and in-ldo-supply) using the regulator framework to ensure
proper power supply dependencies and power-up sequencing.

Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
---
 drivers/mfd/aat2870-core.c            | 5 +++++
 drivers/regulator/aat2870-regulator.c | 1 +
 2 files changed, 6 insertions(+)

diff --git a/drivers/mfd/aat2870-core.c b/drivers/mfd/aat2870-core.c
index f5409dd91efb3..9017960ee73b1 100644
--- a/drivers/mfd/aat2870-core.c
+++ b/drivers/mfd/aat2870-core.c
@@ -14,6 +14,7 @@
 #include <linux/kernel.h>
 #include <linux/mfd/aat2870.h>
 #include <linux/of_platform.h>
+#include <linux/regulator/consumer.h>
 #include <linux/regulator/machine.h>
 #include <linux/slab.h>
 #include <linux/uaccess.h>
@@ -307,6 +308,10 @@ static int aat2870_i2c_probe(struct i2c_client *client)
 
 	aat2870->reg_cache = aat2870_regs;
 
+	ret = devm_regulator_get_enable(&client->dev, "vin");
+	if (ret)
+		return dev_err_probe(&client->dev, ret, "Failed to enable regulator\n");
+
 	aat2870->en_pin = devm_gpiod_get_optional(&client->dev, "enable",
 						  GPIOD_OUT_HIGH);
 	if (IS_ERR(aat2870->en_pin))
diff --git a/drivers/regulator/aat2870-regulator.c b/drivers/regulator/aat2870-regulator.c
index 73b6d06858cff..896f39e345379 100644
--- a/drivers/regulator/aat2870-regulator.c
+++ b/drivers/regulator/aat2870-regulator.c
@@ -105,6 +105,7 @@ static const unsigned int aat2870_ldo_voltages[] = {
 #define AAT2870_LDO(ids, match, vsel, vmask) {		\
 	.name = #ids,					\
 	.of_match = (match),				\
+	.supply_name = "in-ldo",			\
 	.id = AAT2870_ID_##ids,				\
 	.n_voltages = ARRAY_SIZE(aat2870_ldo_voltages),	\
 	.volt_table = aat2870_ldo_voltages,		\
-- 
2.53.0

