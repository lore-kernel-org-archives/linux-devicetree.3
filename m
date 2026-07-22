Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1D8C03C109D
	for <devicetree@vger.kernel.org>; Wed, 22 Jul 2026 07:13:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784704403; cv=none; b=TFX1m9gCyNTmHxMnRNOciaDLj4OvYjEDi3+aVO2WF2ol6U2aB3W2aXyopEPlshC9J1Y0QXYPlycnKdQCPqH0UDA2dh4rvDZ/+F9FIxVILZT0n0YLKm0J/kmna6VZmR+VOQ/fu547imom1w/d+fe/VBiltTYOyxBaaGMw/0DsWmU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784704403; c=relaxed/simple;
	bh=ZnLV/a5hdCoNMYjPosDmeMWDt60E2q1AWPD8RW/wiVw=;
	h=Message-ID:Date:MIME-Version:From:To:Subject:References:
	 In-Reply-To:Content-Type; b=EcnoqcQ5qF/HVcWhVrfHhhlAKTapxSsOm2XZRjGAOxCaaZvuA7JC97rlWzjYWiajSLiCshVoWuHbsKR5KfulyxbfUVtdSiZeKSz3tZhzqehrPUOCx+zc7ygkXubCSyGLX3rm9d360/lDxDFG9tqg9HHvAIZxa7RSP5SK/4V3w8o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=oDcb8XA5; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=YCrTncQk; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="oDcb8XA5";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="YCrTncQk"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66M53gZn3883047
	for <devicetree@vger.kernel.org>; Wed, 22 Jul 2026 07:13:21 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	csGFu5RbC9huQdbcAYKh5q0jdyq9oL2CD75umdOlyVI=; b=oDcb8XA5MEFXSY/L
	BF/mlYWwsiAyRycu48mvi2oln/tEwZVxo57vvl/5hthjsWEY+9PU9SYR1sMnR4F4
	dyqbxat7S+mKJFM2pJAY3oeWPDrmN+ASB+Xy354fOwLSbKr96J6FXCqjEaCd3lCa
	A/Ikz6HsUkkcL936MWH2Id4vWb1eqlJ6s/eygSV/Ajpnpji0xDffjSRhM/MP/Zha
	kg2s5XBYcrxcPCPKQp/vRYvXh/cSdfAfd6vqf4og47L6QTJpSur4s6sQ52W7+0Jy
	XLKSG8+Y8jXPO9eEHG6F4nD2jdCN2LS+jJUVcGcNzZHdYvNHn6WwWRMpjSEkIJYk
	CItDGw==
Received: from mail-pf1-f199.google.com (mail-pf1-f199.google.com [209.85.210.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fjntn0twf-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 22 Jul 2026 07:13:20 +0000 (GMT)
Received: by mail-pf1-f199.google.com with SMTP id d2e1a72fcca58-84857446424so22661318b3a.1
        for <devicetree@vger.kernel.org>; Wed, 22 Jul 2026 00:13:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784704400; x=1785309200; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:references
         :subject:to:from:user-agent:mime-version:date:message-id:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=csGFu5RbC9huQdbcAYKh5q0jdyq9oL2CD75umdOlyVI=;
        b=YCrTncQklgUPYSJeNjGkP36YKpXZFk35Alj7uO3vTEnXr0tPpn71qePTFvEejzg8uK
         rbPFWQ2DGXoUYRbYfuGBHlRXdtXjPoBEeY8yXgJwTMUidtLHwJDXZPKg3O8lfTU5t17W
         WVB0wgGGDDUi9vJkZgP9BTeFwJ3QPWXqVQpQadRDXlT/A02gvUERtP6Rfw0dQc3cts4L
         HL3soNuznFs7rT26ZLpxBHcj6pVZkJDpAZRZ7LblomcZngI1Vcrs5HMhMoxp5AYyv6mn
         LtXO58LgthlfolvyUasW0ivI7J4kyo7rk45g+9oP+JGUYFSmOfr1cx8cGfp0mn4MM4lH
         LPTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784704400; x=1785309200;
        h=content-transfer-encoding:content-type:in-reply-to:references
         :subject:to:from:user-agent:mime-version:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=csGFu5RbC9huQdbcAYKh5q0jdyq9oL2CD75umdOlyVI=;
        b=m/03IgSsnV/MIRxRkWCLJl++xzEnPzXpHz4T7IQ0klRTanfJ4Ppi/wsTJoqdAPCc4v
         9M1DuWlEQsyeViv3Zt1EQlcjp+FJ2BTkBPOfJEieqgdgVa0cQrYm18+WlqEexreoEUbt
         KkPLodrswfAuEFwv+kvbLR5Q/3kiQRUmjTE+9I0Zb5vsWmGC13W8627ytFmO4Zox/sRC
         jFvMQBELUWI/+3iBvfBr0M44OVh/gHzoDGXdefZoohjlE8ErXDfM/LIxLm1r/hAmjnmd
         SzodHnSHYeXCEzzOYCHGASJ7/3r+58p7/QASuw7Yz6BlmAoe6JeKDcJ/vtE0a6sCiFkU
         DocA==
X-Forwarded-Encrypted: i=1; AHgh+RqjvMwpRu96bQVyQOGOQYcO8P88oRCzHTpbX4dEJjF2wrPmsBprRNlVbLOSF2MKO7Kt/CQyYrcaYPji@vger.kernel.org
X-Gm-Message-State: AOJu0Yw0vHkCTcofXR75DMgJaBj/asV0CTtRkD5/05XQshyYXThnc37Y
	Fx1lf2Ab7s+5fKqjamYk3ZKdzIyWRTWI3FT4wb6EWsONUo6liCG8UAH9n7DaYI3MG/E9rB2yKhF
	Qw3/aUE1CokPNd6YnmtRQfhGXotcESxfMf6LzDbIIrW9EG4EzcLR3pb+rIYnNRipt
X-Gm-Gg: AR+sD11Wi8ZFvUhOKe/sg0e3hE282gPYrUg9B+FncIpMiKnRyYFE4oZqetsWOnOdT3j
	51nuCG3pBLqpiIlSM2EA5CPld3w2jFw6ldi1L/wmF/RJOXz9tXguiCAPorcDs89gflgTM0p88Wm
	dSbVOubASoPn/rkJElRAq8G77JjA6PKpVJ9CTcNBTbdyPS7Ggod2sznsdM/Jp1patKUyOY/T3Wc
	iZmCMLQbyQFERXtD663lpFBH6m1prBbCfzI9yOYPkTNUszyXFjLGlj+u7TijvhZr3R1Lxr4+bx+
	Ulm/0Z6XzlHBNWjcrT7/UdDyUDB9DlzCoidmgaGBscaPazFndsPHeIB7BIg2BAGGIqMKobFONgS
	GhsYGXgXRFBBcIZa3d8pHAEad98Q=
X-Received: by 2002:a05:6a00:18a0:b0:847:9bdb:2cd1 with SMTP id d2e1a72fcca58-84c294c0adfmr21781068b3a.54.1784704399785;
        Wed, 22 Jul 2026 00:13:19 -0700 (PDT)
X-Received: by 2002:a05:6a00:18a0:b0:847:9bdb:2cd1 with SMTP id d2e1a72fcca58-84c294c0adfmr21781034b3a.54.1784704399345;
        Wed, 22 Jul 2026 00:13:19 -0700 (PDT)
Received: from [10.233.16.34] ([114.94.8.21])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84e17573c0esm851062b3a.38.2026.07.22.00.13.14
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 22 Jul 2026 00:13:19 -0700 (PDT)
Message-ID: <a5545d73-32c0-49d8-9601-1d2bf10d426e@oss.qualcomm.com>
Date: Wed, 22 Jul 2026 15:13:13 +0800
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: hangxiang.ma@oss.qualcomm.com
To: Krzysztof Kozlowski <krzk@kernel.org>, Bryan O'Donoghue <bod@kernel.org>,
        Robert Foss <rfoss@kernel.org>, Todor Tomov <todor.too@gmail.com>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        linux-arm-msm@vger.kernel.org, linux-media@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        jeyaprakash.soundrapandian@oss.qualcomm.com,
        Vijay Kumar Tumati <vijay.tumati@oss.qualcomm.com>
Subject: Re: [PATCH v15 1/8] dt-bindings: phy: qcom,x1e80100-csi2-phy: Add
 Kaanapali CSI2 PHY
References: <20260720-kaanapali-camss-v15-0-c0b1c1167c5d@oss.qualcomm.com>
 <20260720-kaanapali-camss-v15-1-c0b1c1167c5d@oss.qualcomm.com>
 <20260722-pristine-lemon-dugong-ec2c0e@quoll>
In-Reply-To: <20260722-pristine-lemon-dugong-ec2c0e@quoll>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=AJsSZ1gA c=1 sm=1 tr=0 ts=6a606d90 cx=c_pps
 a=WW5sKcV1LcKqjgzy2JUPuA==:117 a=Uz3yg00KUFJ2y2WijEJ4bw==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=e1oV9azWTbvrO268RREA:9 a=QEXdDO2ut3YA:10
 a=OpyuDcXvxspvyRM73sMx:22
X-Proofpoint-GUID: QhwIsP38vlNu5FLPT7qKJUIwjhEOz99Z
X-Proofpoint-ORIG-GUID: QhwIsP38vlNu5FLPT7qKJUIwjhEOz99Z
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzIyMDA2NiBTYWx0ZWRfXye4FUQXgj/T4
 nDTiMCycIE0kFjwqOTovp7czJPTD6HiuYmOFf5sdiWXy/ceFRnPsf+CGdNQnQp357q3fBS6AbtE
 z8TacOszdlRSCWTJidHTkWwVnpCgiAI=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzIyMDA2NiBTYWx0ZWRfX483+zAPF35SW
 19rxL7/3bAvW3zexy5+t0jl7RmSQpyoVo6i1y9lbsd5c1goBFHPDOjqI0O/FAmcuapMmdNiV1Wg
 FaP6y8AwOxkSC51PuvSmkhJKEsE6A4Z+LftB10nIvEI96HCkG527qMWh91jVBCizE3gY2SQFY2X
 9vp7khAbaKzQ0wkKLzySMDFNXZVABEJtZ0IYihn18hSm2j6DNrythrbNSv85mpKXan9VaO2H2/p
 FvFXUbH74mIfK6L276GIDkvSuDcEEB2S6Nx6ZQSykUUq60lLj345A003ODTC1DCLdCgGmzX6E9S
 w9miYJOk0sNpx/55I0cFUjbxsZGBOdLpo6tMWVfReLSVaQGC0o1/nfYmuOrTonyHOFU8bMrc8z1
 xLj6uIdZ8anoMkX+mCU/YlNb73WajtBRe2GQc40d7h16fWlteG74RdAVkkJd/3VGRcTQ0DuVyEz
 3xmKjNUj0EY5PGSM1Uw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-22_02,2026-07-21_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 spamscore=0 clxscore=1015 phishscore=0 lowpriorityscore=0
 bulkscore=0 adultscore=0 priorityscore=1501 suspectscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607220066

On 7/22/26 2:51 PM, Krzysztof Kozlowski <krzk@kernel.org> wrote:
> On Mon, Jul 20, 2026 at 09:50:34PM -0700, Hangxiang Ma wrote:
> > The Kaanapali CSI2 PHY is compatible with the existing x1e80100 CSI2
> > C-PHY/DPHY binding. Add the "qcom,kaanapali-csi2-phy" compatible.
> >
> > Signed-off-by: Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>
> > ---
> >   Documentation/devicetree/bindings/phy/qcom,x1e80100-csi2-phy.yaml | 4 +++-
> 
> There is no such file on recent next and cover letter says nothing about
> dependencies.
> 
> Best regards,
> Krzysztof
> 
> 

Sorry, I also noticed that mistake after posting this series, so it won't occur in the subsequent SM8750 series. I'll add a description of the dependencies to the cover letter in the next revision if those dependencies haven't been merged yet. Thanks a lot.

Best regards,
Hangxiang
