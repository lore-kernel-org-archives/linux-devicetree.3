Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DB91234CFC3
	for <devicetree@vger.kernel.org>; Wed, 22 Jul 2026 13:59:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784728781; cv=none; b=cdBRzWBZOcVwFDmVxGlHE0Oepor4uUDhVJqk1QcgQYm/Ggjy+1CcGKc4LuGtqRHllSEfrYtjfTPzXkYOJe++yZPVsUEmkJC0VlsKF4NeVnZkQdBIPB3bJkgEZCiuCie8sb5zICed6jBek2mZuJsY4dsbcIOFnXex0jgV4sYYfio=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784728781; c=relaxed/simple;
	bh=X3XZ4W4x8YcQNk01qDYADfM5x3IioTEjoaErDOYaqm8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=pOa46tySgJ9KWS4FtQIu8Mk/3AFWgpJpaplJqijOAlBnHSkB19RtCKHFW7KXD52rTl4ts0/L/RtiNmUxvn6Sht3HJ75b+rLpdBP7Lha8F73gUYfaYZZ9qZxcoBE0mLUBDKukXNFW1it7xHtnnKqsXhSUsDnF10bclxw9ycV8Rgc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=bSQYV4pc; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=cOTibIuK; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="bSQYV4pc";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="cOTibIuK"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66MDWlQ4860783
	for <devicetree@vger.kernel.org>; Wed, 22 Jul 2026 13:59:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	k2Mn5WJa93KoG2qDGfSidg+jkhRfYzxNXyR+6PbWzyA=; b=bSQYV4pcZXO/bBxv
	QnzIaoJGulQDljE5fZ19wqDcZyRznMd2yYDX34ruX6MQ7p+GtcPdWGef2GUrjhxj
	98ac9FAI7JA8J5l+jGcafbvhgSi6rtvdI+8wrzFx4f8ZIE1w2WsvJJ2BUwWpN3t4
	CT4Aob3wFutCmf0BJcAe/725wfTGng13agY7b/BW1g53ZuVqWHsfgQMffguBJ4vy
	lAsEkC91Dsm8vtTmocHLnKXnE0mz4unzuNPy2sQ5aJOsn6xhvEVgkxOqtmUIzq2g
	CK5jcg8BumecP96ROcAFhaeLNvfIQhkxoVnSmsZxFS17MCxqQrGhJ6+v4RMpbv/p
	KQWEqg==
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com [209.85.219.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fjntn2fh4-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 22 Jul 2026 13:59:37 +0000 (GMT)
Received: by mail-qv1-f69.google.com with SMTP id 6a1803df08f44-8f1e4e0eac1so230852486d6.1
        for <devicetree@vger.kernel.org>; Wed, 22 Jul 2026 06:59:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784728776; x=1785333576; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=k2Mn5WJa93KoG2qDGfSidg+jkhRfYzxNXyR+6PbWzyA=;
        b=cOTibIuKjzJvtak5/3d2amCT/WqbVeCa+JeyHGNnBzF6m6Ya6lDe7m0Il4RYkjaUNT
         wv3vQKgfiS6NDWtf+8NlCGK22YIv6JygsCNbQFHDylhWGecMQWDJ3ifDjuEq9nddQiZE
         zBWGcliUh2+veYqNFcZPeGGZjeojr2ImDF11ulrCW868UOB92nZPjIevxpBUPFdd1aq9
         1tymavl6P+foy+xlO410fqlSYDUgQeGJLrZmBpS+HI0COFf0pQO4sMEWlkC4WRHiClkY
         3K0VuEFmPHxuNgigKGaxo61HdSzkEjmNiBL6JDxs9L53KyELUrkBbyxVQdO1W4UdwBj3
         8w3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784728776; x=1785333576;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=k2Mn5WJa93KoG2qDGfSidg+jkhRfYzxNXyR+6PbWzyA=;
        b=XLEUu+QZjES0hEpspsxnEdQdXYx5VuGhmcGs/sUOe6c/TrkFQiJw73QPXvfM2GXyvL
         QDGt936bZ+C8wP+HJcvYC2jk5rfmxddtwfUrHDYaTGM5t9oRyMcG/2bW+SXlc/UH4CJJ
         wuVR8BbZT3lELTAgDzPEPvEKIxxtqnE9+FpMuxK8YcCkUw10VPG5rBW3law4VupU+IaH
         F7engjDZhmxGd/vUoN6KUFC5guT4yMPnrRxlwwPnKwxxwvLDEidGEp00SViRi9o/E24y
         K+gJhDzd5pdcAkyjzTHhlaW5l/BjaZUoDV6vhiyJRSPINfFY2NSiLqba7NDkUAZkwHhw
         atDA==
X-Forwarded-Encrypted: i=1; AHgh+RpGDLDhhSnDMRkXAJnxtZBrI1oE0yCz0SjtWEEd4dlxhqdADdgw8/JKDg4u/lDJ8r4sIXGGm0kiKINN@vger.kernel.org
X-Gm-Message-State: AOJu0YzIvRdwWxvHOM4dOtLGAERrHTWwVW1ZcsIxXpvc2Lt1Dm3KeM1F
	N4XSFAveX0JqmGxjpNIPUDPFJRx6Jtcetl2/My0NbrFCr/M5DTppWKjA/GbG5P40QOolrU6VwWB
	eb5gwHBykolxUd46uhRTko5ttjPXrfssex+R5MEPPieSVgDtahb42rDSXQ08RGLF2
X-Gm-Gg: AR+sD10yBrqhqyGg+EJTQOpzyYHz9OGIZclTizRVYvXYeKwuGzCSYeBZGAKmaYy3sm0
	JcanCpAQgmJQxwF5xCe+GA396jn+pZ4/WFQRL3keV1GgQm+wMK24OULYQz1etVMU9YyH+dhTu+5
	OYT+TbBh3n2Kb9V31VJiYYIoJSRDxoUwAxPG1NYheU1/0upmtmWT6P/eTucHCD1PkencfA7AeDj
	OHlRbqo1FHNw2AgC4gKJ/ne+AZi+67m8SELSkLvqj5uXDG+DOLXhfh7AHrQffaYQ5v/aLwYIxm2
	dDMlqlfM2yvAimKrue0I9xIzON3WDbDDkVyKoerzOAjYDYx8VN7JwkYny1XvOEiDucMn42MUUxu
	wzM+N3LfmyMCF8KiahjxnbUjrwwf+Y2xMBiMFghg9cJKsJG/ExR3v7cd/4jxl3Cmxu1xACSK8bt
	l9iyZRqnkBGA71aA==
X-Received: by 2002:a05:622a:1f85:b0:51b:f549:c706 with SMTP id d75a77b69052e-5213c0081f1mr245231401cf.16.1784728776317;
        Wed, 22 Jul 2026 06:59:36 -0700 (PDT)
X-Received: by 2002:a05:622a:1f85:b0:51b:f549:c706 with SMTP id d75a77b69052e-5213c0081f1mr245230941cf.16.1784728775819;
        Wed, 22 Jul 2026 06:59:35 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5b2a9b9a7f6sm499957e87.18.2026.07.22.06.59.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Jul 2026 06:59:34 -0700 (PDT)
Date: Wed, 22 Jul 2026 16:59:32 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>
Cc: Rakesh Kota <rakesh.kota@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Kamal Wadhwa <kamal.wadhwa@oss.qualcomm.com>,
        jishnu.prakash@oss.qualcomm.com,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Sebastian Reichel <sre@kernel.org>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org
Subject: Re: [PATCH 1/2] dt-bindings: soc: qcom: pmic-glink: Document
 batteryless property
Message-ID: <gnmx5m5dt5676oox5cypzg26vbwtmzhzkh4bhyq6z27kwi2bf3@z24ov6esgtx4>
References: <20260519-first-wine-bulldog-a6a4c7@quoll>
 <20260521071341.q4efqssppvettaey@hu-kamalw-hyd.qualcomm.com>
 <86f76a81-832d-4ba5-81d5-38b46b7dc0a7@kernel.org>
 <6c595a5f-b979-4e8b-ae77-d28d24700588@oss.qualcomm.com>
 <e07085c5-0fe8-4ea7-8e51-ebe104e7aa2d@kernel.org>
 <82019c2e-6b6e-4edd-91b3-a28ef6eb09eb@oss.qualcomm.com>
 <20260525120139.dyfnm6nwfzuoxd7p@hu-kotarake-hyd.qualcomm.com>
 <20260702113010.zjrk4kr7fpjp6asj@hu-kotarake-hyd.qualcomm.com>
 <dqe3ntmtmjqixp2l5n7qm6zpcwh4sizr7jd5g3cl3tzpvl6tvo@casnjg3orldd>
 <allz1-dD9V_Ck8LK@baldur>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <allz1-dD9V_Ck8LK@baldur>
X-Authority-Analysis: v=2.4 cv=AJsSZ1gA c=1 sm=1 tr=0 ts=6a60ccc9 cx=c_pps
 a=wEM5vcRIz55oU/E2lInRtA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22 a=V-RYIpRGXYYGgrflbjwA:9
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=OIgjcC2v60KrkQgK7BGD:22
X-Proofpoint-GUID: p0nE-GIyqqMPyJ4KD4KtGhWYgHMBRXad
X-Proofpoint-ORIG-GUID: p0nE-GIyqqMPyJ4KD4KtGhWYgHMBRXad
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzIyMDEzNyBTYWx0ZWRfXw/UUdBfLVWXg
 Nwcjwyrfxc+DDX1NGxfzXxXo0qdsuKi8mao6+IEIPgVbCJGQfJCkicZdUbWqx+gkgOHkKP/tDrb
 Tkx5iYb4jXv+3czlIUJGrw1L/xCB6S0=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzIyMDEzNyBTYWx0ZWRfX/2+/R+jwFYid
 EMzoo0g+xST47VikgsqUpEH8ZESfOWqKQxlf3RipYVPG20S2G8D2r103vP05WDkUQO9xwWIiPvy
 IYidl0cS32I8+wFRM/t/cJLam0GqivSj4J4Cz780aNhSfUHUkMTW3yQ4iaS7bPHzeTZ+EH+7tZG
 +X9AvMuqOl44sdgva0zIQlSpCLSZO4CM2+De0IvXz7j+GnEr9Y4jvDNFgCYw9/xiAb61mKYzPDW
 gHLHG3xv2REswn3/5nuUoTEHINLR9W/3J/ffF7einbsWxuOv/jHBO++PCfGAAAEx0L/VFyfogJt
 FiBRn2SrA6Fuprtyk80vP2NYtZmzPPih90lGAIL1tsYuLg/5szsdFT4HOooTXvznVo5p6rElXCm
 EgtzvomMYZ5gqEMsfvmVJSUkct/hh2z7xH/bR9ynY0Zp3LUz/Z3hSXgAh/o7sS/BMJHqxpqaMms
 4reMg8f5g0KNR/hN2lQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-22_04,2026-07-22_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 spamscore=0 clxscore=1015 phishscore=0 lowpriorityscore=0
 bulkscore=0 adultscore=0 priorityscore=1501 suspectscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607220137

On Thu, Jul 16, 2026 at 07:14:37PM -0500, Bjorn Andersson wrote:
> On Thu, Jul 02, 2026 at 02:49:37PM +0300, Dmitry Baryshkov wrote:
> > On Thu, Jul 02, 2026 at 05:00:10PM +0530, Rakesh Kota wrote:
> > > On Mon, May 25, 2026 at 05:31:39PM +0530, Rakesh Kota wrote:
> > > > On Fri, May 22, 2026 at 11:24:19AM +0200, Konrad Dybcio wrote:
> > > > > On 5/21/26 11:58 AM, Krzysztof Kozlowski wrote:
> > > > > > On 21/05/2026 10:46, Konrad Dybcio wrote:
> > > > > >> On 5/21/26 9:20 AM, Krzysztof Kozlowski wrote:
> > > > > >>>> Since firmware does not have a way to dynamically tell if it on a
> > > > > >>>> debug-board powered device or a DCIN powered device, We are required to
> > > > > >>>> add this new DT property.
> > > > > >>>
> > > > > >>> Neither debug-board powered device nor battery-less will have
> > > > > >>> monitored-battery, thus again, why lack of that property cannot tell you
> > > > > >>> what you need?
> > > > > >>
> > > > > >> A device with a battery will not have a monitored-battery either
> > > > > > But why? If for such device property "no battery" is suitable, then for
> > > > > > me "monitored-battery" is suitable as well. IOW, if you say that having
> > > > > > a property describing batter is not a accurate hardware property here,
> > > > > > then neither saying "no battery" is, because no batter is basically some
> > > > > > sort of battery (just like empty set is still a set, empty array is
> > > > > > still an array).
> > > > > 
> > > > > The battmgr service running on one of the remoteprocs already has all
> > > > > the information about the battery and it also handles all the type-c,
> > > > > PD and charger configuration, only letting the OS know about the
> > > > > results.
> > > > > 
> > > > > Hence, unless there's some other hardware at play (e.g. for custom
> > > > > 200 W charging), which wasn't fully implemented in the QC firmware,
> > > > > there is no reason to describe a battery separately, since the OS
> > > > > can't do anything useful with that information
> > > > > 
> > > > > In some abstract way, perhaps monitored_battery = <&pmic_glink> could
> > > > > be thought of as valid (since that's the data source the OS gets to
> > > > > see)
> > > > 
> > > > Should we use monitored-battery = <&pmic_glink>; If so, would it be
> > > > incorrect to mark pmic_glink as simple-battery, as that may cause the
> > > > schema validation to fail?
> > > 
> > > Hi @Konrad Dybcio, @Krzysztof Kozlowski , 
> > > 
> > > Following up on the earlier discussion — is monitored-battery =
> > > <&pmic_glink>; a valid pattern? And if so, would marking pmic_glink as
> > > simple-battery cause DT schema validation failures?
> > 
> > I'd say, no, monitored-battery should be pointing to the battery device.
> > Please fix this on the firmware side, so that the firmware can report
> > having no battery at all.
> > 
> 
> This won't be fixed in the firmware on my devices.

Why?

> 
> Regards,
> Bjorn
> 
> > -- 
> > With best wishes
> > Dmitry

-- 
With best wishes
Dmitry
