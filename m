Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AC65F3370FF
	for <devicetree@vger.kernel.org>; Mon, 13 Apr 2026 10:26:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776075992; cv=none; b=TE//itn2Qbb7UNqAgXzgi865kMgqyw3NNJXV12dZfehork6VkjU3uhIGXfNANEd0igadjmh8YWerU2gfVu0aDH6ayrfvp3f6dJZt9vQHgtdDe1As+9LbNedOJ0Z6eaiek4JbMgB8pwGpLrIWhCxKBssyydSM3X+aG2a3FP/XTpA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776075992; c=relaxed/simple;
	bh=9g9xm0d6e3UdYPyZT9dWnvnxu6qy0sa1f/KB5OFMKDE=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=j7V+tt46qKnSM1E8Pt7sKg1ke3+bKJKPfcPeMDYxQzWuTOWAM7QmD1W0Nn9TMTU/mfcuM7m1+CTuzVd9fRi/K3Lui5MgVBc7CCVD8oV3f+rFYFbv0Y8a87gzE8IbA7eW2bfY0O4FbebEVZmU8ozZ99NQqdZNWm1BX448Pdzcybs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=peQC83Le; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=a9hwEAfV; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="peQC83Le";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="a9hwEAfV"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63D7aUS72043988
	for <devicetree@vger.kernel.org>; Mon, 13 Apr 2026 10:26:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	93D0c3gAvtUiPsWGltY7o+cAV8HaCq+OeVHrGhr6/7U=; b=peQC83LeqpszB92x
	2fa2U5nOhYAu6SFBZ2W4s1eNH/lV3XSLwLKSxN1sgEV2hznlBU1lmpwdMx45oqx3
	XzgwACplgNja1ySwSsazmqWKBf4psYdfZmqrZbIxhxcjrL/mC0VUSeuxCsg1SLgC
	waSi9Ef093awlAZ16BYG/d1fXqbIWAjutQL6VmUMtLcHAEiH4v1W3Zs64iWbUY1D
	2FGJMcWPXOj8P6PfhEIaLqRehOVJIj1D2EMkYMs42sI6hcIAs2bcD0CzJsASMcwf
	kQf8hlkqtpJyfZ6EGXm6qnpjgyfrmt/kWTzOnemfwvc9CgHPpolhiAdHeZT5P45+
	tF/dNw==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dff0jvtm8-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 13 Apr 2026 10:26:30 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-8d45ebdbc9fso75565685a.1
        for <devicetree@vger.kernel.org>; Mon, 13 Apr 2026 03:26:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1776075990; x=1776680790; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id:from
         :to:cc:subject:date:message-id:reply-to;
        bh=93D0c3gAvtUiPsWGltY7o+cAV8HaCq+OeVHrGhr6/7U=;
        b=a9hwEAfVlbfkGHdgqet3zaf+eBZbjgAnv0l9ClzG795kE2rB07ZYGeBp1D5DjzFS0o
         5YvaHLboUsGaJGdfvBKfJAzBW/69f/fNdDqPoM7bWnb43ranIzcu1JyQ4nUYfDWi3zaf
         /WSyht4Vu3fLsLI/UAgHqeze5G7ym1zHF0c835sWVP9OpxJUej0ijrll9sidfUx7tWyt
         S0ia9qEPWQo2viQmIXwyKu3RHLjyvSMFa0LsyBTqzrWC9bAQsQec5wfcHjaQu/KvpyyT
         S8DEK5SSA3lgJlEuSbJFst9eqJC6lD8hKs0nlOi0voTRJ7K42PWJfB0qFiGJNR0+KGGF
         uhjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776075990; x=1776680790;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=93D0c3gAvtUiPsWGltY7o+cAV8HaCq+OeVHrGhr6/7U=;
        b=SXW4Ysmjf1709QurIpy0zUso2OGi0ECpcDwmodrvqAhHb4FDwQ9+FQXkQcoqobaD/Q
         aMkBD0buFSDOuAT/8L1A8Sk00JcSqyksHdmT1xwZDkoNlNipwsHelmTGiZE+chKrwjcU
         M/LzmHITtO2PYcbipw6GzDQU3HZ878rAU9pgfwy45C+iXXoYfSuDYJkhSNhrTx6Mfs9/
         KsX/kuzKPkN0I7Dpivspdxx2Q6cYEuvBKRquRVJ6bSg5U5wtVWOTihVkCRYv7o81oP0m
         1EjlPswKqvHfibEWQkdNtHf6uIfoh56ldPjNxOY8SFJnWVSOUQF4BL2A3LdbP+ddTwNv
         gCqA==
X-Forwarded-Encrypted: i=1; AFNElJ+DQ9SS22ACiQAApcA4Xw2e0OL2jUeCG/8iZY/KejChPBSjJnh0vPx45JyzwdKvCb4OzNdPglboaMXP@vger.kernel.org
X-Gm-Message-State: AOJu0Yw1M0XCImfIyloUzOno/iTY5ujilmm8dAQdM42p6CssRHhyivJ+
	DN1F6zq+dDrOe6kRhlkdg0eMgIMkTvSAmjnsdgq6T9tJ7RfItCGSUzmgZ+wgyTWfylug5zzeFm3
	/cyKPP2XyYSuen4zsAFJIH26kzLevB0U3Lmkiw/n12cM0Imu10QOdBcekxPVnyx3o
X-Gm-Gg: AeBDiet18JrKAxlxmcu1IRQCxCQNlFyxtPj5O6woORPJcQKQsFr3a1NAgyIib3L/8vl
	tujpT3QoszlRp83679+Er5FPPrtiUWYxz3y2OE7MSztTEndG9mRS2nkeU8hAHDFD9/AMbMBEQJK
	HnG+vxk2wdgaDiy09L7mnjOjB5orzpZ2UokjRm4afDPPKHWisApIoxEOrBOT9ZfmNrZdaPrHg+z
	IzJNAarv9R2aSn/OympZDvhp/WGL4DlV9skufOkiUVE6iNRGPmhpBYR13thajZRRVyeXMtxqrMx
	R1111r28YeziSIfljnzkLkhEpBCko/xT4rGaB3uV/jsnl3k6IMHkkGr9JX6/W/uw4THTkWEmWIg
	TsVfltjc6SNXh5K9/i7oj6eLbyoET2Sao3yocU474VjMMeCxH0fUtoZd3WMSMcmbaZZxdv1zm7A
	H35WQ=
X-Received: by 2002:a05:620a:404a:b0:8cf:df37:4f6c with SMTP id af79cd13be357-8ddebbddf54mr1219961185a.5.1776075990021;
        Mon, 13 Apr 2026 03:26:30 -0700 (PDT)
X-Received: by 2002:a05:620a:404a:b0:8cf:df37:4f6c with SMTP id af79cd13be357-8ddebbddf54mr1219958985a.5.1776075989547;
        Mon, 13 Apr 2026 03:26:29 -0700 (PDT)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-670702eec8asm2370758a12.2.2026.04.13.03.26.26
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 13 Apr 2026 03:26:28 -0700 (PDT)
Message-ID: <7d1b6771-6e9a-4fce-b672-ec4f31daa2f7@oss.qualcomm.com>
Date: Mon, 13 Apr 2026 12:26:26 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] dt-bindings: usb: qcom,dwc3: Correct MSM8994
 interrupts
To: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Wesley Cheng <quic_wcheng@quicinc.com>,
        Krishna Kurapati <quic_kriskura@quicinc.com>,
        Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-usb@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
References: <20260106185012.19551-3-krzysztof.kozlowski@oss.qualcomm.com>
 <20260106185012.19551-4-krzysztof.kozlowski@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260106185012.19551-4-krzysztof.kozlowski@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDEzMDEwMyBTYWx0ZWRfXxUC1MKeU3Xjk
 8fpEbqBBaVm9E0vlMvBiHBIvkBl463zyMmLTKlUDfjHfzH64swBhAuEp+czaK6hPxQtOZBu/U25
 d2p8DMpyKA4DvkUnot6pIuFavLetPXs7dFrlaCfRF6ywBvKE+oPAkoPgazkSN5T+hR/9GToQVoB
 Sc3OudgCl6nVYmFzMoQZzrz/HY6pburL4BzG76Ll1CfJJk83I/SSe9uJgNhFl0wGJ5Tgw0eo1a3
 KCA7T4y72KDR66fDtYR+4ZNVHhPiIKhKygy/bxPcr+yFtf6PmVKE3IhxtGqaJCp0QnC30WKip/Y
 AMauZhz20Y7GvZm40+rZSgFLI1vnkLmnItr2BIZUPwJoC76FsNbLLcPpRcDdzyXNYnnlJlIR2+O
 QQYbVv5/pu96nFbeCiL7IDJkydg4F4TuP/x6YwYqQcmd/H4NG2A3XMlNBWiXzK7kaywPWMRUfe0
 XWcuPgujNEhyUdbl06w==
X-Proofpoint-ORIG-GUID: g2aDZI3wdPW4SwYZuZjXQlUX7_DUKKny
X-Proofpoint-GUID: g2aDZI3wdPW4SwYZuZjXQlUX7_DUKKny
X-Authority-Analysis: v=2.4 cv=d/LFDxjE c=1 sm=1 tr=0 ts=69dcc4d6 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=FFvnmRk-8DjInUy4hlIA:9 a=QEXdDO2ut3YA:10 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-13_02,2026-04-13_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 impostorscore=0 malwarescore=0 phishscore=0 priorityscore=1501
 bulkscore=0 suspectscore=0 adultscore=0 lowpriorityscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604010000 definitions=main-2604130103

On 1/6/26 7:50 PM, Krzysztof Kozlowski wrote:
> According to the reference manual, MSM8994 does have QUSB2 PHY and does
> not have DP/DM IRQs interrupts.  It is also logical it has the same
> constraints as similar device: MSM8996.

It may be that the following mapping is true:

USB0 (DWC3)
 DP -> MPM 49
 DM -> MPM 58
 hsphy -> GIC 133
 otg (dwc3_irq?) -> 179
 power_event -> 180
 ee1 -> GIC 131 
 ee2 -> GIC 246 (for IPA?)
 hs_phy_qgic_irq (qusb2?) -> GIC 311
 phy_id -> MPM 48

USB1 (CHIPIDEA)
 DP -> MPM 55
 DM -> MPM 54
 hsphy -> GIC 134
 async wakeup -> GIC 140
 qusb2_phy -> GIC 312

Do with that what you will.. I can add looking into this more properly
to my ever-growing TODO list (or maybe +Dmitry has a 8994 SBC?)

Konrad
