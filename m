Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1A50F30D3F3
	for <devicetree@vger.kernel.org>; Mon, 15 Jun 2026 19:03:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781550222; cv=none; b=CILvtAf9WziJ1vkij285lG/j8APEMRwTNGa67jbsRjnxjMM0EbcWd0hwjNJebEnK3Kb0m+sQ6nt+gjKRR2LAwbGb/dmJTFfhethDRtzzcMkQ8shC04HD/Iionk8Dhv0G3KI6cE2Z+434pOHjWJrrLo3LubchryOTZRa7E4KAA04=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781550222; c=relaxed/simple;
	bh=OFp9ixkZywvv5M8yd51e17AcwX2Y+o88z3M+FRHLf9o=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=o7P38QZiESAev0dboX8r4x+xC9CkyrOqg6apCHwyglQ8gMUZnvzefW4132PfE51BRb+bJFpsbe/gLILLnpI1zgxJ8qoAdaKSofBdgqlVFX7dc5drTEIyiMvD6c5s3dDo4B3H9LiN/RvQKNgJDaPuwvx9al4C+vD+uwP64bq/BNo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=XUfEbeJK; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Rj7xjFEg; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="XUfEbeJK";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Rj7xjFEg"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65FIxCbB844348
	for <devicetree@vger.kernel.org>; Mon, 15 Jun 2026 19:03:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	9IDNg/6lzxX4ZC7/zodIna7Ej9yrMREtnvW0RLmjmfI=; b=XUfEbeJKwwDgiq9y
	C6wX75Jg6RdymT0T2OmFHhCVKdogBnW0AAahH/OcOeDfzn8WO9buPb/Zr8yqnhb6
	tX0G4Cjn8W1MJIIeY9s0kVNsg7QI5zGiKJSb0bEF1mku5HNXccEiTnn2rtoekZ0R
	3XfhaWrcVwSLa8llbrjLmHoHtvjMAGlnzEpEBm+zuMixD6B/6ybgZWRfQ38teW1h
	yDCdMAi4EunYi2upkeNZ5LcqtE3J1P67OwwbmgxnbOGVgLOR+F3MN+c18gGVgMY3
	86idZ1M7G4fgSLqu18BMn5qi8xHW5au6Z5l5/zaw1A8K8RH8S2ffgF67kAv0Gm/M
	Qwlc4A==
Received: from mail-dy1-f197.google.com (mail-dy1-f197.google.com [74.125.82.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4eter02faw-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 15 Jun 2026 19:03:39 +0000 (GMT)
Received: by mail-dy1-f197.google.com with SMTP id 5a478bee46e88-30761ab3483so669401eec.0
        for <devicetree@vger.kernel.org>; Mon, 15 Jun 2026 12:03:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781550219; x=1782155019; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=9IDNg/6lzxX4ZC7/zodIna7Ej9yrMREtnvW0RLmjmfI=;
        b=Rj7xjFEgZ/cyDoO2j8dFUcyneVLDUXxd5MsCRiMAXQradt1a7Q9Kx/ZOCb9OCM7bS8
         NXv+IlGHUlYGx8M/FnKwztWEfEjNEARo/5m06stnhRazfbYMcCqo7AtEByY1m2fgh7Is
         2GEnLgnsEXUlb93IlshwnqN5//GeyHwUBXRJ+G8JCo4a+tbLTotK1pT+xIpK88hIkSYn
         f83FuUhViZmS2fmL+iENIydV2aunkg5Lr+69+FyM4JH6QjPld3lg4ZwScBhVrnryrI9X
         Mok7hjI6g/FE/ymZ7PfxcdTBJLzlGlP79wb9TZBxk1QFCb33G+cCwkhC6e+WNgrCJXW1
         Cghw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781550219; x=1782155019;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=9IDNg/6lzxX4ZC7/zodIna7Ej9yrMREtnvW0RLmjmfI=;
        b=Cf6YvxXwD0gA/z2E78gF+5XTGXkUsYmYqtV1j2wf1KbRDDkbOxqOdIS8dmKoEvZ6wI
         H2E4/jzEtZNww5DES3Om59zWAqSpLcVqlBNEPc5abTn70JNzxu+jmwDn586O++fyPbPv
         eQxHUwuLdKXFPrWQQR1iQE1tT2OLJMrrK1lcjWgB3pKRavn7huFrEBw/U1j4Ki4kX/Jc
         IiUsT1sOGeFCGsfqbrwnrx9QbkiJegC6vgH0VxjS57nbsZbJXZMlDZZjMxFKSP1pIhJV
         Mcid5onODLdA8kt/i00sfnTmh8LElq9Or6Lxm71G4AS3OrZ1Z8oSkQ5AzGaRs1Is7W6l
         Ss/Q==
X-Forwarded-Encrypted: i=1; AFNElJ/7cSsWV6wWrnp/csC/wubz0sdneMk+R9gP68nAv70LNeMzmRylo5q2nnolrj8ORWm7kRIXcRZjgfbi@vger.kernel.org
X-Gm-Message-State: AOJu0YzCwvvc/BdKv8Qdk41NYw+PPYKQxNLlwXnjXclhf4lcSjwuY4IY
	0oVQbntAcUh0hdbPhX/aQgBtHe4I67eXQKH9Wil8nSeDaenr2jCJIS5M4dbsYvDSFpNbvA/xUkl
	QHKkhT1vqX0QyIUBmr+B4i8CMHMfDSktTXq8uiC00n2ix90YskXNF8bTCPUk8RhuB
X-Gm-Gg: Acq92OG6WUEKN8OLt3m21vuSmCDYAmeGk3rjs6T7/FnHXmhoQWquhV2OtSI+1KpfqxO
	/bLspDjTifeUOPphmg3GVLd0A6gVVsuRev1DUzFxnEyrxvcsMZsuRv7YLVXTRDfiswcO3XQVfP/
	M/SV96Bnu4OEwEG8OKVn1WEyCzTA0v7i5w8lkjAwUPNiHL2VqFzB/RsD+NIJrpqT/3rlLH4KeeN
	8xNNRxrtLd1G7cLA4tIOMjlpGfQtWUv/XrpPHz/gD4oCkJv6bBUoWNSUra9+8f4C3PVsJXcuRm4
	vU7RCrNydj/Wi8TVTrvHE9cMINN37NLJ8LnJgYwyenGIpsZK6Nf8MIqlCFpY8YzzZmLRuGlsOpo
	RbF0C16Mhl+cJx/PQgGzp9vEdOFt79yLhe4coZfPYNM/hTlzYacFOtvPAC40DP/a9YTL96c0fOi
	swCmP41KNPmJMCHw==
X-Received: by 2002:a05:7300:dc0a:b0:304:188d:d0b0 with SMTP id 5a478bee46e88-30ba5f65ea9mr345592eec.20.1781550218577;
        Mon, 15 Jun 2026 12:03:38 -0700 (PDT)
X-Received: by 2002:a05:7300:dc0a:b0:304:188d:d0b0 with SMTP id 5a478bee46e88-30ba5f65ea9mr345556eec.20.1781550218064;
        Mon, 15 Jun 2026 12:03:38 -0700 (PDT)
Received: from [192.168.1.7] ([122.177.240.180])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3081ea4f7a0sm14498431eec.24.2026.06.15.12.03.31
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 15 Jun 2026 12:03:37 -0700 (PDT)
Message-ID: <7c94cd53-af84-4766-9e7d-96f6462303b3@oss.qualcomm.com>
Date: Tue, 16 Jun 2026 00:33:29 +0530
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 4/4] phy: qcom: qmp-usbc: Add support for "phy" reset
 used on Shikra
To: Xiangxu Yin <xiangxu.yin@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Pratham Pratap <pratham.pratap@oss.qualcomm.com>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Vinod Koul <vkoul@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Johan Hovold <johan+linaro@kernel.org>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Abel Vesa <abel.vesa@oss.qualcomm.com>
References: <20260526184401.3959717-1-pratham.pratap@oss.qualcomm.com>
 <20260526184401.3959717-5-pratham.pratap@oss.qualcomm.com>
 <d2098b36-c514-44e8-99b9-2213c4d52752@oss.qualcomm.com>
Content-Language: en-US
From: Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>
In-Reply-To: <d2098b36-c514-44e8-99b9-2213c4d52752@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: 5Dr730R366YSp8vqHb9HfXNcjIr-17UH
X-Proofpoint-GUID: 5Dr730R366YSp8vqHb9HfXNcjIr-17UH
X-Authority-Analysis: v=2.4 cv=UPzt2ify c=1 sm=1 tr=0 ts=6a304c8b cx=c_pps
 a=Uww141gWH0fZj/3QKPojxA==:117 a=6oJ3Pe8WsobediNJCW6FeQ==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=EUspDBNiAAAA:8 a=d00akK6jzC0l7pe6fNoA:9 a=QEXdDO2ut3YA:10
 a=PxkB5W3o20Ba91AHUih5:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjE1MDIwMiBTYWx0ZWRfX+JZczOvAjXmu
 je+0kD1HA03gNZSMUKLj0RibLbyxJZylrN8EFoxsYy5gfv0N8uRoTFDNh9xSBDhEGhBdPoP3jTA
 3PKA/kHsDJ/LhkxpP8UJo4yhl9DqVLH3JPIDnoKcZa9+b0M191MXHM6anQW9tfSfNxGg5kZ/NDn
 MY9SnHZUK3RF6LRMKdYdDAwLEBaFu7dwBgmtUBOsp91fM3Gikf2y//ZK1Fmp2rHi+tmRufzsOku
 Uhz+hi+3trkHdFmHZpZDO5japJNZaMEGOLWru/gqu06ZXwvzMlQ+vH/JgDzMDnmN6tgd2fu7i4N
 gjfjXonZgJS66z0iH6VcBaYuuFjItrmAjLAyyFOIn0p1dqd0QChj5mO4z+AcQfvJJyJw7HZdfdN
 lGn4EhhPueeAAQSs5zp2NdN0oexuao0J6UkqAr8ZBQ1zfDw7fjqItMVfPw+qJQ7hVJXHgureg6/
 BZcYSGN7CGVmiCw+Oog==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjE1MDIwMiBTYWx0ZWRfX7yMBBG6KjQjE
 1K3hDaBvMzt7bHw9/0DwtUj/+i8C7LtEBQpNk4URdX3dqRuQWNdt7iFlHQZFWT6SFyIN6U0Vl2Y
 tco05OctiQPdehkh6qvNJgr8RVnn0Jw=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-15_05,2026-06-15_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 spamscore=0 bulkscore=0 lowpriorityscore=0 adultscore=0
 suspectscore=0 phishscore=0 priorityscore=1501 impostorscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606040000 definitions=main-2606150202



On 5/27/2026 11:57 AM, Xiangxu Yin wrote:
> 
> On 5/27/2026 2:44 AM, Pratham Pratap wrote:
>> From: Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>
>>
>> Shikra uses three resets (dp/ phy/ phy_phy). Add the extra "phy" reset
>> needed for operation of QMP Phy on Shikra.
>>
>> Signed-off-by: Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>
>> Signed-off-by: Pratham Pratap <pratham.pratap@oss.qualcomm.com>
>> ---
>>   drivers/phy/qualcomm/phy-qcom-qmp-usbc.c | 2 +-
>>   1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/drivers/phy/qualcomm/phy-qcom-qmp-usbc.c b/drivers/phy/qualcomm/phy-qcom-qmp-usbc.c
>> index c342479a3798..067e7f6e5642 100644
>> --- a/drivers/phy/qualcomm/phy-qcom-qmp-usbc.c
>> +++ b/drivers/phy/qualcomm/phy-qcom-qmp-usbc.c
>> @@ -513,7 +513,7 @@ static const char * const usb3phy_reset_l[] = {
>>   };
>>   
>>   static const char * const usb3dpphy_reset_l[] = {
>> -	"phy_phy", "dp_phy",
>> +	"phy_phy", "dp_phy", "phy",
>>   };
>>   
> 
> 
> usb3dpphy_reset_l is shared with qcs615_usb3dp_phy_cfg, but I didn't find any optional-reset handling in qmp_usbc_reset_init().
> talos.dtsi only defines two resets for qcom,qcs615-qmp-usb3-dp-phy, so adding "phy" here unconditionally will break probe on QCS615.
> Please create a separate reset list for Shikra instead.
> 
> 

ACK, will create a new match_data cfg for Shikra instead of reusing the 
talos one.

Regards,
Krishna,

>>   static const struct regulator_bulk_data qmp_phy_msm8998_vreg_l[] = {

