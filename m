Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DAD2D55C1B5
	for <devicetree@vger.kernel.org>; Wed, 14 Oct 2026 17:54:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792000471; cv=none; b=L3ufJij5YZER+x0JmFj7bQx2Wi7vdPBZ6fhMB7MNvs2Ufjz0BlZvVKTwDj3nipuSlnD9v5KbLnk4r4jS6VxqL8I6T801YRhXP+Bc+Zb0Sx6kEHvphfwkxvXwH8U7lBDDfyH0q7mJ4sCsoZBJrqpZkyLS+t+2l4at09whOoznFC4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792000471; c=relaxed/simple;
	bh=4Q9x85B+u2O/Pi81hqCjcDXvFbwBMdy3C9hmihEcj/Y=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=VsXx8Ds0XE8B48HoumB+n1q0zMlvwh/KOtT2tYqrfy5KvH78EeyiFOZQPNVgOnp1jU3dr9dQDS728QkY2lX0C61VeKl8wPmmlbLCON1q2dMlVUWV9zvxNqeUR3kFYZdAJ3JmZjzyIPRSu4+ZGdkA+PwYbQzYOzzjyOQu0za8OD0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=raspberrypi.com; spf=pass smtp.mailfrom=raspberrypi.com; dkim=pass (2048-bit key) header.d=raspberrypi.com header.i=@raspberrypi.com header.b=BVCkqGzV; arc=none smtp.client-ip=209.85.128.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=raspberrypi.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=raspberrypi.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=raspberrypi.com header.i=@raspberrypi.com header.b="BVCkqGzV"
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-4a171b677d2so27735665e9.0
        for <devicetree@vger.kernel.org>; Wed, 14 Oct 2026 10:54:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=raspberrypi.com; s=google; t=1792000468; x=1792605268; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=HmI/5n9gUhb/tFw9MZYgFeC0GDyMUCqwxBHlNCMJ30M=;
        b=BVCkqGzVWi1i4hbFVpRhDDpEOUUm9qu3yxw2wBUClgqXmUm3chiTHNa+yrCjR/FZKm
         Cvv3uku9OUfWFCJZrJAuUzUINeWjMuMwzpfq+yfKlqaOj6gYaoz3L33uI+nfWcPUvTvS
         DZ0yFG7T5kSQI0ovPkUS2mhI50FS719w+xZenWUfHGHs7fUypypHUAoHxeZIs1qKDVx6
         s7KQ7/+g9Dj4ZtS+cppHyJINFohCTAwE6iJhtuTggIq/tDnub/F9MddTotSWcH1iEPU8
         xVYOaEX3iaFEcdKfeKEhL5zGugT5MzO6+8AUBNgJMMAJ+RdS3G3IuvBszirknZtrl0qu
         c9Xw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792000468; x=1792605268;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=HmI/5n9gUhb/tFw9MZYgFeC0GDyMUCqwxBHlNCMJ30M=;
        b=UXK3X/fmPhmbUT9+CYUkyTVG2E3Sy4tsZmT6HWe7MArLOhtpv7R141wo+GyaW0I635
         t0DlC1cQll+1zymu3W8jbZTTROg7gZrzaHq42/oKW9fSEWeseXyCtqZQnvP15g4GIBMC
         5iwelIsGw/GsAPDvTdzF6uVR+cWbKF6WSaJnJiuwxQJerQvv5x1bnHsZfzCwFosxtJOX
         8PH16EJzc6/8mLj4kNZxVLnKpZ5xLozmsR7auXZIQ/PzR+UQS40i7GhPaP7MOu5S2ayi
         OuUdcxBrdd6cHeAOxoD4tI1hrerW/0StCzd2NSgb+Evm/rRsSo/gpxcomY+3n5foZ3wH
         uKgw==
X-Forwarded-Encrypted: i=1; AKwUvBwYf8fLJQbMZs3hqfhp6p6O+s9nN617oJjgcHcpIvnWLNMarieizj3bp8gdg4P6MLFPN6/+ZIcl7EaN@vger.kernel.org
X-Gm-Message-State: AFq9FYIKdau4cnSaSNsLHUNJjR+xBNf0FUbXgCyORyVFgXa8ogQ10hb5
	4fXBuLGrgQYOIbfJZbgNJAmZ/RKcvKKVH9y0WvB8uXTKozDx5ENxIGSFXQB4M45lKIPCGEmMRRo
	o9iXrLmY=
X-Gm-Gg: AYBFou3M5yJlIdjq9Z/oAx2ytalg4D7T1Q/eUPvpO25ewl5iXqAVEedivU4182bgKPT
	3qbPkoAfK54rrcP1am7TIUGEvMv8yp3yfmnB5QF7BkOZM/7pfEExP5+ZNjh9BksniJI1uJW5Lw+
	rbsDjHG9GM+xRn/rFgaSvDnh1LbULLenlchd4vpHxDc72CGKuzPcgxhw4q0GV+t5cxohnBMSbt8
	81PMrPcv3rOkqwdQ3E/QN3W04bRcDXu7UPbhN+9Fu0awMf0chSgXzQKW3JysyheIN5YRCd1Mh7h
	aWGtZvlkHL8K+MQbUeqSTZ5yPZ0toN8JrmMYg7OSlzxfp+EKRjFnMOCQ4l3gB6bJFWOoSVXATzV
	hhBIhxyHn4xZCcCcQWfOUz205wgRPWO5BgJyeffhlpp2BxMfx8k+8/ovIg5wz/Oz93nQN+IGDnJ
	XQs3vyf2ya2kcOvpTm4tMhn+OPOWlqs+SWxlL3t+zQ/1i4sWCpGpHK/iuQUqfUkkmaSgUaK/6cP
	lCSQOa3kTIHuevLU3JEeguefbDsxKh/P+9hotuNo1H3KOxZQw==
X-Received: by 2002:a05:600c:348d:b0:4a1:813f:2a63 with SMTP id 5b1f17b1804b1-4a18e4aa26amr313644715e9.18.1792000468104;
        Wed, 14 Oct 2026 10:54:28 -0700 (PDT)
Received: from [127.0.1.1] ([2a00:1098:3142:e::8])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-4a1bd986095sm8188395e9.7.2026.10.14.10.54.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Oct 2026 10:54:27 -0700 (PDT)
From: Dave Stevenson <dave.stevenson@raspberrypi.com>
Subject: [PATCH v3 00/14] Update imx678 to act as a common Sony Starvis 2
 driver.
Date: Wed, 14 Oct 2026 18:54:21 +0100
Message-Id: <20261014-media-starvis2-v3-0-c958362b5d06@raspberrypi.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAM3Bz2oC/2XMTQrCMBCG4auUrI1MpklbXXkPcTFtR5tFf5iUQ
 Cm5u0HQhV0NH8z77CqweA7qWuxKOPrg5ymP8lSobqDpxdr3eSsErKABq0fuPemwkuRn1JUj13Y
 WXFtblaPBh3WW7eNFk8/9m7r/NBoN+mK4YcvE1j5vQmFpWWRb/LmbR/XIYMQfYsCUBwQzUlY11
 Ig9OqAjklJ6A5SPt0HnAAAA
To: Sakari Ailus <sakari.ailus@linux.intel.com>, 
 Jai Luthra <jai.luthra@ideasonboard.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
 Alexander Shiyan <eagle.alexander923@gmail.com>, 
 linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
 devicetree@vger.kernel.org, Dave Stevenson <dave.stevenson@raspberrypi.com>
X-Mailer: b4 0.14.1

The IMX678 (8MPix) driver has already been accepted into the
kernel.

Whilst preparing a patchset for IMX662 (1080p), I observed such
commonality between the two that it seemed sensible to attempt
a common driver rather than submitting a separate IMX662 series
again.

On checking my box of sensors, I found I had an IMX675 (5MPix) as
well, so that has been incorporated. Subsequently I was able to
add IMX585 (8MPix) and IMX832 (1080p).

The Sony datasheets are rather lacking on the limits for HMAX.
They list HMAX (and VMAX) values for nice round framerates at
a number of the supported link frequencies.
These limits have been adopted for IMX662 and IMX832, but for
IMX675 and IMX585 they have been determined empirically by
observing values of HMAX that start to introduce image issues.

Now cleaned up over the RFC V1.

Signed-off-by: Dave Stevenson <dave.stevenson@raspberrypi.com>
---
Changes in v3:
- Sorted compatibles list (Krzysztof)
- Corrected exposure limits for imx585 via parameterization (Jai)
Issues identified by Sashiko-bot
- Fixed the Kconfig for VIDEO_IMX678 still depending on GPIOLIB
- Removed the remnant build rule for imx678.o
- Fixed sending the common registers if CONFIG_PM is disabled.
- Fixed potential NULL deref and lockdep in link freq handling.
- Fixed the duplicated active_area definition for imx585
- Link to v2: https://lore.kernel.org/r/20261013-media-starvis2-v2-0-3670722d250a@raspberrypi.com

Changes in v2:
- Switched from an RFC to a patch set.
- Add the dtbinding changes.
- Added IMX832 and IMX585. Tested and fully working on all 5 modules.
- Updated 2 lane handling so that the higher link frequencies achieve
  the maximum frame rates.
- Adds a patch that corrects the minimum exposure time.
- Allow userspace selection of all link frequencies specified via DT
  (makes testing all the link frequency options far easier).
- Link to v1: https://lore.kernel.org/r/20260805-media-starvis2-v1-0-91e8e4eae44f@raspberrypi.com

---
Dave Stevenson (14):
      media: imx678: Rework into generic Starvis 2 sensor driver.
      media: sony-starvis2: Reorder link frequencies to remove lookup
      media: sony-starvis2: Always program the sensor in window mode
      media: sony-starvis2: Parameterise the configuration to allow for other models
      media: sony-starvis2: Rework 2 lane support for higher link freqs
      media: sony-starvis2: Allow runtime control of link frequency
      media: sony-starvis2: Correct the exposure range
      media: dt-bindings: sony,imx678: Add other Starvis 2 family members
      media: sony-starvis2: Add support for IMX662
      media: sony-starvis2: Add support for IMX675
      media: sony-starvis2: Add support for IMX832
      media: sony-starvis2: Only update bits for window mode
      media: sony-starvis2: Parameterise exposure min and step
      media: sony-starvis2: Add support for IMX585

 .../devicetree/bindings/media/i2c/sony,imx678.yaml |   38 +-
 MAINTAINERS                                        |   14 +-
 drivers/media/i2c/Kconfig                          |   19 +-
 drivers/media/i2c/Makefile                         |    2 +-
 drivers/media/i2c/imx678.c                         | 1447 ------------
 drivers/media/i2c/sony-starvis2.c                  | 2353 ++++++++++++++++++++
 6 files changed, 2407 insertions(+), 1466 deletions(-)
---
base-commit: d7e7bca7169873b46e857c025c10f3336c1258d8
change-id: 20260804-media-starvis2-65a5bc405b74

Best regards,
-- 
Dave Stevenson <dave.stevenson@raspberrypi.com>

