Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 55E1D2FFF8D
	for <devicetree@vger.kernel.org>; Thu,  4 Jun 2026 15:13:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=205.220.168.131
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780586030; cv=pass; b=blgka19XD4Nlwa75jOT8vSU1u6f5v92xa10Cz+WJf5X3eY1ztN0z+jJz7pDRbY40Q09EU/qGkZG1IKuiOCm/IK/esnqlELxh4gKS0bIvHH/QopLk3D+zgrGnl88KwbE7AeMLaZZrlcI1TAx09NIAVqszXcE4XuMpv2ebgF1VgqY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780586030; c=relaxed/simple;
	bh=eJ4qQZliHJ2fOuXvYZn96rGr9sZtM4wEG+Otmquj8D4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Z10tFx7U9rA3u8x8cyRnuBaB4BZKVGf5mJnPvecElFvJqkhjjemIrMUpL0x4uKGV9KmpbSzoQxtDHTIeDKXvqVHYyEoPzW1wbm9ExYMJ72Rl4jE4aKOSNSfdmg7/Z/W0gJX4fnqJpgnfgd6pALlAxajkUkLVfRWO76vKWAzoYMk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=cAQ8nRem; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=P6ZeNdxD; arc=pass smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="cAQ8nRem";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="P6ZeNdxD"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 654CPiFh2477908
	for <devicetree@vger.kernel.org>; Thu, 4 Jun 2026 15:13:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:reply-to:subject:to; s=
	qcppdkim1; bh=4my79OSMQYPXhU2YUseQMtgxKn07AEG/1T3jHV6k98Y=; b=cA
	Q8nRemcWM1cs9R4fXnIyTAAMiK3S3VySEnx2ab2jHV+Y2+JPMDuLfcKVsugBD6J7
	yScjDxdDvrhuz77j2XQWlOGoyCqMyk7STeUHcPG+zWfw4vVYClEN08Ttqp0J7cxX
	ZhoaSmnTkAsEVjmZSPeMb+69Ft55fd8q6xDQw5Z99VSc+H3KNOzkIqfYuekKDeQQ
	vr6Fn9CMFYma2+Ub+wVyrD41VTVM1dW3h/aOetrf57WQzqrjDu1kmzpHJQQoy0WI
	H/YzuF0ozwapJT0SI4diu2lnZ5oOT4pQe0oaaiswuiV0L+b0enCKEnpZ98Md1IQ0
	74qmGX7KXzUjMdVDVgUQ==
Received: from mail-oi1-f199.google.com (mail-oi1-f199.google.com [209.85.167.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ek4hvj0vh-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Thu, 04 Jun 2026 15:13:48 +0000 (GMT)
Received: by mail-oi1-f199.google.com with SMTP id 5614622812f47-486417cc069so992965b6e.0
        for <devicetree@vger.kernel.org>; Thu, 04 Jun 2026 08:13:48 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1780586028; cv=none;
        d=google.com; s=arc-20240605;
        b=CMxnl2MA0uGz+dBfHVtvAvzaANvdSWwnbE/ZxaQHpvfSFVJ0fGzYa8ER9P+1MIeV76
         qZZMINGSSmazyXOrBqpXcwioEjF7rUJ9UQIT6BcWEj04GBZkfpC38Gdea6RFxI/MZX3j
         3JgEsFhrcVVY1jr0hSmPk9XLIneusJqsfsb35em0GI6IvXebfQku3QOBtLGUs6cXErwW
         cJ88NwjmTV9O06YaBjA/8/tGLYtxJYoU25I/aPsfOg3DS4/dngPVYFYdgEB11ajAhso/
         13mws1zYwzy721T3FW+w+y2TkePFpEVIvwTVItPZoJ+TqzszSeIuk0Cy5KMCxZJtTKpZ
         lzDw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :reply-to:in-reply-to:references:mime-version:dkim-signature;
        bh=4my79OSMQYPXhU2YUseQMtgxKn07AEG/1T3jHV6k98Y=;
        fh=fiADjPgHj0LYOaA/Zgo0Rwq676iIK10huCSFt1C4i1Y=;
        b=ESc0vbpF/1JBuodd9d29IZDfT47TjIePvBLYnsP5XEwB8ISyv+/m/s4iMtTQ7a9yAr
         KBGgjNa8gdZhiRw+BNK4dxItMNgrjon6Vb46y1QXlEYVDq15o9oWa/tvTEbKlXv4U79M
         9dpVCjBAS3OpPCopfBNZ8yqjEVCsosTCDZnLzbGq+XNG4PhBqhSYv3WzGJ3gy29kuFFj
         g7Di4U5r8Xq5BkobQPPdAuU8TuoUeVNUNxb7HF61mtVrwVRvq4LpG/0EkI+vc290ur0Y
         E1klrlJG2CawHqNJFLr/UOnZ5HqL+qDc7JMKfGnVtiBLc8zQRkBa4o53tYjeb2DMyT/8
         OdlQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1780586028; x=1781190828; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :reply-to:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=4my79OSMQYPXhU2YUseQMtgxKn07AEG/1T3jHV6k98Y=;
        b=P6ZeNdxDkfDmMsvqE9MZpORRI8YNrBkpF2TUFV9On7OvLfEwG9Y6XHV9Jrgef1eDW5
         79vWzYhdLWCWpsYb8TxoW4ZiCx/NNfcuz+vgE/Idm8loMkvh7aG0J8SjlsmVr1mOBMpM
         kc7Ir2ScIu0e4mciIbb3zwZt3x7UmZGIj27dPLBJAuT9jsp42CfzgRWb2DTyoMJYo37k
         kxUNzBGBc4rnrTYJalumDqJZxKRiXFwuO/9gexX2rySm4a0Xexmrm+ubpHkeuBKNZcjk
         7lTJwZa+Ngg8mKY6cEAqz6KQGuaHR7Anjx8pIDmCeZH9/Ta16d3err/oBgR0cpQ12sFE
         cSkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780586028; x=1781190828;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :reply-to:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=4my79OSMQYPXhU2YUseQMtgxKn07AEG/1T3jHV6k98Y=;
        b=QV5+YDcpsSn7wbrkBDs4Uoi3320PsdbNSberjHYwUV1prA/FFSOP0ZXndrfufnPy7a
         P+MQfb77KQ+VaaPCO6zv5fIVQ1xCNIGRVbtkw79iKOhuEUWxWOHcIv6S5u14uVY3jSck
         8l/YCZ+Tmm+Ko2yVcnLq41TJGb0UAuqdZ6zTpf6kevhI3wnOExRogcPQNi1IyMaIDFlL
         dWuQRCTmm9qz9SrcVeXEO+tl4EsZGcZNVuSTYxRL5dlEfWzlSxil+WIzSr5mEbsR147b
         fzDPAblSZn7sqzrKQvRMYOSy0Qlm++q5QDNG6bdiMle+WkRo663upaC2yaNTt+X+yuq8
         38QQ==
X-Forwarded-Encrypted: i=1; AFNElJ8LDhumvFI9snrfmx4MmI/x87YV4mGLOcZ1nNvxu5BOQKJqFdB0zRtYb4vgWUrkYIpq50xO4c2fu0vA@vger.kernel.org
X-Gm-Message-State: AOJu0Yymc247v3O3DfwXxce/fBMtFGre8eTBw6OQczRy3uIBYzLWHVru
	yoKPRmm9GOozMPRmFO7iqhMWIYKnk59nR/GhWyzB6UDIsotIpWFVQLX901x1N9ScJcmVWbBXD32
	lRhE96cJPjixp4wzBgU3gSu5UBQcFZ5vcYAp8bDfmltNsFMJ7hEHAuO9L0D03dl+bUOQLjdYAQg
	giy6b6BhsBWjtX9f8v93KC0NoOn61hy/d/yFLjfcWv8tgk2Vk=
X-Gm-Gg: Acq92OHVf5SCm+hfMvOC19/KkKJ/kY2W+RKzMiIsNpLNqrsUcIZEwb8YGTdxgDef1T3
	z1nygfb55v9aXbDKqEe+lo+A0oSTe9+LM9LVnudJDVgU32ZaQE+2wuj8i1CqP3heW9PiNRJ5Xe0
	Dy7wtHrhPRnYSovGEiBaagCNNUW5yNkAZcLBnLfN7P+wXSiq8iCE0F2u4da4Bsx9T1wxfMPRwHv
	/qpoW7PUWogqw==
X-Received: by 2002:a05:6808:c1f7:b0:485:dac0:a7d with SMTP id 5614622812f47-4865ac6394emr4440378b6e.22.1780586027676;
        Thu, 04 Jun 2026 08:13:47 -0700 (PDT)
X-Received: by 2002:a05:6808:c1f7:b0:485:dac0:a7d with SMTP id
 5614622812f47-4865ac6394emr4440357b6e.22.1780586027300; Thu, 04 Jun 2026
 08:13:47 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260604-topic-yoga_submission-v1-0-57c70c23d0d6@oss.qualcomm.com>
 <20260604-topic-yoga_submission-v1-2-57c70c23d0d6@oss.qualcomm.com> <7a330941-8715-4523-9f39-10b57586c69d@kernel.org>
In-Reply-To: <7a330941-8715-4523-9f39-10b57586c69d@kernel.org>
Reply-To: rob.clark@oss.qualcomm.com
From: Rob Clark <rob.clark@oss.qualcomm.com>
Date: Thu, 4 Jun 2026 08:13:36 -0700
X-Gm-Features: AVVi8Cc6hFS_zyiHZip3PSaTAI0DzZRij3zeQsebuwBfCNnS4erThfLHMB24ZW4
Message-ID: <CACSVV03J7Y4-ADRNE+4qArqsWvQZ3qmTc04r7vmY64s0qDYFkw@mail.gmail.com>
Subject: Re: [PATCH 2/4] dt-bindings: arm: qcom: Add Lenovo Yoga Slim 7x Gen11
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Jessica Zhang <jesszhan0024@gmail.com>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Douglas Anderson <dianders@chromium.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-GUID: Ng1BNrJgQ7YuJ6YSswZPdtdDpRMsS617
X-Proofpoint-ORIG-GUID: Ng1BNrJgQ7YuJ6YSswZPdtdDpRMsS617
X-Authority-Analysis: v=2.4 cv=Zp/d7d7G c=1 sm=1 tr=0 ts=6a21962c cx=c_pps
 a=yymyAM/LQ7lj/HqAiIiKTw==:117 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=_K5XuSEh1TEqbUxoQ0s3:22 a=8k6WQxmsAAAA:8 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8
 a=dX0BPLNIrGpKtFaJ3e4A:9 a=QEXdDO2ut3YA:10 a=efpaJB4zofY2dbm2aIRb:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjA0MDE0OCBTYWx0ZWRfXzWN/DBisXWF7
 CnE6zADkdQQZRykBtPeCHDniOzsrJJg/Elvmkx8DIzKjf+MgMVkSQuNS0sOuKT85TyvthrjHgDQ
 0aD3ylmJluVQ/dW4X997bpcCrGwc/PMOAxNu06nyUJWMlMbbLczUTg+TNCNwSzjdqvIH3wFi7fX
 s9+sVk0A0/l9Uk/bCAlr36/uEjWfncnsfX/QxXnxNNr3WV4sJbEbhWp0VfQK+5h2+ncgnKoP3uD
 FgFZcO7hwYFQAN6+tAFOk8c2twHTAWDhWyv4L8O9rh/HQcgA47SwiklZ4zcIfR4C3vE3BO92F0z
 s/RFPMnSujux5QLwGLuBsgJc3Q2yvPsmD6INE75opzCC0GqVcBe4VNkkclI63gf634GrkhRIjRf
 Gc0U28pIOeI0NpnN2fSDzAJax8MFYNkNDf796kaYFRTMAkUR14AatMetRnj7TZ5wmnLTS9BM1QX
 0M8FLvKJFKAoX4KuArg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-04_04,2026-05-28_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1011 phishscore=0 lowpriorityscore=0 impostorscore=0 malwarescore=0
 bulkscore=0 adultscore=0 suspectscore=0 priorityscore=1501 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605210000 definitions=main-2606040148

On Thu, Jun 4, 2026 at 8:09=E2=80=AFAM Krzysztof Kozlowski <krzk@kernel.org=
> wrote:
>
> On 04/06/2026 10:06, Konrad Dybcio wrote:
> > The Yoga Slim 7x Gen11 is a Snapdragon X2 Elite-based 14" laptop from
> > Lenovo, featuring an OLED touch panel. Add a compatible for it.
> >
> > According to the spec page [1], there  also exist other variations
> > (based on the Mahua SoC and/or with a different type of display panel),
> > but those are to be described separately
> >
> > [1] https://psref.lenovo.com/Product/Yoga_Slim_7_14Q8Y11?tab=3Dspec
> > Signed-off-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> > ---
> >  Documentation/devicetree/bindings/arm/qcom.yaml | 1 +
> >  1 file changed, 1 insertion(+)
> >
> > diff --git a/Documentation/devicetree/bindings/arm/qcom.yaml b/Document=
ation/devicetree/bindings/arm/qcom.yaml
> > index 50cc18a6ec5eddaf48542b85387c2d430cd4721a..fca3d180489d4cd3eb2726a=
722f15febe44f03ad 100644
> > --- a/Documentation/devicetree/bindings/arm/qcom.yaml
> > +++ b/Documentation/devicetree/bindings/arm/qcom.yaml
> > @@ -68,6 +68,7 @@ properties:
> >
> >        - items:
> >            - enum:
> > +              - lenovo,yoga-slim7x-gen11
>
> I imagine you might want different panel variants, just like T14s has
> LCD and OLED?

I expect this will be the case.

BR,
-R

> Best regards,
> Krzysztof
