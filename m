Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A611F3BB699
	for <devicetree@vger.kernel.org>; Tue, 25 Aug 2026 21:10:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787692234; cv=none; b=WFnJ+ADeMtmpnTXN6Vs0vYzXYWuYeBbQy2BoCXR4T55uBUumT1ePqAd9o2WELYTgqj139X1A6KCEwuLU4yHX2fEpn/qdWRckXPyv39bKBHrXkq8UkFPRf9i0qWpGBzWO9osA5PEHksyvM0PCoiE0vOhUpxY+1A1QFv9HdIow9KU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787692234; c=relaxed/simple;
	bh=MeRPUhvigC2zhsGl+R0+MqrgTQuqen361SAvUYMPNdM=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=Qu+uOKCtad4fh60vhEIlKpSfhihcDUfOtHJI249FnNCPBEtmcpcyDf8ODM/PPAa3qR6Cumful07+ePrdbDtBte0cN1bGOV/TOkJF/+EKdWFcwrie/zD0KEbfP7TjzOKXMv+f8HAkowKEp7TEtA1XOi6n3n0mv1VVwfmchpBJFXQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=OgOWXZZT; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="OgOWXZZT"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1936F1F000E9;
	Tue, 25 Aug 2026 21:10:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1787692233;
	bh=2EH9V1aLSOi62ASdkcuYkzqTfoRR3Mh9axmxidxzbA0=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=OgOWXZZTdojy9wmRroh5c9Sci7WlmVQHG7/8qfn0i4P6ZpVs+eu6+VMzsrCdM3+QI
	 6a9Fv37UbgZX23YvFHdMjMTJBHfLYABgcUXe79eNJK37tFixcuH0BLYcOQAp2sOLYF
	 tG7Pxawdm72Jng/s56axwFYV3CE9dioFu5ESSgWlzJK2JI67vtsouBMdIzPUYPefOS
	 L68ebIl1Rl4ceegAjGMRvzk85Cb9x1BM2lBUNB8vZpeaNsgiuiWhumC/bbxysMkvEb
	 LDHDSeYUWOZcYTdjlcyarCrGiBplJvFq4+KBGBmPtBm8kcK7JfZZWIkZn9A1NzkCBt
	 FtQ022BnDKvsA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v3 3/5] iommu/generic_pt: Add Broadcom BCM2712 page
 table format
Reply-To: sashiko-reviews@lists.linux.dev
To: "Daniel Drake" <dan@reactivated.net>
Cc: devicetree@vger.kernel.org, conor+dt@kernel.org, robh@kernel.org
In-Reply-To: <20260825-bcm2712-iommu-submit-v3-3-7f143e7289b6@reactivated.net>
References: <20260825-bcm2712-iommu-submit-v3-0-7f143e7289b6@reactivated.net>
 <20260825-bcm2712-iommu-submit-v3-3-7f143e7289b6@reactivated.net>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 25 Aug 2026 21:10:32 +0000
Message-Id: <20260825211033.1936F1F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [High] Silent truncation of the page table physical address if allocated =
above the 37-bit limit.
--

commit d58086891d7da9b612c9b0e4a88de9a9dc4f255e
Author: Daniel Drake <dan@reactivated.net>

iommu/generic_pt: Add Broadcom BCM2712 page table format

Implement generic_pt support for the 2-level page table format used by
the BCM2712 IOMMUs.

> diff --git a/drivers/iommu/generic_pt/fmt/bcm2712.h b/drivers/iommu/gener=
ic_pt/fmt/bcm2712.h
> new file mode 100644
> index 0000000000000..2c5b034441c14
> --- /dev/null
> +++ b/drivers/iommu/generic_pt/fmt/bcm2712.h
> @@ -0,0 +1,288 @@

[ ... ]

> +static inline bool bcm2712pt_install_table(struct pt_state *pts,
> +					   pt_oaddr_t table_pa,
> +					   const struct pt_write_attrs *attrs)
> +{
> +	pt_bcm2712_entry_t entry =3D
> +		BCM2712PT_VALID |
> +		FIELD_PREP(BCM2712PT_PFN,
> +			   oalog2_div(table_pa, PT_GRANULE_LG2SZ));
> +
> +	return pt_table_install32(pts, entry);
> +}

[Severity: High]
Can table_pa exceed the 37-bit physical address limit here?

Because GFP_KERNEL is used when allocating child tables, the memory
allocations are not restricted to 32-bit or 37-bit physical addresses.

While the BCM2712 hardware might currently not exceed 16GB of RAM, the
generic_pt KUnit test for this format can run on any architecture. On syste=
ms
with >128GB of RAM, couldn't the child table memory be allocated above the
37-bit boundary?

If so, wouldn't FIELD_PREP() silently truncate the upper bits of table_pa
since BCM2712PT_PFN is only 25 bits?

Could this cause the IOMMU hardware to access truncated physical addresses,
reading random memory and leading to spurious test failures, faults, or DMA
memory corruption?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260825-bcm2712-io=
mmu-submit-v3-0-7f143e7289b6@reactivated.net?part=3D3
