Received: from mail-yx1-f51.google.com (mail-yx1-f51.google.com [74.125.224.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 29E0B2BE053
	for <devicetree@vger.kernel.org>; Thu, 16 Jul 2026 04:31:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.224.51
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784176309; cv=pass; b=Mj+J6fQhTI2ERUX/Ar7Nxd9r1tn+5hJcBbQsKXJ25ZcOIjniKgYI2kzB+d7uwHt2nRdMh9JgyWVYEtmwUqxiEcAYIv/pdAt93P7+s+F7sTa8vg2RpVufOxNz8Ad0Il4Fo/EAYdDj+A711ugo0BwIt4BF8TT8kgmpMZKYlKZVQCQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784176309; c=relaxed/simple;
	bh=nhYyNn6r73D9XtB76IT5BMo5NhG30UFFcOOZMpuXDho=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=M6pyQr0cyLioqIJixavDVqIcKD+pm9LtdiqrTrwuC3Xnkgf8JbKf1/ETweNcPT3dkn80koXUrQy/5VNBkzsy/fyUJEp3ICkZ6g4m9CUFf6zsNArLoTfAHVuERM7M3OL4FMRN+e6Nnv809MrfiZB0EwtFfFfLPzyuhvBNG2qm7B0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=BbIlmPiT; arc=pass smtp.client-ip=74.125.224.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="BbIlmPiT"
Received: by mail-yx1-f51.google.com with SMTP id 956f58d0204a3-667ef69424bso4816959d50.2
        for <devicetree@vger.kernel.org>; Wed, 15 Jul 2026 21:31:47 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1784176307; cv=none;
        d=google.com; s=arc-20260327;
        b=KRnuQ/lYmdqZJ0bm95Pa9g4mUFK015KpecR/94be3qCeeR9FZO2LDrFWaD155QqTUk
         IMortnNCpcHZ9ppMBJe0dBESwP3RHrrJpnINjepX8Qwzqk9gS4kNJc2RB8pSc9dL/6qL
         ATc2mtME2g+/jqh+8/UPac81cjUeVhU1G+LQYIZ2GOqPkeUvfNN8fi21VAemt5hEtODQ
         Z/gbM0UXQuobQ+4yXLWOv2Cs1pD3sJ9Xo1GF90cT+y51ER/kUd5V9XykmsS3zXA6mg7r
         ljEtMGlX+Sf2HzSsf2mLr1Riec2nc4NFaRdgobj6oN6yTB6CAuHdiPsVjh72+yGwWdUh
         Vmxw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=cWTekTqlq1/95QNv5fW/dcyHl3msvMXWSc0NTUyJpNA=;
        fh=v8t7a7rFcBcd+/cwg0Z9XKXq7rm2RK0p0MRUDzh/mHE=;
        b=BGPCLwBER6SIR6flPGKpAGh5g8Z2yHaBq0aOG4q/ysWOp3YqXrKb1JoJ5j0iXtXCdb
         +8Qx5WWW+T8mmaHk1BP9YLFfbDO51+OEddYEyZXwJ5lMkoXsbfSLuIWPfNxtY2qeCI1u
         YAqrhOG9/lztzXpov/GW4w4Ub2V7DLdGwVZFSCtYmyXmCQt9jCf/9GS3yuYzsLKyRy2D
         uw25ZvttqqgevCDsG0zvbAJLGOKWlze3/uCVxbNxGCxg13anc+9RjFqlLQY+SGvH238S
         DdisKT52HEWGdS2bEQ39hstfJfcxB/sRN6LP7q66iwVxfkU/4TxHF9xLkwoGnsT93sGy
         8TVg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1784176307; x=1784781107; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=cWTekTqlq1/95QNv5fW/dcyHl3msvMXWSc0NTUyJpNA=;
        b=BbIlmPiThl4qtC2ZN7JQZl+L2ZooPvu5YEwEDvQfZB+ebI+hS/c29Vq0ahKfNxgu3H
         Y2dKQR08UIvbW04KcyCZxX8NOGetwY5g3XdreHta5FewJNT1+6IGkqv4QqXcQKnXrya3
         CREYMhgoOS0wLEmkqgUzYoB3Kjlg3MA3uZjMk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784176307; x=1784781107;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=cWTekTqlq1/95QNv5fW/dcyHl3msvMXWSc0NTUyJpNA=;
        b=at0Uez+2UMNRDspLfl1xaIiHSUqHIaTgpLYMrE/sY7DJ7pbMsvKJUITES0QgffjVfZ
         NWUhh8VeF1b/cubO7PUHPMGxl6zSA6rSek9+CgrvSeqfw+jfR3sdDBWWcDFaJ+Y3h/5N
         AGdn+wxWe+8X20YQu7siDQuGSrw7WU9J5fnIKn7okBms8sbKQyGGBUdEW9AT2neYTIRM
         OvylY4ekazIZi862XgwFWpvvfxkTdyJvIdmKrpYSOosI5sAWdgZre+HfeTVDniMYgBco
         6ZbljwHWAO91uqTT+EhrXtGu61t73urfinJQxMPCEuwbKTsYR9PZxDYrvgfgZr0HPqKG
         5rAw==
X-Forwarded-Encrypted: i=1; AHgh+Rog/SqsTYpuoBMxTrDrTNQiKD5cqsi6Km90JlBrrJLiAvvDYnAakaIb1FE6IJGh1zEg9Dkf4X/JQeff@vger.kernel.org
X-Gm-Message-State: AOJu0YxeQQtOuKSs4hKA4KEQz6XQmD0ihaR2kKPMW05T35vKRIk7bSqg
	Mj0XLFneioHV1rZ5JkBISHBuLUATJ9ttNmeSjmTjBsB5PjsEPtYMmw2+DlwitFrf22OcJdtjwda
	7j+wPJEKzswr/if0wj46A4BxBDj5ppbu483BRGIP5
X-Gm-Gg: AfdE7cle1ncuQO02vyajmbzTeZdx3hMYacsA+LzFFFne1mfXnssYvfcxfkcnce+NMca
	qzH+bbb5U6v03oDkHJNifJTnC9R38lpBtq0NlTf9XTE1s04cmmZvm0ERxJfxF7x9b8Or1E6Jmpk
	srXjQXq8V/0h2GdRHra8BpVjAKRCxq561RsWMav4v5gk8zrnaV+SX95TohkBmG+Vdqk7T+ASINj
	k30qOAcHcsDFZbACywOqQWwPmmOU9fTg2JmhS+oEfu+OiqIzlod0z2EvL4BpyZ5r3WLBghUN58Y
	IyL49QxZktxVTYaO
X-Received: by 2002:a05:690e:1c0d:b0:668:19ff:7eff with SMTP id
 956f58d0204a3-66819ff937dmr2943635d50.38.1784176307120; Wed, 15 Jul 2026
 21:31:47 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260715085348.3457359-1-wenst@chromium.org> <20260715085348.3457359-7-wenst@chromium.org>
 <aldQ5odptfmK5aCw@ashevche-desk.local>
In-Reply-To: <aldQ5odptfmK5aCw@ashevche-desk.local>
From: Chen-Yu Tsai <wenst@chromium.org>
Date: Thu, 16 Jul 2026 12:31:36 +0800
X-Gm-Features: AUfX_mzQbv55XMQ4uR8jO2hQgRvrbYnVnLlttvP6FASpWrSMQxMLCCNzy4VYT9I
Message-ID: <CAGXv+5FAHZP-u1ZyWSUkUrOx7R5-YgBs5y9V4mGTycyrJG3UKA@mail.gmail.com>
Subject: Re: [PATCH v5 06/16] usb: hub: Associate port@ fwnode with USB port device
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: Bartosz Golaszewski <brgl@kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Daniel Scally <djrscally@gmail.com>, Heikki Krogerus <heikki.krogerus@linux.intel.com>, 
	Sakari Ailus <sakari.ailus@linux.intel.com>, "Rafael J. Wysocki" <rafael@kernel.org>, 
	Danilo Krummrich <dakr@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
	Wei Deng <wei.deng@oss.qualcomm.com>, linux-acpi@vger.kernel.org, 
	driver-core@lists.linux.dev, linux-pm@vger.kernel.org, 
	linux-usb@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, Manivannan Sadhasivam <mani@kernel.org>, 
	Alan Stern <stern@rowland.harvard.edu>, 
	Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Jul 15, 2026 at 5:20=E2=80=AFPM Andy Shevchenko
<andriy.shevchenko@linux.intel.com> wrote:
>
> On Wed, Jul 15, 2026 at 04:53:36PM +0800, Chen-Yu Tsai wrote:
> > When a USB hub port is connected to a connector in a firmware node
> > graph, the port itself has a node in the graph.
> >
> > Associate the port's firmware node with the USB port's device,
> > usb_port::dev. This is used in later changes for the M.2 slot power
> > sequencing provider to match against the requesting port.
> >
> > To avoid potential conflicts with ACPI firmware nodes and then causing
> > power management issues, only assign the firmware node if the hub's
> > firmware node is not an ACPI firmware node.
>
> ...
>
> > int usb_hub_create_port_device(struct usb_hub *hub, int port1)
>
> What about adding
>
>         struct fwnode_handle *fwnode =3D dev_fwnode(&hdev->dev);
>
> to the top of the function, and...
>
> >       port_dev->dev.driver =3D &usb_port_driver;
> >       dev_set_name(&port_dev->dev, "%s-port%d", dev_name(&hub->hdev->de=
v),
> >                       port1);
> > +     /*
> > +      * ACPI FW nodes are associated later when device_register() happ=
ens.
> > +      * Skip assigning one here to avoid potential conflicts.
> > +      */
> > +     if (!is_acpi_node(dev_fwnode(&hdev->dev)))
> > +             device_set_node(&port_dev->dev,
> > +                             fwnode_graph_get_port_by_id(dev_fwnode(&h=
dev->dev), port1,
> > +                                                         FWNODE_GRAPH_=
DEVICE_DISABLED));
>
> ...shorten this a bit to

Makes sense.

>         if (!is_acpi_node(fwnode)) {
>                 struct fwnode_handle *ep;
>
>                 ep =3D fwnode_graph_get_port_by_id(fwnode, port1, FWNODE_=
GRAPH_DEVICE_DISABLED);
>
> // Is NULL or error pointer is fine here to be set as fwnode in port devi=
ce?
> // Perhaps add a comment?

fwnode_graph_get_port_by_id returns NULL, but not error pointers.
And passing NULL to device_set_node() basically erases the current
associated node (which is NULL anyway, since we just created the
device) so it's a no-op. I'll add a comment.

ChenYu

>                 device_set_node(&port_dev->dev, ep);
>         }
>
> --
> With Best Regards,
> Andy Shevchenko
>
>
