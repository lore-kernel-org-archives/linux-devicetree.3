Received: from mail-lj1-f169.google.com (mail-lj1-f169.google.com [209.85.208.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 05979306742
	for <devicetree@vger.kernel.org>; Thu, 11 Jun 2026 05:22:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.169
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781155362; cv=pass; b=uspsBucRq3CEY6Kv32rH9RirenV8GGQSONnM3D8v6gj77yYJk5dYSjMLXg41zmnzayrJDU6hyN6PCrcJPVzms3OYvBnbMwWoviqMqPV7HAB6VGge9dV+PT8K2z8ghEaUHl5B+AifudcKrPnNZRJ90+ShVf+Rhwb7GIG/478h3CQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781155362; c=relaxed/simple;
	bh=Vv8xc/JE73ka4IbiLvsyGTHwvLLeofhoh5T3QOJOdJ0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=BFb0ognacXkpv5V1Ef7QYeIyaRCN3coh9T/y4tbgjijejyrn2jP7RrvCw1S9BRvbi0wMPJwfqF47+gjkGdABkuMJmamkUziQetz+k6791PYoGmYMbX6lMjEQWBJlzqt7L3dse39GMQi1SF42By8DItGzqzyYYY4AWGupb52roNw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=qaG0ltjS; arc=pass smtp.client-ip=209.85.208.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="qaG0ltjS"
Received: by mail-lj1-f169.google.com with SMTP id 38308e7fff4ca-3965bc493caso69911871fa.2
        for <devicetree@vger.kernel.org>; Wed, 10 Jun 2026 22:22:39 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1781155358; cv=none;
        d=google.com; s=arc-20240605;
        b=P6iv/rdFx1iO32eoAxStk/0LBaVc8zjhtG47RozghfNaJNl+sN034kIR/wtnUXDLUm
         22cZooRgKWCc/D2q+8lqv8MlBcll9oaVoVKG5DJ6uGUjIPa4Mjw+BKR5jBSR2r96ZfQx
         A4hr1jOAdiY2ybh0h8dslQYm7jrE8O5CZ5T2r1hjfkJTcmQ+JYUhsaqgPbc1ui4j6vWj
         zdce8tscB0hZl1MXDSiFoP4DU7HtkLs+Os4/KilBKeZuVVp9DDptE+mhosxs1jZxNfkt
         mu0ie2wlHcFPPCR/QTpqItKCiWXkDhphwtNn8b2la0nLuIJATJifipCblTI6KTeDhcto
         tCxQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=Vv8xc/JE73ka4IbiLvsyGTHwvLLeofhoh5T3QOJOdJ0=;
        fh=jd7NNSgZXSe3DCkk1R5DGy66/CyBy8aThUccBGLe0tI=;
        b=NsLbKaBSqKe/OiPMUA/W5ZhSQheDleWE0eOXRxZenR5pN971gGPU5s7RQfG67QIN2N
         V5bFUBacU2nlXpKEVcom05QJCrRD82pb5yxNfrtUfe2iCbkJdABBZTW09evrNZJXjcu3
         GqaBIfC3IXpeu10M+uF6njy71qs795tdbV/QD2Aan01fwLMVMBosspr+qOGjb1c8b2wd
         8y8m6hJxSEadKNrX61suuXvrvxj+DhuXi89yMtveKGOc9UO8GwxNRMNhF0ahzvmGVfCi
         OvLC76fr8P4a+2KXOZz11KGTyMc9tC+N9YtFeyW7oTWfpYzAjDYBXzfEQwFs2lOMUy+7
         XmHQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781155358; x=1781760158; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Vv8xc/JE73ka4IbiLvsyGTHwvLLeofhoh5T3QOJOdJ0=;
        b=qaG0ltjSIEuUhSAUlwsthBNKFo933btKs+b4Othi9CiNDf9IaWu1uspeWb9YbWuKC+
         F4BCshKmrAS0Oeq49NeW3TNwf9d5r8uqpupclie08o/+5ntaia92Ow2G3wOeWOxRwgQP
         CJnrz3SaYhB6frS/OVjp3xWYu5oggFq0kFPkl13OU9dNtFwhU2wXMxH0l0kudYTGN8hK
         a2wdSdY8FXr8XxUu65X2WjU3D4l4a8YoMbDpWD9t0GwCV5rx25ZyRWeMwIvFDCrvoa6u
         uyCepitLl+l9g03J2FZtidIMyC11H1bPIj4GHFdQWD7NR7t0jHoT5uo95NhcQ7tBrBjn
         ZO3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781155358; x=1781760158;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Vv8xc/JE73ka4IbiLvsyGTHwvLLeofhoh5T3QOJOdJ0=;
        b=PLWhNohSEsdkGi+zVXVqYAayZUCcX6q5mh2gFUq7d49HLvf+9/1AEUzw20Gx+qY1mJ
         aYFZ9pLnz3m6uBZ8qyY1tkag6yvKkherXKncMBnJFSrT4fWWK/vg/g+4tvg4AS6HtNVA
         zEoDyaSrihTQ02zOlHPm9ErJDof4rVCxMCXrZOI8UJgSOg5sRODDjmG+xtDKueDlyFPc
         M0x7mQLtVvPoI658vSvwU0FEqFu2+EjdNocZW4bH5RLZTR89LXdF272VfY4QgF2MD91R
         5dGCVp0a7JL4B3i9T53NUkBI5qTymzEJ8IEkN4hSmxy3NGQY1i0faszaBxE5WzpYhsOd
         UkwA==
X-Forwarded-Encrypted: i=1; AFNElJ83qEPeHBoMUcarPPCz9ach12Zb2BcysTA/QTHJ/V5Z0tKfZWMatuUixz4Zm+/KkqeDwToD6+3QCPld@vger.kernel.org
X-Gm-Message-State: AOJu0YyxT9mXj80xjkhVQmjctg5FKu+qk4M3ILBfOVGjzdoRO8nYvSCE
	BGpv8Za6CyzwOQbFHrqlgxeyHrNwqKDZwK3bIm1eJCfAa64ElmCTCr1hfx40KqbUR+xNYkeNWU/
	mfk7xcDlf3Hjr7aaD4ch9LX24/m/gnI4=
X-Gm-Gg: Acq92OEGH+MB78JQWApi7CzLsHW5SAmqqlQAOOwJsMPwMXR2Ncz2VLVBBGLNaEnHhZ0
	ufOcalgK4ekW34hTpNeG3P4Tl6CG5q8EHKTCSO7ylV55LIs/92htuBojbJaG6QgXHkOkyFb2gHf
	e9Ki7MPxxsHlvYm62GZ12MAvpBrjXDj7vf1WQxtKH1qmqgMW8Au8bP8vNFf4JMDuoD7KHj6cc87
	3GDQpjgTB7sjY1DH+UY67Llhoj/DMuoH4MLOi3b16hn9Pe8OemhFUCxRWh6BlneWTmBKE6LJCf4
	65b4y295cOavM2X7ZHg=
X-Received: by 2002:a2e:a583:0:b0:38e:d3e6:a89a with SMTP id
 38308e7fff4ca-3991a083973mr2593601fa.20.1781155357644; Wed, 10 Jun 2026
 22:22:37 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260610-ventura2_initial_dts-v6-0-375d8e9d7ebf@gmail.com>
 <20260610-ventura2_initial_dts-v6-2-375d8e9d7ebf@gmail.com> <a8cdc7c23166823a8e1969408c667e6a8d758fe7.camel@codeconstruct.com.au>
In-Reply-To: <a8cdc7c23166823a8e1969408c667e6a8d758fe7.camel@codeconstruct.com.au>
From: Kyle Hsieh <kylehsieh1995@gmail.com>
Date: Thu, 11 Jun 2026 13:24:08 +0800
X-Gm-Features: AVVi8Cckj1KMTx5QCbBfuV37allJnJRrSd1WRpg0xdewL4kFILvgYndyDD6MebM
Message-ID: <CAF7HswMxtzD5KoQRGx4ckA4fUbFr6P7XXnTff_Z+_DmN8i37vQ@mail.gmail.com>
Subject: Re: [PATCH v6 2/2] ARM: dts: aspeed: ventura2: Add Meta ventura2 BMC
To: Andrew Jeffery <andrew@codeconstruct.com.au>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Joel Stanley <joel@jms.id.au>, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-aspeed@lists.ozlabs.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Jun 10, 2026 at 7:22=E2=80=AFPM Andrew Jeffery
<andrew@codeconstruct.com.au> wrote:
>
> Hi Kyle,
>
> On Wed, 2026-06-10 at 09:22 +0800, Kyle Hsieh wrote:
> > Add linux device tree entry related to the Meta(Facebook) rmc-node.
> > The system uses an AT2600 BMC.
> > This node is named "ventura2".
> >
> > Signed-off-by: Kyle Hsieh <kylehsieh1995@gmail.com>
>
> I have some comments on v5 that are applicable here too.
>
> https://lore.kernel.org/all/3d56889c004fc2d11b76ace6033c7ccfb8a37d03.came=
l@codeconstruct.com.au/
>
Hi Andrew,

Thanks for the review and suggestions!

To briefly answer your question: Ventura2 is Rack Management
Controller. It is a modular device primarily designed to manage liquid
cooling systems and monitor rack-level hardware states. Its key
hardware features include an extensive I2C/GPIO topology for
tray-level and rack-level liquid leakage detection, as well as MCTP
over I2C support for asynchronous device communications.

I will remove the redundant sentence and include this detailed
description of the platform's purpose and architecture in the commit
message for v7.

Also, the Sashiko AI bot just caught a missing `idle-state`
configuration for the MCTP I2C mux, so I will include that fix in v7
as well.

I will send out the v7 patch shortly.

Best regards,
Kyle Hsieh
> Andrew
