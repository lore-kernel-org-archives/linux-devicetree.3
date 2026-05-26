Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 66B423E3DA0
	for <devicetree@vger.kernel.org>; Tue, 26 May 2026 11:40:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779795644; cv=none; b=pVHohj/G4pwYfr2f7j3e21tK+TCAZ9lHKFCFyR5kst0Il+J4va5MnHjgcLOLe+5JzCYWzKFM72hW5TifwVHl8sB1hphmpI63UFgzRmXZheVrfgE/CZcpe3jRc9gf9tW7oIrS38dQfkd/pAXEk+g5rQzMzCgiXZLCXLtJP5lG5OQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779795644; c=relaxed/simple;
	bh=JBFoJ4hT1uCX+xbcr1U5qvxYhhuwb/y8yealtvnKI+w=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=FeyGtt5B8laeoaKp2CWkUaQ3lFk5dVEUpEdrTivfb8F/EpM0pp5Keid+YQIcea0v8c42a24xiOiDyff2Gj986EHCrdA5gY1++2B4U2nAxU0mA9bRTNNZ/YeQcDMUbteL+RmAOhbJQdr2IHFEepyg+DjNx8Qz3KjXUQd3qCjoIVo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=lus2Hg6h; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=XCmOX6VS; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="lus2Hg6h";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="XCmOX6VS"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64Q5xl8q1604579
	for <devicetree@vger.kernel.org>; Tue, 26 May 2026 11:40:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	+tG1ClUqOtr5zzIhXyFmFyKGVf7CnvLornGkRIGN6mg=; b=lus2Hg6hWVD/Lvw0
	a/WSuZPrzBJ1wdgjRoztvLzLVSbxIO0b5jdcKAQ3qMz0pKfwnKazFXX+NAv5Uh1J
	GO9Kb+AS1ZSwJglJxzx8xs7SGKmuU2Er9bBh2OrrOTkOT5vZoKzPTGooa87Z7F/E
	Drg2lW5jZdbOkPoeeXTChzTpQrYlsyAwQ+DbBNBLlfNM8f/rFiPJ39n38PJpHh8v
	Ot2p5LuZlmdMov5yDtAu+nI0zGC4xAxL4SpJGRQTxEIXxSlYMArsWioiUFAOLS5O
	J03td3n++mRkTQaYB9Jd5+rpaa1fJtL38M7g4epaQZT51I9uUWe1HPJ5CLSGqzXh
	JilIwg==
Received: from mail-pf1-f199.google.com (mail-pf1-f199.google.com [209.85.210.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ed5v3sbf0-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 26 May 2026 11:40:31 +0000 (GMT)
Received: by mail-pf1-f199.google.com with SMTP id d2e1a72fcca58-82fa6c3a77cso6149506b3a.3
        for <devicetree@vger.kernel.org>; Tue, 26 May 2026 04:40:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779795630; x=1780400430; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=+tG1ClUqOtr5zzIhXyFmFyKGVf7CnvLornGkRIGN6mg=;
        b=XCmOX6VS9Sl7APGJ+zwA27mJcKkSTF8g2qf88JED/ycgdkeitjfe0KqR94CcX7KqRd
         Y0fL8TksQ5ceM3X2ekdJ3VQWrxT2rACDvY9z3t/corBKpg+tu2Da2eZ8BJtJvqhPD+gD
         ATulZRu0GyiEx7pluyW4N4XbkHjeB+Vf9Vp55aqe6eGj2wus1gSlsCo6QRjmG7j6wDpr
         id3zUlbiflyzq7mHy5yWKTj4c0bLiGVAcbgtA845//FQwJQOXwe5AueQznRHEOCtRJjG
         MrxmRCWAN0IIDYubB5Sy12C4pujAzzu7ZNZafYxRIzLBLIYC4bct/qefuX8LOHFkAqWA
         yZ4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779795630; x=1780400430;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=+tG1ClUqOtr5zzIhXyFmFyKGVf7CnvLornGkRIGN6mg=;
        b=P0NXRJeoKC8Dr/Vj+9DKxRBsQUUhnMdrtXPcz2iRJiSDGMcULmbMICwVUybbQ9Gijd
         cJWxXB+dJVrmS7McRr+EezkyxGMIxcbKBaBmPnWCISK35unMTlauMBNAbqKQN9Sb5XFe
         DK7iGE7fQpfO1LgfPDjs/LBY7M1L8CmppNyrZH8sb406Tz81+DA0s1srg7AVCymloa0B
         5JNHlPoYXMtDGUNgNxi0VuPMIc/0q0AL6uKztc0dEQr+i8Sb89FX+BnuCupA2nIYqtva
         FVdXs5sKPjWDujZjaVoXvKy+3Ye33fQYHbNa780YICn6oCDODh//GAAjM7MJZRGBLwxu
         9/NQ==
X-Forwarded-Encrypted: i=1; AFNElJ+8NnXJnMOXdrmLgbgPQp48pqwT1LslzG3GCz13MNa5Uj7Ut0/kW8+/SRaxDzLI9xa6eYj1VNoSwW4/@vger.kernel.org
X-Gm-Message-State: AOJu0YwY7LPR4YuJP1pUkZ281/bZIWXjNCpw8W97UmErg+vcGJ6NwxqA
	dn+DLOROv7XY+EJQaE8GZLiqlmR9g2xGGwEFmMNCGJwqhOq9UAX+QNRlUW0FOLabRvtDeIgLQt2
	bPK9NMeHiUAMfj7oRp1x5yz9Z0x6WcgPtOiO+j8moj8iFkR1dIKn0lRqcMvcQhj+2
X-Gm-Gg: Acq92OG4NEM2bebU5XRdxhpNGjnnDqijhC5HyUjownctBUhQMoPzE/ema5pkUkc042J
	1zjH018hR7IhJfN3GzUQYZRY6vOgpqFV07v0Gjwi8kwGloOqdUF3FmUj8QqGsQppEEBBUBnSr7U
	Sq7idiBrbPqVsXSkeTmsoY9/DxTrJ7Jgk830KHqKTk2/YQrUb6fEZm0kyPAbfJtcfqoUp7fyQ74
	XhnnaQG7O7nj5wyjs107e1MLaAeMX7a/02Bks3kice+QozCh1+GVCnHgj/BMqb8jUpDZUcKGJVV
	y4VE34e/uBd8+Iqs0g16U9XsSr8ksm7xQX7LhQm3DZ67RGY1vnBd/f2vmhCgXg/D1KlkGcBF/2d
	dBXHiRzjODnIgmnZhnDUhvrZX6Phn9El7pQacGaTA/KVEbb6m
X-Received: by 2002:a05:6a00:2384:b0:827:4bca:f1a2 with SMTP id d2e1a72fcca58-8415f0f02cbmr16834779b3a.10.1779795630319;
        Tue, 26 May 2026 04:40:30 -0700 (PDT)
X-Received: by 2002:a05:6a00:2384:b0:827:4bca:f1a2 with SMTP id d2e1a72fcca58-8415f0f02cbmr16834735b3a.10.1779795629827;
        Tue, 26 May 2026 04:40:29 -0700 (PDT)
Received: from [10.217.216.23] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84164b1b3d2sm13869414b3a.26.2026.05.26.04.40.24
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 26 May 2026 04:40:29 -0700 (PDT)
Message-ID: <59167c7f-c758-4939-b760-b6de78c22359@oss.qualcomm.com>
Date: Tue, 26 May 2026 17:10:22 +0530
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 0/7] Add support for Video, Camera, Graphics clock
 controllers on Eliza
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd
 <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Maxime Coquelin <mcoquelin.stm32@gmail.com>,
        Alexandre Torgue <alexandre.torgue@foss.st.com>,
        Luca Weiss <luca.weiss@fairphone.com>,
        Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
        Imran Shaik <imran.shaik@oss.qualcomm.com>,
        Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-stm32@st-md-mailman.stormreply.com,
        linux-arm-kernel@lists.infradead.org,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
References: <20260525-eliza_mm_cc_v2-v5-0-a1d125619a5a@oss.qualcomm.com>
 <27l6r6gp6zpddgkxne7jasjxamy4dmdkwg3xyp6hrmdbtk7mxj@jxsgeq4yvfhh>
Content-Language: en-US
From: Taniya Das <taniya.das@oss.qualcomm.com>
In-Reply-To: <27l6r6gp6zpddgkxne7jasjxamy4dmdkwg3xyp6hrmdbtk7mxj@jxsgeq4yvfhh>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTI2MDEwMSBTYWx0ZWRfX6nV3QGtpW5qT
 7dpQWzESntIQ+6eqCcuVr2fM46JoNl1H3ZnCoGgVj9as6Bpg/trOLK6wh1shHYWYA6mDJ48ucba
 G9RCGggKSGKShALzEa6qPx6ItTbnyXvrNwS1Rramew8JeMsO6SxujFhNzvdfPLMYYf+pA9hV7Mk
 h7w3Xib0Bv5v4dBpnFltQhPaNJAcGO1hjzVaEuzLtc3zT1y1QuEWXRw+crGdLZQsADPc3VsKf4m
 TGxAhhsc3dod+SM6BGK3xuwmNxeo/tulgDKn2p38phbKLe6H/QYFJ8scTd2Pd/MCwmCoUb9DzSn
 5UDm95dao1USVv9TW7pecf7hWMDQbLDl/jbExtyjWidxdAIVeZGIpK8AiuH4DBLgSrT2acfJTMx
 UaHpk6XNcOrNSNA0tydS5XKBJMFkDMQdW8E+dNzUc2tXLnWwAsx8uxDMpZBA/i7Ho3dHmkmhtx3
 chMExZKhp7y+KxYPETQ==
X-Authority-Analysis: v=2.4 cv=Zc4t8MVA c=1 sm=1 tr=0 ts=6a1586af cx=c_pps
 a=WW5sKcV1LcKqjgzy2JUPuA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=SSzA4h9mN1o_gDQ-MaQA:9 a=QEXdDO2ut3YA:10 a=QYH75iMubAgA:10
 a=OpyuDcXvxspvyRM73sMx:22
X-Proofpoint-ORIG-GUID: NwoBNpfame6wMoQUTp31ICOOkHryXEfU
X-Proofpoint-GUID: NwoBNpfame6wMoQUTp31ICOOkHryXEfU
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-05-26_02,2026-05-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 spamscore=0 impostorscore=0 bulkscore=0 adultscore=0
 phishscore=0 clxscore=1015 priorityscore=1501 lowpriorityscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2605130000
 definitions=main-2605260101



On 5/25/2026 4:43 PM, Dmitry Baryshkov wrote:
>> The patches have been tested on Qualcomm Eliza MTP board.
>>
>> Changes in v5:
>> - Taken care of comments from v3, v4.
> Which comments? Please be more specific in changelogics.

Sorry, my bad, it was the 'sashiko-bot' comments.

-- 
Thanks,
Taniya Das

