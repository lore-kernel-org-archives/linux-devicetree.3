Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795170013;
	b=sePtuYkASyuGMwXVHMc8BFUthOEbP3lEcfQUJzONgRlAACODkQCbFjG1RIMa80RiAOmU
	 cljTxjg17e6zWaLs6isjBkV+wXwE6q3Yfsfnihl+k0i+1timOh8hZ1uHgGLhg8NxKD6/1
	 tau6cOk3i5hdohaR1VJj8737Eti1p3lHO30Wbkgm47Pc9n7YjMNFEAGYIFBd9kLOr0Dz0
	 AfgF76ZSPEmhOEs6g1ETSXd+mnS4vw5uJ1eeLw0tgHVrwVyy2WMHNsHf5CqEGbjlFxnkv
	 irYWlw7ZXN5c7zw7fWyuSc9TTaq+i4Bkayh+svqPwX5uIwd0jzEZuxrT6+lnnKSb2CQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795170013;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Date:From:
	 To:Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Spam-Details-Enc:X-Authority-Analysis:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=v1AfoyViWtDD/4lI7K4bWRLDy0Fh89oWvLdt+QyBGH4=;
	b=zDCBk6gGp3mSIu/yngbaI0chiZVYUP/zcjeKIUMFA+POH8N3dyAphp0kTJ1OEdquO9+Q
	 OKq2D7f7SatM5Wt/+ITkBdFbWB8ZnaPlUUfKrJFsnZbpGxsZ8a4Dq4/UDQn5doRPsyauG
	 5t0YBRfdlCpuoPH9Psj9dn6G0xK611UlUj2MjXNVJemmzwTRT9eHoSeY6w8rMTRSKG8C9
	 LUephCq8bGcGA/hOVWY5fXvY0qojEvYuG6muFyso1yuUaDvz0nQLA7GluVNoXR9EVthKS
	 IjAfDZlU+G4Te6NxBlkLXyJ/g4Qq3xPG6unWsZZjRmKSSytVzaUxEJF+fs698W+Fflw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=ZqfW3Qxo;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=T0FuPONZ;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 828C7606A325
	for <devicetree@vger.kernel.org>; Fri, 20 Nov 2026 10:20:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 828C7606A325
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=ZqfW3Qxo;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=T0FuPONZ
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AK9KbEH871267
	for <devicetree@vger.kernel.org>; Fri, 20 Nov 2026 10:20:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=v1AfoyViWtDD/4lI7K4bWRLD
	y0Fh89oWvLdt+QyBGH4=; b=ZqfW3Qxow/MIYLFjJEslozb1q8p2G63CkuN/GhXH
	Gv+PQKzhpZrRadF7sS8OwDEBkEO2xWl3qJ5A3KLoeq3DOPgxRED/xcDFImuk2ZNp
	xE0z8AAsGpoVjqeL8csE3lxl+jAtvSRWeRBwuXraM8VBaSXVFtHIEom47Dmaq7cN
	jHQLSVS9J5GOTPTxn6khc0SBLYmtfha/bQaWP4l6CuJG9s5QB8tVkyM8oG37BfEw
	FouUvGbdbI65ET1wLaRCHt+PBxoy/0iktzL3Ix1AltI4+ljhH9RhDSdpCXmxg+tB
	pnZrDEP9zGEksOVzrhyn44EOGUsTZWjXEYcpM7xBubePVA==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j27fyk5pt-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Fri, 20 Nov 2026 10:20:11 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-9495dd0f07eso141767685a.0
        for <devicetree@vger.kernel.org>; Fri, 20 Nov 2026 02:20:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795170011; x=1795774811; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=v1AfoyViWtDD/4lI7K4bWRLDy0Fh89oWvLdt+QyBGH4=;
        b=T0FuPONZToqEj5O20Qq/MoJzLpVUdBeuR5+b7XRLxTuzQ4lBFi2KR1gRHOSiN4M+EC
         iZ94N99wdmrDEPgI0b7xXW38cv6Xgk/gmmhLxK+GNlsHK3VgTYSm9VX4+VtetrZqr9VH
         NlZu3ntk9IIIVbbCgehTav3nJnqbafYtUMU+3djXAJfuKFz9OoWqo/n5P6dd7xxFv69O
         CmQKtgwh+oeu7TTttaUdtRMA5z5wz5+1wu31jGrOzmz0EvhCL2nJU0HM5xmtRehK53eu
         AZyPXoLwXPxaT35j7zC8eeNjc3ZXAFahMQyFiYtJVB9hLmNNZRO2OKyHPilQDqHlk5kr
         eFXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795170011; x=1795774811;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=v1AfoyViWtDD/4lI7K4bWRLDy0Fh89oWvLdt+QyBGH4=;
        b=dkrNUiHeW93O3DAwqcmeMjv3Vpyze02jPPSVbQI7B98W5S6Dmd2fl5ZebdNufFxc2L
         eiTfqGuabVTWN3CkKsD6o8Cy9CI0/HBn7SYtNNqWUZjObDefVDlIIFdq3VQ2QXVn5Pwi
         e+PhqzJIcb+ovws97POkdxy2VyndQV8drX6VQRwIM/bbdLIKFajhg3CuFBiQ1dkgecjb
         AHfY/MaSQDQIRo35mc5O3nP88MGkG5U61QpH7qYVfod3lAbubJ2O4MeWrV0gF43DrZG6
         z6B6UxEsuBckA+A3HEN+j38w0db/zXm0TVPRZeF5gli69TbkamLMfbHU8MXP5jv5pxYC
         S/9A==
X-Forwarded-Encrypted: i=1; AL+hErGEAUYJCJ8g9lEIHRwICC6TomtTs935+EXrRMVEQ7dqn6vbU7zSH2ahpE30jsx1xA4/AdV5RI/J/HvC@vger.kernel.org
X-Gm-Message-State: APuU4Z9EwNsI7S/CIYLI+5e4K/WT6WvuH+zj7zBOYtERnYKlg22d5sWR
	AjSLBGkhu6F2BFCgwsR/eEN1yt2rp6K1+wufIC3Y4Po8iZP0+YKEjDpe5rOUWj9cBHe/2cqYMNI
	xC2Q3NWmz2+4tZ+FhFG5oY2xBHYYr7L1waxOddH1obDCQllJ7656lp4+ecdgLREZI
X-Gm-Gg: AYBFou14HP368CM2wHgXNcbJD2kZu3R8Vp0b/ItTl25ZqcpMRSWKueYxdX8ngrSd3jf
	o4rY/uXnaigk683YCK07Wn1do7aQp9StLCFzUAQpYlhQWSpzNYD7lWIZDSJieBe2VorbkcA8dGf
	m7N4b0qzU+S1Q58UBeWDNHfhAduFb0GdlIbRPnDEOcpE0Wf0FP4AKAzUlWD2HWHPWq+yScqPZFu
	gNoZoOvNuRD3bdreqZ7sLpefnddgB/tjJpejF4Z0sorOF8Cq0PMN49beNaLjT6wdblz4P7FrKU5
	HI6sNsYsdUFQ3cusPxtNlQAMJOIDa3TWkNU0qtGeXjor+ZhhS+pL5XJzRg5ip1T8D1Srd/azC8o
	waMyT3limBRkNCPM+WXVTYO1CZN2ToFVdPH2qFcxuhc4hgN3CbmjDcsPjjiB/jo1o
X-Received: by 2002:a05:620a:271d:b0:949:67ff:56c8 with SMTP id af79cd13be357-949bab651b2mr325637185a.80.1795170010537;
        Fri, 20 Nov 2026 02:20:10 -0800 (PST)
X-Received: by 2002:a05:620a:271d:b0:949:67ff:56c8 with SMTP id af79cd13be357-949bab651b2mr325631085a.80.1795170009727;
        Fri, 20 Nov 2026 02:20:09 -0800 (PST)
Received: from oss.qualcomm.com ([188.27.161.77])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4ab6b110c3csm4998086f8f.36.2026.11.20.02.20.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Nov 2026 02:20:09 -0800 (PST)
Date: Fri, 20 Nov 2026 12:20:07 +0200
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
To: Stanislav Aleksandrov <lightofmysoul@gmail.com>
Cc: Bjorn Andersson <andersson@kernel.org>, Abel Vesa <abelvesa@kernel.org>,
        Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>,
        Jerome Brunet <jbrunet+clk@baylibre.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        Qiang Yu <qiang.yu@oss.qualcomm.com>,
        Konrad Dybcio <konradybcio@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 4/5] clk: qcom: common: Register clk_ref clocks from
 qcom_cc_desc
Message-ID: <g7i6j3xieuevlouthjr45gsczzq5nppqvwskap7ngxqq2ch3zj@7cc4i75xz4d5>
References: <20261116-halliday-clk-v2-0-28208928da36@gmail.com>
 <20261116-halliday-clk-v2-4-28208928da36@gmail.com>
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261116-halliday-clk-v2-4-28208928da36@gmail.com>
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTIwMDA0MCBTYWx0ZWRfXyTamorvRFuFM
 e5BMblddjOqnIKZ2MUxojxZ4/Tbv/cBXpJ+FkVdLOvgGxkkxh5EZz91kothWa4XatE7FnAJuLcD
 RwKiwOKnS4WwWa8HnHG9GPkqrS2Dr8w=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTIwMDA0MCBTYWx0ZWRfX2qMOxkWNN0Gm
 iBnZczV/BMydbC45op1P48BgQiBJ9jtJDQs6DBatJ/X8BxJii6gbgGAqvLLwdPzAsg6S//ruj40
 I/ART5+iwrZwwKegbSiZgZAgyjwJw/srPv4w2v80FUo5xkIKte3eJfxqstLKyqMOwjYeRRhdOmh
 ClXkeEI4OAUx3YHRdh542uK/uJDV8v2tKiYbmAM9RQe10jZ7AbeoRB5+mso611pMBmSkOIHIUKI
 CD31mZBd9Z2poKohhAWrrs55mZuBd5DRYlYKlG7erXlOUqmCJYKYeob6SW+ynLrsicrd3jrOiDX
 G/xcKFwuBkY7J3IWmaKJiOykSuuQEDWlHjk0FkqGhxNn/ArJxHJS/e2svv5vzmvpp20pDGe2lCs
 t37PgEK6NuVaHBfsr1WLCHMnK7WKjTwwhIBAN4HeczXC6U9TtH6DmT1a1NIyuwMWy6Zr6loPGfU
 lvJpyHDB+6IntKqKldg==
X-Authority-Analysis: v=2.4 cv=GZKCDgXL c=1 sm=1 tr=0 ts=6b001edb cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=asF+/XNaGoxFafzDDLC1GQ==:17
 a=kj9zAlcOel0A:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=pGLkceISAAAA:8 a=EUspDBNiAAAA:8 a=wqR6ls3WrVHNmmoEC9UA:9 a=CjuIK1q_8ugA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-ORIG-GUID: -FZ71KwNT2nqmsHN1BLt8Y99HzQpjVYP
X-Proofpoint-GUID: -FZ71KwNT2nqmsHN1BLt8Y99HzQpjVYP
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-20_03,2026-11-19_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 malwarescore=0 lowpriorityscore=0 priorityscore=1501
 suspectscore=0 impostorscore=0 bulkscore=0 adultscore=0 spamscore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2611040001
 definitions=main-2611200040

On 26-11-16 21:24:22, Stanislav Aleksandrov wrote:
> The clk_ref clocks model a clkref_en gate together with the supplies of
> the QREF block that feeds it. So far they can only be registered as a
> standalone clock provider with qcom_clk_ref_probe(), as on the TCSR of
> X1E80100 and Glymur.
> 
> On Halliday the clkref_en registers are part of GCC, and the QREF
> supplies are shared with the UFS PHY: when UFS runtime suspend turns
> them off, the USB HS PHY loses its reference clock. The GCC driver
> needs to provide its clkrefs as clk_ref clocks next to its other
> clocks, so that their users keep the supplies on.
> 
> Let a qcom_cc_desc carry clk_ref descriptions, indexed by clock ID like
> its other clocks. qcom_clk_ref_register() now registers a single clock,
> so qcom_cc_really_probe() allocates and registers only the populated
> entries, and qcom_cc_clk_hw_get() returns them for their indices. As
> with the other clocks, entries listed in protected-clocks are skipped.
> A clock ID used by both a clk_ref and a regmap clock fails the probe.
> 
> Signed-off-by: Stanislav Aleksandrov <lightofmysoul@gmail.com>

Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
