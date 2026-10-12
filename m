Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E71A43438BE
	for <devicetree@vger.kernel.org>; Mon, 12 Oct 2026 08:41:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791794494; cv=none; b=FAiVfTkBOr5N44uuKQ1S+Jzavf0T19kxn38Kv2oLbxsZM5gb7VVCjLXoOONrCE51gZTbhOi62ppW/hWxVP7WkB7hfTpn4TOCfe24ia2PrnwCISqYcd7uCrbmF/lUJTBik1fxwhhG9IbWuDOhtpQ/ZIZZUrq49NgCq5knfd72aZQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791794494; c=relaxed/simple;
	bh=vdcdDO5nlV4vLF43dgt89lpuCvAKX1DgVOfEI4o5kws=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=dVUQjme6yA2llkySLoQluAzuN1pS3pI9nVTUOJZaeCCJrpcEm4lmiMn4+y3Y3d58p9kLhYzid4JxtEWtrMd/iw09xxYLkp2Nrh9/e8f5+aGZf14UIP8KKLmxB7RneO/auKTMK3kZcG3c4m6oXeca1K2gD6l+TJKfz4IT720sqEQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=nQw2AwyX; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=hE25VxFc; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="nQw2AwyX";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="hE25VxFc"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69C8KmxW1439184
	for <devicetree@vger.kernel.org>; Mon, 12 Oct 2026 08:41:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	TfifKJ8I33eiXdf/klxs3GNNDvTmM8v6aZs6OA4HHNE=; b=nQw2AwyXi2To4/SM
	3h/eyfQ11FkCJcorbwJDfu1jgwgRpRJzRARwoWWK3bXEUOSVMPJc5CuADnhRLuLM
	tM4UHZrMFeUP1aYCcp4jmrNNCIMWxSGDbWj9nge9kiwPBIV3QUoydpbtBVbqxC59
	OZE7Tenhn1cNQ83btS53p3k0w8LiH5Q9hhUugykOpM8hpg4+3qmOIMxUg39FNW/5
	vpq3ga1qhtORFJ5OdaBthubl/sv+RY561v0/HqbsWZi0CpZEEG9EFSfjHKr/i5lD
	faXoXFe/cQGwx8IZVxP4bnzNiNuiVYN7/noKTZduHdkToBdVJ3KTL2y/KSBLs1jy
	LT0DOQ==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h8qtkh41b-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 12 Oct 2026 08:41:31 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-3ac0ae43900so297992a91.0
        for <devicetree@vger.kernel.org>; Mon, 12 Oct 2026 01:41:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791794491; x=1792399291; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=TfifKJ8I33eiXdf/klxs3GNNDvTmM8v6aZs6OA4HHNE=;
        b=hE25VxFczUnEbFbfHtn3rNrYJEKx6Gib+xGHKXa0U3BxNNyL7HzP+aKn7fMQyYLzfc
         hc/v672ZI6N3cqrCFk1RgmPyniDCX6Ssyt9quutvjISs4AsxgD8/5Ru9pPp9qXUo0ZlA
         CZA8X/hH/6imlIJO/yxGzbZoq9G+n8noXmi/C0O8JRvsa9iuXauEKhXggkwKKRx+FYgW
         bVvSeFuzqMXG8qRqC/Z+Ic4rqFLTbv8P/MxME/qPh9Jo9nxPNLKz/OtOglkPicu1IbwC
         iDpvdiotvG5Ocixkfo3omCE/RkvBfLTqZZA2SNbDpsh4q8R3tCsrTBO5uNfFM2FXTPya
         qzSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791794491; x=1792399291;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=TfifKJ8I33eiXdf/klxs3GNNDvTmM8v6aZs6OA4HHNE=;
        b=c88SIl6Xs/tV0Gfook/uwEdY6YfdJpyx5qGuA7UJagIHKUCzzMjefmxy+Cleg6Algw
         MXrN48KbDqMC/3OaUFmmjLgQQxeAL9LjqMvEI7XMle7K/31rKQxENzUhIj1p/9NW82b9
         zGl2CNkDe3XIzy0r22rGxkU161O3zkl7E6QeaUVe530MeFgMxZNgOoq3+7S5BMJ+Kj9a
         qsQZFdsQX71fUGG88ffraQifUI6xWpUYWU071d+uDMQEv9UvJJUcgq6ta5Qdhh/ogrL6
         9aSU29TXjKxldZqmVzgcxcxohNnPsDKQFY3Rt4YEU86k5p2/XBI07KDPrYKBpLIrfYZ0
         GkuA==
X-Forwarded-Encrypted: i=1; AKwUvBxrLnpcVPowUW3zb6r/HYk2AF65Px3A3GPDzHzSv0mk1SKvMHEPfP52QbB3Y/Tzfv6HI3FBkUMZ49ae@vger.kernel.org
X-Gm-Message-State: AFq9FYJ/sH6yP7FDgTGne6nY9qTr/99OC7ggqwVBpXRJ8FbnAzRXBF61
	Zga9tDICME22RvPhLsUyCYg/j74bZtnI2JEJyLHiISCM2aTWMPLcI9VoLn2O5aOUpoR2bod9SVe
	dJunKTczbKZyvaaKc2iaNl3JUDT0XM1+tyDMbxk5qr6H4Y4jnlhyYnwL76dBWbhj6
X-Gm-Gg: AYBFou1KbJHvihXdUXYJrpILAN/tJiVpX8v+oCxOJxNOYpgHXl6d57T6q1ycw1551N+
	0K2zKSWYj3B18Ia9ijt5P6cJJXceA1rIb/21vpWrKERkEsDeiEqP91nmyvbIxrXFLfC9LlGEl1S
	U3ECFVaYAn1bSdQ6JY1T470PIq0K+T9cpruvFTi4x9dwcJj/SLSW0mSTDXZxppR0hW0RsZqpDVT
	ceh59LGLgtvrlkt+iqaArv8HKRz6nFeoQcaemCuamdhhKYQSDYwUZJW1HWqH49j1dknrH0uGKZY
	xmA/sh+7aZRGfknb1mdOLM3d2ml3FwVqXKkmd0jaq7PZa3931ueK3tG7rA2S5gvn3Vh6Gm8dBrG
	5yst754fCXw29RTY3q+J0uISkYmPZT73EPu4GQEaXdxMPEs5DdyFjmoRv2xJN6I4g7rtLFA==
X-Received: by 2002:a17:90b:164b:b0:3a7:a6bc:9d58 with SMTP id 98e67ed59e1d1-3ab3af76821mr6800451a91.54.1791794490541;
        Mon, 12 Oct 2026 01:41:30 -0700 (PDT)
X-Received: by 2002:a17:90b:164b:b0:3a7:a6bc:9d58 with SMTP id 98e67ed59e1d1-3ab3af76821mr6800431a91.54.1791794490086;
        Mon, 12 Oct 2026 01:41:30 -0700 (PDT)
Received: from [10.133.33.27] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ab39238608sm16102673a91.17.2026.10.12.01.41.23
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 12 Oct 2026 01:41:29 -0700 (PDT)
Message-ID: <d61fe4a4-7101-472f-9202-404de9899ec4@oss.qualcomm.com>
Date: Mon, 12 Oct 2026 16:41:21 +0800
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 3/3] arm64: dts: qcom: Add INT2 GDSC to Kaanapali DPU
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar
 <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Krishna Manikandan <quic_mkrishn@quicinc.com>,
        Abel Vesa <abelvesa@kernel.org>,
        Yuanjie Yang
 <yuanjie.yang@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260915-msm_gdsc2-v2-0-9157237b8382@oss.qualcomm.com>
 <20260915-msm_gdsc2-v2-3-9157237b8382@oss.qualcomm.com>
 <epga5fcyf2d3esucs5ulht4s7ixwpwlb35iygz63aqeefruc2m@mwmmkaw2z5r2>
Content-Language: en-US
From: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
In-Reply-To: <epga5fcyf2d3esucs5ulht4s7ixwpwlb35iygz63aqeefruc2m@mwmmkaw2z5r2>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDEyMDAzNCBTYWx0ZWRfX559jTqIT1tzd
 jQTIbMe+xsZ/NldCQHChzy4FI/drsHeEm7nOdLqkAKTq8T6w3ZCFCR3XlzE9gOlwQWPfPsAlAIh
 5IZJzXmzNfdVhJGW4Zxa/LLv6PgI716Sax3Xrhz0QOmzAEZMmB5CTcERbwwTnmEo5Y19btsBbD3
 lyITD+EolVGXmUSQWYfzCo4RsEWaIoPeJno1XxFaQeNaTJ5TJ4YPHkWqzqyKwPxNFnGJFgf3gbR
 pYh0oRpZFcbHtlyTFSk2E39TINgzwD98oMXp9/9Jt0IMkrF+mbndELc3SZXbdfOspH1Tr/w2/9O
 4A1fi1gKxwTLRmhS3MraKfLplLOTCP7UQKmRWwZ20Lsc+4dMhmJ4zwaKbWzYPn2x/C21ovlPBhL
 sidkQKRsiblVkakSkYrEWQxtw/OrcjgHHox/eFhsg6rc0//kyAZmAc87tmaefFY8O1zLEVa//Ff
 Blb6uiiWfZrUfSM0keQ==
X-Authority-Analysis: v=2.4 cv=c8U+0h9l c=1 sm=1 tr=0 ts=6acc9d3b cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=EUspDBNiAAAA:8 a=qfM8fCPi6zIbc8DzE_UA:9 a=QEXdDO2ut3YA:10
 a=rl5im9kqc5Lf4LNbBjHf:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDEyMDAzNCBTYWx0ZWRfXyyLR76YcZJBY
 X9y/r1VfLYRWsyYJJ1hm+GsQI2ceQNdADooM50l6Xad1X5vJ0okmrZt3U6PB0OVUAvk1gjU9IZo
 Ff9VQwLoCDF3e3yK0cgIdlUe+fXAZX8=
X-Proofpoint-ORIG-GUID: T1Z8O5vD4VAKe26liHasf0m5WxzjuajW
X-Proofpoint-GUID: T1Z8O5vD4VAKe26liHasf0m5WxzjuajW
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-12_03,2026-10-09_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 adultscore=0 lowpriorityscore=0 bulkscore=0 malwarescore=0
 priorityscore=1501 spamscore=0 impostorscore=0 clxscore=1015 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610080000 definitions=main-2610120034



On 10/5/2026 9:06 AM, Dmitry Baryshkov wrote:
> On Tue, Sep 15, 2026 at 05:27:50PM +0800, Yongxing Mou wrote:
>> The INT2 GDSC on Kaanapali (SM8850) powers a subset of the DPU
>> source pipes (VIG2/VIG3/DMA5). Add it as a second power domain of
>> the display-controller (DPU) node, alongside the existing MMCX
>> performance-state power domain.
>>
>> The MDSS node's CORE_GDSC is unaffected, since it continues to power
>> the rest of the MDSS hardware on its own.
>>
>> Signed-off-by: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
>> ---
>>   arch/arm64/boot/dts/qcom/kaanapali.dtsi | 4 +++-
>>   1 file changed, 3 insertions(+), 1 deletion(-)
>>
>> diff --git a/arch/arm64/boot/dts/qcom/kaanapali.dtsi b/arch/arm64/boot/dts/qcom/kaanapali.dtsi
>> index ace19b8b12d7..b3e3cd1d311c 100644
>> --- a/arch/arm64/boot/dts/qcom/kaanapali.dtsi
>> +++ b/arch/arm64/boot/dts/qcom/kaanapali.dtsi
>> @@ -3619,7 +3619,9 @@ mdss_mdp: display-controller@9801000 {
>>   
>>   				operating-points-v2 = <&mdp_opp_table>;
>>   
>> -				power-domains = <&rpmhpd RPMHPD_MMCX>;
>> +				power-domains = <&rpmhpd RPMHPD_MMCX>,
> 
> Should it continue to be RPMHPD_MMCX or should it become
> DISP_CC_MDSS_CORE_GDSC?
> 
It should remain RPMHPD_MMCX, as this power domain is used by the DPU 
OPP table for performance-state voting.

DISP_CC_MDSS_CORE_GDSC remains attached to the parent MDSS device 
because it supplies hardware shared across the MDSS subsystem. Since the 
DPU is a child of MDSS, it inherits access to this power domain through 
the parent-child runtime PM hierarchy.

Only INT2 is attached directly to the DPU, as it exclusively powers a 
subset of the DPU source pipes.

>> +						<&dispcc DISP_CC_MDSS_CORE_INT2_GDSC>;
>> +				power-domain-names = "mmcx", "int2";
>>   
>>   				ports {
>>   					#address-cells = <1>;
>>
>> -- 
>> 2.43.0
>>
> 

