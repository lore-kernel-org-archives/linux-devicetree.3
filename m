Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7025E4749CB
	for <devicetree@vger.kernel.org>; Mon, 14 Sep 2026 13:49:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789393788; cv=none; b=kIgFC6NaSktcJcsv1YTNxUGZ8kW/K9N/UKcQXOv36Pieng4p4VA23PXKYFtetybHGTMIrTGDJK4U4pCz7CkhBCQ8H6r0faoaUMou+yR1uJjiieBsXqQXbB1B+iHDg/7gEZ840DyDL84FQZv+AuQwgqldF5gSrj6wX5WjU2J90uU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789393788; c=relaxed/simple;
	bh=6AHLyVE4QuyvdlTlYMJyx2H1xgqwD8Xf4hHWGOe7I/Y=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=H42woPe1cQ5AWZMuCu5KX/IYG/CiY1Xn5jyJ+f1hXCJX/YvbNgqf9zYypO4Gaee+zpFYd/J3gKyqIai2yfs3cNKYnD4/kSluu6sg56JemqcyrewVP5shEtb7JmIAQMzkshHr/F2eDUhrS7oSn7QqDVMhXLDkXUrIGjvxpfTuZqM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Olnp8RNG; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ignK/eQ1; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Olnp8RNG";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ignK/eQ1"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68ED0TK7607557
	for <devicetree@vger.kernel.org>; Mon, 14 Sep 2026 13:49:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=66Ilw/BhdQorwglPgrPXKGQ8
	DdohrA6wrNblbndAVK0=; b=Olnp8RNGiwifM5mM/xgV2jCyyElqj0zcVQokDg8c
	P6hKbRv7fyRwyujvR0UdL8jQxHQQ+bQGjNbW3F+KWwvqRz+mwiaDmde+3s0Z+Eoh
	AClPlboLXcnsfIjo8yKI3GZ+rV4mhu+XPWO2lw4CW3NtyafDiX5zn4R7J1sB8OJN
	0LSKd5kzzRuX2ZvMcrKd1U2fpvm1Nh6p2SjjonD9LdAvLwoT7wZgpI4yH+EJ8Pxv
	/9nWdHC2c5OniYVArfCyOAgwaAS1izZVvKd/D0AShqUVFyWyNMx/0zgnMBvVNjmp
	dX1MLXKTheYHcpunhVnyetTT8w09jP/Ui/Nd6MOyLc6Uow==
Received: from mail-vk1-f197.google.com (mail-vk1-f197.google.com [209.85.221.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gpg2krfnw-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 14 Sep 2026 13:49:45 +0000 (GMT)
Received: by mail-vk1-f197.google.com with SMTP id 71dfb90a1353d-5c82c2e9761so777796e0c.0
        for <devicetree@vger.kernel.org>; Mon, 14 Sep 2026 06:49:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789393785; x=1789998585; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=66Ilw/BhdQorwglPgrPXKGQ8DdohrA6wrNblbndAVK0=;
        b=ignK/eQ1Sffhng0u11c3ZzyL5PwFOa9bneVjwRjjiFumJOGYq5SK4qi4PuLigl4yBc
         eDU9coWu3k50K++YWjbiwwcQuFQ8UzJOYu3nYrxLM9/Kl/KIfEqX0kf7uBrzCApoE/0l
         0vLOl7oJ93CYXjGwq4eqqFLGXP0ILL07KkM8Qa1oTCO62t3gvErPg0kCaE00G9X9LtTw
         tVtr+vTM2ZyA1WF7V2xx6/bTSYMsX13Vbc8SaIFfDgBvGMdfhIxgtsYSnkwFeftJdmdV
         WagQ+8oiwOCYc2psfWIWBQr2bjnX9jw+CaFm+XiG48R6AQasaL8DyE6isbGgEqiOHwdm
         sSXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789393785; x=1789998585;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=66Ilw/BhdQorwglPgrPXKGQ8DdohrA6wrNblbndAVK0=;
        b=dvh/E0EO6860AWTzGyE1I/vPPh9nD6jkGpjCmTka5GkQs8cGR89fXpdcJr2xt+6CzZ
         p3kdd7bTiXs2hlqkdnwfvBIKy0ofSgHB++QCSpd5N9rIuHH5vDECY3gLS5lxVI57EB1n
         34dFvk+GDirwPCDll8dm/yNeQzON724adg1i5zEHhqJA1JzK77INsBSc+AsMdPb5Rkbj
         xo6/Hnp36Zh6gTHxA4+nvLYMPTtDYW6MUHZ/piSzpjQFrvhSk/OSvU8emXlZtNBMwgbO
         xfZfVwzAGTapdVkmUVAThN7w9Xj8ypV4a3muBgLQ6aXgf+678qD+qijLvr6Ei7YsF14C
         j4Gg==
X-Forwarded-Encrypted: i=1; AKwUvBxJvolx/WYrxrcQ9XAYbrXKBbxAKgXoPuqQi2/Aaw0NlzRqTUVJLQQNaOYQtxWktKb4/uHKByRatmVQ@vger.kernel.org
X-Gm-Message-State: AFuF++nyBEuxiDLamwDiapU5Nrfn5bABownX79QR0oSpXjhx14ifHB0W
	ZNQLKztyRghtV9cDN7pmjd+HzS3W5q8rtCmVCBKq5mffpWKZUKal0V7WVO+0JHrtRrrPh3EH7UJ
	Yba58iEjJw361X9eYlTc9XYAFLfVoQmiTBjZVsosViXW8lzaBp5xmGV7CQiO0fp5j
X-Gm-Gg: AYBFou1V3TcEzpgX0ufGHhCJv/rZ5UEZOsleCO853mF/hFV/AUq0oaLOU2XbpYOXLji
	hDpsIVw4KjBK6S4P5wtOPXnGbf1PQtrUlti7TdI89iB0hfOWhRme7b51pvwzbihWrW+lGviaGa9
	XzOQvUF9ZWUkjP7zocuMWoAMznIsu+FYQOVQq0t7pJZx+bwLIaQlAEie/uYMR972JhswR0MGbEx
	/swEC3xs4ZR4KD8b2VR8CEeUPK2UxvVE41pPBbkRE8/+1wf2SKkyO9H5QgXypYpZemEuL9GAmaL
	6V0SKr0KeZMTdYlzqDB/p7RuGO/i9G7XZU7lj7Ofc1mtIur8rtmpX39knajj8jBSiOD7eO16s0U
	0O4s77LMEh3z3jVo=
X-Received: by 2002:a05:6122:4895:b0:5c8:46e3:ec57 with SMTP id 71dfb90a1353d-5c981aa9b09mr2352268e0c.1.1789393784374;
        Mon, 14 Sep 2026 06:49:44 -0700 (PDT)
X-Received: by 2002:a05:6122:4895:b0:5c8:46e3:ec57 with SMTP id 71dfb90a1353d-5c981aa9b09mr2352119e0c.1.1789393783803;
        Mon, 14 Sep 2026 06:49:43 -0700 (PDT)
Received: from oss.qualcomm.com ([86.121.170.232])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-486eb33fc02sm26132106f8f.16.2026.09.14.06.49.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Sep 2026 06:49:42 -0700 (PDT)
Date: Mon, 14 Sep 2026 16:49:41 +0300
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
To: Shawn Guo <shengchao.guo@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>,
        Yu Zhang <yu.zhang@oss.qualcomm.com>, devicetree@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 4/5] arm64: dts: qcom: nord-ride-embedded: Add WCN7850
 WLAN support
Message-ID: <fdt6ma52b4ljob67egrfpai5m5uuejqab2hj5jbu4nmro2osg4@uhqloj4mptw6>
References: <20260914071944.164217-1-shengchao.guo@oss.qualcomm.com>
 <20260914071944.164217-5-shengchao.guo@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260914071944.164217-5-shengchao.guo@oss.qualcomm.com>
X-Proofpoint-ORIG-GUID: UWpWh1HRhkQ-GaB0hbeaCz_QN44ujV8U
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE0MDE5OCBTYWx0ZWRfX8TozrIsNRHc1
 FcTpF3k7ldL2N7EIcBUzSHWy1s6O1N1UdLWwX3G86YvwiTOUfZAKhxH6E6TfSkYH5fXn2SNO7mi
 UNjVrveb4yOnXBVQ1CTRyQW+3Ox+9RlHCWakVbknqLFld0nh4mjhKV+/ASHnML7jCYZkn/q8Ruv
 UTQtYMFu5QJoEH8SrEOY9EcamtaaeZ0mlE6RTdSUzrWWieF4X/KN3X3HvR5lcPkGSHF8RwyQ92y
 pICZZiNJeg/tMCBIqLHIsW+61pyaoLYMgv+TjQ8gpByPi4ILNCRknsk4wE9W2EEVPevgC/W3pGG
 9bx9/d8rohbZTKjZ+J45azyN9WFVFdei49zh8caSCNbOCy3yrkQAZI01xDbOTyfY7+wp3OrNFQv
 /vfGUNskwin6QEgmROZ4NwegYsBbHLBtEyv2+WL7XXRom4qm+jDIohAwHAzzKVHapFWQK6/Pbx6
 63mL1+1MdsZW8hR6ebQ==
X-Proofpoint-GUID: UWpWh1HRhkQ-GaB0hbeaCz_QN44ujV8U
X-Authority-Analysis: v=2.4 cv=M7TYuCws c=1 sm=1 tr=0 ts=6aa7fb79 cx=c_pps
 a=JIY1xp/sjQ9K5JH4t62bdg==:117 a=po8fGBi+ks8MzcVQGuqtFQ==:17
 a=kj9zAlcOel0A:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=EUspDBNiAAAA:8 a=QryoO0P2UFxYqXaw9vcA:9 a=CjuIK1q_8ugA:10 a=zgiPjhLxNE0A:10
 a=tNoRWFLymzeba-QzToBc:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE0MDE5OCBTYWx0ZWRfX7fvAH0ElvmIE
 T2H08Nk5VSXcxqPEQJ2da38qNy0Z6OPcSFQnIxm3OTXXZA+SHY6VVPLp4gC4mIB2qTobxS6DSJL
 RNNsfVSAbrIWH+HIJSqTfyfKeUDUZL0=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-14_03,2026-09-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 clxscore=1015 bulkscore=0 impostorscore=0 suspectscore=0
 malwarescore=0 adultscore=0 lowpriorityscore=0 spamscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609140198

On 26-09-14 15:19:43, Shawn Guo wrote:
> From: "Yu Zhang(Yuriy)" <yu.zhang@oss.qualcomm.com>
> 
> The Nord Ride Embedded board carries a QCA6797AQ (WCN7850) LGA module on
> a connectivity adapter card hanging off PCIe2.  Two PMIC GPIOs gate the
> module supplies: PWR_CORE (pmau0102_e GPIO6) enables the DBU_CORE_VL,
> DBU_CORE_VM and DBU_CORE_VH regulators feeding VDD_CORE_VL/VM/VH, and
> PWR_CTRL1 (pmau0102_e GPIO8) enables DBU4, which produces the 3.3 V rail.
> PWR_CTRL2 drives DBU3, which is not populated, so it is left alone.
> 
> Describe those rails, the WCN7850 PMU that derives the chip supplies from
> them, and the PCIe endpoint node consuming the PMU outputs.
> 
> Signed-off-by: Yu Zhang(Yuriy) <yu.zhang@oss.qualcomm.com>
> Signed-off-by: Shawn Guo <shengchao.guo@oss.qualcomm.com>

Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
