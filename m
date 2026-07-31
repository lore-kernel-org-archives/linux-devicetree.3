Received: from mail-pl1-f174.google.com (mail-pl1-f174.google.com [209.85.214.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D8B9F314A60
	for <devicetree@vger.kernel.org>; Fri, 31 Jul 2026 02:56:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785466593; cv=none; b=cUIR43OvS4qRpjZ9oDLb7ckIQAlHV3j3sjhnC7FNk+I0g4ih81tTxUQAhBash9p+bqfvT+HND3iQPgm+6z2WrOZ56Vz0QU/+FpES0bSIcrgokIxoER4IjcxPl0GZe2f1dVwo/bz6c+AgfYduTzdQYm+j5T/iaMqkk8tX1CByLzQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785466593; c=relaxed/simple;
	bh=KjZ+uACRxumlfzhanLvQ89GnZNvCbEi1KvNHScewSgg=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=AVSxVLNQsvkOet7gwqVl7lcpDGWbLP+afMnXJoeFlb2lpcaPjmhbnlmR1fvmyFXMXbO9lQ8oKsAZw5gIN5aa3X8HnQtSeO5wazG79cOqmlBDY95wsv4ls1jInV+dvd8owQ6KNIuXL1cxIGkWOfATrAEMImmu/nAfuHlIwKhwmyM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=oS5arSxX; arc=none smtp.client-ip=209.85.214.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="oS5arSxX"
Received: by mail-pl1-f174.google.com with SMTP id d9443c01a7336-2cc97653887so4953825ad.1
        for <devicetree@vger.kernel.org>; Thu, 30 Jul 2026 19:56:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785466591; x=1786071391; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=w0g6HPpKwMIM98vY4Fw9uAXjnXbrYgnR7YtUXIf+Ruo=;
        b=oS5arSxXcvumUQ5AaHMLJeHJsOJLgbjJ0S0le8ZON/DT1cfs5Ukhotg6h4XbbdoPUi
         6vbqJBdPOXgH7+tSF/YK+RWVg6C7EUo3ZyVC02NtRkPAWD5U+O4xwFwKw2tYiIpPPUtQ
         3uBWZfwil4ihuOQQB7Q7DJ6nH1PuXG4KuDHT8UYFu0QbYf3wqYDosbz3AFrL0ILkYEfL
         nOOblqM9+kMVHI2tBgNTfiPN7Ld7SnTGX3WGUdWHYZwaSIszKumGdvt9sU8iGJGqfR3m
         l2W492JtGMm6c/xB31/B7guD3i47cfgqIZ93177NnncIdT+hrhl7RSQdx6mXQMCSmL8J
         zrVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785466591; x=1786071391;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=w0g6HPpKwMIM98vY4Fw9uAXjnXbrYgnR7YtUXIf+Ruo=;
        b=NQa85Vm5GG4++D1JDvkDucFLcKzvvAY1zoMvGC+HTY3FDkBjnL/XuDRgz+akRXQmEl
         D3NWJhg08NscutG3mwbbS8PWW9qFq3oASEWdMSEbeZpxer+8uRVrI7WSIwOaFx22ObkG
         cKqlfvMW6qp5pxaN443ts/aZ6h99oS8abdQREjFjebFi9i8qCr0nHyqlAeDhOZ/bvAci
         pI9pXf7noxdyclSrM8O6Yvn54BRmt1a+VzFMRJ+YtQ4szE3kMO+e61O0vXPNnNm404bI
         U2TInjiyu9Jg9BtZ/X+tBp2sQMQ5GyUYYHJKPaNL4XaIOxT+gwT8sKqigv24mgB74JRm
         iNhw==
X-Forwarded-Encrypted: i=1; AHgh+RrBi2h5qxIL0d8+zPQ04kRs1O5B1vgkRaVtd7Tdizz224u26H+FnraV6lLfybWff1a9iCzYiyqov+Em@vger.kernel.org
X-Gm-Message-State: AOJu0YzKQbIhPeYVUX5OKrkQwIEd2xr3Zy1fassP+tTOlWgoT7mg+5/i
	TT3zl2tHf1x1GG1QnvdP29xcoMDpicFju4NdNmRHrJdcvqWj+NM1W+zJ
X-Gm-Gg: AR+sD10n+JMWHUTB38waSauFqfEEC9ZBKxeGrsdNelrO8qd0f5+rKlxvqNUqPwSmwJt
	X6UX9mE1GMI06qeomrZ0sUuL6giB/RrqL5SUezhqYvq6vlJndBDSE9yq1hCrm2DMq/Q4Hcp4lY2
	6tSGum97fov3E4EfeqN2hYXgOE9jgn8Pl44Mt3RUqUeQiDUMH5sJ6IxpbyVaoQg1rRhG86SuYop
	C+wo3//ckXslMy1b2A/DLMuMp/fui6XkDLG4UyCxzdEpmmoOzaPIcdXetI9DSuVZI7tumJ3O+R0
	DjKmYi/MwEOuPTOLBl0SaILF96z4g/oELru8b23BwNQ2NHcW4HvtMIK97eTyitwfIwbKCfokaCn
	QpeM4NGh7t/mCAcg2uLWpgkO2slqDc5OjIBnZaNv48kaKX4NfZKvOtgPjqE9WqV75QJvBmw4sS/
	KOnRpnd7YNvEuFqUKV1OdBEmVl/DfB5pwLYjzmaBDUY4cqYZsZeNLhgwobLW4Dd8tTo+HyohVVh
	urp4pG1K2ZW5JI3UJRfKheYLLKW
X-Received: by 2002:a17:903:2449:b0:2cf:906c:7d1 with SMTP id d9443c01a7336-2d046db7f95mr4374975ad.20.1785466591024;
        Thu, 30 Jul 2026 19:56:31 -0700 (PDT)
Received: from [127.0.1.1] (61-220-246-151.hinet-ip.hinet.net. [61.220.246.151])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2d0478d9da2sm753915ad.7.2026.07.30.19.56.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 Jul 2026 19:56:29 -0700 (PDT)
From: Kyle Hsieh <kylehsieh1995@gmail.com>
Subject: [PATCH v2 0/2] iio: adc: Add support for Texas Instruments
 ADS112C04
Date: Fri, 31 Jul 2026 10:58:23 +0800
Message-Id: <20260731-ti-ads112c04-driver-v2-0-aab0168c3c01@gmail.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAE8PbGoC/22NQQ6CMBBFr0Jm7Zi2VltdeQ/DotABJhFKWtJoC
 He3krhz+V7y318hUWRKcKtWiJQ5cZgKqEMF7eCmnpB9YVBCXYRRGhdG55OUqhUafeRMERsyZK9
 CG3vSUJZzpI5fe/VRFx44LSG+95Msv/bXs397WaJAbc7UkSbVGHvvR8fPYxtGqLdt+wAhsuPmt
 gAAAA==
X-Change-ID: 20260724-ti-ads112c04-driver-be7e89047834
To: Jonathan Cameron <jic23@kernel.org>, 
 David Lechner <dlechner@baylibre.com>, 
 =?utf-8?q?Nuno_S=C3=A1?= <nuno.sa@analog.com>, 
 Andy Shevchenko <andy@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>, 
 Mark Brown <broonie@kernel.org>
Cc: linux-iio@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Kyle Hsieh <kylehsieh1995@gmail.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=2243;
 i=kylehsieh1995@gmail.com; h=from:subject:message-id;
 bh=KjZ+uACRxumlfzhanLvQ89GnZNvCbEi1KvNHScewSgg=;
 b=owEBbQGS/pANAwAKAaWDQrcJVsSBAcsmYgBqbA9T8AWiWNqXcFaY47LrIpNPX5EHoLvgSa1br
 O9uveQDc+CJATMEAAEKAB0WIQTJHsaNZOdY+THGqJelg0K3CVbEgQUCamwPUwAKCRClg0K3CVbE
 gdlJCACOO3helD+XRRW279Sak7M4XJUADoFQT9V0a6+COMit3kC6bYAgtdA+ZldlMX8zZF+A3ad
 In8Aa5ZJLMXen/evkpiHTGUzwy68OfT1ppJWH1DhvndTlRAhel+VZl0AP2bc1CqgZjJQNS0l6nq
 y6YKgLcRRqTj5MypHQTYrO7n4tRBu9ff3CbXhl3OdK6MGSWbxPgfcVAGDi4A9lKfq0nFU95lvef
 tAZMZYhPsfkyZWSf/qAcfGtkFjGa7Q6QRa2VD3o0EOjMpwC4RNoh9iAF/rfCEluMX6yzjvG5H4I
 jO6I9dZ2C33cW795f8QU0LbXfM4lds+4qlCCfiHe54EcTXMD
X-Developer-Key: i=kylehsieh1995@gmail.com; a=openpgp;
 fpr=C91EC68D64E758F931C6A897A58342B70956C481

This patch series introduces support for the Texas Instruments ADS112C04
Analog-to-Digital Converters.

The ADS112C04 (16-bit) is precision, low-power, delta-sigma ADCs with
an I2C interface. They feature a flexible input multiplexer supporting
single-ended and differential measurements, a programmable gain amplifier,
and an internal voltage reference.

Note: While this chip shares similarities with the ADS112C14 (currently 
being upstreamed by David Lechner), the register maps and feature sets 
are sufficiently different to warrant a separate driver. However, the
DT bindings and channel parsing logic have been aligned with the
ADS112C14 conventions.

This initial submission provides a minimal feature set (single-shot 
conversions and basic DRDY interrupt) covering current use cases.

Signed-off-by: Kyle Hsieh <kylehsieh1995@gmail.com>
---
Changes in v2:
- Replaced `vref-supply` with `refp-supply` and `refn-supply` to accurately reflect hardware.
- Refactored the driver to dynamically parse channel configurations and routing from DT child nodes.
- Modernized the driver using kernel macros.
- Handled endianness elegantly.
- Added hardware reset fallback logic.
- Inherited IRQ trigger type from device tree instead of hardcoding.
- Fixed a bug where the MUX software cache could desync from hardware if the I2C write failed.
- Added strict return value checking for all I2C writes during probe.
- Updated the `i2c_device_id` array to use C99 named initializers.
- Link to v1: https://lore.kernel.org/r/20260728-ti-ads112c04-driver-v1-0-475efe4e2b78@gmail.com

---
Kyle Hsieh (2):
      dt-bindings: iio: adc: ti,ads112c04: Add binding for ADS112C04
      iio: adc: ti-ads112c04: Add support for TI ADS112C04

 .../devicetree/bindings/iio/adc/ti,ads112c04.yaml  | 122 +++++++
 drivers/iio/adc/Kconfig                            |  10 +
 drivers/iio/adc/Makefile                           |   1 +
 drivers/iio/adc/ti-ads112c04.c                     | 378 +++++++++++++++++++++
 4 files changed, 511 insertions(+)
---
base-commit: 4539944e515183668109bdf4d0c3d7d228383d88
change-id: 20260724-ti-ads112c04-driver-be7e89047834

Best regards,
-- 
Kyle Hsieh <kylehsieh1995@gmail.com>

