Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 131E44718C0
	for <devicetree@vger.kernel.org>; Thu, 10 Sep 2026 21:38:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789076339; cv=none; b=Kk+DVft9MOU57ql2a5K1Oha8zqQ7mGd6ELQ4mDodRkcFLn2e785UjMy49mAq+zb2TeFoPyCCY7/IrmN8V1dmdDUPJA71SVfKtdg3p3UpBGEABL9ieCwHTG3AJFz2B8kpGfi4H2qFpXjUx2yYlEVqE3OxEZexO60GtY6n2WNkgYw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789076339; c=relaxed/simple;
	bh=IhoXtIPy27R9nmeBtoMiaiTsuzKkKC2i/cZ0nUhc11o=;
	h=Mime-Version:Content-Type:Date:Message-Id:Subject:From:To:Cc:
	 References:In-Reply-To; b=olUxRRUl18/avadFHroGVwGiHyu5dZVr2OXdtrTkvlLdgT6rI/UDT4W33jvtYGTtWinr5mP++wH1Ygk4tHc54HqDCfDdIkP3OoUY7nZgNx4T+easq/DhOrTxiEW8m8vLMOA3jZruJDAZzzQw4/sxac44qei/6Dr67WgsP9bGEQ4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Pqm5a8R0; arc=none smtp.client-ip=209.85.128.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Pqm5a8R0"
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-49b0d78a801so2834325e9.2
        for <devicetree@vger.kernel.org>; Thu, 10 Sep 2026 14:38:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1789076336; x=1789681136; darn=vger.kernel.org;
        h=in-reply-to:references:cc:to:from:subject:message-id:date
         :content-type:content-transfer-encoding:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=0occsfLmodcsn9s1z8E/JBq4kBSFx1YK4S42OPyg7Rc=;
        b=Pqm5a8R0mXbgsDDL/O2/yW2btDZvs0/DjC75To+H/bi1ZD9Y2sdE212B0dvDbj2H+L
         L9eJV2i7ByR1aMWxud2SJnCkbUChCZzAdR72vxUFoHx5Wt+vvbd3d2aqAthw7nysFL9r
         4V24TvlahaaGRM8NrCPUuQTHipOOlJz8UflPAY4kdmcszc6rKeRy+UDZ9JUlAfU5TpSn
         8YD0sFf0uepyqOL4dDU4kEW/t5DRGJ3JzWu7sVYi+ar6w+APWvOqmPvtqUGhHJ1cMYD4
         +4/vi7qgC+GiPZuqygcxp9ePvpjpUJYuUgYSs0E+hXV4VGa/m/4dsAPbzXFax3t9V+N3
         gK2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789076336; x=1789681136;
        h=in-reply-to:references:cc:to:from:subject:message-id:date
         :content-type:content-transfer-encoding:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=0occsfLmodcsn9s1z8E/JBq4kBSFx1YK4S42OPyg7Rc=;
        b=Hmf/tNDOKMQCwzUAcqXk41Tj2etuoL3+m1mJ00WsDs2bjzRiOS2hhbxVDw9+k7EVWt
         sLgAHejkHG3RpF/EadxcWHcWcvUKfx0rIIKPGKBub0yNK0ygpTg0R/7sxbyzfeMqly3M
         Sw10q6+XjbwEx4+cvbsi3jz4RpugBEB6OGFM3tO7cF4iT7xBM1xG3//XyXtCOdM3tOTz
         HxoNdLmUZRRjUdAhV5JKr3pNSB/f+B2KEeSmaDGlkWDTXpQ1yE+LqSPEWS8d/cT/MFR/
         GLkct71NKF7yH/TmuSo6KtMHt/e2igfmT00kG7Ryok/6kmBsuY9+9zrYAvh8YYDh8HPB
         OCNQ==
X-Forwarded-Encrypted: i=1; AKwUvByFW00WLFsAEsg3AxYZwpnDUPi8ssODJJlcYh0pgakpLM3IFJWqHNyaNo5fn3t61TGJIdDB1vHoLyuP@vger.kernel.org
X-Gm-Message-State: AFuF++n7N5fO+XbcQZSbln/pQtBNh7rY1ArxcaEzTJw8XOrCDqWJ3Oge
	soAWANc0iVOdhQyCRHW3izSuDd/W9BbL2bogJ447BiaMvbPwRkD9rpBN4YtFQtiH22g=
X-Gm-Gg: AYBFou3GJc0P0sbhQ3MigNrF5qnOR0cYEOjb2dVIQiDFmrHgmNFyX9Fqkllkd79ib4u
	OK9x5rxr0uoFIBPaV/EmrpdcCrR3V5BjvWZtoN3KvWiqtgdrprT1JNYtIpKWlwEuZeNJLCTpJZa
	6be6xiAsq7++87T/Hfgio3Cp1PLTFH5d7+Nwb76Ffr8WZuAoe2r5LapNoKEtzsGy9RsRsOZRJQJ
	V0NGjAsOti/u02IxEy5HkBFzDn6AN9mNOih5gO5xUPgtsPuZ7SJPUaiHPd41k0kAL70e20adiCO
	pA6CmGO4f3aP+lEOZ8yg5JhBfS7ZRsyEB03W7FodBTEjJGLvbzeT85sqtQqw2uBP+ttGRDmveVs
	UIG3/LmmuhXDoatNzVQlbZON67X4FNETdqcMepp+a68xdGpZfj9C6U7FImmkaaX6uNbVaueNCJ8
	oBYAiVu35C9qruv+g9c1P76XqvU7i+/TjvHgJbnROmM4ixZvqg9BYahXFXrAtmUe56uvlbqTe0A
	nzLMVN4K+uBEOyFzjMmWwMgM8pweFm0VPNw4ImV9sERBP2moV/y7TDFueQe
X-Received: by 2002:a05:600c:1385:b0:49e:2a61:a17b with SMTP id 5b1f17b1804b1-49e619a0905mr8799185e9.5.1789076335948;
        Thu, 10 Sep 2026 14:38:55 -0700 (PDT)
Received: from localhost ([94.4.85.166])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49e62227071sm4434585e9.3.2026.09.10.14.38.54
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 10 Sep 2026 14:38:55 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Thu, 10 Sep 2026 22:38:53 +0100
Message-Id: <DLBYMPDTOM7N.3I07C9Q0IJJ19@linaro.org>
Subject: Re: [PATCH v3 0/2] Exynos850 ACPM SRAM devicetree node
From: "Alexey Klimov" <alexey.klimov@linaro.org>
To: "Sam Protsenko" <semen.protsenko@linaro.org>, "Rob Herring"
 <robh@kernel.org>, "Krzysztof Kozlowski" <krzk+dt@kernel.org>
Cc: "Peter Griffin" <peter.griffin@linaro.org>, "Conor Dooley"
 <conor+dt@kernel.org>, "Alim Akhtar" <alim.akhtar@samsung.com>, "Tudor
 Ambarus" <tudor.ambarus@linaro.org>, <linux-samsung-soc@vger.kernel.org>,
 <linux-arm-kernel@lists.infradead.org>, <devicetree@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>, "Krzysztof Kozlowski"
 <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: aerc 0.21.0
References: <20260727-exynos850_sram-v3-0-8627a49188ec@linaro.org>
In-Reply-To: <20260727-exynos850_sram-v3-0-8627a49188ec@linaro.org>

Hi all,

On Mon Jul 27, 2026 at 2:23 PM BST, Alexey Klimov wrote:
> Hi all,
>
> this is a small series that adds sram node required for ACPM communicatio=
n.
> Bindings update adds new compatible "samsung,exynos850-acpm-sram" there a=
nd
> excludes it from having child nodes and not required properties.

Gentle ping.

What is missing here? Should it be split into two separate coomits?
There are no comments for at least a month.

[..]

> Alexey Klimov (2):
>       dt-bindings: sram: Document samsung,exynos850-acpm-sram
>       arm64: dts: exynos850: Add acpm SRAM node
>
>  Documentation/devicetree/bindings/sram/sram.yaml | 2 ++
>  arch/arm64/boot/dts/exynos/exynos850.dtsi        | 5 +++++
>  2 files changed, 7 insertions(+)
> ---

Thanks,
Alexey
