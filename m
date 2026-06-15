Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 067DA3D1714
	for <devicetree@vger.kernel.org>; Mon, 15 Jun 2026 08:46:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781513168; cv=none; b=uVwcszwBoAwN49Re94sv4RAbs8Kab5lWlft2bxEtMw2j+PxUeYxqf5q+Arzc8SU+xR/GVPqW02VqoX3dPdQToqLfpFGGA94uPstYg1MtK8jsnX4NR4FmvJf3BhvFx3AG6EirjTkpJtVtrhPlc2dqtfNcu8JUvNKlZ9M7Wocw8nE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781513168; c=relaxed/simple;
	bh=/O05/RUXDTPoINgeXSSQztmerkf3/d1laEEbbrZivPE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=W90287dgaZHZdJNXeWsYFrhSmyYfdGhN0TNNarZxs50AhmzMZjy5HkWRlGOm5/A8uoj6BW9PcXd9kwzyft+ceIH655glYbS4ztBCYOEHNVpJh4St8iQU2ZZXDzKuD/p0Clbd92IgIPu6zL6WsYTWDAH8BkSscOjs/eapo0evftE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=N48wynWW; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Q5H5X8Rn; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="N48wynWW";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Q5H5X8Rn"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65F6KbXv3709710
	for <devicetree@vger.kernel.org>; Mon, 15 Jun 2026 08:46:06 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=TQmsqoe9deZs4vwOMpPUgVk6
	RggtnzeexXvCM12GNX8=; b=N48wynWWB2UjZW7DAs120KmX8QCk1JlgW41b5BCN
	AqFz4HYgYHskEveUuXHDleVDHk61XBKUNEij+WPLD2bWLQbXKR9KlXgU/sEOErIa
	O2Y110pBeQ+2Up6c8upo/UcbNdhFOb6IYvPcPQ92h39nEt0r2AX85lsz5wexDW20
	+4JbhUlmzTZXVMGNftODqJwA4HMOi09fD1xAw74RFGvJscnydfPpdwHx5jlocgMd
	TpeWLDATv4WNTvizEHc9rund7ldYUNL5DK23Zks+yEdsx/DtauHaeNWY0CxLiWWy
	hnq1Ymmhm7coLwy0qfuoc7EIRs1R/KhwBJCIokvGxMYgzg==
Received: from mail-dy1-f200.google.com (mail-dy1-f200.google.com [74.125.82.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ery956g12-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 15 Jun 2026 08:46:05 +0000 (GMT)
Received: by mail-dy1-f200.google.com with SMTP id 5a478bee46e88-304df51ff3eso6698210eec.0
        for <devicetree@vger.kernel.org>; Mon, 15 Jun 2026 01:46:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781513165; x=1782117965; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=TQmsqoe9deZs4vwOMpPUgVk6RggtnzeexXvCM12GNX8=;
        b=Q5H5X8Rnyjs71X8xhLPgaMC03QiGmpYB2rCIDefYKCjk4QmKYvCXMolualyuycKmpL
         zJmrTz3uLNTsjIrINtOacJ1rRZfy+HRjpV4rQWfgccdX1ZyZu28wJhpqrsUocCAzOZGI
         8eCfFmpcrBls7l8o/pusgCBwk8TqcCbflVWbCfghkW68XVwgnILB9ybApYR3ApRkBkH2
         4xJfNr7UKDZfRoeeWw2ssdzzvBV2LhnJzdJeBSOt9vilrL8Ape2ShrM4eISG22bymvNY
         xBwtOU74OKeFRNc9nrcWpraBR3AraGAViMMMJvhQYGLeJQEzWGD3UavZ4i52U+J67lxM
         pIWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781513165; x=1782117965;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=TQmsqoe9deZs4vwOMpPUgVk6RggtnzeexXvCM12GNX8=;
        b=j8X+C4KltTutHP2PsPcQ3NvU/YD9AimtazjPh5GbfULi10G76vaT/NBdmduMavCaHR
         DIAiesD18+FP/jN/1Wc/49ZWcXaFTLJe5/LKQwfdU/i1xIfYTzpjnq+Qsh/rRgOdLH+H
         Y2BR0hjJmKM1wyXkmGz9zzDHxHnTiuL5CVriapt97K6zI+aliEd1tMJsrg7MU4zgOUq0
         i+YoMbH9Y3R7ynhP5/F90qgO6WBxaPCvJPDC9K88dUpMTbxxjfQXT4UOi2ZOXL66DEyr
         EvndKuL+h7ZadUSfzLSffZPETL4N7CnJ+yBj49JBswUlAwm8TvUtIbESK2Y25GIf+l8c
         6xWA==
X-Forwarded-Encrypted: i=1; AFNElJ/VLb046JtAcATrRL8iTE//DvwYJsXjo3WXGulEd9NBcwt2WQkscrcbHOToNl/HCMzK/EymTaZrvWUz@vger.kernel.org
X-Gm-Message-State: AOJu0YzArErgXUwikC0zHzLYt9BTEdm49RsteKHMG+EeK+/bH7aE6MNI
	wbSIUAXr8eALA0EtniBWayCxvCJ7iUNkIzVaS9WmKwaggEIwksVfy5H2UkWfM5DN9rInkz6ZCIl
	1ia7mlLCucJADgsesgjJanbRPwjttaCHdJ/ZstSN0f4eDnaL6NezrfjbrEIEf9CTu
X-Gm-Gg: Acq92OHuHFHGaqIZQZtqVm+iXkhGoMSLHPzjqXO4rsA+fSlIuBMRScmHCKVZFWW2stg
	k5rL20kZanOYTbySEqbB4XQxKEkxV0XWzzn9cpEOOKcHGE/rpbWsdo/6NJDpJPq48QVMfKuKPdK
	eHlT1mBsQtcYr6nqkRh4QkbBT2vLnH/HLOrwpuNvfSX1Xgsh/Rkody5PB/yPUI41xNaUjO2/V3/
	WRuyWv9y/hQUVaVIJdzQbTkO6jDSQdIc9icIpDJh3k9HzbHdHmgb+Y2p4r6GaaHnhAuJJhSqYwE
	w1BnNdOcD4w5b4Rvi/PvwjAHkTxtD+23o8N4ZKpJsKRPvW+/zFD5VRJpdj3/pXbOuI5nhGS6GWQ
	Oplm1cVXahaMweENwWm95Sfg5YWylfMEkaendWBFGSVQM0skFPd19avdzPw4uzoOGJu6k
X-Received: by 2002:a05:7300:2148:b0:304:2e00:5fb5 with SMTP id 5a478bee46e88-3081ff4b72dmr7832580eec.3.1781513164780;
        Mon, 15 Jun 2026 01:46:04 -0700 (PDT)
X-Received: by 2002:a05:7300:2148:b0:304:2e00:5fb5 with SMTP id 5a478bee46e88-3081ff4b72dmr7832552eec.3.1781513164193;
        Mon, 15 Jun 2026 01:46:04 -0700 (PDT)
Received: from hu-qianyu-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3081eb8f8b2sm14166142eec.27.2026.06.15.01.46.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 15 Jun 2026 01:46:03 -0700 (PDT)
Date: Mon, 15 Jun 2026 01:46:02 -0700
From: Qiang Yu <qiang.yu@oss.qualcomm.com>
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        Konrad Dybcio <konradybcio@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, krishna.chundru@oss.qualcomm.com
Subject: Re: [PATCH v4 3/7] clk: qcom: tcsrcc-glymur: Migrate
 tcsr_pcie_N_clkref_en to clk_ref common helper
Message-ID: <ai+7ym+qM1GbTO/b@hu-qianyu-lv.qualcomm.com>
References: <20260527-tcsr_qref_0527-v4-0-ded83866c9d9@oss.qualcomm.com>
 <20260527-tcsr_qref_0527-v4-3-ded83866c9d9@oss.qualcomm.com>
 <747f0319-68e1-4cd7-9dd1-4a675d882f99@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <747f0319-68e1-4cd7-9dd1-4a675d882f99@oss.qualcomm.com>
X-Proofpoint-ORIG-GUID: lkKoZ9M2IBN4olBTxBnKoMfCGxrkCMNw
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjE1MDA5MSBTYWx0ZWRfXxWeHsWuAKxjG
 WFBM4I+vPUoQcPHHqo7XxERJaSsZ/RhKNMMZVI5NdneySPnSsYPLNBbxXu8wcQ9biY7L44t7Ll7
 jGTwK/AbkzEym2HodTzt2XpXSUlWAcI=
X-Proofpoint-GUID: lkKoZ9M2IBN4olBTxBnKoMfCGxrkCMNw
X-Authority-Analysis: v=2.4 cv=EbP4hvmC c=1 sm=1 tr=0 ts=6a2fbbcd cx=c_pps
 a=PfFC4Oe2JQzmKTvty2cRDw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=kj9zAlcOel0A:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=EUspDBNiAAAA:8 a=9x36BgKddDksvwc1ZLQA:9 a=CjuIK1q_8ugA:10
 a=6Ab_bkdmUrQuMsNx7PHu:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjE1MDA5MSBTYWx0ZWRfXwO4//akLgwNP
 EJj+vB/f94Su2/O3R5q0XRSkUv6aBiRFFvqVd4HLqmmIWKlCKErIbfhz0my+fz8JpYQ7ODWgVfc
 lLAEAb5eAglDR078rHjLXtmR9tRNQGUB5TcWH0jNeOcMHBe8AdHLbLeey+yf4NP7NsqQgGOil8M
 vWQJw6xKD/ASsBabq9j7V2uS+9rfmmOrcHMnuWvZd0X9SOKSHq8p71DND5SAyQQzwcFOxHAQikf
 C5RHxLvZ8ucp4q0zmKMbYXGkNW5QeHvWGmqD5YqvgZgeYZJJ4RCN2CGwGfIHHpYQz2Ai/UJ2zLz
 lVjnsCufDNGuNPkzSWbZzGyZgzG+eMYaeU2RQJs+Jm/ob5ERqVDi21V2y82nsozvUqWInwVrSro
 nDZ06NeGjmeTZNeNtmyxtifNXzpJFwPv+Rsd8A5bgec7fEYX+okHKXvn3r/xFL3CLqHgh04lkdl
 eEHS+QzepMbIoWUrnmQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-15_02,2026-06-12_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 priorityscore=1501 bulkscore=0 clxscore=1015 malwarescore=0
 suspectscore=0 spamscore=0 phishscore=0 impostorscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606040000 definitions=main-2606150091

On Tue, Jun 09, 2026 at 03:02:27PM +0200, Konrad Dybcio wrote:
> On 5/28/26 4:29 AM, Qiang Yu wrote:
> > Replace local clk_branch-based clkref definitions with descriptor-based
> > registration via qcom_clk_ref_probe().
> > 
> > This keeps the glymur driver focused on clock metadata and reuses common
> > runtime logic for regulator handling, enable/disable sequencing, and OF
> > provider wiring.
> > 
> > Signed-off-by: Qiang Yu <qiang.yu@oss.qualcomm.com>
> > ---
> 
> You can remove the of.h include. Apart from that:
> 
> Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> 
> Also, attaching a diff to complete the regulator map. I'm fairly sure
> these are correct, but it never hurts to triple-check.
> 
> You can add:
> 
> Co-developed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> Signed-off-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> 
> if you squash them together. FYI e.g. the tertiary USB QMPPHY would
> only start every 20 boots or so without this, running on pure luck..
>

Okay, will sqash them and add above tags in next version.

- Qiang Yu
> Konrad
> 
> diff --git a/drivers/clk/qcom/tcsrcc-glymur.c b/drivers/clk/qcom/tcsrcc-glymur.c
> index e317003398d1..eb4ee8ec9ad7 100644
> --- a/drivers/clk/qcom/tcsrcc-glymur.c
> +++ b/drivers/clk/qcom/tcsrcc-glymur.c
> @@ -21,6 +21,14 @@ static const char * const glymur_tcsr_tx0_rx5_regulators[] = {
>         "vdda-qreftx0-1p2",
>  };
>  
> +static const char * const glymur_tcsr_tx1_rpt0_rx0_regulators[] = {
> +       "vdda-refgen4-0p9",
> +       "vdda-refgen4-1p2",
> +       "vdda-qreftx1-0p9",
> +       "vdda-qrefrpt0-0p9",
> +       "vdda-qrefrx0-0p9",
> +};
> +
>  static const char * const glymur_tcsr_tx1_rpt01_rx1_regulators[] = {
>         "vdda-refgen4-0p9",
>         "vdda-refgen4-1p2",
> @@ -40,6 +48,15 @@ static const char * const glymur_tcsr_tx1_rpt012_rx2_regulators[] = {
>         "vdda-qrefrx2-0p9",
>  };
>  
> +static const char * const glymur_tcsr_tx1_rpt34_rx4_regulators[] = {
> +       "vdda-refgen2-0p9",
> +       "vdda-refgen2-1p2",
> +       "vdda-qreftx1-0p9",
> +       "vdda-qrefrpt3-0p9",
> +       "vdda-qrefrpt4-0p9",
> +       "vdda-qrefrx4-0p9",
> +};
> +
>  static const struct regmap_config tcsr_cc_glymur_regmap_config = {
>         .reg_bits = 32,
>         .reg_stride = 4,
> @@ -52,6 +69,8 @@ static const struct qcom_clk_ref_desc tcsr_cc_glymur_clk_descs[] = {
>         [TCSR_EDP_CLKREF_EN] = {
>                 .name = "tcsr_edp_clkref_en",
>                 .offset = 0x60,
> +               .regulator_names = glymur_tcsr_tx1_rpt0_rx0_regulators,
> +               .num_regulators = ARRAY_SIZE(glymur_tcsr_tx1_rpt0_rx0_regulators),
>         },
>         [TCSR_PCIE_1_CLKREF_EN] = {
>                 .name = "tcsr_pcie_1_clkref_en",
> @@ -80,34 +99,50 @@ static const struct qcom_clk_ref_desc tcsr_cc_glymur_clk_descs[] = {
>         [TCSR_USB2_1_CLKREF_EN] = {
>                 .name = "tcsr_usb2_1_clkref_en",
>                 .offset = 0x6c,
> +               .regulator_names = glymur_tcsr_tx1_rpt34_rx4_regulators,
> +               .num_regulators = ARRAY_SIZE(glymur_tcsr_tx1_rpt34_rx4_regulators),
>         },
>         [TCSR_USB2_2_CLKREF_EN] = {
>                 .name = "tcsr_usb2_2_clkref_en",
>                 .offset = 0x70,
> +               .regulator_names = glymur_tcsr_tx1_rpt01_rx1_regulators,
> +               .num_regulators = ARRAY_SIZE(glymur_tcsr_tx1_rpt01_rx1_regulators),
>         },
>         [TCSR_USB2_3_CLKREF_EN] = {
>                 .name = "tcsr_usb2_3_clkref_en",
>                 .offset = 0x74,
> +               .regulator_names = glymur_tcsr_tx1_rpt34_rx4_regulators,
> +               .num_regulators = ARRAY_SIZE(glymur_tcsr_tx1_rpt34_rx4_regulators),
>         },
>         [TCSR_USB2_4_CLKREF_EN] = {
>                 .name = "tcsr_usb2_4_clkref_en",
>                 .offset = 0x88,
> +               .regulator_names = glymur_tcsr_tx1_rpt34_rx4_regulators,
> +               .num_regulators = ARRAY_SIZE(glymur_tcsr_tx1_rpt34_rx4_regulators),
>         },
>         [TCSR_USB3_0_CLKREF_EN] = {
>                 .name = "tcsr_usb3_0_clkref_en",
>                 .offset = 0x64,
> +               .regulator_names = glymur_tcsr_tx1_rpt34_rx4_regulators,
> +               .num_regulators = ARRAY_SIZE(glymur_tcsr_tx1_rpt34_rx4_regulators),
>         },
>         [TCSR_USB3_1_CLKREF_EN] = {
>                 .name = "tcsr_usb3_1_clkref_en",
>                 .offset = 0x68,
> +               .regulator_names = glymur_tcsr_tx1_rpt34_rx4_regulators,
> +               .num_regulators = ARRAY_SIZE(glymur_tcsr_tx1_rpt34_rx4_regulators),
>         },
>         [TCSR_USB4_1_CLKREF_EN] = {
>                 .name = "tcsr_usb4_1_clkref_en",
>                 .offset = 0x44,
> +               .regulator_names = glymur_tcsr_tx0_rx5_regulators,
> +               .num_regulators = ARRAY_SIZE(glymur_tcsr_tx0_rx5_regulators),
>         },
>         [TCSR_USB4_2_CLKREF_EN] = {
>                 .name = "tcsr_usb4_2_clkref_en",
>                 .offset = 0x5c,
> +               .regulator_names = glymur_tcsr_tx1_rpt01_rx1_regulators,
> +               .num_regulators = ARRAY_SIZE(glymur_tcsr_tx1_rpt01_rx1_regulators),
>         },
>  };
> 
