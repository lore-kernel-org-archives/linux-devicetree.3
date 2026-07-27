Received: from mail-qt1-f169.google.com (mail-qt1-f169.google.com [209.85.160.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6EF5341F345
	for <devicetree@vger.kernel.org>; Mon, 27 Jul 2026 15:59:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785167957; cv=none; b=Bu36NNBMCfzWp42ReuOY6WeO11U+543hi3MhuWPmYdlh4kniprDgTpdj4ws1/g/pSnSGhxStzvLPhYiS+OdgEu0MPlz+tTIfafYMfFVb5PbK+ekxhb8KxCWC8tJwdTXZr8nBN7D2BC2fTNWmuVuA9CX1t/XS3AxV9TZIZc9oAfc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785167957; c=relaxed/simple;
	bh=GREFLNoFwBaO8g/qcZzBBb5BmM7mDh+vmMslx6ltmZM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=V310XCPhPwBbvgVI+zHyBAxAXR68zzEOrBTDMHreYTSt/R1/JECugb0T/Gf+jykzaipYXeHFQpJ4QC0bi2+5/TvBHPBH+BC/cMdi3fEd3vyD4pQVXLx4QvqWWXkAMlT61wMrOInEvKlLICC2Qn3qiKcgvMC0w2Fwr1wOkiu9MV8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com; spf=pass smtp.mailfrom=riscstar.com; dkim=pass (2048-bit key) header.d=riscstar-com.20251104.gappssmtp.com header.i=@riscstar-com.20251104.gappssmtp.com header.b=WZtZ1fTg; arc=none smtp.client-ip=209.85.160.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=riscstar.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=riscstar-com.20251104.gappssmtp.com header.i=@riscstar-com.20251104.gappssmtp.com header.b="WZtZ1fTg"
Received: by mail-qt1-f169.google.com with SMTP id d75a77b69052e-51c2149571dso27769011cf.3
        for <devicetree@vger.kernel.org>; Mon, 27 Jul 2026 08:59:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20251104.gappssmtp.com; s=20251104; t=1785167955; x=1785772755; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=+UjimiS1ZGH8Z9qmeBpLWyEaDQH9OUrvKHAWj/PGhmQ=;
        b=WZtZ1fTgVUxjVHo0yiTn+FjKi6/WHtvsuQlTdY07paWROiJntStJa8+iCGiBnyJLT0
         mIaKCz66xRi+z+zi9jRDhmiXuViNE3eQemfmeRXzIzzZbUoS2wg3eHvepUG0VwPFh40a
         25ASlNcM3W7MOSqqbtDL+tWj4LZDk1Ls+YX0a7OvsTI05sduf5E4B2SGRYAge14YxIax
         6eTW33vTWgMIoD7awi/K18tPCwnR4r7s3BKc7DJo4bv+LvrXhmVU+OBTWkHNHWsJvaC6
         hWsBEiMQnx4DlG60FsDVVhTK6JU63hYMTuOPRQ7oaSRv9xJ+MmUljfULMRemLsAey6b5
         skYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785167955; x=1785772755;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=+UjimiS1ZGH8Z9qmeBpLWyEaDQH9OUrvKHAWj/PGhmQ=;
        b=d8sIWwTihWR0S0t7MdQYeM+UPTBAexzbP2MG+KmDqVsAXrceU8ZG7keP3VyuLeqE6I
         d0pTDwtGMlufdpbs1/dUeahWmNZdJ3ZrAdew0KdVGon5xjm0nvmhpLr28Jjpby4iFb7a
         Nyz5V5K2BHnJ+zRTV/YAPIg/kI3Eq4rNGyPRprtq46QXRtmLwug1inKiN/fdgS7+KppY
         nRGlTwk4vrp4nepdJhmwksJcwYQGqlOy1H15EfbAXNNbjLLSJYRkl+oa4mxZgDyZCv9W
         l1UdlStad+0wWii6pSvyMMD4srcZyUIYI9edr8+MlAl9sXXOBMQcrMj2/O+3l6IQehjP
         giGg==
X-Forwarded-Encrypted: i=1; AHgh+RrCYUoJ7T7NpBDTyabQUndFwhFaKLsKOrZDf7ODxwb+cwzulaLV/07GeoUY39P5f/paXVQLKhKqiPMY@vger.kernel.org
X-Gm-Message-State: AOJu0YyrKfdHfGzR0wDatnpmowcoXmQD6nKjFpRLjkaI7Fz+GufU0xMu
	hI7jhE39B443mFMebaYsigzsdWB5ktdGHjMvc/YBRT9b8gbDRw5ENKlrrMoNT+PYj3Q=
X-Gm-Gg: AR+sD10FmfYqVmVNaO7zHu0EzkoxN0XjTG7q2Q6EUWg80wbgqAJislvcoeMrWkh2T/M
	VrmCn5sZ7N3zsfnUPFcnl0pixI/7wSuTRZFW+AYsxcwHCunEmanltUTAzPc3F7Vi0FhEC4LoKnL
	uCaZCpbhqfdWne5VX/1M2e9jLWgGpzpdAYQK9urH/rWYqxiVB3agPPfVRhKNLV/yQvErqs0pqeF
	rub7iYkAS2sNnnCdwMVufLWx/G+O0a35DOCZp3qUDfKTtVmYF8gQ8RGxlJJC01N1BmQP3h/0v5G
	ZYB+pEVmh9gNQlFAj26XWeobg3JS1yPWL5nIAR7eQpZOqqjd01ZNWkR51dOliYwFCT59fvImCNc
	w1v/2indebwOHwCraA4Cun3254Fb5ePuzBugu0v3JTPOHG9kjxGRvNrTSOGHoEhpu17u+9rD/70
	rbbA==
X-Received: by 2002:a05:622a:d1:b0:51c:2685:2964 with SMTP id d75a77b69052e-529a86811cemr92228301cf.43.1785167955252;
        Mon, 27 Jul 2026 08:59:15 -0700 (PDT)
Received: from [172.22.22.28] ([73.62.185.64])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-529a262fa9dsm56944561cf.0.2026.07.27.08.59.14
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 27 Jul 2026 08:59:14 -0700 (PDT)
Message-ID: <341eff6e-9acb-43c3-9514-578bb628bf27@riscstar.com>
Date: Mon, 27 Jul 2026 10:59:14 -0500
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 5/6] PCI/pwrctrl: tc9563: Rename DSP3 to VDSP
To: manivannan.sadhasivam@oss.qualcomm.com,
 Bjorn Helgaas <bhelgaas@google.com>,
 Lorenzo Pieralisi <lpieralisi@kernel.org>,
 =?UTF-8?Q?Krzysztof_Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
 Manivannan Sadhasivam <mani@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>,
 Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>,
 Bartosz Golaszewski <brgl@kernel.org>, Bjorn Andersson <andersson@kernel.org>
Cc: linux-pci@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20260725-tc9563-fix-v1-0-ec4286e31331@oss.qualcomm.com>
 <20260725-tc9563-fix-v1-5-ec4286e31331@oss.qualcomm.com>
Content-Language: en-US
From: Alex Elder <elder@riscstar.com>
In-Reply-To: <20260725-tc9563-fix-v1-5-ec4286e31331@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 7/25/26 3:59 AM, Manivannan Sadhasivam via B4 Relay wrote:
> From: Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>
> 
> TC9563 Reference Manual calls DSP3 as VDSP (Virtual Downstream Port). Hence
> name it as such to avoid ambiguity.

I didn't really like the overloaded "virtual" term (though maybe
it is normal for PCI).  However I do like that this makes it
clearer that the third downstream port is different from the
first two.

Reviewed-by: Alex Elder <elder@riscstar.com>

> 
> Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>
> ---
>   drivers/pci/pwrctrl/pci-pwrctrl-tc9563.c | 14 +++++++-------
>   1 file changed, 7 insertions(+), 7 deletions(-)
> 
> diff --git a/drivers/pci/pwrctrl/pci-pwrctrl-tc9563.c b/drivers/pci/pwrctrl/pci-pwrctrl-tc9563.c
> index 28e9ec3e172a..f1179737f221 100644
> --- a/drivers/pci/pwrctrl/pci-pwrctrl-tc9563.c
> +++ b/drivers/pci/pwrctrl/pci-pwrctrl-tc9563.c
> @@ -80,7 +80,7 @@ enum tc9563_pwrctrl_ports {
>   	TC9563_USP,
>   	TC9563_DSP1,
>   	TC9563_DSP2,
> -	TC9563_DSP3,
> +	TC9563_VDSP,
>   	TC9563_ETHERNET,
>   	TC9563_MAX
>   };
> @@ -328,8 +328,8 @@ static int tc9563_pwrctrl_set_tx_amplitude(struct tc9563_pwrctrl *tc9563,
>   	case TC9563_DSP2:
>   		port_access = 0x8;
>   		break;
> -	case TC9563_DSP3:
> -		dev_dbg(dev, "Tx amplitude tuning not supported for DSP3\n");
> +	case TC9563_VDSP:
> +		dev_dbg(dev, "Tx amplitude tuning not supported for VDSP\n");
>   		return 0;
>   	default:
>   		return -EINVAL;
> @@ -368,8 +368,8 @@ static int tc9563_pwrctrl_disable_dfe(struct tc9563_pwrctrl *tc9563,
>   		port_access = 0x8;
>   		lane_access = 0x1;
>   		break;
> -	case TC9563_DSP3:
> -		dev_dbg(dev, "DFE tuning not supported for DSP3\n");
> +	case TC9563_VDSP:
> +		dev_dbg(dev, "DFE tuning not supported for VDSP\n");
>   		return 0;
>   	default:
>   		return -EINVAL;
> @@ -612,10 +612,10 @@ static int tc9563_pwrctrl_probe(struct platform_device *pdev)
>   			break;
>   
>   		/*
> -		 * The integrated Ethernet MAC Endpoint under DSP3 is a single
> +		 * The integrated Ethernet MAC Endpoint under VDSP is a single
>   		 * device whose functions share the same config registers.
>   		 */
> -		if (port == TC9563_DSP3) {
> +		if (port == TC9563_VDSP) {
>   			struct device_node *eth __free(device_node) =
>   					of_get_next_available_child(child, NULL);
>   			if (eth) {
> 

