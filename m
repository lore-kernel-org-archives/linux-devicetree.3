Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3E4D637F74A
	for <devicetree@vger.kernel.org>; Wed, 26 Aug 2026 05:19:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787721561; cv=none; b=C9W6tstGgoZ8e+NC3B0T1R1ThJlt6uEKLJGcvwUcR27Rk9BXG0ikCXuCMX5cNAlajL26W7k5v04hKoDB4uQx8NyL8CcjeT7U8ZxLaChDXFuP4GChhUb+Nc7M45CfN1pM8XYrdlQMFJQjK4RRjJ2reohRBfDt2fXSlKxnMM4a6XA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787721561; c=relaxed/simple;
	bh=qZty2P8PNiEt2AowwJCdF4Xi1CxWnZG2Ggblrlkc+dc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=KTPLiEu0TLWiI8ENuI5fGAWeyI1oO7vvHodBjXDj564lajinCTpyCjRlJMe2JJNDSdKUZG75rARws9m13komofXEuAGfkeGn4OBDC539XJf2j5KLfq4Tg81Lk1dQpO/z02vMHlGtF5UTxemKpRLYrzUM5cdm2olUZcxnHwcpU0s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=EVioZ9dx; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=hBADH+xK; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="EVioZ9dx";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="hBADH+xK"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67Q51mE13608290
	for <devicetree@vger.kernel.org>; Wed, 26 Aug 2026 05:19:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=MZMQ6opPngVEYRp038raR2cs
	AQDj4GBGp5NFuD9xeuo=; b=EVioZ9dxkZJe0nrQ2eTt8MzeUclYglNpyI0vc9AD
	Q4vySv+UCSoGIPxSUKkuJnIClTe6u5mnkdLnU3FV6FyNHmnMqyL3NipEpzsQ8yIh
	WwICAfOWMbI3RSl8ERhmR9P8g/5RSMTv8n2ZQ7N1kLwoWWvjZXB+Y3ByGggP8zQ9
	U9RrvZqShaHN8vSEFsEWhan3Ef5H8cj0TUAGH3pSStpm53QKs7mIRbfjmv7muG3T
	zandXyBBKESs3kZOIL5LkXXTCloxLYVUFc26mjNnmo6H0tlDGNLoS81EMxlIbGLR
	FP4S7FXA62xJrXcVy497976dKumiq1EExEPBNfqsUt96zg==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g9smx81ss-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 26 Aug 2026 05:19:19 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-51c1b4d961dso5424591cf.1
        for <devicetree@vger.kernel.org>; Tue, 25 Aug 2026 22:19:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1787721558; x=1788326358; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=MZMQ6opPngVEYRp038raR2csAQDj4GBGp5NFuD9xeuo=;
        b=hBADH+xKXGS0lGGNirH2u0fY5VlGyslFzjFQZQ8y937ljKuXGPEuZrZ7cyGMecGJIU
         XYQnfx6NQXl4dw4gfnassyZ6rknFgK3g7FHHiO6iElw64MfMIoJ8A4Sxa8o79j4O7oZY
         Z5uwDXgn4D5LE954ntDlE3ys4v5eTCc8TuAS4W1n9gjOcMBGuGQkqdrkz5TSGnKA766L
         id/K0XBzm7rlxzPLWlhKFAeB5JdAVB083WmM7rmJpY0SmvixUSA43Wu6avvjiBpE/ERg
         WfCXl0+X7kZ3LacWDwy7jN13BrGRel2vRWfcDti7pwu/jn7dfWkqOvQcKlb+5x0UVNfH
         fRUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787721558; x=1788326358;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=MZMQ6opPngVEYRp038raR2csAQDj4GBGp5NFuD9xeuo=;
        b=YmhNp/CtttsFyNODcKLOvc0NL5kMf+mOBAC+Bo8CDfu3TTsCEOTysAPFd9P5MZIUOr
         g/C1bfY6g1QWhGitmk1smGKUFrnomT9BUHfQb5qVluU3fb5kDccbJUlkh0rdVoR3r64F
         PuwKkY4sdvdWBzg6PI0SnEbWCoQXMTWoyF4YbiJZpL4mcD1rE8kqMFKBiACF4OLoYQdv
         FzXDp8RJZtfJPZWnuQq/49FU+6cckAwrMSw3qAy4NlqgLLA2VQfJOFXHJ9GlPi3CflZt
         j9ZkDewjPaZEwt96YPn3mw5M8f2Bpy9Tu7gpUtqTnYPeF9JTxsAmhZxWoQe3ldBJjxm6
         XD4Q==
X-Forwarded-Encrypted: i=1; AHgh+RoyA3mEgiPzlUWf/LK8vc9OhUWB1zNVGxNO1RaskvxryzrlmevAwKB+6UeMQQtJ2A6vPAr7W57DVj98@vger.kernel.org
X-Gm-Message-State: AFuF++ns4cgSTyfnzps3GJV8C/JFY/wFniC7H2Ed3+b8cB08ebTpi1wi
	bBlF7SSuz7u5Mcb+EGI4kVyYucLmPo51RmOs2NYVE+DsLptAsavn2RyaUGCgFsLdr4sRyIoP5Kz
	cvXV25je4UClzHoe/zcTxGiAgrn8Vun8VqJDoPsg0Clatyt2mIHcYV2Ytj4oolrqalPDhlqsX
X-Gm-Gg: AR+sD10vbOtC8re9ocPoV9X12NVwmQ6LdWnF/GYk2Ep3EfpEUxttscpAy0/pcW0Or4j
	k52BA+EyUpTTMATvLXJhoAkT3EM06jlYoBQKcOODwTJ252rnBYWolBi7BQhxsCRWQ2vrlRXy8LP
	UUuE6mi+Wdas0IHHy1/U77DPXt5y6nWaqZSE7FSyDZZCfyO6lAYKRchVw3e7+soV7ZsRFR2Bllo
	MgVahMBtRJAqCJ/x4yIj92mRN95Ttc4U4RBAiykm01+nuT2u7wsawNHIMXmuMgpbWZAiU1TlyKv
	JcEVG5LdJIJ2RPbuKH52baLGxRPKNCUNLak70EeGdWVMdRpeUMvWPxL34zHaJxBa6ubOcJWvewR
	59/WI0mtO+Yeh0A==
X-Received: by 2002:a05:622b:103:10b0:52e:49c5:42a3 with SMTP id d75a77b69052e-52e49c54b60mr2430381cf.13.1787721558443;
        Tue, 25 Aug 2026 22:19:18 -0700 (PDT)
X-Received: by 2002:a05:622b:103:10b0:52e:49c5:42a3 with SMTP id d75a77b69052e-52e49c54b60mr2430171cf.13.1787721558007;
        Tue, 25 Aug 2026 22:19:18 -0700 (PDT)
Received: from oss.qualcomm.com ([86.121.170.13])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c250a5d647dsm276159466b.13.2026.08.25.22.19.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 25 Aug 2026 22:19:17 -0700 (PDT)
Date: Wed, 26 Aug 2026 08:19:15 +0300
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
To: Qiang Yu <qiang.yu@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>
Subject: Re: [PATCH v10 3/5] arm64: dts: qcom: mahua: Replace
 pcie3a/pcie3_phy with dedicated pcie3b_phy
Message-ID: <xprybiqfq3szxota7m6jhng3ujpnfulaqcpokfiujtxvjunfs4@2hpnue7liuc5>
References: <20260825-glymur_linkmode_0826-v10-0-56ab597d77e4@oss.qualcomm.com>
 <20260825-glymur_linkmode_0826-v10-3-56ab597d77e4@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260825-glymur_linkmode_0826-v10-3-56ab597d77e4@oss.qualcomm.com>
X-Authority-Analysis: v=2.4 cv=O/oJeh9W c=1 sm=1 tr=0 ts=6a8e7757 cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=clBUptZa5v5FR042Ey+sjA==:17
 a=kj9zAlcOel0A:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=EUspDBNiAAAA:8 a=GN4xtFq8P7hki0q-dAwA:9 a=CjuIK1q_8ugA:10
 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-GUID: 4gjx3WDLXRvIXxEfLKoSSiPNlyHyJCDe
X-Proofpoint-ORIG-GUID: 4gjx3WDLXRvIXxEfLKoSSiPNlyHyJCDe
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODI2MDA0MiBTYWx0ZWRfX4idl63vM/HCI
 OxWZflera0H4ZNtRXhYFnCv2nMg2tjakD+ipPiyEEZ4f7XnlsJLYCD+G+Q1/4/yHSA4a5ksg60S
 EkdZgKM/QLVLeDQ5vOOxed9oB9Y7FrMPw05sxNIuV5R54FTc+LGYmAVA9SB4sXH7MgqmMoKYOBZ
 Owrl10glaWvNfBfP1R6P/iKXlz/6JS/hED11h/ZSg/QPXh8GRhTPkK9ILect+siNF1k4XtqXRAc
 339mHo61SbRLHFy0h/yF8S7Jvi+S12Q1ekFtKpEpM8AmvmU0tepGOunO7SkgGfceCLnOZynIu5F
 d/Xy5YsWFn2jnsUC8kvkGiwJ7HQd9YQXos0M0d3R41GvpcOyehyyHSODpUxpGWI/z6udVSj3yVe
 9lKY7ejIntltWCP3rKDCmaEAW40M3JjXPtoRcKo7MdaqHLMo4/zE1oBIMT1IhDpZsK9xKBVwpPW
 jnPj6/2E07Z1HaV34OQ==
X-Proofpoint-Spam-Info: AW1haW4tMjYwODI2MDA0MiBTYWx0ZWRfXzfiYArg6fpiT
 LlePFJXc34+yw7RQTdbsAFTxlHX4SLA7MqyMFBsWJkOX/zOzXSrj84cfDRyzclVbgsGSZQyKgSD
 //nB2lZzuDTlw+W4SOlYi0eLVv7HigA=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-26_01,2026-08-24_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 suspectscore=0 spamscore=0 adultscore=0 impostorscore=0
 lowpriorityscore=0 clxscore=1015 bulkscore=0 priorityscore=1501 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608260042

On 26-08-25 19:59:22, Qiang Yu wrote:
> Unlike Glymur, Mahua only has PCIe3b wired up; there is no PCIe3a
> controller and no shared Gen5x8 PHY block. Delete the inherited pcie3a
> and pcie3_phy nodes, and add a dedicated pcie3b_phy using the existing
> qcom,glymur-qmp-gen5x4-pcie-phy compatible.
> 
> Point pcie3b_port0's phys and the GCC pipe clock parent array at
> &pcie3b_phy instead of the deleted &pcie3_phy.
> 
> Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> Reviewed-by: Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>
> Signed-off-by: Qiang Yu <qiang.yu@oss.qualcomm.com>

Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
