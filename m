Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.175
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795787403;
	b=HSGY/2bfjaS7imeYYG6l+O33gXvz4AOucB9V/ZGSUVL57gLzSsi/3wV7D0PExpM18Ga9
	 gYsEx+YAAL2HIGR0OXKwp9HkR5P15RlyO2LVJa17x2yuomWIzdNHFxtHAzHgwNuyAK6u3
	 hhLMghzMdmggh0WdR13vOv/xao5HNzbhTYXsbvuyuhIeDX+L0/+xI2q4JsnPiywK/YZtI
	 30+MJjGEVIBm/5yO7zc+VS1kDgS7t86s/mv/5WQIMpYANdiPbCMSD+btbn1JGetv/bUxk
	 oW0RhjYfxiOEFGEcZ/V2mzrqHajvZJYBt6tm3DMbDhgWnWtKSal/Ve+1HFqgJ5V55Qw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795787403;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=EILx4C81IcuhQhfNn6eUO2v7ek7ffLRIIkY0aN4K7xc=;
	b=u83DkHqi+l5wLeu+FigKKS38ULA8XwmvaaGdDK/9gh0fTnCaSDk2JEiIR9PjLm3DTGP2
	 QEbDbBzkiji0F2pOP4iexGqhJqPx4rQjitjlKVvaVsvzPX5blOl9N+M7usxQzsWJi4zSU
	 +1zumgdjJ3GE8P9QUbjk1TFVVLoVefa9SJZB94w2+bsLyPo47IJ5DcztE0DvFu4P2on8t
	 CsIiFaH9dLAYLhBXvpDvHnFjjEibXpW8QBdmnFWPa59mHYP6bx1EuFiLPhAA/kdyz4POA
	 9bt5oW0uMppSDnYlYgpERYn91uHMsp1sky4X9ydph2inxTemzl3vnJ1gA6faArSBmeA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=lEeJGHVH;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.175
Received: from mail-lj1-f175.google.com (mail-lj1-f175.google.com [209.85.208.175])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 99612606A31C
	for <devicetree@vger.kernel.org>; Fri, 27 Nov 2026 13:50:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 99612606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=lEeJGHVH
Received: by mail-lj1-f175.google.com with SMTP id 38308e7fff4ca-3ab3b29a1d4so65196791fa.1
        for <devicetree@vger.kernel.org>; Fri, 27 Nov 2026 05:50:02 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795787401; cv=none;
        d=google.com; s=arc-20260327;
        b=M7xiL2KGcqCmeuPN+eFo6OGrwPomvU+C14ut7fPZb31U6H1Tfn/bo1b3w6/k623N4R
         5Lgw3tzu8a6lBvY2E/M4tJyJ0bUeUv/SK4B9fNDzWd789QlDztVGiZIRu8Hzj1xSmcIH
         B7fgjMM9L5V9hIu/dnM//cAHBK/xwJC6QtiNyM5+VLwdhloUECjYcYa3ctpyGOERUNLi
         cCUvanunGtX1mTOquOfEQ8VxsVGvisy5uqlb+4XJk6CeB+4ZtuBJrotBc2gkqOBfLIpA
         E7dSFf3Eqpmxu7t7TTk6btUQzoywuKK8l68J93ba2WPYk++o4NWzX2eeE19XDZthauET
         Db/Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=EILx4C81IcuhQhfNn6eUO2v7ek7ffLRIIkY0aN4K7xc=;
        fh=qyC0nbZlvqsWhpZ0flRSw/chaTCfb7lahrvsPhxaRp0=;
        b=E/gidqHhlW7YpWdextImAt1aVxydOrALROWgPLrfr0zeFp9nmSWuBO35dXYV7sKm3a
         xrXxUmfvzVDaKkBJRMRrW5m7RT7EAiIAXVQBo9UkBYZzNfEV7b0aJdlbDnzJgHSkNR64
         PiVXvVSLAqi0xug7OW/l8tFam/rGhX7U8VWFUmIihbupQeLCM45WMZS4fy8v5Yzns068
         5FvgTN0H7xSsld7QRlyVqR1B5jt1WAgzRPFZGmGnjQBjgixYyVDEsru2gz55h7Wbg46W
         yFUYXoyc9zVO1qSkH3wsCujue/3/FVP+0RuWaK8iR0cefPJ/nGH2a+boV+rlyPh17oPa
         APrg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795787401; x=1796392201; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=EILx4C81IcuhQhfNn6eUO2v7ek7ffLRIIkY0aN4K7xc=;
        b=lEeJGHVHehQkDw5MC7zJtSUaXXPlVVQ2pYqVaXLag6CFCjgoqsgWiajg7qoDprouuv
         ODxiHNZjov+QcD1i/SGwCsTIxdsB1pV85HyqTcT3/Cm5fuI9IbMS4CDowk0CR0ie6P/e
         3o6TYFXF/WxXOHFfhpdd0gpMwY3WzTKjdBldo+0MSMWILg8M8eacgE9VS/aP2PohV2nC
         nvZPtvxwJFJKhC3qwc9+jRpLIK7Pewm/CQuLVOuDnRIaOVZCGPodFmjgmF4JIYGj7M97
         B7iX1bSflHUJIRzingrPKi0HoGU1njcl+wD5A1uSISgQhcizlrpUcFWRZpohuEDyEryG
         hzWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795787401; x=1796392201;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=EILx4C81IcuhQhfNn6eUO2v7ek7ffLRIIkY0aN4K7xc=;
        b=VLFzwRLvPheeOFourPFvBqowCOfuSRhSKtQxUEBtg6O0qIBdhDyqLv4R+15D5OoyFm
         X43//8d9nvSLwSJ2Z4V0EkHjpXhkDY5TS7rHMNIcYayLe3ED0sInc0iz0N2qTuQWlTs+
         H+gr18eMeDAdJG2bKb4BoXFpL0qf0ZOLS0Y9cNIY9318FmZ8JnKxpJSXa2qQTlgJgKRF
         Sc0fRnyalFKnG3PhS/Nb8VKiWreIV/4k9SNo2Zv/0XngyuZsr8NpFPUxy7wbNyFtv9lm
         TqeAAIf7DiVgEbiXWQMjbn7UtdkvWOTZSie4R6mUN3/AGIXg8ZChzZv3BqtCTs6FDYO/
         yyUA==
X-Forwarded-Encrypted: i=1; AL+hErEuPNhj/iX0uHAc+ejW5Z6Vb7I/UT2PjPoTUxUYRSkkASRA5l6WCCj9eGwwG1N/zwgmbcUNqYl/B/WX@vger.kernel.org
X-Gm-Message-State: APuU4Z/iTM9KtJAVdDhS//nbeQDJhiV3JX4sdhcErZRjuHZ1v4zRgyAN
	2T9PGLmQCZ7fawzpbUN9y6S5xJKjvkf7HLqhKtDoL/25F6Q2MCOUEj2BvTwjbcAfWowtCl0+595
	asnNXvhj422eg1dzTb914aP8Vc+FbmJA=
X-Gm-Gg: AZFdTZdhNeusrA0kagbiTdAgYDOWqxM3EpXVIp8d+kAn2+uWXn3+JdgtmQKICAeKBSi
	kQyu887PAwenJTkssev5kac4x3y9kn6Fho5Ngpwdee6LHmaBpqrTbeQg/cTgk3gmv7zU0PrMRiv
	O+qzp2173DVfeqlPntSkdY4ra333OmEqUrucnlYIT6XobRwuMlj5UqfiY+K1uJr7+ApR9OhQeTC
	kciplTfD12angVlKPUYWKFeVWlDtpdFT1A4SDtczettwoT1WalTpf8qFb2ez8aIV29bIRrbJsWQ
	4FLCaomWUf7vJKBl7QrMACtrDkje/oGrisxqWO9Z+VXSlyvjvingRj3kryGEeFhC8vOM16m4ndw
	aSJBs6R3YwZ2L44xl4Q744LCua4ZWNeW5T/tX
X-Received: by 2002:a05:6512:3093:b0:5c1:595f:b370 with SMTP id
 2adb3069b0e04-5c1bc6d253fmr7284015e87.3.1795787400636; Fri, 27 Nov 2026
 05:50:00 -0800 (PST)
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261114020509.632311-1-jeff.roach0@gmail.com>
 <20261114020509.632311-3-jeff.roach0@gmail.com> <dd4e15d2-5037-4610-9a80-5c330f436263@oss.qualcomm.com>
In-Reply-To: <dd4e15d2-5037-4610-9a80-5c330f436263@oss.qualcomm.com>
From: Jeff Roach <jeff.roach0@gmail.com>
Date: Fri, 27 Nov 2026 07:49:49 -0600
X-Gm-Features: Aa3M54pHYzzfFU4Xc2un7T9P8fzKCah6MxwtII6nKZyi50ZBPS2sY1vNA4Vb8NA
Message-ID: <CAAnD8Rak9BJ2WTHxz+i3ETm6vJQ7EOy8zSfJa-ejoHqWidM6mQ@mail.gmail.com>
Subject: Re: [PATCH v5 2/2] arm64: dts: qcom: Add HP OmniBook X 16-cp1
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Abel Vesa <abelvesa@kernel.org>, linux-arm-msm@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Nov 27, 2026 at 6:12=E2=80=AFAM Konrad Dybcio
<konrad.dybcio@oss.qualcomm.com> wrote:

> > +&usb_2_qmpphy {
> > +     /delete-property/ mode-switch;
> > +     /delete-property/ orientation-switch;
> > +
> > +     status =3D "okay";
> > +
> > +     ports {
> > +             port@0 {
> > +                     #address-cells =3D <1>;
> > +                     #size-cells =3D <0>;
> > +
> > +                     /delete-node/ endpoint;
> > +
> > +                     usb_2_qmpphy_out_usb: endpoint@1 {
> > +                             reg =3D <1>;
> > +
> > +                             data-lanes =3D <1 0>;
> > +                     };
> > +             };
> > +     };
> > +};
>
> Does simply leaving status=3Dokay also work here? I think it should
> simply never enter DP mode since there's no altmode notification

Yes, that works. With just status =3D "okay" on &usb_2_qmpphy, a USB 3
flash drive on the USB-A port comes up at 5000M, and still does after
a replug and after s2idle suspend/resume. No PHY errors.

I'll drop the override in v6.

Thanks,
Jeff
