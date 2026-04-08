Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DC44E3D47B3
	for <devicetree@vger.kernel.org>; Wed,  8 Apr 2026 17:15:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775668514; cv=none; b=gYuppSp+W6h4O8+zqhtr1YR1C3nm0/kFbJmHRjW7t5h9t5ePQfOtPK5h+J9ZCXgNC3VFJuIH/bYjMSDVTBrvkoiUM0PXib5xW0OniWEqF9OGMw+ZPBiVFiGYHGkDJgZJa+V6gnny+vGj/LLc1xQzEEPTmpGveaGfnNz7DZRB7zo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775668514; c=relaxed/simple;
	bh=nh/U9xN6LkQ/KvTu465vaWXNTfMFIKFvmSb75M2Id90=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=QQ4XqR+INvKFsJWSOq5UOwaGPqrkXzM3ohSpElSZ4zTA/FSLGi1f7pRhvK6zjSw5siF9tovEaQLW5rSFDFwqEYB4h9org9wMLk/6ntlPycMvjqXcV5lYjB/mDwwTbw9+AxmsqoOUcCw2hc6u08vi+uJ3rQemH94FY4lE2r15Jl8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=VMBXpyGx; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=XzWuq3NC; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="VMBXpyGx";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="XzWuq3NC"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 638GD9vu674170
	for <devicetree@vger.kernel.org>; Wed, 8 Apr 2026 17:15:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	eEX0eT0+9Pfr6i6e4HPyfeGdSAUc+2Nxl9Ny4Lo9MeY=; b=VMBXpyGxVNWwe6oy
	18Ef2/MGEVePa27+QQ3YRBkIFvhUPfQpeEMHsLNwG3C3u+D5tDBibQ7LwE3QPh7S
	zrI7iOEsCKey/VhkfFnWr/VWWW0nFZ4Gae2lTwH8f4P3k5GcneQ85znvPzzBFfEa
	lPl5hg9qEc90RpASLMzjApxmTfL41IAt5PM4rW5aKL0Z7baJ0OzbXdDrILCN7P16
	sFVbNVKosp+CZnYwQqBSWG8CFeG1m4f/hAQj6BuVoHrRrbmwBkjfc28v+/s7RJvO
	Shs60masP6S+2Fhc1HPDHrf4fuLmWNQ3N2kJ8eeOwvJ845GPM/XChT+gbQbwJh6t
	j7aiug==
Received: from mail-pg1-f198.google.com (mail-pg1-f198.google.com [209.85.215.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ddtbmr7k4-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 08 Apr 2026 17:15:11 +0000 (GMT)
Received: by mail-pg1-f198.google.com with SMTP id 41be03b00d2f7-c7422397574so188838a12.0
        for <devicetree@vger.kernel.org>; Wed, 08 Apr 2026 10:15:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1775668511; x=1776273311; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=eEX0eT0+9Pfr6i6e4HPyfeGdSAUc+2Nxl9Ny4Lo9MeY=;
        b=XzWuq3NCB5SeLDCoV6DRmcejRK6V15W0p2bPROFdoVHdvhGR0gny60wX971LOqLLn3
         CpgcH4SfmPhM2NliWOXZC12/L3GRBZ+WbdWpy1WmftH8/8HIbVlGDvEvXI9y37+0uCST
         TzH/+rOoYa3r9/CSmkvDTkMjiN98zcCq89cJdyws8kJNpJQ6xKuNDLqRxEK4YzP88FEW
         zzw/q2BF4/wAyjhVOnSm27hVUlkQ18ZdfvkOUKzwGEBk5v4fQaFd/JPyiIQkR8nGCCFM
         RlCH6HlxdpzJCx7KzIzNyahe+NnSAzBZXjQyrxH74SHbhZZUBH5FTeFPVVTDnJK+46ZA
         LEQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775668511; x=1776273311;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=eEX0eT0+9Pfr6i6e4HPyfeGdSAUc+2Nxl9Ny4Lo9MeY=;
        b=QCzG1S0ppTTo66a0posqJBWQwb+NIgkTllbQ+oqloWOWgFF/OcHHwH+p5RsyTuz2jK
         Vbns2pBt9phXuze6mjFRlXO4NCsgQev7jBWTIa5AcYwYdt/hB1CSgmuHgdPRWriAm9OI
         uaHNDbb0GFwMAEVQKFWmGtl+mcyHu3L/FfJHY3MKMeMT0CdooDJooR/Z6c6n6dJErsrf
         u3uCeV7yWNlR/RWdeOe/DXHCU02DABSbljnBgwhxd+XcASgkPhtl7XHQE2mfGqsKWZih
         YsDhvghqvFpv7uAbh7v0afLsqusnob3T2vpmEtDqEHGuasK3ORDKnS6T+eIzdWRLtPNN
         zrvg==
X-Forwarded-Encrypted: i=1; AJvYcCV3VZ6W7i0ZJtL5sFyAPKoecwHYjZTOANu3qZuly1qVcvp/uyO5dafBO3dl6YAUsg7EY2CAlNLWOg1u@vger.kernel.org
X-Gm-Message-State: AOJu0Yw1SG7c8fJ8wDzD1vE1nmZVgL3BNlbhb5ruGs+A/dOnDgSixyz+
	BwPvVn4KrklB7MDcmAyGZrbHYLpnCPFZ6ifb2Tj7ZfmFzQ3/DSKf7WoN+/dHMBNftDbBKxrPhMv
	maaC1G/AA7p43NuDxulXY5ttoeDdoYCIdIICrf82pDQ0WHBPhlKSY5v6CALblq1ek
X-Gm-Gg: AeBDietlPGxPvzhQ6FZV6qMRtjh93t7/PDWQX675dUEsqJIg4Rj8gwnPFzwlWUFG0Gi
	lrLEGFfzZ6V5igqtoXgdbUV0Bo2sruQl+jDU0cVa1O2UJReGMABD7MRgucDo3Wav93shqbZ48uF
	XYWXt/4rwO1d9EDAPoBCzT+hbA/7zjGGlHdV9EZhhpgG67zS4yXFUZgjm3f29jvIBnxlHs3/Cjs
	AXA7VlfKV+tvnBHxFK40w1/2xa4Tx3N3RWXdnRP5KFKPkZUDWcZtfkPgX2KpQOSdGcQ5U+tx/S6
	mlu1TB2+AJbIbm3QKvBXSBaEo/q+xFr2ng+RhEbfFiLYksDhuaB1FAd6GVSypytn7h+Ynl6Rykd
	qJXCBDDoIuVkb4RxyR/tvhwkAQcxdItDEO6QAiI4cnKnddRXAhXIQqyNY66fQOWoX5t+HofOsuU
	Lo
X-Received: by 2002:a05:7022:6ab:b0:123:3488:899f with SMTP id a92af1059eb24-12c28c2d224mr128631c88.32.1775668510862;
        Wed, 08 Apr 2026 10:15:10 -0700 (PDT)
X-Received: by 2002:a05:7022:6ab:b0:123:3488:899f with SMTP id a92af1059eb24-12c28c2d224mr128609c88.32.1775668510171;
        Wed, 08 Apr 2026 10:15:10 -0700 (PDT)
Received: from hu-jjohnson-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-12bed93f861sm26103624c88.0.2026.04.08.10.15.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Apr 2026 10:15:09 -0700 (PDT)
From: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
To: Johannes Berg <johannes@sipsolutions.net>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Jeff Johnson <jjohnson@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Paul Sajna <sajattack@postmarketos.org>,
        David Heidelberg <david@ixit.cz>
Cc: Amit Pundir <amit.pundir@linaro.org>, linux-wireless@vger.kernel.org,
        devicetree@vger.kernel.org, ath10k@lists.infradead.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        phone-devel@vger.kernel.org
In-Reply-To: <20260325-skip-host-cam-qmi-req-v4-0-bc08538487aa@ixit.cz>
References: <20260325-skip-host-cam-qmi-req-v4-0-bc08538487aa@ixit.cz>
Subject: Re: [PATCH v4 0/3] ath10k: Introduce a devicetree quirk to skip
 host cap QMI requests
Message-Id: <177566850912.1322920.17816533595535960130.b4-ty@oss.qualcomm.com>
Date: Wed, 08 Apr 2026 10:15:09 -0700
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.3
X-Proofpoint-GUID: 0LH05N9hD-YazDdsh-qimCCFc5zbZlrG
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDA4MDE2MCBTYWx0ZWRfX1LO7O+xdaAxu
 Dp97+Uf3sn6HTdeXcFChZfhBhXExTaD3D+WUswXPyMqKRCTnh89wTlmcXOywMSjmO3MRUY1w9JB
 sUmH12sfOVIOeQ/tW1LTPMxuEjo9motx69Z8diy4oI5lRDcUfdjiXXjd/+0F6LD5y06UJvmaotL
 XU+z0/BdNUX6MWgw8hgv7jeFmkh8nEj99kDU+dSvxuaI5a9yrCPLQIsSOGpI95t/+QtQ8kpK8iv
 WYoc/eUjpC0TAyRk8JpRlSLKKD+UfV68joaJgCHkOzQpsURN0csaFr1jDvWC3jNgc0GBf649UhS
 xA8vWX0ZDVpatdh7zipcyfN2JM5b1bYoSE7vAWksJY88MP/ITiZiohOJ2+Eo7gYl4kTqt2qDCDQ
 mMQES/NER/a0FIGLodqHjnoic6EISyzkWX5BcToLnagCTPila15zXwtau+1//gbBGS2LP7hUezT
 N/XVCZC1FZXygIelijw==
X-Authority-Analysis: v=2.4 cv=YM2vDxGx c=1 sm=1 tr=0 ts=69d68d1f cx=c_pps
 a=Qgeoaf8Lrialg5Z894R3/Q==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=EUspDBNiAAAA:8 a=XIgAiO59-CApRadi8WAA:9 a=QEXdDO2ut3YA:10
 a=x9snwWr2DeNwDh03kgHS:22
X-Proofpoint-ORIG-GUID: 0LH05N9hD-YazDdsh-qimCCFc5zbZlrG
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-08_05,2026-04-08_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 priorityscore=1501 impostorscore=0 adultscore=0 spamscore=0
 lowpriorityscore=0 bulkscore=0 clxscore=1015 suspectscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604010000 definitions=main-2604080160


On Wed, 25 Mar 2026 18:57:14 +0100, David Heidelberg wrote:
> This quirk is used so far used on:
>  - LG G7 ThinQ
>  - Xiaomi Poco F1
> 
> I'm resending it after ~ 4 years since initial send due to Snapdragon
> 845 being one of best supported platform for mobile phones running
> Linux, so it would be shame to not have shiny support.
> 
> [...]

Applied, thanks!

[1/3] dt-bindings: wireless: ath10k: Add quirk to skip host cap QMI requests
      commit: 3d7640b6c371a1795e6d9580695d20caf16be9a4
[2/3] ath10k: Add device-tree quirk to skip host cap QMI requests
      (no commit info)
[3/3] arm64: dts: qcom: sdm845-xiaomi-beryllium: Enable ath10k host-cap skip quirk
      (no commit info)

Best regards,
-- 
Jeff Johnson <jeff.johnson@oss.qualcomm.com>

