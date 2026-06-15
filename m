Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 388C62AD2C
	for <devicetree@vger.kernel.org>; Mon, 15 Jun 2026 04:26:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781497620; cv=none; b=DILUQuk0cwqP25gDDAdXe54JszlUbuywNeM8jfL/ks/poaMPECOXjcnI9wXn/EpixoDDbR5WSk7M/8iuePahiFVFWHMCDyOINCS35htynKX4eYZomqs/YAwac4nJ6BLK0j+38XQBuyfD/es2qIZfI21sNpReX30ngT4J+yAs8yY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781497620; c=relaxed/simple;
	bh=xVsyuODdVz9kxo75UvGI4b6xOcgVg2E/JYbrEZYn87o=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=OHDDpNWvTKXnfPqq24hVnvh0XQtWJwkfQ04j7M8iSLOd2JBmFOcDLeFUjoc5ALLNCwDZNpa6x/div6taYAmv7W93N+DJpDjwS1SZj3A1OaXtMqMeK9KE0ZR5Z4jw4VA/qrepigF/6YbwTsDnExR3Y167yezv04kSLnQv/OtcP1o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=mcdVhBPb; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=HBxnHKzX; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="mcdVhBPb";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="HBxnHKzX"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65F1iI211228071
	for <devicetree@vger.kernel.org>; Mon, 15 Jun 2026 04:26:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=ius7qSkqzXV/plY/PfxR7AWe
	MN4ainKUgEjXPW/93NE=; b=mcdVhBPbSKzQTqHys85yFccY/q1MdqJ6b4igU7DM
	RsQVUFzjWaEDez45O/afLn/nED+puAwousbBXTdh0ZGnVKUhUh8WkYqT6TVh9PK7
	BsrkRIuTk4MYRuiKAUAzm4FuJs7kAr/H8eMt2cjJnbck9DuGouPGuxDP5i3SAG6p
	7bxs5Sxfseek8aNwedw38AJW93R7bI3oOxU8+Y+tgd8ga9nWmnE82xgJllnkn9jM
	VP2a/G6taB+giFNN5sJJd4/KHlqxw0YeE7+RDcH42DlWxYAFuCEaCRZPvRWon4kD
	RMx1b/Tr3/RaYwK0X7w3RGg6gPFr5kmmmjdvdp4hAJYnSg==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4eryffnejb-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 15 Jun 2026 04:26:58 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2c0d0516ad7so30050345ad.0
        for <devicetree@vger.kernel.org>; Sun, 14 Jun 2026 21:26:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781497618; x=1782102418; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=ius7qSkqzXV/plY/PfxR7AWeMN4ainKUgEjXPW/93NE=;
        b=HBxnHKzXT238a/c0wdUam0EWsbCigMQ+1zlG6Y7nTEPgLMT9yPlaa5RlM/2091Wg8t
         p/fpJj7gEQiQUJ3D7SEuxD+sbsMh3aAiKvYDYg+wtaTx5B+XIFo5SHULU2tTQSrXsLHG
         05PAxY2JnQtLCa9HwT5agdxgpYrGI65Wip6Lz1z0Y3TP+0u7u7c29hNpmQA6i8RPlk9C
         1N5t9N7rNw4hT6Izdy/Y8jt1ov7s3RUiDQos8l3xZEg0jUje9gNfi7Zl4qPR7U6pOAAC
         8LwWRMwWA7dYZO2+Ot9kpZ/7uZecOA4cXUcKnLgmfKVgIaCMkqQIDzCGAq5bNqyTzumR
         9kVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781497618; x=1782102418;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ius7qSkqzXV/plY/PfxR7AWeMN4ainKUgEjXPW/93NE=;
        b=UtdzIMw0vorsNx+Kk7nI3s8qgrvvGXrH7no0Bur4h6r0Ou8CDrinoSPHx3oUZPlF8+
         4esQnkhm7QMJLTzbUQmr6kchOl8YN+cuQJiQAqRIDcYVkcnE4CmNKyzpMiIUNdxkhzN5
         MN7L5mYlzVFGpfVZlesjApM9Sd2IA3DvYf/ewPAP5pmiqh/xYJpxpi6DZjy0kfEK7ntK
         vv1JPDjUsPWwE9HTn2Lb2Xxds3JKYcPKwCEkGg1GqxA9nmR+ydvsA0dCxBKAuCshOjwA
         blUu/M8jLIX+4eTBUa838DsbRyGcmiLtw/N0AYwScqaxnpxWlvRnVEsOL859yVUeSy68
         jOYg==
X-Forwarded-Encrypted: i=1; AFNElJ8P52TJ/v6DIpbcZzaSkEHC4WCKjHBY1n0GLm09GTiTnDWZK6WzgmBSTofch3YI8YrFcswIJlIBm/E8@vger.kernel.org
X-Gm-Message-State: AOJu0YyBgz0HEodPYTfaLjgPkEoOqiraTYwYG1BtOYWbJ0aCZXX5ETkV
	+nw0a8b8CGUCUzi/2r2xgijn8R6Z64r8Dh9y4z41ArwqDqJ/esiHjmTac2gqmzCd3v+zuJxeNRi
	8AWWLMVGJfu2HX59KA/T7oj6iVclGcTZILNabZnLNpZAM0YJAYzgvCnGk5jZseZ7C
X-Gm-Gg: Acq92OHYqCZLoHvS0vrqAG76JXalboPqo6YozjkYRNaCj4gbBahYo9h7DU/tqOEErGS
	6QuuejlX59Si36zVLZ2BinsT4Wv3RFyxjm/7bhHo6caYpE+P35v2/OemI5JAe/UiXQLPeZQrqkY
	c2Jc812o3rcRB8ht+8FSWtdyFB8Kfd4JuGXTzpD9o9jTrr+yCrUcHKECYvarTquFHuE9b5x6tbC
	Zw7z2UaR048SmHQKsD7TlLfGHba57CwbjM/z78oGfbfKwCn+bbI026h16V4FPH0SoQBEfZzl/Ks
	DvR5xl+DzArlxJ7X69mWdTs9tXPc3blhhNx21VdHQmvd0LZF58zcKkpH3Uge5mR+u1udQRcDfbp
	m+ABEPwsQw7D3q6/1qm20MZTbQB5SUuzCpLA=
X-Received: by 2002:a17:902:da8c:b0:2ba:7881:948d with SMTP id d9443c01a7336-2c664148a6fmr98607145ad.1.1781497617754;
        Sun, 14 Jun 2026 21:26:57 -0700 (PDT)
X-Received: by 2002:a17:902:da8c:b0:2ba:7881:948d with SMTP id d9443c01a7336-2c664148a6fmr98606755ad.1.1781497617294;
        Sun, 14 Jun 2026 21:26:57 -0700 (PDT)
Received: from oss.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2c4327ac80asm77208425ad.39.2026.06.14.21.26.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 14 Jun 2026 21:26:56 -0700 (PDT)
Date: Mon, 15 Jun 2026 09:56:49 +0530
From: Mohd Ayaan Anwar <mohd.anwar@oss.qualcomm.com>
To: Andrew Lunn <andrew+netdev@lunn.ch>,
        "David S. Miller" <davem@davemloft.net>,
        Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
        Paolo Abeni <pabeni@redhat.com>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Richard Cochran <richardcochran@gmail.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Maxime Coquelin <mcoquelin.stm32@gmail.com>,
        Alexandre Torgue <alexandre.torgue@foss.st.com>,
        Russell King <linux@armlinux.org.uk>
Cc: linux-arm-msm@vger.kernel.org, netdev@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-stm32@st-md-mailman.stormreply.com,
        linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH RFC 6/9] arm64: dts: qcom: shikra: Add ethernet nodes
Message-ID: <ai9/CWh9oRpYvHfA@oss.qualcomm.com>
References: <20260612-shikra_ethernet-v1-0-f0f4a1d19929@oss.qualcomm.com>
 <20260612-shikra_ethernet-v1-6-f0f4a1d19929@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260612-shikra_ethernet-v1-6-f0f4a1d19929@oss.qualcomm.com>
X-Authority-Analysis: v=2.4 cv=HuxG3UTS c=1 sm=1 tr=0 ts=6a2f7f12 cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=kj9zAlcOel0A:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=ppQq2EeoAVl_dUmsFbgA:9 a=CjuIK1q_8ugA:10 a=zZCYzV9kfG8A:10
 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-ORIG-GUID: BgJYZsk0_a2QlcW6oDrN6xd4-iS7K2Ei
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjE1MDA0MSBTYWx0ZWRfXxMflT88EErkm
 9LMbglc7L7Q+Su0UNmftDkJXfWrT3QiHqsdWaYSjr51r1tiJxqyiZEuUdPmK7qQf0Vw52EJupPL
 7Hrf39SKfpLsOdFxm0fMhF/pLIt0FsI=
X-Proofpoint-GUID: BgJYZsk0_a2QlcW6oDrN6xd4-iS7K2Ei
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjE1MDA0MSBTYWx0ZWRfX+g3/hkPeWqvk
 lvCjOeD27kncarFMYOdrZCPQehIGQ/N7nVfPqOA/ojIeoeTzLAmf6U0X0vSGFQGBpd6Yxw3JxI3
 5ROnnUb67Me6wzXKmUJlLAd5BoTeycapcY09GEblvtyxgzx7q/UZNAiHJNUnNgI0By5QK0CBwAh
 fltAwoIRmi7K1Fe+7pheG9Qp5jpSfWDfRNrVyJdFknnk/UvQ5Dau6pZPFboh3K49/yexNI90CTy
 Ip0jh3G60wnoxpjslqHqrmDDsoOmypOsNy0Q41vWuNCHGoTdOLzaS4RtvoMcriE+2qp0IaUWvHP
 uttnZ6VzdIsSidJ3fie1A4KppSs4elxGuUYDpXswj9IVewnV/E0mFopRt8nhpu7G0deEy4vijwn
 xebs6GtbOHcZQNAL/f894j/ewPWjkqGT4zHNzTi51GlAfxIXlKFEk/9BWj5ipRS0svDdLAcyRkf
 iRAGbmkvzqYwkSbfVIg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-15_01,2026-06-12_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 bulkscore=0 adultscore=0 impostorscore=0
 priorityscore=1501 phishscore=0 clxscore=1015 spamscore=0 suspectscore=0
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606040000
 definitions=main-2606150041

On Fri, Jun 12, 2026 at 12:07:02AM +0530, Mohd Ayaan Anwar wrote:
> +			clocks = <&gcc GCC_EMAC0_AXI_CLK>,
> +				 <&gcc GCC_EMAC0_AHB_CLK>,
> +				 <&gcc GCC_EMAC0_PTP_CLK>,
> +				 <&gcc GCC_EMAC0_RGMII_CLK>,
> +				 <&gcc GCC_EMAC0_AXI_CLK>,
> +				 <&gcc GCC_EMAC0_AXI_SYS_NOC_CLK>,
> +				 <&gcc GCC_PCIE_TILE_AXI_SYS_NOC_CLK>;
> +			clock-names = "stmmaceth", "pclk", "ptp_ref", "rgmii",
> +				      "axi", "axi-noc", "pcie-tile-axi-noc";
> +

I now realize that having GCC_EMAC0_AXI_CLK for both "stmmaceth" and
"axi" clocks is probably wrong. I will remove "axi" and have the glue
driver enable and set rates for "stmmaceth", "axi-noc" and
"pcie-tile-axi-noc" to ungate DDR access.

	Ayaan
