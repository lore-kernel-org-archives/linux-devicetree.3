Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792756557;
	b=UElGSI24gdUqtS+c1Yh/cPCuTCRQiNoaZB3801xDKv+CAdcTGPtAD1DqUqUb9dBWBU4y
	 YTDGGfJmGyya8WoshW/v2DI6req2LPx5Orw0R+LnepeVRrG9OaFRgrS5MfMneGJqyqlea
	 WWMSuNcNhzlq0kqXxQjGpv648CdhQoPmmsSsQZrPRmejQPOjOgTEpzJ4IZ1bt6+amaFIp
	 5VnbfiG5eYmwrxdsBRpCrbAcpqTZDqLP4FhoGFnQE+pjtTKVB2+7qPvZhkDwox2Frtq7O
	 Y3vBp4DlQm3BpaljVlXX+qYr8uZKJkDtEFo64ie2BFrIIMjy8hNzPyXr3lVu79tyMIQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792756557;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-GUID:X-Proofpoint-Spam-Info:
	 X-Authority-Analysis:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=0lfjro51D7Qg6x2xly6IGeYnaVRKofx4mi+Gn179GOg=;
	b=ois7Y02KPGyASn02vALH4RZES4BztHFXsz2F6kaNWaxovqIyboRzJ0McN1fK+x/4yEEF
	 jH+FARUUZcTwqomzlZyYA1pBoOX8AFqj1FPzHGZr/Kp59P7eacvGPZZgTCvGz4B13cQuF
	 XuX+uZa+EuHbfU8I1yTzbZ5i4gr/zolAqv8jvWvixfw7+39PC6ScmNcaSMh0uDiZeJBpq
	 UPwmLWf9dGJwvEVg4jQ/sk9yQLS6bx+jROpZz1du8WrteZqfUJPEj8h1ufNwHiwVwPwzN
	 xB8uCj9tqxB1gUK9DbJhtBz4dJNSGyYNEpovgqlCZHvsqr75wHCr8wMBfAefvdi1T3w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=cJKj8NvR;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=cYaYOz3d;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 404CF606A31A
	for <devicetree@vger.kernel.org>; Fri, 23 Oct 2026 11:55:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 404CF606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=cJKj8NvR;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=cYaYOz3d
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69NAAT3T3550517
	for <devicetree@vger.kernel.org>; Fri, 23 Oct 2026 11:55:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	0lfjro51D7Qg6x2xly6IGeYnaVRKofx4mi+Gn179GOg=; b=cJKj8NvR2w+BX3vH
	+aQ4/rwe4iSgxxjXPyYptap1oi8ylQ+JWRjwFhCH4f9p/5hzCx84yZ5T8WByfr3e
	hQWOMHlXMxxAseNvApfRTki+4bd4EJdrAj3jXjQb8sQORdUov5EK7MjlkLWbTgwa
	QpiMarlh6BIUdOu0PEYscJ/j8oJSVXisuCa6qiy/kCYiGrbopZOO9f2Ms4l6NUYy
	TdsMKwQ+jb1mQHAsXNaTaIf7HMdv/DJqAaDoSWJ/RXOdbFCS86TyZo9VyVQKVWtH
	GPkL1L2LjaALQUBqeNw8dNZs6aE8f3UFbku/7kyiyq6P+IUCizodMfx4ZjYACj4h
	s3YbHA==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hfqmrbgv8-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Fri, 23 Oct 2026 11:55:56 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-93cac495d99so15478385a.2
        for <devicetree@vger.kernel.org>; Fri, 23 Oct 2026 04:55:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792756555; x=1793361355; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=0lfjro51D7Qg6x2xly6IGeYnaVRKofx4mi+Gn179GOg=;
        b=cYaYOz3dHrMA8QLUy+K0FHR8wkiPvoNdfuBbrASgNBtBKBjOkIF3JpmPeEBiWdsxUE
         hy/90shQOe91me6DwoBXoR284ZTCD5Sw2OP1HuYkAI8I95XSxhr58H8e2Mp8pTNlWuLk
         DSdTOcb4weaX/qPhFpTpvEwtRK/jTypBT8wuelV4XNc5i0ku8qTPL6KydsMLjDLrzGZd
         AiTUj+LJfScobF+l1eNK2FbFTiFDzy7lRKyk2wcsvH209mOMHLeGs2h5GFbb2Hli4K2P
         P8DV/K+8fx6LrDVrx6Wn7kcdovqlFMc/RYne3i2PtGIEhd8rOeT7QNkl3px5q42GJXcv
         Y1AQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792756555; x=1793361355;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=0lfjro51D7Qg6x2xly6IGeYnaVRKofx4mi+Gn179GOg=;
        b=Ib03FLYacZ0BqGSmFZRubzv6GgqlIr9fjZvHX7yyRVJwIhZk5QMuO8NaGLik+TFu4c
         zI1tx//d8Lrk2c6P4HxB8C3ToIzKTuvWIHDEBcG1gNJ2hieD2R3yZLMUVOJf5EwpOxdu
         vlOc+TU6AVTgzkuwXq6lXXeAGVSqM8b19uM9fVg3Jh1Q1jFwNyuNy3LWuDkg2qFLjA2c
         ssvkhSd/hpAg0TOY4kUI9zoNIj6N98ZgFNZAxAFtL9o90bxLVGmAu0EFIp6J5Z5e7FWp
         BUU+OmPIvRVyXTEHQ1TIZr7xCoDia8dhOeOUQkc0VSAgcWKorSIEk+CuT/hSx36H9LDt
         ZQfA==
X-Forwarded-Encrypted: i=1; AKwUvBxyNo9auNwf4pRwq3aex3w/h5sxIS/9hkn5CwerWJghUb1n72ShD4etWXo3uvNJutFKyLxSxZhXcL4j@vger.kernel.org
X-Gm-Message-State: AFq9FYJJmqvvL/RsB4vNmjy/KWdB22ryk+FY8d9zb53Up+TDtAPCY1pO
	baN/I+y84ZlSGaKjH51lLb8KsMsLnhGd+PW3DajIyGLdT3PB2PlIho2uhDBmwXPst55epAXsOOq
	h2DzgMqdm0RetHVUucqoklxWLY4HehsCf2oB9jxblNxwjQYXa2rqzxAj3DCQBArG0
X-Gm-Gg: AYBFou0Pam+/NQvfWE/1Aa43QDUFdg1+eYMTJ5L+enM4VrgOidYZYknscNAwT/I9FVl
	r5cVWq9JXP2oE7k+zv2lEiv9KYTWqtplQxzzCyvte1YkNyOAcPJW6k5TARAr55tt24pi1lWBPD5
	aKLcTAX/oHiQNQyuN63IRtEdZpcHgVbVoXJ9IoxfHzw2fnAfr+Fusj9V0kUdg72mYyuECSL9vYj
	JSJRwfHpkTlPV+XcTs6YPDjcLkR7ifmt/B7DYBZcbOjwZ+7E86acouY5+ig75ivGfv4giCrfCwU
	ILKUTA2lMdWjkojqxfO+sbLM9KpQJz/sv6FiAJ0nLDY1ZpFeud/ku2poU0n1OAy9egnAQFdopku
	BcPdvXQV8UaoWSbH3x/EK6Q==
X-Received: by 2002:a05:620a:a8ca:10b0:93e:5a3f:ac13 with SMTP id af79cd13be357-93f6f54812fmr372791685a.0.1792756555411;
        Fri, 23 Oct 2026 04:55:55 -0700 (PDT)
X-Received: by 2002:a05:620a:a8ca:10b0:93e:5a3f:ac13 with SMTP id af79cd13be357-93f6f54812fmr372786685a.0.1792756554732;
        Fri, 23 Oct 2026 04:55:54 -0700 (PDT)
Received: from [192.168.226.26] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c46a5c4d67bsm95403966b.14.2026.10.23.04.55.50
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 23 Oct 2026 04:55:53 -0700 (PDT)
Message-ID: <feb43c1a-9f1b-4181-b663-eab9e55e4831@oss.qualcomm.com>
Date: Fri, 23 Oct 2026 13:55:49 +0200
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
Subject: Re: [PATCH v4 3/5] arm64: dts: qcom: glymur: Add UFS nodes
To: Pradeep P V K <pradeep.pragallapati@oss.qualcomm.com>,
        Vinod Koul <vkoul@kernel.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Manivannan Sadhasivam <mani@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Alim Akhtar <alim.akhtar@samsung.com>,
        Avri Altman <avri.altman@sandisk.com>,
        Bart Van Assche <bvanassche@acm.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        gopikrishna.garmidi@oss.qualcomm.com, jagadeesh.kona@oss.qualcomm.com,
        Abel Vesa <abel.vesa@oss.qualcomm.com>,
        Abel Vesa <abelvesa@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-scsi@vger.kernel.org, nitin.rawat@oss.qualcomm.com,
        sibi.sankar@oss.qualcomm.com, Taniya Das <taniya.das@oss.qualcomm.com>
References: <20261009-glymur_ufs_qcb_enablement-v4-0-9a6ce83195b7@oss.qualcomm.com>
 <20261009-glymur_ufs_qcb_enablement-v4-3-9a6ce83195b7@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20261009-glymur_ufs_qcb_enablement-v4-3-9a6ce83195b7@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: oEqgZ49St9kYcyC5tP0Kjnt76I-L2oTQ
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIzMDA0NiBTYWx0ZWRfX9nbZ6co5HaNf
 9jchEr5kGFkdCfGO5CTbXTX3toMzRoIiwUoeZ/DmOSpLbkr1cvowIdU0lMefxLoBEGs7N6W9WOa
 TtKoSkke2ipR8eL44nTdHjyQ2OaTlMg=
X-Authority-Analysis: v=2.4 cv=VNZIDNPX c=1 sm=1 tr=0 ts=6adb4b4c cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=EUspDBNiAAAA:8 a=BBNwevgwxSeHGHzN-EcA:9 a=QEXdDO2ut3YA:10
 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIzMDA0NiBTYWx0ZWRfX8mFHKcxBuLl+
 0I99KZ3o2vSZo4zTptLucoKafaZw4d36AKPnLkciVXl/jMgd0FlkW/M6H6+5R+JCvgLzgfe/Mum
 FeyITGkZ9PgVNa4KoWAxc0nulks3aRcI3SE7E4Z8EDPA/GILGEEqJQN1Y2oamBBeDeyfyfOucdm
 wvuBjpQ1fXBHQ/8OvlohTXcFbKtSjHEPGoqDkeQMLQryGcnulzduzIPFDR8LOpmpa5OSc/tmtmq
 Td0Fo5yDPqy1JFLFNdE6p59R732Uru9eGWiELF9/vVfGL2isZefdxhVz26+Ti/IYiISzPPCEdf/
 V41bDw+LNdNVDwC1wY1/TvMdqw0RZRvorQiZo/6qqCG9sOxgEr+7TVU6eMuczcIQAcF94lUF83B
 GybxHpygwY5o6+FstWtvJ09T3pY3oKLd4IS9InnlvHgLq2fI+eNHoQXe2yssl5LSRo9sq3SVUZR
 EDbpskb79NWNmXc/6PA==
X-Proofpoint-ORIG-GUID: oEqgZ49St9kYcyC5tP0Kjnt76I-L2oTQ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-23_03,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 suspectscore=0 bulkscore=0 adultscore=0 phishscore=0
 impostorscore=0 spamscore=0 lowpriorityscore=0 malwarescore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610230046

On 10/9/26 12:35 PM, Pradeep P V K wrote:
> Add UFS PHY and UFS host controller nodes for Glymur SoC.
> 
> Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
> Signed-off-by: Pradeep P V K <pradeep.pragallapati@oss.qualcomm.com>
> ---

[...]

> +				opp-201500000 {
> +					opp-hz = /bits/ 64 <201500000>,
> +						 /bits/ 64 <0>,
> +						 /bits/ 64 <0>,
> +						 /bits/ 64 <201500000>,
> +						 /bits/ 64 <0>,
> +						 /bits/ 64 <0>,
> +						 /bits/ 64 <0>,
> +						 /bits/ 64 <0>;
> +					required-opps = <&rpmhpd_opp_svs_l1>;
> +				};

^ this should be svs, not svs_l1

Konrad
