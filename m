Received: from mail-yx1-f42.google.com (mail-yx1-f42.google.com [74.125.224.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C01623793A2
	for <devicetree@vger.kernel.org>; Sun, 26 Jul 2026 15:12:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.224.42
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785078773; cv=pass; b=Jbz8lD2nzMY7eYfreoHIDhKU7/a8r0ai+4KgIvCZG3Se/0GZRFYdjpfHcBop0EwHylfKqdBB8fR1TOS+2i4y3zC+Ex1UiDxX0NhdivyJO17X6pbeOx8sw6JqXy27VbU7wYM3jbkuGO4Mv3/Ey0ZVLN2KPtpR2DeBmGjX40OQAu4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785078773; c=relaxed/simple;
	bh=2+lGIOl9bO9ai/QZBVV+JyFRXvktL77GDN+YQ6CB1Xg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=p/mZ8IWg8R1hYg6/MO0CQPufKnKEG9IH+YNtbAUIJLpFJxl/GPfeEv77kL4FbvkU8lcNeHK1c87nyXY8O7Zs48lKqu+Yc4oRAIvvESwR3bEuYQLTIOD/ESN/Oxjxow92b7VbcChhDwgZYy//j/xrR1BATGWq97z0s263HLktm+c=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Sg9dAJiE; arc=pass smtp.client-ip=74.125.224.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Sg9dAJiE"
Received: by mail-yx1-f42.google.com with SMTP id 956f58d0204a3-664a5193741so222718d50.1
        for <devicetree@vger.kernel.org>; Sun, 26 Jul 2026 08:12:51 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1785078771; cv=none;
        d=google.com; s=arc-20260327;
        b=kOocBn5fUF7tvYPt6UnITk+j2o5MBp740p1eNpWjtO2vU9b+cekFOyuWPko1G4kYAY
         BuMtKH24BszHgSzpdiFfQzrzLqRQBb6tMC0wRIX1qucPQekUKoI540845eHYo3yVeHmi
         PaCJ06+eR1zXGLYss4Rmj5s/JcMwqKmoDyutbwpQrJclYNqE2JzBJSSIli7OM/v9zOox
         VW8K5YyyIAWTuIU3z7o3Dz0fnyhNnYcmFEb1z1kBO5vNEgFXcME5AROz8sPqXjH5G323
         e8NL6l/gqH0cRwKgW+o+OZMUGx+WkN2AMwEYVG5HkfGNWif65Vn7EfZwrh7XfD9qZQ5B
         4yXw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=WOuDrYfN3GLsqpf/rmh1B+LTpgsMcK+DLrhJbAcy2SA=;
        fh=xCI5RMKkqkRIjhDdP27R2r+mejtuHl1idBEDpxpHYgw=;
        b=In+LhSpZWjR76aeseDt5BI9mkqHccFowkhCq8g7r86ejrDmZmSskvJQSXdMR5Eg+vm
         VJlwlj8xkaHASWaxmIRlj6d174sWJD9SQ7JlvFGiQaqWqJEltW8U/HKlS/jYaJNi9+wH
         H9qezbHz3mKc6YgIT3zWVijABgn9R8xWu50dTrJL8ldb3f0ZUbSzKqSqdN1Wz2hh8MI+
         S3x9kclIZPlCxwDHMwjr7s5pbpBrtT9Hnogc8uGzwZfwvtz8PyYzk3KwO5dNHIRJu9aP
         oRm4dhFFz/VC8e91JKXH5WX8v/fLR6sn7KDq4cKC0G7Sku9dirYsiXA3nv0HX7GgOzDV
         4K/w==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785078771; x=1785683571; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=WOuDrYfN3GLsqpf/rmh1B+LTpgsMcK+DLrhJbAcy2SA=;
        b=Sg9dAJiE1Et9VLr9FO8JnNpaYt8o0WH+WqRYwYoRTuhTyqzDeI/vFxxidTyEGsyy5F
         WpERDlxCYddpurI58M2Uoh2a2FKdGLUV5XAFrdESYi9wIzTVLdX6n7mvUHMk9GiqoVuG
         vn5qqrA6TYOcd1UYGDdQlAizDWpYciq7AHtwIB5WfV/Ur2/VOumvHKr4OvHsWxTpb7JI
         xO1zd8pg0KV91Xxv65hdxivai38ohNCye8dyPjAtC+NZVMmI0RKkYUwYcAu46ER/CO4R
         uJNw3uktddOTiczUZ5W0o/SB6l/r8UDAuH9Xs3Z2i7pJTki22ObuPXbjjHYFbIjvFaN9
         Mu9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785078771; x=1785683571;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=WOuDrYfN3GLsqpf/rmh1B+LTpgsMcK+DLrhJbAcy2SA=;
        b=LLhzoNRS0Z6wVtb/XZu1gxeDui0HyeYZw3jVNwF7dj4nj+JsJ8I8KMY4DhlUBxhMoz
         MroIM5EunfBF/pmG9kxsn1GNbiQyESxKpEiWijmIgbTrHZAhvF+zHPh7finJm6r44Pes
         TIx/8z5xSIuR28d0qZ8lfHIC9aoYQpZE3qzne9fYx+rn0wPODq6FRcooBmyffkp/I9Mu
         KlnpQLYfjmiFORbHwMf6Bpdoq/I4v6E6u5sBgBD2eTAA61bNKMIjQeP5n39bqy+zTYIz
         QBRJhal/YRFRHRPJhJSJyg/qrdoLdJWNh7pua0BREF8iI66gINvHC+4CW8gauuEoVT+Z
         l4rw==
X-Forwarded-Encrypted: i=1; AHgh+RpgcUKbx+/vf7xM5V5CQv7SHaUp2gYbk/BRP0UsR2phyI032g1TavKmm4RLtbHLijq5PerrLwIMYaxb@vger.kernel.org
X-Gm-Message-State: AOJu0YwQiot6tTcy6OUxbo/nhgzsva5juw2uUakrOiBJxxiBNbqhAjaN
	YAakAjMaI7ZqfKiw3ukCsh/EjI3CQQytB5hH4CStmxdLO+FuQv+AAkRDOEuWPDzqkE1cvFmqvUg
	o6qdUX0CayUP7VyiYgoHtnZc9yp3sd58=
X-Gm-Gg: AR+sD132qVZ5snBgNFna0EEMEwFF42L+wrVGZIvvLlI0wJzd/ae62EjihYzYM7Tg82s
	gmpOnKgqDq0EnB7MVhkqlh0FgIptfy2Cy9LTzNPDPsP3baiOPzVMAQVJn9pBvomsMny+XzcPgfP
	NbC+cKOszyRcO9GuIjhZndZwbWB/UVWOyLKtyqtMFdfPpKz45NQZpfHqPCnWADwDYvtpQ2eRj9s
	SKE4MvbojCMK4CFpJ3GUK24VboDLq/Gsbwr3VQlaOcao86vjndTYoL0zQ97ORNWgmirBKkSt8RV
	hbFTYXMpUccr5Z+UY/c=
X-Received: by 2002:a05:690c:f07:b0:7fd:6d19:5a8d with SMTP id
 00721157ae682-81f69ee7e19mr14494537b3.8.1785078770663; Sun, 26 Jul 2026
 08:12:50 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260718085728.6797-1-royalnet026@gmail.com> <20260718085728.6797-3-royalnet026@gmail.com>
 <25922edc-4ff1-4d28-9a64-2c28b2b690cb@collabora.com> <CAEWPSH70FecQRuGtA=S8+_CnLY5sMyf1j57Uwzwv54zceS1HZg@mail.gmail.com>
 <b8d63f61-b73e-412e-8119-ced1afdd4551@collabora.com> <CAEWPSH5j3tYNb1JKRGwa00PVnYAgCKS+B-Qz07D8Z7TJea5cMw@mail.gmail.com>
 <1ac66aab-8985-4441-8ce1-07e2ea5183bd@collabora.com> <CAEWPSH4aB4KZsrLx2TESjPvUG0+A_Z_7uuO=5Rd-VidKU9U3eg@mail.gmail.com>
 <e1034df6-3801-424a-ba1e-a03d61b37222@collabora.com>
In-Reply-To: <e1034df6-3801-424a-ba1e-a03d61b37222@collabora.com>
From: Igor Paunovic <royalnet026@gmail.com>
Date: Sun, 26 Jul 2026 17:12:38 +0200
X-Gm-Features: AUfX_mxNMnv89FtlmOLwDPjkbtQHb2ya9M8N3iwV5LPYpxZcnxB0jJS_Wey_JPA
Message-ID: <CAEWPSH6BaPL+65Or+kVHGCdzRHrhaYSbZNfRwNTJQGWYvjnY5g@mail.gmail.com>
Subject: Re: [PATCH v3 2/4] media: synopsys: hdmirx: add HDMI audio capture support
To: Dmitry Osipenko <dmitry.osipenko@collabora.com>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>, Sebastian Reichel <sebastian.reichel@collabora.com>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Heiko Stuebner <heiko@sntech.de>, linux-media@vger.kernel.org, 
	linux-rockchip@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
	kernel@collabora.com, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Dmitry,

That's really helpful, thank you. The get_eld() route makes sense --
reusing the ELD path to advertise the single wire rate (either by
generating an ELD in the driver or teaching the CODEC an explicit RX
rate restriction) is cleaner than what I had in mind, and having
userspace see exactly one capture rate and resample on its own side is
the right behavior.

I'll follow that flow -- plug event -> signal stable -> rate from ACR ->
register CODEC -> get_eld() -- when I get to the follow-up, and I'll run
the hdmi-codec side of it by the ASoC list since it extends the shared
CODEC driver. I'll keep you cc'd when I post it.

Thanks again for the pointer, and for the reviews and testing on this
series.

Igor

On Sat, Jul 25, 2026 at 7:58=E2=80=AFPM Dmitry Osipenko
<dmitry.osipenko@collabora.com> wrote:
>
> Hi,
>
> On 7/24/26 02:47, Igor Paunovic wrote:
> > Hi Dmitry,
> >
> > Thank you -- and thank you for reviewing the whole series and testing
> > 2/4. It went through a lot of back-and-forth since the RFC, so having
> > it land with your Tested-by means a lot.
> >
> > I'll prepare the follow-ups as separate patches once this series is in:
> >
> > - The video_device lifetime issue on the V4L2 side (the devm-allocated
> >   struct with video_device_release_empty that the automated review
> >   flagged) -- as a standalone fix for the existing driver, since it's
> >   independent of the audio support.
> > - An atomicity fix for the GLOBAL_SWENABLE read-modify-write, now that
> >   the audio path adds a second writer to that register alongside the
> >   CEC code.
> >
> > The repeated-suspend wedge I mentioned in the cover letter I'd rather
> > send only once I have a clean, reproducible trigger for it -- it's
> > still under investigation and I don't want to send a fix ahead of a
> > solid repro.
> >
> > The dynamic codec registration you suggested (bind on the plug event,
> > read the actual wire sample rate and restrict the codec's rate) is the
> > direction I'd like to explore after these, once I've looked at what it
> > needs from hdmi_codec_ops.
>
> Good plan
>
> RE the sample rate restriction, hdmi_codec_ops has get_eld() that
> restricts rate based on HDMI ELD [1]. For RX we could tell the exact
> rate to CODEC without ELD or we could generate ELD in the driver, either
> way should require extension of CODEC driver with support of RX rate
> restriction. This way userspace will see that there is only one rate
> available for capture, so it won't be able to choose wrong rate and will
> resample audio itself as it needs.
>
> HDMI plug event -> signal stable -> gate audio rate from ACR -> register
> CODEC device -> ops.get_eld() returns our ELD
>
> [1]
> https://elixir.bootlin.com/linux/v7.1.3/source/sound/soc/codecs/hdmi-code=
c.c#L477
>
> --
> Best regards,
> Dmitry
