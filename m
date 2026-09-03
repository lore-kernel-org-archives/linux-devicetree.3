Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 809281A9B24
	for <devicetree@vger.kernel.org>; Thu,  3 Sep 2026 03:11:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788405065; cv=none; b=EefE6MFyLW6r8wBzYuhOyDST+Hcgj8yE6j75umM68wMtYcR4MM0Kpi/SI3lGR80clNzR4x2U8/xcQUKsEC3YZEL4L6zLoT5qGBsH3O+QztArY3GgRBgSMxJws7Bzln7xzpaKZoKsFs/RgCPUtQB7xkJTc6nN9MrM819o4vIkDjE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788405065; c=relaxed/simple;
	bh=cTj9gp6hyNG5Z8+4bW77RkA7XAaluHHQB/zBA6orByA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=PwTteOVkObUFEOI6QLtGaQCHpGYx4JuVONWpzBfpqDkHMEUbvySywpBHrXVEOfrNt6NRbBQIhP7YvcsVoVrmeHg7m/Xcae6xJIzNH1PW7fiAeDnNq1TZtO/nMnKRLGWbcDbjoAvrbPDaqOJmiE1netsQyNk/MD4zmqkFI6e+P9o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=JD2wPoxS; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=DhM8wTPM; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="JD2wPoxS";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="DhM8wTPM"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6832xZ464150815
	for <devicetree@vger.kernel.org>; Thu, 3 Sep 2026 03:11:03 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=koCBTLe9Ly+T/r6rPbnY4S1G
	//XZlkZiOKX9UC2GtLM=; b=JD2wPoxSFYA9seI/ne+7tUi3VZjiOjxBpCXvBMb2
	5nWdoLtKAv+wRZQWCJTJ3Sxdmz5Nr8qLj8Hqvx/RjkGnANSnmfnXmdXhJDIJrmpF
	OCneV08FUlnZIpI5YbtxIoQvj90YAiaikJVc+eE4Uthw8hMQ/F0dGhGbVWI9Jfcn
	OfUohu4EaGXDze9RIjrylo/HjjSeQSKzl42BqPFTsaqZTi0Ns5b4C1Q11hIcwvQ4
	pWn8Ov2ud0gL8GQKnPAlCxdNymI54nZOm2ZNCQuDPaFTmRwGIDYPuzgEO/RvZPTV
	QTacsv2tnvsWMAta+yq7R87jl497TtU/YQI449nIZ0tL6w==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gerdna6hu-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Thu, 03 Sep 2026 03:11:03 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-39512608fb1so4404928a91.1
        for <devicetree@vger.kernel.org>; Wed, 02 Sep 2026 20:11:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788405063; x=1789009863; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=koCBTLe9Ly+T/r6rPbnY4S1G//XZlkZiOKX9UC2GtLM=;
        b=DhM8wTPM4+QlVXQo1U/RrE/5SsOacc+/ICw1fNn0igsNMdBR3HZYpCO7+S7Q8xpVig
         zXE65gW7qZt6SlrWWaZbXrFTp1Gx3rQw72YYbC9NRYquGvGi1aVOViONdT5I9LTDsDCQ
         01uk78UJ0av73r7uf83Y9D4esSb1NsNkk69wDTvgKi1Q/ra45AfeT5sJONAFxO7lyyKv
         6jv8rVKm99W2LTbzsqfIMq1ynILXis2aLl7OHoQJn/H6+9H5zjatHmFXvcYSkuNlw+Xl
         NmfECqQ9FEInSIhHT4y+eUfwFlFSCpt5fv+0/rMW9gpJubohKKkqmk6P9JF+J6dUjeBk
         zWsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788405063; x=1789009863;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=koCBTLe9Ly+T/r6rPbnY4S1G//XZlkZiOKX9UC2GtLM=;
        b=P2VZHFgi59zDAdkEPM4InCoOxmXiBB/HGl7CeeM/Yd/IK0r7tT6fLEUNV3scrydL0c
         Do2VCMNI2oeRlGvm7pdBEUQk0YJjAnYiCwIQ/yYc72lC7k40/HjdjL7NSlC+NOb80giq
         PACTJjTZrnlR08o03s7sUsqg1gaCyYkAFQo2XbK49z4uf9SP2WTNrdmY5iwQZ6IxxAyM
         FFIvp/TuVJLX9YGUezw4uGo4Mt59JmYmmzgL33L8Pyqh5sIaQYkIBkV0zB4SB9VfHIaV
         4w2eQy2Z+QWHBRUSdw6ahIrGbHtKvdeIgI2Ad+T8hQAB3WNk/y+g6rppO5rok+nvCzh6
         xB1A==
X-Forwarded-Encrypted: i=1; AKwUvBx0BiHtVvtBwrp30/b7FTi50r/6cM62+STHFg13JuGiYqzWoiVYZxCmqaSXI1dM3IrDys1cThiI9XuL@vger.kernel.org
X-Gm-Message-State: AFuF++lmnxBgBBbWVB+OOIsLAvxa1fvTalsDQNEWLAW68NM5ioF0kMHJ
	DyeURahdGe6obJiaft0B+WkX92tlEsEXQ5UMlzS2MUxY04q3b9NfaD+HgMlvw4j7f8p68cH0TKX
	4PxMqOCT0yUpcYMScONNc9rHTdvBpykqMYiiQN5ljsJAE1rdk1jUKMoTh4AyOIwXf
X-Gm-Gg: AYBFou2adpUnMJc0wYP4b64S7eKew0MnQ92DNS0sqFPvy7Iz0Mz4u0baMbWqpIfM/4I
	7M9VXjh4DrAbmZRLvhy+c98PpkpNpDB+46Cakh+1We9W7AGzpoAsXkIstxtoNd7kTHEZm+yvVuW
	/blB77SWRUyWyKL7qXwawDN7eZdxESGllORSMaGPVYeqx4UiVJr9cP+pqVfE5tWm5SWfmk+mYwS
	wzcDEJKYJAGU8ylYNuWyEmiEEaLij1Tc2LzObOU4DTxsNOvZIOIjWmM7IZO2BTsGiaqSpu+SZlY
	7JHq66sNuI8wmDa+VM0MnR3SMdUQyLvbocN4Rg+8WcxfzbNXvxNRM9PPmhFK9HthxPIpMSGEcXH
	yD2GWODDBELvjJcU+seJit5G4hyU0jUAN+0OdP/o9Dug=
X-Received: by 2002:a17:90b:2cc8:b0:396:6344:3b63 with SMTP id 98e67ed59e1d1-39aedf8b4f9mr15164406a91.2.1788405063118;
        Wed, 02 Sep 2026 20:11:03 -0700 (PDT)
X-Received: by 2002:a17:90b:2cc8:b0:396:6344:3b63 with SMTP id 98e67ed59e1d1-39aedf8b4f9mr15164357a91.2.1788405062728;
        Wed, 02 Sep 2026 20:11:02 -0700 (PDT)
Received: from QCOM-aGQu4IUr3Y (i-global052.qualcomm.com. [199.106.103.52])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3325592da63sm2088759eec.13.2026.09.02.20.10.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Sep 2026 20:11:02 -0700 (PDT)
Date: Thu, 3 Sep 2026 11:10:56 +0800
From: Shawn Guo <shengchao.guo@oss.qualcomm.com>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Dhruvin Rajpura <drajpura@qti.qualcomm.com>,
        Anandu Krishnan E <anandu.e@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Subject: Re: [PATCH 5/6] dt-bindings: arm: qcom: Document Nord Ride Embedded
 board
Message-ID: <apjlQBKj2TgOlBvq@QCOM-aGQu4IUr3Y>
References: <20260831032103.341633-1-shengchao.guo@oss.qualcomm.com>
 <20260831032103.341633-6-shengchao.guo@oss.qualcomm.com>
 <20260901-proud-innocent-macaque-7c52ce@quoll>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260901-proud-innocent-macaque-7c52ce@quoll>
X-Authority-Analysis: v=2.4 cv=YcmNIQRf c=1 sm=1 tr=0 ts=6a98e547 cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=b9+bayejhc3NMeqCNyeLQQ==:17
 a=kj9zAlcOel0A:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=EUspDBNiAAAA:8 a=_WDQo8kc_inshQGevKgA:9 a=CjuIK1q_8ugA:10
 a=mQ_c8vxmzFEMiUWkPHU9:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTAzMDAyNiBTYWx0ZWRfX2kPnRLICBktW
 Qy3mZWU9PoSXucyUibfo2yx4oZdHjMWOrm5XxzXuhkf/a56YW6zfFIciQW/Afop5omWVbx0zu0S
 c0IKNU/Y8UzODGWNvoxNcxTx8s9+0Xc=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTAzMDAyNiBTYWx0ZWRfX1pl3OuU6H/1X
 EyBVDTO4aIYqPKi8zh7KpLrw3/AQnRjXbYpNuGdBb6K143/TQUUuuCI5CUB9diCL9Xz1wzRnOlZ
 q5q7ARvfB00LHH8RARKIHgzUm84kiwiuqGuxR0dRfMOynquzykullDqu4Vl9EPCugaOH6u1hSjv
 IUFK9HXHcbeZfD488w+QzFevM3g/NtfI04GcC6rSafI+fIgVxYioICjgUqHq0U0a8sHpZKON/c/
 uZkY4gpwz1TTEz7GnnvTuS7fKmjioAejvgovYt0Ro+AoYSiyQ1Ja+Ya0P7Wb2/nqFbdNxiQt6DK
 w1MolfGZ+3l4zd5th3erRy7FSo/5WkfTqc2zJeybqXcoUZa+2WZ0xE+ZaIxmTL4rqMNTLhcP1Ek
 kJbXtr2EpapIMGB6xkxFxcuMJ8lNlpRfEnn86PZirGJAfgCvqeKoBI8pZirf+nvc6AocABHiDy7
 KSI6YyJEY7F7jr/ThZg==
X-Proofpoint-GUID: pE9zcJnOw4Su3KCrOGuLo53YYYbm1X4x
X-Proofpoint-ORIG-GUID: pE9zcJnOw4Su3KCrOGuLo53YYYbm1X4x
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-03_01,2026-09-02_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 malwarescore=0 priorityscore=1501 lowpriorityscore=0
 adultscore=0 phishscore=0 impostorscore=0 spamscore=0 suspectscore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2609030026

On Tue, Sep 01, 2026 at 10:31:30AM +0200, Krzysztof Kozlowski wrote:
> On Mon, Aug 31, 2026 at 11:21:02AM +0800, Shawn Guo wrote:
> > From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
> > 
> > Add qcom,sa8797p-ride-embedded to the list of compatibles for boards
> 
> "Document foo bar, embedded variant ..."
> No need to repeat the exact diff contents in the commit msg.

Sure! Will update.

> 
> Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

Thanks Krzysztof!

Shawn
