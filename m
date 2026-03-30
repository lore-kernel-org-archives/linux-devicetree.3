Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5460130FC23
	for <devicetree@vger.kernel.org>; Mon, 30 Mar 2026 11:15:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774869340; cv=none; b=JY49DOyeqznRK3+Hdl3tdLI9OG7XW6wTfe5Rti68FiIAakLl+FqkCp0DcAil3lJb8zTr5V71+IjmKBCgxMGCpUANM1qxkNQWaRahJTi5zbnjGwqrTCg83x9QTUTmRWxlM0WKIL/6lhyopKyEkxbXXXRMCK+iNSzTn6sSVuLZ4bU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774869340; c=relaxed/simple;
	bh=tr1+vZrmofnSpYn90Eztx0OhSCniztRM0zdtPMgCtUs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=JOJmN5rVM0LJiFtdxLeHoU5hp29SR4AJoZC/ABSHnxe9jwL7Trdn8da9zpgbmq8sdeZPaZJUgjojloPKR4RSNaoFwkiYEcgZ6IdvlzXbq3C+LSThmJFAWzLQS+zmn1xCiM39X9iBaJd0A7Vog4aJdO0seBACjOUVvUT/69LkAeA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=PUzTz+HD; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Z76CFxAC; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="PUzTz+HD";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Z76CFxAC"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62U6sVbT3526846
	for <devicetree@vger.kernel.org>; Mon, 30 Mar 2026 11:15:36 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ogPJDkAzaFSmdt2dEX3iL6F7G9X1L2BalMH8sF2B1Ro=; b=PUzTz+HDRFT2Hlw2
	duCtE2XerKDJzQ0jr30gwqNyn3cimdZUrvRnjMlPvU4Ygail7LR49sddtPz+t/bf
	i5chtgUV5L3nMJnq/LZ8RKz9YJx/nwOz+MpGnaO2dCRlwy3u0xvA+bYeQ57Zxw9U
	dhxjNNzvvYLh85/hGl1Z2jARuFAlg5cDCmfDHJFV4KXGRPL1DBergakYyXM+NGkI
	mGnDGOFxXJy/0Yq/0E9wTiRMJCSEnJEajrW5CDYKUXKJ89olvVFlqk30vBSTjGHM
	uu/NofAR24a+lrQjntYQ9UP3/LdHTetgBFh7aOmW0h7XUhHkMP012frE4Rl6l2YQ
	5yfMKg==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d6v9c3trf-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 30 Mar 2026 11:15:35 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-8cb706313beso641909985a.3
        for <devicetree@vger.kernel.org>; Mon, 30 Mar 2026 04:15:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774869335; x=1775474135; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=ogPJDkAzaFSmdt2dEX3iL6F7G9X1L2BalMH8sF2B1Ro=;
        b=Z76CFxACwNsGhNqTX76broBwXUabr1nNPd6njPaLK4U1BNBuSIOTWNGjln5vvdeH6c
         P+abJlCiij7BmpppFg/rsDCy/d72YDPHHct/5CjzB8Hop/T9cysI3XKym7+Mlq3HODbr
         /+vTAqiEG2TUniVjEaNkAaM6NkUTISQ2rIQWfI+5D3QC8DVRTMYqHuoQRpid+Zqvj0gx
         kJHh/P55Wtl6krr5SABPTPP8iUe7IF/UE33hKxvhTtWA3ImT4Np9CvqE4z+mOzAtgf8n
         YfMEJ9RIqr0BbpAvnWcTRw78UAIdVL2Efj16kDIW92MWkKYPtWhnSc05tzYkCR1ZZ5Dd
         VXyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774869335; x=1775474135;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ogPJDkAzaFSmdt2dEX3iL6F7G9X1L2BalMH8sF2B1Ro=;
        b=HUGeuw24Yjv6xvlSgLJkChdWtEBZRlDoVugD8OvF8OjPbhiQ4b5PVqxHb6ba4Q00Pj
         QrZuptQBiFdizDO3lhOMfmFF++Cx3dntFrDyOlsj+grVY/5FLCGpvFHlvL/chQSVuefg
         LrrhivSbf+SwRX899ofenLoBhw8IjQsaX+SgDoBKAxoYpfC6Q+dHq0qJp7/jj4NUI7Tt
         9GAbfAwQdVDg7aUbLkVa6nvK8KJ3b6jFHHFBFZA4JnlU0y0inSbOc76OopAHy38Gc43f
         vLXAsKgx7Qpgkz1PAs5wE2QfvXlxYoBxurioNfOD39KMFkR1rlt5L90Him7K4u/XPJS7
         Ss+A==
X-Forwarded-Encrypted: i=1; AJvYcCUTvgx3JUbUPtoipDWLqVZ1dGkJ3GqBkt2hMSsCjLXowWPMEhc3wY4CAm5tfbBcQwJsPF/SJCfGb5R2@vger.kernel.org
X-Gm-Message-State: AOJu0YxVDQ9mWeCVSrlr6L2YipXOq6cBCeRjzZtzu1QmOG2LUc8K58Fl
	m6m30TdTsi4iBu2159/T1Ko8ghtNKB5U3jS8vWhIhWk9u8pgzxKYD5DEHCL0FtaxA+5LYU+UwZ0
	GXp5dwVuIMfWoYjIumS4Ayw2bcWGtSZyIJli5xeD3vT7xKwXXeEpcykrIt4pp6noW
X-Gm-Gg: ATEYQzw64RUcRJTORr/88imY9utM5/fYaNYx3wCkLAmbiwKnH8h183CWWb2FOB3B+eC
	UvMfZgRY9LaFXq5tVb/Ku5sJ9yYAViLRMGaUYrJkV9UBq70nvt3ShJN3VnUnYxeEIAgIp0CUDrq
	DJtKnG3Bqu5iaMaZAy5O/ddB76pbjfWxB33A8he1SlnY63X0Xq/vJ1/FA6jY6Lb1EwwBTR2oEGu
	4DBAT6FaTZGpb2WjImpxk7ndC6ZDix5TYdr8B2w+jvb1YjAX61rEXpBzElUWznZElTp1ph9wcHV
	1wHAloQsc5s5OE0pub23pWV12qtty2T09P5vu3PbrFeDvT93QxihVcgqJGwiJ6jocr56HBb11gW
	S5MA3RHe0mlqY8INnqIjk5v5jhY8OPgnbAZVisTAvwdnmfb3YcrmHWS7qNcO05/OWh2b0bAI8Gm
	3qDzCU1cKwsWgED4GOfy+W5cOQ7cYTj4CedVM=
X-Received: by 2002:ac8:5744:0:b0:50b:42fe:d2a2 with SMTP id d75a77b69052e-50ba3836e2dmr178220961cf.18.1774869335140;
        Mon, 30 Mar 2026 04:15:35 -0700 (PDT)
X-Received: by 2002:ac8:5744:0:b0:50b:42fe:d2a2 with SMTP id d75a77b69052e-50ba3836e2dmr178220361cf.18.1774869334457;
        Mon, 30 Mar 2026 04:15:34 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a2b13f435bsm1572580e87.9.2026.03.30.04.15.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 30 Mar 2026 04:15:33 -0700 (PDT)
Date: Mon, 30 Mar 2026 14:15:31 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Taniya Das <quic_tdas@quicinc.com>,
        Jonathan Marek <jonathan@marek.ca>,
        Ulf Hansson <ulf.hansson@linaro.org>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Bryan O'Donoghue <bod@kernel.org>,
        Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Stanimir Varbanov <stanimir.varbanov@linaro.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Hans Verkuil <hverkuil@kernel.org>,
        Stefan Schmidt <stefan.schmidt@linaro.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Dikshita Agarwal <dikshita@qti.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-pm@vger.kernel.org, linux-media@vger.kernel.org,
        Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Subject: Re: [PATCH v5 2/5] media: iris: scale MMCX power domain on SM8250
Message-ID: <x5gv6dxdum5klzfjyo7xjqull6o43okkmkn7avssg26epbvrz6@z2brpssbk7iv>
References: <20260209-iris-venus-fix-sm8250-v5-0-0a22365d3585@oss.qualcomm.com>
 <20260209-iris-venus-fix-sm8250-v5-2-0a22365d3585@oss.qualcomm.com>
 <5e2635ac-35de-645b-b5e7-235923f844ce@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <5e2635ac-35de-645b-b5e7-235923f844ce@oss.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzMwMDA4OCBTYWx0ZWRfX9ErejAhoZ+5y
 mzAAggxw4urvZQML1WlG5yWcniQvVAg/tosmx7E2w1mWh79y4TtSgvQaZoH3khKLzKsC0I0aC50
 qG5xKr2G1ZALpDwEXkMOOyiKYiQ0ClZNbrN6AiB4RnI/bhFZv3mc3jOQEVacW2s1C0vsF2G24ht
 x5plWQPYYpCqCzRDPDo1GQcSz9ZKw+EHYBFPKDayAHjHtj7h5a9veOgRxEcfDt1Ci2+GEmpXY79
 TBSvZ2YymyqDQRtqBc/QPNrqxEvrGt9Zwhq6JpjPdA++ePJpj+8JtNmub1tW5PTwOoXA716+zP/
 KHd4DkCnQfr9TUdlTk07hQqRA5arSx3sBpxanvu0GJJO6pCsbacxJM6n2a3LF0LgNFD8BJZadR0
 WFygdl3RaHqRJ/H2h44SbEIiiUdnPyfjlByWextezv6kgVjnmh9Akrae5HR1wR1T9F4LoC1tPmK
 7Ez4lIOOIl550pfJ2Wg==
X-Authority-Analysis: v=2.4 cv=EIQLElZC c=1 sm=1 tr=0 ts=69ca5b58 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22 a=EUspDBNiAAAA:8
 a=9MiheJ026npgdNaa-0UA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-GUID: woV5Sc2hZFWSnYZdDu1P9TPxFo0n_7GK
X-Proofpoint-ORIG-GUID: woV5Sc2hZFWSnYZdDu1P9TPxFo0n_7GK
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-29_05,2026-03-28_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 lowpriorityscore=0 impostorscore=0 malwarescore=0 adultscore=0
 phishscore=0 spamscore=0 clxscore=1015 priorityscore=1501 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603300088

On Mon, Mar 30, 2026 at 10:55:02AM +0530, Dikshita Agarwal wrote:
> 
> 
> On 2/9/2026 7:02 AM, Dmitry Baryshkov wrote:
> > On SM8250 most of the video clocks are powered by the MMCX domain, while
> > the PLL is powered on by the MX domain. Extend the driver to support
> > scaling both power domains, while keeping compatibility with the
> > existing DTs, which define only the MX domain.
> > 
> > Fixes: 79865252acb6 ("media: iris: enable video driver probe of SM8250 SoC")
> > Reviewed-by: Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>
> > Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> > ---
> >  drivers/media/platform/qcom/iris/iris_platform_gen1.c | 2 +-
> >  drivers/media/platform/qcom/iris/iris_probe.c         | 7 +++++++
> >  2 files changed, 8 insertions(+), 1 deletion(-)
> > 
> > diff --git a/drivers/media/platform/qcom/iris/iris_platform_gen1.c b/drivers/media/platform/qcom/iris/iris_platform_gen1.c
> > index df8e6bf9430e..aa71f7f53ee3 100644
> > --- a/drivers/media/platform/qcom/iris/iris_platform_gen1.c
> > +++ b/drivers/media/platform/qcom/iris/iris_platform_gen1.c
> > @@ -281,7 +281,7 @@ static const struct bw_info sm8250_bw_table_dec[] = {
> >  
> >  static const char * const sm8250_pmdomain_table[] = { "venus", "vcodec0" };
> >  
> > -static const char * const sm8250_opp_pd_table[] = { "mx" };
> > +static const char * const sm8250_opp_pd_table[] = { "mx", "mmcx" };
> >  
> >  static const struct platform_clk_data sm8250_clk_table[] = {
> >  	{IRIS_AXI_CLK,  "iface"        },
> > diff --git a/drivers/media/platform/qcom/iris/iris_probe.c b/drivers/media/platform/qcom/iris/iris_probe.c
> > index 7b612ad37e4f..74ec81e3d622 100644
> > --- a/drivers/media/platform/qcom/iris/iris_probe.c
> > +++ b/drivers/media/platform/qcom/iris/iris_probe.c
> > @@ -64,6 +64,13 @@ static int iris_init_power_domains(struct iris_core *core)
> >  		return ret;
> >  
> >  	ret =  devm_pm_domain_attach_list(core->dev, &iris_opp_pd_data, &core->opp_pmdomain_tbl);
> > +	/* backwards compatibility for incomplete ABI SM8250 */
> > +	if (ret == -ENODEV &&
> > +	    of_device_is_compatible(core->dev->of_node, "qcom,sm8250-venus")) {
> > +		iris_opp_pd_data.num_pd_names--;
> > +		ret = devm_pm_domain_attach_list(core->dev, &iris_opp_pd_data,
> > +						 &core->opp_pmdomain_tbl);
> > +	}
> >  	if (ret < 0)
> >  		return ret;
> >  
> > 
> 
> Hitting below compilation error on latest kernel
> 
> drivers/media/platform/qcom/iris/iris_probe.c: In function
> ‘iris_init_power_domains’:
> drivers/media/platform/qcom/iris/iris_probe.c:71:46: error: decrement of
> read-only member ‘num_pd_names’
>    71 |                 iris_opp_pd_data.num_pd_names--;

See commit 7ad7f43e568b ("pmdomain: de-constify fields struct
dev_pm_domain_attach_data")

> 
> Could you please check and fix.
> 
> Thanks,
> Dikshita

-- 
With best wishes
Dmitry
