Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 141FD489FB0
	for <devicetree@vger.kernel.org>; Wed, 23 Sep 2026 12:15:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790165715; cv=none; b=pQki30C7FASYEQXci538BT+Grh1TRU4pEN12il0MltP8T8UBSZ8bUaK9EAbNVbI45JlWMZT61nrz7KfXlPjCsqIvMblXuC9xK0CwGqwZ/nOc7MFqtu1NcDyUQd8/wbJUY++oxzlg13u9o2DXue7TPmYtzqISWnNz1PRNHz1tyiI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790165715; c=relaxed/simple;
	bh=fIDtIRPZjyjyCihqTv+y71RcYjfbZVptFe/4KS2KD64=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=KHhHV7VvwisfsoS+y+HXyYX2652uxRc+aDdEIg0/1U7/T2xY4K+UnYp8xm6tvN5+IfQ7Vwd6aF3NWnzaI//4ymsIS87oOtVX+hdgtd7vM+/RCQXnfgh/v9MmhE5mhnRZiIBtpYlMI6L70URhvpDMszZt5bh2G0IA1EUkYM8F9w8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=OVGFOyBa; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="OVGFOyBa"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9362C1F000FF;
	Wed, 23 Sep 2026 12:15:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790165713;
	bh=iUH8Hngt/+MbUTbvMTQnGUv/XowGGbEOHt5Z3UjOVZE=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=OVGFOyBanyaXIK2ZECOSE3zco1s2SEA8GZG3izyXYAs2cBZPjeHwtx5zGVz6mqLc5
	 TcjiZaIl+u28EmmuPDGOXImINX7LnN+Xwo5uPKIhukSQ/jKvU0PGkF0UdAqgoPmMxa
	 1WVxenopwlbO4dUF3HT4XO9bdoZxZmqqUgDNis25dC+Vfr2Z2VK8gm7Xo9nKUodFAj
	 LefOGwaOxGzOgTp5Px0WZu8sXCEFGIqc1dJiQOj/KfBqVmXeSw2v8sQlbcNTdyRTjd
	 SV2F6iFJeC8puno6ndYBJWLJFXvM786ucXLinE0YXHXiww1BIPIHAhEoQL24IbXRso
	 wqQt6kbdjlEeQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH ath-next 04/16] wifi: ath11k: Add support for loading m3
 mbn firmware
Reply-To: sashiko-reviews@lists.linux.dev
To: "George Moussalem" <george.moussalem@outlook.com>
Cc: devicetree@vger.kernel.org, conor+dt@kernel.org, robh@kernel.org
In-Reply-To: <20260923-ipq5018-qcn6122-mpd-v1-4-86729521a75c@outlook.com>
References: <20260923-ipq5018-qcn6122-mpd-v1-0-86729521a75c@outlook.com>
 <20260923-ipq5018-qcn6122-mpd-v1-4-86729521a75c@outlook.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 23 Sep 2026 12:15:13 +0000
Message-Id: <20260923121513.9362C1F000FF@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:
- [High] Missing IS_ERR check on devm_memremap() leads to kernel panic
- [Medium] Permanent memory mapping of firmware region risks secure memory =
violation
--

commit 3ba907fe6d594d6c69e92925ac78d06c3ce54aaf
Author: George Moussalem <george.moussalem@outlook.com>

wifi: ath11k: Add support for loading m3 mbn firmware

This commit adds support for loading the m3 firmware in MBN (MDT) format
for ath11k WiFi chips. It introduces a function to allocate a memory region,
request the firmware, and load MDT segments.

> diff --git a/drivers/net/wireless/ath/ath11k/ahb.c b/drivers/net/wireless=
/ath/ath11k/ahb.c
> index 86723a2eb3d26..9fe2e112dfb81 100644
> --- a/drivers/net/wireless/ath/ath11k/ahb.c
> +++ b/drivers/net/wireless/ath/ath11k/ahb.c
[ ... ]
> @@ -962,6 +964,58 @@ static int ath11k_ahb_boot_root_pd(struct ath11k_bas=
e *ab)
>  	return 0;
>  }
> =20
> +static int ath11k_ahb_load_m3_firmware(struct ath11k_base *ab)
> +{
[ ... ]
> +	mem_phys =3D res.start;
> +	mem_size =3D resource_size(&res);
> +	mem_region =3D devm_memremap(ab->dev, mem_phys, mem_size, MEMREMAP_WC);

[Severity: High]
Does this code miss an error check for devm_memremap()?

When devm_memremap() fails in ath11k_ahb_load_m3_firmware() within
drivers/net/wireless/ath/ath11k/ahb.c, it returns an ERR_PTR (such as
ERR_PTR(-ENOMEM)) rather than NULL. The return value is directly assigned
to mem_region without an IS_ERR() check.

[Severity: Medium]
Could this permanent memory mapping risk a secure memory violation?

Because devm_memremap() is used instead of a temporary memremap() and
memunmap() pair, the mapping is kept active for the lifetime of the device.
This unnecessarily consumes vmalloc space, as mem_region is never used again
after the firmware is loaded.

Additionally, on Qualcomm platforms, leaving a kernel mapping open to a mem=
ory
region that may be protected by TrustZone after boot risks fatal secure mem=
ory
violations (hypervisor panic) due to speculative processor accesses.

[ ... ]
> +	if (!m3_fw->size || m3_fw->size > mem_size) {
> +		ath11k_err(ab, "Invalid firmware size\n");
> +		release_firmware(m3_fw);
> +		return -EINVAL;
> +	}
> +
> +	ret =3D qcom_mdt_load_no_init(ab->dev, m3_fw, m3_fw_name, mem_region,
> +				    mem_phys, mem_size, &mem_phys);

[Severity: High]
Can this lead to a kernel panic if mem_region is an error pointer?

The mem_region pointer is passed to qcom_mdt_load_no_init(), which only
checks for !mem_region. Since an ERR_PTR is not NULL, the loader proceeds to
dereference the error pointer, computing an address offset and calling memc=
py().
This results in a kernel panic due to an invalid memory write.

> +	if (ret)
> +		ath11k_err(ab, "Failed to load MDT segments: %d\n", ret);
> +
> +	release_firmware(m3_fw);
> +
> +	return ret;
> +}

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260923-ipq5018-qc=
n6122-mpd-v1-0-86729521a75c@outlook.com?part=3D4
