Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.221.169
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793139960;
	b=zUxwueGtzMzhhNJuwvvBjt5Pj8uHTeIu87oUtnAdZN9MVOIQe9gSdqRM0iBwGqDnGOfD
	 GvC7UekuNdACu9xeVZNe6jVSSBeVpkHh0XptgNYlLkfpHg3+nxfiVuQ2BkYWeQ+D9QzXT
	 QalF9YtTVyMNMyUDrYv6MCctbz8MIUS9FvqHZeWzlyB8QEdVjBA8mH9AHNAMFGbep/Qdj
	 aMQLrrVi1rQ6MMucP1VJBM/LFNqy7ThjiMeuyeblBQ4KFgeSbxAkbqJAr6sdlQ1beHHhE
	 xO4kqB3iVmW8Nd++R82h88qcLlPGh96Sb533KlyQuMf9PWjs9IE+FDzyzNSbBekc2Zg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793139960;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=foMtuJXLdxu7UI1j+IPfbjutuzhkAxYfoH1ISosJmU8=;
	b=C6LN1PoyIC1yXSlMnceKErPgFpGRA8mr/uEH3CGlAJnKBHZ4E3Vw4/fbwguiUuFDnANO
	 YV11Dp9yy4kUVxYhlNQhw9b8rCL3ZULdDwuenTT8qpfyfBcG2YXpe7dl2hpKWL4bShkdJ
	 mloNLlYJTu0knKu8aXldZzQOZsQgOHSN5Dink6RROOtt930UMzjNK7PyrQhb/ZZMCvAVx
	 oFaH7+S1Gn1V63g2rP3h5i2eGKpcM8L8ymodksNxVnXWClwaYsWBTATQQwD0aImwEUQf+
	 42hi2ubdjlL+Ouw7FtT47TSqsT73uTc29ltD/gdsjm7bbOiLKGOmPbnQXG2BDZGbypg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=f6G9JLIn;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.221.169
Received: from mail-vk1-f169.google.com (mail-vk1-f169.google.com [209.85.221.169])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4450D606A31F
	for <devicetree@vger.kernel.org>; Tue, 27 Oct 2026 22:26:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4450D606A31F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=f6G9JLIn
Received: by mail-vk1-f169.google.com with SMTP id 71dfb90a1353d-5eafa528803so166804e0c.1
        for <devicetree@vger.kernel.org>; Tue, 27 Oct 2026 15:26:00 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1793139959; cv=none;
        d=google.com; s=arc-20260327;
        b=LUuUbQGAsH5VJfbKdl7UZMCYv1MZr2rbqUWlXKoFRNxpN5iP1YxWpcVdxziCA/FUAK
         lSc3E68nrw85Sp0C5408gRbUaQwhKqy270946f9cWNk/9GV92wwpxaqF/6utqvi6Mo2V
         6qSjtINfiipYWigLpYi6UWi41RG5qterUY68pfwPgdpOaM/EzAkNjZfXErcHih4cubrJ
         7Ntm3jvK82NJG8tS9gaZRyzPC7z4QezH5TvGvePbRFKz8UXETUjU9aqP/KOLyJwqttG7
         1PP8j6n5r+ozogrAXLA/GYI85vOELsX1LxLrPpMLOG6yBwCrSYNQikD2d5LTYqQ2IHE1
         6jFg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=foMtuJXLdxu7UI1j+IPfbjutuzhkAxYfoH1ISosJmU8=;
        fh=Ex7eCWZVEjENiY6u1fKmISXg9wJII/d4RSe+LAZVmSY=;
        b=NNKJXMiaSF/+HWAakVCCZmPI5i+YvNSKJidajQOG4ifj9J6z/KOEDiOEx5xRpt3RgA
         RKTkumWLJJiO+ji1i/H3+ylS+Mt4DDBT7LaFRfyIBkGJI83F0/iQQ9XXnRTAQMlZgYC4
         TRBNNOtD5zUaLy9UrM4MbqN+2lsJWTzegxnOD7cs8aTYchFe5M0r/7uiNUwLOeaCo7h2
         UVMzuSPp29T4TJLlzDOii1pEiECsJZxLUfNRWds2QJx4BhwTYzoEKsVd0QfGXCpAka0b
         4dK3CL0s6BRAQiLsAqZsVLrDIs/sIUblQmqNp+QnAVrkIXyLPRXr1IOFCUEMczeYPJFr
         sxiw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793139959; x=1793744759; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=foMtuJXLdxu7UI1j+IPfbjutuzhkAxYfoH1ISosJmU8=;
        b=f6G9JLInPmaSge8xffSf6HZoWcpO8d6qi4TNYFtaxBEN61UfaMNheiokRQ8WIyRVGm
         fqj3gV5AbF8FR49SFOt+++JKsFDpRER2OP73qJqDoL5QOafpFdEtnISaF2buSi2WfuqI
         IrOZClVF7r6IUg2ylW9lpqEx3+AfRt7srQQ7bklsW9RThWKEI4kzVLabZlQxuYyjtXux
         DvOuLTFsRpOwnGufHeV4ugPhxQ1Yb1dxB7v9GbaYaQioisIMmy4Y2pjYydSqwdqXWtLP
         0kREAUAA9ZU4l12AeDUeqefL5uOU0cDxJEpGGZhQIjvQ6Yamtsw/7Q0zoTQENOuPPbu8
         8CHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793139959; x=1793744759;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=foMtuJXLdxu7UI1j+IPfbjutuzhkAxYfoH1ISosJmU8=;
        b=07gS/Mgc1cf409LkL4s0wJP//IoncgiiBnN4jfWR/GEo9bJWX9fEWZIBR75KDhHqK0
         3c28OSQXkZLU/p7XEDgsInUUQK/RJRWd6N3p3kFOyqQePzgwPoQwAaOFEatQ11yB47LU
         oGJsFLzbmQvivhE0nGVAlHzLO1MaF1oUftYc2fQWUVyw/eRZDcW8Wt6hqZhDdV96TiA6
         Gojwu1pK0QuyNg9EykcLE37WVIJoMl6Rqix/egaVTRLTfNtOphP4i+DzGEYW0yvSZACs
         +4oYdEJ+j1Kol3ikz1KUyUqq/99aDm/aiQUveqPHaUF8fatfKOYlemINUiEa9p2O34aa
         T4Ug==
X-Forwarded-Encrypted: i=1; AKwUvBwryWmAGcz2V/XnBFIujuSQMJZ9/OdpLhcJnVEoRwAhEyOa9AZBsQSfPUYl84ssvZ4MjJU92O/sDwi4@vger.kernel.org
X-Gm-Message-State: AFq9FYJgnaWHDLBYux3bvQs1VmKHgFt9Hi4Qs5Zzgcewd39WF+bTeY46
	l49bnWgAFZmYmBuGSFz/8k5sM5wrOouXvJ7nFVolDTJNlYeQWkkhAmCLigxYls4ih8fYlqMWO9H
	4dGUWEkeaiHIaJOdA5j7Cy3ohInCrfegPilc5v4k=
X-Gm-Gg: AYBFou1mH0vbF/INaZ46AmAjXejRrR7eqwkTMy9ZCOE27uq19vat6MGxuf/7w+++BU9
	Y2rn7fw+Wc4mjnxauUTiL2lWpztMmuBtkVFehIbvRMSxOxbg0DU8Q2f6I9EArc6dTr9xgfWybOc
	OJo1bylHcd2mMGf0K5PvZs8o1T4SQ6r4yM+YPEB50IFsAkWGpUYUJsCw2471Vzh2n3aUrTxeeUJ
	oouaP/ssofj73+wzLS1x/uaG20mApQiy6hAYlHdIxLaiFudeteUf5caMl6atenhklqh7JiEw8Lq
	0iX1Hj+SXUsdBV/2aqsVZhIdGqyGfzcjGJiEQflkqiSOVtudbUKJoG7LSFUh2B1qQWoQJ4otcjf
	pWtQ8K3VIJUjM6sDVv4s2p5m3UXNuUeYVnaiMtljys2IJBZ9vvi3op44EhqRtukq2rjs+0drdF0
	cPG+ch6+RkWu7g7l0GFRlK3cR8vbFqEz2msd0qRfwZCv4ym6iLULFozq1eaGlWtf/LM1Q9Lqq0s
	oiUq99XYr3NPQd9CgEooMCnbQDzOw==
X-Received: by 2002:a05:6122:6602:b0:5ea:c727:11fa with SMTP id
 71dfb90a1353d-5ec4c932ademr347091e0c.0.1793139959098; Tue, 27 Oct 2026
 15:25:59 -0700 (PDT)
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261024-submit-h616-uart-fifo-v1-v3-0-286fc1b8c3c1@gmail.com>
 <20261024-submit-h616-uart-fifo-v1-v3-2-286fc1b8c3c1@gmail.com>
 <20261027-nifty-reliable-octopus-6cbac5@quoll> <CADvTj4qrBYSyT39=xK3_oGgHdFoSH=oyDvTtLCSzW=F9KAgi3Q@mail.gmail.com>
 <3287a7db-fbab-4b23-9ee0-d40c52fe855a@kernel.org> <CAGb2v64Qr-XCRdgi+RNS2XkKUn=F8zW+8WUKaauM2PjzL2XgWg@mail.gmail.com>
 <18f1e637-48de-4962-8a13-65f6597eb2dc@kernel.org>
In-Reply-To: <18f1e637-48de-4962-8a13-65f6597eb2dc@kernel.org>
From: James Hilliard <james.hilliard1@gmail.com>
Date: Tue, 27 Oct 2026 16:25:48 -0600
X-Gm-Features: AclHuK8HgBo8KQle8selMQ5AGJ_mUpjdczBdxOIx6OfVD5T9FzVHNBxWX4VKWiM
Message-ID: <CADvTj4qqwC=HjPmsdHoZdNNWY8GN8TqXnQG9PqKD-GpRZo11Kg@mail.gmail.com>
Subject: Re: [PATCH v3 2/4] dt-bindings: serial: snps-dw-apb-uart: add
 Allwinner H616
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: wens@kernel.org, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Jiri Slaby <jirislaby@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>, 
	=?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>, 
	Jernej Skrabec <jernej.skrabec@gmail.com>, Samuel Holland <samuel@sholland.org>, 
	linux-kernel@vger.kernel.org, linux-serial@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-sunxi@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Oct 27, 2026 at 4:05=E2=80=AFAM Krzysztof Kozlowski <krzk@kernel.or=
g> wrote:
>
> On 27/10/2026 11:02, Chen-Yu Tsai wrote:
> >>>>> +  - if:
> >>>>> +      properties:
> >>>>> +        compatible:
> >>>>> +          contains:
> >>>>> +            const: allwinner,sun50i-h616-uart
> >>>>> +    then:
> >>>>> +      properties:
> >>>>> +        fifo-size:
> >>>>> +          const: 256
> >>>>> +      required:
> >>>>> +        - fifo-size
> >>>>
> >>>> Why do you require fifo-size if is const? It is implied by the
> >>>> compatible.
> >>>
> >>> H616 has a fixed depth, but other sunxi integrations have different
> >>> depths between UART instances. For example, D1 has 64-byte FIFOs on
> >>> UART0 and 256-byte FIFOs on UART1=E2=80=935.
> >>>
> >>> Should I keep this explicit for consistency for all sunxi uarts?
> >>
> >> I am confused, there are no other instances here.
> >
> > I think the point is that it is going to be needed in the future when
> > we add the compatibles for the SoCs that do have UARTs with different
> > FIFO sizes.
>
> Then we add it. We don't create code which is not used.

On further investigation it appears the sunxi boards with UARTS with
different FIFO sizes might all have a register for reading the FIFO size
at runtime via FCC capacity bits so I guess we might not even need
a fifo-size device tree property for any sunxi boards if that is the case,
not entirely sure if all mixed FIFO size boards support this however but
I have yet to come across one that doesn't.

>
> Best regards,
> Krzysztof
