Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.228.139
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794327111;
	b=tgeleeMXa+RPGrw020aUJKeiEKEThzHH8GzBG716bH+rb/cfuJKKDsSAYPQ7xAf6FFVt
	 yhADQ22pCU0q1BpFht3VMLg1P3+NStDj5zdQw7t0wEa61QM1PRPgst8NZnzaGDRNNp1VQ
	 E0vE7+NpqOgbHs/E0lnzurjH4gHB2ulaOEykDlzCUnoYLGPO0QYwoeNIqH94MgmYs6P2V
	 w1Hi2J2jjXqZ0utQH8xgpOc5HozY+7Mi28xtO7h6idZ9QFdk9c6MDfQ7A9HaL9PeQlieJ
	 qZdJfEsEVLvW5+V/WwjQb5zNvnypdeceyUMx7GIoyZQTxVoJ9mTkgMK9W5UUdiY0NEA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794327111;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=Bvu8fH1m1BZ2sQQoPyfnhre5VWvJqEOu2Sa0mYvTTis=;
	b=Ws2q4JeWV7CBMI4p6mDiD+2Ijf0KovyUC66eQ6iixEy5iFhFT1bIjiiohGO9i0KvVQQm
	 G5K2Xavj8bQnRL6Eo9JtwsGuZNMEgp7c+iQLZ2IKjeyeygXMmGs1X3Q57fRkRmbKHoHcL
	 CrykkeMZAsayNhxJOiXqJe5jNtaIXh2/saNYCevLBh5jmzknLyAQn71yTL9gumI2cuvvW
	 fvH7YBCpdfFbHH6xPDeAj4HNzf/aMDz+JM34z2uENXjGEfRY3adEwumqjINrFq34GTGOe
	 QpvdezrBdlNRyEcTBpmw5C6UbwpveiEy9co7GSZP+wAvRLVIHaJji7qLK5rzADm8q3g==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="XnbLYiH/";
	arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.228.139
Received: from mail-ej2-f11.google.com (mail-ej2-f11.google.com [74.125.228.139])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1E380606A31C
	for <devicetree@vger.kernel.org>; Tue, 10 Nov 2026 16:11:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1E380606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=XnbLYiH/
Received: by mail-ej2-f11.google.com with SMTP id a640c23a62f3a-c504b4f2b6dso42020166b.0
        for <devicetree@vger.kernel.org>; Tue, 10 Nov 2026 08:11:50 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794327109; cv=none;
        d=google.com; s=arc-20260327;
        b=M36Rq0x1Js31RHePd8jbg5STwYHQoeVrLmtxTXgq0nxX/Y7xqB4rgNfhGSLA8oNdn3
         +8FdZMztToErxttkdVqO/t4QqpmxZkPbbfJkHCJHBBu0lXUgEmIBFGBusHYouEQewEhg
         RbQgccrzrITrglNL6lGwStEf7h3v0Cuw6AWzZe2sImMmebeyzyaDMmrd9U3M8PIMSeZw
         5PcDtXt9Beh5xQ2mVDVebGqRHEc4PEVJKv1QpQN4ykZc5HZWIa+6erCjTnhV2mJXg//t
         xiqYMVLnFVJiR6LNoHOqZrKqjEaA4mfcqQEfS04qUUzMHZfzUOr0vovJXzPNdjbHH0Nn
         u6gg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=Bvu8fH1m1BZ2sQQoPyfnhre5VWvJqEOu2Sa0mYvTTis=;
        fh=70//e0LKV/d+3jtTqs/d9QyLMlIPmONmu7vAdysfxT8=;
        b=MmNrXYqap9tl/mtDS0c7n9ySPDu2BO3XqByQKlxpMZUTczVrBhYHpYXy105hhf651U
         WqvYuJ8/ysNis+0dejWFVzBF1ZM1RrbK3yMOmhHbi1606KgqambzRwX6s6nCCf4HAX4b
         4sD/YHWxftPpQFUXNHZI8CFhOAB/BNOLaLrH3PY0XgDYNWKDZAUoov1aDIna6znp7BUq
         XpVa0uiuTiO1DIaDsiBtq4VB29J49pYCE87uLYqGmjTBrNqhZaGqpKPkiMic6eFYu9k4
         bcQwkjoz2TfZcxhl6ERIODtZGPYhkpXiHEFw+0fdDjl9FCnt6gtsZOgg1XkuTGktfCpH
         XG1Q==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794327109; x=1794931909; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Bvu8fH1m1BZ2sQQoPyfnhre5VWvJqEOu2Sa0mYvTTis=;
        b=XnbLYiH/BEhso9UcOwBEMSmuHcO7oYlTWKU8OtykCgMDUGTV71MZHPgFznVu/FF3Lx
         eYn7nIzUbe4btbN1pwn1AVC+TgOLlu06/5ulCjD28TxM6gipf5iwX5IWjGs1zC1l0nhV
         XPjfqa6SWsCKcU0rRUy7M511R90KLD84/UqZOxQ0omw9soKuSfqHsCaYRnvaQTNgi+la
         Rjl2qqHS8ayFnhKOC7Dk7lua7qh8sUWgDTmCEucqdAwnxGo0KtSXTIxpqN6R3sLydW9b
         y25+v6SXahDFEcz4bq3qVBgjEOmu/gDHLG4JxOiiCjOAGCXtPmr0jTj+X+rQNEB4CTMf
         SwUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794327109; x=1794931909;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Bvu8fH1m1BZ2sQQoPyfnhre5VWvJqEOu2Sa0mYvTTis=;
        b=FcC002HmId1MgoJx57l5TU0ddOlS6sklxtkiwvLMV2uQX20u22JbjJJJn6m2vUCWCc
         7oyEawvcdknWQoDnGGbzsvWXg4KIyG6TYEEkFs3zgJThD4Tnklw1mRBg29SWNpIlkm0d
         XR7BU4/UZjvGYKs9y6G+wTwjcUsNmmLG7PkJqgzF51JlT0a40H6T2E8I3PWgAZ2w1kci
         lMrwszFVE/pUUAoIdTl/CVJ/qdN1gesrDDahLmUGAFd1eX0YGG03y2jizqEhOBVStJk+
         sw9mMba7HA6K07zJlIKs+0FekPRbKaOo2emzsdm0mdIp+YnWhAqxF3mInbbP+MbaIs71
         DmPw==
X-Forwarded-Encrypted: i=1; AL+hErG/L48k7tb9Xb5htUNkjck7fvlTRMtUpUuphrFNDwo2+6wMvTOLp36mBcxV/d7+MAKs4hR7t0b7GbvL@vger.kernel.org
X-Gm-Message-State: APuU4Z/d6vyAHnvnukS31qNWOd/mRl62AEFa43RkVYN7qD44y+zYldci
	xJrIxhltqBvLfM5JrcaKp3LVo3xXSK0tSfFOhmzGtCWgKtgkI4nloZlGdmXew6RkH3VFwcTG1AF
	xs7+z2YdxaUWbDcmy+Dqb/GnENAixb3OiG1oTacBB4w==
X-Gm-Gg: AYBFou1ZhlvnCsw2FfNStX5Hs5B+F9PHX1OruU5WT09IPbPzskJbhegXlwTnsn8Qj3h
	4aKfJuXKTW2EThdJj36nKy3NpDrOGLCVH6Dt4GlV3qr9zPztfe+3txUAd9Cz5VS6AZUUKUUBna/
	GaN2Eg7cyCzWi4VMYCT4oc+tFY50j+tTKtej+rdmYzYnP1/d+4k3OuxMwVSbGY73t1bQ369U2cV
	k7UDNRwq3rw2v/3pTS5ZJXDn7+5pcRiBy7YmlxRHBi/t9OXFs4kE1dfJZ3NfOfAQcU/i0uWPxSs
	Gb5vPdJ1g2sOVkHeLosbYgGCWRkXFxKhdc3cdRgJi5ZzfE+Nhu5oEvtWCMOk+Uz3wUQ/FZTQkDd
	X51x4X1J2/GrGTub5oUt8b+aKT2BmVVNHnGSNb5BN6IcPxx02+Zw=
X-Received: by 2002:a17:906:194a:b0:c41:266:68a7 with SMTP id
 a640c23a62f3a-c504952c255mr192385866b.10.1794327109186; Tue, 10 Nov 2026
 08:11:49 -0800 (PST)
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <CALj3r0ijsuzadYoi0NPkSpT8smRyi607APfxLS8_u3JSH3+dPg@mail.gmail.com>
 <20261106115040.1199269-1-amadeus@jmu.edu.cn>
In-Reply-To: <20261106115040.1199269-1-amadeus@jmu.edu.cn>
From: Coia Prant <coiaprant@gmail.com>
Date: Wed, 11 Nov 2026 00:11:35 +0800
X-Gm-Features: AclHuK-W_aGhTciJcK2jT1mQzUOxx8a9MsoP2BEfAZfP7jfpZyRRqnBuAfsnq9g
Message-ID: <CALj3r0hOjksUtYg+qLqPU9kz4w3SAqGvSmFFi9YBXNGiEPEZSw@mail.gmail.com>
Subject: Re: [PATCH v3 5/6] arm64: dts: rockchip: fix USB OTG power on
 Photonicat in battery mode
To: Chukun Pan <amadeus@jmu.edu.cn>
Cc: bigfoot@classfun.cn, conor+dt@kernel.org, devicetree@vger.kernel.org, 
	heiko@sntech.de, krzk+dt@kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, linux-rockchip@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Chukun Pan <amadeus@jmu.edu.cn> =E4=BA=8E2026=E5=B9=B411=E6=9C=886=E6=97=A5=
=E5=91=A8=E4=BA=94 19:51=E5=86=99=E9=81=93=EF=BC=9A
>
> Hi,
>
> >    (5V_BOOST and 5V_OUT). Adding a `vcc` prefix would break the 1:1
> >    mapping between the DTS and the schematic, making it harder for
> >    anyone tracing the board power.
>
> I didn't mean to change the nodename, but rather aliases.
> BTW nodes should be sorted by nodename (placed at the top).
>
> >  ... However, 5V_OUT
> >  is a distinct net in the schematic. Keeping the node makes the DT
> >  power tree accurately reflect the hardware and clearly documents
> >  that both the USB VBUS and HDMI 5V domains share this OR-ed source.
>
> It is not an independent network. 5V_BOOST and 5V_OUT are on the same
> VOUT, only separated by a diode. The device tree describes the hardware.
> 5V_OUT is not a regulator, it has no enable control, so treating it as
> a standalone regulator is incorrect.
>
> >  ...  For now, chaining
> >    `vcc5v0_usb30_otg0` -> `5v_out` -> `5v_boost` is the most accurate
> >    representation.
>
> Adding a fake regulator is just a waste of startup time.

Hi,

Thanks for the feedback.

I understand your concern regarding 5V_OUT not being a standalone
physical regulator. However, I'd prefer to keep the node for two
reasons:

1. Consistency: The DTS already models other always-on fixed rails
   without any enable control (e.g., vccin_5v, vcc_sysin, vcc_syson).
   Keeping 5v_out is consistent with this established pattern in the
   same file.

2. Accuracy to the schematic: 5V_OUT is a distinct net where the
   external DC input and the boost output are OR-ed together. Keeping
   this node makes the DT power tree a 1:1 mapping to the hardware
   schematic, clearly documenting that both USB VBUS and HDMI 5V share
   this OR-ed source.

Regarding the startup time, a fixed-regulator without GPIO or clock
controls does no hardware I/O during probe, so the overhead is
negligible.

On the node ordering: the node is named `regulator-5v-boost` (starting
with 'r'), so it is correctly sorted after `battery` and `chosen`.

Coia
