Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BB86B39A040
	for <devicetree@vger.kernel.org>; Tue, 30 Jun 2026 07:27:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782804433; cv=none; b=IIFHOJgT/jNktuca9nrZzeYYsrM+oskMkUu6tjoArCFpDnRrRp9k26U+v6gDqbOazXRbfCl0m8/DEHtCQNNvZ40mMQNsupTTURPKIS9KJMkzXjRK+Ct+BhSFC4llTr6zd4YmdwCv6EVa6KPgACTFGAHVdqfKe/A2HY180htkrqY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782804433; c=relaxed/simple;
	bh=YNCEyHJM1ySzBsalU6UojRrbYbeNUuReV/pYWY+/FLE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=YBPuCAic3OdmXWrrhKtWrpk/GkhAgTvHEQbj36iXNXIBH27gTufpc3BaflfhNIFkTiFsSpxvTCMxYxX2ps6Zh936D6tb/9oC8oupMVgXMmgd9W0foHbGBpUeyamCuku8q2dp9EURDitR+S+FCyyR6prZlQvx51KBFaaVHPmWH0Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Wa08QrgV; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=RI2OobMA; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Wa08QrgV";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="RI2OobMA"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65U6CKoD1008585
	for <devicetree@vger.kernel.org>; Tue, 30 Jun 2026 07:27:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=YrJC4pvBdbgv6oTNYdiDl6at
	7BfUo6flLNg8BMMb+q4=; b=Wa08QrgVpDS7GRxf4ori9b+dmuAbzzzrpt/KVDBf
	zH3tDQ+q69FksCNjEE4nEcglEiAKowC8WCuj+4iKvpF+LviIXruQmW90YAJT90hA
	wuCcVPlmvd4jO3iS0RXLAaNVzd6QTcgBpliVvr5YUeNsDHmimNPiHQwMb2g+mJtn
	Eavw+J1dFYaIgqhwXSKehGOVPX++a7P5MNI4kyFV1Vp/k6i9BzHm2/WD1LcEzLSj
	KvnX4nf7sOIyBFxvcYjJNtj0lzl/bd7SDHzY7Wss1jdZ70rQozjFQpaS3Cy8bDtv
	CJee2iMG20vqRjPi5oc7WQc1xsJCodB0IGS83jf86gBSWQ==
Received: from mail-dy1-f198.google.com (mail-dy1-f198.google.com [74.125.82.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f3yw9209v-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 30 Jun 2026 07:27:10 +0000 (GMT)
Received: by mail-dy1-f198.google.com with SMTP id 5a478bee46e88-30ecfc5dea0so1876045eec.0
        for <devicetree@vger.kernel.org>; Tue, 30 Jun 2026 00:27:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782804430; x=1783409230; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=YrJC4pvBdbgv6oTNYdiDl6at7BfUo6flLNg8BMMb+q4=;
        b=RI2OobMAT7WVoB2Bu7ARi0IyTVCOxPef4bPhVEkvqV24FM8brzdsxzq9SvPaJyCc1O
         vgr7Z8xKhHXZeND1pHvGm3zQRv7oxvy369f1LzKLBxMnTRWt2dTHwDCTPSDavwWX4s3Q
         jBunuct2Ao1k5pa9Qs8E6yvO4kGS/hIta4ANOF41ojYANkMsxA1hrczS8TTA974pbD/z
         JIkA5YYoXznEUBc8FWbEjOANVJNRUCPixm1W2hmUj8SuezxfR8QeVSZcOdr5Cs0pmp99
         3RA7O33i2cNPNN+ajNin89vDy3A0WBNVNGuhuQU+d8PasrSUBh7rUJ6+k1ROQ0TFBh5t
         Nk7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782804430; x=1783409230;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=YrJC4pvBdbgv6oTNYdiDl6at7BfUo6flLNg8BMMb+q4=;
        b=AB4RO27wJnCBVitXh/HSO856ChIvO8wXzK3wUZE9mPsf2FuAEbspRlGoI/ATHj4Pt/
         /Jk+2SNztuZZZERbkyYsUykyYoqSyKY6ID7p8YR+KuwIDLJ71kSSygtYSZhvEnN82ovT
         pA30Q4LmMDUUF+lnksqM4Jxw5jj77EZOA+zwi7yJ1GslXVh7JC5V+FxdRpLZ/UJzdm6i
         PGDQy7SXwWFRiyAA14Ch++jKtEYTNpN08EQXqELvtSoYfbHSLXgVunV93vwSbryZjL0L
         QHHo9bhYqzQjQgEHf3Pb2qQj2G3QNfV39ncqkaZOJIxXBZmHiPZUPTvtzeme7uTqQkWX
         gx6g==
X-Forwarded-Encrypted: i=1; AHgh+RrvAAw8bBWNE2DKaDYNWrRCzGfI65vjilDmKq0E5mi2JbqcZXl7YcozyQFKv5z+qtcMbi/ukNyWCoot@vger.kernel.org
X-Gm-Message-State: AOJu0YwQwOhxVFj8vYOAV5RN4glaxLaE5a5CT7KYL57F4Gt3e+hplvDY
	rlB56JLZEtcUx23kXqtmuipZhtzf9Jn/WkDekpMdSqxd+r0Xpum6sHLZhPtawYFG/m5rtJ5LR0M
	2bdMWVtaiiPyesGgpyPfBmTiXeMknZ9YRFLwIQA3XWJNclZvsXo5qsYGpGia9hWA7
X-Gm-Gg: AfdE7ckg06J+1DS8IKtErrNFm1Th4LMBuQMl8kOQs6PfkL21SrHfFZ9PDvtYb4eF1Mt
	h3w82toMh5iOJeVyVG18Ij8zXQVLTekIrh9W37nG3ocbXpfUbP53jjzMvHru3JNUEldZY0nIH17
	Lop37tAJoF77eAdVj/JATwIbwi2HnxsQu3woyGddWbVY96OEoGWHIsK7eSMnHZfd4wA1zgNzDu1
	1B711nQ7yiuw0fVDBao4Imla6Y17SNyGIaKRzLqdH1z45dQ0DqHlioduVkpx9fj7emNGEzTGsv9
	IqlyR/H8rkTyDVH2oqDiY7yfffvQ5rflbendDcKbsaBEbm6vJcFGDnJWtgBV3LGcXtlcoWlAQJ/
	ptPVYjykv4M4MAy698mKf/4ZQAoN2PSOk15MWwQC7SOK6sU4B0LmcrVdBzKaISK/aEYEWjYa0Gy
	OY9iTvjLfb4IPpdzL5GPmsy5HcQlJ7BnvsvjqmDKA2
X-Received: by 2002:a05:7300:6406:b0:304:d92a:e60a with SMTP id 5a478bee46e88-30ee1478ee9mr1883222eec.31.1782804429812;
        Tue, 30 Jun 2026 00:27:09 -0700 (PDT)
X-Received: by 2002:a05:7300:6406:b0:304:d92a:e60a with SMTP id 5a478bee46e88-30ee1478ee9mr1883192eec.31.1782804429243;
        Tue, 30 Jun 2026 00:27:09 -0700 (PDT)
Received: from hu-varada-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-30ee31711acsm4908720eec.18.2026.06.30.00.27.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 30 Jun 2026 00:27:08 -0700 (PDT)
Date: Tue, 30 Jun 2026 12:57:01 +0530
From: Varadarajan Narayanan <varadarajan.narayanan@oss.qualcomm.com>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH 0/2] Add APSS clock driver support for IPQ5210
Message-ID: <akNvxVS/EW8LmS7e@hu-varada-blr.qualcomm.com>
References: <20260629-apss-clk-v1-0-8c92fe118ce4@oss.qualcomm.com>
 <20260629-resilient-lucky-lynx-d9db0d@quoll>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260629-resilient-lucky-lynx-d9db0d@quoll>
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjMwMDA2MyBTYWx0ZWRfX1VimZPGKMyIc
 gGs5QQPXI6g8vm3pz/gvUt93x29qB1CFx0R3QWJQpBBKpKmq7nhsgUz6FL7kv42SwFoc+apOeac
 ZaB0pP/VnYq0tCVix4QKCOkyyZ9askw=
X-Authority-Analysis: v=2.4 cv=KfDidwYD c=1 sm=1 tr=0 ts=6a436fce cx=c_pps
 a=wEP8DlPgTf/vqF+yE6f9lg==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=kj9zAlcOel0A:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=EUspDBNiAAAA:8 a=7cbKSgm_W0bIH79rPYMA:9 a=CjuIK1q_8ugA:10
 a=bBxd6f-gb0O0v-kibOvt:22
X-Proofpoint-GUID: ZSGXqFmpiEN4bi058jl-HS-8fOTnGk0A
X-Proofpoint-ORIG-GUID: ZSGXqFmpiEN4bi058jl-HS-8fOTnGk0A
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjMwMDA2MyBTYWx0ZWRfXwETXhenTg9Z3
 r0YpQ8REQOggp0UTpsnrPPWl+9KqOY4QOzBS4hAFuHCtyPZM9NtuTUl7EyhfaGLhfsPSoI6vJbb
 5byZqMsxV8RhI7Zqy33Bjf3ylQRTuvfc41/QeTnttySkmZ5E1a/l6xryKk/pF0B4J7XrGFexM7S
 CaIJk8ZJYHjSfUvYcZwrTHIgJL2OJ8MFkD6wwkSw7MqPp3TgwZJSkeaA3fB0n7EV9aogMKFCjbF
 LGtlx3CldTib2k7cC7Npfg7ROT/G4ju17l7LwBn2O0KQ2Biflpx+L9WV9ul+i2KR4nxew+VLM+M
 abKWEnIib5UKQZSEUcQcQz6HsbrI4zivQBBPV+zo0KIi9E/v2iAvOXJsPdxbCrovxgkocmm4uVn
 nwLxEaaXbBZMbhSarlAFVZuUtgmPYZLdaE3oJ4hbpAaixpKqTR1S/hk6JlRNWZeT5Ztrh3Kf+3V
 qR0pmgXlOHRd8V9dfaA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-30_02,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 phishscore=0 impostorscore=0 bulkscore=0 clxscore=1015
 spamscore=0 priorityscore=1501 lowpriorityscore=0 malwarescore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2606300063

On Mon, Jun 29, 2026 at 09:30:11AM +0200, Krzysztof Kozlowski wrote:
> On Mon, Jun 29, 2026 at 10:08:41AM +0530, Varadarajan Narayanan wrote:
> > IPQ5210 uses the HUAYRA pll for the APSS clock. This series adds support
> > for the APSS clock to change the CPU frequency to one of the supported
> > frequencies.
> >
> > Signed-off-by: Varadarajan Narayanan <varadarajan.narayanan@oss.qualcomm.com>
> > ---
> > Varadarajan Narayanan (2):
> >       dt-bindings: clock: qcom,a53pll: Add IPQ5210 compatible
> >       clk: qcom: apss-ipq-pll: Add IPQ5210 support
> >
> >  .../devicetree/bindings/clock/qcom,a53pll.yaml        |  1 +
> >  drivers/clk/qcom/apss-ipq-pll.c                       | 19 +++++++++++++++++++
> >  2 files changed, 20 insertions(+)
> > ---
> > base-commit: 533704f3c28c3f5f9e2542aa3a6a326c32e6f5c0
> > change-id: 20260625-apss-clk-ed39c40ed468
> > prerequisite-change-id: 20260515-tsens-802eef7a2cf6:v1
> > prerequisite-patch-id: 55c7e7f58ff80ecfed956707a9a893bbf59ef74b
>
> Really, how?

This patch is part of the series that enables cpufreq on ipq5210 that
enables APSS pll, then enables the mailbox, and finally the cpufreq
driver. While testing the cpufreq + thermal sensor throttling, needed
the tsens related patches (both functionally and for passing dtbs_check).

Will drop it and post v2.

Thanks
Varada
