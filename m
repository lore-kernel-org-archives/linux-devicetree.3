Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F22F51A6838
	for <devicetree@vger.kernel.org>; Fri,  7 Aug 2026 13:36:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786109809; cv=none; b=hNMTkkFn2/X5JZqgrij5sTvPGuRZ8VTKasjMvhWOjxtF3rKY9GQ/Q+u3fcaS4Voh+3iNWSGy/ujK6GJhUP1gV5VYmQymFSt86czETb/o2VanNIRt10eJgIwKJxsFvkXNZJNEk0QCIaYk/kYVN/Cd4hrIVmEAF770PFQfiWKqPms=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786109809; c=relaxed/simple;
	bh=p+RDJU+yh/CVJ4A2K3iGgXugR5haaGYyyKmSpqQce1I=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=tF0FzmBxJ/6r2z7Sa/HrbMHXCVAzx5uTDSDpo9E0hinWuXAaKbFKUG/qgmZ6aJGEoT6dwRMA7bk19qb6FWtS8JLm00NXaWaR8AzRJXc/IoPfdQt9LNjLpw6PQapDY4FxPvJvu2yMQm2hfaKkScCrfoukGTTpup2Z/5jijisxeU0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=OB6y8caU; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="OB6y8caU"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2302C1F000E9;
	Fri,  7 Aug 2026 13:36:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786109804;
	bh=bvix1E1CdGgdNz3GwXP1fpytVsucyaJmyX1gwoYGNKY=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=OB6y8caU0bEY0icHOZkJ1VXy4Iqz4MYBOQskLNSI64zvxsBd6jhEcYPOxoTFWMBmq
	 7P3WR5qQc4SsRX5lUSUJm8UGMjdr1MDE1zVqJPv0fioAXnzLjomneDQiLZO7Bs4sUN
	 EDqa7J1zXm86859XzE5N9l9WtN00N5b1ogC8usYM50yYrk84D/XLc91ErVfrIBh7fR
	 1JZcUKZ3cbmqeMrudSfgp4vMXiK8n5pysE8vQtyNrUCaQ9Fk3aj6wXOa6peJCkL5F5
	 L0DwcteNr8W+XxjL8bcB4AtFEqjparc/YVGvP4ZnDt68mOL1KL6qWhc+88x9i37xvj
	 61TjalXBp1+Gw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v15 13/22] media: i2c: add Maxim GMSL2/3 serializer and
 deserializer framework
Reply-To: sashiko-reviews@lists.linux.dev
To: "Dumitru Ceclan" <dumitru.ceclan@analog.com>
Cc: media-ci@linuxtv.org, robh@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260807-gmsl2-3_serdes-v15-13-7212e9e5156a@analog.com>
References: <20260807-gmsl2-3_serdes-v15-0-7212e9e5156a@analog.com>
 <20260807-gmsl2-3_serdes-v15-13-7212e9e5156a@analog.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 07 Aug 2026 13:36:43 +0000
Message-Id: <20260807133644.2302C1F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 5 potential issue(=
s) to consider:
- [High] Using devres allocation (`devm_kcalloc`) in a dynamically called h=
elper function leads to an unbounded memory leak.
- [Medium] max_serdes_get_tpg_timings() returns 0 (success) without initial=
izing the timings output parameter if entry is NULL.
- [Medium] The commit message claims the framework enables support for mult=
iple features that are entirely absent from the code.
- [Medium] Output parameter 'doubled_bpp' is left uninitialized on success =
path in max_serdes_process_bpps.
- [Low] Most of the framework functions lack EXPORT_SYMBOL_GPL, rendering t=
hem unusable by external modules.
--

--- Patch [13]: [PATCH v15 13/22] media: i2c: add Maxim GMSL2/3 serializer =
and deserializer framework ---
commit 318efe00d7eeba7a3e3cd45eca83e30dec1c313f
Author: Cosmin Tanislav <demonsingur@gmail.com>

media: i2c: add Maxim GMSL2/3 serializer and deserializer framework

These drivers are meant to be used as a common framework for Maxim
GMSL2/3 serializers and deserializers.

> This framework enables support for the following new features across
> all the chips:
>  * Full Streams API support
>  * .get_frame_desc()
>  * .get_mbus_config()
>  * I2C ATR
>  * automatic GMSL link version negotiation
>  * automatic stream id selection
>  * automatic VC remapping
>  * automatic pixel mode / tunnel mode selection
>  * automatic double mode selection / data padding
>  * logging of internal state and chip status registers via .log_status()
>  * PHY modes
>  * serializer pinctrl
>  * TPG

[Severity: Medium]
The commit message explicitly claims that the framework enables support
for .get_mbus_config(), automatic GMSL link version negotiation, VC remappi=
ng,
pinctrl, and other features.

However, the submitted code only includes basic data structures and a few h=
elper
functions for streams and TPG. The logic for the claimed features appears t=
o be
missing.

Could the commit message be updated to reflect only the features
currently implemented in this patch?

> diff --git a/drivers/media/i2c/maxim-serdes/max_serdes.c b/drivers/media/=
i2c/maxim-serdes/max_serdes.c
> new file mode 100644
> index 0000000000000..7d013c4739d11
> --- /dev/null
> +++ b/drivers/media/i2c/maxim-serdes/max_serdes.c

[ ... ]

> +int max_serdes_process_bpps(struct device *dev, u32 bpps,
> +			    u32 allowed_double_bpps, unsigned int *doubled_bpp)
> +{
> +	unsigned int min_bpp;
> +	unsigned int max_bpp;
> +	bool doubled =3D false;
> +
> +	if (!bpps)
> +		return 0;
> +
> +	*doubled_bpp =3D 0;

[Severity: Medium]
If a caller invokes max_serdes_process_bpps() with bpps =3D=3D 0, the funct=
ion
returns 0 (success) immediately before the *doubled_bpp =3D 0 assignment.=20

Will this cause the caller to consume an uninitialized value for doubled_bp=
p?
Should *doubled_bpp =3D 0 be moved before the if (!bpps) check?

[ ... ]

> +int max_serdes_get_streams_masks(struct device *dev,
> +				 const struct v4l2_subdev_state *state,
> +				 u32 pad, u64 updated_streams_mask,
> +				 u32 num_pads, u64 *old_streams_masks,
> +				 u64 **new_streams_masks, bool enable)
> +{
> +	u64 *streams_masks;
> +	unsigned int i;
> +
> +	streams_masks =3D devm_kcalloc(dev, num_pads, sizeof(*streams_masks), G=
FP_KERNEL);

[Severity: High]
Does using devm_kcalloc() here lead to an unbounded memory leak?

This helper function appears to be called dynamically during stream
enable/disable operations. Because devm_kcalloc() ties the memory
lifecycle to the device rather than the stream operation, won't repeated
stream start/stop cycles continually leak memory until the device is unboun=
d?

[ ... ]

> +int max_serdes_get_tpg_timings(const struct max_serdes_tpg_entry *entry,
> +			       struct max_serdes_tpg_timings *timings)
> +{
> +	u32 fps;
> +
> +	if (!entry)
> +		return 0;

[Severity: Medium]
When a caller invokes max_serdes_get_tpg_timings() with entry =3D=3D NULL, =
this
early return path yields 0 (success) without initializing the timings
output parameter.=20

Will callers relying on a success return code then consume uninitialized
stack or heap data?

[ ... ]

> +	return -EINVAL;
> +}
> +EXPORT_SYMBOL_NS_GPL(max_serdes_get_tpg_timings, "MAX_SERDES");

[Severity: Low]
Most of the framework functions in this file lack EXPORT_SYMBOL_GPL
declarations.=20

Since this framework is built as a module and intended to be consumed by
external serializer drivers, will dependent modules fail to link against
these unexported symbols?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260807-gmsl2-3_se=
rdes-v15-0-7212e9e5156a@analog.com?part=3D13
