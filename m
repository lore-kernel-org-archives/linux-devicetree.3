Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E3F822F8EBC
	for <devicetree@vger.kernel.org>; Tue, 28 Jul 2026 09:42:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785231734; cv=none; b=cNlRmlg/B3iXiwsnBeEW+NGUtv3x8hCrJ6ynp7umB/vQ3DH0LGVTbDn5dA6IMuNOdk+qIJ39KpY9W4v9A+tkFycSxTSP54pFAE4YejIuFY8Per/Q8qvHrbv7WcfZ/58Rswypo6qP00fwyg5Z9hAYlBt3NI6hLjwJKDXtmZOex0g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785231734; c=relaxed/simple;
	bh=+G6RlWq3ZQBEqUx1s1iUxNn3bdgO1aMdDx0WN/mtEmA=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=sjbMCUCZ3p3XQ8MwyC3xCMrXnPCjNfAK2FTXPuqT2B52QQ7KOJiHbMX/GPCQQH4DMZY9RU1r1A/1J3f0P1eD6jAmz8gY34jjMiptfveYm026xbvHE4mvcBaC2VZdlBwOdRN58Nr9Db93UcZdPcPurhNEirNnQ5wOXip/QG9ZNOg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=RaF4w/Tr; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="RaF4w/Tr"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0F6511F000E9;
	Tue, 28 Jul 2026 09:42:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785231732;
	bh=7Hxsh9sHfq64qWKITTQcYyw6k2PaFygn62uJh0kl2gM=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=RaF4w/TrYxZBGOBQUVokUxVMKGTNOhqxnyWyqJ7EOnmETnzcM93M3bkFTj1nx8x0p
	 sNv/ufK5IxaGET/GNEeTR9qQ5eus+mNDBI23TCaV+3qODz9tjg+v7o2BEfRAG6BWIu
	 rQuGPJBxbHvvH08RlmhnStaYZaYTZIrc1Sl8PopKMmUmurxUXhjd6KrfpnTuz+c/wR
	 aZjnJEcQx0HfWj/j4mWY6WmvY7pdR0H6F300AnvstqpxmSdNbcJ9ahC1I7/Dg0EwBy
	 jnmCGHluuEf+Ceg9sT35mm7NFZlSm/+RdkfK+T4rHybD3tlxSmSFk6oK84L2by2K3s
	 x5Na5P+a3sMjw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v13 5/5] dt-bindings: media: qcom,x1e80100-camss: Make
 vdd-csiphy supplies optional
Reply-To: sashiko-reviews@lists.linux.dev
To: =?utf-8?b?QnJ5YW4gTydEb25vZ2h1ZQ==?= <bryan.odonoghue@linaro.org>
Cc: media-ci@linuxtv.org, neil.armstrong@linaro.org, robh@kernel.org, devicetree@vger.kernel.org, olteanv@gmail.com, vkoul@kernel.org, conor+dt@kernel.org, linux-phy@lists.infradead.org
In-Reply-To: <20260728-b4-linux-next-25-03-13-dtsi-x1e80100-camss-v13-5-ae811e2f0799@linaro.org>
References: <20260728-b4-linux-next-25-03-13-dtsi-x1e80100-camss-v13-0-ae811e2f0799@linaro.org>
 <20260728-b4-linux-next-25-03-13-dtsi-x1e80100-camss-v13-5-ae811e2f0799@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 28 Jul 2026 09:42:11 +0000
Message-Id: <20260728094212.0F6511F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Medium] Incomplete schema update for split PHY topology causes dt_bindin=
g_check failures and incorrect hardware descriptions.
--

--- Patch [5]: [PATCH v13 5/5] dt-bindings: media: qcom,x1e80100-camss: Mak=
e vdd-csiphy supplies optional ---
commit 8ca017ccca6ab80da696ef7ec19b3fc7494d6187
Author: Bryan O'Donoghue <bryan.odonoghue@linaro.org>

dt-bindings: media: qcom,x1e80100-camss: Make vdd-csiphy supplies optional

This commit removes the vdd-csiphy-0p8-supply and vdd-csiphy-1p2-supply from
the required list in the qcom,x1e80100-camss binding. This makes the suppli=
es
optional to support moving the csiphy to peer nodes while maintaining
backwards compatibility.

> diff --git a/Documentation/devicetree/bindings/media/qcom,x1e80100-camss.=
yaml b/Documentation/devicetree/bindings/media/qcom,x1e80100-camss.yaml
> index 126400772d028..57a838fe2d229 100644
> --- a/Documentation/devicetree/bindings/media/qcom,x1e80100-camss.yaml
> +++ b/Documentation/devicetree/bindings/media/qcom,x1e80100-camss.yaml
> @@ -186,8 +186,6 @@ required:
>    - iommus
>    - power-domains
>    - power-domain-names
> -  - vdd-csiphy-0p8-supply
> -  - vdd-csiphy-1p2-supply

[Severity: Medium]
Since the CSIPHY nodes are being moved out to peer nodes, do other properti=
es
in this schema also need to be updated to prevent validation regressions?

For example, the reg-names, clock-names, and interrupt-names in this schema
are currently defined as strict, fixed-order arrays that expect csiphy elem=
ents
at specific indices. If those elements are removed from the CAMSS node to a=
void
resource conflicts, won't the remaining elements shift and cause
dt_binding_check to fail?

Additionally, the ports schema mandates data-lanes on the CAMSS endpoints.
Is this requirement still correct for internal links between the CAMSS core
and a peer PHY, rather than physical lanes to the sensor?

>    - ports
> =20
>  additionalProperties: false

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260728-b4-linux-n=
ext-25-03-13-dtsi-x1e80100-camss-v13-0-ae811e2f0799@linaro.org?part=3D5
