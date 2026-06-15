Received: from mail-dy1-f180.google.com (mail-dy1-f180.google.com [74.125.82.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 08FE62BE02C
	for <devicetree@vger.kernel.org>; Mon, 15 Jun 2026 06:25:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.180
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781504739; cv=pass; b=B1JXqvU9UQFhHfYNrvOP9SmaQs+OD8s9FgkPnLZsZ35lyCn1kYMn9+4SnVaBeTA1X51b02PsN4jN4x75LrR3SSEeBSc7y8hrOOWYU83c2kzKunDSTU7blTNDREjZLACORV3xmw8Yzx3gH4AFbz57zcsIW2H6rmh7yLHaKuXQS88=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781504739; c=relaxed/simple;
	bh=cTBQJdmyijZHrpb9w8OjvsAHRwSnSuXQJu22SvXmwsU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=dVVazHO8dbQ8920yXGs50LO1LukhZ2yBi9hFHIIbqPYeXPzbr4rTnrEypE5w4pCiGPj3Klx1OMvw7poynNA0VUhzBR20YvCxcv4JMGwsZ92fHdvfa5mSXiTNmx1Tu7D55EJv+rMl9IGdm2GKP+lqErqS0QgeeMRJWZj6Y7l3iio=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=cTMHsIa5; arc=pass smtp.client-ip=74.125.82.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="cTMHsIa5"
Received: by mail-dy1-f180.google.com with SMTP id 5a478bee46e88-30b932e4bf1so334565eec.0
        for <devicetree@vger.kernel.org>; Sun, 14 Jun 2026 23:25:37 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1781504737; cv=none;
        d=google.com; s=arc-20240605;
        b=P0eDjNQ+jWv+lwkUSrvp3SGAdvo+ZVfqJrNxlG3bR33z/hveKxET9L8dF9g3pBFDa1
         W93vopnOlnChjCiyYAapoXpy9BxlVIh1y8R68D5LLre9ftLbxQ3MFBHgoKHWrxj1NIy6
         Oy8bknQB+u89dL8Z/GiuMrHC1Bb7LFWDSuTfAi9hYUnNO5gvvZgFbkyfzZzZqLcTyxak
         gVBDNuheflLuSbtjUvAS1kIDpOuT3t2mlYSmGaEdxPSqDjhsA8sOhYByTGDtbpYzHw5/
         p0HoLiSvxngPsuA1lHx/NnTZlesev6Vkt528b6rqfDUGhPxJpfJuwTyZL4WGkoQiCqfB
         +vaQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=cTBQJdmyijZHrpb9w8OjvsAHRwSnSuXQJu22SvXmwsU=;
        fh=vMiHYfSDyuyyOuTJZubTBf3R5X44Cb6TThfPCNRz9EU=;
        b=ilAzBJ+o1OgV4X1/frdt+MED5ZWnlowP+tYqn2qnX+EgENu26gd57N4HimPWymV/Jb
         Wr02ZpsgYDNSQpWwiqip62GYx+gi3QdQvNfsCnjnh1HWYgviUHSGqu0U95pagPOOJESj
         VnoiYnTWJOJOaxwCQNMXulxLx8p/rAw4ofwcBoSr8UOg+jE/kMY5NIY+EUy/tVjpdYwD
         SHNa5Kcw4VCSwPiGkUfHWqiLuzJIT1PH6+mjqy+8HNtYj/Zw+EQwG+T16tXX7t3yWV0S
         UFiVzIulQGkFSvXvx+7/WHcw6vD7pgaytHfJ8fricg7jDiMm90Y5vXINpfZwebuCIjzz
         W18w==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781504737; x=1782109537; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=cTBQJdmyijZHrpb9w8OjvsAHRwSnSuXQJu22SvXmwsU=;
        b=cTMHsIa5P/7U2nvFp1XtT4YU52P9TZl+jkyLhai9jXpPqmHGWWivrdB4lNMpD/aIDw
         oMTv+HKPnnWV11vmD2KxwZ13u6Cd4ZLlVWCK5CqDz5po2hb95mjRYg+FohYJCQoktGRF
         0SzTvDsbhwIPLb9Upp9AKKAOlE2aHewDTeFX7rVP+mMwMzEdTTsXs4PB9pCu9V+8g+0j
         1VKTho5e/u7Yb50GJy3djZoDVgWFQehJhGJpedTZ9BqMA8/aBbGQ8dfVByHyUOSNLM0m
         5jA560dDpYP+g8y0BE99TvMmltMRBljwT0b/hg4I/za0XBU85tqtyaUFrNyKiumeyegJ
         QZMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781504737; x=1782109537;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=cTBQJdmyijZHrpb9w8OjvsAHRwSnSuXQJu22SvXmwsU=;
        b=nNKLoDM3agpbjWYgZr6dw5qw1uJtXu9lUzYfOk8vi8OkbKEJp82hZKYqcqEvsj/HGa
         WqX7QG9FQn8ms2kIgScPBQv1dL7AXsJx4We19UQUoDrwPRNNmkB59l/f5GZAj51s7otX
         L/BVk5U1sADIgzA/5SDnuT2fSgwF29ZOB9SUJ6v0vQIQxEgP6zNByO2eMSt3ZlLZTKu6
         vtZgINxibH4tZDzRRHGKX8jJexPPG1qjEtIfX06Sw9zRXKOlNfSnqoI2nN+40oSL8iLa
         y6bzmmMr4qtaBX4hUDyIEz2KWkU+3CQaIBQlQXWXaUklFV714YzClMyz7kH5tuYKeIfQ
         1kkg==
X-Forwarded-Encrypted: i=1; AFNElJ90vcWp7Q1sPaypMpqGzKQMFvIt3KOglJcVrAaYVtgxsgx0TM4pFeWcTEavbP2/OlQcgxHBlmAbgrid@vger.kernel.org
X-Gm-Message-State: AOJu0YzNclTPq9E9BXhgVlFMN7U7s9877G8ycgl7bK+kRsgMHiBB0DzY
	qFdsz3cRBT3PDXKtGACmwq1/WT1t3uF5/RDrVK9AyX49Zz/TFg1kXOlfxt72Kkbi8vg88kA3V9F
	TeCHLt9pKY930RN3cqN8oVVfpW7gTgxE=
X-Gm-Gg: Acq92OHwHAuJaqgxB10hRCeeYhOMIDcxs8qxOYfRPZ99jg50iwq3nRD9HtI+fvGg7y+
	Cbuf2PmsjiwL/mNjFGB1yVlCzrrqbhzSZMN4OsW5oh/AaF2esdgpLcX69XuWG7Ywj6nthhhUI0R
	3ftWT3/jDDzybCvMA12ABcOTKgefD4GtuvzBIpaNZjWs70SzOC07Dexilm/+/20iEc3r0SJq148
	vN5+XbY20OmKbt6vZCq4lmVvq3O6Ulegl8CFaNmDYFAKmIA8cFlW9rUhzGefQ+RUNixIOHPEj1f
	VMfkLcvD
X-Received: by 2002:a05:7300:2d09:b0:304:3c33:7ad4 with SMTP id
 5a478bee46e88-3093a514e9cmr4694274eec.13.1781504737180; Sun, 14 Jun 2026
 23:25:37 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260520182124.117863-1-clamor95@gmail.com> <20260527151432.GE671544@google.com>
In-Reply-To: <20260527151432.GE671544@google.com>
From: Svyatoslav Ryhel <clamor95@gmail.com>
Date: Mon, 15 Jun 2026 09:25:26 +0300
X-Gm-Features: AVVi8Cfj4CFtRay_yHgb9x-k9rdyWbOqU0lnoe6TjkW8GjWPr84WyPCoGmkU928
Message-ID: <CAPVz0n33PRWgLHqaD_wVr+Dji+22Bm2gCdA1cSMLuKHYJ4T5iw@mail.gmail.com>
Subject: Re: [PATCH v6 0/6] mfd: cpcap: convert documentation to schema and
 add Mot board support
To: Lee Jones <lee@kernel.org>
Cc: Dmitry Torokhov <dmitry.torokhov@gmail.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Pavel Machek <pavel@kernel.org>, linux-input@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-leds@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

=D1=81=D1=80, 27 =D1=82=D1=80=D0=B0=D0=B2. 2026=E2=80=AF=D1=80. =D0=BE 18:1=
4 Lee Jones <lee@kernel.org> =D0=BF=D0=B8=D1=88=D0=B5:
>
> On Wed, 20 May 2026, Svyatoslav Ryhel wrote:
>
> > The initial goal was only to add support for the CPCAP used in the Mot
> > Tegra20 board; however, since the documentation was already partially
> > converted, I decided to complete the conversion to schema too.
> >
> > The CPCAP regulator, leds, rtc, pwrbutton and core files were converted
> > from TXT to YAML while preserving the original structure. Mot board
> > compatibility was added to the regulator and core schema. Since these
> > were one-line patches, they were not separated into dedicated commits;
> > however, the commit message notes this for both cases.
> >
> > Finally, the CPCAP MFD was slightly refactored to improve support for
> > multiple subcell compositions.
>
> Once you've fixed the DT issues that Rob pointed out, I'll merge the set.

Hello Lee! This patchset already contains fixes Rob pointed to. May
you please merge it?

> --
> Lee Jones
