Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4ED0B3B1EC6
	for <devicetree@vger.kernel.org>; Fri, 29 May 2026 10:24:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780050265; cv=none; b=XSV4U6Sjd2YCJdyOnccUSJqeAVIVJVrwds4Q2esRBerMhTYGx2d5m30mZ2o4pF++uDYGN6dno25aU/OV5rCAVW9pCHVRz738fBYQ/Aw+SslThJYg9g1vFnv7PnLa1wzvtLrQDZYP1F4V2k9XMlY6+Og/AzKaqy093d4KI95L0Fo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780050265; c=relaxed/simple;
	bh=FO6h0QFaalhrqwRHTehgRq1wJKA0x2MacwpCuw0meww=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=n1OiNuqEDLI9bo0RufLb/sLGnbq5MsKCCX/fsmRTGE4zMMne+Q7uovYF7dj0qRwIvrGpiORkiNkkCfMxNn1rRYIIX/HIQv2TdwaUVDWQs3CZuM2HyBf2ke6WYs/I/BORSmd6YOF9UUmEkIQExDrVCqQr/v2If6qD62xMgSsLTx0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=fwtJ9boA; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ko9WEgGm; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="fwtJ9boA";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ko9WEgGm"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64T6Fxga2117643
	for <devicetree@vger.kernel.org>; Fri, 29 May 2026 10:24:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	qVEh+5Wv+uAK+OT22qIaVzyM+YmVu8RQ0ljuue2efM4=; b=fwtJ9boAw/G1k6eT
	Kl5gtgBcFRORC+qViVEhLSKdLytMwPWtTRm6bWjZC0FE+XVLqHjtit1+hhRChcZQ
	hr8wuyCGK8Wdv0yfUjqmGMgDKUtwojb/IHyyHDrgSz82UBquuuPsPTbYDJO4phmG
	MfS/Yr20fxMZHwr3ZJRoLgkiwgMtpSrokrxMUAZ+BcwwsDYCbmT/NQlranX6UjcR
	02EK0ksFAhkj5VzKLtW9b+CF8m3D7RHoj0jkfXJVD9m5gpxAjUXBkwBQyIa6vWXu
	Ba+9yHzd1JvfhLhF+oowheXjJI/PcpJZ2YfMlnmIasKSox+qg5emM2oXExyZwoM9
	/HH3+A==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4eeuy5b96j-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Fri, 29 May 2026 10:24:23 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2bd5b20aaa6so146739665ad.2
        for <devicetree@vger.kernel.org>; Fri, 29 May 2026 03:24:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1780050263; x=1780655063; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=qVEh+5Wv+uAK+OT22qIaVzyM+YmVu8RQ0ljuue2efM4=;
        b=ko9WEgGmv7VsAjGiOBCLMWM2D4NRoBD9zsPmd2HTi8hnpaWRgYONbRaNYesxhVYRD+
         2ROwIUsyXlQJbhEi4UZpoamnoJQH3Ha5P/V7rtO/Lgqy5AJBHDtGW1RNN5dAJJXSFabV
         zN90JwU+STLIyv5YVbNzXR0tPVhCK0na2QOf/R6B5dVxbOLexOZ70d/WxSXecE42P0jM
         PgE+fPCbZ6KkGURC6ICc3b9DSWDitGKXmr7qC8Y0TM9l75uOubUNfLWK3zCCVZle1dy4
         q8aR6VitblMxMaFV4GTyOKvYZrrsUyZMkJqy86Xn5kfHoqdx1ZUImlYml1ERl8Z6V4ga
         mhyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780050263; x=1780655063;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=qVEh+5Wv+uAK+OT22qIaVzyM+YmVu8RQ0ljuue2efM4=;
        b=KBmBdItk/LyJIbQme1J5ObJvUWGnFqk+a07UKNa9WRNDcayS5yoFy5c6tTm80s9rtR
         xZU6qeH+KVC7PRTQQ3i85Ojn5w4tM/GtKQE/r5em/HCjyTb5tBO5tF3IEuROS/1n/8ya
         1uj9stlO8YJDyExxbQLKTCvSXHvygTW30DeZi2FbhvG2D0IIfkLMqRfFfvcsYyMbClWf
         cKQIMN7nFwblbWKKNGDPkuUlWKiCFqVL8801c1iboJR1PZRgnTs5O1+aasV2OOQuvh72
         rvdqufShyoUV/+UpbKRJywUa7SIGlBhP9jQhI9slUOB3CmLYNcjWvq6QT3tnVnl2pQnd
         RVqQ==
X-Forwarded-Encrypted: i=1; AFNElJ9T/17aUikHvGzUyzgumi4kh1VK4N9uaxuOBiDMorlsDRmD6abvUQ0NHERSyZx+vXUV0HqKTBfqx4RN@vger.kernel.org
X-Gm-Message-State: AOJu0YzmDwnvXIkcR/plhWxeaG2M4zhrF7gJIsxH3dHWvl4H0PPpjQEL
	GX1NNCnPyu3Wb0PWtImsdC+UwML1Bo2zPikuM58IcKP9eya652jcX/ABqpvt19jrHF8x2yyIaOq
	52pUrCeCMcwHkcqmjy5q3pSy7M6YS+fIRHCkoldd7RQZNNGgSYZt5AlYGZrHjog9r
X-Gm-Gg: Acq92OFCjVFCQMyVIxti/qHQpb/1dGLoyAbRnf0UDB585/hlEzoy8/QAXalOlk2TVij
	kmmZYerzyO/ZVYZhDLGykjQmS2I+WK6uPcY+YE9JSXxH37fb7g3F76xG7nlmExxJfUbar/i6rCq
	5KTfpvInyRr84PaL0oDaIvLTKZ++RjyYvlS0OjXlg90ZP2LQHXFPiB8RtVKiuHsmCzS0Bsg4HJL
	Zpe4wH25oFS/HwVnt52AdzTlfYHJik+HB1/AzqSSSvF8+hABiQBMp0vGvpUvQBo20aOcGwFAai6
	9xPRHcOJz0+IF0pwI+Jods83WNP/4vEy6/2dXZ1ma0x6GbrVPZUFSe0RWZnETU7Mxt8G85dTGwT
	j7dYUKKPLwVIAjKi2jg7nX+SKP9aEwVGhSU/JwwezZMjw140mNtLtj0rTu3/Mvz8VNmxBYElZG7
	RnFx1NgleF+VPh++biA6aDwQ==
X-Received: by 2002:a17:903:234f:b0:2bf:3126:44b6 with SMTP id d9443c01a7336-2bf312645c6mr197095ad.40.1780050262823;
        Fri, 29 May 2026 03:24:22 -0700 (PDT)
X-Received: by 2002:a17:903:234f:b0:2bf:3126:44b6 with SMTP id d9443c01a7336-2bf312645c6mr196825ad.40.1780050262324;
        Fri, 29 May 2026 03:24:22 -0700 (PDT)
Received: from [10.133.33.250] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2bf23c2381bsm15624835ad.62.2026.05.29.03.24.18
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 29 May 2026 03:24:21 -0700 (PDT)
Message-ID: <2b237599-7cad-4a80-ac43-564ac4fbeed9@oss.qualcomm.com>
Date: Fri, 29 May 2026 18:24:17 +0800
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 0/7] arm64: dts: qcom: Add label properties to
 CoreSight devices
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Tingwei Zhang <tingwei.zhang@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
References: <20260414-add-label-to-coresight-device-v2-0-5017d07358f2@oss.qualcomm.com>
Content-Language: en-US
From: Jie Gan <jie.gan@oss.qualcomm.com>
In-Reply-To: <20260414-add-label-to-coresight-device-v2-0-5017d07358f2@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=SPtykuvH c=1 sm=1 tr=0 ts=6a196957 cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=Hetpuf5w24yqYUOSKEEA:9 a=QEXdDO2ut3YA:10
 a=1OuFwYUASf3TG4hYMiVC:22
X-Proofpoint-GUID: B6uPEYfaZbG4x1HpvEqqdDKQJnTCmbii
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTI5MDEwMyBTYWx0ZWRfX6XSgcXkDl7Jr
 7E/tPt7mmwR/Th3E6pSc1cJKjAI4EBAHwN90flXMoxBL089zS9ECzisnGCMhkF9YwmzxTAUsf6K
 tE8ShCY+YSxbOMy1H0So1KrvQSifOIz3hFQIvxoAfO6TsmNGVHvZmwyWrzDsE8Sfe26B+YxxK7q
 bCYcKrCS2rwWOmnP9G78gWQOA5/zynaw/ZJZKiHxrAohuEKCxf/ZNKt9KoUi9SfZDnY0sDSN7PM
 1hceahVTycT2PmkaeFltqPbhrVWZ++FERKg05EzRIoq+urPQAnyOs6HH8SFHAPCD7XLk4Op6oji
 xlTU0zoUbrGDFFP+uSh2a9VgLLwa0J6ZZrT0u6ekqkGI+rSTLgV6RV9Y7b+RYn+4mXdilfEqd+0
 AaHZ4z+ZO9Z7rWtu3fUgQ336IrUiDLkgiyK8OOv3PzCzkn56/7DpL1kY6XSRYsq4xQoIzGymygZ
 p+iDxXlV6FrkJ2F1Nmw==
X-Proofpoint-ORIG-GUID: B6uPEYfaZbG4x1HpvEqqdDKQJnTCmbii
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-05-29_03,2026-05-28_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 lowpriorityscore=0 priorityscore=1501 impostorscore=0
 suspectscore=0 malwarescore=0 clxscore=1015 phishscore=0 bulkscore=0
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2605210000
 definitions=main-2605290103



On 4/14/2026 7:35 PM, Jie Gan wrote:
> The CoreSight framework and userspace tools identify trace devices by
> their base address, which is not human-readable. The label property
> provides a stable, descriptive name for each TPDM and CTI device,
> allowing tools to refer to devices by name rather than address.
> 

Gentle ping.

> This series adds label properties to TPDM and CTI nodes across seven
> Qualcomm platforms:
> lemans
> talos
> monaco
> kodiak
> kaanapali
> sm8750
> hamoa
> 
> With the change, we will have a sysfs node for each Coresight device:
> root@qemuarm64:/sys/bus/coresight/devices/tpdm0# cat label
> tpdm_spdm
> 
> Signed-off-by: Jie Gan <jie.gan@oss.qualcomm.com>
> ---
> Changes in v2:
> - fix the extra tab format issue in patch 6 (sm8750).
> - Link to v1: https://lore.kernel.org/r/20260410-add-label-to-coresight-device-v1-0-d71a6759dbc2@oss.qualcomm.com
> 
> ---
> Jie Gan (7):
>        arm64: dts: qcom: lemans: Add label properties to CoreSight devices
>        arm64: dts: qcom: talos: Add label properties to CoreSight devices
>        arm64: dts: qcom: monaco: Add label properties to CoreSight devices
>        arm64: dts: qcom: kodiak: Add label properties to CoreSight devices
>        arm64: dts: qcom: kaanapali: Add label properties to CoreSight devices
>        arm64: dts: qcom: sm8750: Add label properties to CoreSight devices
>        arm64: dts: qcom: hamoa: Add label properties to CoreSight devices
> 
>   arch/arm64/boot/dts/qcom/hamoa.dtsi     | 30 +++++++++++++++++
>   arch/arm64/boot/dts/qcom/kaanapali.dtsi | 35 +++++++++++++++++++
>   arch/arm64/boot/dts/qcom/kodiak.dtsi    | 12 +++++++
>   arch/arm64/boot/dts/qcom/lemans.dtsi    | 14 ++++++++
>   arch/arm64/boot/dts/qcom/monaco.dtsi    | 29 ++++++++++++++++
>   arch/arm64/boot/dts/qcom/sm8750.dtsi    | 27 +++++++++++++++
>   arch/arm64/boot/dts/qcom/talos.dtsi     | 59 +++++++++++++++++++++++++++++++++
>   7 files changed, 206 insertions(+)
> ---
> base-commit: f3e6330d7fe42b204af05a2dbc68b379e0ad179e
> change-id: 20260409-add-label-to-coresight-device-b17a2ba6030e
> 
> Best regards,

