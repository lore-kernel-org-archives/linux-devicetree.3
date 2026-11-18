Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.218.46
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795023867;
	b=NdHsZuOqhBd4f26f/NemlvA+QRN6VwMfFfrYHumlpPkTnmuDkb4aVlFzHeYSm7PU5nQX
	 g9mqAdVWN9RGv50Wc4YgIZSuPnB9dERqP9V8LTuGQbweSntzAjNbyEq1N70lfFjW6A861
	 nZCzP84odfv+4F5Ntem/AnXIx1B60zZOazW20Hxr1v8P+AJBuYkr6zniDnrNVQxvUxWw3
	 aQ0yv/7jTYZZR9eqk1w8FnFLm6Cv+ki3bBUdumeZc/I4tpZu7JIT58tarBQvPoGoMd8iE
	 5XbY1LzW9qEqqzq6FMxJmdlpFs8fKpVye5aGCRqPk4mM264nKE2HZSBTps4yy/NoCWQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795023867;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=4soOe8J5RcbwJ9ZjXDdzfBU9+cvbWhpoPlwod6HNRmE=;
	b=1tK/EyscundfqJxEjAQGT02SRxCIhjcafpaJQFZO8yw5UsmPcpAwKZViRTqhZYLJJEw2
	 z7u5o7uVuC6Bkdm/8AI3hVb4x1oUmicso5oh+qEKEMJ7nyMwrV54y5eiuGOinLhBFvjcQ
	 Zv8PoTD/m7TVshvwadleafUNdK7cg/JNPN7wTKxMVYQVo2e5kPBWQKsta3IYl//PlWpGF
	 6/TVX/s9OsVOAMBQoz2Rlf/rKlRFjsAZ5FX5Ce/uHNE9w8KPkrXkhJW3dTeVe1ziEk20/
	 AlHhcXUifDaVd/uq+rRN6/ZNx28HkF3D8Ye5tFjwVTJUqQCXUCBXRDLbZBAHDVx/LXQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=sQFpT8U3;
	arc=none smtp.remote-ip=209.85.218.46
Received: from mail-ej1-f46.google.com (mail-ej1-f46.google.com [209.85.218.46])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ED35A606A325
	for <devicetree@vger.kernel.org>; Wed, 18 Nov 2026 17:44:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org ED35A606A325
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=sQFpT8U3
Received: by mail-ej1-f46.google.com with SMTP id a640c23a62f3a-c511cdd5a82so98252566b.3
        for <devicetree@vger.kernel.org>; Wed, 18 Nov 2026 09:44:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795023865; x=1795628665; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=4soOe8J5RcbwJ9ZjXDdzfBU9+cvbWhpoPlwod6HNRmE=;
        b=sQFpT8U3U9tJRgjpg5itqRYSIhcz1jOA3BfYS3mw5xEQsjb1u9bj7zm1AjegHjvG3y
         vw/W6x6GK+AC8oprqO91tn5Ef3ptmE1o3muJqlUkKXLZMcqjkcHUp1DJlZR8chyx2yil
         UAkTLub3VBgXc6dtgZVA1gpGQQEtu/Z3Z/LT4iZLJd8lID2QsT5lEpuiXW7cZXBdzEkx
         OZNg4thCfF4qisSB1rBFDPyZ4a4Z8CDOIA/m9zyyMz8AlRASw1be3zkr6LPE8gOsytnE
         AKZQG0dknLHc1j3GxEk5ncxdYaD9FwfIZIWvYgDzrBhEqEtjBLkNrs/AL1Cs8X8sacYF
         pQ2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795023865; x=1795628665;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=4soOe8J5RcbwJ9ZjXDdzfBU9+cvbWhpoPlwod6HNRmE=;
        b=KyL+1G0eVh2zfZD2W7mL78mMqGBuoMePGpViMlrIhgWOdZfydZAAu9rqMQs7Q4BjBm
         tgMJoWkX3slNkg/gobkNHP/e+FmfYT9LruA1uVRIe3o/Pj8ygLMfRQ3zWLAbTi5znjB2
         wDrwgbzYgOjSW7eNkg/+H+eFRnd5vIYZPH32Z2VSl4ZsvtGEJT4g03y0Ymf9NAbsEDZo
         DO+pB2HLuWtiZcHbOPllsNB1LbDMk6p0bsppFic+1ESeM+lQqaWHdz99pKj9B22/GhNV
         0Qf5X7RPJBwknAtSJl2x+FHTPDxLZuaQKggy2cnCglwid59XYkz0hmWk3sH5x4O7FY3b
         fyYg==
X-Forwarded-Encrypted: i=1; AL+hErFltVXaryPTzwnIFWrn1Hj93bv2JvS4oMtF8Qpo8LuaDczKI7JLXOQ6IvKJRDI61/N0D1cNwrXSab7j@vger.kernel.org
X-Gm-Message-State: APuU4Z9nr/yNGFK1wIgcASsqN5zg7dAwxf6GSCLQzseZIL8AZwyFCQaM
	UieUW6rO/s4UiEDjfoOFFEwvaTkVSLCdA5qQUvWNtm38X5OHIUy7wq83
X-Gm-Gg: AYBFou0LJbF1mj8mj+rVmw5oZ6qRH4h7Y1t2dhZzWxCnE0Ubdy1jc5OFZ0ryJk3iEte
	4f22lBRr3dDXcPPQaRtrBqbAMDH+zZkOMELd2RrWmVc0fWL8TraOotoHG2SyaOfyNImeu/L8hGZ
	to/S7uZbmiABASxxfIB2Ki04dW258b2KwX2aCTNIIeJCSojm55pU/d8eRAkB5kd4lvl8X2/DW8u
	QCOhOcv+XxhcnD/ZkuUkA8Y5V2uUtZR6Ov3pcQgBEU5g6tbhPEFnifsVwlzkvUPpXL1Z8QDpcgL
	/E/9ih7P/NjPtnrcGBXs2SOkvgofx4unSQOTAviN94ep1UmPg+DtFYqJ4SWlq9rZdfikHzT2eHl
	q0RRwwn4IyeQZMHhtNXMR3PFme8dFcYhYdA7P224RCF4yRJR1NPs+qoN1YK4OBQlwrJTycPAq4J
	Ft/IZuimyJo6d2GS/PvXRD1qlffAr+B5t67i7/GbJh6+WIeRDgPKYGBWwQasWdYyJeIm+wL68/k
	7E9Modn4VZE+agmf5w32M3qdE6J/lOcGnuiM/1FHrWmjrNPq4sSYckY4m1v+rAHb8WXuZZ4TA5b
	Ifx/QqS+HMhXKSfcIuPbLvwF7c5STEwETqgZtUlpSkJ8cOkyBHr2aIJIo26VAV3DgiUe38B7HTf
	tqy8fhKw+emiKjsZk1xHNXAHesbuVIM6Y
X-Received: by 2002:a17:907:6d1f:b0:c46:8b87:c1f4 with SMTP id a640c23a62f3a-c510e2d4ee1mr313457266b.20.1795023864719;
        Wed, 18 Nov 2026 09:44:24 -0800 (PST)
Received: from fedora.tux.internal (85.191.71.118.dynamic.dhcp.aura-net.dk. [85.191.71.118])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c51233c3befsm25904066b.26.2026.11.18.09.44.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Nov 2026 09:44:24 -0800 (PST)
From: Bruno Thomsen <bruno.thomsen@gmail.com>
To: linux-hwmon@vger.kernel.org,
	devicetree@vger.kernel.org
Cc: Guenter Roeck <linux@roeck-us.net>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Bruno Thomsen <bruno.thomsen@gmail.com>
Subject: [PATCH v2 2/2] hwmon: (tmp401) add channel label support
Date: Wed, 18 Nov 2026 18:43:34 +0100
Message-ID: <20261118174334.18759-2-bruno.thomsen@gmail.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261118174334.18759-1-bruno.thomsen@gmail.com>
References: <20261118174334.18759-1-bruno.thomsen@gmail.com>
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

Read the optional per-channel label from the device tree and expose it
through tempX_label, so user space can select a temperature sensor by
the name the board gives it instead of hardcoding a sysfs index.

The channel index comes from the child node reg property. Reject a reg
value that the detected chip does not implement, since only TMP432 has
a second remote channel; accepting it would add a tempX_label with no
matching tempX_input.

This mirrors what lm90 already does.

Signed-off-by: Bruno Thomsen <bruno.thomsen@gmail.com>
---
Changes in v2:
- Fix continuation-line alignment in tmp401_read_string() reported by
  checkpatch --strict.
- Expand commit message: the channel index comes from the child node
  reg property, and a reg value the detected chip does not implement is
  rejected so no tempX_label is created without a tempX_input.
- Skip child nodes not named "channel", as lm90 and tmp421 do.
---
 drivers/hwmon/tmp401.c | 36 ++++++++++++++++++++++++++++++++++++
 1 file changed, 36 insertions(+)

diff --git a/drivers/hwmon/tmp401.c b/drivers/hwmon/tmp401.c
index 2fceeacdc88c..7b645d982c9a 100644
--- a/drivers/hwmon/tmp401.c
+++ b/drivers/hwmon/tmp401.c
@@ -117,6 +117,7 @@ struct tmp401_data {
 	struct hwmon_channel_info temp_info;
 	const struct hwmon_channel_info *info[3];
 	struct hwmon_chip_info chip;
+	const char *channel_label[4];
 };
 
 /* regmap */
@@ -467,6 +468,16 @@ static int tmp401_read(struct device *dev, enum hwmon_sensor_types type,
 	}
 }
 
+static int tmp401_read_string(struct device *dev, enum hwmon_sensor_types type,
+			      u32 attr, int channel, const char **str)
+{
+	struct tmp401_data *data = dev_get_drvdata(dev);
+
+	*str = data->channel_label[channel];
+
+	return 0;
+}
+
 static int tmp401_write(struct device *dev, enum hwmon_sensor_types type,
 			u32 attr, int channel, long val)
 {
@@ -502,6 +513,7 @@ static umode_t tmp401_is_visible(const void *data, enum hwmon_sensor_types type,
 		case hwmon_temp_fault:
 		case hwmon_temp_lowest:
 		case hwmon_temp_highest:
+		case hwmon_temp_label:
 			return 0444;
 		case hwmon_temp_min:
 		case hwmon_temp_max:
@@ -521,6 +533,7 @@ static umode_t tmp401_is_visible(const void *data, enum hwmon_sensor_types type,
 static const struct hwmon_ops tmp401_ops = {
 	.is_visible = tmp401_is_visible,
 	.read = tmp401_read,
+	.read_string = tmp401_read_string,
 	.write = tmp401_write,
 };
 
@@ -531,6 +544,7 @@ static int tmp401_init_client(struct tmp401_data *data)
 	struct regmap *regmap = data->regmap;
 	u32 config, config_orig;
 	int ret;
+	u32 ch;
 	u32 val = 0;
 	s32 nfactor = 0;
 
@@ -590,6 +604,28 @@ static int tmp401_init_client(struct tmp401_data *data)
 			return ret;
 	}
 
+	for_each_child_of_node_scoped(data->client->dev.of_node, child) {
+		if (!of_node_name_eq(child, "channel"))
+			continue;
+		ret = of_property_read_u32(child, "reg", &ch);
+		if (ret) {
+			dev_err(&data->client->dev, "missing reg property of %pOFn\n", child);
+			return ret;
+		}
+		if (ch >= ARRAY_SIZE(data->temp_channel_config) ||
+		    !data->temp_channel_config[ch]) {
+			dev_err(&data->client->dev, "invalid reg %u of %pOFn\n", ch, child);
+			return -EINVAL;
+		}
+		ret = of_property_read_string(child, "label", &data->channel_label[ch]);
+		if (ret == -ENODATA || ret == -EILSEQ) {
+			dev_err(&data->client->dev, "invalid label property in %pOFn\n", child);
+			return ret;
+		}
+		if (data->channel_label[ch])
+			data->temp_channel_config[ch] |= HWMON_T_LABEL;
+	}
+
 	return 0;
 }
 
-- 
2.53.0

