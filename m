Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EEE753955C9
	for <devicetree@vger.kernel.org>; Mon, 20 Jul 2026 03:36:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784518615; cv=none; b=Kn17o1msVLBb281izDFYzTuMl12WnDougziCj1elv18f3ZOLc5kPHWO8xsUNX0pN8zXVsddWx6oagG+i6OivzTN8+a33DFNTnU7Sc6luT9lZdBF65uzcFZuXfNPV6vAYvIvdmbhezuOvQeXoRbKXoz52T9nImPYNBabcoY9Dl/U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784518615; c=relaxed/simple;
	bh=xLv/aWu330K++NYCqDc0UJZBLbxTXiIuOvcNUMdDkJo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=eYXEiQG8YOQU+UDWS/E4fi3G5htZP4D/DRpXLL9tJ3IqTRpgV6fE6Q/PZfBWYbtkTN9Q3zfylWbSsb+JBp397/dhQHEumbDgEUqBScijBhXxIedEylq20gUsD+t5p6fNcq8nMoAkXNo+oG5e/vapXBqTl6B8tKxDO3GKBj8m6SI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=pzGwnh47; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=eiKtUU9r; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="pzGwnh47";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="eiKtUU9r"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66JNtdIO411006
	for <devicetree@vger.kernel.org>; Mon, 20 Jul 2026 03:36:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=qEKVOtSGu6v1Xnn1gJvWyAkY
	8TDzed0RUUEE6gih+W0=; b=pzGwnh47vzDCNMF0WVXWhtl3v1FY9qJz7aRZOwLe
	mRzUQrFyXT9h87KVeq8LJSptvtIVGht5FXBlQx6YcDZZ7NteUmLRCateN7OzWy52
	jGUuZZmZGMPldFLMZQMITROZFSq5KreiTOeoHxWVh1PWlOqOCeYwTra+LukFLIhL
	h/mdnx4oX+DiuG3h1kzSuh1zvpSKJR+CJtkm8UC2AZCrW86Rq6dBzaXwIyjHcVGX
	UGB/wzfeMzImAaCRyKVHTcZX7AbYup8cZm11YuGp4mLAvT0GMarfJHJ3Y9fwQlRS
	vnE3L4kNnlNgP8YLotY7FGt5oIgfJ7Bh+lFpTjcwyq4feg==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fg2nhm5jg-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 20 Jul 2026 03:36:53 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-38e475f83a2so4982975a91.1
        for <devicetree@vger.kernel.org>; Sun, 19 Jul 2026 20:36:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784518612; x=1785123412; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=qEKVOtSGu6v1Xnn1gJvWyAkY8TDzed0RUUEE6gih+W0=;
        b=eiKtUU9rrNdrBRdsGtNahD4swc1mLG205cGUhn+u7SzSBfc3y9HFKh2aEBOUktJ4iC
         +Isu7jA7Qe29yIPKENC9K3MRiCQ/8NIcMlXYiTIDhZ36nhEDl0MWiHgSl24aUm/9aVAQ
         jdYjpaXBYBPvwqS9qpxb7HTWffuK7cp12xEhDbzj3ZwER8+KKWQ1NIGpirvXkDEvTEal
         MwUp/eYLrTm7Qo36WzaOa+Y7Iiw0/ikbauEodwZokUXEKUa0ceOYCMMkS2Hp8BO74kUB
         PjxQ7EB4K7ST2z/AwHXlww3LUjE4y6Ms1kdSngHbCWgv4z6b97l14okJq6m6yYfildS+
         VfKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784518612; x=1785123412;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=qEKVOtSGu6v1Xnn1gJvWyAkY8TDzed0RUUEE6gih+W0=;
        b=aznfngl5ajpupozT0BFl480+s2DFXKW1EUKSeanfo7oevnBusksOj8y9nlx+MftWJ5
         prq/lqx0Wh8IdXqkYCzz2H6O3VFW1MCaiXhSdLU0cDqwXY/XzdxGsSKOkEvEdmJ4ZX0F
         pnOLQuVzoxOCxfrddcrhsKPFz2Zwc9dcxuJb9uLj/JgiZEQhWYfoMvbaVwU8s7HIZxPa
         sX6nQ7VOR36SEuUUFlDHdVQzqTtNs4pRNJGiiL0Ju8MzfbHTU6969aQhe66IqSVs8QAy
         A9SgK8Nbu+MLVYnNpD5NmIqY/i8262wjhTJDeV5P3eHDdI5gJTZBg1tO5jEPRz+xp8Sq
         lNLQ==
X-Forwarded-Encrypted: i=1; AHgh+RqjSeJ154eg4blrQ0zkzmol1Vxgq3ZW9Hmxvom965s7Bzksr38vXxK6DOdKNTblvSqQXN9+WbaAmAgK@vger.kernel.org
X-Gm-Message-State: AOJu0YxKO8EX9vmlhp9LfBEx+DaQU/Jg4wLamKzyaNZAxlZ4pAi7tjnb
	Nvudzyh1pFerd5Qw5Oc/sl5eTh+OXp+HHbluv8VmhKj7u0het5uuBhHWrHpI5jk3j+5YNCiOIgL
	z/N10Tg6a/x3+WcYvHIeBL67BekDccPhuCwBaV1X7QkzaEkwsRwbAz0/yq5XsxfJp
X-Gm-Gg: AfdE7cm+VU9yJFJJxixEreQ0rko1iMyKkViXx2dqte/o8+3ohz7PycZzbqvM4p8UHwa
	1udCOwxDhowI3f6l9QHdDjR7Xx2sUYdJdhmAPZ0vBVCa4S9u4DxJkNetWZrm3kKShjaO/e2ZcXn
	Sln9RaTHgCcEnBVJaDHKRuAwhGYRWLpKiok0rO+GE0Uc1tW6gXzEw6rf7aZKyvg8jmiG5SeRMwk
	7g6fhRFPDXWj5vVS+nPSjPJNAWcUCLiaZ/vKGV0Aqdpg9rw77RPsm+adBilrINKKKVFjHqYt30R
	NobFZwP1g7lSP0ObKhEkiN85yPeLh36Azb4QLiqVtWO2L/n6uoPOTIVf0DxVeYcuJZfKksHYD82
	kENWfdomUEqAdbVhYAt8rVCwkBh8EF1IUGoNAsouwA8yDzlk=
X-Received: by 2002:a17:90b:4a08:b0:380:9157:d6c with SMTP id 98e67ed59e1d1-38e4b41043cmr13718739a91.10.1784518612421;
        Sun, 19 Jul 2026 20:36:52 -0700 (PDT)
X-Received: by 2002:a17:90b:4a08:b0:380:9157:d6c with SMTP id 98e67ed59e1d1-38e4b41043cmr13718723a91.10.1784518611968;
        Sun, 19 Jul 2026 20:36:51 -0700 (PDT)
Received: from hu-qianyu-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-13ce29c2a48sm22658546c88.2.2026.07.19.20.36.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 19 Jul 2026 20:36:51 -0700 (PDT)
Date: Sun, 19 Jul 2026 20:36:49 -0700
From: Qiang Yu <qiang.yu@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>
Cc: Vinod Koul <vkoul@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Konrad Dybcio <konradybcio@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-phy@lists.infradead.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v5 2/3] phy: qcom: qmp-pcie: Add QMP PCIe Multi-PHY driver
Message-ID: <al2X0Yx4GeRgA6mS@hu-qianyu-lv.qualcomm.com>
References: <20260717-glymur_linkmode_0717-v5-0-4f9e87a61463@oss.qualcomm.com>
 <20260717-glymur_linkmode_0717-v5-2-4f9e87a61463@oss.qualcomm.com>
 <alqrbpi3EbvV9RnC@baldur>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <alqrbpi3EbvV9RnC@baldur>
X-Authority-Analysis: v=2.4 cv=Le0MLDfi c=1 sm=1 tr=0 ts=6a5d97d5 cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=kj9zAlcOel0A:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=Y4lf73eBQ-sTD4myGQcA:9 a=CjuIK1q_8ugA:10 a=rl5im9kqc5Lf4LNbBjHf:22
X-Proofpoint-GUID: 6Kt_NORFbng3hhq29veu4_5o0pnPJqBN
X-Proofpoint-ORIG-GUID: 6Kt_NORFbng3hhq29veu4_5o0pnPJqBN
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzIwMDAzNiBTYWx0ZWRfX3xyoAK4M5zDg
 4eoeFJOXay7o+TjKJ3icYlwhITz2sseEiHDhKV2UVt5TEZNWz0nxI/N9zrjTxtGdptol5WzG6Jz
 lRTYk+2y82oz3/7tyL7XkP+ZbKBYlJGHwYzuq3oZFICKnSOzJgOdVsEqwwxIE7wMyPuoAQZsb+R
 RVzqLgmysR6Go6nAwW0woFP2Cko00a9Om173V4U62ipy3ehr0DTP8yKUBLKLXJNzBXK1tqw7OT8
 1JOZK3UQzSF7wU9udiQCFpKBnO6JVJ4EkJDo1NhJXgh4A6Wc3yjY+tYtCUMt8uHKA6gBjqL3VoR
 sh5lVTvGVtv/2pv0U9dfzCWLUm8DfLbjFgL1v3w8W0hnDXw3GeLi+qAfJeryw8S8WyA9X/2os05
 UwlV4aWqjP+ogeSpa1ZaBZO/vrSFDhWDUdK9hgqaAsZbP99gKlgnJ6YM0FtOCMVrw4id3yTS4Mg
 kI+wfQdVLDt5Fz38I1w==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzIwMDAzNiBTYWx0ZWRfX3ez01Js/CedC
 N4igGMecfnluK8zeaISYK7fHXJSdFzvgYhv4htS3AIn/yRvOxnqhmE8qzQBspK2X2zDCGbm1EzZ
 CFfXu9Y2yXyUvrDhUB+pvvrAJQ3+Xsw=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-19_08,2026-07-17_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 lowpriorityscore=0 clxscore=1015 adultscore=0 phishscore=0
 bulkscore=0 impostorscore=0 priorityscore=1501 malwarescore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607200036

On Fri, Jul 17, 2026 at 05:45:45PM -0500, Bjorn Andersson wrote:
> On Fri, Jul 17, 2026 at 02:58:34AM -0700, Qiang Yu wrote:
> [..]
> > diff --git a/drivers/phy/qualcomm/phy-qcom-qmp-pcie-multiphy.c b/drivers/phy/qualcomm/phy-qcom-qmp-pcie-multiphy.c
> > new file mode 100644
> > index 000000000000..b79edf2b7d5f
> > --- /dev/null
> > +++ b/drivers/phy/qualcomm/phy-qcom-qmp-pcie-multiphy.c
> > @@ -0,0 +1,770 @@
> > +// SPDX-License-Identifier: GPL-2.0-only
> > +/*
> > + * Copyright (c) 2026, Qualcomm Technologies, Inc. and/or its subsidiaries.
> 
> No, there should not be a year in there.

Ack, will drop the year:

Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.

> 
> > + */
> > +
> [..]
> > +static int qmp_pcie_pd_power_on(struct qmp_pcie *qmp)
> > +{
> > +	const struct qmp_phy_cfg *cfg = qmp->cfg;
> > +	int i, ret;
> > +
> > +	for (i = 0; i < cfg->num_pds; i++) {
> > +		ret = pm_runtime_get_sync(qmp->pd_devs[i]);
> 
> In the error path you will put pd_devs[0..i-1], but
> pm_runtime_get_sync() requires that you put pd_devs[i] as well.
> 
> Please use pm_runtime_resume_and_get() instead.

Okay, will switch to pm_runtime_resume_and_get() to avoid this imbalance.

- Qiang Yu
> 
> > +		if (ret < 0) {
> > +			dev_err(qmp->dev, "failed to power on %s domain\n",
> > +				cfg->pd_names[i]);
> > +			goto err_power_off;
> > +		}
> > +	}
> > +
> > +	return 0;
> > +
> > +err_power_off:
> > +	while (--i >= 0)
> > +		pm_runtime_put(qmp->pd_devs[i]);
> > +
> > +	return ret;
> > +}
> 
> Regards,
> Bjorn
