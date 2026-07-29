Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BEF263CB57C
	for <devicetree@vger.kernel.org>; Wed, 29 Jul 2026 19:58:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785355110; cv=none; b=f64/me7t/2ZnWz5LsPWtAX12nSV3tJb/M7GOswzvcTTagJLdGJG+K7wGCDIV5bWGnTW4nhzvMCEBTk4fiHarU9vzqTh8KnR70cZc5xJEdOyIc87lb6c5JHDjf00ce65ihlt+QjEy4r2ywx0fxWq0vJnbwnHD8C85zgJ9rX2RDu8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785355110; c=relaxed/simple;
	bh=AFJpq9cCNfAhclp7JejA9SKxN35mw0dGiVXiZmR/Efo=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=RzLynZe31ObNv/TsTpxPOx9zpuYR7f/0FmGFc2/VKUBijwKI/jQHnp7rOxzUCL1A4Wv9Q6oLVYCcFOyO9bY/NUCcI95xBJ/bV12R/39P6dWpCVYo/TdIRHy/1gxJ6t/pDL+BK4aoTnrokE0+cZVseRrQAeUIpq5dKoSXBIyFxiw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=e9j7/pZn; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="e9j7/pZn"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DD39A1F000E9;
	Wed, 29 Jul 2026 19:58:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785355105;
	bh=aQh94SwEbkRvgXvcfc7uRG0OF+9cPWne4dFBTbHXMc0=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=e9j7/pZn9PFGzhZXRgjszE4jhbIt0EY5bykggzgK3EgpNQvDv1cTp91OVgWmMMTA7
	 CYz1i6GELiUZiT0ldjFGrcxfculRvP1Hivap4qQVrLUHt63z7VBJypuPsanFV5qzwf
	 RFWtIpU7ZAmKLfYKzk7svtLCN4z4I3aAUrPATZmT5ZYcv7BuMsYq8PfDunh8y0iLVT
	 SMMngbfM0uY3oIY2LdI/dbPxzcn0LofeTLLcievXU1wXUDCL9IELTWJ5qKOFtTe4lp
	 kNAJfITLSLqqZXrzMuwVEnyf7kVJLg9reEaM+CWbY9xaGAfAtyQP7IX8PZRaE4As/4
	 xl8H+n9ylVQQA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 2/2] usb: typec: ucsi: ucsi_glink: Add compatible string
 for SM8475
Reply-To: sashiko-reviews@lists.linux.dev
To: "Esteban Urrutia" <esteuwu@proton.me>
Cc: robh@kernel.org, devicetree@vger.kernel.org, conor+dt@kernel.org
In-Reply-To: <20260729-sm8475-pmic-glink-v1-2-c2e1967c04de@proton.me>
References: <20260729-sm8475-pmic-glink-v1-0-c2e1967c04de@proton.me>
 <20260729-sm8475-pmic-glink-v1-2-c2e1967c04de@proton.me>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 29 Jul 2026 19:58:24 +0000
Message-Id: <20260729195824.DD39A1F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 4 potential issue(=
s) to consider:

Pre-existing issues:
- [High] Passing a `struct fwnode_handle *` to the `%pOFn` format specifier=
 causes a type mismatch and potential kernel oops.
- [High] Missing `cancel_work_sync()` in the driver unbind path leads to a =
use-after-free if `notify_work` or `register_work` runs after the device is=
 removed.
- [High] Integer underflow when checking the response payload length allows=
 an out-of-bounds read if a short message is received.
- [High] Missing payload length validation leads to an out-of-bounds read i=
f a short message is received.
--

--- Patch [2]: [PATCH 2/2] usb: typec: ucsi: ucsi_glink: Add compatible str=
ing for SM8475 ---
commit d5c2643112ae1e7d3eabd43df5daa56760614154
Author: Esteban Urrutia <esteuwu@proton.me>

usb: typec: ucsi: ucsi_glink: Add compatible string for SM8475

Add compatible string for pmic-glink.

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

[Severity: High]
This isn't a bug introduced by this patch, but while reviewing this file I
noticed a pre-existing issue on the error path in pmic_glink_ucsi_probe():

drivers/usb/typec/ucsi/ucsi_glink.c:pmic_glink_ucsi_probe() {
        ...
        ret =3D fwnode_property_read_u32(fwnode, "reg", &port);
        if (ret < 0) {
                dev_err(dev, "missing reg property of %pOFn\n", fwnode);
                return ret;
        }
        ...
}

The %pOFn format specifier expects a struct device_node pointer, but fwnode=
 is
a struct fwnode_handle pointer. Does vsprintf misinterpret the pointer and
read invalid memory here, potentially leading to a panic?

[Severity: High]
This is a pre-existing issue, but I also noticed a potential use-after-free
if a work item executes after the device is removed:

drivers/usb/typec/ucsi/ucsi_glink.c:pmic_glink_ucsi_remove() {
        struct pmic_glink_ucsi *ucsi =3D dev_get_drvdata(&adev->dev);

        /* Unregister first to stop having read & writes */
        ucsi_unregister(ucsi->ucsi);
}

If an asynchronous notification from the PMIC GLINK processor schedules
notify_work or register_work just before or during device removal, the work
could execute after devres frees ucsi. Is a cancel_work_sync() missing here
to prevent the race?

[Severity: High]
This is another pre-existing issue, but I wanted to ask about a potential
integer underflow in pmic_glink_ucsi_read_ack():

drivers/usb/typec/ucsi/ucsi_glink.c:pmic_glink_ucsi_read_ack() {
        ...
        if (buf_len > len - sizeof(struct pmic_glink_hdr) - sizeof(u32))
                buf_len =3D len - sizeof(struct pmic_glink_hdr) - sizeof(u3=
2);

        memcpy(&ret_code, buf + buf_len, sizeof(u32));
        ...
}

If len is smaller than the combined sizeof headers, would the subtraction
underflow to a large unsigned value because sizeof evaluates to size_t?=20

If so, buf_len would remain unmodified, potentially causing an out-of-bounds
read when memcpy reads from buf + buf_len.

[Severity: High]
This is also a pre-existing issue, but does pmic_glink_ucsi_write_ack() mis=
s a
length check?

drivers/usb/typec/ucsi/ucsi_glink.c:pmic_glink_ucsi_write_ack() {
        const struct ucsi_write_buf_resp_msg *resp =3D data;

        if (resp->ret_code)
                return;
        ...
}

If the PMIC GLINK processor sends a short message where len is less than
sizeof(*resp), we immediately dereference resp->ret_code. Can this lead to =
an
out-of-bounds read?

>  	{ .compatible =3D "qcom,sm8550-pmic-glink", .data =3D &quirk_sm8450, },
>  	{ .compatible =3D "qcom,x1e80100-pmic-glink", .data =3D &quirk_x1e80100=
, },
>  	{}

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260729-sm8475-pmi=
c-glink-v1-0-c2e1967c04de@proton.me?part=3D2
