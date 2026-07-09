Received: from mail-ej1-f41.google.com (mail-ej1-f41.google.com [209.85.218.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 35B474219F2
	for <devicetree@vger.kernel.org>; Thu,  9 Jul 2026 12:31:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.218.41
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783600297; cv=pass; b=ZVu7de22eE00H9rhqqUxOkRTV+tajLH9YtDTLiaqCU+b/JS6sH2F1OskrLjm62RM/dI3w9XwzAqayODNKSTZMmURUoT6PTYoa7TuzDOd/zdU7J35N6NEPhYMz4V9ylWuD8vvgrlTtJZ4N5URtgk4yquHfTo/RPA+EESUj3Ww/Yk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783600297; c=relaxed/simple;
	bh=OPrV5O0AAcEk4Ax1DhMdeaFznJylTqQuB7qh4wuvTLo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=C48i3SqXHB7wFK4zGSe3rD1PhWFNRLM6/WJcXmpJXy7vUYdF1DXj8i8WTArKFZ3QdGBDQJN1YMixgHGeBNE5B5EtqInoacf9jzOMWE2BFJXZi6oVateYmdTzlewFtsVptrTrDiwgITKsiZeG6bmdhqGlZSzYUKhGqRwp0piwEUY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Lybu6eBO; arc=pass smtp.client-ip=209.85.218.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Lybu6eBO"
Received: by mail-ej1-f41.google.com with SMTP id a640c23a62f3a-c15e2dab83eso122361166b.1
        for <devicetree@vger.kernel.org>; Thu, 09 Jul 2026 05:31:36 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1783600295; cv=none;
        d=google.com; s=arc-20260327;
        b=VzXnUsCLaIarWRO6/Y6Nnx05pE0HojhAcEUSTvmTEbfe8DKPhDWE+bdB/0PdjSDwWc
         oYcCmwAKapQU7cMT+/0H0q3Fs7tK9ZzTiBysYbdumfp7fxjaj6eqs1q4hPxXqvTjuzLf
         cRzDA/2vnCTHOVlnBoHLjZ9uOlT88jXNiEzxVWzSRDwcW3WVT0KZjQjNn7RZIO9d3pAI
         k5rydDUrZRqCKoeVFIv7vqdvPMB8hrcE6hHkJt16SxYQ0Jki5c/P0HI0a0RYTWgUFFRe
         Aqa/p6L3HgakOiS55eAUTHQk4xjIulrnjrpvquyfOWchyn4UoH5bFZEw1Uxl48R8whhU
         fedg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=ENt0vCJ86VSVtmPtsqolSmQ32o9OY3OwpjaSyzCzfAI=;
        fh=FmkWi875k1sBx5vUxLStS3FEg2co48sfN7aaqTSfkKc=;
        b=ajhM/OG2yix47ETEnWdew39fA6oJyMdaqfq210NGPPNGFxJTy8z1BwdHx4VenJYUjb
         OVOKJZ6WqaAlovSG74YSMsNf8klLryqQfaNveCeePR9gdVDR+nuWBRkfBy32DmFo/ppR
         P0zuSUdnJ2NxWkH4/I4W5OD2xh5rekA0EqVAo8HWiEbNBVQkEyi+eB4H1U+KmHeY4ePc
         4pX6cwJjQe2wXjksTKJeEyleFITxZlJ9PGhSnmc/ozN0NUdoHnm4KjSmAOlvkXm/9oue
         8LjXVLX/ug4oqzPeaz7NANYUVoTOkChSxty6lKUqoWwgn8j/G/AciDB9YKMxSqrfFQwq
         mw0g==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1783600295; x=1784205095; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ENt0vCJ86VSVtmPtsqolSmQ32o9OY3OwpjaSyzCzfAI=;
        b=Lybu6eBOtgswFf1z/Qb/FpNL8v+ECK2mB/Ui1scFkiF3v4DdSbYLlY0raLU6q5HHJd
         dOIYtkgqN/dCmNmThdPScpA/0x+aZlL9r6fydWZ3EWhYVzrEtkrhnAlT9UNX3f7W9kEo
         Ul3tOtgCLrNtxjf6YaBvYHsI3EpY7Bf4odWIQ9NrrMXVkpJ+rtpydfdHo+rapddjSnzy
         JXaLA0M3k5SJTkaMn6kBay0gllHxm3lR73hTOL6hzzAz0pqZd4LG5zMqjTfhVjQTgG4r
         lizjkMxbWbeMhNij3cQ3yRj8IGPYazgQWsCJZCwz2mQM1UgvhkRVSMDABN+Hk8q1CxW4
         aG9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783600295; x=1784205095;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=ENt0vCJ86VSVtmPtsqolSmQ32o9OY3OwpjaSyzCzfAI=;
        b=oKkMNBz6CN6KYz72yBYtaV6vmBpGiNNDP2B/IK7s5DMRRBOYNyT8upBcZHgvKSQJ8h
         WoUBBYmc/B1BtWMQO5gJthuVx6J4R4RMqJnelXterCnVeL38r/bnmIovZX9suSd6sMGl
         IDDCkpWzZRPjnuXAtjdvzc9pfPDYVIrJkBeX7fI0JRta40xQ/WddDqRulQ0CIcBxBBY5
         gu7ZDqGPgqac/0AOyQ0ImM7Q+rJJqKm1Fh8H3t0BHYJHd/TmEq7moT/F0UNWotF7sXgO
         Uu/GwD/zyiH12NlyZsgUXZcFb+nt364GqnS9K1usQy+eTU45NJRvbCFghZT+CebUlUMc
         AQjg==
X-Forwarded-Encrypted: i=1; AHgh+RrjR+Nukg8SNGks4GVSy4LsOtDEHrbm4C2qHierfeJLDbrap9oXZmRKanxyG6xw/1BrhbtH21yH/Ysa@vger.kernel.org
X-Gm-Message-State: AOJu0YxCTZq7hfbdCc6XsAvDae3x+7/STMlXjrxgS0djPsUbr0EdspBX
	qzacxPVIdc6Kol1lkmgLyiJ8G4YnGd+nkYNW+Lo1z64Re+axUPcPUamz7+Q892NViJWEOeqyMKx
	TLZJpH2DAZWmYGkiFiquGR8Peyy3NLIdBdQ2QDQp4Vw==
X-Gm-Gg: AfdE7cnYNCGKK4DxzhVJIBrLQ+E1DjVFdHbbdzgMK2qNdAZ0mmo0Ft8VjZJmQ4YKdIe
	Rg/kJbAzXomysekEUjSl4ASKNDuUeQXd9Mx0Y+0q73jEGjMXOFV7+rUufRaH6WaNwcOpEU3ld7S
	ohSefpX1F86AV1aiEHpEJqqM9D/dPIzpcwR1asQCDr0RcAEtQmXpkUMjOzv5C9RqMby0186b4g4
	4Yif00NI2mbmLsrzkt7IzaK9AOjSKOaxI5FyFBqc8bJEXx4i70v+6/JUs9/xjgyuyRL/Tf9cJq+
	aOwJo5sWS4/amxtVPAY0fW7fcUl1UZE=
X-Received: by 2002:a17:907:e153:b0:c12:e178:9e84 with SMTP id
 a640c23a62f3a-c15ce105e4fmr233958066b.49.1783600294225; Thu, 09 Jul 2026
 05:31:34 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <CGME20260627165406epcas5p1be75af2010edfc57cad0f668a8e3568d@epcas5p1.samsung.com>
 <20260627171228.2687857-1-alim.akhtar@samsung.com> <20260627171228.2687857-2-alim.akhtar@samsung.com>
In-Reply-To: <20260627171228.2687857-2-alim.akhtar@samsung.com>
From: Peter Griffin <peter.griffin@linaro.org>
Date: Thu, 9 Jul 2026 13:31:19 +0100
X-Gm-Features: AUfX_mxCKOFC11f8Hhbav9vKUyI4ziXGCV1o3lFI4ikoQtGzaYsKy-SJPukLiaE
Message-ID: <CADrjBPoERcP+G_wqCUx2=3cbwniqiBqrtBAUuSxwBbisJWqQ9Q@mail.gmail.com>
Subject: Re: [PATCH v3 1/6] dt-binding: ARM: samsung: Add Samsung Exynos8855
To: Alim Akhtar <alim.akhtar@samsung.com>
Cc: krzk@kernel.org, robh@kernel.org, conor+dt@kernel.org, linusw@kernel.org, 
	linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-gpio@vger.kernel.org, 
	hajun.sung@samsung.com
Content-Type: text/plain; charset="UTF-8"

On Sat, 27 Jun 2026 at 17:54, Alim Akhtar <alim.akhtar@samsung.com> wrote:
>
> Add Samsung Exynos8855 smdk board to documentation
>
> Signed-off-by: Alim Akhtar <alim.akhtar@samsung.com>
> ---

Reviewed-by: Peter Griffin <peter.griffin@linaro.org>

>  .../devicetree/bindings/arm/samsung/samsung-boards.yaml     | 6 ++++++
>  1 file changed, 6 insertions(+)
>
> diff --git a/Documentation/devicetree/bindings/arm/samsung/samsung-boards.yaml b/Documentation/devicetree/bindings/arm/samsung/samsung-boards.yaml
> index 753b3ba1b607..273464400477 100644
> --- a/Documentation/devicetree/bindings/arm/samsung/samsung-boards.yaml
> +++ b/Documentation/devicetree/bindings/arm/samsung/samsung-boards.yaml
> @@ -235,6 +235,12 @@ properties:
>                - winlink,e850-96                 # WinLink E850-96
>            - const: samsung,exynos850
>
> +      - description: Exynos8855 based boards
> +        items:
> +          - enum:
> +              - samsung,exynos8855-smdk         # Samsung SMDK
> +          - const: samsung,exynos8855
> +
>        - description: Exynos8895 based boards
>          items:
>            - enum:
> --
> 2.34.1
>
