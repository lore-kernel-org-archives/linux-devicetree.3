Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8C4AA433AD
	for <devicetree@vger.kernel.org>; Sun, 19 Jul 2026 13:29:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784467791; cv=none; b=fehc5KDqBmn5kKm7V0Ph2+3EfWm23RrHgYctOTgjI5IPUaifmH3MX2gsajOaiBCfAo+goO96601y6TCC8Bv03X4hvTAVm823gc/flwoUOLsHuJ0cB/LEPIU/m07HW2hyJ4Pp+aGOU2OBAoQYSdwmh59/JfOpzDnyt3XFCi1x8Bs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784467791; c=relaxed/simple;
	bh=Xaq7RQ3DmIHqyyvVvwMjeuLuuIAP7Ugenr1ER60EbtM=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=FYWqS+uXEEIoXddhpqoQ8GNKUzx05cjM1y9MYdqBlrpyqOntZsZBbHH/cvctFbTfpQ6oeKDJVbY+xDcJLXieBIB4aObOLisujSYkc8aRubRIDHaD7Z2RaT6b86yTaRBoVNRmxUTLYlhffT7CBrcY10Ve0wruUwM5db3XlSrHx9M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b=njfPPkRB; arc=none smtp.client-ip=209.85.128.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b="njfPPkRB"
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-49548e01d02so9684155e9.0
        for <devicetree@vger.kernel.org>; Sun, 19 Jul 2026 06:29:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1784467787; x=1785072587; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :user-agent:references:in-reply-to:subject:cc:to:from:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=oTTnLvB5EKr1ilWHZeKrVDJrENmEbx/nOStJCKmeMiQ=;
        b=njfPPkRBoGlVv2ArYuZPZR2D3wW8m5WWYQduo+n5egLfyRUZUEu/K/cQmmvuavdWpo
         uYAACsGS5yCvnI+wk059pRgWihoUvLN6mixIjmHp5p0U1eHgHQCYPN/xlLT06ukXsFdN
         Y0uI/6CpWCBOBfeL7ZOUDHlGI711QdUm0iucH+JzWFKrcQdLIcTpQ0kCIuJ0CkAC/DUh
         LT+HcNYxfGvUurAh1gTc1WW7UNpBZhYMds0rMNG1+Fq8rCjC/AwuLZ9aMlt8xoBKCu7I
         nzKjMAW70ieALOWlrTk/7QHK3GJlDakpgThf6slLtX3KLbV0Yf7juMxE2YhAIch5PHQg
         bj8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784467787; x=1785072587;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :user-agent:references:in-reply-to:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=oTTnLvB5EKr1ilWHZeKrVDJrENmEbx/nOStJCKmeMiQ=;
        b=qS2xgAA349rtvLJrWgpr4Hu0vNOLPxc3tpMhoPlOtM8DTZ/90nBFSgg7b65t5/v1g1
         89w3cECntXs7wC2MX0aUa+kDjskGYvI9cz2f7Dure7BndLfJqVeNKj1/KPRcimQ/SBcP
         JufbnvLTveQdXPsCTAdbWcuqp2rekEoEpX7S+ObcQJSx64GrRdlTHvy9KZzm/voHy0Xk
         omgd8H7uz4d6X8alUx+KTfcn9RZjZX8zszBwIfZkC9cI3aytNzGDAG3ULZh7EvQSCdRk
         LdKOZ3K0XzFnSQbeBEqXYzKniVQkiyzUdu1FPJ1sHgNhQpvgyBPhdqNUpSZv1v+k7tdV
         NW5A==
X-Forwarded-Encrypted: i=1; AHgh+Rr3fAa98JCuwP0qazYrxo+VHshxx2XOkCgpJN63lY3rQR3VOoggmwCox5dVlpmyCRrpT5sE0VX//AZA@vger.kernel.org
X-Gm-Message-State: AOJu0YzvxG9urS4VBtDDrH6WoMwMWq/nYhI3YWwzFjDSXZmCNigCYq0k
	bJuhIZsMn7V2kTe9kzc4gN11lgwp5J5Ocb76aM2Y+4cQeDuEWKnph1QWBtTqXU8Oeb8=
X-Gm-Gg: AfdE7cljV/OHdKzcL6w1zEXS6uPtkfShMJuQvILzpSYyZNoomX1KegSZBXknC5LEWOL
	auqnxZ+8gD3C7+xGR3KEnBwqCHXQTv34tF9CW9HUgd0g/0gKS2+GE4GTAdIZJBr5PvUmbPomTtl
	1F7HJ7HAtvYoYYIu3A01SPl/2FMLi/Qh+3Lg2yAAtwaqU+4gqRADQsh0G4St6B7yn0rHKz13+1A
	NI3F8aeovmX6nq8M1xhcU8D7x292t+RjVwBRc4pTgZbZ1cRhtUOJGckJXgi1VwHMSZqMFNqdU2T
	CXpfvQvhSP/Ovzh0WSRIADTzybK173DSsdyGRW4vs/SnNFk8s4TvMGYEwx2x7lzSBsDQT7ldHOt
	zfaWTdEr0Cq4psIL6fYdlXd211O6aQOp8R5t0duF+ABV++JV+qINJ1xsF27e9QJEHxBIUlTyFRO
	Q=
X-Received: by 2002:a05:600c:4743:b0:493:bc4a:fb55 with SMTP id 5b1f17b1804b1-4954a508d60mr115272795e9.38.1784467786385;
        Sun, 19 Jul 2026 06:29:46 -0700 (PDT)
Received: from localhost ([2a01:e0a:3c5:5fb1:9a7:ef90:b513:8cdd])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-4954a2b87c6sm353074595e9.7.2026.07.19.06.29.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 19 Jul 2026 06:29:45 -0700 (PDT)
From: Jerome Brunet <jbrunet@baylibre.com>
To: Chen-Yu Tsai <wens@kernel.org>
Cc: sashiko-reviews@lists.linux.dev,  robh@kernel.org,
  linux-rtc@vger.kernel.org,  conor+dt@kernel.org,
  devicetree@vger.kernel.org,  linux-sunxi@lists.linux.dev,  Alexandre
 Belloni <alexandre.belloni@bootlin.com>,  linux-clk
 <linux-clk@vger.kernel.org>
Subject: Re: [PATCH v5 2/4] clk: sunxi-ng: div: add read-only operation support
In-Reply-To: <CAGb2v65PmMnm=gusbVRJqwHkMFAdKpFyk8coXK=pf0-dBgv8kw@mail.gmail.com>
	(Chen-Yu Tsai's message of "Sun, 19 Jul 2026 18:59:33 +0800")
References: <20260717-a733-rtc-v5-0-3874cc26abf7@baylibre.com>
	<20260717-a733-rtc-v5-2-3874cc26abf7@baylibre.com>
	<20260717154005.444E41F000E9@smtp.kernel.org>
	<CAGb2v65PmMnm=gusbVRJqwHkMFAdKpFyk8coXK=pf0-dBgv8kw@mail.gmail.com>
User-Agent: mu4e 1.12.9; emacs 30.1
Date: Sun, 19 Jul 2026 15:29:43 +0200
Message-ID: <1jqzkzds54.fsf@starbuckisacylon.baylibre.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

On dim. 19 juil. 2026 at 18:59, Chen-Yu Tsai <wens@kernel.org> wrote:

>
>> > +
>> > +     } else {
>>
>> [ ... ]
>>
>> > @@ -143,3 +157,15 @@ const struct clk_ops ccu_div_ops =3D {
>> >       .set_rate       =3D ccu_div_set_rate,
>> >  };
>> >  EXPORT_SYMBOL_NS_GPL(ccu_div_ops, "SUNXI_CCU");
>> > +
>> > +const struct clk_ops ccu_rodiv_ops =3D {
>> > +     .disable        =3D ccu_div_disable,
>> > +     .enable         =3D ccu_div_enable,
>> > +     .is_enabled     =3D ccu_div_is_enabled,
>> > +
>> > +     .get_parent     =3D ccu_div_get_parent,
>> > +
>> > +     .determine_rate =3D ccu_div_determine_rate,
>> > +     .recalc_rate    =3D ccu_div_recalc_rate,
>> > +};
>>
>> [Severity: High]
>> Could the missing .set_parent callback in ccu_rodiv_ops lead to a silent
>> desynchronization between the software clock tree and the hardware?
>>
>> The struct provides reparenting capabilities via .get_parent and
>> .determine_rate, but omits .set_parent. If a rate request causes
>> ccu_mux_helper_determine_rate() to evaluate and select a new parent, the
>> Common Clock Framework will apply this new parent in software but skip
>> updating the hardware since .set_parent is NULL.
>
> This is an issue. I'm not sure if what Sashiko says actually happens.

I think it could. I've defenitely made a mistake here.

> But 1. this is "read-only divider", not "read-only mux & divider",

The correct way to choose between the 2 is CLK_SET_RATE_NO_REPARENT I think.

> so the .set_parent callback should be provided. And 2. this is using
> the ccu_mux_determine_rate_helper, so it's possible a clk_set_rate()
> call is going to cause a reparent.
>
> I can add it while applying if there are no other issues.

As you prefer, I don't mind sending another version in a few days
(giving some review time to patch #1)

>
> ChenYu
>
>> This would leave all downstream clock rate calculations incorrect.
>>
>> --
>> Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260717-a733-rt=
c-v5-0-3874cc26abf7@baylibre.com?part=3D2
>>

--=20
Jerome
