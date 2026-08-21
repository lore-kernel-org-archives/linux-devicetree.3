Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 678354D8D80
	for <devicetree@vger.kernel.org>; Fri, 21 Aug 2026 16:16:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787329019; cv=none; b=IUtDZEC8PseqaGrvUs4uL9hZ4OAzFqVzfBz+XBpzVbBK3iLNfa8R+qqExYfdIXB55xEQq/GeLN1rDtfHITM9EM/Ievdkaaavl/+P7fN2IIunP1oR/geyjHl6xvUzlwm4GFPVhOJ9rX4OUyCji78Eq1655dvE07gJWvI5Bnh6zJs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787329019; c=relaxed/simple;
	bh=9e0v/qAvMLuCDj8b/dk5D37lly7cVklfqGCzOodeUxg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=l/P/JBBbXsTlHXy7RVfcKTI+MjK4BQ+lELhMWARKqtnwsKWp3KtZmhyCIrxDpFA3xb3cVRinYlBqIhc0vOrrJDAR3uhjbNUAWabRTtQ8scSdhMckhcnnfF5yKhxkkC1ixmKSsf7shDe2qdZJzl8ld5HUqHHKFxvBw1epnAwqlU8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=flipper.net; spf=pass smtp.mailfrom=flipper.net; dkim=pass (2048-bit key) header.d=flipper.net header.i=@flipper.net header.b=eqCnFwT7; arc=none smtp.client-ip=209.85.128.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=flipper.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flipper.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=flipper.net header.i=@flipper.net header.b="eqCnFwT7"
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-496bb7cdf51so11199445e9.2
        for <devicetree@vger.kernel.org>; Fri, 21 Aug 2026 09:16:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=flipper.net; s=google; t=1787329016; x=1787933816; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=4vNa8/pFwons02qqZoxti7YnDUxSaegLDxkgxCs0WgE=;
        b=eqCnFwT7DZzJo/i56OqYEUN7wrmziUUeMavOCZR4oEnfyxtCmDvlKXoTGSGeFjY98T
         zmwLLk+HIExXLwAEqVhukDZcqbeUafQr+zC3cShyQJiS+3P4mJ+ijprMdsf7AdIhorO1
         JIPjKNf7tIth9TJ2XDshplS/WkW+ZCDfWn4eEkfhxQVmAQpLh4n6+PnNBPV/1u5X4nQa
         D69Yoe6Qbit9DNnTvgmD6FhmQr/s4P2pJRJBg/J7k6Nke2RmRoMIS+FGNR45JxhO617t
         4qR2qK2IuzPmIVAo6Wcmue2ep5h/tLE+yWkFcC17Dt8efq8z4EvmeDyUdEcGaiawjgO3
         vsig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787329016; x=1787933816;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=4vNa8/pFwons02qqZoxti7YnDUxSaegLDxkgxCs0WgE=;
        b=R1OHpSb6Uri1ZUkYhg6Nf1Tgh3G2DlQyv2Nv84/5ZxKnUWwka5ZMAYDB0m2V9YPpts
         dLytW/c5jXtRodN2mrOUpfHVpYbaQBUUsRaJ8akGoP7nTk4S8/k+ad8kQQ97uqIAII1c
         t5CLTN8RfZXcBhz00X54NaNhItLfbIfwrqCv6dXQKsXX+jbjFzyK2ipYmnzhM8pKirlS
         QD3qNjTTKo08TeGwKiSvHvBNcupiVwTJZBLsoM1j+B23ZtofT1yArtaTNJib4DdVwOUJ
         /e0x5wBLnL7QMk1Pzoey4rysmCbuYippJyGBHl3+htFQzKdWYkXMH6CjVg4LObtD11IV
         kmYw==
X-Forwarded-Encrypted: i=1; AHgh+Rr15nWirQX0OU/TkVaI4F61B+J37Xhw69B5qochDRzX3H1t+LpE9mCqnZKRSvktF5Llv42FOv9xDM9d@vger.kernel.org
X-Gm-Message-State: AOJu0Yy/QfOYhF+gUh/4BZR7+umXAnqFQ9GgEC2rVn0LdG9xVvOw1u13
	rrb34vxjfYKhsfJsZ+x5r5RC+bwZhHCa72sc9/qJ/NeUSTY6l/6gFRWeynXydKOt4sU=
X-Gm-Gg: AR+sD10PbOU8hWhQa+52/Mn2wqkc0WC4gpkGOibqL22MoeXkoXAxAG2dqvjLDHT+KOn
	BlVXOYxg65vKR84nQGI1H+ZbwybIjFE1fYAabfoDcP5YyMKbBD4xb6WPV8jk4f6nM5/JILdFf4Z
	70NGpdqfWOVvnBizJqK0F6Ww7DEYcANO0/IpPi8jeodjCAxGX3FpwxC/YNK8xbdtnfpW5q8GPyL
	r1cMHo91/Bftxdwdn1HGsS168h7yGYBLcsQATnDAF6UTKEQ+AE/Fpw1ImGNyenRpc/3Tj0ucoss
	fojvaXABg1bEj2y5gJ31Rh4X8TNY/k57RYAyf/mHCjE/RZG9UobgknT0Q9am5znltpK/sCv4wxZ
	pIfAdy6W8uxtJ188h0W8eWfEWye4hALEZvZvAEbkG4DOQBkW/25ELEOaJh11Yxl1M0hiKVr+ZsH
	OksdXplRQO8QDzOIZAR+NCiYcJjxOyVQnM3nRyUxQJJ+81JU3/0T5raRWlZkhaOOfOjrxWTSObA
	/csjZCJDXWaRJK8AJvQOMpylYmhJYsyOB7cRnLsk+wyjHEU5yAASw==
X-Received: by 2002:a05:600c:e549:20b0:499:b65e:49c9 with SMTP id 5b1f17b1804b1-499b8343decmr91734895e9.10.1787329015693;
        Fri, 21 Aug 2026 09:16:55 -0700 (PDT)
Received: from alchark-surface.localdomain (bba-86-98-192-94.alshamil.net.ae. [86.98.192.94])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-499bd581a49sm10245235e9.1.2026.08.21.09.16.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 21 Aug 2026 09:16:55 -0700 (PDT)
From: Alexey Charkov <alchark@flipper.net>
Date: Fri, 21 Aug 2026 20:16:35 +0400
Subject: [PATCH 2/2] usb: typec: hd3ss3220: Add support for supply
 regulators
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260821-hd3ss3220-regulators-v1-2-405e5c4fb306@flipper.net>
References: <20260821-hd3ss3220-regulators-v1-0-405e5c4fb306@flipper.net>
In-Reply-To: <20260821-hd3ss3220-regulators-v1-0-405e5c4fb306@flipper.net>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Biju Das <biju.das.jz@bp.renesas.com>, 
 Heikki Krogerus <heikki.krogerus@linux.intel.com>
Cc: linux-usb@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Alexey Charkov <alchark@flipper.net>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2415; i=alchark@flipper.net;
 h=from:subject:message-id; bh=9e0v/qAvMLuCDj8b/dk5D37lly7cVklfqGCzOodeUxg=;
 b=owGbwMvMwCW2adGNfoHIK0sZT6slMWR1VL4uX+nFxbnzVYiVpUhSu4m40qnT/SeuzxVeXfd2f
 WN5nGRZx0QWBjEuBksxRZa535bYTjXim7XLw+MrzBxWJpAh0iINDEDAwsCXm5hXaqRjpGeqbahn
 aKRjrGPEwMUpAFO9cSrDX9mLB/VbF6TY9l2YpjBzTcEG9wLDTatVP3VM+XbZ7ItXzmyGP1yuczg
 CG54mX5Ba/6f3nn5gktRbiyX/2j+xqj/SZDnuwg4A
X-Developer-Key: i=alchark@flipper.net; a=openpgp;
 fpr=9DF6A43D95320E9ABA4848F5B2A2D88F1059D4A5

HD3SS3220 requires VDD5 input to be present 2ms before VCC33 is applied,
or else it gets backpowered via the 3.3V rail in a non-functional state
and wedges the I2C bus, bringing down all devices on it.

Enable both regulators in the datasheet prescribed sequence if provided.

Signed-off-by: Alexey Charkov <alchark@flipper.net>
---
 drivers/usb/typec/hd3ss3220.c | 32 ++++++++++++++++++++++++++++++++
 1 file changed, 32 insertions(+)

diff --git a/drivers/usb/typec/hd3ss3220.c b/drivers/usb/typec/hd3ss3220.c
index d0de5a2488f9..b53455abc048 100644
--- a/drivers/usb/typec/hd3ss3220.c
+++ b/drivers/usb/typec/hd3ss3220.c
@@ -49,6 +49,9 @@
 #define HD3SS3220_REG_GEN_CTRL_MODE_SELECT_UFP		BIT(4)
 #define HD3SS3220_REG_GEN_CTRL_MODE_SELECT_DRP		(BIT(5) | BIT(4))
 
+/* Minimum time VDD5 has to be stable before VCC33 starts ramping up */
+#define HD3SS3220_TVDD5V_PG_US				2000
+
 struct hd3ss3220 {
 	struct device *dev;
 	struct regmap *regmap;
@@ -358,6 +361,31 @@ static irqreturn_t hd3ss3220_id_isr(int irq, void *dev_id)
 	return IRQ_HANDLED;
 }
 
+/*
+ * Bring both supplies up in the order the datasheet asks for. Powering VCC33
+ * first can back-power the device in a non-functioning state, which grounds
+ * the I2C bus and takes both this device and any others on the same bus down
+ */
+static int hd3ss3220_power_up(struct device *dev)
+{
+	int ret;
+
+	ret = devm_regulator_get_enable(dev, "vdd5");
+	if (ret)
+		return dev_err_probe(dev, ret, "failed to enable VDD5\n");
+
+	/* Nothing to stagger against unless the board describes both rails */
+	if (device_property_present(dev, "vdd5-supply") &&
+	    device_property_present(dev, "vcc33-supply"))
+		fsleep(HD3SS3220_TVDD5V_PG_US);
+
+	ret = devm_regulator_get_enable(dev, "vcc33");
+	if (ret)
+		return dev_err_probe(dev, ret, "failed to enable VCC33\n");
+
+	return 0;
+}
+
 static int hd3ss3220_probe(struct i2c_client *client)
 {
 	struct typec_capability typec_cap = { };
@@ -379,6 +407,10 @@ static int hd3ss3220_probe(struct i2c_client *client)
 	if (IS_ERR(hd3ss3220->regmap))
 		return PTR_ERR(hd3ss3220->regmap);
 
+	ret = hd3ss3220_power_up(hd3ss3220->dev);
+	if (ret)
+		return ret;
+
 	/* For backward compatibility check the connector child node first */
 	connector = device_get_named_child_node(hd3ss3220->dev, "connector");
 	if (connector) {

-- 
2.54.0

