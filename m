Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B78054F5DFD
	for <devicetree@vger.kernel.org>; Wed, 14 Oct 2026 11:17:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791976635; cv=none; b=Rb4Kv9pRQg40q4aoJrAG+/zEbNJngPRMZ/udrKucq13oyWYYAREMfnhJEzJNupSIo+3X1tNlPHmsmrJaS2ibGef+GIrJ+Hq76umxKyfIuSRs/EOOMfNYfKyEXtOxEe5pRRgJZ7e35aX6wfTurvsIuC90t+OyzlkWFnswTHFECj0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791976635; c=relaxed/simple;
	bh=2vrKF8mOD5KYteJonBX97eQDhJTkrsZRQJ+cGz7SJz8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=fiZmEc+J34yfTsRD9fHPc2ztgh37mieKWzg6NQGlwzcS6Hzu46uyQu3ICgw0FDGNyjfnPNWj6eunvnPnJCmWQNmIhFaPBuTW318wdss/0BKpuaPQJ+wrjlzhXnjPKWzSiD9ruidSvNBbdUsLKAzNV+n8r4ZqfrWFozFhJc9FuOk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=RvMdUCLl; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=AkUOjvtN; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="RvMdUCLl";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="AkUOjvtN"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69EAeq2W806704
	for <devicetree@vger.kernel.org>; Wed, 14 Oct 2026 11:17:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	nR/ijon+rHa9vEbSCj1pW479jS8KYiNuAqFs2gzfUdc=; b=RvMdUCLlldwO+tzO
	9bib1Vnywyje91Yi716mGMgy1YM+Xn9pduiK3OrKsXpSmXcs4s8fBEAmT84F4mRy
	8acPDtBpn2yovYksr1N7erSWy0gpefatXHSexbRNZsD/1azOSKHPIRmUdth/N59h
	Zfvr2fMZdjS/SXXlz032mh9XLmTLf0dy9U1iMdEGX0DG3lwzFPQN2Mi+AwbzNGSG
	Qae3SjQ9pmJ6Z3iT9MZR5SUMVqVB9fcKBuLP5YF/YfaQA4dU+aVUXCNfV4odejyz
	xEh3osAJv5MPW6C8ZxKA4j/yUz2GVqBGsGbQEcVHW3MSAOqF3fzIcKQJIMyswTeC
	g2XmgQ==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h9ud6b5en-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 14 Oct 2026 11:17:14 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-3aaee1fc104so5809283a91.1
        for <devicetree@vger.kernel.org>; Wed, 14 Oct 2026 04:17:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791976633; x=1792581433; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=nR/ijon+rHa9vEbSCj1pW479jS8KYiNuAqFs2gzfUdc=;
        b=AkUOjvtNqhMVauwqqdt7AUtLdTEkKozJUfHRZjXA7dlnSo6WaDYu7VfLq/YMG9TlOo
         ipVIPcfXOhpHgU+7JIHPn2lVDLDFTNxBiiaq3kP4MahDkgmS/VaiDsswmvPidEaGP4gu
         uLZsH687XNoSNcdzZnA3JqqmBcm5OpTNEroVbWJ2dPmT1P3oqBJ7Ltl9+AecHsfo5tjy
         jzkxxZHKQlQYhM7wnBcnIHelLee7rEgM0oOfjrY5BfFAPzaIe4Wr2gX3e+QeIL5YXQLp
         BtMKqdlhdDaPy1rLzH1R3iMy7GNyXEH2KlpyaxVXpP3Tw8Rw5HcfIrWM7AOzYkzKsTRh
         9VXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791976633; x=1792581433;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=nR/ijon+rHa9vEbSCj1pW479jS8KYiNuAqFs2gzfUdc=;
        b=WmIZsdnOPfly4PE1/k2O7hm6g5+4bg4Mn0HWUeUOdWOvcSrg/kHqGbxajzcOYF8Lpr
         TRuuREMeNffsYb0O2W6wbw/5sYITPyoIm6hATCV4WnPR5gCiE62ZN6Z25M9cotVLNoj/
         gNtDxkl41MvOLMk6PJb9YZEUZ/Ha9YykM3tQtHtV28UcyiIoZ+GQwDXETtGKmXvyw3qJ
         u2HE9mprWgvGbAf6PRv2/celFKZi2efopPLOygaWvXecwm6c1+zdh0YQJo73+R0hgngO
         n196vE3T2gzHQ8Taz6Mqnn4jPMvn3D+OB5f+bzrD6LNJfN4ANNGlFqRsenMUUagJI5gO
         ZtmQ==
X-Forwarded-Encrypted: i=1; AKwUvBx38zumYSms4+bit6QjFzABS59WWJQJwL0wRKd5APose5j92kjcyb4kQQ4pdizczyo2kYGQFaQLSGCG@vger.kernel.org
X-Gm-Message-State: AFq9FYI6EgI3CeBqVROBaubOoUVxjNdbLBemCgtwxWM75c2AZGiBJfAG
	0FlZQGnivQnKgTs/hSbXduZy4OMfyVB7E4QrvsR0VtKLWpV/6nz+0wWIhaNjhlkkdfhgfzRjQ21
	7Taw31rVsVC3J5b23ekBnlA2epDvkKZiL0SnzOjiZkfo5C50p8j+z2Q3+B7PZxwmv
X-Gm-Gg: AYBFou1Oq/Ca5UZbCAB4q7pvODVv2fHlsanvQRRkvIrEHpB4/aFcAcMwkfbSGG+wTGs
	IlXSe1Ewc5h1aZHhl8qg539c1AItUndAs66TMOOxlFf3/67Yek3MEgLu+2D1zqR1Yt/9pxEvxeR
	fQufs0WqvXP8USzMWH/mUXjhHUisj0fjKhlR3hkpiiXBI6UvZs3E85Dzytv9/Se6+/Xs7MJLOps
	plruhCKa5eJWWo/QUT9/A8krSizyfxiwoEY5O3bYUBoNOxtilWzSh5kWU6xqx8agFvfK48Fe75c
	+mCTfq7WqLXucLIvIIq0rBR1DkJy076BnSDYGkfhAXhMRMRQrUed8r6FDu2eVhaY8kDiOonzQhy
	zs+v2lZvty+U4zFLkLEtKVUmClwObL1wVpeNj
X-Received: by 2002:a17:90b:3b82:b0:3ab:4f1:4f76 with SMTP id 98e67ed59e1d1-3ab3a94f426mr14359468a91.24.1791976633165;
        Wed, 14 Oct 2026 04:17:13 -0700 (PDT)
X-Received: by 2002:a17:90b:3b82:b0:3ab:4f1:4f76 with SMTP id 98e67ed59e1d1-3ab3a94f426mr14359445a91.24.1791976632686;
        Wed, 14 Oct 2026 04:17:12 -0700 (PDT)
Received: from hu-arakshit-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ac6325e28dsm1962341a91.1.2026.10.14.04.17.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Oct 2026 04:17:11 -0700 (PDT)
Date: Wed, 14 Oct 2026 16:47:04 +0530
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
Message-ID: <as9ksJKk55wYuoOS@hu-arakshit-hyd.qualcomm.com>
References: <20260824-enable-ice-clock-scaling-v12-0-09271f583dc6@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260824-enable-ice-clock-scaling-v12-0-09271f583dc6@oss.qualcomm.com>
X-Proofpoint-ORIG-GUID: x1YOee394Pe0Fg8ufRuNDtCOqfxdygzv
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDE0MDA0NCBTYWx0ZWRfX9cc/IaaWd21s
 qHgWdw+Vn55mx+cRAMooQXnEwcXJsvvcvug2pikpfISmaDk4LY5iB4i2s4NQODLFFYvnkcMM/4D
 oNkTXITcElIS+GaEOy6Q0VWoMYIBVNA=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDE0MDA0NCBTYWx0ZWRfX69PNK9LPCTSt
 cap2RXq8HSc3TS/dUXDZxPFKuZDMmoreJSMNUfYzBVEj3lBJ+wjcKfkFetyyeKUA1LAcTKAbwoN
 8ur8ABsw2gnUtZ6KGry2Nz40fPtkyFAwRvu8qUKV8coc9z1Cf/EImpaQ3tvNeCyGQby3Ax2vAIj
 xJmDy4yYcoveB61nxGNW0ItFVFNa0XiYvZUtf1SgOAV6DJcx+PmAhpH5bOTjwtFkOj0FJsxFTRT
 nkC3JhiGJFRRl7hhlgS8wLP/on5FdZWqcX2uw6XMLHgCyb1FNWsd2HzVhXL/54qrKADp8GYMl4r
 Z471Rj0v2i2exkwObsmfbCvCYoknuORJIFGnL8DV6Z4JGqcG/+Bhwc24a8Mmye7+XraVAkcTXbh
 VX6TlP6b8NXTXr6vU77ZPPrhmCpMC4+oC7xD3MyRFJpDGUkuUASqYQ1NyG6yFbCm4xubviFYVTm
 WRZ1hRgs+xLihFRQQ9A==
X-Authority-Analysis: v=2.4 cv=fJ6sTpae c=1 sm=1 tr=0 ts=6acf64ba cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=yZ4vNV_xbO2V9HmvDQUA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=rl5im9kqc5Lf4LNbBjHf:22
X-Proofpoint-GUID: x1YOee394Pe0Fg8ufRuNDtCOqfxdygzv
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-13_01,2026-10-09_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 spamscore=0 lowpriorityscore=0 malwarescore=0
 suspectscore=0 adultscore=0 impostorscore=0 phishscore=0 bulkscore=0
 clxscore=1015 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610080000
 definitions=main-2610140044

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

Konrad, can you please review all the patches in this patcheseries and let me know
if anything is pending?

Abhinaba Rakshit
