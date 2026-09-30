Received: from mail-pj2-f40.google.com (mail-pj2-f40.google.com [74.125.227.168])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AB61D511E9B
	for <devicetree@vger.kernel.org>; Wed, 30 Sep 2026 16:58:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.227.168
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790787500; cv=pass; b=R8w+Rci77EGzDcUg9ywgEuNoQTsoq0ALiqWTE6M5Q3IXaQY+/+PVHF9LLEAni06bBPqP0RDy6HY3ArzLYe+ImuElEdfMOnOayeeWODHfCHqYQZ0QH3dccN8/QSHvbGIm7973bM4UR9N6MP+2OSJLEauW1Z8Iftm+zZqaZTckHp8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790787500; c=relaxed/simple;
	bh=PFVmbYn7wXum97HiWvItCdk8J0+FslrKg4VqBVCXr+w=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=a2LDe6TXWEOucQk1JcbKS8gJi1XutlA993zLZHt2tnDMDrpQlTFX50b7g6fWtvJqhGRRLZw+Gf1AhK9fDcp9aUhmR8ZwHa1XTcW3JIe0FYhhrvxGjI/aKRj+69pCt0ZO3u72F9NnrmnzPzws6ZRymxcR5KMlJ/hjginDaWN/Ghc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=sartura.hr; spf=pass smtp.mailfrom=sartura.hr; dkim=pass (2048-bit key) header.d=sartura.hr header.i=@sartura.hr header.b=0iyYpFzN; arc=pass smtp.client-ip=74.125.227.168
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=sartura.hr
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sartura.hr
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sartura.hr header.i=@sartura.hr header.b="0iyYpFzN"
Received: by mail-pj2-f40.google.com with SMTP id d9443c01a7336-2dfaf76605dso17375035ad.0
        for <devicetree@vger.kernel.org>; Wed, 30 Sep 2026 09:58:18 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790787498; cv=none;
        d=google.com; s=arc-20260327;
        b=DpIY8RhaRXvyd7xU+TysgZN2LB2t5bDLOe6okyH0LRSBVBSfgygn1QMLzDML+YHRpD
         P1ZUleAL4AdxCYexzEzU4JxMxG2bYi0WGDI4efCmmTtrul7zSGYl/0Xw20X1n7RiL5eT
         WtNiLmqfm01b+bBEwJwDfCFRt00x2Lx+c7kjsMae/2wNNiiXxQH5o3BH+Mdq+zFEO9+9
         sm9xMg3gEX8dSCoIDbefaBmaBMYbWYOO7cwgeVWEqht0dOxqRXH2Iev8Gq+KDDvzT6KU
         0FtiBcRSZV08mrD6YcAgVCTFNzXF7JSmI4/Hw0EEO3Cfv7fTs01h5q+0GIHFzkxISQSg
         u4sg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=8tHU8kM38mvHPaqIAaeYccyBz2KlL0E8vxrWEOhOZSc=;
        fh=z8PL0h10isUqMB31BRJUDI9DJMr/MTnqRnXlECp4DnE=;
        b=R0PGDLWnOhUFXaBY4P475q+nnS77FnFHL41zcW3A9TtotvLXB+mpKpXoeNpsUzktl6
         WyZbC68sCuYJ1lHhtLy4p7UsHAAq6t4FjgrxHj2c4yuJACW79gjRoFQf2l/9WDSeh87B
         zriMoY0kUemkQni6DkZhYaijUI+9oGhWHyit0LfkBo/iGRh4q6kye5y+fkAloWRMRVz+
         Cq36m+VKOmooijUouX/oFXjeHPckOuMttEvPZ6GmtVVzn9AnMdb1jw/S8MSnZi+fvp0F
         33BwhTkSRWfGbIeIOr4/VaeTsc7e5k0izFxYSxnurAIWgfuNRcbWge/7OovnuaR25hrH
         a4BQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sartura.hr; s=sartura; t=1790787498; x=1791392298; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=8tHU8kM38mvHPaqIAaeYccyBz2KlL0E8vxrWEOhOZSc=;
        b=0iyYpFzNR/ZwfG4pxkOSw5wVbuqDlRBNsG7rLRw7FrCadsGu6EJr3i/tvUrfYMo2lF
         UeOPzbD0IwEVCV+wgJcj67Ybh+E3H0Z63BZU2hwPwLvG1YU1gea6NVd5AF8UbUrLRRla
         KNm9t/lO3UFBL4vNpSjCahfLGBiuQ6NOpPvPZkJ/s9wb5TzlVxXkOkpo56yPD5ihuYDL
         2af4aO+V43i0YN5FjL/NSfV57Du7eCjsGVvJ6KuoKefoft3y1/hzhqyxY3I3l6e1lYNk
         Hcxo50e7gpqXV+KOnpiTD/zurWT5zeF257S02oK/l0GEy27cfpSDaLlFkTDf1/taXa7Z
         nC1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790787498; x=1791392298;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=8tHU8kM38mvHPaqIAaeYccyBz2KlL0E8vxrWEOhOZSc=;
        b=hCeTAKKQjYvfRCbGWUhDCND/MFsIYM4zYh2PeXSN7coFMKRuibvDmmuC0B9ya4oRWj
         VsP2tEuRWtSXeIDsJ3CndIbm79hyeUkONCc92MoPAErEiF0xnxNJtNl2okWvnS5U0a1O
         2lQFcUfAGbRGVoKIzRK+rov4q/7YgKHgHY1jI0wTGpQ2WD1WsqBQeAJaaknYYjri5ffK
         wJHHCQseupfzqWlXBezvzV1NadL2bdKXl6oKFA7hiLA8kesetS1blBB1bqPp/5xw1kZu
         TbvFPi7o11tmQUuArMiN3aNa5iwyvUXuxefhzfrz+6Y4TCqNYSegIy+Wyq7G6efP5S4f
         3BpQ==
X-Forwarded-Encrypted: i=1; AKwUvBxuBiytuNE17mN2IMMDPPCBR09LlKB0Q/dhx2x5kZzT6beiqWBmWJB/mxMYThHQpIpBwgmYr7vczC4V@vger.kernel.org
X-Gm-Message-State: AFq9FYIqC3mIkvWBUeYe14rHIZ5w9yBAiN3s8vDH97NzFisjkWV7pHyW
	sKZ4sthorJnlbA+iwxm+rJ74Mp0z8HbU2aWK3+ZOY34n7fEFO7DRO5qpbh/eQWwZmp+GI5tQxFz
	uRdHi2hrjGvB2AHO4QxhY+Z1kQnm6H3iY34vS/iVXqg==
X-Gm-Gg: AYBFou0YKPOcKxrrnklDSq3zg0uqvh+aITDFGbXZvkUh75RSPn2PhrHsPsRyUZVX/zK
	94CxEf5bZCdQevLdGWkJZWCIhkpPh/DNH+cQEIJmNRtWy5gLvV/87+KzowIT1Gk+0g20yaCbmos
	4lRSNIGIrnZhoKAS/mjcwasU4CPXlosyQfPXDYcRkrhaeAQ9d3Hpn+JYUJ/nCb2A6JIiQI8+v/S
	NgRqpOJvg4bXc8268+2RmgFgtkOpPX8oHH2QnAathOY9lwIIxT+zZvi79TNr/ykVl1tbwWKYpX/
	ZhNfW9eVqy5DmG4C0oxF52x3sP/XRSglaH4THdyOuDCUF8f6jZDnmaUyLAMcj3UiUPCJu56qTtj
	0kr2lB1vVJL1kFtFIeVIZeq5QG5nlpW9mauQ=
X-Received: by 2002:a17:903:19f0:b0:2e1:24ec:df51 with SMTP id
 d9443c01a7336-2e2e4bf6e86mr18103575ad.53.1790787497948; Wed, 30 Sep 2026
 09:58:17 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260930122305.293686-1-robert.marko@sartura.hr>
 <20260930122305.293686-5-robert.marko@sartura.hr> <3fa11f0a-3b08-460f-9355-72011dcfa7b3@lunn.ch>
In-Reply-To: <3fa11f0a-3b08-460f-9355-72011dcfa7b3@lunn.ch>
From: Robert Marko <robert.marko@sartura.hr>
Date: Wed, 30 Sep 2026 18:58:06 +0200
X-Gm-Features: AclHuK-zCx-hRo4FQHcXpEa4B7tZt8c59IzcCUddj-jkCNJ_V1CZ_hahpuYPcAk
Message-ID: <CA+HBbNF6Z9uSBbktH8oOCRrHgaOujqEaLozge3zAw4ROUXi7OA@mail.gmail.com>
Subject: Re: [PATCH 5/5] net: phy: mxl-gpy: support MxL86211C lane mapping
To: Andrew Lunn <andrew@lunn.ch>
Cc: andrew+netdev@lunn.ch, davem@davemloft.net, edumazet@kernel.org, 
	kuba@kernel.org, pabeni@redhat.com, robh@kernel.org, krzk+dt@kernel.org, 
	conor+dt@kernel.org, hkallweit1@gmail.com, lxu@maxlinear.com, 
	michael@walle.cc, netdev@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, luka.perkov@sartura.hr
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Sep 30, 2026 at 5:35=E2=80=AFPM Andrew Lunn <andrew@lunn.ch> wrote:
>
> On Wed, Sep 30, 2026 at 02:22:17PM +0200, Robert Marko wrote:
> > Configure the MxL86211C physical TPI lane to ASP mapping when it is
> > described in DTS.
> >
> > MxL86211C supports per lane configuration.
>
> I assume you have a board which needs these features? Is the .dts file
> ready for posting?

Hi Andrew,
Yes, I have a board that requires it, as pairs are reversed intentionally.

DTS is not yet ready, as there will be another revision of the board
before it is commercially available.
But I wanted to get the ball rolling on the missing stuff in the MXL PHY dr=
iver.

Regards,
Robert

>
>       Andrew



--=20
Robert Marko
Staff Embedded Linux Engineer
Sartura d.d.
Lendavska ulica 16a
10000 Zagreb, Croatia
Email: robert.marko@sartura.hr
Web: www.sartura.hr
