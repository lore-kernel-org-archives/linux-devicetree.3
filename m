Received: from mail-wm2-f13.google.com (mail-wm2-f13.google.com [74.125.225.141])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 439194C10DB
	for <devicetree@vger.kernel.org>; Tue, 29 Sep 2026 09:02:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.141
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790672555; cv=none; b=aszoVCHuab0kn7nbB02L5bJsTDSAcMqSgqwJHhc4FpNiPj4y6u/fDusBsLpgdAQ6bBIlSdMfIssebkCP5avjzOKCm4n7IjXJ2hZjZ0ENpf463hCr9na/0ZjApOHVG8VBgEIoxKQwJl9AqzarWZNrfJDyRDw69INMUMMPLvSoXe0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790672555; c=relaxed/simple;
	bh=+E8vF3OM2T9aBuCele2XoJ6uplIMu6dwqmf1wFybHOY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=n2ZtTfe+TSTseTBnWxF1qtUAYCR2juVOi+mEfXFTdKhVdxykmgPFTZbutpzl8hZ8NIY12U3WkfoUAUjrkdabZc+bZCuraXiySnMArjSvRK21kxC+KB8ghQQ7w9wcG13/MABPBR31LrC1Ej0Rbzb659CgkXeEg6/nEhkwu46g9h8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=IE6Djk1J; arc=none smtp.client-ip=74.125.225.141
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="IE6Djk1J"
Received: by mail-wm2-f13.google.com with SMTP id 5b1f17b1804b1-49e83a388f8so29625185e9.1
        for <devicetree@vger.kernel.org>; Tue, 29 Sep 2026 02:02:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1790672542; x=1791277342; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=BwJjdqcFj709Qv5LzibFkFCPgjMc0g1wC/gY1GLFeWU=;
        b=IE6Djk1JwBkjZBnhb6zaOvVtY6qWfjaAZr8DYgMSr9fbfHPc5oAiQP3WfY8O6IBvlK
         2pBa2FcqY9kCYXglwhYDTocIqIX3xAYv6LOYSvsoUTtvGoiJF9+gHKOVOy72616iZQIU
         j6TXzFqJPIBl9mKXHRziWSE29clCi9L9fvzKq4qrbde2bFZ5V19jHIVDLRAdaLYyc6YF
         SQKBhUcvTtZoIQIa/rry4ARk9mhOk0RNAae4Ri3b4tjObkdTlC6vBgkR6dKjHl/yZpsQ
         /fBKLoxCWfeuwxWrhyDrK0/w+piuiFOg8STzKauGhp2UDu6At7dhMBlaBAG4L14Ar7sM
         GHmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790672542; x=1791277342;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=BwJjdqcFj709Qv5LzibFkFCPgjMc0g1wC/gY1GLFeWU=;
        b=Ymp7NK9Afm6BPBVCr/8xwM2mlp564qvEdHJYIBqvk2qaTMRjoyTbpR2hwF4YjUbss+
         N7hRK8mboLXAXaOzVRHfTLI1Kq9/IQ90UHOKuyoyuk+YVcHM9ORQyaA8kBKrBlvbGc5X
         rLQhxEkL4mdwUs9DQxJECFSzEB/ECIPFssLpft7PxqvNpf83mSZXurluKGrBVZxElgsC
         9CdHgk/+IsKAGAl5IeE5qJ91WqKxXYo2pGesMwgp4DrPXfBRMg9Q3PdhIsWCVg884BWe
         TmHrTPQuKofSG+I609gFRG7CjXRlzSYdlVYGAOBSDhfWHExwg5rte/wks29DkLldWf3L
         eHgQ==
X-Forwarded-Encrypted: i=1; AKwUvBzFbwlKbOHXWJXIQ5Gp4D3ZHNqZQDDQNT2FwA4PISRfmaN67mS/SQLe/OM9EnW3mX1+JRJ0YdceGKS6@vger.kernel.org
X-Gm-Message-State: AFq9FYJcph7gspEJg6npjg391E9EGE0nNiZ2U3LWi3la1Ny1eUYv7WhN
	n29X33fc9qO1PwFLJq7WYYzM2cz7Wf4PfEf/M8duhEtQTnv3lpfagnoLC8fCt67quYQ=
X-Gm-Gg: AYBFou13jGd8qOlpOlBnKsWam1raJ2VVGzqGODaoCmdwShc6MTDu9pf82kfIMI9k3it
	W0mAqIwskUsq2VGU1GmcXpUk/ViFo46iUPk334IGY4ldpF1igV2EBdh6SRPe56wznr5GzYd90FZ
	x4Bncft5EzqTBypf0ap+A+OExZYaVRl1DE00kLbBVy3IXEJEzIHKNfh60S6zEZM0T4zLhaabbW4
	nSRMppzIbocaLby/DbAvQ/HXgW95g2BJcfjKPzx/cHkQQFxaM3csmk90SlLqZoPa0a6VNV59N0V
	8QjgXocqIOOQAkdXuGtcGgljbODnMK5TryBLR6tS6ihol5Lq91ThJdl93hnzXoxT+Pz3BwiOti0
	RYUkkxb0yNP1TKOD1BseKNKN6NjMiRHaV8AJ692iRNjUPMX8ns5lD/PIHqY87fK/6A4U65Fs3+c
	VjIS6EAszW8L3zn9dF+l9VHRJYOl0rac4YkPsjNMcgRtRmzEpkLjee+CFdsESv1Kqhz7HQtn6at
	/xJovYO
X-Received: by 2002:a05:6000:4009:b0:487:92e:c608 with SMTP id ffacd0b85a97d-48af1b1cc9amr3124751f8f.1.1790672542160;
        Tue, 29 Sep 2026 02:02:22 -0700 (PDT)
Received: from [10.11.12.111] ([79.115.63.240])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48af5058c52sm2748227f8f.19.2026.09.29.02.02.21
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 29 Sep 2026 02:02:21 -0700 (PDT)
Message-ID: <7b5dded4-c475-40dd-b5c4-5086bab4162e@linaro.org>
Date: Tue, 29 Sep 2026 12:02:18 +0300
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] arm64: dts: exynos850: Add ACPM firmware node
To: Alexey Klimov <alexey.klimov@linaro.org>,
 Sam Protsenko <semen.protsenko@linaro.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Peter Griffin <peter.griffin@linaro.org>,
 Alim Akhtar <alim.akhtar@samsung.com>
Cc: Thomas Turner <tturner@lineageos.org>, linux-samsung-soc@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20260929-exynos850-acpm-node-cpufreq-v1-0-5a86c1d404b8@linaro.org>
 <20260929-exynos850-acpm-node-cpufreq-v1-1-5a86c1d404b8@linaro.org>
Content-Language: en-US
From: Tudor Ambarus <tudor.ambarus@linaro.org>
In-Reply-To: <20260929-exynos850-acpm-node-cpufreq-v1-1-5a86c1d404b8@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi, Alexey,

On 9/29/26 6:10 AM, Alexey Klimov wrote:
> Add the ACPM firmware node with cpucl0 and cpucl1 clocks. ACPM firmware
> protocol provides interface for all client drivers to actually use
> features exposed by the APM co-processor.
> 
> Signed-off-by: Alexey Klimov <alexey.klimov@linaro.org>
> ---
>  arch/arm64/boot/dts/exynos/exynos850.dtsi | 13 +++++++++++++
>  1 file changed, 13 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/exynos/exynos850.dtsi b/arch/arm64/boot/dts/exynos/exynos850.dtsi
> index 8a4771899a8e..91c6cee8f483 100644
> --- a/arch/arm64/boot/dts/exynos/exynos850.dtsi
> +++ b/arch/arm64/boot/dts/exynos/exynos850.dtsi
> @@ -11,6 +11,7 @@
>   */
>  
>  #include <dt-bindings/clock/exynos850.h>
> +#include <dt-bindings/clock/samsung,exynos850-acpm.h>
>  #include <dt-bindings/interrupt-controller/arm-gic.h>
>  #include <dt-bindings/soc/samsung,exynos-usi.h>
>  
> @@ -170,6 +171,18 @@ timer: timer {
>  		     <GIC_PPI 10 (GIC_CPU_MASK_SIMPLE(8) | IRQ_TYPE_LEVEL_LOW)>;
>  	};
>  
> +	firmware {
> +		acpm_ipc: power-management {
> +			compatible = "samsung,exynos850-acpm-ipc";
> +			mboxes = <&ap2apm_mailbox>;
> +			shmem = <&apm_sram>;
> +			clocks = <&cmu_cpucl0 CLK_FOUT_CPUCL0_PLL>,
> +				 <&cmu_cpucl1 CLK_FOUT_CPUCL1_PLL>;

Why do you describe these clocks?

Thanks,
ta

> +			clock-names = "cpucl0", "cpucl1";
> +			#clock-cells = <1>;
> +		};
> +	};
> +
>  	soc: soc@0 {
>  		compatible = "simple-bus";
>  		#address-cells = <1>;
> 

