Received: from mail-wr2-f35.google.com (mail-wr2-f35.google.com [74.125.225.99])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D23413CAA57
	for <devicetree@vger.kernel.org>; Sun, 27 Sep 2026 23:01:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.225.99
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790550071; cv=pass; b=L2gwxweGiK3p5ADLFt6Hd188Dxvt/r8yAoKJxbp/LrdrM7gw3A1pwEdQ/9RkSx2sJoBzdT2BEreEuv4S6LU5/iF0gvDbpBSrXf/m4ALNgRiDGukwJCN+3pLrXZjHGF4v/Eb/NArNNhSzb6Zx9Rvz5zqt567w/P00n7iCL5T5oVg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790550071; c=relaxed/simple;
	bh=JCpwn/WWICwDSoLBnOOTTp6gTS0SfU3IsgvUz7VJvnI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=XDGJypZgdGIPlnpZV35sGBmgNgBJgegJh0LMm7oDrlcoOU91mxo9pJ2vUIaSft6mKaqbUwCs46hRRPK8Lr4ClKgrOPKA1UQlennHYXxbYNEZ6SvpgvHELg6AH8MnUfdyT+AC+MpBZbMAVXOXw3a0xLldnaqbJnw2B4EgdkDrQbo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=InaRM3Pg; arc=pass smtp.client-ip=74.125.225.99
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="InaRM3Pg"
Received: by mail-wr2-f35.google.com with SMTP id ffacd0b85a97d-4887f6cf16bso1429811f8f.0
        for <devicetree@vger.kernel.org>; Sun, 27 Sep 2026 16:01:08 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790550067; cv=none;
        d=google.com; s=arc-20260327;
        b=PQWQfgBs1G9eP6HeQTmXowLWhd7Nq56vAnWj1P/YIU7PL691xcX9mB6Ib4t56oXbyW
         ASZ+SzBswN8+PHXWH9wrYCsfclxaAmoILVZzs6DmGfGf/DDQL2R2PTi/V/c2xuJC+Mx8
         0VJsI7XHmV4w0KKq286+9HVmsy3sh/WTlMkFxL+Au4MJBYepuj6z6dgxFveYF+2ByOCf
         rJketf0L3KJF2ZZe5qh9yx2R0P7qNdFHas85gsa0Ruv+159j/Hj7qXrd0QiZvmHjVLGb
         78sWiMS+lCesUKxdfHXpknT0JDRTPfFkQtAthRmRDOWQrzJiLdi3xYQ17JGHOS/JkQD8
         dW3A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=pC1cDVE6Id7bEPJ+YQ1AhsXzN8ywZhzrUwp85FIkVFE=;
        fh=vhH3eF9WKYvhITDRBPhce+U1UTMiHvc03DEOUYQN0PU=;
        b=KGMihXE5UL+1ZWzqqtgjsGg19J7JacABE4rbOfcTB5Q8Cl1bI9l4QcPp7ipVSHcSMO
         w4BGfUsEokYsmwGsVCeRIP7e99ra8KxMXmVOhLG2UfqCTafLgbZe/ZeTTuos5HHgbNhw
         RPUM0tv3Jn4vNTG3vmfZhllUtXLIK6DCTcgqDtqSrIXu/VSkp3ba5pEz23L9Aly4/n3r
         v+sbCk8iaqdaLS2Ee9GY85nFWxVsyHGmlD29Da4dKokb1Jnu5ZOg2Y6RqYnPKloKpPeu
         FaqUia1/NT0sbqUbwoSDWkPmTil6VyDOYyD44ZugBZP2Dy1YR/I2owdR82DREKEfdwnY
         K2ng==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790550067; x=1791154867; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=pC1cDVE6Id7bEPJ+YQ1AhsXzN8ywZhzrUwp85FIkVFE=;
        b=InaRM3PgpHKQsECCIra6A9YmBRSU1CMHlqJyRd8yeerQpCQvd3hxYGeJLq952g7t1l
         FImRr7qA0/AGrx7QxUnbOU5d+BnBCmYSQDEWuFNqPIHk4mX5he6yGEJjtkkqlgcKoMQm
         hm4goQmzW42wUPJqgLA9xR9+tJoKcep0QWKiBqTFJYVpgTDFyltqbipx21vYM8cTsDSr
         xiYygf5JmKi3LurfHIfc7IdCgY1NFg+SvB09aBBFguhRYLgn5GNFCXRHNfmSiQmnsKXD
         ReVm9SKwMqKcJWhtslwaJlV2MAj6XX8/EKaL7sU3COjGjb59ORyKDIdhKESRex9q91BC
         HQkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790550067; x=1791154867;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=pC1cDVE6Id7bEPJ+YQ1AhsXzN8ywZhzrUwp85FIkVFE=;
        b=jWVUGbvHNEY5hMRCeqF1W/6InOJ7pZPayqK+qDdQB7yS+kppzr/C4GEUoVnYKNkYJs
         cqpRPFRf9NGOWbxtc7YPAc1R1fiF6jawkAKlroF3Qd/ttYO4r2EowUGQcWO/AYu4XZsW
         jGGfHxVeLzNn23OswjBCin2eGflLARLqaAUfZYtPESq+PbEk+kvdbURiUlYx5GMfII4x
         uFe/3ipaYs3kBFfW9US0xPSP7B1LL1mACbqn5/I7vE+aVgr3QjKux9iuy2mVheqbtgS5
         DDdDmBko3HR7q9311vFY3/HGCjjTA0lLHXSCy/FDi96LSYK+YbBG7dnvIFgRKo+TRUOo
         JqAA==
X-Forwarded-Encrypted: i=1; AKwUvBx+APnWFjjccSux0BwrH/5GUUdNKPdzofCFXMZBEPIcbqyi5kky4m3n2lJLj6wIbfbiuPxnbpF1Dmc/@vger.kernel.org
X-Gm-Message-State: AFuF++nix3wnToN0JspMgQ8xPZUyQ8JK/KyoYTLXyrd6K7pvXFK1xba/
	KcRlw00PgV6gELQ235qPuok1HmtRDM81owJxsfnzhJ2BDVxmA7AIOReO4baxeN2vPog0FhCPw+A
	CgVrmPAtmWvPMfMMYgbCtOuRyZoGSI0A=
X-Gm-Gg: AYBFou3zJ9FZFBIpnQBFYOzbDNxoQFbMblS50JAmVVDOA4TNt1nM7QdpdRU38ohMcxS
	0UhgtXdVw5EzA0Z4vSlTzqeZ1fIOFFvnHxYg/6c7hSSzn6RWeWtqf8/qH7BHxl5BWgH24d9uZdh
	23jMZ27JOJwqgGLcv7N0QmGMh83qL8ecFDZzXhnNYkWFgEs8SRjHBllx1Mg62OafvS6GWFHPHma
	aePXxNy+SI7xkEvHR9ICjIrQ5ZzzPVQ/mR1l7uc0HsANu1RUWqLtL0evw9CCGtkgtJue1V1K91H
	jLdhVuJINkGQAwIfiBPmupzO3jfSbrQI987fQpyDBNbiUgwxSgbMVrtu5VoUa9yXMsYNXxSF/kZ
	Cmgvj21kLi4eEc7F1VtJK7+X8ZjXOE16ZliznMezpJtt6e43MklcPDWQpN+url7aJ3DwQgNgn9A
	==
X-Received: by 2002:a05:600c:4f47:b0:49f:c199:e1e2 with SMTP id
 5b1f17b1804b1-49ff06ed9c1mr170160015e9.28.1790550066832; Sun, 27 Sep 2026
 16:01:06 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <TYCPR01MB74815955A10817B64BD6FB93A4812@TYCPR01MB7481.jpnprd01.prod.outlook.com>
In-Reply-To: <TYCPR01MB74815955A10817B64BD6FB93A4812@TYCPR01MB7481.jpnprd01.prod.outlook.com>
From: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Date: Mon, 28 Sep 2026 00:00:00 +0100
X-Gm-Features: AclHuK9lqYCvHMC1AiAR3XuaDXFU85jazCSKt890eRq6J5XWeWZVuaVBpqASpBo
Message-ID: <CA+V-a8vOrmXpr8Nx9aiE-D4axAQNf9oKhSgHaQXqdjE-bWeyNA@mail.gmail.com>
Subject: Re: [PATCH net v4] net: pcs: rzn1-miic: Clear MIIC protection state
 before unprotect sequence
To: Yoshihisa Yamamoto <yoshihisa.yamamoto.xn@renesas.com>
Cc: =?UTF-8?B?Q2zDqW1lbnQgTMOpZ2Vy?= <clement.leger@bootlin.com>, 
	Andrew Lunn <andrew@lunn.ch>, Heiner Kallweit <hkallweit1@gmail.com>, 
	Russell King <linux@armlinux.org.uk>, "David S. Miller" <davem@davemloft.net>, 
	Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
	Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>, 
	"linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>, 
	"netdev@vger.kernel.org" <netdev@vger.kernel.org>, 
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, 
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Sep 24, 2026 at 11:45=E2=80=AFAM Yoshihisa Yamamoto
<yoshihisa.yamamoto.xn@renesas.com> wrote:
>
> On RZ/T2H and RZ/N1D MIIC, writing 0x0000 to the MIIC protection
> register clears the protection state machine.
>
> The initial protection state cannot be assumed to be constant,
> as it may be influenced by previous activity before the driver
> takes ownership of the hardware.
>
> Clear the protection state before issuing the unprotect sequence
> so that register access always starts from a known state, regardless
> of any previous activity.
>
> Fixes: 7dc54d3b8d91 ("net: pcs: add Renesas MII converter driver")
> Signed-off-by: Yoshihisa Yamamoto <yoshihisa.yamamoto.xn@renesas.com>
> ---
> V4:
> - Clarify commit message
> - Point Fixes tag to 7dc54d3b8d91, as the issue also affects RZ/N1D
>
> v3: https://lore.kernel.org/all/TYCPR01MB7481CE8351FDB2CDCA229955A4872@TY=
CPR01MB7481.jpnprd01.prod.outlook.com
> - Add Fixes tag
>
> v2: https://lore.kernel.org/all/TYCPR01MB748157ECB6B92D8E3FFD433BA4B82@TY=
CPR01MB7481.jpnprd01.prod.outlook.com
> - Fix indentation
>
> v1: https://lore.kernel.org/all/TYCPR01MB748139F059DF2459B9813416A4B92@TY=
CPR01MB7481.jpnprd01.prod.outlook.com
>
>  drivers/net/pcs/pcs-rzn1-miic.c | 3 +++
>  1 file changed, 3 insertions(+)
>
Reviewed-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Tested-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Cheers,
Prabhakar

> diff --git a/drivers/net/pcs/pcs-rzn1-miic.c b/drivers/net/pcs/pcs-rzn1-m=
iic.c
> index 2b72fa98ddf1..279f709c889b 100644
> --- a/drivers/net/pcs/pcs-rzn1-miic.c
> +++ b/drivers/net/pcs/pcs-rzn1-miic.c
> @@ -270,6 +270,9 @@ static struct miic_port *phylink_pcs_to_miic_port(str=
uct phylink_pcs *pcs)
>
>  static void miic_unlock_regs(struct miic *miic)
>  {
> +       /* Clear protection state */
> +       writel(0x0000, miic->base + MIIC_PRCMD);
> +
>         /* Unprotect register writes */
>         writel(0x00A5, miic->base + MIIC_PRCMD);
>         writel(0x0001, miic->base + MIIC_PRCMD);
> --
> 2.34.1
>
