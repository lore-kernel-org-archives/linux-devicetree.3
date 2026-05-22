Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9D70239281D
	for <devicetree@vger.kernel.org>; Fri, 22 May 2026 11:08:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779448087; cv=none; b=CKHKvBweKt4ELJFhKAe+a1Sya6SerL0c7I3SZEkQWr9mjC5EARsIPVjfioDx53iF6JrJOs0OlTtaV3yqWSidiNeQrFahO8dvNSZ6Wee9GHKSjfwthTGm7yB26zGVCMsKTXTLpRix9dsU+jvULOB4ESCiPMPuQ6JeoXwwdLBAb9k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779448087; c=relaxed/simple;
	bh=IwDmK6EMEISyJ7rPprzuuUy4PSuSQemBVEhPrWba4BY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=S/S+Fz7kS0gzAihp23ugB6egjlvX73J0LFMx1uhrmlIPUt2XncRZMqGZxrkDkd8OoUmt0GdWw7xmMSynFXOukjlcL1zpC5YNkbrY4K9EZxmntlQvDL2V/iNwPzlIHcFQRcVRnthtMwYQ0Se3QugsjvWACkCrmjKF2Vb777k0Kew=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=XZDpURRV; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=NY+L9z2F; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="XZDpURRV";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="NY+L9z2F"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64M9mtaO312898
	for <devicetree@vger.kernel.org>; Fri, 22 May 2026 11:08:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	4GKED5ytB1FQ6HqBUFcNSlImil8v1klPu7XCU8S5L4E=; b=XZDpURRVwZyX0uRb
	PfRQd+e8bEfNQtWGvN46P7i/ndzEuGw4PMUGnyXMfkjSVlwOAZc0wBsDNZcwXlr1
	irNZ5g9NpW+jr+EawFagL52LYVFgkIqbvNg/uuCx2oTDkYMMuOliE+L63XQT/yhi
	E2OcTjr01D0Kvmow6Bu+HPGCrt8Q4tebIxGnjgg1XgHlPtzMmx5WaFksD7uRcwdM
	iQscoA01Ib7XVFeX6uqAgVSLmzwN66uPvRklA56P0Ny2ohhOdieNEhygdbwIOWJD
	Bhn3iUXQo4TZPxzBpwWK5f9KZtqviCwqQPDYCIEU1Et3l8VlZVK8KyiV8u8gMjbb
	YuyxCw==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ea8833gsv-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Fri, 22 May 2026 11:08:05 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-910a755d717so104132985a.0
        for <devicetree@vger.kernel.org>; Fri, 22 May 2026 04:08:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779448085; x=1780052885; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=4GKED5ytB1FQ6HqBUFcNSlImil8v1klPu7XCU8S5L4E=;
        b=NY+L9z2FUyozCiGwn5M7nUul3CkAGjUnWS7kV1fcbYc5fJ2lYjbVTpStC0TSlINDap
         +hho6bO/+MLA9aXj81g+DHoaL66PtM3xSZ0yCzKg5zZGXU4zyygL9wv1XWPKA1ETOeY0
         wtXhvpk5mcDELL3BwTAzVSG/m2xdR4BWx2vrljwCkpDOQDxZ4mOLTzoIwT2v6EZI0Qgt
         NCrr3N+0lrP4VXJxxcXfj3dpmV+YAF3wWgmnTWIHCORWvJG4SyvMREIG5oe5TnZ5Go5d
         ETFqwcyKnFYxi2zn5aDo2HK1ZJuxJNZXA+HJvEaLqCYU0LTosaMjBd4B7/EK+F0/NcOj
         sp4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779448085; x=1780052885;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=4GKED5ytB1FQ6HqBUFcNSlImil8v1klPu7XCU8S5L4E=;
        b=OIwJLsPnx3Q7/q7iyD/KWDdFcPzaoV+IgtBM0Iwznyou0PRhyrBZ/PUpfgQEr7RuMX
         iYOCicXwMS96zDWCnheYamCwhJpgJLC/CqRcqgv1W9pefG0MxqdGwZEkd7GTUaxI5uhE
         J5Gl/WP6sFuPre4TkEXu7a/mcyvEPfEC+tZ9xKkCQt0jpcQAHSBAbPyvVASF6Mp+RQxA
         FLjfuh1gagQ/pbv1+wIcNwRI4owc195FS30+9U5wZNVOqk0vMBjRMz9A8x73reFw5na6
         GogGNhf+0gOpMwQXb3bK1TqDBSEbWG84SF/UGo00kGHU+/gAFlPkRZso71PUm9mhSzSl
         f2Cg==
X-Forwarded-Encrypted: i=1; AFNElJ9fIcKmgGLjRB0qxVxWDfJTDMl9xwM+DXUtgZtzGkmQ/+gzfNTEYf5iliOnaa8ZBhQwTriaES/CrQAd@vger.kernel.org
X-Gm-Message-State: AOJu0YxLgVdUe39Ill8YSs8O2Msp4duzlf8w81t5GN7FUV5Gw/VQh9cu
	bs7ouCAV/zultTkoEPhYYWIMDlK9fyxULmRRWJ2RaBwHfpQ/7jV+dDKFef4PmJyxphA455J5Qj8
	mupoa/Qhg2UFrUSU29X3hbmA/kwOrpUvkhr0wXutkd57LSqB2wpUdQU0nEtn8MIvy
X-Gm-Gg: Acq92OFNCIkdoMEMzO/bYxRIk/X2Vb1pcKi9xeddzohqR71K6MXl0L+nd0HuazOxgSm
	mvHKrMZZ4IZeyYaFRtXGZDP0z6npXPRd82kSI0rgs8xyeyvkZuwXSzcVQ2fd8y1NuwDJXytb2vf
	5zBV6vVXdMMOzNs1Yj3Aha9wl1qUEI5s4Q9x0rOc9aEyeAHrV2GIH16tX8YEdrplv8nIDCWIKuv
	vxAFBH9uO6L2ycGkLbit5i9r36nRyxJaWHW8z1Xo0WpJeKndHzrdNNMskOKhRRCou0ilJVyoStH
	12sFckP8ChUfd/J/GGiBMrXAqlbynRXuILsHRS4H9QaqLZagW5qAJFOwMgjN+LG+2RDtZLyQavA
	oTlYsS/nkBQKrCws1/OGSsTio59Kry1ofQy1Y4QuGbTRn+A==
X-Received: by 2002:a05:620a:2a08:b0:911:dfb8:37c9 with SMTP id af79cd13be357-914b4957a47mr303971385a.3.1779448084960;
        Fri, 22 May 2026 04:08:04 -0700 (PDT)
X-Received: by 2002:a05:620a:2a08:b0:911:dfb8:37c9 with SMTP id af79cd13be357-914b4957a47mr303968485a.3.1779448084556;
        Fri, 22 May 2026 04:08:04 -0700 (PDT)
Received: from [192.168.119.254] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-688b9b6d2e3sm545503a12.4.2026.05.22.04.08.02
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 22 May 2026 04:08:03 -0700 (PDT)
Message-ID: <1c6ccea3-59ad-42a9-bc7d-edda17814b8e@oss.qualcomm.com>
Date: Fri, 22 May 2026 13:08:01 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 6/7] arm64: dts: qcom: kodiak: consolidate IPA properties
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, Alex Elder <elder@riscstar.com>,
        cros-qcom-dts-watchers@chromium.org
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, Stanislav Zaikin <zstaseg@gmail.com>
References: <20260517-ipa-loader-v1-0-3c3764c1b4a3@oss.qualcomm.com>
 <20260517-ipa-loader-v1-6-3c3764c1b4a3@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260517-ipa-loader-v1-6-3c3764c1b4a3@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTIyMDExMSBTYWx0ZWRfX+wsCfFml/Wic
 tq8yepgjQnmGRknKXDT36CO5jC+8uy0D11FYMLYIGqF4POORTfMS/0eJLPc/lLoWZYdwpxuQ6lH
 DQCs+TmpwatYOWZ4c7U5O/5WcWI71z/LWp7cEugbfH7H/51VK/lOH46z/zVKtfq9GxvWKyFZhj1
 /WXcYTZMPmcdmqwUK45wyhZ54j+6NMrqDpC6mA6lm7tXdMAigyH2LXZCQz7oVE4+RrDCsrtiXNp
 OrnTW/+LMGaaz4uOQw7pR/U+e5H/V3XAUlBmrScYeTf4xWwFEEHCwEhQoK9JE0bWIzhX3ZpIgnq
 ZpNNJj0NHrvpAR39ACHKoyNVAyRccGZUcjB9Q4jMIdb7m1wX1A8/DptDGRTgMDSXCFBEjXnxpZM
 5KsY0VTp+pIk3WwGa4PfN95A9q157B43jkpeTOG/k+jXDRTYPEdP/0j2gIxMCcQBZOItzx7qKUM
 dMHMr67YMiIOXL+gRjw==
X-Proofpoint-GUID: 8CogqiYfGAYW5KuMrylyr01k-VTy7AXQ
X-Proofpoint-ORIG-GUID: 8CogqiYfGAYW5KuMrylyr01k-VTy7AXQ
X-Authority-Analysis: v=2.4 cv=LsSiDHdc c=1 sm=1 tr=0 ts=6a103915 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=pGLkceISAAAA:8 a=EUspDBNiAAAA:8 a=3fF2GDuCYiqyphel07QA:9 a=QEXdDO2ut3YA:10
 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-22_02,2026-05-18_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 malwarescore=0 suspectscore=0 priorityscore=1501 impostorscore=0
 bulkscore=0 spamscore=0 lowpriorityscore=0 clxscore=1015 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605130000 definitions=main-2605220111

On 5/17/26 4:56 PM, Dmitry Baryshkov wrote:
> Move generic IPA-related properties to the base DTSI file. The herobrine
> has special software configuration, so delete the memory-region property
> which wasn't set for it beforehand. Also delete the property for several
> IoT devices, which don't enable IPA memory at this point (and don't
> seem to have IPA supported by the modem firmware).
> 
> Co-developed-by: Stanislav Zaikin <zstaseg@gmail.com>
> Signed-off-by: Stanislav Zaikin <zstaseg@gmail.com>
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> ---

[...]

> --- a/arch/arm64/boot/dts/qcom/qcs6490-radxa-dragon-q6a.dts
> +++ b/arch/arm64/boot/dts/qcom/qcs6490-radxa-dragon-q6a.dts
> @@ -504,6 +504,10 @@ &i2c13 {
>  	status = "okay";
>  };
>  
> +&ipa {
> +	/delete-property/ memory-region;
> +};

On QC*S* parts, wouldn't IPA be disabled anyway?

That's what downstream did historically on APQ-ish SoCs, anyway

Konrad
