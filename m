Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D04013B38AF
	for <devicetree@vger.kernel.org>; Thu,  9 Jul 2026 07:10:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783581056; cv=none; b=c/5WjCbODYMFbaQJomdwMgb1P/sAVzcMZY7H6jDMdC99H6+SS0relabKndoiAwml9sXsyD+p8ZCyLowU9tf+oYACV0BPI2u1CR3f/gSNnQmJpNjiR8SJoclfmva8b4DRithzQXpSngUAYPncKnpTjsKP6oYHkmMfdRt+vOT+IUw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783581056; c=relaxed/simple;
	bh=wmtnvbryyjiJzl7SaPnq48PVp/YEJcRWLDkO8/ccom8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=L/yrmKVSzJ/gYDJBhHgChh/SPUXseRd0cZgg8SWWJ9z3Bywn46WOaqkZby9QrR6LivOk1vvcOoli2xdTCxnApzxCHZ+RcOTd9ZQx+AIfYVve/WtcKzrxq7ajlxDpKPZ25qRME7qp8x+7JFrdUc4uR4TGN6iAXtuCZykt4NveVes=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=cDkLfVkh; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=KkhFxX36; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="cDkLfVkh";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="KkhFxX36"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66960Qms784669
	for <devicetree@vger.kernel.org>; Thu, 9 Jul 2026 07:10:55 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	c4myeLAcS+dyKu9UkU4SatOyxmBrFEX2SbmQWD8dyg4=; b=cDkLfVkhs527DKJU
	O+QN/w2/USalMKEDoO2OvN7LhZkn4A08fvN3Aa4WLtaVLgeb9jzNu4HcB504Svp8
	ZeY0CecU3KyyDLGKdu2Sg9kawbJKIlpPIrJxjlvLcmyTOEk8rK8GDcFDVYi9Njmi
	RuAmWrGQQpare53+2AtVABajcnO3zCXSlbE4npwK26xPjbPDNPGRrFGggmY0sTys
	Ys6boID03q/P1TSN2J+ywReB3fY82v/k+ZWRT1bSBL2yCoCIxohpvn1SCOLNrnRn
	UbKZW+u7HifHmpLinegVYX+zxVL+in0fmZLzwaOdSNbicIffADcFLnfdWY4lsgpH
	QVzgPA==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f9v4u2bhm-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Thu, 09 Jul 2026 07:10:54 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2cca3673560so10582205ad.1
        for <devicetree@vger.kernel.org>; Thu, 09 Jul 2026 00:10:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783581054; x=1784185854; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=c4myeLAcS+dyKu9UkU4SatOyxmBrFEX2SbmQWD8dyg4=;
        b=KkhFxX36oyBAqMnLPC8ekaiZCvKW1Eumslxptaj35bz/x7n3Zo+fH/6nvu6uJ+hVkt
         FbpnA1/l48wAq/laR7VhXDIjUhljZJ9m4SBYRKpGrgKFoAhlHheVfWvwqNUZtQ7J5vqY
         LfAcxIZea4W6qmTZu1tOsMGK38DS2KBSkOokcq7GCrOsE3pokm94W+7V9L/DiKYIrtOT
         /aizszIFgx6o+tqFpUNaZCJJoxI2ZP+uKvCpo0qjvOu0gK+aMgpffIkOlckitbTMkRZY
         1cO5sSzskmM5Fh0cunZgJq/VHrKbVWcxD6AIAn324JqnV4IHAVp1sGTU5CmT3hanvsE3
         6mhQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783581054; x=1784185854;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=c4myeLAcS+dyKu9UkU4SatOyxmBrFEX2SbmQWD8dyg4=;
        b=EZTI3BpoCr6ZLWMz4jz6JgbbYA8cN7Ejdu4j5FSl/Pghg0App7rITLiRdju3jFtCDV
         q3N55tkdij6KMavff5HBNLEIuYeNjt65MvwaRfbhXRl+68MN4tctoJAap8ganXtVb6AI
         L/n1sJt6FZQMvtLryauqUV2iyQ6a9PkEUxKxBn4O6IdMzA37AHKxHneWVnQSNNxuujPF
         s+27kIWf3Ar/MYiEn5hKqfvVoTxG9EkS2bByvXWAGn6eYQdX3psiyirQV+M/txC8Q00j
         kfGZzhNVIVK1HJMXjWUk6C0hjz6D5gY4YHwjFqxUi5jZAG5QNNnOKFo4J7KCiJdbCLoX
         SYOg==
X-Forwarded-Encrypted: i=1; AHgh+RpMMY2zVqQWMIu7F2B2hmHEsP9+a09BZYzFDUoqWvmSwB1/qrcMw5WnlkCRCnJ8aSDspCMPuTm4T17S@vger.kernel.org
X-Gm-Message-State: AOJu0Yy0ew8OSzCZ3z6R9sI65PxoFLRW+1zIJBgUh4axhmcyYfZE+NBr
	chZhkSPqLLUy3/b30bv4h7WO83rF7K90hIWmlL4Y2NmlmQ3IfpTziEYlOEj8CXRzUL2KZsqigH5
	RFfdRV4eGYnPehYjlE9zopJw3cxXfV9eu4AIvfrjc7dzJNG9YSJlUfwarDAIJah5q
X-Gm-Gg: AfdE7cm/Bz1h8QFEABQdyMyqdrkRFnLfZn7PHwfLipBegkE/TTFAXOzgjAmnGmqyly0
	MHhgGImnYtM7C5IxDZo3ppaGUodxRZ3gRv+MwxmckvldEAmYZ33W/OYDK9oXMn5E8Nyu6VxjAZ3
	wAlDJf3RB64w1jwiPo27HjETSJ90HUCsvxQRahoQNFz+rSCNsPwxkU2vhqZvsOl97o09lE7uzMW
	N65y3M9cIR/YkmtvDFuj4KOijgRVh1SXKX5Z4r5iHXMlNR47dKmtg/TmLz2Ikc9Me2S224TTJa3
	RrB2ZtMteB43TmCmoNYSHU4ivIM1vl1Rhw2IOTG5YASDGMFQzQjpXvTUaXIviaisRmFezEfqBYV
	LdlxiJmVhr7vV585DCbrmh6mCcMslyBGIDrTijGAQ59wkzE+0SQ==
X-Received: by 2002:a17:903:1b0f:b0:2ca:481:de45 with SMTP id d9443c01a7336-2ccea37370fmr71589365ad.6.1783581054351;
        Thu, 09 Jul 2026 00:10:54 -0700 (PDT)
X-Received: by 2002:a17:903:1b0f:b0:2ca:481:de45 with SMTP id d9443c01a7336-2ccea37370fmr71589135ad.6.1783581053936;
        Thu, 09 Jul 2026 00:10:53 -0700 (PDT)
Received: from [10.218.21.154] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ccc9d1e0c4sm39237515ad.49.2026.07.09.00.10.49
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 09 Jul 2026 00:10:53 -0700 (PDT)
Message-ID: <355e8208-467c-47dd-8a2d-63de6a44abec@oss.qualcomm.com>
Date: Thu, 9 Jul 2026 12:40:47 +0530
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 2/3] ASoC: qcom: q6apm-lpass-dais: Add MI2S clock
 control
To: Mark Brown <broonie@kernel.org>
Cc: Srinivas Kandagatla <srini@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, Jaroslav Kysela <perex@perex.cz>,
        Takashi Iwai <tiwai@suse.com>, Krzysztof Kozlowski <krzk@kernel.org>,
        linux-arm-msm@vger.kernel.org, linux-sound@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>,
        Neil Armstrong <neil.armstrong@linaro.org>
References: <20260706132009.1496321-1-mohammad.rafi.shaik@oss.qualcomm.com>
 <20260706132009.1496321-3-mohammad.rafi.shaik@oss.qualcomm.com>
 <36d2cb00-81e1-47d4-a234-47feea11a351@sirena.org.uk>
Content-Language: en-US
From: Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>
In-Reply-To: <36d2cb00-81e1-47d4-a234-47feea11a351@sirena.org.uk>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA5MDA2NiBTYWx0ZWRfX/K4efBdwLtbg
 CcbLZPspnjqrj+9ZpyHgbvOUyuw1WtuhqTFhjYa5CPXt7ZYpNna8qNEpazyfKHWNorAO4bSBaIj
 H8sQj9pzdURsnZjeRzDHnfxVtoY6SI8=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA5MDA2NiBTYWx0ZWRfX+N3jNHksiYmt
 UVwY7OLe0pujE9SGn7xqcXws0r1pXHWVIIjZCr1S47gXkwb6s5QkSQZIBT3CVgqWrfhLWf7fLH0
 g916bBK21oVamztevAr2nnIfXBPfCVEjaV32nAqNUAYjVIbSSUrjktSh+/Q0Y6veYrZf4WZOzM2
 RC8CBlMFxgAWXwg8lrYS/ihDh8BL156c3HmH9yGn6q42fYU9UE3mpFitRzbxeSYkVcTHSbfgZaL
 PX83MR9NhULZ+DiSqJ89PStH5wtiAUGGlMTVeX77trt7RteqTNfP7uLAk7DOOcYxWiUHBQyWBLr
 UCHLSVagjrT65HrEOLq1Y0EI5XvO5ORFtHmE/zefauIs3F90A+BXTzHObY3GFvr29koNRyIoSDT
 yQxLcr4ADvo2u8dl0wKIQjqUeoKjNa1CRoGDldyxcZwYV5sp6ZfofcbeKgrxWvaMaant5Hvx8ar
 d2evyuhnVfZ2f0+sE3g==
X-Proofpoint-GUID: CNW0yVzVa8PEjmAIoreSQ1ULnQRmW_cx
X-Proofpoint-ORIG-GUID: CNW0yVzVa8PEjmAIoreSQ1ULnQRmW_cx
X-Authority-Analysis: v=2.4 cv=QoVuG1yd c=1 sm=1 tr=0 ts=6a4f497e cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=Q1EBz3ZnqiQg-LZ14swA:9 a=QEXdDO2ut3YA:10 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-09_01,2026-07-08_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 priorityscore=1501 adultscore=0 suspectscore=0 lowpriorityscore=0
 clxscore=1015 bulkscore=0 phishscore=0 malwarescore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607090066



On 7/6/2026 11:48 PM, Mark Brown wrote:
> On Mon, Jul 06, 2026 at 06:50:08PM +0530, Mohammad Rafi Shaik wrote:
>> Add support for MI2S clock control within q6apm-lpass DAIs, including
>> handling of MCLK, BCLK, and ECLK via the DAI .set_sysclk callback.
> 
>> +static int q6i2s_set_sysclk(struct snd_soc_dai *dai, int clk_id, unsigned int freq, int dir)
>> +{
> 
>> +		clk_set_rate(sysclk, freq);
>> +		ret = clk_prepare_enable(sysclk);
>> +		if (ret) {
>> +			dev_err(dai->dev, "Error, Unable to prepare (%d) sysclk\n", clk_id);
>> +			return ret;
>> +		}
> 
> clk_set_rate() can fail too.


Will fix it in the next revision.

Thanks & regards,
Rafi



