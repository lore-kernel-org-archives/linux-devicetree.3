Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7E18A392828
	for <devicetree@vger.kernel.org>; Mon, 22 Jun 2026 12:36:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782131803; cv=none; b=tXuhx087SbWQ81G3jIT9Q00DGT6A2t1GmqeCt+lCp7mdjK3mFgaS0g9rmKXzr/e7E0acqm+/GSEThtVa87/jVxG/OOFEWdqOlGAZYgq5ZquNme9KqluztHjhgehVBYqlJjIOPZibetICjBhfnSBQi1j/MUDrgTB8han+Js6OP5U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782131803; c=relaxed/simple;
	bh=EtA61302bS1g+OEx7q97izo9hwr0uljIlqxMSfwOHTM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=rr3hwlqi8V2+R8Ak1MJ52zELhtCTBqCenqtevNp4NWjziR1GuLWg2DE/ZzIdssTSMmlVyoxzc0xYMMrg1M42lMRRZaBB7kO1aRutyCocBc55epi0MPRwGPxD4sCJQqAMZDN4uJQ3sGgXlHfwKNC4ip3EehWOkIr27tk7E8s99g0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=XpEzBezg; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=WAHnf2XA; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="XpEzBezg";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="WAHnf2XA"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65MAoGGP941063
	for <devicetree@vger.kernel.org>; Mon, 22 Jun 2026 12:36:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=85/xXwMZH/nS0cbMX5lIOK4H
	cBaA7dvKpaLQZ9tszvk=; b=XpEzBezgf2F7MPBZqvlQ1bLk32SRv2csVgo/yFIj
	COGhaq5HPTUjlEBBtsDQB4V6k1M3B6w15y8bz1y2H1XjzsU/ihdTaKn7R/gWN2O8
	t0Ddtar8D1y2OEgu4wjdu9i4Dc58i9wclYvOXWVR5juQg0DudfbrqYprUuQ0dQYE
	ZVuBpzMySEDoy1eX12uwHPPSvkOZ5TmX+dsGYJ3eU7Wy3dK2tAXNWjYW2TEjqoYP
	2XtJBjJyyUbddmRQZiCtsUUL8HOPr7jb8lIL86EXoYUta9FtVrgEZO0xFJ2483Y9
	EShWAXZpyrCkjitcm96N/jjFrYX/SafewFAT4lqE83YpeQ==
Received: from mail-yw1-f197.google.com (mail-yw1-f197.google.com [209.85.128.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ey3eb8c6r-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 22 Jun 2026 12:36:41 +0000 (GMT)
Received: by mail-yw1-f197.google.com with SMTP id 00721157ae682-7fd85d01ed0so66160837b3.1
        for <devicetree@vger.kernel.org>; Mon, 22 Jun 2026 05:36:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782131801; x=1782736601; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=85/xXwMZH/nS0cbMX5lIOK4HcBaA7dvKpaLQZ9tszvk=;
        b=WAHnf2XAVRwfBo52BfsEkNmOu5B6trAJnBPjT4yuRzwzvsbjiYrOpxaQNYiAzgqVY6
         AJV4ocGcaoh/x0cxCkfNnCub7b1hCQHYXnGdvNI/O15aNC44+aulF2okbWyXgXWEGH3Y
         vn4TiEWE8ct2l1sJswvU9k9bB5v/+u82BvEjmDa7RbCkDlJK1RtiWZzkZYIxjXBJ1Eon
         Ls/+CMDyX5Fckdrpn58B4XStW7iHVlN10l3UkoQ5SWhYODjqwSr7a1xO5Mfp1RmezpV3
         /qLBQhgswpdPA1Bz3mksTPEN5AGRSWhjyQhn2lwz8URn53tYghagUsgdBn+XCn1EICom
         Ih0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782131801; x=1782736601;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=85/xXwMZH/nS0cbMX5lIOK4HcBaA7dvKpaLQZ9tszvk=;
        b=Ldwg0NpT2UwFJTaBPj5sFA5NgIkGK9XiuI9shhFEgPGuN7Cd5073bRQxKwrqkk9J8r
         hhZP0Wh8LjTu1060D1pyQ7d2lfEFaFkcyUA5js55ua/62pRilyYEtbKkKsTQlIxZvDSb
         gNc3l2QDJhyj2KbolhB5UWPzlagPoutq1mwNzaSnWo9oM/4KmLqXN1/XZ+j1MZrF2Hpy
         k3I6tZCObt6LJMp6DqWJjwLz/DTAvXgv8svxtPUA5Sboq7YiERdrQF5Zs2WBeDXuu6QO
         y6UkDv8O3u2O2n2EUbFqL/KcQ/N/K6paZyhnMdirKg1yu6Y6o/hR4jUheVp4aVyXFhUt
         4EgQ==
X-Forwarded-Encrypted: i=1; AHgh+RoKhC4qXDDxDwQd1gQ9hRWIVQ/hDPdG0OdBeqRtCe7kKiu2Spwsc9tNRdIsMhdiC0gFX0gUkeAJkCvS@vger.kernel.org
X-Gm-Message-State: AOJu0YwitFHqaOiboOJkUBG4V0h8ng0TynARhVop+tKOVpWAxqbcVWCD
	T7OZm5uEKtdqTHlPQZi1knrMliCYz+/hCaLFuFHeg7yFRpl2ZOkvJKFWHKl3aRSDpbHLrDVFmpK
	BPxRPi1oy7tqsDSK69ap8F2PxULx/Rb7ds6xsXpS/gNUtBjWab0tCPALouus/Ajnu
X-Gm-Gg: AfdE7ckA6xCdGQAa4FJXudmK3yvw9azxo8BHb76Aos2hhZ3XiEqsmFqPMPUFMxJXl5y
	vmaDJ4BXlloIwwiU5bTMeiToa1xnWj3uwi79C0YGEIY4AfKUXMwE8cls2baaByV/SpYq5Q1zO/8
	3EvpvY522UZQ/YGaj/12JrgVwIv4KypRYqRTU1PEhhrmsuLwWbh7RFrcFUmcrrzZh/YeJfRB9fU
	ytglrd323OxDweOclTIYHWK961A1akNOE+qhFVDBe2bDfZzi9r+7jc2L6C7007Ceoyza5HtsnU2
	m6KuK43vnTru5ikTHS6RMfhib1krB04X8YVPuO1m+UCGsjMEzzg61NLmqdY0krcdchuW3s3X8Aq
	pkuDWzxJLNB2eW1/CGJt91kueE96mhF7FmkyUQar/41bbD64cdQqxzU4xiw==
X-Received: by 2002:a05:690c:630d:b0:7ec:5c2c:1d27 with SMTP id 00721157ae682-802647b610emr97805377b3.15.1782131800881;
        Mon, 22 Jun 2026 05:36:40 -0700 (PDT)
X-Received: by 2002:a05:690c:630d:b0:7ec:5c2c:1d27 with SMTP id 00721157ae682-802647b610emr97805187b3.15.1782131800421;
        Mon, 22 Jun 2026 05:36:40 -0700 (PDT)
Received: from hu-qianyu-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-8025c96f1d9sm30796847b3.4.2026.06.22.05.36.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 22 Jun 2026 05:36:39 -0700 (PDT)
Date: Mon, 22 Jun 2026 05:36:36 -0700
From: Qiang Yu <qiang.yu@oss.qualcomm.com>
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        Konrad Dybcio <konradybcio@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, krishna.chundru@oss.qualcomm.com
Subject: Re: [PATCH v6 3/8] clk: qcom: Add generic clkref_en support
Message-ID: <ajksVP9WirekaMrw@hu-qianyu-lv.qualcomm.com>
References: <20260621-tcsr_qref_0622-v6-0-c939c22ded0c@oss.qualcomm.com>
 <20260621-tcsr_qref_0622-v6-3-c939c22ded0c@oss.qualcomm.com>
 <032d6002-2205-431a-abc7-7c0a010c9897@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <032d6002-2205-431a-abc7-7c0a010c9897@oss.qualcomm.com>
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjIyMDEyNSBTYWx0ZWRfX8rQ8dMFjGqow
 L14u4vScIUPTi1ETBoCUwtPB1vXNGK710qAR69yRhuTf/VHmPb+WahwYLMCBqAcvs86tQ9QWkSG
 04BVNcUem+TSC16ZfPJbxLKDgtPmDEQ=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjIyMDEyNSBTYWx0ZWRfX4enB9QVX9wRd
 +06RmVtwyiss7GhtI27hlV6S45lJzMo+wvAORPSaLTYfTodMRHAthRdvdLSlUhENDRzLIm9pxDt
 aag8LwtNwlK5cd7hZ3nTlxm3QJM5Pb7ITP/qqzS3YT/1Whu8Yck6BP+P6sL7psp3bDb1R9+TbYt
 HnYWnTbx4BYt4ZxJ7ofcnoQJonP/jqOlpY7YWgpR2xwiU3gzfX/V0U5bKusVqIySkZui+Jp9O98
 BpmvZ3lLjVvCx3mvrsbCPgvqLnSNBEwTWKOKm4aBHmKxVjeVm94DrV1UVqvfN1aHZxurSBEubsv
 /9ha2QDWQz3EECxmZaMUn817S/eB5Wzq5rQZ9aBbSRIFSePq9M4mq+ZLSfXIKBVHqjy5h98jXcp
 VYieDUBOHpq37sz6SMswdkTBBOksSDYg5cOZG2WVUQeqNgfeqpS3dMjmS1dSW6MhY/Awu+k3Avf
 GFGJEO9YmC2/aF3BRvg==
X-Authority-Analysis: v=2.4 cv=ILIyzAvG c=1 sm=1 tr=0 ts=6a392c59 cx=c_pps
 a=0mLRTIufkjop4KoA/9S1MA==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=kj9zAlcOel0A:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=EUspDBNiAAAA:8 a=ZFdlRjhBVKwB3rJM7cMA:9 a=CjuIK1q_8ugA:10
 a=WgItmB6HBUc_1uVUp3mg:22
X-Proofpoint-GUID: MvbCXuHESsMgsaKlLdbcW6UQajVmumXx
X-Proofpoint-ORIG-GUID: MvbCXuHESsMgsaKlLdbcW6UQajVmumXx
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-22_02,2026-06-18_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 priorityscore=1501 bulkscore=0 clxscore=1015 adultscore=0
 suspectscore=0 malwarescore=0 spamscore=0 impostorscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2606220125

On Mon, Jun 22, 2026 at 02:13:22PM +0200, Konrad Dybcio wrote:
> On 6/22/26 7:11 AM, Qiang Yu wrote:
> > Before XO refclk is distributed to PCIe/USB/eDP PHYs, it passes through
> > a QREF block. QREF is powered by dedicated LDO rails, and the clkref_en
> > register controls whether refclk is gated through to the PHY side.
> > 
> > These clkref controls are different from typical GCC branch clocks:
> > - only a single enable bit is present, without branch-style config bits
> > - regulators must be voted before enable and unvoted after disable
> > 
> > Model this as a dedicated clk_ref clock type with custom clk_ops instead
> > of reusing struct clk_branch semantics.
> > 
> > Also provide a common registration/probe API so the same clkref model
> > can be reused regardless of where clkref_en registers are placed, e.g.
> > TCSR on glymur and TLMM on SM8750.
> > 
> > Signed-off-by: Qiang Yu <qiang.yu@oss.qualcomm.com>
> > ---
> 
> [...]
> 
> > +	for (clk_idx = 0; clk_idx < num_clk_refs; clk_idx++) {
> > +		clk_ref = &clk_refs[clk_idx];
> > +		desc = &descs[clk_idx];
> > +
> > +		if (!desc->name)
> > +			continue;
> 
> Carrying over from the previous discussion:
> 
> > // this allows "holes" in dt-bindings for $reasons
> > if (!desc)
> > 	continue;
> > 
> > // this makes sure the programmer did not omit something important
> > // while not taking the entire system down
> > if (WARN_ON(!desc->name)
> > 	continue;
> >
> The NULL name check is intentional - the descriptor array is indexed by
> clock ID, and mahua has fewer clocks than glymur, leaving holes at
> certain indices. So this is expected at runtime. WARN_ON would be noise
> log here.
> 
> 
> ->
> 
> Your worry is captured by nullchecking `desc` (i.e. descs[clk_idx])
> 
> because in the mahua case we've got (ephemeral indices)
> 
> tcsr_cc_mahua_clk_descs[] = {
> 	[0] = { foo },
> 	// [1] is unassigned - OK
> 	[2] = { bar },
> };
> 
> while (!desc->name) checks for:
> 
> tcsr_cc_mahua_clk_descs[] = {
> 	[0] = { .name = "foo", .offset = 0x10 },
> 	// name is NULL by virtue of partial struct initialization
> 	[1] = { .offset = 0x20 },
> };
> 
> however I overlooked that we actually just have a normal array of
> structs.. if we turn it into a struct pointer array with assigmnents
> like:
> 
> [TCSR_EDP_CLKREF_EN] = &(const struct qcom_clk_ref_desc) {
> 	.name = "foo",
> 	...
> };
> 
> we can achieve that

Okay, I got you. I'll switch to a pointer array in v7 so that we can check
!desc and !desc->name for different purpose.

- Qiang Yu

