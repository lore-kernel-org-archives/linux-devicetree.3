Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8B8A030C157
	for <devicetree@vger.kernel.org>; Sun, 17 May 2026 15:02:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779030156; cv=none; b=kdIrmdqrRhvP8lw6MW/l5K+mx7I/5pdFi9OCwcLHY9bsdjLU0Gj0A2376ypLivNoYuA8gee0xcmMIQxSs668KKrONP5upM4PwMWDMDOKYHoYdpZS/JAxXev+YtFoxYHmB36pXcBbRDsppouqdxLANpZU5uVkuy4MDjjXDsAmwow=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779030156; c=relaxed/simple;
	bh=vhE4BRmlJVLjR2T/yRkVWMgD4CCGxjtrsf7sdSCf/8Y=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=puOhwBwAPpKt2xHxWBvYBlOAiS7/t2Mi+VPSPLdMy2FzvoNfZpwyxfvrWTPuNqv4Acas2Z+S1HjU54/jmxmdikim4R0XGXzzn6nqWuBNJY7f8hFlzRMtHnW77k7vpGN0zKfrpHN4f+5alvmukqPEJ1u1EI9rVGXTVEJl+BVlaCo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=QY+Embij; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=HamoegBt; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="QY+Embij";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="HamoegBt"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64H5tubI1683834
	for <devicetree@vger.kernel.org>; Sun, 17 May 2026 15:02:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	bc3DIPoNGYjCW6M7mGZ4Lv9bueeDw25Nkv6QIHhEfiI=; b=QY+Embijj800M9lw
	0PAtlD1CrRAxcz8HUGr2xTRsBWVM8JQUVzYktBBu0OHfvzyzb6qRXdkWdiNsYRTz
	+upE60ROVMwMsC4YuftoN5bsX/MnGtcwc/nXrWzUHoAb7/iXRzlBqjESb9Xz1Mt9
	DC0QdzGdvN/CB4Xyo6f1py965j2DzZ6+9cQKK23ym+qOA+Jm4kRleA/M5YWiBfVz
	ho7dlHjvFDkr8LIYOcdJL9swuXHvHEIOKasKz06tdQj+KcYn4k48eq0O6jHYWNHJ
	hFX87USzZD7KOpFQD6G8Sr9eT7aF7rPhNLy+vTX8+4IJW7VZoS3bd2EFj2B/ngaR
	MjVMEw==
Received: from mail-oi1-f199.google.com (mail-oi1-f199.google.com [209.85.167.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e6hv7ty5y-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Sun, 17 May 2026 15:02:34 +0000 (GMT)
Received: by mail-oi1-f199.google.com with SMTP id 5614622812f47-4824a871018so1267216b6e.3
        for <devicetree@vger.kernel.org>; Sun, 17 May 2026 08:02:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779030154; x=1779634954; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=bc3DIPoNGYjCW6M7mGZ4Lv9bueeDw25Nkv6QIHhEfiI=;
        b=HamoegBtto/EA/qoUhQ9uJPvU1v3zoX7tZQryBnfEm7BhLC6CL2s4zG9aN+ZVgeMGX
         JvEcGTJdCO/5HPUdc5YEpGCEkMKwhsKzRkFOdSSzrtfCp5lt5z2CkqwccPnuJXOwvMAC
         dPg4kqIBGrXm5jEXzr7MuFmB9+BfGDsHYoru3UWTYai/AQ9ouGYWzAE1UmLAQdIH4GR5
         cwfdcmSv+jHdTv3Nfbz9gJ/mpiOZG9MLx9B5uiYcx7g0fqCldt6gZ8R1fVqgXBF7ktt2
         PQyMnSYcBpR/1niQIMFTl3qV4IxsoFDYEhVal91bamZxjMVwThiheivA1tNyyFAEB5qA
         kNow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779030154; x=1779634954;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=bc3DIPoNGYjCW6M7mGZ4Lv9bueeDw25Nkv6QIHhEfiI=;
        b=iPnM4NZcxa91Hax8OOCYURF6N8P2KN1pHEMY3h2D3JCC+hcDXnxEZ1VdCl595MqHL2
         bbADoTdTp3ABnwB9QoSMbZkVg16ueupTcfyLxe04jDY9iD6oc+WTfnyShJsEar4h5O0+
         vBrRcBo0F4pqT5CTCPZudOYQMr5PgZYqEPFksprEVPw2ITIjzdV6aZwKHxpWFDWEc4xY
         nQA9XC+kASowWsBrYpTtxniqM4YWzTrXnr/SCgbasvJ1vPkHysUsuf1i9nt9msAM4kXC
         l+t/qJhSViiekhZ1H/lTLMmyhSXHlsQj9zlmwBOmgFza8lomovSXrHL4OjhuVjOQiAf/
         sl2w==
X-Forwarded-Encrypted: i=1; AFNElJ+cRldFzHi/IfvK5NmneL384EUNrHD8t1/lsKoILllImafVSlQlqbV8Chr1DsiOQf07TvRttwNNba5B@vger.kernel.org
X-Gm-Message-State: AOJu0Yw0ad5bZgFl25nM/vLNADwJd6wUgd2jcDDsADQxe3RB0/RllVSb
	ufRUpq/H7eKC6cQ7RfgRRZzxZIc+WVwuGOPwLR0dZUwTTjREGHyD1SefmUpcitgD9t/sVc+fSDB
	QhT6/tM/NyiuJtQVxNsrGpF41ndryXAkSlzMrcDvrc9qYLd3ue3pr+LAB8q8zvcjH
X-Gm-Gg: Acq92OFHSAOoe+wV1Zjd0dqNs/WW1BKUjQ1JgxgShgsK0oCR4xHcG74IZ6L13Tydbaw
	W0fswun24rbnRkFV4JPBePO+uQDmga9ZmonJi1md3DGZxSi+glcS0NDe2pVIqVeGqG+iK5u1vxM
	w0Dtc6KehdHBpT8ku1xZWqvC7cO39mqbjVCS72oOk8XeehHPwUTFpIRHzmkl5aK8OGamSSmGBfG
	yOxYRSD2TU0yOTohe8ewZRb4geDJHwKcwNcrIVxcn3nmx6CbMw0wUkXw2LJn/m7XbRjZIY8ehsY
	UfHvsAazmvOq3O1KkXRCN4q+deIk7p1qUa/P4vBG5jyTJ2IMAAjMgLLSsxlsaq/ubomDyfPc01x
	1BYX0GCwewTfWfF22BDrpOUvTqPiFjT0M+e+vUGoyLtnqUr+v25EKzmKQcnnYy7WqIpwXzE4kDj
	7AqKZp/V1m
X-Received: by 2002:a05:6808:1982:b0:46c:cdf4:1be4 with SMTP id 5614622812f47-482e55c7cc5mr7485022b6e.10.1779030153920;
        Sun, 17 May 2026 08:02:33 -0700 (PDT)
X-Received: by 2002:a05:6808:1982:b0:46c:cdf4:1be4 with SMTP id 5614622812f47-482e55c7cc5mr7484985b6e.10.1779030153536;
        Sun, 17 May 2026 08:02:33 -0700 (PDT)
Received: from ?IPV6:2a05:6e02:1041:c10:3e20:6c07:e6b8:6153? ([2a05:6e02:1041:c10:3e20:6c07:e6b8:6153])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48fe4c8d39esm197711785e9.7.2026.05.17.08.02.32
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 17 May 2026 08:02:32 -0700 (PDT)
Message-ID: <b54f2acf-bd7f-4530-b9c1-7b83cd3a18c6@oss.qualcomm.com>
Date: Sun, 17 May 2026 17:02:31 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] dt-bindings: thermal: qcom-tsens: Document the Shikra
 Temperature Sensor
To: Gaurav Kohli <gaurav.kohli@oss.qualcomm.com>,
        Amit Kucheria <amitk@kernel.org>,
        Thara Gopinath <thara.gopinath@gmail.com>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Daniel Lezcano <daniel.lezcano@kernel.org>,
        Zhang Rui <rui.zhang@intel.com>, Lukasz Luba <lukasz.luba@arm.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-pm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260513-tsens_binding-v1-1-1780c6a6caf2@oss.qualcomm.com>
Content-Language: en-US
From: Daniel Lezcano <daniel.lezcano@oss.qualcomm.com>
In-Reply-To: <20260513-tsens_binding-v1-1-1780c6a6caf2@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTE3MDE2MiBTYWx0ZWRfXxzqJqj7OZp2y
 osf6uFPtckfh0ugEErxsI5Ov2snrChvnaM+jjbRnI4MQ5W7Q30BdvtC06oyVeVoXWihcodZsBa1
 pqWDmYIUxU4IVoTPw4jYssfjz2Bp4LOjUrSVNSwWzATvB/jFDFOS6vq1AfVzbiFH+WNMri4k2of
 yYAN8rVvg99BGQNSednd2Qkuob87TBMEY+xqaBU0vWpEqUFV7X1HXdferX/yr+TnCVzzkT3lcJZ
 41ZcN919hToK9mdQ8t9YaqtD39SBqRtoXefcYEkZMWOsyYZ3quTFE9YQDsBhXzdyGB9eqc0EBNy
 FuaGF94gPHU9BBMs6DszF5WZ6AlQpZL3EffbVu3fB8pw85Xp63SMkZoW6Sc2MEisou0qVtuunc6
 Fn+ypFlTB7KFfqiL75LuBQacH7A3OIwjvXmy5NVg3hRNV36aBoC3VaRG1fFCMJon6HYmlXa56Hj
 XwS1XsN9o6y83mWQ3Nw==
X-Authority-Analysis: v=2.4 cv=a8oAM0SF c=1 sm=1 tr=0 ts=6a09d88a cx=c_pps
 a=yymyAM/LQ7lj/HqAiIiKTw==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22 a=EUspDBNiAAAA:8
 a=2V97sGT_sAbgTsKPAcIA:9 a=QEXdDO2ut3YA:10 a=efpaJB4zofY2dbm2aIRb:22
X-Proofpoint-ORIG-GUID: Cd0Dm7VO68tkZq8SIrTEVePog-qzC3K8
X-Proofpoint-GUID: Cd0Dm7VO68tkZq8SIrTEVePog-qzC3K8
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-17_03,2026-05-15_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 phishscore=0 suspectscore=0 priorityscore=1501 impostorscore=0
 clxscore=1015 bulkscore=0 lowpriorityscore=0 adultscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605130000 definitions=main-2605170162

On 5/13/26 09:30, Gaurav Kohli wrote:
> Document the Temperature Sensor (TSENS) on the Shikra SoC.
> 
> Signed-off-by: Gaurav Kohli <gaurav.kohli@oss.qualcomm.com>
> ---
>   Documentation/devicetree/bindings/thermal/qcom-tsens.yaml | 1 +
>   1 file changed, 1 insertion(+)
> 
> diff --git a/Documentation/devicetree/bindings/thermal/qcom-tsens.yaml b/Documentation/devicetree/bindings/thermal/qcom-tsens.yaml
> index 7d34ba00e684..a986fdccd52e 100644
> --- a/Documentation/devicetree/bindings/thermal/qcom-tsens.yaml
> +++ b/Documentation/devicetree/bindings/thermal/qcom-tsens.yaml
> @@ -74,6 +74,7 @@ properties:
>                 - qcom,sdm630-tsens
>                 - qcom,sdm670-tsens
>                 - qcom,sdm845-tsens
> +              - qcom,shikra-tsens
>                 - qcom,sm6115-tsens
>                 - qcom,sm6350-tsens
>                 - qcom,sm6375-tsens
> 
> ---

Applied, thanks
