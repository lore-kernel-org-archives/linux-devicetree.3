Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AD39EDDA9
	for <devicetree@vger.kernel.org>; Mon, 25 May 2026 00:36:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779669370; cv=none; b=DM3vBiRogLM04kNBQDQOioCz/rxvdInHUoihbWBgPjWVFY7aAdfcG9V7XMKvHWCVc2mfFKAyhGzBqa2bWYrCGXTRJSbqC1XrwXh+MpKJ6149TdGx5w8/TrJBJHWMnr+3gRxVgTuTGc/VLf7PpunC6aVMv3s72VRtIzX5TxqBGnM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779669370; c=relaxed/simple;
	bh=yJrLGYhtWIEyXvv2dk/7qrvfAZab8JWuBm4EKooXAaE=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=PUBXmjw7rH6tExEO3dQlGZFuJVze4uhpXM/8zWRTeCHtyRWHGW9LPbiHCvaxWCenBmrvaGH7VpYVwyh8JkRpQJtoLPP53iOCyOW1tl025tL4X1i2KpNzEHN1pWq8Hx/rNwRngH3WtogUziT+ewtvsIVR/hbM3l6o+qMjgiCp+p8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Ljvpit2/; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Ljvpit2/"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AC42A1F000E9;
	Mon, 25 May 2026 00:36:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1779669368;
	bh=ukezAw6WewpWjFcWCcdcM5u1kwgFpHkb9EOikaLd//c=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=Ljvpit2/xISj40px2uVf7s5Sntoo5T2WeEKZV/6OjDawsi37mPD/PfqOeKSX/1hqK
	 mR0i0AsaJlM9UGAbpo2IoSqA9o/0p1jPqPQwp+o/2prmm4uTQ2bLVA0wLMQE6QUK1x
	 VUJJtVA058mFIRKhVNPJrLGNSOUyK+T5qk55kHN5UpscpZsCQXjx4QQkktfuYTlx5r
	 Y9zr/3xs9kOJqFhwkS1mOon4BhBFQvsaMDpFYFMlcSL1u5wxTL6ja/jJPtyGTxDzjz
	 Jwiw/ps3Y2W9Vn82GQdQf7SLwBBmoM+he8VYYwKrmIVFefUTO9n3t8uoYuEn++B9Oy
	 8toUB+jve0rLQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH RFC v5 10/18] riscv_cbqri: Add bandwidth controller
 monitoring device ops
Reply-To: sashiko-reviews@lists.linux.dev
To: "Drew Fustini" <fustini@kernel.org>
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20260524-ssqosid-cbqri-rqsc-v7-0-v5-10-78d3a7ba9dbe@kernel.org>
References: <20260524-ssqosid-cbqri-rqsc-v7-0-v5-10-78d3a7ba9dbe@kernel.org>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 25 May 2026 00:36:08 +0000
Message-Id: <20260525003608.AC42A1F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:

Pre-existing issues:
- [High] FIELD_MODIFY() with 32-bit GENMASK clobbers the upper 32 bits of u=
64 registers on 32-bit architectures.
--

commit 2899144e0d033d58b2dccb062c36578b86f11e62
Author: Drew Fustini <fustini@kernel.org>

riscv_cbqri: Add bandwidth controller monitoring device ops

This commit adds bandwidth controller monitoring primitives. It allocates a
per-MCID software accumulator to extend the 62-bit hardware counter into a
64-bit byte total and handles overflow when reading the counter. It also
provides a function to discover the single mon-capable bandwidth controller.

> diff --git a/drivers/resctrl/cbqri_internal.h b/drivers/resctrl/cbqri_int=
ernal.h
> index 48f8a6e1923e2..555512cf7eab9 100644
> --- a/drivers/resctrl/cbqri_internal.h
> +++ b/drivers/resctrl/cbqri_internal.h
[ ... ]
> @@ -63,12 +63,26 @@
>  #define CBQRI_CC_MON_CTL_OP_CONFIG_EVENT 1
>  #define CBQRI_CC_MON_CTL_OP_READ_COUNTER 2
> =20
> +#define CBQRI_BC_MON_CTL_OP_CONFIG_EVENT 1
>  #define CBQRI_BC_MON_CTL_OP_READ_COUNTER 2
> =20
> -/* mon_ctl field masks (CC and BC share an identical OP/MCID/EVT_ID/STAT=
US layout) */
> -#define CBQRI_MON_CTL_OP_MASK        GENMASK(4, 0)
> -#define CBQRI_MON_CTL_MCID_MASK      GENMASK(19, 8)
> -#define CBQRI_MON_CTL_EVT_ID_MASK    GENMASK(27, 20)
> +/* Bandwidth usage monitoring event IDs (CBQRI spec Table 10) */
> +#define CBQRI_BC_EVT_ID_TOTAL_READ_WRITE  1
> +
> +/* bc_mon_ctr_val layout (CBQRI spec section 4.3, Figure 7) */
> +#define CBQRI_BC_MON_CTR_VAL_CTR_MASK    GENMASK_ULL(61, 0)
> +#define CBQRI_BC_MON_CTR_VAL_INVALID     BIT_ULL(62)
> +#define CBQRI_BC_MON_CTR_VAL_OVF         BIT_ULL(63)
> +
> +/*
> + * mon_ctl field masks (CC and BC share an identical OP/MCID/EVT_ID/STAT=
US
> + * layout). Keep all masks u64-wide so FIELD_MODIFY() on a u64 register
> + * never zero-extends a 32-bit ~mask and clobbers the WPRI/STATUS/BUSY
> + * fields in bits 63:32 for future support of RV32
> + */
> +#define CBQRI_MON_CTL_OP_MASK        GENMASK_ULL(4, 0)
> +#define CBQRI_MON_CTL_MCID_MASK      GENMASK_ULL(19, 8)
> +#define CBQRI_MON_CTL_EVT_ID_MASK    GENMASK_ULL(27, 20)

[Severity: High]
This isn't a bug introduced by this patch, but does the same fix need to be
applied to other masks?

It looks like the CBQRI_CONTROL_REGISTERS_*_MASK macros (for example,
CBQRI_CONTROL_REGISTERS_OP_MASK) continue to use the 32-bit GENMASK().

When these 32-bit masks are passed to FIELD_MODIFY() on a u64 variable in
functions like cbqri_cc_alloc_op(), standard C promotion rules will zero-ex=
tend
the 32-bit ~mask value. This would clear bits 63:32 of the register, clobbe=
ring
the WPRI, STATUS, and BUSY fields when written back to the device via
iowrite64().

Should these other macros also be upgraded to GENMASK_ULL() to prevent sile=
nt
hardware state corruption on 32-bit architectures like RV32?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260524-ssqosid-cb=
qri-rqsc-v7-0-v5-0-78d3a7ba9dbe@kernel.org?part=3D10
