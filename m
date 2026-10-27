Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.218.54
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793101617;
	b=VimFDxGcnB+PI92BmlKwrb1+w4vmOcqFkVfMvEe+7qIfRGmpdQjIwms9qidVVMXgyKB5
	 ZNXg6gTnksnCHVVRgeZs+jeAQN6q8ySzsBzGEjPZIQ8/Q5+rfGPbJwli0ZtrvovaF3MXG
	 CStnsuNJRR+QZdPEH5L3thWbKmTd+AMqnJfCTygvEvlpIVV2iYM3q9n3r+G1Jb/FQy+mo
	 IcdBpAACX2PYm1Q3J4v5NVA1kekcmSvYQYl1CFyORi+EOgSbwcwRtCH9a3vD6mi/JPLBk
	 dMwD9iG5ZJPYh9SD+Fj0nsvqwQCOfgOxWDKrM5lfOHOjnZ3ic3WavspbL7aa9LXwErA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793101617;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=aN3CXt/x9gfOlsvyXuijagfc4O1+FI+oPryE5Ah2IBY=;
	b=bZDZcAC1nnDFkKwhpbnQtw1046zjU/Jrn3hUys9WxNd4ihHKJaQ+Wrgp9o3kVMLmPm1O
	 v78KbzioGhqOR25SNrIUGgwvBCMtLUM6Ss+Y5mjqvsUpYT1JkCFL3eDTvIYSODULb276T
	 s5F/UEIsNpg7LQ0kaWZwofHw+3/yh75wHgVGLw+nEr9q1xnYauc44yHft+xd4eUloMCDP
	 TPzd8mToCKKVZFTr2CnsQ6ESgeswWVvVvG1sNKiENREY5lrFZ+2MA6q5JfgvyDpDt7HQh
	 788CmXC1hqESF9rkHlXwmc0Hn8Vs0860iC/rtW+mwx+cKsiRuxgTyNzZK2fXhfTbT7Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=iTiOXuc2;
	arc=none smtp.remote-ip=209.85.218.54
Received: from mail-ej1-f54.google.com (mail-ej1-f54.google.com [209.85.218.54])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 29944606A9CA
	for <devicetree@vger.kernel.org>; Tue, 27 Oct 2026 11:46:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 29944606A9CA
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=iTiOXuc2
Received: by mail-ej1-f54.google.com with SMTP id a640c23a62f3a-c3f8d72d7ceso628693466b.3
        for <devicetree@vger.kernel.org>; Tue, 27 Oct 2026 04:46:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1793101614; x=1793706414; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=aN3CXt/x9gfOlsvyXuijagfc4O1+FI+oPryE5Ah2IBY=;
        b=iTiOXuc2DIBefNMU0bxEfoJ6vuVhIeurBON/z2O3LIeiHc/CO58gw6iP68+ewY+yZW
         qYVyvZWHzV8vG10hb52qMTZHrNPEE1KFMtUL785qTPoLqKmntXsLmGAX2T03vGiS8WCP
         xVP+rgiBb/n5AlzOGLR1df7Z7cD8DaikbEZLWzWUtgKJYnzqTl3155Tn1p3iCYXmktUr
         ExpCdaWXzf2mDgvzy2PEQDsHHNZNDX1ANYfmAnS9C02OdhWEtpZHvU//l6bYlOF+uCj5
         Ax/8tCPVHL8561hYhpnDJXieFpzt/mYsQxVlmxCdfUmujQjgi0Q91fw8UMKR2G+wA/59
         fciA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793101614; x=1793706414;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=aN3CXt/x9gfOlsvyXuijagfc4O1+FI+oPryE5Ah2IBY=;
        b=lxpAjHcM/iwhIhLMH07yQ2/Cix6iV902vR9lxjc9+6Z6tOF4qVNjM3C9yiw6QPgSXD
         B3jVFTXOSVMrSgltVcoH3tb4L832ik5Vi6V07LVmnEdECNHKE+y2ceZr76jU7tA8hzeT
         IgHYB8nHpRtzXKV58RjMeBP9HR2dIgYwXNkDrKRgl9FO+WffcTddve/Uok+sa+awMEAp
         dHzaBhxrwJohg9wWV3pHh5DNFjvrjRmMFbXq+lbTBtaMjYS1zngoq95nHNzHFMEWdGo4
         l6dTLgR5eDv/69zSrikCE6JcVCZzYBc1mFZP/g3Mkm9nsY2T6JNJ6LVArhHxw+QJ8j4T
         LYjA==
X-Forwarded-Encrypted: i=1; AKwUvBzKPLrF58j9ltTYmV+nObIOvNyz2lpQIeK6DN5LeQDhHIt5iCsQW92+ba3h/qSAVshTXHMloebB2d9C@vger.kernel.org
X-Gm-Message-State: AFq9FYLffZnSORgfKGKYFd6GTkCYsHbV0mq7IUf5i2avSzwiz25zk2Wd
	xTOOl4lnlNkq5TbZM16kzVxsyLKaw6gGTwOi5hsXvxyE7/TK95T6JsGE
X-Gm-Gg: AYBFou1FmzUFi5VTKvUMfxHD4Fncrl+/Oe7Q/V+8XXEvx85Syz/Qg5KZ9gPLVgLp9lD
	z8lESIucQZNsulbml2ux3HJV+oQNS80+LHiglFGqcPfSOPWWlmuAt7LUhD73WXFp0mJi64PsSis
	SMXHYuR9X4Oj3pB9lcukK2pgJfPYyxQvKK5nJmguss1JfYEFjv1LNyjjtQ705og5AI+aWiA5k4x
	9jendlyqF2HKc0H5ifN6z11O3coHhLHBQ0XsDU6exVirZaLN2nWpqBIGvSMpZ0I7Ro2y/9wjnUK
	W2RnYgNjCFYGjBCTqB6bDFq+o665PH+Un1BQCFWRHTvCygdgfgIVMD08MgL6owbuoZwE40+ikbn
	7PJHTu/wgiFxV0zCc1HTJKf2/TPEEf5qbZddjN07x4Aj6MyAuPLShNeQjqHIkxImn37brRFj0b+
	E6JRtSFbGMTRFGbAKLZQnk97pn14/SjU6so2rVi9PMHdw4bWGevQh876/u5iL4cdsWZx0fNaqiL
	vY+H/FZO6W2HehusrkLysPxbvEuf1hnDGGC8HDEcUni4NwmwirsLAhzaHTGZdb1GfvVOUjKX84l
X-Received: by 2002:a17:907:9624:b0:c46:a5bb:5740 with SMTP id a640c23a62f3a-c46bdacd582mr1075309766b.5.1793101614258;
        Tue, 27 Oct 2026 04:46:54 -0700 (PDT)
Received: from xeon ([188.163.112.62])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c46bd529b3csm430692866b.37.2026.10.27.04.46.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Oct 2026 04:46:53 -0700 (PDT)
From: Svyatoslav Ryhel <clamor95@gmail.com>
To: Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Lee Jones <lee@kernel.org>,
	Svyatoslav Ryhel <clamor95@gmail.com>
Cc: linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	mfd@lists.linux.dev
Subject: [PATCH v4 4/4] mfd: max8907: Convert to use device managed poweroff handler
Date: Tue, 27 Oct 2026 13:46:34 +0200
Message-ID: <20261027114634.79706-5-clamor95@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261027114634.79706-1-clamor95@gmail.com>
References: <20261027114634.79706-1-clamor95@gmail.com>
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

Replace the legacy global 'pm_power_off' function pointer assignment with
the devm_register_power_off_handler() helper.

Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
---
 drivers/mfd/max8907.c | 24 +++++++++++++++---------
 1 file changed, 15 insertions(+), 9 deletions(-)

diff --git a/drivers/mfd/max8907.c b/drivers/mfd/max8907.c
index 2a38e00a10c3b..e282dd82ece69 100644
--- a/drivers/mfd/max8907.c
+++ b/drivers/mfd/max8907.c
@@ -15,6 +15,7 @@
 #include <linux/mfd/max8907.h>
 #include <linux/module.h>
 #include <linux/of.h>
+#include <linux/reboot.h>
 #include <linux/regmap.h>
 #include <linux/slab.h>
 
@@ -173,11 +174,17 @@ static const struct regmap_irq_chip max8907_rtc_irq_chip = {
 	.num_irqs = ARRAY_SIZE(max8907_rtc_irqs),
 };
 
-static struct max8907 *max8907_pm_off;
-static void max8907_power_off(void)
+static int max8907_power_off(struct sys_off_data *data)
 {
-	regmap_update_bits(max8907_pm_off->regmap_gen, MAX8907_REG_RESET_CNFG,
-			MAX8907_MASK_POWER_OFF, MAX8907_MASK_POWER_OFF);
+	struct max8907 *max8907 = data->cb_data;
+	int ret;
+
+	ret = regmap_update_bits(max8907->regmap_gen, MAX8907_REG_RESET_CNFG,
+				 MAX8907_MASK_POWER_OFF, MAX8907_MASK_POWER_OFF);
+	if (ret)
+		dev_err(max8907->dev, "failed to power off the device!\n");
+
+	return NOTIFY_DONE;
 }
 
 static int max8907_i2c_probe(struct i2c_client *i2c)
@@ -185,8 +192,6 @@ static int max8907_i2c_probe(struct i2c_client *i2c)
 	struct device *dev = &i2c->dev;
 	struct max8907 *max8907;
 	int ret;
-	bool pm_off = of_property_read_bool(dev->of_node,
-					"maxim,system-power-controller");
 
 	max8907 = devm_kzalloc(dev, sizeof(*max8907), GFP_KERNEL);
 	if (!max8907)
@@ -237,9 +242,10 @@ static int max8907_i2c_probe(struct i2c_client *i2c)
 	if (ret)
 		return dev_err_probe(dev, ret, "Failed to add MFD devices\n");
 
-	if (pm_off && !pm_power_off) {
-		max8907_pm_off = max8907;
-		pm_power_off = max8907_power_off;
+	if (of_device_is_system_power_controller(dev->of_node)) {
+		ret = devm_register_power_off_handler(dev, max8907_power_off, max8907);
+		if (ret)
+			return dev_err_probe(dev, ret, "failed to register power-off handler\n");
 	}
 
 	return 0;
-- 
2.53.0

