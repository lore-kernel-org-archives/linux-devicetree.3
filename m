Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BE55C3783AD
	for <devicetree@vger.kernel.org>; Fri, 22 May 2026 09:30:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779442247; cv=none; b=TYpLe1TIe5fK/EZ4WvW6bYj6SD5g+KcW6Mk3iyR4O2s+fgI0c4wPemp1GXPcVydD0qXzN5/TMJs+gsagAkv3jzrUhH+WMCHZwqe1NShwLhQMeOnRXm3M/3BKTPjmRXI9/aOe6/XhpKkEb6pibJaHLl7GoE8q1e/0EftrEL2kuhM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779442247; c=relaxed/simple;
	bh=UMQAUsNjrWcfUgwwUpJCdT7jtfG0UQMZ4o+VMv4vPP4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=mtAtHAHkmLCDBfmgDmuXYO5TYvAHYmyxtGgmNIeZgV3weU+ZZF9TGPIplQ3/68hsKfGPkdv704bGUPAA8Mzacfzgoq0yQpp02Lir4p0dP4+1VdZne97cCf0O18YpntoRWMoUCEty43BAVmpGo5AYi5y4AkWYjohc7ReNHpE7BB4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=nVYZtXiQ; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=GGryQmYV; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="nVYZtXiQ";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="GGryQmYV"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64M8iZE7399145
	for <devicetree@vger.kernel.org>; Fri, 22 May 2026 09:30:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	SAIFtLKu+vGu7qZ4vvvbMM2OnE0zcwInjzx49aFw+LY=; b=nVYZtXiQ7bPKs9JU
	L/Dm1Vu1Inaa3e5LpuE0rsL+xzZx3YPGYjgVTvI1NinUIDLxIWtCUAS1/SKnjJGP
	Vl1hygkZZQR8ErHB8PO1uqQAZVra/7hlp3GVyZM5ELwSIlAWDRJWJgTMsI/EKCJ3
	yXeFw5CuXB3iXECJHPzRk+gKTJV7c/rkpb32wAN0mPz6LRDNVMG5AB6A+m8ES9Ew
	5DV84k5Hsl0iDasSeiViQXwamBuVP/DVrNzeX42tD7CvvxGwQ4D9WgwCIfx43nWB
	NStIeeFf6FwxMuxsc6WeALicntNa28jB2pWU1VIXTBPoF0Q737kW/VReUQk/QXiy
	IDc7Aw==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ea5p9unbc-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Fri, 22 May 2026 09:30:44 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-367f715cbd0so7252516a91.0
        for <devicetree@vger.kernel.org>; Fri, 22 May 2026 02:30:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779442243; x=1780047043; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=SAIFtLKu+vGu7qZ4vvvbMM2OnE0zcwInjzx49aFw+LY=;
        b=GGryQmYVOeBYeaPkVULnB7TamhkP+thOcAZVg0jwEsxqP708G0vH3+/kf3V8Yd0OOo
         r0WhzjLmpR6kaVdaVnehs1dCu36cudyVUlSzTPiIFh5Fc53wiyVrcO+Bl/NBYdSCUuM0
         UTx+0I4akzXVh3UDmUtydPtakpM0DsfdHY1sXxTJkuK6ESS1z2vdryoPCz23+uxRWQqX
         LtzHzCsL3CkLQJAviQdajk71nRfJqhEuBWk22dcDyushGAn/aTFnPOr0AclmdOBwm4xi
         4PWM6xTpI0WN+5fmSvGy1C8WOUnTfX3l/i0lkyiykrl7ZO/HNHLPtIUkCPSU/7+6Sx0N
         Pvvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779442243; x=1780047043;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=SAIFtLKu+vGu7qZ4vvvbMM2OnE0zcwInjzx49aFw+LY=;
        b=UtkYDYZ4bpxt4F+QQw40p3t+LFP1ycJd+xjJ40p4wSD1e8FbfjiqGEsv5ig+HaZdHe
         LgEMXEtUcTegsq0uLaXE7rWNIcQHee56QUe8CyzFGscPcmcTLJvw22wTU65h9YAndtxQ
         qx1gKJXbU4tqsUgzmNRLuSUB6H3LdjEATPZTyRi1Gvy4o8PbHAwtuszNh6RTHpurW1Pc
         u76eF/5K93Fs+qfHFRDXGWWjW47r3EfinOtW50hcsyk2YMRK0M9Z2eNs2wBTqmk514t5
         q3UPvMrpvD0T1B+sruvYBthbNSGH8cwCBxBvY/qOK0bb2bxRbJIauu18JdkzCdH3MjFv
         ho9g==
X-Forwarded-Encrypted: i=1; AFNElJ+yj7s5dj+b589rK9I7BCKgaGYx102Wn6+UC4g8Vd5ZDavmYjegcyhDGjmsu1u2g3jkpebUcjrLtIWY@vger.kernel.org
X-Gm-Message-State: AOJu0YyPFw9MU25lhNwwF9lhf+kuRWSE1I5iU16yWoHGpMWJwUgKP9A1
	vDfu5fNAtudb5gUifFcsRdySHuBWL3YbS7SqN1IuE6+2haDAwG3wR27XhAGxXL4SEKjPxkVk1py
	U0YYlSHxDmmMPLwRBgX9dY5AxMBs87EyHR9Qo8fX+wuiWJnRuFoa4rShMurXfd4Qh
X-Gm-Gg: Acq92OFP3Uehj29dyBGMSyNs3FmNgJ6dTUCcGXDhxTF043YJM/qhz5VLBjyaEZ7zWri
	0YkhTzPIzX/t5LLkkISmj6YGnq2PACJK4Cm0kDW1mySlOgkMyCZ3gD1md5dr+/8NxnvUFhZyb8+
	CH3MUyhQdnwro4wFKHPhlK266N5NXqu4UtO8ZixAG/gvzkK5Y2pYNgSV3qmzTGAiWvd5w7RySpa
	gncfcL9Fns4IdhkoRe9rpiGll6ZTJ9bysAZs9suJlkW0kmmteTl1eSaXZ6VCiUluYnEGp5HBSGz
	hfkZpT6my7y1RwtK6rM7EWWmRwrvzYmakZRc2vOtz7RzFssnOp501cvx+bJf2qn/zwN/9ihDQII
	YT9bZf6vrdyvxXXj/G3y/RswxwlKw4ateeg1ThtSIjB1zI367OQKCA0Q8YFk=
X-Received: by 2002:a17:90b:564f:b0:35b:e5ce:73bb with SMTP id 98e67ed59e1d1-36a676f5108mr2537005a91.1.1779442243295;
        Fri, 22 May 2026 02:30:43 -0700 (PDT)
X-Received: by 2002:a17:90b:564f:b0:35b:e5ce:73bb with SMTP id 98e67ed59e1d1-36a676f5108mr2536970a91.1.1779442242763;
        Fri, 22 May 2026 02:30:42 -0700 (PDT)
Received: from [10.218.5.114] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-36a723cf27csm1400022a91.13.2026.05.22.02.30.34
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 22 May 2026 02:30:42 -0700 (PDT)
Message-ID: <b9d6d3b8-ce3c-4179-8e78-fc7494ba322f@oss.qualcomm.com>
Date: Fri, 22 May 2026 15:00:31 +0530
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 1/2] dt-bindings: cpufreq: qcom-hw: Document Shikra
 CPUFREQ Hardware
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: "Rafael J. Wysocki" <rafael@kernel.org>,
        Viresh Kumar <viresh.kumar@linaro.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Manivannan Sadhasivam <mani@kernel.org>,
        Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>,
        linux-pm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org
References: <20260521-shikra-cpufreq-scaling-v3-0-883c13d1e514@oss.qualcomm.com>
 <20260521-shikra-cpufreq-scaling-v3-1-883c13d1e514@oss.qualcomm.com>
 <20260522-massive-hopping-oxpecker-d9dcca@quoll>
Content-Language: en-US
From: Imran Shaik <imran.shaik@oss.qualcomm.com>
In-Reply-To: <20260522-massive-hopping-oxpecker-d9dcca@quoll>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=DKm/JSNb c=1 sm=1 tr=0 ts=6a102244 cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=KaersKY4o62IQMGDIjUA:9 a=QEXdDO2ut3YA:10
 a=rl5im9kqc5Lf4LNbBjHf:22
X-Proofpoint-GUID: Wy-eE8qb7E_0btnCz9cII3E6Fll5-_T-
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTIyMDA5MyBTYWx0ZWRfX7LdDhFnHM5tm
 Q0V5teRJhFFKmIDVyxiwzIKmmrS1vv0uK+gSXQmzEjgm0S2N07PdrvefD5TrDZroYHcTe+23NEU
 2Tb3XEFXxb5KyXJWndXAnUgdnxQC3Ui5EKGXnHd3j2lMCx6Ln+dkPp9j2wsdrWtm9K6tcCYVgKt
 2ixBuJVRJr/l2x47ZAr1oVTHDvlM51DiDS2mdtP5rJdxuZvdTvybjILE8DYWOSzH0Ypq7uf4lVy
 AT6xK/14kFO7BX7556qI0wx9KFYetM0Cd2Siq629xh2DlUmI4aqHI4AsW1D4oKhpaCeZWTLjlW4
 0BGWqoSt0/WfufXQkUstl2b5TH/Ix7bM/CYBZ+bJJgWot/KDXBp1Rir7K93K8w6dzb2IXvbIPFg
 8bS6W717UCcv7KYYzOzZKKfcZ+/Lrv1z8kRPGg19IuEM+Hzow6qhmkFYbqta8GZ98wuPK1F5x/n
 zmJPS68YX2XVH1STpRw==
X-Proofpoint-ORIG-GUID: Wy-eE8qb7E_0btnCz9cII3E6Fll5-_T-
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-22_02,2026-05-18_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 malwarescore=0 spamscore=0 phishscore=0 suspectscore=0
 priorityscore=1501 clxscore=1015 impostorscore=0 adultscore=0
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2605130000
 definitions=main-2605220093



On 22-05-2026 12:05 pm, Krzysztof Kozlowski wrote:
> On Thu, May 21, 2026 at 07:36:04PM +0530, Imran Shaik wrote:
>> The Qualcomm Shikra cpufreq hardware is functionally identical to EPSS,
>> but supports only up to 12 frequency lookup table (LUT) entries. Introduce
>> Shikra specific bindings to represent this constrained EPSS variant.
>>
>> Signed-off-by: Imran Shaik <imran.shaik@oss.qualcomm.com>
>> ---
>>   .../bindings/cpufreq/qcom,shikra-epss.yaml         | 96 ++++++++++++++++++++++
>>   1 file changed, 96 insertions(+)
> 
> Please use subject prefixes matching the subsystem. You can get them for
> example with 'git log --oneline -- DIRECTORY_OR_FILE' on the directory
> your patch is touching. For bindings, the preferred subjects are
> explained here:
> https://www.kernel.org/doc/html/latest/devicetree/bindings/submitting-patches.html#i-for-patch-submitters
> 
> There is no "qcom-hw" schema, so no clue from where did you get this
> one.
> 

Actually, I picked the reference from latest Eliza/Milos commits. Will 
drop the qcom-hw prefix, and update as blow for Shikra and post next series.

dt-bindings: cpufreq: Document Qualcomm Shikra SoC EPSS

Thanks,
Imran

> Best regards,
> Krzysztof
> 

