Received: from mail-yx1-f47.google.com (mail-yx1-f47.google.com [74.125.224.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6AC1D33F394
	for <devicetree@vger.kernel.org>; Sat, 10 Oct 2026 22:00:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.224.47
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791669653; cv=pass; b=fhcluy1gBJ+bW1ktw4tJt6YTchz4SXFEHhqBEmyFoOmoUnlW0bdWE6Z3y82y8PwiEY8Q3SjcY+29sNzcmtW3qb1Z974aQDbkUI7KK/9NSdy89EImUgw0LfkHG2JiwwfMUwGb6tvp6ZRAwTJTc5R7pia9fb9OHKkcTbVn6WABUsU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791669653; c=relaxed/simple;
	bh=VsLa3yNmPbqAsvOEv+girJFBtwqO7wp3UAIL92BqneU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=hYNIjx9KWzThH8uo7qORl5vU8xKnixrMd/+m3IyK2oGpJKA1ltXdKvZwnvNBYxAlPVHPKpe5BIu1mJqtqUE1SgCAJX3gAuRyu7imrRDK/4sOsFCxrWsxdfrjZMNK97tpmvQkHzxukvfPgkHM/Zi4af/Z1JhwwDkg4QU4s4uPkSM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=googlemail.com; spf=pass smtp.mailfrom=googlemail.com; dkim=pass (2048-bit key) header.d=googlemail.com header.i=@googlemail.com header.b=Z+P3lxY2; arc=pass smtp.client-ip=74.125.224.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=googlemail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=googlemail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=googlemail.com header.i=@googlemail.com header.b="Z+P3lxY2"
Received: by mail-yx1-f47.google.com with SMTP id 956f58d0204a3-677dbe051d4so647119d50.0
        for <devicetree@vger.kernel.org>; Sat, 10 Oct 2026 15:00:52 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1791669651; cv=none;
        d=google.com; s=arc-20260327;
        b=lZyEQuInos408pRL8AtXoXMl0Yj4V2bZrKEajUGw9twIlDVXez44aztFCYWmqN7jdT
         SObAdgNzs0RcseCcXfvIX+OE8/u5l4JJpJTllHzRKW0IJmqaE7xqon5zcpMuIZSC/f3b
         22WQhOQv8fGuM7YFPxlH01TC/6u3ufGleEmyzsOcOgaJ7FRhvAReZZ4AIEYrXaQboeq9
         VQT7FuABHA4Hb5BSWeBliEsSQ56AMcKCvg36kgLDsuCZegfrIPT00tx5Fz3ODhnHHSlB
         jW3jTSkh0uJXclA070bUvHi4z9TrJ6K/DymzXVPGrkZQJJGcbvKcw28KlVoWSgOMae4V
         rRiA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=viEI3bB6GOdsd4kqZvlb/IfnNxfAW1h37zzw5ogvS/U=;
        fh=qN8mRw1ijOmlNPibHTcP0deTLmuPAK9sBo5m7tXFs6Y=;
        b=AesXe0YJ2wHLs7/BoYr+sdAhU64TKiGGf1at8BfZRcYb7H79NM0l333/vgIMrEKXD5
         QPj+e1eCplQMybmXbgMUnb7OYhCYPTwRuBy0vG1ydbBXUoXyxVmm1wcTRNLR2vJGJZ00
         114jzmi44V+3aOmIfTDAVT3S7G9Tygvn8lduOHnEKUD4S+R/e5ISgr4nqnc3kNCVda+O
         iUqlI99qG99hX0iQLzBdJ2rnC4yFn7qqjUIfSuIUo1aitsEgbYdP3zA2oRSFyhAG4V3K
         qSPN75EY0ooVvnUlfD+86wcSAnw23ou3jl/6FYfB/PsAV3Ug65YxEXTu8DIZjoNBy01e
         nqBw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlemail.com; s=20251104; t=1791669651; x=1792274451; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=viEI3bB6GOdsd4kqZvlb/IfnNxfAW1h37zzw5ogvS/U=;
        b=Z+P3lxY2zcf3Kb5thIym1/9pShU4pcsu19c2lYcYTIM4vhCVFK51rQVCb7734VU41k
         dqI+fbGue/8Cucl8f9uyXI/zYAaAJ4Fv2gm5rFFrCsQOhLi5VOF1Eow9TdguabLJmH8h
         brz9+JrfAF4RkW0hKjsku/7aCEZUpRN9iON6kmJX2PCVFWv662FKwFkAirHlwxLrser/
         xGyaQ+GHPIyhCTSzVa2cLL8pmlcM/ulykrmnT/OiyOXfJFJVXr0AgpU4ybSVQ+b9R7IR
         YkUg/AyxCu6sFxqOKZE+3HrmYiscDx+dDICnmpJ6YoFm+ElDyi3gOTlwPFat5FeCBNa8
         8PBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791669651; x=1792274451;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=viEI3bB6GOdsd4kqZvlb/IfnNxfAW1h37zzw5ogvS/U=;
        b=wAEYT4l10EKqTey/xA7Er9nVQhny1GbDhM0UUUlTFkNayVcbJ6aIUDri7FSISJazJD
         IDV/4YOhrOZPAQX+S50oh8z6rC0okKbKGM3U99PBQ77s6csRr3qoEEn2GpR5umwqkqbc
         mU1ZGYRsX4y34Kl1HSFhnEn3Y97n2U+Y2Nl61raT9jSZRlAgT1FbfmRApvtn5irS9zpA
         PR58CQQYTdp7/fg/UrVQkgCl41N1UdyFknQlloID79CcdDVC5cPAhcrhJbqVTy+b63Ih
         KjQSntlJ2meahUQWzgcqfzMfYH4XEMtXHc6hsUYsmATF9Ss0KZ3H5+jEzuRePfjlSkKv
         NRKQ==
X-Forwarded-Encrypted: i=1; AKwUvBx1lrPTR4Td2xBu8Wfp3TbQumzMnTD/qYFF1j5wMG8659v1wFJyWzBXFO1XZDNgX/xCqfKf9MM3158Z@vger.kernel.org
X-Gm-Message-State: AFq9FYLdCLQ6N2qZZ+X1a0db8x8AwcYlwpRkb/GWKYTvWpJ1dr5tDpC6
	R6DzR7NntvxUAt4KTqswLzhp6T88rNpDSEA6ikjqMnsfKJJahx/OtNmxlTyYQRotj2IRNyROYqQ
	zAjQlhvPFWGzHeOhi+ANxpyBErY1hlXs=
X-Gm-Gg: AYBFou38VYjc9k43pJKHQEbA1X4XcTFw9AmF3pGTKRlBOCNyKa62zC4KV0VStvjDVmO
	vZ+M0sW4H8sNOo03GvUz3jau/PHNrZcLv0Makwh4/t+F5Ue6mM+N9kFtLl/jHfC2w6yuDJdoPTE
	sptCoajoS930k1Vyn5RFO7iD3n3xRXw156OyTzMduPnx+00NDGG8OPLZd6XRqiwfcdYsZbSa4hB
	CzZ5CczCLZq9whqxP+epM5z9Gh3q0XpBKVLP5wBFQQNCKwkuseoo/bngJe0qhMyGCp3LqjlguaB
	7kjcaAq+lCjThC3Y4dXKRjrXrrzXw1mUfPsRz216R6d6/W97J4LqezrmSN644bKSvquMHTBlqLK
	p4lnIBXUFNeJq
X-Received: by 2002:a05:690e:810:20b0:671:5206:72f2 with SMTP id
 956f58d0204a3-67936049a53mr1141845d50.56.1791669651100; Sat, 10 Oct 2026
 15:00:51 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20261010105900.247342-1-tanure@linux.com> <20261010105900.247342-8-tanure@linux.com>
In-Reply-To: <20261010105900.247342-8-tanure@linux.com>
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Date: Sun, 11 Oct 2026 00:00:40 +0200
X-Gm-Features: AclHuK-1AFCBBfJ7Kfb5Ikey6DbHIu9yDPTfwBVIgnuMS2JnhjeqsjRPSCAltBs
Message-ID: <CAFBinCC8iKESoc2zEXJMEmqk0cwWbVap-a2KcAtB7-KFKO9Atg@mail.gmail.com>
Subject: Re: [PATCH v3 7/8] arm64: dts: amlogic: t7: khadas-vim4: enable the
 ethernet port
To: Lucas Tanure <tanure@linux.com>
Cc: xianwei.zhao@amlogic.com, Andrew Lunn <andrew+netdev@lunn.ch>, 
	"David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@kernel.org>, 
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Neil Armstrong <neil.armstrong@linaro.org>, Kevin Hilman <khilman@baylibre.com>, 
	Jerome Brunet <jbrunet@baylibre.com>, Maxime Chevallier <maxime.chevallier@bootlin.com>, 
	Maxime Coquelin <mcoquelin.stm32@gmail.com>, Alexandre Torgue <alexandre.torgue@foss.st.com>, 
	netdev@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, Oct 10, 2026 at 12:59=E2=80=AFPM Lucas Tanure <tanure@linux.com> wr=
ote:
[...]
> RGMII needs a delay on each of its two clocks, and on this board
> both come from inside the chips, not from the board traces. The PHY
> adds the one on receive. Its transmit delay does not work here, so the
> controller adds that one.
[...]
> +&ethmac {
> +       status =3D "okay";
> +       pinctrl-0 =3D <&eth_pins>, <&eth_rgmii_pins>;
> +       pinctrl-names =3D "default";
> +       phy-mode =3D "rgmii-id";
> +       phy-handle =3D <&external_phy>;
> +       tx-internal-delay-ps =3D <2000>;
You're stating that RTL8211F's TX delay doesn't work but not explaining why=
.
I haven't come across this behavior before and I'm worried that that's
an issue with a batch of RTL8211F.
What if the previous/next batch of RTL8211F will have working TX delay
again - wouldn't that mean 4ns delay in total unless the RTL8211F
driver is changed?
