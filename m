Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B67A33859CE
	for <devicetree@vger.kernel.org>; Mon,  8 Jun 2026 06:10:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780899018; cv=none; b=XmiswfPpt76EnAlOBEgLMN0DCX/GcrrXNTsgwd8AFkbT4bf7XW7+Ovzg7EtfdTj3ou29g0Z8qANg/RSINdFzOiN96yvLdimgN3zAdZqGk18VEakC//P1izMj3Y3Mw8TBJQ1a0dBJEtrr/jBHArwgXS2zUWUQ9GosofrljqJBg6I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780899018; c=relaxed/simple;
	bh=ctLJGhtKeMb1de4T37kM25kIxoTGRwQN77CF3ifuThE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=flSoYTfEcrl6+e6y8/Wb9Tbp4aBh+mePTRAjWwd/Ws4V/8hfLF6KEOMn+QXKWm5915mbmhZDsGG7m09r0SYC7zlq8LeJRH8dA2houRlTqvttje4rYG114XCu026MW2KrhS9x8zcgFSSq3KFuMv7qDfSlETMsiWy0xNxOd8b1ago=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=UO7MdYII; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=C8nkDNcY; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="UO7MdYII";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="C8nkDNcY"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6580F2Bp1577353
	for <devicetree@vger.kernel.org>; Mon, 8 Jun 2026 06:10:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	/ZHNhdNoux3RwYcj4Lhip2X+5aAHdY5ZDuE/CWM5Cnw=; b=UO7MdYIIG+9wv0Mz
	llXOu3ZSMHBofiar4VG+1G/RgqWSfr6qV3ZciBZMHN+YzEuEdbEN5G7uD4KITM01
	C4AR0SVxWl2OAYtWdX7gBZyYm1H2+vHNo/q80g9V1T2/irEWza9GroaquaKnAodw
	T9wQIc8nFahrGHV1N4A/iKT6Xm9wRfFBMtv19DpUhPWljHDJL3tjGPCicrVKwZQz
	lYcFGICdFiarwpOvpWEGU3ySbf5yH0ht9KdHZFEno/QKu1NmMhBxXLVdK0Pe+ID+
	SY4ivMy8kwV9qYj3A01RUh42SUHICpQdQL28UhmAmjPrSXHG3j2ngO5/tBfgaz8E
	n3TUdA==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4embs1e360-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 08 Jun 2026 06:10:16 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2c10cd7df22so49852455ad.2
        for <devicetree@vger.kernel.org>; Sun, 07 Jun 2026 23:10:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1780899015; x=1781503815; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=/ZHNhdNoux3RwYcj4Lhip2X+5aAHdY5ZDuE/CWM5Cnw=;
        b=C8nkDNcYi/BJAIwUKFOyy4mUoW7V9z/C1M1UAt5xh62fNtFDxqRtUz3W7sNqz4wH5q
         I1DoecbcIkqDpZkXr1tNjfeU0kKfS+znC0fLDfsCADKP9jUiJlWdRCe8MTXQ7gohBEGH
         8UVy8IKRNynHk4R/50L9QfYmTtrc8P66UXShahBXdQhQcGtg9M4r80sA6BoqkM7DIdSM
         Ntu8ddj3sF5gO9ODWOvMwHJU0tBXR67+W56Vnpx0ILLgYkvM6ZEjggJe0B1g2d+Q43Zj
         6Ppjk67SxEajOcP3pMKOVi7eeCPsPg7tlwBFps2auJT+rCO5IVK/9EoA02cgjvcmTFZh
         LKzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780899015; x=1781503815;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=/ZHNhdNoux3RwYcj4Lhip2X+5aAHdY5ZDuE/CWM5Cnw=;
        b=fGV1fzPG0bbXF841S9HiAALUeZtGo/q/on/QfBRV3nZYF2Bt5Yl2xiWusKI4j9+LrS
         sHd7nmq3+T1vLX+tRuXl3zuHWXEsfMO/aUzBdFNQf0w9haa1C3SDQgCa9zq+mvlUpwE+
         p+1WUQiKdVLZXW3/l0WjOQZLFWsT4sQsgfovpsMB66AS2SJ5iSi9nP9v3vx1jSGkjlhc
         5CXjD9hje1HvaO4x5Hai8PkTFKRGIWCg4smXGs8/fQN9MHUI1tIm5X7EM9RF+f6MMzXA
         syRpxUQ3/g2o7LOVcIvV6uuIif+hYc85iMFXWLSx8DiRh1+4ueyF4KGbG3Fng/YPUg6E
         7a7g==
X-Forwarded-Encrypted: i=1; AFNElJ93trormU/fYjhYwVGlx3TytsD8+LXpRmUx+uj98Wkub2um5PmENvRPcmt4l1o2x0Ogx4Ikml0OCMnW@vger.kernel.org
X-Gm-Message-State: AOJu0YxNI7HTpD9sepVCAmjPxEO5At611XDZ21TNqfYgRwpg1dG1yhhx
	ql+qQz3tA4fHbNRpsbAKD7TyoRRnp08MNXoWwOTlZZmQv6E82iYUiVJ2rOplkiuSMhAjbBen6FX
	bgoQ+GkSHDAwgzQz8IDONS5aMCUfSg+5ZrU4K0IPqj77+sxrLmFxsApy43+uw+tH/RcSVgrQn
X-Gm-Gg: Acq92OF+RK6WxBICBJV/0Km9PYMwjU0mNVkvbKYZlatUouyIbzOlVGiw2ZkK8bA9yUK
	oZ+oGm1G39eSfaDTW9PBbuICg5K4MyMB8lw/GUHAFObhIcKlaKJofvCI8Klugn6K4Q17h+vFo8B
	osPTjzsfSrAEnL5HpyDbpfWipKYaLktFlNb69kCcaL+oNTHpJYCO3GseT1SuMkdFcI46canhQ8N
	Czkt0YEDxozMH1W67u1QMU1eMfODfbdtLqk7SC/8sDeDXKo2C84GO8eUO++uake4Y3wALL2v4b/
	SgEw69CBC1ETTFumD7W7QaB7SEtaPepWJprl5ZERAxBqNL5kJ4ZE+ZUvtV8BaioCJ2Kd5ShPxWM
	JHeZ7s9uS4ZfchR8EkCDn7F92yQtVroM8pnBlrGvlEBHhUiGl6hDMVwMe7e3+cjk=
X-Received: by 2002:a17:903:3805:b0:2c1:98b7:ecf3 with SMTP id d9443c01a7336-2c1e849577emr144322185ad.23.1780899015309;
        Sun, 07 Jun 2026 23:10:15 -0700 (PDT)
X-Received: by 2002:a17:903:3805:b0:2c1:98b7:ecf3 with SMTP id d9443c01a7336-2c1e849577emr144321885ad.23.1780899014817;
        Sun, 07 Jun 2026 23:10:14 -0700 (PDT)
Received: from [10.217.222.59] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2c16629cf89sm170885725ad.56.2026.06.07.23.10.10
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 07 Jun 2026 23:10:14 -0700 (PDT)
Message-ID: <dc833e56-e127-47b7-9ea5-58d6d2cc193a@oss.qualcomm.com>
Date: Mon, 8 Jun 2026 11:40:09 +0530
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 1/3] dt-bindings: mmc: sdhci-msm: Add ICE phandle
To: Neeraj Soni <neeraj.soni@oss.qualcomm.com>, ulf.hansson@linaro.org,
        robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
        andersson@kernel.org, konradybcio@kernel.org
Cc: linux-mmc@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, Abel Vesa <abel.vesa@linaro.org>,
        Abhinaba Rakshit <abhinaba.rakshit@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
References: <20260608041650.541502-1-neeraj.soni@oss.qualcomm.com>
 <20260608041650.541502-2-neeraj.soni@oss.qualcomm.com>
Content-Language: en-US
From: Kuldeep Singh <kuldeep.singh@oss.qualcomm.com>
In-Reply-To: <20260608041650.541502-2-neeraj.soni@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjA4MDA1NCBTYWx0ZWRfX+9ZI7XJRNvz+
 tLvd8pXH2cBmfxC97McAFQKGi1iSTwEWXzfv5tzLpOxq5FvdlEDGP/sLOEja6G25IveQUJsYajH
 BW/QiUbxJyeYNhQMR9vuwA33ijYvhx68gmxBUIWriPJLwNKUNuCKfS9FzlnsAELBE000uYWbKhm
 h+A4zkdzZ1HcNEL00Ja+Cp1GZPMJhxSRccG6gdoBsJi7X84d9PYsHQKR5P5HsfDQjA+k+4QX1MI
 pxo94E/p5S434+4uFA5SmGZJ5ge/BHAK6TRBPY4kVo9nJzeQnrhBHYqKx/U+HGK3f/erKvZj3hH
 tswqKV08hC8rnJQemurliu2h0+STRV0F9BJA3oEeaceAOtEXbO/fnHW9jSfFHHIKvIRuOFN+vsm
 suzAnCP6lRGWIlclbBzvqRZNqD6fk8IHHPwEmtfdscigSf9flY/KMVDyoYDLI+souSIYQPvptQF
 GormCJdQfujcICH6p2g==
X-Authority-Analysis: v=2.4 cv=CeY4Irrl c=1 sm=1 tr=0 ts=6a265cc8 cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=KKAkSRfTAAAA:8 a=Z0ZxW08zNbm2n-bVQSUA:9
 a=QEXdDO2ut3YA:10 a=1OuFwYUASf3TG4hYMiVC:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-ORIG-GUID: zYCVBSDiXVyO8GvbDOK1RlufG0xFVZgY
X-Proofpoint-GUID: zYCVBSDiXVyO8GvbDOK1RlufG0xFVZgY
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-08_01,2026-06-05_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 impostorscore=0 suspectscore=0 adultscore=0
 priorityscore=1501 spamscore=0 malwarescore=0 phishscore=0 clxscore=1015
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2605210000
 definitions=main-2606080054

On 08-06-2026 09:46, Neeraj Soni wrote:
> Starting with sc7280(kodiak), the ICE will have its own device-tree node.
> So add the qcom,ice property to reference it.
> 
> To avoid double-modeling, when qcom,ice is present, disallow an embedded
> ICE register region in the SDHCI node. Older SoCs without ICE remain
> valid as no additional requirement is imposed.
> 
> Co-developed-by: Abel Vesa <abel.vesa@linaro.org>
> Signed-off-by: Abel Vesa <abel.vesa@linaro.org>
> Co-developed-by: Abhinaba Rakshit <abhinaba.rakshit@oss.qualcomm.com>
> Signed-off-by: Abhinaba Rakshit <abhinaba.rakshit@oss.qualcomm.com>
> Reviewed-by: Kuldeep Singh <kuldeep.singh@oss.qualcomm.com>
> Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
> Link: https://lore.kernel.org/r/20260310113557.348502-2-neeraj.soni@oss.qualcomm.com
> Signed-off-by: Neeraj Soni <neeraj.soni@oss.qualcomm.com>

Link should go below "---" to specify previous discussions.

Usually maintainers add link of patchset being merged here while merging
changes in their tree but authors don't add it here.

-- 
Regards
Kuldeep

