Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.128.172
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794307951;
	b=MPYigfv+eDUKaiWGVkCGOHeWsUeYSz/m6dAUUaozA/uvsO9Zq0D6NglK28gBxtmjr9y5
	 3Izcz5RO93t4DrTV7YvN+IF6zgLTVUjovWJpJXdUZ9PhKO+kpElEduZQWJ5a81qoZfqvv
	 zC+HV/L8mdas66edsctD7fKJAcAUAvfYaUYnvCsSO/vaHiy/Jr/JouVJTcJtFLihJTDOE
	 frAoeZCrvtE+XTjjs6/3mtVTQfzy1Z1FuVBFw5acX/n9ebHv9KZkEBbHjhBV4ru553Pg7
	 G+fxXEm0GfLgFAnfkNpKn+ihianJMnP2F3nRZFC8YvVwDYStSPVLy7/FNX0YyibGd4Q==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794307951;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=hz1/GqxJfr5fovZK3WCpsTphS4Ees9ZlA9FefTtrxKA=;
	b=Wu0Ok/ZHU8swLddYK/YK03cS4Y+yCDL2XHMeYpEjnvoKVWhlHZqUKpEHY4ODjzU2Pd/k
	 2heryAAH3/kChp+wUJ6BdrMVk22GJ+7Vjv882wBlnvHyn5UCLdcn/DOfLAY+xAnguI+R+
	 Gb2HaT+oU9uh+0uphJVc7dWj/ZSrb/WHEEC68I1yxPUTjoi+16oDUlrSIL59NM5EaToE6
	 OAa5bOMwS6dmBpPveBD6AL8exlSs/8nCCpky+k45SZjSo/kAjN91YPIvEFDYnKBkWR2Zz
	 g/VA/IaOLpoih5jgXtKfau0val3qDOuYdxhGdTjXp2qt+ZcrzrWtu3AHDpfBtfVJmcA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=G2yKUg4k;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.128.172
Received: from mail-yw1-f172.google.com (mail-yw1-f172.google.com [209.85.128.172])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 34717606A331
	for <devicetree@vger.kernel.org>; Tue, 10 Nov 2026 10:52:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 34717606A331
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=G2yKUg4k
Received: by mail-yw1-f172.google.com with SMTP id 00721157ae682-8b308fca7c3so17389077b3.2
        for <devicetree@vger.kernel.org>; Tue, 10 Nov 2026 02:52:31 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794307950; cv=none;
        d=google.com; s=arc-20260327;
        b=oPDNjxuyoXobuj6CJqZoVZG/GKQekQC5fSdj5JtzzKCh9gNAz/WbkjsQPJGV9Y2FMF
         ppKptmFt6GFmqcMMO+RzSOMuPz3AsWUgBxNRJqv2YwBxO9hu3hLHonarvSBAluevhjbU
         hADuuf2mnUZtLJrBPGu0keqlHt70bXv+xBiOqkXhLrQvqhOYiDOkpJ6ZfgDnRW/YTI6t
         sRcaSSPZ65Yq3NlViACUwc9Zh2RX5A+TVN4ngQNRt3DoOBXnkxMmeJ9Ch7ZR8919GU7K
         kIS/yezEmwsAZxNBvjB2OtgDVuSmXc10cnLA3pujKECdcLHa1428/95cENnzyPRHl2sW
         JtGQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=hz1/GqxJfr5fovZK3WCpsTphS4Ees9ZlA9FefTtrxKA=;
        fh=hNkuLksKdIv6blKnYkWutQtKab6/vDFfSEtYaqyl8S0=;
        b=BdZZo9My2CUXF/v6+QH/Wlwm/pEooIctw3c/0DR5oOl3qc1hyLr6vBxNGaZkSzheZv
         9x+HfZHNW4D8C/4mpUfZfi0UcdKqzab4C8InSiLgp5wa3yd472gdqdSp+6Cod48xSi/M
         E87RKZlySUGHBIQ0wkWslvN80Vf3yOBS0GdxgamCr1WPVtA6I7Vi6aNFJZ4weLmDiisR
         pAxgpaG/6092b7dmua84mqri4PPU+NVgmZkPANx+cEkCLeLjmvu5RRd0fmNj6mo46TrN
         +fjHNshxHcoWqGRHSE0WrLs1G2NV4m3HH39wcaAFR3/Homv+fPeJneqGGtREK89i/ujp
         OhAQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794307950; x=1794912750; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=hz1/GqxJfr5fovZK3WCpsTphS4Ees9ZlA9FefTtrxKA=;
        b=G2yKUg4kkkNyrAQLdA+svzeZn6bsiQXP/vEdrNCmE3xn8ePwe7ypVchrXLzPlmsfmW
         lzJ/znIv2TTl48zXBASM/vBEzAZQnZV3IFI5K7mcP1Sn/aQJmC0Q+3u8jnETQdK+OdKT
         UMrinFt0wmlR5B7U/Wi6+upm+BxqtF+PZgq6G7oUC/R/Rve1Wc3Qgg9fKoBY1jL0KR5y
         wgYtSJTLX2BHOwgJdKHSOoj+wx6LNeG9PNM34mQWbkp45RbZKXP4v4JWPrUO0bsZObJ2
         PjKKSQAC6V527ZMIejd5C4uGw2iRY5wETwfo5byFtMVf+095etPOYZnI4Z26jWNMjqMB
         xylA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794307950; x=1794912750;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=hz1/GqxJfr5fovZK3WCpsTphS4Ees9ZlA9FefTtrxKA=;
        b=0K+sgG16sV3BaF9jcUbG+C0HEi5jgF5AujR1IehMDR+KZKigbYACAr8jxCRcDCoKAa
         yl8Cq73H5CfmzLXKsRHgzefuoGHEyo0+L0hNW2lHl8dr6pqf1YyyEXsvpMkyABpt5OIL
         GodXktlpd/wxsI8vrbRuipH9+vTH2VLTfMXfsw6T8W+VFH543HGSx6rlpdvzyEsmaD8V
         q7mlw1mV527jpSYPuubZ30qhsHiF7AftUR8Iv9Zd6sxkgcJ+vh6WLxjd/GcSk8SdQnCB
         ku6QEz/aBQeod6imdgamyRHDfkivRMLAGzZIjOtHRUP9qJAbrCIQ2yloToZ2C8KrOifg
         iKiQ==
X-Forwarded-Encrypted: i=1; AL+hErHCKUupAqfQQWtL+rrCNu7WofLNIJFFAgTqsVC28N3Ro0ocl74UyX8GL4Cd4cIDb14PUltriSpXoAZN@vger.kernel.org
X-Gm-Message-State: APuU4Z//6HWg807Nbqlk4as3YvDeTmlsV/91Ysg0eL29CgeNmMYkGeNx
	mEGvXWbgRKp80qS9Yw13fDPyXVE38HO9xPcljHtLeaZDyqUaxncftbSW59RgBqilIIXNXPkvb1O
	nN544cOPnai+EKv6kdqhO7LGyUnYyBpZJp9QAi48=
X-Gm-Gg: AYBFou2/c0vmsyyIvMAgf0wwu3kWsPiKHwuYHyoDf8pse8xUubMPA7zk3z9WfAJ9uSg
	yDuiLG4fSHuGriZwqDDuT6jK0/kNKGi8acIpfWaoXa9w29YegrFYsK5GxhLDdnUYSA2AuTqRT5r
	Fj0llUfw0y+JvqLUNl4Sh7lRmBWNJmAu2NONM6o6E22sJLhIFTut2mi0f0IE5GC5/DBzn7EOFup
	dy06OAKppdRE/DU3Zi07QM7FR4HsjGgq42XZBGZFGfdz6E8phcFZupQ6Ka2wNWTl3nWJgX4frgv
	OYsMdt3R3i/VQYq3PIwxfveMJKcEJmXaYyx2G96MpeMIIW7KjCOpwgjjvVlPkXfQkoaEtTdMClJ
	XDGKXc3W5F6Z5/w/yK0fp5MQPwioDg3G033I0kswXyaCgwLx3Xiwn9+0BB025dmxi4RiVyMCtK4
	BhvT9hjilQCNkcJSeB5F8c+bvadjutHVy1oG5nI0QXuCM0r1cGegKSqxNKlsvgvvchv9XQFY4iV
	j1QZOag3TH5ChSO4koYPW4vJMvxo7c0S3PAPcXZPUCmPBfZ6oyppC05z0Ytxg==
X-Received: by 2002:a05:690c:4804:b0:8b3:4022:d81b with SMTP id
 00721157ae682-8b39281e93amr14763687b3.4.1794307950215; Tue, 10 Nov 2026
 02:52:30 -0800 (PST)
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261104-fwnode-for-each-prop-v1-0-6e28fe1c72c4@oss.qualcomm.com>
 <20261104-fwnode-for-each-prop-v1-5-6e28fe1c72c4@oss.qualcomm.com>
 <auuhy40x1BMoW96-@ashevche-desk.local> <7sfr4ljlwbehal3or4dmy5jxbjz6ya2lf3dq3yptr54wym5tea@eqaexflmocih>
 <avICwdxyi-W1Y3PD@ashevche-desk.local> <ab73ez55exen3ew52svsxfinwsuatppdodu2e2zp6izjwwqwwu@2imxzxwclgtl>
 <CAHp75VcwiGHB73ny8iSvXeFdjbTKUpnXZPS5iD7NwaMcJ6q-7A@mail.gmail.com> <l7ppjeoqvc6hblk52a6upei4ee2caahe2ltiur4gwig3ez7d3c@dmzzy22ixvlc>
In-Reply-To: <l7ppjeoqvc6hblk52a6upei4ee2caahe2ltiur4gwig3ez7d3c@dmzzy22ixvlc>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Tue, 10 Nov 2026 12:51:53 +0200
X-Gm-Features: AclHuK_OONOCVTyFsjjRyXe2igkmpzvumbiGAvSGjLyAIyl_gOSbE4gZk1U_Cc4
Message-ID: <CAHp75VdZpqt8PzVypQ85U1OjxszXOmCP9MKv3ozQOh-UVFnR-w@mail.gmail.com>
Subject: Re: [PATCH 5/9] of: property: implement the .property_get_names()
 fwnode operation
To: Bartosz Golaszewski <brgl@kernel.org>
Cc: Andy Shevchenko <andriy.shevchenko@linux.intel.com>, 
	Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>, Daniel Scally <djrscally@gmail.com>, 
	Heikki Krogerus <heikki.krogerus@linux.intel.com>, 
	Sakari Ailus <sakari.ailus@linux.intel.com>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, "Rafael J. Wysocki" <rafael@kernel.org>, 
	Danilo Krummrich <dakr@kernel.org>, Johan Hovold <johan@kernel.org>, Hans Verkuil <hverkuil@kernel.org>, 
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>, Kees Cook <kees@kernel.org>, 
	Andy Shevchenko <andy@kernel.org>, Len Brown <lenb@kernel.org>, Rob Herring <robh@kernel.org>, 
	Saravana Kannan <saravanak@kernel.org>, Linus Walleij <linusw@kernel.org>, linux-acpi@vger.kernel.org, 
	driver-core@lists.linux.dev, linux-kernel@vger.kernel.org, 
	linux-hardening@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-gpio@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Nov 10, 2026 at 11:50=E2=80=AFAM Bartosz Golaszewski <brgl@kernel.o=
rg> wrote:
> On Tue, Nov 10, 2026 at 11:12:02AM +0200, Andy Shevchenko wrote:
> > On Tue, Nov 10, 2026 at 11:00=E2=80=AFAM Bartosz Golaszewski <brgl@kern=
el.org> wrote:
> > > On Mon, Nov 09, 2026 at 07:28:33PM +0200, Andy Shevchenko wrote:
> > > > On Mon, Nov 09, 2026 at 02:07:46PM +0100, Bartosz Golaszewski wrote=
:
> > > > > On Wed, Nov 04, 2026 at 11:21:15PM +0200, Andy Shevchenko wrote:
> > > > > > On Wed, Nov 04, 2026 at 03:03:47PM +0100, Bartosz Golaszewski w=
rote:

...

> > > PS: is there a way of using match_string() with non-const data?
> >
> > Why? It's an input parameter, it returns an index. Whatever you
> > provide will be not modified.


> What I mean is that the following change

> +               ret =3D match_string(merged, n1, sec_props.array[i]);
> +               if (ret >=3D n1) {
>                         merged[count++] =3D sec_props.array[i];
>                         sec_props.array[i] =3D NULL;
>                 }
>
> Results in:

> drivers/base/property.c: In function =E2=80=98fwnode_property_get_names=
=E2=80=99:
> drivers/base/property.c:607:36: error: passing argument 1 of =E2=80=98mat=
ch_string=E2=80=99 from incompatible pointer type [-Wincompatible-pointer-t=
ypes]

> And I don't see a good way of working around it without doing:
>
>         match_string((const char *const)merged, n1, sec_props.array[i]));
>
> which is ugly.

Ah, got it! But why is the "merges" char ** and not char * const *? I
believe that will fix the issue.

--=20
With Best Regards,
Andy Shevchenko
