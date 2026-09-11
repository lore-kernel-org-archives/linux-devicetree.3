Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D8D6736E494
	for <devicetree@vger.kernel.org>; Fri, 11 Sep 2026 15:14:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789139652; cv=none; b=KhgpffaDIApuMItLs4V6VL2CTmbyCkY/uHWyQmJ4OmHBacmITUeaTRCRPpZPYkube5dOi+83Llz8Q0S2nbeOVIUQJJURu+BREs3L65I6mNQz4Whj3AO4aBOjUEm5gB9/drejlgQY9Nt/pBsDrqvMT2xA8dUsSU2iN5hKKRIDvbA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789139652; c=relaxed/simple;
	bh=3Oh1QZs/OsEt8dmcSJqqw6nEI4NhbzMAd5IKrmyOAlk=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=HgwJndOux5g+u/DkGIaZdP1EBS75/+i9a9aLREDv+Eldp7kYx3p/tf7kkYeH4qvXXNIRaqchn+ZUOaGvtkJ5CRpD6zQ3ZzSpxWjrXQoxttklcOV1dfw10JJNv7zgIEWE0nsQmcZmeL10UCnfWnE2otNlt/0nN5jiMLFAiaMgCV0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=eEjEDmYe; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="eEjEDmYe"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 246031F000FF;
	Fri, 11 Sep 2026 15:14:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789139650;
	bh=G7UwGNzPKhq+YU7OtStbHuCxFIrc3jUtUDQbnOEBpVI=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=eEjEDmYewbpK7K7SUiEG5wTUjZbZL53SG4UmpiA8mElZtpPAx6U25w07Egz1VxZ4Y
	 v3umdWAALnDQx0lQoCoVl7/M13gHIPDx2CLSrMejKYeM7uZJVAGjxndpbsMiN53tXj
	 AAtPILdQdzFDvGxdWeU6PmKsarAxndcCnHXEy501Opoy1y01c1Xcrqy7Bz+W6yyXHt
	 JVztlUMfYbEdqrj7jFeYCQNCpOb/HuPiTZGXODACxdRzM5l2Vzd6RKyJSBPqVAD0Iz
	 f0dcUY9rZpQsp5BiCakXFGCWSedypUeUUzl5xVK3o6B4FaTUFVxtcfneauRXeKD3WE
	 7yJ0XqEhWgAAA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v4 2/3] dt-bindings: arm: altera: add Draeger M48 Module
Reply-To: sashiko-reviews@lists.linux.dev
To: "Petko Manolov" <petko.manolov@konsulko.com>
Cc: robh@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260911150755.2803736-3-petko.manolov@konsulko.com>
References: <20260911150755.2803736-1-petko.manolov@konsulko.com>
 <20260911150755.2803736-3-petko.manolov@konsulko.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 11 Sep 2026 15:14:09 +0000
Message-Id: <20260911151410.246031F000FF@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Medium] The commit message erroneously describes the Draeger M48 CPU mod=
ule as an NXP i.MX6 based board, but the bindings correctly place it under =
the Altera Cyclone 5 SoC platform.
--

commit 7e951377f9aeb640e72ba7c48aafcccf11752d1e
Author: Petko Manolov <petko.manolov@konsulko.com>

dt-bindings: arm: altera: add Draeger M48 Module

This commit adds a new device tree compatible string for the Draeger M48
CPU module to the Altera device tree bindings.

>     dt-bindings: arm: altera: add Draeger M48 Module
>    =20
>     Add DT compatible string for Draeger's M48 CPU Module, an i.MX6
>     based board.

[Severity: Medium]
Is the description of the board architecture accurate here? The commit mess=
age
states the hardware is an i.MX6 based board (an NXP architecture), but the
patch correctly adds the compatible string under properties:compatible:oneOf
in Documentation/devicetree/bindings/arm/altera.yaml, which places it under
the Altera Cyclone 5 platform bindings.

While a subsequent patch in the series confirms the board is indeed a Cyclo=
ne 5
device, it also repeats the same i.MX6 claim in its commit message.

Should this regression in the commit description be corrected to prevent
misleading architectural information from polluting the git history?

> diff --git a/Documentation/devicetree/bindings/arm/altera.yaml b/Document=
ation/devicetree/bindings/arm/altera.yaml
> index 3030cf46fe74c..8ed1ba7335103 100644
> --- a/Documentation/devicetree/bindings/arm/altera.yaml
> +++ b/Documentation/devicetree/bindings/arm/altera.yaml
> @@ -47,6 +47,7 @@ properties:
>            - enum:
>                - altr,socfpga-cyclone5-socdk
>                - denx,mcvevk
> +              - draeger,M48
>                - ebv,socrates
>                - macnica,sodia
>                - novtech,chameleon96

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260911150755.2803=
736-1-petko.manolov@konsulko.com?part=3D2
