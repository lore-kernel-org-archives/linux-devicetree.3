Received: from mail-106112.protonmail.ch (mail-106112.protonmail.ch [79.135.106.112])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 34B52420472
	for <devicetree@vger.kernel.org>; Wed, 19 Aug 2026 08:16:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=79.135.106.112
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787127372; cv=none; b=JicL7NoCH1D9UsvP5GqeXdy64UqSJ9lg9kaS4Fnwf+6YcPDSfHaBu1w5k3kAUOEGgUhhkuz2S7tPp+w5PKkjzy5MIpmUZ3c0slR7dIekPA5j9R8T8Ij09GGqukpaCV5Yh7ylUCpHT61nYFlJcj2C5Jm0LKoF5X6OdeDZ9Z+NpT0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787127372; c=relaxed/simple;
	bh=nMLfdHo2+bmwQSymkxRA6MzUlYzZpGlSxhKENNElDTk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=j5XDeQXnalNKrzvoNauzPYMCjrDkrehA48xONgmsxEwMlHJ1dJYRUWlBtLGOTgYsXYtvCUImrL0jNdoHAasjDhT763r+THFZWEfnfS3BKaofpP4C3u2yivRloprqOwQuYlpz2VeJLyJJlKMA+vQVtc0qHFig+qgn88/A7ZcU9Aw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=geanix.com; spf=pass smtp.mailfrom=geanix.com; dkim=pass (2048-bit key) header.d=geanix.com header.i=@geanix.com header.b=WNPbD4TQ; arc=none smtp.client-ip=79.135.106.112
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=geanix.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=geanix.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=geanix.com header.i=@geanix.com header.b="WNPbD4TQ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=geanix.com;
	s=protonmail; t=1787127352; x=1787386552;
	bh=PUSA5IYkrvimmepbi76NuJ2FrwYXhIK9pgJ9RQpwu5U=;
	h=From:Date:Subject:Message-Id:References:In-Reply-To:To:Cc:From:To:
	 Cc:Date:Subject:Reply-To:Feedback-ID:Message-ID:BIMI-Selector;
	b=WNPbD4TQlfrEpqsKtsc4c0RHnvuPgla5oK1j1W79Bj34/mDotn69hY5dIJhg6Xp9w
	 rWR261+zVx/PUEN4UN4hJTwlYY+5QJop6vnbXMW6jOL3OSI1NUmqh3gT6wWGxoQPhB
	 jz7OVLYejGNNt59hYFC8m6gJOZp0C9DNUE6lEmW7pLcSsCtJo8Tr3dq3RiHMbHsWSx
	 VeJT6hEziOKmLcT08kHIycAww+GUOnVeGqQqtwgE3wQd5yfukqvZX7deyIrfwnlcCI
	 e7Z9OP1Vh7COEQI4CLIMrQJfJXvXZkNIwT5745hLk1i1yHq7eFFzai0BeMKuBvGgyE
	 1Wx6hk2faOr7w==
X-Pm-Submission-Id: 4hPzsg3vYfz2ScNq
From: Esben Haabendal <esben@geanix.com>
Date: Wed, 19 Aug 2026 10:15:31 +0200
Subject: [PATCH RESEND v5 4/6] iio: accel: mma8452: Support interrupt
 sharing
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260819-mma8452-open-drain-v5-4-d8aa590d7c36@geanix.com>
References: <20260819-mma8452-open-drain-v5-0-d8aa590d7c36@geanix.com>
In-Reply-To: <20260819-mma8452-open-drain-v5-0-d8aa590d7c36@geanix.com>
To: Jonathan Cameron <jic23@kernel.org>, 
 Lars-Peter Clausen <lars@metafoo.de>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Martin Kepplinger <martink@posteo.de>, 
 Sean Nyekjaer <sean@geanix.com>, David Lechner <dlechner@baylibre.com>, 
 =?utf-8?q?Nuno_S=C3=A1?= <nuno.sa@analog.com>, 
 Andy Shevchenko <andy@kernel.org>, 
 Martin Kepplinger <martin.kepplinger@theobroma-systems.com>
Cc: Esben Haabendal <esben@geanix.com>, linux-iio@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1787127340; l=3286;
 i=esben@geanix.com; s=20240523; h=from:subject:message-id;
 bh=nMLfdHo2+bmwQSymkxRA6MzUlYzZpGlSxhKENNElDTk=;
 b=KKn6sMAsnNZiFLPHHYvTf+Rt/E2Qeyj4TvNA7DYFcseOOUdj5Cr0tZOnl8v9t4P0Ur7b1i4FQ
 MAIH3uhEse4B8h+HChloHc6gewBFCLkHRYbeJobz0NlRGHsq0a2kCZZ
X-Developer-Key: i=esben@geanix.com; a=ed25519;
 pk=PbXoezm+CERhtgVeF/QAgXtEzSkDIahcWfC7RIXNdEk=

Adding handling of rutnime PM suspension in the interrupt handler allows
sharing interrupt with other devices.

Keep in mind that the device by default is using push-pull for the irq pin,
which might require additional hardware design to allow interrupt sharing.

The suspended flag is added together with synchronize_irq() in order to
protect against race conditions when doing runtime suspend and device
removal. This way we ensure that interrupt handler does not try to access
the device while regulators are disabled.

Signed-off-by: Esben Haabendal <esben@geanix.com>
---
 drivers/iio/accel/mma8452.c | 22 +++++++++++++++++++---
 1 file changed, 19 insertions(+), 3 deletions(-)

diff --git a/drivers/iio/accel/mma8452.c b/drivers/iio/accel/mma8452.c
index 1fb43c5b0b72..25bb2dd69381 100644
--- a/drivers/iio/accel/mma8452.c
+++ b/drivers/iio/accel/mma8452.c
@@ -119,6 +119,7 @@ struct mma8452_data {
 	int sleep_val;
 	u8 ctrl_reg1;
 	u8 data_cfg;
+	bool suspended;
 };
 
  /**
@@ -1056,14 +1057,19 @@ static irqreturn_t mma8452_interrupt(int irq, void *p)
 	struct iio_dev *indio_dev = p;
 	struct mma8452_data *data = iio_priv(indio_dev);
 	irqreturn_t ret = IRQ_NONE;
+	int pm_status;
 	int src;
 
+	pm_status = pm_runtime_get_if_active(&data->client->dev);
+	if (pm_status == 0 || READ_ONCE(data->suspended))
+		return IRQ_NONE; /* device is powered down or being removed */
+
 	src = i2c_smbus_read_byte_data(data->client, MMA8452_INT_SRC);
 	if (src < 0)
-		return IRQ_NONE;
+		goto out;
 
 	if (!(src & (data->chip_info->enabled_events | MMA8452_INT_DRDY)))
-		return IRQ_NONE;
+		goto out;
 
 	if (src & MMA8452_INT_DRDY) {
 		iio_trigger_poll_nested(indio_dev->trig);
@@ -1089,6 +1095,10 @@ static irqreturn_t mma8452_interrupt(int irq, void *p)
 		ret = IRQ_HANDLED;
 	}
 
+out:
+	if (pm_status > 0)
+		pm_runtime_put_autosuspend(&data->client->dev);
+
 	return ret;
 }
 
@@ -1690,7 +1700,7 @@ static int mma8452_probe(struct i2c_client *client)
 			dev_info(dev, "invalid irq type, setting default active low\n");
 			irq_flags = IRQF_TRIGGER_LOW;
 		}
-		irq_flags |= IRQF_ONESHOT;
+		irq_flags |= IRQF_ONESHOT | IRQF_SHARED;
 		ret = request_threaded_irq(client->irq, NULL, mma8452_interrupt,
 					   irq_flags, client->name, indio_dev);
 		if (ret)
@@ -1768,12 +1778,15 @@ static int mma8452_runtime_suspend(struct device *dev)
 
 	mutex_lock(&data->lock);
 	ret = mma8452_standby(data);
+	WRITE_ONCE(data->suspended, true);
 	mutex_unlock(&data->lock);
 	if (ret < 0) {
 		dev_err(&data->client->dev, "powering off device failed\n");
 		return -EAGAIN;
 	}
 
+	synchronize_irq(client->irq);
+
 	ret = regulator_disable(data->vddio_reg);
 	if (ret) {
 		dev_err(dev, "failed to disable VDDIO regulator\n");
@@ -1808,6 +1821,8 @@ static int mma8452_runtime_resume(struct device *dev)
 		return ret;
 	}
 
+	WRITE_ONCE(data->suspended, false);
+
 	ret = mma8452_active(data);
 	if (ret < 0)
 		goto runtime_resume_failed;
@@ -1822,6 +1837,7 @@ static int mma8452_runtime_resume(struct device *dev)
 	return 0;
 
 runtime_resume_failed:
+	WRITE_ONCE(data->suspended, true);
 	regulator_disable(data->vddio_reg);
 	regulator_disable(data->vdd_reg);
 

-- 
2.55.0

