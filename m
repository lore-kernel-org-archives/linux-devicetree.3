Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2BCB01D89EF
	for <devicetree@vger.kernel.org>; Sat,  4 Jul 2026 00:21:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783124476; cv=none; b=ebNbiWir8O2zD6JYYyczBfBqT4smYxlzP2/tGHG4j6Xo0lccPq/+rr6F1mILyYjYmy1DQM9jaRuAeMI3/h+s1ku+DO1bMscnFn163wSJnJWKy52sgWLpjvatVYWLfoAktKPYxFFDm3XBOthc9AcNU27RNVamm3INFZ7uPmgryu0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783124476; c=relaxed/simple;
	bh=OkBZtEQrFq9mYM8uJFu4I9I3b9DddqlnSjpwJ6+aags=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=O6mo6wOfwZoqFXw+GaJH8APuMwcnw/7Sfik9VRvvD9TOpnFU21t+4RtzUrJSdvYVRqdQBjjQ6LrLihbImDDkLbuAKhzbUTZC/DtV5GHEwQBm0qkiI0dV0aCd4jlrXwPknoX4HeT6QoV8C7Rc7diX8nhycSCevkO0P1M3oP4gXKE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=dNBGEHVN; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=icNq5PrJ; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="dNBGEHVN";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="icNq5PrJ"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 663KPTLY1019200
	for <devicetree@vger.kernel.org>; Sat, 4 Jul 2026 00:21:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=KecK7PxPE3CXCxkRqv9TgBWx
	1h6mEwwz36ausN+cJqA=; b=dNBGEHVNuU4eLELy7Mt+tty3ancPewilp4rMayOQ
	HTbrzr7RhHf4S2gUZED0QI0ota+O3JfPtBkOsiPmfUJ4uL1dpImzDEnjYgwuLYFC
	rcFxIYeFlFKapoHFA7lKqpOWjYJuJjstxOo0mEsRzFXq5evIXRZOop54FaKbYZ/0
	V8xIXnig+jfV9qUa6EhVmy/qjGRw98oJeabG+oXzqwS6NXeTvsYSv7nOFhUcflJe
	XsW3w8P3Ch389+PwvfIkpQswFoUTvgmXt+kIUI9iWC1OBEKWKQ4xxQbWxL5809cL
	z1hHkkxLMyH2aO2sxerKpMX33dYm5+PK2l/Sa7FKMvI6BA==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f6ckj24v6-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Sat, 04 Jul 2026 00:21:11 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-92e5e38fbc5so90752785a.2
        for <devicetree@vger.kernel.org>; Fri, 03 Jul 2026 17:21:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783124471; x=1783729271; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=KecK7PxPE3CXCxkRqv9TgBWx1h6mEwwz36ausN+cJqA=;
        b=icNq5PrJWo8wd3LgMgGev76PoQz8UYxLvNcWVps6qmPc/XgsHEQzRq8C/jNwSE3McS
         IFsZTb9iyw5BoA4QDRsCFAY21vNdE1ilROuTqqks7iiz2/P3YrWe5z9RcjLn0CAm78Uh
         qx8ocKxw5HZaMl3d8UKa/rTVzIagqM54XUmcvsgM/0UsOV8WRmVfxpaEX/7UZX/LfiHM
         1JtGB2yIaMUvArZ5R5F6RFTmFeNePtPprhM7Lmfxut+776jsXyU3H6Uen9DQmdXE6wj+
         C7ufv73kmQv9Bt88Y5SZDMruEj6aPAgYukCZt5/IUAy4oGKapZI8bxnxFUsPl65Q6wQK
         hq/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783124471; x=1783729271;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=KecK7PxPE3CXCxkRqv9TgBWx1h6mEwwz36ausN+cJqA=;
        b=G7forHQcVZhYYV512dLJL5xnjPZtlOwuLuoKo3VUdImCCTLBojuorHvKgIU0ZXPvfj
         auQJVbGIj/+8DxbAerCDr1CftmykX4jfYeq/I1NmyQadRR5s2oc1eVv7LhAHdYmM2kvS
         SV8tYfCQlJY/MBe2VFp15m4R8giuSognBtXJzLmaPz/ByCASOt25HP8yrtxsOapO/XiA
         WJ5ScG812G9isMVY5hh8Cbz4lTjl12ApJhipL3tl+9ZCmie/pzp9k7WiY48NjudRVt4k
         GvCC4UU4mbDNZpFm0fCnHIKtg2b1EcZe1kEdaOeD6xw9jHLmWiqLcxmWITZhh9yO2C/3
         L/Ug==
X-Forwarded-Encrypted: i=1; AFNElJ+KNBrwUNErA38anItc2d5kd509o5iBiHY6+jalkLtILS4Q3K4+dCPfKPRsWKZ5rd4KZ/11IcIzVeco@vger.kernel.org
X-Gm-Message-State: AOJu0YyJdDycLmOFC5fmx0PsRcOmcXWieGim/FE/ye/daBt70p2igGMv
	geoEAiH4Wzcg6tzrchyzUNaLMsN8+lQjbdWTYL9eM9qvd5RjcqOOuHxyzmasfHt4MNEfw/4GNnO
	0fBTOm+6w/8e10yKM9Eb/NVCL4KuDljkhTfboqYC/IU9qAcF+9pi4R37nt31Tc8E5
X-Gm-Gg: AfdE7clmczZTrotNYbw8hNk/MBGpB06Lgp4tcRry86mdNzQfofjEIfbc9HfSZK8NMqS
	8borwVUEMP6gQo6sF0LEskk26la1VxXHILWtIcqIpgs+OpkAcNHU0XhHeatklsj/no65F/ahmhC
	PritDmWI7DJ7HdbKt285Oej5G6JLOZkCyXt0Rnz+TSTwPPZ+g4Bw2ELF6ZoCgqUxhZkRHKmxrRC
	Zq3Gd1KbDFAnYxW6akqiiwcSPg/pvflovWewAkfwWr2lVBWwpwsvBepJCqhNAtf7yarjizBAT06
	LgbOuF3jLDkky9Oqu99m/gf2MjjKE1BUeLnkIG5pVcGXq6Fav2meLUSSgl82KpIPCXkt5ET/Z02
	736iyz85ZdcxNT+tAsOeJbLxIuhWHH5G1XkaIb56DALgHzY/2GVbBztDh9r5ZIN6ylQLB85AjZN
	TFiWLKOPuTqjULRX7lOKzglkou
X-Received: by 2002:a05:620a:2620:b0:92e:61f1:6b72 with SMTP id af79cd13be357-92e9a3467f8mr236924485a.13.1783124470718;
        Fri, 03 Jul 2026 17:21:10 -0700 (PDT)
X-Received: by 2002:a05:620a:2620:b0:92e:61f1:6b72 with SMTP id af79cd13be357-92e9a3467f8mr236920685a.13.1783124470249;
        Fri, 03 Jul 2026 17:21:10 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5aed13bb4a6sm848643e87.38.2026.07.03.17.21.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 Jul 2026 17:21:07 -0700 (PDT)
Date: Sat, 4 Jul 2026 03:21:05 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Imran Shaik <imran.shaik@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Brian Masney <bmasney@redhat.com>, Dmitry Baryshkov <lumag@kernel.org>,
        Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v5 14/19] clk: qcom: gpucc-qcm2290: Keep the critical
 clocks always-on from probe
Message-ID: <ko4cwdgbjoqo73vljlplsfeohe77qkxp4zj4xthtsefddlzi3v@rp35hvxwz3t6>
References: <20260703-shikra-dispcc-gpucc-v5-0-cc13826d4d5a@oss.qualcomm.com>
 <20260703-shikra-dispcc-gpucc-v5-14-cc13826d4d5a@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260703-shikra-dispcc-gpucc-v5-14-cc13826d4d5a@oss.qualcomm.com>
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA0MDAwMSBTYWx0ZWRfX2Om+Q6sIyhCw
 GSAqSkW6wnxw1gBd2DqnJcIuk2WK+dvXkBs1nCbLOg8siu4a8oeEph6wp6FVuJw6oDBIcR+X/Uj
 zQexkomzXtLEevLvKe283DL3xRYYnb0=
X-Authority-Analysis: v=2.4 cv=E8v9Y6dl c=1 sm=1 tr=0 ts=6a4851f7 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22 a=EUspDBNiAAAA:8
 a=GABpISGgAy3S5f3vv6IA:9 a=CjuIK1q_8ugA:10 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-ORIG-GUID: RiKxfpVTESpViooLo51gWrcDX96_gjnh
X-Proofpoint-GUID: RiKxfpVTESpViooLo51gWrcDX96_gjnh
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA0MDAwMSBTYWx0ZWRfX2OMJrE/G6kDf
 WmGak8G5RTcD+CzbMMuBTMT+ccmF09u4ENCIxP+4WHy+Rn9MWzcUnK9TiUGvxtg23VAXKKC5BdI
 VQeAqyW5GuHqF7LIaDDvRTs8H2LFHg5k7mJDrUYoA+y2cA1EDkYbWJaBqW/j4VabCJExKu87QAM
 ys+JKDh/joBLj/u2sfyuv4rjG3NzrWIo5e1nx+99kK273Es6Lh21GZSM2QWnlBW3KHFlcMcAtnI
 m/CrtK71dsZ3r9xir67x9GwiBM3drYz3UjhDD1gEk8popsjfwVComt7v5DvCtfsCCO15pjso6st
 NRmmb89u9gdeCPL6vOLE9H/3NGXX4fXWS9VW7Cbt+UnyfkOJgATbtH7lWUbj+EMPVWHifPQY2VU
 Ue3bfXWtzro573JW7JNyzH2JCp7YtUWzWeLpsiCuuyKXn1AfLPuLsg4er6XUftvJKJTeXe3h28h
 0tYI3lu2AcHfjBZRq3w==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-07-03_04,2026-07-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 phishscore=0 spamscore=0 clxscore=1015 lowpriorityscore=0
 priorityscore=1501 suspectscore=0 adultscore=0 malwarescore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607040001

On Fri, Jul 03, 2026 at 12:01:36AM +0530, Imran Shaik wrote:
> Drop modelling of gpu_cc_ahb_clk and keep it always enabled from probe
> similar to other critical clocks, since marking it as CLK_IS_CRITICAL
> causes the clock framework to invoke clk_pm_runtime_get() during prepare,
> which prevents the associated power domains from collapsing.
> 
> Signed-off-by: Imran Shaik <imran.shaik@oss.qualcomm.com>
> ---
>  drivers/clk/qcom/gpucc-qcm2290.c | 16 +---------------
>  1 file changed, 1 insertion(+), 15 deletions(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry
