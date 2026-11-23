Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.45
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795456071;
	b=XaNcHM6guHlPw7a/jvNPie40w5rA5q2nMBoQlj3Hp48mxkn+Rwg5m29BFvPVvwriC3rj
	 y1g9swqDyyUOW8WwrLXk4W8cLJXJAcRdD4kgFpT6jXSGZdvcrvUggKyQoNZULsO7mik4m
	 tNNNrIkmfQzXzxhjXsUzebBKmGTJkmDFd6Ty1o5XS5Yb3sLjLcr+GRAZDF9Ffig7kjPDz
	 IiTbbVXBEZJ/A/kafuRjz+EY4LJxPCU7GeTH7c81SWMxAF4Mobq/+MxNvpu4EfEqoy5R1
	 PmTJE5SFlMBLi5iMlDnd4tIjBB10rZZOhYqmDNIN5Ca+IbByobxIwjVmxF8DQNGoj1A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795456071;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Subject:Date:Message-Id:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key;
	bh=3SFCTpsXzVu9L24h5eOoN/OnRI1ltlv/fyEoOIq1Vh4=;
	b=5CgsZCBQdDLkAvcmgana2dG+MNNAgE3ccWZ3lnMXFAYuV7a+jju62P13X10k/sd5C/KX
	 inFOy5XY/ATowKRLriu69Ro7phMeDIxbg1zFw/0CylnEMNvIDqnVZaOAwfyolxYuVw+H1
	 Mt46f9kotu4wOI/a1fUHX/t8OLWKFYOLYP+phr1zBsTq13cgb2kqkjBhbIW8guCd0jXBz
	 rSvRLdGKZiHZ5NJbyvjVDEEQY8zxDXrFL3cKSKQAteqpVpLjWbsONFWeNLAc+8DlqoA4x
	 dBsXTAVlsnQbp7rYiRzGLnisCbKsj6Vs+Yc3L0dSoof5UPo/AJHbXJgpDtVACTUscYw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linaro.org;
	spf=pass smtp.mailfrom=linaro.org;
	dkim=pass header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=U+IQxs1G;
	arc=none smtp.remote-ip=209.85.221.45
Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1B397606A327
	for <devicetree@vger.kernel.org>; Mon, 23 Nov 2026 17:47:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1B397606A327
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=U+IQxs1G
Received: by mail-wr1-f45.google.com with SMTP id ffacd0b85a97d-490d59c3f0aso1674548f8f.1
        for <devicetree@vger.kernel.org>; Mon, 23 Nov 2026 09:47:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1795456068; x=1796060868; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=3SFCTpsXzVu9L24h5eOoN/OnRI1ltlv/fyEoOIq1Vh4=;
        b=U+IQxs1GKDvW3M9Y/UbUGsKdZRoZFtbEvSqqT95YDMRKiDG7HAnbQ+pzplz96waAv/
         SznpgJi9eUQHUnkjgupOjU1OQxGFINTE4hDZHaN539qZTEZMFI8Akdd50/MlW3RBd3D6
         5JxVvyDXxADKggoD9etBTeB/fHlsnQniBd1OCUYSpNacy5Xbz+t3VI+24eggs+Btmqwb
         XoogKdYSQzl/P10UsJH6Pcggzpyx9smCgfSRO3dZ2kgDApusETWuWmmDYo+B2pcnrazr
         ymkayMK81wya4ljRvf/l7+Uyk1jrIWRivSq0SeGTBTdPaHWstBiulyrBQqZhtQFQXV+c
         zc5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795456068; x=1796060868;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=3SFCTpsXzVu9L24h5eOoN/OnRI1ltlv/fyEoOIq1Vh4=;
        b=ECqEqE1PfjIiZ2/cb8oBYnSAJwJ0CsoZLv5lA2Hts8bxwKfiQDyikUbKdptYdn2uzs
         g/genND9Xn2m30T9fzeJzwttuj+mhhxVkc3taHvLKibSWFA155k6JqjydFp6aDSTPZHq
         jmxA3WSFqyloLlQi5vYfXGj8Cla1CTUkAHD0ZJ3rGWcrlSMv/WJYsg0IcLCVlrAEn4GR
         zXa8h0KpxLnNuRPdouJ+5XFOUnsgfSQbMA6e7quSYqN/TaCXY30VZq2kGEtDmFpmgkZK
         hEnBzDmkuooWm/uG/8sKPXRm9e8JRAbHy4ZOEUOa4phOHsB9DkLHg6J5RrhdI09ICd+G
         ZdUg==
X-Forwarded-Encrypted: i=1; AL+hErGPkVL3zFRtJGih95zNeBwp2EOdl+kOjHaaXaFESOa+/rCnMLs04qnrejsF5AYFgyREzMiAVgoqvW4X@vger.kernel.org
X-Gm-Message-State: APuU4Z8w2Yr7RW+x4NybSyxwYFBgzVqBqA8tjdwgrQUgREgOTChqc+fo
	MT4HUiA5PQl5vASCuMinOegtMvfZB6teY8Gn/9j/OkoTbZhavR/dMMczmeLWHfKMyZFp1cD251u
	NnuyBh3E=
X-Gm-Gg: AZFdTZfA195mtPQ7sahZ2tj3AcqqEcajZxdfHEZT26VVFeS4LB4yivTsMYMgUhYKjPa
	L33IQLkHjwJ21iwmu7q6dcQDgs2Ylt2oQnPZZG5i4hDIKTrx2nYEm6+dHouZcDTT3b/bBXlfCBI
	Sd000MZNur+JQemHTAanDy3cXUmEpKzX6W2XWzFK/MBTdf+192yVcPBv0+8qTx8489+T5R3BApm
	V3uyORH/prINFgCgHPu5V4PA7aza5TSsdFV2O9G+sbNxGeKRzl6SmFDjz1CXenBXCN3Bb+3q1RQ
	fFbACe8SWgSWrDEWThJJhp7F9wKZbkUiDPPupLWZ74BkgeEl/4U4QuS9/HrDvXWhkgaBwzW5eYA
	RdxpfUQ2tsnqr9Oo36BB+DjgCdiAmDD/he8/rNGlVDa0P8TczEq2o0RkWsACzYqz4WFdrmRN/Xm
	RBd1MCxJ0XXkU8GkOoRZxKsTc8491bwAZtjeKh8L/EoCMmRKhEjMwo8VSlS+72W3QzaxasRAAny
	BYaYw6bDuEGDdKhFt1bFx28eN4Crjb10XjLpdcKqZ/6SCK8085dBycAwSrD2FUS4oW5xpHViDg+
	9CDvjQoDpWKNQ9KaB7dcN5VQrho8PMfiJVdmqWww30Bc9n4mWdI=
X-Received: by 2002:a05:6000:184a:b0:48d:fd4d:7fbe with SMTP id ffacd0b85a97d-4abad6a42f2mr22588666f8f.2.1795456068023;
        Mon, 23 Nov 2026 09:47:48 -0800 (PST)
Received: from arrakeen.starnux.net ([2a01:e0a:106d:1080:8261:5fff:fe11:bdda])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4ab6bc8ce06sm22961413f8f.47.2026.11.23.09.47.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Nov 2026 09:47:47 -0800 (PST)
From: Neil Armstrong <neil.armstrong@linaro.org>
Subject: [PATCH v7 0/3] iio: adc: add support for the MAX34417 Four-Channel
 High Dynamic Range Power Accumulator
Date: Mon, 23 Nov 2026 18:47:43 +0100
Message-Id: <20261123-topic-sm8x50-iio-max34417-adc-v7-0-d8f87edc5086@linaro.org>
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
Content-Transfer-Encoding: 8bit
X-B4-Tracking: v=1; b=H4sIAD98BGsC/43P3UrEMBAF4FdZcm0kmfy02SvfQ7xI0sluxG2Wp
 JbK0nc3XUErFerlgcM3Z26kYI5YyPFwIxnHWGLqa2geDsSfbX9CGruaCTDQzICgQ7pGT8ulnRS
 jMSZ6sZOQkjfUdp4CM9i2TAkRHKnGNWOI091/fvnK5d29oh8WdGmcYxlS/rgPGPnS+++tkVNGJ
 e+ks9wFL/nTW+xtTo8pn8hybIQ1J/c4qJyxrHaxgaD8hhPfHGd8d52oXCc0kxalBTAbTq44aPc
 4uXD1VRsEomFiw6kfrnp7nKocC8EqVAG6P57Va07tcbpyWjiJLTRGi9/r5nn+BHzqMBZoAgAA
X-Change-ID: 20260923-topic-sm8x50-iio-max34417-adc-209e880533fb
To: Jonathan Cameron <jic23@kernel.org>, 
 David Lechner <dlechner@baylibre.com>, 
 =?utf-8?q?Nuno_S=C3=A1?= <nuno.sa@analog.com>, 
 Andy Shevchenko <andy@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Michael Hennerich <Michael.Hennerich@analog.com>
Cc: linux-iio@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-hwmon@vger.kernel.org, 
 Neil Armstrong <neil.armstrong@linaro.org>, linux@analog.com, 
 Conor Dooley <conor.dooley@microchip.com>, 
 Marius Cristea <marius.cristea@microchip.com>, 
 Andy Shevchenko <andriy.shevchenko@intel.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=7891;
 i=neil.armstrong@linaro.org; h=from:subject:message-id;
 bh=XiFO3zR+OQyb6rGQXtK/oWjVq2e64t3HQFSFEW5ijyg=;
 b=owEBbQKS/ZANAwAKAXfc29rIyEnRAcsmYgBrBHxBqJH+qj33jHDnB6MoOR/s8+YbP3BfJKpXlvF3
 EHQpBvCJAjMEAAEKAB0WIQQ9U8YmyFYF/h30LIt33NvayMhJ0QUCawR8QQAKCRB33NvayMhJ0XqbEA
 CLpntYJZNHXLwpH93SlIh8iXSHg45Q3BAdYDRlJ8B8bWeXtAe+btc+WlPS+Mvf2rm8iwjjRO7ehwKg
 U+WBmbL9/TZmJIDRrwO1M4DGWndqSGvz1VQep7XOrTBk11xVTVsQzn7cVbSDMNK4mj9ufrHdNVocTH
 CaZR9KoA2yZt6gTCxCFIRe++Hxo1lCY2qn6QQwn8Pu0SLMdwIU+OOZspPYxg1SrAYtU5qk9q+TB/G0
 Hhs05qat7drfPhRwqosWIwCSOBEFsnLLuiE8l/JqoLDMf870x3KaCS0OZKvNezRqGEpMupMem1u9Hz
 I/O9ALb8IScRotOv0j/6GvHEtiDK++78i6DEAl/RJbbpOwTK+Idmm0Fl7rcdNGMb1pIyPoAw52Fbht
 QXkd+xpczK2bplXJOA44zmLpkvGvCp897mrN8ao4OBwW6tXxz9EHbBd0iYpOD1wDoQsu1CXOwbFxnu
 7oZSm7gEq97bhX3LKdu6oZXzyBT1P6GB544i2bXdGFIRmH7B4FX22hGeYuHFBxSJVFhuuSlBvtHeWo
 yMDkx8ffh3gBRqYTfWzTOX7ZorccPTXHWH0IhpnaZCcNjxhVOkF/5jBGPY9nr6fM17wNVc0J71DlyP
 oWeW3nfw/ppaM8WNCsyS4zAhjELGRb/FuNgn+WejX8yF2KYyopxyKvXtDl1A==
X-Developer-Key: i=neil.armstrong@linaro.org; a=openpgp;
 fpr=89EC3D058446217450F22848169AB7B1A4CFF8AE

The MAX34417 is a specialized current and voltage monitor used to
determine power consumption of portable systems. The driver supports
getting the channels voltage, average power and accumulated average
power and energy over an I2C/SMBUS serial interface.

The MAX34417 datasheet only specified on how to calculate the
accumulated average power, but with the Sample Per Second rate
we can easily get accumulated Energy in Joules.

By default the IIO driver only supports single-shot Voltage
and Power sensing, but the accumulation can be enabled by
enabling the Energy IIO channel which then enables the
Continuous Accumulation Mode.

The counter is common to all channels, so when reading a single
channel we will copy all accumulators to registers, so in order
to permit reading individual channels we must accumulate the
other channels in the driver when Continuous Accumulation Mode
is enabled.

The get_unaligned_be56() helper is added since we effectly
get an unaligned 56bit value from the HW.

While Analog Devices originally provided an HWMON driver for this
IC, using IIO makes much more sense because it provides
much more flexibility to support getting the power values
and will make it easier to support trigger to dump all
channels in a single shot and then support the Bulk Update
feature to update all MAX34417 on the same bus via the
trigger mechanism.

The v3 implementation has been completely revised since
v1/v2 to better match the capabilities of the MAX34417.

Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
---
Changes in v7:
- Added _UOHM suffix to RSENSE defines and drop comment
- Rewrapped all comments to all go up to 85 chars
- Separated the delta_us declaration and allocation
- Now returns IIO_VAL_DECIMAL64_FEMTO for ENERGY scale to avoid loss of precision now we return Joules
- Added local propname in probe to simplify code parsing DT
- Dropped single-shot accumulation, now we accumulate in sw until energy channel is disabled
- Overflow and acc_count is for all channels, and an overflow on any variable will error until disabled
- Added TODOs to explain how to make capture longer and properly handle HW overflow
- Link to v6: https://patch.msgid.link/20261105-topic-sm8x50-iio-max34417-adc-v6-0-63b4e8279633@linaro.org

Changes in v6:
- Fixed sashiko comments
  - Fixed the binding example indentation
  - Added a timestamp to make sure we don't call UPDATE in less than 1ms
  - Switched ENERGY to return Joules instead of mJ, simplifying the scale formlula and use IIO_VAL_FRACTIONAL_LOG2
- Dropped using SMM and using the default mode, simplifies the process for same result
- Added software overflow check
- Switch to s64/s32 everywhere to make sure we don't mess the sign since we return signed int values
- Added readable_noinc_reg to mark the data regs as noinc
- Added explicit comments on the OVF check, UPDATE sequencing and byte0 content
- Dropped the channel type in the channel label
- Moved the DT channel probe into a separate function
- Link to v5: https://patch.msgid.link/20261102-topic-sm8x50-iio-max34417-adc-v5-0-0ffa5e5f2d5c@linaro.org

Changes in v5:
- Collected review tags
- Fixed patch 2 commit message
- Added sysfs.h include
- Finished all struct max34417_data with .
- Added explicit MAX34417_CONTROL_REG: to is_volatile callback
- Added local *map to all functions, shortening regmap calls
- Explicited the 1ms UPDATE delay for manual mode
- Simplified max34417_check_ovf logic
- Simplified acc_count == 0 logic
- Used iio_val_s64_decompose
- Used regmap_update_bits to compine regmap clear and set
- Added switch instead of if/else for IIO_CHAN_INFO_SCALE
- Changed max34417_calc_input_correction comment and return type
- Switch to rsense_uOhm
- Return -ECHRNG for invalide channel count
- Link to v4: https://patch.msgid.link/20261028-topic-sm8x50-iio-max34417-adc-v4-0-d4baaf3ee903@linaro.org

Changes in v4:
- Fix bindings with Conor review on v2
 - Rename to Analog Devices and "adi" prefix
 - Move reg before #*-cells
 - Remove "label: true"
 - Make supplies required
 - Update DT example
- Rebase on linux-next
- Fix RSENSE defines
- Drop dev from max34417_data struct
- Move acc_count to u64
- Add regmap writeable/readable/volatile callbacks
- Use regmap_set/clear_bits() when needed
- Fix MAX34417_CHANNEL layout
- Drop useless comments
- Move i in the "for (int i...") and use i++ instead of ++i
- Move mutex guard into iio callbacks
- Use lower_32_bits/upper_32_bits instead of FIELD_GET()
- Use div_u64() when returning the Power scale to make sure it runs on 32bit systems
- Reorganize the get_label() callback
- Use devm_mutex_init
- Drop fwnode_property_present(node, "reg") before getting reg
- Rename rsense variable to rsense_microOhm
- Drop !rsense test
- Register iio device after device init
- Add comment about supporting MAX34407
- Link to v3: https://patch.msgid.link/20261013-topic-sm8x50-iio-max34417-adc-v3-0-d3604ae4a229@linaro.org

Changes in v3:
- Implement Continuous Accumulate Mode and default to single-shot mode
- Fix includes
- Better define Rsense and default rsensd in driver & bindings
- Define all read length and offsets
- Define the SPS bits
- Fix comments first letters
- Fix max register
- Add ENERGY channel with shared enable for Continuous Accumulate Mode
- By default reset the MAX34417 counters for each readout to do a single-shot measure
- Handle zero counter
- Add get_unaligned_be56
- Use get_unaligned_* macros
- Better handle the DT properties and report errors
- Reset the MAX34417 at the end of probe
- Link to v2: https://patch.msgid.link/20260924-topic-sm8x50-iio-max34417-adc-v2-0-9a0609e72f5c@linaro.org

Changes in v2:
- switch to shunt-resistor-micro-ohms no more required
- removed gpio.h from example
- Fixed max34417->MAX34417 in Kconfig and comments
- Added missing includes and remove unneeded
- Fixed typos in comments
- Switched to fsleep()
- Better aligned max34417_read_power declararation
- Handled 0 acc_count
- Switched to GENMASK_ULL() for 32bits systems
- Added missing empty lines
- Moved the input correction into a helper
- Set default input correction for all channels
- Switched to dev_err_probe() to return from probe
- Switched to device_for_each_child_node_scoped()
- Handled invalid shunt-resistor-micro-ohms value
- Link to v1: https://patch.msgid.link/20260923-topic-sm8x50-iio-max34417-adc-v1-0-41d4ba1bfc41@linaro.org

To: Jonathan Cameron <jic23@kernel.org>
To: David Lechner <dlechner@baylibre.com>
To: Nuno Sá <nuno.sa@analog.com>
To: Andy Shevchenko <andy@kernel.org>
To: Rob Herring <robh@kernel.org>
To: Krzysztof Kozlowski <krzk+dt@kernel.org>
To: Conor Dooley <conor+dt@kernel.org>
To: Neil Armstrong <neil.armstrong@linaro.org>
To: Michael Hennerich <Michael.Hennerich@analog.com>
Cc: linux-iio@vger.kernel.org
Cc: devicetree@vger.kernel.org
Cc: linux-kernel@vger.kernel.org
Cc: linux@analog.com

---
Marius Cristea (1):
      unaligned: introduce be56 unaligned accessors

Neil Armstrong (2):
      dt-bindings: iio: add: document the MAX34417 Four-Channel High Dynamic Range Power Accumulator
      iio: adc: add driver for the MAX34417 Four-Channel High Dynamic Range Power Accumulator

 .../devicetree/bindings/iio/adc/adi,max34417.yaml  | 103 +++
 drivers/iio/adc/Kconfig                            |  11 +
 drivers/iio/adc/Makefile                           |   1 +
 drivers/iio/adc/max34417.c                         | 845 +++++++++++++++++++++
 include/linux/unaligned.h                          |  27 +
 5 files changed, 987 insertions(+)
---
base-commit: 3aa473a0286ba2d9d3d8f1b45af8ca7289d6b26c
change-id: 20260923-topic-sm8x50-iio-max34417-adc-209e880533fb

Best regards,
--  
Neil Armstrong <neil.armstrong@linaro.org>

