Received: from mail-ed1-f51.google.com (mail-ed1-f51.google.com [209.85.208.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 772F829B200
	for <devicetree@vger.kernel.org>; Thu,  2 Jul 2026 01:39:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.51
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782956347; cv=pass; b=KBXFwFYz3mwQtHSCVE3NIZyqwuXPb/+JzXVB1dv40b/pU4avWyRpJ4mgOkJL/I35fxWKUtsdG+CebyMTjHCU6casyUuk75U9qSHyZHmn2yWlm7orjIEbKnzOI40VDM7GeXgmwlrrHVhoV4thYJniNLv5uf7X9s3BH2cg/xliXEw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782956347; c=relaxed/simple;
	bh=mVL87EttaNCUS0ArSfV9Dq8wYEb+97u4sdSR2BpS7RI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=iZjOKzb1zR0WHNUaAc6+H0CazSGjTa04iLIMcpVy6a8kvl51v3+FADJp8nreSTmKVkLiE3euFOYXqo1X6htfbrN/ptvgayrodNKCAMYaEfK0Nw0WQauXBsZmaVymCyfvTS3dhKf+RqjVj15PVDHpLH+AZTJCjDa416a/xxkg5RQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=pkzl6cdV; arc=pass smtp.client-ip=209.85.208.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="pkzl6cdV"
Received: by mail-ed1-f51.google.com with SMTP id 4fb4d7f45d1cf-697df404e32so2505274a12.0
        for <devicetree@vger.kernel.org>; Wed, 01 Jul 2026 18:39:04 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1782956343; cv=none;
        d=google.com; s=arc-20260327;
        b=be9S0KOGXxhFCcxy9UPNwqGPNTfjkqnOSsDlcsPbr7v2jGeqA16pvXgu1EJuEJ+7+T
         QktjIcZDhdBEAjJdvkrRwOCSV1jE7GtjGj5frS6cTrrOJlBgTx30GanRVu98B9S+w03e
         bvmEs0ZdYAU3+tGUzoYn+8lghPM4wYiZJy4dFZr9pNSM08jxoQktB/GLlosp2qROQgw2
         hcs4MNFasshwPvo0Xlq0AbJBdoQ0gFckp8z6uobt+cEa1TQdebtgD63fzQkyMHo9av/Q
         1vbPVzX4q+CjyL4CwfToCSgCDrauAFQUNyB4M0fmjwdVeybLOKCE/r7I55qkaU/1fhbO
         JSuA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=gqxqwLiGZi4KRbu+1ajZ1YFNLw0ON224oZgbthL9Ai4=;
        fh=g9JYbuY4oA02HEPCSmnzlLurUk9Gbl1HjtYwVwf8tQE=;
        b=T1/717x6lLsi1xeYAoLF3iIne4YpeJ4BgUhT1ACbU5mOJ4QO/Ry0h1dt4CFnFAjrA9
         wRWQ0d1hcMzBUUdYEi1fu7/fjclfAOLCtceenhOaEGdAItP148GUoZ7w6LHWibBcn8fI
         7pVjsCIj6b9rITXmBPFOi+9ncGM472onuqh/SsS1qGYOrO3AfhvdGPbVMdXmb6MbkwHk
         c0ItTxW5UlM5QW0MnyLPOlU5ET5InxjIHcWg1BPDDhhPJsxeEYMH71fIwKtSRXqPl6zN
         PjittpguYSr4DN7YFqas22LKsLirKazxJmfVFgvJXP4Zr/XI6l80c9FFHAPodWPpkA6g
         qhcQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782956343; x=1783561143; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gqxqwLiGZi4KRbu+1ajZ1YFNLw0ON224oZgbthL9Ai4=;
        b=pkzl6cdVdE6dPVHzRbf632DmiekFyTFgo1f3Yu2BCJ62RUH+XnN7ISXEYc2WWpIdRA
         JlMvZ3yfRIllVR2VZW14mtJqUdNLrXNVybn+hd1ObGk0dZ0puSunrx+mCBMUXKSfLky+
         yqY6gDiGx1HjhQseD1/gPU9PimvKSwKx/MrnndDUd2s59Ax8sO/rZcRwt6FLjPFZlI/S
         tEifj/eZssfTtaVxa37jb+4zn4gur+hrd9wGzNtg0otYtSCX3X8/nJmVKTplXcgrLYh+
         pJx6RyYEka1zHKCVBEhW8QJHJOoYDa4a0Y0OgKojNNax8LAwCQZ6Rn1nMqoL8a10tErX
         RmKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782956343; x=1783561143;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=gqxqwLiGZi4KRbu+1ajZ1YFNLw0ON224oZgbthL9Ai4=;
        b=jKhX6cSktFC8VXFCnl359ucb+PvCcs0SjhhFS865JW7LWdFkhGgF099KtQURiaCPGr
         xsvxKsdk3Kqy0efEIvHqBWuA6h2jXoD6tvIU0vEgTEq/8CZxoXVGF1eSshPUyDAwRuIZ
         gMuYmLzzsKW0EtmikGU6ihqbKcMQ2rOQAPgYUGB3dQbtKEIKAaHM2OrPX6HpU0vSzLrC
         elXJLXzh3kb7PdbHFDRk9mXdRskfe4YPpnNVl1AfyfjI+nb0/bnkNskrX5etBxLRX+sy
         qskXtoMv8JPEC9ZOEk8NVHoBdreeiXigjZG3d5bq+6pZa6jfBrMx3Uo+LI1Ib+E2pb45
         Bihw==
X-Forwarded-Encrypted: i=1; AHgh+Rom4wKTIsN0uom25LxkjDs8nOaYYz6Qzpm3386jWolaUXRguXnz+DCm5fF03yDjUtfzGwimVtZmh02l@vger.kernel.org
X-Gm-Message-State: AOJu0Yx3JSlOxA+M5SQIwbfB0qQa8RYCeT8G2UuAcFjdE9Asl9YyKC3G
	mlFOMyY/YK6h2FCtBAPAdDI+3rltnVcXvcdIJYYd/tTTzN3gytSYnT1oy1q4rcH53JYM7ihH9Nk
	wG9wLEQntbUHwVPD4PkVpYwZcojSJqICPZZFauygqfQ==
X-Gm-Gg: AfdE7ckKCajGgzI5ah9rNeM16gowVVLZTZ7Zz4MEAnYHu2hlwslCkObkvZRGgihFW0a
	PYXu4a3kCRncyUJZoKxu3CW0AkJJlzJJBHRamRsijpMAjClbCAljuplSAVILwavrlYvdZ1P6e+e
	2a74jVLcqk/KvDlDdO07kfu0L5FL3qJsrjGN2kA+SFNv54WpSAGE3gSnMjyov0mVfcnWV4Rf6Z2
	lTU6J/njy19+iFNjJBl/Ul3MW76WVr2h4uW8zRDfQIMvBfy95GwnaSoxkw+v5gBvDRt+RszRzQ=
X-Received: by 2002:a17:906:b89a:b0:c12:1c9a:48a3 with SMTP id
 a640c23a62f3a-c12a9d8ffc2mr170080866b.22.1782956342673; Wed, 01 Jul 2026
 18:39:02 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <cover.1782439646.git.zhoubinbin@loongson.cn> <ed1314e1d3275fd20aff47397345a88fad6e9368.1782439646.git.zhoubinbin@loongson.cn>
 <c9361380-b28a-4f7d-9ae5-a00042189b79@sirena.org.uk>
In-Reply-To: <c9361380-b28a-4f7d-9ae5-a00042189b79@sirena.org.uk>
From: Binbin Zhou <zhoubb.aaron@gmail.com>
Date: Thu, 2 Jul 2026 09:38:50 +0800
X-Gm-Features: AVVi8CcmZHG289kX0-X2lVThLi6Vah5Fc-yy-AopmD9GwRf3FHHrHRDDZC-S9I0
Message-ID: <CAMpQs4+Za8=7hUm0SJ_Tp17_Hg+p=RHTsRPeutuPFfTs1rOABg@mail.gmail.com>
Subject: Re: [PATCH v3 6/9] ASoC: loongson: Add Loongson-2K0300 CTCISZ Forever
 Pi sound card support
To: Mark Brown <broonie@kernel.org>
Cc: Binbin Zhou <zhoubinbin@loongson.cn>, Huacai Chen <chenhuacai@loongson.cn>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Liam Girdwood <lgirdwood@gmail.com>, Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
	Keguang Zhang <keguang.zhang@gmail.com>, Huacai Chen <chenhuacai@kernel.org>, 
	Xuerui Wang <kernel@xen0n.name>, loongarch@lists.linux.dev, devicetree@vger.kernel.org, 
	linux-sound@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Mark:

Thanks for your reply.

On Wed, Jul 1, 2026 at 7:49=E2=80=AFPM Mark Brown <broonie@kernel.org> wrot=
e:
>
> On Fri, Jun 26, 2026 at 10:27:27AM +0800, Binbin Zhou wrote:
>
> > The Loongson-2K0300 audio card uses a different DAI format compared to
> > existing Loongson platforms.
>
> >       },
> > @@ -177,6 +189,10 @@ static int loongson_asoc_card_probe(struct platfor=
m_device *pdev)
> >       if (!ls_priv)
> >               return -ENOMEM;
> >
> > +     ls_priv->cfg =3D (const struct loongson_card_config *)device_get_=
match_data(dev);
> > +     if (!ls_priv->cfg)
> > +             return -EINVAL;
> > +
>
> Does this do the right thing on ACPI systems?  I'm not seeing anything
> that'd get us match data there.

Yes, that's correct for ACPI. I tested it on the Loongson-2K2000.
The ACPI system for the LoongArch I2S card uses `PRP0001` as the
hardware ID, which also matches `loongson,ls-audio-card` compatible.

--=20
Thanks.
Binbin
