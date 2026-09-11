Received: from mail-yw1-f174.google.com (mail-yw1-f174.google.com [209.85.128.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BFEBF2E975E
	for <devicetree@vger.kernel.org>; Fri, 11 Sep 2026 00:42:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.128.174
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789087375; cv=pass; b=ex7Alk0w7m4tGV5ztn5MPGrLqVCF35Q+KT+XAwnigbVy2Rs8d8yQvnNJuc8noPPO7rDqSDhcc3ijawR7HFEJkhvjVkcIJ3vd5ejezeVePEXvbLmblMNMsrbZMkjnIa36XCyUF0089hoSHMj0y68OcLkZVuTsIMEKYihE0MT0ujQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789087375; c=relaxed/simple;
	bh=s9iYiLxHL7U/2B3sedn7a7chFI9A193m2Bj539bDZyo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=e/ynushkt3LExyRxOsKm1zCD/GU/1CxIgI5WURZL7OkL7xu/Ywm5EpGcvjQQVJv1sK2ml5tow6YOXOOyyfPWBJiLNUO2RnWjXg+nuo4PgyR9vlmOUmgM2U1/RC4USxAwqML3gpeoN5/8j4tsDcMGaPwlGGqOnq1HVV4fTLYt0WM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=s9Hhm9x+; arc=pass smtp.client-ip=209.85.128.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="s9Hhm9x+"
Received: by mail-yw1-f174.google.com with SMTP id 00721157ae682-855c26cf490so2009447b3.0
        for <devicetree@vger.kernel.org>; Thu, 10 Sep 2026 17:42:52 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1789087371; cv=none;
        d=google.com; s=arc-20260327;
        b=VNolT0eP4hm2OPMHfcDRhvxCW4Yk4rxPOQ64Po0h2Zfr3YFF7nV9OSHcKWQ1z4n/2D
         o10Ub1YAeKWKWTZ2tpROA5z7P1AeRUhHwCEy+DoH1ib16bXJAUY+dnr2A8Jb6uABSWSP
         7yav8wWeG0yB1+K5q3t/okct6ME4m49nr1DKQMWX0Qv1TeXKkmnVQ6LcqEPBjmTx90h4
         5HqyWL5oxjkd/52JUod/NRppVyUjkuAVt5T2WTn/cuhiQLz1E6YPNwuOoheWGB87mVhk
         yFcnijCmdX4Nby5OY0L4s6Q3iNAAIAYWW2hi0lEGG2IY00aVefyBg8OYpZlKdjzeRcs8
         ZM8w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=s3WVT2KPS4E/U4EB6j60mzQ6ExLGgX3JVRLYkcMa7dk=;
        fh=NbVWk6vC3lSFd6h6Ch7AY4cBJM3eUaRche7aZjMzzQc=;
        b=dHqBcbYmyER67n7B15qMhVg4RrOa1sg4Y2X+cLgBV25Lrv+5Xd8b9HIR+k/x7z9RsQ
         fFJk0ieYNaPRYHubIZ8dNjeEQljMbmKq+b52IaUD52xh/3j/z9gF0iIx72RbhmThGhQt
         stRlZjyIh6NC3WBzfX+uS3+k+ahh2k7V+4Fjsuoq57Yrfov+bIchP33g11p69I6vPH3M
         ugQUsbS1HgF7Qbx4AnH2DjTm4EHIxBIn3EA6Dyi6BgURsL2U8kd5Yi+9KGGnYQjo5M8a
         sh8FGVCYqub5jcUD+bx2sKV1htL5eZwvoS3VxapY2g5HW//TRzBNVXS30g4xztaW41re
         3NfQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1789087371; x=1789692171; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=s3WVT2KPS4E/U4EB6j60mzQ6ExLGgX3JVRLYkcMa7dk=;
        b=s9Hhm9x+YDQG69tX0j8jBrKCIJKTZdwzTvn0Y461nXRP57BUQt1qB3MWpTro68tKY9
         mf6K0M6ThgvID8jGDZe5K8gPjy1urNMD/t7WQyREItsQi8rVeCWb55uY58yeQ4Bb9HqC
         BEVeEvOc8CerQqH6KtvRzTTpJC/nEenzz4qD2Jf1+BFeOtVTVokuzYfPBf5izs64nl+e
         J5ngxdJnsEqLv74TN2LFgWJG0h0eJsSQ5r2dml4UHMPvIjSnUlFeppxX8Sh/d0i7/aNx
         OtomYnEQDg7GQlnSXaLbdJnl5ItAraMNCX1ZNUNnIGfWbz2J51PLDselUWrwVquUrv0s
         m5Gw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789087371; x=1789692171;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=s3WVT2KPS4E/U4EB6j60mzQ6ExLGgX3JVRLYkcMa7dk=;
        b=Gl2ij9DN/fWXwerOkf5EyLbPTwJWT3ugjD3IfDGMM/ufltSWqycJwbYng6ujbuBw6O
         qKKIae5VEo0ps6ZAcHMyZQpB1FV39xDhq63uSUA6nh33lyUrgHEIIeEtmvUOeTl79QBv
         88HC30E/nBlwRegbV3JPVUybHqGBBcqdWmEoIQzSjzaaA0xwENsayrNFhclqKFK1Edp2
         FEEvctcEIXwdlKf97E+FrR65WUGqzFTHrW9PfZ62YJAiSDK4ZmohyugmGQZh4a+t9qla
         KLJAAiaYg4cEmTSxFS7sVm2RoIUya4ZZ95V4T0LynUPWiAfvqOjHfrz/bhIXCYW2phRc
         F20A==
X-Forwarded-Encrypted: i=1; AKwUvBwat9CweOaHn+IRPKmN8wy4kBumTiNiZTENRBj6hCwrqKz7RJpSfQD9j68nSD0cmj0J2qfKARSwLchK@vger.kernel.org
X-Gm-Message-State: AFuF++lHoIhqvEXITtObizeVzNVwrXh3h85EhmYdGsJWJa74vzG1PHR+
	GyeoqtiAQ4wdXKKlLi8UzrG8eUM1kFGNFJ3ZGaiPDD6LOYan/RfOCLlQa0e1yWYHByOuM5cjoEj
	5EphPSoGXhHNxJY6CUwIuqZa4/Qol8gd/RQytVu6l0Q==
X-Gm-Gg: AYBFou0rXpxrGpCAYiNu1VMB/PuDPmE/VwMJcNLQinvZM1zwdHXbU0GQg/KxFjY1MsJ
	vKZCMW66aFVuhITsWMFxHEUgsx4hf3eUemne/BLBzO1kg6DXoYHKYCGBKN6T6KjbpYfLs3N7emX
	dh+rOSOB08LnG9HB2Ojp3jSUOosicCmliEXR8RiecS5Yp6TNmYTM8OETJ/nHXpknXnsragUWYle
	O7zSnL9XurONNJauSehweQkjLDM1HZJmqxy7ATuFFcarUIEvxXfxP7K17JwRmQHFJ228mJ+aAgD
	56h6fDsZ86jMZjmBKk2tWp1CcNXvJDBBpXW/kqdUprP1wQtvoU/7UhqGf82ZPS5CBlwE2B61twK
	Rctd9s+O5ITZmWw==
X-Received: by 2002:a05:690c:660a:b0:873:5ddf:d862 with SMTP id
 00721157ae682-884b3873114mr9013287b3.45.1789087371068; Thu, 10 Sep 2026
 17:42:51 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260727-exynos850_sram-v3-0-8627a49188ec@linaro.org> <20260727-exynos850_sram-v3-1-8627a49188ec@linaro.org>
In-Reply-To: <20260727-exynos850_sram-v3-1-8627a49188ec@linaro.org>
From: Sam Protsenko <semen.protsenko@linaro.org>
Date: Thu, 10 Sep 2026 19:42:38 -0500
X-Gm-Features: AcwNN1WDjFTgB-aBDySNIcrpUgOjcJa8lLtJJ127JD23ekWYTtDiP3LdRVUZsB0
Message-ID: <CAPLW+4ntx8qLy9jAYYdT+XwxwKHjvisutqEi04oPEQny8auD-Q@mail.gmail.com>
Subject: Re: [PATCH v3 1/2] dt-bindings: sram: Document samsung,exynos850-acpm-sram
To: Alexey Klimov <alexey.klimov@linaro.org>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Alim Akhtar <alim.akhtar@samsung.com>, 
	Peter Griffin <peter.griffin@linaro.org>, Tudor Ambarus <tudor.ambarus@linaro.org>, 
	linux-samsung-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Jul 27, 2026 at 8:23=E2=80=AFAM Alexey Klimov <alexey.klimov@linaro=
.org> wrote:
>
> Document "samsung,exynos850-acpm-sram" which represents an SRAM region us=
ed
> for ACPM communication on Samsung-based SoCs.
>
> The SRAM is consumed as a whole, is not split up using child nodes and
> properties related to this are not required.
>
> Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
> Signed-off-by: Alexey Klimov <alexey.klimov@linaro.org>
> ---
>  Documentation/devicetree/bindings/sram/sram.yaml | 2 ++
>  1 file changed, 2 insertions(+)
>
> diff --git a/Documentation/devicetree/bindings/sram/sram.yaml b/Documenta=
tion/devicetree/bindings/sram/sram.yaml
> index b83fc6831947..b9c4d4f3199b 100644
> --- a/Documentation/devicetree/bindings/sram/sram.yaml
> +++ b/Documentation/devicetree/bindings/sram/sram.yaml
> @@ -43,6 +43,7 @@ properties:
>          - qcom,rpm-msg-ram
>          - qcom,shikra-imem
>          - rockchip,rk3288-pmu-sram
> +        - samsung,exynos850-acpm-sram

Is there a reason we can't just use "mmio-sram" for Exynos850 ACPM
needs? I can see it's used in the gs101 device tree like this. If
there is a reason for this, I think it might be a good idea to
document it in the commit message (probably in both patches). Also,
should "mmio-sram" be added as a backup option (after comma) in your
[PATCH 2/2]?

>
>    reg:
>      maxItems: 1
> @@ -159,6 +160,7 @@ if:
>            enum:
>              - qcom,rpm-msg-ram
>              - rockchip,rk3288-pmu-sram
> +            - samsung,exynos850-acpm-sram
>  then:
>    required:
>      - "#address-cells"
>
> --
> 2.51.0
>
