Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 163C03D6CAF
	for <devicetree@vger.kernel.org>; Tue, 21 Apr 2026 12:54:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776776066; cv=none; b=HYkYcYKZjVtxsUQDFivuCYyBb0AV4eXw9/vXjR1OkQBIsV4zwBrgG5O0cGOgH/uqOkLNQMn/dsmXGP4obtVvJR/R7Vl83d885J7HQaKiVa/3XKdKRr2LUj4eywUeZVAtk35YILFPRS5TAW/DSJ82jR1qIDhVI6k6fQJTuMeotis=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776776066; c=relaxed/simple;
	bh=uFGmd0NgS3Gb4WO3dlidZD4uKw75wCW6ySr7In9/XnY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=cGY+qoxzUyg2jgKzFvAOrwRT14qcXSmCctzZomMqUkNvJEf8pmeYXORoZgRb2fK4cXiNbefcVED8snTJ+jMTH8Rygvt5JYEmcnuq+Ejfi0ds3lrkXUw7s8RyajhMkXJAl92qvpYxAkmeck+ILtzNpNtjAPUjpjg8W0TQrlZJ2ck=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=F/UOdA+i; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=N6MAun9/; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="F/UOdA+i";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="N6MAun9/"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63L9XT9F3164674
	for <devicetree@vger.kernel.org>; Tue, 21 Apr 2026 12:54:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=rvgwzwNCsr0kVCgZCO0b8Gan
	6uAfHoY1Q2EdivY2g1U=; b=F/UOdA+idDNgOsgLkGkvfkksajla126tXrb04fwe
	ThVX7Vi2+OwDb+N2DJ7J/PyUOATs6NFVIcHP9mQthJEPDy6lKOeBOmGaYNQ8T1JR
	/okemA1rpivOi5egf6aGNLgluHvnpZ9v7u6K0q9iIHttvkSV106A4yH6n0fQo44q
	21h+hEdXqx85PAgPOswsjdar4lKEpDhdTUHZg0t4P2AV9dVFhSwBkjjsNU2rJHiE
	OMWlOgFQDIpKCjxNbdYXa0BjTLeTcdqFVyXY1QRTC3uy6lskOeMk77AyvWDd5zbc
	Y5Su6Fn/p+tyng7OOY3cIZd79nh2sp1Hu9YamH93GPrKMw==
Received: from mail-dy1-f198.google.com (mail-dy1-f198.google.com [74.125.82.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dp6q80n2b-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 21 Apr 2026 12:54:14 +0000 (GMT)
Received: by mail-dy1-f198.google.com with SMTP id 5a478bee46e88-2ddd8ef5343so4039631eec.1
        for <devicetree@vger.kernel.org>; Tue, 21 Apr 2026 05:54:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1776776053; x=1777380853; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=rvgwzwNCsr0kVCgZCO0b8Gan6uAfHoY1Q2EdivY2g1U=;
        b=N6MAun9//6U1Lt7or6TLEjl5m2mtfM64Cz7z/qOr2TuSqblwtJhTB9U1h2hDwipfWz
         IeOuXxsm45mLybfecZmm/Bmpns28egEDywcIhIPnZN33/tzIElju6mhXpMwxy8/CuXCv
         K/xYGyxVpqmjakl9IT+jxNlaJwWNHjLw4qgY8TIcWFwBQz68nc1coML0kH0pv0v4UuN8
         MgkrenPWZMyRG39g3Jwl51TgJIzJJ7ySUJW/dFt5u5e16lLet8PmTRrZBZSshfGAtXjG
         iUYgcTVQNy0VCNXzgALDUySgnhS7vvPWcgH9Mc16yXmuhgro77gEgbL0BskZCBy9UYmK
         KQPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776776053; x=1777380853;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=rvgwzwNCsr0kVCgZCO0b8Gan6uAfHoY1Q2EdivY2g1U=;
        b=llM+rLlBYb987K4OA6qzmW+6FBah171frLz5GLYeOI/HkSx2KF952cp2mjZ63WuyWH
         Kd5Cj/foQraC61uniRWWFCk+UMq9AvaG4vRetWOa0CznQb/PmPrSC/HSmtZDW8U0MTgI
         sPYLqhDM5GfzEXg3waFQ5w063tnCXJPvcSgLkVUG8KNIzMtAVHmCL27HDZz11thBVKk+
         X8SxsSgfcm+epuv05UqCMVYFe4PzPPaiv/4nymgtCtsQRNFq4agiGpWHWGqx2/nc4+LC
         3UBNUYmfkloRMC6q0jpX+wz25EOLGy7MbgWihqRzR9ZzRiiruK6pkbEYQPdB+kW6cwji
         XiIg==
X-Forwarded-Encrypted: i=1; AFNElJ/2Btv1vSb447gH+C6rSD65PDwTRbdB+mtJE7Fm9zFBBFZRKAGglenPKAF0IIgc9fSuftRPkd1vBJaC@vger.kernel.org
X-Gm-Message-State: AOJu0YzcdJR57FH1vylcpk6/luDNRcVwXsec7mFR1pyYAK6gP/h9Aeav
	hJLlPgfHQ8+jy6dZvBEvb5Dkv0C9A1JtcGOlFT+y0lUlPvJWXOe0vB1+4ZzQ+0xTf3DGMHwYB95
	emHZyvNpyiRHtrerwUHMIPghinb9ZJp9YYV8YiCTegQZH6RQ1/04LG1mAP7eRCIVq
X-Gm-Gg: AeBDieu6ZxOYgLwfn8j04nZK6L5Bh2EI34Y/p8DUb9IYUDRAeC9u8I9PhDz6gS2Nypw
	vp31L2fp9pYvSQ6zIfHbucKtSZGzM87utM/aL5liDi0ZCeFJqQSKi38CZ5u5Av4rhb1tTLYEuc+
	66HD45JI1ueblBBPQNUsRJA2cXzlI1our4XJbyluNFejeRxRhAZI8w54TXq7irfGx+KackC/tMl
	Bg1yeHcngAfgojz5I9gSfYa8DGYvt2wmYjw8p6f0qQSjKi4Zm0KD9pvKAt8+RMZTCABPij9lOk+
	2ZXMXAijsF2qwxg8wPdjdI3czZvZEMxibc5iXbnKPkJqOt0uu1GQpbGxTayOgfjlXBjU/JQqIdP
	ogXTIYPz8cNew628Hf1HmZ3iZVGfD1nL7YmJNtldXfwmksiQudKggLK5fOEDQF4kHa66TAwrTK6
	0=
X-Received: by 2002:a05:7300:fd09:b0:2da:d4b4:c85a with SMTP id 5a478bee46e88-2e464dad10cmr8237844eec.11.1776776053045;
        Tue, 21 Apr 2026 05:54:13 -0700 (PDT)
X-Received: by 2002:a05:7300:fd09:b0:2da:d4b4:c85a with SMTP id 5a478bee46e88-2e464dad10cmr8237816eec.11.1776776052469;
        Tue, 21 Apr 2026 05:54:12 -0700 (PDT)
Received: from QCOM-aGQu4IUr3Y (i-global052.qualcomm.com. [199.106.103.52])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2e53ccce0f5sm18748491eec.17.2026.04.21.05.54.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Apr 2026 05:54:12 -0700 (PDT)
Date: Tue, 21 Apr 2026 20:54:06 +0800
From: Shawn Guo <shengchao.guo@oss.qualcomm.com>
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: Mark Brown <broonie@kernel.org>, Rob Herring <robh@kernel.org>,
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
Message-ID: <aedzbg6sg2t12gCJ@QCOM-aGQu4IUr3Y>
References: <20260420072639.1249984-1-shengchao.guo@oss.qualcomm.com>
 <20260420072639.1249984-3-shengchao.guo@oss.qualcomm.com>
 <77a87de7-3c66-44b5-9900-df8798d3074f@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <77a87de7-3c66-44b5-9900-df8798d3074f@oss.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDIxMDEyOCBTYWx0ZWRfXznoFKATt0GMq
 kVOVemgaAD9bEkhnJLYLGeDs2wU9Lp7XSsm3CFsm2qwxlmRWDko5zQuB22fRje/a7fdMgGB/vjT
 Lm1nOi0FK9nvFdAF5D2jvbG/t6xfPk6OM5Hrv6sdPXym/Ib63t6O0sijodycAQNDP1aAYY2CCnp
 Bv1yybVgb0XBVMCwEzgCa8Uzt8OkpAT4ys848BVo/IXFir3twdI45y2cI3go6muBo1Vkd4MMCX3
 BY6lm3uW4OywglZJz+BLbsOgj4R0wCixlONsc0ltD8XD+4uiHzJ77IyXaMtS6C3gmIi76VNfexY
 fhpR8nb/ZWWYTkEltCMIxIYLwnHF6a68uCVTpG4UNzZMUR6BojP0fLe9+RhQFkv6IoN1fmg0hDV
 oxkb9MHM+GPSKu7m85DV7hfvzse5snGmBsjAZP+xk91RBGlSzQ6ZFNQK6rnGttj/DazNw/Sam7l
 G8KNi4fPKL1aE0ogrPQ==
X-Proofpoint-ORIG-GUID: T6hX7HB3jFNnHEr30e3zc8I3q4-fxC0b
X-Authority-Analysis: v=2.4 cv=eOYjSnp1 c=1 sm=1 tr=0 ts=69e77376 cx=c_pps
 a=wEP8DlPgTf/vqF+yE6f9lg==:117 a=b9+bayejhc3NMeqCNyeLQQ==:17
 a=kj9zAlcOel0A:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=EUspDBNiAAAA:8 a=6n_0llUhAYeFIU8IND8A:9 a=CjuIK1q_8ugA:10
 a=bBxd6f-gb0O0v-kibOvt:22
X-Proofpoint-GUID: T6hX7HB3jFNnHEr30e3zc8I3q4-fxC0b
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-21_02,2026-04-20_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 spamscore=0 phishscore=0 impostorscore=0 malwarescore=0
 bulkscore=0 adultscore=0 clxscore=1015 lowpriorityscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604070000 definitions=main-2604210128

On Mon, Apr 20, 2026 at 11:21:23AM +0200, Konrad Dybcio wrote:
> On 4/20/26 9:26 AM, Shawn Guo wrote:
> > From: Kamal Wadhwa <kamal.wadhwa@oss.qualcomm.com>
> > 
> > Add support for PMAU0102 PMIC voltage regulators which are present on
> > Nord boards.
> > 
> > Signed-off-by: Kamal Wadhwa <kamal.wadhwa@oss.qualcomm.com>
> > Signed-off-by: Shawn Guo <shengchao.guo@oss.qualcomm.com>
> > ---
> >  drivers/regulator/qcom-rpmh-regulator.c | 19 +++++++++++++++++++
> >  1 file changed, 19 insertions(+)
> > 
> > diff --git a/drivers/regulator/qcom-rpmh-regulator.c b/drivers/regulator/qcom-rpmh-regulator.c
> > index 6e4cb2871fca..9545300d7b03 100644
> > --- a/drivers/regulator/qcom-rpmh-regulator.c
> > +++ b/drivers/regulator/qcom-rpmh-regulator.c
> > @@ -1100,6 +1100,21 @@ static const struct rpmh_vreg_init_data pm8998_vreg_data[] = {
> >  	{}
> >  };
> >  
> > +static const struct rpmh_vreg_init_data pmau0102_vreg_data[] = {
> > +	RPMH_VREG("smps1",  SMPS, 1,  &pmic5_ftsmps527,  "vdd-s1"),
> > +	RPMH_VREG("smps2",  SMPS, 2,  &pmic5_ftsmps527,  "vdd-s2"),
> > +	RPMH_VREG("smps3",  SMPS, 3,  &pmic5_ftsmps527,  "vdd-s3"),
> > +	RPMH_VREG("smps4",  SMPS, 4,  &pmic5_ftsmps527,  "vdd-s4"),
> > +	RPMH_VREG("smps5",  SMPS, 5,  &pmic5_ftsmps527,  "vdd-s5"),
> > +	RPMH_VREG("smps6",  SMPS, 6,  &pmic5_ftsmps527,  "vdd-s6"),
> > +	RPMH_VREG("smps7",  SMPS, 7,  &pmic5_ftsmps527,  "vdd-s7"),
> > +	RPMH_VREG("smps8",  SMPS, 8,  &pmic5_ftsmps527,  "vdd-s8"),
> > +	RPMH_VREG("ldo1",   LDO,  1,  &pmic5_nldo515,    NULL),
> > +	RPMH_VREG("ldo2",   LDO,  2,  &pmic5_nldo515,    NULL),
> > +	RPMH_VREG("ldo3",   LDO,  3,  &pmic5_pldo515_mv, NULL),
> 
> Any reason for the NULL supplies?

We thought it's fine to not model LDO supplies, as they may not always
follow PMIC.  But that might be even a good reason for modeling, so that
we can have a better DT description for the supplies.  I will change it
to:

	RPMH_VREG("ldo1",   LDO,  1,  &pmic5_nldo515,    "vdd-l1"),
	RPMH_VREG("ldo2",   LDO,  2,  &pmic5_nldo515,    "vdd-l2"),
	RPMH_VREG("ldo3",   LDO,  3,  &pmic5_pldo515_mv, "vdd-l3"),

Thanks for asking!

Shawn
