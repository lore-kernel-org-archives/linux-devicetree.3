Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7D8C631CA4E
	for <devicetree@vger.kernel.org>; Mon,  6 Jul 2026 13:57:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783346278; cv=none; b=VkTUlSonIxsCwbwRd9i/+eCu5+AMA9nI55JyVN27+az9qMgAuliiv630y1CvLZifl6T4x5r4tCadPME3Gy6YLY/RDr6wqzO3oir/KgYJxgpenAOtbyElg0cgxiGKMtdc601fAYd4mX9+2o8dON0L00hfH9evGDusd9fTlW2N5Xo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783346278; c=relaxed/simple;
	bh=IDjOOfeOZ8wFAqZTFpKACGrLEkbD4S0dBbL444WoFj8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Lu+jvrS+RNzvI7xthFKH1HnW5K9vTw+NqxVnNBeVD+tzi1q1sCOEZ8q1sbR6mJiRx66noW148mEObHtFyMhN03p3Nw3Tmt2Rrgph5KaMSCrG5by4ENGCWKa6tFO84Z4Pznh0TFnlioN3faoXy4oCkwkZNNkzxO0cI4SBVu9AL1k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=QPOMgj9g; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=iaSUEMtC; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="QPOMgj9g";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="iaSUEMtC"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 666AxII7391309
	for <devicetree@vger.kernel.org>; Mon, 6 Jul 2026 13:57:57 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=YPJxXsZP3N6RjeXTKZEWlYvT
	PiA+ZJkZ4eppKfRD6pA=; b=QPOMgj9g8/cUp4qyhWsxsLUmG5qebT+8St3XPUim
	yfIqHX6CQsojIpmhSQFaUDZCRBD2akHkt/kB1H05Ut2JUPS6bZ5tDQyCVLHvvp/D
	/wPj0qAPafADoHjnYQh29scU+uaMYtrvnDOEfV4C9GGZOv+0zyRoIeTdTCzhWOjw
	D8C6P6ssNIVggStX7orX/S0vODq6XmWFPucJiEnR9Vnr1ucjJPeMA6AuQaFtKQxg
	JZlo7KfAXTuuXvKBB2MauJ7R+oiZb1cGAjJlXcoj6Gqgj/npPMnjONp7fFOGVFwO
	ePXgG0TCIONBkXbo/bUDwhbZgpwp88+xhqj6rAp0CGApow==
Received: from mail-pg1-f198.google.com (mail-pg1-f198.google.com [209.85.215.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f89kgs2un-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 06 Jul 2026 13:57:56 +0000 (GMT)
Received: by mail-pg1-f198.google.com with SMTP id 41be03b00d2f7-c9fe2607511so4496342a12.3
        for <devicetree@vger.kernel.org>; Mon, 06 Jul 2026 06:57:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783346276; x=1783951076; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=YPJxXsZP3N6RjeXTKZEWlYvTPiA+ZJkZ4eppKfRD6pA=;
        b=iaSUEMtC+DyXiGrrbf2eJovSN0mh4VsXzsVgfttAOtHx0OPN0J7ZBHx81m1raoBSCV
         0jOMV7sVa/j8N/4b6UeeVFxfkiGvI0atl9sbuugUhGOkLG7aT9JBWcM+gJPo1MBlEK2h
         Ru9OwBrXxPcn+6RVdmzfB7WLvGlnJkq4muwavuRX7WxFIL9jEI2cyXDLTMA34fE4Pw4s
         Bm2ZjrvyP0W/TiGrEYy/o/LdW/zM4vzonQ6WN0sKhsrSqGYPKEzNSolqGbg52FadtwKT
         Us2r99iQ0GpOhLXK1V4FiwSy9hDBmFXa7FntuHLA0uPRMlu8j9HxnUNoVLdV4LgCr4ei
         fmMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783346276; x=1783951076;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=YPJxXsZP3N6RjeXTKZEWlYvTPiA+ZJkZ4eppKfRD6pA=;
        b=tFqYAzrDeSqpJQ0TcrlA3NKdSijt1eB43Mb+t8bVH5s1t1Fsd9Wr87lv/YEDT48QbK
         E14SHebEgRla1dIsjn4LVt86lm9NmNC6PqDWHT6a6rPkfJu2trYtVci59h33GIBui3zd
         ufeUxCtycW+l4rsHhA2Rh+aCSyCnPakIvzKfCAoPA8y7TD/f9Gs31K9b/uXjOV/wJjQO
         p31fjP0bHXyDXYBPWWtmvm2HafIFizmeIr9nmve5BBkbVF4GLEAORrKgSXulczg0opgg
         ojbpX4PDK/l7RoWTLVYskdI/UUZFP751AkznkJwGAqIt9EPFBmQzYMUXgTac5dl8lqwE
         R4Ng==
X-Forwarded-Encrypted: i=1; AHgh+RqYoOfwexsfOoZh5DAX2ykYj02ACmSGuWuRBqnKEcvo44J78f+llv1yPsc3sxpL2qthb+hoTW1/Eq8Z@vger.kernel.org
X-Gm-Message-State: AOJu0YxRHCCxsgzWmKcNO7fw7zZtsT5QkB3muxrZ+FPcEcpQ7aGuVNMZ
	PoKgXDdxc7RAagOxp5pZkJ5BS14CKrgd/Z3QogyQ9za4K7Q+dNMdxMB1OdwsXfxM2v6MIh8ppH9
	KbiCDSIkVFscXwxcRM4VaGmTR4elpkPHdP0yAfrimxc3/fwTYFsTUsnE9DWWmaB9Y
X-Gm-Gg: AfdE7cmeun+WcVUgMNmkMzzpl1qdPk4kn6dgFPt1z3HbAsISgM7aE6iLd6hQVQ5LZmp
	Pmt/4BdspnMLP4/8+ucvZ+aGVoxvJwlGtDOqDCsZDdUiD6uRPqwwppUW6KLTWBYDsIaWWTavDzm
	5/A4u8pekxR47l5WA4bQbgBqmdhTBsD0kECj9gRTlud+phbFFxN5XMyhYgwmruPH+x3gk29pAbt
	bs2OjmsTtDHFysK6LWydn8zQEReZnJ+xsM5nrTl+sANyp+g8bUiwaHMP2F5WFA1WkHArnVjHjcb
	toKDfjd/ZnXqKe4KghrIHkuQui3OmuT+DhwXfduQZ97NS1GU556MW3NrH/aRdPT7Hc737TgdJB/
	3JrxNFDUOgBoWulkifORrylQqidtcepI29ag+aUkpAiGz
X-Received: by 2002:a17:90b:3890:b0:381:41e9:32a4 with SMTP id 98e67ed59e1d1-38756030381mr612596a91.13.1783346276184;
        Mon, 06 Jul 2026 06:57:56 -0700 (PDT)
X-Received: by 2002:a17:90b:3890:b0:381:41e9:32a4 with SMTP id 98e67ed59e1d1-38756030381mr612551a91.13.1783346275709;
        Mon, 06 Jul 2026 06:57:55 -0700 (PDT)
Received: from hu-pkondeti-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-30f3c8b19c7sm36304130eec.4.2026.07.06.06.57.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Jul 2026 06:57:55 -0700 (PDT)
Date: Mon, 6 Jul 2026 19:27:48 +0530
From: Pavan Kondeti <pavan.kondeti@oss.qualcomm.com>
To: Shawn Guo <shengchao.guo@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
        Deepti Jaggi <deepti.jaggi@oss.qualcomm.com>,
        Harshal Dev <harshal.dev@oss.qualcomm.com>,
        Herbert Xu <herbert@gondor.apana.org.au>, devicetree@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 RESEND 3/5] arm64: dts: qcom: Add device tree for Nord
 SA8797P SoC
Message-ID: <eb197cd7-c1cb-4edb-951c-dba08864ec74@quicinc.com>
References: <20260526051300.1669201-1-shengchao.guo@oss.qualcomm.com>
 <20260526051300.1669201-4-shengchao.guo@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260526051300.1669201-4-shengchao.guo@oss.qualcomm.com>
X-Proofpoint-GUID: -VnOxEww3LjVuq9Cml2OslNk4X1W1ii1
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA2MDE0MiBTYWx0ZWRfX4ppGqUD5wfPG
 iHWkOseNhY1BrdEaLFG6r3MZXPqBC6PzjsS07dWXRHvijpvMd1t8qTebCN+FV/TOokJ4M1zW/V0
 qor2z7HtKuWekGzJW4sgvU6EwPCtIDRTTcneIWjoW1MRdzcuemZPR80H95aEkMoJzM1SwJGdL0a
 IJMQwy1Qeg1FMjnluECQVWLD9r8/rr+eBAmCbyYfGQyZFlggB4JiUwsmCLTTxv6ADmNgO1eNQq9
 ZYimWRfMXVJ1nam6+7+mRcp09KPttkryh9iNgYn8GoLkgp0VAmAo3EGQvD8lhpNqKDBUnUkTi5r
 TsETgIEAvML/Kk4NDvZ6Xdej0JPEwRSj7Uyl1QPIxSZD5md3tT2NXMbe/ZlN6SdWYG7QmjNU1lE
 wJCoNuFnzxjxoZMLH1p3NH4ACg8MHfOynmiM4E8XXCHKt22LcxVTXheFzJ/xqGpde7LxhGComd4
 w948d1pVDjvrjKGctOA==
X-Proofpoint-ORIG-GUID: -VnOxEww3LjVuq9Cml2OslNk4X1W1ii1
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA2MDE0MiBTYWx0ZWRfX6qF2aBWTUsLF
 EUVE2fzOFN28988ZxSC9z05kTwdTGwQ1GylGsGy4w+2i21/2tsKlVvtBxOX108MxsVgs+18+jRW
 1K9XyQXBV9YaEAL8kn7LwDrJRZwolPs=
X-Authority-Analysis: v=2.4 cv=c6Sbhx9l c=1 sm=1 tr=0 ts=6a4bb464 cx=c_pps
 a=Qgeoaf8Lrialg5Z894R3/Q==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=kj9zAlcOel0A:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=DDZHeiFfpNG52dTxXqoA:9 a=CjuIK1q_8ugA:10 a=x9snwWr2DeNwDh03kgHS:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-06_01,2026-07-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 suspectscore=0 phishscore=0 bulkscore=0 clxscore=1011
 adultscore=0 priorityscore=1501 lowpriorityscore=0 spamscore=0
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607060142

On Tue, May 26, 2026 at 01:12:58PM +0800, Shawn Guo wrote:
> diff --git a/arch/arm64/boot/dts/qcom/scmi-common.dtsi b/arch/arm64/boot/dts/qcom/scmi-common.dtsi
> new file mode 100644
> index 000000000000..0c7ffe9e415c
> --- /dev/null
> +++ b/arch/arm64/boot/dts/qcom/scmi-common.dtsi
> @@ -0,0 +1,1918 @@
> +// SPDX-License-Identifier: BSD-3-Clause
> +/*
> + * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
> + */
> +
> +#include <dt-bindings/interrupt-controller/arm-gic.h>
> +
> +&firmware {
> +	scmi0: scmi-0 {
> +		compatible = "qcom,scmi-smc";
> +		arm,smc-id = <0xc6008012>;
> +		shmem = <&shmem0>;
> +		interrupts = <GIC_SPI 963 IRQ_TYPE_EDGE_RISING>;
> +		interrupt-names = "a2p";

I believe this interrupt source is GearVM firmware via Gunyah's
doorbell, correct? How do we know that scmi0 instance's interrupt 
is GIC_SPI#963? Are these assumed to be constant/fixed through out
the life time of this SoC?

> +		#address-cells = <1>;
> +		#size-cells = <0>;
> +		arm,max-msg = <10>;
> +		arm,max-msg-size = <256>;
> +		arm,max-rx-timeout-ms = <3000>;
> +
> +		status = "disabled";
> +
> +		scmi0_pd: protocol@11 {
> +			reg = <0x11>;
> +			#power-domain-cells = <1>;
> +		};
> +
> +		scmi0_dvfs: protocol@13 {
> +			reg = <0x13>;
> +			#power-domain-cells = <1>;
> +		};
> +
> +		scmi0_rst: protocol@16 {
> +			reg = <0x16>;
> +			#reset-cells = <1>;
> +		};
> +	};
> +
