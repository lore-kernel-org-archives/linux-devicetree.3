Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 19541331207
	for <devicetree@vger.kernel.org>; Tue, 11 Aug 2026 20:46:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786481212; cv=none; b=lgb1YzqeAVR2w51qiLjuC9B/YXq5a5VgmqNKwSPr6CZstRmDUSVQM+o2AylIBxLVyQ6HGhk80NIxaySoYLVL4wpVNRWCBdsrvLqA0vEzaCDRDRMa4UQKqNqBAd8tQphhcHNBRp1IKNEZPBAFNoWnyYAiJvuVlgP6xIZdHGfIjwA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786481212; c=relaxed/simple;
	bh=JcZ+uz8DQChs0GiQLkHlXZZGChvpzUfsXq1KU9DcKyA=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=Em46nv6zhFKp7gXgyVkls97prujlHzOfThur6kUvKeBe8UTXMADwAAJ2kw6i1zsAIGF/Hn4Rf9zfswkxXMTnXGeAzAaS6YZuedTIQxy1LqVsvapLRu2tckLoMWNFrabyXdBorLAsCuZS2NTHp7XXsh3PJ9APRQNNZGPEWMO+X9o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=LdJcYCIh; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="LdJcYCIh"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 868241F000E9;
	Tue, 11 Aug 2026 20:46:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786481210;
	bh=FK/rBP1oObuHd/AVIzhmlU34VPjtmJ7ZIgbvlRrz/r4=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=LdJcYCIhbfEzZVHGvF5zVm0ThI/KgIz3IfBvepHwOmuKB37PyS5lLLaH+OAhNh7NB
	 8KLLBUb4EI3vv3Fvmm2VkL0XCIROHJIOotw/WJqYzoBHMzj3wFj4EkNgzNeOZchH4t
	 sYIBYP476BlhOV32zFERSnZqHtCPBaAkN7ZQOS6V81XEdI9oGnwnbDRgjjZj0nyl6R
	 ZuIikbrZnzYTCdt7ktraI0HrxoQBfCcCVJ/vr6pFCZyHrSSZPsC5hhnoIoORQNtXQg
	 337pjXMEBnNMzlwwjBQsZn3+fU4/JsvT6r7iQQ7U+H/TQUhIy8SlTxPRbIxDOfE10N
	 V0weRAFh56TSw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 3/3] power: supply: qcom_smbx: program AICL rerun time
Reply-To: sashiko-reviews@lists.linux.dev
To: "Robin Snyders" <robin@snyders.xyz>
Cc: robh@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260811-submit-qcom-smbx-send-v1-v1-3-feec6cfa123a@snyders.xyz>
References: <20260811-submit-qcom-smbx-send-v1-v1-0-feec6cfa123a@snyders.xyz>
 <20260811-submit-qcom-smbx-send-v1-v1-3-feec6cfa123a@snyders.xyz>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 11 Aug 2026 20:46:50 +0000
Message-Id: <20260811204650.868241F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:

Pre-existing issues:
- [High] The watchdog interrupt handler writes to a register without adding=
 the peripheral base address.
--

--- Patch [3]: [PATCH 3/3] power: supply: qcom_smbx: program AICL rerun tim=
e ---
commit 7ed13fc0edf8d350c9eda801c5d3ae1f45ee12b6
Author: Casey Connolly <casey.connolly@linaro.org>

power: supply: qcom_smbx: program AICL rerun time

The bootloader-provided automatic input current limit rerun interval is
not a stable software interface. Program a consistent three-second
interval during probe. This is required at least on SMB5 hardware.

> diff --git a/drivers/power/supply/qcom_smbx.c b/drivers/power/supply/qcom=
_smbx.c
> index 09d9e0f95cb56..9e3e240b68130 100644
> --- a/drivers/power/supply/qcom_smbx.c
> +++ b/drivers/power/supply/qcom_smbx.c
[ ... ]
> @@ -1384,6 +1385,14 @@ static int smb_probe(struct platform_device *pdev)
> =20
>  	platform_set_drvdata(pdev, chip);
> =20
> +	rc =3D regmap_write_bits(chip->regmap,
> +			       chip->base + AICL_RERUN_TIME_CFG,

[Severity: High]
This is a pre-existing issue, but seeing the correct usage of chip->base
here, is the regmap write in smb_handle_wdog_bark() writing to an arbitrary
PMIC peripheral?

drivers/power/supply/qcom_smbx.c:smb_handle_wdog_bark() {
	...
	rc =3D regmap_write(chip->regmap, BARK_BITE_WDOG_PET,
			  BARK_BITE_WDOG_PET_BIT);
	...
}

It appears to be missing chip->base, which could fail to pet the charger
watchdog and corrupt the state of another peripheral when the watchdog bark
interrupt fires.

> +			       AICL_RERUN_TIME_MASK,
> +			       AICL_RERUN_TIME_3_SECS);
> +	if (rc < 0)
> +		return dev_err_probe(chip->dev, rc,
> +				     "could not set AICL rerun time\n");
> +

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260811-submit-qco=
m-smbx-send-v1-v1-0-feec6cfa123a@snyders.xyz?part=3D3
