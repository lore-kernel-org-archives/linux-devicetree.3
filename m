Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9AF8F2DF68
	for <devicetree@vger.kernel.org>; Tue, 16 Jun 2026 00:28:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781569697; cv=none; b=DGMr/+Wo85HINvcuaLYu2RjZXkq1T82YswcoGNISFVDj89Xn8TXayNHk6eGmaLBCQEUwcQNuUT0JcRDrRK3Cyoy9VrIED/KGRQBRkNDB9X+DOISdUq7T0nZZo9WAbjEmzJHoDijV/nLE3xhB7wdeb2CS18k22ezi5TMWRYjGk4E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781569697; c=relaxed/simple;
	bh=nDuZJ6RpNfUQegjL0t24433w4IbPUwhql8joglujyTw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=b36MYM1YvhIzL5b3AQ/BYNVmDGbAqn3mjlk57AOJVX2vl6mPPXDdmSkM6rXFgho3bi/LCqG+uqr+SBx5AjbzOgoRfBSlq5naSTj/ohtNA50620piRWEKU4m9lLtPGIPaI23gQD1IvSdPDgl4gtgAt0qL/XnHU9aIn3nCmxiYsLM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=LIedlHWV; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=bKnNloaj; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="LIedlHWV";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="bKnNloaj"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65G0OObY2064153
	for <devicetree@vger.kernel.org>; Tue, 16 Jun 2026 00:28:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=bFSo8xRLtwok2hPU8ysHad3w
	ymjeEQwi7dld2OfYzu8=; b=LIedlHWVyJ8L4PtHaMwb/joVnp6AEjMPm2D+6qP9
	/aGXMwH/ffZgrF+tB3/k9rGpYf2yiBWv5DzgY7zBe9DT23VRIb1crZJ4fiM/Vavu
	shQZm1IHeBGsl4h6tNsmH9Kbvw4rX2mr1HKEdrCttQDDe1Tj3n3N2Vb7Z1aMMFKY
	xitiZ3y59elNiertDOFQFo5v8AvSZ3u81LWV+HstEjfpwCcmetyJzuv3SgPCknKh
	f0OHJUSKhir+1gdyfLJkS1jKCbhQK1j257xf0Fx6h3dRzG+Y2X1Q8nzxmIIuE/O6
	A/8IeBC6Ee48qPB6WvpeR2czVtUY9+0QNrakIE4IWr9Nfw==
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com [209.85.219.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4eteguutud-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 16 Jun 2026 00:28:15 +0000 (GMT)
Received: by mail-qv1-f71.google.com with SMTP id 6a1803df08f44-8cea98a0effso86640496d6.2
        for <devicetree@vger.kernel.org>; Mon, 15 Jun 2026 17:28:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781569695; x=1782174495; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=bFSo8xRLtwok2hPU8ysHad3wymjeEQwi7dld2OfYzu8=;
        b=bKnNloaj7tvR/Aa0zTQM/FjiwRjcfnxkZ7Xk6pRBNuHQeNMA5D8f1yIEL0GPWDQcS8
         947NRq8WsrkrcPgYuuD+O3EZzzDp7PfmjPsOOvv+/Iv+E4xZbwK1SWf+CdrITQEbAUP5
         QDYS4K6wUAXUsjUR0cgufwxk252pll7RfhizJDvF5roFYtckKzzTuaKuTFZ8j5FVd2jJ
         iV6SLQE7xnp0xMrPAdIjbPj0zWJ1egqY9jISJ4G8NdiTgpMgATNHqMVWQNQoBFC2XAPJ
         bIzafJMmw0xT5r/PTbvmcUxJZWWAxSEI2VASiHynsn58MU+RIpNAKdLx3bdlSlI+wkZw
         nZ1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781569695; x=1782174495;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=bFSo8xRLtwok2hPU8ysHad3wymjeEQwi7dld2OfYzu8=;
        b=Di/8qUv9w00tLOaXsqFCvUvFic4MUZFdkn7j2+A5c9gF56hy0ng2C8jQhMhMMA87fu
         PyLRiPGGzP+OfZ/dqrsggq5OGEIOpte8i8pi0B0UidmmRkgoQEVgwTBE4DiLPE7oPacb
         w1v144CnRY8JHDGRkTPOqjtzJzJyf+kS7klMnIoGDwQvdoaHMB4MEPEXJnCeX8hjx427
         8l1+MMkoP+NAbNY2N8SsdRjMFJ3EklifR6mPfOLGKz6w1AglVgJmOMoy+1h3GovZqjs4
         AElO317ml6qhJBehiPg+2h8elMuWOyo2mBV2dZmNTk5cmNwa0GUlGFY+7ICXjQoX0F8F
         NDKQ==
X-Forwarded-Encrypted: i=1; AFNElJ/k8+0WDhpiFg/xbn/NPfYBL2p186m47dgoU3Z23b5Vcf8BIoFwx4ekDCvbaXMvBs+RyOnz6hzYIXam@vger.kernel.org
X-Gm-Message-State: AOJu0Yz2fHg1dvOWCOusRM8J371fe4/b6Ojik7ItBjW+CBGJYzyt+MBj
	3+TIZZ1c5JLD1EhemEnJCPczN41Tpsc+rJl1wj+uc/IBsjVugETUcZu7EhDmr9XG50oOtSAQO7D
	5m2NmnLMV7iZ64nhbGaoZvGKg4ntOA8lmEi+r8vIXRS/GD4Ly551ZN3VSjDviqun3
X-Gm-Gg: Acq92OFarH8AzgLM5SNZIa/LnYKzuujdnB7BUrJ5UoOqBHBN+zl374UetndfUdqH5hb
	kn7oQvZO50EIRO2m2EzdLaHSus+bjuECOUqYedQWF7wIAUt7B085eIJeCFEJnBtULZnlOA3T76m
	CcoPo2DMLqF59SeDgFEMKIRWvvVNyNX3pcv16KnqHA57ooaMNbCyobs2c/bLgFrwLefxY7B0J94
	N8BgLGbZeuj+sSB7IDlObLPq1ccTW2WubNK+eNcRE/8Bm9pv6u6dEJyO9t0qE3mi+9/YbcHJcfQ
	33ZKf0XpMwhAJvg/iQhm5FPOrjpMTcCRhsaw3hjoamt2NJpgfjaQlkakrinaJYyNg1h+Pe8elf6
	ZWJsrfHMAEbRckYqJZl1gMtqdlGk3sXIEd4b8qbNjGREH+LNKwpoxGO8i8+mwNS8xkqcOhNu3Pg
	I6R40TDbaDRrZ6dA00hgTszt/sRsSuJX8+4RM=
X-Received: by 2002:a05:620a:240f:20b0:915:aad5:e961 with SMTP id af79cd13be357-9161bc2369fmr1784598885a.19.1781569694816;
        Mon, 15 Jun 2026 17:28:14 -0700 (PDT)
X-Received: by 2002:a05:620a:240f:20b0:915:aad5:e961 with SMTP id af79cd13be357-9161bc2369fmr1784596185a.19.1781569694391;
        Mon, 15 Jun 2026 17:28:14 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5ad2e1adedesm3116010e87.57.2026.06.15.17.28.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 15 Jun 2026 17:28:12 -0700 (PDT)
Date: Tue, 16 Jun 2026 03:28:11 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Wei Deng <wei.deng@oss.qualcomm.com>
Cc: andersson@kernel.org, konradybcio@kernel.org, robh@kernel.org,
        krzk+dt@kernel.org, conor+dt@kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        manivannan.sadhasivam@oss.qualcomm.com, bartosz.golaszewski@linaro.org,
        quic_chezhou@quicinc.com, cheng.jiang@oss.qualcomm.com,
        shuai.zhang@oss.qualcomm.com, jinwang.li@oss.qualcomm.com,
        xiuzhuo.shang@oss.qualcomm.com, mengshi.wu@oss.qualcomm.com
Subject: Re: [PATCH v2] arm64: dts: qcom: lemans-evk: Describe the PCIe M.2
 Key E connector
Message-ID: <tspehw7yb6hrgek7rz6qghcoqr4v6cdpulbzpggii6qlmaatxk@gcb2tbb3qji2>
References: <20260608091702.3797437-2-wei.deng@oss.qualcomm.com>
 <20260615103228.3104083-1-wei.deng@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260615103228.3104083-1-wei.deng@oss.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjE2MDAwMiBTYWx0ZWRfXwLjHBUqS8zKj
 62IXCRdyRxbjgOTA70AfmKpdXc5lvMDMat6VHvQ9kJ0yuuQ56kRjWgTYushee5PjRgrH9gyna7N
 DoKRmbsNgiNjtwMUYAIu3dozqHB7tyNLN1r6aNjUTGLm+da+KF7nrkKtHQ8yP6MH5H1g7By9vPm
 NdMp9jbTMW0Y2b+lfvYU9sFBO7THw/Gib/1hg7mspNIz83B+cVilVrVr//iU3zSHGoMcGHw+jFB
 zPbm1VvlJoZnPf8yGhOqyUYUM80Vz7vAgiOZ5uqVv8v/B4IUwWordguewIGJfVJ1oNCasn14KJr
 8tBtj1SlJy7qneSKqqNqMYGDpcsaT44nXTL8SgHAzSbU/4XzZYBmfN0nFu+jVpNGV/JAyYORuf+
 hQHrNgv2zBspeWPPFwwH4OxOqGT5/w/JwbWDFOBFZIZZEpJXN1WBeYbEYkJC79eACjzvnursYv7
 EXyC7pDWhZc3TzQM4pA==
X-Proofpoint-ORIG-GUID: Cv7Z89JlIijjL2xWPkLzOInUY1AR_nE7
X-Authority-Analysis: v=2.4 cv=HMvz0Itv c=1 sm=1 tr=0 ts=6a30989f cx=c_pps
 a=UgVkIMxJMSkC9lv97toC5g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=KKAkSRfTAAAA:8 a=8Rmc_stLs1TP-k28c-MA:9 a=CjuIK1q_8ugA:10
 a=1HOtulTD9v-eNWfpl4qZ:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjE2MDAwMiBTYWx0ZWRfXzyh5BNwuhHSm
 1Z8uXcJir2uXz7/wNUrwd1NVbPlOwVSC2g/uFPbar1yfiOSI2zTRyy+vtKDh9F4LeoOjcOBWoLR
 TgUxaVbkGvT/+3m4bnPHoNGBtIhccHc=
X-Proofpoint-GUID: Cv7Z89JlIijjL2xWPkLzOInUY1AR_nE7
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-16_01,2026-06-15_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 clxscore=1015 spamscore=0 malwarescore=0 suspectscore=0
 phishscore=0 bulkscore=0 adultscore=0 priorityscore=1501 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606040000 definitions=main-2606160002

On Mon, Jun 15, 2026 at 04:02:28PM +0530, Wei Deng wrote:
> The lemans EVK has the PCIe M.2 Mechanical Key E connector to connect
> wireless connectivity cards over PCIe and UART interfaces. Hence,
> describe the connector node and link it with the PCIe 0 Root Port and
> UART17 nodes through graph port/endpoint.
> 
> Also add 'compatible = "pciclass,0604"' to the pcieport0 node in
> lemans.dtsi to allow the PCI subsystem to associate the DT node with
> the PCI-to-PCI bridge device.
> 
> The M.2 Key E connector is powered by a 3.3V fixed regulator
> (vreg_wcn_3p3) which is sourced from the board's 12V DC input rail
> (vreg_dcin_12v). Both regulators are always-on and are required by the
> pcie-m2-e-connector binding.
> 
> Also add the serial1 = &uart17 alias, which is required for the
> Bluetooth serdev device to be enumerated on the UART17 interface.
> 
> Signed-off-by: Wei Deng <wei.deng@oss.qualcomm.com>
> Reviewed-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> ---
> Changes in v2:
> - Collected Reviewed-by tag and reorganized the patch

Please don't send the patches as replies to the previous iterations.
Each new revision should be in a separate thread.

> 
> Link: https://lore.kernel.org/linux-arm-msm/20260608091702.3797437-2-wei.deng@oss.qualcomm.com/ [v1]
> 
>  arch/arm64/boot/dts/qcom/lemans-evk.dts | 75 +++++++++++++++++++++++++
>  arch/arm64/boot/dts/qcom/lemans.dtsi    |  1 +
>  2 files changed, 76 insertions(+)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry
