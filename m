Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C1B305012AC
	for <devicetree@vger.kernel.org>; Fri,  9 Oct 2026 18:43:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791571437; cv=none; b=pJpywkUfHIRp6c8Hq0iTJdhT+haBD7nmrfNwSH6zB4V9+xrA0m1Ela3dKFI2l2hyW83RbLRfMrbuJ3RzXGN4tFFDT17LWCEiq1PTx0jlzhfDWS0eeYzVUf3ltd/E1VRuExUJCAAYMbtxvhlCxpdLZCLuc1KMQlVNWB62th9BU/E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791571437; c=relaxed/simple;
	bh=Rr2QomhkdUgG3+a9IiXhwNUKcyOhQUXyMhH5Yll2BxM=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date; b=oIXLcifyhT0B1Zg/xECg2PGxIRHIbR4ze/+dKy6ujsXOnFV+3oCC9er+89zQph0n5NuCBN0pABeldcwgm4g2TVKwhSgpp3sUCcFsZO0vl5bn39JDdz//MFEPzcg0BBOU+De+NN3Rv5Oa6NxN+QsqKMXYu+KzgJ78l02843F/BDk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=lQqXc4jU; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="lQqXc4jU"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0C8771F00893;
	Fri,  9 Oct 2026 18:43:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791571435;
	bh=pyNsu+hBbF0eB3cCc3m+bzEFELSrrkxMdUq/9Ctu6Cs=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=lQqXc4jUG894PgBhUpOCDlURuII5rLkauQNYSEyqt/dTtOzYNpKMKDvVcNAtDs0RK
	 qF/jMC3LK74POBqjMkPdp/Z1VRz2Y/Ll2seKbECZvqbBhStvARktAb0JHWm1I1axXy
	 Jr5dk9LWD7Jz5qDt8PQCW3dk0qSYRogOVqZ2lYWxZ0ujr0r9/XiMwkh5NApa6GIkng
	 kaoSLi36jT+15q/rrtLl+g1aREwj1EoBOYW1qDL732SCiQ2xsaWGfwqRQYenZTgBmw
	 EDGOIm1OCfVGUPPMoOD2u0RSPuU3SGGIzzqAyMSYbzPYocLUz85rwPQvnEAsDq2ITi
	 JJn9hLBfsF/kw==
Message-ID: <sashiko-outbox-165965@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 1/2] cpufreq: mediatek: Enter system sleep at the
 suspend OPP
Reply-To: sashiko-reviews@lists.linux.dev
To: "Ryan Brue" <ryanbrue.dev@gmail.com>
Cc: robh@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20261009-rbrue-suez-upstreaming-mtk-cpufreq-suspend-opp-v1-1-9100f79b4080@gmail.com>
References: <20261009-rbrue-suez-upstreaming-mtk-cpufreq-suspend-opp-v1-0-9100f79b4080@gmail.com>
 <20261009-rbrue-suez-upstreaming-mtk-cpufreq-suspend-opp-v1-1-9100f79b4080@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 09 Oct 2026 18:43:53 +0000
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [High] opp: UAF and data race on opp_table->suspend_opp
--

commit e45cc103dadbac91ac1b6c64b8b61a195f1c5f95
Author: Ryan Brue <ryanbrue.dev@gmail.com>

cpufreq: mediatek: Enter system sleep at the suspend OPP

This commit updates the mediatek-cpufreq driver to use the generic
suspend-frequency support. It allows the driver to enter system sleep at the
suspend OPP, reducing power consumption during suspend-to-RAM.

> diff --git a/drivers/cpufreq/mediatek-cpufreq.c b/drivers/cpufreq/mediate=
k-cpufreq.c
> index 052ca7cd2f4fd..f9b1eca176eb8 100644
> --- a/drivers/cpufreq/mediatek-cpufreq.c
> +++ b/drivers/cpufreq/mediatek-cpufreq.c
> @@ -603,6 +603,7 @@ static int mtk_cpufreq_init(struct cpufreq_policy *po=
licy)
>  	policy->freq_table =3D freq_table;
>  	policy->driver_data =3D info;
>  	policy->clk =3D info->cpu_clk;
> +	policy->suspend_freq =3D dev_pm_opp_get_suspend_opp_freq(info->cpu_dev)=
 / 1000;

[Severity: High]
Is it safe to call dev_pm_opp_get_suspend_opp_freq() here?

In drivers/opp/core.c, dev_pm_opp_get_suspend_opp_freq() locklessly
dereferences opp_table->suspend_opp:

	if (opp_table->suspend_opp && opp_table->suspend_opp->available)
		freq =3D dev_pm_opp_get_freq(opp_table->suspend_opp);

However, in drivers/opp/of.c, _opp_add_static_v2() modifies
opp_table->suspend_opp dynamically without holding opp_table->lock, creatin=
g a
data race:

				opp_table->suspend_opp->suspend =3D false;
				new_opp->suspend =3D true;
				opp_table->suspend_opp =3D new_opp;

Furthermore, when an OPP is removed, _opp_kref_release() in drivers/opp/cor=
e.c
frees the dev_pm_opp object without checking or clearing
opp_table->suspend_opp:

	_of_clear_opp(opp_table, opp);
	opp_debug_remove_one(opp);
	kfree(opp);

This leaves a permanent dangling pointer if opp_table->suspend_opp pointed =
to
the dying OPP. Any subsequent call to dev_pm_opp_get_suspend_opp_freq()
will locklessly dereference the now-dangling pointer, potentially causing a
use-after-free.

> =20
>  	return 0;
>  }

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261009-rbrue-suez=
-upstreaming-mtk-cpufreq-suspend-opp-v1-0-9100f79b4080@gmail.com?part=3D1
