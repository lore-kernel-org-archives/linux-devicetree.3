Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5E41624679C
	for <devicetree@vger.kernel.org>; Sat, 29 Aug 2026 05:43:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787982218; cv=none; b=b2NJIv21YsJaa2yj8Tf7WeeoxYZP6x9hO9rJgd2Vt9jsxxc1uebIQK58O3+hqWd+kv0D1SeSsmTPEYvfeiPl+ZCUyGezU61gLishZufU4ZoefOqNpCwY1k1BcTaR+fxaf9Bep1FyJvRjslzBcym0YlAh5d0mt6Mhe/OLtwegPsA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787982218; c=relaxed/simple;
	bh=3U1Zhw99QLhu2DhyZ+LPa91kFuYHChtTbxvue56nO1g=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=ZcDzY5p6KBBSxuBJhVWCBplZDl7YFDQzBj1IvYit/SbY6fGBV5WsvDXQID1iNc1MzfHtSMDmVcpPM14EcyisY+H6z2w0j8wERWv1ckix//zEwcIQCdypynybU2AUFqQ549pSvcISQwwPNPUMV2EcEdWaMi2aY82TAyInILL3zlM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=TKvc69Ln; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="TKvc69Ln"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9E3DB1F000E9;
	Sat, 29 Aug 2026 05:43:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1787982216;
	bh=jlW5/JVyR2ISddejjftdv1LCq4NqPVLCAkHDlykMljg=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=TKvc69LnNEYvTtxtCfJeSn7jpOLLplMFMZ0wYv2ippj5fNA7J+E0FJxqUu2ze+Xbr
	 lka6BY7wtHFY5PQ/YTfEfmcZzzpSv6OCv2HLWjhVcMxSV3g8WA1t7jQnbGAnk6QDMI
	 wVxPr4/ENueHyYr/ueKVg0NJTNy0bQr+li2sNXDntnRN1nsIhfI1lCCSONwrof4ZB7
	 f1gPg/09j8XIezzd42ImM3Dhp9BEIIkh33T8H39cMl4t5FT5qUp6TsAOhzDWIQaK4u
	 TdLNiIghp+1HfzTHL/O7hN9NE1VAE3wVUxlVWZgGV1j/DfGe1h4r/K7y21YC2lNE7G
	 wfJin/aDEtJFQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH] media: dt-bindings: ak7375: Add AK7377
Reply-To: sashiko-reviews@lists.linux.dev
To: "Jan-Michael Brummer" <jan.brummer@tabos.org>
Cc: robh@kernel.org, devicetree@vger.kernel.org, conor+dt@kernel.org, media-ci@linuxtv.org
In-Reply-To: <20260829052514.18178-2-jan.brummer@tabos.org>
References: <20260829052514.18178-1-jan.brummer@tabos.org>
 <20260829052514.18178-2-jan.brummer@tabos.org>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sat, 29 Aug 2026 05:43:36 +0000
Message-Id: <20260829054336.9E3DB1F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Medium] Missing driver match for newly added compatible string 'asahi-ka=
sei,ak7377'.
--

commit 9537c3ff68990acd9e078305609fb067fe093ae9
Author: Jan-Michael Brummer <jan.brummer@tabos.org>

media: dt-bindings: ak7375: Add AK7377

This commit updates the device tree binding for the AK7375 to include the
AK7377, which is register compatible and driven by the same driver.

> diff --git a/Documentation/devicetree/bindings/media/i2c/asahi-kasei,ak73=
75.yaml b/Documentation/devicetree/bindings/media/i2c/asahi-kasei,ak7375.ya=
ml
> index fe312cc6a8731..c040757eb80c9 100644
> --- a/Documentation/devicetree/bindings/media/i2c/asahi-kasei,ak7375.yaml
> +++ b/Documentation/devicetree/bindings/media/i2c/asahi-kasei,ak7375.yaml
> @@ -18,6 +18,7 @@ properties:
>      enum:
>        - asahi-kasei,ak7345
>        - asahi-kasei,ak7375
> +      - asahi-kasei,ak7377

[Severity: Medium]
Should the driver match table in drivers/media/i2c/ak7375.c also be updated
to include this new compatible string?

Currently, ak7375_of_table only lists the previous models:

static const struct of_device_id ak7375_of_table[] =3D {
	{ .compatible =3D "asahi-kasei,ak7345", .data =3D &ak7345_cdef, },
	{ .compatible =3D "asahi-kasei,ak7375", .data =3D &ak7375_cdef, },
	{ /* sentinel */ }
};

Without adding the new string here, won't a device declaring only
"asahi-kasei,ak7377" fail to probe because the driver lacks a matching
entry?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260829052514.1817=
8-2-jan.brummer@tabos.org?part=3D1
