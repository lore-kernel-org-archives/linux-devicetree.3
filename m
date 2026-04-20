Received: from mail-vs1-f47.google.com (mail-vs1-f47.google.com [209.85.217.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 151A53783C4
	for <devicetree@vger.kernel.org>; Mon, 20 Apr 2026 09:54:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.217.47
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776678882; cv=pass; b=ePcuD0O5jdF0BFPiWt8XsExWsfNAgG119VGoemKqHt8ijVUM5o7cj4L8SHhs/wQjAXC5bx6KhTr1wGrPtWWVxBmUdGw3mSxDis2UXW4CL70fAFMGH4e2RxyeYDkhDzfdRmMx9arm+jZaPSrPiFiXLvtmwg7PVvpjOzeFvEUpTfI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776678882; c=relaxed/simple;
	bh=7UvExbIeD3tlsWMAYfT1uc+7TrjaOP43XMCCIIitSK4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=L4SYCjqtiF7NEzCWDzP38hnb9PusmT+nidSdl3IzxF+9G4syFVvJUNTWHnnncI8cWi2Nqz3ZzvP1RiAKRH6roJV91psixOPs70rVeiA92/eG2YzDr3lmtFMwcyDcoipwxXhgpCPApFFTZI6rdj6r4yVH6ycwsszksNm/YTWC/Qs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=nlsYNnM2; arc=pass smtp.client-ip=209.85.217.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="nlsYNnM2"
Received: by mail-vs1-f47.google.com with SMTP id ada2fe7eead31-60fbeeeaa7aso1707601137.0
        for <devicetree@vger.kernel.org>; Mon, 20 Apr 2026 02:54:40 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1776678880; cv=none;
        d=google.com; s=arc-20240605;
        b=CjMeP0tm5OchWRYuTTTiZpn6tTqhRr+5so6K2VJfPjkjmBYnvjQm4FUospuVLGKNp2
         ENotqc7MdfWQnAHXcsAHu93Nxn1OSdN50rCbor/FBuOfRaiESgLxODJ40xCwnSOtvnUP
         n0Lm84JDkPvIS9fMwVzuaW/80W7UrAShJcaIt7BU7mqtHKLbwGlnfi198z2hUZOs76tP
         7ZIbyp3YTeOE6GdQY7n0b3kLyxTYSia+d2//8XTMrHRFaeG6bpMaz4mQvGG9ytZSrHUe
         gUHjXhsHv4RL8tgVaj5h4ahFDdcF4szufajrLzYWnwYNYsJZCtVl9jiL2gQpT/7hk/I0
         keGw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=4d2tN5ITOouglEb8hvRsznm+CPRPu6AedRhwFpCSryU=;
        fh=lYKjkoL6xWU7qPtvmhyNdeNxipwnFzmJ2YJce1AWgjg=;
        b=gYsRlwrwjspKBo4ac+sGKkEDVaAyMzguhfy8G/fyXEBZyMFrCk6+olW8WGrDLCiHk7
         1A/C0P72NiYSiogsj1rAtGkBjc6Lbcqn+7sjjxwH3sWD6MhZNfCrLyseMhQXkf9RWVtU
         OkXxJl4xRgdJeQke8e+Ij5/DphQn9CAgPhD3mbyQoN62bxNyrEo6Wr+0SKmklocYIHqo
         HqUlUKm439mjpB7sPsaKNCZh647ls7iag2N/48FINODaM3jsfHi0yf3lw57Ywt0Vpg6G
         qEpETbq4XfhU2yBYNZcL0IXbSf4vM55XeCEBocw1OQrOIkmHpjTceVdoHj9N26R82gym
         TD+w==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776678880; x=1777283680; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4d2tN5ITOouglEb8hvRsznm+CPRPu6AedRhwFpCSryU=;
        b=nlsYNnM2O6dXdIejt/3Xmf92//ez9DJxREJhTSgKV4i80ak7L/tPcCRJ6wNvEuzkLl
         J2yLQNBHyrgXUDdMks5fP9/2BIjptc0lfhS4XQU2yDKzzezcqfb0OAoftRMmJIshfNiY
         t5ajr27I1JfxAGDJyukQLO02Yor2XHGf7gzf7fl71Zrwab9Q0vAZy3FGB5YrzyovOwO0
         ldbbC+d6XOqGokt5vaUEiIpH0S0njq7aumj1BmJsSAs3qxIPlmuqmhJobPVl7DT+VWdl
         677tGGj6DfrwCD2JtKkVScQev2yTGW0WoHxijhsPfBAA1Na5P2A9JPUdFv7WYWJxbfid
         +lMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776678880; x=1777283680;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=4d2tN5ITOouglEb8hvRsznm+CPRPu6AedRhwFpCSryU=;
        b=iVOz5Fet3nmYK3oMTPO+gaQhVl4wUS/hCrhstU211n/DZ3DdPxNbJZuKBS9FPYqL1E
         XvGbzCc5m9lWLX6JXRjU5wnwuPfVZGl21sT0B6GJNwyHaTgu+IzMUjRm+lKCITyud03E
         2BkLty0NPRFQ0HB2TvQvtg5lYut0SPmR6FD8oxOS07pZ+6/ZXuW3Pn1txS1L3PUpfM5g
         mTHnRyjqP7r/8msW5iUbFJR9EzM8dDIdLgpKdW8yLgoeQNNvryejCBs5A2081CgXTw1g
         buIR2v+DGzlRsY74PqJVzQbIIH5VU5so4RndVypViAWzok0btmMpSyB9tDDCkINdW4ks
         XnOA==
X-Forwarded-Encrypted: i=1; AFNElJ+FOSiI4hZomqmgL0ahPI7ywiPQcjNkA3viqfviYDf/lXqdNDVvtOhZo2Z2RhGAPqH/NHDGo11e0QEP@vger.kernel.org
X-Gm-Message-State: AOJu0YwG/uiKsGevPFkPkLch0bG3gjzEXjFNsmufPYamPfQT2VNFcLen
	lSEF7trjQHTfkLEmbXDH0L5goJaAmZqdWTFKmeJxWKqLS3IueSIRajkEZL/zKIHm+xOgkK6V82S
	I1spqb7mNWukUPeo6c7lPFKA9TRWlIFg=
X-Gm-Gg: AeBDietBhUB//EpZDRowuQpct10zZ9Xp28HeiMkRxYN7oa+zoc/MaBrnal39XfXd/8j
	HSI1+AUUoqCqgmO3IGqN6Ht1G2887IygEIywT2QDmaSM67Hp9FvJ0LqnXC0edt23tajUe4zS/FV
	QHy+F4re+fxOKEf5BwMNr/qwWtgfax9d+Ua1TNHeLfnnGbMpcHMIXwKVY1AWTu3ifa1+90zf759
	TStfNP9OkBhF8BDkox1pRi2P6AjfNkLl9rWDhfNLGoIr4yrQLGt2uTZekl54WtgeC59nXGYPCgx
	I9/llnXKaOnXVtmtA2BMPucFyZpQFvnEqX4BYSory0MLjDkXiw==
X-Received: by 2002:a05:6102:2926:b0:610:76c6:b74a with SMTP id
 ada2fe7eead31-616f67c64fdmr5489740137.14.1776678879944; Mon, 20 Apr 2026
 02:54:39 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260419173251.1180026-1-mitltlatltl@gmail.com> <4abb1626-a0a3-45e1-9289-fee366a8d9f0@oss.qualcomm.com>
In-Reply-To: <4abb1626-a0a3-45e1-9289-fee366a8d9f0@oss.qualcomm.com>
From: Pengyu Luo <mitltlatltl@gmail.com>
Date: Mon, 20 Apr 2026 17:53:39 +0800
X-Gm-Features: AQROBzBhXvAo0BDTZ4zuVvzNm5aZMhjKtq6C0HLFOMa4Mr59QCzjQGURp_WG5hk
Message-ID: <CAH2e8h4bMve_hfW6VXynBh--DgwW2v8=XuVpAzUoS8N_73ZEhg@mail.gmail.com>
Subject: Re: [PATCH 1/2] arm64: dts: qcom: sc8280xp: add several missing pdc
 map entries
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Apr 20, 2026 at 4:32=E2=80=AFPM Konrad Dybcio
<konrad.dybcio@oss.qualcomm.com> wrote:
>
> On 4/19/26 7:32 PM, Pengyu Luo wrote:
> > pdc 215, 256, 257 are missing, but we can find tlmm pin 103, 84, 90
> > are mapped to them respectively, so add the map entries from pdc to
> > gic. These entries are reversed from .data section of qcgpio.sys
> >
> > Signed-off-by: Pengyu Luo <mitltlatltl@gmail.com>
> > ---
>
> Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
>
> Konrad
>
> The below change on top will fully align it with the data in the docs
> (no functional change)
>

Glad to know. Could you please help to check the tlmm map too? When I
was parsing the binary, I found

tlmm 65535 =3D> pdc 70 =3D> gic 520
tlmm 65535 =3D> pdc 174 =3D> gic 733
tlmm 65535 =3D> pdc 175 =3D> gic 734
tlmm 65535 =3D> pdc 176 =3D> gic 735
tlmm 65535 =3D> pdc 177 =3D> gic 736
tlmm 65535 =3D> pdc 178 =3D> gic 737
tlmm 65535 =3D> pdc 184 =3D> gic 743
tlmm 65535 =3D> pdc 185 =3D> gic 744
tlmm 65535 =3D> pdc 186 =3D> gic 745
tlmm 65535 =3D> pdc 187 =3D> gic 746
tlmm 65535 =3D> pdc 188 =3D> gic 747
tlmm 65535 =3D> pdc 194 =3D> gic 753
tlmm 65535 =3D> pdc 195 =3D> gic 754
tlmm 65535 =3D> pdc 196 =3D> gic 755
tlmm 65535 =3D> pdc 197 =3D> gic 756
tlmm 65535 =3D> pdc 198 =3D> gic 757
tlmm 65535 =3D> pdc 199 =3D> gic 416
tlmm 65535 =3D> pdc 204 =3D> gic 462
tlmm 65535 =3D> pdc 205 =3D> gic 264

If 65536 means the pin is missing, I will send v2 to remove the tlmm
map together with the pdc removal.

Best wishes,
Pengyu


> (yes that's a removal of one irq mapping)
>
> diff --git a/arch/arm64/boot/dts/qcom/sc8280xp.dtsi b/arch/arm64/boot/dts=
/qcom/sc8280xp.dtsi
> index 761f229e8f47..23e80c765384 100644
> --- a/arch/arm64/boot/dts/qcom/sc8280xp.dtsi
> +++ b/arch/arm64/boot/dts/qcom/sc8280xp.dtsi
> @@ -5310,7 +5310,7 @@ pdc: interrupt-controller@b220000 {
>                                           <66 438 3>,
>                                           <69 86 1>,
>                                           <70 520 54>,
> -                                         <124 609 28>,
> +                                         <124 609 27>,
>                                           <159 638 1>,
>                                           <160 720 8>,
>                                           <168 801 1>,
