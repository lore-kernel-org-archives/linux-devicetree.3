Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D554F2E88BD
	for <devicetree@vger.kernel.org>; Sun,  7 Jun 2026 07:51:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780818661; cv=none; b=AWwoJX+AxXmMYNTmP+0pWB6eTAg4g5B35tTO8HWGSz57dmE7KUW6dwFVynmHwYVYcjA4EAEvolqJz0C3dxj0H/YecjwFhcGdaZrmcUtyVb+u58/D+bFmod33vPXAdfUnFm0jKEA34dva31x4L3gbk6izO3ZpbPURW24sskGyoj8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780818661; c=relaxed/simple;
	bh=l3TWZ4OZ3V2jL7Kfjaqed1mPLebXCr7LdftihqcoIjg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=OERng/8IwTc2HiSVq9iyQ7f3pq5PV1wIRIEZuGZJgWBjWM8uMQGFJ2o9YxScpUgHFCzTllknQapsP9l0CcmD1CiSCfspU7/z04oSZ3S++50bsIwfpbQomgiXFuxGlR/Q4RG5Uva53LSZ1xXy6KhgrTSSp5HGsyb5PEEUFe2GyAM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=k/GUTTev; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Jqk8YQRY; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="k/GUTTev";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Jqk8YQRY"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 657795ed3721098
	for <devicetree@vger.kernel.org>; Sun, 7 Jun 2026 07:51:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=iE7PRNG1OJYshR7GaCLN5SGU
	I7asLqXbDQM8lMANVPc=; b=k/GUTTevzM9pg8za5zo6EUTbBp01Ylt6nW/8OjnW
	pOOBPfBpKGC/1h2ogHMxL56V9NJdk5YOKrgbUWkEqw8qAe/lyLrRg6b6cMSOQ64l
	qhBV5JMwg4zpD5bEe9otcV1k1kZz2JzjnVMqQJHmQyUqL1UhnY81qQVp35r78yCp
	O3Sfm08RvhXZBzuHDfyTjuIYPTA76T2C4Aj1Y89Pr5CBfGmi6bxmUyZM3hN9MWXK
	4lXdOLgIiwbUUJcv216xWFokhnvOJt8Puix5UFsgYff/pPvxfEk94Dlwvg6IoP2c
	Uacz526f4HgEZQAx3uYLbmzPhWxSOvk7oyUuFjZogLVQLg==
Received: from mail-ua1-f71.google.com (mail-ua1-f71.google.com [209.85.222.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4em98cusnu-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Sun, 07 Jun 2026 07:51:00 +0000 (GMT)
Received: by mail-ua1-f71.google.com with SMTP id a1e0cc1a2514c-963bc9a24f0so3372049241.3
        for <devicetree@vger.kernel.org>; Sun, 07 Jun 2026 00:50:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1780818659; x=1781423459; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=iE7PRNG1OJYshR7GaCLN5SGUI7asLqXbDQM8lMANVPc=;
        b=Jqk8YQRYxXboRIk0zpAu8D0YBjojDQQK5fJAP0lMRdImgWj3uAJIw7VgGcOg1ZZldO
         ELu5kE5O8GYa8U6IY0wKWBzmV0IqM6iRSILLmU4HUy9biZzx0FizaBYIMxxNJ3WI0KqW
         R2FTq05Rm3XJ1s27GUodAHO/8NsVicyG3wtgnO4LUjMUPB7mp0yn2jwtPCdWow9BCnn8
         PhDxL79dWD04QkSE+FZrFoe3ASNhr1FJZJYP4sd3yhhsg7J0Rk+DBWpJKylLfT7VQdgX
         VJBtQRCnUO/RoTT0RCYqccrJphE1t9AEFePvhgWOorBVdoWHv/nrGoVfTG06TegjQoBy
         A9VQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780818659; x=1781423459;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=iE7PRNG1OJYshR7GaCLN5SGUI7asLqXbDQM8lMANVPc=;
        b=b3q7ozylTlTutF9vxO66RQZraC4mXO7+nqsqGH1SRJ6Qsc+3pxWQIrjZmgPVJHmwBh
         BGlGRace+BwSz6rLMDroXBY5jnuMpn7guoyb03XgTKHOy+IrsL91lrsQcOrPSn2tqQS5
         DiaM3hnwr4PNxUc+QZdtA7aVMGfaRTH5ljmj0f8W4aX4FqWif852nCcfs0C3gcjbeZcy
         7QWQ+6rA4VYuLS+bg2z63cxWxmaZ2gni+EB5HpURsZCn92yXY8NrevgVwOkf1YZSXa+H
         KqDXPADTW+iHAJTp+1qj1zaNdrJQsHuRqoPWKvH6h1L/TJi6AbbJWkb0ogi5ik7dRL9C
         zJdw==
X-Forwarded-Encrypted: i=1; AFNElJ+9/FW0n4aV0HV3+5Hit+9ay0oPd1LxoEtA4RU+yKQCfOaDlQwK26muv7tVY29nNfNx/CJ1XbAUGtAE@vger.kernel.org
X-Gm-Message-State: AOJu0YwW6mC9GpepoO8EGC9wARems5/VBv5ONyhMEHFr5+g1r2PWawiY
	juuCAux66DZWsgHNUd9TQF2cDr98IEiL374mK8kXyxB//fiRN7QqP3wDJFViG5Zu0vP5Ybznw2Q
	hz9jsK3hmEsU501vwzS7GQ6Ty7w+kx/SLVWGY3FnqBj1veGXaOCpI2wxfYBgYX3TR
X-Gm-Gg: Acq92OF7B2m4mV8ECAplXbi8DYBLXWMBOoKc0mbk1TW/rRrPA7qN1cDwxynP2TR7ODG
	mmlqAPXAl3DTto6ujN1Hi2PbKH7YU1OIAiDKQuQkC7BPVcNneV+82gai3CiarMsoxamKhUomED3
	QuDy9z3VcaqrN5R7uheiWZECTXRbMfPsXPoX444Ilh/mdNW23e+z4j7FwEKMXWe830V0O8j2rME
	279MGCFS41gTap7kKoPhwN3eumOeZ3Ri9zvoLXtCvattMK9lepnv4L4iCc6rAz2+Wd3Fmie2Atk
	7yqfCVC1GDomtM46jd8VCODQEp87xeJKhEKdv5SulplNlXX7qd2QiumeZPJO7lCFwW4JsKOEtOR
	iUeMVYN3WwDzrzysfYRdCnx3QjccMrnsolV7QY/++nKmq10ABlFtSqAHz1aHy7nmhWNuafw6XAj
	zcBFNvC/JESvnCvoA8k9j3RmnDu8KQNiDaNMsnMi1qRWCRYw==
X-Received: by 2002:a05:6102:809b:b0:6ef:f681:d914 with SMTP id ada2fe7eead31-6fefb0a250bmr5275743137.22.1780818659086;
        Sun, 07 Jun 2026 00:50:59 -0700 (PDT)
X-Received: by 2002:a05:6102:809b:b0:6ef:f681:d914 with SMTP id ada2fe7eead31-6fefb0a250bmr5275735137.22.1780818658767;
        Sun, 07 Jun 2026 00:50:58 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5aa7b8ed8e0sm2923730e87.2.2026.06.07.00.50.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 07 Jun 2026 00:50:57 -0700 (PDT)
Date: Sun, 7 Jun 2026 10:50:55 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Hongyang Zhao <hongyang.zhao@thundersoft.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        cros-qcom-dts-watchers@chromium.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        rosh@debian.org
Subject: Re: [PATCH v2] arm64: dts: qcom: kodiak: Move PCIe GPIOs and PHYs to
 root ports
Message-ID: <l3s2ghhsotwmc74rugfrgwnpfveixqca3ri5ailraamjkn5kbs@2bju7ifashhg>
References: <20260607-rubikpi-bugfix-next-20260605-v2-1-7bf229978bcd@thundersoft.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260607-rubikpi-bugfix-next-20260605-v2-1-7bf229978bcd@thundersoft.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjA3MDA3NCBTYWx0ZWRfXxK//ZCWqH77w
 xq1PiV7GAQ+unhm6wpiww5Q881Ya8hdo6Dj+4zjX1Uc4/y7bHjUlsNYQsyX+yJ8imt/UU+Tl92g
 qDtCaRFEgO6U/9SYHk1yqL1mwedWN2msVe4eOYiaNn+Y2FdKpIeVsascCiVK8Q65jKLOfX2ZpmH
 IkYecnN9bQSu9SoI/R69Gc4S3a7rxcoNz89xoHr3n9bhtXBZzzgZXkxDgQBDR3zluGiVo67cOUS
 J43ku9NwSASj2z0mpC6l/Z0qo7JpMPj/ErXKlHepXR1KG3d8uabLJDtr+r2udFjTMJosE/2OCyE
 6Q8+kI7dg06Q1Ce+mf4JE1Xqd2cik/G2duAHTKv2aQPPCrkDdMOY+b6PF07FHl1mVapy3Y1VcwJ
 HM3bYZ9mowxpcPlVX4hU0lnrXBPRjbmdtLEtesx8Nqbm/LW1O9mCN4aymNFrVgss2b13qzZtfXz
 0GcygxfyRdEdxmRE5Cw==
X-Proofpoint-ORIG-GUID: tvthUdb4cuDj8yZUJ5EqMKyD_tBgWATh
X-Proofpoint-GUID: tvthUdb4cuDj8yZUJ5EqMKyD_tBgWATh
X-Authority-Analysis: v=2.4 cv=A/pc+aWG c=1 sm=1 tr=0 ts=6a2522e4 cx=c_pps
 a=KB4UBwrhAZV1kjiGHFQexw==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22 a=Wdb1h0LgAAAA:8
 a=EUspDBNiAAAA:8 a=XRupbPVGphp0XdZxmlIA:9 a=CjuIK1q_8ugA:10
 a=o1xkdb1NAhiiM49bd1HK:22 a=j5gyrzqu0rbr1vhfHjzO:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-07_02,2026-06-05_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 suspectscore=0 bulkscore=0 spamscore=0 malwarescore=0
 adultscore=0 priorityscore=1501 phishscore=0 impostorscore=0
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2605210000
 definitions=main-2606070074

On Sun, Jun 07, 2026 at 12:17:26PM +0800, Hongyang Zhao wrote:
> The Qualcomm PCIe binding deprecates perst-gpios and wake-gpios
> on the host bridge and expects board reset and wake GPIOs to be
> described on the root port. PERST# is described there as
> reset-gpios.
> 
> Move the PCIe PHY references in kodiak.dtsi to the PCIe0 and PCIe1
> root port nodes, and move the board-specific PCIe reset and wake
> GPIOs in the Kodiak DTs to the corresponding root ports.
> 
> Keep the PHY and GPIO resources on the same root port nodes so the
> Qualcomm PCIe driver can parse the root port binding instead of
> falling back to the legacy host bridge GPIO parsing.
> 
> Signed-off-by: Hongyang Zhao <hongyang.zhao@thundersoft.com>
> ---
> Refresh Kodiak PCIe descriptions to match the current Qualcomm
> PCIe binding guidance.
> 
> The series moves PCIe PHY references from the host bridge nodes to
> the root port nodes in kodiak.dtsi. It also moves all Kodiak board
> PERST# and WAKE# GPIO descriptions from host bridge nodes to the
> corresponding root ports, using reset-gpios for PERST#.
> 
> Changes in v2:
> - Refresh all Kodiak DTs instead of only the Thundercomm RubikPi3.
> - Move PCIe PHY references to the root port nodes together with the
>   reset and wake GPIOs.
> ---
>  arch/arm64/boot/dts/qcom/kodiak.dtsi                     | 10 ++++------
>  arch/arm64/boot/dts/qcom/qcm6490-particle-tachyon.dts    | 14 +++++++++-----
>  arch/arm64/boot/dts/qcom/qcs6490-radxa-dragon-q6a.dts    | 16 ++++++++++------
>  arch/arm64/boot/dts/qcom/qcs6490-rb3gen2.dts             |  4 ++--
>  .../boot/dts/qcom/qcs6490-thundercomm-minipc-g1iot.dts   | 14 ++++++++------
>  .../arm64/boot/dts/qcom/qcs6490-thundercomm-rubikpi3.dts | 16 ++++++++++------
>  arch/arm64/boot/dts/qcom/sc7280-idp.dtsi                 |  5 ++++-
>  7 files changed, 47 insertions(+), 32 deletions(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry
