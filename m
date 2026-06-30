Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5D7743BED70
	for <devicetree@vger.kernel.org>; Tue, 30 Jun 2026 16:25:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782836719; cv=none; b=ZVTD60XaLW3IwO2OIWNRl8S5DcpUts1KRZ05UIPrBp/X1YGsZWwCR24o8fph62cXIZSNs5SoVYt5LqfzTVQCmNKIxfJokJM6ZOD9gyrrB2CsCA+8XT9wqc/N3ErCDkkCHOzFZvz9jUblmN6IabsKKQO00m+iUGL3MF4rowwcn9Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782836719; c=relaxed/simple;
	bh=LJM1IPyNPNBoHNOz96SqVkVqWhGlMtd/1O1Nu8VZHCM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=uT9eB4jmOsAk2Qv2iyK+e0ctxnAoc5ctFXL3kcbu24z2WqyJ1dva4GiA/bT2F2Gxn7HUcjl7Xy9nisF7RhAZ14fot/hp9F89A4MBpbJbnEWacWT3ZLwQT+KkZpvXe0MBo8QuOaABI+LLoeb1BWsSde+VVrrFABsuqulD8zE0Lo4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=mAlJ/J0r; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=FeTlWSWO; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="mAlJ/J0r";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="FeTlWSWO"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65UEDJpY2214558
	for <devicetree@vger.kernel.org>; Tue, 30 Jun 2026 16:25:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=7JztesSv1vX86J3T/3JDiPpZ
	RdmAAa2v8q5Kg0ahOoE=; b=mAlJ/J0reKFE93bZc17lfsgMcVn/nf0DbOQdsz3b
	OIqUvd0rxnkq+DCrLEMHOYdWnVDTuDulHsAqfUnB/ppPstFoLGSUzDCgUBlDjpZI
	9FQXHvj6pOkWcGvL/qsWT0qYQtWAVGw4Hv/qR0tVdL875FTpll+V5fU5ZxkqRzPz
	ohNSmWdZS6VfcPyGtFfRja5q0a54G3dpk/dUtDYL0jzOxKT87Ctng5HLefWs7zBR
	/TDm2MUXtX907ovOfOrVP+YHl4QBBV0Fk82JYL2F3q1DEGN/PVcMAUICTU/ldLTf
	QnVIIIKaPXbQzfR6yK+zSkltegC81laLaByXbiH3vMixbg==
Received: from mail-dy1-f197.google.com (mail-dy1-f197.google.com [74.125.82.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f45k5ud74-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 30 Jun 2026 16:25:17 +0000 (GMT)
Received: by mail-dy1-f197.google.com with SMTP id 5a478bee46e88-30e85f5bc9eso10915332eec.1
        for <devicetree@vger.kernel.org>; Tue, 30 Jun 2026 09:25:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782836716; x=1783441516; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=7JztesSv1vX86J3T/3JDiPpZRdmAAa2v8q5Kg0ahOoE=;
        b=FeTlWSWO8B6P8wAUEnZ8r4ePnzZe17caJDZrpR4k4M6J1qOXMkCge208iDN0va2wIt
         Y5nmXkFIyr4mvM55EhQz66WD+JnECiGDLsYHlZQjZbtfisHJFzZz7i2kdAw7+nov9StY
         6vKQ5Vkhf9dW4POsm8YvqpNvcZUvIiIRWciKFWxKnSW8ssT+4ImPnir5dVt3ko/Ngev/
         u8+3J0E2d+44X0b64BAfJ40cmNqCLVUnAV5lPbqIJzF1b1ZVZ3XXZ2/q1/VVB4BRUkmJ
         O6z3DbMf38PfV70waZBF1Tv0VyAZtuhY+KbGAXX7oAW7We5SRuXwxUDvw7+HQJ0jeFR/
         8nSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782836716; x=1783441516;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=7JztesSv1vX86J3T/3JDiPpZRdmAAa2v8q5Kg0ahOoE=;
        b=lcj1HlIomG2BrSVjXP10TW4bqYrc+jsDbY4Rg3WM4/ZPRvA9Upwxq0sLCF+x0hWiae
         morDeqqporypDoD4D99p5ggd+4K+r+IjYEeQQZcpt1FbZ/OqBUyVcXY1JFK30CgjBJ2i
         aKUyzF33i8ERHDAjFzgFr8jp/0mwr1NQvUTd5cQXMhUVR9WTlFLYQJXdzuVSW2ZOX4JD
         p7TkprRb/fuh2aPhgOYLxlJq53j/X3VHC7AUHWn4nBECR30krZe2nMWe5PYfXLkXO5Wv
         sTOE432x2SeydmIUtFmA6d2VscntpCTFz4b503WzcgAJdk4s37NGVMfvjURNVGaQjvG8
         xnog==
X-Forwarded-Encrypted: i=1; AFNElJ8+Q89v+mgMjQQcc1D3e/JIUauG8RTY/H52b2DfLWggC9Yz1mpjMuhxFW08xShhR8PLBFs3SEscaM1H@vger.kernel.org
X-Gm-Message-State: AOJu0YyJmzPnF/gFN4+Lo3t0SIb7yLxM3kvtnQTs4+iV+JNP1n9Dsn8k
	HzC5X7g3jDkP7OQro50MvbRGtwnwJxndBRQTZIe3nBoRS1uRLDhpcPRGC3mJxxuDDbyXubeUl60
	lJO9LWWqoap56HD/bsbIVOcSrljcU738DcxtN8QcZwIBE+hZb9a3IwEbagIWDgwI2LjnKQK4J
X-Gm-Gg: AfdE7cnBs6D7oc2xetTl/a3kHU0//cQZWOejRGjgT/1fROrG6D4LKiR9/MN7AtGfr1X
	7K2iTm6x1joQudVGEcaia1xa/jfqbbYxFr1KjoUj24bjfXl2A2cCTN5iVYrjF1MnEAK2ABTQHZQ
	RF0hGMHP3ITYApznRwoeZbPFYA7DVQ/GhWazWzhOOd8xxDVcS40s7j93wt9wOOY2Uw34GEM1SUK
	AUENhAcFrLszgEVD4ByL9H6Nij5USb7pzafxlEofjand+ypGZHnLAn1Dg7MsSfeYqL0o5uDUfkF
	0ZqIu65G6Ff83I87bOVNfwsxx/vzMBXlP2UfaAiUJArG+pn8+4j3I0JrZZxsrjshsCvFa/fwDt4
	dx7KYybsV0z5LrckeZXlMYUUlfWjKa75JfnJzrG/uC+KJORnT+e/d0k0dnd8ZaMBjc9U=
X-Received: by 2002:a05:7022:23aa:b0:13a:363:ff6c with SMTP id a92af1059eb24-13b2a1acac8mr2861685c88.24.1782836716162;
        Tue, 30 Jun 2026 09:25:16 -0700 (PDT)
X-Received: by 2002:a05:7022:23aa:b0:13a:363:ff6c with SMTP id a92af1059eb24-13b2a1acac8mr2861617c88.24.1782836715418;
        Tue, 30 Jun 2026 09:25:15 -0700 (PDT)
Received: from hu-mattleun-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-13b2ab2dc1fsm8426555c88.6.2026.06.30.09.25.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 30 Jun 2026 09:25:14 -0700 (PDT)
Date: Tue, 30 Jun 2026 09:25:12 -0700
From: Matthew Leung <matthew.leung@oss.qualcomm.com>
To: Vinod Koul <vkoul@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: Re: [PATCH v3 0/4] phy: qcom: qmp-pcie: Add PCIe PHY support for Hawi
Message-ID: <akPt6Na523IZXYX/@hu-mattleun-lv.qualcomm.com>
References: <20260618-hawi-phy-pcie-v3-0-3fa42ca45ea4@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260618-hawi-phy-pcie-v3-0-3fa42ca45ea4@oss.qualcomm.com>
X-Authority-Analysis: v=2.4 cv=AqDeGu9P c=1 sm=1 tr=0 ts=6a43eded cx=c_pps
 a=Uww141gWH0fZj/3QKPojxA==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=kj9zAlcOel0A:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=bC-a23v3AAAA:8 a=KKAkSRfTAAAA:8
 a=JfrnYn6hAAAA:8 a=jj8kymYpkfAu7g8d2q8A:9 a=CjuIK1q_8ugA:10
 a=PxkB5W3o20Ba91AHUih5:22 a=FO4_E8m0qiDe52t0p3_H:22 a=cvBusfyB2V15izCimMoJ:22
 a=1CNFftbPRP8L7MoqJWF3:22
X-Proofpoint-GUID: ShRi7uqLhRQT12gBlmCOukOcTtrNLas4
X-Proofpoint-ORIG-GUID: ShRi7uqLhRQT12gBlmCOukOcTtrNLas4
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjMwMDE1NiBTYWx0ZWRfX8oFtw6bdPnbE
 2i0euj8wUUNrwCxG/sCKPEPV8IE28XQ8wHzbpMKzJv2mvt96OuMckK/uqH82qC/yxa4pZ0yoNEt
 JAiH+wjPom2f85icKPwBosd+vU25rjAJrHCRW5i+fsxl2BBc8zgLD73CeCxSXOtCUYBw1hy/dzo
 Re9T4MXgB8RCafLXBSsmy7JfDsSJssYGM2lqVV4UJHueKf2nmVLIp8gIexkWgxzxNyBZVL9erPP
 5HvL99jkvYXRjez13n8cyopdoPjKvYoIj4nWrRDcxjp+ogUzwdCvKCYk6HgyDhhM7aw9JScmuze
 7AlZnFCO+nKDy1CkE1FUdIsZzKfj0OrcDZV9GJ00CTGxKW/Hq6yEm6zOxlaztXfieHzuInx4jF2
 TrhR8Dl3M/rKbRH+bd//xhaIQ77KONOiG0Cz6H4VaNN/yhghtNBrMZVSw3UQvGy53O9VAjSNmyW
 0o3b7SRnSdDxRVPbaXA==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjMwMDE1NiBTYWx0ZWRfX0YF3sf3QbBI8
 4LzRjyAqLLgzyCPSc1A9x8tFupp6snSfvkcidXxDqrW73uR7LfA55Jus30apHkNHlbXXs2s3aD9
 I1kYrZIc8XjSgwEG3PA/UehlCwRkUrs=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-30_04,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 impostorscore=0 suspectscore=0 spamscore=0 phishscore=0
 priorityscore=1501 lowpriorityscore=0 malwarescore=0 bulkscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2606300156

Hello,

Gentle ping for this patch series.

Best regards,
Matthew Leung

On Thu, Jun 18, 2026 at 09:54:35PM +0000, Matthew Leung wrote:
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
> base-commit: 8cd9520d35a6c38db6567e97dd93b1f11f185dc6
> change-id: 20260506-hawi-phy-pcie-283933b4113e
> 
> Best regards,
> --  
> Matthew Leung <matthew.leung@oss.qualcomm.com>
> 
