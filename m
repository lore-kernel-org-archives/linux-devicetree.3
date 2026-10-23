Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792752563;
	b=jlLytiBTVl9B+ra8fhGccBLXJCOwhs+72g/WmhkK7ZArAF/+Qn5w+Jg+2rBYzO1jbY/U
	 UUY3UustUnaefZPozphExbpDu5nezd6TNVdvwjDozd8oiGds13/q1Q67X+eeSvtLTrdd9
	 YR+WZxc4dl7EHDuNwTjbneWfiACBlGZe9Qc3lanSbBVY8mWMBcsa7j9XmT8xSW38n3P8H
	 qlX9FLEGFfPJdvE+oL8G0lP87YnZi0QNIGStn16AlAEcFDTdTcFFAvuFW/wc4vTbKL2tm
	 6W7MyKY8lRHWYCAgeSc9E7dCtSEOE3C0dDm6RNtoiHEwDto+XjcZAh5fSQlfmjdd5fw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792752563;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-GUID:X-Proofpoint-ORIG-GUID:
	 X-Authority-Analysis:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=OJZ5+JvXRLfRJQ1rZwOfbvS5thaOJQ0x39UJIXgliOA=;
	b=T5sZ0G1Sh5Jgf2DkjaPH/LDtqGNSmSDbX538kqFUHhlyFBNBfVZp3tDMyquWMdUHyeoy
	 goRG69q/06Au/w/YyGya0ZVl/Wjy75gQnRZUibYA0Qvv8mr6EBiGB14pPpw+Da0wNFvwt
	 Grk1FmPNSgG9fUrAfqRBgiqxci9A5LdDrr7MQu9cs/u6elpPi7XoDemPwdm3wwxtsZGkB
	 i981AWMGgTbI2sum3S4ywhdThjV6gVlHBz429myGpAoCOqQcGt7VoiQ0lNNuS4zs53+jB
	 /pOZy0cl8ujShr3sIQ4isiPnsxavvXM/G9+KaHJKbIQlmgPhI2cym9eEF5VUWWZahfQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=NBpHfLcZ;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Bc10VNay;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E52D9606A31D
	for <devicetree@vger.kernel.org>; Fri, 23 Oct 2026 10:49:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E52D9606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=NBpHfLcZ;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Bc10VNay
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69NAAvwO2463880
	for <devicetree@vger.kernel.org>; Fri, 23 Oct 2026 10:49:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	OJZ5+JvXRLfRJQ1rZwOfbvS5thaOJQ0x39UJIXgliOA=; b=NBpHfLcZLEzJTtxF
	l3MprFIzMvt6CSzQX73ZK7PUCrx6178LHmXAYHBQ67grkua+/C2kPaaQ2vHaPg/v
	QpUuMmdj9zOFu2AOK0z2Pw26PrXuJgOx8o53lmLgVQKSyVIZRE6h53fpmkEaukPd
	1fPyVWOzvomnoFewq2JF5z11lniSknx9DnD++5RQbhlKCIlrCQq5pLUiVS71dkOJ
	aO28pX6nPbxwsAjWm2UgCijj9xtc4VX8aK0eEOZ1sUFQUezkWN6wlQXTI+Oa4EMb
	wJEDV+SG9tbwJOwEKiiE6xN80K8ov1GB35EO9p+2Ma/owRwyiEmP7r5L2EDBQCO4
	eRvArg==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hfnyw3tck-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Fri, 23 Oct 2026 10:49:20 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-93f6f4fe531so138955185a.0
        for <devicetree@vger.kernel.org>; Fri, 23 Oct 2026 03:49:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792752560; x=1793357360; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=OJZ5+JvXRLfRJQ1rZwOfbvS5thaOJQ0x39UJIXgliOA=;
        b=Bc10VNayHO3vSP/nvk1Vg/3giS21EEKxaNiiz4h98NjVTjNPFcSnIn6rrl7piXPHDW
         VCDV9ITzg5zF8Lae6VXmwGePaxSYG3Pzs3sYHGRs4eHMdAl+fLhMKLONuIV9RzzBSfU0
         Uegrxv09Cz0cJvGKL0N35S4L5//VUPzH8j2StBD28Me7N1aNgA0xDYFp16UgPrDD8oug
         2jC3HInYzzHE5/k+vuP2NIQEIVyNomVR/5andRHZ70kSUuAXu8lMR6rQ3TKoPSzhX2vk
         UniMg+OiIxHbn8L+hH0MQXPIq/t0h9/ITAtUIOk39GWhWUwa6c1f6WOwbka1gDqRux2Y
         o4ag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792752560; x=1793357360;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=OJZ5+JvXRLfRJQ1rZwOfbvS5thaOJQ0x39UJIXgliOA=;
        b=zvSkopHEpvnvExYH7VE/zN20ypHR6QckxL0Z0PwCFLd9IuvlRS7ry/2PKeIyKNZbKy
         sTFtAmRb6MI7LmXgKp6HJD9Wu5mCU8rl3YprixKGtTpvou06bkcAJ/8beHAep0qyWxzA
         VpFJetak4lc7Mm0xTC5oOxe+q7rHlFVITFL/CXaAEtdgyH8UuEqSMjS+0SDAjZc7QKkE
         oUd5KoXLzyzJF/bnufcbUYtQZJBv6jPraH6RlwB323vPkHzhKlRfhcKsFdKWBqzY5dtR
         YaU7xtkz2HoF0CBzXTsRUZjPalQURACvTy/Jb5O4Z27tyWZn5ofC3RHGo71lWvg3MD9i
         zs3Q==
X-Forwarded-Encrypted: i=1; AKwUvBzwQsN6CvVeXEOgoRYHwbkXEBLZmHZo6zawIHZA/dIpttVWf7QMVUUzWLpxTMFhL3tDSAglebrQmtvo@vger.kernel.org
X-Gm-Message-State: AFq9FYJEg3hBeSSvBRwl+jAcjeOdywcaqxj2L+QFkucLxhNwkEq8cs+z
	qfF6uFOrjMu/8Z5TCKGe5Du91aTaJso8XLA6Re4tKMddCR4Uw9hDmHl/4YVSo+cbZkid/ih5tHp
	XFaLhTLJ7uMfKlnRoE7HStqm/Lruf6N6Zupd7dpxz1HE1r7S8buOBSuXP0kRSrLAxjOHu5vNk
X-Gm-Gg: AYBFou05OB0cPxuCOburVXvlTRF91ED6JUJ8O2l53w8a6YFoLpp8jeZ9RzSLU7/fTUs
	2fqumU4y//tHyF2TsnHPDjLq3/MjlX+yP7RKdTpbneJe0Kr9Tcw86RIPQWOkt9atHAEpu9vECSA
	Q67F3vWNshF0RV9KWCGy7rrJx7sjiEDJS3ay5Kb3tT1TZzYw8MN5jHYU/h4GqXn75NOaMEtpw9U
	wiMHWvIUeM/VyYKIEhsazpS6HybW/iWyUEKwRnWqLsfRszcR8DcLGDYd5UtueUPDyohfLI1PRs6
	OzzHMm8n6QsEcGdx20t3YUZzBeIGW8if4fLserY1JwgEdWlRH2Qy1lkOwEIj1ncY4SdcvEJOvol
	vevRTZWuFa2WCDeG0Zz4r5azk5iau0NN/bCNFaUZDloghIDXp8rAwaKdRweGOQw==
X-Received: by 2002:a05:620a:2b4d:b0:939:de6c:cb45 with SMTP id af79cd13be357-93f6f85dfc2mr320615985a.47.1792752560171;
        Fri, 23 Oct 2026 03:49:20 -0700 (PDT)
X-Received: by 2002:a05:620a:2b4d:b0:939:de6c:cb45 with SMTP id af79cd13be357-93f6f85dfc2mr320612785a.47.1792752559716;
        Fri, 23 Oct 2026 03:49:19 -0700 (PDT)
Received: from ?IPV6:2a05:6e02:1041:c10:7d20:e20f:a77f:4ef7? ([2a05:6e02:1041:c10:7d20:e20f:a77f:4ef7])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e3802610fsm4407066f8f.14.2026.10.23.03.49.18
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 23 Oct 2026 03:49:18 -0700 (PDT)
Message-ID: <36ea62e7-2dd4-424d-9326-1b5f270da00f@oss.qualcomm.com>
Date: Fri, 23 Oct 2026 12:49:18 +0200
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
Subject: Re: [PATCH v4] arm64: dts: qcom: x1e78100-thinkpad-t14s: Add thermal
 zones for PMICs
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Stephan Gerhold <stephan.gerhold@linaro.org>
Cc: andersson@kernel.org, konradybcio@kernel.org, robh@kernel.org,
        krzk+dt@kernel.org, johannes.goede@oss.qualcomm.com,
        conor+dt@kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Mark Pearson <mpearson-lenovo@squebb.ca>
References: <20261023083827.7648-1-daniel.lezcano@oss.qualcomm.com>
 <atsmQqSOuqp1LKw8@linaro.org>
 <6ebd380c-1f32-4ec6-86be-99631db4958b@oss.qualcomm.com>
Content-Language: en-US
From: Daniel Lezcano <daniel.lezcano@oss.qualcomm.com>
In-Reply-To: <6ebd380c-1f32-4ec6-86be-99631db4958b@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: EG9-EoJ8-zXXIDy-MQFuNFois_ZrSSvG
X-Proofpoint-ORIG-GUID: EG9-EoJ8-zXXIDy-MQFuNFois_ZrSSvG
X-Authority-Analysis: v=2.4 cv=dphOmFg4 c=1 sm=1 tr=0 ts=6adb3bb0 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22 a=EUspDBNiAAAA:8
 a=agzqCfvS8LjcRQY4D-sA:9 a=QEXdDO2ut3YA:10 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIzMDA0MSBTYWx0ZWRfXy4waOxNH868o
 5B7DlwEnBM4fMZzkqGJLHrd7lGCSHOqnGSJKyA2vL1Ps0vkvN7p/etQDKkTDYD5n4FEFFq5Szyx
 4WkvaGUV76Cl+4s+9ZHoj6WjvJQi/0I=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIzMDA0MSBTYWx0ZWRfX5JtbizfslVfD
 IAcmSDJ6hV49+CIigC0cq91rPfcdgCjRaiIFm8A8RaJIRZu4lGTJnndsdjt684F33zsSwR3Xy3w
 C6R82khNzWy5Swd9zvuAxwmyn3dU5SCBxekBRanL5NwyFvlrb8o2JBdFOiqoGR2HeM9SvGEf1JK
 s8yrHuc40dwZvktYn1zTjRc8dLM9swAAFamDEwaiHZfnwwD9JT07RgufBI/Z1zS9wmoxn0kLTll
 vQv+oLoT2oUv2pfm2Ii/kZnS6uOC5vm6MUH6rJdlXBYv8aFjlIvCMLTwG50Jm/IPvOIP1ulqCOs
 oOdmwvQlSfVGTT3+HUzEr4IupAcdqdeC7hmJXckZoCJBm26M+S4VUuNhguZ85sIt3QkRPn3rOv7
 7wfwAY4ehABdRtsNRQHLLbanUyR1xXToRXL95R6xtlvFScKo0NkK9EkLJ9cecx2hzhTUDkqfEry
 0WJ6H+VuLUei2JYngeg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-23_03,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 spamscore=0 clxscore=1015 impostorscore=0 adultscore=0
 lowpriorityscore=0 priorityscore=1501 suspectscore=0 phishscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610230041

On 10/23/26 12:47, Konrad Dybcio wrote:
> On 10/23/26 11:17 AM, Stephan Gerhold wrote:
>> On Fri, Oct 23, 2026 at 10:38:27AM +0200, Daniel Lezcano wrote:
>>> The ThinkPad T14s needs thermal mitigation under sustained workloads to
>>> limit temperature rise before thermal shutdown. EC interrupt-driven thermal
>>> monitoring is not yet supported, so use the board temperature sensors
>>> exposed through the PMK8550 VADC to provide mitigation now.
> 
> [...]
> 
>>> +		/* Sensor near the CPU PMICs. */
>>> +		cpu-pmic-thermal {
>>
>> I'm a bit confused by the node order here. It's not ordered by the
>> thermal sensor (SYS_THERMx) like in x1e80100-crd.dts, but it's not
>> ordered alphabetically either. Or is it still the old order from the
>> previous revision?
>>
>> I think I'd personally prefer ordering by SYS_THERMx, but alphabetical
>> order would be our typical rule.
> 
> Thermistor index is what I'd prefer to go by, I think it makes the
> mostsense

why ?

> Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> 
> thanks!
> 
> Konrad

