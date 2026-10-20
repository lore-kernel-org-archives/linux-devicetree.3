Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792502008;
	b=tRg+Yq9Fvq7/7g03iOPl+kWnKELYvWP+os971xtb86FGq5zuqaoNKxfa3RwDXg2msXv5
	 n1sLY4rDH4TVLfoqwqvHWLTLIADHil/PU4748uih4sZozyaE3NsBA96XzY/dpColn4jFl
	 wkf+kCzLqG6C22zAc0W6rxnuOUUiZzm1qO5kv7bQM64Uvm2U3nBTrHYK0u+UOGhYgX+1/
	 ahalDG5q8Paj/gHED/+m+Auny2xg0Z7KPvdQENpNt2E7yiAli7z7NezjgQUui4Ruft0Xb
	 kOl7Ou+r5UdHzHNizNOjTyB+kkYpoUvfQkuMjrqeUsjLHDpWnv2ksvbdLyhdlDP4Pyw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792502008;
	h=Received:DKIM-Signature:Received:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Received:Received:Received:From:In-Reply-To:
	 MIME-Version:References:Date:X-Gmail-Original-Message-ID:
	 X-Gm-Features:Message-ID:Subject:To:Cc:Content-Type;
	bh=7Xz5yxwYccCRdcBBh2Atm6NcgygrMQamQyqFOlgMgL4=;
	b=vqCjkrMc/SFA2gEXZcfjX9jwRCSpdRcEBH2HrWbW63N5mdGPrOO83zNqQfrPlYi5xEmG
	 8ghlVGrqotV0etUibCGFgFw9NwHrKWCwOHZA0VmRWCpa3h7Dv3RxnOsCMNxtE8QjKHg+6
	 sfHlCmHLUuwyAMi2Z3xc4wCN2P6maA6KFhhSpMvKWGDc4yOqBTvVkjO5KhKF8mw5mWj1q
	 tbNdPTR8Ez4LDpB+JIzKb7rJQx6YsBioabhcgwfvjKvyBQ5X3uPZvbbsQqx5kfLKX/wEz
	 1st48SZ/K755lWEb6QxY6I4DpBYljRgLpi9R6NAsnYKRWlLs4XEbQ5DxAdGdK1Yl4wQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=HS7b82uW;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A9543606A326
	for <devicetree@vger.kernel.org>; Tue, 20 Oct 2026 13:13:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=HS7b82uW
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5951E1F000CD
	for <devicetree@vger.kernel.org>; Tue, 20 Oct 2026 13:13:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792502008;
	bh=7Xz5yxwYccCRdcBBh2Atm6NcgygrMQamQyqFOlgMgL4=;
	h=From:In-Reply-To:References:Date:Subject:To:Cc;
	b=HS7b82uWyekcgqxXwEU13FGJ+BTpnXBAZ/QOJ2802agY9d5yk3hM8WjbxDnbHXW4L
	 h1kShO5bk8jZqhi4fVARFnRxSS6ZNi0NBcRnf3oQzNmMzDBV9PG4MYXnO6IAarbJeX
	 5S9+JvRuklkCnlk4intNgTvUwd8Fu+ST+HqBlNSFXWRgZRzCWI0WMK6wBTnkbTmdiG
	 +/Fs9PTKfzHmF9r02UO5imCwIF3e+vT/ZcCm95WRww7YB1ESLy2md2A7UDt+NiBxPh
	 pyNJ29levKkXabuCMIdLPXW6SDWbwjsxGIQHBJWyXcQR5+8i8ip2wWQr5nixR5vTw/
	 VT9ashzfzJhIg==
Received: by mail-lj1-f172.google.com with SMTP id 38308e7fff4ca-3a595487d43so21937371fa.3
        for <devicetree@vger.kernel.org>; Tue, 20 Oct 2026 06:13:28 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBwiB6eouoE7SDF39impCfqu5xrzleCoK4ySBaTXF+x7k5skL2R/uSm/PI+6udOHoUXSEvB6NdAK+M9j@vger.kernel.org
X-Gm-Message-State: AFq9FYJEwo5nPuXY+DlyViRiPHxPRHSg33P/dX6riOjVWSjZXMlp6ET4
	ZxODHMRUrROQ6lA8LFpPruDFoPKukTxXmLhm8gWBlKBhLqWLWGj9ilJF2PcmTUgpYJaOWbHJ8S0
	TnsGe18+XObvHwIIYl7VaE3kphnhbechKhHymqoFomA==
X-Received: by 2002:a05:651c:b29:b0:3ab:1fc4:8eb6 with SMTP id
 38308e7fff4ca-3ab292aac57mr24128571fa.5.1792502005805; Tue, 20 Oct 2026
 06:13:25 -0700 (PDT)
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Tue, 20 Oct 2026 09:13:23 -0400
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Tue, 20 Oct 2026 09:13:23 -0400
From: Bartosz Golaszewski <brgl@kernel.org>
In-Reply-To: <20261019093911.3199891-1-linghui.wu@oss.qualcomm.com>
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261014121910.1509541-1-linghui.wu@oss.qualcomm.com> <20261019093911.3199891-1-linghui.wu@oss.qualcomm.com>
Date: Tue, 20 Oct 2026 09:13:23 -0400
X-Gmail-Original-Message-ID: <CAMRc=MfNYiKG05SH=1iu-=5=-udUZ8D119FW4NWYv6OONz0_Xg@mail.gmail.com>
X-Gm-Features: AclHuK9cEPruM3nikBKdX3c6tCX1jD7CMOwmmVs7mWGQbc7Fpw7kzXpuklCrV3Y
Message-ID: <CAMRc=MfNYiKG05SH=1iu-=5=-udUZ8D119FW4NWYv6OONz0_Xg@mail.gmail.com>
Subject: Re: [PATCH v3 0/3] power: sequencing: qcom-wcn: support SW_CTRL wake IRQ
To: Linghui Wu <linghui.wu@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>, 
	Abel Vesa <abelvesa@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>, 
	Mark Brown <broonie@gmail.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Miaoqing Pan <miaoqing.pan@oss.qualcomm.com>, 
	Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>, linux-pm@vger.kernel.org, 
	linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Bartosz Golaszewski <brgl@kernel.org>
Content-Type: text/plain; charset="UTF-8"

On Mon, 19 Oct 2026 11:39:08 +0200, Linghui Wu
<linghui.wu@oss.qualcomm.com> said:
> Some WCN3990-family devices use the SW_CTRL GPIO to indicate that
> resources need to remain available while the application processor is
> suspended.
>
> Teach the Qualcomm WCN power-sequencing driver to use the existing
> SW_CTRL GPIO as a dedicated wake IRQ when the power sequencer is marked
> as a wakeup source. The PM core keeps the IRQ disabled during normal
> operation and arms it for system suspend.
>
> The series documents wakeup-source for the WCN PMU binding and enables
> it for the Shikra CQM, CQS and IQS EVKs.
>
> The series has been runtime-tested on qcom-next and kernel 6.18.y on
> Shikra hardware.
>

Please don't send new iterations in response to previous threads. Use b4 for
patch management if that helps.

Bart
