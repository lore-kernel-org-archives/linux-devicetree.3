Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0242E33D511
	for <devicetree@vger.kernel.org>; Fri,  8 May 2026 23:54:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778284453; cv=none; b=NEvHt3InY9e9p7fpJqJEZnMyJ8MT0oMPIoT32aqXEPZ86QyVfq4v6BvvgExUk5gDGsJSfGZkrgf6AiC8DeMrculpsQJZbYsqiKiq5TErAJQhkZ0kG0qVSp4gN2slKPJgvwYSG1wVwrRcy1I5q2HKr6Aa76bK/Tgz64hrVqVu4jw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778284453; c=relaxed/simple;
	bh=M+irl09BB3lpaeKwpF9y+VIsDUUpMsVxXvjsUgdWUqk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Ia0J/I9mD7aTVBqBN+xki+/NE7fkdCdCy67+ugZ46kikop8avQEv6bKkzk4KZxj33TcZVWbEM02FW3CyHwqWR+Bql4tUIKNHd7w9F5/mIzI0aWTjxBRSq+2tgOwRFJBSaUY7zZDlQWcG6CAfHgXY4aTmzpegfgXYGI0W8G3PWPc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=lqAva3Jo; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=BFcOFUUv; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="lqAva3Jo";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="BFcOFUUv"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 648KDmAu853161
	for <devicetree@vger.kernel.org>; Fri, 8 May 2026 23:54:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=U/y3XlxsK17A/ooTr1YrUKH/
	737x87wh9dKRfPzZz/0=; b=lqAva3JoUFBU9P+C0Ml+j8gYnNhFiFc4GcfrBw+P
	1Br3PBFnhgd2J/28iJNuOVg3yzCWJ0yXdoEqmFwWo3vU6y0WUgUmJ5n2ybbYmqCa
	VzEcnExd7j7kcY4CVsobvZ8jD88fjcow8e1rydxfbRHrviHGHn4HATI9XUyLFUkX
	bLbFNs85gQa+70lp0VDf6axj8ajhYDgmLNz86OuN4zyTJ7k9CS9ZZQ5KSq1NpRej
	DUND+xAGgqWKUjBrw1yU6AwD02KR93lWUNyyA7Bih+wMDEMfvJtdifv7V9CB8Qes
	Ypz2qATIOGnilaWGipCM0WMu1RdONUd3kaoPgMQKTEeOFA==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e1fptjb1y-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Fri, 08 May 2026 23:54:10 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-50e67a4f642so57834531cf.0
        for <devicetree@vger.kernel.org>; Fri, 08 May 2026 16:54:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778284450; x=1778889250; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=U/y3XlxsK17A/ooTr1YrUKH/737x87wh9dKRfPzZz/0=;
        b=BFcOFUUvbCPN5A4umTLabOgFAG+TrOIkFYBzxv2O4PG5Vo7czHUlJlojXhvOfBkvyI
         xQ4IBJMxtZyZZlh8S3aXlLtnh4uB0KSxS2fr3St4L7V494FHSweLcx7iFUZ9hYuO+1WR
         aVkoduV1M+eH7ZIgaTYCH/LO5IT94a5xH9cBk17P6Dwt3z19wW2caCxEeS/zk5o+DsmN
         DI6kpMQlGNrhGllFe5oaUDodJXAT2Y3VXJyNGxjUK3zeum/jULp8SEKDobHfa5hJq1//
         A2xkObA7Hfb6VikZqZQLWRaETqCrOZVgq+A6XZ3/jkM4jcruuHuuWV61TtGvPWsTjcc9
         Is6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778284450; x=1778889250;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=U/y3XlxsK17A/ooTr1YrUKH/737x87wh9dKRfPzZz/0=;
        b=bqQxrgDEAI9TR/8yWnKNU6VX97fuOWLjooVE4B6AK5kbkTGirlBov5EtWwxh71Fuzg
         egZl71r88uRfgG/vjaaSblczYWwJ0/xfIlEau2i+1gx9kD5Dx4K8R8rOD4Abk5gE9dFf
         /WQZTzT3gZaMHhB+E5/W42e+LZQK/xzyu7K+KKxXL4Rcnpwaik2gb6UElSjTQVHaEk2M
         El82D/d+gz1JCeAo/YquaADLqDjbyUWjBG/Ar1MYW0wjYSj756gSX9baxMmsjV3iGWKP
         LJwaZLg1O3MWT/0yMR2RRmH9YCTGQna1lVHg+xAaUEtAHVhhbEiLeENGiSvnGAxgzwEQ
         rFzQ==
X-Forwarded-Encrypted: i=1; AFNElJ/94DXLI0gnssUlUC+mrMXsEs/AeK0yFRZ8VZYugc3oFqFJtN2rEBZp4P+cJARSE4A2y1ewGTIlROnR@vger.kernel.org
X-Gm-Message-State: AOJu0Yz3/gkv5bdVpneAurx5dVW8u5eeFHYA9QlU54M6Ijuz7EPPFoQA
	4vbjnyLyQh13iGjNLAq6L+PtIw/cWMy9vPYNQUcuEwfV3d/QUtRGyXXvbOMI/wB31dm04AihNE9
	Rwtrt/eLEifBXnMsNDA2fix9afn0lSxFwSHsCSrJH62KWRm01+QDXHROowjcmSsYU
X-Gm-Gg: AeBDiesDEal3BronRLBpOE9rZrLOiXdq5rYkAkBkYBdp1gC+MRE3qM4pQ9D0P7eQRzV
	HacDpwuFE/7oQxa2aS5EdCLRldKlMsOoXuqNWqdA0E0aI5479+UA+BMqSmS3Z7dv7ZUtrQzW9Qz
	eFhyeiNyzesdJwfpyM2Yb0heX2y1yirIvlCcVbDso/SW1CABxHvwWZI+4VujZTXchvjxYRSqzMM
	t6Ai+qFZzqymnajBJvu0QNJ82gM1BBJwJeempa2gIsZP3q+G1nlBmPsNPr3PJLG6MINbBOT+2jS
	e6CCxXcUle877MSqRCGqEKFLKVoCXJSXAgTU/kRqnQbGdlJbr5UVIp6y5/Qk1USppGolhG5PvMx
	7bbScFrb2/zO1ds0JsLPSM1LTQWYlPwZKC2w+g+1oAtY0GxN4I4xau2K78BFA98jK9lb4qWjvcc
	vUrmm6unr9erafzwVvbLJqZWG1pInX6E5Rkye0MLcrbafMaA==
X-Received: by 2002:ac8:7f01:0:b0:50d:8050:a358 with SMTP id d75a77b69052e-51461fcf281mr213549731cf.47.1778284450334;
        Fri, 08 May 2026 16:54:10 -0700 (PDT)
X-Received: by 2002:ac8:7f01:0:b0:50d:8050:a358 with SMTP id d75a77b69052e-51461fcf281mr213549431cf.47.1778284449855;
        Fri, 08 May 2026 16:54:09 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-393fa029671sm7049111fa.36.2026.05.08.16.54.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 08 May 2026 16:54:07 -0700 (PDT)
Date: Sat, 9 May 2026 02:54:04 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
Cc: Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Joerg Roedel <joro@8bytes.org>, Will Deacon <will@kernel.org>,
        Robin Murphy <robin.murphy@arm.com>,
        Hans Verkuil <hverkuil@kernel.org>,
        Stefan Schmidt <stefan.schmidt@linaro.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Stanimir Varbanov <stanimir.varbanov@linaro.org>,
        Jorge Ramirez-Ortiz <jorge.ramirez@oss.qualcomm.com>,
        Del Regno <angelogioacchino.delregno@collabora.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, linux-kernel@vger.kernel.org,
        linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        iommu@lists.linux.dev, Krzysztof Kozlowski <krzk@kernel.org>,
        devicetree@vger.kernel.org
Subject: Re: [PATCH v5 14/14] arm64: dts: qcom: glymur-crd: Enable iris video
 codec node
Message-ID: <676tz2xvipbhm25djmbqokfemscjjwwjethvglycvzqqtsf2uj@xlqiuzyqyfax>
References: <20260509-glymur-v5-0-7fbb340c5dbd@oss.qualcomm.com>
 <20260509-glymur-v5-14-7fbb340c5dbd@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260509-glymur-v5-14-7fbb340c5dbd@oss.qualcomm.com>
X-Proofpoint-ORIG-GUID: 6ORLgjXyVjHAKMSnSlgiBHjblXmSYNRK
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTA4MDIzNiBTYWx0ZWRfXyk+7vudELg8G
 Bj9a3pGthccn7TWIrCcNT5qfIUQsL0F8WVOR+vdmw3EhNmRnUgBVTOGdZkqTZ8V1m1JiT8odWWu
 fnaoyDj9on+lA7u8lY+SuucHbJRoKDpS6WS00lwG+P0g1WIKoX6OZM+qOHHGaF9NUS4BBv5DVZa
 9WbjCMvGxPUharVMG86ZHg2NgfCHE8+hHtE1TAhmOBb7/uBYObIap1Q6FfkfPO0wJsSJ26hyTA7
 A6GUJ4XtI+oTG/TEeLkliaUKBLYYMzEJ/e59RsyyxQBIhYmKT9q2TixIp80wy3pTmXtYjxGc0XF
 AajxvOpMWm0aK25cEcmqNMRfxVGe3V5dOWDvO0VXW8GfKbeVkpP+jI3B6qcjWYUWjAouc5r1hZg
 NHdmosnUIOkFE+vqn5RCG2Tr4AygHepedNyem61bQb5WprHML0z8dQ9ZaFYAvHy/BKmUFtz6pWP
 97ebe4kled04fggvXog==
X-Proofpoint-GUID: 6ORLgjXyVjHAKMSnSlgiBHjblXmSYNRK
X-Authority-Analysis: v=2.4 cv=IYi3n2qa c=1 sm=1 tr=0 ts=69fe77a2 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22 a=EUspDBNiAAAA:8
 a=MCItce8SuK6p_Dj8i7MA:9 a=CjuIK1q_8ugA:10 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-07_02,2026-05-08_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 adultscore=0 suspectscore=0 impostorscore=0 lowpriorityscore=0
 priorityscore=1501 clxscore=1015 bulkscore=0 malwarescore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2605080236

On Sat, May 09, 2026 at 12:30:03AM +0530, Vishnu Reddy wrote:
> The iris hardware block is described in the glymur SoC DTSI, and enabling
> it here allows the media iris driver to probe and use the video codec
> functionality.
> 
> Reviewed-by: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
> Signed-off-by: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
> ---
>  arch/arm64/boot/dts/qcom/glymur-crd.dts | 4 ++++
>  1 file changed, 4 insertions(+)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry
