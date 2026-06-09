Received: from mail-yw1-f181.google.com (mail-yw1-f181.google.com [209.85.128.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 843AF3E3C73
	for <devicetree@vger.kernel.org>; Tue,  9 Jun 2026 08:41:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.128.181
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780994518; cv=pass; b=DxrM9dnVGEQHlqzhlXZ+Nj9IMWDohzwjk6mhi1nbBMxJrvHw8mcpU0Ec84KY/mvC8aKCyD+Jk1EeUzESqo9CRYC45ZU2B6e1Dq8oUJoAxOWKYUQ8XxxTDKQzrt1lg3vmL+QDLQn/VadIfa3C2PtRsIJaz+KCQsfEzmudDPQP9Pg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780994518; c=relaxed/simple;
	bh=T5Mux1tGqzCER/xDNIb7vnkK5ie0uhA9uXtCNl6hduo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=pWCDPj4TOPv0HysCFtymDFhozwjzJBV8t5+p17pRyurdnwSfEqCMCsADZuSoXtjUFGtBJ7QXOMX+S/xXKILp+ITUy+h2gRi814tR4/EdSEa1CEtJ+pIxpLHVM6s9nldqMt5088OAtSbvJp2dEgRnCR14H4o0qsrqNy6yH5TUMiI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=lpCNua+L; arc=pass smtp.client-ip=209.85.128.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="lpCNua+L"
Received: by mail-yw1-f181.google.com with SMTP id 00721157ae682-7de68222e96so51507497b3.2
        for <devicetree@vger.kernel.org>; Tue, 09 Jun 2026 01:41:54 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1780994513; cv=none;
        d=google.com; s=arc-20240605;
        b=Wp1kgtwmpEG2gnKYNGU/Ij6V2HkI2R1sitqP4MAslBfEhV0vkB+VXLnXvRoF4+p6ja
         LiAYWMTvSfZTOdtC2nfRpEQz6Vr2TWxKpHm2k5eRlswXJjmwqHkFA1mObFverqI7IdIX
         omn0cio1+JVSC/4+w5y9FEyqSPJXaxk0SQ7OT/Cyylg6crWlBbqzChzoywKjE/JOoNbS
         9o7+IpGjhjYGQdjlCAVs9RAwGZ62JPaa4VWljrU1A/5f+fn3R2cXLpkg+TBnZOqSI//h
         UNHHSWAmWjIlGG0YE73MG8AbASQslaan7PN1NWioFZltgHyN+7bA9WkuwEpXM66HIzdi
         fmxQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=tF9exGGL9nZqc+nch3e4YqTjInqOy/64x7XCEMTr3DQ=;
        fh=j+8wfW4zBCFGPqH99cmw0L3uHlyw1oN7YL48xlEb5K4=;
        b=N2BGBphQuqFFJ6jidWafva4oLIZBcv3Yv796hj9pSfj66QkVbRPEsllhxtNQBM+Uyl
         NBfk4E0WxmKfTBMeeAPjlTEVKjnoiItCjxfT+0THf3crJf3fPaIzjUSMnbiTA8bMJDWs
         6Ige8xNc+aoA1tjTwWlPpXBqTEmEbyVaC8COzD/kNblzYB0FWj0eEepSMRew+6kTtvnB
         c6ZCxPV53mH0O4RwnP3PsDHMhiUpDJmRvJ7bC7G8pxLgksPZSLgt1GYcxyF29OLyaTaT
         TftHLAUQ4NCFxVcDbioPO1DopsXQCZkKv2DPF2HQkhugXbUffddPW7OkTb6u7DmdVa+Q
         McBA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1780994513; x=1781599313; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=tF9exGGL9nZqc+nch3e4YqTjInqOy/64x7XCEMTr3DQ=;
        b=lpCNua+LY22VooyP8Hnv0JyaYNnxD5MOta/IEB3C3+RpimfZOpsAm3Fg+4hU+rqk9W
         /49Iibr2S+RPQtcNqx92r+VKPkMhePlKAKzNgdGLQ0vLrCytCoSACAXR4Tj3xOA0KI+G
         wzFhNV153pmRwJpcV0AxJPzL7BGJ+Rjy3ExEw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780994513; x=1781599313;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=tF9exGGL9nZqc+nch3e4YqTjInqOy/64x7XCEMTr3DQ=;
        b=Iz5/ik2G23iIcAGn6u3+6IwmwfiQ+Bx0F/DpaHo/aIAyx+lmaG550AOuR59jvqwn+w
         3KWojcRG+vFpFSeqeyb1Rps7E9vmkxR6zICy99rJlGrzL9uJxoJjv9MD40JgKGZccH1P
         V33gFgINmNlAz1gM83lZjNQEMoq+H4Xqiq4ks2aN5CqRBmXU6x5PuI0FttXgPsYRf4Oi
         LZdKyW6+zs366vKh/gCBVsACuPMd5jHLDPwV/oAwu+bcdgNH0b0lKpWQcdjv2SXNAVb9
         Ad20p7QlU5jR3Dhlq+O5mydJY4gO6W8JeQPVgoNZR+FoBgceKMdXo7yww8q1o6qcyeeo
         4VpA==
X-Forwarded-Encrypted: i=1; AFNElJ8B9N0fVfjfzfIxJruDwDY8og7vzdcsWf7pD80NKe3j1mJMmGqC1QrgE4ilH1rdp1cgBK7DgYY0QgDs@vger.kernel.org
X-Gm-Message-State: AOJu0YyjSpMxUDUr01CakS7vV16AeXTiukUZ69/kVeNQt1IF9pgXCS7m
	7LgDnvi8BkDvKjVDNvIzNXz3MtNilz8oKloA/KhdzoM2bIpDrjwI7FzsTVThVdQoby38DvC1ozw
	N9UmGcJCuVf5xxmpprb+/pviHcwVS43Szkn8vJ5XY
X-Gm-Gg: Acq92OERUF9ozfkfIzLPhWLfeL5kqQEf1ycfGqHoT4+yaMZmqZeiBfnekcX+YRj29mC
	sx/s7IoM2AsOw3R6uEbGN2N2P/LZurjRuecqk1UU+c2AZJWFhqc730Ea5Lwrv3+AfEjnDV3cwJW
	etYAS7CVcDRtpo8fZmvnMhCkiTcYy6A0zYsg4BNHJO7CB7PhHAJ3JW/Nc0/PY759UN1MYQINtEt
	ySlCWw0hAw3JoilvvzuumVI6pwrout3W1fVOFGLhj7hj6H8Pg9hOXJMu4kIFC7RfaOaODAql/tO
	gDIWRjJtYYovUIOeOgY=
X-Received: by 2002:a05:690c:c4f8:b0:7bd:8ce4:92c with SMTP id
 00721157ae682-7ed0ed4ee64mr185176347b3.31.1780994513341; Tue, 09 Jun 2026
 01:41:53 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260520084428.257066-1-wenst@chromium.org> <ag41KWtNpU1ZZs6m@google.com>
In-Reply-To: <ag41KWtNpU1ZZs6m@google.com>
From: Chen-Yu Tsai <wenst@chromium.org>
Date: Tue, 9 Jun 2026 17:41:41 +0900
X-Gm-Features: AVVi8Ce8Nz35NPVrXN7zfo4FdcTvFwh1LH4tunNmQ4RFKjjZ0Lkrv3scHyEzfwY
Message-ID: <CAGXv+5GENJJ8sSstFJ8pQDqT-w_2bnan61jbJKiu+W3VM1UerA@mail.gmail.com>
Subject: Re: [PATCH v2] checkpatch: Don't emit warnings for ID-base USB & PCI
 DT compatibles
To: Joe Perches <joe@perches.com>, Andy Whitcroft <apw@canonical.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Dwaipayan Ray <dwaipayanray1@gmail.com>, 
	Lukas Bulwahn <lukas.bulwahn@gmail.com>, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Yingying Tang <yingying.tang@oss.qualcomm.com>, 
	Brian Norris <briannorris@chromium.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Andy, Joe,

On Thu, May 21, 2026 at 7:26=E2=80=AFAM Brian Norris <briannorris@chromium.=
org> wrote:
>
> Hi Chen-Yu,
>
> On Wed, May 20, 2026 at 04:44:27PM +0800, Chen-Yu Tsai wrote:
> > The USB and PCI device bindings define some compatible patterns based
> > on device IDs that use the comma to separate vendor and product IDs.
> >
> > These prefix patterns include:
> >
> >   - ^usb(if)?[0-9a-f]{1,4},
> >   - ^pci[0-9a-f]{2,4},
> >   - ^pciclass,
> >
> > These are not real vendor prefixes. Don't emit warnings for them.
> > Instead just skip over the DT compatible check altogether, and leave
> > the real check to the DT validator. This avoids false positive warnings
> > about undocumented DT vendor prefixes and compatibles.
> >
> > Note that the script mostly only checks the first compatible string of
> > each node, as it processes the source file line-by-line, and the check
> > only matches on the line with 'compatible =3D "..."'. Otherwise there
> > would be more warnings from arch/mips/boot/dts/loongson/ls7a-pch.dtsi
> > since that file also includes compatibles like "pciclass0c0310" and
> > "pciclass0c03" which are not accepted either.
>
> Looking at IEEE Std 1275-1994 (PCI Bus Binding), you're right, that's
> incorrect.
>
> > "pci0014,7a24.0" is not
> > valid either,
>
> It's possible that's trying to follow the "pciVVVV,DDDD.RR" format
> mentioned in the spec, although it's not clear if it should require 2
> digits after the dot/period. Notably, the dt-schema does *not* include
> the "dot" option at all, so maybe there's room for improvement.
>
> Anyway, that just adds to why this is a good choice:
>
> > but this patch leaves the real check to the DT validator.
>
> > Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>
> > ---
> > Changes since v1:
> > - Moved check earlier and match against full compatible string to avoid
> >   false positives for undocumented compatibles as well
> > - Added comma to patterns as they are now matched against the full
> >   compatible string
> > - Fixed patterns in commit message to just cover the prefix portion
> >
> > This is a simplified version of what Brian Norris previously posted [1]=
,
> > but more comprehensive and more perl-y than what Yingying Tang posted
> > [2], which only covered the second pattern.
> >
> > This is based on next-20260519.
> >
> > Also, odd observation: the other regex patterns in this script escape
> > the comma ',', but AFAIK this is not needed.
> >
> > [1] https://lore.kernel.org/all/20190223022440.146915-1-briannorris@chr=
omium.org/
> > [2] https://lore.kernel.org/all/20251210073812.1380803-1-yingying.tang@=
oss.qualcomm.com/
> > ---
> >  scripts/checkpatch.pl | 6 ++++++
> >  1 file changed, 6 insertions(+)
>
> Reviewed-by: Brian Norris <briannorris@chromium.org>
> Tested-by: Brian Norris <briannorris@chromium.org>

Ping on this patch.

> > diff --git a/scripts/checkpatch.pl b/scripts/checkpatch.pl
> > index 0d18771f1b01..d4ee9d88ad07 100755
> > --- a/scripts/checkpatch.pl
> > +++ b/scripts/checkpatch.pl
> > @@ -3783,6 +3783,12 @@ sub process {
> >                       my $vp_file =3D $dt_path . "vendor-prefixes.yaml"=
;
> >
> >                       foreach my $compat (@compats) {
> > +                             # Skip ID-based PCI and USB compatible pa=
tterns.
> > +                             # DT validation will check them properly.
> > +                             next if $compat =3D~ /^pciclass,/;
> > +                             next if $compat =3D~ /^pci[a-f0-9]{2,4},/=
;
> > +                             next if $compat =3D~ /^usb(if)?[a-f0-9]{1=
,4},/;
> > +
> >                               my $compat2 =3D $compat;
> >                               $compat2 =3D~ s/\,[a-zA-Z0-9]*\-/\,<\.\*>=
\-/;
> >                               my $compat3 =3D $compat;
> > --
> > 2.54.0.631.ge1b05301d1-goog
> >
