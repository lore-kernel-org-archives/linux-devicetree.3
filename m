Received: from mail-ej2-f42.google.com (mail-ej2-f42.google.com [74.125.228.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6170A3A6B6A
	for <devicetree@vger.kernel.org>; Sat,  3 Oct 2026 10:46:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791024395; cv=none; b=Wb2W2JW9QT+ds/YYLufAAY4fou4aZffVA+ba+pz4Tp0KyGsdbeoae7uT0mvpxGl0lJiAON3l6aUXocQmOPY1s+9gXltMg+TImLZWfT+zFRefAUmCDYMoDZdrWfyLB+B+F1pwhOqYFdpVijMjAScspQUbJkXigOwbX7EOeDkA6Sg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791024395; c=relaxed/simple;
	bh=idvxGuLkq+sQb4zIcAERMp4WjduqYGvTIN3q9L7ywvg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=oT409fWhPJLrCyBwzsF5VwVJfhB1Uwxkpl5tNOQi6W+OUAZeNrpbcvIo9e+l0coBn8aQW5jpvU+aftJCRK0Uv1K5ukF64PQVeRafaQU1PX+zCswEEl9fenCdB3GX0aVh7i5e2earQCq2X6SeqhVSiPpWSYjFeUY/ast/oONuEY8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Bp7lyqy2; arc=none smtp.client-ip=74.125.228.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Bp7lyqy2"
Received: by mail-ej2-f42.google.com with SMTP id a640c23a62f3a-c2e59b02972so76588166b.2
        for <devicetree@vger.kernel.org>; Sat, 03 Oct 2026 03:46:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1791024391; x=1791629191; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=RwKHh70JY+GXTFZ9akuGUGzP+mt92O/1MI1gWM+jXbk=;
        b=Bp7lyqy22dtkDtBgCaPOy/YpLuidGCaKL2LluRaZphZD76VXP8ZUceOL7fBY4iEDAG
         P7l+8iJAh0YKs2C0uiJw1n+itNn/TpiEOVBcAdiOW0CWxj1VvSPTmLF5c+gREmnSMJuS
         fU4KmjbWaPLVXMZw7ORLteyYv5trjH422IaUOvcOVuOq+0yBzST7xasy+bA5SVDiOlY2
         qavtykVnoold9L+exf2ilzsrEqQsUALJE+Vc+4WLv/pWRvkTq8WGvVBnharq4qLPDmZ0
         xwdQAar3xtVsibD1PEaXl8RukdAEEioKeHm12tk8g5PdTyMzx46DE9uOmqaJmdIJIxXj
         omCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791024391; x=1791629191;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=RwKHh70JY+GXTFZ9akuGUGzP+mt92O/1MI1gWM+jXbk=;
        b=vSGfvzrr28un1/xZOUxdoAk0LO4pMCXMOW+3HwPeFpjpPF781AJ9B0aPUsoi63YW7B
         mDIHJK6yLAPqMAvjpYCDBI0sbmDVQSeG4+ONDOr/tEzS5rng5Q1/hIx8BDZn8mM1fjOZ
         M9sC1A028C3qmXqEC6Gqd49v698hZRg3sscPDcnD5xdpbgMdbWglpKIuk0UczOQ7Jujd
         N4Df+MtLEzQJimSWcmNWGqFwZrUySzT4BxzrMObRJgBmUKuU2kaktwcmqL+nK30wt/zh
         2OksbMezpeNqtT05wvRknzqT0LK4tYxuTiwUflvVmp1ehHD8eXdOyZ3C6Ybqtm4EWIr0
         4AKg==
X-Forwarded-Encrypted: i=1; AKwUvBwiQ3j9iDq0aW1uaAhDN/gZ63avcWl+9aIlWU72te+ooD8rDQVh0/b5UbVPbyg8q2YMUNHb+F5XEdzd@vger.kernel.org
X-Gm-Message-State: AFuF++lgagHeCP16ofWMzqtfxViXLF78Kr8WykQ3T89wiI7U76utgE/G
	tEMAHo3l1/8iIKmAbiRQhGjoNRONasoCm63WTEFg1vf7YioVbl/W+xE2/4qoFrns18c=
X-Gm-Gg: AYBFou0tirH8sgFNK1X8kcR5tsLyANcY/a7w7UfMVSlypj7zeYK9IROjlZWXoinuUxM
	Of5xUxYUMxkyzVkC5mMPAKBWHXgYn0t+onenUxbQgN7P8qhjMsxkA3SiEOgT6wZQmUDCY7AYCMe
	4+8PbpB17b0fZaJgn8dclIi0Zxb7XhqdDHl/mXsTWSVp7OGsktyq1wUkIX5dpmKH/I/P6/TSpqB
	G6LXRp5nT0aUXvQxV67IbTxC4agiZ1XfmClpC5if+ouRDQkFBENQMPfEuVGwpBz83SjoebOOmTI
	PoRJneOa5Gb1pCeWShoegA4KvhxEElxzBrWZqa15CH+vTIYGdgfA5QutWhD1GnnQYuuAfUfY4sn
	iJr1bpeSXMxI/0aAXWf+nh876Uf/94DnxrcEiqQ9goc4vIfSE2N84AmntY2WGvK36mlpR+WUWvK
	/jFsWyfnF6Ir81yWSXBezbLVZmHGU6pShiChWWoNMuRghjnHqPKM1k5lUVF/5IVJnPKPJVSacb9
	qYL3N7pm2c=
X-Received: by 2002:a17:906:f58b:b0:c2e:30a9:c04f with SMTP id a640c23a62f3a-c2e4ad155a4mr454607266b.13.1791024391402;
        Sat, 03 Oct 2026 03:46:31 -0700 (PDT)
Received: from [192.168.0.167] ([109.77.86.130])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c2e4cf5f4e4sm192822066b.42.2026.10.03.03.46.30
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 03 Oct 2026 03:46:30 -0700 (PDT)
Message-ID: <61a2d75e-4061-4be9-ad8a-a85c5bf7368c@linaro.org>
Date: Sat, 3 Oct 2026 11:46:29 +0100
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/4] dt-bindings: phy: rockchip-inno-csi-dphy: add
 rk3576 variant
To: Amin Gattout <amin.gattout@gmail.com>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>,
 Vinod Koul <vkoul@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>
Cc: Michael Riesch <michael.riesch@collabora.com>,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-phy@lists.infradead.org, Conor Dooley <conor.dooley@microchip.com>
References: <20260915-rk3576-dphy-v2-0-b56e68b54b8c@gmail.com>
 <Vv2QfKmkyPTU5VXXS1TYn-cg7DX3OD7InbT-5UjiZLMHVPPDWcj-0hgl7PJxI7ugjmudNTZJfhXCisY2fExubQ==@protonmail.internalid>
 <20260915-rk3576-dphy-v2-2-b56e68b54b8c@gmail.com>
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Content-Language: en-GB
In-Reply-To: <20260915-rk3576-dphy-v2-2-b56e68b54b8c@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 15/09/2026 11:42, Amin Gattout wrote:
> The Rockchip RK3576 features two MIPI CSI-2 DPHYs compatible with this
> binding. Unlike the RK3588 variant, each PHY instance only has an APB
> reset line, so add the new compatible to the single-reset group as
> well.
> 
> No fallback compatible is used because the RK3576 DPHYs match neither
> existing variant: their control bits sit in a dedicated CSI-DPHY GRF as
> on RK3588 (rather than in the shared VI GRF used on RK3568), while only
> a single APB reset is wired up, as on RK3568. Falling back to
> "rockchip,rk3588-csi-dphy" would make the driver request a second,
> non-existent reset, and falling back to "rockchip,rk3568-csi-dphy"
> would make it write to the wrong GRF offsets, so dedicated match data
> is required.
> 
> Acked-by: Conor Dooley <conor.dooley@microchip.com>
> Signed-off-by: Amin Gattout <amin.gattout@gmail.com>
> ---
>   Documentation/devicetree/bindings/phy/rockchip-inno-csi-dphy.yaml | 2 ++
>   1 file changed, 2 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/phy/rockchip-inno-csi-dphy.yaml b/Documentation/devicetree/bindings/phy/rockchip-inno-csi-dphy.yaml
> index 03950b3cad08..92d0c961f4c4 100644
> --- a/Documentation/devicetree/bindings/phy/rockchip-inno-csi-dphy.yaml
> +++ b/Documentation/devicetree/bindings/phy/rockchip-inno-csi-dphy.yaml
> @@ -21,6 +21,7 @@ properties:
>         - rockchip,rk3326-csi-dphy
>         - rockchip,rk3368-csi-dphy
>         - rockchip,rk3568-csi-dphy
> +      - rockchip,rk3576-csi-dphy
>         - rockchip,rk3588-csi-dphy
> 
>     reg:
> @@ -89,6 +90,7 @@ allOf:
>                 - rockchip,rk3326-csi-dphy
>                 - rockchip,rk3368-csi-dphy
>                 - rockchip,rk3568-csi-dphy
> +              - rockchip,rk3576-csi-dphy
>       then:
>         properties:
>           resets:
> 
> --
> 2.43.0
> 
> 
> _______________________________________________
> Linux-rockchip mailing list
> Linux-rockchip@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-rockchip

Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
