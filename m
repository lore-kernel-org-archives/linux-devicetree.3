Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 066C1309F1C
	for <devicetree@vger.kernel.org>; Thu, 23 Apr 2026 14:44:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776955501; cv=none; b=PlxXQB2b7IN3FeuTEfoHTeFgvHFMWKklJEDvaO6U+8nhGxw5bN2Zz/1C2RpJzWeRjNjHtDM4BC9I5dKVVp+3C+njLyo6YINHOf800SFtnpH3HMCdIMT16H5ZsEJMquTwgvy62M13ffLXu9qLmxDQD9Ft/sK5utLArkm7wQ+1SwM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776955501; c=relaxed/simple;
	bh=pSORkoaCfoc192FCtWtWjc4MnlZ0lrxn8eYFf25KNrE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Is5zoiSqofGayl3qXH6o8zE3C3Yw7B7zzZiyCg4UcKJVqNuggpVXSQQBzusk2+a41X8uJwY4BeDN3jLGDj5M1w/i2jNAQASIho8cYwriQjQm697DX+dX2NGy++FnSvmzu9fyTU4bQHgGt5I9Rj96w8EchJyIetNVNiCNzrytSns=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ZezkuKGP; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=H88nh7NL; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ZezkuKGP";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="H88nh7NL"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63N94frl2319281
	for <devicetree@vger.kernel.org>; Thu, 23 Apr 2026 14:44:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	0a9Bhg4fNKr4opaNYhLqPsa1la9Dyy8ZA/hEl+2ho0c=; b=ZezkuKGPofOTTRaF
	Ggy3f0pQWVraBYZL5Eh3+vfThzrzVbdNvEw0dCyb3ZoBmCdN0tZsXR23AZwlKdWi
	AdN/kn6mVwaeg82CA8Ro00SV0rqSc5zVKgp9wcLOTnmZq+Foe+Qa8QnD9KEVEksY
	P1SDTWe9ZcIgj8ulAB2Mj1e/O5YZT2J/mzAMdyv5anU9dquO7ZAhgUNNNb7wySC6
	JdFkEnDFIpv/DCqT/XqBBrjpfuBuF0g2tvfImxLqX683sQhXZ0eFtFvWZDxV4TYU
	+8NEmwYv/IZ0QtCJsvkygb/ApW9MELI12/fr0ZO32Qqg1A/QQ/DNWT+lDWrRLrDB
	k9FwkA==
Received: from mail-dl1-f69.google.com (mail-dl1-f69.google.com [74.125.82.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dqgfssbky-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Thu, 23 Apr 2026 14:44:58 +0000 (GMT)
Received: by mail-dl1-f69.google.com with SMTP id a92af1059eb24-12c91ef7009so12568708c88.1
        for <devicetree@vger.kernel.org>; Thu, 23 Apr 2026 07:44:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1776955497; x=1777560297; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=0a9Bhg4fNKr4opaNYhLqPsa1la9Dyy8ZA/hEl+2ho0c=;
        b=H88nh7NLQ7x6r9fqJtB05hbYkmna3mzVcDhMSithHzx+MVzpZlaxJ+72+EstFkVyr5
         A3yv3fzevIxQLijNw8pnDFjbbjeTr0ywQqIxMCLHb4znf7rWsNtx0ju3KSFI1EUIm8jJ
         uo8LUoA6KsLLfk/MHm/oveczXjrchg289azMunCM1KSfgK6wwRH3rMyIrR+BkAy3LJ3B
         6IFcyOhf/a/Ze4yZ1Kw8IkZ9Ghw5mVIkRiyTKlDYXpX/wZKfaD6MQy0UQOOFFnKeBA82
         hsEbfgVewmvvTh+/KwsiXopHJe9ch5mRhei4dC3iUyMI2uU9NR6YxIhsHRyIWHgiHnA5
         ahRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776955497; x=1777560297;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=0a9Bhg4fNKr4opaNYhLqPsa1la9Dyy8ZA/hEl+2ho0c=;
        b=s3AOOE1KXxER0D16pymxHKMb65BF4JD2jsjckQEA87jCpKqpQWXPvESUfCrnwhr8NB
         C0sf236/dLCZRWAwbWfwV3PSZcqa+8JYbwmgwoaGg0ydabepixvzF3yP/lwhqHdoXMZB
         xftNXR+yR3ba2CaEWsBWJjdkeaHqhu1G/bcr61LsnZpLhgWuFexz0N7Ululagk0k2XCF
         FB8plwTAV087MOi57sS3PGoPBUUU9YY78PsbytbjxDMxdfFRgJJoc0GLLAdrnweWjLRY
         qoGuzX6J94yAv+GisprRjg5kYYy5rrkJkn8EQAz9sUFgXSSrmfdez5NMH32RJBlBhn+c
         4DoQ==
X-Forwarded-Encrypted: i=1; AFNElJ9x8pBIdntLzZXFjBO+MJq0F6KLivCUGI0bbNXlxvyfmfmKgvj1bOffssAS9yNoFSZI+Zh8nYB0y4De@vger.kernel.org
X-Gm-Message-State: AOJu0YwYffq6fkEpDAfhCNwkRi6ncnEfb9LBye8/kEjHFiXwcVv4ooDo
	WvK96EFyNHBLrgxwtwOPRsaqZCD3zqYTcSGhLCAe7KTXEe7RifRvSc03HLw9pjMlcD34kzR74ju
	p+22FniDiRiqlNmpjgu1iK0Ddo42bZSKGtUh8tmMIs1OVYI5xbEDiJm9E/dzdRFQG
X-Gm-Gg: AeBDietec6FD4Mub7jCh9Bfiv2fA5sQC5B/5ZzC8IeKQGA2ZNViD/AOQmaJSMmxr8Bp
	xF3DVApfyTOlRikyq5qFRNLrkw/zLhHwBZ9UQW7SMuq3971tmxFH9WN56+Di819iuNA7r27TLF5
	ww0w++KdDJFQcYrZOv7mRp33fmMqyW+fSTYeLRzPPOqCxbLlA63lYache8ha/KcQGdfXawXJTZG
	y5CIzRH/34IJ1e70mfVmUXIDhMFrqMKSYD7JIg6TUTL27sB9wUrryJSGtx6EymyYenx+tyxVVVw
	Tl8Luu/YRDC1XYcC1bQygbCqZKFl8c+rs/lsLCyQ09MbDEArSukyflwE/2wUDlWzOjnu5hwIesi
	/ATrVo1AeL75ELv48PZ2l3EJ8s/ddobzfOvrfmjdvNMG1rEDIjZy1k39kpZl3qvtPWsSeRzlR0w
	M=
X-Received: by 2002:a05:7022:f9c:b0:128:d24a:a5c1 with SMTP id a92af1059eb24-12c73fa5bf6mr14615373c88.28.1776955497510;
        Thu, 23 Apr 2026 07:44:57 -0700 (PDT)
X-Received: by 2002:a05:7022:f9c:b0:128:d24a:a5c1 with SMTP id a92af1059eb24-12c73fa5bf6mr14615339c88.28.1776955496818;
        Thu, 23 Apr 2026 07:44:56 -0700 (PDT)
Received: from QCOM-aGQu4IUr3Y (i-global052.qualcomm.com. [199.106.103.52])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-12c919266f6sm21072313c88.1.2026.04.23.07.44.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 Apr 2026 07:44:56 -0700 (PDT)
Date: Thu, 23 Apr 2026 22:44:50 +0800
From: Shawn Guo <shengchao.guo@oss.qualcomm.com>
To: Rob Herring <robh@kernel.org>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Praveen Talari <quic_ptalari@quicinc.com>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
        Deepti Jaggi <deepti.jaggi@oss.qualcomm.com>,
        linux-serial@vger.kernel.org, devicetree@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] dt-bindings: qcom: geni-se-qup: Add compatible for Nord
 SoC
Message-ID: <aeowYpvA6MegAX6w@QCOM-aGQu4IUr3Y>
References: <20260420064401.1248833-1-shengchao.guo@oss.qualcomm.com>
 <aen9U_3jMRagJwgp@QCOM-aGQu4IUr3Y>
 <CAL_Jsq+2oJF4GG=PDsW1y6Cz7-+Qp2DUz1jXEXxD54PoO9zRRQ@mail.gmail.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAL_Jsq+2oJF4GG=PDsW1y6Cz7-+Qp2DUz1jXEXxD54PoO9zRRQ@mail.gmail.com>
X-Proofpoint-ORIG-GUID: sxGjveRemdAkdGbjto0gHUWavLE6Lhxu
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDIzMDE0NiBTYWx0ZWRfX0jx6lbdyxFek
 T5ecHfnzdZzFhY8S0y9imqoMrlj3JNVxABvP2YO/RhYoqO/L/GmeDnuf6uXqWWC2pP6apkqxQy2
 LWeh7DPBHxDvYxXmbxIZNBoZzavuaSbjhgunaGFwdZ9dINzZ839nvLg/rcNZJpxWq93oDXmSQCX
 QhvlHhMB2i6+szA/v8ZUujCUPgVTEFHxG4RtxzOgWWeKSp6xKQqX8UtQlv7ewNSOeOPoIXoOVWj
 IilfcYicroVLLaXUFJGHiUOTwPSxVVpsXrOLOZwZzVqHbHUgfnSaSLVyOtfa1+XZk8l+5juV2K+
 m7oioKGpyM5FpaDM39GxAdnqaDjeiJ5vh7A3Qiiv9VVVeYo4zvWnQP1T35yq2brY6g9UVftlKS6
 MjDYqBTBNLLzorA3ByHMYaCXMGRzrUDlaGY+f3NhZOwye+Zn9y3aUkrfFA718yEkXiwKJeJp7TS
 ElLlThkXUHqY6zMuWiw==
X-Authority-Analysis: v=2.4 cv=AvbeGu9P c=1 sm=1 tr=0 ts=69ea306a cx=c_pps
 a=kVLUcbK0zfr7ocalXnG1qA==:117 a=b9+bayejhc3NMeqCNyeLQQ==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=EUspDBNiAAAA:8 a=j3siSaVScxvUr_GfrVUA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=vr4QvYf-bLy2KjpDp97w:22
X-Proofpoint-GUID: sxGjveRemdAkdGbjto0gHUWavLE6Lhxu
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-23_03,2026-04-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 impostorscore=0 phishscore=0 suspectscore=0
 lowpriorityscore=0 spamscore=0 clxscore=1015 malwarescore=0 bulkscore=0
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2604200000
 definitions=main-2604230146

On Thu, Apr 23, 2026 at 07:08:15AM -0500, Rob Herring wrote:
> On Thu, Apr 23, 2026 at 6:07 AM Shawn Guo
> <shengchao.guo@oss.qualcomm.com> wrote:
> >
> > On Mon, Apr 20, 2026 at 02:44:01PM +0800, Shawn Guo wrote:
> > > From: Deepti Jaggi <deepti.jaggi@oss.qualcomm.com>
> > >
> > > Add compatibles for GENI Serial Engine QUP Wrapper Controller on Nord SoC
> > > with fallback on SA8255P compatibles.
> > >
> > > Signed-off-by: Deepti Jaggi <deepti.jaggi@oss.qualcomm.com>
> > > Signed-off-by: Shawn Guo <shengchao.guo@oss.qualcomm.com>
> > > ---
> > >  .../soc/qcom/qcom,sa8255p-geni-se-qup.yaml    | 20 +++++++++++++++----
> > >  1 file changed, 16 insertions(+), 4 deletions(-)
> > >
> > > diff --git a/Documentation/devicetree/bindings/soc/qcom/qcom,sa8255p-geni-se-qup.yaml b/Documentation/devicetree/bindings/soc/qcom/qcom,sa8255p-geni-se-qup.yaml
> > > index 352af3426d34..d73f9edcbbdb 100644
> > > --- a/Documentation/devicetree/bindings/soc/qcom/qcom,sa8255p-geni-se-qup.yaml
> > > +++ b/Documentation/devicetree/bindings/soc/qcom/qcom,sa8255p-geni-se-qup.yaml
> > > @@ -19,7 +19,12 @@ description:
> > >
> > >  properties:
> > >    compatible:
> > > -    const: qcom,sa8255p-geni-se-qup
> > > +    oneOf:
> > > +      - enum:
> > > +          - qcom,sa8255p-geni-se-qup
> > > +      - items:
> > > +          - const: qcom,nord-auto-geni-se-qup
> >
> > AUTO variant of Nord is SA8797P, so it makes more sense to use
> > 'qcom,sa8797p-geni-se-qup' which is more consistent to
> > 'qcom,sa8255p-geni-se-qup'.  Will update in the next version.
> 
> I thought QCom moved to these codenames because the chips are the same
> with different part#'s by market/application.

Hi Rob,

Your observation is correct! We did move to using code names. But we
hadn't needed to use part number along with code name until Nord SA8797P
(and Lemans SA8255P), where platform resources like clock, regulator,
interconnect, powerdomain and PHY are handled in firmware through SCMI.

Those resources will be present in Nord's DT but not in SA8797P's for
some devices, e.g. geni-se-qup. That said, SA8797P has a different
programming model from Nord for these devices. In case of geni-se-qup,
Nord is compatible with 'qcom,geni-se-qup' while SA8797P is compatible
with 'qcom,sa8255p-geni-se-qup'.

Hope it clarifies the thing a bit. And I will update subject and commit log
to make it clear that we are actually documenting geni-se-qup for SA8797P.

Shawn
