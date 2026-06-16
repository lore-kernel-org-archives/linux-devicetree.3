Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ADE6734D90C
	for <devicetree@vger.kernel.org>; Tue, 16 Jun 2026 14:05:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781618750; cv=none; b=juVTm2ymZTaIR7FfqwhSmbTkVGUOT+74HSZC2XgNNVNgqh9ig9mlLZbGYvSCXE+9XZw2QcCqIkYOpMAxo/xU5fACk8ep4gaN2xVzAJgSJbE9j2dMnUzQPSy6kZaSk5BB/P0y1ps91rgD34yeoKg+OA9sjaGKrjHQnoS5JAwLHoQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781618750; c=relaxed/simple;
	bh=nbzR++7XCb9Z1s2RaEI4dZuKrlRPUN+JTbifrcoxnUo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=oDeo6npHuMpIH6A2Ir5UuuPxNfzl27WBVPbAhD0VqdKQNd7swYB2KZjrQzmUxalbXhFwSKaFqHS6+jtKqSEuOWZUZcRlnAVYnF+hCQ91If23IT36Fj8tdpGM5jHj7VWSlNtDPgiYugUtdnbdGyB9IH9NBmw1nXx5Py2dmwvBizE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=LuGUpxpM; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=XALaBfLx; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="LuGUpxpM";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="XALaBfLx"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65GDxU6t3731485
	for <devicetree@vger.kernel.org>; Tue, 16 Jun 2026 14:05:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	1UgIGSZvL4pwGhTtVdZPQ2gca9pBIPfHY+k5s1E36o8=; b=LuGUpxpMKZA8G8MZ
	TIzD8/Gc/OynOZHiqHNAafg0ADsjQMWbJAT5GchT7NN+dHrPFIg+V6e8t4dLxv1C
	L0yX9qwRP8n+rct0c+QONr9EsMvdjQjSr9/FOMmsk8ENYZ6kU2Rqu6I4XzIOaDPM
	HBr3rfPzoyYFf2wFyDEgC6+siTKAUYacU5mUQPL9Ckx5Q2q5cnsEq+A6AEbmfWWf
	5u/hUCLLhv4MFInJH1vnCev1jMH9/EXRHd4SYbRIcgQv9of8SiOLe9gKAVOrILDn
	QSvM+A0HTxWmoHxHq8RMCo4/XEM/IeIwDHl4Yi60hGrIGjj+wV3RNwf/oOregv91
	pXlIwQ==
Received: from mail-vs1-f72.google.com (mail-vs1-f72.google.com [209.85.217.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4eu1yssqau-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 16 Jun 2026 14:05:48 +0000 (GMT)
Received: by mail-vs1-f72.google.com with SMTP id ada2fe7eead31-6c4b898e8d8so219534137.0
        for <devicetree@vger.kernel.org>; Tue, 16 Jun 2026 07:05:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781618748; x=1782223548; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=1UgIGSZvL4pwGhTtVdZPQ2gca9pBIPfHY+k5s1E36o8=;
        b=XALaBfLxq8yJF2yMPn2wM9xhsKp0uuMsRNSX3dO3LXKfSjuYljOQKmIG7f1hZYzwCi
         r9VluarImHmkQ4gAnQ6nTzRtBgGKlYteantJR5Csky8myAuxzUoMLf2XYgPPrmKkBnHL
         pZG7Mk/p5XoLKrx3RgZDenPW/aMVQhD34dNz7loRf4T5c9713SsupJemgy5qJjx6lVpV
         x4yONet6/ATHBJWAG5KNwdDBI8kNOrZKEK8MemUNriAlXx5L2sK2N3/n1lvSRjat7Zd9
         Q9LWP0eDc6oqu2wuig5n/i1lWX+vMjdE/aG3mBltV9rzmBNtVnIDL+meXf5EyGy/vLh/
         SQag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781618748; x=1782223548;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=1UgIGSZvL4pwGhTtVdZPQ2gca9pBIPfHY+k5s1E36o8=;
        b=eLpCRsVe+/IvS2z2tyvsKAyVgf9oEo7GEsQViFCcx810kNcd+kOp2wU+UsxEAq2a6E
         MKCQtyEPNIAuwncW8DVAsOI/son1xDYRubKwKgV9QRb93cAClbmrrj8OxGSw2kPCVufg
         Y/2EmEuVakc/37hnirvCU9ouNyRakSJcuf0zmwSHY2P54T/xRU70Cq8SIA51Ow5/LfiS
         gpYdpHAXgJBZOLh3YTYJHh90am8rrp823Tg1AtsgWabF0a8bG+FR1QSf6HuKMDs0cULv
         7QFMy+j04PeFr07oyMkMXb1h1OWcUD9kpG7A9vBI2Xy90OP+lTJk0GlhfqVkDUppw1hB
         T53g==
X-Forwarded-Encrypted: i=1; AFNElJ8pWwJl68ZZ1hgRFqq0WZpQQ9fhM132phwW/6stpEGZP6Y1k3E8xlkJRcpMDz17ZtwmvHWJVA3ATZwR@vger.kernel.org
X-Gm-Message-State: AOJu0YxVp0u1gSkLupNHycnQTpXPjwAMhxyNIO3YP4BTmhBQc4IWonFz
	WdhpVYHLl8+6A9blQdBLvh2KPU1sMycnrVuePLtPjsd88wixTi65fQcnGslCnGsoV3DzT77MguJ
	KpIpkd/gMSz6ULzI4oPpP/8Tn+ROC+vb9n6CVudiT/r23K/bgY6rte7w2QzAa50Ck
X-Gm-Gg: Acq92OFTvFL6GKgm7LBIv93uQnGbMrthu3D39+VZie5paDenzrAQUR8zaVjW83bxgOQ
	raeCpAomuYcwwFTpbTwGSJfrJTKY29WYDtNA3FSxjp/ZTeyOSPzWfpN3THXqJJzZ0k2IF/rGODB
	srLLwXj4e8EFvFD2k+cC2i1V+uj9h+VQLcn11Z4pPOURia7Fn0bo9ffzUjKG58JQL5pYd9Oar2n
	wNpIO/JGm79HADsXZsonUQjhWKxPbPu3R/FGh8gBRipE1TAJuMqVAzbTY65Ape8oOOOje+xPq/o
	gMmJQy2WFNfAR4YWtbbd4rLvI9tmR6+tHw1iGT+poMyuoLvoCpUs7tc3XchnS+TWB0g0Jat8g8j
	tsMZbacbjLDQnsi61hz9Y6pU0homx9qe9y5ePBO1a+wKiIQ==
X-Received: by 2002:a05:6102:f07:b0:631:2be3:b6e8 with SMTP id ada2fe7eead31-71e88dd8cd2mr2916788137.6.1781618747884;
        Tue, 16 Jun 2026 07:05:47 -0700 (PDT)
X-Received: by 2002:a05:6102:f07:b0:631:2be3:b6e8 with SMTP id ada2fe7eead31-71e88dd8cd2mr2916747137.6.1781618747389;
        Tue, 16 Jun 2026 07:05:47 -0700 (PDT)
Received: from [192.168.120.170] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-bfe5116f409sm620047966b.23.2026.06.16.07.05.44
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 16 Jun 2026 07:05:46 -0700 (PDT)
Message-ID: <1bbccb16-b91e-4116-a4cd-213a46978fa1@oss.qualcomm.com>
Date: Tue, 16 Jun 2026 16:05:43 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RFC v4 5/9] phy: qcom: qmp-pcie: Refactor pipe clk
 register and parse_dt helpers
To: Qiang Yu <qiang.yu@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Manivannan Sadhasivam <mani@kernel.org>, Vinod Koul <vkoul@kernel.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-phy@lists.infradead.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260518-link_mode_0519-v4-0-269cd73cc5d1@oss.qualcomm.com>
 <20260518-link_mode_0519-v4-5-269cd73cc5d1@oss.qualcomm.com>
 <ipzncrxi3x45fc6tz5xb7frxt62zmg4gwr25xmvzghlbt5miio@7eavln3cydfa>
 <fkcidw46hdsrrufxhhkk66mmitxnswmghpypyvtmax3x6vmnlp@2er6xgymxdf2>
 <ol436i3oqgdns74dliw72qns22gqfgygm6qkz7mo4g7oiywlsg@johrhdyv4rqx>
 <ahk57lEoWQtkGsJt@hu-qianyu-lv.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <ahk57lEoWQtkGsJt@hu-qianyu-lv.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: gUu3u8OgXwYO8Cv1J7qiQf1yPg5NfRXm
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjE2MDE0MyBTYWx0ZWRfXyighnSLQetQW
 nS7mRNynJtQCK0kuu8g0Fm+1i/eVpAZYoFW+MvajkdKxhEp4YNQ848RjGbksZKTBH27ZCj+316O
 +Z5KdU627JE0f0NPFvlI1KT5NzOzEXI=
X-Proofpoint-ORIG-GUID: gUu3u8OgXwYO8Cv1J7qiQf1yPg5NfRXm
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjE2MDE0MyBTYWx0ZWRfX66dIgx7C+wWh
 bfpGSdvHMtmtAgVfd6T7L9GaKkoRkFabQZZzsPw2dJqqhuXbV4OQ4a/WUCO00cUp+9NUty/+w+U
 6O8WhITrbSi0yVMDZZcT/uZ2IudZHH8HiDs8fsFdZ4BgZyyQVkeI9uZoCuBVIWpxCyZObEw3fT4
 mt8v4A8FyO36BoWylhfr6T0iERU1K5p9EGw9PICZoSnUDHwLoyGLRSRYgtcRTn0u6gwkYVGUfpW
 f+/8KLqwZ/smKWuyEIiHXlrga2A2L2CfSdHVqgw227IL06S0JV17RU469RmXfkFKMH39KP3O4Ca
 DNRmjT66nJXDFsYDuZu67Y0LQ60qOPz4cbeDZphEuC3P4jO83OPH4LSZ09q34gHclDE+z5BsGEC
 21qdx1P8iQaCzbmyOZOElS+/23muEtlS+9+wRqcTCO8wh48C3WRBxCw7+7/SWWrjvS2aK/PhuqD
 qkS3sUeXc2MqDh90zyQ==
X-Authority-Analysis: v=2.4 cv=JJcLdcKb c=1 sm=1 tr=0 ts=6a31583c cx=c_pps
 a=DUEm7b3gzWu7BqY5nP7+9g==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=EUspDBNiAAAA:8 a=w-i5jriU0KAIvmwf_0wA:9 a=QEXdDO2ut3YA:10
 a=-aSRE8QhW-JAV6biHavz:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-16_04,2026-06-15_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 clxscore=1015 bulkscore=0 malwarescore=0 suspectscore=0
 phishscore=0 priorityscore=1501 adultscore=0 impostorscore=0
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606040000
 definitions=main-2606160143

On 5/29/26 9:02 AM, Qiang Yu wrote:
> On Thu, May 28, 2026 at 04:48:24PM +0300, Dmitry Baryshkov wrote:
>> On Fri, May 22, 2026 at 04:27:35PM +0530, Manivannan Sadhasivam wrote:
>>> On Wed, May 20, 2026 at 07:25:01PM +0300, Dmitry Baryshkov wrote:
>>>> On Mon, May 18, 2026 at 10:47:16PM -0700, Qiang Yu wrote:
>>>>> Some QMP PCIe PHY hardware blocks can be split into multiple sub-PHYs
>>>>> under a single DT node, each requiring its own pipe clock registration and
>>>>> DT resource mapping. The current helpers are tightly coupled to a single
>>>>> qmp_pcie instance, which prevents reuse across sub-PHY instances.
>>>>>
>>>>> Refactor __phy_pipe_clk_register() as a generic helper and reduce
>>>>> phy_pipe_clk_register() to a thin wrapper around it. Similarly, extract
>>>>> qmp_pcie_parse_dt_common() from qmp_pcie_parse_dt() to hold the register-
>>>>> mapping and pipe-clock setup that will be shared between sub-PHY instances,
>>>>> with pipe clock names parameterised per instance.
>>>>>
>>>>> This is a preparatory step before adding multi-PHY support. No functional
>>>>> change for existing platforms.
>>>>>
>>>>> Signed-off-by: Qiang Yu <qiang.yu@oss.qualcomm.com>
>>>>> ---
>>>>>  drivers/phy/qualcomm/phy-qcom-qmp-pcie.c | 76 ++++++++++++++++++--------------
>>>>>  1 file changed, 44 insertions(+), 32 deletions(-)
>>>>
>>>> I'd suggest splitting the Glymur PHY to a separate driver. Otherwise we
>>>> end up having too many single-platform, single-device specifics which
>>>> don't apply to other platforms.
>>>>
>>>
>>> I don't think that's really needed. This shared PHY concept is going to be
>>> applicable to upcoming SoCs as well. And moreover, the split won't be clean
>>> either. We still need to reuse a lot of common logic in the 'phy-qcom-qmp-pcie'
>>> driver and may only end up keeping very minimal code in
>>> 'phy-qcom-qmp-pcie-glymur'.
>>
>> Then splitting makes even more sense. Let's not clutter the existing
>> driver with too many conditions and options.
>>
>>>
>>> If you are concerned about the file size of 'phy-qcom-qmp-pcie', then we should
>>> move the SoC specific 'cfg' structs into a separate file as that's what
>>> occupying majority of the space.
>>
>> No, it's really the 'shared' part.
>>
> 
> To confirm, are you okay with some code duplication between the new
> Glymur-specific driver and phy-qcom-qmp-pcie driver.

That's a necessity, to some degree. See e.g. qmp-combo and qmp-usbc 

Konrad
