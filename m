Received: from mail-ed1-f43.google.com (mail-ed1-f43.google.com [209.85.208.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2666D4AB1B1
	for <devicetree@vger.kernel.org>; Thu, 10 Sep 2026 14:54:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789052064; cv=none; b=WHS4s4xYz8hvHg2mJELQXJJznMrE+1j0CgK5OJXHxtqMClJOifBB0F0pvsGq1Vj8sk2RAzG32tQCvZmsFl53rkEaqbthbrjGjO18g9UimHu71MFczL5eeyaKgbP7kvm8oTlqMyTS8HLpFpmUO7a9+VZDGlLbXSDMIVS2jtyJB7E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789052064; c=relaxed/simple;
	bh=lRC/CSx3PhSYeBidfq8leg5D0ovjhGx9Q1X38i3kiW8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=JU47avEWQRMKflglLxCDk6GVbT2wWN7LCfG6YYSlwmuK4v50T0M/FKaJB90SwvX++A5YRz1MvC+hdLc8AAQ0G4D21VF2DTy6XeQSowbJDOPw/fUlST6NVUZyXczuiTh7IBdQWOjFST4W3Owt6w7HK0bxgE9+osRSVVBMmXKschE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fairphone.com; spf=pass smtp.mailfrom=fairphone.com; dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b=x1VGY+Za; arc=none smtp.client-ip=209.85.208.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fairphone.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fairphone.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b="x1VGY+Za"
Received: by mail-ed1-f43.google.com with SMTP id 4fb4d7f45d1cf-6a051b737d8so7063947a12.1
        for <devicetree@vger.kernel.org>; Thu, 10 Sep 2026 07:54:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair; t=1789052060; x=1789656860; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=yJK0XhoQ3rVBDJaGpHyeUBARRYM1Hb6GV+mqdPwfA8w=;
        b=x1VGY+Za1uI7Dze4+NQp8rXA3Vd7d8Q32IBUCwUufjTMkdRNxmJxTZze+/oWrsRwyx
         xo6lSdbxpg1zIz0qo/dsuAVDujgSvkwKCnOWtkEsNyNoVRegCHUi22/6C533RPH0fsoY
         VGPiJniKJeUpsZ9c80Ta+KdnS23f5sFxPok0D7IIfhGzmHMbAllbV/nKI/f2xkHyfZtY
         ZE3gzj6knNN28XwcGD3LIdmRhTX306BGa3ut1Ksw2JGs+k+WU81qqQMQNObzyS+PQK9N
         4kuWY/1lFGkT+/FjvrXb3PtjXamrgax/OOOXFSKRQQb/v0eUDDrb1ZrmXYGJ1+6eeOdx
         d14A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789052060; x=1789656860;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=yJK0XhoQ3rVBDJaGpHyeUBARRYM1Hb6GV+mqdPwfA8w=;
        b=Vql0/tiXVA7RkLs1UMHE+zEomxNhltsnGGAdLPQ01yei6U64tHCSGTauUCbwftsMEQ
         U/maE2zBe9XnFL6aka26IQniE+icVeW3+fll1YbR9EYoz4lsR1id0I6F7g6779A+gY27
         IDkJyDGWInB+C8CQotC2Zb46LRP7W1ANP6/nqfowdoP1Z0XccI8wlHeO5mKFOmTRIQge
         fuaAY/eh7sF82tyoleBcPG43A91wR+MELKetLYMoYXBSB7X8S015jOSUWCxUe6U9g6uM
         RpFxC0DlWbYvV4X+Cfv2/kajzwrIitm2lqBKXNAjDPnWW35EKN6fqq8fp/8LfVUaF1z+
         CY/g==
X-Forwarded-Encrypted: i=1; AKwUvBz+YBIOtKAPLvdumFDrKgohJ2qgfrDfjYYsgaz8XzGkisrpa4wYOXb7tlfqTklJfDdwC2oHiL1RQzyQ@vger.kernel.org
X-Gm-Message-State: AFuF++nOth4KPJGp1PPz7+uRa8+ehPJ4iuUGxINy+dLju3wzbVQ5nt/7
	0dsuVZcSCyCQHFYMIzu3HHR+Xel9iSif+MvdmgxAnfOdLg1fSV+pLL02cBrFpeyN9aA=
X-Gm-Gg: AYBFou2KF1gaWQz6af/OpmaeEPDAeNZIfhhPTLjSQPKNJNZeOKs4F0madImMe40Ph0i
	u4d7yYhq0xsYLS/Juq+b7E+rI9RPT1hPSe9U6uN0VtWHbk0vmlbPQ3BDwTKpbIbni3x0RocDt/E
	+pwWgkSNTe5wsxo7wLMwJ9EMkqt43aTJ7H2N3/YM6JP2pI55LPyRSkGc1ntqMgCXo46i18mOfft
	8mg/VhHq4AMKJqNmr+hdxl59s/MUjOTcR//LN0CudLdJtINxOhj+UQ4EO9WIpqmD0VFtmnFDeNq
	xIVQgPLmxPj15BCtS83gCC65xrXSrvb71F2PmHnzbrZp6B+6I7z1VIHWc1lLYWpYdnESgtDwn/R
	X3py0ntk9JmzZ2C2h2F/SiXcySnNDqTU08NIoehJ75IBqS+uh0jy5GN0Lwp3DGVEk0Ap2dTxgTd
	K0EI1WXATA5En4YETX6W52N3XGMP+Nt6VcoYwsUDLgxCx01mPaAYqMlW7FtQLZICDisyWuhyI3w
	2X/qfcrpbSgJOAxY+RAhigdsU29rCaVlz1y+/EPIqozpujgU95OQVyh
X-Received: by 2002:a05:6402:a2d1:20b0:6a9:693d:31d6 with SMTP id 4fb4d7f45d1cf-6a9693d32d0mr4601111a12.22.1789052060374;
        Thu, 10 Sep 2026 07:54:20 -0700 (PDT)
Received: from [172.16.240.55] (144-178-202-142.static.ef-service.nl. [144.178.202.142])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6a7e6c20c0fsm8849715a12.30.2026.09.10.07.54.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Sep 2026 07:54:19 -0700 (PDT)
From: Griffin Kroah-Hartman <griffin.kroah@fairphone.com>
Date: Thu, 10 Sep 2026 16:54:17 +0200
Subject: [PATCH 2/3] media: i2c: dw9719: Update DW9800K driver
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260910-b4-dw9800k_cleanup-v1-2-608255ea61ab@fairphone.com>
References: <20260910-b4-dw9800k_cleanup-v1-0-608255ea61ab@fairphone.com>
In-Reply-To: <20260910-b4-dw9800k_cleanup-v1-0-608255ea61ab@fairphone.com>
To: Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 =?utf-8?q?Andr=C3=A9_Apitzsch?= <git@apitzsch.eu>, 
 Luca Weiss <luca.weiss@fairphone.com>, 
 Sakari Ailus <sakari.ailus@linux.intel.com>, 
 Daniel Scally <dan.scally@ideasonboard.com>, 
 Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-media@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
 Griffin Kroah-Hartman <griffin.kroah@fairphone.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1789052058; l=3982;
 i=griffin.kroah@fairphone.com; s=20260910; h=from:subject:message-id;
 bh=lRC/CSx3PhSYeBidfq8leg5D0ovjhGx9Q1X38i3kiW8=;
 b=eEl6h+GabRpKMZ4cV8/YCYqRa36sZU+2uo4PFdx+M8J43m3UzJclFdLaNw7Qkp6MfDwtlNn2V
 ofdr14RQY0GCx22DAWeBKN9OLZZn8hD2R4afrcsjbDhgQvZqL5Zgvfc
X-Developer-Key: i=griffin.kroah@fairphone.com; a=ed25519;
 pk=HlyUkuZAN9I5qlPbOHN5N9xxdQ5sT6AbPgC4TsLCxzA=

The previous DW9800K driver code was created without access to a
datasheet for the part, now that we have one we can clean up some
misunderstandings and add some features for further expandability.

Signed-off-by: Griffin Kroah-Hartman <griffin.kroah@fairphone.com>
---
 drivers/media/i2c/dw9719.c | 71 ++++++++++++++++++++++++++++++++++++++++------
 1 file changed, 62 insertions(+), 9 deletions(-)

diff --git a/drivers/media/i2c/dw9719.c b/drivers/media/i2c/dw9719.c
index 3b7ba88fd67c..982be59b9ee1 100644
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
 
@@ -90,6 +99,8 @@ struct dw9719_device {
 	u32 mode_low_bits;
 	u32 sac_mode;
 	u32 vcm_freq;
+	u32 div;
+	u32 sac_time;
 
 	struct dw9719_v4l2_ctrls {
 		struct v4l2_ctrl_handler handler;
@@ -140,10 +151,6 @@ static int dw9719_power_up(struct dw9719_device *dw9719, bool detect)
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
@@ -165,6 +172,12 @@ static int dw9719_power_up(struct dw9719_device *dw9719, bool detect)
 			dw9719->sac_mode = DW9761_DEFAULT_SAC;
 			dw9719->vcm_freq = DW9761_DEFAULT_VCM_FREQ;
 			break;
+		case DW9800K_ID:
+			dw9719->sac_mode = DW9800K_DEFAULT_SAC;
+			dw9719->vcm_freq = DW9719_DEFAULT_VCM_FREQ;
+			dw9719->div = DW9800K_DEFAULT_DIV;
+			dw9719->sac_time = DW9800K_DEFAULT_SACT;
+			break;
 		default:
 			dev_err(dw9719->dev,
 				"Error unknown device id 0x%02llx\n", val);
@@ -185,14 +198,54 @@ static int dw9719_power_up(struct dw9719_device *dw9719, bool detect)
 		/* Optional indication of VCM prescale */
 		device_property_read_u32(dw9719->dev, "dongwoon,vcm-prescale",
 					 &dw9719->vcm_freq);
+
+		/* Optional indication of clock pre-scale select */
+		device_property_read_u32(dw9719->dev, "dongwoon,clock-presc",
+					 &dw9719->div);
+
+		/* Optional indication of SAC timing */
+		device_property_read_u32(dw9719->dev, "dongwoon,timing-control",
+					 &dw9719->sac_time);
 	}
 
 	switch (dw9719->model) {
 	case DW9800K:
-		cci_write(dw9719->regmap, DW9719_CONTROL, DW9719_ENABLE_RINGING, &ret);
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
+			  (dw9719->div >> DW9800K_DIV_LOW_SHIFT), &ret);
+		cci_write(dw9719->regmap, DW9800K_RESONANCE,
+			  (dw9719->div << DW9800K_DIV_SHIFT) |
+			  dw9719->sac_time, &ret);
 		break;
 	case DW9718S:
 		/* Datasheet says [OCP/UVLO] should be disabled below 2.5V */

-- 
2.55.0

