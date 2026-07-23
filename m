Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1650D1A0BF3
	for <devicetree@vger.kernel.org>; Thu, 23 Jul 2026 02:42:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784774525; cv=none; b=Bkb8QZ+tGY4sDfehpXKlLR71kujqJuOcMmVnXOV2NSHhw5v58A7/05QQlcncv5pPuTBgEpCT+GVljEjqtcTE9mFig6/Mf++MaA4rC5S07NzVF76fec4xydA1+LC10cvogyQVOsAf0JQ2ysGnz0ZRA8rwMx6DbJeTK42UxrZLGK8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784774525; c=relaxed/simple;
	bh=gxjGPjmSz1vW7zel+2ORlINXP5pnBuOm3+zMsz6kbqo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Q1d/F/mHAxIavQu8TaiR1EX5BONu3fVXv3IEBvZrulM6oDBYIN8WxXcqfYk8/SZnWjKvhTuWJ/itULbdYLEHam2WuhoveCpRmJ+2hBKtdlA/W5/WcQ2kR/kMghmRvBdicFqAQTHmmbn7NRpvi9UYuyE12HbmY+exVn0dvPoZLXY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=KwYPufiS; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ZWNtTQ8k; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="KwYPufiS";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ZWNtTQ8k"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66N0Xb2W2479143
	for <devicetree@vger.kernel.org>; Thu, 23 Jul 2026 02:42:03 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	iYgpgOZ7PLgQDrFNyTVWW8qUD7STH6qW1+QOGOGINmk=; b=KwYPufiSkjn5lxtn
	i6sUyVY/1TAuxucm5ZyDrYnDF7QgfEyTc+pHw2GqAZ6b2jR2ZNs+7PNcRMovmqzt
	piV0wAZdCy99TIYd6RMeTF6uTUGKV9Ne1X+5loAFToJmpO/lo6qx6EmB5K9q77Lx
	BwO6X6cbn/JLvZO/CeNfZGIz0JyeMEP6uGyv1S43R1V00GuoLvhAnnTz9g1Nntfw
	OwCFT4DWH57063fUm7qXawJ9HTUrn0sigkNm0GPNDkoDWAW1gGRUv8eHTFojnVCo
	0o7qv/RmHPYutVpHBXAHuGLUKm7HPafvZvExFS9WVYMDGaRMHsCBwL0sw5oLwjGq
	TScmJg==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fjuu7bnqt-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Thu, 23 Jul 2026 02:42:02 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-92e7ee64b25so28786385a.0
        for <devicetree@vger.kernel.org>; Wed, 22 Jul 2026 19:42:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784774522; x=1785379322; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from:references
         :cc:to:subject:user-agent:mime-version:date:message-id:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=iYgpgOZ7PLgQDrFNyTVWW8qUD7STH6qW1+QOGOGINmk=;
        b=ZWNtTQ8kQzk5poBDAfBzc98vR0EzxE70pwHczwX9qfNzo4BpOT5ikSYja8As01pTnz
         c9NYbeyYp59cdqsB+uDtRiMJ3kwpzNWFgRHhgjUiCnf6OodeRYM9sAL8hSmxvV9d3ksq
         faA7rOrqxWKLRpfSBb+DWHoHYIK8nQGHPiuNTTnZ44unOC4Z1dBETKyFNBISY1AcN3sM
         ZbAqNKl2xkg9emHIcX7to6nkFagKcJOGm88THnzPk+omBcNXvL42IFn8OOqXHiPFDU6r
         9nfvkkou8eyrWWRdSu8i3Slo2y3j4kqkOKJOQ9xSyEcA1zx3A/xHGwB4eZAspWr/8td+
         7Lmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784774522; x=1785379322;
        h=content-transfer-encoding:content-type:in-reply-to:from:references
         :cc:to:subject:user-agent:mime-version:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=iYgpgOZ7PLgQDrFNyTVWW8qUD7STH6qW1+QOGOGINmk=;
        b=mByVFTdIJ9l3nY7yNbB/DHCIJ3iK51urNaiMFOp2u3TGXrSIH5vJe03jan9Ck6mo0a
         U8ga1NZLqMfuHNHirO7XwvCDxP3O0/I0kxEypmTdTBqjsq6OqnzBI3dupbjtLQ1j+sEG
         0Isl5B3aRTnxs1MP7hoMK5xFGpNmG009bT5c5yMrN0Xxb2Qg064N/6bUw6MUo1iDxDth
         aZCecTw/I4+7k+jJvttM9uhEIKTcY26zJcbIwlckDivrV/bj7JrpwGKo8PDDmK0hjbgs
         k+40Cw4jSsrY0iyQ2I60gXDUvfdXFNmhpUlPz6xhQT124C7+LLap2oS2+zGBm0PmcfEf
         ygOg==
X-Forwarded-Encrypted: i=1; AHgh+Rq6NGukddj+rCXDPRSA2joeqtwD5V2lhBwrYpwbDX53o4VsY7MHAzqUtb4JzmtC6m8fjed+bBXiXny1@vger.kernel.org
X-Gm-Message-State: AOJu0YzylDmTPg5jlHSXR1ADwLDb2Hk9rHr/qXTelOKUYgaKdSj2gCN2
	Cvg2fez2o4KHxtr/PjPtjA4dZ2WDTKDAr+kxwjxjkx+XSawECsTxGsOHEKcDnjxOwv4jyqJlxJB
	4aeMkZl2tD0EwoJxyFqZ/q4QhCQJJ+xJYYc1m39gI/s2yIEs3OCq2td/2l+++us/TW/tZ2YMPaS
	EkiQ==
X-Gm-Gg: AR+sD11kaVYUTvTsweF3Nmd7c4095ody/y1c2Y+6DMnDTVgaUA1fporQ0STvOKdXZP/
	pUt74f7NTU3iO5a+57xlYZtudi9ijPRGwi+rj8dv9GTfsX6WF8Y5tkHup9EyEvwndJSsftCtbDh
	f3CaM4VEivel9KfTVcOGFXC9O6DVxkG6/Sd1DIvQyfGkRbaHDWKFuXiwjsgmMh1kTvTIJ7fP0ce
	Yz/P61s6usXv7VUQkGre5SddhHS1t4TzyWtkhuCEAbcTiAgZaHuDj2R/Jo96nifn5grlstofoGL
	95ZfkiTpo7FGmIXITTK975F4HgIBBPuuSbWkAAUoTZLHmd1EUyadR8Hm0Kp4h7fSV4ruob9ur6z
	WVERapGpfbyoyJhF8ZPzTjzC3PYLfbqcmU9Zo147mv32+I9x00TXqoyh9Wq4Gy++o
X-Received: by 2002:a05:620a:294e:b0:92e:c28c:9dff with SMTP id af79cd13be357-93103806f5fmr143014885a.6.1784774522357;
        Wed, 22 Jul 2026 19:42:02 -0700 (PDT)
X-Received: by 2002:a05:620a:294e:b0:92e:c28c:9dff with SMTP id af79cd13be357-93103806f5fmr143012985a.6.1784774521891;
        Wed, 22 Jul 2026 19:42:01 -0700 (PDT)
Received: from [10.111.167.143] (Global_NAT1_IAD_FW.qualcomm.com. [129.46.232.65])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-930f6879e8bsm311713685a.6.2026.07.22.19.41.57
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 22 Jul 2026 19:42:01 -0700 (PDT)
Message-ID: <f12c1344-67ff-4242-9c39-59ac208e9b35@oss.qualcomm.com>
Date: Thu, 23 Jul 2026 10:41:52 +0800
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 0/3] media: i2c: Add OmniVision OG0VA1B camera sensor
 driver
To: Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring
 <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
Cc: linux-media@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Conor Dooley <conor.dooley@microchip.com>
References: <20260708-og0va1b-v3-0-de8e44455a42@oss.qualcomm.com>
From: Wenmeng Liu <wenmeng.liu@oss.qualcomm.com>
In-Reply-To: <20260708-og0va1b-v3-0-de8e44455a42@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: 5Q0VAIxgkf206bdRF6vB2CK3tR5NlnF1
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzIzMDAyNSBTYWx0ZWRfXxZRN2zNF4Saq
 j9uQHCT4kpDgaUS5taloN2lxG2Bsgtkp2oDI0v843FaI+EQt0XIq3qZSfW6dN9e5RD5ABeEQKiW
 kbyQZnJyUlIwx5e/xGlj0DmWtHpZCRc=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzIzMDAyNSBTYWx0ZWRfX54ycS/X0WoDj
 p18U1PdY0uprvGS7EFmaMRLOjGbfZ3y6/vBui3OCowNEgFH/liYoGNlaGulWG8I27lnMLhS9qhA
 jPm5eRuXtBkBPTpvTpFLgSmgZQww1gTC6iXaBQQOtqkQuu7ry0204i25jGeMqdj6td4UgZKoo40
 yGXTXQX+4/ddmuojvrysXSIdGacNRnqltSRVKo0nlIh4WOr51RWTdmWtJo0wiTWMalKDjdu/lqe
 DPDGmXxaVgygyc0sZPAcKEEQsiXy4jNX9HYbU+V462IXrguxUJkkDtKtU2JKYwxdEjb5AT23pFp
 sCQPhmGzv5et3jVCKJx56qSwxg3dM9sANBJVUOgHZasagTdz+DTYLGDO0EphZut6NcMjn44p3mg
 48EFWYh6L880FmASyNEIZvUkVmpf9PakV75s2nKnnNWzT7TMNuMmOddtYjr/VgECJzG0h5s31NH
 kdDa966sakAZTIjSIwA==
X-Proofpoint-GUID: 5Q0VAIxgkf206bdRF6vB2CK3tR5NlnF1
X-Authority-Analysis: v=2.4 cv=JuTBas4C c=1 sm=1 tr=0 ts=6a617f7a cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=C3Dk8TwHQYyIj7nOf9RCJw==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=MB_9mUK8FT8Lwu4MbwcA:9 a=QEXdDO2ut3YA:10
 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-23_01,2026-07-22_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 impostorscore=0 suspectscore=0 spamscore=0 adultscore=0
 phishscore=0 clxscore=1015 bulkscore=0 lowpriorityscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607230025



On 7/8/2026 10:33 PM, Wenmeng Liu wrote:
> Add OmniVision OG0VA1B driver support. The OmniVision OG0VA1B is a
> 1/10-inch monochrome CMOS VGA image sensor. It outputs 10-bit raw (Y10)
> frames at up to 640x480 resolution over a single-lane MIPI CSI-2
> interface and is controlled via an I2C-compatible SCCB bus.
> 
> This driver has been verified(include tpg) on the Purwa EVK.
> 
> Signed-off-by: Wenmeng Liu <wenmeng.liu@oss.qualcomm.com>
> ---
> Changes in v3:
> - Generalise the binding title and description for both sensors. -- Vladimir
> - Keep the cached pre_isp read so the OG0VE1B test pattern still works,
> select it via a per-sensor callback. -- Bryan, Vladimir
> - Rename the "sensor" field to "data", drop bpp (derive from code) and
> add og0ve1b_pixel_rate(). -- Vladimir
> - Sort defines, rename the shared CHIP_ID reg to OG0V_ and order
> og0va1b_data first. -- Vladimir
> - Expose all four OG0VA1B test patterns instead of one.
> - Link to v2: https://lore.kernel.org/r/20260702-og0va1b-v2-0-0071442caa2a@oss.qualcomm.com
> 
> Changes in v2:
> - Integrate OG0VA1B into the existing og0ve1b driver and binding
> instead. -- Vladimir
> - Link to v1: https://lore.kernel.org/r/20260618-og0va1b-v1-0-dda71bb83009@oss.qualcomm.com
> 
> ---
> Wenmeng Liu (3):
>        dt-bindings: media: i2c: og0ve1b: Add OmniVision OG0VA1B camera sensor
>        media: i2c: og0ve1b: Introduce per-sensor data structure
>        media: i2c: og0ve1b: Add support for OmniVision OG0VA1B
> 
>   .../bindings/media/i2c/ovti,og0ve1b.yaml           |  15 +-
>   drivers/media/i2c/og0ve1b.c                        | 375 ++++++++++++++++++---
>   2 files changed, 344 insertions(+), 46 deletions(-)
> ---
> base-commit: 5c73cd9f0819c1c44e373e3dabb68318b1de1a12
> change-id: 20260618-og0va1b-55bbf3cabb0e
> 
> Best regards,


Gentle reminder to review this patchset.

Thanks,
Wenmeng
