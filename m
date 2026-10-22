Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.222.53
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792660540;
	b=hj6lYfP3CLnz3Yjo1+ItPAEb180WbsRhmJGXNkCOaZG/y5ytQDkfS5Z1AVz3dCu6OEuh
	 x3++WWIMjTa42SjUVePv61pi0BnTs+4ph8pmPkbkHhJViUAlzZ1PZh0eX2Az1op+1hZrg
	 B4hWnLnayWbPRxPwFJ6tYn6nKkN5aSfRCyCHKOI5v7HEhLYE7GzODL00adSYxEU1rKWmW
	 MYuJoNHZByHVh3hSTm1eCkyg2o63LENZs7Q1HTNuRgzSEaHDmCU/+GajCzJTgC2ZJaj+n
	 Vvr8/FZw44vaz1nMufR4ppjNEU8yXiJr51xHCqBQWvT2wmdJUw5FV0Zo9dBpi7kBc8w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792660540;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:Received:
	 X-Forwarded-Encrypted:X-Received:MIME-Version:References:In-Reply-To:
	 From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:Message-ID:
	 Subject:To:Cc:Content-Type;
	bh=dAtGHKvYVTH00WDKTEZ7akrxcfMPHzXwthZt16huB4U=;
	b=1cKGCXMMmsaA2b/Wnp13XOl9gRLROMJSUAaY29CiW0Ul4uoDtx388lX4YQcn0i30Cua7
	 qfxH5so3YocHMEg9AKovZaCVXRv6c3l7StGgkZNHwTgeTTF07/ytM7TZ4TZb32Y9PdIy/
	 6k3s3cLZbn60ziuJUN6skqGz90UDgLZ0R+Ink6lTKxZTmXULraGMkrOIjeFAIZNxLUiRG
	 rMAmfXvaHCV8evDye1O8icrVKLyyr036u9RJGUG0gsTTGdo+SwUrC1pHGOqFYkhIb0LwC
	 vMWDacK9V466fnqMq+4EPNiGiY3Y7xmEh+b+5TYvo+V56XntPsV4g1WjqFokxy7rMdg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=linux-m68k.org;
	spf=pass smtp.mailfrom=gmail.com;
	arc=none smtp.remote-ip=209.85.222.53
Received: from mail-ua1-f53.google.com (mail-ua1-f53.google.com [209.85.222.53])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8C64A606A33C
	for <devicetree@vger.kernel.org>; Thu, 22 Oct 2026 09:15:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8C64A606A33C
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ua1-f53.google.com with SMTP id a1e0cc1a2514c-988bb309c2bso938336241.1
        for <devicetree@vger.kernel.org>; Thu, 22 Oct 2026 02:15:39 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792660538; x=1793265338;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=dAtGHKvYVTH00WDKTEZ7akrxcfMPHzXwthZt16huB4U=;
        b=xXIGKoKfxHPta7i/G8N5QJ4yX6P8/MEU1f6E1msy8EUdKT8pAP81TGmDaJ/RZq9OWl
         IHKNQGU92wVIetPkTPEkVUci062OAP6JxZEKXqErO9fm0Dh7gU5KWd+zTCMGt/oadGML
         kcwhkzMCC7W1xGbxIuCaA/MRX+o3Qf56ozYAaQezEOowa9V65eyo9db51F4DWwC7hKio
         fvtJMDfCM6/sqzyRgZllp2HWEZRtsqpP+MY4/cBddAKA74IjOt/uQj3P2PmJ6Z15y1Y0
         5pJiYY1mwSFCYxDqtFOly4MNkD4d1XmrgjBb0XjPUz8avBTOZXfym6+H9CjkvNGFRWe5
         CAug==
X-Forwarded-Encrypted: i=1; AKwUvBxoAmrXxQqdGsSmPjDpi/ui3OrJBAfFS2N3zsc/mz2DW6IJi5QQ8Hb+7ayRhwli2MzYwz8UElAu3MyC@vger.kernel.org
X-Gm-Message-State: AFq9FYI9QpVQ4uZM5pmd5Y4NkHYYUyY+AhtaaQBXmUpV69P3tIxUQzzC
	at0A6SgrbXHlSYiyNNt9QPVHDijJQVBIINyBueVqFRQBewIiUGtZ7YXdLuOlQCH/
X-Gm-Gg: AYBFou0LN93BPgjVSkWkV4nlJTC/HAY11kaPO+Et+ulQ7wIv8FLapvtNV4BKc85lQsI
	qAD+zGlytKWRxmpfNpNwtZSP3dcR2/8Hw9iyau3Q6Ugq8x2f2R107cmGl8hIh0gz0nhRGmB/5u3
	Oda4DlzFJnK57AlWwWR0XwBPIBtvCfjdSuT0In5VwOUITMA3w21GVrNm7b07b7DwOrgQfa+mKdp
	id6spbqgcZNbV5X3cLJR6QtoGTJq3lEn0ZoTK6XlmQmU766bFxQ/hLLIED4xVEt+r+2ujqUqt5o
	OAlOMZqlSWSFN4gf4TSrU9UGVhiSCPsCQXZXZ7ahz6ull1ITOw0zAnduBwKEA0Ou8bZwYsodJZB
	nrZ0kVVg4d+8Q+ysXKV3OJvjc5NOWh56AwLXyWQbCri+30klE2PAO9NoHK4BYsHILOnV4yDdezN
	2AZjQxRqXXRd1gfrxuF9b90RUE94wJTl55SvGgE16iY9wfyZZLkgfCMabNaEo1Hyn0LYd3qHHl5
	ey4S2dD2QjITQODVyJ6h6Ae/wWEsmUcrn2/4rwZcW/8ORqHIaNHqup6aKXlogaG20fzDoddna5d
	ytoE6+sVp5urW5SN3g==
X-Received: by 2002:a05:6102:5489:b0:7c0:4d52:8cc9 with SMTP id ada2fe7eead31-7cc9265f63cmr1798954137.14.1792660538545;
        Thu, 22 Oct 2026 02:15:38 -0700 (PDT)
Received: from mail-vs1-f48.google.com (mail-vs1-f48.google.com. [209.85.217.48])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-990d0e0ba56sm5934523241.1.2026.10.22.02.15.36
        for <devicetree@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 22 Oct 2026 02:15:36 -0700 (PDT)
Received: by mail-vs1-f48.google.com with SMTP id ada2fe7eead31-7c3b75caad1so995436137.0
        for <devicetree@vger.kernel.org>; Thu, 22 Oct 2026 02:15:36 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBz1ohTnIVvLV3oOuIKIs9jvLUZDSld/yzXO8iIxIielpuLSV8eaJ2ePBMPX1aFPrzEGzGe8zt9JwNv2@vger.kernel.org
X-Received: by 2002:a05:6102:160c:b0:7cc:1a41:20fe with SMTP id
 ada2fe7eead31-7cc926de9b8mr1860786137.25.1792660535752; Thu, 22 Oct 2026
 02:15:35 -0700 (PDT)
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261022044135.275485-1-artem122novak@gmail.com>
In-Reply-To: <20261022044135.275485-1-artem122novak@gmail.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 22 Oct 2026 11:15:24 +0200
X-Gmail-Original-Message-ID: <CAMuHMdX3dpM2D+6YTv5Db_Y+ZFa6e4nsB6mN0XjgNGBh=ZE5XA@mail.gmail.com>
X-Gm-Features: AclHuK_4BpDXw1ghhrrGwm8j_I-lCmzvQXgOFhpdarQQS7IFAgX7Ig0jOu94rnc
Message-ID: <CAMuHMdX3dpM2D+6YTv5Db_Y+ZFa6e4nsB6mN0XjgNGBh=ZE5XA@mail.gmail.com>
Subject: Re: [PATCH v2] dt-bindings: timer: renesas,tmu: Add SH7305 support
To: Artem Novak <artem122novak@gmail.com>
Cc: daniel.lezcano@linaro.org, robh@kernel.org, conor+dt@kernel.org, 
	devicetree@vger.kernel.org, linux-renesas-soc@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Artem,

On Thu, 22 Oct 2026 at 06:41, Artem Novak <artem122novak@gmail.com> wrote:
> Add the SH7305 compatible string to the Renesas TMU Device Tree
> binding.
>
> Exclude SH7305 from the mandatory resets property, following
> the convention used for older SuperH TMU implementations.
>
> Signed-off-by: Artem Novak <artem122novak@gmail.com>
> ---
> Changes in v2:
> - Rename the compatible string to renesas,tmu-sh7305.
> - Sort the compatible string alphabetically.
> - Exempt SH7305 from the mandatory resets property.

Thanks for the update!

> --- a/Documentation/devicetree/bindings/timer/renesas,tmu.yaml
> +++ b/Documentation/devicetree/bindings/timer/renesas,tmu.yaml
> @@ -51,6 +51,7 @@ properties:
>            - renesas,tmu-r8a779f0 # R-Car S4-8
>            - renesas,tmu-r8a779g0 # R-Car V4H
>            - renesas,tmu-r8a779h0 # R-Car V4M
> +          - renesas,tmu-sh7305  # SH7305

Nit: the "#" is no aligned with the other entries, please add one
more space.

>        - const: renesas,tmu
>
>    reg:

The rest LGTM, so
Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
