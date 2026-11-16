Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.218.51
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794798083;
	b=1wRkstn+S3vA2Ux39WDKyiLoVBM/KiIelms9LBJCiLpDYEmgLS3Sfn16CNl4XIjkzRCY
	 MpNtgHnIAUSLGhkMUCd5uFmh1GhBqmMJK5UoBXFzkqkkhG0SKaPK0E/qAjHdn/rLqWT85
	 7VJzamiKgXZc9Ee4pM6d6Gjni/OikgUivOtIzI0mcK1tDF2quSSH5YfMd4ZKw7B3nKslQ
	 2oKNCvHplG8TcH7xnHv6cOzctTAkY1UN14Aiw3l+Xv5kmd7Zvq61jy/z3VnOSLH+v61M0
	 YfklMhaI9E7NuflM4KcwTNcZtpVyoZOrpE2hjBw7l4RxlpdIxYPPBM2uQHFj862eBhQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794798083;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type;
	bh=4qUheKg2Lay7rkyQAuqzWzkTXaIYOEjjSVeDSogdieo=;
	b=1sCRF2KiMx2UMt6cBgKJL5D5azn4C+E0lEp8tAbWYnIE41+UpR5+qLMRGnqZQ1WNyPNU
	 RoDITeJ6T6cd3ydzzzkJct1xpYqJQaZrOSDRI7AqLYYD7hz70cHV8URhrUTW+p+ZEYJjA
	 BymbSO/roL1qF5ZY2Ei2ArqBjSt/cp8eVFaW40C03HV4QMUN7i8uhSabKB04KHJ1HrZkq
	 6+dQ9V7zfM8vLzMrgB8qoutnZcKzeM1iR8eil5+bDo7SmfgsZg8wRDQvYDuPPp4xsd6vJ
	 YNsDFMzTiPrFtAw0wtxzC3AXdDmbW6fQcEBPhyOrZJEVAmYQFDqfGbMbtnkIsIyxekg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=aLeC5wjI;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.218.51
Received: from mail-ej1-f51.google.com (mail-ej1-f51.google.com [209.85.218.51])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3B6E5606A334
	for <devicetree@vger.kernel.org>; Mon, 16 Nov 2026 03:01:23 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3B6E5606A334
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=aLeC5wjI
Received: by mail-ej1-f51.google.com with SMTP id a640c23a62f3a-c506187deb9so46404466b.2
        for <devicetree@vger.kernel.org>; Sun, 15 Nov 2026 19:01:23 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794798081; cv=none;
        d=google.com; s=arc-20260327;
        b=iIVt34j7YgeD4nVgcM6udfNgnFI+BOHUuNe1V7HuX70f8zpsy+G6iBnav9geHQSq1k
         fSELIKTiDLXHp+uVFeopdKcXapFYPoBQF+YyGUcfsfuB8TCkG1IoNjavY1DEHN5mNOMY
         c1LnjoZsHaq1kCwyGPXckeXP4TtnyCqSIGAngwMgAXnKVboS4E2n1JN56WdrfUNcTDqD
         UXHHmhY5E8lM3Uv12V+NNOP6aQE6CSDKx+4E6rhb7tTLgnQ4K2I34E4cVdut8XHrLo2C
         vI8dpg3q6O4Kldngqn07hRTtDJ7YJkWB1K/tc9XwQQjCHVS5QGfnFWrNq9VMRY9lpXZq
         vaeQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=4qUheKg2Lay7rkyQAuqzWzkTXaIYOEjjSVeDSogdieo=;
        fh=OWo4GnHQrgZCN43PbAVGttqgK0gxU612uPQH9kvewuc=;
        b=KsPTbwTkgyUSWlZyRp0O0gO60VFNfY9HaGDdnQ8D17lUf4j1DCzp5cRWL01ZuWOL15
         akAKwD3ZC8Ejq5KTsOw5oh7DmLxoNhw8RGiX/xb/sgtF2I5AUeJPd49yYKNpwkSNY2YI
         MX0WAg33ARRX08VaThEmQ+9P/P9BBR766M9Omh56RfxTAg/x5a2i9ee9kXY+MNSzuq2j
         jrT9RXOirgTPulkLpCaeX85OLWLurINLwSGvqU/JLoGq87D6NLP1skaRkAYdsQIm70rJ
         SRxkOrQ+08BNTiycjrxg/DJoAit8MtJMiaXoCqFqlmGjIkr+Kj8SgiTOQdLzZi8/YIQU
         Euhw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794798081; x=1795402881; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=4qUheKg2Lay7rkyQAuqzWzkTXaIYOEjjSVeDSogdieo=;
        b=aLeC5wjIitBTuqiifowBvrM6hxDoACM+Cj+adxHHaOfAcO0Jz+uFR96UVPxJC/Bu+a
         cXtzqWCfw9un3Bt/iiwpEuea4b9T0nVKJXaI/GQnKe5TmZDQDWgCyL6ciUgGMOi1Fjse
         CzaVU4azPrAmoyjrcRKHQsYQemdlyKYZ+HdkjEGVFWGyySPuBYY1RcbxCNjXHyOQweHB
         ED5SktK6krqXW0RAUlwTtUrAKlOW7SKm1fH0ZqB8k2WJ8wocuPFR9Uz+/yzIG+ZthK85
         fF+K+yY1lFlUtvNJlgmDeHIJeQXChyBqLlZCBUZtf3of9KDnBEJCZbyyx6vUhKBQSlR4
         XayQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794798081; x=1795402881;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=4qUheKg2Lay7rkyQAuqzWzkTXaIYOEjjSVeDSogdieo=;
        b=MshnM+ZVnVQ0+I7trI8TTVlPl5+Aahub2pPOiVvU+bwrvEUMC/hDDNLkYJ/MXJe6KD
         nXPQXBIPQCgG9A+CUH6zo12P+8TbvCpo0SmEv4r0Reyjb0w09qLjUn7GuO7I23UQJEwo
         84qBIhkGrpgG143nDsVCwip04yHH/eD0pCg/CLa3KDOC2UfrXqHW2+bJ4Kp6ihXMMmt2
         ltxT8agdwj/YKsvtoJEaoE+V9IMhATcwKjj4whAWBcrzmwO6ZDY9aY2KWxv44N/zfegm
         h2HSfoBRCbR1TRTdRtkk2oEKsfSU86PS9k83KlX8Tvzr4Nsp2hqDs4hzelq0M21YdFK2
         Vhdg==
X-Forwarded-Encrypted: i=1; AL+hErF/aKw+KCygdhHT8AVqDxhKSwwBWEv0fH26vIHS00aCxU3/Le0bl3GwFeMPeq6fSRCqz5uld6vynah6@vger.kernel.org
X-Gm-Message-State: APuU4Z/Fonxx45AbpgqRb7RUEwQ50x7KD/APv1cDapGBfnc/y93iz1SW
	TrmUJtSpfQRbev5O1X2Tf6H8Fn1qLwY3dU8vH7cNAHyvfCs7qunPII81x79zNtwIOlPJd5FZZkn
	2DSgTJtpJhdoAX1zuonCpOs9jvyErSmY=
X-Gm-Gg: AYBFou3ipvrW297o8X0uleGAaiXKijP9nsAxlGf5tgy0o4I65LpTwIJiOKAShgjF9w3
	4/Q/fu5EFHKUxlFhgXIZd6MaQ+AnyrQXg0b4XBGVybAEgAuuAYssSnWU+UbWUYCk1FfZ5qz9J+4
	QWhpnz9jK+U62y5wxwVjIgjd1XsVxI75eRXYODJbKTh/66Rb7dUcApzvdAX1c2vuPW5STjnHc8S
	OjHQlLJKuH37PH7dEUG3z8dbHIx5ZrXPflr+qqCAKlNprhB5UYuMkqKrsLDmIlCgunwqOR3HF+m
	ckWZmeKtREYBSPqv3bN/8Q15/K+xo03LuriZoTYoYk6qbzacpv0ywqVP8PKrrrL+atto9TTYp7U
	XmY/OJg/P0WRTmO12VUOIpmH7JeADqqWTsRmY8tt8BBWdqXK+BOVIaVgxYRTG4q80twsTygE5ur
	FWxtnj4CD61YSmp+OB
X-Received: by 2002:a17:907:6eaa:b0:c4d:1768:48eb with SMTP id
 a640c23a62f3a-c50962f0b77mr1233752266b.2.1794798080923; Sun, 15 Nov 2026
 19:01:20 -0800 (PST)
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261110-dcphy-rx-v1-v6-0-d681ba20b36a@gmail.com>
 <20261110-dcphy-rx-v1-v6-3-d681ba20b36a@gmail.com> <3ab93996-7e37-4143-aa4c-b4b4b0e025d8@collabora.com>
In-Reply-To: <3ab93996-7e37-4143-aa4c-b4b4b0e025d8@collabora.com>
From: =?UTF-8?B?5qWK5pm65oiQ?= <jason98166@gmail.com>
Date: Mon, 16 Nov 2026 11:01:08 +0800
X-Gm-Features: AclHuK_2CCL-6w7SS-4GVGwc0x2u2Iaps879pDspYuxXhI4Edd6EqNeYrnLX7uA
Message-ID: <CAPwA33JHxsd=nr9F9_KFKWPx+HGaR8P3ee7hxMc8XCS6QY46gw@mail.gmail.com>
Subject: Re: [PATCH v6 3/9] phy: rockchip-samsung-dcphy: Unwind power-on on
 PLL lock failure
To: Michael Riesch <michael.riesch@collabora.com>
Cc: Vinod Koul <vkoul@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>, 
	Manivannan Sadhasivam <mani@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Heiko Stuebner <heiko@sntech.de>, Guochun Huang <hero.huang@rock-chips.com>, 
	Philipp Zabel <p.zabel@pengutronix.de>, 
	Sebastian Reichel <sebastian.reichel@collabora.com>, 
	"Bryan O'Donoghue" <bryan.odonoghue@linaro.org>, linux-phy@lists.infradead.org, 
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org, 
	Sashiko <sashiko-bot@kernel.org>
Content-Type: text/plain; charset="UTF-8"

Hi Michael,

On 11/11/26 14:02, Michael Riesch wrote:
> I wonder whether this should be here in the first place. Only judging by
> the name, samsung_mipi_dcphy_pll_enable is something that affects the
> complete logic block and probably should be kept in runtime resume to
> begin with.
>
> However, since _dphy_rx_power_on does not call this funcion, it seems to
> be something related only to the TX side of the logic block, but for
> D-PHY and C-PHY. In this case, it probably should go into
> samsung_mipi_dcphy_tx_power_on.
>
> On the off chance that this is actually for the D-PHY TX operation, the
> function should be renamed "*_dcphy_pll_*" -> "*_dphy_pll_*" or
> "*_dphy_tx_pll_*".
>
> What do you think?

The settings in this function are indeed only for TX, for both D-PHY
and C-PHY, so I will rename the PLL helpers to
samsung_mipi_dcphy_tx_pll_* in the renaming patch (6/9).

samsung_mipi_dcphy_tx_power_on does look like a more suitable place.
However, I do not have a C-PHY board, and I only have one panel with
mainline support, so I may not be able to test the DC-PHY TX side
thoroughly. For now I am trying to leave the TX code unchanged unless
my series affects that code.

Should I move the PLL enable to samsung_mipi_dcphy_tx_power_on, or keep
this error cleanup path and the renaming change for now?

Thanks,
Jason
