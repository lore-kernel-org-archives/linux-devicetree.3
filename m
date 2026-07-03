Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C5EC83EF0C9
	for <devicetree@vger.kernel.org>; Fri,  3 Jul 2026 14:39:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783089598; cv=none; b=kyeUB/TAvGYFIeP0Ei3UPRudTsR9yo6Yofj6QwfHux7JC8UPJVwz0s+iEU1RgYwv/0QqV4w7742/5R5su7p/bTr/O4xjQrUlKR6kZ6wlgaWkL0F7HoCEcsN9lVjZ9AsevcIo6zfkQ7tUzPjBKC9zpTH54I50pohgn/C5DY5CUtA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783089598; c=relaxed/simple;
	bh=bg+VWE6MfXT9eLHUSDEamofW4QaIQDSphisect44F6A=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ALxsI51wij/JMamHkh+0tFpggMwHrnLh/I5mlnZ8fxVZ+80mPafHU1mkVmfIYK0XRMkoOuI71BoT/lYi+e9RZB6qMGf7sqkmTW1beYlI+FWSK3gBoxOdMxRiVlgBA2ZqkPW2oCwXrSGvawzKpR89HKx65k7Xzf5glbZESpy2I5E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Rhdju0g0; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=e410aJVa; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Rhdju0g0";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="e410aJVa"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 663Aw51v3108984
	for <devicetree@vger.kernel.org>; Fri, 3 Jul 2026 14:39:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	bHg7lvuTQiP4rs9t5UUICjFZjlWX9GlGLv8T1O/9mNE=; b=Rhdju0g0MPyREp/J
	fauq9qtuH10VZM7YwgfhZcILF7og22DaY86rBgWeYLMgZg8G723RgLkqdc814uwK
	BdU3/znWR+XAPMGWKwjekBvxgaAbaQlNZDC4WjPb4I7/AFsjVvjjE8FHOAghEdA2
	q9xE+aYGET9HC66AxWHzbQ5fJH9utPPFGGufGZej3WyaCJ/q9juFvcAziygDgJHq
	1WRla7kuxky8R4MH+/78ot9SqoQnmWF97gl46aOzqkpY8Wvb27rpZetCokm7IsfS
	E7ed0CmFt1JsvCHwmmVU6a+Jqt0cXwi42e1oz3A77A7vYY/ZthHpMKIAst6bnUmz
	pIdnrg==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f60eybg5y-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Fri, 03 Jul 2026 14:39:54 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-38101e6fc6cso1165901a91.0
        for <devicetree@vger.kernel.org>; Fri, 03 Jul 2026 07:39:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783089594; x=1783694394; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=bHg7lvuTQiP4rs9t5UUICjFZjlWX9GlGLv8T1O/9mNE=;
        b=e410aJValeBRblOSpy5jsZLCTRgPfu2xnbrFElx0g0k7PPTq5EcskhlNuTRgEU8Czb
         pNnWoloRe1xJ0IUflDTJXBO4i3gjJsqPSGrzvZpX4DzY72spWthB1RzJwuK0AVh9R8fh
         eIvWb16C8N2u9yM6cBiBf0OtCUNoGhDbxoHig6phd+qS0pb1nTSMkLqfhCbnFqH2wijO
         GEVghFuiGnZrw9S6ZrQLuXWfVEWv6Jie/iSzxa3Tadl3OdUCZCk7TvLTriIwNee59BTb
         C9lf0YxL/lHuM5D8ViwyyV3DKuWYZIk2o9qDPjEbookwQE9ab2z0tpo1dU7zVNQMCkRR
         WgqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783089594; x=1783694394;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=bHg7lvuTQiP4rs9t5UUICjFZjlWX9GlGLv8T1O/9mNE=;
        b=IQqmVwUhfhuLL76yQZDMAIx6ThBDUAvI2Ao+K1VVjitsD8INUL/qN4GdGFaq2ohYTq
         iKzMfrpawI8Zqb0oC3ekX1V3lSHPr4Tes+1ye2gTEIKQBvEhE3g5N4sCr0bpHwUVVpfc
         GL4slw9K2Byz2id4GeOyU7Mi0f/i5xYI8vEwxZaSleW/xewf54gSXKSPnhUC5Nsk97I+
         /JHt3noXtxEFxJf54AXArJNRM5Zh4XL+id8LfizR9UjzXagR6sLSSHGAxSqyjTru7UFa
         efilxeGRO4k19l/NrJXEeUQ+4chiVlNGgwWQjlyGq2oIcqQXcUEVoVxIu4YVfr2oCzP/
         v7vA==
X-Forwarded-Encrypted: i=1; AHgh+Rqzp976qh3EReaqCp8Kxgv7gfjmo+IXKrrA8srjQoQ/IMHb/GbUq1BbfnfFL1kZFscfVJcAyz9YbPwi@vger.kernel.org
X-Gm-Message-State: AOJu0Yx4XajTqKrvo2QprrP6L17M9HfTTiu6CdSUNrYDFuXvR+JeJ726
	nm5aU9SZ7eSmqZ1bi0Ka+qG0GfuSJEmzyOWxhkDWvuiGSOTzDUh2NIxw2a2keeXFQoqPXeTY3IU
	OqA3QMDVBVc/jLu6VumNtu1nIooIUUbBB/qk0xQhkmwD3Te9T6sIxC3ThWt9JlAI4
X-Gm-Gg: AfdE7cmLDMmhiMAJRgdGE9o/75Mf7DhLyseVY/lFhuc8VMxqnVQj0K3FpPm1oGNd8eZ
	A1NI+w70jX2ysfwIIb5Sj5jSLZbv4LJ5e2QZtbIJ76Lkxom4bl9qT8s4cRn0+RQg5TZLJMi5Alq
	5uBc6Xy1gLqx9rqPg6TmfzgRlsUdz9AX9wIKqROgCX77pUrqSHYzqNkPRS4e3OIGef8lkShXRTr
	l5gUqNOPdhpJhT2Tio1ZfFu1wza6PQudmH/Y71mxz+OXaznqoVwz4jUk/gfKlvbhf7VwMqJpJQg
	B+x8wp3boUjcodUkRfZ49lEg4hIlk4dM+FpP5x2iowu37uqkMdjpqCMCS8JcWUmDSqScXdMvvQ6
	RU++rCsq1xJzyiYgLEr8jh1ZFEKe0Ym+RkSUiTqMub4DV52aXzRJVcLlRo9GZ
X-Received: by 2002:a17:90b:57e8:b0:37f:caeb:69df with SMTP id 98e67ed59e1d1-380ba94f8a0mr11654374a91.22.1783089593580;
        Fri, 03 Jul 2026 07:39:53 -0700 (PDT)
X-Received: by 2002:a17:90b:57e8:b0:37f:caeb:69df with SMTP id 98e67ed59e1d1-380ba94f8a0mr11654336a91.22.1783089592956;
        Fri, 03 Jul 2026 07:39:52 -0700 (PDT)
Received: from hu-anancv-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-30f3d92c44bsm22468eec.19.2026.07.03.07.39.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 Jul 2026 07:39:52 -0700 (PDT)
Date: Fri, 3 Jul 2026 07:39:50 -0700
From: Ananthu C V <ananthu.cv@oss.qualcomm.com>
To: sashiko-reviews@lists.linux.dev
Cc: robh@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org
Subject: Re: [PATCH v4 2/3] arm64: dts: qcom: fix SoCCP memory mappings for
 Glymur
Message-ID: <akfJtu0dJFFBoTF5@hu-anancv-lv.qualcomm.com>
References: <20260703-glymur-soccp-v4-0-b706c4c9b3e2@oss.qualcomm.com>
 <20260703-glymur-soccp-v4-2-b706c4c9b3e2@oss.qualcomm.com>
 <20260703123728.2CD5C1F00AC4@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260703123728.2CD5C1F00AC4@smtp.kernel.org>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzAzMDE0NCBTYWx0ZWRfX1Nfdvp5TLmlr
 VQa9ABjeoUlWcHykqhF/yRE6bt1sxued7JXxgGebgBC+kS2k6UioLe9lEZ4kiO2GiqCgqR2iAnr
 YiSrm3p+q9XPUrVoIoK/c/6X6c920yMhi+iQ/SJQgKt+bYefqOEJcKJsmKdhrcbC9pC6WwP2bER
 2tTyM4VUif4qQiGwAqMhLG4mTl0sk4gd7E/GPOnmnUFq3ag6Cbii0iqSpSA4q9eu1bzDBBcBaVq
 gx+8NfOgluquNOFVKgqYbejXxTBiwba2Zpirlq82lIJplmTY1iGu4BSAqVVVEZjrVYbXPmlEzhL
 Pm9HXrK3agWZ8EICWTA7XgjHg4GWQoXZKWiHtwQSzYsgqN59gAxO6bN6/cTA8ZblVTa3ZL7KQzJ
 +mmIQXVO+UorHLDCmFS5yWhzMdcGMpr9w+h2UQBue8LeDpDf44RVAjGiH6UJEFrnBXBMSM6Tl8K
 QYFoqnIWXEDXfstDoKw==
X-Proofpoint-GUID: MQnWmdfl1hOO3NLyyiWk9gZqJ5AFfBiZ
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzAzMDE0NCBTYWx0ZWRfX9ObI59m3OtBu
 rC3nTzujEO7SUFRDmdX+a4c9JuJ75BeJBl1Ma+VMKqCmczj4Y788Dvunk5Jh/OLCp3vMXhtap1/
 xfyICBuD/3DMLzj4Eqq7mDUeRqge9QY=
X-Authority-Analysis: v=2.4 cv=SPRykuvH c=1 sm=1 tr=0 ts=6a47c9ba cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=8nJEP1OIZ-IA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=c92rfblmAAAA:8 a=EUspDBNiAAAA:8 a=VwQbUJbxAAAA:8 a=_JvEUGRjuUHn2I_QtWgA:9
 a=3ZKOabzyN94A:10 a=wPNLvfGTeEIA:10 a=mQ_c8vxmzFEMiUWkPHU9:22
 a=GvGzcOZaWPEFPQC_NcjD:22
X-Proofpoint-ORIG-GUID: MQnWmdfl1hOO3NLyyiWk9gZqJ5AFfBiZ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-07-03_02,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 adultscore=0 malwarescore=0 bulkscore=0 priorityscore=1501
 lowpriorityscore=0 phishscore=0 spamscore=0 suspectscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607030144

On Fri, Jul 03, 2026 at 12:37:27PM +0000, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 1 potential issue(s) to consider:
> - [Low] Device tree nodes in `reserved-memory` are no longer sorted by unit-address.
> --
> 
> commit a19a73590d416c9dc7623921d49433687e8ae84f
> Author: Ananthu C V <ananthu.cv@oss.qualcomm.com>
> arm64: dts: qcom: fix SoCCP memory mappings for Glymur
> 
> This commit updates the SoCCP and SoCCP DTB memory regions to match the
> Glymur v21 memory map release requirements.
> 
> > diff --git a/arch/arm64/boot/dts/qcom/glymur.dtsi b/arch/arm64/boot/dts/qcom/glymur.dtsi
> > --- a/arch/arm64/boot/dts/qcom/glymur.dtsi
> > +++ b/arch/arm64/boot/dts/qcom/glymur.dtsi
> [ ... ]
> > -		soccpdtb_mem: soccpdtb@892e0000 {
> > -			reg = <0x0 0x892e0000 0x0 0x20000>;
> > +		soccpdtb_mem: soccpdtb@89200000 {
> > +			reg = <0x0 0x89200000 0x0 0x20000>;
> >  			no-map;
> >  		};
> >  
> > -		soccp_mem: soccp@89300000 {
> > -			reg = <0x0 0x89300000 0x0 0x400000>;
> > +		soccp_mem: soccp@88e00000 {
> > +			reg = <0x0 0x88e00000 0x0 0x400000>;
> >  			no-map;
> >  		};
> 
> [Severity: Low]
> This isn't a bug, but should these nodes be reordered to maintain ascending
> unit-address order?
> 
> By changing the addresses here, soccpdtb@89200000 now structurally appears
> before soccp@88e00000, which breaks the conventional ascending sort order
> for reserved-memory nodes.

Indeed, this has been an oversight. I will spin up a revision later to address
this.

> -- 
> Sashiko AI review · https://sashiko.dev/#/patchset/20260703-glymur-soccp-v4-0-b706c4c9b3e2@oss.qualcomm.com?part=2
