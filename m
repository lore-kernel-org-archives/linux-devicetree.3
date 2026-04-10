Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D945D1AE877
	for <devicetree@vger.kernel.org>; Fri, 10 Apr 2026 03:56:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775793370; cv=none; b=OPExXe7FzdoezdNduPQHtejTPjo4ybSLT6MyD7OwYIOQL1x4INmxrTLA+guZI+4Tf3cgGkCINMVg2WlytFgLosQiqOWixumAFZVwdPsi0SDRBblYLGto/zV/JPvmAHnaw9FBoTcS2Ypc5fsoy88NicFZTzjW9b7HoNjWSnI+Ax4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775793370; c=relaxed/simple;
	bh=WqjJY/klh55jK0KVz3OZ3Y2GpCClr+Hz8v90/ALvZ84=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=mRvQZRlJFoELCR9T+VPViIglCXwO+S62uI2fOlESKuAI8jf6O3iwr6LI07oRNUKih/x/iyzyxUplfEG7tJ4LE6N5Pms2c+3YuQMiYFMjIaDcgJgW4shCSI5l3UQzieFQzlW67hSZRjeRheVRyHxxxw1lcoKs0DtVRUYRYYQmc90=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=jcFlbh20; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=M+d50V33; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="jcFlbh20";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="M+d50V33"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63A1NGYO115465
	for <devicetree@vger.kernel.org>; Fri, 10 Apr 2026 03:56:08 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	CSmDNiR28E4SwJ73KBK5+DwZ2w5bYXZkE8dplVf/2Qk=; b=jcFlbh20MjLbhYiw
	dQqOf+oykWWbOk+ogXpUm+mMLyHslRkqQt0ncnh2rsVw/VOv+WToYoGnRnnPOUFd
	ChbM8I0FKStJHrScjXaDwFkpEMMw6uyEDY5aZ4eJyD0kq/y2rHSPbvKJi0cw6CzW
	JSEDj0VT5whWfeB1fOb/g39OHEMmGEHyitpoBY8wXHZIwSp1/zgfwDU1iSvgOJ86
	mqfbcP0CagLV5Z23YgXqP5gonhUz0JumWdSCEbkmZuFwCDanQIz3YTg2JBH6R/Nq
	rMAS1AHowtzVibo2dPbWkYXa7SwPBCvYvVhvd0ewSjz0xjFLwV9E2VWWwI/z49Em
	cIw/5g==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dee8xa74u-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Fri, 10 Apr 2026 03:56:07 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2b24e9b4d82so13181825ad.1
        for <devicetree@vger.kernel.org>; Thu, 09 Apr 2026 20:56:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1775793367; x=1776398167; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=CSmDNiR28E4SwJ73KBK5+DwZ2w5bYXZkE8dplVf/2Qk=;
        b=M+d50V33bLrurEsKan210o7tlS1UPHvBVNOXOYZeLCLqMD6Hd+/kBKbXvFLXWu5ssd
         ufUcDOpc1ejbwB3+ZtNpiy7++rwywe18yn1qpBQRfsoHTaSGyF9COTjzMNzK5sjAJeDJ
         slXMqQBGU4i703fiDqfKbsT6JOk4MWmsyTU8bh5owcGexJrZSyMfByY+hBsBebAuOtvw
         OZ2FyzPlthY/Usw+HgiJwf65UTcimtnGAIipFn+Io2ZghhbGn55kQGi9QeQpQi0rbVwS
         fdpgCq2tgnNHK7bsOrxngEIbigLmP/uLQlZ+/VUopWa4HYVXLtNN42/Ob+U3PpAQLtea
         KrMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775793367; x=1776398167;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=CSmDNiR28E4SwJ73KBK5+DwZ2w5bYXZkE8dplVf/2Qk=;
        b=n+surXQR8g1nCaYcSNPYDQCAA9/Vxndw+mfFLiSEK9ZkYGlqK4+kvx0kt8WAj31crT
         8kiep4nW6tyqI4wZP6ddLa3/wmxA1hbj4cpd1iA3CgsUUm5R6fL1yiraifM3XGNOiD/I
         ZatgOeyyBGLSsQfNXpjxS7cTXGHNsUtQqwJoCqP9bSO5bogoaXmLvPP7wVPbzD+0LkZj
         ktmDb246yOtjQyxkEXMBp4xu6YiDnCfuC2VS3UMbGV2J9H2B63tWSov7IPFGWBOctFxc
         RWOL0KoyfYrRPXZXJM//68BkLCfeeHpfiKgyDsvS6TTa/8P1qG2sDt9Ky7/BP8atDYRt
         BIvw==
X-Forwarded-Encrypted: i=1; AJvYcCXJigaz16IK8WKVMbc7/SmGXNPJjq3vg24/eluA12UXacVecF/DllgYSd905vBMNI8SkHZInEOBqAga@vger.kernel.org
X-Gm-Message-State: AOJu0YzeZl5RfpXDUp1pIS9tQmp4RMf3A4SOt3djITm+t5m60USm9VEi
	vvNAmr9ZZK6hZs48XRTBIYrTlnF2+/5AowPw4RD0NMk14YpDQrFWPEnKD6+bAA6iShtmp73LoEp
	f34PUVmqD9KVp+l15C/uo5MFUujNqkt2tG9PTVk9ptjz6fkwcBXIuiRw3KCecBv8I
X-Gm-Gg: AeBDieseaXFvOC4+4mgau8fFCa68d6cNfauwRTZCJqM67hUbhq2WCG8OvFCT9rIOebm
	deNoS8HVdOcTBiMiRC/Esi/G93kltJZlGSwJykczmiaeI6kbd2KTWa0R+tYqAmvczMxXyowxabT
	SNzU8tk+jsQ2ZA9MtG6GrG546KqlzAF2BAHQvXKrjmS8T4nowqQXp/oaP+s01AQcQOQLcHUWw3R
	PQIFSLUoJs9ugEKLtywJZzVFoxOh5QdkBHUv7ovYCIOqNkWgu/yAW46QA8fF2vpxux4AZfjLg1d
	6jWHP1cpLXhtjPbZjhpH/Th2D1aAODMeKHV7r6A44U0RFusTNKGqYAqrKjO/1YnU/WthrO97PHT
	Rv6hN+RqEoK+WpkXKsSeosLDJrIpY7AB/jUapnQ1Ma8TtmDht/A==
X-Received: by 2002:a05:6a20:94c9:b0:39c:41b2:5d4b with SMTP id adf61e73a8af0-39fc928c9damr5656587637.2.1775793366751;
        Thu, 09 Apr 2026 20:56:06 -0700 (PDT)
X-Received: by 2002:a05:6a20:94c9:b0:39c:41b2:5d4b with SMTP id adf61e73a8af0-39fc928c9damr5656555637.2.1775793366257;
        Thu, 09 Apr 2026 20:56:06 -0700 (PDT)
Received: from [10.217.217.198] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c7921a1d0d2sm802544a12.27.2026.04.09.20.56.00
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 09 Apr 2026 20:56:05 -0700 (PDT)
Message-ID: <328b388c-438e-4f91-9384-0dad903355a5@oss.qualcomm.com>
Date: Fri, 10 Apr 2026 09:25:59 +0530
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 8/8] arm64: dts: qcom: eliza: Add support for MM clock
 controllers
To: Bryan O'Donoghue <bod.linux@nxsw.ie>,
        Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd
 <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Maxime Coquelin <mcoquelin.stm32@gmail.com>,
        Alexandre Torgue <alexandre.torgue@foss.st.com>
Cc: Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
        Imran Shaik <imran.shaik@oss.qualcomm.com>,
        Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-stm32@st-md-mailman.stormreply.com,
        linux-arm-kernel@lists.infradead.org
References: <20260409-eliza_mm_cc_v2-v2-0-bc0c6dd77bc5@oss.qualcomm.com>
 <20260409-eliza_mm_cc_v2-v2-8-bc0c6dd77bc5@oss.qualcomm.com>
 <cb5a40e8-e2e3-4ed9-a9c6-0daa9f408710@nxsw.ie>
Content-Language: en-US
From: Taniya Das <taniya.das@oss.qualcomm.com>
In-Reply-To: <cb5a40e8-e2e3-4ed9-a9c6-0daa9f408710@nxsw.ie>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDEwMDAzMyBTYWx0ZWRfXxSA9cqzUcXmc
 TbaeRUOV1UHirxDc9e8GvBJvGDntFHVgxEmbg+IS3vpdGibFUWfDnMQ7U5UCFo/314fYliRhRVr
 pHbG9ZFDdkujn4c3wOyOAKqcD48Py1aZTTEcKxupD1DA5+39nbHVERqcKJU8X5yGEazxTUS5Nnp
 eUnpLebYEmuiVpZN7GM8nXZciNR57SmvqLQrNqCia0KJLKkUDjIAR+CpO0/hGvvNdrhvcM/XGWR
 KJ7BwbUDsfBidrjBxPW22Cp5K119y+M8m7og44QMQ5EuuPPIpAIwJFggQFJhn0Z/rSohqOJH2Z2
 RAAITzigp1xNx1Hd7Z5tYRrI44F0d/ffDnwid/bZOSCfXaHBf5y7CS+Cn/ffjRTQafePkKuhp9U
 AUMcnc382bNt3hAv5/It4JUYcJPlLp+XDLfUhT1CtoO1/bzYUcSOLYcezOcA1pCsAayNZevCJ0Y
 HJX2TYFka5YrNUx9XzA==
X-Proofpoint-GUID: r6p7pVP8wkWh4F0O_eZmPkHdpEoeRhKV
X-Proofpoint-ORIG-GUID: r6p7pVP8wkWh4F0O_eZmPkHdpEoeRhKV
X-Authority-Analysis: v=2.4 cv=O7YJeh9W c=1 sm=1 tr=0 ts=69d874d7 cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=km6amy0AK99uZQ67LAIA:9 a=QEXdDO2ut3YA:10 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-10_01,2026-04-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 spamscore=0 phishscore=0 priorityscore=1501 adultscore=0
 impostorscore=0 malwarescore=0 suspectscore=0 lowpriorityscore=0
 clxscore=1015 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2604010000
 definitions=main-2604100033



On 4/10/2026 12:10 AM, Bryan O'Donoghue wrote:
> On 09/04/2026 19:10, Taniya Das wrote:
>> +		videocc: clock-controller@aaf0000 {
>> +			compatible = "qcom,eliza-videocc";
>> +			reg = <0x0 0xaaf0000 0x0 0x10000>;
>> +
>> +			clocks = <&bi_tcxo_div2>,
>> +				 <&sleep_clk>,
>> +				 <&gcc GCC_VIDEO_AHB_CLK>;
>> +
>> +			#clock-cells = <1>;
>> +			#reset-cells = <1>;
>> +			#power-domain-cells = <1>;
>> +		};
>> +
>> +		camcc: clock-controller@ade0000 {
>> +			compatible = "qcom,eliza-camcc";
>> +			reg = <0x0 0x0ade0000 0x0 0x20000>;
>> +
>> +			clocks = <&gcc GCC_CAMERA_AHB_CLK>,
>> +				 <&bi_tcxo_div2>,
>> +				 <&sleep_clk>;
>> +
>> +			#clock-cells = <1>;
>> +			#reset-cells = <1>;
>> +		};
> 
> This looks odd.
> 
> Why do these two controllers have no power-domains ?

Bryan, on Eliza the videocc and camcc are connected on CX and MXA.

-- 
Thanks,
Taniya Das

