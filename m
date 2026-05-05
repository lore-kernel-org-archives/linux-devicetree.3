Received: from mail-oo1-f50.google.com (mail-oo1-f50.google.com [209.85.161.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5FD892BE026
	for <devicetree@vger.kernel.org>; Tue,  5 May 2026 20:31:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.161.50
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778013063; cv=pass; b=YcMrNWGgXDiBpYq7CnC+kCbJ1rz17hQ6utKbXMmZEFgL4W9xdEs1H5ZwhyIU63DGKEOI3+onS8ob6LRgsbI9pk+b+YFtAD7rWIPV3FDQ4dTVZ4AH3lcmXJ61AATK+kR8IZDGHma9g+BZJS2xqjWjNhn590G2bpw8I/OyVIDShDE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778013063; c=relaxed/simple;
	bh=XWiaguT33mFKTHX+XCub37wPb4gjq7oRFtLlclQ4EBM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=HuSzfD8KJh14KZu8XYh0WT0aBGrmI9q92vg2xWnqk/JMP9W0smyT7utEv8BdpsZ8BaJQ8+U4SiFNx01In1LsS2kOcELjC+l6o2/LDxCSQ2WuSOzPkfHDtIUleLF2bLeQQMhQqZQ5UFm43HHAV6p3D9sVCT5W6xmU2wbxuttAKQA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ausil.us; spf=pass smtp.mailfrom=gilmore.net.au; dkim=pass (2048-bit key) header.d=ausil.us header.i=@ausil.us header.b=EwWSZdDc; arc=pass smtp.client-ip=209.85.161.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ausil.us
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gilmore.net.au
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ausil.us header.i=@ausil.us header.b="EwWSZdDc"
Received: by mail-oo1-f50.google.com with SMTP id 006d021491bc7-692205ca402so3038601eaf.0
        for <devicetree@vger.kernel.org>; Tue, 05 May 2026 13:31:01 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1778013060; cv=none;
        d=google.com; s=arc-20240605;
        b=NJQeoZDcHH1wfL3pWcmQdNaoQ+DxbLDLWuOsmQXlC+r9YNFxobjPnkKxg1MxgqAxjD
         AbjOwpKzuTL9BVO8LzH01lU8BuF0Gwc6F4ND5tk498LNSD0KtHg0c3n7fytf7ToX7RdW
         6PHuj2WFN7YQJsGC+x/m8RGtWW1BI37xdRyflx3bZ+0/bsM0mq5xqculAG2mZulfXXo4
         NjsVcfRvXFtB6PAcGl4VKa8eMfIqGgTwOuWCkFrGY/Vvza2Ak2lhvMbjBRFPyoJORaw7
         yM9NRQRO47BgLLeI6MLjb3GY9guw2oMR0YLODYmU6QyV41Sd+fK18uRVSWw7nvwIjlGA
         4j4Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=XWiaguT33mFKTHX+XCub37wPb4gjq7oRFtLlclQ4EBM=;
        fh=6TGc2qWZLMUKSZwgETlIzl3saI7ho1GeEN+53FW62Ek=;
        b=fhyXPTsAOneSOGKUbMbpv56HYiXA/VyUarR9z7Fh2zu7pKTpf0oVY6dtoeA5bOXU7W
         2PABWWq+GM6NpdIVmaLmQgpk+V0PWT/s7nNLbqFw7kLW2C/hMag4J0xB8dszw+UpGQEo
         pMa7FbGqg3eeUWzlfPOnZLGtRSVu3B8Adml/+wslP7bJimEY50SWIF3JY8ZrpcUDIoOx
         nsRCryaqbGo8DxR/SqpsgM2R6Y/ShHH5VuV2lIkfRo7LwGYcUZBwkbu00Ml/Nu/6n+Hg
         f9+/AMnoiII2KgZhaFu6yWJmvFyIWezH8DW1OzD7UU5gxAB/sBjLQaIkk+KLQucKOqPE
         0yCA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ausil.us; s=google; t=1778013060; x=1778617860; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=XWiaguT33mFKTHX+XCub37wPb4gjq7oRFtLlclQ4EBM=;
        b=EwWSZdDcKIblfVQKsk7V88bUs2fBQV+nLxaw/b3jHjlKQ5qLfivFmS72bhbHAGJXvP
         RmRseND4RpNzyMYvGKqObO+XLEPq4OtbSzhiNmGtFjBSCG7UdMdLuZTTkFBFcwisJ2ek
         MwsBdLJPDZwIN7LU7mj0KztrmsdFzLyfvcC49OC0FUBYzsM5j3bPN2s9lN4NCDvDpRCE
         cw1EhPgbuXf1Jx9jYB0ggz24cCkVXWttJAXDv4SH9KfRqBxOdgHzUTflrYHpNLrM6P3q
         B5asNPbkmAOE4fLzkMciZk/XhP7fANjyngMPP7qlOLNxVsczsMPb5XGoc+cXF/mt+Ii5
         V/RQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778013060; x=1778617860;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=XWiaguT33mFKTHX+XCub37wPb4gjq7oRFtLlclQ4EBM=;
        b=bvGq6GkmGRVimvGacbgW660blQRr2r6h6kMS/SWknOinII4mJIfdlCJpUX2PKE5Mrx
         0p4ds6xIASzuDhrcTzcc8/ZUqjdBFGjS9WfQgYK3AjELRZL//t5Waki1l0Fl5HVuFNzm
         sYx4tfN6fwSN5zn7jqq3XRELcOsM53gbYT7B8QZIq9kufVQr8aJyUaLR63u/4Z8NMgMK
         iOoxQTCYtyj/LYEofspjSRkFCPNWCUKzSoZSvimf/5bDB/3p0BkptY2+K20NluXsW5zs
         cucP3lvUTYgrULqbb/dMXbZPXsw7ZXO8hON+IciqyKXziN4zT5u/sNtNyBaaKzuP8KDN
         DxkQ==
X-Forwarded-Encrypted: i=1; AFNElJ9AbO5jEIYL80TNQk8CGPf6QpUbWhLPI+TUYZ/vUEkQuwW2GAHKorEQFjiEH2V6ikmNkfJH8G2wdD2N@vger.kernel.org
X-Gm-Message-State: AOJu0Yw66gxhfgPv/xdEucs51/gelGGndN0LrkQzCy13Q7WtH98XIID5
	iPGvjAjgUSaJYT+L8bQ4fulejISWcUAAN/j5yLrajIMMdIKP1BxwA0yrT2dpORDdMtxeCBef+mP
	zT4ArKGaAGRyd2d07p8O0dmI5FuOl89UMXUh1VbB/Ew==
X-Gm-Gg: AeBDiet0hOPMebAkaRftARhwlwBmnsCwoVD1QA6T8Ky6rEvt2mpxDfCeOUeb+7gGgzE
	4ZkO0PwSwvyleXd/ij9OHTq5k4PDEQ1kcdcwTnkPadEvQYQkqtCBoZ8l6s213IUTOiSK6bsI2iu
	E4hE21sG+PlZ7FbD4S4MIewK+zLqi4zGq+X4knKo0jFJ9eybf03dOCNCF5ZLFcf/ATJd7Wjsae/
	qjkQhtu/QX7RZXSGMPU6FQK9Q0v+AvTMPRC5PScNCCwqE4izUVxFYZ/CKbc/BtaLo6M72c+hO4F
	51ZsmYXlpyYMzEDzoU9+WdJXJge7+GZpP6lrTNaHNEWsMMqf03sib0x7YKBLzFJ6asbhvsp2DEW
	w0BtNiQ==
X-Received: by 2002:a05:6820:612:b0:694:914a:ebe1 with SMTP id
 006d021491bc7-69998d496f4mr230276eaf.47.1778013060106; Tue, 05 May 2026
 13:31:00 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260429024737.544813-1-dennis@ausil.us> <20260429024737.544813-4-dennis@ausil.us>
 <26834823.ouqheUzb2q@phil>
In-Reply-To: <26834823.ouqheUzb2q@phil>
From: Dennis Gilmore <dennis@ausil.us>
Date: Tue, 5 May 2026 15:30:49 -0500
X-Gm-Features: AVHnY4JYRhq_p9ta-ys9Z6NemjXvr6rGjpeyTa05lQ2fOW4hQ-wHeaXjdlyGa24
Message-ID: <CAABkxwtJv4VrS+6kdZ5c1QeuRtnKaFJir0=B9xsqirUiai+iKA@mail.gmail.com>
Subject: Re: [PATCH v9 3/4] arm64: dts: rockchip: refactor items from Orange
 Pi 5/b to prep for Pro
To: Heiko Stuebner <heiko@sntech.de>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Jonas Karlman <jonas@kwiboo.se>, 
	Alexey Charkov <alchark@gmail.com>, Quentin Schulz <quentin.schulz@cherry.de>, 
	FUKAUMI Naoki <naoki@radxa.com>, Peter Robinson <pbrobinson@gmail.com>, devicetree@vger.kernel.org, 
	linux-rockchip@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, May 5, 2026 at 12:36=E2=80=AFPM Heiko Stuebner <heiko@sntech.de> wr=
ote:
>
> Hi Dennis,
>
> Am Mittwoch, 29. April 2026, 04:47:34 Mitteleurop=C3=A4ische Sommerzeit s=
chrieb Dennis Gilmore:
> > The RK806 PLDO1 and PLDO2 outputs are wired differently between the
> > 5/5B and the Pro (PLDO1/PLDO2 are swapped), so label the PMIC node
> > rk806_single in the base dtsi, drop pldo-reg1/pldo-reg2 from it, and
> > define them via a &rk806_single regulators augmentation in
> > rk3588s-orangepi-5-5b.dtsi. The Pro will supply its own mapping.
>
> I guess my only question is, where did that "single" come from and what
> is it supposed to mean? ... I would've assumed "&rk806" as label would've
> been enough? But maybe that "_single" has some special meaning?
>
> Thanks
> Heiko

Hi Heiko,

The _single suffix was meant to distinguish this from dual-RK806
designs (e.g. EVB1/EVB2/QuartzPro64) where two RK806 PMICs are chained
as master (pmic@0) and slave (pmic@1). I wanted to signal "this board
has exactly one RK806, not the master half of a pair."

You're right that this is unnecessary =E2=80=94 the EVB boards don't label
their master as rk806_master either, so there's no established
convention that _single is part of. I'll rename it to just rk806 in
v10.

Dennis
