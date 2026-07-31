Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 568E233ADBA
	for <devicetree@vger.kernel.org>; Fri, 31 Jul 2026 05:17:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785475026; cv=none; b=udZaKvTwPEgKfQlhM5s9H3rStCo8y1k4fp79FQR5lPhcGkLgM75/JTUTj1ZKJPEGJ+8nr/ZV7OvXIaM+oxJJliR49yP3xN/iRBola3zhYM38afdcw/Up+lL0rqla2kEgM3wvHTJa6HoMgHmMwA1p4xuiLMc6XzI9NtHEsNzxbNM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785475026; c=relaxed/simple;
	bh=tpeurmHGVqCpMJKBhkO4ATsf28mekz+kk5OWa+dGUzE=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=rFm6Gk6QzVYVlh20QiA6W3I6i9Jvl0WXuZ666auXn/h+sElrCRuYpmCP/dp/ReIcH9n3R370C6ltLnS7raKaL17Yg2RFPOe8JLCec3+K43HL/eYFIkkJ5P8ZtYML4bGpUtXZ1ZCbDebfRhznGqjWWadRyVxzNh4M6hPCJW9K6vU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=TcKN07Am; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="TcKN07Am"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5AF041F000E9;
	Fri, 31 Jul 2026 05:17:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785475024;
	bh=fu1KqBVBOBthLUz8nQ7zeV0IMtXHlb1IG4G+zADJSRw=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=TcKN07Am/0JSLkUE7iblHZSaGxC761LZ+1gegiz0bLw6tPR2Yt13J5d/vey51ZuJl
	 we1vjf2iTyYm6tbZzEPB+RtnGFhNUZ7CxEEDXKn8fuehUqoC0ec3oSjmxkhXQpOzo6
	 l3hyP5gITYwDJNGSdfnt2mA9UAItSCrcAfM8nE3LZ/xBARUNjmtxYj/GnDUkUhZtbB
	 vtWI2llXyb6dpsnjzFLvOUG87KtlvXoZLPU6Vk1Q2IW6N+HXO77qyfkbDuPbDP0mGq
	 XeXsC0DzdeHA96rNjcZdLKyMUZ20ESEdX70pqZ3qOxtpydx4hv+NA/Oud1he4JVv6p
	 hxddxRGPpupDg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 2/2] usb: typec: ucsi: ucsi_glink: Add compatible
 string for SM8475
Reply-To: sashiko-reviews@lists.linux.dev
To: "Esteban Urrutia" <esteuwu@proton.me>
Cc: conor+dt@kernel.org, devicetree@vger.kernel.org, robh@kernel.org
In-Reply-To: <20260731-sm8475-pmic-glink-v2-2-28c04928ef22@proton.me>
References: <20260731-sm8475-pmic-glink-v2-0-28c04928ef22@proton.me>
 <20260731-sm8475-pmic-glink-v2-2-28c04928ef22@proton.me>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 31 Jul 2026 05:17:03 +0000
Message-Id: <20260731051704.5AF041F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:

Pre-existing issues:
- [High] The format specifier %pOFn is incorrectly used with a struct fwnod=
e_handle pointer.
--

--- Patch [2]: [PATCH v2 2/2] usb: typec: ucsi: ucsi_glink: Add compatible =
string for SM8475 ---
commit d37a66c9dfca5e74cbcec6a0c03a891ac3e2d3bd
Author: Esteban Urrutia <esteuwu@proton.me>

usb: typec: ucsi: ucsi_glink: Add compatible string for SM8475

Add compatible string for the PMIC GLINK service running on the coprocessor
found in the SM8475 SoC.

> diff --git a/drivers/usb/typec/ucsi/ucsi_glink.c b/drivers/usb/typec/ucsi=
/ucsi_glink.c
> index 12e07b9fe6228..78a0ea349ed41 100644
> --- a/drivers/usb/typec/ucsi/ucsi_glink.c
> +++ b/drivers/usb/typec/ucsi/ucsi_glink.c
> @@ -381,6 +381,7 @@ static const struct of_device_id pmic_glink_ucsi_of_q=
uirks[] =3D {
>  	{ .compatible =3D "qcom,sc8280xp-pmic-glink", .data =3D &quirk_sc8280xp=
, },
>  	{ .compatible =3D "qcom,sm8350-pmic-glink", .data =3D &quirk_sc8180x, },
>  	{ .compatible =3D "qcom,sm8450-pmic-glink", .data =3D &quirk_sm8450, },
> +	{ .compatible =3D "qcom,sm8475-pmic-glink", .data =3D &quirk_sm8450, },
>  	{ .compatible =3D "qcom,sm8550-pmic-glink", .data =3D &quirk_sm8450, },
>  	{ .compatible =3D "qcom,x1e80100-pmic-glink", .data =3D &quirk_x1e80100=
, },
>  	{}

[Severity: High]
This is a pre-existing issue, but does pmic_glink_ucsi_probe() pass the
wrong pointer type to dev_err() when handling a missing property?

drivers/usb/typec/ucsi/ucsi_glink.c:pmic_glink_ucsi_probe() {
    ...
	device_for_each_child_node_scoped(dev, fwnode) {
		struct gpio_desc *desc;
		u32 port;

		ret =3D fwnode_property_read_u32(fwnode, "reg", &port);
		if (ret < 0) {
			dev_err(dev, "missing reg property of %pOFn\n", fwnode);
			return ret;
		}
    ...
}

The %pOFn format specifier expects a struct device_node pointer, but it is
being passed a struct fwnode_handle pointer here.

When vsnprintf processes %pOFn, it will cast the pointer to struct device_n=
ode
and read the name or full_name fields at offsets that do not match struct
fwnode_handle.

Can this exceed the size of the structure and result in reading unrelated k=
ernel
memory, potentially causing a kernel panic due to an invalid memory access =
if a
child node is missing the reg property?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260731-sm8475-pmi=
c-glink-v2-0-28c04928ef22@proton.me?part=3D2
