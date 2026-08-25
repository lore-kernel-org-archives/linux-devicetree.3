Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CD0CA3E9C18
	for <devicetree@vger.kernel.org>; Tue, 25 Aug 2026 10:22:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787653342; cv=none; b=oUJDcU8lYrDOaYGwyn1GIfEDNWgD0WRAIeQ9wCnL8aGEI8dkdwomgEdHtLEpZGzu2uFHC/rjlYiZw09nhELY4Ra48wGrj47h9eMdeOLeGH4X3eoS4YJFilYxSaD2vnSvwze9NyJC81nf2wfzguk2bSFkoA5mMAfxCJgpXLC7q9o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787653342; c=relaxed/simple;
	bh=GJFDRhyTKtH6Izn8rdynEq5M44P1WOKHRma5Jb+MmHI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=dqxemyAQMJ6fM1y4/zbDvtsIgIbCm+lTSuQ3S6ng/PW5+y/UZkIsDEJOyJ5rYgVY4VkWdM7vSDTZnhAmLJWddNJMUppivpnitAgBlmxQLL28m139Qt6ZkOgmfU/SvDgKiVsjLigv9dMbjDKrhobkPYIKiYLkXYzX/yZix2THz2U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=gBlRRcsm; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=C1LC0SXs; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="gBlRRcsm";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="C1LC0SXs"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67P88RK51163447
	for <devicetree@vger.kernel.org>; Tue, 25 Aug 2026 10:22:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=bJImmiv7g+WZA2AHfU3WCtfL
	PUFty20WPiJTUbvp1Ag=; b=gBlRRcsm6VGBowDqCGvfX7izQgyHi+Ec5eH55DIi
	016FTxr/oP1/15lHLxUnRcietucqlhUhe/2agOsKUOJ7IAWwDSO4xGdy4vPvS7DC
	tvg446bpGYHLpgPujnyrlFOp0LIR48SPKc6bcQKuaeinVdPmMvNQ33Zd81PCIXmG
	lRh8CVfcXosUeejGuMJbRo2tS/snyTHXVwZ4AASZlwScxfY2jVwWGHodoArRFPdl
	kOday5Qa2H4QL1W14phuo8N6rISbTrq9CGoAKnL6ntNhmCCllyHgt74QUUKtR8ah
	6HXTtT2du3YXZgcl3EtDjLmUDUdc0stcNlPZrIeD7H0T6g==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g8y5jj7vy-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 25 Aug 2026 10:22:19 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-51c1c7f135bso80918011cf.0
        for <devicetree@vger.kernel.org>; Tue, 25 Aug 2026 03:22:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1787653339; x=1788258139; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=bJImmiv7g+WZA2AHfU3WCtfLPUFty20WPiJTUbvp1Ag=;
        b=C1LC0SXsePip7J8htJtzHx2GXr3vbgciDWt9QvfL1+AFawDXXJORfxs7BHEzCvfgpK
         1Xiz9zhENldWf61itw0tVxzsKCHeIeHivRSwDBhX+oWWS/rXiQBuf1KkQR7vUvi7//64
         lfaGiNxBprZIpP3Dr5g1zQQnDssuI7/aX26Ot71Bg1xQevz8VLu8LcEKJTpWQzU2CQv0
         mc+7XgayJSKlnE83ffrSGxOHAopceBdoJoEdmgciUMq9s6NbHhbf1JA2zjoifvLmJGOH
         L1LBjxDc4R5jwegMGmeT2AE4bn7TXeOkS9B+Zq+lrwl7h2GU6mUqVW64js6I6ma8l/ez
         b0tA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787653339; x=1788258139;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=bJImmiv7g+WZA2AHfU3WCtfLPUFty20WPiJTUbvp1Ag=;
        b=BmGGLWtLhrJ3+efM6ImEQvAL7lDkidRNeBDnss8xJzFH1YF6fztG0dvM0iBOUaSgsS
         q20XcY3DCwerpLiFsPp0ZIvCVy2xnhB/XeQJO5QsA7rmzgui7ORpi1ot58uUlYxXOMa6
         bKYKLJfGoRwzLYThWbrJyhLBpx+cSNCxeXbbys+wuTLl8med2GZT6Fknk6cYghcJUNmi
         /5+oxrduDhTsJRcUfXaYJAoTbEMAF6zOVgGy+2k2A36dAV8FMdL7I2if+3FHr6tvufWC
         cibzyPUaJbVqyQxkzPVSpR+nZoVsPuu2ZiPcz+a+otlQdZjf66LGGjAJldEHc55ghm3J
         Tr/A==
X-Forwarded-Encrypted: i=1; AHgh+RphcV/JbAfvLpknElvQ7NHUb8UK4K7xTWsjly1b2CtkSeDC4pyUi2jvstaWh5d5hyat5wv4ToaIfcI0@vger.kernel.org
X-Gm-Message-State: AFuF++mo1wEDK9YOecupoqKmtDis47pj3TSibllHJpvEYt84hTrX+6rD
	4NCUOcoMTTdxFtmeCmZkJWa3bh6vrMF+0aOvoz8ARvaPyCJ7zF1izGyHCLiZDR4xHDg6g7agpci
	axAam+e2YZK7hqvjqTOS1BafjB2YcSUMWDCaGFNC+L2euC+IInhrtDQ4tmBOFv04D
X-Gm-Gg: AR+sD12mB5j7yWlkbtEYunFtpMdJMs4bSbVmauFdFWCCd9CfIqMCs/3GMgyyOphVIAE
	nFnP7/c72PXzbBKTtopyC87iHe88eFYYrV/Z4hJYX/B0wKIwjazrl2c9+1lZy1yXYK7fguJeCjs
	k+w80nPyK/ALrBGFVrVpFZdOJXLTsHPuiHRCL5XambP3H+a/3JdfpSyBOa94dOiNq1dqlSc+DYo
	x467ysDV3vdW7h1K1tnPlBWsYsXcTVVJhMER79hDrH4TAmStPLJq7gACaF7uB2NV8xQUpx/rpBy
	ZfQj/2VH8oIrH8Wwy4/BtD8JE1kadfriucby6WZbaIUPQtB/QHcsCJasvjou3XrUJE3jpB/yyc7
	pRjlCqStaYRQX
X-Received: by 2002:a05:622a:1816:b0:52d:92c1:b7b2 with SMTP id d75a77b69052e-52e2f05c281mr56398031cf.2.1787653338737;
        Tue, 25 Aug 2026 03:22:18 -0700 (PDT)
X-Received: by 2002:a05:622a:1816:b0:52d:92c1:b7b2 with SMTP id d75a77b69052e-52e2f05c281mr56397561cf.2.1787653338216;
        Tue, 25 Aug 2026 03:22:18 -0700 (PDT)
Received: from oss.qualcomm.com ([86.121.170.13])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c2496297c7dsm1666390166b.20.2026.08.25.03.22.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 25 Aug 2026 03:22:17 -0700 (PDT)
Date: Tue, 25 Aug 2026 13:22:15 +0300
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
To: sashiko-reviews@lists.linux.dev
Cc: robh@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org
Subject: Re: [PATCH] arm64: dts: qcom: eliza: Connect USB3 PHY pipe clock to
 GCC
Message-ID: <44tqqiftvfrooqx43v73ebfjwy7pdwvocpbutyefcqfslzi7e6@itpqiwpw4woj>
References: <20260825-dts-qcom-eliza-add-missing-usb-dp-phy-clk-to-gcc-v1-1-f0d3719f798c@oss.qualcomm.com>
 <20260825100722.9CEA41F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260825100722.9CEA41F000E9@smtp.kernel.org>
X-Authority-Analysis: v=2.4 cv=O5QJeh9W c=1 sm=1 tr=0 ts=6a8d6cdb cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=clBUptZa5v5FR042Ey+sjA==:17
 a=kj9zAlcOel0A:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=_8os4LfOatdM_aO-9CsA:9 a=CjuIK1q_8ugA:10
 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODI1MDA4NyBTYWx0ZWRfXwH2NIhOzct5b
 6mzTetC1JrHww0zS3EOlxkutnTsD4YhLjnkdBZ6ASnCFaTRBGF6unn8FiDfWBhRR9Rzh7mhf8CN
 J1LXV1QuCTmWArkjV09eu1oDMLDwQa2Oy7uGFKB/vt+mdESB+o+NKFf92uUULf4FJAPEupNTDWN
 9WLV2QdMn5UPKaJ/FffYduKif4EmZeyBve/eww7Uzwy8MAvMBxS6iJ08rYKIZcKWIZWcMXBUIuk
 xVxjgQjGLdkvrrlyt/gQ18f0v0j5V4pn/uWhSrIwfKlBwZi9rJCPRTXylt7ioQW8vBXRW5QIbvE
 +ltfj+Kn5eDWMzSpUjHJhGm4ZQOV7O2Pl1iv86hSS+aNvRRC7GwJlw1uOr7ZmuPwiDLxYpnhTjY
 vTOsQxTrIKAqBYbW50oMlNeJb7ih++e2X5tIvJwQ00cUh5CleIzWrgrmy6MkpfM1jPRh2w3XHo/
 DvWdq4IBg6QtrqyXfxw==
X-Proofpoint-Spam-Info: AW1haW4tMjYwODI1MDA4NyBTYWx0ZWRfX0FjNR6usX/X8
 ca9F8dntWlJ+dbgUAwq1yuV45OeKRhwKBGYehqfenkJb/uIq/NeOZDyKYFMBi7FN7TmOALUVs1g
 B3mzpf2l177bfjLyWgkmxaSyrifc0nk=
X-Proofpoint-GUID: 5L39n3rWq43sqInxjYYv4nFqp7OjfezH
X-Proofpoint-ORIG-GUID: 5L39n3rWq43sqInxjYYv4nFqp7OjfezH
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-25_02,2026-08-24_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 lowpriorityscore=0 spamscore=0 adultscore=0 bulkscore=0
 suspectscore=0 priorityscore=1501 malwarescore=0 clxscore=1015
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2608250087

On 26-08-25 10:07:22, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 1 potential issue(s) to consider:
> - [Low] Incorrect macro used for a clock specifier in devicetree (PHY ID used instead of clock ID).
> --
> 
> --- Patch [1]: [PATCH] arm64: dts: qcom: eliza: Connect USB3 PHY pipe clock to GCC ---
> commit d454bba6f2028b4ff89f276f88a76156819977d9
> Author: Abel Vesa <abel.vesa@oss.qualcomm.com>
> 
> arm64: dts: qcom: eliza: Connect USB3 PHY pipe clock to GCC
> 
> This commit connects the QMP PHY USB3 output to the GCC clock controller
> so the USB3 PHY pipe clock can propagate to the USB controller.
> 
> > diff --git a/arch/arm64/boot/dts/qcom/eliza.dtsi b/arch/arm64/boot/dts/qcom/eliza.dtsi
> > index 66ea4aaafd73a..2e0fbbfcc47d3 100644
> > --- a/arch/arm64/boot/dts/qcom/eliza.dtsi
> > +++ b/arch/arm64/boot/dts/qcom/eliza.dtsi
> > @@ -655,7 +655,7 @@ gcc: clock-controller@100000 {
> >  				 <&ufs_mem_phy 0>,
> >  				 <&ufs_mem_phy 1>,
> >  				 <&ufs_mem_phy 2>,
> > -				 <0>;
> > +				 <&usb_dp_qmpphy QMP_USB43DP_USB3_PHY>;
> 
> [Severity: Low]
> Does this use the correct macro for a clock specifier?
> 
> It looks like the PHY ID macro QMP_USB43DP_USB3_PHY is being used here
> instead of the clock ID macro QMP_USB43DP_USB3_PIPE_CLK. While both macros
> currently evaluate to 0 and might not cause functional issues right now,
> using a PHY ID for a clock reference makes the device tree fragile to
> future macro changes and violates the expected bindings.

Good catch. Will fix in v2.
