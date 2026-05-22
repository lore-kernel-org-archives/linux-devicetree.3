Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B543C3BFAD7
	for <devicetree@vger.kernel.org>; Fri, 22 May 2026 09:31:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779442287; cv=none; b=H+E+Dnck8x5WdsbdIwoSppI8zldHMSnwG+HmfCungtAsjkKO6jMjQaWcga2lW7w35w2+KvKzHHCL6IQVUKM8zPfxbQYeVyQ+9xfDA5dbxd3MjOb652Si2+NEUOAk8ZTt9kyL5cl2ERmmm7CvtjoDmJapMrxFtFAii6LK+LFenC4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779442287; c=relaxed/simple;
	bh=ReQQM/7igDEjQztdU+albgNOdhmDe20jo44TvforNaY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=pW/U+cxWK564RTh4XzDAmHZzvkq6IZD2Ebg6f6BF5Slh0ArdxBBj6xINnvLTIos3sEyL2JxLDea4J0f/WW/5Yw4CV3piZihYQ33dtdYQbJV72qz0U+68WIjbET7yZbAOCwcSQmQGEtIScB3eKP903rly5GJ2yFhdi8malZVdce4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=YHicWvgI; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=busEow4t; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="YHicWvgI";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="busEow4t"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64M6UYsO1959980
	for <devicetree@vger.kernel.org>; Fri, 22 May 2026 09:31:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	CmuyIiSD8BrtuoCQP+CAPpqrC+rs5hG3BsCae1P/mCs=; b=YHicWvgIi1t1p7dy
	a53VKRNrD/g7G30Spr4USby0aatZy/IbRFe86lZr31rcihEBfAhGBsSRRmeQ4I/0
	SgHEuUunAOE+sXrQO2oH6dFz+vkG4JzXFDQQYihTv8m8EczHzOKkvXArQhrIWC/K
	5IBg/PzZy/m0W5HYfV3LcNk/CBwvUO2+3EJFMqq1elHuVY9dMmMp8vjqoKHtyx3B
	rIdTEeMCrcAcw0u9xWXsagl0W4xJ8O9hiX+Lk816HvLR1WVElA2+M7sppAZoj9U6
	JEKE0PUXNER/UnrSTAcI1+dOF9IUgJfB1bZXVEPUWoNlnZsyqsogdoPSFrUJvFQN
	6DOXYA==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4eahxeruue-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Fri, 22 May 2026 09:31:24 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-36629e48023so6788137a91.2
        for <devicetree@vger.kernel.org>; Fri, 22 May 2026 02:31:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779442283; x=1780047083; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=CmuyIiSD8BrtuoCQP+CAPpqrC+rs5hG3BsCae1P/mCs=;
        b=busEow4too8KLMDLtIrekVpmW6IXdJMcI0BxOfmPL3EcDLj5zN6pYox11/fFP55Pq8
         FOtJ6p19sgRWARmuqCc6kU6lGpuQuRGxOLiIMyVqnu5HhMFqQOfGd/HkJtScF/Poahqg
         CO+etRpczQj0RAxCbQa9yuO1yIBdPQh0TaHo7lUWSEEVGHtBuf3UwuopIg1weBQzEJVk
         VCgEhzv05dMDg5nZGHHnE4tAIgMBVfVIX9hjAcWwaaRG8c26vx+/KZZtaS3CbEMMDSdf
         fq9L94MsAl8XDBSfZOGm0xbX77zdyOSqXnhw6EQ/umeok6w/84h90mtJH7Ub01CEoJ5q
         xV9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779442283; x=1780047083;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=CmuyIiSD8BrtuoCQP+CAPpqrC+rs5hG3BsCae1P/mCs=;
        b=NnQccUrVht7g6mIbP9YlFdREziN++i3EfkWUI+DFpAlwhKgLrmGpjXST8jjgehGl80
         +xfAzPRtL/h6mPHYAytMTgNkujjCmLYY87yJhQNBbKod/4yJPWJIs+MVoV9fatJerhfk
         5Q+XhVmrkz62Fncn7yyzAZcA3XNoLry0WPpeTjxLZdbHRWwYNLI5jZzlWPCg2MdhJPXF
         UhJv+md3yhyXoSn697ONsvlA+lNzeZmimjnidK+oGyfF8hLeZ4fDRRSk9O3JTC0zQJd4
         ZGShcFEOXFRLSN7gX9IqZf1u+6AP3hcTSHun4OgNQK/S5W+G+A+VhRR4KNGiowTm1iwZ
         7Cgw==
X-Forwarded-Encrypted: i=1; AFNElJ+u2wEdExN+XtyDHNcLFrRZPDZaulaHW7PtSHIIfjlRNZEMXQDSGQ58tXdB2tMdeJIJz1YDhSXOWLPO@vger.kernel.org
X-Gm-Message-State: AOJu0YzzmvPmanMf+nvvam7xR/NW/GZKbK2QglBnESYNl4RG3m4EdNhr
	A75sDm3yjQdP1lsG9RAbc66v//sNXbG5FT4QlCRkietlfKTR/k35DCdyyZ/lgePn9FVEzrke+Tm
	k8Ly1oFkkfvXiVigzzZc+SlWS/2Tj63oBaSWUR+f0636H+vS6fih8WNqlDJSUM5+R
X-Gm-Gg: Acq92OEbDo/t6oJb0gQxlXdFisF5c0jDCGOsuUB09pVAlixDZhUGnexJg9Vt1T+0GF7
	gMdzPFJDeF116mZuV9dIXxT0Uw6jDlhVkWwYa46UNGbB+VZ+qbk23MA+kwcuIXiOl89xWkWJCDY
	2sCaibiZK7+cDJf10/EW4eMg0WW/kC9qh3HC6/xe6PzGjUlRnZ4qaRPypNsUwVWvAImxZRXwBXz
	mjHrKcHjbLh8HdyeBR+uPVzyQHnlTTtSM6VvufKulJGOdeJErOasZb/4hDbYI5P0vzu0kcJ9/te
	Xtc+mGgbX+qkQjz0RNbZ9/WjYKyFkKE1iJCUfSOy0DC5Yog9JaDgmCc487Rhll5yZPRxMixB6ZT
	O/c7Ibo6ajJWTPOb4ciHQbbL4Oi5yumoIOmwndivTJNYFXsIndR1L5gLmlYUslxQJ
X-Received: by 2002:a17:90b:2584:b0:368:6159:980c with SMTP id 98e67ed59e1d1-36a676276b9mr2733226a91.20.1779442283324;
        Fri, 22 May 2026 02:31:23 -0700 (PDT)
X-Received: by 2002:a17:90b:2584:b0:368:6159:980c with SMTP id 98e67ed59e1d1-36a676276b9mr2733193a91.20.1779442282825;
        Fri, 22 May 2026 02:31:22 -0700 (PDT)
Received: from [10.92.193.94] ([202.46.23.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-36a6772f486sm936162a91.2.2026.05.22.02.31.17
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 22 May 2026 02:31:22 -0700 (PDT)
Message-ID: <5593d136-569e-4ba9-9a2f-e635125899aa@oss.qualcomm.com>
Date: Fri, 22 May 2026 15:01:16 +0530
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/4] PCI: qcom: Add Support for Eliza
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Vinod Koul <vkoul@kernel.org>, Neil Armstrong
 <neil.armstrong@linaro.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Lorenzo Pieralisi <lpieralisi@kernel.org>,
        =?UTF-8?Q?Krzysztof_Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
        Manivannan Sadhasivam <mani@kernel.org>,
        Bjorn Helgaas
 <bhelgaas@google.com>,
        Bjorn Andersson <andersson@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-phy@lists.infradead.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-pci@vger.kernel.org
References: <20260521-eliza-v1-0-97cdbe88389d@oss.qualcomm.com>
 <20260521-eliza-v1-3-97cdbe88389d@oss.qualcomm.com>
 <20260522-discerning-sympathetic-moth-daa9e7@quoll>
Content-Language: en-US
From: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
In-Reply-To: <20260522-discerning-sympathetic-moth-daa9e7@quoll>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTIyMDA5MyBTYWx0ZWRfXxzIUfmQoC+UX
 mDfnUeDMJw1KbRvktx7gdlzxsLOAMhMWsdU4gBDc0JNCTc1ROiBniu9Gk9Ax6TKF/QCOIcwXkjm
 Aw9sak38a6oR1pe29/tRRGv1rEj/WXkXo04bUah88yZt+QizWxIJEc8uwomAUz6nglEEwDp8bIS
 gNYSHskkTCGNn2R2ttV+ISiBpgmI9vBGJVu3ZDcCQBZeXAtQKI24IQyJ10a7ipI/8BDEJFPCCE/
 ESj5XvQ2avcbsQUwRS2UKerExBu6HU8AVQb3TlGF5Lr7es7voG4Nwprx/qnCH2zeYkK1yt1Scoh
 Q40msUpDEbX5dTLbCuIGdY0U/v79xxpxgCCWJf/Mhe29l1HZICXBh97LRBKqHf6r7AgdqjkBXyL
 fFTdlFJIrdkL+2eMQHLTf8pregUZd0yiD44oos1RVPsdvkB7fc/l1bDqY8tf8uetZizmzHP6bnM
 JwkEySrYvtqDU4hzl5A==
X-Proofpoint-GUID: kxFIl9EaCEf5_GyKtoeuyO_Dg6BECtNL
X-Proofpoint-ORIG-GUID: kxFIl9EaCEf5_GyKtoeuyO_Dg6BECtNL
X-Authority-Analysis: v=2.4 cv=ar2CzyZV c=1 sm=1 tr=0 ts=6a10226c cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=j4ogTh8yFefVWWEFDRgCtg==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=EUspDBNiAAAA:8 a=jbukJSVhv8iEu2CO0E0A:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=uKXjsCUrEbL0IQVhDsJ9:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-22_02,2026-05-18_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 bulkscore=0 spamscore=0 malwarescore=0 adultscore=0
 clxscore=1015 priorityscore=1501 phishscore=0 lowpriorityscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2605130000
 definitions=main-2605220093



On 5/22/2026 12:21 PM, Krzysztof Kozlowski wrote:
> On Thu, May 21, 2026 at 07:35:31PM +0530, Krishna Chaitanya Chundru wrote:
>> Add support for Eliza soc, which has two PCIe controllers capable
>> of 8GT/s X1 and 8GT/s X2, using the cfg_1_9_0 configuration.
>>
>> Signed-off-by: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
>> ---
>>  drivers/pci/controller/dwc/pcie-qcom.c | 1 +
>>  1 file changed, 1 insertion(+)
>>
>> diff --git a/drivers/pci/controller/dwc/pcie-qcom.c b/drivers/pci/controller/dwc/pcie-qcom.c
>> index af6bf5cce65b..40f0a5f247eb 100644
>> --- a/drivers/pci/controller/dwc/pcie-qcom.c
>> +++ b/drivers/pci/controller/dwc/pcie-qcom.c
>> @@ -2123,6 +2123,7 @@ static int qcom_pcie_resume_noirq(struct device *dev)
>>  static const struct of_device_id qcom_pcie_match[] = {
>>  	{ .compatible = "qcom,pcie-apq8064", .data = &cfg_2_1_0 },
>>  	{ .compatible = "qcom,pcie-apq8084", .data = &cfg_1_0_0 },
>> +	{ .compatible = "qcom,pcie-eliza", .data = &cfg_1_9_0 },
> So compatible with sm8550. Why isn't this explained in commit msg of
> the binding?
No, PCIe controller is not compatible with sm8550, we are just re using the boot
sequence used by the sm8550.
> Anyway, drop the change, pointless. Look how other devices handle this -
> do you see kaanapali here? No.
As we are going to use different dts schema for this controller we can't
really re-use
like how we have done in kaanapali case.  kaanpali is reusing sm8550 schema, where
this controller can't use sm8550 schema, as some clocks are different.

- Krishna Chaitanya.
>
> Best regards,
> Krzysztof
>

