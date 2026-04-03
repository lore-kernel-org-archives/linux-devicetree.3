Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 42B1F36826B
	for <devicetree@vger.kernel.org>; Fri,  3 Apr 2026 08:15:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775204154; cv=none; b=d/RRJpmrxF4Kgxj3PBMPzF43HwAMkswIOahTELPLF7kk95760Qqe6qrVE2Rk7wyeJ3prGPFTIkt75g43XwAw5JR+B+LJuFeOL/BkBUHfWDMVbJRVqe6PF/dKzW5IdRnggS2JsRIvJJufCfOJsCczly15EZzoXDR2PnHkaYAVfVE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775204154; c=relaxed/simple;
	bh=Jbv6zoiP8qkzdSmUDK3AcT6SXXca47q5+ShRp3rjXKA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=DMkRVBj2AZ+Z+A1yYM4mhn98tqMC0NA+P9sUR6BE5H0Rp82M4WNjwfzoVnkqLivQHoRGttQFbu0uJCAtzQ6Mg17/3AfbrWFXcIqWVFSOdDq4yuHX31NKKvsSskW15XquckcX/bcdiavbA0b/4fBoBVA0wIE6HY5Rl6vXlmpQhSg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=jV+Sh1J5; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Vr8SFUOc; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="jV+Sh1J5";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Vr8SFUOc"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63360FLS3772536
	for <devicetree@vger.kernel.org>; Fri, 3 Apr 2026 08:15:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	YzGrFMu0BZf7JWMQGc9EJ82fJmsL7R6Vwii0vN67WpQ=; b=jV+Sh1J5V0kVjKbT
	yl+VjsHGdM3iW23UMkuNtWD1yzDBgR9h5dMCk+68AqKf4d6gLQjB4qgBNnOa0Pv5
	KTcrHI3sQjR7k7Dvvvj7HphMFqZNhcQFIPdv10BbRkPEM+JV67X0icCo/JL4kaEL
	ct/Jmm21rl+CdDMyhUNPJJGP4X22OVRYGUTRbc8tbru8Z8ykX6ykbWkTq19rLvGo
	HGCiiPU3vZsAcNcXaNz23JUJQgq1qRPYc8C2LB/uNoAY9XklN6FvDLJ3uYz8sMIl
	I+rJss0ekrGgBx84O33KJcfgT6DGMDkoScKIAdfxBGrlIYrGkmKfY7klql47GIlv
	W8ZGqQ==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d9wcs25tx-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Fri, 03 Apr 2026 08:15:52 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-50b6f869676so38879181cf.2
        for <devicetree@vger.kernel.org>; Fri, 03 Apr 2026 01:15:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1775204151; x=1775808951; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=YzGrFMu0BZf7JWMQGc9EJ82fJmsL7R6Vwii0vN67WpQ=;
        b=Vr8SFUOc/pN+xpF9pWXzm7qXKdSQ8KFunzP6JZH2SMou5pfZWAzn19n4HQyu5volJl
         nOzk0va8+c2LEJ3xQbomjaY4gHA3dg0zO5+Wlmrr+RPg9XGrqwJZpjlHzHsuYvNp55eZ
         78JKzlO1nVmgv+112jauvuQKdWCDJSsNGsFwdamURHVI8oHARlvGERzZNeMfuQganUbF
         cJkN+FykaQhLM+meKtE5+DVQatMiA37JMX0ECZ4tUzBJNXPCAQW7U7kCFSRk/km+0sWA
         M7PYRxxvpAhwpLE1rpZ9wmkPthGTPi8O4xFWPawWLnC2hFkgwyu0bu3l22uVkCkdM83U
         wqog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775204151; x=1775808951;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=YzGrFMu0BZf7JWMQGc9EJ82fJmsL7R6Vwii0vN67WpQ=;
        b=QC9JgA8sq2yw745oMndGC+FqqjKI9cmcbzackOMV7mJX+bFY13Kj9VqYGcWtMQpO4U
         Cr98nSt0AnEAp5RpwjlE59TS1LwznwxmJg7qldJQ8qDFrToM4/PR/1BSht5eaEjM2L+5
         jWme/sOypufbTBokwMsj9J4na8+l6o9Vnid2H38Ihkj4q7C26TEkMB275NryCv2Ig+Gn
         zX10lzkDd3W3ITnRdUYRWP5m62novV1jEn0od1EZ0pEfVbN9mJBryXUHycffA14rz7Fh
         ZYYfuOR6E4OYMqGbWFBipWHz7iHg4jlJ55Ktl2ik0KgPcl7TPLeg94X1sELcc6RUWh80
         XjPA==
X-Forwarded-Encrypted: i=1; AJvYcCVNTSX6SPCl7Ga91ErBNAe8jZCBw/tsU+LrWCSfECC7MGtJdXqTO+EjNGrgIvo97NeY3GtUjIQ8ymZO@vger.kernel.org
X-Gm-Message-State: AOJu0YzIXnI43d/iQCykcsb46xTtaG24+bzV+NFU/jbCVsGyerG+yx6u
	hOCD3camsjnGtkIKw+ybfiD/VwtDU95W6z9CnsoVhuu8VCSjI+0L1HmUIKOpXPpsu9M/byymtKT
	KHPbjeLngwsCSi+rGqJTrhY0WoSVKAWqb/ztqFQBZzFgN9z7/k3cVcanzndTgUCW3
X-Gm-Gg: ATEYQzz2WmRFECbRx5TVLZoBywSTjC/4E2P5foECDgamXR5B0DPemgIjWscHeYVbaH/
	euTR27Jl/JBJBOYD/cxvbHoejs8jjDQuNIw13wlRU81uDlwtpuE3D1As88iyxsQt4uBmY05e32R
	9BT0Gzrviwy+l2vVnHA7c6iiW8bZA7acnbBjm46w9LFYQjCx7Ak442HxDWVQXnSVPArXqPJHpBX
	bBtyA0bVMaRU/1aaz6T17pI3Y6HrZshRe7PNw5gZvCDapFPx/pBzAh3HP7Z/J3qRd85PY2iq8Rz
	jIBd9rwt4kU0cQ38oJKfYuQG02zBsD4qXs+Fig9PTGMaKhdJypX/FGcXZLr88bNWc42b4xA3uih
	xA9d+VOGCB5ka/WjmI/eTCudxX8YVud/rdGiq4CRKvSPdu+oAA8O4SIIa2tJpxt2f7096L4v7Ip
	r5eHAb8dOQ
X-Received: by 2002:a05:622a:6a90:b0:50b:26b4:7501 with SMTP id d75a77b69052e-50d62614c49mr24019541cf.7.1775204151477;
        Fri, 03 Apr 2026 01:15:51 -0700 (PDT)
X-Received: by 2002:a05:622a:6a90:b0:50b:26b4:7501 with SMTP id d75a77b69052e-50d62614c49mr24019241cf.7.1775204151088;
        Fri, 03 Apr 2026 01:15:51 -0700 (PDT)
Received: from ?IPV6:2a05:6e02:1041:c10:ae20:597c:99b8:d161? ([2a05:6e02:1041:c10:ae20:597c:99b8:d161])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4887e832585sm468214155e9.6.2026.04.03.01.15.50
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 03 Apr 2026 01:15:50 -0700 (PDT)
Message-ID: <77a77b79-a489-41a8-98c0-00242cbdf24f@oss.qualcomm.com>
Date: Fri, 3 Apr 2026 10:15:49 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/1] dt-bindings: timer: fsl,imxgpt: add compatible string
 fsl,imx25-epit
To: Frank Li <Frank.li@nxp.com>, Mark Brown <broonie@kernel.org>
Cc: Daniel Lezcano <daniel.lezcano@linaro.org>,
        Thomas Gleixner <tglx@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>,
        "open list:CLOCKSOURCE, CLOCKEVENT DRIVERS" <linux-kernel@vger.kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
 <devicetree@vger.kernel.org>,
        "open list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE" <imx@lists.linux.dev>,
        "moderated list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE"
 <linux-arm-kernel@lists.infradead.org>,
        Stephen Rothwell <sfr@canb.auug.org.au>
References: <20260211214947.3705328-1-Frank.Li@nxp.com>
 <aaiIdS0zRPBY81aE@mai.linaro.org>
 <ac9ztfwZMrZZgTeP@lizhi-Precision-Tower-5810>
Content-Language: en-US
From: Daniel Lezcano <daniel.lezcano@oss.qualcomm.com>
In-Reply-To: <ac9ztfwZMrZZgTeP@lizhi-Precision-Tower-5810>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: vJ0GA_GvZzulvp1VFUxiDx8j63Wua6SZ
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDAzMDA3MiBTYWx0ZWRfX/nsgY2tt5U9/
 EdVJRv7+l3FbFikQ+ExZ72QrahK1sTin5xDRk1wNVCaEGljHZr9c8Qie9gDdIuPzWn0j5iP5EdZ
 5/aOlxlyYeKDzL/3vs6jmtDamaxDMQGNMzwQq50CTuSHXcmRAwIvoaLHhZYLJV+HSeP0N0AOSzc
 MseJT6LPjWphHZfEXHvjzpMf0fehcDQohf8mLYjcOTU4osHkpV16y6P/gRoF9QOjBCtpk9WQWit
 lIidJWVgZ7bIi46IXDapQici65bB/9AgxqD4Bkw9IewvCHs17WEakL7LoFfs+z26HiWhKi50EvS
 cjfvzXBhJ40Kl0tAkEhWTUOmFiloqTGws6190T/j20U6RVxQTBvzA/T4p4AlXJK5WjREABPXDne
 kRmrdVAtA66nn29aO2dW13/2VSV6mErLK6ooLUZ9D918AgesJLIz6e4rRbvZSkvSBlEoGlDmiop
 y6PXWTiyNMouBg4KWsA==
X-Authority-Analysis: v=2.4 cv=ZuPg6t7G c=1 sm=1 tr=0 ts=69cf7738 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22 a=8AirrxEcAAAA:8
 a=hZvao0TmnZhtY6t4GmUA:9 a=QEXdDO2ut3YA:10 a=a_PwQJl-kcHnX1M80qC6:22
 a=ST-jHhOKWsTCqRlWije3:22
X-Proofpoint-GUID: vJ0GA_GvZzulvp1VFUxiDx8j63Wua6SZ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-03_02,2026-04-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 bulkscore=0 spamscore=0 lowpriorityscore=0 phishscore=0
 priorityscore=1501 malwarescore=0 clxscore=1015 impostorscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2603050001
 definitions=main-2604030072

On 4/3/26 10:00, Frank Li wrote:
> On Wed, Mar 04, 2026 at 08:31:01PM +0100, Daniel Lezcano wrote:
>> On Wed, Feb 11, 2026 at 04:49:47PM -0500, Frank Li wrote:
>>> Add compatible string fsl,imx25-epit to fix below CHECK_DTBS warnings:
>>> arch/arm/boot/dts/nxp/imx/imx25-eukrea-mbimxsd25-baseboard-dvi-svga.dtb: /soc/bus@53f00000/timer@53f94000: failed to match any schema with compatible: ['fsl,imx25-epit']
>>>
>>> Signed-off-by: Frank Li <Frank.Li@nxp.com>
>>
>> Applied, thanks
> Daniel Lezcano:
> 
> Can't find it at linux-next master branch, anything wrong!

The patch is in timer/next but may be linux-next disabled my branch



