Received: from mail-pf1-f174.google.com (mail-pf1-f174.google.com [209.85.210.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 74587357CF8
	for <devicetree@vger.kernel.org>; Wed, 13 May 2026 04:50:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778647814; cv=none; b=SBWckUoBl8NYykEjvN79YP0XxddjvihJltHkYZnCpbvn927kNgz97UyLIrKedzy7/IDw5b6Yz3Z5x0Meu3wVaWAeqoLSlqboLqGVuRHwW4CnMn3WOZJoNIOqSTqYWAWIDg/mQs4RnTr3t6EdBFM1XfDCgK1+5mDb5mwhYr7fz64=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778647814; c=relaxed/simple;
	bh=tgUlyJjbrsKtJEn1UZKio0glqU4Bcdo3vZkqYUogHaA=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=p4fzilBRHA6V99gw3vlPrA/+MBmZnACD//mOTXaHc5j4CO004yHhMCQT/nySoJQqlOfQ/q1ARsLDttxGpWaj0K8m6sVN+Wgq54nto83Uu/IxP0C84cd4obHRZpXZgGu2qWv+fnTEaPS2WXl+slBbNY5AgmrdXJPvXK6VZ3SOPf8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=aSDLKxH2; arc=none smtp.client-ip=209.85.210.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="aSDLKxH2"
Received: by mail-pf1-f174.google.com with SMTP id d2e1a72fcca58-824c9da9928so2961358b3a.3
        for <devicetree@vger.kernel.org>; Tue, 12 May 2026 21:50:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778647810; x=1779252610; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=vhcAeUDFPuM5b+QyEqT1qFeyobx3xcRvN5AVcMGYpJE=;
        b=aSDLKxH2FExGDRQuMa7EOKiwm3gW13IYnqGEOUfr0Mdd5PGGDB3DxLbHAtJ6JVgX2e
         +WMR99mEjFnf3BiGxL+G7FHR0beS9Sp16CC3VtPC2vI2ogMN1cxCJDxbVeLWUxzs7Dwn
         FOUmhocpMZ2QLgm5G52L8/9XeoU+WRax7NHdV6rieJZRB9tAMTywoeeidT6psx4clU5i
         CDOi0GGiqCpWlS8wPs01vej/3vZZVM/7Fk9w1fIMR2eYZiSh/ferTU9lFjcNV3xzw60j
         s637Q3dTOdwW+QZBpWbfm/Rls1WfkdqwilaRCOoKYeFgl27TL3CKvbsoLJCUJmEA51t0
         f/gA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778647811; x=1779252611;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vhcAeUDFPuM5b+QyEqT1qFeyobx3xcRvN5AVcMGYpJE=;
        b=U8mD5x+D1vJwq3fBf3qwrhaSxU1WGIJZpn8qpq4OpNgdrgVifLLsGtqLDVMmXk+1il
         D53lXpbdlS16lNCFnXItzov5cmA0xKZ5Ii9sFjbNXHn2Gm3t2Waw8lKGdKJKkcR/Fymp
         vMM/g8M6j81Sh88vmPcf7bf/zuCQ5okroTaGhrEQMU+qUIsZd8m28lc61/Ud+dCzkPUw
         ezkRsOHB/1wE9nvfF4wO9gcHhZ1K93Fe90aJxjaSc0j/s8yqY/np1AmQXFO5/y8+Fc4t
         epXzJD+TxNwwSBLKjEOopBCDIXOn+YgeznUKjw3BHuKTck3ROG7udmDvk557JZCze/Yw
         vSKA==
X-Forwarded-Encrypted: i=1; AFNElJ+66geFR2QAfnrtsmRt/3izmqIku/QDaMqqPVTZfZBwmBLTa8P2qva0GigcNQPF6DyIhugglsAUn+2E@vger.kernel.org
X-Gm-Message-State: AOJu0YzMAb9xyhJ8GIkwIcxOyTVk4yP4C5JG/QJeAIHQvvTDMlQuRxK8
	fkUvycNUrSUxkvu2kgdWsTE06bZQXkd/s/aMUYKxroBQvcoOZhNTWH4+
X-Gm-Gg: Acq92OH9/aRKPJc1bC1eEAlOWGZ+R1EWlar/w9QJ35ZPvwskgw53FslFErzopajpd4g
	TrF08pfc5U7+jjYe/O7K8pH9NhvAVLbt3a8adqvwQdn8flA29m/5dxqJ4JzQmCxW/d9w/qO6V8t
	MxEEHse02C+ULTmYVjkzfocTg4FFtLjIO+6cyt5eu5zCO1MWVXnBBD5cuo++0tBPdWQRWIpmdtK
	9xyDfMCqzGe3smtHmQr/gv3NZNl/B3XOs0jIDeg8hIuA4dZsgKYde2oENR6IorlZLqh0XY8K6rr
	UXpM+KSwHspIMg1oOEAkA+cWENn5XpTfa8TumNEesYvz/qK9isoATWMQeYOTZV9GWzTyBvN+BFI
	xiEt5vKYwnt271HXpnQF9HS2b5v4iTP7TZLDpphv9bHN5RKQjx0CvHwhrep5YNk+seekoZMMu4i
	kf0tBIlVjqZpjtS8TvzCL85OTKHh4lhQ/Xd03V
X-Received: by 2002:a05:6a00:4403:b0:837:6bb9:acb7 with SMTP id d2e1a72fcca58-83f03c496aemr1638691b3a.0.1778647810595;
        Tue, 12 May 2026 21:50:10 -0700 (PDT)
Received: from [127.0.1.1] ([203.99.159.230])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-83965c30ddasm32311914b3a.21.2026.05.12.21.50.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 12 May 2026 21:50:10 -0700 (PDT)
From: Javier Carrasco <javier.carrasco.cruz@gmail.com>
Subject: [PATCH v2 0/4] iio: light: add support for veml6031x00 ALS series
Date: Wed, 13 May 2026 17:49:40 +1300
Message-Id: <20260513-veml6031x00-v2-0-4703ca661a1d@gmail.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-B4-Tracking: v=1; b=H4sIAOQCBGoC/1XMywqDMBCF4VeRWTdlEkPArvoexcVUJzrgpSQSL
 JJ3byrddPkfON8BkYNwhFt1QOAkUdalhLlU0I20DKykLw0GjdUaG5V4nhzWekdURI11dU/oLEF
 5vAJ72U/t0ZYeJW5reJ940t/15xj35yStUFnynpx5evb9fZhJpmu3ztDmnD8yPoI3pgAAAA==
To: Jonathan Cameron <jic23@kernel.org>, 
 Lars-Peter Clausen <lars@metafoo.de>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Rishi Gupta <gupt21@gmail.com>, 
 David Lechner <dlechner@baylibre.com>, 
 =?utf-8?q?Nuno_S=C3=A1?= <nuno.sa@analog.com>, 
 Andy Shevchenko <andy@kernel.org>, 
 Matti Vaittinen <mazziesaccount@gmail.com>
Cc: linux-iio@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, 
 Javier Carrasco <javier.carrasco.cruz@gmail.com>, 
 Jonathan Cameron <jic23@kernel.org>, Krzysztof Kozlowski <krzk@kernel.org>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1778647803; l=4923;
 i=javier.carrasco.cruz@gmail.com; s=20260111; h=from:subject:message-id;
 bh=tgUlyJjbrsKtJEn1UZKio0glqU4Bcdo3vZkqYUogHaA=;
 b=rIk/cDRH4Eu/wfynMlGZz4CUMg3NrqGBNElLBkDCGsA4QpCWvYAildGD5cbEPDX2DJg/Kuunz
 6OMyp2aqnV1CJcvwZpIMi22WRRmxMHcL1kri6j6Ex+7tsAwA1xwW6Dz
X-Developer-Key: i=javier.carrasco.cruz@gmail.com; a=ed25519;
 pk=Lge8w8xidNSf/INy7JAIbAW+Hezkp3nsBh2OjKL7lLU=

These ambient light sensors with I2C interface provide two light
channels (ALS and IR), high/low threshold alarms with configurable
persistence, and a data ready signal.

The devices covered by this driver have the same resolution, and they
share most of their functionality. These are the differences between
them (note that the x belongs to their names, and it is not a wildcard):

 - Device ID: accessible via two 8-byte registers, different values for
   veml6031x00/veml6031x01 and veml60311x00/veml60311x01.
 - I2C address: same grouping, 0x29 and 0x10 I2C addresses.
 - AEC qualification: AEC-Q100 for veml6031x00/veml60311x00 and
   AEC-Q101 for veml6031x01/veml60311x01.

The alarms and the data ready signals share the interrupt pin, and an
interrupt status register must be accessed to identify the source. Such
multiplexing is not new in IIO, and I have followed existing examples
for it. The persistence setting (own attribute) to trigger the alarms
uses the pattern that has already been used for the veml6030.

The device configuration is in general documented in the datasheet and
the application note. There is an exception, though: the activation of
the "active force" mode that is required for the data ready signal must
be carried out in two steps even though the affected bits are located in
the same register: first ALS_AF (active force mode enable) must be set,
and then ALS_TRIG (active force trigger setting) must be enabled. I have
added a brief commentary in the code to explain this behavior, which has
been confirmed by the manufacturer.

The only functionality that has not been implemented yet is the x0.66
gain (and its x0.165 counterpart when PD_DIV=1), which makes the gts
helpers less usable due to the conversions required. It is indeed an
uncommon gain to use (there are x0.5 and x0.125 gains) with no known
use-case at the moment that justifies making adjustments to the gts
helpers or adding artificial conversions to make it work.

This driver has been tested with the four supported devices separately
as well as in pairs where the I2C addresses don't overlap.

I found a couple of issues in veml6030.c while programming this new
driver, which shares some functionality with the former, and I added to
the patch stack.

To: Jonathan Cameron <jic23@kernel.org>
To: Lars-Peter Clausen <lars@metafoo.de>
To: Rob Herring <robh@kernel.org>
To: Krzysztof Kozlowski <krzk+dt@kernel.org>
To: Conor Dooley <conor+dt@kernel.org>
To: Rishi Gupta <gupt21@gmail.com>
To: David Lechner <dlechner@baylibre.com>
To: Nuno Sá <nuno.sa@analog.com>
To: Andy Shevchenko <andy@kernel.org>
To: Matti Vaittinen <mazziesaccount@gmail.com>
Cc: linux-iio@vger.kernel.org
Cc: devicetree@vger.kernel.org
Cc: linux-kernel@vger.kernel.org
Cc: Jonathan Cameron <Jonathan.Cameron@huawei.com>
Signed-off-by: Javier Carrasco <javier.carrasco.cruz@gmail.com>

Changes in v2:
- Add commit to fix bug in veml6030.c (channel type when pushing
  events) and remove dead code.
- Use gts helpers to simplify operations.
- Drop unused gain_idx.
- Build INT_MASK as an OR operation of the involved bits.
- Format arrays to follow the desired standard for IIO.
- Directly return function result as the last operation within another
  function instead of 'ret = x; if (ret) return ret; return 0;'.
- Fix some spacing (double space, tab for alignemnt in info struct).
- Use sizeof() for __le16 reg instead of 2.
- Return an error if the part ID could not be read.
- Spell out sd -> shutdown.
- Use devm_mutex_init() instead of mutex_init().
- Avoid using conditional guard, use claim/release instead.
- Access integration times from the global array to get and set the
  integration time instead of using a switch.
- Simplify read of available periods (persistence).
- Drop IRQF_TRIGGER_FALLING in the threaded irq request.
- Add regmap ranges.
- Link to v1: https://lore.kernel.org/r/20241126-veml6031x00-v1-0-4affa62bfefd@gmail.com

---
Javier Carrasco (4):
      iio: light: veml6030: remove unnecessary read of IT index
      iio: light: veml6030: fix channel type when pushing events
      dt-bindings: iio: light: veml6030: add veml6031x00 ALS series
      iio: light: add support for veml6031x00 ALS series

 .../bindings/iio/light/vishay,veml6030.yaml        |   23 +-
 MAINTAINERS                                        |    6 +
 drivers/iio/light/Kconfig                          |   14 +
 drivers/iio/light/Makefile                         |    1 +
 drivers/iio/light/veml6030.c                       |   14 +-
 drivers/iio/light/veml6031x00.c                    | 1193 ++++++++++++++++++++
 6 files changed, 1242 insertions(+), 9 deletions(-)
---
base-commit: 254f49634ee16a731174d2ae34bc50bd5f45e731
change-id: 20241109-veml6031x00-aa9463da064a

Best regards,
-- 
Javier Carrasco <javier.carrasco.cruz@gmail.com>

