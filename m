Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 90633484221
	for <devicetree@vger.kernel.org>; Thu,  6 Aug 2026 16:17:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786033076; cv=none; b=rdFzt53RkVBipcX8uNLZSmTMCdbpwPaCIixRsjIMOmrxNu1fnaX3rtEJjxEkEP6B1y5jOz5RA3yGY+9EKS2A0KFma8YPDbHIwjQHTfcP6AQUFx7IEXaL2zWhlk9PjBiiB2kv8HNd/NRpdC639AeaLxY9vYdmRwHtwKQAFBbZiyM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786033076; c=relaxed/simple;
	bh=h8+2Erq/wSaXTLvVyIseCSe6KFN1jiUdb+sF2rTDb44=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=WnauNWHd8IhqRgz9dGFdwfqakP+WqQnsZ/EqEPLdExFXDkeES6JKjArJc8gW6SUaPuR9MJf83+vKQNiCs0a9Bt4acH1LoOQEgPqa7Wf89Y29Vn2kaQQJUX7DzfIA51a5cJ5y7sMTKNPJJH6ZA3myh8S0MrLDw1LsK3OR8o1n8TM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Gnij0g2r; arc=none smtp.client-ip=209.85.221.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Gnij0g2r"
Received: by mail-wr1-f46.google.com with SMTP id ffacd0b85a97d-47f71156e1aso1110294f8f.3
        for <devicetree@vger.kernel.org>; Thu, 06 Aug 2026 09:17:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1786033067; x=1786637867; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=s2TkJw4qV4dMHeSE8n4BR00N5vqDbN8wATqN3VEnGD4=;
        b=Gnij0g2rgQCYJ4K8bhohuTLp1zuzsMr7Dl/FiNfDF2pUb67J+eVu+Hs+X9q4kuYooG
         hYImAFmk0ljJDhSJeSbUv5BFB+97pG24smURdsDQMJnk2QN0R5z5RaWxB6h7s3JQesTQ
         Ls8vUZ09o5SvRojlWEiPoFOT1loBs8ozHCCZVNi96lpby1kFVMjNS19BaRLm91XccJYK
         Vi1WZ+QFJpdHl+3AVxVobCDaj/R2QgbI1yLDjZrxjcKt7xP2nDlFe6CkKLZhrVhyGR+E
         d75qxl3YYzX3qXs7AL5JJtRX74iTticGoH72VFRnxYKKtknDbp2GlI4W5CkoD8BEjKjG
         wSdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786033067; x=1786637867;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=s2TkJw4qV4dMHeSE8n4BR00N5vqDbN8wATqN3VEnGD4=;
        b=q3LrGlbftQyw8gGXtkdzvOuvMGrT39k4VBSU7AHqh9hnnSfgkxLgNG3VjJruLcTiq/
         W+LmgTidZfcq67mXDheHek8WufZ5H/kr/kvCoFs2tCgzm1/QKfU2HnzlKdRfeqoA6uGH
         +kfyd2iNhTX7PJeiCrepWmvD8OThXHXyH0tTrZZIAIM61KdQZ3x5fORpGkeZVXlvDE8l
         EfRefcb6hD5Ml0629ZmfCZKrHhdvsSkRdKytxlxzXv1lOhpfPuy39eSsBGzlmBi3XpN7
         WbyY+nliaL1si8LtmwmCt9JSSD+NuB1DqfAxROAiq1D0GNzaNn9ljtw8hvt5/NsBD5im
         w/pw==
X-Forwarded-Encrypted: i=1; AHgh+RpsCWl61lWvknOZfsm4SLu8tcEVF6yOYmrzmApzVVjs/aLDo9xRLO0aXHG2ruSiLzYPlhb26YdBbw0r@vger.kernel.org
X-Gm-Message-State: AOJu0Yy6HU3kUITAJ5lAjhJtHS3a/PSn38tScyX0N3gDleZSQe5zV3Ta
	ULjzB6lFHxDUmFxMPmEQPPb233WPJ5fOoY+hNZDdmdYip16Xt2Xa4kn/H8w02IK6SdA=
X-Gm-Gg: AR+sD11ayK44SyDNSainGlXzAEZHtQS7Ti7oejobliGQzZAKFK0GmIbWDXKGXY0qj5J
	Vm1bg1w3+mhf/s7A3e23bdes/nSEU9EM56HfFdqKDL/CTmCGUs7esEHGLDiitV4JKNtrsYjDtIo
	UEv5cWC/oCtRxYFG9N1Rr+aE/SbwdPQnewN9dNwnDTADlQwImaneYkghPYkDbIOTzdrrgoHq20x
	zTWPrzJmw2OvSRs1K+xiN4h866Vdfh05XuSYdbZlJTDVSh49sbKSc3D1w9os6xln9hOam2FUv46
	OJqW5vF3UX12IkL9vXRVk76eNMMZ94l4FaRM1v7GWguGhIDyzlTSj8UulPqggoYtjOv+An0qqzC
	dG75KkmzzC6B/CrcKGVBsMfghgPO/xLbhNedArKqbfyumc+4PLqPWv465h7GaO43XzF/057S/dw
	E5piwWxb2J5bmxG/CWzg6RJg8pAXrc7rqnZARf6J8w1zjd3uShllBscEGahS5kzEOmaHkHtnAoI
	w==
X-Received: by 2002:a5d:6f0a:0:b0:47f:8a1c:54d8 with SMTP id ffacd0b85a97d-47fec502df3mr23870212f8f.3.1786033067170;
        Thu, 06 Aug 2026 09:17:47 -0700 (PDT)
Received: from [192.168.0.101] ([109.76.115.165])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47ff7b32487sm6964879f8f.34.2026.08.06.09.17.45
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 06 Aug 2026 09:17:46 -0700 (PDT)
Message-ID: <43327fb2-0085-4d86-b408-8723d852c258@linaro.org>
Date: Thu, 6 Aug 2026 17:17:45 +0100
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/4] phy: rockchip-samsung-dcphy: factor MIPI D-PHY
 power on/off into helpers
To: jason98166@gmail.com, Vinod Koul <vkoul@kernel.org>,
 Neil Armstrong <neil.armstrong@linaro.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>,
 Guochun Huang <hero.huang@rock-chips.com>,
 Philipp Zabel <p.zabel@pengutronix.de>
Cc: linux-phy@lists.infradead.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org,
 linux-kernel@vger.kernel.org
References: <20260726-dcphy-rx-v1-v2-0-cf9cc34a412a@gmail.com>
 <Ji-6adk9LJbP87Y7X6SfOcAyVnGpO4dbHk0lBikX3NGAPz3dynWpvL8QjkVM3G3jEnwTrTV0p7nOqBxPRaH0MQ==@protonmail.internalid>
 <20260726-dcphy-rx-v1-v2-2-cf9cc34a412a@gmail.com>
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Content-Language: en-GB
In-Reply-To: <20260726-dcphy-rx-v1-v2-2-cf9cc34a412a@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 26/07/2026 15:55, Jason Yang via B4 Relay wrote:
>   static int samsung_mipi_dcphy_power_on(struct phy *phy)
>   {
>   	struct samsung_mipi_dcphy *samsung = phy_get_drvdata(phy);
> @@ -1368,7 +1376,7 @@ static int samsung_mipi_dcphy_power_on(struct phy *phy)
> 
>   	switch (samsung->type) {
>   	case PHY_TYPE_DPHY:
> -		return samsung_mipi_dphy_power_on(samsung);
> +		return samsung_mipi_dphy_tx_power_on(samsung);
>   	default:
>   		/* CPHY part to be implemented later */
>   		return -EOPNOTSUPP;
> @@ -1383,16 +1391,11 @@ static int samsung_mipi_dcphy_power_off(struct phy *phy)
> 
>   	switch (samsung->type) {
>   	case PHY_TYPE_DPHY:
> -		samsung_mipi_dphy_lane_disable(samsung);
> -		break;
> +		return samsung_mipi_dphy_tx_power_off(samsung);
>   	default:
>   		/* CPHY part to be implemented later */
>   		return -EOPNOTSUPP;
>   	}
> -
> -	samsung_mipi_dcphy_pll_disable(samsung);
> -
> -	return 0;
>   }

This looks a bit funny.

Do you have an int method() {} with a final path that returns no value ?

Tooling/compilers will definitely and rightly complain about that.

---
bod
