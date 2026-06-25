Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 41B3F38422A
	for <devicetree@vger.kernel.org>; Thu, 25 Jun 2026 09:30:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782379855; cv=none; b=TcKPGQUtS4mv3TYiiSr21eyqBsasNZUsI5bOXV1/+cXbr7ZkIiNxbVgmdTRCuDFbDSVj11OJlw2cmI1w7StdeyoBaY+uGlaRRjRD+VuCFkm/jI+nm6X8xwY3a2YRx4u3ATBnxqs8yogoSEZSmYRebzO70pOpUOGQpQ00jIPB0Z0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782379855; c=relaxed/simple;
	bh=Ti2vyQS/TU5C7wIgQY3ivFIxKmWrKEzhF5JB+whcpls=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=f6qI0EUMWneuC42S0S9FH7k2+QbOdvB7F0J2IacisJHIGOvcSqZe6CrdL8ARdKetV+eot5SavMC5pyHmV9TRg47hbQbRnuCP6cAGZV5NFb/2nQZ53PS1PZzKu4+qwU1x6P4iFzvldoYQIclc76Ykqm8n8TKQJAWMXyB3MU/0ZdA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=NOXp3fKt; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=jGdezW1H; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="NOXp3fKt";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="jGdezW1H"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65P8p9hY2951636
	for <devicetree@vger.kernel.org>; Thu, 25 Jun 2026 09:30:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	9kiNU5eCrBUsFdtzJac4egp5/e+quc8h+dzXJz3unbU=; b=NOXp3fKtefJwbSdd
	yHYqPtuwEHf3CCcnxnnbqQmEVagIiBVZMLB5WpZykx51jYJg1ceemLXFOyTob2Y/
	0cRXoCQshJRvJYTnPcASBMs0Ug5LbqGe4f1M6HAC54zNfVUA/d9A8HQnnSX7PK0t
	7HQbkGnvsy0vILul1aTvqGxi7TOZdEzKDIS/8vXFASdNAYevX3YYGUgZxUqyxvfI
	D8WDTR4ljYE9Zglu8DdawiyMuX53BMk+ACAkt5DD7cb1TvYS3nkzoUS/xF6wGbzJ
	Wl94fo52XyULlju2r0KzFlyky1zyBWFG4LoXwySTDSUR6dIHJg58ApOUZJsb0ZPr
	SEZgmw==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f0yynrfj6-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Thu, 25 Jun 2026 09:30:53 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-5177b12d7bbso3742081cf.1
        for <devicetree@vger.kernel.org>; Thu, 25 Jun 2026 02:30:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782379852; x=1782984652; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=9kiNU5eCrBUsFdtzJac4egp5/e+quc8h+dzXJz3unbU=;
        b=jGdezW1HHPrZRvroJJlQZR+jiYpeeVWHBf08/jboWGAP55KxnfUtqPhRPwiB2CLisT
         EZQMFgFRvEgsAE3pfPBore+6/0WeYRcjiwvurXtVQBsEgnA20fhaZLfmUm02Itc+gZxY
         JqwdpYlfB7sPw/SxP0VldvaPTSKawnjmhO55I/6xGeE7YOU3mOWp4rnzTGhdzwCkEaFa
         4ORn4s4Xo4MjmjddEHl9VM9iEQwofOQ+wC5DaaZJY98j/Y3kRTlWGk4bdNU/IgFf8UqM
         fPw/6NR5fUkTJ6f3EZ5Kq8ZTQ2fuzDhzYjaaKk1W1/visUB9oan77fskNmWvxaiK6x5a
         U3HQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782379852; x=1782984652;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=9kiNU5eCrBUsFdtzJac4egp5/e+quc8h+dzXJz3unbU=;
        b=juXqmG1J9PQvta9W1ZbHasoMtbB2TRg290knyvIKNAk2y8c5atJYqzc2KHBKjz+XiD
         YkgvTwSEucWpVfQskJR5/ZBzhtRBCjahhfz1HQKXdgt7PtMVYu3czUeSO1cES8eVBj1j
         XY5xvCObW/xd7sRrS62fhJYXeMeQAjiS51j62sE2jEmWoQvqWBFjngFvnCxnWaDJAn06
         Y9vgKz6pYnwKMZ28dOL1JeLQYqYEYnzfrkbOOvd4rOnyC5T7P0DLrG7ng5yHFRWrrSgM
         a1sZ/ccNBWbiZrkLO/TBvDBTNd6zxbd+q5nM11WqBnvoqDjD6++rPCdoCx1k8hOR30qW
         m+dg==
X-Forwarded-Encrypted: i=1; AFNElJ+tEx7T3mCX5X+cXsqEsvhmfYE3SlpDxB4Mat/qmes2qOOEdeM9n4G4cQaWWov7Eb5not0g7h1ghXy3@vger.kernel.org
X-Gm-Message-State: AOJu0Ywf+K/5u5IPZCmR77WuSxYST0IEqKhp5MT/0Rmj6+Yj4y8b0Rbc
	6mhq+F8IXiF/9QR8XxiBKHZuqvAcGO6TLLa6diU3sB4Nl+HNOZnCX+x99oHovUaRfzJHhR7cCyM
	zwEz5LlMkRIpOZ9KuAZqsot/aGV1p9D6UkwzK7H+/SIBJ2ftre2c+q/JH5laVWSU0
X-Gm-Gg: AfdE7clT4F2/6uEaKvW0o+CjpMiJmIO9Ebn3UzdB/yztzYPteTWLqpN98S5arsc3SQG
	xwmos/sBA+HHM3GQlsM54oaCcDxuZI6+XzNGsJ2Z3t+ZPXX6pU/81UM0jxSXmMrIwA8BW9R9X5m
	4VF0zmyeFsVV93dUNd1dQnEH/IIsWMm9sjqO1p7UXSWEpTYr5osBcsCIIWO7DGOuntNuUAv2DT0
	eMoGWJOB7a/698WDNEyC9WpxnU4sl531QEoqiwoNBdVKZt6mAm7l2OHIr0ijGmvWM7rSE4OClEH
	MRfNHDbWFobpWdq8urwt5Pbj1e2NmedD6MMHP+OUNnXpQ2V1tuPWPiUugboJ7t/TT1PlsW39GOa
	iXGkHlcPnqFGOrU+TpqZ7aonOEx+gJZG34GE=
X-Received: by 2002:ac8:57c5:0:b0:517:6162:daf5 with SMTP id d75a77b69052e-51a72a47ba5mr12397621cf.3.1782379852400;
        Thu, 25 Jun 2026 02:30:52 -0700 (PDT)
X-Received: by 2002:ac8:57c5:0:b0:517:6162:daf5 with SMTP id d75a77b69052e-51a72a47ba5mr12397371cf.3.1782379851814;
        Thu, 25 Jun 2026 02:30:51 -0700 (PDT)
Received: from [192.168.120.170] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c120dcc55besm26167866b.44.2026.06.25.02.30.49
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 25 Jun 2026 02:30:50 -0700 (PDT)
Message-ID: <a4073f5a-1965-4a6c-ba39-c236429e2db7@oss.qualcomm.com>
Date: Thu, 25 Jun 2026 11:30:48 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] arm64: dts: qcom: qcs6490-rubikpi3: Enable cameras
To: Hongyang Zhao <hongyang.zhao@thundersoft.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, rosh@debian.org
References: <20260616-rubikpi-next-20260615-v1-1-3d96b89397ff@thundersoft.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260616-rubikpi-next-20260615-v1-1-3d96b89397ff@thundersoft.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjI1MDA4MSBTYWx0ZWRfX/M0iPIBGDMsb
 RTnsqwH1Ep7aUqt6MzlC+p/BgcDxIpiylS/KOjKLUorvISq1Ey0gN57a25k8GU1EnRwrmmapXwp
 gMt/tvrxF9A+WpluyewNjKibaHtsMaVi9gRsyougZrPeWe7BcBKTTWNYf6kxVwpUBB6Q5ur5HMi
 8Dp/ZfgDTmcw67IkZ2ROOC/Qxn78+Q7kCheLq7GUl4MtPFWqd93KX7yOBrPjYdXaH+HV1SnefJ6
 kJEma5VmGnPfIhTyu9yfdI4SrSj04Srufdducr5G7JOntTaOXxLvf6dUZvet3rK99LEBnvAe2W5
 WhKd2hZzb04K2K6hpVuG8LmZDinROrosg+OrS3cBYKUCyMg6PoJ+9wJMN/ssUFwGbq0xBf7FT62
 de1Iy1yUVDqDb9hD18iUFxyseamLr6U1D8iAjZDwaX807q2QJb9iEVBjxXTniPTBvGdXqLS0Ztx
 BDUSo6aS4BkL882Ilig==
X-Authority-Analysis: v=2.4 cv=aoyCzyZV c=1 sm=1 tr=0 ts=6a3cf54d cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=Wdb1h0LgAAAA:8 a=_exkqQx61WUZkfqn73kA:9 a=QEXdDO2ut3YA:10
 a=a_PwQJl-kcHnX1M80qC6:22 a=j5gyrzqu0rbr1vhfHjzO:22
X-Proofpoint-ORIG-GUID: R1pdSIiSoGBCMx_GX9t0ds8-xNi0Y6nt
X-Proofpoint-GUID: R1pdSIiSoGBCMx_GX9t0ds8-xNi0Y6nt
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjI1MDA4MSBTYWx0ZWRfXzk0Q54jQkqK9
 E7PXz1dLnUsdPKyVO2FwTHqMeCYbc2/7CblYsklEpLTRW7Yq2ESKsqRKGQVAd3/H0X/b1i/pC8O
 t/lt9ZM0W/ufzMbuWFIiLYtCsexrVy8=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-25_01,2026-06-24_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 suspectscore=0 spamscore=0 priorityscore=1501
 clxscore=1015 adultscore=0 malwarescore=0 phishscore=0 bulkscore=0
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2606250081

On 6/16/26 9:29 AM, Hongyang Zhao wrote:
> Enable the two Raspberry Pi camera connectors on RubikPi 3 with
> IMX219 sensors. CAM1 is connected to CCI1 and CSIPHY1, while CAM2
> is connected to CCI0 and CSIPHY4.
> 
> Add the shared 24 MHz camera oscillator, camera power enable
> regulators, CAMSS endpoints, CCI sensor nodes and privacy LED GPIOs.
> 
> Signed-off-by: Hongyang Zhao <hongyang.zhao@thundersoft.com>
> ---

[...]

> +	vreg_cam1_pwr: regulator-camera1-pwr {
> +		compatible = "regulator-fixed";
> +
> +		regulator-name = "vreg_camera1_pwr";
> +		regulator-min-microvolt = <3300000>;
> +		regulator-max-microvolt = <3300000>;
> +
> +		gpio = <&tlmm 57 GPIO_ACTIVE_HIGH>;
> +		enable-active-high;
> +
> +		pinctrl-0 = <&cam1_pwr_en>;
> +		pinctrl-names = "default";
> +
> +		vin-supply = <&vreg_vcc3v3_output>;
> +	};
> +
> +	vreg_cam2_pwr: regulator-camera2-pwr {
> +		compatible = "regulator-fixed";
> +
> +		regulator-name = "vreg_camera2_pwr";
> +		regulator-min-microvolt = <3300000>;
> +		regulator-max-microvolt = <3300000>;
> +
> +		gpio = <&tlmm 58 GPIO_ACTIVE_HIGH>;
> +		enable-active-high;
> +
> +		pinctrl-0 = <&cam2_pwr_en>;
> +		pinctrl-names = "default";
> +
> +		vin-supply = <&vreg_vcc3v3_output>;
> +	};

Are these supplies part of the baseboard?

[...]

> +	ports {
> +		#address-cells = <1>;
> +		#size-cells = <0>;
> +
> +		/* CAM1 is routed to CSI1 / CSIPHY1. */

I believe these comments are self-explanatory given the names of the labels

[...]

> +	cam1_privacy_led_state: cam1-privacy-led-state {
> +		pins = "gpio18";
> +		function = "gpio";
> +		drive-strength = <8>;
> +		output-low;

Please drop the output-foo properties from TLMM pins, the GPIO
state will be controlled by the driver

Konrad
