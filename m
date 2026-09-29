Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5E3AC55295B
	for <devicetree@vger.kernel.org>; Tue, 29 Sep 2026 18:44:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790707488; cv=none; b=PU0htRqGJayyr98hv0Dm067rzDcdmkhrDhjQJyLc35fSO3bLs+rCpi9iYfveOgSXX5W1WZ5Kbhv2HjSdsv9i8sMDza7qiLGe1yPMYtTHsFq6iolBv2B0gmm8qFAALC0Kkek/3HaeFgg01+9qFM/i6MR2fhZKA+FslTO0CS+OrMM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790707488; c=relaxed/simple;
	bh=REwYmplSpxvx7HtcWq2D2HR8FOKof35/jsxFY7g4LSc=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=YgYz2tGgCwhH2D24kOMVDNq6LC01Xh9Kad/NtVZ07QiHUavebslxSn9N+UNNLzNj14ORrQEjljZnao7F/x4Mm/ohRfCCwkSR0gTFiQ3K9OKAvxROJ8+dov5MHTW0Oj0Oe/e0Jq+RJGkIc+U5S8JVIQziDXr9pefyju9fzUL4UxI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=dgOd6ugO; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="dgOd6ugO"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B6DE11F000FF;
	Tue, 29 Sep 2026 18:44:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790707483;
	bh=TTURPywUDv6nIFVrnBWwjE0TWt8FsDiqdUOnRDlFqTk=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=dgOd6ugOX1wZ/VB+vUNXuUn3bLKQlI9RYgcRc5MVLUhkvl14ddZrzfiF4X3cYiN9M
	 tdfoX4lfARjqMd7cQIjhxxU2XNEw7p94GvIhuDxX3AnVjgTIBCJdKQXmllfJgcBXmh
	 vYSqtQOaMN9GiSEdLGyRgF66InMSr/Qu4kY1QC5ocjcUygzoeL6R+uTJisM/3XZGuP
	 ZxzP/cPfq7lPv2O0uEpmqC8YpX/08zAdIReamKwPC01T9vvg8Ep4bc9PvgjrGA6Aby
	 vaT/X8lNIPPX+ZOy7KF0swPm4EhsGahdfUr1ZVICeu/rNS1+UOlNIfI01LxJ1tTQUd
	 s+hIBQVfLY8xg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 2/6] pmdomain: qcom: rpmpd: Split SDM632 pm domains
 from MSM8953
Reply-To: sashiko-reviews@lists.linux.dev
To: =?utf-8?b?QmFybmFiw6FzIEN6w6ltw6Fu?= <barnabas.czeman@mainlining.org>
Cc: robh@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260929-sdm632-rpmpd-v2-2-97ef8858161b@mainlining.org>
References: <20260929-sdm632-rpmpd-v2-0-97ef8858161b@mainlining.org>
 <20260929-sdm632-rpmpd-v2-2-97ef8858161b@mainlining.org>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 29 Sep 2026 18:44:42 +0000
Message-Id: <20260929184442.B6DE11F000FF@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:
- [High] pmdomain: ABI breakage for MSM8953 VDDMD domain
- [Low] pmdomain: boot log spam from sparse rpmpds arrays
--

commit dbd7dd8006d3cfc31f752d18b9c1216c6ac42655
Author: Barnab=C3=A1s Cz=C3=A9m=C3=A1n <barnabas.czeman@mainlining.org>

pmdomain: qcom: rpmpd: Split SDM632 pm domains from MSM8953

Remove modem related pm domains from MSM8953 rpmpd because MSM8953 MSS
is using mss-supply as regulator.
Split SDM632 rpmpd from MSM8953 because SDM632 MSS is using mss-supply
as pm domain.

> diff --git a/drivers/pmdomain/qcom/rpmpd.c b/drivers/pmdomain/qcom/rpmpd.c
> index 5f55fc791131a..c37a79d6bc433 100644
> --- a/drivers/pmdomain/qcom/rpmpd.c
> +++ b/drivers/pmdomain/qcom/rpmpd.c
> @@ -703,8 +692,6 @@ static const struct rpmpd_desc msm8917_desc =3D {
>  };
> =20
>  static struct rpmpd *msm8953_rpmpds[] =3D {
> -	[MSM8953_VDDMD] =3D	&md_s1a_lvl,
> -	[MSM8953_VDDMD_AO] =3D	&md_s1a_lvl_ao,

[Severity: High]
Does removing the VDDMD PM domains break backward compatibility with
existing device trees for MSM8953?

When booting a new kernel with an older MSM8953 device tree, the
provider rpmpd driver will no longer expose the VDDMD domain. Older
device trees lack the mss-supply regulator, so a dummy regulator
will be returned and enabled.

Since the actual power domain is never requested or powered up in this
scenario, could this cause the modem to fail to boot on older DTBs?
Is there a fallback mechanism to support existing device trees?

>  	[MSM8953_VDDCX] =3D	&cx_s2a_lvl,
>  	[MSM8953_VDDCX_AO] =3D	&cx_s2a_lvl_ao,

[ ... ]

> @@ -844,6 +831,21 @@ static const struct rpmpd_desc qm215_desc =3D {
>  	.max_state =3D RPM_SMD_LEVEL_TURBO,
>  };
> =20
> +static struct rpmpd *sdm632_rpmpds[] =3D {
> +	[RPMPD_VDDMD] =3D		&md_s1a_lvl,
> +	[RPMPD_VDDCX] =3D		&cx_s2a_lvl,
> +	[RPMPD_VDDCX_AO] =3D	&cx_s2a_lvl_ao,
> +	[RPMPD_VDDCX_VFL] =3D	&cx_s2a_vfl,
> +	[RPMPD_VDDMX] =3D		&mx_s7a_lvl,
> +	[RPMPD_VDDMX_AO] =3D	&mx_s7a_lvl_ao,
> +};

[Severity: Low]
Will this sparse array result in boot log warnings?

Looking at rpmpd_probe, it iterates over the array and unconditionally
emits a warning for any missing entries:

        if (!rpmpds[i]) {
                dev_warn(&pdev->dev, "rpmpds[] with empty entry at index=3D=
%d\n", i);
                continue;
        }

Since sdm632_rpmpds uses RPMPD_VDDMD (index 10) but omits the domains
from indices 5 through 9, will the probe function emit multiple warnings
on every normal boot for the gap in the array?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260929-sdm632-rpm=
pd-v2-0-97ef8858161b@mainlining.org?part=3D2
