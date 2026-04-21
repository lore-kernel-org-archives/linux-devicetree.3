Received: from mail-yw1-f170.google.com (mail-yw1-f170.google.com [209.85.128.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8EB5531282F
	for <devicetree@vger.kernel.org>; Tue, 21 Apr 2026 22:40:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.128.170
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776811250; cv=pass; b=X8jDV+OlQlgvMbG6rshmF+WZFByD0aNziT+NFA4tEg/9Y3jzXWGG/bZT8FK0c+GZQ0JqNxURB26Xu5cJr75d3xcU9hpO35kmDjRdpldqoxDJddPwzEbS3M3umDcsIuRWZN8HmqYFioE2ke44GFDNCd4PA0p/ovCaH9KKvDFfnjI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776811250; c=relaxed/simple;
	bh=H/lW5n9AgeEESY4Z8u9EDh1YC1Lu24b5nJUe3QRUpBg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=qnE8R5IhUbTNUQh9CdqOH22hsTNjJpj2e6c0Z0Qhw+Xvnho1Wh4ntPfYJ0kHGlBk80k1kCiSce87NZc5m6uFhAPNKCEG/E7JsaTIcD1qy0ebxcESpbZ/Ev9yWSaf2xO0nMMxsM3W53Zfhx4+cS97bjAu77EbEGWGIFMkeE0T+iY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=mSGI8apJ; arc=pass smtp.client-ip=209.85.128.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="mSGI8apJ"
Received: by mail-yw1-f170.google.com with SMTP id 00721157ae682-7b4ee3a88e1so45393517b3.1
        for <devicetree@vger.kernel.org>; Tue, 21 Apr 2026 15:40:49 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1776811249; cv=none;
        d=google.com; s=arc-20240605;
        b=Dh6h8yeXkiFm3EMf0EC0UpToh5DnTGiCcoj7le6qC3S2rmxBH+SaAxeZf+crjh7k9+
         jcMUqMM6oYsGqWqJ4Ja9Jb9fHkp2+XUvKMGhrCMhWNKpp1BW0KwmXeqG102o8EYu/jw+
         LGgRFecujcILIYCuRX7Eja0CgnuFUm3wkznuurLeZgrCsglV6eLkeP4KGSIEJIgXDrVP
         /20wHg9+Csp31GAS9htJL1h8P6L6iaKanWW+EmxO200/VefzY5IIR3hURq+KSN6hDrdy
         UktHcE4f7aKYUz3Qu114MGu2gK6ooRjy5H/vUpbY567WeASL3w29U/kLibcayKwQMbE6
         3rIw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=j5TGRkmJ9uWRpiv0lmeldhRJrZ+cIiXJoGf5IZw7Rj4=;
        fh=4WZmI0U6Tp40thfyCsgaGJ2gFUhqZhiS6fR8A6wcm7M=;
        b=CIphBZkaO9/I7tsEAhyLgcfKtyXc+dGXKhktOAeZ+eMQwOiwfSwtLuLQ3MWR8g2W3e
         TpMGWhQmxEstwUPtYuERVbL1o71UrJ/M34s8Pty3om87mrR7pYJGX7ryNxVp2jcNGoaf
         hE226NN1oTID3EAEA8TKiQkdk+PrAhvCUa9Fi6I6JM3n14tB/ggvEok7CU7FrfAaQ8tg
         rxzStfk/fNHltapDoPE1FlCFsBj1wEKxEuB1WViCGxXTaqcQgSVJxl4qjgE4rEY6m3aM
         +m+1o/D/z6tAV42LmdNlOu2P/lyuIurIDBOK8rBHbOTsDdvIJfHLnrsqVMqpOHGTQNnp
         MrMA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776811249; x=1777416049; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=j5TGRkmJ9uWRpiv0lmeldhRJrZ+cIiXJoGf5IZw7Rj4=;
        b=mSGI8apJQChFqL1XdQGWrWYcx3KOor1ZQFHynhDd3nB1jjFike2X0b20L5E2bBV+dj
         FN+25tgu3wyP1kOjPz1aRpVWGCysLjzCXQu0w6UBK1hbjERCXgHvfehlPSZVRXdeExoM
         1v1guYmvVQs2pjSNpZPiBIBq8enJR52ppF7gydVYfNIPxLmGM2nlesQMDhzCgjVQM5Z6
         ifLXGPMzOXjhram/Le7co7dTJyzqjQnXciebe1PEeHkxKB9I1K8c4v7cL+EYBeR2D1aU
         VzE0tNc/wlH9Laoa6nBdPiNDL71SRO1Uhgxp1zJvtcMFB2IT2rU/OjCbg7P26o5mK6DD
         kljQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776811249; x=1777416049;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=j5TGRkmJ9uWRpiv0lmeldhRJrZ+cIiXJoGf5IZw7Rj4=;
        b=b9D/OVyLwthgQ1aT3eoJ0PU5HMu84f6lF9IPD7nWSM67UqB7Z5ikcYNPxudav1GBz6
         Rl1qkMIvMeMwXx3uvHCu23QvxNpUFtL0tuiGYwZw+S/WeDcFNPUGBJAITWsu9PHY2r0+
         brb81jAyJWK6qRTSZ0Ta+RL1EWCjjUFCwOSSMKklz0+dMSdEHtYPlkfK4Bo1voo6SZTb
         EJ/z6R4ZkR/9cmQhl8IhFaMCCne3+PN3H9VYXMin1csAntHzzCM5fWgM8yXWxxwNzfJt
         pLnCOZLDEPEyxbN7sWvUefBrzy0cCkLyzXIQdFRZVdNQv5c1gDoG+oaCERIkJPTDsbEr
         b+4g==
X-Gm-Message-State: AOJu0YxYl1jczSJZ4MX158y7rc5aMDjY8olyL3dGP1I+fC5JMlRUMqQ0
	PcnN+FEqIdBhASFIeHlnqKFLLJI8bTfd+2+qs7yinHLDLlgjbv6GMXQGQMuomIMvc3u7T6VG3eZ
	38kmn3ZDFRBv6BE6Ohmcip5ZBVtD8qY3e9bf5
X-Gm-Gg: AeBDievnzXDIBUtve1xSjdUFBILi6cQGiRgY2TsVfc+O3SFiOBL6MXyXmX9QuLx4Gyx
	PQ5nCFgYZxIizNrYMs1hl3apfxnDbzUUainvVuI/QBCd5FW/vrgdhHazOgodjkTTpWiY/1th7JH
	KK6hfIsWGg+eXhcp+fFOr4CNJKg/oNWVzYBnyu5oPlKw3V6lQB/K2S7zR3cg+cP5C3DoPFjzByB
	/4KH+fRSvlTQg1bP/HVM1WHduZAD+wgamWG0+Qt7KQrgUStRRsICY7JzcHM2jyxmA9IpvpOQdaB
	KW0K4lhcicR39tE=
X-Received: by 2002:a05:690c:e682:10b0:7b3:ca3b:84a4 with SMTP id
 00721157ae682-7b9ecef6d27mr153454607b3.18.1776811248566; Tue, 21 Apr 2026
 15:40:48 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260418140420.2221736-1-ekffu200098@gmail.com> <177679993172.1520888.14733708891951658401.robh@kernel.org>
In-Reply-To: <177679993172.1520888.14733708891951658401.robh@kernel.org>
From: Sang-Heon Jeon <ekffu200098@gmail.com>
Date: Wed, 22 Apr 2026 07:40:37 +0900
X-Gm-Features: AQROBzDVEVIfqtQpaJQzlRXTThkeDG_e8vOsxomV-bixCvTyDOYMOjCl9UDlGLw
Message-ID: <CABFDxMEbEOY4JuFnfTVTBYttsKt1HDVJScwzE46xEfXU5jJeqQ@mail.gmail.com>
Subject: Re: [PATCH] of/fdt: remove redundant memset in __unflatten_device_tree()
To: "Rob Herring (Arm)" <robh@kernel.org>
Cc: devicetree@vger.kernel.org, saravanak@kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,

On Wed, Apr 22, 2026 at 4:34=E2=80=AFAM Rob Herring (Arm) <robh@kernel.org>=
 wrote:
>
>
> On Sat, 18 Apr 2026 23:04:20 +0900, Sang-Heon Jeon wrote:
> > All dt_alloc callbacks passed to __unflatten_device_tree() already
> > return zero-initialized memory.
> >
> > - kernel_tree_alloc uses kzalloc()
> > - early_init_dt_alloc_memory_arch() and dt_alloc_memory() both use
> >   memblock_alloc()
> >
> > So remove redundant memset after the allocation. No funtional change.
>
> That is true now, but it wasn't the case before memblock became used on
> all arches.
>
> I've updated the commit message with this info and applied.

Thanks for spotting that and for your review :)

> Rob

Best Regards,
Sang-Heon Jeon
