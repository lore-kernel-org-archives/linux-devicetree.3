Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5F32838C40C
	for <devicetree@vger.kernel.org>; Mon, 20 Jul 2026 13:58:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784555920; cv=none; b=PxfvQga5w+PHLSLYsxdwc28oHWKClLKXyO5qiXR1DGbvBbrwfZeG7f0Td9MGlsaGStKXlQF5gqNJEQL6pEozPpUi2KgLpqTtBPGhGU+cMce6pQjYf6MjhhKTJBO5PpKIm9To6oZ33SKU7cx6sxTzz0ElAs0Ty39HlD/AQCA0Hdk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784555920; c=relaxed/simple;
	bh=l01EaalwBjV9mO/psLI09v8pCO5slVGS9AOTc+QVn04=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=HKTPRJ3lj4x3wu63YAkKLxN/WaphiKSMh/sFu/lv8G60Z++xe2MfsJzRBY4Lgh4V/yUj7ie8Mxlet6BT1j5b5T0Uuyp3Eo72MJuC8S+fhl0U24CRNPNMRTcVb+Elj8gXG0YQFkTHU4fAuloNXegdjQKiPOPZhNadUWq+wMvln2A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=I3K963yt; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="I3K963yt"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 94D9F1F000E9;
	Mon, 20 Jul 2026 13:58:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784555919;
	bh=niwP5T1zcgkdtuv5FMoRKeMqwieGzWbRQ8nHHW2X6gE=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=I3K963ytrxnk1LwYfqln9aualhF4ToX3Tt3koOL8RMcV+N7lVv5OHS6itr5sAl609
	 lLzkKZnARNPc9NZS2bbY1CezYlcKtoYE6wRBvTrm42NXPLO0M+h7mW+HPOVeBJMnnu
	 W9srkbL3fXxWjo/MtN6bh/R3CyofhRcK17iTxEyHjyui+G5UCtoj5JbkYbX4cKG9oX
	 8AJc7dKN1c/uKVgYBjTXg/fEOECkmFXuHacM38SrFNJw9E9CKhvcNMzCKqLaz9/5Lr
	 GG76jLK+MEN51z54wJM0Qa6UlwQnAUq/POVxJMNCTJBN9VSE9/DDALSvO4hfp15MGg
	 cenyuAafoEUQg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v3 phy-next 5/8] soc: fsl: guts: make fsl_soc_data
 available after fsl_guts_init()
Reply-To: sashiko-reviews@lists.linux.dev
To: "Vladimir Oltean" <vladimir.oltean@nxp.com>
Cc: robh@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org, linux-phy@lists.infradead.org, olteanv@gmail.com, vkoul@kernel.org, neil.armstrong@linaro.org
In-Reply-To: <20260720133642.136324-6-vladimir.oltean@nxp.com>
References: <20260720133642.136324-1-vladimir.oltean@nxp.com>
 <20260720133642.136324-6-vladimir.oltean@nxp.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 20 Jul 2026 13:58:38 +0000
Message-Id: <20260720135838.94D9F1F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [High] NULL pointer dereference in the error handling path of `fsl_guts_i=
nit()`.
--

--- Patch [5]: [PATCH v3 phy-next 5/8] soc: fsl: guts: make fsl_soc_data av=
ailable after fsl_guts_init() ---
commit d316b69e1c587b56ad6f914ddbd2e412490c8594
Author: Vladimir Oltean <vladimir.oltean@nxp.com>
soc: fsl: guts: make fsl_soc_data available after fsl_guts_init()

This commit preserves the soc_data determined during fsl_guts_init() so it
can be referenced later for RCW override methods. It updates the error
handling paths to properly clean up the saved state if initialization fails.

> diff --git a/drivers/soc/fsl/guts.c b/drivers/soc/fsl/guts.c
> --- a/drivers/soc/fsl/guts.c
> +++ b/drivers/soc/fsl/guts.c
> @@ -231,10 +232,9 @@ static int __init fsl_guts_init(void)
>  {
> -	struct soc_device_attribute *soc_dev_attr;
> +	struct soc_device_attribute *soc_dev_attr =3D NULL;
>  	static struct soc_device *soc_dev;

[ ... ]

> @@ -243,12 +243,12 @@ static int __init fsl_guts_init(void)
>  	np =3D of_find_matching_node_and_match(NULL, fsl_guts_of_match, &match);
>  	if (!np)
>  		return 0;
> -	soc_data =3D match->data;
> +	soc.data =3D match->data;
> =20
>  	soc.dcfg_ccsr =3D of_iomap(np, DCFG_CCSR);
>  	if (!soc.dcfg_ccsr) {
>  		of_node_put(np);
> -		return -ENOMEM;
> +		goto err_nomem;
>  	}

[Severity: High]
If of_iomap() fails here, the code executes a goto to the error path while
soc_dev_attr is still explicitly NULL.=20

Down in the error cleanup path, the code unconditionally dereferences=20
soc_dev_attr to retrieve its members:

> @@ -311,8 +311,11 @@ static int __init fsl_guts_init(void)
>  	kfree(soc_dev_attr->revision);
>  	kfree(soc_dev_attr->serial_number);
>  	kfree(soc_dev_attr);

Will this trigger a NULL pointer dereference?

While kfree() itself handles NULL pointers gracefully, evaluating
soc_dev_attr->revision and soc_dev_attr->serial_number requires reading
memory from the NULL soc_dev_attr pointer before passing the argument to
kfree().

> -	iounmap(soc.dcfg_ccsr);
> -	soc.dcfg_ccsr =3D NULL;
> +	if (soc.dcfg_ccsr) {
> +		iounmap(soc.dcfg_ccsr);
> +		soc.dcfg_ccsr =3D NULL;
> +	}
> +	soc.data =3D NULL;
> =20
>  	return ret;
>  }

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260720133642.1363=
24-1-vladimir.oltean@nxp.com?part=3D5
