Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0C0BC3DA7E2
	for <devicetree@vger.kernel.org>; Tue, 19 May 2026 07:33:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779176032; cv=none; b=ifPImUUCqnVg2izSXi69FRsgw/eN2sUAsJPS9nyxl0Rzfpn5Pnu3sLwVyXiMzH5Rx/dQoKlOWykkAp2ELHyTZc9/0agP5S5xO0IDrL1EM69o8jSWcjBoZ66288SZDP6rh/cS4RAy36CZa2sxQCa7Kjol5HxaUtcbXIl2x+lhQMQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779176032; c=relaxed/simple;
	bh=6UEHMWlz751md/NbEJK8BcBHSPvQj0S7y3XIBwrqBxk=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=VMHlTnzkRjVcUMvXTCgPBWCWtid0aElFZF9A7LWwn8iS6J6Bgl0XL3F0Fs4RVweM2nq5kZ7OVu+SQ1oc6QZ5ti72Xq1SoFD6P6YRKGHNqJoi7ZINPGrvjf383TH5YCpJ13IZAqID0qmHbNNKAdFQKdhyYxPUaHqrH6TM4NRoyUI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=I3dTBjay; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="I3dTBjay"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AF471C2BCB3;
	Tue, 19 May 2026 07:33:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1779176031;
	bh=6UEHMWlz751md/NbEJK8BcBHSPvQj0S7y3XIBwrqBxk=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date:From;
	b=I3dTBjaySdKVCPvW2AJbkINC3yWkvASSmZGwPckCAuRBTy9sUFdZXBRkN1QCnrMC/
	 HRwzT3+BeimHJOGQmAxLg0/rPKivpk/nZdsmT03YvHOkH/QEvhVaYsyqo0E5DpOyyO
	 3N6IZR5uCtbz5HJyb+X70OJpvUmyjjeflZNLYG0VdfmIENtcREHG9qL5LmEmGWvir6
	 yd+zYc79OkjIGl8zDv7yv6j2dK5St62Ls/8t3ow48gEtJ5aJM5hPxmqB6yzch0ec2x
	 8AD0/NjWVi+Mo+4uQc+IuT1IGGzC/8NfLMPK5vnR1UXYfY8JwLvpXpPtfFsR2G2r6L
	 dszgFywar64Gg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v6 06/16] remoteproc: qcom_q6v5_mss: Switch to generic
 PAS TZ APIs
Reply-To: sashiko-reviews@lists.linux.dev
To: "Sumit Garg" <sumit.garg@kernel.org>
Cc: devicetree@vger.kernel.org, conor+dt@kernel.org, robh@kernel.org
In-Reply-To: <20260518072856.22790-7-sumit.garg@kernel.org>
References: <20260518072856.22790-7-sumit.garg@kernel.org>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 19 May 2026 07:33:51 +0000
Message-Id: <20260519073351.AF471C2BCB3@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 3 potential issue(=
s) to consider:
- [High] Incorrect dependency check replacement leads to potential NULL poi=
nter dereference
- [High] Missing probe deferral for PAS availability causes runtime firmwar=
e load failures
- [High] The modified PAS memory setup feature is dead code due to missing =
initialization
--

commit f2a63e3caa15c50ea25aa5e07776a62f41d75add
Author: Sumit Garg <sumit.garg@oss.qualcomm.com>

remoteproc: qcom_q6v5_mss: Switch to generic PAS TZ APIs

This commit switches the qcom_q6v5_mss client driver over to the generic PAS
TZ APIs to support multiple backends like QTEE based SCM and OP-TEE.

> diff --git a/drivers/remoteproc/qcom_q6v5_mss.c b/drivers/remoteproc/qcom=
_q6v5_mss.c
> index ae78f5c7c1b69..96888007faa88 100644
> --- a/drivers/remoteproc/qcom_q6v5_mss.c
> +++ b/drivers/remoteproc/qcom_q6v5_mss.c
[ ... ]
> @@ -1480,7 +1481,7 @@ static int q6v5_mpss_load(struct q6v5 *qproc)
>  	}
> =20
>  	if (qproc->need_pas_mem_setup) {
> -		ret =3D qcom_scm_pas_mem_setup(MPSS_PAS_ID, qproc->mpss_phys, qproc->m=
pss_size);
> +		ret =3D qcom_pas_mem_setup(MPSS_PAS_ID, qproc->mpss_phys, qproc->mpss_=
size);

While this isn't a regression from this commit, is qproc->need_pas_mem_setup
ever initialized from desc in probe?

Looking at q6v5_probe(), several flags are copied from the match data to the
device instance:

    qproc->need_mem_protection =3D desc->need_mem_protection;
    qproc->has_mba_logs =3D desc->has_mba_logs;

Since qproc is zero-initialized by devm_rproc_alloc(), does the missing
copy of need_pas_mem_setup leave the flag permanently false and make
this modified qcom_pas_mem_setup() block unreachable?

[ ... ]
> @@ -2077,7 +2078,7 @@ static int q6v5_probe(struct platform_device *pdev)
>  	if (!desc)
>  		return -EINVAL;
> =20
> -	if (desc->need_mem_protection && !qcom_scm_is_available())
> +	if (desc->need_mem_protection && !qcom_pas_is_available())

Does replacing this probe deferral check cause issues if the generic PAS
backend is available (like OP-TEE) but SCM is not initialized?

The need_mem_protection flag dictates whether q6v5_xfer_mem_ownership() is
called. That function unconditionally relies on qcom_scm_assign_mem() which
directly accesses the SCM backend. If qcom_pas_is_available() allows probe
to succeed without SCM, could this result in a NULL pointer dereference
when qcom_scm_assign_mem() accesses the backend?

Additionally, what happens for platforms where desc->need_mem_protection is
false, but desc->need_pas_mem_setup is true?

It appears probe will skip checking if PAS is available and register the
remoteproc immediately. Later during firmware load, wouldn't
qcom_pas_mem_setup() fail with -ENODEV if the PAS backend has not yet probe=
d?

Should probe also defer when desc->need_pas_mem_setup is true and PAS is
not available?

>  		return -EPROBE_DEFER;
> =20
>  	mba_image =3D desc->hexagon_mba_image;

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260518072856.2279=
0-1-sumit.garg@kernel.org?part=3D6
