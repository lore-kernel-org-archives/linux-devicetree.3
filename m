Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2CC7C3FE37C
	for <devicetree@vger.kernel.org>; Mon, 14 Sep 2026 11:03:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789383817; cv=none; b=o0098kwgLl/DZe3XNrKXpWP8Gq4klGvmZLgiqeJmdu4/6119hdqPqZS5EqR8fSSoKDhWH+o2+skX3gGkDuuvqS6oiYAca7q9+tBUtLUGcKWMgpVe+J53OU2+XSrETWQjVw889F7U3ZN7OaS5D3JvqEOViawjqbCSfi6kJpOqgLk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789383817; c=relaxed/simple;
	bh=6s485u4hsYX3q0MFvfZq3ETXD6xoKXpFGTAjFn2Mero=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=MwRVkD0jiXpi64w6t5vJ9wTXdXPLcha3Tqrn9o21ryz1B0ErOJ2VJJTGxIN4IEzt7FLlBe3yXREugW642YFDx8BYNik/9MrRmheUK3t9y6k9kHadHcIJhed6qA1Y1TmpvHD3TnxedKE/UJy0qztjHU96KWBpbeZUsMDGZnttidc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Lvl8iQ1Z; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=eQhgXbQ6; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Lvl8iQ1Z";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="eQhgXbQ6"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68EAm8Dm530979
	for <devicetree@vger.kernel.org>; Mon, 14 Sep 2026 11:03:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	pSgCXYyWjXSuxjyZ8n8hFNw6JNFa309KScyB8XosxnI=; b=Lvl8iQ1ZHjpUnBCu
	qs2lemQF2cn9q2OFiHv468EBRV64Mc0iV/s+LYh3H7bAU5bZUSCNTwarnH8wgufb
	RY7KtcFM4nqcRo0BGT+i3gtJfQoK3P8MSyEtmvLRrd4uzj4uhLonKX7+po/MfMyL
	AjTej3k9So3N0J5BuhP/3id0QgTEi2qEZ+UkuM/W72izsHk5ALkcbEdKsZ9A1fek
	asFjBfW7xuacj+odCA8uxoY/q16TMCLg8tfBvKWG+R3UIqWsZJKeaZpayvm3atHP
	TQifkfrLGzSroyRgldhPIMGROAMuSkdT8Mwd6HuCi8PPvFQ7F7hWNVN23H7Sr0aT
	x6z1Tg==
Received: from mail-vk1-f199.google.com (mail-vk1-f199.google.com [209.85.221.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gp3hst4b7-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 14 Sep 2026 11:03:32 +0000 (GMT)
Received: by mail-vk1-f199.google.com with SMTP id 71dfb90a1353d-5c83098d1e0so47110e0c.2
        for <devicetree@vger.kernel.org>; Mon, 14 Sep 2026 04:03:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789383812; x=1789988612; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=pSgCXYyWjXSuxjyZ8n8hFNw6JNFa309KScyB8XosxnI=;
        b=eQhgXbQ65yj/87yASNbgP6sXDOjYQyHXZORMoWpiQHXoLtKy2fCxVV+0CCGbCH+15N
         dq1i2EuRJy6dCQfYHmlYSvafILF7jjytHW928ci573FYqyc5JMy9GRfE3DTFR/sFDY8G
         YeeNxpvVBM1BhN/JZBrk+W0j2LV7P6nQKO2zS0GtA4n8m/w7Qt9URXVVwYc80B3qjwJ/
         ho2wqdfIz1L9/RVFj+iJ/uITclIaTz9f2o2xlTQJLqB1BEHhHtmfuy7QsBVjt1PfNj1/
         h5+WoROvJb7BzIg18wm6NZEidlNIY2hXH90H5ZJ8phM3PTrgMoa+2b6k2Qr+IUV9xtJo
         EmPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789383812; x=1789988612;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=pSgCXYyWjXSuxjyZ8n8hFNw6JNFa309KScyB8XosxnI=;
        b=aptYpgcgN6goLxM4AEEKnhWdWY3l2A49E7FqyQ89q96h49M2CQYadlel5Pd2qwYwI4
         v3oT8AfP3wwi3WudZtYE9mcDYwdKapxCH+3fb26cWw/n616v8e5uXwHvW6MHWh/3DY5p
         RGwL0Nd9qtRzlZIX59y5B3oUh16Y51iwPmWDntBmeEX5Q6X7loB4hYevaKvs33dqP9wJ
         4Xz4vUFj1Dle268JsRTWY6G9TArLjoOYkdo6HPb7Oxor4ywaAwi90XqyaS4Gp1BxXE3r
         8ZXGxI51Nv/t+yzogI/7zApO7Pqc3vIMSQRJ51+QtCSxo3dEugliuYHdeJbR5FJJq8rQ
         Hs1w==
X-Forwarded-Encrypted: i=1; AKwUvBzv5iZx3eixxkOGOLqJwfkXKbrS2xL/AqlT18ktmbVmEgc1DQAncroUffFr+/iZAvAd6lggLtf526oM@vger.kernel.org
X-Gm-Message-State: AFuF++lYGIMfPp1fQfq2Hiyz69vqfOzpqGsOpxcRK2gcRLoQExJfB8JJ
	02EWxFMTScK5ubbsotP+9+AJWcvYX6g/4tyk5xhO/jskyGhaFlPwt/xHhv+/WIon1Sn5JIDHTbG
	xQTL10pkOOIvPl7O7ccHZTcly0oahBOkshMqN0cimb1bFqpo8hJb/5MjT9NWOolKP
X-Gm-Gg: AYBFou11+lGnOwOncbPwVWYRkynwcN8/HzPxbo6r8eJLRP6XN8dRBDwqNkE8HqcCEqP
	39tD0ymQjiYplSpRHrx92OnBC29VrI03ndYeExYqui+6AOeoHAXk9sqcFgdTJ3Cu5b0/aOdJtpB
	e0K+mP6cVcba9DA+2qnynsC5qbrGh2TzYXYMQxIispiwRaxnLTLg5S6DbYDgcSaPlL8vEGF1Y5W
	AeKdRUFDzHaMtPDf+LXBp7Uyv+U6ZWBn8VH2M0nVmD1sQZlfwIZC2gptHlFsDH8bilMzAfAPTNR
	2brvVC3peslo0x0Y4vr+H+/mlBzzwPzmr4v9JgF4h5VyMOe/IKAOuZFPt3CYAr8WcvZ+QGlr4Sq
	VxQS/BTmYqBvQvO0ZrT3x9w==
X-Received: by 2002:a05:6102:149a:b0:797:576b:a9f with SMTP id ada2fe7eead31-79b5be3a274mr279391137.2.1789383731563;
        Mon, 14 Sep 2026 04:02:11 -0700 (PDT)
X-Received: by 2002:a05:6102:149a:b0:797:576b:a9f with SMTP id ada2fe7eead31-79b5be3a274mr273874137.2.1789383696795;
        Mon, 14 Sep 2026 04:01:36 -0700 (PDT)
Received: from [192.168.202.12] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c2966122101sm409923766b.54.2026.09.14.04.01.34
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 14 Sep 2026 04:01:36 -0700 (PDT)
Message-ID: <6353d1e7-32a3-4a2f-b68c-97f2bdbf55ad@oss.qualcomm.com>
Date: Mon, 14 Sep 2026 13:01:33 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 22/34] arm64: dts: qcom: qcs404: Move PCIe phy and GPIOs
 to root port node
To: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, mani@kernel.org
References: <20260910-root_port-v1-0-90a252ddbbfa@oss.qualcomm.com>
 <20260910-root_port-v1-22-90a252ddbbfa@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260910-root_port-v1-22-90a252ddbbfa@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE0MDE1NiBTYWx0ZWRfXxOyJbPb2f17M
 dASxO/c//n//AFJa0Hc/WPgWRRP4xYdHTfPuAb5LQJK+8x0sARNEy4LUQq/6qx4NECEDiDHaRZD
 3iGkKkXkuC8TijCAkyKnRENxehgqWB2Ji8U4PjSLgQMaUcyk8RVq2jaLLFaUhFMNNenEqF54t+d
 AVn34stSQVBjB4r76WPXTRJQ7OsksVhGqUSaPja6UhqHdY182U2G3qdV0YnY4lt4y9j+M/v7fGP
 E3R/hWZJFJwLLsdcCWc0E4rSfsqk0N7hBIbAoK5W+OhbRODKKKCNMUBjtQWx9A0CAxxJePmgmn5
 IbE0iFfPy11uG0+ckUq5bzIq6OIAsNQbdFJ/kZqVDArsXaUvghCtruqHdRHZgh6dYdVjO9CHtJt
 2XWD5lNuhNXGL+d7QrgUQ/J8lj9siWPrDVgPZOKpKU8qi5MzelIXBn3Xqt492fWvOa3zzIA4eFn
 qVMJ49X7BFDZHGu/VEw==
X-Authority-Analysis: v=2.4 cv=IZwSymqa c=1 sm=1 tr=0 ts=6aa7d484 cx=c_pps
 a=+D9SDfe9YZWTjADjLiQY5g==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=EUspDBNiAAAA:8 a=6pHcnep46kEejBPVP2gA:9 a=QEXdDO2ut3YA:10
 a=vmgOmaN-Xu0dpDh8OwbV:22
X-Proofpoint-GUID: T-cfzUbnU1jCmEt1oGMXY1syjs7TkpIF
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE0MDE1NiBTYWx0ZWRfXz5gigXi/5rpi
 u1L4266shGL9XHG5f8lRyeqNcqHxf8Fc51Ze62hQl+GpJaX8RAWf7YBCOu+fkoneqQt3COFzPo/
 w1CwEtr6EQTr+Ap+bf+y52IhikMkJdU=
X-Proofpoint-ORIG-GUID: T-cfzUbnU1jCmEt1oGMXY1syjs7TkpIF
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-14_03,2026-09-13_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 adultscore=0 impostorscore=0 malwarescore=0 phishscore=0
 clxscore=1015 bulkscore=0 lowpriorityscore=0 priorityscore=1501 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609140156

On 9/10/26 3:29 PM, Krishna Chaitanya Chundru wrote:
> The PCIe phy reference and the perst GPIO property are per root port
> and belong in the root port node (pcie@0), not in the RC controller
> node. Move phys and phy-names from the controller to pcie0_port0,
> adding a label to this node to allow board-level overrides. Move
> perst-gpios from the &pcie controller override to &pcie0_port0 in
> the board file, renaming perst-gpios to reset-gpios to match the
> binding used in the root port context.
> 
> Signed-off-by: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
