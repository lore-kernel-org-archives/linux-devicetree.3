Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.222.54
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794502987;
	b=XmXTy9FMj0BFI099P610XAsvv6UPjC8DptAoPKh5h25o1h6EWPobCWOjbBT000CoGNMT
	 eeKSSq5SUMxRKcosXQmLxdjYdDCdeUr8QY/bQqMGtUGWf6KHwKdGCoxMWQjtEmOIiRgcw
	 cTo8N+6hMV6hRO/Y5FJ3IpA18uL3FBTkugkyqDo+MRBWbyiHe8qIfIhdnCk/9BJsH8tFK
	 HhShX3gxuBlxhakToesIMUL8qjGnKC2WQVI6pFwaqGv8OCWPFw1PxPLbmDkyVX76fLPu+
	 lYmU+Pois/YOgrn6z/IscQtxllg39bmTbwpMH9lAZ2Y9y2lxse8+xKRYWpRrpkKRRtg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794502987;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Gm-Message-State:
	 X-Gm-Gg:X-Received:Received:Received:X-Received:MIME-Version:
	 References:In-Reply-To:From:Date:X-Gmail-Original-Message-ID:
	 X-Gm-Features:Message-ID:Subject:To:Cc:Content-Type;
	bh=3W1A4BQMOpN9nFxHb2rXE8WHciL/muN+wSYPGT+qRXs=;
	b=PBmVsivLIcMZXrj08n2WriHuZvp8M5BgGT3OUH7QyztjdTCmfflX2QPygttrxqfCe9MB
	 0GNG4sq3d1Yc+6P+zSeZhk5PTvLif9VMcreeeQTeP38U9trDwcoZtUEsW2A474BloZP+b
	 lo9zLBypIw8c6IYqv+a4T61pKjQVMltKXwpDvdNu847Jt09RQPTp9lodH0n50IK29X/uz
	 yN4mjHVHgAQ8iRRctp50IUhMKJ9GnEpDKU1H6F0Z/3nNecmrUq3chCOueWnOFbusUiRJz
	 1oY9BeVEVrVsWdS4qEn6wRPfz45uln5g43rhoiUL60a3nGuVXyVBIk4j4tctYi/Jecg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=linux-m68k.org;
	spf=pass smtp.mailfrom=gmail.com;
	arc=none smtp.remote-ip=209.85.222.54
Received: from mail-ua1-f54.google.com (mail-ua1-f54.google.com [209.85.222.54])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 87BC5606A321
	for <devicetree@vger.kernel.org>; Thu, 12 Nov 2026 17:03:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 87BC5606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ua1-f54.google.com with SMTP id a1e0cc1a2514c-99bf7b97f12so38635241.0
        for <devicetree@vger.kernel.org>; Thu, 12 Nov 2026 09:03:07 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794502986; x=1795107786;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=3W1A4BQMOpN9nFxHb2rXE8WHciL/muN+wSYPGT+qRXs=;
        b=AtHNayY8XIzZLGn3+awcVmQ81naCaIuWvladi3l/PwkY0yqTKmcBhhrjdjc7eShiRD
         /q03pGYuaIm0ev2X0HdJOQVXdM4VaKVbaqXM3pUQmEBRYc7MjPsTLy4V1X80uU+T2r+k
         rhCn+tdVAp8fuQoWfSkA69N504ztR0sEaqLV5s8dUQTMsqXSqORZqkElhcnANDkVOQgz
         VFGwf63Q0mfU50ukLCrs8Y/pgeNy//NZkKTicNEkaeuQgaNCGT6AZC9d//HbGgUFjmJJ
         PIKpT6j14sB2SYOUz1McZlcGO3daySMyXioLeIcCYGRy/WbGS9TQHVsmfZWHoBicvt79
         EzzA==
X-Gm-Message-State: APuU4Z94kTfXqvzNJRkvnmNfYIzH9CeRu7CCw/Ebl9ck8OYBatvPPVrn
	aH9nsgDbYc0lm6xS/UwAH00n8RbmTcYVjUn2gVO8bmEUUIi+d9WsL1VNooBfRtaI01k=
X-Gm-Gg: AYBFou0USKeFmZKzy5AVI1GE3DDjBW72NR22yo+0aYcvi0VbBzywG2hOqhg5xcXBIgL
	0gu5IC2EppgpNOo5LGn+YgdKhJc2j7VjRPVZTLaixpOuERdOtxQOOeI6d/0/kZvZgH6VPpGWoL3
	92XE4gehu/0OuQmX/AdIaZcah9eunH0t0qYkZTurZaKE8LNJ9BM8iydFfJrL/9ZT/06YcNfCJz1
	V8xZvDkDDNRrIfPrQk9x+ocdjw0OaBKIdXRIfrOLrcEHgWU+qAb/L8R+4QgtWQPdNgnefdfKOhA
	R9u31mSwT1gysta0k6Bip0F/gdrUFBobOZ+Arkqf4vsAxqJxChNqYHAyEA6+roPD6k3Bm1iqUOk
	xTg2oZqorcdn8JeTmEXGO0n8sL3orw10vTV82vacRCXSOaSQ6SU+iDNz1NXCbfLstSgAgfcOfJ4
	PtBdcj3fS9QfSz6KSKdwNhxdLl6QXET2S65CDVBcvefbHQTUn5CroMvE+in509RhOFKCfF54nbl
	ICY7hDdLP5iEuPDmTZHX0Q7YUATog6IqQOykgmY5rtSxIEZayBLKo2lYCvTiMhZ8A0Hi9jnK9i6
	wr3BuxCfR5rbACucA/pSSOiIjwTUjy9zuhD/KVhrKPtbBjnXH6NCSlhzuFGIuDjEEYs8k1M=
X-Received: by 2002:a05:6122:1790:b0:5ea:bf30:851d with SMTP id 71dfb90a1353d-5ee274b21ddmr932056e0c.16.1794502986357;
        Thu, 12 Nov 2026 09:03:06 -0800 (PST)
Received: from mail-vk1-f177.google.com (mail-vk1-f177.google.com. [209.85.221.177])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-99c8427aed0sm55464241.8.2026.11.12.09.03.04
        for <devicetree@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 12 Nov 2026 09:03:05 -0800 (PST)
Received: by mail-vk1-f177.google.com with SMTP id 71dfb90a1353d-5eaf34452a9so43873e0c.0
        for <devicetree@vger.kernel.org>; Thu, 12 Nov 2026 09:03:04 -0800 (PST)
X-Received: by 2002:a05:6122:510a:b0:5ee:52a:f480 with SMTP id
 71dfb90a1353d-5ee27434e9cmr838741e0c.9.1794502984448; Thu, 12 Nov 2026
 09:03:04 -0800 (PST)
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <cover.1792163045.git.geert+renesas@glider.be> <e3b9d76d5b4a254d561b6e734423063e94225a28.1792163045.git.geert+renesas@glider.be>
 <sashiko-outbox-174603@kernel.org>
In-Reply-To: <sashiko-outbox-174603@kernel.org>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 12 Nov 2026 18:02:52 +0100
X-Gmail-Original-Message-ID: <CAMuHMdWb4UPKhcFnRG-dta5KvDUV_cZzWrWwaD2D-vGnh_qtSA@mail.gmail.com>
X-Gm-Features: AclHuK8ZV6Kxtk9Z6yJfLydeqQiC4mysO9PUPwmC0BbcDagci2s6Qg-Q4JhBB4c
Message-ID: <CAMuHMdWb4UPKhcFnRG-dta5KvDUV_cZzWrWwaD2D-vGnh_qtSA@mail.gmail.com>
Subject: Re: [PATCH v4 6/8] pmdomain: Make genpd_get_from_provider() public
To: sashiko-reviews@lists.linux.dev
Cc: devicetree@vger.kernel.org, linux-clk@vger.kernel.org, robh@kernel.org, 
	conor+dt@kernel.org, wsa+renesas@sang-engineering.com
Content-Type: text/plain; charset="UTF-8"

On Fri, 16 Oct 2026 at 18:08, <sashiko-bot@kernel.org> wrote:
> Thank you for your contribution! Sashiko AI review found 1 potential issue(s) to consider:
> - [High] pmdomain: UAF due to un-refcounted genpd pointer export
> --
>
> commit a7a3a37d2be118bab420ebff1f13629dfa676eb6
> Author: Geert Uytterhoeven <geert+renesas@glider.be>
>
> pmdomain: Make genpd_get_from_provider() public
>
> This commit makes genpd_get_from_provider() public as
> of_genpd_get_from_provider(), allowing PM Domain drivers to look up
> generic_pm_domain structures directly.
>
> > diff --git a/drivers/pmdomain/core.c b/drivers/pmdomain/core.c
> > index 88c886814a5b9..4136368456d99 100644
> > --- a/drivers/pmdomain/core.c
> > +++ b/drivers/pmdomain/core.c
> > @@ -3018,8 +3018,7 @@ EXPORT_SYMBOL_GPL(of_genpd_del_provider);
> >   * Returns a valid pointer to struct generic_pm_domain on success or ERR_PTR()
> >   * on failure.
> >   */
> > -static struct generic_pm_domain *genpd_get_from_provider(
> > -                                     const struct of_phandle_args *genpdspec)
> > +struct generic_pm_domain *of_genpd_get_from_provider(const struct of_phandle_args *genpdspec)
> >  {
> >       struct generic_pm_domain *genpd = ERR_PTR(-EPROBE_DEFER);
> >       struct of_genpd_provider *provider;
> > @@ -3041,6 +3040,7 @@ static struct generic_pm_domain *genpd_get_from_provider(
> >
> >       return genpd;
> >  }
> > +EXPORT_SYMBOL_GPL(of_genpd_get_from_provider);
>
> [Severity: High]
> Can exporting this API lead to a use-after-free regression?
>
> of_genpd_get_from_provider() returns an unpinned, un-refcounted pointer to
> struct generic_pm_domain whose lifetime is managed by the provider. While the
> commit message compares this to the clock subsystem, clock pointers are
> refcounted or uniquely allocated.
>
> The follow-up r8a78000-mdlc patch demonstrates caching these genpd pointers in
> its power_map without acquiring any locks (since gpd_list_lock is internal).
> Because the SCMI provider is looked up dynamically via
> of_find_compatible_node(), fw_devlink cannot automatically detect the
> dependency to create a device link.
>
> If the SCMI driver is unbound (via sysfs or module unload), pm_genpd_remove()
> will free the genpd structures, leaving dangling pointers. Furthermore,
> overwriting the attach_dev and detach_dev function pointers of the SCMI genpd
> objects will lead to invalid execution if the module is unloaded.

If the SCMI driver is unbound, the system is dead anyway.

> [Severity: High]
> This problem wasn't introduced by this patch, but does this internal caller
> have a time-of-check to time-of-use (TOCTOU) race?
>
> Fetching parent_genpd locklessly in of_genpd_add_child_ids() allows a
> concurrent pm_genpd_remove() to free the domain before gpd_list_lock is
> subsequently acquired.

Ignoring pre-existing issues.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
