Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C62D63B7767
	for <devicetree@vger.kernel.org>; Wed, 26 Aug 2026 11:12:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787742772; cv=none; b=jUouQHBGnPAHAVL6Mj8EP+z5nTRkIYG092rrsFhiPEU7SgLyHOhqb/2rhi9KYu0Bx/YRFaWdoPpnEfjC1SHQ1jUMryjNhB+dtsoPa87jbEtlrfckIwh30NfK0Ev7Dl0mk6v22+hDD8VjV6STjh2m87Gz5uoogWgM4WvQSr3WusQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787742772; c=relaxed/simple;
	bh=jW6RtFd35Seo6Qx9krbGEXE4lvO3sNbtoxrt4DdOfFQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=e3lNBGfe0eeGFvWGrrfJfgMWbZxH0eBM/UnEQIwUTwCkEpn/+/0Tkekf1e+r3cBbWXG5JXj/HHrdoBaKYzzIts1VV7FZ4EibX+tbCLpqYP3z1reKFKFoTG3/kZJqQ6VTJQ3LonD83enqNOg2qzNSH72XpMygbPaig+Eipg7JIFw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=gQTC4QwB; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=azE4/Cfu; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="gQTC4QwB";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="azE4/Cfu"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67QAH6N3425216
	for <devicetree@vger.kernel.org>; Wed, 26 Aug 2026 11:12:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	b4ZDYnGQeyt63uA5ruMPZWPKH8jP36BIfRW7bNO2VFY=; b=gQTC4QwBd2Rkq4Wp
	KItBfe4dCR5EpXFy7NyIbZpcXMV0pct5c9q0RfTb8XWE04GmQrwNzIas7vRRzuK9
	RrOmEZbZnc8D0VDkyfrMMEPJ8hg69o4SKdldp97gn9BKsZ9dc6jfUpRnI9qUZNeZ
	9sBCYsizMDPzPjtGEUUxuEV4c0f46Exg7tn1WCaCkOLIfXxtimrb/q7Oamy8YeHF
	CyT3HvuPdf8ElukrEfd7YUXcIxYPDkN59S5l+wz2bsPEp4aEEbDrZF6CuVMGiSlU
	EmyoluJ+CXlFzAHDDFfOFTOU4+cAOaYQCLUB5LraSfUmNES/sfZL65ICjVwQMowi
	Dbwk7Q==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g9fceujt4-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 26 Aug 2026 11:12:38 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2cc640dfde3so13380865ad.1
        for <devicetree@vger.kernel.org>; Wed, 26 Aug 2026 04:12:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1787742758; x=1788347558; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=b4ZDYnGQeyt63uA5ruMPZWPKH8jP36BIfRW7bNO2VFY=;
        b=azE4/Cfut6ut0OkRt3RxiRcw4f6pv8nDApPbUxXgeDTB18XF/jRxbFFSCI0VT9GCrB
         PbFu7dQTqS6KhfMVT9ybd9YTKqbCej+UDhXOj0gfnJIGcZrg7kOrz0QlEMzcXJrihjgP
         nDRwB8V0H7rIjHdoqwW5Ixx7v77oGtT+xnTrz0sacejDQ6tE7H0TQHduQcr7dbk11QEr
         FvFeRH+xMKqgRdRBpfFiarKeOGrqTE6GzZZvvaXT5nKpVFqrecGO06yUkI+10To/Pd2J
         HTBMqfDjFG1ET9Kw635qEW23xu4va67u2Gla6ic5RHGp2bMftka+vc6arVY+r5IMIjbk
         GSYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787742758; x=1788347558;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=b4ZDYnGQeyt63uA5ruMPZWPKH8jP36BIfRW7bNO2VFY=;
        b=DG00/6IdgcPeqR3WdLIOkkhkVrnuox45THrtZ9GI1X/dUCQ0tE8EinXHdVXuX2/iyy
         fzEmNqJMR1zQy7GF1vPOsoHNKG2CfHfYalkBnt81JdYGPWK11LUz5fC6RbxqIYHuUabr
         s17PmWyuQW4kXwDEknsjRkwxHUZwX/E4OkQC7fw/bnfww6A3+80AhoDV60mcWa/Udfj9
         TwWzyjeEilJxNuhxfkham7XKfEFDo/bgfHgEQleQgPrwyW2PY3zQ8MB88j1ziM7NZj5l
         oUnxgVay2NBh21r92Xk2ACcA3AlHKcoQM56WCno1nGPaBrZ1HnL9B38vhQE6iexAG9t9
         xOOw==
X-Forwarded-Encrypted: i=1; AHgh+Rq0/J5SHNbw9CsVNvoY5y0V/iHCNeCGYutin+1tvbfkichuMQQlq6ETz4ZjmSaqSkIlK0IofML+skDC@vger.kernel.org
X-Gm-Message-State: AFuF++nYlHW1syoBMVnf/H92R3nza8RYQ0BUSk12PVRI1Hj7ESGwlxgT
	uNh7aqjY5iK5NXSW3fL4dCj8AEELrxawC9SZhoETAeCmBKQhvLPN4eCPyCN9QYpxG8/f7AN+ziX
	ltg4X6BHh07bMLLN/6qp7dHHCPMh6ILYFI5pBA8H8IIDDwI3RQWb+JsIDLQ4Ac8N1
X-Gm-Gg: AR+sD12adEUOylhl1RJKEPCJFbJWghmynSykwsaAnfYSrG2gIxYi29jUPCJpCSNonkB
	XXJqYtyFHHlQUgGaMMMGSFicS3EMdMCoUD1/1hCUtibeAmY++h80TYVr8LGka2pyOodbmztkCSX
	M7IovrKdcb3gnj2t/U6Q9pIWJxD4RYB3pEVR73Dxj0SoUXdyhHKFY98+bOnpdeCFJUtIeS7sjNx
	lc9iU8d7kAzbM4dfGSZG7FyDMYzUsR8rbyRGbujd2dWNFoI6XGC+MYcqFtvjluoNmPHA26lYMIj
	J4Bn1qX05dhxcd5zAjy4P1qdFyZwOV1UZFBUv0vB2Vf6r36K8ckjlUb4dw14Ye5LtvsQa30OGdz
	h6ROP0HpRD+aD/0vmmRBaDEngALSNzhI=
X-Received: by 2002:a17:903:4b4b:b0:2d3:160b:c01f with SMTP id d9443c01a7336-2d707a8ebdfmr113295815ad.6.1787742757578;
        Wed, 26 Aug 2026 04:12:37 -0700 (PDT)
X-Received: by 2002:a17:903:4b4b:b0:2d3:160b:c01f with SMTP id d9443c01a7336-2d707a8ebdfmr113294385ad.6.1787742757091;
        Wed, 26 Aug 2026 04:12:37 -0700 (PDT)
Received: from [10.218.21.115] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3283d8861ecsm7609153eec.19.2026.08.26.04.12.33
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 26 Aug 2026 04:12:36 -0700 (PDT)
Message-ID: <4b7abc36-4ea4-4dc9-b462-299e50c41176@oss.qualcomm.com>
Date: Wed, 26 Aug 2026 16:42:32 +0530
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 1/2] arm64: dts: qcom: shikra: unreserve GPIOs 14-17
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260826-shikra-dtpm-v4-0-8476223184de@oss.qualcomm.com>
 <20260826-shikra-dtpm-v4-1-8476223184de@oss.qualcomm.com>
 <82fab943-2994-417c-929c-7c416386adbb@oss.qualcomm.com>
Content-Language: en-US
From: Khalid Faisal Ansari <khalid.ansari@oss.qualcomm.com>
In-Reply-To: <82fab943-2994-417c-929c-7c416386adbb@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=a8AAM0SF c=1 sm=1 tr=0 ts=6a8eca26 cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=EUspDBNiAAAA:8 a=s5PXVsNn40BVIwAtHE8A:9 a=QEXdDO2ut3YA:10
 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwODI2MDA5MyBTYWx0ZWRfXyLxby2fsZ4lR
 99XTRJmBHZtmaw39Dx/z69qT/XPi04q1FbPEtlzuYh1Rf3AzC0ez5wp8AQ028PI8wPhmkn37VUw
 s6mvyXpWDB9kQmQD+wVo3YRiRVlH0Eo=
X-Proofpoint-ORIG-GUID: uDdVLTg5f_X5Oqz8tGzJAATRUMaGfluO
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODI2MDA5MyBTYWx0ZWRfX1K6/y7V87p1b
 ookA8pTNHBoBcGyi6Dg+xkzX4/GMf0aQ6QKLbUrAo6OWhVKbOuPv8K3iSdNDPGGSqPJGWcxF735
 zGYFGQymc8ov6fwYPryp1p7t5qw4D2b1pdBYhUfqAYw3lgoo4IYZko3xig5NViXpOR4cjC5zpek
 eOLL46tMUFEiigihzpDr5hfEWvgfKy7k5pr1schdaX2Ogb31/j6FC1hDHMVfkaX7yfd38hDpVed
 HsEK5ihbRHpQtqwcdfpQeMWw+HPWIjorHbP6JV0iP+wSTr0eQH/tDJrrjfJ1DYuLwTnYczmpUW9
 lRVrWzSvVlQ0MP3TGoaJkYcdiCHAvzNmq2D+DbnnLRurfXXv7OgOw2i43zpDNOyVCpMJA7mAT/f
 2y82GfFgudpznODMDW3zQtA5ZGjEan4o7L9OPJfe7iAJg5Hw30CxfDt86FCzr6cAZIYAQhy8g3R
 dncndaE0IDl56o/c37g==
X-Proofpoint-GUID: uDdVLTg5f_X5Oqz8tGzJAATRUMaGfluO
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-26_03,2026-08-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 bulkscore=0 spamscore=0 lowpriorityscore=0 phishscore=0
 adultscore=0 impostorscore=0 clxscore=1015 suspectscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608260093



On 8/26/2026 2:41 PM, Konrad Dybcio wrote:
> On 8/25/26 9:13 PM, Khalid Faisal Ansari wrote:
>> GPIOs 14-17 were previously reserved in the tlmm gpio-reserved-ranges,
>> preventing Linux from accessing SPI5. Removing them from the reserved
>> list across all three Shikra EVK variants (CQM, CQS, IQS) enables it
>> for dTPM usecase.
>>
>> Signed-off-by: Khalid Faisal Ansari <khalid.ansari@oss.qualcomm.com>
>> ---
>>   arch/arm64/boot/dts/qcom/shikra-cqm-som.dtsi | 1 -
>>   arch/arm64/boot/dts/qcom/shikra-iqs-som.dtsi | 1 -
>>   2 files changed, 2 deletions(-)
>>
>> diff --git a/arch/arm64/boot/dts/qcom/shikra-cqm-som.dtsi b/arch/arm64/boot/dts/qcom/shikra-cqm-som.dtsi
>> index 8ac42ff625a0..fde7fc035bf5 100644
>> --- a/arch/arm64/boot/dts/qcom/shikra-cqm-som.dtsi
>> +++ b/arch/arm64/boot/dts/qcom/shikra-cqm-som.dtsi
>> @@ -197,7 +197,6 @@ pm4125_l22: l22 {
>>   
>>   &tlmm {
>>   	gpio-reserved-ranges = <6 4>, /* Fingerprint SPI */
>> -			       <14 4>, /* eSE SPI */
> Is this bus going to be concurrently accessed by TZ?
No.
>
> Konrad

