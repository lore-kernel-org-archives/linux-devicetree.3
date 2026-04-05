Received: from mail-ej1-f46.google.com (mail-ej1-f46.google.com [209.85.218.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1F1C8384253
	for <devicetree@vger.kernel.org>; Sun,  5 Apr 2026 22:50:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775429410; cv=none; b=situh+kCtnLOxRverAAu7D0nI7hLCJDhLvFuw2FHNC/Xp5WlGQqf8sFwIsfl/PRfis3dKcZnywzd5uw18FrFbQgXlCSE2O/SbH1+6+X/RRSgKB6qJJyOupNNTwnWK+jxwiD1IrYX5KAM3q4KIGI6xsqc4z3/8onE8XaO2zLECio=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775429410; c=relaxed/simple;
	bh=zzMy5NtaL7AD5tUyCQ9LrBMAHeKvVDbZmilsbp1EV5w=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Yg1VuOKJQvvcx5hSt4b6+NdvXCmHprivGCegXUPjhlVAlWUFszxwohathUGFg+UL53FNrftcllsrjGLMSl8fCI8xMEaFfF49LR347a7gqPzwapxy+orLLrStJFT7oha9/tKqOJIpd1KkvOHnK5jfshwBrhvbhWcPYpiFgmS+3Zo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=OObUrT05; arc=none smtp.client-ip=209.85.218.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="OObUrT05"
Received: by mail-ej1-f46.google.com with SMTP id a640c23a62f3a-b97f9587e6eso457776866b.3
        for <devicetree@vger.kernel.org>; Sun, 05 Apr 2026 15:50:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1775429407; x=1776034207; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jzjlDiAhhtCwD9FkXK7yFaosCzkOtMCSogVYlSJljQY=;
        b=OObUrT05S7fuRi1mlMN+MlDPcS1LAFkK4VFG3VdUzFGsRuI/0ffD9Fv4v1ePKwjCGZ
         D7LpP+8VrrdbXWhryUEgpNk0EwGYpV9h3OkNd4E1PMwPxKMCj0nZ+4jdCByG1jiBRUSe
         5h/HJEo2BsiCUXrkJbNGdEN+PWeOD4ZX4EqNM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775429407; x=1776034207;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=jzjlDiAhhtCwD9FkXK7yFaosCzkOtMCSogVYlSJljQY=;
        b=hnHjVcgsi/OI42mfyxd83QpQEfKZxWbywZR37cU2Jl/Ck7Yk3SVN33uFtRIikh9oqM
         Qmc5/YKvrzLyRprsyNPZKFrY4+S+sIC7jTVc0PrC+2AA+InXbhsbgg39/iR+TYf4BBb5
         UNsQQOnboDnZoO5iXJ9mqVVikVtlSCKPyNcttXJjpw+cf4jhG3/omUeWZYPLqW/61Fa4
         W2Czk9q6gfumMB+P46TLSG9CAnojpbDHzCAPTzaSoB1AY4G0BztkSaTpiHnU92qurTZy
         ETojpQS/a2FnuubFFlrp627gBN9ntNhLldD5mrzToX8nR8zD+GRI40T35xxEUBFnPJts
         /l2A==
X-Forwarded-Encrypted: i=1; AJvYcCUbDb5pYvyzyZoz7tU7WkrCuXckD4tnkYz36BRRgrgYeuPEsNe12TH5hLoFou2G5Ev0v0+GyWemGxX+@vger.kernel.org
X-Gm-Message-State: AOJu0YwmnSU2idrMFcM7NGYnpQpTPuXAnQMkDBpPO+U2tDd/z/g8ywE4
	knoeG7e7tgKbsYFbPj8CWjuK9vK6OO0Ee662HwG2T0OLYaO9PfGN4nXxVuIuMRqeYxatcjv2XBS
	BB1ODxGee
X-Gm-Gg: AeBDieu0W/sGRmUzMHQ13hIfkVhT2AfCX/o849uGvSwrw3SS3Ue3BZi15ufGUEoXuV0
	or8uXSt9TorE/WGjHm60GXyW0FSDJ6l8ozqBsW2GJcw0TNtcPCENZGicrLkUp4+HWP9sNr40m4/
	Y5j0P5mxbqfa+boGrbr5+RtKt+p8XjMhy4lgajla4OkRaG4bAZOzA7SpUo6Kln3PoxoO6KH/4pk
	sYfr3ieV7umHdseFBC7BScg7MOH7AQgJ/rymECrhBi1TgwkvndPs3fbQuLuslRwiZpn1+xpFT5C
	vK+nxdDyXxga532DvbHP16/0tBv30t8oGg8r9fejrPKY1dPzRdwwgQ9uClfdWmIdAOfBPiHGfSp
	CclHanZWb6mX4+yXmXsFGUZFcydLP5Ri6oXrHO9ZgQXWO+KIOhuMdWAKRkB16RuP8SgUaD1dlmY
	sC8monNzFJZ01gH3PxZ7JiQJLkJe/5gq0G2NALxrLgFocZvvp90VnYduILFakZUw==
X-Received: by 2002:a17:907:d40f:b0:b97:b379:b3fa with SMTP id a640c23a62f3a-b9c679f62d8mr592200366b.39.1775429406865;
        Sun, 05 Apr 2026 15:50:06 -0700 (PDT)
Received: from mail-ed1-f45.google.com (mail-ed1-f45.google.com. [209.85.208.45])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b9c3c99fb00sm433840966b.20.2026.04.05.15.50.06
        for <devicetree@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 05 Apr 2026 15:50:06 -0700 (PDT)
Received: by mail-ed1-f45.google.com with SMTP id 4fb4d7f45d1cf-66bb6eb28acso6182817a12.0
        for <devicetree@vger.kernel.org>; Sun, 05 Apr 2026 15:50:06 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCV6loFZEuxoKf4xlc9nt1Z8o4HL0xwrK7ixFp6V5WkfsGfN5HfPymW4YHCG1iFE6QP/tg0eSgto4X9J@vger.kernel.org
X-Received: by 2002:a5d:5889:0:b0:43b:47ee:4586 with SMTP id
 ffacd0b85a97d-43d292d34e1mr14051064f8f.29.1775429026066; Sun, 05 Apr 2026
 15:43:46 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260404000644.522677-1-dianders@chromium.org> <2026040539-sponge-publisher-2b42@gregkh>
In-Reply-To: <2026040539-sponge-publisher-2b42@gregkh>
From: Doug Anderson <dianders@chromium.org>
Date: Sun, 5 Apr 2026 15:43:34 -0700
X-Gmail-Original-Message-ID: <CAD=FV=X6DRHV6k7G=p5Mno22na75G-69F-EzMkisSxMoxuvJcQ@mail.gmail.com>
X-Gm-Features: AQROBzBHjVedWun0AWH98b5RajBbraAAaRvLQSenEhaNEY8p1Czch8mAczvPiQQ
Message-ID: <CAD=FV=X6DRHV6k7G=p5Mno22na75G-69F-EzMkisSxMoxuvJcQ@mail.gmail.com>
Subject: Re: [PATCH v4 0/9] driver core: Fix some race conditions
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: "Rafael J . Wysocki" <rafael@kernel.org>, Danilo Krummrich <dakr@kernel.org>, 
	Alan Stern <stern@rowland.harvard.edu>, Saravana Kannan <saravanak@kernel.org>, 
	Christoph Hellwig <hch@lst.de>, Eric Dumazet <edumazet@google.com>, Johan Hovold <johan@kernel.org>, 
	Leon Romanovsky <leon@kernel.org>, Alexander Lobakin <aleksander.lobakin@intel.com>, 
	Alexey Kardashevskiy <aik@ozlabs.ru>, Robin Murphy <robin.murphy@arm.com>, 
	Andrew Morton <akpm@linux-foundation.org>, Frank.Li@kernel.org, 
	Jason Gunthorpe <jgg@ziepe.ca>, alex@ghiti.fr, alexander.stein@ew.tq-group.com, 
	andre.przywara@arm.com, andrew@codeconstruct.com.au, andrew@lunn.ch, 
	andriy.shevchenko@linux.intel.com, aou@eecs.berkeley.edu, ardb@kernel.org, 
	bhelgaas@google.com, brgl@kernel.org, broonie@kernel.org, 
	catalin.marinas@arm.com, chleroy@kernel.org, davem@davemloft.net, 
	david@kernel.org, devicetree@vger.kernel.org, dmaengine@vger.kernel.org, 
	driver-core@lists.linux.dev, gbatra@linux.ibm.com, 
	gregory.clement@bootlin.com, hkallweit1@gmail.com, iommu@lists.linux.dev, 
	jirislaby@kernel.org, joel@jms.id.au, joro@8bytes.org, kees@kernel.org, 
	kevin.brodsky@arm.com, kuba@kernel.org, lenb@kernel.org, lgirdwood@gmail.com, 
	linux-acpi@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-aspeed@lists.ozlabs.org, linux-cxl@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-mips@vger.kernel.org, linux-mm@kvack.org, 
	linux-pci@vger.kernel.org, linux-riscv@lists.infradead.org, 
	linux-serial@vger.kernel.org, linux-snps-arc@lists.infradead.org, 
	linux-usb@vger.kernel.org, linux@armlinux.org.uk, 
	linuxppc-dev@lists.ozlabs.org, m.szyprowski@samsung.com, maddy@linux.ibm.com, 
	mani@kernel.org, maz@kernel.org, miko.lenczewski@arm.com, mpe@ellerman.id.au, 
	netdev@vger.kernel.org, npiggin@gmail.com, osalvador@suse.de, 
	oupton@kernel.org, pabeni@redhat.com, palmer@dabbelt.com, 
	peter.ujfalusi@gmail.com, peterz@infradead.org, pjw@kernel.org, 
	robh@kernel.org, sebastian.hesselbarth@gmail.com, tglx@kernel.org, 
	tsbogend@alpha.franken.de, vgupta@kernel.org, vkoul@kernel.org, 
	will@kernel.org, willy@infradead.org, yangyicong@hisilicon.com, 
	yeoreum.yun@arm.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,

On Sat, Apr 4, 2026 at 10:28=E2=80=AFPM Greg Kroah-Hartman
<gregkh@linuxfoundation.org> wrote:
>
> On Fri, Apr 03, 2026 at 05:04:54PM -0700, Douglas Anderson wrote:
> > NOTE: one potentially "controversial" choice I made in some patches
> > was to always reserve a flag ID even if a flag is only used under
> > certain CONFIG_ settings. This is a change from how things were
> > before. Keeping the numbering consistent and allowing easy
> > compile-testing of both CONFIG settings seemed worth it, especially
> > since it won't take up any extra space until we've added a lot more
> > flags.
>
> Nah, this is fine, I don't see any problems with this as the original
> code kind of was doing the same thing with the "hole" in the structure
> if those options were not enabled.
>
> > I only marked the first patch as a "Fix" since it is the only one
> > fixing observed problems. Other patches could be considered fixes too
> > if folks want.
> >
> > I tested the first patch in the series backported to kernel 6.6 on the
> > Pixel phone that was experiencing the race. I added extra printouts to
> > make sure that the problem was hitting / addressed. The rest of the
> > patches are tested with allmodconfig with arm32, arm64, ppc, and
> > x86. I boot tested on an arm64 Chromebook running mainline.
>
> I'm guessing your tests passed?  :)

Yup, all the tests that I've run have passed. I also threw in an
"allnoconfig" compile test just for good measure.


> Anyway, this looks great, unless there are any objections, other than
> the "needs to be undefined", which a follow-on patch can handle, I'll
> queue them up next week for 7.1-rc1.

Thanks. As per the other thread, I'm happy if you or Danilo want to
apply it, and I'm happy if you want to make minor fixups when
applying.

When I see the patches applied, I'll send a followup patch to address
the "needs to be undefined" comment, unless Danilo makes that change
himself when applying.

-Doug
