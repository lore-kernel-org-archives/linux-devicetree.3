Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AD8043D16FC
	for <devicetree@vger.kernel.org>; Thu,  8 Oct 2026 09:23:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791451443; cv=none; b=PUryXK8G8qbgw4anR8+Vish5mgnB2xKU9AO+QyzxYFzL3y9/+YoM8EkJZB+XV/jPgP667kbMYgLK6XnIC78EbiF3e79FvaKAeOG9mK9R8rE+QKvlWxiWgkMDYLb1ZWkKVPhQUMJWhGsSK7RS/b7rkobeUzumazxCw63CLt44KxQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791451443; c=relaxed/simple;
	bh=iYR19gTPeZ+0mKxlq6YtuJ3afIts1ruLM4nqVfqzFGU=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date; b=KCbq/kFzMcm2+XU4ijaXX3CeyJuBpR3FJnj0IovNcA8p0uWO0K+274/EHIKKxTz8UhUpOU12DF7frJ88K5FAebn4G68ASUDAd7Fuf/W/5jLrhiL14X/qdlyyv42YsFIk9+lafp7Jb1w6bWvvrzrGgk/5T3kh9PWhaC0UHK5/9Xo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=VRZxZOAg; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="VRZxZOAg"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B14E81F000FF;
	Thu,  8 Oct 2026 09:23:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791451438;
	bh=vGBXaOW46LYPSlG/0ajmIwbaPWZx2V53Be/RKprSEAw=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=VRZxZOAggo0KuHWNOwc3mrMhW+wSsyu6WEY+eqEHXuN2SUQoCiUP/dP6kmjE8wB5+
	 JMib5lkkurO3QdGZp7r/7dHSdPxZCtj8ksmlQ7aYEtwHxQpgOwlPZvfkYvU5zeMQeM
	 OdxQWIVo/pCX00hRPiI87RB3rAP5uRd/xfv6PentKwq9y1Bu582hn4cU3c0DEBbTDX
	 69V0+fOC6FYETHyvTGIQY/G8E3CxEQTpI3hxFz/sAIhMAC4sHHZLlwg2lQR9HlC5nN
	 RLgiIWIKwveYJeMEypQdZPHM8AIuU9wqefqLZXY5MqA2J49XHOQukRKKml0ynrG/YJ
	 3fcCzHNGXvqiw==
Message-ID: <sashiko-outbox-163931@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 4/7] firmware: riscv: Add RPMI performance service
Reply-To: sashiko-reviews@lists.linux.dev
To: "Joshua Yeong" <joshua.yeong@starfivetech.com>
Cc: devicetree@vger.kernel.org, conor+dt@kernel.org, robh@kernel.org
In-Reply-To: <20261008091032.2832333-5-joshua.yeong@starfivetech.com>
References: <20261008091032.2832333-1-joshua.yeong@starfivetech.com>
 <20261008091032.2832333-5-joshua.yeong@starfivetech.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 08 Oct 2026 09:23:58 +0000
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:
- [High] firmware: riscv: Silent truncation of 64-bit physical addresses on=
 32-bit platforms
- [High] firmware: riscv: UAF on manual unbind of RPMI performance driver
--

commit 3fe9e4964a54e548bf390b9011dab852e2cb26bb
Author: Joshua Yeong <joshua.yeong@starfivetech.com>

firmware: riscv: Add RPMI performance service

This commit adds a mailbox client based core for the RISC-V RPMI performance
service group. It manages the mailbox channel, enumerates performance
domains, and exports interfaces for front-end drivers.

> diff --git a/drivers/firmware/riscv/riscv-rpmi-performance.c b/drivers/fi=
rmware/riscv/riscv-rpmi-performance.c
> index 0000000000000..d44802f07ab0a 100644
> --- /dev/null
> +++ b/drivers/firmware/riscv/riscv-rpmi-performance.c
[ ... ]
> +static int rpmi_perf_extract_attributes(struct rpmi_perf_get_fast_channe=
l_attributes_rx *rx,
> +					struct rpmi_perf_domain *domain,
> +					struct rpmi_fc_info *fc, u32 service_id)
> +{
> +	u64 region_size =3D domain->perf->fast_channel.size;
> +	u64 phys_offset, phys_addr, db_phys_addr;
[ ... ]
> +	phys_addr =3D domain->perf->fast_channel.addr + phys_offset;
> +
> +	addr =3D devm_ioremap(domain->dev, phys_addr, size);

[Severity: High]
Does this code silently truncate the 64-bit physical address on 32-bit plat=
forms?

The variables phys_addr and db_phys_addr are 64-bit u64 values. However,
devm_ioremap() takes a resource_size_t as its second argument. On 32-bit
RISC-V platforms without CONFIG_PHYS_ADDR_T_64BIT, resource_size_t is 32-bi=
t.
If the firmware supplies an address above 4GB, the upper 32 bits are silent=
ly
truncated, mapping the wrong physical memory. This could lead to memory
corruption on subsequent fast channel or doorbell iowrite32 operations.

Should the driver explicitly validate that phys_addr and db_phys_addr do not
exceed (resource_size_t)~0ULL?

> +	if (!addr) {
> +		dev_err(domain->dev,
> +			"failed to get fastchannel virtual addr in domain: %d\n",
> +			domain->id);
> +		return -EADDRNOTAVAIL;
> +	}
> +
> +	switch (service_id) {
> +	case RPMI_PERF_SRV_GET_LEVEL:
> +		fc->get_addr =3D addr;
> +		break;
> +	case RPMI_PERF_SRV_SET_LEVEL:
> +		if (SUPPORTS_DOORBELL(flags)) {
> +			db =3D devm_kzalloc(domain->dev,
> +					  sizeof(struct rpmi_fc_db_info),
> +					  GFP_KERNEL);
> +			if (!db) {
> +				ret =3D -ENOMEM;
> +				goto err_unmap;
> +			}
> +
> +			db_addr_width =3D 1 << (DOORBELL_REG_WIDTH(flags) + 3);
> +			db_phys_addr =3D le32_to_cpu(rx->db_addr_low);
> +			db_phys_addr |=3D (u64)le32_to_cpu(rx->db_addr_high) << 32;
> +
> +			/* The doorbell can be any register; map only its width. */
> +			db_addr =3D devm_ioremap(domain->dev, db_phys_addr,
> +					       db_addr_width / BITS_PER_BYTE);

[Severity: High]
Does this face the same 64-bit to 32-bit silent truncation issue as phys_ad=
dr
above when passed to devm_ioremap()?

> +			if (!db_addr) {
> +				devm_kfree(domain->dev, db);
> +				ret =3D -EADDRNOTAVAIL;
> +				goto err_unmap;
> +			}
[ ... ]
> +static struct platform_driver rpmi_perf_platdrv =3D {
> +	.driver =3D {
> +		.name =3D "riscv-rpmi-performance",
> +		.of_match_table =3D rpmi_perf_of_match,
> +	},
> +	.probe =3D rpmi_perf_probe,
> +};

[Severity: High]
Does this driver allow manual sysfs unbinding which could lead to a
use-after-free?

If a privileged user unbinds the riscv-rpmi-performance driver (or its chil=
d)
via sysfs while consumers are still attached, pm_genpd_remove() returns -EB=
USY
and leaves the domain registered in the PM core. Because the error is ignor=
ed,
devres proceeds to free the provider and genpd structs, as well as the
rpmi_perf_domain structures, and unmaps the fast channels. When a consumer
later transitions its performance state, it dereferences the freed memory a=
nd
crashes the kernel.

Should the platform driver set .suppress_bind_attrs =3D true to prevent man=
ual
sysfs unbinds?

> +
> +module_platform_driver(rpmi_perf_platdrv);

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261008091032.2832=
333-1-joshua.yeong@starfivetech.com?part=3D4
