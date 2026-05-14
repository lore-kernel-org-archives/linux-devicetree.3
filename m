Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2CD973B2FCE
	for <devicetree@vger.kernel.org>; Thu, 14 May 2026 21:23:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778793834; cv=none; b=agPYDe12QCPly9sonIgbFQOPyndgkStx+lXZ3hSgXzpGWLvFInp4GPi37CAACHYsSMpSJQXcoZlfXW7m2asasW24e1eiWoiLLmO+2ZQyQTeeE3wU98Sm+kigwEAnHtzYwP5Rm2NS70zWdZlBiKRTN8UfWBBILVcKzeoSJaHDqrE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778793834; c=relaxed/simple;
	bh=JIYULCGSB2noBJxQ6YKIBj9rhgzC9JtVqenSW5A92Fc=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=jdwowjnISR/OnU60c3+uD/BcSfly+J3b8X8Jcl/NAOK66Cuj4CiZhmlihTotjt0UbS1i6tBCPFu/K6YwaEaFbk0Z2besf6BxJ+dYtneYaryIunN1EO03J8SxMZOKdJ3hLgD/QkxKwUI1+s5FE3BPZBO1vdTi9CUQA8tGFBuBctI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=u1FDEXdf; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="u1FDEXdf"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 881AFC2BCB8;
	Thu, 14 May 2026 21:23:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778793833;
	bh=JIYULCGSB2noBJxQ6YKIBj9rhgzC9JtVqenSW5A92Fc=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date:From;
	b=u1FDEXdfNDIVYSKRNSNSBed2w6Ett844Arhtau34k6iZkr5xBYP2xM4ZeXpI/7Byq
	 P/FZo4QhlTKDUhpVaYmVXtbH5WEZyQ9UqZYCN320ygMJyqsBB+cY8fNI8R+tXqm+ZD
	 Mx5gVbqwt6d5S2hvZQlzm0UgR0hsLpFflWUhw7yEgcsBZzF0aak4n2aLxPuE9vsoSo
	 3yjbdptQw7bsM94/dWScO5VUzxoaij2/dN9SqNfPo8bjRKBtCrsBhfvJezn/4T08zm
	 3lXnXIRSfLI95BODbzikzNefY7GfU72oUAvm7ImoSr8fnewkhxjFxSrz580vPhn9rI
	 LCWSq2piqBj5w==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v22 04/13] firmware: psci: Introduce command-based
 resets
Reply-To: sashiko-reviews@lists.linux.dev
To: "Shivendra Pratap" <shivendra.pratap@oss.qualcomm.com>
Cc: krzk+dt@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org, robh@kernel.org
In-Reply-To: <20260514-arm-psci-system_reset2-vendor-reboots-v22-4-28a5bde07483@oss.qualcomm.com>
References: <20260514-arm-psci-system_reset2-vendor-reboots-v22-4-28a5bde07483@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 14 May 2026 21:23:53 +0000
Message-Id: <20260514212353.881AFC2BCB8@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 4 potential issue(=
s) to consider:
- [High] Unsupported or malformed reset commands cause the reboot process t=
o silently fail and hang the system.
- [High] The API illegally truncates the 64-bit PSCI SYSTEM_RESET2 cookie p=
arameter to 32 bits, violating the ARM PSCI specification.
- [Medium] Meaningful code mismatch: Missing EXPORT_SYMBOL for functions in=
tended for external drivers.
- [Medium] Confusing and contradictory API semantics between `enum psci_res=
et_type` and the `PSCI_RESET_TYPE` macro.
--

commit bb624cd844c2478ffbac61bf8098b194ebc91887
Author: Shivendra Pratap <shivendra.pratap@oss.qualcomm.com>

firmware: psci: Introduce command-based resets

This commit introduces a command-based reset mechanism for PSCI, allowing
external drivers to specify the reset command. It adds predefined reset typ=
es
and maps them to standard PSCI resets, handling vendor-specific resets if
supported. The command-based reset is checked during the device reset flow,
falling back to the standard reboot mode on panic.

> firmware: psci: Introduce command-based resets
>=20
> PSCI currently supports only two resets - SYSTEM_RESET and SYSTEM_RESET2
> ARCH WARM reset. The reset patch is selected based on the Linux
> reboot_mode variable. The PSCI specification now includes SYSTEM_RESET2
> for vendor-specific resets but there's no mechanism to issue these
> through psci_sys_reset().
>=20
> Add a command-based reset mechanism that allows external drivers to set
> the psci reset command via a exported psci_set_reset_cmd() function.

The commit message mentions an exported function, but the implementation
does not include EXPORT_SYMBOL_GPL() for psci_set_reset_cmd(). Could this
cause module link failures if external drivers are built as modules?

[ ... ]

> --- a/drivers/firmware/psci/psci.c
> +++ b/drivers/firmware/psci/psci.c

[ ... ]

> @@ -51,6 +51,16 @@ static int resident_cpu =3D -1;
>  struct psci_operations psci_ops;
>  static enum arm_smccc_conduit psci_conduit =3D SMCCC_CONDUIT_NONE;
> =20
> +/*
> + * Encoded reset command:
> + * bits[63:32] =3D cookie
> + * bits[31:0]  =3D reset_type
> + */
> +static u64 reset_cmd;
> +
> +#define PSCI_RESET_TYPE(reset_cmd)	((u32)(reset_cmd))
> +#define PSCI_RESET_COOKIE(reset_cmd)	((u32)((reset_cmd) >> 32))

The ARM PSCI v1.1 specification defines the cookie parameter for SYSTEM_RES=
ET2
as a 64-bit value on SMC64/HVC64 platforms. Does cramming the cookie into
the upper 32 bits and casting it to a u32 silently truncate this value?

This might break vendor-specific reset implementations that require a 64-bit
cookie, as the function will receive truncated parameters.

[ ... ]

> @@ -306,8 +345,24 @@ static int get_set_conduit_method(const struct devic=
e_node *np)
>  	return 0;
>  }
> =20
> -static int psci_sys_reset(struct notifier_block *nb, unsigned long actio=
n,
> -			  void *data)
> +static void psci_handle_reset_cmd(void)
> +{
> +	u32 psci_sys_reset_fn;
> +
> +	if ((reset_cmd & BIT_ULL(31)) && psci_system_reset2_supported) {
> +		/* PSCI SYSTEM_RESET2 Vendor-specific reset */
> +		invoke_psci_fn(PSCI_FN_NATIVE(1_1, SYSTEM_RESET2),
> +			       PSCI_RESET_TYPE(reset_cmd),
> +			       PSCI_RESET_COOKIE(reset_cmd), 0);
> +	} else {
> +		/* cookie part of the reset_cmd decides ARCH WARM RESET vs SYSTEM_RESE=
T */
> +		psci_sys_reset_fn =3D psci_fn_from_cookie(PSCI_RESET_COOKIE(reset_cmd)=
);
> +		if (!PSCI_RESET_TYPE(reset_cmd) && psci_sys_reset_fn)
> +			invoke_psci_fn(psci_sys_reset_fn, 0, 0, 0);
> +	}
> +}

What happens if an external driver provides an unsupported or malformed res=
et
command?=20

If bit 31 is set but psci_system_reset2_supported is false, or if an
unrecognized cookie results in a null psci_sys_reset_fn, neither branch
invokes the PSCI function.

psci_handle_reset_cmd() will return without doing anything, and
psci_sys_reset() will return NOTIFY_DONE without falling back to the default
reboot behavior.

Could this leave the system in a hung state instead of rebooting gracefully?

[ ... ]

> --- a/include/linux/psci.h
> +++ b/include/linux/psci.h

[ ... ]

> +/**
> + * enum psci_reset_type	-	PSCI_RESET_TYPE for SYSTEM_RESET.
> + * @PSCI_RESET_TYPE_SYSTEM_RESET: Standard SYSTEM_RESET command.
> + * @PSCI_RESET_TYPE_SYSTEM_RESET2_ARCH_WARM: SYSTEM_RESET2 architectural=
 warm reset.
> + *
> + * These enum values map PSCI_RESET_TYPE_SYSTEM_* constants to reset str=
ings
> + * issued from user space. When user space requests a reset, the cookie
> + * carries one of these values, and the PSCI reset path translates it in=
to
> + * the appropriate PSCI system reset call.
> + */
> +enum psci_reset_type {
> +	PSCI_RESET_TYPE_SYSTEM_RESET =3D 1,
> +	PSCI_RESET_TYPE_SYSTEM_RESET2_ARCH_WARM,
> +};

Is the naming of this enum potentially confusing? The PSCI_RESET_TYPE macro
defined earlier extracts the lower 32 bits, but these enum values are mapped
to the upper 32 bits (the cookie) as handled by psci_fn_from_cookie().

Naming the cookie enum values as reset_type contradicts the macro
design and might lead to developers passing these enum values into the
reset_type field by mistake.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260514-arm-psci-s=
ystem_reset2-vendor-reboots-v22-0-28a5bde07483@oss.qualcomm.com?part=3D4
