Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C970643304D
	for <devicetree@vger.kernel.org>; Tue, 13 Oct 2026 10:43:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791888192; cv=none; b=s+9nKvVWODOGaoJtfmjk4sRKQtu2jXEvb75yTKaRillCuuGGo7YshBbrZk/eJ6sQcK222QkDoMzbVvllDEh5z83A31L4+XjC79jkazG2xgalwJvkX0o9qWhcre8LzdkhPZMSuCaKq2WRR98mmQlqv6J92dywb9G+6efejydp0po=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791888192; c=relaxed/simple;
	bh=np6bjerOYn1Zyw8+TrjpZHV++1EzsIEKSOeSr92z3XM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=e5bsO9JQZfQR+gieztvlhdHj4DoFVWClaP3TPsmMYRUCOSyjaKfKYlLap8e6Ll3Jbt3lvaWK76wfYKfIq3oIpxB5+HFR7Wv0txu1VxzZb/oZ8LImRzR+BToi60zpglL3xzrfilHzesfTnQ10hlSi+TviPV+5a5N7/b9wgqMbkiM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=O7On7kp2; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=VeuPKZzs; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="O7On7kp2";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="VeuPKZzs"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69D6CQ05949221
	for <devicetree@vger.kernel.org>; Tue, 13 Oct 2026 10:43:08 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=MXZwRO4BDFJqGb2cbS7wiYcy
	bGxVIUNkZePoqU20lgw=; b=O7On7kp2ZExeU1gfqcV1UOmjCub8po7o0HkFjvcD
	OPA2R1jbOvAdyzk3FbyeY7XGG1Ot8Ra/eKn+cwRwKb+cNd+ScwQhpoUQ/x57gbzP
	M8MVi8NG0Bc7NsEZcXP+VPnsTCbNjFGraKWOy0MsQQJ4Ad3ASPuLmnc/4dRru/eN
	nq1i38D8oNQ1i4l7BtYBbqeIqxv+i/8VeH88Jn/O+Xy0t5NpFIFjT2aioDVfg3Lb
	xqFTBgjuKVhd0JRemyD2MWi+PiD3mgwzw3YGRsPIPvxREw4LO3MT1xE88CATApMk
	mpiMr5lY+THIWYw19GEWosyOTgvsQDR969C8xY9GBMHbqA==
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com [209.85.219.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h9f6294nt-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 13 Oct 2026 10:43:08 +0000 (GMT)
Received: by mail-qv1-f72.google.com with SMTP id 6a1803df08f44-91b994cb09fso14864546d6.3
        for <devicetree@vger.kernel.org>; Tue, 13 Oct 2026 03:43:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791888188; x=1792492988; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=MXZwRO4BDFJqGb2cbS7wiYcybGxVIUNkZePoqU20lgw=;
        b=VeuPKZzsu+dV65n5YQr9XtKp7Iu1wArQY9aHTX5ZwTowIAu8rSStoZLr9/bGhghVWh
         lQpCdTKiR4s19Ge7NOg3i2ryyYaJbpsEQOCS6jpOBOtfz9n6XilqyBAwQD3XfbLLtwCH
         rcBRrSLLmmPKDq0disHSUzzxQI9oYo5Uxfea54BUzCu0ckAkGBneSBe7oewRd4Z2SdyS
         RvjGFm82c4n872QLjD+oyd5+Z8a355AmOtlhCEnbLoI82wi2AfgpZewzQsE9DTPBJqnh
         8Uly16KkrrNGP4hC4ogMpgiF1AGXco3a12rzHWd4pZNICo6JUyvdAwNBuCiyAwBy5SMW
         ZKrg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791888188; x=1792492988;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=MXZwRO4BDFJqGb2cbS7wiYcybGxVIUNkZePoqU20lgw=;
        b=oEbu73+mNm4llbXu2mXSPJ/cGbyI2netm3kVOFg4lGlnpJjkHMnr/5ffVlabbq///O
         kKyjKFjjwaYjPGYIPrLzwlgGaT0ikIYj0KLwWVHb28qc5CmM922Cu+c0gmrvSUR8LCWy
         wzj9vs47G9M/D6+Ou9q1Xh0ZmPsCzNFhpqjp0A4WLNC9gLcCsWhPEHSE51eiJifik335
         ymQ0rh0BiVgQkJNwZoQTc9NnrTIiiDLC9tr8jkIphIANAIgjyivyXfRwkZZzBRUqR5fB
         HXGpwQauvJVgYMqOOUgF6bhTOgixU8YlwiJH7wifTNfQeTHSi48/x/g9Hi5orxOt3a0e
         e4Bw==
X-Forwarded-Encrypted: i=1; AKwUvByVFaZLTu3LkkcNv/e3PmNsfrHI+fZg8NOmW56gcFDmggcdqfVOzUTEap8zsPi0kYPARdj2brWGjPOp@vger.kernel.org
X-Gm-Message-State: AFq9FYKHbBbHbGsUBbERoihyZQ4BF4SWrmRk6ZY5e7DIRdtIGVVKxxnv
	Kl+Ym1ZPoBnHuuLR6XDkF7+YIeAU4yD2kUMkNvHKXVyi5fiune8m3kqeGqbx7wTzddPN3yGJKlm
	89ZIHBP/aWvb4kXG1bsh+fYyv4oZ7mvh5saGILR5lNW9Vi2Yq0NUZ9iR4snxAHtBN
X-Gm-Gg: AYBFou0xNmesF3UVIxbVINai8kGLRFTTvpfgQ3lKxCfLXjeqGhYiNymhdVVSxDrprRv
	wkOdW/UAZjTWL6AL7bSLlg64rimYbe8YHyRK9pb56m990ErGL2+Z57iaQobnY7liiv3p3TpsUha
	5PNob6+oCdXae1lYx7EnpHS7c9CpMYjRjX0CQzhjFQpZulBHllkCi/FVlOZ7vPEYQk2p8M/xb7I
	vI5eXRjdhP0LeElsMGpaN+M2nPRA22Yj6BwJ+hbNkZgMFn58Z38jjojfC1snftg/cD0sPE23yul
	xp97FvkbYRDLZaHPsOhljWlw/fd2Up9JtXj3LMyB/FddUAh+BKQNiB2eyw4SnuNMwvv3RCzDaPY
	89xvsZiTMRR+O6CVBUTCCRFTQnCTCAixBqzJ4HOBfOh8tjQ48a8FltXMHyLzYtpfSu0Ag90OmU1
	vNK0PET0TCwqDl
X-Received: by 2002:a05:620a:1b9a:b0:93c:7582:14e4 with SMTP id af79cd13be357-93ebd2085ccmr1853088285a.40.1791888187864;
        Tue, 13 Oct 2026 03:43:07 -0700 (PDT)
X-Received: by 2002:a05:620a:1b9a:b0:93c:7582:14e4 with SMTP id af79cd13be357-93ebd2085ccmr1853085785a.40.1791888187320;
        Tue, 13 Oct 2026 03:43:07 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-3a9c3befebcsm37453901fa.1.2026.10.13.03.43.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 Oct 2026 03:43:06 -0700 (PDT)
Date: Tue, 13 Oct 2026 13:43:04 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Taniya Das <taniya.das@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>,
        Shawn Guo <shengchao.guo@oss.qualcomm.com>,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
        Imran Shaik <imran.shaik@oss.qualcomm.com>,
        Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: Re: [PATCH v3 4/6] clk: qcom: Add Nord display clock controller
 support
Message-ID: <ijqjle2jpl7ycdecndlx7qlj4qfm3s5zuxbsecnmhz5cnuomis@nnnxqbubt45z>
References: <20260724-nords_mm_v1-v3-0-32b45232217f@oss.qualcomm.com>
 <20260724-nords_mm_v1-v3-4-32b45232217f@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260724-nords_mm_v1-v3-4-32b45232217f@oss.qualcomm.com>
X-Authority-Analysis: v=2.4 cv=FOKOVOos c=1 sm=1 tr=0 ts=6ace0b3c cx=c_pps
 a=7E5Bxpl4vBhpaufnMqZlrw==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22 a=EUspDBNiAAAA:8
 a=mHeL4lCu1BsMOEic-KwA:9 a=CjuIK1q_8ugA:10 a=pJ04lnu7RYOZP9TFuWaZ:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDEzMDA0MiBTYWx0ZWRfX38cW8T4Don8j
 O5CL+/TFwMB1bb0HNPlQz+Ux/WQO/NvmBu5Ih7KK/k8s7nOjEFJHmkFFCVD/ZU0x4psQC+zO52L
 P+5mQJfpoyd5ywZJVJS8+qx+CZFA+rM=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDEzMDA0MiBTYWx0ZWRfX5MdWPsdxJnPI
 Y83t0j+6LOIXM5wAaxgTT0H3dvfLhVyUCwNWsEljNGBH/xrOUX4W4Mxu1h/yr3puizUc57EpQSf
 Xth4kGsh9BGGtFXCxD2N3mdjf2sEOi04kdCP8hgQlJABD1u/Vwae90kb5quhoyPJPSl0l3OMa74
 IOxX58VGhwLPzstIoyaLZFgm3cFENXUNRx7WjGX0xX/fWzUs6vjavJTRp18UeIlnEwTcG0LAz/G
 VXaGB2y/K+nhriEvFcUYP1CtG77//Q3KGJRfEOrwjVVFZ3cAktA7nTerVxAe3lbqNJvrdUzS2BM
 +2hOjGCLGIhfxz5YqgGtWSYO7EtTwVk9GgiIA3mHqwEgf+ZLp6U424Uo4zTipgj4jdxuJ1OgH2q
 R1zkXSQHRptKR8UhkhujYDlKEoStmqkNCSoyCKPmLibRUd2/Ue5aZsrlmfcBk2rgke1yWkWx8Ua
 YynQjVSeJSWOc/pTJpQ==
X-Proofpoint-GUID: O3jyOXgNvtsEUrqvhSbm-h6BbdEkbWom
X-Proofpoint-ORIG-GUID: O3jyOXgNvtsEUrqvhSbm-h6BbdEkbWom
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-13_01,2026-10-09_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 phishscore=0 lowpriorityscore=0 impostorscore=0 adultscore=0
 spamscore=0 clxscore=1015 priorityscore=1501 malwarescore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610080000 definitions=main-2610130042

On Fri, Jul 24, 2026 at 04:25:08PM +0530, Taniya Das wrote:
> Add support for the display clock controllers (DISPCC) on the
> Qualcomm Nord platform.
> 
> The platform includes two display clock controller instances,
> display0 and display1. Register support for both controllers.
> 
> Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> Reviewed-by: Shawn Guo <shengchao.guo@oss.qualcomm.com>
> Signed-off-by: Taniya Das <taniya.das@oss.qualcomm.com>
> ---
>  drivers/clk/qcom/Kconfig        |   11 +
>  drivers/clk/qcom/Makefile       |    1 +
>  drivers/clk/qcom/dispcc0-nord.c | 2004 +++++++++++++++++++++++++++++++++++++++
>  drivers/clk/qcom/dispcc1-nord.c | 2004 +++++++++++++++++++++++++++++++++++++++
>  4 files changed, 4020 insertions(+)
> 
> +
> +static struct clk_rcg2 mdss_0_disp_cc_mdss_mdp_clk_src = {
> +	.cmd_rcgr = 0x810c,
> +	.mnd_width = 0,
> +	.hid_width = 5,
> +	.parent_map = disp_cc_0_parent_map_8,
> +	.freq_tbl = ftbl_mdss_0_disp_cc_mdss_mdp_clk_src,
> +	.hw_clk_ctrl = true,
> +	.clkr.hw.init = &(const struct clk_init_data) {
> +		.name = "mdss_0_disp_cc_mdss_mdp_clk_src",
> +		.parent_data = disp_cc_0_parent_data_8,
> +		.num_parents = ARRAY_SIZE(disp_cc_0_parent_data_8),
> +		.flags = CLK_SET_RATE_PARENT,
> +		.ops = &clk_rcg2_shared_ops,

clk_rcg2_shared_no_init_park_ops

> +	},
> +};
> +
> +static struct clk_rcg2 mdss_0_disp_cc_mdss_pclk0_clk_src = {
> +	.cmd_rcgr = 0x80c4,
> +	.mnd_width = 8,
> +	.hid_width = 5,
> +	.parent_map = disp_cc_0_parent_map_2,
> +	.freq_tbl = ftbl_mdss_0_disp_cc_mdss_byte0_clk_src,
> +	.hw_clk_ctrl = true,
> +	.clkr.hw.init = &(const struct clk_init_data) {
> +		.name = "mdss_0_disp_cc_mdss_pclk0_clk_src",
> +		.parent_data = disp_cc_0_parent_data_2,
> +		.num_parents = ARRAY_SIZE(disp_cc_0_parent_data_2),
> +		.flags = CLK_SET_RATE_PARENT,

Here and in several similar places: No CLK_OPS_PARENT_ENABLE?

> +		.ops = &clk_pixel_ops,
> +	},
> +};
> +

-- 
With best wishes
Dmitry
