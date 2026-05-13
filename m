Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A65B638F623
	for <devicetree@vger.kernel.org>; Wed, 13 May 2026 14:17:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778681840; cv=none; b=SVVSHtMYhwGaPprfr7i+3ourjme7dM+L+xlExgTX/IGiiwirVW+4WlEc6lEq1KpYr4GUGEFKS7AP1q6f0xHvHKfFvABeE4S8XO3Yb4iyEjwvF7ZCm587MVgSU2uLILhtWvM8gDWJdKcvfpExNXEm/BpxgnVYKTBz/7AuMWTjdUU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778681840; c=relaxed/simple;
	bh=YeEmJtfOi3ruRtgyvbxnJAIRcn/yh4Hvqz3vDI5g6vI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=f/fJgMnPddRxLY0yPrVTBbbLU6305kpqp0MprKQMeAo3rZ3wpSJjwS6EkIwT2clJeo1aw2tAUaRwuWfNMTvkvEa1xA1cSAkhak9GbcFeM1kER9w8jDVsgK6Lpb5viT6VNFbAQBV90XE4jEUse9yn4ijezwBFrVSGA5V5Ms7oFYM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ZUsDcuy5; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=PJggn4GP; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ZUsDcuy5";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="PJggn4GP"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64DAVL1H3430147
	for <devicetree@vger.kernel.org>; Wed, 13 May 2026 14:17:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=QtxV0KKT8L1h7QSyHNrHfjcD
	HL1rGc5XA2EQyHwr5js=; b=ZUsDcuy5NaFXCR6sq23leJdpmh73sJaL5l3my4li
	s9unSjEugOP9imXwVNVOxmDVwShddeMVfK44GMfL54LqBMjGzbk7K2a02VRnl3iH
	DYnZc6vpnHO8ZNSzXfKyLqHOHZaXu0ZoRsz9hSQZ+O69PajnKhYO1Jr3i28Tugvh
	Q9IabM5a0xLqacLJuMEm/Md5+dXBU8hyv5EbDlyDGeXBXuk0DI7j4PnzyRjVGpbz
	IUGl1HoCLM6tyeLRfTlW6tqjhEDTE+7AVnFNUkQX42oB/x55gSedmd7psxBFoea/
	GYwEqjCIhbqck0+TJGJXi9uqsAfvAGgb1BoKuq0AVQVmSA==
Received: from mail-oo1-f71.google.com (mail-oo1-f71.google.com [209.85.161.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e4qmcgu10-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 13 May 2026 14:17:13 +0000 (GMT)
Received: by mail-oo1-f71.google.com with SMTP id 006d021491bc7-6961bdde2a1so13965262eaf.2
        for <devicetree@vger.kernel.org>; Wed, 13 May 2026 07:17:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778681833; x=1779286633; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=QtxV0KKT8L1h7QSyHNrHfjcDHL1rGc5XA2EQyHwr5js=;
        b=PJggn4GPirfmQV1SjUmrUJQZATX7O9732j/angM6+BKPvkOZb+SexC3omI5yjfOi6y
         l8tW0TLqFEEWhDbXQJGOLw8KzYnt08ziA7PxEVD9yTh11a8j5oWYUkBwafOE1hc1DblE
         KlXS2s+O/h6ZtZwkKHzLBHNyHYBvcZFzAgD1j6sdfmshaca0blnhIcbKUJnaxM4OtoBG
         4lvx1hrW/uIfzG6TioWjJkoQxEk8tpH1r8DmZXS4rAXX5PLBI1t/TcSyzqIpZPSU275O
         zmsbtmp9YedErWD8frP0yFFviObel3fu002WNvNs7IZMbdtrRzDg4rGGzWOgYENkv8tC
         F1ng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778681833; x=1779286633;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=QtxV0KKT8L1h7QSyHNrHfjcDHL1rGc5XA2EQyHwr5js=;
        b=kD1BusSMvWrbDIxHEmm5KCImbpVv0/3Dc9Lyr1pOU4zfUVM9369qvkuKxWciU4V5fI
         u4HUkSfFgDalYSel0VaiyoETwh5iZ9zXYuG0aIX9436Ra2Jp1bvTDJJKW3TcWjEJ7Anp
         t3A/KZQZ+hbeRsMnRxWUnqAg2EDMU75/hS5FjJcn9Ek4UrbU2fbLtNRZzZqfwPKIMGvS
         zaPJPcYGv7QB5Y3w8feBI4+zsj0ocalsou/j+ZyaHXf71vkIxoCsE0tt88KDazS0B1wL
         Aits2ZTGwA1H+4GtGfceggKTjSlmHF1FazfMKOxJQHZkivdqczNn83m6VHvF2uWnrvcy
         P2Gg==
X-Forwarded-Encrypted: i=1; AFNElJ+by1Qvy2vuzALkjVMQLX4dJ/cPRFihXa32IM2xJpmsOCnFjUu2xsUjmiAalpLE2fKxBw20fdAm6A9j@vger.kernel.org
X-Gm-Message-State: AOJu0YyiNq8JEzfU03Rs1JxDQv+rmODIYXtAflnLR2lfGzZV5zPMggUv
	jz36FqI4GPVIghFVF33bz9cNIkE4Ycscd98dwy8Z3NA4zqNdF7frLUEKgMR9gSGzo9AQDxlV7ua
	E/r9bH5O0tMY/FaGKYr2DqdkyERIWQf0kDgJqLlWRDG55we3Pd3U7RKfSWXZQRqQ5
X-Gm-Gg: Acq92OE2MzIR12/xooDN/sn9Nz6sI7MecEOnUVlq4HDGt1REhaaT+PnZtIU3n1mT6dl
	ek6FUdyeyW4vWIqClt8BptTyCRyiCPGC2Up+Zd1lGVMmgDJUzHPgEQYiDJeybWT+rdD3nFqfTJE
	fBsuplSS6CiUDAxcHlLAWv2X6Qn3sRIJJlUt9l4OEUMxblZEJgUPW13/2YGCLJ4Z/kAlywiUiuj
	PTdXO6H+q8lju9MA9MYi+57YQEQgRCPj/8ronLJkt07ez70V2rDrt2BoTpcvTJCSSV/vrsYbZLl
	Z+YMAYqJQiRJ8+BJZ9WbBJbeJPsDrkfYzdop4O3LhDInSKv3NejzICjbCknPP/RWH8JKjklnZ2t
	PcKYMABV/e9HyH7sQH2B7Q3L7CxeqTkETwzOx64oNM41vLqEfGa9IDNZVwgUlmSlqOqsG0euYsL
	/ROk89lzLDmwg+YbaMLKfhto0Fw4Q2YWgzrng=
X-Received: by 2002:a05:6820:3082:b0:696:2430:3277 with SMTP id 006d021491bc7-69b7ab28ceamr1456212eaf.29.1778681832727;
        Wed, 13 May 2026 07:17:12 -0700 (PDT)
X-Received: by 2002:a05:6820:3082:b0:696:2430:3277 with SMTP id 006d021491bc7-69b7ab28ceamr1456137eaf.29.1778681832217;
        Wed, 13 May 2026 07:17:12 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-393f5f18e63sm40854351fa.5.2026.05.13.07.17.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 13 May 2026 07:17:10 -0700 (PDT)
Date: Wed, 13 May 2026 17:17:08 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
Cc: Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
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
Subject: Re: [PATCH v5 12/14] media: iris: Add platform data for glymur
Message-ID: <wequp7ogk2az3d7yzfxn7wwlr6k5ng2jwrg6anaidseteuwlev@v47yoo4j2gbz>
References: <20260509-glymur-v5-0-7fbb340c5dbd@oss.qualcomm.com>
 <20260509-glymur-v5-12-7fbb340c5dbd@oss.qualcomm.com>
 <jfypqc5ise7uezog3lwmmrzddbsctir6ze24ma4vp4zgcuwjbf@4443jqib6nxw>
 <b6dc6b32-26ad-6f2e-dfd4-551e7fd0481e@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <b6dc6b32-26ad-6f2e-dfd4-551e7fd0481e@oss.qualcomm.com>
X-Proofpoint-GUID: boKefVYYv34sAx5afIMqHQhoQvzrxn6G
X-Authority-Analysis: v=2.4 cv=Hu5G3UTS c=1 sm=1 tr=0 ts=6a0487e9 cx=c_pps
 a=V4L7fE8DliODT/OoDI2WOg==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22 a=EUspDBNiAAAA:8
 a=4BxVqlV7uxTxpwANZs4A:9 a=CjuIK1q_8ugA:10 a=WZGXeFmKUf7gPmL3hEjn:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTEzMDE0NyBTYWx0ZWRfXyECOH/D1agal
 onbyMjr5LwS6I3PXwwSs9kEFd4VB9fUo/7U5MhGr9IzJ+Pd3s/B51WKr5sTkBq1OioASHrKaHF8
 Ptx/6MKgmJbGS4pvg0bWobzw/4RxW4CrSIOTVlVkBKRYi+C4JiipueO+ectWzh9q/WD0jYVcC6P
 6XulDTIiVK68Y0Ahy/luuss/IH8gbnMM12a3TzAGhkQOMDQx15BDdY/ateLaZr0LfCUY9g8rdBs
 +7eWrXf4heaBH5ta9BtLcMYeISElF1DqpYy4+uNHSigSBNmc0xRUv5mDDg15urTzUUbALlCzA5a
 JeKJeYviBZBTBjE+YqLfsvzsGsHGQo8fdRr8KTFIgk2d4gYz8WaPo8NSiu7pj+Z8uP7y8m/vbSy
 RcnhMH+5ZlszwOJZFokHZdyYO9GwLGY4Qoy70/GK65Wqmfr2hlaXqz2lKzeanDBjTAlTkIRhp6v
 2e9y9NyptYWI3Dv09MQ==
X-Proofpoint-ORIG-GUID: boKefVYYv34sAx5afIMqHQhoQvzrxn6G
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-13_01,2026-05-08_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 malwarescore=0 impostorscore=0 priorityscore=1501 spamscore=0
 clxscore=1015 bulkscore=0 suspectscore=0 adultscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605050000 definitions=main-2605130147

On Mon, May 11, 2026 at 09:45:01PM +0530, Vishnu Reddy wrote:
> 
> On 5/9/2026 2:35 AM, Dmitry Baryshkov wrote:
> > On Sat, May 09, 2026 at 12:30:01AM +0530, Vishnu Reddy wrote:
> >> On glymur platform, the iris core shares most properties with the
> >> iris core on the SM8550 platform. The major difference is that glymur
> >> integrates two codec cores (vcodec0 and vcodec1), while SM8550 has only
> >> one. Add glymur specific platform data, reusing SM8550 definitions
> >> wherever applicable.
> > This leave me in confusion. Having two cores, each with its own set of
> > clocks and pm domains, I'd have expected that each core scales
> > independently. I.e. if the load is pushed to the core0, it requires
> > core0 clocks to go higher (while core1 clocks can stay at the low freq).
> > Or, at least, the clocks would be set to the frequency corresponding to
> > the max of the workloads (if for some reason the cores should stay in
> > sync).
> >
> > However, I don't see it in the code. All clocks and all power domains
> > seem do be scaled using the common workload. If my assumptions were not
> > correct, please explain it in the commit message.
> 
> The OPP core logic sets the rpmhpd level and clock rate based on the OPP table
> defined in the DT node, where the clock frequency and power rail level are
> tightly coupled together. Since vcodec0 and vcodec1 share the same power rails,
> independently scaling one clock high while keeping the other low is not
> straightforward within this OPP framework.
> 
> Do you have any suggestion on how best to handle per core independent clock
> scaling within these constraints?

This would require more plumbing and driver changes, but:

	iris: video-codec@foo {
		compatible = "qcom,glymur-iris",
		clocks = <only-core-clocks>;
		resets = <only-core-resets>;

		/* or core@0 */
		codec@0 {
			clocks, resets, power-domains;
			operating-points-v2 = <&iris_opp_table>
		};

		/* or core@1 */
		codec@1 {
			clocks, resets, power-domains;
			operating-points-v2 = <&iris_opp_table>
		};

		iris_opp_table: opp-table {
			compatible = "operating-points-v2"
		};
	};

> 
> >> Reviewed-by: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
> >> Signed-off-by: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
> >> ---
> >>  drivers/media/platform/qcom/iris/Makefile          |  1 +
> >>  .../platform/qcom/iris/iris_platform_common.h      |  5 ++
> >>  .../media/platform/qcom/iris/iris_platform_gen2.c  | 99 ++++++++++++++++++++++
> >>  .../platform/qcom/iris/iris_platform_glymur.c      | 97 +++++++++++++++++++++
> >>  .../platform/qcom/iris/iris_platform_glymur.h      | 17 ++++
> >>  drivers/media/platform/qcom/iris/iris_probe.c      |  4 +
> >>  6 files changed, 223 insertions(+)
> >>

-- 
With best wishes
Dmitry
