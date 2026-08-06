Received: from mail-vk1-f180.google.com (mail-vk1-f180.google.com [209.85.221.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 55CEB3D9DA7
	for <devicetree@vger.kernel.org>; Thu,  6 Aug 2026 07:51:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786002673; cv=none; b=CnkB6fjXI3OgQ/uN54kcUVMsa1ZVJBVWaNu4/yo3SaLINwqGVLD90EtqLg6om0T2xUl6kKyA2h7xBGFJ6eQtLqDzGIqU9s2Q33t6Giv4G88dgAN6QyMIyJaQ5m1Y9MvityED8SJtJLqDNt/6k+DNfnkWSL3EMIGz7TmqxMoAOfc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786002673; c=relaxed/simple;
	bh=LggPzgtpzmxGSEMR+syiLfiMovJPwKXEdVMgyLf8MQk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=GKBJJcEcbUB0ipNGRZ1myurCE4wp5XQTcUHBw3JtOSprWKc+5PuaZLgxOimU5sNDVe7wdWEijRAOe3yH4JsNWaJF0k5GxHCljzPDOTYVt0z7Op0eHKwKgXvUFXk0dRHQdDGUyEAJwlTqZUyGfAJcSJKoF5m6gGAdX/ELoAAiS58=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.221.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f180.google.com with SMTP id 71dfb90a1353d-5bf959b820cso1279855e0c.3
        for <devicetree@vger.kernel.org>; Thu, 06 Aug 2026 00:51:12 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786002671; x=1786607471;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=Ilg2uXYYzxlWJM9ODEQB/kMjxkgSMXg77H26t3xgwzE=;
        b=oLvIUCXJ6k/coR/qNWxVzzsgdocstI+5/7veOXUMrvDKUrXb4iXo/lyzG+EdCoFv/G
         XNi+D8EUrzE1ilOg9ERFisj4UVP2c/SwlSHsT2EpqC6rqnmq+twOH5ha4th1tqS11Gqa
         M9X5FbSRTbQ8ewFwTYNQD34tywS86RXkvscRwwipDDYFg/Z3n08hZaPBuCyYmv1T9/c2
         agBJtWkCuYpy0kx9yYh/OMYWUd7wqmMTwXSCpeMa0IL2rZ7+MCrZjc+1wRThlgRIT9GQ
         aKjtcJDhhn38VkjELP15zrM19n5lumKtEv7ND4TRDNZBgoJX16ixuAJdlrTWjDCwKpXx
         4RrQ==
X-Forwarded-Encrypted: i=1; AHgh+RoV7nBAarBhOv9G0X5kYMHM1az5FrHaiucGQAaF5EsX536mS1e5f7KaDoduVdNUs6zQnWSqkexgtCEL@vger.kernel.org
X-Gm-Message-State: AOJu0YwmkUT8FBelA2OZwrjmnvdo12GyiwMZWtPZK34hlsXQPkjDIAVD
	NzjK7kVCaOt/VncKoZ7H/Wkx1tRV4jsCiof0KlBdLjCtn36ZhEpFGytma1uVz3in
X-Gm-Gg: AR+sD10vU0h9FmTkZ8xgY4Sfd/fQT0W80ChGg1ZXXnl5FcUzO8CfmiiIZqwEHCiZAas
	nONxR3B2I07wkH62bwEDaQAkn4GceJxzHSMTAtrvF53mkExveZ0joK8R3HYbTxbgjGHDied8/cF
	zmN1gDUy1SJvhbBSscO9oSSmSxlyJ6ir1SXBJPfCb0L5MwDRXoPRxrGvydt0MR3BeMhGXPhkcyv
	BEV46DD7vqCpcr7KPmN140QzOnwDWG5RpAnxsmU1rSST5wYKcdj5L+gHkEdkS0k6qqUqUTS5uIg
	dpf1V/8lUOVxNRRvvJw4174/q8l59FmDGiPCDVgQgS4iIU8hX085s6lKK+3GzHeIywMbt6WYYGw
	dvxQ0bzXmKPYOQcR5m6HLF7KEgKIDZHw9t/MUpdbiNtMsS/y/tSLc8YEr02fydve7DI+XD+VGd1
	86X1bwOKmrDFw5fnOZoiSwg7mYhU3pYyaaGxp82bP0lbPlG4glj5cwik6MbwyFCl+tSvjtIwcnW
	SD3s6BVvmkLxk9hQXy6LEf+qQ==
X-Received: by 2002:a05:6123:2e6:b0:5c2:b8a4:95c9 with SMTP id 71dfb90a1353d-5c3d924e662mr1901598e0c.11.1786002671145;
        Thu, 06 Aug 2026 00:51:11 -0700 (PDT)
Received: from mail-ua1-f49.google.com (mail-ua1-f49.google.com. [209.85.222.49])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-5c3eb9f62e8sm1341827e0c.1.2026.08.06.00.51.10
        for <devicetree@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 06 Aug 2026 00:51:10 -0700 (PDT)
Received: by mail-ua1-f49.google.com with SMTP id a1e0cc1a2514c-9618b8bdc51so557636241.1
        for <devicetree@vger.kernel.org>; Thu, 06 Aug 2026 00:51:10 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AHgh+RrQ7QxdtkiH2XxhcA5+gbUKMb6ghx4rgC1YgZSEaZ9y2OkrYrXM4tMC3yEeqlCH/Yv7Budx3lxUOkVk@vger.kernel.org
X-Received: by 2002:a05:6102:449b:b0:745:7f23:a876 with SMTP id
 ada2fe7eead31-760ea84c5f5mr3316381137.1.1786002670219; Thu, 06 Aug 2026
 00:51:10 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260722-nh-of-alias-overlay-v5-0-2abe2bb9cdbc@nexthop.ai>
 <20260722-nh-of-alias-overlay-v5-5-2abe2bb9cdbc@nexthop.ai>
 <CAMuHMdUG0RH6sFpBxp-dXw4S8kdS0oyyCL=wzKE=TkheWQAs=w@mail.gmail.com> <DKH8G5UIHT8H.25XKJIEKX4XTQ@nexthop.ai>
In-Reply-To: <DKH8G5UIHT8H.25XKJIEKX4XTQ@nexthop.ai>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 6 Aug 2026 09:50:59 +0200
X-Gmail-Original-Message-ID: <CAMuHMdUYE=56GjvDxf1rkUYCexy4rq8M4bUriHCUSHD_yYkxww@mail.gmail.com>
X-Gm-Features: AUfX_mwvKDMAlZ70yessjq-lxOGlLVzswlNlqg33_Nif8FW2tgY-C0ICs6NnPCI
Message-ID: <CAMuHMdUYE=56GjvDxf1rkUYCexy4rq8M4bUriHCUSHD_yYkxww@mail.gmail.com>
Subject: Re: [PATCH v5 5/9] of/overlay: don't keep a negative id in ovcs->id
 on idr_alloc() failure
To: Abdurrahman Hussain <abdurrahman@nexthop.ai>
Cc: robh@kernel.org, saravanak@kernel.org, frowand.list@gmail.com, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Abdurrahman,

On Wed, 5 Aug 2026 at 20:47, Abdurrahman Hussain <abdurrahman@nexthop.ai> wrote:
> On Wed Aug 5, 2026 at 1:26 AM PDT, Geert Uytterhoeven wrote:
> > (Alternatively, free_overlay_changeset() could check for a
> > strict-positive id)
> >
> > However, I am wondering if this is the right fix?
> >
> > All error cases above just return an error code, without doing
> > any cleanup. Failing to allocate an ID doesn't add any extra state...
> >
> > > goto err_free_ovcs;
> >
> > ... so shouldn't this just be changed to "goto out_unlock" instead?
>
> ovcs itself is already allocated at that point, and out_unlock does
> not free it, so that would leak the kzalloc. Going through
> free_overlay_changeset() is intentional: it copes with a partially
> initialized ovcs (the cset.entries.next check, the id check, and
> notify_state == OF_OVERLAY_INIT from kzalloc) and frees the struct.

Thanks, I had missed the kzalloc_obj().

> Your alternative is nicer though: the next revision makes
> free_overlay_changeset() treat only a strict-positive id as
> registered and drops the reset at the error site. Added your
> Suggested-by.

Thanks!

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
