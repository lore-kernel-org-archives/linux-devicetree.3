Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BC4F73191D3
	for <devicetree@vger.kernel.org>; Thu, 10 Sep 2026 06:47:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789022855; cv=none; b=oOmqDFIZsOaTlz4X24gCNibPaYQqKS0HpfHG9QcJpfuGFdVg6NnHZHmKliELiVrdSeVHu0L+mD+lnWQla1LNAGJtJjxe/DLyhSNYpNgn/GDEOXKNT3CSgudZyHcw0SUvF/r8lR/WQLsIzvAZcgeI7ZIb7VOaBC9HoLVUVy4vtDk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789022855; c=relaxed/simple;
	bh=DxoTJMN/+LqAjPVtnWiKH/bCmxKlerXb11PgAdqBhaI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=VJHq2Wy01VPnLgA1Op2Mtv8CkmsPmaVrvxWxgqRq4+vpr8lwJK3rmRsRJgN6zAulGGoQwpr5a8xUBaptm+mz0H4qLyarjunv74wt6mKvbq9Q64cGzDxTF/Ec972lvb5DZJDcZ71PqfAknFAP4WCiW4yoFD7pl5H3X43DsTQbfJE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ETH+St8D; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Sd7FK2uR; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ETH+St8D";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Sd7FK2uR"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68A5Gslc810342
	for <devicetree@vger.kernel.org>; Thu, 10 Sep 2026 06:47:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=YFPGqIoHsHzOQ/AB7GpsF1lM
	lefggCSvMh3OTOdNvHE=; b=ETH+St8DBeVm5VrpEeOhD9UdiWWjSt3eN1NMZpCE
	yNowZjNgaDUR9XltGCKhPsLZhsNYSU7HYlE+Z1dRVTBp/90tBYeXGr6ZPBkZKD94
	V+QVJD3QTWoPxhdrDsSSPbf9SDdyw8QoCYZBdMM6swuVcKLJziYkzO9eW6lWJ8Gm
	hhaArxqZGQyi8MzbdC/02+oZ3q3wJ3nMoDXfcpsE0jyGPK3qj/GKUCei/tiRPQ2w
	GwX6qhSSmNM4t8f3zE1tQRKhcISaUO12rTh7UPBUQyWMzIMJVkGyHotBFqAw/KHn
	EYstR7gSaxEgQ7fqKN7GoxOQhcgscBZpSmsbQSQkrrp2jg==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gkcydjfrv-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Thu, 10 Sep 2026 06:47:32 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-385d2703b64so824345a91.1
        for <devicetree@vger.kernel.org>; Wed, 09 Sep 2026 23:47:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789022852; x=1789627652; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=YFPGqIoHsHzOQ/AB7GpsF1lMlefggCSvMh3OTOdNvHE=;
        b=Sd7FK2uRA5lOnndneZA+n5H0eWXn5zLS9QxQmhtkLSGEaB57m/SRgBge5vsOJab6a5
         sIOkzdEM2vQSL+0wf2vv+306DTa5+wvf1MklNzunwKpqtysL57zpUvHgwrl56kucp7kZ
         /EyeqtyAV/XfvlDG5MLp1WIbUDT+NffDdkg0CWu3WEBnJLQFg7zNNlZJV5aKxgabvDQS
         7qasiR7rLDVlkFQB18voYUe+usemG1KL4MdOzdH98yWMoRWefeRBYNnbG6hgM+FRLdpM
         3oQFohgiGjOfreBAoRbil4F1sJK7BnpyiKY9/Q2cEZ7D7o3vUKT4EsTBrvOhD3qBZmSF
         ZOJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789022852; x=1789627652;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=YFPGqIoHsHzOQ/AB7GpsF1lMlefggCSvMh3OTOdNvHE=;
        b=M2Sbu5sg8nsmXCbScqjg2HuK4YuQkg4tnHMW5RlMIucWYi6uKv6fXO5EFD8tgJowJQ
         qRVzFCvcnxhzVFbHczvKt4rIBReIKkjfQmmLABUka14FF/e7QbWwraXMJ/3386+KiDQ8
         sbumHeMexGjQ8f4XrU/X3r2LJU7dLY8qLMc+b1kDfzytwuDxyZnD8fpab3M8EXwOaiuQ
         /o53QktKDEn2Xdm6zBASd+x226DvVbMLyLbYJ+cv4E+RFH8YQF0yMWM3ov0b3fZBkcIh
         Pxj4BVV5b8sT993Gkx3r5eokfga4sFzuvntmuMMzhkQPbkOGFfl4yGsSOF0Y9QzexF7e
         DoMw==
X-Forwarded-Encrypted: i=1; AKwUvBy3Z21XuAJyPSG1ss6raT1D2+wdn7MCIk03bB/Zc+6AoI3ffZlulnRAnTfi6nNEHuK5jAvhJ9KUp69B@vger.kernel.org
X-Gm-Message-State: AFuF++m97KARObiZqbDaZXos3i9d7FeYr3poIIcMKZA1L4C4k47vNfSN
	DRPORfmxz9Zhw3yd5RAEdELVoJtdJeb0NojA3SL3BB5bL/RT82XuRf4TzL/+9aCThq8D8bZ5Aa1
	BFMD34ftrBMdfdrD4A9URb+5aS4xbtcHb/SQK+nOa8RayHcjXWSIxR5QdLly/ss82
X-Gm-Gg: AYBFou0apckHx2Tq7MiWhEBp+w6Lvtd5Gjnshn9P7vDgHhvdIUMLT4T/+urosp2v7Ld
	hImvOhM29IbO4iqoM+Lzqo9DOqu++M1kVFtjMBdKkFW+mkbDSNIEYD515aMKdmLgjNLhCCZJ8Yy
	5paWBbOE2ArhPyLcBIDvjIEOpnf6MU+3A1FPGt3TgBs+ZbjmnhM/vGUgpyuHuQRVKSwZ/Xs00By
	XIBWeoRxpWbzQMGFW8q9llyrFGI20CAreYcb5E6DBnaZUKw+rr33bdaQU2MYeDvoN5NHPWLt2rp
	6K4t0VpZ/3Fo3EFPDGguKsxV0mx2tX3e8SERI5Xls74+F2Wk7GoAyGuMd8lUiz00DRebZZfTre2
	b0ceBql6ysKl3e7BLDelE+3b0/JiGXEOViK/0Ck5/ebI=
X-Received: by 2002:a17:90b:4fc5:b0:398:ceed:b903 with SMTP id 98e67ed59e1d1-39d77962e6fmr4114541a91.11.1789022852307;
        Wed, 09 Sep 2026 23:47:32 -0700 (PDT)
X-Received: by 2002:a17:90b:4fc5:b0:398:ceed:b903 with SMTP id 98e67ed59e1d1-39d77962e6fmr4114497a91.11.1789022851799;
        Wed, 09 Sep 2026 23:47:31 -0700 (PDT)
Received: from QCOM-aGQu4IUr3Y (i-global052.qualcomm.com. [199.106.103.52])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3339aa37dbdsm42950318eec.11.2026.09.09.23.47.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Sep 2026 23:47:31 -0700 (PDT)
Date: Thu, 10 Sep 2026 14:47:24 +0800
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
Subject: Re: [PATCH v3 3/5] PCI: qcom: Add CGC disable workaround for Nord
 PCIe
Message-ID: <aqJSfG1Mj314rbEU@QCOM-aGQu4IUr3Y>
References: <20260909-nord-v3-0-b0a82721c547@oss.qualcomm.com>
 <20260909-nord-v3-3-b0a82721c547@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260909-nord-v3-3-b0a82721c547@oss.qualcomm.com>
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTEwMDA3MSBTYWx0ZWRfX0nYUzWc0aEZv
 ThOaXVRRoeATRqU8V3dA0hnTYmus2Tr0J5VrRKH8ufgTh2pQCjGl05UBS/O/UJ9hJFIpL+HJoM6
 FejedZZEbb3El7yTcDVv6fGaFVchQPs=
X-Authority-Analysis: v=2.4 cv=UJNIjyfy c=1 sm=1 tr=0 ts=6aa25284 cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=b9+bayejhc3NMeqCNyeLQQ==:17
 a=kj9zAlcOel0A:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=EUspDBNiAAAA:8 a=Y4sVft1UDeOkrP7wHAgA:9 a=CjuIK1q_8ugA:10 a=zZCYzV9kfG8A:10
 a=mQ_c8vxmzFEMiUWkPHU9:22
X-Proofpoint-GUID: vh2VKP0e9-jZlqyal0MuJF_dSbYkKV8M
X-Proofpoint-ORIG-GUID: vh2VKP0e9-jZlqyal0MuJF_dSbYkKV8M
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTEwMDA3MSBTYWx0ZWRfX+u5km4I4zWa7
 V3Cslz/7gdiMO+nszIEHb1FooNFj4aqK9z6wUuKigK7vnJIvd8BhapT5LthD6B9s3fLyth1xl0T
 QYc1MTU5AlEUJpSU1UNm5iv2vvd0yq7SXY5+aHMfRkC5nfOMO+aqqTd/0moZg0vqd1pm0j7nNlT
 5LaA9+cnt2xlnsQa0j+/X1I3tIuJbLMymYsMbw5f2hxmBpOCCDcTuU+JYH3EB3lWfscJej05MWT
 8Cwf/IoltBqypuolbsVQ1G9YYN44gTs+s63TIP8tALvpNBPY119G1+nng+hoeHUiNTId88cH2el
 TquJBNTm6fQ92hIyI+J6bz7XJcLYRMomD0fmMlz7Qsm49mal5HiM3GnEJXjoHMm9iFw7Qdig3y0
 GgKcwQrQdMl93ZQOPZANtCL1u8R097sGT9zf2VomY/lpkr99XGAel/CnUO17h5gnegy3TNDTMo8
 k4yDB0LTPnr+NIQZP4A==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-10_02,2026-09-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 bulkscore=0 impostorscore=0 clxscore=1015 lowpriorityscore=0
 spamscore=0 priorityscore=1501 malwarescore=0 adultscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609100071

On Wed, Sep 09, 2026 at 05:18:18PM +0530, Krishna Chaitanya Chundru wrote:
> Nord requires a workaround to address a timing convergence issue in the
> PCIe power domain. To avoid the issue, set the CORE_CLK_CGC_DIS and
> AUX_PWR_DET bits in PARF_SYS_CTRL after controller initialization.
> 
> The SLV_ACLK_CGC_DIS bit is already configured by hardware reset. This
> change adds the remaining required settings as documented in
> QCTDD11972446.
> 
> Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> Signed-off-by: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>

Reviewed-by: Shawn Guo <shengchao.guo@oss.qualcomm.com>
