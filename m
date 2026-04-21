Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AC92637D11A
	for <devicetree@vger.kernel.org>; Tue, 21 Apr 2026 12:52:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776775978; cv=none; b=YXFdCva3YB5Ihqw6gT6lJoJ8HHvEchMU6MtvcWglTyWNYUhNJbSG2f+XHByHr6/NKqIg19XBDFPidq6/M0HqRQes5e5uVIMcx5DT8JhS+5TTQHi5CE6FsUWXXHsLPPeS8Yxgt32pSeclr/ooXcxuUQSXMmQ+PTBHT3kJFJ/uqWY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776775978; c=relaxed/simple;
	bh=HH1NNtZwFd250kpA7uXnvCLzi+RUfrTgM9xUyAAcOSU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=aFLEIl1x9NI43sBYUrMfW1FFZLoJBvoBxdFxkqnCPHWXUR9loxJvK2DjsNVbWSr3O7mvPNaRZfPSbtiCwaw50JMN8Poln7/J9b2zV78pDSaAH8zaNX3jyalxkLc7+TrXcBpb2PdZ6ao6mCNO0uxUYiIu4MS5VkRqMFvXzPElmBQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=HGQrkjQW; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=a7ON39xN; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="HGQrkjQW";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="a7ON39xN"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63LCbBnE3257286
	for <devicetree@vger.kernel.org>; Tue, 21 Apr 2026 12:52:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	irJi8OzHDR6ei5r/Ez62ynMGGPCuv+u/Q8dfmAXThhk=; b=HGQrkjQWlenfTVtX
	pCqIWiiEnA7cZUOjOC9uUwJQmuaKF5Jtgah8UKK007j442R00YN62efkAO80hpY9
	FdZp6fFQ0oRI3bsd36baxehwdOqJqBOvzh9NeNWXzThMhe2pVZFRzTq7DptE+uUi
	aYDD9hVfNbp1UpF5C+zC7IqKlkwxYEAheBbQ4qbeUW6D97wEbT3N1TwuqfVJA821
	l7UhC+3S7eA32E5CyAt/GAEHngk85T57Nlr5T/+bZjO8JEQa5zsyLeEWGcgmypYF
	cqYnpoZ+cv9D3iLcJTEz3QF6PnGnbxS6EMst/V/4/h6gxcGjUKQiC4bc+oIVzHsy
	VTkHVQ==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dp3na9djx-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 21 Apr 2026 12:52:54 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-8d45ebdbc9fso72603085a.1
        for <devicetree@vger.kernel.org>; Tue, 21 Apr 2026 05:52:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1776775974; x=1777380774; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=irJi8OzHDR6ei5r/Ez62ynMGGPCuv+u/Q8dfmAXThhk=;
        b=a7ON39xNPmibqz7+JShg/pM991tLK+qV0CAeDxxVp9y8jYJxeH6KId5A7q/BaaEytg
         qaR+jnAFj3BOMNKOVg1tAd1BArICGV9mtFe2ldZ3lWLlrfhIUHDA0W9jeGn4gup8Dg2C
         /6/wDpmyhgupIVEwCpXGNttL7+WGuDBZ/ngjf+O6YOJhp2jhirXFktjkLxAiF94A+WIf
         OJW5Vo9fmWkIRSBCmPXlgFccIG0/7zy5VoJgp2FpWegHJawDlzqBRrd3O4EjKXx9RBST
         X2MF3WXfhPAChc0Chr7f4mcUGZYVBzvMdDMbRQTsyictbwCGkeictp0HQGG7ZHcHVq+E
         dWEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776775974; x=1777380774;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=irJi8OzHDR6ei5r/Ez62ynMGGPCuv+u/Q8dfmAXThhk=;
        b=O5RtNHjY01g5Oidg9RrHc8LoMNSuGjSix5nQsBfIxsSMyT8O+qStvIExCTHFQxBTH5
         GX38qQCkRKjIzw9rwwduqIyw4pfNmLAf2hX7AB7VZ9MrVvR1qhX03Fpnx2MfpvIOJHgX
         lU7u5EGNsE56TB968h23PX7CW0PmiFtbmiJwLJlqsaW6dnTOyJhh1jW8DkK9JnTN8o9m
         FoL6qFUKi75wegEWTB7R/3tPuOTijSePjM59HinQPreJem6OVCt4yby+pxa0hG+w+VPO
         lYrpMRI/7c/4tHY5sQb0+xP/a8veerFomYfBU954guzsOC1/I+K+FlOpzTYERbAIYPd1
         /X0w==
X-Forwarded-Encrypted: i=1; AFNElJ+QpP6CQIZza4MT5l0LN5GE+gZePNRktPbZgVrqkrKwY8oXHWEIzG3S/K4tmtPV/DErf2AyOTtkfpQc@vger.kernel.org
X-Gm-Message-State: AOJu0YxpoxFwe9EEKGeQGCiHRXMZcWvill0PrAaOzVxl36xX3aRyi58h
	eLHrl5FRXEnoJmdvGkViqnhLyiFi7ou0T+TbbC3qRrUtRXFKj9OWMlkRqDShTIFrYZdC515EJgj
	stmQ9ZlTfEcIxX8gJa35vzSpdP5tWdjP9jbB8fBSo18wjpQ5COxf7NjbnH0DGNd2l
X-Gm-Gg: AeBDietifrsror2OT0MFgDSOlEApCU+A+fnwc3bZNAosVVYkkPKca60s3yI9jRGS46h
	yKIXBygY+uremerXSuKNHspU4sNVpZujfPXppQuarYZI9SqnllEIoerv4EGgNGCRXhIrJVM3y9p
	oeQaOzEyJidyW40SUj3SiEay+sv0DbLZvIUGAZo/mZzeW9qIcLw8iN8VlPOjN1m15WiFi7W7p+x
	MZhjnVFMscUMVGFRkXKBvlroiEgFaMn3SRPzsAi3T7a4BJ3My+VAjFGu3maHLckJXYe4PCEHO0A
	3rk67zr2c3uMH1QAS4ik4ApCVfne2o8yVAmqfd1dUtn315GsOahGN1fWc6TPSdLuXTp5et5s7cy
	wh9M8stcRK3WRtVV38/auEOjQbdabtiFvhzBUsAuPfjF77CvPA+NWiCNT2Mo7zc7hl2lqGJboYM
	79zDRoOLDwK4cJkg==
X-Received: by 2002:ac8:5741:0:b0:50d:ec32:b84f with SMTP id d75a77b69052e-50e36c12a00mr165757501cf.3.1776775973949;
        Tue, 21 Apr 2026 05:52:53 -0700 (PDT)
X-Received: by 2002:ac8:5741:0:b0:50d:ec32:b84f with SMTP id d75a77b69052e-50e36c12a00mr165757131cf.3.1776775973511;
        Tue, 21 Apr 2026 05:52:53 -0700 (PDT)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ba451210e1bsm444593966b.3.2026.04.21.05.52.49
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 21 Apr 2026 05:52:52 -0700 (PDT)
Message-ID: <023375c1-d2ce-472e-8a82-1cb013d31de7@oss.qualcomm.com>
Date: Tue, 21 Apr 2026 14:52:48 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 6/8] ARM: dts: qcom: apq8064: Fix USB controller clocks
To: contact@alex-min.fr, Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        MyungJoo Ham <myungjoo.ham@samsung.com>,
        Chanwoo Choi <cw00.choi@samsung.com>,
        Guru Das Srinagesh
 <linux@gurudas.dev>,
        Linus Walleij <linusw@kernel.org>,
        Rob Clark <robin.clark@oss.qualcomm.com>,
        Joerg Roedel <joro@8bytes.org>, Will Deacon <will@kernel.org>,
        Robin Murphy <robin.murphy@arm.com>, Kees Cook <kees@kernel.org>,
        Tony Luck <tony.luck@intel.com>,
        "Guilherme G. Piccoli" <gpiccoli@igalia.com>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org,
        iommu@lists.linux.dev
References: <20260421-mainline-send-v1-sending-v1-0-bcb0857724de@alex-min.fr>
 <20260421-mainline-send-v1-sending-v1-6-bcb0857724de@alex-min.fr>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260421-mainline-send-v1-sending-v1-6-bcb0857724de@alex-min.fr>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: uhGY56jmHJ7_QqwxiVzr4xBytHkx8gS5
X-Proofpoint-ORIG-GUID: uhGY56jmHJ7_QqwxiVzr4xBytHkx8gS5
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDIxMDEyOCBTYWx0ZWRfX7LXpdXFuaJTK
 qSi5EteY5e73qJ3fet943zr+rcI+ZY3C5Qqg+6TMLgEMZOmo9f9Bhjmy9skz7vWlqlBYLdn48+B
 23y8bsCqLwjifxQihX8tmWskce+/I5SDQq6viZdIIaZUqg47l5CnwbGH/vG+hckNyWOmi2J8HMN
 VE8ujNRg5wBhWyYwpo0VKhVuFhmV69r2zE4zN11zcCON17k6IT4jmE1/RRg/nwMsySySAzUJkSv
 8kbThGdmWSd8km+z15ccd5KsmJ0aCnKop4KWt9/saJGtuMtwodoewLU1zYc9O139kdhPhHhl4hn
 IiyS3uctp6ZwrGSX4eHNeMsreMGXU/L05shn/Xp3Gpwzdcm8YNMy20gGmDXVxSoMA0fJIkc+NRb
 mq1cZiiQLsStxykTrVONTU8MjT138Hr5OOpMV2p7t7Iy6cUXtnHuXEMBwkSn/f+It3XULtHY8y5
 yFGXLaiWVvmttFJjlFQ==
X-Authority-Analysis: v=2.4 cv=O9cJeh9W c=1 sm=1 tr=0 ts=69e77326 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=EUspDBNiAAAA:8 a=YCWiAI6G9GZrcvXlVdoA:9 a=QEXdDO2ut3YA:10
 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-21_02,2026-04-20_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 clxscore=1015 spamscore=0 impostorscore=0 malwarescore=0
 lowpriorityscore=0 priorityscore=1501 suspectscore=0 bulkscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604070000 definitions=main-2604210128

On 4/21/26 11:45 AM, Alexandre MINETTE via B4 Relay wrote:
> From: Alexandre MINETTE <contact@alex-min.fr>
> 
> The APQ8064 HS USB controller nodes describe the transceiver clock as
> "core", but the ChipIdea MSM glue expects "core" to be the controller
> fabric clock and "fs" to be the transceiver clock.
> 
> This mismatch can leave the fabric clock disabled while the controller is
> accessed. Some boards may tolerate that if the clock is already enabled
> elsewhere, but it is not a correct description of the hardware.
> 
> Describe the RPM Daytona fabric clock as "core", the AHB clock as
> "iface", and the transceiver clock as "fs" for all APQ8064 HS USB
> controllers. Without this, USB does not probe reliably on Samsung Galaxy
> S4 because the fabric clock remains disabled.
> 
> Signed-off-by: Alexandre MINETTE <contact@alex-min.fr>
> ---

Acked-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
