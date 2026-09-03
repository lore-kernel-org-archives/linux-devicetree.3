Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 225D53803D3
	for <devicetree@vger.kernel.org>; Thu,  3 Sep 2026 04:17:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788409052; cv=none; b=tUtWyJubJnUTKuALo+sI0Pv4o0QO/X+/u3f0RRutWQ3cvVp42Sy/EXR/0gKGnpUubD49i4EL/jkZ/v8QObmn5bJQR/17T+aRbTs+tlk/nx1awCWknYGsHwcZDp5Fyfb+PHoVb5uv/ldeYRYJ+Ca3M9E+pznd0p1QjAnvE57P27E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788409052; c=relaxed/simple;
	bh=AH/B7aaGDglCpKtBexb7Zxam2Ch3aRkT+fHsRoqeAAo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=rnwE//oeQnT6bKaIIwdsWsRwVRi3THvg8Iy2vTfC9/WYcqXooQMKfyH2udz/XrYhPmiu6YKxsjUOf5CcIHCZv+zfuNLUXU7vsmY5Zh6JmJryPy5g1RPQ1XwkBnif1KID/KUA0khbvCOxHh/hsWLuoodOhNptv2/Ip2a6U6ZyCUI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=nyD3NwZo; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=aY44XBQn; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="nyD3NwZo";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="aY44XBQn"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6834ExhO3598256
	for <devicetree@vger.kernel.org>; Thu, 3 Sep 2026 04:17:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	7JoLMalHCcWAtlkWjmylVYKVal5oLWlxA5VWlLObjmQ=; b=nyD3NwZo+WNY7Rda
	EqrUJPJ/W/QNeEA3EcYuDlQ5nsevih0iG2OXWpwSRm6AOaghlUTazOu/xplqjko4
	KTI0lQWenqdwUBcudNc8OyGxaCWaMmJjCHf+QdB6xu8J7XnX9floQxWhItbEsto7
	mEb6mlRnyvwLNv0UzGrMpAh8KWWT+XT+tv+MKoKgsZNVDonfKMfLP3dOyPGqDqzU
	YyUL94TAH7HB5hSPH9gRdwHGJVaIJP2fUazVr5K/rXLklyvbbACdsPzvNrLb7Be1
	hYOqfeAd1JTPjtCS5B7RKCFLV+0xaKz32r7UeXFZ1+EFQ7A+QOmInQTvdM2HFmuU
	KkmNng==
Received: from mail-pg1-f199.google.com (mail-pg1-f199.google.com [209.85.215.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gf1pyg08s-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Thu, 03 Sep 2026 04:17:23 +0000 (GMT)
Received: by mail-pg1-f199.google.com with SMTP id 41be03b00d2f7-cbb92868263so1650136a12.2
        for <devicetree@vger.kernel.org>; Wed, 02 Sep 2026 21:17:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788409043; x=1789013843; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=7JoLMalHCcWAtlkWjmylVYKVal5oLWlxA5VWlLObjmQ=;
        b=aY44XBQnFUsez6919ZCOIorntuJHQWgtAbUwENu1aiD52Q13N6rg809cflbIw+7YcL
         8CStpXS/10PQp6h6z0CKVdRNeDyp3oCxY9snCku5D0ceo6+vhb3ybkaSZq9/xNchRspu
         wa/+jLZ804j/mNcL2F2gnl/+iYAAG6KQC13ciMJxnqhNXgenvrV+wPjVdGZnFk+eVcbI
         CjCnudSyaiBIKyMVPb27qcWVTlCOScI/nOS8zR/ehhFL8lDmWiLHNvG7sw3+S9kbKur/
         ZO+D0ymGYNOiAm69xwQkmttJupn/wIynTs1x5Toypry/M66UxZTMVDWYQQUJHHZ6niBD
         cT3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788409043; x=1789013843;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=7JoLMalHCcWAtlkWjmylVYKVal5oLWlxA5VWlLObjmQ=;
        b=ZEZof0vAPvmXnWO7teT1xPm3g/yrviKKv83eFqzIO5DEgBwgGe/uiEAel30Cgxgv6D
         ATLvcKHkHd/TVgYI3xqSCiC3pSZBKYr7av+6TK8WiQrq396+2AQAk82mH02hJCB96XjJ
         LBYOwqAQ/QOt00rwvDOeWMmX2hCJ7mZcO5PAP4dQnA0LynvCWDnpjC3IG6krwjkm0tzl
         jVXk0CVRvp/15ltaJvY1z00iCE7b3ivRlKz96+U4gmmt4POqauGf7QXHZSDehTTvDsQ/
         kejjKkjN4SzW0cgKphvziz9GJoRUFNfv9uzrzRlDfJwzOY/3DsEv4P0r+isxQk9ajqEj
         cIdg==
X-Forwarded-Encrypted: i=1; AKwUvBxJbzn934lxc/AHIP2dNiygcAicJlUM3QP5go2kvukWxY+QI5RCV/zL7XEhs67o560aJ/81pmi19/HX@vger.kernel.org
X-Gm-Message-State: AFuF++n2WVOFomKFVaeClz5u6zKAMoqAkVxg7/j5TuCo3fnmNV03RPqQ
	4/8tDZ+q6/d53P3ltd0MvJbJV8X7EPcNq6h0VCKyRGH4i8l0tniHVyWM7sC3kmua02ml6q9ywo5
	hDOeg6fC7NIC46NZLAh0jCq+85+e+acOOXIm/d8MtOGsvwE8TkJRITXWdfSP59vy9
X-Gm-Gg: AYBFou3UrOg4M2W2CYz55gCu5iUg3olu1msvMYXV8QzfrmSz0gBnuCLttub/uNcKmgt
	yoBiMUpLT05YqxgVENJ6F6lUibui7bMjrUAahhLTP5WE7mWxeGDz2Hpsu+1tU4OmC1SG0tl7S/J
	NJ5A7YX0ZF3y8OiDlzKcEQOi2hTGqya974pz4NNnVA0wulE/x2/IvJJUmusjxMMZHeryEQHD+yv
	wExE5jZ4s8/fj1DyjG9jd/e7bTHnzxhTku0S17OehiKBUZdRAg/fj6aqsjHsAawoqKxztrotTD8
	8yKLM4wivpGr4dwYJlU74/LAo1Hn+HbkgeCL4WLNmaSMwU/nYD5dMCKhMyHujYbpvGSNTq4rqPT
	TGtju/Gt6qzaT4NEvKU6lMdjkU4HK+VhfvHGuDoCvUFkM4SsULH8zNXMmUl71pyytOI4beU6WNw
	ms/5NtrFDbqXIkRtcb3rDfJP5D
X-Received: by 2002:a17:902:d547:b0:2da:e68f:45b4 with SMTP id d9443c01a7336-2daec641a74mr137795045ad.8.1788409042878;
        Wed, 02 Sep 2026 21:17:22 -0700 (PDT)
X-Received: by 2002:a17:902:d547:b0:2da:e68f:45b4 with SMTP id d9443c01a7336-2daec641a74mr137794625ad.8.1788409042477;
        Wed, 02 Sep 2026 21:17:22 -0700 (PDT)
Received: from [10.79.117.104] (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-33253672941sm2601042eec.3.2026.09.02.21.17.18
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 02 Sep 2026 21:17:22 -0700 (PDT)
Message-ID: <7a73d847-ee43-4a8f-9149-2471230e3969@oss.qualcomm.com>
Date: Thu, 3 Sep 2026 09:47:16 +0530
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] arm64: dts: qcom: glymur: Fix missing SMMU stream IDs for
 ADSP
To: Bjorn Andersson <andersson@kernel.org>
Cc: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Sibi Sankar <sibi.sankar@oss.qualcomm.com>,
        Abel Vesa <abel.vesa@oss.qualcomm.com>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Sairamreddy Bojja <sairamreddy.bojja@oss.qualcomm.com>
References: <20260811-adsp-smmu-fix-v1-1-a596d284c455@oss.qualcomm.com>
 <40c85916-6694-4976-95be-6ce2a2f19732@oss.qualcomm.com>
 <6ae07fc4-fa79-4c05-9958-67154e850563@oss.qualcomm.com>
 <apWp5vxhRYozKQ7Q@baldur>
Content-Language: en-US
From: Iranna Mundaganur <iranna.mundaganur@oss.qualcomm.com>
In-Reply-To: <apWp5vxhRYozKQ7Q@baldur>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTAzMDAzNCBTYWx0ZWRfXwJIKTtnPrQhe
 D8bP320Z2gt1pcS9Vls/TDmu/184DJ/Y2wbKvM4IEE/HjXodKVwxSwCb+w9V9/8YH5r6Ou+JmwW
 ZP1l6lZe7CWIZVsJMDKTI0GQtuKL+nv06qGeKgSJ3WPeGIZmKuxIT+2qAk86A3+j5ELehBWJn0X
 LwQ1qe8gcLmlikrftStMK0++druybC9h7T1S4a7/71ShlQUN7N6lQVgEkBIV35XDjdQ76Yx76CE
 S8hHtgZ9LsURe3iyaNZo96c8YjSebeSC+jULkzN3wzJIShb+g91Y4dnAICPluS/33QRt3xdbpk2
 Nv2J9QYYHR0IuX9h22aKnPY11+WtQhREqrj/nJpqb80qldB4yqtrJ9jnr0zaap9BPFQ6zCH1wX9
 RBhqhRhBjeAU/bNIznJTNNik9XgrY7GIw1chpcKbYsgvplbL9+X721OkJrsLDV1yg9VkuOh+aed
 W9hO7hiSXokGYB/ERmg==
X-Proofpoint-ORIG-GUID: OfJHMyMRrKb46kW9ByTddk5-jBB66tiv
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTAzMDAzNCBTYWx0ZWRfX52y6m2nIR/RQ
 onqtR+JnSCRdoH/FsEnt8eYUTvyelarBU5uBvGt4/k5hiFXWT2nO6d6A2mxAcFzqWiyb09WxcSs
 VnvVYn0v0aHZmZRZp8nJ4Jk4za0ix8I=
X-Proofpoint-GUID: OfJHMyMRrKb46kW9ByTddk5-jBB66tiv
X-Authority-Analysis: v=2.4 cv=DMO/JSNb c=1 sm=1 tr=0 ts=6a98f4d3 cx=c_pps
 a=Oh5Dbbf/trHjhBongsHeRQ==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=EUspDBNiAAAA:8 a=xGGhxaKCOqPHMtdP6scA:9 a=QEXdDO2ut3YA:10
 a=_Vgx9l1VpLgwpw_dHYaR:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-03_01,2026-09-02_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 spamscore=0 bulkscore=0 priorityscore=1501 clxscore=1015
 lowpriorityscore=0 suspectscore=0 adultscore=0 impostorscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2609030034


On 31-08-2026 21:55, Bjorn Andersson wrote:
> On Fri, Aug 21, 2026 at 12:54:03PM +0530, Iranna Mundaganur wrote:
>> On 19-08-2026 17:16, Konrad Dybcio wrote:
>>> On 8/11/26 6:44 PM, Iranna Mundaganur wrote:
>>>> From: Sairamreddy Bojja <sairamreddy.bojja@oss.qualcomm.com>
>>>>
>>>> Add the missing SIDs for the LPASS eNPU masters to the ADSP
>>>> iommus list. These masters are exercised during audio record
>>>> use cases where Environmental Acoustic Intelligence (EAI)
>>>> models run on the eNPUs.
>>> Could you share a bit more details on how we can reproduce t his?
>> This use case is not enabled upstream yet, we validate it downstream with the
>> AudioReach application where EAI models run on eNPU0/eNPU1 and need memory
>> access from those masters.
>>
> Even more reason to provide a proper commit message, clearly describing
> the actual problem.

We are discussing this with the team and will get this fixed in the next re-spin.
Thanks for the review, Bjorn/Konard

Thanks,
Iranna

>
>>>> Currently all transactions from these eNPU masters will result
>>>> in global faults; fix them by adding the additional SIDs.
>>>>
>>>> Fixes: cd1d174c75f7 ("arm64: dts: qcom: glymur: Add ADSP and CDSP for Glymur SoC")
>>>> Signed-off-by: Sairamreddy Bojja <sairamreddy.bojja@oss.qualcomm.com>
>>>> Co-developed-by: Iranna Mundaganur <iranna.mundaganur@oss.qualcomm.com>
>>>> Signed-off-by: Iranna Mundaganur <iranna.mundaganur@oss.qualcomm.com>
>>>> ---
>>>>  arch/arm64/boot/dts/qcom/glymur.dtsi | 4 +++-
>>>>  1 file changed, 3 insertions(+), 1 deletion(-)
>>>>
>>>> diff --git a/arch/arm64/boot/dts/qcom/glymur.dtsi b/arch/arm64/boot/dts/qcom/glymur.dtsi
>>>> index f04058d2e089..6b06e0acbcf0 100644
>>>> --- a/arch/arm64/boot/dts/qcom/glymur.dtsi
>>>> +++ b/arch/arm64/boot/dts/qcom/glymur.dtsi
>>>> @@ -4084,7 +4084,9 @@ remoteproc_adsp: remoteproc@6800000 {
>>>>  			compatible = "qcom,glymur-adsp-pas", "qcom,sm8550-adsp-pas";
>>>>  			reg = <0x0 0x06800000 0x0 0x10000>;
>>>>  
>>>> -			iommus = <&apps_smmu 0x1000 0x0>;
>>>> +			iommus = <&apps_smmu 0x1000 0x0>,
>>>> +				 <&apps_smmu 0x1040 0x20>,
>>> The correct SID base is 0x1060 (although the mask makes them equivalent)
>> Yes, will fix this up in the next re-spin.
>>
>>>> +				 <&apps_smmu 0x1080 0x0>;
>>> This will bind the eNPU streams together with the ADSP firmware stream
>>> into a single iommu domain - is that your intent?
>> Yes, we've been told that these SIDs would need access to all the memory
>> regions ADSP firmware stream is given access to, so we want them grouped
>> into a single domain.
>>
>>
>> Thanks,
>> Iranna
>>
