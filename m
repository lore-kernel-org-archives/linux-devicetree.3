Received: from smtp-relay-internal-0.canonical.com (smtp-relay-internal-0.canonical.com [185.125.188.122])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A3D7536BCC0
	for <devicetree@vger.kernel.org>; Sat, 21 Mar 2026 11:10:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=185.125.188.122
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774091448; cv=pass; b=IDjlPCBSJzlfr0ndOYyYznVu2gIN3IA75pclfnF07JeVB0sOAFmUommkpvn6Rd4fxEAe6yTgIJj+toxlFUYAg+eCKAJhFKq8eQISG+KBSWEjSckH1xav/81h3jDUzrBMFEhcZrwEq6i+QzcaknFN+Qo8rCB77BuFCdBw27ftwwI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774091448; c=relaxed/simple;
	bh=0zaCarWFAl1I5M4Ha2lpH48OPsCWNyPVRVrHK4Vc+a0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=aLn4UcV/P9H7G9FC119G4mKXM0LGmVRwyV1cmMK9OQMM7QGnOoOHtQs+aIoJqT5tb1c+lr0LZh813uzLYjTTbJcHRGhOLVGcNIpoY9Aeh6ydsLzxAeE85chamJIUnCm6YAFT0khhXXptpe+1sNvFZ6n1zrygJwA/rHEtM3UFwZI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=canonical.com; spf=pass smtp.mailfrom=canonical.com; dkim=pass (4096-bit key) header.d=canonical.com header.i=@canonical.com header.b=Vq2XJNPe; arc=pass smtp.client-ip=185.125.188.122
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=canonical.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canonical.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (4096-bit key) header.d=canonical.com header.i=@canonical.com header.b="Vq2XJNPe"
Received: from mail-ej1-f72.google.com (mail-ej1-f72.google.com [209.85.218.72])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-relay-internal-0.canonical.com (Postfix) with ESMTPS id D4C3A3F7FE
	for <devicetree@vger.kernel.org>; Sat, 21 Mar 2026 11:10:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
	s=20251003; t=1774091436;
	bh=2A9/wfVwmSsIZQua3y5VdJJ3emu+4yWYLgcT1QszORo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type;
	b=Vq2XJNPenaBzkVQ1VIeKHTy4HzTpxytfbufEmlyaoEGkoxMvt2dR9vA8fyhTKUNRO
	 CIb1kmOkQ+2e0ZxenPP7wkn3jNI+GVV7vjW1lWSEThhxUcFfkcQhIwZwQs0VekRavX
	 +55GWhHIIT/DkRqsPQfVjdxStIxufr62veGu3quZZ/9cMMP1+OvlwgmHwwwY24u38/
	 QQdJRbPdG+uudJ6JaUwj4zNyuPF2zZndolTvRWfSqQa1V83tpzbNEqp7FS33kHqUD4
	 bMTJbGOwhzAxQSsSYeIO4fA7VIcd0oLK/wfJCScxgp62rnwJ3odFz2PA+FDRCBjMBR
	 hu17XRHyKs8wNOVjs+wNTlF+xcwbCqyj9O+FLGdciwsZoaHCyRttfRJwCuqc/t0kl3
	 HdmO2rxYXrbr6e5PzeFuOz2btathp6vUxqcYQ8wAcnSfQ0zOdE8vt7K6RORjtAySIg
	 trEuXIKau7It3bQTp2471r15jYCwuUWVWfU5kfwroFRJEQawr7aienJA47FMjp7bj+
	 Qblb738LJfIujJPfOQ+Pex2ZGzOw/gn5BD0g0Lm2jQimIeZB+cHTmS/DsGQR+ISTeK
	 un511AkV0FlDgLjyetR7GFJfSSZLg5u7uZ6m4g3AU0AGA+5B0JtV5pHDZVhoU7cYiA
	 mSJlzt9HR+zXynBbfv/THKNo=
Received: by mail-ej1-f72.google.com with SMTP id a640c23a62f3a-b94062e85f9so436038766b.2
        for <devicetree@vger.kernel.org>; Sat, 21 Mar 2026 04:10:36 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1774091436; cv=none;
        d=google.com; s=arc-20240605;
        b=MYDKBHHvtJa5ElZ3UnjhzBBf0+8y75Tg4llaxLyVkRyvX+HlmUf5jtsXM/mtXwOMOs
         zRk/I48hQe5nEk1aSs4Sfm4MUoCJlvq4025j3P4jzE4N6YBzDveVVmxKwPkYbNr1OEUS
         dHB0sWwrkWtY2W2kq8ee7/hnI1jt4robrR2uq4WYsq1NsBHWuRu6PPYMpZ3YhVKuOrWX
         HFXA/Ytiu7kIhOTwR0qD+XahwUxgOtGp+CACEAiFuE9Pw5DoT+GDdP3lz9wTkqkMskeC
         ZyObeT4x3oE+CNVZOwBosyOYqwdY2cxDx2KJq2C8f5zWKLtMcIZN0BGJRt2hi+tM8ley
         2Q1g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version;
        bh=2A9/wfVwmSsIZQua3y5VdJJ3emu+4yWYLgcT1QszORo=;
        fh=uRz5Pfv1FpUq2n7CbVmU0isKY6WXdFg1bCW6clYmQJs=;
        b=gy/kSngmmm9BelmcxhDq+iLasS+OXe4ccCq0NyPMJkYGP/T5yKAvEfbHvsvijyFGl6
         DwPVDRxOA9a5uDyg6r3hYf/7NeaVl0V0gk93QpEoIBMxxcez7wGEc/foiv3jupRYiAeX
         gxIwGKhUYKbmNWd8rEkrpFavr3Bq0ftU8ks7AZIlrhWg+vaIRO6HCVLsJxBiNcaLfhll
         Cn+0nae4GcJOkf1RG0HDyU9qVu8PWJaNut90WrT4Qq3nOxwtK6dumgvO19fc2/DI85nE
         RCX6DntRN7N6UUtGj78IsRVg7tfybSaJbNOWZzgG6cxn6bkkScFwX0kNchd0XmxCkXgR
         NXEw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774091436; x=1774696236;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=2A9/wfVwmSsIZQua3y5VdJJ3emu+4yWYLgcT1QszORo=;
        b=GHhYOm9wrxFxdvzLYBcFL0bhX+VWo0zKlTNj84FZdWodDnMYKpfUNDSZ+JMroQ9AT2
         FjjsaY4YD1C/LFewjF1BZlxWAWUr67J4Hli9yG1gNl3uGpg7A3HAEHv3h6qgqouDGj5K
         DoEOfOSG7kgq33/E9eUZsoJ97sCOXIrK9ID43FQYN4kTXIGgnLE6Bb0kDhO2zb4tK4G7
         Njx/YUCpUdC+MW5vA6R5kfpfdDarQOVgEfFKb2WzFjdvTJu7u0NXgag8ylP6L8nEOm3c
         DSjenMCv/v+y8mrkV0kQPg1HwPb3CRjfGK9wc3ma9IsupveKOZVT9vhIG1Vpv5d4yA55
         vRRA==
X-Forwarded-Encrypted: i=1; AJvYcCUtaG72djQZXqEV4caqlr4fQZH9Wr85JzO/26rlUSOC3fda1Wly6/YIYu0q7vrnA/BUdCiODOvixcvK@vger.kernel.org
X-Gm-Message-State: AOJu0YwIAf4/9zepprpsQf6cJAZbHT2P/PPppgHx6fcYjDDY72z8DYPa
	nikJ0+6I42gbJtUj1fmojq7aaRTgfePW1zMtosXSdok5usjieZIqDiQ+DN+tW0+qVYk27hRP5Ry
	3eI7MY+kwePdQ4FDeFLGoUhpXvza0QeGpWFbuKX6SnErvqsFHMOvoGftiW1n7dVoelklAr1967v
	EehkTaWOJwUj7KV4l5H+eIip8PLt+Bq+5TrR9hRmJh7EMGqycsLJVfVg==
X-Gm-Gg: ATEYQzy5cp6CsOdanu4+LhmfhnI1XpcqFqOQt5oGDfZItocQF1Hh+61feMToYtcjbWR
	XzUJBOAtJXEibCPG6xoQmf4u4oDL7S10pATFKv/4EzrG1ph3uRTM+d5mB1TxKU6r1vKBhYmZMWP
	SoUXObjzyeGdjuvGtIV1zZp//5bqKjBwf38Z13oqdiJ8ChLdH5df44Q8E5BMo4te9HMuI5n/eEE
	8+hWjozgRr2obYaEA+j4kTNyK7K70Q+b7VR2A==
X-Received: by 2002:a17:907:96aa:b0:b98:528b:8462 with SMTP id a640c23a62f3a-b98528b96c7mr73398166b.55.1774091436343;
        Sat, 21 Mar 2026 04:10:36 -0700 (PDT)
X-Received: by 2002:a17:907:96aa:b0:b98:528b:8462 with SMTP id
 a640c23a62f3a-b98528b96c7mr73395966b.55.1774091435897; Sat, 21 Mar 2026
 04:10:35 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260316-x1e-camss-csi2-phy-dtsi-v2-0-859f3fa55790@linaro.org> <20260316-x1e-camss-csi2-phy-dtsi-v2-9-859f3fa55790@linaro.org>
In-Reply-To: <20260316-x1e-camss-csi2-phy-dtsi-v2-9-859f3fa55790@linaro.org>
From: Tobias Heider <tobias.heider@canonical.com>
Date: Sat, 21 Mar 2026 12:10:24 +0100
X-Gm-Features: AaiRm52499M8HYTgFplXiLLRqQ-Avz-L10LhPTnrV7OoeTxB3gRN_PnUea12HP4
Message-ID: <CAARv3RSQbAQwDFsfBrcrkXem_jtVy0Xttqi1UZfuNT86twxmJw@mail.gmail.com>
Subject: Re: [PATCH v2 09/11] arm64: dts: qcom: x1e80100-lenovo-yoga-slim7x:
 Add l7b_2p8 voltage regulator for RGB camera
To: "Bryan O'Donoghue" <bryan.odonoghue@linaro.org>
Cc: Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Aleksandrs Vinarskis <alex.vinarskis@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Mar 16, 2026 at 2:15=E2=80=AFAM Bryan O'Donoghue
<bryan.odonoghue@linaro.org> wrote:
>
> Some sleuthing work by Aleksandrs Vinarskis in the bowels of the ACPI
> tables for this part shows we need l7b_2p8 for the avdd supply.
>
> Suggested-by: Aleksandrs Vinarskis <alex.vinarskis@gmail.com>
> Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
> ---
>  arch/arm64/boot/dts/qcom/x1e80100-lenovo-yoga-slim7x.dts | 7 +++++++
>  1 file changed, 7 insertions(+)
>
> diff --git a/arch/arm64/boot/dts/qcom/x1e80100-lenovo-yoga-slim7x.dts b/a=
rch/arm64/boot/dts/qcom/x1e80100-lenovo-yoga-slim7x.dts
> index f10dff1da7f8e..1611bf7302ddf 100644
> --- a/arch/arm64/boot/dts/qcom/x1e80100-lenovo-yoga-slim7x.dts
> +++ b/arch/arm64/boot/dts/qcom/x1e80100-lenovo-yoga-slim7x.dts
> @@ -552,6 +552,13 @@ vreg_l2b_3p0: ldo2 {
>                         regulator-initial-mode =3D <RPMH_REGULATOR_MODE_H=
PM>;
>                 };
>
> +               vreg_l7b_2p8: ldo7 {
> +                       regulator-name =3D "vreg_l7b_2p8";
> +                       regulator-min-microvolt =3D <3072000>;
> +                       regulator-max-microvolt =3D <3072000>;

I included this in my Ubuntu test kernel builds and got reports about
reboot loops
on the Lenovo Yoga Slim 7x.

Your change seems to be based on
https://github.com/alexVinarskis/linux/commit/a94d1f4e1d025398060d7e0dc2270=
b8e375f6f60
which I had previously tested too and didn't see any issues with.
The only difference is that your version uses different
regulator-min-microvolt and
regulator-max-microvolt values (3072000 vs 2800000).

Setting them to 2800000 like in Aleksandrs patch seems to fix the boot issu=
e.

> +                       regulator-initial-mode =3D <RPMH_REGULATOR_MODE_H=
PM>;
> +               };
> +
>                 vreg_l8b_3p0: ldo8 {
>                         regulator-name =3D "vreg_l8b_3p0";
>                         regulator-min-microvolt =3D <3072000>;
>
> --
> 2.52.0
>
>
