Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4FCEE17993
	for <devicetree@vger.kernel.org>; Mon, 25 May 2026 00:29:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779668964; cv=none; b=BWi7tMvh+K59HGhfeC1AxEG84rNOq4TgoZ1CLAyilNsbI8J8XnSFJBJqtTcjl5mAE4sgsKHPD+cFp4DfI9hTw5f/APvYDbRkhwlOQQkj0XJG9Fn9AQFrj/NIgmToV8TUd7lfVFp6A0o8kxEu2ExZpKKz8NHxs7pEd1/WzCdpUgY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779668964; c=relaxed/simple;
	bh=UaScykWEqibAAUvUw5unGy6k9B1WUv3te/7olwEtFag=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=gEA0STS1QVrp4jgZSlYw8fhkzMkrhtzCue6NNHagC3xa1f2UxumiEjfgsgoY7PXa6Rk8y0ZYV9aCm0UdWLGNzp/lL5vlVWWmOSLdS0XwEDjeoJ2uJXkn8tqBKpm7l3mOWw1ggpkB2uDKA+V1u8xlcGdSRG1+HdxZSinPfSNvPyI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=V12sOnNf; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="V12sOnNf"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B257D1F000E9;
	Mon, 25 May 2026 00:29:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1779668962;
	bh=nbEM149atX0fgfU8wP4FE48NEIPPbU7hLG8HDEoh5Ss=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=V12sOnNfRHvY+tLS8Q+ywDieB3dOt2z9B9lkSpUCACk31jNynAVtgQat2NlEmhBfM
	 zUR3FsDEQPJePNWQrQ394w2DdiHYXjxnR9cbU1ppRJwK+IVqS+NQ3svT/0u9onJR6C
	 +VbB6ddbP5bbfVXVsWjwr/8Mc1PGGLX+uzEAd9mkLTPyPIe/okRc1Z3q0sSlsDG/Iy
	 HT4jZ/ej3NB5n1KXJgNa45vh4hYvrfHzFBHaBu5a/Pz/D2taxJ0I3ItzzHXLlO7q56
	 taS4BtWsjI+08aw4/mImFeWiOb2Ht7zhkCpaWVIdOb3d/GRB7P/q/zamFBay73h8yp
	 rG3sl3eftaA7g==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH RFC v5 08/18] riscv_cbqri: Add capacity controller
 monitoring device ops
Reply-To: sashiko-reviews@lists.linux.dev
To: "Drew Fustini" <fustini@kernel.org>
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20260524-ssqosid-cbqri-rqsc-v7-0-v5-8-78d3a7ba9dbe@kernel.org>
References: <20260524-ssqosid-cbqri-rqsc-v7-0-v5-8-78d3a7ba9dbe@kernel.org>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 25 May 2026 00:29:22 +0000
Message-Id: <20260525002922.B257D1F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 4 potential issue(=
s) to consider:
- [High] Using GENMASK() instead of GENMASK_ULL() for 64-bit register field=
s causes the upper 32 bits of the register to be unintentionally cleared on=
 32-bit architectures.
- [High] Monitoring support is incorrectly probed by issuing a READ_COUNTER=
 operation for an invalid event on an unconfigured slot, which may falsely =
fail and disable monitoring.
- [Medium] Probing monitoring capabilities reuses cbqri_probe_feature() on =
MON_CTL, illegally writing to reserved (WPRI) bits to test for Access Type =
(AT) support.
- [Medium] Lack of bounds checking on mcid_count allows arbitrarily large l=
oops that can block the CPU during hotplug, and causes implicit hardware ID=
 aliasing.
--

commit 1c3fe5b330888927a5ac94480749c86c852d54d3
Author: Drew Fustini <fustini@kernel.org>
Subject: riscv_cbqri: Add capacity controller monitoring device ops

This commit introduces capacity monitoring operations for the RISC-V capaci=
ty
controller. It provides functions to pre-arm hardware slots with monitoring
events and execute monitoring register operations. It also updates the probe
sequence to detect capacity and bandwidth monitoring capabilities.

> diff --git a/drivers/resctrl/cbqri_devices.c b/drivers/resctrl/cbqri_devi=
ces.c
> index a97511825eedf..90a95fd111909 100644
> --- a/drivers/resctrl/cbqri_devices.c
> +++ b/drivers/resctrl/cbqri_devices.c
[ ... ]
> @@ -369,6 +407,28 @@ static int cbqri_probe_cc(struct cbqri_controller *c=
trl)
>  	}
>  	cpus_read_unlock();
> =20
> +	/* Probe monitoring features */
> +	err =3D cbqri_probe_feature(ctrl, CBQRI_CC_MON_CTL_OFF,
> +				  CBQRI_CC_MON_CTL_OP_READ_COUNTER, &status,
> +				  &has_mon_at_code);

[Severity: Medium]
Is it safe to reuse cbqri_probe_feature() for the MON_CTL register here?

cbqri_probe_feature() attempts to verify Access Type (AT) support by writing
to the AT field bits. However, the MON_CTL register does not define an AT
field, which means this implicitly writes to reserved (WPRI) bits. Could
this helper be updated to conditionally skip the AT probe sequence for
monitoring registers?

[Severity: High]
Will this probe sequence falsely disable monitoring on hardware?

This invokes cbqri_probe_feature() using the READ_COUNTER operation, which
zeroes out all other fields including EVT_ID. This sends a read command for
the NONE event (EVT_ID=3D0) to an unconfigured slot, which the hardware may
reject with an error status. If the hardware returns an error, this check
will fail and disable monitoring. Could this probe instead use
CONFIG_EVENT or handle expected failure codes?

> +	if (err)
> +		return err;
> +
[ ... ]
> @@ -436,6 +496,28 @@ static int cbqri_probe_controller(struct cbqri_contr=
oller *ctrl)
>  	return err;
>  }
> =20
> +/*
> + * Pre-arm every MCID with the Occupancy event so a subsequent READ_COUN=
TER
> + * just snapshots the live counter rather than re-configuring the slot.
> + * Called once per CC during resctrl-side cpuhp online for the L3 monito=
ring
> + * domain.
> + */
> +int cbqri_init_mon_counters(struct cbqri_controller *ctrl)
> +{
> +	int i, err;
> +
> +	for (i =3D 0; i < ctrl->mcid_count; i++) {
> +		mutex_lock(&ctrl->lock);
> +		err =3D cbqri_mon_op(ctrl, CBQRI_CC_MON_CTL_OFF,
> +				   CBQRI_CC_MON_CTL_OP_CONFIG_EVENT,
> +				   i, CBQRI_CC_EVT_ID_OCCUPANCY, NULL);

[Severity: Medium]
Does mcid_count need bounds checking against the physical hardware limit?

The ctrl->mcid_count value is used as the loop boundary, but if firmware
supplies an erroneously large value, this loop could block the CPU for an
extended period during hotplug.=20

Additionally, because the MCID field mask is 12 bits, any mcid_count larger
than 4096 will be truncated in cbqri_mon_op(), causing logical MCIDs to
incorrectly alias to the same physical hardware slot. Should an upper bound=
 be
enforced on mcid_count?

> +		mutex_unlock(&ctrl->lock);
> +		if (err)
> +			return err;
> +	}
> +	return 0;
> +}
> +
>  void cbqri_controller_destroy(struct cbqri_controller *ctrl)
>  {
>  	/*
> diff --git a/drivers/resctrl/cbqri_internal.h b/drivers/resctrl/cbqri_int=
ernal.h
> index cce13026a11ed..e776b0267837a 100644
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

[Severity: High]
Will using GENMASK() here inadvertently clear the upper 32 bits of the 64-b=
it
control register on 32-bit architectures?

When used with FIELD_MODIFY(), ~(_mask) will evaluate to a 32-bit unsigned
value which gets zero-extended to 64 bits. When this is bitwise ANDed with
the 64-bit register variable, it will wipe out the upper 32 bits, corrupting
the STATUS field before the register is written back. Should these 64-bit
field masks be defined with GENMASK_ULL() instead?

> +#define CBQRI_MON_CTL_STATUS_MASK    GENMASK_ULL(38, 32)
> +#define CBQRI_MON_CTL_STATUS_SUCCESS 1
> +

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260524-ssqosid-cb=
qri-rqsc-v7-0-v5-0-78d3a7ba9dbe@kernel.org?part=3D8
