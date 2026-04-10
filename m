Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7683C3B0AFD
	for <devicetree@vger.kernel.org>; Fri, 10 Apr 2026 13:32:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775827974; cv=none; b=rCxx8fDAqzPOYqnhXmpguV1FXQgZqzYTozA1Aatje5dvibKGfitNUzOoxJMYH82ZNNZ9cNMASeQoFXB6vqzrj0ymWMxWf1OaLHxOXEmJnLtSfBDfkYHGCwHv4/siAfswjDdVjVzQGwNbNTboT4vBW2qJtoXzbgC2yoRH6am1dso=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775827974; c=relaxed/simple;
	bh=p/F/ubJz4TnePeuUAPFWFIpOn4leIoXpjB86p8c9qi4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=tNPcrMMnC4kckyb0muPlmaTWkzv7nVDpQtMDH476Q1Tkq5I/cqQ9E1OoPUOPppnFqg22g9M4suViSuK+jQWGj+Tt09Iur8arpPP2ZpTGMWu5W17NOOheeJn6T2FFw9GvUWI8Q7O/3wucne6rNCpze5VSyg0963PvdOn+ZyxjSt8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=HJN23wLN; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=CyFg6G3j; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="HJN23wLN";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="CyFg6G3j"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63AB12qv438864
	for <devicetree@vger.kernel.org>; Fri, 10 Apr 2026 13:32:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ROaqTpJVwuOL0zdQ36pjCLyEmqKk88M6hTtVA5HSexI=; b=HJN23wLN1XvP10pn
	pzb0hFcTObTIZ/4vpTdykvyWGv+DVyboLJX6PEcfO0wTtt5BS/6d8oZhDIbOhMXO
	6xnEcsxskeJi0v30MPAquDTxLZnwPNdZwhB7lD4JStYTge55vcgeq4wGFTeCUc9I
	4IWp4uJWRguw+0Qq8U6l2oN+KSw3AsfDX3yaNl3gqTOdF07fx9kzIg28TaOXodo+
	AMRI2wLovsG1qV0oGFAY7hAadSRYMlZAUSUczglHoH3a1dPLo4PVFFm5wqbrDRX1
	7+yBbVJkotFqxlNFGdnMGAzsBmnjz/i4JnmipnqAko/FFfLoDXHF5tedzTzsedp+
	ZWvr+A==
Received: from mail-oo1-f71.google.com (mail-oo1-f71.google.com [209.85.161.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4deyy9reaj-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Fri, 10 Apr 2026 13:32:52 +0000 (GMT)
Received: by mail-oo1-f71.google.com with SMTP id 006d021491bc7-679f702c3dbso296790eaf.1
        for <devicetree@vger.kernel.org>; Fri, 10 Apr 2026 06:32:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1775827972; x=1776432772; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ROaqTpJVwuOL0zdQ36pjCLyEmqKk88M6hTtVA5HSexI=;
        b=CyFg6G3jjLkFSyxKzTqcuCrokea8WKm/sLpYFd/2IXmUhMKtBfmWhZ2HBPzW0kOMRE
         CygePEejEaFE1AOpv2j1p1ppfDnfv1mqu+ukK7G8awl3LP0bLL48o4Ckt30Q0RZgFcAc
         e890YtyuJIlU4VHPJHG6uHwBvMoEyX40a/eKxYriFQu5QHtKXkVqXG3OfjY6gwi7vD3y
         RHrBCMS1q+Xxk04KwUVMBm6bfzucAI9VMTbXT5I/9ls5caVhl6dTLo4MjYNe77/F9R10
         EREOcXpZcGroJ7DKujnRm17P2dJyLHKtiMywThf1WnK8YM+xsy+OX0CoJdjQXvIJqOTQ
         XvXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775827972; x=1776432772;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ROaqTpJVwuOL0zdQ36pjCLyEmqKk88M6hTtVA5HSexI=;
        b=E6DFjggPFBNWoH4mxGrk6yU0pvh5gfTJpzGwmog+X/75JsuzjAFdLAiKbz9XFRpLBN
         Vjc4NUHEJIBQre2C8aka0oBQrzzk7MtAq40heaaA4TQKe5wYGSa4HOFt4CR9c4N8TnS5
         kPWsawkqOj1zI0GN9wdHkatH4EoKRdTfAWoAZoAANtrvOmo6KkITki5KcmkqJTUBRmZH
         8Ii51s+FXX9FetTP6CZRRPr8oIXUTQus1GccFYOf3SKJf6xncE+cy6ksrHGJ4bwLGvtq
         8VDpOMCq4nmW4E4n958dmZR3D3aX8TrpYH0I8XHiWP3kc+yS+LcbMZhl+xBRCbsjFD/a
         xJ/g==
X-Forwarded-Encrypted: i=1; AJvYcCXrViL18sGc0gpeIChiKaVcQNhCm1CkjCzDi3TjdJIB1x9b5LwKDJg49Ju0EssiF1mkcmlId2CjahYP@vger.kernel.org
X-Gm-Message-State: AOJu0YzOey6+vIPNmYhVIGRMBurSz3valrBEL60yYMoWADGaOaoQFQ2x
	asIDjZIsg5lRvcmWU36fZ3p6R3YzJ1NWPrYtkxw3EyBlfGKEwVlnyuEBvpMxURmAEIkLoS05dvX
	NPA9p3pUWUyDfq23BlFds7jAvaGD1oxaw60qQcmDRuxiZHmxN/9fTTDYPo1awiMrzmrETWMZ8
X-Gm-Gg: AeBDiev12bXsKpsvwfZ9TbF3LrZRO6kyZFTwPBt/HbTtqVTUnamMW5JhB4Lq7AvW7h+
	XNjcmGrWHm6mbwcUD6GSSmLYK48hXU0BvZxFIBB70AyZRJ6Ri0f49TOJSldb1pbMFRUiLNprlB3
	qZR2u5jYEQ/FVpMtIKvSoJRqSU4DeVfi4wZqw/YorNnFsfX+7fy78PSwg3iaakiQMW6J+pcXNgG
	+PLPmYa10H6ModHU9dZCO/Xz/tMiezNC399+1HPN6KP2AbTQagE+Q6QKEYZAP8kNVd+1ozOGY9y
	Nk5vdAIe24do+Aixn4WZbUj75EB//K/7mmSkydFyY2mrH1nqELYLIwDOEGUG7rVv9Zv1AEv6gO4
	u6fvyxvB5g1fIIWc31fRvVpppEVD3yRrBTor6NjDB01+xwFxJWGtcMJzH/HAjnrHJuRBeaywXY7
	qaosY=
X-Received: by 2002:a05:6808:1907:b0:467:272e:883 with SMTP id 5614622812f47-4789c740c37mr1031514b6e.1.1775827971849;
        Fri, 10 Apr 2026 06:32:51 -0700 (PDT)
X-Received: by 2002:a05:6808:1907:b0:467:272e:883 with SMTP id 5614622812f47-4789c740c37mr1031493b6e.1.1775827971342;
        Fri, 10 Apr 2026 06:32:51 -0700 (PDT)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b9d6e7c8a13sm77991466b.53.2026.04.10.06.32.49
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 10 Apr 2026 06:32:50 -0700 (PDT)
Message-ID: <c78fd260-ec2f-42db-82e6-6663b4ec9420@oss.qualcomm.com>
Date: Fri, 10 Apr 2026 15:32:47 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 2/2] arm64: dts: qcom: milos: Add IMEM node
To: Luca Weiss <luca.weiss@fairphone.com>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260410-milos-imem-v3-0-d215385fa5ab@fairphone.com>
 <20260410-milos-imem-v3-2-d215385fa5ab@fairphone.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260410-milos-imem-v3-2-d215385fa5ab@fairphone.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDEwMDEyNiBTYWx0ZWRfX8znkG6b4YoAU
 Tuj65pFRiD8aQ+n++2v07vz4Ho8lRZVbR0jkogLdZqIlF9UbP/89iD7VlTGFouolSsK4J0bjAFB
 M8ufuL5f0rrStGxzYTrokLaEb7UHYfnF4XPPTpPvAWzBvVCBE8pAzPIKeC52hVnwQVjEJ+AX3n+
 lNadvQBdGFqF0pfa1tnxkRFKiVDW27tyaeDXc/cZ8Dx4HQpUJOF0byg8S6K/k6MAny1VBidWlXL
 0IDJcqGn4SbeFDCP3CuC5jYB9rcygXyShmA8hn+FARHqvbJZ1KTGxd3leoxkJoeYjrgapXWqXDv
 LQ9pnieXnyRT/h4KMAc0ONXJA72lKFs5dajUh9YWeeP3GpWPW7C6KQ90JQNLondaK8GDfc35Y+P
 g9R61bJHUhktD2aNb/gMGB1amUb/dkS++E22vLcY0Lr8A8hiQzZ9pPvO5ge2XLIgqzOmH/0UQ/q
 o1a5Jb9j6eNJcV2fDZw==
X-Proofpoint-GUID: WqiI7Dr8ty_gJSErVx4vZcVu6C4PyNTC
X-Authority-Analysis: v=2.4 cv=d6fFDxjE c=1 sm=1 tr=0 ts=69d8fc04 cx=c_pps
 a=V4L7fE8DliODT/OoDI2WOg==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=6H0WHjuAAAAA:8 a=EUspDBNiAAAA:8 a=5k3XNHiivogdNy7buJ4A:9 a=QEXdDO2ut3YA:10
 a=AYr37p2UDEkA:10 a=WZGXeFmKUf7gPmL3hEjn:22 a=Soq9LBFxuPC4vsCAQt-j:22
X-Proofpoint-ORIG-GUID: WqiI7Dr8ty_gJSErVx4vZcVu6C4PyNTC
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-10_04,2026-04-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 suspectscore=0 phishscore=0 lowpriorityscore=0 malwarescore=0
 clxscore=1015 impostorscore=0 adultscore=0 bulkscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604010000 definitions=main-2604100126

On 4/10/26 9:31 AM, Luca Weiss wrote:
> Add a node for the IMEM found on Milos, which contains pil-reloc-info
> and the modem tables for IPA, among others.
> 
> Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
