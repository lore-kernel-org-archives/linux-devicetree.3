Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3CD9013635E
	for <devicetree@vger.kernel.org>; Sat, 18 Jul 2026 01:04:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784336684; cv=none; b=gHliHoZgdFx/VJoEuoIIkYVqD6FzXcmdoCRC8PATowGLCGn2QbXhVEMgO+cfHFj8jPj6s0U5iBKwC3RIHsWc/Wl59hO7DVAqzqzoh3eB1cxf2BNWAnxZ3v4hNx3nMh0S5n3TTG+cvPbWten3N0Y+8isRm5sJiVOtgminUg4wIps=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784336684; c=relaxed/simple;
	bh=svS3UQbUNSb1CVj/mEsrvkJ5SQJgoZaq9QdaytrddKo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=fKId1gm6ZeA+EXgLcAFT+BPsNPHdFUKDJgOwLO1LCGZPkh9prvyjGea9K21Q1WlWv+kR+NeZydD7E1XjFvMpi+go9JpT6wcnilT1a6WHzC6YCp/Mhq7PkbPsIDPGyR3tXCgewX8jHyy68DGkDqBAjsC+lcIjZ8X5ck1JUux0bqg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=bRvPpj/Z; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ZIq+Mc/8; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="bRvPpj/Z";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ZIq+Mc/8"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66I0hKYU322425
	for <devicetree@vger.kernel.org>; Sat, 18 Jul 2026 01:04:42 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=rQLRlSB7PGWIgFFnVYd8T2nZ
	Olfy4NygBjlMFmkKEA0=; b=bRvPpj/Zqt7bPVpIhmwtZY+AmMaBPhkRFEIGJj1F
	FWXqHrwjAfLU2X7RqeQpxQCo+/4PUqHomjzwzcbovlUj8QVzhJIitso+LhSTX/OF
	SgSeuLDBeEIlWqsOJyNEl7JmK0bxinazW9NjddUt3ccEMW1jWPPhdfMMTcJi9KIu
	/w2/wwnmM4HaGfNzaEZ4hJSwhXgzroQLU+NDp4Igvv8bgZbPkeL1x1+dSJ38noZS
	MQATaGwwTQ/YhR8TwaJw+uvw0qxIjYpw8nHxYfryg+t0i7ZPg7DIVY28YiQYO+UK
	vtpx/kQf7bVMI0TmzK02bfhoLyjHY9//3nKbrItkg8kw0A==
Received: from mail-pg1-f200.google.com (mail-pg1-f200.google.com [209.85.215.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ffy6f01pp-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Sat, 18 Jul 2026 01:04:42 +0000 (GMT)
Received: by mail-pg1-f200.google.com with SMTP id 41be03b00d2f7-cab041eced3so9915709a12.1
        for <devicetree@vger.kernel.org>; Fri, 17 Jul 2026 18:04:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784336682; x=1784941482; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=rQLRlSB7PGWIgFFnVYd8T2nZOlfy4NygBjlMFmkKEA0=;
        b=ZIq+Mc/8MtcB1cENW7cQ/6XwIYal/E2lEwWXv1p7B2TTwb6hkx3kVH5iQRhAkNyiBE
         H0W5Hce1fvApoOfIvWWfkOi8kLvSmQXZA8/OZyCdpezUzJU40XnQGy/blMbeMHxdF0W1
         sEjx8mZa+9mboCMTdDFOo/y/YYezh0DfZBEt15qFG3K8VzqjSj7oQ5sMfZEZt8wxw9bV
         8VWG17W4Bohj+tZTq+LkszlGzqT4AH3Z592zrYoPZSS5+jpmnz17AzVdVm37B+7IE0FB
         cwB/aV4VUaDD6o0oX1ppb1ws7p5MzZnFKzc+uA2LaHc+pMfd33gBjNM+v9zDDaI5Goan
         Ps+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784336682; x=1784941482;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=rQLRlSB7PGWIgFFnVYd8T2nZOlfy4NygBjlMFmkKEA0=;
        b=smrlftAhjTaI0CT4sk0rcN1e0XrqZ6T3MrbcAem6d7Is26vIgYGpdnYV+9Exh2aeir
         D9mWq3J7b4tzX4lWmMMQCieGvE+X3TC7Sj8UEtzAritZADKs38p4k2JJmsy5QXyyJ1zp
         p4SYwfeg+afGxp9ct2m37YVlUmTReChi3N2iM4VxoLDIPfnRVeajHtnGlc5RymzvLF4p
         z4p/SX8Te0C0skB3RDESVm7ftwSXdFGSodip3050gEyKyn2CtPHhKDHI8IK8Lhkbya/a
         wQ2PAo9ahQnZv7EkKPYjtNv7GZz6FYW1wXuenfQqvTVgid0AjGxV/P81kGR8BnVaNJfF
         fZSg==
X-Forwarded-Encrypted: i=1; AHgh+Rp87NEFbIKxVSpt5iEr0cStJDsCq/K9WAgC4dXaLTGN44IxzY98MyLDgr0zzOgCnFk+NhIMwWpdHULF@vger.kernel.org
X-Gm-Message-State: AOJu0YzjZuyjBlueNl97ykKdble9rU/oYxsHvfFAsq8sSSMlVBDlvC6H
	LG0O8/lCZbWjdphcvo3y2rOclMGpu5TAG/YQjEAo2E1gENro0CSml65/5Lj5oo3/tj5Y4fTv5J2
	bFm0tMZK6f18mrgALQJyS1miuSCGFbqoI/+HyyZLZrD1zVWwERE3rpSTfSuEDd/Ya
X-Gm-Gg: AfdE7cmdhUXZk30JKnMyUZ4VyHks5C9i0axesK8twzXQknZ5R4if8wqq4rWja3l4Wyl
	yNiNas9TgDgNfEgqM/hC7yWgVGhgQex4xIrqF9IVy6aENOS5sPBu/0wTAk100izEViEW9+BJAy5
	SzjSiZtaZEvg26wqKNSLNcxCQE4dxvROMhbgtlsfHQrCrC3c1vaEgmnO/ACMORLNU6J/EyQRGkH
	sry63Yn4vzPN7zJBiHKvsHR+fWIfJUoFKNlRtcXaH/2XceU71hW6eAElpvaikhQVYF7/awQVpxa
	xtQtT+qIoS8eliudP+hBpeoQF0unzrft08vRQyNptiWavci0K4ZGnIexfJffDm7ecjVOEZ3foVK
	O4pGE2UXie9RXHOPqoL4SrQoNBUw2c2q2MZlE3swHQDWR4sKNu968UPCy
X-Received: by 2002:a17:90a:d605:b0:37f:9ce3:ca95 with SMTP id 98e67ed59e1d1-38e4b54436bmr5104023a91.30.1784336681729;
        Fri, 17 Jul 2026 18:04:41 -0700 (PDT)
X-Received: by 2002:a17:90a:d605:b0:37f:9ce3:ca95 with SMTP id 98e67ed59e1d1-38e4b54436bmr5103968a91.30.1784336681100;
        Fri, 17 Jul 2026 18:04:41 -0700 (PDT)
Received: from hu-mattleun-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3142a1de301sm11476274eec.24.2026.07.17.18.04.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 17 Jul 2026 18:04:40 -0700 (PDT)
Date: Fri, 17 Jul 2026 18:04:37 -0700
From: Matthew Leung <matthew.leung@oss.qualcomm.com>
To: Vinod Koul <vkoul@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: Re: [PATCH v4 0/4] phy: qcom: qmp-pcie: Add PCIe PHY support for Hawi
Message-ID: <alrRJQF2JcThIh4k@hu-mattleun-lv.qualcomm.com>
References: <20260707-hawi-phy-pcie-v4-0-8d9cc6324947@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260707-hawi-phy-pcie-v4-0-8d9cc6324947@oss.qualcomm.com>
X-Proofpoint-ORIG-GUID: EYcvhG2KMXsKiwcqt1DULvHn3a3xYRW4
X-Proofpoint-GUID: EYcvhG2KMXsKiwcqt1DULvHn3a3xYRW4
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzE4MDAwNyBTYWx0ZWRfX1n1ugalNkMlt
 /b3Swpm7PT0wTwXAyctqFl8xeLQclHf6qfFWffLoiKNKFAHOpiwH0nabv0HO9ayusWAyNDCSEBu
 hWcUdFrGksCbdyyA/bcXloCqcm5sf9fbrmK489l6hcGtGMHn5R6eg8fq4TS0ciMlyeISf5C1n+q
 WRm/9Z2HOc70oConG+S+nzSihtCyB2ZLDU77EvuoLyg/Xfqsc/+Zc0O6TrwdC/DIinLpOEJiBDL
 MzVOjObzo1KWg7QVLVI4tgskwvpAem2XAK2mIkYXxmwE0gAan1SiUqlpIjWlwz/iuyP6BZDZCuN
 bCtB+xcK9Efx/I7y/4efNeL48pRgISYH1aDq+BbYZOKKp+8ZnGmlZqmnTlIDy3QFejic1UlO/LA
 izsDSHu7SMGRfb4qgfNi7rdQgbL77lFzBeoJwZVsCbCQ9/ICryd6q3yC8i3BjNacng+6Oxz17Cd
 iGlEHC/MoyfnnvuO3Jw==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzE4MDAwNyBTYWx0ZWRfX4K8z4OEkA+s4
 h+dbhgcMZxcIo34osemTbc7/3JSrQixibM8S2XAgCkq5VjSV2AklLcoK0vjQ/jPC1vwjlMIPzZo
 BBIJB8BWi5OQnZv7IsvBxpxkN3q8YbA=
X-Authority-Analysis: v=2.4 cv=BIODalQG c=1 sm=1 tr=0 ts=6a5ad12a cx=c_pps
 a=oF/VQ+ItUULfLr/lQ2/icg==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=kj9zAlcOel0A:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=bC-a23v3AAAA:8 a=KKAkSRfTAAAA:8
 a=JfrnYn6hAAAA:8 a=jj8kymYpkfAu7g8d2q8A:9 a=CjuIK1q_8ugA:10
 a=3WC7DwWrALyhR5TkjVHa:22 a=FO4_E8m0qiDe52t0p3_H:22 a=cvBusfyB2V15izCimMoJ:22
 a=1CNFftbPRP8L7MoqJWF3:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-17_07,2026-07-17_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 impostorscore=0 bulkscore=0 phishscore=0 adultscore=0
 malwarescore=0 suspectscore=0 clxscore=1015 lowpriorityscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607180007

Gentle ping. All patches have Reviewed-by tags. Please let me know if anything is needed.

On Tue, Jul 07, 2026 at 08:32:45PM +0000, Matthew Leung wrote:
> This series adds QMP PCIe PHY support for the Qualcomm Hawi SoC. The Hawi
> platform features two PCIe PHY configurations: Gen3 x2 and Gen4 x1.
> 
> The Gen3 x2 PHY uses v10 register definitions, while the Gen4 x1 PHY uses
> v10.60 register definitions.
> 
> The series adds:
> - device tree bindings
> - v10 register offset headers
> - v10.60 register offset headers
> - driver support with PHY initialization tables for both configurations
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
> Changes in v4:
> - Rebased onto v7.2-rc2
> - Link to v3: https://patch.msgid.link/20260618-hawi-phy-pcie-v3-0-3fa42ca45ea4@oss.qualcomm.com
> 
> Changes in v3:
> - Squashed v10 register offsets into a single change
> - Squashed v10.60 register offsets into a single change
> - Removed USB mentions from header comments; offsets are PCIe-specific
> - Reused the tx offset for the v10.60 combined txrx module instead of
>   introducing a separate txrx offset
> - Link to v2: https://patch.msgid.link/20260604-hawi-phy-pcie-v2-0-be908d3560db@oss.qualcomm.com
> 
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
> Matthew Leung (4):
>       dt-bindings: phy: qcom,sc8280xp-qmp-pcie-phy: Add Hawi compatibles
>       phy: qcom-qmp: Add v10 register offsets
>       phy: qcom-qmp: Add v10.60 register offsets
>       phy: qcom: qmp-pcie: Add QMP PCIe PHY support for Hawi
> 
>  .../bindings/phy/qcom,sc8280xp-qmp-pcie-phy.yaml   |   6 +
>  drivers/phy/qualcomm/phy-qcom-qmp-pcie.c           | 375 +++++++++++++++++++++
>  drivers/phy/qualcomm/phy-qcom-qmp-pcs-pcie-v10.h   |  18 +
>  .../phy/qualcomm/phy-qcom-qmp-pcs-pcie-v10_60.h    |  26 ++
>  drivers/phy/qualcomm/phy-qcom-qmp-pcs-v10.h        |  22 ++
>  drivers/phy/qualcomm/phy-qcom-qmp-pcs-v10_60.h     |  23 ++
>  .../phy/qualcomm/phy-qcom-qmp-qserdes-com-v10.h    |  49 +++
>  .../phy/qualcomm/phy-qcom-qmp-qserdes-com-v10_60.h |  55 +++
>  .../phy/qualcomm/phy-qcom-qmp-qserdes-txrx-v10.h   |  47 +++
>  .../qualcomm/phy-qcom-qmp-qserdes-txrx-v10_60.h    | 109 ++++++
>  drivers/phy/qualcomm/phy-qcom-qmp.h                |  10 +
>  11 files changed, 740 insertions(+)
> ---
> base-commit: 8cdeaa50eae8dad34885515f62559ee83e7e8dda
> change-id: 20260506-hawi-phy-pcie-283933b4113e
> 
> Best regards,
> --  
> Matthew Leung <matthew.leung@oss.qualcomm.com>
> 
