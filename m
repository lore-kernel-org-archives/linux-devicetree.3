Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7B9AB24677B
	for <devicetree@vger.kernel.org>; Wed, 27 May 2026 03:53:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779853989; cv=none; b=ETtlT+GOVducgf5z+ESrXMgjbFbmavx4UOND0Bbg2XaPgRsV+0M7w4DpYFxr2kNsi7viOZms/o0hOdsdD/1baihlj0ah9lTA3rQRdk/Vc1jTnecch2vog4o6u0zzHi9/q1E7O20nn32WhOTpNFVB5LQtt6WoUiiPNwiR0q6algg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779853989; c=relaxed/simple;
	bh=E/KybydKZB29FSzO5qgQizYoNcf8NDnywL5dC1V4EcQ=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=p0MyU4sgSF/DD0hjPyMqKCgsYNTWLI4lcCs0CEVgTuU0b2CtXR1xxFklF47GtI/55C1mDePAE2Geq6Fky/cL2SKsLsGFwoiwuD0NYKG+LyYTClB1UZWn6SAZEeXDN5WfU1br52KW/akoQ6ZsVmWcPdZGbxUknK63L6qkDNaC8cg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=TCXIXO4J; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="TCXIXO4J"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1E2131F000E9;
	Wed, 27 May 2026 03:53:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1779853987;
	bh=VG3rolkG8ZpQwQmZtTkNpWE18eJYRObE+EMHzjbte2s=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=TCXIXO4JJjsUU5AkR6Z3rmDfjH46vWlM+VijcTnOwK1o+yToczS4u8efZ2X0O/yBD
	 8mBJ8SrsSM1ELd8j7rVyO1izSj78oZRyNpX58bAgIRIGn/EoI978mcbNk8yexwR4XY
	 Xe4ipFZqyhtFP1NkSQ2vu58row7L3mt7SE9cU8vUWAdHez+nTb9ghjPDrYpGsG8WWH
	 mqWgrppv0stT++mVSoU8FQ764OrKH/F4xF9+13X7eDOVyaIi7XOp//v4Hok8djGx/x
	 62TeLkyQP3JAhnkvMe9P6ExZKxqlGVj2hsGFse1tJeb7TFtM4bLqKL/eG7nUr30wLm
	 lJ77RK5PvHvKw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v3 04/11] of: reserved_mem: zero total_reserved_mem_cnt
 if no valid /reserved-memory entry
Reply-To: sashiko-reviews@lists.linux.dev
To: "Wandun Chen" <chenwandun1@gmail.com>
Cc: devicetree@vger.kernel.org, conor+dt@kernel.org, robh@kernel.org
In-Reply-To: <20260527032917.3385849-5-chenwandun1@gmail.com>
References: <20260527032917.3385849-5-chenwandun1@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 27 May 2026 03:53:06 +0000
Message-Id: <20260527035307.1E2131F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:

Pre-existing issues:
- [High] This problem wasn't introduced by this patch, but the `dynamic_nod=
es` stack array in `fdt_scan_reserved_mem()` has a fixed size of `MAX_RESER=
VED_REGIONS` and lacks a bounds check when storing dynamically-placed reser=
ved memory regions, leading to a potential stack buffer overflow.
--

commit d26e031d55dfe0dd2c4b24bada22d27eff019795
Author: Wandun Chen <chenwandun@lixiang.com>

of: reserved_mem: zero total_reserved_mem_cnt if no valid /reserved-memory =
entry

Prepare for storing /memreserve/ entries in the reserved_mem array.
Zero total_reserved_mem_cnt if no valid /reserved-memory entry exists,
instead of keeping its initial value. This allows accounting for
/memreserve entries in follow-up patches.

> diff --git a/drivers/of/of_reserved_mem.c b/drivers/of/of_reserved_mem.c
> index 6d479381ff1fd..05defc91e9015 100644
> --- a/drivers/of/of_reserved_mem.c
> +++ b/drivers/of/of_reserved_mem.c
> @@ -329,11 +329,14 @@ int __init fdt_scan_reserved_mem(void)
>  	const void *fdt =3D initial_boot_params;
> =20
>  	node =3D fdt_path_offset(fdt, "/reserved-memory");
> -	if (node < 0)
> +	if (node < 0) {
> +		total_reserved_mem_cnt =3D 0;
>  		return -ENODEV;
> +	}
> =20
>  	if (__reserved_mem_check_root(node) !=3D 0) {
>  		pr_err("Reserved memory: unsupported node format, ignoring\n");
> +		total_reserved_mem_cnt =3D 0;
>  		return -EINVAL;
>  	}

[Severity: High]
This is a pre-existing issue, but does this code overflow the dynamic_nodes=
[]
array?

Looking further down in the fdt_for_each_subnode() loop in
fdt_scan_reserved_mem():

		if (err =3D=3D -ENOENT && of_get_flat_dt_prop(child, "size", NULL)) {
			dynamic_nodes[dynamic_nodes_cnt] =3D child;
			dynamic_nodes_cnt++;
		}

The dynamic_nodes array is allocated on the stack with a fixed size of
MAX_RESERVED_REGIONS, but there doesn't appear to be a bounds check on
dynamic_nodes_cnt before saving dynamically-placed regions.

Could a misconfigured or malicious device tree with more than
MAX_RESERVED_REGIONS dynamically-placed regions cause an out-of-bounds
write on the stack during the device tree scan?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260527032917.3385=
849-1-chenwandun1@gmail.com?part=3D4
