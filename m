Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 348FB1E260C
	for <devicetree@vger.kernel.org>; Wed, 22 Apr 2026 00:56:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776819389; cv=none; b=Ma8e406XCg4tIWljx+pchh+f3RMS+Jnp3YxOg6qgHRoNPQkbgb2wY3Tdy1D4B3fBLDWEFqYhJLGYHuaB0H79pbvBCE4afY1/C/WnJwnHJyXIGLURNutC1uA1aW6iuBU9tI+f/9Cpx17lDEP52MzxNqqTcy2Q1WI3doEbGt2AjMg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776819389; c=relaxed/simple;
	bh=QUeW3n4HQKpE7mI9YgUGmlckg5zxvGHQuIljzjl3pMs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=igv/ZeuU6Om3wkt6guIpdwlPNDhKXncUd6IRMX9TIFi5jHczm9MhQwI0mzwhFleLuX+Pl3EbNErJTQBrE5ryGY/866crKcUnUVTT/GQaaHkagBftZTrYCnmgmhpfBJtvtAi3D+hzvxIQdHOdq87mVhKZ2dQlFNJBX/4vkyrYL3Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=H2sg3qjY; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ck+yX8c4; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="H2sg3qjY";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ck+yX8c4"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63LIZvjH164206
	for <devicetree@vger.kernel.org>; Wed, 22 Apr 2026 00:56:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=dXacrk+N/LnqJRF2guWzSd+V
	pX9Zpkgr1IHHPiUgfKs=; b=H2sg3qjYxtXPTMwKhq9GsfYQI1YoJY6PGycjhbR/
	+TZ3UlhnHG8FY336cGqjaAJsIHx1NL18xgzbg1mznWIF+WNTp3uZcRdd+gKzplHs
	E+6W06QIP+NPkxy2oUjeWNzW9ivA4fOWnTwZ0oD574XIYu5RlegbLB55UmEVEfa5
	rWobIvXxz43yU7p/fJRNzmguzJPI+Yx3YLew/lfbEeb9R38l4nmyTGqOI3ZG3+eg
	Xq5zu1diPMkPLXpOe4+VmnlR+bK1cFp1vsDnZU4uaZqgWUYM2JeZM2atpSXGcj88
	YxapUf+LZ+QW5PXv2mkMFLkreR3aXTSRISi4Rny2HpRIQw==
Received: from mail-vk1-f199.google.com (mail-vk1-f199.google.com [209.85.221.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dpenhgyjs-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 22 Apr 2026 00:56:27 +0000 (GMT)
Received: by mail-vk1-f199.google.com with SMTP id 71dfb90a1353d-56a8c0b9ef9so4642333e0c.0
        for <devicetree@vger.kernel.org>; Tue, 21 Apr 2026 17:56:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1776819386; x=1777424186; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=dXacrk+N/LnqJRF2guWzSd+VpX9Zpkgr1IHHPiUgfKs=;
        b=ck+yX8c4psYZ0HcAzTln1TfgYnja4ZvEtR0BfHvBROP8dxHfUBIJxkODBlfDS6hQv0
         KsOb7DWVraoPJJQpjNHyat3dzUuurPlanOSosnccJcd7iF9fzE/gmBWE9Z9Riyid46x9
         RxzfdFQG/yZ+BWR7uImZhpV4gEbElQDiuNqRCTq0XA3GmV+h6SJqq3dCeEvMfV9drbc6
         o9RbuLASoKzLHIwMttIYo8Y9WGN9POxyeXk/BUsVj/4fv2vf2DJzEqIGxJSZGmRKXWvd
         x/34BNR6FQMY2K6Ush6tMqoTFkfLQww2fV8d1E3invDF1U1hDEBZgJIPQSoczSaKDZcS
         YEYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776819386; x=1777424186;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=dXacrk+N/LnqJRF2guWzSd+VpX9Zpkgr1IHHPiUgfKs=;
        b=ePfiwaF+VMBmh5RMg5+NmS+ONNea3o5AMR/grRqrlPvEErlrKxjmZkUCpTBlE5otmm
         qfN4h9t1wLt2kbHsc7MBKgtjUfUU428YLd/htofnZXmg80eSrsEPVYPylrIiWZV/Rtu1
         s/9SHXMCTe6QuqWlDy61RuSBqCHvE4xATZgQ0k1eBkH2PUsiUvZL12rIpiqHyoe7ddu6
         h/DdqYVj6mp4R3hDyf3St3NEHUJgdYycrzDNLGczsPIT6aM1lCcZCPaFz9oYmc//Bf20
         cK/bURY+AFgrngIeAHfTSXupEGZTYcEq2iLad+H3Lm5fqPFlqOhQS2ypTvmEeir7N7zU
         rYPg==
X-Forwarded-Encrypted: i=1; AFNElJ+HUhCj8h51TtyPTaVG637uiduoRcxuk//4uL8sBIc/omQ93+EvCa/4eDvjtNF4adPe8tBPHpN7J3ak@vger.kernel.org
X-Gm-Message-State: AOJu0YxARY+2sdELGzUbKcjZSCpWyOqE8j3liP2w3h2ig3X6lE/RGa+k
	2bw5aD6PKe2I9zMr1L1lrn/6TNjLbZBn4kiMxr/6wzLpNqSbEauxtz4/yoWZkwkqtubdmbdCu5q
	m3ZQfqMK5sBxj146L0gw3ngBbpnjzkac1BFDOvxMDD7XZ+KWno5CGdRW9uNJEQ+Ba
X-Gm-Gg: AeBDiev8UJYKfIrRa67iwIRbkiGzaE9OA+JFxrc8IenknXO5FGuOl8BhMTSv8k1UN3c
	D7E8AkEqDGJL+vN+2yQP11ezXkLJUc1jHrKIGg7bbMazhIrMv+IOPjTwyJkeDhq90KMUIKHQxYK
	Etq0nkCktgaepwOYTi2Gv8TeMmRtuv5dkykWnqq6MBmqzsLYi1iqCkFOroVqUYeuTlcm0GvuwMU
	ABVkIw4gquF4yb6R3u4tscuIp2uU3tVNj/uTzdfV4TJZWV6NNfOj1n5330MS13iNUXNJpuFszIC
	/+mbZ57+OwYcFv5WH86AiggYngm6lkrEZG7Eue6dhA+216LyY/uS6hqq6CuzAG4R279BOhnpOpv
	JECv6GMfbxqCjMFDuvxzShXUDXZeKFo8sB9hRJ3/uia5VCqK9jFRiJo0DM7ZyyIyHvrougy/AiF
	5XkpIV9V8t6DG/NDUgykp7eq+VOtvJ9x8QImjXsQrIA0QjZA==
X-Received: by 2002:a05:6102:c51:b0:605:2df4:c5f9 with SMTP id ada2fe7eead31-616f5aa609bmr8692433137.11.1776819386338;
        Tue, 21 Apr 2026 17:56:26 -0700 (PDT)
X-Received: by 2002:a05:6102:c51:b0:605:2df4:c5f9 with SMTP id ada2fe7eead31-616f5aa609bmr8692414137.11.1776819385855;
        Tue, 21 Apr 2026 17:56:25 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-38ecb4f54ffsm33398401fa.1.2026.04.21.17.56.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Apr 2026 17:56:23 -0700 (PDT)
Date: Wed, 22 Apr 2026 03:56:20 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Shawn Guo <shengchao.guo@oss.qualcomm.com>
Cc: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Mark Brown <broonie@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Kamal Wadhwa <kamal.wadhwa@oss.qualcomm.com>,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
        Deepti Jaggi <deepti.jaggi@oss.qualcomm.com>,
        devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/2] regulator: rpmh-regulator: Add RPMH regulator
 support for Nord
Message-ID: <pakludkmnvnvywmnn4dzl5j6euba3yjgy4zcmpmtmuxjvpg3so@arobndaolbpw>
References: <20260420072639.1249984-1-shengchao.guo@oss.qualcomm.com>
 <20260420072639.1249984-3-shengchao.guo@oss.qualcomm.com>
 <77a87de7-3c66-44b5-9900-df8798d3074f@oss.qualcomm.com>
 <aedzbg6sg2t12gCJ@QCOM-aGQu4IUr3Y>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aedzbg6sg2t12gCJ@QCOM-aGQu4IUr3Y>
X-Proofpoint-ORIG-GUID: SEmdbNEfv_BZQKHhM3m0VKfkuIi3g9ME
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDIyMDAwNyBTYWx0ZWRfXyic30kfGi+jy
 5eJVlUD2/Ada4M+6x/BV7K6iEfQCBLuBwYD/VGhQsg5De3R/6RMZRFYB/fpRw+PM9d13oaefXEh
 UsAM0SgxeL1cjPQbmjY3GWCx6PfjWVL0aKra9Untuh2bnL/Vdv7PoF6hDh8ysK69uGtTrKGOsxI
 rcfGHUiy8E94My3S57QwQOStcILRl7KEPZXtieBn9SI+7yKnFr7TwTDQ9XdOrnKlGWp720zBftv
 r+gGk3x1y1GSyDDgnQDsZFTF4YkSiaCjrC4Jvlwy5LbxqPaqqjwIF4R389iey8x087wDoeiCsGQ
 0TNeesy0kAAtRx3wANY676iWklfmbmVV6rcLQl5x1R2a1NCvn0gdEIb8NfZts87gOuAvve2ZPIK
 iXCCh8idKJ8rZQTk+BhT7AYxyZsPY0H6SeZGj9isHFctZcS3E6jVFGTnUzihSDPz0WZMAl/x42d
 UHRqMWL0yzzAUBkdYqQ==
X-Authority-Analysis: v=2.4 cv=WKJPmHsR c=1 sm=1 tr=0 ts=69e81cbb cx=c_pps
 a=+D9SDfe9YZWTjADjLiQY5g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22 a=EUspDBNiAAAA:8
 a=fkRKR-cSQmqBLKFmSScA:9 a=CjuIK1q_8ugA:10 a=vmgOmaN-Xu0dpDh8OwbV:22
X-Proofpoint-GUID: SEmdbNEfv_BZQKHhM3m0VKfkuIi3g9ME
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-21_03,2026-04-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 suspectscore=0 spamscore=0 lowpriorityscore=0 impostorscore=0
 bulkscore=0 phishscore=0 priorityscore=1501 malwarescore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2604220007

On Tue, Apr 21, 2026 at 08:54:06PM +0800, Shawn Guo wrote:
> On Mon, Apr 20, 2026 at 11:21:23AM +0200, Konrad Dybcio wrote:
> > On 4/20/26 9:26 AM, Shawn Guo wrote:
> > > From: Kamal Wadhwa <kamal.wadhwa@oss.qualcomm.com>
> > > 
> > > Add support for PMAU0102 PMIC voltage regulators which are present on
> > > Nord boards.
> > > 
> > > Signed-off-by: Kamal Wadhwa <kamal.wadhwa@oss.qualcomm.com>
> > > Signed-off-by: Shawn Guo <shengchao.guo@oss.qualcomm.com>
> > > ---
> > >  drivers/regulator/qcom-rpmh-regulator.c | 19 +++++++++++++++++++
> > >  1 file changed, 19 insertions(+)
> > > 
> > > diff --git a/drivers/regulator/qcom-rpmh-regulator.c b/drivers/regulator/qcom-rpmh-regulator.c
> > > index 6e4cb2871fca..9545300d7b03 100644
> > > --- a/drivers/regulator/qcom-rpmh-regulator.c
> > > +++ b/drivers/regulator/qcom-rpmh-regulator.c
> > > @@ -1100,6 +1100,21 @@ static const struct rpmh_vreg_init_data pm8998_vreg_data[] = {
> > >  	{}
> > >  };
> > >  
> > > +static const struct rpmh_vreg_init_data pmau0102_vreg_data[] = {
> > > +	RPMH_VREG("smps1",  SMPS, 1,  &pmic5_ftsmps527,  "vdd-s1"),
> > > +	RPMH_VREG("smps2",  SMPS, 2,  &pmic5_ftsmps527,  "vdd-s2"),
> > > +	RPMH_VREG("smps3",  SMPS, 3,  &pmic5_ftsmps527,  "vdd-s3"),
> > > +	RPMH_VREG("smps4",  SMPS, 4,  &pmic5_ftsmps527,  "vdd-s4"),
> > > +	RPMH_VREG("smps5",  SMPS, 5,  &pmic5_ftsmps527,  "vdd-s5"),
> > > +	RPMH_VREG("smps6",  SMPS, 6,  &pmic5_ftsmps527,  "vdd-s6"),
> > > +	RPMH_VREG("smps7",  SMPS, 7,  &pmic5_ftsmps527,  "vdd-s7"),
> > > +	RPMH_VREG("smps8",  SMPS, 8,  &pmic5_ftsmps527,  "vdd-s8"),
> > > +	RPMH_VREG("ldo1",   LDO,  1,  &pmic5_nldo515,    NULL),
> > > +	RPMH_VREG("ldo2",   LDO,  2,  &pmic5_nldo515,    NULL),
> > > +	RPMH_VREG("ldo3",   LDO,  3,  &pmic5_pldo515_mv, NULL),
> > 
> > Any reason for the NULL supplies?
> 
> We thought it's fine to not model LDO supplies, as they may not always
> follow PMIC.  But that might be even a good reason for modeling, so that
> we can have a better DT description for the supplies.  I will change it
> to:
> 
> 	RPMH_VREG("ldo1",   LDO,  1,  &pmic5_nldo515,    "vdd-l1"),
> 	RPMH_VREG("ldo2",   LDO,  2,  &pmic5_nldo515,    "vdd-l2"),
> 	RPMH_VREG("ldo3",   LDO,  3,  &pmic5_pldo515_mv, "vdd-l3"),

Are those the actual supply pins?

> 
> Thanks for asking!
> 
> Shawn

-- 
With best wishes
Dmitry
