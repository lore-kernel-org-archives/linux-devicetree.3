Received: from mail-dy1-f171.google.com (mail-dy1-f171.google.com [74.125.82.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E4E393AE6F5
	for <devicetree@vger.kernel.org>; Wed, 20 May 2026 08:14:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.171
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779264875; cv=pass; b=sNHSUQ4cgEuY1QVG1Cozgs0pKM4nLRw6nQe54fqUZy9m/+zLatGh60GocOjUi77DG8mUCNa0RGN0YLpZpS4UU5+vj4629Tt+RJEqnP1w6OG9x32YNhZAOXTeIqv8VxrwBH66pOBcw4bDgdoCpAY3CztVWEVZmNHu4AXZUxQCWjk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779264875; c=relaxed/simple;
	bh=Asewp5IkklurDxOrc/bcwlJsHgUIXsfxcPA8XqIWGe8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=LnjIYag8RfpT948umoO5UEwME5DaprMn+7H0yFtQD8ssLFvLcGpze1RCOuw/l7Ol7Y54p2Gr2YnFhdtwfMLTG54BjKX3R3+8PL8lz+R38AhU/ih0r5RsZa1u41qzE8I6S2Wme71USEOhfBayRLPVDuh40RGYubz0FLOHmsIz3lU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=e2ZzXB4t; arc=pass smtp.client-ip=74.125.82.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="e2ZzXB4t"
Received: by mail-dy1-f171.google.com with SMTP id 5a478bee46e88-2ef2a1cc06dso2226013eec.0
        for <devicetree@vger.kernel.org>; Wed, 20 May 2026 01:14:33 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1779264873; cv=none;
        d=google.com; s=arc-20240605;
        b=E/IfNR0NN/gehuVxJlSpx765hK5VJDkHYiMznxK4FRaeuK9wleiEkjy0WAtVdBpZqB
         VotbL7dKlX0yJh4e3buBgp+lW0+e+1QmF/yBFKlqMkqZqYD8ohFMMZ5NwkkmxHK3NJUI
         AMm2s8CFoBugLQOw3pBmRfhAKAKSqjU3qSOzeiy9ZcMzakS3Jyz++Ok5bg3rhD3TEH0I
         8wJpCNiNv68PCmKK+PJAeOZ7sKstE5gKWcxayi3lTOf9pO64KtWs3gyS/SYVlWBp4/K7
         NjkYIEg/VXzw3hasjLWcjSJWiLjAW65gpsuNGRQVw2BRkVFQEHMrnAnb6ZkEegnFGFZz
         gwiQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=9QI3FzjSrkZUMO8AJDBfSBGYeQxfHBb0ce/7GuMxMMU=;
        fh=3QVBStaMGLWgnFRvcJjZeB0s/4ayaFJ6a2CrSz4XQhk=;
        b=RadZbKIrLwBHyOIzodh1MStb3d7SODsTyQcu6qX/GG6ir2AkMHr3VsZ3eQJ/BMhzqj
         kJtujB0Nqap2Doie4/Ykcl5HlJqn3vtsrNwD0roHAEle7UveYeYv4KN6z8JBrR4CeQHj
         AUxqXwXT6521lootxgcf74402eCFjc9jsqpR24MdsQgGp9X1P0o8LcDu5z5DSdycjG5n
         mMiQrO/pqyTb8z7KDobqk2MY/jv+laIBzSZmaHdN5w9/3bV5ddOdtdCfBSP1jNEeGVMV
         e/uhV9HC1aYb3J0CSwkRzYD4b+6AqUIrxMuN+YKCYhubBBLakRdfhQ1GCS9LvLhXMY5d
         nFTw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779264873; x=1779869673; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9QI3FzjSrkZUMO8AJDBfSBGYeQxfHBb0ce/7GuMxMMU=;
        b=e2ZzXB4tMNaH4owqi4MWPpiwReMAVbx+pTi5oQVZNXDqY40Punq1y8da32SodBT7c3
         BGLWdxnSeptPayppaOSP2NlvqHFbZJF+a2wBgh/ZSEg5byFVK2SYhuBZqvPk/F76gfKq
         oJStwGBHDCKkP0kdNsQD9GzezagGbXArgMZ4nU+Qvo2EaKCqLdQLPQ+jyld737fVswzM
         WBtRkzUFN7Me7UbhN8WIuU32gFkP21XCR3P+OCNHegaSAeAUJU2PiD+Y+bjX3SDpnkK+
         gc3Mwrdv48q2zYPdnunysBRqKsTIZA60T5SRafIlc10pOAfygXQUctCZexVJtH0XTKoH
         xqrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779264873; x=1779869673;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=9QI3FzjSrkZUMO8AJDBfSBGYeQxfHBb0ce/7GuMxMMU=;
        b=dWImt2WxCTaV9uuMx9gQI3p3FDZdQbM5TYmziuM9rHX0UZ5dE5q8xUfDXkabAfaMJk
         f3ExpEmc5jhWLPrkApK9C1ivld5+altbdgZFWCyKQArtVqbbtUN64hGO23xFsZrdnXXU
         TY4vrER29A92+MOiczN2SOLkgY6WBZ4XnIyvBrhV4+KgEO45vhLZNcK1bBQs67LFPPQj
         lktNHGoqDbxwOZ16MPyjeTm8BwBMyh4AJMaoi7PytyGYK6bMqIQF25O+DXaufv0mdCOW
         7cXVZpST/AfwN0HojR6fDnKU+rkIDSmIzrHqw/aa5HwkSuQdRnpbNDV2sMuIPQW11yYA
         FLxA==
X-Forwarded-Encrypted: i=1; AFNElJ+tTacOYH9LqL9bJJRRGx3yKnVskj5S+e5cIVFGxoc40zgGnQ2B64Adtx9Nd5vHKfAMnJbT7x3vX2es@vger.kernel.org
X-Gm-Message-State: AOJu0YyqUZlfuK/Jfe0P8IOhYiNeIdhlvMK/oBKZhDaGS7EO7Dko9hoG
	sqGIou1sBwop3VwRVPCjVJyIpDupKSNeK3PfXzg6CjnY/3Np2Z9VjtinpTucNacyHHmPrbO4C8U
	sZ3GyjLcLunWaU7sZuPkKz9wvFmvwK+U=
X-Gm-Gg: Acq92OHcnVicMpNgp+Tdl1Z3FZJaXBnZXHBvQCI28YKa9obqSsqABMpUn6EJBv78XQT
	nhkKSzS4c+YhLlDPo+VDdls/tnn3NIm+g8aPqnVs6c+tDwSdfsB0NED0m33RHs697z5YZs96yjR
	raIfAjU8I7TbLJRqZIyFzie8+0VQ+g9nQkqDNzx+ACPxwic8YPfvT4dPdnUVxSi0li+iEi0NLEn
	e5Bv3idFPxOXFVrIHnC5ehopYN+qbgTWd0xBRyyd/IVxKWCNqKo60TRNBBTDnOm94j/O+hrSWGE
	BPxDLGFUgYIgqAXX0+vtji6x3h7Cs1UqPSDFQhleTahWhjokoRXHBpjw+iR0a2dp3EGZRM8=
X-Received: by 2002:a05:7300:6412:b0:2d8:97d6:6abc with SMTP id
 5a478bee46e88-30398600887mr11111991eec.22.1779264873049; Wed, 20 May 2026
 01:14:33 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260520072843.3593-1-kimjinseob88@gmail.com> <20260520072843.3593-4-kimjinseob88@gmail.com>
 <CALoEA-xOGAGb=-uXBv+Q2QC=viPCGUESGZw=rfoBHdEJFCkEAQ@mail.gmail.com> <CALMSewJinjbnHT_sOgWmHVeThv3su_E6fioyAjEWKzf7uROc2Q@mail.gmail.com>
In-Reply-To: <CALMSewJinjbnHT_sOgWmHVeThv3su_E6fioyAjEWKzf7uROc2Q@mail.gmail.com>
From: j k <kimjinseob88@gmail.com>
Date: Wed, 20 May 2026 17:14:22 +0900
X-Gm-Features: AVHnY4Kq2XtyygSWFQQZ9X2c6E-mcr62Ko-mVv54zIUpSpjvCRfd4kJUZScXQdw
Message-ID: <CALMSewL560vBTut2=_x3KVvdoqMo3Lmg3WF9jr-EdncCFNW71w@mail.gmail.com>
Subject: Re: [PATCH RFC 3/3] MAINTAINERS: add Open Sensor Fusion IIO driver entry
To: Joshua Crofts <joshua.crofts1@gmail.com>
Cc: Jonathan Cameron <jic23@kernel.org>, linux-iio@vger.kernel.org, 
	David Lechner <dlechner@baylibre.com>, =?UTF-8?B?TnVubyBTw6E=?= <nuno.sa@analog.com>, 
	Andy Shevchenko <andy@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Sorry, resending in plain text.

Thanks, that makes sense.

I will fold the binding-related MAINTAINERS entry into the dt-bindings patc=
h

and add the driver path entry in the driver patch in the next revision.

Thanks again

Jinseob


2026=EB=85=84 5=EC=9B=94 20=EC=9D=BC (=EC=88=98) =EC=98=A4=ED=9B=84 5:07, j=
 k <kimjinseob88@gmail.com>=EB=8B=98=EC=9D=B4 =EC=9E=91=EC=84=B1:
>
> Thanks, that makes sense.
>
> I will fold the binding-related MAINTAINERS entry into the dt-bindings pa=
tch
> and add the driver path entry in the driver patch in the next revision.
>
> Thanks again
>
> Jinseob
>
> 2026=EB=85=84 5=EC=9B=94 20=EC=9D=BC (=EC=88=98) =EC=98=A4=ED=9B=84 4:59,=
 Joshua Crofts <joshua.crofts1@gmail.com>=EB=8B=98=EC=9D=B4 =EC=9E=91=EC=84=
=B1:
>>
>> On Wed, 20 May 2026 at 09:35, Jinseob Kim <kimjinseob88@gmail.com> wrote=
:
>> >
>> > Add a maintainer entry for the Open Sensor Fusion IIO driver and bindi=
ng.
>> >
>> > The driver path reflects the current RFC layout. It may need to be adj=
usted
>> > after review if the driver moves under a different IIO directory.
>> >
>> > Signed-off-by: Jinseob Kim <kimjinseob88@gmail.com>
>> > ---
>> >  MAINTAINERS | 7 +++++++
>> >  1 file changed, 7 insertions(+)
>> >
>> > diff --git a/MAINTAINERS b/MAINTAINERS
>> > index c2c6d7927..001ba4ea6 100644
>> > --- a/MAINTAINERS
>> > +++ b/MAINTAINERS
>> > @@ -20011,6 +20011,13 @@ F:     Documentation/devicetree/
>> >  F:     arch/*/boot/dts/
>> >  F:     include/dt-bindings/
>> >
>> > +OPEN SENSOR FUSION IIO DRIVER
>> > +M:     Jinseob Kim <kimjinseob88@gmail.com>
>> > +L:     linux-iio@vger.kernel.org
>> > +S:     Maintained
>> > +F:     Documentation/devicetree/bindings/iio/imu/opensensorfusion,osf=
-uart.yaml
>>
>> All of the above should be added in your dt-bindings patch. If you're
>> adding a new file,
>> it's expected for you to also add a new entry in MAINTAINERS in the same=
 patch,
>> otherwise it creates confusion and an unnecessary additional patch that =
the
>> maintainer could overlook (highly unlikely, but could happen).
>>
>> > +F:     drivers/iio/opensensorfusion/
>>
>> And this line would be added in the actual driver patch.
>>
>> --
>> Kind regards
>>
>> CJD
