Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.82.173
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1792691585;
	b=MPzxXNxZSnZrM1NEZDZuY3FWSWCXJIX5wHG4+CLO3qCR0SWJn8E6t8U3zkClernnUBq0
	 06bSR8Wk5uXbrKPTTHh4HEgDQ1ZOWpopaQb9zp5jg1QWBlN5XPAUX0MCBRra2C3sPN8UN
	 sDlGyZONzJcAAjoH6vL8EAh/ItKopJRokmUzjLrAzY55jwJBGCQjXzwr+xbrPssLTAiTC
	 ODn40YlHZGvaEeLZ5WrL1ux0yX8UiAEUvWH0ETUFl3nG9KVoaTQ0QdfilIpKcB50SQWaL
	 Gib6Gm+rmylMrTYlZPIYcJPhTG+Z6JRoD3Xv9cPpMCXO7YnL1gim7Abgt21SEK2DWCA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792691585;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=3caCbj25DMKEJr+iPP66wR6DUJgaEfAKCjBL8Q8RuKs=;
	b=yYIq/WmWpuRGToLy2HyQ5SEUn0PjFRFVIsjjyA2bKapM02vaCsStV+Nje17VRTVrNs9T
	 R47aEyuaiQqlwZW1S4fz1x35h1quSRokviFNenO40dqu79cX94C7w5XkpKnYMAiEvBYx1
	 5XhCxjqD1WUwmMeLGVD10vPIqAWxMb2AfScgPREWJJaADRAlCIRM6b/8xueebf6c3oj8x
	 BnV0bCEf2d+z6jbXtTAAjvTD2tB57TcPsp2YA95yVhQ1JmoE25/VNCAdiUi1eUzDaFjBQ
	 GBzauttOGZLp9KI4/+Pn4Nqkye8wdhcDbB11kQkAMbn2o/vEW+erLapyGAQv1bsIwhw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=CdWRFVVR;
	arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.82.173
Received: from mail-dy1-f173.google.com (mail-dy1-f173.google.com [74.125.82.173])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7532C606A320
	for <devicetree@vger.kernel.org>; Thu, 22 Oct 2026 17:53:05 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7532C606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=CdWRFVVR
Received: by mail-dy1-f173.google.com with SMTP id 5a478bee46e88-35829219da8so1345455eec.0
        for <devicetree@vger.kernel.org>; Thu, 22 Oct 2026 10:53:05 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1792691584; cv=none;
        d=google.com; s=arc-20260327;
        b=l1ZGW5IJ0W/Spki3y5EJS7D2pT5P820zTexph0LP8MmGhGut2yri9aa0Hovg+l03Zr
         5AyZ+EWGUdRe0blcVorfqHt8PeESvIvVpsBAComXG/TBvhXbb/VosauLEEFx6JcvnP0+
         SbE14kr1XVRNC1A5blQ02hKPmdStr4KdMTNlTRtL9wU3ECNfFaI5dihchCrWddfUjCH0
         vwf+96Zty0l5QrxLEWIes9hNyEjXHiwZEUQd4zMetOKxz4TS4g5xh9K/U7Qx8pTXRax0
         R3c0ZeB3hjDlPt1RyvMKMQzD32yIsfQHBXXvA8VXU++7Klxett4G9fWYBeTN1ktnQuLT
         TeBg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=3caCbj25DMKEJr+iPP66wR6DUJgaEfAKCjBL8Q8RuKs=;
        fh=/3RNgEF8pghWfF6Xho5rwTcduu4tNbTj4Gfhw3PjKY8=;
        b=XUFCh56x25Ry7tbsjUw3WAyJNEydvzOT7FB12kgDFlZofrErbfQifFDjLXXidf0Q+k
         j9ak6XoRkrTGiQ97vSWnEVaUZb2WXLzOrNMwxASavT0Gi753qdRUZolohJb0fegUkeqR
         K6qQfH8ZDRwEsMgyHcP8C7wiQGYCUD8u+UK1HupWr70YEBkCdh3Wnjtb0qDWh4UW9zdk
         0m9ahI6HGhvyaTaHcowycDwUiC+OP3uDCZpDJkXXTy91BkZKWzMJS0KIZGalfKrwd1Qq
         7JmiinKFOQDct9yAQx5sU0MNExdrV+n2wrZezX681BewlYIup7YCxk1UFlK4u74FAfDF
         +Fzg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792691584; x=1793296384; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=3caCbj25DMKEJr+iPP66wR6DUJgaEfAKCjBL8Q8RuKs=;
        b=CdWRFVVRQFA7nUIEbW9/tuJ4GmATopKWcFmos2aLIz3VeptOn8kVZBD1BAB0fOT5ti
         iH2TdABNtqgWFySel6gPxtwrMOUDidEbyaIWboNu3OWXv2xFwD2l65i1ZRPbb81GTRNk
         7cwzieID3NXpEioeJiX2lh15lDBWOycH3jFXVZuBdOZB3BWFLdfINCnxJgob/hpFPx+v
         N8AJMVFlDMH6aMCcHJXW2au0INS95a1s8MAiYvFXIAqnwbNiNQpFd+gzIEONWen23FBv
         NEbhhdP68Wz/JBqcjICoTozj1zQKg8BF3eyJym3D99zB3Wwg6gK7lK2ZZpZsCIDkYJYG
         wliQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792691584; x=1793296384;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=3caCbj25DMKEJr+iPP66wR6DUJgaEfAKCjBL8Q8RuKs=;
        b=VsRT4diNcQgmTFXPmjEWQFReuxedALF0ObaRm+ITRnRVLigSNzSl4cSMx/xyhhpYah
         HfecBlzyaNxUuE/TCTtJY52Ua2OZcx4jyfegVANe+LGnkJJ484kKU6KrmI9fLPZF/EOz
         gwf8Mg/SeTzBPxHcrOXvP51IR7U4MpvYtlE0hv8M1eA+Z/+M2sNq6DnGDxlZ6MeGDYwq
         cb872zwoyXAgY0tlPhaWs7xHfNCgh8XFz595n2YkhQO1u+QuLgknxTqNe7pGBVwHAFJO
         48Yk6VGVbl2XhMB/qyqMReoimfaFhevdt1qLlnNEqVQ2KhNvbssxlfNDKkJnI7/k7xwl
         taiA==
X-Forwarded-Encrypted: i=1; AKwUvBw6LU/y387ftTxgOFKPWhs2VzNtySB3eNDjJDyL+i/SpP0NzIq037Qj3on8lSOVfdGWI8OzkGA6SwjI@vger.kernel.org
X-Gm-Message-State: AFq9FYKSPT5BSILq5o1qqu1rPNLocYj85Ap86f+A0NrT/kR6/w5e9g+G
	nagljsfXij1JQwdDHHTDYT19Lo2/n0TMSuog28T0kXlXeeMUVu/Ayt1FJ+GwUhPS5xoh5tdxp7s
	mar8XqIFYKRr5ZD80/wOoetNKZFQez/w=
X-Gm-Gg: AYBFou0yQ6KPUMvlXM6ddyfK2AC9xMBg0OsXqSLXx3jpeUeOM39I4JSaZZdqRIkv3pA
	X3sRNCMVBJb/bLqH4aGjwwhUVwlFpCN0aMirdLSH2SiEzh6xRTCmAKfXxo2JFuPBFRc9c1BQNF7
	o6MsgDgvq7/hRcW36ZVy1eAkfxOT+6J0rJhuS08ajUL5C2llRjjxRipdBMGFh1iii8LR8H9l5s+
	TS5n/XlVidyAXZhpBGWah3zjAU+ADpqMsXjq+i3LGrdcWZiaYJywtDKojGOG8wCCqFN4PK9rVYN
	AXT7fU4OGS+mkdXSGk40KEZJhk+qUEgXHGSVHTTDmtP1GZO6Rn/tFTdFJOgVmTl/zE8YH1Ta0AR
	jSp9jPv8ttgn4xMnEGajjGLZKSgamArDzJwYAYxxP/opEr0av+QWkuPkXWMe3FsbexpvfrDk=
X-Received: by 2002:a05:7023:d08:b0:190:716:4822 with SMTP id
 a92af1059eb24-19599bd3be6mr253220c88.8.1792691584483; Thu, 22 Oct 2026
 10:53:04 -0700 (PDT)
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261015130628.184279-1-clamor95@gmail.com> <d3648f08-17b2-4a90-8c23-3036cf71f1e1@sirena.org.uk>
In-Reply-To: <d3648f08-17b2-4a90-8c23-3036cf71f1e1@sirena.org.uk>
From: Svyatoslav Ryhel <clamor95@gmail.com>
Date: Thu, 22 Oct 2026 20:52:52 +0300
X-Gm-Features: AclHuK804zMlj-QH-mnS-Z0lN9YQ0e8iLQ84s-klji9qX-wEVgx75tAGWTn5j64
Message-ID: <CAPVz0n3goYTds2oVExJUwNcOr4kHAHUntCt0yHMueOnJ3GxCGQ@mail.gmail.com>
Subject: Re: [PATCH v1 0/1] ASoC: dt-bindings: nvidia,tegra-audio: Consolidate
 all codec support into a single schema
To: Mark Brown <broonie@kernel.org>
Cc: Liam Girdwood <lgirdwood@gmail.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Thierry Reding <thierry.reding@kernel.org>, Jonathan Hunter <jonathanh@nvidia.com>, 
	linux-sound@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

=D1=87=D1=82, 15 =D0=B6=D0=BE=D0=B2=D1=82. 2026=E2=80=AF=D1=80. =D0=BE 16:0=
9 Mark Brown <broonie@kernel.org> =D0=BF=D0=B8=D1=88=D0=B5:
>
> On Thu, Oct 15, 2026 at 04:06:27PM +0300, Svyatoslav Ryhel wrote:
> > The number of codecs supported by the NVIDIA Tegra audio complex is
> > increasing, which leads to an increasing number of bindings with minima=
l
> > changes. The main differences between codecs are the compatible strings
> > and possible pin configurations. With the introduction of auxiliary
> > devices, a definitive description of possible pin configurations become=
s
> > nearly impossible.
>
> Please don't send cover letters for single patches, if there is anything
> that needs saying put it in the changelog of the patch or after the ---
> if it's administrative stuff.  This reduces mail volume and ensures that
> any important information is recorded in the changelog rather than being
> lost.

Hello Mark!

Just FYI, this commit should be applicable to the current next since
it was made on top of the recently merged Tegra ASoC schema for
wm8994.

Best regards,
Svyatoslav R.
