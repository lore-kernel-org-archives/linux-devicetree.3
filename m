Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E845240F75A
	for <devicetree@vger.kernel.org>; Thu, 20 Aug 2026 10:15:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787220910; cv=none; b=rhvk3fAA0M0ZnzkVzY3YJ1iTw0OGCYjpGVcCXQI4kL00C7B2kihvoAXNcciKrLbdvVAfBxQ1XQxc3R9kuKD45n/+ND4J8yg/Vfwbc+oKBuUV8l6o4GvI8Vvlbb0Og2Z0n5dAC8hnAq8xjLXcmWJWFEVngxuKGFJEtgVE7I489fI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787220910; c=relaxed/simple;
	bh=OlnvrzNLh/kIxcNt4tkPLpQC12mGSYwaj2c5jzrl3PM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=GK42a/MGsJxuj7bG0RrBVWaNkkxXC6mGdrGRmGaqvV8NHqGpWVe5DXJWOlobvLuSjm1Hx5TJ9f3ANDPFXNcRYqSOvAOfsMlPoSyX1lahcLh8/DGoQZa64oNxPYj7ep6OcilKGyK9QsVR1lXA+Kc7WyGGvMDCbMUtsgz6CB99shI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=FSOheU5j; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=TeqTI5jI; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="FSOheU5j";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="TeqTI5jI"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67KA3JWv3454887
	for <devicetree@vger.kernel.org>; Thu, 20 Aug 2026 10:15:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	12Wlhblgscwo6MxaFB2wLLKER52RRfKna4iYTekNvv4=; b=FSOheU5j1WTG61vy
	fTJjG9UG9Qn9SZUOQQLbJo1e7CqQWro5SlChNuE1N28Z+tkbEuu9jdY9tQGHfBX2
	y8bULQ5ub+7vvsz3ZGM2PuZDR1ospfzKew80DEvYDHq5ykZP9Syy1FNHrLQwT1SO
	9lLHj7SHyQAKtgXpYj01fIAI1fy7m2AStLQJ0HCrkKeL6RftcHfW6kaLgoeb3mVU
	BRS6Tg/b244SAqXbus7AmPl8o3SVAEmmOfmlnPnpECHrbP9gs0PMoaYEMS4rmj8y
	SBzjKCH+bGHWUhR0mIyh8iBjCwnfKEKuOBKJSZapA2IPGFKynhn8SYzaMBYZWoSp
	tOvkRA==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g5yg881q3-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Thu, 20 Aug 2026 10:14:59 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-52d35a38fafso362911cf.3
        for <devicetree@vger.kernel.org>; Thu, 20 Aug 2026 03:14:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1787220899; x=1787825699; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=12Wlhblgscwo6MxaFB2wLLKER52RRfKna4iYTekNvv4=;
        b=TeqTI5jIQunRUA06FTm3hygsyvLLz92lhpYhRgyI450xrYv33UJ196VtrmjOTLu2QX
         fDqVF0/iYEuF1vutlLUqz43QtTVy5Z5grYJxwHUehaWxEPOOaRMaUBFWRr0XE2JrptYU
         pIjdbGPgzRGc7a0d2N8jWdyk9OeZ3JQX4fj95oiWu+7wWZOJZgO6UqMOecxQVoryI7nU
         Z/9QE/jzrrsuwiHo9TsnbujDY9sVh18nhYw0WrbJKwba6vUog/fjFV7rSOpmBn96mL6/
         zElM1uDbM88GaySAPb5/GE3S662DHCjaSRBkXlB7ODx+uTBakbSBaaUFw+gE2GBYDVuw
         WIUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787220899; x=1787825699;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=12Wlhblgscwo6MxaFB2wLLKER52RRfKna4iYTekNvv4=;
        b=W+uJ1ahnRZ8qafnF1TQOulGKX1k41EKZoSOYW5ILwo8e5bxzed8hH/gOMeAf8+UyU3
         IAIKGrHm6WT3NZr6ROt5fMP90CFGMzd+3mJHR8vBXlb1/uaeM6f/67pZ+jS6aqf2cK4g
         XfPhzW7YFDbmFfJdU96bzrd469NhvZAzktx0FDTMYNBbkZ2MsgpZ4GoT0DqXW7YY+wgZ
         CZv42uOHF+Pz64tANdCxvfS1ger4DOH7oC9LV1pf+lOgnrIBZquAb+8lRIhHFVmeXzyT
         FlemEq5Yhu0PMR55T4BPukYD1gTWFaWY1jmM4KZiW9NcMKBsv/SXtutJ7PwPgRRJ0B1+
         42PQ==
X-Forwarded-Encrypted: i=1; AHgh+Rr/0vgVXuk6s23HyBYT48wGd2lr/WzqIv0lZwYHYpXuki+Wh4ouoZQJL2+KrXe4EoxCmqZZJHVmBEhr@vger.kernel.org
X-Gm-Message-State: AOJu0YxWewId/1CE5Ft+EarimY2fu1J9bv1car+KdecI4gZlXw02mv+0
	BlB9Upho8tcXP/UE0gajUmzQiaiYhyUtEpjrF6bdS90bF9urx93lugcimCFTrBDSaVBz2/+HgaD
	YKmcVdcVzDooVednYhSNbIVfJiJPwq/ccGVVLK9i280szcUHrztIJ79h84wQkwo+M
X-Gm-Gg: AR+sD110XCCuYzthwAJJz6A0cqqq6mWASlUGKUq4H2aiCbB7nM5K3PNfQ0nzZJXngFn
	8ZJK0AZPPtURly9sv/DRunGRnZlhvU74D4kK3nGUFxJIDCkmLSmHS/xCupkeGEhpnOucqv072nu
	ZTVVZ+6hEVi4/dOFFHEy9EFXnqxecptNA/QvAfTZuy99PjTI02EBoH/5t0Fkj9subJPFWidQkUA
	V943oLk//fPnFE9LtV+a9oSyzaSnut/a9HKvEqIQBvqhyL1dH6ip9nYzq2KP62NmPwUa+qcHjOR
	Ad1Zfg4bdNSBW2nuzTmxtB4Eb08JsVPooU54nET7LnTIUj/aantnikH6R02vIpMOXN25ZkBn8Fs
	0gHkRb2mVhV4Z4gWDvy8/vD+j
X-Received: by 2002:ac8:7f0f:0:b0:528:3722:a372 with SMTP id d75a77b69052e-52dd5dfdcf9mr78336091cf.4.1787220899369;
        Thu, 20 Aug 2026 03:14:59 -0700 (PDT)
X-Received: by 2002:ac8:7f0f:0:b0:528:3722:a372 with SMTP id d75a77b69052e-52dd5dfdcf9mr78335711cf.4.1787220898989;
        Thu, 20 Aug 2026 03:14:58 -0700 (PDT)
Received: from [192.168.120.193] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c2459222200sm49150866b.56.2026.08.20.03.14.56
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 20 Aug 2026 03:14:58 -0700 (PDT)
Message-ID: <83d70e26-ed36-45a7-b457-e625ab68b8d9@oss.qualcomm.com>
Date: Thu, 20 Aug 2026 12:14:56 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 5/7] arm64: dts: qcom: Add LeEco Le2
To: Adam Skladowski <a39.skl@gmail.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, Kees Cook <kees@kernel.org>,
        Tony Luck <tony.luck@intel.com>,
        "Guilherme G. Piccoli" <gpiccoli@igalia.com>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-hardening@vger.kernel.org
References: <20260820-next-patches-v2-0-7130d68183d9@gmail.com>
 <20260820-next-patches-v2-5-7130d68183d9@gmail.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260820-next-patches-v2-5-7130d68183d9@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwODIwMDA3NSBTYWx0ZWRfX1QGY1VXNi7l5
 huaAvpsNIpV9eKVvxzb8M4+0zc+U2kEphQRyp5iu2CaV/4ZeNMb4f5rG3EDvOGz8hkO4AcHEkyO
 2KPN73w7Mn5vGYRF8J9cuYq17gD99l4=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODIwMDA3NSBTYWx0ZWRfX03SPcXpnPIUC
 77T3DKEUo4fAcf5xFMVac96HWfzcxvrKynHtFF7o3tj7zkRAOUNgKClZ/84+63C5Sv+QgWQDPZy
 YsDzc491aA6Qv385gkaPM5z1nPyMSqZZRQATcsvgc/iZP4r+XZtig9CU/PfyTX/XYZh5LE1shfr
 pI2j1cWR6ezNpHlUd6H55yRBtInTlwoXkFi/p6X3gAvsGYz4rXlMkx4tKRm/0XacVsH5YfTIZd+
 v/XRHNxiPLCzKBeRydRu7CUl667eOuMZHWjAmSjnX8u+/iqT13D90czRub30z9M/u57eJfj15aO
 ke68KUZx6sW3IZuW84VWNRlnWYI+9/r0OkGO7R/2nAWmiqishxQZRfRBqPuXK4cHpL78a0+T7y9
 LkqydP6XslnT2WdtNt4r5qaDoXE2e3SZWOz9kiQ2MFSQFvOCyACaLX8KQ2z/3g/3KfVXBiukvQP
 6iS9Sr4w6HtsIW99pZQ==
X-Authority-Analysis: v=2.4 cv=Y7/IdBeN c=1 sm=1 tr=0 ts=6a86d3a3 cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=pGLkceISAAAA:8 a=EUspDBNiAAAA:8 a=L9omhr1Cf-tZUxP_opIA:9 a=QEXdDO2ut3YA:10
 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-GUID: 7Zb53Iipzd3BiUue9TdTKY69lvuoKIPg
X-Proofpoint-ORIG-GUID: 7Zb53Iipzd3BiUue9TdTKY69lvuoKIPg
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-19_06,2026-08-19_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 bulkscore=0 priorityscore=1501 malwarescore=0 adultscore=0
 clxscore=1015 phishscore=0 impostorscore=0 lowpriorityscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608200075

On 8/20/26 11:42 AM, Adam Skladowski wrote:
> Add a devicetree for the LeEco Le2 smartphone, which is based
> on the Eldarion/MSM8976 SoC.
> 
> Supported functionality as of this initial submission:
> * I2C peripherals (Touchscreen,Audio amp, Haptics, Extcon, Led)
> * Power Button, Volume Keys
> * Regulators (PM8950)
> * WLED (PMI8950)
> * Remoteprocs (WCNSS)
> * GPU
> 
> Device tree also contains supply maps to other subsystems like MDSS
> but due to missing dependencies like panel those are disabled.
> 
> Signed-off-by: Adam Skladowski <a39.skl@gmail.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
