Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 28DCA2DFA3A
	for <devicetree@vger.kernel.org>; Mon, 15 Jun 2026 06:14:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781504084; cv=none; b=VFsqQ8a0EurFpLzVw0v7BQhARyxefKkA7G7Lq7BKfqZ4X9ArJvHOM5ZMWei8FZiaFosyvYO/K6sq5ViRJ7GmZRxnsTXp3uzrZjhG2dKbkCXHr6tbRJox3YJh+S4mtzuAUKTiJC5oWTRZeDfX4vuMtFG5537V8xJEtDJY2uDIgN0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781504084; c=relaxed/simple;
	bh=RIPYm/CUa09goQMugAIcuhg/UpG0S64W4m2O0sjKqWQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=sVCRwP5JEEOfVo6AlFWrijo0oyJCE211zD5ZDYdDbrsOKA0Ft8Ul7pt24b6j6srJlRi3NEbtXu1aQozzZl8Cd0jfa9JSYXl/xbM7OK26egLuq4eFkMQqtuErtwI+Liidad4omiipxVHg3Tev7qR/DFEYZJr/Io7AJ9p+IN5yfYA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=lHH6tC92; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Xu1lS0iW; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="lHH6tC92";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Xu1lS0iW"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65F1i1Ma1227808
	for <devicetree@vger.kernel.org>; Mon, 15 Jun 2026 06:14:42 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=YProC4RAIvitDzBqe9nWs3TI
	F6R0TVSPPxcZHWa5Bo0=; b=lHH6tC929dKrqi7GucUZWtN0cq9wJHW+LhvEhXUa
	A3bFcKLduGBEmN8dtmeSNgEhikLtivuQFm2DfhZ75P4Ujin61ZCJjZpCd+7D0vEa
	A/C9wwbI6LSzL2xLFyX0lnJ+E9OpL1iVOTsf67jy26dQt/CYuPEqLAUKcXP9ngkn
	mR0OMvjqCgTyncDNXpgpdRjSkAVRYgkRlBKWwqsczv0yhXxIw5ytMz6g4429aUKs
	eZGD75GLsAJGcJ2pMn0qSgNTZiyP4vTFDPNOfa31ldxfDEta89UKwE5280L9WO6a
	+QGBw8c9jtHbEnHQHFcKh71wmaEOBX4Ub5WsQQ1HdTCumA==
Received: from mail-pf1-f200.google.com (mail-pf1-f200.google.com [209.85.210.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4eryffnsge-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 15 Jun 2026 06:14:42 +0000 (GMT)
Received: by mail-pf1-f200.google.com with SMTP id d2e1a72fcca58-8423770d72dso4366292b3a.3
        for <devicetree@vger.kernel.org>; Sun, 14 Jun 2026 23:14:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781504082; x=1782108882; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=YProC4RAIvitDzBqe9nWs3TIF6R0TVSPPxcZHWa5Bo0=;
        b=Xu1lS0iWk08AKma2JpXSSOTX+eHo2k8qbkP8WRK3naqSXpYV5vvlPH/i2wfrIZo/eg
         MpkM7YZgDIydxtCRfCgN0EV/POZ/enQYZBpqBhLY7QxQFqpaInloQUBbLxg/QwzCcU5o
         FLoSgdoYNi9hLL1OZ8IGxzrUX/wX4Tugqhu4odRaELeT78EgZmdsNAmI5xclQMPhz9sy
         L84+bccW6zdsdmRenE3P+pYnWvPawoQa3rmXgbQO8tYjYxEWTGbf1Tlf+dgCIhNhnmaV
         /Npsra2uCJ3+96l5/h7tADJx0lM3fbvkawDcruu6QWX4+Gcp3YNoMnCyqKUZboKR3MKd
         19aQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781504082; x=1782108882;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=YProC4RAIvitDzBqe9nWs3TIF6R0TVSPPxcZHWa5Bo0=;
        b=jgGGJFEYbMXI4WOs6684Df1UIuvD3UFLlAsp8rpE8lcdoKbnW65C5a3Gzr2E7okk0O
         ACSe6+CEUGt1hKBwEC6Mp7wKVh0L4F40O5t1qoTEyhbr+nHKz07N6gWbbIdkKriGJnsR
         Fr6MXdLzoTVrAVnIKX5dyaPCEIzaQxT3O1jynY1pVF7VHJZyHqFO7IX8mWFK4EOm9Tmr
         dPto4J1KmnYBeuk0h8E+Je60m7S7qS8N/JnspiNkLOfeYHJrGegmnSJHiJ0PjOZIT0oS
         m1cNZcEiDMNEDIGhkM3hvKlkBQ9Waqwmx8mB40WF+XZUVH9OVQtrWlKze+Lw0cDK5EK1
         PrpQ==
X-Forwarded-Encrypted: i=1; AFNElJ/+W04GGPZemOZTcCEgyqRYRdU8SHKS7i1YOKTlz0RqcqT8jxV/d+bjbGGp5t+qsE6yJsUFWvUOUFA8@vger.kernel.org
X-Gm-Message-State: AOJu0YywC3Fymjrd2PtW9DZvCImXmmEEY9N0QTswZxJTdayCiGoB9T0M
	+Kyt5BScqSQLYWSsCvTJnB+RCj6BmoW2TDbEILTUGEFBMD71tikP7WBFqYKx6lohSgt8CUA8RgF
	ZVRkSli1spSGPzT9e/VsyUWwCbsbHSDXaX+mxf69LI6/PjW586H3xz8nxvq2ljur7
X-Gm-Gg: Acq92OFXTlMaQoP8jh5FWF8B0ie1qODAvpZydx2HUM8Zt+YdshRrVtsWYdayAFb4vyH
	9uCHyIZhFbvftImsPH1AOyXpPWASwi0Ng+AW+8Plvuwv5zeXpy+6+QY20hwwaobKJUh9M6kW3SC
	zT622B2TX1QFGsPHdQlNLyigXG0+r97NPDX8pmQ6cQl5uomBBx5Lu7yWIOtcu3UqYAutaFN1GNH
	wrADQGWhzIDdUwB9cFbiWlkkclIE0pwBpPXR+FsYttJYWKKZIJtCPvOFXYZaN+PUmNrSBO0R30r
	ommRnzlsR3HyNLDUwvO+zsaSK0OjHjjStzc9iyXXxWclaC2i/nYGA2vPj4EaaOnHUUq6IKhHvcf
	ABpjxLwNN+0JBcGPHRagHgUaRAV2ahyTB1QTqJ7qIbvgRqxiaVasCUJ+StAwOGfdKR5cIEuh66U
	c9EIMiNwpNax/FtKQh5sg0vU41d0JS0lh1DtvUU4TCioR4dXEiFAk=
X-Received: by 2002:a05:6a00:418b:b0:83f:250d:59c with SMTP id d2e1a72fcca58-844e1a97288mr10503343b3a.39.1781504081636;
        Sun, 14 Jun 2026 23:14:41 -0700 (PDT)
X-Received: by 2002:a05:6a00:418b:b0:83f:250d:59c with SMTP id d2e1a72fcca58-844e1a97288mr10503312b3a.39.1781504081115;
        Sun, 14 Jun 2026 23:14:41 -0700 (PDT)
Received: from hu-varada-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8434ac9bfe1sm9310494b3a.12.2026.06.14.23.14.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 14 Jun 2026 23:14:40 -0700 (PDT)
Date: Mon, 15 Jun 2026 11:44:33 +0530
From: Varadarajan Narayanan <varadarajan.narayanan@oss.qualcomm.com>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: amitk@kernel.org, thara.gopinath@gmail.com, rafael@kernel.org,
        daniel.lezcano@kernel.org, rui.zhang@intel.com, lukasz.luba@arm.com,
        robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
        linux-pm@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 1/2] dt-bindings: thermal: tsens: add ipq5210 &
 ipq9650 compatible
Message-ID: <ai+YSXiHMolyk/YG@hu-varada-blr.qualcomm.com>
References: <20260610081241.1468507-1-varadarajan.narayanan@oss.qualcomm.com>
 <20260610081241.1468507-2-varadarajan.narayanan@oss.qualcomm.com>
 <20260611-active-strange-porpoise-7dc9db@quoll>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260611-active-strange-porpoise-7dc9db@quoll>
X-Authority-Analysis: v=2.4 cv=HuxG3UTS c=1 sm=1 tr=0 ts=6a2f9852 cx=c_pps
 a=mDZGXZTwRPZaeRUbqKGCBw==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=kj9zAlcOel0A:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=EUspDBNiAAAA:8 a=Yz-oc_1U6DHBXyOLHCoA:9 a=CjuIK1q_8ugA:10
 a=zc0IvFSfCIW2DFIPzwfm:22
X-Proofpoint-ORIG-GUID: zphCJF8lLC0Zg1x_FiL_a6QXA0Ul53Pk
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjE1MDA2MyBTYWx0ZWRfX+2kQqB7Mh5FY
 eClTweSS8Xhqke14rlJ+CxO06Uo2zHFUWl6Y5blNX0Z1IySbTxP2psyeSOXTxI4DH91G0OAWzg8
 bSKcqk8H7oNoPPVDUsXHGD9Xm8wGStI=
X-Proofpoint-GUID: zphCJF8lLC0Zg1x_FiL_a6QXA0Ul53Pk
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjE1MDA2MyBTYWx0ZWRfX4rM3gY10MSYb
 pcpN1WGJzIPcOd9rl/oPEE7VWwbft26E9E3UVN8mw7XobnzAjJD3IfQTJarpRouq0YPh45zy/xH
 /WDmAva9sbz/sl+2VixIiny+0CQMyR+x7GbCpag9FIDzy44sDnLgeVLNeo/6mQu2PX3VjanqwKf
 VJMo7DLTYSEqo+O2+52MTShaQqwRLaVc7VwrxOJ6Qs5I9QTjBMJn9lzQ0UuMCGZeFP5vkWOYHn+
 Oty5b+/F5hxW1VYylptUongOXIus2oN1V0bB5DS6Ah9R0eOztm+TAFiq9KOIoggRkLkmP5yELeS
 /yRdOBeSZL8Hy3b/7xzm72DN7YZc0g+Z/E2VqvhJBlT6W+We3ilFWeK+n38SrEtngiXSbEv97AZ
 puy1Yav6NsP9Z+mhfqKpJN8omAQjSxXy5l5wNym/uCs/m/1SaWjgMHjBrjXzDv4iKnDBUdFG0Kt
 uSwWiyws8Cpl6/d/r1Q==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-15_01,2026-06-12_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 bulkscore=0 adultscore=0 impostorscore=0
 priorityscore=1501 phishscore=0 clxscore=1015 spamscore=0 suspectscore=0
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606040000
 definitions=main-2606150063

On Thu, Jun 11, 2026 at 10:24:46AM +0200, Krzysztof Kozlowski wrote:
> On Wed, Jun 10, 2026 at 01:42:40PM +0530, Varadarajan Narayanan wrote:
> > Add the compatible for the thermal sensors on the ipq5210 and ipq9650. The
> > ipq5210 uses ipq5332-tsens as a fallback, while ipq9650 is added as a
> > standalone v2 TSENS compatible with combined interrupt.
> >
> > Signed-off-by: Varadarajan Narayanan <varadarajan.narayanan@oss.qualcomm.com>
> > ---
> > v2: Fix fallback definition
> >     Include ipq9650 to all applicable constraints
>
> You already sent v2 and received comments yesterday.
>
> Please respond to feedback and version your patches correctly.

Sorry my mistake.

Have added the additional constraints to ipq9650. Will fix the version no.
and post v4.

Thanks
Varada
