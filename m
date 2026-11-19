Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.218.50
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795081888;
	b=cZlFec9hnW6kF6+DH4WUeMRbqUXsNkneg6tWE5AjW9Kt+aqZoQhg3R4KQ4wJGbier+mg
	 QaI2MnRmX0AvmXI/ZWONgxaGMYh35tIcxwJ+qvMgz+2YMp7WyLwjF+/O2e3E0Clj6IxLi
	 ar49Wt9CQXzjCDcq7w1ALbfCv9Nc2w07wbQi9N7n+HH59b/QagYwaQGLcJFAvBh/B0qV1
	 XRirnd3f1qsLk7BYnNf5AzaSBYbZLrK+Nr7GIhBKqUnhvJV80hGCIPHdWW9iDtWhaewOd
	 mtk7xsTteo2iC72quzGET+Ijlhf88F0BUSbOeWvTPnHTvQp+ueLY71rGlnxT8PjIG4g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795081888;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key;
	bh=aoPl+pQm9ZHcIGL4Om5Oc2NfD/t8KVMY3eNtZkgFANg=;
	b=2SrC8rbUELBI/anSqbQdKZ7nMXyGfDVn7KJbI4JrA8Y2vpHvO32MSyoCaJC7yIziGZUa
	 2zYCxpw/CHT0YUrndyBa4bNzVmzTDHSWr7v1/wCOfiPtqnlc+kE8zhGBNdJ4/yujea0GC
	 iuJSt7Vz9c2R+AGFBsKwnqpLls9CA/mPLZrVr1np7NoZTH1ivYlzd4Yjv/Y8Yp401r9LY
	 D0ULAKuLStgZZZqf/dhQHzF29oeT0F6NhgsfUhC+WxoQIDNpl5wg9Kb4wqXhL7KIzCN8a
	 L8kuHSQDrVA0GrbV6e7HWPn/VSCFLeHrMM3rWspgf3WnoJ0ex75UimqviKNKTSLU9NA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=fairphone.com;
	spf=pass smtp.mailfrom=fairphone.com;
	dkim=pass header.d=fairphone.com header.i=@fairphone.com header.a=rsa-sha256 header.s=fair header.b=FWeDOLMX;
	arc=none smtp.remote-ip=209.85.218.50
Received: from mail-ej1-f50.google.com (mail-ej1-f50.google.com [209.85.218.50])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BC314606A33D
	for <devicetree@vger.kernel.org>; Thu, 19 Nov 2026 09:51:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BC314606A33D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fairphone.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fairphone.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.a=rsa-sha256 header.s=fair header.b=FWeDOLMX
Received: by mail-ej1-f50.google.com with SMTP id a640c23a62f3a-c4cb6834eaaso335188366b.2
        for <devicetree@vger.kernel.org>; Thu, 19 Nov 2026 01:51:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair; t=1795081886; x=1795686686; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=aoPl+pQm9ZHcIGL4Om5Oc2NfD/t8KVMY3eNtZkgFANg=;
        b=FWeDOLMX7eEjKZwV4FINw51BroOkvQE1Ee9sZMTI7oinGpI5vzMgLfaFEliLunRZ+c
         2abObKZcLrZs1rxgD6kcSoL9855bUYx56B+1LZTacZFu7FtJwPYl/HUTMVqtLE27OWll
         Xx90WS26Pw5KnX88ygisBJfnAWsBm8iXpSPPRQfOymrbM3MpoJvIGpuLSjo2LhTGxoXQ
         cz7gzYjpu0HH7cP3ppKGKb7iu25zHGXZm5UcBFhQLt7VqBgAFN+Rg8Sa7xjSZCqm7UQo
         t59bB+tXUhLXJgF3N/RmBLs6Y1Lm/RzP9dHvJBkZpUi6PXF/RgdF+Qf8SRcixWpgNXxo
         ptiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795081886; x=1795686686;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=aoPl+pQm9ZHcIGL4Om5Oc2NfD/t8KVMY3eNtZkgFANg=;
        b=OnJSWKgZtqb4pzPC9gutHqerkGdgRvVSJZdCZ1ifsKVuSgiUtsy6Y3ZI4F6veWbGZZ
         5pIH9CtofFvGv6PpTqva4DJauc3PMT+MPwcZJ5pIAXHV5FVO61ST4JmDRreJkhOMBYT7
         iZyUNfFFvdVAImiXV4md//I6XkZQCovSl7djMy877MTWybAi9d3UWpNvUimiS1VsflJG
         VIgE5a15atpiC39qn3U4rb7rBmaSCwIUhNanwo6JTmvrMiAk/E1JLWvL1xBcAUUz1XKr
         yLuaDkbQVcHDuBcgr6MRgFFidV/WoL3DJKmE9ACDLGgKIaKagHWPvu5/LjY/6xjRq+0W
         B36w==
X-Forwarded-Encrypted: i=1; AL+hErE769UhIphdg0d9zG76ugbzNeohCM96obhBk8WJVXGhUoTOy0vul2gEb4D/DvW92k7dw6/upbhNI8ax@vger.kernel.org
X-Gm-Message-State: APuU4Z9IgGQlL7Q6o+CA6XeEIdrAcTSVvFxrbCbdNjcUCYbvtuGJFRey
	/wO29GVjUfTAXVJ7pLtX0Kr/niwVwjAZQA0rYikmIgbw1g1aN1t5H0IwZjZz8RazC78=
X-Gm-Gg: AYBFou0BBvP9BCQPqP308IJWUmXc0IrjaqDZzulue67ShdnYTImPiyzB3UxAiz2lc8M
	RqnlwRtnlotXJQtjLIoNw/284VuCp/gTBFCmHNatq434vy8M4I9Gq1AK4eMCd8lRAHZM3qQ7ETz
	vBWxUP4Kc0T6jQRMVikS+Ev/KYR0pMM9dXA51Ue0PF2QMPpcGFwsM4jxReJvC71W5/bU2keJcL6
	7vsYwIrGiVUrCIMkkxSZQYHkecuwVJX2XexaCzxIQ7mTNXayqW79/TESWd41t9xkYS2it2AJtOt
	e7N6jLfmsnxR7uayN/U8NEfaXf64iE2AhzJ9fTH79ZOD79z+Av/04s8cVJV48GGCzQuRPITJDX4
	9XuND/JsBaE1idd8B8Vhe6nN8kjeuVkh1ntlXAW7+RgppjKLXrhQBSWAK+x9kwgVaPesLx6yBVj
	lgubdWRHQKl+s4tgQ8X0eBQtWbsHIBZDZf0G+Jl5Gd7ShWYW4xJprocBwkOs5Ud9iTuZOfF8Lg2
	G/MEeiN2rQhGjRWBEUmHUDUdgRJDgBi+XftmLzcTYPuPLaW2lm6/ul+xWDAXaZ3saFr+OCFdl/u
	Z/Cqw4BtNnSVVYStlftaqt2HzsoX3F20tglwhUITiSjtpgV3FPkC+6Qo9kz1ActxbieBxdcaVXy
	uV5fOdDEMACY=
X-Received: by 2002:a17:906:8f8a:b0:c50:5996:5b89 with SMTP id a640c23a62f3a-c510e219138mr480420266b.23.1795081886208;
        Thu, 19 Nov 2026 01:51:26 -0800 (PST)
Received: from [172.16.220.224] (144-178-202-138.static.ef-service.nl. [144.178.202.138])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c51231bc213sm95057166b.12.2026.11.19.01.51.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Nov 2026 01:51:25 -0800 (PST)
From: Griffin Kroah-Hartman <griffin.kroah@fairphone.com>
Date: Thu, 19 Nov 2026 10:51:24 +0100
Subject: [PATCH v4 2/3] media: i2c: dw9719: Update DW9800K driver
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
Message-Id: <20261119-b4-dw9800k_cleanup-v4-2-df26c431595e@fairphone.com>
References: <20261119-b4-dw9800k_cleanup-v4-0-df26c431595e@fairphone.com>
In-Reply-To: <20261119-b4-dw9800k_cleanup-v4-0-df26c431595e@fairphone.com>
To: Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 =?utf-8?q?Andr=C3=A9_Apitzsch?= <git@apitzsch.eu>, 
 Luca Weiss <luca.weiss@fairphone.com>, 
 Daniel Scally <dan.scally@ideasonboard.com>, 
 Sakari Ailus <sakari.ailus@linux.intel.com>, 
 Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, 
 Hans Verkuil <hverkuil+cisco@kernel.org>
Cc: linux-media@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
 stable@vger.kernel.org, Griffin Kroah-Hartman <griffin.kroah@fairphone.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795081884; l=4881;
 i=griffin.kroah@fairphone.com; s=20250804; h=from:subject:message-id;
 bh=rR/uSR6FC+oVbJMW9ps010sQx6WkZ4oy9AD9qxw5jIE=;
 b=DpULb/h5PTjtt0PSNy9pvRAVvuv7bvSa72vNW3KbU0KgiLkAHuEv4Rb0KyCk+pu/EvcwbJdA3
 O/gw60nW0FnAalBove+6U/7ZUom1QfXUT9S/FbndkUbJ1m9rJ0XfkoY
X-Developer-Key: i=griffin.kroah@fairphone.com; a=ed25519;
 pk=drSBvqKFiR+xucmLWONHSq/wGrW+YvcVtBXFYnYzn8U=

The previous DW9800K driver code was created without access to a
datasheet for the part, now that we have one we can clean up some
misunderstandings and add some features for further expandability.

More specifically:

Previously we were blindly writing registers to their downstream values,
Now we know what the correct default values of SAC and SACT, and write
to the correct bits as specified from the datasheet.

We found that the device does indeed have an ID, and add it to the
switch statement when setting up the default device properties.

The largest change would be the implementation of "Ringing," this is
actually an internal switch bit used to differentiate whether the SAC
(smart actuator control) modes are enabled. if the "ringing" bit is
zero, then actuator modes DIRECT and LSC are available(based on the
value written to the Mode register). If the bit is 1, SAC2-SAC5 are
available.

For the devices we tested this driver on, no new values are being
written, but now the option for further use of the DW9800k is available
to others if they wish to do so.

Fixes: 083f7f0dce16 ("media: i2c: dw9719: Add DW9800K support")
Signed-off-by: Griffin Kroah-Hartman <griffin.kroah@fairphone.com>
---
 drivers/media/i2c/dw9719.c | 68 +++++++++++++++++++++++++++++++++++++++-------
 1 file changed, 58 insertions(+), 10 deletions(-)

diff --git a/drivers/media/i2c/dw9719.c b/drivers/media/i2c/dw9719.c
index 3b7ba88fd67c044ef9005a0aac6a5d26ab939a90..2879dc99088005cba2567b2a73627c91c270906b 100644
--- a/drivers/media/i2c/dw9719.c
+++ b/drivers/media/i2c/dw9719.c
@@ -68,9 +68,18 @@
 #define DW9761_VCM_PRELOAD		CCI_REG8(8)
 #define DW9761_DEFAULT_VCM_PRELOAD	0x73
 
-#define DW9800K_DEFAULT_SAC		1
+#define DW9800K_ID			0xEB
+#define DW9800K_DEFAULT_SAC		3
 #define DW9800K_MODE_SAC_SHIFT		6
-#define DW9800K_DEFAULT_VCM_FREQ		0x10
+
+#define DW9800K_RESONANCE		CCI_REG8(7)
+
+#define DW9800K_DEFAULT_DIV		0x01
+#define DW9800K_DIV_SHIFT		6
+#define DW9800K_DIV_LOW_SHIFT		2
+
+#define DW9800K_DEFAULT_SACT		0x20
+
 
 #define to_dw9719_device(x) container_of(x, struct dw9719_device, sd)
 
@@ -90,6 +99,7 @@ struct dw9719_device {
 	u32 mode_low_bits;
 	u32 sac_mode;
 	u32 vcm_freq;
+	u32 sac_time;
 
 	struct dw9719_v4l2_ctrls {
 		struct v4l2_ctrl_handler handler;
@@ -140,10 +150,6 @@ static int dw9719_power_up(struct dw9719_device *dw9719, bool detect)
 			dw9719->sac_mode = DW9718S_DEFAULT_SAC;
 			dw9719->vcm_freq = DW9718S_DEFAULT_VCM_FREQ;
 			goto props;
-		case DW9800K:
-			dw9719->sac_mode = DW9800K_DEFAULT_SAC;
-			dw9719->vcm_freq = DW9800K_DEFAULT_VCM_FREQ;
-			goto props;
 		default:
 			break;
 		}
@@ -165,6 +171,11 @@ static int dw9719_power_up(struct dw9719_device *dw9719, bool detect)
 			dw9719->sac_mode = DW9761_DEFAULT_SAC;
 			dw9719->vcm_freq = DW9761_DEFAULT_VCM_FREQ;
 			break;
+		case DW9800K_ID:
+			dw9719->sac_mode = DW9800K_DEFAULT_SAC;
+			dw9719->vcm_freq = DW9800K_DEFAULT_DIV;
+			dw9719->sac_time = DW9800K_DEFAULT_SACT;
+			break;
 		default:
 			dev_err(dw9719->dev,
 				"Error unknown device id 0x%02llx\n", val);
@@ -185,15 +196,52 @@ static int dw9719_power_up(struct dw9719_device *dw9719, bool detect)
 		/* Optional indication of VCM prescale */
 		device_property_read_u32(dw9719->dev, "dongwoon,vcm-prescale",
 					 &dw9719->vcm_freq);
+
+		/* Optional indication of SAC timing */
+		device_property_read_u32(dw9719->dev, "dongwoon,timing-control",
+					 &dw9719->sac_time);
 	}
 
 	switch (dw9719->model) {
-	case DW9800K:
-		cci_write(dw9719->regmap, DW9719_CONTROL, DW9719_ENABLE_RINGING, &ret);
+	case DW9800K: {
+		int ring, sac;
+
+		/*
+		 * Enable ringing for SAC3-SAC5
+		 *
+		 * sac_mode	reg	Mode
+		 * ===========================
+		 *	0	0X	Direct
+		 *	1	1X	LSC
+		 *	2	00	SAC2
+		 *	3	01	SAC3
+		 *	4	10	SAC4
+		 *	5	11	SAC5
+		 */
+		switch (dw9719->sac_mode) {
+		case 0:
+			ring = 0;
+			sac = 0;
+			break;
+		case 1:
+			ring = 0;
+			sac = 2;
+			break;
+		default:
+			ring = DW9719_ENABLE_RINGING;
+			sac = dw9719->sac_mode - 2;
+			break;
+		}
+		cci_write(dw9719->regmap, DW9719_CONTROL, ring, &ret);
+		/* DIV is 3 bits split over the bottom bit in reg 6 and the top 2 bits in reg 7 */
 		cci_write(dw9719->regmap, DW9719_MODE,
-			  dw9719->sac_mode << DW9800K_MODE_SAC_SHIFT, &ret);
-		cci_write(dw9719->regmap, DW9719_VCM_FREQ, dw9719->vcm_freq, &ret);
+			  (sac << DW9800K_MODE_SAC_SHIFT) |
+			  (dw9719->vcm_freq >> DW9800K_DIV_LOW_SHIFT), &ret);
+		cci_write(dw9719->regmap, DW9800K_RESONANCE,
+			  (dw9719->vcm_freq << DW9800K_DIV_SHIFT) |
+			  dw9719->sac_time, &ret);
 		break;
+	}
 	case DW9718S:
 		/* Datasheet says [OCP/UVLO] should be disabled below 2.5V */
 		dw9719->sac_mode &= DW9718S_CONTROL_SAC_MASK;

-- 
2.43.0

