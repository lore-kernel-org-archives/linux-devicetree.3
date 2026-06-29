Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7F6DF4028D9
	for <devicetree@vger.kernel.org>; Mon, 29 Jun 2026 12:34:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782736496; cv=none; b=tSEjaBycm/EwdZnwMB3myIW7pNGCeNtWcRnizv/Ue6NOvBNqjU5GhJ/jQT4K6PPRLyA6DJHsol5uzc749pLbTOrCUI+pOuOrACdFseZyZJGsct4bLiZoBLrra4vAgiOj7WB6Qvs3vpp98IGB2hM58dNxpidczoanXUdszcRa+ls=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782736496; c=relaxed/simple;
	bh=jYYz3r5QblRtn54RPZTxdK1S0EfKv336GlsJ8DXXz9w=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=WnH/+1NjDj7In2cABJ7L0wFn7YUkrLTMkXF3BalWGh9QOZNZbuZjCBxzT+ttXjT7BPXoESs5MNUFDxFmFPyb7CuoKHDYxdtC6X3OGG6BEunp1bMKm/LDB4IPRVnR09JeaQJVpmaNZzdF7dHL4qKQTUHmfU4Hh7rj/KiSkQlPSGs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ln4HXlGT; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ln4HXlGT"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 009A21F000E9;
	Mon, 29 Jun 2026 12:34:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782736495;
	bh=yCklJLxIbLkoeMhiiiiR6QZQfTsN9k6q6fZgtm2x694=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=ln4HXlGTzUO0TLm+yMEM9UTYXokq2FSyVLoTwdEFH41Df6rlIgRYrqZDDF+bt+Pw6
	 Jiu7JoUPmzobv1zK0uj/58iXOJnHIZAqxh/Oya0dbqkIqcKUP6a+y/DdpAytMJ0zq1
	 g0J47Ha/rvnVb0MMb9gHh3yiaUaB2I+76PWkBkDSS/uXAGZiic0qTOuYpD7ALvaYOe
	 U1wT/yNvukZPZOHmuUG6L/2Em8xqPZl0TZ+T/gS7Azudo3DNUCKKcS/2CtVSonUdad
	 MTBbkl6GpZiPYo4OJZ0drJfgbGMmM+MWdcObbE4M/9AQneAcA4Ob4Qtb9o16Jau4gL
	 XPukUQAjGbj7Q==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v3 3/4] arm64: dts: qcom: sm8250: Add JPEG encoder node
Reply-To: sashiko-reviews@lists.linux.dev
To: "Atanas Filipov" <atanas.filipov@oss.qualcomm.com>
Cc: devicetree@vger.kernel.org, conor+dt@kernel.org, robh@kernel.org
In-Reply-To: <20260629121750.3469292-4-atanas.filipov@oss.qualcomm.com>
References: <20260629121750.3469292-1-atanas.filipov@oss.qualcomm.com>
 <20260629121750.3469292-4-atanas.filipov@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 29 Jun 2026 12:34:54 +0000
Message-Id: <20260629123455.009A21F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:
- [High] Renaming `interconnect-names` in the `camss` DT node violates the =
API contract and fatally breaks the `camss` driver probe on SM8250.
- [Low] The modifications to the `camss` node violate the `qcom,sm8250-cams=
s.yaml` binding schema, resulting in DT validation failures.
--

commit 28e11fda34f9237ee15cc0f987e7147787f608e8
Author: Atanas Filipov <atanas.filipov@oss.qualcomm.com>

arm64: dts: qcom: sm8250: Add JPEG encoder node

Add the JPEG encoder hardware node to the SM8250 device tree so the
qcom-jpeg V4L2 encoder driver can bind and operate on this platform.

> diff --git a/arch/arm64/boot/dts/qcom/sm8250.dtsi b/arch/arm64/boot/dts/q=
com/sm8250.dtsi
> index 7076720413ab2..d0cacb4ec35bb 100644
> --- a/arch/arm64/boot/dts/qcom/sm8250.dtsi
> +++ b/arch/arm64/boot/dts/qcom/sm8250.dtsi
> @@ -4472,6 +4472,9 @@ cci1_i2c1: i2c-bus@1 {
>  		camss: camss@ac6a000 {
>  			compatible =3D "qcom,sm8250-camss";
>  			status =3D "disabled";
> +			#address-cells =3D <2>;
> +			#size-cells =3D <2>;
> +			ranges;

[Severity: Low]
Does adding these new properties and the jpeg-encoder child node cause devi=
ce
tree validation failures?

The qcom,sm8250-camss.yaml schema uses additionalProperties: false and does
not appear to currently document these new properties or the child node. Th=
is
might cause make dtbs_check to complain about unapproved properties.

[ ... ]
> -			interconnect-names =3D "cam_ahb",
> -					     "cam_hf_0_mnoc",
> -					     "cam_sf_0_mnoc",
> -					     "cam_sf_icp_mnoc";
> +			interconnect-names =3D "ahb",
> +					     "hf_mnoc",
> +					     "sf_mnoc",
> +					     "icp_mnoc";

[Severity: High]
Will renaming these interconnect-names break the camera subsystem probe on
SM8250?

The camss driver expects the original names to be present. During boot,
camss_probe() calls camss_icc_get(), which searches for names hardcoded
in icc_res_sm8250:

drivers/media/platform/qcom/camss/camss.c:
static const struct resources_icc icc_res_sm8250[] =3D {
        { .name =3D "cam_ahb", },
        ...

If devm_of_icc_get() searches for "cam_ahb" but the device tree provides
"ahb", the lookup will return -EINVAL and cause the probe to abort.

Additionally, does renaming these properties violate the allowed items list
in qcom,sm8250-camss.yaml?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260629121750.3469=
292-1-atanas.filipov@oss.qualcomm.com?part=3D3
