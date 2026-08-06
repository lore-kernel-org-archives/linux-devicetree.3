Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0942744839D
	for <devicetree@vger.kernel.org>; Thu,  6 Aug 2026 10:35:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786012551; cv=none; b=Vs10U1a+X2bnDnrtlGxCgjqHDVd7RExKq5lujzlxyyhGrgxOn+F/+k+kuzOw2xijq79e1FHziz826Ps5lHkfSQ9KrKhlfMhPI6qge8lOXejetWJvkcZxHdKHuWZ24eJyPvc6WwUC5hVAJdkpG7YbMV7EP07uQZ0Zjbob3A6TCNc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786012551; c=relaxed/simple;
	bh=ZQvCWz4/R+/des8sCNL1z65HgMYcxp/I5iqoxM7oby8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=hEQYdvEFGlbAyAEKIwIxxXu22ZaBWbrg+fUQaUPfNk2xVeq0eNnjg+cFu8T7UKwZ/o0paeYYYxTvyMO90WsscBLBokUzMe7dFIecG5DHM0opvR4eR9o6jO9zXEfLweznykJPqwN5HrAJZuWltj4z7plaOkqmMjzYKHqTORfIqko=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=oFPLofMj; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=TjWKTWkG; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="oFPLofMj";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="TjWKTWkG"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6769nc7M1580566
	for <devicetree@vger.kernel.org>; Thu, 6 Aug 2026 10:35:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=Qx1JBAI1cE6qPg6ABZ1qtEwq
	9BrFDWvvC2WwjA3FCkE=; b=oFPLofMj341/99SKWgp1/KOmx+1lgzWkI+ddoJkk
	eOZXh0L0qRATnA+q8RLDDteRTcpUATLvwSZR6MfJjkEb9l9fi58M9u+Mc4KPxtlT
	TuTJVdLz40ezmIUYtPWY9YT7ZHUi8omBLbK+4hEFz9e77PCfhSnOOrrjah5bOy92
	XK2PncG5aV5qgSYRMhxWkXXZmwAaCxw7O/Ww0GojXTFk81Bg1js3X4byHS69iA7w
	a8aiiW5YDDMnZen832RsE+2xevFkA7VexZMKGFrXOHn3Iz+8ewdjS5a6tqveanJ8
	MHXGuLOmbMxyTz7PNeqdEYi2uacJX7eP4sBpnepb9R8TpQ==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fvmrjh46f-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Thu, 06 Aug 2026 10:35:48 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-51bff5c7035so36442451cf.2
        for <devicetree@vger.kernel.org>; Thu, 06 Aug 2026 03:35:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1786012548; x=1786617348; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Qx1JBAI1cE6qPg6ABZ1qtEwq9BrFDWvvC2WwjA3FCkE=;
        b=TjWKTWkG5+Y/PtVirGVzm+27onA3Sjdtxk0Xlh/HJCHzzdWU0+z+J9O9j4BW6XOdOr
         oA246wio/zuRjCHsIYa4XU+d4tGhd2YdPJJS+EOCxi647cE1jf16P7F2U8isCQIE1gzD
         043GJInf5GZ7BfzsoiPw6VHzz/tNrDjXe/LPNHYEB79tP2hzALhKufnBqgRi6R4Amkb9
         M7lEmR1eIc31RuHS0oV7tLq/9bvKotkZd3yktnadMtbw/SZ+i/WXBELwlLAmbhjwmKSj
         LAlZmyBEM+UOedExD7gFmj5KD3cmFXEZgtHSh7bsQereEa96lgVpfhUKSfRla0VEtI3R
         o4mQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786012548; x=1786617348;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Qx1JBAI1cE6qPg6ABZ1qtEwq9BrFDWvvC2WwjA3FCkE=;
        b=b9TPf2nM5IrXbX+E04a+mriAu5wfOIfSVE3nelK0U69Qvm4JEOer3ptYMbTCYunc/m
         rjVohWmALDiH1/aKYXFQTxEKZpM4XV+3ZHyjc5s432J2St7QDMN+8evf2oPug5tL/DZs
         uFXkkWDWLnAxLaotqQqpiL/qfBJLugIm3N6c9YFS019zeksxENs86dXM9hdsNH2ubFO5
         GNdaC+UYCc7NBWuqCv3rihZJpmpmpYYGlPRFN4gLW5GlE15VLpRMXeqNnggQt6YcNU5w
         PuC9g1ZMiHHVwRF9vgNwrZnAGf6YIfY7D8I505jMBRhg4YdpCbhdaP4Vr4H4E2PLvKtw
         8eUA==
X-Forwarded-Encrypted: i=1; AHgh+RpRiAAVgilt5pAmOyS8qLtDcRoGctePVz5IevKJZEo2bRnUv9Vx7rOH5i3HUGftSLjIh/MqxsBtbgEd@vger.kernel.org
X-Gm-Message-State: AOJu0YyPJtSpwSqNiMDrxYVEWmDToypC50mKwMbqJMfq4wd8ybuC43u8
	2X7vlXfOJypFZPC54JHVjPbB1M8gX/xoMXuvqc1uGYd66Q3QFpNz0dz1gt7gJlm4zzQ0S7EMSZA
	jj+HIKs1oan3nytMf+nt14/CpVEFQIotdIJkrPSq9Q7BcWdvckSkz0BAfa8Fa7PYn
X-Gm-Gg: AR+sD13pJtWNS4+i7MBM4YUmUz8w7EYlhA/jb9LVy54HfS+5naMEp84+lQO4d2mboom
	CDO2mCWyyh2ijnRylRp/1AbwmyDD/DbW+7eUMZWG3k4CY2EuzuCNz6r2522qm+6ycmVqkl7tXs4
	PvS8sfniqE4JFH0pBL0vK3biyXJf2w4wbyUhKh8o28c4zaEvhEHKofpWvj2wavMkPYs+M4q2x3o
	OYWDdBIfArwwYJMJo39UrtBxS6yy6rGWTQqr6i+knF+fzmke2f4K6jWld2UmJA6CUM3e/Rd8DWY
	Z22+4b/J097n9SqSTLg8rcxJIOzeWEYZQS+z86mvkU1cV6KhTS1tjRBOpMdjb58vS9OvQqFUceW
	9df+xC7YpGqubfBj0hhGO3cK4Y7GNdWZFiJZQdv76W1et/Si8Iem64WMRT5SSF6kY6NEeISFWrQ
	LkPwfr8XZx71qS6A==
X-Received: by 2002:a05:622a:3d1:b0:51c:a2ea:64d3 with SMTP id d75a77b69052e-52ce61c772cmr136015881cf.35.1786012547957;
        Thu, 06 Aug 2026 03:35:47 -0700 (PDT)
X-Received: by 2002:a05:622a:3d1:b0:51c:a2ea:64d3 with SMTP id d75a77b69052e-52ce61c772cmr136015161cf.35.1786012547344;
        Thu, 06 Aug 2026 03:35:47 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5b2f623d7d9sm662047e87.21.2026.08.06.03.35.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 06 Aug 2026 03:35:46 -0700 (PDT)
Date: Thu, 6 Aug 2026 13:35:43 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Stanimir Varbanov <stanimir.varbanov@linaro.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Stephan Gerhold <stephan.gerhold@linaro.org>,
        linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>, stable@vger.kernel.org,
        Daniel J Blueman <daniel@quora.org>
Subject: Re: [PATCH v2 01/12] dt-bindings: media: qcom,venus: Add context
 bank subnodes to common schema
Message-ID: <npojagmk7x24wpbqcmzg4mijscqz63aluh6lj5uaciztzl53wl@ld342uighqaa>
References: <20260731-vpu_iommu_iova_handling-v2-0-da52b5228dbd@oss.qualcomm.com>
 <20260731-vpu_iommu_iova_handling-v2-1-da52b5228dbd@oss.qualcomm.com>
 <20260805-dark-voracious-jacamar-6aae4c@quoll>
 <7a546bc6-a2b4-457d-ac27-05fc1cfe17f5@kernel.org>
 <m4rccl6zsdzmkzntc3njv3uczcppva3passjr5ukmru5q6rylx@wlwha7ydttfp>
 <163c24ba-6b78-44bb-afe9-3dcbb4d47475@kernel.org>
 <zqpgl3esozn4dgnm7remmwmquxasyc4qpyh3fgcdfblmn2xe3g@vhp5umdahvmi>
 <9921567d-4b3a-43b6-bf5e-eb0e92102e34@kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <9921567d-4b3a-43b6-bf5e-eb0e92102e34@kernel.org>
X-Authority-Analysis: v=2.4 cv=VNPtWdPX c=1 sm=1 tr=0 ts=6a746384 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22 a=MRPDAXt9WHeQRGDHguMA:9
 a=CjuIK1q_8ugA:10 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-ORIG-GUID: sFJ62TIoTO1-E2ViNCPD-kPvo-YPtg0f
X-Proofpoint-Spam-Info: AW1haW4tMjYwODA2MDA4MiBTYWx0ZWRfX5qzRyS6qiC+G
 Ah1h+MTXQhSQD0UoxRP86H9Rg4cdevrAol1RpCFP6r198Y1czFv3N25XK1M90SsXCmAyNxy3t+f
 dpkJQS5ezVv2FT6VkXd3yZDRMEs/7eE=
X-Proofpoint-GUID: sFJ62TIoTO1-E2ViNCPD-kPvo-YPtg0f
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODA2MDA4MiBTYWx0ZWRfX3zVTC8zOUGK/
 jQxPqkKjL0HBH76lwqFsDGeHZTICsJkB69kk2HoPwWEsVN+M8vvym6fkINdMMXH5pwqaAYcKiC3
 flEoXHesiKWUDk1w9Ax7Ato4bLWoi7qHpd3XZLlaFZfYeVAw/GijPwYPcl3SvdURC6KvPpbv8LX
 qokJST6uII3FNJeBNeBbg64sErC13A/KHD6AuesEECuj5ev2E7W0wmEUW3GzVCU7BvysqkBfwm6
 MZRpfouLwEts8U6oVLn4NR2qbwcqr5lxtw9InbNTUKYC2Dah/G7RyvmUuLwCSWPVrV44KBOa/vX
 EuMC6nCeMwB4fp5zsiHs0Fxf94mbTVkkVBFUHsfyLxmXBaMssQEFYEYiyBBrbbE03xRXasBbwvM
 CpapvPITNxVcH1ZDmIbOLQFY5QltvvNMnFlhOCe4IFB322+EIRnhx3LV8b4geri26W6QX4GgaSR
 4dn4fAFBuPEafq9vb6Q==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-05_06,2026-08-05_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 bulkscore=0 adultscore=0 impostorscore=0 priorityscore=1501
 spamscore=0 suspectscore=0 lowpriorityscore=0 phishscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608060082

On Thu, Aug 06, 2026 at 11:36:45AM +0200, Krzysztof Kozlowski wrote:
> On 06/08/2026 11:22, Dmitry Baryshkov wrote:
> > On Thu, Aug 06, 2026 at 11:11:09AM +0200, Krzysztof Kozlowski wrote:
> >> On 06/08/2026 10:46, Dmitry Baryshkov wrote:
> >>>
> >>>> dma-ranges tell how this bus - so venus/iris - performs DMA translation
> >>>> in respective to parent. Address/size-cells are obviously also needed if
> >>>> this is a bus with addressing.
> >>>>
> >>>> But there are no children with addressing, thus what sort of bus would
> >>>> it be?
> >>>>
> >>>> It looks to me that having here both:
> >>>> 1. dma-ranges + address/size-cells
> >>>> 2. children without bus addressing
> >>>> is some sort of abuse of the DT syntax. It is allowed, but does not
> >>>> really represent hardware.
> >>>>
> >>>> IOW, dma-ranges alone feels okay, although unusual, and it states proper
> >>>> DMA translation for this bus. If you add address/size-cells, it means
> >>>> this bus HAS addressing and thus YOU MUST use addressing.
> >>>>
> >>>> If my understanding is correct, then solution would be to add addressing
> >>>> to the children (so unit address and "reg" property) or drop
> >>>> address/size-cells as Rob pointed out. [1]
> >>>
> >>> Doesn't dma-ranges require address/size cells? In the end, how can you
> >>
> >> I think it does not require, at least how I understood the DT spec,
> >> unless you provide actual addresses to the property.
> >>
> >> IOW, this requires address/size-cells:
> >> 	dma-ranges = <0 0 0 0 0x10 0>;
> >>
> >>> specify the DMA address if the device doesn't have addressing at all (or
> >>> MMIO-style addressing)?
> >>
> >> Yeah, that's why having here children without bus addressing is
> >> confusing. I would interpret it that, children are not on MMIO bus, thus
> >> the venus/iris is some sort of proprietary bus with no mapping between
> >> parent MMIO and children nodes.
> >>
> >> If there is no mapping, then we do not have 'ranges' property. But I
> >> could imagine that such no-mapping bus still provides access to system RAM?
> >>
> >> Actually this feels like a huge stretch, so I tend to think that the
> >> only reasonable option is to have children with MMIO, which would make
> >> it explicit: Venus/iris is a bus which provides translation of both MMIO
> >> and DMA addresses to the parent.
> > 
> > But there are no separate addresses for those subnodes. Would you prefer
> 
> There might be some or maybe these should be the addresses of DMA?
> 
> > them to duplicate the addresses of the parent node? Or would the
> > 'ranges' be enough?
> 
> I made mistake earlier - 'dma-ranges' without values is not described in
> DT spec explicitly, but should be treated as 'ranges' without values,
> thus direct mapping from parent to the child.

Documentation/devicetree/bindings/iommu/iommu.txt:

  An empty "dma-ranges" property means that there is a 1:1 mapping from
  IOMMU to memory.

> 
> So it also requires address/size-cells, just like 'dma-ranges =
> <mapping>'. And dtc checks/reports that.
> 
> I think therefore now that the binding is unusual (because no bus
> addresses of children) but actually correct.
> 
> > 
> > Or, thinking about it, if Venus / Iris have 32-bit addressing, then
> > dma-range should probably define the limited DMA range.
> 
> That's another point which I also raised to Vikash already - mapping
> should be restricted to 32-bit if this is how the child devices operate.

Souds so. Then we need a non-empty dma-ranges.


-- 
With best wishes
Dmitry
