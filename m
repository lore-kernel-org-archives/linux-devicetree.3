Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 944AE1C695
	for <devicetree@vger.kernel.org>; Wed, 27 May 2026 04:21:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779855712; cv=none; b=peX0N20eB0LlSZXHtksv4d5TMjmuDIxl/AznLbsv216jXIDlk6S/Mu9ALhbCPp5vftAQSwaqGbpcXk9ZcybvcyrCbMZ3tEeUwFrEWsEe+6k4pcGbqhZEwHPa9fT8bhT0UuvzTi9vQpyMnRa9axFee/TC6efNDkw0Je19Vsrt2uo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779855712; c=relaxed/simple;
	bh=jjoKgBIPcMbNiOJrUarnzKAca+HELRTM80mQKy0KkHU=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=Y5LY3SuPj83O/NKWGuPIesz5m7FDW9F4ZqE2l0BQKxO7IXNYJDLsIz4BPjljtLLAM6XrWh+qdz5PfGbjCmJggAZMS4WADP6tFXLQyx//u3D2lS+5jFrz1RI8f7ypNN9Dt+nRfOV6XqzZz25uIzr7KH7qkgECh2ApRf5lWQjAnRo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=jL7Rwmor; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="jL7Rwmor"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0B53E1F000E9;
	Wed, 27 May 2026 04:21:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1779855710;
	bh=IwnA42LSSq0RCS6L/8X7Y9p2QnaC8EZGVwrdU05hLtw=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=jL7Rwmor9HyJvcno5jjINNRW910QskJ+wOYhsXaQbPNFu4Idv2QemCwXevxHcm2x2
	 ChvGchWw3clez3SEJO4Dec/x7dEcnwbkzh5zo16iKfIVqNhR8ZP+4af5sHefirjq3F
	 rmbGHXkQgEqc+C8B1pIxVAglQHkY0iKHfOyT5i+97ac5G+QQfNsgHt0nP/Kfvbsgok
	 D0Okca4LIcqfQJTkI1st14lkCJAa2mJS9hxT5kMsA8ofVjDFPnb4cOf7CZjqp+As0o
	 8l98NZg4WWu4qFki06ILVgTH3tKUijcRRIIBiXqwNe8HXJLXf2v9EITDsi/PUcglDZ
	 J8HbFStecDNIg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v3 05/11] of: reserved_mem: split
 alloc_reserved_mem_array() from fdt_scan_reserved_mem_late()
Reply-To: sashiko-reviews@lists.linux.dev
To: "Wandun Chen" <chenwandun1@gmail.com>
Cc: devicetree@vger.kernel.org, conor+dt@kernel.org, robh@kernel.org
In-Reply-To: <20260527032917.3385849-6-chenwandun1@gmail.com>
References: <20260527032917.3385849-6-chenwandun1@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 27 May 2026 04:21:49 +0000
Message-Id: <20260527042150.0B53E1F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:

Pre-existing issues:
- [Critical] Stack buffer overflow in fdt_scan_reserved_mem() due to unchec=
ked dynamic_nodes array indexing.
--

commit 6c1b6f45075047e4a90f8ee8101ddc1537a9969a
Author: Wandun Chen <chenwandun@lixiang.com>

of: reserved_mem: split alloc_reserved_mem_array() from fdt_scan_reserved_m=
em_late()

This patch separates alloc_reserved_mem_array() from
fdt_scan_reserved_mem_late() so that dynamic allocation of the reserved_mem
array happens regardless of whether the device tree contains a
/reserved-memory node. This prepares the subsystem to safely store
/memreserve/ entries.

[ ... ]

> diff --git a/drivers/of/of_private.h b/drivers/of/of_private.h
> index 0ae16da066e2c..50e5a533e0591 100644
> --- a/drivers/of/of_private.h
> +++ b/drivers/of/of_private.h
> @@ -187,6 +187,7 @@ static inline struct device_node *__of_get_dma_parent=
(const struct device_node *
> =20
>  int fdt_scan_reserved_mem(void);

[Severity: Critical]
This isn't a bug introduced by this patch, but while looking at the reserved
memory code, I noticed a pre-existing issue in fdt_scan_reserved_mem().

Can this code overflow the dynamic_nodes[] array?

drivers/of/of_reserved_mem.c:fdt_scan_reserved_mem() {
    ...
	int dynamic_nodes_cnt =3D 0, count =3D 0;
	int dynamic_nodes[MAX_RESERVED_REGIONS];
    ...
	fdt_for_each_subnode(child, fdt, node) {
        ...
		if (err =3D=3D -ENOENT && of_get_flat_dt_prop(child, "size", NULL)) {
			dynamic_nodes[dynamic_nodes_cnt] =3D child;
			dynamic_nodes_cnt++;
		}
	}
    ...
}

If a device tree provided by a bootloader or via kexec contains more than
MAX_RESERVED_REGIONS (64) dynamic reserved memory regions, would the unchec=
ked
increment of dynamic_nodes_cnt overflow this stack buffer and potentially
lead to memory corruption during early boot?

>  void __init fdt_scan_reserved_mem_late(void);
> +bool __init alloc_reserved_mem_array(void);
> =20
>  bool of_fdt_device_is_available(const void *blob, unsigned long node);
> =20

[ ... ]

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260527032917.3385=
849-1-chenwandun1@gmail.com?part=3D5
