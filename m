Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6F7353D9DBB
	for <devicetree@vger.kernel.org>; Wed,  5 Aug 2026 06:08:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785910091; cv=none; b=YpXCpLByLney82+gJh3DDciFGoFim7wxar24nLEJYGWbqEkr+L2xj3gdIn6b7MU0hLL2XULhdcRypvcgaJtoAog0xA3OkDScs4Z3DRnSmb+5tjK+9i/PuOyahiiGJrSqv/ZKhwJtcACwpInK6e23WaBvNKhOr12bHbjw37hekgw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785910091; c=relaxed/simple;
	bh=LhcM+flR6UXEo+DLewcQXKPSp3BZ/ntPhX1vdgOmaLk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Ci0roHrha6p5g8j5djG1vZLLA8wQF/NFot9oITH6lUh+6SbeMYGm+qoBSoht6eo3XKz7gJ7CYwEBQJlXjluqzF1G0H11k5OBSW9v0TR7tHCR0aLx3Cenbn1E4DnUsZAXazMRj04e5Zkz7DTIBtuer0yAS3nsyDQtdz6w6/gU0Bk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=fLGe87t6; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=NSvUE39E; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="fLGe87t6";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="NSvUE39E"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6755lAq31950944
	for <devicetree@vger.kernel.org>; Wed, 5 Aug 2026 06:08:08 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	96o0yh28F+RHFrBvV90doH6mJ8BQJ/GtFiqrFDPd/z4=; b=fLGe87t6SdtVNvIH
	HS0k0Spro3TGv1DMLDyKgoWsb0cNoZTeJjBmEWSYk3TzjLDZ0Z4u3zSycWZ+2mMv
	jR8BmSgqhZhB9RB9Jsm8wrMfISXOXiAj+dw5U1g96SDT6eDR9Je/WT+ODf5QiZIt
	Rl+/+1ak/FbamC2ZV+S/5sRzipCyHNsoPCYqP+9A4rqmjopcCRgZ6ncXac5eycX0
	iBgKvN5RS29dXZZxZ6MrFM01YKE7x+19+I2LC27ug+LBCeyohCTQS19UNgasqSM1
	s4Kde6x5nvf/nb/cc6p7eDmpim0JN36UYVCv5tFvCd1qdioH+ujLz7B46HZLll6E
	DJysDw==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fum3ntw2h-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 05 Aug 2026 06:08:08 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2cacf17c7e0so9441885ad.0
        for <devicetree@vger.kernel.org>; Tue, 04 Aug 2026 23:08:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785910087; x=1786514887; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=96o0yh28F+RHFrBvV90doH6mJ8BQJ/GtFiqrFDPd/z4=;
        b=NSvUE39EJsSdV8lS2Sr9Qnxpp22sJ0U4TjH6iv/yq7IrL3zrx2qwzztGoQGHjv6+VU
         1OTGTqyQcLMRSiK6JYHdaEhx+kEZaxpQt5vAO6kwKGNG4/7p6Jkw6MLaNmp2n6nLw7lf
         Srnj4fKovtC42RjW9AzuQhTaky7kpuY4ixcFXUBaUzYmohrk6yxm8c9qh95Eqt0bqhoG
         Aqwf6rQ0Surk5WNCFIpKIJg9YVFTyY+9gn0EgIlZ1hpMVkYH0pMyUGtq37mOivRP/ry4
         5GiJWZM0AOq1WgvAtv626GlgF17Pe0uezn+FIQfZCtUIPiSe2WwDicQxNtypcLP3CYbj
         /JrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785910087; x=1786514887;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=96o0yh28F+RHFrBvV90doH6mJ8BQJ/GtFiqrFDPd/z4=;
        b=CILNIifVVJpBmenWuNuO0f6JZi0HkaNB1KTV/PQA8/tLTufkZ/NPubBJe0iKv9Wiqf
         Mk72pbtp1WPpT3N7M76IuAiBFGhU+NDql//WdDf8IQ6v1EyXAAWINS1x5+i0B9Dw7ARo
         1Yj7ez0xGEh1afVCDqdawknvP3FymHvQciXBUIcR0vDO3zuWFNoWVKLez4MDjul7l+cQ
         2m3aUDFlAmO9LK7d+89gOVZLUIjXR0VGiPC2OxSyDHO9IbXkE9rgOBZoD1CneWxu0T67
         Mt5L/i5xD2TnX614qR4bGxJi6jywxyVpUqPNL4pUqkVIbWebcMqQYVTUwe50o9IV5fjX
         yY7g==
X-Forwarded-Encrypted: i=1; AHgh+RoLixcl5N7mInQaBQ62wD7m4Ey7AMOQuNnh5fdWQsuGC9OoGY02RxG1H7sxu5WmJqib8yzVzwKe3pc5@vger.kernel.org
X-Gm-Message-State: AOJu0Yxk5LOSiEJ46+481RtJw2YnKTMJRzqyucOvtnCTtbTMq6BtD7tK
	nER5aUekcCgRagj5KG/nnHU24o7UmmbEl51N71dKfv2w+Fmv/3Ys52YJZdcXTZAZo5vtGB5Ylgz
	06vSOC5M0NHzedHtTOym/uuraEqybVDHEjoHJiSw3vc4JFop53XnU0GWcGuCgWt9c
X-Gm-Gg: AR+sD11tYXq8+MBuPNzcBaGnIfiGfhjO29tT7eIoURgO4e/jY0Ytl47F6ZVKFzm2naz
	h7GNQeGu7OVo5OkDfEdYENOisq9CH6ooL7DsNRmqop+RDUF5XIpxI+QU7hOBt4aVV5VwDUY7hka
	Tu2/OxFKb0WBwni/4raE3xrzd9jfo/0PIz7RBMWIc4/rw+kc1fUV1PCnP7y5PMC+YBUQjtWOgdD
	XT9sy75v0PwSX/5RsRm4IQdRAuA6G3+w5PzAQ46fLyeWRz5Sp596amtfHT8+EoJPwD9SMEns8a7
	US/Ik0LtyQ8xE2zuOzK5BBfa2l9YSeGntIOzSUHuCgRcX5lbkS1QfovD62JLwIidkE6c16OsVhA
	+CCZIV5bc5LS8vBp0MsBhcrRBfWi1h8fguA==
X-Received: by 2002:a17:903:18c:b0:2cf:7fab:3cf with SMTP id d9443c01a7336-2d0ca981a9fmr43015865ad.23.1785910087238;
        Tue, 04 Aug 2026 23:08:07 -0700 (PDT)
X-Received: by 2002:a17:903:18c:b0:2cf:7fab:3cf with SMTP id d9443c01a7336-2d0ca981a9fmr43015375ad.23.1785910086736;
        Tue, 04 Aug 2026 23:08:06 -0700 (PDT)
Received: from [10.217.219.72] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2d0aa4b9bbasm13965485ad.60.2026.08.04.23.08.02
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 04 Aug 2026 23:08:06 -0700 (PDT)
Message-ID: <a8fece75-153e-4461-8c04-d26b332b16b6@oss.qualcomm.com>
Date: Wed, 5 Aug 2026 11:38:00 +0530
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v8 3/6] arm64: dts: qcom: Add device tree for Nord
 Embedded variant
To: Shawn Guo <shengchao.guo@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>
Cc: Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Deepti Jaggi <deepti.jaggi@oss.qualcomm.com>,
        devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
References: <20260729010022.875799-1-shengchao.guo@oss.qualcomm.com>
 <20260729010022.875799-4-shengchao.guo@oss.qualcomm.com>
Content-Language: en-US
From: Mukesh Savaliya <mukesh.savaliya@oss.qualcomm.com>
In-Reply-To: <20260729010022.875799-4-shengchao.guo@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODA1MDA0NSBTYWx0ZWRfX8Lh69xNfylLe
 1TgpSFbf1WGayCSNqSBdcj5u8mu5zjMgzSnk0gXpbmIYwaOvm4TVNpjFdTz2dpOXNU6nF4GS0Nc
 82SM/0ReO93slVMMY1Lbw7X31SBTR9HLXqzyKSv4E7LeK9plhJtIAstmPO/YvMhe89x3lHklegG
 TEZMxPntfqu57BGy65YVH8Ky4LUMEALbLZorlM0MeGpS/d1CYY/pMHn9uedN28DcQjiYEALEq0I
 fVoP/mb3pNuYACPv59ekPEbDPQZP43AYawsTfj99gXNqSdqo3C+SIiKQgYgkgQ9Pc9GRU6X5ZFB
 H59DuU1Bg3G22duB1SIhZiT/MDkJ7w3eGzBCNyePe2vQ/TPA3RBU6WsEVMBZJPaxebwHBZF7NJ7
 uQuFzWACGmR/5aVJUnH3+t3krqgc6du8dvsAIWmCBrMniHWqCqjPOiU3diNRg3enJNC3549Te6J
 wKYt3iE0f4/rbA8ZQXA==
X-Authority-Analysis: v=2.4 cv=AZqB2XXG c=1 sm=1 tr=0 ts=6a72d348 cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=EUspDBNiAAAA:8 a=nighCxVWtA0h0ZIh7bYA:9 a=QEXdDO2ut3YA:10
 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-ORIG-GUID: P87a67S-mbi_iCXcg2Ym0E21LNYOCwFy
X-Proofpoint-Spam-Info: AW1haW4tMjYwODA1MDA0NSBTYWx0ZWRfX1ti/q2C/jDeE
 KQQG1uZjI+LI1yN+A5ShlfHE2hcECaTVRxihv8u3ZXO/ei7BEO0KdbDqQ2nVwUeX685lFDNtZ1I
 efR14P+HgTvAbEd9C+3CPPARraLbL8A=
X-Proofpoint-GUID: P87a67S-mbi_iCXcg2Ym0E21LNYOCwFy
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-05_02,2026-08-04_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 malwarescore=0 spamscore=0 clxscore=1015 impostorscore=0
 suspectscore=0 bulkscore=0 adultscore=0 lowpriorityscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608050045



On 7/29/2026 6:30 AM, Shawn Guo wrote:
> Unlike the GearVM variant, Nord Embedded variant has platform resources
> (clocks, regulators, powerdomains, pins, etc.) directly controlled by
> the operating system. Add a separate dtsi file extending the existing
> top-level nord.dtsi with nodes representing these peripherals as well as
> describing how they are wired up with the already defined components.
> 
> Co-developed-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
> Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
> Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> Signed-off-by: Shawn Guo <shengchao.guo@oss.qualcomm.com>
> ---
>   arch/arm64/boot/dts/qcom/nord-embedded.dtsi | 1726 +++++++++++++++++++
>   1 file changed, 1726 insertions(+)
>   create mode 100644 arch/arm64/boot/dts/qcom/nord-embedded.dtsi
> 
> diff --git a/arch/arm64/boot/dts/qcom/nord-embedded.dtsi b/arch/arm64/boot/dts/qcom/nord-embedded.dtsi
> new file mode 100644
> index 000000000000..032d384f6eb3
> --- /dev/null
> +++ b/arch/arm64/boot/dts/qcom/nord-embedded.dtsi
> @@ -0,0 +1,1726 @@
> +// SPDX-License-Identifier: BSD-3-Clause
> +/*
> + * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
> + */
> +
> +#include <dt-bindings/clock/qcom,nord-gcc.h>
> +#include <dt-bindings/clock/qcom,nord-negcc.h>
> +#include <dt-bindings/clock/qcom,nord-nwgcc.h>
> +#include <dt-bindings/clock/qcom,nord-segcc.h>
> +#include <dt-bindings/clock/qcom,nord-tcsrcc.h>
> +#include <dt-bindings/clock/qcom,rpmh.h>
> +#include <dt-bindings/interconnect/qcom,icc.h>
> +#include <dt-bindings/interconnect/qcom,nord-rpmh.h>
> +#include <dt-bindings/power/qcom-rpmpd.h>
> +#include <dt-bindings/soc/qcom,rpmh-rsc.h>
> +
> +#include "nord.dtsi"
> +

[...]

> +
> +	qup_uart17_default: qup-uart17-default-state {
> +		pins = "gpio152", "gpio153";
Can we add all 4-wires including RTS, CTS so default usecase for 
Bluetooth with can be served ?
> +		function = "qup2_se3";
> +		drive-strength = <2>;
> +		bias-disable;
> +	};
> +

[...]

