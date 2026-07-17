Received: from mail-ed1-f41.google.com (mail-ed1-f41.google.com [209.85.208.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 52DC629B8E1
	for <devicetree@vger.kernel.org>; Fri, 17 Jul 2026 02:34:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.41
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784255648; cv=pass; b=Dp6z6lGb5W0nTd8MyHwz1Y72yz8pOzWUXnf8F38R7RaaAz0LOMwFHHLKf3IpoSd0sTcsoPu5jGc6OGg2sF2L8J/0WJ3PGg9umyS0MTdpiVhNJZzHerb3FrNZQdBXfN+4Oow2q9lZDRcTPTULuymQFQtCOEJeCDGECmdT8ssp5VA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784255648; c=relaxed/simple;
	bh=T6g2xySL7H1XuZiwkBcKKMi++o4FkK8ylut5CU8QWHY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=GgRSBjODyqUIc8fMFdpoE8Snm83f5yol096NpnnJgep0S4uXICZw559Ivtb6qUkVhO3xtCQqhV3e+ZRXVkhCoNRE+4fkyWY8KXtKRllRynq4XuSQSo/4H2eLGK7mXp24fLeYQgf3DxsizWxVtVv0BfD/ZCgiI4QS9M9MH3t/cQk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=h9ZlUyFH; arc=pass smtp.client-ip=209.85.208.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="h9ZlUyFH"
Received: by mail-ed1-f41.google.com with SMTP id 4fb4d7f45d1cf-698bf7a1a2dso10353159a12.0
        for <devicetree@vger.kernel.org>; Thu, 16 Jul 2026 19:34:07 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1784255645; cv=none;
        d=google.com; s=arc-20260327;
        b=GbnEZHoxDLFUvAKIAges8ci6xwEOkCO80GjwAEph7VOZYYoBtHsF3IbVBE+Xc+fRDh
         Vt0jsjnrh6YPl/bgaGqRoPl+f9Cax80EVf/eKqQ8ji6zKufulX0I3kmVD7dYwx2dqx1X
         mSutyh6I+QsktVwd0JqbBFr6ccVqvdCqKM5FNEPwI6GWUoMi/1DjriA2BkmDZhpdkwZI
         DkuhSoeGTw77Yo6Nc7H5pLpAoZLMsm8feQNBymT5GJvVLK/X5wXKDYr6yPrWyAqSSs0E
         ClE30o/4bdEOEr7RHarBhS2WhJwe5CE2kayfjzklBelJmn/j4VEHnrMCreHZOKL3JsA5
         W8hg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=5f+tnduvJaWaCpIFHTrPdllP/FcnjSU7I5JwS6HOruA=;
        fh=etJ/wYND3qElURzGXjAYXcOmD/cGo3s+tn5eof0kXTY=;
        b=mbkVUq0/w1scxn7BhCvpEM8peqSwWpo2H4wGRAkCSHhhEa1wFOY8wnt52ra5zQIuts
         d8nqQosa9q4ZZoYPIywOGSjfEZFpTXDTgXaElz7bt17VADDAfaqBnytorHmcgrepFw4W
         A1VNRHTjrmjELTtHt+JgL6grcJsSljhxR/KGddWs8wYERKe0vAmRyTfyWgS4dQAHdeVH
         TOCXrHIrjYmuMhtrPQIf29addLbVuXzn/4HPVsPoFEmAOelNxuH4EjHaMBP5SJvv96zP
         j0GVvUhaH4qG2/30dXrwfUQjqcj527Kk6b+ESbOBuyDcN6T/cDWnMZ6NCyBgOaMPs80O
         eG7w==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784255645; x=1784860445; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=5f+tnduvJaWaCpIFHTrPdllP/FcnjSU7I5JwS6HOruA=;
        b=h9ZlUyFHXGBS+PuN/QsEQY+2MgY9wTHbzucQyKss6aJ3maEYWCwjjQGQ6otGb44D4p
         ZFqGCVLB3FoNd7fESa4GikNF0w6AGOG4COqoBhRKpxiGvlDnk57wXwX9qcqe3U5vt+jz
         c1KhtQYdjPEhEKfU8FS4CZvgGs10r5psQKoPJaQtB/166oMK/rMbudJaPiSoaUzKVEuX
         M1jOwot/DFYkkxdB56ANufJn8Ls6FSO4d1/r2d21NiaelXJdNgIuMuuW73D832PwTDCL
         +/AyP8LVu4Nry5eEM7M8XcM0mfVr3PB+fE8Dt+a7GyqA7AxAE7IJGpiQdHfHZvJVokIO
         Ro6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784255645; x=1784860445;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=5f+tnduvJaWaCpIFHTrPdllP/FcnjSU7I5JwS6HOruA=;
        b=WlPWACF2S3zVo9PzXp4DcQ/NeDbb+YLuU4Nr9wsQm79faIrhGWxGhR+uLZTtLtyAkT
         JQu/pMSxul7W06fJCplBbd2Ze3M2Qrt5t6xAdOhCoATuaksZrT52IV2lZdp4b186dcjD
         KKlEXT7qk0NjORYwpkRVoWuppU/3Fyr4zcSnK5WkFdk6jkQEgFYe9OWy7fDdn/OVEM78
         GMSH7RaJjPNXAGIhenDazwDOzkUcH0vPl7RUv+EAaqkGSVGW9KO5iuQ1rFX0nUFuQwX2
         zfbJV70/lTy7MYYelVek9VCUd53iXNV7qAE9vv4ui1a3OSlhQXh9hwlYtBSpHU+VbR75
         7tIw==
X-Forwarded-Encrypted: i=1; AHgh+RpVEMPwhR3DqSmkF37a7ls5TklEDCKBk95oJJAdKEsABWWwmND7cUHitywAScZ/MBX07wP3CA8NUzcR@vger.kernel.org
X-Gm-Message-State: AOJu0Yx5PPazLr+lNswextQ7XJnqJ1JeYwWb5lmiW0eJdBy/ILcoLa1x
	j1hGozGBXN9d9hewY4fDuOqTna9QqCIv+JfVsveMBfWm0WESHFcGZWCzTQxpIjzmxNKdJ9Pa4N6
	Gu48tCtiEBzc6KY4RKGUOT3CzmVL2VVo=
X-Gm-Gg: AfdE7ckd3SnJJekCLBF+cjtlYid4jza+rbfRPvx0xFJBDu4tkOo0U9+WC9vh31xUoYn
	XxdjQBjGytP/3WJv6oVtyXHGxcly14AzJXMoM7Xd7GdeGCt9iIRFyYvhWEEtUU0Y02xAwpFaUJ9
	pl+dLOvFzaWWS5s9McP6YLLIz/vPxFsCtRuhNklp82EHhv3HnyStJg8mRy3WJxI2Hx4P0D9JIci
	7qC3LxWtz48qYjZi9zGAyPvJOnyB0h0F0DabKkmnuUCJlqzc39F9vr3qPRpiCYXSRLrFgcX7D6W
	4E1Aj5/sOSlOV7OMKA==
X-Received: by 2002:a17:907:9283:b0:c16:2a:3c7 with SMTP id
 a640c23a62f3a-c16b46b6a05mr18468866b.11.1784255645278; Thu, 16 Jul 2026
 19:34:05 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260716-adt7470_thermalzone-v1-0-cc55ef35edde@gmail.com> <20260716-adt7470_thermalzone-v1-1-cc55ef35edde@gmail.com>
In-Reply-To: <20260716-adt7470_thermalzone-v1-1-cc55ef35edde@gmail.com>
From: Luiz Angelo Daros de Luca <luizluca@gmail.com>
Date: Thu, 16 Jul 2026 23:33:53 -0300
X-Gm-Features: AUfX_mynEXLOUd5w6q2sgv80ierrWkqiVgimRXkDfEJEHNvkVSEiZxmqVdqqbko
Message-ID: <CAJq09z4C2R5syGVtBtA2p6ER1XWRUwaVfEeL2LPvupR6xBe4cQ@mail.gmail.com>
Subject: Re: [PATCH 1/4] dt-bindings: hwmon: add binding for adi,adt7470
To: Guenter Roeck <linux@roeck-us.net>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, de Luca <luizluca@gmail.com>
Cc: linux-hwmon@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

> +  "#cooling-cells":
> +    const: 2
> +    description: |
> +      Cooling device exposing the 4 PWM channels.

Since "thermal/of: Support cooling device ID in cooling-spec", I could
be 2 or 3. I don't know if I should use enum [2, 3] or just go
directly to the new const: 3.
My test device has only the 0 channel in use and 2 is fine for now.

Sashiko also asked to require #pwm-cells, but it would mean to
implement a parser for that too. I don't know if it is worth it but I
can do it if needed.
Regards,

Luiz
