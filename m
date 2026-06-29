Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BA7AC3624A8
	for <devicetree@vger.kernel.org>; Mon, 29 Jun 2026 10:52:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782730323; cv=none; b=Aua3FWOBZ7IrxnnH5DkA5YvrBbIdxkQ9Fc2+idOMP6RfwM+Op/luZ7bBoXcSE+qjFz4GkOt/sPWpRiMrWdkm3/hjLyflmfAssOkOK6B92WuhFX+gDVk6ZrSMvMcisjaMFLRCoOt65FbHYTbWNpn/SMC6+RlV13mkSGt5Phg0lAg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782730323; c=relaxed/simple;
	bh=/yFq6cv4qDUqGkjvgniB56rgIVtjmTo/cD+e1+Lpb7E=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=loKgrkqlNMNM6FlqeIG9toJn19yRmypjtNUEAdxDwArEEdo8JsLfgL/bo40s/izYJMUW/nI8oSR4ca2DP21me4jFRpGq6mMZi8JyAkSY4g9QWcBUJ3uN0aNx84e4cek/bkaGBw8u6T/bYUG4M/U6oKH36oDCzUsUtJf8sfirkkM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=bGzGpZVp; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=VsPWPCtD; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="bGzGpZVp";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="VsPWPCtD"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65TATKNC2656125
	for <devicetree@vger.kernel.org>; Mon, 29 Jun 2026 10:52:01 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	kj+mCYqTD3MrXFTYCaumQ3xi+dZUnCc64AqDHiFZ5qs=; b=bGzGpZVppks/rbye
	8Evtcor0yVvrQtO4fU+3lzK+neZBBlllWAE1vjQRkpcBeqzHu4y0q2VOgNbAL4Vl
	/oHEvpKP1pC2CRMmVpM3V+iIFY/J/byoQsiZArSc59HnGl9gaQ5Uan7s0xiV8NgY
	ZJsjuPGSsIYdvpKUwyZw3ozAbiHEVH+8V9vhJB2eed2gHEFmltN8OPFPxdKHNc9S
	ExcPebUQFcXZM9yRyqGurrmXELN7FjEYp62OmXekDSXZ4LBGSqoZ+u5rccO6iBhI
	edYNOr7YlNGRwFZwPER5lH61NQnTA1k6N+y3Y9g6exWQtDlxDOTJcwYtLJu1YMzF
	xpcIjQ==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f3np7ge56-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 29 Jun 2026 10:52:00 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-92e5e21552dso2127485a.0
        for <devicetree@vger.kernel.org>; Mon, 29 Jun 2026 03:52:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782730320; x=1783335120; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=kj+mCYqTD3MrXFTYCaumQ3xi+dZUnCc64AqDHiFZ5qs=;
        b=VsPWPCtDIyGAV4YyIlWu3twU9DbEiHD3X+hG/rxeCv7XIm2GbGLVgl7E5+3SmitMRD
         M4Prv6qmQb3m7ildd5QcHkdJ2cB4vHbjmXaJ8YWBtpkOWx2PX/kqb51bLfMpvrRTpbdv
         JzhrDpsLlsLo3q0WEvPOrulRHRCzbPBucrni5BrAUd/TOt8i2S35jW5tAUbPov6Sbo2n
         67SHQVRh8a1ssb7KHtyFgNwz2qBbtyB7FhGlXYPlGukQtOEiWx0Yv9jJMQh1gwwg+G+l
         XsAYTeL5tKTWARwxbelCVwHlb38DF+zCxf2DxhkiZDsuDjyDrd/LnF2ZtD0muydxanu6
         KTPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782730320; x=1783335120;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=kj+mCYqTD3MrXFTYCaumQ3xi+dZUnCc64AqDHiFZ5qs=;
        b=DsuC5lI3QgHsXc0wLM7CyxjbmRgdF8Ee6C7NK25om3+hC1jHtpiu27LE+T4U4HvQSF
         mSppjNBsGo7hGm5nop2YMMQYKTRRL3fGR/HQ4+Ohp+xYQjGuSFr+EbjStSY+FPS2Uf/P
         0M4H+D1toVyR0CuNCszVGgbS9l3FxpCXl7mxEZUzgLKfa+QV7YspBaFqw57C2JS+r4sA
         /2zp02FE9koO4zj27Axr994L3XbaS2JxmxdIoiiLs6eBgOna5SfBKBgzoVoktXNhcl/R
         lCkMDUmF0sG2Do9wvRS3ZfXJ6Z9lpO1NtmuTfgXUljhAU4HFmQRzOdubGwFd5UTZUxYZ
         RYcw==
X-Forwarded-Encrypted: i=1; AFNElJ9cInVXB8yaTk3vhM0N7r3M3TWRCvC/pSSf1Aq6icba5Uol9V9TpiTOMbxYZI87AsCqWxFPf5kaafEx@vger.kernel.org
X-Gm-Message-State: AOJu0YwHzVQbIccNeYh5XJbbAz++sXwc57IB9JcRtgSW62ooGuEFhc1U
	+sfC+vuVo4t5LWPngqCcZGl+xuUJMb6cVzzF7bBD+PEE8SZUu4D4Ab699u7KH4sO3tCD9ZKV/fr
	csdc1Jyxukbr9/8wox90EKr4POQXwmdsFUJAfzKp7cjlzXPBvMfDnScMqhp1nsWp+
X-Gm-Gg: AfdE7cn2cILFP5xScgFAdJx6Y1jFKC5DI9mCPk6Tvh/nCm4TJKs9H/BHYDfXNNZvQzD
	brBc9e/ZLsURDCtU83M/5Xdt4QdAYx3QNY40vW86N6u639JcWPPByFAmKG71llaDRPHafbw/dSs
	AW/kHpQcadheGXVQjLG7CGT/PdhjSiIk5v5hV5PVL8UTAXrxfskiqrbdFJBLCDzjfxsdW9M0+Ij
	n/lI3D6oGTOzPbHRATdcoDau2LRvnuCCykEsTe3UAM5c8BqWa4Oc4mCjKWFxXjJ/qQqeBqyvAn3
	q3egRZW7C59m40nIUMKw2oHdwpze5TkEqZz2haAY9ATfs5MPShGKyOkddk3w8C+m3YHqHTzjf4/
	qmUOMM+eeYKwmIcfJ4CFjbNSeD2cMxvB1Axw=
X-Received: by 2002:a05:620a:4493:b0:915:7d6a:4f99 with SMTP id af79cd13be357-9293c7e9bb9mr1395779585a.5.1782730320059;
        Mon, 29 Jun 2026 03:52:00 -0700 (PDT)
X-Received: by 2002:a05:620a:4493:b0:915:7d6a:4f99 with SMTP id af79cd13be357-9293c7e9bb9mr1395776885a.5.1782730319428;
        Mon, 29 Jun 2026 03:51:59 -0700 (PDT)
Received: from [192.168.120.170] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c126bcb08desm120592366b.51.2026.06.29.03.51.56
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 29 Jun 2026 03:51:58 -0700 (PDT)
Message-ID: <8811c181-9caf-4797-8e17-52311702e292@oss.qualcomm.com>
Date: Mon, 29 Jun 2026 12:51:55 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 0/3] phy: qcom: qmp-pcie: Add vdda-refgen supply
 support for Glymur
To: Qiang Yu <qiang.yu@oss.qualcomm.com>, Vinod Koul <vkoul@kernel.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260623-phy_refgen-v2-0-4d15983bf91d@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260623-phy_refgen-v2-0-4d15983bf91d@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjI5MDA4OCBTYWx0ZWRfX/zoRUUzFyAtC
 n13QyOj1bkL+gNL4wWVjMFkumQFDqVQS5VRNw0Y07qsOEKHmXgneBDdeYi0gJrGYhLvBglZPVKi
 SgHbHrl+PQYcSJ54eflJSW19FCzvmhAX3dS6HopB7RCZAkVKLZffElBc7MHBdjssidL3aPLw7L6
 uJI45n1aNib0lGNT6kM+YpnFXvJRRy3YA2Vktcz1QaPAeLWqah00qJyJb7KbdyNjqa2DDUgsGYT
 6PrEujf5tmXBeYFsqN8dI+yHLMxzkXlpZj+1xq9erdup/FhRk6HXWR4dOWq/YihKB0pQUnoHTvn
 ULz1CHPSyV6wxHX835pneS9xfAMPX1le2HZSM2v0vTfc86uWZUNdvT2q3u9EfWOglpMs/Zup5JS
 322XEbMzZtbwPSR1Llr9nPbSPnN/rEfZN/Q18pchqEpJ9qVyIyTcTq8h52e0a8Gd0aOj+ysaMF0
 0qbjP47IJmEoYRi/uVg==
X-Proofpoint-GUID: dH8NyX0WUfXgfKvcbRMlsMhSQZxM7Qxz
X-Proofpoint-ORIG-GUID: dH8NyX0WUfXgfKvcbRMlsMhSQZxM7Qxz
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjI5MDA4OCBTYWx0ZWRfXyeMos2/rPN1p
 1wtRYxd0dlrAOQgaKTp58xbsw6kxnKlo2RoiH3z5qyXODtoX0ARMjhJSJG78jNPtgORH5iloIdA
 XBlcI6CD4FSzwcFQYzEbAfMCf3Gz4sQ=
X-Authority-Analysis: v=2.4 cv=OcWoyBTY c=1 sm=1 tr=0 ts=6a424e50 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=vCEpQpMPtrpGXR5ZkIYA:9 a=QEXdDO2ut3YA:10
 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-29_03,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 adultscore=0 spamscore=0 clxscore=1015 phishscore=0
 bulkscore=0 suspectscore=0 impostorscore=0 malwarescore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2606290088

On 6/23/26 3:05 PM, Qiang Yu wrote:
> The PCIe QMP PHYs on Glymur require both refgen for stable reference
> voltage and qref for stable reference clock. The refgen requires two power
> supplies: vdda-refgen0p9 and vdda-refgen1p2.
> 
> can be extended in the future.
> 
> This series creates a Glymur-specific supply list including the refgen
> supplies and updates both Gen5x4 and Gen4x2 configurations to use it.
> 
> Signed-off-by: Qiang Yu <qiang.yu@oss.qualcomm.com>
> 
> Changes in v2:
> - Add dts patch in this series.
> - Reword commit msg of dtbinding patch.
> - Link to v1: https://lore.kernel.org/all/20260208-refgen-v1-0-87ca84fd78b3@oss.qualcomm.com/ 
> 
> ---

Is this necessary (for Glymur) now that we correlated some of the
TCSR clocks with the right nodes?

Perhaps this would be necessary for Mahua since its clocks don't
require QREF (or we can lie about it and handle them there)?

Konrad
