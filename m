Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DAB2D36C9D9
	for <devicetree@vger.kernel.org>; Thu,  3 Sep 2026 08:05:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788422721; cv=none; b=F2T2z16zfmZM+OsMhRbFYZLnsh3w3CKM/3/XxqQzeyXQHH1hb/sHxs6Jng5T77EMmufhnVdVdM82klasKch+vLI2+ggkTr91s1OC/wDOnPcsd/zMbcmVwe9A3pS2LeEY4e1Pqlb2dOrE8DK9lks0yjC+GiFs2iPCiacZv+TUU9U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788422721; c=relaxed/simple;
	bh=soZdwxjcxKLiH08uy9uVcx2v3MDNpRskzxB9KR1w5MM=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=FEiaEdCgNKeQnUquLWyLHI1DL5lu5ilnUFHSiZCYHzKPs1oitQf8d2mcQYxrz3xro8M863hrF35wakZYleNqa+gY+1N2Tj4Qbsmzp53Kr0bOkwPH8cD+fLKBhrgErnY/wdX/VgW3YvNJXH4fag6J/kf5mgpA3O4puqN1o7atJG0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Z1ZUU+ih; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Z1ZUU+ih"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 892D71F00A3D;
	Thu,  3 Sep 2026 08:05:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788422719;
	bh=Wk/auHCLyxLc1aHeHsVTO5sT2v2zEhEOezEe+CjR1mI=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=Z1ZUU+ihEvho6DCkPz7j5dfZXJU2FwBXtCQOj8PYXl7rvLacvhRYqmWpWFAN2ytZj
	 TUPgD/z1R/h5e0yP56czbn693WooMCLq4pgk2muXRsiWjF3ijZtqBiRjrjxCm1eMo3
	 MZ/ovSSh9MT45kDf2ckhWM8K1ksz33QLC1it/mxR8poc0T7m9N8r5rQteRKJIHLqOi
	 CBq/MD13NHWB2W/g5e+ofthuOPOZL3+nluXEzgUvSaYizf/UlC9CyPDFljOcUdLRA1
	 ZQpptBr46/zKz4B2VFnifCUZ+os6oJN7NunW8MT9CcWFwYlJmZzIpx4SjvIOvF3xF/
	 YZa5NdMKB//8w==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH V3 3/3] usb: host: xhci-tegra: Add Tegra264 XHCI support
Reply-To: sashiko-reviews@lists.linux.dev
To: "Wayne Chang" <waynec@nvidia.com>
Cc: conor+dt@kernel.org, devicetree@vger.kernel.org, robh@kernel.org
In-Reply-To: <20260903074539.613220-4-waynec@nvidia.com>
References: <20260903074539.613220-1-waynec@nvidia.com>
 <20260903074539.613220-4-waynec@nvidia.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 03 Sep 2026 08:05:19 +0000
Message-Id: <20260903080519.892D71F00A3D@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Medium] Undocumented behavioral change: `.enable_firmware_messages` is d=
isabled for Tegra264, contradicting the commit message.
--

commit 9801b6744662599081fdad0fae6db596ecae9f70
Author: Wayne Chang <waynec@nvidia.com>

usb: host: xhci-tegra: Add Tegra264 XHCI support

This commit adds Tegra264 XUSB host mode controller support. The new host
controller is described as being identical to the existing Tegra234 XHCI
with the exception of the max_num_wakes value.

> diff --git a/drivers/usb/host/xhci-tegra.c b/drivers/usb/host/xhci-tegra.c
> index a16c4a8233472..a973cfa4b13b0 100644
> --- a/drivers/usb/host/xhci-tegra.c
> +++ b/drivers/usb/host/xhci-tegra.c
[ ... ]
> @@ -2753,12 +2753,40 @@ static const struct tegra_xusb_soc tegra234_soc =
=3D {
>  	.enable_firmware_messages =3D true,
>  };
> =20
> +static const struct tegra_xusb_soc tegra264_soc =3D {
[ ... ]
> +	.lpm_support =3D true,
> +	.has_bar2 =3D true,
> +	.enable_firmware_messages =3D false,

[Severity: Medium]
The commit message states that the Tegra264 host controller is very similar
to the existing Tegra234 XHCI, except for the number of max_num_wakes. Howe=
ver,
this structure explicitly disables firmware messages for tegra264_soc, wher=
eas
it is enabled for tegra234_soc.

Is this undocumented change intentional? If so, could the commit message be
updated to reflect that firmware messages are also disabled for Tegra264?

> +};

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260903074539.6132=
20-1-waynec@nvidia.com?part=3D3
