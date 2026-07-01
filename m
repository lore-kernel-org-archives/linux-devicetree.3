Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 022E6413D99
	for <devicetree@vger.kernel.org>; Wed,  1 Jul 2026 10:34:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782902092; cv=none; b=V3Q5aRwMVG9OXwT/BeePPGh7RRsR/AhCBFZrlECn2L8jbKjLsuj/j/ojJ9o+Wgp3vYOECB4GcCoFFtF24eEnYkgrW9HyKcg+5U1tzdeFwJeSbAu2iK8mTgKse9MHYLUUnBuSPSIfwqc+umzrLlEPUa8S7X0EsWGLcT329mkUqSc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782902092; c=relaxed/simple;
	bh=Q+S+8O1M78oyBf4SeAO0DBjCNiz42SJhogcv/iJ/IEI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=sDRyKTKAY02w8bKCIsAxkDYn9ZIcWAqz+DqbjvU4bwQ/PuiqPc/ZcBYh44baR29PeK2spb6qL4ZCPlbW5cQxXa56hF+diyUDAiIMLoi5JR92Azv4S+vEqK9xr1Mm4XlmsoS9isF8PN59VcbaLXgE57ht+VbnJ+W48q7fVBJeYOY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=o/+9jzHg; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ilzcvlcz; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="o/+9jzHg";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ilzcvlcz"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 661A8aO1761871
	for <devicetree@vger.kernel.org>; Wed, 1 Jul 2026 10:34:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	KBjaamXA5wUppqhhT0yZ9IlQ5XxuWeojqrulhTasdTw=; b=o/+9jzHgKBtr6Yef
	MRBKL7YIu9Ef313xvza8/f3KzNbEK/JMsU88tyZKVYStFhaMlwzE2KmJBhRyDU1a
	rQ9czWiTlKismoB0Hv+iQiX9unUnoyLpsWU//gV78W19gSHZqBZKQp5NkMaJeay4
	wVYZJPWsptNyB19tB7eLZ7zmU/+nuVKZeCv/aXVHqzZkWYBlXM6HosZPB7hZk+SV
	SotaM5XMNjkxVTflrEiI9/aibzTsMbuAiINurgMycClqh5iizh8+EQi654gcGbpY
	u3O/VCSwfIzT5QR0e29LxsuirfDeuAFXbbdh8vDxOo91hH13vkzPomaGbNs3t94s
	3aXChg==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f4kgw3jv2-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 01 Jul 2026 10:34:46 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-51c298a1b20so280711cf.0
        for <devicetree@vger.kernel.org>; Wed, 01 Jul 2026 03:34:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782902085; x=1783506885; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=KBjaamXA5wUppqhhT0yZ9IlQ5XxuWeojqrulhTasdTw=;
        b=ilzcvlcz+xF9hmtnj+I7KAXfiUKBbhgiS9mkFIW6TRsbWNbef0yvo/IKFbeG//mB0+
         JlNDc3S650bYTWfldYOWeWIT0DIJcc/B1NL+jR41xHEBRcQt+W2lj6VucC764XQoTnpZ
         9gEa6wZ4S5+CBO3uc4Y0R4LeJk/jgewaNO4+VkiIRqYGJ0hgHJumII7j5C8rbTsS9BCa
         6b04GjmfUEdG++E/Ok3mu9x17WiCxCLkl8Guzxx3f6jo7JadgfKakcw7HJAy7NWFfpOp
         UatYAToTJz/MFdNCYVQ3EVStEWaBRm1op7R/q6I9QMWWw8X/mPih71FdKfvWDr9lpkGq
         hWYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782902085; x=1783506885;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=KBjaamXA5wUppqhhT0yZ9IlQ5XxuWeojqrulhTasdTw=;
        b=XrGV+DP3aJdtsIO9Qlwy4clK1V92uMGNgYsKwmnXb70W6CVPya0Aa7mjCjjMYshlx1
         Cw091uYp1b4qoK/LwJJszTfQE+xKE/Jil2kDw68+yD8my+8LzE39oiv8vE1JerKw5FAE
         7zFrr4TGQlW5iRft8J0XZD/cCfAebKi6Mx2VZ2FE1N9xsN+sXzsnVW5TbPJv3u5RlesP
         Hc/Zivbg7aKyb+d8LdtLfjF6gA/xLZPp6L+hvzrP3Nh/SCw6cESiatqPqw69z8dFcSje
         CojyCL/VPUdH6jgQtkdRkFDz+hrr6nNFPhbyXp728V8P3KYP2Y2bb5fuF1lwHJgx6UJv
         sW6Q==
X-Forwarded-Encrypted: i=1; AFNElJ+Af/sWMjb0wbutMXwrFUno16SfGcSz3ahhyYKAcpDpdjxsL2XSshQcXV8eG+Fdvnb9tLHC86HoMhTx@vger.kernel.org
X-Gm-Message-State: AOJu0YxaW72VFDQ3zdFV7tKZ6uzDLla7wyh5WcYGgLKWA9Sc63w44qQL
	95OonY2DLQKoMYxFs06nfp3oBQXSAol37AffaXDXD10kEy8ZXZqpQ3AnUhaLk5c77Yue/CxHQo8
	ADOermd7UeU1EdUlS5BERLuWGUijlPUNTxtrMp0/y7iW/ZLyiD6Qw1vCxpUz8wfGP
X-Gm-Gg: AfdE7cl/ZqntACANsHPtRewKOrAtpT0hgTTj5LWiPbuAQVWy3t4W+k1l+Gd8pmqF+FR
	4KpZ+kPZ4cffUNfSE9pqORqMOCf/nxkG6g5f+wDMg8fXXAwoWOsVezqx7o3iPj8KgvTJLQdBkLj
	3foTS+LH8fWbryRzd0Kv0yypXCZnXDc8GSQ7WsBgCVhcXVllODDk57fc960kghWU1WSNiPr6pb3
	dd22bKcqMls65Hwh3qCG+U72L6I6xJp70E7L3mRZ0w58dIlB/xzM5MeTJsq3FX8Hnjjb2bgObfh
	AIigo+1QZXhA13qXa2U+NVqbkt5/uHoaVsF9m0CN2m4zovUwFrY9dK1U6mnr0Xz3d0ezayBi7t1
	tCyreFiwnEh8rlTWXiz6eKzg05+ppvF9FXRk=
X-Received: by 2002:a05:622a:1348:b0:51b:ff78:f229 with SMTP id d75a77b69052e-51c26a8ec25mr9409501cf.5.1782902085614;
        Wed, 01 Jul 2026 03:34:45 -0700 (PDT)
X-Received: by 2002:a05:622a:1348:b0:51b:ff78:f229 with SMTP id d75a77b69052e-51c26a8ec25mr9409191cf.5.1782902085193;
        Wed, 01 Jul 2026 03:34:45 -0700 (PDT)
Received: from [192.168.120.170] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c1288f499c4sm251567166b.49.2026.07.01.03.34.42
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 01 Jul 2026 03:34:44 -0700 (PDT)
Message-ID: <12e86cc4-d96e-44f5-8c87-87a6df321115@oss.qualcomm.com>
Date: Wed, 1 Jul 2026 12:34:41 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 7/9] arm64: dts: qcom: shikra: Add PCIe PHY and controller
 nodes
To: Sushrut Shree Trivedi <sushrut.trivedi@oss.qualcomm.com>,
        Vinod Koul <vkoul@kernel.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Helgaas <bhelgaas@google.com>,
        Lorenzo Pieralisi <lpieralisi@kernel.org>,
        =?UTF-8?Q?Krzysztof_Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
        Manivannan Sadhasivam <mani@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-pci@vger.kernel.org
References: <20260701-shikra-upstream-v1-0-e1a721eb8943@oss.qualcomm.com>
 <20260701-shikra-upstream-v1-7-e1a721eb8943@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260701-shikra-upstream-v1-7-e1a721eb8943@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=Co2PtH4D c=1 sm=1 tr=0 ts=6a44ed46 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=EUspDBNiAAAA:8 a=K_jWTC3QbOtyT-G4GQ4A:9 a=QEXdDO2ut3YA:10
 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-ORIG-GUID: XNVpT9y18WtON9qjECdkZIDSqKx7pJi-
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzAxMDExMCBTYWx0ZWRfXy/RD+w2LNEWB
 6sr+kK5jkutCbckvuqhhNMmrOG65iIy/H9iiwbRzOpzp+WG0GkilgQBREiSyYG/ouj0wcZrDNcP
 /Hp08n2fy0BpTwcfzSCdG6p4K0kDoxA=
X-Proofpoint-GUID: XNVpT9y18WtON9qjECdkZIDSqKx7pJi-
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzAxMDExMCBTYWx0ZWRfX8YiB9QzRqwBw
 z3IUZSCGgwWUAA4XUbJqOcCQOmagzJVhEz8S+wqEs4DWIYrpe86w69Pvcm20j2+UZKqAHUxZcWE
 1CMUj2ZZYOp3mruJesZGrFgIuB7pAUKphd1CB4DP6MCwx9yJSUR2zbOGD47wFmV8l8kHdDfa76e
 orQ8Dy3KKX+JlhQGNYuLTrUlaWEh71K5n74QvxET7LxecDFrLvjHciwQtowmhegnBXD99jA35jw
 lElLaLVNPUwEAbrRIB1BEAfMBEs03fk9USYDgKBJY09GqhJpJ718nhcySsD6eteuUS9BqIjseAQ
 qCkA6KDh9ejp2MElmc/KTccC1IIoXqyWFyNd10LFuD7GN565Gq6xJgC09/CuvdPpD0Zrp9HacI+
 TbKgbp2umUsQWr0IrrtuZKI6WwAqExjBiF9qTA+pU7ZO+uWoPEP9PJH/2nJCnVHaDgMs67asXos
 4o/cvU0K37udK+Zbhyg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-07-01_03,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 clxscore=1015 bulkscore=0 suspectscore=0 phishscore=0
 spamscore=0 lowpriorityscore=0 adultscore=0 impostorscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607010110

On 6/30/26 9:02 PM, Sushrut Shree Trivedi wrote:
> Shikra supports single PCIe instance with  5GT/s x1 lane.
> Add PCIe controller and PHY node for this single instance.
> 
> Signed-off-by: Sushrut Shree Trivedi <sushrut.trivedi@oss.qualcomm.com>
> ---

[...]


> +
> +			max-link-speed = <2>;

Please add a single-line comment right above explaining that the
host supports higher speeds, but the attached PHY is only Gen2,
so we need this manual limitation

Konrad
