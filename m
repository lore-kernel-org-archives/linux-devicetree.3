Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com [209.85.214.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 122193859DF
	for <devicetree@vger.kernel.org>; Tue,  7 Jul 2026 19:27:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.214.178
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783452428; cv=pass; b=Xw4DpRDdoMAs4OXVPP5JlnHZ4P2mSp46YHTjm3ue7qizuf+/SeEHEsxOAXOLzBDmIkC3BR7Ip/OY6w29WhR/95wNz78AUGGiHOxCOiqiOsF6Krju4zVVbpGfIhGCv9KGgf01OP16tYmk93wnI2JSJBjZqbgGBw4gb3pAI2Ee2P4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783452428; c=relaxed/simple;
	bh=UgcC0RVl6Nt6QPS0xW3BWvWsGBqEPSdHq4xCHzzbh+E=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Ok4zsrsGs5qhUElA032DLnrcv6gbiU86bef5MwXnPc6EauVMd0EKoJz6PhuF0zu79ACfrwc99uawdZ68md42Bs2myRwY8KriSKq/3yHlRY6dfZVvBQMgFxc/9HkQkOS9ncSiOgejaWs3ylt1m43iI6XfDgBl/Af+G1uivvq8ui4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=googlemail.com; spf=pass smtp.mailfrom=googlemail.com; dkim=pass (2048-bit key) header.d=googlemail.com header.i=@googlemail.com header.b=rg1f4eXd; arc=pass smtp.client-ip=209.85.214.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=googlemail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=googlemail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=googlemail.com header.i=@googlemail.com header.b="rg1f4eXd"
Received: by mail-pl1-f178.google.com with SMTP id d9443c01a7336-2caced6038eso13286575ad.0
        for <devicetree@vger.kernel.org>; Tue, 07 Jul 2026 12:27:06 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1783452426; cv=none;
        d=google.com; s=arc-20260327;
        b=sXFVgCTG6Lbie+5FMBPdjp53c2BK6sxprn4O56kMP9C4+/H5NwFcjXhW7aV45CjhAk
         7UoTeaZxGyzSFg1c/cZKCgsaEaaRyd/QdUP8JoZ5YnsUrf1CFJ9ZBH2jcOE3uiuy4ly4
         ib6NvrnqQ5ywzLKycGFb4I33gBvSjsaYgqu6ozKYHMhe9j+34II5neptpWVHOghKUT2s
         jSspK2gjlyG/ryjQXSnWuGHSsNJJkKlU1vwIyTwUshzvFpLO+Tdd2AbUEkcjY55zYuOU
         fW6LO7iP6Fk3y+ZmWW/8YCh2A2YU43ydhgyYPEvWJCcLOmWeddq3SkVBADbmNPAPOTaX
         MRww==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=UgcC0RVl6Nt6QPS0xW3BWvWsGBqEPSdHq4xCHzzbh+E=;
        fh=CUZ2eyYGCzQTdFyi8ea8gLErHAkB3J/L0JWb6rWVuPI=;
        b=VghOQtQegX/aVEdh60PgeqdNYGL0yJBv6SqjHu/J7p7yao4t7MEo7ZGsebDYHa8PpR
         +VorlUKe15smDoIFWFbAOS+F+XQCoFirAl9i5bKRvfWkPdXdZeIa7QPoSplHbGctYrER
         zHgjj89K5Jz5Sz/5HYeNaCoFEbA+hI0O77X5qHDClIGfKrKuCuWjImhTcVNW2E19Q9xR
         GX03Vd0lGP+nwTgHVztfhIFfoiUPZiEANHwnAw+nDQeGDNMUnrPTUzGnoAdG21zlO9U/
         x9BwCL3UyyQY+a6f4MLD6CGb9gQZoEcsBfQilXpq7eWgDS8p6D8Oj6K5kSwPleS//spG
         R6IQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlemail.com; s=20251104; t=1783452426; x=1784057226; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=UgcC0RVl6Nt6QPS0xW3BWvWsGBqEPSdHq4xCHzzbh+E=;
        b=rg1f4eXdlOT6xBWH+NPQFpIyyo9QEqiBRdZk9OVeWPmcPCixPs49zvnsx5X8Tx5GIl
         UrI3rpT5vJ8iosXLyKN14GFZ3WMCgmpMAUsNYbfdHjv4XRk4+MKGIBcl9i1b/MxwdKzY
         daiyOC7hO28k9NpIiwUQkMSdm9F1u1ETWtYN0GMz1g3UVNAwQez4dzyzgeqSogiIqZXY
         cjPhYL30PnAaZJztKE8wEail7tAunHQJJU8+iT3DheQxHYT3z2P+Ye0jGs3eTXRaLc91
         wkq/LPm80l1/lIYRRDW/2kH09LS1AAoIiS7V2h8GWeye0OaDKpYUMb8+/RgB8eWj+GEi
         D1ww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783452426; x=1784057226;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=UgcC0RVl6Nt6QPS0xW3BWvWsGBqEPSdHq4xCHzzbh+E=;
        b=q4FkYo+Fzi4bUVefVuQwj37DBynbnyMvIrfMpTAvvsyX519s0+NfemXjRp6wi74UpZ
         +kxLtT03xU3OSR28L8pppiF1trwalbe0NcxiaqYUrBfrYkQXzejyo1SL1o+5pBgw3UfR
         x/3n8catwdV6nxhZWv6UZLrucGYqFj6Cj2HA5qc2r6DlPmlX+lDhkaV/P9L2awOWvxYy
         NIuJ8IuX1BRWAEMkC3Gh5Wr86DXmBXaipKi/PCl/Afz1+uEp14jey0G5ZiI496HGRzRr
         lHzvLnYkZ4EnbewLiXHZdHeC2w9DVsgl+Sn9Zwtjjt56hYGA1zSj0KIAr4ZGLDiPdNpy
         Uflg==
X-Forwarded-Encrypted: i=1; AHgh+RozhLzOfdvSyPjaOag/ZXSu2JjAwAzQAWviKJYnAqkiOtrTBOfi4jkaSP/W+TKZjqPiDGcCkr94jVvp@vger.kernel.org
X-Gm-Message-State: AOJu0Ywacrf9CVRPWcWBHDREymo6Y0NFEoGsxYPdl4rgtccFhI7hNgh/
	AXz4TWhFKSxgm3s/sCKys6p23ul9YbCTaSDpdNnLei7AQaRQtAgpcYkRf7QxYvKJUzEoD2l/85P
	f0/lLuP8U6ifosL3hD9riwMp3RisCjcI=
X-Gm-Gg: AfdE7ckgPD4tUHGaZ+tu8QpBbsBR2SVPBA8Kfw/iTxp0MgPx6wBeXJ+W1R1kXsDjZh9
	jDI9lU+gCmmyjtODrnGB0A0PkP1UOWmlxrBeSap66KVhQhWDCLrKufClX967Q1CFR2FbuIPANPb
	iZd8E4BDxVJIcTAc6rKS9Ap9RJLhGVrdhoZB314jUqlaP9kVlUPMk/WJLCRs1IRnSJ20gJIXI/e
	QoGoeyM2k47dUHGaCSLHH7+X/CkTxvWp56wybC9Oe6RpHb9wRPmiEIMFf1eLyEfVilfEQKX/P9V
	nwOMTh2aZnckhKGQHagbmtaNSQ==
X-Received: by 2002:a17:902:e885:b0:2cc:841d:cd7e with SMTP id
 d9443c01a7336-2cccad9693fmr37869045ad.21.1783452426303; Tue, 07 Jul 2026
 12:27:06 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260706-a9-ir-v1-0-4f082ca8aaf1@amlogic.com> <20260706-a9-ir-v1-1-4f082ca8aaf1@amlogic.com>
In-Reply-To: <20260706-a9-ir-v1-1-4f082ca8aaf1@amlogic.com>
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Date: Tue, 7 Jul 2026 21:26:54 +0200
X-Gm-Features: AVVi8Cc4p_QHwDWk0aEYAh_2ulyl2XezrYxvB4AQz2uBN1snV01ZmTjZPjn_E3M
Message-ID: <CAFBinCCv-pUivmW4_O5veamSQBApmTvbyGSrOBr14tsg4yf8bQ@mail.gmail.com>
Subject: Re: [PATCH 1/2] dt-bindings: media: meson6-ir: Add Amlogic A9 IR compatible
To: xianwei.zhao@amlogic.com
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Neil Armstrong <neil.armstrong@linaro.org>, Kevin Hilman <khilman@baylibre.com>, 
	Jerome Brunet <jbrunet@baylibre.com>, linux-media@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Jul 6, 2026 at 4:43=E2=80=AFAM Xianwei Zhao via B4 Relay
<devnull+xianwei.zhao.amlogic.com@kernel.org> wrote:
>
> From: Xianwei Zhao <xianwei.zhao@amlogic.com>
>
> Document the Amlogic A9 IR controller compatible string. The A9 IR
> controller shares the same implementation as the Meson S4 IR block,
> so add "amlogic,a9-ir" with "amlogic,meson-s4-ir" as the fallback
> compatible.
>
> Signed-off-by: Xianwei Zhao <xianwei.zhao@amlogic.com>
Reviewed-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
