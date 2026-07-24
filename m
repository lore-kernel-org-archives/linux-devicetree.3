Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E010534D3A9
	for <devicetree@vger.kernel.org>; Fri, 24 Jul 2026 07:24:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784877901; cv=none; b=WUsuQwo4yBk1mpEOsgvhr2Qqtr2A8kRKZOUA4HsH8THJbGeuFZjU0d4wRCgbdOp9qbbh08/v+SVPSt2dJfpCfha4lKMv/bKZEJem1ZYXYA6H63bmnmOpzDe8A22cMz+Oi74K/rnLRWXGhu1kLwZQKoPgLJ2t7E6wG3nwjpzMSsc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784877901; c=relaxed/simple;
	bh=zdSd+aatIjxfvWmnDR5ofnxdz2j9GHhs6z1HLaTeDeo=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=o9XgDE2Mk7FLNVY67bGf9EDcNBSvSQLo6XM72tbGx19shohxD8aZRe3xOaWjFOVS9xFL6o+i8jBim//C32jcrbdV++Lije53nA5OQezvRLiukN3YzdIIQdOMqgi7PRh28HFWY58jcvrqs34tE2B71m5CUehV1RrKaRabNjMvm+k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=htS+lPLL; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="htS+lPLL"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 59CC71F000E9;
	Fri, 24 Jul 2026 07:24:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784877899;
	bh=hWRNBAZk+rd0mK/rzY9Ob7cqzY/bS1Ur8lYgvxu3bwc=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=htS+lPLLgfebDji/FaU0dzhtXPu3QCvsuYB4QitDUAgqp77hINIkoCst9YwL1etgJ
	 +rBoq1h8TLFMRo2sGQTfiwvdwAbtLTFEVsFWqPd7U5uhhrb30KNrOPGt+dH919M+E3
	 nxq9oZ87yslyIQrOMrk8+vwUqEfhMexJMTBXh0Q/3cwNXRieg9+kj6LrQA8VxqYznl
	 2Qs28O+MJDRV+rpLCmAtN8+CFPlkyVUH8EZ+tUPcfpAHN6baF2BoV0YwQmDIe8cIPL
	 ggompXB9EwNSCbC9lgFJQSw2FFeqPI9jzvUQa2RI1s1Agoq6ZDT4e7GYSx9LXwiOvr
	 xvm+IqI9j2bZA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v6 2/6] firmware: meson: sm: video firmware loading via
 secure monitor
Reply-To: sashiko-reviews@lists.linux.dev
To: "Zhentao Guo" <zhentao.guo@amlogic.com>
Cc: linux-amlogic@lists.infradead.org, devicetree@vger.kernel.org, neil.armstrong@linaro.org, conor+dt@kernel.org, media-ci@linuxtv.org, robh@kernel.org
In-Reply-To: <20260724-b4-s4-vdec-upstream-v6-2-6072a7ee7428@amlogic.com>
References: <20260724-b4-s4-vdec-upstream-v6-0-6072a7ee7428@amlogic.com>
 <20260724-b4-s4-vdec-upstream-v6-2-6072a7ee7428@amlogic.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 24 Jul 2026 07:24:58 +0000
Message-Id: <20260724072459.59CC71F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 5 potential issue(=
s) to consider:

New issues:
- [Low] The patch series splits the addition of a new SMC command across tw=
o commits in the wrong order, breaking the build and git bisect.

Pre-existing issues:
- [High] meson_sm_call always returns 0 on success of command dispatch, mas=
king the actual SMC return code and leading to ignored firmware errors.
- [High] Missing locking in meson_sm_call_write and meson_sm_call_read allo=
ws concurrent threads to corrupt shared memory.
- [High] meson_sm_map_shmem fails to handle SMCCC error codes, passing inva=
lid physical addresses like 0xFFFFFFFF to ioremap_cache.
- [High] meson_sm_get returns a pointer to devres-managed memory without ho=
lding a device reference, causing a UAF if the driver is unbound.
--

--- Patch [2]: [PATCH v6 2/6] firmware: meson: sm: video firmware loading v=
ia secure monitor ---
commit 712790e34d92d775f45e1b4ef265054cbaf878df
Author: Zhentao Guo <zhentao.guo@amlogic.com>

firmware: meson: sm: video firmware loading via secure monitor

Add SM_LOAD_VIDEO_FW to the secure monitor command enum to allow decoder
drivers to load firmware through the meson_sm interface.

> diff --git a/include/linux/firmware/meson/meson_sm.h b/include/linux/firm=
ware/meson/meson_sm.h
> index 3ebc2bd9a9760..3b90b49d05529 100644
> --- a/include/linux/firmware/meson/meson_sm.h
> +++ b/include/linux/firmware/meson/meson_sm.h
> @@ -15,6 +15,7 @@ enum {
>  	SM_THERMAL_CALIB_READ,
>  	SM_A1_PWRC_SET,
>  	SM_A1_PWRC_GET,
> +	SM_LOAD_VIDEO_FW,

[Severity: Low]
Does this patch fix a build break introduced earlier in the series?

If SM_LOAD_VIDEO_FW was used in drivers/firmware/meson/meson_sm.c in a prior
commit before being declared here in the enum, it would break git bisect.

>  };
> =20
>  struct meson_sm_firmware;

[Severity: High]
This isn't a bug introduced by this patch, but does meson_sm_call() mask SMC
errors?

drivers/firmware/meson/meson_sm.c:meson_sm_call() {
    ...
    lret =3D __meson_sm_call(cmd, arg0, arg1, arg2, arg3, arg4);

    if (ret)
        *ret =3D lret;

    return 0;
}

If a caller passes NULL for ret, the function always returns 0. Should it
propagate or validate lret when ret is NULL?

[Severity: High]
This is a pre-existing issue, but does the shared memory access lack
synchronization?

drivers/firmware/meson/meson_sm.c:meson_sm_call_write() {
    ...
    memcpy(fw->sm_shmem_in_base, buffer, size);

    if (meson_sm_call(fw, cmd_index, &written, arg0, arg1, ...) < 0)
    ...
}

And similarly in meson_sm_call_read():

drivers/firmware/meson/meson_sm.c:meson_sm_call_read() {
    ...
    if (meson_sm_call(fw, cmd_index, &size, arg0, arg1, ...) < 0)
        return -EINVAL;
    ...
    if (buffer)
        memcpy(buffer, fw->sm_shmem_out_base, size);
    ...
}

Can concurrent threads race here, overwriting shared memory before another
thread finishes reading its response?

[Severity: High]
This is a pre-existing issue, but could this fail to handle SMCCC error cod=
es
correctly?

drivers/firmware/meson/meson_sm.c:meson_sm_map_shmem() {
    u32 sm_phy_base;

    sm_phy_base =3D __meson_sm_call(cmd_shmem, 0, 0, 0, 0, 0);
    if (!sm_phy_base)
        return NULL;

    return ioremap_cache(sm_phy_base, size);
}

If the secure monitor returns a negative error code, sm_phy_base (u32) beco=
mes
0xFFFFFFFF. Will ioremap_cache() attempt to map this invalid physical addre=
ss?

[Severity: High]
This isn't a bug introduced by this patch, but can this result in a dangling
pointer when returning devres-managed memory?

drivers/firmware/meson/meson_sm.c:meson_sm_get() {
    struct platform_device *pdev =3D of_find_device_by_node(sm_node);
    struct meson_sm_firmware *fw;
    ...
    fw =3D platform_get_drvdata(pdev);

    put_device(&pdev->dev);

    return fw;
}

Since fw is allocated with devm_kzalloc() bound to the meson-sm device, if =
the
driver is unbound via sysfs, devres frees the memory. Do consumer drivers
retain a dangling pointer to fw after put_device() drops the reference?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260724-b4-s4-vdec=
-upstream-v6-0-6072a7ee7428@amlogic.com?part=3D2
