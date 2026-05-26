Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 25E60305666
	for <devicetree@vger.kernel.org>; Tue, 26 May 2026 06:42:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779777753; cv=none; b=aCa21xfYJmJenz/8hIzm6rroAr5Ulbqf/wmztUxYOG8en43pdq9KLvnlr3z3SAn+AnXKdGwEd8cv6yzxYEHNYPFQh4rAaRpiqu1+y5ZX5f14R0eAb51MhanIgZzeuhXoz8GVBthALB/mdj9CinYQln/pPY744+QvHNwDPr4TDSM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779777753; c=relaxed/simple;
	bh=1XZvQh24NMPzJFxBym8WhWMNSuBuj21mEK2ZC6wKrQA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=hl8AvVJTf9CG1oRgGAPFm77wEF0FhfMS+6ExO84HitUK2LnKSCKFKzQRn6PMJpkRkoGd9MxVs6YfyY31i3MFmiVDw4fst4GwKai2fHkYoF2NQBEvxgWYfnGpu+EEYfpljhXPPbqQIDp2HJ1nD/HjtqOsPdCaL8gLCpO/Q1J3Cso=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=jo62S63T; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=a2KfJhbo; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="jo62S63T";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="a2KfJhbo"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64Q5xlRK1604575
	for <devicetree@vger.kernel.org>; Tue, 26 May 2026 06:42:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ajId4scyCctYxikVukDiATz7SBoip+pax0baHtsGRgo=; b=jo62S63TfzA59Gga
	fdBZsD/JMANgFMRtQyub5nVQnIxJuG33kzJJzmOnSx29MQmIYUJgzmQ42LawU8Oj
	xrQKCy0LU/3JvR+zVJ4rSoaVjnOB2V5DZKyrxfxPX6INP5KCxH7zdPAd+bxdLHKv
	v+ZhMFN0eF2IyBkCyavoenIC+t+FHuFo9QugkJixpyQa9htLUQ72S5MTOMGj2QWC
	s3lMBPqJhUu+jHyMzsKFLltxYxP7Ry+xvLh85RgBZxsGmWsdoSv5xLyouNLcyHDB
	DpJOkp27Nt7IyVvcTcjbqRgy5LEJtA717gHRW9fxaeokbUqU+4EMa5TC4twrxyRJ
	3901ig==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ed5v3r4r3-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 26 May 2026 06:42:31 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-366ded3bed0so7242642a91.0
        for <devicetree@vger.kernel.org>; Mon, 25 May 2026 23:42:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779777750; x=1780382550; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ajId4scyCctYxikVukDiATz7SBoip+pax0baHtsGRgo=;
        b=a2KfJhboPpoAZaI4ls03SVr8gL8gR1S/18nhQ08QTysxnzkVQqGSVWDKQsKJlKiSTu
         rl21hDlG+tTDRkuliKGBB3bfJQf/tEm8lUKUb/gW6WKkwzi91qnbf5SkcAVbXffkIQbL
         bUoboMKlglruLC9L0AUcx5iWSUCYqFPEXywx0djpz66XLIiutAlAsShgGgBuwMqB0Z3I
         qpifJIfFQ5afwH76JwF/JGY4UDvyvTAyC1ZWOiDFWaRTZH4dMOCTj++Hdkg/N4czRQvN
         xXb1Gzd3aJZ9nT7RZ1rtSseTxgro8lXMzoffNlpnRLEhyvDckino/46+DwCo5A3DiA+c
         4+Nw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779777750; x=1780382550;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ajId4scyCctYxikVukDiATz7SBoip+pax0baHtsGRgo=;
        b=nvNSYkQLcPzgiE4ZquL/t8PAC6ENH8/YHWnBCn1iSax1lY24RgB37AgvTQACOg4ACO
         jyvM1IMDDtbTvNC5Wzzn3VuOkG3mBkS2Q/be31ERHOx85n7HCCkh/l+KT55atH32PzKm
         rAnNI3t4K8ZBNxvMzPRgFOuYp8/zh21CaMzNXR/fmaSGJlTVnzXmcRYv+6/SioHA09vi
         9phP7WICgLzzW0hLSn84WSMGZs9qRJCX8Ep8xiAzIZ4vhmWFlfrwuOtKoQs/pVa8nkmJ
         QnPZBSLpo9BL6gQi9CZWYRDXNT64JWM4aEMRDLexQWZV2YeWR2XDf+g7YKb7xhDOy8pu
         3tEw==
X-Forwarded-Encrypted: i=1; AFNElJ9QVdnpPhOAmhNbWB1y9QymUPSusTAnMW+ZipsjVDpgE3SuqPqbw11+gS8JjwCniIOOtw/eoNSoPjg2@vger.kernel.org
X-Gm-Message-State: AOJu0YyGISEJfFNHfUnhvr+II3amvuznEMs1DFPAQRJymhch4mD3sl2+
	sJhnecRtMDNBirGkhTattCwuR0qFOmCPHHRumhzH/q4qi8XS1mszmnU/82R6M0PclSNOCDi/g98
	X168vOF8jkfbreySc1ta+A9DO5d0zDIMQDhhL+nWMNxQbITCG4HlLoeGuyTcDCc6H
X-Gm-Gg: Acq92OGopHxtLhnFsdPxjigrDI6BFlHGPqS5qG7ox4lpyexyUYXWNJAtAXTxYMgseaR
	VssmHjBn4rZSf8Sn0LzeeyeDGduh1kCNTq3JARHBMCxdvbAHKR/RwWFDW31UYFcsStW3Plxi84T
	ZK2orVmW5TojV6+BxsvJPo1T287RiLuSkM0PeGj5tGQdqQqI255B7LCRj2ehnlYzX8b18eZ5D7l
	3bqOoVu0AHQakGfcq91AqXzXtDk8YC45RpDEpO9okaZRVaYRpXxWM2zl3zSX+DauFi47MBbzafY
	J9cP+5YzbnHEsWcndX7tQf6EBIyIq0Ps9dEEAiYLSA6Zla2vzBj8D74dFwTez95WFHq33A3OZdM
	weQ1tczohhRP4DD9F9v/tGfzmj5TLkaeK1hOHv4duh8rML7aDeQ==
X-Received: by 2002:a17:90b:3f85:b0:368:b92d:df93 with SMTP id 98e67ed59e1d1-36a4797cc8emr17399641a91.9.1779777750190;
        Mon, 25 May 2026 23:42:30 -0700 (PDT)
X-Received: by 2002:a17:90b:3f85:b0:368:b92d:df93 with SMTP id 98e67ed59e1d1-36a4797cc8emr17399608a91.9.1779777749732;
        Mon, 25 May 2026 23:42:29 -0700 (PDT)
Received: from [10.92.181.2] ([202.46.23.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-36afbc766d2sm1987905a91.14.2026.05.25.23.42.24
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 25 May 2026 23:42:29 -0700 (PDT)
Message-ID: <c36e0241-08d6-4866-8b3f-3a7e2bfde547@oss.qualcomm.com>
Date: Tue, 26 May 2026 12:12:23 +0530
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH V2 2/3] scsi: ufs: qcom :dt-bindings: Document the Hawi
 UFS controller
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: vkoul@kernel.org, neil.armstrong@linaro.org, robh@kernel.org,
        krzk+dt@kernel.org, conor+dt@kernel.org, mani@kernel.org,
        alim.akhtar@samsung.com, bvanassche@acm.org, andersson@kernel.org,
        abel.vesa@oss.qualcomm.com, luca.weiss@fairphone.com,
        linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-scsi@vger.kernel.org
References: <20260522172716.820490-1-palash.kambar@oss.qualcomm.com>
 <20260522172716.820490-3-palash.kambar@oss.qualcomm.com>
 <fhdronmweor6vb4yu3ggickvvzj7ls7w4eqb6tsvp4amjpg7ae@xfr4up3iesjh>
Content-Language: en-US
From: Palash Kambar <palash.kambar@oss.qualcomm.com>
In-Reply-To: <fhdronmweor6vb4yu3ggickvvzj7ls7w4eqb6tsvp4amjpg7ae@xfr4up3iesjh>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTI2MDA1NiBTYWx0ZWRfX/DG/FRCBQA2o
 4E+13LE37tT0z2KY/LImEHiPQKyg53PtNUy4Zpt+XpF5f6qTK3kfAAhfKVKY+vP2Sf6vpjbu8Tt
 LuttZl8nW+jdSGwSYxQ+33Hoj3uRw7hsePlfc/PCK8BchB9le/GKV4+F1OArs/Cb3CG8QplQZDj
 Aot0jGK1PEPqp5Hd5wll4scPq3+I1gi0TJmUPDLtwKLlcNgF+CoeCwFI04S96WS+MwQpow53YtI
 aT/meltYi9BI6qNmyA3WVIygLEpNe+NaQicFzqkpzVy6Fz9fYoTF+rTUay09w9xo/IAN4GGHymC
 TQ7LSsoNKoRVC5JfiO+NPZT5oG85JSPhcsjjiZ6/EIB/Mbvisq1vDXxAJRZqKm/2lm0d3kSOg8a
 TUGBdasLchKjlDeJ0Yhr1fcdsuN774/5GYwP/wkCWGJSsnHJL6kpZnvunkzfxXKvIfpdkEP5R53
 nQR3czjXmDDTMWVMYdA==
X-Authority-Analysis: v=2.4 cv=Zc4t8MVA c=1 sm=1 tr=0 ts=6a1540d7 cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=j4ogTh8yFefVWWEFDRgCtg==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=EUspDBNiAAAA:8 a=sKss_wxwHuIV23YTwXMA:9 a=QEXdDO2ut3YA:10
 a=iS9zxrgQBfv6-_F4QbHw:22
X-Proofpoint-ORIG-GUID: -Xb0zvhdWcuzUpOOU1qDn2wSCFFd1rVL
X-Proofpoint-GUID: -Xb0zvhdWcuzUpOOU1qDn2wSCFFd1rVL
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-26_01,2026-05-18_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 spamscore=0 impostorscore=0 bulkscore=0 adultscore=0
 phishscore=0 clxscore=1015 priorityscore=1501 lowpriorityscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2605130000
 definitions=main-2605260056



On 5/25/2026 2:16 PM, Dmitry Baryshkov wrote:
> On Fri, May 22, 2026 at 10:57:15PM +0530, palash.kambar@oss.qualcomm.com wrote:
>> From: Palash Kambar <palash.kambar@oss.qualcomm.com>
>>
>> Document the UFS Controller on the Hawi Platform.
> 
> Please fix whitespace order in the subject.

Will fix and update thanks.

> 
>>
>> Signed-off-by: Palash Kambar <palash.kambar@oss.qualcomm.com>
>> ---
>>  Documentation/devicetree/bindings/ufs/qcom,sm8650-ufshc.yaml | 2 ++
>>  1 file changed, 2 insertions(+)
>>
>> diff --git a/Documentation/devicetree/bindings/ufs/qcom,sm8650-ufshc.yaml b/Documentation/devicetree/bindings/ufs/qcom,sm8650-ufshc.yaml
>> index f28641c6e68f..3de00affa4c6 100644
>> --- a/Documentation/devicetree/bindings/ufs/qcom,sm8650-ufshc.yaml
>> +++ b/Documentation/devicetree/bindings/ufs/qcom,sm8650-ufshc.yaml
>> @@ -16,6 +16,7 @@ select:
>>        contains:
>>          enum:
>>            - qcom,eliza-ufshc
>> +          - qcom,hawi-ufshc
>>            - qcom,kaanapali-ufshc
>>            - qcom,sm8650-ufshc
>>            - qcom,sm8750-ufshc
>> @@ -27,6 +28,7 @@ properties:
>>      items:
>>        - enum:
>>            - qcom,eliza-ufshc
>> +          - qcom,hawi-ufshc
>>            - qcom,kaanapali-ufshc
>>            - qcom,sm8650-ufshc
>>            - qcom,sm8750-ufshc
>> -- 
>> 2.34.1
>>
> 

