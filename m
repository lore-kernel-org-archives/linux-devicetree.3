Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C5F1A3803EF
	for <devicetree@vger.kernel.org>; Mon,  4 May 2026 22:35:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777934106; cv=none; b=THSotOP1YjwZyfu/qNyQqqwGyRE8U9TbNq1D6J7wbd5GKjb9R9q1/5EhU6HtjXe4Alz8p6fB3ioy7VyQxov7Ow+UNRLyJxfcZddhbIOz6eqa6r3Qkdvccxc9ZasHCrjuXLv/7iH4Ex4eXSZ8kVTzWRGg8uc7xOOJisC91n/r74I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777934106; c=relaxed/simple;
	bh=rt1E0QFnkxfnptgvlnG73puBASDaeFdz8fWRDtSHGb4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=WEPp5bE5DNa5rxHnHYeKl5miP+g5rlIyu8kzVb2P1pe5OvDu6Cs+kz9WQx8AByonwvLJebcoSr16BFmVHG+jhU9onT6ey6qQblB92j6V2jHuHH4ybg4Y1tWg2DXMqczeHY+ZSF4dL2pHcQDJleleHn+9cJouMNpr4XMMAcCUDnk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=LWc86HU1; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=gFLGuhsq; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="LWc86HU1";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="gFLGuhsq"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 644IhVqR4128663
	for <devicetree@vger.kernel.org>; Mon, 4 May 2026 22:35:03 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=juJhpaeQMcQi31hFdx6qlzW4
	XzhmmQ078AV4wwuafy4=; b=LWc86HU1TQOHm6Tr47q+r2OoS0I1MJae8PI/tItK
	hNLZdlQi2vCxu1MhXZ0sv94FOMC+6vYZapMOxTmuLoXqDt4hVvgwQcT+qnPC2mwb
	C6OLQ17mcig1bBKmuHDn/0kuv4lgZHKhZSMgmNo7sJpZndvjFxwPxznPahLoL2uz
	htDPkvN8oSkcIeN29zboLgodjaDaUw/GoZR7adDY26SF3hWJPYDmbE/HEcKn3muh
	fFKPDQednCd7qo/RasMOcntx6Cx942b+B2oWFPmQT+RP14y3Y2t8L92vMsPk8CdC
	z1FJHdGmnxVj5QqQ9a3Jpt4S+DO9C+rkjXhZcZJcNYh+hA==
Received: from mail-ua1-f70.google.com (mail-ua1-f70.google.com [209.85.222.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dxsdw2j7q-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 04 May 2026 22:35:03 +0000 (GMT)
Received: by mail-ua1-f70.google.com with SMTP id a1e0cc1a2514c-95d25cc8f5bso1573220241.3
        for <devicetree@vger.kernel.org>; Mon, 04 May 2026 15:35:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1777934103; x=1778538903; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=juJhpaeQMcQi31hFdx6qlzW4XzhmmQ078AV4wwuafy4=;
        b=gFLGuhsqOoHN7ITr8lLZPdUi1zMF6BfF/36X5uKPaA5u49N/S91dcEpDtwVE82VVil
         HXZgnJu95sPD8ikRCYzsVkU/XuQPp8qVHMrPYOTM+gYuEoYqXVHrXXtPx5PCNiMbT02/
         NNORf+inndSvhedhZwUSPHmZOorwvG2fOwOvN15+xMqquKXBI2vdt90N5QV2zI2qq6q0
         bokX1bty5v3DIBJLxHEWf1dUnPL0im/zmUSrU4M2T55Xkyq7QVamylpAU3hnlONH2Mz9
         rPRB7+7aNVPxxOcDZY7Q1R6vdE8VNej5IZ4iFnUb06cHF+DzApuAtbHlu2xWvXb2Gnxe
         WTxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777934103; x=1778538903;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=juJhpaeQMcQi31hFdx6qlzW4XzhmmQ078AV4wwuafy4=;
        b=p7P2gwLiY59Drumm9J1hf5xezDIR4fwMcK317n4PTXd0kkcoXVDI2G3voS6chYsrM/
         sVyeby4eeHLFWD1FJ8gXWjZXDR/NGvUnqOhnaoM8wsilfNGk0UQTT0b9q9Hqejq9YZBM
         DNJHnnfxbWiZyDvJZTgHbRK05a7HZtAUWemRZkECF212h3AXXK4llCXJm3+5YEeJQqK9
         wkK65Z/EWQM6q4eFxYQf546hWBVdEnz7lx5T3S2hnkX7lwBVUhMwiKb5g9eSE7NSxwqH
         VnU4rmGzP02YgXnbKG9Zu423uUpe1QIQJ4m9ZaSbq+p/KtSQ8UVcHfowBY4gSCrsDPm3
         CTHA==
X-Forwarded-Encrypted: i=1; AFNElJ/fT7Fjh09sGk7KwvARdVHZ5IkjyKZBrSERn3hXfTxWt8BG4OIWgwY3A7MUQDJKp0Fm2mnFhnrI0jZB@vger.kernel.org
X-Gm-Message-State: AOJu0YzRA5fgDhpkxJrSTKfnQ2VYOKRuVogIcS4fDo+mcawX+la8LRG4
	DIcrXjNUsi6MoYMOxqKt3dbsGjW1Gf4Wcaze+mK68iHV9lXLTKGuvENyuhY0TYNbpLzBWJqOAG/
	NsS2wJU4ADWAJHJ2ifl5jFKBwLSuEyD1G8O8RMLOLRAsi3j91k1GrnQKz8VbHYwej
X-Gm-Gg: AeBDieu5VIPVnFVGSu89YPnz2H0TCCglw+B66LPwKknkWMgVO/pAArN7ZICF2xiSzqs
	1momriQ+9Ha8Ag4gmZ8+xUxJhZ+J2oEQBbKfwUL+qQ2x+3mBbs8LDAIGiOCpUtKkTi2Zhon4R+t
	Kp4oLJLBYNNv74j78C6xgRc2Mij0I69ABYzxmjtNwB4kHrFZqL9A++CaPLI+AALWt7RVWj37vLq
	K5Jy4KMIHVoNUvw2RQl6a+rLAlJ7izZbwXUtYuAktf6cMDj7pSEBKRmHu0aSSlF8K9RopqtZEE5
	10IjpaGuoVwfLNO8fyhQGH7hrYmp9BK24fx76b4m91L5899X2ecm8B2SCHJpTXiCruuA5zElY0v
	O1gF9RVVFZofxFipTdTVH3gDlncI4nWqGtMAlt+TeyojmrzRbMwg38WrA6/ZnojH1I5F/Yxa6G2
	gdArHImA0thdJ1S6erfLeDyfVPuBB/KARN7R6OP8t41IDSRQ==
X-Received: by 2002:a05:6102:1606:b0:62f:549d:ad1c with SMTP id ada2fe7eead31-62f549e2478mr1356221137.17.1777934102962;
        Mon, 04 May 2026 15:35:02 -0700 (PDT)
X-Received: by 2002:a05:6102:1606:b0:62f:549d:ad1c with SMTP id ada2fe7eead31-62f549e2478mr1356195137.17.1777934102388;
        Mon, 04 May 2026 15:35:02 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-393a11fcf41sm12255651fa.26.2026.05.04.15.34.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 04 May 2026 15:34:59 -0700 (PDT)
Date: Tue, 5 May 2026 01:34:56 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Neil Armstrong <neil.armstrong@linaro.org>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH RFC v2 3/6] arm64: dts: qcom: sm8550-qrd: add SPMI ADC
 channels and thermal nodes
Message-ID: <nbs7rqlfukx6jq7aoc6r6kw4tjoloqnaclxtm4bm4vbwhjcxe3@nkcdrqjppgbo>
References: <20260504-topic-sm8x50-adc5-gen3-v2-0-5cc04d6ecda0@linaro.org>
 <20260504-topic-sm8x50-adc5-gen3-v2-3-5cc04d6ecda0@linaro.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260504-topic-sm8x50-adc5-gen3-v2-3-5cc04d6ecda0@linaro.org>
X-Authority-Analysis: v=2.4 cv=a7AAM0SF c=1 sm=1 tr=0 ts=69f91f17 cx=c_pps
 a=R6oCqFB+Yf/t2GF8e0/dFg==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22 a=KKAkSRfTAAAA:8
 a=6TFKjZ9nwxz7Y4waD9oA:9 a=CjuIK1q_8ugA:10 a=TD8TdBvy0hsOASGTdmB-:22
 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-GUID: VlOF1xH0wOFF3hHqQwisE6LOXfUKH3md
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTA0MDIwOCBTYWx0ZWRfX8/Yj16nC3Q7M
 cv5oR5ONND62eB/Ecm+Tc/fhX9Agq692ecjCA3SuV0wpHsTtucqf19yejANOyWi60629vLy05yy
 nadnwjbelPi/rDnJNvj2cqnouDvGBRf7ExGUqDdT4pwk179eMamuDbm+BioSQiS7xsuUnnR4f+N
 zc+Ra5yNcdO6rI8fZNPHA8OcnYw5H/ZftNpDX8aS45XPclX34VRMVDjapbyuXYuHQaegdei6CkE
 Ult9WQ9QT06RCpaxG0gxxvugSM5M6EuA6zkRN35mwiuE1OiET+rRFXq5Z6c/pG+a600dR3Cjmfp
 OuENw2tzkAlXe9NrwvMnDuv5RvkFlperFrMs9PitTnbCvtrc0BekjvWXhYcqFC3B1umgkWAl+jK
 4UHyasLZfyftE6yv+Y8OD+ipvY+m8TVrvm4BrQAyI/QGjRGPxviGJOBZ2UAnJbipuQRO0n088rp
 g2Z1JihDqgFDe81eNhw==
X-Proofpoint-ORIG-GUID: VlOF1xH0wOFF3hHqQwisE6LOXfUKH3md
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-04_06,2026-04-30_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 phishscore=0 spamscore=0 adultscore=0 clxscore=1015
 suspectscore=0 priorityscore=1501 malwarescore=0 impostorscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2605040208

On Mon, May 04, 2026 at 06:29:51PM +0200, Neil Armstrong wrote:
> Add the SPMI ADC channels on the PMK8550 SPMI5 ADC3 for the
> other PMICS on the system.
> 
> Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
> ---
>  arch/arm64/boot/dts/qcom/sm8550-qrd.dts | 279 ++++++++++++++++++++++++++++++++
>  1 file changed, 279 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/sm8550-qrd.dts b/arch/arm64/boot/dts/qcom/sm8550-qrd.dts
> index 2fb2e0be5e4c..8405cb9e0d6d 100644
> --- a/arch/arm64/boot/dts/qcom/sm8550-qrd.dts
> +++ b/arch/arm64/boot/dts/qcom/sm8550-qrd.dts
> @@ -17,6 +17,9 @@
>  #include "pmk8550.dtsi"
>  #include "pmr735d_a.dtsi"
>  #include "pmr735d_b.dtsi"
> +#include "qcom,pm8550-adc5-gen3.h"
> +#include "qcom,pm8550b-adc5-gen3.h"
> +#include "qcom,pm8550vx-adc5-gen3.h"
>  
>  / {
>  	model = "Qualcomm Technologies, Inc. SM8550 QRD";
> @@ -205,6 +208,92 @@ platform {
>  		};
>  	};
>  
> +	thermal-zones {
> +		skin-thermal {
> +			thermal-sensors = <&pmk8550_vadc PM8550_ADC5_GEN3_AMUX_THM1_100K_PU(1)>;
> +
> +			trips {
> +				active-config0 {
> +					temperature = <125000>;
> +					hysteresis = <1000>;
> +					type = "passive";
> +				};
> +			};
> +		};
> +
> +		cam-flash-thermal {

Nit: I understand that the nodes are sorted by the sensor channel rather
than the name. Would it make sense to add a note (here or in the commit
message)?

> 

-- 
With best wishes
Dmitry
