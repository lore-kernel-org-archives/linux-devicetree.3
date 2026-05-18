Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3C0D13932F0
	for <devicetree@vger.kernel.org>; Mon, 18 May 2026 22:03:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779141833; cv=none; b=O6aM55Mp7I18t87rzd9vcVOvz3O+uFSNqLXpE4gK21OHwrTInheVjNkDpAvHXwMWD45z8e3aKGM6r9me5QEQDjgxVKWDRVOE7F+NTzI78I9Kcc3Lt6kVQNzUjE6mWdB0zDsSlBeZtfYonzv7jFNCO9jQ1yNRujBAwO2kUsyMETQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779141833; c=relaxed/simple;
	bh=pRUyYmmgY+SMR9KdaJVku27H+nF27hTsbqOt+3i5IxA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=VpZDn9xUt5Fp8319OMvQRgAaQu8TKegILzsov6rI9AEl+jr+YwsGN++u6yQ+XJciAmJTE1CqD/f5cxHmL+qq6EsrZ9waPCFfPjOHuYvQTVlBdO3RKY7fE1so6tQlVd02TKFtJ9RAb1suY9u9RbwJBH50ADS+4ggMIVroU8gLMXA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=cLIN78ED; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=fmQ8YwEg; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="cLIN78ED";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="fmQ8YwEg"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64IKbauT2188804
	for <devicetree@vger.kernel.org>; Mon, 18 May 2026 22:03:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	WE/ZmXbZ2mfp389Bj3cAnUFxz1Swq6CCIkSQGONfjZE=; b=cLIN78EDFFiNAjev
	u2f9Q3NT1U18ZtdPQHtVAvR0CUQaEqqJ7I8GG/ok/NDd/z2XYst5Hq95Azi8j4iw
	I6H/Si8LHc9J6BQWd6YIh4aJfCmsUiZW170SEAtI/G1OIqbWPkuM4pGDOXGq8UXa
	puavL74s/a5jSyQwetFqDDrpqUMyJCGYdBjjTUV0Ekds5L0k9npwiWVm9qamOHBD
	d08Vl81jP+Hiw3/aQmM6mMk51V84IjSLaBGrsbUzoDa+cBHXwiMTjfRLL/3NY5zF
	5Qoug7NPigTcG7PDiZih6e01PEP2yEaRYhsZrBmGDJNG1amDGt9RWy0dsDHFDaug
	R9Fhhw==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e7xkuk97m-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 18 May 2026 22:03:51 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-514d2b22e7fso3668881cf.0
        for <devicetree@vger.kernel.org>; Mon, 18 May 2026 15:03:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779141830; x=1779746630; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=WE/ZmXbZ2mfp389Bj3cAnUFxz1Swq6CCIkSQGONfjZE=;
        b=fmQ8YwEgdU1f/METYCbXH/4/zSUMYsPbH6TbnRBwuBGkL8egbsFt5LC4xTDQ3JZrF3
         sCD30wKGuarPqi2X4wOLvT9itsljyOoClNFv/ZPqtRF7ch4KCnQPHtOI86etd7DMTEV4
         3FwjAkvV6cu/O0ZxbAxUdHtFho8NmROMD2g08456uWr1V51pLQetyur2ZCyqhunEIbaj
         ed8ORVsPkR4hG0ALezpJPMuskdMm33XeD9ZHGe8h6E13XJfkRTsBT9cA50fV1nUaoXP7
         V2R9eEu4oT1i5mMH6lDksFSU00ypCO3fwAn8ulYDeXsvVrbh/8RHwKpvwGXiRsuJgdbt
         ePIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779141830; x=1779746630;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=WE/ZmXbZ2mfp389Bj3cAnUFxz1Swq6CCIkSQGONfjZE=;
        b=NhwsCpJbYNWgBhIJvSwNT5/I4Oerf8hV+BosTLEraKgV9q+2sDY8TpjkhjSMLk4TTX
         j4afoUZn3m2R+LdPAm0VLgtXue4gOB3ZGkMQPhSaxAoGUNucfl4uUMhM0xnAEsltMG//
         fbAlSxK8DdIgcOCAKS8fMAr1S1F9sGidahg4Rtqh8yLqPXGsVELKAzFPRYpf/BWcB4YE
         DBFedE5gnnRmYJ/Snf9fkPxiWiz0Bq8Swheqtyn3i6M96SlRCuQzTpYY43M6yj3hu8wF
         2p/eVf3E7qMlq44Y/QPzlA12h5UkMqbvOhkcfFE4pJU3tlbqenhs6dyO0dxqKPWtf80l
         tV2Q==
X-Forwarded-Encrypted: i=1; AFNElJ8VeOPfac5b2Q75iRgfakJZeyQZ671usTzUKxD3yJW/ZDxT4KLp9KPfvnje9Q99ClZeO1U+rxpWup3X@vger.kernel.org
X-Gm-Message-State: AOJu0YwpRr2GbI2Ff/rEHPX42LAKXqKNr9q7LTAbrC8p9oC8NHr+s9W4
	rUrL2D4v5+hLso9gcKG/e64lHkQLESCLkz672YdQ0Ug+jvrEMoFU8KnabbQknpETgtIKG45Qxje
	LJ9Gd7+YNYMphnNmRzv4KYT8ZTqzZ8Pcyj8EyAb61ZzKYEZOYhmJy5zVsUNjEfw2d
X-Gm-Gg: Acq92OFDdHbYj8/KnMiVlkW1xTZJTtSJwSiZop+MfxoNh0FPuhttLVTfRDdrS5Thxux
	drf7OP7mDByIBvQwnOBg5VEDWDZ0tZkJ0meMnDPZRQjYUb4wHIWCIK71AZ3WcMlPwvDu+RO8hgt
	RBC9ZGiLoQU6GVLe+If2ArHwqZlQZY10gmsZTiCUBSju+EOI+kVLLxFaWXg29wDkhasnBkrQQjM
	42lCS8a8OQdqPlnBiJFgUmBnw27uVU8TYcyTPbggT+fcQe2HYfmjmrO/5bApxRVXOuApQOLX6Wf
	MeV9uTr6gnGg6NEY3hMt7IAjG3UmRFt+1oBXbedbTS7f9vB9uZJHHcJFBnZpr3tjCuy2GOf1JNM
	I230xuwI/99bC4ONfiFnA7R9MC3EM+TosGtX+8ybXR8s7V4PJQQZKanKpdRj0WssfMD55X6YOEC
	Ka9gksLLXM0K8sSTPTZk+59qt2e1d7tlIQjPM=
X-Received: by 2002:a05:622a:1444:b0:50d:8e6b:96ac with SMTP id d75a77b69052e-5165a31a533mr227093081cf.58.1779141830367;
        Mon, 18 May 2026 15:03:50 -0700 (PDT)
X-Received: by 2002:a05:622a:1444:b0:50d:8e6b:96ac with SMTP id d75a77b69052e-5165a31a533mr227092541cf.58.1779141829745;
        Mon, 18 May 2026 15:03:49 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a90f11a619sm3598182e87.27.2026.05.18.15.03.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 18 May 2026 15:03:48 -0700 (PDT)
Date: Tue, 19 May 2026 01:03:45 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: taygoth <taygoth@gmail.com>
Cc: linux-arm-msm@vger.kernel.org, linux-usb@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Mark Brown <broonie@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>,
        Wesley Cheng <quic_wcheng@quicinc.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Heikki Krogerus <heikki.krogerus@linux.intel.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Casey Connolly <casey.connolly@linaro.org>
Subject: Re: [PATCH 2/6] dt-bindings: usb: add Qualcomm PMI8998 Type-C
 controller
Message-ID: <3cdjn22kjsjlhfd7mt34uldmkxdquxexydefkfd5hpm2cfdusi@dqhhsl2ux4sv>
References: <cover.1779127507.git.taygoth@gmail.com>
 <5f4271701066943ead54f82003ab282c4b39f3da.1779127507.git.taygoth@gmail.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <5f4271701066943ead54f82003ab282c4b39f3da.1779127507.git.taygoth@gmail.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTE4MDIxOSBTYWx0ZWRfX8QCqIZm052PJ
 Q8ivzqdgA+/AFJj46yHishSD3SuimCuSa9DozBbuLyQYbbXx+3WChwBK9/wWCWFY+XOb10awsXI
 O3CmYwH2G7hhd3MDQjppullAC0u7TJLlmRhVpl+Y7566srPp95kj4YSwSNJUfnzoVkDwkcwVHwo
 ythpQKgiTVAU5UANnY8On2kqrO8g/k8yGO3aKyEvZwyQM4Te7xmkWK36ct+HxjiDhMjRV8aNq3W
 cZ7Tcyn6ek7QUdCcEWdIxUvPLNvf7+z8meaO8qJYHUCtrqWgzKLiT/QzsOTIrt4er1ZZeEN9n2U
 rE3XIfAaqAuYzyE7A0LxIFfjajsaSTsGxH+xd5ycEm7HHJq7yvz7+KpzcokQiVgzeNd2zU26635
 aXaKpIy0M7qUO0tVfefrXwmYaG/BrM+vgLCIyIDDcZoehxI8IRZBvb6/8HKLfERGNG7kPgpEPdK
 6IR1dQYKLTlFl+zpPgg==
X-Proofpoint-GUID: aKvR9CTcDW9Pw3a8Y7MVzFgQuehzz04b
X-Proofpoint-ORIG-GUID: aKvR9CTcDW9Pw3a8Y7MVzFgQuehzz04b
X-Authority-Analysis: v=2.4 cv=FsY1OWrq c=1 sm=1 tr=0 ts=6a0b8cc7 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22 a=gEfo2CItAAAA:8
 a=pGLkceISAAAA:8 a=fpthWuqRuR8fFdR_s3QA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=uxP6HrT_eTzRwkO_Te1X:22 a=sptkURWiP4Gy88Gu7hUp:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-18_04,2026-05-18_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 adultscore=0 clxscore=1015 phishscore=0 priorityscore=1501
 malwarescore=0 impostorscore=0 spamscore=0 lowpriorityscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605130000 definitions=main-2605180219

On Tue, May 19, 2026 at 01:22:47AM +0500, taygoth wrote:
> The PMI8998 PMIC integrates a USB Type-C detection block in its SMB2
> charger USBIN region at offset 0x1300. The block performs CC sensing,
> debounce and Rp/Rd resolution in hardware and reports role changes
> through a single consolidated "type-c-change" interrupt.
> 
> This is architecturally distinct from the qcom,pmic-typec binding
> (PM8150B / PMI632 family) which exposes a granular 8-16 IRQ topology
> fanned out per Type-C event for a software TCPM state machine. PMI8998
> has neither the per-event IRQs nor a register layout compatible with
> the TCPM code path, so this binding describes a separate hardware-
> managed role-switch controller.
> 
> Signed-off-by: taygoth <taygoth@gmail.com>
> ---
>  .../bindings/usb/qcom,pmi8998-typec.yaml      | 97 +++++++++++++++++++
>  1 file changed, 97 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/usb/qcom,pmi8998-typec.yaml
> 
> diff --git a/Documentation/devicetree/bindings/usb/qcom,pmi8998-typec.yaml b/Documentation/devicetree/bindings/usb/qcom,pmi8998-typec.yaml
> new file mode 100644
> index 000000000000..f2814f5ce3de
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/usb/qcom,pmi8998-typec.yaml
> @@ -0,0 +1,97 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/usb/qcom,pmi8998-typec.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Qualcomm PMI8998 USB Type-C role-switch controller
> +
> +maintainers:
> +  - Maxim Furman <taygoth@gmail.com>
> +
> +description:
> +  The PMI8998 PMIC integrates a USB Type-C detection block inside its SMB2
> +  charger USBIN region at offset 0x1300. CC sensing, debounce and Rp/Rd
> +  resolution are performed in hardware, and the negotiated role is reported
> +  through a single consolidated "type-c-change" interrupt.
> +
> +  This block is distinct from the TCPM-based qcom,pmic-typec controllers
> +  (PM8150B, PMI632, etc.) — PMI8998 lacks the granular per-event interrupt
> +  topology those parts expose and the driver therefore translates the
> +  hardware-decided role directly into a usb_role_switch_set_role() call
> +  rather than running a software TCPM state machine. Power Delivery is not
> +  supported by this binding.
> +
> +properties:
> +  compatible:
> +    const: qcom,pmi8998-typec
> +
> +  reg:
> +    maxItems: 1
> +    description: Type-C SPMI register base offset (typically 0x1300).
> +
> +  interrupts:
> +    maxItems: 1
> +
> +  interrupt-names:
> +    items:
> +      - const: type-c-change
> +
> +  vdd-vbus-supply:
> +    description:
> +      VBUS source regulator enabled when the controller transitions to
> +      USB host mode so bus-powered downstream peripherals can be powered.

We probably need to fix this for PM8150B too... This should be
connector's vbus-supply instead. I'll send a patch for the existing
devices.

> +
> +  connector:
> +    type: object
> +    $ref: /schemas/connector/usb-connector.yaml#
> +    unevaluatedProperties: false
> +
> +required:
> +  - compatible
> +  - reg
> +  - interrupts
> +  - interrupt-names
> +  - connector
> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    #include <dt-bindings/interrupt-controller/irq.h>
> +
> +    pmic {
> +        #address-cells = <1>;
> +        #size-cells = <0>;
> +
> +        typec@1300 {
> +            compatible = "qcom,pmi8998-typec";
> +            reg = <0x1300>;
> +
> +            interrupts = <0x2 0x13 0x7 IRQ_TYPE_EDGE_BOTH>;
> +            interrupt-names = "type-c-change";
> +
> +            vdd-vbus-supply = <&pmi8998_vbus>;
> +
> +            connector {
> +                compatible = "usb-c-connector";
> +                label = "USB-C";
> +                power-role = "dual";
> +                data-role = "dual";
> +                try-power-role = "sink";
> +
> +                ports {
> +                    #address-cells = <1>;
> +                    #size-cells = <0>;
> +
> +                    port@0 {
> +                        reg = <0>;
> +                        pmi8998_hs_in: endpoint {
> +                            remote-endpoint = <&usb_1_dwc3_hs>;
> +                        };
> +                    };
> +                };
> +            };
> +        };
> +    };
> +...
> -- 
> 2.47.3
> 

-- 
With best wishes
Dmitry
