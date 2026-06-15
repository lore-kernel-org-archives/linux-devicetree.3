Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1A1732F83A2
	for <devicetree@vger.kernel.org>; Mon, 15 Jun 2026 06:22:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781504564; cv=none; b=XjUIgKCZeInyPeIhxMebcX2ilAXminBL5Kgp8J9l6p5nOXhaZiHAh7Ky4wp+Ns2Xhu0sX3SVKy0PpZJ3iPEZf5nQZOh54JQKxyIC8TbhTDLD4Pba6vN4CHkV4l22nEnt2mniIeSrInJqYN7zaprk5tUJ+xj6pIALiSw5aAM9+QU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781504564; c=relaxed/simple;
	bh=/jsk2c0jgIq0uFJmJJ4W6J901ish66RM16aaQCUYz78=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=aIpuXR4hYXsYa1WMCwKzedAukeHmiDH8iAGtaJy7OTqflSRyrxjXUVm9hyZTxri1UACdNihsn0Lzc8i/WFUX8Uw6GMVazM3jgyJJ5qvq6E39g7kKZaLIf293pcYwzHTXLvBgJEp18s2Hu2UrDjBif/jjp8mXGBXlKsAykJ5OYs0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=T/5dfKLW; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=D1JqGgmS; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="T/5dfKLW";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="D1JqGgmS"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65F6ItAH3332452
	for <devicetree@vger.kernel.org>; Mon, 15 Jun 2026 06:22:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	/jsk2c0jgIq0uFJmJJ4W6J901ish66RM16aaQCUYz78=; b=T/5dfKLWztHkVpmS
	1M/FLGog3WuijyPRLexVZhz32FRyB2+CVS9mmCPNHQyOev0/w3bEaxYPNUjH85gr
	mOap+6ccA4oPUH9yRrh3RkyexfOR40a5HHIlXf3y8P8bcxXggzJkGLZ9/xhkOgK6
	PX+xfvNh39kMTnv50nf38TFUpmo9b9n5+WyK586sKbFhxFkToxmM3ePx0H22eFM0
	a+bC4rmd7swzF2gyViqjoAwMdz6+iWFT5PV2Z5SASNV1m3VaHXuGNYIsqGnAOEBh
	DvRveMQ7lrlNHqMQBosUKkh86T3wdpDl+fLgxJzWJsuhfFNbvBfj0hdR0Ly+hNiB
	i0P0hg==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4erye15w3f-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 15 Jun 2026 06:22:41 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-36d97a4e08fso2887510a91.0
        for <devicetree@vger.kernel.org>; Sun, 14 Jun 2026 23:22:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781504561; x=1782109361; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=/jsk2c0jgIq0uFJmJJ4W6J901ish66RM16aaQCUYz78=;
        b=D1JqGgmSNVGwXasUjVQ0HbAwuJusQKASiSgqEhmMWs0EJd20aMbfJpxyj68gPrFb13
         kBd5YEddQ6s/tCBAiadBusNABfwNH+D+BMDzsBb7DzQ0ulBUIV0tK5wRtI13j2r0Nv2l
         AV1vcSPOMBOHVhAYK8RyM6keCvIFLjmlquqJ4jZisxZO/XTNuoKb5FSXSKdI5XK01oBK
         PAO8svnqsiVlQrh4Mg1EV1pKfDsgNdCcYUoIiPeEi7/3p8zTeVPHV01nEzPU3achobwe
         641+jUhPHbH7dz6AsPsQ9oO50IPyH1GdpIE7/r/tqnA85r4LGan1HN3k/vVoUrcIdlMZ
         /3Ng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781504561; x=1782109361;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=/jsk2c0jgIq0uFJmJJ4W6J901ish66RM16aaQCUYz78=;
        b=ZvjU/V9q1Qqi04UL7LC4KSt/s2aB09da2foZhsjTuSbmrurDyH5hgw6xOUS5ULgA0d
         3WzXwT3hasfVBWQGXW+tYCdtQH4hdMD2buVZ+bdncTiasvbuZvrPVlDjD1zR+2Tyu+/c
         F2TjpawdPsh958+5tgCkl7cxkX5K+sE1r/pzppoR1ll7z0WpaLSLIXznUd3AEDhBgh6B
         afXRUtgfpHHGffNdyQRpGqQ/OVCnSzHKTwj7u0qT2BHo08jMoTOBQ/l0E4Zz5qhwUl/C
         od03JF84SGbii8grfaLsA9agYOn4cha86AqxZ7OokXGq6W5c6QhxXP9oJDQ2WBJbV59y
         3QRA==
X-Forwarded-Encrypted: i=1; AFNElJ88XUU2uAcuvkpDQLxGbh9zbpHVHUFRhNbiCQdONfYx4+HS3STPoLvBQpyaaSPpN692DpBIsGf9LI0y@vger.kernel.org
X-Gm-Message-State: AOJu0YzQIFymg+03Tv0yGDE9ydbJJuB6NMhMsmTBdYMDscDkPb7aiwpK
	dJ9ub/Z3Yqw5x5vLFzxYnIW33b/oKRq8zL1ZMGxIgi/iGTbi4QSrnOySwyT6OJHLQSjndToYbAZ
	mX34TBRfNGCQfbc5HFmTz/QubQ7Xj3PNADHOouGckwG1dF4RaQzcrobG/znbr56yG
X-Gm-Gg: Acq92OE/LhugtuzH0vUyu1/aaS+eeRPIzst3jgUw1exkbTutDTxtgp111qIZTUepjB0
	3Cs19GwMSJuzEJ8YjQCQcJnaCeOgak9svUXDVSgHfOJomSm3Nm1y26rmenyyum+qH5paHZt4I7h
	lZY3HJKxBpKfkcS0iHEmvLQXtLJj8osCc39Az+3XP0JiE0TmXCDG3C25Z2XDQiXtAEl5W/6qCvx
	v+Wd0LJy8CbccM92sPzLdXW0RpFnV5elmfE188QungoZJpj3+pRY9HnoUUIxaRNpL7BpPpfH2N6
	tWyhOvuNEmywbSUAuTXOovArZ+QRa1BFgo+Y9gkcGLhYD/tPkuXSp25ZqxMNAJnxpKvWun1ppmF
	QU1XaJDTjxA+0Cu+wpcvcR4R/oHlHTULWb8ov1m4pMeOnSVDeImBCouAq28k78DMLLg==
X-Received: by 2002:a17:90b:1cc5:b0:37c:18e0:90ea with SMTP id 98e67ed59e1d1-37c2bd29455mr9723081a91.18.1781504560544;
        Sun, 14 Jun 2026 23:22:40 -0700 (PDT)
X-Received: by 2002:a17:90b:1cc5:b0:37c:18e0:90ea with SMTP id 98e67ed59e1d1-37c2bd29455mr9723030a91.18.1781504560116;
        Sun, 14 Jun 2026 23:22:40 -0700 (PDT)
Received: from [10.151.37.217] ([202.46.23.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2c42f2e5590sm98846965ad.14.2026.06.14.23.22.36
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 14 Jun 2026 23:22:39 -0700 (PDT)
Message-ID: <c3b7616b-8f88-4de2-8c28-0346219b7223@oss.qualcomm.com>
Date: Mon, 15 Jun 2026 11:52:34 +0530
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/3] regulator: dt-bindings:
 qcom,sdm845-refgen-regulator: Document IPQ9650
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
References: <20260611-ipq9650_refgen-v2-0-d96a91d5b99e@oss.qualcomm.com>
 <20260611-ipq9650_refgen-v2-2-d96a91d5b99e@oss.qualcomm.com>
 <20260612-blazing-brainy-firefly-d77a6b@quoll>
Content-Language: en-US
From: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
In-Reply-To: <20260612-blazing-brainy-firefly-d77a6b@quoll>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: cVGfzjqx7FpMCUWbeFnP-Vx78zHTvFSx
X-Authority-Analysis: v=2.4 cv=MNlQXsZl c=1 sm=1 tr=0 ts=6a2f9a31 cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=j4ogTh8yFefVWWEFDRgCtg==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=EUspDBNiAAAA:8 a=tHV2ojtu5FqpfGfkYVEA:9 a=QEXdDO2ut3YA:10
 a=uKXjsCUrEbL0IQVhDsJ9:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjE1MDA2NCBTYWx0ZWRfX/V4ZoZ/ld96Q
 X9h1DJ4p+PTzyoRShGvBu4yKpPum0m0mALKpCod72xN8aUcQ3DU0TiJyRrB4pcrTuSOgT1mGX7r
 p4snFlv7R4RBxAIe9e611Cu4Mhz8emE=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjE1MDA2NCBTYWx0ZWRfXxe1QwO58lijP
 wBZeeDYmT7bBK0X1hQAXpRkpvQR3xG+hRjMEO2v+PBVZAF2N/69+sMGNEs7Itx8NYG/LFjRTdYX
 X5wUqtF56eIVQ2/O4MdKCGHEPLWu/bMTDnJUWxWjTuyK8hmz7ui8yn5cTCSvxJTd4A1edlJ1cHT
 bPkkK4yltNYy57NWYD6+ahnh4dyrLk5KaODgWaCs8Ujx+EaTAsGXHi33F7Eg9T/wLttThcGuhIr
 Fb9KWd7dXvBSXCHqcx/t8dzYKTEA11MR9SSzvifRYCYQcNvA33sYkFQIAX4i63HSI01rX0uRreP
 y9kY6bBhbp6ZhSOdldxrb5D0/dNQz6ko6iyUA8zCrVJcm5QxELSNFEbjpnklxknaDLFNKM8i+C8
 eOslg6CKMePeH3vwEmz54/sJkHn87MZro5z9QI2/ceagxbLNm9ksFfqKiRvELp9S0sS8bW+bg5q
 M6SJRvmM9E6JCqCkpEA==
X-Proofpoint-ORIG-GUID: cVGfzjqx7FpMCUWbeFnP-Vx78zHTvFSx
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-15_02,2026-06-12_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 impostorscore=0 spamscore=0 priorityscore=1501 phishscore=0
 adultscore=0 suspectscore=0 clxscore=1015 lowpriorityscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606040000 definitions=main-2606150064


On 6/12/2026 2:32 PM, Krzysztof Kozlowski wrote:
> On Thu, Jun 11, 2026 at 02:33:17PM +0530, Kathiravan Thirumoorthy wrote:
>> IPQ9650 has two REFGEN blocks which provide reference current to the PCIe,
>> USB and UNIPHY PHYs. Unlike other supported platforms, IPQ9650 requires the
>> REFGEN clocks to be enabled explicitly.
>>
>> Document the IPQ9650 compatible and the required clocks for it.
>>
>> Signed-off-by: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
>
> You just ignored feedback... From me and Sashiko.

Sorry, I missed that. Let me address that in the next spin.

>
> So you got the same comments.
>
> Best regards,
> Krzysztof
>
