Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.128.180
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794338829;
	b=uCbqH9/TfLhN7uAzw99mut973DB+AGXbEtrDVYMmcL/8fYB6a5Ke1GBeD51k1CNPYdp1
	 1wFmUABIR+C4kBzvuVU2CtjHKuDsRxuY9S38mpJLjyoFRwI6kHQCXxgFCvyr5pDacSlEu
	 BXmti2sass4n1fmg3XMeuUMlVW/63bceMK3s1N/DVt4sOepCVbK1jDJX0EICcQ8s96BlD
	 jmH/TZQ4pdmEAaCz2pVc9zq/QMeBmj+tSTRwozyuJvPkTLJZsE9nvYfMssGZY/XPqzDQi
	 dNwJ/BwBD3E9UHvq4KDBx1Zv2eCufE0LnjDtR6i0yEPn4gelW/PTyqvnKY4+SkSTmMw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794338829;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=3BDn6wwNGszSOSWtixkkwMS4uvVtcI6x5Kvm71JPIW0=;
	b=Eq901OuT/BLi+UIHzos4cyLj9O8UzVLn+Z1hkn4mcLUe5+CzN1WfgDpTGQmHBGPIcNmj
	 OyDnP1egNMFX1UaQCQv+bLEOgrOQADomRdEhM+e5q3vMpZJdT2nkP1723/a+zVwtAP/QG
	 IYRMjsMT8+uJ/gw5rsvYC5bHrHl5xYLwlpMELasZ2VKDFNvTnhn4aHAy8S8yJwCcQaBOq
	 gBOLfzjMe+hJA1fipYACabKlEXU51APd5P9iUtKizlfZoKFcVBIscDJKulmUpbYrVqN5r
	 P7ZFeD0BaXdA79alXk8s/y7bB4kp8I/fBIs3IgOOYaORpHFRAhr7zxSO5wEmztrzahw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=dnMneL+X;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.128.180
Received: from mail-yw1-f180.google.com (mail-yw1-f180.google.com [209.85.128.180])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 97181606A323
	for <devicetree@vger.kernel.org>; Tue, 10 Nov 2026 19:27:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 97181606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=dnMneL+X
Received: by mail-yw1-f180.google.com with SMTP id 00721157ae682-8b2d14968c9so27325027b3.0
        for <devicetree@vger.kernel.org>; Tue, 10 Nov 2026 11:27:08 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794338827; cv=none;
        d=google.com; s=arc-20260327;
        b=ivJGE0uNFxewp+RGIu7Bl31GZ64+sZOfwEADgLSztspGWumBOWMMLVLDzPS1m0NOVC
         9iDgrlXsH1rVThI138F7DhR56cSEn2gD64CvgIhkF1oHnyfCFH2FA1q+c3JsS+cVh7Qi
         iPoeOWJaW9Ab2cpiIcfFRFWX7MPc9wblH26JuSkO9s2dhDY7cJlpVpLepq60zbAODMwE
         iTRPKwCSKJDKXWCDuiqJW/xE00QM+zRHYALKO7dZ5VTG7twBgfgRIVhtbRtAA1HtFqtI
         3M4mvoXFoFQU4ew9TgLQY1cSenZN2Ztb6TcqXFWAIK9SrVh0UqUKHWNoBSY7T/LjEDoV
         6gbg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=3BDn6wwNGszSOSWtixkkwMS4uvVtcI6x5Kvm71JPIW0=;
        fh=pfWQWZ9vwH4/UY5d0NP+soSW9RO6F//JggDAIki009U=;
        b=AY3qD+DYsVECO0I+JiIT7TzC7SPd7udb08cEiuCYIwg85qn5TSPe75Ufyzne2Y+1nx
         OGKqXX8uqHpFbIasosJ67la+xqc7Aq9ZFWcJFxNx1wDCb4GtiZFzl52DJt3HkXCAFJ1B
         +TOz7Nq77DQZHY3GjW/vjpWN0NUBkhlSPB0/Gkz9gMr269NPb1igyzK88BAuidLqiSMn
         JcfqXlWq6ivafO1cQqIWeDRdGhKBq2ez3VAChE/SgsEJHGnck2B1+IHCNoBKaD/LkAnq
         7IOhlMiBv6hvRTVuI4isHtVffFcqq7hoR/l8qSgSVb1bPTjLGm+rxxW6YK7mfak05/I8
         9LTw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794338827; x=1794943627; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=3BDn6wwNGszSOSWtixkkwMS4uvVtcI6x5Kvm71JPIW0=;
        b=dnMneL+XJ3b1M4ASEHVeuj/dVeY2gNNpVmeesPydhdAKdVnhdMuWsMS2adyErQNl5+
         6TVNx+2AvYKqYe/fl5pbLnjtqnejCsJ21xsM99vnAbhbg5Ho+l9qrYeZad1mMorI/Gz1
         i5JcBPTsWk4EGjljE9dFTRiF8ILW9SYAd8yrz3vKTc6qVuRGY6R6ZKgJS17+GBFRONMG
         HmPfc7YHrg6mnYIusa5ZjjYxi9sMHWe5DnLwf3LQf6cjJiMdesu309BbEhoDV5gD+vrC
         /w7NI7KcdAggclYNuqWrzPHH6nEQuax1wWB2Lj2k2BAVU1VCUYKr1VD51VJ5W8W25Xao
         mZQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794338827; x=1794943627;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=3BDn6wwNGszSOSWtixkkwMS4uvVtcI6x5Kvm71JPIW0=;
        b=gw0mTZMp96CZHcEYXkxtNZDbwnFhF/QOabXZlExsIl4Y49DHZJlTtDRcKxaKJxazCc
         FBFBYwogMEX67XSSZi+m0Gi+1RDJU7SuP4K8Ygt3Rm58lIAaDyB0LRrJMyYnaGGZPD2p
         kvpbrjZnDuBoE3/sb1yMrOb1NusWAfXw50Z+bd7orUgM2udkUdukGnHa7T3aP66xEBuJ
         gNlmRWeeP9F/cRAq29cfspdVKS4VZw0EqKZ+2y5MTTJVylZo48Wj4IeIgMJZYbTlyALv
         0KpLbm85yD3G9YwB1jOoHRnjXbXFWGhnVuTKUoicnz9uIP+OCA53Csi0I4O5fupAGo/Y
         tDGw==
X-Forwarded-Encrypted: i=1; AL+hErEDX13ys6PKNYrwe61IM7Pxpu7ymTfBxPOxjP/zQvFA8mccpw/0mEB8GQb0cih3Eze3xgNPl3Nfw7ts@vger.kernel.org
X-Gm-Message-State: APuU4Z+x/AlOUa94nBpzQEVV9bZ61CeLjmmwkpdo9dN6wqkgAgOOXt9t
	ctycFRcHCdX7me+p6QPpIFVV2O/duIJMbmmyVR187QJIQ8ytODTYdceZkx6l8OKo7BSQyoZhRuW
	rXU5y3w+mEThP2NYjoh8k96Eg/7tbDyU=
X-Gm-Gg: AYBFou26iZoIxYJ7qIANh4TorYOqJhZWWynwyAD7RzWRhvDyJH3pWXXBbyeUeYnIScW
	PZLX7zwALsjJoyAf82SJxlz+QjADrOqacN58azfxRf8OGapsB1OYXoyQClcuxMIJUwOx5eJLDKM
	aTO6kbkMGf4VkL96elWFLK1jed4h8mFWEpxDi8JOHkpuNTYj45jPd9Myt3VJrp5XjHRPOnOximf
	9QAA+/r/haY7NMhst+c/c2AAEelMCJijN0UfCQeS1yv86FhCLHFELBmGBCT4Gc9O+kUmePzyZS/
	LhJJPPFtsb4oVUPDrrw2ad7L4Qmaq0Bzl8U6FP9zPHf/YXZ7pupmDqvvIYK4ZKinHqPZLfAD651
	q8bGixPFWvseOjQdak6inJsbgeDX2NuUSCmPG5A==
X-Received: by 2002:a05:690c:438c:b0:8a4:be24:f233 with SMTP id
 00721157ae682-8b3a80e6b9bmr1379417b3.46.1794338827449; Tue, 10 Nov 2026
 11:27:07 -0800 (PST)
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261108-04-k3-pm-support-v3-0-b9dc0857039b@kernel.org>
 <20261108-04-k3-pm-support-v3-2-b9dc0857039b@kernel.org> <DMQHSDTR177I.1HWHAF4FWTFQ5@linux.spacemit.com>
 <20261110105658-GKA2005@kernel.org>
In-Reply-To: <20261110105658-GKA2005@kernel.org>
From: Iker Pedrosa <ikerpedrosam@gmail.com>
Date: Tue, 10 Nov 2026 20:27:00 +0100
X-Gm-Features: AclHuK9GBj1g-yv_7rKhtj60GYCKBcJP3tjfjvEauHRa7ZWcjceK1ew77-uBX4s
Message-ID: <CABdCQ=OGejVS-r2Cuod+0EZf148g_-2Y8=tkLqbK-QRn8UH+4A@mail.gmail.com>
Subject: Re: [PATCH v3 2/2] pmdomain: spacemit: Add power domain driver
To: Yixun Lan <dlan@kernel.org>
Cc: Troy Mitchell <troy.mitchell@linux.spacemit.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Ulf Hansson <ulfh@kernel.org>, 
	Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Alexandre Ghiti <alex@ghiti.fr>, Icenowy Zheng <uwu@icenowy.me>, devicetree@vger.kernel.org, 
	linux-riscv@lists.infradead.org, spacemit@lists.linux.dev, 
	linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Thank you for addressing the feedback. The series looks good now.

Reviewed-by: Iker Pedrosa <ikerpedrosam@gmail.com>

El mar, 10 nov 2026 a las 11:57, Yixun Lan (<dlan@kernel.org>) escribi=C3=
=B3:
>
> Hi Troy,
>
> On 07:12 Mon 09 Nov     , Troy Mitchell wrote:
> > Hi Yixun,
> >
> > On Sun, 08 Nov 2026 10:36:02 +0000, Yixun Lan wrote:
> > > +config SPACEMIT_PM_DOMAINS
> > > +   tristate "PM Domain driver for SpacemiT SoC"
> > [...]
> > > +     Say y to enable device power management through PM domains.
> > This is tristate now, so "Say Y or M".
> >
> Ok, will update
>
> > [...]
> > > +#include <linux/io.h>
> > > +#include <linux/err.h>
> > > +#include <linux/platform_device.h>
> > > +#include <linux/pm_domain.h>
> > > +#include <linux/regmap.h>
> > > +#include <linux/auxiliary_bus.h>
> > io.h, err.h and platform_device.h are not used right now.
> >
> Ok, will drop them
>
> > [...]
> > > +static int spacemit_pd_power_off(struct generic_pm_domain *domain)
> > [...]
> > > +   if (ret) {
> > > +           dev_err(&domain->dev, "failed to power off domain %s: %d\=
n",
> > > +                   p->name, pd->pm_index);
> > > +           return -EBUSY;
> > > +   }
> >
> > -EBUSY drops the -ETIMEDOUT returned by regmap_read_poll_timeout();
> > why not print ret and return it? Same in spacemit_pd_power_on().
> >
> Yes, I think it's ok to propogate the err
>
> > [...]
> > > +static bool spacemit_pm_is_off_state(struct spacemit_pmu *pmu,
> > > +                                struct spacemit_pm_domain *pd)
> > [...]
> > > +   return (reg & bit) ? false : true;
> > return !(reg & bit);
> >
> Actually, there isn't much difference, your version is slightly short
>
> > [...]
> > > +static void spacemit_pm_domain_cleanup(struct spacemit_pmu *pmu)
> > > +{
> > > +   struct spacemit_pm_domain *pd;
> > > +   int i, ret;
> > > +
> > > +   for (i =3D 0; i < pmu->genpd_data.num_domains; i++) {
> > > +           if (!pmu->domains[i])
> > > +                   continue;
> > > +
> > > +           pd =3D to_spacemit_pd(pmu->domains[i]);
> > > +           ret =3D pm_genpd_remove(pmu->domains[i]);
> > > +           if (ret)
> > > +                   dev_err(pmu->dev, "failed to remove domain %s: %d=
 - state may be inconsistent\n",
> > > +                           pd->param->name, ret);
> > > +   }
> > > +}
> > [...]
> > > +static void spacemit_pm_domain_remove(struct auxiliary_device *adev)
> > > +{
> > > +   struct spacemit_pmu *pmu =3D auxiliary_get_drvdata(adev);
> > > +   struct device *dev =3D &adev->dev;
> > > +
> > > +   of_genpd_del_provider(dev->of_node);
> > > +   spacemit_pm_domain_cleanup(pmu);
> > > +}
> > pm_genpd_remove() fails with -EBUSY while a consumer is still attached,
> > but pd is freed by devres anyway. Set suppress_bind_attrs like most
> > pmdomain drivers?
> >
>
> No, I won't add suppress_bind_attrs
>
> As I'm also aware of this problem, but intend to address it in a differen=
t
> way, and should send a patch in another separate thread..
>
> In my opinion, Adding "suppress_bind_attrs =3D true" will only mitigate
> the problem, in the case of this driver, it will still trigger a problem
> while unloading the driver with rmmod command if built as kernel module,
> consumer side won't get notification with the event. Ideally the device l=
ink
> machanism should solve this, currently I'm working on a patch for this..
>
> --
> Yixun Lan (dlan)
