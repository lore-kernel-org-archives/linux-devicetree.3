Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9CA4F4CA296
	for <devicetree@vger.kernel.org>; Thu,  3 Sep 2026 15:14:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788448474; cv=none; b=RsYNL5lepoR5WFGU3yUI1iYoLpI/S/GiVIDB74Cr7Ao3fPoNmrcAkj9DU3TbiTHKuK6SDkEas2jDvDqqiQp/K65cLW3KgzqFZd34cARC/3MbB6EcqlBR4c2O1QrsVqPBh+Dc0vlSKjbOiWo+dA0bjAym16C0mLbtYg+3vPF5DOU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788448474; c=relaxed/simple;
	bh=AiYQDdr1GA2GGgxtoSCbSmmY5cDjwiV95VNMSZnOgqY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=h8mM0R9Bo8mcEv/1DAc82xv2A2sw3hi/OwgQB3Oj7Ot588MAEfl3o52lt5WI+8E25pUsRC86QmcOfrhCN5GM6vlaDCnlc9swRe7MO/AlP1CDQHF51gTlJpJo9A3pqXkwZO5dxbXuaTB4SjlMd1xjrbx/oyCsl6AEZ8qxN5ZD/vo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=hLybQAxw; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=bwDacICr; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="hLybQAxw";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="bwDacICr"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 683DAkUC708044
	for <devicetree@vger.kernel.org>; Thu, 3 Sep 2026 15:14:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	J00Y5jbKG+LTIOozErGYVV5kDH4wOcI6n7Jz1ZNdUIc=; b=hLybQAxwHn+9hFwL
	fBStui1wKAaJMVUD6eb41AZTw02LAlzRN7xihyBI9X0HCwGRDS0PCWp5Ikuu85CK
	te2MVy3HFFaMRf81PRamfHht6gAs38VGRMVwP9/7lZICVAS6GCNgX2u7gRCbZORR
	2YkBM6zXMnWRAtGYswNuzzJhrf5Vo/nuaTSfhlxs5ANXBehb7HeBhdUh1m37ognf
	7/4AiH2a/aIoVgKLJbwvBe6qNQwmO9xfYTJlB5TNvCTNFAk2VrGTmGsD4qZ1bUij
	eEPORVT5CKagGKvlhIp9kcAwvotHq5RzYzyXFe018oxaCBJzskIuNJS5/DiUSew1
	UHLHlg==
Received: from mail-pg1-f197.google.com (mail-pg1-f197.google.com [209.85.215.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gf4ekhyej-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Thu, 03 Sep 2026 15:14:32 +0000 (GMT)
Received: by mail-pg1-f197.google.com with SMTP id 41be03b00d2f7-cc1eb205d31so19709a12.2
        for <devicetree@vger.kernel.org>; Thu, 03 Sep 2026 08:14:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788448471; x=1789053271; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=J00Y5jbKG+LTIOozErGYVV5kDH4wOcI6n7Jz1ZNdUIc=;
        b=bwDacICrtKVadZR++rd/YFsPcWXv8O27Xr9LUgAu0fG3EXC+7ywE8hYxbi7Tqx0tJH
         4SRXJS7TBTxqgA53osfFs8TIhVN0ks/oUmsUpJoHWZ9ZkttRyOk3PrFpzUVE4onaCKos
         RWn78hdzIRLsRiq/A8oF89HF1aAsmt35mtgKFeab6Wa4NrvLjr5Z0kkU+rObj4mnE4SA
         lZQgZV1TzBnaKOQMfQh22Mh1iP9B7mC3ANfCXojVtYGKVt+xKTbR57v9S19GcsPwey4P
         VQXwXGC7pjwCguxm2+anLhKpyO2Nle0/LCSj8yCbtIncGy1hgNktLydkY499sMrmJWiL
         UJJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788448471; x=1789053271;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=J00Y5jbKG+LTIOozErGYVV5kDH4wOcI6n7Jz1ZNdUIc=;
        b=oTimHNn1bFRBVZT4aQAUmY07LIy5oIe0xqkjqyJnosdMMAG2HbWB835tvkyCrNIsiM
         ihUvVdAneO6fviuNnNZdTLpXpEAcxrXUiCR3frycM9aOc7BIp2YNVLtj77m/BfO+ep1y
         MJ4iUqzD/QddrHtq8b2rq6MtLn/HflECnVs0vxQ6F9GBNWCUhkBOgcSEh1B0N2CxEFct
         pyT7AIZfpsn+ShQI1H1A8Ur2eQcy4kJf7Fj1ZPasNRQVD441yLrn8G9yT1/vEdPsnD3z
         RfBOq5MGwk3L0hkJapu8gV1Hby16eKg26CvGoekBhbUt7YcXNOvaxaxaz9OkTx1qndDB
         LDJA==
X-Forwarded-Encrypted: i=1; AKwUvBzwv4UD+TD667C48RhwP8QjXjaf88L7sDhoBgHNaEcT0jTNByteTAvCzT4vK1thMMtXpnFtY409yWFF@vger.kernel.org
X-Gm-Message-State: AFuF++mDyyz20LeB5RcD2DpXp88zdOg3BtgL+vHWxBKEK0sJFaml77wD
	YrDFhqX62WIzqQYBVA1QFAB69B76AclN5gUMUNqEeKFFpBoa+PvkxQWv/nYNGZocLwZY60vns7D
	m4UjZpeyT/011TwMCEN/vQtK0PBDKfswNQB42G6Ly2jIA+KfX7xA6x+auwWYNEEsr
X-Gm-Gg: AYBFou3djrJ2fI81wQ1H7tPajyg5SQ61PAb/5IeRLASCcd9fQGUJDsihyalR/nKMSRE
	hk2wlkhAtKJGFiKhKMlayYgZskYwK83E3i/vIyWaWePiUOH9XW4gClu9uqeBAOR9LGZUnHlQtCE
	KsKpwjVeQMuJlB2DEVRk9VW3aI0gbtwFCzbV2SlP09Co9YBUB+ZtNkT0vL0BP8neoJWIyM1WUqA
	ehcnh6YAeqLJUu4p6FoyuNhZKQwjYawdizc0F1Q+I4VeOJGyRywMCeWzfSbndNWzXOdowytmW9z
	SMISAxVl6snai/oI/QmMaIBMSDTV3LK+MAQPQ9SKWAmMoHV8kHtnBCSks5raluAi13cqT3Eh2dx
	/1mEg1jvPHCnFb7thX/lIdFAyOTfNt9MEz6LrexJ3RCojJU2XyE3Anb4ntw7EZXE=
X-Received: by 2002:a17:90b:4b0f:b0:38f:dec8:f7e9 with SMTP id 98e67ed59e1d1-39aee152d1cmr18587612a91.12.1788448471215;
        Thu, 03 Sep 2026 08:14:31 -0700 (PDT)
X-Received: by 2002:a17:90b:4b0f:b0:38f:dec8:f7e9 with SMTP id 98e67ed59e1d1-39aee152d1cmr18587536a91.12.1788448470695;
        Thu, 03 Sep 2026 08:14:30 -0700 (PDT)
Received: from [10.133.33.96] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39b083f04d1sm5864497a91.8.2026.09.03.08.14.26
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 03 Sep 2026 08:14:30 -0700 (PDT)
Message-ID: <7325c6a9-8e8d-48e0-b01a-68a287e7af5d@oss.qualcomm.com>
Date: Thu, 3 Sep 2026 23:14:24 +0800
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 05/12] clk: qcom: ipq-cmn-pll: Add NSS clock support
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd
 <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        quic_kkumarcs@quicinc.com, quic_linchen@quicinc.com,
        quic_leiwei@quicinc.com, quic_suruchia@quicinc.com
References: <20260814-qcom_ipq5210_cmnpll-v3-0-21c3db378611@oss.qualcomm.com>
 <20260814-qcom_ipq5210_cmnpll-v3-5-21c3db378611@oss.qualcomm.com>
 <9e6a0e54-d16c-4b8c-9034-1e682a420e7c@oss.qualcomm.com>
Content-Language: en-US
From: Jie Luo <jie.luo@oss.qualcomm.com>
In-Reply-To: <9e6a0e54-d16c-4b8c-9034-1e682a420e7c@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: yYsNUYF79NLke52mBAmwMJCsngkevykl
X-Proofpoint-GUID: yYsNUYF79NLke52mBAmwMJCsngkevykl
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTAzMDEzMiBTYWx0ZWRfX20iqlBeZLqPD
 m882hD68K65b40R3DEkAl584SzkZsDcfLrWctwG3qzlF8gHtpN9oJTOYFaPFE7NARsqQhEE9C2h
 GN8LfaCDoP5e9j5OPblCq5HyNO6cyNwzgj8FOkCUpYzdaEXZkOWF/RxQhLJB6oUAr9Qv3+BUCeu
 iKERRMDPiaQYJ+ILmBdd2oEsVoGk4uHZG+GQeoqeK7BF/3AJ/emuSwJcm7kta8ZnVGRsqD9LyQ9
 EAZhkQziOluXr8e5kmZt+tS0VNCCV66JEvkIhkZeqQRgR71Q9iYOi+Cgj5WzvhERXhOokrVhRPy
 h4dJcIcAmcX1pWGXFRzaSxTjBd0txMpRsyo9EEXZWyfu7hRrDthgyfm7XCRFF+AKYtqJpuBflSH
 t+rqpVaFsI0oDyS5E5FCV9hhYykVyxURmuXcS93uiaTrWWbK7si8bOSJ/N6u6z8krtuLFfF8sb9
 idHWhs2rOr6CYe2mSNg==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTAzMDEzMiBTYWx0ZWRfXy46AEardfe1z
 RXSMjQJV0WT7jcr2JFq2UitBa4qtzpCbhiMr5ufECmIxsSNIyVFCQlUGEPzZp0Eaun0xCXsdtDH
 YqPugFC6u+fzaXWl20HWcHOjBPbqwms=
X-Authority-Analysis: v=2.4 cv=PKc/P/qC c=1 sm=1 tr=0 ts=6a998ed8 cx=c_pps
 a=rz3CxIlbcmazkYymdCej/Q==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=EUspDBNiAAAA:8 a=OvnJboicBg_-wI3pKI4A:9 a=QEXdDO2ut3YA:10
 a=bFCP_H2QrGi7Okbo017w:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-03_04,2026-09-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 adultscore=0 bulkscore=0 clxscore=1015 phishscore=0
 suspectscore=0 priorityscore=1501 spamscore=0 impostorscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2609030132



On 9/3/2026 7:56 PM, Konrad Dybcio wrote:
> On 8/14/26 2:48 PM, Luo Jie wrote:
>> The NSS (network subsystem) clock's parent is cmn_pll_div2 (CMN PLL
>> rate / 2); it is then further divided by a configurable 6-bit divider.
>>
>> Register the NSS clock through a new ipq_cmn_pll_regmap_div_register()
>> helper, built as a plain struct clk_regmap_div instance instead of
>> hand-rolling recalc_rate/set_rate. The helper takes the register field
>> mask and clock name as parameters so that the upcoming PPE clock, which
>> shares the same register with a different field, can reuse it.
>>
>> Signed-off-by: Luo Jie <jie.luo@oss.qualcomm.com>
>> ---
> 
> [...]
> 
>> +static struct clk_hw *ipq_cmn_pll_regmap_div_register(struct platform_device *pdev,
>> +						      struct regmap *regmap,
>> +						      struct clk_hw *parent_hw,
>> +						      const char *name,
>> +						      u32 field_mask)
> 
> Since we're doing clk_regmap now, you can just use the clk/qcom/common.c
> infrastructure instead of NIH-ing it..
> 
> Konrad

Thanks for taking a look. To clarify, this helper is already built on
struct clk_regmap_div from clk-regmap-divider.h, using .ops =
&clk_regmap_div_ops; it does not implement its own recalc_rate or
set_rate operations.

The wrapper only derives the shift and width from field_mask and calls
devm_clk_register_regmap(). Since the NSS and PPE clocks use different
fields within the same register, this avoids duplicating the
registration boilerplate.

