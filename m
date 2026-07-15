Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 951D0396B9A
	for <devicetree@vger.kernel.org>; Wed, 15 Jul 2026 14:52:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784127143; cv=none; b=PtfJoTsvzc6dBRcDxXtBs454yzFq4y8SQHlCgrbi7I5THiJ3gDgBg3Zq5DskdZIn5Ywm+0E/SBfG6mchuWB8A3gCj1UYyZuD+oY2723n1DjRn2NWxNitEEf3TRPtFkSvbKRKtDz5m2tiFDkheWgBbqGw1TVuSh8Z/ZbLqr+GRow=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784127143; c=relaxed/simple;
	bh=XGl2ZzyoSwjeNrGnz5UPU3FYZ+sxbg+VGcORvCZujjM=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=krSmQMn7UBFchMOf3EYBP7tAg7Q8PdnhPYJLcqNU0muiEpOdCXuarPL35+iFKXhbSwq/oOFlD6A3TbH0AagxtPu/UihujXWp4AoK/9loKLP1dctaL7Wx8h7qIhFjz27eZoZbe+amyWhkoIi5tvjTB/rCX1kYMH5E6sLi9KZIZrQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=CFPvjhZ1; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="CFPvjhZ1"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F052F1F00A3A;
	Wed, 15 Jul 2026 14:52:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784127142;
	bh=qmzxY0k0tmuVebPSdSxDkJf5y0+0kkCq/bcyizmpa1o=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=CFPvjhZ1uPuqMV6x0VmqvbS80eFn08kycUrVrEIiG2yEmkpNduxUH7LlwA5ZJY5SE
	 xlmniAfi0mWsnsFX5QsA+kAafA15YRYAKUN5P0qexZBq1NFt4w+HO+fMaHIUpd/3Dy
	 fO3NZeaEsY9JiLzegv3USTVd50yEK69q8N8z14P89GfqJL6914EOubDAWQXN0bhOUE
	 881MVtng22+HNkQaHr9gCZy6r2e+5aNCaIiUn3Z4sQo9+9zbAASgCZLLDZSX3GPdZ6
	 mPJcPEY7lV0p+HRYw5w3LJE4ZzTt9Q1fE4UFVYJGkdWbp/Ho3sML9HaEIyj+DmM2aQ
	 +VLqBNeCxb93g==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v9 11/14] media: iris: Add hooks for pixel and non-pixel
 context banks
Reply-To: sashiko-reviews@lists.linux.dev
To: "Vishnu Reddy" <busanna.reddy@oss.qualcomm.com>
Cc: devicetree@vger.kernel.org, conor+dt@kernel.org, robh@kernel.org
In-Reply-To: <20260715-glymur-v9-11-8cf2cbe12a07@oss.qualcomm.com>
References: <20260715-glymur-v9-0-8cf2cbe12a07@oss.qualcomm.com>
 <20260715-glymur-v9-11-8cf2cbe12a07@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 15 Jul 2026 14:52:21 +0000
Message-Id: <20260715145221.F052F1F00A3A@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:

Pre-existing issues:
- [High] V4L2 file release callback `iris_close()` accesses the `core` stru=
cture after it has been freed by `devres` during driver unbind.
--

--- Patch [11]: [PATCH v9 11/14] media: iris: Add hooks for pixel and non-p=
ixel context banks ---
commit 8d8f4d5f3484b996ec8fcb46a6a17cb0805e77fa
Author: Vikash Garodia <vikash.garodia@oss.qualcomm.com>

media: iris: Add hooks for pixel and non-pixel context banks

Iris platforms use separate context-bank devices for the pixel, non-pixel
firmware domains. Add platform hooks to create and destroy those
subdevices, and wire them up for the affected platforms.

> diff --git a/drivers/media/platform/qcom/iris/iris_vpu3x.c b/drivers/medi=
a/platform/qcom/iris/iris_vpu3x.c
> index 97563bf899392..7d9d67baf22a8 100644
> --- a/drivers/media/platform/qcom/iris/iris_vpu3x.c
> +++ b/drivers/media/platform/qcom/iris/iris_vpu3x.c

[ ... ]

[Severity: High]
This is a pre-existing issue, but while reviewing the driver's lifecycle
management I noticed a potential use-after-free in the V4L2 file release
flow.

If a userspace process opens the V4L2 device and the driver is subsequently
unbound (e.g., via sysfs), the driver core automatically frees all devres
allocations, including the iris_core structure.

When the userspace process later closes the file descriptor, iris_close()
is called. Can this trigger a use-after-free when it accesses the freed
core structure?

drivers/media/platform/qcom/iris/iris_vidc.c:iris_close() {
        ...
        iris_check_num_queued_internal_buffers(inst, V4L2_BUF_TYPE_VIDEO_CA=
PTURE_MPLANE);
        iris_remove_session(inst);
        ...
}

Which then takes a mutex on the already freed core structure:

drivers/media/platform/qcom/iris/iris_vidc.c:iris_remove_session() {
        struct iris_core *core =3D inst->core;

        mutex_lock(&core->lock);
        ...
}

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260715-glymur-v9-=
0-8cf2cbe12a07@oss.qualcomm.com?part=3D11
