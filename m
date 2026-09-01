Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0401D46AA61
	for <devicetree@vger.kernel.org>; Tue,  1 Sep 2026 07:34:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788248098; cv=none; b=dxrBCccJRa14SDerjH1emDV/+xvYEsp6Zrp7KXx4R+DmV0e7z3NkuNeHGIAVJD9Ku4oQ0m/nxZXvjQEFlCXGPBJ1G5/qMPdfwy8/TjVb9JJ435KqvTkspsZvEYqYvJEna3tcVC61Ej3VjkPHgZaCgysCCkB2X6iWchs2XVvaHxY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788248098; c=relaxed/simple;
	bh=MFEYPaTZXGidEsGjbCjg0usm3Cutb8p7bOkDBGDOfkU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=qVIN4KG+diF3ni6tTwYypU0UTRqblSiT3YG/izgKlZOzXjQcHL+BO5+Boeki4naQ0zO7ZFV1wCsDZsWi2N4VBFCbJf3um6NImZinhERVuxXAeGD+FKP/YVMZpIAlGRh5FYZgh+iJC14dQkAqu0rYL5wbAOPKWQyRgkk0RqZ2SsY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=aMw/nX9B; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=h03eyqKB; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="aMw/nX9B";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="h03eyqKB"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68179Q2J1811499
	for <devicetree@vger.kernel.org>; Tue, 1 Sep 2026 07:34:55 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	rGlFBkKXrHiR0rsOfALM3d2LLsNECGveEfEeOj5vR2Q=; b=aMw/nX9BJ+vV+icv
	dhQa63ToSLO3yECZlNZ1fGj9czLy7r1tK9aq5+OfXLw845Y7xhlRiONklvIcNtbb
	sNo10YHZ9XBJE6rtjZRATEmIQxdgG8uwZSIG9HG/psp7xnmGI+DtzQgrIeouh+/9
	chIKu5PmaVenFbnizFKDguWIshNSJLlhWJG4J8xPcL2LVNi4UCrbSiv1/l6fMJdH
	cOMHzJ95am8hUxuwGKgDSGPqX546TWUYzuX/I+ipwcbeFf+CSiPlmBj9MR6iKglv
	KKAr11oi/dOdFLr79vjGhTHbH3iS6NCfARrW1g1W7t63YhEKDZtJceuBBkgYdI7+
	bUeGzw==
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com [209.85.219.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gdd4duk4n-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 01 Sep 2026 07:34:55 +0000 (GMT)
Received: by mail-qv1-f70.google.com with SMTP id 6a1803df08f44-90cea0b5522so11128176d6.1
        for <devicetree@vger.kernel.org>; Tue, 01 Sep 2026 00:34:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788248095; x=1788852895; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from:references
         :cc:to:subject:user-agent:mime-version:date:message-id:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=rGlFBkKXrHiR0rsOfALM3d2LLsNECGveEfEeOj5vR2Q=;
        b=h03eyqKBmAxNs6H9oE6k3FSnu6w5rtM7tYoTTFdToE9zQBlFRM0Y6ONPsMAz1d66y0
         b3tAS5rSFVburz5ZfIu76DkqLMvxP+XSLhGcB+IsTjMDBF37wGOW4SRKHhMkhT4yN/6Q
         vV+exwsAhLvGwAIlDUzKKxZwc1d0tTiyDcvTk0JrSmoCaTfCqSyMDfiDIt4Ix+pyYsCv
         8glyPC67K5edVKvTOo34jqrgmwFsL8RqsgzRS8504syk4XLlcRWdQNofllKMO7l8SghC
         WGvudXS1tG9DH51BbqmC8GHu8AfdkBAv73+BQh3FMynek6h0/JFoEW5lpIYIKKU64NaQ
         NNJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788248095; x=1788852895;
        h=content-transfer-encoding:content-type:in-reply-to:from:references
         :cc:to:subject:user-agent:mime-version:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=rGlFBkKXrHiR0rsOfALM3d2LLsNECGveEfEeOj5vR2Q=;
        b=OX9FqTcSs2gtpgkt2DJKc2WFiDygfnxDPVsTnG5DPN5iOkR0pT1UBQDnzydHq/CR6l
         t4uNh21rGr8nS+Vhl9xCqSflv6/kTPRbGYyM4SpVdQNs11HPfIdP3HRpLO0rg4l2Lpy3
         scmtw+ZUQaGslGATjxWWnTXZSpX9NTKeqqK8s7IpbTE3U4Pc4+mMDwDPkCou2xHvV5tf
         lR47ufkq8UpNOHmmazaCI+DhbdRxTdKXrRSArU8KecgdWx3oXKNLlxRuANFZ+GMkrM37
         a5Gx8o+oMHFKZDYhzkCeIqk/urxgdY3xTyyuW+i3Y72GHy842amAu980Ls3lxJsmpM9C
         KTtg==
X-Forwarded-Encrypted: i=1; AKwUvBw2cs6qOAC5mizdBohBLNalKsIy7XOhgMnGt3ZY5DITH3lv9uHqJxO84SMQh5xftBiAhlVlLw2Bms29@vger.kernel.org
X-Gm-Message-State: AFuF++lNqj6CQrm8PQC+JYm8bgRdJEJ5B+DZVES2b+vpTzaz5GmPmKUY
	maWpvHf3XrSMpUd3U0eAX/dd1BsODg82ppFsKpg8TVZ72bc1O2qqjcxJjZPi4GT9cyXnjESE6TW
	67UU/NAiXk3SpW7IcSZbwWFufJOjI61lWjCmjIpZ4zKsFAcJC22k7iP9FG0mtZmVq
X-Gm-Gg: AYBFou3GdaSoOYo/XVTeSxm7Rr+V1mdurglUaFk78GYIgPSx5UUi8nGxuuI9rVEq9a1
	/NNFire3FEZq1Yy4nix1lZck+R45FG5dGhjC2laeT+x2t7WclrRpKLevdqcdYwRAL/d6BG9Urzm
	McuAOtE+mk/UBQYmuJkMLTiGTjpd9mSci5ojStuAY/sSrRcAQVGNxlwN+jmgKM6WEAJzWrBUVvU
	AvFAXLDxd3IMw3j+jLNwE2oeIn0av2qgLK8IPcQa8xylQ8AidwDbh/PMsvVsDLKxH2YFOuMran6
	5kkwLqH9DObaoF85s2sBg77D6bUnJLnDgmYfN4B2V/LrgInW5c4HijIMmXa7GGQKl4mHgXO6KhM
	Mlc/GqBW91lkf00X4XKEJQk9ZYw3CwrwcoHhGIBwO46+3eL6k6qhTerKLy24uuFtD
X-Received: by 2002:a05:6214:450b:b0:90e:921a:f62e with SMTP id 6a1803df08f44-90e921af821mr111501166d6.15.1788248094585;
        Tue, 01 Sep 2026 00:34:54 -0700 (PDT)
X-Received: by 2002:a05:6214:450b:b0:90e:921a:f62e with SMTP id 6a1803df08f44-90e921af821mr111500396d6.15.1788248094028;
        Tue, 01 Sep 2026 00:34:54 -0700 (PDT)
Received: from [10.111.163.121] (Global_NAT1_IAD_FW.qualcomm.com. [129.46.232.65])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-90ce44f5695sm102949146d6.26.2026.09.01.00.34.50
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 01 Sep 2026 00:34:53 -0700 (PDT)
Message-ID: <324ee2ef-f95d-4a78-945d-12d6b2f191be@oss.qualcomm.com>
Date: Tue, 1 Sep 2026 15:34:47 +0800
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RESEND v5 0/4] media: i2c: Add OmniVision OG0VA1B camera
 sensor driver
To: Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring
 <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
Cc: linux-media@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Conor Dooley <conor.dooley@microchip.com>
References: <20260901-og0va1b-v5-0-b0400a9bac01@oss.qualcomm.com>
From: Wenmeng Liu <wenmeng.liu@oss.qualcomm.com>
In-Reply-To: <20260901-og0va1b-v5-0-b0400a9bac01@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=b9qCJNGx c=1 sm=1 tr=0 ts=6a96801f cx=c_pps
 a=oc9J++0uMp73DTRD5QyR2A==:117 a=C3Dk8TwHQYyIj7nOf9RCJw==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=fdB5lo3k29YZU0rLWzsA:9 a=QEXdDO2ut3YA:10
 a=iYH6xdkBrDN1Jqds4HTS:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTAxMDA2NiBTYWx0ZWRfX4hf0n+2Z90kQ
 nsrWZaRLIw2ZFCml8Pjt2/mrOtcQ+sVMyEVgoVAYEJ8vfsHLiW31c0ErsniGA8diU269rn6bLr/
 5CxnVSYlqSTWe8xxnSMC0shrqoFPInq0d6vwpmMqfLZMtBi36oxlSfb2dyN56rwJz7jerQmDZe7
 egDlBKO+yr0Ks11B6RaMszZQGID9NuiuF/H3GE6V90nIXNhGPbUo3Yma+w32YLmtt/yabsN9zuM
 BZC1S6DP+Nh+6Jm9p4bv2Q/PlEWZ/LAad2S3vQDO+ZJtee/uLhY282Pv5PFdFCWTWf2wYwgjzOz
 89d5V9JRKAly3L/u6ebxo8XLI0wFC0fF1X346rtPO7ExrM2K2z23QxVLmY9HsIiBltEm5Fw/TbR
 NrGzkCJMhdWcY40YLNb4IhOiRiRTwUiztLLrCwKjPcFsYGFpvycy3nsB3b7o5GoIDsEvNyRn1KS
 GJqjtf7T2ResJKAA11g==
X-Proofpoint-GUID: 4exAUgCCvRpbewY_lt11GnOpdUlOkwrD
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTAxMDA2NiBTYWx0ZWRfX+x1Oi3FvmTCh
 CC7E+uLnP+X6KMDxNyIwc7VDOZGfgQZ4SO8kO7QAY97GuOnV3tbCjlwyB+uiFndUksHo6OHC3Z7
 j6ihepiZCodJWyibAPm/+MVMiBHbDRY=
X-Proofpoint-ORIG-GUID: 4exAUgCCvRpbewY_lt11GnOpdUlOkwrD
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-01_02,2026-08-31_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 bulkscore=0 phishscore=0 clxscore=1015 impostorscore=0
 spamscore=0 priorityscore=1501 adultscore=0 suspectscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2609010066



On 9/1/2026 3:31 PM, Wenmeng Liu wrote:
> Add OmniVision OG0VA1B driver support. The OmniVision OG0VA1B is a
> 1/10-inch monochrome CMOS VGA image sensor. It outputs 10-bit raw (Y10)
> frames at up to 640x480 resolution over a single-lane MIPI CSI-2
> interface and is controlled via an I2C-compatible SCCB bus.
> 
> This driver has been verified(include tpg) on the Purwa EVK.
> 
> Signed-off-by: Wenmeng Liu <wenmeng.liu@oss.qualcomm.com>
> ---
> Changes in v5:
> - Use div_u64() for pixel rate calculation to avoid 64-bit division
> helpers on 32-bit architectures. -- sashiko-bot, kernel test robot
> - Link to v4: https://lore.kernel.org/r/20260729-og0va1b-v4-0-ec7e7ed87b2b@oss.qualcomm.com
> 
> Changes in v4:
> - Rename the OG0VA1B and OG0VE1B test pattern menu entries to make them
> more accurate. -- Vladimir
> - Link to v3: https://lore.kernel.org/r/20260708-og0va1b-v3-0-de8e44455a42@oss.qualcomm.com
> 
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
> Wenmeng Liu (4):
>        dt-bindings: media: i2c: og0ve1b: Add OmniVision OG0VA1B camera sensor
>        media: i2c: og0ve1b: Use monochrome-appropriate test pattern name
>        media: i2c: og0ve1b: Introduce per-sensor data structure
>        media: i2c: og0ve1b: Add support for OmniVision OG0VA1B
> 
>   .../bindings/media/i2c/ovti,og0ve1b.yaml           |  15 +-
>   drivers/media/i2c/og0ve1b.c                        | 378 ++++++++++++++++++---
>   2 files changed, 346 insertions(+), 47 deletions(-)
> ---
> base-commit: 95d6a9ccef99117115e41e9adb271243bd5e985b
> change-id: 20260618-og0va1b-55bbf3cabb0e
> 
> Best regards,

Patch 2 is missing Vladimir's Reviewed-by tag. I'll update it in v6 for 
tag collection.
