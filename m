Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 82112503BCB
	for <devicetree@vger.kernel.org>; Mon,  7 Sep 2026 15:23:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788794596; cv=none; b=L7f+K4jhIKTA83n5Ts5uKZtntb92mxgShcuoR5nywud4q+6HgICEeiOqVEH/RdXQD3oWwEiHqTGjS9pWiB2WFbRk8v4FUVbWaZY/C50Z1PesWwnPZ9JuM8VgaHvib/JJyZrqGX5iyAd8SD+fuShg98Xa+OomwSs9gFrZC92uFLI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788794596; c=relaxed/simple;
	bh=dq6QOnsULa1GJAx3h1sZHwK3pgAlPPHl5DxoXUXImkg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=LyDkUkDfvIc72l7Z7m73VC5z/dXYlL3nZi6A2rJ5i+X+EXyCI+L1FB3seDVd7guqK3Ix1wmcpXO4s+5ZdpZBczVNTtEjwLYqEa/ty5qBclN8ocqgyPF8PcUg/2JTBJGmbH7AAtvGDuB1ZseYjQxJDTXw0NgLCactYb75xP9sLOQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Bw+//27Y; arc=none smtp.client-ip=209.85.221.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Bw+//27Y"
Received: by mail-wr1-f41.google.com with SMTP id ffacd0b85a97d-48441a2ba1bso2645492f8f.1
        for <devicetree@vger.kernel.org>; Mon, 07 Sep 2026 08:23:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788794592; x=1789399392; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=HuBDL/aaH1UR1BM5pkVKYW965YZzYu0aSLt8mFhBVfw=;
        b=Bw+//27Y15r/tZ1YTFGV7ja5GQsBZAlE2n239M4eREPHsYH9HILVZvTu4Z7zCpKhf2
         D9Rl4Ji+GukU1S7lJ5idgPNY4nViO4/iEN3lBqv9JWRGJ+vpdwtaEBxinaauIlFAYosK
         c/6l2yLhzszddafnaNKtT4hQ/gn42DsGA818uBizud5abyzmoDPLtIbyOvqCJqh1tP3+
         P1RaOZNkNtaUFn6WzZmHXAD288Yx1B2J1A6nO+kCasvc5qyCUw3U82l7ds8qNoIw8BdM
         Sc2c+j6uXi0R7MjKRzZb3YDOpWG85BYQCdZk9pRnxM52nCFVp1N2xava/MSxLUekPWrA
         WXIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788794593; x=1789399393;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=HuBDL/aaH1UR1BM5pkVKYW965YZzYu0aSLt8mFhBVfw=;
        b=iCuEQk5FTWav2nh/oBw0NCI4sktfAbdjUmK5PXvWdDqU62na4Mu5fCeVdQB60hrKsj
         hKCUDx5aAnx+n9hXt2vA8g1K5qfZlbx3vQzviRfxS3v0hPkJYxO+NiLVb3QJKnewE+Jd
         bbfduSLhCsPHq8TK5BtcTPhbKqAeJwMZuF+7aXEvivW1v7lKdI35OhxJEQu2j3GUwqk4
         QiJk4AOV8ZpN9g5nugVnVt7FFAHA+i7xKBRY6+BDAPj7f9zFA7o5zPOrsCCFHNZrVz62
         bLqD8S1XbvlFLCfj7P7L8UEInvKyhKNJwOHQ/pcprnQaw0eyyNE8huJG0re2TYBQxmM+
         +Rnw==
X-Forwarded-Encrypted: i=1; AKwUvBwc8B4JDt31UTxloHsW36N3IvkK5yxIRKS1UzA61xrKk4T3LhTKlXTmI+hQWbUnI2MKmJC2BaPzqj/3@vger.kernel.org
X-Gm-Message-State: AFuF++m56p3a9TPmwmzagX96jQaeOiqLCAe/A7zSVM/Eq69hOl2Qh45a
	K2j7nnaHTj0wYpTECwWHtZ4karblFHCmYTrOFZNy4sSd6gAKjdpaGS5c
X-Gm-Gg: AYBFou0RX3k/K1p9jEQf52LFTUhhQRHns66GLgYDHdgPuBCNsKAY1CqNGxZ9CQXGaHD
	cp/ctClMv2fr+Lmyydd02KETUDUUpnqJyCnfEbyNv2ILaUJ65regvKSAAt5J/bgA68474ZBI2i2
	cogfk4yKK+FOJF1lWkUKcSLMNKIAir3VUmacbr/f/nWstYSCC2YtsOiOilQ5oBdmwQr2PKgOzgq
	mN8U6uqhzdXlbKuUrX1bTD3x3Uqp2Iu4lENLI+PZ2ag5WaGzxD7VurFWEtw+3/sFy9vh6JskNaY
	kXKoPaILwtEMHlGaYkT6BGTQSy4nkMLG/HdERWIGa+l80B5kG4rgvU+gaG6lfZ+qtUQncX9Jr9P
	HuEJ80QfS308Vz1WlPYAmgmhid8PoU9cvkiq+RZfyeX5CGCdIfMc+DoRgoIrau6U/BTECSM8JFl
	K0cYOzNlLIiJL9Qn5K4bm9TzMpMF6v3htkhczU9UUS5osFScKKhRUM42ZgPIm1mzpnIWO/IdffS
	B2qKhAbe4G1AlWdV4k4yWKqaH/blu5IBUsY98HG746xIuH25Vr3
X-Received: by 2002:a05:600c:8b25:b0:49c:fc6e:a3da with SMTP id 5b1f17b1804b1-49cfc6ea704mr211565355e9.25.1788794592561;
        Mon, 07 Sep 2026 08:23:12 -0700 (PDT)
Received: from flaviu-Aspire-E5-572G.. ([93.122.248.115])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49cee5f912esm413785375e9.4.2026.09.07.08.23.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Sep 2026 08:23:12 -0700 (PDT)
From: Flaviu Nistor <flaviu.nistor@gmail.com>
To: Jonathan Cameron <jic23@kernel.org>,
	David Lechner <dlechner@baylibre.com>,
	Nuno Sa <nuno.sa@analog.com>,
	Andy Shevchenko <andy@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Daniel Baluta <daniel.baluta@nxp.com>,
	Antoniu Miclaus <antoniu.miclaus@analog.com>
Cc: Flaviu Nistor <flaviu.nistor@gmail.com>,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-iio@vger.kernel.org
Subject: [PATCH v3 2/2] iio: adc: ti-ads1015: Add support for label
Date: Mon,  7 Sep 2026 18:23:04 +0300
Message-ID: <20260907152304.4992-2-flaviu.nistor@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260907152304.4992-1-flaviu.nistor@gmail.com>
References: <20260907152304.4992-1-flaviu.nistor@gmail.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add support for label sysfs attribute similar to other adc devices. This is
particularly useful because the label can match the schematic signal name,
identifying channel voltages easier if label is defined via device tree.

Signed-off-by: Flaviu Nistor <flaviu.nistor@gmail.com>
---
Changes in v3:
- Return datasheet_name of the channel in user space if label is not present in dts. 
- Link to v2: https://lore.kernel.org/all/20260902172230.5234-2-flaviu.nistor@gmail.com/
Changes in v2:
- Implement changes suggested by Andy Shevchenko. 
- Link to v1: https://lore.kernel.org/all/20260901184302.8127-2-flaviu.nistor@gmail.com/

 drivers/iio/adc/ti-ads1015.c | 30 ++++++++++++++++++++++++++++++
 1 file changed, 30 insertions(+)

diff --git a/drivers/iio/adc/ti-ads1015.c b/drivers/iio/adc/ti-ads1015.c
index 0fbfa4e499aa..7ad03fa2253d 100644
--- a/drivers/iio/adc/ti-ads1015.c
+++ b/drivers/iio/adc/ti-ads1015.c
@@ -233,6 +233,7 @@ static const struct iio_event_spec ads1015_events[] = {
 struct ads1015_channel_data {
 	unsigned int pga;
 	unsigned int data_rate;
+	const char *label;
 };
 
 struct ads1015_thresh_data {
@@ -586,6 +587,22 @@ static int ads1015_read_raw(struct iio_dev *indio_dev,
 	}
 }
 
+static int ads1015_read_label(struct iio_dev *indio_dev,
+			      struct iio_chan_spec const *chan, char *label)
+{
+	struct ads1015_data *data = iio_priv(indio_dev);
+	const char *name = data->channel_data[chan->address].label;
+
+	/*
+	 * Avoid printing "(null)" in the console in case label property
+	 * is missing for the channel, or channel is not defined.
+	 */
+	if (!name)
+		name = chan->datasheet_name;
+
+	return sysfs_emit(label, "%s\n", name);
+}
+
 static int ads1015_write_raw(struct iio_dev *indio_dev,
 			     struct iio_chan_spec const *chan, int val,
 			     int val2, long mask)
@@ -843,6 +860,7 @@ static const struct iio_buffer_setup_ops ads1015_buffer_setup_ops = {
 static const struct iio_info ads1015_info = {
 	.read_avail	= ads1015_read_avail,
 	.read_raw	= ads1015_read_raw,
+	.read_label	= ads1015_read_label,
 	.write_raw	= ads1015_write_raw,
 	.read_event_value = ads1015_read_event,
 	.write_event_value = ads1015_write_event,
@@ -853,6 +871,7 @@ static const struct iio_info ads1015_info = {
 static const struct iio_info tla2024_info = {
 	.read_avail	= ads1015_read_avail,
 	.read_raw	= ads1015_read_raw,
+	.read_label	= ads1015_read_label,
 	.write_raw	= ads1015_write_raw,
 };
 
@@ -861,7 +880,9 @@ static int ads1015_client_get_channels_config(struct i2c_client *client)
 	struct iio_dev *indio_dev = i2c_get_clientdata(client);
 	struct ads1015_data *data = iio_priv(indio_dev);
 	struct device *dev = &client->dev;
+	const char *label;
 	int i = -1;
+	int ret;
 
 	device_for_each_child_node_scoped(dev, node) {
 		u32 pval;
@@ -897,6 +918,15 @@ static int ads1015_client_get_channels_config(struct i2c_client *client)
 			}
 		}
 
+		if (fwnode_property_present(node, "label")) {
+			ret = fwnode_property_read_string(node, "label", &label);
+			if (ret) {
+				dev_err(dev, "invalid label on %pfw\n", node);
+				return ret;
+			}
+			data->channel_data[channel].label = label;
+		}
+
 		data->channel_data[channel].pga = pga;
 		data->channel_data[channel].data_rate = data_rate;
 
-- 
2.34.1

