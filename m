Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BE98E2E3B15
	for <devicetree@vger.kernel.org>; Fri, 10 Apr 2026 07:28:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775806100; cv=none; b=c53X+CFrQHfKoe5djyMOhEXk0eNnw/QY+46fkZs9mUUe5jIXNdKUw54emIsGf4VFxdx/Xq67NwXopLdEK6dZ3z9v3w32+0PYowlxjOvMHvT5xSK1L1kI196BzeqjpgGPsUpGMdSBGQuo2C4jkoxTZFR3UDyVK2x+LB6akY3QGt4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775806100; c=relaxed/simple;
	bh=OFtbOO1ubND4xBX/rJGFykVTxR+pMWVFmqATSLPmN5Y=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Ymh5erv/iK7DV/y3G3O/uJPVw8TYhR7v1WZGDy7V5ggNM9MqqL1scKV9Uu+4+H1eNMkAhl3Flq97qklcVbP3cAVW4n3zOLSwaOHWmhefepI0r4W9UwXRE3zs4jzAe8O+v8PHinRyMf07iDhtqAgqnvAuMBvICGJdjVwcjEIVv/s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=BXdn4z2n; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=iW5ICh1j; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="BXdn4z2n";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="iW5ICh1j"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63A5LdIi3352591
	for <devicetree@vger.kernel.org>; Fri, 10 Apr 2026 07:28:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=wzMTrJ8rSoC60jUEXeA7/Au3
	2kTyaCo0Qi2cMsxR190=; b=BXdn4z2n05QrDVwf0YyVLpQGdKBjB/BGQ/auJGwS
	EjmN3xFnfLkWmc0WhiM76aT006kpbFw8B3ag1bF1OjZwNG04NDw8znALGaw+QzaT
	bVIQndRiDvcG2qNEPGewHYJQ7P0VSYgu3UA6uTEN53MEMukaCnq8f6KCv4txNpfq
	kiKD1l8akqMmMFVVMiYw9A7ecKGw0UhQFcc0nZXh/pkGWY+QNbscwWWmZ6PCx0pu
	16jrA99kQJGT5xNRnAVFY1JT6J+g+onXLC2WtWT/zID/ngeeJFU+sMJ0fvVx/uQ3
	hjogQaslQW3d3Az3bp2hA59Don5gboA1bH3jN8LbPm3ExA==
Received: from mail-dy1-f199.google.com (mail-dy1-f199.google.com [74.125.82.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dec1que5n-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Fri, 10 Apr 2026 07:28:16 +0000 (GMT)
Received: by mail-dy1-f199.google.com with SMTP id 5a478bee46e88-2ba9a744f7dso2062006eec.0
        for <devicetree@vger.kernel.org>; Fri, 10 Apr 2026 00:28:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1775806096; x=1776410896; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=wzMTrJ8rSoC60jUEXeA7/Au32kTyaCo0Qi2cMsxR190=;
        b=iW5ICh1ja7rtDkjxtKAvNWieWGsRB9H1CGvAuL/yU1qlisu/Z7uuy3ad55HRPAm48i
         Iwnk2y1asBgYQn37IQOHV85H8TRUHK/R5/4UYgUo7ghAuJwMc1d3dRORGDem9WFr6scY
         rx/2dvTcJSnrUjYGqMs2WTLdYB7kKHGkECjIXvCdtkG1FNAH221L59flTd0EzN7+0g7x
         GgfGfSnwye+AtpnCGtOlZ71JIqnrYah9EQpw++N/A9QXW0JWF7PehlPIkdux13uhmW9x
         mXnu21xGeo2F7IcOTLjsenregD3CXOpouY9tck6HtS6gwRcF0nSgAn0ZNuzcsEArA3jk
         AsSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775806096; x=1776410896;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=wzMTrJ8rSoC60jUEXeA7/Au32kTyaCo0Qi2cMsxR190=;
        b=RWPCU+5AB4RbtiemgQ9ilhX4UgZgfO1F/aPe7cQX3q+9UMeM0lQQfjD/csJb+0+MFM
         xG8RgDwfZ6lkjc1Mg+Ank3Ye43+TtI8qCOOiK00FxwPgTCJObRpP2sMYA6CJ0CvopVIC
         9OO5pg7XuR7scU9un230mZqxvb3SGva8UE8eTmXQtPPV/etRSavp1ONdGoXOLPuIShsC
         RFuHcOnvh4HcmUO67+/hSC+QwMKY1Dj5hxr1LE51dXz2xVwYmhKiq26fWKuGKCypcSRN
         q454lH04EXsr0qGtMloOY9LKFQ2CjkM0wxPdvyn1/9ZW+koZIbEmgg6f/HE1tF1w+P2W
         PpWQ==
X-Forwarded-Encrypted: i=1; AJvYcCXvbkuetBvHtGevaMykMIQ1iFdxRjnb9q5a+JqnzxSmDUIwGzt6glDAXpwI5kOl0hcbgcu7Qw8sHBBA@vger.kernel.org
X-Gm-Message-State: AOJu0Yy8ARzUahUmexzz7MbtSo4gUck4ojyBMtE96GYyMhEVbzTCu60t
	G3wp8arDsFanAIbVOsw6+EvfVP9fZ2jy20lMULJV3Sq7Fa9ZR4LXDQQw4JeSMISlgRUtG+cEL0t
	OaoqWEwHhJGwCefzlf6Ewa3tAn9yBiEzUnXRsDHzdNytdI1ZM4HuNS938cnW2QueK
X-Gm-Gg: AeBDieu4mr/zuogrRrvHmgSYEjlT0o1WRqAFcaJTaqZ2Og0Oz5eiYupIZuAVNlWyVQG
	7TzCozs441V1c0A8bN7iad8+gOWswYWOdLNqKyAPnffqQ0+e2Jzn8DXSZfNt2B5W21pwPspBElp
	YL4QatmnoTRI6ivwxyipnlGu4ZMyYRM6QT2O1v7/e+/3de2mOMJkzKyHhpTXcNvN6WX7xsO3GLQ
	gy+2a8xUgTrRF5+m3GNz2oDxf3fgEMe0+wvhT7DFjJjM6YGIHxa7kueBORrCvXid66zwyir4AeW
	WNLkjHWz/cLSPufDNhqJsqk2pEOIApyZ34gIjjmv6/LK55gNrZURiKMioRHo3lXSoxSa/HXAG2w
	Pvl1qE5G+UYU0ILOPy27Ugg5ZJn5lWzjpGvjOIVQZDarhcaGmqY9R+9RXvmFl+LxOkpWfo7s=
X-Received: by 2002:a05:7301:fa04:b0:2c7:5a7b:e8c0 with SMTP id 5a478bee46e88-2d587a8c4fbmr1241994eec.12.1775806095659;
        Fri, 10 Apr 2026 00:28:15 -0700 (PDT)
X-Received: by 2002:a05:7301:fa04:b0:2c7:5a7b:e8c0 with SMTP id 5a478bee46e88-2d587a8c4fbmr1241974eec.12.1775806094998;
        Fri, 10 Apr 2026 00:28:14 -0700 (PDT)
Received: from hu-anancv-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2d55faab010sm3095528eec.12.2026.04.10.00.28.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 10 Apr 2026 00:28:14 -0700 (PDT)
Date: Fri, 10 Apr 2026 00:28:12 -0700
From: Ananthu C V <ananthu.cv@oss.qualcomm.com>
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Sibi Sankar <sibi.sankar@oss.qualcomm.com>
Subject: Re: [PATCH v3] Add remoteproc PAS loader for SoCCP on Glymur DT
Message-ID: <adimjMsZRerNVFcY@hu-anancv-lv.qualcomm.com>
References: <20260403-glymur-soccp-v3-1-f0e8d57f11ba@oss.qualcomm.com>
 <238b23bf-a180-4dfc-a896-955b1559bee7@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <238b23bf-a180-4dfc-a896-955b1559bee7@oss.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDEwMDA2NyBTYWx0ZWRfX3VfL7xqFHm8Y
 xgde41fhGA4f4psWdRrbUI7+H54DsAEk55VQwym9B6iUoAvx9uwan2DRUX4kDqOvXD809bFeivx
 EJjnk5SPgWnKQyVjiw/Im0pJFbLwaWPraRAynATZuT9LBVRP0awyLMlWURVdh3w308s1I3xlRO1
 YGzXeF5D3Jtw4DiFeruPROmkhwrlUJlDCRkSodl5WSON+9KZrgTwYiBBRL4XBa/OD/cbOgYGRwZ
 Abxoz8+DMqmLhJ/PZKrW6XZIgn/BfKIWsZGCjfJ75xwQIpEUKcsKV1JCvaUSpD94TrXjqjEd2lN
 cQPPZRUejFS1c7ZvdjQ9kKEip8oqIPQW7oFwkrh0ZzNVeazt3zRjOF+biPz59qP2vBn7Hy6WOqZ
 xDA4VuOmpO+5QJokmSbeBpZB6/8NTlsBdFNJcKny0QrOMuchCQuIre6zIt5cmIJ4d8WjhQEA1iz
 ALI+Hl2Y1scee3pao3w==
X-Authority-Analysis: v=2.4 cv=eOcjSnp1 c=1 sm=1 tr=0 ts=69d8a690 cx=c_pps
 a=cFYjgdjTJScbgFmBucgdfQ==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=kj9zAlcOel0A:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=EUspDBNiAAAA:8 a=gImegswrDfqCA0j4wuIA:9 a=CjuIK1q_8ugA:10
 a=scEy_gLbYbu1JhEsrz4S:22
X-Proofpoint-GUID: XMZ9xqGBOAAqTRupY_Jo9AWudNHLxVj_
X-Proofpoint-ORIG-GUID: XMZ9xqGBOAAqTRupY_Jo9AWudNHLxVj_
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-10_02,2026-04-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 adultscore=0 bulkscore=0 suspectscore=0 phishscore=0
 impostorscore=0 lowpriorityscore=0 clxscore=1015 priorityscore=1501
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2604010000
 definitions=main-2604100067

On Tue, Apr 07, 2026 at 01:41:33PM +0200, Konrad Dybcio wrote:
> On 4/3/26 1:39 PM, Ananthu C V wrote:
> > From: Sibi Sankar <sibi.sankar@oss.qualcomm.com>
> > 
> > Signed-off-by: Sibi Sankar <sibi.sankar@oss.qualcomm.com>
> > Co-developed-by: Ananthu C V <ananthu.cv@oss.qualcomm.com>
> > Signed-off-by: Ananthu C V <ananthu.cv@oss.qualcomm.com>
> > ---
> 
> [...]
> 
> > +		remoteproc_soccp: remoteproc-soccp@d00000 {
> 
> remoteproc-soccp@ ->remoteproc@

ack

> > +			compatible = "qcom,glymur-soccp-pas", "qcom,kaanapali-soccp-pas";
> > +			reg = <0x0 0x00d00000 0x0 0x200000>;
> > +
> > +			interrupts-extended = <&intc GIC_SPI 167 IRQ_TYPE_EDGE_RISING>,
> > +					      <&soccp_smp2p_in 0 IRQ_TYPE_EDGE_RISING>,
> > +					      <&soccp_smp2p_in 1 IRQ_TYPE_EDGE_RISING>,
> > +					      <&soccp_smp2p_in 2 IRQ_TYPE_EDGE_RISING>,
> > +					      <&soccp_smp2p_in 3 IRQ_TYPE_EDGE_RISING>,
> > +					      <&soccp_smp2p_in 9 IRQ_TYPE_EDGE_RISING>;
> > +			interrupt-names = "wdog",
> > +					  "fatal",
> > +					  "ready",
> > +					  "handover",
> > +					  "stop-ack",
> > +					  "pong";
> > +
> > +			clocks = <&rpmhcc RPMH_CXO_CLK>;
> > +			clock-names = "xo";
> > +
> > +			power-domains = <&rpmhpd RPMHPD_CX>,
> > +					<&rpmhpd RPMHPD_MX>;
> > +			power-domain-names = "cx",
> > +					     "mx";
> > +
> > +			memory-region = <&soccp_mem>,
> > +					<&soccpdtb_mem>;
> > +
> > +			qcom,smem-states = <&soccp_smp2p_out 0>,
> > +					   <&soccp_smp2p_out 8>;
> > +			qcom,smem-state-names = "stop",
> > +						"ping";
> > +
> > +			status = "disabled";
> 
> Let's drop this line, no one should desire to run a system without SoCCP

ack, that makes sense.

> > +
> > +			glink-edge {
> > +				interrupts-extended = <&ipcc IPCC_MPROC_SOCCP
> > +							     IPCC_MPROC_SIGNAL_GLINK_QMP
> > +							     IRQ_TYPE_EDGE_RISING>;
> > +				mboxes = <&ipcc IPCC_MPROC_SOCCP
> > +						IPCC_MPROC_SIGNAL_GLINK_QMP>;
> > +				qcom,remote-pid = <19>;
> > +				label = "soccp";
> > +
> > +			};
> 
> Stray \n above

noted, will fix.

> Konrad

Thanks for the review Konrad, will reflect the changes in the next revision.

Best,
Ananthu
