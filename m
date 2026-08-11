Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 65769442B0E
	for <devicetree@vger.kernel.org>; Tue, 11 Aug 2026 12:58:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786453093; cv=none; b=LzfFfWT63hnLxBF4y1TqvVGnr7t4eoKP1rSAQ+we29YNlqRperFGdd3HEYXyIYu1E/ltbTnutdb2REyuyUQ+K5jJr1s+brwaqa/wYwPxqLsMhBB4FEVTT0Nls+t/IwlsgrCuwZ5jQrB8O77oKl2UpCs/WueZb0o+8ZyFHWRhtf8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786453093; c=relaxed/simple;
	bh=OJ0ZBa2cHq5Y0PEgrdjMS1IPz7CDjDUEpXOidvKmPwU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=RP0io5cL0yLwOz0FkeO792HWJ2PDwKkZrmJz8FcfNTz8n7KrxwLHHFqWs9yLkCfSlL/2d/PoC15POBrv3fuXDY3r6qkEGVQF9WC+rpWXJbKy4teCOMrrYLwjRKmwGexu0y25MAOCKQuGUVawISG7ZX6hNZQL/72IwKXhTBPc0dQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=GKrl/IcI; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=jK5MFJRR; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="GKrl/IcI";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="jK5MFJRR"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67BCRCCO263369
	for <devicetree@vger.kernel.org>; Tue, 11 Aug 2026 12:58:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=qPcvYs0iKc+a8lJJW6pcLmsa
	ycbftBlE0kRPRVi+ltk=; b=GKrl/IcIj5msfP/wCqpLsESIRzCG/yxbkNIId7VU
	xQZYbI0sTOeSixUhqwm10geU3z55j0w97xS7PuUp+N4rylJ++uzcEra1uTg6iiO5
	ZrwdVOm3MZboFocuBfPnWIf9G9o1w5YmSIpTw+MBFW9oBeShEJeBmt16ldOxsCJX
	nvbLq6NOGMbeffsQc24WSI63UfKqTwPpkfMwYM55E1but9WXSFI+XxaK5+JMTSXR
	6hZ2d9duvVYHZVs4zRbZCGVnMXU+Y5Zguj7kzGYzthZuzYBF2WHhus10yjEmwPKP
	p4NjJ8GYelRtFt1wjFDPFc2WUQOmZPM2Jjqa2eDuTTZb/g==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fyvcr9uut-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 11 Aug 2026 12:58:11 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-51bff5c7035so59295601cf.2
        for <devicetree@vger.kernel.org>; Tue, 11 Aug 2026 05:58:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1786453090; x=1787057890; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=qPcvYs0iKc+a8lJJW6pcLmsaycbftBlE0kRPRVi+ltk=;
        b=jK5MFJRRHXbGZ9TXHshI+X3cOfRdPtsbsNnJ9m8CDjTPQqRAc/flZe8vSloW52pOfD
         jcNdz6aFsHwdxX1fuxtmLt/MjFmOBB4e/vTBeElxkMDH6sKibb5o9s7lksEGFOs+WVqi
         /u6Y7/VJUTricCLWy7ssU/t62iYPRvWf94L7dy4NqfQwXNAowwkjPN8DWfwRRdGng/ue
         wCtDMJkQFYerVHLO7KxYPUWQ1llkUsaGL2FFj8LqhQLpuuEA6SrdYfrxurrhbe1gb6EO
         5/yBnIA0REtv1lnlI/bXrLulG/DUar96wuKMugAKS36DJP13JRy78lnLq8mU3LIfdyuq
         wTIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786453090; x=1787057890;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=qPcvYs0iKc+a8lJJW6pcLmsaycbftBlE0kRPRVi+ltk=;
        b=PTBxxrm63gb3tXLsE7SVBv4Jep4KzJFsMoTDPSU7ym9EwCOoVc0uhbRzEU0iTAIjmq
         1nULVaG5QvdyNLZgloB+fg56kfFT+byXs4tkLaVxSMsGXtRqg/eYtYnsEHHgoE/HuDzh
         SneQxDrWavFSkFixWawRq6PfFkmakfegpnIp3PwV1T68VU38eU8rm3wrSvYnz9GeDiCJ
         2aipqxqbWe2+GGnyBmmV5Pa89tHZ/KBEaOXA+28orsTH6A8i7hNuywW7VZSrvUZ2jvUr
         yeWCiggN8QZ9C1n1pYlAq6yqzHj1eer96BjhGqVfJsjXtZls2TaEe2PxrG/YiV41awo2
         9VSg==
X-Forwarded-Encrypted: i=1; AHgh+Ro9FaT0guV2ftQurf75WKBoctJSZVYPduY+qTG6FcGe8sRYkNbIvXL+EBbHGuunf+wjjU4r7dYdHKcS@vger.kernel.org
X-Gm-Message-State: AOJu0YzcURYe1n5BCGd0FuLDagNod0HJ6D4MxL74SgL2CLR+tgri+Q3n
	HpRgiIvQsaciZuzn7CbQH2pWpSeO5ov7cXXf3I5x23YSdzrVGcrhn+8dOkz4VoMN/xl6dniVHJg
	GHkmF3wTDPJM2cOVxBiHSoLYCmEbLuOiCnwAMwa5muJjEAKcCoqNUfGuYzGQnzED0sisgObFC
X-Gm-Gg: AR+sD12B3INDaYaNRiQ+AjL66WoJFcCus1fJJUE2Q9tK+ZAl3fqBzyJM/RNs8sUSbqY
	ouP+uX+uXvUJcs7ZBA0RXK7C5RwBCrbyoLTAXsNZ/6uo4CLVZ9wqdpnSyMytCcnM73wNq1I9pNO
	lH+rI0rov5gw41tTsaYdUkKBlgu/Tln3gQqx1W4QpAQF5YFxmfdCjahkOzD+EahXG/WM57hWV+N
	PZGNimoWc0P77ZrgJlrX/Z0fPvuHa27w0TpIeiyDNlLJmYYk4j7zM+e/lttMYLEPNr+2FzsZOXe
	71WVF5RbhyYWcqsRh8yNSbX+ruAoHYAQpcQX/6Geyt4hq/9YFnnhtlvzyiZd5Zat1wlQrMBBi2M
	8hLdZd9q/amOirJFol4d44VzTEc/kcaNcybral4Yi0qnSUM97YyhiG0H4t0jqOc/B8XYGdu463g
	AsH/L+ZIw3Bi+/GQ==
X-Received: by 2002:ac8:7f46:0:b0:517:9095:c31b with SMTP id d75a77b69052e-52d586be44bmr24131771cf.42.1786453090665;
        Tue, 11 Aug 2026 05:58:10 -0700 (PDT)
X-Received: by 2002:ac8:7f46:0:b0:517:9095:c31b with SMTP id d75a77b69052e-52d586be44bmr24131361cf.42.1786453090242;
        Tue, 11 Aug 2026 05:58:10 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5b4486d5207sm254769e87.36.2026.08.11.05.58.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 11 Aug 2026 05:58:08 -0700 (PDT)
Date: Tue, 11 Aug 2026 15:58:06 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Maulik Shah <maulik.shah@oss.qualcomm.com>
Cc: Thomas Gleixner <tglx@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Radu Rendec <radu@rendec.net>,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: Re: [PATCH v4 3/3] arm64: dts: qcom: purwa: Drop the Hamoa
 workaround for PDC
Message-ID: <5oriin6jbb3cev32ttb6ctmb3ezrerczgvfbimfa3kyp4umxet@fqvnrfbuotrf>
References: <20260806-purwa-pdc-v4-0-62467f4b4ddc@oss.qualcomm.com>
 <20260806-purwa-pdc-v4-3-62467f4b4ddc@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260806-purwa-pdc-v4-3-62467f4b4ddc@oss.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODExMDEwOCBTYWx0ZWRfX+r0mxODYK0wY
 xkZDD8exrzVn5GxkqxsKbL986WbJpeKt5KreoMNKN3Wiyze73V8rmoDhx74B79B5DPqUracQRaB
 G5ISfGB/XOlH2xoNxfT1gljQMx9/49Dr+dPIYYeYXvFyYSwSl6mrW+TSL0Gu9hWbdZnORUccLF2
 5Fa+qbGLtfAybhFby7ugWDrwmSjQ/Z4OtJ9VuYBVyntLn19dA1Qg00b/ViWgmKiThQU1QITujGQ
 xqirYlfEFsmpg9ypnGXuk0UMP90Ysp9b6dEuV39iYJ0Dmyjkwpr1PWBlEW/F86bI4/rtitrx/iK
 YLSVZIsd5kxYv0zdIYThdXxNYu9iQwC8yq+VEeTxHo0z2eMd6EtzpbMAN4FWNPposnHhsnGSRIC
 pKw/mMFXfR7adEXlGGu9QEiSpjPMPLZBmw7vBdap65rIqNyNbYWdtlz40J0hsbKAyXh4OI+pBN0
 vKjuxrSTFq8p3Hkmd2A==
X-Authority-Analysis: v=2.4 cv=e/A2j6p/ c=1 sm=1 tr=0 ts=6a7b1c63 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22 a=EUspDBNiAAAA:8
 a=px_f_vAfgXbzbh29wf4A:9 a=CjuIK1q_8ugA:10 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-GUID: KejizATQOfslrh_uX5bggCb1BsuhsOij
X-Proofpoint-ORIG-GUID: KejizATQOfslrh_uX5bggCb1BsuhsOij
X-Proofpoint-Spam-Info: AW1haW4tMjYwODExMDEwOCBTYWx0ZWRfX60aekZHObCDb
 LRffItmPp5V9zCwqEjX/KlHnKOI0U9ovmZAN6TiaUgxMWSoa+DBV4v2i31Ha8TqzdSkEq591IkM
 ZVkJcoeiQPo+qezwcmKi+XPAyrWkXTY=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-11_02,2026-08-10_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 adultscore=0 phishscore=0 spamscore=0 impostorscore=0
 lowpriorityscore=0 suspectscore=0 clxscore=1015 bulkscore=0
 priorityscore=1501 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2608110108

On Thu, Aug 06, 2026 at 02:26:29PM +0530, Maulik Shah wrote:
> X1P42100 (Purwa) shares the X1E80100 (Hamoa) PDC device, but the hardware
> register bug addressed in commit e9a48ea4d90b ("irqchip/qcom-pdc:
> Workaround hardware register bug on X1E80100") is already fixed in
> X1P42100 silicon.
> 
> X1E80100 compatible forces the software workaround. Use the X1P42100
> specific compatible string for the PDC node to remove the workaround.
> 
> Fixes: f08edb529916 ("arm64: dts: qcom: Add X1P42100 SoC and CRD")
> Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> Signed-off-by: Maulik Shah <maulik.shah@oss.qualcomm.com>
> ---
>  arch/arm64/boot/dts/qcom/purwa.dtsi | 5 +++++
>  1 file changed, 5 insertions(+)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry
