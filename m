Received: from mail-ed1-f52.google.com (mail-ed1-f52.google.com [209.85.208.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 388B1480DE0
	for <devicetree@vger.kernel.org>; Mon, 14 Sep 2026 20:15:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789416930; cv=none; b=GIZ+C643LM2GGWZU+VuWhzi/5a6dYhjPOlSzhwpPjuY58pPz2gcX3XdvHbhNQz7CsHieWgbW58Z4ziBYSd+dfla3mU3VDVvO7ZTG+8F0PtBD0Wf78Wk/YpWOf5trdBlYcQALFaoUOGzpRNqNqRdUauzpRZ2McDIuiP/4Kx9h/Pk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789416930; c=relaxed/simple;
	bh=GykgSnZ4kWqbaJjn/9T0vyH9n/iK2VhkIfkcUJdlBuk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=nbvh6X27fROKN/LShJQ8ZuTgcJUCav1/fYkN85Rg1WfrPO2eEp3mFfkYXqX19BJZBRkwcMOXZ+RD+RwBMjmy7A041OQVuzRCLlXL9yjN1RcRlcX07pAjBx9QfiHxfhb2gO7KI/5nfJAA7ZWFLYNx8afMyA25E5N+vu7ki33jO/s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=bMZZDctY; arc=none smtp.client-ip=209.85.208.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="bMZZDctY"
Received: by mail-ed1-f52.google.com with SMTP id 4fb4d7f45d1cf-6a9a2f16ed4so381754a12.0
        for <devicetree@vger.kernel.org>; Mon, 14 Sep 2026 13:15:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1789416926; x=1790021726; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=K7ypREDUbgOotRmXNI3oJlTg66vvpyevfxzia1IXsPA=;
        b=bMZZDctYnf21WxAkfoqiCg9XxwZLGTkmzQt8JZ45r39/go9xGReDPVtHVcK3Bs6EYU
         bEfOyNxykmx7gPfJAs44CUDF3S5HEcYaWIo50S37e9b4mYlvZE30G0juDcqNds1VYU+J
         6gT7B+KTl8FpHeUfv0S62eoly12FlbZvGTt9xkMG1PYShuDCP57/bYD4zn+m4USqhpCk
         GxeY+AGznjb9+s/dnCm/66lD2i+b7hJU0aQpmfrTziqskXsVfCIEhba8OYac8UNVHg7x
         Xklv9+HRxzWMWSFTrrafknvLXUH9LNjDIJ4Nkg5JRNLDzQp4EAYPsiR9I3soTYl0VJ6r
         VfvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789416926; x=1790021726;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=K7ypREDUbgOotRmXNI3oJlTg66vvpyevfxzia1IXsPA=;
        b=hDZ21/XLhY8TG8gpm4T2Zm6EBd9r+WZpTvyyzc69v80qy1hDQXHas2vM1i8J8SkqCE
         G5hitQvcynT/2BEO4H4i3L6wWCA/VJVhnm1rwqiffSeK1DuRDhelOZjt1mzl971HWJJs
         A+RuOveL6H3/LplflaJWgaisLkVuvyE90Uhe6O1Fdbs9AbjJMsikwG8INxW05B9cGIyA
         QBLYo+01wmHqWH5kW1Gg9sPRu2Mhn7sZqniZHLvqSXa1v3hterXizrJqb521yD/6RcPP
         5K/PFwDN/ZSMVoHm89iBoss+w8WHmxRbMui+GG0ZcYLRowLPIpfHY+U0oNE83m9hBqlN
         Oo6A==
X-Forwarded-Encrypted: i=1; AKwUvBwRYy8xBdE6piV7q0MpZGV2BNGgWCg4eMnydOuvTrhejI6Q9MU1BEC7K72G187Hv//XeRPPuMLPCS/X@vger.kernel.org
X-Gm-Message-State: AFuF++kZdUvjDivwFknXw9eBrL1fszrV/rSHTOaFMM5jxw9uM4pXXEfc
	z4J1di9SxIZr0VgzCgrzSn2dgBTJu0SgqOfmKEtmoAnOpnBrIHabRAEytu0OP9S2wIo=
X-Gm-Gg: AYBFou2G4uePTMnWiD7EUjtSWQNdFas9g6AOE46rYpu/geUicvSoZnzx2dVuH+zJj0K
	RDNQC0I1UqjB/jlYfvuv5Bfwl3mn1w/id8gRekO1NqioLgfYR5+1ue57YjmOCwNCW99+Cdz8onW
	ut1jZLZMgQ6UEXGCRUIv7toUxZ77uoORpri7ls7lkbQPBN9ItmGpNpnyctqFkiHET4fMwYoV0QY
	iinERfuoTBvCooB3QwOuR7WbXcjqqGQNgi5M0P8+MGwlPSrfjbd2UaMmbc+wI853KH6tIfpoqR4
	SQ51BrK67ZcwaMFWeSqHv5C+i1G3U1FHN/+8DmPyYRBnX1aaSLM8TUvKYISbpgFe5T+ehr+oSZW
	GPho91IVFohqHcxJjSr6+Nfj2p3P0y+Tx0AQwGLtKlr+U+gU3Ha3UzldvIZT5OLIcTSLkGOSCmq
	zyf9V/w+JW7gl8bX+GG9GHqOk+2T+6gTusLeCBoXGVE+VwPNVtnzry1oL9rOlY10PebsvnFKZNu
	iqf3RGGHw==
X-Received: by 2002:a05:6402:b86:b0:6a6:75b7:4ff6 with SMTP id 4fb4d7f45d1cf-6aa03f7ab4cmr403420a12.8.1789416926406;
        Mon, 14 Sep 2026 13:15:26 -0700 (PDT)
Received: from [192.168.0.35] ([109.76.248.34])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6a9b594e462sm4859796a12.24.2026.09.14.13.15.23
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 14 Sep 2026 13:15:25 -0700 (PDT)
Message-ID: <cd7d3d8d-f629-4fa4-9417-98bbef3230d4@linaro.org>
Date: Mon, 14 Sep 2026 21:15:23 +0100
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] arm64: dts: qcom: Fix touchscreen address on Dell
 Inspiron 7441
To: avalon.vargas.centeno@est.una.ac.cr,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>
Cc: Val Packett <val@packett.cool>, linux-arm-msm@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260914-dell7441-touchscreen-v1-1-d79540ca5e81@est.una.ac.cr>
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Content-Language: en-US
In-Reply-To: <20260914-dell7441-touchscreen-v1-1-d79540ca5e81@est.una.ac.cr>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 14/09/2026 14:30, Avalon Vargas via B4 Relay wrote:
> From: Avalon Vargas <avalon.vargas.centeno@est.una.ac.cr>
> 
> The LXST2021 touchscreen on the tested Dell Inspiron 14 Plus 7441
> responds at I2C address 0x09, while the device tree specifies 0x10.
> Probing the latter fails with -ENXIO and no touchscreen input device
> is registered.
> 
> Use address 0x09, matching the LXST2021 configuration on the related
> Dell Latitude 7455. With this address, the controller identifies as
> 29BD:1103 and binds to hid-multitouch. Touch input and suspend/resume
> have been verified on the affected Inspiron using Linux 7.2.4 with
> the equivalent device-tree overlay.
> 
> Signed-off-by: Avalon Vargas <avalon.vargas.centeno@est.una.ac.cr>
> ---
> This replaces the earlier report-plus-diff with a patch submission.
> Only one unit has been tested. I have no evidence of double-sourcing
> or a working Inspiron touchscreen at 0x10; a typo remains possible.
> 
> touch input and suspend/resume. The native upstream patch has not yet
> undergone a full kernel DTB build or dtbs_check.
> 
> Validation: Linux 7.2.4 plus the equivalent local DT overlay, physical
> ---
>   arch/arm64/boot/dts/qcom/x1e80100-dell-inspiron-14-plus-7441.dts | 5 +++--
>   1 file changed, 3 insertions(+), 2 deletions(-)
> 
> diff --git a/arch/arm64/boot/dts/qcom/x1e80100-dell-inspiron-14-plus-7441.dts b/arch/arm64/boot/dts/qcom/x1e80100-dell-inspiron-14-plus-7441.dts
> index 75e10d9..0cf5716 100644
> --- a/arch/arm64/boot/dts/qcom/x1e80100-dell-inspiron-14-plus-7441.dts
> +++ b/arch/arm64/boot/dts/qcom/x1e80100-dell-inspiron-14-plus-7441.dts
> @@ -25,9 +25,10 @@ &gpu_zap_shader {
>   };
>   
>   &i2c8 {
> -	touchscreen@10 {
> +	/* LXST2021 */
> +	touchscreen@9 {
>   		compatible = "hid-over-i2c";
> -		reg = <0x10>;
> +		reg = <0x09>;
>   
>   		hid-descr-addr = <0x1>;
>   		interrupts-extended = <&tlmm 51 IRQ_TYPE_LEVEL_LOW>;
Nice.

A Fix should have a

Fixes: tag
Cc: stable@vger.kernel.org

---
bod
