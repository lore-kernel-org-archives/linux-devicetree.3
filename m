Received: from mail-lf1-f53.google.com (mail-lf1-f53.google.com [209.85.167.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C6E16402B95
	for <devicetree@vger.kernel.org>; Tue, 24 Mar 2026 15:04:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.167.53
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774364669; cv=pass; b=QtZ6EmRgmyRooPhPoHQw9NRIa/yyGKlUVvjN3lGgT9UVq8d/CBXLKvpixKaer929bRGjPkMyGMmy+PeA2BCLVjaf+lAGRTDIs1mmGr8P3s6lNC4Zt0DqdduQcPx5KHU/YZoa/rdc5t8L1Zh6QuQjCS2fcz97UkT76KdtzYNZz00=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774364669; c=relaxed/simple;
	bh=FQxDntrL8YL3mWkzhweOtwxoobY3Z+tpgmDJR8tTXUk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=cypkmBfMgWouUW/BIySlAAJooZ66wAwjKScj3LQV2w9d2FQey1VvIJKVTJ95/7v+rp70ADNst2dYYwNq+7eqjWD9YC77FXcEcUoCbG8nu7IPEtNjPLLsQSNwynZB7Y9IJnzN+h3YVVTP5SJc3G9zl3cbgUUsPiMnK3+X0Maa4T0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Hr+xyrz3; arc=pass smtp.client-ip=209.85.167.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Hr+xyrz3"
Received: by mail-lf1-f53.google.com with SMTP id 2adb3069b0e04-5a29b4404a8so61686e87.2
        for <devicetree@vger.kernel.org>; Tue, 24 Mar 2026 08:04:27 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1774364666; cv=none;
        d=google.com; s=arc-20240605;
        b=BlebevvPw9FG4ftNxkrvREhmSeOcMzdI/7Mf3gb9UnzrLxk+axFQSxNf8pDwIPVN1x
         qc5IPdO6CJDwcZH5wjm3e7AYj/Y6j8zPahUdOGRSwAOrRtUjbVriX4c2RAKLqrlI+ef1
         Kgi15FvlhXv4hKWvanEoxSWmXY0e0FzmCwg96qS3eYZVe1pffXqr7kcT2aAK4d19Ih5h
         v32JimWbmDG+yi//9OtTl217TpGNT166XGJajBq8lvITxgjo4Oj8Y1XWdgR88Mr5A7C8
         c2OM4ZpeVZaYx60A59rwb5OdlJ9ltYRhNpx7gmsHsg1sX1vEBS9mBXd+5A/hxccTg2cS
         tZvw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=AjCxn1Cse5cZLsfMqwS6O3xXKU9LhII7wm0gPZuu+cg=;
        fh=oaba3hH5SVdQnzFy9RJauwwaP8hbhJMUL5+pX6dTlZU=;
        b=k2/5AGiq+lY9N6XxYXZdTASfAwGBMEty8JY7lHQ4iSa3jrMKTgvjz98a9ReksPJAjk
         TTjtdEUH8pEYSq/3uXMCSvMQt3j9eygBgfk5Fh36diaZx+KSiPn3vu4ksp70kV18uSzN
         +2MYQSy4WImfzOmAl8bipOVUC2jt67aQfz1zhRIA28VvKalpnCRWQ0elJ7N4UUZ+pPQM
         TzvheII2xCH3WOpE1qK0BgQD2QT7T0qmt9w+2aGqjtKgKhBWkGUKoJliALjPxpnR8+St
         +bpAMas6zVJf3Z/h+8pawkoGEByy8hKbUdOyiPaUQzofm7ZTgIt/Gy7Uk2fAmkBhYdIY
         6Keg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1774364666; x=1774969466; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=AjCxn1Cse5cZLsfMqwS6O3xXKU9LhII7wm0gPZuu+cg=;
        b=Hr+xyrz33JU+GHmpkTgLxd1MbuxOVh4x8JGcWSjXeR1sI+a7E04ruOrO5HRkGDwNUx
         kMIC3kkIBjjzGBKXVXT+Qo0I3y+ZUsm7jtWy5iWVA/oM6flB1WMJOIWaxvFo/RJaVE1Y
         l8OUxpxV4A1nCNFnYqD2gFgA/358LcIlrPv7tH1GRm8GaZcKggXYBnZBAYtvgvSfhj7J
         hJXLCJFr5tOynWcmKomXKGVDJUuvLesOk9tGThN7vmNu1SmadoaaJiCrsLK41HbJdx3G
         /fjeVWLBPGfcsXjVzLo/P4vcHHrLRXkRSJCWOyfj+ur6Ilhph1rb/Q35RA3aeGnXgH4N
         oo4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774364666; x=1774969466;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=AjCxn1Cse5cZLsfMqwS6O3xXKU9LhII7wm0gPZuu+cg=;
        b=iF6G50P9mJ0WTWFBNVDL1Zl56hr4q4XcgUHuAuCYQFVV31aLZnUXZVnRx9XadyhIeu
         SrbMRvDwn2WQXl5KwaeD7HcjgtlvGEEzuKgFtlj02txhejcg1eX/oe2gBU0CbVuNClXL
         /n5jSuXtpK6VNowwp9xllq8O2HzE4Jk5vjPLBR+HInITA9KJWohhbDbvXnyGC5xJygEj
         UdNWM+o2WIz+Q10DrBEhGWTKD3XV0fjah2wir1vrIZh/k7VPaYmo0KvWibjddiUq82a2
         0SwViF6EUXlPJWMQSHrQT3GoYbjFGZrSdbeMtt9OmHisotkBvzwsc+4wjXJRmai/0Yt7
         lMXw==
X-Forwarded-Encrypted: i=1; AJvYcCVjxs2/z5jCYR/FC/gUbZ6gcWliJfGsn4z20wotpkipbiFVjqjX3+nZ+6gY1HJCzochRZg9g541hcQ0@vger.kernel.org
X-Gm-Message-State: AOJu0YwaR7S3zj9wgc6fbn+gGSIk/fck9RW+vp3m7DHGVCfVabYbc07Z
	pvDlwHx7T2lXCJ0TgfPWM3LEtI3nA014XVu5tZu7b+IfdzEEWpWY9IEBU9Q+TbBBkci+VUO8qhz
	PDZOzaDI94C7wYTcZZiBWWZbb3M/96VS++dKEL3Yhiw==
X-Gm-Gg: ATEYQzy06c5sbDaOiTVJQIjB7OwAThisSnnOGQsWLECvm0SdPfgj1G0Dym1GjoeJm/I
	3ncBczQCVPCl88qQWUVpvHseVUx7HhaSpJG9kHnlVW0jcpMZCVmNDCbKDY1KMmWNNjXPUTgKY5d
	l+Uu7zamgLUFhndniVvDLwB3rK2Fht+HCTB4H2g0d7B5pu0HVvTNB0KEJvTW8V9hugeVaDaotlo
	JxC7TqrTECOct63/WBzdzywBWljMJKnaHwGYB9m9dPPY+JV7cqzpP8TmzYiwHyxOaNjRqGiDDoP
	4DX4A5pV
X-Received: by 2002:a05:6512:318b:b0:5a1:27b1:1e0b with SMTP id
 2adb3069b0e04-5a285b5879dmr5609526e87.38.1774364665808; Tue, 24 Mar 2026
 08:04:25 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260323-add-emmc-t7-vim4-v3-0-5159d90a984c@aliel.fr> <20260323-add-emmc-t7-vim4-v3-2-5159d90a984c@aliel.fr>
In-Reply-To: <20260323-add-emmc-t7-vim4-v3-2-5159d90a984c@aliel.fr>
From: Ulf Hansson <ulf.hansson@linaro.org>
Date: Tue, 24 Mar 2026 16:03:49 +0100
X-Gm-Features: AQROBzCPIbxWE8u1Ho5blhjIXaA43rjAdkegBcTuKwhyIBqFQ-RWFD1-u62lLKw
Message-ID: <CAPDyKFr5VHukeBE4Z1kVe-hUCFUCrw5roP=hT5jQC5b2X2fENA@mail.gmail.com>
Subject: Re: [PATCH v3 2/9] dt-bindings: mmc: amlogic: Add compatible for T7 mmc
To: Ronald Claveau <linux-kernel-dev@aliel.fr>
Cc: Neil Armstrong <neil.armstrong@linaro.org>, Kevin Hilman <khilman@baylibre.com>, 
	Jerome Brunet <jbrunet@baylibre.com>, 
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Johannes Berg <johannes@sipsolutions.net>, van Spriel <arend@broadcom.com>, 
	linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-mmc@vger.kernel.org, linux-wireless@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Mon, 23 Mar 2026 at 10:58, Ronald Claveau <linux-kernel-dev@aliel.fr> wrote:
>
> Add amlogic,t7-mmc compatible string, falling back to amlogic,meson-axg-mmc
> as the T7 MMC controller is compatible with the AXG implementation.
>
> Signed-off-by: Ronald Claveau <linux-kernel-dev@aliel.fr>

Applied for next, thanks!

Kind regards
Uffe


> ---
>  Documentation/devicetree/bindings/mmc/amlogic,meson-gx-mmc.yaml | 5 ++++-
>  1 file changed, 4 insertions(+), 1 deletion(-)
>
> diff --git a/Documentation/devicetree/bindings/mmc/amlogic,meson-gx-mmc.yaml b/Documentation/devicetree/bindings/mmc/amlogic,meson-gx-mmc.yaml
> index 57646575a13f8..40dccf9715781 100644
> --- a/Documentation/devicetree/bindings/mmc/amlogic,meson-gx-mmc.yaml
> +++ b/Documentation/devicetree/bindings/mmc/amlogic,meson-gx-mmc.yaml
> @@ -19,7 +19,10 @@ allOf:
>  properties:
>    compatible:
>      oneOf:
> -      - const: amlogic,meson-axg-mmc
> +      - items:
> +          - enum:
> +              - amlogic,t7-mmc
> +          - const: amlogic,meson-axg-mmc
>        - items:
>            - const: amlogic,meson-gx-mmc
>            - const: amlogic,meson-gxbb-mmc
>
> --
> 2.49.0
>
