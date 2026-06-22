Received: from mail-vk1-f173.google.com (mail-vk1-f173.google.com [209.85.221.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A3217346784
	for <devicetree@vger.kernel.org>; Mon, 22 Jun 2026 19:58:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782158311; cv=none; b=baYUR2GQCrJvIo+oo6ujHA+2N0Z8QVUAOMXY4y9EoeeBmKfEx/O/ED8KHad97NLf1wLOHhNVi3ya/VhBoD0BU7qY8c2g3PNIaZqh0UECO565lR94qG+b1VW7TmxzQTtpntLeETiWpyYwbMzGz1kdQcZ08IzdgxBcynT0CBwQ7V4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782158311; c=relaxed/simple;
	bh=57iPWVB8HpWp0SdT4SzBj6beLry4v517MZiKZKOMruo=;
	h=Mime-Version:Content-Type:Date:Message-Id:Cc:Subject:From:To:
	 References:In-Reply-To; b=FDDLb7XSl7YxsbcJVgyKN+RM9IUYrbcLkZEVrjR6pAU4zURCl6g71Z+XuxjEDKwLE5Enmg2dkq8gf9R00TZr3K5DnTSwKJxQ7CrFgx4vKaYC+zCqxure6M/A8Gci5R9epZ1PyQ4peUAIuVb6n8IatHP7AE0XJQYavshZR7lAm20=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=edadIgwU; arc=none smtp.client-ip=209.85.221.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="edadIgwU"
Received: by mail-vk1-f173.google.com with SMTP id 71dfb90a1353d-59e2b96e3d3so3844837e0c.2
        for <devicetree@vger.kernel.org>; Mon, 22 Jun 2026 12:58:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782158309; x=1782763109; darn=vger.kernel.org;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=UPcWyCPirypMBAoOJux8HWZTXODBq4tSyUnE2Pwfp0M=;
        b=edadIgwUcMBqe6BVas9DmhERkFZM3K3iTBsqRqqILvHOxFHu07wwwqokVFDys43cms
         b0uIXze6A8ccdzZtI/4bbjjw04kiefg0Z33Sre5V3sWQYM3fLBJe5NKl05EgkOqkEMc9
         5eDuaYYIElFN9HUN2fohKit/oK35/GZW6ONhVIAXU4tEBkYpR8Y20/0Xrb1LaqImn2VB
         1PNxAK/K4a5ARqPdUbLz41S+4xEnmekc5sXoFhWqyzkOYyWZRC0O27ePgs25JF6b3bNT
         5LpyIpvhoYO9Exk7rW0VbQrGGjOsNSR2S2SZSERKBMsftf2vWO5XRSpHCEXDuwAdsc+Z
         VDRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782158309; x=1782763109;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=UPcWyCPirypMBAoOJux8HWZTXODBq4tSyUnE2Pwfp0M=;
        b=e8/3a66oGNoVwbq2/oK1Fh9BcQfMFSVZ5aT59qSVOcdahvWEezbmpHOhjYqFosP67o
         wx5sD6SgQ1VZnuWEzPGK9oaMIPuRm8Rkd/DqSvwcKjqs9ETcapcWIt13J7/t2Ns+0thL
         DWaJREG5y688M98tfFXaMufbt/dPMs1Dg3FAB9ooGUL28/GEqcLBVh+6qosfVn0CGHRp
         QsawZysCn4DoriOy1JXxyGE22zfy189SzmsAta+Y/KI9PBeTZFnfFo3oY1SK0Ga0zblM
         PdH/SKMabfFwY8LMJa3GgjanWQ1bg2yXztfn8/lwtUhr6k37r70LPrAo57Zm+6aUPOB5
         13TQ==
X-Forwarded-Encrypted: i=1; AFNElJ8CmLvHq6YrNg1Ju8KPmCfd++OfygakgJS4j06p+OFNnzLeN8dhJteL1MoofZcFTXkbSFo3ly96Otp7@vger.kernel.org
X-Gm-Message-State: AOJu0YxzuR/cPae4Qgt/jgN1JOTBjJmHvI2pHNUt0FAQwGAIL8dFAVYf
	8TpI3FBqWFKJZoILHK35Jj+d7ZHhSN42Db5vJiYCWvtgTJiJ+0ck1gV6
X-Gm-Gg: AfdE7ckpr5R/FBrr6+0FzZiUksl04lmrfzQSZ5DUYt8Lj0I12xgBs73FBn+nDD3+mf8
	JJ0ShCOB6YeaqN+/79q4KvGx0z+bM6TmsHRfx9Ux1v/UO8J4OxIbVwRIj3hHRf2vtNan0xFy1KH
	d6xORErZ7b/DLQ2d8VwqC7ZWV4/yfOCdJ5R5BjCfedbtjPzNKb7BrVj6N6/LsNxJmg/cqQ7g34t
	d5/SV4Oa5Edec6bV2v2hJ2P5A1wkP3RYFFpNF34p82ZeWnd2y+3IYKMMkFzfXjiNj7OEQBY6Hk0
	LaTVFIaCGq2qzt5WDLzs1CrVEJ0SdTdpGzg+vRYj+itFK52T7i03spF8AQY+3AgDVdoHobJA8+9
	lLKCeIxLkXjONP0OsXv54moGCFh9nBTE3WwEr/9R/FkIU/sOCuYdB2PxkJeBXIOpxYHhB4L5RkO
	/mRZG7
X-Received: by 2002:a05:6122:3a0c:b0:577:51e4:ef20 with SMTP id 71dfb90a1353d-5bbebb85e52mr7675795e0c.10.1782158309668;
        Mon, 22 Jun 2026 12:58:29 -0700 (PDT)
Received: from localhost ([2800:bf0:177:563:8f3c:3421:b12:7a09])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-5bbfb878c91sm7631669e0c.6.2026.06.22.12.58.28
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 22 Jun 2026 12:58:29 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 22 Jun 2026 14:58:27 -0500
Message-Id: <DJFUE81GZEEG.35TP4FFBVE63B@gmail.com>
Cc: =?utf-8?q?Nuno_S=C3=A1?= <nuno.sa@analog.com>, "Andy Shevchenko"
 <andy@kernel.org>, <linux-iio@vger.kernel.org>,
 <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH RFC v2 0/3] dt-bindings: iio: adc: Add reference,
 excitation and burn-out properties
From: "Kurt Borja" <kuurtb@gmail.com>
To: "David Lechner" <dlechner@baylibre.com>, "Kurt Borja"
 <kuurtb@gmail.com>, "Jonathan Cameron" <jic23@kernel.org>, "Rob Herring"
 <robh@kernel.org>, "Krzysztof Kozlowski" <krzk+dt@kernel.org>, "Conor
 Dooley" <conor+dt@kernel.org>
X-Mailer: aerc 0.21.0-0-g5549850facc2
References: <20260622-new-channel-props-v2-0-aafd5369f253@gmail.com>
 <42e544b8-f2da-450b-92bb-99c41f1c72fe@baylibre.com>
In-Reply-To: <42e544b8-f2da-450b-92bb-99c41f1c72fe@baylibre.com>

On Mon Jun 22, 2026 at 2:38 PM -05, David Lechner wrote:
> On 6/22/26 2:30 PM, Kurt Borja wrote:
>> Hi all,
>>=20
>> After submitting a patch series adding support for TI ADS126X ADCs [1],
>> I was made aware by David [2] that at least two more chip families,
>> ads1220 [3] and ads1x2c14, share very similar features (though these
>> chips are not really compatible between them). After that, I found one
>> more chip with the same features which is already upstream, the
>> AD4170-4.
>>=20
>> As David explained in [2], these chips are intended to be used with
>> RTDs, thermocouples or other resistive sensors so they share the
>> following per-channel features:
>>=20
>>   - Configurable reference selection
>>   - Burn-out Current Sources (BOCS) for diagnostic purpuses
>>   - Excitation current sources (usually called IDACs TI) for sensor
>>     current biasing
>>=20
>> Given that these three features are present in all four devices and
>> three of these drivers are still under review, my proposal is to have
>> these features be described in adc.yaml and have this series merged
>> before the three others [1] [2] [3].
>>=20
>> This series is sent as RFC because I still don't have much experience
>> with dt-bindings and I don't know if this approach or the properties are
>> general enough to be described like this.
>
> It will probably be easier if I just include these patches when I do
> v2 of my series (if you don't mind me tweaking them a bit).

Sure, that's fine by me. I'll add a dependency to your series with b4.

Want me to send one more version addressing your comments before you
take it in?

--=20
Thanks,
 ~ Kurt
