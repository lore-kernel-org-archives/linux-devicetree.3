Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 006973E314D
	for <devicetree@vger.kernel.org>; Mon, 25 May 2026 08:43:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779698640; cv=none; b=Z/N7l7ySYJMA+mH3DaJbMYbjEKY3GynE7w9I4k+df/AanEx3N4iFErX9j72rY33fHJ0RNQxksdIUJohQSg98Nb7YiZdPNz5neFQKY7hqR3l4KpUDfgTbr7bgd6Tqek7mub7g8K/CCBDwZTDPrA+pxqBPx60Ejck/Xzif8hpeY5c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779698640; c=relaxed/simple;
	bh=c/S4nZ+59Tt72nvVdYRcA3eUZMrQ0vtcXaIgVaHVgZM=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=I1/G5WKXmtrdXYiRE12DZUiKilh1jxn0Rp8rJljZNc1wJcEzgc9kvjtstqcp2vRDu2Y8i5uOuzYiWos5JUM+SuwnyfDfA+rOV86HyWogPcsXj9h54yGf/Ujdv7DxH77E8GqT9gmejhzR0yMX6jbS9UpYZt6XBWa48Z4pdxhEkNk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=daCtKEdg; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="daCtKEdg"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 886DD1F000E9;
	Mon, 25 May 2026 08:43:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1779698636;
	bh=f0LVo3tH35qSEYyOgyAC31NBJuLZd6PH7oKtpnw9QUs=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=daCtKEdgwvk1q5gT43AnlQVMV4oWurU3h4AhKnD6cYkDEVvGw4EvzEclEf6eFdinr
	 +JKWxu7DsX9QSWA6Fwmq4+sHzX0QghAjQXrVQk2pNRkI0WW5cJr8cosp2M//7V9KTN
	 RYCCvlC8B5GXFTKnqE8roDgP9rP+EDosvp77rFscYVjEc4UaZojkYwdnHRAkYOBqT+
	 dpkzWSfVFExvAHK4wxG2vqWzx1D9U6W9//10d+bjMEaOFIQED9WpkIKHbV9Ybu4bpV
	 54ssHS9Sq6XNNHL5+/eK+j8nRQAOEz2nuIlVvBZmJ3lqaaftMdgE18brtYKwIJT+Jm
	 irnWD/xITIQuA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v10 5/9] mfd: p3h2x4x: Add driver for NXP P3H2x4x i3c
 hub and on-die regulator
Reply-To: sashiko-reviews@lists.linux.dev
To: "Lakshay Piplani" <lakshay.piplani@nxp.com>
Cc: robh@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260525064209.2263045-6-lakshay.piplani@nxp.com>
References: <20260525064209.2263045-6-lakshay.piplani@nxp.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 25 May 2026 08:43:56 +0000
Message-Id: <20260525084356.886DD1F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [High] The driver incorrectly uses a generic I3C class match (`I3C_CLASS(=
I3C_DCR_HUB, NULL)`) instead of a vendor-specific match, which will cause i=
t to erroneously bind to any I3C hub from any manufacturer.
--

commit 6fe3cf08b12d16f6874bd262d173580fb662de0e
Author: Aman Kumar Pandey <aman.kumarpandey@nxp.com>
mfd: p3h2x4x: Add driver for NXP P3H2x4x i3c hub and on-die regulator

This commit adds core MFD support for the NXP P3H2x4x family of multiport I=
3C
hub devices. It allows the devices to connect via I3C/I2C/SMBus and exposes
multiple downstream target ports along with an on-die regulator.

> diff --git a/drivers/mfd/p3h2840.c b/drivers/mfd/p3h2840.c
> new file mode 100644
> index 0000000000000..9bd8cf6980f1e
> --- /dev/null
> +++ b/drivers/mfd/p3h2840.c
[ ... ]
> +static const struct i3c_device_id p3h2x4x_i3c_ids[] =3D {
> +	I3C_CLASS(I3C_DCR_HUB, NULL),

[Severity: High]
Will this generic class match cause the driver to incorrectly bind to any I=
3C
hub on the bus?

Because this driver instantiates vendor-specific child devices like
"p3h2x4x-regulator" and "p3h2x4x-i3c-hub", binding to third-party hubs
could prevent proper drivers from loading, or it could cause undefined
behavior if the child drivers attempt to write P3H2x4x-specific registers
to a non-NXP device.

Should this match table be restricted to NXP's Manufacturer ID and specific
Part IDs using I3C_DEVICE() instead?

> +	{ /* sentinel */ },
> +};
> +MODULE_DEVICE_TABLE(i3c, p3h2x4x_i3c_ids);

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260525064209.2263=
045-1-lakshay.piplani@nxp.com?part=3D5
