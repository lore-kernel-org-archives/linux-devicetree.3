Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D17202E06D2
	for <devicetree@vger.kernel.org>; Fri, 14 Aug 2026 06:35:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786689335; cv=none; b=oRq6cGCqHmLZafSdy4Cg/HbdJutRimgoyndY7ea+5h1ZgReCvVb5h25d3zOuuHs3Boe52oCddQQNvtPioiwhrFtHBXrK3wWtExPlT/JFfujpDTO1dTFnQaHAwOvFngjWySsiGVQIPOjka6/cnUXp0vLo1YrsxDwC+tiHmveGeNE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786689335; c=relaxed/simple;
	bh=OFsEBoJpPI79JybMuQD9SmyuOCPr75edl9kgdSThyGA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=BgOylZRklOkiKpl/1GZ5spmxmXAkBWqcLoDqq1RsYvrvQ+P4XN6y87K1qFYlRkehyt/bmZLDItaeP+rWSyRGcqo/RscsRGUqrBAzEC0FophNTrdlJ4+hwtDcjwIU79tVPvowdcoaLKtAOFiOPffNZsWlrJLecQ533EBpxD6Dexs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=NvxLPHBo; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=OtLzfNuI; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="NvxLPHBo";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="OtLzfNuI"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67E4QYU6979898
	for <devicetree@vger.kernel.org>; Fri, 14 Aug 2026 06:35:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Q62LA/TLjmvPWhJyTRg3Jbr4r61LixtTZckidFb0VyQ=; b=NvxLPHBoNRwOUIXz
	m8ef2WVoREGLPeuJt6rQrAmTWoSGUJlMZeOkNbbf3iBguR7qMAFowZnc8Y46v/P4
	OTFSExoR/QowA2YXD8x4mj+QqBVg78YX94fVSRpGR85XAXlJL+yUb9L5DaFcQQ04
	OXxU//SBBsIPbwMExkFHtxQAdZSHiFP6syzG5iweVpxZ9zAbeEWTPe0R6j8JrtLx
	CfH6sUhQ+0yYUJQ0xQlCM8pmcEzNJfIaKhRgEe2y2eBEXnNAyrojUtkUHKCp2Gcl
	u++NIftyhrKaVpwDEUgAD+0qhc0a5PsGefXGA2VN/Pt+XMvSJCeLSWcw+uNA9NeX
	l9Lggg==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g1pea1gxf-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Fri, 14 Aug 2026 06:35:32 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2cd01a14e81so10651605ad.1
        for <devicetree@vger.kernel.org>; Thu, 13 Aug 2026 23:35:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1786689331; x=1787294131; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Q62LA/TLjmvPWhJyTRg3Jbr4r61LixtTZckidFb0VyQ=;
        b=OtLzfNuIawu6DHT+8l2aB3Xm8aojtweq1Xd1zGgT/EfLTf80PoPGOH9O/PCze4S2jk
         P5xkAbUq9kx7wQeWf5xTNdluhuZAnz+wOYZR86V8R8v9rFHHtii1XsL5TQ5fwkktipU4
         MDN+Y2z5NNEFL2QkaSKGocWzlN6hBeFOC/7Ij/dp8g+n/YEY49aOUelLWD0cV5iIdLdW
         Sm32jXEGJC7Rpom3DqLGEfV6yDGBgj/NT+f1EZw9iAs4fTMYAhixdCGCF6j5Jq9DXFMf
         SaAgDoJULnJ8ED/C2QPfekkBv7Z2PYq6DblHFYvY7Rez1V+UHf2jwAlzbVUsd1IaRJoU
         GseA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786689331; x=1787294131;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Q62LA/TLjmvPWhJyTRg3Jbr4r61LixtTZckidFb0VyQ=;
        b=bMNAVQph1jC+jaRBsT+u79whTmFr4rg1d77mwlUrz02TFdB6i4qswNvF+7paR3VVt6
         r0Buj/Cd2C62XIy3sJ0tvSZ0o53clO/6hUET11z6Y4dehAsG4n/WAIR28YiE9UL80EfM
         13G0VKRLJZ+z6IIRGxlCcPxxG1qFUhsKU0PR7lIR5KfYbC4jqHTCrWm83B6D3ZojC818
         w+bHWlhYfHSNtJhljh6gi6FoN2zQ1D0gB3GaAqRfuDQvoLVBVTulnCmMI3ZBMLlDjGSF
         20xVsSKsam2vinvsdGmEY/iEpqu3Ek6S6sOtyNM+nTfJZWz6OD0GMMA1BmwyDg81UQfJ
         t2Og==
X-Forwarded-Encrypted: i=1; AHgh+Rq1dTJKvg93m2NkIjTBUNPSUmcUawonzVuOwg6hE5e49Rw7lXzy9mo4AwZ80rlouh4tnuQDE/HZq884@vger.kernel.org
X-Gm-Message-State: AOJu0YxYLbals+gBg9sMbsRIVTL8FOAXHAVMcSO4kiHVGy7aGUKAs8KN
	sofgxZt28eVmAbpsrvYTGXty5wwlp9OQHHF425b5Oyak7HAVdM8rU2Qm0pm3xuVdVHM8MThFh73
	MJM/il1D0QuLZE4ki+tQxifCS2vCXcJDd+PlbKma3eo0X8Y7I2wpuP74qlxaOMtqQRNAZxQZD
X-Gm-Gg: AR+sD12+IEQ4TAE0+qPtdCEJaOJLn9lJMVOEBXK6RfhrfcFHDEJ+MzobttB1B13jVUO
	QsVCabdJFijvGcC3xciTwJfm3XQF2HrUQh+8+/87Z9mYeM4nNENKD5ejYOrwVLbEF2vxFJi0YKh
	6H9eOzuxVftfMa1iEkc4SNzi0B8cNvKM4vdAT8aL1gj0jy9xWxc9cwy7mh0iwUvdLmdMfJ2LkT2
	aOfrFEmMqqG60Hjx/4W2DgBy46NOEOCroUvDb5sODxSypoow9u7wGgwBx+eSNTldLSuETsawh5f
	SbFeek/ZcfHPI210yPBsR4zY/KAF6j9wHt3Txe+s/YuDzF7RWKvgbb6JaxQGr0cz4eoFVosgYMu
	HQPNdbyFa1i1zIT+CcDyXeJpbb6I=
X-Received: by 2002:a17:902:e742:b0:2c9:cf62:6f61 with SMTP id d9443c01a7336-2d3b0f3f6b0mr34316655ad.17.1786689331402;
        Thu, 13 Aug 2026 23:35:31 -0700 (PDT)
X-Received: by 2002:a17:902:e742:b0:2c9:cf62:6f61 with SMTP id d9443c01a7336-2d3b0f3f6b0mr34316175ad.17.1786689330925;
        Thu, 13 Aug 2026 23:35:30 -0700 (PDT)
Received: from [10.216.43.17] ([202.46.23.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2d3aebc81a6sm5222685ad.72.2026.08.13.23.35.26
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 13 Aug 2026 23:35:30 -0700 (PDT)
Message-ID: <b8c9b2e7-87ea-47d6-b01b-b773ebd7882b@oss.qualcomm.com>
Date: Fri, 14 Aug 2026 12:05:24 +0530
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH V1] dt-bindings: phy: qcom,sc8280xp-qmp-ufs-phy: Add QMP
 UFS PHY compatible for Maili
To: Jingyi Wang <jingyi.wang@oss.qualcomm.com>, vkoul@kernel.org,
        krzk+dt@kernel.org, robh@kernel.org, conor+dt@kernel.org
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, linux-phy@lists.infradead.org
References: <20260814004725.1368027-1-nitin.rawat@oss.qualcomm.com>
 <c37708f3-5043-4ad5-944e-64ceedeecad6@oss.qualcomm.com>
Content-Language: en-US
From: Nitin Rawat <nitin.rawat@oss.qualcomm.com>
In-Reply-To: <c37708f3-5043-4ad5-944e-64ceedeecad6@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=TbGmcxQh c=1 sm=1 tr=0 ts=6a7eb734 cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=j4ogTh8yFefVWWEFDRgCtg==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=EUspDBNiAAAA:8 a=ZzmLuljT6Y08Yp8wPLQA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=1OuFwYUASf3TG4hYMiVC:22
X-Proofpoint-GUID: gX-zINMxcc1N-dARw5rUd2nFRAoFZAnG
X-Proofpoint-ORIG-GUID: gX-zINMxcc1N-dARw5rUd2nFRAoFZAnG
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODE0MDA1MCBTYWx0ZWRfXwrfBS+v4hxdr
 zr8ieEMHPuaulK1PQRYfi58Kzx8M0QvC2+l8OTSF5juBhEOQsXzjPzGoHS5UPXcfDfrbvTAVwXs
 Jc9PmDW4ujqkvnjHwWL8LFea1MgZ6f1O8OMa93QUqULN97G34QZfIN4I5h7pdbtJVp/Zz1cbLI8
 5zBwtsLuK1G+ruHOT4+Z4nVzOac8GHFZDRZn0h98umnxd/zWRJ0NettfHw/CBs8x2aoHUCvpZc6
 Mz2gSpkPPmksHg39t7xrZ+wHcyTRqBc8cZu4Mb1yEwtcJmWIuWG8phngs+iqkqYa9xxT7HymOhi
 5Tt4RUeIvcEIpLz7WH+3AZw6F/oTEapBVlS+NV/J2Xcj8pNW518LbDEEz8yRmeZcLygGethk2Lu
 xeVNLhUaWKC09Dv48+D198hrznPIyxkEp3siLC6wsNTZ4Q8fzfQ7TeEafdsEeOU3LqudrlIS5eJ
 +ihQv23CfnxATJrM9cw==
X-Proofpoint-Spam-Info: AW1haW4tMjYwODE0MDA1MCBTYWx0ZWRfX6A0xbRgUWdy+
 gr1r7gr4rLRhztFdJZc51ywPuyAadpwf68absb8TmTo5YMaLd9tmfTm2qlhBSvQlclh61ff1bpq
 DBZ8cHAtRhv2++TfCwiQYrI2q4UOFsE=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-14_02,2026-08-12_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 spamscore=0 malwarescore=0 priorityscore=1501 bulkscore=0
 adultscore=0 suspectscore=0 impostorscore=0 lowpriorityscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608140050



On 8/14/2026 8:01 AM, Jingyi Wang wrote:
> 
> 
> On 8/14/2026 8:47 AM, Nitin Rawat wrote:
>> Document the QMP UFS PHY compatible for Qualcomm Maili to support
>> physical layer functionality for UFS found on the SoC. Use fallback to
>> indicate the compatibility of the QMP UFS PHY on the Maili with that on
>> the Hawi.
>>
>> Signed-off-by: Nitin Rawat <nitin.rawat@oss.qualcomm.com>
>> Signed-off-by: Jingyi Wang <jingyi.wang@oss.qualcomm.com>
>> ---
> 
> incorrect DCO chain, the last SoB should be same as the one who
> send the patch.

I'll fix in next Patchset.
Thanks
> 
> Thanks,
> Jingyi
> 
>>   .../devicetree/bindings/phy/qcom,sc8280xp-qmp-ufs-phy.yaml    | 4 ++++
>>   1 file changed, 4 insertions(+)
>>
>> diff --git a/Documentation/devicetree/bindings/phy/qcom,sc8280xp-qmp- 
>> ufs-phy.yaml b/Documentation/devicetree/bindings/phy/qcom,sc8280xp- 
>> qmp-ufs-phy.yaml
>> index 7e83cb3238ec..d94503fc26e7 100644
>> --- a/Documentation/devicetree/bindings/phy/qcom,sc8280xp-qmp-ufs- 
>> phy.yaml
>> +++ b/Documentation/devicetree/bindings/phy/qcom,sc8280xp-qmp-ufs- 
>> phy.yaml
>> @@ -16,6 +16,10 @@ description:
>>   properties:
>>     compatible:
>>       oneOf:
>> +      - items:
>> +          - enum:
>> +              - qcom,maili-qmp-ufs-phy
>> +          - const: qcom,hawi-qmp-ufs-phy
>>         - items:
>>             - enum:
>>                 - qcom,qcs8300-qmp-ufs-phy
>> -- 
>> 2.34.1
>>
> 

