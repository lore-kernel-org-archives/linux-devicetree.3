Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 71A3C3CCA05
	for <devicetree@vger.kernel.org>; Mon, 27 Apr 2026 13:49:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.128.53
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777297761; cv=pass; b=DFxuxd9NZR+jVPj21vEvVgi+OQuA0COb7aHpaMC0dPpTpc05VFqyKBQhdWSwIiCqh+Sa73/+Uh2XdT1Y30mQF57VUPJ0e0fgGogXwPlEHC6bF7+Oi/g2lmwDMnQtCaKv7M73nrZNfQQY0dHg3numvkVQMtPBC4n+omIuPfbOVy8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777297761; c=relaxed/simple;
	bh=UV6buHEG1uLq/GfdgoXUKW/clHKcaNwLCNlf2Vw2HEA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=N65nJUByUl2n0jVQ9vn47m86MMu5Qu1lK0t2lpKJe5xYzn8tm/T3OW2vx+nPNDBZzGBtgfk/1geaWHD4FGkKHxIve47tIpL/53LvRNyca50XjZof/Il++9RjeWqxWxpuinUah8H9lsDYnCcQ3baSxVbjR6ChIbZh3T5IXCVEj3c=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=BSGYKirK; arc=pass smtp.client-ip=209.85.128.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="BSGYKirK"
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-4852b81c73aso85876135e9.3
        for <devicetree@vger.kernel.org>; Mon, 27 Apr 2026 06:49:20 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1777297759; cv=none;
        d=google.com; s=arc-20240605;
        b=avKR2PeW6BY6p6jbZ8nVeBsZiqa1pZhN3gHS+AbxDZSDVkNTbD+9Y40eLmdFIyABFj
         Vke0YHvaXV+0BMnt6aLBolN6NuuZH4mTp5yMwTTSmFxT3TKOp4jJqdrGNmHNy5X7WkIe
         CaKoqgGE5oy/eaE8CTvIJhDIE7rUWcgPNbtQhROWejdTCQ9Ls/GAb4YHCKX+E4Aj+cgZ
         qK4evwsgVeYfVoVltN+2FshMI3lqfN5ZoS95LAb2zS7jIrKkkr+ufUs0PLM0AyfSJl5J
         Iga9g9Bz8XHi7MgMqu9eh65TMUtexEI7rgx42aUsD4eI/HG94WWw7C9IudykkoXz8qp2
         A4nQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=3dd6fL4hXmVroT8xOXA2tc/R3AHUcKZxKFu4hjGHfCs=;
        fh=W+JMDo3d7smZcc63gzKFbtqGCQJ2ChetRRZMET81tRE=;
        b=EpoqfuQeN9AfoYNsjq18XE38WR5WAM8Y/FgPvZM+sRIgcqvff1ztRel6jMKqzY0LLh
         pv14urYcju6S2a9Na7EgG5t6LLwYicCOS9UljV8mEXhiGsutWHoScSfotjg/GLufMdRy
         /nBfgBfC5VmLuLlwK1IF1JB1K7YUSL0CanP1DiL3JADxBQa0I80HqOjwzZf00fBWFM2j
         Gux/0pOtxxpnVrjBpGCs54Q5Ec16r/n1nhdu/NNYyiadUaEM0G5FRelBKaf0Cl+KHhvB
         4CejtbGW1A6+kL4fsube7whNIpKAHNZv815FCPs93LfQi664y5iibTOuzumanoINGDyU
         XMPQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777297759; x=1777902559; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=3dd6fL4hXmVroT8xOXA2tc/R3AHUcKZxKFu4hjGHfCs=;
        b=BSGYKirKaJyvo+qLEEyqMYnA5PJv+DRbqYwQEx9O2tlGeKx0E4Jsc3UJXo3djI28tc
         gGYyXDQGFIpHm5MNu1bDI06H90bqmi6Vdia6OmetfTcWYKtvwWm1gZdCecSa80wcqgxx
         wYVmhkMhZSw4dL8PhYs6qXXLjSa4S9ZtWwU3zIx+j3OEG/MKknxnjwJ9RrKzBRzjFNlK
         a4i+BDu0MbfIaN+Pjx6ynDf0rjB2c+hPpRLgumdd2RJ/uMck+4NYAd3ZDirwWquTYqW1
         vxqWQiqE3X0VR39/3t6p0oOuMln64lksUEC3lNwJuULHz/62zgTLP2bI2X6ztjpT5/oB
         ZsPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777297759; x=1777902559;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3dd6fL4hXmVroT8xOXA2tc/R3AHUcKZxKFu4hjGHfCs=;
        b=h1s6qcoL1ixQzp1mrZFx9iQkQB3hJDI5a5WR/BST++ZMMMcQGB5zKW8DjmQuHTijmH
         9tfFpQX59C03TPvX1ZOt1vP4sb3CmppDSPV3zeQOljt6hlWvu7ztRf9sYhcqGEEQHvvc
         WLVdR+bqtJ/oIuhiIwoDkNb+k+zotZwmdOR7FcvGayVIcHDNoZ1lZYyNc2tlxk2Hs/7z
         5YU2DJh4C2MoDZlIu/TJJGb0vR7VprcNGyectJ5lpxjOLyr+iGYc2aINygkc9/VUtwpF
         MMgJVygb3aohe79PKfJp8NKxw9rzgdPd2AezmAyqbsIt9cWgKzAJ5RR9eYkVJ9gtw6rO
         CThQ==
X-Forwarded-Encrypted: i=1; AFNElJ+r56I/CUdi7EpU4yOChgRijFBcKQxkjpeWb4/KTLMTG6dcmKB8cIbCcAu3Ki5QVZmvVoeMrE67LiAF@vger.kernel.org
X-Gm-Message-State: AOJu0YxRXok2Eekbb8bGQhM22TC0TRy6fUVwyXIJ/n3xeGRJSxcnB0SV
	h9Pq4NOvHRuspu15pThvXvAVU0sKVMBdb+QKY2toL+YtNy46jmaag5/AM1kfdntU7+E6dsivjRZ
	WXXddgBCObo1z2N1CWEUMITQrKNCBPJ8=
X-Gm-Gg: AeBDietLf1Bylaqwp8/+10Q3H3AGtxTMqbOVdiCnEcGZb4Dy08V6blsVOScpJWUBQiK
	EFuCJ15y+O0yBdEZek7lbGSkHyU0GnWFkPPn+uax8zvT3xY4hx4S2ML92XgD+yQLPZ22LjZepGm
	5LInE1wEYX3d3PRc0leNS1S632OK36AAP4XfANVO0Vq8MWbJeCBlJNLJ3Tpx/a7wCCbUm6keOgL
	t59IXP07VlKoquLVZ2HWQlx5fAL1nWMuzjRSizhAagwicmoXRy6ON6t9kCQ1VUw/+g/4xq1LXS3
	mSW0hObgWFmotVwzIuuqpNVvR1b2CT+7ojB5jo724fGkyYhTAYngUQK0pos5fbPIVopYcZL89xv
	lC+Y474m7dJbj2bnBrLvNfhUjxx6j+OXDJBIQwx5pVw8Fjn4b7MfxNtBdhoXxsMzw/lDZ8IWRJr
	NCPQY0YDLPd3+w3UrS
X-Received: by 2002:a5d:5f92:0:b0:43d:14ae:1340 with SMTP id
 ffacd0b85a97d-43fe3df259cmr61667732f8f.23.1777297758511; Mon, 27 Apr 2026
 06:49:18 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260427100950.33936-1-piyushpatle228@gmail.com>
 <20260427100950.33936-4-piyushpatle228@gmail.com> <CALoEA-wAUpZ7_2_3kB33mNB_Y_DAc_p7QwPR9a5pxL1iET_cdw@mail.gmail.com>
 <ae9otn7HuPKVtzsk@ashevche-desk.local>
In-Reply-To: <ae9otn7HuPKVtzsk@ashevche-desk.local>
From: Joshua Crofts <joshua.crofts1@gmail.com>
Date: Mon, 27 Apr 2026 15:49:06 +0200
X-Gm-Features: AVHnY4IWXn4KPlMOkGFs9kf4VC_aZGi8atIaaiqwtdhfJnUvsWgAsLSy90uFeKE
Message-ID: <CALoEA-w=giUoevbAh+i66ATKfXCr9WUE0R6G6DOMq2xE8cibEA@mail.gmail.com>
Subject: Re: [PATCH v4 3/7] iio: adc: hx711: update Kconfig, module
 description and file header
To: Andy Shevchenko <andriy.shevchenko@intel.com>
Cc: Piyush Patle <piyushpatle228@gmail.com>, ak@it-klinger.de, jic23@kernel.org, 
	dlechner@baylibre.com, nuno.sa@analog.com, andy@kernel.org, robh@kernel.org, 
	krzk+dt@kernel.org, conor+dt@kernel.org, linux-iio@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Mon, 27 Apr 2026 at 15:46, Andy Shevchenko
<andriy.shevchenko@intel.com> wrote:
>
> On Mon, Apr 27, 2026 at 12:26:53PM +0200, Joshua Crofts wrote:
> > On Mon, 27 Apr 2026 at 12:23, Piyush Patle <piyushpatle228@gmail.com> wrote:
>
> ...
>
> > > +         which are used for bridge sensors such as weigh cells.
> >
> > Typo here.
>
> It's better if you point exactly what the typo is.
> I think you meant "weigh" that should be "weight"?

Yep, that's it, my mistake.

-- 
Kind regards

CJD
