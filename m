Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3D74A3947B5
	for <devicetree@vger.kernel.org>; Wed, 13 May 2026 12:04:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778673850; cv=none; b=mRqi8kWiO6RyGkWTfCibAAuNiG8zFaJmIYnN3jj5fzp8RaRiaU6vstepEEWZ4TJJzAVe5mhPk6KwuWBjRLsenR6nlv2kh5rH9RGvGs02K40ZjVbyTpM5vvhBdVY+TGtTdofFyu5IlLyJwgaAmFYXe2zJf1V8sXSr7cKmuxG3tqI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778673850; c=relaxed/simple;
	bh=fgxSvC/I0Ea/NY5kmuQWxC8qbNmf2ilb3RccH3mP4uc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=O6FOh8D/HhSeBWpFHJfawwZjJYuFmYWefZpwB+JicaBvwm2PoUTgNMWZuAPqQDqwYHfvhTeTVwPQrKUz607bzwK7o38J89ZYqHRKS1XSfwZ3YHFK2Arl3XSQoV+B/hmN5RHyBlyBcPRzcsbRjlSvMxt4uO6As6uyrgYSJK5iHxc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ER2fh0uC; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=VJU5JRao; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ER2fh0uC";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="VJU5JRao"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64D8mERI3474773
	for <devicetree@vger.kernel.org>; Wed, 13 May 2026 12:04:08 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=OV9Khvfl40DlHcmGDuk2UkcX
	+giPUcBv3DS5kP7UOsE=; b=ER2fh0uC67lfhAc7TZFl8mYdYi8OjdDillN91uXr
	JnMCSGaHxIHKpxsm+pYYg90tzH8iqDPH+0ckJbL5rkac3+k1JdYQXnsollO/K+fH
	emchE2H3mdEoYqI32YgOqL1D72M8ZSXjaNRabk93PoRZJvXqAQl6tSyniKOFTWnN
	KOkrKXEb7vAbqsVnC9rjdK+tOxAjILkP646VcA9AJMpQ6E+ZsPgKx5WaxmIcqUAa
	YAraIfUkohT5BB7qhZZqwD7/Y80ofZTiYwK8zMahzVNXzRXwhJ2FrtgYjqGOk4FI
	QVH+ZNMJu4N0eVzOW8f+kMx1Uiii9MM6JI1qCBohjjOlyQ==
Received: from mail-ua1-f72.google.com (mail-ua1-f72.google.com [209.85.222.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e4p418q7e-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 13 May 2026 12:04:08 +0000 (GMT)
Received: by mail-ua1-f72.google.com with SMTP id a1e0cc1a2514c-95cc77982c5so9574508241.1
        for <devicetree@vger.kernel.org>; Wed, 13 May 2026 05:04:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778673847; x=1779278647; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=OV9Khvfl40DlHcmGDuk2UkcX+giPUcBv3DS5kP7UOsE=;
        b=VJU5JRaoG3g4A8m5CWDt75yeD4vw/xcaLGxTkXu+Ylua54umfIHwgHkd7MPsxupCvQ
         u1ScjH9rix5Y6FlwF4HF8uiMGhyfPsR4lruA6FXvyK9gLt5MXT5xtz6Y7AL1dxXatSXq
         19APZL0OZgzcE41Ef/1Jd4Qc1D56GkFlfvBkFIGbxQ6Wn5lC4wmmS1PGhUp16Cv2DQsr
         KA7LPh1j578BjzGfimQxFcrPOFUEhkH345oIg72KNHmk4T7e797qE5YM87OI3z1Q4hoX
         hnD6d0pG5apX/a4LUQDyyndeOlBOKZu3cwjgpYjNnzpAFZGFqhQaSA+zUlYgBQs+r0zD
         8bgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778673847; x=1779278647;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=OV9Khvfl40DlHcmGDuk2UkcX+giPUcBv3DS5kP7UOsE=;
        b=Wy8JOxr6ubh7b2k/tQDd7ZnnE/4eyOLW1zxEHk3mqbfJwdxlrw1ZOU2045wvXbkOAn
         TI+G57ggpFRxpWKbBGsfdyCcyw/gJtKQ27/Twv7LdpXqDsH4mPAEUk52+b5Z9zuWgXQN
         hUPHZuz1gaN2K8g+DTnWyc/3jWnaCbbEsdQfNzfryzD4TWs5x2maAV4ItqesubZf8J8t
         q5Q7+QRxBKeBISlZcBHfSO6uVYEZ6lWthHmK2EcGQVQ5/X3yMhWQZePVkbKRzwaCOQBd
         GAYrRFd6Lg9xh43U0yCEvkAk2Yw5rj6BpPIYuHgujbNBgp7XaKnWtN2Zp3Zm5egzXnkR
         K6gg==
X-Forwarded-Encrypted: i=1; AFNElJ/h6eWEXHusqni1jKzvITrT/KcYT4fMHG8o9K3IHdXVmndtMaNvE4MK3uBoOuedagSCZ+FTz5N24fh5@vger.kernel.org
X-Gm-Message-State: AOJu0Yzw4mmcNTxLXKlNm3q4IpDKxXsCiTZ1kJ0mAXWOz2ZycAaghkfl
	BeV6WEXOokwxxOkk8mirsJ28XUf5erDJZeSOaRl+UU4YONhUmjj5Wo9xKPp9fa3WCPMPG9VdUOW
	JuvObJaVA2UE+pFLa5wr9/M70IIF5NJN62F7uKv2o9vOabxtl3I14sUUYcn/05Rlq
X-Gm-Gg: Acq92OG6U79Y8QPe8StjWs5rPmJsoYj4C7/ZDFAQKzt5OQmYj3XOqj1hsSJrLp4i0pj
	r2pbAVevTnR4ha7bsFo4gK68++QdCOlG7i6MwSBzZuEnnlTXtyUiUdSHVZPaQzj/jYl10F2hocP
	3UmPk3BJmKtG+hH8ev6+7lmIShtZcERG8lu6W0VWY8rbA11PRHsef0mv/pATfKdGd144FTRKdCi
	4AUjwfIpc8otHzi/TG/CUpHxHkVsrIItfunbLKgFIEIPJVFFeEg2NyiMTq4uMtY/vsa3V9j4KgL
	s+FNCNxJKzfao8z3mVJJXQkRGrqQHHKweEeMEEYGC/ki6BkikCmQFuA/tfgRf+feEZttk2TgEOs
	xmB5RWnCuHusV2qvAr8CO+sDzlo8V2WDx9etMWXit6LvORDpH8V8P6TzeKSPAQWhSQGLT5O1p8Z
	f+hwU2F1Z/z8OCff4eXx2geqLIls40gRwkNaM=
X-Received: by 2002:a05:6102:32ce:b0:631:4ad7:b367 with SMTP id ada2fe7eead31-635d24dc6f3mr3453041137.20.1778673847550;
        Wed, 13 May 2026 05:04:07 -0700 (PDT)
X-Received: by 2002:a05:6102:32ce:b0:631:4ad7:b367 with SMTP id ada2fe7eead31-635d24dc6f3mr3452972137.20.1778673846939;
        Wed, 13 May 2026 05:04:06 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-393f60db67esm40073641fa.24.2026.05.13.05.04.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 13 May 2026 05:04:05 -0700 (PDT)
Date: Wed, 13 May 2026 15:04:04 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Komal Bajaj <komal.bajaj@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Vinod Koul <vkoul@kernel.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Wesley Cheng <quic_wcheng@quicinc.com>, Ulf Hansson <ulfh@kernel.org>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-phy@lists.infradead.org,
        linux-mmc@vger.kernel.org, Imran Shaik <imran.shaik@oss.qualcomm.com>,
        Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>,
        Monish Chunara <quic_mchunara@quicinc.com>,
        Rakesh Kota <rakesh.kota@oss.qualcomm.com>,
        Raviteja Laggyshetty <raviteja.laggyshetty@oss.qualcomm.com>,
        Sneh Mankad <sneh.mankad@oss.qualcomm.com>,
        Vishnu Santhosh <vishnu.santhosh@oss.qualcomm.com>,
        Xueyao An <xueyao.an@oss.qualcomm.com>
Subject: Re: [PATCH 4/4] arm64: dts: qcom: Add Shikra CQM and CQS EVK boards
Message-ID: <mw2ipu5z26ubmrg6qe2v36cp6ktkqtbpfe3hmr434qdgm66nz4@pu6yy7hw4n3t>
References: <20260512-shikra-dt-v1-0-716438330dd0@oss.qualcomm.com>
 <20260512-shikra-dt-v1-4-716438330dd0@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260512-shikra-dt-v1-4-716438330dd0@oss.qualcomm.com>
X-Authority-Analysis: v=2.4 cv=df+wG3Xe c=1 sm=1 tr=0 ts=6a0468b8 cx=c_pps
 a=ULNsgckmlI/WJG3HAyAuOQ==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22 a=EUspDBNiAAAA:8
 a=COk6AnOGAAAA:8 a=YDnyACv__Rn18NothnkA:9 a=CjuIK1q_8ugA:10
 a=1WsBpfsz9X-RYQiigVTh:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTEzMDEyNSBTYWx0ZWRfXxWlX2DLMKqb1
 uRkRNJRnED8sZIvrBuRlC8hP38wIj8gAgmlmT3+QeSzBKlUi+HhtJzomf7RGjEQliqCtlgerRXT
 zjIzvAMDhxxlENla3ole2C9nN1qkYKj2DvbNl6JwWrSHoSx5/B07hr64pPK+nPpq5F3JbqBdQv5
 c719pEwlZX12dVZUiWJGYsLhvS/TqqqBK+9XGDsrIADof7Of0v/PpunGI3ka1Y9S/IDAi168U6x
 Yqj0VYeWRismdu5OpDwEe9PhnOROUBryRYZJjPFm5AJjTE2dlLPdfENIC5zb9kAwMOQm2OFlpft
 gZ5/y6zFcNkNhU5LS8EMSzmcTi/PxnZuvMGFVmZQI+SX5hCxJHvmd37iK4m4UjEoH/GfGEhPl+3
 OR+Rg4it+pf+SMG83SVastRl+/U2KoS4JU5V4sRT3XNWMty6IcznFcYGAwTSh5RiLPt3emCYMbP
 AqWwdlABVo8vwjlYWsA==
X-Proofpoint-GUID: sa_SEhPTLPWxXBCCwKbdwTvw6aSPCG7y
X-Proofpoint-ORIG-GUID: sa_SEhPTLPWxXBCCwKbdwTvw6aSPCG7y
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-13_01,2026-05-08_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 malwarescore=0 priorityscore=1501 suspectscore=0 clxscore=1015
 impostorscore=0 phishscore=0 spamscore=0 lowpriorityscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605050000 definitions=main-2605130125

On Tue, May 12, 2026 at 09:38:07AM +0530, Komal Bajaj wrote:
> Add device trees for the Shikra EVK platform, which combines the CQM
> SoM variant with a common carrier board.
> 
> Two EVK boards are introduced:
>   - shikra-cqm-evk.dts: pairs with CQM SoM (retail, with modem)
>   - shikra-cqs-evk.dts: pairs with CQM SoM (retail, board has no modem

CQS

>     support)
> 
> Also add shikra-evk.dtsi common across both EVK boards.

What is the split between shikra-cq[ms]-evk.dts and shikra-evk.dtsi?

> 
> Each board DTS enables USB (peripheral mode) with the appropriate PMIC
> regulator supplies for the QUSB2 and QMP PHYs, and eMMC with the
> correct vmmc/vqmmc supplies for the CQM SoM's PMIC.
> 
> Co-developed-by: Imran Shaik <imran.shaik@oss.qualcomm.com>
> Signed-off-by: Imran Shaik <imran.shaik@oss.qualcomm.com>
> Co-developed-by: Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>
> Signed-off-by: Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>
> Co-developed-by: Monish Chunara <quic_mchunara@quicinc.com>
> Signed-off-by: Monish Chunara <quic_mchunara@quicinc.com>
> Co-developed-by: Rakesh Kota <rakesh.kota@oss.qualcomm.com>
> Signed-off-by: Rakesh Kota <rakesh.kota@oss.qualcomm.com>
> Co-developed-by: Raviteja Laggyshetty <raviteja.laggyshetty@oss.qualcomm.com>
> Signed-off-by: Raviteja Laggyshetty <raviteja.laggyshetty@oss.qualcomm.com>
> Co-developed-by: Sneh Mankad <sneh.mankad@oss.qualcomm.com>
> Signed-off-by: Sneh Mankad <sneh.mankad@oss.qualcomm.com>
> Co-developed-by: Vishnu Santhosh <vishnu.santhosh@oss.qualcomm.com>
> Signed-off-by: Vishnu Santhosh <vishnu.santhosh@oss.qualcomm.com>
> Co-developed-by: Xueyao An <xueyao.an@oss.qualcomm.com>
> Signed-off-by: Xueyao An <xueyao.an@oss.qualcomm.com>
> Signed-off-by: Komal Bajaj <komal.bajaj@oss.qualcomm.com>
> ---
>  arch/arm64/boot/dts/qcom/Makefile           |  2 +
>  arch/arm64/boot/dts/qcom/shikra-cqm-evk.dts | 61 +++++++++++++++++++++++++++++
>  arch/arm64/boot/dts/qcom/shikra-cqs-evk.dts | 61 +++++++++++++++++++++++++++++
>  arch/arm64/boot/dts/qcom/shikra-evk.dtsi    | 13 ++++++
>  4 files changed, 137 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/Makefile b/arch/arm64/boot/dts/qcom/Makefile
> index cc42829f92eb..6de783bcd133 100644
> --- a/arch/arm64/boot/dts/qcom/Makefile
> +++ b/arch/arm64/boot/dts/qcom/Makefile
> @@ -328,6 +328,8 @@ dtb-$(CONFIG_ARCH_QCOM)	+= sdm850-huawei-matebook-e-2019.dtb
>  dtb-$(CONFIG_ARCH_QCOM)	+= sdm850-lenovo-yoga-c630.dtb
>  dtb-$(CONFIG_ARCH_QCOM)	+= sdm850-samsung-w737.dtb
>  dtb-$(CONFIG_ARCH_QCOM)	+= sdx75-idp.dtb
> +dtb-$(CONFIG_ARCH_QCOM)	+= shikra-cqm-evk.dtb
> +dtb-$(CONFIG_ARCH_QCOM)	+= shikra-cqs-evk.dtb
>  dtb-$(CONFIG_ARCH_QCOM)	+= sm4250-oneplus-billie2.dtb
>  dtb-$(CONFIG_ARCH_QCOM)	+= sm4450-qrd.dtb
>  dtb-$(CONFIG_ARCH_QCOM)	+= sm6115-fxtec-pro1x.dtb
> diff --git a/arch/arm64/boot/dts/qcom/shikra-cqm-evk.dts b/arch/arm64/boot/dts/qcom/shikra-cqm-evk.dts
> new file mode 100644
> index 000000000000..12eeca84832c
> --- /dev/null
> +++ b/arch/arm64/boot/dts/qcom/shikra-cqm-evk.dts
> @@ -0,0 +1,61 @@
> +// SPDX-License-Identifier: BSD-3-Clause
> +/*
> + * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
> + */
> +
> +/dts-v1/;
> +
> +#include "shikra-cqm-som.dtsi"
> +#include "shikra-evk.dtsi"
> +
> +/ {
> +	model = "Qualcomm Technologies, Inc. Shikra CQM EVK";
> +	compatible = "qcom,shikra-cqm-evk", "qcom,shikra-cqm-som", "qcom,shikra";
> +	chassis-type = "embedded";
> +
> +	aliases {
> +		mmc0 = &sdhc_1;
> +		serial0 = &uart0;
> +	};
> +
> +	chosen {
> +		stdout-path = "serial0:115200n8";
> +	};
> +};
> +
> +&sdhc_1 {
> +	vmmc-supply = <&pm4125_l20>;
> +	vqmmc-supply = <&pm4125_l14>;
> +
> +	pinctrl-0 = <&sdc1_state_on>;
> +	pinctrl-1 = <&sdc1_state_off>;
> +	pinctrl-names = "default", "sleep";
> +
> +	non-removable;
> +	supports-cqe;
> +	no-sdio;
> +	no-sd;
> +
> +	status = "okay";
> +};
> +
> +&usb_1 {
> +	dr_mode = "peripheral";
> +
> +	status = "okay";
> +};
> +
> +&usb_1_hsphy {
> +	vdd-supply = <&pm4125_l12>;
> +	vdda-pll-supply = <&pm4125_l13>;
> +	vdda-phy-dpdm-supply = <&pm4125_l21>;
> +
> +	status = "okay";
> +};
> +
> +&usb_qmpphy {
> +	vdda-phy-supply = <&pm4125_l8>;
> +	vdda-pll-supply = <&pm4125_l13>;
> +
> +	status = "okay";
> +};
> diff --git a/arch/arm64/boot/dts/qcom/shikra-cqs-evk.dts b/arch/arm64/boot/dts/qcom/shikra-cqs-evk.dts
> new file mode 100644
> index 000000000000..bc93282f64cf
> --- /dev/null
> +++ b/arch/arm64/boot/dts/qcom/shikra-cqs-evk.dts
> @@ -0,0 +1,61 @@
> +// SPDX-License-Identifier: BSD-3-Clause
> +/*
> + * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
> + */
> +
> +/dts-v1/;
> +
> +#include "shikra-cqm-som.dtsi"
> +#include "shikra-evk.dtsi"
> +
> +/ {
> +	model = "Qualcomm Technologies, Inc. Shikra CQS EVK";
> +	compatible = "qcom,shikra-cqs-evk", "qcom,shikra-cqm-som", "qcom,shikra";
> +	chassis-type = "embedded";
> +
> +	aliases {
> +		mmc0 = &sdhc_1;
> +		serial0 = &uart0;
> +	};
> +
> +	chosen {
> +		stdout-path = "serial0:115200n8";
> +	};
> +};
> +
> +&sdhc_1 {
> +	vmmc-supply = <&pm4125_l20>;
> +	vqmmc-supply = <&pm4125_l14>;
> +
> +	pinctrl-0 = <&sdc1_state_on>;
> +	pinctrl-1 = <&sdc1_state_off>;
> +	pinctrl-names = "default", "sleep";
> +
> +	non-removable;
> +	supports-cqe;
> +	no-sdio;
> +	no-sd;
> +
> +	status = "okay";
> +};
> +
> +&usb_1 {
> +	dr_mode = "peripheral";
> +
> +	status = "okay";
> +};
> +
> +&usb_1_hsphy {
> +	vdd-supply = <&pm4125_l12>;
> +	vdda-pll-supply = <&pm4125_l13>;
> +	vdda-phy-dpdm-supply = <&pm4125_l21>;
> +
> +	status = "okay";
> +};
> +
> +&usb_qmpphy {
> +	vdda-phy-supply = <&pm4125_l8>;
> +	vdda-pll-supply = <&pm4125_l13>;
> +
> +	status = "okay";
> +};
> diff --git a/arch/arm64/boot/dts/qcom/shikra-evk.dtsi b/arch/arm64/boot/dts/qcom/shikra-evk.dtsi
> new file mode 100644
> index 000000000000..fae8c75b68b3
> --- /dev/null
> +++ b/arch/arm64/boot/dts/qcom/shikra-evk.dtsi
> @@ -0,0 +1,13 @@
> +// SPDX-License-Identifier: BSD-3-Clause
> +/*
> + * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
> + */
> +
> +&qupv3_0 {
> +	firmware-name = "qcom/shikra/qupv3fw.elf";
> +	status = "okay";
> +};
> +
> +&uart0 {
> +	status = "okay";
> +};
> 
> -- 
> 2.34.1
> 

-- 
With best wishes
Dmitry
