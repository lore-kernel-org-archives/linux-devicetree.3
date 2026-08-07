Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DFC8631F985
	for <devicetree@vger.kernel.org>; Fri,  7 Aug 2026 08:40:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786092020; cv=none; b=IciyguJH+bu4FFPh6iEnQjksRCnVUxIF5uFpfrCotllC2grXjOHPIp9bzcJ4OtjzA5lYL2G0Odlw3ec5v427OcimEKitW3pItFZkMyyKRpEEtUEp9xv1wMYyZ2MMcNndGB4ZTRTGcUw1gwdgIQanq11LJwUYN4kRjQ+pQ90EsMs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786092020; c=relaxed/simple;
	bh=r1I8HXKaZtoOtakF47WYbejx+jMHZRsBPn7UkMtGl8E=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=Oue+TlPEKkBqWJDAyLlRGeZd503MwWVe+8Pl/BCD5bnBsy/gF+OGhAt9qIYxb9Jyby8+18GqwUS7s7rvh3+BOS+BhgxPkI41Rdm5j4bK0vXAOonBaqYGqOg8ed8CZKQvqKr0qomhw9O6AlWqWEJWIoAl5WRw23JLmGSfX3OoxGY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=EAlPFIiZ; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="EAlPFIiZ"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 444A81F000E9;
	Fri,  7 Aug 2026 08:40:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786092018;
	bh=KlxISodueXNdqCoTgwEGgLbCoJNhlQCSiSZbutmaoIQ=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=EAlPFIiZpc3vzobMSH0CHOHkYFtOwJlmKqbIXofbRSVEOI4TGsZocSkDnrJIcziUh
	 Gj/Ax5NPpR/uGPiUlMz6uTH1RwJ4+cqBT2gDzBD7yQL2jZj9kdITcVDilRITS+mBHP
	 0SbLWYW2pl4uSbbQxXPjSf1FgN0E9qL0awR+nEd88hDVivE/JzuemkEp8V/kOa+pmr
	 jlNXcss9qVrH9pkAaIaAsgjx/wdYZx8JWcNAYG/LeXEWl9fV//IiSNXHpGlZ2jX3c9
	 i+vSbpIZndN9ry8QPoH8a4bm+AoEtXTOH/sRooGoVzWsiYJ/n+Taxbw1FzEZcz4Cbl
	 hAikWacy7XAqA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 02/22] dt-bindings: media: qcom,sm8550-iris: Allow IOVA
 reservation memory-region
Reply-To: sashiko-reviews@lists.linux.dev
To: "Vikash Garodia" <vikash.garodia@oss.qualcomm.com>
Cc: devicetree@vger.kernel.org, conor+dt@kernel.org, media-ci@linuxtv.org, robh@kernel.org
In-Reply-To: <20260807-iris_iova_600mb_fix-v1-2-3996f67e33f9@oss.qualcomm.com>
References: <20260807-iris_iova_600mb_fix-v1-0-3996f67e33f9@oss.qualcomm.com>
 <20260807-iris_iova_600mb_fix-v1-2-3996f67e33f9@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 07 Aug 2026 08:40:17 +0000
Message-Id: <20260807084018.444A81F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:

Pre-existing issues:
- [High] NULL pointer dereference when `of_translate_dma_region()` fails.
- [High] Parsing desynchronization when `iommu-addresses` contains entries =
for different devices.
--

--- Patch [2]: [PATCH 02/22] dt-bindings: media: qcom,sm8550-iris: Allow IO=
VA reservation memory-region ---
commit 75d07dc0e88c8eab8911e5e4c741c2ddba6cf12f
Author: Daniel J Blueman <daniel@quora.org>

dt-bindings: media: qcom,sm8550-iris: Allow IOVA reservation memory-region

Non-pixel stream IDs should not allocate IOVA space from the restricted reg=
ion,
as this region is reserved exclusively for secure non-pixel. Iris platforms
must declare an IOMMU IOVA reservation to keep DMA away from this range. Th=
is
patch permits a second memory-region phandle for this purpose and describes
each entry.

> diff --git a/Documentation/devicetree/bindings/media/qcom,sm8550-iris.yam=
l b/Documentation/devicetree/bindings/media/qcom,sm8550-iris.yaml
> index 0400ca1bff05d..7dff7293fd5c8 100644
> --- a/Documentation/devicetree/bindings/media/qcom,sm8550-iris.yaml
> +++ b/Documentation/devicetree/bindings/media/qcom,sm8550-iris.yaml
> @@ -84,7 +84,10 @@ properties:
>    dma-coherent: true
> =20
>    memory-region:
> -    maxItems: 1
> +    minItems: 1
> +    items:
> +      - description: Firmware-loaded codec carveout
> +      - description: IOMMU IOVA reservation region

[Severity: High]
This isn't a bug introduced by this patch, but introducing memory-region no=
des
utilizing iommu-addresses exposes a pre-existing NULL pointer dereference in
the boot/probe path.

When the iommu-addresses property is parsed in of_iommu_get_resv_regions(),=
 if
of_translate_dma_region() fails (e.g. due to a missing parent bus or malfor=
med
address), it returns NULL, which is directly assigned to the maps pointer:

drivers/iommu/of_iommu.c:of_iommu_get_resv_regions() {
    ...
		if (np =3D=3D dev->of_node) {
            ...
			maps =3D of_translate_dma_region(np, maps, &iova, &length);
    ...
}

Will this cause a kernel panic on the next iteration?

The check maps < end would evaluate to true (since end is a valid, non-zero
pointer), and the code then executes be32_to_cpup(maps++), which dereferenc=
es
the NULL pointer. Additionally, the length variable remains uninitialized on
this failure path:

drivers/iommu/of_iommu.c:of_iommu_get_resv_regions() {
    ...
	while (maps < end) {
		struct device_node *np;
		u32 phandle;

		phandle =3D be32_to_cpup(maps++);
    ...
}

[Severity: High]
This is a pre-existing issue, but utilizing iommu-addresses exposes a parsi=
ng
desynchronization when the iommu-addresses property contains entries for
different devices.

If the parser reads an entry where the phandle does not match dev->of_node,=
 it
skips processing but fails to advance the maps pointer past the address and
size cells:

drivers/iommu/of_iommu.c:of_iommu_get_resv_regions() {
    ...
	while (maps < end) {
        ...
		phandle =3D be32_to_cpup(maps++);
		np =3D of_find_node_by_phandle(phandle);

		if (np =3D=3D dev->of_node) {
            ...
			maps =3D of_translate_dma_region(np, maps, &iova, &length);
            ...
		}
	}
    ...
}

Does this completely desynchronize the parser?

On the next iteration, it seems the parser would read the first address cell
of the skipped entry as the next phandle, making it impossible to correctly
parse a shared memory-region node containing multiple devices.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260807-iris_iova_=
600mb_fix-v1-0-3996f67e33f9@oss.qualcomm.com?part=3D2
