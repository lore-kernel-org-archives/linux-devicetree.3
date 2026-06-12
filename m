Received: from mail-ej1-f52.google.com (mail-ej1-f52.google.com [209.85.218.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D9C60305684
	for <devicetree@vger.kernel.org>; Fri, 12 Jun 2026 08:47:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781254073; cv=none; b=jHtxkaE+ftF73zz0apbvB1tKrkI5fyOxMxNpgIyMdg8TL2/Qh5pDVbSRVxEF6w9ekNYoyQDAVn2tJMb5XcYEhN0ajfwuD540lwACgYa0j0gFs1NZ5/w2r4MiBJyUw4rcsKd/AvyAgtZ/WTiwGLiar1W2Fgo2eMwsV+QXkOhWLOE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781254073; c=relaxed/simple;
	bh=s+bZ0I/wGrEui+NR2iQR7uLXLTlXHTEguWphMfWXwoI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Miuqx4mfEPA6n9aVKCATM0fhgn/SIWwdMLH0I05+mxqZQDDGQaXDMP9jwlRbPHvKfceDkl7KF6ZRWG1CaHhtHfZaRYtENGbPwLbqxX8IMfvdLm+Ns1zUvxedEHz9WPUQaakSr2u1U6XPmBbgk3FgeR99iK/UNqJ6Y9qwZQzz0Wk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=imd-tec.com; spf=pass smtp.mailfrom=imd-tec.com; dkim=pass (2048-bit key) header.d=imd-tec.com header.i=@imd-tec.com header.b=NVIyMojn; arc=none smtp.client-ip=209.85.218.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=imd-tec.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=imd-tec.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=imd-tec.com header.i=@imd-tec.com header.b="NVIyMojn"
Received: by mail-ej1-f52.google.com with SMTP id a640c23a62f3a-befee9e5ef7so85850866b.0
        for <devicetree@vger.kernel.org>; Fri, 12 Jun 2026 01:47:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=imd-tec.com; s=google; t=1781254070; x=1781858870; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=ZpxlstclOZZ3np0442RuOwgnhT0MaMwJQSqfqAFVDnk=;
        b=NVIyMojnddBHUwETcPFoKEAzeDMIM4DOXO6JjqH4xE7sdoyqW1M69bLtRj9OhRmrqw
         j38SiVCcRl3rIxW137hmcK7V1UFck2UDW+OsmWJ7/1JiFWi0FyCz9PsVn+krNk0h/hS8
         Re+Ou7EBAHkVJMKnlbnPSg2drG99+B+pXQpbf5OMQqbkWt5W0axsmeqb1SgR8iytWnvX
         P7LUDAsB1SqYkqK3Fb1H/uqLfnHDF/NV7BXDSqknL5Pc3BVXbYxIH1TauQ1etZ/wP1Yd
         vv9xm11Cy6MC9xTouHZ+GbHuqOjCTijggwAv5gWi90+2DA1aXR9VCicF/fGo0RQ3vLTx
         a7kg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781254070; x=1781858870;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ZpxlstclOZZ3np0442RuOwgnhT0MaMwJQSqfqAFVDnk=;
        b=YqeEftm5OJ4whoD/2A/fGUayL/cqLlQOkfh1+0EzDNDVv1P145LSOPFnawxa4SowJ7
         FBWVGrodHOeU0g3vtS5ZUFShqB/vx/98KZhgSi6LIjc2WGCskh5sEP0Pg3KBYM6H4VHs
         I2x6scNZ/f5L5KbrDOoUKZelqUha9nMQrNHwqe9Fjnj5Sja+Usa6TZOeAMaS/yvyOMcz
         5tYKNCLoKpTnKl35XfT7BYWNRls190mQ8rIyvUSKpvuDQYQ4cPFdatYrrVlLRIHIc30/
         pQLYd0rE8OuIhRCmiNw2IN+VphrupaTdNKUTObViydbtL49Yxlk/v6d5HjRiQhbxL1yb
         oW6w==
X-Forwarded-Encrypted: i=1; AFNElJ+A+iKEI7lVU4/MwfSdSvhrnPFMj87S+LB7VlnEzH/9ZzBu3tIiJh8Pivx4fcEwPj8c/cws/zMhlmOG@vger.kernel.org
X-Gm-Message-State: AOJu0YxWIwRZ+tzPMQovMWzNI4cusKNxQ3EpP1BxqTa8jKgcgDvxUL1l
	UNr+FoNL7coUJL3gjYSs4I6m86tAv3hYW3TzOwU7eDQNHlBvGW3OrsUOt/wvZTBVm2w=
X-Gm-Gg: Acq92OH0s0xFL7+ig/+8cjjhU6f7VDpodxssTU+6/jVkinXJp3scmRhuGY+q2KDc/es
	iIK5fzVRue1FlNekOlDdg4fn1DMi6MMVUl9CrcSjt4jgzHCRAWiaL1sfGkkGMPJu1JxuaB7TZIf
	3aXeml4WHsHxGycjrsXcy3FWD9WqAuxaQuiQ0gjjwZDYldXpjN+F6IsTYTNh6JPBSvM0g76692z
	4S337RoZj5+RZM/urKO/GaUwymt7jiX4kg07+jsxiMZW8pGCeut+0KE+Pje6kICVfp0uCF51PIv
	2YQdn52pYvwQWXAvpvI1SJTZz+XYoBgfiX/jQQE4z3l/07NWprl03KPLain5Syvp4pOzcvsDAbR
	QGjGN6VfH2Y9qvZI3xRv0UiS7a3b+P5Jx+io+qVyO4zfZrYktHuRwX68CpQZxTKPkStTKnwJ8lm
	bNoit/kHE7F8Gfl5NMwoHJqsST9zKo2V96TRWerBK/nCEF4RUUXK53n17macdpRGFMvvPM5jmn+
	e7IWIfRnVPW0peLkTSQ/4wrAGbdXwomlKi5CV0SArs=
X-Received: by 2002:a17:907:7285:b0:bee:aed6:9d50 with SMTP id a640c23a62f3a-bfe2bfa08a5mr76930866b.48.1781254070073;
        Fri, 12 Jun 2026 01:47:50 -0700 (PDT)
Received: from will-Legion-Slim-5-16APH8 ([2a00:23c6:2736:8e01:1873:ad4d:171f:1cab])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-bfdb83420e9sm76567166b.45.2026.06.12.01.47.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 12 Jun 2026 01:47:49 -0700 (PDT)
Date: Fri, 12 Jun 2026 09:47:47 +0100
From: William Bright <william.bright@imd-tec.com>
To: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
Cc: Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	Ram Boukobza <ram@imd-tec.com>,
	Tendai Makumire <tendai.makumire@imd-tec.com>
Subject: Re: [PATCH v2] arm64: dts: qcom: sm8550: add SDHC4 controller node
Message-ID: <aivHs6p28uN3d6TI@will-Legion-Slim-5-16APH8>
References: <20260427-sm8550-sdhc4-support-v2-1-a4241f43ecd5@imd-tec.com>
 <e0731edc-81da-429a-a12e-a1d1b75f9544@linaro.org>
 <aig9licCxhtZbHMq@will-Legion-Slim-5-16APH8>
 <5a5cbf8f-07ef-419a-8d30-c1b0b2786312@linaro.org>
 <aik1ZYUT-cnpfdQn@will-Legion-Slim-5-16APH8>
 <00643a25-040a-4bec-8324-f52b30d84f9f@linaro.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <00643a25-040a-4bec-8324-f52b30d84f9f@linaro.org>

On Thu, Jun 11, 2026 at 10:48:34AM +0300, Vladimir Zapolskiy wrote:
> Looks like the SDHC driver behaves expectedly then. For me it's hard to say
> what may be the rootcause, I believe the lower bus frequency should be fine,
> so it sounds like a hardware issue, but could it be PCB/board specific one?
> 
> If you find a chance to copy the SDHC driver (and its small dependencies)
> from Android and test it on your board, and if it also fails, then it might
> be well concluded that something is wrong with hardware, still it won't be
> quite convincing that the SoC SDHC is to blame here.
> 
> Hope it helps.
> 
> -- 
> Best wishes,
> Vladimir
My colleague Tendai (<tendai.makumire@imd-tec.com>) had the same issue
with dll-tuning failing in SDR50 when working on the downstream 5.15 msm
kernel [1].
It does sound like a potential SI issue so I will try the following:
  - Sweeping the drive-strength values for the sdhc_4 lines to see if I
    can find a set of values that work
  - Scoping the lines to check SI when performing dll-tuning, our board
    is very dense so this is challenging.
I am guessing this patch is only acceptable to be upstreamed once we get
to the bottom of why dll-tuning is failing?

[1] https://github.com/imd-tec/meta-imdt-qcom/tree/kirkstone/patches/msm-kernel/files

Many thanks,
Will
