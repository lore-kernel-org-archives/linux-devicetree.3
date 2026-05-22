Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 728EA43E48D
	for <devicetree@vger.kernel.org>; Fri, 22 May 2026 14:21:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779459696; cv=none; b=ddykmf919U8utjVIIGP1fiSSjD5gAtef/xWG4yein0aluScnKhBOREvw2WL7xYszpHPkBp0TwodUjOODzLVFeazRztaWKCtK4LsBXMH1fXS71Qr2Q1oRBAXEYiydC0vS8U1QP4gIAYwTQH02KT6cL+oEeKA/UJgBBzYbnuxh2D4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779459696; c=relaxed/simple;
	bh=8mJGK1FLLZUOOQnXFpViOauQDAtWi2US3DDWyQeF3nI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=jHicX0lmRDdtlFzGmmQT+f3597641NEi4IjEWj43gt4NpcB/L2YlRpLnWjGxHjnqzZkG51GRM+Z7dO+GPC7/hZTWG1l3OVaHsHF5RHdAhslmw1ypQwh1qKYTVz3B74T37/8z6yy6E/podLuP8GtVpI4zjrrC5IjOKcBQwePWrbg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=i53jBIPC; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=jG66t64P; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="i53jBIPC";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="jG66t64P"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64M8r4P6399205
	for <devicetree@vger.kernel.org>; Fri, 22 May 2026 14:21:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	b9j+7eXCckmlcKUILjcOcoFvG2Vudf6r9KN2UMOzISo=; b=i53jBIPC/i0fJ+XE
	U31AvAFJK00Aw55SLFDhZpf9lvBlALSDqdHh83+TDNR4hZ9LMb4r6C5pvR3RF6sc
	tz+1NaA9oVMMfS2OE74RLPcfsTrOc+/HAHZfoEa9fToc+kkNpA+x94/S9Gn0hDCS
	GYa9PIdAmiM/jSqOm7/gjriNvVSLCf7fcILcUCrOgw0ks5dh7mQQBUpHLXTPAfzk
	0BygaLwdAcCIgymhEwPdYoli/ZQs7HGFxDmti17UqaVPnSOk6gh3deoEljrMKkim
	M+E9DVkYdXwhbXglNrn4dCnB0LTroG6qq5SSKRePg+jTBKw58ePQxP/rssPTbKkO
	8z4+MQ==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ea5p9vp1e-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Fri, 22 May 2026 14:21:25 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-365e70c39d0so7079044a91.0
        for <devicetree@vger.kernel.org>; Fri, 22 May 2026 07:21:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779459685; x=1780064485; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=b9j+7eXCckmlcKUILjcOcoFvG2Vudf6r9KN2UMOzISo=;
        b=jG66t64PH6mvmsXQP9hePAAVgL4+nDpquUxTx/y9Qok52uSOmTHqQ8CscPjEui2lUT
         gyPKNKdUV7igwx8r0OZBKkDNhoipqtX5ep+HB0i0IUxJ+zSYLfgg43c9vMgiATohxdd8
         W0so4xRpPaIJ8+fUk5enyLNdNqqb8lBBQLuYQLCw6VSSMSZiur2W7IEF2NAK4ZuJaMw4
         6I/IyoHZ5kV1IP5dFT14NbsBJaLaHeNQsl8LDOJDn/6dIMMZyIgF2oOa4I57pHS2fcqf
         aB0jGM8td8fAZT6haacHrbSSO0kvzeI2Uxjyf254JSz8FggVFb4oiLmtoUyuRfwkSP8I
         /Akw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779459685; x=1780064485;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=b9j+7eXCckmlcKUILjcOcoFvG2Vudf6r9KN2UMOzISo=;
        b=J4LzAISArHZKfqcX6VvtInxsLaJKA9LLJQQy2xyDlDZDmAbhVPSH1Mve4n89Rutqv/
         YQVnQ/6CAdQR3Q0LG7QPhpdMOqe0CXlsajvm4z/6Ho0ftJIAGoKCYY9RvqUH+pjYYR4V
         hpx8kKvg2+InvHjiDoF+OtRm6JGmucXYXrq4M/L8Nzo+gtY8v9S3UzibbYrQZoufxKDT
         FEiYDrlHMdDonbHYbF7nXohzAXFL+QRs6qRa0YI9RTDIrp/wHIEkRxr1Lo6rwqs9iGjx
         xFgCuIjdDM54+XUH73i+yakE6JMsJ6FnkHCYZUePD7Ox26Styfs+23WsRbBLCA7TZN6S
         TH/w==
X-Forwarded-Encrypted: i=1; AFNElJ/VO+ft4wretkpyQ+RgUVvmiqo/iF7rFLxnpkp9CP9i7kL/gFLzksV8tToX8tdA45eUphxUG5GTvCal@vger.kernel.org
X-Gm-Message-State: AOJu0YwORRt77jD0gTuMHSIjwQbGiN92Ha/dawveA2jnKqS9oQ/LyJtq
	wuz2f4juD8z9syoyoFI69ymYeIda5y5RZPLJKWaq+85//JSwiKRiiJXW4NKHg8OEntYFUXIecTB
	miY4tb35XxopWi+df3TmXJpUZ6CGlmlWE0AYmuuUVdOIeJpgwMF0aluhCCbIc/Der
X-Gm-Gg: Acq92OHhcNMwdKwWT4fNQJcxhhibk4zQ91vmFPLa1j47TjNPIesbEhXQqLSg5BC4WYt
	E5DJ/hoaOmQgwvox24ROIozaHP2w35/ieLiTDET7i/xF9oewoyYVTTw+pyX9QSysxQe28p6fg5U
	oGwxp8EeyGkhZk92mW7La2qFzS6MvI2DERIfRacjWKhn856G6wktBaGvGaHd7cxX9n/6jh/R8pi
	dtZb+Tdo2jjLzAW8oTVF5VS5bivgVqYhZn/1bSotwuKlK9W5BqgQMHRB+HkT5/kLWNPIzdKltxJ
	E//SF+IHMxjxHxy+y6XI5kUzAm/Lr4t77DLtTCLXSy+1a/Gdf4UK53sWpXXsWbpHQmbR3HCZWTh
	nW8Fxfs9YB41ZvaTa7UknRGDgchu9WMyqJEtsbe4LZvVZB8kQvmO7
X-Received: by 2002:a17:90b:5343:b0:368:83e6:ca95 with SMTP id 98e67ed59e1d1-36a671e98dcmr3494372a91.0.1779459684534;
        Fri, 22 May 2026 07:21:24 -0700 (PDT)
X-Received: by 2002:a17:90b:5343:b0:368:83e6:ca95 with SMTP id 98e67ed59e1d1-36a671e98dcmr3494333a91.0.1779459683996;
        Fri, 22 May 2026 07:21:23 -0700 (PDT)
Received: from [192.168.1.13] ([106.222.231.34])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-36a6f0baca7sm1350671a91.2.2026.05.22.07.21.14
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 22 May 2026 07:21:23 -0700 (PDT)
Message-ID: <8da827fa-bc60-4086-a424-5ec376f15e27@oss.qualcomm.com>
Date: Fri, 22 May 2026 19:51:12 +0530
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 6/8] arm64: dts: qcom: kaanapali: Add GPU cooling
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Akhil P Oommen <akhilpo@oss.qualcomm.com>, Will Deacon <will@kernel.org>,
        Robin Murphy <robin.murphy@arm.com>, Joerg Roedel <joro@8bytes.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
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
 <20260512-kaana-gpu-dt-v1-6-13e1c07c2050@oss.qualcomm.com>
 <iun4ziuei3tzvr75qbbqgxytto6vptvtd7j5mr5ol5aqviaafz@5m4yxgnqjavc>
 <e6572f5b-3686-46ca-956d-c06a7363cef2@oss.qualcomm.com>
 <vjdz65uy4pxlbt2e4wlwvdu5llwazyopeqb3caswvejenm5iv7@3s3p7iz4otef>
Content-Language: en-US
From: Gaurav Kohli <gaurav.kohli@oss.qualcomm.com>
In-Reply-To: <vjdz65uy4pxlbt2e4wlwvdu5llwazyopeqb3caswvejenm5iv7@3s3p7iz4otef>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=DKm/JSNb c=1 sm=1 tr=0 ts=6a106665 cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=JaHktJlP2QtFIg7UHuVw+g==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=EUspDBNiAAAA:8 a=rjDOXfNolGiz0B_7zKQA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=rl5im9kqc5Lf4LNbBjHf:22
X-Proofpoint-GUID: 4CYF9pg-EVKDLAndLFjL9auwEPZoSRmO
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTIyMDE0MiBTYWx0ZWRfX4wUjbPb98KFk
 0SboMdVzhN90hR22sVozPsmqNl/W1VLuGmWa3x4dZKor8LxXlh+zgdtsXML4ir4Bt3/rrlPEgb4
 aXwbesKvqTf925FfVn8IO29pqHG3r4/wAFPK2vySKLil3gnMk55W9zll0jqdc+1Qv0K6O20ghK2
 m369+OkIjS7a7KLGTZe9gMoElHO2B/5LrjUYKgHW9wl2b/INKgvmekPuqzorjOtFyMMeq4rZYUj
 RXnJS8itew/mHK0/Ie/peUQRKZIeBfKv8QcOTtdjrFAeqlU9xY+q5L4k+BkDQUXJFLDtW0Tjvk9
 Vcx1110T1CXYCKO/nvIdndlShXFpKFbWDndVov4Zcrq2cewA5hzIeXecfmOoELet6A2JvU7TunK
 hv0dGeWhxiLFxv69T8rLPotKeQ38xhnoyR4sVNATEQQaT9jG/e5nFhBtlewCcr07Jv8myfNxCVV
 +vYmnn/BforXjy+n0jQ==
X-Proofpoint-ORIG-GUID: 4CYF9pg-EVKDLAndLFjL9auwEPZoSRmO
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-22_03,2026-05-18_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 malwarescore=0 spamscore=0 phishscore=0 suspectscore=0
 priorityscore=1501 clxscore=1015 impostorscore=0 adultscore=0
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2605130000
 definitions=main-2605220142



On 5/17/2026 11:56 PM, Dmitry Baryshkov wrote:
> On Thu, May 14, 2026 at 12:17:54PM +0530, Gaurav Kohli wrote:
>>
>>
>> On 5/13/2026 11:23 PM, Dmitry Baryshkov wrote:
>>> On Tue, May 12, 2026 at 03:53:20AM +0530, Akhil P Oommen wrote:
>>>> From: Gaurav Kohli <gaurav.kohli@oss.qualcomm.com>
>>>>
>>>> Unlike the CPU, the GPU does not throttle its speed automatically when it
>>>> reaches high temperatures.
>>>>
>>>> Set up GPU cooling by throttling the GPU speed
>>>> when reaching 105°C.
>>>>
>>>> Signed-off-by: Gaurav Kohli <gaurav.kohli@oss.qualcomm.com>
>>>> Signed-off-by: Akhil P Oommen <akhilpo@oss.qualcomm.com>
>>>> ---
>>>>    arch/arm64/boot/dts/qcom/kaanapali.dtsi | 165 ++++++++++++++++++++++++++------
>>>>    1 file changed, 135 insertions(+), 30 deletions(-)
>>>>
>>>> +
>>>>    			thermal-sensors = <&tsens5 0>;
>>>>    			trips {
>>>> -				gpuss-0-hot {
>>>> -					temperature = <120000>;
>>>> +				gpuss_0_alert0: gpuss-0-alert0 {
>>>> +					temperature = <105000>;
>>>>    					hysteresis = <5000>;
>>>> -					type = "hot";
>>>> +					type = "passive";
>>>>    				};
>>>
>>> Why don't we keep both passive and hot trip points?
>>>
>>
>> Need guidance here, we are keeping passive at low temp so still hot trip is
>> needed for such cases.
> 
> I think we are saying the same. Keep both passive and hot trip points.
> 

Sure, will send updated one.

>>
>>>>    				gpuss-0-critical {
>>>>
>>>
>>
> 

