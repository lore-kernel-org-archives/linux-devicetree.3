Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 562E53815C5
	for <devicetree@vger.kernel.org>; Mon, 23 Mar 2026 23:12:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774307559; cv=none; b=cWeO2vabOkKbUkDg76GGksYiLb7kfcXh84QJYO1yXEdT3ENaxbp1MUozVrPx7vTbEWsDX/5UUBo6rWXqLtDhNudUHLeY9XejK72Hc8E+/pEMO04ulagm0TKjyb4Q8gZ1rWm7zEJadGsK+zoT0IiJPR6GV3NiTos4QXSqN2uKDt8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774307559; c=relaxed/simple;
	bh=u3k0L7eC4z3JMP4qLzXLeQhLtTu1Q7rpHXDyahGDVEs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Tt/lvGiphp+u6swg6fPh3MOaMkpsS+EGmqh2iqSjOir1hWZf/pYOittAZgx9MlQzkls2W/oSuPGRVECmysdv1j3M0oYkAJMQsHtA+gciGqRwuBGQMELS9dfeS067zW6E3xL4t6SD8HhLibbN/zVFn0/QV08c0AjoxzSZraNHB78=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=boGqyvdW; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Lvv8FWsG; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="boGqyvdW";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Lvv8FWsG"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62NHqubd618699
	for <devicetree@vger.kernel.org>; Mon, 23 Mar 2026 23:12:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=d8jeBjHIdKgRSLmkKWf+DcRp
	oUVB2Zuc1DPQEC6/awU=; b=boGqyvdWXDjNd2aKeBEy/+FzUSlFMZLELf3/qBD3
	y0pX3O2UpxyFkAqWwqwMsNCU7b9YM3eSgVEEr5ohFvZGCXhWP1KAuHRzrETKPzz3
	QTtJdUkdg9A7U/DDK8c6tOwqnt93sUCaX9e3nJKe9ozK/8Sv54etVOMiUUgfP9kc
	gggxNHvJBgxEb/aHShW3nctOnZqsTJVO6zajhLu8B6yaK6jgJmX6MdiKmzFVWldb
	v+QZ3eOu4FsG8bMD8lTDJN3s21zxeUQRZGofFYH1VwCYPWwSn1KTrPiyQhTuFeqa
	eEh6KW3M4XUggL89k7zM147cp01rWfjAhOfkFnJ9dR2fyA==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d31jgk35x-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 23 Mar 2026 23:12:37 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-50b52a2d70cso86682721cf.3
        for <devicetree@vger.kernel.org>; Mon, 23 Mar 2026 16:12:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774307557; x=1774912357; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=d8jeBjHIdKgRSLmkKWf+DcRpoUVB2Zuc1DPQEC6/awU=;
        b=Lvv8FWsGlZkZbwhgpv4UF6ab6QO78/KFx7fIzh0r929sfjN+6eBe4FaRR8rHN8AafF
         ul6HdhB2AClZY3PMHHRilTK/bzWGiZKz4GdaL5vs4pQ4btjivAuIhRfe38n/7i8YKs4g
         ejf4z4erHRLkaUAj1SzQ09Lgx6sQ/E0Y8I68HAGgKWGFpWF8KoZ61sYtT6dfuVRH3pmQ
         g7f0poyaDWpPdT/Iqj4djmkV6/NXfL5mag0SaDN1tUtZ4bpDAQVI9s3Olt9NZ5OX3jdT
         1o5ZUgGcI4QtNmQSxfaNh/EKykW7orCcbYQj3wHP4xhB18FzDLG+xaQ03ZHW4+gMlJTR
         awrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774307557; x=1774912357;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=d8jeBjHIdKgRSLmkKWf+DcRpoUVB2Zuc1DPQEC6/awU=;
        b=AqqE7uuSyQdK6aL/CPj0nWuis+DZi9CPQ2RbHxKCem8XKJ1Y842nVAmwLiXWkpGkSS
         pGhrQ6F+rwOj2sIXOyk/WGM5mW/wv1hqc2Eu6zn5rfXkAdyrF94pkJiXBJMvucUI6Tk9
         kzy7SyneT4+IVbhZQyNsZl8cnSBw3JvlEdqRltyZlFhDgDP+5eCkdCpwXIjaE+QfKuss
         qOHCR7YHNFiYzhznkNuEaNToOkmO+RjMENFY3XgO1ongRFr96BQFlJxQAfxDloBdr9Fy
         TpCCuij6jGbRFEEuy3ewvynUxek23hz1R6eNaTCKlSxWfk2LAVnotrpiO+sOe2XwyWoj
         bhGw==
X-Forwarded-Encrypted: i=1; AJvYcCX0gOCNP425Y8UwKoQ2eBqwfhywYlqYyafl1FM2nRV89qzAOLHMGdlVFkBCGDGok5CXJvB6iZD1fnU3@vger.kernel.org
X-Gm-Message-State: AOJu0Yx1uO6MhyJ58ZYs3L6lU5QCA/B+/djHQ3Xzf+ksx4vUo437rDL1
	KiKEBeve5HkzAAg5NL3hW9A74mHG6sCWwQFGevpwGN03YEhv+fbkK+E9zlpCfc02hce9O3Tux4G
	niBHH0Ed63DP0Q52vSVBEMIf0ghOpFq0wiKz20+Dg/zEbCJSaz3cvWEQSWAyyIBk9
X-Gm-Gg: ATEYQzwP0Zujx+8og/oMjFAaB2pbavxsPzNeVsgFJyOwcCsE5QlnHm374LbxD8pTJhy
	tgw77seSh5TlDnJnggH541FAHhD6jovazr5SUUsRJf1hU/fhSngSi3fkTmsLYHMtmagf4UoBa53
	R41vBJiQDnKxzM1yNM+x9tYdC2B8QQ7f+rEk5+ombtT34lzkT4yJjIa0r9goMURB+cYaLmz5Qpc
	n2eeTJj9XZ7NB4dklEOjcENPkWyYMivg3up8voPRIfobcb7SkHuziOYs+5sCGGJK411Jms9gZT7
	uLwR907x7iUun1GRpBrTaTqIuiaog9FjrrleXinMbqFc3lUsI9V/uyl7BnD5Sin/8Hd7BJAxO/H
	+uO9W3h3JVLYA34dLTMd3V8wcMU4PA02IJetnZo2o/yBfG1q6rEqU0+sVl2zZ5bAgK1ssq7I/5B
	tga7mobnPKriyjIl70kvCMVxhm0pKFodhKleA=
X-Received: by 2002:ac8:5891:0:b0:509:764:2efa with SMTP id d75a77b69052e-50b37536d3fmr203191151cf.59.1774307556722;
        Mon, 23 Mar 2026 16:12:36 -0700 (PDT)
X-Received: by 2002:ac8:5891:0:b0:509:764:2efa with SMTP id d75a77b69052e-50b37536d3fmr203190841cf.59.1774307556187;
        Mon, 23 Mar 2026 16:12:36 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a2851ac33dsm2858228e87.31.2026.03.23.16.12.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Mar 2026 16:12:35 -0700 (PDT)
Date: Tue, 24 Mar 2026 01:12:32 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: Georgi Djakov <djakov@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Luca Weiss <luca.weiss@fairphone.com>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Brian Masney <masneyb@onstation.org>, linux-arm-msm@vger.kernel.org,
        linux-pm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH 3/9] interconnect: qcom: drop unused is_on flag
Message-ID: <ky6o64toksq4ozbbad4i7mrmrqjkq5ffphrwdruejq6godxco5@ds2een4mht2v>
References: <20260323-msm8974-icc-v1-0-7892b8d5f2ea@oss.qualcomm.com>
 <20260323-msm8974-icc-v1-3-7892b8d5f2ea@oss.qualcomm.com>
 <3d75f9fa-f744-4437-8c68-16ca751193ae@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <3d75f9fa-f744-4437-8c68-16ca751193ae@oss.qualcomm.com>
X-Proofpoint-GUID: mx4Z_clidgTPFGpp9L4XH9uv3VpVuzT0
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzIzMDE3MSBTYWx0ZWRfX2YI+fNQY8QqR
 wqH0Xe/zyc5YU9uNR65LNXBdLJKCgAQyJGidKsYxd5b+ARcGi6bTwi4x7bGm6zbCsvoEIrlUUm1
 s8uoUmwDwN8rj9Sr75EPzRaUzbJAMzsjK+GgnQwckQTmQlMytFgYqUtygygfOaA+cL+8asGXua+
 D9mTkrXl4sb1QiRvgZ4npt0h7o7gYZPAikJZGEgWw5ABjH3ruB8EbjOdFeYzBZAk8we+72wrZOk
 2HuYHRkIN5NrUibKrXErzHlaMn1ivXSZAvI0s16gkGckbicp/RHSfD9WL3fBotvx3v1klswSB4W
 lSoaAOQEDgpFXUqlm7SSaeZQpqs4mmYfjqHZ2AhW0QpFIQ1w08+JHeLV/JLDJdJ9zfbjPLj3jo1
 gtHfe/DC65ybiC6dtCLdJFbvUP1R46PPBO/e6y6wBXxD/U1aWAKaV9Y8KfSr+pWNndwzaftq7Fw
 Z002qfrktD+Luzw91vg==
X-Authority-Analysis: v=2.4 cv=CMInnBrD c=1 sm=1 tr=0 ts=69c1c8e5 cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22 a=EUspDBNiAAAA:8
 a=qbyBQusODcNATh3rj1kA:9 a=CjuIK1q_8ugA:10 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-ORIG-GUID: mx4Z_clidgTPFGpp9L4XH9uv3VpVuzT0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-23_06,2026-03-23_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 clxscore=1015 malwarescore=0 adultscore=0 lowpriorityscore=0
 priorityscore=1501 spamscore=0 phishscore=0 impostorscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603230171

On Mon, Mar 23, 2026 at 11:26:47AM +0100, Konrad Dybcio wrote:
> On 3/23/26 2:17 AM, Dmitry Baryshkov wrote:
> > The commit 2e2113c8a64f ("interconnect: qcom: rpm: Handle interface
> > clocks") has added the is_on flag to the qcom_icc_provider, but failed
> > to actually utilize it. Drop the flag.
> > 
> > Fixes: 2e2113c8a64f ("interconnect: qcom: rpm: Handle interface clocks")
> > Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> > ---
> >  drivers/interconnect/qcom/icc-rpm.h | 2 --
> >  1 file changed, 2 deletions(-)
> > 
> > diff --git a/drivers/interconnect/qcom/icc-rpm.h b/drivers/interconnect/qcom/icc-rpm.h
> > index f4883d43eae4..3366531f66fc 100644
> > --- a/drivers/interconnect/qcom/icc-rpm.h
> > +++ b/drivers/interconnect/qcom/icc-rpm.h
> > @@ -51,7 +51,6 @@ struct rpm_clk_resource {
> >   * @bus_clk: a pointer to a HLOS-owned bus clock
> >   * @intf_clks: a clk_bulk_data array of interface clocks
> >   * @keep_alive: whether to always keep a minimum vote on the bus clocks
> > - * @is_on: whether the bus is powered on
> >   */
> >  struct qcom_icc_provider {
> >  	struct icc_provider provider;
> > @@ -66,7 +65,6 @@ struct qcom_icc_provider {
> >  	struct clk *bus_clk;
> >  	struct clk_bulk_data *intf_clks;
> >  	bool keep_alive;
> > -	bool is_on;
> 
> Hm, looks like the clock vote is kept all the way from .probe()
> to .remove(). I wonder if that's really what should happen..

Well, it's probably up to you to decide. I've a bit lost my way in the
vendor's adhoc / bus / etc. code.

> 
> That's what drivers/interconnect/qcom/holi.c does on msm-5.10
> 
> Maybe "iface clocks" are only needed to execute a ->set() on a node?

Hmm, I don't know. AXI clocks seems to describe the clocking between the
NoC and a particular device. So maybe it's required for as long as there
is something using the NoC.

-- 
With best wishes
Dmitry
