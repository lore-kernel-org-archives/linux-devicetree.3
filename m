Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3D0A64499BB
	for <devicetree@vger.kernel.org>; Thu,  3 Sep 2026 08:38:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788424692; cv=none; b=qMpdGmdq03PQv1UhlidyWb3369NFDFFXbH15KnczGIePVWbO/VuEZQdc7Y5GgTF/d1uX13TmwMXahRphbuiBVThesuAveHgBt14HVXfitaBRImJepNluD6ywTUnXlHGE1Pgp4xSyGrlE+Lku5rG4AykwM4wtHmMEnTyx3wOQ3Yo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788424692; c=relaxed/simple;
	bh=kd86lPABYUrJ2jIXZLk3eCNkAgPOzCHoZEsmhQR1t/s=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=B7nt81YbLcCgTzsa14sDwGraLGcVTEd4qppuNpMzAbviQSPnM9uKePnYjhdHWBo6M+15Bn13hBgjtmYZ2RiToJPtVD+dQPHlqDeyXW4U2U55/RMgsFE3Z/bmFssIlTWKEHSvVGN0Auh+AAymDhTuFHC0o/S0LIVyMP6aO6bqA38=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=OQftr52o; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=cvOF44sG; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="OQftr52o";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="cvOF44sG"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6835ldHB722051
	for <devicetree@vger.kernel.org>; Thu, 3 Sep 2026 08:38:10 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	g6u7H5xBFCRTUQgMYXpbZseEbBuryIsCQSRuaipZfXc=; b=OQftr52o2pwDje5h
	WUSgzCIRpnF7ZczcOeXvdhGrbNJ506hVOibxNxRj2sn2FhgsbVevHPArRSH6vLeW
	QF7G2ntOASJuc78K4Dc88+nBzVpzXsQjO7XKBHCmBTyNDoBo5YXywwkIoDyVoECU
	ahJ7ammqJDYfxh3ZdUcYOp0QZ9uL6oJkU+zH+4IxFcmU6wqyfgsWkE/cjsb69Ax8
	kjaD/zk9S5BAFsB1lC/5W+I+NGHFHGRZEFDgV0ttIC+KYnxhtRWIWNMUluCoastm
	5dln6Zy2CT8z3FigaOHsuVnqPr/EKDFKzvSFFRj7sDkT1pJqDyamH0iSZD/vHPDf
	C+ReOw==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4genrnm47u-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Thu, 03 Sep 2026 08:38:10 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-9310484c005so42226485a.3
        for <devicetree@vger.kernel.org>; Thu, 03 Sep 2026 01:38:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788424689; x=1789029489; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=g6u7H5xBFCRTUQgMYXpbZseEbBuryIsCQSRuaipZfXc=;
        b=cvOF44sGTFkxLpHpcgFkRUTh8epWEi2DL72D0I/6yyebYFyVBmubXXg3xl51/KmlUb
         sOUokjUXhd8tErtFwTO+Vjj5lGR0XZBYqFqwQKPjPMPi//Efu2xKPTXfFoyD9IAcT+Eo
         ExJ8JWmLv9/8QTxgK7/WLzTjJU0iJF08Xrl7+T4GbZnng/0tQPt9w3xp13OxHEEnk6u2
         hJGyJXWj5+xeDcWBsLMAKK5ymGrzr9HpPuRcJXTDMDMHTtdpd70Nqa8PHSUAkVjSsnNy
         RMVe/hLo+ge4p0tyG6bXFOt+tGx1MW6HI4stczsB3qXQ1Y+PBRvQqrWc+AlIDKaTEviW
         wpCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788424689; x=1789029489;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=g6u7H5xBFCRTUQgMYXpbZseEbBuryIsCQSRuaipZfXc=;
        b=sEMVg1gIUdK4IifOX1EYKJIi7eFb4oo3ArbPc4aPgYVH7gqPFKRumoEoQvJFClzREp
         ZOAsZNjYfcOPLDPGBvXqIyc81hL6os+FyZwYvoF8eiPaQb/Q72yFtsz37SXIyiaaSjk1
         KwHe2s3Olf4UGwso+as0ZITaLOxLWbl5iH/ZA10AWrfe+Ue2FpWLC0E6fKPE14isAYP1
         1pzref59FxTeHaXp0KKolJJa0dfp8U0auIOgYvZRVSnpEN7ElqArX5Mmp32ToxSAuwDF
         Z6GdUsKtff5q9HPL20J/o4XCZnyUnW/HAeWMLmzEsSFNimSxjzUSYhIi1NWQognc6LbD
         l6Tw==
X-Forwarded-Encrypted: i=1; AKwUvBy5NiHDd/l8NgQfjTb+16XmO4/eWTlePEzTCgUA0sXypZyeErPE4zKosZNUA3dFCfmNQnlM/SHOk3pY@vger.kernel.org
X-Gm-Message-State: AFuF++nQ1WI/uq9qe/DyUjqEHYYZ6en4mVyhiwP6odmqUNCevxiQUMA3
	52y4Zkcq5r5utbUgcnP6y/DcLRRKz4Q71Ab20rylX909B3OaofjTqyFzDSzamjflVnfC2ockB/q
	BdKMpbFQZOkswqoAffX0SkcGuc9IiehYjUPGRuk7wswOYC4P6atPADQN7XFwWGdhq
X-Gm-Gg: AYBFou30w2MVLCjx/Kz4pZla4CkV8y3UkoKukYbt2B69xXOoFl38hXWvTHnLQtKvriv
	7Urh6uucxWu1N0LFSdPMEUF4I87px/7XCrjYc4qnfunHj5+5XOlmk5JqI+Afw4CQM+7PNwQp8Mg
	qDypPlyre+wJQF16SZHTzlleSHXs1DoHinR26wq7Ug0Kr+0nqzyQ93t+Qf5h17gFS0u/KTdgvuw
	sjZOV+DeTannMzT7qX6SUWiBZD3n3sxnLb553RibP5Bq8JrVYX8amsz1i+CASjbXxWXRwEknqnG
	9y5cXcQpFwxsa7FOncc2C+5oUtyxZbBxddqpjkrSe9W2co3tyMMPfuByTjdFztg+OoKHqNcPmG0
	wPAEbNX6Sx7UPVf5BfNLBzg==
X-Received: by 2002:a05:620a:640f:b0:939:17ec:8a81 with SMTP id af79cd13be357-93960f8a9afmr776741085a.3.1788424689397;
        Thu, 03 Sep 2026 01:38:09 -0700 (PDT)
X-Received: by 2002:a05:620a:640f:b0:939:17ec:8a81 with SMTP id af79cd13be357-93960f8a9afmr776708685a.3.1788424684116;
        Thu, 03 Sep 2026 01:38:04 -0700 (PDT)
Received: from [192.168.202.12] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c25f41735ecsm64908166b.19.2026.09.03.01.38.01
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 03 Sep 2026 01:38:03 -0700 (PDT)
Message-ID: <4cd975ee-6d63-46dd-93ef-7c6ac1931837@oss.qualcomm.com>
Date: Thu, 3 Sep 2026 10:38:00 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 5/7] arm64: dts: qcom: pmk8850: Add ADC5 Gen4 peripheral
To: Jishnu Prakash <jishnu.prakash@oss.qualcomm.com>,
        Jonathan Cameron <jic23@kernel.org>,
        David Lechner <dlechner@baylibre.com>,
        =?UTF-8?Q?Nuno_S=C3=A1?= <nuno.sa@analog.com>,
        Andy Shevchenko <andy@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, Amit Kucheria <amitk@kernel.org>,
        Thara Gopinath <thara.gopinath@gmail.com>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Daniel Lezcano <daniel.lezcano@kernel.org>,
        Zhang Rui <rui.zhang@intel.com>, Lukasz Luba <lukasz.luba@arm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-iio@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-pm@vger.kernel.org, Kamal Wadhwa <kamal.wadhwa@oss.qualcomm.com>,
        Anjelique Melendez <anjelique.melendez@oss.qualcomm.com>,
        Manaf Meethalavalappu Pallikunhi <manaf.pallikunhi@oss.qualcomm.com>,
        Priyansh Jain <priyansh.jain@oss.qualcomm.com>
References: <20260731-pmic5_gen4_adc-v1-0-9c49b2eea6f9@oss.qualcomm.com>
 <20260731-pmic5_gen4_adc-v1-5-9c49b2eea6f9@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260731-pmic5_gen4_adc-v1-5-9c49b2eea6f9@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: j5TU1BWgY46zEjZX5FU9LuEmG3goLjuy
X-Proofpoint-ORIG-GUID: j5TU1BWgY46zEjZX5FU9LuEmG3goLjuy
X-Authority-Analysis: v=2.4 cv=YKuvDxGx c=1 sm=1 tr=0 ts=6a9931f2 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=EUspDBNiAAAA:8 a=eQlnLCDwCofjbIFrPS4A:9 a=QEXdDO2ut3YA:10
 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTAzMDA3NCBTYWx0ZWRfX1WESHv0+nHc2
 QE3nxu3BP203SSNjdBFZq9e0x7kQ7JpFv49mPKT/RYD7/nFAaHqV2L8oOG68gZQZcvuYRoGnQiO
 pEQcVoHOjjpHyUsyRA44IsaSEDfCNkvIHo1muf9JAl/p58Aid8lg5hhOryeZdqwB8QVIDLt4lIA
 uA8Qc8VdluTbuiM7/MEFRQw3u3htL56rEX3/Qu1x3wbHm4qU+nJnVIj+vudj2FpRRdfsbHh7Dzr
 TDV+qIXAMfhLtFlfoV1dZnpvVKCw+tod1iCv9FwwaQH1/xkFrFPChMiUiRdEVEPgkvTl6BBiryX
 akHluQn3I93iRqfjIgtOgCq8duFNq0HVmKmn50vEfTJBbxQnDpOxHCtiUg6/v6tWevx4+f/erAl
 fg9W1/uqHUS5M9rcZ7OtDYIR6grfAy1ae560XqE5h4vzyYEGvoDmFJb/GW5RNtB/cXDqnSKZcw+
 REBly7VwM3BmJfjl1uA==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTAzMDA3NCBTYWx0ZWRfX+PN+7rCkj0vU
 3+fT+3Ud3gaKNLTaeJFD+LOEeKA1ms7vzbA5SxsR4i+QKWsOuxyoiDzbivAs0YXdz/l6Hhp0QGV
 U6SqQhOqR7DPLgom3nc8qW5SSUG7Dws=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-03_02,2026-09-02_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 spamscore=0 adultscore=0 impostorscore=0 malwarescore=0
 phishscore=0 clxscore=1015 priorityscore=1501 lowpriorityscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2609030074

On 7/31/26 8:06 PM, Jishnu Prakash wrote:
> PMK8850 has an ADC5 Gen4 peripheral that acts as the master ADC for
> the platform, communicating with ADC peripherals on other PMICs on the
> system. Add the ADC peripheral node with PMK8850 die_temp and
> xo_therm channel nodes under it initially.
> 
> Signed-off-by: Jishnu Prakash <jishnu.prakash@oss.qualcomm.com>
> ---
>  arch/arm64/boot/dts/qcom/pmk8850.dtsi | 25 +++++++++++++++++++++++++
>  1 file changed, 25 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/pmk8850.dtsi b/arch/arm64/boot/dts/qcom/pmk8850.dtsi
> index c7ba72fd48bc..44d1d1957f8a 100644
> --- a/arch/arm64/boot/dts/qcom/pmk8850.dtsi
> +++ b/arch/arm64/boot/dts/qcom/pmk8850.dtsi
> @@ -7,6 +7,7 @@
>  #include <dt-bindings/input/linux-event-codes.h>
>  #include <dt-bindings/interrupt-controller/irq.h>
>  #include <dt-bindings/spmi/spmi.h>
> +#include "qcom-adc5-gen4.h"
>  
>  &spmi_bus0 {
>  	pmic@0 {
> @@ -45,6 +46,30 @@ pmk8850_gpios: gpio@b800 {
>  			#interrupt-cells = <2>;
>  		};
>  
> +		pmk8850_vadc: adc@9000 {
> +			compatible = "qcom,spmi-adc5-gen4";
> +			reg = <0x9000>, <0x9100>;

nit: one a line would be perfect

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

P.S. can we also add some more channels that look like they would
be present on all 8850 installations, e.g. offset-ref, vref-1.25
etc.?

Konrad
