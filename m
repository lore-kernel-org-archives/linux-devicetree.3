Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C7D9140DFB0
	for <devicetree@vger.kernel.org>; Sat, 21 Mar 2026 10:14:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774088043; cv=none; b=f+8yu+K+tHlQ0MIPEHOi4gBHjQ8OhYDmb/+wXo+QtveCa84W/qsjH+6h1PoXlou5m8o9J3cVbS/bHKUCek75Y5gmsSdhnOtP7V4RnLEOrjASZ1Rl/8aPy0xs9sN3XerR8Lvfc3OB+EkGk6xLCiJ8NaAnqj4JbuoBHrddQThdUkU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774088043; c=relaxed/simple;
	bh=frihfCmQzIanWsGaTNFRfE2QMRNSkUDCsJaH143VVzc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Xa8x7gxL2ZdlR5QO4L61mupUCUSHhjpbtAgK9yCMoixusOHcPf5D576WR/uGVi7LJt0Y45nbYPXw2cwdVRKF/RblIzPsBNXW8xj5ysAjYz5ox+6+U61tjSrkJYviNY0e0WpP6dH9IOfgCDB5U62JaP2WtMCLcQ7/s08c25BjNwI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=OmTFv8Va; arc=none smtp.client-ip=209.85.128.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="OmTFv8Va"
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-48541edecf9so27228585e9.1
        for <devicetree@vger.kernel.org>; Sat, 21 Mar 2026 03:14:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1774088040; x=1774692840; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=ZyCrfc/ZXBBtX/vytpgp8YE9CQadwN05k6xP+vhF1Ho=;
        b=OmTFv8Vacd91aiP9aLkE2H7zWi+9qXAYNKaK8G0g/PbPXlsixlITFI5Je3mUMd5MPE
         Z37qPzByarp5IVh3ZerXA3FY7eIzH8URSKKKJibBNoNk1Bw5kDyeGiwz8xCBE/yVjSEh
         PNlYFr5iK1vjuIM4KkW6oEQw/IjPZkNG/0Nc+W6/4KhN4Qimb09KQ3s8X9koMyTGUhri
         GM7xgiQlGuOMf1hoRVXHx1/f7fnp5zmBWwZj3d5fzRbyykW2eSEB1qWR3sGMtmonI0Hf
         EMSWsvBcro7gblXV0VADq5k0F81/Qhmi6fl6vkTkmW/R22kl5ISS+Q73Fc2KaolHMhXU
         lH8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774088040; x=1774692840;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ZyCrfc/ZXBBtX/vytpgp8YE9CQadwN05k6xP+vhF1Ho=;
        b=ej0j4Jmqhd2poypfQu3rp4FnqW5t/WizaQbxnAOhYGvbTCS08O6c0EIzMdocAWXrNL
         gSxWSBXIp2UbGllS6iDh0assZR4wt6mGwWErWUl61kf3EeMW+EUoxdf5S3+m1p7GJaCv
         I7fTc8pRf6ifN4pypcwSLc4R3o+VoaRgrYZ/Gjotl58EEioBVBfBqXM7Lg+AvAzo0X6e
         sHdm+lM9JTuMcCsxmEoUF9iAXlnCvOHKT0h49s27NxVrE+5V0Aj+uHNsj1XCW0PcGxHk
         zRyz3TAq6Kj/x4cl2c1KOm8aZU/Lo2uNPEQetcavVOi7j6nAJjCRkoe4KBSyo2+gRwIq
         y73g==
X-Forwarded-Encrypted: i=1; AJvYcCUu92Dj53LlTOB7zGtUHOOWnULNjkjXyVZjiMZHlg3Ae0G1JIN5ZrIYYg3PkxRMQZx5ICU4u4Bg0yuA@vger.kernel.org
X-Gm-Message-State: AOJu0YzaYEG2IXZ8LzGoTrJUsLSBVQh7zwRXu7WyCC7th7lhcqAQP2Ex
	ti6wGglTrK0lNb2f4lG+YAAXIzRpZ7LhDKvpDBdFaDZeo/740FDF9tSs7rMkgNkfec8=
X-Gm-Gg: ATEYQzz4+9BqBFME5v40G5vaj+qwpAyOnMNwT0JB1cFb1HXoCvN8r+qwfYM7Sq05Ler
	aT3GIZe6vbFhQHNPDJarmhKDNMPNo52Nt5B2pVvFpM8qHbIOsmqI327OAMjOO+xWx0j/yNmS4S4
	TtMjombdO707693OrU6W5q+vmDzwbyO7vHD2X77Utepp4sH9zj4SWRo+ZOnsZQpwlRAsYCwQske
	wtK0ETs71IyyISHpmUp11TyVdmLqH5ZNhu1FqM+VYpnb5t01JD/5J+261hyC4toqHWdnO6GJTc9
	k9GLjHNus/mhHq1o5kDiFs0HQtGAW9muXsJvXyL2hUdErsmR3yFrePFShlsOSeBco5NA6Pj0KD9
	xRnd25KNhlEFrYq+f2RqRYTCiwg8fv8OCw2fAz13LIlsQVi28mUqb60hlgQrEi+Jk+HkWlRt/IT
	0uuwL38FRtGRvspcPvT+xl00dk+SlD
X-Received: by 2002:a05:600c:1f0e:b0:486:5f71:5829 with SMTP id 5b1f17b1804b1-486fedab740mr84674065e9.5.1774088040301;
        Sat, 21 Mar 2026 03:14:00 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43b6470393fsm14161545f8f.17.2026.03.21.03.13.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 21 Mar 2026 03:13:59 -0700 (PDT)
Date: Sat, 21 Mar 2026 13:13:57 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Linus Walleij <linusw@kernel.org>,
	AKASHI Takahiro <akashi.tkhro@gmail.com>
Cc: Bartosz Golaszewski <brgl@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Dan Carpenter <dan.carpenter@linaro.og>, linux-gpio@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	Andy Shevchenko <andriy.shevchenko@intel.com>,
	Linus Walleij <linusw@kernel.org>,
	Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
	arm-scmi@vger.kernel.org,
	Vincent Guittot <vincent.guittot@linaro.org>,
	Khaled Ali Ahmed <Khaled.AliAhmed@arm.com>,
	Michal Simek <michal.simek@amd.com>
Subject: [PATCH v5 6/7] gpio: dt-bindings: Add bindings for pinctrl based
 generic gpio driver
Message-ID: <047c75a48d76a0f11f9fcd156ace3b5fdaab10ed.1774087290.git.dan.carpenter@linaro.org>
References: <cover.1774087290.git.dan.carpenter@linaro.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cover.1774087290.git.dan.carpenter@linaro.org>

From: AKASHI Takahiro <takahiro.akashi@linaro.org>

Traditionally, firmware will provide a GPIO interface or a pin control
interface.  However, the SCMI protocol provides a generic pin control
interface and the GPIO support is built on top of that using the normal
pin control interfaces.  Potentially other firmware will adopt a
similar generic approach in the future.

Document how to configure the GPIO device.

Signed-off-by: AKASHI Takahiro <takahiro.akashi@linaro.org>
Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
Reviewed-by: Linus Walleij <linusw@kernel.org>
---
v5: Fix subsystem prefix
    Re-word the commit message
    I removed all references to the driver.  I also removed the
    reference to pin muxing because that's described in the pin control
    spec file.
    Fix 3 vs 4 typo in the example.
v4: Changed additionalProperties: true to false.
    Add gpio-line-names.
    Deleted one example.
    Add r-b tags
v3: Forward port and update

 .../bindings/gpio/pin-control-gpio.yaml       | 59 +++++++++++++++++++
 1 file changed, 59 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/gpio/pin-control-gpio.yaml

diff --git a/Documentation/devicetree/bindings/gpio/pin-control-gpio.yaml b/Documentation/devicetree/bindings/gpio/pin-control-gpio.yaml
new file mode 100644
index 000000000000..9d20b5f23cdc
--- /dev/null
+++ b/Documentation/devicetree/bindings/gpio/pin-control-gpio.yaml
@@ -0,0 +1,59 @@
+# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/gpio/pin-control-gpio.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Pin control based generic GPIO controller
+
+description:
+  The pin control-based GPIO will facilitate a pin controller's ability
+  to drive electric lines high/low and other generic properties of a
+  pin controller to perform general-purpose one-bit binary I/O.
+
+maintainers:
+  - Dan Carpenter <dan.carpenter@linaro.og>
+
+properties:
+  compatible:
+    const: scmi-pinctrl-gpio
+
+  gpio-controller: true
+
+  "#gpio-cells":
+    const: 2
+
+  gpio-line-names: true
+
+  gpio-ranges: true
+
+  ngpios: true
+
+patternProperties:
+  "^.+-hog(-[0-9]+)?$":
+    type: object
+
+    required:
+      - gpio-hog
+
+required:
+  - compatible
+  - gpio-controller
+  - "#gpio-cells"
+  - gpio-ranges
+  - ngpios
+
+additionalProperties: false
+
+examples:
+  - |
+    gpio {
+        compatible = "scmi-pinctrl-gpio";
+        gpio-controller;
+        #gpio-cells = <2>;
+        ngpios = <4>;
+        gpio-line-names = "gpio_5_17", "gpio_5_20", "gpio_5_22", "gpio_2_1";
+        gpio-ranges = <&scmi_pinctrl 0 30 4>;
+        pinctrl-names = "default";
+        pinctrl-0 = <&keys_pins>;
+    };
-- 
2.51.0

