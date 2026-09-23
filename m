Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A0A4544CAD7
	for <devicetree@vger.kernel.org>; Wed, 23 Sep 2026 14:56:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790175361; cv=none; b=cdvUOJ5fOrWst0zhbVtnfc7cv3q4R088FCGR5zmv0BT4up4pheXOP45qcGT3jr2CqrAAN1Tc/fYD4TucA3CFK7OiWw2hyS0nvcyy9gTR12YGdi5d0k/pqRYdqJTCepn16c5L8LwHSH944oxe3ZRxEIB1vAED3mZ/3wX2toLYMsk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790175361; c=relaxed/simple;
	bh=7NWiI97YoK2kODBk9vB7ISEZjjRxC1ywJnJmBP7HTzk=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=jT3nmZcmmz4g35HWeoy1yBvoOHpS9OG8io+/BcgYfnDDTQfPzKzZTtsOLiCFeSWqP+fNSm2GnWJAIozbAXp/YbhTIxbrpjCeJMacjX/E7AB46R7YQv7jEs5JdtrtuEYTYzJelSTSixz4i6o2Koxe2rzrF0AnPCHMzG8v8YhNkx0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=guVlTrKS; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="guVlTrKS"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 072441F000FF;
	Wed, 23 Sep 2026 14:55:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790175360;
	bh=/xfHT21hlHbc6oe1kCUj2Z//h8pc5i5iP1eSLkzRgfo=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=guVlTrKSddxKjau7i2R8aLfiqFoebePgJaODGD2ox6nh9cQxysfmyljWqyLvVUo5w
	 9tBbIcCibj9P3Tk3uFJVpGVAtJy7OSkXG0Qdy3GxFbch2v594yoTwkondyAmOvneI2
	 sLiboSBYZ0K6VTUgfWvHahE9feUe08H0/gZfHrh+gj3+mzst1l5yuijRAMl+16TXIb
	 7VQF+GtWQXNDRPxbKC0zAi/M+oXoXofYgRNoyxc+QTCsQbS7K6AhVEfCktkEqYjWip
	 A2M2f90h6i1wuS2G3F0cpUbV1lSQ41SnAkD/Hw18LKB4cYIlvOx6KJ1Ig5T7IzdVOl
	 tiuiVCTb15HYQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v1 1/2] dt-bindings: arm: fsl: add Draeger M48 dual-cpu
 board
Reply-To: sashiko-reviews@lists.linux.dev
To: "Petko Manolov" <petko.manolov@konsulko.com>
Cc: robh@kernel.org, devicetree@vger.kernel.org, conor+dt@kernel.org
In-Reply-To: <20260923144905.3365851-2-petko.manolov@konsulko.com>
References: <20260923144905.3365851-1-petko.manolov@konsulko.com>
 <20260923144905.3365851-2-petko.manolov@konsulko.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 23 Sep 2026 14:55:59 +0000
Message-Id: <20260923145600.072441F000FF@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Low] dt-bindings: missing 'draeger' vendor prefix in vendor-prefixes.yaml
--

commit cb9d16ad6756673a5b26300c6dbed7353bb41b62
Author: Petko Manolov <petko.manolov@konsulko.com>

dt-bindings: arm: fsl: add Draeger M48 dual-cpu board

This adds device tree binding compatible strings for the Draeger M48
heterogeneous board. The bindings support both the i.MX6Q and i.MX6DL
variants used in the hardware.

> diff --git a/Documentation/devicetree/bindings/arm/fsl.yaml b/Documentati=
on/devicetree/bindings/arm/fsl.yaml
> index 86876311ec59a..2abcae70f33b8 100644
> --- a/Documentation/devicetree/bindings/arm/fsl.yaml
> +++ b/Documentation/devicetree/bindings/arm/fsl.yaml
> @@ -260,6 +260,7 @@ properties:
>                - boundary,imx6q-nitrogen6x
>                - compulab,cm-fx6           # CompuLab CM-FX6
>                - dmo,imx6q-edmqmx6         # Data Modul eDM-QMX6 Board
> +              - draeger,imx6q-m48         # Draeger imx6q variant of M48

[Severity: Low]
Is the "draeger" vendor prefix documented in vendor-prefixes.yaml?

The dt-bindings subsystem requires every newly introduced vendor prefix to
be formally documented. Failing to add it can cause make dt_binding_check
to fail with a schema validation error for an unrecognized vendor prefix.

>                - ds,imx6q-sbc              # Da Sheng COM-9XX Modules
>                - embest,imx6q-marsboard    # Embest MarS Board i.MX6Dual
>                - emtrion,emcon-mx6         # emCON-MX6D or emCON-MX6Q SoM

[ ... ]

> @@ -458,6 +459,7 @@ properties:
>                - boundary,imx6dl-nit6xlite     # Boundary Devices Nitroge=
n6 Lite
>                - boundary,imx6dl-nitrogen6x    # Boundary Devices Nitroge=
n6x
>                - bticino,imx6dl-mamoj      # BTicino i.MX6DL Mamoj
> +              - draeger,imx6dl-m48        # Draeger imx6dl variant of M48

[Severity: Low]
Will this also trigger a validation error during make dt_binding_check?

Similar to the previous addition, this introduces the undocumented "draeger"
prefix for the i.MX6DL variant, which leaves the binding implementation
incomplete.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260923144905.3365=
851-1-petko.manolov@konsulko.com?part=3D1
