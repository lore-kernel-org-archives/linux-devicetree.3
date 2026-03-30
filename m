Received: from mail-lf1-f52.google.com (mail-lf1-f52.google.com [209.85.167.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C8FF23B4EA0
	for <devicetree@vger.kernel.org>; Mon, 30 Mar 2026 09:36:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.167.52
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774863369; cv=pass; b=WwUDoSZPZA6keq2Lx+0t3TnmeejHAOBfsDew0aCBJ2snV/je89RalhdXWZxh4FTaFoOkFnjlz9oIsshUQSK9tvMruYAGneGw9fVzrw/Djd6+UU+s6Aqb0EkHUftlMeXRKIMcZRPLQpPUjRNKi09jjQu2PtXbOaSL5DIDKUNoxq4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774863369; c=relaxed/simple;
	bh=ONNvpnHIrrlZOFnwwhyENzcT4/Pw+OdMUWkbXsdiH4Y=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=hZU5gPI8cb6t2kGSM55G0X/4EpvHSwgjK8K+NKG6VYfb+9yhxly7doBdG6BJhDRJcgaZzLtUMgqcN7qnOgBoZXyUdfaHPOAktl2RF5roD88WyFcpM189T4RbmGfHagm6R9z4Tgw0SZLzcYOmpWSOlX8ZmYU0iKqvVWDQaj/pxb4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=CRSi/7ZD; arc=pass smtp.client-ip=209.85.167.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="CRSi/7ZD"
Received: by mail-lf1-f52.google.com with SMTP id 2adb3069b0e04-5a2a70bb69eso4401047e87.2
        for <devicetree@vger.kernel.org>; Mon, 30 Mar 2026 02:36:07 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1774863366; cv=none;
        d=google.com; s=arc-20240605;
        b=cxFcP6BKsqIuY6ooDG82LYsaKrtu/LuOAmwEXoEOppRpg3rMkmuYFms7OPM+dOnBSN
         Tp6GTyktIOz9Vz5sGnnsaiEQHj4R+vLYndeExmW8JzfKMQ0sn30ZDwVyglC2iILIjDOx
         MwJxaGMtGS51ClOGj+zX6vDBekCWte24OfRg3Kf0FUTqdJVOxGfq4VULHBGEZYmP+d3c
         u9LHX+SG9uGcnA3n1QokHTTfN2s3YKsv0sYwpy5pLjx0NDH3q5nZ2LDptLpJEJnAN2Nl
         3F74tpGGVorMVEIs30W3XXtnius/h2giHR4s1FxJ4J6j0z1Xt4mMS1uCR8PGxlmQjatX
         QBNg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=ONNvpnHIrrlZOFnwwhyENzcT4/Pw+OdMUWkbXsdiH4Y=;
        fh=vQ1zbQFYt3pbADp+2bNh8ScDxUV0Y1kLiZbLYcSxofs=;
        b=Q6MundVyWdJ3qxzerCuvuoVzL09j1bdwNNgobtjQ2Lwe5LE+IGCu6D2IKTZ5pWYIg9
         ziEVew7ocC2zTCOvS2n5C9c9LINTB8/lRsGcfySAQYYKJuDUqIAwe8LK/IBffk3iyz8v
         ie0T46fVj7I+KD2tP0CV2xPQwTY6da2T+xAl6hAuxv1IvUTN3NLj7DL/5NlZjSY7ti4k
         tt4o7XY4z1JxjPkTQqo6A8rD4SuZA63mLXLY480fh66P8HRs8HsJYk4K5Hux4Mnmcc9Y
         QXu69Y0gZGVcQpewBQnEXFWLXsl38sJRvKC32+KImFaAXXyJQKOCKeR4eatmndo5Ji4X
         Jz+A==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1774863366; x=1775468166; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ONNvpnHIrrlZOFnwwhyENzcT4/Pw+OdMUWkbXsdiH4Y=;
        b=CRSi/7ZDuKWXilmc3FY+3Bnk1VRP9QLydDioAxl0zVSANh9b3dNbIkgLYE7FI68ATx
         yQvP0+gZtynI/Q1XoCp3oQqWbcR6MGRFHYdRrIz3J7iFqtFI7xxpTZ61l66YqDHcplnG
         SfBkf0byTHORQQ5Ym3pTSE+56AiX4bTMlrk9g=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774863366; x=1775468166;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=ONNvpnHIrrlZOFnwwhyENzcT4/Pw+OdMUWkbXsdiH4Y=;
        b=cKZxv8u7Bo4sVFqply8O6FzfrWeXI4SzilhNvPsadAHVN4fPOvttU3zlYqwqWyexxZ
         VI7OecGVD2PQLuh0GFuanu06p9/LLEaL1jwo85gTCN8HlD3cq1gn+fnjjoV6mYyLA6eR
         +O6BoR+5TNrpZ3a5OtYBIyCTJwHl129Wx1gcxJL8r5cUFc07vgsQRffhqFEZAQsSHEU2
         MXj3NocJpp7wu9cCIpOtsCnYsijTgnvSxftW4zUNpb/Kx51YLypShBpOpDqywKelRxwZ
         VaoX91UtHm7MGM/yVd6ACPkmCQ0moyeatyPXXPuOJ/bQStw00FgiS6D8oQNvM9fuEvat
         0owQ==
X-Forwarded-Encrypted: i=1; AJvYcCVH3CL630Ege+XvbLWcicTFTO8ubyvFoQA4/iWwYJFNFtNoQ1kfDxRPHKFfnADCQ9adoX6CNW7LdSgH@vger.kernel.org
X-Gm-Message-State: AOJu0YwY0Lb9SzjUWKGYI4ow7OXt/rxGtS1P41ndhw+jI5GjVBetg31X
	z9kD1PHRmCTlHGUWe7QmgeB7j4zVpySZ8jws+PPlXoXAOu1qN/GgloKtBlQdBzFodPlgaEajs44
	vguPZLTWy5aXN2h1T+Qssajwx1unrFrLjvOEbvJfE
X-Gm-Gg: ATEYQzxVtqDVKciWTRgoYzIzR232JuLP+jmi9x0HL4JEz+WMslz9ZR2zNVMCu+A/kXc
	sSGaqKQl7pcX3ZwBGq4snyqTyQFn6DFjqfeMIQiQFSIDxlvfWCnMyKurR9TXu4MJ9kzAc3bYGJW
	41U63xJYd9ewJu9BkHZu58+QThX6Gm4ZtLZFT0h4dPyNGfgbc8Fh5xinI2HBwvorlk9UX94Cy64
	jrlnTVgS/KNoulhtP+zusYvdO9PncSsRyAxNQtl+xBDWSEo2YQix6q6m1DpqSEaFS25c51KIFUn
	h7HAXsrwO5dZL7/MFeD4JW8vPDxxykFOTN9e
X-Received: by 2002:a05:6512:3f12:b0:5a2:7aeb:e7b3 with SMTP id
 2adb3069b0e04-5a2ab92ae11mr5011592e87.29.1774863365955; Mon, 30 Mar 2026
 02:36:05 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260317184507.523060-1-l.scorcia@gmail.com> <20260317184507.523060-8-l.scorcia@gmail.com>
 <CAGXv+5GmDtrtFHJXs+fDyF+dZ5YW-TSEqXnPs2xCH8cu-Xcn9w@mail.gmail.com> <CAORyz2J355NZH=7iQ9sTDBhAmtjP7xTpXe21_3Z9J_R5YvdXAQ@mail.gmail.com>
In-Reply-To: <CAORyz2J355NZH=7iQ9sTDBhAmtjP7xTpXe21_3Z9J_R5YvdXAQ@mail.gmail.com>
From: Chen-Yu Tsai <wenst@chromium.org>
Date: Mon, 30 Mar 2026 17:35:54 +0800
X-Gm-Features: AQROBzDDuO289B2CM0DmVnpmaCFifXhpUymo-5rQ6aPBkZTqTiIMBWQIo9x2VA8
Message-ID: <CAGXv+5HRWRW=+Mk2z4qCPrF7zFax9zQJ70Q4ihR6PkWJP0OUrg@mail.gmail.com>
Subject: Re: [PATCH v3 7/9] regulator: mt6392: Add support for MT6392 regulator
To: Luca Leonardo Scorcia <l.scorcia@gmail.com>
Cc: linux-mediatek@lists.infradead.org, Fabien Parent <parent.f@gmail.com>, 
	Val Packett <val@packett.cool>, Dmitry Torokhov <dmitry.torokhov@gmail.com>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Sen Chu <sen.chu@mediatek.com>, Sean Wang <sean.wang@mediatek.com>, 
	Macpaul Lin <macpaul.lin@mediatek.com>, Lee Jones <lee@kernel.org>, 
	Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, Linus Walleij <linusw@kernel.org>, 
	Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
	Gary Bisson <bisson.gary@gmail.com>, 
	Louis-Alexis Eyraud <louisalexis.eyraud@collabora.com>, 
	Julien Massot <julien.massot@collabora.com>, Chen Zhong <chen.zhong@mediatek.com>, 
	linux-input@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-gpio@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Mar 30, 2026 at 3:39=E2=80=AFPM Luca Leonardo Scorcia
<l.scorcia@gmail.com> wrote:
>
> Il giorno gio 19 mar 2026 alle ore 06:04 Chen-Yu Tsai
> <wenst@chromium.org> ha scritto:
>
> > If this PMIC is anything like the MT6358, then it has 0.01V fine
> > tuning for most if not all the LDOs. It is sometimes needed as
> > a rail may have a 0.04V boost that would otherwise be invisible
> > to the system. And then if you have something like 3.04V set in
> > the DT constraints, you end up with something the regulator driver
> > doesn't support, but the hardware does.
> >
> > Please see how it's done in the MT6358 driver. I spent a lot of
> > time on that driver to make it actually support the full range
> > of voltages, and describing the supplies.
> >
>
> I had a good look at the datasheet (MT6392 PMIC Datasheet v1.0 08 Dec.
> 2016) and unfortunately I did not see any fine tuning option in there.
> I'm sure this data sheet is not perfect as it's missing some regulator
> registers that are clearly used in the Android sources, but there's no
> mention of fine tuning in that code either. I guess it does not have
> that capability.

Well, thanks for looking. FWIW on the MT6358 / MT6366, the main voltage
control and the fine tuning are mostly in the same register. The fine
tuning is described as "calibrates output voltage" from +00mV to +100mV.

I looked into this because the LDO table shows some of the default voltages
with 0.01V precision, but the main voltage controls only have 0.1V precisio=
n.


ChenYu

> I will shortly submit v4 that hopefully addresses the rest of the comment=
s.
>
> Thanks for your help!
> --
> Luca Leonardo Scorcia
> l.scorcia@gmail.com
