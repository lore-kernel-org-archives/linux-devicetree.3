Received: from mail-lj1-f169.google.com (mail-lj1-f169.google.com [209.85.208.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 93E4A3F8DF5
	for <devicetree@vger.kernel.org>; Thu, 26 Mar 2026 12:33:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.169
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774528427; cv=pass; b=T+2HCS9/hOdph6FVESyMg3528S4gbam1vDnE2BsOt0sY+Sl8aK+th1i1Z7qlypZu9GUk1etGzItREq3S/VuqYE2sa9sWXR4EreFA57gPk8ciMdX8KExfNZ8qhnu5JstGrFSsJgvzv8MRdlbWuOQeW5HqniHRm1Q44ckC4Y5RCnA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774528427; c=relaxed/simple;
	bh=LSGyBAMlrdeT9CMKolaA6GRSIsAXGM6kyoJfnzUtsyM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=A2XFbj8Z4FxewlZszXAn/zaEnvb8IntmsFDOzgmmxTSypez3BNYN9a+INz3LApl6s+7qddB+6Ko8RYKaMn7uZdRWzYWHqC6EaDwt2UH5OnYf0HvCCiZ9pKHPrhBx8RuWxEC+/Zx1JiXdO6ow/MCUPC3qDYPoeJEb7Me/VvYG/zk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=V83+EjKA; arc=pass smtp.client-ip=209.85.208.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="V83+EjKA"
Received: by mail-lj1-f169.google.com with SMTP id 38308e7fff4ca-38c551f2497so7086471fa.2
        for <devicetree@vger.kernel.org>; Thu, 26 Mar 2026 05:33:44 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1774528422; cv=none;
        d=google.com; s=arc-20240605;
        b=FjVGKJesuTsBHg40Y4b3fU6SVBkTfNBOri10vgLV55DknHjO2vfQfOKymQ4iji5pG4
         6YQcGjp4I13d5GAV3puy8VAYzotmZ1kIxfiL1GdrT/PUQS+JG2aISFoIJ5PkhYsI5Kpf
         wEVMisgVfnNREE3tVnDWaodEZTlRqaWr1XTY8vX1abaeEp/ZpjTYe0sXNkuyWg5N6+By
         TCtEr9H9AfNuFG5V+25tIjH+E0Rsxd5WZQvixUMPd8kSK5d0BEzLFd5qlDt01CkFf822
         xiuAxQuhfOVg8ZKkq7A569bkWFh9ryzl9XshaGlXHXMJ3jMYZe3SjWAA1fPK2YsJnitI
         PYwg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=4NdPYgPAlCNYmYAY44z3R1vgWi5y6H5hfActLsqe8b8=;
        fh=o1fIHsoHo4ryAJaf/IvdxM9vH0ItJznHvJesbB3X4fY=;
        b=R+LZlqvyAZYFT0n4MBPlUdTan7CHgdV6s+yXRwMrRyWriEsIxZIJNPl2yn+9NEDmjw
         +6Q2Rvjs81iQqRHTmgSue4YZEEuCtuOE8FgwvsIa2XqGrRiC+koYkcYnSqskrHiCuU7q
         JVXjUgUexaBYb3+DQVZDOLtmGfmta2yPi//eDhSPUwUnc7AQ6giKok19en3lN6BjPJaf
         iOTo64SA4vaD7sPwaafro9ab9a2IvHqpPStyI7d2+AnYUQn73+IpSqt3Zkn+sQqStaKA
         xm9Rsk5f2oP90u4QxLDeXcdXWQ+rLRh6tb/BA7b7Xi6ppdqdur1EuswZtCGUND7w0efg
         DUrA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1774528422; x=1775133222; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=4NdPYgPAlCNYmYAY44z3R1vgWi5y6H5hfActLsqe8b8=;
        b=V83+EjKAyLT7nPjvvuCupte8+OkhAc6BgKcTXS4xc4hPIdm2LlWf5/I5nLLMOKBxVK
         sMJnNjVFLEMn36hpI2O0TkdIkkbElOwORyd2mvntgYKQ2H6wOuYjW6WZynKvorHPZAfz
         LGrkvGOsc51FitNBbkK1drocgkS1o9CqXL9Lh8vdY9+wt6QiOKVDe8lUqCcjwca100nL
         AB4dkgrRFlcFqniLcOFCxa4vy6vpE0AfyaHi1XtFfiKrH2KVCWhte8GSLp1AEdcJogk4
         InHrQSlxwbW6Ec2e69j39XkLTPk2VeRb31lWbNt1yf0qASNtYJtR8rgakOIaL7gY9k1c
         hD9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774528422; x=1775133222;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4NdPYgPAlCNYmYAY44z3R1vgWi5y6H5hfActLsqe8b8=;
        b=DTOhga2lldtYvvV9Ghal0lCoCSl3RgwAl1UEk7RKcBFP/htC/xy6Mtz6A2jf6aBs+w
         MnSsOJnsltLM2wtoMVETDbs+jfkx0rNHviIkuIGTJSloiVsVOMzIN+IuFCkybVt5Omlb
         27e2jcv4sDWw4vyTyZTah0koPGRbEng77TkUQo7OaCLpTBnI8Bsc7865r9EX/5M/GZKS
         qh/CFDHXbpk78FTC3Sddt1Rvqcys/WVgjKanibj6rCzVsq6TK4OR0Wb00fEHRQ6yu7Sb
         4hy8McF9/NT54RuP8du9ON8hm2zqTuJjmbwV2PIbApxhGfB3rM6jjTL5YDIEjgDUU+X0
         kpnw==
X-Forwarded-Encrypted: i=1; AJvYcCU3scQj959U7Z+RUzjBFWT0BtAEQrLKvm33Vm0dN13aXCrMYG6qTF++Xgh1hrVAusgu5nfHj4ILCSXO@vger.kernel.org
X-Gm-Message-State: AOJu0YzDMD9ZMGfsxYXoQT4F2YCebiyorDAxZHhWFt+s3sBqKvF6ZiRE
	o4RKytvlN22fYYb06pL6wdvda82omwEnL7F3jTGsc9mennxj3bKqCAbyCMrNmsyolczcuK2BBPv
	1KXtMRA3bv0rXp+T73DzxFJ+qlc+un8YL0npUpBh7Bg==
X-Gm-Gg: ATEYQzzdHWuoMYiUpAi7Pc1AZBlkncOP7jTRC15MOVg6YtNOsr6z97V4nmqCpjgOoog
	VD9dI5t/6P5iM5UgSQlep8zuiYCo4s0Y0AZxMNtq4RB9sn+pV3IRpN2bDabGyJYrTBcLnwhwJBW
	HfcVKE1EeWBxe+6CB7hSC8NyKZjQ0mi3UVPPp/pTgqemD07w6Q8m11wcP7bAv/XoYAjQboINcJL
	BC4wH9RtUNaWb+oorpI0yub16eMZHB9XRYOea/W2xrgS5Cbds8KUBROYt1O559PWgOx8KXEu93S
	odfQK2Y=
X-Received: by 2002:a05:6512:48a:b0:5a2:9cb6:ef4e with SMTP id
 2adb3069b0e04-5a29cb6ef5emr1889782e87.21.1774528421913; Thu, 26 Mar 2026
 05:33:41 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260326-add-emmc-t7-vim4-v5-0-d3f182b48e9d@aliel.fr> <20260326-add-emmc-t7-vim4-v5-2-d3f182b48e9d@aliel.fr>
In-Reply-To: <20260326-add-emmc-t7-vim4-v5-2-d3f182b48e9d@aliel.fr>
From: Ulf Hansson <ulf.hansson@linaro.org>
Date: Thu, 26 Mar 2026 13:33:04 +0100
X-Gm-Features: AQROBzB17m2aMMak7aWoPUlujOd0n_VyTP6ICjVn8RwU1l2ZGeIzCfBikAgvSj8
Message-ID: <CAPDyKFpacFOs_T-Q5ETAEd+bjqtx3J2mZBioztCSM8Li0KgR1w@mail.gmail.com>
Subject: Re: [PATCH v5 2/9] dt-bindings: mmc: amlogic: Add compatible for T7 mmc
To: Ronald Claveau <linux-kernel-dev@aliel.fr>
Cc: Neil Armstrong <neil.armstrong@linaro.org>, Kevin Hilman <khilman@baylibre.com>, 
	Jerome Brunet <jbrunet@baylibre.com>, 
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Johannes Berg <johannes@sipsolutions.net>, van Spriel <arend@broadcom.com>, 
	linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-mmc@vger.kernel.org, linux-wireless@vger.kernel.org, 
	Conor Dooley <conor.dooley@microchip.com>, Xianwei Zhao <xianwei.zhao@amlogic.com>
Content-Type: text/plain; charset="UTF-8"

On Thu, 26 Mar 2026 at 11:01, Ronald Claveau <linux-kernel-dev@aliel.fr> wrote:
>
> Add amlogic,t7-mmc compatible string, falling back to amlogic,meson-axg-mmc
> as the T7 MMC controller is compatible with the AXG implementation.
>
> Acked-by: Conor Dooley <conor.dooley@microchip.com>
> Acked-by: Rob Herring (Arm) <robh@kernel.org>
> Reviewed-by: Xianwei Zhao <xianwei.zhao@amlogic.com>
> Signed-off-by: Ronald Claveau <linux-kernel-dev@aliel.fr>

Applied for next, thanks!

Kind regards
Uffe


> ---
>  Documentation/devicetree/bindings/mmc/amlogic,meson-gx-mmc.yaml | 4 ++++
>  1 file changed, 4 insertions(+)
>
> diff --git a/Documentation/devicetree/bindings/mmc/amlogic,meson-gx-mmc.yaml b/Documentation/devicetree/bindings/mmc/amlogic,meson-gx-mmc.yaml
> index 57646575a13f8..976f36de2091c 100644
> --- a/Documentation/devicetree/bindings/mmc/amlogic,meson-gx-mmc.yaml
> +++ b/Documentation/devicetree/bindings/mmc/amlogic,meson-gx-mmc.yaml
> @@ -19,6 +19,10 @@ allOf:
>  properties:
>    compatible:
>      oneOf:
> +      - items:
> +          - enum:
> +              - amlogic,t7-mmc
> +          - const: amlogic,meson-axg-mmc
>        - const: amlogic,meson-axg-mmc
>        - items:
>            - const: amlogic,meson-gx-mmc
>
> --
> 2.49.0
>
