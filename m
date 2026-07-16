Received: from mail-ej1-f46.google.com (mail-ej1-f46.google.com [209.85.218.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B834742D772
	for <devicetree@vger.kernel.org>; Thu, 16 Jul 2026 16:57:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.218.46
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784221071; cv=pass; b=Ph/lod552nSKrdvwQpWqiyujWq2Yrn3qVOl4/ps2eu6a/GwAxwFvcEn1SV2uncIkihynq4uK+1D24MJrCOXL0OZJke63qURzoZPXDHyT/QGalX9qonqOcg1j8abF+JBzahO1NdaP3uTI2gMz+oz2ZURA/vKznr57PdMzb9Lgvg4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784221071; c=relaxed/simple;
	bh=6NjwaITTGuhWi/vVoexbJKDWMfDFVpQDEqQvDlyCRPc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=s7qwobPvRp+QudAEA6XUYfUZ25YcptJzwFR7oDs7/3sWCPxIIpLSuQSepWQLzB/h7VoU/IR6DxV62By7rqGJdE1jT+vps5HdFW0gg5ePk+vRkbE1OQ1oB0DG8cdvuuCYzS48WnhrpgWdbRgEG8fJTtrKQcQgiUp9oBialmu8n80=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=bsF1BETS; arc=pass smtp.client-ip=209.85.218.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="bsF1BETS"
Received: by mail-ej1-f46.google.com with SMTP id a640c23a62f3a-c165a41a52bso468798366b.3
        for <devicetree@vger.kernel.org>; Thu, 16 Jul 2026 09:57:48 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1784221066; cv=none;
        d=google.com; s=arc-20260327;
        b=TsQ1HsUHC9cr3ncRyyn1C6y1GvASFKpDXsQ2h1Lzu49iqYFZ0nVef8YGbIgBXE4+wH
         A42BaYiU7Fzfd7n4FfLoxzVDPFncysfNLKOUBdIrMBBUB2BOvkS7wJfWwjFuzIAt2IYp
         x6uLP34zQ3Cr9FS2Ftf3ULIF1s/h8X11ag2mg/hJPPqYn2/yJ9nMR57Z/RV3a7XG32cb
         mYnKMj7XaA+YfzbHoosWoOJ4pAYIvJvkZKD4aL/cH7F0GaQ8d0b2bVm9ApYIQUaxASLM
         ea++nkJcmBkMTwuA41IMOrvAcFAdFauEkSirRWo9bPEaCFavnWz6XpGrxeUPTTzEXvl2
         /mBw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=6NjwaITTGuhWi/vVoexbJKDWMfDFVpQDEqQvDlyCRPc=;
        fh=uhTzE8AYmm+QDauTag8k0MonREBSqrC06ThOPaJ/t24=;
        b=sMe3LP7GPAYAvt8wRRdb7MAp0P4diD3LTHYjSILnXnDvglc0xWQ9PRVmFRMHmY8zQs
         vkw4pOTzWi23EhKlEaZXyP2+/MD0t/2D4vfjDh4IZ9HxoE1d2ZO6GaldMPkxd6c069kj
         y3ojxbOqOI2ammyZTV+6COzNslfsCa2+o2fBjitSFKrET/QD6D8VV8gPnz30+62YvcaW
         p7Ln6vvhKLfe8HJkbMDyC1mBFJKy9ukFQiiyGHDrAnE/l/+XZU8FP1sg3xuqlFGZbuNN
         B56lh3ZcatP5kEcdbHjs7WhEvV0QryDBrV++Th8v37N2rEix7yYty67dh9Z228n+DkLV
         c2dQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784221066; x=1784825866; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=6NjwaITTGuhWi/vVoexbJKDWMfDFVpQDEqQvDlyCRPc=;
        b=bsF1BETSaTdbedgyX3UDFYyaKIQWeRWJMYw7AJE2dif1gJOWK9zbi8mFZ9ZoLWPr3n
         W2jK2wpl38f5oR0uYZvHZBZ38gisU2zcR55MVQul9YqQDezU3ZV/DwNcpaWrTbHy0OzJ
         dOINSWQ8FvdhuFrqmZejX/n8oYSryUzZ1hMFvzRrf/VXRGIlOPud/RF34TzbEsfXGBVs
         d05Pu4LH1M/Ls9akgpxqLo0VMfI86qzk+taOYkiiWXNq4s5LOhZ/lJvD3T0hxPC6VOhL
         68sFVstoOD+rqU472MKrzw2vg2M//i8m1pkm2+Q3fzVakv6+OPBOJxp+gtByqWLPQNoq
         9u+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784221066; x=1784825866;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=6NjwaITTGuhWi/vVoexbJKDWMfDFVpQDEqQvDlyCRPc=;
        b=Sc5vwj87Ih28iz4HJIFghJrPT85+kDfYHzKtdArrNyQ+EylIBj67xxEgXcfj2MPSHl
         h6RXbed+QzqawXGCXqatinSMKD2WEs1RexiqqcWOEbDAY1Tb2VWt7W554o8OmzYGr6Hm
         yx9KgHVU88EQoxNZ2csCEY5nJYoOtUNVMIZjaLRlsySGrPpQkraA/zNW51aTlPrlb3vl
         TGjWD5k3ghglAxeUM34hfDJH24OTs+A+7ZSWeVaHMMRoHbNTMjbsFBci36ENchBfGPLc
         O2P8gVyZJdMW52bR7OthTr9YAKbqj7soF+jmLoP7ctdU3Oidn0z56gMmk4HtR9V1rPOv
         l9Sg==
X-Forwarded-Encrypted: i=1; AHgh+RpEFWfPzi/cJw5VCQTIcszilCHR5HHPkz0dj3AvSGJR7IpBSy8kUCjy86D1S+UdROpbB6Tfv78eTSUQ@vger.kernel.org
X-Gm-Message-State: AOJu0YwnDA43oNI0EtFCuV6LTwcNMRksvBim05r4BuHfiA1lSHCpqbtC
	Qoum3WJOXwxiyX7TY61yKWAnZvUb2gSZ/c+EzOxuaLb/7Nbkm+BeqxPbPGG3Tdejd0vBC3a8Mtt
	HtG01gQmxHY8Tng1qzhv29CNU5IdtXEs=
X-Gm-Gg: AfdE7cm5fQ6Fs01zotZmfMIz9tHBjqEXrZzuL6G7Gpa2PvHiU0iWDgYHS6m6vN2qsSx
	ukd4yPlQuccgabyxnvV3Vu0G2mGtRlxUXdLjrWb/3ER76X0SEfLmoAfqZo6aNatAUuTg5jvMkFv
	Qar/T3Oox7npgQBdjGvAeN1RkYH68ZkF0Nh1fFuMC2kjxzchwOhcxhChwr7LLxQ3WcQMY6g9ExU
	Zlnjs09fk+DHI5ZcZ/PTFtwz31yLasVHRQL7FralBzl2is8FKGd9r1hO3D2m1BkLk45+RmJXA==
X-Received: by 2002:a17:906:4fcf:b0:c15:be34:4f3b with SMTP id
 a640c23a62f3a-c1667a4d06fmr686600166b.36.1784221065517; Thu, 16 Jul 2026
 09:57:45 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260716113805.593215-1-a.shimko.dev@gmail.com>
 <20260716113805.593215-3-a.shimko.dev@gmail.com> <c7193123-72e1-4bf5-85f7-eb68a4000c44@bootlin.com>
In-Reply-To: <c7193123-72e1-4bf5-85f7-eb68a4000c44@bootlin.com>
From: Artem Shimko <a.shimko.dev@gmail.com>
Date: Thu, 16 Jul 2026 19:57:34 +0300
X-Gm-Features: AUfX_myt8K-MKOiNCBXLzaayoMJWqu1RPqM-4-pyGDeT_aEZM_2BqC_iHc4p4CM
Message-ID: <CAOPX746oV1E2pH0Y_9j0JvoDkxeLxv3nRO5T10o_r2=vJ7JMGA@mail.gmail.com>
Subject: Re: [PATCH net-next v2 2/2] net: phy: add DAPU Telecom DAP8210R(I)
 Gigabit Ethernet PHY driver
To: Maxime Chevallier <maxime.chevallier@bootlin.com>
Cc: netdev@vger.kernel.org, Andrew Lunn <andrew@lunn.ch>, 
	Heiner Kallweit <hkallweit1@gmail.com>, Russell King <linux@armlinux.org.uk>, 
	"David S . Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, linux-kernel@vger.kernel.org, 
	devicetree@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Maxime,

On Thu, Jul 16, 2026 at 4:02=E2=80=AFPM Maxime Chevallier
<maxime.chevallier@bootlin.com> wrote:
> You can simplify the whole delay parsing a log by using phy_get_internal_=
delay().
> It will give you the index of the delay from the delay table you have :)
>
> https://elixir.bootlin.com/linux/v7.1.3/source/drivers/net/phy/phy_device=
.c#L3085
>
> You can take a look at the few drivers that use it (mscc, dp83869) for re=
ference
Oh, great =3D) Thank you!
--
Best Regards,
Artem
