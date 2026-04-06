Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F366D3932F0
	for <devicetree@vger.kernel.org>; Mon,  6 Apr 2026 17:52:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775497951; cv=none; b=nzBNMGmH6BffeFglvYS5VSZ0GxSdH/lI8kyR+toOEcUPDbXiW8S+g/C/+Y1by6mPbFA3pP+8jP4jQ/IHd06HkmXc6LJDrLY6VRMZ+pMXKmMJbDVfbQlEi/nQ6cTOh7Iwj3HP9FWXsx5sKcetEMr2QTd0Iwk6EnSv6sdRe32y15Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775497951; c=relaxed/simple;
	bh=hIbqKg4yrPEGCshx9GZ61exuGLbFwyRCpftV9f4Z0ZQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=uSIq9tZvoLXzUjvq2qVfOUcis0xYWLqBuoT+0qbz/ziq7+jcfeZvpJHgc6GP18FSqoz/o93THf30n0jSAAO/KlQrDdhDBQXjQVkpNqUsCqC1pGpQjoNL2JG0cy7SGZGBhMYQ5re6QOeoKBczFItSVnSgHIKuQ1Jx1kefdLMDLIA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=izQVTWum; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=S7idTJ0I; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="izQVTWum";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="S7idTJ0I"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 636Eiusl3146227
	for <devicetree@vger.kernel.org>; Mon, 6 Apr 2026 17:52:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	VDKw4VsGPRzgcwM2vGZUmkh78WZnw20y/osHw2LGmvc=; b=izQVTWumwzqY2DvQ
	Iux0qVUSdTukZHbg+lZITMclkWZ6/+iHuInY2TEN/u1ypcT0t157sZI6vtMRVr1o
	T0u6cyYAegROmruIrL8nauqTbmEDQFmxIxCBzwcdcgyDUPqpRmb6nQ916D2wJwSl
	PgPoN87HIMY+AIToeEx6m8NiA820WRrfnd/wHFppBEg3xdzaNRS2mlRSiU2d+Stk
	KR2DIBLAF716ab281fTl+51f32Ao8plEljjxkuKMPFq1syhKVLDEFCv2yXYbAHea
	mi1r/1cqMfQF25PxuJxmrHg+8K7XUMi77VclvDdHA5lDo9S6RcBAxMwsbpeGure4
	mjp6vw==
Received: from mail-dy1-f200.google.com (mail-dy1-f200.google.com [74.125.82.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dcev98mgw-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 06 Apr 2026 17:52:28 +0000 (GMT)
Received: by mail-dy1-f200.google.com with SMTP id 5a478bee46e88-2cc75e79b97so17633279eec.1
        for <devicetree@vger.kernel.org>; Mon, 06 Apr 2026 10:52:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1775497948; x=1776102748; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=VDKw4VsGPRzgcwM2vGZUmkh78WZnw20y/osHw2LGmvc=;
        b=S7idTJ0IrYYqMODCP40ypIc1zLgC6xybuhN1M7Ul5VnMr3bXN2o3I0u04QlZOJ7xuj
         S330VQhXE6ih/yoDPkG1iEn6tIlY/2xwwYG8MFrQgX7aMJlYAeHyDzXzn05JOB1/jllv
         t5X9xfDF9rndA+xjD2071S+BVQWBD4SQClxew+fVwepKbrUGA/QNImWBWVME/m3Rc+V5
         +w1jFhP+DyrSyTsHb3F0fntK9+w57tWQ6ELohOKW6PVKK2t4KbWgHISfE2TaeXTrYbNX
         /sdQhoyC4WUnHTLx4pqgdFe4abL8ZWH91jFkTSyV93TQyBFrUOJGsoCuTA+bFGNsZhXk
         Q5xw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775497948; x=1776102748;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=VDKw4VsGPRzgcwM2vGZUmkh78WZnw20y/osHw2LGmvc=;
        b=sWRkegopQ5ciwn0zEw5F8/uCpMAUQg73Uh2Z+VxWhUszM4wiUv4IOxKNu+AJGWRAMz
         Ntt4ljze5JkqH8H0Hg4uJKte5EonpZXiAAEXp7h0cuLsa6stLiAd6m4I+6dJsWLo0v1w
         5JJ8tDoBRubRVsaJTMLsqMsWRSHaHmTApy/bUJueooUZdnSqRQqzQ4BQFHC8dx+GA8FW
         TZqUAsLOClq3xCRLFUNXxB/lliKIfCQDz9pGlggSSUynN2LEYtSSLNxxBKFVLvytNPs9
         tucVbc7x2chkLupwyQb3ISubym40J8FtWE5HWUiKJKgYOqM5oH78n0TH/rRMQFkDj/DT
         AnNg==
X-Forwarded-Encrypted: i=1; AJvYcCVw3JljB78i9gKP+tubF0ZrkzLJ/NWP1BPZB7y04+ZPz96f/JHLPl721CBMmjA8t/L3oxu3LF+03NOI@vger.kernel.org
X-Gm-Message-State: AOJu0Yzr1xtppGu1xI62TSbAXtF2kGhhVse5SRlfMPEso6bSRs0pUFED
	7zqde8jlaQPqr+lxZii6VimEIRu4iWD9Vcl6T9beMp9AuhKk5HExg0TDB05nVj/uNnGBO89La+D
	qRLONsOe9Ly9C1xYoLgEbVXn/jH1BVZEyXsWdUQC0lYwTyzTFmZcSt8sh9hkiMPKP
X-Gm-Gg: AeBDievjzODOen6Q9nEeveezn1Zn58/U26ko2fqb7WfstZKBc/IbURRsYxAoMUQpXt4
	2JCg8bq/Rm/ZCiMIp3LelmXrR9eFyexKAF7rBL9jYcK+WLC7DkVj0z6mr/iey3GMQ2mSGg3+dQR
	q0uWkeZxHM/V4/Va7JTeYE8bFNFBu9a5fk3bz+l8HIlCQY3VdXThYjJ6GdZbt9de9oabqo9wc2Y
	c78MCkFM3hRG4nYiQ/IhcCAxoXENgccvfn/mZBdHYghUzQOZ+eJMXJ8TynrYwMYO8sOEjmuq4OJ
	7eIPZ7vhRQ6hNIepItRWxHccEEtTsDR/+rKieZdahelGeczXrJ1L1GKepg1ALF1qn5LlSh8W8/4
	SaFT/qbCjE+qem3CDwv1x6nMnB+pLbS3MydefL2MXaUD5OKyVhPPTBTZV
X-Received: by 2002:a05:7301:1003:b0:2c5:ed1b:c8a with SMTP id 5a478bee46e88-2cbf9afd5e5mr7343501eec.5.1775497947608;
        Mon, 06 Apr 2026 10:52:27 -0700 (PDT)
X-Received: by 2002:a05:7301:1003:b0:2c5:ed1b:c8a with SMTP id 5a478bee46e88-2cbf9afd5e5mr7343483eec.5.1775497947080;
        Mon, 06 Apr 2026 10:52:27 -0700 (PDT)
Received: from [192.168.1.3] ([122.177.246.26])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2d16d115c00sm33970eec.12.2026.04.06.10.52.21
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 06 Apr 2026 10:52:25 -0700 (PDT)
Message-ID: <3a415fae-bafc-4e23-bfca-564bff90cf2d@oss.qualcomm.com>
Date: Mon, 6 Apr 2026 23:22:19 +0530
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/3] arm64: dts: qcom: kaanapali: Add USB support for
 Kaanapali SoC
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        Konrad Dybcio <konradybcio@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, linux-kernel@vger.kernel.org,
        Ronak Raheja <ronak.raheja@oss.qualcomm.com>,
        Jingyi Wang <jingyi.wang@oss.qualcomm.com>
References: <20260329175249.2946508-1-krishna.kurapati@oss.qualcomm.com>
 <20260329175249.2946508-2-krishna.kurapati@oss.qualcomm.com>
 <f971b7d9-8e88-446f-ac93-c3506bca83bb@oss.qualcomm.com>
Content-Language: en-US
From: Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>
In-Reply-To: <f971b7d9-8e88-446f-ac93-c3506bca83bb@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDA2MDE3NSBTYWx0ZWRfX6/S+hH4o3nvl
 USv7TQn4YP5J5DuyDST9GETFxD6bsca+h+6foqf0CRCIEdlWZv2qTFDs0RGR9SEirCrZYucakwN
 /MskuOy6M+VhS17Jcq1i6GfT8d+4XPhgTKnhc2kjTu+PvNix0uEJp/9CjxZsHF9avEWCQQIddQw
 RV6NBtLuMNbdyPlgtt+pk6YX8/hs/bZlj8t2xc22P5L3M18Ti9VWu8UJ8kwGIEamBCclbQ/hTdu
 6hJHgrV+9sDywpyLVQavmWR8JeEbSKDKXFwNpmr1k3JhUf+Pi2u/iniKJ8HS3lA2v6zVS7M4DE3
 evN+xa5tkiyAK8zehJ+ajBUbfuRjWXrhrmVBfjpGuP45g7SX5hu/dKqposu4G9hqvgfqne4CMhY
 DXG43rE2VnA1kod6jRlmBT9MP7ZjZps1T/KmDxS+VzJZAM+OxMir4iaFAuaUX+s/2h58vFZSgSO
 EPh+YnmJzxV/KucQpJw==
X-Proofpoint-ORIG-GUID: S3OBMi8jm2K5_otRIbkXv00IgZWxlJfQ
X-Proofpoint-GUID: S3OBMi8jm2K5_otRIbkXv00IgZWxlJfQ
X-Authority-Analysis: v=2.4 cv=JZOxbEKV c=1 sm=1 tr=0 ts=69d3f2dc cx=c_pps
 a=PfFC4Oe2JQzmKTvty2cRDw==:117 a=Prc8aj0I33YhsXri9eX8YQ==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=EUspDBNiAAAA:8 a=mCk1IhpG3LsN4YOb_UgA:9 a=QEXdDO2ut3YA:10
 a=6Ab_bkdmUrQuMsNx7PHu:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-06_03,2026-04-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 suspectscore=0 bulkscore=0 malwarescore=0 spamscore=0
 impostorscore=0 priorityscore=1501 lowpriorityscore=0 adultscore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2603050001
 definitions=main-2604060175



On 3/30/2026 2:48 PM, Konrad Dybcio wrote:
> On 3/29/26 7:52 PM, Krishna Kurapati wrote:
>> From: Ronak Raheja <ronak.raheja@oss.qualcomm.com>
>>
>> Add the base USB devicetree definitions for Kaanapali platform. The overall
>> chipset contains a single DWC3 USB3 controller (rev. 200a), SS QMP PHY
>> (rev. v8) and M31 eUSB2 PHY.
>>
>> Signed-off-by: Ronak Raheja <ronak.raheja@oss.qualcomm.com>
>> Signed-off-by: Jingyi Wang <jingyi.wang@oss.qualcomm.com>
>> Signed-off-by: Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>
>> ---
> 
> [...]
> 
>> +		usb: usb@a600000 {
>> +			compatible = "qcom,kaanapali-dwc3", "qcom,snps-dwc3";
>> +			reg = <0x0 0x0a600000 0x0 0xfc100>;
> 
> Following the woes on Hamoa, can the platform suspend and wake up
> succesfully with the flattened DT node?
> 

There is a crash on resume when I tested but it comes up even without my 
changes:

[   65.263890] Call trace:
[   65.266489]  kthreads_update_affinity+0x94/0x158 (P)
[   65.271664]  kthreads_online_cpu+0x14/0x84
[   65.275951]  cpuhp_invoke_callback+0xdc/0x1dc
[   65.280514]  cpuhp_thread_fun+0x11c/0x168
[   65.284717]  smpboot_thread_fn+0x1e4/0x24c
[   65.289019]  kthread+0x104/0x124
[   65.292411]  ret_from_fork+0x10/0x20
[   65.296156] Code: f94002f7 eb1602ff 540003a0 f85f82e8 (b9402d09)
[   65.302490] ---[ end trace 0000000000000000 ]---

Hence I believe my changes are not causing any crash.

Regards,
Krishna,
