Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795046411;
	b=XdhVjIJ4/VdS1lXZpVouhwBkfS9n2pqEM1g2FH08VKnz6Iy2Ucp7ZL+vjFe4dAmfzCHa
	 rRYzENqdLayZvxTgwowbcYsoFkJ7HBIV+kXcXg8Uq0iLhWnYyhQLj6SNjjSjtekz59iGy
	 RsAQuJMfgVER0y65+k0v6fcB+4WXDb34oFb5/394Q26MSMbmSRHl8EiUpvl+tjKK99f8r
	 BLKk/gYK+JGseAvp0cXXSpHP/5/bLmfu7vEHdMvLLEoGjcjKOM7m2bSbx4Tw0LcDRLOKt
	 83aLHBoHIu+zTjLEbDY3A6/o35zMB2Noe57q3gcOHBNGVGG9x+M5lkGRY8P/1C4EUwA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795046411;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 In-Reply-To:References:X-Mailer:MIME-Version:Content-Type:
	 Content-Transfer-Encoding;
	bh=95BhZaacN34i0fFF7Kfyb6EieMsIfD7H3uLPE59Ft90=;
	b=ckw4ZyRKU50qf0NrSsNqcEu405u9lcVFcYaqrZuQbSlDnU1M8AS1GdvcfuIBloPDUl+L
	 ioinjkhA3+DauydkMpRKq6J0x4ivZif3yOIsYpcLh0Tz18EI31DQK+u0nqut2DivZGrxo
	 kbTjzysmHYlJK1VsP4LrBiCNeOLv4OjJ9dM4KoeuLguVXJdVjqNB0JDDkNhGlwi+8pI63
	 V4bHBOSGIQN6+rTXnVrP/NTpGgJxoOv4zFSs9gi1GO7CSZXCcOJ/yZyxLUzcoERBqVU9E
	 kL3+OaS0I8b/gWdjsWeiIk0fP/XvNNbsqLMMWytBH1qxixlJytU0Fk2F2RtXsNTLezA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b="Q+715F/+";
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 80EB6606A330;
	Thu, 19 Nov 2026 00:00:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Q+715F/+
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8A7371F000C4;
	Thu, 19 Nov 2026 00:00:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795046411;
	bh=95BhZaacN34i0fFF7Kfyb6EieMsIfD7H3uLPE59Ft90=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References;
	b=Q+715F/+EfgqUhtk6oXjQYPoTDq26lFCum27vHpPitcYeLyac1v55S696Zqb2GJLb
	 Y/g7E4Qzvzq19c/Is7Mfh3MPftXq5qxDbyxH8Do1JGs5H+HmR8abTE5pf3FJ8urcHP
	 n4chz1xJig38lwPuxUQy0tkcA0BDb7x3M+gofU0r2tBtEvGcBej0tJuqcRVyANQFh1
	 E4GASDz5/5/Ex2PKnF6nhmPuNfw1I+R4hABi3+jgDgI580yQwNEP/jceH1LTPzqhhV
	 wKq3l+c/3gXj4/CYmzHex9/CsE9KVCeav4mfwZMN7XDPlkOLD3Wjr4mY+yU5MMJGOQ
	 AzNoW1Oc1Je9g==
Date: Thu, 19 Nov 2026 00:00:00 +0000
From: Jonathan Cameron <jic23@kernel.org>
To: Drew Fustini <fustini@kernel.org>
Cc: Adrien Ricciardi <aricciardi@baylibre.com>, Alexandre Ghiti
 <alex@ghiti.fr>, Albert Ou <aou@eecs.berkeley.edu>, Atish Patra
 <atish.patra@linux.dev>, Babu Moger <babu.moger@amd.com>, Ben Horgan
 <ben.horgan@arm.com>, Borislav Petkov <bp@alien8.de>, Chen Pei
 <cp0613@linux.alibaba.com>, Conor Dooley <conor.dooley@microchip.com>,
 Conor Dooley <conor+dt@kernel.org>, Dave Hansen
 <dave.hansen@linux.intel.com>, Dave Martin <Dave.Martin@arm.com>, Fenghua
 Yu <fenghuay@nvidia.com>, Gong Shuai <gong.shuai@sanechips.com.cn>, Gong
 Shuai <gsh517@gmail.com>, guo.wenjia23@zte.com.cn, James Morse
 <james.morse@arm.com>, Kornel =?UTF-8?B?RHVsxJliYQ==?=
 <mindal@semihalf.com>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 liu.qingtao2@zte.com.cn, Liu Zhiwei <zhiwei_liu@linux.alibaba.com>, Palmer
 Dabbelt <palmer@dabbelt.com>, Paul Walmsley <pjw@kernel.org>, Peter Newman
 <peternewman@google.com>, Radim =?UTF-8?B?S3LEjW3DocWZ?=
 <radim.krcmar@oss.qualcomm.com>, Reinette Chatre
 <reinette.chatre@intel.com>, Rob Herring <robh@kernel.org>, Samuel Holland
 <samuel.holland@sifive.com>, Sunil V L <sunilvl@oss.qualcomm.com>, Tony
 Luck <tony.luck@intel.com>, Weiwei Li <liwei1518@gmail.com>, yunhui cui
 <cuiyunhui@bytedance.com>, Zhanpeng Zhang
 <zhangzhanpeng.jasper@bytedance.com>, Catalin Marinas
 <catalin.marinas@arm.com>, Shaopeng Tan <tan.shaopeng@jp.fujitsu.com>, Zeng
 Heng <zengheng@picoheart.com>, linux-kernel@vger.kernel.org,
 linux-riscv@lists.infradead.org, x86@kernel.org,
 devicetree@vger.kernel.org, linux-doc@vger.kernel.org
Subject: Re: [PATCH v12 5/5] riscv_cbqri: Add CBQRI capacity allocation
 platform driver
Message-ID: <20261119000000.1b43ba35@jic23-hlaptop>
In-Reply-To: <20261114-dfustini-atl-sc-cbqri-dt-v12-5-6ef1f627072d@kernel.org>
References: <20261114-dfustini-atl-sc-cbqri-dt-v12-0-6ef1f627072d@kernel.org>
	<20261114-dfustini-atl-sc-cbqri-dt-v12-5-6ef1f627072d@kernel.org>
X-Mailer: Claws Mail 4.4.0 (GTK 3.24.52; x86_64-pc-linux-gnu)
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Sat, 14 Nov 2026 14:06:25 -0800
Drew Fustini <fustini@kernel.org> wrote:

> Add a platform driver for CBQRI capacity controllers described in
> device tree with the riscv,cbqri-capacity-controller compatible.
> 
> The controller node points at the cache it governs with a
> riscv,cbqri-cache phandle. The driver maps the register block, looks
> that cache up in cacheinfo and uses its cache id as the resctrl domain
> id, so the binding does not need to carry a CPU mask. The controller is
> then handed to the CBQRI core, which probes its capabilities and decides
> whether to expose it through resctrl. Only an L2 or L3 cache is
> accepted, since those are the cache levels resctrl has resources for.
> 
> Nothing is vendor-specific and reg is the CBQRI register block itself,
> so any SoC that describes a CBQRI capacity controller in device tree can
> use the driver unchanged.
> 
> Tested-by: Chen Pei <cp0613@linux.alibaba.com>
> Tested-by: Zeng Heng <zengheng@picoheart.com>
> Reviewed-by: Zeng Heng <zengheng@picoheart.com>
> Signed-off-by: Drew Fustini <fustini@kernel.org>

Sorry, late to the game and pretty much a drive by review.

Still a few things below that will leave you with more readable
and probably less fragile code.

Jonathan

> diff --git a/drivers/resctrl/cbqri_capacity.c b/drivers/resctrl/cbqri_capacity.c
> new file mode 100644
> index 000000000000..6f3d06c4f74b
> --- /dev/null
> +++ b/drivers/resctrl/cbqri_capacity.c

> +static int cbqri_capacity_probe(struct platform_device *pdev)
> +{

Noted in the ACPI patch that you can save some effort there
by a few tweaks that probably make sense here anyway.

> +	struct device *dev = &pdev->dev;
> +	struct cbqri_controller_info info = {};
> +	struct device_node *cache_np;
> +	struct resource *res;
> +	void __iomem *base;
> +	u32 rcid_count, cache_level, cache_id;
> +	bool found = false;
> +	int cpu, ret;
> +
> +	base = devm_platform_get_and_ioremap_resource(pdev, 0, &res);
> +	if (IS_ERR(base))
> +		return PTR_ERR(base);
> +
> +	ret = of_property_read_u32(dev->of_node, "riscv,cbqri-rcid", &rcid_count);
> +	if (ret) {
> +		dev_err(dev, "missing riscv,cbqri-rcid\n");
It's a probe, use
		return dev_err_probe(dev, ret, "missing riscv,cbqri-rcid\n);
same for all these paths.  Sure we won't defer but it does nice formatting
and tends to save a couple of lines every time!

With the __free() magic, you can do this for all the returns in this
function.

> +		return ret;
> +	}
> +
> +	cache_np = of_parse_phandle(dev->of_node, "riscv,cbqri-cache", 0);
Follow on from glancing at the acpi and then finding this elsewhere in my
inbox.
	struct device_node *cache_np __free(device_node) =
		of_parse_phandle(dev->of_node, "riscv,cbqri-cache", 0);
and drop all the goto iritiations.

> +	if (!cache_np) {
> +		dev_err(dev, "missing riscv,cbqri-cache phandle\n");
> +		return -EINVAL;
> +	}
> +
> +	ret = of_property_read_u32(cache_np, "cache-level", &cache_level);
> +	if (ret) {
> +		dev_err(dev, "%pOF: missing cache-level\n", cache_np);
> +		goto out_put;
> +	}
> +
> +	if (cache_level != 2 && cache_level != 3) {
> +		dev_err(dev, "%pOF: unsupported cache-level %u\n",
> +			cache_np, cache_level);
> +		ret = -EINVAL;
> +		goto out_put;
> +	}
> +
> +	/*
> +	 * Associate the controller with its cache instance via cacheinfo.
> +	 * The matching cache provides the cache id used as the resctrl
> +	 * domain id.
> +	 *
> +	 * Taking the first leaf at the level is sufficient because a
> +	 * unified cache node yields one cacheinfo leaf and
> +	 * cache_setup_of_node() walks one cache node per leaf past L1, so
> +	 * the first leaf at the level has that level's node as fw_token.
> +	 *
> +	 * get_cpu_cacheinfo_level() returns the leaf only when cacheinfo
> +	 * assigned it an id (CACHE_ID), which the resctrl domain id needs.
> +	 */
> +	cpus_read_lock();
> +	for_each_online_cpu(cpu) {
> +		struct cacheinfo *ci = get_cpu_cacheinfo_level(cpu, cache_level);
> +
> +		if (ci && ci->fw_token == cache_np) {
> +			cache_id = ci->id;
> +			found = true;
> +			break;
> +		}
> +	}
> +	cpus_read_unlock();
> +
> +	if (!found) {
> +		dev_err(dev, "%pOF: no online hart reports an L%u cache with a cache id for this node\n",
> +			cache_np, cache_level);
> +		ret = -ENODEV;
> +		goto out_put;
> +	}
> +
> +	info.type = CBQRI_CONTROLLER_TYPE_CAPACITY;
> +	info.base = base;
> +	info.addr = res->start;
> +	info.size = resource_size(res);
> +	info.rcid_count = rcid_count;
> +	info.cache_id = cache_id;
> +	info.cache_level = cache_level;
	info = (struct cbqri_controller_info) {
		.type = CBQRI_CONTROLLER_TYPE_CAPACITY,
		.base = base,
		.addr = res->start,
		.size = resource_size,
	...

Might as well as you nicely set everything here.
It's more readable and also makes it clear anything not set
is zeroed without anyone having to go check the = { }; above.


	};
> +
> +	ret = riscv_cbqri_register_cc(&info);
> +	if (ret) {
> +		dev_err(dev, "failed to register capacity controller: %d\n", ret);
> +		goto out_put;
> +	}
> +
> +	dev_info(dev, "registered L%u capacity controller at %pa (cache_id=%u, rcid=%u)\n",
> +		 cache_level, &info.addr, cache_id, rcid_count);
> +
> +out_put:
> +	of_node_put(cache_np);
> +	return ret;
> +}


