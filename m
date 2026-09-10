Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CD7E9EECB
	for <devicetree@vger.kernel.org>; Thu, 10 Sep 2026 06:46:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789022814; cv=none; b=SBIFcTltLEQJEhy93wWAe4jZ65u50PVHsRQdnNkpiM2GUv6/yxGXASrsiTadFyOtIep76D4rK1QdkGLmYmyYxYuLjJZtQ6WrgadbkImH77okXWptIYnb+vWnzm/q7gB9+ctb/2HgbISwR/gJoU/1jNEI3gioksGDchOsxfQ0vVk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789022814; c=relaxed/simple;
	bh=ss1rHh64uIjuyYcs9EexckevxsdC3EsWu9JrzTfWz+g=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=d+Al+r0Nsem7j54EWntoozV5A9R2cKkAToiDpuHQuPYMc069IYMKh9dwU6uRTbajOnR5Udd9deV6AACerlVJKpkX8Jf0fyzUKy9UYp5ineaPq9Ub4b5vZmxxQzj0bwVuRASoMbHZ17p3wWfj4TBI0wWFjRKazvBZsdrVP49hkDI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=EHPun7Og; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=B4ax5egJ; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="EHPun7Og";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="B4ax5egJ"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68A5GaBj4187870
	for <devicetree@vger.kernel.org>; Thu, 10 Sep 2026 06:46:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=OtlYq/p9g/l09HGFRWH07O7/
	FCUFDmortwofpkkwn8g=; b=EHPun7OgTpKkjm7XCc9fqZFI35/d1VhTL/UrZABy
	J//NaE2LfK9ir7wtviM2sbxE2Sj3QmSdrk818QhCtXB+omj4aFUtqMr1yDdAeNMU
	17zHwRGR4WG3HLl3etSi4FioXZKF0XM6PKkrbMz2n1zfiTEYB7gtL4UCpQl8VprA
	lghXZuLkYCnAiPHSzutXEcgc1QXEcNre5MW8bdQpWYqjATYiePvFIu5cxnWPdnXO
	GAZzSQYLt/jDnOccVQjHLWlzDh18s+cTf3Vb/zxGE0oqJvZzuImA29HSunv4diTR
	uidPFnY+lbaLhOggssE0qz3kyU9N8yYJ1U10um3XPhrLHA==
Received: from mail-pg1-f199.google.com (mail-pg1-f199.google.com [209.85.215.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gkcygtfpu-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Thu, 10 Sep 2026 06:46:52 +0000 (GMT)
Received: by mail-pg1-f199.google.com with SMTP id 41be03b00d2f7-cc4216aee8fso9097070a12.1
        for <devicetree@vger.kernel.org>; Wed, 09 Sep 2026 23:46:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789022811; x=1789627611; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=OtlYq/p9g/l09HGFRWH07O7/FCUFDmortwofpkkwn8g=;
        b=B4ax5egJbjEBnuV7H58U8ZU9stpVLTmKNMoh2GhZnGnZYNqLPeQqUbToYqy8tG+Q4a
         OVyL0zJduDSexdqcqOMv8F3YzNlq+tYWJL0VLills3EWgZ+3GJS4Twt2Z7NU70IHq0BX
         g7fmGDOVlrUakSyOKEEdRqpaxNWDXhssukvBl8brbHK/EervIeslbHoeG3E+4bBJwlpu
         emW0Ejjb9/2b+/jDyLojlcipBRt/6fDPvW5sPBOtiM+VT/k/hdu3b04LH13kcrvg2lrI
         yYgUkGLmhckAwTY102jO+LfSuWo3r65nE/1GVKDfAWyq4zanvTSdFlJTvWdeedIBmotA
         roaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789022811; x=1789627611;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=OtlYq/p9g/l09HGFRWH07O7/FCUFDmortwofpkkwn8g=;
        b=dK1yaFG/MwpwPOjIJEW84c4XdlYcuaHjqSN+lVjlXiBdwoxn45k3f647hzs1S7HaZN
         w+Y8DlK++unIjeVcV/PaCfPuqc2VFQKm2xYCnMxRwFNXYVjWIDWz1XDdj5Cd/93k9q+U
         WtcNgLwK5CrmEeb+ITU4uNGDILGiGTCKFdjJiXeyHBMEuZ483MnOqe0vG+0PyO0UVflz
         hVbzaouiw0Q65dO9FEX8eawLYZdKY4jDrj06xJky45YMFefwklIk6QOdSLuV6zoBhtoW
         JGBBX0D8pQ6qsZ+ml0uC1JhlsPILgbarircYErUnaEr/KKFCgvU39cSXZl9reeBaJiw5
         UYbw==
X-Forwarded-Encrypted: i=1; AKwUvBwuGhlxLgFVuUWIde0DaRUtd/qZEbjCSyQYHURAp7/nvz+Fw+LWOxrG93iWp1BeSoFXCcZXChkJEBUs@vger.kernel.org
X-Gm-Message-State: AFuF++kjYEiNKXf8Ep8HOAg4i91Ck9Kckwh6vwgKh+eLkN6rKJJG1Pb8
	jC3XAUbXDX4VnYnNF5RdZVcQ2ao0aIfB1U+9SBdVI2t0NPTkOsWyQOJH4VcikyyB9lHqbkORZgV
	mqt9j0preAOYAr83G4GsmzsPhpsRu1PToRkdQZRGzVUMPvpxc3rfGBFivQhA+tTeZ
X-Gm-Gg: AYBFou0/VYkUWu8jLtY9vZYqt1Axt9V4P5sCS43/sLRHsRKVPzbHIvxC/xg0EnYqVXs
	CSE+xntm2CrKVCGgNzgTbsIAh5t7av7+ABs5R4OcVzwo3Dl2/BytV0DKSO9mpL1mJ5S6d1bJ+DC
	0/FHOgUe12QczwuNE0k7F91X9Q/CwC2BGt6GJ92PULKW2b/xoB7I5ihLztjqgT/TLTALLwIlRCK
	oYvBC9PdAB+CZ+vrn+m9qvhMO0YZ7Mstn493Uc0FEMaun2lEna24TqiPcQgLYNXLJsr6zIgrZTS
	5+l2TqH3Dp/uIM1PIUe3Puf9TYfxZEmFJwfCZgpKF9NB9fBzhZHbsHrroPnkBjFxIiKtDE9NY1P
	kq6acAZJa9oQcVsgNe8ZKI8EX77BPak8jw2A8BN9lEms=
X-Received: by 2002:a05:6a20:914a:b0:3d3:aec2:4dcd with SMTP id adf61e73a8af0-3dacbf56563mr8135484637.25.1789022811484;
        Wed, 09 Sep 2026 23:46:51 -0700 (PDT)
X-Received: by 2002:a05:6a20:914a:b0:3d3:aec2:4dcd with SMTP id adf61e73a8af0-3dacbf56563mr8135436637.25.1789022811020;
        Wed, 09 Sep 2026 23:46:51 -0700 (PDT)
Received: from QCOM-aGQu4IUr3Y (i-global052.qualcomm.com. [199.106.103.52])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3339af25062sm77169144eec.16.2026.09.09.23.46.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Sep 2026 23:46:50 -0700 (PDT)
Date: Thu, 10 Sep 2026 14:46:43 +0800
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
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: Re: [PATCH v3 2/5] dt-bindings: pci: qcom: add Nord PCIe controller
 compatible
Message-ID: <aqJSU8y-ZAQjnRJf@QCOM-aGQu4IUr3Y>
References: <20260909-nord-v3-0-b0a82721c547@oss.qualcomm.com>
 <20260909-nord-v3-2-b0a82721c547@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260909-nord-v3-2-b0a82721c547@oss.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTEwMDA3MSBTYWx0ZWRfXwbApu+8IaDX5
 Yzw87T1n3HrJZNKo9v8s3QkZm7d8U8Kiiuc88hmcmx2of9nXuLVgY9jCuzuJa4dot2yp4dSdn2b
 whlvQs+Cakr8mzgJp2wneHpRmebOz/ioRJXqnkNHaVvzlQ/SXR/Btw9kTYXfv7CE5ve9NytwKh8
 8zK8u6w9tKPTTcEUDnvqFTxhJ5KAgu0F6WM5xQzIOf64DmsE6L2ORBbTOVkSpWBizApAZfDLODu
 yRJkmBkXnAaEVuulWux2DWl2PKtYVDbrUZDh4rCv7Aq4OfwpDajT+WcWv4ZgPY9/ASBkqJM/sST
 PqiXCEeqjhXhdeHJComlZKZnyK1TNb5ZRyefW+J8qHDc8U98WnydPFBB+r7qNDcGd1hji8YE4bP
 9sLZAisr3c7ocC1uU4AB6E0eCCRMovZueak0C6zAb1tKj251YVPk2HtTglrStT8Ta5yD7jvDPKz
 Ib1/XWVMjTWoItHS9/w==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTEwMDA3MSBTYWx0ZWRfX0hOuHZzBrU58
 5Bc60cKyeo6/tmTuzyFmZmc/7wsTminmU0trQaSChJO0ZSP+A90ZzM8k7ga91jOAj1J2spsKUJY
 a2DX/3OyJ6pR15RnFLv44BAQqelxDtk=
X-Proofpoint-ORIG-GUID: loLPl-Am3b7u8A_3C2MrLG-5mr4bd_iE
X-Authority-Analysis: v=2.4 cv=VONIDNPX c=1 sm=1 tr=0 ts=6aa2525c cx=c_pps
 a=Oh5Dbbf/trHjhBongsHeRQ==:117 a=b9+bayejhc3NMeqCNyeLQQ==:17
 a=kj9zAlcOel0A:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=EUspDBNiAAAA:8 a=Y4sVft1UDeOkrP7wHAgA:9 a=CjuIK1q_8ugA:10
 a=_Vgx9l1VpLgwpw_dHYaR:22
X-Proofpoint-GUID: loLPl-Am3b7u8A_3C2MrLG-5mr4bd_iE
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-10_02,2026-09-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 adultscore=0 phishscore=0 priorityscore=1501 bulkscore=0
 clxscore=1015 suspectscore=0 lowpriorityscore=0 spamscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609100071

On Wed, Sep 09, 2026 at 05:18:17PM +0530, Krishna Chaitanya Chundru wrote:
> Add the qcom,nord-pcie compatible string to the Qualcomm PCIe
> controller binding.
> 
> The Nord PCIe controller is compatible with the SA8775P PCIe
> controller implementation and reuses the same binding definition.
> 
> Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
> Signed-off-by: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>

Reviewed-by: Shawn Guo <shengchao.guo@oss.qualcomm.com>
