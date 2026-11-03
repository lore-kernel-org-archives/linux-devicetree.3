Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.47
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793680691;
	b=tDULkCUIzQIgvwC8C3+L99zTFSgYny11jXhpzQDAPd1VhhiOoFnywDLHqrAggXSbc29O
	 /qf+jzjB/bgO3QqIVfA2+plvH/JfIFsp2yCz/3W1Z5ejW+gTN6xy1MmzrH81EnmCRLLae
	 l/qMCrvd61DP9Q4ETYEJKGMnQy/Rb09VezoIGrDQhs4P8MBKaRdnAzi+KSe/nLOGYdDzT
	 sYAZmmwlcykIHAIH6PPQq/uOFQsuesPHytKZAnqSf16vB9CvL++iEsTZwrHX7nYnJegVP
	 NbKh2Z4EBNdLzXFUhnyee7tThsLzuA6PKPu3fqTogI+S4PawSWKBIUm5ulEExtaRg4Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793680691;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=MIuVuN5S3A1ntm2yRRAwtrIs+TTbfraz8EmH2Z12duY=;
	b=J3YU0OlhC+OamNKtUX4+BveWifuPiv6fSWmBK1G5gHu/jn6xig2kEiDwjUFIruH8JPN7
	 mzI7YHa52JPBHkOAX5Wp7dS8gZxajESE5k0HPkClZDt/Vr/Un69t26mWoWEngDiZJWMXl
	 nZoP6f3kuOmXt3e3UV+r2Uy3JnvQt6bSbr2eKmDtllkYUouhsmFt3HHyvExoI5vKm6RwD
	 EXj5wL2pZ0s49P605IKALZpnnEuL2vPLOD9hO/mihY33Yt4AOXgy0d1Z/NbhRMtlnSkqi
	 IM80vK/qTJDyU/rXf1mH4OCHeX+EqyzpTbrmx5hKc/GWLj9+EWbhoUAspVEaT7/C2uQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=chromium.org;
	spf=pass smtp.mailfrom=chromium.org;
	dkim=pass header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b="m6KaD/VR";
	arc=none smtp.remote-ip=209.85.216.47
Received: from mail-pj1-f47.google.com (mail-pj1-f47.google.com [209.85.216.47])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B3BA5606A332
	for <devicetree@vger.kernel.org>; Tue,  3 Nov 2026 04:38:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B3BA5606A332
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=m6KaD/VR
Received: by mail-pj1-f47.google.com with SMTP id 98e67ed59e1d1-3ae1da332bcso1661030a91.2
        for <devicetree@vger.kernel.org>; Mon, 02 Nov 2026 20:38:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1793680690; x=1794285490; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=MIuVuN5S3A1ntm2yRRAwtrIs+TTbfraz8EmH2Z12duY=;
        b=m6KaD/VR1u/EiXpoMAUiBnXKyF9mMqN8ys9NKlBlxBXtj5TCevCyWx/nGum2E3muSU
         7A49V6moGBmBJ6IX5nEVF7u1AMj495jwdTWkvaW9uhqkcuwbcnqKeWbWjMk5CpaBaIHQ
         xhD2dHPWuaCTQXbj211R8vuCuC0mD14d2edXs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793680690; x=1794285490;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=MIuVuN5S3A1ntm2yRRAwtrIs+TTbfraz8EmH2Z12duY=;
        b=VKcBmWeLQ2njiRIGJifLDrt28u+3kC4zLyNyp3XcxbSbivqIBa7Q6twkZKGU3fwP3d
         hFoHkSVwno2g4dZ3qqNPmBmaIWSEuEQwqoccpIWmsm+lVLyOramph1/elyzXKNHZ0EoQ
         JNLMpjcY2koqqqKksqs3wJekxfpoPlyBFRI6Bzh934bEaRFCeAAW9CZOiWYamJudnAYm
         XsLugw3hTlnJ8cy5zYjyHHO+caROoSJkUTqtPtvpd5vDMaW0d2+fW6Q545M5TzMpAbbn
         81T/gSKZvv8LFLJTp4/nqSsoSDgxRCad2ntxb1msgmeYCxDJKgIj0H64iX9PZ7XZXjFi
         32TQ==
X-Forwarded-Encrypted: i=1; AKwUvBwnHjJNj/Q6wj18QCkMTiI1Fk6gJKh5xBBU+lL+LT/X+W61KA4kmIzOB2NnacZZOGvAzafDD5Pe+Qua@vger.kernel.org
X-Gm-Message-State: APuU4Z8vE0Gog/PG1kghsWYMGHO4XPJYDcQMOKfPJNMn5Kt8GkRI1RLY
	Nxaw0LqhZWGmREQ9L2LYvNPOjzAvlLHcpBMoz9ylg/xuxtjxZ6Bxer8QMJFm68LaDA==
X-Gm-Gg: AYBFou0J2uqRw21ITRTTAL8HXE9Nln8YlOSZpAUVEbbDtVtSvDzet+pN/ohQUJkhYF/
	tp5M8lKYbZqsbGK+Vz9JfOh/YcPWBJOYBPDWU3nA/slxiFYBryASMctPgaT6ed8HMhzwbWM9SQw
	RMdITpQ158EOvNa8dvHx5ODvtMFtetSax5D3WfYtD1CHKfA4rYjB1m+RujiHK3oc9xQGpb1YZ4u
	NYJ/JIgm4rehrRorXyzfvKldSJPy9anzkoHxobHl2FSSODRQOjLqBNHziHy2IVXVByaABWxASck
	I3U2SYiGV9/Yxz9LJKesw+y/qGKbSHWUxWTEWv50oXFPq51yRcMudSJeRZ3xL9X5D9gRZcV0ETe
	5eKbUQ85lhBXeuuapZtN5xXnNfOywoGev7kdDHbQoOEpj17YK3JGvF+aWzZoEW94lOtdxlgWUmh
	Rp5Jyju1ob9k0ILOkv1ORX46DMwndHwy0lzNvgpj7e2WzVlJSP5OZI6i8Zrtg4PKGcufz6AyF0M
	ywcj7OpT+sX71AQGetX8oWkivBdIr9Xe2/7SUBbCbVXWQ6HRZ0m055mJGaZvgXpufVgL0oCBZo6
	p56VRLeV6E5JnsFOLP262YYk4VVPcRXWL0q+fV9E4h3XkFIaak7EzgkgC68pTtw9AHVPDI7Ph6E
	IAzt49c3G/x32
X-Received: by 2002:a17:90a:5d17:b0:3ae:898e:a123 with SMTP id 98e67ed59e1d1-3ae898ea1b4mr7369616a91.14.1793680690189;
        Mon, 02 Nov 2026 20:38:10 -0800 (PST)
Received: from wenst-7875.tpe.corp.google.com ([2a00:79e0:203d:7:dea6:6326:4502:bb8b])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b07c71c253sm2072761a91.16.2026.11.02.20.38.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Nov 2026 20:38:09 -0800 (PST)
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
Subject: [PATCH v7 6/8] i2c: of-prober: Defer regulator_disable() on successful probe in simple helper
Date: Tue,  3 Nov 2026 12:37:30 +0800
Message-ID: <20261103043734.2179858-7-wenst@chromium.org>
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

When a I2C component is found, its device node is immediately enabled.
This triggers device creation and driver binding. The prober will hold
the regulator enable reference across this part. If the driver probes
synchronously, then it happens within this window. On the other hand,
if the driver probes asynchronously, there is a high chance that it
happens after the prober's cleanup function was called, in which case
the regulator would have been disabled when the driver's probe function
is called. This would then require the driver to wait 100 ms for the
hardware to reinitialize, even if the probe function was just a split
second late and the regulator was disabled a few milliseconds ago.

Recently, some of the drivers for the components that are targeted by the
I2C OF component prober gained the ability to skip waiting for hardware
initialization if the regulator was left enabled. This happens when the
PMIC has them on by default, or if the component prober left them on
after probing the component.

Tests on the Hana Chromebook showed that if the prober and trackpad
drivers are both builtin, then the time between the prober enabling the
device node and the trackpad driver asynchronously probing is between
5 ms and 30 ms, though sometimes there are outliers exceeding 100 ms.

Wait 100 ms before dropping the enable refcount on our end so that the
actual driver has the opportunity to catch and increase the refcount on
their end.

Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>
---
Changes since v6:
- Fixed typo in commit message
Changes since v5:
- Only defer regulator disable if a device was found
Changes since v3:
- Added commit message section showing average delay needed
---
 drivers/i2c/i2c-core-of-prober.c | 19 ++++++++++++++++---
 1 file changed, 16 insertions(+), 3 deletions(-)

diff --git a/drivers/i2c/i2c-core-of-prober.c b/drivers/i2c/i2c-core-of-prober.c
index 97ef58bb4c04..f52ab3f54933 100644
--- a/drivers/i2c/i2c-core-of-prober.c
+++ b/drivers/i2c/i2c-core-of-prober.c
@@ -238,11 +238,23 @@ static int i2c_of_probe_simple_enable_regulator(struct device *dev, struct i2c_o
 	return 0;
 }
 
-static void i2c_of_probe_simple_disable_regulator(struct device *dev, struct i2c_of_probe_simple_ctx *ctx)
+static void i2c_of_probe_simple_disable_regulator(struct device *dev,
+						  struct i2c_of_probe_simple_ctx *ctx,
+						  bool defer_disable)
 {
 	if (!ctx->supply)
 		return;
 
+	/*
+	 * Wait a bit of time for async drivers to probe and increase the
+	 * regulator enable count. This allows the drivers to check and
+	 * skip waiting for re-initialization.
+	 */
+	if (defer_disable) {
+		dev_dbg(dev, "Deferring regulator disable\n");
+		msleep(100);
+	}
+
 	dev_dbg(dev, "Disabling regulator supply \"%s\"\n", ctx->opts->supply_name);
 
 	regulator_disable(ctx->supply);
@@ -359,7 +371,7 @@ int i2c_of_probe_simple_enable(struct device *dev, struct device_node *bus_node,
 	return 0;
 
 out_disable_regulator:
-	i2c_of_probe_simple_disable_regulator(dev, ctx);
+	i2c_of_probe_simple_disable_regulator(dev, ctx, false);
 out_put_gpiod:
 	i2c_of_probe_simple_put_gpiod(ctx);
 out_put_supply:
@@ -405,7 +417,8 @@ void i2c_of_probe_simple_cleanup(struct device *dev, void *data, bool device_ena
 	i2c_of_probe_simple_disable_gpio(dev, ctx);
 	i2c_of_probe_simple_put_gpiod(ctx);
 
-	i2c_of_probe_simple_disable_regulator(dev, ctx);
+	/* defer regulator disable if another device driver could enable it in time */
+	i2c_of_probe_simple_disable_regulator(dev, ctx, device_enabled);
 	i2c_of_probe_simple_put_supply(ctx);
 }
 EXPORT_SYMBOL_NS_GPL(i2c_of_probe_simple_cleanup, "I2C_OF_PROBER");
-- 
2.56.0.385.gac671c819a-goog

