Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 20B3E239E60
	for <devicetree@vger.kernel.org>; Sat,  4 Jul 2026 01:05:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783127129; cv=none; b=sDOcNKE/kd1gh7nHa/CQs+R0ve/uPqnyuFARjfG6yZ1vUp5n9HMW+6ek875FkgljVtqFYbBMrBnbhIh2GmGw/bU4U7onjXPZYoMVKLfng/ulCANjrgwIaklxU/Zx/J3433IdIL1qfF5r6gBDRat62kKckfGwZTtJXqYX5En/Nw0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783127129; c=relaxed/simple;
	bh=WJyxaBpX2zjY6RaLrRpXx2JiEGOGIv2hCrEYJa39Alo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=dE2U9BwiAJTMAnA4ykbncyis6Sm+votgrKrHyDNCEUX5vz36qvGf0T3WpMkq1k3ebs/2IcQzT/CEib6FJynePwN/Rs6UIDoSvawaWrOmG8nY0gTHDI5IStok0kODSAgRhK4cwMw48bEnrs1est8S8O8rGcUc8TK1hj//NN0TO7Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=WgueMXTG; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=J63GSWbr; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="WgueMXTG";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="J63GSWbr"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 663NYV2L1255994
	for <devicetree@vger.kernel.org>; Sat, 4 Jul 2026 01:05:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=HQHqm5tNyCbaHoWcsSBdNY/1
	TDQXlOjTSmbwpQfiP7k=; b=WgueMXTGozvpU7v94KWuVEQ2Kku0e/rzvmzX6EJU
	G8qnGNnww5ghh1yqsrEdqyzWSmLdZhlX/qVEUCIb4HHUezM7+M920T/vfTxnYC3x
	bEdglf4aDdYmuKMIttWRPWU1Am+wp8EXVG9RkZmWNPr3N0e0Hy92pitW8sUQABj2
	apDIJZTOieq8frbUb7aHoswxLhvufHvSn4KB+lrmSXhNgSuPi1IOzIJdtpQQzRbR
	D/4nfABKthVXbv96NOq4kyzJvQEUiBGYVTUXEd2UDoUP18lBCPvQ96cYwnWaldPg
	ILC+IA4fS06EVFPNB05LMLO0rjQddGtTVQmH3B0YvxZ+yQ==
Received: from mail-pg1-f198.google.com (mail-pg1-f198.google.com [209.85.215.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f648n4evk-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Sat, 04 Jul 2026 01:05:26 +0000 (GMT)
Received: by mail-pg1-f198.google.com with SMTP id 41be03b00d2f7-c88e0d11a3fso742740a12.0
        for <devicetree@vger.kernel.org>; Fri, 03 Jul 2026 18:05:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783127126; x=1783731926; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=HQHqm5tNyCbaHoWcsSBdNY/1TDQXlOjTSmbwpQfiP7k=;
        b=J63GSWbrMx4PtIINOn1VmkSyIbfoiXzis4Dq5se1ZcME0JbrKD+OIB+k5G5IqVAs9R
         CcerFHEGyDG4a3RbxQPjUkGXJtDkcl6ZokMYbvfIZMhgc0ouAfHC0zfBoBhSL+nIx2E0
         hgO6AZBuiTjTPahSuubB6URI8uSptG9LxBbHryZJC/tTZ9ZhMKcszZ7atDPInVj3infp
         rWUyYpMApq05achJTnh2OzLY7sn2A+RrFyG8uar6qe2vJZzdqJdy3X5TUQesgecrKO8C
         125E2H+FBzLQwj2wWFd2QIRTKo4uQdBsc/Wsm0JM2v+12LuEy8qMzLbSdk/IR/6veHPZ
         311g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783127126; x=1783731926;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=HQHqm5tNyCbaHoWcsSBdNY/1TDQXlOjTSmbwpQfiP7k=;
        b=nN0wU7BSkrZKEVpZvg70ibO/eSF3rK28ZnO3773txw+QtKHMk1JNgL1pJF/q5cRYbZ
         LsY8iBQk106BER96ljrmw9FD+Bs6s7J3YV3Z3GqdF6IUL37bmN5if+Wr82xvWXZq/iWJ
         1cFF6Cs8xzSwh/cGOByftNj99xL6GcgieWzFqdGYEkvsGSzK9svuDauin2QaKKILDSTe
         VeNxEkOq4nNUm9pXKrEihsCDxYTRXBRW5n/2fr1Hjeu7Ty3XwRcLZpD53iZaTPuUHvtc
         YjGkWtiyhpm8ubBClpUvbkKCZpIuRnkJ2um5zAkLRB0uzDj3uLXfaoKNcqI5AvCu1Q/y
         FviQ==
X-Forwarded-Encrypted: i=1; AFNElJ+lJJ9A1rY71bpsJyex1RMyIT8ATyWEO3oO+IZaiwuYGjzCjP9BucmvLApdBdULtdNgSRqBwUcjElUf@vger.kernel.org
X-Gm-Message-State: AOJu0Yx28lR/ssbna3BZ+7jvSF3i8M/f+MCwL7uYcXnn97gX6ATCavph
	IVV0Sav/AHrdi2o9IRCCtbiWBnffu+g7I5MZ3k80oWjdmqP77IcICXZP4+Ipb7m2f7iWbn3oQQD
	mSYWc9G+r7pIx0/wBA8761RLeCfTIRW4zKemmFx8Rap/cE88/7ohTpoW1N0TPFN27
X-Gm-Gg: AfdE7clZRWf/LVa4FUVlSdJ/uMP+XQhlLCsg0porxfTPtImUuhiNib6ImdJUWJJtxnr
	QAW0GYES6JnUYFHm0Az19oTBO5PI8X1jWrs63TE85Awq6qUBqtVzCZuHy0tVq4D2gGyF8sFkcfp
	PEpIe+IdvtkKZetskRzPTulFrYB2MwXaIlIh9hiJDyoaiw8NfUfqxuRoSIIjYuZidE42up+X/xb
	4ZMZoS8A06lX1cwWlHX/92N60LfdCUlSAm6pbpX0+QC4b4p6piU89dxx8Z5wagtORU5aJsKA335
	2g69WBY0IGASQCXn9U5p58JC6BG4HJ77E2w/SsV90Ru05Gn0SzFz3T/c34dzbyf8RumCLwEbARN
	cQjldc8uxVTwU0ojezpPnJ0JPTUNmIaHK1+auFY1kIp/FOc60e+1M5g==
X-Received: by 2002:a05:6a20:43a9:b0:3bf:9e25:1a13 with SMTP id adf61e73a8af0-3c03e26ff8cmr1734703637.15.1783127125957;
        Fri, 03 Jul 2026 18:05:25 -0700 (PDT)
X-Received: by 2002:a05:6a20:43a9:b0:3bf:9e25:1a13 with SMTP id adf61e73a8af0-3c03e26ff8cmr1734676637.15.1783127125513;
        Fri, 03 Jul 2026 18:05:25 -0700 (PDT)
Received: from QCOM-aGQu4IUr3Y (i-global052.qualcomm.com. [199.106.103.52])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-13b3c85bde6sm40190952c88.9.2026.07.03.18.05.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 Jul 2026 18:05:25 -0700 (PDT)
Date: Sat, 4 Jul 2026 09:05:18 +0800
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
Message-ID: <akhcTp1MyjGnhXav@QCOM-aGQu4IUr3Y>
References: <20260526051300.1669201-1-shengchao.guo@oss.qualcomm.com>
 <20260526051300.1669201-3-shengchao.guo@oss.qualcomm.com>
 <65467777-27eb-4b8e-bb36-ace91ad27e0a@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <65467777-27eb-4b8e-bb36-ace91ad27e0a@oss.qualcomm.com>
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA0MDAwNyBTYWx0ZWRfX+VQ8Ij+WpbLo
 5ALVBYm4Brc0tgFJ9Z38j3ZhyMIA+o7clzxWuXXW0jrFEsnH+OBDohbVvL0zFbU6BHSLj4ktL0P
 kfgKf5eAeLz8qTAiK5YvOb09FrgFTYc=
X-Proofpoint-ORIG-GUID: JYxAzmD6IwVQMmolfvejsYUXCKbrq_75
X-Authority-Analysis: v=2.4 cv=O4wJeh9W c=1 sm=1 tr=0 ts=6a485c56 cx=c_pps
 a=Qgeoaf8Lrialg5Z894R3/Q==:117 a=b9+bayejhc3NMeqCNyeLQQ==:17
 a=kj9zAlcOel0A:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=EUspDBNiAAAA:8 a=C5FfMpQ73vxss7MKwB8A:9 a=CjuIK1q_8ugA:10
 a=x9snwWr2DeNwDh03kgHS:22
X-Proofpoint-GUID: JYxAzmD6IwVQMmolfvejsYUXCKbrq_75
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA0MDAwNyBTYWx0ZWRfX3XJC1SJOsxNo
 U2jqkoz4M2QuxNnseS7HgIwLH477dcSKybuH9rNLgj5AssmV46R1Sa1/zpCapadp7ajk6td6+pU
 i/7YWnvHkTiLoZGbP54NulU6MWqpIhlABCB79MGlUBP4yQNkhcbslYUjX/TavvzsDs2x3KGgVy8
 65SNcassG2K1izCHK+ao05t9Ef2UqchznKu+/22oz1ewxFM9KTW0q/bP7ktBZGNyXe08Jk/mbT+
 wBt90w4ZnGcXghbD+MZQZlrh7lrhWrOHvs+f2No5B4o38I4bvvHYmB+zjc5tcLb+WiPNmJampCc
 odoc52Qb8WIZ5olU11VJhb/cJik6Rriip7YWEjM5ieHRZWdbCsSJ/jizSchhlMbLRia0quFTlMp
 4N9QK1zbbCLw51u+azTARIQpBfEq3vILWDPxeKxkS8DjgTrHYnj0dvIZeICmexjRPJ+8mOIOguZ
 tFnLYDwbk/WiVfRR25w==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-07-03_04,2026-07-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 priorityscore=1501 bulkscore=0 clxscore=1015 phishscore=0
 suspectscore=0 malwarescore=0 spamscore=0 adultscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607040007

On Tue, Jun 16, 2026 at 12:57:42PM +0200, Konrad Dybcio wrote:
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
> 
> [...]
> 
> > +		dump_mem: mem-dump-region {
> > +			alloc-ranges = <0x0 0x00000000 0x0 0xffffffff>;
> 
> off-by-1?

Yes. We have the same thing in sdm845.dtsi and sm8750.dtsi. Unless you
think that missing the last byte is functionally problematic, I would
rather be consistent with the established pattern in the tree.

> 
> [...]
> 
> > +		intc: interrupt-controller@17000000 {
> > +			compatible = "arm,gic-v3";
> > +			reg = <0x0 0x17000000 0x0 0x10000>,     /* GICD */
> > +			      <0x0 0x17080000 0x0 0x480000>;    /* GICR * 18 */
> 
> Please drop these comments

Sure!

> Otherwise looks alright
> 
> Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Thank you for the review, Konrad!

Shawn
