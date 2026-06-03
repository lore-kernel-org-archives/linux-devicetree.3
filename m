Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6209A480346
	for <devicetree@vger.kernel.org>; Wed,  3 Jun 2026 13:03:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780491839; cv=none; b=c5HYvNaz3b1lMCsDWzmJOwQZAFnKKlxG3r68omxtoYn7kSV89s5sWGUtW/ltM8zCoTeNJ4FpqzcJELlI6/vJO+2Z0cJk3JJUAK5sRrMPrSF1mhEDW/w/x7dX3KVgKJVanTLnY86PmCL6O9J8Gf+PmJWVy92Mzp9+fHz65troHTA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780491839; c=relaxed/simple;
	bh=ZAWq7q6CcZ1vHTMzqUB+xc2Q1paB102zps23h0VZjoQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=p6h4w5TwSi+DrEmk1JV3fYdfGvAJpYpb+lkFl0ZqGXe5l4L5RciYfGVHdWJ6ifjZwbwIk/AHEb+hhoJ+4td1SHyDFKVFF7TRb2AFOpUBg7uNoEyz426XZJsbwVkQxL9w4HE4wSDep4VY9z8+8LSZ3fI/avga5aB+p9ld7DLfZTc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ZDKKye9W; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=LzaEF2Eh; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ZDKKye9W";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="LzaEF2Eh"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6539vTNZ2368067
	for <devicetree@vger.kernel.org>; Wed, 3 Jun 2026 13:03:57 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	SUKm9YYEQI6OdE6YQifIsyofez6s+wjK8CMcZYA45ok=; b=ZDKKye9WrI8DRLhg
	fdksZrITISiWBbAzREOMa+Duk0ZclMr8+fFtNyEs7T8odq7LV1bXzLQQfSzJugEp
	3KW2O05N8JVNlP94XQRj+OYkks9vN6LD/r4Zx/Y2yUx1CdumUzzaiJv2GX+iGaiF
	/4erKwdmMFsfYlPG9LiLb4yIgydUoOT6/ZlxNpRy1lGXTw+Yjb28KyAc/xHgvYD4
	fWCU+g3D+QIzoX6txLG+gmL8/kYgqIO4wVWC7ebzRkdNEAyzkLGzBMxzeMZbA0+t
	gnQbN4f95S+mLDEqlqmt1TvbLf6DH0NSXwhExd9z1PaG2x9+pN9KvsJUYSCMvU4a
	IP5cPA==
Received: from mail-ot1-f70.google.com (mail-ot1-f70.google.com [209.85.210.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ejj3ggp86-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 03 Jun 2026 13:03:57 +0000 (GMT)
Received: by mail-ot1-f70.google.com with SMTP id 46e09a7af769-7e6e0426fd3so426737a34.3
        for <devicetree@vger.kernel.org>; Wed, 03 Jun 2026 06:03:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1780491837; x=1781096637; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=SUKm9YYEQI6OdE6YQifIsyofez6s+wjK8CMcZYA45ok=;
        b=LzaEF2Ehjzv1rwls5PdnxKivAZMZQ/fM+nZvgvBfwYPcSyuAm13GIhKrS3VLXrCnbP
         NtyX7VGsSx14D6wpNc9mo0qYJS67OMiFigM5Tp2xM1a6B6+M+8NkYHcCkl4EvdcEfAY5
         CoUrdFP0Gm3nyXjgy2lxLVfaZg6zetnvO68Ku2jvVICAellggab3oDzqew9jORcdEY89
         v+7yvJ55aDZhtq0ePcjhf4N4b65TArLCT4TaaR2TiapkTGnsbIIGUzZiYI5/CCfdY3j8
         dwpUhbZ6CoaLVNPOnehKo0WIPaP1h/v6ZQV9VY5CinKz0aHxQ3bRh55CSU0ZCAYujB/a
         HrYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780491837; x=1781096637;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=SUKm9YYEQI6OdE6YQifIsyofez6s+wjK8CMcZYA45ok=;
        b=HBXqlvSZo5dq7raldwpT+1OrDL0AX0FO5Mvyuokm+jKYmNGAlr0UoCqCdahl7y8FPH
         2tqIjDCg3p2cz2FbgAluRiKse150RaFEgGn1bhAp3JpvsFm23Zz24mMtAVKg6mgaffkk
         AtaDgvaalbHzt3hHaEq1mOlluafbildo33pYEHgydSHkWTDIFDeEcbepqQS++AT83fkg
         rk0sID12+edYRMZ9GNX/cicdUe/x9Pd+uXir91f0Mgqsy00pH5yb9zoLJKUzbsc7TEqi
         ssFsZ8UWP40I2Uyt3fvQbJPTNfn1gxUxdSwaJ1yBdKk/0RTgmMa/Wf88dWIOIQ/DaDY0
         gzEA==
X-Forwarded-Encrypted: i=1; AFNElJ+XygW99ZzP6rAwuGh+NBnvObJ2DlwvdSrUryR7dL6bUNjfI2yDu+xs6hWqJlAA+4sRqsOU6gRXr/xt@vger.kernel.org
X-Gm-Message-State: AOJu0YzjqbrNjOAhhZKhWSQTs0/sLCvwHz/Oz0xfG7WiuyGMduVAkyN3
	LvL/zgBq1Gwgt7/z1VsJu2A/khp8ZwqsCe1HIhRQHWq4b4HIuiy+TpsGGhxEe2MQJc2WYsrpcYO
	bDG1+iT92Hm4JhH24qnuWImjPGKwqhYJ+195PnqNpwoqzOsy2mwgV2G4kTwsiaGQ4
X-Gm-Gg: Acq92OHX30MFKZXrDgLEx1n7Ujt4gdeL1gpDwx6qq2U84wDcP+o+yrdC1hTY6J1/pv6
	AU0mjLMo6JC/1InBp5bpOifi5SCnWItVjrYgDgkoolRrAMK6GLvziMdsWodfe6vfiy2qDyzUO/s
	D4aS/809VnoDSKhBU4dxdxJqvAPDHE2oWoLogg8Gc3Dlqm34JQH/InoUPXRCXR3ReLyLNqOjRVn
	oI04h0WN2DKLoW+zPH14gQWxzoP8sPpxh58GLHkyRErCjJYRzVXRYULzjc3r9Mxb3enmHIAkgHW
	Onl26Elosj9daegEehnWqnaTQFZSF0mehTKscWIz/N4zzOVk3aaWzw95RpeH13Sfw09dGy286aD
	2nVULf5tRxWU/p1D8MIZ0thQ+4W70E11nB+AgZqHNnjcJUzZfIkoK9vVGwUJ9npUNvWyBgNffng
	u1v3lA2NkMZFE=
X-Received: by 2002:a05:6830:81c7:b0:7d7:ea6e:322b with SMTP id 46e09a7af769-7e6e5fd80afmr1348556a34.0.1780491836468;
        Wed, 03 Jun 2026 06:03:56 -0700 (PDT)
X-Received: by 2002:a05:6830:81c7:b0:7d7:ea6e:322b with SMTP id 46e09a7af769-7e6e5fd80afmr1348417a34.0.1780491834475;
        Wed, 03 Jun 2026 06:03:54 -0700 (PDT)
Received: from [10.100.11.76] (public.toolboxoffice.it. [213.215.163.27])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-bf051770994sm152620766b.13.2026.06.03.06.03.50
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 03 Jun 2026 06:03:53 -0700 (PDT)
Message-ID: <bf72e433-bb1a-4fa0-b8d0-32611b4e2d29@oss.qualcomm.com>
Date: Wed, 3 Jun 2026 15:03:49 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RFC v6 0/7] Add support for Adreno 810 GPU
To: Akhil P Oommen <akhilpo@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Alexander Koskovich <akoskovich@pm.me>,
        Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov
 <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Luca Weiss
 <luca.weiss@fairphone.com>, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
References: <20260515-adreno-810-v6-0-fbe04c7203e1@pm.me>
 <3dc009dc-8f36-4735-b849-d952fb626cf4@oss.qualcomm.com>
 <3vzdlxnee4w6mur5qiyk2rhewlugswxarhevv7l4zo47qnnqah@45oxl7rjqawv>
 <01b424f6-6617-442a-a77f-9b7a8472c447@oss.qualcomm.com>
 <191d66ef-7d36-41e0-b29f-1ddd47812b75@oss.qualcomm.com>
 <9a999b51-8131-4032-82c3-72d7eccbd222@oss.qualcomm.com>
 <25812e14-d691-4e15-8fd9-82cacc203eee@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <25812e14-d691-4e15-8fd9-82cacc203eee@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjAzMDEyNSBTYWx0ZWRfX1obrFuINrbM5
 YXxUvlh7FZ6DdZtwQyZSFKQT3lyPtERhmbVrDGguAFrfy03p8EBwFEq90YQS4TbxUDDISk3MeIN
 4bhuPwXwsNTvLwGl3hBsGRCwQUvRAFp3QOpvisYZevSOtrv4T8vPSXOVjOgV0PZ54+ufZDqpgKM
 LWINXuTmVHezA8IXHcyu6y3jKks7tIQK3I3Kuk+R+iHPkSE4q8Q/rNQ/BwibVoymafW6PxvAGq2
 QKywinaqGsyyKbPLnsI7sTBajJGPaumTI2sk1mdiqqZjZrcMyvYSBL59uQ57INoehVAhYFDp7ZM
 jvXNmyRrGOb2te/ANIsxMO3PJXQnqUgOdBA+EL2aNftwADP4oRach+EjdwXV6UIx2mr7HyS7KYG
 Lf7XfyVznm3aBARC4ES7DKgdRfWd9eIGZ7myT08xvUkoUcxIXctWAwIeLgR34R8zhUQXEKgev0X
 pSDjkdhb3hJV2VJvKCQ==
X-Proofpoint-GUID: W3KHxP4TbD-1_RbeyUnF65aRDT6EfnBZ
X-Proofpoint-ORIG-GUID: W3KHxP4TbD-1_RbeyUnF65aRDT6EfnBZ
X-Authority-Analysis: v=2.4 cv=UvhT8ewB c=1 sm=1 tr=0 ts=6a20263d cx=c_pps
 a=7uPEO8VhqeOX8vTJ3z8K6Q==:117 a=aBIYUfOEhgoR9egqXYNcqA==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=6H0WHjuAAAAA:8 a=Zrx8uGjwauVpT-NhnRYA:9
 a=QEXdDO2ut3YA:10 a=EXS-LbY8YePsIyqnH6vw:22 a=Soq9LBFxuPC4vsCAQt-j:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-03_04,2026-05-28_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 phishscore=0 malwarescore=0 lowpriorityscore=0
 clxscore=1015 suspectscore=0 spamscore=0 impostorscore=0 adultscore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2605210000
 definitions=main-2606030125



On 27-May-26 22:07, Akhil P Oommen wrote:
> On 5/22/2026 3:11 PM, Konrad Dybcio wrote:
>> On 5/22/26 11:39 AM, Konrad Dybcio wrote:
>>> On 5/20/26 9:38 PM, Akhil P Oommen wrote:
>>>> On 5/17/2026 11:54 PM, Dmitry Baryshkov wrote:
>>>>> On Sat, May 16, 2026 at 03:52:08AM +0530, Akhil P Oommen wrote:
>>>>>> On 5/15/2026 10:38 AM, Alexander Koskovich wrote:
>>>>>>> Adreno 810 is present in the Milos SoC and is the first GPU to be released in
>>>>>>> the A8x family.
>>>>>>>
>>>>>>> This series is marked as RFC because it depends on a few other in review
>>>>>>> series, GPU GX GDSC handling [1], QFPROM efuse for Milos [2], and devicetree
>>>>>>> support for Glymur [3] (for a8xx RSCC offset fix and X2-185 bindings change).
>>>>>>>
>>>>>>> Also depends on the GXCLKCTL block for Milos [4], but this is no longer in
>>>>>>> review and has been applied.
>>>>>>>
>>>>>>> [1]: https://lore.kernel.org/linux-arm-msm/20260427-gfx-clk-fixes-v2-0-797e54b3d464@oss.qualcomm.com
>>>>>>> [2]: https://lore.kernel.org/linux-arm-msm/20260331-milos-qfprom-v1-0-36017cc642db@pm.me
>>>>>>> [3]: https://lore.kernel.org/linux-arm-msm/20260513-glymur-gpu-dt-v4-0-f83832c3bc9a@oss.qualcomm.com
>>>>>>> [4]: https://lore.kernel.org/linux-arm-msm/20260417-milos-gxclkctl-v3-0-08f5988c43a2@fairphone.com
>>>>>>>
>>>>>>> Signed-off-by: Alexander Koskovich <akoskovich@pm.me>
>>>>>>
>>>>>> Reviewed-by: Akhil P Oommen <akhilpo@oss.qualcomm.com>
>>>>>>
>>>>>> For the rest of the patches that doesn't have my R-b tag in this series.
>>>>>
>>>>> Unfortunately patchwork doesn't capture tags from the responses to the
>>>>> cover letter. I'd kindly ask to spam the list with individual r-b's.
>>>>>
>>>>>
>>>>
>>>> There will be another rev to remove the RFC tag which will hopefully
>>>> have my R-b tag. ;)
>>>
>>> Do we have a resolution on whether the proposed fuse values
>>> are OK for this platform?
>>
>> Ref:
>>
>> https://lore.kernel.org/all/oka0Q911ixJLZzAbfWBx54dOmxbQAre36QqHUX4iDZoH3TE5jD-IqTAHspti6B8kfpLQ-OTnuWjFdXtsqJM-CUC8G9R3x_9vFI--LnpppiA=@pm.me/
>>
>> Konrad
> 
> Yeah. this looks fine to me.

Nice, thanks!

Seems like Rob pulled in the series - thank you Alexander
for your contribution!

Konrad
