Received: from mail-ej1-f44.google.com (mail-ej1-f44.google.com [209.85.218.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E15A53FD126
	for <devicetree@vger.kernel.org>; Wed, 10 Jun 2026 21:12:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.218.44
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781125944; cv=pass; b=vCcVPgVzunplONlAdIPJnX+F9MDxkzIBXZcKVr34mbBHDqv2bsQSMrkczKKJAnl5ozQ/AnawCOXMo/tLQAdzgpQtXDCtq4dyH6P3QG1kkFM790GoPn8XiKCbIlOGd7kzePCeQNolJUsWT+0/MslhHGGlO27er0xrzA4Ox5OfAfQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781125944; c=relaxed/simple;
	bh=7GakpWUTN+DvvDPX+8K92QKUEmgH/oZfFMnDt02q+8s=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=d1Geqxr3v7TtZwd3qlb9ihZMjsjiqzCjTzDgfS1IbMtUk8GslDom/TC1UENpHtuKBrJDYLCu1haCGrlN9GSV3NmS8Lp3Oy0rPYRj8OKDpijkAF/Hj2aBmd3B/qgyJWmppvTGPa3ms4RC3OuJ8C8lwKhxpjOf1U1wOwQiKo6j0ng=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=AxZoUS0T; arc=pass smtp.client-ip=209.85.218.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="AxZoUS0T"
Received: by mail-ej1-f44.google.com with SMTP id a640c23a62f3a-bec44dcddedso90367266b.3
        for <devicetree@vger.kernel.org>; Wed, 10 Jun 2026 14:12:22 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1781125941; cv=none;
        d=google.com; s=arc-20240605;
        b=Xj9rx8ZmPv7BvKjuWNCJ0tYXNqSQzWy2RsIqBMedFdHYzOQjn+NZtObtniLIxPYGWN
         Wy0DxXEpKe0o6PqUTi5PLgqSvhoVlAatsD7uDF6CVV6FP6ZhnGYg6JWRjRcJ62ZKWImJ
         xfbvbvVBAcGFSuHpNf6BOuaoeKqWPm40ilTm9AAsqvG7bNY5ag/h94Ev0mduCdZkY8Ys
         zCjo63Gf/UqRwOm4cT6DNfI3jNs11pvEhjcjZVVoWvDk4RZr/hF5NHS/+PJf5TA4coy/
         v1TrtxdUE0Dc8oo4T7bvx2NomtwwmNW4SrzFGa0A0TjtU8UBHZwCQAYiOqBpWrXDM1tu
         owXA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=7NSQVbV6qKdOpMrqmgIPaXzJ8axK82K25SvobF+jZDw=;
        fh=zZgS0AI10ZnZBXmZBEzPLZLKVPkM2edDxaj1mUM0xS0=;
        b=F6aEulUe7qlhIVu64mhTh5UXiPI5xUzXiJbCbUrjQ3pdeLTDpG7DAn/6dvz3M0G+jh
         rBGHOMeSjnwy2EunceYC9M9G/EAjVjoA/8tLVK4KGUU6aIvY8CZ4JJvgqkt3ejK7YjDG
         pEjN+6E4wiupUjlYMt2Cm+hPSd9mx0pxSN93tC3neFLf/98QwFstnbyxjBTRGe0GpQqf
         qeZQhgJL+FRbP/Jd8wbF7ej7WYeG9/1hIa2nLak+4vSTfFuGDC7rlWwIuxqmJnGcqPAj
         /oJkwnl72uCOBSXbAEPfYG/5yzBkqOFncaA2MZDsp4jhh/B5O/4CHhInuvRXFlXTGMqT
         P/vg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781125941; x=1781730741; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7NSQVbV6qKdOpMrqmgIPaXzJ8axK82K25SvobF+jZDw=;
        b=AxZoUS0TBGu3L3KucpFZpdsv2+pCvRmHS+sUqkj1voq+3r9i/VvVbpWJ6qHhDbfhii
         5TByRqyB/pWDKsf5cnuoCxtyg2Y4nrcSPMkQ2L+WUJCNITaZez8xsl4z0hR7iDa0AEge
         1L/OvZnlVKNt6sjzTJYpgPhGUdsYfHQIzoygDm/9/vyA6Ubp+5r3ImunUhmmfbhWfELb
         CgJxrR4AHL5nfVrVxmiqlJt7d/7TY2f2Lg+RiMBrbKwmPFVbtKAbk+yNTjjWKtTyaFJy
         Xw7ey7cDjAR1vrpDe+5GqgnZI7UwUWTVIP8CPOBbK/iAMiz/GYmZ5DxtVlExKYkSbsco
         Bbng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781125941; x=1781730741;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=7NSQVbV6qKdOpMrqmgIPaXzJ8axK82K25SvobF+jZDw=;
        b=XqqgTiPMuTtdboFQ4x/hItrwTwpA3hX+FfMeIdpEKMlBWfFmtF6/Fqd6PHXOOvq021
         LTuaQ9lBdl/vOdQYl5nhEtbqGJlctEZejC+4/ODFAQOnTJaHSdSTau6H3jbZKqFKX75E
         Iah9YTj99v+83AFb8LRfhdYtLT+y380w3iWJ6uUt4pdqZTVoyEqo52Ey/ODmrFidzZLv
         cVQ2uB2dDrVnGoAHK5Vd++KmxSl72S0LnK9+P1vDimwCDtmYrZm+I+WJaNQMfLS2+SwG
         vna2Ww67iz2IImjJAD00YLP+k99NIVCiubvf9MFd8Ry7cclRA3ifEuJXI7MB12+IoCI0
         hNWA==
X-Forwarded-Encrypted: i=1; AFNElJ/m/Pu8ZqIp2pTNLhPdno7bxOk7P58IUoQG4kJu4KY9Q93PgXUIWmMmbcHrGd8jbDCPk972Om1o0Q+U@vger.kernel.org
X-Gm-Message-State: AOJu0YwgrwWsu7HWdNh+oFMgQhhWAjOejuPqU9MTPNudgfMQMdh8SvJ7
	sdokR4yruJp7TI5Deu38kgqIAisNWOIz+zKmE6iGeawf/IRtL8o/3rrlz9ibmQ+VhZggs9M+6eU
	G8mECIsunhEIwtUdrF1RXpeuUSHhhlrU=
X-Gm-Gg: Acq92OEvTP124XlCSIbgsyiqxflLiZsLl9tnBYFsrCLYCdFNfcIwp31P9+ABkFKroBY
	x69CZ2p4DKy9q8d95Zhdd/B38iSQdNfSrvcwJYsGYXd5nbAo/fpsn6FelicSPgKz+Ggcq/XrhsZ
	MoD/XK+66OGX9+cNdoDjLuvsG4yRfvv1n1iUjeKbehVPWA4BeVLfynQD+mRHByoJRtY0lVrsj59
	KYJyrCjHT4X8E9H7LVR0+2M1kuoyC0i9v+0pMmrhmZ8gaodstLm5r+C6Dzb1yfrFXSd51ppcPCz
	Ww85HFn9kaLOAidj4a2OuejFPv3MM8jbiRE9TM5yf5EuTZtdHA9A
X-Received: by 2002:a17:907:9405:b0:bcb:d018:30f with SMTP id
 a640c23a62f3a-bfc2fc83016mr10319266b.5.1781125940955; Wed, 10 Jun 2026
 14:12:20 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260606-crossbar-v1-0-f67f7cb9ee50@gmail.com>
 <20260606-crossbar-v1-1-f67f7cb9ee50@gmail.com> <20260610195658.GA702518-robh@kernel.org>
In-Reply-To: <20260610195658.GA702518-robh@kernel.org>
From: Bhargav Joshi <j.bhargav.u@gmail.com>
Date: Thu, 11 Jun 2026 02:42:09 +0530
X-Gm-Features: AVVi8CfDeCrjalrRCyX2-0XZyrBQzRMMTBze-qG9_UentJXs_J_WCBPjfHZhG-g
Message-ID: <CAOWyW_4kRcZWCyOjJrWvnZ8meKT-ryJuGozuPvKJgPSUStB3Pg@mail.gmail.com>
Subject: Re: [PATCH 1/3] dt-bindings: interrupt-controller: ti,irq-crossbar:
 Convert to DT schema
To: Rob Herring <robh@kernel.org>
Cc: Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Thomas Gleixner <tglx@kernel.org>, Sricharan R <r.sricharan@ti.com>, 
	Aaro Koskinen <aaro.koskinen@iki.fi>, Andreas Kemnade <andreas@kemnade.info>, 
	Kevin Hilman <khilman@baylibre.com>, Roger Quadros <rogerq@kernel.org>, 
	Tony Lindgren <tony@atomide.com>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-omap@vger.kernel.org, goledhruva@gmail.com, m-chawdhry@ti.com, 
	daniel.baluta@gmail.com, simona.toaca@nxp.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,

On Thu, Jun 11, 2026 at 1:27=E2=80=AFAM Rob Herring <robh@kernel.org> wrote=
:
>
> On Sat, Jun 06, 2026 at 02:26:10AM +0530, Bhargav Joshi wrote:
> > Convert TI irq-crossbar binding from text format to DT schema.
> >
> > As part of conversion following changes are made:
> >  - Add '#interrupt-cells' as a required property which was missing in
> >    text binding
> >  - As irq-crossbar is interrupt-controller. Move binding from
> >    bindings/arm/omap to bindings/interrupt-controller
> >  - property ti,irqs-reserved is defined and used as a array but other
> >    binding ti,pruss-intc.yaml uses same property name as a unit8 bitmas=
k
> >    which causes erros in dt_binding_check. Update ti,irqs-reserved
> >    property name to ti,crossbar-irqs-reserved to resolve duplicate nami=
ng.
>
> Defining a new property breaks the ABI. We will need to fix dtschema to
> handle it. What's the error?
property irqs-reserved is defined in two bindings with different types whic=
h
causes dt_binding_check to raise following errors:
  - File "/lib/python3.14/site-packages/dtschema/validator.py", line
522, in check_duplicate_property_types
  - print(f"{self.schemas[sch_id]['$filename']}: {p}: multiple
incompatible types: {v['type']}", file=3Dsys.stderr)
  - KeyError: 'http://devicetree.org/schemas/interrupt-controller/ti,pruss-=
intc.yaml#'
dtschema version: 2026.4
>
> Rob

Best Regards,
Bhargav
