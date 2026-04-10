Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1BAE6336885
	for <devicetree@vger.kernel.org>; Fri, 10 Apr 2026 07:25:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775805919; cv=none; b=lYPKHVA+WxcH1OO1x2yidML8ymwQ0Tf1D3v2Mq/LgePvPebi6k59fMc0VLkuLuzXS1wpo36Wi/aiYr5Z2BJStuXVYaUf8JB9J7RUvfONvrTlstgXVL92IIsgwos6Wr9e2jdOq9IM4rxqyYFcIlBiL59qAIbv9JPPairZZ6rwyYc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775805919; c=relaxed/simple;
	bh=hP8NCF91lkhXdaJLcZiy1Kb183qWANmDQMRFxpC6fKo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=JwLncFvZUjMH56tvrGF0FjWbW1s1oY8NxUDCl0XrF/w7HQoJsiSfPhnIXxlwpd42XlEtThT2y9iutVuZkDjgmuSXjAMJqIDXrNpUUcubWLfTzhbHYt3uoGMkNHRZOIFkfDiVNOG8Qb2ukJGXm6P9gXFwrbq6cG42vv0XP1WUQAs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ZOjG7QjU; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=OcK1E11v; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ZOjG7QjU";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="OcK1E11v"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63A6katx1433109
	for <devicetree@vger.kernel.org>; Fri, 10 Apr 2026 07:25:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=LiiUq2KT4FclofLSoCtYniPb
	NOImELLqK9osE4QsYbk=; b=ZOjG7QjUBPfvXcFyzc6dpUGxkeEwwyDr/AIEyS1q
	K7WcwlfBeEyH+F31Uu4hvQeDF4r8891XlJHRvPzc4hxNZmb1lK7SdA5EQNj31w6/
	qkcwaMfbt8IYijqiIVjJNyO2kSL9IgSEbacX7+KLQ7ye4vw52UjvqVq449U7ogl/
	StLkTH1oCus4pQxEBJ2XmuUl6Cs2GPJpTYY+otMNrZXyxIURdrwhgsrV522Ilhy/
	Bny9kKVgpBsGABTTmFY7vXzB+YUvhfeNo1jD/okY7+YWtfstuXyR9QbmszqLp1U4
	jpmNgxrJdq6XjFqnu7udYHQLkD00m6jN4wpEUBkXI5xIGg==
Received: from mail-dl1-f71.google.com (mail-dl1-f71.google.com [74.125.82.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4deckfb7c7-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Fri, 10 Apr 2026 07:25:17 +0000 (GMT)
Received: by mail-dl1-f71.google.com with SMTP id a92af1059eb24-1276e71652fso2418402c88.0
        for <devicetree@vger.kernel.org>; Fri, 10 Apr 2026 00:25:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1775805916; x=1776410716; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=LiiUq2KT4FclofLSoCtYniPbNOImELLqK9osE4QsYbk=;
        b=OcK1E11vlEoPEtqrPlqnUpzQwtv0KMOT63oxOStcJKLLgSUF7RF4tW/2yugbwqUjgp
         KnWSdvwCv2DIiydzPxNnaXmO4B++hezYz8AFTRFADInoZEcdmBV+2GL0tYxl1ZxcPevS
         a/TK3vRoUR0K3p0FgFUEGGC4iDo3998yeiijdBv40lenXEiSL44rqm/FEE4pDclAmGdm
         44HK88gybb/mx5AuTgvyRFoMLwhQKRrKYNTgWkyuJgiA9m2UhLTyvZrLwRZ+7Gqy9guz
         4RJDck+gHGU6hLTtGtdxMc9qng+ll3FsTsuMuQ9S5stTwr8ut3K/XEa5Ev3pzvJTzCCW
         c8NA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775805916; x=1776410716;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=LiiUq2KT4FclofLSoCtYniPbNOImELLqK9osE4QsYbk=;
        b=syHMLRu+xUw2UGB/xyTMHrDjQ83lD3+Q3P0HotKlyfDNYf8jlWZE6CcceR0rJpZCzz
         zCQS9c/9n/42exZRFNtnGYAewXPGYUm73hJWi9EM3uwcr2c4IfNkmLcpZuxxk8LuSPOG
         xGx4AsXX7HHPwpPALybEhOfc6tD2uRLqt9GroEPqxrBFdcDHoU11wC3ZmTYhOgdzDEPz
         If2Hvjh1XNDBAlNYUFGz3aE2xjvijMrpHeJVRG7juIR3RDdk/gc8urbDG6VOp+M+F3ug
         RaFot0It4LZ3Hkxgk9/Nn0auvTGmbpyD6DEO8rHu175sGqjiD5i0VmhXBegzgG6xDAoi
         9eoQ==
X-Forwarded-Encrypted: i=1; AJvYcCUvDG/pPZpd4ZuHohhByxQ6DF1UrRVHLzXzoBvYamm2AfBqy3sB1HW8GK9GkSBwAxks4Jsd1Y1KVmbw@vger.kernel.org
X-Gm-Message-State: AOJu0Yx0/PLHrxzntva5s9WDxuJx/kc6JKMZcgzqYtZ9SB6pL9KRCUoc
	yszuDKugrsCdFOShAEimicYux4ewXSEi+EvMaLNBi/4SbRt34Ty/oeT7vq2MeLTdmazA3EZKYba
	I+2Vw0WhDwE5Mr4y0ZtT1+FNz3OONmSkEPMyaC9HFZ1IQC6BipmBj5jCiac3oojOM
X-Gm-Gg: AeBDiet5162jP8yDs9Pm3S+wFRTSYN9VmIIfvXZYFCtZhAfWNYsxW5AZqtXZgUQWbBv
	KYTnGRKUDxE0E+W+ioc4+dQr4CxzClb8wFXDTo3wdrX9k0Gez4+aQ7fiNkxCUMdl3VAqOtuH5hA
	abiZFRZwM2hzdbUrf/9iOcAiun12o2AJHE13XeyVqptt4NE8ADU3JReJrDACUw8k+VCFtJhVKwO
	NFX7EXABiCexlOC2IBkXKDP6S6GGYf+ZqUEIh9JkTb4Wm8fML5EjMa0TXboet1k0MsUfZ3N2vIQ
	ZQYpvJ/RUUDgXX9oDwqu90E75V19OnAJK59yQhX1hh7bS3/6YdMvSbMad/XjTzolOWA6ilBsNut
	Nm63JEr3GAnmR7ELgw3PkauEL77gH4gkwdoQU1Ef9nYSRCPnL8FqOe5O5RdFgab+gGqecrl0=
X-Received: by 2002:a05:7022:4387:b0:12a:6e97:c21f with SMTP id a92af1059eb24-12c34db2bf1mr1086058c88.0.1775805915964;
        Fri, 10 Apr 2026 00:25:15 -0700 (PDT)
X-Received: by 2002:a05:7022:4387:b0:12a:6e97:c21f with SMTP id a92af1059eb24-12c34db2bf1mr1086036c88.0.1775805915289;
        Fri, 10 Apr 2026 00:25:15 -0700 (PDT)
Received: from hu-anancv-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-12c3459f7ffsm2396376c88.3.2026.04.10.00.25.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 10 Apr 2026 00:25:14 -0700 (PDT)
Date: Fri, 10 Apr 2026 00:25:12 -0700
From: Ananthu C V <ananthu.cv@oss.qualcomm.com>
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Sibi Sankar <sibi.sankar@oss.qualcomm.com>
Subject: Re: [PATCH v3] Add remoteproc PAS loader for SoCCP on Glymur DT
Message-ID: <adil2MTlPvMhv7z5@hu-anancv-lv.qualcomm.com>
References: <20260403-glymur-soccp-v3-1-f0e8d57f11ba@oss.qualcomm.com>
 <ghd4psugqtmgotr5j3754756dvdmlnxtvuefyjrirfwe26lvrb@47f3qinh53sk>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ghd4psugqtmgotr5j3754756dvdmlnxtvuefyjrirfwe26lvrb@47f3qinh53sk>
X-Authority-Analysis: v=2.4 cv=S/fpBosP c=1 sm=1 tr=0 ts=69d8a5dd cx=c_pps
 a=JYo30EpNSr/tUYqK9jHPoA==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=kj9zAlcOel0A:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=EUspDBNiAAAA:8 a=ZT9yhLYL0zAwis4BFHYA:9 a=CjuIK1q_8ugA:10
 a=Fk4IpSoW4aLDllm1B1p-:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDEwMDA2NyBTYWx0ZWRfX/UvSXlE++5yQ
 uMzueingblmCovW+HEUXZ6NdwQh+wVdQXB3wWI+FbDsQMIjfg2FC/BQ8116Nl/wfxmyCDXO0u9z
 VNzhVQkV+V8dtzGlhoGrpmZvElIwlT8nppKYqCvcfrz7lG8yT/0oWbeD6EE/XfdITskvWBnryxu
 oJaQFGcTl/Q9zShximmsFXJZ5xaLRSVkbzDFqr94zGNVPOGUIxbmmCZQ7ZAdpKBMyXz/fFbiIpo
 X1B/bqc2vLL6+90265Yl8GU5tyfhez2gCQPINcrmxLTpxn/4NEg5+71kck7PuKLxAos0lhqv7SN
 Q4+m80mU2003aQjNKr4ldG5QQhl5h7Z+ul4qmeilmHY3Qw1Nwoll1zmiSI66mnDj+LU14Xsc71C
 1du8jngupBKEPF6ly3agJRrutmPS+deR3hb+vSrfaW1opAWwHa/Or6cEfv+l1ClnCI9U00O1eJX
 d33zbpe5qTE2rQDt72A==
X-Proofpoint-ORIG-GUID: Qt6QM7uA4tIkIO81npRJHQ7qyfsgtzkr
X-Proofpoint-GUID: Qt6QM7uA4tIkIO81npRJHQ7qyfsgtzkr
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-10_02,2026-04-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 malwarescore=0 adultscore=0 spamscore=0 priorityscore=1501
 impostorscore=0 lowpriorityscore=0 bulkscore=0 phishscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604010000 definitions=main-2604100067

On Fri, Apr 03, 2026 at 11:25:50PM +0300, Dmitry Baryshkov wrote:
> On Fri, Apr 03, 2026 at 04:39:05AM -0700, Ananthu C V wrote:
> > From: Sibi Sankar <sibi.sankar@oss.qualcomm.com>
> > 
> > Signed-off-by: Sibi Sankar <sibi.sankar@oss.qualcomm.com>
> > Co-developed-by: Ananthu C V <ananthu.cv@oss.qualcomm.com>
> > Signed-off-by: Ananthu C V <ananthu.cv@oss.qualcomm.com>
> > ---
> >  arch/arm64/boot/dts/qcom/glymur-crd.dtsi |  7 +++++
> >  arch/arm64/boot/dts/qcom/glymur.dtsi     | 47 ++++++++++++++++++++++++++++++++
> >  2 files changed, 54 insertions(+)
> 
> Missing commit message.

It appears trying out some b4 shenanigans messed this up, I'll fix it.

> Also, as this is adding SocCP, can we get pmic glink device?

pmic-glink for glymur is already present, in glymur-crd.dts.

> -- 
> With best wishes
> Dmitry

Thank you for the review Dmitry, much appreciated.

Best,
Ananthu
