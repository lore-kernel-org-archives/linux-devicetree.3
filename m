Received: from mail-wm2-f13.google.com (mail-wm2-f13.google.com [74.125.225.141])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 90E1F48FF9E
	for <devicetree@vger.kernel.org>; Mon, 28 Sep 2026 09:43:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.141
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790588617; cv=none; b=YP2Z3uspMhkKZTRmgIB7EySCraVN64wlzTtdLcMITxWt6L72cEzBk94V329TjkO0IcIIXOujEKCEMC9tiV5uS7pIRCH8DdZz+CBiRi08LhxgLy0ds5PfdR8Yo6fzIj9ScmssMSJsF6AjW+bABCDg09rKLF/PmiUwmcydPzp6jzc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790588617; c=relaxed/simple;
	bh=1DSWDyEjxffgue1s2uWcGzCLbLWsu01OeWPHOjHFb6Y=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=BLT9ThvIZ4xbI4Coqou7PKGhArsdvCXckEorbCI8HY+fRPCcj/68lQFy68NWI+KtvpIIgn2pyh8WNcU4GAvocDzsklhroXqenBL/XRRDB28uOOuTOKXQKo6F/rTfS1gxyGFsp0uNYL4jqKTbLQt0r6eXJPqTcLj8U1SV/IzUIBA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=kaGhXEF+; arc=none smtp.client-ip=74.125.225.141
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="kaGhXEF+"
Received: by mail-wm2-f13.google.com with SMTP id 5b1f17b1804b1-49ce364488dso7654145e9.0
        for <devicetree@vger.kernel.org>; Mon, 28 Sep 2026 02:43:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790588613; x=1791193413; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=8boaKuPNh+9zMsA4O1T+2Mud6gQfFTCKzvkdhPNfUgQ=;
        b=kaGhXEF+HoOtTJDQqgspGAyXe/0vH/rXIrV6TuNmYVL6b3w5gb7/6p5bqK4UcJy0nx
         vGqCAq23xlrVQt6Y0j3Fi3yftoZ2ekmyI8Gwi8Dd3RJjQGPBDXz2J3dvbW6GPRFZ1/bn
         G3+JVLRCGUHAxmaJpRTvvZ7ncbDaZu/Uk5AzVsaLTuOAh4eN4vM6j1BzJIuCwjG04ZyI
         Q+CYIvppQ2ZxEt0pZlN+oZhxCrivVSSiiLvKdPENC7/2sR/7cdEzZB6qz/xunX0jLZku
         mDCC8XZzXtiweIqTuoW0kbcrrDexS2/4338pMhLjHvZjqs0tC70YScDfHoVBEL8TqO98
         zCDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790588613; x=1791193413;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=8boaKuPNh+9zMsA4O1T+2Mud6gQfFTCKzvkdhPNfUgQ=;
        b=mV1cyP1fNnAodTj65eUOLw44+9ZpblhBSlFkH6WK2qMr6lUX1IqfbaFaCNWixAEoSU
         o7zDVgnIW7umGvMIZtiNBx5dUR/xZE/GyyT+2i6adxOdVu6uR0BF9n/a/nHwm7K/TFkn
         IizE/o/+yG1AVBFlxp/04tInTJYCF0ucpNgE36r9UlczdWl1FX0jcmmdZQ1eTcbtuJfK
         CJPdA8pCGUGX7KDF6LR9ZdOMElHwBP9UJuA+aWYvhbgpZilRYRPbnDv6COjqydQ7POZn
         B9tbztZnPyWKFj1UF8QmO0eGGaawpiHTAY51yykZPHAwBxJlt0aCaAaV+bu9ipqtb7Pn
         3+5g==
X-Forwarded-Encrypted: i=1; AKwUvByCQbbqykPFpbHwlbbIXfyVa6OOiX8Y8C0NmYERt6q3M8VEn2t0wRs7mp18eg894Aoj9v0nmLB3Agis@vger.kernel.org
X-Gm-Message-State: AFuF++mbIMC4I4a6yt5z9yE0JD/qTTCCvxACDNKxyZ7WTKv44jvWkQf5
	afzGcbRL+DUI3RRX1UpM0yleILscIWciYfVGocj5/LxVupJ/dK0Q1FMl
X-Gm-Gg: AYBFou0PFUtnoaDUfjW+ax5s2bzarR12EwGxcwNANDMwLuhmjNueVeTjNymqPmGpylI
	2lN33qrslIqSgwjVmTOoNM2mVx1iKQdqnwq+b5GhcTIT8OIgwx4hiSIoD28W8wI7QU8DxzgOGNd
	N3ZXZZtVVwfYko398MdcVGl+uQci6sajwI688eJTueRQU3kk8DQmk5/+8bokpKXzRtIyuJJWXCd
	SZUp/pFkelio7Kp2A0p5mmnnmyJLltonTLewS1hdeifGn0JjXYVJ/A5+2iXzLrHzz0YvSUgW+8/
	2pmsaegaBCqNQxyi8rg8oAFjoerqqyT4BSTactlwsaprnlLOJXd+OgfweprP58hzTWBEkD7iyR5
	I3zwhlZbgr7X9m2N6Wt2vewAIT0GYsgmm4VsXnJu3NlO8fD40f7CJ+Qq+y6zjbX1tFjn4b5Mt7c
	sSh/Y6yYO03wMtB7O1WsvF6loPf8XgT6WzVqTb/rLL/2ruDgiWxkG0AD+t9Q22slZzWtRHuW/Ro
	AvLOv7Ywx+N7CILK1XXrYT2fDmC95FVtphgWrXgxww6
X-Received: by 2002:a05:600c:6986:b0:49f:c5aa:9ef4 with SMTP id 5b1f17b1804b1-49fe66d05d7mr204178585e9.8.1790588612595;
        Mon, 28 Sep 2026 02:43:32 -0700 (PDT)
Received: from rillian-arch.home ([2a00:23a8:8f4:6a01:5ffc:da36:c891:cd3c])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a0019057cfsm169401315e9.11.2026.09.28.02.43.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Sep 2026 02:43:32 -0700 (PDT)
From: Rillian Grant <rillian.grant@gmail.com>
To: Lee Jones <lee@kernel.org>,
	Pavel Machek <pavel@kernel.org>
Cc: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Ruslan Koreev <koreev.r@gmail.com>,
	linux-leds@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Rillian Grant <rillian.grant@gmail.com>
Subject: [PATCH v2 0/4] leds: flash: LM3643 dual LED flash driver
Date: Mon, 28 Sep 2026 10:42:33 +0100
Message-ID: <20260928094302.86966-1-rillian.grant@gmail.com>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This series adds a flash LED driver for the Texas Instruments
LM3643. I wrote it to support the Windows Hello NIR illuminator on my
ThinkPad X9-15 Gen 1, which has a single LED connected to both current
sources. The driver has also been tested by Ruslan Koreev on a ThinkPad
X1 Carbon Gen 14.

On both ThinkPad models the chip is described by ACPI but has no _DSD.
The original RFC asked how to supply the missing child nodes. This
series includes DMI-matched software nodes for both laptop models.

1/4 DT binding
2/4 driver
3/4 DMI match table and values for the X1 Carbon
4/4 DMI entry for the X9-15 Gen 1

Changes in v2:
- Rebased onto leds/for-leds-next
- dt-bindings: make flash-max-microamp, led-max-microamp and
  flash-max-timeout-us required
- driver: return device to standby state when the last output is
  switched off (squashed fix provided by Ruslan Koreev)
- New 3/4: DMI mechanism and entry for the X1 Carbon developed by
  Ruslan. Plus a minor update to provide a reg property for consistency
  with the DT bindings.
- New 4/4: DMI entry for the X9-15 Gen 1 and update struct names to be
  model-specific.

v1: https://lore.kernel.org/all/20260821083620.68324-1-rillian.grant@gmail.com/

Rillian Grant (3):
  dt-bindings: leds: Document TI LM3643 dual LED flash driver
  leds: flash: Add support for the TI LM3643 dual LED flash driver
  leds: flash: lm3643: Describe the LED on the Lenovo ThinkPad X9-15 Gen
    1

Ruslan Koreev (1):
  leds: flash: lm3643: Describe the LED of ACPI boards without LED nodes

 .../devicetree/bindings/leds/ti,lm3643.yaml   | 129 +++
 MAINTAINERS                                   |   7 +
 drivers/leds/flash/Kconfig                    |  12 +
 drivers/leds/flash/Makefile                   |   1 +
 drivers/leds/flash/leds-lm3643.c              | 919 ++++++++++++++++++
 5 files changed, 1068 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/leds/ti,lm3643.yaml
 create mode 100644 drivers/leds/flash/leds-lm3643.c


base-commit: 05b4738b0078f7d6f154f68068a11c8a0635e9df
-- 
2.55.0

