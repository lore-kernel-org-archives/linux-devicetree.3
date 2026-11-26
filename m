Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.82.52
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795697431;
	b=cOugNlvOx/AKxkE9W59jbn+V/KMqOa2065kbqcUu1tn8DZHGukhs3VW1cSLqc6i77pUM
	 C8o9Fm9GoCNFXJiqUA4pItx2zpW2+zkg9e2tFwsOmK784XgZM5H/ulfa49ZqUXwnjTpJ/
	 Tobc06+SdfojZYeh63ZHUR58008zLDfnE4j0+uMWSo9Ejlv3DQgJmjelpvAmtbIi6z90f
	 d43af1pDjpa7kIu5QIC7mNgtRDkFwRnqUk9bSW84nj/DkEe0+v1jKbv7yBZh1xQUp8Hwl
	 UDiEoxNii28R/lg0djlSsMUCKr3LdhT7wXXmk+JKSZvUbO7UVwAtIC4/Bli1BhQlxlQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795697431;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=ruYpKxR0jnfDu2Yt0vn3RyxCANQ3viM4x4RpbrQpd9M=;
	b=xcY3AEICiMzhtaKkNJNZpI9d5CyKSRjWYDnLWTW0aobBVMErTmpAONtS2kXsI2wQ0nFu
	 D1V5CAsfQ119vbHh70zYFBVnpU5sFQHWE+W5zscBO7YvI324rJBqUrK0QhZhDDNNbYoBo
	 yVlanQp598QW3XK1jxvjOyLR5Gfcbldy9Yb/S6qpejsPkCmF91I4QS9epSIK2OkA4oh6m
	 b8ypGoRIiGdpGhPdVdUIHsgK04z21nROlip8KFjoj/zP53UKuZzHxiVOMSzINGwOX08UB
	 /jKIBbUXkBt1EWPZ34UaYTu9D5KdCbsRgGinv+h3YofBTGA9JAAFzgX4tjqiPm0XoBg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=DiD4IfCS;
	arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.82.52
Received: from mail-dl1-f52.google.com (mail-dl1-f52.google.com [74.125.82.52])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C296F606A326
	for <devicetree@vger.kernel.org>; Thu, 26 Nov 2026 12:50:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C296F606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=DiD4IfCS
Received: by mail-dl1-f52.google.com with SMTP id a92af1059eb24-15ea896ddc8so11515400c88.0
        for <devicetree@vger.kernel.org>; Thu, 26 Nov 2026 04:50:30 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795697430; cv=none;
        d=google.com; s=arc-20260327;
        b=Csl/EJYM6rSsiaqHn+p1scBynWK56CSOVNQSCilqlada+GvMzcvABlOUau3YHW6sl2
         uJJAqqau5psOxuv+CSof43wtlWM5R99gchc+jF6azFfO97wUubQhV13dYht8f4hupXOI
         Qt74Di7b6y3i8vNCiPAXLE2M9OuruDbYcWbVEa3xepRxt/bQ59fIIZDBPZKt4E4YJvpV
         5/zEKgZ6PudwbzLqDiDak7dS3pKLK7nR29LBu/D6ralwTeoHAPKT54j220JGKRmONE35
         o2QzBwhuvFstEVvWEU5nuH0WeznfB/WjcYSzJGrPA1M361oUrMHrtQbAiUo+zmifwAmf
         zxmQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=ruYpKxR0jnfDu2Yt0vn3RyxCANQ3viM4x4RpbrQpd9M=;
        fh=nWxI4FDxz1Pa7JqW4ygoD7KWfgCtih5c+/kKQK8D/7U=;
        b=JQl1EV/oY+3dXWccdXkRb1fGvQyYNCa1NQ7BleAYkroWuR4ONkNnRlwr/jhJubCDWc
         U4hb7s5TkB/h9yxlap67A0mMEIHkdQFua56/nV8Wp/9BXPtMz2sGF3Gwt9DndS0XOtmN
         sdEA9WbE8h4QisIxodYvpCLZkqbkHjFaP26m2TLQnRxg/Zi4hGmZqOaACVHFIJteGBeR
         Uj9rjNBUrNW26a2uTuCOdUDQs7+uzacPWf8P6A9lShZ4z/uso9KJsmisVPc4+ApNiMTs
         9bKmyFEE01zFFZwwtXeTZMI1SCEQJgJlubRJnGaLy37B62qUZdQ8zM4JYHpBxYf1K6he
         87pg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795697430; x=1796302230; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=ruYpKxR0jnfDu2Yt0vn3RyxCANQ3viM4x4RpbrQpd9M=;
        b=DiD4IfCSj5LI0ZTuvV8wtiF82UnMDxvfjqUBavKh+wVIqS++D7AZLaBSYRHijkLNdg
         86RpW81gFKtn7ojYeSCCY5VVpq1y2CuYHX92oXMBaEUv6d5waRxi+jUW4kLamrPDxvbI
         LBKc5jIrzyNzpVvoSAcNlK+xJWwhoAWPKBgP57pqPwr/hJurvYKE58bH9735sI5GyhG+
         q1wxDZFLvZ8Vah+5PEPGb1N/bdEoUhRCEeSdkw88wJk6KDFj//qMm4CXxXcLy2h6Pc9m
         exKd/xWsSMGEGmCcjPXa3p+W32B4TPRz4JljeNIR8BKB+ewNg7f4xVhSVuZBGB2zV+6V
         uhyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795697430; x=1796302230;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ruYpKxR0jnfDu2Yt0vn3RyxCANQ3viM4x4RpbrQpd9M=;
        b=rhSS0WZ4mpDfcmPsBuOfj2r05Y88K+FwB2zxYO9AqQb4Pfb7BgNTzWZg7MJMS21q+l
         1VVyjEK4xzyhPm2o54xycGnKPFxZ0q4vIH3quUZxYrEi2WEdKOrgGe0xHCDbKv09JJyi
         xGyWlnAXSYb9t8T+nwXWX3piRIdqIubMijC2PXIbMN72ArqZOzC0UmyAB2DT4yierQMp
         h89oWjSrjT05+DXuZWjCwX8MdHZ37EmTXWnunpzGuk52r8VejRB3cHCJam06VKREllg9
         zDlJLZHLZlyCVkSg/yRnMzvr2Tc4ebcnYfSins0HoGGUhjk1z0Luc7A8xCnLI9j+UTP6
         5Rng==
X-Forwarded-Encrypted: i=1; AL+hErFYbdfKsBIwN6m2O6rXV0vzQsQMozzDBLZoQcfL2esnB6GbnTUyKmVtSOISxnsqjcRoNn0bHYGt1rER@vger.kernel.org
X-Gm-Message-State: APuU4Z82uVZ2vWGXOYM+XcB80adVTQoWRM8d1Eh34kUipwWaSV6UnFO4
	R01kJzLkC6C8h+dmfauzLbKZ8JoQFV5f1pyONBbl1h9bKp2X7RsrR+wXRWYXkF05q1A7XPJvA9T
	37sSISuGEHnSCNa55xHskMlJKqfIk6Ac=
X-Gm-Gg: AZFdTZeYDeKvz9s0JopKYBubufx+9uLeND5EnO1B6sWkpNgrr95Fvgjujfif+7Kp7b8
	1PFJIm9IqHzW3Ax+DrsMIRR+HoQKvJR6PJ/t2akidUxm8Gei8/1IolTsEwdoHMFhl/mA7kI9ts7
	lVCg3KDeE67JPu087VpUN1vsEXevmi8chzYEqwfBvGkSHtkTVNJDz3tlyYr+hGUDR7JQb2YswqU
	fHBlPvFaj4+xB8P7oTT0gIKG4KHiyeeFx3thGgs3Y9k2IJ6GxgU9hUNDQZVKDawwvVijgFLRJeQ
	0EEu64gdf/TFpEmjYeh1BLLDuQ+FFD50NvshCyX8n8e8PUFGkWfR0bSft8LCd7CPhYFn4lzSNx/
	Hm781hCzdTgyz3Zct53AgCGZc/k3N8TTEksI4w8N9nz7taFfGQhjONOvEzMNv/XLRCcMoK7ycj0
	rAZzcoSJLFga9acLlikCIlZm2LZ16HiA==
X-Received: by 2002:a05:7301:4d18:b0:37d:bd4e:c378 with SMTP id
 5a478bee46e88-3857181d8ddmr20532737eec.41.1795697429793; Thu, 26 Nov 2026
 04:50:29 -0800 (PST)
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
 <CAPVz0n138PXP88++q4QXiao-7=nzade=e_jAdfKK0_xsEyPtFg@mail.gmail.com> <20261126124719.GJ38590@joneslee-macbookpro.roam.internal>
In-Reply-To: <20261126124719.GJ38590@joneslee-macbookpro.roam.internal>
From: Svyatoslav Ryhel <clamor95@gmail.com>
Date: Thu, 26 Nov 2026 14:50:18 +0200
X-Gm-Features: Aa3M54royAl1sABN4xJ1Cip7AOIlFSUkJQoKYmmC67r_RL_cs_moDjpaDX6PwaQ
Message-ID: <CAPVz0n1xgOqusgO23pXzZdaq0A-j0NyX2PvYPyzrzrqUfYM+3Q@mail.gmail.com>
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

=D1=87=D1=82, 26 =D0=BB=D0=B8=D1=81=D1=82. 2026=E2=80=AF=D1=80. =D0=BE 14:4=
7 Lee Jones <lee@kernel.org> =D0=BF=D0=B8=D1=88=D0=B5:
>
> On Thu, 26 Nov 2026, Svyatoslav Ryhel wrote:
>
> > =D1=87=D1=82, 26 =D0=BB=D0=B8=D1=81=D1=82. 2026=E2=80=AF=D1=80. =D0=BE =
13:47 Lee Jones <lee@kernel.org> =D0=BF=D0=B8=D1=88=D0=B5:
> > >
> > > On Sun, 15 Nov 2026, Svyatoslav Ryhel wrote:
> > >
> > > > The AAT2870 supports a dedicated main power supply input alongside =
parent
> > > > power supply for its internal regulators.
> > > >
> > > > Add support for retrieving and managing these supply regulators
> > > > (vin-supply and in-ldo-supply) using the regulator framework to ens=
ure
> > > > proper power supply dependencies and power-up sequencing.
> > > >
> > > > Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
> > > > ---
> > > >  drivers/mfd/aat2870-core.c            | 5 +++++
> > > >  drivers/regulator/aat2870-regulator.c | 1 +
> > >
> > > Is this a build dep?
> > >
> >
> > More a logical link, I can break it but it still will be part of this p=
atch set.
> >
> > > Would something that was working before, break?
> >
> > Other way, it was broken (aat2870 may have a dedicated supply) and now
> > it is fixed.
>
> Great.  Split it and Mark and I will take them into our own subsystems.
>
> Thanks.
>

Then pick first 3. I will send this as a follow-up

> --
> Lee Jones
