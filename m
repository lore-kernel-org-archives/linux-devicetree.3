Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8E2BB3C1413
	for <devicetree@vger.kernel.org>; Wed, 22 Apr 2026 09:10:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776849012; cv=none; b=M8XOfACj6rEJMlCEVP28nGHwBeggCZd0HLKzxvF2TNvCJCfrvtsW7D3yN++YXGEe0rEfqv+fdM8pxv83nkpSQvyvcR/fLdHXzWGoh2uGnj8C8/xBuLAUUyKy1Uc3fkeu5nmIetbYvpqdXojsirK7lqE1Cnd8mXIl2bvnS2d17Bo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776849012; c=relaxed/simple;
	bh=Ht5XepZYeWRruFIhSU9il0UdSXEj0Q/RgKbZF358CzQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=jYOp0EFKnwSmssCnlwoRznkqVNjl4ZeYrdnkcOE2h/s9YvwoFzHssSpiIytdG8KkLetjWayFp4C38stzUthsD0TrATQQ6o6xOjXdRrzyra+gouRFJWXHE3ITCMoRcwopoK5VaHLOQFC0dqydal9p/r5jPF9GPoLMRq2FMGe4bk4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Yj+l5AA+; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=PjDAODNh; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Yj+l5AA+";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="PjDAODNh"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63M51fHS3083500
	for <devicetree@vger.kernel.org>; Wed, 22 Apr 2026 09:10:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Ht3ugslvaAB2Tu02wj4yEDUsNolBfYrFDnScbsYJ3ic=; b=Yj+l5AA+2wthYYYx
	H8NyPInpanMAxY//LbbvDmYdeAIopIN51yaDsUFyoqeN8gkkMS4+ZKKL/q6Y6pD8
	Z56ULvAT8gctR9s7GsRcWIhkOHb0E9LlLaB7jetxIF9iRUi78ItcxQugjQCUUTWv
	DtUMTKhE9UQ7EELK3FolEVbOJvszZVUsS+KfdwpHS6PNgiv+SEVNRS6L6WsrxZjD
	8a451y7NNGwMtC4GOpaG5MT5Wy8q3lKsLiZV6eKapwj2VoLkPJfaEh6hmwbv4PAN
	YCxpytvC6vcSx6TIXom9wqpGOwDKd6et/2DkWScx+ItbRqi51T5uwKvJXfRTCUuk
	3zqzuQ==
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com [209.85.219.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dpenmjs82-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 22 Apr 2026 09:10:10 +0000 (GMT)
Received: by mail-qv1-f69.google.com with SMTP id 6a1803df08f44-89f548d0872so13462256d6.3
        for <devicetree@vger.kernel.org>; Wed, 22 Apr 2026 02:10:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1776849009; x=1777453809; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Ht3ugslvaAB2Tu02wj4yEDUsNolBfYrFDnScbsYJ3ic=;
        b=PjDAODNhJTswMSAb99LcyGNINSuDClgsTrMBvusG1DI6yUG32w0NC5jFApwNIg7zeV
         BH5jnwRPbu0Z/p4CmoVvRege4nxMRLU4fEgGz9jApb67J77sm6Nb1QV3PhaXeREe3SV0
         9RuLQJ/2ZKL+roxEyWgI4JukRGpSzUjExskNssu6cSxzSvo04XCgOTaOat+WkloL5t7T
         szhOoR6mQURqIPo0aDQYMDYDdpn5lqnhn8A3zh2M50VVYnJ7wrvDLnzEDwnCRThH7+Ek
         27Nt0KmG64s/R2envjhaROvfjw6W+oeyqt4ze9vWLDp6MOSZLaDAUHloB1FVg48/sZjo
         uYmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776849009; x=1777453809;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Ht3ugslvaAB2Tu02wj4yEDUsNolBfYrFDnScbsYJ3ic=;
        b=elUfZRBmfCbzNaCZX3C5vNM416YS8f0FjWESG9tuJPtJimxTz8QYWOB35FMiL8gDiK
         aYRsoC4s/ipV/Wr0d23lqCWOj6ysFvDTmv75Qocyv+cyEnhuQiPlP6yJ19kf7CmKKo4V
         eMYIfXQwlpyEqJWO/WfHdxxg2Ri1zFfeFj2yXP5+bT2tSPbU6WPybN84vYbI505UXOm8
         IWYO3QR9Scd9l2yHoHpND+9BX37U9RRMYNPD2tgRqauRH1VN+ARLRbqJq+ZA5gLRTkjq
         u7/U5HGOtbwGKIdux69R3kEdeajKspThZNvutBvotcMUza/oiTKXptt9m0jQuVNPteGd
         4uAg==
X-Forwarded-Encrypted: i=1; AFNElJ8YaIc9vU6cRBScoSmIuMJO3Mj6RX1qSY5/3tgCiutWobUVRObiw1BLFJBR/Mm2OASFN/nsfLQ2LzDY@vger.kernel.org
X-Gm-Message-State: AOJu0YxpRgHszUgoJgzgOR1NkLFkxKh4WwaUFhl5Y4vkOmJmZzwcfLsp
	tOPzVuSPpl6GWG3GO1QuMknuiSCHoQ1YefwUSFZBJeXASKMEyc73jSBqoNPi17xk34bADCCSooq
	k7KOovIjgqMTFg6eHrNffJAUuyFLjkBzlIj9zlDDjv9HkwEDVYmPJqkAH11SflsFNwilZ54kk
X-Gm-Gg: AeBDietc/0zc/RnlNHcbjXirD5aHzdRzY35FDDsgqFIvzCo5zykJqQNOMgHntvPdLp9
	YoJP4yd4bQ9+5+8M7X+/vqUSVbW+n5LJFTH9wlhJwSl+6BRFcxi4rOZG2MHbsjZnyfUErO1tcuV
	1056OiRTH7lJOJIXH3DsoJqWkUADhkhZHcUxBe3dfeppG12Ro1utBfrOZpcH/LGHNNT7T/YVaIm
	SuPEY67qjXMdOHY6jVXdGQxGyj29HLxa+lt4NPX5M1zMkN+8/iMU2ngiUGYC4K36yp1nRLQOy4t
	iWW0SI/JZ5880y+5tZlEHUkH3lErSczNx4z1GKDVus+3jFWUYu2iKCuNSd61z8bnMs2prYn0dQO
	jujQvmY/QapcevwZWyWTsAzGC/9ZmQsbpq3GgkXGxiQ33cpa2J+ScwBkaY+oXvxFgf8do5TKDOo
	W0ljwTWZfKDnQNfw==
X-Received: by 2002:a05:6214:29c8:b0:8ac:a833:a22d with SMTP id 6a1803df08f44-8b02813864emr257999216d6.3.1776849009605;
        Wed, 22 Apr 2026 02:10:09 -0700 (PDT)
X-Received: by 2002:a05:6214:29c8:b0:8ac:a833:a22d with SMTP id 6a1803df08f44-8b02813864emr257998856d6.3.1776849009062;
        Wed, 22 Apr 2026 02:10:09 -0700 (PDT)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ba455539817sm518715166b.56.2026.04.22.02.10.06
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 22 Apr 2026 02:10:08 -0700 (PDT)
Message-ID: <9635af37-f3cd-4f82-ac87-84e51021822d@oss.qualcomm.com>
Date: Wed, 22 Apr 2026 11:10:05 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/2] pinctrl: qcom: eliza: Split up some QUP pin groups
To: Alexander Koskovich <akoskovich@pm.me>
Cc: Bjorn Andersson <andersson@kernel.org>, Linus Walleij
 <linusw@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Abel Vesa <abel.vesa@oss.qualcomm.com>, linux-arm-msm@vger.kernel.org,
        linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org
References: <20260420-fix-eliza-pinctrl-v2-0-b68329fd6701@pm.me>
 <20260420-fix-eliza-pinctrl-v2-2-b68329fd6701@pm.me>
 <cdaf1f7d-72d1-4481-aa3f-4b15990cf6a6@oss.qualcomm.com>
 <Li2-2Zov5lvXZcLfb6l0_7mDAg2QB-ag10-aLD59ulR1pntDBHpNORrd0I5Gg_YGqo-rGdIgil2DmrVw1CoDhgN1S7QLsnId_k2mf4u5DYk=@pm.me>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <Li2-2Zov5lvXZcLfb6l0_7mDAg2QB-ag10-aLD59ulR1pntDBHpNORrd0I5Gg_YGqo-rGdIgil2DmrVw1CoDhgN1S7QLsnId_k2mf4u5DYk=@pm.me>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: i2u2xb_7lcrk9tPR4KD1Y_Q_AxjFP8lT
X-Proofpoint-ORIG-GUID: i2u2xb_7lcrk9tPR4KD1Y_Q_AxjFP8lT
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDIyMDA4MyBTYWx0ZWRfX08x4mpp/BSDy
 nHlAvnHW5CDl2MFFK8orJB1yjzt+xT4cSP3du1jYN8yG/9ZTTbab5IqqWqCazeMHxmtaFnNipna
 vmRncvn7gLBSkArHoNVMkTexf74n1vus6MXsMrIzCXQEQfCIBMa3C7ARfXa8lm5//jQZJNIyF4I
 omWS43/lZzWuP3CCrCT7Oe+auDCetYaRe2mBNejuZ+nNSUC/ARV7fxjm/IuzCM8UlWVZZ+xAscG
 bGZ4TI1rMObmZua4wfc5PS8OEH++Z4kgvLaBf9R/U7DiLJWmw+y9d92V++fIY49o5Ov8fflsr7D
 /WLvuKZuKSwgzujxGmdJW2KVPJFvqYrzutTJv0DedPttWiWyp219Pyp4JBmgk1HLDz0LDTlEEBS
 Xu/bhI7JfJXGl+YEXxIakJqB/84x0QAMwoHRF2SbVO+vqBlKmsYDZRSvvBOrK1ycJucWn6pF5QT
 6sKc7z+sBH3KyoyUvgg==
X-Authority-Analysis: v=2.4 cv=Xd65Co55 c=1 sm=1 tr=0 ts=69e89072 cx=c_pps
 a=wEM5vcRIz55oU/E2lInRtA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=EUspDBNiAAAA:8 a=dVDS_O1aKoMvdT6kGvYA:9 a=QEXdDO2ut3YA:10
 a=OIgjcC2v60KrkQgK7BGD:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-21_03,2026-04-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 lowpriorityscore=0 impostorscore=0 suspectscore=0
 priorityscore=1501 phishscore=0 bulkscore=0 malwarescore=0 clxscore=1015
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2604200000
 definitions=main-2604220083

On 4/21/26 6:50 PM, Alexander Koskovich wrote:
> On Tuesday, April 21st, 2026 at 9:06 AM, Konrad Dybcio <konrad.dybcio@oss.qualcomm.com> wrote:
> 
>> On 4/20/26 4:28 PM, Alexander Koskovich wrote:
>>> Multiple QUPs have lanes that can be routed to one of two GPIOs and
>>> collapsing them prevents devicetrees from requesting specific routing.
>>>
>>> For example, a board that wires an I2C SCL line to one of two GPIOs
>>> cannot request that specific pin with the groups collapsed.
>>>
>>> This change splits them up so devicetrees can request the configuration
>>> they need.
>>
>> Please massage the commit message so that it highlights that the issue
>> is that there are multiple functions defined for a given pin, sharing
>> the same name
> 
> Will do in v3, also I was looking at how sm8550 handles this with qup2_se0, and
> noticed they don't split every lane in this case, they only split out the
> lanes that have two possible GPIOS:
> 
> 	msm_mux_qup2_se0_l0_mira,
> 	msm_mux_qup2_se0_l0_mirb,
> 	msm_mux_qup2_se0_l1_mira,
> 	msm_mux_qup2_se0_l1_mirb,
> 	msm_mux_qup2_se0_l2_mira,
> 	msm_mux_qup2_se0_l2_mirb,
> 	msm_mux_qup2_se0_l3_mira,
> 	msm_mux_qup2_se0_l3_mirb,
> 
> For Eliza I split them all out since I figured if I was already splitting some
> out for mira/mirb I should just also split the rest, but should I mirror this?

I'm a fan of keeping it minimal and only splitting where necessary

Konrad
