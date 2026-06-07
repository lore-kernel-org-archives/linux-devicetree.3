Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D2BFC314A8D
	for <devicetree@vger.kernel.org>; Sun,  7 Jun 2026 21:25:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780867512; cv=none; b=Ij0kHm+Uoryq+VUuq9q9CD7Gng9/igH7/+2zjjl27WVZEm1+3jTDvMUWcqDTwQhhnQoSwSjscFLdUHZ6ussLheU3JDYwMjbGeNvcXieA03f3XwdmFmktgCoo5EfRkxb4uuxZWOymkaG/AOX2OH3XL/u6Jt0GWxkDViQeglHh8FU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780867512; c=relaxed/simple;
	bh=JspvaUJRNeFY/zfOlAVhSEXztX+e6YmJbVR2DNvyD84=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Z3CoaUr+uwNQhNOTS/ZlOPCcr0e27Q6UB3j9gTphztkPmsWEmjuEzKZHS9xd6m6EvNYBi6umYpa0nekPCeZiYQHxeAavUHan+lzT3Hw77nH871C8QuFJKykpe4HYtsUHguuvfbQm0/TIIgJ5acZFF4yLWe28gIO/ckemG8DVWOY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=dGL3uKVu; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=a2YdbvCL; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="dGL3uKVu";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="a2YdbvCL"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 657El3P6796913
	for <devicetree@vger.kernel.org>; Sun, 7 Jun 2026 21:25:10 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=ozNLs3FUHY1eJZG59vKhqJiZ
	Z3qQ6l8PY0jEa/SkSdo=; b=dGL3uKVuzuQIgPMrisOPESGgRTZ5gaziUgrAbWJl
	L9IgzWqN+i99OQHGvHbP8VJ8qkUa0+iJ6jHSPMmJUeZJpET6v1GeemKXA8hagB2v
	MjuEFm9ibp9N0Wc5uvVYWKIy8pkuTb9bROEODNlWTOQx95GeiRovo+seaNrSGti9
	SgL8vzAE0ttswpGRoU2BrQobYqvaIn6SI98NqkCgY99anYLYmTvy8dzv997akvxY
	cimLlxwhIFKDkCT2v3ikAOfD56KyRN2gokVDkhpX3kP6p1utDepdhwXB2hnj0NBV
	6q5vytgW4PHQx3k7Kg+5REb+bzq6YqjpbWB7sQ97UPV8Rw==
Received: from mail-vs1-f70.google.com (mail-vs1-f70.google.com [209.85.217.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4emavf4ytx-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Sun, 07 Jun 2026 21:25:09 +0000 (GMT)
Received: by mail-vs1-f70.google.com with SMTP id ada2fe7eead31-6cc5ae9b959so4405786137.3
        for <devicetree@vger.kernel.org>; Sun, 07 Jun 2026 14:25:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1780867509; x=1781472309; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=ozNLs3FUHY1eJZG59vKhqJiZZ3qQ6l8PY0jEa/SkSdo=;
        b=a2YdbvCLapqDkeUSFkODH+YeZYHbc0IUzxJWanZY7jyevR6czqSV2K0nAQAbopu/8J
         alW92S0XT6iZI0feCzuVCvmBL3GAddG32ojbiKp/CJ6zvUSsQVpLKrNEPKj2spId6sLn
         k9ogCzaOZFwRCRc+wrUalw/IJL3fUZXorhn+XIYfQGguYizse4IauLjMTdMHu4TfQbVq
         B2d/4N13fJ09vQl3K7rB8//b4s/zqlPA2gu7ZDsL49wY7VwoUefsoxa7inStiZKBzD32
         uDIoTXP9ucMqu2qqryePxWpf/GuUiW/UgGBOAXrzNUKPJPvrl0S7D+PxsgJA1MKEsG1S
         9SVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780867509; x=1781472309;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ozNLs3FUHY1eJZG59vKhqJiZZ3qQ6l8PY0jEa/SkSdo=;
        b=fLHDwSix7vguMXp0U/VSf9jjgnt0XzTFK3obrI71JZalSc96Uuvq+Sowk6ScoBuUOz
         QdFW0LDiNBaQWsUYoBPnYrkzTb3SyglUcP+nR0247x9PLx+TFVz9DejCSv2VCuM13QOd
         4K4/CJ3kh5tzc+If8syUmes07ZQHSEFv3ajGxEnG+tIeYTmcDE5SZHNxCk5nIjDuFw0l
         Y6ztbnIt1TAaqG80et2qJ18IylKpvN/ZaEChUL4f3nn8nr5mOViPU5Wi29yCZTke96/e
         rvjab01Vfz2aHDyKP2DFPB8O5jAMxSQsSOdptXqW7lhP4SLrP6WyetPRzU9us3+b0RP4
         VeUQ==
X-Forwarded-Encrypted: i=1; AFNElJ9Oga17MLJJtw9ceNarzxm5mOBSveracMKOA+5n1gA/Jzk2rVxz9jMFCo3nZ6GcnSr2O8QIVQj1MZn4@vger.kernel.org
X-Gm-Message-State: AOJu0YwFXwsN9Bb094Q5kwDJgDxwQxw7nEWAWQmYdRmOJbSa5WZ2sJrR
	SSnpxcmpkN6k4jXQjqFdiT041o1/BugAlptlLOXPI5e0j17Woh4cAVk6E+lXw4Vha3n+jau98wm
	D4mrSI0U4y0Av/z4lP2cSbl0kU7UeKGuEo3Bh9XHW4rz+7W8543PekCFe6/Ptg0GY
X-Gm-Gg: Acq92OEs0YlmsLlc5rfTlQzzILqnW5duCdQXCLtEtix31sEBUl5hTTxxUuMK7KSBTm1
	hFvaA7MIrGQSr4uVhz52KZAkBBuTJyWoFocZ3T2AggmdG7cF4NumrjZfxqlJ+mrxgxPVxlHjbSZ
	oL/j28RPFtszOd5amnrHNO1gytJUnUp8e7afNtyC2RdoHUPCZHSWsUwowIz0h0lfYkjdX+t64uV
	dOC0277HZ3DIlUAS2OSruhNfhpB/W1Hsh3xqhRLjdiZI3++e2y0O2CLAoAMx8r7yLFA/CC/4J0L
	aELmvpN6xHDWRZo8I0hX0wIFMmYtewZVj7QTckpXojdzI3PuQIYH3dt8Ywhs1gdhlnCW+ortnC+
	11srpwJPsVWnOuKNA2tUkyetKrMJdDTBlSS06NmmGrYh6yh+fxCJTwzwTtiCZrrfkaT+uUv/QCi
	HHjMKQZsCsm2hsnAgNP9IcabFVSDUeM/pK7z/1lZK8hGY7Mg==
X-Received: by 2002:a05:6102:cc8:b0:62f:3abe:907f with SMTP id ada2fe7eead31-6feed1adbffmr7232862137.4.1780867509181;
        Sun, 07 Jun 2026 14:25:09 -0700 (PDT)
X-Received: by 2002:a05:6102:cc8:b0:62f:3abe:907f with SMTP id ada2fe7eead31-6feed1adbffmr7232858137.4.1780867508806;
        Sun, 07 Jun 2026 14:25:08 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5aa7b9868afsm3353904e87.59.2026.06.07.14.25.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 07 Jun 2026 14:25:06 -0700 (PDT)
Date: Mon, 8 Jun 2026 00:25:03 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Matthew Leung <matthew.leung@oss.qualcomm.com>
Cc: Vinod Koul <vkoul@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-phy@lists.infradead.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: Re: [PATCH v2 00/10] phy: qcom: qmp-pcie: Add PCIe PHY support for
 Hawi
Message-ID: <egojnbup5igcre6ccegojsdrvtokwfoccqhwmfxkoy5ukvuxvj@ailtbrgrgocs>
References: <20260604-hawi-phy-pcie-v2-0-be908d3560db@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260604-hawi-phy-pcie-v2-0-be908d3560db@oss.qualcomm.com>
X-Authority-Analysis: v=2.4 cv=I4JVgtgg c=1 sm=1 tr=0 ts=6a25e1b5 cx=c_pps
 a=N1BjEkVkxJi3uNfLdpvX3g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=bC-a23v3AAAA:8 a=JfrnYn6hAAAA:8 a=KKAkSRfTAAAA:8
 a=ju8jlmDeA_GJ2jklb9wA:9 a=CjuIK1q_8ugA:10 a=crWF4MFLhNY0qMRaF8an:22
 a=FO4_E8m0qiDe52t0p3_H:22 a=1CNFftbPRP8L7MoqJWF3:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-ORIG-GUID: IHfNd12PZEyVAyUIjZKoQ9vMpc_vumg1
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjA3MDIxNiBTYWx0ZWRfX8nIqKQCO+NHV
 Mkf3did4iP13isTDy+jyDly4MDFWeDzyfghFjaauZ4Yg8zetwFPdzaJXXZ/iWwRxxE07h/9vHz4
 qwGbeyyDCWRz/d1NHCaHFy8XIZOfKHcz3s+Xhg9p1cbvUiEVhdammU2yibgqerTQeRD/KsQPJMA
 Af/evj7qHYsJCBQxefl1S47b9GYtzD8kGGWDldTm3q9ZMlKsC1PMVX+Be4jAU9hOpK+uRnM2XC2
 wYKUvOkyqYNvhI7ycB6aGEG+bwE2Gn/5vsaeurXvqkLQdwNdPm03pHdxm9Hsw5dAuvYAEDdIPiS
 QgMHaIyK0fZW5acr4KlADCZN8CIlMfeHQezPy+NzH9CkOwygK9p1nB+2dLCe1gnwXfyPfwity+2
 38MjxDXOhrtx6ioIY0BVVNkfDM2tSRBUtHjjidYPnm/KBySIo5JnrMM8sX70hXf2zlcAuVWdhBs
 8ow2eshosKiqhIK2ZyA==
X-Proofpoint-GUID: IHfNd12PZEyVAyUIjZKoQ9vMpc_vumg1
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-07_04,2026-06-05_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 adultscore=0 impostorscore=0 malwarescore=0 priorityscore=1501
 bulkscore=0 phishscore=0 lowpriorityscore=0 clxscore=1015 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605210000 definitions=main-2606070216

On Thu, Jun 04, 2026 at 01:32:54AM +0000, Matthew Leung wrote:
> This series adds QMP PCIe PHY support for the Qualcomm Hawi SoC. The Hawi
> platform features two PCIe PHY configurations: Gen3 x2 and Gen4 x1.
> 
> The Gen3 x2 PHY uses v10 register definitions, while the Gen4 x1 PHY uses
> v10.60 register definitions.
> 
> The series adds:
> - device tree bindings (patch 1)
> - v10 register offset headers (patches 2-5)
> - v10.60 register offset headers (patches 6-9)
> - driver support with PHY initialization tables for both configurations
>   (patch 10)
> 
> Overlap:
> The series has overlap with "phy: qcom: Introduce USB support for Hawi"
> by Ronak Raheja (see link [1]). Both patch series introduce a subset of
> v10 registers (this series for PCIe and Ronak's for USB). I have
> coordinated with Ronak regarding the overlap, and we can update the
> series to resolve any overlap based on the order of merging.
> 
> Link: https://lore.kernel.org/all/20260508213234.4643-1-ronak.raheja@oss.qualcomm.com/ [1]
> 
> Signed-off-by: Matthew Leung <matthew.leung@oss.qualcomm.com>
> ---
> Changes in v2:
> - Rebased onto v7.1-rc6
> - Patch 1: no change (Reviewed-by carried forward)
> - Patch 9: rename QPHY_PCIE_V10_60_PCS_PCS_TX_RX_CONFIG to
>   QPHY_PCIE_V10_60_PCS_TX_RX_CONFIG to be consistent with the
>   naming convention used in previous pcs-pcie headers
> - Patch 10: update usage of renamed macro
> - Link to v1: https://patch.msgid.link/20260508-hawi-phy-pcie-v1-0-237b894353fc@oss.qualcomm.com
> 
> To: Vinod Koul <vkoul@kernel.org>
> To: Neil Armstrong <neil.armstrong@linaro.org>
> To: Rob Herring <robh@kernel.org>
> To: Krzysztof Kozlowski <krzk+dt@kernel.org>
> To: Conor Dooley <conor+dt@kernel.org>
> Cc: linux-arm-msm@vger.kernel.org
> Cc: linux-phy@lists.infradead.org
> Cc: devicetree@vger.kernel.org
> Cc: linux-kernel@vger.kernel.org
> 
> ---
> Matthew Leung (10):
>       dt-bindings: phy: qcom,sc8280xp-qmp-pcie-phy: Add Hawi compatibles
>       phy: qcom-qmp: qserdes-com: Add v10 register offsets
>       phy: qcom-qmp: qserdes-txrx: Add v10 register offsets
>       phy: qcom-qmp: pcs: Add v10 register offsets
>       phy: qcom-qmp: pcs-pcie: Add v10 register offsets

Squash these 4 patches.

>       phy: qcom-qmp: qserdes-com: Add v10.60 register offsets
>       phy: qcom-qmp: qserdes-txrx: Add v10.60 register offsets
>       phy: qcom-qmp: pcs: Add v10.60 register offsets
>       phy: qcom-qmp: pcs-pcie: Add v10.60 register offsets

And these 4

>       phy: qcom: qmp-pcie: Add QMP PCIe PHY support for Hawi
> 
>  .../bindings/phy/qcom,sc8280xp-qmp-pcie-phy.yaml   |   6 +
>  drivers/phy/qualcomm/phy-qcom-qmp-pcie.c           | 382 +++++++++++++++++++++
>  drivers/phy/qualcomm/phy-qcom-qmp-pcs-pcie-v10.h   |  18 +
>  .../phy/qualcomm/phy-qcom-qmp-pcs-pcie-v10_60.h    |  26 ++
>  drivers/phy/qualcomm/phy-qcom-qmp-pcs-v10.h        |  22 ++
>  drivers/phy/qualcomm/phy-qcom-qmp-pcs-v10_60.h     |  23 ++
>  .../phy/qualcomm/phy-qcom-qmp-qserdes-com-v10.h    |  49 +++
>  .../phy/qualcomm/phy-qcom-qmp-qserdes-com-v10_60.h |  55 +++
>  .../phy/qualcomm/phy-qcom-qmp-qserdes-txrx-v10.h   |  47 +++
>  .../qualcomm/phy-qcom-qmp-qserdes-txrx-v10_60.h    | 109 ++++++
>  drivers/phy/qualcomm/phy-qcom-qmp.h                |  10 +
>  11 files changed, 747 insertions(+)
> ---
> base-commit: e43ffb69e0438cddd72aaa30898b4dc446f664f8
> change-id: 20260506-hawi-phy-pcie-283933b4113e
> 
> Best regards,
> --  
> Matthew Leung <matthew.leung@oss.qualcomm.com>
> 
> 
> -- 
> linux-phy mailing list
> linux-phy@lists.infradead.org
> https://lists.infradead.org/mailman/listinfo/linux-phy

-- 
With best wishes
Dmitry
