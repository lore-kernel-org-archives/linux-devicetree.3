Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.82.179
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795461017;
	b=CFNPWmC0DpciChKEn753tF3En8Nn8/SgahNGqg4XGHI4ceitkN53KZw8ZV+uAjfquvq6
	 ni4oU+1cEQDRXdFhNEbcLC/Du7ph/hrN/BJrHmVC17RcPb/7XIUarezKqX3zB3nfuNe6d
	 g5/j1qBufWEliz0B9XDEysC+7nl2GTOYXY6mM7v8Rlck0EoaPJ1Vpy2w5ef4edZhdtA53
	 cwdbUKBByJvZ0tHL4LkoR/k4gchOsK4KlRDSBwilOIr0K+FGhiNgaa/Udu+fb4cH/o3AR
	 q8tNinKh1qcrFQjyYDtt6e4NLuezesjYK0gI79lp1DeNZhDs91tPJRsI8od/+kCcSpQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795461017;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=SN2t5kKUSYT0EN3bMFCno8MHopz+s/PrHUa4yUTEFts=;
	b=v4nRegvoTcreprALb9rySHf8cfjdLeVbkagYlfjy93Ymn9TVBGakWLAjQU9JJ9uKvx6O
	 gIjPM8+QBVb0QottJe67jLx8ap7gOUyvOG/IfgqIOEp787rSeP4xUgobkZwmOAkFAWpon
	 BPiMmkdzS0HgRLUpBXD4sl0vuDDhuPsaxXX+Bbe6cH042pZJdy08wChblKZ2gaYZ9LbrO
	 mMlut0CA6kmYYHYtgdnIu7VOltIllJKeWJt9zwd/VzvTLgqEgHJs2AdSWRWM7dBUAWwOY
	 hY1lLuxfCCwPe6yrQv+d+p+HhVOMCy+4hA/vPKQkO5jdj75xbKV5yls3bygNnDj/9IA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="YByzpS/O";
	arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.82.179
Received: from mail-dy1-f179.google.com (mail-dy1-f179.google.com [74.125.82.179])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 75C1D606A684
	for <devicetree@vger.kernel.org>; Mon, 23 Nov 2026 19:10:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 75C1D606A684
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=YByzpS/O
Received: by mail-dy1-f179.google.com with SMTP id 5a478bee46e88-38699cf08dfso3674821eec.1
        for <devicetree@vger.kernel.org>; Mon, 23 Nov 2026 11:10:17 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795461017; cv=none;
        d=google.com; s=arc-20260327;
        b=Xcl7d0znAvRj5JWJ04cfKooCvlypYy0Byrj87DHrXHbFvWxtyEDEbuW3uEM+ZxZdXy
         GXnoMhh/Wu6V1BT6s2W6gmZUoTEORVGvQESIdyyWErgaRPPYxBJzPGq9EnEzYrbino3G
         1cEcBRgvsWxj+q5qDKGY++skZPvuPGZoU1HzxdXeZH0phL1VpvC/r8WPBiWmZ4+cwmno
         lGgk3ggcIAYYt4hguUypyvZ6e/wPkaL+TjzYSq5v7LeQydsbbPInfQgyGJuKlhGc5FMe
         6KA8yeJ2LVLZ8s/UYRqQ0aiwPvfP4BX5DTZ44FeccSj9kLUF84G/cO79lFflQdWe3YxZ
         UvvQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=SN2t5kKUSYT0EN3bMFCno8MHopz+s/PrHUa4yUTEFts=;
        fh=M8UWODni7t67inY3U5r7mOVNoam5g1Oowpth8DfSOLg=;
        b=d+CmwNYesXczCVckwXyF2WdDv0vclIVFFnN0Sp8xeXUp5VjTKudHjeV4Dt2p4VZhpP
         ltxQauc0Q/M+pw624Z93TE89GcsRurfNng7ZGfF0cLEYo/D83v7/mB2p6ctm/H8DAtbv
         NbdiBx+2hbaOARuav19p/3sw9CULBKa2uwjA91v+QmEHRDmGhOjmtpRoByUDuh8EFchP
         +rHQ/kI1pN0DEsbIy6ebPeLGrSkxV2oOgpS4fxmxA7rjJnHQLbNWRFz11FnbJXEuaE5P
         m9nQ9KjuVxi4OLVzrYdsWQmbfPN6mda8of8yZAC3i4s1lercKBDPkLX3evt8ds0XdKRM
         7l1w==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795461016; x=1796065816; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=SN2t5kKUSYT0EN3bMFCno8MHopz+s/PrHUa4yUTEFts=;
        b=YByzpS/OYf79mWwg8ZXz5g2gqNsa9mjTwv1Lgx2QaXdA8HmmpnkqNCmWYyZaCE5AaC
         N3Hb7phIk8xVuDn2j/lz2KKbN7zl60AGlg+WWvB1iCZioHgqNNmkwpkqNzY9FqWsqGxY
         7mBP+xOqWG0whyqBo9V7vOtiYqL5nJMACdcIyAery82/JonullVJESxQRfrUC3+UcGUN
         2jkXNHmDhr5TbTkBq3bfcqrgMwzYTN9Um2UhbD/k6SFe4aIi2YMy8/xHbR3hqQ0ULGo7
         mEAxAIQwGP8MikFwoKNIjGt8ISPeARNxrdTy6F9+HZoqpQ2prTD38KLbxyZhr1OAk+IO
         UaFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795461016; x=1796065816;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=SN2t5kKUSYT0EN3bMFCno8MHopz+s/PrHUa4yUTEFts=;
        b=cwlHZL3tRlzuqnw5ai5q2Bve2LYeYsp2AGw/gnENiTxByuaRBKxQJGFY+BFLpwCAln
         bsPIw6ByzF99ChpoNl1xDL+177uNiPuWxmnmvZzRSIoL4Y7CuGm6TlGHA7bYxDAGWaDN
         BvoUb8gNI9wIy2E1JYttPshLwLTO8cOGLasQ4p/IKSjTwuO1RbBLvyVHHL7BC8YeYPuc
         N2gN7to42wQORujQnebgf8c/Ua+bTJ2+rem0mP9flKc8SJYuVmZkK9HkJ+zG+r0rTtbo
         NhZoi3R+Cwt/a00t8xZtfgKrZBxLTtOYp3+3pXmSCsifNInSyTDIT283ZqX99728hPPt
         sVTQ==
X-Forwarded-Encrypted: i=1; AL+hErH75ifl9pcFKU8//JChM6AW+sA25WRw5Hi85Y0oQm70i1YXDwl/plgz4su9593hLKRKuYQxj2xo/fto@vger.kernel.org
X-Gm-Message-State: APuU4Z+D96VlT04GC8gYSzBzvoPrzs9/3w2qm+BUMtbqwYAX1uxT/+78
	m6p8KJ8yS2ce/ys/zMJ6qs3w5WQPOinkx5go7hBqnsiOgssMf4SnlwZWjqRgGxzNni4VVehlRCM
	45pFtD1k0JBJLlvk9Kp0BfsWqS5ipXwM=
X-Gm-Gg: AZFdTZcweXRhBDQ+lO9y6Xbh8FzrZykYq+7zYFL1vJ1s1aIWlhAOC+TsnQ9hLbn9VQ8
	PiQlYxf2eL1I6uucgPk9Lo4zIKQcHY8MWJKQo2t+/dTkBfZUHASXo7LMJxdOaTxKch1cOSJ0VR9
	vh9Y9cYZTizEXi8EWH/MEzoP59mG5lO6yvTS7Qy27qD9+mzVwCxND0xcUNIf6wc55kIQ7++Gq3z
	4Bklrp0MXHbMB8rU+kCpVTXKqAA1J7f992I4Biot5fJtvqvRwx7mpHgjvQFH8ymv5cYnC5Qx3AK
	pcjeUY9/0cyK2JMG7+gTCdjr5OL9c2AncONQNnLyCJS6qj94P8XfClxQtI+Uzm1ToLRlxBiORZo
	iUDs/4doIfXl6pAjjE7AUeXy3tYxWQ5n6nwII11LxMRX1/x5gO78A3CGeG1XX99y1SfyUeIkQMw
	dXCD/slfnx3+IpBs9WfO7t15abWe7TyA==
X-Received: by 2002:a05:693c:87d1:20b0:386:a816:ca16 with SMTP id
 5a478bee46e88-386a816ce29mr5178321eec.15.1795461016480; Mon, 23 Nov 2026
 11:10:16 -0800 (PST)
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261123150725.212836-1-clamor95@gmail.com> <20261123150725.212836-3-clamor95@gmail.com>
 <awSLzG6IxXjKLBCx@ashevche-desk.local>
In-Reply-To: <awSLzG6IxXjKLBCx@ashevche-desk.local>
From: Svyatoslav Ryhel <clamor95@gmail.com>
Date: Mon, 23 Nov 2026 21:10:05 +0200
X-Gm-Features: Aa3M54qd0Q0FdKFQ-JpohuyS51xXnBrzclr62AhndFD0zExmhfAz7QgWmQX6nVQ
Message-ID: <CAPVz0n3Mm+GdsS_P7Yc98FVKOijXFzWocVCkzUhg+LPJ8dY+4g@mail.gmail.com>
Subject: Re: [PATCH v3 2/4] mfd: max8907: Add ADC client support
To: Andy Shevchenko <andriy.shevchenko@intel.com>
Cc: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Jonathan Cameron <jic23@kernel.org>, David Lechner <dlechner@baylibre.com>, 
	=?UTF-8?B?TnVubyBTw6E=?= <nuno.sa@analog.com>, 
	Andy Shevchenko <andy@kernel.org>, Lee Jones <lee@kernel.org>, linux-kernel@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-iio@vger.kernel.org, mfd@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

=D0=BF=D0=BD, 23 =D0=BB=D0=B8=D1=81=D1=82. 2026=E2=80=AF=D1=80. =D0=BE 20:5=
4 Andy Shevchenko <andriy.shevchenko@intel.com> =D0=BF=D0=B8=D1=88=D0=B5:
>
> On Mon, Nov 23, 2026 at 05:07:23PM +0200, Svyatoslav Ryhel wrote:
> > The Maxim MAX8907 has an 8-channel ADC at a fixed location. Add client
> > support for it along with its regmap and interrupts.
>
> ...
>
> > +static const struct regmap_irq max8907_adc_irqs[] =3D {
> > +     { .reg_offset =3D 0, .mask =3D BIT(0), },
> > +     { .reg_offset =3D 0, .mask =3D BIT(1), },
>
> When {} on the same line, the inner trailing comma is not needed (if we e=
ver
> need to extend this we would need to change a line anyway, so there is no
> benefit of having a trailing comma).
>
> If it's just this, no need to resend. Just a hint for the future.
>

Thank you, I must have overlooked.

> > +};
>
> --
> With Best Regards,
> Andy Shevchenko
>
>
