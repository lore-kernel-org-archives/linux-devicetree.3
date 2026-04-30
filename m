Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ADF3C3FE64D
	for <devicetree@vger.kernel.org>; Thu, 30 Apr 2026 08:40:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777538423; cv=none; b=GUHYZzi13eMGC/oqwNHf4J1PNgG2Qcr5keu9aShtJzdN98edUaZo7tQmBcooMR5MKOOpAf4nV9sh7NHtA/5vdZ/KZGtbmNTvD5Jqd8QKac32a9u6rlzgoPxUwPnQz59YpVbaMVNQn/eizWTkHmmPWTsQcZupzW9oCgOceRoaJDM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777538423; c=relaxed/simple;
	bh=B3RTdQVdT/TQMBR9Xv91ApyqkspQ8nfdAwtAMn8Gc00=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=JTk/0NGJCSWN7cr8QnUlWdNX4/kzpojvKcAIneA1vdqz+LeYc/NfuIP6YJfIxOnss9iy5tazvnbxFSsZ20ptgwdMzvAMkcDkB0a7fNL8bH5QLrKEgoxorWfduJW4nQTkn4hCK3Sga3rvARAM01VeVIxZxVxth2gdj9dLz6/QKcw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=oRtZSpi6; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=fRe7ktX9; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="oRtZSpi6";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="fRe7ktX9"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63U5nq193992793
	for <devicetree@vger.kernel.org>; Thu, 30 Apr 2026 08:40:21 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	KqTeQVb5il4BxWLnjLGKpxyBsOw+axckYHeHHInI9FY=; b=oRtZSpi6X51x0jtE
	lj+AGMxfn1+IqhM5nAXB8bPgIFSEspswIzjTogJUkYSoaizKsTquuKFObeiAnfp2
	vxg2hjULj5Dqcx2IWVW48oBC6fvFSOvQEuZUzX8pxfgOt9Ak1nCSk5Kb6cVH9/MW
	F9wqYoS4UF+bIkthl2X30CfmUENdi6AJ6duq2tFzyI6/VzdImvDCvGAdC4LMpa7b
	ye1EWI2QyWZ5R0xjfokwTVkaEAuInw2ixjf3kGMhzUweogGFKbWWsKcusF12MeLu
	hF83IOtr6Bn+i/mdZ+veGLesaAq/eQKOxwqOf9A6kn6IfM1F/uiOOYuoMDYZMx/X
	TqnZow==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4duhx940bh-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Thu, 30 Apr 2026 08:40:20 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2adef9d486bso6235015ad.2
        for <devicetree@vger.kernel.org>; Thu, 30 Apr 2026 01:40:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1777538420; x=1778143220; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=KqTeQVb5il4BxWLnjLGKpxyBsOw+axckYHeHHInI9FY=;
        b=fRe7ktX9eZq0eP+kTH1hhVMkHXdNwX9FBu8/uPZGgLZ7cYAtZfTbv5Q9zwhvkkuPKE
         30lWr7mMILhUSdjXVuWrF15e8FBKF14DxZu2hlE79RmpfoFAlaX1RK/0vOP3n+RosYgs
         rEb5fmp62TSMNZFBBAeq++4b9dZKaHHJaH6xeB47+IeBP3b1CvRFwehoRDvJ84R7UEdX
         iNukwMpp8aCTbZfl2aWa+9BbQ3i5ayT7e6712QlWPTAhtECTz6x1WUGZx4mDtYGthrA/
         boyZigK5Ut+kOVnBfUlC3rvrl1+V1qJGFLD575Y9Ms9HvjYrHszwgXfaZ3VNP+THcVVZ
         iAyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777538420; x=1778143220;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=KqTeQVb5il4BxWLnjLGKpxyBsOw+axckYHeHHInI9FY=;
        b=p7HVwUmB7s23WfFuaEEG/Vi3Cy1H45LRkp7BehZp9QNgSyB8kKYcIv6KoPUXCGE3Hm
         jnSR2Qre9tfTEtPiYe3zE53A9C9zhC5YGnbUzcAwlYuBCialoLeAsimv8cQHXBHbwaLE
         pbojyl+l8gvR2o7iw7MsrCX/+PACjddKgpXgQhiKbXCdcosCTqERAa0HHXGW9svZYTK6
         x18p51UTvcO0YbBwLLL9lbgLEHTkOxIERml1R2nLrojKgzGwg28u4l9S+8YwwWLs+B1W
         h8OjAVQ91HGaj3EDZE5Tl5wfv+r84O/3OTIIBpu/nJ3a4E7sHQuPIhlG8KZXiBRhHz2q
         x+Xg==
X-Forwarded-Encrypted: i=1; AFNElJ+QM/7GN7ZPkJ2QuZTXnhCLY+zrKNvpTQCJnGl/+nvNhmvC+LxrS9NUYM3pv1koRR8BVkQuFe8r+Aaf@vger.kernel.org
X-Gm-Message-State: AOJu0Yz2yxLRoHJrVTl9UElUz3L1Bz9iwwhYtntHG6Mn10wH1nOVrJMj
	PZvm2/+Enlo4/P+lPSq4qHKvodEizpJfiPS9yxj4iy+cJ/tgrPrG2y2DRQtAoCKtFRDvFijaVsQ
	7WHmnsn5Aeoa1cRXb0Aw6YhsWs2OEbmEp9frwHUgGhTKRbmgFyMRtt2d9OjrF7QaP
X-Gm-Gg: AeBDietM772m/mCBRFYBeoctsDUxTWZlW+mTL416mG61yWdsmPYft9H2+8v/Cmq1JQr
	yMjmdIqc4QK7fQhpTMfS6MNGdRqdarDA/p75+rNtuFo+I0eKy/my2cBNTACPglhYANgRksFUGji
	L/4MN8xP9gpoPrUJSZAsKQuIGfgGlZCiv/SQkVzUPE/FJDwKQju3RssHedQjkZKv1RCZLLHUhyJ
	scm5PQg1Jp3GMKDMTRPCIFUtO8K+EoABfRNVklYMVcwJDJzAGgIgTfRf61e6wY3N/29iyzRvJmY
	/c7P0LjzzWkq9/pgFTUAth9x7i2ECz6s7hP/McUd6pWkecOq4+MG3QCk3fSeCis5Lh0snVu0Sjt
	1vmhVdDH4aOlaPmu6tyq7lijnrVtVbm/6kxQgkR1T/VbrBBUhHxANU8JhOoE=
X-Received: by 2002:a17:902:c949:b0:2b0:5520:f497 with SMTP id d9443c01a7336-2b9a231ad36mr19136815ad.9.1777538420034;
        Thu, 30 Apr 2026 01:40:20 -0700 (PDT)
X-Received: by 2002:a17:902:c949:b0:2b0:5520:f497 with SMTP id d9443c01a7336-2b9a231ad36mr19136485ad.9.1777538419530;
        Thu, 30 Apr 2026 01:40:19 -0700 (PDT)
Received: from [10.218.5.114] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2b98893f132sm46236635ad.49.2026.04.30.01.40.14
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 30 Apr 2026 01:40:19 -0700 (PDT)
Message-ID: <2efc6a84-cbae-4460-a0f9-3712da8c33a7@oss.qualcomm.com>
Date: Thu, 30 Apr 2026 14:10:13 +0530
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 5/5] arm64: defconfig: Enable Qualcomm Shikra SoC Global
 clock controller
To: Krzysztof Kozlowski <krzk@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd
 <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Richard Cochran <richardcochran@gmail.com>
Cc: Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        netdev@vger.kernel.org
References: <20260429-shikra-gcc-rpmcc-clks-v1-0-c3cd77558b7a@oss.qualcomm.com>
 <20260429-shikra-gcc-rpmcc-clks-v1-5-c3cd77558b7a@oss.qualcomm.com>
 <6f76dd8a-2007-4012-980f-268076fff5ad@kernel.org>
Content-Language: en-US
From: Imran Shaik <imran.shaik@oss.qualcomm.com>
In-Reply-To: <6f76dd8a-2007-4012-980f-268076fff5ad@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDMwMDA4NCBTYWx0ZWRfX+clLGDFRc8/p
 c0ey0nP9uQlFtq7akY2+FNg5SH9KQNeFCqlw/8BGxou7XaB1U8jABczA6Q/vHiZHc4poW90XAYO
 kr1rsVCNpBgrHxrHGDvkcCsf7A8lGGVSQ7iCiVYB2w2VIcTsgzPwMOy49Z1pECy847dGqj8HPyv
 t3WQ3bX3NqnRn63iZHTdoYT6WmQQD19Xe8OqD+R0weVBYLIOQlVx7AytBIC61tpxi5BC3x179BQ
 BlhgDHYZ2bgGT7vVJzX3nNfXQKTNuHi1wc2WX5HWy/GSooQJysJHRrHSQpR4vYf/44IKIj4pmwg
 IwJkBR1Xd1ygsSJV1OtCoasiEnS5W5I6G3FzvMWZgYiGFOipKniMOr6FNngJQnLJR/tgsHcQGfc
 Vl0cG2F/FxqtLg8h47s5CLBoTqWrXOwjDdORmCE1hW+6p/yAn0qAjTOEcTSfaLAqHWfmWL+2FaY
 YHvuwM0MCitXJ48zXgw==
X-Proofpoint-ORIG-GUID: CV1j8urQazoColl5JEWWaU25MhHYTiXC
X-Authority-Analysis: v=2.4 cv=O5oJeh9W c=1 sm=1 tr=0 ts=69f31574 cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=EUspDBNiAAAA:8 a=FE2aYY5kXyuWuzusOicA:9 a=QEXdDO2ut3YA:10
 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-GUID: CV1j8urQazoColl5JEWWaU25MhHYTiXC
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-30_02,2026-04-28_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 clxscore=1015 adultscore=0 phishscore=0 suspectscore=0
 impostorscore=0 bulkscore=0 priorityscore=1501 lowpriorityscore=0
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2604200000
 definitions=main-2604300084



On 29-04-2026 08:02 pm, Krzysztof Kozlowski wrote:
> On 29/04/2026 12:51, Imran Shaik wrote:
>> Enable the Global clock controller driver on Qualcomm Shikra EVK board.
>>
>> Signed-off-by: Imran Shaik <imran.shaik@oss.qualcomm.com>
>> ---
>>   arch/arm64/configs/defconfig | 1 +
>>   1 file changed, 1 insertion(+)
>>
>> diff --git a/arch/arm64/configs/defconfig b/arch/arm64/configs/defconfig
>> index dd1ac01ee29bf631d517c38486f6896ffd82dcc9..13e04080b37160129ccd47b0148a64277b8e0e4c 100644
>> --- a/arch/arm64/configs/defconfig
>> +++ b/arch/arm64/configs/defconfig
>> @@ -1461,6 +1461,7 @@ CONFIG_CLK_IMX8QXP=y
>>   CONFIG_CLK_IMX8ULP=y
>>   CONFIG_CLK_IMX93=y
>>   CONFIG_CLK_IMX95_BLK_CTL=y
>> +CONFIG_CLK_SHIKRA_GCC=y
> 
> Beside some really odd order, this patch should not be needed.
> 

Sure, will drop this change, and update Kconfig accordingly.

Thanks,
Imran
