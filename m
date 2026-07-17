Received: from mail-vk1-f179.google.com (mail-vk1-f179.google.com [209.85.221.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 37C0E33BBCB
	for <devicetree@vger.kernel.org>; Fri, 17 Jul 2026 15:40:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784302835; cv=none; b=ithYX5lbSqyfqWPi99wGfWxwZBGEPV8uWSwtePf6L9z0K/AuM9my6gqTVsmcxKisNtxf1tJc7Co3TMDvqu/ysdPebwq2U5uILUgpKD5BCZ5JOZp8o6RcLtHTZin8OB2LNgtanX1Sm8JVwEHHd6kdVHsUX0qb6dzpeGt3fyRHNnY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784302835; c=relaxed/simple;
	bh=1LTRCgSFoxKqoO+f0vjNmVxCnjcCSEY4MiefjXT7rIM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=IqnTNpYXLYT6EkW7B3pWODmZ10PSooR9oSkOcfpX1+gs+2d5ZXbp4Ju94JTSKnB7gkcquBTvCtJhXLbi3Rn146ZC1NsWBx7vXo+xJzCof+SCjMoV81+wUQGy2N73Ck3L6kf89vtOTpGatqAnsFZBFoqU+lS1K+c//wRAbq2fw68=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=NnlQWFcI; arc=none smtp.client-ip=209.85.221.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="NnlQWFcI"
Received: by mail-vk1-f179.google.com with SMTP id 71dfb90a1353d-5bf9466412fso2981493e0c.1
        for <devicetree@vger.kernel.org>; Fri, 17 Jul 2026 08:40:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1784302833; x=1784907633; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=1LTRCgSFoxKqoO+f0vjNmVxCnjcCSEY4MiefjXT7rIM=;
        b=NnlQWFcIUGCBuZ5toH4nREJZ2Dn+SxfKcdhoNxjLfsuIwxNRiVB7Hq1YXo+brO65BL
         llBCbhE6rBHgNIRjcfLFtz2B3e0ObyU5nNVKLCWqvykKxp38HmwFr0OysqpC+sIek+wA
         eVY2T2csb59xCKOtZd1sWEjkXwGkW/IL84rJc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784302833; x=1784907633;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=1LTRCgSFoxKqoO+f0vjNmVxCnjcCSEY4MiefjXT7rIM=;
        b=iih3i7R0RMBBpyA9nAFj9SI9Z7ZnPTTtZe19ossU9rrclPFVBFTLR073Q13VtnSOwg
         ItABhghY+ab4rKX8HTjchAft3P6DIthKXc4Dq0PJMXB5ZCWAtaAxG0ggSg51v0lnGJF7
         3rvFEIpGwa5T5FrzvWavKQYBODGHaco6wqqnBA1wSIVUmGjcCPX/X/lTp6gzIKKkVBop
         eVfd8EQQWoBlEeMn8O4BF8ltf5oArGwGTaCK0Pl6sxzMt8vBJhjTkNCQThOLL8Kx6Ppu
         i6bSvRUbxZxVM/bkzRjTyckaDBvfdcMbRBSP1ccdRWWpSrl38SYy0qmjPUZ+EKx30HD2
         RtLw==
X-Forwarded-Encrypted: i=1; AHgh+Rr5G0J6N2pbfuUdUxWT3XrK820HXZvp9HmJBGv6Td82DeE91DbcSA4fGLsvzjTL8q0hixlFagAWwB91@vger.kernel.org
X-Gm-Message-State: AOJu0YyTVaY3YOoI/Oqdymzo51eh33EK3XKIIPyM7ZjAn6EaSgiWBNlQ
	7Afx6Cej32AQ+GB9hs9hJvneWx4GceqF5JgifsBD3dw0VEVozLs5bUsQHKdGSe/E+GGWZoeuZnZ
	EW2M=
X-Gm-Gg: AfdE7ckykmgw1vrmJk6dwfOZ+lxcHUwwxDwwCgCGjnxtQueDt0f5WX8wzc+U4rBjnKM
	739UBCGM8PDiL0iDPk27jCFc8ir56uE6MfMIIDTonnHII3fHlyCsWFrnE0bS95+UcBNLXCw9v3Y
	u/ifTM4bkXjQ8DgxSveZTV083AB8r7UG/YA0fZgMY9gidCraEnBwaaAOxOs/DrEHr3iP3yeR+R2
	8lNzwOc4QIrZo0WL1/7hqbsW5Z9lmSdoLsr5vipqDae40mmclwCnlmZf8AgBuTPF/UXFgvGecw4
	JaEjFMDc1NTBu5SWA9ai/xis5MxSpwfm428MknLS07UiYrZTWQn0oEUqLamSbE+7yOI32bV2Pd/
	6hnkSptJYGbqnE6tmLqfZXakba2GIiKEWbpQ/7BeGdYmDY6CKC87ypZjFmcsG/RMrMsUAdp0H78
	9BETCdj5DC50NzyxZOY8AlKXTnGsyRNvimR97WBWEe
X-Received: by 2002:a05:6122:4694:b0:5bd:a810:b090 with SMTP id 71dfb90a1353d-5c1b665d565mr634910e0c.5.1784302833062;
        Fri, 17 Jul 2026 08:40:33 -0700 (PDT)
Received: from mail-ua1-f53.google.com (mail-ua1-f53.google.com. [209.85.222.53])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-976fc60c50bsm746615241.8.2026.07.17.08.40.31
        for <devicetree@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 17 Jul 2026 08:40:32 -0700 (PDT)
Received: by mail-ua1-f53.google.com with SMTP id a1e0cc1a2514c-966e7380109so2206457241.3
        for <devicetree@vger.kernel.org>; Fri, 17 Jul 2026 08:40:31 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AHgh+RrD4bXLxy7SjKe8Q2Kf5aSMrCamIhR3F2sIesrswhCD+y8FZs2in2yrpqaPsG2mO6ihX6/RaE+GuIjI@vger.kernel.org
X-Received: by 2002:a05:6102:5810:b0:737:5c42:858b with SMTP id
 ada2fe7eead31-747534cdf79mr792514137.11.1784302830399; Fri, 17 Jul 2026
 08:40:30 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260604-topic-yoga_submission-v1-0-57c70c23d0d6@oss.qualcomm.com>
 <20260604-topic-yoga_submission-v1-1-57c70c23d0d6@oss.qualcomm.com>
 <CAD=FV=UaPKiGSL6mhVdywp67skSr2B7977f3kZ23FFHaD=95RQ@mail.gmail.com>
 <20260605152825.GA3740391-robh@kernel.org> <CAD=FV=U7jz-xwA+-Fic2thZaK6eCDhc-PZ1fqpCMAUmy3V3Y+Q@mail.gmail.com>
 <CAL_JsqK6u=x=ScTnW1jJCPZpCUb3mT0NZpsKqe6PqZmrNEKZiQ@mail.gmail.com>
 <CAD=FV=XBn78eOC_zG0S2U-W3whrVYEpghKF_WgX+3zpUJ82-5g@mail.gmail.com> <6e7ae036-e63b-4f83-947c-992f3199dbab@oss.qualcomm.com>
In-Reply-To: <6e7ae036-e63b-4f83-947c-992f3199dbab@oss.qualcomm.com>
From: Doug Anderson <dianders@chromium.org>
Date: Fri, 17 Jul 2026 08:40:19 -0700
X-Gmail-Original-Message-ID: <CAD=FV=VSgE5z71HzZwCiVKhYjt2CPesPD_HNejFZg4xMpV1bTQ@mail.gmail.com>
X-Gm-Features: AUfX_mwKjGGKjxDAeqITUG5KUm08CfVu1NRr1wpnrdcgFny_h3p0H-VAhH4pTdQ
Message-ID: <CAD=FV=VSgE5z71HzZwCiVKhYjt2CPesPD_HNejFZg4xMpV1bTQ@mail.gmail.com>
Subject: Re: [PATCH 1/4] dt-bindings: display: panel: samsung,atna33xc20: Add ATNA40HQ08-0
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: Rob Herring <robh@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>, 
	Jessica Zhang <jesszhan0024@gmail.com>, David Airlie <airlied@gmail.com>, 
	Simona Vetter <simona@ffwll.ch>, Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
	Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>, 
	dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,

On Fri, Jul 17, 2026 at 6:06=E2=80=AFAM Konrad Dybcio
<konrad.dybcio@oss.qualcomm.com> wrote:
>
> On 6/6/26 12:41 AM, Doug Anderson wrote:
> > Hi,
> >
> > On Fri, Jun 5, 2026 at 10:14=E2=80=AFAM Rob Herring <robh@kernel.org> w=
rote:
>
> [...]
>
> >> Well yes, people have a hard time using compatible strings that don't
> >> sound generic. That's too bad for them.
> >
> > OK, so sounds like going forward I should NAK changes to this file and
> > tell people to just use:
> >
> > compatible =3D "samsung,atna33xc20";
> >
> > ...to mean "Generic Samsung AMOLED panel with power sequencing that
> > matches atna33xc20"
> >
> > Yes, it means that if we find quirks with a specific panel later, it
> > could possibly be harder to work around them. However, since we have
> > several ways to identify the panel (via EDID and via DDC) this seems
> > fairly low risk. You can't perfectly predict the future anyway.
>
> Are we going forward with this guidance? I have another laptop with
> another ATNAxxx panel (ATNA60HR07-0) that I intend to submit a DT for
> soon

That would be my preference.

-Doug
