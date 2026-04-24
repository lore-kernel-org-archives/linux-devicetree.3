Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CEF123914FC
	for <devicetree@vger.kernel.org>; Fri, 24 Apr 2026 10:45:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777027530; cv=none; b=VvsGeNPUVJwdZkH4gcl5/rrLzMVVMpT/N3x/ujudblei6yRvMQBi0MYnFeCyopCv+tQYLuV5e1CFM89uoxCC4abOaE3G7SM75Qm2EI9AB0NC90fgwlDltvGyyaUDRREpBAgxM8dXEJMbQ6E+8R8/qW/TwyLLAv3KVjXAwQQJaWc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777027530; c=relaxed/simple;
	bh=OnzGzcqNY+ArADqz4SnmiPYbRzsG9LBv1JybDtwFAvs=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=sOXX1w8GUN5JVik5Vb/u1HqT/tJFlSumqOXnDWxI6SOtmXYrHW/3mJn3UHjAgqJDU6gy2xyb+sd4XmHMrapz+3z7u0n8mn74RHH1MN68F0syhJfTAFNeMJZT7rdJTDFFkctVNR3sHoA/xWcM0d0lPvRo/8BLlX/sZHkXF0AGVNo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=OkjPmKeZ; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=GhJLAtlh; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="OkjPmKeZ";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="GhJLAtlh"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63O8E93B4012285
	for <devicetree@vger.kernel.org>; Fri, 24 Apr 2026 10:45:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	7eXC+Vvh1qI0aXe+adcCnpHa7mHRMAm7stQmrq1bj9Q=; b=OkjPmKeZh+bJGatv
	LPW5N9Q8BVgqBkX/Tbliwcl2mCwKO2ek52J3z3rJi3DuOAm2RQndSxQL50j2bCNK
	mOHkQrQhpvgU2cReoDtKuekLUJo85LlJz0BR04qYnK8W+CqK3ER6jitRDmM5CYa/
	jruCtDZpOxh2VVTt9NO4KOCpQKYyWEoplJm3JcndlEuWtvTqtyFmF9uSGZf8DFi0
	rpninchS1CgTDCoQtdxTkNaYI9vgfoQAQvOsQKFJ8pOkcvwr4ygYpZFk54YTWc1V
	iUOptEVp2RV4enz0KkqLvqTnWMxQtdYIwUj6KNe+Pw0eobaJa1H+nEs7ySuBLVxZ
	03h5HA==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dqpq9uy8w-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Fri, 24 Apr 2026 10:45:27 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-8d59968444aso228071485a.3
        for <devicetree@vger.kernel.org>; Fri, 24 Apr 2026 03:45:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1777027527; x=1777632327; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=7eXC+Vvh1qI0aXe+adcCnpHa7mHRMAm7stQmrq1bj9Q=;
        b=GhJLAtlhhzS2WSt1QUG8PErNE2bUnp0lH/q2AVMCqmU1Jx0docu2FHw1qnFVt7PPvd
         5BuxfUj+Ig+X8STbVcDXY1xP6UpKUGHNoLpt4x7O+2HOn0L1Cqt05XHXQEs2EU74/XzY
         /e/xDE7hmJAeH6JfUrlXn8esttz7YL8sDwAgErCwhZRDGANobC0o+yYG8tjdj2xdYHv5
         Y+yDrS5jlp/nSV4b4ya6R8lAlyb4OShvfBbfOEd5zoK8tB3c6XzCT7z04eTv4Q53yFjs
         uHQmAgzI4cw4fuX1JCIP754Kn6nKNGU8q700C9Air++3j0ghnIc3189tGp2zrJT8Idk4
         NdwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777027527; x=1777632327;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=7eXC+Vvh1qI0aXe+adcCnpHa7mHRMAm7stQmrq1bj9Q=;
        b=LedCYvATVyR4l9I4SreZSBejP8l4XEKe1Mc5VJoaZdaUBlAR2kCuNnrU3M3Y1NWxdd
         6a0l04EQukSGn2XYLOnHTr6mQb7NJl3CnnYO1VvDAn6zgrz5YFHuQwT1/vSc2cLwCvDG
         3IccKo9diP+/wj1ISI51hEyag8peJxcVlSBZKg423dsMy+Md7AwmLNTLOu0UZGXgJKBB
         lEwpp4ObagPUxihH40eu9/Vlp5HHgNYHM5jdjnwM0yzwx89pGhVVIWWNR5t6L7B3QlM+
         72XH4wMsv3nIdk55ccf0IhM0oBYIXTtpAb4xJ3iTicrtzGjzhGno7Okdtnuj6NYR2hZy
         HxEQ==
X-Forwarded-Encrypted: i=1; AFNElJ8E7zX8C+fdHiOSWVmyu9OdE387tP6fG757xb6dRj2Y78sD2wgX7mgYYnzFBQV/GwERuGHrHqkbJjq9@vger.kernel.org
X-Gm-Message-State: AOJu0YyCOuJv9a51qIoUDwnU188yBpYINg8IEVS4ufE+9w+cKAfLNiAf
	/o7kVqxGNKj5Jtg4S0b1mHYXNi3N/ee0f3B+aEuWrANA2lZpfriuIwtZYJcwoJPcGL4N3w4pHHB
	v/ttkjdomYCqapx8029MV3ebhpVoHwhHqfSeAx1Qu3XpMBJaND2nUFyTnHr5OHIYV
X-Gm-Gg: AeBDietVf5nwfto/hdeA33EgtogdkCPoHUlHPQIJ8tsvZRGQdxxSJNUfNicV6FWfdSs
	D52LmpSbjyOaPbtvp2yApskvKLo9vjAD/KOWwRrjdeTNLHOaKkzaHOCs7iohgU2Dnh+xGkTqNF0
	mgcgs+pV1cEwXYqJNVqY92K0updmV3Dfwkf/zQlWCSFrVjukoLoixqeiIq9xLCmFJzUxXhcGEb9
	vBJo4fwzNBITAkyPbbQ137TWkRFgMnoJATFzumZ7ezamSJ5XISgvymoJoUOdRtVF+qw7L5QN5bp
	udP2kzhZeU2QvJhODBshJgfHe405zHUrzZc/B3HMjlgqesaY8DStW+as/wqCmJdFclKzvpGzGuH
	qBzuzy0ax2uzE1IsIYqwNLzhuVaoRbfgw6AxS1nPSpf9Gx6nGjyvFf8I1W/efPE+AoKStGw7ndO
	bRCJ0bwaQQQtjdhA==
X-Received: by 2002:a05:620a:4114:b0:8f0:7516:da94 with SMTP id af79cd13be357-8f07516e2aamr868768185a.1.1777027526983;
        Fri, 24 Apr 2026 03:45:26 -0700 (PDT)
X-Received: by 2002:a05:620a:4114:b0:8f0:7516:da94 with SMTP id af79cd13be357-8f07516e2aamr868765485a.1.1777027526447;
        Fri, 24 Apr 2026 03:45:26 -0700 (PDT)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-672c4d69708sm4772555a12.28.2026.04.24.03.45.24
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 24 Apr 2026 03:45:25 -0700 (PDT)
Message-ID: <c6a06641-c345-4e65-9fec-7f2d4367710a@oss.qualcomm.com>
Date: Fri, 24 Apr 2026 12:45:23 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 3/4] pinctrl: qcom: eliza: Split QUP lane mirror
 alternates
To: Alexander Koskovich <akoskovich@pm.me>,
        Bjorn Andersson <andersson@kernel.org>,
        Linus Walleij <linusw@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Abel Vesa <abel.vesa@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, linux-gpio@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260423-fix-eliza-pinctrl-v3-0-68b24893ae63@pm.me>
 <20260423-fix-eliza-pinctrl-v3-3-68b24893ae63@pm.me>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260423-fix-eliza-pinctrl-v3-3-68b24893ae63@pm.me>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDI0MDEwMiBTYWx0ZWRfX8wZWjYnRCkR5
 Mrw6t+Oc0xcQn3C2WbwCrPNIo29mqpkJ54YIuP/1keLcdIJWsCRt7/cxJiXg46qMdG0YkPVH754
 r5FF7Zb2J0Rphgywz0PyZ3HavrGX80nJJHQHY1vB7z8K+ab3cSmKxvaIIKsC49JJ/4Isbhj12gq
 nG9sbe9ZENQG8n9ecEGuB1e13dpaMWl8N4lpIretdEwoOvvi89wQ8GjSyYCz54eNnK/gKqyVx5g
 iE+sMcfOutoRsTpiMNerBNombm0MS98Um7x1UucnNXimeIURCzJHBX2M2ZjzFmEZS7pPZjZ9hMQ
 +c+50W77r9A5luHmYT+um//P2Nzc6zEvqcByAeNDLMiSZiWNrTUPLcJTwPayvJ0wktYJ1GmCK9U
 aGhg1Kl8DJSWaCR40Wb4RHTOouP5rQeV9TMgRThNXfO8Lc+POAkenK4DAo9z7sOJ6pvVxmEP1iu
 HTiao5PIwe/vVp7TM/A==
X-Authority-Analysis: v=2.4 cv=FPMrAeos c=1 sm=1 tr=0 ts=69eb49c7 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=EUspDBNiAAAA:8 a=j-nvzvvU1SLIUX5pO48A:9 a=QEXdDO2ut3YA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-GUID: _z5ZuSPaAIq-cEtPenyVfMw0nMf7qQPs
X-Proofpoint-ORIG-GUID: _z5ZuSPaAIq-cEtPenyVfMw0nMf7qQPs
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-23_03,2026-04-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 phishscore=0 bulkscore=0 suspectscore=0 lowpriorityscore=0
 adultscore=0 impostorscore=0 priorityscore=1501 spamscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2604240102

On 4/23/26 6:43 AM, Alexander Koskovich wrote:
> Several QUP lanes have MIRA/MIRB mirror routings which are collapsed
> under a single function name (e.g. qup1_se6).
> 
> This is an issue because it means there are multiple functions defined
> for a given pin that share the same name:
> 
> [42] = PINGROUP(42, qup1_se6, qup1_se2, qup1_se6...
> 
> So when you select pin 42 and request function qup1_se6, it will select
> the first instance of it in this group, which just happens to be
> QUP1_SE6_L2, making the second instance (QUP1_SE6_L1_MIRA) effectively
> unreachable.
> 
> Split each of these lanes that has an alternative GPIO into their own
> function so they can actually be selected, following the pattern seen
> in pinctrl-sm8550.c.
> 
> Signed-off-by: Alexander Koskovich <akoskovich@pm.me>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
