Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C9BF13D6CA4
	for <devicetree@vger.kernel.org>; Wed,  1 Apr 2026 15:54:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775058898; cv=none; b=ca3tD3TYtjOK7Or2/6RjFPCWeJNmEcGBclHtUorlJBN/A+y01zimG1pZfz8/WfXNFqq2D08NgaMsrZTkqdQME/Vphzbbn7MGxdRbsGsAG0wnTlyh9KCSGyU+yaYWDO0j60j+KONi0BmCa56Qn01+rNAPaq7Dg5koL1/ZA2h08Gc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775058898; c=relaxed/simple;
	bh=+qbkO2vGbvThK38+UmgQuZI4Qx1NmsWO4jJxe2qo63Y=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=lAotOd8Y53aNqDletO4HQ369rjP6NpPqjNtuKduFjycN0wCu399A3b7bpROBE54K31lTVEAMA1Yd5X4IT6IgIge2mr/OR8bPXXGVkhoM1FON8ioFZaCivO+fQv5i8/Q6KAf/tjXshJjsVE9dyMxWzWJJRnhvHCKlo/Uw5hwvQqk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=OuuXGirx; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=a47Hpemp; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="OuuXGirx";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="a47Hpemp"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 631FS9UE1562475
	for <devicetree@vger.kernel.org>; Wed, 1 Apr 2026 15:54:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=zFK+mlQujJNjbomDnjjDvyHU
	Xm93hR7YZ2pRnFwT7mo=; b=OuuXGirx76+DLKs8D3co8hfTs8lZsoHoBcGmWewF
	KYEH/KyTXvc5JaGHRqQHQDvde1/41yTFPkehGov046JYtSFPWQE2Fqr1MG3C3nYT
	aZXsg5L4TS30gImaoeY7rpG4F/0eQxOmgcukOjgg1YrA4ovhTo2tePixd7/rq75u
	1jXvRjA9lG9CCQ/dJI3zklmg445aB+GCCg+XpMTLM8AF6TcPCUngF/CzotG1dx25
	PpTypfkYUytU9SxVB+jDc/lynX5nG/hSJsI4uGz2qa2hFriO5IQobShO8gWE7kJ+
	gpT9qWK3Lgy6dYpwq+Lvy2oavWsfcHYjYYre2kWxFIGkaA==
Received: from mail-dy1-f200.google.com (mail-dy1-f200.google.com [74.125.82.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d8va3tv3m-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 01 Apr 2026 15:54:55 +0000 (GMT)
Received: by mail-dy1-f200.google.com with SMTP id 5a478bee46e88-2ba8013a9e3so6489482eec.0
        for <devicetree@vger.kernel.org>; Wed, 01 Apr 2026 08:54:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1775058895; x=1775663695; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=zFK+mlQujJNjbomDnjjDvyHUXm93hR7YZ2pRnFwT7mo=;
        b=a47HpemplwS3r6OUDeebyPe+Tj1jtWqNONw9wCJEV8lk27gBLApUeiVSgCKVn1NSQ5
         Wsy62sBT4In3qIyHJdsSWcqh/3n8QUx+Lp2gjShAKtjhu/zPTrld3f2bbfXYOToDUdRf
         p3yaxO+7s4r75MxpcPujRcp/rtZz36+i3F+MXDX36K0ANcF6uXLAbH9gi2pETiR7LrCM
         GZ4J0Gv9HefEA5Wn32EZC6yiEwOavWUhzggO1BtcPfamnAUJJz8FEJk5zmNxiQ/WYxXs
         IwlgOQhSiz6s9Ox/VKab2Ot574KyncPtxYg1tvYD/spK9PyYqbvXNZu3TJP98dyh9aHW
         BcpA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775058895; x=1775663695;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=zFK+mlQujJNjbomDnjjDvyHUXm93hR7YZ2pRnFwT7mo=;
        b=UifV8T4lRIiCkiYRrMKxXcBbGTkFst6I/PTbnLYAocDW+7fxjgocvYfvkts0+R1D33
         TwRunaQIk0Ra9m9OOpw9GOFTwDg4gFf2PFySBjyi36pX6SZ9fSnzGE2tGGq4wwnXHtPS
         Y1QK8mDCXamoJLLOzj5uLCDmKB/nMUuhvNCw5VggldNYaZKyZUwI6EzJgNb797wQU+3s
         If6fvMijlP3HyGAMPU7aTXUC3jlx7oeMbbp6y6eS7J298nNNTAEZwyJSPDaflTPu0P1U
         CGQS98oQ0kMqy+aWcxtLtm2pZ/cug/RDuaMJ+pRUlk0sOWFMiIsmXUPfaW6BkwS3VHQk
         aCrg==
X-Forwarded-Encrypted: i=1; AJvYcCUdnDWAhjzI9kmnofvjonyNufrvPi35OiYsCdrk1volPCOhLI3rWuZTQbV8/PGZqosbw8IxnP49e+4x@vger.kernel.org
X-Gm-Message-State: AOJu0YwD+VN9x/OhIwTHVbmrYmhrRrihCKNk1OxNfe1KPO5H/ULS+e+q
	WhWA5UdarXtlJdnyZ6UKn17ft0hEWXiAUqoYumQzewmqdMX8n6nl5u9ZA/1F4fKPurbnyWAnL4d
	cDBYTDvmnPnDClYlQwNVSHh8NYYVrwBsk7zPNWQKnjiiJsHJ9gru2nGoCiDbcM5eu
X-Gm-Gg: ATEYQzwk2wNf3f+4/Udxmzk+Cdo8n3b1aWBM9N/Bq1ZBMZJ9VaOEaDjwpjsYj+pe3i6
	bnKN4mpihE1FY23sDH7qCqlIHU86Ad2ucgkRMAQehFKay63E7oPssfoSPSteGF5iJtpHfZYkj12
	toxQJFEBgTaswBWHmrsldv9a+IJds7K4c0DAC7RPLSSRLIBVBa7OfTPspvTkZB2TbyQsINKd15U
	JzPIpyn1p5j9XGXrr27dK1ZhWk4GEBsPCrrGNO/x7h4Po1wGQnLpRzHGIgcYPvt9IHnRO//oWvk
	NaWFHvAktO47eDPexz0fPWzXzVqWFA1zoCx2WlXNG1AvRTcyRNyBDxRjuAFGNa7fHKou4YknJI6
	MBCLxzQSvGhflTOqXvb+oJxUq2AT6JqqqYY8ArrSqv1W3e6BXsUKsDLFTntPva1Sw2JhI466W1C
	8=
X-Received: by 2002:a05:7300:6da8:b0:2c7:2c0b:f334 with SMTP id 5a478bee46e88-2c9325b04a8mr1993408eec.18.1775058894767;
        Wed, 01 Apr 2026 08:54:54 -0700 (PDT)
X-Received: by 2002:a05:7300:6da8:b0:2c7:2c0b:f334 with SMTP id 5a478bee46e88-2c9325b04a8mr1993370eec.18.1775058893825;
        Wed, 01 Apr 2026 08:54:53 -0700 (PDT)
Received: from hu-mdtipton-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2ca7caeb83dsm103983eec.22.2026.04.01.08.54.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 01 Apr 2026 08:54:53 -0700 (PDT)
Date: Wed, 1 Apr 2026 08:54:51 -0700
From: Mike Tipton <mike.tipton@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>
Cc: Vivek Aknurwar <vivek.aknurwar@oss.qualcomm.com>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Taniya Das <quic_tdas@quicinc.com>,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 7/7] clk: qcom: Add support for global clock controller
 on Hawi
Message-ID: <ac0/y1962gKYUbC1@hu-mdtipton-lv.qualcomm.com>
References: <20260330-clk-hawi-v1-0-c2a663e1d35b@oss.qualcomm.com>
 <20260330-clk-hawi-v1-7-c2a663e1d35b@oss.qualcomm.com>
 <acw4FDsIbgAUTHXo@baldur>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <acw4FDsIbgAUTHXo@baldur>
X-Proofpoint-GUID: BCWw4I4MNrktVwknW2Ewu3P2dIQQqQsG
X-Proofpoint-ORIG-GUID: BCWw4I4MNrktVwknW2Ewu3P2dIQQqQsG
X-Authority-Analysis: v=2.4 cv=B/C0EetM c=1 sm=1 tr=0 ts=69cd3fcf cx=c_pps
 a=PfFC4Oe2JQzmKTvty2cRDw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=kj9zAlcOel0A:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=luiUJp0ABMwvOzxM0bgA:9 a=CjuIK1q_8ugA:10
 a=6Ab_bkdmUrQuMsNx7PHu:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDAxMDE0OCBTYWx0ZWRfX4RawBq0HLj0k
 6tb8llkoddO26eea3XBn+I16gR23bqKbw4lu9ewe4TjspgEJE2nJ3T6mumUtY+j9H5q2Tk79ga8
 h+QWWu5/BaPUy8Jd8vAlkJBuE84DbV98wvy5/NKQJZBckc/+fsfI40AFkryHmKvCPsuQLNEZ1J7
 dKI6VB7TI6zFgJfYgY/xneijpEvttHP3NrC+32lLebVsDIMWtTddwmhyTtHFPEVQ+CxaAFMJUSt
 fAOU26Wl56242QJWZsjdJLxONQ5OPljBasN+1CTiAfSscVz0the4/gcrGTpZLmA7ysDagDlu3OA
 N8AM4bVxLER13opb9lN5IlP/9SFqIOkRfJChgGpiCVEgBn4t2k6HNn6vKoQGhhOtuVY01Unoob0
 Gi8UM/pHMPRDIq87/ZsoE9RLjVzm1HMY/wg27yiyv3H+HBh4Wjvdcb2iPRbCcSEwwrsgaA2vFVP
 HCyBzOQkOYe0768gOqQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-01_04,2026-04-01_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 priorityscore=1501 bulkscore=0 phishscore=0 malwarescore=0
 lowpriorityscore=0 adultscore=0 clxscore=1015 impostorscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2604010148

On Tue, Mar 31, 2026 at 04:11:22PM -0500, Bjorn Andersson wrote:
> On Mon, Mar 30, 2026 at 05:35:02PM -0700, Vivek Aknurwar wrote:
> > +++ b/drivers/clk/qcom/gcc-hawi.c
> [..]
> > +static const struct qcom_cc_desc gcc_hawi_desc = {
> > +	.config = &gcc_hawi_regmap_config,
> > +	.clks = gcc_hawi_clocks,
> > +	.num_clks = ARRAY_SIZE(gcc_hawi_clocks),
> > +	.resets = gcc_hawi_resets,
> > +	.num_resets = ARRAY_SIZE(gcc_hawi_resets),
> > +	.gdscs = gcc_hawi_gdscs,
> > +	.num_gdscs = ARRAY_SIZE(gcc_hawi_gdscs),
> > +	.driver_data = &gcc_hawi_driver_data,
> 
> Sorry for not spotting this earlier, but don't we need a ".use_rpm =
> true" here?
> 
> In line with
> https://lore.kernel.org/all/20260309-glymur-fix-gcc-cx-scaling-v2-2-d7a58a0a9ecb@oss.qualcomm.com/

Yeah, we should. Same rationale, which technically applies to many other
GCC instances that aren't setting this today.

Mike

> 
> Regards,
> Bjorn
> 
> > +};
> > +
