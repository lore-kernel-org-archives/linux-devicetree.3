Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793098262;
	b=v4lFUNu2Y66eahqavPbjWFlsCorerb+yyWMC7TIk0PmTc80z5AdZAW/Ov/GEkKWCjPc5
	 G0C+B1G7A0TF8UukoTV+DwsOv4T/ad6OrWuWqC2o6FO0UCzC2DK+//Ss6mEHr3yqc0KZJ
	 CZJ2CuXdpVJ88FAuo9TZ2uVAVWxmAebaP8xUfcgzj8w2jKO+5HTX/in/HhSECd7GPYPRp
	 KcC/TQYGBQf3Whv7LzTD10xq9pimiMjB2LqA6+qPdvFcxVqeMrs7LLbwJE3UGtJVM6w2T
	 qx1zFe5WwiuWlRshTyqB7AOy/aosvv0dNRXs0GqbxF389PtXAEj2wQwOx8ZzXFZtAuA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793098262;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-ORIG-GUID:X-Proofpoint-GUID:
	 X-Authority-Analysis:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=vErTbvi/ZQPb8LIOl+0TIc0pcHPhDl9usrS5Zx4BOH0=;
	b=hkcEQrHdWMkL0KmGS0FE/1HDQ80lPLjiFTJR0bjzS8ubrXrOqluuoJ8wmVBXwl5hZt7e
	 tOM/v3y5JGEenAuYG8A6JAikAx7UcAThq2Orc2WaDDPMzjN4WPJysMB6eK2zsaMdyMzud
	 WhL5GqOugtvDyUuLvhu3efSPW5sTMOCjImcr5XZgW+O9hUbEd8sn/VaWj77kry+WHBuBz
	 5Jcg32LfuUOeMjYGFH8dzpQ7XKJbI2f7Jo+vkNdV100TVO1Q5sl6/NNnv4H5pZ1s7vemD
	 XeWkmmv+KExTGZ9JnkrbSf9g1jrbdIU7FLeWbRitsiiKUagpl64uGBLt2K/d7PN4trA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=MSykaSTb;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=QNBEQLf+;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8DE7D60A381C
	for <devicetree@vger.kernel.org>; Tue, 27 Oct 2026 10:51:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8DE7D60A381C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=MSykaSTb;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=QNBEQLf+
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69RAePJF3027011
	for <devicetree@vger.kernel.org>; Tue, 27 Oct 2026 10:51:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	vErTbvi/ZQPb8LIOl+0TIc0pcHPhDl9usrS5Zx4BOH0=; b=MSykaSTbVz4cVpJP
	W00TAT5epw9ybQl4cthSPnp9x+GSgX8L3NyPaFpoucf0Kn7bIEWzWipawrbAwDT9
	ZkfrWRnF5/d2nvJ81oqbtfD1fo1oKAuqcfgguJadZfgocV4JLiOjLbLQzTdVOfZP
	8+3K1HJj1oYQNSrIef2ByCkxlyyTAaJ6LNH0HdDkecXGl2xp4JAuvJbyBq7TtafH
	SD+pu0p4+usHV8/iVFpewdhdJycp0FvSQ9VbP7ykPpnaQjuAL4RSwU1c5owvZ30H
	QGfu5ZfOw93rRldrE1RdWygi/hgBBSUkvMOBCznzIZ+2RxPQMeYkOb/08d/lRzDt
	eiugHA==
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com [209.85.219.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hjh91a2tm-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 27 Oct 2026 10:51:00 +0000 (GMT)
Received: by mail-qv1-f71.google.com with SMTP id 6a1803df08f44-90c4d46037eso10887316d6.1
        for <devicetree@vger.kernel.org>; Tue, 27 Oct 2026 03:51:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793098260; x=1793703060; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=vErTbvi/ZQPb8LIOl+0TIc0pcHPhDl9usrS5Zx4BOH0=;
        b=QNBEQLf+XUsTgInZ7H4RYs4xB6D/FSyykh6R2nN9ZfXBOAAQJbe9GX8i+HU8zP+2Mi
         RXiDO8xqEriAFxjWfFYjxVWGk2F8afVp0jxRYkGZneTvDy/0FfPMh6OZK2aHcpaozNj9
         G/6w2z4dEA6PY6jASKdSfxYGc128nTPrrXvi86/554dMGOhl984kTSwPUaNzTQmWqUo7
         ajhJVVHvm4ldPF74pYc7apdmjzcinWwi3HGwNgaW59IRuZiS0sqXf1ZWmnUMww1QD3vJ
         vyxTT8sRlNQ3/0AyX2stAquChxdcZqHUGoQ0Og/ITAuE3uS23s+f47Ve3cWcoTf7MD3F
         RaOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793098260; x=1793703060;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=vErTbvi/ZQPb8LIOl+0TIc0pcHPhDl9usrS5Zx4BOH0=;
        b=23pgWEjJFdT4+vKJ8uxNfKtIDLFylsDD+fIM0ERc3ub4K+nuU6E45fjI6Cdl6TdCvu
         HIbkuPsDQOI6ivvCuPlD8PhTjZOFY4hL8eFasJYng2ZHTTR0SjsWNk7JJ8//5vpRveND
         q/sVfHyiIofGUZRQFA5oxHnuTBSuKLanTyxZcoCbW9gSMjTGII/6pZ/3BLLP2ACGLUYT
         NFXNLpqTHdll/H+hiRYzv5LPs6UquLDp9MoSra0/oBMtN/XAB5Y+1hCjy3Trm71Bfhn8
         BjGDOi5wYVpvXoHmJbF4dEOXInRH5S91YbWUVtS7/XQ6KH3ylfDOKbYoJvLDqDt10aXd
         kg/A==
X-Forwarded-Encrypted: i=1; AKwUvBwEu0jdAFw2ACSbyJEuvDxw7zQhL4OtKfsMtMdReYLjW1UO7RnmJLLNC5bvA481AuHTux90UJnNblTt@vger.kernel.org
X-Gm-Message-State: AFq9FYJBl3b33Q1GNOSOPic8Z+eB5U8vOIznHaAAy50omkoUxktrUumU
	3SeGrelqLlQdf/0CbAUGpxpLZktnYlWIdiIcGZ/pqwoXBbRNgH5qzc8XpElIj1lR6tqpTURYEOV
	ZMQNRjJK12EZD0dPm7R6OwWBo9tAaYfd8wzVY5mRdLwnWtvJLDqAL9Au9nCpQl93D
X-Gm-Gg: AYBFou2oCqucTQDkMCUGyVCTGmrz49rON0Z9UR+PS20o/gK8+sOpSi3ZQ4qrlYNs5xD
	o7Tbkc4gQ/BG6BKCNWrFU7IWmqUSF0egCj8wHljV5ZSLQt+mV9ix/D6LnOrDtduFho6G8Tugj+M
	S1JeLQRjYxkoMeC/uLV4Dnrn7/YRdWvOQPWJBOnHrnzGL96cbiUu/1UMCQX5Mm6QbFNo8E8lXNC
	gTbM86M3CArDA6x6c9amWDwbdsHpI6UH8hD/MN1c5BqEe8GmdzYgXXmp8BsvOK+/oaub7RiK900
	qFmQ8nPgwVfwNVrtIqaDXKsgtwGVIKAOT7Eiigb+5qRRNRx06OtaKvyFZe6aULvxFKUd+UeT/Ds
	cW0N2+KGgfQLQMF/SQ+OPVBYEgOAa7ZuaNjy1/SNG1fLvZ1tyqJCqLQTAO78sFs7rFa1+UEg=
X-Received: by 2002:a05:622a:e410:20b0:536:27d7:abee with SMTP id d75a77b69052e-5383b3b5b67mr149413321cf.2.1793098259601;
        Tue, 27 Oct 2026 03:50:59 -0700 (PDT)
X-Received: by 2002:a05:622a:e410:20b0:536:27d7:abee with SMTP id d75a77b69052e-5383b3b5b67mr149413101cf.2.1793098259161;
        Tue, 27 Oct 2026 03:50:59 -0700 (PDT)
Received: from [192.168.226.26] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c46bd66e51fsm430409566b.64.2026.10.27.03.50.57
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 27 Oct 2026 03:50:58 -0700 (PDT)
Message-ID: <5884eb89-5afb-44a7-83f3-642efcbcd284@oss.qualcomm.com>
Date: Tue, 27 Oct 2026 11:50:56 +0100
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
Subject: Re: [PATCH v3 2/2] interconnect: qcom: Add SM7250 interconnect
 provider driver
To: patches@brar.si, Georgi Djakov <djakov@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-pm@vger.kernel.org,
        Konrad Dybcio <konradybcio@kernel.org>, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20261026-icc-sm7250-v3-0-aa303226298c@brar.si>
 <20261026-icc-sm7250-v3-2-aa303226298c@brar.si>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20261026-icc-sm7250-v3-2-aa303226298c@brar.si>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: VHwbvPxPWVnZ8ogutqAQyR8tiqm-QfGm
X-Proofpoint-GUID: VHwbvPxPWVnZ8ogutqAQyR8tiqm-QfGm
X-Authority-Analysis: v=2.4 cv=TuxzFzXh c=1 sm=1 tr=0 ts=6ae08214 cx=c_pps
 a=UgVkIMxJMSkC9lv97toC5g==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=w78OluAnvVQzWo3CabYA:9 a=QEXdDO2ut3YA:10 a=1HOtulTD9v-eNWfpl4qZ:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI3MDA0MyBTYWx0ZWRfX2AWAcQwH6Kgp
 cbjj2w9vgANBINfBnrixvCFpIXBEh6jIGw+hWmRg+w+z3IhhUv53zYTpLCry0KMEkIfAVHLP5Mv
 8r8KPFU3XTFcjpVK368zKJnQ/SE8u6bj3ACupJYqDG86g15l7dZdc9VMEJjlDIdlYI2qMZE1Crc
 ZSHx0H6dqVteCOb1MwufnFXNKgLXFeTgCdQB1XKzFtgKRy2UT/7qtbZOpID6Rf4YEg7A0Z6kAK4
 vzwq5+B48IX31zuc+qXcwnAlRsUKhv92ebTGsD0uFGw5CyMlvUnNiKGtB/r1WKNPc6CkWpELaap
 5dxRtVh6pg+gC8xpgYqxZgVRTx6EtBUA0FiwRHMszjq24p0CYpaAPRt6gR+6eSVGjAdSjP6XteK
 mUMDqyV40ZpSwgqqhbDE1YrhjAc4JnJjk0+eKu3RirggBE8a8/Lwaix4/AC/5t8oYQbQeak3GvJ
 /uT70fyhzXzeXCPhaDg==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI3MDA0MyBTYWx0ZWRfXw8ok4SpMWnxb
 h7rOPc1VT9x1GmdIR2A8cPTsNx6b5k55Wsp0g4hUKfDfeOaMXIKd2VIk3cVp6cIo4s2gCVnt3Wj
 bbbv31BXkhZ11BKFtJmIR/0MMxVHrSY=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-27_02,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 malwarescore=0 spamscore=0 priorityscore=1501 bulkscore=0
 adultscore=0 suspectscore=0 lowpriorityscore=0 impostorscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610270043

On 10/26/26 6:48 PM, Ishu Brar via B4 Relay wrote:
> From: Ishu Brar <patches@brar.si>
> 
> Add a driver for the Network-On-Chip interconnect providers of the
> Qualcomm SM7250 SoC (Snapdragon 765/765G/768G). It follows the layout of
> the other RPMh based providers: the nodes and the Bus Clock Managers
> come from the downstream interconnect description of the platform.
> 
> Tested on a OnePlus Nord: all providers probe, and the UFS, USB,
> display, I2C, serial and camera ISP devices get their paths without
> errors.
> 
> Signed-off-by: Ishu Brar <patches@brar.si>
> ---

[...]

> +
> +#include <linux/device.h>
> +#include <linux/interconnect.h>
> +#include <linux/interconnect-provider.h>
> +#include <linux/module.h>
> +#include <linux/platform_device.h>
> +#include <dt-bindings/interconnect/qcom,sm7250-rpmh.h>
> +
> +#include "bcm-voter.h"
> +#include "icc-rpmh.h"
> +
> +static struct qcom_icc_node qhm_a1noc_cfg;
> +static struct qcom_icc_node qhm_qup_1;
> +static struct qcom_icc_node xm_sdc2;

You shouldn't need all these forward declarations

Konrad
