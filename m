Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C32A636F911
	for <devicetree@vger.kernel.org>; Wed, 17 Jun 2026 12:11:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781698300; cv=none; b=fi6Ym1lUkC7CGcktPacnnbXIvSu+XjNctjMVFeWmd2Rxm33TWmnjDP2AL/3FfIp5zPHeTlTw5YRHVjy8IU+GsoN9uYhYxwJtCXCC8updvxHbyn9waAxaoVDlP6zKUhGa7vsoi9tNPWJGsTV6kxpSu/pXSslrYKnGg0dvAMADemk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781698300; c=relaxed/simple;
	bh=U065ANd9oOx4xWRmwPkvwRyxcFd99MH11yA+2AkkyQM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=THTOq/NdgYE0u1wCjTVQiQ5HY0rbR4+ZAw5GMQWI11MZASuq6JROqEq34ug/Au3jVr+YjwaNNnYb4LcsUyWoRnfFOvBpB/hqkJ1deOfz1y/wZGQ68qU87k57kcbHTAeL7izZ2RZQBs9y2dCFaH1QcjvzBITp3YolkSg0AjJY1CM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=l7DFG+4g; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=b2e/PgHs; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="l7DFG+4g";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="b2e/PgHs"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65H8W0OC2056645
	for <devicetree@vger.kernel.org>; Wed, 17 Jun 2026 12:11:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	RvYjcqqwjarNDsMWrLD79SnsXgpWqHBe8tU1zyG2q0A=; b=l7DFG+4gfMlKacwE
	AnEXuhB5QIYwdpfRSS2uRr5gcaA4076kQgncB78jOKYnvoQBa4l0ajdMRBtXr3FQ
	mwqK7A3KFAIFPYe3QMv/LHu4EKD8VzXo+a8zlLNbn1Sr41yfbNMz8qdv4EsKx39g
	erM5gYTyrdrKM4rRoo3w8UXq0v4c2v8HFoYtpbCE6d8Qmmnv+OXSlxNHQmm/lLns
	JReE59GIZLK3izAPhYcMYG3Y5OYxbgz8Odkw6S+usDD/wpDC9ykqpG0A+jfoqwRb
	L4AAACcu5xrUwlYtwZtqy0QYMlsWy3PxbtNeFF26Yn72EppPp4gbpr2jlsR8rHYh
	XwyfGw==
Received: from mail-vk1-f199.google.com (mail-vk1-f199.google.com [209.85.221.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4eueesb1y2-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 17 Jun 2026 12:11:38 +0000 (GMT)
Received: by mail-vk1-f199.google.com with SMTP id 71dfb90a1353d-5bbceb4fc27so10718e0c.1
        for <devicetree@vger.kernel.org>; Wed, 17 Jun 2026 05:11:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781698298; x=1782303098; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=RvYjcqqwjarNDsMWrLD79SnsXgpWqHBe8tU1zyG2q0A=;
        b=b2e/PgHsc1fcEvzpBUHHRcH76TzNSsrUfnCB95p2Wnre7zx7tR22kFa4PWZFm8aItG
         VPRY6PanFvIG1GITcr/IBVik3M7hJL3Jn5biuY0prhYrMQDtZUzV8g0AFSjzyB+lKHEU
         MbocZJ4MQqbsoCgjOnVD7xbRWVjv4H3GfH3AqNyYftKa8FUV5Wxt6nPdPgyVtsZIlwcg
         XgA0X6q/EPhExZHBhem/QE1Zn5xJD05zM72ehiFZDolBOS2U4VjLNR7SIJC5npv17yUX
         MCqb78MV01UNqeyhCpiQT6zMJiEI9J+TE7Jbjf2pFfCYBjJBJRWZfT2JH942vfcZovJf
         rtrw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781698298; x=1782303098;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=RvYjcqqwjarNDsMWrLD79SnsXgpWqHBe8tU1zyG2q0A=;
        b=OhlOlmPnWUH7nwBeGUiUdW1V5hRtHwRmpJoThz1XzndxDJlDCtw/sJGbOFK+N7+WMD
         spXqlWKVF9mr/PmF+Lr/9BjmMHLDR3cYN45zUsGyd94swJeYSqxGgS0sBbpgoLMrf6IP
         Zu8qDpOIkCxHbzdqjmkw26ooWu9MWmTHYsbsH4RcTPKl3qsXujVy132ZBd5uc/6fyOWF
         3x1qvHksj2UihsO8KnLDYr53kCP0DhycznD701t2+kvaoG6IH+1vXe5OqVv+hCHy+RPp
         cx6pprdCR4cb0nMpQp3tzPNXAe8DseDV2LEnmLOV1NDh7vczvAZU78zkdy77n6SUMIdN
         pphw==
X-Forwarded-Encrypted: i=1; AFNElJ+OMkDOQm6euh3qNDKrqYTkmqZblXxTtvV0NeWPUAu1Q04Gw9TrL43uc+SFEOosNLbMqJ0JyHagEhj9@vger.kernel.org
X-Gm-Message-State: AOJu0Yz3GWLJzCX0xlPtDEe2TMYqLpVjFWeuGvm+yZL8biYg0TDaXLpe
	WNVX2uLYgU4i7fZcxwd/4Lhokw2+Y1urkckCkQbHfnIxlUYIRm3cKv1QuBB6RLDwN4ZJtoYm90G
	jcIQ51a4pkxvmi2mOc6q9EyIPI7Jpka5eZQg1Zikdrt+yPgNv51zkXYooElJ5ToLz
X-Gm-Gg: AfdE7cm7l5v2DOm85O+2OF5JzKOGXEFbyMo9qTnpmp57oZyq/y9he/qzQLl7hafHNsl
	Hfh8XN9scpBcdobVJHoQQo+Ox6VolCdL+139gBqV9Vh38rUKz8vcgBBmyftuFtyDbsqULN6n7nK
	1DEV36fdtoEVQgQoERphADT/Ist7KGUWdYOi8nn2XrobJbstCkx3a/BXEHjs41TBbKiCsMkELC8
	orPPHHH9cJAXDekV7rfB0FmYGtB4vbPohzp9kW/Kc2+03VZ15CcuTtJkIAARJbW4sGtlCM17WP2
	CVDde1DYBsi26rFcHS2eo/RnDkFqRhDVJ3+VPRY3rFv/AQOalOrI8e/0LcXdtkOSUmrgF0978ly
	EM2kELlSuV1JJ7I6odnqfZKd9v62FqtyF+CA=
X-Received: by 2002:a05:6102:8499:10b0:726:e608:6651 with SMTP id ada2fe7eead31-726e617ab08mr45114137.2.1781698298057;
        Wed, 17 Jun 2026 05:11:38 -0700 (PDT)
X-Received: by 2002:a05:6102:8499:10b0:726:e608:6651 with SMTP id ada2fe7eead31-726e617ab08mr45100137.2.1781698297638;
        Wed, 17 Jun 2026 05:11:37 -0700 (PDT)
Received: from [192.168.120.170] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-bfdb531896dsm781731566b.27.2026.06.17.05.11.35
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 17 Jun 2026 05:11:36 -0700 (PDT)
Message-ID: <a956a733-7bb0-46f3-bf21-142d5cb8fc3e@oss.qualcomm.com>
Date: Wed, 17 Jun 2026 14:11:33 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 7/7] arm64: dts: qcom: mahua: Switch pcie5_phy ref
 clock to RPMH_CXO_CLK
To: Qiang Yu <qiang.yu@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd
 <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Taniya Das
 <taniya.das@oss.qualcomm.com>,
        Konrad Dybcio <konradybcio@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, krishna.chundru@oss.qualcomm.com
References: <20260527-tcsr_qref_0527-v4-0-ded83866c9d9@oss.qualcomm.com>
 <20260527-tcsr_qref_0527-v4-7-ded83866c9d9@oss.qualcomm.com>
 <db074223-ac01-4ffe-ae82-187ef0cb2cbb@oss.qualcomm.com>
 <ai+9CYntPuyEEcLX@hu-qianyu-lv.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <ai+9CYntPuyEEcLX@hu-qianyu-lv.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjE3MDExNSBTYWx0ZWRfXxid8x7B8AWCr
 KPdstq/wCO4WYI/45cPT/4Yb3uAfDCymqDyG4Pgs/sepwH3aLXkrjxPiUKed5mCNnnePpo1arUm
 jsBZtRjEifStQKilMlV03EQvtkPkmoA=
X-Proofpoint-ORIG-GUID: qx4etlvJk_j1QxzjV5fUpuNAu5BEkpjm
X-Authority-Analysis: v=2.4 cv=R6oz39RX c=1 sm=1 tr=0 ts=6a328efa cx=c_pps
 a=+D9SDfe9YZWTjADjLiQY5g==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=kmjxFz_dt4H88yzuuMsA:9 a=QEXdDO2ut3YA:10 a=vmgOmaN-Xu0dpDh8OwbV:22
X-Proofpoint-GUID: qx4etlvJk_j1QxzjV5fUpuNAu5BEkpjm
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjE3MDExNSBTYWx0ZWRfX0G1mhANwyCqj
 iKGhGYWD/ZqgOwuB8T3NUa4IPpMOx7vTyzbjXb5zSLAdBbJmljj8bELYXY2/leqzNhirucMfrj3
 lJZEsPHdOyMjMRWSPxUhqNf/lAKeNUkFm5HUnQcRGJHTvUS/ATHm5jtlQGkyYPMApQBBOkocRSz
 35Rq8vbPZ0d52LU6/chCtJhmbvCOkiF1K/bytyHB/y/EHEWjfFGiHJdmPUi7S0zXZyi/sBoYgqS
 sYG/h10+bMnKT3tpN+Bzbt8c1mVgd8R1Vw44Ld1Lt2ToFd9890VII+Svb42FHcBPftujxljoOhn
 qr/MW/3NDCcTxQ8dBkUZvSfOqGWfkcnJhsoL7JbfXIE1/Tkv5UoreKNuA/lesbDV1Focqhy8/x5
 cS5mKtUvFp4PUJVZOFXm+C0WnGUq35f3WVVhDEQguDM1iZxOnwnmo0bhPOSaAZTmhmRhGEZtiFN
 mi1oAgfxHNDmDzS43sQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-17_01,2026-06-16_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 bulkscore=0 clxscore=1015 impostorscore=0 phishscore=0
 lowpriorityscore=0 suspectscore=0 priorityscore=1501 malwarescore=0
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2606170115

On 6/15/26 10:51 AM, Qiang Yu wrote:
> On Tue, Jun 09, 2026 at 03:06:02PM +0200, Konrad Dybcio wrote:
>> On 5/28/26 4:29 AM, Qiang Yu wrote:
>>> PCIe5 PHY on Mahua gets refclk from CXO0 pad directly, so no QREF
>>> clkref_en voting is required. Override the clock list to use RPMH_CXO_CLK
>>> directly instead.
>>
>> This is the last piece of the puzzle that this series is missing.
>> There's no QREF clkref_en, but there is a refgen that needs to be
>> powered. For PCIe5 on Mahua this would be L2F_E0 (0p9) and L4H_E0
>> (1p2).
>>
>> I think the easiest (laziest?) solution would be to add dummy clocks
>> in the clkref driver and only toggle the required regulators. Another
>> option is to defer back to individual drivers (such as PCIe QMPPHY).
>>
>> I kinda like the "one central node to drive power" approach, but I'm
>> not sure others agree, since it stretches truth just a tiny bit
>> (although not as much as one would think since there are *some*
>> controls for the transparent-to-the-OS hw pieces in these paths still
>> in TCSR).. Dmitry, Krzysztof, would you object to that?
>>
> 
> PCIe5 PHY on Mahua does not use QREF at all, so there is no refgen for
> QREF either. The refgen supplies you mentioned are for the PCIe5 PHY
> itself, not for QREF. For other PHYs that do use QREF, there are two
> refgens: one for QREF (voted here in the TCSR clkref driver) and one for
> the PHY (which should be voted in the PHY driver).

Okay, so in this case we have the refgen regulator hardwired into the
PHY block and we just consume it from the PHY node&driver, am I following
correctly?

Konrad
