Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2641147CC72
	for <devicetree@vger.kernel.org>; Tue, 28 Apr 2026 18:55:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=205.220.180.131
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777402515; cv=pass; b=OCjZEz9K82zy7iDOf6kmEKu/pN42Ndk9SQjZHSOwH/0W6NJAeJYemgc8iAePti43pwqXrAhc4r7+KLKm98RvQP6Lm0i59etdvz7ode+FhrvFLm0tYrVHcQNFdQIdRMDOlbZAKoPAsPH9m+9jNIXuwAynVCSkyef/JjzvKGnGokA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777402515; c=relaxed/simple;
	bh=48YB3Ndqy1orkOBGaDNajZ3kV1mp4TNcdrH+V5/Taa4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=LWmurJ5G82cvwggNPefvaJBzWYceBNhvZ2aFZRJ7BhXFbshoyCLXvjR92RpOC6A1gtGTVg68Yedhk25rDQFZ2OPC/BqQl8OvCyKiTYpk2qS5s+39UK41i8CNVcwHxtut2SlLtVK2j6yZt4nPMkZmLv0cUfvtOIi0qNrckKSa2+o=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=or8t01Tz; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=kjDiTBAP; arc=pass smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="or8t01Tz";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="kjDiTBAP"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63SFsPmE2946198
	for <devicetree@vger.kernel.org>; Tue, 28 Apr 2026 18:55:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=442/8iOej5uMFBsrBy8C8V1f
	bre1zWZUcI0+Mu9/ZKE=; b=or8t01Tz4Y1qEm952d/nrUpv8nh2kDFsOPGBOH74
	WfVes2r44YAE84N4PaJ4tcozPzqROiqVg2M11dEEwahBvY6am9IpItoHf/4RTweH
	+por1ztFf97oGh9ef7rhH+6szEiGS+OTLab3yKfwI2AxYkA8JeN/POlHaXcoqsoK
	ASoqQUjw73dh7hj8nInq9uhLDWVJ5X0zAg9kwANaoA6kyN67DZc8ECC2SBzpaMMv
	5SCA+c2nkmepwnAV0FV8IynSkD2ZZ+taeUPnrKnHTzlJI/KgM0yOezh4pYYiUrcw
	b49rgL5rw664VtPF2X6lX4voeYrGff9tMp2JZ+a6EjAFgg==
Received: from mail-pg1-f198.google.com (mail-pg1-f198.google.com [209.85.215.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dtnhakcd7-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 28 Apr 2026 18:55:12 +0000 (GMT)
Received: by mail-pg1-f198.google.com with SMTP id 41be03b00d2f7-c799a65bad2so8844592a12.0
        for <devicetree@vger.kernel.org>; Tue, 28 Apr 2026 11:55:12 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1777402512; cv=none;
        d=google.com; s=arc-20240605;
        b=XDBIyUom8T5yYNt5wAdBBrUiBoPjxwOKpOJLUEtMxkrq6jNlC3PFrlilTeFZWt3zZS
         FpVnkXDOrfKY8ZNIBu37YQlhihdV8/3K9UsSFLQfMqsAH6PLhToG0xlmV4Q6OuyHu5Rf
         dNLZS8mGnMGHSYDd+duXIczy9RtfVx3oR/XyJtvaLGZ4+9ThXilqRYHbpciDJPnvdbUt
         LqrAfqdspY04Ie8BV7YQKclEI+OVjD9CILTx3fMZMcUQfC2MQotSLoyjUnij1Ol19s82
         G5scLZDO+nXUjXLh0R75gQu0LPTViXHsXXhJaFtpq1gncZcqpbjq6MG4pXd01P1TBGpn
         9CGA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=442/8iOej5uMFBsrBy8C8V1fbre1zWZUcI0+Mu9/ZKE=;
        fh=9J1LaNBvrlug1ZzHitJNXuCmVQqP4aq0VDH8IrxjVqE=;
        b=hMes3I9B9/bI6anwKtm2KavOwAJNFXupLeAGF5IJeUQoAdK8KeaPYIWu0AFsKNKTAz
         406EDb9YppyyW5XJUCoUhjUSN97mB+VLcAt1gVU80SL5Bf/MtZpy8g4BeVj0emb2z/iR
         h8NkGd9GlKooff3i/yLBrpay3tMkV8CtRJmlyRQRMX4o5hPPcmvszLeAkDK9QIb01D2k
         yw/5EAjkQJEIK+7JX0SIeRVusLhzlLzr5yvmQPaA+e77DZoHlEs+vWz8Wrn865CA1N0q
         9j/gyHgMxpZBB1mPifYX1yVwenlCalEs94HPxXx+ACCAgPaik1VlI5R1SVocsLK6tlw6
         +wxA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1777402512; x=1778007312; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=442/8iOej5uMFBsrBy8C8V1fbre1zWZUcI0+Mu9/ZKE=;
        b=kjDiTBAPpTpQfr8TvSyZy7jjcbwhWdx362hfAblCd0WaA8MQ8jd5roHCDkGxLef6Xf
         w7it05j5t9s2CuJvWSXajPXD3l1iQhTlo8YvXu6MQYwwVmFYVyLxMC1A8fpy2/qsTLgJ
         Bk0238zf+x7tHXRbjK9rUaYYLzYfvuATKRmP6y7pQeB2Mq74kbKTfaAyxb+0fRZnhauO
         gVb9kG3vecz3AlBAcGljF7+MftxaKmzab7dKD2yp2uP7zRuukGQqC7m7nnDkLSEcbIJa
         SoIETQTOjbMl3w0aPfUkFvwA6yz2TqzulIvs/1s5SVNC/iMahEnc02ZiVFpV1z/ilppw
         xDKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777402512; x=1778007312;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=442/8iOej5uMFBsrBy8C8V1fbre1zWZUcI0+Mu9/ZKE=;
        b=e82K7rx9U1oARQYBvOY7mrBIJkS3pFJdtiBRdQ4KyB07IEuyN6RrjhZo/hlue1WhnZ
         6Bf7DvnaccvApc9gR9kDt5S8yOJwqDoKiOpG0+pDgslmpZe0H3MolX5OybXJciODwkx1
         LcWM78hy4ABQwDhwqKGirvTOrL6Rgf1QqxugSMppQhY5p+Qz9MGmtwhRBqNpErf6NlVt
         SmXzDZBH9IPHpUX2bg97BHAWOc+cc114pNAPmiLDLMOgslMT0z24Zyz0crxKh3wlebfY
         t6gAW1Zy0qQIuh41hX8QwXkghOzOm0Hf5px+wkf7g1040kAataJZL6Kp527utfh1KnhN
         7vdg==
X-Forwarded-Encrypted: i=1; AFNElJ+sqZnN6tmHgZ11sa5mFThKycL5p5znNo3FqZUycquBnjiVKp3dYZ9D08kGZTyMiCyU9a/fjzWxBEKB@vger.kernel.org
X-Gm-Message-State: AOJu0Yw+SOuRT28kDpwSZXt257Q2gQqPILyq1qzy9pspH7U5ai7oZF2r
	+TDEPIzn4XhVHHm3nu6osgxDK/JlxXwU3/5emogHpqJjeSd9S4TKZmXgsYppGHz284A8FqTWCXm
	2a6uhpeqsftbferbDudJvzmf9MSl/JcYZenYxyUH3Z3Nd9rMw3lSrv/beCbHsncf6tBJ07PByqI
	HEGTozAXnSYm31Ozr1t34nbKop3EQRpmjLA/X5MYI=
X-Gm-Gg: AeBDies9eUHOQ4LZdqkvkvz3qoKpPS/qO8a0ViR3+QroH1RCiCoz+XoLA5dTOeTY0jN
	E2KkkGglcGT+/hr1uiJn98MV+hV4npWqMzc6blGHq7FP22fDMa2GUIIrkNe8NSVjPIccEfGQdg/
	I45syAUDSfYLcusy8svAYGaSBPtXJjb3Y8Z6INiMZWi3SNTY1feKoiBi6ggPZk+SbsMGq/47WpH
	PMTkpXf0NNPGhLSD4a1gXY2oao4XBrdQjOTX+9XGfTcgX4K
X-Received: by 2002:a05:6a00:4206:b0:82c:9223:cc95 with SMTP id d2e1a72fcca58-834ea57fb2cmr557834b3a.1.1777402511964;
        Tue, 28 Apr 2026 11:55:11 -0700 (PDT)
X-Received: by 2002:a05:6a00:4206:b0:82c:9223:cc95 with SMTP id
 d2e1a72fcca58-834ea57fb2cmr557786b3a.1.1777402511417; Tue, 28 Apr 2026
 11:55:11 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260420-cesta-sm870-dispcc-v1-0-eb27d845df9c@oss.qualcomm.com>
 <20260420-cesta-sm870-dispcc-v1-10-eb27d845df9c@oss.qualcomm.com>
 <vnil4gbkpenxo5o2a2df2ziuygqyyrzsj2bygqewm7n2rq5kbv@qbntqftfpsky> <008f2f0a-2367-4d8e-b6b7-2421a4de88cb@oss.qualcomm.com>
In-Reply-To: <008f2f0a-2367-4d8e-b6b7-2421a4de88cb@oss.qualcomm.com>
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Tue, 28 Apr 2026 21:54:59 +0300
X-Gm-Features: AVHnY4IiC0s9loCkcUtYnjwZYf6U05xc0VvVRDkF4BRux375tv-oGwdPaCptzn4
Message-ID: <CAO9ioeXQHDYRPW6HYQ7XXsmf1ovpJyqaXgnGaDVnACb3PW7oOA@mail.gmail.com>
Subject: Re: [PATCH 10/13] clk: qcom: dispcc-sm8750: Add support to control
 MDP clocks using CESTA
To: Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Neil Armstrong <neil.armstrong@linaro.org>, Lee Jones <lee@kernel.org>,
        Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
        Imran Shaik <imran.shaik@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org,
        Maulik Shah <maulik.shah@oss.qualcomm.com>,
        Taniya Das <taniya.das@oss.qualcomm.com>
Content-Type: text/plain; charset="UTF-8"
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDI4MDE4MyBTYWx0ZWRfX+oOPHKDAnXk/
 buci6b1uNPyFSEEn1sOaJbfN+Cau+8a6TyWvxKCNKPH+/bPV8rA4h7Dh2IZWJ6+AO7trK0j4gQm
 LdYPyLu5l2xyKlvkNkpROdZjl89uGdCROfh/8vjJv0v2XJt/APX0rwTEXILDYlT+4+wCTL6jsUL
 J5oHjddKKJobUrJOAtAaFdSVB0ylC4R5J3OTXmLQv6KFiFNBibucKGNKwt9moJUeaU8n2jzEibP
 m41xbBG9hCJVl069DN64jelrv4EibVJ5M7jG7PfoHbstBh8o4/8ihc1EMcSRoeLkwITkcFUvb3h
 LR8Hw6EZ4zD32V32iOUuGgQSEAMUhzBlY8lbCXPUHsEXfyl2JatLF5tFn9U3bF7JftivTlNTrVV
 Tl/KmHRL/+91S0NCN/hc2GJkHpbt96UDlSuOtnXo5lLDBtig+gXjTAwBijHwML+1fTAtZhNpCC8
 eosXjEG5HdeuQlVkIjg==
X-Authority-Analysis: v=2.4 cv=JoDBas4C c=1 sm=1 tr=0 ts=69f10291 cx=c_pps
 a=Qgeoaf8Lrialg5Z894R3/Q==:117 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=rJkE3RaqiGZ5pbrm-msn:22 a=EUspDBNiAAAA:8 a=4jyo0phO276cF_ToP1MA:9
 a=QEXdDO2ut3YA:10 a=x9snwWr2DeNwDh03kgHS:22
X-Proofpoint-GUID: aXu7lbrpXbcILi5OR2-qZT_JXptL442p
X-Proofpoint-ORIG-GUID: aXu7lbrpXbcILi5OR2-qZT_JXptL442p
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-28_05,2026-04-28_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 lowpriorityscore=0 spamscore=0 bulkscore=0 clxscore=1015
 adultscore=0 phishscore=0 malwarescore=0 suspectscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2604280183

On Tue, 28 Apr 2026 at 20:22, Jagadeesh Kona
<jagadeesh.kona@oss.qualcomm.com> wrote:
>
>
>
> On 4/23/2026 12:03 AM, Dmitry Baryshkov wrote:
> > On Mon, Apr 20, 2026 at 09:59:03PM +0530, Jagadeesh Kona wrote:
> >> Add support to control the DISPCC MDSS MDP RCG and the associated display
> >> PLL0 using display CESTA hardware on SM8750 platform. If display CRM is
> >> enabled, the clock ops of these clocks will be updated by the common code
> >> before registration to use CRM specific clock ops, allowing these clocks
> >> to be controlled using display CRM (CESTA Resource Manager) hardware.
> >>
> >> Co-developed-by: Taniya Das <taniya.das@oss.qualcomm.com>
> >> Signed-off-by: Taniya Das <taniya.das@oss.qualcomm.com>
> >> Signed-off-by: Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>
> >> ---
> >>  drivers/clk/qcom/dispcc-sm8750.c | 89 +++++++++++++++++++++++++---------------
> >>  1 file changed, 56 insertions(+), 33 deletions(-)
> >>
> >> diff --git a/drivers/clk/qcom/dispcc-sm8750.c b/drivers/clk/qcom/dispcc-sm8750.c
> >> index ca09da111a50e811481fd862b54d454de024d1c9..328e43b52192702dbbfd1ed65737520acdd4a649 100644
> >> --- a/drivers/clk/qcom/dispcc-sm8750.c
> >> +++ b/drivers/clk/qcom/dispcc-sm8750.c
> >> @@ -71,6 +71,16 @@ enum {
> >>      P_SLEEP_CLK,
> >>  };
> >>
> >> +static struct clk_crm disp_crm = {
> >> +    .max_perf_ol = 10,
> >> +    .regs = {
> >> +            .reg_cfg_rcgr_lut_base = 0xd8,
> >> +            .reg_l_val_lut_base = 0xdc,
> >> +            .vcd_offset = 0x268,
> >> +            .lut_level_offset = 0x28,
> >
> > Seeing this configuration makes me even more sure. There is no separate
> > CRM or disp-crm. The CRM resources should be consumed by dispcc.
> >
>
> The CRM can be used by interconnect drivers also for BW voting via CESTA.
> Hence it cannot be consumed by dispcc alone.

At least mention it in the commit message, please. How is it going to
be used by interconnect? Will it use the same API?

>
> >> +    },
> >> +};
> >> +
> >>  static const struct pll_vco pongo_elu_vco[] = {
> >>      { 38400000, 38400000, 0 },
> >>  };
> >> @@ -89,21 +99,22 @@ static struct alpha_pll_config disp_cc_pll0_config = {
> >>      .user_ctl_hi_val = 0x00000002,
> >>  };
> >>
> >> +static struct clk_init_data disp_cc_pll0_init = {
> >> +    .name = "disp_cc_pll0",
> >> +    .parent_data = &(const struct clk_parent_data) {
> >> +            .index = DT_BI_TCXO,
> >> +    },
> >> +    .num_parents = 1,
> >> +    .flags = CLK_GET_RATE_NOCACHE,
> >
> > Why? It wasn't there beforehand.
> >
>
> The PLL rate can be changed by CESTA outside of the PLL callbacks, when a perf level request
> is sent via CRM API in RCG's prepare()/set_rate() callbacks. Having this flag ensures that the
> PLL rate is recalculated from hardware every time when users query the PLL's clk_rate node,
> providing the correct PLL rate configured by CESTA.

=> commit message.

-- 
With best wishes
Dmitry
