Received: from mail-yx1-f47.google.com (mail-yx1-f47.google.com [74.125.224.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0F7EB4219FB
	for <devicetree@vger.kernel.org>; Thu, 26 Mar 2026 17:35:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.224.47
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774546543; cv=pass; b=gKZ2hpVFjjezPi89VUA/uG6NvF9MsplrIvjFD69wWo9yTt31grf6rTp24+/QdnEQmiLBo5DLEieAA4mElkbhFcUPKJtQjsO7PLPgzt3JKSx+k2vK/Cs35ZRzU/Qb5hCXFkKu8clEmyvvQkw8/f/Fl436peJ1kXLeU2ZB3MucTro=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774546543; c=relaxed/simple;
	bh=tpVg9OP3WqKpIFj2DCpIRgEqHeTR2P2CDMs73vP1EyQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=u55GE6myHix3pUw6y5hiLmpMXG6T5+LFpir2LFZX0610yXUUyU2Ex1eTcNq81zkWTZV0yjQ0e5WoTblSyCuTqSysZ/K+dJykswpT2+oMwvYQnIwurprB+4Bm2rolpHHkPs7YWRlw/9IxhkHh4Fnc7f8eHMf63xppZPYskW0Eh4c=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=WjsldIH0; arc=pass smtp.client-ip=74.125.224.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="WjsldIH0"
Received: by mail-yx1-f47.google.com with SMTP id 956f58d0204a3-64f48a5c3d8so1595938d50.1
        for <devicetree@vger.kernel.org>; Thu, 26 Mar 2026 10:35:40 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1774546540; cv=none;
        d=google.com; s=arc-20240605;
        b=QnjjYXGrGK4X71m6Thnt3VLMhH7VDi88ldPsh+pGxdr0VNmlAcZVthyfwk2236WgE6
         UzJm1DSCQCOIROttd1vrl//p+IDZDmnPKD2f6QRZ9iYrzgPAreqqoSWO8rHWvBm5d9h7
         SH2Zeozb3cXwERTpSnRHDCq0+AaFm87nhoLd7P5vnlyUAD3LgMnCl7mkWVlDP2ONUrak
         2TTQthjkIF/tSPXK9rMII4z2hGd/lJ74xIz2iPdMWjdSzGKsS7eCbZCZk5cUWTTuO1Ud
         cWKi0e+GUhd/14DjK/rC+3JeDCjlZu1GhRoMzXaRtZqTBNaQBuJhVY+ESoXu+kXJMuJ4
         cpjw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=7kWbhwnPirnI6A9uCd8AAXt0tbZV83sXSWQG4XFp01A=;
        fh=eKBflT321i8Cyf1M5SZbjZkBG+T5EiYemsDFizNLK0A=;
        b=NAxSQXiQDhLF7AtsEgEVfCTBmEl7lzgrLJ1Wt/MalSmYwyBaevOKr6RMMf1aDnIZ2u
         sj0xxh5oAEU585yKXOESq6WavH3wk0h0T0XVn1Bkq/DtKQfNno66Dpg0QP51D8vMPBV6
         zXq/AUu384AcIQ4IWVut7TiHopZNGLIRdXFiXFO11i4lVl1u2shlvkM/vQK+x3nn5Ibg
         s5IsPGNrse3HQY1CUNxBj4JaSG9a0LRqda8OCoF6W6QQvy30hVwzE3wq3+Nzub/uv9Pm
         bVYCFZu5G9bb8REQtOkLibzLJqEIkvxHp9J5YVrs6CqOe5GfR9LEsu0aPoCxgLdySsLN
         hAEg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774546540; x=1775151340; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7kWbhwnPirnI6A9uCd8AAXt0tbZV83sXSWQG4XFp01A=;
        b=WjsldIH0B3sekz5pBFJgVgsDDTi8Sh3bzEGci1/DXaRsIQBS0xtX0+x3rxt8sdEpkR
         889f35CqVB0+K6fIbWf0errOgflGvSpx3Oz8yuuZ4Zu3KMbQzSn/pxWhoYzPAAJ4aLrB
         HXasufM9cDnmGSJuXCcUuYS8TvQUtS5cY8QOK/RRYEbtlpSqdiuBLwBsWo/DJM942nsi
         J8HzASIvpMeWrK9ifv2M8205C1+iCTQSUZNsrIZcmyMyhVujquHLVG37Tg7YRPfSorrA
         EowbjfQcJ2ljhN4P/0Fy/kcgeZuWAc1O/m+S1hAdCUM4qB254W1bM1K5V+J8eurOk7kJ
         e3MA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774546540; x=1775151340;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=7kWbhwnPirnI6A9uCd8AAXt0tbZV83sXSWQG4XFp01A=;
        b=Ji/0QsbCRqEzdNt9caV1iE8h62kwxh1vh+puAiYe23EYYmyCzIzCtR3BIPDW4AHqYV
         oujKBsNE0xzjx8OmdgnRp3ZDy0WS0Z9Y7/sSlStcYdEUcMthUv07gY9kLamOW6eGWsHp
         Q7yDcslCHZ2lKNfOl1Ak/KbSmMCOLzadsbBXdBCIfSRkwhZL9GDjLVDMtxQ0gcGHklDW
         cL+O/tv/dtKS7S/U18lYzZF6dYcDEKJQDA0EdJJ8gBk+bGD8aAj2ojgphRxew9cY/hH+
         JbQ5MNqWBUEz1x/IGmE6dMtlXhSFpZB8f/sRwpIRmp6TFM6cfxuWNPVhk9F9bN/r4HGA
         KItA==
X-Forwarded-Encrypted: i=1; AJvYcCUl69QQb7RHlBa9AeUDgvAkUgMMZ7okVDr0ZGNMEPYgxcevDj/MNK7/gkxaRGtIn4YhN1FqZQz4VVv9@vger.kernel.org
X-Gm-Message-State: AOJu0YwBYv3kNPCmpl5dIP0BeLQvrk14xSii3G2srIQ6i+IwTIsywFjS
	OCeuorCPupQ7GQlNOIOzm4Xngont66Cwc2VREHhguGjLr3Lg0WAcPy1r9lgwgTaLUrsMWrzLwB/
	iDMouB8XwBE7i68LOH/Krm2B3pHiAUAo=
X-Gm-Gg: ATEYQzyQevNjztJ5BTQCSMNUAS2maRtQFBgZPQ1sEqAxLGxoOVepJDuKzAXHkSDNXnl
	xMgEJGH7z87wfGGIAByKeTOgtPpSAQK4k0G0sWjak0J22A2dAHukOtoOF1G0IPPpqcNk/ZuCVu7
	B74c25+sEkC10xtq7HaFiI+pC+Kp1kAC6ZtCrhJdNr8aoLLA1FG95KUOZLXsA7T5jbx7biWtBn8
	ka1az5vZ00yX8F2fosFB7GMeMdu6pG3OT2Lj2shbCVjfQDjm6mVfqzZFrctjDoelJ0LYu/VtzmV
	a/noN1igzD2jdpfCNWQiSetTywIFKOCpOStGwtZ/
X-Received: by 2002:a05:690c:5c12:b0:79a:cdf0:e267 with SMTP id
 00721157ae682-79acf3e2741mr86175677b3.5.1774546539773; Thu, 26 Mar 2026
 10:35:39 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260325181509.3430-1-challauday369@gmail.com> <177448145727.289326.12296113937712003366.robh@kernel.org>
In-Reply-To: <177448145727.289326.12296113937712003366.robh@kernel.org>
From: Uday Kiran <challauday369@gmail.com>
Date: Thu, 26 Mar 2026 23:05:28 +0530
X-Gm-Features: AQROBzAQCxnJGjlpikx-GJZJ5K6h93Xl9VXhI7hmMZjxVqGq0A9t0Hd9gLsZN6w
Message-ID: <CAAj-GBmFMiiCbVZq=OVoLvz0JehY2=KskX2Cp0Pp5=_FP8J6Ew@mail.gmail.com>
Subject: Re: [PATCH v3] dt-bindings: arm: mediatek: mediatek,g3dsys: Convert
 to DT schema
To: "Rob Herring (Arm)" <robh@kernel.org>
Cc: linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, 
	skhan@linuxfoundation.org, conor+dt@kernel.org, krzk+dt@kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Mar 26, 2026 at 5:01=E2=80=AFAM Rob Herring (Arm) <robh@kernel.org>=
 wrote:
>
>
> On Wed, 25 Mar 2026 23:45:09 +0530, Udaya Kiran Challa wrote:
> > Convert the MediaTek G3D system controller devicetree binding
> > from the legacy text format to DT schema.
> >
> > Signed-off-by: Udaya Kiran Challa <challauday369@gmail.com>
> > ---
> > Changelog:
> > Changes since v2:
> > - Move binding to soc/mediatek directory
> > - Rename file to mediatek,mt2701-g3dsys.yaml based on fallback compatib=
le
> >
> > Link to v2:https://lore.kernel.org/all/20260323180616.23333-1-challauda=
y369@gmail.com/
> >
> > Changes since v1:
> > - Drop redundant description for reg
> > - Drop redundant description for provider properties
> >
> > Link to v1:https://lore.kernel.org/all/20260315080302.454233-1-challaud=
ay369@gmail.com/
> > ---
> >  .../bindings/arm/mediatek/mediatek,g3dsys.txt | 30 ----------
> >  .../soc/mediatek/mediatek,mt2701-g3dsys.yaml  | 58 +++++++++++++++++++
> >  2 files changed, 58 insertions(+), 30 deletions(-)
> >  delete mode 100644 Documentation/devicetree/bindings/arm/mediatek/medi=
atek,g3dsys.txt
> >  create mode 100644 Documentation/devicetree/bindings/soc/mediatek/medi=
atek,mt2701-g3dsys.yaml
> >
>
> My bot found errors running 'make dt_binding_check' on your patch:
>
> yamllint warnings/errors:
>
> dtschema/dtc warnings/errors:
> /builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/s=
oc/mediatek/mediatek,mt2701-g3dsys.yaml: $id: Cannot determine base path fr=
om $id, relative path/filename doesn't match actual path or filename
>          $id: http://devicetree.org/schemas/arm/mediatek/mediatek,mt2701-=
g3dsys.yaml
>         file: /builds/robherring/dt-review-ci/linux/Documentation/devicet=
ree/bindings/soc/mediatek/mediatek,mt2701-g3dsys.yaml
>
> doc reference errors (make refcheckdocs):
>
> See https://patchwork.kernel.org/project/devicetree/patch/20260325181509.=
3430-1-challauday369@gmail.com
>
> The base for the series is generally the latest rc1. A different dependen=
cy
> should be noted in *this* patch.
>
> If you already ran 'make dt_binding_check' and didn't see the above
> error(s), then make sure 'yamllint' is installed and dt-schema is up to
> date:
>
> pip3 install dtschema --upgrade
>
> Please check and re-submit after running the above command yourself. Note
> that DT_SCHEMA_FILES can be set to your schema file to speed up checking
> your schema. However, it must be unset to test all examples with your sch=
ema.
>

Apologies Rob, this seems to have been missed in the submitted patch.
The dt_binding_check passes successfully on my end. I will send an
updated patch shortly.
