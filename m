Received: from mail-pj1-f51.google.com (mail-pj1-f51.google.com [209.85.216.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D7C953D524D
	for <devicetree@vger.kernel.org>; Wed, 25 Mar 2026 15:10:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774451455; cv=none; b=RXHuD1KgXUKwkBE4ukog277rRPXNuw54Oxjqjr5jPWWMs3pOzNVkrHxbs7uLfutEbCFLiTiAjZdNxnL0qHwRkBV/lmzIoXq9IM09IQ39IwvbWc7aJjy2TfJOThlo2mrgzFy8hqumos+dCY+THYNoOV+WsS45Y5ST2f6wlUFVRHo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774451455; c=relaxed/simple;
	bh=BZGGufgX0i80QOP5QxdXC8NEtX7e9nkLE2X0Sj3u1YU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=o2l2n01MXgRtZOBI31AcKGg8NCehUgwgnm0sNUgvkm1Rr8iPlLA1Nv6psROp6XjZhtLwXl/WaTfXDbfeWsX1186BOv2S0yFelNtgSr2GKuIX0IxLiiLl3+dUR30i1AdPfgXqFN5kobJtAJYueXOZ/Hql/hVf6kjY90lsv1aTwTw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=f+/Bb4Zi; arc=none smtp.client-ip=209.85.216.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="f+/Bb4Zi"
Received: by mail-pj1-f51.google.com with SMTP id 98e67ed59e1d1-35a288a2c00so1174432a91.2
        for <devicetree@vger.kernel.org>; Wed, 25 Mar 2026 08:10:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774451453; x=1775056253; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=u8WzrX2hzPXJ1j9AbxoRyE/tbN7PT5lnxfJP5D79TMk=;
        b=f+/Bb4ZiFnmUzjUKkFs8NSaixluI8FxGqe8GEsvRanwXgQCsI3csc9T7jaSWLdyEAb
         gni7LAdF+7020jv8XTRT8JKA/r3ZWzdc4AWJUEOU3QOk+5OI9lzvdXvDqq1ix3EhM9SL
         hvSXUDaKYaSt00cMu/IHohnf1P0mijwtlOHtj3rM5YHHceKbMl1YQxwbayXRT5gthvcR
         yxtYwW9+VUojspJcYV8hHb5W8D2o0i1U6E0bybSRy8CgTvDw1XERKmY4p007Xc1I/E9b
         o8LbtK5YxwoqQ5telb3Yhne1oqfZiYk+BS8Ix+rtTgVeH55A0NDKECRTMnlMKhpBFp8L
         alqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774451453; x=1775056253;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=u8WzrX2hzPXJ1j9AbxoRyE/tbN7PT5lnxfJP5D79TMk=;
        b=U34i/JtxJntvc2updTcxZrelhrgwee/la9SjE7DEWtyz6VTJxI3vtj/z+2/ZcQ6VaR
         1H7hPPJ/owzsOYXGt/rrsBDjxQYmVp3DTBNU+RuhOyV8/wfaomU1IUUvk5kUj0HB+hnR
         LOrHNpBKoXeaLqJkUMnGNurDhTm8YQ8+FhQWWnIXPQlNJznN1476eiyTLo/8kJTTosjA
         N7o42TkGYzhWO4NQaS55ktI2ycmmVeHL4efhFl9zXiQc79FdAm2DrE/O7JrOEqos9bzH
         l0Rd/fsPVZbt9iu8ExNOFHeDUs2aUF8PQWougYnVhYTqHun0LXqQvb1rz4TPSooFS27Y
         +OOg==
X-Forwarded-Encrypted: i=1; AJvYcCW+LqCJcx4IBZKrygbqlzMaYLVsw9PD/1BouhiKOTtzxTL4CfOynoeyLKdv+5CU4P76tzgE3LrfmSTT@vger.kernel.org
X-Gm-Message-State: AOJu0Yzqh7dDaqyBAWCeOfTXjx/qKi1Ud4OTBooG3uavlgKiH5i8EZja
	doNm3oby6k4ALqgc6thlZUxqLOKc+V5yFaX1KJqgGl1JA8ekoAIzOdCG
X-Gm-Gg: ATEYQzw3xn2A+gg6LNeHxZS1zGELN/QB7TkGJ3FVjXLz/W10fJEWq+WZtfJAa1ErOKV
	3a+DTKS7e7a06jg29EkI9uELuR2daU8nv4Vdt+/hdVXwTTPeYOxMEcbOXMaNTC/NHQ64tmTks0H
	Y/i2JXjjtlyYtyA1B9utLCJORPtxlcssBWS4HGBAL7cL7FiNqj42Aaibthk1ufkubF5N/975oqD
	RpaaM63U8Bg/71xDhhCeNrUFt8U3vF1rP6FPK9ue5k3FT/FEtxb5xbWePQYFfJvUHSAjT4vCNWZ
	T5M5KQ/N+eRw9OUV5AatXym3yXhAMsSln5wjteB5z+mGskHaSBjdVnzTsxm8c7FGDPYLIJcuDsY
	l07I5DYpokpDGXOspd0AXJgQ6bkk/xBgCXgok2DGFjS+gBDJyRWbLcQlPe1bEB7G8LrZshGDKAE
	v2aZ3vQ/YkeWOwaIOHiZP2iWQ=
X-Received: by 2002:a17:90b:570c:b0:35b:9896:cbd0 with SMTP id 98e67ed59e1d1-35c0ddc7c64mr3761784a91.25.1774451453060;
        Wed, 25 Mar 2026 08:10:53 -0700 (PDT)
Received: from fedora ([2401:4900:1f32:22d3:4161:93a:b87c:36eb])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-35c1a022db8sm181861a91.3.2026.03.25.08.10.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Mar 2026 08:10:52 -0700 (PDT)
Date: Wed, 25 Mar 2026 20:40:45 +0530
From: ShiHao <i.shihao.999@gmail.com>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: andi.shyti@kernel.org, krzk+dt@kernel.org, robh@kernel.org,
	conor+dt@kernel.org, linux-i2c@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] dt-bindings: i2c: intel,ixp4xx-i2c: Convert to Dt schema
Message-ID: <acP69aM-euL7wl87@fedora>
References: <20260324135010.17730-1-i.shihao.999@gmail.com>
 <20260325-bulky-mushroom-of-science-8c95c4@quoll>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260325-bulky-mushroom-of-science-8c95c4@quoll>

On Wed, Mar 25, 2026 at 12:16:27PM +0100, Krzysztof Kozlowski wrote:

> Please run scripts/checkpatch.pl on the patches and fix reported
> warnings. After that, run also 'scripts/checkpatch.pl --strict' on the
> patches and (probably) fix more warnings. Some warnings can be ignored,
> especially from --strict run, but the code here looks like it needs a
> fix. Feel free to get in touch if the warning is not clear.
> 

Hello Krzysztof, 

      Once again thank you for your time. Those warnings are from running
      checkpatch.pl without the --strict option i myself discovered when you
      said that because i only use it with --strict option. I thought
      checkpatch.pl --strict  was more strict then checkpatch.pl but i guess
      it is not so strict as i thought it was. But apart from this i mean
      why in the first place there is the --strict option when it is actually
      not so strict it must have shown all errors, checks and warnings but it
      does not Anyway i will make sure to run both from now on thanks for pointing
      it.

> > +properties:
> > +  compatible:
> > +    enum:
> > +      - intel,ixp4xx-i2c
> > +      - intel,iop3xx-i2c
> 
> Alphabetical order. Dunno why you reversed it from original binding.
> 
> 
> > +
> > +  reg:
> > +    maxItems: 1
> > +
> > +  interrupts:
> > +    maxItems: 1
> 
> This wasn't in the original binding.
> 
> What does my guideline/expectations for GSoC say? Did you read it?
> 
> 

 I will make sure to fix these issues in the next version. Also
 i did not read any guidelines so, please provide some resources
 to the GSoC guidlines you mentioned. I texted on IRC but Daniel
 said email is where i should ask for it. Thanks for your time.

Kind regards
Shihao
