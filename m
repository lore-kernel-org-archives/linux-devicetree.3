Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E3419364EB1
	for <devicetree@vger.kernel.org>; Tue, 21 Apr 2026 05:59:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776751145; cv=none; b=eculLb5E4qLROzCGYrvkWz0+IcZs7EJK2RZNOgDbv0eC1ePtC3vuDAocyLAYO+5tVKp34/mDH8GI5LCuGAFCqSE05YOatyDoAz5hUShY2+9qk3EudCreoN1a7QIF6hh1iDEtk5KXKF+tgoLaALun4j3BqLOLobj+kLp8+LdTVxg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776751145; c=relaxed/simple;
	bh=g/CnjycFgb/w7TP6KvTEF3kp3w7+Ae5Ok2KVIGyAFS4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=NH6eJmOm5ipvDhZmN6oIym4EwFXVM53YnqVey0/YgkS7MJ34oEA6BKZg1VWHoo+oVllyW6oABHX7e7Oaxf85BjDwTFZs3kNJQhNKSRjFyLIMF/VGzbj5OrAvXpP9sIW7IfvMf2u1GnZEXUgxfpfkaiGQ4I7t/2+AvB6X3MtGLug=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=oyWCfznJ; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=hY2jaFoD; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="oyWCfznJ";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="hY2jaFoD"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63KMhClK1127490
	for <devicetree@vger.kernel.org>; Tue, 21 Apr 2026 05:59:01 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=PeWfUqzN8k4bN1hyibqxpIMf
	Lo4P6txvt15c1HjmL30=; b=oyWCfznJOlCpoLVqg7TNw9mxubIG3dcgiHoLOrId
	hM/cYoLeaIRmZqQ2oa2mLIXuRk+OcLWViPwogHccQcIzS5TvlqhA3AbhZhawLY7b
	5ztKvSHGwyOYF2+SxdVeGfDyXOD/L6fBsCkENd2suYCfjQY+5xa/jP5zEfwcO0dw
	AhUGjZCMACuGx25QrqjecCD5Hnrbc7nS78xNALtG80i0NNw/6CIPu9Y4revAuhEA
	y7URE2VD6BSD7SqlJpdhLDCWzYIr5iATnKhFUqP7/DTTT76dvxDio5z/9rFTf6Sb
	RWubMgPEPQ1C7Imr0tkRWzEdoIgx4b/UxvAlUaG+6AhvZA==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dnw68s5u1-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 21 Apr 2026 05:59:00 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2b2ecc96a9aso36064375ad.1
        for <devicetree@vger.kernel.org>; Mon, 20 Apr 2026 22:59:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1776751140; x=1777355940; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=PeWfUqzN8k4bN1hyibqxpIMfLo4P6txvt15c1HjmL30=;
        b=hY2jaFoDAkXd7ZdnpT1mjUhm74I6IsdSoV/JG28wL7OerzsumPXVC4+/nmaMzQlUZL
         up9FyK7UpxISR5lXV0JXZV8iGpbCtcbuZtyh+GEG2LY9MPCvTh9Hcly8Ghk/NklbES0K
         rVmLfT9+L1uJ8Nu7FnyFCzVTbMvd0kXaNIWntualvmv5ferWz4ddS6S+8sMmk6SEmPzD
         ynCQmorcwPUz3bzVnMKpzOFTTq6DwNuQph4rMKTEZ93FMSrupTovftZRVBDG9qkwq+p1
         5JDg4Jhn2I+kAuJ1y7/GU1qb85s9iVdEsm/lyDHI0nJh8+1gIDUFjfdxrj8vO5R1WD95
         MdEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776751140; x=1777355940;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=PeWfUqzN8k4bN1hyibqxpIMfLo4P6txvt15c1HjmL30=;
        b=dQ3sOp+rmjvErpfc4MCqhh2QrSohsoIMFqxffRKuzWOfH/zAv0RoiKyHx747lVcKl7
         8h0ZEzAbUqsXqwoTbxGH9wg86Emh0q6j62crbymzXa7jQmhgehtqY2B25U0W/56+cGJN
         yte5B+C+pjigrWsWNYlnc4GWTARK4xeD46fwQjJ9znWnNpzb1uwt9dDTq7oUSa6X6i6N
         HpPKx0t9wr+VZkMBZrlKh6kBb5JbHmlxIO4jTw4CuaOn3uKKmdOt4cOcAw6w7PEhzDb8
         jVoPcKLHLsHzaq7QSFfbOm5kn3hBSv2saRZxHIA0bsy3s63/IM48NQx5xLzw7V7rJd7o
         9eRw==
X-Forwarded-Encrypted: i=1; AFNElJ+6ka5xSE0SnOiFCVj5FcdQw6TtmJVl/agTzFfgnieuCwqI5w/zETZXDuf4C/2HtwfHxNNH5q5Dl8oV@vger.kernel.org
X-Gm-Message-State: AOJu0YzyOlyVz5VaR2bdPzTMfTlv5eD7zqBEIz7AEsdshkWXSJtwsA7c
	8KIvO0R7GqsV2Gk7ByrBNYVUP1qXlwdWq744yo6IK23L/Ifu+32r0zucuVIMMZDOJvyM3WhMVkw
	UnYysfyAAEStrxy/TKW/F2TMaviU2KGlNE31qF04zV0o0Ld1pKSeymrxfD/VgceZh
X-Gm-Gg: AeBDievDiKW2U3CCDHleLw6HqEEJk8zBWtnBztXYgG2+xY82iLOYBzPGImVuuAgYAyk
	A6hZdsLJbhLDGEkBqVxX2cgt54C7hjQDnodsPFr8hCIcAePUuVcm9jTkWImU2W1A5s7vV6pknqV
	rBsyUshHW3if8ux+U/92R3PF7jdNE/IRQRX+NxvEKwqLbgPyqNq787PSsBSVBOfC3efJMVzfJ0p
	27ZnYlyFNxjm7slfoE1E9DQBjGEBU+Dy0jne6Skjd86bwjS8PsUxZKzBl29QXfpwO48DE23JAFk
	cHsKpu3ShS+MGBHTbaluZQhv4j+1iKscsj75JMiyMBU7lAqi8UZruIC7HKmBV1ca2lPCOGhtT7T
	i5WNVQH4g0+w4xVyu39oTHuCZoiRFTSIv30a7HCZAetimAUdwWF9lfsTQRx67S68iYztVxQ==
X-Received: by 2002:a17:902:ce09:b0:2b4:5d87:a1fd with SMTP id d9443c01a7336-2b5f9fd21c5mr177240575ad.27.1776751139684;
        Mon, 20 Apr 2026 22:58:59 -0700 (PDT)
X-Received: by 2002:a17:902:ce09:b0:2b4:5d87:a1fd with SMTP id d9443c01a7336-2b5f9fd21c5mr177240255ad.27.1776751139098;
        Mon, 20 Apr 2026 22:58:59 -0700 (PDT)
Received: from hu-arakshit-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2b5fab4049bsm112915165ad.77.2026.04.20.22.58.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Apr 2026 22:58:57 -0700 (PDT)
Date: Tue, 21 Apr 2026 11:28:50 +0530
From: Abhinaba Rakshit <abhinaba.rakshit@oss.qualcomm.com>
To: Kuldeep Singh <kuldeep.singh@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Manivannan Sadhasivam <mani@kernel.org>,
        "James E.J. Bottomley" <James.Bottomley@hansenpartnership.com>,
        "Martin K. Petersen" <martin.petersen@oracle.com>,
        Adrian Hunter <adrian.hunter@intel.com>,
        Ulf Hansson <ulf.hansson@linaro.org>,
        Neeraj Soni <neeraj.soni@oss.qualcomm.com>,
        Harshal Dev <harshal.dev@oss.qualcomm.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-scsi@vger.kernel.org,
        linux-mmc@vger.kernel.org, devicetree@vger.kernel.org
Subject: Re: [PATCH v8 4/5] arm64: dts: qcom: kodiak: Add OPP-table for ICE
 UFS and ICE eMMC nodes
Message-ID: <aecSGmAWyzf04BIU@hu-arakshit-hyd.qualcomm.com>
References: <20260409-enable-ice-clock-scaling-v8-0-ca1129798606@oss.qualcomm.com>
 <20260409-enable-ice-clock-scaling-v8-4-ca1129798606@oss.qualcomm.com>
 <cb6b19ff-811b-427e-a588-cb85c6854da8@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cb6b19ff-811b-427e-a588-cb85c6854da8@oss.qualcomm.com>
X-Proofpoint-ORIG-GUID: j7QeaF2YYD4AiwPmyriIRhP8R8Pmeuom
X-Authority-Analysis: v=2.4 cv=apyCzyZV c=1 sm=1 tr=0 ts=69e71224 cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=kj9zAlcOel0A:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=EUspDBNiAAAA:8 a=FjpnKfaMezcxXxbuv6AA:9 a=CjuIK1q_8ugA:10
 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDIxMDA1NiBTYWx0ZWRfX728KfCFjnqN6
 zqvAx04pBy4FzXdEDD4H9Z6HVoD2y3m/OUgM9BnaEr0PnfHCHa5ofVwMgk161/Wxr/WtrE4ACuA
 VEOt/AzfTEyiV5pElx0Dj6zyG8kmEt9R26ukqOLycg2zmFHLvlKFt3ks7rN6KFxSXjAOAyNw+73
 Hn11I5KFMvzoYozKx3XVTeDAnp5mdKOiEMj9lI+XMFZe6XRjKEwdqKnSyeCxdFjkJ6D9Fojim04
 jMmRce3u6KLvn35DkvPKZxQtCztG8Lh1EXcBKAykdE33tWjFpPEj/xJ29VPKVqN2rpQgvNWQpM5
 VKUMbc6xp4GiIdLHWHhNqeRSZILoNEphUpt6qsVrf96f4kg2wPcNe3Sz8YWuI+uCIaOAWOaJ73u
 VUDERfoeIj0vQcqmuv0iZ3QbVPR+xn0/Ny+boElYWG04Rr3s5KpluSB0bkUUbDH0YJzyUfpxgN0
 qSyGX7oB4H2vLsVe6UA==
X-Proofpoint-GUID: j7QeaF2YYD4AiwPmyriIRhP8R8Pmeuom
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-21_01,2026-04-20_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 phishscore=0 clxscore=1015 spamscore=0 malwarescore=0
 bulkscore=0 suspectscore=0 impostorscore=0 adultscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604070000 definitions=main-2604210056

On Fri, Apr 10, 2026 at 04:23:51PM +0530, Kuldeep Singh wrote:
> On 4/9/2026 5:14 PM, Abhinaba Rakshit wrote:
> > Qualcomm Inline Crypto Engine (ICE) platform driver now, supports
> > an optional OPP-table.
> > 
> > Add OPP-table for ICE UFS and ICE eMMC device nodes for Kodiak
> > platform.
> > 
> > Signed-off-by: Abhinaba Rakshit <abhinaba.rakshit@oss.qualcomm.com>
> > ---
> >  arch/arm64/boot/dts/qcom/kodiak.dtsi | 42 ++++++++++++++++++++++++++++++++++++
> >  1 file changed, 42 insertions(+)
> > 
> > diff --git a/arch/arm64/boot/dts/qcom/kodiak.dtsi b/arch/arm64/boot/dts/qcom/kodiak.dtsi
> > index c899a17026fd2a10ebc528a816629c88ee3bde5d..b0aa1970d42a3bb0b9d371e0e6cd09b8cd164dbe 100644
> > --- a/arch/arm64/boot/dts/qcom/kodiak.dtsi
> > +++ b/arch/arm64/boot/dts/qcom/kodiak.dtsi
> > @@ -1087,6 +1087,27 @@ sdhc_ice: crypto@7c8000 {
> >  			clock-names = "core",
> >  				      "iface";
> >  			power-domains = <&rpmhpd SC7280_CX>;
> > +
> > +			operating-points-v2 = <&ice_mmc_opp_table>;
> > +
> > +			ice_mmc_opp_table: opp-table {
> > +				compatible = "operating-points-v2";
> > +
> > +				opp-100000000 {
> > +					opp-hz = /bits/ 64 <100000000>;
> > +					required-opps = <&rpmhpd_opp_low_svs>;
> > +				};
> > +
> > +				opp-150000000 {
> > +					opp-hz = /bits/ 64 <150000000>;
> > +					required-opps = <&rpmhpd_opp_svs>;
> > +				};
> > +
> > +				opp-300000000 {
> > +					opp-hz = /bits/ 64 <300000000>;
> > +					required-opps = <&rpmhpd_opp_nom>;
> 
> As per hardware spec, 300MHz is supported by SVS_L1.

Sure, will update this in next patchset.

Abhinaba Rakshit
