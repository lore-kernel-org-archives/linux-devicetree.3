Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 78E904218B1
	for <devicetree@vger.kernel.org>; Sat,  1 Aug 2026 10:10:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785579006; cv=none; b=iNrgPRUgx/RdoXhhVtvi9m77fTAbv+iQrlVgw0JEUunRn3e0E29LhkVlkZCN+HYt547XNJUdGpgRwt6sXPfh58fopUh5BDX/bpae6GO6ydikYhtbuhTo5aSniXiog2++xyHC9KO117geI5PjEjuFgtFvX8k6ly3YZ0Lejd/MlmE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785579006; c=relaxed/simple;
	bh=hPq66orfciItHn0uztISuqbv9xxVqQU/H6C7xVPoU8M=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=e+D3t5xzLrGXutwupJ81Pvkb6m+0MtuSupziEJqScQjOYLnT+xZrH7z8AIW2M8MUNmCp7iQPAjt76dYpSiOe6Zo9wDjdquiVOBqEPrtPT+1er9f1+M+kvOylCp4rw87IvFEs26ePMQ/7I6Gm6VNQ909tCUsMKuKMq7hCiwj2b7U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=CKZ2OZ7p; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="CKZ2OZ7p"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D8DD11F00AC4;
	Sat,  1 Aug 2026 10:10:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785579005;
	bh=0eJm1md6LoFuwyTEjOHGz/iBYBDIlLKJoYdNiWLKIM8=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=CKZ2OZ7p/v+SS5cwyUw6APcC3RQxWtcsLrAMiSxTvoksCGg3VGpHo9ZvyKhUosHKK
	 8/zr1DRsbKxZRNoznLRRYXoBJAHnZr/cjhhRoqEod3SecvGWQ5e7yPvrTpXMdaY8am
	 +nEclAv99r9RbJ7CBMZAOn3m0yTwCotsoVe071BbKW1zJVTfJh6vRSGvI/YnxEYD6K
	 MtNJsfzbAOZP5ZOgwVeZ6/4e1OEfm7lVpfqfN5+K3UsIT33KDQ7+wBngDOvQp9aHfx
	 fAZDNf4e4k4ra/ljUU602g7gZt7kwcqGP7UEaWtOMRolcZcSZYXnETJEDgOdeNthWe
	 fLSUrJbWp4tzA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v5 3/5] arm64: dts: qcom: Add Kalambo CRD
Reply-To: sashiko-reviews@lists.linux.dev
To: "Gopikrishna Garmidi" <gopikrishna.garmidi@oss.qualcomm.com>
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20260801-b4-kalambo-crd-v5-3-22160abacf3d@oss.qualcomm.com>
References: <20260801-b4-kalambo-crd-v5-0-22160abacf3d@oss.qualcomm.com>
 <20260801-b4-kalambo-crd-v5-3-22160abacf3d@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sat, 01 Aug 2026 10:10:04 +0000
Message-Id: <20260801101004.D8DD11F00AC4@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [High] The `kalambo-crd.dts` file omits the `&tcsr` voltage supply defini=
tions, leaving PHY reference clocks unpowered and breaking PCIe/USB.
--

--- Patch [3]: [PATCH v5 3/5] arm64: dts: qcom: Add Kalambo CRD ---
commit aae73b91eb59e39dd9b9d1a032d9f7954d0ab45c
Author: Gopikrishna Garmidi <gopikrishna.garmidi@oss.qualcomm.com>

arm64: dts: qcom: Add Kalambo CRD

This commit introduces support for the CRD based on the Qualcomm Kalambo So=
C.=20
It reuses the common CRD board description from Glymur while dropping PMIC=
=20
nodes that are not present on this design.

> diff --git a/arch/arm64/boot/dts/qcom/kalambo-crd.dts b/arch/arm64/boot/d=
ts/qcom/kalambo-crd.dts
> new file mode 100644
> index 0000000000000..b4441807f4602
> --- /dev/null
> +++ b/arch/arm64/boot/dts/qcom/kalambo-crd.dts
> @@ -0,0 +1,21 @@
[ ... ]
> +/ {
> +	model =3D "Qualcomm Technologies, Inc. Kalambo CRD";
> +	compatible =3D "qcom,kalambo-crd", "qcom,kalambo";
> +};

[Severity: High]
Does this board need a &tcsr node override to provide voltage supply
definitions for the PHY reference clocks?

Since kalambo-crd.dts omits the &tcsr node override, it fails to map the
board's PMIC LDOs (e.g., vreg_l2f_e1_0p83) to the TCSR's vdda-* supply
properties. The clock driver will likely fall back to dummy regulators,
meaning the hardware voltages are never turned on.

Because this board reuses glymur-crd.dtsi (which enables multiple PCIe and
USB nodes) but misses the &tcsr regulator block required by those PHYs
(which is present in sibling boards like glymur-crd.dts and mahua-crd.dts),
will core connectivity features fail to initialize or experience link
timeouts due to unpowered reference clocks?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260801-b4-kalambo=
-crd-v5-0-22160abacf3d@oss.qualcomm.com?part=3D3
