Received: from mail-yx1-f46.google.com (mail-yx1-f46.google.com [74.125.224.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 376624EFFD5
	for <devicetree@vger.kernel.org>; Fri, 16 Oct 2026 16:04:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.224.46
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792166687; cv=pass; b=DofYu6QKq4X+q2EGuNtqTvkurfQVCCYJ2g7T0AM9Wb/m2b8C++XYcVhzA4NM2K1bKVMlVKPTZlzV1Ta6Dr28KQEkKMV6fWTITC/SEo+8V9BdKbWA/XsOvR9l9VNiskFrJ6Mv+iDq1/4mGCYjrz1VIu86dmmq+0137wx7GnXRv1Q=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792166687; c=relaxed/simple;
	bh=iXULWRiQelhnvcT3Ak66Mg2j8IEu0ZMQcqJtR6BRIrQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=orAYYvVlT1Vwtfc+dt5G89knXm9QU417rt6JLUQNNyUJaON1uG6ujlflsKwIwY0FpJ+tQ9FhCedaHjPpwSKWa6SFqi2OCKkeiYDE+6Fi4OEXQ6F1XxjHYFK/LKwi1w1Lcps8Jpy0drWLt8G/+OVdmLNLkF5rA3y6stlY/3qqjog=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=CuOJ798b; arc=pass smtp.client-ip=74.125.224.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="CuOJ798b"
Received: by mail-yx1-f46.google.com with SMTP id 956f58d0204a3-6798c43a3d6so159741d50.1
        for <devicetree@vger.kernel.org>; Fri, 16 Oct 2026 09:04:46 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1792166685; cv=none;
        d=google.com; s=arc-20260327;
        b=JynEmYE4syxLqM0Zt3zogZLSTIHTVS6Wc3rh+UByymuiF9cAU3KDutz40vz8qW5wFC
         A08FtEL9UmSdZT/CgFzI8Ex7c5WXVQTLyNesuiJYwYtGjSZOpWoc1Ytii3KaIhHM/hqY
         0cIMS3ESCGDYAuniDQhpV09ymPNB05oo2Uxyo9HaSzFe7CsLHvb51JfbBV7iB3mdoF6a
         wLx0g7gCv+MGOjydIYeuPU5P6yWIKCCshnf6/GKFPTcBZ0ghMvky1sCnc3Ww5axluj0T
         S6pa84mX2b0EndLDbodUvYsaSDVj4X0blSsbL/r/FFriSB57poXoSrkDeK00LbdQY6XH
         xwwQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=iXULWRiQelhnvcT3Ak66Mg2j8IEu0ZMQcqJtR6BRIrQ=;
        fh=a1ggpxdmCEErgRGf2Re9QTg3YLYX4BybCytgCbXYTOA=;
        b=Y5eK8m2wBrU30HThfpDGq2UpQhltjo8tB33R6nhJFSsH/gfTC0Pttb1jsICKyJhj5I
         XxjWY/VYHFoW0AgAW0if5mP3sU8ewt+YYrG95gtJ2fjosJMSRM1JymJ6MF4cDisivk8+
         3rtoZbxE3DQ2Rcvrvla5lWKeEKjmpYR7x2ai3xXYxB8BsRvKddiZAuwNfbIvhY0Qad9N
         C8eWHFz62HUcS3S0nIOoveaGYq7psDyZMMo6oINY+BPKSNEVqzsMJyxmuHXg0ggqcKl0
         eTZywp+VzTGlagJeEWALuf/1k2LHAMxrvciIrfKJ20am7i0iZ3hL/lMMTKN4kJdVJvf1
         qmeQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792166685; x=1792771485; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=iXULWRiQelhnvcT3Ak66Mg2j8IEu0ZMQcqJtR6BRIrQ=;
        b=CuOJ798bMYtCDpC5LWiwZJn7uw8bjiBagVxTyI6Y9WQHtVprqQYt1y47sCo21XrVNV
         UsOmF8vDTwr5vLG1QXN92cTa+5Im2jGEIYiRKKdOqgzUUOTnYt87XsGOn5018IMq+alk
         L7aJy/CQT1mulKcTs4zCTHTgB7D+ulX8GyNiMTZTTx8J0UwhjLxhSJpG1LHGNK5izf3Y
         c2jU0TWODuroFYqhSPgwpTpsaCq26tN2n6wpUb4c5k5Tj1qTFSAea6HSAfpp6N0Uh0Bf
         YY7iLlNhbSOArmXeqmWMYCYhiAV6fxBNdp+6tcTdfA02yg1vXQ4NCEjPo42auL7rK04m
         J4KQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792166685; x=1792771485;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=iXULWRiQelhnvcT3Ak66Mg2j8IEu0ZMQcqJtR6BRIrQ=;
        b=YTc827H9Xgniz1OXLw0WCtLhUICSiiA05xrpdlB5puts4JSM634c7knSDkQCCLPSa5
         sq3OHkOBw5kWD0UbjfkeNhv+5N4Os2oajhXhpTJEWsMVtMAzpBM7C43PNh1RPmgdz2df
         FnjthSxu7oBbcWqno+aDPCq3/ceRgIL0aRw3J/M+7DvGP5lVsav6jMyiP6IGx4jSsJA8
         TICTfJglzKNXXzvkiSeFW17SyXFKAPNpdU6UsLrhS5gPs6nwsIWYsN7Y4AMZZZjlAD8U
         ySvuJaisCnVGIX+CRgDNPcv9VUKUmSf9YH138ld9pMKlZKobZCK41d5pHYTZ/oRiJeDY
         /OgQ==
X-Forwarded-Encrypted: i=1; AKwUvBy3QdM0Kl1ve1D6rW5Ofg1pQ+kfwuEAj92xKsOrfqPl3OwdI7shJONEF4Bj42IJ6uG26WgLuoMaFySh@vger.kernel.org
X-Gm-Message-State: AFq9FYJwSAwPxHuVTf1i2pKcQnIiiI8wViPCOx+RC7iSVZIx1gD4owch
	FEwTIDeaiE0cZq2PhvuLQrZlQJlTb5M499xGw9/buRHy2h9M9oybEIRkg3PtJdDnYnYgmL3Zm4b
	YsjPXWwGDr47iYaFqqzc044uVWHFy4AA=
X-Gm-Gg: AYBFou1AQORjU90QYWCqG7UAk1otIg1K5YcdtCTjvzJKm15XSBwYDI4jvO5RTY0couZ
	0NcebHr//t5JSPX8HrPhlY2d0c+jtZM58y+HaABR6PEB2Y9wdqbxCBlT9/p17wAGZhzh8goiCVj
	FrLtSqQSW0x//f9CV3NE4cZ5hP2tIiut4ex7yE6wU0HMQkquOQ3ZBu3a9tDm/uI2dAVoFxYt2RB
	L2/CqOX/HxhsTg83MyeK+zS5rn56MHUzHeOdDrbqyo2fcDjIVsfurhLZj49hO2IqA4izEA8tLxY
	A3AUJIUZpj11Au9E7pypQyLZ9ylCArbG4TmH3SkY/rpcMr4emIAgWqE=
X-Received: by 2002:a05:690e:168d:b0:679:94b3:a257 with SMTP id
 956f58d0204a3-67994b3d526mr1957505d50.115.1792166684969; Fri, 16 Oct 2026
 09:04:44 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20261016090930.947830-1-wyibo6109@gmail.com> <57d28e27-459d-4d58-b6ea-78739936d152@ixit.cz>
In-Reply-To: <57d28e27-459d-4d58-b6ea-78739936d152@ixit.cz>
From: Yibo Wang <wyibo6109@gmail.com>
Date: Fri, 16 Oct 2026 11:04:34 -0500
X-Gm-Features: AclHuK8HVxQHZuZqBOsgDtltrMYxi2H1SXCcO2OimABd3Lxmh6ZoSPvRZjNaQho
Message-ID: <CALQ9cS49UzOPA8PUh8Yf55+D5oim=9YRF9iHw0Hi0sXuZFDTVw@mail.gmail.com>
Subject: Re: [PATCH 1/2] dt-bindings: media: i2c: dongwoon,dw9719: Document DW9714VA
To: David Heidelberg <david@ixit.cz>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>, linux-media@vger.kernel.org, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Daniel Scally <dan.scally@ideasonboard.com>, Sakari Ailus <sakari.ailus@linux.intel.com>, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Thanks, sorry for the trouble caused by my insufficient checking.
I did use an LLM to organize register tables for the binding and clean-room
HAL user space drivers work when I find my chip acts differently. I
focused too much on C files and neglected docs.I will treat documents
more seriously in future patches. Since this chip is common and someone
will inevitably do a better job, I won't send a v2. Please feel free to
drop this series. Sorry for the noise.
