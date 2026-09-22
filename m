Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 14BC63EC686
	for <devicetree@vger.kernel.org>; Tue, 22 Sep 2026 20:29:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790108994; cv=none; b=gL0kJ6q+XglU7ohArNyVS6gqQug7dNh2prXtm7BLjFY4t9mcL0OlPEP7A+RvI0I74/jAi25TzKuD60v9sm51UUS8EVSm3nvqI4Vd5/PJZfZHtxbVdeJWoGyPG6YyRfK8vvOxwFmcbkfeC/6qvx2nziV8GIGMwnBVQoeqSwbLl+g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790108994; c=relaxed/simple;
	bh=KGvbFC1xv3w/KWSmZCD1JwFEOhpO+TBAfm/srEiklcU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=AOAFmxSg1dFkIJYPaWUKKhslhUff0SHCiQWQOmFsl27txswWfdo/lfEkcwPHOeOVrBYCHfP10p0EfghcJTqVpe9AWYUqrQ/upqvrgSBOKiY0zRdmHgQcUtzfAWlT0iYf/dzRnHNbWtjlt942p4flooCZCjU9aw9sLYHn1WsLTJA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=CZ/MkQkT; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=eD1eLA3h; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="CZ/MkQkT";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="eD1eLA3h"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68MI6wi91873469
	for <devicetree@vger.kernel.org>; Tue, 22 Sep 2026 20:29:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=aqW2GbHYraxyCydIIqan53+h
	l0kg0DAN9SKEJbCAd7w=; b=CZ/MkQkTQfdZ5U6/JpuGXfceYOre03ov/Srq9mu9
	iuJgNuC11vM4WHmNebyR+AsMhxc91nRvc6USQoi8pdOWwsYv5LKHA4oGMdsVrljJ
	1ZKky67J8CTKssjhdHpSvaTkWEPWvu+axOrlC8xmEyMbw76HS3cjovrriTkLrvs0
	FgUZL9BVqget0TfgKIiaCFb0VrbX4zNaBe2SHsKdYH4Ga3aWxnUrPJlqbf4BCwNq
	tDKyeBaSebx19PXQTh5lBTlTn+rXpX+i9ccC9hKxKMK1KIuxCcwqT9xVOyNqu3mm
	bWEsou/70a1HBLSggvxx965DN+mKZjIwHrKdl5KSIgn8Yg==
Received: from mail-ua1-f70.google.com (mail-ua1-f70.google.com [209.85.222.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4guqk4u0am-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 22 Sep 2026 20:29:41 +0000 (GMT)
Received: by mail-ua1-f70.google.com with SMTP id a1e0cc1a2514c-97e99615e0dso232620241.1
        for <devicetree@vger.kernel.org>; Tue, 22 Sep 2026 13:29:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790108980; x=1790713780; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=aqW2GbHYraxyCydIIqan53+hl0kg0DAN9SKEJbCAd7w=;
        b=eD1eLA3hbrspA9Dc2eCGQPXGCwHm9drgV6t9e4PxS/0ff/oWQ86BJpnxfGxR0G8LMJ
         E6izVXrBX9ZFhsmplbAeVUakTSmUH50eb7Gi4CQ8dJCG0w+U4V5TlfOxJVjfjBbnmKyB
         xi+eciKl4C5tS2tQaN2wyahgsZZ3qsfPJTqBQm5TjbpuIAkrK56iQwPXcaTPOWVa3A6l
         o+k0pSsWw0MRu5FEUhqECAvTz2YFQlXJAIlw9QtT/ZbueeON4FEMmzmYgRb8nfL62/h8
         NdmGQnv3w7XRW9j9NeJMgSOCdiPXdtvQj+9ehodRcL+fiPzGo5Tw1iZk/3mSJGdGV6vm
         TfNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790108980; x=1790713780;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=aqW2GbHYraxyCydIIqan53+hl0kg0DAN9SKEJbCAd7w=;
        b=eS1RdrGkkT0+CTegGhpeWzvatXSDcA96+vS/gQcZiniPpc9WWEhH56TzDuxAvDD+tM
         pzApEuHBuRA399CKXPPN+62kR4ZiUZUyyAU5W/y6jWw7DkQ10vS/dEDjSF/V+7GNFtYI
         QLn95P4qFImeJeBCqJmo01Lydychh3bzVvE/uk4e1TyS/5wCddmyKEajov8QRuWzQ0Eu
         7KxJeLiLmXdHstKOa9g3VMT9I8RaEcXPJeiP3GZPpVOdrCLrBZbQlkhbxFGdfvMh0UtF
         XislBIGZHvUcyHKliAyb7QRZgmjOkdWrpsDEUal5CWz1eZIjI9cDCr50iXH2mWEDU9V8
         f27g==
X-Forwarded-Encrypted: i=1; AKwUvBxUSzJsVlR+7asiUKVvuBDcVEyASUGuU5+2SVqWcOqmm+fyx6o0rxePPygwkLVqCxUFZtkOdeX7K5CE@vger.kernel.org
X-Gm-Message-State: AFuF++nVR2okNAvDxZulYn1K9m4jgpltpSVaXaSP1vkmFNYfJZxnwL4a
	tC47Vcn1NSSHLNnuGtbVVqWGTgcY/eZ53P7cXLmomDUKVJPZsGje6ABPz5mNfELknSlSnPWu2hu
	oeQ554tO7Xl4/ozXwcHywodAUQ5oRzcpV33IPGFClwToJZdsoqtRSGm4ZGuxJve64
X-Gm-Gg: AYBFou36POSkLGzn6XN6LgQKVATCo5HiujPExPmurv9MbdkwUp8Onudq0DFO0dFuqST
	qiAMu3jeCslpw1yd+p3O183ibwjGZq9LVhclBlW4OwQqke5nJIheIVW1IzwaPFMu2PpEvhDSN/6
	FUl/g0Npknuq8NI5VIKTZe7CpRIHx0Vuj+o35n7D6XzFQ6LXeOuGH2z11BbEVYTuZRfNnuaTGnp
	Arvvw5cN2zWRSkdlsN+vtaKshT1ORg7v1B9Zn4/2V6IfaPcalXJTG1gI+QbJ5FF2cFSTAN1u9p8
	ROt51qYzqtjEjHJSh0NrK9kiLOLQanrpm7EBRzua9Mj+PL4drUt0RdgcE6dQdSXRWfcUafP0Udq
	9vR1s8CAts//Bew==
X-Received: by 2002:a67:e001:0:20b0:736:f95c:4bd4 with SMTP id ada2fe7eead31-7aa9df8eee6mr3852491137.6.1790108979924;
        Tue, 22 Sep 2026 13:29:39 -0700 (PDT)
X-Received: by 2002:a67:e001:0:20b0:736:f95c:4bd4 with SMTP id ada2fe7eead31-7aa9df8eee6mr3852482137.6.1790108979423;
        Tue, 22 Sep 2026 13:29:39 -0700 (PDT)
Received: from oss.qualcomm.com ([86.121.170.232])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48867b49661sm1029351f8f.0.2026.09.22.13.29.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Sep 2026 13:29:38 -0700 (PDT)
Date: Tue, 22 Sep 2026 23:29:35 +0300
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
To: Oleg Keri <okerixx@gmail.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Hans de Goede <hansg@kernel.org>,
        Ilpo =?utf-8?B?SsOkcnZpbmVu?= <ilpo.jarvinen@linux.intel.com>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Guenter Roeck <linux@roeck-us.net>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        platform-driver-x86@vger.kernel.org, linux-hwmon@vger.kernel.org
Subject: Re: [PATCH v4 3/3] arm64: dts: qcom: glymur-lenovo-yoga-slim7x: add
 the embedded controller
Message-ID: <2bk74z5ukyuzddmxhacm5lvdpxtlmd2jz44tz7dyjlu2zuyzqa@vw5k7lmxh7dq>
References: <20260922165737.260443-1-okerixx@gmail.com>
 <20260922165737.260443-4-okerixx@gmail.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260922165737.260443-4-okerixx@gmail.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTIyMDI5NCBTYWx0ZWRfX64U8bpOn5hMX
 Z7WuLXiaYs7Z3nX1lSRU+mc+4WgKCEFbT3IBHKv62Fr0SRkTXitmn4dOFWIzHUnq9WksJj/l9x+
 w5Gdma4hA5Z1lsbiu/YfT9sxp5yuNcEgjIaRA5v2lk3d2VRJfAvCjUYbcUcf3OPlOc5nOPXFxW5
 gptQJ9zi8IQACJgScAO5BSOB50qQoNZaPiDgD8b6gp0I3zi4bij7FV8SMnfdOgMGRaB7fxV3cV6
 0F2EQn+lX1vcmEgJSVLIhV2Q4B3t3NSJnqOXbMU4WUluR/oTQPxdIM74OEKmnev5BXlr4Ih3C0j
 CmO37yekYfeviGBVrpXyc8sj/oE+H9EB62aedgC7gfhdZXEhwcjKAPdho2XDQ1PK9fKu1CFz7S9
 UHQMfr2iOKtQgAizKupP7erRkOiNDYS9s5Hdrw6O9mgoR/RKgh8OB6g4iY9QXiADPcyFXmWpTuh
 MEk2lnjt4ry86Rk2Teg==
X-Proofpoint-GUID: _kpvLh1mJP46bEP_X8wGebO0MMCRv0tr
X-Proofpoint-ORIG-GUID: _kpvLh1mJP46bEP_X8wGebO0MMCRv0tr
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTIyMDI5NCBTYWx0ZWRfX0iV37eoY6ewD
 kZ20LYNzW4GhkR3QiG8TmcGylZNMzWkoOkJwXbLmb4/Sk6VhQZVTEx1n6TRXP30sZJD3imbaDMo
 dHk2P4GpMrD51wbEGKMyxhxt7elGY64=
X-Authority-Analysis: v=2.4 cv=XrVvqlF9 c=1 sm=1 tr=0 ts=6ab2e535 cx=c_pps
 a=R6oCqFB+Yf/t2GF8e0/dFg==:117 a=po8fGBi+ks8MzcVQGuqtFQ==:17
 a=kj9zAlcOel0A:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=pGLkceISAAAA:8 a=EUspDBNiAAAA:8 a=cXQzEVsWzZF_LJZYrIMA:9 a=CjuIK1q_8ugA:10
 a=TD8TdBvy0hsOASGTdmB-:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-22_03,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 suspectscore=0 lowpriorityscore=0 spamscore=0 clxscore=1015
 phishscore=0 bulkscore=0 adultscore=0 priorityscore=1501 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609220294

On 26-09-22 18:57:37, Oleg Keri wrote:
> Describe the Compal embedded controller on I2C at address 0x70. It
> provides the board thermistors, the battery cell voltages and the CPU fan
> speed, and drives the keyboard backlight. Its interrupt line is TLMM
> gpio66, falling edge, for which the file already carries a pin state.
> 
> That state leaves the pin without a bias. gpio66 has no external pull
> and floats when the EC is not driving it, which shows up as a steady
> stream of spurious edges; the vendor ACPI tables describe the same pin
> as GpioInt(Edge, ActiveLow, Exclusive, PullUp). Enable the pull-up.
> 
> Signed-off-by: Oleg Keri <okerixx@gmail.com>

Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
