Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E8F143A0B38
	for <devicetree@vger.kernel.org>; Fri, 17 Apr 2026 18:23:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776450196; cv=none; b=MCm5zkOZM7WZTr9AdqONvJgBUJkJfsQ8YUsZiVM8+AuVIUG2N+FGA5kNn+5Qzt2iK6OdUO3/IQXrWfIjmCPsmEzFlEl/f8YmNFHDX+SZkKJFySnu1sbcT0RTnzCfA4zFhomSIRo79Pp+Mp6V4aIFvRYR/Yxuc+Qn+SzvKNg8KVM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776450196; c=relaxed/simple;
	bh=FOVV8ytkXqNmDOPHJRES0xYYASo8VFa6Q/ljQtjPeWQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=j0X0VTBWl9PXm3O1Kmd05z2sSMJVGLmEBCkrcO54f/GajHj91j8XHjeVE+16HyZyBW2At93idf0b/CPeBza4tpTTgUCFG9P+NmSFzmWAXhnLKC47TaFzJK5cQgiA44OHS2zzbaTO0a5iwWTQJ0mFTglYsXMZzrhUsaxQCcxXOwA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=N8xeBqhb; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=BrABvKEY; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="N8xeBqhb";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="BrABvKEY"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63HG4R1O2945186
	for <devicetree@vger.kernel.org>; Fri, 17 Apr 2026 18:23:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=c/Vo33zTig6JD1FHHp+ufQHh
	3tG0Ic/BRrAC/lMpdIY=; b=N8xeBqhbKm7+PectbSVf9VmQT8daYMkUTkQinlTc
	yiYnts6LdEzn7KFk1//jEFKrFjXIfySj6IlbbewU0TYuSRXecRrooi5hpI1VQ2qU
	dvlM8iPQpf8BvQURfDvS22w9LoYh7AbtLWU1cHUX+ejPuuzNERCAlhlBRFUMdbQJ
	HJ/6DTkfCx2MTQ6JOYW6d1MiajiDX0PqSSfLuM3+xJ5pfNYhy4zix4hY4toCnXv7
	DPkgALxkL+J62K0JJbdVVcpHnHg9a752f5XT7Y66B1kejBYbM3V1g6/2b0GR2WH4
	obL7+UbJwdEb2OcYJgCzoBzWzYLlgMSmOjLG0mjIWsgKig==
Received: from mail-vs1-f71.google.com (mail-vs1-f71.google.com [209.85.217.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dkdgy2vu3-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Fri, 17 Apr 2026 18:23:11 +0000 (GMT)
Received: by mail-vs1-f71.google.com with SMTP id ada2fe7eead31-60ff08dfb37so463842137.3
        for <devicetree@vger.kernel.org>; Fri, 17 Apr 2026 11:23:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1776450191; x=1777054991; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=c/Vo33zTig6JD1FHHp+ufQHh3tG0Ic/BRrAC/lMpdIY=;
        b=BrABvKEYTqlEVl6ekvCtT+PG1Nqax3EW/oqr1vahK2JjN3b6QhKxIelnzCnET/mZTe
         up3oKzUZBhavBp4ObSYSumPvfXyBeLMDA1oAGbciRcKBQLvaVmrLjWPCyigYnGaKsA/y
         U7o6GQmehIZIvG/pUQnYyzESkc2149Xlknl+L95l8hdui1FaZAP5hsnQZkz/8gg9D7HI
         PXXgFucEia6gxeZA11ViFRgHERyFR5he2a3KEC/cDk0LhiUqMdRlzrWIaGkWNBCiTn6n
         E4AsYqgycIC63FVb41dNlq6YNO5x5rNuRPVNGVIEAeheF+/11blV+nhYkUj07jz71rX6
         CAQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776450191; x=1777054991;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=c/Vo33zTig6JD1FHHp+ufQHh3tG0Ic/BRrAC/lMpdIY=;
        b=oZJvjE1KHvjv1AO7SfuJf9I1z7yYieq5O57B5IXNToye7zfIPdARr4q6/WIC+8kzlk
         3zHAm6XgQ5goQEytOZ8fegGa7MmCeTHHGNOtfQsqcgLmwKZNt5DyuqRNgV17HRHbz83r
         8YaMSlOJByHUwVxm3uRg3TUvf6VKWIGnw5cKzJSJy1y2S6XLP6Y0OjZnwwDaRmyiiTRN
         xUHFcxzngwEvcYABx9bvdnGC0l0q0Lq7KLoQzGi+tAmY/qAofLsKaOHNDp6Y2Mb7VOjy
         oo55fCTMWfYExfdR/tIIJAw0P1LBVBzyIJpXBaRuf5e/S0lABI4JIr2g2CIa/eFhjM1s
         3/Pw==
X-Forwarded-Encrypted: i=1; AFNElJ8cfaObVlVJ4kKC5ctU/IzZIOuwETidpxqxEro8zUe7lTE4e+U+70rXbdWb305qCgFBc1pUcKdjmQbf@vger.kernel.org
X-Gm-Message-State: AOJu0YzVqjKt8D3hXJod8jWTYah0yFa0+O73ccqhJlzSq91Ocrg1BGkb
	AtAfVkWtLQ9C2sTKH1jLZmsA5bTkPDH97X884qaUywgIPyUVrtQZuAxRM+ZvYT/ybb4KT1u2F38
	BePcuGfRxbmzez7zTT+myOWg3hIKeDxBFhOfY5pzdeXRU/OYoo07CqnC7jmC+zaNO
X-Gm-Gg: AeBDiesjyh/qvXtfX21XPb7N2xwDsR0EHEOKB8ix6jN5aKSMLBeSzGnGwXx9entGaJ+
	QHw0xLrP/2P0O85+L5/IyMhcVZoLp2puOfIVtJLKJeXhfIBndOo+mlJMNhI/Zkdw5uoi5IGXc66
	5ZNy4P0yiy3t1K6WZxlQ6eucA5UAtifOffZjGByH9rulLNN90vuH92HSBM7uJuX9fSHj/oJSmTu
	TKoHHth//glpBrMPyRmpOUqAg1Lk8rUE8r8dwnAXFBJQnG8yVzhckgxar8Zhnkafl5j7IBZ0pe2
	RFhXpFraMql9EnIGMULxVJ1l+X7rZuggCjhpT+sufYPYUcWKQuW724uV1TgvqTCYskq7XCpIZnM
	tlvyM72xpjqzUH1MCQ4x43V6pUdr/E/Z5sjGG9mZD14/8VY+i2DM9ak748jKUk5Lsxs8vW2CHqu
	RjL79K2+yJa6thP6L5kg9d5WjR8bMjbzgWnIdjJ3c+UqBtfg==
X-Received: by 2002:a05:6102:38c9:b0:613:86e6:b2d with SMTP id ada2fe7eead31-616f7c5f0camr1810562137.21.1776450190344;
        Fri, 17 Apr 2026 11:23:10 -0700 (PDT)
X-Received: by 2002:a05:6102:38c9:b0:613:86e6:b2d with SMTP id ada2fe7eead31-616f7c5f0camr1810489137.21.1776450189831;
        Fri, 17 Apr 2026 11:23:09 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-38ecb763653sm5616471fa.42.2026.04.17.11.23.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 17 Apr 2026 11:23:08 -0700 (PDT)
Date: Fri, 17 Apr 2026 21:23:07 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
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
Subject: Re: [PATCH 04/11] media: iris: Add helper to create a context bank
 device on iris vpu bus
Message-ID: <sqg2db63gsjg3cxfdfbmndhxibzlprgviarbcl4l6isza36nc3@ljgg23nkuooi>
References: <20260414-glymur-v1-0-7d3d1cf57b16@oss.qualcomm.com>
 <20260414-glymur-v1-4-7d3d1cf57b16@oss.qualcomm.com>
 <ie6dad3xewm25gdrqqne2fsroopu3jwgrqmu54sfzjliis6mo5@6qsgagvyynwx>
 <b0ba2172-3f66-c912-29e9-0a48b4480987@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <b0ba2172-3f66-c912-29e9-0a48b4480987@oss.qualcomm.com>
X-Proofpoint-ORIG-GUID: JZD14WxRhTkguEni291dcgbJpVAP194u
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDE3MDE4NCBTYWx0ZWRfX+WJPcLQT+KIe
 JSHR+XMyHIT+dLpYGGkoxApft6uIoPLZT7ZkN+xHsqhQCIggS5h+xQlcZaZ5D+XmInbuGWW6uR6
 8or9pTXU4Ed6iy4rrPvDoxxFzC3Mex21WDh3lfy6y3j++8yGbsm6Nq4DBcbbVaPYOOCnhE2rBlB
 3fMbzxfecOMI7jwRRYOVZripF8LOOM9zNK8NBJ/QKPzeVbHNdYk0MZAojId6nVs4bj8Iq24srdw
 1Nx17K7HFub1InVQgrIxk69IOrvMb7OqsG3c+SNSRsV2EhGTifeGE2UFbsbTl32xqY8YdrVyIum
 SnBmWso2XwzuvQaqcQRKUzE9vh6wi5Jcfi4nDUQ6v2fbPhkOqvDLd9THWtCEsl6Rk0Mam1CNGR/
 jvluK6WkwbPiaoD/0wer3qM3HnWAJxVnfYmWwQmY4HoWVGamjnPaUxCkQRNQL3SRUwsPXmXRU5C
 xc1aEv0kLgmR+fx2/ew==
X-Authority-Analysis: v=2.4 cv=GN041ONK c=1 sm=1 tr=0 ts=69e27a8f cx=c_pps
 a=P2rfLEam3zuxRRdjJWA2cw==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22 a=EUspDBNiAAAA:8
 a=qp5--WL1MiOyaZoWmgIA:9 a=CjuIK1q_8ugA:10 a=ODZdjJIeia2B_SHc_B0f:22
X-Proofpoint-GUID: JZD14WxRhTkguEni291dcgbJpVAP194u
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-17_01,2026-04-17_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 priorityscore=1501 spamscore=0 impostorscore=0 suspectscore=0
 lowpriorityscore=0 malwarescore=0 adultscore=0 bulkscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604070000 definitions=main-2604170184

On Fri, Apr 17, 2026 at 08:49:44PM +0530, Vishnu Reddy wrote:
> 
> On 4/14/2026 8:48 PM, Dmitry Baryshkov wrote:
> > On Tue, Apr 14, 2026 at 10:30:00AM +0530, Vishnu Reddy wrote:
> > > From: Vikash Garodia<vikash.garodia@oss.qualcomm.com>
> > > 
> > > Add a helper function to allocate and register context bank (CB) device
> > > on the iris vpu bus. The function ID associated with the CB is specified
> > > from the platform data, allowing the bus dma_configure callback to apply
> > > correct stream ID mapping when device is registered.
> > > 
> > > Signed-off-by: Vikash Garodia<vikash.garodia@oss.qualcomm.com>
> > > Signed-off-by: Vishnu Reddy<busanna.reddy@oss.qualcomm.com>
> > > ---
> > >   drivers/media/platform/qcom/iris/iris_resources.c | 33 +++++++++++++++++++++++
> > >   drivers/media/platform/qcom/iris/iris_resources.h |  1 +
> > >   2 files changed, 34 insertions(+)
> > > 
> > > diff --git a/drivers/media/platform/qcom/iris/iris_resources.c b/drivers/media/platform/qcom/iris/iris_resources.c
> > > index 773f6548370a..a25e0f2e9d26 100644
> > > --- a/drivers/media/platform/qcom/iris/iris_resources.c
> > > +++ b/drivers/media/platform/qcom/iris/iris_resources.c
> > > @@ -6,6 +6,7 @@
> > >   #include <linux/clk.h>
> > >   #include <linux/devfreq.h>
> > >   #include <linux/interconnect.h>
> > > +#include <linux/iris_vpu_bus.h>
> > >   #include <linux/pm_domain.h>
> > >   #include <linux/pm_opp.h>
> > >   #include <linux/pm_runtime.h>
> > > @@ -141,3 +142,35 @@ int iris_disable_unprepare_clock(struct iris_core *core, enum platform_clk_type
> > >   	return 0;
> > >   }
> > > +
> > > +static void iris_release_cb_dev(struct device *dev)
> > > +{
> > > +	kfree(dev);
> > > +}
> > > +
> > > +struct device *iris_create_cb_dev(struct iris_core *core, const char *name, const u32 *f_id)
> > Please move into the bus code and make it generic enough.
> Do you suggest to add a wrapper to pass the varying inputs to the generic
> bus, something like this
> struct device* create_and_register_device(dma_mask, parent_dev, *release,
> dev_name,...)

Definitely not the release function. The devname is also not that
important. The rest, yes, you are correct.

> > > +{
> > > +	struct device *dev;
> > > +	int ret;
> > > +
> > > +	dev = kzalloc_obj(*dev);
> > > +	if (!dev)
> > > +		return ERR_PTR(-ENOMEM);
> > > +
> > > +	dev->release = iris_release_cb_dev;
> > > +	dev->bus = &iris_vpu_bus_type;
> > > +	dev->parent = core->dev;
> > > +	dev->coherent_dma_mask = core->iris_platform_data->dma_mask;
> > > +	dev->dma_mask = &dev->coherent_dma_mask;
> > Would you also need to set the of_node? See
> > device_set_of_node_from_dev()
> 
> It might be needed for FastRPC as they are following sub node approach, Iris
> does not need.

Wouldn't it save you from passing it to of_dma_configure_id()?

> > > +
> > > +	dev_set_name(dev, "%s", name);
> > > +	dev_set_drvdata(dev, (void *)f_id);
> > > +
> > > +	ret = device_register(dev);
> > > +	if (ret) {
> > > +		put_device(dev);
> > > +		return ERR_PTR(ret);
> > > +	}
> > > +
> > > +	return dev;
> > > +}
> > > diff --git a/drivers/media/platform/qcom/iris/iris_resources.h b/drivers/media/platform/qcom/iris/iris_resources.h
> > > index 6bfbd2dc6db0..4a494627ff23 100644
> > > --- a/drivers/media/platform/qcom/iris/iris_resources.h
> > > +++ b/drivers/media/platform/qcom/iris/iris_resources.h
> > > @@ -15,5 +15,6 @@ int iris_unset_icc_bw(struct iris_core *core);
> > >   int iris_set_icc_bw(struct iris_core *core, unsigned long icc_bw);
> > >   int iris_disable_unprepare_clock(struct iris_core *core, enum platform_clk_type clk_type);
> > >   int iris_prepare_enable_clock(struct iris_core *core, enum platform_clk_type clk_type);
> > > +struct device *iris_create_cb_dev(struct iris_core *core, const char *name, const u32 *f_id);
> > >   #endif
> > > 
> > > -- 
> > > 2.34.1
> > > 

-- 
With best wishes
Dmitry
