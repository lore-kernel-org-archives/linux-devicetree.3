Received: from mail-ej2-f1.google.com (mail-ej2-f1.google.com [74.125.228.129])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 44F9151DAEC
	for <devicetree@vger.kernel.org>; Wed, 23 Sep 2026 12:40:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.228.129
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790167251; cv=pass; b=Cr+NUkol4hSaNWVPJxtMEGGLGod2ugwfH2SEPKH8cKulZRhmqorGz2gDBqlRD7HIt6DPROMPliB3RV9BTHEWoo1fAfnJRLm0SK8tdb3Zr3pnKATNMs8rXarikhUI7HJgdRsXjMiX8OhaD9y3uki4OgwmKWObEq5MVf7TvZKjR14=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790167251; c=relaxed/simple;
	bh=yrBXUqSfBJNVOGA4p1L4WG725TYm+nXRxrzQgFuRPz4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=pA8RzDDGdk+NjOQ1rbukakh2whMjL/79GKf43JP6Nf5SQgsyg1Y8p7bNlplu6qJQn1A6jqQsP8AttK2zo/6SvtHfjS/nVTWg5V3+pg+4lUe69STLLe7k+fJmcQbur5gjwI/nNOsHUTCyuecg7RniPwO/d50TDsqg69PlNg1k6T4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=mNVWlYwM; arc=pass smtp.client-ip=74.125.228.129
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="mNVWlYwM"
Received: by mail-ej2-f1.google.com with SMTP id a640c23a62f3a-c1971f5efc3so48768466b.0
        for <devicetree@vger.kernel.org>; Wed, 23 Sep 2026 05:40:47 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790167245; cv=none;
        d=google.com; s=arc-20260327;
        b=PTpNajPGVBNhvqAAWOMNYw+ZY8UkaEYhRQvNUytDoBcc3her6pyoW+lOIiqYDM4K1n
         6QTh1lmOUT5gNRl0hTuMS4Z2I2MIICHsSrAzwsnS94QSCmwWunvlsniP6uQHwbBeU3xM
         GbP5QiFtjlcOjUMT9LYsq2P2Gw5F8kgW3NeiTddSSC7AP5BZtmXCfAH2yvFGN/6lfiew
         zluM1TbMICkHR6dYTzD0VzYskUTQ/ruwf3TBw9Wae4qSOyqFntN+WGXNOQygpFKGscFe
         Ao/jheSPAGtptA9Ph9ENzdFEQUsayjW+n+y1AIyyH3HaHPDV9ho8bz5F2wVK3j9YPMnq
         k9SQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=yrBXUqSfBJNVOGA4p1L4WG725TYm+nXRxrzQgFuRPz4=;
        fh=nv7Lk8MzYdYNR1Vz+faw0J+iC0xwWiVqZ08qKnWxfX8=;
        b=MHLcM+90pHJ2BV5nvmoEcF/YdJ4PryvpbdaaCJ/R7UGRCSH7TxoLIjY+B3B8vzuKSv
         99dDFlWP1vc+xDG9Z+Kg/R6pvrB1RS0ilhZVapOH7QWFAzm8kQFemRuVCjQRHt6UHdRL
         L9qOOIKGI+HzcG6jBCjQ7IowXi1o87t6lRQ6gtat7VPbalItDh38NYdnGx1XLFR62TVo
         T8yPS+Igr+zLVeE734ROgEfNwlGtc6o0pdgRHv7Ipb9LBv7Be/cnvDCc0NiKoDl37+lq
         00+kE+g9cZ9bDR2OHdJ4n1hueC7A1bC6IEhIyHbhgNDVc0TpXKAW9e2njNMdhDc3TZlz
         21zQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790167245; x=1790772045; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=yrBXUqSfBJNVOGA4p1L4WG725TYm+nXRxrzQgFuRPz4=;
        b=mNVWlYwMzpZ6XdVh6gnhcylaxl51TIH99pMipEXYbsjdb6U3HyDy+7+Mux+yYlrY8n
         tAMNUR3OZJ2T4gS4BafREQ5OIUX179JKOOByjFTUWb8R5/hcungUbho65yJ4rV/SNOhP
         0ajiuf9kM2THHOfOP+UFYk0R0vS3RM3arQ3y/MaID/B9K1FSPa8TKjGBrYfgZniYWZ8Y
         WOBi9fi7Eem04EN4bjBeAa+WDy8b939piz+ce1gfpLa7MgQ/nRFJtIS/46LlwWKn7uca
         pALtLSEcy8N93BTGd2Vd9A/JGwiFYL4DGiLmkCbK3sCoDr14KK22yikj5r6/1s3poe+p
         AiOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790167245; x=1790772045;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=yrBXUqSfBJNVOGA4p1L4WG725TYm+nXRxrzQgFuRPz4=;
        b=D97I2MPx5PlkP2FBlFAjp4+zRaklGaE03TVxNV5MYRm9pj1eDKpQKZRUMGw2HEOZ5n
         kHoOa3bpYxpvzjC+t16ABVCJFf+wrgok9qot7jQ1wyDW/u/eO6vpBC6cDvIVhHA5TbHF
         We+YguJElrhT/j7Owx7pgplIJ25fLcmYFugWRJ9lr0dYj7jS5mScBt79V8BFU8puWK02
         Hcd0nfmwV3nCdEO6wt0lNWmEGuAZsQk0qPZICnh96ZQkmyQQZBSMGJHgvS8vpJoeMcl1
         m84zqxMBwImzY/Epi7c5PvMBqa3nWBi2Bj5bRoyxYcy92Z/kqKEn2m52wvvifqaYurDw
         NWTg==
X-Forwarded-Encrypted: i=1; AKwUvByMFIiNqbCR6ouofTzexlT0rIKfpyGYWdsVCZXkEtptGHSms6/m0C3hAVhDNrCmf+1xajjmN0hgURAG@vger.kernel.org
X-Gm-Message-State: AFuF++kjTuJA0RHe2SIQ9r44Udb1U0/hopYsaF5B4xBPQhONsfj2hYVS
	rcLZUPqRMwuvmG6kF8bUQswSOr3ADHJrAxL4341FPpLrzUhcF687kZa23EVU0Q+GD6/nQRI2cVA
	77fUZJ0FKqjNqE9ciTBED2SyX6QR9XLQ=
X-Gm-Gg: AYBFou3hZnumqx40mSLXkt/sPev4P56jxS/boGrhsRnd50pkCVbJz4dJKXdbgmH5Nq5
	VAk2CQWikaA1J/SJnrFMy9ARuhjcJ8Ca/EJomjH4o34s8FGbAnXBy01ge9hmAhQmtiSmdBe7waD
	lOJqDk6cBNYc0CgB/HaUmIIWfxwKueBw+ajJXdBXhnz8MIuGDMzs1NZzJvFQoQFnqW62bD72aja
	GWAZxAIwckGFdPMXbLhHAWhUbiMHWuEKTlakH2mrL6EhkyUqtv5b5Byh9p+jso1zSznMUZR0cnv
	PxFhe8yAcWstkwyzWk5GeuO4Xj6e1d7L0mRlXlwcqV3IV+VHdqEqW3DtJw==
X-Received: by 2002:a17:907:d91:b0:c25:5faf:b207 with SMTP id
 a640c23a62f3a-c2aadcf4484mr194861466b.3.1790167245181; Wed, 23 Sep 2026
 05:40:45 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260922200336.2201212-1-coiaprant@gmail.com> <20260922195006.79890f24@kernel.org>
In-Reply-To: <20260922195006.79890f24@kernel.org>
From: Coia Prant <coiaprant@gmail.com>
Date: Wed, 23 Sep 2026 20:40:33 +0800
X-Gm-Features: AclHuK-io9PS85iIjo2RRKD7nlxq4FY18LSW8xzP9gnGJLLZJesN4MppzV2qPUE
Message-ID: <CALj3r0hH6m7jUEweKMWGmCW9aOxShaqsV0E+z4ztBhXbJ+378w@mail.gmail.com>
Subject: Re: [PATCH net-next v10 00/11] net: pcs: add basic support for RK3568 XPCS
To: Jakub Kicinski <kuba@kernel.org>
Cc: Andrew Lunn <andrew+netdev@lunn.ch>, "David S . Miller" <davem@davemloft.net>, 
	Eric Dumazet <edumazet@google.com>, Paolo Abeni <pabeni@redhat.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Heiko Stuebner <heiko@sntech.de>, Vinod Koul <vkoul@kernel.org>, 
	Maxime Chevallier <maxime.chevallier@bootlin.com>, Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
	Alexandre Torgue <alexandre.torgue@foss.st.com>, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>, 
	Romain Gantois <romain.gantois@bootlin.com>, Heiner Kallweit <hkallweit1@gmail.com>, 
	Neil Armstrong <neil.armstrong@linaro.org>, Russell King <linux@armlinux.org.uk>, 
	Shawn Lin <shawn.lin@rock-chips.com>, David Heidelberg <david@ixit.cz>, netdev@vger.kernel.org, 
	linux-rockchip@lists.infradead.org, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	linux-phy@lists.infradead.org, linux-renesas-soc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Jakub Kicinski <kuba@kernel.org> =E4=BA=8E2026=E5=B9=B49=E6=9C=8823=E6=97=
=A5=E5=91=A8=E4=B8=89 10:50=E5=86=99=E9=81=93=EF=BC=9A
>
> On Wed, 23 Sep 2026 04:03:24 +0800 Coia Prant wrote:
> > This series adds proper SGMII support for the Rockchip RK3568 SoC
> > using the integrated Synopsys DesignWare XPCS, along with necessary
> > fixes and refactoring in the stmmac core and XPCS driver.
>
> Please slow down with the reposts.
> Not more than 2 a week, and please wait for the AI review to finish
> and be published before you repost.

Understood, sorry for the noise. I'll keep reposts within the limit and
wait for the AI review to be published before reposting from now on.

Coia
