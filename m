Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 97FF2337B87
	for <devicetree@vger.kernel.org>; Mon, 29 Jun 2026 12:14:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782735285; cv=none; b=fUyqV+dbwLVx36kaMoH9cuHvAOxVXmkrVIElfYgyg6sH40z4cc8mxiZqyuj/w9g1j39omnA9JT7ZtK5YmtXSNTiFrjp3rlYyd+mSuQW3ktEeBvKbmv4RjiuNx9me8HNDsPHojaHV3uCMXrOP24hPHd4TQmWhyYj8+3dAzkogrzA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782735285; c=relaxed/simple;
	bh=ZfBQj73tTeph5ZD7ZMKd4CZaoKr61w4AR/5ear7QtCQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=flx3QUnpkOl2mlEL+e27fji7jjMpp/BLKnwA1SXYEkhdIYLgJ8kLs/KBCqnqx8CuQuq4VezdkHKFJqYzjky2O7YxtGbrqYa+o8ebwSrqcIEmf72IVAtf4G9sr/O/W7bltyPiP3SV4xoDSp5YiLKv8veMzBpwr09METg0lgInsa8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=KRZBID8q; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=OWYeWSE6; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="KRZBID8q";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="OWYeWSE6"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65TATCkn2647685
	for <devicetree@vger.kernel.org>; Mon, 29 Jun 2026 12:14:42 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	X9w1/QIKFq54QUd/LJpbv83to7SgFgUUozDIlNCAR9E=; b=KRZBID8q9ZxDLmoa
	VLqGHGfrwgE/9skHdghCXGW6YlWe8moc76aXfJZU0ufYxKV28YkAYRw0vf96/6sF
	3v3sz8+ZvmuMATO3wms+fdoY/Cz3jeMd5cTCU1dbkaeSw5T0SscTYoiCKjP2A5A3
	nMvgd6if+9Cw4NzJCq3ZkoqAkTHfeI/eQb8lQY6YVUbJAZWdI2sIMq45t1E8NlIa
	fNq0ruN10geppLNE2mVS8dMB9E2CI9i9YONbLYA+omH424P4fqDaHi0Odw47cm1h
	INaS1aURXvHufEmnnjLOzlF+YqOgUFz7gepysGqo3B1Km8dpAbT2nKRGhn8yg1Qi
	Fsi+iA==
Received: from mail-dl1-f70.google.com (mail-dl1-f70.google.com [74.125.82.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f3kyjh6vh-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 29 Jun 2026 12:14:42 +0000 (GMT)
Received: by mail-dl1-f70.google.com with SMTP id a92af1059eb24-1383723dfddso5209271c88.0
        for <devicetree@vger.kernel.org>; Mon, 29 Jun 2026 05:14:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782735281; x=1783340081; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=X9w1/QIKFq54QUd/LJpbv83to7SgFgUUozDIlNCAR9E=;
        b=OWYeWSE6xE5PCEn1LkwG/XJ4CMnkJCL8bCnWwUsHqSSNHMBuB2DSvGjPpEVw2nyESe
         hzJWD5MPCUEa9yGY5pXaq2Ak2z+TlRvGYVZtML+E8VLTotmeaIN3AkA7s3QDtOklnCfq
         BBYTvwqJH+HWsmmLCT8sH8ErgnrTodii+7HnuEyLEaQabWyZjbkLi9DUGTzde8eptSiW
         T7v7c4UijQ3PrYYFjccdc0DOnmuzg4gwOIeO+nWKNfpTciGwx/MyoVLmjxHRy+bqXlsd
         8AK4FhuRkoxEuuJcZKz+VoaDLrZECswBPPFo4mMXK8+1mlfuEr1m3un/2knZru7DiGS7
         Q4fw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782735281; x=1783340081;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=X9w1/QIKFq54QUd/LJpbv83to7SgFgUUozDIlNCAR9E=;
        b=S/FGYuWj6nAD69LpCxK5Jo21Dd9DbUE+ALOEYgJNo3qaa0KfiAW2hXGT0gbNddMTrT
         o+arbFyhSz8AEfUNetKqkYiWRV4qdx4iLI8xwbLIyEqpkNUHLZqSSdLikdx9hUHj5ZGJ
         YgMxSUQf0PKCCDCK1TDP51IWEsA+nQ4yEY5rCVuqpZU26mxqJOgIoUdGPI4gKjBRoNI3
         wMeLQgxQmq1rz1Etzxu3VxIXahruHd/eC2aDIJklxTXG3tPgXK4/9jyiyI/jRxLviL21
         xAQ4u0wc3/i1Vnm4vzlz5gV0QvEm+HlDBNr3d11vFkUePbpj+6KMl5qSj8NhtJDBt+vu
         Jz2A==
X-Forwarded-Encrypted: i=1; AFNElJ/oefxxKWmlEs0GqFupKmzA0aLwo6hSnMQRm6i0+cYkwSLI460yEbCUZ2qqxKn7YWvHaCmiuVki+CrD@vger.kernel.org
X-Gm-Message-State: AOJu0YznInPkwvO6ugPjW5KGj0Pg0wYcm8tA1EIRwuDPqI2Q+AwTec4x
	opa6DbrFq+iga9jWykSdWezgQif/NAm5Noo7TBBUy/XerUinTvqI6KB1Tym/vyEPNGBNWdsIi+Y
	gUDSKuKl7hgqbsIs+diDIZnKil86+hAT0OJ3KWhPnnbjAuNZFYOmFljMtlZ7ZYXV4
X-Gm-Gg: AfdE7clhjhCW6EtQH2p2r1VNScT7F03yGG8XQd3I4PYli9Uei6RtW95L6Vap7SIBGq8
	GRp1ZqEwDB2uVT2Lmc4Y40NLUIHr8b2A1N/Z417RD6RRksV5YdEJ7vYnGmQPpiHnI7D72a2aVFd
	JOhmK//EuiX5QL+xgokNadx4ErYXRV8AOUzIAT+ybIDPEIQz20th6W9inAKvwgiFLuQZJlo5wcM
	wfr1y6Zxq6yw1ycSN+y7gtr3ZqZ5XqwR6hGMR4HIhZAVUdhZQHk/VE6EcMbIc0YPC39NsZ1sre9
	e+tmJca/vkQ6uzzCwWHIUBFPUB7ge8xxqTnP69X4XyBbBAR44gFB1W40jhghGiIvjEcUXMkR6mv
	TxSTxge54pROPCdlBGfTIlq8DEj7xUDqipOxTL1aHy2z7jiIdwT8ZfH/D2A==
X-Received: by 2002:a05:7022:ef08:b0:139:ed59:4b8e with SMTP id a92af1059eb24-139ed594d8emr6303119c88.50.1782735281433;
        Mon, 29 Jun 2026 05:14:41 -0700 (PDT)
X-Received: by 2002:a05:7022:ef08:b0:139:ed59:4b8e with SMTP id a92af1059eb24-139ed594d8emr6303104c88.50.1782735280907;
        Mon, 29 Jun 2026 05:14:40 -0700 (PDT)
Received: from hu-qianyu-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-139d912197bsm77382329c88.15.2026.06.29.05.14.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 29 Jun 2026 05:14:40 -0700 (PDT)
Date: Mon, 29 Jun 2026 05:14:38 -0700
From: Qiang Yu <qiang.yu@oss.qualcomm.com>
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: Vinod Koul <vkoul@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-phy@lists.infradead.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 0/3] phy: qcom: qmp-pcie: Add vdda-refgen supply
 support for Glymur
Message-ID: <akJhrpyMuLnoXzJM@hu-qianyu-lv.qualcomm.com>
References: <20260623-phy_refgen-v2-0-4d15983bf91d@oss.qualcomm.com>
 <8811c181-9caf-4797-8e17-52311702e292@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <8811c181-9caf-4797-8e17-52311702e292@oss.qualcomm.com>
X-Proofpoint-GUID: W9Kp0jkTCBEeY71LkntNDfn2irPW8AGu
X-Proofpoint-ORIG-GUID: W9Kp0jkTCBEeY71LkntNDfn2irPW8AGu
X-Authority-Analysis: v=2.4 cv=Ftk1OWrq c=1 sm=1 tr=0 ts=6a4261b2 cx=c_pps
 a=SvEPeNj+VMjHSW//kvnxuw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=HbeE6YyLVr5UAZUz1j0A:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=Kq8ClHjjuc5pcCNDwlU0:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjI5MDEwMCBTYWx0ZWRfX4T+MfhuzOX4d
 t0r6FTZiR3g97h6HakbPCsRem0oP4DA7X4hRtzOLRPRAlx1dTKxYNa/LVrkZT+8h8zywNEBPUX5
 gj0wItu6E7H5KIaGsiQis/a03xOJen8=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjI5MDEwMCBTYWx0ZWRfX70//IGz33oEU
 1seebD61z1EWaHjzos/bc1XFBxNCCqm3xaxNPUTXgihLnLCeRks/kbEu6S5CklX0sZfFp4hM9QW
 wbojv/8QeCAzxdxfTFX0nzqSj8+HrcS1fCKqyXpsEOkI7njUxpkFA8y3cCjiwZ4teGijOBUVUbQ
 2FTzpqc8mLSbgqcSqspkjA79T/mdprN/EOC/ff2u9pmkCTuMnbGbnytQwt6zAGRUqxp5RdscKyP
 7ZPx4bfFt++s/StcrnToGAS9mzlNmmd5QYvuvnG/qQRMeIvhqet8uH1e+lurYw4wxzKVuOw0fD+
 BNNNdbBcXxK8CHNzfXYR/baQelA7TTyMF3E4OoAdGTklgKd92XS5MGz0jYhDxonhQJSLrPjYIL+
 BngF0K8LgS0yvs2YJuIDszzLWWcbBhIUtwH9H8F86k+secKBDY5BY4UzswWPeLjBDEbVh3f6M63
 gSfN5vbIyMdto6mJhvQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-29_03,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 lowpriorityscore=0 adultscore=0 suspectscore=0 phishscore=0
 priorityscore=1501 malwarescore=0 spamscore=0 clxscore=1015 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2606290100

On Mon, Jun 29, 2026 at 12:51:55PM +0200, Konrad Dybcio wrote:
> On 6/23/26 3:05 PM, Qiang Yu wrote:
> > The PCIe QMP PHYs on Glymur require both refgen for stable reference
> > voltage and qref for stable reference clock. The refgen requires two power
> > supplies: vdda-refgen0p9 and vdda-refgen1p2.
> > 
> > can be extended in the future.
> > 
> > This series creates a Glymur-specific supply list including the refgen
> > supplies and updates both Gen5x4 and Gen4x2 configurations to use it.
> > 
> > Signed-off-by: Qiang Yu <qiang.yu@oss.qualcomm.com>
> > 
> > Changes in v2:
> > - Add dts patch in this series.
> > - Reword commit msg of dtbinding patch.
> > - Link to v1: https://lore.kernel.org/all/20260208-refgen-v1-0-87ca84fd78b3@oss.qualcomm.com/ 
> > 
> > ---
> 
> Is this necessary (for Glymur) now that we correlated some of the
> TCSR clocks with the right nodes?

This patch is necessary for glymur and mahua and other Qualcomm targets,
which can be verified from the REFGEN page and power grid page on ipcat.

Take Glymur PCIe3 PHY as an example: it requires two REFGENs — REFGEN0 for
the PHY itself and REFGEN4 for QREF. In the TCSR driver, only the LDOs for
REFGEN4 are voted, not REFGEN0. This is intentional: each consumer is
responsible for voting the LDOs of the REFGEN it uses. Since QREF uses
REFGEN4, the TCSR driver votes the REFGEN4 LDOs; since the PHY uses
REFGEN0, the PHY driver votes the REFGEN0 LDOs.

For some PHY instances in power grid, you can only see one REFGEN, that
indicates the phy doesn't require QREF or the phy and the QREF it requires
share same REFGEN.
> 
> Perhaps this would be necessary for Mahua since its clocks don't
> require QREF (or we can lie about it and handle them there)?

For Mahua PCIe5 PHY, it doesn't require QREF. So we don't need to vote
REFGEN LDOs for QREF in tcsr driver. But the PHY requires REFGEN. So we
still need to vote in PHY driver.

- Qiang Yu
