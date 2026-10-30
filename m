Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793350152;
	b=HO3rKfGoj2HxAFU/pqcTdwKqRixzSC385IgLGdEnfStKiaEVQb1Z8POui26Vb1PcA9lx
	 OnRcmQ9PO56UTUbahHVZklGXytFztiznmS0vskwPQzFBceAboILn1gs6/U9x6f1CyWnws
	 3eFUdkYJeFOhPHuBnffa6+K5pQqXjdM/dgNMCo2pwjMS+EPBfdgELrcRxFYIjzcWmB3TI
	 y80qZ4h2GK3Ba6cAJJ+8L4LzyteNAebLNNy80rWibV+Op/19f0sQS2He/eOzm5nRox0e9
	 MGVbnyZWtXB2dtoZVNLEfCOE4CkrpvJ2A7jqcRBoepTsa88xHu3j99QT0xN5g1tW0qw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793350152;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Authority-Analysis:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-GUID:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=cbUUbzN0+cCtT/keBcmiPRae6tkWqWYqorJda4XW1pw=;
	b=zgYNJPiUMl197slgV8cDtyhgF6IoTCuHs/9O2Qim1obBHD7T7MtcbPxJQXyrXRIRvk9n
	 A9God/LSYn/IieOWHYj/xVWHAPLtjuwcP0ZBXhAfEXnp3SDmQ2FgZPIDlFz64INXzKif4
	 1R1YYBRw4Z3aOj+LLt+QeMzYN8AiQAEU6YWg+BVJyXTn/jwjQ7OFIDKcVihG5kDYlHRKH
	 ctde+9vMZwoKbNwHoTuOCYYPbmraSEJ+fg6uXbEegnKi+w7QBh0gCAKjuqA2003eu6Ju+
	 dOibqOmTxIOB8OF1+DYR3iX6wKHF2Vl7Ra9tmwnAnWFFiPqfqW71+cAimmjOByM70Ug==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=TLz5zqHz;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=YKQnPGIg;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2D422606A325
	for <devicetree@vger.kernel.org>; Fri, 30 Oct 2026 08:49:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2D422606A325
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=TLz5zqHz;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=YKQnPGIg
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69U8F9do2374174
	for <devicetree@vger.kernel.org>; Fri, 30 Oct 2026 08:49:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	cbUUbzN0+cCtT/keBcmiPRae6tkWqWYqorJda4XW1pw=; b=TLz5zqHzA7ZWNCgv
	0X4ObSt4y9gdflINLP7FvEwwrQvzw+UEEUZmiCqIVLAe2ByuN5lQ3Kq6WmGNRGN6
	QAmaAH4b9etrBGWfFjrc8CW/A1JrjTT0NNUDI+VrOjy9gq5hXIC7kc1fbhpY3E1j
	/Z6AjHMZGHjGcSiuvnuumia0cy8GN5Yiq7NI3tIHzVvFV/lnHvjYe/+z2UvurD6Q
	sexfC9K3jsZuiReCw8LjLGPLPYCerG+I2Z4rKdOlPvB23N7Vvh6XRUo6xGYB67ll
	peb7hOeoJbQxaf0K3rKJU+8WmRR8Oshibt9ZG2zxri9P2aW3BPad98hLUt0U9yNm
	rI1jIA==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hme6qj2dc-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Fri, 30 Oct 2026 08:49:11 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-93edac5877bso3678785a.1
        for <devicetree@vger.kernel.org>; Fri, 30 Oct 2026 01:49:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793350150; x=1793954950; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=cbUUbzN0+cCtT/keBcmiPRae6tkWqWYqorJda4XW1pw=;
        b=YKQnPGIg3B9XF16OOeO/8TU7SmK+jfEeZAx3vHh1zyH8cEuKScFgZNQ+U6+2O/FN4i
         /L360K9ARlHfZ8foBc1SFWqjDUAvAT5VtEN5DzbZGOpPB99JfmbHDpdCT+17DVQovSv/
         oNWI6rU3NRvqc0JJOt61ONiHEToxliG5mjZRfcqhyEY11AVAIgjNnHZyUg88jOZ4Qb5s
         /HjMBKbA57yGE8rCiTqOc0W9Sa14KF9DqzGCbQSkmY7dcp7wIWZPXGqneFrTBjbijnvj
         iPL7wqta2iPoRo9SfPAoAi5VSJUCheem1ekA24BmKgJ9WW8q+aRyKvemzKjU5yQYH5+c
         SugA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793350150; x=1793954950;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=cbUUbzN0+cCtT/keBcmiPRae6tkWqWYqorJda4XW1pw=;
        b=Xei3HcXxpN6R5prSCbpJ+fI4JnyL862yvwvuA5VkZQ7/2D+h+Sd/KS69XRffukKSte
         n86dku5YKXWBEMKn7XreZCyUVvaP1VJLkzX5AhRZM1j66c3TUUzU7XLe/01nyu63Y+r2
         kcCCnjP8jy4R8uZXQ4B/jAY+qpDme3YvMOhn9s2Y/1bycbnsLzPmmY6zySMwEStek/IS
         atgj2QZJ/I2/kXoGEL05dOOCNoMkQFm4wsaQx9V6S8OtXZ6IykIXK3xKHgM0EZCY6qY6
         0e1qNlNIZJSHg2tR5aMG6HjaYnRi+a3uueRxS9LaX8g1YbQ6CyrQ4J+86Ica4KAyCM+/
         SvZA==
X-Forwarded-Encrypted: i=1; AKwUvBz+5yJyuJMKbZuzlRK9w8c9p7tA57L+1juSYaKlICYiPYAU7vHfgT5YebrgfxhWaihrLJ1L0LyIxPb1@vger.kernel.org
X-Gm-Message-State: AFq9FYK8itgrrLe6DsC/3ZvZWNaSEEUyE50YN3MmkvpxNvUsd3W28xZy
	M6WWc8M8IxF86Erwqfcc7PbZoJgLmPM1LdGMSV9zvntGoRvRFWS1YYz2rx70/b9E12KdHmQRRo0
	6fy3O8ANHnZpDfCmOoNMgCwCLkffeY51zR6FKau6ts9NzSJxOQGMMhTo2rHU/okke
X-Gm-Gg: AYBFou3bwGs2ybjj5Ak7wI+nX7zJJm7foKvm7fzja8NQAVzGDIw1C+WIq/FmW3EM8zH
	2ESqfo2w+uJ/clD2rrbKfnYvYFqmp5bWi7ORdg68E77sQM+hCGyjuvBJp9/rs8rSyqezosqQ5HJ
	Um6soVWKkK0yb67HSix3wKrZ6A3ivB22QloW0dqHFa9szY/lxLNblzFSoLqQwnXYxyU+y0p2sUG
	cOdzIOmtpt8ZowcrPi2QJJeillXOyz7n1o4cI5avRlF9OhLDRJ8FtfBrGhQGdqaDzjVTxc0a/u4
	4OjUQ9AniSqzx18H4/hKv6FQRQhZtVyweu5JzL57D0QngAGiGAYUy8lkOHbBfvsBdha4rLGPAUG
	OdGEs8rNgiIw0rEruh8lhlpAehIpgtsM0hxYoAFMLQiCcZ+A8VgNICfpV8PQWPvkiSklCq/A=
X-Received: by 2002:a05:622a:e18f:10b0:534:7732:a141 with SMTP id d75a77b69052e-542b443eb72mr25305991cf.2.1793350150269;
        Fri, 30 Oct 2026 01:49:10 -0700 (PDT)
X-Received: by 2002:a05:622a:e18f:10b0:534:7732:a141 with SMTP id d75a77b69052e-542b443eb72mr25305731cf.2.1793350149640;
        Fri, 30 Oct 2026 01:49:09 -0700 (PDT)
Received: from [192.168.226.64] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6b4d7a4eac5sm382210a12.5.2026.10.30.01.49.06
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 30 Oct 2026 01:49:08 -0700 (PDT)
Message-ID: <36a18bbe-7a2c-422e-82ad-b9d1d87900bf@oss.qualcomm.com>
Date: Fri, 30 Oct 2026 09:49:05 +0100
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] arm64: dts: qcom: msm8996-oneplus-common: Drop LVS2
 voltage constraints
To: webholt@gmail.com, Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, stable@vger.kernel.org
References: <20261029-op3t-lvs2-fix-v1-1-42ca9d992c20@gmail.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20261029-op3t-lvs2-fix-v1-1-42ca9d992c20@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=KsrYSmWN c=1 sm=1 tr=0 ts=6ae45a07 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=pGLkceISAAAA:8 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=nlTkBPkjGgE2AyCPopkA:9
 a=QEXdDO2ut3YA:10 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-ORIG-GUID: S5NrSysmIfaCL2BpJ6rC-hjLc_Xey7bX
X-Proofpoint-GUID: S5NrSysmIfaCL2BpJ6rC-hjLc_Xey7bX
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDMwMDAzNCBTYWx0ZWRfX/+ybIoRZCWw4
 6OSCySHEqLVuIRLz3BzfdNiTIcm3VT2i+0/rnqCR6urbhBcJRVfoUNXJXaSJV4AQl+VbmxwiAN1
 wKoDhkld+xPTgsKdNOKdHRZebRNJeLGfepzPCZzxaNJ/fMijhWfu5l4HtU8nfRHuX1aC9ESeS0w
 3vJUxWUS2a7/NGXy8TvO62TJyKLnC469hO6yfn/gTtI0ITfSBIduhsZYaWPwPaEasEdPsxXC8J1
 wgNWRVLphxjPuhxtIbfTrZFfZ6ZYm2Z5jaM410acla8H/yPJMdfJ8NrlrBQGocDhKOD9wAfNNew
 EQBpAQwBIMWFrq/oydzZYOs/D2eWOKpCWRksF7R67BUgLXAsbsCEvwlkKDiIrJOEAhgmWmW4WyJ
 VvOLirFE7KipW3oJMb2AuyBBiXBAHrtYnxidPBqOLUVdR6CGRai8IzYoDou5/Ojo42ScuU4jr7F
 XD/AZrYnIr23R4OvByQ==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDMwMDAzNCBTYWx0ZWRfX1a/RQzAovJtL
 /30NJE91S9ss/1FrnSVN0BDBB0//xdCHl8OykNUjvxKAPy7opueW8c1TED4b6h38xTi6zq1oSr2
 erLmBHVT33iE7ZS9jHlQJweN9d+iYkA=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-30_03,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 phishscore=0 priorityscore=1501 malwarescore=0 suspectscore=0
 lowpriorityscore=0 impostorscore=0 bulkscore=0 clxscore=1015 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610300034

On 10/29/26 7:12 PM, Vladlen Grachev via B4 Relay wrote:
> From: Vladlen Grachev <webholt@gmail.com>
> 
> Since commit 27880745470a ("arm64: dts: qcom: msm8996-oneplus: Add SLPI
> VDD_PX"), OnePlus 3T no longer boots: the PM8994 RPM regulator device
> fails to probe, so UFS, USB and the display never come up and the phone
> hangs on the bootloader splash screen:
> 
>   lvs2: failed to get the current voltage: -EINVAL
>   qcom_rpm_smd_regulator remoteproc:glink-edge:rpm-requests:regulators:
>     lvs2: devm_regulator_register() failed, ret=-22
>   qcom_rpm_smd_regulator remoteproc:glink-edge:rpm-requests:regulators:
>     probe with driver qcom_rpm_smd_regulator failed with error -22
> 
> The switch LVS2 cannot report its voltage, so the regulator core asks
> its input supply, vdd_lvs1_2, which is not described on these
> boards. Checking the 1.8 V constraint then fails with -EINVAL, and the
> RPM regulator driver aborts the probe of all PM8994 regulators.
> 
> Drop the constraints, like apq8096-db820c, which describes LVS1/LVS2
> without them. Keep the node, so that the SLPI still gets its px-supply.
> 
> Describing vdd_lvs1_2-supply as S4, as done on other MSM8996 boards,
> would also work, but it would only serve the constraint, which has
> nothing to enforce on a switch.
> 
> Tested on OnePlus 3T with the msm8996-mainline kernel based on v6.19.5.
> 
> Fixes: 27880745470a ("arm64: dts: qcom: msm8996-oneplus: Add SLPI VDD_PX")
> Cc: stable@vger.kernel.org
> Signed-off-by: Vladlen Grachev <webholt@gmail.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
