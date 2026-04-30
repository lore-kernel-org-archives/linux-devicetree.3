Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6B32239DBDF
	for <devicetree@vger.kernel.org>; Thu, 30 Apr 2026 08:09:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777536589; cv=none; b=kA1M9XCcHZIWnJV3kscNoLGhNPEdDqcG+62Xqj1IUgHgGmkQtj3GoDdAuXCz1rA6FqE7+D/QyEvZOzv/b2Lu1UAQSqPLErfD/RGnYxcmNRXMtpVbd9mEZOUs0GRNxZJsNUhnFzkYR07aLSqCh16tYcZ0931NMN2WYv//rBq5IeU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777536589; c=relaxed/simple;
	bh=P/Va7b9oi7EzhBp+mBnd7Ehsh75YSeMT12CU7XQ1b5w=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=gkY4Ann41slBmymzwf/QKw52Cr0CaFB9Y/xgEYN5PNosTS3MyAhK1aW/kyvNX8m3nZPZITK01C6eyRSYD6MsXInjMKcSSVDyOPHXywfh85kRChT3M8IkUSBT8/TUmpPL6S9XshdvVOcVdZ8z1RLT/LZ/kTxlE1T2fpOnKfq0FLQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=S1kOkTHw; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=jH7B12uI; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="S1kOkTHw";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="jH7B12uI"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63TNuHE33636516
	for <devicetree@vger.kernel.org>; Thu, 30 Apr 2026 08:09:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	wXogd7QkYAMuJeC9lEVQeWa6XXf4lK9naY79j9evPIo=; b=S1kOkTHws41QeWRm
	MLbltE02vS9s6+x63s0Uspysyb7/12mSGoSn7O07gAZhZFlyDO0C7hcMG+JUS2QE
	UgjKt/8eHRw5Bzde939NkVwOvt++b8zG/G9RnvMwkc4G+pHhERh7hy49mMys8WkD
	mA+RfZPEMwdWN9TwlYaMY4NLEA3ajzrGD9e60OEqfd3LWuoWPtXj4WUruI3+hWXq
	FeDkdLsDC458IP2ltVY0QmU1qHAnIlR9YoG+gSioxAq15ZmvqMrAK6HpaW7wMnXv
	MXaTMVIKwJfxqBqbZnQf5aJPFBS46sAXIhQziSGp0CHVcdv2Ua48+fCsG00lOwJ4
	BXJOnA==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4duv3q1hqn-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Thu, 30 Apr 2026 08:09:47 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-35e5791871fso1345629a91.3
        for <devicetree@vger.kernel.org>; Thu, 30 Apr 2026 01:09:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1777536586; x=1778141386; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=wXogd7QkYAMuJeC9lEVQeWa6XXf4lK9naY79j9evPIo=;
        b=jH7B12uIhykKZS0OxumemlCZY4SbVSFJ7dTvgUGI9417C69OF/841enFL89Lml2Brw
         VSwI+u/gS89il9VcoguF6UP9bSL+4l5vC0nWeJbLjh61r5h1oGVQuOaxgTptU8aoyxCO
         fU0aBGxPDE087Rnp78rPyAntiNMpwS0Y33JaI0Z/+ncTROBbHaTd6uR6zhsh9E9uZSHq
         ut3RVdG2myl4n6IwSK0Q85VQ+L/0eUaMTVRdMhDhm2mA18U2goGc+8YoFqR4i4LTu1Ni
         fhqBtTcZxvN/VJwVb9FeczHt/Hel8TdyKOcisZXbjnm0XciibK4TOFCFb8AYVygcucwg
         eMwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777536586; x=1778141386;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=wXogd7QkYAMuJeC9lEVQeWa6XXf4lK9naY79j9evPIo=;
        b=mQ3f1FWzUdddgBprUVjKy1nViYCAbbUlobyib4GRG6ocDe0ZrboFP6fHPf2et9jg0z
         1SlB+BVszYqbSwm8EGEUyQNcAlSujeHxBOZHua64wbcoB5HPWhODJMV9nwN7c1EktGPl
         JQdS+BKvIn0lj59sPOkQT6801kaP+7gfOMmORz8VrZICYYpJC3Rjbngz04hcsjGhBskP
         WaGmQnHMWEIf+Zs/Zio0DPoTqlt5E4gAxQakW9rSQdE0wX/6+Ua0EY2nTSuVS3dQQNl+
         XUitWEcPg4IxFum2Z2KDYSDzz4q6FnWBzFfs/ZMyeRECUytrV8a4fRykcUCAZBFx5aO5
         dKpg==
X-Forwarded-Encrypted: i=1; AFNElJ8psbUNGEYv9sRd/kSw8nfFJlL8GM7Jsy9y5x8GbR4DF64enaZOhdQ4KseGCWQpCtLX6/cx6Tthd7/h@vger.kernel.org
X-Gm-Message-State: AOJu0YyW9qZt42CHapwp09s5BMR6IUdFWs7SOZKKuCbwJJQz6AjPoTvi
	Mno9KYOjc0yGgihcyqoFvHPcuczKKUeMKa1FoESZisnZIJBKLcO9bDVGwTeopgGlUdCg8H0dnsk
	YTsusg8GRk5wX4T0Dp9Fb/p6yU2EwC4Oe4bjh2BW+n8+oKyB02EMZOEejDIJi+trKZlLkcSF+
X-Gm-Gg: AeBDiesgypaq6HNJAr5hRxkFNq9Ho7JDEuMa+8JEt5e83L43ASA5IFpHkTD9jJOr+V0
	G07BGt7IiHDKh8m3KvMz4gOZzOoqpNJn8Us3N8Zok49GhRVH4udCH7t6mOPM/NdxT2DeoMzDsPI
	voRhC3lJ0KxPIJ4v//BLuC41bYlR9zGF55w+crKQj6wHXJkG/med81CUjHYfhh2eVfr3CbnM1DG
	UJHwy/iYRZBd1UiLWMXcb+5QJP1UWA1nDCCEj34RSfnlQ+CmUnVj8+2aOM0mMtREVyyFt3Ahfrp
	ND50ZPHMeaMr9OdUp/ujuRqGYJ5ZGHwlTqxU5yQT22qJzNbcXuKY2aQWaHtoipBTouiU8HagRft
	PKbVNeYn+VWxrQbhAPX6bMdz5Cuyg5bpgE9EhtGYlwtCMZkFAQzSS5/MNRIygsUE=
X-Received: by 2002:a05:6a20:3ca2:b0:3a2:ebfc:6bee with SMTP id adf61e73a8af0-3a3cf86d7c6mr2289336637.41.1777536586240;
        Thu, 30 Apr 2026 01:09:46 -0700 (PDT)
X-Received: by 2002:a05:6a20:3ca2:b0:3a2:ebfc:6bee with SMTP id adf61e73a8af0-3a3cf86d7c6mr2289285637.41.1777536585696;
        Thu, 30 Apr 2026 01:09:45 -0700 (PDT)
Received: from [10.0.0.4] ([106.222.229.64])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c7fd5bcced4sm4129908a12.0.2026.04.30.01.09.40
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 30 Apr 2026 01:09:45 -0700 (PDT)
Message-ID: <663947c0-b316-59bb-3ea3-d1bf313577af@oss.qualcomm.com>
Date: Thu, 30 Apr 2026 13:39:39 +0530
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
Subject: Re: [PATCH v5 2/5] media: iris: Add hardware power on/off ops for
 X1P42100
Content-Language: en-US
To: Wangao Wang <wangao.wang@oss.qualcomm.com>,
        Bryan O'Donoghue <bod@kernel.org>,
        Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>
References: <20260429-enable_iris_on_purwa-v5-0-438fa96da248@oss.qualcomm.com>
 <20260429-enable_iris_on_purwa-v5-2-438fa96da248@oss.qualcomm.com>
From: Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>
In-Reply-To: <20260429-enable_iris_on_purwa-v5-2-438fa96da248@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: SlKZvXJARImcAND-GoxVWpypAttIzIVp
X-Authority-Analysis: v=2.4 cv=dOyWXuZb c=1 sm=1 tr=0 ts=69f30e4b cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=sQGdqEwRzC/zEhaLYLcr+w==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8 a=isqJhVKGVgDRGp0WoxgA:9 a=QEXdDO2ut3YA:10
 a=mQ_c8vxmzFEMiUWkPHU9:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDMwMDA3OSBTYWx0ZWRfXxSLG0fu3MJsz
 rHD74yGUKkY5mR0YnWKfj+AX4rmHuAeO2wD1hUQT47a0fvovTzvvNWF27FNcPQW+YroPkCMAwx+
 O9jxTd5kE7do8XPGTQHfNyWQnqDVNFp6OoY1C2+lCdD6/E3niQxZbPfdSBPVrc3gmlRGF0cSNwj
 n7XzVytOVZGmOZg8TRqBFr8/o6YeSEJ3D8sNP19ILiAJnHva19hN+3lfaJgEQAxNNL+353z8XcV
 CK7QthfLR/QzYIiivNAmEfFcO13c9EfHCOopoeRsByTfGaXFxUUoJ98LmbhIQXFdL2Z5w28vKAx
 Hi2OiNTfZ/d/x0gk8CO97Gf5nCW06XEs4nO5i1A6guKFrzxPobSuW/V7y6A2R6+jFSfzfiCVi2g
 kypYS1ABd0eZFkL4j9sRb9/Y0nt5ScdQ0AtuMq+b12Fd4SQvmMpHCqE+WEHKwawH04J4FtO6/3p
 d41QzZBU7bkDjFhiIOw==
X-Proofpoint-ORIG-GUID: SlKZvXJARImcAND-GoxVWpypAttIzIVp
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-30_02,2026-04-28_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 malwarescore=0 adultscore=0 spamscore=0 lowpriorityscore=0
 bulkscore=0 suspectscore=0 priorityscore=1501 phishscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2604300079



On 4/29/2026 1:13 PM, Wangao Wang wrote:
> On X1P42100 the Iris block has an extra BSE clock. Wire this clock into
> the power on/off sequence.
> 
> The BSE clock is used to drive the Bin Stream Engine, which is a sub-block
> of the video codec hardware responsible for bitstream-level processing. It
> is required to be enabled separately from the core clock to ensure proper
> codec operation.
> 
> Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
> Signed-off-by: Wangao Wang <wangao.wang@oss.qualcomm.com>
> ---
>  drivers/media/platform/qcom/iris/iris_vpu_common.c | 9 ++++++++-
>  1 file changed, 8 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/media/platform/qcom/iris/iris_vpu_common.c b/drivers/media/platform/qcom/iris/iris_vpu_common.c
> index 548e5f1727fdb7543f76a1871f17257fa2360733..281b1f54cb962dedbfb0ec96ed3a5aab99b50eb8 100644
> --- a/drivers/media/platform/qcom/iris/iris_vpu_common.c
> +++ b/drivers/media/platform/qcom/iris/iris_vpu_common.c
> @@ -224,6 +224,7 @@ void iris_vpu_power_off_hw(struct iris_core *core)
>  {
>  	dev_pm_genpd_set_hwmode(core->pmdomain_tbl->pd_devs[IRIS_HW_POWER_DOMAIN], false);
>  	iris_disable_power_domains(core, core->pmdomain_tbl->pd_devs[IRIS_HW_POWER_DOMAIN]);
> +	iris_disable_unprepare_clock(core, IRIS_BSE_HW_CLK);
>  	iris_disable_unprepare_clock(core, IRIS_HW_AHB_CLK);
>  	iris_disable_unprepare_clock(core, IRIS_HW_CLK);
>  }
> @@ -292,12 +293,18 @@ int iris_vpu_power_on_hw(struct iris_core *core)
>  	if (ret && ret != -ENOENT)
>  		goto err_disable_hw_clock;
>  
> +	ret = iris_prepare_enable_clock(core, IRIS_BSE_HW_CLK);
> +	if (ret && ret != -ENOENT)
> +		goto err_disable_hw_ahb_clock;
> +
>  	ret = dev_pm_genpd_set_hwmode(core->pmdomain_tbl->pd_devs[IRIS_HW_POWER_DOMAIN], true);
>  	if (ret)
> -		goto err_disable_hw_ahb_clock;
> +		goto err_disable_bse_hw_clock;
>  
>  	return 0;
>  
> +err_disable_bse_hw_clock:
> +	iris_disable_unprepare_clock(core, IRIS_BSE_HW_CLK);
>  err_disable_hw_ahb_clock:
>  	iris_disable_unprepare_clock(core, IRIS_HW_AHB_CLK);
>  err_disable_hw_clock:
> 

Reviewed-by: Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>

Thanks,
Dikshita
