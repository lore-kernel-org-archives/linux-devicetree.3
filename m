Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3DAF9242D6B
	for <devicetree@vger.kernel.org>; Tue,  7 Apr 2026 18:47:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775587642; cv=none; b=awkJifpCKvkAFU5qHurpPiMyIKoTltIZZyEQ4JFzWl6vHLmGtsEy6ExyFuJuEMWo/ERHZcN7fkLK5WQJgu9vn3aJpX1hIPxgIreeN5xH/AjFFT7DUgHwgn4O1GowkQz1whCnyrjbIDrX2DYX0n8XVwcYNj3Mtzi5p0VfsiyQm/8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775587642; c=relaxed/simple;
	bh=BUTI2FI5DAeRrl2AB6Ysms6i3ByyTsOJvc/eQBCfqzk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=hThuv8dZCeLGO7sAz9ZaMqW1r3yIIxcgH80uDCr5+B8EA1XuG7DiTuYtvehORPLHJYChSJyJxLk4hssy0gsFS9UJKey81g4YgO6o5T2DofXbEL8Re2yh/5Dohw9Z9TzoYuOauf6ZE/324kQCRQdBNxjjCm+JFwVc3HpT4ZU6AfA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=DOTHBGpm; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=HcNPMznJ; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="DOTHBGpm";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="HcNPMznJ"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 637CuiXc3402569
	for <devicetree@vger.kernel.org>; Tue, 7 Apr 2026 18:47:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	kV/sZvlksbOGct8Rbamewlp0csnui5SJDj5GeVVHGDw=; b=DOTHBGpmPssIoIOa
	h6gThNeMlPvNjfV1eMQfISNlTeMif+D5ReGkikiPJCz807PH4kq4RlU9IGUezN9M
	fxnHTNJsS2yCAVKgphxKa16TAjp15+xwJqzMCe3dwEHVq26mg9eUxaTL4uoxiwcC
	98WcBeOWoSVbLaab+MtpcNrQxxw7PqKuBTfosBYGNnnXCDPEQUAbAfR+XYLmszCM
	QU1tEp7MxEyYMuiDJ1pqb8UDrCQDsbkB3lSI6cuI+hJw6wVUmckbwCQbqr24+BeR
	NQxC+VlXI7AF2b1zsxXQneSCSWuJKvHsal62OWAVSviOZprdk9DILPSAk5AyQ74+
	YBodwA==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dcmrhv64q-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 07 Apr 2026 18:47:19 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2b258636d16so55589725ad.2
        for <devicetree@vger.kernel.org>; Tue, 07 Apr 2026 11:47:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1775587638; x=1776192438; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=kV/sZvlksbOGct8Rbamewlp0csnui5SJDj5GeVVHGDw=;
        b=HcNPMznJNQ/hhUWnW+/9MFJ776GR0Z1iaeBn3eKZVQ4CJ8jOgWKQU6m6UrV90Jcsjq
         H35uOhVr6b/Rtot4twZevw5Lq2Qjeuh+EsjhuwWKfRlL/iJ8x/GHNuLkT36KW1l41OLG
         Vz3dgjrUe7RJONVsf/jTUUmnnMQTt4itoHv+fpVofNYXmdCfuIsqerGOZv8ucMDSmspE
         fsBN4nSjNX09vztMGtzytAZFD3SU8tFL72AXmtgf1Aygp8g6QPmGcHTyX+v3IY5F08lH
         n5IXVso5/g7pi8d9D4TR3U0kSoiHfYw8YMrZdT60ZUolg3s+6bgfWhC6LVOfaz6ZvXZl
         xoKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775587638; x=1776192438;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=kV/sZvlksbOGct8Rbamewlp0csnui5SJDj5GeVVHGDw=;
        b=E6+cs+OxCpGS9lg42DLshqEKa6ZXHm67EU+PAADVcl2KPM7KKP+R6n4bl4Bx/1DtQy
         Uzi6s2VwBvP9m71Ey3BczyqbE+mzgAj00kWDWD4lWjOHIu9Fa/EZ3sEoSFOfGsBN2Wu2
         G0rBuMcOJqI4PPsd2S88L2kP/hbpARDSyK06D6MZS+F1H9cvnqQ6IMf2IiRPVBQ1aIcL
         ntFKyT6Fdk5vEd81IqW2OnD1U7+toRXiNwfShmWCekhXATSBraUx5/3Y9Ds6iRZwoY8O
         S2sYBZfSpDo6ohMuh52Agh1ZI5ObN+qu01e54+VmlPmMvVQ6KOYed9sDX+ncHJYpG5ym
         5D0Q==
X-Forwarded-Encrypted: i=1; AJvYcCUYpyVwB7HN+ulJBZmHz+ACldZuNG0SUWvsbfhYT8Er1hAcTP/75VaspmFOMhPtqrkKQwpM4OBY7eP0@vger.kernel.org
X-Gm-Message-State: AOJu0Yz9n3Hp97tpHpSu98e1iObaWGiZOvsyeIylvJLf/0AuJnP9GTy7
	QyCaySHY0cf5MGzOyL0Ntkks/MUCQJk95qtRrXszaPIVCTzWIqpWvJ4O9lvz5b34/XJC0+DIfFM
	73uTVg2fRwRs/lsF+xWRZEF1WFZVuxfH3CqyGoEB2D0BL3Swp7pB2JRgVWrceYDTa
X-Gm-Gg: AeBDievUDhxvr9K7XzleEoiEpUv5dM0mkeZOamJt/BeSmfTZJKG9GE1G1oZtbPoJPxl
	l0M9ZGZm0nPhCViU/Q2pJhvf0KevEwpQ4JzNdhRoECRlNtVTqQR6FjgM4I634YTOsG3CF2/zpPW
	dsEL8RPi9gFgJ1nH8gwYw0ebWzNa7yDvHYfbYkhYVuWPX82kBLdx606rx5EioLkMMKNQ6MhZOGK
	ubYP95gReeyaZ8ykjGJ6JjeHWzSkcrCvZ33Wcxv1rmnL19XBsyAukWmMA3LCu0lWbZOBQKqefc1
	U/konoCsW0QdIyw9BATSYk3Xdp5fvT9KQhfLYOe6ib2fIr4QyxNB5ItehKICEq/zUqIvZcIhIrh
	WIOpSMR5a3VD/dsa6zcjC+U7474c/A0JV+WYcgr+VGejBZtqNewWqGsI=
X-Received: by 2002:a17:902:e54a:b0:2b2:9f45:2266 with SMTP id d9443c01a7336-2b29f454708mr99925605ad.21.1775587638238;
        Tue, 07 Apr 2026 11:47:18 -0700 (PDT)
X-Received: by 2002:a17:902:e54a:b0:2b2:9f45:2266 with SMTP id d9443c01a7336-2b29f454708mr99925255ad.21.1775587637752;
        Tue, 07 Apr 2026 11:47:17 -0700 (PDT)
Received: from [192.168.1.10] ([122.164.176.228])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2b27473583dsm179498565ad.9.2026.04.07.11.47.13
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 07 Apr 2026 11:47:17 -0700 (PDT)
Message-ID: <ec528927-36d7-4bec-b550-94c13c8f316c@oss.qualcomm.com>
Date: Wed, 8 Apr 2026 00:17:11 +0530
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] dt-bindings: crypto: qcom-qce: Add Qualcomm Eliza QCE
To: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
        Thara Gopinath <thara.gopinath@gmail.com>,
        Herbert Xu <herbert@gondor.apana.org.au>,
        "David S. Miller" <davem@davemloft.net>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-crypto@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260407-crypto-qcom-eliza-v1-0-40f61a1454a2@oss.qualcomm.com>
 <20260407-crypto-qcom-eliza-v1-1-40f61a1454a2@oss.qualcomm.com>
Content-Language: en-US
From: Kuldeep Singh <kuldeep.singh@oss.qualcomm.com>
In-Reply-To: <20260407-crypto-qcom-eliza-v1-1-40f61a1454a2@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDA3MDE3MCBTYWx0ZWRfX+7BT0hSngFkx
 hpu09GWc74hKnVv/ZDA90chX5VEzv90IDGbFIVToijq/VhUj2Hg38xoEryH5gQD600APnlmbe1e
 sVwQo/TVsqfe/XtNCa46BUdzvblJw14654Q35koca2GNeevhUbZo2KAc7Y0XeaW9Tzm0328u3tF
 kPvuFB/rDnxler4eI/y/9bKQ9Njg2RLERcLw/WTaxPBtScIQzKDIEBxnTeUcZW0fmBFQ6Z0HwjL
 bVx7/AAa7YxR2dZVb0o2PzmQyBZ5tFfAfiZRnQFNrhH1kpoaNY8eOQi6vA7v+Zy/BYQ4PaSz0rD
 24K3WTpT4lFE7EamNx52E5M3Jj3cKHQ5Cf+dr44r3if0VpsJ28K2fVCgVbWNYkp/cy0KKIFJpbV
 EAhfcarH83q85gs+InNOZhDcVdONodMVFz8cyJ/Qm939J4NZnzbnT/rMetpeUz/6QX5XEjjw8Uo
 +o+gIGHgWB7IaTdtPlA==
X-Proofpoint-GUID: 3atyBn3XHy1orPEge10kBDteOWMYi4nR
X-Authority-Analysis: v=2.4 cv=XPUAjwhE c=1 sm=1 tr=0 ts=69d55137 cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=zb/CHAQdlIs4C5+TDoMSQA==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=EUspDBNiAAAA:8 a=Xf1yJYGQRHwPKPLo8RgA:9 a=QEXdDO2ut3YA:10
 a=1OuFwYUASf3TG4hYMiVC:22
X-Proofpoint-ORIG-GUID: 3atyBn3XHy1orPEge10kBDteOWMYi4nR
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-07_04,2026-04-07_05,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 suspectscore=0 priorityscore=1501 impostorscore=0
 clxscore=1015 adultscore=0 phishscore=0 bulkscore=0 spamscore=0
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2604010000
 definitions=main-2604070170

On 4/7/2026 7:21 PM, Krzysztof Kozlowski wrote:
> Document the QCE crypto engine on Qualcomm Eliza SoC, fully compatible
> with earlier generations.
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

Reviewed-by: Kuldeep Singh <kuldeep.singh@oss.qualcomm.com>

-- 
Regards
Kuldeep

