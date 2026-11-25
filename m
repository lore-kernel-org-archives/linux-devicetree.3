Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795608131;
	b=ERusm2WqfxeH2eqC6HJwTNihDsBjzGkV1YJZi83/VUlwpYrPKpHK/FIkEqkN4mNCQ5v7
	 XN2F9XIn+6jgzLPciNxTi3h9Srp9YAKYNLLDScg5jtsGLIOycIlBPWq+YiXPXNHGp+MLN
	 Elu+VpmyiBoXomglwMEtleiO5TEBSCZ1HDUn1PTxbQaatvHpH0SxlFqreNiHerkNIuuTF
	 KVa/VRGA+19fEVXwyFkGjef5fXWpmqH/0VfI7oUGxRcVbYzYIQETJR+aCfxz+aZdA45mj
	 7ARC+K0rGqgHXWoN7N2tRTyQyR422VklRpCaDofdWrSMLFxcR8dp+gwE+ECqXFwoNkA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795608131;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-GUID:X-Proofpoint-Spam-Info:
	 X-Authority-Analysis:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=i3jYSnSdn2u/GLu3Pa6dvx+oEPdp+Zst7Dskdp50SrE=;
	b=l7KiDq/pqinbWZ6soGdy0YskvgPUzIXnlmr63sKD9j8M7ZbOLSRtos2Qs72BPYsXghmT
	 bS/zc/sTfLaXlZoHOmBSEVp0K6WMFYhhWh6Gg1/yFylp+mzStqUmlQSLOE05HW3MxZlUk
	 Ydyc7TyKoZD4PUYHr8X/K6w6f1/3mU53bp164bW/ypVS0MLd42izLGJ7KkxElb9OWVHu2
	 qOsmKRH3EaTrjcmMtqfC3yltzW+UKvK1CDWXj9/fa1XuVyQeYQGpb8Lpda1OjiUuRGfHh
	 1KeC6INRK7+jlcz/mPk7SHLXUakfVjtI3C14PlsF8h+zgcs78q7fqa0d0/1RC1ilSAA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=FWZlc+cD;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=ED9434Pz;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2037E606A321
	for <devicetree@vger.kernel.org>; Wed, 25 Nov 2026 12:02:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2037E606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=FWZlc+cD;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=ED9434Pz
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6APBRPuX776713
	for <devicetree@vger.kernel.org>; Wed, 25 Nov 2026 12:02:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	i3jYSnSdn2u/GLu3Pa6dvx+oEPdp+Zst7Dskdp50SrE=; b=FWZlc+cDremacKft
	cqyuED4wIryfBVbpSPhjMFZ/b68Mrl3eIGreRGL6BWues1c67G/LjonhsTQi9Ojj
	pv1NENGBoJtxsViOjN6OWXfWH6BlHdzIQGTNmfyFu3xVhHUvYODgvFCfClQBwXV4
	+MKg2zUFO5uPTyydfqBixUp6WoluO9SjBG/r2feDeL/JV6+NNXF/BL7hL2eqPI19
	Wgs2v8cyhsnyzNJujss6cHH72c97N/bcIYIeCdYqxW6h9nvCLqPyb0ewOA8HskSB
	CfNAfEvJwLihiHbxVQMfuZ/Q2pGI8VvLc3/RF8BIvoM1BMGWnpnMBqSfVMVvRHDn
	IjQNww==
Received: from mail-vk1-f199.google.com (mail-vk1-f199.google.com [209.85.221.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j5vvnrpa8-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 25 Nov 2026 12:02:08 +0000 (GMT)
Received: by mail-vk1-f199.google.com with SMTP id 71dfb90a1353d-5c97957d83bso243562e0c.0
        for <devicetree@vger.kernel.org>; Wed, 25 Nov 2026 04:02:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795608128; x=1796212928; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=i3jYSnSdn2u/GLu3Pa6dvx+oEPdp+Zst7Dskdp50SrE=;
        b=ED9434PzGFakLBNcj/btT2Rrr8gJpqdszjpYMflwY+kt1ZWAZ6bT06yBPT9n/dePwY
         5FfyZ/t5MFXewVINgUNz/wEOIBDp53JYn59zfab+r+/SUE6fgJcuuHZ5aEiy0OrofG+/
         cPVMW3FHVE55WjT5cTo3EZG3VyYRhqtD1BUd0KVaInSirg2vHDHlpVaSNt3OxWzpnoo3
         1gUlBgwA8xrAYGZzuEUMhiTjCynUPDS3nCofbXymWmf/AANklLKJ2eDQxXaDH+z+p5VI
         XZDcjMUUcV52c/J0MGlOku32Ue4E9Ffzu5QWL36Jj5gL/na5Z64SKqLFxroA8uExMBS4
         36Fw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795608128; x=1796212928;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=i3jYSnSdn2u/GLu3Pa6dvx+oEPdp+Zst7Dskdp50SrE=;
        b=FhEGjgnRGLj+9K5C+Xnsmzl5C4wGO8Q5jORf8KAvrRURihbKcvgXIh2Ko9GAjoG7xy
         TWrW14jWcXTir7v7bx7WKTdlkszBRdl0HXMUkVRQvhYctRR2Fpg1TqV6sCKcx9lWkldz
         hK827zHl0p870iIfYpQZw0DbQTpJRiYiBj75t3/+Suz7wJHojPuG6XEZCgFs7GRKq9iF
         px/MuGrLVqdNKSbggnpN57kZRILidoBt4uoSEzJhb+yg/pehoLQwwRfTvO9aTknWODxz
         16e2d0VUW13Y+2Pwd3D28bAIUP45YzN8lGfnKTHZ0ybxWPbBHi0ZUkPIPS1ZpCzwgDtS
         BtzA==
X-Forwarded-Encrypted: i=1; AL+hErFiFmYmhljtd8pBH6vZRjXMio1DVtGAzTcScKHNpVGmPRYgBKRJeR12c03XWrq/SkeigE+Y1wrzQIJv@vger.kernel.org
X-Gm-Message-State: APuU4Z+m1R9wnRCtznWG+DjPUzh+UhWCJDzTRPG1Jie+V1xgltfEqUFQ
	sI5ubYDvHru2C4e/pdlVZxma4CNSSMkY/A58LNkryaLp6gkw0ZQPxYYXyLDmo1pL+N7jgUVHhW7
	orMO+TUBUGR0p4QRDZkhHqcf2Y4xPHfLTjn3KpAy4+gH8znBqQ5xd6Egd9jBvLfs8
X-Gm-Gg: AZFdTZdMERbDVmKhvf+g9MOE5cogxLOLNVhb0WfU6Dk0TwvetntWdMl3MvngDNN5aic
	KVsd/nKHBZbjDxEJYzACreVIPraoubLhE/cbJN9Qohz3HkV0MqekVHPNtxryrYkoEBghnLSHj8G
	ZMhbz8YOcEZg67y8hYYd+VTSnMM7HXv0jbt8KywCUkFhIdb8Lkudb2DPYwNGqFuZnspIaKbdMNh
	vaf5ZIfOlZ4z2w+c05HZn1ytrAOIEYfvICPzdfkv73/KSRBJ+Usg+kvJE9oy6GFOFty4I3B+RkL
	yvSW9VJhRoeY5JbC7Zy2Mn15oM/TtERJKsDg1XxPoY3GKn47x4yNGOKlJSgjrJ2mcvbYcv1wJah
	Yt7vC5qsuqTXcAxFlCDZbY+htwYwCHauLfhRTpqxKiFdLNf940p1thqaaXXyxYqxrQJby9Ao=
X-Received: by 2002:ac5:c00a:0:20b0:5cf:ad27:3a67 with SMTP id 71dfb90a1353d-5ee8af8d7bfmr11581610e0c.5.1795608127997;
        Wed, 25 Nov 2026 04:02:07 -0800 (PST)
X-Received: by 2002:ac5:c00a:0:20b0:5cf:ad27:3a67 with SMTP id 71dfb90a1353d-5ee8af8d7bfmr11581553e0c.5.1795608127342;
        Wed, 25 Nov 2026 04:02:07 -0800 (PST)
Received: from [192.168.226.72] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c513acff65bsm648949266b.4.2026.11.25.04.02.03
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 25 Nov 2026 04:02:06 -0800 (PST)
Message-ID: <e1b4fff2-d7f2-4647-bacc-df55343031ea@oss.qualcomm.com>
Date: Wed, 25 Nov 2026 13:02:02 +0100
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 3/3] phy: qcom-mipi-csi2: Add Hawi support
To: Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Robert Foss
 <rfoss@kernel.org>, Andi Shyti <andi.shyti@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Bryan O'Donoghue <bod@kernel.org>,
        Vinod Koul <vkoul@kernel.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Manivannan Sadhasivam <mani@kernel.org>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Cc: Suresh Vankadara <svankada@qti.qualcomm.com>,
        Vikram Sharma <vikram.sharma@oss.qualcomm.com>,
        linux-i2c@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-phy@lists.infradead.org,
        linux-media@vger.kernel.org,
        Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>
References: <20261125-hawi-maili-camss-v5-0-1483b7f68dce@oss.qualcomm.com>
 <20261125-hawi-maili-camss-v5-3-1483b7f68dce@oss.qualcomm.com>
 <15cde6af-0b9f-4a0f-9d21-4e5ca9107a67@oss.qualcomm.com>
 <e93eee16-df8d-4d49-ae56-3e6ba9c31167@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <e93eee16-df8d-4d49-ae56-3e6ba9c31167@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI1MDA0NyBTYWx0ZWRfX/QYQKxUNwNWT
 +RpCMgkbmHU1N7ydpIUZpYKHZslLSvRH6tDsyRAdxUuOZBSABYrUBfBzk7HNS4D/PYh+fSswvxD
 rqG5zYRrf1C51vRLzzleDvwwu7bg8ZYBW5gpNQB6rdOzblCwz2aOxsBYl9V5sRRdP9gYB3t5i8v
 d1rpltk2bE9vltl1O1FitlRxjbjBrzLNnq+e11kqNuP4WMBIEm16Ot7TIG1kc5M8JTVAgZVPcwU
 olBH3rwkXkgiu8XnQ7/YIEQE9GlJK/EFoTZEdZj7g5VePCoPiYZG6XW6N8JDvtPMe+mjjEqvOFo
 7hXcm/sr6vNRZolqYUQksmQI+Josq4dSFExh+xMK3hAJEsNcKRj3H74xYt4UYN11bdM0mISKecK
 gYnkWZ2KDyTghDUW+CqEWOIkRHaH5zFI+nGkMrgbwXTee9VsymjZruixtRbW+SYj0I3K0hh5Lhb
 oZ+Q+DLTkQxBcAy13IQ==
X-Proofpoint-ORIG-GUID: zVV-p1xhrQqtQJgayPwaPqLUOWzEs9p1
X-Proofpoint-GUID: zVV-p1xhrQqtQJgayPwaPqLUOWzEs9p1
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI1MDA0NyBTYWx0ZWRfX23eG0jhef6Di
 /RAT53iSQJYOuZdRGE93Ki/D2DnrnYf9Fv0M+t35+B+zG46ldSKifhKXUTP9Ksoh5iFaKYJeIYW
 qZPRXpr1wEra/cEIj14GJ5QjKWNe9o4=
X-Authority-Analysis: v=2.4 cv=R4mWitRX c=1 sm=1 tr=0 ts=6b06ce41 cx=c_pps
 a=+D9SDfe9YZWTjADjLiQY5g==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=yOYrsbgnHfbpD3x4ck8A:9 a=QEXdDO2ut3YA:10 a=vmgOmaN-Xu0dpDh8OwbV:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-25_03,2026-11-23_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 suspectscore=0 bulkscore=0 adultscore=0 clxscore=1015
 impostorscore=0 spamscore=0 phishscore=0 priorityscore=1501 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611250047

On 11/25/26 1:00 PM, Nihal Kumar Gupta wrote:
> Hi Konrad,
> 
> On 25-11-2026 16:23, Konrad Dybcio wrote:
>>> diff --git a/drivers/phy/qualcomm/phy-qcom-mipi-csi2-3ph-dphy.c b/drivers/phy/qualcomm/phy-qcom-mipi-csi2-3ph-dphy.c
>>> index ed40934d67eaeba0c6ac7ac75324ac6292fe7d9e..5d91303e0df2e8c5bca3ea8fa2bb831429a8f1ff 100644
>>> --- a/drivers/phy/qualcomm/phy-qcom-mipi-csi2-3ph-dphy.c
>>> +++ b/drivers/phy/qualcomm/phy-qcom-mipi-csi2-3ph-dphy.c
>>> @@ -162,6 +162,126 @@ mipi_csi2phy_lane_regs lane_regs_x1e80100[] = {
>>>  	{.reg_addr = 0x0c64, .reg_data = 0x7f, .param_type = CSIPHY_SKEW_CAL},
>>>  };
>>>  
>>> +/* 2nm 2PH 2p5Gbps 4 lane DPHY mode, Kaanapali table with data-lane CTRL0 0x8c */
>> nit: 2ph and DPHY are synonymous, if you rename the struct to something
>> like lane_regs_hawi_dphy, we no longer need this comment.
> ACK
> 
>>
>> As for the override, if its meaning is well-known (the difference is bit1
>> being set or not), we can add some sort of a booelan override instead of
>> duplicating the table, maybe
> This is not a boolean difference. Bit 7 enables PGM delay in both
> values. The difference is the programmed delay value:
> X1E uses 0x0e, Hawi uses 0x0c.
> 
> Since this may vary with other PHY tuning values, I would keep the
> SoC-specific table.

OK that works 

Konrad
