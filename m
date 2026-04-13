Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4B12F3A4F37
	for <devicetree@vger.kernel.org>; Mon, 13 Apr 2026 08:24:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776068646; cv=none; b=BoCA5BuvwB0KvcWlrmua56j0wwGzVz4CJQUPAiYBoygO5Xl3fG1lCrycY8xz6zJEV5Wo69Wp3zqIKzQ4XsClcMuEwKUYwDfJf+VD2fwmAl0DyIm167xidv6vyhyqxHeQxmmOJ1Gs3nlROHSjALHIrz0sZrVmcxICd5zTQY/3FHU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776068646; c=relaxed/simple;
	bh=4Fv4TzWCTxbFtAS7LD0EXq0TXIBHJeDtcmJzVXsy4/4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=pgy+qZdfNT5PgdbnoKiPnjj+OoOFzsZLlJywY2JtoU6y62VeTr1nUuxwnM8W5XY9NMErh5e+gK/br/+8RHYQi81uU/ARihtDeO36rpcOFSApgZ249HGJxFXxs3Yet0nDNzgy3dvwggq3d6c0JgcvnycFHwK8WgMR3TdUzeNf8TQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=SZ84zmrK; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=bSoXer4z; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="SZ84zmrK";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="bSoXer4z"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63D4jPeD543708
	for <devicetree@vger.kernel.org>; Mon, 13 Apr 2026 08:24:04 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	fkGUvu1zEWd3P4bUIVWPcUr5fHxhDbdoo1VkZGeFlrc=; b=SZ84zmrK65VMu6RT
	mqjhg6/NI4xbs9X0kcixKu4bOa3VfoS+zq36CT0xO6DF8qzdZIHeoAvlWAFOno2Y
	ESFRG7j5y70BQO5AEgUyqfxs3ovJyEZTbHAWtqtOo1NQLfR7qEj9tvnpuAp1BCW8
	y1t2jk+le+FYO0OAGZkdbqXJRSOFV3KhEor/KmInD6tMwtz6SZqHu2OxVLrSa7Bd
	5LD0h9bRc+KKMK/jUkSAwWjh03NLjtBEYL6SGIGM8rOlNhy5SG2NmdKEr3/BnMS9
	B2cpCehKLgso4louoOXclJnR83JHqaIG3cR2V/FDUVfRh3v1GPbjsdTyuGP+RgOF
	Lqd4SQ==
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com [209.85.219.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dfexfvebs-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 13 Apr 2026 08:24:04 +0000 (GMT)
Received: by mail-qv1-f69.google.com with SMTP id 6a1803df08f44-8aca281aaa4so1856336d6.1
        for <devicetree@vger.kernel.org>; Mon, 13 Apr 2026 01:24:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1776068644; x=1776673444; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=fkGUvu1zEWd3P4bUIVWPcUr5fHxhDbdoo1VkZGeFlrc=;
        b=bSoXer4zYUj+ggVZmuMtfTn9fm8dbhxet5fRCUuX0T5UwmeB3hfj9adOLs5LjF/lwM
         HSkmbymPpS/F8im2Os3uwKqfDI8OgSJXH33+GwHH+mXw8k+DRQhVOC9Tx0MuCGpyulws
         fAGc3DSXidd+F6YN5nEwRiZ7tEMb+oyBRhRTE3b94XUdq9n/Tlz6VoC4dj7B6MOn5WHP
         eCyYKSU+/Iyo1rR1FHrcVkjm/eJyZGNx27x156PbJ8Zc8kVpt/Lkw8OTNgaxzD+sWK3X
         KTItW5K9UW3qPrRAm5wbs9dXRBVvv+LlCFBPpiGk2XWI+7emjYVZ9yjP9XUdKzSm8vE+
         hglg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776068644; x=1776673444;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=fkGUvu1zEWd3P4bUIVWPcUr5fHxhDbdoo1VkZGeFlrc=;
        b=mLJ8N3uaEbTIHnH9hN+uTvQZsaHfiH9pjvMBWjKiizMyfFqpVLWSNreHvxjlDBy6+N
         XSZN1GFbNP9xUCbCsgTEAjCce4qqk0T5W8gR7GxHZYBgIHWNzMUafg+UDKRn3puKNMdU
         mEC9XT5MVVde8eST8zOGbw3cMFO957T/8pfRrigxLmaNe+Wq0uUf1O4u1HkIFxxS51M+
         JADJh29HIFFw9Y+b6qDHhF6lG4EXCCNzKAjUm80zRMWQSxs1ybgEDxl93ezm2m93lVQj
         MroSEln3WgNhX4RSLEH8Re+1ih21nsFsYe0VP0oChAdgxi2qM2QF4JYu6hjE0DLZzqp2
         o5Pw==
X-Forwarded-Encrypted: i=1; AFNElJ/WelagIGFw2GE6HCMM+BAc6zcgmSmJsJbv85njE83hOzkqqnlm7Xk7LbQHQWfVcXvR2m+Y8hth0oBG@vger.kernel.org
X-Gm-Message-State: AOJu0Yz5s+qNzdiocKqHeXhRk7T5FqYYHpB/hpML4RS58to218QI0VfO
	oz4dc4CmgKa6HBUNkJ53k7hmBhfLK8VNlcPQarMo6JxotJJW01nfTSzf+USBj1cE0jhVOVWm+9w
	gXGwEmuN2fjXb9Vt1s/igW0Z8fMqHC3SELbsxcZZsDpxzuaMCmGx8yVrMXcmuwllw
X-Gm-Gg: AeBDieug/9QsXB8EZU8eral3DahfQHwBw+IqDaPmLeUEyzNcmOmQwgjYUYoxfTu8q06
	1MySTE0eomGX8h1c8/jxDvRXv6I5B8XWnLBsETyEjPTxOVlXRXHxhySzXjP3QzvTzL22OscV5uU
	RTVy3y2ta8tSlEu34g4qyH8MtVRpwBuTZoFUtfn83NtpN+aW0IExQ4PhYbYsTIcsIz/ZJbZVcDR
	fPu8XMamvtd2ncGaX3151izE6016ipCBIyuQo6wC4NAjoe9APTWKFsyrlyyCNQR6qNhHfsjewfV
	UOVipZfbb41StEmDMC97WN0zhzeriTV3/aK3oeT7PlofsVD0SLZdN9ktnngfjsL7TUx5xIsH+00
	4n/M6Z63CUcgb5uVfnTPd2wRp/CBLuRTRcvDr9K6FCTqvSXQtA92mwdG1zuTT6l47lbztfo/T8X
	MFsJ0=
X-Received: by 2002:a05:6214:2588:b0:89c:e371:2b42 with SMTP id 6a1803df08f44-8ac861536afmr152102736d6.2.1776068643546;
        Mon, 13 Apr 2026 01:24:03 -0700 (PDT)
X-Received: by 2002:a05:6214:2588:b0:89c:e371:2b42 with SMTP id 6a1803df08f44-8ac861536afmr152102486d6.2.1776068643151;
        Mon, 13 Apr 2026 01:24:03 -0700 (PDT)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b9d6dfd89a9sm295654566b.25.2026.04.13.01.24.00
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 13 Apr 2026 01:24:02 -0700 (PDT)
Message-ID: <ecb75ada-60c4-40e6-81bd-fc392007e9d8@oss.qualcomm.com>
Date: Mon, 13 Apr 2026 10:23:59 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 01/35] dt-bindings: qcom,pdc: Tighten reg to single APSS
 DRV region
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
Cc: Thomas Gleixner <tglx@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        cros-qcom-dts-watchers@chromium.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
References: <20260410184124.1068210-1-mukesh.ojha@oss.qualcomm.com>
 <20260410184124.1068210-2-mukesh.ojha@oss.qualcomm.com>
 <gd5ixcfablbyyyz2wdacrvg43jogwg425na6utsgfcterm276k@tdko64tn6gwh>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <gd5ixcfablbyyyz2wdacrvg43jogwg425na6utsgfcterm276k@tdko64tn6gwh>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: PO_fRRLNCrFSPwaA7BFnYNqmwa-eKWoJ
X-Authority-Analysis: v=2.4 cv=OpZ/DS/t c=1 sm=1 tr=0 ts=69dca824 cx=c_pps
 a=wEM5vcRIz55oU/E2lInRtA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=PRTi-mQ_jkB9sSpM1ZMA:9 a=QEXdDO2ut3YA:10 a=zZCYzV9kfG8A:10
 a=OIgjcC2v60KrkQgK7BGD:22
X-Proofpoint-ORIG-GUID: PO_fRRLNCrFSPwaA7BFnYNqmwa-eKWoJ
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDEzMDA4MCBTYWx0ZWRfX43jKRGsxldIj
 KB0tcUebfbjdl98luTCJaBVqk0Vqsg86/IIOC6oi1bgT1NgMHzLbcfZgXyUIjZo6oqZnNtt783O
 zTAjZiSF8LEtuIz1eDfwqPG0itJaR3u58Mv1A+cDlzb7FxWiVSwH5O2fXbxQtQLCZZ0Nxyey91G
 TMypGCQr6AU5HbWKZ91dT6aEZFlczKiN20YF2Ta7ZCWgISBhAHyIbLzjZ1CB10Wb2fxLrxnjgLM
 vCkgDbSjTww0+/WLxKhlIDLH/2bC5dXkLVxSUO41UZsKDebJaoVhdHpL3SqpktSCHKfmWOasm7N
 7HSnvAhsoB+6SU9Lea4wzYHPJ/O2kGvN71oR6MYvdKk8YvOWiM321CbPVHcGwLcgZfecgH64diN
 cY5nDaiUFahnpF9XMWJeVsBXHa/LMiBZc2/A96cezQOBF511+wJYYtB+6pYg0aB9M43LIWoA/r7
 YCcyxNWmNP/Tx9o8o/w==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-13_02,2026-04-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 malwarescore=0 spamscore=0 bulkscore=0 priorityscore=1501
 adultscore=0 lowpriorityscore=0 phishscore=0 clxscore=1015 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604010000 definitions=main-2604130080

On 4/11/26 4:32 PM, Dmitry Baryshkov wrote:
> On Sat, Apr 11, 2026 at 12:10:38AM +0530, Mukesh Ojha wrote:
>> The PDC has multiple DRV regions, each sized 0x10000, where each region
>> serves a specific client in the system. Linux only needs access to the
> 
> Nit: there are other OS than Linux. Would you rather point out that
> other DRV regions are to be used by ... what?

TZ, HYP, HLOS, CPUCP..

I'm wondering if we can make use of the HYP one on e.g. Glymur, to
parallelize accesses (and whether that would bring any practical
benefit).

In the RPMH architecture, each "client" has their own (GPU, AOP, DISP,
etc.). Then, each one of those clients may have an associates RSC
(Resource State Coordinator) and/or anyOf BCM ("interconnect"), VRM
("regulator"), ARC ("RPMHPD") voting interfaces

Konrad
