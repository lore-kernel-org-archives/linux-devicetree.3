Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5C2A84D5961
	for <devicetree@vger.kernel.org>; Fri, 18 Sep 2026 10:06:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789726008; cv=none; b=iXzh8AcQF3wVje+4chwuki/zo9JaTjs5koDAd9NlOYEEAlJN/pimi722nm8aUiOXPu4F/ZQkjvZj85ZaYJMLwRWVsJRqcECbeP52ZoFnlv20oBEJq9qvj+hMRRTh30nkVfu0f27y9jNZ1s9nYtHHr2eoU3TY1/qUFKMgKhCHlL8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789726008; c=relaxed/simple;
	bh=xLJMw5VUo0mVjCzcec/GKVtU22XKIreQS8drxGreApc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=QhgruMTMLreGKD3gosFNPfpev2Z7Lst0iuz/CfAP4ofnorMKQ+M/W4SYcUeGjkk7KGvs2MOKi3bA/tcvmcoUZ5RuqznYK7aH4C3TCjWTJEzCyF+KO13V7UYJR9JAt40FaF4VPfFiRAlkR2qkVVGroZ12cgQLWqjZCN+Ud+x2NRY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Xoy538PE; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=C+/FOaWo; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Xoy538PE";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="C+/FOaWo"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68I9dOuc250720
	for <devicetree@vger.kernel.org>; Fri, 18 Sep 2026 10:06:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	qOjayDxG2GFpCo1na1YsIhlqgQg7q43z94+3fvFPMHA=; b=Xoy538PEU7uNsmgg
	oCJfKkZxR8+t7Hy0R9dsgbBU+6DNHaqcjUwgplVtmq+7Bx1rInK03020q5Pf5FMR
	67LE5aYHHsf03MLUz7+xcibnyWHAIcNwdwGOWM4o/MngyZfBSmdM4mKOG90Q73Tk
	wFUPcuFkq6ibeoVeA9lmxKPp2o61+uW0kFFX6A9i2/IC394NWhomFluJRMVI5GNG
	Qj/zcLQ4dtwUrkhX5wBzm7IzzCa3wZp5SsRYMGN8cfNB6BHg3NUmvSaBTfL0qPZx
	BiQGuDcypp/kJit8RHrBhhmYL1ygY50rLEU9CIAbTt6CIKIIl4Qtqn7adcbi0mRB
	ddnH0Q==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gs2390ajc-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Fri, 18 Sep 2026 10:06:38 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-930a312222dso12344985a.2
        for <devicetree@vger.kernel.org>; Fri, 18 Sep 2026 03:06:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789725998; x=1790330798; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=qOjayDxG2GFpCo1na1YsIhlqgQg7q43z94+3fvFPMHA=;
        b=C+/FOaWoJbrvOl7VkSVaWKqz0TJXEXwV+Q6MgeuA8XWIlcw4XdI0iiFiV7VLUziHkn
         3CazZmYfkktTVd34LYCMg4s4CAwGeafm/Y/EVe4+QHApREi+xUDjNFgUgQ008PTVDQfB
         sAuiV7bzeXqqQjqwVWDXROxd+qrGy+7+U51/za7BUrhom245Cvfd3uv8Jcy69ZiwnGBQ
         +l0aUmjdL06WA6yOxGqne4Tkutrfm0O+BhJ0niiUNT8CGhuLZ5jPQsz3G1fn0iV2dc/u
         /zZQDpW5nr9ameBLtytm/9nEx4y9Z96NDQuU5HGN4arEmf74CtdHp6AmuiPcWeEcq8r1
         w3Ww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789725998; x=1790330798;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=qOjayDxG2GFpCo1na1YsIhlqgQg7q43z94+3fvFPMHA=;
        b=o74sV6ELsnA7BGW0kctrdUjw0oYcIedtLnqquey6SERHMgyQ1LGHhKwW0LELnrFvTt
         C6G3+Zv2mCLhrRv9oTP2wG7hezNFpvTRX+aLaxLh33qb3p6jjvuDFyv7HA5spGNPPGrn
         pqlDHt2OvHRHi5zT0IoHJJqwmCPQKdkq/tqHvTDYB8CFzYn31100QtCGNWndtRfHmAb/
         9KCh/k1QczclnN+DULeaUq3FwyICIoilMRKWJmCmFBfXfiD933s0q61plWJQggSPFAF1
         XD+ibL4zpAtv600pdf7yBwq41hb9M6ydbQmDRVo3j65aXwYtqLZXyka+fPhMAw4DvVAQ
         G9Mg==
X-Forwarded-Encrypted: i=1; AKwUvBxUMGyI/n8ypmGcUvVb1SykwvFng+BKeImRY7TGmeMcNWL/PXmZgguM6mNcQz5iGk9ojfd1V/Ihkbjz@vger.kernel.org
X-Gm-Message-State: AFuF++kgMBPB42BYpFi5kJ7S8qTHa13JuD1NTBbBCYSOtBTuSgR7oqPX
	8m8ci9WiGf2ORgouXAUKnfTjUH6c47dAqvCe9vgsOBdx0kynbeIvnxAASEWZjkTDqExq2hr0qx7
	SCbk407I9EmwXyhhjqepNOQKJ0gdts5trJdLzeNrxA2NYZ4canSEbetOS8HU6MXO2
X-Gm-Gg: AYBFou0DxGcMux1gIbKT/MQTF6uKAAaVCDFgrQWiViwDhC3X8QXBWNF5u1W+0WWlzHV
	MOhUChhJDq9eswXSM//ZTPcQEUTmAgXfH1i3QT/4hJmz7MyPXl+eFSqF40QAvJxMKsza5Ljypfy
	Kh4f40BqCUBJqdt1XC9l1ddDIfbgOPuVXl6g9+WG2JXQifTh6HhA0iXf8SJ86s0+B3M4MnSFA82
	3wUqnXdU+Z9QC+u1f/f4QkkRA+F3xMkdYK+kdTC5oakpuALt1qUvswHZEhIQMuZEB2i+XkRIQ3Z
	zzbrDnVUfosiebStFuf/2rPtk79nIq4k+Bqp3mF447sIbzV9473rzElYVQq5Y+9wYb4RP+YsdtU
	ZrDhJsVdZprVXD+1Vk5yeBg==
X-Received: by 2002:a05:620a:4408:b0:934:95d9:85fe with SMTP id af79cd13be357-93be055f2fbmr185228485a.3.1789725997731;
        Fri, 18 Sep 2026 03:06:37 -0700 (PDT)
X-Received: by 2002:a05:620a:4408:b0:934:95d9:85fe with SMTP id af79cd13be357-93be055f2fbmr185224485a.3.1789725997331;
        Fri, 18 Sep 2026 03:06:37 -0700 (PDT)
Received: from [192.168.202.12] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c2a1bb08182sm40158566b.15.2026.09.18.03.06.35
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 18 Sep 2026 03:06:36 -0700 (PDT)
Message-ID: <9858713b-031a-4b91-85df-4f3854079b91@oss.qualcomm.com>
Date: Fri, 18 Sep 2026 12:06:34 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 08/15] arm64: dts: qcom: sm8250: Move PCIe phy and
 GPIOs to root port node
To: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260917-root_port_v2-v2-0-6272b7caae9a@oss.qualcomm.com>
 <20260917-root_port_v2-v2-8-6272b7caae9a@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260917-root_port_v2-v2-8-6272b7caae9a@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE4MDE0MCBTYWx0ZWRfX+ugk0lsaOW0s
 4nhYRUyrrTMzjEjgUfK/AlFQYEnvjCyQUnqDi5OXLMsdn8RBGgYC9v+Fv9LBxSCGNzctNCaqDS0
 Wh6DhKTNtgN9MzvVmiviS9lc5xgfwfk=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE4MDE0MCBTYWx0ZWRfX7BFEOR6fmeKM
 PDhstbMdxpt9MGAPglV1+l2a5j42SywksNSk/NRMGNaCh92bkPT3nwhf5KToVzVVx/RDkhrLCrT
 j54jyoohIYOpLttH1TOXMfZqqydldd6ZfJ4YZz4yC8mevJPIfBPMLcmXQ0Vya7GF/p7HZMlOTFW
 0HvlrbansXkczZceraxo/Q7Y7+tKk1Irdc3txK74E/KmWxtu3oYzPIwNV117hK5Dch3zsrQwocr
 jQS6SWKYlmqKrppgZvQgi9M+Hr5W/rPRNkLxLi0wzGitDWIji5kYkl2vV1qrQbgbtDYxaCLLYLQ
 xHgL+8xs6Xf0zoTfqRuFP6ADwgLMNLFBJtlNyc72OA021rb4xRqT5YfsMPELzH5V4t6TDRIJI/l
 uSCIbd8qzlizH/uDDONaRIiFy7/g0BENK4klYwZWiGL0FItEPvSQf5uW7S0Pa65iwBUpbn4ZPfQ
 BFTt0Fr67tTqjQb22ig==
X-Proofpoint-ORIG-GUID: mmCJ-U4J1kk10AVZ3yBSSJa0z8mU33hs
X-Authority-Analysis: v=2.4 cv=I7zw19gg c=1 sm=1 tr=0 ts=6aad0d2e cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=EUspDBNiAAAA:8 a=6pHcnep46kEejBPVP2gA:9 a=QEXdDO2ut3YA:10
 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-GUID: mmCJ-U4J1kk10AVZ3yBSSJa0z8mU33hs
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-18_03,2026-09-16_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 suspectscore=0 bulkscore=0 clxscore=1015 impostorscore=0
 priorityscore=1501 adultscore=0 phishscore=0 malwarescore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609180140

On 9/17/26 2:25 PM, Krishna Chaitanya Chundru wrote:
> The PCIe phy reference and the perst/wake GPIO properties are
> per root port and belong in the root port node (pcie@0), not in the
> RC controller node. Move phys, phy-names, perst-gpios, and wake-gpios
> from the controller to the existing pcieport0 and newly labeled
> pcie1_port0 and pcie2_port0, allowing board-level overrides. Rename
> perst-gpios to reset-gpios to match the binding used in the root
> port context.
> 
> Signed-off-by: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
