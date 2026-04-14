Received: from mail-pj1-f45.google.com (mail-pj1-f45.google.com [209.85.216.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4ABD93D7D60
	for <devicetree@vger.kernel.org>; Tue, 14 Apr 2026 10:41:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.216.45
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776163276; cv=pass; b=ebeWyxNJEbDLw+12963lSa+akOrftgVf3yXxMOGd+Ursrqg5CPpshzejoTIfwDejZqkLubffOjPNq1ZJ/Vv0G8ujGsdhlPQqxSsIfgYESMAKkHKiQLROmT7CxFaohaPesNFu5Fk2Dif3ss7pu6zmvMNz9kO+wVXR1lhURAmDThc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776163276; c=relaxed/simple;
	bh=FRJ1V4Rg7H7FZyF7SYOEYn6+kpQ3Ohx/3Kg30U4brH8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=RKA4Aa7nwxiCRtU+ajuyHhm+ER6VuA8LALcTkyn8D3s2qkKPQg/yC0L+0jEW6gbByHVbZVb+xkaOwFXO1c5Ajxy5QU9hyqVzp26IsxZOSg4njKZC1MPq/L3BIQaNKdPN/+9z7sUjmU7dxVV7dp+g2CtLDg45EcGQJQXbcf1mI6I=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=hcAtfRjM; arc=pass smtp.client-ip=209.85.216.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="hcAtfRjM"
Received: by mail-pj1-f45.google.com with SMTP id 98e67ed59e1d1-35d99031e4eso3035138a91.1
        for <devicetree@vger.kernel.org>; Tue, 14 Apr 2026 03:41:10 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1776163269; cv=none;
        d=google.com; s=arc-20240605;
        b=ELlYBixN7wyDwZ9P8atdNjYIwo39ADtO+LMhSYm8tGsMJqUzVPk/iNL4EDgw8gUmEJ
         vO+NTpA4Wrog81orlLIlcM0C/sFqFWBIfHzLp8M38U9jou82waVSPMKlXV0cEbNS7PPK
         rC0+0x7n1rcJMEWOvKDEhlIclrijFlkklLrJXXhAQePfcELN2Hd6oGIyKqVDrVnO+t3O
         zLwcQmm5227MeApfdJ7dRMYagAVVXfs5qTBX4K3T1IMA1Zu0ITagusDCwAFyRJtJRjfG
         r3Cvk/H8dyHmc036aT4KFdJZBfSZLT0Rycr27TRXt3dYYFHy/eUpRtBjlXtPl1wwr60E
         KDug==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=vDpaKgtvK1gesz/aQw1mjbgT5u/KzUnIhgbKYhPDE5I=;
        fh=9VmarWHAaIeyMKKMeNT8YQeKGZc5R/rGAMwVpfbqe0c=;
        b=Z0ECTWn21QwmrGqPaiYU2jWroLAtB9YjIATeKgr0/9+qOIOmYW1Hhs8+EuHId98HPW
         AGvA87mjaALGNzmIVo4wJPzg4AcfTBwB6AItJUjtw7IAPL/vY2YcAgBmyog1+tQuXMf/
         wGYpg9H1AyYs0b0njjnGRgDA0DbQ/EcoMXwOpyUkSF5Of36tkT44f+j0sJmcPpnDjuQu
         /vkBTJroTRMpv6wbXkcDPTsU8YTc3Q3SoPCGFD+HI3pvM6htf3QsIrQVmIYLoqkUgRoh
         vYChwWinuY+k+OV62SZYSz70LNpmS1HZgrGmGKnZ1HUOx4tGR+VQZMCOPmLrKhPTL9h9
         gGVQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776163269; x=1776768069; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=vDpaKgtvK1gesz/aQw1mjbgT5u/KzUnIhgbKYhPDE5I=;
        b=hcAtfRjM2dJeBFRpJuxJpdNi+e623wV1TUB/wleAZufLFl7Z8aNx3UW2Y4Ax8rDVzc
         n4gUUJK2OV632+nekcK/1piRet9gbGYkg55ll2+g3LTd/ZrsQj2SiODm9TtSnF0yE/n1
         Qi7USEY7dcC/2rLFNCe7M4PLBpyya1DFiVN1T1X2XDyqrlTOzMbPnJJWoPCQNvDFp29P
         e9Of8oR7pPN9qORbiyhAoyGwg8+SrwE+Y4nCxqqLbtIeDThfy4V7eTe4IVbsHNQBh43t
         lSsrobZPR2L3go8lb6FIB0+n2QNqOxGQX8sMOM64Sc93Qsokbvq6jV1QxBWwYM3T5xUq
         TYjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776163269; x=1776768069;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vDpaKgtvK1gesz/aQw1mjbgT5u/KzUnIhgbKYhPDE5I=;
        b=ntjErzlHaVsh3KIdKAxAuDJna3liVFtMKd+HGaom7ju69VxjP/zqLfilY3qpuEreQr
         p/A3iISynSJXuU4lOMPwsiT2tVkkhtk4YY/iBs8S4CvOe+a5XENvxjvrfufuXGcJ+rAB
         V9pzpZb9OWJnUHnEG1gqp6ngEaNHKJMZJUmoT0AXr/2Uk74OCOtNKpnoCVyoi5rVbPRw
         pQlPyphCZe27RCUxllusiIZM+Akxi1BdBtI8wt/zxDywU7pcdl+YHXc5IopKW4ezMLYc
         35RGxem5xHrvW+fD+TbdwWKg1P3G9EwQayYLxIiS26G+S0m/inPSm2CUWXdjb54aAWjj
         FhuA==
X-Forwarded-Encrypted: i=1; AFNElJ/Mmi4wc+f34ZXzeecjohxU8f7avUxAyga/L4A9MHk/2aAI4iYgSakwWDxFlKJSAI9tPpuKSsYYyapr@vger.kernel.org
X-Gm-Message-State: AOJu0Yx1mN4WWp4OZ2fCSv8VsDVWa1Hg+Pox7PPVXDXNGWUBK4vzGno/
	RMovtq00ZGFKpdML+ZmsxHjETARE7dcbvnEWCj6+A+zAeU9Funkb/fd7dYY1a1uM/lAdSvNyh6M
	90hW5c4qzD0bzMcAG+BT/tJnFgeXJ/Eg=
X-Gm-Gg: AeBDiesa7EgCB1CPYOjqee1neIBrRkdXkFxLPi8MNES7oe5792H43PrOGtwfLAFuCeE
	n2nNj2s2mCh4T1Q/kQP8gc+bBFp2edDeNgEUiB0vYP2yTVvIUNiSX0EinfFbFauHfwY+tiby4oT
	fCxdFxgmv9Djhtkn8UzpgCXRrB7Qiz4AuRZUDoItS6qWXN9jE4yKETNeyB7OO1vxDHCTU+LWeY7
	rj/tL0IRAAN3XLdlrn2X7snjlEgDNuykKqk6f/+Z6zPJIbf/S6VUMb+iq72v+dh1rj4Qd7qCJK7
	rThvwsA7vUaBGI/Eaw8Q4BmHbiifdbal4ZiaNQ==
X-Received: by 2002:a17:90b:3950:b0:35c:1695:24a3 with SMTP id
 98e67ed59e1d1-35e4281374emr16834509a91.23.1776163269477; Tue, 14 Apr 2026
 03:41:09 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260413100700.30995-1-phucduc.bui@gmail.com> <20260413100700.30995-7-phucduc.bui@gmail.com>
 <20260414-funky-sincere-polecat-20b0bf@quoll>
In-Reply-To: <20260414-funky-sincere-polecat-20b0bf@quoll>
From: Bui Duc Phuc <phucduc.bui@gmail.com>
Date: Tue, 14 Apr 2026 17:40:57 +0700
X-Gm-Features: AQROBzDyXFYNs7TrKIvlK_AGlBy9o7qpqavO_nNuacnjcjUFmQX1mxW8gHCuSbM
Message-ID: <CAABR9nEKGSRNp=eK=ZHf6-MNsj=6cDCy1YdbzSPrHyuc3Ux0Ow@mail.gmail.com>
Subject: Re: [PATCH v2 6/6] ASoC: dt-bindings: renesas,fsi: add support for
 multiple clocks
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: kuninori.morimoto.gx@renesas.com, broonie@kernel.org, lgirdwood@gmail.com, 
	robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, 
	geert+renesas@glider.be, magnus.damm@gmail.com, perex@perex.cz, 
	tiwai@suse.com, linux-sound@vger.kernel.org, 
	linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Krzysztof,

Thank you for your detailed review and feedback.

> Flexible is not allowed. Provide reasons for exception.

I understand and will remove this approach and replace it with
explicit valid clock combinations.

> This goes to the "clocks:"

Understood, I will move the description to "clocks".

> > +    minItems: 1
> > +    items:
> > +      - const: own
> > +      - &fsi_all_clks
>
> I don't understand this syntax.

Understood, I will drop the YAML anchor and use explicit constraints instead.

I will update it to the following structure:

  clocks:
    description: |
      Clock driving the FSI Controller :
      - "own": Main FSI module clock (must be first and always present)
      - "spu": SPU bus/bridge clock. On R8A7740, this clock must be
        enabled to allow register access as the FSI block is connected
        behind the SPU bus.
      - "icka" / "ickb": CPG DIV6 functional clocks for FSI port A/B
      - "diva"/"divb": Internal FSI dividers for port A/B used for
        audio clock generation
      - "xcka"/"xckb": External clock inputs for FSI port A/B
        provided by the board
    minItems: 1
    maxItems: 8

  clock-names:

    minItems: 1
    maxItems: 8

allOf:
  - $ref: dai-common.yaml#
  - if:
      properties:
        compatible:
          contains:
            const: renesas,fsi2-r8a7740
    then:
      properties:
        clock-names:
          oneOf:
            - items:
                - const: own
                - const: spu
            - items:
                - const: own
                - const: spu
                - const: ickb
                - const: divb

Best regards,
Phuc
