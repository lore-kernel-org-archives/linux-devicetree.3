Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.218.45
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795778911;
	b=aZcb2a7GheeyNp3Cet/JzuK8L37rN/xldHFx/YWIG8Y4Ps4CNUuiRWKuWYb4XwYIi9UV
	 CtQ5b403Hzu90QPImkN4GQW1dMnrBut/Ze3QopGOItYPXRxPuVSIbmcjvBbsHbnLTHQCC
	 9U2t/WqMDIEEelt5qYA9SJ3e8hOR8v1WDrCE7XoTVxoL+Qk3eFMWT8ydB0zDfLfTue40G
	 gGrMHr5PKcmpPV1PGDAOET7ZPdUQ2lAb/oEdyQae6jV+dTxSpDuaw3jj9dX8mHGocd6sF
	 KWGFX3Qfj9dVPEZtpjH1aN2Ek/mlncScVjFDl3xhnBrtMvBytg/gUet7cbm58UJjMyQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795778911;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type:Content-Transfer-Encoding;
	bh=Fz3Wkzx8rOEKpt1iCTlZ8XB+/1jQEjWxVBqBZLbw99M=;
	b=APz6A7MaQNmYHAvBdQsGefDykNVqVHXPShL+p1Jysh3JucrtHDD4TGr/PkFjl4RU12sj
	 TQ721yaPuJhpmLM6hMFb0noctoHIYcuqrekJmb28+XG2vu2qiYCT7Udo/y4/gN70fJHfz
	 /+Z1vcMEiUmsmsaLO0610Sk2s7QD7GYISoUrgMu16rUGIZpMJbaxcFoGhLCQIrnDli5bg
	 tEwqAOjlpi16FbtOfPG/+M+C5yQMPOdcYP+4V/EQ5a+qJmQYUY0C6rC9VZuZ06xGMvHZv
	 Tezd+KlF7XpEXOJzLh6bz2RQxhItK3AKwUej94LJDZ4czppWPMpSieoWmbF+jOKWExA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=baylibre.com;
	spf=pass smtp.mailfrom=baylibre.com;
	dkim=pass header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b="Lmjs/KDz";
	arc=none smtp.remote-ip=209.85.218.45
Received: from mail-ej1-f45.google.com (mail-ej1-f45.google.com [209.85.218.45])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 86932606A327
	for <devicetree@vger.kernel.org>; Fri, 27 Nov 2026 11:28:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 86932606A327
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=Lmjs/KDz
Received: by mail-ej1-f45.google.com with SMTP id a640c23a62f3a-c505b2e1cb9so1440374866b.2
        for <devicetree@vger.kernel.org>; Fri, 27 Nov 2026 03:28:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1795778909; x=1796383709; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :references:in-reply-to:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Fz3Wkzx8rOEKpt1iCTlZ8XB+/1jQEjWxVBqBZLbw99M=;
        b=Lmjs/KDzvtcIm9lpggRo+RmdkASo29A3iVlJO1YX1D3xBx573IwZI7dk8QmpgE2QE+
         /E01xYRXC+XNyMzFpz+QFXdSNfNkszBmc5bcQe6w+0Vfo+hj1bEFgrChI0ABhuh7OZuV
         6JyjC727+46/3Fy1YJ/Y6DBJ3SIsivpz5nP7A9jzH5/lv+PJdrqRF45gtB0tGiUoTBPo
         yodhMNX57M4VHLkpg1k1aAmcpkFJOQTF1fqNFNe2Bo87/n92a9TxrhpcJMBBE7DYgfyV
         w3EtS146tTJacFP4VErTIpoqBHeXze5Q0UuY+Y1nLJ9bI6zMWccNR/RWjzfFl0f5W6Cq
         fPDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795778909; x=1796383709;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :references:in-reply-to:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Fz3Wkzx8rOEKpt1iCTlZ8XB+/1jQEjWxVBqBZLbw99M=;
        b=Cs0CoZS4DKnlHLzBaBKxRoj4PIYHSHFeEBibdK/+1Z7wFx5uES+666Lg9Tr9Z2KXxe
         vJB3YHTA3we83+RxR8VroyVotHOUF/8ZP4v9h+UwqoYsz3q3KIwqU+uqJNjSuIxnzazw
         c7I4Wr2bProWkaZ63MJfp/TwpbAAPp/wDNyT+nG4bp4OifqWSwlbilFXkdRjcF51mvH7
         l9a1sWOzaPq3gXlpIiJBBTETOJKDTNI4uwRQCi8hL145sQKPyYQu6iFgKVwbbHUfCqnv
         yf6gKwCliVXEoE2tyymPGyo7+3v/NN78x57LHZZPMeZvobHYcBp+wWPDdbYHZbNuki1x
         hh9w==
X-Forwarded-Encrypted: i=1; AL+hErH5+RfggX5TcSnQ2ms3YqbNVmzpwomSqhmr9lpKUAiEO+QuN+NmbIUUCCgQwBZF3LmcIio01xe44N4L@vger.kernel.org
X-Gm-Message-State: APuU4Z+DK767YjDPSQvyrAhTf28IKm9DUf67J5Pq5ut2CvUxAITV1rmU
	4J+EkCCBSe07ZbmtDeOhm+j/Jfl5x+7bwqwe43JmUomVGtZv9fnJ0u2V7+0HpXThY5o=
X-Gm-Gg: AZFdTZdo5rTKgVhzp9xeJ8pUC9WciCBwxR07HZq/oL56MFMqnWh/fi7uEZFgr3iTlUP
	2CqO1pra7CgMXvP1Bt9C3zWEQRe9tQER8gz8chHhWwHqyJJQNYEyKHdmpY+CqBeTShdqkd3YtYt
	7EHnjH+YSV43W9WAaoBiFrMXxoCkiJKHT3RpdKC6AIE4d8lkqRsN8KHl6MNpb/O4rk2pFrZwZHc
	nTdXMtUmHKJhuqrDuEc7qxlBcU5EcuhokSkk5CZ6owdaNFlyyBKnCrQcuJ+x6YdyRH5kkAK12eY
	7uw6F2kNlIvIBcg+LwA2nfMQetSi1ed2c7IF3uBahLBTdoM2PjspbpnROr9k8FHIJa/r3cDwlO1
	jePpeI7ktmMgW7HpFhD9xeI140pglYWfHu7kJ/R5bONrOuPFoOj5LwkwqBwkbl4F5AR6nM7TIfv
	iQ05jZdGp4OVTg80/BkE/5nHvT6Z84uizSQHM20KbEr2VoGEWUyVUCBJaZ3ETGz1JtTrkXVfRW9
	e60BAwVV9kEyakOucmfjR9u8l5xdJ2eOo82By000HYFsyrOTmZLnefmIbITHa476EJAiSoaqT79
	UsAxncZLQNg1lxOoaRjpVKmjLlkU8VCSfgB1L8eb80yFx0EV
X-Received: by 2002:a17:907:3cc5:b0:c2e:40a0:7978 with SMTP id a640c23a62f3a-c513aace8bbmr1830615466b.9.1795778909013;
        Fri, 27 Nov 2026 03:28:29 -0800 (PST)
Received: from localhost (82-67-6-57.subs.proxad.net. [82.67.6.57])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c513aea8063sm851858666b.45.2026.11.27.03.28.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Nov 2026 03:28:28 -0800 (PST)
From: Jerome Brunet <jbrunet@baylibre.com>
To: Jernej =?utf-8?Q?=C5=A0krabec?= <jernej.skrabec@gmail.com>,
 andre.przywara@arm.com,
 robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, wens@kernel.org,
 samuel@sholland.org, Enzo Adriano <enzo.adriano.code@gmail.com>
Cc: Maxime Ripard <mripard@kernel.org>, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev,
 linux-kernel@vger.kernel.org, Junhui Liu <junhui.liu@pigmoral.tech>, Pablo
 Mazzini <pmazzini@gmail.com>, Vinicius Pedrosa
 <vinicius.eduardo.pedrosa@gmail.com>, Alexander Sverdlin
 <alex@sverdlin.org>, Jun Yan <jerrysteve1101@gmail.com>, Lukas Schmid
 <lukas.schmid@netcube.li>, Cristian Filipescu
 <filipescu.cristian@gmail.com>, Norman Herms <dockseed@proton.me>
Subject: Re: [PATCH v6 2/5] arm64: dts: allwinner: add A733 SoC description
In-Reply-To: <p3YaXlLJTguQBGnWyMpb1w@gmail.com>
References: <20261126-a733-cubie-a7s-dt-v6-0@gmail.com>
 <20261126-a733-cubie-a7s-dt-v6-2@gmail.com>
 <p3YaXlLJTguQBGnWyMpb1w@gmail.com>
Date: Fri, 27 Nov 2026 12:28:27 +0100
Message-ID: <1jld6eldic.fsf@starbuckisacylon.baylibre.com>
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

On ven. 27 nov. 2026 at 05:29, Jernej =C5=A0krabec <jernej.skrabec@gmail.co=
m> wrote:

>> +
>> +		mmc0: mmc@4020000 {
>> +			compatible =3D "allwinner,sun60i-a733-mmc",
>> +				     "allwinner,sun20i-d1-mmc";
>
> That's not really the case, is it? A733 emmc has support for voltage swit=
ching,
> so regulator should be added here for voltage switching.
>
> I suggest that you drop this node until proper adjustment is made.

I'm not sure what you mean here. AFAICT in the documentations, the D1
and A733 provide the same registers and should be compatible. They are
so far.

The driver does not implement CMD11 but this equally applicatble to D1,
isn't it ?

What we might be lacking right now is properly voltage selector on PORT F.

>
> Best regards,
> Jernej
>

--=20
Jerome
