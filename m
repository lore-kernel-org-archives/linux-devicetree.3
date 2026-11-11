Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794424959;
	b=pn4LXzNGhWlAvGVHGMcKWnmI1+6/ATwUAB6upWqVk41HrgS6kSsPpex96fjxZvpQFovT
	 lmaDV/rr+w2GW2SymvGvyIGqAdkjn0Ys9YT7D9D6hWJFrNSisQ1bAxjetj0BXg3M+MlV0
	 h5/ohB4XPdD1DhemWlun85nslIBwNPVKeWYZ9mWK7iBzY/tFEMvqr9oULOW2sCivvzZGc
	 zqjndUlsvbRaCZ+bNW60Mamuxf70V37I0q3Be2n7zSzIP6Mvo2jjcunAMBcFVwLeHdL4z
	 IWPdBPNR953s8VCCshbEFTM1DYWDPRdhawo1H8EmNbg/FGhqHi792GFYz3NA4O8LT+Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794424959;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Date:From:
	 To:Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:Content-Transfer-Encoding:In-Reply-To:
	 X-Proofpoint-ORIG-GUID:X-Authority-Analysis:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=ReekrPpGktMFuSDQYs4o53/ZO85RZPgLvI6NpbtxPhc=;
	b=bK7A+MSvYEHfugcc8eoLRZQOhnBQ3vCjZr9fj8EkgTwGlQMIFpNJPJ0YlNoiXxwJoVvL
	 qqO7HlM42T54e8oWGNcfTZKKgBEGQbagbu1BY1rG3VqYc7b1ymEn+ixIvz9u9w+a26Rwu
	 w8sousX8t2WW3px0GT4PTLcM5HDjMKhBi3aza0gffiOrrtaMolTDboAxqnWaQf/Vx1h1t
	 b2GDh1bN7gdtTVFNssTQmAy5Z2B/+zO5srxvKFXKpZ18CCWz/CHSqn8kKif8i6aVkf6ii
	 LXjWmdp3iqXQ5HZTcqNEoxYOxxfRzLj6bQw9VuHU5a8d6nuatFY4SDJVLJQd+Qw5qjA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=a6cnb6rt;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Bcsk+ogP;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B1E14606A321
	for <devicetree@vger.kernel.org>; Wed, 11 Nov 2026 19:22:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B1E14606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=a6cnb6rt;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Bcsk+ogP
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6ABIpl6r2079959
	for <devicetree@vger.kernel.org>; Wed, 11 Nov 2026 19:22:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ReekrPpGktMFuSDQYs4o53/ZO85RZPgLvI6NpbtxPhc=; b=a6cnb6rtjgtl9v5k
	zwR8A7DkvUbAkut5S7wJvi8kO4xkz7knxYDT1LfMk8y33eE4Ip1dh0ufrudEFW7S
	UEAgl/+waZYamYSv/1vNP87MnWieZVH6sJHzayXjf81wM3SyuP8hF/OXnF3GtfgV
	c6RUbaupg9tfyaPFjJFVO3eN0TCuuo2XD8WGZo2YekeSEQc9IehNGDaHD3gzF0Kf
	nBEkl4zkEvaLE4/emMURa3So9/KiwroM2gkPwUm4oUVUIlk49vQl6RMVuuXQdr/Q
	LT4EgY/TAIimtftkQavM+XsX6SB/JZ+vxoehs89OUisn05V2iC7S0NElPjjf/Lw8
	NI9ReA==
Received: from mail-dy1-f200.google.com (mail-dy1-f200.google.com [74.125.82.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hvs4m1kws-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 11 Nov 2026 19:22:37 +0000 (GMT)
Received: by mail-dy1-f200.google.com with SMTP id 5a478bee46e88-36a3451ea93so4912237eec.1
        for <devicetree@vger.kernel.org>; Wed, 11 Nov 2026 11:22:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794424956; x=1795029756; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=ReekrPpGktMFuSDQYs4o53/ZO85RZPgLvI6NpbtxPhc=;
        b=Bcsk+ogPcLGsWWSpFpv0eCRKYpYWl7WHrlDhu6DeXQpi6y9wlxkFaez2xxLrwBVvwj
         wRGg0jIg4nWyti8wlhlwwEZE4yScWgv2oU4xVhfrg/HoUjaAhuV8ZdkScqvaLIr9lA9J
         Ziuvvb1t1zbj7ScuMaJt5uipvQKudHhNdONNDr6+qagJ56l4lnOegkxR/SCg+aum/OYh
         PznXbmam2/XqHIXW73uEDeVp+BTWJLiSX8BP3IboFh4zNsvEhNB2zPyEGgn5AvZrujFI
         pxHhlXWBaR6Ha7T+ku9lGm9i/E3uXxisdSBDxeHBV2Nx0yLd55TUFPXGdyOe7uYAWUwY
         KHww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794424956; x=1795029756;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=ReekrPpGktMFuSDQYs4o53/ZO85RZPgLvI6NpbtxPhc=;
        b=PDTK825IkxhPO8Z87NWdlkjBcO1hgk96UAdLWmla8iz5AXAVcQAZjO2VzsicoKH0y0
         rvgGulTeNT4tYBiz2n0fUNpkbvy30G3a3xQZvmwQoFyX0PPlSmlxJT1uEni3nsuQxWrI
         cohH1zYW/OMfxdXPtCJtykz1/lWvbr5OjYeqD0tUZ13lRGSDMsW4/9nWYGKLEnyDe8MC
         +TjgmoM6bY+SBjeyHt/k0F3rpEZzZtkhDt5Kn1Lpbw6+1t+deMgFtyVH6HAfIePatrjo
         jJ633vSPQwO8wir4VmfZIH1peLhgmWUEa8WvY+v0PAxHT92UrZVHFzyUTfh4tfKc6Dc3
         JlcA==
X-Forwarded-Encrypted: i=1; AL+hErFtqnUdAlVJas8orx74gdaQq100lkOpHItPBLgvzJrLlOB40PhdukXdcxXBQmSm5FUkskMwRGOsqUOO@vger.kernel.org
X-Gm-Message-State: APuU4Z8WV02Kh82OpBadUXerYmQPWjZXVDbTGDvrk+HiG7DhRF/rSA5k
	9K+C3aoWWW2rWQrhp6zmZRMA4bJa1ho3FHJzcMRy0bNXZwlWIFjat4g84+0dtXlsLGGsMO6FcyL
	uPNRabbiC3QbPwJuLjzKL3+2i8v/lJobdbLBf/IcWeLSvi4wMTld5IG882OAykcqy
X-Gm-Gg: AYBFou3YRt6INLdADtL1OoCoW1br7nWamwlkdbWgJWcDpSlUWl5YcwBwrD+Cq5Sfc6w
	2f9mBOw1/5Tr8MrZZvqtFnyKEIFSw85rCs8dWZ5k/otB2wSNiHoUvvNSp4zCNGj4VNCEEEqLalz
	1UJVlPWEYeHF1RD2A0dyaaF15NEDaHnqitIcIPlHRIAU4j10KDx1igUMsKPHO9Y5RG8nInPscJz
	Ykp9ivpFjeQpqogWIrKdh9a8Gx2o5caId5VjHl01xLTN146nsbFBfuDAPg+F5+UrPu+LaqkknzL
	lBcwqAeaxpwK0u9BT6bvqTEiy1u1U6tIV/cFgxQgf+HTYHlwHpAmFkDd602ysRV0g7BVhqBWC7i
	4wHJvpy+hoxQJiP44d/7cUA6wUgRsFx8fA2ifL5cLLBuu4I6AtXye4bILG+3tPRxz/dNQm2uPOh
	WugqB2Eyz0FKo=
X-Received: by 2002:a05:693c:87c4:10b0:36f:9d8:4a33 with SMTP id 5a478bee46e88-376867551b7mr3870111eec.31.1794424956301;
        Wed, 11 Nov 2026 11:22:36 -0800 (PST)
X-Received: by 2002:a05:693c:87c4:10b0:36f:9d8:4a33 with SMTP id 5a478bee46e88-376867551b7mr3870085eec.31.1794424955755;
        Wed, 11 Nov 2026 11:22:35 -0800 (PST)
Received: from hu-arakshit-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-37520512ec1sm17793328eec.12.2026.11.11.11.22.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Nov 2026 11:22:35 -0800 (PST)
Date: Thu, 12 Nov 2026 00:52:27 +0530
From: Abhinaba Rakshit <abhinaba.rakshit@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Manivannan Sadhasivam <mani@kernel.org>,
        "James E.J. Bottomley" <James.Bottomley@hansenpartnership.com>,
        "Martin K. Petersen" <martin.petersen@oracle.com>,
        Adrian Hunter <adrian.hunter@intel.com>, Ulf Hansson <ulfh@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Neeraj Soni <neeraj.soni@oss.qualcomm.com>,
        Harshal Dev <harshal.dev@oss.qualcomm.com>,
        Kuldeep Singh <kuldeep.singh@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-scsi@vger.kernel.org, linux-mmc@vger.kernel.org,
        devicetree@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: Re: [PATCH v12 0/6] Enable ICE clock scaling
Message-ID: <avTAcw+DZtJ7bSTG@hu-arakshit-hyd.qualcomm.com>
References: <20260824-enable-ice-clock-scaling-v12-0-09271f583dc6@oss.qualcomm.com>
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260824-enable-ice-clock-scaling-v12-0-09271f583dc6@oss.qualcomm.com>
X-Proofpoint-ORIG-GUID: 8b_ASCm5UXB5Fe8E8k4fmevexsyuTwU5
X-Authority-Analysis: v=2.4 cv=OYANnRTY c=1 sm=1 tr=0 ts=6af4c07d cx=c_pps
 a=PfFC4Oe2JQzmKTvty2cRDw==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=FeIq2xlXlOKQ0BwA5tkA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=6Ab_bkdmUrQuMsNx7PHu:22
X-Proofpoint-GUID: 8b_ASCm5UXB5Fe8E8k4fmevexsyuTwU5
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTExMDA3NyBTYWx0ZWRfX5edREA1D0KoK
 eqF1ldZZdAULiNPGRY+e85/AUdRAehAnR3GQE1vgISjX9JcS3JF3PcbIt3TyoEBSidjnery0wv5
 1vhJLEjUfW8B9mFVQ+2QTtWbSA6HpK8sMubYFLmU5XTFaAAiyIm/nSrUsDCUVF3hYKVVAbwroF1
 5iS8VV0kMWMGShL8b70iir/9PSRQNxrVSDYLf7+NAEzba1LpgSx6N/Nwv7fhGSP1FtzcXHZSiX0
 EYdHlyECosuSi4Ly+v/dQvyd5RkfrU+tf4bgEyDtHzrDjVlCMALR05tcEfHjMqS4i+wycRdJupn
 y1jbHPrMhpV9hFom/chspbx7cWF2X6z4sYetU2fDvqfncjR/cIGJBOWB/HK77J6GdVQpZTLd2N7
 Ml13JqlVu+1REsmxmSMKMwjHns1ZkziAvERJhc6IliRjwo0BE3/nqYdL5bacpepLwz1IJs76LEh
 Ny594P4aPzwkkkN725A==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTExMDA3NyBTYWx0ZWRfXy/boFIosNnKr
 s9/xpV6xxQCZUO5AsIHRT4YSbG2REMRx05vLsAN9nA1WgeKZhqeeRTrDfnVwYMnTyynghdeBuGK
 Adk49LFpSkp0pNJau4JiZbaLcJwSzWI=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-11_05,2026-11-11_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 impostorscore=0 adultscore=0 clxscore=1015 lowpriorityscore=0
 phishscore=0 priorityscore=1501 suspectscore=0 bulkscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611110077

On Mon, Aug 24, 2026 at 01:17:37AM +0530, Abhinaba Rakshit wrote:
> Introduce support for dynamic clock scaling of the ICE (Inline Crypto Engine)
> using the OPP framework. During ICE device probe, the driver now attempts to
> parse an optional OPP table from the ICE-specific device tree node for 
> DVFS-aware operations. API qcom_ice_scale_clk is exposed by ICE driver
> and is invoked by UFS host controller driver in response to clock scaling
> requests, ensuring coordination between ICE and host controller.
> 
> For MMC controllers that do not support clock scaling, the ICE clock frequency
> is kept aligned with the MMC controller’s clock rate (TURBO) to ensure
> consistent operation.
> 
> Dynamic clock scaling based on OPP tables enables better power-performance
> trade-offs. By adjusting ICE clock frequencies according to workload and power
> constraints, the system can achieve higher throughput when needed and 
> reduce power consumption during idle or low-load conditions.
> 
> The OPP table remains optional, absence of the table will not cause
> probe failure. However, in the absence of an OPP table, ICE clocks will
> remain at their default rates, which may limit performance under
> high-load scenarios or prevent performance optimizations during idle periods.
> 
> Testing:
> * dtbs_check
> * Validated on Rb3Gen2, qcs8300-ride-sx and LeMans-evk
> 
> Merge Order and Dependencies
> ============================
> 
> Patch 2 is dependent on patch 1 for the qcom_ice_scale_clk() API to be available.
> Patch 3 is dependent on patch 1 for the qcom_ice_scale_clk() API to be available.
> 
> Due to dependency, all patches should go through Qcom SoC tree.
> 
> This patchset supersedes earlier ICE clock scaling series (v1–v11) with updated dependencies.
> Hence, this patchset also *Depends-On* the following patchseries:
> 
> [1] Enable sdhc inline crypto engine for kodiak and monaco
>     https://lore.kernel.org/all/20260707-ice_emmc_support-v9-0-701c86f3c25b@oss.qualcomm.com/
> 
> Similar to patchset v11, patchset v12 is rebased on top of latest changes picked onto linux-next.
> 
> Signed-off-by: Abhinaba Rakshit <abhinaba.rakshit@oss.qualcomm.com>

Hello Bjorn,

This series has been posted for a while now and I don't see any outstanding review comments on it.
Could you pick it up into your tree for next RC?

Although the series reads as a feature enablement, it's addressing a real regression: on several chipsets,
turning on the Inline Crypto Engine today causes a significant storage throughput drop without this
series applied.

For example:
Without ICE:         Sequential Read:  220 MB/s,     Sequential Write: 310 MB/s
With ICE enabled:    Sequential Read:  143.717 MB/s, Sequential Write: 126.762 MB/s

That's roughly a 35-60% drop in throughput (averaging ~50%). This series is what makes ICE usable without
that penalty, so merging it would let anyone enabling ICE today actually get the performance it's meant
to provide.

Abhinaba Rakshit
