Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.218.54
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793201469;
	b=xgMdQWY/HlaAVcUTS89elPIFFZlBNPZNqUJ4e+co6/h9h6nS8nPKnmrTS8hF4LbFANXa
	 +Etog1TPmSfbnbE8/Me2qBlLvZbR6kcXYSLqKZDV41DQoQDfh8xStQsDShRKsqr5cGkhz
	 GFuTwoZf3gVyKKksSH3k2yFMfndSHQEQtVmo+KAwCN/KPkHS8nEh5yqlwkjmZaVFE8sm5
	 HZJcm1yxKJEs+dkc5uM0g9BpgyBSdz/NPjnAoJ/JTpxsIayv+hGLB5irvM7TnQLg5HJcS
	 ZiCE+iOi6mMNDg4PtS+d12KqyZnbRo1mezn+GMAR8HzJhlx65HinfN26MLEEPtRLAzw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793201469;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Date:MIME-Version:User-Agent:Subject:To:Cc:References:From:
	 Content-Language:In-Reply-To:Content-Type:Content-Transfer-Encoding;
	bh=wemZBH5N8kr8/m8fq2ioHfv60pNctDnjzWt9aNzMtaw=;
	b=KIckPBNRUQcPvHq7+S4nRax50LEJ/B5WOHlEWQSNBB1J0wCeJC+NzsdnBBsx8ZD65W22
	 SBwg0kK692QKbT6BQsYgPWV85g1zEbouFOIf3aSxhTntidUKt36MHarTpzLeFuN6FcPg8
	 4sJcCn78Mi4xmgd9oGZ1xSVWN5zdKuyogHD/5wTZGiDcY+PxsdxHG2MnZEMdkWuOyKxtM
	 oiIPgEqKk1brh/0lekAthu/NatMA0eMKQniD0DBYzmVre/5nyP0kzaGBt9cm/2nV7z/Dk
	 Ll4ONNOM4X+lNMwnCi+g51jihOKgKW+xh/W2FT9ozIqD/HOaZBpnVCYpni6xow1Gi7Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linaro.org;
	spf=pass smtp.mailfrom=linaro.org;
	dkim=pass header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=ZpLSHtz3;
	arc=none smtp.remote-ip=209.85.218.54
Received: from mail-ej1-f54.google.com (mail-ej1-f54.google.com [209.85.218.54])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 85B0D606A31F
	for <devicetree@vger.kernel.org>; Wed, 28 Oct 2026 15:31:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 85B0D606A31F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=ZpLSHtz3
Received: by mail-ej1-f54.google.com with SMTP id a640c23a62f3a-c40f29667e6so118305866b.0
        for <devicetree@vger.kernel.org>; Wed, 28 Oct 2026 08:31:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1793201467; x=1793806267; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=wemZBH5N8kr8/m8fq2ioHfv60pNctDnjzWt9aNzMtaw=;
        b=ZpLSHtz3kFRM2BRETpYSukD3bRLdMeTKGj2xHeVRSOavkV/SJShwlinM7GpZCEqYy3
         zD7wE36CmGuVt0WMUlb3rzEtobX818C1CgH6DgL7nMrgCwL1NvNueDFwKWGzLMXV+kEd
         GisIPOclVxDYGguyzba17fLH5ZszWEgnW+1ceT8rlUzLkFLCO7oMYINNoqlmBKqCUTYp
         7HWmoWQGizm2Ewx79YjaPLfAcNtKLpUSwRvWkAKEIkb51CS876G3x1/TiDL2hpcue+qc
         M0i8Dhw6UDGpu/Jpz2uK2YgVFDwNPoR3ykzRej0CH4upXFppSjaVmmOiNTrpYE6yE0RD
         PgcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793201467; x=1793806267;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=wemZBH5N8kr8/m8fq2ioHfv60pNctDnjzWt9aNzMtaw=;
        b=M1+2vuYokKkNWgC9Gjy4fvXt1Zr8M1IGSlLSKPv1iA5sbKVCgAM65OrBMD46/rQ9to
         bg8g1DiTYiJG2211nVGQXtNNm/8Uj6xFjZTFQetW5P07ASNJy/zqhYkWoqx5FUgALKdw
         uReNDgyFEHFAeAaXvB4SILXDPo0euFzWNd92VbDu1f8skkAP7dqU06kdkO/3nhEMMU/U
         3m8OOakYSLwdIwzfVBXqOFhrfLIuKZJwJNDL8kdWui5W2CL0Pxa14WkTpeVp0IPIJnVU
         /cb1wo/vUkH4/tpD7/lUpi4hdB8qxDSfe2glQkfVnzWl+YUtXkUSqv0Np4YDrdFx4w1s
         j81Q==
X-Forwarded-Encrypted: i=1; AKwUvBxpfFs31CqTONAPokID+OSa7uAe2FjaGz4P7nK4vtgl4nuua0/oOFSYI7ZexVmxKubi77hzNcpZ2szb@vger.kernel.org
X-Gm-Message-State: AFq9FYInEDoww50rjTY70fltegXJ1b0B9QpNkpSVFf56lqoC4KDJx0fd
	gRwI93IE+swFMhusaoAmRE9qEoYGaerJkFj89OrzkdJQpo3DaP6M5dlxFnaQB3HLhuQ=
X-Gm-Gg: AYBFou205XEtoPrrxW1b4Xs7drkVGO4O40Kx8nRVKSij2Z7lQYPGykjdabmbrDJYg7/
	I4ccqygzEmt1gwdPL/Npa1in3lKnbX8yQgxOdcvHEh+OVYmQpk2JHbqIIVOFo3RoDRRVdxCrb43
	C465luVhCrbL6i1D9KszcJ5ygGMLai253B7c2JJ8Y2JMumYo/N8uqFsD1CUhQhm+VT54ouVAq+1
	r9BHub3/Zvqz41qU0zj2T9KLv7fGO8Jym/Gq3SBlqNdVeR1J/ysO6LrscLfjRPJ+Ez46J+5wsAK
	lf7RaCviWtGuj2gyqJt7ZVkZYmPZNzOYlGBBLGal5gMzdFWMWwm8NsDa4dfD0KmPEJ+wK21WxPy
	ZP/Rp3syDm2ugJfPDHDBtYRgEXeHlIzlCQuNGn454oKnvpsvWjjDQscZXd5Pm8u1o8Bz90QuSVj
	b3+vw/kZfNI68hXkmNUBX+VbG5GTvoiLgabNJngG2FVCNNsdFCaKyC2jvphuh16p1NwIfUHrRGJ
	DrYVH90JYBX8NNMVmGT6Z9qA7bO6+FsAyHxWMDdDldhQVYoRengXbRQwyC1FDs/kGG1j7u6NH1F
	+pYkCg2nQUhDSkm+JNjpW6oUdlHbqY2L6+IS4fOJRPo1rKMQjg5tIjRH+MPwjNw=
X-Received: by 2002:a17:906:ee8b:b0:c40:9839:c892 with SMTP id a640c23a62f3a-c49bdf140a9mr230072266b.19.1793201466691;
        Wed, 28 Oct 2026 08:31:06 -0700 (PDT)
Received: from [192.168.0.167] ([109.79.76.222])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c46bd4e9995sm616663766b.15.2026.10.28.08.31.05
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 28 Oct 2026 08:31:06 -0700 (PDT)
Message-ID: <9d22f3e6-7f6a-4450-b6f5-871b87fe49bf@linaro.org>
Date: Wed, 28 Oct 2026 15:31:04 +0000
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v23 07/15] media: qcom: camss: Add PM clock definitions
 for Kaanapali
To: Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>,
 Bryan O'Donoghue <bod@kernel.org>, Vinod Koul <vkoul@kernel.org>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Manivannan Sadhasivam <mani@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
 Loic Poulain <loic.poulain@oss.qualcomm.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>, Abel Vesa <abelvesa@kernel.org>
Cc: linux-phy@lists.infradead.org, linux-media@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, jeyaprakash.soundrapandian@oss.qualcomm.com,
 Vijay Kumar Tumati <vijay.tumati@oss.qualcomm.com>
References: <20261028-kaanapali-camss-v23-0-95f250b18612@oss.qualcomm.com>
 <20261028-kaanapali-camss-v23-7-95f250b18612@oss.qualcomm.com>
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Content-Language: en-GB
In-Reply-To: <20261028-kaanapali-camss-v23-7-95f250b18612@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 28/10/2026 15:20, Hangxiang Ma wrote:
> The CPAS AHB and AXI clocks are shared by every Kaanapali TFE and IFE
> sub-block. Register them as PM clocks so the PM clock framework enables
> them once when CAMSS resumes, instead of each sub-block listing them and
> taking its own reference.
> 
> Signed-off-by: Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>
> ---
>   drivers/media/platform/qcom/camss/camss.c | 1 +
>   1 file changed, 1 insertion(+)
> 
> diff --git a/drivers/media/platform/qcom/camss/camss.c b/drivers/media/platform/qcom/camss/camss.c
> index 98ec23c39fda..a64242c66cf0 100644
> --- a/drivers/media/platform/qcom/camss/camss.c
> +++ b/drivers/media/platform/qcom/camss/camss.c
> @@ -5606,6 +5606,7 @@ static void camss_remove(struct platform_device *pdev)
>   static const struct camss_resources kaanapali_resources = {
>   	.version = CAMSS_KAANAPALI,
>   	.pd_name = "top",
> +	.pm_clks = { "cpas_fast_ahb", "cpas_ahb", "gcc_axi_hf" },
>   	.icc_res = icc_res_kaanapali,
>   	.icc_path_num = ARRAY_SIZE(icc_res_kaanapali),
>   };
> 
Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
