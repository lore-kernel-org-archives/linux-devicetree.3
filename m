Received: from mail-qk1-f175.google.com (mail-qk1-f175.google.com [209.85.222.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 921542248B3
	for <devicetree@vger.kernel.org>; Thu, 23 Jul 2026 09:35:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.222.175
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784799316; cv=pass; b=MsGdH//DAfLPYvE/f9XbMVG0J0izaxQ5So33nTrfsWBwrtbt/RVvTUNnO7jq3J1WTWSX88Ya7Qmv2FS9tQ2OVh57Rxzia1XAUxu+3fxQSjx2FnbJx24pTPMVX9TMiXh4jZoh1df3ta/2lmR2a1P9qpq5F6V7tyYL5v8dz5Hc1tU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784799316; c=relaxed/simple;
	bh=QV/e0D4Cq+kXxk7foQFF5xP6EyKiu45j2ziUGVbkQko=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=r1XNcM1Tf3LRC7IY+BGUFOGR4oClsSqjIDFvtvypHDv5sXUTeUkid5J2IgjOosoGoaydf0uWuMEDNZ3iq5b/MCV7IW33UG5/HfIwKFkxo7I7LTJKwIM0hbm77aaE/iHpdt9v2a2hFeDq0uqcokNFwEYliFvm269i5A7s/y5ae5A=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=VEFSuChf; arc=pass smtp.client-ip=209.85.222.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="VEFSuChf"
Received: by mail-qk1-f175.google.com with SMTP id af79cd13be357-92f03daaa97so40061285a.2
        for <devicetree@vger.kernel.org>; Thu, 23 Jul 2026 02:35:15 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1784799314; cv=none;
        d=google.com; s=arc-20260327;
        b=lbXYsw/5vQxskTHV6RDA8vx73scM3+iOPy4lfTH34ehhTo0p/1eR7eZmSmJ/uSxh/U
         c0CcD+oL3q+mZ0wONbUbjXStkahPko0/p701xijoWT9xULr1QFfIugjhGKq3fej7XZDE
         FVD/UGKxmyTngTLR1vZPVuo7D9Zld9AM3J3XqNTRTf+rxvfXF3LMmKq/iKbuKauOE/BA
         UVYeUTZ5DGiWyfWVJ4eyDlXQkuUbBijOsUdTF0SZtK+/QVDP9h67NAcBTPTF12mnX8rN
         pDBD4UOG7O3OTesuzUE2uF+EfTreKVt01unLW1OHzdYVoT4YeVYkUVfp34s2XuIVIEVd
         lgKw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=QV/e0D4Cq+kXxk7foQFF5xP6EyKiu45j2ziUGVbkQko=;
        fh=LXBY0r/XTavHnbiHr/nYJFD8dZYP3wFLQGrjO+jO9P8=;
        b=aa3b8VjxTEKbkuhoAJIsSusqB2pTPRpBCU6mWsoji3GRRk61/+RVlhagczXJJwBpjw
         nkzdXj86CTw8Zipq75NTtX7soymjO4gkq9d+fhVIBX8fA/IqLwmU9Fg664QiMnllca4o
         F2V1tVLRe88yRKpz7nziZLnLbUhb1mlV5dm0AqfiShLkLQnwahi9jqIqYH+8wPqlvy5e
         vwW13/LbxazsRmSguxKON2i09jyO0laqrxoDJwWN6L3FGOBd+Iz+Rg7eb+5iaNqSaOdM
         nzqGdwY1MvDXoRgsH4ZQTUY/IJqbvXza+JyBRle2UNgUnDzJNaJ+Gjiqs6VZ7VDpQXcN
         sDQg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784799314; x=1785404114; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=QV/e0D4Cq+kXxk7foQFF5xP6EyKiu45j2ziUGVbkQko=;
        b=VEFSuChfT0fDeT/k6t8dbTxSoHwrcy3XHYiKbGEsaLLQNZSuqUWK6BukTCis7eqE8w
         Gd4KrrVlhV6uchjPmsISNefBKY2hVsyLl/DrvzBdFpSjEELTCRU1hq9Cl17DaIkjMFxU
         gvpdVYPL7fBGgmo4qc/Xx9dPbbqwxLd1V/dZFmTVOf6lfhDCqJ+c9QhXeinPfOK1MEC8
         ousbSA+AUNoThoeajbfCqkWCOJGmLo09RRrXqprcnn72l547pu8yBvjo4XYvK4ivZqvC
         cf5P9bUQFpvjx402lpONSUt9lu/+vnN3vyxBTplyq44WfvvnGeTqmG4FWmeJQlBnfOL5
         2TIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784799314; x=1785404114;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=QV/e0D4Cq+kXxk7foQFF5xP6EyKiu45j2ziUGVbkQko=;
        b=Pp2a8R8tI1YFnSBHv2Kp6OyssWc2g27sDah83TIUEN4pDGmEsNAdZBHjG6qSXYVxag
         HbHlxoean68v89pfjaW/pXgkFbLQVTPRidbFr8fCTppfYLShZHdRqXBvpj0jhy5D2eVj
         p//tyon4dI0L+EHEaaDZVOzeNgf4dky1EfoZ8Ts6KtYOemDg006yV2/gWPuRCRxnv2vG
         bWTwGlTA5nOta2Zh88nkDV5XzjlXfPVPPdhjgo88qHldGX1IdwNcEZ9NGn+Ex1TGrh9W
         qVXoUuHmmCisf70sMQd7XLnu2KHr0jy4r7iU90lAdadE/KjrxBAvKW01b5agkHPvDL+M
         OMyw==
X-Gm-Message-State: AOJu0Yx5tyycExpElCWKDwm+DOTduBCpUnBSznxNMP7foOMxw3XkmNML
	iKv1YOstKeYZ+8Q/PlmIIGrDJJdyU8ls0vUD/pNIHFc+xksQgNVUCnjt7m3K3BMQB7Ic2Vqh3ap
	OOhVI6LIkZ4ELsQijRYsQSMcSHYk+4s3aCz95g94=
X-Gm-Gg: AR+sD10OebANixoak4XOjVHb6chYciCR048ezduLGJ2po4fMPAFCEzywhn03uhPZEWo
	8NivQBOMXFdDuaEQy7IhVYJCEvGXRrBLctuNLifw/ySQQZEW3YTJVFCPXkWYMJ8fRyoLfDdH9k6
	UFtiO80RwGMlKBdr2hG2MQP3GiYpfdOFgh84V4ARUHhcizJ5KUEsCup6TNwe5haNQXZG39DgG/K
	flj5g5IQ4hF8CAkJZej6ur9csTgXCXGJMH6kFWFjU1RFBEehMPV4GL+qrGVKLv7DpLmb2wFOAkL
	iJA=
X-Received: by 2002:a05:620a:7002:b0:92b:c6cd:7f6c with SMTP id
 af79cd13be357-931038a842cmr237751885a.34.1784799314332; Thu, 23 Jul 2026
 02:35:14 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260629122246.148696-1-akkun11.open@gmail.com>
In-Reply-To: <20260629122246.148696-1-akkun11.open@gmail.com>
From: Akari Tsuyukusa <akkun11.open@gmail.com>
Date: Thu, 23 Jul 2026 18:35:01 +0900
X-Gm-Features: AUfX_myChBNOL8FDaggU_KSOgeBeezCWC3VAKALkyLtMuEBpjgaCigCdcfIYHDY
Message-ID: <CAKr_iV4nwatQ-8NTEkJOaP6fzrmg_-_AZ+1eWBKpRcJq=1SMXA@mail.gmail.com>
Subject: Re: [PATCH] arm: dts: mediatek: mt6589: Fix timer interrupt trigger type
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Dear maintainers,

On Mon, Jun 29, 2026 at 9:23=E2=80=AFPM Akari Tsuyukusa <akkun11.open@gmail=
.com> wrote:
>
> MT6589 uses IRQ_TYPE_LEVEL_LOW for arch timer, but I sent a patch using
> IRQ_TYPE_LEVEL_HIGH.
> The timer worked correctly regardless of whether IRQ_TYPE_LEVEL_LOW or
> IRQ_TYPE_LEVEL_HIGH was used in the Device Tree, therefore, there is no
> actual impact. However, this is not a correct description of the hardware
> so correct it.
>
> Fixes: 2a5d54507c68 ("arm: dts: mediatek: mt6589: Add Arm Generic Timer n=
ode")
> Signed-off-by: Akari Tsuyukusa <akkun11.open@gmail.com>

Could you please apply this patch?

Best Regards,
Akari
