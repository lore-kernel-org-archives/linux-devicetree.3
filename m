Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3354E38C43D
	for <devicetree@vger.kernel.org>; Tue, 14 Apr 2026 08:08:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776154088; cv=none; b=McHqydGAPYow4Tv8xhMbaaVykmUKWwwmnduQ7lOcqFHqfo8PW3Ui8hSMgVXWubUvg++Y4LYTib+AxMTO8gbqVjbATJwX/DIFxr3OIDZElc0uCf3+zF6HrjgT/NQFRkgoFVovbGmGh9mh3d87wpvG0a5Ur38E2WFTXdxC5uGQfO8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776154088; c=relaxed/simple;
	bh=+na2rETZY3PhgUgP2f4aP6B+WxxI3R8eOMpOE0i2NN8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=VEklaaRkr6r/gT0BYM6lwdwnTu3s+fIyDFuxlyqzJ/euNiZo/QWEPSHRBkdlZeAMLMlO0/UeA3jH+Sf3dRlP/fZqJlH5wtAEXiF+0hNtD/AHojfgfzNO/BpeB28QinUZZqM9fxj7XFNWYAS9wMoeagr6CSbs+ViZywoH8kYXC1E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=TySy27fE; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=X+Pov0nc; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="TySy27fE";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="X+Pov0nc"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63E6p3892633571
	for <devicetree@vger.kernel.org>; Tue, 14 Apr 2026 08:08:06 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Or8e6KVvqN5oLm2ttfPCRCtO9ggnyvfWSveduUn6uCQ=; b=TySy27fEX0oJEA5P
	1yGIg6jqDVxYj4yWvcPAjAAr5FFMxkrguuexME0GvhJvCGbNf6AXcjVqu8KaFEZb
	CD0QRpJyokuZcneIS91Azo0VZu3+vDbuxzYzzSpbb5jWB2GNwnS9DTqTdiNt88lW
	Wcc0gODe3myzJV2yDkcU/rI0WAlA2ZUtVsf7DF8DqMD8+4wVjmOg+0CFsKLtWEmZ
	nekXuDSK/Eae6NGcy5RxOCgDpkBzeQD7Bfryuwb7Q6W5oGcVGoHNZtuwTjvDUPBw
	4cTPoTU1kRDm9iFo9/zEmhyzCdh0chPd9hnpJ2GGWC6f5fxQuIM/KrNbndIVHxTI
	KQgTDQ==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dh86c9qjt-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 14 Apr 2026 08:08:06 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-8cfe29579d5so106106785a.3
        for <devicetree@vger.kernel.org>; Tue, 14 Apr 2026 01:08:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1776154085; x=1776758885; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Or8e6KVvqN5oLm2ttfPCRCtO9ggnyvfWSveduUn6uCQ=;
        b=X+Pov0ncPtujRuy5DaUAzgLNC3lVEg07QZTt/fqGUKHKhLlZNJn9PKGt/nFQWz7Dmo
         oz448hK6QlAY/9ND3g9UClZvTeJw6/wW0iwLGg88KGT5tlgFbo9D/SSP6qoxv0HSdIjD
         0u4nz/AKBQ0VrrKlCC+9XHxzyx5LV+g7UQVzUXCB0um6QC/1Zg0yh5eraXVTTok7s8WH
         Y5U4AUkzgwlzWvaOxnkoIMcIU6Jb3eXhnrkJiwLyDOdz2GhZ3GLPhRYolXoEcZRsuKDT
         bFrnHHHVbGaRehWGwCeAVqV0yNRyzdnkMzwpsQ8fjysZPCcfqrNEp7Jr+BAnj2Z/+4J0
         m0Vw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776154085; x=1776758885;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Or8e6KVvqN5oLm2ttfPCRCtO9ggnyvfWSveduUn6uCQ=;
        b=kwY0TmdrZ8OoD4d9KQAnVUUYI6CYeJi8+E5OGID2C5qAWomnDURO6dRLllDxGoIhBS
         lFDOk8R7gMEMLLfzT59c2nZnSIBkLMFG2+ZjBKQ3rIGH70/PNmHlWoGZqs8FKwh9sDMW
         TDTZMSwRTjgT21qGCECQ5LYuGmHa6L4kv9yWdHL0vjXZVAYeSYbfIEAsIK54LJvoHghY
         MqEcSWWRL1N4wSFfhyThLDmK4jeNXrYArfcna1AGitGlHwmnXuCLxGjVEvxWpBWJ+Dev
         ZwrsCV/X6sxZjAcnPC8KtTft11NezFgSnnf4OZ9I3BHbrje7R7FIvA6Vk2D7JvMsNXot
         34Ww==
X-Forwarded-Encrypted: i=1; AFNElJ9LQEGbl1ew0WulcCVPaW37soPjoiWUuNkKwaa00USRao0EQ6kFIWYnNoCRj6CHVlIHlq/qwyrDTOSD@vger.kernel.org
X-Gm-Message-State: AOJu0YwlzgBrauHgRwnV1mX2IXmWig2wguSK6v0Ojd59BYh843Vpv1k8
	VCyCUcbTR1YhxgyuuzQpzscc8Sqc/+gxwS2MBxziHs6p8rIQPs0as+y5zeMXsYtdUujjPrZT95u
	YclbCj/IoSuZNcNZ9T8HsAc1FGPiZR8eHYU4naXtiHIyUOJ8nXj+ciBPwzOVCXxz+
X-Gm-Gg: AeBDiev3ALYFscI9MRqSVQ3EXXwtyEK5gnFGQ5ocWRD/3QbZjU+SV/VskIXGiPRx1RX
	9IRWu6EIEGvz8f99uYS/3dC0T04eK0z5wAL17jBLjtGS0sCWkjIzFEglijMWKhI7+gu8g0bKAab
	EVtjd3TM7BX1Y9YyYd40+WTe2Jr+arSjBveiltWBXh+iajWWnmhwzayEbYWIGCD5FebEUL1Ckkn
	/trIjE1fGdRK9AZuMG9Xu2iiEl64cQZ4RgpYeRaj3vMzA0G77McKzCu7FW6JHswf7gs4ifCChwb
	+C4LlYunV1wj6GxubvoQVH7/TlaTvPHiPTLCibI20X5xXFD2dkp2+mlDjapbHc52OS5TkX4xKV6
	Tm/0bgp20jgvIM3KwrBm98/W7rpeUbv2V0SoVBskOywOVzLIlLrJXICW7RAGueIyBBya3QqcedT
	BsDtCroE5Lh+BnRQ==
X-Received: by 2002:a05:620a:410a:b0:8cf:d289:d0f3 with SMTP id af79cd13be357-8ddeb1cfaf4mr1620678385a.4.1776154085214;
        Tue, 14 Apr 2026 01:08:05 -0700 (PDT)
X-Received: by 2002:a05:620a:410a:b0:8cf:d289:d0f3 with SMTP id af79cd13be357-8ddeb1cfaf4mr1620675885a.4.1776154084770;
        Tue, 14 Apr 2026 01:08:04 -0700 (PDT)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-670eb258a99sm1899153a12.15.2026.04.14.01.08.01
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 14 Apr 2026 01:08:04 -0700 (PDT)
Message-ID: <677f1d1d-a1fe-42ec-9e82-c9e504873c98@oss.qualcomm.com>
Date: Tue, 14 Apr 2026 10:08:00 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 04/10] clk: qcom: clk-rpm: add msm8960 compatible
To: linux@smankusors.com, Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd
 <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, Lee Jones <lee@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: Krzysztof Kozlowski <krzk@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, phone-devel@vger.kernel.org,
        Rudraksha Gupta <guptarud@gmail.com>
References: <20260414-msm8960-wifi-v1-0-007fda9d6134@smankusors.com>
 <20260414-msm8960-wifi-v1-4-007fda9d6134@smankusors.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260414-msm8960-wifi-v1-4-007fda9d6134@smankusors.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: gtAFzbSAMkRRSa3CbYKCPKEQKZ7YLONw
X-Authority-Analysis: v=2.4 cv=RoH16imK c=1 sm=1 tr=0 ts=69ddf5e6 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=wxLWbCv9AAAA:8 a=pGLkceISAAAA:8 a=5PoCL-xiRuW4qANWJgcA:9 a=QEXdDO2ut3YA:10
 a=IoWCM6iH3mJn3m4BftBB:22 a=QJY96suAAestDpCc5Gi9:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDE0MDA3NSBTYWx0ZWRfX/+Kw+nRAKYcm
 vzZ9EOF9U+UPBcxg+iayGUAbK1oVtIw6LJxUci4A8TEZZoaKoVJmRMa5ED8luV98T8R3w6VNcw8
 kai1hPLgfCKsKQmoFIjlvAhSunVx7ImJtSLrdNr5JV8pc+OKvKOsLXnm03sKpimlnmNcp3C7xP9
 TeKBijLj0nqZZHAiPYD1Ij4p5xKCVKLHRbY76fh3+5HVRNGAi1/zGsVZwk7LA/DMow7myBGYDdm
 ldWMq2kh25TjO1Or1c5ZAh6fARDR2acRKwEVjWQK3El/YV6p6RnwUQb/6EpFRIgFtTmujpjVq3y
 k+Ax69BFqfrVNEJZj5IHF2W8XqnZ/9cWns2FkNGFurxGYYGhT7k9KWS7RxEUchpyn7j6dhpLz/+
 fs4iPrW/vGMocOFfW1prSe4xkNCQ8K3DDLvMjcjBcWnhTnlu3RjD0F/rSqKZb0pYttzP4k+t8jV
 RDJd57jRwjnyJwh3rwg==
X-Proofpoint-GUID: gtAFzbSAMkRRSa3CbYKCPKEQKZ7YLONw
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-14_02,2026-04-13_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 malwarescore=0 spamscore=0 priorityscore=1501 impostorscore=0
 bulkscore=0 phishscore=0 suspectscore=0 adultscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604070000 definitions=main-2604140075

On 4/13/26 8:55 PM, Antony Kurniawan Soemardi via B4 Relay wrote:
> From: Antony Kurniawan Soemardi <linux@smankusors.com>
> 
> Add support for the "qcom,rpmcc-msm8960" compatible string to the
> RPM clock driver.
> 
> msm8960 uses the same RPM clock descriptions as apq8064, so reuse
> rpm_clk_apq8064 for this compatible.
> 
> Tested-by: Rudraksha Gupta <guptarud@gmail.com>
> Signed-off-by: Antony Kurniawan Soemardi <linux@smankusors.com>
> ---

This suggests a fallback compatible could be fitting

Konrad
