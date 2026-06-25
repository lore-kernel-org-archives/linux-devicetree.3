Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F11A913D886
	for <devicetree@vger.kernel.org>; Thu, 25 Jun 2026 01:01:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782349289; cv=none; b=nbW5Z4m1rGvW/EfZhzAY4ZY1sNS4/NRcyPiCfEnstUbXZdV4UXs/d+Cek2juM3bS0668hjfaT2AztF85VQVh+pT7Xodi2IJKM5k1gfoRRAciRzjhGMxKSX5Vbm/mnjTU86+BIJ356jDdJRLie624of7TbxqZAMbhYgD2s3qcHQg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782349289; c=relaxed/simple;
	bh=vLTeuALGLVem3atvJ6Rr7ZIJuSU0nlwaxwJE5U04Emc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Bm1434nh8tiZWvGCZuqi1TPbV6N+1H0FVGIgwgRSw4glfTIZpDjxC8ZWG5glG4uFBUlN0jbRv0yL/IjObAVEL0JXpe+4ks6crPJoviXBnmfthyHWck4+7uwmDUntix3lHxbDt3BSmGsxzsf3abrHb8pYh/htnuzyqCxy08bg+cQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ZvA9h5M7; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=LX/4DRt6; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ZvA9h5M7";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="LX/4DRt6"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65OLqSek166097
	for <devicetree@vger.kernel.org>; Thu, 25 Jun 2026 01:01:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	k9Nczp6ZPD9k3X0chhFsGz8D+YeWBBIoPg1GZIWffTM=; b=ZvA9h5M7xX7s9iOu
	5kdKGdO3Uprji+67EKohMHTyzZL3cqzFUQYDNDaD7aep3vQmeeFn5czi/BBmkPaE
	6lkwreJDTBey9OUM/9KzVVNkyuUmK/szGOVgQQkyPE2a4qosqOjpbPWENsM/t5C4
	/MCOR09Z5Nt4GysZckZrQSzrE3Z80uWbezJu5y8mAPyG3yxwGjV/1nqZMJ74Kn5i
	FreDKnT8shxu5fXAg3aqNHKMZ8L7z8PM0BTPLr/PVXprudx4vHIij6RrxXEVGLby
	ajyNE9BH1w9sxBQ02LABObmurXrirLDVJ1xfBRxpTFk19KtjavxTbA+7XhqY83KC
	30FIFA==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f0j7dstpb-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Thu, 25 Jun 2026 01:01:26 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2c2d0a8b5beso13888895ad.1
        for <devicetree@vger.kernel.org>; Wed, 24 Jun 2026 18:01:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782349286; x=1782954086; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=k9Nczp6ZPD9k3X0chhFsGz8D+YeWBBIoPg1GZIWffTM=;
        b=LX/4DRt6LI6HlRyPYN5oUnz/fX/r7Oiefab0tHPp5iK7aSdkk1ax/xELhaAKQEyKTi
         WikZj7v270i1xEbtWmLHd6/eJ2hEA0ZGn1eJnrIYAaEMbnRLNj5JAto+QaAdrfy8nqIV
         CDQqigQYu86TGapdIrpJMlhFIkXIdNLc7lgu0tJ6SGr9afhof+dcOejohaf5U0fhHtsw
         olnO8fcSBNdAMTKIA+uDreM8aiGTlcw2ZSRbapaQHPp+0LZRV5NpUMegF0yXvpGfZ3ai
         QcWgf7P4SWWJfMb0ljRQ9C8RzYVRramGUmcqi23+CxIhcimv2dYlMWl3a9m+YLHaO56S
         JXdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782349286; x=1782954086;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=k9Nczp6ZPD9k3X0chhFsGz8D+YeWBBIoPg1GZIWffTM=;
        b=ORpazVLRl0NKED2g7gQiSVLnqwF7V+wfyz0BsAVcbOApAsRXeUNXtq+SM9BgsatvN4
         m2dsAlD4xZcpqQ081i3lHLQ89KIuQ6WT+mHJy55LZAcBO92SeK8WDD13+cZm/bGJ6ka1
         2QtOablypmJ9WKl+wNx1xjK9BBZ5O4pFN7MTu5AY3fSBuB7RbK81UYniEs1Uhsb5DDDr
         T0SvDFLMjBMxpaUKTUc2XQSetW5suDeqgeMfZqljB8dN23T8Rwk0wt4KSovwzncvLSmg
         tKAAkjYYunmyZHvspV6Yk1x5f+0QY4zgtPs2ZBW+xPYLFXThWki8Vp2af1s2l8QdY2wB
         q0lQ==
X-Forwarded-Encrypted: i=1; AHgh+Rq1Of8DfJgIP9TYtLa8ki+31Hud9i3+SO5ba7aqFv3H/QNDaTOLDYOq11hUMyIpcDIEwIE4EY8mQNtC@vger.kernel.org
X-Gm-Message-State: AOJu0Yylxk/1KC5iB6UWVGwLFyIT0HFNniY1DY4RvRm2ADMrNB1N3Ztn
	mKNtP5ZjzsYPudr9Nmo/EfrB+3Tc7fFLTL1mezqt5RNEt0KFAUq1kCUVvuWsgmKMWAXdOrwRPid
	iWUhLD/Gv2XKBV9eR39KqAOFK/EjKlGYojORGIttkxqIEp6SfYR+49JZa+mrDeQTv
X-Gm-Gg: AfdE7cm0t1lqE1AweeHV7bDrVSodlgiqZ4LaYK+ykcEaAg6e9RwzeMJ0/HCxg7/yFXv
	vmtId1H2HeTQrnM75JWkbV9CT8I2oxzHagTYLbUbtk/8H9bmb8MUaUpOmFnAi8Rm3VRPdFcR0Qa
	Oe8DCYcr46jF9Rf5kYldJw0VdVv6J5VaGqPQKXOwHpisFnSh91c5dE7OOAZPiktSeyx8uVvcZbk
	KNxVMkWxj1njWbpAki6TSmxmnJm3OnquBMHXI63x+y8D2Y2OUD/rmBKZGfFfsxyaY9C2n9u9OLd
	JPzs42XJAffAe7+oydCXdb5DGFXDJIBxtiB9llgw6YdDpQnZJL7LuWt4R/uriUPrlpS9CE0TUz+
	sU9p1SAg+y6huT1BZJ2EcMKbvcjK/S5G59ohLv6bpJ1p7KLSk70Au4967pwe2SMysSOR/FFVu8W
	dZ
X-Received: by 2002:a17:902:d489:b0:2c7:f4bd:91b5 with SMTP id d9443c01a7336-2c7fc382d31mr5406995ad.0.1782349285561;
        Wed, 24 Jun 2026 18:01:25 -0700 (PDT)
X-Received: by 2002:a17:902:d489:b0:2c7:f4bd:91b5 with SMTP id d9443c01a7336-2c7fc382d31mr5406375ad.0.1782349284807;
        Wed, 24 Jun 2026 18:01:24 -0700 (PDT)
Received: from [10.133.33.237] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2c7f65062adsm7653335ad.75.2026.06.24.18.01.19
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 24 Jun 2026 18:01:24 -0700 (PDT)
Message-ID: <a13fb65c-726b-4c99-b741-29040c4564d0@oss.qualcomm.com>
Date: Thu, 25 Jun 2026 09:01:18 +0800
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/2] arm64: dts: qcom: kaanapali: fix traceNoC probe
 issue
To: Leo Yan <leo.yan@arm.com>, Suzuki K Poulose <suzuki.poulose@arm.com>
Cc: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Tingwei Zhang <tingwei.zhang@oss.qualcomm.com>,
        Jingyi Wang <jingyi.wang@oss.qualcomm.com>,
        Abel Vesa <abel.vesa@oss.qualcomm.com>,
        Mike Leach <mike.leach@arm.com>, James Clark <james.clark@linaro.org>,
        Yuanfang Zhang <yuanfang.zhang@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, coresight@lists.linaro.org,
        linux-arm-kernel@lists.infradead.org
References: <20260624-fix-tracenoc-probe-issue-v2-0-786520f62f21@oss.qualcomm.com>
 <20260624-fix-tracenoc-probe-issue-v2-2-786520f62f21@oss.qualcomm.com>
 <f0634a64-1141-4ff9-9033-825e3c75d28d@oss.qualcomm.com>
 <f39ec59f-97c4-4d5f-bf02-560adae312d9@oss.qualcomm.com>
 <471d7a92-3629-4274-a303-8906d3626037@arm.com>
 <25d7d3a1-58e0-4f25-a73a-59a978130c47@oss.qualcomm.com>
 <20260624151610.GC575984@e132581.arm.com>
Content-Language: en-US
From: Jie Gan <jie.gan@oss.qualcomm.com>
In-Reply-To: <20260624151610.GC575984@e132581.arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: ItBMLppF0m1py_TiD9cYfouaIf0ODORJ
X-Authority-Analysis: v=2.4 cv=NvHhtcdJ c=1 sm=1 tr=0 ts=6a3c7de6 cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=jcv4FM0po0oPS6h7aqIA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=1OuFwYUASf3TG4hYMiVC:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjI1MDAwNiBTYWx0ZWRfXyaSettC50cZB
 PVrwr/iF3TUbJhWCfM+k2VrAxPUL44sLXSzM1TILnFGeIXXSkgb79RBg4tt8NNsmpXZKAPpSZ2U
 CnhA1oC4GdoGZz5T0CJ8HH/284QXmu4=
X-Proofpoint-ORIG-GUID: ItBMLppF0m1py_TiD9cYfouaIf0ODORJ
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjI1MDAwNiBTYWx0ZWRfXy1O+b79k5KZc
 BpUFKE/wo4j4OpX6jtEOrSxl7Dap9F/VYQ7H6dHDGarIL3/jf/YzkXP+xzTKA3PgE+1uou55PpM
 nltei9EziYOiYbDAMNSxm3D7qCpA0ImW8jgWY2NsDXb0cZFSAX73Tuz0U0omsOtRtPdSIDbi6Cr
 f77/3WTmVNAucGrbJtcnk1pXfj8KTEjEsjNdk/6PrPPAuw/HPo1mLDXlXMUdRRZZwJExzmKaY3R
 hbUYQQONHIf4Fdufo8k7RtaFfWH3oh14zQtsjUiwWX1hZoChqfgwX8TejtI2x2LqwEJeh/zZdCJ
 K4MtV+IH3P/Awp/SeaJaqEAAcFV11eOShpWzgmgzARFZ4lTnkTLwDaTa2ngMf+DtVfym8bZZ/Zx
 wL9ssAdp4jLpJsO+Vpw2J9QKBo3Nu3eop3L3gOV34qEa4AM0QkyjsFJnjJFxjKapq0ajQ7woYNq
 3VjQJtfXXBs/wLBzDXw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-24_04,2026-06-24_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 priorityscore=1501 suspectscore=0 adultscore=0 impostorscore=0
 phishscore=0 spamscore=0 bulkscore=0 lowpriorityscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2606250006



On 6/24/2026 11:16 PM, Leo Yan wrote:
> On Wed, Jun 24, 2026 at 11:08:32PM +0800, Jie Gan wrote:
> 
> [...]
> 
>>> Why does it fail ? power management ? hw broken ? Is it really AMBA or
>>> do you pretend that to be an AMBA device by faking the CID/PID?
>>
>> The CID reads as 0 from the register, which I suspect is a hardware design
>> issue. I have not yet confirmed this with the hardware team. As a
>> workaround, I provided a fake periphid via a DT property to bypass
>> amba_read_periphid.
>>
>>
>> Leo commented in other thread:
>>>> tnoc.c registers both an AMBA driver and a platform driver. Shouldn't >>it
>>>> be registered as a platform device instead?
>>
>> The platform driver is intended for the interconnect TraceNoC device and is
>> not designed to allocate an ATID. The issue is that the TPDM device borrows
>> the ATID from the TraceNoC device, resulting in the ATID always being 0 when
>> associated with an interconnect NoC device.
>>
>> However, I believe it is acceptable to allocate an ATID for the itNoC device
>> and the issue can be fixed with this way.
> 
> I think so.

Hi Suzuki/Leo

Which solution do you prefer to address the issue?
The interconnect traceNoC platform driver is intended for the itnoc 
device, implying that no TPDM devices are connected to it. So, if I 
modify it to allocate an ATID, I think it would be better to rename the 
“itnoc” node accordingly? Or it's ok to leave it as-is?

BTW, the traceNoC device definitely is an AMBA device with CID/PID 
registers.

Thanks,
Jie

