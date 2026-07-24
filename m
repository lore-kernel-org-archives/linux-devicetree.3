Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ED6E33A8740
	for <devicetree@vger.kernel.org>; Fri, 24 Jul 2026 08:10:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784880614; cv=none; b=XCWBONYoai9xWiHKXVtixsrL/X+IrVZZmASrLZziyC5Y6N+OaWedN2Kocx6iH2agTbTGpE//4mSxYcpxBmrl/SuRnb5q84IhBUoAfa2+ojLRk3dOzMiIGu8P9T8LJoHT+BV46RRKSK2YR73+kKFYIsFsA8/M20mgqrr7PMFT4gk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784880614; c=relaxed/simple;
	bh=wIp6UNfAPvc8awGiJl3J018KQv0AJvDsgmvgbV5zm3M=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=DelM55/KAilIf92KTQTUb+/Su+lc6I1wf04ZW3l3v0LssxYX7pi4REK3WF1EHWtZQ8pqNrN720U/66qQru/F/+3eJI0UYK2SCsEKBd2JrkQz0n6OWWH4KhZek62I0frcsGQ11crp69ZTwwEQCyiDuPKkWeW72+Bx7T7UuSbQydw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=QbX9l5Se; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=HCE180C5; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="QbX9l5Se";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="HCE180C5"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66O4lUqI1510145
	for <devicetree@vger.kernel.org>; Fri, 24 Jul 2026 08:10:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	xFxJkKBL4/9hsERb3NkdYlMvO0tuMhKUefI16OhxPwg=; b=QbX9l5SeBma1nyre
	5UdcnVVWepQzkPB7lTwixyX6QccoYo/AvjE2KQ5lSW36ToS385aj6k8hM8pIUj6n
	1hwksIWwN9hJus4KHL5LDevUl37JYIYv95Pz2CHaE8ouIepMSbKcdqxPadV0CHkH
	2v2kOy7n2WoYcBuiZ6NE+HxBglE/4B78mg7xnBBXariuE8p9PdHXz21f68Z067nu
	Hv6ou/pWNsTa/AzGrMI6nozqUdPxW4to0RzHCRGabhke0Jl6Xl5/WQjHetJPLuDG
	KGktX7+/48wO6i3DFBxDITVe6+8kBblPyRge+lF9hlJ3FuKuUF3w+K308IBrhCuh
	Txc8GA==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fkusrsp7b-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Fri, 24 Jul 2026 08:10:12 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-38dde0df80bso226951a91.3
        for <devicetree@vger.kernel.org>; Fri, 24 Jul 2026 01:10:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784880611; x=1785485411; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=xFxJkKBL4/9hsERb3NkdYlMvO0tuMhKUefI16OhxPwg=;
        b=HCE180C55xaBLGOAFEw+rU16XUrMXu/q69t8CkPv+NQIXk87fzy+KOyL7f19zcJll8
         Azg3ErG2dai81ncmWg+S0G/j6GZJoXMdvcvq4UJSROQvTGN8blY6WCFOSVBJDDlepDdG
         RvL3LZUdhiVJmCbVXeM7tW/8WjXASsXhpCX++J7l81yq/NawaKy52k3/vSomBUp3zPm2
         dQyzVY9HU/F0YTlIIoykKdJNy06J4RXdFUfxqwEUoLU4vVbLtfkLC2UUGw/jllK+vOVa
         IHM2HuUZi2O6h8GYhgDeUJ8Y3JPcj47afdAKovvkGgWok3bAJMTY0ctLdGD+XDMbmGSJ
         0QlQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784880611; x=1785485411;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=xFxJkKBL4/9hsERb3NkdYlMvO0tuMhKUefI16OhxPwg=;
        b=Rk3CNYrv0GsWBVPzERI1cX5g1TeGhBI2mqWQMnwucvXxDUcUg8d78EHNqhIjsjenQq
         I/+Dpg0kKMXPqKRe4y7aUyTZSZA9Gz8FP+CWEptFpyNu7WHRq0PYrcjDFWt8Y5xRG4Sq
         xZTToBJ8pMRzuwlaBP8E8Q9BFFb9IHu3Q3DKKC2MKo9SGd/Su5eolhm98QOAHUjWkcLL
         I3wSL1z5yLVRujuUCLIBDLeINEJn9LcrlbhXfgYyBIhFtjE3Wmgzi2tdwIqq+xkBOTbO
         PwR0pdeTcGCAeOgz2oC3d9hqCzvZCSscQ8f0JvFGRY5q9uXdTx3DEbDnHsLDiNF2LYYa
         qCHQ==
X-Forwarded-Encrypted: i=1; AHgh+RpTwUXkkWMtv4hHM714F+xoGWYHnDAmLvdFX+wYcmTBiSSCcKhLStYjf0J0/NHveFfseB1Zmu7ijn5l@vger.kernel.org
X-Gm-Message-State: AOJu0Yylbh7xqEVVSWLin4L+W0ZMuBE8iN3umPK8JJSGzZu9e+EhLvrd
	x22uY6JuNf/CKunFgp6BjEUjkdh0yHB/2znL7aREjbOd3yngdUj9+31fO4MbV76reLU6m8G8EtU
	PTYkvHEVAR5mbvhcBm1Psfax6fUaX+DfztLeB1sbD3drJ4x21dcJ0ujo8jqKQBXfM
X-Gm-Gg: AR+sD10ypNYZ0BP2JhkFkIurqZHpJLz8V8Tu1lkcek15RkkznKHSlBr6OTt8LGcfJ8y
	707tHBhTkmEE46VGrOE3HfpbhV0qNu5twj4W2H+qH5QTilIF5D4qtt6Gp6NklZD1kp3kHbV6ouJ
	6simL8oF6eSnzmHcgc2A1zf6LuVFDQEOh/RvfmVqF1oUa/+IAJUN6Pm9AGJeBP5TQLgbMGfl85a
	U8GzJnef3NT5n55/QJaYbN8wcfPYpZL8roXrnGD3+qxw70vEKPD3fwi/BqdZFWXTkV/ivPV5WYi
	fMEEA35770t0ZWMDEDpc39r/Pdi11XDCJ6+Y21v+1ar1pgrnNkiw944S3mKMvzcNITN5cg2MLZk
	H25GyJv8k1mcPXaiswxm1HE+DBOUUmi4=
X-Received: by 2002:a17:90b:5146:b0:38e:6f72:9be4 with SMTP id 98e67ed59e1d1-38ec6495a15mr6867723a91.3.1784880611531;
        Fri, 24 Jul 2026 01:10:11 -0700 (PDT)
X-Received: by 2002:a17:90b:5146:b0:38e:6f72:9be4 with SMTP id 98e67ed59e1d1-38ec6495a15mr6867692a91.3.1784880610969;
        Fri, 24 Jul 2026 01:10:10 -0700 (PDT)
Received: from [10.217.252.136] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-38f03c20c06sm1096810a91.12.2026.07.24.01.10.06
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 24 Jul 2026 01:10:10 -0700 (PDT)
Message-ID: <60caa38e-9294-493a-8749-98687e4bd55d@oss.qualcomm.com>
Date: Fri, 24 Jul 2026 13:40:03 +0530
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/3] arm64: dts: qcom: rb3gen2: add Industrial BT UART
 overlay
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Luiz Augusto von Dentz <luiz.dentz@gmail.com>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Marcel Holtmann <marcel@holtmann.org>,
        Bartosz Golaszewski
 <brgl@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Rob Herring <robh@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        linux-bluetooth@vger.kernel.org, linux-kernel@vger.kernel.org,
        quic_hbandi@quicinc.com, devicetree@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, quic_anubhavg@quicinc.com,
        quic_mohamull@quicinc.com
References: <20260723-rb3-industrial-bt-uart-v1-0-3c8e580c09d1@oss.qualcomm.com>
 <20260723-rb3-industrial-bt-uart-v1-3-3c8e580c09d1@oss.qualcomm.com>
 <x7cbergf7m3jyhvgjatscbznferq24tfb4gvzinqvnn7morvkg@3jnmaarqwh2t>
Content-Language: en-US
From: Rahul Samana <rahul.samana@oss.qualcomm.com>
In-Reply-To: <x7cbergf7m3jyhvgjatscbznferq24tfb4gvzinqvnn7morvkg@3jnmaarqwh2t>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzI0MDA3MyBTYWx0ZWRfX7Q8HnDsfWkUX
 EZKPCUHIIOu6fqhm/I72iwC6x/ocOnE1686jwZWNcTFYdKLPloZnxDPz8OUKF6wtso8q8LtFDi8
 3/47y+ef83DGlKKLRlDQVEDs4YImDbY=
X-Proofpoint-ORIG-GUID: q651wvBHcKnmStuh5FVOLc-AMRFOOHM-
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzI0MDA3MyBTYWx0ZWRfX8xW0UB1ESnDd
 8BQpZcJXvp4oJpwoa2BzYXQ6yzzWtn6gx8Livcl8oDkDx1dKV6zB3Uxg21NX456TeOOG9o03xTv
 1U8Aj1T9efzXQ+33Wdb8aSg5HJpmZGXL9rdWFjZpY4V7yExkpbzK1GOjAp4ynrjcJpeO/vnJWDB
 DFrIRbnUKv0cWxG1md7ERhJensWC0H/jXUgXp7IqfQIos8y3ZuaXyMJUV/B2vJRfRyB5j95ZSU1
 l+h628PHQvs5vx4hhz/ZPr6i8tV6z9CsY1Vp9+SDRqarQF/9hyBaattH/izILoWUFFFR/92RBSt
 s9inA4NzIkdJ2tl7vzNhHJwgp1jxGS5u9SFtuYn/jdax3/WAkEwO1YuX+wzQVekpyXSY0djuFkV
 Nyz5Nj59nuWbXWpbOICqPHecrNvxb5YSGBVVy9ZbZL5DDJpXQH3x1uFyDcW8stWUz1/+DiqyINj
 3bwi0fZ57xMTChDHyDg==
X-Authority-Analysis: v=2.4 cv=PtejqQM3 c=1 sm=1 tr=0 ts=6a631de4 cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=EUspDBNiAAAA:8 a=gUoYVz9MZeqw9imU7sIA:9 a=QEXdDO2ut3YA:10
 a=mQ_c8vxmzFEMiUWkPHU9:22
X-Proofpoint-GUID: q651wvBHcKnmStuh5FVOLc-AMRFOOHM-
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-24_01,2026-07-22_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 clxscore=1015 suspectscore=0 malwarescore=0 phishscore=0
 lowpriorityscore=0 adultscore=0 priorityscore=1501 spamscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607240073



On 24-07-2026 00:40, Dmitry Baryshkov wrote:
> On Thu, Jul 23, 2026 at 06:01:09PM +0530, Rahul Samana wrote:
>> Add an overlay for the RB3 Gen 2 Industrial mezzanine variant that routes
>> QCC2072 Bluetooth over UART4 and models the M.2 E-key connector graph
>> endpoints for PCIe and UART.
>>
>> The default Industrial mezzanine overlay describes the common mezzanine
>> hardware. Build this variant by applying the common Industrial mezzanine
>> overlay first, followed by the BT UART overlay, because the reworked board
>> keeps the common mezzanine description and only changes the Bluetooth
>> transport routing.
>>
>> The overlay also disables the on-board WCN6750 PMU and UART7 path so the
>> M.2 QCC2072 Bluetooth controller can be used instead.
>>
>> Signed-off-by: Rahul Samana <rahul.samana@oss.qualcomm.com>
>> ---
>>  arch/arm64/boot/dts/qcom/Makefile                  |   2 +
>>  ...s6490-rb3gen2-industrial-mezzanine-bt-uart.dtso | 133 +++++++++++++++++++++
>>  2 files changed, 135 insertions(+)
>>
>> diff --git a/arch/arm64/boot/dts/qcom/Makefile b/arch/arm64/boot/dts/qcom/Makefile
>> index 6f33c4e2f09c..45786d3db14a 100644
>> --- a/arch/arm64/boot/dts/qcom/Makefile
>> +++ b/arch/arm64/boot/dts/qcom/Makefile
>> @@ -179,8 +179,10 @@ dtb-$(CONFIG_ARCH_QCOM)	+= qcs6490-rb3gen2.dtb
>>  
>>  qcs6490-rb3gen2-vision-mezzanine-dtbs := qcs6490-rb3gen2.dtb qcs6490-rb3gen2-vision-mezzanine.dtbo
>>  qcs6490-rb3gen2-industrial-mezzanine-dtbs := qcs6490-rb3gen2.dtb qcs6490-rb3gen2-industrial-mezzanine.dtbo
>> +qcs6490-rb3gen2-industrial-mezzanine-bt-uart-dtbs := qcs6490-rb3gen2.dtb qcs6490-rb3gen2-industrial-mezzanine.dtbo qcs6490-rb3gen2-industrial-mezzanine-bt-uart.dtbo
>>  
>>  dtb-$(CONFIG_ARCH_QCOM)	+= qcs6490-rb3gen2-industrial-mezzanine.dtb
>> +dtb-$(CONFIG_ARCH_QCOM)	+= qcs6490-rb3gen2-industrial-mezzanine-bt-uart.dtb
>>  dtb-$(CONFIG_ARCH_QCOM)	+= qcs6490-rb3gen2-vision-mezzanine.dtb
>>  dtb-$(CONFIG_ARCH_QCOM)	+= qcs6490-thundercomm-minipc-g1iot.dtb
>>  dtb-$(CONFIG_ARCH_QCOM)	+= qcs6490-thundercomm-rubikpi3.dtb
>> diff --git a/arch/arm64/boot/dts/qcom/qcs6490-rb3gen2-industrial-mezzanine-bt-uart.dtso b/arch/arm64/boot/dts/qcom/qcs6490-rb3gen2-industrial-mezzanine-bt-uart.dtso
>> new file mode 100644
>> index 000000000000..06560df0a719
>> --- /dev/null
>> +++ b/arch/arm64/boot/dts/qcom/qcs6490-rb3gen2-industrial-mezzanine-bt-uart.dtso
>> @@ -0,0 +1,133 @@
>> +// SPDX-License-Identifier: BSD-3-Clause
>> +/*
>> + * Copyright (c) 2026 Qualcomm Innovation Center, Inc. All rights reserved.
>> + */
>> +
>> +/dts-v1/;
>> +/plugin/;
>> +
>> +#include <dt-bindings/gpio/gpio.h>
>> +#include <dt-bindings/interrupt-controller/arm-gic.h>
>> +
>> +&{/} {
>> +	vreg_wcn_3p3: regulator-wcn-3p3 {
>> +		compatible = "regulator-fixed";
>> +		regulator-name = "VREG_WCN_3P3";
>> +		regulator-min-microvolt = <3300000>;
>> +		regulator-max-microvolt = <3300000>;
>> +
>> +		regulator-boot-on;
>> +	};
>> +
>> +	m2_e_connector: m2-e-connector {
> 
> Kill unused labels. Everywhere.
> 
>> +		compatible = "pcie-m2-e-connector";
>> +		vpcie3v3-supply = <&vreg_wcn_3p3>;
>> +
>> +		m2_e_ports: ports {
>> +			#address-cells = <1>;
>> +			#size-cells = <0>;
>> +
>> +			port@0 {
>> +				reg = <0>;
>> +				#address-cells = <1>;
>> +				#size-cells = <0>;
>> +
>> +				m2_e_pcie_ep: endpoint@0 {
>> +					reg = <0>;
>> +					remote-endpoint = <&pcie0_m2_e_ep>;
>> +				};
>> +			};
>> +
>> +			port@3 {
>> +				reg = <3>;
>> +				#address-cells = <1>;
>> +				#size-cells = <0>;
>> +
>> +				m2_e_uart_ep: endpoint@0 {
>> +					reg = <0>;
>> +					remote-endpoint = <&uart4_m2_e_ep>;
>> +				};
>> +			};
>> +		};
>> +	};
>> +};
>> +
>> +&qup_uart4_cts {
>> +	bias-bus-hold;
>> +};
>> +
>> +&qup_uart4_rts {
>> +	drive-strength = <2>;
>> +	bias-disable;
>> +};
>> +
>> +&qup_uart4_rx {
>> +	bias-pull-up;
>> +};
>> +
>> +&qup_uart4_tx {
>> +	drive-strength = <2>;
>> +	bias-disable;
>> +};
>> +
>> +&tlmm {
>> +	qup_uart4_sleep_cts: qup-uart4-sleep-cts-state {
>> +		pins = "gpio16";
>> +		function = "gpio";
>> +		bias-bus-hold;
>> +	};
>> +
>> +	qup_uart4_sleep_rts: qup-uart4-sleep-rts-state {
>> +		pins = "gpio17";
>> +		function = "gpio";
>> +		bias-pull-down;
>> +	};
>> +
>> +	qup_uart4_sleep_tx: qup-uart4-sleep-tx-state {
>> +		pins = "gpio18";
>> +		function = "gpio";
>> +		bias-pull-up;
>> +	};
>> +
>> +	qup_uart4_sleep_rx: qup-uart4-sleep-rx-state {
>> +		pins = "gpio19";
>> +		function = "gpio";
>> +		bias-pull-up;
>> +	};
>> +};
>> +
>> +&pcie0_port {
>> +	pcie@0,0 {
>> +		pcie@2,0 {
>> +			port {
> 
> The house that Jack built. Don't use multiple nested nodes to patch it.
> The node might go away and nobody will notice it. Add a label to the
> exact location and patch only it.
> 
>> +				pcie0_m2_e_ep: endpoint {
>> +					remote-endpoint = <&m2_e_pcie_ep>;
>> +				};
>> +			};
>> +		};
>> +	};
>> +};
>> +
>> +&uart4 {
>> +	status = "okay";
>> +	/delete-property/ interrupts;
>> +	interrupts-extended = <&intc GIC_SPI 605 IRQ_TYPE_LEVEL_HIGH>,
>> +			      <&tlmm 19 IRQ_TYPE_EDGE_FALLING>;
>> +	pinctrl-names = "default", "sleep";
>> +	pinctrl-1 = <&qup_uart4_sleep_cts>, <&qup_uart4_sleep_rts>,
>> +		    <&qup_uart4_sleep_tx>, <&qup_uart4_sleep_rx>;
>> +
>> +	port {
>> +		uart4_m2_e_ep: endpoint {
>> +			remote-endpoint = <&m2_e_uart_ep>;
>> +		};
>> +	};
>> +};
>> +
>> +&uart7 {
>> +	status = "disabled";
>> +};
>> +
>> +&{/wcn6750-pmu} {
> 
> label
> 
>> +	status = "disabled";
>> +};
>>
>> -- 
>> 2.34.1
>>
> 

Hi Dmitry,

Ack, I will clean this up in v2.

I will remove the unused connector/ports labels and add labels to the
existing nodes that the overlay needs to patch, including the WCN6750 PMU
node and the relevant PCI child node below pcie0_port.

I will then update the BT UART overlay to reference those labels directly
instead of reconstructing the full nested path or using the /wcn6750-pmu
path reference.

Thanks,
Rahul

