Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4242C3E8695
	for <devicetree@vger.kernel.org>; Fri, 14 Aug 2026 07:13:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786691603; cv=none; b=a7H78h7TqTl1XmJV7ebipFeEpFYjmC1hZ487Iw/Z24pMmyaaWCm/X0xwjsxd/Y9I2JRtZ0JxkFbTt3kAqJyMKqFJ6Aq0FxZbJ8rQjM+kSKjEu/PwpIw4HcnTRpjiLe2Yph7OyCDFBYMzDumJ9yZ4lI+PWvB3sgwV+CQy6Zvq1vY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786691603; c=relaxed/simple;
	bh=WG5j3DmY54M2zsyy4epXTXCRXkE5LeniIG0zsq81RtA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=XKbuAPfWft2pdv4eJOCMQIV2tIXxqDgAcLIEE4ka+UerBOmXSjgp2TWrE78Tm+heZBTjxkvBmcn1kwftxevICdBwitTKUheyr/hGADx/DEnk5+Lj02RlaOaUC/EokPGJZfd5hO41qH7xLIHr0Ff63oXU32pSR0CH0OZe+gJgR38=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=PeL61BwD; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="PeL61BwD"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B39D51F00A3E
	for <devicetree@vger.kernel.org>; Fri, 14 Aug 2026 07:13:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786691595;
	bh=WG5j3DmY54M2zsyy4epXTXCRXkE5LeniIG0zsq81RtA=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=PeL61BwDV75P+u9eA/i5Q+sTKF+zNL9geHSVGfjBMDNv0ufP9YRbNMp3eDwlhpZcS
	 aeVgEmgiJ+Uw3N4dule9Z7A8ehB7uzpXUzBa0QCdMwieJt4hbIaEHtKJ/QK687r5IU
	 mRdUU22x+ISQf63VkdnVhlc4VOy6Ycn4si8C0qcklvhFJWhMAe37N8u53vK6BUsjBo
	 99pq5yJKiE1Ce2RvEMFqkFd1GrplZrCqwutaNKYjWyDmS3lAeY8INloZ7OzxaWOmLf
	 Cu4VD0MQ1Ti507aDoLUEnm63Cm9s2hR6R5BvV1VT/VrWB7C+o8cWNhNl/U4wcOdt9A
	 k9Po2xGFgm/Wg==
Received: by mail-lf1-f49.google.com with SMTP id 2adb3069b0e04-5aec6360133so462526e87.1
        for <devicetree@vger.kernel.org>; Fri, 14 Aug 2026 00:13:15 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AHgh+RqwsU1wJhs1y/8yp0FGkmmLvpLdDEB6GOy1MLviV0K4RBIOF2VgiPeidc/SL1LeH7LlrN9mAacosxhl@vger.kernel.org
X-Gm-Message-State: AOJu0YxUn3pk7lOvosCp8EriAtV0vff68e/y1x2eScPqd7KIdRviOkhy
	iZ57n2WCpJPlvlRJHR8W8B8Ay0pVb391x7RRIsfUVd1X1ySnG83N0Txb8b3dLViqtjnr9BJZc4Z
	ATO2kScg+0nQgGB5y5PPJRA3nvaOMmXk=
X-Received: by 2002:a05:6512:8041:b0:5aa:6e86:55e5 with SMTP id
 2adb3069b0e04-5b459115ffcmr357656e87.13.1786691594513; Fri, 14 Aug 2026
 00:13:14 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260731174551.86367-1-challauday369@gmail.com>
 <178579584771.736715.6031577704790719107.robh@kernel.org> <CAAj-GBmvcG62NddVS3UMEK6tQ2UKBr+=KCXe15jhCEtB+JWXKQ@mail.gmail.com>
In-Reply-To: <CAAj-GBmvcG62NddVS3UMEK6tQ2UKBr+=KCXe15jhCEtB+JWXKQ@mail.gmail.com>
From: Linus Walleij <linusw@kernel.org>
Date: Fri, 14 Aug 2026 09:13:02 +0200
X-Gmail-Original-Message-ID: <CAD++jLms=ufSTgUo1jm2o02MWfU=vWQEz9Hbj4EoK1r2tuOj8A@mail.gmail.com>
X-Gm-Features: AcwNN1U8PXigGeNQ8o9kh9fYFdQSSUwCakTvhUUWDDUJOQiB3i0iebtic0u22qo
Message-ID: <CAD++jLms=ufSTgUo1jm2o02MWfU=vWQEz9Hbj4EoK1r2tuOj8A@mail.gmail.com>
Subject: Re: [PATCH v5 1/2] dt-bindings: pinctrl: microchip,pic32mzda-pinctrl:
 Convert to DT schema
To: Uday Kiran <challauday369@gmail.com>
Cc: "Rob Herring (Arm)" <robh@kernel.org>, conor+dt@kernel.org, me@brighamcampbell.com, 
	skhan@linuxfoundation.org, linux-gpio@vger.kernel.org, krzk+dt@kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Aug 13, 2026 at 7:30=E2=80=AFPM Uday Kiran <challauday369@gmail.com=
> wrote:
> On Tue, Aug 4, 2026 at 3:54=E2=80=AFAM Rob Herring (Arm) <robh@kernel.org=
> wrote:

> Thank you, Rob. This patch has 2 parts(dt-binding & dtsi changes).
> Can you also please review dtsi changes?
> https://lore.kernel.org/all/20260731174751.86819-1-challauday369@gmail.co=
m/

The MIPS maintainer will deal with patch 2/2!
The binding maintainers usually don't need to consider
per-arch DTS(I) files.

Yours,
Linus Walleij
