Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 21ED43BFE23
	for <devicetree@vger.kernel.org>; Mon, 30 Mar 2026 18:55:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774896930; cv=none; b=SC1YAuwk7CZjNy4vi1vQ5TLsOPAU1aoVm6KmuuH12zV3LSFRGG/usUFhncBc2C1gnGi38otL6vdlhfJNDmaDcp9vm4ROs/KWm7ydNJ+3lAhtFKmrjNYJHXtaf5mYnKqPoJ2fglt2XNyTfoF6HsVGlGUsjrAhB29vpcMXvXA0YPM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774896930; c=relaxed/simple;
	bh=lGafHO/0r8WWuHXe/cXHLeBbaM19s3GZJJKUga4SWRU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Em3M1a4G5SyhitVhjsuY+QcCAEIAYYtR53gZd6VJDdzTNuxs/6PVCXXfjYpDphRxyObF3Gttml0z702+Zj4QPqbtP1WtpQ4mwStl8W7t6SnBQWWmvFIzU0E2kpqOy7JWwRHrB6qCzy5o5yFut3o9IBDmcGdGLVV9eybEUBHoPHs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=S9g2ffJN; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=NtCXWk30; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="S9g2ffJN";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="NtCXWk30"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62UEDaIl1092014
	for <devicetree@vger.kernel.org>; Mon, 30 Mar 2026 18:55:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=j0H9FaWAU93pFITtwnjoYm1P
	ksncwdbCPSGTYYrDU6M=; b=S9g2ffJN07rxfiBSAuPyINoDRi41z3+uf5HL/fLT
	LdXcTsi0p0YeGGCzNlfMXKO/0fUWi0G009ec3cKgPDUZ9YSk11mvB+ha8H9/9l2U
	WZq3od3gACQ2+DTc8mM7Bjsj+S3+q3+cewvAjaf4p4yADJUlXdfYnw4349NyjSya
	xP2kJkkk45dCOfeJzX8RL6pcx2JAH0uA+jN6sRhw8OJHM/eUqTq445MBuxwfU7yO
	iNwi/CdYuB5qgNUEXt0vGaNeOBa+Farp2Fw++MZV7IK9QbCtsy4coZAFMBq4QD74
	hrXbb7JBB9/0bqFERsvCYCb/g1momcwzdCGM5S7N5TZDqA==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d7trd15e4-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 30 Mar 2026 18:55:28 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-50b31cff27fso47101171cf.3
        for <devicetree@vger.kernel.org>; Mon, 30 Mar 2026 11:55:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774896927; x=1775501727; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=j0H9FaWAU93pFITtwnjoYm1PksncwdbCPSGTYYrDU6M=;
        b=NtCXWk30mLkQaKm/9v0RRoRQlZ3ERswghlP2/7hd2J8gLsxJHhjImIzRFu4Kx6KLLH
         5FnHZgp0WuarePAieJfGmbb3QHFRh18S57m9VChU0HpdQdjKdKZYUHWYOXyNUR309xNb
         Sa2WD83898892P3yYkKW0u3KaSFzZprdD1iLB+XuRd/0mn9asNyP4UGt5jad5obhevIn
         o0fHlYsJuQqe28JZ3gB0oHiFNbJKqelmG5vUZ89ta/uFtjaKG0etCTTdclNFlHvaOlEE
         mc1UuofBdMDPpY4qHPgq4D6JKJFU7CT+ixUck2yLjW/ZylS9uSalqtmSuJBNzhQ4mUay
         jXDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774896927; x=1775501727;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=j0H9FaWAU93pFITtwnjoYm1PksncwdbCPSGTYYrDU6M=;
        b=WWUpS8QYJ/vDYCclKaTw4hZjwy6pqv6KbuPK5urLcFZkhefRgtTwXL8bO//dN/SXtV
         Y/O1wzkdTfU/t8CsmSPWu7pnrgkiRDv9Av+DOTxND8YnR3tSc+Z/lSNTVJOLInM0axaD
         q0JkWu8ufx0ngU4ubtGtbDpPT0lSYyV8ru2IXF6qwAunhEM9JVZBTOI3ywi/2RZTCuFN
         /fJ3YThNepSr3GQbc0HD11Gw/C09OtNRmHgYzmsjcHcFLkuXeNteWH02W+UL5Ab7eyKr
         vAi2TUr8kyN6G2E4hSuJDgkmBeW4eQ7wP0HJJGGOAho4YUok1KhGM3MiBVLNihLUq2Jv
         8Y6w==
X-Forwarded-Encrypted: i=1; AJvYcCXzgk1uu+/W4wyoLcVTvgyoaM7jx+wsA80O9E3D1zUZ5/1OIcFazVxLsvviaxjRWnkPdbdn3sPFejNj@vger.kernel.org
X-Gm-Message-State: AOJu0YyNTK1yrR8F+OSuqAOd9NYSp+zsgSdczKm7gO0HQDPSKPo7DE+s
	1vPLPb9K6DsLOJXz0noNrfeJeax4FWQntKBqqa1ZyVwldDPWMi8B/hKFIXIVXCbC6auFdX3l5wR
	zKsAdh1hEKBtDGPGtEB1TCGeWQC5tZiiotawK4cvzEDmMQUQts2lvAYJyVjFtW8HP
X-Gm-Gg: ATEYQzwUw5HH+R/X1NHVGv72ftKnpPAIczTPg5pLTKAI7rfnXk2UlIHsyQtTfTM/t9D
	uTI4rCca7uQKlsZh6qekc4bfY/sznbfcGk5cr55gMSD5o+wbbIbls81g4mwq9PdsyLJyN6BRDUH
	QSnegnOg9BjckPB/g5DoRS+vdEsbTR6i6zj7P3GGZJBxTSbU9Q9apf1QD0x5aZmiTcHz7/FtZZl
	YwAk8So9Q0nMIm1VfNYeU24tBahYVP0tlJLzhTcrSi763i8EZopK3aQExldaB/EeF3emgSr4DIe
	mNoXxI0CQHogeV/v/ESFG4mzIsnQn0nmBItt5KMLTbQ01UCuum44WOKecYydyI1ZUawl0gmqY9n
	vyjXwBbxvlGiR7BkUaXdwwcE3VpBZJC5MK3bxx+l/+NDLv7CL97zqXr6VFDnVJbK4WpMk3p/bxM
	SYWKil1oICiGMCK+n6m2geZUGYuiAAgSeQoAs=
X-Received: by 2002:a05:622a:4d09:b0:50b:52ee:62b5 with SMTP id d75a77b69052e-50ba391933emr188510661cf.41.1774896927318;
        Mon, 30 Mar 2026 11:55:27 -0700 (PDT)
X-Received: by 2002:a05:622a:4d09:b0:50b:52ee:62b5 with SMTP id d75a77b69052e-50ba391933emr188510091cf.41.1774896926744;
        Mon, 30 Mar 2026 11:55:26 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a2b145de35sm1839702e87.74.2026.03.30.11.55.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 30 Mar 2026 11:55:25 -0700 (PDT)
Date: Mon, 30 Mar 2026 21:55:23 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Bryan O'Donoghue <bod@kernel.org>
Cc: johannes.goede@oss.qualcomm.com,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        vladimir.zapolskiy@linaro.org, laurent.pinchart@ideasonboard.com,
        kieran.bingham@ideasonboard.com, robh@kernel.org, krzk+dt@kernel.org,
        andersson@kernel.org, konradybcio@kernel.org,
        linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        mchehab@kernel.org
Subject: Re: [RFC PATCH 2/3] media: qcom: camss: Add CAMSS Offline Processing
 Engine driver
Message-ID: <4hasliun3wkook2pvfkntjlzs7elu67ine5q7nd7ptjthx5qvw@rntvb7lnajpc>
References: <1ba54ec0-be51-4694-a79b-f272e76303d2@kernel.org>
 <X-Lw_zi1o015-V1Cv4dY_ik6SfTB8TTcLmn1l-Ta7UviYTJ6gwMBn4B4ulYwjd_Aetul5xUt0T6ln9E-Hl5h4g==@protonmail.internalid>
 <CAFEp6-3ziXJTYADOFj--rZL5TumroXuW+=SnUQ9XakRxHT-ypg@mail.gmail.com>
 <12194cc0-0960-486c-be7e-1a22d95de340@kernel.org>
 <rj2vb725he4yzfvjifzyxqpbqk5oztfaafp7sg2qes4qz3mlaz@z5dyoqod56d7>
 <7fc31426-3157-49c7-a30d-dcd7b181fcc6@oss.qualcomm.com>
 <qq43xl3lsv2nq4ngn2hojleddxjmkgwclb2ajek5gvdtgyjltl@3tqg5ydhsxia>
 <8DTHyPLaUjGKd83PvBsisjn_SnpUnvkateTtwz9P6CChP9VGfDyQmJa4Rfd5KwOBOLhtGFJPDzfHrXC4zvV-Fg==@protonmail.internalid>
 <0330f63f-7137-4484-954a-fc0776a9b052@oss.qualcomm.com>
 <0879e4c1-5381-4a70-9fb3-4af9b3bf6e48@kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <0879e4c1-5381-4a70-9fb3-4af9b3bf6e48@kernel.org>
X-Proofpoint-GUID: kicQI1pNUxFrlhfe24oDDy47WVANZ7tL
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzMwMDE1NyBTYWx0ZWRfX9P/QqW/4FvmO
 ge/qOGqSCRUl2rH1fU2Db1jx2EkKTztpotEOr0h5tDnKPlrriykoFhWy78sh5fUk4792y9P6j3T
 yZOA7nunFiUW+mp6v3bAVsc9hDYBmKOhNudMI5bpIJRgqW5KDoNLxe6qX/kOqN9u3Y3Sq0jmN8n
 rBIjxkkgs87vEAkja7BnQOmtnUJKd0c8A23LCTEB2EjJowkebRVOqPU6XcX8ZuKadz+EUw9y/vK
 nKL6rtxDjwS4+s44LCdwATXJ5G13CwhRTjE4M85iuCa6j50QER1CqVdULrUfio08OAtDMDf9OsU
 ACw/5xfEWdjii3WEriqfcTTg9O4FNLogx4t7gZ1mdTPxsOWPp/XGJcNzBY4uXE7fEHwtNJg+uI9
 MWt4h45aDLn8eDmqqtfo66fiYI6kjr53I7HY1B2UyAggVM7IUnG6y5UWVwTSsdkhL0kXWAbwiRT
 GbJyDOkHqMvpijwuBRw==
X-Proofpoint-ORIG-GUID: kicQI1pNUxFrlhfe24oDDy47WVANZ7tL
X-Authority-Analysis: v=2.4 cv=H8/WAuYi c=1 sm=1 tr=0 ts=69cac720 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22 a=EUspDBNiAAAA:8
 a=Lj28aCL1S1MqH9smhIUA:9 a=CjuIK1q_8ugA:10 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-30_01,2026-03-28_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 priorityscore=1501 bulkscore=0 spamscore=0 lowpriorityscore=0
 clxscore=1015 impostorscore=0 phishscore=0 suspectscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603300157

On Mon, Mar 30, 2026 at 03:11:58PM +0100, Bryan O'Donoghue wrote:
> On 30/03/2026 14:46, johannes.goede@oss.qualcomm.com wrote:
> > > > And then your CCMv1 or CCMv2 helper will get called with
> > > > the matching parameter-data.
> > > This leads to userspace having to know exact format for each hardware
> > > version, which is not nice. At the very least it should be possible to
> > > accept CCMv1 buffers and covert them to CCMv2 when required.
> > Yes, but a new ISP may also have a different pipeline altogether
> > with e.g. more then one preview/viewfinder output vs one viewfinder
> > output for current hw, etc.
> 
> My scoping on HFI shows that the IQ structures between Kona and later
> versions have pretty stable data-structures.
> 
> It might be worthwhile for the non-HFI version to implement those
> structures.
> 
> I keep mentioning CDM. Its also possible to construct the buffer in the
> format the CDM would require and hand that from user-space into the kernel.
> 
> That would save alot of overhead translating from one format to another.
> 
> That's another reason I bring up CDM again and again. We probably don't want
> to fix to the wrong format for OPE, introduce the CDM and then find we have
> to map from one format to another for large and complex data over and over
> again for each frame or every N frames.
> 
> TBH I think the CDM should happen for this system and in that vein is there
> any reason not to pack the data in the order the CDM will want ?

This sounds like the most horrible idea: letting userspace directly
program any registers in a way that is not visible to the kernel.

> 
> So probably in fact IQ structs are not the right thing for OPE+IFE.
> 
> ---
> bod

-- 
With best wishes
Dmitry
