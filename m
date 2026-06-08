Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 78C6B36A36E
	for <devicetree@vger.kernel.org>; Mon,  8 Jun 2026 11:40:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780918808; cv=none; b=fTC4cWMDGRPtI3iwmvb/mQO5yAB1CbOeNMDYuiClIWXQHmqZSO3cVYp7oiv/IG11Q5eI2MzlCDea64XKhdNC8rq8awMhywXmkflf7zi6REH489ClVys+KqhM8/U5VMDC57AGQfVtv/l43oaAV16ZeWuJBPp3zo646tVvTKCt1UI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780918808; c=relaxed/simple;
	bh=EN497Hs3r8Tl344kRRZC74q9NgY3H/XPtZgg08D+jHE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=UhGNsOBoDsltabGDio7B5E+aZvyQ9DOwmB8crdR8cXN4OjdXek73rH7QADYQDKbZDZdk3wW9F3TggZQY79tnGyDOLA/mxA5b7lLvFzBlZQqjoxJoDSUUXaGpLKBEhgKx/gmiCblIAxq0wlcgidLLlDikjeoH6tlB/LUirNj7qic=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=JMvZVAiu; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ReeyV7HR; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="JMvZVAiu";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ReeyV7HR"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 658BBsCT3459820
	for <devicetree@vger.kernel.org>; Mon, 8 Jun 2026 11:40:06 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	sIgJupkYtH4h1zJNhRGssxohoVOM6fBQci0ibj/UCEA=; b=JMvZVAiuPZUScjL2
	do3A3NNJR6MWJ0SxnQUqi5fciKVfGfzlHi9PIxUc3fPRar1YOyy9UT0OIfJcLrhh
	19GNj1yrD4WbyPmsHUEVY+HWjDxpKd5hoee0CTGsDhfl+04x+suIk7ojdoS072nP
	FaYtsgKLCDAglkuJRYVDNPBI4w05C3KIpdpoDwDzviiOtq137hyEhmdG9asvZWFO
	qm9E0gY5t2DteP3aMpBvdp9oqEvWhMrPeKa4mA3h9ZCaI51hs7j6X9MHt3O8hDRC
	+9K/NWrOJIZym7SklWApVz0QYBxtHj/te1hhpj8m8D/b3M3YywXrBTXPkNERYaGc
	O7i1jw==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4enun8gdan-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 08 Jun 2026 11:40:06 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-517865e6219so9132991cf.0
        for <devicetree@vger.kernel.org>; Mon, 08 Jun 2026 04:40:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1780918806; x=1781523606; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=sIgJupkYtH4h1zJNhRGssxohoVOM6fBQci0ibj/UCEA=;
        b=ReeyV7HROYkzS6hrgxLWkdm+DCtp6aPURZgruriOFlNZbBXY1iIWdMxho4h8zmQDTE
         Lt/FOwuSidJIzwu++obZyBlWE8QaC97ia0cwO6zztCw7Ee4RhI3ceamzQTNRkAb5y7x/
         16X2Uzzr0GKLurLMPxP59k3WFCatvxn7h8OpxLv7IWg8/AO5QPkYBilHfXq1R8UHbOab
         2L6NjHHby+AbubkijemP7YqygC3tlPEUqcQZckwhqdjqwMVTmjEcMkF6suLpBRlyy9WY
         BkzG+NXbp2lT1tpWkZCOX7vDAig/e4kLDk/vcIpjSQd8P4QuQP/QDTRn64rvcYO5nsf6
         k5ZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780918806; x=1781523606;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=sIgJupkYtH4h1zJNhRGssxohoVOM6fBQci0ibj/UCEA=;
        b=PcE0mOW71gFUxeyyAPqZPSDOr6xex6brYOkj/jTJCGsAkE8D/saP980AsQOsl8hiGd
         c/dTHCS53XSdV9BtoI/reiQxu48t2SnHfNydZNCzJ63E/WBxvoCedVcRb4GAPs3pt+5v
         gMKr/gmvkaJwl+MuMUgLEg6ehvRnwF/D5JQMsq1eMdu5kLo+6N203GqrxwwzzyRdT8F+
         xjRK9XcHOPd6lD8XsNYUfxR8xd1kaZWowfpgjiHC88XLTHWnUHKooNPGEoNXIS1X/1cq
         OvT+TaKadXNqPUWlchw2eO26+fdUylAbXJg4GoH/fgQs5diwKxEBDr4dgZbGk5uzXFwI
         s9wg==
X-Forwarded-Encrypted: i=1; AFNElJ+MY4QnroJhdCWKNAeBVK8UXU4dYEyB66PT5LDBwfgx1UJ8353rRnq7Vmnl2ziNGLCb/ctxCHpSDW7g@vger.kernel.org
X-Gm-Message-State: AOJu0YyaTS1K16OnzXh6u7iZtvJGBEL8AIc5TR5f1PmPmmhEi2RfkRbr
	AsfUztoPxkBGw3G56WY3WpEFqju7mljnLJ7cGbd1aWOc8qb0hh32RXkChB4A8lhWfehVbMwAHKp
	UusmCgq3891gtefoGk+mg2reQYou87Q45AnQCP64tWL9HEh9OhTM3TGisOwzfEyR/LNl/5LOt
X-Gm-Gg: Acq92OFXQv/iKvll+/M6KXxWqnJs0P2mx3Rxmf4kD4rhxmPQtV2eR5hZxVnlBVv0Rig
	sxScHhBrnJsdrmPaW8I+tiwxORs+/VkJgXetpRk29NVJ6/Q2pPX+IYUvvUVkIhHmqou/nV0IhHb
	FVJdNTyckP/kTjKNkW5iOKTAl05wVTO6poRS9eD+5xepBpvPqP3YksG03KPOoi0+SFl+6pMTxQ/
	5FrHZzs0NBbPceC7NrtnKSt/vV1uvLDpR6recm2P7uwR4y3+76mWYL6NoL0VpAdDsB/zU4WLW6o
	JTNGx8FZD9N6+IL2ohS+zEd+EaBc1vJF47wjCfe/imwZDq2d7FK+O83sCxj/E/a6hYRl6Cbo+QL
	AMuJGN3EFP3ygyk8kFUIChcTzGPdG+BH9XEJ8JXEvnCT4cIWFCv09UEcc
X-Received: by 2002:a05:622a:11c3:b0:517:6162:daf5 with SMTP id d75a77b69052e-51795c1a37emr115237131cf.3.1780918805803;
        Mon, 08 Jun 2026 04:40:05 -0700 (PDT)
X-Received: by 2002:a05:622a:11c3:b0:517:6162:daf5 with SMTP id d75a77b69052e-51795c1a37emr115236751cf.3.1780918805216;
        Mon, 08 Jun 2026 04:40:05 -0700 (PDT)
Received: from [192.168.120.170] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-bf051770994sm869891566b.13.2026.06.08.04.40.03
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 08 Jun 2026 04:40:04 -0700 (PDT)
Message-ID: <2fff4ddf-ea2e-48da-8a7e-e58075597b00@oss.qualcomm.com>
Date: Mon, 8 Jun 2026 13:40:02 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RFC] arm64: dts: qcom: hamoa: Drop cluster_cl5 idle state
 from CPU clusters
To: Marc Zyngier <maz@kernel.org>, jens.glathe@oldschoolsolutions.biz
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Steev Klimaszewski <threeway@gmail.com>, Icecream95 <ixn@disroot.org>
References: <20260604-dc_zva_mitigation-v1-1-d1148c1c0259@oldschoolsolutions.biz>
 <87bjdp9znw.wl-maz@kernel.org>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <87bjdp9znw.wl-maz@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjA4MDExMCBTYWx0ZWRfX1QsrJ64RtSdF
 b3VRY3qNckfmTA7XhlqCdnm+St+Pd1hN5Pxcp0MtXbgOkSB7EQ2NFCLXGGF86gJsM8807biVT6m
 zUEO7aQ1UpPJ53EaK4gyXuE4aQKkGhdbhAYanPyGnlmxh5PJiP8Uc5cDBt2hngfC2iCo0o6oy+F
 DrVAl+tuKzApyYkNLEukGiCN3tyVlAZ9PjNbs0Z1U5thxyB+1uNUjggQfVT/rsvnoPg7ICWA3kU
 Q/Anjxpd2aP8n2cXJ5eRiJCuq7zgA0ofSVXq1uiYb0m6r/l2Ez+cLgKX8bFj3OicGOdQxBWtahM
 L40N+kFnd92B4wgiBebdaUBa8B5lUcFYMYneenp1mH3Rj5AJKxQ7Cwy+SFo0Rh1O2n5HBtZFnWX
 9KOBpa2Bb0bvdmEzcZAog9LAe2BqthkG99tS/U3mDb9NoInB4ZLYQco68SrM1PM2mPh9DtXhL4r
 FaG2nnt+iRGrr4vuelQ==
X-Proofpoint-ORIG-GUID: KN1WAMQywNxrWMDiPhQq0IzkBLlrUq64
X-Proofpoint-GUID: KN1WAMQywNxrWMDiPhQq0IzkBLlrUq64
X-Authority-Analysis: v=2.4 cv=Z7rc2nRA c=1 sm=1 tr=0 ts=6a26aa16 cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=2uZjxnYOmBivvt3MPt8A:9 a=QEXdDO2ut3YA:10 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-08_03,2026-06-05_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 spamscore=0 bulkscore=0 suspectscore=0 adultscore=0
 clxscore=1015 impostorscore=0 lowpriorityscore=0 phishscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605210000 definitions=main-2606080110

On 6/5/26 10:09 AM, Marc Zyngier wrote:
> Hi Jens,
> 
> Thanks for sending this.

[...]

> It may be worth adding a comment somewhere in the DTS file, as
> cluster_cl5 is not referenced anymore.
> 
> Ideally we'd simply mark cluster-sleep-1 with 'status = "disabled"',
> but I'm not sure Linux (and other OSs that consume this) actively
> parse this property.
> 
> Overall, I'd like clarity from the vendor on what can be done to
> better mitigate issues like this. So far, we have been randomly
> disabling features and CPU capabilities each and every time we find
> something broken on these machines, and the list is getting long.
> 
> I don't think such course of action is sustainable, and maybe we
> should simply consider marking the full X1 platform as BROKEN so that
> people know what to expect.

Many "Linux-facing" people have been OoO and/or attending various
conferences and an internal sprint for the past 2-3 weeks in a row,
so there weren't a lot of eyes on this.. We're looking into it now.

Konrad
