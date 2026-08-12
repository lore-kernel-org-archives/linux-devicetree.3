Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 501F2345ECD
	for <devicetree@vger.kernel.org>; Wed, 12 Aug 2026 02:51:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786503065; cv=none; b=VNWn1PDJGsnzvADYa7mOhKQv9K4TgnENDFUtrPt2F+gHG70YALgJ4AAL8C4bxOcY1OFuTsEdrwQIGO+h2V20U+QiE6qwQWfkJZ+Y4CwZKNRiQxslNfpDCbjVCKQQavQAQXjmu4pmu4DTlKAeMzNYWlaiBgiUVcSOkHKg7zjXlv4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786503065; c=relaxed/simple;
	bh=VACfmkcB6RYAEy5FE83AbxH0pLcU9h9lbp3bWQCZgxE=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=UvB8OOtgygxHjRP2IlWlqC6AXzW4c0JCKwmkLS/TEzVovWL2CAl9vxnB7LmFDVBDjCzg5b7EbZZh8XC4nogF01hk0ar4C6XRp+HQ31LNNSD3y5e07RQCAq1UxPW3Vmx+4lI3k9tckqG+1845iY6JcD9QaNmcwiBF/BdKS6j8IMk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=D8te2vFB; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="D8te2vFB"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C652B1F000E9;
	Wed, 12 Aug 2026 02:51:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786503064;
	bh=zIwp/0ofU7TBSBShrkE7OOToS3PA92bLNKlKnstbmgs=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=D8te2vFBoYGDi0WUJr6bEaatLEXNIRWnZHe/GZKc4b9/xlpUUgkQ8nzded4hbS6+4
	 hZSIFZfGo0WUjW+m8VxUYV2VXNUAsOZvqp0n2qucj/MfTUoOU5Q9aK3roDmFj8MbF/
	 KLwEOc6uBNyaz3ywLvKo/j8NCOo5Rv43/n8Eg4EsVlGlwitFLr9cr8OzefioTUeMcf
	 RKgPohNx2EO5/zrXf80qushlJ5/6BJqPfhAorm9Gy1Y9qBn84olbKf9vz4gmGLwWqw
	 y3iTgNTThCsoI3NmS290MH4CwZBzXhCVIN8bLViY/OiebRuIOLx2rQonfjXR16nm/1
	 uKr/WMmLcSLeg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v7 2/6] firmware: meson: sm: Add video firmware loading
 SMC call
Reply-To: sashiko-reviews@lists.linux.dev
To: "Zhentao Guo" <zhentao.guo@amlogic.com>
Cc: linux-amlogic@lists.infradead.org, conor+dt@kernel.org, robh@kernel.org, devicetree@vger.kernel.org, media-ci@linuxtv.org, neil.armstrong@linaro.org
In-Reply-To: <20260812-b4-s4-vdec-upstream-v7-2-3fae085861bd@amlogic.com>
References: <20260812-b4-s4-vdec-upstream-v7-0-3fae085861bd@amlogic.com>
 <20260812-b4-s4-vdec-upstream-v7-2-3fae085861bd@amlogic.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 12 Aug 2026 02:51:03 +0000
Message-Id: <20260812025103.C652B1F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:

Pre-existing issues:
- [High] Missing synchronization in `meson_sm_call_read` and `meson_sm_call=
_write` allows concurrent SMC calls to corrupt shared memory buffers.
--

--- Patch [2]: [PATCH v7 2/6] firmware: meson: sm: Add video firmware loadi=
ng SMC call ---
commit df496e889046fc128eabc52108d2f27967c682ad
Author: Zhentao Guo <zhentao.guo@amlogic.com>

firmware: meson: sm: Add video firmware loading SMC call

This commit adds the SM_LOAD_VIDEO_FW command to the command table for
loading video firmware.

> diff --git a/drivers/firmware/meson/meson_sm.c b/drivers/firmware/meson/m=
eson_sm.c
> index ab9751a59b552..887caa5c625db 100644
> --- a/drivers/firmware/meson/meson_sm.c
> +++ b/drivers/firmware/meson/meson_sm.c
> @@ -48,6 +48,7 @@ static const struct meson_sm_chip gxbb_chip =3D {
>  		CMD(SM_THERMAL_CALIB_READ,	0x82000047),
>  		CMD(SM_A1_PWRC_SET,		0x82000093),
>  		CMD(SM_A1_PWRC_GET,		0x82000095),
> +		CMD(SM_LOAD_VIDEO_FW,		0xb200000f),

[Severity: High]
This is a pre-existing issue, but does adding new firmware loading commands
increase the risk of concurrent shared memory corruption?

Looking at how meson_sm_call_read() and meson_sm_call_write() use the shared
buffers:

drivers/firmware/meson/meson_sm.c:meson_sm_call_read() {
    ...
    if (meson_sm_call(fw, cmd_index, &size, arg0, arg1, arg2, arg3, arg4) <=
 0)
        return -EINVAL;
    ...
    if (buffer)
        memcpy(buffer, fw->sm_shmem_out_base, size);
    ...
}

and

drivers/firmware/meson/meson_sm.c:meson_sm_call_write() {
    ...
    memcpy(fw->sm_shmem_in_base, buffer, size);

    if (meson_sm_call(fw, cmd_index, &written, arg0, arg1, arg2, arg3, arg4=
) < 0)
        return -EINVAL;
    ...
}

Since these buffers (sm_shmem_out_base and sm_shmem_in_base) are shared
across the system, if two threads call into this API concurrently (for
example, unprivileged userspace reading the serial sysfs attribute while
another process reads efuse via the nvmem framework or loads video
firmware), can they overwrite each other's data in the shared memory region
before the memcpy completes?

Is there a locking mechanism protecting these SMC calls and shared buffers
that I am missing, or do we need to add a mutex to serialize access to
meson_sm_call_read() and meson_sm_call_write()?

>  		{ /* sentinel */ },
>  	},
>  };

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260812-b4-s4-vdec=
-upstream-v7-0-3fae085861bd@amlogic.com?part=3D2
