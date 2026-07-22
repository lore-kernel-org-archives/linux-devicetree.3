Received: from mail-yw1-f182.google.com (mail-yw1-f182.google.com [209.85.128.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4A0D63AFD1F
	for <devicetree@vger.kernel.org>; Wed, 22 Jul 2026 03:35:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.128.182
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784691338; cv=pass; b=oLTDijnkXretOr/mpHIr+QQJVgJhzK2SrECszTNzOb6sWCdbKDdYTjy91Kv2W/iVpHKtkuWKYNf3tPg2POritliMdsl9nEZbdnbShAINUlFFwGUPRXPdiFVSMpOwUKtDMCQt2jny0FpO2i5LJLWzR5QrOYU5T/qbRsqBHGyA+oo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784691338; c=relaxed/simple;
	bh=3Sf/Ef5H800PXwQhDeBagKsip9d4VoWdZ9+JzkHv958=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=elCmt240/A+bkRGlmDCAZY/YCJ/wdGyXXHiWNuC8XKw779NY4AC2hrHOSS1Y6U31NOS+Z8QRA3bY85oOp7UYySVopMECRqLuV2MXaS3yr95Z0HGQjCM66ike6TwXu2faM+FdBWJCUoJa5ynltKrAu1SzDlFsCsu8y5H948FDl4c=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=QIkv1PXa; arc=pass smtp.client-ip=209.85.128.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="QIkv1PXa"
Received: by mail-yw1-f182.google.com with SMTP id 00721157ae682-81e83f1f15aso54344897b3.1
        for <devicetree@vger.kernel.org>; Tue, 21 Jul 2026 20:35:35 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1784691334; cv=none;
        d=google.com; s=arc-20260327;
        b=r/Iq+0ZJFMSoMT1uLVRAcxqz96mwlJ5plad5C8NCGpE937lHFlZDxlG9e+dubh1lsR
         8hEbV60dmVLK05eyOtHUi3fBeSkpRBs6eezqyBjCQ4Z+r/U0ltDhmwBMBXPzHZlxq4wB
         /pASTsLGNjE4K0PYvqGlFpr1ElbfIWINMKiFMaZ5eUeTEGyEVESqmxm2KauOsVCfmi7M
         H5Utce6V4UynzYOwYjPHEL/Qcr1rAKsyVJ0Kj+cHWRbj4/DHTCIbRD7C9W1qFqEwg+bF
         UhtA5qkK8NXorVWF0uPAMFEciTshH+xKQEzmy0CixfvOvdhZlFkWbumE/OeV2lLsFkjn
         ONbw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=fwHOybM5kh7M76hGR48ziCvoLZNoVKPyP3zXf5iOrYY=;
        fh=z8cdKT+ryqqHIo6fSZqln/KUPseTr0CjxYHjsEusu04=;
        b=T8xkQyd9PEQ34w2KfOBE7T3s9razYSSlI+N3zHtLHOaJyy3kq92LWzy2ORwYFyyoky
         KBmc+y9eAfCmanFxvPwVSCiI3E2Xy+DpYcmQ/9fVk2Z2mh+aM3/ERKv6KAVWcSJ8DipX
         BBCOZS6vzLmWM0uRJShCOVMFdoXqNOkSaUc3uC69RemurpVg6qsSQejQL/Tj4oKvyWRM
         TT8NDA9OuNlr2ppt6RomrpM1VMT3AoG4pPF0cRDnPSZZQVmyLsvY7jctMQoLvv0pp4Zj
         yy3jserhNPZTB+k0OgbrzHh8TcCCBi0ut+szyyKIYuPcBCc/ZhMqrc+as2TNAjTM6gsD
         6zOQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1784691334; x=1785296134; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=fwHOybM5kh7M76hGR48ziCvoLZNoVKPyP3zXf5iOrYY=;
        b=QIkv1PXazdL0tcEScqFAbVsKqZhIuurWbZoixozFgj3YAy7oLvIWwd6VgazXxE+nbU
         DYIeFCGkJN6xQ69OciJZOT5oZgtoJ9jlqngF7COpIJd0nqoFqX4jtbkKP1vSfY3BLfxs
         yWMBhj/mGltnfykA9olAPKl8VxFbGVPORWLFU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784691334; x=1785296134;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=fwHOybM5kh7M76hGR48ziCvoLZNoVKPyP3zXf5iOrYY=;
        b=lrJF6z50wT46w6ettEtVi9JeOwln0WqWMV5ZYa1vFNg9WrCBpwIi9sgURZGFDsNoa5
         ZnFY4331RPX76yF2xzd+Cv684o8XVoLvZ43WlFLp6pywuHyNpYEn9PLXbJGI+WI1Ko4U
         YPqYEK4OeWD85YBMFqJIpir7WcC6YJ2WqjsMIUXvzOxESOuvWRuRVn8oE2UO5Rv7wXNe
         R7CsK6SS8ZC3RYe3H1e7ZApfrC0TQactMDr5Q/+fvyQc41selziQoH+VUvB/ERLi1fOi
         UXdY3CpX0OqREHohBW1q542I0w//KVUvsheBEpvdANv/MO2V/Tk/WVVqZaNDOgGrcd8D
         E+iw==
X-Forwarded-Encrypted: i=1; AHgh+RrL0YZz4dWuCcoXpS9Ez9YooTTIk1f80+efW8mgEs532Ngdj80drz7K1kSSfLOohNNJibuOIi3A/Zoa@vger.kernel.org
X-Gm-Message-State: AOJu0YydPqkHQMMrIszcuf1CnTCAZgNxmsPnN1NU4kfTEkOQToAl1w7y
	a2fXHYiKLYG6rLuBfXXT1HRPUvG9jC117Uq+dw1LzzOHDAqqxG0ns1vQz2Z7uXw5Ixcj5xlKKhQ
	B0h5yeH1WnOVkRD6I3plBXzy72MoWDEbv8yXEGkj9uBvKfEqhJhU=
X-Gm-Gg: AR+sD12FCP+AUqCQ97Cywn2JvtbUraBCVcWk4P+lnUDk05DpSANMd3DABkAHBl2c+vE
	0JBo2ZOAeNPv8QUWeWlTZ8WbiiCWCWu87LlA+1JETueSsG6jSA7Wa6bgrfbo5oYIMFwgfUyOFH6
	5GeUJHaQt99FX5E5QuJIUZB2/sxdEJ/bkqLRCSkG7yellOCUtqrMOtbyXdujeOjABmepS52sZs0
	vMUnyYYG+ewMO9mqQFueq+3Y1KKKCXFwQBKw0Ana/xBF5yaeWFu7vLsSl46SDGOsMo9q4kxKMxS
	nCtVUfTRv62mggI=
X-Received: by 2002:a05:690c:c4c5:b0:81e:f308:cfa3 with SMTP id
 00721157ae682-81f33bfed62mr7716127b3.14.1784691334267; Tue, 21 Jul 2026
 20:35:34 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260721105230.101906-1-angelogioacchino.delregno@collabora.com> <20260721105230.101906-2-angelogioacchino.delregno@collabora.com>
In-Reply-To: <20260721105230.101906-2-angelogioacchino.delregno@collabora.com>
From: Chen-Yu Tsai <wenst@chromium.org>
Date: Wed, 22 Jul 2026 11:35:22 +0800
X-Gm-Features: AUfX_mwF5azxEMhr_2WNLIrQ4cJxk5YI9R_dQgFYT_P0qpGKSy3wJnLrxRQxP90
Message-ID: <CAGXv+5G-mVf3b7ygb8h4sTtYkACjc9B-VenTqOvbBQO9Pasgug@mail.gmail.com>
Subject: Re: [PATCH v2 1/2] dt-bindings: thermal: mediatek: Make resets
 optional for MT8196
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: rafael@kernel.org, daniel.lezcano@kernel.org, rui.zhang@intel.com, 
	lukasz.luba@arm.com, robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, 
	p.zabel@pengutronix.de, matthias.bgg@gmail.com, laura.nao@collabora.com, 
	fshao@chromium.org, jiapeng.chong@linux.alibaba.com, frank-w@public-files.de, 
	bchihi@baylibre.com, linux-pm@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-mediatek@lists.infradead.org, kernel@collabora.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Jul 21, 2026 at 6:52=E2=80=AFPM AngeloGioacchino Del Regno
<angelogioacchino.delregno@collabora.com> wrote:
>
> Both LVTS-AP and LVTS-MCU may be shared with SoC-internal MCUs
> running some sort of firmware that checks thermals in order to
> scale frequency, or to take action for critical SoC thermal
> protection - and this is seen on most MT8196 boards.

Yes the number of MCUs on this SoC is a bit crazy, and the OS
has almost no control over them. :D

> Make resets optional, as doing a HW reset on such boards will
> result in either an immediate thermal protect shutdown or in
> a rather important and usually permanent system slowdown.
>
> Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@coll=
abora.com>

Reviewed-by: Chen-Yu Tsai <wenst@chromium.org>

> ---
>  .../bindings/thermal/mediatek,lvts-thermal.yaml     | 13 ++++++++++++-
>  1 file changed, 12 insertions(+), 1 deletion(-)
>
> diff --git a/Documentation/devicetree/bindings/thermal/mediatek,lvts-ther=
mal.yaml b/Documentation/devicetree/bindings/thermal/mediatek,lvts-thermal.=
yaml
> index 975235130670..29f431fcdcd5 100644
> --- a/Documentation/devicetree/bindings/thermal/mediatek,lvts-thermal.yam=
l
> +++ b/Documentation/devicetree/bindings/thermal/mediatek,lvts-thermal.yam=
l
> @@ -94,12 +94,23 @@ allOf:
>          nvmem-cell-names:
>            minItems: 2
>
> +  - if:
> +      properties:
> +        compatible:
> +          not:
> +            contains:
> +              enum:
> +                - mediatek,mt8196-lvts-ap
> +                - mediatek,mt8196-lvts-mcu
> +    then:
> +      required:
> +        - resets
> +
>  required:
>    - compatible
>    - reg
>    - interrupts
>    - clocks
> -  - resets
>    - nvmem-cells
>    - nvmem-cell-names
>
> --
> 2.55.0
>
