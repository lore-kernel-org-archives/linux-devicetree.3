Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B5BB41C8603
	for <devicetree@vger.kernel.org>; Mon, 27 Apr 2026 01:08:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777252099; cv=none; b=m8LxekbnQ4s8Yj3r9INA+zw7TUx59kBEHiiJjdFwHV4vOUqh/WIiaqbfXeXesoKpsgg9L9ExILhwZKOuaPh0DcO05Is7VARpRA0TwUHLue9a7Wx0+X84+C0CB2pwQOtX30/Zo+xDFhgNwpwb4G4PdRcca3ocfixwnYZcDdj7dwo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777252099; c=relaxed/simple;
	bh=qgqzSUw1r5Wu+T0TkmA4VehsKlakxSppwbUBv2E5OKs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=dkOmVO6FHMMzYssNJ3J8WS07uSb3jgCy9Q2pyUxfTKAKZYZ5c9B4LXAEZ/sn5Z2yct9rx+ZahFJGIySz6EsabPFXe/phtATc4fqm3+HE0ozg9MhsaSlbAbqX7+Vi56Jv2tQvK0iAXvz0KSRdkTFOFKMt7ERPvzEUxoQkO9PzdIk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=hL3un0MB; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ONLOPSGh; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="hL3un0MB";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ONLOPSGh"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63Q2sEDs051745
	for <devicetree@vger.kernel.org>; Mon, 27 Apr 2026 01:08:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=RxYXb+FnIAYwYa1Hr5YmJF7S
	m4XRXquQMMMxDS07Ah8=; b=hL3un0MBJ3KZfbd1r5Az3NlTEUjaUkUvpWn/bnFU
	GN0/7moGEud7EpR6ItyQsrrpJb6pKECvnZxLvAsvc9XgNQWYysfxWnppsnPMbWH4
	IWeki5/FEE3Qix2YyZyAu2ds2jNwIVAgxPXM/0Rgez973CxMz/uqTTOwDccgFcls
	Id0NBEEo/wWrXnw79Xo6fc9tbNyRLP+qqw8P8vvKhfdTTAobqpKWE41r8FEHZzSw
	LnsFPj++c3Qi48WytTWqC9lz0KmU9Kmf1N2bvTyrggnd2wcgZU4tXF/gxbX3Obbr
	HNec8Bvr42jLSpjJuSe/jU2CAgosRZXDNI5yGgmbLgg3tA==
Received: from mail-dy1-f199.google.com (mail-dy1-f199.google.com [74.125.82.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4drpsgur06-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 27 Apr 2026 01:08:17 +0000 (GMT)
Received: by mail-dy1-f199.google.com with SMTP id 5a478bee46e88-2c0f6593ef5so12462005eec.1
        for <devicetree@vger.kernel.org>; Sun, 26 Apr 2026 18:08:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1777252096; x=1777856896; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=RxYXb+FnIAYwYa1Hr5YmJF7Sm4XRXquQMMMxDS07Ah8=;
        b=ONLOPSGh80vMN07zFhHVYVHjC4L4V5Y5AvEWQXxDcE4gar0YVS/qqmCWT9ZbeJA1fj
         7UKOKByYARVCmLdlEJMykvsGEuAHYyNGCOVgJ0Ew2ZXc/GrOYG7bFPr4o2lq5SjnU3jg
         xsurNGYA3IK6oIDz4B/8N3D3pqIbcxuzE3t62mAR3Qstc1t6mnWB7CFLJDGkzjpBA3S+
         mCj4sKJI/xtJ2MBxx750YFWnK06YMhgyvP5RknjJa3tBv+4F5LJpaSlUa7KmCIOzic73
         R2tFiN7kLEnWdpEKxfuvGpAoWX7D3x+nmxATE9qPLwPNAvn6s/+k0TNmoPFaVsn27tFI
         +I4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777252096; x=1777856896;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=RxYXb+FnIAYwYa1Hr5YmJF7Sm4XRXquQMMMxDS07Ah8=;
        b=BcRpfFyeOtEKjHHMVoa7p6BPKggtkpAwlMoDz/Nf3DtedML7HGZ6O7dDRtbCLUYD8w
         m1QThRiNU4WzoCmnBC32S8yttEAnf5/3R9jV2IxoZgBJ6B2k0d6KD+j8wuSFJiauQgPF
         fo+jqZpwEsYVNjUdzXg+XX3yakD75iLmRtDOR8/tYgFhE1THG2jdLu+MdHBopPQKBset
         MoZDkIr6GFClVVCrfidBRr7EIC4JvUlqhIp+b+zgSN9/9J6BDgn059qk2QDMfR3c1pVI
         yotu3K830Sqvq70d/cW46qAMeFoo/8FZ5sjrjKyla2CKjV1aJNMNuVxx9v+zOTHJBi4c
         8M8Q==
X-Forwarded-Encrypted: i=1; AFNElJ8rI7gD6LsE9aXTGOL5BwtTYleUKAtZRrwEulzsUa7yQtZBsdX8XkmRP8vlB/e1ouXAxGlZfmx4kE3M@vger.kernel.org
X-Gm-Message-State: AOJu0YxtHUlyrrN1wMHw/xWTW92QJrMOpZ2Ruc3OGnmlzNSW/f3UeNqX
	CxvifKn7E4DHeiQk02sdgdXepTo8PZsVgHl0TziaPF+swgolAZc2mTQRFfeQdxeSvkek8n92VlI
	WOSUDwc1uDYvDS+ydSeBz8iFPGI1B8nQFS2bLBluSIuNlh9W+rQDFErCS4s1Bw79d
X-Gm-Gg: AeBDievpSlDy667JQAe8ML98OP8Y96hTK905/MUR+v6DvdlZ7PqLXFu67Mc6dotx5a4
	6ak61dOtPc/Wpi0hNRXSinlD8O1LlgLltNXaAFN1vERlDgtBZ+HawrBe33S6lPWb1alaR5Hzzur
	qmnxZmRZ8XHRjOHcI/1jMiSHUjsXQhNrIjJS/yxdiZ3W/JL+qAlAAwLFc6DJfofLJhEXRpmw0+M
	ksmDqvAr5TZD0nOs34Wf8mLm1gOxEzCSKQDgYzsfXxKrbuIjztpqRm6cIK+Dw077LABZVUeK3CY
	5zdVExW+CNr/BeogmORpdSb72Q1e/AvXEX3Th/G2d0jD1YgYNdX1uHi2LLmOcq34gA6EKMxY5NS
	+AIIoO22HZeTX/d4zpWpj1bbLgU0WIf4FTklDYgroznfWGZXq4/BktRVgSMgf9UBjuV+64XQY6L
	8=
X-Received: by 2002:a05:693c:2c86:b0:2da:1874:f3bb with SMTP id 5a478bee46e88-2e47a103c2fmr21228913eec.23.1777252096315;
        Sun, 26 Apr 2026 18:08:16 -0700 (PDT)
X-Received: by 2002:a05:693c:2c86:b0:2da:1874:f3bb with SMTP id 5a478bee46e88-2e47a103c2fmr21228893eec.23.1777252095805;
        Sun, 26 Apr 2026 18:08:15 -0700 (PDT)
Received: from QCOM-aGQu4IUr3Y (i-global052.qualcomm.com. [199.106.103.52])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2e7025cf413sm37730125eec.15.2026.04.26.18.08.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 26 Apr 2026 18:08:15 -0700 (PDT)
Date: Mon, 27 Apr 2026 09:08:09 +0800
From: Shawn Guo <shengchao.guo@oss.qualcomm.com>
To: Jassi Brar <jassisinghbrar@gmail.com>
Cc: Manivannan Sadhasivam <mani@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
        Deepti Jaggi <deepti.jaggi@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org
Subject: Re: [PATCH] dt-bindings: mailbox: qcom-ipcc: Document Nord IPCC
Message-ID: <ae62-exVm5HozUPs@QCOM-aGQu4IUr3Y>
References: <20260420040141.1247612-1-shengchao.guo@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260420040141.1247612-1-shengchao.guo@oss.qualcomm.com>
X-Proofpoint-GUID: 2hiMNnzdeXfs09tTDHkUF5HzyZOtWJGW
X-Proofpoint-ORIG-GUID: 2hiMNnzdeXfs09tTDHkUF5HzyZOtWJGW
X-Authority-Analysis: v=2.4 cv=Y+fIdBeN c=1 sm=1 tr=0 ts=69eeb701 cx=c_pps
 a=cFYjgdjTJScbgFmBucgdfQ==:117 a=b9+bayejhc3NMeqCNyeLQQ==:17
 a=kj9zAlcOel0A:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=EUspDBNiAAAA:8 a=BLlO_lzCmb2Ge3dZh0IA:9 a=CjuIK1q_8ugA:10
 a=scEy_gLbYbu1JhEsrz4S:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDI3MDAwOSBTYWx0ZWRfX6YiF99HYx98v
 xITEIsVE5oboniCOJQWqUQNrCcRcDri+nu+cmuTZSU8OXyCqU30uNsHetENm6bCFu9ccfHlg2qK
 aobivJ0iyInXufdI98K4PAeCKpBOPpGwvx5AD9nxmNlIktfrvgWvsSyGwBhztA+HlcWGwqgu+PM
 Y5mXQcpcWTUBYBK4SDKTGKzGUNG4VEbsR9IoaRbsXMj6FkNyYxt9M3lebpRUhcUe3ffwsANY8/y
 iuOZLYd5fNBixhoEEFXL1sdxHNxyku8CZyIebcxkGnYM6pHYgKnoSaFMGS2EeDmY5ctmnHep+jg
 UHU+BpDLwV1hNKzfrTQaTUf2yjDODPiRW8b1509+jEHKSsoSysVRsYtMw4BwmaUnlejnBmuGA38
 32vz+eKySvmfyD0ufVF79Z8Q+HNjFw+/f3KuL1n7wlT7VN4pE222ggD2fEbIm5Il9BumiFLh/XF
 EqN39gDk12Q6ldV1alw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-26_07,2026-04-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 spamscore=0 suspectscore=0 phishscore=0 adultscore=0
 priorityscore=1501 malwarescore=0 impostorscore=0 bulkscore=0
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2604200000
 definitions=main-2604270009

On Mon, Apr 20, 2026 at 12:01:41PM +0800, Shawn Guo wrote:
> From: Deepti Jaggi <deepti.jaggi@oss.qualcomm.com>
> 
> Document Inter-Processor Communication Controller on Qualcomm Nord SoC
> with a fallback on qcom,ipcc.
> 
> Signed-off-by: Deepti Jaggi <deepti.jaggi@oss.qualcomm.com>
> Signed-off-by: Shawn Guo <shengchao.guo@oss.qualcomm.com>

Hi Jassi,

Please ignore it for now.  I will resend after validating it with
remoteproc.

Shawn
