Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9888B3A2E25
	for <devicetree@vger.kernel.org>; Thu, 10 Sep 2026 04:26:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789014391; cv=none; b=jd8gMmwELurXKNaP7X9w4/YO4U4NAVMOvyoHnY4BhSHEF+wq5kv0gn6qyRMJWkvEDz6nEN7r5GeiayQZDktEDpz7TO13xAh1PwMNUJ+Q5zEHtJr1fJz+jN+e1iYyL/mYwQUokAstPfYDSxS/hXpKDB9WUvkut39+HMhatm3KmGg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789014391; c=relaxed/simple;
	bh=v0G2sJ1qQREPUV6XVlzPNbY0zKZQxynU/y68N+hdbIw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=LGGjtTEd7g+GbJzL+SNFglJLD6nmMvjRL40y7e9xesYL4++1ClDQC4c4trFlP0QnZoK/+RQmLb1aeCdh8E1vJNxHzdLtaEvk/9kI2vt0naMl6JjS8ZmdwBuN3VmTaPf/qcFEQsGuLSfStOmunhjNJNZNnq+kQ/7lnUQft3lAn3E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=RoH8TLsm; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=d+BGcxXi; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="RoH8TLsm";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="d+BGcxXi"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68A1lRAA4054740
	for <devicetree@vger.kernel.org>; Thu, 10 Sep 2026 04:26:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ZeOR4nXYfqSKHwdV3Tld3DkJPSD7Fac5r8vAEoZUvoQ=; b=RoH8TLsmpPeBhKbz
	KenHoPMWcuZie+A96yRMZF0EsBpdEOdO6g5yROT9FqsLnOmkR3OLsNbwtLCkr1rY
	qXoqaggKpPGg5zwIB+PRihdKxI/EP8ll1tbXWE/n2iPIW9B7Vq3nXfKeDaq5Y9sS
	UrPrprj0NxkwaRrYJ33pZ6X68qkyQ+tO/9UEVr+AFx3NimBk6YA04RN8z9OZlAEj
	6b0ZxIs+22DQuKsZsesDxa4snuJLjkWfkz0xEkH3xIhbn78edI/19pUVn5mdYMLJ
	jTtn9WXwrbvMBMW2S6jx0webm6xMxzKkk7qLgw5EWs/Q4LBvD7I27oZijPHIZ3OZ
	zK7eoQ==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gkcyg20bs-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Thu, 10 Sep 2026 04:26:28 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-38ea32e57e2so12565589a91.1
        for <devicetree@vger.kernel.org>; Wed, 09 Sep 2026 21:26:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789014387; x=1789619187; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ZeOR4nXYfqSKHwdV3Tld3DkJPSD7Fac5r8vAEoZUvoQ=;
        b=d+BGcxXipXKu0vQ5Hxc+PF1P7e0AzjPKi2ZZytK48MDo7wyWNYWSvIfSUhJGdXzf3/
         ESpvoYAADfuKIc25RTY7FvuFX1LDGKgyEAKAqBdRlZY8y02fTdGnvNpYuizylR+N0Slq
         7mwVjKhcYC51t1Dzy4k8AYdAgpC7jz/b9z2ppEpU3NReFwc6fQkgVjTL2sERFfBDgY2a
         NKovm4ERfXmAGB0KpiIDTdmr4Cy7KVNUPwkC3fmNlUaYqtr2tt/um12st2lospwmqVVy
         xQNC6BBvqlZ0tgt9loGtKVqFyLadn6knA5tqCaXhYBIjA4doJ1fGcMUCjhcM9DGgkTK4
         kEeQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789014387; x=1789619187;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ZeOR4nXYfqSKHwdV3Tld3DkJPSD7Fac5r8vAEoZUvoQ=;
        b=cl1ibUwhhHBi9kTcg5m5N89WGmPmqxU6QD8OlH1t2jgYry9mXL+C2zdVi72zBK6fE4
         IYQyl6+HQVVbghploxF6iqMhxNSLp3svD5n8ac04yDIp5T71QM0XqGXNyMqv7dPURzGN
         8aLMDcbKWwA7aKaKmD0ndDPFg2CPW486GAxnwlrT/kJfqub93GodcMtmZBGXGiJOx+da
         1pqni7aJI7eNrMUBh13Sl7o/GJxOojaITmHOTuaEEs+s1F54m43HZljQjyGs5HKfd6bn
         fBT+7PC7wAeAa6ap9uLuGEj+z+nsZ3Iagtr4PbFv6/fnvRQPW18QrmYIXmajoGPKHwcB
         DBcA==
X-Forwarded-Encrypted: i=1; AKwUvByRO2q15mUdw26Yx6IWtnYFuGqGWuGMlJfQDMPvmIwolSpDsm62/X6QUu7I8iqNKJr0Xc+ppd9CGBoK@vger.kernel.org
X-Gm-Message-State: AFuF++keG7uJRyBt22b3gvMvyhNu5SvhfCqXaarzbJauzGJtODH7dWF9
	CDQ3hAEVlyVzfX15mdD8AX4ctlM6gU5DfGiwSsPsUUWbfUAJATU2epGRAuwFYCmF79Nb4IEKy5W
	s+3ffErdlCT0Wx/nwdIPpYL5emWvcSRgFNWntPZICtM5MRhyD815MSBWjP9yqm5vQ
X-Gm-Gg: AYBFou0OoUa7TCwgb3sUXEdMk7Db35MPYUU+97gANm93vYmhckYjJxA0cG/X0PWLhg8
	XbCn8Rt/xFu42lNGGzROeCGJTO0hs4Z05UTPHmxx5S78sD4E5CO86tfXRhkyTxL1TiqtxIt9XF+
	TXHLh+vnYntSXI51WWxAMpOIbyqfjkshTVtZ0Bl5fFh2EiwA8ykt+L1kEJx+3VrJBtqVSacqgcJ
	NcYjPd0NIZei+YwwGemXv/bTzz5+GiYhGP7XfR5qfKwhMDugFlx2a0GCavAL1coINMEZkhFdhKw
	erZraoTQdpov191E5HwxlMHfHF0gSTQDFzNk4J8NOaQbUNzlb0O2OfwbyVfJJIelvNQkhgC2qc3
	KG+eAzXnB6YuCajsXv1xyS5DtIiH9t5LF404wv+KOfZSk/l5BfL6LXzjK
X-Received: by 2002:a17:90b:57d0:b0:395:4de0:b78f with SMTP id 98e67ed59e1d1-39b260d28eamr56622910a91.1.1789014387500;
        Wed, 09 Sep 2026 21:26:27 -0700 (PDT)
X-Received: by 2002:a17:90b:57d0:b0:395:4de0:b78f with SMTP id 98e67ed59e1d1-39b260d28eamr56622844a91.1.1789014387057;
        Wed, 09 Sep 2026 21:26:27 -0700 (PDT)
Received: from [10.133.33.71] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39d7e77b1afsm1797507a91.5.2026.09.09.21.26.23
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 09 Sep 2026 21:26:26 -0700 (PDT)
Message-ID: <ff7a5250-d026-45ba-866b-f92302e3c87d@oss.qualcomm.com>
Date: Thu, 10 Sep 2026 12:26:21 +0800
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 2/3] dt-bindings: remoteproc: qcom,sm8550-pas: make
 qcom,hawi-cdsp-pas standalone
To: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Manivannan Sadhasivam <mani@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
References: <20260909105049.1317985-1-mukesh.ojha@oss.qualcomm.com>
 <20260909105049.1317985-3-mukesh.ojha@oss.qualcomm.com>
Content-Language: en-US
From: Yijie Yang <yijie.yang@oss.qualcomm.com>
In-Reply-To: <20260909105049.1317985-3-mukesh.ojha@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=YZYodARf c=1 sm=1 tr=0 ts=6aa23174 cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=EUspDBNiAAAA:8 a=EK-Lu_RZRIP6TketYm4A:9 a=QEXdDO2ut3YA:10
 a=mQ_c8vxmzFEMiUWkPHU9:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTEwMDA0NCBTYWx0ZWRfX+azwIIhcPkKM
 E98ghTnJVoNwMpsnOq52cgdUAZGOj2UHfC8ZFGKLFPXADYLI6u2XIzMtE30fLR0PEt22kPUUyRD
 471AJVEFaQXi2ElYwDeyERlA/BvY5fo=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTEwMDA0NCBTYWx0ZWRfX+hNDOQWufpSw
 76eLc22HxzTHjptOrQn5IjQGYyqRbRncKSpXioZTm9G9UtH70VXA17UdTPQXcGk1V0JQfxcQt1v
 9B0BNtlngwBZ90+QXtnHlsfFAQnkMB9aNKllo+JyrBxayAs801HZyovz/Sbv50rfW2MbihoKYJJ
 jbZdBgw0eP1a/VAVSqXzH4MtioQbGbinjeF4pknzzAy7R6bTSexpfSsaX144zctgKEQ30oqZ3z+
 pG+369UwWCnASuxj+uOu3TyNBSJ7JfY7BV7H8xZUD3GfXGJ/big44aNOUlgBUXlfTL880Yc1uE0
 Jr7Pq+JHMaOGFkG891q7sR7AH84fEblFMFPOtXX8CrYsVwruX51VcQVShiAM4N+0/4FI8ZSNU03
 ZOZHlnYFEGbzNjic5+XObGMNAv/+Deq/0CJT9ybjgSmYXu1d8xCcABXHE0trJeh3c09CIJBvvR1
 SaXvIUnnUqKOcLY1flg==
X-Proofpoint-GUID: _mwb4tz57uRiknEWLuFzxjvbBuXnMbaG
X-Proofpoint-ORIG-GUID: _mwb4tz57uRiknEWLuFzxjvbBuXnMbaG
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-10_01,2026-09-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 suspectscore=0 lowpriorityscore=0 impostorscore=0 adultscore=0
 bulkscore=0 phishscore=0 spamscore=0 clxscore=1015 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609100044

Maili faces the same issue, and I have verified that they share the same 
fix. Please bundle the Maili binding changes into the next version of 
this patch series.


On 9/9/2026 6:50 PM, Mukesh Ojha wrote:
> qcom,hawi-cdsp-pas was initially grouped as a fallback to
> qcom,sm8550-cdsp-pas on the assumption of hardware-level compatibility.
> Bringup revealed that the NSP proxy power domain on Hawi requires a
> specific RPMH performance level that the sm8550 driver data does not
> provide, breaking the compatibility contract the fallback string implies.
> 
> Remove qcom,hawi-cdsp-pas from the sm8550-cdsp-pas fallback items block,
> add it to the standalone compatible enum, and extend the existing
> cx/mxc/nsp power-domain constraint to cover it explicitly.
> 
> Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
> Signed-off-by: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
> ---
>   .../devicetree/bindings/remoteproc/qcom,sm8550-pas.yaml        | 3 ++-
>   1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/Documentation/devicetree/bindings/remoteproc/qcom,sm8550-pas.yaml b/Documentation/devicetree/bindings/remoteproc/qcom,sm8550-pas.yaml
> index c58e8a6c7fe1..cf57095cd49d 100644
> --- a/Documentation/devicetree/bindings/remoteproc/qcom,sm8550-pas.yaml
> +++ b/Documentation/devicetree/bindings/remoteproc/qcom,sm8550-pas.yaml
> @@ -18,6 +18,7 @@ properties:
>       oneOf:
>         - enum:
>             - qcom,eliza-cdsp-pas
> +          - qcom,hawi-cdsp-pas
>             - qcom,sdx75-mpss-pas
>             - qcom,sm8550-adsp-pas
>             - qcom,sm8550-cdsp-pas
> @@ -40,7 +41,6 @@ properties:
>         - items:
>             - enum:
>                 - qcom,glymur-cdsp-pas
> -              - qcom,hawi-cdsp-pas
>                 - qcom,kaanapali-cdsp-pas
>                 - qcom,maili-cdsp-pas
>             - const: qcom,sm8550-cdsp-pas
> @@ -273,6 +273,7 @@ allOf:
>           compatible:
>             contains:
>               enum:
> +              - qcom,hawi-cdsp-pas
>                 - qcom,sm8550-cdsp-pas
>                 - qcom,sm8650-cdsp-pas
>                 - qcom,x1e80100-cdsp-pas

-- 
Best Regards,
Yijie

