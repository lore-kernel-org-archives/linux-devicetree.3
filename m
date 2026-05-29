Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7BB253AA4F8
	for <devicetree@vger.kernel.org>; Fri, 29 May 2026 06:45:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780037112; cv=none; b=A3t4uKJ4GdMFfVJ8XplnVUKm3FLa46cqDIhxYTGpdP4iRM7wXxOUX7I+CgPlGK10w3JdkPKC2/lsWLnU6W7jVtlv4Tu7rL9vEQB4WDOUJbRDVPq7vmWnrgS/w7yyBqTtHr1ryw2iJGFFsYlaxPHyHig9aO9drgZiyfZjgdmA7fg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780037112; c=relaxed/simple;
	bh=yD3JbYDQBS5NzV5O0cc+TWqONJZR+mmEz5px19fiHzs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=oKGhWCvPPMsqY827j/xKsPsf6qU1ABusbgtAPwi01K6bZwdAKyjhjTJyauwm0m+QP0HFZibQX0KKp+5YTkBqMZZik4LessXDdtCCMB5dKObkNZQNxrIfBYCQw6mN9EDxr3lbHLmfVWISH8p3DwEoRpphz70g+EaTjfswy51s3ww=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=maZeyC20; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=AoJ+9I4l; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="maZeyC20";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="AoJ+9I4l"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64T0A5dJ1495603
	for <devicetree@vger.kernel.org>; Fri, 29 May 2026 06:45:10 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=OkAKhyTC8qeodj38nW8B4+eA
	ShB0PO29nLWU3roLjAc=; b=maZeyC20sx8mzzSMqayJkE96HLs1XT/jkQiSpMyb
	XNuilzPsohU2dmwrpPPctVrYqHDSStW9grAjtXieEJtGL1ePem39iYHYCmqP0vcU
	hZx8CSObtYWFxz/8/LNYGjg83yLP1yF0QLmB9S1In8fdwdDAhSReeYqNhN2FBpra
	9dgQAs7eDNG0aALJ5Z49/1i9d4r+76VWO/EpLgxcvbQLYpW/zFNZCohu0Nxn9Eyd
	ImZ76zVcCZC/8vPh7G2Ylt8Z9mpp2hSira36yw1RHstjye3TaayFSlWXwxCFhvSh
	P0wO2bg1n6DYLeE5NPmXzB5yJZFaqeMAjPoerYZ7M+2SXA==
Received: from mail-dy1-f200.google.com (mail-dy1-f200.google.com [74.125.82.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ef01598f7-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Fri, 29 May 2026 06:45:09 +0000 (GMT)
Received: by mail-dy1-f200.google.com with SMTP id 5a478bee46e88-3041ab826ddso14060091eec.0
        for <devicetree@vger.kernel.org>; Thu, 28 May 2026 23:45:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1780037109; x=1780641909; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=OkAKhyTC8qeodj38nW8B4+eAShB0PO29nLWU3roLjAc=;
        b=AoJ+9I4liq2QmegSii/FgufWS+0S23kcaRmU+fL7I2jq2Cc1qa4LxZXe53jXiHoG5P
         h5ntd8+3PIrsKVx90XhRpS3ypvriG/5LcqsDxVVuwPN33+r40DanHSM3eIBvlWLeSvJl
         SCf9MXRGEG0njr5yO2HJijhRXfVDkp1d3cXCtg+4KxzZg4mO/lCPcYrA3jbrug6xZQC0
         112K1/STvH89zmeWSB5q+KjUMxc1G1WmiI6xr6j5Bj/Gwo7qUCYQt6ajHuhF0NCcm7m2
         BVKYMCRkp0N6OkK6GKlJFYWFO1oGT26ZJyXUNSGRSPM6/j+puf/EuyftiaZ+l110drUY
         W9DA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780037109; x=1780641909;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=OkAKhyTC8qeodj38nW8B4+eAShB0PO29nLWU3roLjAc=;
        b=Biry5Mn46jDgZ4o5O0lU00lJwljf8heX1axe6/32o3kB2lnGr9/oPwFA5LnBX/Rq9T
         pvCmzo0HzJxZsKFIMOoRmszNFYgz6lkLMLpwN1HmaXxo66Nxzv7nikPXw/8kAzy0QJHv
         PEsQrxw7Lq0pDuftNQ/g2AxEhX832MPr68pv5+ciZDXQPRk34s2dS8wVpAX5Gsx1tMza
         mD6Ho11WTtLKV7MRr+Mu63JdyRQDKa26K8kMvzKhRAy6cuDypbLq37Zxeu5wx8F8mxYC
         Y4diw+bwXTjzZj9R9Gif+FTohy3LvYFVmd+BQ7p3M6LF191gax0PVFIQjr1leOYTsGpb
         Q99w==
X-Forwarded-Encrypted: i=1; AFNElJ8myvgi7kEP3RzCDkpP7OFa577oQE1w1DTGHXeTOgrkwwxAizamlwg0ZdTl8rxDsAcrLvEm+AdpD2IM@vger.kernel.org
X-Gm-Message-State: AOJu0YxMrsZm3AVJDeEoSG3Jz6nZnrOtswWoa5ohNg7ooPR1PC4asKZm
	YbGeq7Mdfk0ka845G4Bxg8mzrkHw+a9z0NnvF7N6faOFiysfN6yd6n2evGlh5CTLW7ZSSL037YA
	YVRF723iIrtTGRScyRonr+49tyrnflPk4axV+fKG1KPJl7IgZwl7VWXBdsyAxgIrb
X-Gm-Gg: Acq92OHqjFrsUFZxFBisETVhZisLcCCZcBj6uXSwGgAB6IEJCmJs6NAnS66DneMItTd
	0nYDfymk1+TXTSOCjw5tMl69F45PwAH3+S0h7ICiQaseqZB4ZVWfdlXLYkS5ZdxvtZeRkw+30NK
	EJkyHv4hit8f5oDzpomM6T2ql0Gpp2GTDpmpKBx3HxCRoUIkb0UALnqNk/lJVXvnrAtTf4EFM8L
	dAoiGACyp9hamudurn2htvI+/BXDCoPbxnZIuSqBta6YhQr1ion7Z99SHflkN8WM0k4DuiIhrAc
	UmlXyvbEcmZ+csoyYz7t9UmrC7ow3iZgyUG3ht9VSFoLjw4ps0TBe9zxjOa+NMORE76UVN0JbjR
	O3cIjK+D60E9En9GVwdEIa1hGLRFMQDfVoDuWRjIaawmSFpMbjdyPd57D5/Ktwvnn/EDagy7OXd
	lAaCc=
X-Received: by 2002:a05:7300:a984:b0:2ea:ed70:3ea8 with SMTP id 5a478bee46e88-304eb113e65mr737649eec.29.1780037108587;
        Thu, 28 May 2026 23:45:08 -0700 (PDT)
X-Received: by 2002:a05:7300:a984:b0:2ea:ed70:3ea8 with SMTP id 5a478bee46e88-304eb113e65mr737629eec.29.1780037107884;
        Thu, 28 May 2026 23:45:07 -0700 (PDT)
Received: from hu-qianyu-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-304ee0dd8e1sm690953eec.21.2026.05.28.23.45.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 28 May 2026 23:45:07 -0700 (PDT)
Date: Thu, 28 May 2026 23:45:05 -0700
From: Qiang Yu <qiang.yu@oss.qualcomm.com>
To: Jie Gan <jie.gan@oss.qualcomm.com>
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
Subject: Re: [PATCH v4 2/7] clk: qcom: Add generic clkref_en support
Message-ID: <ahk18dgPtHOvPs1l@hu-qianyu-lv.qualcomm.com>
References: <20260527-tcsr_qref_0527-v4-0-ded83866c9d9@oss.qualcomm.com>
 <20260527-tcsr_qref_0527-v4-2-ded83866c9d9@oss.qualcomm.com>
 <332c5b1e-8b70-4902-99f3-536dfe8e32bf@oss.qualcomm.com>
 <ahg9uFs1LqthstWi@hu-qianyu-lv.qualcomm.com>
 <791b1b88-d2d1-41f3-8902-d63dbd524bd7@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <791b1b88-d2d1-41f3-8902-d63dbd524bd7@oss.qualcomm.com>
X-Proofpoint-ORIG-GUID: EyXD5Xw1AGZ0J4ydoHYPl2T7L7t39Ah-
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTI5MDA2MyBTYWx0ZWRfX99+G74YOr+TE
 nAbvJHhuwK0hgNMrNMX+IAbY7Ak0CVRrrsdcbFdh15KwRex6iVo8xd3o7nm0UrIrIOeYrkBqBO7
 dkaiMexe3jokE6W2+BYIgdK3nkq7bpoJsstzZ/2eSt7fctXbyL4jLVA1NvKPyCQHoOhCCA0+Rzj
 hlqrBpqzEpm6ntY+4IQjBygOLysPQg14vcqGoptqH8krybICP69JT1QfoC6hlCdAqdBhAxYHMKD
 2cpzgrkfJx3c91GKkq8wuTiL3JfwRQc1eX7BO5QtukC/xAW1MlpR3VqDciyjtE1JUc5ifC5zjY/
 Q50JJcvL6j7c8prY/J3rs+3rJBbWJhhLrGOMM76yfwSikwPls3mHVnA6HOGWOX91BREYZJjB4mg
 7gbdGLBOh6EDYobjwEShRt4KoHT50kisI6BlEW8HGLP/HLoGbds0KVvMK5kEY5paR5t9Q1UqyKy
 3+ZsKe9Ius1cSlLhTDA==
X-Authority-Analysis: v=2.4 cv=DIG/JSNb c=1 sm=1 tr=0 ts=6a1935f5 cx=c_pps
 a=PfFC4Oe2JQzmKTvty2cRDw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=kj9zAlcOel0A:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=789t7zhfkhQS7FZYgY0A:9 a=CjuIK1q_8ugA:10 a=6Ab_bkdmUrQuMsNx7PHu:22
X-Proofpoint-GUID: EyXD5Xw1AGZ0J4ydoHYPl2T7L7t39Ah-
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-05-29_02,2026-05-28_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 phishscore=0 lowpriorityscore=0 bulkscore=0 priorityscore=1501
 spamscore=0 impostorscore=0 adultscore=0 clxscore=1015 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605210000 definitions=main-2605290063

On Thu, May 28, 2026 at 09:46:51PM +0800, Jie Gan wrote:
> 
> 
> On 5/28/2026 9:06 PM, Qiang Yu wrote:
> > On Thu, May 28, 2026 at 11:03:45AM +0800, Jie Gan wrote:
> > > 
> > > 
> > > On 5/28/2026 10:29 AM, Qiang Yu wrote:
> > > > Before XO refclk is distributed to PCIe/USB/eDP PHYs, it passes through
> > > > a QREF block. QREF is powered by dedicated LDO rails, and the clkref_en
> > > > register controls whether refclk is gated through to the PHY side.
> > > > 
> > > > These clkref controls are different from typical GCC branch clocks:
> > > > - only a single enable bit is present, without branch-style config bits
> > > > - regulators must be voted before enable and unvoted after disable
> > > > 
> > > > Model this as a dedicated clk_ref clock type with custom clk_ops instead
> > > > of reusing struct clk_branch semantics.
> > > > 
> > > > Also provide a common registration/probe API so the same clkref model
> > > > can be reused regardless of where clkref_en registers are placed, e.g.
> > > > TCSR on glymur and TLMM on SM8750.
> > > > 
> 
> [...]
> 
> > > > +
> > > > +static int qcom_clk_ref_is_enabled(struct clk_hw *hw)
> > > > +{
> > > > +	struct qcom_clk_ref *rclk = to_qcom_clk_ref(hw);
> > > > +	u32 val;
> > > > +	int ret;
> > > > +
> > > > +	ret = regmap_read(rclk->regmap, rclk->desc.offset, &val);
> > > > +	if (ret)
> > > > +		return ret;
> > > 
> > > regmap_read returns a negative error code on failure, but the
> > > clk_ops.is_enabled() treats the non-zero value as enabled.
> > > 
> > 
> > A regmap_read failure doesn't mean the clock is disabled.
> 
> Do we have special reason to treat the error number as "true"? Its worthy to
> add a comment to explain why.
>
I'm not sure. In some clk drivers, they return fail. eg.clk-branch.c

- Qiang Yu
> Thanks,
> Jie
> 
> > 
> > - Qiang Yu
> > > Thanks,
> > > Jie
> > > 
> > > > +
> > > > +	return !!(val & QCOM_CLK_REF_EN_MASK);
> > > > +}
> > > > +
> > > > +static const struct clk_ops qcom_clk_ref_ops = {
> > > > +	.prepare = qcom_clk_ref_prepare,
> > > > +	.unprepare = qcom_clk_ref_unprepare,
> > > > +	.enable = qcom_clk_ref_enable,
> > > > +	.disable = qcom_clk_ref_disable,
> > > > +	.is_enabled = qcom_clk_ref_is_enabled,
> > > > +};
> > > > +
> > > > +static int qcom_clk_ref_register(struct device *dev, struct regmap *regmap,
> > > > +				 struct qcom_clk_ref *clk_refs,
> > > > +				 const struct qcom_clk_ref_desc *descs,
> > > > +				 size_t num_clk_refs)
> > > > +{
> > > > +	const struct qcom_clk_ref_desc *desc;
> > > > +	struct qcom_clk_ref *clk_ref;
> > > > +	size_t clk_idx;
> > > > +	unsigned int i;
> > > > +	int ret;
> > > > +
> > > > +	for (clk_idx = 0; clk_idx < num_clk_refs; clk_idx++) {
> > > > +		clk_ref = &clk_refs[clk_idx];
> > > > +		desc = &descs[clk_idx];
> > > > +
> > > > +		if (!desc->name)
> > > > +			continue;
> > > > +
> > > > +		clk_ref->regmap = regmap;
> > > > +		clk_ref->desc = *desc;
> > > > +
> > > > +		if (clk_ref->desc.num_regulators) {
> > > > +			clk_ref->regulators = devm_kcalloc(dev, clk_ref->desc.num_regulators,
> > > > +							   sizeof(*clk_ref->regulators),
> > > > +							   GFP_KERNEL);
> > > > +			if (!clk_ref->regulators)
> > > > +				return -ENOMEM;
> > > > +
> > > > +			for (i = 0; i < clk_ref->desc.num_regulators; i++)
> > > > +				clk_ref->regulators[i].supply =
> > > > +					clk_ref->desc.regulator_names[i];
> > > > +
> > > > +			ret = devm_regulator_bulk_get(dev, clk_ref->desc.num_regulators,
> > > > +						      clk_ref->regulators);
> > > > +			if (ret)
> > > > +				return dev_err_probe(dev, ret,
> > > > +						     "Failed to get regulators for %s\n",
> > > > +						     clk_ref->desc.name);
> > > > +		}
> > > > +
> > > > +		clk_ref->init_data.name = clk_ref->desc.name;
> > > > +		clk_ref->init_data.parent_data = &qcom_clk_ref_parent_data;
> > > > +		clk_ref->init_data.num_parents = 1;
> > > > +		clk_ref->init_data.ops = &qcom_clk_ref_ops;
> > > > +		clk_ref->hw.init = &clk_ref->init_data;
> > > > +
> > > > +		ret = devm_clk_hw_register(dev, &clk_ref->hw);
> > > > +		if (ret)
> > > > +			return ret;
> > > > +	}
> > > > +
> > > > +	return 0;
> > > > +}
> > > > +
> > > > +static struct clk_hw *qcom_clk_ref_provider_get(struct of_phandle_args *clkspec, void *data)
> > > > +{
> > > > +	struct qcom_clk_ref_provider *provider = data;
> > > > +	unsigned int idx = clkspec->args[0];
> > > > +
> > > > +	if (idx >= provider->num_refs)
> > > > +		return ERR_PTR(-EINVAL);
> > > > +
> > > > +	if (!provider->refs[idx].regmap)
> > > > +		return ERR_PTR(-ENOENT);
> > > > +
> > > > +	return &provider->refs[idx].hw;
> > > > +}
> > > > +
> > > > +int qcom_clk_ref_probe(struct platform_device *pdev,
> > > > +		       const struct regmap_config *config,
> > > > +		       const struct qcom_clk_ref_desc *descs,
> > > > +		       size_t num_clk_refs)
> > > > +{
> > > > +	struct qcom_clk_ref_provider *provider;
> > > > +	struct device *dev = &pdev->dev;
> > > > +	struct regmap *regmap;
> > > > +	void __iomem *base;
> > > > +	int ret;
> > > > +
> > > > +	base = devm_platform_ioremap_resource(pdev, 0);
> > > > +	if (IS_ERR(base))
> > > > +		return PTR_ERR(base);
> > > > +
> > > > +	regmap = devm_regmap_init_mmio(dev, base, config);
> > > > +	if (IS_ERR(regmap))
> > > > +		return PTR_ERR(regmap);
> > > > +
> > > > +	provider = devm_kzalloc(dev, sizeof(*provider), GFP_KERNEL);
> > > > +	if (!provider)
> > > > +		return -ENOMEM;
> > > > +
> > > > +	provider->refs = devm_kcalloc(dev, num_clk_refs, sizeof(*provider->refs),
> > > > +				      GFP_KERNEL);
> > > > +	if (!provider->refs)
> > > > +		return -ENOMEM;
> > > > +
> > > > +	provider->num_refs = num_clk_refs;
> > > > +
> > > > +	ret = qcom_clk_ref_register(dev, regmap, provider->refs, descs,
> > > > +				    provider->num_refs);
> > > > +	if (ret)
> > > > +		return ret;
> > > > +
> > > > +	return devm_of_clk_add_hw_provider(dev, qcom_clk_ref_provider_get, provider);
> > > > +}
> > > > +EXPORT_SYMBOL_GPL(qcom_clk_ref_probe);
> > > > diff --git a/include/linux/clk/qcom.h b/include/linux/clk/qcom.h
> > > > new file mode 100644
> > > > index 000000000000..09e2e3178cfb
> > > > --- /dev/null
> > > > +++ b/include/linux/clk/qcom.h
> > > > @@ -0,0 +1,69 @@
> > > > +/* SPDX-License-Identifier: GPL-2.0 */
> > > > +/*
> > > > + * Copyright (c) 2026, Qualcomm Technologies, Inc. and/or its subsidiaries.
> > > > + */
> > > > +
> > > > +#ifndef __LINUX_CLK_QCOM_H
> > > > +#define __LINUX_CLK_QCOM_H
> > > > +
> > > > +#include <linux/clk-provider.h>
> > > > +#include <linux/errno.h>
> > > > +#include <linux/kconfig.h>
> > > > +#include <linux/regmap.h>
> > > > +#include <linux/types.h>
> > > > +
> > > > +struct device;
> > > > +struct platform_device;
> > > > +struct regulator_bulk_data;
> > > > +
> > > > +/**
> > > > + * struct qcom_clk_ref_desc - descriptor for a clkref_en gate clock
> > > > + * @name: clock name exposed to the common clock framework
> > > > + * @offset: clkref_en register offset from the block base
> > > > + * @regulator_names: optional supply names enabled while preparing the clock
> > > > + * @num_regulators: number of entries in @regulator_names
> > > > + */
> > > > +struct qcom_clk_ref_desc {
> > > > +	const char *name;
> > > > +	u32 offset;
> > > > +	const char * const *regulator_names;
> > > > +	unsigned int num_regulators;
> > > > +};
> > > > +
> > > > +/**
> > > > + * struct qcom_clk_ref - per-clock data for a clkref_en gate clock
> > > > + * @hw: common clock framework hardware clock handle
> > > > + * @init_data: common clock framework registration data
> > > > + * @regmap: register map backing the clkref_en register
> > > > + * @desc: clock descriptor copied at registration time
> > > > + * @regulators: optional bulk regulator handles for @desc.regulator_names
> > > > + */
> > > > +struct qcom_clk_ref {
> > > > +	struct clk_hw hw;
> > > > +	struct clk_init_data init_data;
> > > > +	struct regmap *regmap;
> > > > +	struct qcom_clk_ref_desc desc;
> > > > +	struct regulator_bulk_data *regulators;
> > > > +};
> > > > +
> > > > +#if IS_ENABLED(CONFIG_COMMON_CLK_QCOM)
> > > > +
> > > > +int qcom_clk_ref_probe(struct platform_device *pdev,
> > > > +		       const struct regmap_config *config,
> > > > +		       const struct qcom_clk_ref_desc *descs,
> > > > +		       size_t num_clk_refs);
> > > > +
> > > > +#else
> > > > +
> > > > +static inline int
> > > > +qcom_clk_ref_probe(struct platform_device *pdev,
> > > > +		   const struct regmap_config *config,
> > > > +		   const struct qcom_clk_ref_desc *descs,
> > > > +		   size_t num_clk_refs)
> > > > +{
> > > > +	return -EOPNOTSUPP;
> > > > +}
> > > > +
> > > > +#endif
> > > > +
> > > > +#endif
> > > > 
> > > 
> 
