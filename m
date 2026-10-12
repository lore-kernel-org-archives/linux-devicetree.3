Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3419535C1AD
	for <devicetree@vger.kernel.org>; Mon, 12 Oct 2026 13:16:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791810981; cv=none; b=YWpFYbUgW9D+VWa2ye2Vwy+a76bGcBEkLaSS+L6fQKT3sYMTXzqlzlEWejaUMZHRUqwDd+N2+N8OQcHgk/qFFVmzDjxjh9AxFsgckcaA23CppdMLpAhkmEZBPXfS2m1Uc+UThazVNEa+1HmhqfAbxa8H2dyYQ4oUv9o1lU/Gak0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791810981; c=relaxed/simple;
	bh=tojelIR868h5jmnTwtMJ6VGqDTSoivTowZ2OXRc9l6E=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=mzXEjA/ol4bmVZ5lm2Wyjo8S8Ortb9d5efVTDYJ+zMdriHt02Yfvp6FPnJ6lSW2jbuEwKubgulqWDPUsyPRvouBP6qlPEfz89rTdGddX/VJIdSsqSb7hDexI79QFHcUNP93HtpRBdpE+vTBJtBUJN7/cimQsdEGE1PC0GzJZUy8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=LnmOXLHa; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=bIORfHtV; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="LnmOXLHa";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="bIORfHtV"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69CC0XeF2252940
	for <devicetree@vger.kernel.org>; Mon, 12 Oct 2026 13:16:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=hcQYHXRub/yQ1Dpv5XFYeIcl
	fT91vq0bk4FyY51pAd4=; b=LnmOXLHawspPH+yV4CU3osODIUZArlSJ6m7x3JFV
	+pWloCFpbzmEGo/OZMxeJB3iNNJmErxt3VZHXimNJphcWKbGlhyYN3XTOb8tdPca
	Q6pgb1CDqh1T/XJSZAaEmgE9DHdbCOy/PJyhuorHKatgiJGy2UcV7KjDqVlg0IiP
	Ha1Q9js6pIj+wrkItSDCvHXWf605PaoAZdGW0qSHvj3RZbgV9p1cTudbevrr66Y0
	a2gq6GspAZYDosMDdBu0r/aUX5mrpgtrGsZY7xqZeEoMtN0AidI+94wKoNIIs3n2
	SLL+V2HqfbZCozyYFNN2nt3iLSr9uZ0Ui7Fkih0+svh+Qg==
Received: from mail-dy1-f197.google.com (mail-dy1-f197.google.com [74.125.82.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h8j7134pt-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 12 Oct 2026 13:16:19 +0000 (GMT)
Received: by mail-dy1-f197.google.com with SMTP id 5a478bee46e88-3552883bd19so4062363eec.1
        for <devicetree@vger.kernel.org>; Mon, 12 Oct 2026 06:16:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791810978; x=1792415778; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=hcQYHXRub/yQ1Dpv5XFYeIclfT91vq0bk4FyY51pAd4=;
        b=bIORfHtVPD+W8vDLpd5AIJN8UERjaOZfq43WKAf12BGucEUHFXzwsBqGxAWHJM6ko/
         dzdB/f0kuO4O2ojhGP3KwU5XIIvRQ7ti8d2e/odsOW7wT4VZLqlhgCs6AQXNRpqjN55A
         QfQn15fzRSUuGVWWJya4M98IzoSx+trtTg5y+MDg2YBacQdkpcwg0x1uRe8vXX0Jscp6
         sdeoYKGzGQhki4CG/iEXIqEjUpoa0XiDGFXIqxi6S0V/fE7KjJXvV+VoGgOqFY0y/lot
         Cppwl+rKigXHieCaGzkcVaHKLY+rIi20fVlsWcceoqPav88DxDWfSj2i+Txj3sPp6hV2
         xVpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791810978; x=1792415778;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=hcQYHXRub/yQ1Dpv5XFYeIclfT91vq0bk4FyY51pAd4=;
        b=GiqFZvYA+glivc3ztA2rK/PfrjaN5Wd9M+3syBV8jRmxNsveXmQ2hOvjZL4iv4wJsV
         /p/aNHQenlYKv07Mqoecxt5ja2jUDy4KIIWb4PPy1iXfGNVs1nVTroFTrxQ3keOpYWyl
         W2XnkfULVF33xTdJlXKbx+2uhwUPQHtFeculfJCmyJh7jAyimu54S+VRMiehKozaNil2
         czZm9/tJxPIQltSTv2L4jJK3Dd5bLp4phKHVxFLRbN4LyOZRuGfcFW/Qxb3IuOSThWwE
         Ayr2UV+QFOp07WvZbEH8CMh0+odQOEzzUoHBx57tKro9k3THAFEBa+uEb/KjEIG1225O
         34ow==
X-Forwarded-Encrypted: i=1; AKwUvBxWiOGXspn51zusZpB/aaXO4Vwz47qsBs7awG/Npu/US0M63waRpKvPQfU9bcWnPb5z81fV5UGL/KbK@vger.kernel.org
X-Gm-Message-State: AFq9FYK+L3OfsjJHV2fUnxvb0CeBJuVjTO+7JaEGz6tbsVraDS45uJSf
	/7IkoSH14JWNiDxus23kxbPbo2BVCczGLT0pH7zj6jEl6/XkbolAS2c01kp+0hMtf7Mkg4icH9M
	B11fQyd83idaYX2Zo/f7niD549eA0i2xTOVlhhhonKSIah4Xue/KpVQNMII3a4umH
X-Gm-Gg: AYBFou1qHOSYM6hi+FK8bCYwzbN71QTljY4ff65iRxFAO9MZL0qISDtpdf0ya5vTBIN
	Q3yI5tpkIvHOnV++w4ATGpkbTFviDvEEmMjCgp72KZOekDmWxZCTZRdkV20zmPkc1a6LADT6For
	gT3x1rk/YB52nf7/bwKt+aG2ZvZsct3NJYOLYFVM3bfJy228uoRMRgZgcjuuMsn0dqCote4A/ap
	wk6b2iAwvxfsq/2UcjMCindcJesG4kfUwFy+yCrGHRR9I6gCnu8Ktonbnk1VBy47g08ckkkVLDU
	SkA4L91zunp1k8Hhzp0wJAxcj3BUwRJRhTPpTt4WeWRZudDHN0mMUhrY1nKwO2h5MIru967nURt
	rSCzn1VVvtm3NhBQg27aX8yIkhK0Yl30GsERoRvH6Kw==
X-Received: by 2002:a05:7301:25a1:b0:35b:dfde:8779 with SMTP id 5a478bee46e88-35bdfde9709mr314856eec.7.1791810977894;
        Mon, 12 Oct 2026 06:16:17 -0700 (PDT)
X-Received: by 2002:a05:7301:25a1:b0:35b:dfde:8779 with SMTP id 5a478bee46e88-35bdfde9709mr314819eec.7.1791810977176;
        Mon, 12 Oct 2026 06:16:17 -0700 (PDT)
Received: from QCOM-aGQu4IUr3Y (i-global052.qualcomm.com. [199.106.103.52])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3537ca0e64csm36303294eec.10.2026.10.12.06.16.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 Oct 2026 06:16:16 -0700 (PDT)
Date: Mon, 12 Oct 2026 21:16:09 +0800
From: Shawn Guo <shengchao.guo@oss.qualcomm.com>
To: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
Cc: Vinod Koul <vkoul@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Lorenzo Pieralisi <lpieralisi@kernel.org>,
        Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
        Manivannan Sadhasivam <mani@kernel.org>,
        Bjorn Helgaas <bhelgaas@google.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Maxime Chevallier <maxime.chevallier@bootlin.com>,
        Philipp Zabel <p.zabel@pengutronix.de>, linux-arm-msm@vger.kernel.org,
        linux-phy@lists.infradead.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-pci@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: Re: [PATCH v4 3/6] PCI: qcom: Add Nord PCIe controller support
Message-ID: <aszdme-LztWNw1J5@QCOM-aGQu4IUr3Y>
References: <20260921-nord-v4-0-ed05c6e09240@oss.qualcomm.com>
 <20260921-nord-v4-3-ed05c6e09240@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260921-nord-v4-3-ed05c6e09240@oss.qualcomm.com>
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDEyMDA1MiBTYWx0ZWRfXyudLvsqLZpdS
 ElZSKNE/Q2iiwxQRPbbyso2Gc0fyMaMqa6XX55e2QmDct/wzGNCsCMeDPAmU1P3t9QJzN5a2hRA
 NVoc1icauf5L28vUrPh2S/nXzT+o+K4=
X-Proofpoint-GUID: y93K8cchAOh_P-uA2RqWBsipqZWX17BG
X-Proofpoint-ORIG-GUID: y93K8cchAOh_P-uA2RqWBsipqZWX17BG
X-Authority-Analysis: v=2.4 cv=ePGGH3p1 c=1 sm=1 tr=0 ts=6accdda3 cx=c_pps
 a=Uww141gWH0fZj/3QKPojxA==:117 a=b9+bayejhc3NMeqCNyeLQQ==:17
 a=kj9zAlcOel0A:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=EUspDBNiAAAA:8 a=eXNsmz249v773VhVZ_gA:9 a=CjuIK1q_8ugA:10
 a=PxkB5W3o20Ba91AHUih5:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDEyMDA1MiBTYWx0ZWRfXzueM9/1NNnQM
 L+jVrG5kcmanSxsedcpqkxFmBziRzpGlJOYYoa3VBefm4E0y7WUofNnJTsqw0BC8QbgcJVKe42C
 4RDwb5/95iU07W+YFYgd6QBjI5ocGfsBxEluPNm2K1QYd+4O7H4oC0RRo3uf4WzOKFJswnT5qS0
 VMv4H9W8soKvTEKuM2Wp6Px3Q8vpo7Pith2VU0KEKwGwWr3n8tao43bKIkuruPoLnkBf3Fur9O7
 NnlR5XiV2iBnMfMNV5rmqdQU5XrMT7Opt808Je2OwpvyPYIoJxnF15WCXemCoQXPrzsbphCAx6g
 keEE48Ma2g04SfYVEeRKYB1QP/trmYUZr78dmfY1X9TPkXLIo0Hp8/P+rz+iPokiGW93xKWDVg+
 KjwxwvpcZlxHM1Dz4hAW08yEEWHEaL3q27RznPMuFoO5MhOydqsmHjLSE/svbViluOequ4Dg6Bm
 woh+T/T33hjDhwxsWKQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-12_04,2026-10-09_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 clxscore=1015 impostorscore=0 malwarescore=0 adultscore=0
 bulkscore=0 phishscore=0 priorityscore=1501 suspectscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610080000 definitions=main-2610120052

On Mon, Sep 21, 2026 at 11:07:11AM +0530, Krishna Chaitanya Chundru wrote:
> Add the Nord PCIe controller configuration and the platform-specific
> settings required for correct operation.
> 
> Nord requires the NO_SNOOP override and L0s to be disabled. It also
> requires a clock-gating-control (CGC) workaround to address a PCIe
> power-domain timing-convergence issue. Set the CORE_CLK_CGC_DIS and
> AUX_PWR_DET bits in PARF_SYS_CTRL after controller initialization.
> The SLV_ACLK_CGC_DIS bit is already configured by hardware reset.
> 
> This behavior is documented in the private QCTDD11972446 erratum,
> which is not publicly available.
> 
> Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> Reviewed-by: Shawn Guo <shengchao.guo@oss.qualcomm.com>
> Signed-off-by: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>

On Nord Ride and RRD board:

Tested-by: Shawn Guo <shengchao.guo@oss.qualcomm.com>
