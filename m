Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 126E843933B
	for <devicetree@vger.kernel.org>; Wed,  8 Jul 2026 15:13:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783523627; cv=none; b=UOrNV6bNpyruC4To1t9niBqPkp7745ZDEZMYAzNQMi+qtE0IeuOBm06o+MGGm4GuiO8KlsrhTDf8iXbbbjinsIerNk8ZtnNDmvhg0ERYe5RaFA+6T1jOctS74J1T/KMNzn67WTdz3tQngu04eQvC2kwSxEE5U4GxkU35rriYucY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783523627; c=relaxed/simple;
	bh=bo5ra4Hpc8FFQaXGnBIBldaa3XB5/oPRylywI2sJ2kY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=WpQSMaAcz3eAjjSKn6gkZdWmLteLcrF/YdpNbr/JLxwgeIoNJFKj7indG/47bSonjHuUgolbfKp+yLdds/KLyLSHac866jloZe8rAt6ydxYQkgRw2dMU5mAfMr1dlcG3pt7ViHohGqgsgWqK3pySz0FVUxEYF87g2nQW3gI0Hxg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=YUXT7sfr; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Mt4v2WER; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="YUXT7sfr";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Mt4v2WER"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 668Er2Hq3100839
	for <devicetree@vger.kernel.org>; Wed, 8 Jul 2026 15:13:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ejAQoKDDCd8xD1bhBnlWfyS1/qCW0J7Woy3f1QpgxZM=; b=YUXT7sfrnD63qrpj
	a64pfvfel0gP+7c095Tcaizxk0LhMiIVA0b8/2rF3zDjsSFnipZs0MyAw2xP05oZ
	bCkL/C2305Bx/ooaUOeXw2DxkqB4je5lhJLL8MKBZOd8ZgefZs9xqE5TY9vyYBjS
	qTQiOuXd5BWr7aQi9W5ptEwbQHyo3MCUapIVM+AR0ASo+pCxXykRvfn8v6iMxs2y
	MEf63WvwOFBXvDHuYr7wbdjGo5rJSFPYFRspm71g3TSQOvcw0s8eKni1qCcMmq6o
	QY5zlD13JxtmGncKjDdbpGPM8yU35TmARIOO+FjsAUfOZYJFmDlW/eUxXkO3ShqH
	+PDqvQ==
Received: from mail-pg1-f197.google.com (mail-pg1-f197.google.com [209.85.215.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f9rq302tf-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 08 Jul 2026 15:13:44 +0000 (GMT)
Received: by mail-pg1-f197.google.com with SMTP id 41be03b00d2f7-c894391f000so1799598a12.1
        for <devicetree@vger.kernel.org>; Wed, 08 Jul 2026 08:13:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783523624; x=1784128424; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ejAQoKDDCd8xD1bhBnlWfyS1/qCW0J7Woy3f1QpgxZM=;
        b=Mt4v2WERH90+hjxjg+oWxZBw2ar/iNb9bvqoUhWZDMLBquM2ebU4LYeuAYvA+MMerz
         Kz3OklU9Hbbj2wypigqGTiMIZUppIP+FZSe0D+pJeiUjG568Obfdpb0Ow+4c6WWwILZ9
         84FIxnqiXhIqVlc2QfBwjFBN6CLbuB2eINdb1ILWjcxvUItxZnebqbwMf3KEvyt0aUUg
         l4/nhoRyEoVG1MJeTGbOIVztkPhENhLCdL9Qtdq/66FcUJYNRo4TnzeaqBOEqKHH6UND
         QYE2bPOb/s0XrDsTTvG0LNpb/jdlbCp6viMSg5GkqMQ+txJyrMady+mSCDnqvryFYTqs
         qn7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783523624; x=1784128424;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ejAQoKDDCd8xD1bhBnlWfyS1/qCW0J7Woy3f1QpgxZM=;
        b=J57aKZUEn8WWByCGinsWK9R+a9Q3dXzOZM8HjlvY0op4ZIIuAW+h2MrTqcGWqBk1a6
         55t1Or/UXzRsVghjm/eFXUnz0dYx0rjHAWS7gGBbzRM5gsH7Y/Q+jCdxfueBfXQz25ml
         x0ZFQPxxvp/dyRzgrwy+pRjgacLOPGbh3cMgbaMcI7iE8PgGZf8/4yvz2ewwQpIGVvLR
         uKO2HXaVKkqa3o4fCmZcCWYs9L1wvYEKGS0ycWqSD6vgkFM2FXo0Ge2vRLnWuSgfglFG
         8tv9GTfLB7evyXXPjoj6/PXbL9HTy07Fz0YgC13X5VIpHwrax6upO0kq1+0ZodiJr02Y
         wObA==
X-Forwarded-Encrypted: i=1; AHgh+RpO/0M94DJqXWgk4YICnEvcl6EBT76AWCTrUBp5N+5Xw5ZZu3TUC30BWJyhqByMfeYONMjW6jRu3fC6@vger.kernel.org
X-Gm-Message-State: AOJu0Yx21cBRf9zNKE5szf19UP/OJxqyjTqEU4RJZJ4hNi14nuCo2086
	BlnlTGzPVW9pVivWBbHBybcY/P37Fq3y2iIl05FnlMDBVcGnpAh8U3ioqAguO5bbbHN69QGhIf+
	KRdN9jdLLSljFJVnMUti1DVAfbYCU4159vvxOONnJII7CQIfqZQ+YrLtHnVoMla50
X-Gm-Gg: AfdE7cmzLYGZsMQwDzsXo0PArbanT4vuf6JCtEcpW9dwGkXoz+z33RWfxBz6QCPHLL0
	YSVaUuDtstSWKDsK3X7/YrSbZHpJPh+IuzlByMLtSuDaBGlZYepiuQ/TMISDYz9AByJlSjW34ns
	0W+JC15mmx7cgqpJUmehcbyefTD5kamm++WVkrYQjOxDzW3g7zmUH0zT6qL/kUkIN9RjShYx9gI
	BhF5kSz22TIrSs4nGw/ZFde9U8JvhxZBUmVDwKqaSKcZ7U7AcSAySxkIpfEiehnyE1gByzUJUBw
	turqq3EgPF8MrMJU70YRXnzI0RBlXTfCLTjE3LvMB9eUwza7az0VOTu650W1yN0qiJ56I1KPO1G
	wtS8wV+WRw/zYqj9nJhPvjnEGmKV1LgjlSY3KlsMnnR1uH/r2jYHaAtAZy15TUuWuPhCM3g2l9w
	BOrg==
X-Received: by 2002:a05:6a20:3d0c:b0:3bf:b1d3:393e with SMTP id adf61e73a8af0-3c0bcf16376mr3619049637.2.1783523624044;
        Wed, 08 Jul 2026 08:13:44 -0700 (PDT)
X-Received: by 2002:a05:6a20:3d0c:b0:3bf:b1d3:393e with SMTP id adf61e73a8af0-3c0bcf16376mr3619010637.2.1783523623630;
        Wed, 08 Jul 2026 08:13:43 -0700 (PDT)
Received: from ?IPV6:2409:4091:c00d:4a15:d9c4:b604:397e:f06e? ([2409:4091:c00d:4a15:d9c4:b604:397e:f06e])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3119c2a7bb5sm1518130eec.25.2026.07.08.08.13.40
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 08 Jul 2026 08:13:43 -0700 (PDT)
Message-ID: <fb87991e-ea26-4ea8-b037-958b06e4f9f4@oss.qualcomm.com>
Date: Wed, 8 Jul 2026 20:43:37 +0530
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/3] dt-bindings: soc: qcom: stats: Add compatible for
 Shikra
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Maulik Shah <quic_mkshah@quicinc.com>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260703-shikra_stats-v1-0-0aa0ec1fa83e@oss.qualcomm.com>
 <20260703-shikra_stats-v1-1-0aa0ec1fa83e@oss.qualcomm.com>
 <c22aaeac-1b9d-46a1-8fc2-ba48422736d5@oss.qualcomm.com>
Content-Language: en-US
From: Sneh Mankad <sneh.mankad@oss.qualcomm.com>
In-Reply-To: <c22aaeac-1b9d-46a1-8fc2-ba48422736d5@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: 38iYBT2-NRSg4cxbxetNcG3LQ9oUJd9T
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA4MDE1MCBTYWx0ZWRfX2v/FLdiauXIz
 /8rXlWnH3WA9JMRQEY0m2f39qwyO8Yp9Fr2669imY2CN6Y2Rio8JQ1O9mIUWsmZ3Tsab00JRoej
 90yARDZip44xqhDlo4RQD8vLcHXYy572QPPekI8ni6kuzrvWmcOdyPLM4jFpeSkDnD91rh1aLV3
 1iZ4mvVx4aWuUY/j94nMzM+TFGdwh7jxLWf00vXCGYpagwwaEVNM+e3GsjUy6nvRPu1fnAkSsQK
 wYuZml5Vay1gCMonKqzBqIjj7/EcucZ+QzclQOI9HNOv3NbkWfAapDgBcQfTSXVsIIn2ElmTawn
 aB0CStSa4ptppo/zvb69r+JT1xh1qFh0SPhimrh7zNpWGYVZ6Lf+7H054OZru8d1FAQY8AHQyCc
 xDE0ZYLVrHgjY/BIkJSGgxzjlWp5Js1ND1VX5h4jif9qDTdKM7sTr0U2+qSPedczX+AVxaaLE0Q
 eDg8wQ3zvtVp0iUVvIQ==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA4MDE1MCBTYWx0ZWRfX2XorQtX2XkfU
 CUHjyQyxgoGU0bqcAgSP34KAPpH2mfF/4z9YoMZHl0o6Sv2M9OeabfWRWQhQN+6Aqp0GCZ9iXF8
 gBI5N1apwfnWIhJyrBz4NveV0naJJCE=
X-Authority-Analysis: v=2.4 cv=PYPPQChd c=1 sm=1 tr=0 ts=6a4e6928 cx=c_pps
 a=rz3CxIlbcmazkYymdCej/Q==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22 a=wbZS0JleAGqbw7oGhZkA:9
 a=QEXdDO2ut3YA:10 a=bFCP_H2QrGi7Okbo017w:22
X-Proofpoint-GUID: 38iYBT2-NRSg4cxbxetNcG3LQ9oUJd9T
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-08_02,2026-07-08_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 phishscore=0 lowpriorityscore=0 impostorscore=0
 malwarescore=0 adultscore=0 clxscore=1015 bulkscore=0 spamscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607080150



On 06-Jul-26 3:15 PM, Konrad Dybcio wrote:
> On 7/3/26 1:13 PM, Sneh Mankad wrote:
>> Document the compatible for Shikra.
> 
> Please include some of the information you mentioned in the cover
> letter, since this isn't just yet another boilerplate compatible

Sure, will add the information in cover letter in v2.

Thanks,
Sneh

