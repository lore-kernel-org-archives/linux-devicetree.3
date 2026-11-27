Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.82.173
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795791652;
	b=uKrGJPzHdmZGB9ktSIVayO8PFk5CYl9jUxtEKS0gBj1If//3uVUcWmMkcqgEwh37xmYn
	 tu6XFrNJdT7tLh1c+54LJ1JejPkvTwDBMgIzd6janUyJlulWO7/FGjs8ltbJ7gfZ3052d
	 xabqm68OZIDD5cRvpJaGLvXh5L4Fec4KYjR3kahQgWm04mQ3thzyUrlIsu4cmryjsGXpv
	 tI5/GjdDAK84AMYasXiR8jBuDyCs+RvH/09pSvgy5yr5Tw2VPpGkrNlao3SZZ+qS4wLfH
	 WxDuI3HXX2Vcqe9gEkB70YxTS1GBxsb9Ekm5jzzzAfCsSNdjFxxZggoRR/frmKeTekg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795791652;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=+iPChri7biYpij+YOdee2tTIQuLdmD1pLVPBNubI3N4=;
	b=y59xz42Y3pbgRcpnqQJoolihZQevxI2Mkm1w+RsM22YU8lyuAm9FE2zTpl5wsD8kuVtX
	 KH9T+ETfxZRhQH5t8oTE4+asLrRnNZwHi/JBv3I7IXoooMXj3y+Yre55zNHsNH5kM2ctu
	 Y+caJKP0e4ywCTY2H46Bsn/FeR4D9VUc6cKdje+JNicMz3w3UFWw7ktw39zDABl3vTWN6
	 tShhvTLX0WBw0H3FG0gWHM+nh9bPltb4jqsh97eZ2Y024PZFzgfUn5wxdqdo+uUS96vKV
	 dUej4SAwHHA9TFHWK1mBhRpiK+XpKIedu3+JST7ytU2qDEDz7e9UgFZ/l54qODNWurQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=U5tRXD45;
	arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.82.173
Received: from mail-dy1-f173.google.com (mail-dy1-f173.google.com [74.125.82.173])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F2929606A324
	for <devicetree@vger.kernel.org>; Fri, 27 Nov 2026 15:00:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org F2929606A324
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=U5tRXD45
Received: by mail-dy1-f173.google.com with SMTP id 5a478bee46e88-386bd881d39so9341143eec.1
        for <devicetree@vger.kernel.org>; Fri, 27 Nov 2026 07:00:51 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795791651; cv=none;
        d=google.com; s=arc-20260327;
        b=b0ojqqSonGivHk0S/hmp/ih8GgPmzSf9x3azO8PW0TgooH9OEKv0kJG6uFldCGh3Xr
         onC/XoEBNzx8YEflG4uO+4/vlSRKATH59/uJfWJK7bAHNhpSgGLkbNWXyl4U1mup1n8B
         2oxYTCxI33cgBkacZOxtf0roIRRhHZR0g1YdoIffRQeh17GhJ56pLfC7opKoMXVnnFVe
         MlPVNhuEo21l4A6yTVazDesJcVOp+ifkHw8o9vz5+DH51hGYN+uJSR8907xVD+YeWExp
         HCKMz64R8hU3/+YARmuknP2HL8cGzbFlxkGu9vfvsMFjowIUqnKt9EQOY/MLJyjepe5Y
         J6Mw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=+iPChri7biYpij+YOdee2tTIQuLdmD1pLVPBNubI3N4=;
        fh=3OP0F0cZUc9NeZ6etF8GB6jGYmRHBrYGIZFZAzVCEv0=;
        b=rIt4cqbUY7cH0J2t7KSoUDcXa9im0S9uzjuRUgrJP20tGPmVXfshwLm1c1ly61Wn6J
         MJwEznlRMgAuYRuGVLSdDXYKr7/ExpT7R6QlUrp8gBEyY0yRymhP9MOVej/cVhiuoM1T
         JeevpJnSFFdqPKmWXXIDOXjN/TzVaOes1TowV8gRi2vsfJDA5vIbstbFBb7UdTDm8fZv
         s4URXKB/nRD6VOFH1b5toFTvt1bC3t3It039JOfKcA1OQnjzdPjTbJEVbvPWdU6MzXvJ
         95Yvtmb9o0uUt1dc/P4cZHOAPDcvT/LsLUgg0/JUZ+jhrV5jqkHJH0vuDPhcoeLPYWnx
         TqaA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795791651; x=1796396451; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=+iPChri7biYpij+YOdee2tTIQuLdmD1pLVPBNubI3N4=;
        b=U5tRXD45RYe9IaJtJSwOLXc+jl2P7zuSUJEzxnTx7fDaEcBvntAtagjLA0p9TYutBg
         kjNNmfAd7cfIhrx7sOJC6EwTPkRy5JpXd9fQa/nfqUIQFLzWyCZ7NVgiyRFsRS6VidTn
         +cxInGGlA06HQ31MqTnZfVjlS0lPABiVJCcENh0k7C3Ows8cEQ9D9InFMq3XkpEZrKW8
         FgbcpP+9gw9MpsjAyoOTy3ig+7VxaKaig4+mBJnrpJ8uMdFEWvR545M07SViGkRIpVEO
         +dIfXkHa5UlzN8brC643dI3gjxeIhOwPuY/nWJq/FP0Ul8VnHOjeVuTYLltvmkSWJ48V
         0Dqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795791651; x=1796396451;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=+iPChri7biYpij+YOdee2tTIQuLdmD1pLVPBNubI3N4=;
        b=Pff3+RJaW3F/zWTWfDC24FCWmWw5M/U2kcJrC9sWFdtGtU4NKWmY5qm3b17+wIjbmZ
         yBINIQbZ5+Nnk+91igeDNKGAzzifw0NZswF7Fh68Kf7li/D3ViVrWRJ6q54e6/za1JMH
         JQ0oJS8ceXErZ+DwGbdmO1ungTnmIm1kbHVQFTnrMnR6zKSH4NvjF9+yjiQI8yiOe3jY
         dLqyeqXtWxz2/0qqb+WU1E12Si3PQwX3uMSN/37U3Z0ZafjIySo4Ml9Vub7u1g7nwE45
         zRX14TmgOUrr5y0UtQRm3fIFY8nJJv9/Amu+w5RC/ow2zjbqRyGzYyVszmlp7++gb4fd
         eBqg==
X-Forwarded-Encrypted: i=1; AL+hErECD3yCVayMuhnVfj0Zp9Nu4x7Vuck0PcfOEhryXUV2dIedrWAwavOkz7NgaeIDx5DGYMqBwnYYadFa@vger.kernel.org
X-Gm-Message-State: APuU4Z8V9bH0t8PAPuRRbuvCQe4vj+6xahgoN5GNAoZX3BDm6Vbd5f+E
	QzUdWOtvtmOCISKVeHZBosc07/jYu924dvvKU2IBA+uCea/hELETpZyogz9qHJ6XhNrqdAH9uiF
	KN9m6pJU0uyR5NtKRV4YLQTFs7FuC9AI=
X-Gm-Gg: AZFdTZd0zaVuasnzwSiGOnNTvziwHsmnMce3GH3aqDzR27YCPA/siI+YvUjYqOMrYMr
	nql5ENgiimEWNGsCRYUdN9M4J1Ky5AZsriGjONrw8tjMKsOf6KHzJqJV0GwvHWy1SRV3CEwB2su
	gaSEn0S+DL2tg5REuhWtaqIUqJvOG730PF3PLbL8qq+znrfIj7wCunXsopEx0sfJNJWaOQ0RfF0
	bmx2u/qpo53HMWuo1P3nd0lDcM5U5VBMvCoJrw/7jJ5xWSV85KOR8R7P1qKrPmYsAF0UYjjtvM8
	BDIPN3N3s7QQ2tCvkdhfpsLttsvJagTBVvLwFwgEthiyff2o32/YcS2Xs8pu6W1wiBsUP6QOzac
	pcFWB3VdIbRXDXPEbJ0Lp3c2zuexge514Bm04AXRAwNNVYZFBn1R+g6QCxtrNroYxOixMVAEL9o
	qeP5VQ2zZlCnCV5Gttgt+EHPQb2Sreng==
X-Received: by 2002:a05:693c:60d4:b0:360:5f7e:2eb9 with SMTP id
 5a478bee46e88-3857111f65amr27118776eec.32.1795791649409; Fri, 27 Nov 2026
 07:00:49 -0800 (PST)
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261115085826.89641-1-clamor95@gmail.com> <20261115085826.89641-5-clamor95@gmail.com>
 <20261126114728.GG38590@joneslee-macbookpro.roam.internal>
 <CAPVz0n138PXP88++q4QXiao-7=nzade=e_jAdfKK0_xsEyPtFg@mail.gmail.com>
 <20261126124719.GJ38590@joneslee-macbookpro.roam.internal> <CAPVz0n1xgOqusgO23pXzZdaq0A-j0NyX2PvYPyzrzrqUfYM+3Q@mail.gmail.com>
In-Reply-To: <CAPVz0n1xgOqusgO23pXzZdaq0A-j0NyX2PvYPyzrzrqUfYM+3Q@mail.gmail.com>
From: Svyatoslav Ryhel <clamor95@gmail.com>
Date: Fri, 27 Nov 2026 17:00:37 +0200
X-Gm-Features: Aa3M54rzV-ViZY9z6DJq1q92HT_iE_h9VqHJH3pyc5wvVXF_KFD3s5My6-b_8Bg
Message-ID: <CAPVz0n3UgNrS1vJnPhbaEFN1rPMyM1eBHHhVt8X+Vq_Lvc8p1w@mail.gmail.com>
Subject: Re: [PATCH v7 4/4] mfd: aat2870: Add support for VIN and IN-LDO power supplies
To: Lee Jones <lee@kernel.org>
Cc: Pavel Machek <pavel@kernel.org>, Griffin Kroah-Hartman <griffin@kroah.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
	Daniel Thompson <danielt@kernel.org>, Jingoo Han <jingoohan1@gmail.com>, linux-leds@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, mfd@lists.linux.dev, 
	dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

=D1=87=D1=82, 26 =D0=BB=D0=B8=D1=81=D1=82. 2026=E2=80=AF=D1=80. =D0=BE 14:5=
0 Svyatoslav Ryhel <clamor95@gmail.com> =D0=BF=D0=B8=D1=88=D0=B5:
>
> =D1=87=D1=82, 26 =D0=BB=D0=B8=D1=81=D1=82. 2026=E2=80=AF=D1=80. =D0=BE 14=
:47 Lee Jones <lee@kernel.org> =D0=BF=D0=B8=D1=88=D0=B5:
> >
> > On Thu, 26 Nov 2026, Svyatoslav Ryhel wrote:
> >
> > > =D1=87=D1=82, 26 =D0=BB=D0=B8=D1=81=D1=82. 2026=E2=80=AF=D1=80. =D0=
=BE 13:47 Lee Jones <lee@kernel.org> =D0=BF=D0=B8=D1=88=D0=B5:
> > > >
> > > > On Sun, 15 Nov 2026, Svyatoslav Ryhel wrote:
> > > >
> > > > > The AAT2870 supports a dedicated main power supply input alongsid=
e parent
> > > > > power supply for its internal regulators.
> > > > >
> > > > > Add support for retrieving and managing these supply regulators
> > > > > (vin-supply and in-ldo-supply) using the regulator framework to e=
nsure
> > > > > proper power supply dependencies and power-up sequencing.
> > > > >
> > > > > Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
> > > > > ---
> > > > >  drivers/mfd/aat2870-core.c            | 5 +++++
> > > > >  drivers/regulator/aat2870-regulator.c | 1 +
> > > >
> > > > Is this a build dep?
> > > >

On the second look, it is a build dependency. Since prev patch
removing platform data changes regulator macro as well. It cannot be
applied independently.
