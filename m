Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795595083;
	b=ssHFon3NwB+RXke7zkH9cP2wM2QpXlwADw5HkmOnmfdFSFy+1GBWpRib6csMUjDqaejU
	 fQc+42IgHYk7QRkRUX3UVmwCuMXZAwCq9ytlQ7+I1P4cXLnBhfcLgnC4ky6f574PJZta1
	 cBmohOGdelDCpdM/ETHk7nIK72BRA4A7VvQDTAm4x0DnZolYbvFii5cHQhomi1LjitRat
	 rjwYzu/fCZVW6mbraILOpLAjCo+CyriMkRFFkNjV+PtBMGZwPu19se9pCAa8N8vqnCCdy
	 SyrA2qfk/w0ixLbvnWiV38K/rYymUSOjSHb9UmprcHQ/ut7HFEs82AEuQM9vADp0LeA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795595083;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Date:From:
	 To:Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To:X-Proofpoint-Spam-Details-Enc:
	 X-Authority-Analysis:X-Proofpoint-ORIG-GUID:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=BdM9Q/xl5hWaDb0Py4CsOxN1/hp7PbnoEf6nigrne8Q=;
	b=V7BxjV0YuEK6Qmcsy+IS++YcT/GLBNmIKEhadhYCjBxcG/dtG7BHI5CUdbx/iDD6Zmev
	 FcLQrhqobKFsQBUchcIzFcAfno+ng+EJTuRhPlPuDaP94yVDCwR9Dyt9wNBqX2T83zrPu
	 HY8uDnE3taWxUNe/QaUgVOYkw55z4y02wu3X5R017mEgj5XLgJm2yvIiSKTJI63TKzLbZ
	 jcoy3kZ1rctTRfoOfO9ioC+X/94d4xiL6Y2N5hfa4Bzg8JGsHJ5QDdw/5sT14Csvczv/P
	 x6+6CJfa2mCS/Amy0HQ3Cx7xlOGYBJ1cMuyNjjrjHPbSdDRI6gEnfzFkQUViZGfVeNA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=O2h9MJoW;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=iCGSPVEd;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0D9FE606A32C
	for <devicetree@vger.kernel.org>; Wed, 25 Nov 2026 08:24:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0D9FE606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=O2h9MJoW;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=iCGSPVEd
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AP7Hck13782559
	for <devicetree@vger.kernel.org>; Wed, 25 Nov 2026 08:24:42 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=BdM9Q/xl5hWaDb0Py4CsOxN1
	/hp7PbnoEf6nigrne8Q=; b=O2h9MJoWV/AfAtR5tRhLdiOCEPlZIjiYRe7I4wFZ
	nq9SUokANCf223aBkVUE3agc0E88bGY1LEAtBMpFPh8GWQkWyuvI9UP3p7bDrzfL
	X55ukqheYvA3VMcRGr41rL/17jFLe40l4Lp2dH2r3Olc6aXp9fT6EtFKOnnGBEI0
	tvgn37zO8/0lG79RX1c1qvTJ5ninhyiNGwIWy/4xUZXBOujXn5CteKLRFngfRWVu
	FYpP85RYCAbHxXfHN7CAW/rLDcu6kiqCRozmU0pi75yAYB+fWcz26PUHpla//phZ
	uE5vnGA5KEKmc2Mury7FKdGlJHwPfQSAWRXB1wXCEjK+kg==
Received: from mail-dy1-f198.google.com (mail-dy1-f198.google.com [74.125.82.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j5b804bs9-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 25 Nov 2026 08:24:41 +0000 (GMT)
Received: by mail-dy1-f198.google.com with SMTP id 5a478bee46e88-382af5cfc58so273345eec.0
        for <devicetree@vger.kernel.org>; Wed, 25 Nov 2026 00:24:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795595081; x=1796199881; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=BdM9Q/xl5hWaDb0Py4CsOxN1/hp7PbnoEf6nigrne8Q=;
        b=iCGSPVEdUzQgFEinM+9YpBoWPAecyxV5EmdXArzqiwZfQgvF1BRD1B9IQy71e1+QJl
         YT+xjLDmpoj5aB15NRY2KYoEK6aNc690JcKbaTQ8MiGDlb2CaOEROzSIYlW/9UFLJWQi
         Z0d+Dru0YoaR5clZ1QgCJFwkbV+OernHAZraMhK9s773cVulKiZw7ZIGlFE1Jq/p9mIo
         EraLUHo+/oD6TkrTlA1P8f7gXHO1fWmLzkzkvTlZ+7guRv/Ko6vvR3sJkU+aNfTvtArv
         cI4O3qjIdqpnbYnEf784SmB8swWtLZDcyjdTOQnadcadvw46XozbLsNDVEpRY6f0pcdO
         Bm2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795595081; x=1796199881;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=BdM9Q/xl5hWaDb0Py4CsOxN1/hp7PbnoEf6nigrne8Q=;
        b=QPCp1Ivu9EltNBurSnUni2M83cg1PQlOtHxDbPMLlE0yj/qg7IUp7PXTFIRZuAMoo6
         ld2H9aMHlZMhsr01OuQYotIa3FdoDdTrbVrcBI0xh6SVGgO2tbCcn2yZZ5yWOlUqVXYs
         YaIC87BSIvlvttpzjXLsYVnos3WwA3/xtJ+tJltEjmAPAGBJYie3MLudsuERXFsKQsxD
         6mQBRTZLfeKiJ71fm+ZTx2m2iMOH/JKgTIcpynCY3qjDmzNEGJbzWzkwH5MvJI5eYbzX
         ncmRDguMCHEJaIsUbDH1HNvOY3ZPf/xnyW46aggTiARMUyxIkscGXpbdorzowRRMlT9o
         6VdQ==
X-Forwarded-Encrypted: i=1; AL+hErEdkatfO1sXmXxguqvcQXzcDOyaYT4mADTERTdBpIZ1OdsBdMOs83XU0QRFLNNT76zGL6vw9ylErAli@vger.kernel.org
X-Gm-Message-State: APuU4Z9bagcG/2p0MVvm1ML3q616HHgPMxdpT/lgXVqEDt1vzx1E06Jq
	e/zZ4n0xBWJxeb+HVYBCUspdIruj/Syai1e+IvlLAqAytXNvShCU/MUzkxGirri8/hf1EhRyDZs
	eTnIYZDrj5Pm7TI9YEDf4w+Wln4pEhPoLr50ApU41dYVRdQnFcmErhlt64v6vGLbR
X-Gm-Gg: AZFdTZe5p/qZ4Wecw2C9nwr0qoNsNDizjPlb2wI407DnCPIFq3jJ7hMw+lTnrw6/oAZ
	5/kXyZBpPAJTFStRphwMMjOJ+EYkU4Qk1XR3IP99e8dERsLkmdweMX2H/iwE+FZinHziP89uwG4
	gVxDn9anKfZY5vswsNw+qMyoAPJPkFzz+fBS+x5tuAPpyjxQ3zsHiqUwhAISzJ8G+Y/ggXmlBo7
	H1OQQmi0HjVUHgBUT0coxgOQd+Fo03rgfUeg1vq+w/sgSSTErVwUF5DfECuYJ7q1mtsGmNhJNxv
	Faga6R5SpT/o//dnggX/U4za58Y6VLbCDQ+Zb+viq5OpF01c6otaYD49Vd2AalcjDw9ZBEjQ5bl
	hObSnhwnPtYw/7DuZ3AuUUBDoOBE0/PBl7p4GD0w1y7bF54WOnX/XunlVbT+2xW8ovNPuG7KrRa
	8v
X-Received: by 2002:a05:7300:1899:b0:386:b6e2:9fa1 with SMTP id 5a478bee46e88-386b6e2a02fmr11029641eec.34.1795595080873;
        Wed, 25 Nov 2026 00:24:40 -0800 (PST)
X-Received: by 2002:a05:7300:1899:b0:386:b6e2:9fa1 with SMTP id 5a478bee46e88-386b6e2a02fmr11029616eec.34.1795595080217;
        Wed, 25 Nov 2026 00:24:40 -0800 (PST)
Received: from hu-mojha-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-385672ce402sm48573083eec.16.2026.11.25.00.24.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Nov 2026 00:24:39 -0800 (PST)
Date: Wed, 25 Nov 2026 13:54:30 +0530
From: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
To: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
Cc: Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Stanimir Varbanov <stanimir.k.varbanov@gmail.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Krzysztof Kozlowski <krzk@kernel.org>,
        linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Subject: Re: [PATCH v12 2/9] media: iris: Enable Secure PAS support with
 IOMMU managed by Linux
Message-ID: <20261125082430.ekstreufyimdwhzt@hu-mojha-hyd.qualcomm.com>
References: <20261125-glymur-v12-0-5c34dfd73fc2@oss.qualcomm.com>
 <20261125-glymur-v12-2-5c34dfd73fc2@oss.qualcomm.com>
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261125-glymur-v12-2-5c34dfd73fc2@oss.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI1MDAzMyBTYWx0ZWRfXw/e2tPBR91u2
 UJLXXMrC5gkl+iZnHfAobINmiJig+V25P771EfZJ7Zqw+Az/BYCt8pTdxCu6uQBeVr+vc08HKHc
 qePLrvitq0sqGDDqe9ks8ExdAuddSfVdfncWF6X/pD6+aceySnKuclHdi5K5fCy98fI046zXZT3
 e+fV7OqIoL1Q7/ZiO7QQfA1Vfv1m3HxX2vPydcHDHW5MM7q16vOxw3xvqwyR1O/32qKdsqrRKrj
 bPN6qav2aGPAG1yZQcNk/iuRmcac+HGae/S9BkytX/Yreo24jcr/OW0E97j6sjLl8K7tpZMuSj1
 DAJjWWjWMIV7UwQCTqr4/FWI//xFpa4ABpiRJT32p0ZQ3unchu5sZMJUARcoMACmdOM/Y4ot/u5
 bCWuMgVhpmW5AxcSpqUwwdS8Z32RaAroNNzsazL9dY2kx6Jjwf0EBySa6SwzqN9zpZfoAHckzan
 ASgrl/4CcKoRj3+a6gw==
X-Authority-Analysis: v=2.4 cv=K5W3jCWI c=1 sm=1 tr=0 ts=6b069b4a cx=c_pps
 a=wEP8DlPgTf/vqF+yE6f9lg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=kj9zAlcOel0A:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=hsWotPrWWJX8LXFSPeoA:9 a=CjuIK1q_8ugA:10
 a=bBxd6f-gb0O0v-kibOvt:22
X-Proofpoint-ORIG-GUID: nLA_Gkb4BpNlFH82K6dAaxTaDpl4weOT
X-Proofpoint-GUID: nLA_Gkb4BpNlFH82K6dAaxTaDpl4weOT
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI1MDAzMyBTYWx0ZWRfX9xvxOx9O+dA2
 Dv2dbbYbxJGgraGsG6FK3W5nY5AY0VX3LerirfBqBI6EpRRIGMEMTL3HAdmi2rUAxxRvU7uXT9/
 0hiUuh/vv5X17oXFJbBWTFIlmWJQpMU=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-25_02,2026-11-23_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 impostorscore=0 lowpriorityscore=0 malwarescore=0 clxscore=1015
 priorityscore=1501 spamscore=0 suspectscore=0 phishscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611250033

On Wed, Nov 25, 2026 at 08:54:09AM +0530, Vishnu Reddy wrote:
> From: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
> 
> On platforms where a hypervisor is present, all Secure Monitor Calls
> (SMC) are intercepted. For qcom_scm_pas_auth_and_reset(), the hypervisor
> registers a Shared Memory (SHM) bridge over the Peripheral Image Loader
> (PIL) memory region so that TrustZone (TZ) can access it, forwards the
> authentication SMC to TZ, and upon return maps the PIL region and
> triggers the co-processor bring-up sequence:
> HLOS -> Hypervisor(SHM setup) -> TZ(auth) -> Hypervisor(map+reset) -> IRIS
> 
> On platforms without a hypervisor, Linux drives these steps directly.
> The SHM bridge infrastructure required for this is already upstream [1].
> To isolate firmware memory in its own Input-Output Memory Management
> Unit (IOMMU) context, a dedicated stream ID (SID) is required. This SID
> is specified via the iommus property of a video-firmware child node in
> the device tree. A firmware device is created from this node and mapped
> to the SID.
> The presence of the video-firmware child node is used to detect whether
> a hypervisor is absent: when the node is present, Linux manages the
> IOMMU directly; when it is absent, a hypervisor is assumed to be present
> and these steps are skipped.
> Extend the Iris driver to support Secure Peripheral Authentication
> Service (PAS) on platforms where Linux manages the IOMMU, by creating
> the firmware context device and performing the necessary IOMMU mapping
> when the firmware device SID is present.
> [1] https://lore.kernel.org/lkml/20260105-kvmrprocv10-v10-0-022e96815380
> @oss.qualcomm.com/
> 
> Reviewed-by: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
> Co-developed-by: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
> Signed-off-by: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
> Signed-off-by: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
> Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> Link: https://lore.kernel.org/lkml/20260105-kvmrprocv10-v10-0-022e96815380@oss.qualcomm.com/
> Signed-off-by: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>


Looks like it is almost two month after which you posted this series,

So, I posted a series to move every mdt loader user to move to new pas load API.

Please review this as well.

https://lore.kernel.org/all/20261116162148.2864501-5-mukesh.ojha@oss.qualcomm.com/


-- 
-Mukesh Ojha
