Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A491037FF62
	for <devicetree@vger.kernel.org>; Thu,  9 Jul 2026 15:28:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783610894; cv=none; b=iqVqnfcRhQWa3GXjmrgwtdN0ZbeQlN7UIcHVx3XtKTURUlYAsR5Xvl3LRKbs42a1PH8KGxRJlAy1+dU9jMU1n/rr+HEz6MMruePsRFMQJsbSa/qO/pXQnjyuwpbvZPrhNnPBP5zX724L9/yxxoI6488u+p2ZgY30dMHwgtaHWiM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783610894; c=relaxed/simple;
	bh=hhpoffETOuifw+MNksNM0dLoI7WKZHtIwfPDeUBNl8o=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=GVdjnDnpMmcolrp7wR/FHRpra2+g34Qu/XHjsbIlrwTVHNvvcJY9DOfIFmilCFAa3sqPynI36JIa3a42KvaNCbENiiBA0TJv0y3XwFI1+1LctDBKf1qFTB2I/2ZnD2Uj+/fk9P+0Sk7urXhtO3O3algWDXPl9KtvTttODuNaAgU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=HgpvLHyv; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=fTGBo5a0; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="HgpvLHyv";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="fTGBo5a0"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 669Dw2WJ1884047
	for <devicetree@vger.kernel.org>; Thu, 9 Jul 2026 15:28:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	hhpoffETOuifw+MNksNM0dLoI7WKZHtIwfPDeUBNl8o=; b=HgpvLHyviZF2l86A
	avaqMK/HD9K4u+4v0YOvK+NtbkudPr2r9wXZSpXXZNSQNnTSm1OAcOUOkeNMU/Js
	Ct91/n7EdsTMkDCQtSPPJivDjALwt7rsquxAQbH97zPdx0w5NQG5nF/piNU6Hwvs
	EI5gTdrrWagAihHic8S3kqskvWOUW5GzQwZjtyIsbebbIaITueNf18Lf4Z5b17is
	m/WYYryEDzKQBwmD2I+5/lAjSOzxrU/RmlbzICjn5jDLBUzJ/Q3aitci2VB1S2dW
	bMfICuoaqCWfsBgsf99BvUSlMfVxhRTMpf22UvyiqYnfG6wSeR0Alp305EygksoR
	zrnfQw==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fa1ydugjp-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Thu, 09 Jul 2026 15:28:12 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2ccb6823efcso20392395ad.0
        for <devicetree@vger.kernel.org>; Thu, 09 Jul 2026 08:28:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783610892; x=1784215692; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=hhpoffETOuifw+MNksNM0dLoI7WKZHtIwfPDeUBNl8o=;
        b=fTGBo5a0tXztKfsT9uvnojbNEqPZJlyUZAz3zhLUUGKCSKu7lhlvHIQULK6FEBIsP5
         Oj0UQjx+cvrWYyrpH6Fo8afOEyXrtuttQJINlpUtGFyViNcHjCPFmKa0Jj5ZZRH+goZN
         ocGm1kfOP9ORBaRJrR3fOm7cNlvQR6exXUCtIUTlsRMWqhcBf8LrEtD7gQomEsPsjPIm
         iJkVXVbbSYPO8eGxdKYuWYEAzbbysCaUs5n+klyvNi9NGeJet1CRD/tS4d81FnvZ3/4v
         1yffG28HqFwb6L12QBaZaUX0lRVXogFoYZHyd7FeUEbu6cwT+nA9RlNzm7NtZevwLSyz
         81rQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783610892; x=1784215692;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=hhpoffETOuifw+MNksNM0dLoI7WKZHtIwfPDeUBNl8o=;
        b=qo4UxNYrZvjMGUWZohBu5fXV12HJnmQpDToVv4UaRH9AXHsFPo3F08VAAM0vyIbkE6
         BqPTLA8686lek35pznBfK7FqxY4kZKanNajaytQHcyeft+kRO6adkgkxzuOkgpzlwP+5
         hmCe8g+wocGRIn1hilTdcSJfBGzIoqPHt9zlX1xl0pTCdf7BqETVBEuZZ3GSIATgFISc
         8ajEns/cHyhnqzjQchTiNuy+wmRyDRVCrjTZkP+j5luXZNhb7GSWGYnIoaDFZVCtRKJJ
         0h5GGVBkAcikIDHVSFKHgEcSY9tHExT5XqC3pw4Qojds7bG5TjzXZFGh+fw+WL7O20qB
         d+tA==
X-Forwarded-Encrypted: i=1; AHgh+Rr9jHYcIaSQQbaQhL+v+GoEKnNWobc+1dlwxgVVuj7KebaG0P29eW/2znzTOHwbBWWK/deoaqTbEG4l@vger.kernel.org
X-Gm-Message-State: AOJu0YxSs+JNm4GA+jif6df638UCotynUFfXJJ+32zIXygKORGOcf/vl
	oWc2BtwGd9hCTwJtm3Br1ZWYNCCDaUUHo5w0ZkDERocyysdNubUQei6vJL1k2KH3CjYQ7091WrD
	f8mth8ogTq+BYKMyQpmblWtcMaf1UAL2ukBCYIvWuHWnj21tugpWIlpyCCvnu929C
X-Gm-Gg: AfdE7clqoQKxvEC1XsMVLjfKH6eXVcuYj0J6VF+aH+hnrX8Z+hdUuds8Yy8zwwtvdlE
	R2wX8k/drgyvhxiWfLCC6BB44J6+rQlIPjsfJ5jlmdZq6BDvVV//dF4cM+wRch53uSdc/VihCkO
	vxQxpvj8+1/h5BifuK91FIaw5lAJAzGaGXSTdWUbLOv0b7x1zbfaVN8yDynwrfv+ZvSoTrr/iRj
	7aurrb0VcVxLk3QFhfc7sPCFl6BLv+HQllFcfrPfYthSf6boKot4ICLJPysoGYJUTSSBS5wNwWh
	CnXEh5Hrg3OualIf3BFgIU3HNPxB/OzPwxMwv8I05z59weJTMbtlCi4bTlv9E5jmqSER8ycvyvx
	FhljcH9s6xTEwVKlvT57Al6X7JuNprb/Uf1HTGfl3Lw==
X-Received: by 2002:a17:90b:1d44:b0:37f:d9dc:557 with SMTP id 98e67ed59e1d1-38940638b51mr9375027a91.16.1783610892170;
        Thu, 09 Jul 2026 08:28:12 -0700 (PDT)
X-Received: by 2002:a17:90b:1d44:b0:37f:d9dc:557 with SMTP id 98e67ed59e1d1-38940638b51mr9374988a91.16.1783610891627;
        Thu, 09 Jul 2026 08:28:11 -0700 (PDT)
Received: from [10.204.66.221] ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-31198cb2b99sm13681204eec.26.2026.07.09.08.28.05
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 09 Jul 2026 08:28:11 -0700 (PDT)
Message-ID: <85a05836-6298-4111-97ca-80d7e3b3a9c4@oss.qualcomm.com>
Date: Thu, 9 Jul 2026 20:58:02 +0530
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v12 2/6] dt-bindings: media: qcom,x1e80100-camss: Describe
 iommu entries
To: Bryan O'Donoghue <bod@kernel.org>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd
 <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, Robert Foss <rfoss@kernel.org>,
        Todor Tomov <todor.too@gmail.com>,
        Mauro Carvalho Chehab
 <mchehab@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-media@vger.kernel.org, Krzysztof Kozlowski <krzk@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
References: <20260708-b4-linux-next-25-03-13-dtsi-x1e80100-camss-v12-0-f8588da41f16@linaro.org>
 <20260708-b4-linux-next-25-03-13-dtsi-x1e80100-camss-v12-2-f8588da41f16@linaro.org>
 <HCPw5KYwtYb7jBFED4lssTvcaMo2bK808SHkTWNR77q0DXGPQklaADJXvuyeBrXh_GsEMKdiaaktkzQ9_xeseg==@protonmail.internalid>
 <cbc1b1eb-0064-4999-b829-2bec451c682a@oss.qualcomm.com>
 <f307848d-6abd-4e96-9183-36f8599026ce@kernel.org>
Content-Language: en-US
From: Vikram Sharma <vikram.sharma@oss.qualcomm.com>
In-Reply-To: <f307848d-6abd-4e96-9183-36f8599026ce@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA5MDE1MiBTYWx0ZWRfX4SSxnz7VmmSZ
 yEQQlDXXyanRB/MUXOmvSPP30v0V1ozIT27oKj+ftFjeeITLMz+yDbdAMo/ioqL/XmoxVuya9Va
 1zuE5+FmgBQik8zuKyf/N8lgEj7/ZjE=
X-Proofpoint-ORIG-GUID: S0yq4N4sVS87rK6dMz80s1S_LoaHRqzj
X-Authority-Analysis: v=2.4 cv=cOLQdFeN c=1 sm=1 tr=0 ts=6a4fbe0c cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=HI1v2mgwsAgm2NAubtIA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=1OuFwYUASf3TG4hYMiVC:22
X-Proofpoint-GUID: S0yq4N4sVS87rK6dMz80s1S_LoaHRqzj
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA5MDE1MiBTYWx0ZWRfXxXQbKh0OEbgg
 XGfZvivgg+BgWalDMpHRb/MnAIckT1DdfADc8tQVL3j7Nlhk8AOuG+fsNYQO/90TSTXs2pKUVvq
 WeAqYLLeKyxbWfSdmyQbRyI8vCMHcfLPuJgpQokvnkxcnWLuMchzp0lndBcs+vFgFqspN1dUJmn
 4coFx8804AhFg/jWcpPLZt6dSmmj3cpi9eITNdm7IjgibcaV0BNoIhXDMdHv4cs8gcT7ULch0MS
 nD7UDwC91ryWcZBJCQgxdrqs5oTziqUmu2WV/kxjqjgcFSCagP2uMCXfDm45GM6eXuy/CERME5u
 5A1Am9gQ9KbvL+mHazKpK7X5BpVhI/a3DualbAe7kFQ8NANgXy94/iCZENxFg4WkPQKMLhWh8Z4
 DczYoUYSqEHcTZxVsSAumbHcW/w4FMonaxS0jjzy/hDHZA+Bhe4fWyjgK+lC4vLK3EbKzA0pMcm
 Sk7iis+2TgCqF0/jCvw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-09_03,2026-07-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 clxscore=1015 priorityscore=1501 bulkscore=0 spamscore=0
 lowpriorityscore=0 phishscore=0 suspectscore=0 impostorscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607090152


On 7/9/2026 3:02 AM, Bryan O'Donoghue wrote:
> On 08/07/2026 16:15, Vikram Sharma wrote:
>>
>> On 7/8/2026 5:36 AM, Bryan O'Donoghue wrote:
>>>               iommus = <&apps_smmu 0x800 0x60>,
>>> +                     <&apps_smmu 0x820 0x60>,
>>> +                     <&apps_smmu 0x840 0x60>,
>>>                        <&apps_smmu 0x860 0x60>,
>>
>> I think only "iommus = <&apps_smmu 0x800 0x60>" should be enough as mask which 0x60 is implicitly covering sids like 0x820, 0x840 and 0x860.
>>
>> Regards,
>> Vikram
>>
>
> These all come from the Hamoa iommu defintions in qcom docs.
>
> Can you double check for yourself and let me know. 
Hi Bryan,

Confirmed — all four SIDs (0x800, 0x820, 0x840, 0x860) are valid and documented for IFE/SFE. My point was specifically about how the ARM SMMU SMR matching logic handles these with the given mask.

In SMR hardware, the mask field marks bits as "don't care" during stream ID comparison. With SID = 0x800 and MASK = 0x60:

MASK = 0x60 = 0b 0110 0000  →  bits [6:5] are don't-care
The four SIDs differ only in bits [6:5]:

0x800 = 0b 1000 0000 0000  → bits[6:5] = 00
0x820 = 0b 1000 0010 0000  → bits[6:5] = 01
0x840 = 0b 1000 0100 0000  → bits[6:5] = 10
0x860 = 0b 1000 0110 0000  → bits[6:5] = 11

Since 0x60 masks out exactly those differing bits, a single entry <&apps_smmu 0x800 0x60> will match all four SIDs.

That said, I'd say this is more of a preference — both forms are functionally correct, and if you prefer keeping the four explicit entries for clarity or to stay aligned with how the Qcom docs enumerate them, that's perfectly fine too.

Regards,
Vikram
