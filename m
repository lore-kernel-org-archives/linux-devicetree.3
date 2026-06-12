Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 000F735CBD7
	for <devicetree@vger.kernel.org>; Fri, 12 Jun 2026 07:56:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781251004; cv=none; b=uHhetHDR26sMONE5b/yJuDia+nfThrpW+2oNcaL3+1yRZvUArQocKBxhYddg2u2Vl2RqsO7dsTy8sVaVReBStl3yKmvxZ3HaZ/pOB0+3zW9AoQ5Yq65JlXu/FM7gMFJ27nb6PQW/+kYz42Vb6LsBaMGiH+lvl8h6cripGIL1mz4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781251004; c=relaxed/simple;
	bh=TVkagD7lCcxYoUKNVn3e5LpPvaYuNy8MGGpeMfIGRQk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=KtvcGJOt13JlJMUr0YPaZ81W5pSqt6dj4n+uq5bXArsZeJXuTFgjH7nw/VntlrsSwrQGIvJ2BIQP7HEgRDjsrBTbA2+Gud2k8PY/RyLx4TM9H03oMXYdBmeLp7+JPWin+5Z3w9ilLBSiVxZxhPAoYcu7eLRffc8H6uo/bVA2l8s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=bBJcZXNR; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ErZzBF+j; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="bBJcZXNR";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ErZzBF+j"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65C3BhaJ2450818
	for <devicetree@vger.kernel.org>; Fri, 12 Jun 2026 07:56:42 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=23qh1IfVo3G/YiV2/ivZAMF4
	usExeox7x59Igf9gmgM=; b=bBJcZXNRgciDrMvAataJQydstj15Z4pUdlIupOly
	2Q+SpUygEVWn5CoMeRilzszNTDCbh8ZXm1vbm4g12e/U/CAG8dvlUKntW7ZRTcc0
	34Ih++tfG4q96I9/DPFQrnjCSnzeQKEmGHQwVrZ1Mdw4p5i3M+Togdq5P5tzW7vn
	ZZjvz7LCWmf+xfotIffrpFefIEn5TAyeFnPAK29ndS7BlgdoHddjQ/aSC+7oZNF/
	BRyXh0nkmK6zWllG0vWH8Mn/KANlr1fet5zY9vCc962bUP8wZVE8iu1EsgczYH17
	JnZCKr9W0PDZlOB465QkDy+51E+G5JFLBU6SsaJA4+6cJw==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4er1xcjdm3-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Fri, 12 Jun 2026 07:56:41 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-517dadd84f8so13543351cf.0
        for <devicetree@vger.kernel.org>; Fri, 12 Jun 2026 00:56:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781251001; x=1781855801; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=23qh1IfVo3G/YiV2/ivZAMF4usExeox7x59Igf9gmgM=;
        b=ErZzBF+jT3lj8EMebMIkZyB8vS38wRmKJfpL3gZTFCtwNPbe/l1RtaumFAMsb335yC
         EIxB82fVpiCJTHZz/hOqJlLYAXF0/n4uFvUpK104AeP0JQK3yT2bqaHzClbEPwGCxIxk
         G7fhHcQno/2m+EmymrMRMNWlwT8qHFP0w1XsrESO0rAF9lvXe7NTtKSa8URTsSxzmrMc
         z04jIjCcFNLF/r45a0IUBL0I+H5cgg8vkKNhS7M+na0STA+Y7GiVj4Bc/ZEeCY9TC68R
         4qM/7wrOe9bZonCOQgLYyd7U2iz69O7Z2ghdi3llCjn02yN5Yb5/2NJhSFqSli2Ud4Ar
         IbxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781251001; x=1781855801;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=23qh1IfVo3G/YiV2/ivZAMF4usExeox7x59Igf9gmgM=;
        b=KqGus4O3iTOV5Vl4LOJKZ9czuAnCefxoOuCgfS7+nYYKfpjd6/ScMgxTHeWU5LXE9/
         C4ckMsqz3h0mtS6Urg72KLBivErXovHXF2vfRc9nKC5Jg+iPjei3NQLxkxgstoN85+f1
         OfQNpxTM8SBrW+Qylpjsc5zrodzo2qG1xq0m8xSYFVV8iamaxpJ3CsAOX2lMHjqyS1IX
         LEQzsF4q2BrPAB9huo+WsGCCNSrfflSZmzMA1PjYRfEBi8UNieHHqrX7hcfTxme0hQS0
         aFF9hJc7VKiwNYL8S/R6HWAriI15s4c2YVAFL3OiFYY9wt9H901HYUunJIlP9CoHU0uu
         wrtA==
X-Forwarded-Encrypted: i=1; AFNElJ/FPBZcJq+qzQzpFdP2xha+mEotFuEGMPbly48ArQoAEXJERo+GI/U4DHMFkUwcLHAwUxlfwCKGBxfu@vger.kernel.org
X-Gm-Message-State: AOJu0YyMAiBezJFjlhj3L6RD4c82ma+rly3wL6cK8QdGONAw/fvF3iY5
	zhwVum2JwHPcOxg16J/eXso1DLmvPtO+1WN/DRMw3Ihhx/lQNBeLRmJ+0sjEsaPSiDKNXLT2ki1
	6YlUdl3g2LeZk9aCPfkFwyySk7Lnqv4RvwOrOtk5zF7Ih+nxQ+rEnH0nOdZSoIvZ1
X-Gm-Gg: Acq92OF7uMsrUMrYmw3z2k8M9z96v3QkDTY8midRAfJFIMH86QzVkS3mCuFpvRWzOF+
	o7ILWNkAjtuPUGNBwz+MCxMu2oGAQnv/dC8bwW18moGsM1mUQSERrwbOojFBk/BTBNH1onGbkHp
	7ot8D+8d11m5Zym/8Z8e8ymYDtA9OSSZfuntbRa7wHAwX5L5Ao21n32Ue9y9oPMFRQ0ZPsZ49Gb
	y+3q7Iy7vYMR2kMHQ61xoUoN3rRrb5cqLEDJNX2jCgUBqjCAsiFn+4VTnMUqxX/wRqwZlfi0sSy
	sjA7cfOSR/mOLbzs83aUkWqzFggchge0NriXlmAnKCjhGGi7mZr7ZLTb4yR07hF1sLLFfwaZGtC
	86gbTrFleWWSzLMWQnp1WG6qartEaE9H6ko25m3FrA4R4R2DM78AnuEHet2h6hg9WWucxkIe7Qb
	zBCadKSpGPF9tvMv+rmdiTX2WiuoOrXMJOSAU=
X-Received: by 2002:a05:622a:d12:b0:517:89d0:b8cf with SMTP id d75a77b69052e-517fe18fe25mr18621591cf.8.1781251001104;
        Fri, 12 Jun 2026 00:56:41 -0700 (PDT)
X-Received: by 2002:a05:622a:d12:b0:517:89d0:b8cf with SMTP id d75a77b69052e-517fe18fe25mr18621461cf.8.1781251000734;
        Fri, 12 Jun 2026 00:56:40 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5ad2e1a7092sm311542e87.50.2026.06.12.00.56.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 12 Jun 2026 00:56:39 -0700 (PDT)
Date: Fri, 12 Jun 2026 10:56:37 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
Cc: Vinod Koul <vkoul@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-phy@lists.infradead.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 2/2] phy: qcom: qmp-pcie: Add IPQ9650 PCIe PHY support
Message-ID: <a3f4pqg2sa3drubpcbdhm2xt5nlqdmuxtlrtaqfkuh3vgpimwy@wji6puysk3hc>
References: <20260612-ipq9650_pcie_phy-v2-0-b938cc2fc267@qti.qualcomm.com>
 <20260612-ipq9650_pcie_phy-v2-2-b938cc2fc267@qti.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260612-ipq9650_pcie_phy-v2-2-b938cc2fc267@qti.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjEyMDA3MCBTYWx0ZWRfX7QH5HDr8J1hp
 4QtvLe4rwbXBKtllKMbMQRyGtH+3AfeTIwGsXfQTRWFnR7X5+BIsvHoMpLr/bblCfq1qz9HJ7Kx
 DpX3MhCdHAq2jcc0C7UTRp2Oh++5ZmpLD9IQ1h5+1EKLC6NaWUye7+iH4ZpLeaGWVh8WXLmTRgf
 NYyfkjmdNFpbS55/Jl/77AzhFPIKCMQXCH3FljP7+8xuSO4e4wfGtiXqxkW9tY9JXpd8wz9gzau
 XJ48fAYmec4fiEaIbD5LEivTJq3ik+JkcqZbDhNyrRmU+lqcNqntQe8+3S2GYzNrJvfkopIGXcE
 qYmmZf1c8vTfj2xg/40H57WAiPyZ+H6f+hfu2EA1ztxwX3iO08oPLZqEbI1CESWDMcrhrbkOluU
 1IDzl1HpGCx8PeNxJJhZp2PRhtFJCw2iNKsVBlwPOAFs96Db2e/3H69o/sPhpYe8YMK67y7Nr6T
 QBB+I55q2OJEfJPC8PQ==
X-Proofpoint-GUID: IjhwRCjRRDvI-9DBsFJf5Ukp3Fi7SyUI
X-Proofpoint-ORIG-GUID: IjhwRCjRRDvI-9DBsFJf5Ukp3Fi7SyUI
X-Authority-Analysis: v=2.4 cv=NZPWEWD4 c=1 sm=1 tr=0 ts=6a2bbbb9 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22 a=EUspDBNiAAAA:8
 a=TUoPzBygFmjHwfOE1pgA:9 a=CjuIK1q_8ugA:10 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjEyMDA3MCBTYWx0ZWRfX2SxvBPMJfV38
 Cnrx86wLCd+pQaiRQdJaEV+AtTqFXbHikykjGj/tDsnCxeAeo9UjVVgpM45AlGO+ROUhVTyMls/
 iiYCfidsduQQBPi+6ZSdn7KVXL7LrwY=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-12_01,2026-06-11_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 suspectscore=0 adultscore=0 lowpriorityscore=0 clxscore=1015
 priorityscore=1501 malwarescore=0 bulkscore=0 spamscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606040000 definitions=main-2606120070

On Fri, Jun 12, 2026 at 01:21:02PM +0530, Kathiravan Thirumoorthy wrote:
> From: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
> 
> Add support for the IPQ9650 platform, which includes three Gen3 x2 PCIe
> controllers and two Gen3 x1 PCIe controllers. The PHY instances require
> the on-chip refgen supply.
> 
> Add the IPQ9650 Gen3 x1 and x2 QMP PCIe PHY configurations along with
> the refgen regulator supply. Note that an on-chip LDO, driven by the SoC
> CX, supplies the PHY voltages without requiring software control. Note
> that IPQ9650 does not support CX power collapse or rail scaling.
> 
> Signed-off-by: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
> ---
>  drivers/phy/qualcomm/phy-qcom-qmp-pcie.c | 220 +++++++++++++++++++++++++++++++
>  1 file changed, 220 insertions(+)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry
