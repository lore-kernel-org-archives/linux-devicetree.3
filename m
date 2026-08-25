Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9AE0D3A7D9E
	for <devicetree@vger.kernel.org>; Tue, 25 Aug 2026 10:26:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787653573; cv=none; b=YqNNvJ+0FeZl/0U8AaWpyc5ZhE3vOpvz00rLenq3PBlF7NfGu4BWqCxeRHRGULoH/6WtS7uwazdc7jRYQngkXDc9fwumABx/pXTMoALsb9d79zG/h4SkKHEv/8useMDnvbu4z2G1XuJxQJKr/IpgGGKOFO9q9JzXtrHE+tXsrDA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787653573; c=relaxed/simple;
	bh=TLrQLyBDeu4TkDgR6U9H4djC+5ODg9AsqEk1jHD+P0U=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=WaQN1pRx0SClsEDfarnXsmtoBgDlAS9J4xKS6YABniM/kIn+CJwiZ2V0QgwRH9LqFh8b3JbeuK26Ez3EC2Tp8aphhWhn8JvtaOPsm93OgwALNVmqJ+9Lt+fxaCgFEwA6MKoPRnIdPo61rUDv+Od09Bcp/HR46PQAv6eIa6AChWI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=hYEWoHj+; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=SqiBPAhj; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="hYEWoHj+";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="SqiBPAhj"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67P88EA21934816
	for <devicetree@vger.kernel.org>; Tue, 25 Aug 2026 10:26:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	D/ZR76hAg5CdAPyxOMWCuXF5opoWr7PX3dhjQ6uK8GY=; b=hYEWoHj+n50AKkXG
	y5cbuW/H2tRnvpWlGI3eU7rs3depvU5fxD6tDh/3rV7rmzL94EcjtnqnzgzKga2/
	evInrZvou+7KmZYT7V65j6cjag/Bebkr7UDGnk9BwA57QgwU5yCdJutEeEaW3r+V
	XqDr7qgs14mCJgMDj7Njvxq07UqoqNI4K6GVyGATZFJvF4R6E+qrHCAHT7mzYyw6
	thLk1l+apj5TSSTsz8/1/i5OiSYnsKEw2lRMDoUkM5K6Fqw0ZMQdcSuIBKhRq2fq
	81yhdH3YI1dgVOIYPOsoxF/GpuSJnPwrsAIRPcoh9AHND3FbbDvW+yGvq1uD4EyC
	kq12WA==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g92jqsp4d-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 25 Aug 2026 10:26:11 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-52b4e315000so16808311cf.1
        for <devicetree@vger.kernel.org>; Tue, 25 Aug 2026 03:26:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1787653570; x=1788258370; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=D/ZR76hAg5CdAPyxOMWCuXF5opoWr7PX3dhjQ6uK8GY=;
        b=SqiBPAhj3h44VAfTEUwvsEVojOnATeDWMj0KJiuzmN7NbEUih4AnVhqaGapRAN6TfP
         9CkYVLWh6DeV4VPJqwSDSrQIjdWYNJmxcvs0Rel2xbfVJTGkkm/lYFZCEw9wvA/O4d9Z
         BfVvBNEcpNWWK2siPbF/ncgxgq7Uu3M1s4k3YgQaU17j4ZOmm58+2heTWb497udAHS91
         yQdbfFRJ6oJMjMuMBKj9iwBUsTaC/Hz7RJ5nAzCXCOB2WItYYEULIV9IpWtQcPJ0Qw0x
         l0pfVxtOZSiN4tUU8sNfjYJl8OSVZQzREk3rNn6+ze0Jg9DSdTbpFIv3iyHC2dZ4/f0K
         Lh3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787653570; x=1788258370;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=D/ZR76hAg5CdAPyxOMWCuXF5opoWr7PX3dhjQ6uK8GY=;
        b=YMSVZqpH7NBtTMR4Qz1KSa759k6DqCfttokIt9rqakWdMfYR1A2EkxRg95hCsoXBka
         Yy5zQfhNoC1mmEDoYlyD6N4cal3OcO0I5fYXoJ8lV9ENO+hbep9Skl/GOirPOxB9ATa9
         FK/5pwd9p/WFEU4pEiTPH5B+IZXePllYZAIlKudRO+UM2FigDdoY6e0db16qJYm1+G1S
         oTnyR6DBr+MzqdXbwhZADMY5fkY91k9mAF2v8fyyQQt+AnVsXDBCKh5JhRfjqEb1Gfxa
         EtzZ/H6zgqilSyOJJTG/5o1BF08l8esNHXIpYV171DVRvPS/E+MVTL2WEx563rsScN4y
         q0Ug==
X-Gm-Message-State: AFuF++lMXQpE2OsxM85ztuJcGdmNGqmMeIRLIsmDak58yDb4yVWZx12V
	TE9LmWlZT4Lu88t/ZOUNfLRQbn+dkk4qUz1IM0MMUnfKQvN6i/S+e1ShNIKES8+iqyGzph+FyBc
	rlirANS+M0Qcj/ddoO5PLT3H2Z3R5V/7YAtxx9zBJROP5z2ZAkkcbYfGvWjU7MXP7
X-Gm-Gg: AR+sD11UFdDZHRXYrX1rwvRG2WoY8CCiykaar7kbe3POTiwlIpY5OPnoft98wWX3DOW
	TsCb6cZRoMEtutoL3D/fnwt9Ztc/EBG/0EgrdE7kIpKwM6e9/r94gGuiQ6gCZVaOqDqCFEKd6ra
	Nf8KrCwf4X9BlT7NZvVBQJARsANbh50ZC1iqRzRfsWwO6ARpybPp1jCvqoCqLQG4562qa+LP8jp
	FztvB4dweY5rkrVs+XpaF8MliDEfCKlHZnwT/jdlZbPHis2PeB+e/hzZnIokykernvnlvCfsH2d
	NxI/wV3rZE/JaiYqjVZ+7kavQOts3gugtB9eAmA8H4c4fYLNQCUUax9xc2w49Q+TzNR1Sfnq4Kk
	Ft2Y1swVZ2qfMjsBVVv9whZZm
X-Received: by 2002:a05:622a:1650:b0:51c:2324:666 with SMTP id d75a77b69052e-52e30eb4f3cmr36567801cf.3.1787653570615;
        Tue, 25 Aug 2026 03:26:10 -0700 (PDT)
X-Received: by 2002:a05:622a:1650:b0:51c:2324:666 with SMTP id d75a77b69052e-52e30eb4f3cmr36567631cf.3.1787653570213;
        Tue, 25 Aug 2026 03:26:10 -0700 (PDT)
Received: from [192.168.120.193] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c24966f99basm1623442566b.37.2026.08.25.03.26.08
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 25 Aug 2026 03:26:09 -0700 (PDT)
Message-ID: <a518f6c8-7880-4854-8dc3-ac90f0eb93c3@oss.qualcomm.com>
Date: Tue, 25 Aug 2026 12:26:07 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 4/4] arm64: dts: qcom: Add Retroid Pocket Nova
To: webgeek1234@gmail.com, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org
References: <20260820-rp-qcs8550-v2-0-d4ce78fe9385@gmail.com>
 <20260820-rp-qcs8550-v2-4-d4ce78fe9385@gmail.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260820-rp-qcs8550-v2-4-d4ce78fe9385@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: bV14whZh84mLzc_NGG-2Q6isQyEnTqj-
X-Proofpoint-ORIG-GUID: bV14whZh84mLzc_NGG-2Q6isQyEnTqj-
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODI1MDA4NyBTYWx0ZWRfX+LuAdv0+gQmj
 yti4mg85O8MqSUd+O9OYiGQvHclwWa/6GXPxO5Mr/8yPmGg8YpypswCfJ+CTYQ5Q3eznAL3lULS
 fczzTaFYIZlKSQiKPG0ivF0JyaQTG0mu5c4XF5ikAimVv6YMA06+lX4JnRq3PWVsuoqN38fIpmI
 JXXkuOzC0ovy2uyRm/SpaSHZLiGaZT8AjMiXzgdz6So1eX0YjNuk6Io6vkfa/XlBWyRsqE7P+GG
 hVXmlQZkPwXvVkcgIpy7Nr4Y0fjFi6DZS1iFBMcoNYDd9BOnaVftbKGYiSnNoG62Hsa1ySbKtM/
 QytCrTLOGZEp+5EnP71tLb/FPMMSXylkX19Gs4+lT6J1BJsuBbaaJI+xhaWQrEJdSROvo3RvFen
 TY+yu6nDU0TlmRe7oIiumuaUv6AJvTUODgdRTm0K0uLk/qyXGotqR50l4omzfAbrR59BJewpAND
 tFztStVwLV2/lrXRjEg==
X-Authority-Analysis: v=2.4 cv=JJULdcKb c=1 sm=1 tr=0 ts=6a8d6dc3 cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=pGLkceISAAAA:8 a=M23K-3MuEBAvA7N4Jn0A:9 a=QEXdDO2ut3YA:10
 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwODI1MDA4NyBTYWx0ZWRfX6wqNIP8w7Fls
 utMmJWlrOKXBudXU46xM/VUYsa3ChNmEQXB/K1k9U2Txgr411rNjePfyHP4lPvFxjORkJom16Jp
 VZMTh+zo2Om2w9N4LpXgmA2M8Zr+BEQ=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-25_02,2026-08-24_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 phishscore=0 lowpriorityscore=0 clxscore=1015 spamscore=0
 suspectscore=0 impostorscore=0 malwarescore=0 priorityscore=1501 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608250087

On 8/21/26 5:30 AM, Aaron Kling via B4 Relay wrote:
> From: Aaron Kling <webgeek1234@gmail.com>
> 
> The Retroid Pocket Nova is a high-performance Android-based handheld
> gaming console powered by the Qualcomm Snapdragon 8 Gen 2 processor
> featuring a 4.5-inch 4:3 AMOLED touchscreen.
> 
> Signed-off-by: Aaron Kling <webgeek1234@gmail.com>
> ---
>  arch/arm64/boot/dts/qcom/Makefile                  |   1 +
>  .../boot/dts/qcom/qcs8550-retroidpocket-nova.dts   | 118 +++++++++++++++++++++
>  2 files changed, 119 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/Makefile b/arch/arm64/boot/dts/qcom/Makefile
> index 09b3c5b2d9dab..582805e89f4cb 100644
> --- a/arch/arm64/boot/dts/qcom/Makefile
> +++ b/arch/arm64/boot/dts/qcom/Makefile
> @@ -196,6 +196,7 @@ dtb-$(CONFIG_ARCH_QCOM)	+= qcs8550-aim300-aiot.dtb
>  dtb-$(CONFIG_ARCH_QCOM)	+= qcs8550-ayntec-odin2mini.dtb
>  dtb-$(CONFIG_ARCH_QCOM)	+= qcs8550-ayntec-odin2portal.dtb
>  dtb-$(CONFIG_ARCH_QCOM)	+= qcs8550-ayntec-thor.dtb
> +dtb-$(CONFIG_ARCH_QCOM)	+= qcs8550-retroidpocket-nova.dtb
>  dtb-$(CONFIG_ARCH_QCOM)	+= qcs8550-retroidpocket-rp6.dtb
>  dtb-$(CONFIG_ARCH_QCOM)	+= qcs8550-rb5gen2.dtb
>  dtb-$(CONFIG_ARCH_QCOM)	+= qcs9100-ride.dtb
> diff --git a/arch/arm64/boot/dts/qcom/qcs8550-retroidpocket-nova.dts b/arch/arm64/boot/dts/qcom/qcs8550-retroidpocket-nova.dts
> new file mode 100644
> index 0000000000000..2422be63f0f13
> --- /dev/null
> +++ b/arch/arm64/boot/dts/qcom/qcs8550-retroidpocket-nova.dts
> @@ -0,0 +1,118 @@
> +// SPDX-License-Identifier: BSD-3-Clause
> +
> +/dts-v1/;
> +
> +#include <dt-bindings/gpio/gpio.h>
> +#include <dt-bindings/interrupt-controller/irq.h>
> +#include "qcs8550-ayntec-common.dtsi"
> +
> +&{/} {
> +	model = "Retroid Pocket Nova";
> +	compatible = "retroidpocket,nova", "qcom,qcs8550", "qcom,sm8550";

Do these actually have any common lineage with the AYNTEC devices, the
common DT for which you include above?

Konrad
