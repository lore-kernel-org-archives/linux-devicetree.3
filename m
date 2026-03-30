Received: from mail-pl1-f170.google.com (mail-pl1-f170.google.com [209.85.214.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D89693A16BF
	for <devicetree@vger.kernel.org>; Mon, 30 Mar 2026 08:13:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774858405; cv=none; b=cSn+WsrRvB8IyoAfgd94zWzRSv31V7ERT+QqiNTPy7fCtr67gQSngiJgOSvDnKdIb/5QYSFiwFC2rX0QI/RaWg4uWXsmyHIkjc/Kvdgq5EUmypHc5wjmWooxhA/QjzHVzVJuIyFTFt3w4tQmjb+WtGY34GVD47z8HV1i/6yS6us=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774858405; c=relaxed/simple;
	bh=I12ZMybdCEL1+sBz0zjm69FWWXF7EDYCmjxzXtAD94k=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=eo5t+8jhGFKJRj+wNhpdpBGxS7R1J/y+lpoe+ySF2oZ4diCFG9BiwoU6egi9cPiDG/9KO01HmLODBXMi5k5L6iuye22q8T+G3zDZaFHQAIkfvjeKhysh1eF/Q/7Iwcb5X4EJHhRKZWQfr4etUXBUSi01qIuQYQ2y/QP2gmXljjU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=tL+M+z57; arc=none smtp.client-ip=209.85.214.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="tL+M+z57"
Received: by mail-pl1-f170.google.com with SMTP id d9443c01a7336-2adbfab4501so20229715ad.2
        for <devicetree@vger.kernel.org>; Mon, 30 Mar 2026 01:13:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774858403; x=1775463203; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=b+Rk6xeRr6lRsoXLZ3DwiTNhcEH4M7IXDtOiENwg6TE=;
        b=tL+M+z575d1R0sBj1mM6TRmQHBLzYYguaGby+0QYTCjNJEINCNuE9QU9RwPPahNmBa
         qWwajrUOjOhAcNCr69w0jfJmYML7NDH2ZSDwPYz35l80MWsH+TuQKiwhEa6nfHV45gCv
         CHst1Z1tps9KjjIWX54tW2lJLkmv/V8DQjHRjADKwpIhTjUxux9o/IKQiW8ZunkuFDp4
         4EALq2GGI6MtCcmODEbHhJM4umVs45yVDcsmg92T9+ictOv/3TYRIReIR4X/8MJLuBw9
         s4SoDG1EYAw7eJbz3BeGGn8U+dIXy3Djv9toMjO4PPJfMiD7gverjM1soGzl457OgfoS
         J9+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774858403; x=1775463203;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=b+Rk6xeRr6lRsoXLZ3DwiTNhcEH4M7IXDtOiENwg6TE=;
        b=tIEixgMDJfKrEtLAKbsnI2OInO37jOKQ2K+57vrPUc2mJP4FKgwbxoYtO/6awjW5l6
         3YjFFWnvnHr3t0mAVNZh7lbQFmASsf7GjWyhh6dbOIAnAG1JWs5N6MgeGQoeCKDrnC7F
         3Cb11RHkfIAHWMIgxvBdNAjReBMCQ6BFW0T2gzFSD5+9SzWx5pIqtQlgG54t0+Cf05b0
         QEhKjDOcwnCqOnTyC19Dx3sPJGSX2w8RCzHs6e0abXCOiXPSnl/3T1wyQZ3MNZ1QbRoi
         0kVLym9tF8kAkVsWanCicNskATp2oxkk8T4I3dUAo/2xsjLnp/TKVyiD7Y9/ejXIH/Mi
         dndw==
X-Forwarded-Encrypted: i=1; AJvYcCUt/UQaeyAKxchBNsnVeulHLQAGH28knrL6Eul9eOCv5KNQQlesTw9WepAXevtoxeJwzq/6dtttSyMN@vger.kernel.org
X-Gm-Message-State: AOJu0YyZQvDaO5r2lFYIqeRxdK+fSbSOhR7D1cXqGCIxNhltTd4G/BMe
	2r4enSeXyalqAEXqJF2mOepmemiotvFud9cQCPVwe8XhOR5EvZ4ID05G
X-Gm-Gg: ATEYQzwS9EJVZMGdH0F5PToBcDmqJ6AvzQMak5kaIDaB34Db7IRnJetn1xf+xws6L62
	vNlwGX/Lj/8bnDUkfXRyy85lDdKQN+fC+wFPBWSCkljNPznzqucb6j29nsWB6uPqALnj6M5bmrt
	Q26HAC3Sobi6GGvN2G43Qj/H3c1ebxMvpg53bzUH7134UJbV2kLdHgI0cVfF2pXVzzSinZn0yoH
	CnLXeUOdx6WlkD7u4NKFMUd2h6pGcoL+FwN+pRfTU4ZV3qPTTL3qf7229y9F2nS2yabuD8rAYAk
	yYmKsy02TBGtYhgTFk7jDVcfWuLVPfyeTZc7es74aaFUKbyUUetfnYDD7adrlRZUq3O7ESdmwxY
	DUEPVUm3E6oKPw8Xrr+twc8soqNQ835ln3i4GJpk2pOa5hZKoJypY4+HI/FtUkuEWi2TXfXiwde
	4p5XVom+hum1TIKKfOBxg=
X-Received: by 2002:a17:902:f611:b0:2b0:5ae9:ee4 with SMTP id d9443c01a7336-2b0cdbf72c3mr120475445ad.5.1774858403197;
        Mon, 30 Mar 2026 01:13:23 -0700 (PDT)
Received: from fedora ([122.173.26.34])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c76917bb31asm5745435a12.23.2026.03.30.01.13.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 30 Mar 2026 01:13:22 -0700 (PDT)
Date: Mon, 30 Mar 2026 13:42:44 +0530
From: ShiHao <i.shihao.999@gmail.com>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: robh@kernel.org, andi.shyti@kernel.org, conor+dt@kernel.org,
	linux-i2c@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, daniel.baluta@nxp.com
Subject: Re: [PATCH] dt-bindings: i2c: cnxt,cx92755-i2c: Convert to DT schema
Message-ID: <acowfAeFD1dK0Ei0@fedora>
References: <20260323174236.147507-1-i.shihao.999@gmail.com>
 <be702ca9-e3c5-4b45-8592-966bb5b31080@kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <be702ca9-e3c5-4b45-8592-966bb5b31080@kernel.org>

On Wed, Mar 25, 2026 at 12:20:41PM +0100, Krzysztof Kozlowski wrote:
> On 23/03/2026 18:42, Shi Hao wrote:
> > Convert the Conexant Digicolor I2C bindings to DT schema.
> > 
> > 
> > Note:
> > This patch is part of the GSoC2026 application process for device tree
> > bindings conversions https://github.com/LinuxFoundationGSoC/ProjectIde
> > as/wiki/GSoC-2026-Device-Tree-Bindings
> 
> Stop here, please.
> 
> You are not following the process and required steps, thus you keep
> sending new patches with the same mistakes.
> 
> Best regards,
> Krzysztof

Hello Krzysztof,

      First sorry for the inconvenience that i am causing. Just wanted to
      ask that what went wrong with this patch. I have just send two patches
      as you requested however i am not sure about this one that what i need to
      fix here. I would really appreciate if you could tell me what i need
      to change also please spare some time to review the patches i just sent
      and give your guidence because i might have messed up again. thank you
      for your time. Thanks a lot

Respectfully
Shihao
