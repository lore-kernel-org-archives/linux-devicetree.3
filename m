Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BD8CC3DEAF6
	for <devicetree@vger.kernel.org>; Fri, 15 May 2026 20:26:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778876804; cv=none; b=t0H29QahXozGJR0ffS+KYB9vBvh6j9gGSE5nU8lZx4GtcxjgdmqOWbbp1vLC62q/E61U1SBgmnZTZhNjkyB0F3x4EgvNm7JkLVVeyZdlqYeYrVe2hpKCNQtlseBjieMhY2PZD6x8clPrM8ufBDkm/OPzxVeV57Vt8fvdWIu4rbc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778876804; c=relaxed/simple;
	bh=CqhWlI7Y3gRUpaoWJ+3vbINlHXt6wzCF7GmgQfe9zzU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=p2ILE798T+oGzgRh7bUHdMNyLArzJjIZEyk8LCFJr9UWGt8hglIKYpJEgUt94OCm0PvxErYL6phkuNZJj7tAAMXs/VW6yBUY0bKh9erE1+9iCES36hZsKYWVD6K5uavziySNxaIse5TQ9s4NheTWsGRsKa0JT16kREhkyysvd8U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ROzmynIP; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ZkoxPpzO; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ROzmynIP";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ZkoxPpzO"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64FJedWs3065766
	for <devicetree@vger.kernel.org>; Fri, 15 May 2026 20:26:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	+Vi18EPVEaeSJoAP2fZaJ0X1fMDfth3C+xWkw9ingqo=; b=ROzmynIPA6lwPQK+
	xKMW9KCUVMKLPdJ8Z9R/S1iX99nA855cRLSEyp2k2Urql3d4cDxRr7GcEQVe4PIJ
	2HcDgS8c8Xj+Gj0j+SiKNpO3aN21rwAzwBuiuFPMsBRp+JucCvBdZmBf5A2Xs7mm
	0py1fT3+flQLXNZgMlw48QqfWZIYOkUTP/Hh+sWqtk1bEPehlXdG47zH2j7b+v/K
	uBxcFmYcDNgIU5xCU+NFOdFbPEQ6ttSCWrSDcj/YYropdlGjRoxIo+M+PjDRqcpf
	75J+R9jHtD67h3WpEq8DBDnfKt6Tm7Aw/Zik5N4l2DtzC9r4BQDnRd7likqnuDSh
	2wK5Qw==
Received: from mail-pf1-f199.google.com (mail-pf1-f199.google.com [209.85.210.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e67berq8c-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Fri, 15 May 2026 20:26:39 +0000 (GMT)
Received: by mail-pf1-f199.google.com with SMTP id d2e1a72fcca58-8397b14a689so219731b3a.2
        for <devicetree@vger.kernel.org>; Fri, 15 May 2026 13:26:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778876798; x=1779481598; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=+Vi18EPVEaeSJoAP2fZaJ0X1fMDfth3C+xWkw9ingqo=;
        b=ZkoxPpzOb+xTrD6QopnHMgcoXVlHgkBVUGIK/bs9tn4IYLDR4DGKg9o2JBLpDA70Tf
         Y3O+dpPEHOsA71EUz0+Ia9cssBMjQC8Tq51w7rNhNw09KqLNXhoNTaLrXUCmj0VIh4Cd
         j5KbXgKSI61cXrhxT6f6ONrqatnvVsrpA8On0CTLPcJMWwFrLoDJRdPMV8qZFFwew8co
         gJeYd9apM4zN2H85LxOXWwOw3DBLGTEeC6JesqaoAMDsJET1NxaagJkKUPxFoNampu5M
         c5ylq0a1mIQzsi2toqXv7NFCdXeNeUNaSzzldNX9AHkuoGpTk40Xt9jC/jbdA+OzOet9
         3MEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778876798; x=1779481598;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=+Vi18EPVEaeSJoAP2fZaJ0X1fMDfth3C+xWkw9ingqo=;
        b=a/lftkuRrIjSk5Xr/gbqatc5uoctgEgpV8YPu3a+U6/rSSS8EbJj5KXvHCtcBpJpfx
         41T3pZ2BeB/J3ju8EwSgLb71PWMTjFvONaSs4Oqh3Uz9NIqeWmTw2T5q4ZaTYhsRM0YQ
         Ba2T/AEsrgYdjvIo0T07N36eR4ZGTSnFCvr44Ze4CAkRhAtyIIAskQucfRAb9k6SY7DW
         oqs3IigWUlaykMKtA9JxoDbhcaZgTLjrTMm7fqGELPfzjJE4599RShCGsVkz0ZQLo1iq
         xjjYh8mv4hP1XEukqYBADcQXK0oYBCUTSTNMal3oRCmrbLmetxPGhdH2o0LZC9W4NtE+
         6gtg==
X-Forwarded-Encrypted: i=1; AFNElJ/DjrnFvFxqYyc8Onl/6M00zdnEgf9bdwoqu+kA6RXAfL6OFJxGKTRAu9zqNhrvrXppEy2S1QX19PdO@vger.kernel.org
X-Gm-Message-State: AOJu0Yxy8ynjCwY5IjVBa3EzViQTjVx/5M+QIJnR1mUszfkAfhFDB3mR
	uxzCz4eHLch2ntWQNHKxJJ/Yjd6lavQ4DV6T5INDFqgPR7or+GmT0/oa8PFDj93kB8rGkioHVDV
	EQJWKE7LWDdQx2M6q6U89+oPiUeX4LomqoPfwXeEXZbzeIy7G2H9lxtEaAC9Nng7a
X-Gm-Gg: Acq92OFzXGyqJj/bntEexYIg2OL2NlSawuEleTZd912rNcgbA1sVdteNI586kGbkMcB
	NAudSpHi1dggseYESQhkEaSjsbTrSUX1Gbcm1K5DYd+jZU/wmXkuHNA835VF5wZiGd5AkRSfJyp
	HLmFO0iHJaQw/XOHu3dOCqaVnH7no4rkLaHJyxxmhApROfNBUA1Wq88nw7UTeXz4CZLQ694y5pi
	9JkWwwUgBPYyMIHy2OppkYXXyEhyUPVn60LqZFVCTELArkdpqaxFZIkAF1ivOe1scgJn/eJLhGN
	DjOS4qYwywGaRgquMC0vOfZERt3dKzwZMBLdbjyLXNleu7GdZHra5JDs69QVY9U+F76TUQ0smPx
	BnKeSwvJui7JLwCvLdHsy0qRRGW8saxSFN2o0DsYKs0Y=
X-Received: by 2002:a05:6a00:9502:b0:834:e092:2631 with SMTP id d2e1a72fcca58-83f33c3710dmr5683352b3a.8.1778876797967;
        Fri, 15 May 2026 13:26:37 -0700 (PDT)
X-Received: by 2002:a05:6a00:9502:b0:834:e092:2631 with SMTP id d2e1a72fcca58-83f33c3710dmr5683325b3a.8.1778876797457;
        Fri, 15 May 2026 13:26:37 -0700 (PDT)
Received: from [192.168.1.3] ([182.60.13.113])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-83f19664212sm8255734b3a.2.2026.05.15.13.26.28
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 15 May 2026 13:26:37 -0700 (PDT)
Message-ID: <8ceb09c5-7da2-4cc2-9e6e-0c08b509c212@oss.qualcomm.com>
Date: Sat, 16 May 2026 01:56:26 +0530
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/8] dt-bindings: arm-smmu: Update the description for
 Kaanapali GPU SMMU
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>,
        Joerg Roedel <joro@8bytes.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov
 <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Sean Paul <sean@poorly.run>, linux-arm-kernel@lists.infradead.org,
        iommu@lists.linux.dev, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        freedreno@lists.freedesktop.org, dri-devel@lists.freedesktop.org
References: <20260512-kaana-gpu-dt-v1-0-13e1c07c2050@oss.qualcomm.com>
 <20260512-kaana-gpu-dt-v1-1-13e1c07c2050@oss.qualcomm.com>
 <20260515-reindeer-of-original-skill-cb55a1@quoll>
From: Akhil P Oommen <akhilpo@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <20260515-reindeer-of-original-skill-cb55a1@quoll>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: D0NsruE7yPYYln2QwicI6Z2LkYWKxIS5
X-Proofpoint-ORIG-GUID: D0NsruE7yPYYln2QwicI6Z2LkYWKxIS5
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTE1MDIwNiBTYWx0ZWRfX413PHgLT/dOo
 17KTCDmFpduY78wHFstRhzhpzncKp0HCKNwsgWtWHk5KdvtY6zq5Ajcdf0YDGK3b22VTPJWrHe5
 +Ah0PVMb25ShDzLJAxaZgEvCjPoRbvVVIBVFDgG3k4Uab7Nks1K6n6h8jZ3mlhQ33DoXRrU9kph
 wfZi/YuzO4D/IShy1tj0Y0KeBc/C/8f0RisnKEpZMBmuSBN5L0Rh9Sr/ytxkyniIIXEy7YAkC7d
 pgx3LRLTp5NhsjTx0TNGZJam4W013j2RfDkY/moFqzsallqphmsK9lOctba7q2O+Md8ZPLgjCOE
 GAhEtNQgqybuEg/WvIAfSEOmruWD722GThNQ13fYgODYCpkaeLcJsKtElCk81WvIq+K+LlgQGx/
 SQgdE/JlKkEVg/XgAfVsebz3045I09yD+QIaimJRduLldMTqFZ8HfU8/jZcYDfsMdInwB9/NQTZ
 TSDwAFYxlqTbQg3fePg==
X-Authority-Analysis: v=2.4 cv=IrUutr/g c=1 sm=1 tr=0 ts=6a07817f cx=c_pps
 a=WW5sKcV1LcKqjgzy2JUPuA==:117 a=ba8plz+5YpscmDk5DVa2Cg==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=EUspDBNiAAAA:8 a=T9Sauys7PDlx7jIQPikA:9 a=QEXdDO2ut3YA:10
 a=OpyuDcXvxspvyRM73sMx:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-15_05,2026-05-15_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 impostorscore=0 malwarescore=0 suspectscore=0 lowpriorityscore=0
 priorityscore=1501 spamscore=0 clxscore=1015 phishscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605130000 definitions=main-2605150206

On 5/15/2026 2:11 PM, Krzysztof Kozlowski wrote:
> On Tue, May 12, 2026 at 03:53:15AM +0530, Akhil P Oommen wrote:
>> Extend the sm8750's clock description section to also cover Kaanapali GPU
> 
> There is nothing about sm8750 in the diff. Probably you wanted to
> document the constraint of clock for Kaapanali Adreno SMMU?

Before I rebased this series on top of the glymur gpu dt series, that
entry was describing just sm8750 gpu smmu's clk constraint.

If it is confusing, I can reword it in the next rev.

-Akhil.

> 
>> SMMU since it uses the same single "hlos" vote clock.
>>
>> Signed-off-by: Akhil P Oommen <akhilpo@oss.qualcomm.com>
>> ---
> 
> Best regards,
> Krzysztof
> 

