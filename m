Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6FD883F39CA
	for <devicetree@vger.kernel.org>; Thu, 16 Jul 2026 17:38:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784223489; cv=none; b=YFTmyMSqV49C+52WbMzHsJbxcXU+ZrQBLfe+p4aBvHNdzoyXh9zfM/IP+GNoC1sFeRKnzC5d3YglDSQCoF8pfkQpr/IbX+Yar+UI6AmeoTPuCGFFiewtPaClaDjgRM2vr8xIetKgsMZR/Fby5XtRq+UuRY5khBLN4ve8twgE0c4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784223489; c=relaxed/simple;
	bh=6FgCbhLKPWL6HdYEE0uVEcv7BSOVLam8e1gtAgoSbVA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=pXUxW1rEEiXluuCHHF6H0szLIydk6IVqlHq0XOKk4zUwtYREHpUkf8XKrap9qVEjf3nutTdzdWw/ddLKwwm7C9paInGnCT7zA7xOXhq2Z0EAz9NCpuWjDu/1a0iqfurusEt3D9fAz9b1NYsm0GdZEcHCuk8LT5rGN/qFCfIdtlo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=iqvyMABK; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=a/hI1MEq; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="iqvyMABK";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="a/hI1MEq"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66GGSlWX3171757
	for <devicetree@vger.kernel.org>; Thu, 16 Jul 2026 17:38:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Jnl++uPU4YLzHydCt3lheC8qNri33hrwHeTaAVYdS+A=; b=iqvyMABKxSSfmCFZ
	I+MSvG7ELbBj3M8PNuXmhC4q0PpBOvEzbh7YsqjYdFL7jJ0iKVvR2y5Ij02mVorV
	jFt+kWA8y/oswQeRy4+mjXJbIpOy+Ue/PfigduJ33Y+k652/gpUIG5srmoO1y8hw
	PZc2/TWCIs+OTMrxy6Da0RgAClYdl07kDr+IW2r1GOuZaQY3081O7bJAB1L0fyFF
	9dPqiVDWgBNxIOgC5DU4CsseEaMi+AYJYRFegZ7sx5apE+A0YLvfu81F8Do99E15
	ifbluxPJ6J1j9fPfVVGsjyMwTimLs0QLcDDRUh5X3W/3B/Wt7WpMFHNFQrCu+qS2
	aFTorw==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fevkv27jr-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Thu, 16 Jul 2026 17:38:07 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-51c15c77619so16812011cf.1
        for <devicetree@vger.kernel.org>; Thu, 16 Jul 2026 10:38:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784223486; x=1784828286; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Jnl++uPU4YLzHydCt3lheC8qNri33hrwHeTaAVYdS+A=;
        b=a/hI1MEqcIY/2YnXZT2BHbKzzyQunkiMDYmRNnZlwx5P3BcsHMhjUf1nrUAtQbFZx5
         OfxlPs3vBPp4MNn+pj8Wi/rDljVMdpmU5SusEN+tcJznlWG/ijuHhRjD4OArbE89t0Ht
         rFaL+RZXBPCKzgsmnOg+qV01oitpYORRvyYmhjRMYXKkSoXzDykY4+fIkOXP3h7SWjmJ
         uAaYLsmwMviztMwOm87q/QNu3EjO32ysGqjTqjBktQ2wxQuOqBmgVFAD9Uk++zMoyRqw
         G4ZHQxexErCrJH9iN8O6KVue9+btpfyAffBadQQ3X/TrrIH8nZSrNsHeOMERK2NeB0lH
         hzlg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784223486; x=1784828286;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Jnl++uPU4YLzHydCt3lheC8qNri33hrwHeTaAVYdS+A=;
        b=UZs6nr8ZegAAmS9spIbkRomd6m8YYIaMkB03po/QLnKrHKeG4TbiUkvRvUrG7Ea09A
         xtDMRcIIKaxXP32SVVDtB6BIMo2pkrcfWgSVF46C8uNwjZtJd8rnhr1m4Qv/SEPQGZlJ
         Qsmn5zUQLsLtfnPKCnONkFjuRm+5a/rOzipAwFD07hDxuyYibsr7O+70JXF7GHPquwut
         bCtcSN693VY7Dtz3ICyJpnMr91Y5swl5yIACSd+d01r1Kwufbb6H2e6zm5g4dLNF/QWI
         +63O482oZ96GosyfOP2fNtrUNRCxCYYYA0vpJZrDudKo9NwMWfYTHPrXLIS8csxwU/hD
         T7KQ==
X-Forwarded-Encrypted: i=1; AHgh+Rp2EqSeHL+Z2aHoZZv4e1EJTmFpkFVxI+qe1lOWJ3vFAvUm8vnLKj3Hq45iS2f1thz4bxYmsoH5EYca@vger.kernel.org
X-Gm-Message-State: AOJu0YxUJxhA1q+IbmqT9jcOoGj4JxDvuth+NshP51+qMp01uH/VQwxP
	BG8mWqeQdQE6YI4S6grWembJAtph5NeRxSS25+Yx9IjIMjht8R2iNhL3O9f5fQIiLpWjSDw9OZY
	6oNTA7W4w5vw541fr/6Yrczx2uBbBgnrWtSEvuUeAm3HB6qYhWtjZ6JGK2v234waS
X-Gm-Gg: AfdE7cmq9WmNe5RAFO8Vmjm13o4cyAhqAmHS9KyF2a4VTTqvxgPA91rJH4slWBe3cPz
	EPOH+zH1EV58+O0lq946Ozw+SEvvXW3NKLuw2nbssNC4pNbZH9MsZEq1YXYnEuu3D8n6UeHwpLj
	Udrhbc/J8waS66tNJ3i+vrdQjXdGOgJugDAi8yUqaPzSYTKuxI2eXathP1sMoEM6BMR1uCuE6A+
	MJSpbT/7DmiZ+K8ZShpdi3NAU/aQH/ImevfmXXGzmE2XLd9veBX9S9nGOrk7b6NoYOgiPAWDIE+
	KNZYZQP/tX6pFpJspRj0BOtKjX4w/tArOIjosS9E2CEqtIUg6neV1ck1/bxLbA44zZR5gJPlIsZ
	zJlNcYz+xRbRAh2EgpXPlZU5P
X-Received: by 2002:ac8:5889:0:b0:51c:845b:ac4 with SMTP id d75a77b69052e-51cbf0e84aemr183952571cf.3.1784223486574;
        Thu, 16 Jul 2026 10:38:06 -0700 (PDT)
X-Received: by 2002:ac8:5889:0:b0:51c:845b:ac4 with SMTP id d75a77b69052e-51cbf0e84aemr183952271cf.3.1784223485998;
        Thu, 16 Jul 2026 10:38:05 -0700 (PDT)
Received: from [192.168.120.193] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c16871262bdsm267180166b.3.2026.07.16.10.38.04
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 16 Jul 2026 10:38:05 -0700 (PDT)
Message-ID: <5f81dc87-3f90-4f3b-b152-ddf6478e8b69@oss.qualcomm.com>
Date: Thu, 16 Jul 2026 19:38:03 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 2/4] arm64: dts: qcom: Enable Primary USB controller on
 Shikra CQS platform
To: Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260716-shikra-usb-dt-v3-v3-0-13f73a0571bb@oss.qualcomm.com>
 <20260716-shikra-usb-dt-v3-v3-2-13f73a0571bb@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260716-shikra-usb-dt-v3-v3-2-13f73a0571bb@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzE2MDE4MSBTYWx0ZWRfXyLUm7AFeyesc
 ML1KFxr6t6qnSWPgJb/9aS1K9T3H7Dfygh6WMlAS99JbyimL9WC7DwhvUcwa5TmUNYJI29+pXVp
 UgXGS56jxIIp9vsDj+XdXTLtornDP6Q/sedwwg8ryT/lfpSn+UGevFqgQD/oRG0YPo5NICEDdVF
 AK6azO12nrSW6GVxjb8n4K3Np+e9Vgdu7mYv6xYLTll1g7NNQcZkFS6jgCvuxmYeyFXulzU6QWk
 uUiYuC7UnKvy72Fwm0ecw/9QvFNoGGgc6xYsd8bS/KcPbox03XLQbfGE1pQIYUr6U/TJy8Hqqmj
 Zzxs+2Mh9FSIYC2BQbHGFedORfHoeh0LmVuTIDvzABduxGTewvUv+KYciG7HN+P+GDf2hSL/mBt
 kK6ggrtTmhvcrtdhzwsL3cCZlffr+3mfPWVvDCvR26ULcTF1jKHMJyYbjlzwItr4QkyJr3ghl+C
 +i/s14jO2DWlNJnqb6A==
X-Authority-Analysis: v=2.4 cv=WrEb99fv c=1 sm=1 tr=0 ts=6a5916ff cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=EUspDBNiAAAA:8 a=tzsdobHbv0gAxwO4FHYA:9 a=QEXdDO2ut3YA:10
 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-GUID: HDtAOIbbNwbivCB2qG16whK_xSeVqsqn
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzE2MDE4MSBTYWx0ZWRfX1FJvH865xNAh
 9zrDGX2YxBMN0FDagmx+UAuQoc3kFUuov0KS5ny81DiAqXbPWBfYvhCTE7MYloCOfE/aRtRG/1Z
 rByKbpZOaQtOtztRX2qbKvOdJmS6aQc=
X-Proofpoint-ORIG-GUID: HDtAOIbbNwbivCB2qG16whK_xSeVqsqn
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-16_06,2026-07-15_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 phishscore=0 clxscore=1015 spamscore=0 priorityscore=1501
 adultscore=0 malwarescore=0 bulkscore=0 lowpriorityscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607160181

On 7/16/26 6:29 PM, Krishna Kurapati wrote:
> Enable primary USB controller in device mode on Shikra CQS platform.
> 
> Signed-off-by: Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

