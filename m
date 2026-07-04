Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 51D561A5B90
	for <devicetree@vger.kernel.org>; Sat,  4 Jul 2026 03:03:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783134218; cv=none; b=InWfzV1/S73qSxgLYRNWO+U1oF7gmBXrmR3FYZ67v70bj+qAlIFtLv7G8uL7f8MZQn9aMrbCq16zsasaNbFIFyYmnGuri8YS7XXG0JIvl81SuXaPw086H+V9g/oVEOKcWTzJW9XGgdVeoTiJzyEvRdrkJUkn+a2+BJe0/iM+vN4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783134218; c=relaxed/simple;
	bh=iEHv7UMoiSJV97OklKpGEpVkcXtx1gJB1xBAgSSkTEc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=AK5eGsn4IhjXycTH31gUgHsecrvzrHMIQbaQI1nHbyVjkhrCaoYqHHnUth00CcCnKEV0Loy7H0NrtCZVAwbn17PDY9Qkffdkd1vhfuU5fbCaKSnFrQxQpuj5OTotjrnaMl1uUC+vz9iYnqI3AJkbnah2hmpbbz10JVbMhOw5Yf4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Vr7fzxEZ; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=EDCFye7c; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Vr7fzxEZ";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="EDCFye7c"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 663KPSNN1005465
	for <devicetree@vger.kernel.org>; Sat, 4 Jul 2026 03:03:36 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=1tjnRdUqE/YJn3Zw6TREOKX5
	v3gb3EVZKs+4fo/HdIw=; b=Vr7fzxEZ+sXW6VwfMnDSWPzWMFqZDMdtbOaQR7RC
	d0naoaZ+rPk//G+aXK2iCEt8H61B6x+CoFY41Em0SrbAqlvDqwKCgXj5MEDKTtLW
	b2IFeeImGh4I50tmrBaVet5U6qE+aQFYLOgk+63f9dLUZP7PcisTl2quyvdgRp0H
	o03A0pI+1Tze8R6whsEMxdoX+QsIG6J54AFw6TYzl1PcBZQgxkHJ2dmoYKyQ11yh
	ZBtIWx/h3Rde56l/Ab+MSPpFZR/vwUfszF1iR4sH2h0r6y7pA4dEgIspX6I+X1YU
	OVQTGSEu5bCb+f0oQXA3u75ADFG/XtRqUiI9DqBWvPG08w==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f60eydc16-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Sat, 04 Jul 2026 03:03:36 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-384048e7e14so120476a91.1
        for <devicetree@vger.kernel.org>; Fri, 03 Jul 2026 20:03:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783134215; x=1783739015; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=1tjnRdUqE/YJn3Zw6TREOKX5v3gb3EVZKs+4fo/HdIw=;
        b=EDCFye7cqMdLJDzionzamAZO9GyDlJ9m4VD5/YNOWq3WlI1u79412urd853jCy4HYk
         dmRdlo+Fp0YBC+7bsy81FehWyRSDzTZlV5JKdJ5zCaZl/27fEl5vwnStKo0RM71BlecM
         pqaN8IvoEUtCSgIDCi7Qpolx+TRYAP0OvvKk76gWGsUFtZI8jxFgU/fHSYB5bN3fmyt3
         Pe5sE/U1IzxBt/P0dWRLdd0gRME0nDU+8bI9uvdcqJhdwgMTXzvPVF/9AvBBv1X1PKNi
         TzcjSSfKbKjjX0XKg0O9I97KAP6XVnsQX443t5INwvfGPSZorZ65et/Vk+8uVSRuqp5s
         X7LQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783134215; x=1783739015;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=1tjnRdUqE/YJn3Zw6TREOKX5v3gb3EVZKs+4fo/HdIw=;
        b=ZchAYhnGpts8G7FWYD78P25nZHEyTrx1CP9XEdj9231TJ9fK9nDf6CUtJT8ZN5bWlx
         Up1yNRpVchbu0HRhaViDt+h4rZq1bN0cJlp++zCy5Ofm15xPabfNjIKNuIzocANZZwCO
         rPriBScndbm/xxthaeQ8dkeQ7ojTj5W0fvTnSGXic3thwIHor687oGTvN+5JS5fCuwDu
         pNKkylv7dLCi9GYvmDgU97Uw2nm4p7CbfZWOB49gotJaFySdgaBNhE1D2JO5KWRYujsm
         m1L5f83URgaZPlr3Cm6e2VQESePm1lfYoWjPLcHUD6mvDWzajOFxnPKJh1L8Kjmv3uqC
         o+0A==
X-Forwarded-Encrypted: i=1; AHgh+RoJzKxcxhU0V9pbEJj30lfw5EgGUa1/5JVr9xPw9CkSCjumHDFfOJ0OkpFs5pF4myV0E+PmJUd+RZ85@vger.kernel.org
X-Gm-Message-State: AOJu0YyCtd1o4TG9wLDZaYfFokdBnKhxDJ+wHBZxynJjBzdsgRL6yGwe
	5wejaYr2WL+ycPw5K1EC3YlpuOoE6y33aAHZQgY+8RaQKcejrfoop5A66LA4Pro3lfMLP7aitSd
	Z4WNF3Qe/GpLHpi/gy6hPkuaXw/DCFPyS+T3TepM7wfS+Is1X2PKK00z4LxIZo0sB
X-Gm-Gg: AfdE7cnEzVYZstUaM5nT/qPbpdRjrYF46OlCtJ0OEIBAF5DUTfG0jkXCd1X6vTA7vR8
	5jRP8NIUBtcJs553fdv0zwy5hCoN7ayeZyvVuSaOvwX9LtNITMAreZwFBNZ9kEl7/v62H88Kx71
	sNCrCsa01LRqVeLCwHRCklnTjApfv9Le6U8v1iyvL/T6hyuSkccKpWXgclj2/6hEPYBEwTyAJtQ
	kqmdqMO2UjjEZzFT/SLD+iAIWFyk3UsAvCUbm0T9x32Lt+CPQZBAd7Wk4UiS3X7uSflOHz20uak
	t99lHqJ633sDUFRC4MavgvUcjIxQPSUmRjAy/UTVY52MSFMaJR4PSTTJsHcMmIJVcJRAD/ys0xD
	KtRNL6cLqjmhsL4NwiQ68Zy6w/aGcCyUvOY8gGZDxUJzFWf7nv0JCGg==
X-Received: by 2002:a17:90b:17c1:b0:369:a359:b181 with SMTP id 98e67ed59e1d1-3829f5ebebdmr1827422a91.23.1783134215146;
        Fri, 03 Jul 2026 20:03:35 -0700 (PDT)
X-Received: by 2002:a17:90b:17c1:b0:369:a359:b181 with SMTP id 98e67ed59e1d1-3829f5ebebdmr1827387a91.23.1783134214689;
        Fri, 03 Jul 2026 20:03:34 -0700 (PDT)
Received: from QCOM-aGQu4IUr3Y (i-global052.qualcomm.com. [199.106.103.52])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-30f3a9341e0sm10181137eec.12.2026.07.03.20.03.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 Jul 2026 20:03:34 -0700 (PDT)
Date: Sat, 4 Jul 2026 11:03:28 +0800
From: Shawn Guo <shengchao.guo@oss.qualcomm.com>
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
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
Subject: Re: [PATCH v3 RESEND 5/5] arm64: dts: qcom: Add device tree for
 SA8797P Ride board
Message-ID: <akh4AEIyhHIQDsOJ@QCOM-aGQu4IUr3Y>
References: <20260526051300.1669201-1-shengchao.guo@oss.qualcomm.com>
 <20260526051300.1669201-6-shengchao.guo@oss.qualcomm.com>
 <65995138-0d0b-4b8f-ac13-8daeb82d1767@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <65995138-0d0b-4b8f-ac13-8daeb82d1767@oss.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA0MDAyNiBTYWx0ZWRfX1hy14SGvyFZH
 gCPa4dAZhO12nzDjPFy36RjmIZBI/RpBY3w3X3rm2zZr1ua1oPLS+/JVRl7iHwVrglpoyqqKD61
 d56iJw/H7LR8ucJWABeImkrMipCWEWeTUxw+Ep4GX30LH1acff+zcM2agcNQs/saYaf4R4C45r5
 xo2rTEp3mNTN2k+AyYP91Bc9rNFoSr15b7n60ZF1k4skIt6+tG95EZwI9QkKG89MgDx4Q9ElMRz
 09cvN7izGucrqWFRDPJaxxdHT9CWXKQOMoPlE7BNtUc53DKEmIN0vUDIWfNmevowNseGOPOSdZw
 zQQHeaNBZ1k2K36wYTYWhDByNRKQ4RCiY8Yh73XVGOGL9iwcPxtVLgNLF/FlkKxc1XvW79pOr9a
 V36sNvb/vD5zhn7YHhPgsYqrERcYLFoCqklfnzgJdrzg62MAkLSycdpybpsDhOVUAM41py36a2Y
 tJqrpEDVJ6XbJpRtRtQ==
X-Proofpoint-GUID: EGHYakw_qUQTxYflANQVqmu-jCJSyO4c
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA0MDAyNiBTYWx0ZWRfX7mojXTbODpve
 TQY8bcJE9ziVhN9UOGdifrxw+TcM+XfCGDBJVSrw9sZi/KIxVjGLllUB6kGXJi/LL8s7PT4rHKM
 CzkklXxHpkXCH6ruemzQpEhkjJ5IFo4=
X-Authority-Analysis: v=2.4 cv=SPRykuvH c=1 sm=1 tr=0 ts=6a487808 cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=b9+bayejhc3NMeqCNyeLQQ==:17
 a=kj9zAlcOel0A:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=EUspDBNiAAAA:8 a=fVJQK2QLqq40QL6N-J4A:9 a=CjuIK1q_8ugA:10
 a=rl5im9kqc5Lf4LNbBjHf:22
X-Proofpoint-ORIG-GUID: EGHYakw_qUQTxYflANQVqmu-jCJSyO4c
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-07-03_04,2026-07-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 adultscore=0 malwarescore=0 bulkscore=0 priorityscore=1501
 lowpriorityscore=0 phishscore=0 spamscore=0 suspectscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607040026

On Tue, Jun 16, 2026 at 01:02:06PM +0200, Konrad Dybcio wrote:
> On 5/26/26 7:13 AM, Shawn Guo wrote:
> > From: Deepti Jaggi <deepti.jaggi@oss.qualcomm.com>
> > 
> > Add initial device tree for the Qualcomm SA8797P Ride reference board.
> > 
> >  - Configure UART15 as the primary console and UART4 as the secondary
> >    serial port
> >  - Enable UFS storage support
> >  - Define thermal zones for PMIC dies, UFS, and two SDRAM sensors,
> >    all sourced from SCMI sensor protocol on channel 23
> > 
> > Signed-off-by: Deepti Jaggi <deepti.jaggi@oss.qualcomm.com>
> > Signed-off-by: Shawn Guo <shengchao.guo@oss.qualcomm.com>
> > ---
> 
> [...]
> 
> > +&thermal_zones {
> > +	pm_kobra_thermal: pm-a-die-thermal {
> > +		polling-delay-passive = <100>;
> > +		polling-delay = <0>;
> 
> 0 is the default value, you can drop these lines

Will do.

> 
> [...]
> 
> > +	pm_kai_0_thermal: pm-e-die-thermal {
> 
> s/pm/pmic

Good suggestion!

> 
> > +		polling-delay-passive = <100>;
> > +		polling-delay = <0>;
> > +		thermal-sensors = <&scmi23_sensor 4>;
> > +
> > +		trips {
> > +			trip0 {
> > +				temperature = <115000>;
> > +				hysteresis = <5000>;
> > +				type = "passive";
> > +			};
> > +
> > +			trip1 {
> > +				temperature = <135000>;
> > +				hysteresis = <5000>;
> > +				type = "passive";
> > +			};
> 
> Do we need two passive trip points?

The trips are indeed problematic. After consulting internally, we will
make the following changes.

- Drop 135 C trip point from PMIC thermal zones as hardware will shutdown
  at 125 C
- Have trip0 at 105 C as passive and trip1 at 115 C as critical for UFS
  and SDRAM thermal zones

Shawn
