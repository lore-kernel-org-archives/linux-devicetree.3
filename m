Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9F71E3A5E9D
	for <devicetree@vger.kernel.org>; Tue, 21 Apr 2026 09:47:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776764864; cv=none; b=EWR00QjgU9lOHLPdEzyIgxK4AWQltEIU1Z+COgxoQMnH2AX0Y41ja5Ib75tqD0CovonMEw9oY1f9LTVYkWybQz1ivFW7VEUg/ziKqFHENkg9oRGLcYcjHbecvOaWchP3gaYdQEmJcgp6GuKfrVZOuzbgGktxE2SwPTV4Q4T4TAI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776764864; c=relaxed/simple;
	bh=XCzMwu+VSrSsRKyM9hqbWJ0NJLSUSXYFoX9vFw2xnMc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=t4N1ExceswFkYJykeDJHdlAadhM9HvoKcehiBWbhDOyLJq1vJnDjwMtVIvS31ALdqq3MpzcFfL+kEyZxJsoePEnt27YVO4lHqiHctzLOsi/B/ae0iaa6rC4XjRpXNhrmKT4SWpA7n+sUMN3w/ZWTK80ZPJnX4+yf6yj/FEu3ecs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=BN1Nl+6c; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=bad/Drc3; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="BN1Nl+6c";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="bad/Drc3"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63L4XpB11511295
	for <devicetree@vger.kernel.org>; Tue, 21 Apr 2026 09:47:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=bzypbsgrGLtN3L2XKMzQHpbD
	jSFeghXA9pfP3uWmz0A=; b=BN1Nl+6cs5JKvOsE3gfaIwJD7h30Zyhu11rNBbMK
	nzwhaizSx65c4OSe7nNkA4tRsGHAcWLlmP69S73SBz3olUAVRcnO0YG9ORTqrIut
	i/Jogrwa+MI3HlrUhFBDB4PY4BY6/mwusKx8b91PN3Q8ph9VnJCBMSruU/o3wGJX
	1x9ZwIEZ/uEya1QMwXT2Q7wQvIw6SPXeTI7xMtbFq1dPVeWcoFfvQIefkY+7rq7W
	xD53tV+kI14KBu4cTxKVHHl+NopHYiznjTQIiyQTuJP7QqVXOYaHbHcWoGwhBnDS
	KFKUckI/OHzM82iA1AYaAD2B3MST5yWGaW4oTvqoHW/QBA==
Received: from mail-dy1-f197.google.com (mail-dy1-f197.google.com [74.125.82.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dp2ak161x-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 21 Apr 2026 09:47:41 +0000 (GMT)
Received: by mail-dy1-f197.google.com with SMTP id 5a478bee46e88-2ba8013a9e3so4132241eec.0
        for <devicetree@vger.kernel.org>; Tue, 21 Apr 2026 02:47:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1776764861; x=1777369661; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=bzypbsgrGLtN3L2XKMzQHpbDjSFeghXA9pfP3uWmz0A=;
        b=bad/Drc3IoPIvFMnm4AILPUC9KMTswcOPEWRQDA7jVM17J9z6OA63Wbju1Bj062ujy
         zh1Qt2z83Nk7DlrYHWebVM2NNiLT2hpE9riegZcA49DRvfo+ZBlXSeOgqbN0IiQAJ3Tn
         sEP8qzItzYcfCMuW5+vsR6rh0xdbaJdgiKDbM73USfzQbq2sFwEQFoYE/tRwXp07iazn
         dzVMHXwqXgHOb+Mq/yWfGuA4Zq6t96MHteKPVv7BxR4/KYj2yIn542gjTHa1JslM6JI5
         0ZQhbWNVUwmlJFWVqMYobLM5/n6ZxPs/uRVoQxXc4FHZWKNjh/ESUuYeB7/UvZcLoBDJ
         m3eg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776764861; x=1777369661;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=bzypbsgrGLtN3L2XKMzQHpbDjSFeghXA9pfP3uWmz0A=;
        b=ogBXPoxwca3XK+T8DKtnx/YNwfkYzgaRG+ryPvN7u6lW6xY7t9We7B42ggYX7anEml
         NW7SwevITr6HlWKTzpZlMAorphSD23rZzWOO/+fegAU+SL8KXO5ISu0QOFj9Z3JhFIO+
         9rjOC6iWSJay3P0+9fwvcWGkII9ZCSSToqHJFCNiQsJsBQhgcDXIuXnnZ6THaq53SFBa
         s37AYls7wkhTLJycrA6+ctd9CpOmMEsPOH056nsZuc1168+/yVknqAbbGak4xFWogIiW
         jl7EW8FrL8hTN99YW8rI3MfvU3CQZfg5zJMDW98+mmEpNPFdsQnoHswd++hsf0HzIlEt
         D1ug==
X-Forwarded-Encrypted: i=1; AFNElJ+xlhza5KS6gWutXlQXh8JTpTQjZadD68qCoCbFqhM+Fy3bL70JwGnuNUzKeafcqqhdqpeotkNyXm9p@vger.kernel.org
X-Gm-Message-State: AOJu0Yz+8ukfis3FMqW89GCZBqJ8DoZd8YyTTyw1kBYU9GBaRcxoWxhW
	+r1Xgn0hPh6i/09JQNKl8+jIVAqkpwQ0CmVO1N1sD+5sf2iqYKTVLLfTMz6fEQwB7JBbDXwIRFl
	v4cyMhVrS5xQ9/gGs/7hOg9vFntmEdac5yoaj0OwKGthCyK7nLFLhGSlW+P/vb0GS
X-Gm-Gg: AeBDieuzMUUIDOjameZ8tQIDDga+eCnU3xQSX8JeZKfrzeC0pBYeyPutV0KJbwrP4EI
	Y2ChaHYS/+pK5JGnG5YVIf9fkZGYI6t8GKh+8TmFwEJ8mpHPMVmaHIFAz7o3rOHOdY/MtonJ9IY
	dYG0bVxSg+4gxoGqgS3XoZ2LlEF+l+j82BRr3EXTyUPToX0bGKhTLt1L4STCA8zGUgIjrh5p/gw
	LIw8zE4ySnPqXHroRP7wjurcYziXscG1xZsng/dIMszRhvbmd/1kmyvyQvknLMe1txeaKadvOPC
	/U4Vp8y3sqSVjYQa/Mau13c6umWtttZQlfmKG8LuCx6ORaUadJBbwmfdeSdbzu1SPRHHvWeK8t5
	ieuEndcSRG3dAjpvMLLTkhJNxfb6fLUo9UGPb5+032nbkuL84UY4/j1UxnQkVO/4CuHJDqqEuW7
	TGHF3tzw==
X-Received: by 2002:a05:7300:d704:b0:2d8:b814:29af with SMTP id 5a478bee46e88-2e464dafab3mr8147909eec.3.1776764860736;
        Tue, 21 Apr 2026 02:47:40 -0700 (PDT)
X-Received: by 2002:a05:7300:d704:b0:2d8:b814:29af with SMTP id 5a478bee46e88-2e464dafab3mr8147884eec.3.1776764860158;
        Tue, 21 Apr 2026 02:47:40 -0700 (PDT)
Received: from hu-anancv-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2e53d4bdaf7sm17768209eec.25.2026.04.21.02.47.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Apr 2026 02:47:39 -0700 (PDT)
Date: Tue, 21 Apr 2026 02:47:38 -0700
From: Ananthu C V <ananthu.cv@oss.qualcomm.com>
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org
Subject: Re: [PATCH v4 2/2] arch: arm64: boot: dts: qcom: add IMEM and PIL
 regions for glymur
Message-ID: <aedHuu3Ouro5jPcj@hu-anancv-lv.qualcomm.com>
References: <20260327-glymur-imem-v4-0-8fe0f20ad9fd@oss.qualcomm.com>
 <20260327-glymur-imem-v4-2-8fe0f20ad9fd@oss.qualcomm.com>
 <f087dfbc-ec6a-44f9-a119-2255f49d4bc4@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <f087dfbc-ec6a-44f9-a119-2255f49d4bc4@oss.qualcomm.com>
X-Authority-Analysis: v=2.4 cv=KItqylFo c=1 sm=1 tr=0 ts=69e747bd cx=c_pps
 a=Uww141gWH0fZj/3QKPojxA==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=kj9zAlcOel0A:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=EUspDBNiAAAA:8 a=rm9O5cFRvSUGPMVy4iMA:9 a=CjuIK1q_8ugA:10
 a=PxkB5W3o20Ba91AHUih5:22
X-Proofpoint-GUID: emJuhRIEwE4hsWKYTZCK_gPS7ngEyhGF
X-Proofpoint-ORIG-GUID: emJuhRIEwE4hsWKYTZCK_gPS7ngEyhGF
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDIxMDA5NSBTYWx0ZWRfXwsjCKAvZKA+9
 RV+b0VsIUDwo0LZrTft3jECNOpUX07LQFXl4GDxXOklotAbqMit5+4hNYMfK/IgjJNdd53/lpVR
 X7yzZrYeoI3gQ0MkFqLR/JXHeZfNthDB7t5fC8xRkwY4ZVASk9kSVRdeNLRIqADrkjO2Fs0wT/6
 A/1RqMrGN9h+rOKku5WGjQwiqQd+MiOmPMwUca1VYqECCvxenrC//XvWo5YAKujTxHalyvoXZoe
 eZcGdfCkCeLRHtDoux05hPFh7WxWEzo0syc3Zm1BfNi5y24BnJkDxnUpWqKsh9S7dwGcDqFxbI3
 1zvMypAWnZ3WMdtVwqbUe0USJhvrw8indPWZtC38Vs00II7PXDl1v7ZcIPNgxARltyR9jDGWfXv
 f7ZQA8G/j4cEs5ZJisjUnZuDs6t9O0jArCf0H7Gl2VX9cMVBkA3QtK4q1yF3QdrAkHc/tfVHtL0
 29iRsNtUj7uowwPu/Zw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-21_02,2026-04-20_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 priorityscore=1501 phishscore=0 malwarescore=0
 lowpriorityscore=0 impostorscore=0 bulkscore=0 suspectscore=0 adultscore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2604070000
 definitions=main-2604210095

Hi Konrad,

On Wed, Apr 08, 2026 at 11:42:14AM +0200, Konrad Dybcio wrote:
> On 3/27/26 11:24 AM, Ananthu C V wrote:
> > Add an IMEM on glymur which falls back to mmio-sram and define the
> > PIL relocation info region as its child, for post mortem tools to
> > locate the loaded remoteprocs.
> > 
> > Signed-off-by: Ananthu C V <ananthu.cv@oss.qualcomm.com>
> > ---
> >  arch/arm64/boot/dts/qcom/glymur.dtsi | 16 ++++++++++++++++
> >  1 file changed, 16 insertions(+)
> > 
> > diff --git a/arch/arm64/boot/dts/qcom/glymur.dtsi b/arch/arm64/boot/dts/qcom/glymur.dtsi
> > index 4886e87ebd49..21ae05f0ee17 100644
> > --- a/arch/arm64/boot/dts/qcom/glymur.dtsi
> > +++ b/arch/arm64/boot/dts/qcom/glymur.dtsi
> > @@ -6457,6 +6457,22 @@ rx-pins {
> >  			};
> >  		};
> >  
> > +		sram@14680000 {
> > +			compatible = "qcom,glymur-imem", "mmio-sram";
> > +			reg = <0x0 0x14680000 0x0 0x1000>;
> > +			ranges = <0 0 0x14680000 0x1000>;
> 
> size=0x2c_000

on glymur the imem region is a 4kb region of size 0x1000.

> Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Thanks for the review.

> Konrad

Best,
Ananthu
