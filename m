Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5EEEB302146
	for <devicetree@vger.kernel.org>; Thu,  6 Aug 2026 04:03:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785989024; cv=none; b=hjB3uQKF0kIMBiXvQ3vcDxdYBBXpEzTcjSEaEIQ0B9lsivcue2EA1zj8OsoV8tB8sfG9eSbEi0zU/bs2G9Zm9Qgo2i6Zgzoxiy3dCL4a6Vd+7d8seYAG0bQYhYscoowQC+2fALj/Tk4XsOd213nqrli6bNRYQyi9eAqmq0Hj4bI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785989024; c=relaxed/simple;
	bh=+7b4BRslRQYf2WVkRsiagi0bUagaJFsaLU0PG2NOj28=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=jpott/PvWb8ORAY1f/Bqe398iedV9Fq/i/awnUWdSjo8iJGA7mKFpe/ynpT1HIo8qOETvusiic/R6tRtAn7i+LbYx/XRFDn80LeGvYKc9qRPEjQzCFQ4gbSPciWWmWU0BTSlaNyOnh3EJM192uZzHrISo0ytrMQrngYwlAdgjB8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=bjuubFun; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=bbAFlwn3; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="bjuubFun";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="bbAFlwn3"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 675Napod1354120
	for <devicetree@vger.kernel.org>; Thu, 6 Aug 2026 04:03:42 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=sv84S83jXs/3SGgrPZsdMKfP
	XRfW980yK0Ut+W9DtSY=; b=bjuubFunDQvK6cqB//flAfp0LjqFIFdYwJiG0XQr
	Bz8FMQvnOqfBQvtgOU33qg0tUnF5caP8sfP5pdfQTSf1qtq6ycWVAq8guwEP7DbX
	YmfVm8sSIZYrLWE6rCZzEpYuuK8XaiB8QKGJpO7KPJb3DdAchonOvGmxTRQ6uSrn
	5YIyssXqOiWucnTE7ONrKVcBPPCYM3vFvDGc6NTbKwU13UkKCh8+pIRR0pS4PpYJ
	J+atr4gIYIvtjGTKGmiLC5uykuBiCRcXkF/bvjOnEspFIuhOZLHF7CH6p8qTINT2
	R8BkKVsm1tSpzY98xzLT1HRJLZhsQIr0YUhbEg75Fuj3oQ==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fv9dmj606-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Thu, 06 Aug 2026 04:03:41 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2ccb6f6a3f4so8803415ad.1
        for <devicetree@vger.kernel.org>; Wed, 05 Aug 2026 21:03:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785989021; x=1786593821; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=sv84S83jXs/3SGgrPZsdMKfPXRfW980yK0Ut+W9DtSY=;
        b=bbAFlwn3nz34DMZnHz40vUvf6WpJv0cS/VktYk0WidKWUlOr/7mOYLl6uG3NTvsgU5
         xkKGH3hZR5uwg5eDiN4580I+EqlnQlNxxM9F81sXmEbT0D5vUTv3YK07LObkLiAh1K7d
         ZI73HxIq7rf9eIB9Bd0kw0f44U7eo2ZP9r1zky584rQTVXzO2UbGPsUqIGOZTizEVGeC
         iE6B1x2gwalqj2ZX/dbTcOuu/ZLBdNuDtOWLpiOnc+C3/rAvR2kKWx8Qq2nOK1lJJvOv
         xfQ1Ls2KyZp/CK7G3st+hNlo0ZBG8lEn8xKXEn8FHEReU92IWfH2a8dFVSvVhLBnVVFj
         FTIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785989021; x=1786593821;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=sv84S83jXs/3SGgrPZsdMKfPXRfW980yK0Ut+W9DtSY=;
        b=T2oo5Eck+vX/oQCBngXczAz5RkpnsaxMUs4BwgTSjBdKCti+pSJgce1rV5X7A1VuaP
         CBAzth8JaMl81j/DysMm8SNGFvVED1LnVi524nNoaA6ESXT8iYrDoLQhwhtaJrotR/uD
         XkssiwXBdFyS2cgSipZQ2yuCTrt42ZCk2faLSA4QdQ8O7AwixAlb+SeHtzQFEVyjxjp0
         l2Nb7KRJndAqtCBIt5yzNDB9sWqYUXZybXLDBJROvbYSDEryoNdNE+SUkxPa1d+GbshA
         oFvfkGQRl9IYxDZLS7QKK/RIz39bULoSuMhNTYp6iqbp47wGENt0Il/AB4fHY+jj28bf
         N8Hg==
X-Forwarded-Encrypted: i=1; AHgh+Rr+i7+RELM/rknMCUtEfl1bdGftR+KhqUP6S5/HGEg+XAL/BNxKmsDQCkW7n7bCH3PhpZmfJOP/RrkI@vger.kernel.org
X-Gm-Message-State: AOJu0Yw2aCQHe8813fFddM38Dsv+nNKQbPrbYrCZk67Djhk6NrMcKX8x
	7tf3Etog64GObDfecqRlDvNFHhYbwO5/VCt9cKHL2+VW/4ZKaWFyclHeKavcjxXoLwAPhyfKQL5
	QTVTgKhL+UIAM7E7wq1sQwpIU7R1dFpOZrlyaAccfV4C8HnSo7ZTG8Puuvd3QNOMX
X-Gm-Gg: AR+sD13DgO5v/OavVNt9EAowANocvbI0nqRJWf7HohhHyBd9fpDPDprvGxjw5DqjeZE
	+tRIhi8ZmwQIgZaxke7bhqoTqEz15VtNX8+pWjuGxtljv1MYbi+qZn1dzwDVTCEvQ0ctxYc+6Ea
	jRLnQJifcS3RN/8l4/r8WL1e9as7AEEJSiLqb0/rj+aiL9U4Fg38p/WslRfLNcWFrQmcpZY0AE5
	kN9+RiHnvNRHg/DJXWa5AKKudIY5NQBCHPxmINCBCfXvXGJzWL09hPDP6KV/crqqM4ZB6p3K4EV
	mFl17hvztG6RMwKZM+DrCaz/TKEAvhczfqWDg/9Sb7XqCSt86/kTFNH2LDfgCLZu0eWsb58Gq1L
	d600m4xFaU+WX3XNxF/AWGB7NZ+gEU3MK9eHIWt7v05k=
X-Received: by 2002:a17:903:38c4:b0:2ce:a6a4:451b with SMTP id d9443c01a7336-2d0f1c130bamr45789385ad.11.1785989021179;
        Wed, 05 Aug 2026 21:03:41 -0700 (PDT)
X-Received: by 2002:a17:903:38c4:b0:2ce:a6a4:451b with SMTP id d9443c01a7336-2d0f1c130bamr45788875ad.11.1785989020705;
        Wed, 05 Aug 2026 21:03:40 -0700 (PDT)
Received: from QCOM-aGQu4IUr3Y (i-global052.qualcomm.com. [199.106.103.52])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-315863b0a9csm29547574eec.2.2026.08.05.21.03.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 05 Aug 2026 21:03:40 -0700 (PDT)
Date: Thu, 6 Aug 2026 12:03:34 +0800
From: Shawn Guo <shengchao.guo@oss.qualcomm.com>
To: Mukesh Savaliya <mukesh.savaliya@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Deepti Jaggi <deepti.jaggi@oss.qualcomm.com>,
        devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: Re: [PATCH v8 3/6] arm64: dts: qcom: Add device tree for Nord
 Embedded variant
Message-ID: <anQHloaFBnipM4r7@QCOM-aGQu4IUr3Y>
References: <20260729010022.875799-1-shengchao.guo@oss.qualcomm.com>
 <20260729010022.875799-4-shengchao.guo@oss.qualcomm.com>
 <a8fece75-153e-4461-8c04-d26b332b16b6@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <a8fece75-153e-4461-8c04-d26b332b16b6@oss.qualcomm.com>
X-Authority-Analysis: v=2.4 cv=TJR1jVla c=1 sm=1 tr=0 ts=6a74079e cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=b9+bayejhc3NMeqCNyeLQQ==:17
 a=kj9zAlcOel0A:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=EUspDBNiAAAA:8 a=HMi4NH7v85-LoBnzSNwA:9 a=CjuIK1q_8ugA:10
 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-GUID: L6R7DHGgkrJXKWOpTxPv8ILoH0ZfI5x_
X-Proofpoint-Spam-Info: AW1haW4tMjYwODA2MDAyNyBTYWx0ZWRfX6AkvqADK+7oM
 sujwZxZyPmK1HC5IIGjE8MhiJ6TCD2AEzCysuLhXkwgWyZlhbxZiRPbeniC91J1YCI1vj8FOtF0
 DkXNRmEWVjUM09v99diWxQH4A7m8WBM=
X-Proofpoint-ORIG-GUID: L6R7DHGgkrJXKWOpTxPv8ILoH0ZfI5x_
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODA2MDAyNyBTYWx0ZWRfX6RJ2YltcTwOg
 Lbxn2NKvKxNt5Onb3dp4Qj3t2/7pEcOfhTysERZPatPgyyDTrzfIwmTiWlzHABEzkmcUoNjhPSF
 D6/2WX2NXn4vJTsnrMUD3bG0hM9wwb95f7EbgFp1roouWjRFwzGwOE93yATsrmMsne4hfKPbhra
 23z6CUb3c8nDThwCVjljXWhPyMP+aCJf1+P+gtPrdFDYeX55H7Izu3MTTkkxy/jb9LUq2T+9XDm
 5nj/JVwEa/KM+uRyJfSXPnvigEyefGLnvxaqzaCxupfS5kapMEPTf1rh+pF9fWnyd6xbPMi2iPW
 jjWIrIZOu6zKnUsTcQsO6a1pdBaogsj1IbQnQj/1o8cMw0txP7o7jPK3T1kbMVpxBN/LFTuh2Rq
 4982DYDkBx7kqDpynHLKghHn9qh5y+AcZeP4bYcIC7j6I24364dr2u6conSnk+0X+HawktnUb6R
 ub6WQGXR9j7PbsuqQhA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-05_06,2026-08-05_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 bulkscore=0 suspectscore=0 adultscore=0 lowpriorityscore=0
 malwarescore=0 priorityscore=1501 phishscore=0 spamscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608060027

On Wed, Aug 05, 2026 at 11:38:00AM +0530, Mukesh Savaliya wrote:
> 
> 
> On 7/29/2026 6:30 AM, Shawn Guo wrote:
> > Unlike the GearVM variant, Nord Embedded variant has platform resources
> > (clocks, regulators, powerdomains, pins, etc.) directly controlled by
> > the operating system. Add a separate dtsi file extending the existing
> > top-level nord.dtsi with nodes representing these peripherals as well as
> > describing how they are wired up with the already defined components.
> > 
> > Co-developed-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
> > Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
> > Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> > Signed-off-by: Shawn Guo <shengchao.guo@oss.qualcomm.com>
> > ---
> >   arch/arm64/boot/dts/qcom/nord-embedded.dtsi | 1726 +++++++++++++++++++
> >   1 file changed, 1726 insertions(+)
> >   create mode 100644 arch/arm64/boot/dts/qcom/nord-embedded.dtsi
> > 
> > diff --git a/arch/arm64/boot/dts/qcom/nord-embedded.dtsi b/arch/arm64/boot/dts/qcom/nord-embedded.dtsi
> > new file mode 100644
> > index 000000000000..032d384f6eb3
> > --- /dev/null
> > +++ b/arch/arm64/boot/dts/qcom/nord-embedded.dtsi
> > @@ -0,0 +1,1726 @@
> > +// SPDX-License-Identifier: BSD-3-Clause
> > +/*
> > + * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
> > + */
> > +
> > +#include <dt-bindings/clock/qcom,nord-gcc.h>
> > +#include <dt-bindings/clock/qcom,nord-negcc.h>
> > +#include <dt-bindings/clock/qcom,nord-nwgcc.h>
> > +#include <dt-bindings/clock/qcom,nord-segcc.h>
> > +#include <dt-bindings/clock/qcom,nord-tcsrcc.h>
> > +#include <dt-bindings/clock/qcom,rpmh.h>
> > +#include <dt-bindings/interconnect/qcom,icc.h>
> > +#include <dt-bindings/interconnect/qcom,nord-rpmh.h>
> > +#include <dt-bindings/power/qcom-rpmpd.h>
> > +#include <dt-bindings/soc/qcom,rpmh-rsc.h>
> > +
> > +#include "nord.dtsi"
> > +
> 
> [...]
> 
> > +
> > +	qup_uart17_default: qup-uart17-default-state {
> > +		pins = "gpio152", "gpio153";
> Can we add all 4-wires including RTS, CTS so default usecase for Bluetooth
> with can be served ?

Hi Mukesh,

Thank you for the comment!

I can see that UART17 (including CTS/RTS) is used for Bluetooth on both
Ride and RRD reference boards. So your suggestion makes sense.

Since the series unfortunately missed 7.3 merge window, I will send v9
to include CTS/RTS as suggested.

Shawn
