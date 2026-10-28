Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.45
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793193552;
	b=AM78Ad9YcrrINKz0AVnZO09hUpVYD9ABttYCaEGCnR+sYt62JYgPJG1fpLtXYMEZOzFl
	 ybNAax5tpNP4WmX7epekp8qaKC8GTtsIXsg8RCNb9o/3J5QnwZgf1lIvVkUNNk+Ut1Cr5
	 /2qV/f4kK9iQfNVt+PW8n9gcHWD+qq/MFkV7ZmpW/4R+IBVRVlR9jPG4VzCfMvPsjj3yo
	 /nCrj336TkypsJjGmtGsie9yltCjBx3B1XQUijuW6LSbBhswM8FSckD30o89lVaFfq+Em
	 78l4Rl0A86pZc9iBj7zx1NQMq23SryYeMdRX1xVvqjQmVCAWyk0kobBU9qvbgei4Ykg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793193552;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Subject:Date:Message-Id:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key;
	bh=BeFnOov7JQ7nHTdzxtHApZbYA3/SJh2WcVisafxc5PE=;
	b=jUAtCpiqaFiRarj/eCWVAj/1Y7c5gA50jyaDcZ6Sye1X88xfrqHldli6enR6tpUXoJk2
	 sAl2N+tDDkqM63Iuy+tU4zTi4HKxlmxo2mNX4LYbF/bX4IQOxC/vltOjjpiZdxVoSUF0g
	 DWY6sYJn00PH4kfg6LgrMu7crrN036Y5vrEsNzaSE4YqcNWMjh2G9iOOBR6GWCiGRbtE1
	 aPEE1wrno630eOKWXGpy10ZcXm2GSW7I+PHChb3BEJiXOTX57Zx5C4uoryKn4+pay+rcP
	 Q9YVCO9Trs2a9ccPOqJz5AwWW0ool/ULyBVPAmwBkdNHzd8K2kWFL5JcGobKvAwzPtg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linaro.org;
	spf=pass smtp.mailfrom=linaro.org;
	dkim=pass header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=fDytNvCP;
	arc=none smtp.remote-ip=209.85.128.45
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 25261606A31E
	for <devicetree@vger.kernel.org>; Wed, 28 Oct 2026 13:19:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 25261606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=fDytNvCP
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-4a9a8d6cea8so7476685e9.1
        for <devicetree@vger.kernel.org>; Wed, 28 Oct 2026 06:19:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1793193550; x=1793798350; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=BeFnOov7JQ7nHTdzxtHApZbYA3/SJh2WcVisafxc5PE=;
        b=fDytNvCPlv78xWqV2XafheDe0Qpbk92ncIzassGQoxYuED9wmzsUUmDvArfTmL/atp
         4Q3TtEf4uhS5zjy0Bw1lIEHDh9NPgK2tKfTEZy1Wzff8uJnfhGmoySnWpVKLo05d5LS9
         3ewTVp1Q95Zdy+d8lLAMxgE08WwR1JCf/l6+aKrfWMkIhFMk1QcxJByp+8g2o+ARm4X2
         ZmpXqUf7xdo0PE8YiJlQNk7dVjK48oQV7ZPIeS8fv/PZhPu1sAkXt7dRGpfLTWJeIC7j
         fMh0Z4O4ZzaAjJPPfauQF3w7drrTVzK07hskpDbupK/8QclltiQ4UeeM4iHD4GuxskQR
         cTsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793193550; x=1793798350;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=BeFnOov7JQ7nHTdzxtHApZbYA3/SJh2WcVisafxc5PE=;
        b=JBcCFT/fASitnBSOcJ3NRhEYKTQRlAbP3LVL+uIidtyTfDmt52Jv55KWPOUVOLx/Cj
         o5JGembxLqMYEUogGwTZKaqfUr7REuNvsqoWEfjXP0krbCthCEVJdNv4my3b40OQYrTX
         ZPInn6vnhkT/okokY2g4ItL4cs+xLujYZLQ4jqANtI6o3MEfsMEtGa3XhDwxnuVOB/ti
         E8IGE7OHzk87YQz/MqJuGY0BHFT22ASwmcuSXf7fI8ub0DixAHHdyYDRhVJPysjDnRwB
         75P1MFCqNQ78YUxrMlAcl0U/pobd82xRF4cxT5AYFeydmcLe1YgwmJQumvmw7yLPWyEQ
         OpMA==
X-Forwarded-Encrypted: i=1; AKwUvBx3d8hNkvL4dIpKZi6Piwf9BvSalHExaxhAJrRrWdZejdUc17yZq5IDnSNw9ko3pW/ibOjtEsniK3bJ@vger.kernel.org
X-Gm-Message-State: AFq9FYJ85/Aj/WmtzfLFgOpAKcutFBPwcKWs7BHJNW55K1Iw8okrowG6
	0NDSkqEK0Wvd5JE2lI6GI5r8kLcZfcPBkGCpX10FPF3gbXp/VtE/G6C5NPV8g0xMK2I=
X-Gm-Gg: AYBFou0Ujc7iOkvh7Avf3Tw+3pN4foQHreXxSVem6yN8SuqeDGMtBI2MTibCzU+OxIA
	1TVM31Hau/DYHyVvjM+v51OjVMhExkYg8c0NxkvnlLjS8Qo43F57z3FAOynCC/4JrYabfPwXHOe
	9Fs1NPa41K7R1B3GU8CnWbKiKvqJ1FZc+RHtAZLJEM6bN6/hHGakpUsbUOFpSHSKp2oefYvetWz
	BZswKx10qjFPL1jJgCLNn3cqGsIPn/ZFb+a5V2Ovv7m4u+qE1WheK9P3hi2NEU/BfW3NSB52FIU
	YranliJoGQvIdYUcYZ6aLwLSgRHrKeHJNflH1THcbt6bPQjHDAz6LiKitRdyASzZD46xouyNgAo
	m2dzpZB5einMEoS/DTmdD0FURE51Rjdzv+ftzn/D33kooQaSZDD3SB/Tl/9bybAx2UFTDtypIEf
	s9ei4o1ZA+lErjvVOhLXVglKlGQE05N286kzuSyuv4GPaVGSUtYeAFlCtn/2ungerdRmh/nWj8d
	PcJN6l1CwIZZ0TPW+FsT9Zt35AzW4kthLoPThmE8wrb/hcTn5mKwE/k/+RF93bl13elEkC4jDwX
	4TsocTORdv4ksdINtraCi+oySozS6yErjyMUZkXcIQeq
X-Received: by 2002:a05:600c:3f0e:b0:4a3:5da2:38ae with SMTP id 5b1f17b1804b1-4a99781ff60mr43745115e9.14.1793193550205;
        Wed, 28 Oct 2026 06:19:10 -0700 (PDT)
Received: from arrakeen-2.home ([2a01:e0a:106d:1080:52eb:f6ff:feb3:451a])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a996aa0ff3sm19869395e9.1.2026.10.28.06.19.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Oct 2026 06:19:09 -0700 (PDT)
From: Neil Armstrong <neil.armstrong@linaro.org>
Subject: [PATCH v4 0/3] iio: adc: add support for the MAX34417 Four-Channel
 High Dynamic Range Power Accumulator
Date: Wed, 28 Oct 2026 14:19:03 +0100
Message-Id: <20261028-topic-sm8x50-iio-max34417-adc-v4-0-d4baaf3ee903@linaro.org>
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
X-B4-Tracking: v=1; b=H4sIAEf24WoC/43OwWrDMBAE0F8JOnfLarVO7Jz6H6UHWV4nGxorS
 K5xCf73yimUlh6S48DwZq4mS1LJZr+5miSTZo1DCfy0MeHoh4OAdiUbQtpiQw7GeNEA+VzPFYJ
 qhLOfHbPdge8CEDZS11g517emGJckvc43//XtO+eP9iRhXNG1cdQ8xvR5OzDZtffo1mQBgW3Hr
 bdtH9i+vOvgU3yO6WDWsYl+c3yPo8I1HktXdtRX4R/nfjiL9u47V7jObZG9sCdq/nDLsnwB/yi
 qk3sBAAA=
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
 Marius Cristea <marius.cristea@microchip.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=5629;
 i=neil.armstrong@linaro.org; h=from:subject:message-id;
 bh=1abMOvKaPLKzeoKlbO7WKm0E1SAlHjPKpK3LeZz+/3E=;
 b=owEBbQKS/ZANAwAKAXfc29rIyEnRAcsmYgBq4fZK/F5ueWXK5u+9eyamqMmHSzSFpZNXNPtx1C4S
 eT9MDYOJAjMEAAEKAB0WIQQ9U8YmyFYF/h30LIt33NvayMhJ0QUCauH2SgAKCRB33NvayMhJ0TvUD/
 4x1KYLeUcHnWBVPqL0RFHj9ag5isTP+VlOUilbD0HlhJF5ul7NJHQrfZ67N5/W3gxn84CkKRkODeiS
 Py44FOgcyrQ4R/orE8tHg8eUlHXKkwLI+hJjbEj63pQvXXV8jveZPRqRYP80k7hPll/DEsrkCCLW3j
 muJyQcKGcMUyLMlZbanej4TZPRud9fPbvn2eRWUcyjvm5s7yz9KHRygYdgPV7IqnrabJDZUnlJFW55
 IqZ4wthuRjzOUWPoiWkqLpFSYK10Vzy/t+9ura45UIuph8c29vkGNDbLWnKCNikiVsEGnPeio6xCKm
 QmU1ASPMB2Cul9N4wrfBqmomb/E77rInU6SxOvJkzPbjinQRUGsGSBFYU4grwN7a0HgSMoui0tERTB
 VxYsngd+BkQ7JacA/wwaaOZEJtmJ7OFVySSWoXyLuDML5W1jSJ5Lkk5kWPbD73w8UR7EeYw6E4KPsb
 HxylO8oMwiRcSn6e6RMBghi7oV1M0ZzVhJgUl/ty/fQbjsbqqxcn0trhW7Bd5MXWRaB4pIxUir/ID7
 2y7IEozbj6xlM9n6ILcjRc3mvTfvwV4kfiCpckt43nOhApgd2//qIKoZ+Flaw4WV6TCN8nTQ8Qj8Dq
 afmyY/caGvxFDl52wwfnYN4b8vXBU0gpl3aKolcsR4MN25G5ye04ZP1zuayQ==
X-Developer-Key: i=neil.armstrong@linaro.org; a=openpgp;
 fpr=89EC3D058446217450F22848169AB7B1A4CFF8AE

The MAX34417 is a specialized current and voltage monitor used to
determine power consumption of portable systems. The driver supports
getting the channels voltage, average power and accumulated average
power and energy over an I2C/SMBUS serial interface.

The MAX34417 datasheet only specified on how to calculate the
accumulated average power, but with the Sample Per Second rate
we can easily get accumulated Energy in mJ.

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
v1/v2 to better match the capabilities of the MAX34417 and
allow getting accumulated Energy plus provide single
channel read without loosing other channels accumulations.

Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
---
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
 drivers/iio/adc/max34417.c                         | 788 +++++++++++++++++++++
 include/linux/unaligned.h                          |  27 +
 5 files changed, 930 insertions(+)
---
base-commit: 02aaca3296e9dea76ca3a89ef4fb6508b1bd2bff
change-id: 20260923-topic-sm8x50-iio-max34417-adc-209e880533fb

Best regards,
--  
Neil Armstrong <neil.armstrong@linaro.org>

