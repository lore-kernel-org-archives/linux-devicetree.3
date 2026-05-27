Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F3D802882C5
	for <devicetree@vger.kernel.org>; Wed, 27 May 2026 06:11:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779862297; cv=none; b=fKhWZA9QS4JXZEiRUa2vOi2V7zXDPqtELpagrsNVjgWn161hf28vqo7BKEnN25qr8VZ06gfQOs0O5tes3T+jPmjVLnWIur3cwFNhF+tahjDXpVsamYs5U1qq8/D3/+gP61CQGSftRrJnDwTmN50jxsXDjssmRCLtsEY2pbu3iNA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779862297; c=relaxed/simple;
	bh=MabHYRHndKV022c7JMLN0DirHXVMOibpisuc2khWCKs=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=PY3STZi6q/XFIPoH70tcLurFuyCYaHVViB8omeoUIxJtPWXnmvhhLSJkyL8LmBgKUfEklCV1pW/Ax5BsS01AAOaPIrBpQ5aft5TtwkZIRoiEYaOVjoHKrD3wJIrIs4erjitv+/RN9xpAtRrccITcYen+TywLPE6Rv/ndGeXaIwM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=eHGJWsmb; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="eHGJWsmb"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9F3231F000E9;
	Wed, 27 May 2026 06:11:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1779862295;
	bh=mZrLNWB66fxVGum4w+y0sW+DBeNWksO8U3ZvVoqeq5g=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=eHGJWsmbXRDI4us3MD2Wsai+5RAHivgWUqhBg3Y6nRf8QHCC116Zqocpzb7pFwXqQ
	 Quaw5wNFiSW6WJOrpNjaCsE8LmbCbNaOtxf0BVJD3Oe9gK/Jj3tACTi0p7EE6V47ho
	 jUN4GY4L/xFUlK259G3sz5M2r+k7eh8mAQriQ8KDWsd5Jn6Lp+Fv8iZ+ZfoQePgE9R
	 J8Ma2puDRQpa0SX8sF+EgZmPQvUQM/598A3K25kE/5/Aext3vf0Ec27nuQyQvi3J/C
	 3H7NwknqOFeLoMkeP7T8f1IuQEOfi3AHPaFDOOL0Rob8vUs7T+j9NPpsG8tZEXa+Xu
	 jmdWtiwO7Snhw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v3 2/2] remoteproc: xlnx: enable auto boot feature
Reply-To: sashiko-reviews@lists.linux.dev
To: "Tanmay Shah" <tanmay.shah@amd.com>
Cc: devicetree@vger.kernel.org, conor+dt@kernel.org, robh@kernel.org
In-Reply-To: <20260527051611.194844-3-tanmay.shah@amd.com>
References: <20260527051611.194844-3-tanmay.shah@amd.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 27 May 2026 06:11:35 +0000
Message-Id: <20260527061135.9F3231F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 5 potential issue(=
s) to consider:

New issues:
- [Critical] Dereferencing r5_cores[j]->dev and calling rproc_free() after =
rproc_add() fails causes a Use-After-Free and Double-Free.

Pre-existing issues:
- [Critical] The driver blindly trusts a physical address and size provided=
 by the remote processor in shared memory.
- [High] The driver frees the mailbox information structure without canceli=
ng the associated background workqueue.
- [High] Data race on shared IPI transmit buffer ipi->tx_mc_buf during remo=
teproc kick.
- [High] A TOCTOU race condition exists between counting available DT child=
 nodes and iterating over them, leading to a heap buffer overflow.
--

commit 0aa3216df858c52c70549e4af6feda736a8dcc9b
Author: Tanmay Shah <tanmay.shah@amd.com>

remoteproc: xlnx: enable auto boot feature

The remoteproc framework has capability to start (or attach to) the remote
processor automatically if auto boot flag is set by the driver during
probe. This patch delays adding the remoteproc instance until the end of
cluster initialization to ensure all hardware is initialized before starting
the remote processor.

> diff --git a/drivers/remoteproc/xlnx_r5_remoteproc.c b/drivers/remoteproc=
/xlnx_r5_remoteproc.c
> index 45a62cb980725..652030f9cea20 100644
> --- a/drivers/remoteproc/xlnx_r5_remoteproc.c
> +++ b/drivers/remoteproc/xlnx_r5_remoteproc.c
[ ... ]
> @@ -1280,6 +1284,7 @@ static int zynqmp_r5_core_init(struct zynqmp_r5_clu=
ster *cluster,
>  			if (zynqmp_r5_get_rsc_table_va(r5_core))

[Severity: Critical]
This is a pre-existing issue, but does zynqmp_r5_get_rsc_table_va() blindly
trust the physical address and size provided by the remote processor in sha=
red
memory?

The driver reads the resource table address and size from a shared memory
region and passes this unvalidated physical address directly to ioremap_wc(=
).
Could a compromised remote processor supply the physical address of sensiti=
ve
host kernel memory, allowing it to overwrite arbitrary host memory and
escalate privileges when the host kernel writes status updates into it?

>  				dev_dbg(r5_core->dev, "rsc tbl not found\n");
>  			r5_core->rproc->state =3D RPROC_DETACHED;
> +			r5_core->rproc->auto_boot =3D true;
>  		}
>  	}
[ ... ]
> @@ -1304,7 +1309,7 @@ static int zynqmp_r5_cluster_init(struct zynqmp_r5_=
cluster *cluster)
>  	enum rpu_oper_mode fw_reg_val;
>  	struct device **child_devs;
>  	enum rpu_tcm_comb tcm_mode;
> -	int core_count, ret, i;
> +	int core_count, ret, i, j;
>  	struct mbox_info *ipi;

[Severity: High]
This is a pre-existing issue, but is there a race condition between
counting the available child nodes and iterating over them?

The driver allocates arrays based on the initial count from
of_get_available_child_count(), and then iterates over the child nodes
using for_each_available_child_of_node_scoped().

Since the device tree lock is not held across both operations, could
concurrent modifications (like applying an overlay) cause the loop to yield
more child nodes than initially allocated, overflowing the arrays?

[Severity: High]
This is a pre-existing issue, but is there a data race on the shared IPI
transmit buffer (ipi->tx_mc_buf) during a remoteproc kick?

In zynqmp_r5_rproc_kick(), the virtqueue ID is written to the shared buffer
before calling mbox_send_message(). Since there is no internal locking to
serialize kicks, could concurrent calls from different threads kicking
different virtqueues race on this buffer and overwrite the virtqueue ID bef=
ore
it is transmitted?

[ ... ]
> @@ -1435,16 +1440,31 @@ static int zynqmp_r5_cluster_init(struct zynqmp_r=
5_cluster *cluster)
>  		goto release_r5_cores;
>  	}
> =20
> +	for (j =3D 0; j < cluster->core_count; j++) {
> +		/* Add R5 remoteproc core */
> +		ret =3D rproc_add(r5_cores[j]->rproc);
> +		if (ret) {
> +			dev_err_probe(r5_cores[j]->dev, ret,
> +				      "failed to add remoteproc\n");

[Severity: Critical]
If rproc_add() fails, it drops the initial reference count to 0 and
frees the rproc object, which also frees the appended private data
(r5_cores[j]). Does logging the failure with r5_cores[j]->dev cause a
use-after-free here?

> +			goto delete_r5_cores;
> +		}
> +	}
> +
>  	kfree(child_devs);
>  	return 0;
> =20
> +delete_r5_cores:
> +	i =3D core_count - 1;
> +	/* delete previous added rproc */
> +	while (--j >=3D 0)
> +		rproc_del(r5_cores[j]->rproc);
> +
>  release_r5_cores:
>  	while (i >=3D 0) {
>  		put_device(child_devs[i]);
>  		if (r5_cores[i]) {
>  			zynqmp_r5_free_mbox(r5_cores[i]->ipi);

[Severity: High]
This is a pre-existing issue, but if an error occurs and we clean up by
calling zynqmp_r5_free_mbox(), the driver frees the ipi structure without
canceling the associated background workqueue (ipi->mbox_work).

If the remote processor is already running and sends a message, scheduling =
the
work, will the system workqueue subsequently execute the pending work and
dereference the freed ipi object?

>  			of_reserved_mem_device_release(r5_cores[i]->dev);
> -			rproc_del(r5_cores[i]->rproc);
>  			rproc_free(r5_cores[i]->rproc);

[Severity: Critical]
Additionally, since the rproc object was already freed by rproc_add()
on failure, will jumping to delete_r5_cores and then release_r5_cores
lead to a double-free when it calls rproc_free(r5_cores[i]->rproc)?

>  		}
>  		i--;

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260527051611.1948=
44-1-tanmay.shah@amd.com?part=3D2
