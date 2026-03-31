Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 516C338AC6E
	for <devicetree@vger.kernel.org>; Tue, 31 Mar 2026 18:46:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774982795; cv=none; b=XefGyW0afMk5XD8+UhElztSRdOVHu/GglNs99i6WKNN6tIPESbklPVVLTFCFN/lDcHubBrHIm1G2zKHk6C/GHd3sb0CFO0ebmwlWVEgFgSL7ZdFap+JRCOXhtHDjMLsHv4p/IKloO40vhE5/sC/jDT3/96BP5F6J7CLYyc+pZJM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774982795; c=relaxed/simple;
	bh=zrnIMjxXkZ1FG/FBdZl1JwIEtIQ2OE7bZ+1HVn5IA1s=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Bfx6la24pWevoW+OTWhuEpeO6pHMcSyXjcvploROpnYxsu4WRi10qZ9CuzZpIOwIRfrvkrCzbMBp91ZXjICiTTeCtcaVRkS4r7A1majnYhbTblFgwes/ncPDhabqyKLxva1wjgIl9GFRkw97fyuCg1NoZ8NkSzzeXOYMdIauTYo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=OBiv0jRY; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=DEaoA71O; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="OBiv0jRY";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="DEaoA71O"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62VGdQ4q2724140
	for <devicetree@vger.kernel.org>; Tue, 31 Mar 2026 18:46:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	o8s7tu3YObr0O+v+/4mTKF5LO/Z20gad1rhJhAKZNX0=; b=OBiv0jRYBi5BYjPH
	3vJHjSpkA08ACZZWotSV9YnUcLoBSb6cEdEGNNvrzW5VYzn9dOu3+NsUmo7BrT11
	WUKhs38pFLXVw5IJ1yx0kg+nZ28knGpPDFBwJYT1yOpPjootWGW+hJvXARiTzyw2
	3D+C74X7y7vw8madNaC6LVU2CVRgWZZWzfMr1TgJ3cyuj/E5DQg6m+3+9HRaqrBM
	oiAkzzsdLlwdPn6bgtkAt7qx1oWmoljJvjc0LI6/tOX6FKrZk5/VIF3/q9hjoNBP
	B7rxmeLp7NbGZ1bfvy5QiGUaEyc03cIP427uZTVmZpCseHF+YgtgWYbulnuPgLcG
	EPpxeA==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d84bfm7d7-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 31 Mar 2026 18:46:33 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-50b4031b86dso200737571cf.0
        for <devicetree@vger.kernel.org>; Tue, 31 Mar 2026 11:46:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774982793; x=1775587593; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=o8s7tu3YObr0O+v+/4mTKF5LO/Z20gad1rhJhAKZNX0=;
        b=DEaoA71ORKtE3TpbJ+k5YgII9N7uZqqPAyapwy0XcCHoKn3SC2w5f3mZTHk9V9sQCA
         9aCNPwDQgfnPNoXPXcDAfrdjqNwzsax/aqdGF3Awu40SsLMEs/UErlLpcek6i9RoGue6
         SXaJ1xmirpDZnUz9t7t3eHihTG/BxKd+a78KoyN0Q87y5EskaXR0m2Qa0SRPef05iHyO
         4JycD2cO1nLzA2lBoXHbi7OuWqGzSbw0K+1+PNW4ReOjrN8QKTD4q9Po837Q7SXoiF8Q
         z+1QYZ9iPqIF4qauKJ7pmHpu7+nzeLViVN2VZe8/xItlLbBeZaDeUfZFTjGEd6riWHgI
         0oAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774982793; x=1775587593;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=o8s7tu3YObr0O+v+/4mTKF5LO/Z20gad1rhJhAKZNX0=;
        b=Figvl1yATwsLzCXlXfSDlwrY2qLakXrTTm459AKNKNGFN0Vwh/0VJjvUWR0tRE/YUc
         X3uKNhzDaO1AVpXPzRjf8+aPpn/E9J8R/YlnUQXXIYLdNoCCYVdt6CoaCY2Pd8Uurinx
         U1PjUnc6LMlUUp5/OlPJrg4QIGC3J1mqXqKobK6uMPp1eo3r2lsIcn3TPh40/qiovnIM
         duqYME6TBbr536eIpDon3uyqpgBkMfWL0G/uElHxjnHDCdXu2NO+LPzhTHZXs6iRTP/l
         anQaNtGLu8q35WZxKLIRVtHjCCnPfa33Bvfiv98nx4qdDClFOBcAn+wwbI8etzh4QLoI
         YwmA==
X-Forwarded-Encrypted: i=1; AJvYcCWVw3SldKB0A3rQRyBgdbq22L7A2SLGacthNtYeuSwMJ8wfGUnylqNgZCKmyZhHrMQ6o2fAHPI1wo+m@vger.kernel.org
X-Gm-Message-State: AOJu0YyrGlkkLYMalJXuQpmTnsytwx4VohdYN8wOJ8pmtXj5s4JEfWok
	8KxU1/80vaaamAn3NMckGeFOKq3I0l4qE5xJDFRkRNBDijnKKRgF6davZEfX2YiL5Sa4JqUmC1e
	eo37YHeodJN3KnQtWI2sz6scIbxlRGO5PJCRhfiLwSCP/TA3tGxwYjdj/zWP6FcKS
X-Gm-Gg: ATEYQzxQYH3PUd2kg+0/4/b347R6vsp4d1ZKCOtfPsfTTJFKcPVmfq2FhXd5VEdr0W4
	nkSlkmmOK/PbiAIPjQtHqYtc4iTO90ONfX7p5WRVrZJCB/QeU3NaOmI9oexDxYbGErIYl3a6TsE
	boCLMmQyUyS9IUsi2uk6+alw072CZfhlqZjddPZA3DXhggGlc/z+nalm6ZyuJ5vx0DAAycCSSCo
	AnAQgLIF4MbfgBfBEeT+/nJ+7YJtKxYMHzFqBwVffNYIjConXwheii+NIEJaZA2IIaVLjvmTobm
	dT0Cb88coi/cG+2aO7mmKt234SroUgUqCNSUat+YWT4VAJjILC4ZTcB7IdAmaY78q6jIYThclZt
	wdY64F7fB4IAp+5JFNgR8PAoqtnNBu6ltsKEdIgiCAgsQI04Fjs6mvPOWBIboiwNnYq5VCQuM3C
	f5UhkvI0wRBK4VIEPWmX/wgc9hsojxPN/up5U=
X-Received: by 2002:a05:622a:209:b0:50b:460b:650e with SMTP id d75a77b69052e-50d3bcee065mr9348451cf.49.1774982792822;
        Tue, 31 Mar 2026 11:46:32 -0700 (PDT)
X-Received: by 2002:a05:622a:209:b0:50b:460b:650e with SMTP id d75a77b69052e-50d3bcee065mr9347561cf.49.1774982791950;
        Tue, 31 Mar 2026 11:46:31 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a2b13fd035sm2691936e87.18.2026.03.31.11.46.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 31 Mar 2026 11:46:30 -0700 (PDT)
Date: Tue, 31 Mar 2026 21:46:29 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Ulf Hansson <ulf.hansson@linaro.org>
Cc: Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Taniya Das <quic_tdas@quicinc.com>,
        Jonathan Marek <jonathan@marek.ca>,
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
Message-ID: <6yfn6ux3gbin2dtopdxxv4okinspueryuey5vfdq633gsewc6r@ttp56brnpgvr>
References: <20260209-iris-venus-fix-sm8250-v5-0-0a22365d3585@oss.qualcomm.com>
 <20260209-iris-venus-fix-sm8250-v5-2-0a22365d3585@oss.qualcomm.com>
 <5e2635ac-35de-645b-b5e7-235923f844ce@oss.qualcomm.com>
 <x5gv6dxdum5klzfjyo7xjqull6o43okkmkn7avssg26epbvrz6@z2brpssbk7iv>
 <0b41ee7c-83fe-d604-b750-8a5a0bd62bf8@oss.qualcomm.com>
 <CAPDyKFrO3DzfG0aW4z4w87j_iWM=3dpvp=2Wgr4MX1Bin5-6ZA@mail.gmail.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAPDyKFrO3DzfG0aW4z4w87j_iWM=3dpvp=2Wgr4MX1Bin5-6ZA@mail.gmail.com>
X-Authority-Analysis: v=2.4 cv=INwPywvG c=1 sm=1 tr=0 ts=69cc1689 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22 a=EUspDBNiAAAA:8
 a=b1_-gKTMq_g9t4VrXxkA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzMxMDE4MCBTYWx0ZWRfXzmuEosCFgepj
 nmnXiUWPGsEmQp2tQGA+zZ/mx50Q63kqQqa0K3e3UyxrV3ADjKedGqVcwA16N0D88eVfeStZ5Z7
 ZZLR4SMH/zGcAT6R+pf8K751iA4H1LD5CXKI4BKGtqe5+yEqWIzbXl5JIv2/7brQo63x1GH4Sah
 uWZgprOj82NDQtwKGXiqnG0odwr7pySjBvjCrZTLOd0+XNgdFr3ZOh1lmvsS5B58m3wrHEr/P5g
 QM+lkpP684dhnXxtt/oJCzE6L8miOzylqOV2Ssj0PKZBhOWbvtZwR1tlKhdZui/tPKp9KRDV147
 UEwfS12cmSDcFY08WDONCkd5RzdUxEOHPDGh7wWRiTWak+3MBI7kgkneTvCWyYMKQiK/L6nxmeW
 cycjCnJOz8/WvMKpdhJIZy3DQdJfjIfkVGtWvHu9S8pbBOx35KTo1eKLob/2d2srsuURAEekBgJ
 3RA7rILUfbETEeqN/6Q==
X-Proofpoint-GUID: 8dtQdqxq6ilhAso1SCRtzUlvon--MEww
X-Proofpoint-ORIG-GUID: 8dtQdqxq6ilhAso1SCRtzUlvon--MEww
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-31_04,2026-03-31_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 lowpriorityscore=0 clxscore=1015 malwarescore=0
 impostorscore=0 adultscore=0 phishscore=0 priorityscore=1501 spamscore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2603050001
 definitions=main-2603310180

On Tue, Mar 31, 2026 at 01:33:35PM +0200, Ulf Hansson wrote:
> On Mon, 30 Mar 2026 at 15:06, Dikshita Agarwal
> <dikshita.agarwal@oss.qualcomm.com> wrote:
> >
> >
> >
> > On 3/30/2026 4:45 PM, Dmitry Baryshkov wrote:
> > > On Mon, Mar 30, 2026 at 10:55:02AM +0530, Dikshita Agarwal wrote:
> > >>
> > >>
> > >> On 2/9/2026 7:02 AM, Dmitry Baryshkov wrote:
> > >>> On SM8250 most of the video clocks are powered by the MMCX domain, while
> > >>> the PLL is powered on by the MX domain. Extend the driver to support
> > >>> scaling both power domains, while keeping compatibility with the
> > >>> existing DTs, which define only the MX domain.
> > >>>
> > >>> Fixes: 79865252acb6 ("media: iris: enable video driver probe of SM8250 SoC")
> > >>> Reviewed-by: Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>
> > >>> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> > >>> ---
> > >>>  drivers/media/platform/qcom/iris/iris_platform_gen1.c | 2 +-
> > >>>  drivers/media/platform/qcom/iris/iris_probe.c         | 7 +++++++
> > >>>  2 files changed, 8 insertions(+), 1 deletion(-)
> > >>>
> > >>> diff --git a/drivers/media/platform/qcom/iris/iris_platform_gen1.c b/drivers/media/platform/qcom/iris/iris_platform_gen1.c
> > >>> index df8e6bf9430e..aa71f7f53ee3 100644
> > >>> --- a/drivers/media/platform/qcom/iris/iris_platform_gen1.c
> > >>> +++ b/drivers/media/platform/qcom/iris/iris_platform_gen1.c
> > >>> @@ -281,7 +281,7 @@ static const struct bw_info sm8250_bw_table_dec[] = {
> > >>>
> > >>>  static const char * const sm8250_pmdomain_table[] = { "venus", "vcodec0" };
> > >>>
> > >>> -static const char * const sm8250_opp_pd_table[] = { "mx" };
> > >>> +static const char * const sm8250_opp_pd_table[] = { "mx", "mmcx" };
> > >>>
> > >>>  static const struct platform_clk_data sm8250_clk_table[] = {
> > >>>     {IRIS_AXI_CLK,  "iface"        },
> > >>> diff --git a/drivers/media/platform/qcom/iris/iris_probe.c b/drivers/media/platform/qcom/iris/iris_probe.c
> > >>> index 7b612ad37e4f..74ec81e3d622 100644
> > >>> --- a/drivers/media/platform/qcom/iris/iris_probe.c
> > >>> +++ b/drivers/media/platform/qcom/iris/iris_probe.c
> > >>> @@ -64,6 +64,13 @@ static int iris_init_power_domains(struct iris_core *core)
> > >>>             return ret;
> > >>>
> > >>>     ret =  devm_pm_domain_attach_list(core->dev, &iris_opp_pd_data, &core->opp_pmdomain_tbl);
> > >>> +   /* backwards compatibility for incomplete ABI SM8250 */
> > >>> +   if (ret == -ENODEV &&
> > >>> +       of_device_is_compatible(core->dev->of_node, "qcom,sm8250-venus")) {
> > >>> +           iris_opp_pd_data.num_pd_names--;
> > >>> +           ret = devm_pm_domain_attach_list(core->dev, &iris_opp_pd_data,
> > >>> +                                            &core->opp_pmdomain_tbl);
> > >>> +   }
> > >>>     if (ret < 0)
> > >>>             return ret;
> > >>>
> > >>>
> > >>
> > >> Hitting below compilation error on latest kernel
> > >>
> > >> drivers/media/platform/qcom/iris/iris_probe.c: In function
> > >> ‘iris_init_power_domains’:
> > >> drivers/media/platform/qcom/iris/iris_probe.c:71:46: error: decrement of
> > >> read-only member ‘num_pd_names’
> > >>    71 |                 iris_opp_pd_data.num_pd_names--;
> > >
> > > See commit 7ad7f43e568b ("pmdomain: de-constify fields struct
> > > dev_pm_domain_attach_data")
> 
> The intent was for this patch to be part of v7.0-rc1, but I failed
> with my pull-request to Linus.
> 
> Instead this will be part of v7.1-rc1, assuming everything goes as expected.
> 
> Is it possible to drop/defer these changes until v7.2?

It would be very sad.

> 
> Kind regards
> Uffe

-- 
With best wishes
Dmitry
