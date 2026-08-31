Received: from mail-pg1-f169.google.com (mail-pg1-f169.google.com [209.85.215.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3C8723E928B
	for <devicetree@vger.kernel.org>; Mon, 31 Aug 2026 12:00:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.215.169
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788177648; cv=pass; b=WQ6SUNWBMXp6aCoOZwCmUXGnYNV/R2ZM3zFIymlcIgF2ensKs/IAKHQwwwziHY8Hm+7tEWKnoCO5gb0jv3XyZ6CY4C09QHk50fpc2m6gxUxxQ8qWDLkpq4CyNg2a/twk5BrKAOsS12cPt2Hmh3EOQ1w1o8fS1kyqwldJ/QYgXsw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788177648; c=relaxed/simple;
	bh=59shnk5YdABVH7EU9lOkruHnUV5zrqz/LbWh9Ypnyqg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=eSYKnzUlNFY4dzvuDdI4+viawf11XBO/CEnkpyAdglI3mZLgwIln5hJaf/E9Az5ceypALANjanD90qGTSkKaS/OWwBztDP/BRRlMlIcCG1/JsKbFNTSi1MG4c1RxCn/L7oTrBqGjmVAaRAg3x9zPn8XN2GPk+4ZFH06VPfm9Dzw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=lBxlZsW/; arc=pass smtp.client-ip=209.85.215.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="lBxlZsW/"
Received: by mail-pg1-f169.google.com with SMTP id 41be03b00d2f7-cc1d57602e8so3124505a12.3
        for <devicetree@vger.kernel.org>; Mon, 31 Aug 2026 05:00:46 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1788177646; cv=none;
        d=google.com; s=arc-20260327;
        b=HMzJSk6ij20oCt2hV8LS0nZlKyv//aZrM0w2zNaxnXw3XW2S8RSxE8Wa5HJleyh6MH
         D1w/Of2ogethRwhdAONnnKpGQwKFpEIPBVfoau++sjXQ8aXk0Dg9Ieq13H1dyLPIyqC5
         8GTflfbprENKJASdLms0yT/R/B5qJ/+t6pTz2YAljiQ1XvAeBu0BDbu/yJXR8b0Tjeyb
         dJ9pl2rQZ8U6BELNJyFk9udorzAgwQaukIxfClAA6iOBcNIcw9l7onN89P5y2CbLkM13
         wEodShjNqzS75Qg/TT3dR4pKgZWfkS8mDrXQWd2TNzgd79hnFCF24F4qK1PsDB44Aj52
         7Jow==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=ZEdPHPT/tITKhrVTG+XJ0o1wyuPtLccyUlcKppXSZJ8=;
        fh=8YzG21RGatyWJB15sgKlbHto5fSnBzVXSruTnAZg2Zg=;
        b=NHEuQN+xJscuqiHD+O/A537/Gp03UBuS4r0rmV9jYE6l07mwLQrFt1Pj2PYFnD9yXH
         9yNOH/WEhrXAxXwurHGRwM3V77bITV/P3PQaB+KmbVyIaEBoaEGhUo7WvOKsznPsMwno
         mw07eweyZEXQ97jKVpJPp6gFj1ZfSwHkNda29Co+cpXzGdDsR0rvK+BUE/uce+Bi2f7G
         mdqW3WPl+cGZGbSGPh6Lzb5ZUPgqPmTJbEX6ryp+4A+iTxS4ZWTatmQX4mbLgJEDfGPQ
         35FZL3mz5pWMqqWrWAvws7GiB2dBfhhVnpV4V5rtS6hriJW40+CDij+Fd2eVUcVbgUst
         3V3A==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788177646; x=1788782446; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ZEdPHPT/tITKhrVTG+XJ0o1wyuPtLccyUlcKppXSZJ8=;
        b=lBxlZsW/pua3ZKWe3TJwtxVW/UCXGciH8vbGkOkDS/FAbkKBCA+/O3p9Nc/+js1kML
         8yc9b3jAWk/088oDJB56b5tnXVumODO/4xDY8iS2//cBH5LBuCZ4Trloz5vY4CPnHzkc
         9WX6NEdDiclktz2fJNCRYtVvJZUVXUAqOmggZ8OeM1ZADOixmBH54bZPMr8z3dphHZut
         EfPEm3VHyGnvhRIZm3iMHhXMfN9iXvy9WgamGr2v/w0yUKWSJlzfqy6ZOg61AQWtVjx2
         Fym1t9T+ZNbycJmn/xMr83p3PXp0Vuk2Jb6z8ZswtREbklS3RFrZx0k4bWWDCku/lsY1
         HLFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788177646; x=1788782446;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=ZEdPHPT/tITKhrVTG+XJ0o1wyuPtLccyUlcKppXSZJ8=;
        b=RWAe7GI3kUCWKl1a6KgratTCgHQPIKEAYKi+0F1lp5yN28OrTW6Vta2ubuGFrLBrfZ
         6i3GQ6XW0Ap+7kgi/T3m2tLpWo0P8M2Kw0xVCrb2sZ6wALv/BLdHevS6UdvtFfxx2mea
         pMiXcdANqY6cKBBYdwujzhOlMCKK8NdJM2P9iysN2PZ2UK930d1xGEsuN0hVnJPS17yw
         XcAlt2p/kJ6rwgUp4RqFJlzOUoT35IqwkmqLkoYUF8IzJ5SG8DoDapJsTZsLcWPDQ+Nb
         0oXRqVMJmrzfOE/Sv0v+hRUR/jVwvXfYVYeRLMtWD2SFFzXRO5l5BIXPMe0K2Bx9dQuN
         Pa6w==
X-Forwarded-Encrypted: i=1; AHgh+RqI8kJ2/AefWReypQRSshQ3mf/JfErgZqQ+Mju4ZiwWPVnZLOwTo6oe1TcmOxOelosJb53oKC4OsijO@vger.kernel.org
X-Gm-Message-State: AFuF++kRIZqfl5+/zHZYbK/YCAQhnSWrzO4zQDocQnWODXDTaF25M/rS
	1r8Jwu0geevBb8+wvcBRfxHF2CHnQVVX/JGi6sZPHaFj2ouBTcPfzTM3Gz8ZytC/FPvqNXuszWG
	6Ss7ILhzI49jk2YVOE/Codp85nVlND2ezUgmi2ULQ
X-Gm-Gg: AR+sD10Hk04ClZMs89BqA+wZnk3uH0m7AL/JHB6LC6Qww4ndXqWmMYkPwmfyLL/yxrb
	rJhQcIsHjqmmWgyi73i629gBMce9qmFR0rDYrl9eal0PV59WMosa3/g8oMpyk5lGW5Nw78RuwRR
	YjJ6rpZ4unp+EaaBz4vjByESNA7bF2fEpVGmQIVq7MK37R247St2S2FX6WrfKSyVB9glxz49N+i
	ZqxTnPuXpKGWiF+0C883kgU12bviAcawur4umcAtxBoM5o+uUQ9VFW4fs+HBbG4ywZbaASozoZG
	N/4cPQh+DuxXn3DZ7FLH3gY63xYJb1XwoXIq6SpRRQ==
X-Received: by 2002:a05:6a20:748b:b0:3d1:3c2:85b6 with SMTP id
 adf61e73a8af0-3d266570c5dmr35694751637.5.1788177646257; Mon, 31 Aug 2026
 05:00:46 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260831-dts-qcom-hamoa-reserve-ec-reset-gpio-v1-0-5b202de8c74f@oss.qualcomm.com>
 <20260831-dts-qcom-hamoa-reserve-ec-reset-gpio-v1-4-5b202de8c74f@oss.qualcomm.com>
In-Reply-To: <20260831-dts-qcom-hamoa-reserve-ec-reset-gpio-v1-4-5b202de8c74f@oss.qualcomm.com>
From: Aleksandrs Vinarskis <alex.vinarskis@gmail.com>
Date: Mon, 31 Aug 2026 14:00:35 +0200
X-Gm-Features: AcwNN1U55-Spe1BCyB8yOmgMhN2oooSN-83xVQjBn7AtVurkhafkoP6j4ImL0r4
Message-ID: <CAMcHhXqCFzMy=VX+Pm+T21DuJ==-28wBwSJxKzCi1NMJhBKqfg@mail.gmail.com>
Subject: Re: [PATCH 4/9] arm64: dts: qcom: x1e80100-dell-xps13-9345: Mark the
 EC reset gpio as reserved
To: Abel Vesa <abel.vesa@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Sibi Sankar <sibi.sankar@oss.qualcomm.com>, Abel Vesa <abelvesa@kernel.org>, 
	Rajendra Nayak <quic_rjendra@quicinc.com>, Marc Zyngier <maz@kernel.org>, 
	Konstantin Shabanov <mail@etehtsea.me>, Srinivas Kandagatla <srini@kernel.org>, 
	Georg Gottleuber <ggo@tuxedocomputers.com>, Ettore Chimenti <ettore.chimenti@linaro.org>, 
	linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>, 
	Konrad Dybcio <quic_kdybcio@quicinc.com>
Content-Type: text/plain; charset="UTF-8"

On Mon, 31 Aug 2026 at 12:05, Abel Vesa <abel.vesa@oss.qualcomm.com> wrote:
>
> GPIO 65 from TLMM is used by the embedded controller as its reset line.
> Reserve it to prevent Linux from requesting or reconfiguring it.
>
> Fixes: f5b788d0e8cd ("arm64: dts: qcom: Add support for X1-based Dell XPS 13 9345")
> Signed-off-by: Abel Vesa <abel.vesa@oss.qualcomm.com>

Hi Abel,

For XPS 9345 this change is already included in my series for EC driver:
https://lore.kernel.org/all/20260809-dell-xps-9345-ec-v4-0-88306dbbc7aa@vinarskis.com/

To avoid conflict, could you drop the XPS 9345 from your series? I'm hoping my
change will land shortly, its already reviewed.

Thanks,
Alex

> ---
>  arch/arm64/boot/dts/qcom/x1e80100-dell-xps13-9345.dts | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/arch/arm64/boot/dts/qcom/x1e80100-dell-xps13-9345.dts b/arch/arm64/boot/dts/qcom/x1e80100-dell-xps13-9345.dts
> index 2be5a37c00cc..b795b65d604e 100644
> --- a/arch/arm64/boot/dts/qcom/x1e80100-dell-xps13-9345.dts
> +++ b/arch/arm64/boot/dts/qcom/x1e80100-dell-xps13-9345.dts
> @@ -1072,6 +1072,7 @@ &smb2360_1_eusb2_repeater {
>  &tlmm {
>         gpio-reserved-ranges = <44 4>,  /* SPI11 (TPM) */
>                                <76 4>,  /* SPI19 (TZ Protected) */
> +                              <65 1>, /* EC reset */
>                                <238 1>; /* UFS Reset */
>
>         cam_indicator_en: cam-indicator-en-state {
>
> --
> 2.54.0
>
