Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C870C439322
	for <devicetree@vger.kernel.org>; Thu, 30 Jul 2026 13:39:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785418751; cv=none; b=U0uyfWj5k6jgBQ128GPoj3H7i8rsYpgzlqQPdsNhA8EsYILWkE0QiDp6kiyDO/C0MS6/U1vqytxH9ygkPWKh3wgWD6ZQX8hk1eitz5czNtvPrtiZ7z6nghUpQ5rcAv22+cawkYc7pBPAZFDQbRtXrfGifxKtTnSoE3iQnYJFDjE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785418751; c=relaxed/simple;
	bh=7cpHV/zX8gsc/vc5/0FWhZN6fJRI8neqBQvCepYioMU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=J+MoicgqPSGC0clTchNoZ+DDHjZOnMWx5i4/v2ZlBWOmeQPaRMxI9hNgAPwqDIXqt6njRiqSBfdZyO/imx2NNX0+jvXfOxvakclXbFcAogYuolEalOGzgahag3/iUSIuDZGG3T72GJx46MKz3reyi9tCc25dfr3+JRGzKuriH5E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=AmpeLtN0; arc=none smtp.client-ip=209.85.128.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="AmpeLtN0"
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-4955aa106b1so19425545e9.0
        for <devicetree@vger.kernel.org>; Thu, 30 Jul 2026 06:39:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1785418748; x=1786023548; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:organization
         :autocrypt:content-language:from:references:cc:to:subject:reply-to
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=tEpQfW0i9zMzUon+YjJi7VO3bURSB+GNSr1ebIfPudM=;
        b=AmpeLtN02/CLzRV+P+xSzikQBNwj3s450L2MEq2dz/2EGiz2uKaeqGb3iAYQvUJAsC
         Rs6ecLCEVhoEUd9rv0szcCob7coO6ccTSu50807lYFRF2QaC2IyTEnClcWrQD7Ku54/J
         WTN/uor9PeBY6nC1D0qzgQdIhs+h79bDAHDPuhtRnNljQ4bS8KmM3vqak5mRSJJJBYLG
         mXEB3k4BM6TZna3IE/Ptj8UfEJQXu8fWyDjY4cF2QPlWuZl8BjC7TxnVs2Oy2p/wWyA7
         J078UQgduJyt+idulG/ZJtk6pojK1HRUnue7owrdaBGTMATYt0GWPYXGudyB1SxgTJFo
         zjAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785418748; x=1786023548;
        h=content-transfer-encoding:content-type:in-reply-to:organization
         :autocrypt:content-language:from:references:cc:to:subject:reply-to
         :user-agent:mime-version:date:message-id:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=tEpQfW0i9zMzUon+YjJi7VO3bURSB+GNSr1ebIfPudM=;
        b=oPomp2YERG9j/5VKqLFJbkNsbP9JSSo1/NXWYCQptJ2bZ9ILYHW6ovhkvxNKfbWoag
         Pj1W/RQ8GCcKZDNa89l55zNKr4hOjMzU9HfrsQSk2lHjiZTI9xb76DmPQkjfrvv/9dOF
         Oq+1XKO4qTXpmZDKFZ/ByY4nDDxdbqsjuTz5M0LX8uPu0qh1AcUJ5Q5AIpGWplhRJ9Hu
         2VDm4Lo0uRXPzZ8fp74mZiicng5A6LjxJVzAszJ6ATnjzW+s9jccZk8i52M4q2QHJ5Q+
         +/aoz18fmFq8ooimvBcGmhlKq75f3u5mY7+bKTHT1mGkxzdSyM6kZSg+yIXnHVKpF2Xb
         0p1g==
X-Forwarded-Encrypted: i=1; AHgh+Rq37pFtS1kkSm6e3CnZQrN9YA2ZZFGxWz0kwcYr0Y/SPflk2vGdMcOHUCUvOxDsDxVgxLxh+ClrDxn1@vger.kernel.org
X-Gm-Message-State: AOJu0YxtVX9pjiNncnMrc6gzr4tScVsNotYZZJYFAdDMbOBn4xDViFTB
	Rxc5ehYILFzUvWVrpoGPjmIOa96rRkYVMuWA/UL6Zf4qebHmG3VQROZlEEmUM5DLKao=
X-Gm-Gg: AR+sD10/bQ/YDwI1xUroRdQWKe9AwOeqJdkq+3Yt3qTy+egSnv26wKiMB6xjICGbYlF
	OYWYftq7pPXnS28t734+K/GLlYNzr0A0eNVVtQDrF5MN9eVqy42XMB+3HRa/BZnGAO8yekpe0Ps
	pJyB8dlVx0lWeVzOPfSxZs4ft6OHWI0/L/qdB5qoCs74oScf9uv5OP5wRkraQJnbD/VgW++E3Ld
	m9CZ41Q/zUfWnnvnDCLNw0Aa9zP3jAhIc/i3fnrG+zxsPEGbCCmqi1O1w89Q20a42Bv+H8FK4rF
	ejatnt6uhy/JozA1uORsbfI4znv9sm+Le1gIVLdeaGDlbOEeM0eIwpxUhIMaZ6o40nkVdwLpQcR
	YDQ5Am3sOFHp02KZ3KuEzLOPpAeEXwrOBNLjnDUyDrhaXqFICcYvLulGhWlbLNsIXlrSVtLr7oJ
	C2vYM5AW7NvZQ85QPhrMLED76brJG1CBTueI+nQxqtK3QW83XABdRVNb/GFrLxvbMvE/NtFfZQY
	zLhGJZp561ttu0bFGzZDfc6ATmNBAI94rlsQmy1VglJ
X-Received: by 2002:a05:600c:350e:b0:497:ff73:68d5 with SMTP id 5b1f17b1804b1-49800e1fe0emr39759665e9.0.1785418747845;
        Thu, 30 Jul 2026 06:39:07 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:106d:1080:dc56:4d92:c5ac:40a6? ([2a01:e0a:106d:1080:dc56:4d92:c5ac:40a6])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-498012168e7sm66329435e9.15.2026.07.30.06.39.06
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 30 Jul 2026 06:39:07 -0700 (PDT)
Message-ID: <8753420b-8e4e-40d0-89f5-54d3604edb58@linaro.org>
Date: Thu, 30 Jul 2026 15:39:06 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Reply-To: Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH 10/22] arm64: dts: qcom: sm8550: Fix the PCIe iommu-map
 entries
To: manivannan.sadhasivam@oss.qualcomm.com, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Manivannan Sadhasivam <mani@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org,
 Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>,
 Krzysztof Kozlowski <krzk@kernel.org>,
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
References: <20260730-iommu-map-fix-v1-0-83405d37ba41@oss.qualcomm.com>
 <20260730-iommu-map-fix-v1-10-83405d37ba41@oss.qualcomm.com>
From: Neil Armstrong <neil.armstrong@linaro.org>
Content-Language: en-US, fr
Autocrypt: addr=neil.armstrong@linaro.org; keydata=
 xsBNBE1ZBs8BCAD78xVLsXPwV/2qQx2FaO/7mhWL0Qodw8UcQJnkrWmgTFRobtTWxuRx8WWP
 GTjuhvbleoQ5Cxjr+v+1ARGCH46MxFP5DwauzPekwJUD5QKZlaw/bURTLmS2id5wWi3lqVH4
 BVF2WzvGyyeV1o4RTCYDnZ9VLLylJ9bneEaIs/7cjCEbipGGFlfIML3sfqnIvMAxIMZrvcl9
 qPV2k+KQ7q+aXavU5W+yLNn7QtXUB530Zlk/d2ETgzQ5FLYYnUDAaRl+8JUTjc0CNOTpCeik
 80TZcE6f8M76Xa6yU8VcNko94Ck7iB4vj70q76P/J7kt98hklrr85/3NU3oti3nrIHmHABEB
 AAHNKk5laWwgQXJtc3Ryb25nIDxuZWlsLmFybXN0cm9uZ0BsaW5hcm8ub3JnPsLAkQQTAQoA
 OwIbIwULCQgHAwUVCgkICwUWAgMBAAIeAQIXgBYhBInsPQWERiF0UPIoSBaat7Gkz/iuBQJk
 Q5wSAhkBAAoJEBaat7Gkz/iuyhMIANiD94qDtUTJRfEW6GwXmtKWwl/mvqQtaTtZID2dos04
 YqBbshiJbejgVJjy+HODcNUIKBB3PSLaln4ltdsV73SBcwUNdzebfKspAQunCM22Mn6FBIxQ
 GizsMLcP/0FX4en9NaKGfK6ZdKK6kN1GR9YffMJd2P08EO8mHowmSRe/ExAODhAs9W7XXExw
 UNCY4pVJyRPpEhv373vvff60bHxc1k/FF9WaPscMt7hlkbFLUs85kHtQAmr8pV5Hy9ezsSRa
 GzJmiVclkPc2BY592IGBXRDQ38urXeM4nfhhvqA50b/nAEXc6FzqgXqDkEIwR66/Gbp0t3+r
 yQzpKRyQif3OwE0ETVkGzwEIALyKDN/OGURaHBVzwjgYq+ZtifvekdrSNl8TIDH8g1xicBYp
 QTbPn6bbSZbdvfeQPNCcD4/EhXZuhQXMcoJsQQQnO4vwVULmPGgtGf8PVc7dxKOeta+qUh6+
 SRh3vIcAUFHDT3f/Zdspz+e2E0hPV2hiSvICLk11qO6cyJE13zeNFoeY3ggrKY+IzbFomIZY
 4yG6xI99NIPEVE9lNBXBKIlewIyVlkOaYvJWSV+p5gdJXOvScNN1epm5YHmf9aE2ZjnqZGoM
 Mtsyw18YoX9BqMFInxqYQQ3j/HpVgTSvmo5ea5qQDDUaCsaTf8UeDcwYOtgI8iL4oHcsGtUX
 oUk33HEAEQEAAcLAXwQYAQIACQUCTVkGzwIbDAAKCRAWmrexpM/4rrXiB/sGbkQ6itMrAIfn
 M7IbRuiSZS1unlySUVYu3SD6YBYnNi3G5EpbwfBNuT3H8//rVvtOFK4OD8cRYkxXRQmTvqa3
 3eDIHu/zr1HMKErm+2SD6PO9umRef8V82o2oaCLvf4WeIssFjwB0b6a12opuRP7yo3E3gTCS
 KmbUuLv1CtxKQF+fUV1cVaTPMyT25Od+RC1K+iOR0F54oUJvJeq7fUzbn/KdlhA8XPGzwGRy
 4zcsPWvwnXgfe5tk680fEKZVwOZKIEuJC3v+/yZpQzDvGYJvbyix0lHnrCzq43WefRHI5XTT
 QbM0WUIBIcGmq38+OgUsMYu4NzLu7uZFAcmp6h8g
Organization: Linaro
In-Reply-To: <20260730-iommu-map-fix-v1-10-83405d37ba41@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 7/30/26 13:55, Manivannan Sadhasivam via B4 Relay wrote:
> From: Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>
> 
> The IOMMU provider apps_smmu uses '#iommu-cells = <2>', but the PCIe
> iommu-map entries specify only one cell for the SID, omitting the SID
> mask. This went unnoticed until the OF core started warning with commit
> ccb2fd725d41 ("of: Respect #{iommu,msi}-cells in maps"):
> 
>    iommu-map has 1-cell entries targeting 2-cell #iommu-cells, treating as 1-cell output
> 
> So fix the entries to match the provider's '#iommu-cells' property.
> 
> Fixes: 7d1158c984d3 ("arm64: dts: qcom: sm8550: Add PCIe PHYs and controllers nodes")
> Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>
> ---
>   arch/arm64/boot/dts/qcom/sm8550.dtsi | 8 ++++----
>   1 file changed, 4 insertions(+), 4 deletions(-)
> 
> diff --git a/arch/arm64/boot/dts/qcom/sm8550.dtsi b/arch/arm64/boot/dts/qcom/sm8550.dtsi
> index 396201905ef2..69babd26c678 100644
> --- a/arch/arm64/boot/dts/qcom/sm8550.dtsi
> +++ b/arch/arm64/boot/dts/qcom/sm8550.dtsi
> @@ -2382,8 +2382,8 @@ &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>,
>   
>   			msi-map = <0x0 &gic_its 0x1400 0x1>,
>   				  <0x100 &gic_its 0x1401 0x1>;
> -			iommu-map = <0x0   &apps_smmu 0x1400 0x1>,
> -				    <0x100 &apps_smmu 0x1401 0x1>;
> +			iommu-map = <0x0   &apps_smmu 0x1400 0x0 0x1>,
> +				    <0x100 &apps_smmu 0x1401 0x0 0x1>;
>   
>   			resets = <&gcc GCC_PCIE_0_BCR>;
>   			reset-names = "pci";
> @@ -2561,8 +2561,8 @@ &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>,
>   
>   			msi-map = <0x0 &gic_its 0x1480 0x1>,
>   				  <0x100 &gic_its 0x1481 0x1>;
> -			iommu-map = <0x0   &apps_smmu 0x1480 0x1>,
> -				    <0x100 &apps_smmu 0x1481 0x1>;
> +			iommu-map = <0x0   &apps_smmu 0x1480 0x0 0x1>,
> +				    <0x100 &apps_smmu 0x1481 0x0 0x1>;
>   
>   			resets = <&gcc GCC_PCIE_1_BCR>,
>   				<&gcc GCC_PCIE_1_LINK_DOWN_BCR>;
> 

Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>

Thanks,
Neil
