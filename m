Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4952015E5BB
	for <devicetree@vger.kernel.org>; Wed, 17 Jun 2026 11:05:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781694314; cv=none; b=Jcn1MQLeQ8swIIqKoGLe2k37TKWMZUZjfMLaB8lU24pdXWI5+xHqKaXV3E2uoQuJkKGgG40fIJW6l5i4JB7ge1vwHyEtrVymvEDnB1Ghs/+iv4/GewpgrK7tCKQYMLa+5YTAP3hFTGHDdUPEki/os+yOSwRipStNrbj360pqEi8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781694314; c=relaxed/simple;
	bh=eEiU8vMu+5O1vd1w6lRUiGs5KR7SZ5QpDvtIFlNlRTo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=sMplQqxIhaz7Uu3FM/DBi+iKr9rBczce4tdspJuh3FxbVwlcWOC5p2I+D1Zhps51WndS6WtPU3K8GrINbxsV4y98F3xo5BMWzVfpoidTma2hdNTJahE1Fq5WmZmC0WSeiwo00RT9Tak+VE08pHqy19hLUXTF24cCkUAGvcTV+QM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=jGa+OMAW; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ARSNzosN; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="jGa+OMAW";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ARSNzosN"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65H8UslQ2025364
	for <devicetree@vger.kernel.org>; Wed, 17 Jun 2026 11:05:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	qj70XiMRBk88XSknFY6Ir5XzqLm8axeDAtiCmENjOvs=; b=jGa+OMAWzW2QNASV
	RBhcQINUjagf0ZQcla7SH4cLO/fG4+60rqMscZWpAkwf/C2OMNtmHZxWWUKTtSv7
	/oY/yXoeIcwDjr4AfJN1m9yHnfrDpCWN73Wc/iF0/q17X3FclXRdxDSjjKgCgzRM
	a1SnLoNeTUbyhEhMhDckcuLOZK6rA6c5SajdnW4DXcEgR84qlcSFBfhxpPkZvqp6
	GVahBusdh/Ui43hOBMHHX4qt66W5GBK5JOI2Yzvu4mfGTh8CLWDaH+jW8NoaWHWE
	X1Y0j1xXRuwj+n6/CHANhdCHMWwqRE0FJRODDTaVgX7ra/KtaqyDCiO/XCBVH275
	fBNA9w==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4euees2sbs-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 17 Jun 2026 11:05:12 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-915a547f4b3so69078585a.3
        for <devicetree@vger.kernel.org>; Wed, 17 Jun 2026 04:05:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781694312; x=1782299112; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=qj70XiMRBk88XSknFY6Ir5XzqLm8axeDAtiCmENjOvs=;
        b=ARSNzosNfpOTWoCL4krVw8RuZm6MdZMMUaHYHbaywZZ79fvBMedYTzzTucqNjl/FC5
         1sPbSGN6KtkKGz6sObPL0rXapfIyRMFESYT7dBbA11IeWvVJoGFpA8rur5K5IGjUBz3U
         YP9FYDBDoKkyEullxp1BidaO7RcExFxgMDCBTxaTB7/omH1xKFnTxkhwgLRaO5gnh8Ax
         7JhuIjBlSJiSrKYrIdSppUupYO/zpJkCeT/7zxckFqopfXUgBg4MBd1wdCSgAwWXS8DD
         dJNS+d1V4F7AFpQ39zY0vsLASgH0bYzOoAx6hX9HtquM2eBO+r7wKxrKqDEHNJMOtQ70
         iIKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781694312; x=1782299112;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=qj70XiMRBk88XSknFY6Ir5XzqLm8axeDAtiCmENjOvs=;
        b=AoDmLh5BoIuWNNwbKPykd7piror5MFF2KXg27O9QsVSzHPVMHcigzto4jd11qnbGrs
         4SrtFXuR9BVLc1mAheQJi77G+cVs8/aLzEYkOTy4vQ8tI6k1T6iTMolZ9TbXU7RzBmU8
         ZQ6Dlyif2u0ijWk9bjJ1sBKFqxsMribhdBjz/9FYAAyKuZyjV+WJTXiczGbJjQAM171p
         oCSwWZXgF1tWc2iuto167QlZUvJH2etoi4/QfRRWMF1HgjCzSOPbdMvOcrT975jcd7Dt
         1yQZzvlfjV1ZPJgyCfhHISC11EUJdXXsIKLcyeImZoJmnfnJWJ9CaPtnvPUpbFDh29hG
         1zag==
X-Forwarded-Encrypted: i=1; AFNElJ9262caYKBtXZOXSFxO3buA9X9EMr/rPob4kd6Oso8+z6JsE8eE0j2s3V8Ux3tD2PXVKa7ipJhCNU2I@vger.kernel.org
X-Gm-Message-State: AOJu0YwfSFEz8+1ttriIG1vMaY1P8lqsOpTzLwKIcLNua/tTMDvoQEqW
	Ra1BXcjB2a3vzIeUNWqEZfPCfvRuW5tHVOtVXP8PiE4d9M+UWz1ZhvqXB1NmCV6GC8/oRYklXBG
	bJGzLTP7vDRMEG4aADr+yjrgQSuAyyfIcJH2rbBtz9SFaFtBHBzqzZoYgY8sUYSWw
X-Gm-Gg: Acq92OHDEzYc5VKqWNJik4NDLxVAryuM62OARXopbFmU8bZfb4j6S+V2D3yGgx2vYmx
	9MOZoTZ75kvNfzUX3ivRM0agKtIV8MoMVOqinN44qvwDSw7a771Z8MsIsJNjZmBMsIEaX8TCsiB
	2wFIvyM8vxuRhYnpmgZ6Vsmmmrmm/DThgo/zBj0lr7AwGlhlI1JVBIjXHrWIVGQWefkSa49q0xJ
	wLHU3Y2H0I5gSk+YUWIAo6UlVzJeKPu015q3hG+8ASNFRr0cz1/J0UJcXx+aLVQS8EL5r7Ii5AO
	pNCGVKOaS0vYtbHchn/6T/sEpt8YYXqYa6bKKAXQsRJrCi49NgNWWkzofvyS1rOkQve0GPuYhw5
	P5skWCLYMWTIhFPjBGAwSO+e6Ww1QuQYAuao=
X-Received: by 2002:a05:620a:6286:b0:914:ea37:6f14 with SMTP id af79cd13be357-91d8aae2593mr337701485a.1.1781694311575;
        Wed, 17 Jun 2026 04:05:11 -0700 (PDT)
X-Received: by 2002:a05:620a:6286:b0:914:ea37:6f14 with SMTP id af79cd13be357-91d8aae2593mr337696685a.1.1781694311144;
        Wed, 17 Jun 2026 04:05:11 -0700 (PDT)
Received: from [192.168.120.170] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-bfdb8b23f8fsm760459866b.53.2026.06.17.04.05.08
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 17 Jun 2026 04:05:10 -0700 (PDT)
Message-ID: <d4d01a6d-4c9e-4822-b0f6-b98e8ecf34f5@oss.qualcomm.com>
Date: Wed, 17 Jun 2026 13:05:07 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 4/4] spi: qcom-geni: Enable SPI on SA8255p Qualcomm
 platforms
To: Praveen Talari <praveen.talari@oss.qualcomm.com>,
        Mark Brown <broonie@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, bjorn.andersson@oss.qualcomm.com
Cc: linux-arm-msm@vger.kernel.org, linux-spi@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        mukesh.savaliya@oss.qualcomm.com, aniket.randive@oss.qualcomm.com,
        chandana.chiluveru@oss.qualcomm.com, jyothi.seerapu@oss.qualcomm.com,
        chiluka.harish@oss.qualcomm.com
References: <20260604-enable-spi-on-sa8255p-v3-0-43984eac4c67@oss.qualcomm.com>
 <20260604-enable-spi-on-sa8255p-v3-4-43984eac4c67@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260604-enable-spi-on-sa8255p-v3-4-43984eac4c67@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: itV44Yu0VAB1v8QQod16pD_83doDSJRl
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjE3MDEwNCBTYWx0ZWRfX0xa/2f1+EzAc
 cCAkjXw8nCUcuZDP/h0j6Dn8ZAkttMB7oXHHzQi3wtQWUWAg7YOj7WnHblKo53Bh9/RlU2So41p
 eJ55jPPVEA768Tq+BNavYPmjvmLku2d4LCSI/D6Ms/0DLK3P3MZLRllinC3QZ3bbH4n8bIrPN24
 sEp+M5X2oskWeIWummD6Pj5QVCmHEaT/7CLTZHsfTR0mGbdAs2Tx6sYbU7j1x4QUst6ztWxaU1g
 m1h2IVb1IWc19f7x86LU5TScBFTOnsrJAtCi3kYHKpWT6d1Xj0Cjhywa2PvgdkyUV0OwSBfr4IN
 fe+n+8z67f/22aXmhQEJbwH3FYM94KKMGq/YJW8QuJQTycqM0IIgg+1BUpTHYw6M0DD4tvg6baz
 ZpUnFye4GJrzX0ORo6rTFaBfOt4Xhy3aOLwp0fFrthTjyaTFL93YfqEPJck0X+eLfCSB4HcXn1g
 /axWGIHrrWOWnAEsAiQ==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjE3MDEwNCBTYWx0ZWRfXwZABCrvCgdmO
 Qvk/QaRlm4TjXoaVCARLzUDiblR7bzQJE//rq9Mgq17pJl7cuP6DznSXEIzWWXbUtXoelbC7nqm
 KCcpTMyzoMdNqD/PjiqrvavYDRQ95a0=
X-Authority-Analysis: v=2.4 cv=KeTidwYD c=1 sm=1 tr=0 ts=6a327f68 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=EUspDBNiAAAA:8 a=Ow8ltAAN0bl1iHkyYvMA:9 a=QEXdDO2ut3YA:10
 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-GUID: itV44Yu0VAB1v8QQod16pD_83doDSJRl
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-17_01,2026-06-16_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 spamscore=0 lowpriorityscore=0 suspectscore=0 phishscore=0
 bulkscore=0 malwarescore=0 adultscore=0 priorityscore=1501 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2606170104

On 6/4/26 8:50 AM, Praveen Talari wrote:
> The Qualcomm automotive SA8255p SoC relies on firmware to configure
> platform resources, including clocks, interconnects and TLMM.
> The driver requests resources operations over SCMI using power
> and performance protocols.
> 
> The SCMI power protocol enables or disables resources like clocks,
> interconnect paths, and TLMM (GPIOs) using runtime PM framework APIs,
> such as resume/suspend, to control power states(on/off).
> 
> The SCMI performance protocol manages SPI frequency, with each
> frequency rate represented by a performance level. The driver uses
> geni_se_set_perf_opp() API to request the desired frequency rate.
> 
> As part of geni_se_set_perf_opp(), the OPP for the requested frequency
> is obtained using dev_pm_opp_find_freq_floor() and the performance
> level is set using dev_pm_opp_set_opp().
> 
> Signed-off-by: Praveen Talari <praveen.talari@oss.qualcomm.com>
> ---

[...]

> -	ret = geni_se_resources_init(&mas->se);
> +	mas->dev_data = device_get_match_data(&pdev->dev);

This really needs to be null-checked

Perhaps also the functions within that are called unconditionally

Konrad
