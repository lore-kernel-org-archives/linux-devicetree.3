Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 08F8237F331
	for <devicetree@vger.kernel.org>; Thu, 23 Jul 2026 16:14:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784823296; cv=none; b=j2C605rgV5WxUsZTXoeQubgmL5GYFh3AaC7dLTV+FDnUkF42BDlSmwT4nodxeV7jBXg23gt6+aA87yg/cdnXGhnCH9QZ+UZhnszsU2EAzdTnvYqqTP7rBqQ4eXFfdrVsBDoOGO525AEhcsJmncKJ9pvAEBlcYs4O0+I07WujsZk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784823296; c=relaxed/simple;
	bh=UWLZxJsio+cBbP3+dbn4Tl+msParYi0l8am4Ua+xfFc=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=c9oVNIhQhwjTTp38ka5NBntNUdjAJVXHUP4B7XsWl5FfyvJ6rf4+HmTfnpqltY2o/Y6nmyLzvs7scbwcxllaXs5yoAyQeLi8PtRBuckonyeQ8Y7pxxmlPMZfsGyaEHDvfWGfWl0Cxjye8xI0oQUrPThqwaHSPuD7nJb4NRIMzEc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=WK8z6WJT; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="WK8z6WJT"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C5C891F000E9;
	Thu, 23 Jul 2026 16:14:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784823276;
	bh=7xotAwVFCF0np0O6SMjvBhhpz7pt3eyVRxCOSFNeFT4=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=WK8z6WJT08qrPjPdzaYPohubWKSaVpoOs/ng139ZiEYHK3xSoxXhDmhVNqWCLoXzD
	 wL84CQzbJQfk+bkr50V2VWS6aCfgLa+4m49ZCZDQHRkn1tVrPbFfrd6V79kIQr0F4P
	 gxFhEfigQ49wZG4hcC9f+noAAVLvTh9htdZv0uWfqwoByWeOG254Hjj6BdBC9xdpnP
	 HITG8p/yl4+Nii1lzput2vjind1RiqHTY0pfeIXLrhM19TnwOzJQjEXOKTjLyHSl2u
	 ydcPSrys4klIZxYRL9+sEoCfoUiJzeqWr0TMSAgV2n0NFec44+A/abDmKT4UfvlStY
	 dsvT9xA43AS2Q==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v3 3/4] clk: qcom: Add Audio Core clock controller
 support on Qualcomm Shikra SoC
Reply-To: sashiko-reviews@lists.linux.dev
To: "Imran Shaik" <imran.shaik@oss.qualcomm.com>
Cc: robh@kernel.org, devicetree@vger.kernel.org, conor+dt@kernel.org
In-Reply-To: <20260723-shikra-audiocorecc-v3-3-90b878ae0d4e@oss.qualcomm.com>
References: <20260723-shikra-audiocorecc-v3-0-90b878ae0d4e@oss.qualcomm.com>
 <20260723-shikra-audiocorecc-v3-3-90b878ae0d4e@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 23 Jul 2026 16:14:35 +0000
Message-Id: <20260723161435.C5C891F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [High] The `audio_core_cc_shikra_probe` function does not validate the re=
turn value of `device_get_match_data()`, leading to a NULL pointer derefere=
nce.
--

--- Patch [3]: [PATCH v3 3/4] clk: qcom: Add Audio Core clock controller su=
pport on Qualcomm Shikra SoC ---
commit de62912fa52410c163e6ab3071a5cbf9cc2887aa
Author: Imran Shaik <imran.shaik@oss.qualcomm.com>

clk: qcom: Add Audio Core clock controller support on Qualcomm Shikra SoC

This commit adds support for the Audio Core Clock Controller (AUDIOCORECC)
and Audio Core CSR resets on the Qualcomm Shikra SoC.

> diff --git a/drivers/clk/qcom/audiocorecc-shikra.c b/drivers/clk/qcom/aud=
iocorecc-shikra.c
> new file mode 100644
> index 0000000000000..76017240f7684
> --- /dev/null
> +++ b/drivers/clk/qcom/audiocorecc-shikra.c
[ ... ]
> +static int audio_core_cc_shikra_probe(struct platform_device *pdev)
> +{
> +	const struct qcom_cc_desc *desc;
> +
> +	desc =3D device_get_match_data(&pdev->dev);
> +
> +	return qcom_cc_probe(pdev, desc);

[Severity: High]
Can this result in a NULL pointer dereference? If the driver is bound to a
device via the driver_override sysfs attribute, device_get_match_data()
will return NULL because the OF match fails.

The NULL desc pointer is then passed unchecked to qcom_cc_probe(), which
calls qcom_cc_map(pdev, desc), leading to a dereference of desc->config.

Should there be a NULL check for desc before passing it to qcom_cc_probe()?

> +}
> +
> +static struct platform_driver audio_core_cc_shikra_driver =3D {
[ ... ]

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260723-shikra-aud=
iocorecc-v3-0-90b878ae0d4e@oss.qualcomm.com?part=3D3
