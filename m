Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 502FF365A06
	for <devicetree@vger.kernel.org>; Sun, 29 Mar 2026 14:22:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774794165; cv=none; b=eYoiesAVTZhz90RGc/RhrrdzzTksMGrMXJN02iQjqP28KReGEnOYdSWKo1Q0O6HFKFHkwbHIYTai0LPqZ22lQFkihgMVmjjuCqNZS0mUeFWpcD9hvqcesLesOR0Mm3T8tqvlyHH/jlgFFSkomcJNCj7cImwQTy7/luiGl78B0Nk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774794165; c=relaxed/simple;
	bh=XSUC4NMsAXmUyEOEJMrdlZH2bNXEHKg4oeOtFKrew44=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=PL6TidjTPxvdfsuUHKwkh/Wx3RT1WALngmdnXks82FrMcxKBye793Ob9prZuZy5izAEhF6VlvnJ5FzRvgxEvd6bHKLtg0IoqUYrg/f9FVshz8B5teoq7F+QkkNaRg6ZGQ/d3WAw2Ti8wM5jDhM06YgJgq3wuICZCDhZMQ04/tPU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=R7zHcMk5; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=NtDn2yqu; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="R7zHcMk5";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="NtDn2yqu"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62TAilxa868020
	for <devicetree@vger.kernel.org>; Sun, 29 Mar 2026 14:22:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	RrYdKvA6dq4fMVlfGeuN4j6WoQepxW9VI7NHrNJSlGU=; b=R7zHcMk5Td0bx52n
	5Y8F5h4m4B8+tx3yD7CseXddsjOhpic5GqoNrTAFOmkfYHnMCOgHaQKOkT8XNvH7
	rVqxOFCys3RJzvyu0FkbSX6X9SlUFruFioJhIbEuhoYnbolfLeEFfuUOWDVxi0RE
	ndvG5NhFQSxcellueSa/WHebdp/MSXoBQF62cgDxn9Je6YotZiWBp/NSp3pQFICE
	gNfeFwRXAsxR7Br0FSyVPVONIM7IVXr6ooiHNWcXz5fx0KPizuJbEs4XwO07sgMe
	hGe/gAB4W1axWlBad7FYD7BWEaHfI/qFih1hY3/z+vgYfijXWdRmGqCLj7y40VW4
	kgQm3g==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d685hau77-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Sun, 29 Mar 2026 14:22:41 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2b24af7ca99so9870985ad.1
        for <devicetree@vger.kernel.org>; Sun, 29 Mar 2026 07:22:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774794161; x=1775398961; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=RrYdKvA6dq4fMVlfGeuN4j6WoQepxW9VI7NHrNJSlGU=;
        b=NtDn2yquKjXLnq0ZdhY6Q7YthoOGHJks9+SEngNj96rQ/AUUynRGrAQ/VW1lDtlasM
         5kyZnrZIcvzvyn526eyYW63ymw37C2kOOuYAnR76e8K2zpEmPpn+GKHG8DIz7XQ4PJkW
         5LepXQ0LlkWX038R4Y8SFLQNBA3zNILgxXtSmPa/E1Y6cwxSvEbiy4ku+FdwivgwYYnR
         XOkwMbErfMLufLHehzP+RJK/vBc8SRYbGx0Y8YuCV5A36uJHvjhCTKfvP9rom6Um9zAv
         EOhBM8dAOYwC+ZaeaZvD2oikQ5297xXbjbx+UZ1sGNTBi5VzW4Fe2sZMgtbHo7Qosgz7
         EReQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774794161; x=1775398961;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=RrYdKvA6dq4fMVlfGeuN4j6WoQepxW9VI7NHrNJSlGU=;
        b=BBhULZGw6NHi0fMRN/irbCpkz4GK/Wb+tLrEtRFf8/8F1OmQRE/HVbLokGrymZsp9P
         80dwaFu4afiusww9ZIn0RhX8GNOp6xHlwNagpGL+nJJ2Kxhh+ungqYU4mwi+y9as1DAg
         3pwl2tw+eYWpBivlbf80XW1HfEsvyzuha6y1D/dVnwlxYBEqw3mfDev2yGpJIsKAOLAs
         lOcU8HfY72jsoj/+/Ia0BEala3pUjQRmgh8q8zCWI786QUFZ+/4uUixYSbXylv8G0U97
         1Gmajlh4VuYvwn3nRb0taXb5B1yVTp+nlrlyjKeWxVt/3J1eJltFHv86laM4pNqEH3pV
         dUyw==
X-Forwarded-Encrypted: i=1; AJvYcCU/67zfJk8OprJYRdOgQwNX1dtUhK73xHew8+5V9/9bgk4TUgh2N/DXbb5Dqy6gkNlcCgRp4cIm4duN@vger.kernel.org
X-Gm-Message-State: AOJu0YzDWLA8+Gx27YX5p9pH2EoLLSrBr06eSGIbJgsXWyCwU8Yk8BCT
	i8VYHokuH1zHW53Mc4ltB9imYa6Bh048lMaUzMR3sIW2cHFqSuc8bYG6QB8FiFEqT/d8CGww5o5
	TfFCu/AHqZBTTFSMjxzEhs9L9ckdbL6doPY+CFYgXwgTRgp5dC6a99+l4G/fY3UIk
X-Gm-Gg: ATEYQzxR76AnUVHevj7BRl5vVAxi880iPc1ccX3dtpH4HPhrwfdpzGRNprjvgxrswH4
	y7aJ52LJj5gzlDnFuJ3K5gHaR7KFziW6RlFVjI+VoPehfE7TbhNf8nLC7qEBs4fkV5B1FloCvVd
	NLn35Farm2Fg9nKMQL0e1EKHhF4TmxLSZSTgxnseaCyM6pxLAzrWfcStCvxfSNKTUBjL9w/Q4OO
	4ytx2Sthr3zqol5SFaeL6CUj4ab24/4NrS6S/3/f/8y1gg4vFW4FX1q5eO8cb55JPtYHyDMs9Xe
	msDtUiOb3GlIGfh/8AiPDwJv6slx0fVLZIuJhPCE6zeOvJuIKzGOKeSm9ycIrS9s28sRTDRTLtM
	q05LSaj0kkjUEeih4TDHvbRSL/h5EcONe6j6WsAWAzJM9
X-Received: by 2002:a17:902:e752:b0:2b2:481b:de5f with SMTP id d9443c01a7336-2b2481be145mr42523315ad.5.1774794160691;
        Sun, 29 Mar 2026 07:22:40 -0700 (PDT)
X-Received: by 2002:a17:902:e752:b0:2b2:481b:de5f with SMTP id d9443c01a7336-2b2481be145mr42522985ad.5.1774794160163;
        Sun, 29 Mar 2026 07:22:40 -0700 (PDT)
Received: from [192.168.1.11] ([106.222.233.0])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2b242642864sm57481155ad.12.2026.03.29.07.22.28
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 29 Mar 2026 07:22:39 -0700 (PDT)
Message-ID: <45cad9a9-8bb3-4174-aa5b-7a7cb3b7603e@oss.qualcomm.com>
Date: Sun, 29 Mar 2026 19:52:26 +0530
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 0/5] Add driver for EC found on Qualcomm reference
 devices
To: Anvesh Jain P <anvesh.p@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, platform-driver-x86@vger.kernel.org,
        Maya Matuszczyk <maccraft123mc@gmail.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Abel Vesa <abel.vesa@oss.qualcomm.com>,
        Gaurav Kohli <gaurav.kohli@oss.qualcomm.com>,
        Sibi Sankar <sibi.sankar@oss.qualcomm.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, Hans de Goede <hansg@kernel.org>,
        =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Randy Dunlap <rdunlap@infradead.org>
References: <20260327-add-driver-for-ec-v7-0-7684c915e42c@oss.qualcomm.com>
From: Akhil P Oommen <akhilpo@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <20260327-add-driver-for-ec-v7-0-7684c915e42c@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=csKWUl4i c=1 sm=1 tr=0 ts=69c935b1 cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=LIJ1G+IszuYCLGPi0MaIKw==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=pGLkceISAAAA:8 a=fry5UZEslz7zTkt23a4A:9
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzI5MDExMiBTYWx0ZWRfXzlNmuJxmj1sb
 IHZtJykK7EwxpoBu5FpY66znzq307M8haewwUc5t45TZ2rAXvBqmdCYvleZdFsR0itwPsuds5NP
 Otwog+S2ZGLLa3LSmHkKXfXcfFl2Qbw9vjA24H6L729eOO3tlRvOMpqikLllGGlHGNubPeQ6GGi
 BcdSXwkxi6CPnbWNFMpBXewQF7zdxmjvRz+sGLyjhj2Q+Wr3bVVNH7fyKanlurOUWbsBTuqFYy1
 PM3M/z2lJzWUQatoCnVVvdXPqmHw6GvLkjYFEh5PrsaPxbuhbWqQgyDmbggpzbs29CF9MpXoFO5
 xj7EqVjGlKIBqcJ81pfF0qoSj97MUHAAdckp2v9FBZ9hwa9SjBC413rjVYJUHERlapOwtuHfrLD
 +dXwYqA30wZKZvwppmDv+CXDVnpH9j/O7DJKgGfxYXmAb4avzKZIvuPou0iMXhTMYPitfIniHGV
 29J2qD7oYNOjALJA3Hw==
X-Proofpoint-ORIG-GUID: eeLkLZLVeZSAdD9NjaqOtP8QdB2NnefN
X-Proofpoint-GUID: eeLkLZLVeZSAdD9NjaqOtP8QdB2NnefN
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-29_03,2026-03-28_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 malwarescore=0 clxscore=1015 adultscore=0 impostorscore=0
 priorityscore=1501 bulkscore=0 lowpriorityscore=0 suspectscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603290112

On 3/27/2026 3:38 PM, Anvesh Jain P wrote:
> From: Anvesh Jain P <anvesh.p@oss.qualcomm.com>
> 
> Add Embedded controller driver support for Hamoa/Purwa/Glymur Qualcomm
> reference boards. It handles fan control, temperature sensors, access
> to EC state changes and supports reporting suspend entry/exit to the EC.

Just a question, is it possible to force fan to run at full speed
constantly? That would be helpful to keep the passive cooling minimal
and get a more consistent results while doing performance profiling.

I see that you are registering a cooling device in this series. So I
suppose we just need to update the cooling sysfs nodes.

-Akhil

> 
> ---
> Changes in v7:
>   - Fixed alphabetical ordering of MAINTAINERS entry.
>   - Link to v6: https://lore.kernel.org/r/20260325-add-driver-for-ec-v6-0-a8e888d09f0f@oss.qualcomm.com
> 
> Changes in v6:
>   - Add missing includes: <linux/bits.h>, <linux/device.h>
>     and <linux/err.h>.
>   - Change the thermistor_mask format specifier from %d to %x.
>   - Change loop counter to unsigned int.
>   - Replace snprintf() with scnprintf() for safer string handling.
>   - Use sizeof(name) instead of the EC_FAN_NAME_SIZE macro directly.
>   - Add missing braces.
>   - Link to v5: https://lore.kernel.org/r/20260317-add-driver-for-ec-v5-0-38d11f524856@oss.qualcomm.com
> 
> Changes in v5:
>   - Fix subject line and commit description, drop redundant
>     "bindings for".
>   - Rename binding file: qcom,hamoa-ec.yaml → qcom,hamoa-crd-ec.yaml
>     to match the compatible string.
>   - Update $id URI to match the new filename.
>   - Add <linux/interrupt.h> and <linux/slab.h> includes.
>   - Switch to devm_thermal_of_cooling_device_register, remove manual
>     unroll loop.
>   - Ratelimit all IRQ handler log messages.
>   - Promote unknown EC event log from dev_dbg to dev_notice.
>   - Remove redundant error message after devm_request_threaded_irq.
>   - Simplify qcom_ec_sci_evt_control, resume, and suspend using direct
>     returns.
>   - Add dev_warn + early return for zero fan count; driver stays loaded
>     for PM notifications.
>   - Fix thermistor presence bitmask documentation: 1 = present, 0 = absent.
>   - Fix snprintf format specifier to %u to suppress -Wformat-truncation.
>   - Remove unused cdev variable from qcom_ec_probe.
>   - Fix typo: "exluding" → "excluding" in register map comments.
>   - Fix capitalization: "ec" → "EC" in error messages.
>   - Link to v4: https://lore.kernel.org/r/20260313-v04-add-driver-for-ec-v4-0-ca9d0efd62aa@oss.qualcomm.com
> 
> Changes in v4:
>   - Fix fan count calculation to use min() instead of max() to correctly
>     cap fan_cnt at EC_MAX_FAN_CNT.
>   - Remove unnecessary mutex lock/unlock.
>   - Disable fan debug mode on ec module removal.
>   - Fix issue reported by kernel test robot.
>   - Consolidate hamoa-iot-evk specific changes into hamoa-iot-evk.dts.
>   - Add board-specific compatible strings as per review comments.
>   - Link to v3: https://lore.kernel.org/all/20260308233646.2318676-1-sibi.sankar@oss.qualcomm.com/
> 
> Changes in v3:
>   - Revamp the bindings and driver to support generic ec specification
>     that works across Qualcomm Hamoa/Purwa and Glymur reference devices.
>   - Add ec nodes to Hamoa/Purwa CRDs and IOT-EVKs.
>   - Add ec node to Glymur CRDs.
>   - Link to v2: https://lore.kernel.org/lkml/20241219200821.8328-1-maccraft123mc@gmail.com/
>   - Link to v1: https://lore.kernel.org/lkml/20240927185345.3680-1-maccraft123mc@gmail.com/
> 
> ---
> Maya Matuszczyk (1):
>       dt-bindings: embedded-controller: Add Qualcomm reference device EC description
> 
> Sibi Sankar (4):
>       platform: arm64: Add driver for EC found on Qualcomm reference devices
>       arm64: dts: qcom: glymur-crd: Add Embedded controller node
>       arm64: dts: qcom: x1-crd: Add Embedded controller node
>       arm64: dts: qcom: hamoa-iot-evk: Add Embedded controller node
> 
>  .../embedded-controller/qcom,hamoa-crd-ec.yaml     |  56 +++
>  MAINTAINERS                                        |   8 +
>  arch/arm64/boot/dts/qcom/glymur-crd.dts            |  22 +
>  arch/arm64/boot/dts/qcom/hamoa-iot-evk.dts         |  16 +
>  arch/arm64/boot/dts/qcom/x1-crd.dtsi               |  16 +
>  drivers/platform/arm64/Kconfig                     |  12 +
>  drivers/platform/arm64/Makefile                    |   1 +
>  drivers/platform/arm64/qcom-hamoa-ec.c             | 451 +++++++++++++++++++++
>  8 files changed, 582 insertions(+)
> ---
> base-commit: 85964cdcad0fac9a0eb7b87a0f9d88cc074b854c
> change-id: 20260309-add-driver-for-ec-3fa478f264d9
> 
> Best regards,

