Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793185823;
	b=nHF3vdIwpiLHXICwd7QunH/GPUyBzXm2xVzNdU0SJvnbOcLI6434At8zWsAHay79bpc7
	 TIT+6XVrWVjAuNFqF5uYlHmHY9roN8lB39dTQtzFdi0buc3lBkU/NDn2dIm0cjHPr2deI
	 7uPAu/BC3j5L0lZptSpkU7/ylZpwttF0WfADFDCAbgFLgehnsuEEu2HrrgRk67b/pqBoa
	 iHAc69pgudHr3Azto9vkC513DPbRnTI+HYCuTy8m2LPpEivzd4D7h/Df07ZYrrRFIFrP3
	 prJxTq36KJpvfXvEwAI/wA7PW2PfWZe+iDLwCZyPB5SvaEhkZZ9r76+JDbtBhUCphvA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793185823;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Authority-Analysis:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Info:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=5zvZtmIGa6NExyZc8Y5XlEQJuWyGr6+9vTxKDmPXbhw=;
	b=LMFfxwmpMTNuGzze+9yW7gilAFQxDvFnwgKtb96g/35SWfIRXjeXmsNOiWwRZPOerYV0
	 rGiNk2ljM//NN7KEf4MWzA6GgvG+KkdZ2ag/uN4sR0KE83NxtaIKOqTN6lsrjbB/QorPx
	 QMb1Yb/NFAJPkopXPCUQMqUtMAkUm0WSzdhTwvi+NFzXXvfhkBBPB7jZMoVRisAf28mpR
	 /zMsr8NLrPHckRK5AJX3imqshs/ToB2YccjIuPIzzU+z0Wl7MtRIBLIT7wJsLAi/3IAuY
	 epUqrg6aTuoZ49d78PHcKWHmVfsh/Ipq0eyGbHdoSQ7qN3kzbOWVr1VD9N7TBojbsTw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=B0W7TcKH;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=ZY4+pEw4;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 40070606A31E
	for <devicetree@vger.kernel.org>; Wed, 28 Oct 2026 11:10:23 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 40070606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=B0W7TcKH;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=ZY4+pEw4
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69S8Kons1101731
	for <devicetree@vger.kernel.org>; Wed, 28 Oct 2026 11:10:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	5zvZtmIGa6NExyZc8Y5XlEQJuWyGr6+9vTxKDmPXbhw=; b=B0W7TcKHoZmbnhJe
	xQfsL+9qVBpPiG60ubo+Uosw2UOGOOoKXBeZh5hH3inv0s58sOmmqNHyUlXMIt9W
	pLfkXADu7oN2VeCVl46ylXB2aUra8H2RKSnyMkun8mLBQpDjF+Bd2wXqK+Ww6ID7
	TKS1LaQyocGLdUFvvdfEamGdbGvBoGIjAUF3Ej5RdSTzN8hqOb5hQL8/oO+y4yq+
	y1X5jw/q7d+1ZoU7CuXD9GHq6vZCr5TGXUkk08beAEvFgNkYw1PWbVk3MzwrQ7A5
	bX5aOJqZpi/Lcx04rzwVTIQz3GxW2hemDD1TucrOve+NhzLToh09eNK0337bMRES
	I5M4BA==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hkdf7rm03-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 28 Oct 2026 11:10:22 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2e9995cea88so7748595ad.0
        for <devicetree@vger.kernel.org>; Wed, 28 Oct 2026 04:10:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793185821; x=1793790621; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=5zvZtmIGa6NExyZc8Y5XlEQJuWyGr6+9vTxKDmPXbhw=;
        b=ZY4+pEw4xzKAWRqaz6YQc/58Jhb5Oujb+SQ0HOxom6x8U48lpwMndD66APvMfBr1Dz
         k7tiOWPttHtfrtfMZ1XfDMwubxPy1blxjcN9G2t7hSCJXyKF9VjriPUJvdVXXf4ICWR3
         +zG9O682HLlIGWRDh4x2z7WEE9eDTvlF/QfU7SCUrQ0N6vpyq/zoqPzAfEx4oHcX5LvA
         Cm9bGwRbvTPB7BHX39nU0waqT32bsYmMSCpiD4iYr6m8g7IOGVQnf9s8lsXV72YuL4+U
         SRcnJUPgrGu7U0ad+5m1x3lyOUqMR+Jo9T6JA9nqE7a7+BWTk4PLmdaBPzNpOMh0/yGR
         4PsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793185821; x=1793790621;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=5zvZtmIGa6NExyZc8Y5XlEQJuWyGr6+9vTxKDmPXbhw=;
        b=pJHQ9XV6Uuh0swh9V/lELBR6k9Zc4Cx8NcNHnazH4b8BFzzYcJaEWdNb9YDSEa3F0N
         WyJB0m2s7DX4UFou6rzF4j+CsezWPUeB8g3rUG2rG5aygl7IporC2g0xlkUNckPkXmDN
         Br2NznhVvi0QMHafQ06KT1qLvDYRPtVlb+kuwtvsKgWJts9iTgdcUtUMxlsa3Sparr0Z
         MzChRU2C6rWig2oI6DNjfz0P+HfJu3A+o9hKiSjdQ7wtG8Fzz4/ejq1CNdKRu1nGxffw
         0E/d8EVazRVBPeZOPkRIb8q8/IfoWopNWH9e+u0Bso1T8DeyycPA2mzBI6SAfU4y2D3W
         r2eA==
X-Forwarded-Encrypted: i=1; AKwUvBw5HefjrZlF5n4avyRSY9b66c8kmIhWz5ZlTgSTUUbyGK+Gnjpm1o2hGd0eBUpfVJn7ppOxNZ5qQaOH@vger.kernel.org
X-Gm-Message-State: AFq9FYLS+QdnrEVqrnicmp0sAUijo2C706XrdiieWnCCzo8M/AP2UKFA
	BmzHXdr75Qd1Dfl6j/f9fj/+hzNj6h38woI3o1gJa92e5sHOl+iOEXZibo+/OX1Ag+ttyv0W16Z
	MKBGUKH5W4Vzbt6KdD4paboyEiUw4rLd81cAN3yljo0sYTbz9wjAP8Knn6LE24KS3
X-Gm-Gg: AYBFou0vJvS7StChqMDo6wJFnefoMaTb9rIrA51gsWmy35RaOdP/nTwX9vkVcI4qspc
	KF7MVblF6G+2OS+7ugwCBCnTPbNw+REy57ydCXr7Yb8FC1UXXTFR0iXyKeFqM8Jqa5FyOjXt22j
	J6EmYLmKoB4fI/z6iDAqUA3/P4u53AonLLadXndV325WcJQ7B+w6GZD7TqVoqMUVoghdhNGvysa
	zf/CrxKwrVIo+DCE22LNBTZ9DBWYZmAlivlZaIED5jPeH0wJTXxs8sKOCQXZFxDoQh5nExWJd1Y
	uRklARac0WElzzNgAdjekFm/wHWlN/Irqpv5NNzN3PryYlhEnn1uzZjaHTFhtgrOz1TTCKrkWfX
	BdY1hTQHw+T2CxrvFF4c+D3pKBjwPr3vrVurGiKks8GS2BreZbeVI/dP7IAcJUqA8n/Li5GQ1kx
	yKEV1GK8NDtPlqjjCdicsCg6UQRZ8jfdf3mn0uQcPz3M5Kj4ql2fmMcHRcgdbGV2WgXl7vGOT/y
	pP9
X-Received: by 2002:a17:902:d50c:b0:2e8:3d48:4d88 with SMTP id d9443c01a7336-2eb00242781mr19066275ad.7.1793185821166;
        Wed, 28 Oct 2026 04:10:21 -0700 (PDT)
X-Received: by 2002:a17:902:d50c:b0:2e8:3d48:4d88 with SMTP id d9443c01a7336-2eb00242781mr19066015ad.7.1793185820636;
        Wed, 28 Oct 2026 04:10:20 -0700 (PDT)
Received: from [10.149.108.218] (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2eaf77e70d5sm13979695ad.75.2026.10.28.04.10.12
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 28 Oct 2026 04:10:20 -0700 (PDT)
Message-ID: <4a51422e-01f8-4651-99b6-f7d3fcc588d1@oss.qualcomm.com>
Date: Wed, 28 Oct 2026 16:40:11 +0530
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 5/5] arm64: dts: qcom: mahua: Support GPU and GMU
To: Akhil P Oommen <akhilpo@oss.qualcomm.com>,
        Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov
 <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>
Cc: Krzysztof Kozlowski <krzk@kernel.org>, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Jie Zhang <jie.zhang@oss.qualcomm.com>
References: <20260925-mahua-gpu-v1-0-0fa0bfd8d315@oss.qualcomm.com>
 <20260925-mahua-gpu-v1-5-0fa0bfd8d315@oss.qualcomm.com>
Content-Language: en-US
From: Gopikrishna Garmidi <gopikrishna.garmidi@oss.qualcomm.com>
In-Reply-To: <20260925-mahua-gpu-v1-5-0fa0bfd8d315@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=M4bYuCws c=1 sm=1 tr=0 ts=6ae1d81e cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=EUspDBNiAAAA:8 a=VMI7CB12i6EQ-IQ_HUsA:9 a=QEXdDO2ut3YA:10
 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-GUID: mGyX721dLY0xHw71F7Nv5cheVYdGNxIC
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI4MDA0NCBTYWx0ZWRfX4BWlUUYw+uSm
 /q+zzA94JfuKlLs5OiRGtyuNhYY//vtrNLihbxwKzkMb9Y/2vGxuBzW7DX/WKf3sVAdDL0caaCj
 OaN8sDGNsvIELz3q7Ha4pOF0OdQjvNA=
X-Proofpoint-ORIG-GUID: mGyX721dLY0xHw71F7Nv5cheVYdGNxIC
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI4MDA0NCBTYWx0ZWRfX2oAI6he5FRoN
 TomYRNWaRxOz7Fuk/mzepD6bflQakUlI98HC3L0OFcX1DjwCTnfz5bSHKS8psymKVwJMaAG+z4q
 P4MZHWFXNRXoe9SKFrX8t9sGAnGw558lN4MNgeQUIQYrjZPgFRal+h9e6YozZCQ022zqFt7CGeh
 iDNilt/melrfx++m99Mlfk3htCouXS+va+wAxJ4UkAIGAS70WDxm5KPx9jhrLmGLl60teByoaer
 tQ22CBmfkvNpfRoAOqJecqbbOLG7yKAObna+4es/D5N5akhZSLaZHlxnCFc7TD+cG6JvLjF1xCj
 L/vydl65VGMeBrKeYFamQtzIoTR3Gcgstu/wLDALCeJdjmqVkVzfjPhPy/hitxjD41lC82vWLvu
 c4MtZ8Ag47cnQKH02FD8I24SV/XFNttsmTIBDD7m4pX9RX8JYeB3HFSoOkjfVpHST4aayR72DC0
 WgbtBqUojMS94iHjtbQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-28_03,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 priorityscore=1501 clxscore=1015 impostorscore=0 malwarescore=0
 bulkscore=0 spamscore=0 suspectscore=0 lowpriorityscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610280044



On 9/25/2026 2:44 AM, Akhil P Oommen wrote:
> From: Jie Zhang <jie.zhang@oss.qualcomm.com>
> 
> Mahua SoC has a new GPU called Adreno X2-85, a slightly smaller variant
> of the Adreno X2-90 found on glymur. Override the compatible strings to
> correctly support it's GPU and GMU.
> 
Tested-by: Gopikrishna Garmidi <gopikrishna.garmidi@oss.qualcomm.com> # 
Microsoft Surface Laptop 13.8" (8th Edition)

Thanks,
Gopikrishna
