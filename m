Received: from mail-pg1-f179.google.com (mail-pg1-f179.google.com [209.85.215.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BD66B51119A
	for <devicetree@vger.kernel.org>; Thu,  3 Sep 2026 20:04:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.215.179
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788465894; cv=pass; b=Fmk1vUHk9fCmPjlw0btjRukoMsKVDZ3R5AIT10Zx4uuPAkHRF6AAsCQevrVSoqp9lNmczYmpkqtJhlZJxntz0xatG1SAlNONBDjNexCHdG+lCOVoLvq7P9xT5r97LzxP4GzExQdVqW4XiWas4g+0gIFHkQHfKXVo5MErH/IdDQ0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788465894; c=relaxed/simple;
	bh=jOv4AdZM/sxSh2PLGWFXcdhUFav4H7IQM0rmmuYkKh8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ozzaOJR/69t7FuDTCnsicYDIhYVMEYMy850El8Yx5so+tyIkpdYPPuixDbR6c5DjcT7y0lHg/NTYg9OrzTVdb8/onCglsDWVnQllMLpEmKQJcMgh19q9NJi6hXnhjFbMmQZmRItvsXci1JTZWBu63nkAvkr35V/wYXQg+CXCOYo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=eH1Vz1HF; arc=pass smtp.client-ip=209.85.215.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="eH1Vz1HF"
Received: by mail-pg1-f179.google.com with SMTP id 41be03b00d2f7-ca80d708489so185614a12.1
        for <devicetree@vger.kernel.org>; Thu, 03 Sep 2026 13:04:48 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1788465887; cv=none;
        d=google.com; s=arc-20260327;
        b=BS4VeaiE9F+2voN+dt7SJdf5mFxyCT173ux8p0JwPsxX4Dbr+D7TcqIMLSSnnkDgkp
         fUdEBwV7P6Jeh7VNCl3z3+lYSYt42SNW11l/ibcim1bJ1FKsi0MugE2x+RhUY+Px6lOR
         r+qaOLwPTYTnVi3lVTF81GYoE8rTaSWK2PIZzDmR5PnHMgwVAQaiUrATkAO+daIMm4Q2
         DTYgVARlQPe1Tf7YnGtwinzcPFcfwYL0G4MQNGfD61DpI62nP2zH+CACe2RN/GydvX24
         kxECXpWTmYPWAPV9cLGIAyw1Hot7XeTe+UjUN8J0ZbXRs0QYbs2Fk0r5KJAZs+p2tlU6
         pLcw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=jOv4AdZM/sxSh2PLGWFXcdhUFav4H7IQM0rmmuYkKh8=;
        fh=NlBevhY8B8GhSdKNtk7/3JQ+GU77MRs/svldORseWUA=;
        b=fkPij2oYt/MWilGEJmotdiVAl5Ivm7iPqA2zyK7sunWYwEAqBuzTg0ALp56l3ED+Di
         UK2eCxbv8tJRax2Q+HgPHfqDgOiiqIt7+lW9byLYe4ZmmjMz0V3Sn4DPN2/vgVEKO/KS
         8hfxqhOPW+1BsDJSinvICRkzwU7lXYldCHw7bnEvtmC9sK9pgSz9L9aFg7HbVlhMOi6L
         iBsh4nDiXEeSUn3cU00y1/2jk97woN1sVUEZajBryJ3m45F7n/J+cpv+PchMoVXtBSfJ
         OkyNg+hJmwKIZBfZxKgeZgSmygn2m71OR2qE/Qe0MhXyg/YAYZRQhh/ca+yKOgMofjoy
         d1Cg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788465887; x=1789070687; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=jOv4AdZM/sxSh2PLGWFXcdhUFav4H7IQM0rmmuYkKh8=;
        b=eH1Vz1HF1tFDsSRF+gHl4jsxzipFdAYQOcLQnYu0ZSW5epYSwc5//alxCISaGMZ82v
         wO5QTHLxtY3viUDvRJZ4UnYr9cmZ2izAy7kVvNfixs6ndRi6IMmVzzrRY9+5e/xRvhgQ
         C5e9HQkCTxj14XJAiCDLiWoIxzS/rv83EJn8cNzIreAOin6sLL/JeQNkWPIqJ6SCT2qp
         gYdZJGWZlST3zcjNmovIgFo+tpc8v0S84JYBS9LLjYW2jq8lDB1lq542MChjtYukGF7O
         r0p1JX5ff4/eMrJiWgcFhizDQLOCXum8Qxu7+Vf/ngfUmdldb7MYFFM7o/qvJA4VzmXg
         gP4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788465887; x=1789070687;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=jOv4AdZM/sxSh2PLGWFXcdhUFav4H7IQM0rmmuYkKh8=;
        b=Yqv+haxZ8xlF6aEt1D1FyGf1ekWKGT+mx1Ce+rTJopn28seNjDYQUIMtsQkaCd4MKG
         fA4bT5waKl4sqlyW+5u+0Fs5wZHCM45pWK3nNCVNaDVLGda5l6hTtiDot07chdRBXbmz
         khy0dZUj4kOT/pTiMwcKlUKm6v30eId/y4HnbgDI7JXx21N++ct0fJMV2885mgqtKcuL
         XjT3A3uuQ1TJuBhnpeCjytI4C31ScvViSddFjP8fuKnAuR/FlwGEFE9Z7xPL7dncChft
         ofcPuzHXJn8Zh3eFVCNAA5Ageb9kOmr+U9Czzdum8Iqe5CxRXOAgEyk+V+Ivxw56QXEk
         E84w==
X-Forwarded-Encrypted: i=1; AKwUvBw/EYNN3eP1WEiTXob3Vfiv0Gtg160k2v/AZnhuX0IPH4qewxGmqlXj6uC5f3AHG1v1LI4qTm7iO/Oz@vger.kernel.org
X-Gm-Message-State: AFuF++m/qg+6Zn8H8a6YSYjgma3KjJQG5rz2PLzCO+hRCFBZTqntmDB5
	i9RZsDuR/xGgriIKsH5LwHku6HmP0UWuBrdDQLW6jgIc7FIlKLMiH0FY5Y4rk9DGEbRkF8y2HsK
	6O59F0FkjH11cV+gGBdT66lxh1vzRlgw=
X-Gm-Gg: AYBFou0XTCy3LAvO/7oJE4AO0M4aw6b0bYEbbZSeDo4Bm6CE/x1D5npW4vLsOk4LtCm
	xF3diE9tSFEqK2QTBZqx3CzYjIIHvh+yMAtSWl+oivhvmKIKcfr6N6hsfvycWO/gfCNHjCWY+Wc
	7jnjVCiMEM6wFTNhh/uMBy1yzNQCIy7t9rOviLVgzhXdxqlcWzqRxE64eEkxkQ+NNDy0LTx+t3k
	O4AzP9EWteR5P/oQCdtaH3sKYyAdMu7AWBbwDN+kunVBZ1BNo2FJuyNXM4bp3YDVHR4Rr8W42NX
	MqIV2sW/I1/sc1gN7/iTZnIZrEnwSXRvniIJxvyrQnDs
X-Received: by 2002:a17:90b:4490:b0:38e:42f5:d096 with SMTP id
 98e67ed59e1d1-39b279ad968mr247148a91.0.1788465887300; Thu, 03 Sep 2026
 13:04:47 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260804192840.29121-1-jakubszczudlo40@gmail.com>
 <anocR1F6uCdh4e1V@ashevche-desk.local> <CA+gq5JgkegYTNKD1dPcWRp9sYXoMDfa9O4=B2azROy3QuTszpw@mail.gmail.com>
In-Reply-To: <CA+gq5JgkegYTNKD1dPcWRp9sYXoMDfa9O4=B2azROy3QuTszpw@mail.gmail.com>
From: =?UTF-8?Q?Jakub_Szczud=C5=82o?= <jakubszczudlo40@gmail.com>
Date: Thu, 3 Sep 2026 22:04:38 +0200
X-Gm-Features: AcwNN1Vm8_ZpCnd10IaLPFM9kTjtcoDvTkAZD_zAraYSV69m1vixkZprKotZWi0
Message-ID: <CA+gq5Jj=bMQBFr+DBZcA5TUPYC5omEh1T-A8MP3VpOJ7XRmf-A@mail.gmail.com>
Subject: Re: [PATCH v9 0/3] iio: adc: ti-ads1100: Add support for TI ADS1110
 to ti-ads1100 driver
To: Andy Shevchenko <andriy.shevchenko@intel.com>
Cc: linux-iio@vger.kernel.org, jic23@kernel.org, dlechner@baylibre.com, 
	nuno.sa@analog.com, andy@kernel.org, marcelo.schmitt@analog.com, 
	robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, 
	mike.looijmans@topic.nl, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, jorge.marques@analog.com, 
	antoniu.miclaus@analog.com, mazziesaccount@gmail.com, 
	jishnu.prakash@oss.qualcomm.com, duje@dujemihanovic.xyz, wens@kernel.org, 
	sakari.ailus@linux.intel.com, linusw@kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

> > LGTM now,
> > Reviewed-by: Andy Shevchenko <andriy.shevchenko@intel.com>
> >
> > A few minor comments that Jonathan hopefully may tweak whilst applying.

Hi Jonathan,
can you check this patch version? Should I resend it with fixes?

Best regards,
Jakub Szczud=C5=82o
