Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4995431F988
	for <devicetree@vger.kernel.org>; Mon,  8 Jun 2026 03:14:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780888479; cv=none; b=Kqlqm+3UJrseuL6RDiMl8B6U685ZfAqD9Svx1LtAo2DhApFznZuMJov5uGA61KFVOb2QgxGE5Oto8HOzKOx8QpiKE7Uix3i5sYvGiCursMJxYLcBTboLX2Fi+JIUYpDfyxJr6KP6MiaJF+MVLLusCFmH58SuDdVmkGvdC0SMRTo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780888479; c=relaxed/simple;
	bh=J6GR7Si5iI6uBvrP/qs8cEY8iIjk49htdTwqbM/Ie0E=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=r6gckfBhmsogYUyP3TUC1y07cBOxoSkYERO+Kmykg0TU9w6h7+Llb+nvO/eH8NU5RlWsF0wJa11a6ngTtualwHGPf8aPQlrGRj6tlGPBJMU0y4oVlUMuySeomaj8xNojcYYHAIUCl6PbA6u0HNgG4fN8c5M98knYGI1DnblXK2s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=TD1OsXAg; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=KyOmUviq; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="TD1OsXAg";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="KyOmUviq"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6580EnPA1469735
	for <devicetree@vger.kernel.org>; Mon, 8 Jun 2026 03:14:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	j+AZEdKKpOwHfkzjxlDVyOlIJN1Ra392uAlGrjFZ7pw=; b=TD1OsXAgA4dm5Qjc
	ss91jopf0knnP/yc2cYeGQhCyyYcrWP9fLJMzWqp004iTgKFfRsVvGHWo1h/VXbd
	kPqjH59WOuftdgiY7pku3tB6DJCIsnIaK11J6nNEHiQHZHJeEFhlMuMbyVAx1lJD
	ANe+9G9oZ0L6gVY4Gis2qdDxL1Fz6WlB/HowEDENv5tbtjrazOXmoqax8zApyNEx
	wFGvoi/5tIRd/B8MqAzqL3aHqyq5FDgxD1Nv2N3VMocMInpftody5/7Vd3Tx4IJa
	boNtECO0Km2eVexEViMtc/aa/qyCZI7h6kJWJQa8VMfgadvtEtE41o9T8qF1tdya
	3uslDg==
Received: from mail-ua1-f72.google.com (mail-ua1-f72.google.com [209.85.222.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4emcqgw9cf-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 08 Jun 2026 03:14:37 +0000 (GMT)
Received: by mail-ua1-f72.google.com with SMTP id a1e0cc1a2514c-963bc9a24f0so3916590241.3
        for <devicetree@vger.kernel.org>; Sun, 07 Jun 2026 20:14:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1780888476; x=1781493276; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=j+AZEdKKpOwHfkzjxlDVyOlIJN1Ra392uAlGrjFZ7pw=;
        b=KyOmUviqgvF4KJqVvIi9fF8ybi31HtOwrNNLhYhFG1KEDGrZAN0pUuid0sOaladwFq
         ZHY6/kIIBVHuXLNK+Na/38V9pz85kHgAIm+RJMw2dR2ORjGLVfbRtNmC/ddz5ZZWi8HZ
         +ZjYTa6iyKpx4vSGwHSigNGrr9ocNQhFXuQN8AcIvQfuRpD4K7GGOP+W7GN88A+Qa0nL
         0D82eLMV3d8PS7vD4/IDvL8bNyACKSeLiem0u5NiJBPg3y9qUsJbGo5ztFy8/cRxzG7s
         Mf6InW7dZOl+xqoqFI21xZthVMPhMKuS9eWQYjq82Gb5nM3hWZEM+rR6YomeRhiZJumG
         4T9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780888476; x=1781493276;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=j+AZEdKKpOwHfkzjxlDVyOlIJN1Ra392uAlGrjFZ7pw=;
        b=K5ljfvbWbYjTebZavPunEkLDUZXSbs3jpwpD6ZemR1dZYNs2H/2U8YpXkEbu7Nt8DS
         ldb3LEPVQnP7rtj3/bSaLZZyQYx7PMCthPuAxfh1/eJKTyCpxXwXPpEVExSgW2uVUAIV
         fGesoq1u5XsLIawmjI2sKIlp8/ZvWFF/R//4AShOFCZ+O+jdaDB037fxq35i+ro9pHpJ
         StzjqVl2ssZ8XLcGX9XM2yKu6FxDkZXmyp/AQSyJ04pLG4Jm95Nbsnv5bYFAC5erkY6x
         ludfTwvLp0U982mTxy+5Y82FNZ/iXtS9U1YlLOJjpsdPECLY50AiSjRYEWCkcdy+YP5D
         NUqw==
X-Forwarded-Encrypted: i=1; AFNElJ/dLYvbmc1t3O+O7tJhHzc68qAKUOVUXXu8dZSleYq56NlnKZ1BUJYqFxewLtsgUhIJe0oaluV47Mx8@vger.kernel.org
X-Gm-Message-State: AOJu0Yyb6OSXPZgzALdMWDZTFPg2X4mwHpsU++vMBx30kKqg76Vi3vge
	FZfLWHsPQ6r1mJdc8HfEaaEtSZ8ZVgJwNWUKVr1c2t1n9VzhBEoJxQUdVJQCyihd3HwbrF0y6kn
	IhHOTnsy6sMMXP/uamWbEqdVZ2GwksirLKAfgAmtbDJvTLTWYvu9X81oG0mIT52Dk
X-Gm-Gg: Acq92OG/hBCQ84oiTTemUoBM9Q+SlE5iEpVAITWnZtnVLPzdv8Ixeo+x1liftwtuqxT
	txvdkN02jLYrbuxYNGOOuCefRA7d7yLEgSZCRx5r3/bYctGCbXXOePbSh+gmSpBoUK++870jTOd
	GQkjh/tXu90CktIsTTBgoVyaAzgUUW9SbqI1EFHeBArCkbuMM5dXv/gSa2vfNN88JxXHg43XvAM
	kQb9TXmqIXcU+vuP/cSmToxYSWE96vyq6VJPZJXuodDtfmQX12qf4FR8IXgpXrPIDkj9cF7VGPD
	/pCSSviyappJxI9p0Cq+wtmqMYwZHMLpbyeQf9j+uQ92DMI+BA09kxIxRRW6LrqPx2MPmWgaix+
	pNlo2jFpt1xge0aJ382uTePBX19gGgwHPbbq+S5Cgal81O7QLeaZlx0538HaetKdAaDBfmdACOF
	f3shCG2OrXr53eE9ylZU/rfSkN7jZIbRlX4xaSzRWAjmFemQ==
X-Received: by 2002:a05:6102:5694:b0:62a:1bba:64ee with SMTP id ada2fe7eead31-6feed1adc0amr6648312137.6.1780888476602;
        Sun, 07 Jun 2026 20:14:36 -0700 (PDT)
X-Received: by 2002:a05:6102:5694:b0:62a:1bba:64ee with SMTP id ada2fe7eead31-6feed1adc0amr6648300137.6.1780888476219;
        Sun, 07 Jun 2026 20:14:36 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5aa7b90421dsm3426125e87.30.2026.06.07.20.14.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 07 Jun 2026 20:14:34 -0700 (PDT)
Date: Mon, 8 Jun 2026 06:14:33 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Herman van Hazendonk <github.com@herrie.org>
Cc: Amit Kucheria <amitk@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
        Daniel Lezcano <daniel.lezcano@kernel.org>, devicetree@vger.kernel.org,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-pm@vger.kernel.org, Lukasz Luba <lukasz.luba@arm.com>,
        "Rafael J. Wysocki" <rafael@kernel.org>, Rob Herring <robh@kernel.org>,
        Thara Gopinath <thara.gopinath@gmail.com>,
        Zhang Rui <rui.zhang@intel.com>
Subject: Re: [PATCH 1/2] dt-bindings: thermal: qcom: add pm8901-temp-alarm
Message-ID: <t25hkdgberbqu6bolvvyhu4jqxbjfyjcwdc2af76z5dorhexvm@azczmhlkjgz4>
References: <cover.1780148149.git.github.com@herrie.org>
 <386f3cef9d50d61f588f99706d9f979c56f8bab8.1780148149.git.github.com@herrie.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <386f3cef9d50d61f588f99706d9f979c56f8bab8.1780148149.git.github.com@herrie.org>
X-Authority-Analysis: v=2.4 cv=dJGWXuZb c=1 sm=1 tr=0 ts=6a26339d cx=c_pps
 a=ULNsgckmlI/WJG3HAyAuOQ==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22 a=gEfo2CItAAAA:8
 a=cTwmTnRGAAAA:8 a=O01ZJP_XdAIdQBp6JKkA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=1WsBpfsz9X-RYQiigVTh:22 a=sptkURWiP4Gy88Gu7hUp:22 a=GUWCSGlMWfG-xDt5EnV5:22
X-Proofpoint-GUID: HTpkXJx3k9tjdoInIum_fheAGQ6hZplm
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjA4MDAyNiBTYWx0ZWRfXzWf+yZPthBG2
 EO2oFNtsAVGpDycuJ4s5c5O9FfI9vh/ACAr9wZcld5lR5wK1GFjmXfs7oRZoJ22gU2BlgAidIGt
 TBmBcdYubr5CSzrml+gcOcOty/HtO1tUCG/Or39U7upGrxIlD9Do26b78LuDwZutzN3qm2cxhpl
 fJ63fQl+8hHeJuRPEzpGu1MWpIzn2LS4YhaebbtR5G2IXNYLXKfZV9wHwJsBnoTeo9qSfxki+JE
 BzGd7YbXi9XSEu2WfxKAz59x//UThAl9pltxpmnZBCHpS75Bhe++nlbbXDWwUmVGOuCgCR5tG6w
 ORBCWW4sYQEy+eg7V8TJxlNjgdW1nyeHOdRNYF6yF2In7RxLnlJcw8MiYXIJu2d/xtClC/tR2oF
 Hb8jpFMP1ZRoRsfnjYprx4SEDbcV41Vr6rYHzeZ1w2a72AJI1nS03J5lGycvQccqJFJsaEQEL0l
 E0tRNbcimX4s2JFlK5Q==
X-Proofpoint-ORIG-GUID: HTpkXJx3k9tjdoInIum_fheAGQ6hZplm
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-08_01,2026-06-05_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 malwarescore=0 bulkscore=0 adultscore=0 phishscore=0
 clxscore=1015 lowpriorityscore=0 impostorscore=0 suspectscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605210000 definitions=main-2606080026

On Sat, May 30, 2026 at 04:00:39PM +0200, Herman van Hazendonk wrote:
> Add the binding for the temperature-alarm block inside the Qualcomm
> PM8901 PMIC (companion to the PM8058 on MSM8x60). The driver exposes
> the PM8901 die-temperature trip stages (105 / 125 / 145 C) to the
> thermal framework via a thermal-zone, with stage 3 wired as a
> critical trip so the kernel issues orderly_poweroff() when the part
> overheats.
> 
> The binding describes the SSBI sub-node address, the GIC interrupt
> the alarm raises on a stage transition, and the parent PMIC
> reference.
> 
> Signed-off-by: Herman van Hazendonk <github.com@herrie.org>
> ---
>  .../thermal/qcom,pm8901-temp-alarm.yaml       | 79 +++++++++++++++++++
>  1 file changed, 79 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/thermal/qcom,pm8901-temp-alarm.yaml
> 
> diff --git a/Documentation/devicetree/bindings/thermal/qcom,pm8901-temp-alarm.yaml b/Documentation/devicetree/bindings/thermal/qcom,pm8901-temp-alarm.yaml
> new file mode 100644
> index 000000000000..569943b4aedc
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/thermal/qcom,pm8901-temp-alarm.yaml
> @@ -0,0 +1,79 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/thermal/qcom,pm8901-temp-alarm.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Qualcomm PM8901 PMIC Temperature Alarm
> +
> +maintainers:
> +  - Herman van Hazendonk <github.com@herrie.org>
> +
> +description: |
> +  PM8901 is a secondary PMIC paired with PM8058 on MSM8x60 family
> +  (MSM8260/MSM8660/APQ8060) platforms. It exposes an over-temperature
> +  alarm block at SSBI offset
> +  0x23 (CTRL) / 0x24 (PWM) with four selectable thresholds and three
> +  escalating stages. Unlike PM8058, there is no raw die-temperature
> +  ADC channel — the driver decodes the stage + threshold pair into a
> +  representative millicelsius value.

Don't describe the driver in the bindings.

> +
> +  Two PMIC-internal interrupts are exposed: a stage-transition alarm
> +  (TEMP_ALARM, PM8901 IRQ block 6 bit 4 == 52) and a hi-temp alarm
> +  (TEMP_HI_ALARM, block 6 bit 5 == 53).

I think, register definitions are too verbose for the bindings.

> +
> +  The driver registers a thermal-of sensor; board DTs declare trip
> +  points and a critical-trip action against it.

The same.

> +
> +properties:
> +  compatible:
> +    const: qcom,pm8901-temp-alarm
> +
> +  reg:
> +    description: SSBI offset of the temp-alarm CTRL register.
> +    maxItems: 1
> +
> +  interrupts:
> +    items:
> +      - description: Stage-transition alarm interrupt (TEMP_ALARM).
> +      - description: Hi-temperature alarm interrupt (TEMP_HI_ALARM).
> +
> +  interrupt-names:
> +    items:
> +      - const: alarm
> +      - const: hi-alarm
> +
> +  "#thermal-sensor-cells":
> +    const: 0
> +
> +required:
> +  - compatible
> +  - reg
> +  - interrupts
> +  - interrupt-names
> +  - "#thermal-sensor-cells"
> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    #include <dt-bindings/interrupt-controller/irq.h>
> +
> +    ssbi {
> +      pmic {
> +        compatible = "qcom,pm8901";
> +        #interrupt-cells = <2>;
> +        interrupt-controller;
> +        #address-cells = <1>;
> +        #size-cells = <0>;
> +
> +        pm8901_temp: temp-alarm@23 {
> +          compatible = "qcom,pm8901-temp-alarm";
> +          reg = <0x23>;
> +          interrupts = <52 IRQ_TYPE_EDGE_RISING>,
> +                       <53 IRQ_TYPE_EDGE_RISING>;
> +          interrupt-names = "alarm", "hi-alarm";
> +          #thermal-sensor-cells = <0>;
> +        };
> +      };
> +    };
> -- 
> 2.43.0
> 

-- 
With best wishes
Dmitry
