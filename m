Received: from mail-yw1-f170.google.com (mail-yw1-f170.google.com [209.85.128.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D6C082F8EB3
	for <devicetree@vger.kernel.org>; Fri, 12 Jun 2026 07:20:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.128.170
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781248832; cv=pass; b=OrQB6ycoaAiw+C58deKm80KSw/LtqQwGgQSwC6Hpy3nwHORm7/H0N7Mm0EJvnrv8YHnEnu1TYveKIt0wrRQsB3sihEZJPlcx8WcN1Q8DrAPXjySkI2kcIaCU6E5gtnW2365Po/uMhXMZSO2BkycRvMTqgN0zM0FFLywvZL7wslw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781248832; c=relaxed/simple;
	bh=IkWHCCFQX7aMDTxBgQKIawFEFZfCBBbHv2LydgIraqk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=f0V+z6E3I82AjbRZKjK9vpIju555hwybl1l0vbzgaP+Q1mDg5afjOget8ItGpKPvaiSM+CSKbnUHrdwT1d6Flc82nT3QgzZot7xT4oQZfxCeXQXDvS3XYdWsbSt8JOI2YSqTk6lz8vSVnQBJYpw+FqsMfK8CIoMgug9jNPSRHao=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=Oj4GuGzD; arc=pass smtp.client-ip=209.85.128.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="Oj4GuGzD"
Received: by mail-yw1-f170.google.com with SMTP id 00721157ae682-7dc6fbf3e86so7901717b3.3
        for <devicetree@vger.kernel.org>; Fri, 12 Jun 2026 00:20:30 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1781248830; cv=none;
        d=google.com; s=arc-20240605;
        b=IBiY2qcnwE9ME3dPTl6f7eFAmAiZbFS/SOgCp8RBSA40HW0/zUUF7tC+b46wV99ead
         FtiOMcr1cxvWG29DWlFBWNYb6aMuriwLvEtMuPfszv+0Qmmxt/SEy0/GojnMvTxFMKCE
         sohmu97sWivJQbrXyox/CL/UvjIw5ngS4J9ZVEIRavkHn9iDNFI4gfH1S55nY3sb4sAs
         V2RromzhbyKTfzS3N9ictv3siRGfjucHZy25A6fVf4zLXLp1fLaVntfOCBlxqvFsSdY7
         exgeaEDJZ1WUoVqE+ljiyullRZ+qTOuXRAJgnbrmhzzQJDfUlfZeLNYaZMtBZxWI17HU
         Q4gA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=PEcj4bZjlu2HtgA6/DpQKuZoEr9jILxBgREI+9hl/bg=;
        fh=y6yU9/ihgPODozzvAVIQF6Nia4OGnXazLxiSCfTvVeE=;
        b=CgEkq2dVtTI8/U2FEX0HmOGini4EkkXs69Gi8yRpgQCSxkCWjG+GDcfOvvzVGn7G55
         EkXZ39NmqNpKbNhDUxuS3aw1Iqs+CnRvVxmM9d10tTMFx4dMnZcNpd4B3uAD3ujMOxVq
         7XF3DuLgEu37QgFdbhyL4XH1zojP+laUwky++FsN33+cfxLPsMXsYHZnCOBGs8xl/T/M
         jix5I2CW4HLYqVQ4HJ2PMjhMuPdghY1G9pZoQ2QV9jQCA/to5liYZ3vhyBy5yGQMS42t
         eynK2lnlfapOFmmUJ1nWCP8iLtsKX9DDCqpQGyJVvY90AVJdC+s+uN5CyfD0cCzCfKb/
         9sqQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1781248830; x=1781853630; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=PEcj4bZjlu2HtgA6/DpQKuZoEr9jILxBgREI+9hl/bg=;
        b=Oj4GuGzDu9GI26DqlprSNV/s5e3UxGAX3WAvF5EG3Eog+1hSTDfzsXpVg87iTTjNlf
         v8jWX1Dd+SPcZvi25Y2OkVchGb6xU6Sg8YfVmgsfJ99CLZH8s5qOmu3/P68rcrtYPtxS
         k85chdfol8gkgjb95XHASHkvZ+YTtvZKmW/tU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781248830; x=1781853630;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=PEcj4bZjlu2HtgA6/DpQKuZoEr9jILxBgREI+9hl/bg=;
        b=pxIwW6ddcJ/XSVRMIuZRkjkeFV/6+eFnqaHNKNu4EGd5Jt8S6a0zBN1KPoMeWmRgVY
         RgsjZqGp5F6kQjQ68ufjZ2sFRPS7aSm53KRxSHeYS65U8ZDilYuFwjI2Tw59rueJHPZ1
         ZLWFBxOkJZAT96HYR0Kt+mKwmZtikhTqKfn+lseyNaddYc6DWLj9KyUFfiN7zQff4vuT
         5mFHH0c2NeFINbE6yC+wSynXxWIIQJGmG+70OwNFYPc0C7zSr2swD9XLeE7Qd1EuBcTZ
         7IyZJ5rD85570XwDjSZQgVNmENKaeL2GwZatIpGkbCmHR0eGlfGqnJIwflLU6q0m0Ph9
         wzpA==
X-Forwarded-Encrypted: i=1; AFNElJ94FkClBN2q+y7jwox6MnsWyruPguOiBiQI63JDAd+ynAnsMpoXxjr5+h5EPCsMp4zNch5TZYpr4Xsn@vger.kernel.org
X-Gm-Message-State: AOJu0YwV6wfo0imKu8s3Zu2ak+ULZb35T7ob369K/uZxxdIhhFnNuS7Z
	AxK0RhtN5GBGBIqP64kTnrqESblMk/CQc6budOA/zbiVd3TYmj9UlQPbu6qih0kM2ytgyTK9Nv0
	4jZV7WS4wnfzD031wcLvG1fRHoKuZ7gM/Zoz+E8lt
X-Gm-Gg: Acq92OFhEXUlMThqcKoRP3lLJOFMkuWl2fFbUUQrjoB4EQ0qDL0LP2bRN/HnDFv0z2Q
	RQDVv/HnyUfBiqkGb6uh49Pw+OKotOU4Tu61i0spwj7A2ejtvo67v9/8M+8xjVOx+DKud8LWl3M
	h1n4WrXHAykqdfa2k60lUXozJMr0QtWl6DKPremHcr1EATeUA8AbNLrCboPdaWYP6SV7U1FaB+s
	D7rkdZfYaBj8XbCF43ngqbAEDy+kPhnRImlc3gQl+LDd7GimefmDck72s7aFQzSYwubgDBx/fuz
	H3tFQXds
X-Received: by 2002:a05:690c:c4ce:b0:7ef:81dc:c0e7 with SMTP id
 00721157ae682-7f7b6242881mr15277067b3.19.1781248829675; Fri, 12 Jun 2026
 00:20:29 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260610084053.2059858-1-wenst@chromium.org> <20260610084053.2059858-3-wenst@chromium.org>
 <ailv8HpnrCH3Zb8C@ashevche-desk.local>
In-Reply-To: <ailv8HpnrCH3Zb8C@ashevche-desk.local>
From: Chen-Yu Tsai <wenst@chromium.org>
Date: Fri, 12 Jun 2026 16:20:18 +0900
X-Gm-Features: AVVi8Cfix6rlRxpmlL_G61si3smqjEz2qk3oIH1X9DTqc3HutmT3uL6lEMZg0_I
Message-ID: <CAGXv+5EHHWfiWgqPpf-RMKoSQLc2cd9OA4Z36SNoL5C53kVh2g@mail.gmail.com>
Subject: Re: [PATCH v2 02/16] device property: Add fwnode_graph_get_next_port_endpoint()
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: Bartosz Golaszewski <brgl@kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Daniel Scally <djrscally@gmail.com>, Heikki Krogerus <heikki.krogerus@linux.intel.com>, 
	Sakari Ailus <sakari.ailus@linux.intel.com>, "Rafael J. Wysocki" <rafael@kernel.org>, 
	Danilo Krummrich <dakr@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
	Alan Stern <stern@rowland.harvard.edu>, linux-acpi@vger.kernel.org, 
	driver-core@lists.linux.dev, linux-pm@vger.kernel.org, 
	linux-usb@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, Manivannan Sadhasivam <mani@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Jun 10, 2026 at 11:08=E2=80=AFPM Andy Shevchenko
<andriy.shevchenko@linux.intel.com> wrote:
>
> On Wed, Jun 10, 2026 at 04:40:36PM +0800, Chen-Yu Tsai wrote:
> > Due to design constraints of the power sequencing API, the consumer
> > must first be sure that the other side is actually a provider, or it
> > will continually get -EPROBE_DEFER when requesting the power
> > sequencing descriptor.
> >
> > In the upcoming USB power sequencing integration, the USB hub driver
> > first needs to check whether a graph connection exists, and whether
> > the other side of the connection is a supported connector type. The
> > USB port is tied to a "port" firmware node, and this new helper will
> > be used to get the endpoint under the known "port" firmware node.
>
> ...
>
> > +/**
> > + * fwnode_graph_get_next_port_endpoint - Get next endpoint firmware no=
de in port
> > + * @port: Pointer to the target port firmware node
> > + * @prev: Previous endpoint node or %NULL to get the first
> > + *
> > + * The caller is responsible for calling fwnode_handle_put() on the re=
turned
> > + * fwnode pointer. Note that this function also puts a reference to @p=
rev
> > + * unconditionally.
> > + *
> > + * Return: an endpoint firmware node pointer or %NULL if no more endpo=
ints
> > + * are available.
>
> Yeah, you see, even here is inconsistency with previously added kernel-do=
c.
>
> > + */
> > +struct fwnode_handle *fwnode_graph_get_next_port_endpoint(const struct=
 fwnode_handle *port,
> > +                                                       struct fwnode_h=
andle *prev)
> > +{
> > +     struct fwnode_handle *ep;
>
> Unused?
>
> > +     while (1) {
>
> This is usually harder to read and follow. It's like "pay much attention =
on
> the code", but here no rocket science, no code to really pay attention to=
.
>
> > +             prev =3D fwnode_get_next_child_node(port, prev);
> > +             if (!prev)
> > +                     break;
> > +
> > +             if (WARN(!fwnode_name_eq(prev, "endpoint"),
> > +                      "non endpoint node is used (%pfw)", prev))
> > +                     continue;
> > +
> > +             break;
> > +     }
> > +
> > +     return prev;
> > +}
>
> So, this can be rewritten as
>
>         ep =3D prev;
>         do {
>                 ep =3D fwnode_get_next_child_node(port, ep);
>                 if (fwnode_name_eq(ep, "endpoint"))
>                         break;
>
>                 WARN_ON(ep, ...);
>         } while (ep);
>
>         return ep;
>
> But also big question why? to WARN*(). There is no use in the entire
> property.c.

Will drop. This function was lifted from drivers/of/property.c then
adapted to the fwnode APIs, so it still has the structure of its
origin. With the WARN() gone, rewriting it as do {} while() becomes:

do {
        prev =3D fwnode_get_next_child_node(port, prev);
        if (prev && fwnode_name_eq(prev, "endpoint"))
                break;
} while (prev);

return prev;


Thanks
ChenYu
