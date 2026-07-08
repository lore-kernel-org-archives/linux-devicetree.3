Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ECFBA3E92B5
	for <devicetree@vger.kernel.org>; Wed,  8 Jul 2026 07:20:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783495220; cv=none; b=I+u2WKyb+PcXvpOCzcBTvc1IiV8uJUQV/MmQDuwc1ydOAEvmFHjv/DcM3SJVuI5Y0yQJLcRY8SvltnakZwFfiCf0FlQDwTT3Q5k+WaP2/Ph9ZlCa4iZkaHTsfFJnUeHL/ynQpv7j2pAkmSaxJ+2egqlRX1WV3XOO8dD5ef2S+4Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783495220; c=relaxed/simple;
	bh=q1A6mkZZzAzdnsQmkoMUGORYm/gUp4F4TqXmRtkD5y0=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=ObS22houbspDmo87g+KEvL6wHak56842mZDR1rckBGlePpV7Oyj5qOlFI7mDyhfMeBmKEm9v9ecpo8rj4uJTBY02dcNBpH3GbH0qRmsTCzFLdkaHjc11fAq6YlSbVRXlVOVVidRGBFKx1Lk6guQeJubjSoP0zIoz1ZB6BKRFq1Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=KeKieyLK; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="KeKieyLK"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A1ADB1F000E9;
	Wed,  8 Jul 2026 07:20:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783495200;
	bh=Qy3ihGOZcvu8FGK8gMR1KWJBlUsZzIVBiU4DR8e9Dio=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=KeKieyLKLL6JrcGjNhyfix3IFl6Z6jgMMOVYuSUGcFN4x5IHgwts31YhL76e7K2IR
	 j4mMayYEXf4lIgDphCUBd/oU1HnZbGvINCCugt62hf6wMAd/fA6P8AqNzf0bbFJJkB
	 0BwaRY1DBnb7trZmeHv+497Kwvpa39Fvol1tICPagLU5RtTvp57LwasDA7w3sihfe4
	 bxzIqcTBtXDwJFg8CnixdBPaXp3wv0b3td1yKLDrxKgxd3/spSBm4x2r2SmW2uBzzr
	 G3r/0l4t3cAVaD0xZFNG1xsSK7SpajpVh9raBP4PECZuH2iAhObjEODBPCbn4ew4ur
	 cB9QLvgk5V1eQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v3 05/26] genirq/irqdesc: Annotate static information
 into meminspect
Reply-To: sashiko-reviews@lists.linux.dev
To: "Mukesh Ojha" <mukesh.ojha@oss.qualcomm.com>
Cc: robh@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260708-meminspect-v3-v3-5-7aa5a0a74d5c@oss.qualcomm.com>
References: <20260708-meminspect-v3-v3-0-7aa5a0a74d5c@oss.qualcomm.com>
 <20260708-meminspect-v3-v3-5-7aa5a0a74d5c@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 08 Jul 2026 07:20:00 +0000
Message-Id: <20260708072000.A1ADB1F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Critical] Missing explicit alignment in `MEMINSPECT_ENTRY` causes compil=
er-injected padding in the `.inspect_table` section, breaking array iterati=
on and leading to a boot-time out-of-bounds write.
--

--- Patch [5]: [PATCH v3 05/26] genirq/irqdesc: Annotate static information=
 into meminspect ---
commit 457b76345a308caf0fe6e0e39b0d770189713dab
Author: Eugen Hristev <ehristev@kernel.org>

genirq/irqdesc: Annotate static information into meminspect

Annotate vital static information into inspection table:
 - total_nr_irqs

Information on these annotated variables is stored in a dedicated
meminspect section.

> diff --git a/kernel/irq/irqdesc.c b/kernel/irq/irqdesc.c
> index 80ef4e27dcf47..4e58e7f5fc6ce 100644
> --- a/kernel/irq/irqdesc.c
> +++ b/kernel/irq/irqdesc.c

[ ... ]

> @@ -142,6 +143,7 @@ static void desc_set_defaults(unsigned int irq, struc=
t irq_desc *desc, int node,
>  }
> =20
>  unsigned int total_nr_irqs __read_mostly =3D NR_IRQS;
> +MEMINSPECT_SIMPLE_ENTRY(total_nr_irqs);

[Severity: Critical]
Does adding this meminspect entry risk a boot-time out-of-bounds write
due to missing alignment constraints in the underlying macro?

Looking at MEMINSPECT_ENTRY() in include/linux/meminspect.h, instances
of struct inspect_entry are placed into the .inspect_table linker section
without an explicit alignment constraint:

include/linux/meminspect.h:MEMINSPECT_ENTRY() {
    static const struct inspect_entry __UNIQUE_ID(...) \
    __used __section(".inspect_table") =3D {
        .id =3D idx,
        .va =3D (void *)&(sym),
        .size =3D (sz),
    }
}

On 64-bit systems where sizeof(struct inspect_entry) is 40 bytes, the
compiler can over-align static variables, inserting padding between
adjacent entries in the section.

When meminspect_prepare_table() iterates over the section using pointer
arithmetic, the pointer advances by exactly 40 bytes. If padding is
present, it will fall out of sync, read garbage values into e->id, and
cause an unbounded array index write:

kernel/meminspect/meminspect.c:meminspect_prepare_table() {
    for_each_meminspect_entry(e) {
        inspect_entries[e->id] =3D *e;
        if (!inspect_entries[e->id].pa && inspect_entries[e->id].va)
            ...
}

Could the macro definition be updated to include an alignment attribute
like __aligned(__alignof__(struct inspect_entry)) to prevent the compiler
from inserting this padding?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260708-meminspect=
-v3-v3-0-7aa5a0a74d5c@oss.qualcomm.com?part=3D5
