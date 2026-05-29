Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 38EF73EFD35
	for <devicetree@vger.kernel.org>; Fri, 29 May 2026 16:41:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780072898; cv=none; b=qq0wLs8BcvDgBp0GByZBEuZ0yLY4M5g4mK5xb7yQ6z3bgLM25/4LfzaJAS6OzTZfDaxXmT2zZ/VoettpBJPQ42Uf0W2EgCA2bn3g0oIri42XHW3YIPeVAjj/4PPVLejNqJOZsQ1RMYJRnKO9bsIUdnRmSa0FcaPF2fIfdZmulx8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780072898; c=relaxed/simple;
	bh=AGShdXd10/R0I9NwPMswPrNrIHg2uKhVeAj/eT012dM=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=Od8PVIM1gbVpBjH63Q1jhIpJQksq1hcVd4uBT6w8s9DKLElkZ8v/p7sfgum16igAOdrMHxPtyYBvM7TpxhJ50UtrOJrb15b9XAo4ZPEgR69ZvDCjiETVRLtnrNG44+AOyqUswr0K2nvjj4CHCAXawhs3cI+yNKJLM/agX9vY1xc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Pk3k0P7P; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Pk3k0P7P"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E42531F00898;
	Fri, 29 May 2026 16:41:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780072897;
	bh=hq6imBQKRBH/7p+RJb3kiWxKfUZ7zsJ7n4Cqx52cLwM=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=Pk3k0P7P8anHxhWcREa4hgOV/mJ1Xv9PQA8K+8Vzbno7gMjvoNDYOE80DDmSbRPNK
	 96bTnt4NUQzB6tjz9jSLMbNcR2m2queX+UjbA/CQTIL92rRW0yySZDJUUCkWi0ollX
	 FfAf+kO7w2LAKuzziLlt9WgqNn/9BEATRwPy1LkxsgmDfJMDAzOz2e93qeue8Ij1mC
	 sYjvWWmMay1uuDn0TcybSaOr5zLBrqRZiXKQI8gVLWFScQFT1DyhmRCljOKL6e8k8E
	 exeU7gouA0uOVKg7tgUcJjPvYoHE3/Qm/GVw6PX1xb2/reL043ySMYgebPxZNRTIZ3
	 nXXVXSANIkM0Q==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH] arm64: dts: st: add power-domains to sdmmc1 on
 stm32mp251
Reply-To: sashiko-reviews@lists.linux.dev
To: "Dario Binacchi" <dario.binacchi@amarulasolutions.com>
Cc: conor+dt@kernel.org, robh@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260529155607.3948045-1-dario.binacchi@amarulasolutions.com>
References: <20260529155607.3948045-1-dario.binacchi@amarulasolutions.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 29 May 2026 16:41:36 +0000
Message-Id: <20260529164136.E42531F00898@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:

Pre-existing issues:
- [High] The commit fixes a missing `power-domains` mapping for the `sdmmc1=
` node in `stm32mp251.dtsi` but neglects to apply the identical fix to the =
`sdmmc1` node in the sibling SoC device tree `stm32mp231.dtsi`.
--

commit 15c583311b4857c29c6b06ffbc928426a3324c4a
Author: Dario Binacchi <dario.binacchi@amarulasolutions.com>

arm64: dts: st: add power-domains to sdmmc1 on stm32mp251

This commit adds the missing power-domains property to the sdmmc1 node
in the stm32mp251 device tree. It addresses an early bring-up omission to
align the node with the rest of the peripheral nodes.

> diff --git a/arch/arm64/boot/dts/st/stm32mp251.dtsi b/arch/arm64/boot/dts=
/st/stm32mp251.dtsi
> --- a/arch/arm64/boot/dts/st/stm32mp251.dtsi
> +++ b/arch/arm64/boot/dts/st/stm32mp251.dtsi
> @@ -1664,6 +1664,7 @@ sdmmc1: mmc@48220000 {
>  				cap-mmc-highspeed;
>  				max-frequency =3D <120000000>;
>  				access-controllers =3D <&rifsc 76>;
> +				power-domains =3D <&CLUSTER_PD>;

[Severity: High]
This isn't a bug introduced by this patch, but should the sdmmc1 node in
the sibling stm32mp231.dtsi device tree also receive this exact update?

Since the early bring-up omission affected these platforms, leaving the
power domain unmapped on the stm32mp231 SoC might lead to a synchronous
external abort or render the controller unusable when the driver attempts
to access unpowered registers. Would it be appropriate to update both SoC
device trees together to prevent runtime failures?

>  				status =3D "disabled";
>  			};

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260529155607.3948=
045-1-dario.binacchi@amarulasolutions.com?part=3D1
