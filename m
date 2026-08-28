Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4016C45040F
	for <devicetree@vger.kernel.org>; Fri, 28 Aug 2026 13:41:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787924479; cv=none; b=ln0sYeCtoKkHG3aU+f9ayN4Cv1vHPkfGlH6iw/q6cjdfLYIW6bwM1cf8N9fBRj9eVQXqo+g3smqnntgW1Cg5Dl1h2GawkJq4ZpSR/qAYU3Z2Is57W5G+WARhwec7Cz6rrrwd2gEuScOHVPS968KClUHHI8SvgjB9Aaj6sHfjeGw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787924479; c=relaxed/simple;
	bh=KOzSdMKac+N23ouYpqDlMH/iQxw2XM5R0pYY2apAVwI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=OMARhmF6Qxx+iaygAh8r0NMTjfrc2G+yU/unl7V/pxmZ9Ij7BI0V8r/G77eXUpKCrSssWWmlJb6q/57+RrmZK88fXxhpULPOmd0SfzQ5wIDSJOae9l3es2plE20RRP+zscwf+s7GNDlY7abm6m57192GilXUS9dYTPPAdKz/K9c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=lA9WoRct; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=BDn8dWgV; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="lA9WoRct";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="BDn8dWgV"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67SDSTZG2589661
	for <devicetree@vger.kernel.org>; Fri, 28 Aug 2026 13:41:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	rBEnEB0C2+xZB32xn87dXB3ykS2FGO6jzaBxdrgN1Sc=; b=lA9WoRctMnJCh9kR
	vz93K85UuT/bOPWebJK08XgEDrVJjsDYwLXQhbpE8nHHNwxZtX6VdnZzZUR40KiN
	084nNwsAoLvTA6q8PSmANi2C+qId2k61R6ph7i4bFFAVkx1ZyR0HSB8YWYlLCCn7
	pyr2eXkwTqFaZLwS7dGfJT2N29ZqJ27cAr1pp4S4xUezGbGblUbRMRhyQOkMpzrV
	c5EbjKhp2T1CGJ3T2XoioEYOU8IaO8fvvySwy4vJ2lFvbujT1Bo+6qaBill3klPA
	I1kIo7RwKtFSAyUu5pAOgpkMDCfEBsLNNa6YJ8AEguOim6G2yb8wBICs63MUFS/w
	6hO4tA==
Received: from mail-vk1-f197.google.com (mail-vk1-f197.google.com [209.85.221.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gb42r9xwd-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Fri, 28 Aug 2026 13:41:16 +0000 (GMT)
Received: by mail-vk1-f197.google.com with SMTP id 71dfb90a1353d-5c6e562b059so12560e0c.2
        for <devicetree@vger.kernel.org>; Fri, 28 Aug 2026 06:41:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1787924476; x=1788529276; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=rBEnEB0C2+xZB32xn87dXB3ykS2FGO6jzaBxdrgN1Sc=;
        b=BDn8dWgVGNQsb9uxJ6za3GvnK6nGf2kMoSk1GnUt3PROszzijwHmowmWSWmxYnPyZ0
         j6+i8tYtIcuzu7p7zk29BMZM1vkpcC2yyHFxONFD5qk0LdjXQQ5ZPQo7oIPAmqf7cYzQ
         7eRWFtZV1+H56BISsMp8FbCjB6qBPHqEguaJtqTQBieOsHNtsLzFpCcxtPN77XLoGxGm
         rtSpJ7oujkSEglPWo8Xyhnv5PAb6O6hJlkGtuUBYbCTYNCGg71dxsOyJq1VLLmpTJpOG
         tQs9VxiJ07AzvgCg0akxjZAvHtD6cJwY1DikEFIzVWLKBoLSzDXkupOdK/4sMcCdj+9J
         3Wsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787924476; x=1788529276;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=rBEnEB0C2+xZB32xn87dXB3ykS2FGO6jzaBxdrgN1Sc=;
        b=J64nMho7ULG8JhZXkEIM+uj1F7c0YNb/8nN4grq2MwCcV/fSh+14ITA4oMC5AA91Tn
         QWQlowFHyi4c+QCdqBULs8R5ce1EAL6apXJuRpg0/Q1sOdxsqmkt/ns72ALTnRfJvamt
         7bT012H5bZor3DVYUh7sf/f5VjDdK/gbJHcR/AjJ/31NzydoWH+gHZfXpgSFjdQNk4Qf
         Ibe9AFO9Qn9w26gZhlglEaeIXdtHF/S6ZUD5PWzX52n8aYiORq5EJg2QzAJikImuMQme
         tJUfKwqHvvEa1fTUEk/aNdDaBg8qj2YlpEYspBauaKLFIyKZ4wM6yjggWgkvrgsmwYjM
         TERg==
X-Forwarded-Encrypted: i=1; AHgh+RrKIUCTepNeDigLCO26nPJqp4YTAVAS7L7gfst4E0esJCIAWUreo56QscN86eOL9nVm2GYOFZKGPBCd@vger.kernel.org
X-Gm-Message-State: AFuF++msQ64V/pIzkyoslbNuuZXsV5Ihoa9h9GAIHPU4x68bE4s/bQT3
	JXR4ywvU0o1sPeyWDjhTH9Hcn5yPl/c8ahEtb2/r8mK+g1cVtLnczFg95sDb7QZGDSMS9cygBRB
	xHZ8DV6EP9Pjf4MFKJi+k1t9apNhXQt6yQ1o+B1pNWQebQYj6NKkyhO9jJRSwySPm
X-Gm-Gg: AR+sD12hWlwl00yZLMGWc8j9SVer3rqDOkyR5e6a6vCMajgJ4h1ejF64TJmakVernSG
	u8ER2Rml60OheJPUS+cQ2zQhRnVlj1iuY3152PbNg1CtZUQM9NGM+SP3TXsXDNJuuoxdcBoqLxL
	P6LcTl1MmaJV7xHvOG84XLQpODgWlMe2wPyHASamWbPX4KBPkv6EROovnVTVKff2CSOpsa5FHJG
	tirvMNmxE5gjIEy37DBdlhKHoaaz15nAfdrvqj3ei3qvo9je3Rfx9KCmLVQQcCc72phddNdy2J1
	taPhbdffj41QpEN3xxponTXZelmpzNcuF1GuW0dgM9rRtzmfgE7L62Xiwqap1CkHo/ljjnsWqjv
	wljMCo0X+Pw14r8+6rg7MRWs=
X-Received: by 2002:ac5:c89a:0:b0:5bd:7446:e3ff with SMTP id 71dfb90a1353d-5c680ea208emr903892e0c.0.1787924475565;
        Fri, 28 Aug 2026 06:41:15 -0700 (PDT)
X-Received: by 2002:ac5:c89a:0:b0:5bd:7446:e3ff with SMTP id 71dfb90a1353d-5c680ea208emr903882e0c.0.1787924475167;
        Fri, 28 Aug 2026 06:41:15 -0700 (PDT)
Received: from [192.168.120.193] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-3a30559cfccsm3004681fa.40.2026.08.28.06.41.07
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 28 Aug 2026 06:41:14 -0700 (PDT)
Message-ID: <e4e3c02a-20dc-46f5-b27a-9fa2667ca999@oss.qualcomm.com>
Date: Fri, 28 Aug 2026 15:41:06 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v8 8/9] arm64: dts: qcom: monaco: Enable CDSP cooling
To: Gaurav Kohli <gaurav.kohli@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Daniel Lezcano <daniel.lezcano@oss.qualcomm.com>,
        Amit Kucheria <amit.kucheria@oss.qualcomm.com>,
        Konrad Dybcio <konradybcio@kernel.org>,
        "Rafael J. Wysocki"
 <rafael@kernel.org>,
        Daniel Lezcano <daniel.lezcano@kernel.org>,
        Zhang Rui <rui.zhang@intel.com>, Lukasz Luba <lukasz.luba@arm.com>,
        Manivannan Sadhasivam <mani@kernel.org>, Kees Cook <kees@kernel.org>,
        "Gustavo A. R. Silva" <gustavoars@kernel.org>,
        cros-qcom-dts-watchers@chromium.org
Cc: linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-pm@vger.kernel.org, linux-hardening@vger.kernel.org,
        manaf.pallikunhi@oss.qualcomm.com,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
References: <20260809-b4-qmi-tmd-v8-0-b15d47adc379@oss.qualcomm.com>
 <20260809-b4-qmi-tmd-v8-8-b15d47adc379@oss.qualcomm.com>
 <01cd0d90-2908-42cb-9ae8-29828d4c03a0@oss.qualcomm.com>
 <ff0c8c22-bd37-451f-80bb-35389ba162c6@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <ff0c8c22-bd37-451f-80bb-35389ba162c6@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: pxY5Aq3AwXH5wqIfcP3b6KexekOHHg7Z
X-Proofpoint-ORIG-GUID: pxY5Aq3AwXH5wqIfcP3b6KexekOHHg7Z
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODI4MDExOCBTYWx0ZWRfX5CPab8EOm4kp
 0GTasB3fvmuzHOeW/mu05RvDlI5dD/z6a4SpLjs0GJBnFhkBC3tumj6FA0Opih0vBk995Vg9oKr
 gpfO3HD1u5Iw0nKb7eQXCecX0oFtIZXKeNilBvLOKsXOfG9EAyOVgDfNU+K1pHdBjOiYl30kBOw
 gtzzktstpqsu8jEq/0gMuNv+mtNFOBtqIr9ZDgn0JLzsqWkkYX7iDyLVWCw+FRdOg3EWj+wlHtw
 8sYwTyn1i4LyG0/Nd4KlEElJTr5SK0Ap5khPv/GT/7YdR8aBtWq5ub7dPpYwhXJEllhfls3hnA8
 G7E3XYVy4wMlPJ9s1IsrJvKeXl2Pge7nCLBm5Y3T0dgnWiF8pp4MhFPN9LeyylLunDoOUlCxliL
 94MPbVWSOBgMH/VlU3caHl5Nl0w97+NbTHrWQE+zd1AIt8IJ2IK1wF7W8rTeKXvQ6Bv/sHIcgDd
 4iY+3cLRkK+Lpnv0k3A==
X-Proofpoint-Spam-Info: AW1haW4tMjYwODI4MDExOCBTYWx0ZWRfXykro8PKLhv2n
 7Kx4VHK5cCzA4vcJzf/EHtGjXpGcFzsleFXViJrN/rEr0/4rsRVyKRgO9COHbGDYIp1OqqAvzmQ
 EzasBGkb2Lko6eG/pgp/eT9/+nrTDjU=
X-Authority-Analysis: v=2.4 cv=Fpo1OWrq c=1 sm=1 tr=0 ts=6a918ffc cx=c_pps
 a=JIY1xp/sjQ9K5JH4t62bdg==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=aKGLMg70GXf6WMUK1bUA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=tNoRWFLymzeba-QzToBc:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-28_04,2026-08-27_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 spamscore=0 malwarescore=0 lowpriorityscore=0 phishscore=0
 bulkscore=0 adultscore=0 suspectscore=0 priorityscore=1501 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608280118

On 8/25/26 2:25 PM, Gaurav Kohli wrote:
> 
> 
> On 8/24/2026 7:49 PM, Konrad Dybcio wrote:
>> On 8/9/26 2:29 PM, Gaurav Kohli wrote:
>>> Unlike the CPU, the CDSP does not throttle its speed automatically
>>> when it reaches high temperatures in monaco.
>>
>> [...]
>>
>>>           nsp-0-0-0-thermal {
>>> +            polling-delay-passive = <200>;
>>
>> ..and here it's 200 - I really think there should be a single value
>> that makes sense, this seems no less than random
> 
> Thanks for the review, Konrad.
> 
> All targets added in this series use polling-delay-passive = <200> except Lemans, where the DTS already has polling-delay-passive = <10>. This series only adds the cooling maps there.
> 
> As per internal profiling, 200 ms was chosen for remoteproc/QMI-based cooling. I can send a separate follow-up patch to normalize Lemans to 200 ms as well.

I'm fine with a profiled value that's different between platforms if
it's really beneficial, but it should be made explicit that it's
right. If you believe the current settings can be improved, I'm all
for it.

Konrad
