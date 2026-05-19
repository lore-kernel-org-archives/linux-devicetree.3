Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0C09A3438BA
	for <devicetree@vger.kernel.org>; Tue, 19 May 2026 18:04:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779213890; cv=none; b=en/9ff9hG8UPcn5hbliLdNY2s+hJjyKwTLae6tG1fUdKh0neDQ2GRK8hZFDsFYS54ln94IT/2sPdguwn+vCGRCELWtcatEFxS4rhc0w5o/s0dpu+oYP0jlDJDWZIpi5iT8iZP61H1Z+MLxLNUK/NMyRXsZE/r1FzjBysArHEdu4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779213890; c=relaxed/simple;
	bh=FSY+PfV5twhboSm6YXQOc0nEVBCky6N8MM8B41wOvUU=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=dPotySDjrm+gjhgRztMGO3mNBSXBtmfKYeNwJMPShLr1vPUb580wbZf3gfJM0vwrMUBkES8ey5GYxlvgHIj55boJR+R3c5CTchGF+tyGVFh9Dty9zG2qYllrumPmKWLo+PQiijvM/lnSGJcwlx0eagdX0pKrzrenQBGq6K4TCqc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=uYoHC/jO; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="uYoHC/jO"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 74A22C2BCB3;
	Tue, 19 May 2026 18:04:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1779213889;
	bh=FSY+PfV5twhboSm6YXQOc0nEVBCky6N8MM8B41wOvUU=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date:From;
	b=uYoHC/jOqEPv6tzajdqi1VMyO9QP/702qXor7yqqVW3AkjIc9IV66F25qfWzGkMjN
	 zaQ4LowZXX2XB414ios+zvFC949l34VEHPHi+55XaENy9UBX4BgMR9gHOmSHmv8M41
	 x9WxuUFvAYQkdLMdCaYqOpa5l3c2LUt0EE1MtNozSw0Z8OHqbuUH1UzYHSNqKNz1V0
	 dbHxdEwmNJN1twb47kbWob6XyFjkEPxWi9yqgjvNVBd0GvMW3t5xLnQ5hc+0m3dHQE
	 rZ8Rav0BUrTuGr6Q9BwwW9vqR3fTKZ72UyXdeR12ZjnBmBRobUOaS+bBanJSvuhHGI
	 OwgidcHSxr9kg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 3/4] firmware: qcom: scm: Add minidump SRAM support
Reply-To: sashiko-reviews@lists.linux.dev
To: "Mukesh Ojha" <mukesh.ojha@oss.qualcomm.com>
Cc: conor+dt@kernel.org, devicetree@vger.kernel.org, robh@kernel.org
In-Reply-To: <20260519171442.1582987-4-mukesh.ojha@oss.qualcomm.com>
References: <20260519171442.1582987-4-mukesh.ojha@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 19 May 2026 18:04:48 +0000
Message-Id: <20260519180449.74A22C2BCB3@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Medium] The global `__scm` pointer is read concurrently in `set_minidump=
_dest()` without the required `smp_load_acquire()` or `READ_ONCE()` barrier=
, creating a data race.
--

commit 46d7aebbb8abe9c9e0e6c6cfdb3495908a439bbd
Author: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>

firmware: qcom: scm: Add minidump SRAM support

This commit adds support for writing minidump destination values to
always-on SRAM. It exposes a module parameter to let users select the
destination, which updates the SRAM immediately if minidump mode is active.

> diff --git a/drivers/firmware/qcom/qcom_scm.c b/drivers/firmware/qcom/qco=
m_scm.c
> --- a/drivers/firmware/qcom/qcom_scm.c
> +++ b/drivers/firmware/qcom/qcom_scm.c
[ ... ]
> @@ -2733,6 +2785,40 @@ static const struct kernel_param_ops download_mode=
_param_ops =3D {
[ ... ]
> +static int set_minidump_dest(const char *val, const struct kernel_param =
*kp)
> +{
> +	int i;
> +
> +	i =3D sysfs_match_string(minidump_dest_name, val);
> +	if (i < 0)
> +		return -EINVAL;
> +
> +	minidump_dest =3D minidump_dest_val[i];
> +	if (__scm && __scm->minidump_sram && (download_mode & QCOM_DLOAD_MINIDU=
MP))

[Severity: Medium]
Could this plain read of __scm result in a data race?

In qcom_scm_probe(), the global __scm pointer is published using
smp_store_release(&__scm, scm). Since module parameters are exposed in
sysfs early, this setter might be executed concurrently while the probe
function is running.

Without a matching smp_load_acquire() or READ_ONCE(), is it possible for
the compiler or CPU to reorder the memory accesses? This might result in
observing a non-NULL __scm but an uninitialized __scm->minidump_sram value,
which could then lead to an arbitrary memory write via writel_relaxed().

Would it be safer to safely acquire the pointer first, for example using:
struct qcom_scm *scm =3D smp_load_acquire(&__scm);

> +		writel_relaxed(minidump_dest, __scm->minidump_sram);
> +
> +	return 0;
> +}

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260519171442.1582=
987-1-mukesh.ojha@oss.qualcomm.com?part=3D3
