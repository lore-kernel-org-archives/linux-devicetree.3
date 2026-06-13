Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AFE6033689A
	for <devicetree@vger.kernel.org>; Sat, 13 Jun 2026 13:21:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781356899; cv=none; b=WYpTdBaIq40xr5DOHc4JEnUgKLN0UmEDkgH8zkufnE+SMeBbH7so3VDFTLY3NKKQ6kUndW2KqfcyIRCyP5jRe2RyJZ3YK4LI25vaWrxeVybxD9voHDMhhDdQHS1s127Lv1NbdeZXRR7FhTso+GnHtdKBAEW9JJG/SpZ6sMdy0HI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781356899; c=relaxed/simple;
	bh=XiHutBf0QkDCyezBe5SYChDrhfHSySjZYc7hbp4RuC8=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=kWDNvPZC3CL9hK8Tw4H1XqR+GgDRLYAjYdns+0r2CS0JFDS/JE+GA6kIhRbi/0nCefcpwDxXgWbr+McyoLXfpEwtRO9a9X3j8Mzh6+7hSfrtULQjbTSvoYbx+Px8uT+ayJmxLIXg1D1oDTDaWMKobEoFyfuPI+0p4GSqJSs/4Fw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=KkywLnPB; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="KkywLnPB"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6EBD21F00A3E;
	Sat, 13 Jun 2026 13:21:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781356898;
	bh=sFy1rSWe2fYfY9QdOAV6BHPdkxfMq3+0xi0Ng2kd4Mw=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=KkywLnPBiATofUMqOkI1szmPG1jXkg2LIanjq7Jk/A56A4dooLQnBNVxtd51yowc/
	 FIP82WTW8I1GYYGI4DatywWKvHFAxHWiIUJFbA25Z5mQ/z+dLU9DmBRCwV41QNvMNc
	 RU+jKwoLo8w5tiIN4Dj3HbtSn9K0vsq8TSt0AqsMvslMSkom/CtQnrGvz+ZBFJLfaV
	 qb/iwFvlhP1cj1o0k/ZsGr8ZFTj4g08tk9ltntqOZPKNV14v4rvhp4UIp7F9NHZxFB
	 e4JajbilwDYBok2nfPlTCOX4OHbUk1+yxRPplu+FT3HRE2f6b9nNxgzXVpkJu4A3nN
	 1zkK+69eu4mMg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v5 1/9] block: partitions: of: Skip child nodes without
 reg property
Reply-To: sashiko-reviews@lists.linux.dev
To: "Loic Poulain" <loic.poulain@oss.qualcomm.com>
Cc: robh@kernel.org, devicetree@vger.kernel.org, conor+dt@kernel.org
In-Reply-To: <20260612-block-as-nvmem-v5-1-95e0b30fff90@oss.qualcomm.com>
References: <20260612-block-as-nvmem-v5-1-95e0b30fff90@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sat, 13 Jun 2026 13:21:38 +0000
Message-Id: <20260613132138.6EBD21F00A3E@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 3 potential issue(=
s) to consider:

Pre-existing issues:
- [High] The device node reference for `partitions_np` is acquired but leak=
ed on both the success and incompatibility early-return paths.
- [High] Potential NULL pointer dereference in `strscpy()` if a partition n=
ode lacks both `label` and `name` properties.
- [High] Malicious device tree properties `#address-cells` and `#size-cells=
` can cause integer underflow, bypassing the length check and leading to ma=
ssive out-of-bounds reads.
--

commit a6b306502d7065c56b83fd73a46be12067fb56e3
Author: Loic Poulain <loic.poulain@oss.qualcomm.com>

block: partitions: of: Skip child nodes without reg property
   =20
Child nodes of a fixed-partitions node are not necessarily partition
entries, for example an nvmem-layout node has no reg property. The
current code passes a NULL reg pointer and uninitialized len to the
length check, which can result in a kernel panic or silent failure to
register any partitions.

> diff --git a/block/partitions/of.c b/block/partitions/of.c
> index c22b606610981..534e02a9d85f6 100644
> --- a/block/partitions/of.c
> +++ b/block/partitions/of.c
> @@ -15,6 +15,10 @@ static int validate_of_partition(struct device_node *n=
p, int slot)
>  	int a_cells =3D of_n_addr_cells(np);
>  	int s_cells =3D of_n_size_cells(np);
> =20
> +	/* Skip nodes without a reg property (e.g. nvmem-layout) */
> +	if (!reg)
> +		return 1;
> +
>  	/* Make sure reg len match the expected addr and size cells */
>  	if (len / sizeof(*reg) !=3D a_cells + s_cells)
>  		return -EINVAL;

[Severity: High]
This is a pre-existing issue, but could malicious device tree properties
cause an integer underflow here?

The functions of_n_addr_cells() and of_n_size_cells() return signed integer=
s.
If a device tree specifies a large unsigned value like 0xffffffff, these
functions will return -1.

The validation check above can be bypassed if the sum of negative and posit=
ive
cell counts equals the length ratio.

When the negative size is later passed to of_read_number(reg, a_cells) in
add_of_partition(), the internal while (size--) loop underflows, causing a
massive out-of-bounds read and panic.

[ ... ]

> @@ -97,9 +102,10 @@ int of_partition(struct parsed_partitions *state)
>  			break;
>  		}
> =20
> -		add_of_partition(state, slot, np);
> -
> -		slot++;
> +		if (of_property_present(np, "reg")) {
> +			add_of_partition(state, slot, np);

[Severity: High]
This isn't a bug introduced by this patch, but does add_of_partition() have=
 a
NULL pointer dereference risk?

Inside add_of_partition(), partname is populated by checking for "label"
and falling back to "name". If a node omits both properties, of_get_propert=
y()
returns NULL:

block/partitions/of.c:add_of_partition() {
    ...
	partname =3D of_get_property(np, "label", &len);
	if (!partname)
		partname =3D of_get_property(np, "name", &len);
	strscpy(info->volname, partname, sizeof(info->volname));
    ...
}

Will passing a NULL partname to strscpy() cause a kernel panic?

> +			slot++;
> +		}
>  	}
> =20
>  	seq_buf_puts(&state->pp_buf, "\n");

[Severity: High]
This is a pre-existing issue, but does this function leak the partitions_np
device node reference?

A reference is acquired via of_node_get(ddev->of_node) at the start of
of_partition().

If the node is not compatible with "fixed-partitions", the function returns=
 0
early without calling of_node_put(partitions_np).

Similarly, on this successful parsing path, it returns 1 without releasing
the reference.

Could this lead to memory exhaustion or block the release of dynamically
allocated device nodes every time partitions are rescanned?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260612-block-as-n=
vmem-v5-0-95e0b30fff90@oss.qualcomm.com?part=3D1
