Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EAD4233030F
	for <devicetree@vger.kernel.org>; Tue, 30 Jun 2026 13:34:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782826486; cv=none; b=Wop4fwbQl6lDhVBPXVWQgRgCa78tHgDlVQj7L4wQ6x5qwVW92kzDg7FNimOxJbVp+tui7jcY2p6fZOdNXOWhH5JhQyi+EE/l2LAIMJiyUDj6hZ4UZkVIV6SrZzw5d0uBb3e2FXdX84ZNX03s97wEZdtWJ6UetowqfugApm06zBg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782826486; c=relaxed/simple;
	bh=lf5muHMerkgYyNulxHootfh/dLZ4mJu+DE9+2JmiVjs=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=OtV+LhNRXVNIGU9tmf0z7qNsfesQdXEJ4Lg1a/0BNE1FkBw0GS5dRQ5ptpJgT90txhnG9Gzl8h4lvKA8r1M3e01/reVhR0ZrYGFtOoPecvxWfQ1s7tl81SPSslgahgqtcDucwmsc3zoMZ/B1svIei1YBeGBgfuo3zjrcSM16be8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Z9vhIgom; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Ddu1lKvZ; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Z9vhIgom";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Ddu1lKvZ"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65U9nDi01590639
	for <devicetree@vger.kernel.org>; Tue, 30 Jun 2026 13:34:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ckhdrwMYtOuN/qXXR0kWeVLkD9KT3fYjy7oGRrF/bp0=; b=Z9vhIgomyWkOT0aG
	cGJYJniEsMVpjTvpRpZfeprYaz+liwJq5kOi2lP6ghNNzQ8KX9pURwoY9zQcOqKm
	xBhZgMuZV49nhbT4evKSYwT8gT7RxF45AYt5nH9sGQZstYyZlGddO5mPZI8x5ftq
	r9yp3LM5vDZWY3w+Gd+881d4sZrx1P8XJ1lhr63ePv594N3JxY8bDkVldyrylBBZ
	zynmNZxCl+RfdARry/1BRaYn54wvcXwV3cSfj61+XyqNx0qG99PmfCjnkeuY5i4O
	erSj6ng8nUICXOErRyLC09gd5FnQ0UD21T5bXFrGYWBP/wfSfSR062QuAoVsnZRG
	t9L7rw==
Received: from mail-oi1-f197.google.com (mail-oi1-f197.google.com [209.85.167.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f3y9k3sg4-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 30 Jun 2026 13:34:43 +0000 (GMT)
Received: by mail-oi1-f197.google.com with SMTP id 5614622812f47-48e5de5a23cso5773136b6e.0
        for <devicetree@vger.kernel.org>; Tue, 30 Jun 2026 06:34:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782826483; x=1783431283; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ckhdrwMYtOuN/qXXR0kWeVLkD9KT3fYjy7oGRrF/bp0=;
        b=Ddu1lKvZqzppPnG8VEp3SkVJC94Gy+lCMPntAa5SNR6vaeIzuks8udhtTgbKUAVKvj
         S/YWVV3X6iR2dDQJUU44Hdw80M9D2AtSZxVXH4QQJjGDW0dwQnVrJNT7URb69O/ZoSBB
         J+ZaqSdn8/VqIUx6Do5DP3eMIu75sWtk55tWSaBXwLDd2K/jTVch6yOEHnWA1GI5ufmU
         Y1/Eo/MQ1/GXSE3TloYKkhMZFNfZL5nHE3wi1f+5o+w+AUR6PAvQH5XWqJX0qnXwOnna
         S6gZTJXH50K2u1dXZqNgcY80DzunLPWEuGcUy5M2COyqxIzB2UKw9NFB9mbhJ6gFg1Eq
         Xrhg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782826483; x=1783431283;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ckhdrwMYtOuN/qXXR0kWeVLkD9KT3fYjy7oGRrF/bp0=;
        b=O1DytERTRJ9KizQ/Ovql8CN0t0ndUR3Tgl4C9Tto518kHnwnAjNG9ZHaJ+LKnrAM6P
         0AtniRRmOOX3LPLGxsbf2NPTs3NFE8W7qO/4uIDGlgdrE/iRRVre316sPGrWyBosjoz2
         nNjsS41w80i8V19e8OEWvMQQrBJLxBR4PXqEpTZIPfVpx8S0ndhAzE9J+UEsYied+pJ4
         mSQBMJQIRmEmO/8zyoMPLYhjHQwmd9cFSmmk7iTbjcAvIx0SgsJkVyJ7P3VpJ1SjecxJ
         5sbllt6ciI/6EE35ggxW3OVCqmmpPJcnJlXkLOaItnZBQqwwDKYF9VeK39ItIkJWWD/a
         Nrow==
X-Forwarded-Encrypted: i=1; AFNElJ+0P8Gg1S+91KCRb6UTot17w0xWa6hnUOHsOb1u+uhNSYFBN4Q3N7b2nLRBvfx9FQIeGFtfrcXNuIj9@vger.kernel.org
X-Gm-Message-State: AOJu0YxkvWilSUIoDi4km8JyP20muNdGvf/e3VG+ZPhSjOwEO52YL00X
	kCXl/bhVkZO4PAu4Cw8llscF8Y29FUhVUk0zFSH/fYd8m6+2dhG9jSTrU7i+Din6SrrQm52AFOt
	9kIC+E890RneGkm0QbsF21UMyeJM6v6B+T8C8zZRqeE/3MMDgrn4p4k7Ks77U25fxhMhlVFta
X-Gm-Gg: AfdE7cn1Ax43UlibXHg3LmVKOANQyXTPfg3B/K8mukJns4aTldC+tDnWSH8KhzrigA3
	eRi9rgYIKHb3bBPfbFlmtL4bHDJLr+NBlbirmYgsYzh82UDkHZVN2iR4c2gBZrqQ/VwXurCUyft
	BBKoJPJSuM4CUYsrfKVQQAvu+YdDsOY6kLsukLnmFyilgZ2t0XCuajdtX5pimoxrfCX1/w6UPKp
	/bJ+uv5G12h/9szzCJKZHjt8wO4U5L8tEqKIBzTJ5IOSBzaZFbh+yaoG50whPkcGPPnPaRb2jFU
	M7cASZTHkjeZ9K0RSmpvEYallL/05vfQ9zB4OrLkUaupFa1iwvmGyHfx8Nf5CJatYKEQMNKD98B
	KX+wIJgBWVBOQNzLvTPeIj8uZ264dyxe1BhouT+w=
X-Received: by 2002:a4a:d1f0:0:b0:6a1:7ade:766f with SMTP id 006d021491bc7-6a1892be9d6mr2176878eaf.68.1782826482991;
        Tue, 30 Jun 2026 06:34:42 -0700 (PDT)
X-Received: by 2002:a4a:d1f0:0:b0:6a1:7ade:766f with SMTP id 006d021491bc7-6a1892be9d6mr2176847eaf.68.1782826482116;
        Tue, 30 Jun 2026 06:34:42 -0700 (PDT)
Received: from [10.219.57.117] ([202.46.23.19])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-448dbb2302csm2293397fac.7.2026.06.30.06.34.36
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 30 Jun 2026 06:34:41 -0700 (PDT)
Message-ID: <e11f57f2-bf15-4c06-ab3a-ab2843818a41@oss.qualcomm.com>
Date: Tue, 30 Jun 2026 19:04:34 +0530
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 10/10] arm64: dts: qcom: shikra: Enable Bluetooth and
 WiFi on EVK boards
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Vinod Koul <vkoul@kernel.org>, Frank Li <Frank.Li@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Georgi Djakov <djakov@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, dmaengine@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-pm@vger.kernel.org, Yepuri Siddu <yepuri.siddu@oss.qualcomm.com>,
        Miaoqing Pan <miaoqing.pan@oss.qualcomm.com>
References: <20260608-shikra-dt-m1-v4-0-2114300594a6@oss.qualcomm.com>
 <20260608-shikra-dt-m1-v4-10-2114300594a6@oss.qualcomm.com>
 <64691236-178a-4fc2-a9c0-f053b7944e66@oss.qualcomm.com>
Content-Language: en-US
From: Komal Bajaj <komal.bajaj@oss.qualcomm.com>
In-Reply-To: <64691236-178a-4fc2-a9c0-f053b7944e66@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjMwMDEyNiBTYWx0ZWRfX2WtI4YKs1kP+
 1Wg6XOhzrUWfmvC7y9x7TaCHq6mFctOVpZSPL9pg7qwWeZIyp+B0ZdpxvgZQetNl6RNn6oAIneo
 zGr4FxO8VUPmyhnnJPqaoWfBB1V4QYw=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjMwMDEyNiBTYWx0ZWRfXz/2NF+8Z2WoM
 MC16qqqanzrqNhuDcwQwUtwjlYcwnIV9fCCpN2xmvKV81Bmwmd7gPJavUcyCLXa91hdKixUguGS
 brLNcvy7fc5k3tu4Xv5JDuuurnrMzFt0QoRz1R3uvtMzOKByJJ9bgDv6iRteLs3DkGuhfCK0NzS
 DFTmWYT+qIUZWKWKSeV/8nmha+LoXFdEKP2IyhXH+jaWsBU9lJRM7Qbsh5m19Hcih3BKU29d80C
 q8kaAtgoJiKzrorg9xGRnPcEpBWYt8bP6FMeer5Vo4T13laSar3jz1hFbYRf9+NkXaM6rW+lWjG
 hvjmYqV9dofbxSBCGmh4E4HsxiQl0XLMrCxK17Hccv07Dnn0OB1YCRIsnvAbPm94cWVeq2puAeu
 6sVK7OUe0jvvMV1Oh46/q6eSdXg26iR+Miq139sslyISUx9FxDwFxLfh6L/pC/IrPqhZtFMAgma
 YSIAmQyymYyQnIuQm1w==
X-Proofpoint-ORIG-GUID: ILPf_C_7Z_tbucWndj6Xbx49E2x8XwBZ
X-Authority-Analysis: v=2.4 cv=TeqmcxQh c=1 sm=1 tr=0 ts=6a43c5f3 cx=c_pps
 a=WJcna6AvsNCxL/DJwPP1KA==:117 a=j4ogTh8yFefVWWEFDRgCtg==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=EUspDBNiAAAA:8 a=IW_wJ7xLveG3VXcQuYoA:9 a=QEXdDO2ut3YA:10
 a=_Y9Zt4tPzoBS9L09Snn2:22
X-Proofpoint-GUID: ILPf_C_7Z_tbucWndj6Xbx49E2x8XwBZ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-30_03,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 impostorscore=0 phishscore=0 priorityscore=1501 malwarescore=0
 spamscore=0 adultscore=0 suspectscore=0 bulkscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2606300126

On 6/29/2026 8:04 PM, Konrad Dybcio wrote:
> On 6/8/26 3:10 PM, Komal Bajaj wrote:
>> Enable Bluetooth and WiFi connectivity on Shikra CQM, CQS and IQS
>> EVK boards using the WCN3988 combo chip.
>>
>> For Bluetooth, enable uart8 and add WCN3988 Bluetooth node with
>> board-specific regulator supplies across CQM, CQS and IQS Shikra
>> EVK boards.
>>
>> For WiFi, introduce the wcn3990-wifi hardware node in shikra.dtsi
>> with register space, interrupts, IOMMU configuration and reserved
>> memory. The node is kept disabled by default and enabled per-board
>> with the appropriate PMIC supply connections and calibration variant
>> selection.
>>
>> Co-developed-by: Yepuri Siddu <yepuri.siddu@oss.qualcomm.com>
>> Signed-off-by: Yepuri Siddu <yepuri.siddu@oss.qualcomm.com>
>> Co-developed-by: Miaoqing Pan <miaoqing.pan@oss.qualcomm.com>
>> Signed-off-by: Miaoqing Pan <miaoqing.pan@oss.qualcomm.com>
>> Signed-off-by: Komal Bajaj <komal.bajaj@oss.qualcomm.com>
>> --->  arch/arm64/boot/dts/qcom/shikra-cqm-evk.dts | 59 +++++++++++++++++++++++++
>>   arch/arm64/boot/dts/qcom/shikra-cqs-evk.dts | 59 +++++++++++++++++++++++++
>>   arch/arm64/boot/dts/qcom/shikra-evk.dtsi    | 15 +++++++
>>   arch/arm64/boot/dts/qcom/shikra-iqs-evk.dts | 67 +++++++++++++++++++++++++++++
>>   arch/arm64/boot/dts/qcom/shikra.dtsi        | 23 ++++++++++
> Split the SoC and board changes

Sure, i will the changes.

>
> Should most of the board-level changes go to evk.dtsi, since
> they're almost identical across all boards? You can e.g. simply
> override the supplies in the IQS EVK DTS

For wcn3988-pmu node, I can move it to shikra-evk.dtsi and add the 
supplies in the board DTS files. However, this approach will be 
subjective to per node, as other nodes (such as sound) have 
board-specific changes beyond just supplies.

Thanks
Komal

>
> Konrad

