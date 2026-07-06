Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8CE1D1FF7C5
	for <devicetree@vger.kernel.org>; Mon,  6 Jul 2026 22:20:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783376411; cv=none; b=Vx2T2QV6a2uFKtiA6QgORzMY4lkzM0ygVF2N2z3enXfiZRmvJlGR3yakZB+IsasaU5QKVze352OhW4/gIE5oYwMY4Bg6LcqbPscUMzfGvNWAnVL7KSC3pkGk6BG9+IVOXQUrwW7A0r48hGioOjuWamY0Yk2sOZyB//suffsU9Ng=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783376411; c=relaxed/simple;
	bh=yofMlI6UDenr2gvnYPWrmLL8iI4qkpbN97SBYVOd+hY=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=q7sDRyKVSGEpl4AsqOz/1MFrJKmnQIQLhCzY9rIm6guRex9ARZZ5yicPo9XgP1LpBGAh6SwG/83wRpqXAQLvzT8D1ufoPMnN7VAQryhzPqi9m1xD3OpK5cUj02ZyqnAey2OW6xAJTtJFTmVAu37Tbujb2ygAB8Msr+T+GprY9Sk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=kgqVSPzo; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="kgqVSPzo"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E13571F000E9;
	Mon,  6 Jul 2026 22:20:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783376410;
	bh=+w/07/TtMao6nKX8q7+CBPtoQmV5Lcp4b68JV3hlwTA=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=kgqVSPzoo+d33oOUgld+cVkYfrBqp/gAzQ11uMsmDPqvQYk/kFOe2NURxoEVqRmQK
	 WRow6YbKEMsydYz/+DfapbcgktjGsnQgXNtYZm3SgoajlhSacf3BDnL6UL1p0BwT5E
	 VjCWy/G6cuomD/c4NQLdSuuCSFPSdim3idML6WPP0lr94FSkgn9ER3w1Z7xkeolIM8
	 KokRuVGogp9b4Z+xnR8WoDuVVkLJ2iVxUr6s3OLeFNKzwB0NF6GfkAOrfSzu9eBgfd
	 6d8bv3PeAQdwAz6YAXpzLwmGErkvD9fkP09WGXh5qVzqRO3bKIG64HWAAYDYY9itFq
	 +dICmDpB6IA3w==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v4 2/3] media: iris: Add support for Milos (VPU v2.0)
Reply-To: sashiko-reviews@lists.linux.dev
To: "Alexander Koskovich" <akoskovich@pm.me>
Cc: conor+dt@kernel.org, devicetree@vger.kernel.org, robh@kernel.org
In-Reply-To: <20260706-milos-iris-v4-2-119cbe0a7262@pm.me>
References: <20260706-milos-iris-v4-0-119cbe0a7262@pm.me>
 <20260706-milos-iris-v4-2-119cbe0a7262@pm.me>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 06 Jul 2026 22:20:09 +0000
Message-Id: <20260706222009.E13571F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Low] The devicetree compatible string uses the internal codename 'milos'=
 instead of the SoC name, violating DT naming conventions.
--

--- Patch [2]: [PATCH v4 2/3] media: iris: Add support for Milos (VPU v2.0)=
 ---
commit 70c032abc00c4a3de218f6fa34ded1b140a7719c
Author: Alexander Koskovich <akoskovich@pm.me>

media: iris: Add support for Milos (VPU v2.0)

This commit adds support for the Milos Iris codec. It targets the variant
found on the SM7635-AB which has half of its pipes disabled.

> diff --git a/drivers/media/platform/qcom/iris/iris_probe.c b/drivers/medi=
a/platform/qcom/iris/iris_probe.c
> index c2dcb50a27824..353cda58514c2 100644
> --- a/drivers/media/platform/qcom/iris/iris_probe.c
> +++ b/drivers/media/platform/qcom/iris/iris_probe.c
> @@ -360,6 +360,10 @@ static const struct dev_pm_ops iris_pm_ops =3D {
>  };
> =20
>  static const struct of_device_id iris_dt_match[] =3D {
> +	{
> +		.compatible =3D "qcom,milos-iris",

[Severity: Low]
This isn't a bug, but should the compatible string in iris_dt_match[] use t=
he
SoC identifier (e.g., "qcom,sm7635-iris") instead of the internal codename
"milos"?=20

Using codenames violates standard devicetree naming conventions for Qualcomm
blocks and creates a non-standard ABI that is difficult to deprecate once
merged.

> +		.data =3D &milos_data,
> +	},
>  	{
>  		.compatible =3D "qcom,qcs8300-iris",
>  		.data =3D &qcs8300_data,

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260706-milos-iris=
-v4-0-119cbe0a7262@pm.me?part=3D2
