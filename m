Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 556713921CC
	for <devicetree@vger.kernel.org>; Mon,  4 May 2026 10:33:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777890798; cv=none; b=opSLb5PxO7zo9eE/JAtnIpstmY/LxDmDaVDwwG8Z5Kzwsvf56lqdik4Jg/ybli9wwi5ajkrqlfH7vHiUOujoMM0FNHX2+qAjf75Tv+0xTqYWkxcdsjQFzQ0qZjEBQNAa6NVzTWCNDe5F+h0zWVf9JGEJjnFUeorffAYpEqO5wbI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777890798; c=relaxed/simple;
	bh=OPS8fGs/gcCPj6H0lF4H8yUDYT6+HtQiKJwzPf7OCcE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=D/2NEKXlwuvLdRzaYgrf2GI67Wa1FVoHTfkg9A/hXdpo/bI3Bji+//kKIfzrk8Qs/ksVhCbtEqRHKRBJ07VGRITAPEh2Mzz29o7cU+uD94RNROdezur0ckTu6/WRkodQeZJxRXbmVEsh2iSdCH5zGuaUvsQUZUICyIANGdp2udc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=GjvPMUMC; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=N39EjpV7; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="GjvPMUMC";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="N39EjpV7"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6448fKel2777141
	for <devicetree@vger.kernel.org>; Mon, 4 May 2026 10:33:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	dznsSN09bMt9ePGNE5oYToh30o13eEnnKbr6K04ZsA8=; b=GjvPMUMCF6qiIpUI
	1Qx0A7hEfLT1PCHO9dJ+uFjowpmnsXIONjk0SvPIVWnfHUkJHgbVPUofggmZ9/em
	ZBkHvuMmqK/8x9ankeDiE7EIjKsp1fEdrwvy+Oxmv+Zr0emBGOAh8sFpBNquEMGf
	g79ojJ6q4WI2ljuuvOLf7uB++zBbiAW2FWjbTR23q8fp7JxpQBSWvQXwzbFZJAvU
	xG8vt3N0MCMXRg4sE/ph37v/LDASmJ9Qr04cZ8Kr6EMo7AgrqzlE5EC7lN2G6le9
	xODtfgQUZoiG4Hguxfnx4JdhlbLuBwHJjPT18tof+hsi5SY35b97k/bgoGdKIPcV
	fHc5MA==
Received: from mail-vk1-f199.google.com (mail-vk1-f199.google.com [209.85.221.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dwaj7d8mn-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 04 May 2026 10:33:16 +0000 (GMT)
Received: by mail-vk1-f199.google.com with SMTP id 71dfb90a1353d-5751990b248so49298e0c.2
        for <devicetree@vger.kernel.org>; Mon, 04 May 2026 03:33:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1777890795; x=1778495595; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=dznsSN09bMt9ePGNE5oYToh30o13eEnnKbr6K04ZsA8=;
        b=N39EjpV7srDI0oeDqvuZu+2Z71Aio0N6KdPRW38QJYJ3+52QXuA+JWD9QRX5wN3sJi
         tVNQJspSyGOwZd77z8nFsTRuSCzLOaUoBTcGbG+HgiN4MR8AsXkBIDNcIcR6vzDZ6eF+
         P2pPb5CWttwdDPlxbjALxcVT69toO1LTLw12FTjlbv7OAO6QOSQfXpDJpGUMpOkwjQtz
         XYNmT80FSinxMXtEyvXdT5lycH459AJMaMi10O2OoA+EbrGC+jXQoFBBOypNK118s797
         /T8IAGbIU5rEqtbhSrwlVnCHGD2FBjagYjjQSmmUB9vWquehcM0HcfKLvV89DL7irHkX
         rr5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777890796; x=1778495596;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=dznsSN09bMt9ePGNE5oYToh30o13eEnnKbr6K04ZsA8=;
        b=RmaTIPmjDG7KvYC4hxv5K9dveD6VzrMS8y8zvjmoFo3j8h3lSXdh2rtvzTd3HNcsmT
         5icycwvt8TxVSv/NTWrw8UKhGvA6flwybFUhoMqxvpmphuZR9SgVXk+HS0df3RJqKKnU
         J35mB9agGiheETf3DB/xAlmTB4GXM3UW81CWQIzPX5FMgVpiyqINMLsbsBzSRaSlgfmg
         T9m9Ib0R2pcWMIhlYW87o9bsBALmA7kkcw5Z9YrCIl8lzmCY3yNKUL3xGcOr4VOvd3K7
         9x6WwTEWgP4Wiayh+P86vf1SfE+KIuxz+srApNpkoYiquHLrkuPAsCI0RnR74ZWrk8od
         TFxQ==
X-Forwarded-Encrypted: i=1; AFNElJ93P+uTVWnmji3dPamwbCyrHERcHze7tIveTA3UCmtXedkEhk2PasLkmAwzAM32XdQDuBFsc84M0vQm@vger.kernel.org
X-Gm-Message-State: AOJu0YwSi7k97bMjdsZNt2BhjINHJ9Kc81J+q2Jk3H7qwvtNwXz3T2RF
	d/9qBPjSjG6Sblae3/FywPizYFwDlGtJ7Uu2P9MSjrr6TqcjRKsEfZoHgiZ29dQDVt8rB3GIwh3
	B3mEJzeVSGHtfRRekevlQjIxMdnpg0u3fLbq+E+mRr99usG1C6PuI6jmqIq0ZlA2OgLXTRRtx
X-Gm-Gg: AeBDievjy6A3AZ9mERbgJplOypkFGoEnNyp3TQiymTwooLBFMH60ntb3ULqyIH9oMyG
	A/IwhownNhbUtUK3HnZs+XZQLTmTCAHQ7Qz2Mqfk8mkZBuiEpsrLRw3/rWdpveXRIUFNGTgZs6R
	Pmh1GlO07S+m3u/1whvkLkkuIdQkrB6fQ2P1IdTgx0UPSatS89xB9w3upd5s261E7pg0iT1hE2U
	1wzClvFuLYAeFl6WeJGu8+h4yJ8AByc/zAmg46SL2y4B+dsKYe6iaactGDgDiSJXJ5flvOulLiv
	7U9sgj7SbH1QH/A+4y0gRdwk4GO29eHkLAwWDf9dRpV6DHx88XH/iUP3cHrZ62ubsDcTmVhbUwh
	NV9Kn4TafrluwVsaKMgQhLm1VTGBNLIV4FC9PeWxYP+SRK6Vw3sbGb5AJeI3bgW26fmR+mxyA2m
	km9s1EsU7YkFHbDw==
X-Received: by 2002:a05:6122:4204:b0:56f:8cf9:33c8 with SMTP id 71dfb90a1353d-5750c69e1damr1538594e0c.2.1777890795625;
        Mon, 04 May 2026 03:33:15 -0700 (PDT)
X-Received: by 2002:a05:6122:4204:b0:56f:8cf9:33c8 with SMTP id 71dfb90a1353d-5750c69e1damr1538580e0c.2.1777890795226;
        Mon, 04 May 2026 03:33:15 -0700 (PDT)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-bc2c1ca0133sm54205066b.29.2026.05.04.03.33.13
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 04 May 2026 03:33:14 -0700 (PDT)
Message-ID: <a06d339b-ac5f-47a8-8f3a-ad88e484593c@oss.qualcomm.com>
Date: Mon, 4 May 2026 12:33:12 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/2] interconnect: qcom: add Shikra interconnect
 provider driver
To: Raviteja Laggyshetty <raviteja.laggyshetty@oss.qualcomm.com>,
        Georgi Djakov <djakov@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-pm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Odelu Kukatla <odelu.kukatla@oss.qualcomm.com>
References: <20260504-shikra_icc-v2-0-81076171e010@oss.qualcomm.com>
 <20260504-shikra_icc-v2-2-81076171e010@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260504-shikra_icc-v2-2-81076171e010@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: 8HSpKEgUjrJE2P4JiLgM-9iyGFyzn2KY
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTA0MDExMiBTYWx0ZWRfXzAUtTuuuQxmn
 bCceyJTbrXDYlvYOso1ce4/EN/cwZ9s6bgdyzs2jaiRyuz1iTf1YooAT7m6cIjwiKoaXf0YqcvT
 mQlfAaK0npH8otMuQ2gsN+FI3guQZs3ZSn9sVvlPEhL+Cyxa2YDuhTaSWJYfDcYILbf/OtZ9Yz2
 8/5zkmvsRJ6V7XWPf8GTZpWA1V7jwcophAHUXUeUQjIJbzp0XdYmeK3fBIsoHcJDnPQ+Cb+J1VS
 yWQEd7Yzp5tn1m1BLH0/5A/rvq1C06+s8BQZDjv/9BcifPSDIOlj23iypcHiNIXdM3nOpJHx5KK
 valNsSKNRIIpbNPzMQrDF1bTfz1RdNMOb5J1nuBjdxDF5F9dvqrIYkV2OHU0Nqrvjf2JyjYO2Lu
 Pk49u+IXUmNml26NGoPXvtI4kPrqnzphU5haLxIHQSL+F/qyieiPegoL6Uls8MXehmToOkCY+W5
 LnFOgsqB9m+kGEcfmsw==
X-Authority-Analysis: v=2.4 cv=csirVV4i c=1 sm=1 tr=0 ts=69f875ec cx=c_pps
 a=+D9SDfe9YZWTjADjLiQY5g==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=EUspDBNiAAAA:8 a=j7VvbvnbhCrZ_lwJNYUA:9 a=QEXdDO2ut3YA:10
 a=vmgOmaN-Xu0dpDh8OwbV:22
X-Proofpoint-ORIG-GUID: 8HSpKEgUjrJE2P4JiLgM-9iyGFyzn2KY
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-04_03,2026-04-30_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 clxscore=1015 phishscore=0 bulkscore=0 impostorscore=0
 suspectscore=0 adultscore=0 malwarescore=0 spamscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2605040112

On 5/4/26 11:41 AM, Raviteja Laggyshetty wrote:
> Add driver for the Qualcomm interconnect buses found in Shikra
> based platforms. The topology consists of several NoCs that are
> controlled by a remote processor that collects the aggregated
> bandwidth for each master-slave pairs.
> 
> Co-developed-by: Odelu Kukatla <odelu.kukatla@oss.qualcomm.com>
> Signed-off-by: Odelu Kukatla <odelu.kukatla@oss.qualcomm.com>
> Signed-off-by: Raviteja Laggyshetty <raviteja.laggyshetty@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
