Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 91CD3212564
	for <devicetree@vger.kernel.org>; Tue, 14 Jul 2026 04:59:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784005148; cv=none; b=i7+57D7TOcX36sVEPBuWOmvxlmvSD4cjd2tshwWti/xb+XxEgAZ1gRZwuudk9Q8M2/3s+FYC1Em3hwRGTxrSPQ0Cl9/75IPukYMDXZ6KSH/NVOo8E/AU4VeaumTNSjmuWn6yPU9gArkbOp+ID+QLDvaCxgWBsSS3WqWcCJCR404=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784005148; c=relaxed/simple;
	bh=uTbwqyIxqUuo7FJSAFS6UCtZV8KF9JsL6sBFUuQtLe4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=G6+pOWvnuKlZCL6d/rcYY7wZd1AOLMwn7mG5G3tYm2aF/DY2wFkVruP8lGl5ZqBVUTjFUMThHEJrFGuOpKdhBFlmtEPhMcPIh68LlT7DfdYIcZq+qLfwGPG3E3DpRDYNwXCABKOBd7KpIbaDqdRM548Qekybdzjxdph/pMVqAQQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=jhgTw6cl; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=PPAImNPg; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="jhgTw6cl";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="PPAImNPg"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66E38QCp3303167
	for <devicetree@vger.kernel.org>; Tue, 14 Jul 2026 04:59:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	050M84tU4fgUIaCQsDFK/sQz5gKmoa8WZe7SdknJi4U=; b=jhgTw6cll4zOa432
	wjJvtawrH6XKb8wVpMrUpxfXo+4Eca5gX7xcfmpHk7o4ikiK2/HvG5h2Ye70GoVz
	pQ2HIRyRHJTl1jB3HiEzVkqPeji1d8DZEHqW1SBcL1Tg6GZ58Ktd0qJMI/oilQnA
	DFGAA/pLoTulzATVHfhubGFyoyU0c9JlE9FRkXUDXLqzl8Pm5Qv3+q4IHy9go89L
	WcaEuQwgpEjhkPP0EcXsL2FxQtbiNI3kTjyyVRuxKQcwiloLBn8QNtxWJQjBaycP
	+kgRzPZytX1e13GPf2oQMED7SsihwVZNZvaMIXxuMyS5J455ntQyukkzdT9AxD/i
	NY/p8A==
Received: from mail-pg1-f200.google.com (mail-pg1-f200.google.com [209.85.215.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fd44p1ypk-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 14 Jul 2026 04:59:06 +0000 (GMT)
Received: by mail-pg1-f200.google.com with SMTP id 41be03b00d2f7-c856470fe9fso531626a12.2
        for <devicetree@vger.kernel.org>; Mon, 13 Jul 2026 21:59:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784005146; x=1784609946; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=050M84tU4fgUIaCQsDFK/sQz5gKmoa8WZe7SdknJi4U=;
        b=PPAImNPg3TzUJ7N1p4ltCHeU4iso2AEVng/R0LjMYI+6O9FkEmxg8zeTr3+8wAI9wI
         kK6/1H+F3GJICRLpvaoJXn6+5Q78x+oPi2vjZIPSPOckyrnMTO2IFXcIZ5qojFtkrwt7
         CmRNKctruX5xltW4yTsYchR0FacRM7dRF2Bg6qFCubG6+HLLH4N2ETYxi4WEMkIsSKlJ
         +/jAeTCXIaWWUzvFiF+Qjpt9hQUe7/aEWkLhK4Ibm54Onk1WTPQdnQmujuqJoYZNAkvK
         JjijMguxKh+3wM2g12AYHPDe3gRXhMZy9W2G/IYbO/pTzRbqHgPqNkDw0LWWTmCFsCZF
         lVZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784005146; x=1784609946;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=050M84tU4fgUIaCQsDFK/sQz5gKmoa8WZe7SdknJi4U=;
        b=RmYVZSiHWlLX//RFKTIGlPIx6AdphrbeCAvXQN51PCf9YDKoVmTUSfYtlVYox2pb/6
         wY1QVpS26WceHrJsiPiZhb+lAKhyfHA9kqM7HQi81F0ACPFQAPBFjLGhcd4opzYFLP8F
         EoL0CM0Tgffq3ieJ3JvRLGI38nue5X3yWLpFTCSqXhtfPTDzwEp5z56WmrHmtnVHhng+
         o3hE0I7N5gxuhM891yZpyW58A0ulaVhRmL3ZBc5BT0lICMAR9cBati7GQt6/1TtxxMt6
         PADQzabZbbcpEyuGBWZcZFIRDA6JdL6Q5ARizVOUp7NilreZhoitiyN6XZEGGkZXGwI1
         ngcA==
X-Forwarded-Encrypted: i=1; AHgh+Ro+QK4kG8vGypugKcL/RKwO6NPFabu5i9H+ofJ355Rnb00QhSeyejsiekRVphjJAAHMPD8zbhALygdz@vger.kernel.org
X-Gm-Message-State: AOJu0YyHen2CcBIZck9U/YUYTnBiq12tNdn/yDAkfK5ZeQfnm253Flhf
	MkN/GjdcH1Af10zRL3qY2ARCn7m6Ik/890jhkBWb5tGbCF07h0MX5MZemUyIMOY+BgW8/BiUaal
	LldVla0yffLkDwiIbisXFOpJVZHigKVM9yfXHP4ybR8UR7Wbq2MOzXcELhTdChhob
X-Gm-Gg: AfdE7cmABon2PuVOT65yuTgT5AJJl9punlZ8Lb6JMXdilfYs9gApix+F/APvhXSvvr4
	ZgVLOErb09Mgmo579DyZthhCi823Rpz8t25FsAck/2pmtzUW/E+K9m8i4iMf0dAGpT7OB06Ajnq
	OMe8sIITfndq09opi6k9I4NwdD6YfsblSRww3wQuSvX4vUajqBF4cyulm9C/JFJ9RWx0xAEf4tY
	2R59eQ6ZMy1ZM11G3RQPvW56BBxdcRN4B7tRK8xjBQZhxJVbzKqa2UEDL7172y7qOJ8hfDfR9HS
	vkKsjsYEWaqtzqmyUiYJ2HJp8ODGtnuVqS6Mr2jFy1hzTwPBd7oaN3TzUxpsD4gHYZPzC7jryKh
	0e5Ll24DwHTKifst7Ck9MFMVQGRiZQeVGTmhQlnE=
X-Received: by 2002:a05:6a21:3a94:b0:3bf:63af:84c with SMTP id adf61e73a8af0-3c110a74037mr13333748637.41.1784005146223;
        Mon, 13 Jul 2026 21:59:06 -0700 (PDT)
X-Received: by 2002:a05:6a21:3a94:b0:3bf:63af:84c with SMTP id adf61e73a8af0-3c110a74037mr13333701637.41.1784005145795;
        Mon, 13 Jul 2026 21:59:05 -0700 (PDT)
Received: from [10.217.216.242] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-31174a583bcsm81953564eec.19.2026.07.13.21.59.00
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 13 Jul 2026 21:59:05 -0700 (PDT)
Message-ID: <3d195500-96b7-4ce0-a6d2-b8cd3a183168@oss.qualcomm.com>
Date: Tue, 14 Jul 2026 10:28:59 +0530
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/4] dt-bindings: clock: qcom: Add support for Camera
 Clock Controller for Nord
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd
 <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Jagadeesh Kona <quic_jkona@quicinc.com>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
        Imran Shaik <imran.shaik@oss.qualcomm.com>,
        Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260706-nord_videocc_camcc-v1-0-bae3be9e9770@oss.qualcomm.com>
 <20260706-nord_videocc_camcc-v1-2-bae3be9e9770@oss.qualcomm.com>
 <20260708-mindful-alchemical-loris-5b6b3e@quoll>
Content-Language: en-US
From: Taniya Das <taniya.das@oss.qualcomm.com>
In-Reply-To: <20260708-mindful-alchemical-loris-5b6b3e@quoll>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzE0MDA0NyBTYWx0ZWRfX3TMI8QpXZPQF
 5EVUa5VMLiPq9MiKUnjoiXo8o4FokfabjHGWTa9clx8OfTlaQVfUQTFHv/B+brGxKxtxW4Hg0DG
 kMT/6ixnQZ7z8/AKRse+pjWpKdR5F7g=
X-Proofpoint-GUID: kjDCWAHdK1Ho8_kXLBekymEeFkfJPWF8
X-Proofpoint-ORIG-GUID: kjDCWAHdK1Ho8_kXLBekymEeFkfJPWF8
X-Authority-Analysis: v=2.4 cv=BZroFLt2 c=1 sm=1 tr=0 ts=6a55c21a cx=c_pps
 a=oF/VQ+ItUULfLr/lQ2/icg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=SdgQeHLHCxk6-GMbiogA:9 a=QEXdDO2ut3YA:10
 a=3WC7DwWrALyhR5TkjVHa:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzE0MDA0NyBTYWx0ZWRfX6JVbi2ZEhAKe
 LGCmOIUgLEHDZpgtm61HXvUmzVGHCJ1GMa62T47Ml/omipdBC+HY6N+OIpqoVykHkqVxjGmMImL
 auoi+HqfdOsqekio3ZhUn/j6DMSpAxs/l/Q3IkEBXsz9hX8RDP8KKqtzSEfYYy39m3mQ99MFpYQ
 SKdAy4ivW+rMaAikQlfNNmI2PnBVb7Q9hutjnuJzZgtHKqZXn2YXSEH55h1+cblb75BmoT1PcBR
 5Qj6ERUo5svJPvwAQecbGs4T9dCXrpmyTwsu3LgQetNmUvj/WTWadXYEcHhnCsCwGtp7s33on1x
 iTx08pgVY6pbUlHrFN0YaEfzpZqEe3WtMobFmrlRL/WUnY4p+yGiSLiR9OFF7WUKSomE9VE+svg
 6xA126cVFAe/dVGHfXaQsgxiraBLrEqrKl7R0ACXipUzs93aCJKNlpEITB0I96Es45NymSMu62p
 94PGdDtMRXFJdBVPTKg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-14_01,2026-07-10_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 spamscore=0 suspectscore=0 bulkscore=0 priorityscore=1501
 malwarescore=0 impostorscore=0 lowpriorityscore=0 adultscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607140047



On 7/8/2026 2:11 PM, Krzysztof Kozlowski wrote:
>> +      - qcom,nord-camcc
>>        - qcom,sm8450-camcc
>>        - qcom,sm8475-camcc
>>        - qcom,sm8550-camcc
> Why aren't required-opps not required?

Yes, it is required, missed to add here. Thanks for your patch
https://lore.kernel.org/all/20260708-dt-bindings-camcc-required-opps-v1-2-ae0871774210@oss.qualcomm.com/
should now take care of the requirement.

-- 
Thanks,
Taniya Das

