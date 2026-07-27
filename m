Received: from mail-yw1-f175.google.com (mail-yw1-f175.google.com [209.85.128.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4EA983EFFCE
	for <devicetree@vger.kernel.org>; Mon, 27 Jul 2026 09:46:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.128.175
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785145599; cv=pass; b=swymq/cDFfAmOd8DUjuybZRhEx+BSNXFX//EAYEKqFtKvVO2XpAlFwPEztaE9yCvPRe7QqX+3utjFp7XuY8s00Ty47ZsDmbGqpDvKaR54V7L/+a4U6sm7BnqJtx0JWeDjhR7B4a1rcI7XsWiKEdt2LVSz4okDkHLKskJ8cr0OXE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785145599; c=relaxed/simple;
	bh=JIsVCCi8V6pXUaxHFE2htTqwKO/SzOg08RdktddYlhg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=sxqpggFCEkPaJmTgyT1HkAk1Qle68onHJnX1UP9GoAr23KomYDtk0275Hl0xHQd6zbmnwxHOs9imNRGTQFHe4gAs09Dy29I+cXrSmgxQ+LeCvh3+BWzGxKMPnu6H0VdytRvVHgXNSDjRX6/QGehnJpkOasn5I1NdT7JIOUQ76+I=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=M2hSHutI; arc=pass smtp.client-ip=209.85.128.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="M2hSHutI"
Received: by mail-yw1-f175.google.com with SMTP id 00721157ae682-8114a4542b2so33541317b3.1
        for <devicetree@vger.kernel.org>; Mon, 27 Jul 2026 02:46:36 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1785145595; cv=none;
        d=google.com; s=arc-20260327;
        b=ZAiYg8uzhbQW4MGxbFXdXa9a1QZmJrlW/r+mb05G9i/IGEjNza8pUgm0k15FrwiEU4
         7rZFdj7PxLdI0OxXCiTuoLYeZO4ohU4jWUJYO4q84M7h0OBCgLte+oD+foUZhwYZXwZV
         hH68CRfpqONjAcKVckbYBAWwxWB5rWsut8PM8cYd91lMvc1iabDllMrQcr7/MR5afK+z
         q4xMMbIz3XGXax6Zh9j9p5MBAUz8V5Wik34NaNrpdn8/oPeG0bMOpkY0QBYYFqRSAS6+
         k5U5leOf4DoyU6XziRN3XBeOFFJR6dAaERQV+6ORdRQg71lhMbY5sRxw1n96D+OQZj30
         9Sgw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=5xG1nDaySHmAHB2DEV/3BuD9VMX1Zk/iy2QTvLRNOc0=;
        fh=DMINyI+/3jQ+vpRyHRN0V41BlLGVAIbrwY5eMk80kes=;
        b=i21CXJSlok/tX3CNpX0GLCqLInULCsGYpGHC0KwnFqQatMBByM8HNyIeC6PmnW9C7j
         mH/EF5/XLzMhcefkiB01vPUS8g0Nk5jBDvtgOUbU/JBnLeUuBZC64icKUbZd5NLyJlO2
         nUda7WYFCdOocBagJRVzdg9rT05y2Hl/Z17KdLHjYnWwrQUDzQNt8TLpspAYlvwJVyhF
         ZnZrkfEEn91UDbqdDkK4PDTDKO6HI6tXom7deWVF+905i39zKuGraQ/CPAW7aa/kpZs6
         JCfTcvPiT72MutJk8jSlt64zGbgRbDMgGwwOd4qa+M2G+IdeQR8WeONZBZ+VjUEF6Gcy
         SKZQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1785145595; x=1785750395; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=5xG1nDaySHmAHB2DEV/3BuD9VMX1Zk/iy2QTvLRNOc0=;
        b=M2hSHutIRSsVGdnUYrR710qpDvGnhNDWtAG84c0LzWfEwDltjCvECG6VJi28HvxRlm
         2aZYcvux3m1xHbWXAngKl+3B+QjBKjc8TOJs9DObhnAqhTWOrsn9Nbptp2h9p63Uu+hg
         ot+B7JFAlv9WIb55oMlUg6eWFKljG8328dGVg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785145595; x=1785750395;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=5xG1nDaySHmAHB2DEV/3BuD9VMX1Zk/iy2QTvLRNOc0=;
        b=nRPwv7qEbbLWtXhkMiFVwEEk1YGgtnEX9rQtxOHl3WT5rcmE+Bnb0JkNAG5947Knt9
         8Svtd2ZhQEAsUGdCbtJCptILvm1BNLwZy6vpdrW0bDl2JQixSdwQbWt87xwAsgcsMkFZ
         j/KZtHWY7qjATTF9O0WDrKsg+u4nsaZS6SEdc4QUQGkcnsCuGCe/0TyFMf/64Lh3U86V
         UqaDph4OvoKrwvqcUWP2c+WwZm4LGuAHT98hW/3fQpRfdvUZ4fiKQjUFspLyVX7SnBpA
         nG6C7H5MJvdqyIZoCF261T8Gqg0Is6bwTAuJRLwSEQMOFPRHHcRuaPu53uk38Rey0RFy
         MjYg==
X-Forwarded-Encrypted: i=1; AHgh+RomAkrdMFyL6S5DmDGomwj4uzlJl1sHV/ZV47uCZ2vTTRGPrQH2jSD7vNnRV7fsBggJVsPZ5J8WEZRt@vger.kernel.org
X-Gm-Message-State: AOJu0YwsYDKQF/81cTQ56mRyL9HBiuKueF7hTQ2x0BaAzy8tyarhi5eT
	qBHSTvmrkDvsbHMWV0NMGji1oh0yQTYxNLdIBQVHiuQtvoUfP8vgkLj6BPJCZ8ThH/qBoSbbmm+
	nGz/5p25KSeN6mH0DF4LRAvMKjI28EwHxiS9pAWAp
X-Gm-Gg: AR+sD12m6UAhhnOCqJBjqol/Fn9BT3+mc39viYMl51bH/rwQ02dU6/cpIaFYzpUB03J
	wDMrdyj33xhEadGezntBRXBLUPdJNd6oQ7cfhxSY99lun6SKS7w47gQj1TQwU8tI1tmi7Epr9Q/
	TbmaC7sOlWB9IoySOBNpPs5Z0gViAtzxrFTJB1WmRH7f89RyKWrKU2g2mTqQhtjvepwE9zFgB1M
	wAMeNpXTHhW4AzUTnxff7iBjQKYYYo/0q3vhAkNWdla0LCQV3bJaKSxaDQtwQqsSsrosK7kDiOC
	AreeNHpMcumh+u0rE6mDF1ij9g==
X-Received: by 2002:a05:690c:6181:b0:80c:85e5:875f with SMTP id
 00721157ae682-81f69eba0edmr24598547b3.72.1785145595033; Mon, 27 Jul 2026
 02:46:35 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260727091555.1023910-1-wenst@chromium.org> <20260727091555.1023910-4-wenst@chromium.org>
 <20260727092643.DC90B1F000E9@smtp.kernel.org>
In-Reply-To: <20260727092643.DC90B1F000E9@smtp.kernel.org>
From: Chen-Yu Tsai <wenst@chromium.org>
Date: Mon, 27 Jul 2026 17:46:22 +0800
X-Gm-Features: AUfX_mzT23G-wjGIUddVGsL0RVNkRttwnekF_vtMZP2gVoUR7kldAOLqEdVKh0k
Message-ID: <CAGXv+5H6U0ojv5c4P4CgOjJNCNNYvn1Xdrmjb_TyZ1-nKagYrA@mail.gmail.com>
Subject: Re: [PATCH v3 3/5] dt-bindings: gpu: powervr-rogue: Add MediaTek
 MT8173 GPU
To: sashiko-reviews@lists.linux.dev
Cc: robh@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org, 
	dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Jul 27, 2026 at 5:26=E2=80=AFPM <sashiko-bot@kernel.org> wrote:
>
> Thank you for your contribution! Sashiko AI review found 1 potential issu=
e(s) to consider:
> - [Medium] Schema validation failure for MT8173 GPU due to inherited powe=
r-domain constraints
> --
>
> --- Patch [3]: [PATCH v3 3/5] dt-bindings: gpu: powervr-rogue: Add MediaT=
ek MT8173 GPU ---
> commit 560e4cee0c5fbc6b0c5d09c24c260e205ca79e47
> Author: Chen-Yu Tsai <wenst@chromium.org>
>
> dt-bindings: gpu: powervr-rogue: Add MediaTek MT8173 GPU
>
> The MediaTek MT8173 comes with a PowerVR Rogue GX6250, which is one
> of the Series6XT GPUs, another sub-family of the Rogue family.
>
> [1] https://lore.kernel.org/dri-devel/6eeccb26e09aad67fb30ffcd523c793a43c=
79c2a.camel@imgtec.com/
>
> > diff --git a/Documentation/devicetree/bindings/gpu/img,powervr-rogue.ya=
ml b/Documentation/devicetree/bindings/gpu/img,powervr-rogue.yaml
> > index a1f54dbae3f31..53131cd4cc2a3 100644
> > --- a/Documentation/devicetree/bindings/gpu/img,powervr-rogue.yaml
> > +++ b/Documentation/devicetree/bindings/gpu/img,powervr-rogue.yaml
> > @@ -15,6 +15,7 @@ properties:
> >      oneOf:
> >        - items:
> >            - enum:
> > +              - mediatek,mt8173-gpu
>
> [Severity: Medium]
> Will this cause schema validation failures for the MT8173 GPU node?
>
> By using img,img-gx6250 as the fallback compatible string here, it seems =
this
> will trigger the allOf conditional block lower in the file:
>
>   - if:
>       properties:
>         compatible:
>           contains:
>             enum:
>               - img,img-bxs-4-64
>               - img,img-ge7800
>               - img,img-gx6250
>     then:
>       properties:
>         power-domains:
>           minItems: 2
>         power-domain-names:
>           minItems: 2
>
> Since mediatek,mt8173-mfgtop only provides a single power domain, wouldn'=
t
> forcing minItems: 2 cause valid device trees to fail dt_binding_check? Sh=
ould
> the conditional block be updated to exclude mediatek,mt8173-gpu?

Yeah, and we just assign the same power domain to both. The bot clearly
didn't look at the dts patch.


ChenYu

> >                - renesas,r8a7796-gpu
> >                - renesas,r8a77961-gpu
> >            - const: img,img-gx6250
>
> --
> Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260727091555.10=
23910-1-wenst@chromium.org?part=3D3
