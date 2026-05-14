Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 21E4A386553
	for <devicetree@vger.kernel.org>; Thu, 14 May 2026 20:04:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778789069; cv=none; b=HJLzMes38gaoRkxDsHEDrcNCA88ENnlH0sjFkMOOhGcPZ4sXDgQegihLiepvKC45HYs4xIZLMnuxlsVw5Cetq62Cea9OmfNLqUYP+P1ao7pJ2YYKf9i7qgGFQLqkKdwSxqdvexlQ0ZbWXkj0yQOSsrKqJf/RQlEBX2PqLjkvOig=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778789069; c=relaxed/simple;
	bh=F4+JQLCALNxLVab6U2Lq52m1d0VmEtyVXHnWOlLE11A=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=F6HM9kbfiI/nCyTFpu9glI/30KVAU5ULWZJBnYgB+7ceSjb7djH8OW8DUpambwLGgkx96CNCP9NNcqzMC1IlFKA4XEl/yjBe0MoxLZwOg+q/Om84dXOLr5B7dtlAF04MiPXbtlQ+erpFuod9hPB2mhRx5ZBd7Bgh2rRjosT1uYs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Durow7XY; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Durow7XY"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 680FFC2BCB3;
	Thu, 14 May 2026 20:04:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778789068;
	bh=F4+JQLCALNxLVab6U2Lq52m1d0VmEtyVXHnWOlLE11A=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date:From;
	b=Durow7XYoQNHKqorkSaviXadp1aJHV9AuzXRxb7yEQCdjK76dduAc94GhkqY0AGrv
	 bYDcfKBqULB+JzmsPXWn4XsAue+lR9cvxuJSNA/O7TG+DMXOCC294eUyPTTZmOnQkc
	 sHpal2hFOoCKNAYaEOjfdGEYb1DDmLcUuWX5RtGI/khDGbOS4jrbgR3PGj8W3EtDnM
	 jYOLILIIHmCsqU9z6PcXEyjtAJTEbcIcE5ZwoQl8tJC5gI7W20saqQbTN0q8y5RGmG
	 dCZfSW5Z312IYdviSA2+m8LiWcfeuaBK7swwnM/J3Dxk4IBa2WmeuMbimQd0qTuE6s
	 J75t6RHSZWVdw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 4/7] iio: temperature: ltc2983: Use
 fwnode_property_present() for optional properties
Reply-To: sashiko-reviews@lists.linux.dev
To: "Liviu Stan" <liviu.stan@analog.com>
Cc: devicetree@vger.kernel.org, krzk+dt@kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20260514144712.64374-5-liviu.stan@analog.com>
References: <20260514144712.64374-5-liviu.stan@analog.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 14 May 2026 20:04:27 +0000
Message-Id: <20260514200428.680FFC2BCB3@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:
- [High] Bypassed software validation for RTD rotation when `adi,number-of-=
wires` is absent.
- [Medium] The commit only partially implements its stated goal, leaving mu=
ltiple instances of the exact same error-swallowing anti-pattern throughout=
 the driver.
--

commit 94ec4e6144c071e0f0444b0ad792dffbdf874d09
Author: Liviu Stan <liviu.stan@analog.com>

iio: temperature: ltc2983: Use fwnode_property_present() for optional prope=
rties

This commit attempts to fix the silent swallowing of error codes when optio=
nal
properties are present but malformed. It updates the property reads for
adi,sensor-oc-current-microamp and adi,number-of-wires to check for presence
first.

> Checking fwnode_property_read_u32() return value with if (!ret)
> silently swallows meaningful error codes when a property is present
> but malformed. Use fwnode_property_present() first so that absence
> uses the default while a present but unreadable property returns
> a proper error.

Does this commit miss updating other optional properties that share the same
error-swallowing pattern?

For example, in ltc2983_rtd_new(), adi,excitation-current-microamp still
falls back to default values on any error:

	ret =3D fwnode_property_read_u32(child, "adi,excitation-current-microamp",
				       &excitation_current);
	if (ret) {
		/* default to 5uA */
		rtd->excitation_current =3D 1;

Are there other instances, like in ltc2983_diode_new(), that also need this
update to fully implement the stated goal?

> --- a/drivers/iio/temperature/ltc2983.c
> +++ b/drivers/iio/temperature/ltc2983.c
[ ... ]
> @@ -760,8 +766,12 @@ ltc2983_rtd_new(const struct fwnode_handle *child, s=
truct ltc2983_data *st,
>  		return dev_err_ptr_probe(dev, ret,
>  					 "Property reg must be given\n");
> =20
> -	ret =3D fwnode_property_read_u32(child, "adi,number-of-wires", &n_wires=
);
> -	if (!ret) {
> +	if (fwnode_property_present(child, "adi,number-of-wires")) {
> +		ret =3D fwnode_property_read_u32(child, "adi,number-of-wires", &n_wire=
s);
> +		if (ret)
> +			return dev_err_ptr_probe(dev, ret,
> +						 "Failed to read adi,number-of-wires\n");
> +
>  		switch (n_wires) {
>  		case 2:
>  			rtd->sensor_config =3D LTC2983_RTD_N_WIRES(0);

If the adi,number-of-wires property is absent, n_wires remains 0. Since
the hardware configuration correctly defaults to a 2-wire setup
(sensor_config is zero-initialized), does leaving n_wires as 0 introduce a
regression where it bypasses the later validation for RTD rotation?

Further down in ltc2983_rtd_new():

	if (fwnode_property_read_bool(child, "adi,rsense-share")) {
		/* Current rotation is only available with rsense sharing */
		if (fwnode_property_read_bool(child, "adi,current-rotate")) {
			if (n_wires =3D=3D 2 || n_wires =3D=3D 3)
				return dev_err_ptr_probe(dev, -EINVAL,
							 "Rotation not allowed for 2/3 Wire RTDs\n");

If n_wires is 0, this check is bypassed and current rotation is allowed for
a 2-wire RTD configuration. Should n_wires be explicitly set to 2 when the
property is absent to enforce this hardware constraint?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260514144712.6437=
4-1-liviu.stan@analog.com?part=3D4
