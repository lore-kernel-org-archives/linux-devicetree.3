Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3A751332EC8
	for <devicetree@vger.kernel.org>; Wed, 15 Apr 2026 09:18:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776244711; cv=none; b=Xm96CqhSW9BYHM7oA4ueD9zmIknDy6tm/HtRj3urooPAF2VvUL0uicO+uh23pTgZmKr3J2v+pkY7lLcVNjFbUrvlp1+9vDmPiTJIF54enEVWi1h32u6bSwgy2bgKECsORqh+uoEFGzDjEgRXW3A7AqOjv27XU++fZ9VHEIJRbWY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776244711; c=relaxed/simple;
	bh=JNerf3URHKNFdqGqNd9J1Lav5rcxIB9GNWFOcsXCZq4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=SbXiM30xWO+6F2evK74Z7dfUT85f3m5SmyOCW7h1Xmiq3z1N/EM/6IfapsG8L+WzUmUGTO77kAyIUELTSD4ZLRrm2AdWZeeoabbrFjLANLCX5oTJjsklfJDTkD+938xNACKBtpnrchQtKO60x14t+nWY3C4r3k9WekB72f78CeY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=P554oZ/T; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=J7GIuLSm; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="P554oZ/T";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="J7GIuLSm"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63F4EtaG3059042
	for <devicetree@vger.kernel.org>; Wed, 15 Apr 2026 09:18:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	pPIrCVGV4RXinbcPuALJen8mM2Fqb6EIb1Pv2wz/5ew=; b=P554oZ/TjMjSyb93
	E/eV6pKJak2MNxsqQV1U/W2O5V+qANgI/tucV2EISndeZKE+lRne+l6RnMOFxTFH
	1kdfvAHMjI9Vo8G2NLoDbz7BWJhysvzLPIgxcN4pDHOsxqC+rJ3wXBLlZpwHgCJk
	q9rDzBi22cb91qEzZ1rRHtN6NYYIuy209hdntvagqR6Y+JQYD4dq54fF0P1/4qyC
	p5RnrmPN1jRr8XtVLxEOB196Bdc0pDDpDConpXfgvi2p1I166Cgdufb3jSEEAzER
	QXp+avDhJNetL4MLZ9GkNWlVngszBl5Rez8t0Nld9O8UW6nJurIlk5qEQxRhPN0l
	EbG26A==
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com [209.85.219.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dhteptj0r-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 15 Apr 2026 09:18:28 +0000 (GMT)
Received: by mail-qv1-f71.google.com with SMTP id 6a1803df08f44-8aca2eeac85so14285776d6.3
        for <devicetree@vger.kernel.org>; Wed, 15 Apr 2026 02:18:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1776244707; x=1776849507; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=pPIrCVGV4RXinbcPuALJen8mM2Fqb6EIb1Pv2wz/5ew=;
        b=J7GIuLSmRmTv4CVc1S0ahAFa0B4whBgHONDeehJmLeQ8YkLE+gxPpMDTFwczQ2jV8g
         bmq8dgfMu9vqSmMxt8A4N0ocj/FzA8P4TaW+k34T3JlIKSHCAxt+16qQvYeaZ4lvdnUS
         eMXNOKUO6grUNfLk7vJL9hslM3MKDK2Nkd0QxRYa23aUbcQ9CLjZOeBY+aAO30AiDOJ6
         OJLKml7PEecDSoUAvKPW3VjzTUTkFL7t/t0DAIgJlHyce24gaYvwTT/4NkbbDBbjMMjD
         /CMWAs64a5XaN94azCGpNLeYcyI1ug6T6BWO7i8swprsXb7uJUpugSUYFcG0vqFW9qBU
         ljyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776244707; x=1776849507;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=pPIrCVGV4RXinbcPuALJen8mM2Fqb6EIb1Pv2wz/5ew=;
        b=ifYpTsdbd37GbreiwM8L3uaI9ypABgf/6vOcVzsCEb6YRjgLUsZmOphLnANbp/F8CB
         Lhun+KlqylAJSKZsBhhvtRGOkMHHBTiotsVgnFao/QfD6Knxr1+nloKUp2zruttPSPVH
         hpk18ALlZWAq0cXC3r0bYFU9F6bSUr391tMvB9jIMXe2qyvJQa6sPdzRZTovUdqv6igT
         1X56ONU1HJHQSfL/++Qory6BNXIMOT7l5MlU0Z48ecf8ww+I7Smg1YN5BKpGwMieBVxl
         NQJUgn0g90LExl+7cB7U4HkOGQuwCu3VQ+bDShCqcLzKlYj2ACZBta44OHbeEX6gt9gY
         jwLg==
X-Forwarded-Encrypted: i=1; AFNElJ8t1Btue/GNcquVS2Oj0gUZ4knXmN1BI3q7HPs9P35H2kIBYxWXhXvypWssYmY7Vps+pMILky15yJRl@vger.kernel.org
X-Gm-Message-State: AOJu0YzBs2fB+zLo/CpFbhsbnsFShkjlwJyUzwtvFLKYmq/7Ua0v6k3O
	1t9/7uJ37E1fvZlSm3FB1rUIujGcw23ryplzh7jnzhaZ75YH4eQusTotHM7yJtG9rEOrigJvBmV
	7zKKS3rHXkMauhbx5xh6j4anGsfc80QcEQ6g7YnOafrBiLdG+WYOLm9IGtRod2NUidY3VGnoN
X-Gm-Gg: AeBDiesk0EHJKf0xaQ2LGejY2Dj6zNzssKPPx13HPHmqpiaz+Hz7tzNCEGF1BhWOVbr
	Fmn4BRINzwg5TGOYqsz+l1uLZMmVt5mKdqx7d4f9xvFti//k9CE5Qmzowt3h9uuYBmA/tOizvG9
	xbFJTM08h6FD6b5SPr/FiLeD3B6cT0jKaCk38zXzpKyRdZQmJ1mqzciTZp7W1rVTFBAgWRBbgxQ
	IHkS4YQ6os2PwpQBg2rL8bFJYHnUu2rbtgn6fp3IRYkKYWkrCgxzCT/y1WujCLCJh7lwaXZwu7g
	Utkeanpmiqn+3xXJKfghsuZviGj/r3/DJYVg0mAHobZXmerNiCE5kBbRJ8TZjOY4+cAnOMqKfxq
	wL/i3ac3WTzAbceG4AeMEBuBH0c1rI1wV1ln59BMRuYAyocSwwUtEdBKQhLs2qnumx1/Q1HwDJZ
	c3nJVlwp48AZAWfw==
X-Received: by 2002:ac8:5f95:0:b0:509:2c6e:f6e0 with SMTP id d75a77b69052e-50e1a7bd8admr14840971cf.8.1776244707370;
        Wed, 15 Apr 2026 02:18:27 -0700 (PDT)
X-Received: by 2002:ac8:5f95:0:b0:509:2c6e:f6e0 with SMTP id d75a77b69052e-50e1a7bd8admr14840681cf.8.1776244706931;
        Wed, 15 Apr 2026 02:18:26 -0700 (PDT)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ba177fc1a3csm34573866b.58.2026.04.15.02.18.24
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 15 Apr 2026 02:18:26 -0700 (PDT)
Message-ID: <d2f40335-1ac7-44e7-9f94-d0f012e6a350@oss.qualcomm.com>
Date: Wed, 15 Apr 2026 11:18:23 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] arm64: dts: qcom: glymur: Mark USB SS1 and SS2 as
 role-switch capable
To: Abel Vesa <abel.vesa@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Wesley Cheng <wesley.cheng@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260415-dts-qcom-glymur-usb-role-switch-fix-v1-0-409e1a257f1f@oss.qualcomm.com>
 <20260415-dts-qcom-glymur-usb-role-switch-fix-v1-1-409e1a257f1f@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260415-dts-qcom-glymur-usb-role-switch-fix-v1-1-409e1a257f1f@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: pIBJXMnPikNuczCnJ7NqeQAcrJqdVkR7
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDE1MDA4NCBTYWx0ZWRfX7I8fMmEP6nBz
 SU5AOtfYBhg9+g9HsviA01IRidlaogeGX4E2K3H4qghBoAouKEixNt8t89cor4WH3DLLlHbUPhT
 WVdHLiVU1AYRYY2VYxMQig4yc2XTY1uCzQdaCihqDc1Gp0IgBscy1EDsSyGDDhgrF+lo2hxFlHM
 ichkOYv0cjB3jU/i5SQdQpzeSJV4fI9eqKUhu/LFmQm/h/Qu2qM2rBM8K8BRwwRUg8CdgZYTnuE
 RksgB63R0yYCmTzcREKfKAtvZ06tHX04wjY+x/CqrrZ1lewby9D1BnW3vjpJhDMvtc2BdaWkDpO
 d5dUa9nGpQgdEPCRRmlqAKucwp6HXNCDky7dkUG/X7OswGWRL8He8zVuvsDz/iDrhQ3uRiUlg99
 4mOCldht0JWEKnva0SRrZ+joNRVh5jdb3ffS1hNypVqVFEoHLmN1NVQPcvNXOC3lE/56QqmNeUE
 X63fsRaGG16OujcCPtQ==
X-Authority-Analysis: v=2.4 cv=CoGPtH4D c=1 sm=1 tr=0 ts=69df57e4 cx=c_pps
 a=UgVkIMxJMSkC9lv97toC5g==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=zukAUv9Ucfy8tcaBEEEA:9 a=QEXdDO2ut3YA:10
 a=1HOtulTD9v-eNWfpl4qZ:22
X-Proofpoint-ORIG-GUID: pIBJXMnPikNuczCnJ7NqeQAcrJqdVkR7
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-14_04,2026-04-13_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 adultscore=0 priorityscore=1501 bulkscore=0 clxscore=1015
 malwarescore=0 spamscore=0 phishscore=0 suspectscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604070000 definitions=main-2604150084

On 4/15/26 9:52 AM, Abel Vesa wrote:
> Like USB SS0, the USB SS1 and SS2 controllers on Glymur also support
> USB role switching.
> 
> Describe this by adding the 'usb-role-switch' property to both controllers.
> 
> Fixes: 4eee57dd4df9 ("arm64: dts: qcom: glymur: Add USB related nodes")
> Signed-off-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
> ---

With the patches in this order, applying just this one will break UCSI,
see:

https://lore.kernel.org/linux-usb/8fabc049-7fdf-498a-a3ef-6f2570d510c8@oss.qualcomm.com/T/#u

(if you want to make the change in the dwc3 driver, feel free to,
otherwise it'll be somewhere on my infinite todolist)

Konrad
