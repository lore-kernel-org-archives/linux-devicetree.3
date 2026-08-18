Received: from mail-yx1-f42.google.com (mail-yx1-f42.google.com [74.125.224.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DBEDA3ABD99
	for <devicetree@vger.kernel.org>; Tue, 18 Aug 2026 08:31:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.224.42
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787041903; cv=pass; b=upzzEWiIMOStPLQmSr7h3YiLjKf0xqJsGalrK4Lsqrp8ILEDBl+Gw4L799kaaG+g+P42fQSIpd7RfrUK+WAwNnb+WV5X4gMUo59+Gl1LEb9w/kmtxnq2sUJLCpXBvxak2rme8ePpZqTMAPFw0wZ8rd5iy3Kkr94WZEovYf2ukhU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787041903; c=relaxed/simple;
	bh=gjjShqo8syZmwJoo4o5vHo8yhaC51mTKCBR6OWSPlpQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=g77c6GQq5kJxl/baY/ByIEREzgj+qGxupmugal9oVWUyBRtxusz/rid9Ctq4o9w7aPZawSjmx+BAtz0TpxLFaprfz3oum9SMlv9SQESI9ECelCkVYBOnNlC7FUYpEcUyYQLWnNnXN8T1ZMY2ZGsnsPEc0hxO983x3wfCUIjNXYo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=brFBZ3Hd; arc=pass smtp.client-ip=74.125.224.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="brFBZ3Hd"
Received: by mail-yx1-f42.google.com with SMTP id 956f58d0204a3-66c70f05859so6766071d50.1
        for <devicetree@vger.kernel.org>; Tue, 18 Aug 2026 01:31:39 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1787041898; cv=none;
        d=google.com; s=arc-20260327;
        b=BgNIfEByLTEkiSH4c96S/bvA1tJF4QiC5OzTmqfc5VD8RjMWwwhFNpP7OX4WlPUWuc
         nVBQHFILIveG0Fgur52Ch/AoRFUTzwZBiwfTwZd/m8lSvOzp1QHkPCr+4/m6b9VKeduv
         /+UpwAm7H9WVGvmZ3lhVanSW4TpJEavqp8d97tkhIJocnyxr9gk6wqXlGcHFrcCue8N1
         qkQO1guvo1Dp6tJpaUAmlEc7CMVczcFOHT00bjgXRkFeaVsdOIxgMUMytCJAlh6HKraG
         zOAiUEjW5SFT3UQ4Ezw8LrY6UTcJbsccNS44OR+whW4dFnVqLw5ErsUlZ4IAqseviR1C
         HkEA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=dfdTY8Y/98iAgDoWrwX8Ta02qcU1bB1m8ST5vvrqUQA=;
        fh=LIEOrJ31arJwWr+R1UG/ebKucYTJJ2geAtHwjh0fWM4=;
        b=TK8FuBrUcqqigdYvSe13RfdM1XXQi4vG3ZLFXhJD+XL7q6d2nOotu0jzHMP1BEZqqp
         VYioDC7bZiZpbvVGj5avl/Amxzsmxz1tL3MfIrTvvvYc+1G+tbCzXa69wPocDsIpULzt
         DFTijhpp3ZZcwr2DBh7YoVadJaEDIFPJZvct5nfptAeGxjeYO6Z8BA4KDgLfjCYq2hko
         NGVja9drWfB0ffaL3ZorLm1Ilm+hnFHkBVIoy76QKz4/Uz1YWPbRGwPPBxRlIMVuyR2a
         If3yoYkTn0RrpPeCcALqCG5cmPq8K95Cn4T/huFDtMFrfrV128V21AiOxqjHvOWR13VE
         fHiw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1787041898; x=1787646698; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=dfdTY8Y/98iAgDoWrwX8Ta02qcU1bB1m8ST5vvrqUQA=;
        b=brFBZ3HdtJf+Q7/wb3gWLaLOVO4Zb3ZOtTzagLPKporBH3xsHaG8deaa7HfvnCRhGo
         x4E8cqpIUBI3FYyQCkk3fXeQfgrvm6kr073b76J1eGYQ96/XAIKVON32Lz1bCdqbgrXb
         G63jjTxTs2dxO4n+VNr4vZFRn3r/U9YLxRCK0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787041898; x=1787646698;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=dfdTY8Y/98iAgDoWrwX8Ta02qcU1bB1m8ST5vvrqUQA=;
        b=GUO+kxt/3Rz00AuiP6cZyWWtMOWsF/7/zMWttcfz1pzUwf4mJMMM1+yzOaLR8b4FwY
         Y/l7zAgGRNo245PSL/WeKRq5qOdUL/qSKRObKo0psgBoLdoVkrAZ0EqH9LvMlK8UgB2Q
         5IL8rj9/sbJMtzfYV913i0EAauA9Nit0yy5etv3d/8tuKJsGYAFmquzMWAuQua16N0zg
         Pc7MkFi8TH7Dl1Wn+uTgbrPrhFu+z7jHzofyIVXvi6wB5g0Dji9mpdTQSfTSj8ZkCX0R
         MG59KgzU2w2cQzhB4naMOYVSDwxtXm071Jb1G1gppxd7bt052FB8fgJ11yJfM5T7WG1+
         8eew==
X-Forwarded-Encrypted: i=1; AHgh+RqOzUmoDhrGfB61fedbFQClriwn5i5GMdDcSl4wDuGCPnppmZ+i0xowYCnUOCbgKUcKUCe8nvbhwhZl@vger.kernel.org
X-Gm-Message-State: AOJu0YxH3KI2XpAFEHcO1Vhg2rutnzc3/raOwgcbgJmsoQsU8QhVq7Lx
	jgo1u2o67R/i2uD7ivEc5UAamEs/34XwM/mg+Cd+d1L+0Z4Kt/J6VvFw38kLcqjqwZZeRKEHP//
	N/8za6ubmA4N/xwzX6nCoC5e0bBAJ1tTWkEf0OG/c
X-Gm-Gg: AR+sD10TuqtkyDRdzQ4q6Rnse9kSZL4CU/TTjs8PC3Ivh+u3M2xBiQZZm2mSl4gaSEH
	7d1pxxEzyC3Ra/xe6aqfHiLD/mkDopexv58selCe3skineE6NiWGnVkTMStsm9NkDcvYXSdDAtp
	bANZs7PGJNoAn9nlTsBY1Y0lJ6iRBjdH87GalZ54N4EgEWF5QqmYUH6w99YiJof5LWT+19JGFIm
	MGN2381TaktZWyFJHLZzR8Tkv4QB+y6nadIQTJuUzs1BMnI+J7GRZb4jqlIYqi7QBiYL67ybEnP
	Z4LPTRJosrBuG9qz2vbIS5UK61vStkPErD61UZhlYhGG3jNKHXAnaoqPdOYQE8S8IacSHP8Q2A=
	=
X-Received: by 2002:a53:c4d1:0:b0:66c:4efb:6518 with SMTP id
 956f58d0204a3-66c72baf01cmr8580735d50.21.1787041898396; Tue, 18 Aug 2026
 01:31:38 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260818020559.961335-1-xji@analogixsemi.com>
In-Reply-To: <20260818020559.961335-1-xji@analogixsemi.com>
From: Chen-Yu Tsai <wenst@chromium.org>
Date: Tue, 18 Aug 2026 16:31:27 +0800
X-Gm-Features: AcwNN1VGsFRcmxBd0eaQBErQ1j0aAV9aqPfggU0ckpHIe44jjjRliakIjKjafgY
Message-ID: <CAGXv+5HYKJtC-3Rj9u-9AucAYQiSB4DjR=Z1vv_fRuHobY8Cpg@mail.gmail.com>
Subject: Re: [PATCH 1/2] dt-bindings: drm/bridge: anx7625: Add right justify property
To: Xin Ji <xji@analogixsemi.com>
Cc: Andrzej Hajda <andrzej.hajda@intel.com>, Neil Armstrong <neil.armstrong@linaro.org>, 
	Robert Foss <rfoss@kernel.org>, Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
	Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
	Luca Ceresoli <luca.ceresoli@bootlin.com>, David Airlie <airlied@gmail.com>, 
	Simona Vetter <simona@ffwll.ch>, Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
	Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, r.mereu@arduino.cc, 
	bliang@analogixsemi.com, jhuang@analogixsemi.com, 
	dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Aug 18, 2026 at 10:06=E2=80=AFAM Xin Ji <xji@analogixsemi.com> wrot=
e:
>
> Add property "analogix,audio-right-justify-enable" to control
> anx7625 to enable right justify.

No. The standard DAI link format properties ("dai-format" under a
"dai-link" node) should be used.


ChenYu

>
> Signed-off-by: Xin Ji <xji@analogixsemi.com>
> ---
>  .../devicetree/bindings/display/bridge/analogix,anx7625.yaml  | 4 ++++
>  1 file changed, 4 insertions(+)
>
> diff --git a/Documentation/devicetree/bindings/display/bridge/analogix,an=
x7625.yaml b/Documentation/devicetree/bindings/display/bridge/analogix,anx7=
625.yaml
> index 6ad466952c02..f1b08c6b4877 100644
> --- a/Documentation/devicetree/bindings/display/bridge/analogix,anx7625.y=
aml
> +++ b/Documentation/devicetree/bindings/display/bridge/analogix,anx7625.y=
aml
> @@ -82,6 +82,10 @@ properties:
>      type: boolean
>      description: let the driver enable audio HDMI codec function or not.
>
> +  analogix,audio-right-justify-enable:
> +    type: boolean
> +    description: enable audio data stream right justify.
> +
>    aux-bus:
>      $ref: /schemas/display/dp-aux-bus.yaml#
>
> --
> 2.25.1
>
