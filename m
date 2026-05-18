Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 38E213DBD47
	for <devicetree@vger.kernel.org>; Mon, 18 May 2026 07:12:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779088354; cv=none; b=KUwDsmwYm/KkMLmbx034fqHA7eeGmcc7sYhEDUxtPADmP37hSGgbM1wlnLClyGHUV/kE74ve3OWGk+9laDds/tVRg+PHmYe/BS2dGT4EBrMfnZ3x3S5a3N6PdFTZa8gI8V5x8NU3mXirzYnI4NGwpaA4fnx/6+Gbi0TisgEzLco=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779088354; c=relaxed/simple;
	bh=sOyUZXU0M8LCF0l8YDifaBMCboD1LsRp7L4L8rBS/n4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=GJ5GuaXSCPWEyt3qhMEJis24Z7LEWc87BohyNw9dkjUugq0yfJ91CBoIuDsKc0RDS5yK6XhvcKdbTFHY0UfmkOlwmTVTYRl0WF/8OO7jftTzFP/PeiH3wZjGuzBZi6WBtxAAA+f3JgfMx8f2cVrxpIusjgUlJVkyoYH4haQlc+Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=BzT6Trot; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Gu+0q5WJ; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="BzT6Trot";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Gu+0q5WJ"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64I73kX23412683
	for <devicetree@vger.kernel.org>; Mon, 18 May 2026 07:12:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=jfANRrzjnT+Q+ZHPpFu8GhK4
	5mmoeXo/f6F+ss17r/Q=; b=BzT6Trotd5u9HHH25cnEIT2yhiw7itO6Owqc4i5U
	PnnIM64E0CxUp79f997OXg3LqdcG+QaDHaYReatdaPk7KN2VCxLHqyFAksM9GcZe
	/zeUvuUetV6D+hb4OprZ0FdiuO4m+QqsW30Zvvp1MH+jch3kmENSlDS8HXAliN8d
	DyYIC+kmBoflHB95VLdCCGp3U2I/Hn3lA8tE5Y8VTQnl9smFjOxvSAvdYAmIHnGZ
	UycVOdih4ue9a+KV6SL8xh3oz+IsUxPKLeX+9Uo3aRGy8ZpDbnAqDnauvMEK1E6V
	FJ9uRQNj/9fQaeBCWygu1yc1RNpGJzckgvw5gI9z6AuToQ==
Received: from mail-dl1-f69.google.com (mail-dl1-f69.google.com [74.125.82.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e6gwmd4qc-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 18 May 2026 07:12:32 +0000 (GMT)
Received: by mail-dl1-f69.google.com with SMTP id a92af1059eb24-1306c2f7037so1698295c88.0
        for <devicetree@vger.kernel.org>; Mon, 18 May 2026 00:12:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779088351; x=1779693151; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=jfANRrzjnT+Q+ZHPpFu8GhK45mmoeXo/f6F+ss17r/Q=;
        b=Gu+0q5WJjXQW2CITds8fOKHDL93hTGlsRRQGYKyjE9Eh3j11yGdq+OFj6M6tNBIlo+
         J2AZ+SO9PvtVymdHJrVZP5eje9kxatYUbUdb8QuIJcDRNqc9xbO+dZLt37b4KTPKyJUb
         oTiO6u2v/3z/cmUavm0CdnNY8mjDr1h2Ma0eu0JDRnBwIaC5q3pjYZBBKw+M9UUdjNDL
         hOUEqYhZMXrm3uXnokQC3zh1ltH692jo+P7BtcuNU3XO7VKr9QZw9EC/pA/wderrKXH/
         ArABlUkAa080FuKXarJlePVL4wuda6bKbjSNZB1OZTVOn7M2WKHqU2WostEa2ZpGdyzX
         WKlQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779088351; x=1779693151;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=jfANRrzjnT+Q+ZHPpFu8GhK45mmoeXo/f6F+ss17r/Q=;
        b=Qe1fZaTeiSGTuSgge4Ameg30cEKaa5MeErJO4lRLJ3z3ssMWmynkvbDwXxbnS7Trv9
         crSCsJV+4VMLy/vdiepLIdZE/QunGFxUpK5Oga7F4oO84lfseuIC2ezgiK1TMTdxHF6w
         jTCoNjHV5yGqeyQvyUDlMHk3uZ8yy+hjTP46gBMx3jn5YqV2bIVrwXRsX68jrU899L2Q
         O08E5Fr+oRdijZKKcdGIRNz3rkEh7IzXCAxrj7tX5AGBWos8c+7TvczGl+c6rKdEZ9hw
         dAHXGvJwtOtNIodGROWcs/aIKtORr6XZUOHXFiP0LsK1d/y2uvIFS9LWgk2P1O1xTLwN
         rC5Q==
X-Forwarded-Encrypted: i=1; AFNElJ+2VXtJW3rEXFdSFLg1Scsq4Lm5bFRiMPioZL9GD2EmHk3SoU8gCqd03dp9BipdY2C4R6Cf3T5uRWCi@vger.kernel.org
X-Gm-Message-State: AOJu0YztAZO4MSLJLXH71jxCHIa1kFjwcyz5DgbYWuItNjNojxZMRJw0
	7kMmVoCF0MWtoCUbQID3Jt60sHVjPohBCnSfU24520JPkSwGYRJ7a+ufrzkhDrkg8ok6hLzE7ah
	xrLNo+YmRb/vTyGnKUbcC5HdiDhwG8Z+i7hE8VUKFXb+GNG5RYry9lY2HPoInqIRS
X-Gm-Gg: Acq92OHSnvkxILvQq0j3HDZL7hPDy18m07bBUH+cz7o+JTi+4DVgaWEEZsrYAt18kDv
	hxnbhia2IuCw9h9Wu0UAP9jKuqY4Y3iq8QCpjy6Dgw+AUIPKeTUEmGivjgkiHCCml8ol7K8DKhq
	LmnqDvTvRYKz963osjYJM+K5mN+e9AO8TkKhH7q43dxjjUeA5hjtdrcKrNE+newq1Gb6W9p9rVX
	ynDGw0f5uWtr+sQJJj87Zey33BPnzSneP5FVBWvKbNlEqXkFDSS5kmcmZE2NTlVjBfq2y0Xa3rA
	FKdi9KPfjAyGTgWqF+a5FV2fNr1vo83Lur+PYylWxZ9wnqKGsN7tOg+YiakR/5GOJt/VQOZdxXX
	pvN49JZMApzmRCiyAII9e4ESKC7awglO/UVM+AvzWojmCU4fAb2rKe2xYBkIm1n/IIRM8
X-Received: by 2002:a05:701b:220f:b0:135:a6a:fcb9 with SMTP id a92af1059eb24-1350a6b09f3mr3264542c88.28.1779088351120;
        Mon, 18 May 2026 00:12:31 -0700 (PDT)
X-Received: by 2002:a05:701b:220f:b0:135:a6a:fcb9 with SMTP id a92af1059eb24-1350a6b09f3mr3264523c88.28.1779088350407;
        Mon, 18 May 2026 00:12:30 -0700 (PDT)
Received: from hu-qianyu-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-134cb5b3c20sm19612062c88.0.2026.05.18.00.12.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 18 May 2026 00:12:29 -0700 (PDT)
Date: Mon, 18 May 2026 00:12:27 -0700
From: Qiang Yu <qiang.yu@oss.qualcomm.com>
To: Krzysztof Kozlowski <krzk@kernel.org>
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
Subject: Re: [PATCH v3 1/4] dt-bindings: clock: qcom: Add QREF regulator
 supplies for glymur
Message-ID: <agq728MVNgDdcOVP@hu-qianyu-lv.qualcomm.com>
References: <20260506-qref_vote_0506-v3-0-5ab71d2e6f16@oss.qualcomm.com>
 <20260506-qref_vote_0506-v3-1-5ab71d2e6f16@oss.qualcomm.com>
 <20260514-outgoing-literate-dove-2e2a73@quoll>
 <e495cf7c-a76c-4ecc-aa95-36fb0ee54b80@kernel.org>
 <aglY9of/4714us2o@hu-qianyu-lv.qualcomm.com>
 <e72e2f53-caba-4c53-b494-3c284eec54b4@kernel.org>
 <agqJCmQRmFwhFClV@hu-qianyu-lv.qualcomm.com>
 <5ad0685b-9ba4-4ada-863f-4e5a24a761ff@kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <5ad0685b-9ba4-4ada-863f-4e5a24a761ff@kernel.org>
X-Proofpoint-ORIG-GUID: wxa8rOzb3RNFvDFCfCJqtwA5-IX2QqmK
X-Proofpoint-GUID: wxa8rOzb3RNFvDFCfCJqtwA5-IX2QqmK
X-Authority-Analysis: v=2.4 cv=W/AIkxWk c=1 sm=1 tr=0 ts=6a0abbe0 cx=c_pps
 a=kVLUcbK0zfr7ocalXnG1qA==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=kj9zAlcOel0A:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=EUspDBNiAAAA:8 a=CCvEkRsrOX1Ipr2nmxMA:9 a=CjuIK1q_8ugA:10
 a=vr4QvYf-bLy2KjpDp97w:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTE4MDA2OCBTYWx0ZWRfX7rQtFKAip20P
 w9X9oADO1x7EEiCrTJnjIjKf55ElFsjQjGTfhd09xlUqRnTQ5q1wMM5rnwFddoN3cINzYoXscEc
 LJsdutJ7uUwcGDjAnurzuA8f3krzGEFLmvW612uWmV4C+KAcMaA1hg0knl287vDkX6pGjwqg1ob
 EEDgy3/oA6fUhgcR4SLrqWRLc8O0rgGQJGknmcvx5ZLFVNRsGCakXo7QhBBh2/O0+aI3nzKDxZx
 efESIOt2bYPTRlY5C436mTWeB35+lVUIWs8at3T/G+yWGDdrr+I5gdkiNp239Fu0osQKva0pfct
 xDgiD2aWOBN5IPq3b8zRPZ5X61oqrGJaCkpdTaoJJLTS5TB2gfFRqF0TmAPV8tK7IIrshPLm9Iv
 tkKXUYtHWxASqwSNob0a3ZSG6k8qgcVs0up5TBujpsitbN7Mg0/+I6b26L+JlYch1vJf/6Azv1n
 EQN970j2vww+LviCdcw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-18_01,2026-05-15_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 malwarescore=0 suspectscore=0 phishscore=0 bulkscore=0
 impostorscore=0 priorityscore=1501 adultscore=0 clxscore=1015
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2605130000
 definitions=main-2605180068

On Mon, May 18, 2026 at 08:59:14AM +0200, Krzysztof Kozlowski wrote:
> On 18/05/2026 05:35, Qiang Yu wrote:
> > On Sun, May 17, 2026 at 10:28:48AM +0200, Krzysztof Kozlowski wrote:
> >> On 17/05/2026 07:58, Qiang Yu wrote:
> >>> On Thu, May 14, 2026 at 12:35:19PM +0200, Krzysztof Kozlowski wrote:
> >>>> On 14/05/2026 12:22, Krzysztof Kozlowski wrote:
> >>>>> On Wed, May 06, 2026 at 01:43:51AM -0700, Qiang Yu wrote:
> >>>>>> Add regulator supply properties for the Glymur TCSR QREF/REFGEN blocks
> >>>>>> required by clkref clocks.
> >>>>>>
> >>>>>> The vdda-qreftx*, vdda-qrefrpt*, and vdda-qrefrx* supplies map to common
> >>>>>> QREF TX/RPT/RX components, while SoC-specific topology and instance count
> >>>>>> differ. Document them here for qcom,glymur-tcsr.
> >>>>>>
> >>>>>> Signed-off-by: Qiang Yu <qiang.yu@oss.qualcomm.com>
> >>>>>> ---
> >>>>>>  .../bindings/clock/qcom,sm8550-tcsr.yaml           | 57 ++++++++++++++++++++++
> >>>>>>  1 file changed, 57 insertions(+)
> >>>>>>
> >>>>>> diff --git a/Documentation/devicetree/bindings/clock/qcom,sm8550-tcsr.yaml b/Documentation/devicetree/bindings/clock/qcom,sm8550-tcsr.yaml
> >>>>>> index 1ccdf4b0f5dd..57921cb63230 100644
> >>>>>> --- a/Documentation/devicetree/bindings/clock/qcom,sm8550-tcsr.yaml
> >>>>>> +++ b/Documentation/devicetree/bindings/clock/qcom,sm8550-tcsr.yaml
> >>>>>> @@ -51,6 +51,63 @@ properties:
> >>>>>>    '#reset-cells':
> >>>>>>      const: 1
> >>>>>>  
> >>>>>> +  vdda-refgen-0p9-supply: true
> >>>>>> +  vdda-refgen-1p2-supply: true
> >>>>>> +  vdda-qrefrx0-0p9-supply: true
> >>>>>> +  vdda-qrefrx1-0p9-supply: true
> >>>>>> +  vdda-qrefrx2-0p9-supply: true
> >>>>>> +  vdda-qrefrx4-0p9-supply: true
> >>>>>> +  vdda-qrefrx5-0p9-supply: true
> >>>>>> +  vdda-qreftx0-0p9-supply: true
> >>>>>> +  vdda-qreftx0-1p2-supply: true
> >>>>>> +  vdda-qreftx1-0p9-supply: true
> >>>>>> +  vdda-qrefrpt0-0p9-supply: true
> >>>>>> +  vdda-qrefrpt1-0p9-supply: true
> >>>>>> +  vdda-qrefrpt2-0p9-supply: true
> >>>>>> +  vdda-qrefrpt3-0p9-supply: true
> >>>>>> +  vdda-qrefrpt4-0p9-supply: true
> >>>>>
> >>>>> Either I do not understand your previous explanation:
> >>>>> CXO -> TX0 -> RPT0 -> RPT1 -> RPT2 -> RX2 -> PCIe4_PHY
> >>>>>
> >>>>> or this is still wrong. There is no TCSR here, so this proves nothing.
> >>>>> If TCSR is TX0, then you do not have five of them...
> >>>>>
> >>>>> My previous comment stay - you are not describing the actual hardware
> >>>>> here.
> >>>>
> >>>> And it should not be my task BUT YOURS to verify this in hardware
> >>>> programming guide or manual, but nevertheless I did verify and the
> >>>> manual DOES NOT mention these supplies. For Glymur, it mentions 8 reset
> >>>> ports and 5 clock ports.
> >>>>
> >>>> No supplies at all.
> >>>>
> >>>> Then I went to QREF and it does mention few supplies but completely
> >>>> different, like mx, cx, px 0.88 and px1.2, so none of this matches QREF
> >>>> either.
> >>>>
> >>>
> >>> Honestly, I couldn't find QREF LDO-related information in HPG either.
> >>> However, you can find it on IPCAT. For example, in the glymur power grid,
> >>> these LDOs are clearly documented under the LDOs required by each PHY,
> >>
> >> How is that relevant here? This is not PHY here. You are adding supplies
> >> to TCSR. Do you understand what a supply is?
> >>
> > 
> > I'm telling you the fact that I see from power grid table.
> 
> So you see supplies in phy, then add them to the phy.

These LDOs don't supply to PHY directly and this is why I was taught to
add them in TCSR.

- Qiang Yu

> 
> Best regards,
> Krzysztof
