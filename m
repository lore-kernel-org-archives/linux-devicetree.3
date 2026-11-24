Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.44
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795480688;
	b=coTEbSOj48Z02bsEwQPm8g7fvyFc+nh4kwvxNBVUJ0el53t70yTBiCLnJyMVJoynowe7
	 T3RXf32jN6hbO7VnMOL7b5Wu2bj23iqeIOboe57LVLIkTV+FHemFa75+yM8UAkzzynb8N
	 qYUnfln2wS/SmlCVQy2i+jZBTYoCrzrj71z6u5r95OBxWmlV8Ufx1gaHmLWVblxHCitk2
	 WuP2bLuXmQTeZIjhhxPw32Uqh1OLk3uijamN08us4yvad6DEQMh6ouri3n0XQ8sq7bONz
	 z/um5+Q9vbeIiJPoYyYbc16jznetaXkzQHQkGPOrsIliXyXXpG/411jan36Xqz+8z1w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795480688;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Received:X-Forwarded-Encrypted:X-Received:MIME-Version:References:
	 In-Reply-To:From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=Rr1csZ7oaM/i1Y8jv4N4Uoe336yHoqWQoxkbuSqpTlk=;
	b=Cr75XExgH0CCSJMUrh0i809t80cq7VwdCoHqIDZ5CpWVqtB9s+ayymZh1s/YV76Z2g8B
	 ldRwl6Wxvq2Y56ZqfpW1+coE/IOvttOtw/WdjlnKeBV0VTLhDguqLf5qM2ur6eM4o3bw+
	 cKRH0ZevskSJOk1QqGYaBNUC+eQ9UFrDuEvmCLYX9gGPGKXQJSTDwdlWsyTsvzRwHovi5
	 MvbEnUs/6GdsUXzlxSey5MF1QvIR8M+U5M4VrE+XD8+Yh3AdD4+aexa6hSpH/QiJLHbY3
	 8jCjOnPyI1Tvl9xH0bRRGzSTdikJd+2ixqFqIXEGmTG40T/vhuwfG+L0e1qrlqkIn1Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=chromium.org;
	spf=pass smtp.mailfrom=chromium.org;
	dkim=pass header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=SrwGIPab;
	arc=none smtp.remote-ip=209.85.128.44
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7BD19606A32A
	for <Devicetree@vger.kernel.org>; Tue, 24 Nov 2026 00:38:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7BD19606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=SrwGIPab
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-4b79502c27aso37708695e9.1
        for <Devicetree@vger.kernel.org>; Mon, 23 Nov 2026 16:38:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1795480687; x=1796085487; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Rr1csZ7oaM/i1Y8jv4N4Uoe336yHoqWQoxkbuSqpTlk=;
        b=SrwGIPabyCVCtc+drfL5IE1zae9fFyQXpfk+k7xL2uFxBOtDi7itPXxCA9VGeYpb61
         TnA/BhRqERP+uiZN6u+1Yo8GDVnJBTzVXD6qK4QOAluYDNM+XK8mik//iH41DAIjRtt6
         1/YIEB2ZyEHrxFjMgzjLkykus+J3+w+YVuOaI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795480687; x=1796085487;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Rr1csZ7oaM/i1Y8jv4N4Uoe336yHoqWQoxkbuSqpTlk=;
        b=0TL/aaDcw7S2L4NdQ71LTf4B9HgvAHHVNdBwpcxxYlnerGaDXR0Mu1tWOJu1OUKv+h
         Fhdm7Alo1eKsm6MVdT+iATJcC0dlKz/x4Edy8M7Q52LejbRUy7+rTXK1wecPyyh/ML/a
         FZJ7rbjyKpgOu/d2SNo1A5gvIt0Du/dK1ARUZDg/K1krN4BglxeI7eFPPzZXcyNNPFTH
         ED5dUutgRuw9W8nMVIt6cHX7c21CsJV57XuoOVMKSI88NEoUgzu/YNPGIgAiOwvHOHW9
         y6c6F5ORxiFbzvTEmwXHyVJKDX03Y9LfjI2lz/J61CYzdTyptNuXhKhhnV3R1/qrqr+Z
         zc/A==
X-Forwarded-Encrypted: i=1; AL+hErEtvDNRcrRkwL65ySOaJiDH4ycwmXs8g91t/PJ5UYbgNAV6ZhGGY1rkB5t0TFS1pM+v67zxVE97yMbT@vger.kernel.org
X-Gm-Message-State: APuU4Z+lP8b/UA+dsQpL8/74R1Grq1U4hGRSowhGlVfXM8rVTddiWenr
	9gZoyvvTBakGCfVmF+a8Acx7SQxm6Ge7d2rudqxILuFCxa/M2JS+F7BPTSFcaVShmKbiStelAvn
	84cR9dMVg
X-Gm-Gg: AZFdTZcI+gJJQIZHktwhLCoJ6HQ1pN7yI3iw5gHOSLRKgyTfsBNQV4OtOHNRttsX+tH
	GFb1OIWC8KcAnS9GYjVCloWop6Y9v8c4pLguLhz05QXRNrPkToi41eOXi2PxxSY7kCt0oSQT3iG
	MzktWFhMECHSK7UnXtqY7GPWMHi2HbDediDstkgyE1JCUgzIdhnCBabYQHgwJjl0Zl+mzM1f4WU
	z+MQ0whpClqseM2iPE+5llWWsr/Zwd6Lx2MhjYxg380osqETBogvViZVHJRk2zHun0NryqY4HEj
	+rxAN4bhz/3Z3BR7nMcmql07ZJXzk+YuTz8dPh+G6fGr3DRJjBxIvtZxAIWbdRDO7lnI0oT/WXC
	PucuFxmExxvJcbbBrq9l/rwmLaL3PlM80FoTCO238EpCJE2lRPzCKeTUE2dfmqhUrU0oOeO5b5h
	pAOd25Qtvw8NGEY3xs+Yl0JbLssBa56SBnR3MtLQcGooSkpdNoFQL4wHAfZhha8/mHiU3WWi6Kx
	IZGj/F6gF3LSHnoDXefm/wV4hyVjpw6oan7nf42t95BD19wPAiLXwoMxySPH7eDl400k5sckVi6
	V+jk3cw6NB70vf1myZ9LuNy+7RczExw/bR9JqLnL4A4rh06PFCBBA/sS3NKHtJMoyRGW
X-Received: by 2002:a05:600c:83c3:b0:4a1:7e77:c382 with SMTP id 5b1f17b1804b1-4bb8880ad68mr255377105e9.5.1795480686793;
        Mon, 23 Nov 2026 16:38:06 -0800 (PST)
Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com. [209.85.221.52])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb905f1489sm222011785e9.0.2026.11.23.16.38.04
        for <Devicetree@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 23 Nov 2026 16:38:05 -0800 (PST)
Received: by mail-wr1-f52.google.com with SMTP id ffacd0b85a97d-491f34b4e0fso1827467f8f.2
        for <Devicetree@vger.kernel.org>; Mon, 23 Nov 2026 16:38:04 -0800 (PST)
X-Forwarded-Encrypted: i=1; AL+hErHuDZgcAR0pY5xzVVixs+D4SCdzTtH8U/Cte0wFQm1zZM9KBQ6UrzWs9JSi3C8W0CuBrsqR7t9jXb88@vger.kernel.org
X-Received: by 2002:a5d:5887:0:b0:4ac:84c:70df with SMTP id
 ffacd0b85a97d-4ac085bb48dmr24443427f8f.45.1795480683352; Mon, 23 Nov 2026
 16:38:03 -0800 (PST)
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261116205320.1621386-1-dianders@chromium.org>
 <20261116205320.1621386-9-dianders@chromium.org> <20261118095418.51d30ee8@pumpkin>
 <CAD=FV=XZP5ZD8J8k5wD5XgQP-sF1SEoZNkRkXyYL1ZeuU187_A@mail.gmail.com>
 <av6J47fOAYxejSgr@gractus.seuss> <CAD=FV=UQ-LSqJ0m4h3nvatYOV6Jc_gezOb+SHTzUcx2twytEaA@mail.gmail.com>
 <awTZn8m02pE-wz29@gractus.seuss>
In-Reply-To: <awTZn8m02pE-wz29@gractus.seuss>
From: Doug Anderson <dianders@chromium.org>
Date: Mon, 23 Nov 2026 16:37:51 -0800
X-Gmail-Original-Message-ID: <CAD=FV=URVKrCKFte_2ratzViiEshYMO-9ZxiuMFbyqW9=apYLQ@mail.gmail.com>
X-Gm-Features: Aa3M54o-Sw7CoGQi9w7uLhHvV-4sdG4fKsa0NEwuzeGRk65fdVb-36i953nWGi0
Message-ID: <CAD=FV=URVKrCKFte_2ratzViiEshYMO-9ZxiuMFbyqW9=apYLQ@mail.gmail.com>
Subject: Re: [PATCH v4 08/14] libfdt: Speed up fdt_find_string_len_() with memchr()
To: David Gibson <david@gibson.dropbear.id.au>
Cc: David Laight <david.laight.linux@gmail.com>, Devicetree-compiler@vger.kernel.org, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Konrad Dybcio <konradybcio@kernel.org>, Devicetree@vger.kernel.org, 
	Tudor Ambarus <tudor.ambarus@linaro.org>, Chen-Yu Tsai <wenst@chromium.org>, 
	Saravana Kannan <saravanak@kernel.org>, =?UTF-8?Q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>, 
	Simon Glass <sjg@chromium.org>, linux-kernel@vger.kernel.org, 
	Brian Norris <briannorris@chromium.org>, Peter Griffin <peter.griffin@linaro.org>, 
	Julius Werner <jwerner@chromium.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

David,

On Mon, Nov 23, 2026 at 4:27=E2=80=AFPM David Gibson
<david@gibson.dropbear.id.au> wrote:
>
> > > Fwiw, since this further optimization is essentially free in terms of
> > > code complexity, I'm certainly happy to apply it.  I am absolutely no=
t
> > > keen on further micro-optimization of this.
> >
> > OK, fair. Do you want me to drop the 1-line patch from my v5 draft
> > then? It's basically this:
> >
> > -               if (memcmp(p, s, slen) =3D=3D 0 && p[slen] =3D=3D '\0')
> > +               if (p[slen] =3D=3D '\0' && memcmp(p, s, slen) =3D=3D 0)
> >
> > While it is a micro-optimization, the code is no harder to read so it
> > feels like a nice free speedup. ...but fine to drop it, too. ;-)
>
> Sorry, I was a bit unclear.  Keep that change (though fold rather than
> a separate patch, I'd suggest). As you say it doesn't hurt readability
> at all.

I don't think I can "fold" because you (the correct "you" this time!)
already applied the patch I'd fold it into. I think it has to be a
separate patch at this point, doesn't it?

-Doug
