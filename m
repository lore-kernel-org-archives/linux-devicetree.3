Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D320978F3A
	for <devicetree@vger.kernel.org>; Mon, 21 Sep 2026 03:44:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789962271; cv=none; b=HqogCo9VjazUaeUNq8R64VboryayJEIZZZz1Go8Scb49weUd2010vianhCKbQy84j0WJY5rdyZeS4MSi/mqFnNFZybT7AQLNjcnPgTM2lA8iZsHg160P+xv13FIELDdcQLKbj0viqIhA5/HLepNjKTfqjL4Fp2pvVUNXnzj3YC0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789962271; c=relaxed/simple;
	bh=2amfRe8gadbAxTIBbOluLhldACV7gWtC4CyimXJ+KLk=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=JaID9NBivYBVrTKKrrHsB2LbcRV6p2xRlefgD1n7GK8xT1cVstOF64FNU37dqH1CMSmaGcwHbqDAaJNWNOF5iwDjeuyVYVyFT2T7Y8uQPCBU/h/Li0TsfrV4sujZwaF2Itc59CJmC5XVWtflEbneYcUmHwOZnFtP7B3/X1GB7Ss=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=mXbAv6a9; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="mXbAv6a9"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 359EC1F000FF;
	Mon, 21 Sep 2026 03:44:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789962270;
	bh=KULmxCEGXcwp3K9M9QoZxYrkfTyRtSFbu8SDPmaGICw=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=mXbAv6a9kPCRqNtfimfEGvcQrQ1rfhYDhUPq0wFDBupkJLXfBU2Kv+dX2EsllGm+9
	 C5+jXHDM1yLYV7v9jIchWo3A8gcJshauxe/yvG7Y3Mz5bMz444ExIYshdr8b+FONtO
	 8D1sPp8AtAv2OvGbKuMRL6UxGsL96lAmpzXeJp4hCX9no6meI8ommokT8WMyaB/Nf2
	 k8uskuKme3e5EeXy+uwYG0NzRs84hcLRXu8PIs3CI0ePIkg34HBEHGz1bO5QzCpNnc
	 M17Vv97/QorwcKdQg8UB080NS1kqksHSkTXYXaM8FnwDiAyiiegCdTS0RPA78fHGs5
	 Jn9bwsRSfYCtQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 1/2] drivers/of: Add of_detach_node_no_notify()
Reply-To: sashiko-reviews@lists.linux.dev
To: "Haren Myneni" <haren@linux.ibm.com>
Cc: robh@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260921033156.991481-1-haren@linux.ibm.com>
References: <20260921033156.991481-1-haren@linux.ibm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 21 Sep 2026 03:44:29 +0000
Message-Id: <20260921034430.359EC1F000FF@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Medium] of: resource leak when using of_detach_node_no_notify() for roll=
back
--

commit 32bc441a65c0469af8bda8ae3a3847daa98db314
Author: Haren Myneni <haren@linux.ibm.com>

drivers/of: Add of_detach_node_no_notify()

This commit introduces the of_detach_node_no_notify() interface to allow
callers to remove a device tree node without triggering the corresponding
detach notifiers. This is intended to handle rollback scenarios where
adding nodes in a changeset fails after partially attaching them.

> diff --git a/drivers/of/dynamic.c b/drivers/of/dynamic.c
> index 744ce0e1eb24a..fc6f22371a97c 100644
> --- a/drivers/of/dynamic.c
> +++ b/drivers/of/dynamic.c

[ ... ]

> @@ -318,6 +318,22 @@ int of_detach_node(struct device_node *np)
>  }
>  EXPORT_SYMBOL_GPL(of_detach_node);
> =20
> +/**
> + * of_detach_node_no_notify() - "Unplug" a node from the device
> + * and return without running notifiers.
> + * @np:	Pointer to the caller's Device Node
> + */
> +int of_detach_node_no_notify(struct device_node *np)
> +{
> +	mutex_lock(&of_mutex);
> +	if (!of_node_check_flag(np, OF_DETACHED))
> +		__of_detach_node(np);
> +	mutex_unlock(&of_mutex);
> +
> +	return 0;
> +}

[Severity: Medium]
Does bypassing the OF_RECONFIG_DETACH_NODE notifier during error rollback
cause resource leaks?

If a caller attempts to dynamically add a device tree node and the
OF_RECONFIG_ATTACH_NODE notifier chain fails midway, calling this new API
to roll back the attachment will skip the detach notifiers.

This fundamentally breaks subsystem teardown symmetry, which means any
previously successful attach notifiers in the chain might permanently leak
their allocated resources, such as platform_device instances.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260921033156.9914=
81-1-haren@linux.ibm.com?part=3D1
