Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B41823BB113
	for <devicetree@vger.kernel.org>; Wed, 26 Aug 2026 11:13:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787742840; cv=none; b=i04T7HldWEW6Qc4c4HWfsXuRD2OvBor9EmQwoBX83Yy8V7QKkuev5i9lyBm5IRIwSCkvunC003Twyi6lt6XRcDLl3dGSF4brpwADs1G2N06dkD8O/yZsB234maJ0++muAn+942ETb1LoWJ5YMb+EslIi6/L2i8RMgU4ArFY0Pt8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787742840; c=relaxed/simple;
	bh=0D4oVtstSw8d0d+yjWQn6qWjpCP5lPtPIrP08Eo3RVE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=n4ag+gOb+OA4zxxlcwIbpQfh/i3YJxL7Ao+giXLeG39vNxAkBTnrxkaauGHoQE9OvR4am/z7+qJyI7/nSkf2CG1W3wm9D1V4/D6S6vRNddnbpF6uqqnRuCk4kYpiyUcnsv9ycd3jo05NpBeX9NGIKp9gS8zQfckgVil8xYE0u8Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=oaJG160/; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=efm1hTjV; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="oaJG160/";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="efm1hTjV"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67QAGgwq647029
	for <devicetree@vger.kernel.org>; Wed, 26 Aug 2026 11:13:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=euIV9JhfpWCNoJWpkOFao7n7
	qZnXDvRXky5kFo/TpCU=; b=oaJG160/ENZlujEiOMs+77L/zH4cPim3JQr+plPo
	8L10+18mbxyfR5SXn6Ux52rMHXpGRDZsO20D54lbxzqBCm9xL+C8KUPXsfRNsOU2
	eTjNuHjR3H+8tcMt/yOKMJ7pm55i2wOJvDtQou8Gur5mvdyXQz4EtJomKKWlVGMO
	WvJNd9nu4Mw+brtyZGn+ipBr1nF+YVSbAWXZA1lFZQftKPdLN83PdbCIFS+YF+5Q
	4weqE9SDD5zgOnJC2wu6r1p01V/eInKGqb83Voq17S1yg5S3NMPt2ghKdqRC64Nf
	QEIFZI8RAs9f8LpouinksHJMYw16rr7pZf7Ke2e8koGmvA==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g9g4muc97-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 26 Aug 2026 11:13:49 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-92e63df032bso167916585a.0
        for <devicetree@vger.kernel.org>; Wed, 26 Aug 2026 04:13:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1787742829; x=1788347629; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=euIV9JhfpWCNoJWpkOFao7n7qZnXDvRXky5kFo/TpCU=;
        b=efm1hTjVXSZpijzf5VCSmWpbHJq5LhJg6LfUpob41cagpN0fEb6aGOmJDbBl7W7dhZ
         bFZrR8peTh35jgt2lZCzncQk24wIkXCAARxxNa1KHXng/mHXwWUjWFNx2Tvp67V0AUZT
         zBrvb6Clv5wQwQSccumwa1BLqEzvh6ZRtQVtNlCbK80ttASY5zSDVsQkaDWpLBAIbnE9
         OpyFtnAh4Fguyv6XKCZBwu/abVQoxguzghllAZFO9w64Dq1Qz7CSsqAMKVs9sIZ+njGh
         8+2Aa7N9DI/l9mvoz0oICGWUqAWv0QTa9E+L/PtldY7uUTKthKBGl0URR7qTE8MiSzcA
         SFLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787742829; x=1788347629;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=euIV9JhfpWCNoJWpkOFao7n7qZnXDvRXky5kFo/TpCU=;
        b=FsRe26z07wvaSmwYPhTgRbsbKiyOPS3vBEHzM3c5wp7yCNXv1k4fHidLyRX5d5U/3m
         Jvu/nRdQV8VC5IUMrxRThbwwRjNYDRlsiyqTi2kFVHLsLpXUfK3ahrwOoWL1Ty3acdWU
         WUJBxJ8qiUW8HliyhgQR4bkR0umKfB+iC1Klh35eQUzHfY74VG0GB2Pw6Jfhi1NiaC2Q
         G1AYfaZnDvI70ufZSgNwtDeZbZf+btfxwjgIeNaMuXtDpRUHU9J2VKFBGbJ8UsU4eCdQ
         ZaujUcRCYNzd1p39Wp6+X7cZSEpd3xT8IyViwnSeqdOfOPcqQss5P7rZbrD8e7Qt9VX2
         jrwQ==
X-Forwarded-Encrypted: i=1; AHgh+RpkhPezlbIrTfCTYqhLPULp3Q9sduB15AuSMIRcbxICWHmTrPyRdGZ5JD1VtOpb2u0TrIFaTkNhiPJr@vger.kernel.org
X-Gm-Message-State: AFuF++l5SXKd7RxLJZ8DPhaKfllWkC2ztkSE9Cd5qo8nEPjYLLTJ990P
	ixGytKaP3F2Hns1mFYNVmPRUnuslv4Jtz5YvN2ocAnphr+qYtrsRM+ZktPYazNGAFukg9gJuaC3
	TvscYzwYPvvYb3upgkqWjXGhSOqAUVbTVYNeR1Q6S5JWGVL4es/AKA0914eq2rk7wSNDvSmj3
X-Gm-Gg: AR+sD114tvaJNnN5caCRtrYZmEefxZmJBQodFvYDfvThONSP3e22925kGtvcegpRXut
	BmWw8yRw+h1bmtFLsDRV0m/loeKdis0NZMg6vj9WWPZty6EZ13xoxjvTepvLLPHgHvGU9xpLXg8
	/CZrHpsGuEZVDpkRJ9bQ2FMHOf2MR0YAJ2/0+Qcr7H+Jz+uJ0WwRtBwiej9kh9Bgav50ugnQTB4
	9h0cPzMn43f4KOnVFlAOUltuDyY/3jb4gKcfsrA3AEZzaeD/RCMGiOJNsp/UDoNrA8DT3BOgo7i
	wYyVNhl3DrtEXfBoOqlAU5wiTZ4ONsHvEsEHtsHCRZnZLnv4V9ElcaxL33UtXk160V+UirTyMOX
	F3J2481hu2BRR
X-Received: by 2002:ac8:5dc7:0:b0:517:146d:2cb5 with SMTP id d75a77b69052e-52e2ed58474mr122045451cf.20.1787742828599;
        Wed, 26 Aug 2026 04:13:48 -0700 (PDT)
X-Received: by 2002:ac8:5dc7:0:b0:517:146d:2cb5 with SMTP id d75a77b69052e-52e2ed58474mr122045101cf.20.1787742828038;
        Wed, 26 Aug 2026 04:13:48 -0700 (PDT)
Received: from oss.qualcomm.com ([86.121.170.13])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c250a9b2817sm448707066b.53.2026.08.26.04.13.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 26 Aug 2026 04:13:46 -0700 (PDT)
Date: Wed, 26 Aug 2026 14:13:44 +0300
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
To: Neil Armstrong <neil.armstrong@linaro.org>
Cc: Junjie Cao <junjie.cao@linux.dev>, jesszhan0024@gmail.com,
        maarten.lankhorst@linux.intel.com, mripard@kernel.org,
        tzimmermann@suse.de, airlied@gmail.com, simona@ffwll.ch,
        robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
        dmitry.baryshkov@oss.qualcomm.com, konrad.dybcio@oss.qualcomm.com,
        mitltlatltl@gmail.com, dri-devel@lists.freedesktop.org,
        devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 2/2] drm/panel: Add Novatek NT36532 panel driver
Message-ID: <pwpccpcrackei3zuybgog64vhafzkqdgdnp377lygksp4w63nc@6zzxwzttqidl>
References: <20260804073419.84727-1-junjie.cao@linux.dev>
 <20260804074233.85629-1-junjie.cao@linux.dev>
 <b7cf1b71-874d-45ba-8779-0eedc0e21f73@linaro.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <b7cf1b71-874d-45ba-8779-0eedc0e21f73@linaro.org>
X-Proofpoint-Spam-Info: AW1haW4tMjYwODI2MDA5MyBTYWx0ZWRfX5CFPHXEnR2M6
 nutkb0fZY9+2LRv3JWCm8zgkJMcEZxQQNHNQ/5h2WOsi13fbzrsLLuaMLNGHdia0o5PS2QqTCqr
 8ITGR765sue7nObOD0egPT5uuJTwRBc=
X-Proofpoint-ORIG-GUID: BrgXhprtES6CETWsKhSG9aYmhkb6iimO
X-Authority-Analysis: v=2.4 cv=eYgNubEH c=1 sm=1 tr=0 ts=6a8eca6d cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=clBUptZa5v5FR042Ey+sjA==:17
 a=kj9zAlcOel0A:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=KKAkSRfTAAAA:8 a=1JJ5fdCZbPhp8c8Mo1gA:9 a=CjuIK1q_8ugA:10
 a=PEH46H7Ffwr30OY-TuGO:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODI2MDA5MyBTYWx0ZWRfXw6ySngai2csN
 jODUd69scZYcJG1J0jA74w3M1tw67RMkIrN8Z08QbdpvAExWII3YXReMelkihOOpfNjZtRXCe/v
 kvj1EeII3ZvCgnUfk3wsDwSdNRKwFPqeJoj6p/QOEshDvdGgkpc5AO+uRkYsnj756QEcElXy1gQ
 ZZEh72UNkzr8AzzUoO7Pr9ZxInmpRoCSXDgNAfsMBg5Mi57AVJAZfNNUM5tZ61OIe8pIqb94Fji
 Yf+JD7sEKTBQFzrHSBiigDvBhHp6QzCJO4sWHXaEsKAX919qzCOn3fawyzFmaEyxSGlLOfJL34J
 xknDPCgtYc/SGimGNyDuuSOzhe3qj3nY5hGIhn6zTOMK6EvL6jbUEIqk1nkL/xyYKCuZbZoFNIQ
 pwpJ+gXHaEfidFzlHML6UrXlwFajxWcCBg8QszdcYH/iRAFspxdHVuh2nq0pFvZqE6kaETYxevr
 P3GENV3ez9T76bE0WOg==
X-Proofpoint-GUID: BrgXhprtES6CETWsKhSG9aYmhkb6iimO
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-26_03,2026-08-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 priorityscore=1501 impostorscore=0 suspectscore=0
 clxscore=1015 lowpriorityscore=0 bulkscore=0 phishscore=0 spamscore=0
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2608260093

On 26-08-26 12:00:46, neil.armstrong@linaro.org wrote:
> On 8/4/26 09:42, Junjie Cao wrote:
> > Add a driver for panels using the Novatek NT36532 Display Driver IC,
> > including support for the CSOT PPC100HB1-1, found in the OnePlus Pad 2
> > tablets.
> > 
> > It has been tested on the OnePlus Pad 2: the panel comes up in its native
> > 3000x2120 mode at 120Hz over dual-DSI in bonded mode with DSC, and
> > displays a stable image.
> > 
> > Signed-off-by: Junjie Cao <junjie.cao@linux.dev>

[...]

> > +
> > +static struct mipi_dsi_driver nt36532_driver = {
> > +	.probe = nt36532_probe,
> > +	.driver = {
> > +		.name = "panel-novatek-nt36532",
> > +		.of_match_table = nt36532_of_match,
> > +	},
> > +};
> > +module_mipi_dsi_driver(nt36532_driver);
> > +
> > +MODULE_AUTHOR("Junjie Cao <junjie.cao@linux.dev>");
> > +MODULE_DESCRIPTION("DRM driver for Novatek NT36532 based MIPI DSI panels");
> > +MODULE_LICENSE("GPL");
> 
> Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>

Please trim your replies.

Scrolling all the way down for an R-b tag is not fun. :-)
