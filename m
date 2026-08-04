Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BC93B3F2118
	for <devicetree@vger.kernel.org>; Tue,  4 Aug 2026 03:35:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785814505; cv=none; b=IS3whcqbmt7/o5uhO5dkEMsIA8XWAs8WA42KXAb7l76c4DWb0lo1T7X0pOz6YfFzDOhZS+qJxPNirqFb7DzyIF/Z2Ku4HoIkVx8NdEb65ucQGMcxXM+GUhX+mhN6PxqvCvVKMQtCnBPbZgi4gkgBW4+wsdYCDOnVuqAUbMntzfM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785814505; c=relaxed/simple;
	bh=MkfyxE/zsNo3unphn6LZRH0dqro6eN9gAJS9xaRhCls=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=N3llmvj2Cwqx/Ztp+yZasl2i47gUkAqxZ6lIavW1tK09KwSAUlai1MEWXbCFhFvqNJ6Q797dLmy4ONHPrKqnfmn3fx0JEDvb2uDAAFWhZ2weGykdaFNRgRHMuAkX/XG24E/ED39iXmdDVHndrociBPteGVkb1zcxFY2i/ghX2OU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=NGBl6PtW; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="NGBl6PtW"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4229E1F000E9;
	Tue,  4 Aug 2026 03:35:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785814501;
	bh=4Bw2uzA5kIV5A6hsZw+QrsVouJH/WxUDgxrC/E86aFk=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=NGBl6PtWn5QfaiTZUplNxKNY+Tl92CB0pm5DCRdGXxsTJlcq4uUDfiwAoUjku3wt5
	 u0wbeiuy9VAKej/QwD0PkMOs26Gdz0Rpw8rMH9PyIXUoJSSVN3c3E9tVc/IB6dzQ2D
	 Ge+yI70HL0zm9FeYCxqyc9lf7hOSUsCORzFCj2ZTSXxIXMXpCpsFl77ywOgw0Tbsld
	 qRBnIcktiPxq+I/XqeYIFzV8Vt0TskvJFSxhB/XaDKf+gsHs28bzRql07LUoSMDfdE
	 lM7bg3mworaQtDF0Sq26yI3gZo3mcSBpNERjozqtUULBym6KqGBswSwFkoJC3/h+PU
	 b7JjI+KJxfT4g==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v7 1/2] ASoC: dt-bindings: nuvoton,nau8360: Add NAU83G60
Reply-To: sashiko-reviews@lists.linux.dev
To: "Neo Chang" <YLCHANG2@nuvoton.com>
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20260804032951.1069901-2-YLCHANG2@nuvoton.com>
References: <20260804032951.1069901-1-YLCHANG2@nuvoton.com>
 <20260804032951.1069901-2-YLCHANG2@nuvoton.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 04 Aug 2026 03:35:00 +0000
Message-Id: <20260804033501.4229E1F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Medium] The applied diff is missing multiple changes explicitly claimed =
in the v5 and v6 changelogs, indicating an outdated or incorrectly rebased =
patch version was submitted.
--

--- Patch [1]: [PATCH v7 1/2] ASoC: dt-bindings: nuvoton,nau8360: Add NAU83=
G60 ---
commit c8636e38cd00e42bd686aa15feae080b51b694e2
Author: Neo Chang <YLCHANG2@nuvoton.com>

ASoC: dt-bindings: nuvoton,nau8360: Add NAU83G60
   =20
Add device tree bindings documentation for the Nuvoton NAU83G60 audio
amplifier.

> Changes in v6:
> - Remove '|' from descriptions.
> - Add firmware-name in required.
> - Add "nuvoton,dsp-tx-slot-mapping" and "nuvoton,dsp-rx-slot-mapping" pro=
perties.
>=20
> Changes in v5:
> - Remove the detailed datasheet information, keep only the valid I2C addr=
ess enum
> - Simplify the firmware firmware-name items definition by removing the re=
dundant
> minItems/maxItems and moving the channel descriptions directly into indiv=
idual
> item entries.

[Severity: Medium]
It appears this patch doesn't include the updates mentioned in the v5 and v6
changelogs. Was an older or incorrectly rebased version of the patch sent?

> diff --git a/Documentation/devicetree/bindings/sound/nuvoton,nau8360.yaml=
 b/Documentation/devicetree/bindings/sound/nuvoton,nau8360.yaml
> new file mode 100644
> index 0000000000000..2d19aedf1419a
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/sound/nuvoton,nau8360.yaml
[ ... ]
> +  firmware-name:
> +    minItems: 2
> +    maxItems: 2
> +    description:
> +      Assign firmware filenames for Left and Right DSP cores.

[Severity: Medium]
The v5 changelog states that the redundant minItems/maxItems were removed a=
nd
the channel descriptions were moved into individual item entries, but this =
block
still uses minItems and maxItems. Should this be updated to use an items li=
st?

[ ... ]
> +required:
> +  - compatible
> +  - reg
> +
> +allOf:

[Severity: Medium]
The v6 changelog explicitly mentions adding firmware-name to the required l=
ist.
Additionally, the nuvoton,dsp-tx-slot-mapping and nuvoton,dsp-rx-slot-mappi=
ng
properties mentioned in the v6 changelog are completely absent from the fil=
e.
Are these missing from the submitted patch?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260804032951.1069=
901-1-YLCHANG2@nuvoton.com?part=3D1
