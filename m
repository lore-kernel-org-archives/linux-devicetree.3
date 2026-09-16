Received: from mail-wr2-f12.google.com (mail-wr2-f12.google.com [74.125.225.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 24DD8379EEF
	for <devicetree@vger.kernel.org>; Wed, 16 Sep 2026 12:14:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.225.76
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789560868; cv=pass; b=Y6T6rsE+DxF8tXUSHFwzueAi6lO3ATMPlkY05rFw+3WfNfoso1AC8wQ74oNIpPeyY+lr4P1YbW8buBDRXq9GbTgRcnbHSMMCnL/lJVkclEBOAc3nRybjZ9doLbf+YPctikN/rvh3OtcSnMovUn91JVE4ukJYNTnSUwU6Fieo31I=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789560868; c=relaxed/simple;
	bh=6OhSXpLL6yyCsnTcd/u+qyxR41s6OtTwu5yFPz09Fdo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=kCW5JpnRiBSP3wDIBfNTLGSlGDLyq5O+VG8/lxJ+oVk+pOK526VLLI2spAqjBhU6BCcKydaBpN7anD+ZI/D0Sk8mOgAu8rVMNeGz7UhJ/wJtvEvu1Zyy5D2tZVCQQHPRKNrlGbCSlvUDcN6mZQrVRuX97KXiNNKJFAZjizZ2clE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=YMvzOKYs; arc=pass smtp.client-ip=74.125.225.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="YMvzOKYs"
Received: by mail-wr2-f12.google.com with SMTP id ffacd0b85a97d-48583cc7ab1so324895f8f.2
        for <devicetree@vger.kernel.org>; Wed, 16 Sep 2026 05:14:25 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1789560864; cv=none;
        d=google.com; s=arc-20260327;
        b=q7icJMWxuM0clJYK61lyK1oKr+PTKXTcnfFq/i5Bah77AZWHMZj7Hzf/6l+YoyAGc5
         qbXCEGgVN4lmrXATXFYJmkdZunzlmsOE1ZYRUnR3VHRcHpAtPRIXIJridE1cRKf7sJV+
         OqxElk7ktnIHx/KmNicZH+eQFu5WDTWC20VkQ+QMLgE5dhiczBvpCiOYOq6LCKkao25/
         lxReV/DxfJT2geqVQigkgrlEYtRUJUOqwqKtSV+gq2+rhC0CrPAkXCqh3FlLS+06xRij
         5kGNNH065lPS9hrWxGVl2gvai77ne6R52lGTtiHjfqF4c9CYPm/KxkGNh6XxDXLMiSOk
         d0pQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=W8tnBP32THpsSvPeT4SZBZeDx4xVbPtQq5N7CZKdDSE=;
        fh=e058e/afbqrTYOIii/E7L0z2Cs2CNDL0l5qTT8AiWA8=;
        b=Nw2oLAKuxUa17XdyTdbNeJIz3YJKa+fy0QulhXlUrE7xZMHvdYvZlUa+IrACeoeqoD
         mVHr3sHqaR1mQlxEO0M22OC6q5GxlkEkJ486ep0TuzrD+FAz10gXZKbmaXu6Ea8/CUbn
         NNRe4xew+NfsLWnKoxSWjr8Cv2j4cBCNzZYYam5D0IKzGJG768t35jfVEINiQ4rscDir
         6TiFFpwnvq3nZ1C0U5M0re7niqx1+YINenK1680QOTPQaUZpE+NNTUXSCmxr50jqXJ9K
         EfVMfk+TRpB9Gw24IaVZdqsWVCdhby5CCDrWKC7Lz4R8b990Nnnz9sLjjnPp/rzHY4Ka
         5Zow==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789560864; x=1790165664; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=W8tnBP32THpsSvPeT4SZBZeDx4xVbPtQq5N7CZKdDSE=;
        b=YMvzOKYsg9wM5p6c3O41r3I33IFH0fjAtZlxtZdvKulG56+iaCCWLoh9AMKOLSIdYF
         em8d2uJ+aEB4Cy7pVzy+IIbQJHkCYfQmY87syE2EEPkDrG8x1f60+Hwv23IISDZirSyb
         0EJAQs2lK7sGQW6l8CUZivpIUSeV6FOgNkZrvjI/rMQjDXUPby23HcVWzkucccoGS+0B
         Ohg6G2vBPsqgAqBFaAIPZzy/PW1Mp/mVrMdHxzy3lSawtswzqd2w+T+uXCwgk7cZdr51
         iS5A7mizim7YPUWU7IQH1xpsHw1QblEcKicczmYCQt7axCtz2eEhAxb1v8/Y3HC2mJy6
         emRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789560864; x=1790165664;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=W8tnBP32THpsSvPeT4SZBZeDx4xVbPtQq5N7CZKdDSE=;
        b=tnYmo2LlR2xPQlmz0YsOzrFosJDiW3J15zBAv/G9lgM/wBf0AGex1xnamb4n0Hv/Zv
         kHsUHpsMZUyv9qjEGip83D28UhOgc+4RnyjforviDQnpvZqXdJaAs3NsvO8biKYf0pI2
         n4uQGO+CDUMkjkKug28hUT32mdddUx8cHOoJBmad0umm6hFeDG6uLMtCHTYP4AxEQEp3
         Uih2IWHt65mfqVYcjddsuqoILSLyTgrpCu7Zjgj7t4vsksC0lDUrvFnV5eVXwkIc1NxC
         JaDPXANiFL+V+AmPYjtGQc4mwtmh90ImBWBYTWPMonsF84dQnHBJq/WF4OohsnFlfBoG
         6wQQ==
X-Forwarded-Encrypted: i=1; AKwUvBwu3NJFqwL6weRU+cxIFduNS2qTNLydlER1krw+RV5V32mgEpk1jM4pDAm//Xvtt0jBlTQ2BdD+Ig4T@vger.kernel.org
X-Gm-Message-State: AFuF++lqV67It8VVrBCaMmKNQGQkMzsKhihPi5xbwGVCeG2BTYdzgUIh
	JgWPEZoovvhjAgbKERiaRrFp+cG0QqozJzOqSW+6jznQFSUOPlbUYwu6BBkJwtApnE96jfgJv1r
	IrAlrZOYBEtcRUtmtfgVmfRSpeE7WwGA=
X-Gm-Gg: AYBFou0f1xRw06O3NSi1cDRU5LtkS3IpGy2zKajDUsHgATMH+JKFMYr+DQTw1NZsOwx
	xkY+75MIzMZjp587kWCYDVVAkyDfs0PzS0n3Ael8FExlXO3KPauuUGdtE3OLVm1v9ys01pJZ53L
	zbk0PafozLuOycYVN+lfbb9sYSCBcm6Z/8DmKX/GyHl0lXPQh1rzyAwVIi+p4uIpCREMVMM2TQX
	inEyMJ22risv+vrb1y6VDj/tjEzfrZyy3L73I1ddHUgaHynf2kbMAqtwDaZO8PofrYRo4Btg73W
	R4+MoWl/jQohKN/SeK9VIE8fh8yRm7/KI3TR3qsY+AIQ0Aodn9ZqzPs/q0k1XVPK2l2XbNW43SV
	fHG8AaeA6OIMVmwGiBX1x28svrpiSO4PEuE+MeQXF
X-Received: by 2002:a05:6000:4681:b0:487:fa6:7335 with SMTP id
 ffacd0b85a97d-4870fa6741cmr1533422f8f.36.1789560863947; Wed, 16 Sep 2026
 05:14:23 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260916102520.24288-1-wsa+renesas@sang-engineering.com> <20260916102520.24288-4-wsa+renesas@sang-engineering.com>
In-Reply-To: <20260916102520.24288-4-wsa+renesas@sang-engineering.com>
From: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Date: Wed, 16 Sep 2026 13:13:56 +0100
X-Gm-Features: AcwNN1Vmfjvs1Y6IvhLzPsYLsvLUYulxTJnuWGWVyBNab4QaFnHHBImQf8BVKrw
Message-ID: <CA+V-a8sRiKX6SRsMdkDFoRMmUCYZHYfGkX5_P_j3xuV1u73xjA@mail.gmail.com>
Subject: Re: [PATCH v2 3/4] dt-bindings: rtc: rzn1: add R-Car Gen5 support
To: Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc: linux-renesas-soc@vger.kernel.org, 
	Miquel Raynal <miquel.raynal@bootlin.com>, 
	Alexandre Belloni <alexandre.belloni@bootlin.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Geert Uytterhoeven <geert+renesas@glider.be>, Magnus Damm <magnus.damm@gmail.com>, 
	linux-rtc@vger.kernel.org, devicetree@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Sep 16, 2026 at 11:25=E2=80=AFAM Wolfram Sang
<wsa+renesas@sang-engineering.com> wrote:
>
> In general, the RTC on R-Car Gen5 is identical to RZ/T2H. X5H is an
> exception, though, because interrupts are not wired. X5H2 will have them
> wired again.
>
> Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
> ---
>  .../bindings/rtc/renesas,rzn1-rtc.yaml        | 22 +++++++++++++++++--
>  1 file changed, 20 insertions(+), 2 deletions(-)
>
Reviewed-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Cheers,
Prabhakar

> diff --git a/Documentation/devicetree/bindings/rtc/renesas,rzn1-rtc.yaml =
b/Documentation/devicetree/bindings/rtc/renesas,rzn1-rtc.yaml
> index 7ea77cd0bee1..186d0076590c 100644
> --- a/Documentation/devicetree/bindings/rtc/renesas,rzn1-rtc.yaml
> +++ b/Documentation/devicetree/bindings/rtc/renesas,rzn1-rtc.yaml
> @@ -23,6 +23,11 @@ properties:
>            - const: renesas,r9a09g087-rtc  # RZ/N2H
>            - const: renesas,r9a09g077-rtc  # RZ/T2H
>
> +      - items:
> +          - enum:
> +              - renesas,r8a78000-rtc      # R-Car X5H
> +          - const: renesas,rcar-gen5-rtc  # R-Car Gen5
> +
>    reg:
>      maxItems: 1
>
> @@ -52,8 +57,6 @@ properties:
>  required:
>    - compatible
>    - reg
> -  - interrupts
> -  - interrupt-names
>    - clocks
>    - clock-names
>    - power-domains
> @@ -68,6 +71,7 @@ allOf:
>              enum:
>                - renesas,r9a09g077-rtc
>                - renesas,r9a09g087-rtc
> +              - renesas,rcar-gen5-rtc
>      then:
>        properties:
>          clocks:
> @@ -75,6 +79,20 @@ allOf:
>          clock-names:
>            minItems: 2
>
> +  - if:
> +      properties:
> +        compatible:
> +          contains:
> +            const: renesas,r8a78000-rtc
> +    then:
> +      properties:
> +        interrupts: false
> +        interrupt-names: false
> +    else:
> +      required:
> +        - interrupts
> +        - interrupt-names
> +
>  unevaluatedProperties: false
>
>  examples:
> --
> 2.53.0
>
