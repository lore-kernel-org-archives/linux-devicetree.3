Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C8211427FBE
	for <devicetree@vger.kernel.org>; Mon,  7 Sep 2026 07:59:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788767989; cv=none; b=oJeaGa4OoSc0hUbzE1U5k9s0X61BQErteLYwE5vW0lT5zMuqaVPsoqoZijQP3wVzbuc6iCC7pIwqMom8UmejL7bwTjU6He81Ev29c/ZXqGtk6IE+Xg9pMgpOXOcnhMpN0lIrcHjv11XX624/ly2SVQ6YJt4nnW2x04gXdfcn3uA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788767989; c=relaxed/simple;
	bh=lMurb8WHICjQOz0jHZq94HqsFYLXI7DQvOMCmN5b7iU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=AZ8NMxU1rgJtyNBJK6rVWFVrskTkKuVMUP8t0udqWlWlDLI6epilT0RCmo71E6H6subGBdQDuyy5FMziIGmI0spMDqRpIIoa4VlE5p11N8sGF9LPuDknVX6V29a891UsdqiRauG2U8RtI2n0KkGVsM5Twa+5FFZuD+XRZqcnlQA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=W6mBB4ik; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=kXIpN6ZU; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="W6mBB4ik";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="kXIpN6ZU"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6877NNYM333053
	for <devicetree@vger.kernel.org>; Mon, 7 Sep 2026 07:59:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	CjJ6/joxMNoyndUpWvHjimxDYdpj29kfkXilh/8W1fk=; b=W6mBB4ikriKG2TQk
	96O1PWEV3sZu/NePa52o8aBRQM1ZyKPW5VTnMR2MqemDK3A+FHLcGu7Y2cCiLJNL
	y7l+tq92dDeP/RiWDdaDxHW7Mzpxm8xteInCe2UZAWnrRpIfGmd/KeiEPZmfbhiW
	FFzwpr9z9P+rKJwq2Gr9dHZaBmFB6ssC95c4WsLngXR7CPdPYMP1p2xdgDh6sDGd
	IMdXOTAYtzCdT7EkyBEyPANDJjrKqzPENqK3Dw15eNY69eS6RxFX1eGsa0Z42SEy
	UpHc+N9rRzeV4wa6KYd5DPsh+MpQuIplVay5qhLhYtEbmOkOnuiZIrl7giJdjFIN
	GK5EOA==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ghrua88xd-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 07 Sep 2026 07:59:46 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-52ea38b1e7eso7442021cf.3
        for <devicetree@vger.kernel.org>; Mon, 07 Sep 2026 00:59:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788767986; x=1789372786; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=CjJ6/joxMNoyndUpWvHjimxDYdpj29kfkXilh/8W1fk=;
        b=kXIpN6ZUD+k7ECCcscEFXRbGsJa8KaEROzTrd8GO68c1Qlqn362mahVIZct46dYZ2o
         GlUqI4QGQ6h1jh63MkyP8k8qVUpJJ8/pGsTIK/pEEW1vHHWCY7DvurvLD3TC2A3k6OaG
         Ah42NzxQIxr4r0SqKdRsdoF7rkh0I1rZG/AfOaj0KAOcUxrvR697KoY89vc1lkAUMauN
         FjxfXCfvZdDo2ywSuYT110+dAb3cCnESqSwiWA4A/vVjcf8LMfzFkOiIj1sl6qgYu8cL
         XifhHq3KjgJEfZbF63hpJHN1acVjYKNwcWmksuQi0CLqdKy3dcExETL5+A6Po5+9v0Oa
         YRpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788767986; x=1789372786;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=CjJ6/joxMNoyndUpWvHjimxDYdpj29kfkXilh/8W1fk=;
        b=s1fpt/9qjEx7hiRwjtMVrxXefHZHA+VaGE0tdayge6aa3eav/YFcuBTPqbNDVxrgpK
         rIZbugbyzqeC/mFOcuOSlDO6AfJF35bsCZ35tKTVnbGL08G7CT5yrd7eWurErEFHwMT7
         dfHT3duMR++ufiWE7o3FBBA7qbsKTFcT2rk3p9cuJzPJCEzisj8R6ozkyAmXqZ+fwI/V
         ci+2wDK8qyVH8cL7E8Ejdo8cKNvEE6LyRNCQ5qwZSkFFOwfsRFSxTSTpALrBxmHGH7qD
         jus0m9x/4xgokNGOI8awyp+bSzD/Vk/fe2HFbR0JQfDgktR/VAkZuzAFAK08Iumcma56
         3q0g==
X-Forwarded-Encrypted: i=1; AKwUvBxaff/BI4IkJ//lSFZ+caKycyfg4Rywn4TEaOwGQmFaIWyeiybOXVRGUQqXSUS0QDL73BopXQUpyOU6@vger.kernel.org
X-Gm-Message-State: AFuF++kXD9xghkekdtRnPITJVrjJXML/vcU7Cg+o7FqOFywAyDkanjo4
	RvD/fSY44ByrEeyPczigM9U7MQR5gulHTePR8cQhBIJ15rTQc28J2HVyEgpBK7bdSwcmGvmdfDC
	kyX8MzbtSSDFhFrUV0Sz8BzEmIv8Ima3jM7Kw8JW7519qzxOAB7BlkOaixkvuISOT
X-Gm-Gg: AYBFou0YDTuuQWbfOxmRR1LjTnEKSq7D41nTYpkBpG+Un/v++9NX53OH/XmwdJ+XlL0
	sIXq0AIR2SFnDZTzCnBAqpmu6FXV+D6pqcS6Ecsky/WqJ3zEP7w/rConKPzsXzrXwLMQlgiZiM0
	CQjXWvFi2mZIDzlrPJmHf1z5fXa/4irb99eSmO7EN4J+vn4vvoI6EHrlVpg9YkGWPm+lu596c7e
	AaXQMKg/tq7HHasnXPPbi00tF0ATlAUjC/wx8aKZ43vPV2B21bJjNlT5/o9eO8ytaivHBCeZujA
	WoAVc/DICdVyjn+GEAXRNBa7Pv3B8sQt4XnqX5Ht81imuJ/0plmfaq2eVls92aOZMoRzQwYRnqM
	SWoT58jhnHcPy+hZjAaPQLA==
X-Received: by 2002:a05:622a:148c:b0:50f:a53b:9d5 with SMTP id d75a77b69052e-53064575926mr120114381cf.2.1788767986006;
        Mon, 07 Sep 2026 00:59:46 -0700 (PDT)
X-Received: by 2002:a05:622a:148c:b0:50f:a53b:9d5 with SMTP id d75a77b69052e-53064575926mr120114161cf.2.1788767985530;
        Mon, 07 Sep 2026 00:59:45 -0700 (PDT)
Received: from [192.168.202.12] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6a7e68a6db6sm3684473a12.5.2026.09.07.00.59.43
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 07 Sep 2026 00:59:44 -0700 (PDT)
Message-ID: <b4e9a3d5-385e-4cfe-b477-e3b5e5e8adfe@oss.qualcomm.com>
Date: Mon, 7 Sep 2026 09:59:42 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/4] clk: qcom: gcc-glymur: Use clk_regmap_phy_mux_ops for
 GCC UFS muxes
To: Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>,
        Jerome Brunet <jbrunet+clk@baylibre.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Taniya Das <taniya.das@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260905-glymur-ufs-clk-changes-v1-0-cdff2c67a8c2@oss.qualcomm.com>
 <20260905-glymur-ufs-clk-changes-v1-3-cdff2c67a8c2@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260905-glymur-ufs-clk-changes-v1-3-cdff2c67a8c2@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: 3mfn9sv8xAi6i_3HDYpHxVTAQ9cHo1p5
X-Authority-Analysis: v=2.4 cv=U+aiy+ru c=1 sm=1 tr=0 ts=6a9e6ef2 cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=EUspDBNiAAAA:8 a=vZgVdhwgRuDMrAwUH48A:9 a=QEXdDO2ut3YA:10
 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-GUID: 3mfn9sv8xAi6i_3HDYpHxVTAQ9cHo1p5
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTA3MDA4NSBTYWx0ZWRfXxe6TU14CKkdE
 NE3463xQXl6Sqayn80Bw3Ao1TuCZnmQGRjRYnEwaNZWZk5XynCjJSOezFqcBww0eNgVz+fK3c+l
 9toKGPpmiIWZmDNEEFEqQCBeahGph8w=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTA3MDA4NSBTYWx0ZWRfXyz6yT5Tc+Vuy
 nhwsOXnWWiYgtfdHipvL0gom46DbSBKZIZUqQKQLMPmVSKdVjkpH12C3d/yIA9SopJN9SYZDRi+
 kx1eAnY0BYwifH9MGa8bB4dwmOvYrdT68SQMCEhRSuSUtPYZAYxr8KUI8htXgf4hxz82bWc23G0
 eKvuJydEtiOeeynE4uSXFzi0ebUYRjFsAwotoIN7D8cKlrRCYgMtn0wMWq+12lLzO/q6ALYDzT5
 8PlblbsFPPdTrthmldbr7gSdKE6X1wj0HmKk8ki51RRktM3mKaet6YLMTjUscV8A7egLQ3icUqN
 x2SG1QjE7T+RPaJ4qPiigi4Xd27C2ZHHfnuWsbkAg/3Io+LINrR9DozH8wkQbI3FxEK+PgUNA41
 apOoLum7OW4xYBfXCsPHEOUnOZs4DQPUQz0bjjYB7swsTAzioU2xJb5cl38fR6TrsKi0szu5GxN
 XeQx1oOLENcsKbIhtYA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-07_02,2026-09-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 suspectscore=0 priorityscore=1501 lowpriorityscore=0
 clxscore=1015 impostorscore=0 adultscore=0 bulkscore=0 spamscore=0
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2609070085

On 9/4/26 8:50 PM, Jagadeesh Kona wrote:
> Use clk_regmap_phy_mux_ops for GCC UFS muxes so these muxes are
> automatically switched to UFS external symbol clocks during enable and
> safely parked at XO clk during disable.
> 
> Fixes: efe504300a17 ("clk: qcom: gcc: Add support for Global Clock Controller")
> Signed-off-by: Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
