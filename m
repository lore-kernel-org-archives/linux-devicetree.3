Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CDE623BBFA9
	for <devicetree@vger.kernel.org>; Fri,  5 Jun 2026 10:05:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780653939; cv=none; b=hkigmp/K7x5nobJ0sJeixECyiquV65Zqyniq/1NIMAbWujlD5MYancjW3hLQP7ovPe3imcqO2mjZ3lqv4SPJPUd8BTmR1VVI1s0to0ixs3LiJxOeI5B3TJ8yKxIUXvc+FkU2J6f152l+f0tJKGezZ9sWfKoMc4YwTuvscPmE8mw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780653939; c=relaxed/simple;
	bh=duYOw7ZH3FxY+OzRO3ZcutRr/EGTljg2RMxZkiPL1ko=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=MPJQL+ekp+4ePseyNiOfBupJN+5NV71WGP3TQeNlOtNPi/w5cPdKqUXn0GjD2rylyYAhf78Bs4bB9jwoVQS3Tk88Ygo968UZTQS027qaFTjw43oJ/hI1yGFskuiDJskDryyMvVoZKqMlITDoTnJL8M/f5QM+Vlsnkx63b3Eh2wE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=nv0xwpfx; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=RwhSjJkQ; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="nv0xwpfx";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="RwhSjJkQ"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6556iqEo4048029
	for <devicetree@vger.kernel.org>; Fri, 5 Jun 2026 10:05:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ezpHQhDZ3yFgmtg3b97NN8aq1Mlm0WpLkU1kGXpDSVE=; b=nv0xwpfxXAZPN6jk
	b3iSYVrMF/kjHEc9GtvJuiksDxlbp5waTtXOXTK6FyCgbjahbuckHQEEOF8ZNImf
	A6iWD9gP706SE2XhNBc9s3Vh5MfBk2CsaH8R+lL9zzr+gkuHdaA0gLLvQ2clnRYf
	v3O3EAYd/zeSEB/fP2FAnqGF5jDy5wPyB7ScYJepkaCzmc+5tD1+TKVnUj64s0YP
	Z8fVOTxijcnjIr8jRkMZD/qb7e2aLHICOgb3CXkpHBA1uRNFb+9/RUSU68lmkHkA
	TnDgdMx+wXWVVb5HHHA/o8qCvgF4ird+CLyFLvp+9+3nRA2nzoRxMwT9LbVC8cEO
	i/C8Dw==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4eksf8gtk0-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Fri, 05 Jun 2026 10:05:37 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2bf004bf8beso20388675ad.3
        for <devicetree@vger.kernel.org>; Fri, 05 Jun 2026 03:05:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1780653937; x=1781258737; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ezpHQhDZ3yFgmtg3b97NN8aq1Mlm0WpLkU1kGXpDSVE=;
        b=RwhSjJkQfczZHekHo7T0PRyAqkbp0KrOWnVpMSHbNnXcMTh3spkbPRPqALZ45bN2sg
         JfIG9qYLSnCc7ZgmYfGRrhDozOR17TW4ZsIhNCxlQJ/6TEm/Q5lg4geRFvdSFI1oeEMW
         BfVOMeXSyeUk+58N/x7zd8f2D57uQqkDOMwiVhY/qptmVmWU+d+dEtIy9y0I/39iHhWz
         mxfzGmC+RLLB8Em1L2ZnKox7SCvpw1ukJneoDYf6tGc5FFt7BuWgBPLWadSUnR+8lttU
         aa2Wk7e4bUOWUw/knJ4v7dva5GoNu1a86ioCvgvidkQkgPdcyPw2+YrS56/PfxhatvTH
         tQvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780653937; x=1781258737;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ezpHQhDZ3yFgmtg3b97NN8aq1Mlm0WpLkU1kGXpDSVE=;
        b=c6OMryeYROdFuy3z46F9AuB0uackyu/NQSEJipIaU3DmyWoAiroGAL/RgMi0Cm+/oF
         kZuL5+14pdOlg8Q7sVUatsQfl87EmrgKHZmicc9p8mrrk1xXAX9iUeOoT0NcQIIyyiK3
         PG1+UCWaV9r+lAhFoVSlIgNZZfNB7WcRlPzRQUq7rrBWIRZPvThW74RLc3XTPAtfPZb3
         DspktEANmfJHjh5YXVk22vBNDdHEtsYvsehXwrn104crpLHqphsqOeGZlXmYPtwxkW+C
         CA9+ZRlayvsKPNlWWQnfFd67ayB4l9rZNIVPktXv4C7jveTVasrgeevalfPzUrqkb14z
         wgww==
X-Forwarded-Encrypted: i=1; AFNElJ9/KE+adrWJKud858OwmNL9kCnNjSwGNtLgMmf5jsB+NzWPE7FB81DgRj/kir5lYi72jkC2fqxA2uSa@vger.kernel.org
X-Gm-Message-State: AOJu0Yw3s3VKBM4WjjebzfHmQTlR3eDGmzixFEmaRSGRf5PMXQn4xaxE
	OCGhGeFVpXES02pYqJJ/xpwV0X4LCp6jYQFK5r9YfltSVR/xHH4kXdn2PK8QpYoGsx+ZpJR2859
	UTy0UxsX/T5SbPPLpSgzu0h07sZC1rxXaKPue3qsOChKcq9QN2jMpV1fqk1Njkb5P
X-Gm-Gg: Acq92OHsoCHOj10XANm7uWR0+Oz9V+p30ZQdR5qdlK0dNYf2pKih6uB5A2vRsobianI
	Xj+WUcp5F/qak3MboEoiVNvp8owXnqDmIm1zIMFQmpQCZFituTCER1vOPIj4m6RHdIOoT3pf55m
	F86YTxH9rt9KnegF55fnsN5I8H01IuBeMJLKHvBYlcTdebEeZG7++S4Xf70QZoamnA7/LdGgbBG
	wvATE/FVYfcWrfyWuya+dbdmTtMvyGCta8H7D8sAWC2RcarsYxl+D+EZoCv36qDuWnHdo5jaiQi
	8toV+KcLjCNZznst/rKyUahvbed2QtSPvVKPuOLWdbHfvfDMI686TeLKN6/AD/aipc2wtvi5ADy
	25VMDxpszpCWwYalcuSd6i/noqSl0jN2xxI9rE6KPBzjhuXGQ8xRCOGUIwZRRiA==
X-Received: by 2002:a17:903:248:b0:2c1:d49c:8396 with SMTP id d9443c01a7336-2c1e7b35a28mr29738835ad.1.1780653936894;
        Fri, 05 Jun 2026 03:05:36 -0700 (PDT)
X-Received: by 2002:a17:903:248:b0:2c1:d49c:8396 with SMTP id d9443c01a7336-2c1e7b35a28mr29738245ad.1.1780653936327;
        Fri, 05 Jun 2026 03:05:36 -0700 (PDT)
Received: from [10.217.198.242] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2c164f96b3fsm90762885ad.29.2026.06.05.03.05.32
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 05 Jun 2026 03:05:35 -0700 (PDT)
Message-ID: <2fee6dcd-d9fb-4ee7-9844-05dd4b999f2a@oss.qualcomm.com>
Date: Fri, 5 Jun 2026 15:35:31 +0530
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] arm64: dts: qcom: lemans: Remove the gold_cpu_sleep
 idle state
To: Navya Malempati <navya.malempati@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260522-ml_cpuidle-v1-0-fd311cf33fb4@oss.qualcomm.com>
 <20260522-ml_cpuidle-v1-2-fd311cf33fb4@oss.qualcomm.com>
Content-Language: en-US
From: "Maulik Shah (mkshah)" <maulik.shah@oss.qualcomm.com>
In-Reply-To: <20260522-ml_cpuidle-v1-2-fd311cf33fb4@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjA1MDA5NyBTYWx0ZWRfX00dI2JdcH28k
 ip6dULQlMLikdZP2uEN6veYpoWw090kwN9PzqTxxiSv5LfQ+loO9xQjQrGh7hQUwmBI4kNg78xV
 zFTxV3P78FFnxBmakL2mVpR30cW0NmuNGd+ywuG9oygIdosIrC3pOAlyjGxh1UspNgx+SIfj+9Z
 G4AabME6mtdU9ugXWe2JwkOkSsYoAetUaj2BzO37CjOVG0mpPUZh17ButtLrQlx0S8tqvyWZjlx
 bgoRCF8nf3XU8yVPXgfE2pfXhPVBR7vD+a/7AVwShZYmpfRnE2HBopPhoJVvF0ts7r9s9vYEfe8
 a8eOBX0HaZSmn/DMd3v+NHRwvXAzFY32TjhbhO1RUAdHc0UWByqWgvInOFbsvcl+W66xHZR4O2V
 ZODf59TzggnWj0MMJPvZ6DtfRsvxZai5LLuio4XAWa4KqLyrObH1PRdCoW/FeS2i/Hpxyv8GdTA
 WYe85KA/Sifg4mKMPPQ==
X-Authority-Analysis: v=2.4 cv=K8sS2SWI c=1 sm=1 tr=0 ts=6a229f71 cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=EUspDBNiAAAA:8 a=cx_M9POd4dFOPC6vIlAA:9 a=QEXdDO2ut3YA:10
 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-ORIG-GUID: PFcDe8-pl0FqXJN_nBgIPzLzwGF-QYYO
X-Proofpoint-GUID: PFcDe8-pl0FqXJN_nBgIPzLzwGF-QYYO
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-05_01,2026-05-28_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 phishscore=0 lowpriorityscore=0 clxscore=1015 priorityscore=1501
 bulkscore=0 suspectscore=0 impostorscore=0 malwarescore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605210000 definitions=main-2606050097



On 5/22/2026 4:40 PM, Navya Malempati wrote:
> Firmware supports both CPU power collapse (gold_cpu_sleep_0) and
> CPU PLL/rail power collapse (gold_rail_cpu_sleep_0) idle states.
> However, CPU power collapse mode is not utilized in favor of performance,
> so remove it for lemans, aligning with SM8350/SM8450/SM8550/SM8650.
> 
> Rename gold_rail_cpu_sleep_0 from cpu-sleep-1 to cpu-sleep-0 since it is
> now the only CPU idle state in use.
> 
> Signed-off-by: Navya Malempati <navya.malempati@oss.qualcomm.com>

Reviewed-by: Maulik Shah <maulik.shah@oss.qualcomm.com>

Thanks,
Maulik
