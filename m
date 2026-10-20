Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.82.173
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1792499885;
	b=NlYI0lmwtfkKsJLRZhv84Ujwg0u6wH66vz+b1qwTr5IWEtXlo1wkPfVcP8ue4btuyq89
	 47w07XPBurBu34TO8LDhgROpxlsEquYqDSePK1keJvP/vVGUGxupPOKqlYbyRbBFN00GY
	 Y8dAsPL8vaLD2RREyjB/kdc9lAuRArF8VU4yu0QReg7hJbdTqPwaI9oAjC0JpespDJwM7
	 fjQ0WXWHT/lLokXug1usS2xCW1b8YKzFbIhv8kxOEz9Hntys3YpRtKFBuKBfW3NNirJ9G
	 GD3ZCV81qf+1EcPyG85Bk3e7Z7L/s+gCnJTk0LuGgsS+KbARabm3o9rm/6xX/tEvBiQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792499885;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=ZckKNDFk7eaeqWm4nESk5tiNU0gn2sWrHYvs3EKsEOU=;
	b=kPEyiQ1JFfL2Pirb7Z9M+TI7Ol92ZA1fMg2eYr1rwk3mRZtKKa8SAz2rwF1g0/gj4P4q
	 X3iR4aj9TprkxRJTLIOjOJb4m3cyc9ckIfkMQIgSOznR8EBwrAaQg19lJVvEXkCh8t0ip
	 8/aKSDaSXEqJNmLp/qiu6U8iRAEK3usB8KnS962wqd/zw4zwd/MPfA3zYu/FF26EvwYAc
	 kIVEEsr5pgztUdekg8VIepUXA/sg4ySS5sbHEK/Ge9inB8guDr7+4KOC6gNZy/zGVS2WC
	 faiI1hgFkyCz5xR2X8Vw7X1WWzV12ro8KBfKRd4EES69y54cft+x9d+bRNKYNF89Csw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=jmwbXUqD;
	arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.82.173
Received: from mail-dy1-f173.google.com (mail-dy1-f173.google.com [74.125.82.173])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4E57B606A31A
	for <devicetree@vger.kernel.org>; Tue, 20 Oct 2026 12:38:05 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4E57B606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=jmwbXUqD
Received: by mail-dy1-f173.google.com with SMTP id 5a478bee46e88-3282db206d3so5743671eec.0
        for <devicetree@vger.kernel.org>; Tue, 20 Oct 2026 05:38:05 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1792499884; cv=none;
        d=google.com; s=arc-20260327;
        b=rq+5+t+FSda/J2M+/huDt6+g1L9eZ8VZ/Kd6JG9u3ehmxZ4LrqplfivvZ8OmMwjoIh
         PyqkudbdSmumX0ZBXBzOhNlZv2Xi6+NpbLAl98QLMcbytRAlO9xY1nV8f4fnmEkNUNih
         kiZoRlVO9js6+B4VCFCPn+hVckCetPjQIaYO7I7ryOKgKqtIQR7XzNC01f95i8SnxDBy
         aLNvezxLnDEjBDjJhgRi53PyU0f7v182bzT5TMgTV/YSif8NAUpDqi1MY1WHlHMahKLH
         NMmMkduN6n2Ua59r/NY6CP8ztfZpOzvG3czelxjKlWngyNtxHzS/wYpmXSKa6PoocMey
         nJzg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=ZckKNDFk7eaeqWm4nESk5tiNU0gn2sWrHYvs3EKsEOU=;
        fh=f0Gh4+MWBUrjQfBWWeMAMOBmYdVaKEhX70bxhyQ4yOw=;
        b=QV04sn4JMtPcBjFhyVO6+jSHEclYRG0HS2/5NYfvZ7olIGeVwCDi8DtVHc46o7dAyt
         dPcvLqK8eAfE8u2sTFLjGXqkZ2m4wFwhO7AKx6g3uTbZR5a617yrSk5Stg7VJvycss7L
         sCCXn9qBko7wvlyobZLFB4r+fmngSimOJWpWUF+g4HkPUWu16BergBnm6HFPossXJYMu
         vOCEyQk9lHrGiZEA5NEN0/3a7tFpAs1dsAyg/mns7CkqH2eEcC00jY4Gvn0CEeM8qTfk
         zf62mHRt9I6m26A9CN3F1EFPifsITH2jFPBINKVSWVp9dC54W68FzAjffRUVsu8uVvMF
         61rg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792499884; x=1793104684; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=ZckKNDFk7eaeqWm4nESk5tiNU0gn2sWrHYvs3EKsEOU=;
        b=jmwbXUqDvmKk+mts4P8S4Qs0OykPCvL+ZlHj6qhWGIspF7//gQi87Ih8CsHjx/61yv
         wGlS2HpVAHZ3Lu2ZAPezB2Da+qfjRMgwpyxguCAQwdLYXpBwUdJpC53SL8i1C3AluBoz
         PqzIWp7iFtQ3nWEao5a48mvkJxBlgXCvnVIAufBOZw5diHqP7Uv+RTsrse9gVOp2u64n
         nYOWDbEr9XRZ0rVc7jU4+prj4inZNvasO8f+AIGIc9AouBH/JWrRm+lojVGH3yZn6mxl
         TAusewpHXJcE6mPh1y6HGwM6WdkqGXkCVqe0uVPsAZzpnXchYt+hz8SjLjcXT3/ExGSX
         1D3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792499884; x=1793104684;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ZckKNDFk7eaeqWm4nESk5tiNU0gn2sWrHYvs3EKsEOU=;
        b=RAmc2Hz3QxW7SyNdlo8q3gee/GkZojmH/FHt5FpgXDqwrGFd2yLkk4CjrJdVs083HE
         fKDMwsJBVHpp3mnAJHuSw7FbhZPrxIBikMqRPs6SIWvcVeAakV9dAKWotZD1n8smrBRH
         FbYATgdwb40IrHLnFdL1V+7eyZQDk0RjxZtshBQUdQUPyl0PQUGtoTnJspzgl96ugM0B
         rjopLFbE/EDSlgFkyEUQuhSjhNn9txbtsReWn0J1xjfjCKomEcdpKg859jRsCcR0zcUB
         TvYVK6vThCHMac6HGrKlfGtD+PA5ZLhMQROVUja/3F5ELP9d/EfBCb5CLNt9b8B2v3co
         X6Tg==
X-Forwarded-Encrypted: i=1; AKwUvBz6ZOdvavR8pznVy5ifIvWfJyZv88QpDJHvyvnAbcV5CEOOlz1902BD1CPx1dflYH1FA2ERM5Gigejr@vger.kernel.org
X-Gm-Message-State: AFq9FYIIFYt4V1808dRaTCQoqDxb4VBspkJY/rNDmWvMjeDXIuz3j1wA
	aTwx3ucByP0ZaQdQ67U81C56L8KiCBZ7XjfmksF0zvQuqXtzPVr5LSSLTGIXs41E7ydYdEx/jEM
	nj2tLLcfgZkDefF7bQBJsImnoquTly5U=
X-Gm-Gg: AYBFou3JEo42qqf6Z+IX6R67XaWeN5sBeEj0tFeHBOyWE3ERF76vDmLfkS/GR/yVMCE
	AxLggXUBbUKkSb6NvCNddcR5a8GYzkcYCi0W73+s0xOyjWrIp8eiIoTGP0rnLN70E62uyhzY7ub
	zIh3k+oBTyli5+utb6pB/N6XkH/AhD5PdAxTweCqBOzBDi5ulBIGX3wusGMuaO6oIQ2F/cKgK/O
	6uDW60iPIX+N+skvj73Cz+fjT1phqXyl340vUA5kz1x8o1xFTdpUdcl/pz/eSGLyp14oy7s6RAs
	1j4yXcMmgZp7f3P2VeIo9WtR2ty8PbQCEj8KDhLt20G5A6VBs/rZwtDl3rSe+T7bHpE9eiqBJTl
	IBuBlC47NxND2tCUe/hq3cWk=
X-Received: by 2002:a05:7300:d10:b0:35a:84cc:d941 with SMTP id
 5a478bee46e88-361a341c8e6mr20929064eec.37.1792499883433; Tue, 20 Oct 2026
 05:38:03 -0700 (PDT)
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261019100406.103687-1-clamor95@gmail.com> <20261019100406.103687-4-clamor95@gmail.com>
In-Reply-To: <20261019100406.103687-4-clamor95@gmail.com>
From: Svyatoslav Ryhel <clamor95@gmail.com>
Date: Tue, 20 Oct 2026 15:37:50 +0300
X-Gm-Features: AclHuK-m87BDNsd06OZo9qyUn54gIAUFrBH_nvo3N4yUY0ynQqrl04tZBGoSFNc
Message-ID: <CAPVz0n2qqMzhbMt+dTaGv1gmrp1xmxJP8ZdQV1EcSpKkneFALA@mail.gmail.com>
Subject: Re: [PATCH v12 3/7] input: serio: Add driver for ASUS Transformer
 dock keyboard and touchpad
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>, Lee Jones <lee@kernel.org>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Florian Krischer <florian.krischer@fkr.dev>, =?UTF-8?B?TWljaGHFgiBNaXJvc8WCYXc=?= <mirq-linux@rere.qmqm.pl>, 
	Ion Agorria <ion@agorria.com>, Svyatoslav Ryhel <clamor95@gmail.com>, Sebastian Reichel <sre@kernel.org>, 
	Pavel Machek <pavel@kernel.org>, Conor Dooley <conor+dt@kernel.org>, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-input@vger.kernel.org, 
	mfd@lists.linux.dev, linux-leds@vger.kernel.org, linux-pm@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

=D0=BF=D0=BD, 19 =D0=B6=D0=BE=D0=B2=D1=82. 2026=E2=80=AF=D1=80. =D0=BE 13:0=
4 Svyatoslav Ryhel <clamor95@gmail.com> =D0=BF=D0=B8=D1=88=D0=B5:
>
> From: Micha=C5=82 Miros=C5=82aw <mirq-linux@rere.qmqm.pl>
>
> Add input driver for ASUS Transformer dock keyboard and touchpad.
>
> Some keys in ASUS Dock report keycodes that don't make sense according to
> their position, this patch modifies the incoming data that is sent to
> serio to send proper scancodes.
>
> Co-developed-by: Ion Agorria <ion@agorria.com>
> Signed-off-by: Ion Agorria <ion@agorria.com>
> Signed-off-by: Micha=C5=82 Miros=C5=82aw <mirq-linux@rere.qmqm.pl>
> Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
> ---
>  drivers/input/serio/Kconfig                   |  15 +
>  drivers/input/serio/Makefile                  |   1 +
>  drivers/input/serio/asus-transformer-ec-kbc.c | 264 ++++++++++++++++++
>  3 files changed, 280 insertions(+)
>  create mode 100644 drivers/input/serio/asus-transformer-ec-kbc.c
>

Hello Dmitry!

Would you mind to add your ACK/Review to input patches so this
patchset could be finally picked.

Thank you!

Best regards,
Svyatoslav R.
