Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.175
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793790002;
	b=s9YzAn3FkoAa6XfnvIKwsKxWbruHxjej83VbPglyi5bXyt4xNhwgc5/hXzooaaRelIWi
	 oHe8YO1N5IPf6NrJeRcu/6kZbDgZih7BixqDxXdddyeiYLASN2FpkPNL6K1oJm0a44me1
	 rQjfPUB/hg5Uiq8hUgjxS+B45BGDFL1/Y3DZh66Q+JfzNXDiEUwjmgBZSCK9TkXd8/17r
	 bM+C3t6MooXwk2JnDu1ueGD5CfWr3w1WSICoy6DaeMEVq8qfV5w0lcNWAo3ZR8vbmydU4
	 b8jA9SNof34fWX079pgMi/KV/Pd0cnguB71GMX6ZF7hOPIjbNgeJJtlK4XoBApQJRkQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793790002;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding:Content-Type;
	bh=GwE8Z7d8hC2B5A2aORLBN7ModRReguom9RWoATcO8ag=;
	b=riTEt6AI67fEoucwzuYEGwNnJsHXy92o+BAc0sVK219Ydd0jFk55AlbVvWEoMNbtJo+F
	 y5T/qhESgn+OAPt1u4uGOd/iK2FDglEHyCq9JYwTayOTEhuLED/yl9IcRlqrRUdiGc77R
	 U5wivGQVWJYdlNo31nXhmTZT1P8P22Csg+Va28zYKLvCDtgFY/Hxio87tPTfqDGnya0iY
	 4lPclceaqJMm3gQHvil+vnVXuYqzkhuJTrtY0P88TdJ/3fR1MY6ole4rNxuYfBbtPJeUE
	 upkZI6h9oJ6FKykVTDpdYk9hmkM4B91EKyWf8+/+JyL/iDIefmuVA8Pobkm5jZSSomg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=biMU3aw7;
	arc=none smtp.remote-ip=209.85.214.175
Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com [209.85.214.175])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 31BA1606A328
	for <devicetree@vger.kernel.org>; Wed,  4 Nov 2026 11:00:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 31BA1606A328
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=biMU3aw7
Received: by mail-pl1-f175.google.com with SMTP id d9443c01a7336-2e5fb79ce82so2925935ad.0
        for <devicetree@vger.kernel.org>; Wed, 04 Nov 2026 03:00:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793790000; x=1794394800; darn=vger.kernel.org;
        h=content-type:content-transfer-encoding:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=GwE8Z7d8hC2B5A2aORLBN7ModRReguom9RWoATcO8ag=;
        b=biMU3aw77dPtR4+1MwwCrR1Z+AWwD7O9CXK/nOX8AdGa4P0fWDX4ZGkE6kLFX8JKL+
         FPbQNpOurkn3V67WJPHLnjR0skk4vVEUX0kzUMKovXWMLlXxMsUK6pxfXIvPA3nFOyh0
         n/GZ4kpncrWUe137AQauQMwzrqFkXiyDjUFyu778B4CiIiKs6tjeOnCR/Dh/F8xdBLep
         3bN1myXsbWXRldGmXttH1LjDOdAYFwNl4eqrK8Xt9SR5iG8tGluH3877uBSf+/cCceDr
         l4mL4SVDnzyjoJ2kd2vUEmAtD5JV6dtwZU3ruK7kz2IJSu1Q/yZfalzKGVEeyDxQTs4w
         hI7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793790000; x=1794394800;
        h=content-type:content-transfer-encoding:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=GwE8Z7d8hC2B5A2aORLBN7ModRReguom9RWoATcO8ag=;
        b=UxyHNkhAjPofSFAzEbLi/9aizvdjQpvbTANPJBlSSN0ZKDc9VmzAG/Z5fGw7gS/4nd
         fQcQfHKsYuZKyLQ4sw5oikdNS7eXQmwijDeOoiv5zJ9JLoD1EiazY1bD0zDYUS78FmJf
         p7W/X/Y9KpEh6hSEkb8F1Z8HzQNDIaPwwuOrzENGsZ7kvdQbdk/7mAKqJaFlFfs9eTrw
         1f3ewpbFQs4i+DIGw/xA+n5BzY7pyQigwNW8J8wyotdtUzcB6jDe9dRUJZHPHOwF+sCO
         hMho8qw7cL7vSCzKJDFSK7L40EvkhHUi8+E4lm/a9wIdlnWcYNR/Sncivt/F/xd5ItEV
         HDfg==
X-Forwarded-Encrypted: i=1; AKwUvBygCtEdlCKd7keTVhsTbiPbMYkPOVHPfix+wRAix1FsYFpPHiGjn20LQoszoAlpBxjuEq1Ga+eCOogL@vger.kernel.org
X-Gm-Message-State: APuU4Z/315ShFP1luKpMowaIGjxS1pUQ//5THgCMnvXcu5BwkN55FUlX
	NA5GPWnwzzoLfFpjCNMmoFsq3FXX2OJ2rrwtqg+1Uwzy2oHtwRyFhGEE
X-Gm-Gg: AYBFou0kEyp5qyP18KE1J43NevZVcIF2gv/O0Wles6wpMoe9naRVfZqrirsl+WZ2jPI
	Wd1eNCtqcd9IhjiRS7YGAN+uH0PezAdwbWY0oIMru9z1aWO7D75fA6tJsykjh5ClUYj9YUYE/9c
	R5eXXGMJoNfr1Av4I3zgPuiXGLy57koTh+0GbwlpTusdzf4SQJwPc5bEImzoae15MFUaIzui/Ar
	+/bG7OIH4aCsiMnxNXEbT1d7jofR41+xCThtkhgPetWIPKKVPDBy5IO2wtIZYeE4lYFgqF5UCDW
	qOtqJOcJLyOxMCSl8550yPyLKpCW7jrYXp6ZbeLlAv2s8WzIQXTPB20XYkqI+cPreaPaPIV+TeZ
	uwOeM7rkcntzienxYkvNkDQ/et3ib+2kX8LYMjuLVp967oN2hXsQDNcdsFQKdj1/kPKky9jp8Pr
	E5NxPQN/frfL97lQrhk9evhfQcrdwzDAOb5CGJSGTIN0fCldqJ5PX/LxmfmwuypHrjFjOldGTR7
	JPTHh3G6O0K8EMTMMHMiU/yQ/BLvBAjnI9UkO9c8V4tWWeZJrARFkVtPdgln2LOAAVVDtprjl8c
	0ba+AZkyDAK3rB7IsDkD4F8m57jeWkmU2O8uij1fkdFw2ZO9L2kBJSYzvNZSVQeyVEoCMGDUEjz
	8x6fY2OzGkgahEsO1qDNqfbLSJelnSNIvxGoT8mOwlagpOAkXv5wVonw+gylZ/7ZuuGilFaT9h9
	flO4AzzrfIGDLH9TkQ0fupTql8wg==
X-Received: by 2002:a17:903:1844:b0:2e9:8bd4:577d with SMTP id d9443c01a7336-2eb364de4d8mr153487635ad.37.1793790000537;
        Wed, 04 Nov 2026 03:00:00 -0800 (PST)
Received: from minako.localnet ([2403:581e:d87e:0:739f:50a5:e171:f133])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ed090f7313sm5843875ad.45.2026.11.04.02.59.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Nov 2026 03:00:00 -0800 (PST)
From: James Calligeros <jcalligeros99@gmail.com>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: David Rhodes <david.rhodes@cirrus.com>,
 Richard Fitzgerald <rf@opensource.cirrus.com>,
 Martin =?UTF-8?B?UG92acWhZXI=?= <povik+lin@cutebit.org>,
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Jaroslav Kysela <perex@perex.cz>,
 Takashi Iwai <tiwai@suse.com>, Matthias Brugger <matthias.bgg@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Shenghao Ding <shenghao-ding@ti.com>, Kevin Lu <kevin-lu@ti.com>,
 Baojun Xu <baojun.xu@ti.com>, Sen Wang <sen@ti.com>,
 Sven Peter <sven@kernel.org>, Janne Grunau <j@jannau.net>,
 Neal Gompa <neal@gompa.dev>, asahi@lists.linux.dev,
 linux-sound@vger.kernel.org, patches@opensource.cirrus.com,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org
Subject:
 Re: [PATCH v4 01/22] ASoC: dt-bindings: cs42l84: Allow referenced dai-common
 properties
Date: Wed, 04 Nov 2026 20:59:50 +1000
Message-ID: <nYufjgFVShG0c_ndRsefxw@gmail.com>
In-Reply-To: <20261104-eccentric-auk-of-zoology-55bcc4@quoll>
References:
 <20261103-macaudio-v4-0-637484efe46d@gmail.com>
 <20261103-macaudio-v4-1-637484efe46d@gmail.com>
 <20261104-eccentric-auk-of-zoology-55bcc4@quoll>
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"

On Wednesday, 4 November 2026 8:48:25=E2=80=AFpm Australian Eastern Standar=
d Time=20
Krzysztof Kozlowski wrote:
> On Tue, Nov 03, 2026 at 05:39:49PM +1000, James Calligeros wrote:
> > Some consumers may wish to prepend the codec's name with a known value
> > to identify a specific codec among many and set #sound-dai-cells. Allow
> > this by allowing referenced properties from dai-common.yaml.
> >=20
> > Signed-off-by: James Calligeros <jcalligeros99@gmail.com>
> > ---
> >=20
> >  Documentation/devicetree/bindings/sound/cirrus,cs42l84.yaml | 8 ++++--=
=2D-
> >  1 file changed, 4 insertions(+), 4 deletions(-)
> >=20
> > diff --git a/Documentation/devicetree/bindings/sound/cirrus,cs42l84.yaml
> > b/Documentation/devicetree/bindings/sound/cirrus,cs42l84.yaml index
> > 94062c1d9d45..66cae8b7db5d 100644
> > --- a/Documentation/devicetree/bindings/sound/cirrus,cs42l84.yaml
> > +++ b/Documentation/devicetree/bindings/sound/cirrus,cs42l84.yaml
> > @@ -9,6 +9,9 @@ title: Cirrus Logic CS42L84 audio CODEC
> >=20
> >  maintainers:
> >    - Martin Povi=C5=A1er <povik+lin@cutebit.org>
> >=20
> > +allOf:
> > +  - $ref: dai-common.yaml#
> > +
> >=20
> >  description: |
> > =20
> >    The CS42L84 is a headphone jack codec made by Cirrus Logic and embed=
ded
> >    in personal computers sold by Apple. It was first seen in 2021 Macbo=
ok
> >=20
> > @@ -29,14 +32,11 @@ properties:
> >    interrupts:
> >      maxItems: 1
> >=20
> > -  '#sound-dai-cells':
> > -    const: 0
>=20
> This should not be removed. Why cells of 1 would be correct? If so,
> explain in commit msg.

This was unintentional, already fixed for v5.

>=20
> Best regards,
> Krzysztof

James


