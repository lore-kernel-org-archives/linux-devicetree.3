Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0215A403E94
	for <devicetree@vger.kernel.org>; Fri, 10 Jul 2026 12:28:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783686506; cv=none; b=pYxaoLHPh6QMQUwiqzGBBJRCVwv3XvAPQqJyIlSLq+XRAfq9ZcsZl65fSi1dI+9YZRaHmW57cMRsREMmOkT0JqIkdzPqqMC1Uy6VVBagscHvlP6mq9zr085Rbs09Yq63D6UzFiT3kOZTvXtkg3XxwZ4K3c37DzLzYrxrI76Mvr8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783686506; c=relaxed/simple;
	bh=x2yLChwyDBlhoPwQp2bdOLo9LLSk9T4KgY8wi9Fdf0E=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=a/xKAgZRN0Fv2lSaa0KGKaYK0X2/22UbRbVAu2JRDe/0dXAZsEut/+MYIl83S8uVE0JZ540+iPGnWwPW3AwtM/zBu+FRHggLrac+eciMfx1XR2W5oadBptXsoX2yrP70n66jJ4aRWH4s4V5lJP5Z9Su244xB6GD51uDUNDKHum4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=AFKuD/aQ; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=VygyrRBs; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="AFKuD/aQ";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="VygyrRBs"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66AAmZfL486444
	for <devicetree@vger.kernel.org>; Fri, 10 Jul 2026 12:28:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=pdrLWzgNx+QR5fQ2eGSJkfqM
	qM4R10g9Ep491Uwct/c=; b=AFKuD/aQoo6Ty4FYZvx24pIjl0tOpgFnkWeAidru
	dTo64hal/o7ehck4z3Sg7bLE85+AknoBrZ/AUB1ckdECFnyvW5KpqCrHFJThls4F
	uESqDesfQDfchrxgdjLuiI6pVNn1+C6LFts+QH/zFNz6Dd9Y4z3qKxQ8R5XXjfsC
	7vu0KbbIEqTQTK+4rTRWC/8XRPzMbXb0MTWweUQxW9kPhdf390WTtfnoDLr7mfkJ
	DcA9dxECg7vvXWvbLtLL6Pjsg/Cb97/iWgqGNqPXqaD09FDlgcTXQj+BpfvxJIZQ
	O4D52EU5FdFA63bquIVAef5+nWCR8WrrpaAYqXt4HDSh0A==
Received: from mail-vs1-f71.google.com (mail-vs1-f71.google.com [209.85.217.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fajwtayrj-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Fri, 10 Jul 2026 12:28:24 +0000 (GMT)
Received: by mail-vs1-f71.google.com with SMTP id ada2fe7eead31-737435677d8so904986137.3
        for <devicetree@vger.kernel.org>; Fri, 10 Jul 2026 05:28:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783686503; x=1784291303; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=pdrLWzgNx+QR5fQ2eGSJkfqMqM4R10g9Ep491Uwct/c=;
        b=VygyrRBsfLJry6B8NFQcA+rg3hoEWA85qEjK5nfW1QrKagr+RWINhgw2IsljTU2r4c
         hvnPIYk2vDUhmn4UrRpnogT33smTQtbVZe/urRNIb9XdQ1WTL3BSZqIYmOceoP9VUaWJ
         WPRijpo+BDvNsLWIUDWpt9o787a6YaxpdLXr+1qot5EmMXig7zhXH4vZL0Ljpi9u6pv6
         xzv91T8Opbuc1saSMLHomtm/ltMch/kGhJH+60oH9/X/JMkprhP4idFJ+NDx6ccA7zvB
         w9qT0Q/ebRIQelv8WE0h6q4qtwZ27QJ24wHAZfA9CzZ3rOY2hAePPDiMDotNaPN2Hc58
         nG4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783686503; x=1784291303;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=pdrLWzgNx+QR5fQ2eGSJkfqMqM4R10g9Ep491Uwct/c=;
        b=Z0iHZujr5mvZmKyiYT1v01A8od5seIZfRnzAObC+LkzrPyi4BCDOn1uzoFo6WYeOmw
         fZHs4TAC8h2STVVezRru4vCggCKWvK7n0b/fqAxFGbKhWpOpSzV6wMs6iGZwcSa25cnW
         sF04gpcYnjEXPBkxIG5snMnXGny8G/u+f7lHPX3O3wAayf8Qx2bWOP0tfIN4aVp0qU8L
         5EWBlJeOv+aJdPlZcK3hWWsQY7hY6hqWBsASnPkG0zYNksL8FUIH7vN+y4XNYV2125YF
         o4JzjZ3nxIdkFMhcVp79lg6ZdCZk6ZzbsdPro3omtGzyz0e/rKdpd/c9xT0H+Q8Zo+8s
         YsVg==
X-Forwarded-Encrypted: i=1; AHgh+RotJYbRHS3qKhtRBxfy5XUgzDq5ciPsh0uH9+4M7ybWg0s2tti1JZQrwFVTD/ibge9wUz6F1ZfJ33u4@vger.kernel.org
X-Gm-Message-State: AOJu0YyfDBGd7ueC7dDeyrY1ZOg52l7DT/rzDjPB4DIKP3m7wPzv7sKL
	AHK3Yym1AYU6FaHz6rAmJvAXn9UDi3erbgMKpikFAbZwneFnIEMTQqfxStd7xYiY+nCAOXSkemJ
	F8eoUEtcanBLNEGtlMt89uJsu/DZwGgDy5rCzKeKXJ6obW06kjG/awvSetKzj+lHG
X-Gm-Gg: AfdE7clfAhF3Re2B2nu7Coaw4jQ1v3hwtuRH9JVute4n38kcRKvPJH6aef4srchxQAq
	DLF/KpVGHA/c6jjr+3U3ByKjeERmNvlv4KbNoEI+XZtdYZNuALyMoOq8MUgM9kBKOKcSebatGzW
	N4ryXQ3qLnmvz7XFHx7ykIrTHb/TBGXE5kCMXmdsZ0BU69xhIxyIeqnJAatIk/66ZDLRPkTO8HX
	LvoVYeCY8OWIbTFjigSFSopSc50ihPLSr3HXsQ5pssXuqUS291WnM6Ggg1yxUp0BtisXwA7/0H2
	7s/z4rZja4S4v4jt0Vtrk1SM9SKt/7B/zz5GCWPAhNM50rRYbkFaUEtpUjo1QRns2pJDdzXu4cn
	HKj/sXdaBd18YH8EXIk7IVhsBM6T0MXN2cVEyRhqmevRK6vPW6PfySOWeR6uIKmeoRKU2uotPPe
	Y9eQ8GsxEnnTBcgAFbpGf6Gbc9
X-Received: by 2002:a05:6102:508e:b0:739:15ef:cdfb with SMTP id ada2fe7eead31-744dff7d21emr7063861137.5.1783686503109;
        Fri, 10 Jul 2026 05:28:23 -0700 (PDT)
X-Received: by 2002:a05:6102:508e:b0:739:15ef:cdfb with SMTP id ada2fe7eead31-744dff7d21emr7063826137.5.1783686502597;
        Fri, 10 Jul 2026 05:28:22 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5b01ca4a297sm582454e87.7.2026.07.10.05.28.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 10 Jul 2026 05:28:21 -0700 (PDT)
Date: Fri, 10 Jul 2026 15:28:19 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: Bryan O'Donoghue <bod@kernel.org>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Atanas Filipov <atanas.filipov@oss.qualcomm.com>,
        linux-media@vger.kernel.org, loic.poulain@oss.qualcomm.com,
        mchehab@kernel.org, robh@kernel.org, krzk+dt@kernel.org,
        conor+dt@kernel.org, andersson@kernel.org, konradybcio@kernel.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org
Subject: Re: [PATCH v4 0/5] Add Qualcomm JPEG V4L2 encoder for SM8250
Message-ID: <l5fz64drffgrep57hj7kwc7v2drbg6kdkw4f7wxrmxf2kjjhsv@pcyyjtzi7jlc>
References: <8116c54e-4050-4e9d-b236-59d74846bd57@linaro.org>
 <8a09875d-af5f-438b-b947-bc2b61219b70@oss.qualcomm.com>
 <c8c38ec6-4422-4c91-a249-20bc20260e73@linaro.org>
 <d0768c15-453f-4d3f-8110-886a5c697b02@oss.qualcomm.com>
 <d5407ab1-1af7-4678-ae67-5cf30ce8fa4b@kernel.org>
 <VoXmpDKdgY_XxAvO5tkDze4jpmMzSuKTmIISTejJsbIO_FIO1JFfUBlaPkNdb14E95zf_qwtDB6myQ2wdRCh1Q==@protonmail.internalid>
 <8fc1ddfd-0f77-4b67-b9bd-33fbd60e2046@oss.qualcomm.com>
 <54ad9b8a-7596-4bc7-a1c3-7230cca21360@kernel.org>
 <wbjec4qhzkpvdfnrvffk7tjmlvli5q2jiuzdp2iqt2cbf2uat7@usg2mizurxpp>
 <29bbcc9d-a0b5-4966-a195-1702ed514a4a@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <29bbcc9d-a0b5-4966-a195-1702ed514a4a@oss.qualcomm.com>
X-Authority-Analysis: v=2.4 cv=XOYAjwhE c=1 sm=1 tr=0 ts=6a50e568 cx=c_pps
 a=P2rfLEam3zuxRRdjJWA2cw==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22 a=xQqxz70HCiEPHx7muvEA:9
 a=CjuIK1q_8ugA:10 a=ODZdjJIeia2B_SHc_B0f:22
X-Proofpoint-GUID: Cllme5XY42eyKphG52TWw6F4rhnGhJJc
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzEwMDEyNCBTYWx0ZWRfX0MxV7fvdSmCx
 1JLv6PO++BSmvb9XVYrEwHbzULugvxSZq5WDT5XMuzMEdTQjwI5SIEqGtenhyyPHeTSBGPbEVS0
 AcLivFx2z+wD9AWlfclqd6upPvQlZ18=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzEwMDEyNCBTYWx0ZWRfXwPUMAOzCzKgB
 E3q5YqgGHxfL/8A/F3p6t5hbBflx/7nhLFd4VHquLfr+M1frrTL6iS4dkXvOnJ3WmaFcY1pOToO
 muEJIqG/yM0na4KoA7Lk6nERQIp14VBvBl1zbEKG9XhGMsukk2L65sPAgKTXiOJXq+WGhr4WDdt
 Rlzay2YIkSLlJYN93bwl3KusSuDEQKK07qfk+VyYcaMQgn5F9QX8PZhLOOTD2vY9DQT8wrWpqEK
 3iTt7YsdDCzN4jRo0h8bkEs7I0lTVk4sY5G159a1+HqMyrZtSdj5Wd6LQgM57sDRWS/SfrOlqZI
 JXqPq7rcRaKIh6uyFtK4atahTuqehOz2qe7JLSxzQJL/QR6JHCsvGrMe239w//YLRzIYPpZERwm
 CzLZ5vKveMwFhjF6AMT0y4QIptjc5KfWxVsc1SBXA2TwipSp3hdMQJLXH1oEWLv6uspM9NC0XLC
 1LowsvtIpnPizqI4+4Q==
X-Proofpoint-ORIG-GUID: Cllme5XY42eyKphG52TWw6F4rhnGhJJc
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-10_03,2026-07-09_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 malwarescore=0 suspectscore=0 adultscore=0 bulkscore=0
 spamscore=0 priorityscore=1501 clxscore=1015 phishscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607100124

On Thu, Jul 09, 2026 at 08:16:21PM +0200, Konrad Dybcio wrote:
> On 7/9/26 9:33 AM, Dmitry Baryshkov wrote:
> > On Wed, Jul 08, 2026 at 10:21:43PM +0100, Bryan O'Donoghue wrote:
> >> On 08/07/2026 13:19, Konrad Dybcio wrote:
> >>> On 7/7/26 12:41 PM, Bryan O'Donoghue wrote:
> >>>> On 07/07/2026 11:11, Konrad Dybcio wrote:
> >>>>> On 7/7/26 12:00 PM, Bryan O'Donoghue wrote:
> >>>>>> On 07/07/2026 10:24, Konrad Dybcio wrote:
> >>>>>>> On 7/6/26 3:37 PM, Bryan O'Donoghue wrote:
> >>>>>>>> On 06/07/2026 14:02, Vladimir Zapolskiy wrote:
> >>> [...]
> >>>
> >>>> OK, I can see how this thread is confusing.
> >>>>
> >>>> The idea is to start to declare sub-nodes "on the road" to making camss into a bus. The legacy binding we have is really for the IFE domain - that is CSIPHY, CSID, IFE.
> >>>>
> >>>> Right now the camss binding describes those things - so linking say OPE or JPEG back to the thing that describes those isn't right.
> >>>>
> >>>> OTOH we_want_ to make the top-level binding into a bus, we've discussed that several times.
> >>>>
> >>>> To transition from monolith IFE-domain only, to camss-bus, we should have the sub-nodes fully describe themselves as "camss-bus" doesn't exist yet.
> >>>>
> >>>> Once we have compat="camss-bus" then fine, make that linkage, I fully support that.
> >>>>
> >>>> That roadmap BTW is why I'm asking Antanas and Loic to make JPEG and OPE sub-nodes of camss - but make them complete sub-nodes - power-domains, clocks, nocs, including the TOP_GDSC.
> >>> I think this needlessly increases the amount of combinations we'll
> >>> have to keep supporting down the line (with a ton of compatibility
> >>> boilerplate code)
> >>>
> >>> Konrad
> >>
> >> Fine.
> >>
> >> Lets drop the bus idea then. I'm happy to close the conversation as
> >> peer-nodes.
> > 
> > It think, this would close the path for upgrading existing platforms to
> > split the driver / bindings. If all IFE / PHY / etc. are subnodes of the
> > CAMSS, it is easy to play backwards compatibility tricks and
> > reinstantiate devices on the fly, pick up only certain resources, etc.
> > 
> > If they are sibling nodes, it becomes much more complicated.
> > 
> > I might be wrong here. Maybe we really should try a simple (heh)
> > experiment. We have your series which adds CSI PHY as a first class
> > citizen. And we have existing platforms where CSI PHYs were packed into
> > the camss node (and camss driver FWIW).
> > 
> > Which way of representing device nodes makes it easier to migrate
> > existing platform to the CSI PHY driver, while keeping compatibility
> > with old DTs (yeah, ABI, old DTs must continue to work)?
> 
> Quite frankly, I don't consider the existing (meganode) description
> any valid, and would vote to rip it the second a replacement is
> available. But once, not N times.

Rip without providing backwards compatibility?

One of the options would be to follow the 'venus/iris' approach: land
new set of component drivers, which target new platforms and provide
minimal support for one old platform (maybe via autoapplied DT overlay
or other similar techniques). Then continue migrating and phasing out
camss driver for old platforms, while adding support for new blocks in
the new set of drivers and ripping support from the camss driver after
some migration time.

> This is not to blame any of the original implementers, this might
> have seemed like the right idea for the tiny subsystem on msm8916.

Maybe...


-- 
With best wishes
Dmitry
