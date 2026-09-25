Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1DFF04C150A
	for <devicetree@vger.kernel.org>; Fri, 25 Sep 2026 15:50:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790351402; cv=none; b=qC6IppQ5sIK+ljUSEpNb1kE1UHr7ejjeCsqrDJBog31mDmZ6J5tQhuosw/yR1XqdWOspB//ZHkjfZhWw2L0HlmUcKuCu0ODcP2uKt2WcgSkiV2hS6V9WLO9B9nwnXB0l++XElFCJlglNMMhQ3PqyiPZnKwmwqts7wz6CJ0Wz4Zw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790351402; c=relaxed/simple;
	bh=oL9x51PEBLfHmQbHRNyTBoADFNFh07BHQ6Ff44okLJw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=BvoYCvuJK/yZWueuxRljc+V8EkeZCa8LvTk825FaFi96vpljm9kHLZoGb7i0Tt8ciFCb8lyEOwXgjrf43YnBjMCtI3zJ9zJL0NMvZM4FFTLVcd5QcBEwsb80hb5DerUzqp4iwAJUf7kOVNCAE0mMx2kC9YnQ6DOENNK9XMbF1rc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=oc9Ss/sk; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=NcW4QnRq; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="oc9Ss/sk";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="NcW4QnRq"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68PBLlCX900563
	for <devicetree@vger.kernel.org>; Fri, 25 Sep 2026 15:50:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	1rCb94k3VkKhCrxCNCXwFs/lYdfkRp35r7QhubIVMUI=; b=oc9Ss/sk7qbHjQ5q
	JHgqGn4+8Em1lxpk/JSyqyKbEbRGvdqiRudnjMIhGGUtUtLxWbPdV8W6xkQgijRf
	v2lBDS5PfIs7KmdPuORa4JMtkGKlxw916AI7ydcw24YL8Bmz0aptz3Kss31CMbIG
	5urCg4F1vjx58uy8+rO1A9knIvvdJ/tiSMK1HgSPvK6RxBBgyS+79CCeY+OfR0ds
	YTDOCFjZI1YSJDX+A00sJR2umL+GbM3V6lRBqsU3wmPn6JTPt6c+3vM9HZMsL8AF
	vkz4MYm/1ONavTjxl9Z8Wp0XAepXRIqSp2YDcAdoXw4DbN6wA6mkYl58wP+sNDpL
	LHUYkA==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gwr100w8g-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Fri, 25 Sep 2026 15:49:59 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-398dcfabbf8so2721377a91.0
        for <devicetree@vger.kernel.org>; Fri, 25 Sep 2026 08:49:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790351399; x=1790956199; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=1rCb94k3VkKhCrxCNCXwFs/lYdfkRp35r7QhubIVMUI=;
        b=NcW4QnRqMrchHn2s2VSXeCvM7GpEdB7jJdwmoCSIBfbessfWGQCmh58OnIHbW5QeKK
         LyFxH2V1GFH0cOEx8PVRkExZrEI13R24dZHBkC4O0oQ3JvtFXoK5oRHNCOOPzpMsAiFm
         Pb8Se9WSn2sVV8Fe1BVxrTJqkGxCjDFkyGVhveR9CX8QciGH5fiS6xi0fLLG6yDxFP3w
         SZGk/9dljZCCKZEZVkK42sp40dK+JD2LE3MeuOaobt8QWdkh/1wxaDLbLwqkkLIpbCWm
         p5IfMOtzt06MUHH3cWYfOlyyl5KxjYuxHfhUrXKnuwwytMYGfSQNK4K4VM0uPOqRuUOJ
         z09w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790351399; x=1790956199;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=1rCb94k3VkKhCrxCNCXwFs/lYdfkRp35r7QhubIVMUI=;
        b=dxcwaBdRdz6MXVCLk8wCLriCxe9WjAtkYbc4NXGI5ZZjc+u0wkf0lUOvrft/1ofvTL
         4VriTuseX9bkDcwkJgx7ot4oFXF9ruEYJmZPBWJ8OxDRxomJGml6FINm3ueLSRwlT9az
         jeVwSUTZQj08wAg3SNBKES1x26xU85bDaliCL+9KrK+1x5kVWXb2W2GTS9VlYO2yzCGt
         wxJirFFcq0JN273XQ1f7r2++DPx5v7HQ7PXByX6MCCS4ryhQp3pRr+LOSbpbMr9xBxmw
         EKsW5T6dTQcLicykHNHQ5o4MRHuR/3f58ieRWHYalSHBfKil6sEWhzKr0dco+7ExUfUO
         buxA==
X-Forwarded-Encrypted: i=1; AKwUvBxkYMSbB4GtfbLotR1kmlZR2E0gHXATobsvDqNPv0mYoqUjqVHtDZxX/lc4envPtcBdPUCYxja7jSOL@vger.kernel.org
X-Gm-Message-State: AFuF++mTXmbcHMOLGWwhTwDHhv8iwC/rLE4vhSywfvlJQInZBMmDehO4
	SwjouP46QTSvtqg13aUSJvvw+/S9RVAkPUpZvqDrWgkl3ON6d/T8pYKlrsxq9grJCBo5TaZT1ZO
	1ZB1/JlpZG62j8a3EmsqGOvD3dUU9Rs+jb4zmxpYphQNfJZutPZ3v3zznav5Ndyix
X-Gm-Gg: AYBFou0+kiH/w97s21mQqLIH45p0dlhVC/I/HRh1ZRUah/y0FgCAm7Z+6unRRU+VtaN
	U5x6qsRsFg9ogCjBxIxfkwLWOt09U3N65gmbxnv/vPWXm9FKvTkhJWHqU38JMEck5aiecm0Hj2R
	spv8MJ7AMWeLUONn0mQTT2ZGNX0DpT7R6wDkIZB+GrgrcY2J0AU6R8dtpvNxc6T+9/DjdVyyezl
	C2ldbjlYzup74xTG15DqE4tSMC6c3PXXDqIZytdnh1+ooURJkuMvpRmLpUeIOnsii9v70xSB9fq
	RXOTlPvF7dhIY0/TyvNqDUmhrXdW9Yq26tuuWdv9XQ5+rQUUNMA2wJFYHPDsFSVn5+Jh8+LVAFu
	nS9noMGtLt2fbEYK0XW57wJrCXr+glveh
X-Received: by 2002:a17:90b:4a86:b0:39e:6a82:afd3 with SMTP id 98e67ed59e1d1-3a098feb5c6mr5878786a91.37.1790351398859;
        Fri, 25 Sep 2026 08:49:58 -0700 (PDT)
X-Received: by 2002:a17:90b:4a86:b0:39e:6a82:afd3 with SMTP id 98e67ed59e1d1-3a098feb5c6mr5878751a91.37.1790351398188;
        Fri, 25 Sep 2026 08:49:58 -0700 (PDT)
Received: from [192.168.1.8] ([122.177.242.141])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3a0b9357f64sm5541774a91.3.2026.09.25.08.49.51
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 25 Sep 2026 08:49:57 -0700 (PDT)
Message-ID: <0e80efa9-9377-474e-99f5-d458d81bfcde@oss.qualcomm.com>
Date: Fri, 25 Sep 2026 21:19:49 +0530
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/3] arm64: dts: qcom: glymur: Add videocc sleep clock
To: Shawn Guo <shengchao.guo@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>
Cc: Abel Vesa <abelvesa@kernel.org>, Stephen Boyd <sboyd@kernel.org>,
        Brian Masney <bmasney+clk@redhat.com>,
        Jerome Brunet <jbrunet+clk@baylibre.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        Jagadeesh Kona <quic_jkona@quicinc.com>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260924161152.1162301-1-shengchao.guo@oss.qualcomm.com>
 <20260924161152.1162301-3-shengchao.guo@oss.qualcomm.com>
Content-Language: en-US
From: Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>
In-Reply-To: <20260924161152.1162301-3-shengchao.guo@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTI1MDA2MyBTYWx0ZWRfX1UXvO55whx4A
 l9EWnUhs1bKjL269JrD/gVjMaSBlM1MKyE3tdF9f7eOYYQk9WYTBg9r0Bcp+5a720I9dAKJWKtL
 JKYNhB5WJ2geKC/8EGK/PChRG9H6PxhklwrIYFVP4N+SfYoUG7DOD5vNN0SB5mibd2fSWL6vA/a
 oHUlRa9getuUKPHJUF5+tWU5766IzRUqSWEmF/E8ajOML7mMz7obxk7DzqsUrJyv8HYQG0aeOVW
 Wi7LXfUyDU0ou4hQi08YgA8fFmNbqH3v50NupqN5ADFKko2cgznkh0fA3LV4qCQNQXGyzkepskB
 7oxF8dAAiU1ALVnmu+1MNOq8nIIrj15Usxubf9PVfAQS0+g/ZaVJ4UT9EJ3W5qlmfFvOQkBuUqC
 0upkfPN3Z5iBfvo7rvCB9KjmQzsqq6XaW5w9uBDHwDLivvXGl0gZofFB06KA3UHvuxM/+dYClpE
 mwSMeEwawIeBuoVYo0g==
X-Authority-Analysis: v=2.4 cv=ZfKIpcVA c=1 sm=1 tr=0 ts=6ab69827 cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=c6pmHQ1/mDMFVLCaehS4aA==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=cRXVm2DszLkgEr1CbDgA:9 a=QEXdDO2ut3YA:10 a=mQ_c8vxmzFEMiUWkPHU9:22
X-Proofpoint-ORIG-GUID: kqx342g68xeltZScYGmxKpUe7KnF_Bz6
X-Proofpoint-GUID: kqx342g68xeltZScYGmxKpUe7KnF_Bz6
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTI1MDA2MyBTYWx0ZWRfX50TbTd7twx3o
 xgiyGoHCAoM8N/3X2eDUuJ/EI3eC5o26lEs2JIrIqimzKkcsZT6dP+qng6uTVJQuDD/E3H6M5Xj
 7rElZNOpYKH65o9ubvr7RHVg0zfv7Os=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-25_02,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 spamscore=0 impostorscore=0 clxscore=1015 malwarescore=0
 priorityscore=1501 adultscore=0 bulkscore=0 lowpriorityscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609250063



On 9/24/2026 9:41 PM, Shawn Guo wrote:
> The videocc node supplies only the two XO inputs. videocc-glymur.c
> expects a third input, DT_SLEEP_CLK, and uses it as the parent of
> video_cc_sleep_clk_src, so that RCG cannot resolve its parent and ends
> up as an orphan clock: any clk_set_rate() on it fails, and it shows up
> parentless in /sys/kernel/debug/clk/clk_summary.
> 
> Nothing is broken at runtime today because VIDEO_CC_SLEEP_CLK (0x8138)
> is listed in video_cc_glymur_critical_cbcrs and is therefore force
> enabled through regmap, bypassing the clock framework; the sleep source
> simply keeps whatever rate the bootloader left. The orphan still blocks
> any future rate management of the video sleep path.
> 

Hi Shawn,

The sleep clock supports only a fixed 32KHz frequency and does not support
any other frequencies. Additionally, this clock is not currently used or voted
on by any consumers. Therefore, leaving it in its default bootloader configured
rate should be sufficient, and this change isn't really required.

Thanks,
Jagadeesh
