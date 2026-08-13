Received: from mail-yx1-f53.google.com (mail-yx1-f53.google.com [74.125.224.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1D56335FF58
	for <devicetree@vger.kernel.org>; Thu, 13 Aug 2026 03:30:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.224.53
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786591809; cv=pass; b=msSZx31ayySvf5+xB73RYra5YrvF1XSBr4cJ/Fy43nWHEjHGArPgAiV36Up1ye95BhcbYaLukrYxbv6JWk22k8qYSu9QoqPVuZ30eZUQcgnsR4mRYKgqzXSpmGi3eNREeXxM0dVt7CEkwm5Vozox8sJWokQ4dJCCZdmx7fplIT8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786591809; c=relaxed/simple;
	bh=vnxLhaj6tQ8Clxuh5zpbuIzE7N05yzLZnFlnrerBSX4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Q6+9AqzTOP4KSX0uX8+zowpszPhfitYiWk2SNCtGZ97ElntRtIetwSGP9Di8zxI5hqhM6LRnm76jC0YoECiQpa46coq3vq6jo4whPImH3JdcrculSsj7Ag+CLBIJXXAAIOa8rcHlhNA3pK5Um3WDVASn7utF/vcXx/mBeX4S5Og=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=OAx6Nlv8; arc=pass smtp.client-ip=74.125.224.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="OAx6Nlv8"
Received: by mail-yx1-f53.google.com with SMTP id 956f58d0204a3-66843304cbaso2361509d50.2
        for <devicetree@vger.kernel.org>; Wed, 12 Aug 2026 20:30:07 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1786591807; cv=none;
        d=google.com; s=arc-20260327;
        b=Afm3HtyPkaFbTytpUQ2ee0qcWvfpZADavzzmw/Ee/N+3bLoslasMcb6E6s6lmt7/p7
         0vbLPzs+VuQSS9Y3eWtFzeK+TKHf7uyB8993MDMrt3HtYW7RY+VgCEO3yNVYVkt35Hvs
         ED7AjIOu20g6oBf1nIg3Vf2h0uKGi24bkoPi4s2n3gzdtxPNWCTmVcWQ0i7SZTEJeIDG
         fZZxALnnsmRYWTMjMmJ38fQ8cs4/SjUC8mI8/QeUpdGZwVVUMkN6wYmvH+xkwGVNVYAe
         zt25McbutqVMk2ikbLoVecUOCfT3cdiNoYazxLw+LDf5BPLGXXWmNFTH0o6gO/KkugGm
         Sltw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=uAJYxuWYQfJvsQUaJRIL+oMrK23LCX8rJso9NIjzZ+0=;
        fh=H2w8ZFsHLikehyFnmIMKJX2B78w418d2u0F7TNNk1Gk=;
        b=CUlbmybSny8pPD501rA2gugjSpL+iAhoCbhaRbUjSYp2YSGOZOPmLX47u/AxYCpwPe
         crdNlhWeFrpSt/Eh210NF27vPa3rewuc3buGTTu8SkGxZh7gDwZZFp05f06+7eUPokAn
         HioJY+aLT/sGk0tuiw9ebcEQWn9Nptv90x8sIekiZi97t3SOsnFxZnAaYeytTzJL5XfI
         zCekUt8vTLpTUX+0LL2Daz5mkmix4D/xA0Gf/7JKBh/vf9zoAbKP/k1nY+ttnStNDq/u
         uM2ftPKa+XZRu4NOPJh5N7Var2x4MukL3bFyF/+HtQuNxcCLYm5deyciNN6J7Ux36U4E
         A2gw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1786591807; x=1787196607; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=uAJYxuWYQfJvsQUaJRIL+oMrK23LCX8rJso9NIjzZ+0=;
        b=OAx6Nlv8Lp8VNM9MU/S2oPBY4HmKAsc1e5D0gwad75hx3KEb8J5Rgqr8Nw6SBtS6E2
         GVLLlhrAuR2/fd58PauycK1DITwy+BOUG6VJquh7ueOBsOTg+laEUF3x/3UR6c+FDF7u
         4dYkpKQBPHt3xiUuku9no1UguifURSfKH02p8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786591807; x=1787196607;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=uAJYxuWYQfJvsQUaJRIL+oMrK23LCX8rJso9NIjzZ+0=;
        b=R/EtYSfLYi6ypAwqo6eX7LIo1SK3XhVkGhCqkSQWTtuty4Aepfq/8sw1bRRBR6+NQy
         v0st9MEEX2baDy2qahO/ZDeiTXlQku2TBQeylbu7l4F7ge4fZALZHMjcdtXfKrQBIBd/
         ajNCg1eEB4kQI3OVSsfwhKxgDEGMR2l1Q80tWA3uZip2BQfT6plBNUYGHTL6hvx0vvcF
         x220Rd2KgYbwaQl8huDbwi9VNnehrfZIoYqdQkHCkC27gre3dn/DU/A6tU+zYKSQNHy6
         IXdZ+jExLQEEIstXEjQVaai6Sl9fHMGG+AAEJUnMVTgM5eeTtq4ZPfHyXM36bShhpYtF
         zcdg==
X-Forwarded-Encrypted: i=1; AHgh+RrmOWe+Q64GKpZNRhf4T4viZ54QC8dODA2fZ8iPP6+IYNEWYdMYD0NvI1cCxcZSlmOCQPXER5QZ1Efh@vger.kernel.org
X-Gm-Message-State: AOJu0YyD9GHp8p2JYfX3k6H1cYAArUHw+4gUCPKMicq6p0QS3jcQIp3f
	IPXG0R11jU7HWOnpWLOMyYy/CwtXAghF4soGzqC8D6JYgF+tApq9Rgi2V1x9g+70JsxcU+T7gNm
	tYp2RG14Oi58g2M4DQvJbWl0Jm7diLnpnKNOQp60V
X-Gm-Gg: AR+sD11mnybxXnSF0K9mExDlSlpa9G1Q3Qa02YLqO/xCCxq66dVTAn0vuEJl1bndQGP
	dld3Zipk/xjEVaFybWrpHDzGGemMlba9kSmPkmNoOukIDRQorDqbE+vtg9uqWcmHd40iAliYhIT
	D765RqWjFvL4SgxYSTA+7Liqm49HN6F/jzBy420eTnwGDnh7r8TEttSmgMQqt+hWmCakjpaSKRb
	qPFb3Njb3o3U764DEals4aWHhoisVeDBpaW22A/KjHD5inirAvG1JDAHEtV30pFEbTYelNvTIY6
	ENUzExVMkFqAEeK3ijFqc2JJMhNTn4gFtlr++LAe6VzhManPdIRmYJkXZ2LvkaHKG4FNU0n//hj
	Yq3INbCyM2g==
X-Received: by 2002:a53:e5ce:0:b0:667:bae0:e565 with SMTP id
 956f58d0204a3-66c515b62fdmr981398d50.30.1786591807078; Wed, 12 Aug 2026
 20:30:07 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260811122011.3539250-1-wenst@chromium.org> <20260811122011.3539250-8-wenst@chromium.org>
 <an02idvk4GtZIMfn@google.com>
In-Reply-To: <an02idvk4GtZIMfn@google.com>
From: Chen-Yu Tsai <wenst@chromium.org>
Date: Thu, 13 Aug 2026 11:29:55 +0800
X-Gm-Features: AUfX_myrCG3oNTwmlZwHDJSbsoCHFr7jcGIFmX0-QgCkqwSa3XLy1HbTAXteqh4
Message-ID: <CAGXv+5Gf0sYKvvd=JsdPsahvHCKr5rk+YiVu6SCY6ZQicJzd6g@mail.gmail.com>
Subject: Re: [PATCH v4 7/9] platform/chrome: of_hw_prober: Add delay for hana trackpads
To: Tzung-Bi Shih <tzungbi@kernel.org>
Cc: Mark Brown <broonie@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
	Benson Leung <bleung@chromium.org>, Dmitry Torokhov <dmitry.torokhov@gmail.com>, 
	Jiri Kosina <jikos@kernel.org>, Andi Shyti <andi.shyti@kernel.org>, 
	linux-mediatek@lists.infradead.org, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, chrome-platform@lists.linux.dev, 
	linux-input@vger.kernel.org, linux-i2c@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Aug 13, 2026 at 11:14=E2=80=AFAM Tzung-Bi Shih <tzungbi@kernel.org>=
 wrote:
>
> On Tue, Aug 11, 2026 at 08:20:07PM +0800, Chen-Yu Tsai wrote:
> > Up until now, the MT8173 elm/hana device tree has set the dedicated
> > regulator supplying the trackpad as always-on, simply because the Elan
> > driver was missing proper delays. As a result the delay for the
> > Synaptics trackpad was also omitted, as it was not strictly required
> > under such a model and delayed the availability of the trackpad to the
> > user.
> >
> > The Elan driver recently gained proper delays after power-up, with
> > adaptive skipping of the delay if the regulator was originally
> > on. The I2C HID driver and I2C OF component prober library gained
> > similar adaptive delay skipping. The device tree will be fixed to have
> > the regulator not be always on, and proper post-power-on delay time
> > added to the I2C HID device.
> >
> > Also add the post-power-on delay to the ChromeOS OF component prober,
> > so that if the regulator is off at the time of probing, the prober know=
s
> > to wait for the hardware to initialize.
>
> > [...]
>
> This looks harmless even without the aforementioned patches.

As mentioned in the cover letter, it is harmless, but will delay the
probing and subsequent enablement of the trackpad.


> Applied to
>
>     https://git.kernel.org/pub/scm/linux/kernel/git/chrome-platform/linux=
.git for-next
>
> [7/9] platform/chrome: of_hw_prober: Add delay for hana trackpads
>       commit: 81c1c0cb68a13d14dd1bbffcf4c49e26f9a6478c
>
> Thanks!

Thanks!

ChenYu
