Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 51E873C9EC2
	for <devicetree@vger.kernel.org>; Thu,  2 Jul 2026 11:04:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782990275; cv=none; b=b45U4w1nlPXQ7tbkhmi9vjZ+7z4YYvnkx8bRa88SEGR+yCDyl7EEERoSeQ9M/OQzlUH1GuROU/H3x7d8GYWcIXTCig7Ur+Mk5VoMcLzQhVBSoDj3wAGK+mUuVNzY6QhYNxSMIj+OAOwUHnFCue0EvsttAKQqY8aOWGWdSwOL0/U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782990275; c=relaxed/simple;
	bh=WOvnAqyd9suiKkPSQRDTLhMYKHvt18IBkdwyyayNtxs=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=kM5pOItIqQ9rKIFJYV0mx/lq91Nu0y/CEFllgOIHIA2/TeoEvWIK85pZxkFPUTT8JmjF8u4CN5KzqsiCxnHuuHU+jdByoeXaLHfDOm373KUYMnXVYiDCY841f0mn8bZJyyaG5b8W1C+jvkwgyhUdyewWdWKXRiDOVkIKTqvCrVE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=k0HR7WU2; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="k0HR7WU2"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C18AB1F00A3A;
	Thu,  2 Jul 2026 11:04:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782990274;
	bh=WOvnAqyd9suiKkPSQRDTLhMYKHvt18IBkdwyyayNtxs=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=k0HR7WU2f4bU2gdySbZFUVAYbtHpMRhl6MBWqRGb3Az3q7k5GWWeL3w1FHfAF1c2K
	 j3E02La3kP010HCEyoa5Qo24c/PEAL1z9AKGJgoWX9LD/Bo+4JDuHFW6ikhznIxIGE
	 RFfh8EuICPDoCquc0URR/n66VGwNpw9zJAKTrEIx2bx2jXx7LqB3WfiSMdg5KqNCUr
	 P+XkuMYDWtIetLn6S89qQT3mZN2jBcG8hq5ybKhrbNEW6rDo+n5NKfGuL67KswU3wc
	 s1KTQpblcgxCIyVoh97HxsV1FdFcuLmUW6G+29RD2nUOSmagzcai9mUFn0fRTdtOh7
	 8iohzc19FPmgA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v6 7/7] thermal/drivers: airoha: Add support for AN7583
 Thermal Sensor
Reply-To: sashiko-reviews@lists.linux.dev
To: "Christian Marangi" <ansuelsmth@gmail.com>
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20260702094846.17325-8-ansuelsmth@gmail.com>
References: <20260702094846.17325-1-ansuelsmth@gmail.com>
 <20260702094846.17325-8-ansuelsmth@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 02 Jul 2026 11:04:33 +0000
Message-Id: <20260702110433.C18AB1F00A3A@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 3 potential issue(=
s) to consider:

New issues:
- [Medium] The AIROHA_THERMAL_MUX_SENSOR regmap field is defined as 2 bits =
wide, which will silently truncate valid sensor enum values.
- [Medium] Potential signed integer overflow in temperature calculation.

Pre-existing issues:
- [High] Devm registration order causes a Use-After-Free of the thermal zon=
e if an interrupt fires during driver unbind.
--

Note: The format of this review has been altered to a free-form summary
rather than an inline diff review to comply with automated code recitation
restrictions.

commit 20661087884d15a906fbdeeb53c5ad53bd3cd15e
Author: Christian Marangi <ansuelsmth@gmail.com>
Subject: thermal/drivers: airoha: Add support for AN7583 Thermal Sensor

Summary: This patch adds support for the Airoha AN7583 Thermal driver,
dropping the PTP_THERMAL subsystem, modifying mux logic, and updating
the EN7581 code to account for these changes.

[Severity: High]
This isn't a bug introduced by this patch, but there appears to be a
pre-existing devres registration order issue that could lead to a
use-after-free during driver unbind.

In en7581_thermal_probe(), devm_request_threaded_irq() is called to
request the IRQ early. Later, in airoha_thermal_probe(), the thermal zone is
registered via devm_thermal_of_zone_register() and assigned to priv->tz.

Because devres frees resources in the reverse order of allocation, during
an unbind or module removal, the thermal zone will be unregistered and
freed first, leaving the IRQ still active. If a hardware thermal interrupt
fires in this small window, en7581_thermal_irq() will execute and
dereference priv->tz, which has already been freed.

Should the IRQ registration be moved after the thermal zone registration,
or perhaps use devm_add_action_or_reset() to ensure safe cleanup ordering?

[Severity: Medium]
In an7583_chip_scu_fields, the AIROHA_THERMAL_MUX_SENSOR regmap field is
defined with LSB 2 and MSB 3, making it exactly 2 bits wide.

However, the an7583_thermal_adc_mux enum defines sensor indices that go
up to 6 (e.g., AN7583_CPU_TEMP_SENSOR). While the code currently only
reads sensor 0, if future or modified code attempts to select sensors 5
or 6 as provisioned by the newly added arrays, regmap_field_write() will
silently mask and truncate the value to fit into the 2 bits.

Does the AN7583_MUX_SENSOR register field span more than 2 bits in
hardware, or are the higher sensor indices handled differently?

[Severity: Medium]
In an7583_thermal_get_temp(), is there a risk of a signed integer overflow
during the temperature calculation?

The formula used is:
*temp =3D (slope * delta_diode * 10) / delta_gain - offset * 10;

Since slope can be up to 8390 (for the CPU sensor), multiplying slope by
delta_diode and 10 results in 83900 * delta_diode. If the ADC values
diverge such that delta_diode exceeds around 25,595, the multiplication
could overflow a 32-bit signed integer before the division by delta_gain
occurs.

Could this be mitigated by casting to s64 or using mul_u32_u32() if the
hardware ADC resolution allows for such large delta values?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260702094846.1732=
5-1-ansuelsmth@gmail.com?part=3D7
