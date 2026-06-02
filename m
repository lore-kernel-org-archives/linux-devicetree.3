Received: from mail-lj1-f182.google.com (mail-lj1-f182.google.com [209.85.208.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 676582DB7BF
	for <devicetree@vger.kernel.org>; Tue,  2 Jun 2026 04:53:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.182
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780376030; cv=pass; b=uneqLE3dXou6LHYkgk6AJ0xvuTplH/rYGWnsjJ1Gy/BvA9O70buYL2BvunAZZT5P3P+YNvl+L49wUKT3KhQTY9KFQXC3GyafCsorAqoalxpoxpEoduf+xuLE7jlKBQSpxxY7d2CVxn1PwVV6FX6wIg2spJzk0qQN+t0YtWrPZgA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780376030; c=relaxed/simple;
	bh=+g9u+TubkywUHekxS11qDKNi0RpRAXGuXqJT9m66I94=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=mVckwHZqcU3TGZEDDdoaaHeTSPnFMYbMH2FgDh+KljfOE33fG/jtEV5i9geXS0Qaipk4VCnAPBVswdrecPdZADva/ysMtYfSFIV/yqqFsux3GhcVehP0vSSoBR32QTJLpkvdA/e9uho8gBJ6Xh3U9LU+h7mrPM1EcAfeD7DmndM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=bMSq5qHi; arc=pass smtp.client-ip=209.85.208.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="bMSq5qHi"
Received: by mail-lj1-f182.google.com with SMTP id 38308e7fff4ca-39661ba5d7eso29971471fa.3
        for <devicetree@vger.kernel.org>; Mon, 01 Jun 2026 21:53:48 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1780376027; cv=none;
        d=google.com; s=arc-20240605;
        b=Qa0IHiFKIMzylJUBRkJlLNHc72o0lsm2VfEkbnu7VeqZkJ3TFsnbA024x2ORfAp+u5
         DAH80Or0/k1rZNELHFkPT7uIkBnn0ai5iOTSjECIofFYfrwNc6PbF+SqIv0d3OJSC3OV
         5CcJfxIW2GxwvgDawroO4ZhcamVsmymxs6V9SVaagWsc9Y3ZVZ4CPn7fjNLyWgkEWu+R
         6g727Er6g82JKkmK57DqoW3Qp08C7y0ifUzxTW3CvW2Yyo+dua02T4YngB0MBMY8EBKS
         qg1A7dLezy/yexx1zTMTNmzVsR0/ZhTIy0k15JvoyROqHHLTKapF860LodqUslVyFB5s
         OLCw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=DzcleAmV5w1y7JF/G8eR6YBhK1L7hto1eyE5epBS/Gs=;
        fh=Ps2U1wHsnxn5Mu8LFFpfpmNg4kaB+6cE4U4N3fPvKyc=;
        b=RYk2Z3ykSiOhSuylOGHuN6+6mZKjZsnw0gc7BRsOmSZAX+RqsPVgF6n4bJnIoR9VMS
         1v77Nm75/rA2Zvq+9mZvci9l6/eHQx//UUA93DfDb1zlnsXM4pFeniFrD8sagrEAlovc
         4gaGM6A6OCifJrgVIdmM3p9voMPf9Gzm+ANbHeVllMoCdWIoYcqnLO0grdhOCLQiBNdK
         GHpvq51U+UNcH1wvxPEJ6qSwc1IBsKdlNhzSJxu9uhU3ixHYvn5j0IKXHCtBrkiyo7U0
         4p9QaATEBj2u/5CHApsQnCiKX4qqKwqAEg5Qn8Tj9RXvuDXER12X4LNF1QJRINZJ9AIJ
         34Yw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780376027; x=1780980827; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=DzcleAmV5w1y7JF/G8eR6YBhK1L7hto1eyE5epBS/Gs=;
        b=bMSq5qHikbYbm8fIPw3X8GLguRaW4wNvWDlXqLUl+cSZWbH1EIM7WujGJ1EOuYW40X
         3VXvfZzY5FmV7nFthlAMqx8ucc6M9w2ru0H6TFRXITLCRyiYVpND+b6hPNtHhOZi1VsE
         oCzzzn999B+TdZrK0DY4FYXG2e+Opc7iIO00yNZM4CigvY/lUa1ZzJPsduEycyv3v/kS
         jfhUgO0QvLqp2UPOkoPKjXfE0bfI1Q1/I3gbGiqwz5WWIR+t5nEtEfGLSwSG3OvRB16d
         PEYaJXyjEXUqowaS26bI8eaeXJ95j8TUaZHOT+ZfGfzoOrAo3YBTgS7S41lN2vfl89yu
         000w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780376027; x=1780980827;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=DzcleAmV5w1y7JF/G8eR6YBhK1L7hto1eyE5epBS/Gs=;
        b=OknZLXYpuDekvr9sY9D6xpNWQaOau7fYkn91AEdz6YWnBGcbN+BxAfKOImHIQbskB7
         C075SELG8rOqZEDtJmfEj8bnEVxFZBJbPldUn1ntaOKXJfSa5E7rz6mCiMR680u78vYm
         E3C6+MmlOjDKT2EXCz1suXk0RwQRVL7EmizVTcoSEq/Q42g906lZ96OcxiiEj4LuK+uS
         wqas0jQ5OP6Ls86WqKiIiD9igfm0xzCD4ebcyQnH9wzl0Au0BMVZA4ob2qxWwe+dmH5E
         xDxo3ZS55MBaq+b7hjV+YHzMuWZRNUFRW25v+t8I2ltZt2XrIGjE1VQBkokTqnkob5jG
         n7xw==
X-Forwarded-Encrypted: i=1; AFNElJ8ZSLFCDJTYn1VkyqWIbS7u18fVSvxkLQNeSeBSSQgRWZXB6CnJ5NeKenoT8zEKKPV52PLvC7PSZkO8@vger.kernel.org
X-Gm-Message-State: AOJu0YxCYnOccdAQfwNrvOzM/qMcjpdDRa3bk714TxDvS1+qH89oJTUx
	Jxzy0rr6g5rwX0+wmmIM4+U/tBIgjMwW0XKJKvpAIl8AyW5b7R9IeVJHP1AfiDEZq6arlCY5Uu6
	ay0nMAzKOUHIE7Ewbr+hYSgmIv59+p+CNgDpD
X-Gm-Gg: Acq92OGg2+b+SgZkXFqznITKWJisUSCwL39ENu7jpSzOhiVuz2hxcG8Ienf9fBbZ7g6
	j4+pgDiTwlyYicKGSdyai6RkHEf4rBYyj14i0bXIWslVBhASvYHOySU8KzJBpiWu/lu+srpyNlh
	8ezfW4nttJL78Qz1X/Nb33t8nY1PYOggD2NH63Vh3iLwW4RQ+o1Mkeiq5LQNRb9Yi/rEJeAhzWu
	F06URwZIMn9OS1tgl2FKPUSm15KsXdrwajiL3Lo1/479/CVezmtKJh1kNAkhAY6uRszBjeeYyFL
	eARPQH36/24X7QsCu26FCn9Fusmbh85OD+FEt3AiEOeCM4nHln+Y6gl5Tetwbx+qrYRISsSF/we
	ZA3Q=
X-Received: by 2002:a2e:a581:0:b0:396:9b1f:a8b9 with SMTP id
 38308e7fff4ca-3969b1fb305mr8272821fa.6.1780376026322; Mon, 01 Jun 2026
 21:53:46 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260503-ayn-qcs8550-v8-0-d733f5e57446@gmail.com>
In-Reply-To: <20260503-ayn-qcs8550-v8-0-d733f5e57446@gmail.com>
From: Aaron Kling <webgeek1234@gmail.com>
Date: Mon, 1 Jun 2026 23:53:34 -0500
X-Gm-Features: AVHnY4KOzXuQ2WwXnqwu7y8wMADauWr4edG7ap6TzZFhdLtizRu9gamU-oya8Lc
Message-ID: <CALHNRZ-pTNGjm4S22VwAbwSyUw7+_LkE48QnssVDLALYi5Mx6g@mail.gmail.com>
Subject: Re: [PATCH v8 0/6] arm64: dts: qcom: Support AYN QCS8550 Devices
To: webgeek1234@gmail.com
Cc: Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Xilin Wu <wuxilin123@gmail.com>, 
	Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>, Teguh Sobirin <teguh@sobir.in>, 
	Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, May 3, 2026 at 4:49=E2=80=AFPM Aaron Kling via B4 Relay
<devnull+webgeek1234.gmail.com@kernel.org> wrote:
>
> This specifically includes:
> * Odin 2 Mini
> * Odin 2 Portal
> * Thor
>
> The original Odin 2 dts is not currently included as it has not yet
> been verified.
>
> The initial port was done by Teguh Sobirin for ROCKNIX and was made
> available on the AYN github [0].
>
> Support has been removed for things not yet supported by the upstream
> kernel, these will be added later when the related drivers are submitted
> and picked up. Such includes:
>
> * All panels
> * The Odin 2 Mini backlight and touch
> * All rgb leds
> * The built-in uart gamepad
>
> [0] https://github.com/AYNTechnologies/linux/commits/sm8550/v6.17.5/
>
> Signed-off-by: Aaron Kling <webgeek1234@gmail.com>
> ---
> Changes in v8:
> - Properly order and format amplifier properties
> - Set amplifiers name prefix to Amplifier L/R
> - Link to v7: https://lore.kernel.org/r/20260430-ayn-qcs8550-v7-0-591a967=
35fa3@gmail.com
>
> Changes in v7:
> - Add back pinmuxes dropped last revision, but without output-low
> - Link to v6: https://lore.kernel.org/r/20260430-ayn-qcs8550-v6-0-06a7e7b=
54aaa@gmail.com
>
> Changes in v6:
> - Fix comment style in patch 3
> - Drop a pair of unnecessary pinmuxes in patch 3
> - Lower usb sbu pins drive strength in patch 3
> - Link to v5: https://lore.kernel.org/r/20260408-ayn-qcs8550-v5-0-c90abeb=
7a152@gmail.com
>
> Changes in v5:
> - Fix some style reviews in patch 6 which required matching labels in
>   patch 3
> - Drop hdmi support in patch 4, since it doesn't work
> - Link to v4: https://lore.kernel.org/r/20260323-ayn-qcs8550-v4-0-33a8ac3=
d53fa@gmail.com
>
> Changes in v4:
> - Fold vendor description patch into the series
> - Link to v3: https://lore.kernel.org/r/20260322-ayn-qcs8550-v3-0-4afa89c=
20888@gmail.com
>
> Changes in v3:
> - Drop unused backlight regulator in patch 3
> - Move zap shader firmware to standalone reference
> - Move i2c controller enables from common to devices
> - Add ABL dtbo workarounds to patch 2 as per:
>   https://lore.kernel.org/linux-arm-msm/dczz4uvcq4hc6p3zb6xnrsgmfeomwliag=
whf36tewdz4z6mndp@afbxzhjziiwv/
> - Fix multiple property alphabetical order issues in patch 2
> - Use interrupts-extended for pwm-fan in patch 2
> - Ensure blank line before status in patches 2-5
> - Rename spk_amp_l/r to amplifier in patch 2
> - Remove a few properties that are already in the soc dtsi in patch 2
> - Order tlmm nodes by pin index in patch 2
> - Drop qcom,dll-config from sdhc node in patch 2
> - Drop dtbo support, convert common to dtsi, and include it directly in
>   device specific dts'
> - Link to v2: https://lore.kernel.org/r/20260311-ayn-qcs8550-v2-0-e66986e=
0f0cb@gmail.com
>
> Changes in v2:
> - Drop awinic bindings dep as a duplicated patch already exists
> - Change Co-authored-by tags to Co-developed-by
> - Drop alias to currently unused uart15 in patch 2
> - Link to v1: https://lore.kernel.org/r/20260311-ayn-qcs8550-v1-0-fe8b2fa=
ad1ea@gmail.com
>
> ---
> Aaron Kling (1):
>       dt-bindings: arm: qcom: Add AYN QCS8550 Devices
>
> Teguh Sobirin (4):
>       arm64: dts: qcom: Add AYN QCS8550 Common
>       arm64: dts: qcom: Add AYN Odin 2 Mini
>       arm64: dts: qcom: Add AYN Odin 2 Portal
>       arm64: dts: qcom: Add AYN Thor
>
> Xilin Wu (1):
>       dt-bindings: vendor-prefixes: Add AYN Technologies
>
>  Documentation/devicetree/bindings/arm/qcom.yaml    |    9 +
>  .../devicetree/bindings/vendor-prefixes.yaml       |    2 +
>  arch/arm64/boot/dts/qcom/Makefile                  |    3 +
>  .../arm64/boot/dts/qcom/qcs8550-ayntec-common.dtsi | 1764 ++++++++++++++=
++++++
>  .../boot/dts/qcom/qcs8550-ayntec-odin2mini.dts     |   44 +
>  .../boot/dts/qcom/qcs8550-ayntec-odin2portal.dts   |   84 +
>  arch/arm64/boot/dts/qcom/qcs8550-ayntec-thor.dts   |  227 +++
>  7 files changed, 2133 insertions(+)
> ---
> base-commit: b9303e6bff706758c167af686b5315ad00233bf8
> change-id: 20260217-ayn-qcs8550-16c07b63de26
>
> Best regards,
> --
> Aaron Kling <webgeek1234@gmail.com>

Is there anything else I need to do for this series? Or is it just
waiting to be picked up now?

Aaron
