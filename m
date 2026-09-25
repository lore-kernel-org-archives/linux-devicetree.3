Received: from mail-yx1-f48.google.com (mail-yx1-f48.google.com [74.125.224.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C963349DBBA
	for <devicetree@vger.kernel.org>; Fri, 25 Sep 2026 13:05:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.224.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790341523; cv=none; b=KrIjwfTs7PG6GSdMS3jwvMzDB510uC8CDeykWH+aIeEIkSYLf8yPEB+0/by9dB8HJUPZECQGWiymnsWHKQFiDlkzFSod1j4JXxn7YPic7/hZNHA6HzClGO0W31RURrv2RYPCPG8VGRehxg6rE5mBYwTN3/2toEFr7YC+sdypb7Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790341523; c=relaxed/simple;
	bh=SNXrjUHLxaO4PIWLbvPnvyB48FFWSNE4zj+UVTQoMOA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=gdjaNLIE007u9H55uJKmtXWwLED8py5Yfs0VjgfM9gHs7mM5rhgP+kj66PouEE5k0gQ7nWbdLK8cJiANFso9uzqmhQdQkXufiT63I3UXc4/uoVY9vOMi46xn7Pc85DOChI6jrQDkz4+xzrXyiPQ8JBBqr/pj5l4ZkTdCHSIrU7M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=74.125.224.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-yx1-f48.google.com with SMTP id 956f58d0204a3-6714595153cso1045914d50.0
        for <devicetree@vger.kernel.org>; Fri, 25 Sep 2026 06:05:21 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790341521; x=1790946321;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=iikrWSUlQodloxnitQUQlaOsbbx0iKNTngyqMd+wIHM=;
        b=Ff2MLMXSEkLMCb/k1m0fMetEo2a1SkyPlI17byL5hciPadoqncRF2/FeO2FqUaMrMJ
         /PoBP8GaAf0Il16MtX504uxNef8WJ1HbdN4gTuF34REbrxL0W3p3zABz1l4iaGeJ3lZk
         3DkuQHwNrYF6Uv9BJdXRkcM/tf6mSbaUaAVwUTQIr3PJHL+jcqdzf6Tt4sPby2IK1Uem
         BjaLA5mMFbIhI4EMklSuTTjOUssmuVeW3hCL1D5JOQ7/YA391NSfP/s0/2tstDr4GHET
         dgPRpcqQ/j7fSnsG/y9t60nxUDTf11JZ6Fly1LUQT0XB4JWi2NI8eH0eZi++hxY4nYMb
         VbMw==
X-Forwarded-Encrypted: i=1; AKwUvByaSRQ4YIJK1OeK8x97/1FFzvs27xs9W6jj5zN1N9LZCGi3doS2YmqQGGdDOvLg0UsEAamwzCf4T0tV@vger.kernel.org
X-Gm-Message-State: AFuF++msLOgDtudPmXGpQ1LyyhgYD5IQmOxXwPFx3EPO/vxL/cA5MQpY
	/1qw1LWF6ycPUmYTJkmxIhES7dJJbFZAtJHDb+JlLGF5Vzy7+lkkTJvLGEQ42gEp
X-Gm-Gg: AYBFou36ioYpoxoMyYOHni8VfRBV4CPbb6N7W9Vqb6muOM28TCLugR6OYa6bNNwyifb
	kgPm9og1p2/J/uAweu/her6Crz+UXxq+47ywLecCdf+rx1x16fBlEHp4U5HMmPwaGTMFj1NJt6f
	M2KL12s+x1Y09PpsDSjaj2SDKLd7wSNkZjwpJE7/lWg94qqwFhHFy50UtYTPI+cjLQ6A2wJMdVf
	waGNt95ZTJhgNgAnFJtu8rgkMHp6I/JYPecG2LdPWKt+KZcvnwH9ldF/eCAI4SfQrzZlJtsYdXP
	eLJPcwCSeYnKy5o6Y/oQd3x/b1aAaypLO/9MdwhPph+g3M9HolVFO+21bIJosRq9AwPWwmDk3WD
	gc+YxTIBzns7D3hWhjdNI5FIzWcEv7DGf7zoBGO/kEXaSSZTOF7LlglXnccXs8HomKXNXQIrobP
	7SoKXWMZEYV0iY+VlwOg6fpari9AUn7vLxPjWoCnvyKNQakytlz+RWYiCz3i4mz3gPlyVJaqDfG
	mjujb8XNy0kj4vry+aULgZTytvnNyUJ0Ii4yA==
X-Received: by 2002:a05:690e:1504:b0:674:a09:3990 with SMTP id 956f58d0204a3-6740a094193mr1385472d50.30.1790341520473;
        Fri, 25 Sep 2026 06:05:20 -0700 (PDT)
Received: from mail-qk2-f12.google.com (mail-qk2-f12.google.com. [74.125.230.204])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-91430ec25a1sm16296556d6.46.2026.09.25.06.05.20
        for <devicetree@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 25 Sep 2026 06:05:20 -0700 (PDT)
Received: by mail-qk2-f12.google.com with SMTP id d75a77b69052e-52fb76543e1so4574921cf.0
        for <devicetree@vger.kernel.org>; Fri, 25 Sep 2026 06:05:20 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvByJaxJWdnS8gyA+xkZ/I28wzFKBPgD8ZN2iS142ds73M/tlF74P3frGDsHm+uhMGmZe+7cHJOywNhAl@vger.kernel.org
X-Received: by 2002:a05:6102:a145:b0:78f:fee6:832 with SMTP id
 ada2fe7eead31-7af1cea4a54mr1503499137.12.1790341087879; Fri, 25 Sep 2026
 05:58:07 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260924-paul-v7-3-rc1-edac-v3-0-bd8054a5b180@bootlin.com>
 <20260924-paul-v7-3-rc1-edac-v3-1-bd8054a5b180@bootlin.com>
 <arZpZolRwdU8zh6O@shikoro> <8733uxlcl1.fsf@bootlin.com>
In-Reply-To: <8733uxlcl1.fsf@bootlin.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Fri, 25 Sep 2026 14:57:56 +0200
X-Gmail-Original-Message-ID: <CAMuHMdUeCH9SbCr70syV0hVSqD1ccjVptMHoY-6aaEhW_ine_Q@mail.gmail.com>
X-Gm-Features: AclHuK-YV8P6qGPlYAimFvYOFx6QV9kkt9w-v-Qt2g3Qun14B0iXjB41Jl3A5uU
Message-ID: <CAMuHMdUeCH9SbCr70syV0hVSqD1ccjVptMHoY-6aaEhW_ine_Q@mail.gmail.com>
Subject: Re: [PATCH v3 1/3] dt-bindings: edac: cdns,ddr-edac: add Cadence DDR
 EDAC binding
To: Miquel Raynal <miquel.raynal@bootlin.com>
Cc: Wolfram Sang <wsa+renesas@sang-engineering.com>, Paul Louvel <paul.louvel@bootlin.com>, 
	Borislav Petkov <bp@alien8.de>, Tony Luck <tony.luck@intel.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Geert Uytterhoeven <geert+renesas@glider.be>, Magnus Damm <magnus.damm@gmail.com>, 
	linux-kernel@vger.kernel.org, linux-renesas-soc@vger.kernel.org, 
	linux-edac@vger.kernel.org, devicetree@vger.kernel.org, 
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>, Herve Codina <herve.codina@bootlin.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Miqu=C3=A8l,

On Fri, 25 Sept 2026 at 14:50, Miquel Raynal <miquel.raynal@bootlin.com> wr=
ote:
> > But one thing came to my attention just now which needs fixing:
> >
> >> +    items:
> >> +      - const: renesas,r9a06g032-ddr-edac # RZ/N1D
> >> +      - const: renesas,rzn1-ddr-edac      # RZ/N1
> >
> > We don't need a family compatible. Only N1D has a DDR controller.
>
> This is true, but from my experience with this platform, Geert used to
> request both. I'm fine exposing only one of them, but I explicitly asked
> Paul to put them both to mimic the existing bindings and keep some kind
> of uniformity. I'm fine either ways, but before we go through that
> iteration, Geert, would you mind confirming your preferences?

Well, if only RZ/N1D has the DDR controller, there is not much point in
adding a family-specific compatible value.  According to renesas.com,
RZ/N1x is obsolete, so no new family members will arrive.

Gr{oetje,eeting}s,

                        Geert

--=20
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k=
.org

In personal conversations with technical people, I call myself a hacker. Bu=
t
when I'm talking to journalists I just say "programmer" or something like t=
hat.
                                -- Linus Torvalds
