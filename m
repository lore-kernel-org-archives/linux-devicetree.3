Received: from mail-wr2-f12.google.com (mail-wr2-f12.google.com [74.125.225.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 473903ACA7E
	for <devicetree@vger.kernel.org>; Tue, 15 Sep 2026 09:55:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.225.76
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789466152; cv=pass; b=EHSrAJt27IMTPjiyvJ5fJS1AYguZpPERf9GhNKKZmsEwtoMO7xp3+KulqjLTI+aGphhr8eQmWmY34LjNGBpy77OEr92G3dBjX8jF5zYO68ZnbKlb/AKCLSGPauZodxY4ou777x4DkM1WiVodfqLkU1bEn/Zjpe5Mf3JgY3mCTdY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789466152; c=relaxed/simple;
	bh=HeKvvz7zvJFqfPpm00Pp1LjX9n3idorFhTOrtCSCiy8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Anhxz4d/bNbSNDgupPXZBtZjSw05VaasAebyz/nzl1Kb99MkuwKHP3acKdz6HaYkIt4Dtt3gpQAw5ot4mfRxbZJUsuhUchrtGjNOqbLctmeMrxkCi+3HKIQlP0mhj8nKxhBdDbAPFpiiMegrKUl3E+1EXJC/Se5WMVLCKtH6WRU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=A1tBxgO/; arc=pass smtp.client-ip=74.125.225.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="A1tBxgO/"
Received: by mail-wr2-f12.google.com with SMTP id ffacd0b85a97d-485933b24c3so53748f8f.0
        for <devicetree@vger.kernel.org>; Tue, 15 Sep 2026 02:55:48 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1789466147; cv=none;
        d=google.com; s=arc-20260327;
        b=CxAAPe7y8F/Vajx6c34dTVaUPNi4nBofoIqqU/ih3Yge8VyYwvMggbdC4sODRGNHUr
         D/gKrMKB56cvj63e0k/MzET+axIdmB9j+ldQqopM2r6gmoBI/WWKPti9ZSNlFAiFv1ru
         8ppA6+0+SwyqTcRgJ8twEeS0GsOaExh20dFNCngthLl6NQxWtd8y2inceBtChcqEjBYT
         O6ZFVTDDRjfoHlDoJnLKo4wk1VlWYY5r2JNNOe85ibvuE6H3QyeKmPflvFcRbzu4sFZT
         Jt+AamwoQpxbWlUlloA5KgQTqDQUKLML0pj27TXDNOh0jjj+JdF6DV96lUPL37Cv89G1
         yYgw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=SEsT6FzXLVxpOxGT+T1rtf6sipgLJQJWYr3e70XVh3I=;
        fh=OJzuMKaBbnLo/Dquu0+ib1zcbUY1Bpb0QzI7Wmr30Os=;
        b=oEnOoOz0kG+xHkln6efFd4iwwa218goz2cng700LPdRWkiSa138RzufoevuX5C1RBZ
         mj5+W8g+OMji3Fxz9NSHbRP05NBEyMJH6Qb/D7ZsrZcElhZNaYPU3Uy8P5uDGW4zQ7x0
         5OR2fOYhpcSCXV0GF61LKB1vz/+WeeME7HZna6eHP0MVRSKuku8bdpInWZP9Nmad7Gv5
         FAHacntfAy6OXZGGWC2sBVSelvse7qgbHGjA6zykG3kmw72WitwgmLJ45BWBy3opbKHs
         Brm//RbGolG+5EEJsr1x26j3MxT/7Ao/MWToIlg5q6Zf95M8L+pUsEQo2ZtbdgWrUVVu
         nGuA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789466147; x=1790070947; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=SEsT6FzXLVxpOxGT+T1rtf6sipgLJQJWYr3e70XVh3I=;
        b=A1tBxgO/a9ew1Z5XI4qBWUzgkmHIOgmnyx/fmxJSyV4ELaD3YXH2pJnG/fInjXgeeM
         AAauNGhpXX9tnzQ42evvtXpd+LjSDd5XTdG+FxHv8OEp/SEDvR45cPCsNfcLLi5qBDOs
         H5kR3g65mctsELME58MpZArA9KvR33ypt7/uhHLdXibbIRVICBJ7Igh/zQbRLGQLOr8A
         OWegkjajWUAE1xGSLve/vPOlzgPYVhtvOrAxGi2p3Qa4BEfGiRa629kEPTsscgz7NxsP
         4zwRwc99jvE9pFlr4X2pSbe8QreFRHSQ3gqq6og7QgYYGJLZnx760Y5QgjDNLpFfDPsi
         0+XA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789466147; x=1790070947;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=SEsT6FzXLVxpOxGT+T1rtf6sipgLJQJWYr3e70XVh3I=;
        b=WoVk8eh8h2UN6RAnw5Gupg0Gi4R4Pe0wjSAVbc3EJaFeVMuWbarXh1FtcHdfphXEKT
         P0A3LuwDSZlpTcOWEIkUVMrU2lWD22wpMnhzM7ES0op7o8DHkCKIkEqDbTAjcsNFYBxy
         UwkRuzbPcInt5gkyG3vO7yh3SzCl1jYaCq8/xWhE0k3ItmHstqqUeSRK0Go0hT/2xiaM
         ouRhgsKtXwoXoPEUgguyY4ZDuRqQavhN+khGWCJjUdINL6+QjZYruulb6C/zMx6cXl51
         aaIyax1GkieISyP/zmv9QNnDi8S1G/lFoGdkFZo+8WnILTBUY7mAIIA31Q0Ow5/tifFH
         m8xQ==
X-Forwarded-Encrypted: i=1; AKwUvByloGLDolSfdXcr5lW4zhvOtsJLO8T+qz3+1RnZ3kDKyEZlLTB/nArKjWJy+kZN6OwYV1aveT+lblys@vger.kernel.org
X-Gm-Message-State: AFuF++nHIsLDg6+rjrWQSiEdKgHoynuL7g+XkZe+qBiP+OyNRdbuvCfE
	hECPx+AD6EHX1EP4qv5GvxMX3M17eEwvfSwRCI3sz9X1hBva0WUzLrxELWf6dqbHKKlMsNq0yln
	8CMl+7IMca66C5sVOh2STQuG0b5a/fFs=
X-Gm-Gg: AYBFou0JWMT6pHHr03XE0yO8woPQOIlKi4S+vRGkp0yUI0dOq0mNcQKtrXpjZ4w3ADG
	qoKQSJdFvt6ui1e2UhyejBd5Fsgee/DVf3CiqrvQ9RBY1Agv1ZrEWF1sRP0d1FW9WMIKkDMZJlI
	V02MzWC/xkFBv5VkV71yYkaKt2N4B0LR9r7QGoCPKSnCg/03FAhlbzqEMd9xfCNEBeNF7LYxDyo
	tUMfGsDuHGaveJ/bn3CoPheA5GKNp/8T56wFAh4fX6z6FuMrMdd8LDsXzTi0GFRd+R/wJnuwCA7
	0fZ2mXh2lPsyHtc0qIPEBgrKVZ2SPaYRtRKBOS+5AU6VRrcxrY0PPQN3DgJDFmCgjx1lTqBJyni
	g51uDmVIJgczqJ6baaz4Li2Xy84UQtMUEbI3kpshe
X-Received: by 2002:a5d:5e93:0:b0:487:780:6a27 with SMTP id
 ffacd0b85a97d-4870a96e031mr15335f8f.19.1789466146523; Tue, 15 Sep 2026
 02:55:46 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260914211826.73727-8-wsa+renesas@sang-engineering.com> <20260914211826.73727-11-wsa+renesas@sang-engineering.com>
In-Reply-To: <20260914211826.73727-11-wsa+renesas@sang-engineering.com>
From: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Date: Tue, 15 Sep 2026 10:55:20 +0100
X-Gm-Features: AcwNN1URPhirRROilRI3Axb3KZdRwJ_HGHfQgBDgapACZQF7IQIhq-6HjrMnUzQ
Message-ID: <CA+V-a8ssNZ4X+e31V59YdqYmoap-S1W3Vfois9oNisVT3izxag@mail.gmail.com>
Subject: Re: [PATCH 3/6] dt-bindings: rtc: rzn1: interrupts are not required
To: Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc: linux-renesas-soc@vger.kernel.org, 
	Miquel Raynal <miquel.raynal@bootlin.com>, 
	Alexandre Belloni <alexandre.belloni@bootlin.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Geert Uytterhoeven <geert+renesas@glider.be>, Magnus Damm <magnus.damm@gmail.com>, 
	linux-rtc@vger.kernel.org, devicetree@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Wolfram,

Thank you for the patch.

On Mon, Sep 14, 2026 at 10:24=E2=80=AFPM Wolfram Sang
<wsa+renesas@sang-engineering.com> wrote:
>
> Interrupts are only needed for alarms to work. Reading/Setting the RTC
> works fine without interrupts. Drop the requirement for interrupts
> because an upcoming SoC does not have interrupts wired.
>
> Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
> ---
>  Documentation/devicetree/bindings/rtc/renesas,rzn1-rtc.yaml | 2 --
>  1 file changed, 2 deletions(-)
>
> diff --git a/Documentation/devicetree/bindings/rtc/renesas,rzn1-rtc.yaml =
b/Documentation/devicetree/bindings/rtc/renesas,rzn1-rtc.yaml
> index 7ea77cd0bee1..b426a34958d6 100644
> --- a/Documentation/devicetree/bindings/rtc/renesas,rzn1-rtc.yaml
> +++ b/Documentation/devicetree/bindings/rtc/renesas,rzn1-rtc.yaml
> @@ -52,8 +52,6 @@ properties:
>  required:
>    - compatible
>    - reg
> -  - interrupts
> -  - interrupt-names
Maybe we can add a conditional schema check for SoCs where
interrupts{-names} are required.

Cheers,
Prabhakar

>    - clocks
>    - clock-names
>    - power-domains
> --
> 2.53.0
>
>
