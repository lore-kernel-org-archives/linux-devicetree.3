Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com [209.85.214.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 55738420484
	for <devicetree@vger.kernel.org>; Tue, 28 Jul 2026 22:13:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785276834; cv=none; b=fOTIvxwlV7sKbNDDEfbAVVH/c1m2/JnKREWDhd7pkASbwZOIQDUIqhFyDnSRQkyXsS2ooB8kcev3hZcQkwbkEgu53iXQm1UHn5TTW0Et/0TBX4u6u0P6N5taF4NXO9BwxrcmmiTpo2nDp8KpByBetpJuczNy8BwWzz5lpxRYp5c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785276834; c=relaxed/simple;
	bh=wEmt415FHzq++0CCG1f576MPPFXRLPNUXlNkDmLPZ8k=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=pHr07VHidAqwEEp1Fy6//VP94CxSZJDOEOYy7XXFFdudq32urcrXxiOptM/zc74/aIzahRFlq5P2A6jp7eqmu6O0GFuSb08F4e/4qE9JAb51ykfUjuklH0d2nWB9VtRPe/NZDBtqxUWXwouAo1iSrPwQCX96wu8szHXmOd6XkxE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=hm2yb53y; arc=none smtp.client-ip=209.85.214.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="hm2yb53y"
Received: by mail-pl1-f175.google.com with SMTP id d9443c01a7336-2cab973140bso5335485ad.3
        for <devicetree@vger.kernel.org>; Tue, 28 Jul 2026 15:13:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785276833; x=1785881633; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=kCl15eSRo62XRO+xaCq2uVtZDF7Ezk7Z7ce7c0TVl9Q=;
        b=hm2yb53yb4JaTbTwu26/se5QMCUvtxmo1RiJTx0WtSemF2UpLCyKcyfoBbDGbHSUYh
         osuziQzz7fSCTLHPt1w77+3D+hihXT4U3BzQZGlSNW8WoOnNO/F3htou2YbdQ7C8kgHU
         E9OZYhEw4ijSUv4W3KlotfutIcSc9bTGk+Tit3LgqyrNjSEeRzTtifpPPSjdPKqsxGga
         IN+Ul1lhYrw72ILpOR0hpqu5NkcOmM17/JEcZTBfM0wv5IwWExzoagtQ57PXjqRlMoeo
         ZOWx/YZjlwWtrHewnSu6tXa70xjPQXgwRs/DSjRk4ltbicB5+iHz8RSA78s8a48hg2CW
         PWmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785276833; x=1785881633;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=kCl15eSRo62XRO+xaCq2uVtZDF7Ezk7Z7ce7c0TVl9Q=;
        b=V8azRK/I8T5w2G75hybpPI1INmYGXXasmADhxdooHtG4peYUZZ2XiTo0knE0XipWRr
         uJCsLMgaZE2UgRC3/awvkHtIHqq6ofy3NqDeLDIE4Z5Iqw+3T4cM4MNmeaM3SigOFdcp
         velmSEWBn1Av1kobPIduL538R0BjeXr8b1mCUBtl0nuJaNNOloourKsEyMpZ2MkvundY
         zmka20a0EVv4tM67OqH47txuyMyGdprROovZWe8KabDFZmRU3bK1RHAc2qqWxNFvXW9/
         1jp3+Yccui3xO9gj/1hBRuVnqTaawoEei6dHgrfy8102lL/+49SjXiyqjLGPk4n5NtBV
         g52g==
X-Forwarded-Encrypted: i=1; AHgh+RqSVs/FUiMeQjSE/LhqpoCs+JSN42q248elMkwiQe26+3J8ofKfcilEjpwZBumSH/ohojicx53UmIqC@vger.kernel.org
X-Gm-Message-State: AOJu0Yz/KNh2l/+XtrWyU4W0LNgTIgcTBdplIoQ9SSCb2looizt6sn4q
	vmfZLYqzFxz+fuXfzagwGXI2yRYXjRvuPJ5/gZnZFQRlYgEA3WDM+Gtq
X-Gm-Gg: AR+sD13j1hMkQXWvlw3kt7mY5zEDwxzWsK5QXFx7zxKD5oBfW3C/Qri9vwZHTLU4OWd
	Ztcs+Dp9WjzfxPuqK8LrxzIlJ5jbCKSS+WI9WbfrD42cIvIa4kb+/7N4kvvySq5TdbY5eorXOT1
	J4MPXxWthIezTHuQViKtWumOxElnqW57fWqJpuaZPZvy4wxeXhVKKslvup9ll+/MgrKnXO8QWOK
	OqjvjaAGYaDAiTIYBBC5vkymM5o1AosziZ7ZYeCLQNItBWWS+Dft7zItkfC5nS46PYgRbk5kdct
	9nV5qPyOGWbehhXBD1PSDVlfdZL1ixJSYJdU8jWjNX9QIqSJVTr+3cvOeYv+OZeudE4rK3IGJu/
	ZllXYUKqTjfs/N0A9P32JaLKEacrQAyai4M3s9NpxrUpS7I6GHQLZ7egpsMNHhMG2axM1xONDwy
	JvbcpP1jptflPbB+diHmZMDNnFCa2gHtzhLy3RGW71oOLBA1Fqf/5k2WoB+R8=
X-Received: by 2002:a17:902:d2c8:b0:2c9:ff29:3f91 with SMTP id d9443c01a7336-2d015c8fbd9mr45936265ad.6.1785276832549;
        Tue, 28 Jul 2026 15:13:52 -0700 (PDT)
Received: from localhost ([2001:19f0:8000:3e6e:5400:6ff:fe38:3d01])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2d022bf39b5sm2108355ad.57.2026.07.28.15.13.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 Jul 2026 15:13:52 -0700 (PDT)
Date: Wed, 29 Jul 2026 06:13:41 +0800
From: Inochi Amaoto <inochiama@gmail.com>
To: Junhui Liu <junhui.liu@pigmoral.tech>, 
	Daniel Lezcano <daniel.lezcano@kernel.org>, Thomas Gleixner <tglx@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>, Yixun Lan <dlan@kernel.org>, 
	Inochi Amaoto <inochiama@outlook.com>, Samuel Holland <samuel.holland@sifive.com>, 
	Anup Patel <anup@brainfault.org>, Guodong Xu <guodong@riscstar.com>
Cc: linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-riscv@lists.infradead.org, spacemit@lists.linux.dev, 
	Conor Dooley <conor.dooley@microchip.com>
Subject: Re: [PATCH RFC 1/7] dt-bindings: timer: thead,c900-aclint-mtimer:
 Add SpacemiT K3
Message-ID: <amkpPAu3sqycI3CZ@inochi.infowork>
References: <20260729-k3-aclint-v1-0-aef88614d3a5@pigmoral.tech>
 <20260729-k3-aclint-v1-1-aef88614d3a5@pigmoral.tech>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260729-k3-aclint-v1-1-aef88614d3a5@pigmoral.tech>

On Wed, Jul 29, 2026 at 12:36:27AM +0800, Junhui Liu wrote:
> Add support for the ACLINT MTIMER found in the SpacemiT K3 SoC. The
> hardware provides a ACLINT TIMER unit. Adding riscv,aclint-mtimer as a
> fallback compatible allows direct reuse of existing OpenSBI driver.
> 
> Signed-off-by: Junhui Liu <junhui.liu@pigmoral.tech>
> ---
>  Documentation/devicetree/bindings/timer/thead,c900-aclint-mtimer.yaml | 4 ++++
>  1 file changed, 4 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/timer/thead,c900-aclint-mtimer.yaml b/Documentation/devicetree/bindings/timer/thead,c900-aclint-mtimer.yaml
> index cf7c82e980f6..c9429a2fa364 100644
> --- a/Documentation/devicetree/bindings/timer/thead,c900-aclint-mtimer.yaml
> +++ b/Documentation/devicetree/bindings/timer/thead,c900-aclint-mtimer.yaml
> @@ -21,6 +21,10 @@ properties:
>            - enum:
>                - anlogic,dr1v90-aclint-mtimer
>            - const: nuclei,ux900-aclint-mtimer
> +      - items:
> +          - enum:
> +              - spacemit,k3-aclint-mtimer
> +          - const: riscv,aclint-mtimer
>  

Drop the generic riscv compatible as Linux only accepts ratified spec.
But this ACLINT is already archived and will not be ratified.

The request also applies to patch 2, 3.

>    reg:
>      items:
> 
> -- 
> 2.55.0
> 

Regards,
Inochi
