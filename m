Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C8FFA4071D1
	for <devicetree@vger.kernel.org>; Tue, 30 Jun 2026 11:55:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782820530; cv=none; b=pHRcd1JMbTwM6uKEDJ5BXc2yFYs/brAOmqubpMTvqPVW5Bv2uvhxmHjziwI5FtbWmJCDIaU10xE0YSnqtPrV5ayh3lLS4Ub9fGeinIb1VAJqyw7tcSMlxuyb5ZfVKptqnBRX+uVhjEkc8lDHhznoT7fft5Hitxotuz2/cqGWCrs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782820530; c=relaxed/simple;
	bh=nb7/AXatqNpcYTWfCqRgE94DQ81iaZnzHCdqkCxHp6Y=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=Djy1N36fFfTsav5H5qOPcuP6b4l1r2mbXfiKSv0HBrlskfWI7IfcMxv7ThW+jbCP/I0HOvAJkGX76NiNG7wAtB/VQdzneqSR3/io3YvPZ9EfbGEPwsaFnRCIGETFd/sU0L/uEeHrb8Y3hzwwF3bzkk6jT36mZlAnbwuI7wBQD1M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=KO3ZZ69R; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=BfToT5uR; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="KO3ZZ69R";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="BfToT5uR"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65U9n49E1573623
	for <devicetree@vger.kernel.org>; Tue, 30 Jun 2026 11:55:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	qSo6UPIJkVrgvfV6mdGI9V95crrjfd3F4e0xvwv1YuI=; b=KO3ZZ69RugTbpBc9
	7pJ2CdDGQvHrpkkONaswfMouKIm68bocBdmuhvOqdU5+TfWboGOL8jUaIQKDx0bv
	FxfXcr7Oy6Mn11qZOECBvVQTOadIHrEuk+IQzMvKKk+59F5VUJvNGVU403OGg9N1
	+zMuNAgWRF5pB+H8nAblvg0mjyEb1fnSzqK76vEz5RnO7xnGH4bq8AJovDAlZ4vF
	7CYtrj2vTCpuY/RUjbWlfZuDOHExeNH+cVEqMI7gC1mBuItga6Lg/hmFqpFiSGxk
	ebL6g7DXfJ5PTnM21skIbeSuLq2vu50dQ/6thjbNgjHeVVlzx0VVhJZTIFh0QaVs
	f4+2/g==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f468621hp-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 30 Jun 2026 11:55:27 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2c81c7421abso64682405ad.0
        for <devicetree@vger.kernel.org>; Tue, 30 Jun 2026 04:55:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782820527; x=1783425327; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:subject:from:user-agent:mime-version:date:message-id:from:to
         :cc:subject:date:message-id:reply-to;
        bh=qSo6UPIJkVrgvfV6mdGI9V95crrjfd3F4e0xvwv1YuI=;
        b=BfToT5uRkDWpMq4hHkS8Z5nmuLwM5CNwzs2465/H/QRwV0n6MkKdNC3yc4Ri/BVC7Q
         0utIeJYvWQBXvgLOhzg13gCZWGLy2YWfjGLySemlCcjr6sXLbm+rgQwhebGHujaeHJAs
         Nv+IamcM/k9QTCEWPj53lM1vXx/cQeAvJA5W3iRu2yGiokAowUjhds7eFU7UKWBDvMvf
         NiJ0w0jgWNxnvNdVFcbw2Fyl87siqc8kWWbINBx/4urMVXfB6P2Bm8z6VceH7RGhCVi0
         z9BOAVleG8mY8vkdFn8ZKFlN8wZigl5xcwOjsy5dHclq/ltnLIc5FxCRmB5sKVIuGA/l
         MRjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782820527; x=1783425327;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:subject:from:user-agent:mime-version:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=qSo6UPIJkVrgvfV6mdGI9V95crrjfd3F4e0xvwv1YuI=;
        b=sc+JXpLpleRSioD88+OMn0/CIGYmREcr/cmOVC9xrzMf1Q2jTT08XG3+XH9gH7wIbd
         gdjKk1891w1MCGbZRbr45KwY/lmWKWGEuBjlBR2jGCBtqBMCWi6/O667F/XI/m7FKozZ
         RdiIdpbKLWt4WHeUiQfvYlcXJjDuGuiPPC1RKFjhPy0lLOO1O9TNaPy//R95d//9Ky8w
         4Seyo2SBcnHk+PWqCVbJ+GYRdlq0QOkY3aqIfSiA/jIaCmZ4RUGYtGxvih/2Zv1QhD5w
         Sq1sixR9j62Pq7PHBQ9lO6IjJV/oLZ5NvvxqbA9eZ0Yh1vY92nil5SSuNiJujiv0JLjZ
         6MpQ==
X-Forwarded-Encrypted: i=1; AHgh+Ro1dCVEuQsdB1XammJrbFk/DSntSNxllvWQ/IfZk5oXvzKx0ldh0wxPC3SeQrWu5EJzTIsATPNKTGkM@vger.kernel.org
X-Gm-Message-State: AOJu0YyKq21Kj/T9nT8ZHL6T7T6xcFku3dQ0UxyTkS1vbZZFwSlKdV4U
	ZULkemDCTAstCHR36utZPvU9UlJvYU5gg6Je0bhtmhT7dO5L8reC9naRc8/O3HfRXbVHVz7NrWx
	9D5h1wogTnRSeQvJHoyNcbgGBsYdfL61mK0rXJxEe5J8G1Yv2O+HMCba1UYO8nqpr
X-Gm-Gg: AfdE7clCejzC8NvCTpUjzPq8+zJLfjpdlneUbmeeVHsYuirp1Mzj29Brqn+S5+oD9IW
	udBtFHemed3SId/67jGtDWy557M23ZdDRAHgbMcc/r3QUs2LoFe3slzkvCZrL//JhtgPe6W6WCC
	VlLHfnwP6wRDPnXqr/wEpFHJ0Mj2JuyLMTBXg9S8Nb15ZZPILfs69cpRTGViuFQlMb4zvqdP+ka
	QBovpKiX0mp4ZQ6pQYzP4CgiPVNSOPLYRvv/f1N9ctCY8TnLAEVx3GYTap+86jzKi03Pclet+2D
	B4+9Y8M59echVKbfJvTHfjzmLuiPZ/RWn91pySXmKcyNbpP9L33wS/4bmcdi4b8dlec6VpF1aE0
	LRA+P6wGQtne5zTaiT9fT7JSH5SDbe7wazjDfmh6eQ7qUYxafAvDnSAPTmMUfvAC6wC2wdxpDKW
	agBw==
X-Received: by 2002:a17:903:2409:b0:2c6:f3ae:2386 with SMTP id d9443c01a7336-2ca2d52baf3mr27099965ad.7.1782820526862;
        Tue, 30 Jun 2026 04:55:26 -0700 (PDT)
X-Received: by 2002:a17:903:2409:b0:2c6:f3ae:2386 with SMTP id d9443c01a7336-2ca2d52baf3mr27099585ad.7.1782820526392;
        Tue, 30 Jun 2026 04:55:26 -0700 (PDT)
Received: from [10.133.33.17] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ca382bba19sm12206935ad.70.2026.06.30.04.55.23
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 30 Jun 2026 04:55:26 -0700 (PDT)
Message-ID: <20cd2d3f-48f5-44f3-bc31-884723f864b7@oss.qualcomm.com>
Date: Tue, 30 Jun 2026 19:55:22 +0800
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Yushan Li <yushan.li@oss.qualcomm.com>
Subject: Re: [PATCH 2/2] arm64: dts: qcom: purwa-iot-evk: Add Embedded
 controller node
To: Anvesh Jain P <anvesh.p@oss.qualcomm.com>,
        Sibi Sankar <sibi.sankar@oss.qualcomm.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260629-ec_support_for_purwa_evk-v1-0-e082b70138d6@oss.qualcomm.com>
 <20260629-ec_support_for_purwa_evk-v1-2-e082b70138d6@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <20260629-ec_support_for_purwa_evk-v1-2-e082b70138d6@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: dVyfJ9oVvKg9ECOw_AY94rqVaqnFW3xA
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjMwMDEwOSBTYWx0ZWRfX3LcyMeDw54To
 9pvXl5THeUxIOeP0Eygx8P73rfPMCe3pEqkb3dXs0wRlBAxbUGYQIaGVdRgrIShJ1vE65TMqBf3
 tOyjBwrNVSWh7GfZOawGAAuckRBLcNpGOz0yk8iYg6BAir1ldrOe2JQskb8lE6swQLwP9BRs7j2
 UCPnsh/AVv+2ks4XBQtcSlFLNLmI3xnbsFwu3yzvS1JmrVL9NhykIdzXQaBkL2BLMXX9iqJt3bL
 GlvfkpVETWMxnSYtAGGx7osXRrZMnlLWHil2aNXBxhdTAau+FgSOmKVPdWSHqjQFG5xv9JijJiv
 13QnelP6yxTEu3YNXO8UEfLTf+ksRaO/7RjUnc6fZHXkZ4gDhcghVXyypejKpU780PhBpWqRJfl
 P8M37A8FLqxLxh/z5/OlJ4vp+N9cNUqCxkEB4mckT29nIlgO/w1ng7I31mBTauS2bnLHNwFTUrx
 qsZeX1qQYF2m99KlXJA==
X-Proofpoint-GUID: dVyfJ9oVvKg9ECOw_AY94rqVaqnFW3xA
X-Authority-Analysis: v=2.4 cv=FbcHAp+6 c=1 sm=1 tr=0 ts=6a43aeaf cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=EUspDBNiAAAA:8 a=v9AdQsT0JroIR-EB4BMA:9 a=QEXdDO2ut3YA:10
 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjMwMDEwOSBTYWx0ZWRfX/jNlA2rFrNN1
 BgyrUytcnML+MvLErWfMF+AEeSfRUwxBQ5nhKXIW8K8uUUJjCHJSe/jWr5qPoDCJchZl0kndZbl
 2Cuam9naJ/IvnK1NPO5280KbGOM/zgY=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-30_03,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 impostorscore=0 bulkscore=0 adultscore=0 phishscore=0
 malwarescore=0 suspectscore=0 clxscore=1011 lowpriorityscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2606300109



On 6/29/2026 6:40 PM, Anvesh Jain P wrote:
> Add embedded controller node for Purwa IOT EVK boards which adds fan
> control, temperature sensors, access to EC internal state changes and
> suspend entry/exit notifications to the EC.
> 
> Signed-off-by: Anvesh Jain P <anvesh.p@oss.qualcomm.com>
> ---
>   arch/arm64/boot/dts/qcom/purwa-iot-evk.dts | 16 ++++++++++++++++
>   1 file changed, 16 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/purwa-iot-evk.dts b/arch/arm64/boot/dts/qcom/purwa-iot-evk.dts
> index ad503beec1d3..491ea7769cd7 100644
> --- a/arch/arm64/boot/dts/qcom/purwa-iot-evk.dts
> +++ b/arch/arm64/boot/dts/qcom/purwa-iot-evk.dts
> @@ -837,6 +837,16 @@ eusb6_repeater: redriver@4f {
>   		pinctrl-0 = <&eusb6_reset_n>;
>   		pinctrl-names = "default";
>   	};
> +
> +	embedded-controller@76 {
> +		compatible = "qcom,purwa-iot-evk-ec", "qcom,hamoa-crd-ec";
> +		reg = <0x76>;
> +
> +		interrupts-extended = <&tlmm 66 IRQ_TYPE_EDGE_FALLING>;
> +
> +		pinctrl-0 = <&ec_int_n_default>;
> +		pinctrl-names = "default";
> +	};
>   };
>   
>   &i2c7 {
> @@ -1326,6 +1336,12 @@ right_tweeter: speaker@0,1 {
>   };
>   
>   &tlmm {
> +	ec_int_n_default: ec-int-n-state {
> +		pins = "gpio66";
> +		function = "gpio";
> +		bias-disable;
> +	};
> +
>   	edp_reg_en: edp-reg-en-state {
>   		pins = "gpio70";
>   		function = "gpio";
> 
Tested-by: Yushan Li <yushan.li@oss.qualcomm.com>

-- 
Regards,
Yushan
