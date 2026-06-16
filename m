Received: from mail-dy1-f176.google.com (mail-dy1-f176.google.com [74.125.82.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 836AD37C0E5
	for <devicetree@vger.kernel.org>; Tue, 16 Jun 2026 04:16:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781583384; cv=none; b=YLjhzpWljspBewGxdXDqtCIBYJLInAXQ5OV7JIG2CJhSkrIF1C/rWSxDgK6HFxaQeG1E2WV/61+QnfsiPo2Wb1VbISiQtf1Gm1KhUrO/xSYntVtUfBFQIxWJiFhdLc9Cdn6i2MBXbUq4QB1TsUZ7QqGZkg33BMMIurjqPcfuVEA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781583384; c=relaxed/simple;
	bh=zgVrxfsr6Lw9AkBCvthWB97K2H45BrWBfyjksXlWRGQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ijRhj5r4GMtzcWJGmruXUIJ1w/2QG1Jvlw9OpD/mSFdAzMKwEgN56hJRgYGbJ38dGa53y86WpvZ5ZBxWJpsDKYJ/p7cDrLwssL00jQYzxwCCcQgecWH6SI32ZL/LhoDNkdIPKYn0BaPk6i+qu8LnhqrifxyIjKvktVIVkZ35PA4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Kll33fkt; arc=none smtp.client-ip=74.125.82.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Kll33fkt"
Received: by mail-dy1-f176.google.com with SMTP id 5a478bee46e88-307d0405e07so6204477eec.1
        for <devicetree@vger.kernel.org>; Mon, 15 Jun 2026 21:16:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781583382; x=1782188182; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=3em1q6OKNvAsDlZXNz19YR3IMd5ID+hx5lZcJKwh4oM=;
        b=Kll33fkt6DZGXMD9oJKUbHx4vMJB+MzjVDq9MDkmEw3dNgG4mzHo0RZthjTLI/0koq
         M5+e0RZo7PqYOxNA0XOaArM72CS24LFDt6FMGt9yF6kVfjS27WM5QpZ52Y2K4Uic1vOZ
         xQ8mO257g0Glvmd03lHNI+ybYzVVpgBLIkgaYs3DZ4N/HSKsGnt1p4c/bHDyX5ULp24Y
         caAUhxJyeRxNN4BHTyRtMqSEgTvfpBvbFOarZTD2GacMWP1Hk26SRMbeZSnrVyRzZCS0
         cZZocOiSIrU4QjppyNKD+g7S755iWUvHiwP3WyVFjz/jNN43EeL1ATf3DU3UGpkyhKCU
         tcUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781583382; x=1782188182;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=3em1q6OKNvAsDlZXNz19YR3IMd5ID+hx5lZcJKwh4oM=;
        b=fXNB1wgWhddTxUeD8PbCT6UwPzHMKU/9zVlHYrw4WwyV8C4GjTdGH0RkYHb1P/fP+4
         bOUmZJTxlbbwFOUNlt/V1rKdl6So/h/JLDHOXDGiWLyPXIzXSfKQaGv2Hwzwzq0DGgdh
         7CO9BtUO2wu3YIU6gUFKsi0Sa5jPJCrvDbdtxvMphLvbl+YsryCaVgBNlDieNSEgPbRl
         S/Ll9fuSpQD1euHgjIcxDPVaPW0Y0GIooVmOwMPEO/JEgZloJo0f2K38n6zOenql7kuA
         FkpYMHPTf965GAUZ2ASufymNmkWPtbxx9mUCf2a04OCgtAYr67E9xaX5cv62wXomdZ7P
         Krxg==
X-Forwarded-Encrypted: i=1; AFNElJ9Aq6OzJu4TQAYR4PnUXGOD8rIxxSKwX3PccrIHwon4qbtpoa39GxhYHSHV89viD8XCLCTJa+NbOCsg@vger.kernel.org
X-Gm-Message-State: AOJu0Yw3akmO1JkBhhTFoEI4iBiwNGWOwufE+AdkSv6//1MU+w1+YCeR
	gQHJI48nWbeRBhFtcEkm+euqNDDPQqzcuf99j4N/7Au3dWmWI0G1CUhC
X-Gm-Gg: Acq92OHruk3b8VFol0odvT4LlCasoMX27+scAEjo9dhtsCRiRlqOefqai1o0WB6KqAF
	dzPQ5z6+t8lM/+bgzNi7lXdcnEVx2j7/U/JfJdQHCR+aB1tBw3xXidnCL5wE0LjZ59zS6Vqnqn3
	fv/aYZd45axt2iK2ilzcpndm4rRV1FjZTnFSBmX8XBtLlTcFl2tYl3a45xeJ69me1HBqmeHtSqQ
	4u0truZ3IvADxUOWCf6eIRkWyNeMDAuum4EJi6kS6OEaB8ouNgt2fg+datjY98jWCAKV2ITNlXv
	n367rgoAhbGiJcki+NDWxc6vV+49050hZ6MEB6YTJA1tMrAMhAGLk4elPK4tpYiWShsTajztJLV
	8B7k06CTkUJlrfbssOBgN17jicjHNpmskCCWv8WOHgPNZGdeR+YxMDHNuzl1/dnabcy+cMqhdUm
	pPWrpjcuDIRU4exJGqc0H9DUPQWaxrizjRAY1VSwZYNAxjxurd4GYeCSoexejx0Irb
X-Received: by 2002:a05:7300:730c:b0:2ea:4228:ab11 with SMTP id 5a478bee46e88-30935239ec2mr7746477eec.3.1781583381482;
        Mon, 15 Jun 2026 21:16:21 -0700 (PDT)
Received: from google.com ([2a00:79e0:2ebe:8:3714:f5c2:9b83:3df1])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3081e92096esm17817625eec.15.2026.06.15.21.16.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 15 Jun 2026 21:16:20 -0700 (PDT)
Date: Mon, 15 Jun 2026 21:16:17 -0700
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: Svyatoslav Ryhel <clamor95@gmail.com>
Cc: linux-input@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Linus Walleij <linusw@kernel.org>
Subject: Re: [PATCH v5 2/2] Input: isa1200 - new driver for Imagis ISA1200
Message-ID: <ajDEsU8oZWT7KB9d@google.com>
References: <20260512102445.55372-1-clamor95@gmail.com>
 <20260512102445.55372-3-clamor95@gmail.com>
 <CAPVz0n3Dw6Vtqqn8if=MYkBbYittXqsBKbDvrs1ntbD5Zn6iig@mail.gmail.com>
 <CAPVz0n3iCSeT3xJ2XkwZ6PYofwSLkc0gfm+iYo4xbKBkAtihcQ@mail.gmail.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAPVz0n3iCSeT3xJ2XkwZ6PYofwSLkc0gfm+iYo4xbKBkAtihcQ@mail.gmail.com>

Hi Svyatoslav,

On Mon, Jun 15, 2026 at 09:19:27AM +0300, Svyatoslav Ryhel wrote:
> чт, 28 трав. 2026 р. о 08:38 Svyatoslav Ryhel <clamor95@gmail.com> пише:
> >
> > вт, 12 трав. 2026 р. о 13:24 Svyatoslav Ryhel <clamor95@gmail.com> пише:
> > >
> > > From: Linus Walleij <linusw@kernel.org>
> > >
> > > The ISA1200 is a haptic feedback unit from Imagis Technology using two
> > > motors for haptic feedback in mobile phones. Used in many mobile devices
> > > c. 2012 including Samsung Galxy S Advance GT-I9070 (Janice), Samsung Beam
> > > GT-I8350 (Gavini), LG Optimus 4X P880 and LG Optimus Vu P895.
> > >
> > > The exact datasheet for the ISA1200 is not available; all data was modeled
> > > based on available downstream kernel sources for various devices and
> > > fragments of information scattered across the internet.
> > >
> > > Tested-by: Linus Walleij <linusw@kernel.org> # GT-I9070 Janice
> > > Signed-off-by: Linus Walleij <linusw@kernel.org>
> > > Co-developed-by: Svyatoslav Ryhel <clamor95@gmail.com>
> > > Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
> > > ---
> > >  drivers/input/misc/Kconfig   |  12 +
> > >  drivers/input/misc/Makefile  |   1 +
> > >  drivers/input/misc/isa1200.c | 524 +++++++++++++++++++++++++++++++++++
> > >  3 files changed, 537 insertions(+)
> > >  create mode 100644 drivers/input/misc/isa1200.c
> > >
> >
> > Hello Dmitry! Do I need to make any further adjustments to this driver?
> 
> Hello Dmitry! Do I need to make any further adjustments to this
> driver? This driver is hanging in LKML for some time already without
> responds from input maintainer. It is still relevant and I would like
> it to move forward.

There were valid sashiko comments on the patch regarding resetting
"level" to 0 and also potential racing conditions, as well as suggestion
to check number of gpios specified in the device tree.

Please see if the following works for you:

diff --git a/drivers/input/misc/isa1200.c b/drivers/input/misc/isa1200.c
index ff82252a08e1..c61adc4b605c 100644
--- a/drivers/input/misc/isa1200.c
+++ b/drivers/input/misc/isa1200.c
@@ -131,6 +131,7 @@ struct isa1200 {
 	struct work_struct play_work;
 	struct isa1200_config config;
 
+	bool suspended;
 	bool active;
 	int level;
 };
@@ -247,17 +248,21 @@ static void isa1200_stop(struct isa1200 *isa)
 			       isa->supplies);
 
 	isa->active = false;
-	isa->level = 0;
 }
 
 static void isa1200_play_work(struct work_struct *work)
 {
 	struct isa1200 *isa = container_of(work, struct isa1200, play_work);
-
-	if (isa->level)
-		isa1200_start(isa);
-	else
-		isa1200_stop(isa);
+	struct input_dev *input = isa->input;
+
+	scoped_guard(mutex_try, &input->mutex) {
+		if (!isa->suspended) {
+			if (isa->level)
+				isa1200_start(isa);
+			else
+				isa1200_stop(isa);
+		}
+	}
 }
 
 static int isa1200_vibrator_play_effect(struct input_dev *input, void *data,
@@ -280,7 +285,8 @@ static int isa1200_vibrator_play_effect(struct input_dev *input, void *data,
 
 	if (isa->level != level) {
 		isa->level = level;
-		schedule_work(&isa->play_work);
+		if (!READ_ONCE(isa->suspended))
+			schedule_work(&isa->play_work);
 	}
 
 	return 0;
@@ -292,6 +298,7 @@ static void isa1200_vibrator_close(struct input_dev *input)
 
 	cancel_work_sync(&isa->play_work);
 	isa1200_stop(isa);
+	isa->level = 0;
 }
 
 static int isa1200_of_probe(struct i2c_client *client)
@@ -331,6 +338,9 @@ static int isa1200_of_probe(struct i2c_client *client)
 		return dev_err_probe(dev, PTR_ERR(isa->enable_gpios),
 				     "failed to get enable gpios\n");
 
+	if (isa->enable_gpios && isa->enable_gpios->ndescs > ISA1200_EN_PINS_MAX)
+		return dev_err_probe(dev, -EINVAL, "too many enable gpios\n");
+
 	ldo_node = device_get_named_child_node(dev, "ldo");
 	if (!ldo_node)
 		return dev_err_probe(dev, -ENODEV,
@@ -479,9 +489,9 @@ static int isa1200_suspend(struct device *dev)
 	guard(mutex)(&isa->input->mutex);
 
 	if (input_device_enabled(isa->input)) {
+		WRITE_ONCE(isa->suspended, true);
 		cancel_work_sync(&isa->play_work);
-		if (isa->level)
-			isa1200_stop(isa);
+		isa1200_stop(isa);
 	}
 
 	return 0;
@@ -493,9 +503,11 @@ static int isa1200_resume(struct device *dev)
 
 	guard(mutex)(&isa->input->mutex);
 
-	if (input_device_enabled(isa->input))
+	if (input_device_enabled(isa->input)) {
+		WRITE_ONCE(isa->suspended, false);
 		if (isa->level)
-			isa1200_start(isa);
+			schedule_work(&isa->play_work);
+	}
 
 	return 0;
 }

-- 
Dmitry
