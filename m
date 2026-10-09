Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E9DEB27B340
	for <devicetree@vger.kernel.org>; Fri,  9 Oct 2026 01:19:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791508760; cv=none; b=CHo3jm6d7x6YTgCFe7oq5EmK/+bvAIz1obhyPP6+/aIe3UYCD9QSPaSev/WCEK9QQHOHegckV35Xjc/eJ8CxX4DqxNKLpPYpbJB4ygCV1vrt2VqWao5KPdIb1BN7BLhmQTFKDusAHdgxSRyNC5/7bXgL6rhlVTDbAQbT+ijtRA8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791508760; c=relaxed/simple;
	bh=34jIuH0rxY8MsFTeVq/GxheA+Y9LPiuV67Y4KOPeOPc=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date; b=EmBLcmF/nCY/N/pScDXkvg8rGbvwGkCE+q4j/OBduqMTonfAe+c3O8BQzoSsBkE93fWU8IKqW5kcIfg1SkDJfm24dx8PrllNVaD+d7vmAq77S65Ji4E3y7ZYlUqavsq1hiA1zTKJpe8cD/mjTwDVovINxufKtHQ8+d+zelHvpi0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=l0XSk/z8; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="l0XSk/z8"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 538AB1F000FF;
	Fri,  9 Oct 2026 01:19:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791508759;
	bh=GuGZRAq0PnHSXqf4ZJPkdwwiVEPluTBDPLewmDbgrYg=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=l0XSk/z8niMlgAM8fjGhCRtqJ6nALhdO6WlVx7K3ft9+sa+RP4r5gBgUqJ+uiVfiI
	 AKXh6MpFCeynmYrrboWQ/IZpdS+oN6vEEHjV/VsHwePqJsZcAPEH7yWwRIx9aRdiyY
	 9iyDNiT1Jf+TrW3w02fdfHvrW9b2UVU3oDgoYnhc6ejJhbTOsGCBrGJkbTmVORZMX5
	 paw/yWVkxAYC43CTPRB6HwaAH8Z/xqiaO4P8IiPEYNwgK8HWxo5heyORQHM0mhvv01
	 kAUZhIzUoPWUcIiA4HnohztCeAb9WlwKq/aiacsNitKlcbJs4Tuzm3WUGyOgWebUVg
	 gk6xvZSvFAM3Q==
Message-ID: <sashiko-outbox-164696@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH] of/irq: Document of_irq_init() device node refcount
 contract
Reply-To: sashiko-reviews@lists.linux.dev
To: "Radu Rendec" <radu@rendec.net>
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20261009011324.1503697-1-radu@rendec.net>
References: <20261009011324.1503697-1-radu@rendec.net>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 09 Oct 2026 01:19:18 +0000
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Medium] of/irq: false API contract documentation encourages use-after-fr=
ee
--

commit 553b68f6aa4fe4b4ead9f98bb63dfba3cbd9c9a9
Author: Radu Rendec <radu@rendec.net>

of/irq: Document of_irq_init() device node refcount contract

This commit adds documentation to of_irq_init() claiming that the device
node refcount is intentionally never dropped upon successful initialization.

> diff --git a/drivers/of/irq.c b/drivers/of/irq.c
> index ef1ed9743907b..bf277781cdb6c 100644
> --- a/drivers/of/irq.c
> +++ b/drivers/of/irq.c
> @@ -647,6 +647,15 @@ struct of_intc_desc {
>   *
>   * This function scans the device tree for matching interrupt controller=
 nodes,
>   * and calls their initialization functions in order with parents first.
> + *
> + * The initialization functions are called while holding a refcount on t=
he
> + * device node corresponding to the device that is being initialized (pa=
ssed
> + * as the first parameter). If an initialization function is successful,=
 the
> + * device node refcount is *not* dropped (ever); this is intentional and
> + * guarantees that the pointer passed to the initialization function is =
valid
> + * not only while the function runs, but also for the rest of the kernel
> + * lifetime (i.e. it is safe for a driver to store the device node point=
er
> + * and use it *after* the initialization function returns).
>   */
>  void __init of_irq_init(const struct of_device_id *matches)
>  {

[Severity: Medium]
Does this documentation accurately reflect the code's behavior?

Looking at the end of of_irq_init() in drivers/of/irq.c, there is a cleanup
loop that explicitly drops the device node refcounts for successfully
initialized controllers remaining in the parent list:

	list_for_each_entry_safe(desc, temp_desc, &intc_parent_list, list) {
		list_del(&desc->list);
		of_node_put(desc->interrupt_parent);
		of_node_put(desc->dev);
		kfree(desc);
	}

Any successfully initialized leaf interrupt controller, and any sibling
controllers remaining in intc_parent_list when intc_desc_list becomes empty,
will have their references dropped by this final drain loop.

The documentation appears to mistake a pre-existing memory leak (where pare=
nt
controllers popped during the while loop leak their references) for an
intentional, universal API contract, while ignoring this final drain loop t=
hat
cleans up the remaining nodes.

If driver authors rely on this newly documented contract, they might assume
they do not need to take their own reference on the device node. Could this
lead to a use-after-free when the final loop drops the reference?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261009011324.1503=
697-1-radu@rendec.net?part=3D1
