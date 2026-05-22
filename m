Received: from mail-ed1-f50.google.com (mail-ed1-f50.google.com [209.85.208.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9829E4657C8
	for <devicetree@vger.kernel.org>; Fri, 22 May 2026 14:36:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.50
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779460572; cv=pass; b=pKtvoNlWGdg0bP7j/DFDMPE5MZPDZoyhZRBq8HExEydfyW4o0Z1TBogojWRbBS3+wBNVXe0Z/swnVve/K2wvVSDc4v7ww072XU/tScw1x2ul6fSZRch95QLkp2DAlGRUuSZ4q3z1yvfZcU0paxfNp+G2gkvTwmf4p10XllJGhFU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779460572; c=relaxed/simple;
	bh=j38wf+VC5DAzbntAhpsUFIyPbbdFLRrkd6Xq9bT3rT0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=h7ZI9KcchqeDGh8rDjDi62CuKwfk48PiDOyxzStsMFSPGY6UJwlC+4fN8kRtez6OhywwcuAO37x8+KSTTz0czz1wsuwMcR0tHWTeDzgvF+LuQsKe6oXYvdGlq+zv2XkJ7ZW21fvJS2bxm42ZwWNYuPfBoo1Xx83o3M/n835HWUg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Yp1Q2x57; arc=pass smtp.client-ip=209.85.208.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Yp1Q2x57"
Received: by mail-ed1-f50.google.com with SMTP id 4fb4d7f45d1cf-67c2d57a5ceso11719824a12.3
        for <devicetree@vger.kernel.org>; Fri, 22 May 2026 07:36:10 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1779460569; cv=none;
        d=google.com; s=arc-20240605;
        b=P9aDIBJStwkW9+gFOMyIgGzJbH4FbIwznqpP04Mh4N/ljj/Pb0Rv/uKU+yiEecW3Sy
         ZyIINdVVZU+jQd3kjqhVbGddf0hIi5uKaX7me9nH7fhRWiCZm7/NuAA5mHyz3UGMXuVI
         thMTrAW5tbRPAtUGprEQEWkUTFNp7j7rwOSWSMjOcGdn04GNV0/kyTVuEKGG1NpqWfa1
         BphEoxe+yWjRTQvA5La2XdGNbgno0n4+ElrB1jpya29TBIJvEBEUqgtyJkdHtTqogs7z
         Gcl4XPhg1cae4Ha/euXY20O6IVkpdPXHYgDwtzqqfrf5JCRBJ4hF+hHdqS5JcHbQ4vtP
         hv3g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=iUwMeqcEfoa+UhA6Poo9oYBXifJqH1s4dgYVK+G4bjs=;
        fh=EmOWqGyocn5ARXvfJc4N1VArToCkLZvEDCSy/wnKC9s=;
        b=LOFRDxlfYwo6s5Wx/XMELch+40AiYTd3guOlLCDXsKNFUjNwcY/n6DfFnVoTwODNPs
         FhS210Z95r3yvKJGg0RcLjHgot73ZJ7cESwXZHnZi/4Ss4VZra2Ni9501njOLvQa1ZiT
         wybsOpbNy/o/P4yOPbjxlXOZFZBJjM4yI1r8fSMEn6pbgaVNpZDgxudGluEbOeTTJZHA
         pjquQ0BOykQehEzjYkkj3jy8norBZhfGWUB9RugsJzrfQ26I4nBqfPjgo7A+rrynsOI8
         12DI3+r4d5GGNzhGTm3YKtNf1xSn+e7QsyGCexQxzaYYQdfmqFntD74UQp+6wOWAjQmd
         HSog==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1779460569; x=1780065369; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=iUwMeqcEfoa+UhA6Poo9oYBXifJqH1s4dgYVK+G4bjs=;
        b=Yp1Q2x575F+qcN39AxBPIVrbtOThhSkgntmRkk08lyB2vTFWp/HtGliSYxwKxGpd8q
         8hZa/72U3FbHKh8CVgTJC+3Yw3T165ceTzmdlQZllKBn212A31g+SgvIOhmIWF8pprft
         A1DvHc8bb4yAaMAyp5hLXT/zYP4bWcm4dOGiOiDYSA8oSIUKr7MgGkRdO/a2WFKx1om7
         EKgJjQxnnxu5mQbFTCUWnYad29hQ5JP8Y2FPer1EknCQ4Z66BPuXSxG0tkMH2qz0pn81
         O1drDXBxvg5fMpM0oHNtOKOl7dnsBNGOk23huuPlLUYZ+AfEa/wH1FtksICDvdp8WX6S
         Y2zQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779460569; x=1780065369;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=iUwMeqcEfoa+UhA6Poo9oYBXifJqH1s4dgYVK+G4bjs=;
        b=Z8nW1ZwrJoENMYaDjCMHL77tv62dU5aLubtToQTFPFxEb5H2h/Qzl7rKS8lK6Kh0vj
         aIouM2xBV98aUYJjM2bGp1DkfqrgwhuRe1ecygR1LQuz0FAaTXn1A4jT9zgJMbo6IbAU
         h5X8L8jv8KtjgF/LHg4TnmEwocrDzv9RAEdIAjrp3aHHKpVjCVQ2D95/K157FPsKctWK
         IatfWMrVkJvPCZPpG6t89SOi3OEPt9ijSJOE5zWgK/OGC2Z9lkxnV5Dpslxtr7C0jw+W
         D+mw0fq7JGrmBn81dDDar3WP+/Z7iXRyGrDU1gKUOJjAF0z/d6HF4jk7B29gIAaa/ISP
         Cmhw==
X-Forwarded-Encrypted: i=1; AFNElJ9+SLHcKNReAf3J3jhl2fcW7efZhe65N0ardMHZucgiyx0uJvtFKdgCvqrhHVV15j99rbZqTW11lPr3@vger.kernel.org
X-Gm-Message-State: AOJu0YyiQdASZEf8zcYFFDjLJr/qb2FNjK67TLch8DEpdKz5PxsN7RPF
	TWnbaRqyIMQASOfWTCIKtsegFEi8GvT368VlXNqYxfs3sMMIoA9OG2W5ocGqSiNJWPrh/ch35qK
	ZHHAuZN51FuRQx3bo9SAWeTtCLPNMxyc+16F3ir4iIg==
X-Gm-Gg: Acq92OEnVQ0Nrpf2HisMqSO0QONWnpaT7bSVKensWMcajBZGJAbH/VVLNGs923xezFh
	AQFWRpsG93235iUcXJKe2RRU2yZSS9+lHTamP7Ed54xiAHjjI5iTaXawkzHDMrhijjnb1dLco1U
	rroD9OEC8+PPfU+0UF9dxtvj/3IPcUw2874oerpy2yUwLWVC/maBZ6R7adwnFvYPuMy/x6K8CR1
	TAaoD2hPUxJFVRrldM3NCwQ0cxTjCwWglmUAFIuMoet2npftxeN+fI8Vq0s0XWwaEEcHUuNk0Jv
	PXQwL2Tg38Vso8A6mlc0+3eyaowbEIfACFz6ZNlw
X-Received: by 2002:a05:6402:4302:b0:678:edab:6f40 with SMTP id
 4fb4d7f45d1cf-6889c422bfemr2167605a12.4.1779460568984; Fri, 22 May 2026
 07:36:08 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260501143707.1591110-1-tanmay.shah@amd.com> <20260501143707.1591110-3-tanmay.shah@amd.com>
 <ag9FcXeIIiJWdld7@p14s> <cbd418a3-1585-4592-8e86-b0750e19ec0f@amd.com> <be63e9a0-e325-46eb-9c03-54dc22878ed6@amd.com>
In-Reply-To: <be63e9a0-e325-46eb-9c03-54dc22878ed6@amd.com>
From: Mathieu Poirier <mathieu.poirier@linaro.org>
Date: Fri, 22 May 2026 08:35:57 -0600
X-Gm-Features: AVHnY4LtwSS30HSBRhVWgPEV2L1wcvx433tVw1FA3kjt7ZBX0HcUlAqaB0u01-U
Message-ID: <CANLsYkwqx38oafrjbFmKMhQ7Nat8X3W1GSY76BjN=Q+mavAE5w@mail.gmail.com>
Subject: Re: [PATCH v2 2/2] remoteproc: xlnx: enable auto boot feature
To: tanmay.shah@amd.com
Cc: andersson@kernel.org, robh@kernel.org, krzk+dt@kernel.org, 
	conor+dt@kernel.org, michal.simek@amd.com, ben.levinsky@amd.com, 
	linux-remoteproc@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Thu, 21 May 2026 at 12:48, Shah, Tanmay <tanmays@amd.com> wrote:
>
>
>
> On 5/21/2026 1:38 PM, Shah, Tanmay wrote:
> > Hello,
> >
> > Thank you for the reviews, please find my comments below:
> >
> > On 5/21/2026 12:48 PM, Mathieu Poirier wrote:
> >> Good morning,
> >>
> >> I don't recal reviewing the first revision of this set.  Can you provide a link
> >> to it so that I can read the comments that were provided?
> >>
> >
> > Here it is:
> > https://lore.kernel.org/linux-remoteproc/20260422202558.2362971-1-tanmay.shah@amd.com/
> >
> > The device-tree bindings needed rework in v1, so I sent v2, before we
> > ever reviewed the driver part.
> >
> >
> >> On Fri, May 01, 2026 at 07:37:07AM -0700, Tanmay Shah wrote:
> >>> remoteproc framework has capability to start (or attach to) the remote
> >>
> >> The remoteproc framework...
> >>
> >
> > Ack.
> >
> >>> processor automatically if auto boot flag is set by the driver during
> >>> probe. If remote core is not started before the Linux boot, and linux is
> >>> expected to start the remote core then it uses "firmware-name" property
> >>> to load default firmware during auto boot.
> >>>
> >>> Signed-off-by: Tanmay Shah <tanmay.shah@amd.com>
> >>> ---
> >>>  drivers/remoteproc/xlnx_r5_remoteproc.c | 48 +++++++++++++++++--------
> >>>  1 file changed, 34 insertions(+), 14 deletions(-)
> >>>
> >>> diff --git a/drivers/remoteproc/xlnx_r5_remoteproc.c b/drivers/remoteproc/xlnx_r5_remoteproc.c
> >>> index 45a62cb98072..652030f9cea2 100644
> >>> --- a/drivers/remoteproc/xlnx_r5_remoteproc.c
> >>> +++ b/drivers/remoteproc/xlnx_r5_remoteproc.c
> >>> @@ -899,17 +899,18 @@ static const struct rproc_ops zynqmp_r5_rproc_ops = {
> >>>  };
> >>>
> >>>  /**
> >>> - * zynqmp_r5_add_rproc_core() - Add core data to framework.
> >>> - * Allocate and add struct rproc object for each r5f core
> >>> + * zynqmp_r5_alloc_rproc_core() - alloc rproc core data structure
> >>> + * Allocate struct rproc object for each r5f core
> >>>   * This is called for each individual r5f core
> >>>   *
> >>>   * @cdev: Device node of each r5 core
> >>>   *
> >>>   * Return: zynqmp_r5_core object for success else error code pointer
> >>>   */
> >>> -static struct zynqmp_r5_core *zynqmp_r5_add_rproc_core(struct device *cdev)
> >>> +static struct zynqmp_r5_core *zynqmp_r5_alloc_rproc_core(struct device *cdev)
> >>
> >> Why is there a need to change the function's name?
> >>
> >
> > Before, the function was actually adding the rproc core by calling
> > rproc_add() function, but now it only allocates the memory by calling
> > rproc_alloc(). For auto boot to work it's important to add rproc core
> > after all the other hw is initialized (such as mbox, tcm, sram,
> > power-domains etc). More details below [1].
> >
> >>>  {
> >>>     struct zynqmp_r5_core *r5_core;
> >>> +   const char *fw_name = NULL;
> >>>     struct rproc *r5_rproc;
> >>>     int ret;
> >>>
> >>> @@ -918,10 +919,15 @@ static struct zynqmp_r5_core *zynqmp_r5_add_rproc_core(struct device *cdev)
> >>>     if (ret)
> >>>             return ERR_PTR(ret);
> >>>
> >>> +   ret = rproc_of_parse_firmware(cdev, 0, &fw_name);
> >>> +   if (ret < 0 && ret != -EINVAL)
> >>> +           return ERR_PTR(dev_err_probe(cdev, ret,
> >>> +                                        "failed to parse firmware-name\n"));
> >>> +
> >>>     /* Allocate remoteproc instance */
> >>>     r5_rproc = rproc_alloc(cdev, dev_name(cdev),
> >>>                            &zynqmp_r5_rproc_ops,
> >>> -                          NULL, sizeof(struct zynqmp_r5_core));
> >>> +                          fw_name, sizeof(struct zynqmp_r5_core));
> >>>     if (!r5_rproc) {
> >>>             dev_err(cdev, "failed to allocate memory for rproc instance\n");
> >>>             return ERR_PTR(-ENOMEM);
> >>> @@ -932,6 +938,11 @@ static struct zynqmp_r5_core *zynqmp_r5_add_rproc_core(struct device *cdev)
> >>>     r5_rproc->recovery_disabled = true;
> >>>     r5_rproc->has_iommu = false;
> >>>     r5_rproc->auto_boot = false;
> >>> +
> >>> +   /* attempt to boot automatically if the firmware-name is provided */
> >>> +   if (fw_name)
> >>> +           r5_rproc->auto_boot = true;
> >>> +
> >>
> >> What happens when a firmware name needs to be provided in the DT but you don't
> >> want to automatically boot the remote processor?
> >>
> >
> > I think that use case is not needed. If the user/system-designer doesn't
> > want auto-boot, then having firmware-name in the device-tree serves no
> > purpose. User can always load the firmware via sysfs once kernel boots.
> >
> >>>     r5_core = r5_rproc->priv;
> >>>     r5_core->dev = cdev;
> >>>     r5_core->np = dev_of_node(cdev);
> >>> @@ -941,13 +952,6 @@ static struct zynqmp_r5_core *zynqmp_r5_add_rproc_core(struct device *cdev)
> >>>             goto free_rproc;
> >>>     }
> >>>
> >>> -   /* Add R5 remoteproc core */
> >>> -   ret = rproc_add(r5_rproc);
> >>> -   if (ret) {
> >>> -           dev_err(cdev, "failed to add r5 remoteproc\n");
> >>> -           goto free_rproc;
> >>> -   }
> >>> -
> >>
> >> I'm not sure why there is a need to move this to zynqmp_r5_cluster_init()?  Is
> >> it simply to make the error path easier to handle?  If so, please do that in a
> >> separate patch.
> >>
> >
> > [1] This was moved to make auto-boot work. The remote core can auto-boot
> > only after other hardware is initialized. The zynqmp_r5_core_init()
> > initializes sram, TCM and power-domains of the core. Also, mailbox is
> > requested before zynqmp_r5_core_init() as well. We can't auto-boot core
> > directly without all this. So, I had to move rproc_add() at the end of
> > the cluster init, and rename above function from
> > zynqmp_r5_add_rproc_core to zynqmp_r5_alloc_rproc_core.
> >
> > If you prefer, I will add above explanation in the commit text, or as
> > comment right before rproc_add().
> >
> >
> >
> >>>     r5_core->rproc = r5_rproc;
> >>>     return r5_core;
> >>>
> >>> @@ -1280,6 +1284,7 @@ static int zynqmp_r5_core_init(struct zynqmp_r5_cluster *cluster,
> >>>                     if (zynqmp_r5_get_rsc_table_va(r5_core))
> >>>                             dev_dbg(r5_core->dev, "rsc tbl not found\n");
> >>>                     r5_core->rproc->state = RPROC_DETACHED;
> >>> +                   r5_core->rproc->auto_boot = true;
> >>
> >> I thought this was done in zynqmp_r5_add_rproc_core() - what am I missing?
> >>
> >
> > That function is now zynqmp_r5_alloc_core() as mentioned above. Also,
> > until now, auto_boot was set to 'false' only to show that it is
> > disabled. It is actually used and enabled now.
> >
>
> "I thought this was done in zynqmp_r5_add_rproc_core() - what am I missing?"
>
> I probably misunderstood this comment. Here is the correct explanation:
>
> The auto_boot setting in the zynqmp_r5_alloc_core() is done if the
> 'firmware-name' property is present in the device-tree.
>
> Here it is done, if the remote core is already running. This is to
> support attach-detach use case.
>
> So, auto_boot is possible in two cases: 1) If firmware-name property is
> available (Linux boots the remote), 2) If firmware is already loaded and
> remote was started by the boot loader. (Linux attaches to the running
> remote).
>
> This is the second use case.
>

Thanks for the clarifications, I'll have another look at this set.

> Thanks,
> Tanmay
>
> >> Thanks,
> >> Mathieu
> >>
> >>>             }
> >>>     }
> >>>
> >>> @@ -1304,7 +1309,7 @@ static int zynqmp_r5_cluster_init(struct zynqmp_r5_cluster *cluster)
> >>>     enum rpu_oper_mode fw_reg_val;
> >>>     struct device **child_devs;
> >>>     enum rpu_tcm_comb tcm_mode;
> >>> -   int core_count, ret, i;
> >>> +   int core_count, ret, i, j;
> >>>     struct mbox_info *ipi;
> >>>
> >>>     ret = of_property_read_u32(dev_node, "xlnx,cluster-mode", &cluster_mode);
> >>> @@ -1390,7 +1395,7 @@ static int zynqmp_r5_cluster_init(struct zynqmp_r5_cluster *cluster)
> >>>             child_devs[i] = &child_pdev->dev;
> >>>
> >>>             /* create and add remoteproc instance of type struct rproc */
> >>> -           r5_cores[i] = zynqmp_r5_add_rproc_core(&child_pdev->dev);
> >>> +           r5_cores[i] = zynqmp_r5_alloc_rproc_core(&child_pdev->dev);
> >>>             if (IS_ERR(r5_cores[i])) {
> >>>                     ret = PTR_ERR(r5_cores[i]);
> >>>                     r5_cores[i] = NULL;
> >>> @@ -1435,16 +1440,31 @@ static int zynqmp_r5_cluster_init(struct zynqmp_r5_cluster *cluster)
> >>>             goto release_r5_cores;
> >>>     }
> >>>
> >>> +   for (j = 0; j < cluster->core_count; j++) {
> >>> +           /* Add R5 remoteproc core */
> >>> +           ret = rproc_add(r5_cores[j]->rproc);
> >>> +           if (ret) {
> >>> +                   dev_err_probe(r5_cores[j]->dev, ret,
> >>> +                                 "failed to add remoteproc\n");
> >>> +                   goto delete_r5_cores;
> >>> +           }
> >>> +   }
> >>> +
> >>>     kfree(child_devs);
> >>>     return 0;
> >>>
> >>> +delete_r5_cores:
> >>> +   i = core_count - 1;
> >>> +   /* delete previous added rproc */
> >>> +   while (--j >= 0)
> >>> +           rproc_del(r5_cores[j]->rproc);
> >>> +
> >>>  release_r5_cores:
> >>>     while (i >= 0) {
> >>>             put_device(child_devs[i]);
> >>>             if (r5_cores[i]) {
> >>>                     zynqmp_r5_free_mbox(r5_cores[i]->ipi);
> >>>                     of_reserved_mem_device_release(r5_cores[i]->dev);
> >>> -                   rproc_del(r5_cores[i]->rproc);
> >>>                     rproc_free(r5_cores[i]->rproc);
> >>>             }
> >>>             i--;
> >>> --
> >>> 2.34.1
> >>>
> >
>
