Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 54D2E534463
	for <devicetree@vger.kernel.org>; Wed,  9 Sep 2026 11:08:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788952121; cv=none; b=lVFCMsDxHIHr+CvaLj97KhW4R3HupvXTjZGrFp3+arvH9TbuXFDvL9zMLpI3mYRL5LPae0dI3ZxZoaFD4KzLQiGPSUppYikV4I1V/cpskF/ltdBlM0e9S0bNRd7ev9qRFdEd6oN2KIWjU9JPNOx55+kz87ImYAmCv1cYUDZNXws=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788952121; c=relaxed/simple;
	bh=0HBlGxD/KfZnDuSYzH1yccjWM0dROXtFXQUyETMUBIg=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=lgOy+nh5JDujJuZ70t1//iRMihF7I4hgNbe8BWjLgd6RkdfE7fiN4RBApBbNgMzwmBtXobTQk6YtNSMMOsinXG+lWAT9o9prWnc2+L2DzicAVkCR0EyLATGW2cqXt+BrbMcqiNUGP/fTUe1gHuruXOqntCi3Gme1vPr0MeOMw3Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=dIzovYfF; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="dIzovYfF"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D79451F00A3D;
	Wed,  9 Sep 2026 11:08:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788952120;
	bh=xpSlGYekKRAc7cz04VpkyIbCP1fJ9YK469qs2pXNYWQ=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=dIzovYfFmnhith18fCrxo/ACvG6gdTuiRwaeqHdgqspr7o/TsC7PzstrNiRMC+Wa0
	 TfSz+181a5doWHqtrhuyypnDLfCtWVsA3qiqOv7ruyWkDclRotThZOymnaAtHGL2fD
	 NWf7RjAnVr258jh+1JjUz2cBq3eemw91562nWs03hsk93eRji2Cd7jq1KTw47eig3K
	 iliJrqDsqE++yFydyTvyYt/t2ZC45P0jJ288vCPwwZiq03p2Ng45kcPO0nVKGlnKNg
	 QJsMDxyWFgomow2rBe3847T6X1rNKfpw6b8eNHfyT+5+uRY4lySCGggKagBufA46N4
	 2/Flki0FNb1vA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v3 1/3] remoteproc: qcom_q6v5_pas: propagate
 dev_pm_genpd_set_performance_state() errors
Reply-To: sashiko-reviews@lists.linux.dev
To: "Mukesh Ojha" <mukesh.ojha@oss.qualcomm.com>
Cc: robh@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260909105049.1317985-2-mukesh.ojha@oss.qualcomm.com>
References: <20260909105049.1317985-1-mukesh.ojha@oss.qualcomm.com>
 <20260909105049.1317985-2-mukesh.ojha@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 09 Sep 2026 11:08:39 +0000
Message-Id: <20260909110839.D79451F00A3D@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:

New issues:
- [High] The added error check for dev_pm_genpd_set_performance_state() is =
dead code and completely fails to fix the silent failure masking.

Pre-existing issues:
- [High] Pre-existing identical sequence flaw in sister remoteproc drivers =
silently masks performance state errors.
--

commit 79e5a0b96d1b1d35117390df652884f8c2c16c71
Author: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>

remoteproc: qcom_q6v5_pas: propagate dev_pm_genpd_set_performance_state() e=
rrors

This commit attempts to capture and handle errors from
dev_pm_genpd_set_performance_state() in qcom_pas_pds_enable() to avoid
silently masking performance state failures.

> diff --git a/drivers/remoteproc/qcom_q6v5_pas.c b/drivers/remoteproc/qcom=
_q6v5_pas.c
> index ca8e61254c449..42bcbe72f95bd 100644
> --- a/drivers/remoteproc/qcom_q6v5_pas.c
> +++ b/drivers/remoteproc/qcom_q6v5_pas.c
> @@ -167,7 +167,13 @@ static int qcom_pas_pds_enable(struct qcom_pas *pas,=
 struct device **pds,
>  	int i;
> =20
>  	for (i =3D 0; i < pd_count; i++) {
> -		dev_pm_genpd_set_performance_state(pds[i], INT_MAX);
> +		ret =3D dev_pm_genpd_set_performance_state(pds[i], INT_MAX);
> +		if (ret) {
> +			dev_err(pas->dev,
> +				"failed to set proxy PD %d state %u: %d\n",
> +				i, INT_MAX, ret);
> +			goto unroll_pd_votes;
> +		}
>  		ret =3D pm_runtime_get_sync(pds[i]);

[Severity: High]
Is this newly added error check able to catch performance state errors?

Because dev_pm_genpd_set_performance_state() is called before
pm_runtime_get_sync(), the proxy PD device is still in the RPM_SUSPENDED
state when this executes.

When called on an RPM_SUSPENDED device, genpd_dev_pm_set_performance_state()
merely caches the request in rpm_pstate and unconditionally returns 0.

As a result, this check will never evaluate to true. The actual application
of the state is deferred to pm_runtime_get_sync(), which calls
genpd_runtime_resume() and genpd_restore_performance_state().

Because genpd_restore_performance_state() returns void, it drops any errors
from the underlying provider.

Does this mean the failure remains silently masked despite this patch?

[Severity: High]
This isn't a bug introduced by this patch, but this identical sequence flaw
exists in several sister remoteproc drivers.

In qcom_q6v5_mss.c:q6v5_pds_enable(),
qcom_q6v5_adsp.c:qcom_rproc_pds_enable(), and qcom_wcnss.c:wcnss_start(),
the drivers also call dev_pm_genpd_set_performance_state() while the proxy
PDs are in the RPM_SUSPENDED state (prior to calling pm_runtime_get_sync()).

Since they are suspended, the genpd framework defers execution to the resume
path where errors are discarded, silently masking performance state failure=
s.

Should the initialization sequence be adjusted across all these drivers so
the devices are resumed before setting the performance state?

>  		if (ret < 0) {
>  			pm_runtime_put_noidle(pds[i]);

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260909105049.1317=
985-1-mukesh.ojha@oss.qualcomm.com?part=3D1
