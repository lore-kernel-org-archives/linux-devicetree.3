Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 692424E9C0E
	for <devicetree@vger.kernel.org>; Fri, 18 Sep 2026 12:29:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789734579; cv=none; b=iRlp07K8IVv7n3wYgEDRrYLMAj/Q4JlTOqiJeN5EcaBa5fb5PP+EOOans/y5nHmI0Ly2CpIcRaQNSYt6d5D/UgiI448rcIPnl51ak2HGZt69yeXsR/wLxpGNnoeCoNGhjbnxQvnBDPNkAeQF4aAjt/L+kqogacvwgJuXr+3zmJs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789734579; c=relaxed/simple;
	bh=nSwLQCSCwANRAsqBSnLcGPN2DlqL+AmkhbMOH92cits=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=DREFOZ9URjXzoK2zNK26mXTQQTuoBClTLVDPWtKLeNR/AajnESBpU2Xe0BBQScL476jjzEKdREDQmzGoYMgzTKiseO1uKHhT821bb3Vwtm4VJxt9XeU34AxDQ87O8QurB7JE9+pw6iZaTb60Orj0Jh/es9jg0edV+VGMJwfcKEw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=FR4AK7oq; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=BWVfZm10; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="FR4AK7oq";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="BWVfZm10"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68I9ds4w139320
	for <devicetree@vger.kernel.org>; Fri, 18 Sep 2026 12:29:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	SmcR5sjFJKe+lRs3BkZxPHezCF6SKm8GZJtIuEc4KDs=; b=FR4AK7oqDNJSD479
	xKKE92BS4uXWQW3jNtDReDJGnmwyp5z44hNW3w2JgIVliYHTrSu/CHYXw7fxhS3j
	4LxI+JE8yFcXkfwvd9Hg9JqjoWX7hXTl216Qt2FXksAB+1ArIfxB4K1GmPY7UHHW
	aMHoUHAOaE/w/1HqWHmR2cnQmXf1OC6IgjfdSpid3vHkYkGgZVqCz+OXrJybsHsm
	bJlAdgGLGYdHh/f0mmt7nmcV+jvfPJRqYl8weOWrJGWhDKCc/hkzBLVx271cmyIH
	cpgJMV+7JEx3H/ahIz3paRPX99ohIbMbErP/g3vZKKAQiuNDMwa5G0pDLl5kRmT2
	FEnLXw==
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com [209.85.219.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gry2bsng6-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Fri, 18 Sep 2026 12:29:35 +0000 (GMT)
Received: by mail-qv1-f70.google.com with SMTP id 6a1803df08f44-90e8d3a2d3fso513976d6.0
        for <devicetree@vger.kernel.org>; Fri, 18 Sep 2026 05:29:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789734574; x=1790339374; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=SmcR5sjFJKe+lRs3BkZxPHezCF6SKm8GZJtIuEc4KDs=;
        b=BWVfZm105ltNSvLJNmiP76U7+685uYqUKqWAWodfDOwt17Hpm9fDIm6RQpVyVkzH+4
         afa12qdG6Ojp7p3VpgIKYXyG6yS9l6NJXWdCqHvRn2hABtV2LrY3i4c4fabplreTNsz1
         eGAYGYSOIVhLVE+vDLSigQ9z51VIVtgx+wsbf07ktqhgG6eyoSncGs6BrUgd5KMCTy5k
         MubEJxY09ie35QF305sj61b4EIVbFRJ3C1c/50INbDVsHOsWUIzWY9PQOe6QFhj2G77h
         D5a3bHRKpGObXRqB2d1I5HctK403ZL+DDP4v+fmIvKdV4PidfSqPRwodLJfcWeDuZ1q0
         /9ZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789734574; x=1790339374;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=SmcR5sjFJKe+lRs3BkZxPHezCF6SKm8GZJtIuEc4KDs=;
        b=DxC8oi8LLVSHlMYcLhEztZJjIAWXnKA7o/O0AXSQmYX15iPtdA+2PgpNmz1sSPF/M/
         QMjY7Yz0qXP1PVuxsZxqeLPkd6tbHzqniR1WzaAU3YfzLfacbJaIwGD2hfvKqOEHCH99
         4VRFUwjUXClN61tCVwzvba6Z2Ck2mRg0tolpU2VQg+CMT9R3GCgVbXvua9NwI5KLlHZa
         zyYHiDJcLcwSgALO1a2mp0ekPqdBCGUo52/6OElgoflnbHxEurkAFj2Hwzqb5AvBIivE
         vJ5H1UX40fdSv2kk6LPZRdBS3TUuH/QhyapdtU4QRUDJeAtDoTXEhbA+HVeQROBMLBlx
         RLCw==
X-Forwarded-Encrypted: i=1; AKwUvBxkkX2ow34ms1su1kzoJTjqkL+HwYGCJ4N8yb7eqi6PthLkS+QcJTK9ysP6S2Ql+may29dPcdbtrs/3@vger.kernel.org
X-Gm-Message-State: AFuF++mxnri8JnfDFeYQ1dEcdONnuylkiwPIgJZCV7JFSGYWTROHLLV9
	8qmq5KoUqSTz4VSX2DtNta9LEOd9ynwaL1FgbnhwnPxZHp7WazEVdSUutr2aqbbtFipEzG37cwT
	O3H9YKn8i/gOpdcdUObYkUiPUrdAb3meSOw4GrjrKabxG9+/ozgOpocIh7r3EtfPL
X-Gm-Gg: AYBFou2sW9JezNr5sZEU57kjQrBPfXGBb+VZm/xW9cZ6DcxrjznNB6nB2S7owJMa/QX
	UvD68F+6WjRLPhJbL4v+aCSpQM9rK8h23FFLrYImO/kp9ABmkFM8PsVbFnPIb0cA/F24KVqKPs9
	kigmz4K5AgFhWRfcnD1PSIGtPiHNVB+4tjxSddAuX9hL4TbpBvBgXLYjUCfgLavI1+G0YfB/4dS
	nwxb88qtXi4CtNIRp99dTBwk8SanEfgQvCGa3FNK2JBeh2IyVg/PC3UJOZSz8s5JtNue6Hka60W
	1mgLJKjQ+T2NSDMJc2FPogYnV+LD6so6uPZqrk4ZUFsV4Xihk0nGbFLM2VIB6yENnladZQYlZmn
	OoiAEzaxCsjxkwTX2J2nGdw==
X-Received: by 2002:a05:6214:21c7:b0:90c:c716:91b5 with SMTP id 6a1803df08f44-91256ef5ad8mr31427326d6.2.1789734574675;
        Fri, 18 Sep 2026 05:29:34 -0700 (PDT)
X-Received: by 2002:a05:6214:21c7:b0:90c:c716:91b5 with SMTP id 6a1803df08f44-91256ef5ad8mr31423026d6.2.1789734569451;
        Fri, 18 Sep 2026 05:29:29 -0700 (PDT)
Received: from [192.168.202.12] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c2a1bb423fdsm49488466b.27.2026.09.18.05.29.26
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 18 Sep 2026 05:29:28 -0700 (PDT)
Message-ID: <92b7a87a-c086-48d1-8487-883dda7c4d70@oss.qualcomm.com>
Date: Fri, 18 Sep 2026 14:29:25 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/3] dt-bindings: embedded-controller: Add ASUS Zenbook
 A16 EC
To: Krzysztof Kozlowski <krzk@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Hans de Goede <hansg@kernel.org>,
        =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Guenter Roeck <linux@roeck-us.net>,
        Bjorn Andersson <andersson@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, platform-driver-x86@vger.kernel.org,
        linux-hwmon@vger.kernel.org, linux-arm-msm@vger.kernel.org
References: <20260917-topic-asus_ec-v1-0-373516d347ae@oss.qualcomm.com>
 <20260917-topic-asus_ec-v1-1-373516d347ae@oss.qualcomm.com>
 <20260918-objective-okapi-from-neptune-cbcabd@quoll>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260918-objective-okapi-from-neptune-cbcabd@quoll>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE4MDE3NiBTYWx0ZWRfX1tMKYEmcA8zW
 VDLgxBeQyFQJ/3O1XEMZShqZOg7OVzAh8xkvYmu7NoL4G/w5S5aaZhK/TN2FnG5fkLzy5K6GH2G
 8uigYcLVUMly1uTaDyMK4aKo5jfgv8cl7uvyrlmrlz2SkVQMJf8qBfCeLrMHAUJbvVRsJVBAlYo
 AWwNmRKqsrEH8OqK6sgxI47HzmNJBxj4/hHdXIwTzQ2IXAfy4mt9BSsBpZXejCCrpcZQdk3VZFf
 dM9qU0qr6uaLWVK/2mdrEJVZORdF8NdL0dqiOlTrcHMqKxB+ODmJodV7uMfGQLGmZbwMTGWqiXj
 aG7sh0D/OwwxT9KFmFOVN4TB5oAyFIc2Hrn/8AGgCKZcUpiYHQEghLG/0wmY/LeysJOtQi72zVo
 NM8+FkTkqzQvgLRy8DqAc7Z3+yfbu/yVzvmnY0C7aj1IA7ivlTknsFdayJlIM9O0gn7irfMjHgl
 cJRJAcZzvYhLvA2B0Kw==
X-Proofpoint-GUID: qM1Sff8fxQfTocZ2mrV-c6SPvFRszvFV
X-Authority-Analysis: v=2.4 cv=bYP+w+PB c=1 sm=1 tr=0 ts=6aad2eaf cx=c_pps
 a=oc9J++0uMp73DTRD5QyR2A==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=osjX1abir8ybeEd1uJ4A:9 a=QEXdDO2ut3YA:10 a=iYH6xdkBrDN1Jqds4HTS:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE4MDE3NiBTYWx0ZWRfX6XG5Yam78UVN
 t7Fd2lBije7OS6a4NpjKYzjGGmtmgO1rarBzoqBXUOzNmaozKTZB+MrXKMUXXATo0fS6FMKYFD6
 jrbng8WT04B13p4qmFlRJrncKX6tEfU=
X-Proofpoint-ORIG-GUID: qM1Sff8fxQfTocZ2mrV-c6SPvFRszvFV
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-18_03,2026-09-16_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 priorityscore=1501 impostorscore=0 bulkscore=0 clxscore=1015
 suspectscore=0 spamscore=0 lowpriorityscore=0 phishscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609180176

On 9/18/26 1:34 PM, Krzysztof Kozlowski wrote:
> On Thu, Sep 17, 2026 at 12:54:56PM +0200, Konrad Dybcio wrote:
>> +description:
>> +  The Qualcomm Snapdragon X2 series-based ASUS Zenbook A16 (and similar
>> +  machines) come with a custom EC firmware, loosely based on the
>> +  Qualcomm reference ("Hamoa CRD EC") implementation, with a lot of
>> +  customization.
>> +
>> +properties:
>> +  compatible:
>> +    enum:
>> +      - asus,zenbook-a14-ux3407na-ec
>> +      - asus,zenbook-a16-ux3607oa-ec
>> +
>> +  reg:
>> +    const: 0x76
>> +
>> +  interrupts:
>> +    maxItems: 1
>> +
>> +  "#thermal-sensor-cells":
>> +    const: 1
>> +
>> +  wakeup-source: true
>> +
>> +required:
>> +  - compatible
>> +  - reg
>> +  - interrupts
>> +  - '#thermal-sensor-cells'
>> +  - wakeup-source
> 
> Wakeup source should not be required. If it is, then it is completely
> implied by compatible and there is no need for DT property, right?

I suppose it's not *required* but it's highly desirable.. should I
just drop it from the required list?

Konrad
