Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 161AC3EA955
	for <devicetree@vger.kernel.org>; Mon, 29 Jun 2026 08:21:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782721280; cv=none; b=bDBlmJdFDFk0G4wvp3DeXPKy9XXDIlw6xB3ViMX+qwxZhgzbJ4gFU1so1wJrjf8gGuAsBDhihHIbTCMKZwQAfZZalkAK7UHWSAnXYrj/LqIaziDQsyuknxYi7tjA74HY/9rm9A7ba8QOYzkwaadW4zrucs7nATJbTos0jzzEGfA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782721280; c=relaxed/simple;
	bh=19bsCcsmbWBA2J5T8belQs5CPNmzQymzeF4aAeBu0f0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=XaMlxZuhyS411w4W9WiZffWWkBQyOE+wmPrJQ0chqoSvR6vYOqZ9hzMn0s9RA1LlS2TZK5fu4xQdVti0LCMLby27wAQof40ps02NWzW7vyE9mRUr5VQFRp30u2TOlWW6L8l0F3KKDWvFM8dNphv8uCKotrrjp4Y5mr8d+twassI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=PKYIA4K8; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ib9Z28Uw; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="PKYIA4K8";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ib9Z28Uw"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65T6rScm2124847
	for <devicetree@vger.kernel.org>; Mon, 29 Jun 2026 08:21:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=lWxO6LQZLUQAJzOYM2xHkVek
	pymet/2dgmsuICKY63M=; b=PKYIA4K8AS48AQLbJX82jzM2q+/PzW26RkGFM6r+
	AQK6x5yVZSMCT7lg1wMRPm2xQowK86BmvpNE+6Lvw/J01DgD+jKRGL8ou9+PPNkS
	hA8gp7GOZH+l/8J1d3jxHpTnKC3I9sQtHCOfAtVUBYQyN+XHJ8zSVnh0l73suzpU
	6gI/72pk4TPIcHJKvjBtvfHfjqL3tY3eVfOwJgRfBXaIn86MrGdd86TUiNfXRdTb
	6MTZcj9a1wPOEcYq3bo/x9hxyp8bdqqy6JN3yUydo5nYodSQ0mQJ0cGqyHeGPjy7
	9oA1SB7qcKA5fpNft1sH9mwZmDo4Cnyj92m0BmJCnLMivg==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f27335gkp-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 29 Jun 2026 08:21:11 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-92e538afe65so90619985a.3
        for <devicetree@vger.kernel.org>; Mon, 29 Jun 2026 01:21:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782721271; x=1783326071; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=lWxO6LQZLUQAJzOYM2xHkVekpymet/2dgmsuICKY63M=;
        b=ib9Z28UwkcvLqI44pcSlr3979ojkhZewIZGz6XtEZa9DRuWLJDy4VTy02prQ0ViqvM
         EsGuH4Li0e4/1eymaq8qtMGWA310yI7MOzJ3SBRiiqLi6L++nmuxNqPVhd1fVatemd0R
         eRVzjh8IpILvdjpYvpPhVFT4t2pq/tuRg1HncmtFd1pfjz7Iq+wzcicm/xvV9VlZHABG
         cjXFvrYxom7DclShFBciNpBT0HPe9LYUK2D5ulDrUjjlRArJYBzMqmuciv+4YzuTneZ7
         PULK4DVHOnZgErswBdj/9TWXZhmnZ33fFv3+uus8tWIVrmR9hkCel2hOvK9KM7B3iExX
         LdYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782721271; x=1783326071;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=lWxO6LQZLUQAJzOYM2xHkVekpymet/2dgmsuICKY63M=;
        b=eVR9YSmVeRxCXEceYf6ECubOrR/d0WV+B0715XAJIkGXfhp7xhYnT35JjF5fTIHn67
         jUh94nDSy4G3vbi+htaJhhHANbsuYnTWIs7dytqjWHh24e0Bu41ka8/w+//BXyFqz7ml
         lyj7sPLncqcNF3aLbw0bVThsdVhWsBgQpYFYTMehKSzX92R9epn1OS/W4+tfxRJ7J8tv
         Rg8qzSQhVqEx4Y5a/RLaTZfeDpYtFW9hybfU7OQ0ddu0EzEu0vJ+GxMck50Z5cs2IYIM
         rJ1Cv74VH7Kt8NoR8Gdt/Qaz6V1LbEiq6iHYwPcrwraUF/+vPHtJzf/V5Qn00Vf2DPQy
         OsNw==
X-Forwarded-Encrypted: i=1; AFNElJ+A3BlMegZwV4WBLQ85/pdi6Y8xH+WCbfQgP7ddHbpBPzmRvYLVjgshC7FuqbfdFymWAABgKTqs/an0@vger.kernel.org
X-Gm-Message-State: AOJu0Yy0qHnyKlGHOEVkt4MsSMZg7sTZMsLsdn73cQK7nyTeDx9M6NtV
	j86TRRpe8dh/U3A8t3HzzSdgE8CHrOfmCZ5SJ3kMJF2PDS/xCo2fJL9Yf3pZkHXKxHOIJG5aUFP
	2W/9Dxau0DOw/lVbFtcuAh6s7+W4LH17Vgw85vcLW+611yA2RTNIENeomUnYOwVgN
X-Gm-Gg: AfdE7cnEZI9ZG5e4EB6s/WzKYj4M6FBxVEGROQIB765Sz58gH2W/om8iipnoon/Nm8S
	dBEYjlDe+Itg5OARgJ/ohc/saC1LGimuWLWiOozTZuSH3Ress/If8iP8HdzdpAtxcsx4JhZiYR+
	pn8XgtfyUaVcPDWp3aSllA3CYx94FoW7LrHOJS9mXW2cFn7zeuQGiTvzvrfJ162xNcYbt/JMm65
	4lTtkqlTD3oflWgdpKM2/mcJmGsNHcGHSjcdkW0B2GhBTSIwvUZoRUs661ITDZvtxsWt8IjMMoY
	4aP20MpLkZGd2175vL0AzUqMS12gNZqntM25MzgvSgJB8J9ETGqk+HBi3XK/1BpRRTjWiHUa//a
	1PCajMCmLADzXTPPW5P6Lm40Yo0RTPawHGQ5KxGUVEkMAbkpBbzige8ixXxiYYiZjwnI8Pmj4Iz
	f83rRoGOgovtEA+LRwR2TcKwbN
X-Received: by 2002:a05:620a:28c4:b0:92e:52df:3523 with SMTP id af79cd13be357-92e52df3fe0mr275005085a.8.1782721270755;
        Mon, 29 Jun 2026 01:21:10 -0700 (PDT)
X-Received: by 2002:a05:620a:28c4:b0:92e:52df:3523 with SMTP id af79cd13be357-92e52df3fe0mr275000685a.8.1782721270097;
        Mon, 29 Jun 2026 01:21:10 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-39aee2d65d4sm16765571fa.41.2026.06.29.01.21.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 29 Jun 2026 01:21:09 -0700 (PDT)
Date: Mon, 29 Jun 2026 11:21:07 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Varadarajan Narayanan <varadarajan.narayanan@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/2] clk: qcom: apss-ipq-pll: Add IPQ5210 support
Message-ID: <7smlazccqigokclnnbwl7alqgqfi4dgbaqlpygg3db23yyvxtz@eaed2ucv7v2b>
References: <20260629-apss-clk-v1-0-8c92fe118ce4@oss.qualcomm.com>
 <20260629-apss-clk-v1-2-8c92fe118ce4@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260629-apss-clk-v1-2-8c92fe118ce4@oss.qualcomm.com>
X-Authority-Analysis: v=2.4 cv=F+FnsKhN c=1 sm=1 tr=0 ts=6a422af7 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22 a=EUspDBNiAAAA:8
 a=vcd5Yh-9S4NXlGS7D9AA:9 a=CjuIK1q_8ugA:10 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-GUID: hGz1bhoXZHvNkxWRbYmP29QZT3KbqNUA
X-Proofpoint-ORIG-GUID: hGz1bhoXZHvNkxWRbYmP29QZT3KbqNUA
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjI5MDA2NSBTYWx0ZWRfX/jahIB7Z/mlv
 RpNqrBZxH/XqOixz6+GNmjfs0W+KIZkojIu3KPRZwQe35bV0VEaaqAVOc8dzE/Cq+OFsxdLn6hY
 9TXtdSogb4tCwz+S3z8JdASyy7ESziWkA6SVCF1Bu4IPlu4lMqeK4Kg87+ZGuBoacwDFW1LAz73
 J4T+M3euDWpmO3jjPJrsUVUq9HLiLMzzJ9KUZ1PRw0CAFfjSxiAw4ROpk7LbEt+/yN9HfdpUaQb
 5L+Rp/Bn/m/dbCpGuLjoRqOHb4YH4wD/Y7olTRDMbcXbMDCFOWmeVlGsfqBQxeUd5W81GCuJZxI
 GvZ+oZyFaQo+NHfz2ZqnkHX42mscz5jwyQxssV78o7SbaEvFnOB01SHeoMHKmrkKNWQj4Do7tci
 Qco2/cgQfltrz5jCCZSdpHgihL1hY6yhQBA9ix/XC87elMDF8HU4n34v0ss+jSd+udV71jIR7nL
 KUe4PdoZqpFma248zQA==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjI5MDA2NSBTYWx0ZWRfX3rMVj/7nnoU5
 gQWh8tqWv6WeLkMsUbstx4OQiN6ITdc1/ePyhbEtpSh8hkFjh9bNFvPzZFrk93b1QZ4LiyLMuX+
 po7MwfMVqzJJfV2vhorBb1z0Adc18i8=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-29_02,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 spamscore=0 malwarescore=0 priorityscore=1501 adultscore=0
 lowpriorityscore=0 clxscore=1015 phishscore=0 suspectscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2606290065

On Mon, Jun 29, 2026 at 10:08:43AM +0530, Varadarajan Narayanan wrote:
> The Application Processor Subsystem on the IPQ5210 platform sources
> its clock from the Huayra PLL. Add the configuration data necessary
> to set it up.
> 
> Signed-off-by: Varadarajan Narayanan <varadarajan.narayanan@oss.qualcomm.com>
> ---
>  drivers/clk/qcom/apss-ipq-pll.c | 19 +++++++++++++++++++
>  1 file changed, 19 insertions(+)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry
