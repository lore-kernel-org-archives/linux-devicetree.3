Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CE2913845DA
	for <devicetree@vger.kernel.org>; Tue, 14 Jul 2026 12:21:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784031715; cv=none; b=YMerpCQ+ho0BQLvmw8KFEg/xUyJ78E7yLXfGr5Cok2OCt4iVBKSVa7chFV4Bnc4mcmEOItav9EN0ISR5OTSNTdOhKLzV+QpRl6Ni/mgu2FUv1XWijJJM9IZkhzZIakqdNxpNvH/8ar2srgT4KsUOhhlk6QAJX52NdO5zQhhi/SE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784031715; c=relaxed/simple;
	bh=blSGc8mpSJfii4N42Bv2ZHS+Y+To/QfElGIhr8fNnEE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=I8YH8LX3f+P+0M28edI1qGIzzIUZPdUy1ToyqtKMnvPY0Gy6YCO2hD+BaeFV1vxmFUF+YG27qouAr23+vLi572Upqovi4vEKnE4RTR00nr/N8g2zsB6z7k4FSDcYe7aStg1glCURh+RRpEMZ8K6P00cNldlZk9inmxiaOAylNLo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=NP2+lx77; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=JB8yTI/l; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="NP2+lx77";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="JB8yTI/l"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66EBNjZu494325
	for <devicetree@vger.kernel.org>; Tue, 14 Jul 2026 12:21:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=AaJWOsd5BnjyqC24eEwjOhih
	u+jMm50tNnjN6UTMWOk=; b=NP2+lx77TF+gnPxX5hILhZ914ChMD+KPaBl+iE3o
	pZ5QI6C3HOI2+Ab0ctmhxsEQgT/gIIjBztMKl/ZP98MQSq9avYPZSJSpPaGw3u7q
	XuU/XTzibRrj1saPv9klk0su5J5djM+9ImQ5Ri4fbjsQn5FuyyTtYkdz7X1eGrrE
	3pGzsJgCb3Asokg1umiS+nAk25LUtcscYtpqHY+J2z17ZP6vOGNJhNLja/3azd5W
	IjzNHeTdmbtVMcCDtmTqY7LGFbJnPZapTVj+gFyjJBSWMlYO3I6GoJl4A3gkoQ2B
	kRu/WFNczigNFKWLh3pAu4IQyYiIhv36X8mGCRVL98Rf9w==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fd44cumpa-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 14 Jul 2026 12:21:46 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2c7f385887bso103433215ad.0
        for <devicetree@vger.kernel.org>; Tue, 14 Jul 2026 05:21:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784031705; x=1784636505; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=AaJWOsd5BnjyqC24eEwjOhihu+jMm50tNnjN6UTMWOk=;
        b=JB8yTI/ltgDMQqYC8+hx7JBWIWYVdBKinC2tkUELeysLZxPDzdbaRVNmeAJa+0XNxF
         B6mrQmxYNV2vrnJMWxG7QUaeITZPlEf00VzxOgHsxAMAU4gGIvPglkfXR8fn1LGk4lgj
         qPfu2oqaY9D4subwlO2SlR/gyciOJ0nulbUuOo1w15SHPOnr3FK1q6p2enOnV3lmyT+K
         Cx8NA4w1OIVVPyoWpERSd9T9JU469OeM+EOKTmB52zc51A3RWYBkf7tXTzDzE0H8YrSq
         5NbZn4oRIr0gpNp/9CrcUhQb5zEJ3IT0go/+wksziRJZy3rLLb7khgSF49LguhEn3y7l
         VE3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784031705; x=1784636505;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=AaJWOsd5BnjyqC24eEwjOhihu+jMm50tNnjN6UTMWOk=;
        b=V1DrKasF5L1OTiiMiv6WYFpJw75VXcQubZFY5jRta5qBtL41lhHrmIEO+TFCpsx0Cc
         dyOWW0E495oD/DIekeZ8UwtgiXKVkhaSKFYIPaFDqPNI5yJ2sjGrVIgnU/EiLt3524Uv
         ysifJM5gyd9KrsrbnopQN2J+L4UHA6RoehJfkfP87SOZiWVajdBOnKmNEUG0ExUXI1Xy
         cOcRkmLdsgauFX7okda7UV2oK1z0Ku0mVIOhQokB2qhrYIfEXDEibmlsr7M9yYcyM49g
         YVLuCVw5jjHFxILYRJs9QfFpf7lDkx55IQ/qQ6qyz1uQCO19o+tF3VMtekl4TNnUigbt
         JVIg==
X-Forwarded-Encrypted: i=1; AHgh+RpPxzIeLD4Gp4fL3uCrR8QUy/g1VMLQFAYWEMYILiKNQ9ShzN1Sq1UWoZk+o6wDBptVW78sW9luRU7s@vger.kernel.org
X-Gm-Message-State: AOJu0YxpF/hLAHtR4XZ7heQXCzdJ0jWiKy0j+umEczddcYZEB6l3jK2t
	wRezIt9Tpj+S+eHZhJXdoj0rdSQT9RiYtSD3hif6jjWYYsJ5lNG3dRmTG8TEDWvIvX+7ETpX+fi
	232VN6Pj3v97PzU7qLK4ydd70TrMlU9GVdogM7Ycm9R/j9SeM4Z0EmTSJ5SGXGvPS
X-Gm-Gg: AfdE7clug36oFD5UB57wYPC2V7dusZtFn3dJtUxMx9kWeZNpyU/l5/N128W2AQq5F1p
	xSEbPoHZtnJLyhr0k//SnD6osJLl4muv3NfhoWpn6yOy89z0vWLGiWNb17xAAiFEEaNkzdGejOU
	mtqi2AGq3otGJA/VscahHFxOgDdLbYn47YZtcaZwZtQX5HSK6ImDltkKVjobK9gRYqcQ78ceBKR
	3v6fQZ6StNx84Cy9QEswLc0w/z9xEOy1f+Eqr+rl9VJLEsol8V5qcIONXTSP/29RX7tNChOZkSM
	NEeift8MuzKx67TRXKEvJG6OT/iAot3QeifvsE33I4gG2iBvHzGujBYqvDHmd1rb2vXpLmSvsZy
	PA02Aft0T8aRtmsDTyevfs62ZijHMQz+I1s/QYJnmO7BdOAZz0Apvgw==
X-Received: by 2002:a05:6a21:9f17:b0:3c0:9c19:65c4 with SMTP id adf61e73a8af0-3c110aaff03mr16582534637.76.1784031705647;
        Tue, 14 Jul 2026 05:21:45 -0700 (PDT)
X-Received: by 2002:a05:6a21:9f17:b0:3c0:9c19:65c4 with SMTP id adf61e73a8af0-3c110aaff03mr16582483637.76.1784031705057;
        Tue, 14 Jul 2026 05:21:45 -0700 (PDT)
Received: from QCOM-aGQu4IUr3Y (i-global052.qualcomm.com. [199.106.103.52])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-311747f596asm80463710eec.2.2026.07.14.05.21.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Jul 2026 05:21:44 -0700 (PDT)
Date: Tue, 14 Jul 2026 20:21:39 +0800
From: Shawn Guo <shengchao.guo@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>
Cc: Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Deepti Jaggi <deepti.jaggi@oss.qualcomm.com>,
        devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Subject: Re: [PATCH v5 7/7] arm64: dts: qcom: Add device tree for IQ10 RRD
 board
Message-ID: <alYp00gq1akcx9SK@QCOM-aGQu4IUr3Y>
References: <20260709132013.4096850-1-shengchao.guo@oss.qualcomm.com>
 <20260709132013.4096850-8-shengchao.guo@oss.qualcomm.com>
 <alOuTNcCjaEkHn0e@baldur>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <alOuTNcCjaEkHn0e@baldur>
X-Proofpoint-GUID: vCJrdmFYCZ6KlQCdY7auUE_andZQcHSS
X-Proofpoint-ORIG-GUID: vCJrdmFYCZ6KlQCdY7auUE_andZQcHSS
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzE0MDEyOCBTYWx0ZWRfX54oDxmPb4VhB
 79HTD2PN/+Ao5LGw8sxeV14iIeXj76ijSTCTguVeH8G3t5EnWZl+8M5PEQ/JxreqOUYtJBGWGFd
 qJQ+qGF3P8TQKjgcWlmTMS1U6Nbbl8o=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzE0MDEyOCBTYWx0ZWRfX9Hn5GKQw05vE
 +Q9caAYkDMy0Xi6LoNl8bkU7dZRqRaUOy9zodydQX1DeDw4X9QpMmfms5fuyCRpSzuJKj9LVa9z
 9bPhBJ/HhfHfPFxLqjijOMxR7SVRmm+f+tNrsQ6VNofp/9VDW567c6V3ZFlkGj1njqPT6/L7hRq
 ebP6NY6byO6Tsgr++C18jcdu9//LRMNeBkpiWh6zJBa3LfdiL89gup6UQUcgQdkyhvqsWLTnKn5
 0yUkMIiwDGdAscs89TqUDOB9n1RfbcLvK8QX9D9iW5Xs4ELuELvveuLGRAA171gKnNwKD1Yd1bX
 3kzNIdALZ9oSvqSFaq4SHBHrqy9z1Dapg2FGIY6I+pc4toiLg0nL1Xtvb3DyqyY6vIvyBTkMEn+
 BdC218VptYnEyhBxTj/4w/M+ZRwezv4BRbrz8XDF9WnE5hcglKY+5/wv0byrikrNQDKvnwUUhb8
 dY9qfyudQdlcO1YeWow==
X-Authority-Analysis: v=2.4 cv=P84KQCAu c=1 sm=1 tr=0 ts=6a5629da cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=b9+bayejhc3NMeqCNyeLQQ==:17
 a=kj9zAlcOel0A:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=EUspDBNiAAAA:8 a=7Am0Wwq9neIlElUaZukA:9 a=CjuIK1q_8ugA:10
 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-14_03,2026-07-10_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 priorityscore=1501 impostorscore=0 malwarescore=0
 lowpriorityscore=0 phishscore=0 spamscore=0 bulkscore=0 suspectscore=0
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607140128

On Sun, Jul 12, 2026 at 10:15:52AM -0500, Bjorn Andersson wrote:
> On Thu, Jul 09, 2026 at 09:20:13PM +0800, Shawn Guo wrote:
> > Add initial device tree for the Qualcomm IQ10 RRD board, which is built
> 
> I think this is the first time we see this new TLA, please provide its
> expansion as well.

Sure, will do.

> > on Nord Embedded variant. Enable the debug UART, UFS storage, PMICs,
> > I2C and SPI.
> > 
> > Co-developed-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
> > Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
> > Signed-off-by: Shawn Guo <shengchao.guo@oss.qualcomm.com>
> > ---
> >  arch/arm64/boot/dts/qcom/Makefile     |   1 +
> >  arch/arm64/boot/dts/qcom/iq10-rrd.dts | 588 ++++++++++++++++++++++++++
> 
> I want all Nord-based boards prefixed with "nord-". I shouldn't have to
> open the file and look at the includes to figure out which family it
> relates to.

Ok, will do renames:

  sa8797p-ride.dts -> nord-ride.dts
  iq10-rrd.dts -> nord-rrd.dts

> >  2 files changed, 589 insertions(+)
> >  create mode 100644 arch/arm64/boot/dts/qcom/iq10-rrd.dts
> > 
> > diff --git a/arch/arm64/boot/dts/qcom/Makefile b/arch/arm64/boot/dts/qcom/Makefile
> > index 8e6ef4116146..75d29d602e77 100644
> > --- a/arch/arm64/boot/dts/qcom/Makefile
> > +++ b/arch/arm64/boot/dts/qcom/Makefile
> > @@ -40,6 +40,7 @@ dtb-$(CONFIG_ARCH_QCOM)	+= ipq9574-rdp449.dtb
> >  dtb-$(CONFIG_ARCH_QCOM)	+= ipq9574-rdp453.dtb
> >  dtb-$(CONFIG_ARCH_QCOM)	+= ipq9574-rdp454.dtb
> >  dtb-$(CONFIG_ARCH_QCOM)	+= ipq9650-rdp488.dtb
> > +dtb-$(CONFIG_ARCH_QCOM)	+= iq10-rrd.dtb
> >  dtb-$(CONFIG_ARCH_QCOM)	+= kaanapali-mtp.dtb
> >  dtb-$(CONFIG_ARCH_QCOM)	+= kaanapali-qrd.dtb
> >  dtb-$(CONFIG_ARCH_QCOM)	+= lemans-evk.dtb
> > diff --git a/arch/arm64/boot/dts/qcom/iq10-rrd.dts b/arch/arm64/boot/dts/qcom/iq10-rrd.dts
> > new file mode 100644
> > index 000000000000..39d254b49c14
> > --- /dev/null
> > +++ b/arch/arm64/boot/dts/qcom/iq10-rrd.dts
> > @@ -0,0 +1,588 @@
> > +// SPDX-License-Identifier: BSD-3-Clause
> > +/*
> > + * Copyright (c) 2024-2025, Qualcomm Innovation Center, Inc. All rights reserved.
> 
> What?!

Sorry, will fix.

Shawn
