Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AA03B3E0222
	for <devicetree@vger.kernel.org>; Tue,  7 Jul 2026 10:21:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783419707; cv=none; b=AYxu5ezc+9weCP5hJLu0d2mN9Z4nC+vtv5teCpHaHcR9zlUzP7P5BMiKxxB6R6ZvBnrpmxglXLvN5+bSMfJb5wkaMzKXlubkhIB0lNstUDZqD1Rm6g2/D5V9xMVJbxI4TnIFWHkIkH3wHHjO6pCUB2+N0WPIrARoRbOmLmUxUlo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783419707; c=relaxed/simple;
	bh=OnKD9+dtoR4+Kg+NOHjkHev+oc5f3OmADkx3Zs5N+MU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=tk9qcsT9H4mSirOFPfILai8QB110d/kYx320g8Tb/zdOcPrXvNUOtubnOXyimHPLsLKlAd7E5AKcx/mPeoxrP0y3xS5Z7DKyRYdjtNIBiPk+DLq5Nb1XgwRM+q6n4pgP3hyB7LgH9xJYGBnmyd9r7jeGijaCm8g7gxjoHh4wjnw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Y8J91CS7; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ckyDrN6x; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Y8J91CS7";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ckyDrN6x"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 667A72FE3471422
	for <devicetree@vger.kernel.org>; Tue, 7 Jul 2026 10:21:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	0SBXaiNN8LsnBQfq0FlnEG7p2cSnPn2BJbchfZokxTo=; b=Y8J91CS7IDLxlPHw
	0LLgApRX7lHYylK9rfWZAp9eUmLBq6KTso1FforgrKsnzsy+g6rngmJLypolaH1A
	U4l/qWZYO9w+/a8wEnxNZoyP5isz2/CpL3iz3Nc+aUwpjow3Cwqe8i3Wk/ce7paS
	rjAdDKS3ruuN0AltXANj6OF3a5mfL+E3+vC8W2p+3IoGcJMxoI4nS40Hu5Aigm2J
	SI2FnXKHWNXqGeBK0k647f9orOohl+wCzV/M9Fa0bjk21b2bzymxVIGmAhsVZrJ5
	zeH9ff7XYsky5cekOSkjsmMHlNYeKR2xvj/2fIOt8y029vPu3QJ9s6DWoqTHRkfr
	rHDMoQ==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f8ye0g1sc-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 07 Jul 2026 10:21:45 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-51c267931ebso24303471cf.2
        for <devicetree@vger.kernel.org>; Tue, 07 Jul 2026 03:21:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783419705; x=1784024505; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=0SBXaiNN8LsnBQfq0FlnEG7p2cSnPn2BJbchfZokxTo=;
        b=ckyDrN6xVTh5IYMJQ+Lnji31CrRDVqrlSM5IrhHJ1zN95RpRYejR+sDwo4xdOqaChC
         fIV4HBoZidly6vJtj8X3Zcc119Xaldpny3KkL2ys7MdFf1ryO8SDy3rpfAq5JZ7DWbem
         RA6jmjd16QWeiZ+3ImcTB7MjuMIhVuUrFaiWFVXqeZ8ycTOoNeQc04xjRmV1vs2MQNQJ
         P2r7cxqXPpTR7yUqQjozgQINSYj61PntQGgqJl1DUgo5ynGJSpZOFfg8GDyLnoTiu0at
         nCrzBPTRBUFsMdYk4G1WNg6JO7g3PYqRz7mTM7mgVCuyF0mgY8jeASDfZAd99lrdQ1bn
         hefw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783419705; x=1784024505;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=0SBXaiNN8LsnBQfq0FlnEG7p2cSnPn2BJbchfZokxTo=;
        b=JDKIJjAsvvHBhxVPIJjoIFhZnLMI6aGIKS1p6hOT1qmZLtN2ZUYRBhbuKt/sPQsiI8
         XaKML/mZljpF1XSwZqXiwsy3FH1tTRoGdgem8Guzs4FlfD5qaKrQd15Lc0cuDQyTdOHF
         iNcE14nhKJO8LMWhf3KlVrUt80WMEp7leV5PIuKvWqmFg4PuUtAituH9QJ4V1FNOXWtK
         g9RtbFWW6PwZ1B3wwiU4eOzfkTFgtF+S1vWG6W34kDzLOmm3d0V1ajZDwyXLQw3u9p71
         OYQ7opWLu0DQw9kBQjAbhXNVZTj0SIrz88Iw+8nrh6zOZb/EqOLwXOtILptNEjlIf7nv
         ByIw==
X-Forwarded-Encrypted: i=1; AHgh+Ro5yQ934kDbBkyMPzKzmY69+6lmL89l7LdLY9RTkXufgNT3I+XpXKGYg9r5S+hPXy16D6qAvqMkeM8t@vger.kernel.org
X-Gm-Message-State: AOJu0YzTZC6Pbiq0nC3bmX5fy6rUVHEs0zhw+MLCEwn5k+St8jNfjAEN
	kJwPw92BmVNNddy7TmfxmTKlVFWmWEG+llPknelRr46kU41V++iWlKNreP469B4mtcJsCqmKyEp
	gqsYpCE0qclPzLgZXGMx3YN1sPLbtR6Ljd1HtaoNHAi/nO520ttk+e4bXLldBQHyS
X-Gm-Gg: AfdE7ckEnIgpmp5r2hPC4qRuEs8wUygL3P4F7uHEm/py78xNOU/roiEiobsd/xCvCZV
	lRs+zk0Bbxuh+ion4Q4OyvJ+VQWRy7olu6JrQtOObzQab5FF0aBmTsbdNnCt3YTQgOwJBhNz8Bb
	HOYba+kZNH9VlL0+7YUVtHvmGcvLLyqL/a/eNpoEtEI0mdH34y1A4ghdjXc8WF+z0AOw4vvyGaX
	ZuWaru3OcLtpnXgGgcc0gau55a6ISYn1c38Ezs21Dgrq5z6txVVtMIzOUa/KQPtoPyZwoWtooFs
	3WZKh/XiwMZCF2kjmP2QvKShpfw92i+9TpGVH1u11TRJaak5ZDGN99YhgQqEhtpeJzYOACQEATw
	/k5TtAA1yCHocOfL8Qzd1iC98HKOqXR9MNxM=
X-Received: by 2002:ac8:5fcc:0:b0:50f:a53b:9d5 with SMTP id d75a77b69052e-51c4bd5a886mr130331611cf.2.1783419704831;
        Tue, 07 Jul 2026 03:21:44 -0700 (PDT)
X-Received: by 2002:ac8:5fcc:0:b0:50f:a53b:9d5 with SMTP id d75a77b69052e-51c4bd5a886mr130331391cf.2.1783419704382;
        Tue, 07 Jul 2026 03:21:44 -0700 (PDT)
Received: from [192.168.120.193] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c15adb30f98sm102446766b.55.2026.07.07.03.21.42
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 07 Jul 2026 03:21:43 -0700 (PDT)
Message-ID: <bcdbf070-8525-42a1-9c56-79245f8f711d@oss.qualcomm.com>
Date: Tue, 7 Jul 2026 12:21:41 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 3/5] arm64: dts: qcom: sm8550-hdk: add SPMI ADC
 channels and thermal nodes
To: Neil Armstrong <neil.armstrong@linaro.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260702-topic-sm8x50-adc5-gen3-v5-0-8169953634ad@linaro.org>
 <20260702-topic-sm8x50-adc5-gen3-v5-3-8169953634ad@linaro.org>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260702-topic-sm8x50-adc5-gen3-v5-3-8169953634ad@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: lK1b5GB-pVfygfRcyStivumhSh11aPsC
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA3MDA5OSBTYWx0ZWRfXyvb3RnZfoFPs
 BBnKMbgLJoUR6S81x2L2K1+C5W6HiZd+DSuV9/RjWfy+b6dX/9Qc+mJ+LTRmezavXJzK7wVvfdf
 niulhUYrVYJFNWDz/5GcGURy20402ws=
X-Authority-Analysis: v=2.4 cv=SZfHsPRu c=1 sm=1 tr=0 ts=6a4cd339 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8 a=FWBTG74ICMjwBxTGBBgA:9 a=QEXdDO2ut3YA:10
 a=a_PwQJl-kcHnX1M80qC6:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-GUID: lK1b5GB-pVfygfRcyStivumhSh11aPsC
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA3MDA5OSBTYWx0ZWRfX/NAOv/m5OE0U
 PhHK0FQZRyWnlKWOx3Vvaoglsox/G6HfQcoq7iEim+44eUyBSSmqo4fnS+YqSspJUheHMp+5W0m
 +1CY4XzYPrq3U38nfP1U1gWevx22haXJBdK2ObfHY9mPCAls5MDGrj3EqEUPMpfmcR7/qHDZ8bV
 ot6z7LRECdTw9MjMGub6vEh6elTplPcMpqWaLhIr/wdeSTe9vVg9QWwQvQMb6u9vXhHisw90Z3q
 JBIXbOzjj+ZhvU6ey4XVc0XestkYv9HtBjNyU1pptHsqRQIw7PvN0z+/FM0XlObzgWtIZ0+4oB5
 dCc1858HPIbd/jD0N7mBJ2/VUCEXXa2NN1Abqf8vxxVk7vZMeNOIFK0ndtfxPMlAxLIr8Wnum0S
 SigYkQv2HmpYJapeuUCOQmS7YatqJFGnbqInKk9diOL00a1+A/mSuT/Fzfm5MNw2BOOIRx60/qy
 cGfLD8DHyMzv1Ufx8jw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-07_02,2026-07-06_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 impostorscore=0 malwarescore=0 bulkscore=0 spamscore=0
 adultscore=0 lowpriorityscore=0 phishscore=0 clxscore=1015 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607070099

On 7/2/26 11:48 AM, Neil Armstrong wrote:
> Add the SPMI ADC channels on the PMK8550 SPMI5 ADC3 for the
> other PMICS on the system.
> 
> The thermal nodes are sorted by the sensor channel to be
> coherent with the system thermal nodes ordering.
> 
> Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
