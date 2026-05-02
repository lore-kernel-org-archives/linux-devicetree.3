Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DECE59463
	for <devicetree@vger.kernel.org>; Sat,  2 May 2026 17:20:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.221.49
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777742412; cv=pass; b=svwtBUZTTDVY2H6W5/rDp4q7joPVN7cblXPaOGwg1NQR4RLIlTToOEDZg1lRY/4+BJmjFCgHmgjPsO4uhhj8ZgyKTpyJ0akTItf8gFHhdiXAKAQADYTS81wGN70YPL78La9zfAe01oJLTjJousFqahvH7LFOnSE2ZNNmD0/+ADQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777742412; c=relaxed/simple;
	bh=U4m3BCX8C5MEEq5ER7adYDj3ySGow2OAK9QLy4yridU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=A4pCLueJJB/j+EMEYOQFu9YNJJIpO4XTqnWzFj3y/HJVRHJK0livoO9R3mSkEqTuOVyuDcJWswKtvLlWi0QV0Yu85BDoGaDtmsJ+xlU1sPzS29AdMKdTCZn2GIv8dz/pJtSS+kQk0IbLr2YsJl03Tp+QYU000WEiltm1THzTOcA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=nLr4e1US; arc=pass smtp.client-ip=209.85.221.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="nLr4e1US"
Received: by mail-wr1-f49.google.com with SMTP id ffacd0b85a97d-43d7e23defbso1562292f8f.0
        for <devicetree@vger.kernel.org>; Sat, 02 May 2026 10:20:10 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1777742409; cv=none;
        d=google.com; s=arc-20240605;
        b=iJWlFuopXKkVZM/QFSNVj06l9l2IXaIzML6Jg/snU5HnB0CVBFiqJaZPMKzD/V99SB
         HlSabz+I+eXw7njiqTvQGAmU4+6SPEeNZQU5hw50In0knMBWiPrb8yS1i7ZdFzoM5iX6
         SFP/P5dYUgiWqjtjeV99fhf8jEGBhvxKglPi6VnALS2j0UwR8zWdmGuDeaSFvOvlUSdL
         bmWm0Et5zqBFJk+9UlzUy0igJCBIQ04E2Kgdal2t9JEL5UMRoL7jmNUJva+VrSzjjX1z
         GBLeWXhQkS4uPxJEptD6F3+eOCAD4pIJS+wmjSp7AVaX9dAwnp1LTS+lbE/zKHYK/A5w
         E9Pg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=whFhBndJs8rNIwDbAnCZQ1mvUrLqXBGZtosZ49qZssw=;
        fh=Ee+1EKPrEsBoA03Bfd/SvvHB4+nBIFkbVV2aVN4YbGs=;
        b=VatbQUYKZSKtfkKLRm5vNkFG2CTOoJD/FqcnOJyjWfuDr0ox8ASVxwKRxEmNmkHzXt
         z14YIJBdpw4rmO201BXGcHAE1LC4K8PnusgfR3Ow4Y02LG/zuYpNRitRAwTYJocDTsb7
         ofiI/Uz/7jdMfZA9KCsFgt5RMrf7tuodf3rUh8qTWO7WF59CUGuvh6jmPMccsyg/wqlR
         WxD2eQUr82OYqDU31l5dO/Mb+fbjUINMZ3F592RmNbyB5U6AG54BIDElr5q6fJe/frKL
         UJKq75BCP5sqr7UHsgzCq/ZYZKozXeO2WNo0nFdybPKED4LrxpV7oKU8joNXvJ5blRVo
         Zg/w==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777742409; x=1778347209; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=whFhBndJs8rNIwDbAnCZQ1mvUrLqXBGZtosZ49qZssw=;
        b=nLr4e1US27NQjL/DxNYKxeSg+AaxGKz00YkB42tWJijOjzxjDv0Z8+QmwF2tjYXDd6
         Tb78zyDZniHKmDEr6sUewcQuzGU08t55kgWQzr1dE9/QoIU/xPHDKKnkpHoFSkQMXBiQ
         yctlzz+71kOOwsBHdJ/EP/SecjAzk8dgdzarSN9Et7sU5rlDfqflLbqw5F2Kkm8rrXNi
         OY2TTBU1R54WTAIWKXrHcy2Cm7e0MY5DwXwekrCNSK7JFy41j0+dfcbu+Upmkp5VBSyh
         T8OtcrHEC4N2tiLK77AepkxFbwVBxaOuGDWIaTmxPXRWD9eaddljumrnYaz3+0L/5bGB
         NiRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777742409; x=1778347209;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=whFhBndJs8rNIwDbAnCZQ1mvUrLqXBGZtosZ49qZssw=;
        b=MZEnmmyV7/vY3WqDswM7S2KnhscAvoUj/vjtQVk57V6t+8qZBa9mquAa6LhoNn1E2Y
         dNXS84ByGP+KWTuZZxYv1Muy2ZYBgdyO9L+PfOMtBCQ3IUT3Dhl3X92OfxwYCu+kQdqw
         pjLRpXaP8Q2rEAKWrDBU0vb+AjvJYr4gYcaLZHg9B2YiNPQXPn5EWAsdJf5XBEHS5Sn6
         kkENA80hcZHix+4+4jYH/k4OWVfmrMK3pCRdUvNBvEss+V+8gtBNnSRMVslYh5Pjx6Mr
         Jck5BPzH9irKgU2SndYK+dmaA1KcOmlNosdvkAILx5iHTyvPgdXX2zW9/PXLCV5PTeFD
         0YLA==
X-Forwarded-Encrypted: i=1; AFNElJ8QRaPPnap/C8A88RSk8r7onE65T2AfvGWJAS2TzW0SNnKoo5b3YoB3kN8HNwta8tWAuZhwAWgUO3kF@vger.kernel.org
X-Gm-Message-State: AOJu0Yz61IjeHa5Ee3L9lAERQBYMu/z5061fhRxFp5fZ7alRXCY5C+dB
	jSzAaifUqNj40KBP8RtoDkZWGAxUPhu09mo/waMHq/XYyfI5SxB3uv9+jxDj9AgtdXCsNKtihBz
	MGsABD6KQod3/f8pqk12lCT3mdpPVMJI=
X-Gm-Gg: AeBDievAGv70L2GEoLFkxykXV58kjxcVZfZeIpRnIUK6oWmhIPoNXlR+HA7UsA5Bmrc
	sG926RSLZRIC+0ix3h4TClCPGHjPYQ9JYIdU0/zSSfSxJQ2o7xxe+LZUOQETg4nCNqHa6y3o2/s
	19zWs3J+r8CkSSJjZTJ3rLijHPu01zbNHO7PIxjF/miSSJdrZMErypsliRs9sHZ790U1P7pUpnK
	R8akLGywz/rzFgIAMdrq60bNE8APzSDqMlFZPLjBJlxRhl9vCdlOTU8r5UMxFq+xRlzapPlE/4j
	R2B42SK9vJWqOdHbHhufOMTzEVPxcB+D+GnG2nQTKBMDvdAj
X-Received: by 2002:a05:6000:3110:b0:43d:1c4a:37c with SMTP id
 ffacd0b85a97d-44bb2e2eefamr6396799f8f.4.1777742409079; Sat, 02 May 2026
 10:20:09 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260429063712.2150938-1-gray.huang@wesion.com> <20260429063712.2150938-6-gray.huang@wesion.com>
In-Reply-To: <20260429063712.2150938-6-gray.huang@wesion.com>
From: Jimmy Hon <honyuenkwun@gmail.com>
Date: Sat, 2 May 2026 12:19:58 -0500
X-Gm-Features: AVHnY4I4aJL8bDrcLq713fIEFP6fqUjfNi1_05rQa4Z92_j9G-w3WDXUUfgZeg4
Message-ID: <CALWfF7K+g0sYLDQ9ROo1nGR9EADK44kVKQ_x=zonWD9eJLMDng@mail.gmail.com>
Subject: Re: [PATCH v2 5/7] arm64: dts: rockchip: Add HDMI and VOP support for
 Khadas Edge 2L
To: Gray Huang <gray.huang@wesion.com>
Cc: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, heiko@sntech.de, 
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org, 
	nick@khadas.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Apr 29, 2026 at 1:38=E2=80=AFAM Gray Huang <gray.huang@wesion.com> =
wrote:
>
> Enable the Video Output Processor (VOP) and the HDMI TX controller
> to support HDMI display output on the Khadas Edge 2L. Also, enable
> the associated HDMI PHY.
>
> Signed-off-by: Gray Huang <gray.huang@wesion.com>

< snip >

> +
> +&hdmi_sound {
> +       status =3D "okay";
> +};
To have hdmi sound working, you'll also need to enable sai6. Similar
to the update for rock-4d
e6066edc9413191479b05596ba06c40908f44e22

Jimmy
