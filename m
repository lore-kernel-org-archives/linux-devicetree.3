Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3BBD640FDAD
	for <devicetree@vger.kernel.org>; Mon, 10 Aug 2026 15:42:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786376537; cv=none; b=nNmFarRzvc4Vo5eo2tI00vy04xbUjnTjFUh5tcYznnp4+XvPAWXbPzl9rDOjeAgjmyZjyykktxHitQufO/14J8LF5AMpzKjyCHYRpfOrM7CBnFPDByjC/2aevN+zvVAQSI8Sj3stK37h11I6RzlbpV3/PeqSWGSp/Zf9cVFmWSk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786376537; c=relaxed/simple;
	bh=/jx1ZKbI7zFYIpbGsuY3IX/Lh6wjmdMjU8jTXn0QrkU=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=sE8rZV4sP+VR3nVmRH1DxuYWzz8ASOpg85ECbdgOBnO+LDwJg3nY7SiJAcf59JvBQxnDlr05KQREQNzQtDMMaRyhxQm96CE3B9N7Ezus6orfm09cIorVQbIRRCyGs5eyFskuhWdHI9evx3cLLJ2HXWVyJDKzt4USB1RM4N/qaIA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=gpfQnElR; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="gpfQnElR"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 89AA01F0155D;
	Mon, 10 Aug 2026 15:42:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786376535;
	bh=QNR3XUaYpax2llRS7uMz7sa+YRsIRu6SoPDjUCzrzvo=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=gpfQnElRrO9hhHBY4DEN3nDNaj/wHVakhY5CShFd0np9eUygZN98RCoCkzuyHp7Qb
	 vf6UwLBWOgbKlPKeMt2ZamRCjG9EgsSV5DdaGHhDxRvhN2JN0jfzcpSsFJvW0t3LBI
	 B9rCgA+ZrIsqBtc9JGa2HTNKGLkAoKqwhW41Oh54ArfzEpNz1cHBj+C1pHdN0bLs8J
	 m4bWcnAnz1fNJp7si7cvu4p7q3kOgJr66hoN91K2isWSupRZQ4lUhnMHIFgdvOYe4p
	 qSvTtxkIIAh7tpZlL6rde+w14z1q6p2k/NgwmrSaMTa3uNFShdEZoFmgSmOQExGXXe
	 jFXZPL6XXfz3w==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v5 07/14] gtrace: Add function to copy into perf AUX
 buffer
Reply-To: sashiko-reviews@lists.linux.dev
To: "Mayuresh Chitale" <mayuresh.chitale@oss.qualcomm.com>
Cc: conor+dt@kernel.org, robh@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260810152223.3946743-8-mayuresh.chitale@oss.qualcomm.com>
References: <20260810152223.3946743-1-mayuresh.chitale@oss.qualcomm.com>
 <20260810152223.3946743-8-mayuresh.chitale@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 10 Aug 2026 15:42:15 +0000
Message-Id: <20260810154215.89AA01F0155D@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:
- [High] The newly added `gtrace_path_copyto_auxbuf` function dereferences =
`gtdrv` without a NULL check, leading to a kernel panic if the component's =
driver is unbound.
- [High] Lack of module pinning or device locking in `gtrace_path_copyto_au=
xbuf` allows concurrent driver unbind or module unloading, leading to a Use=
-After-Free and kernel panic.
--

--- Patch [7]: [PATCH v5 07/14] gtrace: Add function to copy into perf AUX =
buffer ---
commit 175afd4c59c793de1c5fef3899d7379cf730bece
Author: Anup Patel <anup.patel@oss.qualcomm.com>

gtrace: Add function to copy into perf AUX buffer

This commit adds gtrace_path_copyto_auxbuf() and a new driver callback
copyto_auxbuf to allow the RISC-V trace ramsink to copy trace data into a
perf AUX buffer.

> diff --git a/drivers/hwtracing/gtrace/gtrace-core.c b/drivers/hwtracing/g=
trace/gtrace-core.c
> index 6ff1b30879472..53a3679ba69fa 100644
> --- a/drivers/hwtracing/gtrace/gtrace-core.c
> +++ b/drivers/hwtracing/gtrace/gtrace-core.c
> @@ -626,6 +626,28 @@ int gtrace_path_stop(struct gtrace_path *path)
>  }
>  EXPORT_SYMBOL_GPL(gtrace_path_stop);
> =20
> +int gtrace_path_copyto_auxbuf(struct gtrace_path *path,
> +			      struct gtrace_perf_auxbuf *buf,
> +			      size_t *bytes_copied, u64 *format)
> +{
> +	const struct gtrace_driver *gtdrv;
> +	struct gtrace_component *comp;
> +	struct gtrace_path_node *node;
> +
> +	list_for_each_entry(node, &path->comp_list, head) {
> +		comp =3D node->comp;
> +		gtdrv =3D to_gtrace_driver(comp->dev.driver);
> +		if (!gtdrv->copyto_auxbuf)

[Severity: High]
Does this sequence risk a null pointer dereference if a component's driver =
is
unbound?

If a driver is dynamically unbound via sysfs while the perf session is acti=
ve,
comp->dev.driver becomes null. The to_gtrace_driver() macro will then return
null, causing the evaluation of gtdrv->copyto_auxbuf to panic.

> +			continue;
> +
> +		*bytes_copied =3D gtdrv->copyto_auxbuf(comp, buf, format);

[Severity: High]
Can this indirect function call race with a concurrent module unload?

If the component's module is unloaded immediately after the driver pointer =
is
checked but before the callback executes, jumping to gtdrv->copyto_auxbuf()
could execute freed memory.

Could this be prevented by holding a module reference (try_module_get()) or
taking the device lock (device_lock()) while reading the driver structure a=
nd
executing the callback?

> +		return 0;
> +	}
> +
> +	return -EOPNOTSUPP;
> +}

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260810152223.3946=
743-1-mayuresh.chitale@oss.qualcomm.com?part=3D7
