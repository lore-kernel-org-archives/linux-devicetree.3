Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6409D15665C
	for <devicetree@vger.kernel.org>; Mon, 12 Oct 2026 15:35:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791819313; cv=none; b=KEqc2iQM/rxjG5GNksKm1KxIj+9gDBSt6TjaFaN6YaVGEHH47UZQTqc44r0QSvOmqNxW3CEqe5iyMAO0jlkTXR2GzA8xELSfzmmSYHtBTpuAKy0DCe+5M2AooeGNUJRSCnbazxbT2g1gvhO7b2VCtLhbH0PceEKqctVBVngu3cA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791819313; c=relaxed/simple;
	bh=w4lePotoXe+nX+H6NblvvDqxQcCb6RktaTtqvtH82EA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=SJHdM7uugLF15zU2W4UiFQSxcFEYPt1p1KSEZlu1bzi9uk8Bhv4cufZn5B/QvFE73/mTGQTuUlE8x67EJIUWkasVOV1BP8utT4mUkqGuGYyQwdNo9e5BTdlNTcDEW2yxZAS1UcR7dTfWjw7G8ND8eP6MqXk/qPLNahPz7u5EZAM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=SygvHYei; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=EmpzixQN; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="SygvHYei";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="EmpzixQN"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69CC08B71686256
	for <devicetree@vger.kernel.org>; Mon, 12 Oct 2026 15:35:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	1cUO/H/Ma04E9qAVityxFd6ti5bE3hFLpDa4qT5O2ZY=; b=SygvHYeiQ5snGSw7
	BZ9iQaRIJrMLonFFtuJyJy8krgi6JS4/BUu82Io77+2FSvz9qKrP5n5RVB5V66hO
	eXu8Hcnc7KwsV68q3fL4CyaWdRoFNVMsWh6bOpnrgolt04Iog7+snNZmSTAS4Jon
	SLbLOdfxnU3qLTFDOl6l7vbAOsMQQl/ULMbFrYOKY0w3gWxtXCjCPMP9A1Dw9GpP
	bv28YcyXkCXfZuIZQVcl7N7CCuULDC/1jAsMsM4kT94PNU4Nmg6rG1ApiS184zRL
	ac6qCj6TLxSY8QvsE+XpD1D3CAowwGoK00Plsbd6c4LfXO8rNLBU4QsTf1h5Gw3A
	iotksw==
Received: from mail-dy1-f199.google.com (mail-dy1-f199.google.com [74.125.82.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h8wbc1gvx-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 12 Oct 2026 15:35:11 +0000 (GMT)
Received: by mail-dy1-f199.google.com with SMTP id 5a478bee46e88-33713e5e6daso3310478eec.0
        for <devicetree@vger.kernel.org>; Mon, 12 Oct 2026 08:35:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791819311; x=1792424111; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=1cUO/H/Ma04E9qAVityxFd6ti5bE3hFLpDa4qT5O2ZY=;
        b=EmpzixQN4szYaN4yM828VeNo0bViGvnnwOP1QFKzElzQlSBut4YHakfjtfDj8qp+Ly
         2BEKEbtA8F/TEZLN9GFln2qQp4R5leTZKNQJyt6OHsLrv6/bCUKeD0wjq4sajGLyhFWp
         goVm7jt0ziK8CkDTlbJ2jYdiasO03FvD8899R81k0SnKDpyuhY/cjcplluU10gDL3hVN
         ufnfT5h9VEPPHCxRp0pzCq76jsVXTMjaG+dQ4bD1YrnJXuaOTqcJsXwgOUBaZ2JwhNzn
         dG752kkjtS65Q+FhVYyrJyPjTlQeFw0ukf6D9QIU6XpP9Bzy15JzTAths2Ey5dfJrNUl
         o2pg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791819311; x=1792424111;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=1cUO/H/Ma04E9qAVityxFd6ti5bE3hFLpDa4qT5O2ZY=;
        b=xspIcEwqPXarQ7e3jsU5PYxbtD0qy78TwYohXpT0Fh0fE4FHj2Agoq//50gHnsNPij
         wj6yhx6ZSUQmoXR1PpkP+SnsUFNPlyY1VvgHIF2EJOzQhwA4rQRrdj0u0eitc+uTcfGU
         rd6StYx+lm9egVM94xTKR/R9zh0VcQwIZUWhskKCEUNvzVJF90PtwJ0aJCI8zZN9DZkM
         RyylaAUgzbCZ4OrhDLzrTBOKbYmZTyLJxo7rdAtAyGqSvKVGTd31TOQ86ulzMwOPcJHN
         qo0IsuuTBRut6x1DV+KiHJXuaJiJ9bkd1fk/DN85e/ckK5+4FWiIahi73MVA8/cP/vU8
         YgHQ==
X-Forwarded-Encrypted: i=1; AKwUvByKxKGuVPg5QnmzoTa2lkK9q7UM5RBOKq/TDLena2f9U0cKxWv31LqVDcYHVJbB3LYh2Ot4lHUamiHl@vger.kernel.org
X-Gm-Message-State: AFq9FYId1J0Yn0mskE9tNej77g2vAM9cSQ2wtd+pRzPZUAE4LD6TCh5v
	D4eoDvRlii57wlb/RXrgMoDvAV/VMpDahSK6db3Hmgj4XiopLGbGskqvBTu9GF8cfsnSQTUri03
	LH9zvXt8cWS0gNe/u7zrOIOE8C75r17BZD/rzsYmQFh636ipmLp173YTG8vOrw5eh
X-Gm-Gg: AYBFou3x+8EVnJer7n7+uu5CrnGRzDTDlfprXQAQZa31SMdqzpGXCwRBjXYawFS0237
	oHcMbVfk5+1Yn0B3G1K8Vq75KJxbfK9qVMHSvYjjvuMgg9JTOnv9SAtv4dl05H9hO5KYI0rhBu6
	ivI3muNkjvUMv0u4z25K7vVKOaB9X/YuAWCc6RU8a9SlDgYYArWeimt9Dt8KbvTxfCdbE6uzO+I
	nMmGyaOGTK8cxq49PoMkJ88FYqz+FWjGCT4NRFJG9mSuy0VuESGULuUOZh7X8/O0cAx0iXsh8V6
	meU9J01jlOmDESn8O+yXxNJoFfWAQqeJkMs5Cwjw2TZf+oPqH7R9LGOkqMWRP/14pxQLmWW9htO
	yJvN4HmIP7uNLvZEPzSm8emytjl4Xq04=
X-Received: by 2002:a05:701b:4553:20b0:14d:5a09:5cd0 with SMTP id a92af1059eb24-16a5ed3d9aamr12748825c88.42.1791819310906;
        Mon, 12 Oct 2026 08:35:10 -0700 (PDT)
X-Received: by 2002:a05:701b:4553:20b0:14d:5a09:5cd0 with SMTP id a92af1059eb24-16a5ed3d9aamr12748759c88.42.1791819310129;
        Mon, 12 Oct 2026 08:35:10 -0700 (PDT)
Received: from [192.168.1.4] ([122.178.59.3])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-169a6021e49sm31244885c88.20.2026.10.12.08.35.05
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 12 Oct 2026 08:35:09 -0700 (PDT)
Message-ID: <18353f7d-d9e0-4e2d-aa79-ec6be0275e47@oss.qualcomm.com>
Date: Mon, 12 Oct 2026 21:04:41 +0530
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 4/4] arm64: dts: qcom: talos: Add EL2 overlay for
 talos-lyra-evk
To: Krzysztof Kozlowski <krzk@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20261012-talos-lyra-evk-v2-v2-0-dcc9316ebb59@oss.qualcomm.com>
 <20261012-talos-lyra-evk-v2-v2-4-dcc9316ebb59@oss.qualcomm.com>
 <9fa51ba2-5707-4d39-9038-c0983d138893@kernel.org>
Content-Language: en-US
From: Ruchira Revdekar <ruchira.revdekar@oss.qualcomm.com>
In-Reply-To: <9fa51ba2-5707-4d39-9038-c0983d138893@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDEyMDA2MiBTYWx0ZWRfX/gdR4o10c096
 y96YIUbETsWPcBLslPOrrzVnD1w+kaNwWCHAfh7ZeP6VpUqX/MmYHYmuNyeUVwOA2b1k/NyZIBY
 aEhzgkyT8uEp0V1KEG5rYko3s0LvqVs=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDEyMDA2MiBTYWx0ZWRfXw7DsH99SWHsB
 JPpBUq4WabrtfPTMluZCmBGH7coKxGvxxtnwAJ4tMMFdbMrqFIj3i0jYyKLBMuc7X5IraENJbk+
 IfBnGU31Ah9jJdyKGNEhDNjmH2oKdvZgTbuZU9VGm9hJrvvhP9e7iaksPhsH7PNjKTUiqZKTWiz
 zp4WkCq7UVBG880dhItEzB+rix0a2pwQMTuiPsSrcElcdsxFuxZKBE6kObJCpl+OS06kVYg7tqW
 PEhr+S65dADaNVR6uWHlHJfE6GNwhOK0joT3Qy+Z5CQrEhnhxDmkKoAHnwt11MCtvVlYJ5Du7Nq
 SLl2eErt8HLQ/YO6mnB2BzoOIUveTqNC2aI3SkGKAf05r/a51Y12wZWdg0u7ckf1bTPdcOnxFU0
 /XUQqG9CD4KsitIugailEiSO/nUFtDUTILnqX6kidnAe8CUCWSxJ/WlO3JgcWs6Cuq4MbWizgBs
 XA67YnHXv5gLYjNksaw==
X-Authority-Analysis: v=2.4 cv=C4p8WgP+ c=1 sm=1 tr=0 ts=6accfe2f cx=c_pps
 a=cFYjgdjTJScbgFmBucgdfQ==:117 a=n9yIFlGNEsxdxEAB/oY+Cg==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=EUspDBNiAAAA:8 a=KqQ6fI0hE-5oTRIwU9AA:9 a=QEXdDO2ut3YA:10
 a=scEy_gLbYbu1JhEsrz4S:22
X-Proofpoint-ORIG-GUID: L8YBLkSLrc7OhR-hmsb0ZF_rYCwG3u4N
X-Proofpoint-GUID: L8YBLkSLrc7OhR-hmsb0ZF_rYCwG3u4N
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-12_04,2026-10-09_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 priorityscore=1501 spamscore=0 bulkscore=0 adultscore=0
 malwarescore=0 suspectscore=0 lowpriorityscore=0 clxscore=1015 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610080000 definitions=main-2610120062

Hi Krzysztof,

On 12-10-2026 16:56, Krzysztof Kozlowski wrote:
> On 12/10/2026 08:16, Ruchira Revdekar wrote:
>> Add support for building an EL2 combined DTB for the talos-lyra-evk
>> in the Qualcomm DTS Makefile.
>>
>> The new talos-lyra-evk-el2.dtb is generated by combining the base
>> talos-lyra-evk.dtb with the talos-el2.dtbo overlay, enabling EL2-specific
>> configurations required by the platform.
>>
>> Signed-off-by: Ruchira Revdekar <ruchira.revdekar@oss.qualcomm.com>
>> ---
>>  arch/arm64/boot/dts/qcom/Makefile | 4 ++++
>>  1 file changed, 4 insertions(+)
>>
>> diff --git a/arch/arm64/boot/dts/qcom/Makefile b/arch/arm64/boot/dts/qcom/Makefile
>> index 2f25575e6efe..4f8ca3112fed 100644
>> --- a/arch/arm64/boot/dts/qcom/Makefile
>> +++ b/arch/arm64/boot/dts/qcom/Makefile
>> @@ -458,6 +458,10 @@ dtb-$(CONFIG_ARCH_QCOM)	+= sm8750-qrd.dtb
>>  dtb-$(CONFIG_ARCH_QCOM)	+= talos-evk.dtb
>>  dtb-$(CONFIG_ARCH_QCOM)	+= talos-lyra-evk.dtb
>>  
>> +talos-lyra-evk-el2-dtbs	:= talos-lyra-evk.dtb talos-el2.dtbo
>> +
>> +dtb-$(CONFIG_ARCH_QCOM)	+= talos-lyra-evk-el2.dtb
>> +
>>  talos-evk-el2-dtbs	:= talos-evk.dtb talos-el2.dtbo
>>  
> 
> Makefile changes belong to the pathc introducing the DTS, so squash this
> and previous.
> 
> Best regards,
> Krzysztof

Thanks for the review.

I'll squash the EL2 Makefile changes into the patch introducing the Talos
Lyra EVK DTS in the next revision.

Best regards,
Ruchira
