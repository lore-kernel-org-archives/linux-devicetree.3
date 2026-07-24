Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AC1D22931CD
	for <devicetree@vger.kernel.org>; Fri, 24 Jul 2026 12:48:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784897316; cv=none; b=ifaGdFPyjSvgLbVC06G9W//G7nqwDfel2dAJTx2gXhvPGimnH+V1I2WMrPR2ox0cLEBY/ygFiQ3PykgSoT5b5vbfYGud6FKTbzsF8RAjsk5ZDSbSDm7Ey5OoIyLRc+XrIHbcZ8kp6jXN8FtknTT78j8JZbbqf4iVRp+P48E3YZ8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784897316; c=relaxed/simple;
	bh=oaUvS21NmaZZ2iyY0Q4bI6y6K4KeUWFw1qgciyiNdKY=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=eDJ9W8LanJ2P08mmq3MooFeIZ/RSRzV4R9Wn0zS799Mz+2NcICPh2yde74EXUCIXRtEt5iWRudm4iVsd4R/Lr2F5RsEYPKo71Iq6xAOBfNi8noghKCJ5gZ6R7uBsCiBYVxEcqSK/r1dT61828otPRuw03gdpRJrcU0QQ8FQX3pM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Cq1bp6QZ; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Cq1bp6QZ"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D8D4A1F000E9;
	Fri, 24 Jul 2026 12:48:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784897304;
	bh=NwoOkllxKlPc/xkZZ+tc7RIgRUy+EY862TaxW0LdT78=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=Cq1bp6QZjegr5X2b1bPqGfGstqYrb4xBtN3VzXGKtRhT+Tr8MsP8w7CBwLUKjG1L8
	 giI7MYSXQVUurfN4rw6+p5jk+EPzMMgQhsgi2gBRrrlZsbX1gGTIQOQ+FYuPk5a0L+
	 ILjNtZV4ylie9wzzGXdn4UyKTnVz3YYM44wMhgalaoRq/JQGRzxfKdHTz7IZp54Atb
	 uaTcPG3v8gJk4Uvl8H9RFMcuUf1OKQVL/ftJLGaK+fO3uKtgQxTQEWazkuSw8tgSv3
	 aFedlCOiI09/U5dGMHuMEUuKAAOFKE+q548sNNWewDKE5G5GGMBJgH3ZXis4/T0z+S
	 tcyYeixAyVNPg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 2/2] iommu/arm-smmu-v3: Override for Inst/Data attribute
Reply-To: sashiko-reviews@lists.linux.dev
To: "Peter Griffin" <peter.griffin@linaro.org>
Cc: conor+dt@kernel.org, devicetree@vger.kernel.org, robh@kernel.org
In-Reply-To: <20260724-arm-smmu-v3-instcfg-override-v1-2-e7acf4a8a525@linaro.org>
References: <20260724-arm-smmu-v3-instcfg-override-v1-0-e7acf4a8a525@linaro.org>
 <20260724-arm-smmu-v3-instcfg-override-v1-2-e7acf4a8a525@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 24 Jul 2026 12:48:23 +0000
Message-Id: <20260724124823.D8D4A1F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [High] Incorrect parenthesis placement in `arm_smmu_make_cdtable_ste()` c=
auses the `STRTAB_STE_1_INSTCFG` bitfield to be evaluated outside the `cpu_=
to_le64()` macro. On big-endian platforms, this mixes little-endian data wi=
th host-endian data, leading to corruption of the Stream Table Entry.
--

--- Patch [2]: [PATCH 2/2] iommu/arm-smmu-v3: Override for Inst/Data attrib=
ute ---
commit af569c8fadcbad6c95ec600eb667d4a653e847dd
Author: Peter Griffin <peter.griffin@linaro.org>

iommu/arm-smmu-v3: Override for Inst/Data attribute

This commit adds an option to override the instruction/data attribute of
incoming traffic to Data by setting the INSTCFG override in all Stream Table
Entries. The option is configurable via the arm,instdata-override device tr=
ee
property.

> diff --git a/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c b/drivers/iommu/=
arm/arm-smmu-v3/arm-smmu-v3.c
> index 57b750ebcd3d6..2b39cb5aa49d0 100644
> --- a/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c
> +++ b/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c
[ ... ]
> @@ -1835,7 +1838,11 @@ void arm_smmu_make_cdtable_ste(struct arm_smmu_ste=
 *target,
>  			 STRTAB_STE_1_S1STALLD :
>  			 0) |
>  		FIELD_PREP(STRTAB_STE_1_EATS,
> -			   ats_enabled ? STRTAB_STE_1_EATS_TRANS : 0));
> +			   ats_enabled ? STRTAB_STE_1_EATS_TRANS : 0)) |
> +		FIELD_PREP(STRTAB_STE_1_INSTCFG,
> +			   smmu->options & ARM_SMMU_OPT_OVR_INSTCFG_DATA ?
> +				   STRTAB_STE_1_INSTCFG_DATA :
> +				   STRTAB_STE_1_INSTCFG_INCOMING);

[Severity: High]
Does this prematurely close the cpu_to_le64() macro?

By having the extra parenthesis after 0, the STRTAB_STE_1_INSTCFG field
appears to be bitwise-ORed in host endianness rather than being
little-endian swapped along with the rest of the fields.

On big-endian platforms, could this mix little-endian and host-endian data,
leading to corruption of the Stream Table Entry?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260724-arm-smmu-v=
3-instcfg-override-v1-0-e7acf4a8a525@linaro.org?part=3D2
