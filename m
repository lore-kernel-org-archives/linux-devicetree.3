Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CA78D332EC8
	for <devicetree@vger.kernel.org>; Tue, 16 Jun 2026 12:30:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781613049; cv=none; b=UFK6X37P+2OaRdxHZlDqbpuTfITjreXQTcBo3rOdrknQxkrTeD3n3M1W1sfym6cQVgWNlgXvJiD4AjbiLqpUrBaXZuvhXtISSSUbMZnYFCXWRKlTkQh4Q301C+r3SFIe+HSGUJjbRAu7jjBzNHDlyfdf47uOCdjEfDUvEkwaKqw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781613049; c=relaxed/simple;
	bh=4C4mx4yhK/9O8g9uOz1/BcR20UST1jOXccEF0NCmjD8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=iLSFGZ+eQKXXjtOrtl89WDXbabznK1GUEkSRZagOlVxi97xdSr1CRF5I+b49CJdEdoABxxavPKi4wd+JqixKThtC7AuX2Nqi9PMUWGtpl0JidVaJZoe3X1WI5zp1a4+w+3XHMn9iy3+UCR471oSdSlykuw+NqlhOAnJcre1ua8k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=TmhlvSa1; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=EZriYYX1; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="TmhlvSa1";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="EZriYYX1"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65GACI7C3411127
	for <devicetree@vger.kernel.org>; Tue, 16 Jun 2026 12:30:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=f19SLqAgEJbQFZmj9Orm3CkK
	Ctys9ra3vEbJzX5dQTs=; b=TmhlvSa11GRSLpJhI8UDm3kB6awbqzfruwyUPsL6
	8SAj5G8ABY6cYxvSvFrY9Nf+duQc8TQDMu+ksIba/F91gnQrjZOSKM1AtyCvxoeJ
	VVkJpJZL5WBM9/qN8pBF61qKgoVorsHYKMPX8afFTUQqSSYI3u+JRQf7Yfd/mKTF
	PsGZXx+3TsDGGYHOSPG/Ndhl8rV7aFF9LyOaR6yvWJRce82qgidl2Dz44qAS5Dzr
	4sQ773OGoh03kCz3TTSskyzGqdyx92gmEPDzkc68m2v/ocSs3e9esI7GuMBwDW92
	tfF4PI5qps/RuXC2NOQ4zkfvDeyNs/nxa59n7xjplB40jQ==
Received: from mail-pf1-f197.google.com (mail-pf1-f197.google.com [209.85.210.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4eu09g9r59-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 16 Jun 2026 12:30:46 +0000 (GMT)
Received: by mail-pf1-f197.google.com with SMTP id d2e1a72fcca58-8423f1fe39eso5330516b3a.1
        for <devicetree@vger.kernel.org>; Tue, 16 Jun 2026 05:30:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781613046; x=1782217846; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=f19SLqAgEJbQFZmj9Orm3CkKCtys9ra3vEbJzX5dQTs=;
        b=EZriYYX1BTx3nPjz9PWB6o8siQZbATUawy3or7UkW5fTC7rMxE8IzOnl7muqbSsQg2
         LfcXbNyTSNxnpy1vmtktQGjQI5IqpF3XrFc8b0oDV0V/BB4BI98HocUBiATTpmCZkv+y
         V34UCunXPjVQL/kP3xaSiREQmkExThkRfEecSZ1kVvLrBgBTRqLZm0ecrNimF1jnBMUL
         iiy/Oq6NemG6zrfsrJlNJUpriyXYUPUyNGe8aBpUe0VZH8eSfGqTLWa/jJKwJHPDcBts
         y1+3/2+nF+yvv4LnzCn9DCIJzAZ4zz91rqyd6XUJIhEeTrTCCaMlGs3uQCRgj+KP+RtX
         hUFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781613046; x=1782217846;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=f19SLqAgEJbQFZmj9Orm3CkKCtys9ra3vEbJzX5dQTs=;
        b=dHI/aKeEXWT/c/04PG3Xos9Ko4uWk8/LuRSzv5cvjK12FD+rRf9YoSV4DtAo1cfj/e
         mlnUdeVv8atGE3ecAKjy50dWPALf6SnZ1rCd5DUrX7YsZNeOkX7AWchRPgJzS3bGvsVI
         PJdxnOHB3HEkM2TFP89bs6rYE+KB5pTWXmfGCiqAzC8CC8hbXzhwENALEQFFBDoPuy2J
         htLPt7wxC1vVPNwFlelbI0dcJ8lYd3u3ZGeUNogLP9N3YQ+2ieQeg8Of82ZGJUvmXnO4
         htuOeTgBUSPHOaexJC7NWnolU103dBie5SIcW9n8ly2S7TpAsvT4FLAMNjnzaKxZfLxX
         Rz7A==
X-Forwarded-Encrypted: i=1; AFNElJ8swKQMkmm65DnoRNRKQJI2pccHUEDX2VyYS4NfhF1YvHXtf/qWT9qaKcwohxj2c5K+9KoRDHX+zeeR@vger.kernel.org
X-Gm-Message-State: AOJu0YyUMo6dgnCgOhfI+uT+6lypkiqMfMjLitG2vamaiDmNnfDJ4Z8B
	bQ7WLNRobiYVWbzOBgTKP+RqoNJNWUOy1/fxTEDvqaefZdkl4RBk5TmncVFB164O7Z4fj0fJGG2
	/fPflTA4/OlNaQIwwtyeVK/UfE3iHeKUwzcvuMdXjHELAtlBgZ9LKLt5oAm0CUo87
X-Gm-Gg: Acq92OG035W0jbXFeZvk3uq6dVCzi0loIKtk2K95ieDolCNzguXvsYziR73xJYWbP2j
	YBqnhYgxXzY400aRYdKm3ovoaxlCBCwncJO2yUYTnOi8caJQAFDVa/pIGs9d2f7GIgiZ/Ueg/ET
	w+Gv1P1DF4HxTXh1e6gP+W1X5b2fCd4Mqr/cW0Jz1wRdHFTWXy00wdVxYITr5aIJc2lhD9V9dXr
	wHRaMIPjcsoZ6AgnXwvJo+4oeHhOCq+zYxkOg+G1lQwBOhdy/P9L9KJ6j4QUWYAJHLqUYxglC3C
	+mXFz5g00qm9A5R/QkceGsYwlBFbx1+jaes1SQFW/0C9mVlw1kj75c2ejGKtd/5y+O/K02IDRox
	6JCxWWA0M1/3yVOENNdfJ0T8Wl9SKAEHSsuVPlaWMp8AkhCW8oVxF/ArH
X-Received: by 2002:a05:6a00:3981:b0:82c:dfea:9e2a with SMTP id d2e1a72fcca58-845153db80bmr3338415b3a.2.1781613045628;
        Tue, 16 Jun 2026 05:30:45 -0700 (PDT)
X-Received: by 2002:a05:6a00:3981:b0:82c:dfea:9e2a with SMTP id d2e1a72fcca58-845153db80bmr3338356b3a.2.1781613044983;
        Tue, 16 Jun 2026 05:30:44 -0700 (PDT)
Received: from hu-mchunara-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8434b0112edsm11767563b3a.45.2026.06.16.05.30.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 16 Jun 2026 05:30:43 -0700 (PDT)
Date: Tue, 16 Jun 2026 18:00:36 +0530
From: Monish Chunara <monish.chunara@oss.qualcomm.com>
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>, andersson@kernel.org,
        konradybcio@kernel.org, robh@kernel.org, krzk+dt@kernel.org,
        conor+dt@kernel.org, mani@kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        sarthak.garg@oss.qualcomm.com, pradeep.pragallapati@oss.qualcomm.com,
        nitin.rawat@oss.qualcomm.com
Subject: Re: [PATCH 2/3] arm64: dts: qcom: monaco-evk: Enable SDHCI for SD
 Card via overlay
Message-ID: <ajFB7FVlqp3qCA0i@hu-mchunara-hyd.qualcomm.com>
References: <20260227105055.2364348-1-monish.chunara@oss.qualcomm.com>
 <20260227105055.2364348-3-monish.chunara@oss.qualcomm.com>
 <2ra2apfephjl2au6wel25gbxoxyvohf2ysq4yzaufp3xb7mtoi@g5p6asbk2fqe>
 <aaWdjuqvhpJb1oSX@hu-mchunara-hyd.qualcomm.com>
 <3aaf273a-c7da-4740-a68a-49f5d2f5309f@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <3aaf273a-c7da-4740-a68a-49f5d2f5309f@oss.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjE2MDEyNyBTYWx0ZWRfXyEA5SIlUQFvZ
 AamZ+VkFl1dArIqmuKr/b4fTq/fTx0wdKdH+gIpBVDhAN+s3kYSMFgL+95I6lj3MXNCT3ccA201
 Shadzc6dXCwnyQ2u0bsF5mx1GTZqVOZAtUlatcxId2u1Vu8HyCcg8SJLm8x73mFh5aiNlHac2MD
 jfjfNlRzeJqEvdywjZAQOLLCZk39AuM7RonTsVMfxmoFvBO8jLDLEW1+tVYsuQMp2XC31xx4U6o
 8CqQ6FMJr/R6akKwtFfIc10N3tMUnpkR8ga/L76WFBwEAI7d3ICjc1Os1R+1dD0+tyurqL2clqc
 BciHi5L3SpdrExyKZi4Z4WgrG61fYkvu6JZ0u8sB6lagq7IMDl5dA9gweMhhb8xwLP0VoLl7Stg
 QdBZknc7ACK6PP7NjUbd7fwnKCvOelR3Ulyepdc3FVtldV+7WrmYsTyZf6V84g/dTET3mWT+FGn
 EmHORuv4afJoZ7+ca3Q==
X-Proofpoint-ORIG-GUID: O8ZT14fBnYGDTXxEQFOpaumHmNaIxd-O
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjE2MDEyNyBTYWx0ZWRfX0eD0dI5FOuMA
 91zQrbflNFTnOdyt9R/XA8xBvj6eLf1f0WIgL+7+PWGEQeOw7GjP8umNxKIAm/h93w3VO0Aw6ZB
 QqnkPKUFz8b92CgtZgygiA4NPWzPzWw=
X-Authority-Analysis: v=2.4 cv=DLa/JSNb c=1 sm=1 tr=0 ts=6a3141f6 cx=c_pps
 a=rEQLjTOiSrHUhVqRoksmgQ==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=kj9zAlcOel0A:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=EUspDBNiAAAA:8 a=M70xRs4N6LTtd3t2Oi4A:9 a=CjuIK1q_8ugA:10
 a=2VI0MkxyNR6bbpdq8BZq:22
X-Proofpoint-GUID: O8ZT14fBnYGDTXxEQFOpaumHmNaIxd-O
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-16_03,2026-06-15_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 lowpriorityscore=0 clxscore=1015 spamscore=0 malwarescore=0
 priorityscore=1501 phishscore=0 suspectscore=0 bulkscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606040000 definitions=main-2606160127

On Mon, Mar 23, 2026 at 03:15:09PM +0100, Konrad Dybcio wrote:
> On 3/2/26 3:24 PM, Monish Chunara wrote:
> > On Fri, Feb 27, 2026 at 10:03:10PM +0200, Dmitry Baryshkov wrote:
> >> On Fri, Feb 27, 2026 at 04:20:54PM +0530, Monish Chunara wrote:
> >>> The monaco EVK board supports either eMMC or SD-card, but only one
> >>> can be active at a time.
> >>>
> >>> Enable the SD Host Controller Interface (SDHCI) on the monaco EVK board
> >>> to support SD Card for storage via a device tree overlay. This allows
> >>> eMMC support to be enabled through a separate overlay when required.
> >>>
> >>> Signed-off-by: Monish Chunara <monish.chunara@oss.qualcomm.com>
> >>> ---
> >>>  arch/arm64/boot/dts/qcom/Makefile             |  4 ++
> >>>  .../boot/dts/qcom/monaco-evk-sd-card.dtso     | 72 +++++++++++++++++++
> >>>  2 files changed, 76 insertions(+)
> >>>  create mode 100644 arch/arm64/boot/dts/qcom/monaco-evk-sd-card.dtso
> >>>
> >>> diff --git a/arch/arm64/boot/dts/qcom/Makefile b/arch/arm64/boot/dts/qcom/Makefile
> >>> index 317af937d038..c86242a1631d 100644
> >>> --- a/arch/arm64/boot/dts/qcom/Makefile
> >>> +++ b/arch/arm64/boot/dts/qcom/Makefile
> >>> @@ -46,6 +46,10 @@ lemans-evk-el2-dtbs := lemans-evk.dtb lemans-el2.dtbo
> >>>  dtb-$(CONFIG_ARCH_QCOM)	+= lemans-evk-el2.dtb
> >>>  dtb-$(CONFIG_ARCH_QCOM)	+= milos-fairphone-fp6.dtb
> >>>  dtb-$(CONFIG_ARCH_QCOM)	+= monaco-evk.dtb
> >>> +
> >>> +monaco-evk-sd-card-dtbs := monaco-evk.dtb monaco-evk-sd-card.dtbo
> >>> +dtb-$(CONFIG_ARCH_QCOM) += monaco-evk-sd-card.dtb
> >>> +
> >>>  dtb-$(CONFIG_ARCH_QCOM)	+= msm8216-samsung-fortuna3g.dtb
> >>>  dtb-$(CONFIG_ARCH_QCOM)	+= msm8916-acer-a1-724.dtb
> >>>  dtb-$(CONFIG_ARCH_QCOM)	+= msm8916-alcatel-idol347.dtb
> >>> diff --git a/arch/arm64/boot/dts/qcom/monaco-evk-sd-card.dtso b/arch/arm64/boot/dts/qcom/monaco-evk-sd-card.dtso
> >>> new file mode 100644
> >>> index 000000000000..a0bc5c47d40b
> >>> --- /dev/null
> >>> +++ b/arch/arm64/boot/dts/qcom/monaco-evk-sd-card.dtso
> >>> @@ -0,0 +1,72 @@
> >>> +// SPDX-License-Identifier: BSD-3-Clause
> >>> +/*
> >>> + * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
> >>> + */
> >>> +
> >>> +/dts-v1/;
> >>> +/plugin/;
> >>> +
> >>> +#include <dt-bindings/gpio/gpio.h>
> >>> +
> >>> +/ {
> >>> +        vmmc_sdc: regulator-dummy {
> >>
> >> No dummy regulators, please.
> > 
> > ACK, these will be renamed as per the schematic. Since these are direct supplies
> > on hardware, used fixed-regulator configuration.
> > 
> >>
> >>> +                compatible = "regulator-fixed";
> >>> +
> >>> +                regulator-name = "vmmc_sdc";
> >>> +                regulator-min-microvolt = <2950000>;
> >>> +                regulator-max-microvolt = <2950000>;
> >>> +        };
> >>> +
> >>> +        vreg_sdc: regulator-sdc {
> >>> +		compatible = "regulator-gpio";
> >>> +
> >>> +		regulator-name = "vreg_sdc";
> >>> +		regulator-type = "voltage";
> >>> +		regulator-min-microvolt = <1800000>;
> >>> +		regulator-max-microvolt = <2950000>;
> >>> +
> >>> +		gpios = <&expander1 7 GPIO_ACTIVE_HIGH>;
> >>> +		states = <1800000 1>, <2950000 0>;
> >>> +
> >>> +		startup-delay-us = <100>;
> >>> +        };
> >>> +};
> >>> +
> >>> +&sdhc_1 {
> >>> +	vmmc-supply = <&vmmc_sdc>;
> >>> +	vqmmc-supply = <&vreg_sdc>;
> >>> +
> >>> +	pinctrl-0 = <&sdc1_state_on>, <&sd_cd>;
> >>> +	pinctrl-1 = <&sdc1_state_off>, <&sd_cd>;
> >>> +	pinctrl-names = "default", "sleep";
> >>> +
> >>> +	cap-sd-highspeed;
> >>> +	no-1-8-v;
> >>> +
> >>> +	bus-width = <4>;
> >>> +	cd-gpios = <&tlmm 11 GPIO_ACTIVE_LOW>;
> >>> +	no-mmc;
> >>> +	no-sdio;
> >>> +
> >>> +	status = "okay";
> >>> +};
> >>> +
> >>> +&sdhc1_opp_table {
> >>
> >> Why? Is it specific to the device or to the chip? In the latter case,
> >> please define a separate table in the monaco.dtsi and switch to it here.
> >>
> > 
> > As per the previous review, it was suggested to use an existing table. But yes,
> > this is specific to the Host controller and the corresponding voltage corners on
> > the chip and can be defined as a separate entity for SD card use-case.
> 
> The SDC programming guide I have access to does not seem to have bene
> updated for any recent chips. Are you sure these different corners are
> *actually* valid? The clock-side documentation doesn't mention that
> 

There seems a gap in the clock documentation. This is being communicated to the
corresponding stakeholders. However, the corners mentioned are as per the
reference platform and will be updated in the subsequent series based on the
updates from the clock-plan PoC as required.

Regards,
Monish
