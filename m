Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1EA9A3BF66E
	for <devicetree@vger.kernel.org>; Fri, 24 Apr 2026 12:06:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777032388; cv=none; b=StXScq+JlS9vHk4lIFVxfeP++6cjAuFShDXH3Y9DWKUp/lSHsXNTPi2r+FhSiJByoP3Ox/OlkzQEHFZM8rhTVkINPfOl+nux0MqktwD2t1zk91YzbER/C39StMrDrifk6M5ut5vJSoTxmyV+jf3YFy+9p2JKSyB0q81CwvxiZaI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777032388; c=relaxed/simple;
	bh=W2xoUC03QWrRjKJ20HM+A818QAHm4I94KAJJYAgTQ1Y=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ADF+yvxfx1A4R+bAioj9xa2irE248Z15bW8k/JkI6Cg/WhzrYuXX3GdAHCAaHtoi1cNQLQ+s66b8P03889we2yjbCIndkUrlfVU7onwZ/GjK/4cYpyHpy7Y8U76soh3wtY7O8keVI07LDRarmY2+uOiLmb8rB0m6iyxJvt/Qp3Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=G7bGmKFO; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=eCPgdlsk; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="G7bGmKFO";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="eCPgdlsk"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63O7ei7e1888426
	for <devicetree@vger.kernel.org>; Fri, 24 Apr 2026 12:06:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	6dI1QOSxEriABwJ5SPtLm2KbtT+ofNHypYOaGRXg758=; b=G7bGmKFOhD4L9//c
	JP0bGqhgJxAbm5ouB8Sjs6fi5DnDxCPrMYiZSMK6hnQBpZHWOt7x7HnrSttVppnu
	GiZKsU64aZqjjer4om3R2A7L7out7yhKttKy+cjrq2Op256KGqoO2jj6ZrfhRLFh
	gfx+vQpMMgPrPtkxkOgXCjeROONG2t39ubkTfuTa0O6o/ZfkkPHV/KBx+9+rMS1m
	9NYmE4/9Bd/emLrEP+7FJjalXkMxL8FMP+DkbYddU4vIitwpip1EXFq4QNm2HsBc
	1bDLmP8QigEuTnfqbPwF80+vSUlOiFoKKUcLEj3U1R3hnu4m2ZXlbFQhhXl4I/pu
	U2sr5Q==
Received: from mail-vs1-f70.google.com (mail-vs1-f70.google.com [209.85.217.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dqp9dvkvs-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Fri, 24 Apr 2026 12:06:26 +0000 (GMT)
Received: by mail-vs1-f70.google.com with SMTP id ada2fe7eead31-60586b8e65cso392386137.2
        for <devicetree@vger.kernel.org>; Fri, 24 Apr 2026 05:06:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1777032385; x=1777637185; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=6dI1QOSxEriABwJ5SPtLm2KbtT+ofNHypYOaGRXg758=;
        b=eCPgdlskSTYdQQ2eIIOW4CY7LFbt8VzgVb6L0eq07s+Kov94S3xWNN0qmhjRGrgKYM
         K4mBKr8SidHYAGj789MWjIN8mELvTXV6tl7DYnL352TF1lUlEcAaWNOTQy7dNbbeUZLK
         nr/+ADOyRqHNYI6DAHE643k1+VjeVgkJcEKH8Kt43UVEreNem1kQN5J+Hxk3QzwsGUZr
         aomM0H4zNKFadc+T23K8qC+GjwHKrmnOOyiV7uavDhjC8Ji5ICokDDrQ98bV+3OoG246
         w1FCTbJW2q/2UerL9Y8XBaTLpJMWgbkFgCVGTYGFiea+IwZsGV6uRgYV0tFhGsGM4+Z5
         vjVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777032385; x=1777637185;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=6dI1QOSxEriABwJ5SPtLm2KbtT+ofNHypYOaGRXg758=;
        b=k3XDXcu8qVzZKCkcj6GmX30plAaR1sNW+fgsRb3mpJx2spodjnUqok8snOBuY00Seq
         uYzk61PzbOy/7HHT3fjOpOANCBA5Oox9cfski/AUPC02EPxx1vmL4vKvHjmiL84zkWJM
         NJHwoIQcxpg7pi+LLa5iiDqlIZIlLY6BROdc7wFJrYE8wO1oeRs3gKJ9x5VEAugc/1PO
         gOjbS7FpMljQOXSnm4EMFQlPxOxM9U/vrtIf/d9hJraV6moPLvURw5qQm3AQaKcT95H4
         Bcp0eiHJB0E4+UJ6iKLXOTskD8JoskoXPAoLGME20vVBizA+34+IesqOv+1ZkMnEyA6W
         lFVA==
X-Forwarded-Encrypted: i=1; AFNElJ9/qdfFW5tRB9iiEcd+ibFtHamNqjfOGWTFk1ZaY0tp6GeMgC2tsuadppAbBSjcU4FddgOczLKcupaF@vger.kernel.org
X-Gm-Message-State: AOJu0Yy1tm18sbYkDb6OptTq21TAmoZ1Q0CmzktXaeRZkU5j3e663F4O
	z7U8GwVTNJ/sBjDDMSz/imRSIiw+fTyDz5MD6aMu5U33c0gHE7fVUxz+QOWO0AqGa4Tq93tI4lM
	J9F+pb4tAHp5VHONkAsYmSdxoaAlTKOb00xzWAxCm4xxumLxWmZRfys35SUWrcg/x
X-Gm-Gg: AeBDieuAnvJEl5QWHTZPxyjITcBecr74m+5tXicf3bvep53O/YyOFQsPXWS5zSz00Qe
	ixL+f+tKsVyZXKwLc2BWPGJ2FFefKCQ3IaQ3GrjQiCKkzAlKEneYLr6qqpxhnfa5vO7L5zU7d23
	ZtJY3Kefkqf0jidlxPAAkxhEtF5Yyhex1P3CQLh1M4WQjJoTmfvkrOxPdYF5snSYDjqMdQfd6LD
	AlbuXRTeLUCtSitjJDjfRyz+pdDEvKwUCHRnE6hojf3z9EqAspJ4HJvGv6lRQcgalQhSx1e0NYt
	q0U/GYD7hHRuoRwMhLS8xQ4y3t8TqUdDNKTcT+DVSY0++x2DykJmcc3ItrFTC5cZo46Qh6Ubz+Y
	7KDzFBcjMLNq/wjqhzO2yj3PFTUwRz0nW0yI5dHPdYWIqft3vi8WX0hrmDdGtKhl3kGyhgbgu/G
	YsSWFOuWNzs3v+mw==
X-Received: by 2002:a05:6102:c4c:b0:610:6eb8:3f8d with SMTP id ada2fe7eead31-616f1845d61mr6166003137.0.1777032385434;
        Fri, 24 Apr 2026 05:06:25 -0700 (PDT)
X-Received: by 2002:a05:6102:c4c:b0:610:6eb8:3f8d with SMTP id ada2fe7eead31-616f1845d61mr6165972137.0.1777032384909;
        Fri, 24 Apr 2026 05:06:24 -0700 (PDT)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ba451cd8205sm783125266b.24.2026.04.24.05.06.22
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 24 Apr 2026 05:06:24 -0700 (PDT)
Message-ID: <c2bc018e-22ce-4cbf-8ba6-b42ce92d034b@oss.qualcomm.com>
Date: Fri, 24 Apr 2026 14:06:21 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 6/6] arm64: dts: qcom: Add AYN Thor
To: webgeek1234@gmail.com, Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, Teguh Sobirin <teguh@sobir.in>
References: <20260408-ayn-qcs8550-v5-0-c90abeb7a152@gmail.com>
 <20260408-ayn-qcs8550-v5-6-c90abeb7a152@gmail.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260408-ayn-qcs8550-v5-6-c90abeb7a152@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: mZf1TXi_wL5fyMzlsdIMJn3dggikLOzk
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDI0MDExNiBTYWx0ZWRfX7NmdPZsol2Jj
 ktJLCYbLN7JYvobg7chvxvpCaf7lGaohQPfBun1Wz/jt8F17E8MDcWNFQSeW3FNyT5zp3Rxwxfw
 Dm/wrPLWdvy7yCXTrHVBjGvhRy4O9k4+igA9sEUr42IF3aC48oHPEo3xwOk4J+CBsBBON9MIXYf
 Ykj+mdnMJ+cJI8fS/0WakDQFzY4jFKEf8yeONxWN9gG7nHDcrb1WA5oUqjhAWjwBgCfkEXzI+sm
 27CljRrRwQPIwWqB7PopR+e7sdKOozJhEW6hryla1tVeznfFpSjeB1J9oWKnWUHm7Fo2Iip3LRI
 yjx3UdCagigmC+NmtZGkzzjixxXYUTaVuujZVNHv5+ASolHSs+y1MXsOqp+InDgrejdUx1gxLIh
 XgGJN1SlVVIOzdQVfsCSC1mbguARCmqHFP1R8hK1NyQAE3HZhQbQFQtE3ikC7MinCvfS2q/RgcH
 7p3wLao3Tw38Z+bThOw==
X-Authority-Analysis: v=2.4 cv=fP4JG5ae c=1 sm=1 tr=0 ts=69eb5cc2 cx=c_pps
 a=N1BjEkVkxJi3uNfLdpvX3g==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=pGLkceISAAAA:8 a=EUspDBNiAAAA:8 a=I5Wf6Tv452McHZCWETcA:9 a=QEXdDO2ut3YA:10
 a=crWF4MFLhNY0qMRaF8an:22
X-Proofpoint-GUID: mZf1TXi_wL5fyMzlsdIMJn3dggikLOzk
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-23_03,2026-04-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 clxscore=1015 priorityscore=1501 adultscore=0 suspectscore=0
 impostorscore=0 bulkscore=0 lowpriorityscore=0 spamscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2604240116

On 4/8/26 9:41 PM, Aaron Kling via B4 Relay wrote:
> From: Teguh Sobirin <teguh@sobir.in>
> 
> The AYN Thor is a high-performance Android-based handheld gaming console
> powered by the Qualcomm Snapdragon 8 Gen 2 processor featuring dual
> AMOLED touchscreens.
> 
> Signed-off-by: Teguh Sobirin <teguh@sobir.in>
> Co-developed-by: Aaron Kling <webgeek1234@gmail.com>
> Signed-off-by: Aaron Kling <webgeek1234@gmail.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
