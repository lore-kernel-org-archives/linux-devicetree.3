Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BA9E63E317F
	for <devicetree@vger.kernel.org>; Sat, 26 Sep 2026 13:29:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790429398; cv=none; b=nJsX8n0526ol41b21q+fzeHvMYBBo7VxSUpKL164xMOaJafbL1S9kFNwDbBOf9EW46jR6x6AUNQjMmC7PZeezr5b7Hx0QjIIKMScha0uFcZ9BB2tMRH2Wzr27dcI8YekZZGDmi8e1UaPS9pms7zuVwirp0b/zSV4MCZebSVUyS8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790429398; c=relaxed/simple;
	bh=fl4qgr0HMSHEFo4J2R/cX8DHfoDnpWPXyrWr3hHgkYQ=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=WKjULWqJqjzQwPSry7K4JTTHmkcXQR7AMvRl93lfmt3HRCwOKGX6b+6iMMywFvsgDbTNlDdQXASm242RGnfiDiYJHZLuIv6I08HHnpvf2NRemmUe/CW7xV2Ciwaehk1zBg9yNgvf1yBFprkCIrOy5DkSDpOtmDBM9aCxfnkN2jk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=BDynyp7X; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="BDynyp7X"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 110FC1F000FF;
	Sat, 26 Sep 2026 13:29:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790429397;
	bh=CoVAW5TscD1gQBeF9LvfAYMRXz8aor83rOrvgKiWBuU=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=BDynyp7XxP39c7RQ7FiTFZZjB4AaWmtj1Siu0yxGsb3gviuvBoPHcMf6CiF91vkz+
	 Fu7nVBzrGXUsrdI5qyTz3Arz1Fj7k/8TJK0MZs1FYN2NCmqL401JJlcCj+V+wakT5D
	 zQLaWe0ThhBsJvfTvsQBeKcwNBhjpr1/yFayY3kCNHmA/nrOQ2MIJMYs6eVT6Uxhls
	 ai8ueKTCyBuUSZOg33ECUmy+oFsL33gwnyLEN2cPetgBKZZ7viHE4TYEX3ktqwnnjp
	 +7UnfuAq1QX5UqQ1GPhKHKpcFUvA7Uj3c+h4//qF61R7Qw3BFe0wzn93po5wdrutOz
	 KBCUfSxmtiSaw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 13/17] arm64: dts: apple: t8122: add avd nodes
Reply-To: sashiko-reviews@lists.linux.dev
To: "Sofus Forstreuter" <sofus.c@icloud.com>
Cc: conor+dt@kernel.org, robh@kernel.org, devicetree@vger.kernel.org, media-ci@linuxtv.org
In-Reply-To: <20260926-avd-v2-13-ecebe6a3648e@icloud.com>
References: <20260926-avd-v2-0-ecebe6a3648e@icloud.com>
 <20260926-avd-v2-13-ecebe6a3648e@icloud.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sat, 26 Sep 2026 13:29:56 +0000
Message-Id: <20260926132957.110FC1F000FF@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Low] Missing DT binding documentation for apple,t8122-dart
--

commit c017f32bf6e48954134742ab315013310a3424f7
Author: Sofus Forstreuter <sofus.c@icloud.com>

arm64: dts: apple: t8122: add avd nodes

This commit adds the AVD (Apple Video Decoder) and its associated DART
IOMMU nodes to the t8122 device tree.

> diff --git a/arch/arm64/boot/dts/apple/t8122.dtsi b/arch/arm64/boot/dts/a=
pple/t8122.dtsi
> index 1ee61c5b3409f..25e47755e0951 100644
> --- a/arch/arm64/boot/dts/apple/t8122.dtsi
> +++ b/arch/arm64/boot/dts/apple/t8122.dtsi
> @@ -186,6 +186,38 @@ soc {
>  		/* Required to get >32-bit DMA via DARTs */
>  		dma-ranges =3D <0 0 0 0 0xffffffff 0xffffc000>;
> =20
> +		avd_dart: iommu@289010000 {
> +			compatible =3D "apple,t8122-dart", "apple,t8110-dart";

[Severity: Low]
Is this compatible string missing from the DT bindings schema?

Schema validation tools like dtbs_check will emit a warning because
apple,t8122-dart is not defined. While this has no runtime effect since the
kernel can safely match on the documented fallback string apple,t8110-dart,
should this string be documented in the bindings?

[ ... ]

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260926-avd-v2-0-e=
cebe6a3648e@icloud.com?part=3D13
