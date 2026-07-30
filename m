Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 733B03321B1
	for <devicetree@vger.kernel.org>; Thu, 30 Jul 2026 18:03:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785434601; cv=none; b=RpzHWIFgnJsnWq1g42q706d4dtotOP67WnhmqOvvDC24HnvQIO8JzQDkLu0ATbM3udRK5VRpYaArT0i8PE2ixt3Y/ZYjZI+7piEKrJlvas60Z9QizLft5JhNbmGuKTB4IU/9awzQ129fBO5fKrpKqIzpFQDCoIEJq1zsw70o4PI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785434601; c=relaxed/simple;
	bh=J3OcVRdFtoG//vshok2a4mIU7eTr5i19bFD4DC72vdE=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=EtnZMn0kGwd/Z5gvnX3m7fRahdjefJkFTq1sFWypwzHngO6CXhGTTr/yPKqCQcV5ozrRDwtE33Oa1p2PJUiyZO8Mi6pmq9euqnkorbRK8jyLszLfMyhq0+H58hZ5ZTGv4GgzzQvZE9DryrTWTIYqcyTz+qb1e3HYdAHVdVsWDvE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=dHlaMkbK; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="dHlaMkbK"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C00B31F000E9;
	Thu, 30 Jul 2026 18:03:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785434600;
	bh=J3OcVRdFtoG//vshok2a4mIU7eTr5i19bFD4DC72vdE=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=dHlaMkbKD2Xpjao650yvuEkJBMYW1Hbbbnmb/nQ9Y0jYrfphHR6zxtQspUeBVKFZ+
	 ePGcY9g4a3oZDLIevrpmiBHw0sX8GtCqLXe77FjaeMAITUQ7YdrPrNVukd4tegFIOX
	 pbXW2yWbhz+siSnJBXsEjQKKmEqEhekkVePAt7BPyPqTjLcq/ew10f0nj+XrqOBO8n
	 OJHp//+Js0TbICHo2N9FT6wdJfWbZ7jXVYL21YJ3E/d5H/zEHNNBGsvv+jTEWRQqBM
	 dOWXS7RGDDbHo7kNdyIjNuRMZz/oXOUMVkfEU2pW6pwYzXTiX1zvIrWeVqQLzxCVp5
	 /m1uuiIV9lFtQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v6 14/15] ASoC: msm8916-wcd-analog: add pm8953 codec
Reply-To: sashiko-reviews@lists.linux.dev
To: "Richard Acayan" <mailingradian@gmail.com>
Cc: conor+dt@kernel.org, devicetree@vger.kernel.org, robh@kernel.org
In-Reply-To: <20260730174353.108023-15-mailingradian@gmail.com>
References: <20260730174353.108023-1-mailingradian@gmail.com>
 <20260730174353.108023-15-mailingradian@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 30 Jul 2026 18:03:19 +0000
Message-Id: <20260730180319.C00B31F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 3 potential issue(=
s) to consider:

New issues:
- [High] Missing NULL check for the result of `of_device_get_match_data()` =
before dereferencing it.
- [Low] Initialization sequence improperly writes to a status register (`CD=
C_A_RX_EAR_STATUS`).

Pre-existing issues:
- [High] Interrupt handlers dereference a NULL `component` pointer if trigg=
ered before the ALSA SoC component finishes initialization.
--

--- Patch [14]: [PATCH v6 14/15] ASoC: msm8916-wcd-analog: add pm8953 codec=
 ---
commit 20f92545eb7f1109d22b0cad48d91169236a8d8d
Author: Vladimir Lypak <vladimir.lypak@gmail.com>
ASoC: msm8916-wcd-analog: add pm8953 codec

This commit adds register overrides for the PM8953 codec to the msm8916
wcd analog driver.

(Note: The standard inline patch quotation format has been altered to a
free-form summary in this report to comply with strict text recitation
policies. The issues below are presented without quoting the diff.)

[Severity: Low]
In the newly added wcd_reg_defaults_pm8953 array, there is a write of 0x10
to CDC_A_RX_EAR_STATUS. Is this intended? Since this is typically a read-on=
ly
status register, could this be a typo for a control register like
CDC_A_RX_EAR_CTL, which might lead to missing configuration?

[Severity: High]
In pm8916_wcd_analog_probe(), the return value of of_device_get_match_data()
is assigned to wcd_reg_init_data and immediately dereferenced in the loop
condition without validation. If the driver is instantiated without a match=
ing
device tree node (for example, via a sysfs bind by name), could this lead to
a NULL pointer dereference and a kernel panic?

[Severity: High]
This is a pre-existing issue, but in the interrupt handlers
mbhc_btn_press_irq_handler() and pm8916_mbhc_switch_irq_handler(), there
is a read of priv->component followed by a call to snd_soc_component_read()
without checking if the component is fully initialized. Since the IRQs are
requested in the platform driver probe before the ALSA component probe
assigns the pointer, could a pending interrupt from the bootloader fire
immediately and cause a NULL pointer dereference?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260730174353.1080=
23-1-mailingradian@gmail.com?part=3D14
