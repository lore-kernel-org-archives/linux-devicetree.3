Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5E52A40F729
	for <devicetree@vger.kernel.org>; Thu, 20 Aug 2026 10:14:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787220883; cv=none; b=pcW2F3FfKYaALdJ/vUIMnAEAoKNtv9guCd3btJTzJgFVvf3Wp4eoSaAVZsdZv5zk53ixaAcP6f+9uVu5bp91sANgHFj6Gniz481csG1QA97SHUlGThgPykla7t6QdQFAC00DACapTf3l/4fxX/AZwR+r+q6a+dMA0IuwBs72swA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787220883; c=relaxed/simple;
	bh=X8y3v8iSC3IAclYNrqRIQfkR16kO7jg414q29IlRxqo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=nyfOqyoGMDeafMGv0W2cmmxd+PPnfMYntR/SN72RPp9tLiSLe8xKyytz1wZ7Cdw4L1dGw6Jx+bsziIte78yEY+tSCl6OWzJfMCAtk65dSGCV2ri/5zyzITBU8WHpUR72mPETiZFUKAomDqZunopMIX0DPCFqSL/ORqN2F2dxBzA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=R6OF2lEg; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=RBm7sTNG; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="R6OF2lEg";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="RBm7sTNG"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67KA3Fdp3454839
	for <devicetree@vger.kernel.org>; Thu, 20 Aug 2026 10:14:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	KHYsELtpGLLEt+3xi1H3gM/7xSFfDKi5oNRL0o5VJZ4=; b=R6OF2lEgK6gOcZHa
	vIv1bRpXxjXfv7JjDWrPzr8Kmn8uXHCvgC8QRerddtRsjlYdiqAmuFiWr45ffaQp
	nVuoxYkoNsMBi1e4bQZNUdOTWiJXi2a8qj3JnkwBgSkr8j7eEiWRU1TEDFprYKce
	hQrnDombFedtjMuSHbyVOAMLsB0UBz1vox8mz9UyHZXpGy6CenNsqhnEhUbs6Rvp
	h4bXJNfvP5MfwCnsBuUdY4Yhaq4nEyDeLRhjx+Z1ooAUwItPAZQYevTezeYlECFG
	njXZdy62UzSclQcmuNp9umjJUDqEaiNIG9uBxjqrzNrlIi2OuWp4teAYCy+48dBW
	Wklv6A==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g5yg881mx-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Thu, 20 Aug 2026 10:14:30 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-52ddb567146so398471cf.2
        for <devicetree@vger.kernel.org>; Thu, 20 Aug 2026 03:14:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1787220870; x=1787825670; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=KHYsELtpGLLEt+3xi1H3gM/7xSFfDKi5oNRL0o5VJZ4=;
        b=RBm7sTNGqUktCCRwz69BPpahDNtXAKTrtgmi+FpwqL6qU56RzCZHYsWfqIgOx3302K
         t3lXhCOoe4CmVqbQdR+guPXEG2Y6XH2Ue5DxRN25nO4dkXLE5SMB4fWflp+NrMngpvkN
         f2vT9J9je6i8w+SnlaRzbGsNjmY2yLT2CKT0uE2XSnS9BAD5WImflD0sSkY45UBfdLZC
         Y0/riCCmo+eklwuRWbZUhbNjbNtwceQYpq2VveApICxMAmFROm1siJrVZs1MIrkh+OIh
         fUB7zqUVJZ2mQl7jvmVtC8gbPgmaFUm9+YqyD6K0L/sQbutozjjHUGgupbQTv0v65E33
         ZooQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787220870; x=1787825670;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=KHYsELtpGLLEt+3xi1H3gM/7xSFfDKi5oNRL0o5VJZ4=;
        b=NdcicIW01/RQkGYHnFjgUyK4OYVOGyYj2sGGvVI0QK+uYNr6GSoOoHRLc9CqXekG7a
         AVMnwm8ifryIzarnHwD9wsJwjQsv4rm7ZPEHGnYDJlE2Ki74lnHbj0vbM1NaSXA/61J5
         PGpsY/6ywn7hvYmzIwh8+JKMFIAAAjLV5xIraWkgx9ZGYC9rylcTBqSpfgxHcMzvo/0p
         ozOpOiS2qFHUB+XF/dFZzRP651aOwzV4US4LLUx/I2xE1AK/QiDYov58C8Fjk7FjdSMd
         CMNKxeVmSRvSjTnQikj20iWGlUWe8n9mimKztIr1gGGqi6indRSb9fcKLqNUXNCdzwIP
         gYtQ==
X-Forwarded-Encrypted: i=1; AHgh+RqFBZxlxnrYDXAD7qyDKLfhCuGI5Er3wJfUqKKzAoN3jSGLyTe54RnlhgEEOpwcohpIYGJB4nFMkOFV@vger.kernel.org
X-Gm-Message-State: AOJu0Yy8FA9nkJESHUE5CKbkEnIuG4C1xI/HXXRTI3vokvUlu45JM6NZ
	z8E5NmhD9riqvu+vL1Z+KB7gA3qV4P7k4auixzeVwj3k3s5mXxDm2ChTbumk2zY90Q9Ix4zmSpe
	ZHBnXV2h9qr6qacmSaDixIGwcFU1G8qARo55/gLWxRXG8sjchhnkNULFktnQyV69H
X-Gm-Gg: AR+sD13wRJTB6/FrGiEo8CQecyT/rPu+Sof7gdk4qDowbBk/vGHRZWPQL4jzYRbHu+Y
	CJYB4NEJ5Dth58o2boDSwRQHC/PH68BZdQSBrd1+Z9eJ/UzbM1orxfrkCDk+5NF8qbzPEWEFQDv
	7n+IJSf+v5B5ZivbkDNZxkiSMWBq7iSFyLr1xu0Nl2LCSJpzxWmCyQW5p/KPBklxiFRzxIVyOIF
	TRxF1ogxZmvP7qlUo053R6JIWsPH4daaNvxV8LYimGhKJiTFedYS5cPwfb42Oui4WDEEVhSSI9u
	lVVY5ktSq4MqrTcV0HMPaCXtVEaFZJyWNzAwjXR+S9G/cGzCnDPB2U8j3iHGcrqvLFwXBuENvj1
	lduwvTPmdG42M/0GVA8aorxsq
X-Received: by 2002:ac8:7f0f:0:b0:528:3722:a372 with SMTP id d75a77b69052e-52dd5dfdcf9mr78319691cf.4.1787220870014;
        Thu, 20 Aug 2026 03:14:30 -0700 (PDT)
X-Received: by 2002:ac8:7f0f:0:b0:528:3722:a372 with SMTP id d75a77b69052e-52dd5dfdcf9mr78319291cf.4.1787220869552;
        Thu, 20 Aug 2026 03:14:29 -0700 (PDT)
Received: from [192.168.120.193] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c24591e0397sm49055166b.53.2026.08.20.03.14.27
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 20 Aug 2026 03:14:28 -0700 (PDT)
Message-ID: <f0db00f5-af61-4bc3-b607-1ae3a399745a@oss.qualcomm.com>
Date: Thu, 20 Aug 2026 12:14:27 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 7/7] arm64: dts: qcom: Add Xiaomi Redmi 9T
To: Adam Skladowski <a39.skl@gmail.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, Kees Cook <kees@kernel.org>,
        Tony Luck <tony.luck@intel.com>,
        "Guilherme G. Piccoli" <gpiccoli@igalia.com>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-hardening@vger.kernel.org
References: <20260820-next-patches-v2-0-7130d68183d9@gmail.com>
 <20260820-next-patches-v2-7-7130d68183d9@gmail.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260820-next-patches-v2-7-7130d68183d9@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwODIwMDA3NSBTYWx0ZWRfXw9nwk/i6AL9e
 7ZlQAnGphGz5Pj85i65HOQUgkBjCmCG3Kx5VJBZ6Z7xn1sMoS9Dei/VFQk+EY+IDkpMneBvlHdn
 oAEu1ejVYWdf6AUwTqExi/WGKMRGCxA=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODIwMDA3NSBTYWx0ZWRfX4luIqG8uojpg
 Jgf6XQZA5lMsHs1oTwkPa3orYQbueR8WJBqslKZuqPPqaIzmxZpNnmKNetozrJ4Hml6xHG7GzKJ
 77x6jI/HjIN03LzsEMfIaPPKwPCPg65H43B7zoqe7CXRtU5yvxGU4Ihipo1jo3EaKbxFFWbscFk
 LNqfBpHsB7n+quPOqtFrlPK1JGqzE1NGHHRcudVgeQnIJoJF+wRfCZO5yUqddv3PTBDWEqjUTJr
 rawuKGrPWGrOHhQxmuZV1/+7t3tJ1uCwSEjy2SZ9fI2rrNf51RSPKWSeAUrYuK6FryxJbIEg9Jd
 x6K5b6mq33OTbpOdrh9nQ0Q2ltB4ClfYLiVgCWHTbMy/hN5qJ3o3kNM/mb/uDAARjS6Iy++sKAJ
 a/XHQp3sH8lLt7T3cFuSfdDD46PqUCHHkEsdr2GDFr3z0XeCf+5DORBn4+37471k8bngXrSpeOj
 35vIaS2XvDKEjSD46tw==
X-Authority-Analysis: v=2.4 cv=Y7/IdBeN c=1 sm=1 tr=0 ts=6a86d386 cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=pGLkceISAAAA:8 a=EUspDBNiAAAA:8 a=m8Yw1JhN3ITPm4ObUbYA:9 a=QEXdDO2ut3YA:10
 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-GUID: fegM0hoD347UGZsUlgMtbw1AHlsoBfgm
X-Proofpoint-ORIG-GUID: fegM0hoD347UGZsUlgMtbw1AHlsoBfgm
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-19_06,2026-08-19_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 bulkscore=0 priorityscore=1501 malwarescore=0 adultscore=0
 clxscore=1015 phishscore=0 impostorscore=0 lowpriorityscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608200075

On 8/20/26 11:42 AM, Adam Skladowski wrote:
> Add a devicetree for the Xiaomi Redmi 9T smartphone, which is based
> on the Bengal/SM6115 SoC.
> 
> Supported functionality as of this initial submission:
> 
> * Display via SimpleFB/SimpleDRM
> * GPU
> * I2C peripherals (Backlight)
> * Power Button, Volume Keys
> * Regulators
> * Remoteprocs (ADSP, CDSP, MPSS)
> * UFS/SDCARD
> * USB
> 
> Device tree also contains supply maps to other subsystems like MDSS
> but due to missing dependencies like panel those are disabled.
> 
> Signed-off-by: Adam Skladowski <a39.skl@gmail.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
