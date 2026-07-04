Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9BA3F395240
	for <devicetree@vger.kernel.org>; Sat,  4 Jul 2026 08:26:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783153611; cv=none; b=kgaBCAOmfy/MvFkAqQsYblrSh7z1pDAnHgLkIhcRixlPvLmcXq7aZ3bKyrKZskW4pUQP9aGOFxCXlC2m8gz1Xvi7UZ1iLcouShlB6MPga2yei6y2GkiGdr/3gWLohyAd5g0Ly7XxtvKCZjWRlH28T/hnVBgcHbpXwGWyvmMl4EM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783153611; c=relaxed/simple;
	bh=5pBxfx6NGzONIJ90pATmj6WKIeItmpcQu0YbmPEzucc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Yn4JrT6pxN83ltfxAFlBdAwFhz5WfFwdE+Cw0M5ztdd5ZfQNIBUMxMYQaWSxkjNYJxnZjIpiFZSnj3sTyK5AaYM0sJksncLD1NP7JMnMcqxn/MkTeBGQ3RW9dteJFIx0PS5bPd+HJOyG33ab/sadaO3O5rw5pevBnyCWFJHpOFU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ZemKFxjO; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=GsbSTZ+Q; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ZemKFxjO";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="GsbSTZ+Q"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6646hkbL2091644
	for <devicetree@vger.kernel.org>; Sat, 4 Jul 2026 08:26:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	D6CPp0iJudsU6L8wSjPuRWKqGYqr17Tm7EBF+oYdEIM=; b=ZemKFxjO6AcQKlK0
	SCLwmrUnKICDVi4LvF863+RK7x0XoghxqaAI+vd2UKkMfM9GjsDYhEANFCMJqxX+
	5oMN+94676A8gao4D90SiC+WYIVk89xLAjPVeS5Mm8xHd2bqvcRqjw5mX6H8FnFq
	C42TDsuFiT0ZkYYskPs1QdAhaqIh1ZDvPye+EbsB7C6yRGTT4xs3PeU2phxTapSh
	eNdsY7dbeU+C6yQwcCBXuagTTOszxPEVr1fcfbnnnvUgwUF1IF64iS67VDN2YqdE
	prxG8NZrZQvPmzrD+a8Ii9XmJnS58IfJzdX//+AWlJ4Z0a/wkAxtEnCeOQO90dUm
	muosbg==
Received: from mail-pg1-f197.google.com (mail-pg1-f197.google.com [209.85.215.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f6ubggbte-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Sat, 04 Jul 2026 08:26:46 +0000 (GMT)
Received: by mail-pg1-f197.google.com with SMTP id 41be03b00d2f7-c889d1eedcdso1973420a12.1
        for <devicetree@vger.kernel.org>; Sat, 04 Jul 2026 01:26:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783153606; x=1783758406; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=D6CPp0iJudsU6L8wSjPuRWKqGYqr17Tm7EBF+oYdEIM=;
        b=GsbSTZ+QuGrbBwJmdXFAMLrSvMdYwIJ5vjJEFo56YV5o0m2/TKEPcfo8H+6qIN41PW
         uMnC/Ql8LHxGVg+8/VoTjb5rQHYXr7rQrM1dNF2wrkzQNgYEBq2KFhk0q4fRfvHpjjab
         tJM2EHnkWFZpm9fM6xE4qNvWXoLdO45HiD39IYU9bw+brVFATrMZUgV0LTxGQNGNV5fv
         CzjDc6NcQ3Q+QpJAAWfKtWcfmMiq5qGG41Gc9/H/tBlsp+LiAy8F6w2Otkv6YjE4BX0X
         VivbgD/bfJAEtRmHHxe08GWa+uojfQbqTUpm/UwnqZ/8zkbWrwXaS+1vguyDA5fP3gVh
         7SMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783153606; x=1783758406;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=D6CPp0iJudsU6L8wSjPuRWKqGYqr17Tm7EBF+oYdEIM=;
        b=Y0HATbeSPcf9bzNjCfbg8BvLmB+ca8ZOIgD90KKey+8Bvu3pkzeqZUx3hI/vrIoy3d
         gjF8kE45Ayf9AxqVaH+WmosNmmZY3rV0sgy9sWikcgCL0GlBXqVqv0f/uhEn5bPo19cQ
         JmoX9PIb/6cqSAaVCMDfE4anqZ7hHY5HwAuaSvFLHEWC8qIWImtPmhURJlH9qaDoLWLX
         yovcA/4IBfpeTOQlgmPfSCqu3btN8znmbSf8Nq7yY9GgcyPhybt/jzQsl9M/BIDSfr5i
         cGxW1OqG7Ihan+auVzXDYLjnmgH89slUZ7ZX8btA0rCF+kIfXvbk6YOc3ann0uFR/gsp
         rzBQ==
X-Forwarded-Encrypted: i=1; AFNElJ9mSYfAw/kGccsqC639gZ7rv4n9bCz+hicxPzPgmmOZQAn+jkKI/0Y3miia4rv+/Az5cyMAAJUHLngp@vger.kernel.org
X-Gm-Message-State: AOJu0YwSjlTWX9rs3FKxdA/p7Elf48bPOkATPevJZvYtYQ5Vl+JasDkJ
	5h/SHgoflccoNYrjqGe8CpvF75HaR5GBoQ/J4F3Fap1y3JnCmI0ABwzCCKhR1wXXt4kAERFJGKS
	i2uPdegGEW0N4y4Qo4oJrNs5Lmf0bTXT4hE9eHphSgXoVNOImeNIm35baF3RGUuSX
X-Gm-Gg: AfdE7ckeCN/xLUnsPvRbhaH8dm+ePWFQcHpMSuQ+aTEjUJE5Be7T5KkxvplXTPkccJz
	Bp/3dQkv9xlNHcIO4aZbJxg0wl5Zia3k/cax2JLzumF4Jn91cRJO5s3rqLx6wWEDo1a/0eAn/hB
	z0IeaeNWL4ZJdSMJC5rWlsi7hkSjszHU+cfCbr3xmGgzS28FkOLrLMnsvhZ8XNdJTQRSQg+tY7m
	/6KziETPJn3mdVf9tPJt72MXnoRlbVRzF44x1OceDnt8WhO6fsJh8rS3lv3QS5zntQ1xTp2rIUk
	DfVuHGQgWTNzz5cbHdkQT+BxO5iZQklebzbFQRzF/yPJVV61GqdPVBQPgEvmVEKuZBIDwYvtn//
	p5+BeZuEOxtOondwNOSEcmRxXU+RuSb0c+6CMutZmA6g=
X-Received: by 2002:a05:6a21:3294:b0:3bf:b5fb:d7ac with SMTP id adf61e73a8af0-3c03e1fa2f3mr2525746637.10.1783153605605;
        Sat, 04 Jul 2026 01:26:45 -0700 (PDT)
X-Received: by 2002:a05:6a21:3294:b0:3bf:b5fb:d7ac with SMTP id adf61e73a8af0-3c03e1fa2f3mr2525713637.10.1783153605147;
        Sat, 04 Jul 2026 01:26:45 -0700 (PDT)
Received: from [192.168.29.91] ([49.43.231.149])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-30f376bf710sm10035822eec.6.2026.07.04.01.26.34
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 04 Jul 2026 01:26:44 -0700 (PDT)
Message-ID: <ca8f3731-3f23-45f5-82ed-ba1a65514b95@oss.qualcomm.com>
Date: Sat, 4 Jul 2026 13:56:30 +0530
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 6/9] arm64: dts: qcom: shikra: Add GPU cooling
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Akhil P Oommen <akhilpo@oss.qualcomm.com>
Cc: Rob Clark <robin.clark@oss.qualcomm.com>, Sean Paul <sean@poorly.run>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Will Deacon <will@kernel.org>,
        Robin Murphy <robin.murphy@arm.com>,
        "Joerg Roedel (AMD)" <joro@8bytes.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Bibek Kumar Patro <bibek.patro@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        iommu@lists.linux.dev
References: <20260704-shikra-gpu-v4-0-90cf1a52e539@oss.qualcomm.com>
 <20260704-shikra-gpu-v4-6-90cf1a52e539@oss.qualcomm.com>
 <opgj6twppqwhb77itqelmyzniaifcja3wdazyzeal5axstr25g@a7v634mnimbm>
Content-Language: en-US
From: Aastha Pandey <aastha.pandey@oss.qualcomm.com>
In-Reply-To: <opgj6twppqwhb77itqelmyzniaifcja3wdazyzeal5axstr25g@a7v634mnimbm>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA0MDA4MSBTYWx0ZWRfX1AFKPfC4IXW8
 mPGeF6yiU/z9JU2OIJcqbsmlFAI2ZEwafMWTGm4kCK5owgIIrynC9SF6QGHJt5/3fzhADV4/Btp
 6bId1Qvskv8PFeTD1HTTvqAYLc1J1gk=
X-Proofpoint-ORIG-GUID: tdGZP0cIDXkT8CITw1oEL3fki3oQTxZp
X-Proofpoint-GUID: tdGZP0cIDXkT8CITw1oEL3fki3oQTxZp
X-Authority-Analysis: v=2.4 cv=FJwrAeos c=1 sm=1 tr=0 ts=6a48c3c6 cx=c_pps
 a=rz3CxIlbcmazkYymdCej/Q==:117 a=lXa6t/u14VstaBBXcWJ8zA==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=EUspDBNiAAAA:8 a=wGVdvqWwsIcFZm6VKzoA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=bFCP_H2QrGi7Okbo017w:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA0MDA4MSBTYWx0ZWRfXyEKxJnpDoWhn
 prf7zqfYP2HcexWY6a5dDSBJWAGhIY81GQNbaqAUdsgvBKwHwHBsYZwQhyHrm5aRwd0LrsDknfU
 UXZ9kkUQlCiMoE0NIafQ8wEv21GPF5WYxcUYKdFrrUITp05UTG5TB1ylMj0u2TbJFLnNnBg0DsF
 hBeLj9oVXupCT2Ht1wsOLiB0qdaT0iaQzXa8S/93dq9mak6cSiRVEvIooDDwxy6QxZNcUMjstOr
 38nKXSTpJ3jSp92snp0oDxDEZXkmRBJm2CD+ESmoTVYBibwxISFqRUSs3r7jM+EwMkr58s+Pqhf
 MZNfPF7Kzn9pWXZtduXOKoVgwbLPEilvsY1FtM2bfhRIU445O4GP01juZcixFG0vRe54aPt8cvm
 OXfanrLa1ltzZ+WmdWdVB19oGQkzLBQbq1BSr60TMRNKDIPp1aIO75DlSAyAjbiinBJmllbYUf6
 pzUBz976U1io1wn0r6w==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-07-04_01,2026-07-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 adultscore=0 priorityscore=1501 bulkscore=0 suspectscore=0
 lowpriorityscore=0 clxscore=1011 spamscore=0 malwarescore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607040081

will update why part in commit message.

On 7/4/2026 4:41 AM, Dmitry Baryshkov wrote:
> On Sat, Jul 04, 2026 at 02:04:32AM +0530, Akhil P Oommen wrote:
>> From: Aastha Pandey <aastha.pandey@oss.qualcomm.com>
>>
>> Unlike the CPU, the GPU does not throttle its speed automatically when it
>> reaches high temperatures.
>>
>> Set up GPU cooling by throttling the GPU speed
>> when reaching 115°C.
> 
> Nit: 72 chars. It looks really strange to see two paragraphs with
> different line wrapping.
> 
>>
>> Signed-off-by: Aastha Pandey <aastha.pandey@oss.qualcomm.com>
>> Signed-off-by: Akhil P Oommen <akhilpo@oss.qualcomm.com>
>> ---
>>   arch/arm64/boot/dts/qcom/shikra.dtsi | 16 +++++++++++++++-
>>   1 file changed, 15 insertions(+), 1 deletion(-)
>>
>> diff --git a/arch/arm64/boot/dts/qcom/shikra.dtsi b/arch/arm64/boot/dts/qcom/shikra.dtsi
>> index 34261221664b..eeeaa369d3a7 100644
>> --- a/arch/arm64/boot/dts/qcom/shikra.dtsi
>> +++ b/arch/arm64/boot/dts/qcom/shikra.dtsi
>> @@ -2510,6 +2510,7 @@ cpuss0-critical {
>>   		};
>>   
>>   		gpuss-thermal {
>> +			polling-delay-passive = <10>;
> 
> Why?
> 
>>   			thermal-sensors = <&tsens0 6>;
>>   
>>   			trips {
> 

-- 
Thanks & Regards,
Aastha Pandey

