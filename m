Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.215.174
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793680687;
	b=BMHyfjdd6OKE3R1XDm9BCNz2CbfJMQKptRHjpEGD1J9J9w6aHTg8uatEqHn8R671M12Z
	 Ad/8EDV1jE8S7r6nIFV48gO3ES7vuPYpVcFTuqaI3uiwdOgvcH8iaSE6pxaQzxNmPseTs
	 xCxNt1wjzz97leM74QQ0Ia9VbgU3/P7TiRzuqJilX98SEAPMsOOgQqDNTV01vweb1afDx
	 nDjlpKRaBNUGdAZ6JE/dUONIynPrYjLPtx57UCROqQTsbuhKQlSUqmAKvAoE3y6jTJ8mC
	 r7aeZrtRf2fyucGoQkVAcO87egEuC3HGi8UsCYRDQ4tYFzOuRrtQDW0xAC0quh/q+Qw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793680687;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=h2GPV8kPMdAQMoqvFZFNAZKoDNH2JuPpdXamalsnIvU=;
	b=gYW5UBpJsRQmQnnZZXWhmy8NvylXeKkLyTjzoMl9nA/qhuT4hAAJhfdMnfsFhKfJiTLP
	 P2YSFyR/15Tkwmhxwrm1zLht9OeYa5BV/CR83ZNYP7i/VX6AUEeTNvotN7m5adT67S7Mb
	 4jfbL4OouEsYmx6zoYFlggpub/cPkaQymjFZ7G68sicoWViZ69Rs9g2pEF2lwJa3OnkUg
	 in6MMb1IKerYDqWP3YuLaoZ8JhOC0fMrRPY+/wRRH6bDsZs3vJ+SkEpkyCpWE4Di72pAQ
	 LZwH0432UU0DbJELDnemjImGN3RAhXmI4Bx4Dy2rgCO7KNPUHGhZr6szHkTOQjErMLQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=chromium.org;
	spf=pass smtp.mailfrom=chromium.org;
	dkim=pass header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=oLSMcA9W;
	arc=none smtp.remote-ip=209.85.215.174
Received: from mail-pg1-f174.google.com (mail-pg1-f174.google.com [209.85.215.174])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9717F606A326
	for <devicetree@vger.kernel.org>; Tue,  3 Nov 2026 04:38:06 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9717F606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=oLSMcA9W
Received: by mail-pg1-f174.google.com with SMTP id 41be03b00d2f7-cdac6d19ddaso1472927a12.2
        for <devicetree@vger.kernel.org>; Mon, 02 Nov 2026 20:38:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1793680686; x=1794285486; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=h2GPV8kPMdAQMoqvFZFNAZKoDNH2JuPpdXamalsnIvU=;
        b=oLSMcA9W3IOpt9klu3M+RevOG4/HcHBTfA0yEM6xVIUXFeUd6bjAZ0+mmKcxRr83st
         SPucrPPbzXLyOf4jyjpRoZhJXMkZhQecbEGnmbFAioBSHjVS9hgmo9kxu9B4BgQkHu6l
         3pzjjeCjka3g90UB83kNZSoT8293LPKvhbQcA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793680686; x=1794285486;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=h2GPV8kPMdAQMoqvFZFNAZKoDNH2JuPpdXamalsnIvU=;
        b=D7GpoyNBhNDhSYyHJ/AhL0X5DDEXKuryjyFU0nUV3jLRvssQbyAhvIxr8Nfz9b1DV9
         5+nqE7eeEfx9EAM1efDMPJbJWU7cpkP7fia4GviFdnH8edEcD5vjHL0aIjsmXlKLQAUR
         ThiUdSGHZ9Ztk8pcRjNFYk910BQlvqvpLgqng1Dtf97pI5lyOtTXRR8tevt/W4N6giXJ
         GV31dplaygwE8EGxIDPnixHxglkrgTBOGWSx9X9FdB+cMn+K7hxlNnmqUXrZQUiRjaqf
         mKkUhD9KJEDrecAZIly7+L7Wtq0QPUt/gEYL8RjuMqlJF54a1F0mDo9uja9nn1uTtYBk
         Sz/A==
X-Forwarded-Encrypted: i=1; AKwUvBxf71OdXZCbhVOzXWCpIpOhK3AinwgygJ0Gt8rCHSqmNYMtSLZZEd2y9yB0mA7p/k9+HOdhbC4DpWoi@vger.kernel.org
X-Gm-Message-State: APuU4Z84ccQtu9BBR52zU14cDqt6nik87jO5rSDRv34dLF94pm7YccCt
	OA8mu6a7vEZfR/fJkp5NoRlJj0R2gg1OWYspkh/XT2bgYQuStJLYo9oqFevJHTnuVA==
X-Gm-Gg: AYBFou2iwovmydWQFEO6aHto7VrFqqIssXn0wGkg9GszWuWiuNGNJ2FV8kiIx6+E4Xz
	JPqKyfRhHXIohOpNxcC6mhPo3ocCvH4ukM3IvH/GuCyq6+jdfomCjs9sfhazCDiHi2KWv3Ln1eX
	YLZ6VeoGLB0+TnsH/EKODu3RBQlEkISF50ZHJNVrrcirKLI8qSZ5X9lu+I+L8NyYH4ZaXr+vhjm
	HIzy19/IA7BlfVG9kq4S6Ge0JsVy34oDrSNYpmu+MHu6PCJmmXf1yvwW8ed2Q36XKZ7kd60cLQE
	X61Qd7kSPR8nuZwOhShXv9D58HXxG7j1MK1AOTnxKMY/p9d/cz45ff7rOyPkSFriUeUPQb6Eco/
	mshUlZguEKT8ki119toZsg4Q/Mqe1fbMqQ+suOTs0Nnpv134lGRAqeVc6ZQBSTxf0fLy41JBt8M
	pUKUsNYINt4OSsdXNTYjKsjWNsr6dlL4ZG0DNC5TEWi7LJGQWUmETxw9rwMr1Z06rxYYC8OqOoY
	23ZwYYk6jlMaXHODhUeyV/2/jP8B1kvMX9fQSTJD1fFSopvV0zKooqUpVd3MKdMpsyiylV4y1aN
	VKU3z/gWwEaAREx6CzzFjEeDnX4lWVUPcoWY51hhLfqnoOBIuwXMZ8S9rkBSLv3Fs+zgw/6HEvN
	msxHtPt/2BpBc
X-Received: by 2002:a17:90b:1b0f:b0:3ac:a5ff:2cc3 with SMTP id 98e67ed59e1d1-3ae8957d4f8mr10310774a91.8.1793680685963;
        Mon, 02 Nov 2026 20:38:05 -0800 (PST)
Received: from wenst-7875.tpe.corp.google.com ([2a00:79e0:203d:7:dea6:6326:4502:bb8b])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b07c71c253sm2072761a91.16.2026.11.02.20.38.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Nov 2026 20:38:05 -0800 (PST)
From: Chen-Yu Tsai <wenst@chromium.org>
To: Mark Brown <broonie@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	Jiri Kosina <jikos@kernel.org>,
	Andi Shyti <andi.shyti@kernel.org>
Cc: Chen-Yu Tsai <wenst@chromium.org>,
	Benson Leung <bleung@chromium.org>,
	Tzung-Bi Shih <tzungbi@kernel.org>,
	linux-mediatek@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	chrome-platform@lists.linux.dev,
	linux-input@vger.kernel.org,
	linux-i2c@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v7 5/8] i2c: of-prober: Let cleanup op know if a device was found
Date: Tue,  3 Nov 2026 12:37:29 +0800
Message-ID: <20261103043734.2179858-6-wenst@chromium.org>
X-Mailer: git-send-email 2.56.0.385.gac671c819a-goog
In-Reply-To: <20261103043734.2179858-1-wenst@chromium.org>
References: <20261103043734.2179858-1-wenst@chromium.org>
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

The prober's cleanup op may want to do things differently if a device
was found, such as wait for the actual device driver to pick up
resources.

Add a parameter to the cleanup op to pass this information in.

Also fix up an incorrect reference in i2c_of_probe_ops's kernel-doc.

Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>
---
Changes since v6:
- fixed typo in commit message and comments
- fixed missing parameter in cleanup op type declaration

Changes since v5:
- New patch
---
 drivers/i2c/i2c-core-of-prober.c | 8 ++++++--
 include/linux/i2c-of-prober.h    | 7 ++++---
 2 files changed, 10 insertions(+), 5 deletions(-)

diff --git a/drivers/i2c/i2c-core-of-prober.c b/drivers/i2c/i2c-core-of-prober.c
index f9f3c0ef93ff..97ef58bb4c04 100644
--- a/drivers/i2c/i2c-core-of-prober.c
+++ b/drivers/i2c/i2c-core-of-prober.c
@@ -130,6 +130,7 @@ int i2c_of_probe_component(struct device *dev, const struct i2c_of_probe_cfg *cf
 	const struct i2c_of_probe_ops *ops;
 	const char *type;
 	struct i2c_adapter *i2c;
+	bool device_found;
 	int ret;
 
 	ops = cfg->ops ?: &i2c_of_probe_dummy_ops;
@@ -159,6 +160,7 @@ int i2c_of_probe_component(struct device *dev, const struct i2c_of_probe_cfg *cf
 	if (ret)
 		goto out_put_i2c_adapter;
 
+	device_found = false;
 	for_each_child_of_node_with_prefix(i2c_node, node, type) {
 		union i2c_smbus_data data;
 		u32 addr;
@@ -171,12 +173,13 @@ int i2c_of_probe_component(struct device *dev, const struct i2c_of_probe_cfg *cf
 		/* Found a device that is responding */
 		if (ops->cleanup_early)
 			ops->cleanup_early(dev, ctx);
+		device_found = true;
 		ret = i2c_of_probe_enable_node(dev, node);
 		break;
 	}
 
 	if (ops->cleanup)
-		ops->cleanup(dev, ctx);
+		ops->cleanup(dev, ctx, device_found && !ret);
 out_put_i2c_adapter:
 	i2c_put_adapter(i2c);
 
@@ -388,12 +391,13 @@ EXPORT_SYMBOL_NS_GPL(i2c_of_probe_simple_cleanup_early, "I2C_OF_PROBER");
  * i2c_of_probe_simple_cleanup - Clean up and release resources for I2C OF prober simple helpers
  * @dev: Pointer to the &struct device of the caller, only used for dev_printk() messages
  * @data: Pointer to &struct i2c_of_probe_simple_ctx helper context.
+ * @device_enabled: True if a device was found and enabled.
  *
  * * If a GPIO line was found and not yet released, set its value to the opposite of that
  *   set in i2c_of_probe_simple_enable() and release it.
  * * If a regulator supply was found, disable that regulator and release it.
  */
-void i2c_of_probe_simple_cleanup(struct device *dev, void *data)
+void i2c_of_probe_simple_cleanup(struct device *dev, void *data, bool device_enabled)
 {
 	struct i2c_of_probe_simple_ctx *ctx = data;
 
diff --git a/include/linux/i2c-of-prober.h b/include/linux/i2c-of-prober.h
index bb6d47f50ee5..11f3a05ce881 100644
--- a/include/linux/i2c-of-prober.h
+++ b/include/linux/i2c-of-prober.h
@@ -45,7 +45,7 @@ struct i2c_of_probe_ops {
 	 *
 	 * Only called if a matching component is actually found. If none are found,
 	 * resources that would have been released in this callback should be released in
-	 * @free_resourcs_late instead.
+	 * @cleanup instead.
 	 */
 	void (*cleanup_early)(struct device *dev, void *data);
 
@@ -53,8 +53,9 @@ struct i2c_of_probe_ops {
 	 * @cleanup: Opposite of @enable to balance refcounts and free resources after probing.
 	 *
 	 * Should check if resources were already freed by @cleanup_early.
+	 * @device_enabled is true if a component was found and was enabled.
 	 */
-	void (*cleanup)(struct device *dev, void *data);
+	void (*cleanup)(struct device *dev, void *data, bool device_enabled);
 };
 
 /**
@@ -131,7 +132,7 @@ struct i2c_of_probe_simple_ctx {
 
 int i2c_of_probe_simple_enable(struct device *dev, struct device_node *bus_node, void *data);
 void i2c_of_probe_simple_cleanup_early(struct device *dev, void *data);
-void i2c_of_probe_simple_cleanup(struct device *dev, void *data);
+void i2c_of_probe_simple_cleanup(struct device *dev, void *data, bool device_enabled);
 
 extern struct i2c_of_probe_ops i2c_of_probe_simple_ops;
 
-- 
2.56.0.385.gac671c819a-goog

