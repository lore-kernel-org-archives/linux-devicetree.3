Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 727C4288B2
	for <devicetree@vger.kernel.org>; Sat, 12 Sep 2026 10:27:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789208850; cv=none; b=kpEaXb5OaZmTT06WgBc+ra6ZkvBH7AVhZG8H2OxVtmOWzyiu+cCkH+1yjLsKE3we65NQ0razsGP5FHCyxGM8VwrWoLFNFm9hzzkbqZpQoi4Lwmp7fOWeRc8kl8WcWjlexVvfXbn8F6ORig8lEtbqNC1zTrhLwYeIDi1HXsAhJ4o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789208850; c=relaxed/simple;
	bh=c83bTX8md/JC+4CmWAgWqLF+wvBwX96+KeqR8FVxH7Y=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=Jk7DsPH5syqGusbZK8NQgxRB3Oty40jtvXsDxqFvp1zM9ERkH5cbS3HUF8aFkOv1o/9g6I5hJOGJRjTViiSkn/o0j4MLPNFEL1u0iCWBcMLQGIil8oin8uKVkCRrVQ8/CAhyEziz9R+ruKYF3NiVptXHv/D6cH9gL5lxUXq8FHY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=kYhlKoHM; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="kYhlKoHM"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1F3D41F00893;
	Sat, 12 Sep 2026 10:27:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789208849;
	bh=xeN3mIOeq0oA43LR9HIAFWKaAPQ3U3PSmV/5p+5aWJY=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=kYhlKoHMVRQJbVjJA7TdJJS60ynIH+sUxWIJfrcbePCo/wv697Y3dRiAD7kCLvnar
	 bDLponW88aXScdqx4PZxqZaDeKgbGcWyakU1MlRa2cdi3Ciw3jC9ZEQ5Dnoj5inktw
	 PvgieaVb4zs4+KxdmmSqSXKLSrfmgM95qBG0Bs3/aFM6jCOclqqavGzua2TIQWBLeo
	 RDz5xXIsj/YWDpA4Evo3OH6mOcg1M/J/KLCHgHEOxj1ft7AW0BpaAHZwL/NHMJpRgt
	 yxMXUgO/DAUoqCzA3kkpoH3OGiy9dfEsgZPpLDkggtbDYI54Eg2wSpIy+AxkwVI0LT
	 IT0rhQZFzWq/w==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH RFC 1/5] optee: riscv: add RPMI TEE service group
 transport
Reply-To: sashiko-reviews@lists.linux.dev
To: "Amirreza Zarrabi" <amirreza.zarrabi@oss.qualcomm.com>
Cc: robh@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260912-rpmi-tee-service-grp-dev-v1-1-1d1d35c2a859@oss.qualcomm.com>
References: <20260912-rpmi-tee-service-grp-dev-v1-0-1d1d35c2a859@oss.qualcomm.com>
 <20260912-rpmi-tee-service-grp-dev-v1-1-1d1d35c2a859@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sat, 12 Sep 2026 10:27:28 +0000
Message-Id: <20260912102729.1F3D41F00893@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:
- [High] The driver incorrectly maps Linux logical CPU IDs to DT mailbox ch=
annels and incorrectly sizes the channel array using `num_possible_cpus()`,=
 breaking on sparse CPU masks and differing logical/physical mappings.
- [Medium] Tristate configuration bug causes `optee_riscv.o` to be built as=
 a separate, useless module and silently disables the feature when `CONFIG_=
RISCV_SBI_MPXY_MBOX` is built as a module (`=3Dm`).
--

commit 24671dee2dd22fa1cba0bfbc89feb8174b438236
Author: Amirreza Zarrabi <amirreza.zarrabi@oss.qualcomm.com>

optee: riscv: add RPMI TEE service group transport

Add an OP-TEE transport for RISC-V using the RPMI TEE service group over
the SBI MPXY mailbox framework.

> diff --git a/drivers/tee/optee/Makefile b/drivers/tee/optee/Makefile
> index ad7049c1c1072..925b8ec7ef688 100644
> --- a/drivers/tee/optee/Makefile
> +++ b/drivers/tee/optee/Makefile
> @@ -9,6 +9,7 @@ optee-objs +=3D supp.o
>  optee-objs +=3D device.o
>  optee-objs +=3D smc_abi.o
>  optee-objs +=3D ffa_abi.o
> +optee-$(CONFIG_RISCV_SBI_MPXY_MBOX) +=3D optee_riscv.o

[Severity: Medium]
Will this fail to link the object into the main optee module when built as
a tristate module?

If CONFIG_RISCV_SBI_MPXY_MBOX is built as a module (=3Dm), this adds
optee_riscv.o to optee-m rather than optee-objs, creating a separate
optee_riscv.ko module instead of properly linking it into optee.ko.

[ ... ]

> diff --git a/drivers/tee/optee/optee_private.h b/drivers/tee/optee/optee_=
private.h
> index aefe1e6f56891..8d22d65e087be 100644
> --- a/drivers/tee/optee/optee_private.h
> +++ b/drivers/tee/optee/optee_private.h
[ ... ]
> @@ -426,5 +453,12 @@ int optee_smc_abi_register(void);
>  void optee_smc_abi_unregister(void);
>  int optee_ffa_abi_register(void);
>  void optee_ffa_abi_unregister(void);
> +#ifdef CONFIG_RISCV_SBI_MPXY_MBOX
> +int optee_riscv_abi_register(void);
> +void optee_riscv_abi_unregister(void);
> +#else
> +static inline int optee_riscv_abi_register(void) { return -EOPNOTSUPP; }
> +static inline void optee_riscv_abi_unregister(void) { }
> +#endif

[Severity: Medium]
Does this silently disable ABI registration when built as a module?

If CONFIG_RISCV_SBI_MPXY_MBOX is =3Dm, Kbuild defines
CONFIG_RISCV_SBI_MPXY_MBOX_MODULE instead. This causes the macro to evaluate
to false, compiling optee.ko against the dummy ABI stub and silently
dropping the feature.

[ ... ]

> diff --git a/drivers/tee/optee/optee_riscv.c b/drivers/tee/optee/optee_ri=
scv.c
> new file mode 100644
> index 0000000000000..0fe4edf92fc9b
> --- /dev/null
> +++ b/drivers/tee/optee/optee_riscv.c
[ ... ]
> +static int optee_riscv_send(struct optee *optee, struct rpmi_mbox_messag=
e *msg)
> +{
> +	int cpu, ret;
> +
> +	cpu =3D get_cpu();
> +	if (cpu >=3D optee->riscv.nr_chan || !optee->riscv.chan[cpu]) {

[Severity: High]
Can this index out of bounds on systems with sparse CPU topologies?

Because cpu is a logical ID from get_cpu(), it can be greater than or equal
to num_possible_cpus() on architectures with non-contiguous CPU IDs. This
would cause optee_riscv_send() to reject valid harts and route messages to
the wrong physical channel.

> +		put_cpu();
> +		return -ENODEV;
> +	}
> +	ret =3D rpmi_mbox_send_message(optee->riscv.chan[cpu], msg);
> +	put_cpu();
> +
> +	return ret;
> +}
[ ... ]
> +static int optee_riscv_request_channels(struct optee *optee)
> +{
> +	struct device *dev =3D optee->riscv.dev;
> +	int nr_mboxes;
> +	unsigned int cpuid;
> +
> +	nr_mboxes =3D of_count_phandle_with_args(dev->of_node, "mboxes",
> +					       "#mbox-cells");
> +	if (nr_mboxes !=3D optee->riscv.nr_chan)
> +		return dev_err_probe(dev, -EINVAL,
> +				     "Expected %u mailbox channels, got %d\n",
> +				     optee->riscv.nr_chan, nr_mboxes);
> +
> +	for (cpuid =3D 0; cpuid < optee->riscv.nr_chan; cpuid++) {
> +		optee->riscv.chan[cpuid] =3D
> +			mbox_request_channel(optee->riscv.client, cpuid);

[Severity: High]
Does this incorrectly assume a 1:1 identity mapping between the Linux logic=
al
CPU ID sequence and the hardware hart order?

Using the loop counter cpuid as the DT property index maps logical IDs
directly to hardware channels, which will route messages incorrectly if the
topology is sparse or harts are disabled.

> +		if (IS_ERR(optee->riscv.chan[cpuid])) {
> +			int ret =3D PTR_ERR(optee->riscv.chan[cpuid]);
> +
> +			optee->riscv.chan[cpuid] =3D NULL;
> +			return dev_err_probe(dev, ret,
> +					     "Failed to request channel %u\n",
> +					     cpuid);
> +		}
> +	}
> +
> +	return 0;
> +}
[ ... ]
> +static int optee_riscv_probe(struct platform_device *pdev)
> +{
> +	struct device *dev =3D &pdev->dev;
> +	struct rpmi_mbox_message msg;
> +	struct mbox_client *client;
> +	struct optee *optee;
> +	u32 servicegroup_id;
> +	unsigned int nr_cpus;
> +	int ret;
> +
> +	nr_cpus =3D num_possible_cpus();
> +	if (!nr_cpus)
> +		return dev_err_probe(dev, -ENODEV, "No harts found\n");
> +
[ ... ]
> +	optee->riscv.dev =3D dev;
> +	optee->riscv.client =3D client;
> +	optee->riscv.nr_chan =3D nr_cpus;
> +	optee->riscv.chan =3D kcalloc(nr_cpus, sizeof(*optee->riscv.chan),
> +				    GFP_KERNEL);

[Severity: High]
Is num_possible_cpus() the right size for this array?

Since the array is later indexed by the logical CPU ID in
optee_riscv_send(), it should likely be sized by nr_cpu_ids instead to
prevent out-of-bounds access vulnerabilities.

> +	if (!optee->riscv.chan) {
> +		ret =3D -ENOMEM;
> +		goto err_free_optee;
> +	}

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260912-rpmi-tee-s=
ervice-grp-dev-v1-0-1d1d35c2a859@oss.qualcomm.com?part=3D1
