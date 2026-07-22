Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4FCE035F8D2
	for <devicetree@vger.kernel.org>; Wed, 22 Jul 2026 14:18:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784729933; cv=none; b=ZMCpZQsohrlgXywf508iuDEBYWLEiZWf9wC9Nzmj/Q7Gtuj5zRE8sAsde0v7RL3Sum4aVGtXFwJl5Qi5u1bnz/C7xRh9L83embUXV+pEBoT9gKBwcU5d67F1yXXH/BQ4o5Gr2YqXsJBTe3lc4XCHdknLt/SPeJA6bBWPnn7Rvn0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784729933; c=relaxed/simple;
	bh=VW0yyY8JykH8fAlc9I8k68jNlTSdPXYlp1Ov6aHWoco=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Rk8WOgZGYwCOYu65IV0WKiuoeh9J6OlFOZ5PFLH+iToirckwDfkk8vXpOV5YF5i7jJnFKZ/C5gbzRpEdeEErlAF3/7Ds2wgH2hYO772HJShr1T1Lcclbo7vrZ7n5jRSo/defwZmo1dhy3Yge8o3TFA097F/opImIVLlO26FksPQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=QBsYYn0k; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=befWHXya; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="QBsYYn0k";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="befWHXya"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66MDWRk3765300
	for <devicetree@vger.kernel.org>; Wed, 22 Jul 2026 14:18:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	VW0yyY8JykH8fAlc9I8k68jNlTSdPXYlp1Ov6aHWoco=; b=QBsYYn0kVccuhlew
	PR/hFDKMjbZOZpxNuV/SsThksPzvnPiq09vBci9M7JKQOuq5O4RhTHRQDuq5MR0X
	wJgdBxZ+MCRyMhd6HGf36wV8vKgcEv5HoYlXC3ZrFxqs5X7dmLIhQwARfjnuIX8L
	F44DmSminONJbvOCij99Ik0J5znHXxaWPyWhYtBbF0aWhRpZ/lxRZ+KP5/jyVMAX
	L2075EzUWvalRzUwLdBQ09Kj99rwoPgpAnAh9Gjsyi8blHnMlYqKYY3nledOh2Sq
	xgWq7mtJH3jh6svE548COJMyx3lPxEWiPXliObltf0oec3/QdDHh4uhSKvgfBUp0
	8u4QTA==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fjtn2sbr9-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 22 Jul 2026 14:18:51 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2cce870a060so217410555ad.2
        for <devicetree@vger.kernel.org>; Wed, 22 Jul 2026 07:18:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784729930; x=1785334730; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=VW0yyY8JykH8fAlc9I8k68jNlTSdPXYlp1Ov6aHWoco=;
        b=befWHXyaDih8uH3PoYgnisEg/fnXHipcCKRC+XU8fzPzMrVmV9Di1adyhogWq5CZWa
         mxMi3WuL/j3Cl+MuB8jzqIS6lF4DmdP0hGRasI+Dn+doWAOTqaESJQn48uLHVoD+mvAM
         jA3U41Zc3sT4UoDxNtSu25GCfxyiZ1xlzJkPvKDgNDVK3124pN6kvII/murpcuj3TTqf
         Vj33R9rC7dgiUlX6MRWhVrptPsS8OxaPtKMMdVFerUoFYWFvmHdBA+O7eyRO+mHz9bM2
         9GGsQTyY75IKBk/SACFFQ7+pCqyD0BOTHIi5ZmxXIfJMQm2OH+RUfe+qfNSPcmTlDbMX
         pdgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784729930; x=1785334730;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=VW0yyY8JykH8fAlc9I8k68jNlTSdPXYlp1Ov6aHWoco=;
        b=Va/nrdWMroeJuTDJFRgcjrUCE6Frp3lwwiL+rIoNs0yg/YbAg6o2CghMwauCxPcC7D
         2g0nzYfGwhzhWkZfo8+r/KmrCavoscvFwJDB2SlhBdBb8hWsqj3UubsupBHuk2uXMez2
         0qny5oM8bhBF9IBhhurvjzEpEhFKSK9Kh4BNANEWLUvlTDRW8hcalXXGfRPA4kki8Gq6
         f2fovn2Rhoddlg7KnxVWcYvvidGE67QlwH1cFNlXN5Vew2jy4U2NAc9HR9z7XIFg63Pw
         n4hVBB42/oefbuJ/z9AmmVuIcngjLNjZrg/uoZVYoCtaZ50pMEIffzyvkZ0zDELoi8oK
         ZcPg==
X-Forwarded-Encrypted: i=1; AHgh+Rohk+AYhMD0sWvXj55wxHlMJiYAV+PQ8KpnT+7f8X6luY4sAnSph5XqtKT1zDMopanS8fAbciUg0MPd@vger.kernel.org
X-Gm-Message-State: AOJu0YzZsw3xSGHbKhQv5uIAsy8saOwWLK73f/8Q6JYrJg+lUDS5nDAN
	ums8Cr936WOph0i8dnBI7o+mifKtYsLvzOpOiFof6+ZXd5rE2QrCu0E0Zgwv8xNmqnBkmJx0Gmd
	RAd4AwT9BI9aBm8Gbjk68mqq339qe0F3CX6a3WJwXZjwb0nE+yybMII9PrAd8QM8D
X-Gm-Gg: AR+sD12hRV38DdihHqyI9bmoqVuUcKgQFiADZlbcXOSDiVlgL2qs8xRRD9ssCxX31bs
	qP0MjFhhXWave7tZwItVwgyaEqUJ9W2o/HgvRoFG3ebifwuJg0BWjef+ecltNf+L+LvEas/1NST
	CtUQa9E4bcmfetrfpwqIgXXOdacPiJkRHftlmoO9swARK9Ts0DNDsM1oKaDjf79N/o+DvHqe971
	OB094+Yz/UftlldwOg/bfgd/6Il5hbmP3A2M/42UbfOd2Dgy0GGOiACGCLOKmXESzMML6asIQZe
	d9IvIeuAP9Hs/VRUbeOYmY95tzRyaVds+m4vf3tpM80lNPS4yx+HnDlShMFrzkqr7UV0SOXuT9x
	OfeCzFbKYcieY3V4/nA==
X-Received: by 2002:a05:6a20:7a9d:b0:3c3:b5db:cd07 with SMTP id adf61e73a8af0-3c3b5dbce30mr18139888637.15.1784729929814;
        Wed, 22 Jul 2026 07:18:49 -0700 (PDT)
X-Received: by 2002:a05:6a20:7a9d:b0:3c3:b5db:cd07 with SMTP id adf61e73a8af0-3c3b5dbce30mr18139833637.15.1784729929226;
        Wed, 22 Jul 2026 07:18:49 -0700 (PDT)
Received: from localhost ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3147e081978sm8899001eec.24.2026.07.22.07.18.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Jul 2026 07:18:48 -0700 (PDT)
From: Sarath Ganapathiraju <sarath.ganapathiraju@oss.qualcomm.com>
To: Krzysztof Kozlowski <krzk@kernel.org>,
        Srinivas Kandagatla <srini@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Jaroslav Kysela <perex@perex.cz>,
        Takashi Iwai <tiwai@suse.com>
Cc: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>,
        linux-sound@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        prasad.kumpatla@oss.qualcomm.com,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: Re: [PATCH v2 3/3] ASoC: Add LPASS VA CSR heartbeat pulse clock
Date: Wed, 22 Jul 2026 19:48:40 +0530
Message-Id: <20260722141840.596101-3-sarath.ganapathiraju@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260717-outgoing-bold-tanuki-d4db9e@quoll>
References: <20260717-master-v2-0-ae200627ad62@oss.qualcomm.com> <20260717-master-v2-3-ae200627ad62@oss.qualcomm.com> <20260717-outgoing-bold-tanuki-d4db9e@quoll>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzIyMDE0MCBTYWx0ZWRfXzGcNyVET/sDg
 TSgr9M/y5/38ekqFEMueiSJGpNtzfuWxHSWN8Sj8KL6QtXA/w+frsgmtz9PnKZSj8bUYI3vsmCR
 7wzDN7sMPG9oGKNyQLixASA1lf5f/NcFIMlKLimWVREmgFQ5XlkM8xdpoWFZ6VXh+h6DMh3e6Fv
 S7ORncn8vD4ZhaFDWr+6zwGBEcUrHdc/wPrOQg4k4FmMYk6lmybAFBHXvGY5HAm9pSASPWe2+CT
 VtCnVQ0KayGKDgP5ez2zJtk300ktk8mOxFtGmruU1V7UkDnVJhW/b8nZ+jVWrDAkb3/tGWV4x3H
 5+wYORHcyZ0caFzZy53lPznotEm9fsRzVyZjJwU53B54FYu5uCCmaNnhERPU2KBKFa2tRGWZRC2
 fahknmykl757burTYxiSx0hOkGw6XkQ4NyiZ9KKwCTdDYMSYvwmITS6pIN7Iq3RcpbYHsPDzxgd
 oTizSWg4pbBE9lkkb1A==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzIyMDE0MCBTYWx0ZWRfX3/hl7R7vcPW0
 Qj1y+iJeqxxB58TSlOI6KoaqS7W4kjM/kW+qesPlRjRPfU57yhyjVAA7CfSIL6xibHO9uoWDjkM
 Q/EEOHIvuMGEmKl4Iz9i30PGgE03KFQ=
X-Proofpoint-GUID: nSyFDJMDbe0m1kFjoegbImQwaGelsrJK
X-Proofpoint-ORIG-GUID: nSyFDJMDbe0m1kFjoegbImQwaGelsrJK
X-Authority-Analysis: v=2.4 cv=T+28ifKQ c=1 sm=1 tr=0 ts=6a60d14b cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=4euMmpHkiu_tE4R6rnMA:9 a=QEXdDO2ut3YA:10 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-22_04,2026-07-22_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 phishscore=0 impostorscore=0 malwarescore=0 spamscore=0
 clxscore=1011 bulkscore=0 lowpriorityscore=0 adultscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607220140

On Fri, Jul 17, 2026 at 11:02:41AM +0200, Krzysztof Kozlowski wrote:
> Why a clock provider driver, which has nothing to do with ASoC and uses
> nothing from the ASoC, is placed in ASoC directory?
> No, this is really wrong interpretation of Linux subsystems.

Ack, Will Move to drivers/clk/qcom as suggest.

Thanks,
Sarath
