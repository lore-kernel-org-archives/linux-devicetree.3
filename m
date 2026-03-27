Received: from mail-pj1-f48.google.com (mail-pj1-f48.google.com [209.85.216.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5FA89336885
	for <devicetree@vger.kernel.org>; Fri, 27 Mar 2026 06:06:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.216.48
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774591614; cv=pass; b=Bka1QzzTAeAxHESslTenHZ/eE4i0qryqrQbuwbYKyG6FBjDqIr6kJTxdj8g0Gc9INoyZ7hV78wDBRbOZL6DE/eBcEG6TjYLeei7zZCRE67BKzGXTBZdj5r4wU9+DStElIYIlAHvFNJZgSzCIKw2Sox6J3Yunj66By4PMyJQZEns=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774591614; c=relaxed/simple;
	bh=1eCOhhP3pGCR0WGMrPsdTJQh0dsICP3YKEsNbw/PTPY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Zr3n2eqKbRB9fcoFVq7aws8FPX9LnhVYVAYmTA2hiVfAJu8iyUsRT4drRsGJ4PVY3wpVr+FtUON4knUdj8v1ScykfLG8nxB2WNm5DW+n8qGpUW0lWgWHK34BXwz226gTWjqS1BAmEAP/54ZiqSnaOmAByxvS64vvI0evKKKYito=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=cUMlb+ns; arc=pass smtp.client-ip=209.85.216.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="cUMlb+ns"
Received: by mail-pj1-f48.google.com with SMTP id 98e67ed59e1d1-35c206f0481so1429948a91.0
        for <devicetree@vger.kernel.org>; Thu, 26 Mar 2026 23:06:53 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1774591613; cv=none;
        d=google.com; s=arc-20240605;
        b=Kx/vxL/eaIk4bfLUZo/GG1mWhHz0SymXBvp8W1JnNbb9xXL7lWMlisw0634dZZCwXT
         PADIsaA31X14zvLP6ikIBn6OEHXay2oMrBMsq8lSrtq5ALPfO8/dtROye01byRGjVrwQ
         grlHx+ADuumAkg4cbqeEywPvt5cJ+kk0RCroLwj3yveli71ZVsdlcBj1WoKY/+nhGVgR
         0rOe/2e529kw76nTi9I1KxkmqEonFdZXSXicJNAhk765oFFeY9GsobdWVkESUFYGViOn
         QS9Je+QEke+tpc3UfOh0oO0aqMTwuJxPP9WyCcPi6766itoN+rKGEjMVnXzqARCMuUGS
         syHw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=bZor0r7uOoAf8oDJrrV5/yzEdBboUWXz0lgUtCeRdok=;
        fh=LHSpSWV0Bgt4kA5k0GmbcgsJ2CYRM3iYyey/JIwpciU=;
        b=AUHep/btOXc0Jv8f1KltfjsgekcSIe1n8Bz4SJ3xL900gu+vbjLxhEmG2AH6wde7MN
         0V9LqZVs/0WkfFdWK5qjA2AvKyaUFBvVtDxXkQ7pvaT+jJiYrzm6wWSGdgYCtcPhorDv
         PTVXqBN3zEttiMHSwXQXQpXTlVxxH6MJLCrxmaaT1X9g5JwlH8jhw8Sr5BSblIfzkuhQ
         Sw0ZWurR1AKRUFiWgxuS7QxsID1t51W1b0AZWOXfvg/syxV2vdmLldTjpRw0wCwBuagd
         +yETIIGVCN1zBPK038yNaP6YrAqO9CD0oueyZKdUWfoTR+ASWdomX5BUnS1KUca3y5ce
         z6sQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774591613; x=1775196413; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bZor0r7uOoAf8oDJrrV5/yzEdBboUWXz0lgUtCeRdok=;
        b=cUMlb+nsVqjrLMaFF344xl/Vz2YfmkeeCJOxtYAaNKC1OFj9pIr4x/P4wp2JP/FrZ5
         4i6b0LWMzoPOsJlS3RLsvlW1WxvFG/p4NZ52n3xGwzQr5UohTL7j2AL5jiUkDJHVbSkz
         y+ZPgYJArL1a00CNyfXQiBbYqfigKzuPmipxxuQ70IuX7tTWcX+FTnxW8wStOfbtEXzq
         DDMVvhKpt4urQjChq4/lB7JxgqFq9n4Tt9bLTKA0bXtwdGjd5j+Ch7tHDUI0AGgTq0q8
         vz0GqtyJ4Dh8AaLlqmqaVdjSq5VTmsaKQbUF0Ip1fwxteQf65zT5JM++vXJ7sjdQa7s7
         lwyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774591613; x=1775196413;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=bZor0r7uOoAf8oDJrrV5/yzEdBboUWXz0lgUtCeRdok=;
        b=Im7E8sMqUGdNufDq0Vr38pv71n+9M7EzMtJCt+HpsBE+K+3IMU7D+cvz5ANfA3XbGy
         qCjKlLGG0J9nhLtvAYG63g/gQAJevPkmHG64H8s8rh85/3zSZUtIXmZtHGvU0+ZvnG0D
         xlEA6tI+psCVPHYbsD4nS0Bg2jyS7UF/lnZdqRmEZgdYgtxE4gWQrusdWfTz9kA29hMC
         2DzF7TxrLK/k/Tk4p+nx14GhC0KzS0uSkGOIJbb/GPCsuSfTDUOBb+0qzqg7P7SvOGRF
         qqte8BKbzefDWElx7qVP1ZhRQkbNsknQBlC00guQtUJdW2vzW6I4eLPH+8T6rkIj3qbu
         Gayg==
X-Forwarded-Encrypted: i=1; AJvYcCXdD4rzOKIrWYR/ikhmNWC/VLrkmvaHqW5DaUowf448o7kFfvhdGctJMsev9ktyGjfYmFjvzAX2ZjS0@vger.kernel.org
X-Gm-Message-State: AOJu0Yw9uSS7ojufHXj0nHQWWbewFS/K8bVUZylS2yovJaOL7s8d5Bg3
	4FVsK5zQthIk+DcfyddilIvuj5csMbDksS3EjM9SRwRIp1BnMvXSaF11grllXP2xIpZ0K+UYPtA
	sugvn5ulOne3ud48tWp3Wv8tiKzl+lfg=
X-Gm-Gg: ATEYQzyKjyO/EIuFl7P0sDUJ219i0FiKDb5lm5HmkMH1tqX3oYy8Lvr+t1mBMJeAKNm
	BlUl1HsGTwBQaJ1NvYEjiXT9IUj6+K6Usee/+6S3egRNJ3Dnwyg+xWEysM0VoCWxLdSBMMLkMq8
	MmDR2dfF360tpfy5IQS7H7+kFpNJvGBQwhLm1fQxy5554MIUkyBVEZPNSlRRkvCpRiwKmj1tCuG
	S8IiZHlEcXk2vjecGq0d/ChMRQMu7DwbCXOHCFaIdDYWFVjgcypuZ+ZD9PLq5vMvwY7mMzSwsOX
	lHZphww=
X-Received: by 2002:a17:90a:e7ca:b0:35c:f82:fef2 with SMTP id
 98e67ed59e1d1-35c3002fc51mr1380306a91.14.1774591612670; Thu, 26 Mar 2026
 23:06:52 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260327031504.497650-1-chancel.liu@nxp.com>
In-Reply-To: <20260327031504.497650-1-chancel.liu@nxp.com>
From: Shengjiu Wang <shengjiu.wang@gmail.com>
Date: Fri, 27 Mar 2026 14:06:25 +0800
X-Gm-Features: AQROBzCzbEGPPttZKspsGG1E13nIFzodJ2Pa5Qt8YvIkcRF-KWLW83wNwQFeTOI
Message-ID: <CAA+D8ANNmKX1oULZH=N8YE0hp24pP1JSvS9srugq+XMo+sQFnA@mail.gmail.com>
Subject: Re: [PATCH v3] ASoC: dt-bindings: imx-card: Add dsp_a DAI format
To: Chancel Liu <chancel.liu@nxp.com>
Cc: lgirdwood@gmail.com, broonie@kernel.org, robh@kernel.org, 
	krzk+dt@kernel.org, conor+dt@kernel.org, Frank.Li@nxp.com, 
	s.hauer@pengutronix.de, kernel@pengutronix.de, festevam@gmail.com, 
	linux-sound@vger.kernel.org, devicetree@vger.kernel.org, imx@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Mar 27, 2026 at 11:15=E2=80=AFAM Chancel Liu <chancel.liu@nxp.com> =
wrote:
>
> Existing i.MX audio sound card described by this binding use codecs
> that operate in i2s or dsp_b formats. The newly added CS42448 codec
> requires dsp_a for its TDM interface. To properly describe such
> hardware in DT, the binding needs to allow dsp_a DAI format.
>
> Only i2s, dsp_b and dsp_a are included because these are the formats
> actually used by the hardware supported by this binding. Other formats
> such as left_j, right_j, ac97 are not used or required by the hardware

"pdm", "left_j", "right_j" are supported by SAI, so I think they should be =
added
from the hardware point of view.

Best regards
Shengjiu Wang


Shengjiu Wang

> currently covered by this binding, so they are intentionally not added.
>
> Signed-off-by: Chancel Liu <chancel.liu@nxp.com>
> ---
> Changes in v3:
> - Rewrote commit message completely to describe hardware requirements.
> Explicitly documented why only dsp_a is added and why other formats
> are not included.
> - Rebased on latest code base. No functional changes.
>
> Changes in v2:
> - Updated commit message to explain current support for i2s and dsp_b
> formats and new support for dsp_a. No code changes.
>
>  Documentation/devicetree/bindings/sound/imx-audio-card.yaml | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/Documentation/devicetree/bindings/sound/imx-audio-card.yaml =
b/Documentation/devicetree/bindings/sound/imx-audio-card.yaml
> index 5424d4f16f52..75757fbccd89 100644
> --- a/Documentation/devicetree/bindings/sound/imx-audio-card.yaml
> +++ b/Documentation/devicetree/bindings/sound/imx-audio-card.yaml
> @@ -37,6 +37,7 @@ patternProperties:
>          items:
>            enum:
>              - i2s
> +            - dsp_a
>              - dsp_b
>
>        dai-tdm-slot-num: true
> --
> 2.50.1
>
