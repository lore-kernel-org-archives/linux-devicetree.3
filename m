Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6BBB73C3BEA
	for <devicetree@vger.kernel.org>; Mon, 30 Mar 2026 11:37:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774870655; cv=none; b=JRBS7A7DQkxDPvqqPV3/b17KIs7krF64SGG46X7YHHY8ulY45UOCkBGnA+hzp6xEsv2vMKOUxWJNYS+lnRQbK4dvFBLW/aSBW08j4oFOwkKVpEIULjHA0qFqcT7jq1g6IIoo1tJ3RM59o9IRW4ATnTrZK6bMZ7VlqxAj8K+eZkM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774870655; c=relaxed/simple;
	bh=NXem4svfbugmXnGLpNgej43KjDUANeET2Fbk+sNr+zg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Gys59yVQRXJVW71YYXzvF1bvUyZGGIFChAOisIDbCrZ2m74TWf5fMpSJt5X1xcHixCYgUFawVnUO4zgqHVaFbf1IGiIbozlr4e6ljf+Y6Xry/ArmCWhu5KAXwiImnE+aHo1Cwb9Oz2W/vgaDn5CTto0ibDKuxiv1m+2PK7AdtmQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=psJYxnZj; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=bgZQ0PAh; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="psJYxnZj";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="bgZQ0PAh"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62UA2bU02194795
	for <devicetree@vger.kernel.org>; Mon, 30 Mar 2026 11:37:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=p/ruGGNRKU0g5yns10YX0dig
	SpCelxxQ4SEexeWqaZU=; b=psJYxnZjOYQ1zY2ieQeXs8bGDS4mK7sGo/bkNJaA
	Nqz55XKh0v+uI95NvgXZGXUrfmw7Q5P+0F3/0S6oA6ceXMaSt/53gDZwL+gJSGaw
	jhz1w3X/wU0WlcCKhv10q/Q/xseT1fy9BU9b+xB52MYBx7Ekai8pJ77f59b/D875
	07Mv6YjyrhX8xaPQEOR4jdzVpxKna8jSvyhw1oYq2SFN7inCm1jGRvQd6+d9HB2p
	Pkhk15wthTv+zPTLbDUpkaZlFXpx+8QSZGS5K62tJ+PGhGGoB7opeT/NKg+G6jLM
	MJdDlXOa69TSRdxwmj+g/mCQoM/T0hg07A8IQjD5vbKXUQ==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d6v9c3vvr-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 30 Mar 2026 11:37:33 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-50b4fe4ff7bso179326471cf.0
        for <devicetree@vger.kernel.org>; Mon, 30 Mar 2026 04:37:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774870653; x=1775475453; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=p/ruGGNRKU0g5yns10YX0digSpCelxxQ4SEexeWqaZU=;
        b=bgZQ0PAhvp9HQqxPNus5HWL09Txk9ySnaNx2/lqg90V7mFtuiOe6WhwN6yxKhInLnB
         CFbkpe8qyBaDKmnLswaK8hjafxliycAKk9ud3At6jJeLJI29Nsn4bioVpwozvxWjmEMs
         t/UoCtoXk0tTO3wBZZGrogbQ6YcrRhnqbkbe+TsDh9rR7Lt+lvINQOd8wLXvyYOyHZP9
         KvP3NprbkdLWGUK1UsfUY4DHGlxT8gwnojqN6mSU+axtE/jUDm1hJwNzxqXCFwGOq+P4
         4qT3cwxnUydGRlbIv8/5dbLH0LIWH4wIlt0skWWHdntIPq3tw1kG+WXqjalkt393H1WF
         3wkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774870653; x=1775475453;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=p/ruGGNRKU0g5yns10YX0digSpCelxxQ4SEexeWqaZU=;
        b=Im6fXfXyflXl5TwNwPyKemWuwBn67jkDkM8lZI7sL67tyV66L3DAQD9OVoaMPTZC9t
         tH/5TfVjzafg/sfCj3xvwuDDQwdOfT2AEtwKhy563NwbELfJNO637elJ3qhWZdeEJ62I
         NdZEwgWFiubiIk+0k6V8+CKWRkyMhvc1Dy+zRl2g8D6eiPd8jC8dMxMyPi5TXwhQnsLX
         dkGT129dbPWCOjcTbfRXPcY9uIPbAGMfTSGEGTBB5oPZSCBlqy2y+KjfBlrwJjZbDOfE
         jwxdTEwSJpvQrJYtv+4OAOIuU8e5a1krmkODgoUKr6vx2z3xCebTW1iCy8fhUpzUtr7a
         sm6A==
X-Forwarded-Encrypted: i=1; AJvYcCU3v8GXzgLJGE2AxbscMPBlHU2nKtHw81SGImWccCdMYF5sMsWBjtrm1px5g1DwtPGC/CrrCMT2+88d@vger.kernel.org
X-Gm-Message-State: AOJu0YzsTwuOM4PJHQeRpol2BkKh1qJKm2/ez2tixwgUvJ9SHzRslebX
	7CN30/mjWH9ZA/khwGi4ntAYmL+NUk+1bgevjvw7WGlHPO3wRnqMySPyJVewL+rpk0PJSySfsc6
	XUAy8rvq+FlJVioJmGScpA+PUL/FwfelS5EkhJ9suz6CVp3eAuko8hktuR8U1rpQ6
X-Gm-Gg: ATEYQzxO6OpK+QdsQNe2U1wSGdgGRAV2w+28Nu6eJx1XYzqTksHiPe2p6ZkF77Oizmk
	u3YLfBE1NA/Oo4KpO4ewkj5/CjkwfvJg9VDzcI7xEiIRn3qajHwMD9FzFg+vher+8tEcdu0vTCO
	mYrRSZdAB0th45kCB4XVb1DpgYSp1BgfrveYYCgsw7wPPlMhUo4iQCBtCVaL18I/IizN1Rgjy9z
	K45F4yHNm1hkaXf6Da97KIY10nJgt7VeudQzZBQoreIcOQ42PG5HzDm8+beJyPVV7ZyXSOD7IOv
	xFkytVw1gSCepVc/YLfl81hUKs1jyj9/L+5mMjttpYTyI2I2yFJD6wzAxjxrLyTy3p+shlyp7pp
	fn/NRX7n3qKSI8haC8De0AaHSB1BiZqF2rDhmXa430JkHrBw2P56ghBBOpj/9mQ08/vKZRKVp1J
	svDr7MSL7N2AAGwrUWpxWggo3VhdsLi7FlBS4=
X-Received: by 2002:a05:622a:9008:b0:50b:6fbe:62b9 with SMTP id d75a77b69052e-50b994fa11bmr184972251cf.28.1774870652468;
        Mon, 30 Mar 2026 04:37:32 -0700 (PDT)
X-Received: by 2002:a05:622a:9008:b0:50b:6fbe:62b9 with SMTP id d75a77b69052e-50b994fa11bmr184971711cf.28.1774870651876;
        Mon, 30 Mar 2026 04:37:31 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-38c838da25dsm15165881fa.31.2026.03.30.04.37.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 30 Mar 2026 04:37:30 -0700 (PDT)
Date: Mon, 30 Mar 2026 14:37:28 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: johannes.goede@oss.qualcomm.com
Cc: Bryan O'Donoghue <bod@kernel.org>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        vladimir.zapolskiy@linaro.org, laurent.pinchart@ideasonboard.com,
        kieran.bingham@ideasonboard.com, robh@kernel.org, krzk+dt@kernel.org,
        andersson@kernel.org, konradybcio@kernel.org,
        linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        mchehab@kernel.org
Subject: Re: [RFC PATCH 2/3] media: qcom: camss: Add CAMSS Offline Processing
 Engine driver
Message-ID: <qq43xl3lsv2nq4ngn2hojleddxjmkgwclb2ajek5gvdtgyjltl@3tqg5ydhsxia>
References: <20260323125824.211615-1-loic.poulain@oss.qualcomm.com>
 <m61yNNvSrw6AIq7_-g2h7VQLmGJ_5iCLg5JTlfQDcL5LlBq37ifAeXw-K3AlRBck5Mb4uVQq0pzeBNAybQNk4w==@protonmail.internalid>
 <20260323125824.211615-3-loic.poulain@oss.qualcomm.com>
 <1ba54ec0-be51-4694-a79b-f272e76303d2@kernel.org>
 <X-Lw_zi1o015-V1Cv4dY_ik6SfTB8TTcLmn1l-Ta7UviYTJ6gwMBn4B4ulYwjd_Aetul5xUt0T6ln9E-Hl5h4g==@protonmail.internalid>
 <CAFEp6-3ziXJTYADOFj--rZL5TumroXuW+=SnUQ9XakRxHT-ypg@mail.gmail.com>
 <12194cc0-0960-486c-be7e-1a22d95de340@kernel.org>
 <rj2vb725he4yzfvjifzyxqpbqk5oztfaafp7sg2qes4qz3mlaz@z5dyoqod56d7>
 <7fc31426-3157-49c7-a30d-dcd7b181fcc6@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <7fc31426-3157-49c7-a30d-dcd7b181fcc6@oss.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzMwMDA5MSBTYWx0ZWRfX96NuBw4IMqjv
 FzeB3Aov884qS89YT74BFlMM/rmRv/ZZdSBjiDFYFIKnxKklXqaHhVvAQZY2sn50Cl5UEpc1SFi
 w/yfmFluRy9djGIKE9ewKjcrdy7Jjb5a+Hu95vzHfb4u89KJwaWrBXjqm3xfZYA3uFqT0NR8iDZ
 oDKx3NN71g7QpUhP2O5K3qBpsDKcCSaYaST2dnjudCEor57VL3btb+fYTIQIsayI+HTDbD8PTP9
 OsGLfngsS14D1xdKXgVC9GZV3d3XzVVsK9jX+JT1pnoGiR6wcMoUTDLp2oJcFtp4iJSLj+l0bws
 QZBNHI83Pk01LijFTlTHExlyauTTlL6p3r4wyVb+zb9R3XfNsZCrNjgRVFsLMB+AUHt2AVgtFAr
 MbMct5fYwQXp8EIz8lkCrndy/aSP/K771duv/n21XPPn4EjCbM2621DBZAksyToSuWudIGD+8/E
 cEDp/VZHOiqwkZ7JsXA==
X-Authority-Analysis: v=2.4 cv=EIQLElZC c=1 sm=1 tr=0 ts=69ca607d cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=Etol3jrWs0JhqEB7xPMA:9 a=CjuIK1q_8ugA:10
 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-GUID: -Jg4N1uaCtX2uw-3J7H3cn6U0tbg9o2B
X-Proofpoint-ORIG-GUID: -Jg4N1uaCtX2uw-3J7H3cn6U0tbg9o2B
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-29_05,2026-03-28_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 lowpriorityscore=0 impostorscore=0 malwarescore=0 adultscore=0
 phishscore=0 spamscore=0 clxscore=1015 priorityscore=1501 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603300091

On Thu, Mar 26, 2026 at 01:06:59PM +0100, johannes.goede@oss.qualcomm.com wrote:
> Hi Dmitry,
> 
> On 24-Mar-26 22:27, Dmitry Baryshkov wrote:
> > On Tue, Mar 24, 2026 at 11:00:21AM +0000, Bryan O'Donoghue wrote:
> >> On 23/03/2026 15:31, Loic Poulain wrote:
> 
> <snip>
> 
> >>> As far as I understand, CDM could also be implemented in a generic way
> >>> within CAMSS, since other CAMSS blocks make use of CDM as well.
> >>> This is something we should discuss further.
> >> My concern is even conservatively if each module adds another 10 ? writes by
> >> the time we get to denoising, sharpening, lens shade correction, those
> >> writes could easily look more like 100.
> >>
> >> What user-space should submit is well documented data-structures which then
> >> get translated into CDM buffers by the OPE and IFE for the various bits of
> >> the pipeline.
> > 
> > I hope here you have accent on the well-documented (ideally some kind of
> > the vendor-independent ABI).
> 
> The plan is to use the new extensible generic v4l2 ISP parameters
> API for this:
> 
> https://docs.kernel.org/6.19/driver-api/media/v4l2-isp.html
> 
> What this does is basically divide the parameter buffer (which
> is just a mmap-able bunch of bytes) into variable sized packets/
> blocks with each block having a small header, with a type field.
> 
> And then we can have say CCMv1 type for the CCM on the OPE and
> if with some future hardware the format of the CCM (say different
> fixpoint format) ever changes we can simply define a new CCMv2
> and then the parameter buffer can be filled with different
> versions of different parameter blocks depending on the hw.
> 
> And on the kernel side there are helpers to parse this, you
> simply pass a list of the types the current hw supports
> + per type data-callback functions.
> 
> And then your CCMv1 or CCMv2 helper will get called with
> the matching parameter-data.

This leads to userspace having to know exact format for each hardware
version, which is not nice. At the very least it should be possible to
accept CCMv1 buffers and covert them to CCMv2 when required.

> 
> So this way we can easily add new hw support without needing
> to change the existing API, we can simply extend the list
> of parameter types as needed.
> 
> Regards,
> 
> Hans
> 

-- 
With best wishes
Dmitry
