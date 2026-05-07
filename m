Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A13BD30C60E
	for <devicetree@vger.kernel.org>; Thu,  7 May 2026 08:02:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778140952; cv=none; b=Uo9PSHRpM0jFjiYsb/TRQG9n2/nOvU5/OoDoB0w2eWnCcNAv1HPVpbWysrKqzCZ9Qz2RYarAhpqTXU9qtl8xNGxLOgeE3k2lqi5pHgpKbDbQn3wmUjXg9Uh31g5jlb7gl5rwQmZV38cQaonTve11D2yyL2IskGKNJGSOrLGKwwg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778140952; c=relaxed/simple;
	bh=fWCWn4DKAbxJbMQ55/WJyCf/z5nsIopkXBwEjkA/RCw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=NBDtuRvVQJmhbhlOG+AVwe3e84Mgu/ECRpyW1tNBLnOnUqMK0JU23iuACEBDrXWG4caw/HRoOKV+KurZCjerCgjeRt1EwhhGqFJ8qQM7ok7s/G9u+oL+fDSi0BGmTWQ9vTJrHsq6hiZA/IaezzP6HVVC6HELkz8mKSc/7vqm004=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=bMA9nIsL; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=fHM/21RK; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="bMA9nIsL";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="fHM/21RK"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6475wWeO1926339
	for <devicetree@vger.kernel.org>; Thu, 7 May 2026 08:02:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	uDM5x0G3BeJBlZvuzxy44IohP/P8rL00g506vuvpl4c=; b=bMA9nIsLUBpSoodC
	d0tMJPtvfYgT921+6rsG9vWTxr8oGs7wPHYi4ZLz/iZ25je3yN7kWnwVtZ5f9OdM
	FfTXOxvBsvhG1rFYifyuVQJG5ore47/MtqRWi/afr9KKdvuKtPmtM9Sgan1diGa3
	fHqrupKxypWKEZKlfxEKPx0J4GuimDPnjeNblQlSc/KVCDJOXbHJNwBD7mw75vX4
	t4u7+nkrvD64oJNB6ZY/6jyb5oX98BDb6YqMFQhApIqf2frM/nY3F3FZj7SKh5y8
	J2UT6ZyNo+fhh1nKcIVjivqZUrbkCdoIc+nttc38cDZeQBOjYK8gdpNgUri/nb3j
	H20bHQ==
Received: from mail-vk1-f197.google.com (mail-vk1-f197.google.com [209.85.221.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e0n2g8f57-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Thu, 07 May 2026 08:02:30 +0000 (GMT)
Received: by mail-vk1-f197.google.com with SMTP id 71dfb90a1353d-56f6ee26adbso61832e0c.1
        for <devicetree@vger.kernel.org>; Thu, 07 May 2026 01:02:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778140950; x=1778745750; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=uDM5x0G3BeJBlZvuzxy44IohP/P8rL00g506vuvpl4c=;
        b=fHM/21RK2hhpD20ygkPOtIBMw41B6dUDGFRKzOW2lkzUay05lEZpfyD9mSlOhlG94V
         7fvjpCg4egORH+zv8xvfT1VN1Vt7qXhJbgWI/ydKahL4yfefQqlgWcvkxdLGeAh6Z6x+
         jQZFsbV7CuIb8RgRejlhrzQR4hFKVjTGJIuJ+GQG+4XHtVkC03CNQXt168zlrsNWM8hm
         mwpSQupatwQzbhBj1QtPKVDov+2psZb+QqI3ammlgF0ZRJqRsoMaW2qi/t+7e4k4Xywo
         PZt/IndBAfVu9hd0PrayejXkqsoDjk7wtfWjag52QGPyFPZx1WhJijmtX232n2F/HBLU
         tV2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778140950; x=1778745750;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=uDM5x0G3BeJBlZvuzxy44IohP/P8rL00g506vuvpl4c=;
        b=NhJYZooYySQVbK5hqOChk2hEjJ1elJNMbbjOmuaslp5FxyrKEekUYV8LUYf1hSfVbC
         lsnV90KTlO2TxnH9MwZA1KBkF5KhPlY1XgEjw0hs2RLNiEsbGes5JQhCmwpEA069tHRL
         GruAZkVNsqCptvwPNIoezo5yT/Tf8hTw1ugeiYTW0utu6UgI2WdAj1/2Y51yGQIxmLaL
         j//NLZq5Ke8xS6Pg03tbfYgBoSbk0ewWm6d89JdZsMVLIB1Vet/06s234k30UBfit4a+
         KufLjtJMYrtDMS+KeM+aYtF645DV4KrhZamDnfmkauA1MBWvtoRAFwxO/On/ZHmlVoef
         Lo7A==
X-Forwarded-Encrypted: i=1; AFNElJ/GuE3PRn4vIjIraVybBS4CVGDkw8HgC9jo5GjajWBfiefo4QlVQC1dDBz9ddMsYaJHUECo+rq5IB9z@vger.kernel.org
X-Gm-Message-State: AOJu0YziJfdAW4cifM5lH25xkQFaZd0w9WVciIo1IJlyiSv1tB0I2b9b
	P/+vi5q2z0UcYOAJJjqOq3FGNBts+FzYvAk1mlTHtu+cv4a46Dsy9y0FAVQyu3+CrU6R9dnuF1G
	t7i1m4THci3KlQbfb3Bcye7ew7E2k/48NJSJxc+LX4RA7RLsbHdjIOFi6/7vLcNtC
X-Gm-Gg: AeBDies1OqSN7+ngHqfN5hMgPjh7gacB2Xh8xCUFCNAzBDU69LmME+LsD9WwaULt2uc
	UX3sYGwQ0FPF+5/DLN/ht9wdyctr/PG84BFGBh+7SgUotqnwDADV2qdBuBm/9JzzRumuPyDzejM
	qvmf17SwsXu1UizSyzclv6o5k3JJjbMzc4VD6OHxHagQuClDqRwdnO/5+X6MtiO4faTWnvvXyy9
	LVXCSSF0WlWrL5gGRHj+DrjwiBG5JvftQjnHsutaHrvWZ19x5oq6vR1JX5cFljXZaIiUP/BFD95
	ooQUzq63KmGPMzB8uX+xCBywJ1NoI77Y3ilx001ai8n7llziAMo4jTkxqnhL6LSkjLIrEFoPssa
	Nb1Z5LrD+t6gk9ydGVRiNyUbiwQxa8N2V9l6dnDGNmFEtyMFi+r7g6tluaPNYDM9ILYuotMW7Ck
	BHivhiow0ktQDxOw==
X-Received: by 2002:a05:6122:3b82:b0:56f:8cf9:33c8 with SMTP id 71dfb90a1353d-5755968732emr1762273e0c.2.1778140950045;
        Thu, 07 May 2026 01:02:30 -0700 (PDT)
X-Received: by 2002:a05:6122:3b82:b0:56f:8cf9:33c8 with SMTP id 71dfb90a1353d-5755968732emr1762261e0c.2.1778140949657;
        Thu, 07 May 2026 01:02:29 -0700 (PDT)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-bc8341e64b7sm51465866b.48.2026.05.07.01.02.26
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 07 May 2026 01:02:28 -0700 (PDT)
Message-ID: <9afad9a8-f25f-4cc9-8af8-047fb46ae5ff@oss.qualcomm.com>
Date: Thu, 7 May 2026 10:02:25 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 01/16] media: iris: Skip UBWC configuration when not
 supported
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>
References: <20260507-iris-ar50lt-v1-0-d22cccedc3e2@oss.qualcomm.com>
 <20260507-iris-ar50lt-v1-1-d22cccedc3e2@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260507-iris-ar50lt-v1-1-d22cccedc3e2@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=Wv4b99fv c=1 sm=1 tr=0 ts=69fc4716 cx=c_pps
 a=JIY1xp/sjQ9K5JH4t62bdg==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=EUspDBNiAAAA:8 a=dl9dPoTF8b8Ju4ANzBEA:9 a=QEXdDO2ut3YA:10 a=zZCYzV9kfG8A:10
 a=tNoRWFLymzeba-QzToBc:22
X-Proofpoint-ORIG-GUID: sPABvCfpx8sfCBS9EMwDJSHQkf-R1l6h
X-Proofpoint-GUID: sPABvCfpx8sfCBS9EMwDJSHQkf-R1l6h
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTA3MDA3OCBTYWx0ZWRfX1tsBAQGYZ2M/
 hfG+zT3O2aH611qYDHTN4eRbe5B4578FFgpLpaBjPJS9QYe+ndxOtljSEUjkmFMmeQmo0+yUuoU
 TspmnpEAVBwfUleSffcppAfe1HZ0xJgFwgmHmA70rZHOisd5p5pU3JfD8whnY51ZwvA1yRfp7XI
 wzArtzLcivbe1nehRtq7GOJ67JTdEJZmXracgnL4TeYR3ASnhOOkOFBQ+gDstqyKoPoddWnY92H
 CJXoVP3p9jEBwInUbl/791D/N5CkbCfD/ykSzYujX9tng7zz7kQE191RfoHWm7YOX9CzjErSFKF
 GWij2f9kS+qR37GOKpwAYVF+8fsL0uoyGSyxXSLQwJRiZ4w+zCatAqueFnh5Y2nrTSbr9NlgFXf
 F1dzvTLCcHJuMv4CvAIFGyZjmKqDDPs13vHS04z1jdXuJygZIn82AVcmZFbeY5RMyd1Eg+Q3XzL
 KCtTk7sZCV3NYg8aiVw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-06_02,2026-05-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 malwarescore=0 lowpriorityscore=0 suspectscore=0 clxscore=1015
 impostorscore=0 spamscore=0 phishscore=0 priorityscore=1501 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2605070078

On 5/7/26 8:42 AM, Dmitry Baryshkov wrote:
> From: Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>
> 
> UBWC configuration is not applicable to all SoCs. Add a check to avoid
> configuring UBWC during sys init on unsupported platforms.
> 
> Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> Signed-off-by: Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
