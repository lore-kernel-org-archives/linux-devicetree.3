Received: from mail-yx1-f42.google.com (mail-yx1-f42.google.com [74.125.224.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1AB0849552D
	for <devicetree@vger.kernel.org>; Mon,  7 Sep 2026 12:29:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.224.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788784157; cv=none; b=TWsLJ3/JniLCEMYnF7PAKWZUS8AWHR3qb03KrJnsXrBo4LIwBWTJe7Ybj0cjEKGgs2oWVPUEPez4Muv8q//uHGsZEeX2e1rKrn4bOs6u2CKC9XavtEMjpSY1oJv0ae821PhbytdnUqaMvLos2eIoDpT8ZWQe/5QcYE8DYLD1bh4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788784157; c=relaxed/simple;
	bh=9BFM3aJZwwSAMWa894hh/FwIZhRlBHiI7TetRzJ6tNQ=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=XSFRhzH6AadslWPiMlWBf72qnwHuB28p6QPf6c+70V0i65Xe26O17KmFbexARjEDa3ZxcQWPHEzL6TNWbfDfXYLHhEZMhCyDpEhGugAudJ6+8Y0Vwn5abfdBZrTKjZWusVuFGE7YGfri792wakE8A1UBu9jzOtnClD/ENj/iIwY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ezEeTYQb; arc=none smtp.client-ip=74.125.224.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ezEeTYQb"
Received: by mail-yx1-f42.google.com with SMTP id 956f58d0204a3-66f79f58123so2847893d50.1
        for <devicetree@vger.kernel.org>; Mon, 07 Sep 2026 05:29:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788784152; x=1789388952; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=7BAuZNiA5/uluN+xTnwX3MbZRNEexczkRLqDb6knuzk=;
        b=ezEeTYQb4Aw1hOIdIcJ+VGstvaaznl1S12jDOZlL6RZZaIa8sFMsWMp2pu2qm8yMoZ
         Nr4aGBZet3bvMGBDKjH32ZPRU7KLh0qy81dhFQ9XPauLhoovkLeL3OqyWwUnr4Cn7aZn
         vkX0K4J6zfGmYJ0v8q+IVSvrvm7SFwc/gTX5E2xpkgKir5jqrrjvghfBOBysU28OTVJ0
         wx30LxdwBsC4qPwTvTuefnknMvRgZqFSUmQohVKpO0+eJreB381HGuAHyOtDV2Mz4KaN
         t2bMiK3CIepF1dYSaTIBUih5SJYADt17eoWx4brgIYxNueReQo0cZJhqq0IEpGmzu7fR
         U6AA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788784152; x=1789388952;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=7BAuZNiA5/uluN+xTnwX3MbZRNEexczkRLqDb6knuzk=;
        b=Y/DbIlL35Fe4f/gw5Udk1texrGzqHo7mM5nNLE8xaVAJFUUGCdjMiJT8ZVl2J1TMHE
         4NloyOTKFwznhK8GXQ8t0ew1uTbaeuTrNvIUB8Dr8vYbPUuxgKQ4cUmlKl+l8JFvFQx0
         hq2egW+NDJwN6CNq/hjBGrMls/GSzgABKM30MwnmhMC/ujmL8qMzfXqhqM4bKgSSkgk2
         OCiQvd/HnAmI037xSE4nakJ+IsY57baLv+p+Ao3xoqfUodTpVcyi5P19LTBwAW3gE4N7
         inVLq6o9ngMFGf/HbQiDaDKiXBZAKpINIre5c1Oxc32LHFk3f8o9tIiAZiR+PF4ZNnwm
         R3Zw==
X-Forwarded-Encrypted: i=1; AKwUvBwazgSl+nvpkb9fqm7YWcquo6/tfNoEmgOzuhzqIVfGT53ZAg1amPtnFHP0zbNV4zMo+6popShxcm/T@vger.kernel.org
X-Gm-Message-State: AFuF++nlv5szF89cKcrNeoqv/9phsUS+69IuvVCA9N3ffjak8E5K0cPD
	gRFW2s/Z7pMX5wBIkZ7VYw6F/0ONuZPSrGUEy6ok8Os40fe3yKd71PM=
X-Gm-Gg: AYBFou2MbCbnUYlVa892Nx4abkhRGzPM1wSTyAwuR0OuAu6tS+2YuCLmDQeDkp1ayr2
	Fluyy1lUaYxwwzvxCywHZRt5b95S221rl5od3wmea3QGD8EwGN0MJQ51kyeLOrh7igDylwrVRKJ
	3Lf/MftRyctIAqOfIDiAZWrgAqLChs6koDXkJg2aERAevWvAuI4/7wqX8E1Qke51LikxgfpO3vd
	3b4nv255UHBd9NUKXFzHgWLLKyUDvYiumugnh1FXQYafrjbCArBB4sEb6Acz3lvpM76JBgnJhjU
	w2V2ATWerN7xdzGUfIwRGzcqjF22w3YEjK3Q6EUJuYULiIR4TRBDJANr2+NmdpExYSXPBHrw/4J
	05X0mVOMa/At5uag493NZcLqo55fJWAIKgLoHT6qfrnKLi7lRTO8CWEsOiDyYp1Wpxqd2HghLjw
	OGoS8Sz53bmd2A7Iz26+hfw7XRXVcXzdUxQ5dqnfhQk9CPphzJkd3hVuEwL0F8BrCvUlxy5zjXJ
	g08l3N7qqDmVwhgBRKkqQOGkqLP0hO92QMphjPpLYSqD4Ay/Q==
X-Received: by 2002:a05:690e:b4a:b0:668:9fa5:b9cc with SMTP id 956f58d0204a3-66fc19c3cbcmr5343158d50.0.1788784151674;
        Mon, 07 Sep 2026 05:29:11 -0700 (PDT)
Received: from localhost.localdomain ([186.158.238.108])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-8714bb0efc1sm70511967b3.45.2026.09.07.05.29.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Sep 2026 05:29:10 -0700 (PDT)
From: =?UTF-8?q?Nicol=C3=A1s=20Antinori?= <nico.antinori.7@gmail.com>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: =?UTF-8?q?Nicol=C3=A1s=20Antinori?= <nico.antinori.7@gmail.com>,
	Brigham Campbell <me@brighamcampbell.com>,
	Christophe JAILLET <christophe.jaillet@wanadoo.fr>,
	Jori Koolstra <jkoolstra@xs4all.nl>,
	Shuah Khan <skhan@linuxfoundation.org>,
	devicetree@vger.kernel.org,
	dri-devel@lists.freedesktop.org,
	linux-kernel@vger.kernel.org,
	linux-kernel-mentees@lists.linux.dev
Subject: [PATCH v4 0/3] Add support for CH1115 Controller
Date: Mon,  7 Sep 2026 09:23:28 -0300
Message-ID: <cover.1788711082.git.nico.antinori.7@gmail.com>
X-Mailer: git-send-email 2.47.3
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

This series add support for the CH1115 Controller [1].
It is a monochrome dot matrix OLED controller that supports several
interfaces such as SPI and I2C.

This driver only supports the I2C interface, but all common parts could
easily be put into a common file to be used with other interfaces.
I only have I2C to test with.

This is the first driver I write. The work is based on the driver
located at:
- drivers/gpu/drm/sitronix/st7571-i2c.c
- drivers/gpu/drm/sitronix/st7571.c

Tested with Raspberry Pi 3b+.

Changelog:

v4:
General:
  - Patch series based in kernel v7.3-rc1
Driver:
  - Fixed nits found by Christophe JAILLET.
  - Fixed max_width and max_height in modeset to avoid having bigger
  framebuffers than resolution.

v3: [5]
- General:
  - Patch series based in kernel v7.2
- In dt-bindings:
  - Removed "chipwealth,contrast" property (added backlight_device
    support in driver's code)
  - Renamed "chipwealth,invert" -> "chipwealth,inverted"
  - Added default value to "chipwealth,offset"
  - Removed 'status = "okay"' from example
  - Indented example with 4 spaces as stated in the documentation [4]
- In driver code:
  - Added support for backlight_device
  - Replaced drm_dev_unregister with drm_dev_unplug to cover the dt
    overlay unload case
  - Executing drm shutdown operations before turning off the display
  - Checking that the width (panel-timing.hactive) and height
    (panel-timing.vactive) parameters are greater than 0

v2: [3]
- General:
  - Patch series based in kernel v7.2
- In dt-bindings:
  - Fixed linter problems
  - Replaced first_page property with offset
- In driver code:
  - Fixed dst_pitch calculation
  - Renamed file from ch1115.c to ch1115-i2c.c
  - Support flip-vertical and flip-horizontal dt properties
  - Fixed several things found by sashiko-ai

v1: [2]

[1] https://datasheet4u.com/download/1576606/CH1115.html
[2] https://lore.kernel.org/all/cover.1786110720.git.nico.antinori.7@gmail.com/
[3] https://lore.kernel.org/all/cover.1787321297.git.nico.antinori.7@gmail.com/
[4] https://docs.kernel.org/devicetree/bindings/writing-schema.html#annotated-example-schema
[5] https://lore.kernel.org/all/cover.1787973729.git.nico.antinori.7@gmail.com/

Nicolás Antinori (3):
  dt-bindings: display: add Chipwealth CH1115 OLED Controller
  drm/ch1115: add support for Chipwealth CH1115 OLED controller
  MAINTAINERS: add entry for Chipwealth CH1115 OLED Controller

 .../bindings/display/chipwealth,ch1115.yaml   |  81 ++
 .../devicetree/bindings/vendor-prefixes.yaml  |   2 +
 MAINTAINERS                                   |   6 +
 drivers/gpu/drm/Kconfig                       |   1 +
 drivers/gpu/drm/Makefile                      |   1 +
 drivers/gpu/drm/chipwealth/Kconfig            |  16 +
 drivers/gpu/drm/chipwealth/Makefile           |   3 +
 drivers/gpu/drm/chipwealth/ch1115-i2c.c       | 885 ++++++++++++++++++
 8 files changed, 995 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/display/chipwealth,ch1115.yaml
 create mode 100644 drivers/gpu/drm/chipwealth/Kconfig
 create mode 100644 drivers/gpu/drm/chipwealth/Makefile
 create mode 100644 drivers/gpu/drm/chipwealth/ch1115-i2c.c

--
2.47.3

