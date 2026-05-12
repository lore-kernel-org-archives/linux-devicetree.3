Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0C5762E413
	for <devicetree@vger.kernel.org>; Tue, 12 May 2026 01:59:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778551140; cv=none; b=ta1Uq7DrrX9apkEmjMLq90r8Wmu9NftqRgz9zHEXX7JsidhPAIAyh6exbjh0+zYC9jeOOpP5pc7BqcjbcKIjqWiWAmIssOZU4e9hGAjrgvd/nhJC7XJ1KGKXlarFZVl/84qmGLDWpno91UkQdMSZ+TP6c2Fb0Ay56sn5BbsJ9BE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778551140; c=relaxed/simple;
	bh=WJcmO0e8TIejUjOLYSwatTxOxl2MX5ofUOikPpavaUM=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=tbqd12/bSfsotuQ5qsC7mVJV9j+NZ0lH7q719ze3+NuDt4FMysoXOkwTdGusTb4q9SRdMjn1/Yfy1oil8IEXkvA6bZKiPAvK0TW1TY6VV770FART72QNU8klPgLzAvBKdoux+/Rs5aS/a38dMWf9fI4TDpESxZpy+BwXtNLhGOg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=kEfArmUa; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="kEfArmUa"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B33A7C2BCB0;
	Tue, 12 May 2026 01:58:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778551139;
	bh=WJcmO0e8TIejUjOLYSwatTxOxl2MX5ofUOikPpavaUM=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date:From;
	b=kEfArmUaDV3HFKqnUfHG/Mn6dUIWYWMh6wda819CK+HPX7gF4ALRoZh4Zj2fZXQi5
	 KVLiq04iA+NLbOGAU4srlaKcy/2OS7Bd6Wj34wRKFDyt9IbqiKnye8k3WNoAT/fE0V
	 SWKPNjV7RxGXSEgQ0PJhsIcfiH1SXtf/kJcahuJnBUsquBt0JvhSoSaUwIQ3/QvOz+
	 guMkuKdH7XnUr/bAkvplze695gjZm5a/LmiLVHv1fkzA0jc6DHCQGbgRw+gwkp97VJ
	 rQCkab7VSOWj2Iq8/bNjmcGqHrH4ZQYMB7b49gDj7iTVkjExvHrRaJTUzzboEJ3Nj8
	 2hcIGAdvlzd4A==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH RFC v4 08/18] riscv_cbqri: Add capacity controller
 monitoring device ops
Reply-To: sashiko@lists.linux.dev
To: "Drew Fustini" <fustini@kernel.org>
Cc: krzk+dt@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org, robh@kernel.org
In-Reply-To: <20260510-ssqosid-cbqri-rqsc-v7-0-v4-8-eb53831ef683@kernel.org>
References: <20260510-ssqosid-cbqri-rqsc-v7-0-v4-8-eb53831ef683@kernel.org>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 12 May 2026 01:58:59 +0000
Message-Id: <20260512015859.B33A7C2BCB0@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 3 potential issue(=
s) to consider:
- [High] `FIELD_MODIFY()` combined with `GENMASK()` zero-extends and silent=
ly clears the upper 32 bits of 64-bit control registers on 32-bit architect=
ures.
- [High] `cbqri_probe_feature()` executes invalid hardware commands and wri=
tes to reserved bits when misapplied to the Monitoring Control Register (`M=
ON_CTL`).
- [Medium] The secondary AT=3DCODE probe in `cbqri_probe_feature()` fails t=
o re-clear the RCID field, executing on potentially uninitialized data.
--

commit dbffd276d698867b45f205b7392c7a1860a86c4d
Author: Drew Fustini <fustini@kernel.org>

riscv_cbqri: Add capacity controller monitoring device ops
   =20
Add the CC monitoring primitives. cbqri_init_mon_counters() pre-arms
every MCID with the Occupancy event so a subsequent READ_COUNTER
just snapshots the live counter without re-configuring the slot.

> diff --git a/drivers/resctrl/cbqri_devices.c b/drivers/resctrl/cbqri_devi=
ces.c
> index dc76a146e34df..e46b02d2c50d7 100644
> --- a/drivers/resctrl/cbqri_devices.c
> +++ b/drivers/resctrl/cbqri_devices.c

[ ... ]

> @@ -361,6 +402,28 @@ static int cbqri_probe_cc(struct cbqri_controller *c=
trl)
>  	}
>  	cpus_read_unlock();
> =20
> +	/* Probe monitoring features */
> +	err =3D cbqri_probe_feature(ctrl, CBQRI_CC_MON_CTL_OFF,
> +				  CBQRI_CC_MON_CTL_OP_READ_COUNTER, &status,
> +				  &has_mon_at_code);

Does reusing cbqri_probe_feature() for the Monitoring Control Register
(MON_CTL) execute invalid hardware commands and write to reserved bits?

Looking at cbqri_probe_feature(), it issues the operation while clearing the
RCID but ignores the EVT_ID field. This means it issues a counter read using
whatever uninitialized value the bootloader left in EVT_ID. Hardware is
expected to reject a counter read for an unconfigured event, returning an
error status instead of success.

Won't this expected failure cause the probe to falsely conclude monitoring =
is
unsupported?

Additionally, cbqri_probe_feature() unconditionally attempts to verify Acce=
ss
Type (AT) support by modifying bits 7:5. Since the MON_CTL register layout
does not contain an AT field, does this modify implicitly reserved bits and
risk hardware faults?

Also, in the secondary AT=3DCODE probe within cbqri_probe_feature(), it app=
ears
the RCID field is not re-cleared:

cbqri_probe_feature() {
    ...
    reg =3D saved_reg;
    FIELD_MODIFY(CBQRI_CONTROL_REGISTERS_OP_MASK, &reg, operation);
    FIELD_MODIFY(CBQRI_CONTROL_REGISTERS_AT_MASK, &reg,
                 CBQRI_CONTROL_REGISTERS_AT_CODE);
    iowrite64(reg, ctrl->base + reg_offset);
    ...
}

If the bootloader left an out-of-bounds or invalid value in the RCID field,
will this secondary probe execute on that invalid ID and potentially cause a
hardware fault?

> +	if (err)
> +		return err;

[ ... ]

> diff --git a/drivers/resctrl/cbqri_internal.h b/drivers/resctrl/cbqri_int=
ernal.h
> index 6a581a7e417be..b1169ffc599fb 100644
> --- a/drivers/resctrl/cbqri_internal.h
> +++ b/drivers/resctrl/cbqri_internal.h

[ ... ]

> @@ -39,6 +41,20 @@
>  #define CBQRI_CC_ALLOC_CTL_OP_READ_LIMIT   2
>  #define CBQRI_CC_ALLOC_CTL_STATUS_SUCCESS  1
> =20
> +#define CBQRI_CC_MON_CTL_OP_CONFIG_EVENT 1
> +#define CBQRI_CC_MON_CTL_OP_READ_COUNTER 2
> +
> +/* mon_ctl field masks (CC and BC share an identical OP/MCID/EVT_ID/STAT=
US layout) */
> +#define CBQRI_MON_CTL_OP_MASK        GENMASK(4, 0)
> +#define CBQRI_MON_CTL_MCID_MASK      GENMASK(19, 8)
> +#define CBQRI_MON_CTL_EVT_ID_MASK    GENMASK(27, 20)

Can FIELD_MODIFY() combined with GENMASK() zero-extend and silently clear t=
he
upper 32 bits of 64-bit control registers on 32-bit architectures?

Since CBQRI_MON_CTL_OP_MASK and CBQRI_MON_CTL_MCID_MASK are defined using
GENMASK(), they yield an unsigned long (32-bit on RV32).

When FIELD_MODIFY() does *(_reg_p) &=3D ~(_mask) on the 64-bit u64 reg, the
bitwise negation of the 32-bit mask is bitwise ANDed with reg. C integer
promotion rules zero-extend the unsigned 32-bit value to something like
0x00000000FFFFFFE0ULL.

Will this inadvertently clear bits 63:32 of the register to 0 before it is
written back via iowrite64(), potentially corrupting the STATUS field, the
BUSY bit, and any hardware Write-Preserve-Read-Ignore fields?

> +#define CBQRI_MON_CTL_STATUS_MASK    GENMASK_ULL(38, 32)
> +#define CBQRI_MON_CTL_STATUS_SUCCESS 1
> +

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260510-ssqosid-cb=
qri-rqsc-v7-0-v4-0-eb53831ef683@kernel.org?part=3D8
