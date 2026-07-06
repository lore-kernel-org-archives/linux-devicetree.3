Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2C313423789
	for <devicetree@vger.kernel.org>; Mon,  6 Jul 2026 15:47:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=205.220.180.131
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783352843; cv=pass; b=NpBHwmQA8k7TY//O9BE6m08ig6/WdWwUoqg+PHtvHsfuLXZIolKszxcMSLneiPFaliEsKH6RyhJ+1kO+Fv+C7h6HH+esyp8NMx8PeAB6ObXgy5yCSXyj0T6FgA6BL//ezR1t5ySROEtUyEdIswNTm3u7wed2D9zQwZ7sp0uDGJY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783352843; c=relaxed/simple;
	bh=XElJj2uThhhGg5QlCAwmqIYCW6h4f5vBP4BRIc+ud8Y=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=hCBH43dNR79fhSCpQ1Lpppe2/S79CGaddLXf/H6iTR6aPVFWDuszH4yGVit7dlBvO7rYG6O+bSaR06rplguyZNJtB0jUYnjtdVRw6iqgV5uJmmUfpi0kBLW1SfQxeqVp4NRQ56rD/fJV++Oa/kfSbXtSXENYUnuaaD1AFZsDuAs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=LDeTYV0k; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=g5VauClx; arc=pass smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="LDeTYV0k";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="g5VauClx"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 666FF7II900713
	for <devicetree@vger.kernel.org>; Mon, 6 Jul 2026 15:47:21 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	7h5dC7acDKyEXpgLdlaqIkDw7fE15csT3VOeWkXur/M=; b=LDeTYV0kvWJLCHAR
	r0e8QYRTIoWhGZxTpisBeUVTxPaL+dieVwRMU8K7/J72xLP0UETd6qfjcg/tEJs+
	MKDY0BmJW2f1fijHMDAKJi94EotKGHJUVOab9HgHOO/ydoDHJXnk5CNOofEWqRj8
	pKAfZsER9U1bKtBXFPjr+s9+cBfH/Q6+slQ9EBfipYOFhMGf8dE49eXN6eTimjUT
	T/2URZcWBhjV2IqU/DHh3PapsSLIZpcoR+XEPrJrS3UUzphxo2j+r5P7Aml1HRNN
	lWsirK053SSUBrGtxL1PO980kyt8fJ4/NEBGmjWLkBL4Km5j30PbY+RHCnTTfkf2
	FuozIQ==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f87q7j7h2-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 06 Jul 2026 15:47:21 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-51c20762d21so38576501cf.0
        for <devicetree@vger.kernel.org>; Mon, 06 Jul 2026 08:47:21 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1783352840; cv=none;
        d=google.com; s=arc-20260327;
        b=oTkNcY3YWBjMC6r9ZkGjCejWud2hZCWTn9jsfqlew9i0SyIKQXlR9FG6nB8EDeCHnE
         o52qTycqlvOp4YVOl4fHZFN+2gM9akpZ5f/vaOK3RQc3qdlHf0RFSh97vgPftb9sFp/t
         o+mFzrEW9oOVuHvbpsh729sEc0DnrNl+hfYGGcTaMcDxFEVg3kuZ+Wl31mnAr7OhHXgr
         4immCzg0m8i7ELiuQjgfdEbuW+bPhp7n35g4iUuiymZm2jUikPG84Vu83tuJYu/NYhUx
         M+BjPlmXPLGitza6VsX8Yfx6bOG6LdSb0AMTGUrFgfkn4eEExes3wk/1bR3jSMg/kcvP
         TQjA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=7h5dC7acDKyEXpgLdlaqIkDw7fE15csT3VOeWkXur/M=;
        fh=0QJ3RpExSoV4rL9mk78x5OOlvJq0u6T0DA98P3X76jQ=;
        b=sT2t35tGlqtF+cT7XvE4ijkXuEd/Mx3aOrlasWic1hACwrAHtGzsfkdjjVnEuUJng0
         bAOh38vSQTjSE6kXuzknhno4CI7OiAeNuB/6/Y8O0+jS0JzA0xDk/JxUWubzPYM9xpls
         vvOaEvc2nGlLMKshWfp/WuGAJ8ymtX9VtOMaLFar4HWv//9CGPO5C0j9NajNsJhd5/N4
         oKCEyzLVoBFvkr2o6ZrR8d51kpcY5hhRz/gIH7cS3VdymhiFSfdZBAwqmmJ+fWaI1VBE
         CsIGqafb42sEvS0yfqD8VQbxIRK7A0VfjxMr0ttATzD1sUruBwVz9LR1+VawzwwH3sn9
         QGTg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783352840; x=1783957640; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=7h5dC7acDKyEXpgLdlaqIkDw7fE15csT3VOeWkXur/M=;
        b=g5VauClxFPz26jogGbKEJIgFzkqRw5yN8VzvAXtIyNUFDDzw9Jnp4yvsPavah0QENa
         pSjq+0X3TSC9pyQ/izcuU3gzTBA8NHnALhwi4jtyx74n8KEBgzZQa/lZ+5mrUTdTmGaW
         k5qqTKeDAbOJ9UIrAAsG8FAvMmicJ47/3Xv7Xqu9iKKTK3vvuVlWZGwDHfhunnaqrTw4
         +E1LQ3p2TwcPVUS67cV58XGmHGjc6w+HN7Hu0FlSJG4JP89g6ncU1L0qVFAoVGMUzv4K
         2P9sPqkbenTEHB6NqBax5OkhpIqT54THQOrg20YCUxV4L6/CiO24OdIdnyrghC0FL63L
         LksQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783352840; x=1783957640;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=7h5dC7acDKyEXpgLdlaqIkDw7fE15csT3VOeWkXur/M=;
        b=NCNImUH+z07d4QL9tCaSdl0Ib4ekk/1A0VjB74ndO+IRSLUrl7M9mzoWmjtl8WqVnl
         8rTq8MEcmX1sAriwqhITgyRADf64MFdm7n/9mgAeyMretETR3OFv32ojWTQQk+6g+u0r
         YIETNbD6NidHqgXuqtvxOEjmT0S34GNWuZgUc+6PQZ4egLdqVGuFK11sRFwFZXyqOd0e
         ZBUzGUMzE5Ba3h/Kvj7N8nDXobN2ZOfzgLY+hFDtvXLhoKVPYtKY8mSLTph9xGUAEBxq
         WCA75fSLTjbtU5Qsk+JP1f6zBbGtT0I5PMKOnW1z0j0de3eE12XHgdY9+6uGuo5dl0bA
         eZdg==
X-Forwarded-Encrypted: i=1; AHgh+RpL/aVSIsjd3gapRqJ9orW0WCgpvdbxVgugn19/HPbl4vXN1bkTocxJPdR/VAFYTFsjrRU3kgrRLtP0@vger.kernel.org
X-Gm-Message-State: AOJu0YwcTc1o4mo15bmzvgjFVd4W8YoTYJpUajnCQpwB3EEjeNQIUJ9r
	HKCEjL6hL7FdZEqvb1beGNBabXdqASH9iACHY0Ba0FV2S6iYIlqZtTZPShkbd9WLA/CY4ZhBThf
	/H62jV7c9xEV1NwZdXhkqx/HEbCOI63iFYvNiaMJOagc5WMg/cykcMz8bJ49f0jfEJHav1d96R8
	airwn7B+PgqulnxQmntpi0CO80jQaMFwgVG1r+9HE=
X-Gm-Gg: AfdE7cmwj6jmmriOpJVdUxAjBF2bYz5uQVyinML2o7tsI8+LdvEY8jOWoilR1xjacSj
	+5dt2kvayOOEScomTb4Ww/tfBkuCUJHaQSGt4CfWmk4hhJqTdJSkGdwXSJaXqPwp7tDghmyW0cl
	qj2+ac7Uub2PUDlEkr+cOjcfNu6hUwhEziyNatzcJ1xChSgkg7Nekia+HJgTIQWGUIQK75
X-Received: by 2002:ac8:5945:0:b0:51c:f3e:7819 with SMTP id d75a77b69052e-51c7485353cmr11902871cf.39.1783352839910;
        Mon, 06 Jul 2026 08:47:19 -0700 (PDT)
X-Received: by 2002:ac8:5945:0:b0:51c:f3e:7819 with SMTP id
 d75a77b69052e-51c7485353cmr11901741cf.39.1783352838995; Mon, 06 Jul 2026
 08:47:18 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260624163112.535237-1-egbostina@gmail.com>
In-Reply-To: <20260624163112.535237-1-egbostina@gmail.com>
From: Ulf Hansson <ulf.hansson@oss.qualcomm.com>
Date: Mon, 6 Jul 2026 17:47:07 +0200
X-Gm-Features: AVVi8CfzqN7-SntgPzuM7Yr4J0xo1c-lEeihMH2qEHeYx-90EH1MAqq1u18wnqI
Message-ID: <CAPx+jO8yL==cV5F9AZ1+rPezGUV3y7a3FmXcf92kdTKPQ-SAeQ@mail.gmail.com>
Subject: Re: [PATCH v2] dt-bindings: mmc: Convert TI OMAP2420 MMC to DT schema
To: Eduard Bostina <egbostina@gmail.com>
Cc: daniel.baluta@nxp.com, simona.toaca@nxp.com, goledhruva@gmail.com,
        m-chawdhry@ti.com, Ulf Hansson <ulfh@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, linux-mmc@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA2MDE2MCBTYWx0ZWRfX5IwMdK5tGPMu
 HfeWUh3iGQUtdqHGKWK1J91maePB/cGGp8m+hyQXn09U2kK3NfeDpAbOLVnAvPUAPcydqANBgK3
 6RNGxO7wBhG973mGiIvEXmYOzgCNP+bSFQbbw+g/P6r8paYeRDjN6OiVAqZ3MCLVJiO6nY0LyYW
 7DYaJrfssZz5Ss8dHvobZcwzzI5Fose/CavtBZQwsAKKp9PdDq3HrdBppqSz16Z5PTMXXrPKDme
 eUDcbt+K8hCkYDwZKgMUEtNQAXyjjlgaLOwyQI16lBhjBrSXixCpG3af+9JqB/UajBIdVsk8fTc
 Nqhne5W7OHqsJF8ofCdab6qSlGaAhPP8OtoNuPY0GMIof4w6sq0ShGkEcH/slgVlqFnh4nlNYGY
 ti1C7WRM74TiyPC0A4Vg+1yVHEx1MRHzayVaP1uS2M14MR+wGNTmc6jWN0+zXV+YcHmsszxUbx2
 5AAPJvmWUwZpjucAJWA==
X-Proofpoint-ORIG-GUID: RfrY8Sh9WzWjSspEaVgd_jRfze0XUWjT
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA2MDE2MCBTYWx0ZWRfXwckl8eHHNyPF
 wjdoXjZ76orXqCB9PQbRcVE1c/bLQ6X+ss26plVcYljoi1BLYKXZVyegDVkNhhm75VfyhbhZvCe
 8lf2VjcrUv9eOVv1+cm6Qyn+YQWFFdI=
X-Proofpoint-GUID: RfrY8Sh9WzWjSspEaVgd_jRfze0XUWjT
X-Authority-Analysis: v=2.4 cv=f9N4wuyM c=1 sm=1 tr=0 ts=6a4bce09 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=rJkE3RaqiGZ5pbrm-msn:22 a=gEfo2CItAAAA:8 a=pGLkceISAAAA:8
 a=rYku_RNXk5ZzOjx0YwcA:9 a=QEXdDO2ut3YA:10 a=a_PwQJl-kcHnX1M80qC6:22
 a=sptkURWiP4Gy88Gu7hUp:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-06_02,2026-07-06_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 adultscore=0 impostorscore=0 bulkscore=0 suspectscore=0
 clxscore=1015 spamscore=0 phishscore=0 priorityscore=1501 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607060160

On Wed, Jun 24, 2026 at 6:31=E2=80=AFPM Eduard Bostina <egbostina@gmail.com=
> wrote:
>
> Convert the Texas Instruments MMC host controller bindings
> to DT schema.
>
> Note that the OMAP2420 driver will not work with OMAP2430 or later omaps.
> Please see the OMAP HSMMC driver for current OMAPs.
>
> Signed-off-by: Eduard Bostina <egbostina@gmail.com>

Applied for next, thanks!

Kind regards
Uffe


> ---
> Changes in v2:
>   - Changed ti,hwmods type reference from string-array to string
>   - Updated ti,hwmods regex pattern to "^msdi([1-9]|[1-9][0-9]+)$"
> ---
>  .../bindings/mmc/ti,omap2420-mmc.yaml         | 60 +++++++++++++++++++
>  .../devicetree/bindings/mmc/ti-omap.txt       | 26 --------
>  2 files changed, 60 insertions(+), 26 deletions(-)
>  create mode 100644 Documentation/devicetree/bindings/mmc/ti,omap2420-mmc=
.yaml
>  delete mode 100644 Documentation/devicetree/bindings/mmc/ti-omap.txt
>
> diff --git a/Documentation/devicetree/bindings/mmc/ti,omap2420-mmc.yaml b=
/Documentation/devicetree/bindings/mmc/ti,omap2420-mmc.yaml
> new file mode 100644
> index 000000000000..794d5ec0b58e
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/mmc/ti,omap2420-mmc.yaml
> @@ -0,0 +1,60 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/mmc/ti,omap2420-mmc.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Texas Instruments MMC host controller for OMAP1 and 2420
> +
> +maintainers:
> +  - Eduard Bostina <egbostina@gmail.com>
> +
> +description: |
> +  The MMC Host Controller on TI OMAP1 and 2420 family provides
> +  an interface for MMC, SD, and SDIO types of memory cards.
> +
> +allOf:
> +  - $ref: /schemas/mmc/mmc-controller.yaml#
> +
> +properties:
> +  compatible:
> +    const: ti,omap2420-mmc
> +
> +  reg:
> +    maxItems: 1
> +
> +  interrupts:
> +    maxItems: 1
> +
> +  ti,hwmods:
> +    description: |
> +      Name of the hwmod associated to the MMC controller. Must be
> +      "msdi<n>" where n is the controller instance starting from 1.
> +    $ref: /schemas/types.yaml#/definitions/string
> +    pattern: "^msdi([1-9]|[1-9][0-9]+)$"
> +
> +  dmas:
> +    maxItems: 2
> +
> +  dma-names:
> +    items:
> +      - const: tx
> +      - const: rx
> +
> +required:
> +  - compatible
> +  - reg
> +  - interrupts
> +
> +unevaluatedProperties: false
> +
> +examples:
> +  - |
> +    mmc@4809c000 {
> +        compatible =3D "ti,omap2420-mmc";
> +        ti,hwmods =3D "msdi1";
> +        reg =3D <0x4809c000 0x80>;
> +        interrupts =3D <83>;
> +        dmas =3D <&sdma 61 &sdma 62>;
> +        dma-names =3D "tx", "rx";
> +    };
> diff --git a/Documentation/devicetree/bindings/mmc/ti-omap.txt b/Document=
ation/devicetree/bindings/mmc/ti-omap.txt
> deleted file mode 100644
> index 02fd31cf361d..000000000000
> --- a/Documentation/devicetree/bindings/mmc/ti-omap.txt
> +++ /dev/null
> @@ -1,26 +0,0 @@
> -* TI MMC host controller for OMAP1 and 2420
> -
> -The MMC Host Controller on TI OMAP1 and 2420 family provides
> -an interface for MMC, SD, and SDIO types of memory cards.
> -
> -This file documents differences between the core properties described
> -by mmc.txt and the properties used by the omap mmc driver.
> -
> -Note that this driver will not work with omap2430 or later omaps,
> -please see the omap hsmmc driver for the current omaps.
> -
> -Required properties:
> -- compatible: Must be "ti,omap2420-mmc", for OMAP2420 controllers
> -- ti,hwmods: For 2420, must be "msdi<n>", where n is controller
> -  instance starting 1
> -
> -Examples:
> -
> -       msdi1: mmc@4809c000 {
> -               compatible =3D "ti,omap2420-mmc";
> -               ti,hwmods =3D "msdi1";
> -               reg =3D <0x4809c000 0x80>;
> -               interrupts =3D <83>;
> -               dmas =3D <&sdma 61 &sdma 62>;
> -               dma-names =3D "tx", "rx";
> -       };
> --
> 2.43.0
>
