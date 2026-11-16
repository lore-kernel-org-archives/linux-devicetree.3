Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794794610;
	b=cRwIvWzbA18a9IwcyHRBZcEabvNVUx6sPaB1ZPwmT0gSyiAej00M5KHWvluCUqTMWWA1
	 vMrlyX7M7T6tCdtRAkI5h9gnJ6EcUktGKDtIgzlgd2+rLG2yyskLGUpRY2/o/LQ0w3FGy
	 0lVvSso7iN9eLj5xeTsdirEOaHjHD4j4rUk5sXzcQvxZ7cLhvkYjvJRE7xHAkdEVT0otA
	 cXi4G8KuVFPRiIAyptX0uIhH1Nk0jd31P49NjWhkndVt2Zu1Bwn89OKkpg/FOzlN2W2fF
	 C50F4ZOvyIdV8xyPdwi8SelYCEwfS6V4uIVILAtP7t80oQUcMsjgCLiZ8/YsNxMyryg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794794610;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Authority-Analysis:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=M9UeinhBxfqxsLlFJluuE+xqGWcUT3hi0lMKGG1MyGQ=;
	b=v2yDhAT8ZomGkXOU4/VYM5gc19EyDry5mLkHttXENQpABaBaNzZOw7lXPit5kAZ2fQqV
	 eG2SwulSKiXgz/oHxBGFqFOQcl0n4Gyt8UVRefE0o9fKJEBaociCryAw+74Wdwh3xzb8S
	 ToTuK3nHfsdxERSneS/rs9x7X/i2sebSawTY62aKptE3rQzyg1ZPSvAPYq5my9NP6tdYx
	 U8sDZORBhA7PQJWJELzqwwp6EUmiNoCA6wT6ZCS3f/BKgZQ2j4oACy5S3sg6voxmyI1Ny
	 6Gn0NJ2vJU+rE+rKz/SkqTq7DyuuqR8+EQxz/HBIkYNEV29eia5MagP8R6hs2gL+nYg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=N5ah1Fsb;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=NgjYcElN;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 21214606A31F
	for <devicetree@vger.kernel.org>; Mon, 16 Nov 2026 02:03:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 21214606A31F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=N5ah1Fsb;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=NgjYcElN
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AG1LNf3801061
	for <devicetree@vger.kernel.org>; Mon, 16 Nov 2026 02:03:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	M9UeinhBxfqxsLlFJluuE+xqGWcUT3hi0lMKGG1MyGQ=; b=N5ah1FsbeT0W4Wvd
	aQ8LpFyVl+juaE5h9YPvH4ymv4aBF0E7lV3d/Y6FbD1e+cpTzke0vlO4S1DB5BO9
	aEv/SsPShzP0YbNU5ggpZkOfKQx56WxIvGU9NlydHM1R9aJB+2tjSrx5R9WyDvhT
	6AdVPKZUkvYuh2+VifsxyoKfYD/D1mquEGIhisIek92rVW3iHYS/xFZ1TXAtP4mS
	cfBk6fC5pqHxbKk0UB4AOvMJ5EgJeKH+64++uz0deZ02T1beae6KPE2VaWq9MXd1
	UoMQyxF6plOaNGrb27jIDvcqpsnqgmQoYn2ke/kIFa+tNwn+DlKIsM7yJAmvGmuC
	FjmNdA==
Received: from mail-pg1-f197.google.com (mail-pg1-f197.google.com [209.85.215.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hxhmam8ky-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 16 Nov 2026 02:03:23 +0000 (GMT)
Received: by mail-pg1-f197.google.com with SMTP id 41be03b00d2f7-cdb8c46e240so1573700a12.1
        for <devicetree@vger.kernel.org>; Sun, 15 Nov 2026 18:03:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794794602; x=1795399402; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=M9UeinhBxfqxsLlFJluuE+xqGWcUT3hi0lMKGG1MyGQ=;
        b=NgjYcElNGrU9hqJ+ngd9s8FK+UZytN4cbCkcox8sAUoEyRsknRrWfO5NL9BoHJYaJu
         Ve11HLk6dz2EpHqQ+Msb2forsd3I5DGKAC88BnpKfztbXvoubLLI8GfrN3nKISD3Nd/H
         oj6vh0O4DNziane62f2HIqcA87odYNN/hmVohEUse0cABlHMkwyCM7B2V+6J5iCmLSg0
         ZrTz5VUjgS0hWMC4mSPpFV3hyZd68Dd6D04k3pgjLDMBRF6JzegRxl7T76T0Gaw38qNs
         Wlkpv4XWlkIZJGSK2o8zW5QPDccZqjOEEzL/O7VfknJXmrCg00Ccp3R2XH3YKUv+Lr9v
         mj2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794794602; x=1795399402;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=M9UeinhBxfqxsLlFJluuE+xqGWcUT3hi0lMKGG1MyGQ=;
        b=smh5O8F3tvb3Fq8gyWcC4daT1GJtMO+fykuVMfemXvaSjFRY5LQhp6wqroZMU0ADy9
         /u/ITbHV9DYWbOH63yfYe4EOOwUykfYbAZelC1VstEsI4OlVaWQMvDSMqWEpz6PjYeeB
         CSxRR///Kp63UzYRag8OF2UXYDEeEr4UDtV9wDVZ65NDvsEQJNei1+kjGvH7ncr/cfft
         JOn8qq8RlTpwOfRjVzX/vq5+HqIODbOFsujDOEm5tslJ+eGOhPk8JaRwWLlf0vkWlvHD
         cOAnsGGt5EH54EhvD1rGyPZeTX+uA88Jvbrbd2NtgPaMZ6UwctvRH35hg5SkkLIelPdF
         ZmFA==
X-Forwarded-Encrypted: i=1; AL+hErFWQOHqsYqgSnC9fGQdMVgSai4K7dClNI+L+Oo3ewEPQUocUrOczOMOTHMDRcqi+MqfwhJuhgoC6MeY@vger.kernel.org
X-Gm-Message-State: APuU4Z+RE+2Q8coA+0zFjqotlToFyglWYnn1Tzha5wiNHfeUZoDYLCMp
	MXq/xJkdqKTjNN9YCgD4WtdI9WGBvAn228kbhiAQ6PuEUNs/0a7xNFvAU9IM/URULgvmwijgj7I
	xe3YWg4rkgfVQwskitZmBbi6uI8kyFPorIGFVOKjpU3lsgMgWu6SHnOVYGf2eWZS3
X-Gm-Gg: AYBFou3L1T2L3YjS3uDZ6kNcv2H7KM4ZX6Z3oa2/5dt6Gr8Fag5joYXFUMApb6aR+QP
	4bsIX4Q48gaMTzWo5yq7ww+uKJ/wmrFxbFJRpNrd7SUzAJ3iS8YaAREbE8PwAZf2G5bYU2nner3
	pdK5hz0yaBrWRD/V0X+KUtyALwi6DHNOLWKKtYYaRDJhg6eV1vAF2fTTMBvALzqxBlvUrSUZFal
	6sNmC+GB4hsXaVjPrnDnCda9AnO2j4oZ940N5YsJbiCTHeerUn9bhC+nQpWVQWnZhMUhaAjNC+c
	8PiIhItwrL79Sa4xH2VjsWwFKiXFEmhTTwKSZe/EVwQnZBEZ5wV56Q96zPNVobnRGC6YaUs3Rbw
	bYBhsxmEC9vsu22WriYcjpcqfD+pC3awGoByjcPS8kTPwy+/9ELLFqNQvGYRoVZFt+tv9pSteV3
	U1fKKyyMfPu/iPBtiEc5PQf94HqH649HmA0izN
X-Received: by 2002:a17:90b:3f43:b0:3ad:43c1:7d41 with SMTP id 98e67ed59e1d1-3b1b0b531b1mr8635793a91.33.1794794602525;
        Sun, 15 Nov 2026 18:03:22 -0800 (PST)
X-Received: by 2002:a17:90b:3f43:b0:3ad:43c1:7d41 with SMTP id 98e67ed59e1d1-3b1b0b531b1mr8635767a91.33.1794794601836;
        Sun, 15 Nov 2026 18:03:21 -0800 (PST)
Received: from [10.133.33.28] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b197d257a0sm19748961a91.11.2026.11.15.18.03.16
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 15 Nov 2026 18:03:21 -0800 (PST)
Message-ID: <e0e07848-361d-4977-a585-a0810452e150@oss.qualcomm.com>
Date: Mon, 16 Nov 2026 10:03:14 +0800
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 0/5] Fix traceNoC probe issue on multiple QCOM
 platforms
To: Leo Yan <leo.yan@arm.com>, Rob Herring <robh@kernel.org>,
        Suzuki K Poulose <suzuki.poulose@arm.com>
Cc: Mike Leach <mike.leach@arm.com>, James Clark <james.clark@linaro.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Tingwei Zhang <tingwei.zhang@oss.qualcomm.com>,
        Yuanfang Zhang <yuanfang.zhang@oss.qualcomm.com>,
        Alexander Shishkin <alexander.shishkin@linux.intel.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>,
        Jingyi Wang <jingyi.wang@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, coresight@lists.linaro.org,
        linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
References: <20261110-fix-trace-noc-probe-issue-v7-0-2f06905c77fe@oss.qualcomm.com>
 <20261110154643.GA4159803-robh@kernel.org>
 <20261111204322.GH9176@e132581.arm.com>
Content-Language: en-US
From: Jie Gan <jie.gan@oss.qualcomm.com>
In-Reply-To: <20261111204322.GH9176@e132581.arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: 45McgWm8x0forLHg5Ubj8sDCbYkfUUHB
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTE2MDAwNyBTYWx0ZWRfXwuy2tCVtpV0V
 NXRdPNJKHYVA1GnLVRoFOamODUNHDNczlUtnRFN3v84S1y/AQoGNNSwKNVDs3p2PP3yzi1ntsAW
 qCL4LS2UD9Ec+sjoeI2wLdwO0XxGst5Lq78ZnA+dihP77v+a6TGdQ+FsZlUJ49WmdEXu66H34r5
 1f50CPmdhvvUQxnwGhOX1oWtvuk265PV8KTR4olhRRcc+eXOMzj/iJwc1CYonND1VQxLSfqUUZu
 H0c0nuS+Ep7Yc3J+g1vFDoAV+EuqTi/fxHeka7ppVIR99NarSfyR4lv3I8UUezB83oH/w5QXZ5u
 uJQsFfijTaLVtZY+yd6EKVa6BXoNCza9UkHMnOl5Y8p/ZGjzrkzTB0UOeX2v1K3UcyxLOsmAnm/
 FPMAde7eAEY97LxpKFSszhtTw7KsjqoN2goYGm9dqUDmUXAWlMPIEqYw7AkMyhhGktupJV7tAFG
 NqW+jROMeeAFrwIOsdg==
X-Authority-Analysis: v=2.4 cv=NdhzRGD4 c=1 sm=1 tr=0 ts=6afa646b cx=c_pps
 a=rz3CxIlbcmazkYymdCej/Q==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=9Yhdbyfe_LZq1WiuscQA:9 a=QEXdDO2ut3YA:10
 a=bFCP_H2QrGi7Okbo017w:22
X-Proofpoint-GUID: 45McgWm8x0forLHg5Ubj8sDCbYkfUUHB
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTE2MDAwNyBTYWx0ZWRfXyJz82MNpDIj+
 WIZCLvpf01NbvpM/CMNJSqt7r5vmkIwWTeIuESwE5kUctnldn1nktC/6/zNwPUxJfatFBv5e4cT
 Jpx8fQFsZhDlbDBSBfBkXZGCCDa0CCA=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-16_01,2026-11-11_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 suspectscore=0 clxscore=1015 adultscore=0 lowpriorityscore=0
 spamscore=0 impostorscore=0 priorityscore=1501 bulkscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611160007



On 11/12/2026 4:43 AM, Leo Yan wrote:
> On Tue, Nov 10, 2026 at 09:46:43AM -0600, Rob Herring wrote:
>> On Tue, Nov 10, 2026 at 09:21:13AM +0800, Jie Gan wrote:
>>> The CoreSight TNOC (Trace Network-On-Chip) binding so far only allowed the
>>> two-string AMBA form "qcom,coresight-tnoc", "arm,primecell". That form
>>> forces the device onto the AMBA bus, where the driver must read the
>>> peripheral ID from the device registers during probe. On several QCOM
>>> platforms this AMBA peripheral-ID probing fails, so the traceNoC device
>>> never probes and its trace path is unavailable.
>>
>> But it works fine on some platforms? We have a property to override the
>> peripheral-ID which would solve your issue. That would be much simpler
>> and avoid the ABI break on any of the working platforms.
> 
> Looking back at the earlier discussion [1], Jie in v2 already proposed
> "arm,primecell-periphid". Questions about AMBA IDs and ATID handling got
> mixed together. The series later moved towards platform-device probing,
> then became current shape.
> 
> Hope we make the right decision on arm,primecell-periphid this time.
> 
> Anyway, I'd like to apologise to Jie for all the back and forth.
> 

Never mind.

Hi Suzuki, Rob,

The "arm,primecell-periphid" override is the simplest fix for the issue. 
Which fix are your preferring for the issue? If we want fix it with DT 
property, we can revert the patch series and I will post a new one to 
fix it.

As Leo mentioned, the AMBA probe is not affecting by the series.

Thanks,
Jie

> Thanks,
> Leo
> 
> [1] https://lore.kernel.org/linux-arm-kernel/9432df20-08bf-4134-b4b9-e6b5d618af81@oss.qualcomm.com/

