Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7F0FD337688
	for <devicetree@vger.kernel.org>; Tue, 16 Jun 2026 14:07:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781618853; cv=none; b=PEnHyB3wlyYcEojGSndVvoDJR4f0rji++Pz4WgIYXlTXsd5iU2YyRU46GAmGzELbtKIbhnlLfxR1sTXWayGCogl6Noj3HONfTz80PifV5ZCpyZEOCQmF/0fXh3YzL65Pw4Z3LIvercuNzUrYts2Ct9QQNRVfREjiQA/m3CiPxos=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781618853; c=relaxed/simple;
	bh=fWNdGAKn0Vg9If9U/WR3XdW1WMUX1D/WI/n7ACplOXo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Fq943MqdHHGS/n9lHvdCOEY2CRhxwnX2ufazX7AbLlE/gaIJoAkOLbvuquwZLQEQEiuAvCEk17WDJ4fs/KM+T65i/sVv9C/gybm/J8CIp/eTqvg6V3gWXK5qxi2B+Blqh4MurRq+aPEj7jHMnErSHTwgK3mCElVWNjsxVoksxxA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=LxiH0pyD; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ABKA10JP; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="LxiH0pyD";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ABKA10JP"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65GDxYnK3969951
	for <devicetree@vger.kernel.org>; Tue, 16 Jun 2026 14:07:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	KNoWQH1x3DXp4pJU5DWF9FFhRF/80Xvj4WBq0B37bzI=; b=LxiH0pyDHECyrTt1
	Vf5/mls2Nuf5cmJaAZXsNYZo32J7/DP0FCRofiOsxh8qUQX9lauUnN33jQ5QBWBK
	ct6lUdqW5tjE8vt2hNRKNAOu7Ue1xErQtxxUl13dJG9aLolSwcGaG2vlSieVyjX1
	jg/Q2YoC4x1TF8Atsz54lNn7KJB0zl7//yliFTOwcL/kQEbJAfuoY2se9peRK2nQ
	p7M8iMbk55aYH5qBMqYfRbbnc/gDIcRyo37M8vVQqVbMn9oiOwTtbNQP3gRizEYA
	Chleu/AEjI/v8Z2gHKxhtN6+UiZyOkj49QTeEDbit//RAQzjvlQMr7xtfx88yq1f
	YPTaZg==
Received: from mail-ua1-f70.google.com (mail-ua1-f70.google.com [209.85.222.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4eu4dkh355-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 16 Jun 2026 14:07:31 +0000 (GMT)
Received: by mail-ua1-f70.google.com with SMTP id a1e0cc1a2514c-966d2f25b83so17884241.1
        for <devicetree@vger.kernel.org>; Tue, 16 Jun 2026 07:07:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781618851; x=1782223651; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=KNoWQH1x3DXp4pJU5DWF9FFhRF/80Xvj4WBq0B37bzI=;
        b=ABKA10JPsKlG+c6gkVtKI0sgzTnIQ451GHjDn00oc79uLO3Ppz15KxR5VzdqxErdMz
         8+Nzn2I8Wfr6z1H0N5dYcAiCqn5f5lPwW9aJ1f+JltY9i2FxvCPyMHFDnyhlBPIUdArv
         eDqIKxc6dhmnOGwXQPoV5+pIvkIXBLIjH8uwkjPE3GXz1gcWiIPfIRM5BFIj4DXpRxQM
         31++21Ee39PPr9LExo2pz8Lb9zg2ymWdRhYxDcqMsiTRFbUcLiSHnTC6PtD4byt9abuT
         Mswbv8X6R//AJg16mPXIkcQuTd7teaA+kiGGvd2Y2NC4AllTrkTStSuBVYPm0ABIvzcD
         8yNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781618851; x=1782223651;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=KNoWQH1x3DXp4pJU5DWF9FFhRF/80Xvj4WBq0B37bzI=;
        b=okBegvNofaGqds7G3+rDvzoTRePmwwHoUDXl+PFdRhxP4CvRsP50Th2o2QoLzoO1U2
         GLhSoxAfmc+3pfi7cTRUpcwdQBLztdRiUgXENAGnch9CFEcDcMeL5ZfmvCnRgUboCoKt
         PiQoXCwCV++aPkXFEJJ9+W1v+7Mgd4o+iJPQdL5qBkm+N9nX8xLBEtZ/EMO7sDTUBdiq
         UsA2YZuoL6pX710VV0vYs+lMhZdxKKd4fRpjAj/3Sv6DGNVprro4PaY4GXbRGrdA1Msh
         YkWRlME9BLmsNoOE6a3OYxBSdmPkkhvxaGtddK2G0dMiWvyLhNwEiDg6PffNMi2UzSmm
         LgWA==
X-Forwarded-Encrypted: i=1; AFNElJ+b3Yb3dYut+wjcmi9DUU7Ggvx/LiWDB5UwjPOQE4hpJMn4xTGX/PW58ty9JOzA6BZWX2APXwgzu25d@vger.kernel.org
X-Gm-Message-State: AOJu0YzzQ4PgRYmfuLQqZNmzaoH2YV4uXyfcb3to/xTItuEDWzHobB8Z
	WSVwJ7Xp5KnztDYQMUTjMv5UEw/214IlBrrwYywPJ9EFH/WRf5rPMs2KPdXH0sHhlYft4aJ+aTC
	uerbqjYxPLteJ50v1gywMpeDtnuwKV3Z30oQqMbmppRWujMZ9IHgCqmrXPZFh4YgQ
X-Gm-Gg: Acq92OEiWcFRcwNi4aU1pXFqpvbDI+TVYXNrtjSXp7OvY/SXDop+Hf8oXM4hCTAYDdV
	xulPXZWK1DzdAhx9Q6ZIc2w0DmKChz2/jMFl4np1JDDjANqqPxhmaB3Bexm8lMvnQAFKnZKl3d4
	+YU3/MNxkFkFDcV/yl1dwq+ugWlf4nTqevUy1sxc45iIE41r5eefAKyhLv8vkTWHxU7eRrOSfpl
	/Yvj3QCmZysK3qSaKKV3vRkVP32hwJ4g+WaSXKLxRzw6HPFrNfAyGg1a46Ez+x6qA9sf0h9dubY
	Rt7QrWTZX0jFQe5PCEIpOrJR84O74KEa/SXo9H+iC3RjiUbfL0gCyQgUdfEz32GZEW8VVLGZ3CC
	8MBE81M1XIcSBfNIrGmHPUDLdjDaTP+WpRkPOBHxzGsPrWA==
X-Received: by 2002:a05:6102:61d4:b0:71f:856f:536f with SMTP id ada2fe7eead31-71f856f5b53mr991019137.0.1781618850899;
        Tue, 16 Jun 2026 07:07:30 -0700 (PDT)
X-Received: by 2002:a05:6102:61d4:b0:71f:856f:536f with SMTP id ada2fe7eead31-71f856f5b53mr990988137.0.1781618850430;
        Tue, 16 Jun 2026 07:07:30 -0700 (PDT)
Received: from [192.168.120.170] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6937948dff8sm5199455a12.22.2026.06.16.07.07.27
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 16 Jun 2026 07:07:29 -0700 (PDT)
Message-ID: <bb3dd1d0-af41-4ecf-b23a-3800aa5414ce@oss.qualcomm.com>
Date: Tue, 16 Jun 2026 16:07:27 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RFC v4 2/9] dt-bindings: phy: qcom-qmp: Add PHY selector
 and Glymur link-mode macros
To: Qiang Yu <qiang.yu@oss.qualcomm.com>, Vinod Koul <vkoul@kernel.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260518-link_mode_0519-v4-0-269cd73cc5d1@oss.qualcomm.com>
 <20260518-link_mode_0519-v4-2-269cd73cc5d1@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260518-link_mode_0519-v4-2-269cd73cc5d1@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: uLRtRxo03WIkoGto0k3q2YP1M2Dyx2Fm
X-Proofpoint-ORIG-GUID: uLRtRxo03WIkoGto0k3q2YP1M2Dyx2Fm
X-Authority-Analysis: v=2.4 cv=Ibi3n2qa c=1 sm=1 tr=0 ts=6a3158a3 cx=c_pps
 a=R6oCqFB+Yf/t2GF8e0/dFg==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=EUspDBNiAAAA:8 a=B5XY--lqvWkliBBd-v4A:9 a=QEXdDO2ut3YA:10
 a=TD8TdBvy0hsOASGTdmB-:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjE2MDE0MyBTYWx0ZWRfX10JZkhqOHi5n
 t0xDhGq2qMA/msnoJeBJEhBx1W0oy8TEDLCNcr2GWmHada9OHIvKeVuSIFqm8vVehMRFcgsEDZo
 daTjU3bHod1EovQmvPJK+RsYk8H13S66Dg5IckAY0KYAtY4mM8VVECakx4eUneT971SKA0S/TT5
 BodC5IuWbI5HAic2+nH0q36wEgp5cP4fj2OVTKzLn08KsJOqu6SKW/VRH4R55bEqkLuDQnzBJCG
 cKtxcKNfZ/EQvpPHYf6zO1bu/NNmNS68CeIVaHqHhQpF8dvAgM6oE0vEz0KrIgjl4NKEdJniGWH
 g/nTeHJtE3SnnV3Uv0ax2TeAC7OzixIeh7UQGlBNhdIK1amjhlO2biia/1KjIIglftYFJ+6S9LC
 O45fqWPvViga5lo+KmOsHml1BaU3quWJQWL6Z/GzN+6LudXuCVIU+a6e+Z8oaNlnQiEwMdKHH78
 TQqrf4pdd1kKWdWeOrQ==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjE2MDE0MyBTYWx0ZWRfX0gAkbcFKbiC8
 3l115n4lnXkiRaVGqrB+qYB5525WmuDFfBhPxFuVnYIBAmCl28hfmnmc1nRBOFO8lKW3u9MhYor
 O4b27ba3LyRt3xMIXZlrg5wutpvXHoE=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-16_04,2026-06-15_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 bulkscore=0 clxscore=1015 priorityscore=1501 suspectscore=0
 lowpriorityscore=0 impostorscore=0 spamscore=0 malwarescore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606040000 definitions=main-2606160143

On 5/19/26 7:47 AM, Qiang Yu wrote:
> Add two sets of constants to phy-qcom-qmp.h to support upcoming multiple
> link mode QMP PHY:
> 
> - QMP_PHY_SELECTOR_0 / QMP_PHY_SELECTOR_1: generic logical PHY index
>   values for QMP providers that expose multiple PHY instances under a
>   single DT node (i.e. #phy-cells = <1>).
> 
> - QMP_PCIE_GLYMUR_MODE_X8 / QMP_PCIE_GLYMUR_MODE_X4X4: link-mode
>   values for the Glymur Gen5x8 PCIe PHY "qcom,link-mode" syscon property,
>   selecting between the x8 single-PHY and x4+x4 dual-PHY topologies.
> 
> Signed-off-by: Qiang Yu <qiang.yu@oss.qualcomm.com>
> ---
>  include/dt-bindings/phy/phy-qcom-qmp.h | 8 ++++++++
>  1 file changed, 8 insertions(+)
> 
> diff --git a/include/dt-bindings/phy/phy-qcom-qmp.h b/include/dt-bindings/phy/phy-qcom-qmp.h
> index 6b43ea9e0051..befa76f8392f 100644
> --- a/include/dt-bindings/phy/phy-qcom-qmp.h
> +++ b/include/dt-bindings/phy/phy-qcom-qmp.h
> @@ -21,4 +21,12 @@
>  #define QMP_PCIE_PIPE_CLK		0
>  #define QMP_PCIE_PHY_AUX_CLK		1
>  
> +/* Generic QMP logical PHY selectors */
> +#define QMP_PHY_SELECTOR_0		0
> +#define QMP_PHY_SELECTOR_1		1

Is this for the second phy cell? FWIW I think it's fine to use raw
numbers as they're just indices (i.e. "nth bifurcated phy") anyway

Konrad
