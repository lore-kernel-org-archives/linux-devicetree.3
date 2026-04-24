Received: from mail-ed1-f54.google.com (mail-ed1-f54.google.com [209.85.208.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BBF703385B6
	for <devicetree@vger.kernel.org>; Fri, 24 Apr 2026 16:01:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.54
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777046484; cv=pass; b=CB/u/XvgM1LdlydBZgZ/MhWt48HWA1rbOF0MVHjNNuEh7mjavPY9KGoC38ZrgBuGhKKWpLSiXW8WFFNXCs84a6YkYsC6x6nGgYRcpWSj1tLWUGF1mhvTQX8SH3cmgoXK0DuK1/fzOlyJZGqdpafEDrJT6eroWQN9RHLg0Tt1rqc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777046484; c=relaxed/simple;
	bh=IhksofQUr74ZsxiIixsYA9xW8rryL44gahMx0PQ5N/Q=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=e5/FyA2RGQh3xE+OWxucHHrnhWljabo0DVD7P+93+arIaeyqLdgzPrA2oPNdAWf0yfIjYWAQj2NifB2XmqCloR0ooZ2S1y7Y9aq9PFUIaIrAi5l4djsAYb70v7ktncGECFeZ+x2IMnOBbKvQV7VW8RCfx/aUP3ZpJFy27qcjs+k=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=J+UKFEdH; arc=pass smtp.client-ip=209.85.208.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="J+UKFEdH"
Received: by mail-ed1-f54.google.com with SMTP id 4fb4d7f45d1cf-670ab084a39so12188966a12.3
        for <devicetree@vger.kernel.org>; Fri, 24 Apr 2026 09:01:22 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1777046481; cv=none;
        d=google.com; s=arc-20240605;
        b=Z6z/c1UFiBYS4KyOUSEmEyWcZkjjvddwDi8rJWzObwlTuUEDaNAWRJtYS2fWsScMHt
         WJb3uzc1FfvcazAS8B8/NV+RhHiZ/dOJolWB0UjGTKaj5mBCNtlDwfVPvR0mltxr9yDq
         mLe23d4c2XGHAYAC4i83i5yByzXZiHxBO3RpVSYx2gCq6Ulcx7NRFVlplffR3uIpnPjV
         WxzXVmug/DTfX3LojkWDuI/MRhzBFz+JW+NAJd+m5P6+wCG3dEBHBMX4hkujSPmbuz2r
         HW3vSYEU21gs5Gw2VPUqchfa69k7n0Omtz4CTlG32G+spMxOex+mlrDwYWVKPTNpx+ji
         ADww==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=IhksofQUr74ZsxiIixsYA9xW8rryL44gahMx0PQ5N/Q=;
        fh=X56aajxXwqJV3XPpd24kaDkIe1ufh46GXpuKO1gpBXI=;
        b=JGLvEmsM6j1wLXvoZFg4Vw01AdBPViq16Gi0klQ16CmQVM7l9LZNzGve1G1oxIVXHp
         9NVYnzeWBLzfHflVWASa5fT6FJCc+4Bk9dnRG1zGe09IrV5EHu6V5XIADqi3NEEse718
         ic7R1w70PT5LbHsTc00PNBVczzjsRFs50WkChG21zWmTECu2WrF4TwxGTFkH07se2B2l
         N/2ZNhYtk5U679hC7l0k2/XuUbAR2i/o8UN3WnEWWGC/NQ+USS4ryXc1hU9Mrs/IVbZ4
         vPvIX6dz76o8s2B8ZCQqr5R1xJCAFpMM4TmC4UN5FKlIy258XvJtyFO3oIzVxZD1hhyC
         JDQw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777046481; x=1777651281; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=IhksofQUr74ZsxiIixsYA9xW8rryL44gahMx0PQ5N/Q=;
        b=J+UKFEdH4Hl+bApboyrnPrZrSb+FjwkbhbHvqHIKWeZFKONM67U46eDgAvc+Ejswap
         +I0lW/NUWlDdIXMG1D+vOusSYhOZW1kqa2JGcyS+3XcGCPZ9cztfLmMy0DejHzzEKMzx
         g6O1E7ZE3NQhl2DE01M+KT5wi3mX/+m72kT7mDPyZ4Lh5eB6OyGujS+ZTUMsnxDkPROZ
         sOYI94IWbzvtmWCexhJt57zr/behzq2bQeSFEqqIlmx6+5nmSoLHueGEzJ3Cu8mOWgN6
         M2uUgy71y0xLGo3VrFOu39n8ExhE6Uea0J5sboEcJgu/6QDbAfR2GGc3bJlECVMtXYFy
         mweA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777046481; x=1777651281;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=IhksofQUr74ZsxiIixsYA9xW8rryL44gahMx0PQ5N/Q=;
        b=m0WTCwDRPQBSHjosS38gqmzZ8+RpZ9FFnPACa6FHIhDvuipOA+dRJoDdYRTX2hnEmW
         v+TM7TWwvUz+sAODYdv/3awAhkOp7OzLH1fjz46yHDSjMHwxENdJUxVlXfeQpEy++G8a
         TQuQxhvdHFAvh1X2tjRQy8eWJhkHs16PVg4DUMwTccyGta25Esy3koTwkPk3NRkmLUfS
         BDddZvNwIWNQ9Z825eMEYGjlCY4LOIj9lKKl2erBz8aPH1/TlsRLrZYIsWB+gd90aqza
         CHRzQZsfTQBapTEQQpR5it5fE9fn4lx4H4hhZWvFkD2Fop+4Hc1v60NtRvg7LMqXrgEW
         QgQQ==
X-Forwarded-Encrypted: i=1; AFNElJ8vWfYuE03xLWaiSVEHXfK4VfmnEbOnLRT14YLCkSOnEH1tlEk4eGeYrkWsnY0cHMM6+WkfWqR7SVLc@vger.kernel.org
X-Gm-Message-State: AOJu0YyqkqtJz9rZlkjhWjvo2/W6oFCKBSw4ShAz8vnukc7b2ZAg3i1a
	p3F/WMISrrYBfa0V0lxCT81X/mGolwvLGFvo4ILu5BmDHEaYiGNsxppH+HyIrXzwb6nuLS3oAUm
	3xb6oWl/afqknIdhqcT5e8DSx+k0jfRzbmfXl
X-Gm-Gg: AeBDies6Ftd83zTPeZDZBGGSYCXGacn6WQTxSeMIhJPZc/EHjKWY0Q0wHLw+dPvda7V
	WWICfQgjPOSDcXnbwV84tZscPZURRFFe8Lf1EuHIrjeu/uz56Mi1x32dA7Hdfl7EdVOv6DEPAIm
	/BHhFD/cYMWO3VbruP8rZfoQ+w0SOZ/7ceNJpEQ1IfPQMBVdXk0pp3Ovcl15Nxx0/ivo/P0Hdxa
	GFdyygeRqtveylI96zrmg9wm1ydSrHePWtLegc+SZlUq0U835un0dbsJFgNgYH5X+jFsETeJ0Va
	67zIRXBSdlxMVxRHs6qQ6XFj85opZg==
X-Received: by 2002:a17:907:d38c:b0:b9c:3d56:e4ec with SMTP id
 a640c23a62f3a-ba41a91de15mr1571230666b.24.1777046480779; Fri, 24 Apr 2026
 09:01:20 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260424071305.89503-1-clamor95@gmail.com> <20260424071305.89503-3-clamor95@gmail.com>
 <aeuMn2w3kSUl-wxF@google.com>
In-Reply-To: <aeuMn2w3kSUl-wxF@google.com>
From: Svyatoslav Ryhel <clamor95@gmail.com>
Date: Fri, 24 Apr 2026 19:01:08 +0300
X-Gm-Features: AQROBzA4BNjbA3iaTiG29FMhO3DarZS80TQsSo5ZGABEE-PRS6jsddYwfXqqpLA
Message-ID: <CAPVz0n1POe_YuA+RyvLLUdO2D526hb_YQUXJb72Y1h6mW8M6kQ@mail.gmail.com>
Subject: Re: [PATCH v1 2/2] Input: isa1200 - new driver for Imagis ISA1200
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Linus Walleij <linusw@kernel.org>, linux-input@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

=D0=BF=D1=82, 24 =D0=BA=D0=B2=D1=96=D1=82. 2026=E2=80=AF=D1=80. =D0=BE 18:3=
1 Dmitry Torokhov <dmitry.torokhov@gmail.com> =D0=BF=D0=B8=D1=88=D0=B5:
>
> On Fri, Apr 24, 2026 at 10:13:05AM +0300, Svyatoslav Ryhel wrote:
> > From: Linus Walleij <linusw@kernel.org>
> >
> > The ISA1200 is a haptic feedback unit from Imagis Technology using two
> > motors for haptic feedback in mobile phones. Used in many mobile device=
s
> > c. 2012 including Samsung Galxy S Advance GT-I9070 (Janice), Samsung Be=
am
> > GT-I8350 (Gavini), LG Optimus 4X P880 and LG Optimus Vu P895.
> >
> > The exact datasheet for the ISA1200 is not available; all data was mode=
led
> > based on available downstream kernel sources for various devices and
> > fragments of information scattered across the internet.
> >
> > Signed-off-by: Linus Walleij <linusw@kernel.org>
> > Co-developed-by: Svyatoslav Ryhel <clamor95@gmail.com>
> > Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
>
> There are a bunch of valid sashiko comments, please address them:
>
> https://sashiko.dev/#/patchset/20260424071305.89503-1-clamor95%40gmail.co=
m
>
> Thanks.
>

Acknowledged, thank you.

> --
> Dmitry
