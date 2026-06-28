Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C2008285CAD
	for <devicetree@vger.kernel.org>; Sun, 28 Jun 2026 12:21:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782649313; cv=none; b=WRC8UqxSV8PkBFf8FaYNbeZNXSvvS7P84CEDNVgtV2zAsD1xCgaN5CoVWVEBjZtjzvQAOpKV1ZF9dAuPcAk67w/0JEXFHSulAYFC/ku6gzddBViqrhXyMEFKpUCy/cLBYvoNZbVfNcjrddSNmaodR/v4cXIFBZ+5QmUVXSP2TpU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782649313; c=relaxed/simple;
	bh=op+WxGLW/kXdCgZoTqKhzgjCtbMEgvMQu7dtKBTVzn8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=skSIUyT9yzFjLSRZwDKahehREjlbVAkOyvHKggEyTEni4r/c6aCHK5BAZL97FLGgookMm0S/qFifzuPfhjbQuDRiTSrMr3I38Es3dbD6bJ9cZ4GrfQdx/p8RGNSEuBz+uE6J0uqpBnrw+hwpuhYRnW/AsZYHCD3Uqf+0Cd21zKk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=cEvm5LaZ; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=XGjO+Da+; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="cEvm5LaZ";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="XGjO+Da+"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65S9OsAg3599420
	for <devicetree@vger.kernel.org>; Sun, 28 Jun 2026 12:21:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=J14lsnd3NQDwPVQNQqOHvTpy
	FDHrkkC3UBRz+c0Wth4=; b=cEvm5LaZI1t4QUCWs+5Vdt52fLbfpWBtbzfoEzh7
	4M9UO5osVJvAlCGrFgFDF3i/xWioK8/CRLFKSCVMtvpNR2Ja/0QgEZFdxhklHy2Y
	xXAqhS9cAHYJcP+jwR5dDJypctdgFCtWC1NcrE7a3mvqU5p6TVfOXkvkz37x5mBr
	maN1IBw6ps1DeT8dy+y195Zk7u+3pPTfknKV05Ze78WGy0dM6eqZ/7SkbH85sfm2
	+9juDyaGigUc3xu6eXiOr1UacxtQ8uBHxQzyyDBemSpNc0RcFYU29eUXuP0Ggz7W
	d5ZmVKV2rFWGD4rnEC6SogN5ao7lA6nUS/fBpdFxehDuZg==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f27t7tqvk-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Sun, 28 Jun 2026 12:21:50 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-92d4b18b373so231939385a.0
        for <devicetree@vger.kernel.org>; Sun, 28 Jun 2026 05:21:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782649310; x=1783254110; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=J14lsnd3NQDwPVQNQqOHvTpyFDHrkkC3UBRz+c0Wth4=;
        b=XGjO+Da+YK0C09+3r3vEOIacWFcNIanDDL9kqIgl+9XU7zSp7BuBF56kpCsnlGQUpY
         yT4uHEWUsr4cNrQYS5YgZysaa5XrWfQBXJp8IvGJzOHqrQYAnTPG2IR9Pxp2dwkVafqA
         4lAHSWZPHZp1OoWV8L6emG6uaG3N7+ss0qnZMG8I3nf+RI5L+iHZImgTwFqLN8/WFL7U
         rOzdKWMncDcBYL+GuTLep5DV8Zzf4NU+Ytc+ca4SJlb4rLyHCfeOXwSIczDb+DRXFd+m
         NerdTDYV4bSOB+1aX8idodcG/vRow+j01OgHkcbCQtpDrky1o1qusBnZjw2a207dyvwI
         Wq9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782649310; x=1783254110;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=J14lsnd3NQDwPVQNQqOHvTpyFDHrkkC3UBRz+c0Wth4=;
        b=lfvvV5g6ZE8r+22MxLUXYn7UrCWoRVCl6ABLFFKgfPoTB3ZZ4fuBtgM3OnKdTnlvRt
         Dgec1iH+HBQ0G3cNhELbjzc0Tfs9gs3RRCAeogoqYOO305wicfm1VJUmmEzeNeEhrP54
         qoAK3UoNbviH6pS+amcbB/ZmKbSwv67J5/3hyXc+Pg1uaToqkk7TCy6lgFnAnCnJBc8u
         +qE2c7+110OLo0RLGs0UwyAZfy4sW+AoGacOVFsUXwp3K7zO+tKZBNxRCznTD5KKY7Yi
         Ck9zuMa4vZgryj5aeoTzdP1fUu/5SOB1hzyDksOFtqQTljG34FPhuHCGY8gd883b1MxL
         9Bsg==
X-Forwarded-Encrypted: i=1; AFNElJ/t2XEVKr8ANH6lpRe8TjFVN3puK4XnaNLyqhT5ntoAFiKNwmA0poyot0cpVIi66y6RTlruZnGprzjJ@vger.kernel.org
X-Gm-Message-State: AOJu0Ywya6cpAMW49XLPzj9pFj0tQ1XYpYTSag5qePMy5N9n8a2BljK9
	SzttyXMm1DzaFYq6b0orB+N33Rz+6GPZiNtjFIY8DcEunPYMW6hIHPgKwmXs6sjHDiKiUlR7kc/
	D3bmnmC7fmnTzQTS5JGZO1ShedeecGvgJSGaeRn2mlPKxgLVHUqVsnSmmCgypWmhW
X-Gm-Gg: AfdE7ckufKZLS7+k9jppkl3IPaQ271LaEpbosm+15l8rh1KAx2FSpVo4tMyha7zxrwv
	F1Pp6TFH9+0nMeLFKZWlgNjdlweE/bWALsQ06ckhVlKzlRYVchdzcmUfj5bp/jG6L+2/60ZJzwR
	xfn3Owve5/j1XJ4LulbpEXXZmFMS6lKYi57MCmmAt2iUnK13W4Lnu5yB06acDcQTK07+2EzocQe
	CoDf5q6+DjtswMXgc4cD0iMvulANb3vSzAeR0Q9bcyXdbDZQ4BcObv2sWIl/P/IAZjpWyUpQ4Nx
	/uUbjFiMVdr7tgg0HWG+g0R095cxs43wR7ckBD9v3UAKGMnF5aYMpNivD7YBdbxhtvhLTtzzofl
	mAzw7wvxEziFvigOO4Qblvn03F0ItM9yZKlHoHWLZhlEH+UdaLiTkhC5kN33juRmEKFFN9ZMPxK
	wdB1bzHjhjwKf8qH2cmhM2vUxY
X-Received: by 2002:a05:620a:1a05:b0:92b:6805:9181 with SMTP id af79cd13be357-92b6805af60mr906110585a.73.1782649309882;
        Sun, 28 Jun 2026 05:21:49 -0700 (PDT)
X-Received: by 2002:a05:620a:1a05:b0:92b:6805:9181 with SMTP id af79cd13be357-92b6805af60mr906107685a.73.1782649309336;
        Sun, 28 Jun 2026 05:21:49 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5aeb0ee9edesm965035e87.49.2026.06.28.05.21.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 28 Jun 2026 05:21:48 -0700 (PDT)
Date: Sun, 28 Jun 2026 15:21:46 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>
Cc: Mahadevan P <mahadevan.p@oss.qualcomm.com>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        cros-qcom-dts-watchers@chromium.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Mahadevan P <mahap@qti.qualcomm.com>
Subject: Re: [PATCH v2 3/3] arm64: dts: qcom: kodiak: Set up 4-lane DP
Message-ID: <s7gon4o57b3fe2kuz5lell7yb4iw6tdmmg7l3emapbqkwx3ml7@irg2myydcmyb>
References: <20260429-kodiak_v2-v2-0-c3a703cc30eb@oss.qualcomm.com>
 <20260429-kodiak_v2-v2-3-c3a703cc30eb@oss.qualcomm.com>
 <akCGiJU2pIlLEi-D@baldur>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <akCGiJU2pIlLEi-D@baldur>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjI4MDEwOCBTYWx0ZWRfX5d6XjzCCtPC7
 Hcn53ajQgKv1kjtnbVaSGr3GmgLOVtlw0Fp7Z1xOAT14c3+bs5gB1x7X2qSwRdenT9YGT89It5I
 ehJkA9N9DNHvCA32aDakhkhEu/ax5MYzRxkcvMClUpHIbBXmSN65S1VJAGCXFgaeBt9mrQw+5bA
 PwEKH9HxPO/9I5OczbHbPfn3rzB9PUKgaFS7z2mx8NOB5/ZI7HeKXedI9t9oDETN+K8M1caGhjt
 meZaur3DFq+TN5xEgT7IWHF5tSK5KHpftiocDh3mg61H/Ckjz3EIM9GFNSoM8HqtejS236PVOLh
 uxpfAFAcpT8T2wJaAe/x6RRtxh4bVYRW+jzSvhAQNL9TaCUuJJLLA751cKciFdr3mzMpr8c8GOt
 WDIg5YmppWt+UO3PSh+N9mm2ndRNO1JUAhekrEHfKKx9JHV4iHrmRXJp373YoXm+0zFxASUR+CQ
 8E2A+xdEC5X1GZLmowg==
X-Proofpoint-GUID: Jfq6eIRhQxFWs4Wbud0PqhrJhGwqxt7c
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjI4MDEwOCBTYWx0ZWRfXwkVFRANVSJRw
 tTP/NzcikIYb51KyzB30wZJTKhQouxwFoz4VVz1qDgcvAiLrJRh+vDV9Ed42oVWCK+B2uneX11h
 Z/GjMYjTKjs95kkUeI1Xbg6D+2rVex8=
X-Proofpoint-ORIG-GUID: Jfq6eIRhQxFWs4Wbud0PqhrJhGwqxt7c
X-Authority-Analysis: v=2.4 cv=BdnoFLt2 c=1 sm=1 tr=0 ts=6a4111df cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22 a=EUspDBNiAAAA:8
 a=aVfzaUfxNQgOLwLD1RIA:9 a=CjuIK1q_8ugA:10 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-28_03,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 phishscore=0 clxscore=1015 suspectscore=0 bulkscore=0
 impostorscore=0 spamscore=0 lowpriorityscore=0 adultscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2606280108

On Sat, Jun 27, 2026 at 09:28:47PM -0500, Bjorn Andersson wrote:
> On Wed, Apr 29, 2026 at 12:10:42PM +0530, Mahadevan P wrote:
> > From: Mahadevan P <mahap@qti.qualcomm.com>
> > 
> > Allow up to 4 lanes for the DisplayPort link from the PHY to the
> 
> It's hard to follow your thought process here, as you didn't document
> why this change should be made. Start your commit message by describing
> the problem that your change is solving.
> 
> > controller now the mode-switch events can reach the QMP Combo PHY.
> > 
> > Signed-off-by: Mahadevan P <mahadevan.p@oss.qualcomm.com>
> > ---
> >  arch/arm64/boot/dts/qcom/kodiak.dtsi | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> > 
> > diff --git a/arch/arm64/boot/dts/qcom/kodiak.dtsi b/arch/arm64/boot/dts/qcom/kodiak.dtsi
> > index 0acc6917d7aa..204513a6bd89 100644
> > --- a/arch/arm64/boot/dts/qcom/kodiak.dtsi
> > +++ b/arch/arm64/boot/dts/qcom/kodiak.dtsi
> > @@ -5704,7 +5704,7 @@ dp_in: endpoint {
> >  					port@1 {
> >  						reg = <1>;
> >  						mdss_dp_out: endpoint {
> > -							data-lanes = <0 1>;
> > +							data-lanes = <0 1 2 3>;
> 
> And as Dmitry pointed out, not all Kodiak-based boards have 4 DP-lanes
> wired up.

As a bit of explanation and context for Mahadevan. The link between DP
controller and PHY is 4 lanes. Historically we have been declaring two
lanes here because the DP / USB <-> PHY interaction wasn't finalzied,
so it was not possible to use 4 lanes for DP. The issue was solved and
now most of the platforms should be able to have all 4 lanes here.
However in some cases, platforms like Herobrine use this as a quirk,
because it was impossible to describe various quirks that they have
implemented (in case of Herobrine it is a fancy 2 lane split / mux).

I'd recommend the following approach: enable 4 lanes in the kodiak.dtsi,
while, at the same time, leaving 2 lanes for the following boards (which
should keep the board-specific override for now):
- sc7280-herobrine.dtsi, it requires special handling for 2-lanes
  topology
- qcm6490-particle-tachyon.dts, it might be missing a redriver
- qcs6490-thundercomm-rubikpi3.dts, it might be missing a redriver

The Tachyon and Rubik Pi 3 boards might be missing a redriver, which
would need a reprogramming to support proper 4 lanes DP (or they don't).
Anyway, that needs to be confirmed by somebody having the schematics.

-- 
With best wishes
Dmitry
