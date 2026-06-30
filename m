Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CA5E13ECBE5
	for <devicetree@vger.kernel.org>; Tue, 30 Jun 2026 10:23:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782815024; cv=none; b=rOcW7R5J8VjtcBK6IwzBP20x0O8woInA6AsXCAeIsaCZKVkvUnVN0RE7LY4JWgraTWcKE80n9mXx7uIqU/iP5s/1IccQtX0Vv281zcdjENvlPjJWoOU2WYCSxmMbXlADNVCoEHOa8gTQzD4OoW7K2nLgKu1BFTq3tD3SIpP9xRY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782815024; c=relaxed/simple;
	bh=LRkXfXdmo8CWYkWy2OtyR6Psk+d9GjTH5Ank4/i27FY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ECmF9WQkSXZSGAh0PcE5drxoNNKh/ky4WMDm3LQmsyYXWLBczli+UrnfUvzBrxOafyZv51adfqYvkUuMfwcV4vBlp6Q/M051TITcvENCspoeXUwtD3cGA+M79oLagABSmofPnPj/eXkOReZytUXHIqiMx0ouapKTT9SDNnc6IQI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Ln05Bt+j; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ASID6Q1q; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Ln05Bt+j";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ASID6Q1q"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65U9nC181590600
	for <devicetree@vger.kernel.org>; Tue, 30 Jun 2026 10:23:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	fjf98r/hrw4t3YgSzoJNbJCdT3mRw4IABG8RvUCuBYI=; b=Ln05Bt+j1MfPwQca
	e2McPsyRUsHf+OEeM1Wjbcg4Xs/cgp8Fikn/1wFR51kxoBmBOktvbIbvsdOBjgFf
	2wwe4YGZ9u6rlgEiUgSlJmZTX2N9z7hbS3q1KetCJyQlhuRydVK7dBlThceaFakI
	XXWAW/uCJIuMNGfBkVWTUYjg4JvIozjse4EDj1R/kJg9sXTbVPLRD7d4qi1+dUyT
	q+soN7PDfpQDXeBc1kKqo7CBqO9wFXhD95eB4P4ByHbD5drPmpEwtXbHkzSexXcR
	/z7l2GNPw0j+No924uIPaJs+geM9u83mK22Rl9YeHkR8hO95hGnqDJRWva6cgyXk
	zJzB7w==
Received: from mail-dy1-f198.google.com (mail-dy1-f198.google.com [74.125.82.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f3y9k2yec-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 30 Jun 2026 10:23:41 +0000 (GMT)
Received: by mail-dy1-f198.google.com with SMTP id 5a478bee46e88-30ed53abff8so1888453eec.1
        for <devicetree@vger.kernel.org>; Tue, 30 Jun 2026 03:23:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782815021; x=1783419821; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=fjf98r/hrw4t3YgSzoJNbJCdT3mRw4IABG8RvUCuBYI=;
        b=ASID6Q1qzgAREHlgLjgVt1n4FA8X3ddC8XzO/qBc3FfXRoP1KaorhHNeCA9jO4Q85m
         MMkNvh2QCDbGQ2c43tK4bTpH8GOoF30XENCvUncK2hPMiaq+sUY08veETuMJhEmL7kpO
         xSfuyEuFo6SNbFG6385I6OQUEA/X6Tsp/t4TA3u5Sf/hf8vJR4lB7Tb+Gx1tJgkl4puY
         rSZq+PHfd1nHQkSHP/yXJk7d33zaXQzAekS5CkbmoUYGwDWH6KCpFAPCPZozJB/ey86P
         blF4L/Bc/WSrHb1Pv0m9fv+V1HIwnaIg70QBiHj33tu1bReVDmGhaWfP/VJEpgoxPLau
         oimA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782815021; x=1783419821;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=fjf98r/hrw4t3YgSzoJNbJCdT3mRw4IABG8RvUCuBYI=;
        b=RSjkxcVGXcCsgVuhi+gTjZGoOjpuvlLqTb5eUT4CVXg9da7pQZYnKHBclSxpz5+fCS
         Q1wICBwxz4IrLl57+D0yx+1FsKfqJtJroj1H7g9ddrkM/T3nrQhERt0TUWmFVTGX0D6a
         d8xzq8qOiXcfSG7ScpeL0mz5MUq0y2RVWujJauFZEh5lStnHK4DvEZeL4/7cLdwLXa6k
         50BG/vcZ+7FmQFl584j8RnEKBqpFCCujFtbYFGCaAcuTbosTs2GykmtpFozIVoL/ZofV
         Ln3LC0frV+zmI4IEEMwJqOwGnX/m8leHe+1c1C3APOklXtZAfsJAra4tprjubycDOpcv
         o2rQ==
X-Forwarded-Encrypted: i=1; AFNElJ/cWY40/ukYkwZQL1t0fW/d34BIvCBGjy95h01C62FW293JhnbjoMh/jscfr1louiDh0xzbFep42w11@vger.kernel.org
X-Gm-Message-State: AOJu0YzPnS1LR5vJkrUehJuycuNVh2q9yHQWX8Px+oN+uSxURipbgHIW
	ayypYpny+134mDnPu60u0uQV35sGw2fISeB6K35zBsV1rb8hU5x8pMoN3IH2FgsJKEvXmjBJsUQ
	cGU7kE9Bna/o1GQgv/DKMVFeXghYhihJfedntKVNLDdr1gh19GFHMOvSQQDgRQT9c
X-Gm-Gg: AfdE7cl7nc9kGpzHQhog0RVI4BYkkaVzduGdAgiGCdbhVlhy3iOaYvkVSqTWtex6aPk
	5pNohaJ2YmxULsfXaJKPeXaegtfG1qx/6yFn6KJBRg6SyOXxh0kyGx7ZJmKbpVVKkpmaAe5CB6f
	FAwqb/vNj3oG+j1JXxvvsWVgE+fnczM5MtEHcND4oyChCPBnfA70/HsjavoHekATbI5kEHQh/9O
	FJ2RDaGRnRWXyDkxhBhCCRz92/zwUgwxFUDhWKFnKvOtT6/oo9DB02rQOYoQmr7am3rMHnmqvJx
	sRglqHboICJSOFn0MnZwdFex8lSH5+RalYQjqo8+LKsRBBhJveJkZUCLtEVoglGQP7pIGXjXE+D
	80QhdEB0NH6I4k3WTr7eV6eikFKgAh1efx2Jef87SEQ==
X-Received: by 2002:a05:7022:4381:b0:135:578a:cde2 with SMTP id a92af1059eb24-13b2a1c0abamr1761524c88.34.1782815020908;
        Tue, 30 Jun 2026 03:23:40 -0700 (PDT)
X-Received: by 2002:a05:7022:4381:b0:135:578a:cde2 with SMTP id a92af1059eb24-13b2a1c0abamr1761496c88.34.1782815020347;
        Tue, 30 Jun 2026 03:23:40 -0700 (PDT)
Received: from [10.218.31.125] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-13b2aba8008sm5339274c88.11.2026.06.30.03.23.35
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 30 Jun 2026 03:23:39 -0700 (PDT)
Message-ID: <ffca92db-a3ac-4345-8477-1f53ec61ef16@oss.qualcomm.com>
Date: Tue, 30 Jun 2026 15:53:33 +0530
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v8 2/3] arm64: dts: qcom: kodiak: enable inline crypto
 engine for SDHC
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Ulf Hansson <ulfh@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        cros-qcom-dts-watchers@chromium.org
Cc: linux-arm-msm@vger.kernel.org, linux-mmc@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Neeraj Soni <neeraj.soni@oss.qualcomm.com>
References: <20260629-ice_emmc_support-v8-0-1a26e1717b85@oss.qualcomm.com>
 <20260629-ice_emmc_support-v8-2-1a26e1717b85@oss.qualcomm.com>
 <ba96f5e3-6b6e-40b6-b6c1-300e862e8ee4@oss.qualcomm.com>
 <d3be45ab-0390-4d0e-8d5b-330a48c529a1@oss.qualcomm.com>
 <1a0b91c6-5e17-4330-a8ab-ac14d3339024@oss.qualcomm.com>
Content-Language: en-US
From: Kuldeep Singh <kuldeep.singh@oss.qualcomm.com>
In-Reply-To: <1a0b91c6-5e17-4330-a8ab-ac14d3339024@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjMwMDA5NCBTYWx0ZWRfXxMlB8fHhmGdU
 w3DuXE61PIqqP4K7G92xMnZecyGYFxn4u2KixTV6MvFZU8JO/X5yn0rIHYn10Xu8CaEsr/mucT2
 +6OyOtrGnEaWnmwP9Kw2vXbXTUiSIao=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjMwMDA5NCBTYWx0ZWRfXxoXs/8Td+31o
 MK2HxcXlW+co/ugD5G2ZwFlG6TgMuR8w/Zp0HE+7CuXD8mkp6SG78SmumGLhbEf5dQWcXdTvEio
 2L+dzZdfA2jenPD1TS1jACVrh6fnjsQf4n8ixch+Pu8zsWuUSpA9wx8ObM/nHD+XeFc4xlxGv2G
 jWklLXDSxmaSyYcH3sw1GOK+e0c+VYGNDh1wU3OaaKw0GSxLBdx8PXrKWt+fk6bO52E8edo0VRR
 FbHuXbMCYi2eBpdqN0iQZedbpyIA81Mva/JmRcuLx/XUlxRYJDoM48ptsntg9FdGfLsJwEOQjrA
 vvargMUSuWyHhoJ8u9/cdd2M3v6oQoyMwZvmndzrTgxG6MSk/2s/qsYYsbDCSSpMVD5wjyvH0nF
 BuIYk9OQvdyqHFhKqmNfGP6IZ1JX6aFN9UDfUDXjt0eknVQ5HvMXajZpl+BIHkejGJTmL09SKls
 L0v19fa+6Jor2vj+qdg==
X-Proofpoint-ORIG-GUID: K9QXiRW3eJhuCLSWW9HLYzpBNnWvKeaG
X-Authority-Analysis: v=2.4 cv=TeqmcxQh c=1 sm=1 tr=0 ts=6a43992d cx=c_pps
 a=wEP8DlPgTf/vqF+yE6f9lg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=kz5X_B4VHAOF4V-UfckA:9 a=QEXdDO2ut3YA:10 a=bBxd6f-gb0O0v-kibOvt:22
X-Proofpoint-GUID: K9QXiRW3eJhuCLSWW9HLYzpBNnWvKeaG
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-30_03,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 impostorscore=0 phishscore=0 priorityscore=1501 malwarescore=0
 spamscore=0 adultscore=0 suspectscore=0 bulkscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2606300094

> qcom_ice_probe()
>   -> qcom_ice_create()
>     -> devm_clk_get_optional_enabled()
> 
> If we remove the _enabled suffix and put a ice_resume() in ice_get(),
> I believe this is no longer an issue

I see your point.
devm_clk_get_optional_enabled turns clocks on, whereas using
devm_clk_get_optioanl will only get handle but don't enable clock.
Please note, clocks are needed at probe to read ice hw version and then
later ufs/sdhc fetch ice instance using of_qcom_ice_get() and control
suspend/resume path.

But my idea is, if storage itself isn't there(like sdhc on
qcs6490-rb3gen2) then why sdhc-ice should even probe and check hardware
version? as there's no significance in even probing ice.

-- 
Regards
Kuldeep

