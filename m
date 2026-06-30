Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AE8522FB965
	for <devicetree@vger.kernel.org>; Tue, 30 Jun 2026 08:42:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782808969; cv=none; b=eu2zwaPfB5GakBad53cLFRirGz7cHfCnJ7f2Rtndqir0tStb/HanIyC8qDC81HZlLFz3rfxR/cHieRx7RoANEJzbeOvXHRAXll8nTOh79wmIzplTCqjicgqe9Ont+YU/N7+LnH6A7OKBVMrG3KawAyNvUTVD+rcvml+UexfFl/E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782808969; c=relaxed/simple;
	bh=awnU39Goc8U0uYSQwFG6QxmjFciE6pLbo6oarSPAhTI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=oype5TVCP3rI1Uy9uKFWcZXpfwyPhyd14kuCHAXLQc7SV4l83vk2GwJPI3kh30ybThsCw0rGZ1nK4B5Klyxtg66rYZKSl52KH/VtZ/EGpp+teeQ0d7fXun1xyaUaE8NUTVUjh0wg6U7LvB3XXbT2mmnG5n/6soH3ZuKZQdPtEe8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=G/U1rECp; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=XqzU0IkP; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="G/U1rECp";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="XqzU0IkP"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65U6CUIT1087580
	for <devicetree@vger.kernel.org>; Tue, 30 Jun 2026 08:42:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	t3PkPp9OpJEAmf4QS2hFOkoU+Rq0Ib3wE4adA5BkKIA=; b=G/U1rECpO9DXIczc
	CdXXJFxo6nXualylOUdw7K1x8kiqi4NTIjROD9KbTKEQB3Fb84vvHR+lZKNXLhnz
	Am+N7X37E3xzbWuIAdNENwNweVMEl6QUrackh78/W96Fx+Ch8Fs7WTaBmZ582ncM
	4WR7Fcu+sg/OthS15mHy6Mg/wTomMuQCDOU6wlhv8LzQBk/62fmN01zVefx6aoRb
	7p4/hTsibd4zwX1Mp2nnKtIRYtNFgu1L8cF89NCWBUjtDny+jnKl2H35Yr96kjnI
	nwoEw2QqFq8zoLQdXbyAgEo3gAbVIyYWhTKIgKUll4eeve4SyKaodgRa2wgh6Xas
	7LLxVw==
Received: from mail-pg1-f197.google.com (mail-pg1-f197.google.com [209.85.215.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f3qhacta8-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 30 Jun 2026 08:42:47 +0000 (GMT)
Received: by mail-pg1-f197.google.com with SMTP id 41be03b00d2f7-c8969083f23so2386082a12.1
        for <devicetree@vger.kernel.org>; Tue, 30 Jun 2026 01:42:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782808967; x=1783413767; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=t3PkPp9OpJEAmf4QS2hFOkoU+Rq0Ib3wE4adA5BkKIA=;
        b=XqzU0IkP9D0m//B878lJIhx/fZpZwUNl7libjwP2fVsCVJ1Fde7X9EyEjSnzClMX8D
         uHfPBpRrnUyH80mkym+dXauVKMm3zyEiEVHIRMfU3XF8AbDZ9khKpz7nITANXtcP+IaN
         OWpQIsIVOsG8cVp4vvv6vtccK8qKuI1hvo7Om4DgoCrBqzoVUkJnwIJnCQdP5+hUlDAy
         R2PNj7y1I9L5p9QfgohyYc4MkAxMhfORf1y66QHpNvbWUuV6p3wSIeWWP+NSFCCEnLcf
         WEBY+Vs7+ii7gYPfgjj5C7kEf2sMKj/5bcCOuoMRjmogGLHWbQrIsaKVZdhZm8WDcofZ
         7OcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782808967; x=1783413767;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=t3PkPp9OpJEAmf4QS2hFOkoU+Rq0Ib3wE4adA5BkKIA=;
        b=E3IB4DTyYx9+Xr5AMSKC4AQFY2b3bitSqPbK+7itgRer9jivznhN+ijH3phYTaQmVI
         MwVFzMiKqFAhPaOQd8YFa0c3Y+tEox/NMpsyC/z5iSyR4+uyBjnFKvh3kQNtJ9O1EBLp
         EqBNjq6Ygy73GXkZz9dt8jX+aME+UzKh36y7PlUORJo9pmtSg9PcAh5z6VC0gfDNE5sP
         krXzLXOzK1VlIZYB33IuXzchNWMob/pYWmuNcN9dkgLIzttnK+7KXmORda5orQo1D6hx
         PJ+o0BUonlMuxZSSNIF5D238arHsnFe10Ua/Wqtqnr7+GG2mwaXAFxYDh5CDEg5cx2kS
         IVYg==
X-Forwarded-Encrypted: i=1; AFNElJ/9sArcakR4DOWRO6nlt3NrHL7xmQ1w65e1jeZRD/ju4X0leLS2F+MXoQOaUcL7qVv5Rkxu++WPQIt+@vger.kernel.org
X-Gm-Message-State: AOJu0YymxvIOH92SyFdIuqt+12OydGT35EoJAC66W1tyDal0YBWg5wpr
	oWI+r/AwA6B073zgwG2+JNRGgIGE9dzh3QnORWdZqdbsvspTgqMUMt36240hJW1zWZc7AVnDQ8j
	5yntY+jZ6Qy9sVHFwrSlINBjycR3c+oDBxpyuOF0yrFayU4n3MYbpELUFbgb90Q2+
X-Gm-Gg: AfdE7ckur1lJnfK3JVk5Y29MClRvTCcMpNZphFxZZWC9EcN1lKlEfTKYxZSo0kHqsbU
	pIU8rGj/oBYGMEsbwzspAR53Cx605LKOKVdQvu6xE6Sk3oMHxl/nDr5BKI9Fi/jyb5h6qy4MqPY
	gsX+J6J6S07rzFYVwyZNQ0fxpAJGAZzSzIs/mYM5XFC8t/UlPsfU1N7whYh9n5KqmLfuBK6cRe2
	9LMi0jNdSClwxJKvKr5bRlbekfecQYbyz5JlKBiba1Efwn5CARrVq0ZkdBk0/zX7S1sgAI3w/hD
	Dy69ztAushRGNgtvtWR9RhT/HpFNIDtzNs3s4vaxXt4btU/iG14nqZSH8DLLoIA4OQJ9ORrzOB4
	KS5vaQM8sw3xjgPgaF0Ln8/yIL6D78VvA8J/+CwDsGd0b9lbuHD6tgIdSq/RHYdRiFBZA0GGPAB
	8=
X-Received: by 2002:a05:6a21:398:b0:3bf:a543:e7f5 with SMTP id adf61e73a8af0-3bfc50664e7mr2352338637.3.1782808966651;
        Tue, 30 Jun 2026 01:42:46 -0700 (PDT)
X-Received: by 2002:a05:6a21:398:b0:3bf:a543:e7f5 with SMTP id adf61e73a8af0-3bfc50664e7mr2352319637.3.1782808966200;
        Tue, 30 Jun 2026 01:42:46 -0700 (PDT)
Received: from [10.133.33.20] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c9bbf95c04fsm1124404a12.21.2026.06.30.01.42.41
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 30 Jun 2026 01:42:45 -0700 (PDT)
Message-ID: <37017aa2-e18c-4568-a37c-d13964cbb418@oss.qualcomm.com>
Date: Tue, 30 Jun 2026 16:42:39 +0800
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/2] arm64: dts: qcom: kaanapali: fix traceNoC probe
 issue
To: Leo Yan <leo.yan@arm.com>, Suzuki K Poulose <suzuki.poulose@arm.com>,
        Mike Leach <mike.leach@arm.com>, James Clark <james.clark@linaro.org>
Cc: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Tingwei Zhang <tingwei.zhang@oss.qualcomm.com>,
        Jingyi Wang <jingyi.wang@oss.qualcomm.com>,
        Abel Vesa <abel.vesa@oss.qualcomm.com>,
        Yuanfang Zhang <yuanfang.zhang@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, coresight@lists.linaro.org,
        linux-arm-kernel@lists.infradead.org
References: <20260624151610.GC575984@e132581.arm.com>
 <a13fb65c-726b-4c99-b741-29040c4564d0@oss.qualcomm.com>
 <20260625085643.GD575984@e132581.arm.com>
 <065853f5-b11b-4316-814e-202f07acb6ea@oss.qualcomm.com>
 <20260626103015.GE575984@e132581.arm.com>
 <c1ac3ab4-f214-4947-b42f-cbc635be6bbb@oss.qualcomm.com>
 <20260626154949.GA1812158@e132581.arm.com>
 <9432df20-08bf-4134-b4b9-e6b5d618af81@oss.qualcomm.com>
 <20260629142848.GB1812158@e132581.arm.com>
 <adb45638-1787-45cd-b4fd-d957323cc608@oss.qualcomm.com>
 <20260630081021.GD1812158@e132581.arm.com>
Content-Language: en-US
From: Jie Gan <jie.gan@oss.qualcomm.com>
In-Reply-To: <20260630081021.GD1812158@e132581.arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: XPI-ADqBIglrkdFizK-j8S1UOi70-l1V
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjMwMDA3NyBTYWx0ZWRfX1XQmbum5bJ2u
 oWw4PcQNq6/0nBBuLBaN44x4YprVel9YcPRJfSfkcF2+i1rMsY0JEjDQwI1dw8Ry8817BTN+fWq
 dNASkpfstPkELaqGpfdfiJjL0YoqSeEtFBcY9+N7KZdVdwadVxEzN4r4P//A7K/7zpilaiHuEUC
 7ZvK5BVU3GK0gQcHlHEY6W2ICNiKAhb7umrD9jsXwvhOPgY85sIsGi7T/FjWD+Yr+Xo5J8TGze2
 MzP0O/RCCyGmRjnnuoHibWByqkr33/OkElCE9dcfQDw7wNCRrLxfJTkfdK9Km/DGy6cPqT5ZxTi
 Wj7cdz0YAl40mClKdoetLCdwroWCe/9PINLOOQciXnLBZM9hhXp2tnOZftnmbkThIVb0GdFp+Pl
 tmVaNDxbFy9Mw3I76pn2goo6TvMa8/JI2JOrWyIhpltdw99rmKuCPfMzJjJTNZOZHijVUViyvS4
 7MjnokFjsezXl2Gi4fg==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjMwMDA3NyBTYWx0ZWRfXwSkZ/uJ1EQJ/
 lkTH0VjEtlxu52PVGHPoVzpIQIUrlSJwZMRg6d/+d9pbuPwdASx3XNf8d5uSKXZKwio0RqN8nFh
 ENh4ScuGOqOd6iEXTyAzB+u35n8b+ok=
X-Authority-Analysis: v=2.4 cv=O9UJeh9W c=1 sm=1 tr=0 ts=6a438187 cx=c_pps
 a=rz3CxIlbcmazkYymdCej/Q==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=9NUdbc6MOnRMJlQJ6ZEA:9 a=QEXdDO2ut3YA:10 a=bFCP_H2QrGi7Okbo017w:22
X-Proofpoint-ORIG-GUID: XPI-ADqBIglrkdFizK-j8S1UOi70-l1V
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-30_02,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 bulkscore=0 adultscore=0 impostorscore=0 lowpriorityscore=0
 phishscore=0 malwarescore=0 priorityscore=1501 clxscore=1015 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2606300077


Hi Leo,

On 6/30/2026 4:10 PM, Leo Yan wrote:
> Hi Jie,
> 
> On Tue, Jun 30, 2026 at 09:03:52AM +0800, Jie Gan wrote:
> 
> [...]
> 
>>>     - How can you guarantee that a interconnect TraceNoC will never
>>>       require ATID in the future?
> 
>>  From a hardware perspective, there is no fundamental difference between an
>> itnoc and an AG TraceNoC. They use the same TraceNoC hardware implementation
>> and share the same AMBA bus type. The distinction is purely functional: an
>> itnoc is used for local trace aggregation within a subsystem, whereas an AG
>> TraceNoC serves as the top-level aggregation point for the SoC.
> 
> I'm still not convinced that adding "arm,primecell-periphid" is the
> right approach.
> 

I agree we shouldn't need to add arm,primecell-periphid for the AMBA 
bus, as the hardware provides the necessary registers to read the 
peripheral ID. I used it as a temporary workaround to resolve the issue, 
but I believe that solution is not correct.

>  From the description above, I'd expect either the hardware to expose
> bits in a register to distinguish these two module types, or as I
> suggested earlier, to use a DT property to indicate the module type (or
> whether ATID is required).
> 

I wanna distinguish the aggregator traceNoC and interconnect traceNoC, 
even probe with platform driver, but the existing compatible is too 
specific to the interconnect traceNoC device(coresight-itnoc), that's 
why I didnt try the DT property proposal.

> Or have you tried to detect the last tnoc on a path and allocate ID for
> it? (You can retrieve csdev->path).

As Suzuki mentioned in the other thread, I think it would be better to 
add separate compatibles in the of_match_table to distinguish between 
Aggregator TraceNoC and Interconnect TraceNoC when probing with the 
platform driver. This would allow us to allocate an ATID only for 
Aggregator TraceNoC during probe, which is consistent with our original 
design.

Thanks,
Jie

> 
> Thanks,
> Leo

