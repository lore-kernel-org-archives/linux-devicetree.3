Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EBC7326B777
	for <devicetree@vger.kernel.org>; Sat,  9 May 2026 14:47:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=205.220.180.131
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778338058; cv=pass; b=Sfs7UCmFR0lBEjlBhaz8F8R83MrG8B+Uob51CMMNpTrDHHzBl3FYH9SEl1Y4LkZOg+qeKvMjDl5BK0H/XgbjJv59QZw0U3xXWP0JnM5SzG6ILul5ljjoc06hnNk5pF510AWl6uCRo/+wiP0hGExpHiOVVPAApRzhbZQEQuoRbig=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778338058; c=relaxed/simple;
	bh=jBVo2t6J+YaU7d0WqCTZn/YK+PK1uQ9DS2xi85AzFOQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=gLklPy3GJZgk51MVRD5xeuxTUw2TIMaHUhVOAjDNz36B9emkZsp8+v52YLlclIjOV6SdCT0y74QVd1CW8u4ZZOYa2EK6hZYJbCdNNBoyU7pQsc9i5CqnzCBxUr0CdifvnHro6dMpVuT469U0jW8B/LFf1QO7Z74RCTUsvLA8sP4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=iJozb2yH; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=U4wS2VGs; arc=pass smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="iJozb2yH";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="U4wS2VGs"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6492pqAG2866658
	for <devicetree@vger.kernel.org>; Sat, 9 May 2026 14:47:36 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	27C2/Rl3KFni2vfVGZkQu6bndldr2xFN3AQbTDjKonk=; b=iJozb2yHyqY02BDD
	6FeGs+r+I0kL7W9HHk9vlyvm1dl7BBB/dgpyERGTUgp9U7+o5zLwiAdC1ld/R7KU
	KqBlZundHpk7YvXPRTZHkWsBobuSXcELNk42Kc13Vg/UoY6Q61aUnd93SzjZTweb
	0zKY54sY8DIz4sFaZqFUFykUiZFdVib40m970KcJC2gFNlMm2AVBMzM5jzhuSUZK
	lm6cFxUAkEqorqcF7GuwEv92VVYoW8DppXJAoQpXedg8uCYkHez1hZKyxdlcsQv4
	nSePXMtfIHLvuqcTN+orDGQ3eyMhzlj99T72fJqGV/YS2m6wAcKKiWCk5Q6LVQOn
	iLc5ZQ==
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com [209.85.219.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e1vgy16rm-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Sat, 09 May 2026 14:47:35 +0000 (GMT)
Received: by mail-qv1-f72.google.com with SMTP id 6a1803df08f44-8b1f39c5827so29581186d6.1
        for <devicetree@vger.kernel.org>; Sat, 09 May 2026 07:47:35 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1778338055; cv=none;
        d=google.com; s=arc-20240605;
        b=d4diQIPMKiiLD3bL6gsuQOtDnmadHmf1F4REFCgAf+zWpIOxHWKUaF2l6ptXXs/mmQ
         zesM461BW9jnAx3AypKwdWu8q2FUt6x4a7smHcsLZb9G3VY60DSfh+EJbxRVhIxxnhdi
         7iALl11YiP5hfp5jlpnj4Qq2LgbymGRtnZPJ2Xfv97XEYOE9cV2ReFDEZXJxZIxXxlkZ
         kMBBl+Y0BV2YBPrGrPMteMEoqrUONrSIL35PWQx/IGZdTxxSiJgH3BpaT8c3H2nWWAUg
         zVBP1SQ/zGCpsg2PWlPyTgyNxmJ+SvbTpZjul4ksYyagZLxsLoFvlhLrLqu31p1TiSiW
         xUBA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=27C2/Rl3KFni2vfVGZkQu6bndldr2xFN3AQbTDjKonk=;
        fh=TGH3dqj9rc0sJfFkxYvtS+wHuGfNnby99WOHIlN90bI=;
        b=SYazxtppqeWbGS5rTp5LYsX+krbpbilFV/+nt69+bDTPPf9u2c76Zn4cWG7JGfKVY1
         apVwzUozvHzgfbB4rmZI34Cn9xLGKnh3PyUZxWbGqsDxbvNJyyXu0AZOD+dJKSmTcuAJ
         bXAEoeRNknEJwdGnrzR8g08diJcd7xUtbntDHz+Sffgtmei4HQ6gMnRWUPUwlZA6gPaD
         poedF1BwxnP36AM3wQZBKQ+cbvM4h38m3Q2rcBSqQPHg8kZlrW/YDYhq+TCtsnQxHWqB
         qqZj7O1qSpen0c1FE4bHJ6Pc+SxmnB/bqpFcj9uB3V49GTIiS1mv73AOnKod9XpE0tOq
         W17Q==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778338055; x=1778942855; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=27C2/Rl3KFni2vfVGZkQu6bndldr2xFN3AQbTDjKonk=;
        b=U4wS2VGsZlrd8TcXF2xmeTmWxL0WYAXceKNMRJQYiNThSXeJeBkkVXUv5nK4sWGsSn
         DMJKsY/s4uPcM2k6wY35AOgmqwIUOy09MAWazq7yfeg2FtyQ3CsuLg3iJWofzpF7vmAP
         mA2mbtkY0d2APZnFHD7+7I6uTBMBBVOYpLrx/t9oKEFjRp1lc2JiP8VBEOpG1/Q8JC9K
         0dYpkldFHfa2ZbXzFozQtv07JGKLqgLu0gNB6sLxjHVrLNxsEQWu1AwbUAlviy4fAO3e
         XB9d8wwUm/Ed5IroVOjzqRphbMiQ7pN/tc+k5FxE3x9AZLW7FhmdmVcfxCmOVpySeYfG
         AFFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778338055; x=1778942855;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=27C2/Rl3KFni2vfVGZkQu6bndldr2xFN3AQbTDjKonk=;
        b=UZREJ1J7sMW/rhrSDZo3YDh2cOfg9h702f2l7VBz6QlWRiNQYMj1l3k0iRlM5cLx7j
         YtuU8wOCoxdkKZFVuXBUAdqolTSFOvtGSQ8azK9LnccUhLCnxMhjO8evYYeP76b2mlD+
         K5Dekdbynt9QNQZVTcboZkBSpogVdMehGUmdfahVfK+y86cN2w4yhXonXefuhY4gmEkO
         BAkhaSne+RD891NJVSub2U6h2few1mYLQ8ROcppyqrhUQPONBl7b4SWqiva/01fKpLz6
         w8rxUKtnk1o2tkoRNF0vuYVwkHkwZGVDCLu9WrWavCdL8rhYhpc+4/C+2D8XdcjFtQCJ
         k4Nw==
X-Forwarded-Encrypted: i=1; AFNElJ9E9qZad6stD6dbhaI+xSGakBC7mJo2sTDFWJLbWvxMl1W/tUNaS8I0UOtacTICAihYRo9x+Yc0cmdk@vger.kernel.org
X-Gm-Message-State: AOJu0Yyto68lLORi2hH7/tf8GUJc/bWRq3929Xn0goG9tY9UKFsDL4Zo
	agHU+DYma0A1BI9Ljjlubt0lDWrgQInocv1zyG4ACKmPb3NPHxAsdvm03rc6TwmTgo76QQhTXhl
	FqRxlz568BHZxNxQykeIAdbqFJPjr50g7BCUlSV5Nb/DGpbSXmnM/M7ou1LYRYbEPYF61ibOap4
	MBTP4s8au7gatPMBNukDV3gVU806YxoNLuuixBROY=
X-Gm-Gg: Acq92OFwajel1FGJwQ1bxHfLZeIDjFz6AqI5hk+f0Z+mmPhaA56+nGcAdmrwvkKuoWU
	BKbr09kbRGq56WGOHm/z+oUzCpc6uXcyPSktVAnb3AM2U99gH9AQRz1OpPdtXp4Iskcjdg2db81
	L2z5pTbHhXz4gwu+GnE2mDzAHYGxc/p8FkYbgJ5xiuJqPc+QsrsGuX6oONuJHFOhLzYDHqI9RJR
	yWg8SxoLo11lWf8PAJX3iC3r4SKtcoAo1z4j/DS
X-Received: by 2002:a05:6214:2262:b0:8b1:f297:a54b with SMTP id 6a1803df08f44-8c1a30d0af2mr40303046d6.18.1778338055232;
        Sat, 09 May 2026 07:47:35 -0700 (PDT)
X-Received: by 2002:a05:6214:2262:b0:8b1:f297:a54b with SMTP id
 6a1803df08f44-8c1a30d0af2mr40302706d6.18.1778338054781; Sat, 09 May 2026
 07:47:34 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260508-camss-isp-ope-v3-0-bb1055274603@oss.qualcomm.com>
 <20260508-camss-isp-ope-v3-5-bb1055274603@oss.qualcomm.com> <f6121050-3b27-4651-9fa9-9300ad299df7@linaro.org>
In-Reply-To: <f6121050-3b27-4651-9fa9-9300ad299df7@linaro.org>
From: Loic Poulain <loic.poulain@oss.qualcomm.com>
Date: Sat, 9 May 2026 16:47:23 +0200
X-Gm-Features: AVHnY4IkAq7SY7Hp6OxCQcJXDEy8UMWZq8MP9OmoTi2x5Wfx0FQsfdjxEJtkApY
Message-ID: <CAFEp6-3oTtRXk__bnZ2xFRJ=ijnep1arhekeJkOoRBr+P6A_bQ@mail.gmail.com>
Subject: Re: [PATCH v3 05/15] media: qcom: camss: Add camss-isp-sched helper
To: "Bryan O'Donoghue" <bryan.odonoghue@linaro.org>
Cc: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Kees Cook <kees@kernel.org>,
        "Gustavo A. R. Silva" <gustavoars@kernel.org>,
        "Bryan O'Donoghue" <bod@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, linux-media@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-hardening@vger.kernel.org, devicetree@vger.kernel.org,
        laurent.pinchart@ideasonboard.com, kieran.bingham@ideasonboard.com,
        johannes.goede@oss.qualcomm.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Authority-Analysis: v=2.4 cv=fpHsol4f c=1 sm=1 tr=0 ts=69ff4907 cx=c_pps
 a=7E5Bxpl4vBhpaufnMqZlrw==:117 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=3WHJM1ZQz_JShphwDgj5:22 a=VwQbUJbxAAAA:8 a=P1BnusSwAAAA:8 a=KKAkSRfTAAAA:8
 a=5yXcwO-DJp0L547LFbcA:9 a=QEXdDO2ut3YA:10 a=pJ04lnu7RYOZP9TFuWaZ:22
 a=D0XLA9XvdZm18NrgonBM:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-ORIG-GUID: VeHFZSOnsCHHy5-kefD0dTl04j_RUiIG
X-Proofpoint-GUID: VeHFZSOnsCHHy5-kefD0dTl04j_RUiIG
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTA5MDE2MCBTYWx0ZWRfXwswd+ZJCdsVQ
 S6OaUT9/Kz2ByhQLinEjohQbaDLMta7pBtbGIQkzwA0csx/BKOtfQfpK2xKU9CrtSQ7Ixm3ONqX
 KkubcGwmECxxOIPzAfMHa8z1a5EB0NnhzaH2jCS+W5ySS9Fid7LvDgCKbtSKzf1UbhcLspiLBDr
 EfzyZLgQSPS78vqaYMyG9xjRgQl9CaSq51YwsNZ4iHTrrD4cKN+yhGreIbhE0jhQ2sU2w/RNJqc
 rC18kxMl4KCc5P+GriWWfcJBcZ74w/0o0oLa3kOMFHeHisRwRq5/pBsYYZUtIygaGF18I6LX0K9
 DyVaPAiO3pBkMreSdWdOGl231ZGc5ieyoG7+l/rYO+YP+AnJkezin7AApl1TWNOKpxwuVjDBOxa
 c8FP9UzzjWvXW2VQV1WaowN0yTtI4y5d9okGrlJKoIc0DhbM+ngRGGc0RZSi8U1btWuQtBf547B
 5GdUilNdTslsI1YgnGw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-09_05,2026-05-08_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 malwarescore=0 lowpriorityscore=0 priorityscore=1501
 adultscore=0 phishscore=0 clxscore=1015 spamscore=0 impostorscore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2604200000
 definitions=main-2605090160

Hi Bryan,

On Fri, May 8, 2026 at 12:06=E2=80=AFPM Bryan O'Donoghue
<bryan.odonoghue@linaro.org> wrote:
>
> On 07/05/2026 23:49, Loic Poulain wrote:
> > +/**
> > + * struct camss_isp_job_ops - per-job operation callbacks
> > + *
> > + * @ready:  Optional; return %true if the job can be submitted to hard=
ware.
> > + *          Called outside the scheduler spinlock.  May be NULL (alway=
s ready).
> > + * @run:    Start the hardware for this job.  Called from workqueue co=
ntext.
> > + *          @ctx_changed is %true when this job differs from the previ=
ously
> > + *          run job (i.e. first run ever, or a different context took =
over).
> > + * @abort:  Optional; abort a running job (e.g. trigger a HW reset).
> > + *          Called from process context during camss_isp_sched_cancel(=
).
> > + *          May be NULL.
> > + */
> > +struct camss_isp_job_ops {
> > +     bool    (*ready)(void *priv);
> > +     void    (*run)(void *priv, bool ctx_changed);
> > +     void    (*abort)(void *priv);
> > +};
>
> I'll reiterate, I don't think this is needed and is overkill.
>
> v4l2_m2m_ops already has device_run(), job_abort() and job_ready().
>
> :g/ISP_SCHED_PAUSED/s//v4l2_m2m->suspend()/resume()/g
>
> This seems like codebomb of a parallel implementation, which can be
> largely covered by existing v4l2 stuff and if not then should be
> justified in v4l2 as a new design paradigm.

I could potentially reuse the v4l2_m2m_ops structure for these
operations, but not the full v4l2-m2m framework. The latter is quite
monolithic and handles everything, buffers, queues, job scheduling,
media topology, etc and is primarily designed for simple m2m devices
(i.e. a single video node with two queues). As such, it doesn=E2=80=99t
really fit ISP use case.

Instead, the approach here is to introduce smaller, focused helpers to
handle these orthogonal aspects (buffer management, scheduling, etc.),
which aligns with the direction suggested by Laurent [1].

The longer-term goal would be to generalize these concepts at the
V4L2/media framework level. At that point, drivers such as OPE or
mali-c55 could be adapted to use the common infrastructure.

[1] https://lore.kernel.org/all/20260414084259.GC4061@killaraus.ideasonboar=
d.com/
