Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4D83F3C343F
	for <devicetree@vger.kernel.org>; Tue, 14 Apr 2026 09:33:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776159218; cv=none; b=sI3TJ1LL859eaS4934L5WDFHaP3KzDMe52uyop5dp9h6UoNNIzSzQxQnV6A6FP7RygPso1PhMHiCy5I+fxFBtilxr0iqcGEIqtJ/y+Xq8XfdzSDyP+vbc++ZhEJp8r99YCGo+zHl3NqpEi3wz6Vxqdu7gdFwTYgO2nFZwWK3SUk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776159218; c=relaxed/simple;
	bh=0BPZxwyeCDxt/qQ3n1UlOe0NaqQe38QUBg+xfperdj4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=VUY30Q9k9RYO4XMANEtJjEsQ/sVj+PmVVmnVU+IUIk4yRw0OBeyq8sLWQDHuW+KoSOZscb0RdE+C0N6WhHb+raWGPk/6r5SCZ0yKz9VfD4D5qfykDI9huvmozMY5lk/2yBs4cpcSOh/O+TGkhlt709YQUUel/FSBiW0S3cZAISc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=YJKMVZ4A; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=PbRKnYhp; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="YJKMVZ4A";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="PbRKnYhp"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63E6Li81395284
	for <devicetree@vger.kernel.org>; Tue, 14 Apr 2026 09:33:36 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=mSbqfMc6xRfrir7P9sbbGiVO
	qRkXoiDCed3ZiNBf5fk=; b=YJKMVZ4Adyx6ojrbYHIw6Si593Z37yloSz8aGqg5
	DBEIwsJA+NOP0telQpGWfp1aVu4rf4qRteIHNVjnLk8laJVWRbv6DAQ+VAhJid0d
	dxWWxQg+o3VDoXlpUalH+ii5DSmddfXh2EDnCnex4X3ew5mS/MolJf2LnzOxvnx2
	KyF0LDdv51HTDtvrzjgfYapa3kijKH2fiDjsx0Hd7KMnwbQawoh+TKd67pgfypLT
	IqoYNFyav45qxmUeSEdKcWbNpWUbigULEGQHJ/Tlk3bl4oVKslueF1IE/667PURk
	JxkGxR3dpCIgZiVEfgukf3DlPZCR4zlZvltkD9VFuJcrhQ==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dh870t472-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 14 Apr 2026 09:33:36 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2b2e6ee9444so27505655ad.1
        for <devicetree@vger.kernel.org>; Tue, 14 Apr 2026 02:33:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1776159215; x=1776764015; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=mSbqfMc6xRfrir7P9sbbGiVOqRkXoiDCed3ZiNBf5fk=;
        b=PbRKnYhpS7rvlFXBM7pQi6F3Qr4FuUq19DejxuQy+VtpeATlagjHtxMuHsN5nD+JQE
         0uhANXjeIJqZ0rLapt5e9Q7JyPpb791KnubKTScZgwDyoDhg5l5grLTYbE/2OElRBX5y
         r0viU/lGu0IhzW7kvF3kqmamlSjw1WMhJR/7nQsxAVq14HNi3DlzvFOqxiOy5DoPzA+B
         zfHzRDp2ZNtTPxMDPciLQ17SlTe+z1rdAhMjf3iA97XaUg34mG84JdpuBkxFz0q8GUdY
         pBTGH/c0ZVfiMwT2u0HRxIgAsPNt4j61vJBZLLOiZo1JoroFjUd6RJIFqd6qjKJCFYTR
         zotw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776159215; x=1776764015;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=mSbqfMc6xRfrir7P9sbbGiVOqRkXoiDCed3ZiNBf5fk=;
        b=Mxx1Lxdv18zd78o+lzNNpN1FIIyQaeeDewzL1TillAyVIpoXlIV0VzpXIyHjhpOwth
         D2QWQMHTCnpG6aYYLKoXViN9LmKwgimeDPKlsb+G6I1FwY8wvuBQNOqbpmZRGCcumKoD
         d7XDlY+AHJkdZqf4y1wblmM7LSqRi4vbtpDsKPFKxfaaaN/Sv+Q+1tWe7UYmnayrwXGY
         RBTR5DJMMxCLtRq3pLazOQYzeujMck9lSAyKJiBCr9ajBdtwKgQVtjSApqqPDRChbSC5
         LiAAfxH2AI9fY3M0/yanH+jAqDIokKQDprXYo0Q8QmqhCyqPCKTrUkCBbmrdXEoYW/T4
         TkEQ==
X-Forwarded-Encrypted: i=1; AFNElJ8EMtYLJ29YrX2h1nPAruFFEZpPY7jWRFYWgoWkiQIwPbTJgVKcmAFP+WJS41SvvmcNQL9H24j4Foa4@vger.kernel.org
X-Gm-Message-State: AOJu0YxlwwTtAcHUybJ3XaxqWqRU+kt39UGS2DYLnBaM2dqlEncLIAFW
	lzCkkUhIxkDVts4RFuaoIvxbkWc/IxZZATqXL02Mv24OIUV5YUR8ohgsIukdtiB3O1Qg0WDHJwr
	XvvJGgjiJAYmHUULekOxA5m9rRZfYLqH2FgIDCTkc/W4y1vlArti8WmaBnUo9jtrz
X-Gm-Gg: AeBDietmrnjpAwMciW5wRQSi5y3gDXln+Fs5bngMh0K/DIgsrcjGTrkoX+jU5xr0kk5
	tbmKEorY/jUiX1Bao8/EjWvXYcN10//n8COzWlKDEDO1aOlOXuJjeaeSdGM2ePuPHFjcaWw/v3s
	7lUzXwt3aztFM9AyQgIdAsoXIV2FC5hB88CGakkmDW1tpSi77f9U9pzwt5VnNn/s41/adEfXg5v
	1bkgtyDk1cPu4lv6C/8Gyr9dt0VcX3M2hjsuBYLcMA3U35/MkDJRWh2mEX0HyQOOA4oSbl0EJZ5
	wimZC9gbbpf1GutHLbNnyt4makaIglztAhJ7jUii9zHezWVIINFsi5wp7Jrb+ZL879ryMY2S87t
	21Xg/Bt+9y7QjedCy0+4xyhYQoujn6vcR9+y/D6BmFAqT3x5S
X-Received: by 2002:a17:903:3c6e:b0:2b0:6068:4c5f with SMTP id d9443c01a7336-2b2c7260fb9mr194441115ad.8.1776159215260;
        Tue, 14 Apr 2026 02:33:35 -0700 (PDT)
X-Received: by 2002:a17:903:3c6e:b0:2b0:6068:4c5f with SMTP id d9443c01a7336-2b2c7260fb9mr194440675ad.8.1776159214669;
        Tue, 14 Apr 2026 02:33:34 -0700 (PDT)
Received: from hu-mojha-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2b45e949464sm76959135ad.24.2026.04.14.02.33.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Apr 2026 02:33:34 -0700 (PDT)
Date: Tue, 14 Apr 2026 15:03:25 +0530
From: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
To: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
Cc: Bryan O'Donoghue <bod@kernel.org>,
        Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Joerg Roedel <joro@8bytes.org>,
        Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Stefan Schmidt <stefan.schmidt@linaro.org>,
        Hans Verkuil <hverkuil@kernel.org>, linux-media@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, iommu@lists.linux.dev
Subject: Re: [PATCH 05/11] media: iris: Enable Secure PAS support with IOMMU
 managed by Linux
Message-ID: <20260414093325.clafqgd367jrqpvq@hu-mojha-hyd.qualcomm.com>
References: <20260414-glymur-v1-0-7d3d1cf57b16@oss.qualcomm.com>
 <20260414-glymur-v1-5-7d3d1cf57b16@oss.qualcomm.com>
 <20260414063128.6ass64wfi7nmtzti@hu-mojha-hyd.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260414063128.6ass64wfi7nmtzti@hu-mojha-hyd.qualcomm.com>
X-Proofpoint-ORIG-GUID: FJrJsfXMv09kQjaF2v1_7114ROreVTey
X-Proofpoint-GUID: FJrJsfXMv09kQjaF2v1_7114ROreVTey
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDE0MDA4OCBTYWx0ZWRfX9XFQEXwuBRg2
 WrTGxBF330BtobdrvmkinZcMgAkW/E3sn3ciVukboCukSdGBCADioPCSO3IVqGvD+Zy3Ecawygl
 BStOuhNupoado5ePk5BTbNF8w94Q2qSw/BaDZzn5t13NaFlVNY4gLvkN4MyzlflrbhZmJWHcJJ9
 pwcFeL3VJHqlHc61U2rlb8BWkrDxggVoR9PAKkO9OfBug0zvo9GrqbMlQjouAIuPD7xslV8Mm5Q
 6w1cFoJ8cmfDlkDxcOTmij/SFQfOTI3TG0QzG+7m2cWtSRWBPCaZeOWKmR5IoczzzSO4UPCbWHq
 7+0hdcqRcdnXDBY0zafFvYi1VkUyTyZcgHoEN3lePuYtwYC6wnCHBVg3WIkZvhTLg1zwMPR//Y9
 TTKv+YOuk0ACY/f8sKxSZBDEBJAoFri01+2Aew+yB+1VRZQIbJAo8tWbl7ZWv/ix0yEFqdi8Myp
 2EQ7CwW9Iuq/ZeqWG6Q==
X-Authority-Analysis: v=2.4 cv=MK9QXsZl c=1 sm=1 tr=0 ts=69de09f0 cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=kj9zAlcOel0A:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=EUspDBNiAAAA:8 a=TLljPvHKC21aDJODJdYA:9 a=CjuIK1q_8ugA:10
 a=1OuFwYUASf3TG4hYMiVC:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-14_02,2026-04-13_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 lowpriorityscore=0 priorityscore=1501 adultscore=0
 clxscore=1015 suspectscore=0 spamscore=0 bulkscore=0 malwarescore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2604070000
 definitions=main-2604140088

On Tue, Apr 14, 2026 at 12:01:28PM +0530, Mukesh Ojha wrote:
> On Tue, Apr 14, 2026 at 10:30:01AM +0530, Vishnu Reddy wrote:
> > From: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
> > 
> > Most Qualcomm platforms feature a proprietary hypervisor (such as Gunyah
> > or QHEE), which typically handles IOMMU configuration. This includes
> > mapping memory regions and device memory resources for remote processors
> > by intercepting qcom_scm_pas_auth_and_reset() calls. These mappings are
> > later removed during teardown. Additionally, SHM bridge setup is required
> > to enable memory protection for both remoteproc metadata and its memory
> > regions.
> > 
> > When the hypervisor is absent, the operating system must perform these
> > configurations instead.
> > 
> > Support for handling IOMMU and SHM setup in the absence of a hypervisor
> > is now in place. Extend the Iris driver to enable this functionality on
> > platforms where IOMMU is managed by Linux (i.e., non-Gunyah, non-QHEE).
> > 
> > Additionally, the Iris driver must map the firmware and its required
> > resources to the firmware SID, which is now specified via iommu-map in
> > the device tree.
> > 
> > Co-developed-by: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
> > Signed-off-by: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
> > Signed-off-by: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
> > Signed-off-by: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
This works as long as IRIS does not have optional resources. Once it
starts needing mandatory resources like some peripheral access mapped
before IRIS is brought out of reset, it will need a resource table SCM
call, which we currently added for remote processors like ADSP and CDSP.

Let me know if you have plans to add that. I have a few sets of changes
in the remoteproc resource table and an API which we added in the
initial series that I could bring in.

-Mukesh
