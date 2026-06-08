Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 673C83438B1
	for <devicetree@vger.kernel.org>; Mon,  8 Jun 2026 03:11:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780888272; cv=none; b=SXWAv7aD7bby3dglFnwLnbAoSxLw6rydtXoXP0c05etaqckpFv5D+/szRNh8/y3x93M1cVa+Hy78Uu9YbLHzED6XcP2b0zrudi8cEA5kN9blaVqqOUeyZx6Du5IfMUluQPTKiVYDms5c8aWrp8qmWeMgJeOLm1uVhF6IcUXsM2k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780888272; c=relaxed/simple;
	bh=Qg9r3duy3RzRwGyoJsHsGhEuW5HyFAodhxmT64u5k3s=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=oso1g0yd9QB1jXWIJGEa4Azs2bUQJNXxSMAudaTuplz9iuFtrVR+ZgpvZQFvuEebrCV6tSOUboNCi7gLQWfbDnjmSxDe5U8W3A4ankUoQGHtbuWhloatAAKLTGyRLSoo6GmIEgqtLdWOfkIySBF0Nsc5oyq4MEjD/yiypX1ojyM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=IxkY/Umt; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=eum3MkyP; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="IxkY/Umt";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="eum3MkyP"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6580FpfW2023775
	for <devicetree@vger.kernel.org>; Mon, 8 Jun 2026 03:11:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	GKPIRoTdsu8PRW1CecrhqS4AjNkhswIihoIHcQ2sb7I=; b=IxkY/Umt7J+WrfYm
	hB5toGC0d0D5FAC3xiE69IhpbHNH/HPoL4s2qVdyb8mEcry7joI+ynAR6zYm+y8k
	kdYeU0ZRYMGuwxMWZlIEzAdjh4KoROS1BusUZpgFAN/q4IuxNwg+O7ySFhXByGbf
	ehXMzpnqGjAAAchxjYetSQhXW2dJ588mtLifpOHJxYWjBQuoNrCJUPuOBPC7oPnv
	n8rCMrCLErCnpsE6aN62i0LiSUgJhxYQPpf3QXQE4RQ9OZCw1qTa+D2RrPcgpAHd
	Rk595ualGa8OPPztLGNSXTAFxIaW1+o6rRMTg97pZdwXlDeyYoVN7ueVam82yC1u
	A+NNjg==
Received: from mail-vk1-f199.google.com (mail-vk1-f199.google.com [209.85.221.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4embmrdm46-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 08 Jun 2026 03:11:07 +0000 (GMT)
Received: by mail-vk1-f199.google.com with SMTP id 71dfb90a1353d-5ab036818efso2060653e0c.2
        for <devicetree@vger.kernel.org>; Sun, 07 Jun 2026 20:11:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1780888266; x=1781493066; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=GKPIRoTdsu8PRW1CecrhqS4AjNkhswIihoIHcQ2sb7I=;
        b=eum3MkyPnus+sIa00/QR3XHwiwQYy4nNYV0TEo3zZmGVC7YB3v3rYzuUWrpHND/+C5
         5bfGWoB7hMegvcjPzAUZOyRK7PdDvfy3Yl3b37yMDQTuqLW1Fd0H2g4x8RmK2/UgTyoi
         sjEgLAxmKqv+WE+etsxsMEuYzy1Fj5FJ6Iu1XgQS4p8hckCyIA6qRwtmTtB4nM2EXivu
         YcGeu7D2mgeurS0LPjYdEY2P/cGXJelfrzCc+AgteDx8vqEt1W4SsGSsuRX08fc2rmP8
         TuONufad4BnTMf0EHa5515mgKbhZCumZnffxaVvVZsDjXpKcVKUv7KGzljKh2s3Bc5go
         3iaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780888266; x=1781493066;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=GKPIRoTdsu8PRW1CecrhqS4AjNkhswIihoIHcQ2sb7I=;
        b=r0yi+4ixDh/BdCr0O39w+RDQHjlBTQtrEYr9Edvb0/Wu7SeCRvounPVyhSi+rr/MnK
         klu/RZkzHbrFx+pB/XKN/bHGn9FjkTkfPHwtB2Yai8gTh9gS9rv/KbqjgSU5ksbz4YKG
         /6nkMJaYpgM2Yw3tK8rlLQ/PoUQRvhhrUMZYaIjtZv7ReQn/53ZvOrKLsgisc93NctJ0
         rSH9oh5xuQsj85zuvsLQG1OkqWwzsVQeOKXgjJstOAhNIgBtfGEPqTKQX7gc4wzb01ez
         HpXyz4QUMQiizoSUHd1jf52Z4vdY5ifMVl58m3670SFPY3ybPf6C2SxSiSX1Eq+PkWU5
         sQfA==
X-Forwarded-Encrypted: i=1; AFNElJ+pLOS5ZzKOAZ3rwPThau/A3lC54LPU42FqyV+3LJTOFrJmI2IZsgU+i8Lwf3mJxGBRXvdwvUtD7bZU@vger.kernel.org
X-Gm-Message-State: AOJu0YxzLryXHAHwLI5km+F7fkp/O4sbF8CrqosrN6HzjeBBltXrhLlh
	DLBfST17xDezZL9CZqK4scuDuzavKUrSIQYoUVCu8ZqWRJ6SzYen/eUmw450Kp31AGP3lz3xZJW
	JrB3ddSez5W5X1uitIlSLO1YY7tm5vYXl8LVXlis3+mPXcpShtJIW4HSMSWQZo8p+
X-Gm-Gg: Acq92OFc2jfiUCRIPlpa1LcGzi601LM4hLAG4TXvLiTFXU50yCUgXbe4n5N5YmuJeRC
	WinO2MhFbCNrNjL/aR6/I3Sw9r369S89PZDGMNQIeWB7PEvPCD/3ybS0msYx+Z2GZuN13Sov2/K
	dakjRpm38Y4IS3NyDxHDIP5WCsf4S8GVcaP3dJnwE5zYahsnUGUU0BL8KCOlE6bDEbuYtOrpiqZ
	PrVBAUZBhem4A091QvIuWcGXUdZap8Pw+GpREHOTiEGKNu5mHGYqc9XQt0+niUXgrDEeQzwufZg
	B4W46SkE10kRmwpgTiKauLcjd9v21vlKql9YbBT4B2O2zqmxCbGj8nj6DOQS2AwVcL6x0A04Y24
	ciP8XWjKisH0YWb3tzfGxWnbwNeB2soFSS8Vy8H6YKfG5urG9VdUMxSYXNsFYgnn5pqXI+UItb5
	LeFUZraHQU3GZX/cj4oZXYF5Bzpf+uyFG+Bx1fTLcKng4AyA==
X-Received: by 2002:a05:6102:8097:b0:605:ead:8f38 with SMTP id ada2fe7eead31-6ff005a01f4mr6434755137.29.1780888266423;
        Sun, 07 Jun 2026 20:11:06 -0700 (PDT)
X-Received: by 2002:a05:6102:8097:b0:605:ead:8f38 with SMTP id ada2fe7eead31-6ff005a01f4mr6434739137.29.1780888265923;
        Sun, 07 Jun 2026 20:11:05 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5aa7b990438sm3424243e87.67.2026.06.07.20.11.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 07 Jun 2026 20:11:04 -0700 (PDT)
Date: Mon, 8 Jun 2026 06:11:02 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Herman van Hazendonk <github.com@herrie.org>
Cc: Bjorn Andersson <andersson@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
        devicetree@vger.kernel.org, Konrad Dybcio <konradybcio@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        Rob Herring <robh@kernel.org>, Thomas Gleixner <tglx@kernel.org>
Subject: Re: [PATCH 1/2] dt-bindings: interrupt-controller: qcom: add
 msm8660-mpm
Message-ID: <rnbfyflbigjdio3zfvbbrivdbojklnzwykzsg6du7kxx6fo4vp@zboxipgozsv7>
References: <cover.1780148149.git.github.com@herrie.org>
 <d64594cea7a2ebdff8fc0b1d7b0ac1fd5124d2e2.1780148149.git.github.com@herrie.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <d64594cea7a2ebdff8fc0b1d7b0ac1fd5124d2e2.1780148149.git.github.com@herrie.org>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjA4MDAyNSBTYWx0ZWRfX4JMual8VMbqM
 MT23LYChZVLY7yc3eA1l2DZup6P8bW4KSqnAT+PbRa/6Ol2bAcK5XLg0C13xti+r2Ytxkhm3z9K
 5y+mWt3llmSYMMuH2XoIFVtytMgnV23pMgJqbDNa9Pxttct7CWtivyDnQSrMhEHqMkwexXDQp/H
 Bw01L9GgKr7wkO8kw/lEamseYz/TvJULh+CJqUTEYARnuqlormPaLuPss3kzMQf5Je0mpwa23Ez
 T2IUFpF2dJEokRNry8/0hbS1W/nS12MHe0Ic5k2hcwmXWtwdh9+Wtm8ll+F6QLXxiTEhSsBNn79
 LINWG14yprjs1fORku7ed1cDFOsbhBpN4RXMXfpNHtEr0vqbFd0NldI+w9QdpcAdFGzzJYdUHdm
 PI7YoEWAA6brlaPgEu+ns2r/v+o68fPAGu+uGq6zZMzO7zrdf1b2gEKNsDNnv+iursgGw9qJfv4
 VT2qB1/ipkWAkO9aTSQ==
X-Authority-Analysis: v=2.4 cv=B5eJFutM c=1 sm=1 tr=0 ts=6a2632cb cx=c_pps
 a=+D9SDfe9YZWTjADjLiQY5g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22 a=gEfo2CItAAAA:8
 a=cTwmTnRGAAAA:8 a=0dIclahs-Kuf6WvM9VoA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=vmgOmaN-Xu0dpDh8OwbV:22 a=sptkURWiP4Gy88Gu7hUp:22 a=GUWCSGlMWfG-xDt5EnV5:22
X-Proofpoint-GUID: iQ_qIfmr1817wwSO9fMCC6hB6KWlU35U
X-Proofpoint-ORIG-GUID: iQ_qIfmr1817wwSO9fMCC6hB6KWlU35U
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-08_01,2026-06-05_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 priorityscore=1501 spamscore=0 malwarescore=0 phishscore=0
 bulkscore=0 clxscore=1015 adultscore=0 lowpriorityscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605210000 definitions=main-2606080025

On Sat, May 30, 2026 at 04:00:22PM +0200, Herman van Hazendonk wrote:
> Add the binding for the Modem Power Manager (MPM) interrupt
> controller on the MSM8x60 family (MSM8260/MSM8660/APQ8060). The MPM
> is a small wake-capable interrupt aggregator that lets the SoC stay
> in low-power states while a small set of GIC SPIs continues to be
> monitored and can wake the system on an edge.
> 
> The binding describes its register region (in the RPM syscon), the
> GIC SPI it raises on a wake event, the GIC mailbox it shares with
> the RPM, and the per-pin wake-source mapping table.
> 
> Signed-off-by: Herman van Hazendonk <github.com@herrie.org>
> ---
>  .../qcom,msm8660-mpm.yaml                     | 122 ++++++++++++++++++
>  1 file changed, 122 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/interrupt-controller/qcom,msm8660-mpm.yaml
> 
> diff --git a/Documentation/devicetree/bindings/interrupt-controller/qcom,msm8660-mpm.yaml b/Documentation/devicetree/bindings/interrupt-controller/qcom,msm8660-mpm.yaml
> new file mode 100644
> index 000000000000..72f9c2be03b2
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/interrupt-controller/qcom,msm8660-mpm.yaml
> @@ -0,0 +1,122 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/interrupt-controller/qcom,msm8660-mpm.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Qualcomm MSM8x60 MPM wakeup interrupt controller
> +
> +maintainers:
> +  - Herman van Hazendonk <github.com@herrie.org>
> +
> +description: |
> +  The MSM Power Manager (MPM) on the MSM8x60 family (MSM8260/MSM8660/
> +  APQ8060) is an always-on hardware block that keeps a set of wake
> +  interrupts alive while the application processor is powered down.
> +  On MSM8x60 the vMPM registers live INSIDE the RPM control block
> +  (request regs at RPM_BASE + 0x9d8, status at RPM_BASE + 0xdf8), with
> +  notification of new wake-source configuration delivered via the
> +  qcom-apcs-ipc mailbox (writing GCC + 0x008 bit 1).
> +
> +  This binding is MSM8x60-specific. Newer Qualcomm SoCs (sm6375, etc.)
> +  use the qcom,mpm binding which assumes a dedicated MPM SRAM region
> +  and an IPCC mailbox — neither holds on MSM8x60. The driver lives at
> +  drivers/irqchip/irq-msm8660-mpm.c.
> +
> +allOf:
> +  - $ref: /schemas/interrupt-controller.yaml#
> +
> +properties:
> +  compatible:
> +    const: qcom,msm8660-mpm
> +
> +  interrupts:
> +    maxItems: 1
> +    description:
> +      IPC IRQ raised by MPM when one of the enabled wake sources fires.
> +      On MSM8x60 this is wired to GIC SPI 2.
> +
> +  qcom,rpm-syscon:
> +    $ref: /schemas/types.yaml#/definitions/phandle
> +    description:
> +      Phandle to the RPM control block exposed as a syscon. The vMPM
> +      registers are accessed at offsets within this block.
> +
> +  qcom,mpm-offset:
> +    $ref: /schemas/types.yaml#/definitions/uint32
> +    description: |
> +      Offset of the vMPM register window within the RPM syscon. On
> +      MSM8x60 this is 0x9d8. Status registers are at this offset + 0x420
> +      (== 0xdf8 from RPM base).
> +
> +  mboxes:
> +    maxItems: 1
> +    description:
> +      Mailbox channel used to notify MPM that the vMPM request
> +      registers have been updated. On MSM8x60 this is the
> +      qcom-apcs-ipc mailbox channel 1 (writes GCC + 0x008 bit 1).
> +
> +  interrupt-controller: true
> +
> +  '#interrupt-cells':
> +    const: 2
> +    description:
> +      First cell is the MPM pin number / parent GIC SPI; second cell
> +      is the trigger type.
> +
> +  qcom,mpm-pin-count:
> +    $ref: /schemas/types.yaml#/definitions/uint32
> +    description: Total number of MPM pins exposed.
> +
> +  qcom,mpm-pin-map:
> +    $ref: /schemas/types.yaml#/definitions/uint32-matrix
> +    items:
> +      items:
> +        - description: MPM pin number
> +        - description: GIC SPI number this pin maps to
> +    description: |
> +      List of (MPM-pin, GIC-SPI) tuples for wake sources that have a
> +      corresponding GIC IRQ. Consumers route their interrupts through
> +      the MPM hierarchical irqdomain to take advantage of these
> +      mappings.
> +
> +      Raw wake pins like SDC3/4 DATx (pins 21-24) are NOT listed
> +      here — they have no GIC SPI mapping and are accessed through
> +      the msm8660_mpm_set_pin_wake() / msm8660_mpm_enable_pin() C API
> +      by consumer drivers.
> +
> +required:
> +  - compatible
> +  - interrupts
> +  - qcom,rpm-syscon
> +  - qcom,mpm-offset
> +  - mboxes
> +  - interrupt-controller
> +  - '#interrupt-cells'
> +  - qcom,mpm-pin-count
> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    #include <dt-bindings/interrupt-controller/arm-gic.h>
> +
> +    soc {
> +        #address-cells = <1>;
> +        #size-cells = <1>;

No need to, drop the soc and cells.

> +
> +        msm8660_mpm: interrupt-controller {

Drop the label.

> +            compatible = "qcom,msm8660-mpm";
> +            qcom,rpm-syscon = <&rpm>;

Can we define it under the RPM device node? Then you won't need to pass
rpm like this.

> +            qcom,mpm-offset = <0x9d8>;

I assume it doesn't change on a chip. Use compatible to identify the
offset.


But then it becomes compatible with the qcom,mpm.yaml schema. Just add
qcom,msm8660-mpm to that file.

> +            interrupts = <GIC_SPI 2 IRQ_TYPE_EDGE_RISING>;
> +            mboxes = <&gcc_ipc 1>;
> +            interrupt-controller;
> +            #interrupt-cells = <2>;
> +            interrupt-parent = <&intc>;
> +            qcom,mpm-pin-count = <64>;
> +            qcom,mpm-pin-map = <25 100>,
> +                               <26 50>,
> +                               <27 79>;
> +        };
> +    };
> -- 
> 2.43.0
> 

-- 
With best wishes
Dmitry
