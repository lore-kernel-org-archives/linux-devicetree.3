Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.82.176
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793354585;
	b=C7evCf3bK/O0YdKdJ+HfSfhJ8Pc9FXh1XSVNaxyMojdCT+yCxmcijpig/DhMTGzJLwmr
	 LOEBhQYHm1IwUllJ+JvzOghVTBgU4rqZ2SlgWlrCQDzfjWqdFPt3fWh0xyzmfTusP+hIY
	 4+GTguLjyToYFPAVasjAGxvPXek/0pst1bfZUfxfY4kDAIDC0cDcMSWVzyrfCWQr35SX/
	 3sGD7n180TAP1Ysz7Og58fJvNvlkEbSU3M53II2dl9fCuZnp60m2O/bp4a0FY4arPB3wq
	 eoNmQBPHhpKnwJgVtvi6+MAszdJbWwydQqQYTLj513LpYjg6WwVGAHBsdCSMxnuj0cw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793354585;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=KKIoAfpAQt+lZvobWVlWyv/tAfJh09WkhRac1CVCCVY=;
	b=Sg/EGkwHDstq5pt9Nzb9qfNbiERzNu7Nbi2qmdYXrCRACyCBiGukKG11a3ygbEnPNuG6
	 XvGrxhbZ2p4+N7FY5hRTsGBA0YERuOyPn21vjEFUzJNPDiiaFNRGKQdQaxPyHgbguQxO5
	 NpkiRFNuZl6C9bD2AjJjoYLUMRWzdKLZdqrM0lWvjfhJmA7jrKQn/5JXNoPC7BybkWC3I
	 1qB5PylLcvrowCrGrlhIDee89lK8dABuOu8zth7sT9k6EW+w+QwTFwOjM7d7eZ0gPol0k
	 v6yVBw1Hm45iWkSoGDaGZBgBWJ26p009uYlGku4LU/YWxCjyOpGpJ16GEoCe2H1//IA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="cB8b/Y4X";
	arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.82.176
Received: from mail-dy1-f176.google.com (mail-dy1-f176.google.com [74.125.82.176])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EBDF3606A31F
	for <devicetree@vger.kernel.org>; Fri, 30 Oct 2026 10:03:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org EBDF3606A31F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=cB8b/Y4X
Received: by mail-dy1-f176.google.com with SMTP id 5a478bee46e88-3514b90bb89so1026122eec.1
        for <devicetree@vger.kernel.org>; Fri, 30 Oct 2026 03:03:04 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1793354584; cv=none;
        d=google.com; s=arc-20260327;
        b=DhJuRrxJo/UYBfwmyhYllwy2fz75Qz6rw/xAw0/1XOeTn9wjXsFdTBhB+MOu0UC3mv
         yJnaq4rjcepvdSR/y4E++51fxVun0+dG02RUsXwip3NXtrRrYoWT9a4BqZVM2Qu77Bn6
         y2YbRRa48nciX0tggBchtCC+yeb0ysJ8X3Bb6VKg8HBPvTD0QyMX2hJwvb5A6oMpUMY3
         CF7Ypn2cgvKV6yFWXy8d7YhdD7BTHuYsYdsm3SA0uHB77tylrkwSMZUmav1Dgi4wkTvl
         oG+3owdMbzrcFGwhzapGv5cjLeY4KUJgprlODIWjARCj2BGTO7Mu0EcNgW3Pdd5etPcs
         CKww==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=KKIoAfpAQt+lZvobWVlWyv/tAfJh09WkhRac1CVCCVY=;
        fh=HPscHPYLojMD6HQf1zcjpa9BoHvFhi8wC4N8QkEV2gk=;
        b=O9Ab9XfddA2xh3nR6/RcT8zgBoNki2FO1jKVMjmtwIUW52CHfryUdMiEeAnT01JW3y
         0g4B8nDjU2q598ojA5LiKEPji1n/ZH+xqSN7EHLtektASNqCH6w4tUtXPh8iUrsjz70+
         Ni5MOv3qnrYUYJveXtp848vvPcCiCtqcdlRdUUdIuq8ml8DpeXZXDu3/daxnXlb3DGI4
         rAGIRo1hiBQfR61umrYTv34WnQ2Wvlv/UY3thVokhgAVXD/GUryaBrm5bl7lP0z50mRi
         HDmd2C5pqWsYoSasKwGN74u4n/oxHzzsFKM2I17TyQIin+qoWIdifx8zSV5jtH/b4Dod
         l8ag==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793354584; x=1793959384; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=KKIoAfpAQt+lZvobWVlWyv/tAfJh09WkhRac1CVCCVY=;
        b=cB8b/Y4XBoH3d2mx1sKiFkgaIGdUg99+DVWd6+3nB/DQsr2antbnO9ny4/huLEhgov
         Rf9CehR+G8CfFq3vJ0jU8Np1ZHQq76IRStPZKG87lVuSp2aJRS3C7zyg23jT0pOmjdnI
         m4lGlbvP4/pA/QI9+VZPsnacGVzR/MrGJckQALCnxrencrKpDaYfoK4KVRpsW4tUUNR/
         lBCkiGaNhBRqia8LQw8w7iU/nZUVnmTu9wj2MCEdLrnmVpW9eZtWaPG4y/4lkZ9WrG8I
         Te/8SKLCspInB6mhw+Q1vVwQ1Tkc37Ot2UaWEhI1xfCJCJB1E1wU0WYPJVnjTIMhc/K5
         oEXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793354584; x=1793959384;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=KKIoAfpAQt+lZvobWVlWyv/tAfJh09WkhRac1CVCCVY=;
        b=cz9KHucca5ERgloKXc2hRffHMHmLsuoOrJwTIAqwdXZrdcFPKfafk6niPe0YpMb7vL
         +dSheWkGNyhfw4LGB/WxW6gAl3CwvgQr0uQS/XPJUMm7rNsyMSu1Ff63veZh+fgN6Pqp
         BiVOqGrD0ydSFUlS8fyCaNwmrTjv3tRKeddMgbNyFI2Po261NZZHcS7yyNl6ewfmaFaT
         h27ajoIRdaMMKZiNrBnNSWACAr0x9UErYd9tqj8eEkKbHYSeM8/dWKZGPOKROFSqaERx
         SzQYbiQNYOfQ0q4fdqPIgdLswnwCnXFQwL0vfWRcHc+ABG8c7xnuysRPf51w1aV8leSD
         cT9Q==
X-Forwarded-Encrypted: i=1; AKwUvBwsJlJuV6mivG6Gr73hvsE3F5AtUeo7W00e2MYvxJSoaYro6bhmSKilq+Bf0U9tNtFIpcybkADfsikd@vger.kernel.org
X-Gm-Message-State: AFq9FYJRS+1gQwyjlBWPet1fglaiSLEYOr2Ym1TTN6j6e2bHIEu0R98q
	EN10yGzaDmTz6vJkrdbl823LBH2V0smD2Fr1b6jycVrG0L3ppWmzn5QfuLaWJtOEzZyqDjwSuus
	zqkO37RQ8mit02FxszrcL1z0rVtiX7VZdvlD1
X-Gm-Gg: AYBFou3Nh+paBPRTjh3phM7WpZgPBsHkVhCl2UogqpQNePKA9yffrtVCWdPtiCpUmSC
	1fem+wqj5KptnrCM2E14y6T9kaAudnVklLXlW+YnCGNw+7FxHzyFCTDbiUtZ889PeV30CaGSvUH
	vmDGg76rvDQ7VzQUurNQOvhAWFQAmBFJC2fnsnTWjsVN3f7CavqNU1EbnIE3kKH+HuEuOazZi+t
	SHSa/JdWEPx1qssGiw0Y8WArAVKseKUl9kg5GHKcjmEqh4J7JCBQ5VNGrZwmV0D3c5db6ujQNyu
	YNl4DO6iMnGy1aRB6NJ2K0sNkWtm2roUNQHAK6U3GuEBkWOFC2ABuoQ0H32aUlmoYXPTDOPlJCF
	37XoYw6C9rZssEqThcvRog45g9TWZGOtZHa2LBzPsP3svCDD4anI4eZxfNKPuD87X/5kVMA==
X-Received: by 2002:a05:7300:1897:b0:361:167c:2364 with SMTP id
 5a478bee46e88-36a42362348mr4001559eec.8.1793354583867; Fri, 30 Oct 2026
 03:03:03 -0700 (PDT)
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261029152909.234584-1-clamor95@gmail.com> <20261029152909.234584-2-clamor95@gmail.com>
 <auRjGM7briuvXDEg@houat> <CAPVz0n2=sgbzBfvhGOoRFXeOzKDvs9en7QD0pHc31r5GzgCsKA@mail.gmail.com>
 <auRoaHUqMO4BRQlk@houat>
In-Reply-To: <auRoaHUqMO4BRQlk@houat>
From: Svyatoslav Ryhel <clamor95@gmail.com>
Date: Fri, 30 Oct 2026 12:02:52 +0200
X-Gm-Features: AclHuK-L_bH3_AEz9gXr-D-fUGtxDSP6rDxMoUG2ElKY1BLDMKdvYmD62gCTKCI
Message-ID: <CAPVz0n3K74CZemDzVVymmjU_5GUGE9FsEKk555-AJfG0jek_hg@mail.gmail.com>
Subject: Re: [PATCH v5 01/11] drm: Add MIPI DBI bus support
To: Maxime Ripard <mripard@kernel.org>
Cc: Neil Armstrong <neil.armstrong@linaro.org>, Jessica Zhang <jesszhan0024@gmail.com>, 
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Thomas Zimmermann <tzimmermann@suse.de>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Thierry Reding <thierry.reding@kernel.org>, Jonathan Hunter <jonathanh@nvidia.com>, 
	Mikko Perttunen <mperttunen@nvidia.com>, dri-devel@lists.freedesktop.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-tegra@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

=D0=BF=D1=82, 30 =D0=B6=D0=BE=D0=B2=D1=82. 2026=E2=80=AF=D1=80. =D0=BE 11:5=
1 Maxime Ripard <mripard@kernel.org> =D0=BF=D0=B8=D1=88=D0=B5:
>
> On Fri, Oct 30, 2026 at 11:42:12AM +0200, Svyatoslav Ryhel wrote:
> > =D0=BF=D1=82, 30 =D0=B6=D0=BE=D0=B2=D1=82. 2026=E2=80=AF=D1=80. =D0=BE =
11:29 Maxime Ripard <mripard@kernel.org> =D0=BF=D0=B8=D1=88=D0=B5:
> > >
> > > On Thu, Oct 29, 2026 at 05:28:59PM +0200, Svyatoslav Ryhel wrote:
> > > > From: Mikko Perttunen <mperttunen@nvidia.com>
> > > >
> > > > The MIPI DBI bus allows modeling DBI hosts and peripherals using th=
e Linux
> > > > driver model. DBI hosts are registered by their respective drivers.=
 During
> > > > registration, DBI peripherals are created from the device tree node=
s
> > > > provided by the host.
> > > >
> > > > DBI hosts expose operations that can be used by peripheral drivers =
to
> > > > access associated devices.
> > > >
> > > > The original code was authored by Mikko Perttunen; I have aligned i=
t with
> > > > the existing MIPI DSI implementation.
> > > >
> > > > Co-developed-by: Svyatoslav Ryhel <clamor95@gmail.com>
> > > > Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
> > >
> > > The SoB situation isn't right here. The author is allegedly Mikko
> > > Perttunen, but you don't have their SoB, and yours isn't there either=
.
> >
> > This is up to Mikko to decide what to do.
>
> Not only, no. When you're sending a patch you must add yours too.
>

> > > > Co-developed-by: Svyatoslav Ryhel <clamor95@gmail.com>
> > > > Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>

My CO dev and SoB are both present. Mikko will say their word and I
will update accordingly in v6

> > > Aside from that, which MIPI-DBI type is this supposed to support, and
> > > how do you intend to support Type C panels we already support through
> > > SPI?
> > >
> >
> > MIPI-DBI Type A and B, which have NO support right now.
>
> Then you need to make it much clearer... everywhere :)
>

Ok, noted. DBI Type C support remains as it is, it was not
changed/touched at all.

> Maxime
