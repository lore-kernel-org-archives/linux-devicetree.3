Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 29A3A3B47C4
	for <devicetree@vger.kernel.org>; Wed,  1 Jul 2026 07:16:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782890206; cv=none; b=qO8eVjayx9pFdCFUSKRogf+ww7IWw9E9nxv0ngMtvFL0kJy24Cfvgo1z352bU7FJi+OGNkNR7rTjbbr1AbB3N5ylSnRYSqzxaJeYQUj5utvZv7qO+wR7LAMtHVqsE6h2WYzgJU3oEWODKTHpp1X7FMNrJc/PBOeRxEp4e63ye1M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782890206; c=relaxed/simple;
	bh=/4LKNeeme3NOffjPb+nNorikshAcZgsjaJkeEGGabWc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=gUx6ddMckwfXDerlsA8x3aLwhCiXFSx3IV/PqL479sTUOK8D3Psk8hlDYoiXsMpSOA96jv8QEVj7TdRaZUnOde0MlgEMP0BhyMGTh/X/JqVkN9K/3J/q4AJaFpnHYLSXkHm7iJer4FeozNit07rr8QHxZrDw42xGiHtUl92NU9w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=jMSYWtB0; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=GRM3Nvrm; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="jMSYWtB0";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="GRM3Nvrm"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6616qS2B279938
	for <devicetree@vger.kernel.org>; Wed, 1 Jul 2026 07:16:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	X2ckU9DLLAn5LdB48ZpPiIGBrsJhbpkMqNXUETVARFk=; b=jMSYWtB0xETMBELT
	d64Ood69eVceW3Vdxt15j4LqwyEWsYWoqWGnw8R8F3TaAsahMnkJpT0NQUQ0AEus
	1JCqvf0I1ceGHvNYvCLZ8mrj1efo61wSNHxLloP6QB1fhM7vE55E7FCAEWZBFcEd
	tDmI1ZWCU0iqq+9OxAKA9jXigt6WYrT3SjqPhDriM5WQUYsuAkqH6Tgo+60QKiTY
	sGK0oTdchz71fs1Z86+9eXNvGy1maMuHcu1RQbiH9WeE4j203/excc66O68+3gWM
	xlj5uaye/sN1G6ksa00MQzR+Vh3zSFGbx5Wy7wqwOctaVl2hD6CDVicZIOv/5ja3
	+powzQ==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f4x0tg4h3-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 01 Jul 2026 07:16:40 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-37fca5f21b1so1093827a91.0
        for <devicetree@vger.kernel.org>; Wed, 01 Jul 2026 00:16:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782890200; x=1783495000; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=X2ckU9DLLAn5LdB48ZpPiIGBrsJhbpkMqNXUETVARFk=;
        b=GRM3NvrmNBPhybpR0HpetIRaWOJV67lYAiVcqIKaoDflJQkNwgstbH6EE7qcGxCAqs
         DTw0NVbTainZzcrYla/4hIxYqXAZlYBK/+Us8ipU1k+5U4Ajcs3zW9M09odFCyhiSMJB
         XpuAz/lD2HtN8SN/sBV1XTICi4x1L9E58KW+ypc0Eyfi334Hesjjt7Bx+5BsjTTBsPCQ
         ojRMqCgLDflr3XAdZAvAWhpMTyY+QC1MrdFL4eTm+YSPUHda/Slg/4L1dt+yF8OAFf+o
         4WRAOVqnm4bQtCMyeJDZ7k9J8jClzsmMrW+gW0G8cny3eIOYQM9GycPpsR+Un9u8bUI1
         0mqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782890200; x=1783495000;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=X2ckU9DLLAn5LdB48ZpPiIGBrsJhbpkMqNXUETVARFk=;
        b=NAV3/uGtVu2uLZV/9gpk/DUuhjEPNZEIYF8co4IxdgGMSzX+/ZfSoYD+DxTk7dekTS
         6tmmg5f3gIpi5zMgFWxV+cgwU5nEFGru4acQP989RtZGnTwFtZ6YceJWXJ/aejs39ZZl
         8eoaAqsv1Q+vNa/X4nWRFPbEOcn5QuNoibzuZJxpuF/0wjZtcyosHmXYasSVoDylC0kG
         fdWQvx5emtHUF+ubEdArWbfiVSczyloj6EnpopTzOIit7wkbsaAq87rARmTipGb3hM3a
         18T+p8aY/KZOffUSswz8XwgVxnb468WwVhdld7m65U0jsqeOtgRvlV0gclo7Xa1NyuUO
         Gpmg==
X-Forwarded-Encrypted: i=1; AHgh+RptWIfV78BjLBSA/2fxNvup1/nAg1OXh/os0LCRAJs+I0RJnHlgvC/KzGvU5tKttx/zmhIajRtKr/j9@vger.kernel.org
X-Gm-Message-State: AOJu0YyfTmn1IhL8h/IOFmNd3ZSJ2DAlHNGYADBeeYn+kt59DfnbloWk
	mNcTpGzeXPCFf8rCKt0v/LJBg/+d7gdIdivLEaw0hoWCvlUvGbNv0jgbFsvRp2rn7oy+kWrrrx8
	edBRNg2/Loh1qXeKydTGz/wB2rwAxoEsxpzb3SVc1RtvGitG9GWt9Haj8x4nhYm+5
X-Gm-Gg: AfdE7clCKIrBugWzcKOyXpF2HIY9glNO/P9EWsHDm9aqLMfYdA/52v8NqU8ipuq5gFH
	60bnDtNZXOIy35/SA8XHtprw0xpsold8FmI8w0qpeGyFKIb2P0QB00L7n7zqYWOW+XwiP5nRpXu
	8k5NRCuGdM+yHEASjeYsxYVlvLdIEjopngf/IKFLSg4WDIRjziDvl7hDGhjmrHSdWjvIP/QInIM
	cp+bbZ/irF9UIWp3V07Mr89ojRQP0o2xfnanUnojhvuDrBT1x7wIxNHsPrSeT/VLUb8djeY8BwS
	bghmWecHprV+O4T1ipWglj33sGbYFMqNlqJVpzq3aysDh/7e0SKsVAiIjvRP1XGxC1rvtNU6cjE
	xvz6q/Hmud98vXmuIEjo6yeOFfZlL0HYu379ooTj36oSUdorcPc6+f6YuFB/9Ul0w3rP4dGJap9
	Y=
X-Received: by 2002:a17:90b:1d49:b0:36b:b903:994 with SMTP id 98e67ed59e1d1-380674340d2mr4032526a91.4.1782890199814;
        Wed, 01 Jul 2026 00:16:39 -0700 (PDT)
X-Received: by 2002:a17:90b:1d49:b0:36b:b903:994 with SMTP id 98e67ed59e1d1-380674340d2mr4032489a91.4.1782890199337;
        Wed, 01 Jul 2026 00:16:39 -0700 (PDT)
Received: from [10.133.33.76] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c9bbcd9f5acsm2795438a12.10.2026.07.01.00.16.33
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 01 Jul 2026 00:16:38 -0700 (PDT)
Message-ID: <4117c406-0d75-4eb1-842e-1d346b7fbf99@oss.qualcomm.com>
Date: Wed, 1 Jul 2026 15:16:31 +0800
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 1/5] dt-bindings: arm: coresight-tnoc: Add standalone
 qcom,coresight-agtnoc compatible
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Tingwei Zhang <tingwei.zhang@oss.qualcomm.com>,
        Jingyi Wang <jingyi.wang@oss.qualcomm.com>,
        Abel Vesa <abel.vesa@oss.qualcomm.com>,
        Suzuki K Poulose <suzuki.poulose@arm.com>,
        Mike Leach <mike.leach@arm.com>, James Clark <james.clark@linaro.org>,
        Leo Yan <leo.yan@arm.com>,
        Yuanfang Zhang <yuanfang.zhang@oss.qualcomm.com>,
        Abel Vesa <abelvesa@kernel.org>,
        Alexander Shishkin <alexander.shishkin@linux.intel.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, coresight@lists.linaro.org,
        linux-arm-kernel@lists.infradead.org
References: <20260701-fix-tracenoc-probe-issue-v4-0-aefab449a470@oss.qualcomm.com>
 <20260701-fix-tracenoc-probe-issue-v4-1-aefab449a470@oss.qualcomm.com>
 <20260701-stirring-piculet-of-vastness-a361e5@quoll>
Content-Language: en-US
From: Jie Gan <jie.gan@oss.qualcomm.com>
In-Reply-To: <20260701-stirring-piculet-of-vastness-a361e5@quoll>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: pBthRgKVoy5NC6ytFtsSHj02a0FoXier
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzAxMDA3MyBTYWx0ZWRfXzXw5oCpWQHDx
 1blye9LobFUywuF1rsagunzb6xi96fwZws7TTYJxrX8h23l2aCCf08O05Xm5YZhwH5OhHkdF61X
 yRorVXJe4enLpCvgJoGOr3tuw2qDt1A=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzAxMDA3MyBTYWx0ZWRfXzW0uexfOCvS3
 bfOWmaGdtAOiT5Stlli8rK5ZAfhyv387Q2w5z2APPLNw3rLCsrAIGbEWfuqQsTmYhjSlO/RfBI+
 DQ5EB+TKhHZ5LJpitQo0M+BrCyrAhU8bRXzUhrRUC09F4A7HTG2ZZi4xDhaCETu7j4l14PQXEaT
 MuyBk8Fb1YVjXXT9WZs06Hfhl3egBc3oOjFLc0LgbwxpjZvSbKAgGLUIMivQvE3739aWPxZDOa2
 dF4QBqiyeCKCtnXEuUbey4L0Bk7EnFyjueNJ6F+segCn+0aN3SizxrviTy5RPKUi2BHcOKgHvQ6
 kPXxl78WrGW5ToQbc1vmPfuVMDUcJapHS2CerPhF0/YfyVa2tUP0oG7/xvDJohOvY8chqujMouE
 woUdEx/xYq5d4nUCj8rLpvJU32LlipVlcf7pWQipsdHvRnStDiMp7oToHkWWVcGJ6C3w43sqRTg
 fmHoVOCX9uSHBAispDA==
X-Authority-Analysis: v=2.4 cv=T5+8ifKQ c=1 sm=1 tr=0 ts=6a44bed8 cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=GqxzKewt3drvE_C864MA:9 a=QEXdDO2ut3YA:10 a=rl5im9kqc5Lf4LNbBjHf:22
X-Proofpoint-ORIG-GUID: pBthRgKVoy5NC6ytFtsSHj02a0FoXier
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-07-01_01,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 spamscore=0 adultscore=0 lowpriorityscore=0 phishscore=0
 bulkscore=0 clxscore=1015 priorityscore=1501 malwarescore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607010073



On 7/1/2026 2:57 PM, Krzysztof Kozlowski wrote:
> On Wed, Jul 01, 2026 at 09:53:41AM +0800, Jie Gan wrote:
>> The TNOC compatible previously only allowed the two-string AMBA form
>> "qcom,coresight-tnoc", "arm,primecell", which forces the device onto the
>> AMBA bus.
>>
>> Convert the compatible to a oneOf and add a standalone
>> "qcom,coresight-agtnoc" compatible alongside the existing AMBA form. The
>> standalone string carries no "arm,primecell" entry, so the device is
>> created on the platform bus instead of the AMBA bus.
> 
> That's a Linux driver specific reason, so not a valid one.
> 
> Describe the hardware instead.
> 
> Also, you do not get other compatible for the same device.

The device is intended to be discovered and probed via the AMBA bus. 
However, due to a hardware issue, AMBA probing does not work correctly. 
While adding the arm,primecell-periphid property would allow the 
existing AMBA driver to bind, but I think that's a temp WA. As 
Suzuki/Leo pointed out, we should not add the property to pretend the 
device as an AMBA device.

Instead, I introduced a dedicated compatible string so the device can be 
handled by the existing platform driver without relying on the missing 
AMBA primecell identification. The purpose of the new compatible is to 
clearly distinguish this platform-specific case from the standard 
AMBA-based implementation. Or shall I re-use the existing compatible 
"qcom,coresight-tnoc" as platform standalone compatible?

We already have a similar pattern for the interconnect TraceNoC device, 
which uses the platform-specific compatible string qcom,coresight-itnoc.

Thanks,
Jie

> 
> Best regards,
> Krzysztof
> 

