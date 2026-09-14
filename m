Received: from mail-oi2-f13.google.com (mail-oi2-f13.google.com [74.125.231.205])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2FB06411F9D
	for <devicetree@vger.kernel.org>; Mon, 14 Sep 2026 09:04:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.231.205
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789376675; cv=pass; b=oLjFZ8XtoSIc5K9K3q4QLPdG3BgKT0ZJM/07+u281MU9Nvtww34hmMvtdcYoJOVfEvUPqkFfBmkxLCWg7y5jYjSkApkECExHerGEr6TVslJjJA+7Wr4LNLF1x9kn/+sXi0Shm16ZjfqfBSvBKTtkT+k3w7h9592uNvPJEfGHahM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789376675; c=relaxed/simple;
	bh=Po+fg1JflY23iGX44ZbQ0ZPhrPVSPOWKc9ZVsNI8LCQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=gVVLzLoxl4/4gkmavAICB1136ZzOcFNkZ8jOJzgmnCV7zMHrqRQxa1NmM9tK+zAlvDiXLsbOLTamwOpW95JVp0p6ARGB+FYyd1gxmaTw9Lb7tCjmqF7BJnHVyUVEqazBWeACJ1tPWwwPVJ7fQoSkj5oecg53Huu6axi+4eWJou0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=b1kYTA5J; arc=pass smtp.client-ip=74.125.231.205
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="b1kYTA5J"
Received: by mail-oi2-f13.google.com with SMTP id 5614622812f47-4bf948737e1so1332188b6e.2
        for <devicetree@vger.kernel.org>; Mon, 14 Sep 2026 02:04:32 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1789376671; cv=none;
        d=google.com; s=arc-20260327;
        b=OM7LSjLXyuETlBdOonFNETntomjJsO+47B4PvzU8t2I7zy8CPPsFGwBVsVERZqTCTj
         Sjherq+Dy2cqu5gaMgytMnTFpbjnk0k+IDGbTCdsQ4PRWjEQb0MStSd1xSItyCcOLB0H
         MXs70SLBTiqJqHnMDu0ASiGRv2ehaik7X77/lu0oi2szdDqhd4KIvG6Kyta5daugx/GM
         zuTdBxHmBSaPcPb26QyO6ebOs2negs83KIH95t0fMwV7xkBkC0SouogzMGN2qq0LW7ti
         bIYfH7V76m6WR4Dxz/bh0ur20XUxXTorEGSvhhmm0mt4Xsb8LfUrX04DzosKl+KDbJ33
         Cr0A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=6hZ4sLkAvzKguvhtkssQGq15W26aLKtU+1jNPbiNdg8=;
        fh=5x5jQKWIvuC1cKcxB8Ao5rD/x8iq4JVmnrUW8Uwa3m8=;
        b=L1KiOjOEVlFlLAGmd1CBZ+SCf/dPOCKx1RfHZvqarRZCw6vLT8BCxyKic7bcf35eYq
         /GeiOBgc0tgbjPUqZ2XLXJkdX0zvpfd5QAl3JLKvPOCWrHVFi7g7Il+G0uWgLs++DEqu
         wt5HlRmak+qutIkLt8T4XoT5tg2WZnPkEKVOSEybBmC910E5Ls5PuArsb47g9WHUyADz
         YW5n3tyrDSvUv2XhiPALdobUaO2/dxSi9aE+LId4F03NdBmwVFznQplsFSFVABNK4Yif
         QFI6DQSNF2CtCUkO3v3qPhYxHSeKZANyhqeOBt6OyBiKr3J6IWLUiBspz0gAbpD1eYLe
         nDOg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789376671; x=1789981471; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=6hZ4sLkAvzKguvhtkssQGq15W26aLKtU+1jNPbiNdg8=;
        b=b1kYTA5J8E+3TBsgdRbdwHF6G6LQmqR4KpO/ebMakEJIVwOqpxyOWM2Wy4UloHu9sf
         dm4wYFpDSvVv0ytB3Z9RuMEW+eou518bKJQQLPIT0zSZzjhYAoZf2gsVQVnOH390+4gD
         ddH+OCd/xj9XFYSGSBSa20d3FoCb0GvKvYDgvtkfYmEOVdmcvPshO6lxgJwQhrVfLYDC
         zmzoFEzpwY3zWqraDAh6bza/VPNI7PpnmZgBbcVozDXWbfvina+AJDohBd/V7nvLQo/B
         nIvDECsyWBRqIYkO6JHTNpMySlRjnRf3ms8bsvVSilNMXWfTYHnB/CePvaZtyWi41a2G
         pW+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789376671; x=1789981471;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=6hZ4sLkAvzKguvhtkssQGq15W26aLKtU+1jNPbiNdg8=;
        b=Q8J+oAUR4C/RdLCK+uw3d+lbOil7U5NoUW3XCnuQxTxOcs4wbva8nOwv+YNu4b9BRg
         2hrRND26WEGPXZHoolsNSY6wl09qxLQ3K5iy7KMKKTe4WgnL79HAG3qnI5232qvPvidI
         3/5CE5ENib+2e817mNR+zZmjRjDi+xkwtxu7Ld6ylBTwAs76kf7326sTj794xfnMzg0q
         WiyeGLehz8T66izPkBt+1ZgpwrHH3T3If6rzG0jZ8677cJK3PjXmMvokpfSwP9ejJlg6
         8Hd4VanXBilPSoSw3Nx/G1beFi2qAkfkkaMf99TNh8/bqs2Nlnnw2zG57O3UiM2v7hrl
         th/w==
X-Forwarded-Encrypted: i=1; AKwUvByt/8GAcXHFKaYwOQN8vg1WnkXd7Xg50toHUxTgcw24goqWvB6zgjipyLFtQ8t/RC26gtpKj2dVdVV6@vger.kernel.org
X-Gm-Message-State: AFuF++kD1zXE0KZCUAg+l+ydJwp3q4W+LRLdreQS8go15nYp9auvYcH1
	ERqklUdKwjEiYkEC68gYIDnhFvA/AnrM8vbRJ2uFWyYUs66LEjcly/DwFG8Uqn6adXymWDaaSg/
	egHu34ev4XiYelSzMeASR3gyqvYaE7/4=
X-Gm-Gg: AYBFou0G4Wdg6JvIUaWuNKkW13QVtG76K0+84JF4qlf5nG0DOul8LdFUG4R4SPIRswG
	y9hXSWxBSEdnnDQNOwdBgoukbBZvHI69owHoxeat82pYSPR6OcGhip7/858pWVhDjCP5NVGfqNJ
	YTWwdw/Y/EEQM0aZ2ECBN+LnbXcUH7iZtn+9Jao2yLttbAtEe8ulpUcioObeSVdAdjXVWesqyun
	xLwcZWm2PEOFggh+ZJ+6t7JVTyNbcm0Lqvx4SdH+gGkVyBU0pqi8BPT9a3RqSzB9irAvhAANFGb
	Ti3n8Sm7/Y0sfOYttdxem8tlPrPZEPOyvQJc7oc20MI6cRhc+t6/5SAKVuyDiwlXGkPYnvMJN5C
	tk3NpEh2aP+hulQ==
X-Received: by 2002:a05:6820:4cc4:b0:6c3:8216:6358 with SMTP id
 006d021491bc7-6c542537ac0mr1319314eaf.29.1789376671216; Mon, 14 Sep 2026
 02:04:31 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260823111959.17029-1-amit.barzilai22@gmail.com>
 <20260823111959.17029-7-amit.barzilai22@gmail.com> <87tsnxl3jg.fsf@ocarina.mail-host-address-is-not-set>
In-Reply-To: <87tsnxl3jg.fsf@ocarina.mail-host-address-is-not-set>
From: Amit Barzilai <amit.barzilai22@gmail.com>
Date: Mon, 14 Sep 2026 12:04:20 +0300
X-Gm-Features: AcwNN1UGx_5yKvwgvZgvxzGgxcllCpI8_ZHciIS7iNKYuuND6gS1iU1-Bj3Y5Ts
Message-ID: <CAOEgbEqtmanqwuX-hLNG8HwNn1+NMJZUzbNFavkJEpqfQAfLfQ@mail.gmail.com>
Subject: Re: [PATCH v5 6/6] drm/ssd130x: Add SSD135X_FAMILY and SSD1351 support
To: Javier Martinez Canillas <javierm@redhat.com>
Cc: airlied@gmail.com, simona@ffwll.ch, maarten.lankhorst@linux.intel.com, 
	mripard@kernel.org, tzimmermann@suse.de, robh@kernel.org, krzk+dt@kernel.org, 
	conor+dt@kernel.org, andriy.shevchenko@intel.com, holofermes@gmail.com, 
	linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, 
	dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Sep 10, 2026 at 3:00=E2=80=AFPM Javier Martinez Canillas
<javierm@redhat.com> wrote:
> >  static int ssd130x_write_cmds(struct ssd130x_device *ssd130x, const u8=
 *cmd,
> >                             size_t len)
> > @@ -271,6 +310,17 @@ static int ssd130x_write_cmds(struct ssd130x_devic=
e *ssd130x, const u8 *cmd,
> >       unsigned int i;
> >       int ret;
> >
> > +     if (ssd130x->device_info->cmd_params_are_data) {
> > +             if (!len)
> > +                     return 0;
> > +
>
>
> Can len even be 0? If that's the case then I guess that makes more sense
> to check and bail out early regardless if cmd_params_are_data is true ?
>
> For the !cmd_params_are_data case, the for loop will be a no-op anyways
> but still I think is cleaner to check as the first thing in this function=
.

I leaned on the no-op loop in the second branch, but I agree it would
be cleaner to check this and remove the edge case regardless if parameters =
are
data or not.

Addressed in v6.

> > +             ret =3D regmap_write(ssd130x->regmap, SSD13XX_COMMAND, cm=
d[0]);
> > +             if (ret || len =3D=3D 1)
> > +                     return ret;
> > +
>
> The len =3D=3D 1 case is for commands that do not have parameters right? =
I
> think that adding some comments explaining this to make it clear why
> there is an early return.

Added a comment in v6.

> I'm happy with the implementation now, thanks a lot for bearing with
> me and your patience iterating over this series.
>
> Reviewed-by: Javier Martinez Canillas <javierm@redhat.com>

No problem at all, happy to work with you.
Thank you for the review.


--
Thanks,
Amit
