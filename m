Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4CFAE3793A2
	for <devicetree@vger.kernel.org>; Thu, 13 Aug 2026 07:45:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786607118; cv=none; b=huapogxqhZrMPjz+0W5MIpMg6d0F/M8v2X1AeOt+3OgZwTRRdmlfcNXjPT/VBqo5S84rAyM8IcvXGo4G8LOiPTe3OGp04makN/KEn8b4MPXIjCt2pmTaWgHi3NvPImI7dtYHo994LTfKW14qCdnqqFgA1KX4OjCzpncl2DnFOyw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786607118; c=relaxed/simple;
	bh=DHjJcIOsk7kODnQ5aTNimYaCYui07soqZWb23BPckLI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=XG1hZ9xyGxBOSz5zF+D0GdKunx9dNv3QmbEvPcLIwSEE/7eLNlmJJRilYt1TOoUovHELg6k0LKb2QKPh2B050Nz8tJmQDFgoZpKYCskl9258nQZugt4eq7Z5XbEdNFaJBqiFqKyW72tZPczN+XIInEpFsNTnKpGhPyrfgfa2bwM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=FPeaVwaZ; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=LRaQATDU; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="FPeaVwaZ";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="LRaQATDU"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67D5g4u91530134
	for <devicetree@vger.kernel.org>; Thu, 13 Aug 2026 07:45:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	qx3EP7LJrDWwM9ZG7+f76byk7vIQMhbjIHopCD4jEHo=; b=FPeaVwaZH3jCLoS5
	dy0eX0Pb3zDAb+XwrpSQIH/ET7Kf8cU/fG19XeutIRCwHGUWYJWsgfvRvqF2zPKt
	shQg1naGOkYc4ds9j5LtGe1OhB7UlDXDA0Qj63WhCU5eq32qxaIq249b0fz5O9jK
	gEfOg62iM7LNgXl/ZnxD1ihTpKwDBQEMzbZveq8XfeQH3/ywlApAl2aNtvzON2of
	c0zqSfFx09E+wfpsT9237+I3P0ypZ4fWps5WUlaqf11uctg/F0uMBQOx6T8TXver
	Y5g2D8DdcSkrkLA8OGErq9crWmdpgeBSCQ3IbrF1hCglPudSsRMqLRS7zPwclIkL
	58V8Tw==
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com [209.85.219.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g143hsa9y-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Thu, 13 Aug 2026 07:45:16 +0000 (GMT)
Received: by mail-qv1-f71.google.com with SMTP id 6a1803df08f44-8eeba1d9e47so16712206d6.2
        for <devicetree@vger.kernel.org>; Thu, 13 Aug 2026 00:45:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1786607112; x=1787211912; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=qx3EP7LJrDWwM9ZG7+f76byk7vIQMhbjIHopCD4jEHo=;
        b=LRaQATDUJb+g8zw8sCp6xg06s2TpHjfVJHY0FEz+T/HmtMPDRULWIHizMVd8wl0Pew
         B669SIewqhM9jPd31PkxrOG5gkdr44PCNeaDBbLv/hMIVpuzNcQCziijO+qUhEHxY2cy
         mbzVyGlgTYYEMQ4tyq+d9/nuB7AKrQT/dtESmJBevMcN3CdYEGcbrlZj+QxcsIpf9DPy
         NxHzi19D4NihJnnGxDOhwI7ftiheGhzZo4oYJIQbAZGHLVI1ujMQZ8/yfrnLYOAzuULw
         osOIV7cin4uuCIWQMidOx3VU6Z1H2hnHJh2lFxVOPFG3eiQMKyGrhK7jyV0JaLj0uRpG
         t2fA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786607112; x=1787211912;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=qx3EP7LJrDWwM9ZG7+f76byk7vIQMhbjIHopCD4jEHo=;
        b=TIj+fhaEJpVZh1SxCsKb1U1ALsWKasep//9Xm3TlLB4iwXfiHJUtby7jPtHVxaUYyB
         gMgCTJU+21BCnsz98dmAi0GCH5oakr3ZMZxpViXhSsAqSqdtUg+27g4Sgo7RErPFAoXS
         9e6GffFxMp32mH0yCNnXU/RFlBhoRy2ED5aI4/T5DWQlivqYKnu+pTqJLvGM+dxZz+VX
         7MokDOhJyy6RBrDbtS1G/83+McobedJbNkLuMxBicfs7YLwqyZwGdCLUpCkBkXTWHeof
         2Bt0sV+aFnpjtY7/jrYKhiyBZoIZ9QYmE/i/sx5TJf8g5i9/r7qiPuluDqJQtPo7GZfg
         FKNQ==
X-Forwarded-Encrypted: i=1; AHgh+RruN8CSB2c0/MmVaeEIWyRBKjojpTgsGUWyUGf/pqAIj5D7TGxwkmNtZW4pR4FQueHnKGVYqk7W8xhR@vger.kernel.org
X-Gm-Message-State: AOJu0Yz5NxMuCa15M3PcS53BHar6tKAqzW9KFzh2doN5a+7iB3EYhFTR
	TzwbmiV0SZg0u/urdCIyzabQMsPuaLf+ieeD6eAgUzVLOFhEPJ59XqnhMBCZlv1gZfFH/P+/3pj
	AvdGRPEa8efRftmcxaaRSW5zCJVC9QjRBV9ctrGXPCbiLT5DRYnb69CBuMaXBX2dJ
X-Gm-Gg: AR+sD12vdKEh7z9jRL5RbZc7KtfOQUCXillc3J7OHb4xd11t99HL9/Ca0PYWMN/sHq4
	daGDQhxOX5b0vgVOeIlUEV19YJudZDUear31wwJEPyPxDJrv0DDCnsLz1Ei92i58eJrYj6EddBV
	cu/LExZoz7Qt/dQxOKWai3QyFC+qRG0GEiMpzHDqa4qejTzDVulhIoEHkdsHiPdxakf5ysOO5zD
	2ujnMBoO6ZVzyIMZAaCvrVKOSgZdxYNLOyiyADzjUiEktxDGn1RcyP7pi3lbX3XgkjDeeTsXUm2
	Sd8UXeJYAQDL9bXy9kyg72cSmwrsKLnxPfaaimaQ4Pw86zuzmGZeOKkE+WPjRjvzbns/ig4whWZ
	8Ecwdw1pPLgesfj1hpqIei/rF9e95xOs65XYb+FxvCSCOT0RT3KtEwA6tkm1fcMbl
X-Received: by 2002:ad4:4eee:0:b0:8f0:47b2:5736 with SMTP id 6a1803df08f44-90a80b3a0e8mr34462896d6.13.1786607112432;
        Thu, 13 Aug 2026 00:45:12 -0700 (PDT)
X-Received: by 2002:ad4:4eee:0:b0:8f0:47b2:5736 with SMTP id 6a1803df08f44-90a80b3a0e8mr34462516d6.13.1786607111959;
        Thu, 13 Aug 2026 00:45:11 -0700 (PDT)
Received: from [10.111.164.29] (Global_NAT1_IAD_FW.qualcomm.com. [129.46.232.65])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-90a8179e4fasm9733956d6.2.2026.08.13.00.45.03
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 13 Aug 2026 00:45:11 -0700 (PDT)
Message-ID: <4fff475e-dcce-4a1a-aa06-25d0694bd3eb@oss.qualcomm.com>
Date: Thu, 13 Aug 2026 15:45:03 +0800
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/3] dt-bindings: display: msm: Allow two MDSS power
 domains
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar
 <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Krishna Manikandan <quic_mkrishn@quicinc.com>,
        Abel Vesa <abelvesa@kernel.org>,
        Yuanjie Yang
 <yuanjie.yang@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260720-msm_gdsc2-v1-0-4687866d6cb0@oss.qualcomm.com>
 <20260720-msm_gdsc2-v1-1-4687866d6cb0@oss.qualcomm.com>
 <nqxbpcwxwastqutkfkaqz4o2telev3lixgrdlmb6anftpywjog@ibfxfb4e42xd>
Content-Language: en-US
From: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
In-Reply-To: <nqxbpcwxwastqutkfkaqz4o2telev3lixgrdlmb6anftpywjog@ibfxfb4e42xd>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=R5oz39RX c=1 sm=1 tr=0 ts=6a7d760c cx=c_pps
 a=UgVkIMxJMSkC9lv97toC5g==:117 a=C3Dk8TwHQYyIj7nOf9RCJw==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=EUspDBNiAAAA:8 a=0b-XH3JjkyDtS5VtSh0A:9 a=QEXdDO2ut3YA:10
 a=1HOtulTD9v-eNWfpl4qZ:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODEzMDA1MiBTYWx0ZWRfX7khaPRYTDpek
 JXREvBN49DWeeVTbNBXVckpIqEDI09fC1v0YDaRvvd0Ttx1srF5bpc9/ftjiS995okS/cJn1kNs
 erSUSf9BLZxhxu3QtiwyT7TUAA6uC0USTV7oJIPa9Srg7UBYiNaz99WSX2fRYCecqOXNlVmXwxX
 KDZ3I443wVwO40f1amDMTQHRBqRd0PrgHe74i4xw/m08ewUztnmVJNzV3O8SBSgJOib/Suawy24
 RuvgtfkEOFsmtj9jc83mWsA/CuRuB63VnDl6b+Kvd4JE+vXLrjUA4xunFpc1PrNlNPulGD4vco/
 qA9euZgqOYMN2gO/pseHyH44hTAANib4NACxFiunUBVJrBFgJBYCRhuOcPIfoPsYfcP8VpXazfG
 WEX5utRenHWk/5IyJkJX4xoabNT3NzUSpX7PyrvkV7i+iS4zsC2IZGE2thd1zzGJmJQw12zK89Q
 WIFsEzflZ/yr1AHtldQ==
X-Proofpoint-GUID: RjgbUN7imbUGpOKV0EZCAE0rK1nW43fv
X-Proofpoint-Spam-Info: AW1haW4tMjYwODEzMDA1MiBTYWx0ZWRfX1H8RRCsjRHj0
 2RFViMFpPJuga7HBOGIW8b0Ombxauz0FXzOFu+1HMdDAFTdeCz6gCSA1Yu6sqL1Nx5oVEf6gU7C
 mIKoVSR0mqY7lwPjyagc6t7/rCWRHUY=
X-Proofpoint-ORIG-GUID: RjgbUN7imbUGpOKV0EZCAE0rK1nW43fv
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-13_02,2026-08-12_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 suspectscore=0 adultscore=0 clxscore=1015 priorityscore=1501
 impostorscore=0 phishscore=0 lowpriorityscore=0 spamscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608130052



On 7/22/2026 2:18 AM, Dmitry Baryshkov wrote:
> On Mon, Jul 20, 2026 at 04:43:53PM +0800, Yongxing Mou wrote:
>> Kaanapali (SM8750) and Glymur use two display power domains.
>> CORE_GDSC powers the main display hardware while INT2_GDSC
>> powers a subset of SSPP blocks.
> 
> I see that INT2_GDSC is defined since SC8280XP / SM8450. Does it need to
> be enabled on all those platforms?
> 
No, INT2_GDSC was introduced starting from Kaanapali for SSPP1 
(VIG2/VIG3/DMA5). Prior to that, it was not actually used and 
essentially served as a placeholder.

Sorry for the confusion. Glymur does not require INT2_GDSC to be enabled 
either. I previously assumed it behaved the same way as Kaanapali, but 
that assumption was incorrect.
>>
>> Allow the MDSS bindings to describe both power domains and
>> their corresponding power-domain-names values.
>>
>> Signed-off-by: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
>> ---
>>   .../devicetree/bindings/display/msm/mdss-common.yaml        |  3 ++-
>>   .../devicetree/bindings/display/msm/qcom,glymur-mdss.yaml   | 13 ++++++++++++-
>>   .../bindings/display/msm/qcom,kaanapali-mdss.yaml           | 13 ++++++++++++-
>>   3 files changed, 26 insertions(+), 3 deletions(-)
>>
> 

