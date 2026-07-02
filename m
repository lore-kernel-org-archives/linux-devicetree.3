Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AC74D2C0268
	for <devicetree@vger.kernel.org>; Thu,  2 Jul 2026 15:54:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783007654; cv=none; b=Fm6RVwARMVv7FI+JzgSLRKCbQE3eCW3jBZJsG52w/pvVrrC6pos+UXoduCYylpQZ1Z9cmw98SQknhBiQky6UCmUpcmcsXf4TRomWDjYX/KP1rzR6fEaxFWGegAT2KHH5iDq5pMp9zGDbGwc6xRTUtueIFob3GrwX0um67oKHQgA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783007654; c=relaxed/simple;
	bh=PGzJjQyVASOY296cJVlGrJNRwLME7uZqzZPl1eLmGjc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=NNSaySHI59I98uDfFy6uThjvAdcnNJta3I9cOIz7nPWI0sEB0DjJ7EEAZQ7gV26K87n5hl8sGC3JiL0LqjdI2vd00yPvT/pCGMImsXB63E5fUdY2LVGt1zp1jd8c8Jth2Kdc1wb1sLtM+9XelQ66PMIjK1UivHBBpsIrO4YjHKc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Mw2aa2ms; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=aanIRs7R; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Mw2aa2ms";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="aanIRs7R"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 662E3Sl2683740
	for <devicetree@vger.kernel.org>; Thu, 2 Jul 2026 15:54:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Q6x2cFE6unxjGxiwK8PfHeJpInWtKm5Zn24hzqi4dKk=; b=Mw2aa2msrY9PB3KR
	N9wAOvyqGE2xQzgyGNTRTOIlKOROsnyWxpvFQRyHqaqGVNuyaXUKHpTjvdYQogmp
	W+r1/ToinuV19jDmUkhCNgmbGjVtETUE88WGw4p52krmO49VOnYsLvI61+7KTW3o
	Bx2eVzDNJv2Lkf+EZ9V+kl9t7Nbm15qEXYnUY1CoUcbw2nuG2iqhN/iYbiiRDGTa
	ALCUU2VGmeh4oKr00BzgET9IG4vefrwC6WMbZYRKaRoImtPwX/8OnZoA/T0iRfG+
	B3ZbuduyEudcSVCjbvTjoNa9LH+d6AevQuoD7IGsX2RGPCVkYD4AB2am/FvWMeXt
	6S2OOQ==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f5mvwsqrt-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Thu, 02 Jul 2026 15:54:12 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-36d97955899so2887117a91.0
        for <devicetree@vger.kernel.org>; Thu, 02 Jul 2026 08:54:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783007652; x=1783612452; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Q6x2cFE6unxjGxiwK8PfHeJpInWtKm5Zn24hzqi4dKk=;
        b=aanIRs7RiJzNZXffBTGjD8S07JPYB7dra+nU8soqI2izEAoo98sUpanv+ZLTPSkKIg
         Wxaf1Py8cHbDm6obsjO0MZDm1ZY/24SNmqjc3Vh8nQAl8Hjs6lB4KEilIdHoTIYDSeXX
         fe0iW00EFZm3Zk27EvJvfNJ2lcCzJ7IIBIDK1wNyDvaZlexVIvOlF224dIPl5za23Wyg
         FXwMnMTfrZb3+f0o/p1hBs524DYtk3PX2w86FEVZweZY2GuNDum19WxDKYpq4Ahp2pS0
         owdoPXsTadhejADvzFbnLW/ChP4uR/IOUYlT6jblwpb3dP4SfLufNlJYyQSYwCfXC5TN
         TpTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783007652; x=1783612452;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Q6x2cFE6unxjGxiwK8PfHeJpInWtKm5Zn24hzqi4dKk=;
        b=N0y8joqEWnTRD76udlSiS5ulSN+uz6/OZ1+TTvX3QKw2mIt3HpY9Jp1rdEgWpzZiM2
         c5c2WzBTkZ7nVXHbM5UoEZahflaJglN+Yb05Ek+62uc0KB0Z4JRIWwjElTHkucM2qptT
         yiRHwYlyj4pKKz+EQiaB/uYsCPPZFZo3PRfeGqBNYCP/mFuLJYFSfLkL6hVqcJ6+akKZ
         1sm01KwB8855kzQj4efKTgAVF6JSVHt2wwjp++mDptb3BAUOSFMCYRgcB5M/vftWUZ3a
         Ly2l261Zrl2V215Sph+MRs3r6gBhrCZHI4m9u0y4RFIJRLRQQyFUGXrQDbf2aYlLp6R8
         1kMg==
X-Forwarded-Encrypted: i=1; AHgh+RoqPgAhwYrquy95c6u9/Cc9itrdcrFlFEjMSEI4fwIvBQdeWrvXQ4vXb3wxsTnMKmlykqT1WVCL8VS4@vger.kernel.org
X-Gm-Message-State: AOJu0YyaYcQehIAHVyK+OZWe3maBEeKVz7Nb502PR0Lr0JxRm4ssTg+J
	SuAqbWNZXUBLJxJJR2pIZtPv2N7OuSPkWzunGZT+PeNp46xsIUqGxjvBPjUMD/BE+tK2h4dRrEQ
	48otwgVX+92Lr/7m9pd9bQKCvmlShjWuL411mNmvlsrMrZGncfp4f008Vzu3xn6ZL
X-Gm-Gg: AfdE7clEi95ig2/p03oUtvY+V+aDyas2fKghNu9aG2jQMBytJQ4g1Pxz2dwe9if++cp
	VvHq4fixM/oSGlSJ2W/hmCbzqkd4ipTy9M9Z5mefitwhXPsFZ63zTPMJYKml+ADeXOXz/YqbOA4
	OlQHxTWVQf+fc1e5azsaUT7eag/5noAQF0tL99Sqt+vDeluHxGqWZDs+gRLv0nWFpmApj211kwM
	wQV5d2locGY0AUa45Ir2Jvjx/Sxins4hv4IgUvI3fTLozTcKoNZULv7iJ63dmvKflpVcg0z91mC
	VYf2FhutZe+BfG303AzJ78lSly7Su0wzykMIDLDPDWhqCN3umO3onx+FcN/oMtEY4rrMv02eoYp
	d893CLfpVK4bnqTlVwAy6QF17kPDaswoax3UWip/xf2F8yBKdAXd0Ek6QvjWbbj9h3YfW4e3PP6
	lGJA==
X-Received: by 2002:a17:902:eccc:b0:2bf:23c3:34ba with SMTP id d9443c01a7336-2ca7e756e2dmr67124825ad.28.1783007652391;
        Thu, 02 Jul 2026 08:54:12 -0700 (PDT)
X-Received: by 2002:a17:902:eccc:b0:2bf:23c3:34ba with SMTP id d9443c01a7336-2ca7e756e2dmr67124515ad.28.1783007651867;
        Thu, 02 Jul 2026 08:54:11 -0700 (PDT)
Received: from [192.168.1.7] ([122.177.240.71])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ca9a9fee7csm15691255ad.69.2026.07.02.08.54.06
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 02 Jul 2026 08:54:11 -0700 (PDT)
Message-ID: <b4527f73-1884-4a85-bf65-288309d040e6@oss.qualcomm.com>
Date: Thu, 2 Jul 2026 21:24:04 +0530
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 3/4] phy: qcom-qusb2: Add support for Shikra
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Neil Armstrong <neil.armstrong@linaro.org>, Vinod Koul
 <vkoul@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Xiangxu Yin <xiangxu.yin@oss.qualcomm.com>,
        Johan Hovold <johan+linaro@kernel.org>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Shawn Guo <shengchao.guo@oss.qualcomm.com>,
        Abel Vesa <abel.vesa@oss.qualcomm.com>,
        Wesley Cheng <wesley.cheng@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260701165051.4122259-1-krishna.kurapati@oss.qualcomm.com>
 <20260701165051.4122259-4-krishna.kurapati@oss.qualcomm.com>
 <ym4zec5vw2mudnvhw36w6vkuqupbl6up4dqmhk2sqeabphotsf@sudiy6poyjyx>
Content-Language: en-US
From: Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>
In-Reply-To: <ym4zec5vw2mudnvhw36w6vkuqupbl6up4dqmhk2sqeabphotsf@sudiy6poyjyx>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: Lpsb-_BLvRPBXAScDHiziUAMd6bBjKib
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzAyMDE2NyBTYWx0ZWRfX5JhsBoPFNJn5
 luO8LzJfFTiXucVTBeTmZsuOEsJGJM/wJG4V8s/9u74WSZsa9CYBSMwE7NolHQ7QaZknnp4zZ74
 TYXoSrPkY2oBQD00SfPcHBE/yrlOQtbj6YfwRcVIHRM1pFZ0zmN0lyJ4PRkrJ7yNl/Gq1bt7dU5
 5UGTaoqI1TgtC/+w0SCskb9MuvwydNa1CCminUb7p2ahkUWGkm9WjGZ61cu9dtt80kCW8S5KBbd
 8k65Tj+Zdvnd2pPD1C83mJdbs4lZCpLWJtLXq7UVIm/LJDxNHp9XkVohhr5gRS/NIXM0MrAOpW4
 4BLuZSyBpwGTvYXhPD1U7qLXdNF4LyECr+7aYOGNx+xm51XKkOPZqJ96+/eiWuQ4a2jsA4OcSrP
 ET28Q6lzbRpBEsOmYHR+EnqMMwVoxr4q2gIYafIIxHAHqHAhJ/2WjRUNysx6Xy5UgzdxJiW1lD5
 BddPR4m+YpPhJSsAgYg==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzAyMDE2NyBTYWx0ZWRfX0N03+O30ZUsp
 T6drhTMfRw6zHP9gtaX1/dbrlbO+4MdQzrUqYRK45Se8oBoBHV3KRv293tGTsO8IzhzyfU3/MUs
 P+bvSAvyBwq085eR3wTbmUqjwfkoEo8=
X-Authority-Analysis: v=2.4 cv=N+UZ0W9B c=1 sm=1 tr=0 ts=6a4689a5 cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=WwE2FERyN8QvVYJ+zedRYQ==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=EUspDBNiAAAA:8 a=FLyz3zfJLnz1irVRmH8A:9 a=QEXdDO2ut3YA:10
 a=rl5im9kqc5Lf4LNbBjHf:22
X-Proofpoint-ORIG-GUID: Lpsb-_BLvRPBXAScDHiziUAMd6bBjKib
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-07-02_02,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 lowpriorityscore=0 clxscore=1015 bulkscore=0 spamscore=0
 priorityscore=1501 phishscore=0 adultscore=0 malwarescore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607020167



On 7/2/2026 7:18 PM, Dmitry Baryshkov wrote:
> On Wed, Jul 01, 2026 at 10:20:50PM +0530, Krishna Kurapati wrote:
>> Add init sequence and phy configuration for Shikra.
>>
>> Signed-off-by: Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>
>> ---
>>   drivers/phy/qualcomm/phy-qcom-qusb2.c | 16 ++++++++++++++++
>>   1 file changed, 16 insertions(+)
>>
>> diff --git a/drivers/phy/qualcomm/phy-qcom-qusb2.c b/drivers/phy/qualcomm/phy-qcom-qusb2.c
>> index eb93015be841..ab7437e7b751 100644
>> --- a/drivers/phy/qualcomm/phy-qcom-qusb2.c
>> +++ b/drivers/phy/qualcomm/phy-qcom-qusb2.c
>> @@ -381,6 +381,19 @@ static const struct qusb2_phy_cfg sdm660_phy_cfg = {
>>   	.autoresume_en	 = BIT(3),
>>   };
>>   
>> +static const struct qusb2_phy_cfg shikra_phy_cfg = {
>> +	.tbl            = qcs615_init_tbl,
>> +	.tbl_num        = ARRAY_SIZE(qcs615_init_tbl),
>> +	.regs           = ipq6018_regs_layout,
> 
> msm8996_regs_layout (otherwise you are programming the wrong register).
> 

ACK. Will send v5 on top of your upcoming v2.

Regards,
Krishna,

>> +
>> +	.has_pll_test	= true,
>> +	.se_clk_scheme_default = true,
>> +	.disable_ctrl   = CLAMP_N_EN | FREEZIO_N | POWER_DOWN,
>> +	.mask_core_ready = PLL_LOCKED,
>> +	.autoresume_en   = BIT(3),
>> +	.update_tune1_with_efuse = false,
>> +};
>> +
>>   static const struct qusb2_phy_cfg sm6115_phy_cfg = {
>>   	.tbl		= sm6115_init_tbl,
>>   	.tbl_num	= ARRAY_SIZE(sm6115_init_tbl),
>> @@ -958,6 +971,9 @@ static const struct of_device_id qusb2_phy_of_match_table[] = {
>>   	}, {
>>   		.compatible	= "qcom,sdm660-qusb2-phy",
>>   		.data		= &sdm660_phy_cfg,
>> +	}, {
>> +		.compatible	= "qcom,shikra-qusb2-phy",
>> +		.data		= &shikra_phy_cfg,
>>   	}, {
>>   		.compatible	= "qcom,sm4250-qusb2-phy",
>>   		.data		= &sm6115_phy_cfg,
>> -- 
>> 2.34.1
>>
> 

