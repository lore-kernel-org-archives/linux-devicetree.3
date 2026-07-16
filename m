Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4DC723FF1A1
	for <devicetree@vger.kernel.org>; Thu, 16 Jul 2026 10:16:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784197014; cv=none; b=QU42CeUGYzBxLwke+a1INtwrWoWSK/9iQpOUK5Lc2iIqOSZ2kBGHzV3qDYMrAvq8lVeP5yxWcqdklo72wsmPoWomH1rV5pDl86JuPbxixRGH073GDoDX1Q6iMd3gqcimS4iUVJY/MaRiPyxouMhY+TLmI+v3b19BEezBEQ/yBpA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784197014; c=relaxed/simple;
	bh=3A31pW6bgnd8iWZx+aUlogW8Ewydw8+v1GYamGU5wDs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=qosIVqoUcdpwnBKOJtAPsaY9PEBy+9BGnFu6WgSj2esom8bvPInq2llbSQaIOsea9luHcPAYA2GRNpo6XQwmjrtBeKWo82TtZmErg4+iWo9EZnccOUc6GW9fjchr9Wg2z2etqFhTc71qI8UgjFjICnDKH+UmUtZDcn9s1PnjpX4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Yb3HqGY0; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=eA+6NCkV; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Yb3HqGY0";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="eA+6NCkV"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66G9rHf42259598
	for <devicetree@vger.kernel.org>; Thu, 16 Jul 2026 10:16:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=eBmroGkQWExDliJQ5nQJ9y86
	smduiz8ck7tjZ6oZT1Q=; b=Yb3HqGY0d/LZgRB88JP/n02szE7OJva/AbyRBlyx
	slJLpwhrZt1lBFbIeHSjtrcFoey4uBISqkUf5F1VCTVCDiNmAjkGkTPI0zB92lj4
	B0MTZXN9zKjB45knjlHp2964pjndR7RpFITe8cfzNxf6vuj3dVRdix7ljFnyv/KM
	CLGk5ac07vC3gRWglholHfHCCR+cCJIP5/k9a9CoUynPUAON9MH25WnnYpv8M6C6
	d5/ZOiwx1dGaW+UdLVQauU1p4IPF13MhF/SzCT6E2RwPVc8bfoDmjYfs0JQOClmi
	FemQSHkIXQqRqoJkVzbVwCjvlssii0Bkcjuy35LX0j1wnA==
Received: from mail-pg1-f198.google.com (mail-pg1-f198.google.com [209.85.215.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fevkv0781-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Thu, 16 Jul 2026 10:16:50 +0000 (GMT)
Received: by mail-pg1-f198.google.com with SMTP id 41be03b00d2f7-ca7c1e22995so8967011a12.3
        for <devicetree@vger.kernel.org>; Thu, 16 Jul 2026 03:16:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784197010; x=1784801810; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=eBmroGkQWExDliJQ5nQJ9y86smduiz8ck7tjZ6oZT1Q=;
        b=eA+6NCkVCql8cCCuV3TYXU6MZucjgDpRtTQrV7HzoGZW/nj4iZumClppYluvnnTlCE
         EmZCJ4VljVQ+acXOxpGr6+bsCOXbPtkOEEMC9QIAT3QA1wT+wbbSm0H/mW9X1TTI5+eA
         kv0Tf8dKBAYC5JzooIc6Le15bwqsdxQSNXGNTBXBNzxH9E204mPEts9nqYFFozziw4+A
         h64UMoyAbrcCi02HeOBIOWTdEOhUXK4TeMWlel1zYsh70036ciLsgxlqqCCHIWJTfl/p
         r2tpajdC3KhoXYN1cy5HuK5dROwTc40r90baHjK4pNLteVan0zBxXqgv6m4BkY+k1EDk
         CCZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784197010; x=1784801810;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=eBmroGkQWExDliJQ5nQJ9y86smduiz8ck7tjZ6oZT1Q=;
        b=s1TFtOLIrrcKDBSynxD+uKGIN0tUgDKDuldwJZudANsNTcBxUevKSkzohAbzi0Iz04
         FhBoZheCTxESz0QijgR5sVNPsUB0aeuX+c2XL2E750q82SV5bBkflHYTDC4DMmQ5omGu
         1qrhqGJKQHZkp1jDrJbDyeNXIf9oHSWXyFZJU+cBWAAZvVkYlf0mi6dJduesRueSb9N0
         4v443Yzl+CKAvgaEX6hyKVP2QKgrfadipSTsae/4rhE0oTzLq9jRsfyxL7/XGRHb73IN
         nejStUA4E4mDMBRIkgfMItdgmAhGcWsT15QB/KhB8h8uKr8p7SkNYz5Opkj4qulHQA7U
         SQWA==
X-Forwarded-Encrypted: i=1; AHgh+Rqou2/lVrsNunqBu1Fjz3pHK3cpV1YOI6DVAEbCc6J2CMJExdSllpCEvAOL1B10pOSKMyYf/udzqvAw@vger.kernel.org
X-Gm-Message-State: AOJu0YxQ8LquewLfYuh22ku+4XWbNUYZUqYowzaHAbZWjtpARoInUOPY
	vuh2yj3juFxPYgnvTrJCzltHZcJ34LM6DB9XaemnZYHxQcMdeo3cwwoPYp7o/0SOQMi1hPH2pv4
	sBv0ogyon5g7BVevfZ5oOXqi7Y0A6UayzisNajcI4HnS8FXg2pHZrXIiOlV/3Hum6
X-Gm-Gg: AfdE7ck9HAS5HIlXS0h3/VmBJUgQhzU0qeKMDKeSMPwjqbzU+c8yvBb18MpT8M//sZ+
	m0+5Szptxo2JmO+e5xTf2i5pnnhYBzaIUQSeVuJU7MUcp92g0NZ1NG9qTvMxKTr4+MRUHBnqDkP
	Sq97Wq0OVYZ131T44MO5eyV6vDtYmu5JmyiOYWAX/ESmCqRN2cgsqRaJvQjlu27xbfe5amja27h
	xCX5RR0pMIklUKGxheyOD2kKQZ4enCp5mskcobB9KQ/TORLslqxG0Rm2CsHyhgtUQA1an5Ippzj
	DKpI6vecNRYOa7hDhWhM6TPqsLXNmYdod72orVNQbK2+1qzw5Z/N7PqPYm4gw6FzLmYlNy/M/YT
	h3Qz15WcR6pJLtPlagDLdhzp0s7XbUkxrJ7VS51YMnuM=
X-Received: by 2002:a05:6a20:9183:b0:3b3:bf7f:efeb with SMTP id adf61e73a8af0-3c36c3603d7mr7738792637.45.1784197009750;
        Thu, 16 Jul 2026 03:16:49 -0700 (PDT)
X-Received: by 2002:a05:6a20:9183:b0:3b3:bf7f:efeb with SMTP id adf61e73a8af0-3c36c3603d7mr7738759637.45.1784197009293;
        Thu, 16 Jul 2026 03:16:49 -0700 (PDT)
Received: from QCOM-aGQu4IUr3Y (i-global052.qualcomm.com. [199.106.103.52])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3140e6a714csm10040857eec.14.2026.07.16.03.16.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 16 Jul 2026 03:16:48 -0700 (PDT)
Date: Thu, 16 Jul 2026 18:16:43 +0800
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
Subject: Re: [PATCH v5 5/7] arm64: dts: qcom: Add device tree for Nord
 Embedded variant
Message-ID: <alivi4AHGHrKxkGw@QCOM-aGQu4IUr3Y>
References: <20260709132013.4096850-1-shengchao.guo@oss.qualcomm.com>
 <20260709132013.4096850-6-shengchao.guo@oss.qualcomm.com>
 <alOwD1G9plyy3BO4@baldur>
 <alYoXKxcXFd6vSNe@QCOM-aGQu4IUr3Y>
 <alfmcB3T4Kv3dffx@baldur>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <alfmcB3T4Kv3dffx@baldur>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzE2MDEwNSBTYWx0ZWRfX49L87viMmcl3
 tYMCZq7Q0kpnryMQVUMGs5mvygSPkdQh5ximmbw4XlBbRi8M/mxMCX7g5Vo/iRmv9IKo3qNXO1B
 7Z26ZXhMgM/fOuhLzED47omR6LA4V5ge279dnE6y0otpUCxM0mLYkDSch0SCfNb0f9+KOdjzkbE
 irAivh0LJBqJ5CwE55mYr6Ew5WeHYR+HZT4l9K/p3pxNZRp+TaFjGXndRzNqVeqLSmeABtsfIYa
 SVCebCbLAzCIyT+BPL76VGGVg8XioSpyM7qt5Tqa36ZEaOkLW37NotYbB390WQJHhzu2ABIGaDx
 dDLKDvn2cGIBGuCqskjMe1wON6iqmFJ/lpad+KOuX3a4H0j/A3q+/d8mBgIjIG6DNof/barDJYh
 Z1gWlUyXFlAVbZ04rZvB8LU8riKgzV1GAqZMVPonbljcYUZ6KKR/ykuic5V2Esiyc8vZFSpV2lT
 cWcBIPk6u6Yx5OJROUg==
X-Authority-Analysis: v=2.4 cv=WrEb99fv c=1 sm=1 tr=0 ts=6a58af92 cx=c_pps
 a=Qgeoaf8Lrialg5Z894R3/Q==:117 a=b9+bayejhc3NMeqCNyeLQQ==:17
 a=kj9zAlcOel0A:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=3R0XHGMZ4LtOtzR3qNoA:9 a=CjuIK1q_8ugA:10
 a=x9snwWr2DeNwDh03kgHS:22
X-Proofpoint-GUID: _Mfnxcdx40w6nRM0X4IBJxLa0eA5fTSJ
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzE2MDEwNSBTYWx0ZWRfXxNcjatswVLbq
 aAKYw8g0QArjXfcp3HRF+bPbr5fYewXMELVlEhE9avdLqxXw40BrshF6jOCZLa/2RTLJIIPCM6M
 59eLdSG5T6zWuBd0ZA4kQr8yYahtUNs=
X-Proofpoint-ORIG-GUID: _Mfnxcdx40w6nRM0X4IBJxLa0eA5fTSJ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-16_04,2026-07-15_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 phishscore=0 clxscore=1015 spamscore=0 priorityscore=1501
 adultscore=0 malwarescore=0 bulkscore=0 lowpriorityscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607160105

On Wed, Jul 15, 2026 at 03:03:57PM -0500, Bjorn Andersson wrote:
> On Tue, Jul 14, 2026 at 08:15:24PM +0800, Shawn Guo wrote:
> > On Sun, Jul 12, 2026 at 10:39:44AM -0500, Bjorn Andersson wrote:
> > > On Thu, Jul 09, 2026 at 09:20:11PM +0800, Shawn Guo wrote:
> > > > Unlike the GearVM variant, Nord Embedded variant has platform resources
> > > > (clocks, regulators, powerdomains, pins, etc.) directly controlled by
> > > > Linux.
[...]
> > > > +&ufs_mem_hc {
> > > > +	reg = <0x0 0x01d44000 0x0 0x3000>,
> > > > +	      <0x0 0x01d60000 0x0 0x15000>;
> > > > +	reg-names = "std",
> > > > +		    "mcq";
> > > 
> > > All other changes in this patch directly relates to resource providers,
> > > why does the UFS controller's mmio ranges change?
> > 
> > We can have them in nord.dtsi just like all other device nodes, but we
> > will need to delete reg-names from nord-gearvm.dtsi, since
> > qcom,sa8255p-ufshc binding doesn't require reg-names.
> > 
> > @@ -2907,5 +2907,6 @@ &ufs_mem_hc {
> >         compatible = "qcom,sa8797p-ufshc",
> >                      "qcom,sa8255p-ufshc";
> >         reg = <0x0 0x01d44000 0x0 0x3000>;
> > +       /delete-property/ reg-names;
> >         power-domains = <&scmi3_pd 0>;
> >  };
> > 
> > I will do this with v6, unless you hate delete-property.
> > 
> 
> Now I see the answer is was actually looking for: the SCMI-based variant
> doesn't list the mcq region. Why is that?

Good question! It seems to be a binding problem to me. I just proposed
a fix [1] and will move reg/reg-names into nord.dtsi to be shared by both
variants. It will be neat. But that also means we will have one more
dependency for v6 of the series, sadly.

Shawn

[1] https://lore.kernel.org/all/20260716083313.2367249-1-shengchao.guo@oss.qualcomm.com/
