Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 554D63B895B
	for <devicetree@vger.kernel.org>; Mon, 11 May 2026 08:06:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778486800; cv=none; b=aEsLbSu37VI377NVqRIKL4QPUVKyq37IUD0C6B1g+fZP5XA4fwNfB4iF0iour1sUZvPlnksBxBKyfYbf1F/zp2Ak7fiBQ6cXBFIeJQwblXOmA0VwRAx3IBzvwcBEsFH3Q262xBnEhUuUbPdnJztmwSCwcBU0tqwktltIdtVZHCw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778486800; c=relaxed/simple;
	bh=3Tz2OjDF5lCkQ7m1u9fa1A8Pfz/yv22mmCYTrI0gwfc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=jM9pjSMDXtEQorzMv+aDN563RjVcN00fwyXEcPEADS/gbMhgMo0HIoaMSa78jpccvezSlKq4+q3lnqRtOzzSj942+UENPksqOIV2c9Hf8G6wwK7Ts8Lu4W+NLQRdHgOn80+jKH2lG53pH6h3Dm2aV/t54EaRLL1OFIhqE9fTLdE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=PnB0Wwl+; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=GFs0Ax+M; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="PnB0Wwl+";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="GFs0Ax+M"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64B3Mq1a2655840
	for <devicetree@vger.kernel.org>; Mon, 11 May 2026 08:06:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=/6OY4QeYUbWXnau99ZtZcmYK
	nWqdx8LqgKBOO25F1fk=; b=PnB0Wwl+S8dEIo2K3MJIQLzRvgJEzIVOKb03bCU5
	4Xkkoa/rzeLu1KoO5+hCUeEtsgwglXUbRgQTG3MDQhMbKAMgdEjsnETaOy7Xl3Gs
	nCIa8WHRJ254UnzU8Dw1GVgdukuZg8kZ7KDt/74KXwXH7GoIVDCLScsMAwBTIyeJ
	tknK0JzBesKmT9dnw3oct21v9FoCURyydRx4VUQS+Gv2Zij737HBX54jaxAXc+uX
	PRiFVARo/c63CDp6dxLs21hfIgA4bMwCy8ShbO22cW/H0LBCqDztxjCqwUTyIfhO
	JNN+cKL7LZtrhKk16qNommZEJal0RAUA6OvmTfD5hn2MlA==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e1wped1sk-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 11 May 2026 08:06:27 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-365faf6006dso4751919a91.1
        for <devicetree@vger.kernel.org>; Mon, 11 May 2026 01:06:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778486787; x=1779091587; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=/6OY4QeYUbWXnau99ZtZcmYKnWqdx8LqgKBOO25F1fk=;
        b=GFs0Ax+MKj4PnxmnOLYMAAS9y0ag8OObxQo+gA0upOz4GcUBMbiLCD65/yfO1GaxVV
         5wneooFnLZBJCeYCeLxJMcKeP5s8Oc2zfKX9sBdxFh9dxLjqi+l6JUKb+030cv3JVMkU
         Rp0UnfjUiLCLyaOtRQdAK0Z9ADuFs8p0WlYcvz+0fH/uJ1xtxIov0rjoqfsQstfA0UeU
         P19CSyLyglJGoz2pLxpOAcEJ9fxqyJoOGcdlMa4eftrR58+3Pd77LAJUuoRHP/UBjIgc
         Ed+mYdNBpZaol1V3iAtPBw5wJfZJBTEnECUg4Mmf4zBPuU8Eqja8n2VEKz6w6NaOyUcQ
         fDhw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778486787; x=1779091587;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/6OY4QeYUbWXnau99ZtZcmYKnWqdx8LqgKBOO25F1fk=;
        b=QmDCbg6+qHlt4XmF/aXB3FoiUDyS8mykvDXUTYzhApBtPwdiBCG6RlDtCT0nD+sXlU
         z4HKaztwV0nxj9c0nWP8clYHQ35KmYAZFlLEe5BQcHrWDJNWR+koTx8mXORUA0RzBj0j
         p1/eKM5GVmnUq4CvR2SRn1RzzLOJjiHU4J8y8Tc8STBNuh47s+gzwin0AbbMk0XcZRju
         ulcTZ81DfNo5BRCrtTL5elmrvYBOkvf6vfo503ZtbgmbC0OPKD7XGBxiSSLZgI5MVOz6
         wV39vVq9+YdDx/UI6tFuzavTMGwyhFEPozjTkrGJJMusdSQpKrA0fyDnlgKHrWXfH62G
         MOkA==
X-Forwarded-Encrypted: i=1; AFNElJ/jT77IY3fHg2maHCc7Uxav+7WczxC/0lYhuWbJAmXXlZkcmdw+5XFLKK6tZLs0iupdTN/0KaM95S8+@vger.kernel.org
X-Gm-Message-State: AOJu0YxDvMtPu+iQ1xTGTjogmaWeFDbroZj4mI+S580tOYw7mukEGhnF
	c5lgpnIFAqytWIKSLIwO6dMslYmiO4h6p6qSDn4eInAGkKJdczJhVSHTg0Vfgnku+h3RFML/G/b
	F/bqrT7BO7Ru/ivGAzo3KTTKOUXThvWlegPqMtIiff/96tafEDv1FpOWHEshcbgDn
X-Gm-Gg: Acq92OGsxMRyhZDGxuc0Kqhp89cqvOyJpdoBn+OojLYdUfCrUk3W52WzMwrbseoNgtn
	cZieXFzuooxAGD74URSvyKOlqFnHOdOdHcO1Ld+Z+pvVfxzj8OJ8PKLJKxKlmNR2tDdJaL0jg1s
	CZUn7NQGKWfOEc+wVMrFEZPrtIN/MdcY5EncZSdAiuviLTkObJTpjOCkPASWXTFUZWxkzsLfSiL
	yCpIl7BgPY+1K77FnFN9OAyIsZViH3VT1HcDt8Gx8FwYk6UyhYjyB43vT/F7DRVoa17+nBWMsAG
	7fYPAbKPe69TwGLHN9Qbt/ltyPImiPi/Wuz3uV8phXxuGZI3+2jpgMeKu/hUHVDTbvr/hS91+RA
	7f9KCr9nhVQOxXygScv5TBb8wSox7o2WYIMTqgPL0C55XoOw1
X-Received: by 2002:a17:90b:224f:b0:35f:b69d:7292 with SMTP id 98e67ed59e1d1-365ac080dc9mr23365384a91.15.1778486786629;
        Mon, 11 May 2026 01:06:26 -0700 (PDT)
X-Received: by 2002:a17:90b:224f:b0:35f:b69d:7292 with SMTP id 98e67ed59e1d1-365ac080dc9mr23365320a91.15.1778486786006;
        Mon, 11 May 2026 01:06:26 -0700 (PDT)
Received: from hu-mojha-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-367d683fb92sm6583882a91.12.2026.05.11.01.06.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 11 May 2026 01:06:25 -0700 (PDT)
Date: Mon, 11 May 2026 13:36:16 +0530
From: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
To: Trilok Soni <trilokkumar.soni@oss.qualcomm.com>
Cc: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>,
        Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Joerg Roedel <joro@8bytes.org>, Will Deacon <will@kernel.org>,
        Robin Murphy <robin.murphy@arm.com>,
        Hans Verkuil <hverkuil@kernel.org>,
        Stefan Schmidt <stefan.schmidt@linaro.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Stanimir Varbanov <stanimir.varbanov@linaro.org>,
        Jorge Ramirez-Ortiz <jorge.ramirez@oss.qualcomm.com>,
        Del Regno <angelogioacchino.delregno@collabora.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, linux-kernel@vger.kernel.org,
        linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        iommu@lists.linux.dev, Krzysztof Kozlowski <krzk@kernel.org>,
        devicetree@vger.kernel.org
Subject: Re: [PATCH v5 07/14] media: iris: Enable Secure PAS support with
 IOMMU managed by Linux
Message-ID: <20260511080616.6niytw6t5kitf7ug@hu-mojha-hyd.qualcomm.com>
References: <20260509-glymur-v5-0-7fbb340c5dbd@oss.qualcomm.com>
 <20260509-glymur-v5-7-7fbb340c5dbd@oss.qualcomm.com>
 <4e132e7c-ffa0-4954-876b-67b53870e832@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <4e132e7c-ffa0-4954-876b-67b53870e832@oss.qualcomm.com>
X-Proofpoint-GUID: -OiLmT81dyCPHW5WvS3_-yCExu7Yjrkg
X-Proofpoint-ORIG-GUID: -OiLmT81dyCPHW5WvS3_-yCExu7Yjrkg
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTExMDA4NyBTYWx0ZWRfX/6SI9SB1TcGo
 IDGwJHkQNq/WYCOwOAkAIRMxA8EfERYLCKc110X2/faF2l31LsLW32d8ZwXYuly0rnoHhIo0P+b
 hSkle/r45vLkbqBVoupGHWzAoPnMg8YwaXSi+GZCWN8wdAQ7bv7jM0tSRw+Vdaa4ccs6cligpnL
 MwkTEzeG4XqpHu+0lxjkae9O8dbj1PNQHtlWSf8zKjzoMreUyOK24Pqw1elAUkH9wKYlQpQxZ/O
 YQhFXy/PegH0KoF+6vZDQbfVdc09AhU99YSqa8KviloZW8mi5glgn9xUpmfzM667hjAUI6r3WKn
 PSqBKldTGHn6OmZhIP/IxvXYimGo1Nq0KJ3qq3s+y/hYQ5u01UD+Afo1aSFT6LKV8ooZeEJSQWw
 D+DiFwin3VkMvMEfe1kDyOHe/gSA3n8LWk7ZvS9MRLyvBGlZz/QlLJXOsLE7hu03bV93Dev6qge
 DhzbQH4um+o8Cat25TA==
X-Authority-Analysis: v=2.4 cv=EeD4hvmC c=1 sm=1 tr=0 ts=6a018e03 cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=kj9zAlcOel0A:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=EUspDBNiAAAA:8 a=H2__nBlnFGDM6hqOEFYA:9 a=CjuIK1q_8ugA:10
 a=iS9zxrgQBfv6-_F4QbHw:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-11_02,2026-05-08_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 phishscore=0 priorityscore=1501 bulkscore=0 adultscore=0
 lowpriorityscore=0 malwarescore=0 clxscore=1015 impostorscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2605110087

On Fri, May 08, 2026 at 12:05:15PM -0700, Trilok Soni wrote:
> On 5/8/2026 11:59 AM, Vishnu Reddy wrote:
> > From: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
> > 
> > Most Qualcomm platforms feature a proprietary hypervisor (such as Gunyah
> > or QHEE),
> 
> Gunyah has open-source version as well. Can we make it little less ambiguous? 

I doubt, Gunyah open versions handles PIL bring up sequence which only
done by QHEE module., Yes, we can just mention QHEE here to be precise..

> 
> ---Trilok Soni

-- 
-Mukesh Ojha
