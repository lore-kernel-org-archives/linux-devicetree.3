Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7E2A4292B54
	for <devicetree@vger.kernel.org>; Tue,  7 Jul 2026 08:41:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783413669; cv=none; b=A5DEzg48KnEslbFuD/xzOJQ5b3VD/dRCbDg2CM4+Vd00iFR1xd2vPKdNg/xhomhybd+6ZOUl+T0W+f1cjGs1vd5E4fAFJksVmfoHbVDFWYwkYZ+MUbV/qCiNCTzgrO+AYyHZJw9IEJ4Wy1PgapBbhig25WfLQKD6i8Xy2XmOMIM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783413669; c=relaxed/simple;
	bh=hsE1R7ng6TipGkRqwppICugWHMfDvmkiKuhrFirCYII=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=GoL+V3C5prW8ZJs078dyLuYpVfmUQRsWPUcSXpbWEg5ZPq3QhRqD7bnO0scticVLuQAaq5gPcnZdCEuv3dFpy5YtEOvjJ/ey2QHi+tZ48nYXXALjfJp3PtGlr7QNB8QApITAB9e5IsiGe/envSzp//my9Eo79mfmWgICxFmplGU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=I2h4gFwU; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=SYhYRcfl; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="I2h4gFwU";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="SYhYRcfl"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6678DhMt3050458
	for <devicetree@vger.kernel.org>; Tue, 7 Jul 2026 08:41:06 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	T/aFwVhqAGc0ZbZI9x0aiPx8X3rURaDkbGwWbnLHtE8=; b=I2h4gFwU+DniJ4AS
	I91DXHqeGqDegN3b98/ME1S4lHUcHux6a+mV81sSLsHSjLylYglx2/w/5qDHd+ol
	HF0zsqAyi7+hb/q69X8Jpg00yWpQJmFWn2xYqWrnnb4jQ/caRQdTo2sBdnEvBOJx
	shzzooXfsKpgIZ3W7kYt7Qtg2YQ3tVOtVCSLNO7WTi0ogZqh1ZL0njIPq2Ekx28r
	tdo9WfgNDu94+IU3vy6pzlKrPRI+1NJd2NI7xOACyRDnXoZrO/Yn8LPq5xXfOkKq
	ISh1NjzAp8nhQsFyyHOMM+uajbYVla7wxSJNH+zLr8BfwxKHghtfp2CcT3wQ3Lrt
	CYw5eA==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f8w2u89cn-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 07 Jul 2026 08:41:06 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2cae455cf6dso54580895ad.2
        for <devicetree@vger.kernel.org>; Tue, 07 Jul 2026 01:41:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783413665; x=1784018465; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=T/aFwVhqAGc0ZbZI9x0aiPx8X3rURaDkbGwWbnLHtE8=;
        b=SYhYRcflbPGkDCuwko7tn8VeENSyFI5dKiRrLeAJsDvNodYV/1nFRQzvGJdayfuU4S
         P6ONEYtVVIRP15MlzJZ4nzC5coq/aPUeV5p62spAU7h1ql6vuDVzr3QtJFQzPRo1Vn4d
         mXpH7Ux0MN203Qe5lnn3lhQI7FPbK+DU3Ru6dgiuhBuZTmLdHoMCvpFWZ/28aiUJ1Bxe
         AhX8xls5cxZopp4uTu5ueA6F+7BM2QbzTYUEskwrmlnanuwW7wZnDz4S/menucdYORY6
         1mP/ZwP+gum0MNQOtKJwOGdFRHlERHXLphY+y1tXXZH2lRKrOMvwjFw1rhbUXph4YdQz
         OASQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783413665; x=1784018465;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=T/aFwVhqAGc0ZbZI9x0aiPx8X3rURaDkbGwWbnLHtE8=;
        b=U4I433Zcp8vQBHi6gMh8n8Z1wN6oLqAbb9KenYaoLCqeSSU9Fb7dU41T9Um0ld6FXy
         UnFK+4M4ieD8HxbusdL7rPkIVU0BNO1tIE3q7eW4Ko6uhimiKT8T8AEPJz7gZbZv785x
         Z4ltnWM6j8dDRvGK/71jXHNJ0G4gy8nIAsl7vkHkk+gRNo+GQh6pOT4FjM1ODYhBnGlW
         7vqYA/7DmClT4IvVdBfd490oQHlDU646/OB2ID+GYtdeCB4zMreqFIVN7O4N0MmxH3qS
         I1vhrwbVwDmwZ3n1Egl1CroZ4+bC6LPILHXOVlXOtSEUBqn6dZx+Z/KDEkoozcyDFBjM
         sHYA==
X-Forwarded-Encrypted: i=1; AHgh+RoW+I6qWDxJb+IoCYY+/quM6UplzF9kg7tzfN/4TntoDDZhMTZQfoWrvCBfDof8rRbOOS1eSWdUZAFu@vger.kernel.org
X-Gm-Message-State: AOJu0Yydz88mmqDGwZNHYWv6+KjKYAhmZVSGUHDQ5HEssakU7xOFapsQ
	GFjk4+JPv0UEHm+KmDuJilPhzPNLaA6AGJIpwcW6BuMW7q1utDYJXJMQWpRjefQ0bxuoYCIQOmC
	otcYHUIVd+/Pcrr5tIKZH5ClNRCacBDPGoq2t5/trEYCvan8ica8Zun6sSj9nxnQY
X-Gm-Gg: AfdE7cm2VT3Cj+tqBGo/9Am/aG8xmMO2aFc7ST1OWZVImYjB0iaT4WHFrMP/i9LlhZN
	X4wkVKhIGRwZwH63eHNi2TeMwdfp4GNWAfEzDus6WkyRRFb+1iwYEmPzzawo0eIHKaJCNy6ZscW
	Y4qVXpYD2jqWrkpJ/GUbxIpN5nmCO8DeEFijulodSoGtx6ck16qpspP8Hmk2fPN+oW2hke6c+3W
	Bh1TVqKbQLnjJegjx9P27diFvj5ARMyEaPGTl7FMo0+GiX7TAiM9Svhfmb22AEs3eb2ol7S01db
	t1XcvnpVbYJJITgIvcXLYBZenRM6+rRxStLy4DAkKmlFETreydic1OyucCjq23pBkp3cjyDWcau
	VSTn42Hrs+OLBYlarQ5GZHMtR8eVD5Ymi2T6NVi07/g==
X-Received: by 2002:a17:90b:2e48:b0:384:8a11:33eb with SMTP id 98e67ed59e1d1-387575abe72mr4559412a91.24.1783413665176;
        Tue, 07 Jul 2026 01:41:05 -0700 (PDT)
X-Received: by 2002:a17:90b:2e48:b0:384:8a11:33eb with SMTP id 98e67ed59e1d1-387575abe72mr4559398a91.24.1783413664710;
        Tue, 07 Jul 2026 01:41:04 -0700 (PDT)
Received: from [10.218.50.222] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-387d1ad7974sm708702a91.12.2026.07.07.01.40.54
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 07 Jul 2026 01:41:04 -0700 (PDT)
Message-ID: <447245d3-4e79-4645-a814-9dfc52fc5bf1@oss.qualcomm.com>
Date: Tue, 7 Jul 2026 14:10:52 +0530
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 6/7] arm64: dts: qcom: shikra: Add GPU cooling
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Akhil P Oommen <akhilpo@oss.qualcomm.com>
Cc: Rob Clark <robin.clark@oss.qualcomm.com>, Sean Paul <sean@poorly.run>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Will Deacon <will@kernel.org>,
        Robin Murphy <robin.murphy@arm.com>,
        "Joerg Roedel (AMD)" <joro@8bytes.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Bibek Kumar Patro <bibek.patro@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        iommu@lists.linux.dev
References: <20260707-shikra-gpu-v5-0-d2f373912d3f@oss.qualcomm.com>
 <20260707-shikra-gpu-v5-6-d2f373912d3f@oss.qualcomm.com>
 <cikq6wyljzdlyuopvxno7fipifzc7f2zc6hs2ligiu5esnljui@5mxhammibgpc>
Content-Language: en-US
From: Aastha Pandey <aastha.pandey@oss.qualcomm.com>
In-Reply-To: <cikq6wyljzdlyuopvxno7fipifzc7f2zc6hs2ligiu5esnljui@5mxhammibgpc>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA3MDA4MyBTYWx0ZWRfXwYRohxiVYGqJ
 5ltpp87oiFx9ckml4Tde/RrtaYykH7c8pMkrEaCgxwq5TpaZtDaZQrVUmMG8athcs/3lWPA2UkT
 s8vIAhYJQvXAr8XPky7/h/KjW0HMMs0=
X-Proofpoint-GUID: Q7wbbqDiZpjgvPrTxEXI9saNBLq8gLso
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA3MDA4MyBTYWx0ZWRfX6+/IMRJYTead
 75SKakckfDT+qXeQNuWHStogu93ky5/5lnb9KpxRRSE0GlnJMexnyCba61B68A7+KtfzqgdzxdK
 LpmQZ1h92PnaZeQzEvRen99Sgrm4mV8VFYiCEtrOyzVsOMPcyIhYU+OeYasdrCVAJASS5kLp28O
 xpwgIhSGO5ioFIBYOVZvQc+ghtaOzxdaUOOtIcczCm53zW8XtIyty2VzAP0nIHZKYKrfhgjSrZ3
 ryv58jKBF0Q0yixOS4PwmiwdLkc34xf8s5+pEd28IueJULtyAenWER72OnDSr0VpiybADrpKQsB
 won7MnAPy73ylD8+63lOIOajmrO5MrBQZG3JIGPIgDg6aKwMLuM7Zwvdon2EPFRbiWVgvRSBS/I
 /fd9V4EJXtKXtv7G83XU/NXtbyHnLR9rnlXiPzup5RrKFjsnNGDoR+A423D84v3/exLwoQiudzU
 wKorx3IX5RZKoBA6xyA==
X-Proofpoint-ORIG-GUID: Q7wbbqDiZpjgvPrTxEXI9saNBLq8gLso
X-Authority-Analysis: v=2.4 cv=bPQm5v+Z c=1 sm=1 tr=0 ts=6a4cbba2 cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=EUspDBNiAAAA:8 a=agT521uulj5WE4s-WisA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-07_02,2026-07-06_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 spamscore=0 clxscore=1015 priorityscore=1501 malwarescore=0
 bulkscore=0 lowpriorityscore=0 suspectscore=0 adultscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607070083



On 7/7/2026 2:58 AM, Dmitry Baryshkov wrote:
> On Tue, Jul 07, 2026 at 02:34:38AM +0530, Akhil P Oommen wrote:
>> From: Aastha Pandey <aastha.pandey@oss.qualcomm.com>
>>
>> Unlike the CPU, the GPU does not throttle its speed automatically when it
>> reaches high temperatures.
>>
>> Set up GPU cooling by throttling the GPU speed when reaching 115°C. And
>> use a passive polling delay to ensure more than one "passive" thermal
>> point is considered when throttling the GPU thermal zones.
> 
> I'm not sure I can parse this sentence. How does polling delay affect
> number of thermal points to be considered?

Thanks for the review. The commit message was unclear, apologies.
Without passive_delay, the governor fires only on trip crossing interrupts.

Can we use something like below in commit message:
"Without passive_delay, the governor fires only on trip crossing
interrupts. Temperature stabilizing between two trips generates
no interrupt, so not all cooling levels are applied. Set
passive_delay to enable periodic polling to ensure all cooling
is applied."

> 
>>
>> Signed-off-by: Aastha Pandey <aastha.pandey@oss.qualcomm.com>
>> Signed-off-by: Akhil P Oommen <akhilpo@oss.qualcomm.com>
>> ---
>>   arch/arm64/boot/dts/qcom/shikra.dtsi | 16 +++++++++++++++-
>>   1 file changed, 15 insertions(+), 1 deletion(-)
>>
> 

-- 
Thanks & Regards,
Aastha Pandey

