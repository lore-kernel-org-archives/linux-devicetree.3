Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792798614;
	b=FJR8Ax0+ycMXoD5ADedgK5v5Vb6APDRZVluZXQfiw1D91LVnIj8zmSiL6iq1NUcx/fTk
	 cNSl5zmD2mBWVg8a7Whfz68Xr0F+JOXhhWhCvltLQbWf3ghAxukXSA0wLtm387zgsDOnr
	 uzMaEH5JMjtzpFiD40oko+sWZUseMv1/xfvI+fqUZ88mVMZNVgDP0BZsbJG5Xc/0tNFzR
	 gnxcuP6AVfPv8t2rikGjjLqBZ8C57xP5woiePYny5BeR7oCA+QtKvsF+GudWWXWY22t/U
	 QSAbflX749Vk6rLFXzVPo8G2bWnrZ96tiHp6SwXIFFOdiz9E2BHeUHnD6FUz0ntdRUw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792798614;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Date:From:
	 To:Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:Content-Transfer-Encoding:In-Reply-To:
	 X-Proofpoint-Spam-Info:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Authority-Analysis:X-Proofpoint-GUID:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=Mgo2dnohmbku8+6gd0EG9FENz+puwwm3rQ80la31iuE=;
	b=KnhjCzozGB2S9vFaQXN6e+lUIzsj6OQANi3sKbPb67XXmqa3IgmAK3RRdSAMTw9pu1qK
	 DPr6xgORv/e38DvpzZwI4MKH26+KOouJypddrLLzijf5+hocKwthruMFOofIBa7fqvGv/
	 0ioFzX1btuImXPqZqbL/8oqn2DILvNaX7IxHi7ySD62wbJn9gUlugkPvuvVuFK/rMBQE2
	 BanKP8mn4MmVCfsTe30hpsLkcfNdXRO9P057BuWLocBMMjubif58TaVGizy+2+Khooq/M
	 SiMHWGpXFhTG6kf3Cn0En/5bEYksx8XiLCXBBHSlKcN+2HJrKtr8AnmGzOz0M1JBPJg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=moYOHMFI;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=c4I47cja;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0F558606A31E
	for <devicetree@vger.kernel.org>; Fri, 23 Oct 2026 23:36:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0F558606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=moYOHMFI;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=c4I47cja
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69NLunOV3115210
	for <devicetree@vger.kernel.org>; Fri, 23 Oct 2026 23:36:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Mgo2dnohmbku8+6gd0EG9FENz+puwwm3rQ80la31iuE=; b=moYOHMFI/3MRcJDz
	ZA8WnN7yEfSkWsyYp8v9+QFucDkTCQC8SKcTMqg6RzdAtSjs3QzyZzQWJj0B/Ck0
	RUVQ95Vua/zwF3kcxhebMt86PgFMZy42QbaGG1wXhzJI9u5QVSOEYPxzcdwRGL5g
	v8e/Cwpg5r/HTWQirguGNfljG9bsB9eUsY068Ty7mtfFWZ0WCbFD0USBCprfm2Cv
	tP4D5MY2tkdIdOtYAMZUXZa5Di76LOUTGCgvyc8GSjD9Fx7Ln0TieTpXRURC96qg
	+UKV4UvxmqsF+PWNhqI2HT9ElC6Wn/6oWhECs9FABEYmXr70LNHco9j/K0M4FKGi
	fs/lwA==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hgcrt8w4k-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Fri, 23 Oct 2026 23:36:53 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-93caa0ce0cdso175560885a.2
        for <devicetree@vger.kernel.org>; Fri, 23 Oct 2026 16:36:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792798612; x=1793403412; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=Mgo2dnohmbku8+6gd0EG9FENz+puwwm3rQ80la31iuE=;
        b=c4I47cjap9cm8QKDpMAe44buBkGC0RmgyOJxfnqJy/P6NQTR/NvdfBXC/UZbiCcVcZ
         cswdAQ23gXOMs4spvSMdjP8zz9BOh2+lfHs9l+5XwjzP5i5RHXwWmTPrjO/KUMsSfrLK
         dzPzXNDcNheRRG9P+kcdjK6ymP2xmlyoYvEzIwRU3pxT4gadeAobSGFRsSS0sMX/N1ph
         ojyKlvK1f7jiWEPkfzAx+yDCyWjBvotgmoZihZVmDNSndiCZypAw4OapBMiRa9ksjGNi
         5N7w70Og+N+PSEUcUWRbUtmyvWHD0vj/sAJexDvWT+oX3aQTt47yPwl6wbx1Z0x+cBc4
         yPFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792798612; x=1793403412;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=Mgo2dnohmbku8+6gd0EG9FENz+puwwm3rQ80la31iuE=;
        b=A7m6GLBYTOzVykE+qxnttGuYkjdI8887AN+hYG3MJnzA98w0i+lHuVfCuFtQwF12ud
         c7n9WS0hdY+zWKH344fne3wlIx4rIOF4G653kO2ml2xlQ0tFJaCxDk/r734f2SDBdwYB
         Bmzaf0cwti0ZlO6bXeyWfBD/tAh2luQhXo0M+rbQ5hBqMxOYspDqb3yyQQG0NGq2IHJM
         RfftpSpvl6JMl5UQkZZv55Rv2WSDmHuzB1GYTjYly0QL663IPuPA1cWrdlvxAoIrUUZq
         angoixsYk8JEI+CTdXmXw7UbgqBVuqKD5dKV6NZm/zues+p86Z8ff8Ff+Ui8bi1iQh2v
         Tqrw==
X-Forwarded-Encrypted: i=1; AKwUvBwX+aWWi/IAMicsf1TOaQzMI3l+o9t2Jf6GP9Yb9HX255J+StJmrPqsSMgNYOsUAcyejQm9n34yPmG7@vger.kernel.org
X-Gm-Message-State: AFq9FYK2mHxjZlnlK5ZA08APdqxjFvs9Yl9ile/0UBH0XV6tVFj7nNYV
	ftOvlv1uEyDIVYLanUOfuptob2Nsq4hKCKdI2vkozMVd+AsWt9CAr+75+ELDuzWCOFKhx9vUoJe
	q/e6izXhurINqlDwQ/hlqEOsTsJjP8C0ql/ECyymWgv+vhR79GzyqHah3x+Kt0JlF
X-Gm-Gg: AYBFou2zSqyaCituPxIa6K2P1fN2nRBKcnLsp5J+wP1fW5NSmslFar/P7W+EueWMq0M
	6nr4/r6PPY7Aq5a3H6ucEOGlyCYUr1MQi5R9ROlzDf2e8IYFPY6QzuWK7qJmpeCbjcWoQmxuIN8
	VtktQaYMuSYwGPZxw6E+rr0O6A9Ll517RWvNKjscyAzKLxrdLws4DFhqR89T89zTHs+UdIg9GwE
	9fMUOFXdVqyG6fLQDsd1Tt+hNsUU2l716wYPNkq4Izy6xerVCoXgzlcrKw4d8LMHVCCrttvB40e
	/SX+dTzM90ZPgcxB8WJgcXlL+z0bZP5Syh3y58mp0KlXlIQwz7r7ziMXgzXH946TJ/XQK6UyIXN
	LOqFkniDc52dXj8KFoiOUSVId/qWA+lNdo1fCUkNWx1Z7+ww+T+LoIts420t2hqGsAcztFdYwPY
	LAa9VVyPnPuTgD
X-Received: by 2002:a05:620a:370b:b0:93b:eb9a:ca47 with SMTP id af79cd13be357-940ef938f5fmr84045485a.31.1792798611969;
        Fri, 23 Oct 2026 16:36:51 -0700 (PDT)
X-Received: by 2002:a05:620a:370b:b0:93b:eb9a:ca47 with SMTP id af79cd13be357-940ef938f5fmr84041285a.31.1792798611386;
        Fri, 23 Oct 2026 16:36:51 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5bfb7a6b051sm67463e87.14.2026.10.23.16.36.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 Oct 2026 16:36:49 -0700 (PDT)
Date: Sat, 24 Oct 2026 02:36:47 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Akhil P Oommen <akhilpo@oss.qualcomm.com>
Cc: Anna Maniscalco <anna.maniscalco2000@gmail.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Rob Clark <robin.clark@oss.qualcomm.com>,
        Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>,
        Joerg Roedel <joro@8bytes.org>, Sean Paul <sean@poorly.run>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>, iommu@lists.linux.dev,
        linux-arm-msm@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, devicetree@vger.kernel.org
Subject: Re: [PATCH RFC 03/13] drm/msm: look for lpac from dts
Message-ID: <o2zmplbtmoueumw3iqejfsdmucp5f66woa5hmw3vodbe66reab@syn2ashugzyg>
References: <20260705-descriptive-name-lpac-upstream-v1-0-01d50c3e0c99@gmail.com>
 <20260705-descriptive-name-lpac-upstream-v1-3-01d50c3e0c99@gmail.com>
 <rwohvfbsw2brpxrfg26egu5arwe6g7n2etelo33eegmu5cz65k@3syofuxzsjrc>
 <dc5aef2e-600e-4e97-b76b-dcc8bd72c709@gmail.com>
 <m4vwrqt6yyaawpvkyrqfzs3kbipbhygmtrhphuthl2gmjvkgyt@u2d3dnvl2phy>
 <54cb37bb-aaa5-4c5d-a563-acca4822dd35@oss.qualcomm.com>
 <t5gu6ciwmxdb2jghc44gtixdsbedkgy4yzke5sgawjrr2h362u@ahvhh3yfe6lx>
 <wtun2cfukyzxlsfiz2izsejd33k4jpapwqa3uqih5drcsrkff5@e6llkke5dayw>
 <1f6db59c-b7a9-41a1-8022-6713365fa09e@gmail.com>
 <fcb86c33-1893-47bb-80eb-20acd65f3805@oss.qualcomm.com>
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <fcb86c33-1893-47bb-80eb-20acd65f3805@oss.qualcomm.com>
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIzMDA5MyBTYWx0ZWRfX4sm8ghMoUmb0
 q7TzfjWg/Jp3HT1WTqYrzRfR5Z+AzP11fIwqnq4RmPR8BdokQeI56+13kucK9jpoxl6tLZ8Lw68
 JBFZZcfSPIpJ5K/H/Brsz03SA6kauLk=
X-Proofpoint-ORIG-GUID: KLkfgbTHs842_Y-PGbcR6-x_n9Ul187h
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIzMDA5MyBTYWx0ZWRfXwVz4mkbGrQkL
 V+yOq1WmzkILy6siaML47f0buwgB+wZjl5x3LGfSXIllWQcIEuqjTvU5K1hTckgbgCoOz+LhIRL
 z/CY3Baq3ZGeRv06bPlO/QMunFr1asZ6hLEwYaxO8UWsZX05XLXNuppgFcrYKeCSc3GXs7/cKhN
 HRX6sYCIiOQGJXaNJADSMajqB0SE/ZLRxii0MpR3yB/wWHPZhm/jNDIz6fUSVE2ROsTIBG6l3U3
 4CLE31w3d0/ltYFsjJPJfjC6RBhomK5D27jfs6cc9/faQaVQAt0qfy1Wo33s4pYrM+GTsQassO2
 /82LvJ32exjAMfmim2rso1daDbfqLIeKbYBXvz2v5nU8+gSESKa5Ek6gHllT7eTINRdx5UViIPg
 /1HiZHmtqsy1lqdMLM6ymzEWpsUCuSXiGo2JCf07yfFg9xJpB4gP9e8Y0vzfVfuZbE4lOrnHKe9
 isN2wf1XO1uO4x/ZvZA==
X-Authority-Analysis: v=2.4 cv=E7lYNqdl c=1 sm=1 tr=0 ts=6adbef95 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=xqWC_Br6kY4A:10 a=8nJEP1OIZ-IA:10
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22 a=VwQbUJbxAAAA:8
 a=9jRdOu3wAAAA:8 a=s7fkfekX88plzggl2-cA:9 a=3ZKOabzyN94A:10 a=wPNLvfGTeEIA:10
 a=NFOGd7dJGGMPyQGDc5-O:22 a=ZE6KLimJVUuLrTuGpvhn:22
X-Proofpoint-GUID: KLkfgbTHs842_Y-PGbcR6-x_n9Ul187h
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-23_06,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 spamscore=0 adultscore=0 phishscore=0 suspectscore=0
 malwarescore=0 lowpriorityscore=0 priorityscore=1501 bulkscore=0
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610190000
 definitions=main-2610230093

On Fri, Oct 23, 2026 at 03:16:27AM +0530, Akhil P Oommen wrote:
> 
> 
> On 10/22/2026 6:24 PM, Anna Maniscalco wrote:
> > On 7/9/26 9:39 PM, Dmitry Baryshkov wrote:
> >> On Thu, Jul 09, 2026 at 05:54:23PM +0300, Dmitry Baryshkov wrote:
> >>> On Thu, Jul 09, 2026 at 07:12:39PM +0530, Akhil P Oommen wrote:
> >>>> On 7/7/2026 10:09 PM, Dmitry Baryshkov wrote:
> >>>>> On Tue, Jul 07, 2026 at 05:02:43PM +0200, Anna Maniscalco wrote:
> >>>>>> On 7/6/26 5:04 PM, Dmitry Baryshkov wrote:
> >>>>>>> On Sun, Jul 05, 2026 at 09:13:37PM +0200, Anna Maniscalco wrote:
> >>>>>>>> In order to associate the SID used by LPAC to it's own domain and
> >>>>>>>> context bank we need a separate node on the DTS.
> >>>>>>> Can we use iommu-map instead of adding a new device using the same
> >>>>>>> addresses? You provide zero explanations, but it seems like you are
> >>>>>>> trying to separate a part of the GPU into a separate device, but it's
> >>>>>>> unnecessary.
> >>>>>> What I was trying to say is that we need to map sid0 and sid1 to different
> >>>>>> context banks.
> >>>>>>
> >>>>>>  From what I recall, so long as we use the same dt node, the iommu drivert
> >>>>>> provides no way of doing this.
> >>>>>>
> >>>>>> What kgsl does is having a node for the iommu and then subnodes for gfx lpac
> >>>>>> and secure.
> >>>>>>
> >>>>>> The address on the lpac device doesn't really matter. I have very limted
> >>>>>> knowledge of DTSs but I think we could just leave it out altogether?
> >>>>> I think, you were poined to the Glymur Iris patches. Another option is
> >>>>> the QDA driver being submitted too. Both ot them use iommu-map to
> >>>>> describe the same usecase - a set of SIDs which are used by the device
> >>>>> but which should not be a part of the defaut set. With it in place you
> >>>>> don't need to have separate qcom,lpac devices, no additional properties,
> >>>>> etc.
> >>>>>
> >>>>> I'd recommend following the same approach.
> >>>> iiuc, the conclusion in this recent thread is to use child nodes for a
> >>>> similar case:
> >>>> https://lore.kernel.org/all/20260618151745.GD231643@ziepe.ca/
> >>> Let me check internally.
> >> After a brief discussion: it can be either, depending on what suites
> >> better (and if you can persuade DMA / IOMMU maintainers to let one extra
> >> bus or not).
> >>
> > One thing sashiko is pointing out is that new dt should work with hold kernel so, in general moving sid1 from there would break it since old kernels don't know how to handle them separately.

The rule is the opposite: new kernels must continue to work with the old
DTs. If the new DT breaks with the older kernel, just specify it in the
cover letter so that Bjorn doesn't merge DT changes before the driver
changes find the way into his tree.

> > 
> 
> + Bjorn/Konrad
> 
> Not sure how strict is the requirement for compatibility with older kernel version. An
> option in your case could be just do an override in the board dts file of the
> Steam Frame.

Anyway, would it be a problem? Does GPU normally use SID 1? Or is it
only used by the LPAC?

> 
> -Akhil.
> 
> > Not sure how to address this.
> > 
> > Best regards,
> 

-- 
With best wishes
Dmitry
