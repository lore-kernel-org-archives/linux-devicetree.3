Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 02B32175A64
	for <devicetree@vger.kernel.org>; Sat,  4 Jul 2026 01:06:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783127203; cv=none; b=NGD5Ybd0VTWafp9ueRABQz9hu7kSVNmK9Jy0F/8DRCU5s0Qb67m85bONrMSc15kcvRM1qndLZLa/c5tmMigqJ/6yh3FMOBuGaSc91ZVovaKABswWn8RpJSCC3pX+2R55puBW5YE8ccQ5oAMPLDgcuxXMJZyGaQ3pzkZXAV/X7zA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783127203; c=relaxed/simple;
	bh=CgGGfOnGeJCcosTIEzTLAsX6Rit25oX4dcsnE2bSpDw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Hs/5MiXwuODjPyxOcXdlzIgxSiFCgHCoYddeNLh93ibamFS5/sxNJ/8VdZNfdLK2hxIcxPA21GeyboNHWU/b8i3A0QRvFUteq3lU0Dfv5U251kleZXzG3LU/Dal5n6CZ2WvLaKmQtNIT+1rvVxoJZwfriqhwgxIaLaZcwiDm0IU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=cUwE7JlM; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=KklYj1r8; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="cUwE7JlM";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="KklYj1r8"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 663KPnVW888939
	for <devicetree@vger.kernel.org>; Sat, 4 Jul 2026 01:06:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=M0/26JKvXxrfZ7B8av+gXdcx
	ng+phSMbjoiHrD0UAu8=; b=cUwE7JlMJS/uBUypStBzSy4UM/6dSEsVgKA2uppZ
	P/aVrpMl4NdUNHdzDAFLwG5iz+a/bQgUJmcKnoH8jOAn7WP3Nlk5uV85M7IK5qCV
	kwwngnIYBof4cJQMzspEzNiLSx4x48KlndoqchyyUSlObFa/1Ho/MJ8h9eftYM6H
	FPx2yNtmNvGFecjM7XUC9ygp9zFxGrSbg80s7wpoRK/7OEtRiEvVhXbEmp9RqE3v
	rKWR+oUMf6TqWiKCj9sZhSaB55xHE7bWsNTNDkb8n6BjDtx8knRmaYWjaJ7h/R4m
	X2caUZ4NxBxIDuFni7fH05rjGCopq/nqBb00AX98D8zErA==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f682bucsw-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Sat, 04 Jul 2026 01:06:41 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2c987913b08so12156185ad.2
        for <devicetree@vger.kernel.org>; Fri, 03 Jul 2026 18:06:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783127200; x=1783732000; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=M0/26JKvXxrfZ7B8av+gXdcxng+phSMbjoiHrD0UAu8=;
        b=KklYj1r8Td3gTMkKpH2092X7egU6w6tTi+nXUNIzQFJ5eC0+/lCMBn2kbdrJDTCWuF
         NqY8NNfmvGq+RFwTf7tr7Rx9cmUL9/l1H0E/AqRgIoyrGXz8n1qWfFYEwVl7ke3Haewe
         1v5DFbeSzDYly/3H/7HHeKCRafRRZS3Gd+foKJgRV08dRO8V+357FAEI/RoOn+FWVCbj
         X17zjG53D3IFXrXtZFUTFBVnWFQYxPz+PrsqrscCaFAnirMuoF6oDB/hENt6RT7g8nl4
         69WmowAl0kxmsUTvjceB70tOq+q2r0Cy7MvqyB2lVoBfyqFQFf8lYZMFaFyVA671fxeF
         VbsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783127200; x=1783732000;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=M0/26JKvXxrfZ7B8av+gXdcxng+phSMbjoiHrD0UAu8=;
        b=BY/aMLboVsXh/+e/AqwWRk63LMfj3E9rWfffpUJiOvQoYMrSCO/cgGMBCbunTTHOBq
         dYkLwwNlSdHaP/ak0W/5g7Ae+rlH3dUVgMCc3zheN2JhpL+T1Rbghh70vDiCE89v7oPP
         4aTPxARk5KvQW5VvnTYmNQO66b8o5WUKNNc6b2J8rSU4sQUuC6UX6Rz4wfCmEuhaiEhy
         QOq0m07bKNNoK9DmxGQcK4Ktj161rjdRT98ur4ZiyvBj2tytBIGZKN9dtIYw7IWjFzQk
         HOji6ItcXu3XD4VuOgYrNUgos/13XRla8lGpaZfM5vgJhdLaVrk4FtmLZtAK525FuCdf
         ou8g==
X-Forwarded-Encrypted: i=1; AHgh+RpjXEvjSOWFEtH8r9BJXDOv4DRg2/sAbwcPLOl/WGAySRjnVCE6ATRYRWXBLh/Gote1R17XO6vOU42L@vger.kernel.org
X-Gm-Message-State: AOJu0Ywtl1QwGbswh4W/kJMPrD2jdv9+Nm03il19fx5dM26wRb47Q4BO
	yO3YWFJT0H5jYUEa7PQ/7S6Rev/HRwAfobXu3NTnQkA+fQ5OjuQgUN0C0fJiuRA+ONkZIc3rEYx
	wqIpKQRqG6V4qobNp27NJzKAEeG9KZYF0mpSNT8VRDnUG4x6A8kQY45aOt2Y7b3G3
X-Gm-Gg: AfdE7ckNE669YTjwFXQ3bo0W6Qm7hUz4D6UiABNcuKg4D1h7SIskmBPXVGaYe7pCGw2
	/Elrx1R04M66i7/rH/HIWx/Pb23sODbFnTDbDWg/Vbwk59b4HHxNeh4rXKPJoCpzAjIOzoh81pJ
	/KB7GoNISfYouNbGD7HNzT0KuLjPo0T2Hn9AqY+FmOzL0l6Ai5Cv4nzoakFYKwgNWhvtVKQqp/f
	WKhOdht/Zkx01/RIxRCqJ4FMSnr32kJXlEmvAt1DcBAJgv/mYgAsj9z7BnogLJ7g6UgqFCd0sva
	miaFhXPUWhrM8PXsxsSOjEyCtJKe2gv6WC2t1WeGIFolL6CoucTvpXs0K7493vzr2toKVbaQSGS
	0K7SyEDdFsFOr0ReQHoEhNm/eYSJOO1TvzmtUNvFuXnUCJgqIEaX5xQ==
X-Received: by 2002:a17:903:3c4e:b0:2ca:e3f:6a4a with SMTP id d9443c01a7336-2cbb9e33dd7mr13482405ad.21.1783127200531;
        Fri, 03 Jul 2026 18:06:40 -0700 (PDT)
X-Received: by 2002:a17:903:3c4e:b0:2ca:e3f:6a4a with SMTP id d9443c01a7336-2cbb9e33dd7mr13481975ad.21.1783127200052;
        Fri, 03 Jul 2026 18:06:40 -0700 (PDT)
Received: from QCOM-aGQu4IUr3Y (i-global052.qualcomm.com. [199.106.103.52])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-13b3c870effsm30631987c88.12.2026.07.03.18.06.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 Jul 2026 18:06:39 -0700 (PDT)
Date: Sat, 4 Jul 2026 09:06:33 +0800
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
Subject: Re: [PATCH v3 RESEND 2/5] arm64: dts: qcom: Add device tree for Nord
 SoC series
Message-ID: <akhcmRTFGri9d28X@QCOM-aGQu4IUr3Y>
References: <20260526051300.1669201-1-shengchao.guo@oss.qualcomm.com>
 <20260526051300.1669201-3-shengchao.guo@oss.qualcomm.com>
 <1ca9b0e9-3eaf-4d1b-bc63-410f4ec7b14e@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1ca9b0e9-3eaf-4d1b-bc63-410f4ec7b14e@oss.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA0MDAwNyBTYWx0ZWRfX5XLXvyr608ce
 +QXnGpSflc6yVtv84gWp1d0FCjqLtkgT8pcyhcICmItAcHmr04a/MruaV49+D8a6inTqNor/XZW
 0WaXnWz+YNUKrQWpOwhHXJpohEa9C1OTO1m8AfAG8LLEZqOA0VUBBlhK9Fq2yy/PghXjXcJbqID
 VfuZRG1kT4dpyEh9YVwoJmj/LvBT3NbmBDSf8NO5nn/jVPcRKPsLNjM4ekp+TPPYjgywWK8jRxA
 /O4yX+TgT9q0ZQRORib5H0Li7ijObDAQXCXZP6ruweEWfElCZCsyNFgIbuvcSDvEnF3j40qalai
 CoTixCn0uqjt1v9lSL9phvNVkS5HlI7/7MlzuMJsaMOgRv8trq42mo/ZSmLIn/HZ0dDYrADWG/m
 xFHv5bwO+45ksNm66dL+DbVrXrI2O7lekjStDA+8O23Ht/KFG1Jnnk/vGlB0ytN5DJiPTOdgAPy
 0VhFMJTRiRtsuWYHczA==
X-Proofpoint-ORIG-GUID: gDt7Y3yAZSF67WjyikzeAce6AbAianvM
X-Authority-Analysis: v=2.4 cv=cc3iaHDM c=1 sm=1 tr=0 ts=6a485ca1 cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=b9+bayejhc3NMeqCNyeLQQ==:17
 a=kj9zAlcOel0A:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=EUspDBNiAAAA:8 a=IXP8gIWceGWApokFOlYA:9 a=CjuIK1q_8ugA:10
 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA0MDAwNyBTYWx0ZWRfX05CG/8icc7Ms
 Q4PGFNU4INeApTbImP3s81Kd0bI4bj8FiEQ6Mn4Drd0R/Z/BNAWN+oqVlRr6N7vLTXZ+1a/B67g
 /hHy6qFiD/xzQU4X4414Eaau/ma+47M=
X-Proofpoint-GUID: gDt7Y3yAZSF67WjyikzeAce6AbAianvM
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-07-03_04,2026-07-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 suspectscore=0 adultscore=0 bulkscore=0 priorityscore=1501
 phishscore=0 spamscore=0 impostorscore=0 malwarescore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607040007

On Tue, Jun 16, 2026 at 12:58:38PM +0200, Konrad Dybcio wrote:
> On 5/26/26 7:12 AM, Shawn Guo wrote:
> > Add base device tree include (nord.dtsi) for the Nord SoC series
> > describing the core hardware components:
> > 
> >  - 18 Oryon (qcom,oryon-1-5) cores in three clusters, with PSCI-based
> >    power management and CPU/cluster idle states
> >  - ARM GICv3 interrupt controller with ITS
> >  - TLMM GPIO/pinctrl controller
> >  - 8 TSENS thermal sensors with thermal zones
> >  - 3 APPS SMMU-500 instances
> >  - 3 QUPv3 GENI SE QUP blocks
> >  - PDP SCMI channel and mailbox
> >  - Watchdog, TRNG and TCSR
> >  - Reserved memory, CMD-DB and firmware SCM
> >  - PSCI and architected timers
> > 
> > Co-developed-by: Deepti Jaggi <deepti.jaggi@oss.qualcomm.com>
> > Signed-off-by: Deepti Jaggi <deepti.jaggi@oss.qualcomm.com>
> > Co-developed-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
> > Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
> > Signed-off-by: Shawn Guo <shengchao.guo@oss.qualcomm.com>
> > ---
> 
> [...]
> 
> > +		pdc: interrupt-controller@b220000 {
> > +			compatible = "qcom,nord-pdc",
> > +				     "qcom,pdc";
> > +			reg = <0x0 0x0b220000 0x0 0x10000>;
> > +			qcom,pdc-ranges = <0 745 43>, <67 543 31>,
> > +					 <98 609 32>, <130 717 12>,
> > +					 <142 251 5>, <147 796 16>;
> 
> One triple per line would be neat

Indeed, I agree!

Shawn
