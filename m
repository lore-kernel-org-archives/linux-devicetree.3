Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 70D0F3B894D
	for <devicetree@vger.kernel.org>; Mon, 23 Mar 2026 16:03:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=205.220.180.131
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774281827; cv=pass; b=dcoxkNMFtZN0cLDMxj0Q8yt8MQe0K0X6PPUc2V/Xzc7XSpkaSNIf6kZVx0i+wjTvGvvFGUhByGXvNdwnRmCNXMGeY0U6TNqQzla8FSZnb8hXUpsNxpTrDlmwFOBcR9e9QO/Q8nujsSB3lj4vI0/LEQGFQKE9pazjQcVz1kPNBCo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774281827; c=relaxed/simple;
	bh=6IeZ8bg0RppZOGpii6z5tIjcxbE9K2oPFgD/N36lrPY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=cZUvMPJdG+UGDMhdsWJBt4NgRlyUpVt+bYOYhZ5hZFey0dklkX343IMTNHBlG85jjUFOwToi+PDHk3s75o4QlqRfw73c61pEGMIab7GfaCjvAKdvEauZfbbC88z8zVfakjNw2R/yC2KNjyjYiQ9z5JurE4vycxEUHlppJY82s8M=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ENPDGsh9; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=S5nHpIeu; arc=pass smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ENPDGsh9";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="S5nHpIeu"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62NFGdL1600353
	for <devicetree@vger.kernel.org>; Mon, 23 Mar 2026 16:03:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	YUbYj7E6USUjs39a3+mImLkR+XQomQn/mwKeuuq4nEo=; b=ENPDGsh98jYcruUN
	B9CMsz9yRVTdwS60oVcVmGmU+ZgAS7ZwB3KyRLOIoinaX0DTys31BGD33rcQ/To7
	Vc2zk6elqkw7IrWW4vw51tgRsbs/YHjbIbl1xvz/LAgGltAZMTEDiPTjVAFKgn1E
	IGHXL5LJCVPTsztCcYs7lXOzCjzUXrLzW+75QP0JyxW/oOLsIDeDFseQCI7PeEMj
	ZTGU0qUE9vTWGz0D7Ct5QFlTrsUMdocnotuDYp2M2kTPGwN7ndO2uD/CmGwHvele
	ED2Qu0EWecgbz/SrzR680MQIEcaTEtha27AsAGZofNiKgjkoXRUvE/kH9oV1Gqg3
	LTmEOQ==
Received: from mail-pg1-f200.google.com (mail-pg1-f200.google.com [209.85.215.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d34vkrx4g-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 23 Mar 2026 16:03:45 +0000 (GMT)
Received: by mail-pg1-f200.google.com with SMTP id 41be03b00d2f7-c738bebd53fso14202600a12.3
        for <devicetree@vger.kernel.org>; Mon, 23 Mar 2026 09:03:44 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1774281824; cv=none;
        d=google.com; s=arc-20240605;
        b=M7hkC+j8VgV987PSj6WnHT0y20PcFn8Vy79iGkcOknyZAXsJ30EvDaNH8LMKOkZurq
         9wnj+tcTqksV/q1hsaHADW+Z9M2b1G1FhhH5wbj+9WGyMCqLVM842AqgTV3TFDcMh2y0
         tI/dr1L2oHTayJtHyimE5cu96zHh9C/b9wplijJYMFM0xAUmYDlNgXMYzvLNqPrflKef
         oJb66Y6wA9pzijAU3Qt0JptfYRetDFC/yF+77QhM1YjbD97FW9GNBMGmZ6EY5MrmQBaB
         KsWZXTavNZExKdLcoKZkXOPDjdNoi5uWO5McSKSpWGTvv1XLHF9yBh2SBU6p9jStW6/G
         4ZcQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=YUbYj7E6USUjs39a3+mImLkR+XQomQn/mwKeuuq4nEo=;
        fh=OuKtEKAVbSFKtlF5HT0v+nI4sOtzAzZNwAoT6mrRZ3g=;
        b=cGchxsQdtkq+xgOujVktQeJu9+v9GlVtURKEHTxOyZ7HQdak9VJozueAnd6QdTlE8w
         c6rcamzPQ13o+Qs61WL0/S7i+ndTma09RS80EXI0A5EcggpsT8F4FsZ7WiqZlFLT7uqE
         6jQNr5D+STQwNf2rbtN2DKk16Uz7rbv72EMrVe5lLpXlptdZJaBAPcPOEeIej4CD1AWA
         fy1AaGIXhr6BEXPXxanlmAltsebFWKPbCPlgQcqkTCtiNeu7Rg5gJkP44qGF9GPCPrn8
         qQ0dYqnp8TUn5cR+mwwLehqzG14cyI4TZXCGF57810LQDD76JofoNWhP+I/xx8FE//RP
         AJ5Q==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774281824; x=1774886624; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=YUbYj7E6USUjs39a3+mImLkR+XQomQn/mwKeuuq4nEo=;
        b=S5nHpIeuKoHqhEfkzN/HHDnMFscZFCMA5BbSbPpAMLNXQAWE9ktlTdytognjLpIGRT
         9dMdPPVMUF/P5avjEUaB+URjj2KEF6DHzkx5D6WahYi7h+UuYv4cH0R0gdkEr7VHWZnY
         EOQGtbJgMnT1F+xmDYkzsPPfNs5Bs6wlx3wo9K7Qm6wndylWj0UjtgFcwsMuoVSHd7u3
         mNo01vB9DWvN2rzL9tdxWz8QqH7NYNIUBZwUfCnQqFYsiknTSqMGyfxKYVqBdhORNVbc
         g26f48Tl33TF3g3AT8oo/SRnqn2tdnmHqy7LKIh/AmxChTPEGJua3Pw8BeEP06V3fdPK
         1clA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774281824; x=1774886624;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=YUbYj7E6USUjs39a3+mImLkR+XQomQn/mwKeuuq4nEo=;
        b=KeoWHFVdISyPUIoFvDqnan665iGdci9up2NWfenAbUac0rQyMzQ3iEW2IplaRoVmbI
         K2tb001QQAoLlxNZajOX9WBPaUGcFe8Oj0qpa6uenGi4nHhU67d5cnsvtNKIaBAxzm8n
         rO/0UnZLBU1T4SQRt4hACWeayUDmlSa/Knjza0vL+N0C3Eq+K1GzVjs09mv94Pmpkt6m
         qprzqUoj4JSf3p9tMw11ks3Fm777hnvOfMf3u7Fp15FovKRpPukM8xeZzqnGjW3JMTDk
         ICyf5flkY7vaBz0bBUPcuQS90EoiF86D/5d5zJGDe5kgt8+qsBN1f3g/eNwWaUxHD7QZ
         KYQA==
X-Forwarded-Encrypted: i=1; AJvYcCUM5koWcOGVVkEv+6DS4FLxo+xM13NiyWMwcIdF8jK1F6tQLAau28U2vl/Ik9gl7szBl+zdDGOU7Si8@vger.kernel.org
X-Gm-Message-State: AOJu0YzNuOMPltqAO4CoEkzO74X3xEANGeLeEzFcAIWN5MW92kFI6T7x
	YRtZYduVpZZKG2fV4vhPK9IiYfgD8cOGSnz2ELHp6o1U9ZXQRqE6Cw0uprA0G4japzoD15PpcKr
	WwuSjW+xn34ELfSNgIHTitf81QfJGRwsWsJGNaJZZMrjV4squC0cjCpPSgB4wPmPMPFDZWwmCoK
	LcOU0ha5lqVhFcF51WhGEgl4cBz5zo/xvNTD9tPLVYSSDWCpQ=
X-Gm-Gg: ATEYQzz+dB/zfyvVGoyrAuv3RxFmug/w7zWio/YX8sTUHbqFghWVSJ1/4qIDnHr/Sgm
	Fdy9fCFgD6UdAIBNrj422173uI6fLh2/+grnbe+G7oIBYS123asPSp0OKjCx/iYR0ItvwWTj8H5
	+NGaSN1M7maBt7riQJ491PCRzXJXRo2+iTs/mYtiCdiaNVDanuC76+2jVh/4Iv0NiL8RQCcx2zc
	/L2OGfYL8Kt2ABoAJaB9uj1MkJ249ZElvzKo/f8eidY/Lk9M5P2t0TT3OIZI7Lp5D9o
X-Received: by 2002:a05:6a21:6da6:b0:39b:a48e:6a77 with SMTP id adf61e73a8af0-39bceb68288mr10023605637.37.1774281823531;
        Mon, 23 Mar 2026 09:03:43 -0700 (PDT)
X-Received: by 2002:a05:6a21:6da6:b0:39b:a48e:6a77 with SMTP id
 adf61e73a8af0-39bceb68288mr10023550637.37.1774281822778; Mon, 23 Mar 2026
 09:03:42 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260323125824.211615-1-loic.poulain@oss.qualcomm.com>
 <20260323125824.211615-2-loic.poulain@oss.qualcomm.com> <94b415bf-9a76-4d31-add4-6283e8b43b72@kernel.org>
In-Reply-To: <94b415bf-9a76-4d31-add4-6283e8b43b72@kernel.org>
From: Loic Poulain <loic.poulain@oss.qualcomm.com>
Date: Mon, 23 Mar 2026 17:03:30 +0100
X-Gm-Features: AaiRm50U5VFBZif45c0aETtJ851A03Y61IDlm_uO5C4c7JQdpnRMGomgP7_ijXI
Message-ID: <CAFEp6-3xmL4q9eSLpUZjdP5z1yCr_AJxSLmzqF70S05DK7Or1Q@mail.gmail.com>
Subject: Re: [RFC PATCH 1/3] dt-bindings: media: qcom: Add CAMSS Offline
 Processing Engine (OPE)
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: bod@kernel.org, vladimir.zapolskiy@linaro.org,
        laurent.pinchart@ideasonboard.com, kieran.bingham@ideasonboard.com,
        robh@kernel.org, krzk+dt@kernel.org, andersson@kernel.org,
        konradybcio@kernel.org, linux-media@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, johannes.goede@oss.qualcomm.com,
        mchehab@kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzIzMDEyMiBTYWx0ZWRfX1RxmC98OgA67
 dZ4fi89r8nP02VyaeuWchCLmtKfmP8In6ni7xsvkoMg6i+eJWJc7AhdEakKtgpt1jm7KWzbCNWO
 /JhR9f+aYSP8z2s47zUQ4niwUQOB/EZnIen3HwziyXLnTeuXdfOkoCVzg/CGR+vYAOcHblMeRJN
 lyk9CVLlfZtLi+nkEfhHO2K29ppJzuoHG5rTo3px5NKaZ5kSQXTjhnMfN1Kh2wDf8BA6NW8CHe5
 sR9qTfE+S21gah9Qxaax0OBh50ciYs+2imTTid6cB0tCvlZ137zMvcZZXFZujv8/0u27FfycHmr
 Qg2CVp3kgIyD3UV0CexHBW8VbeHBKo7rdLgqdVBghdvpIutgtDaFS4Gl2LlpPlTA9DMk8lEzAT0
 myu5A1xt76DiEU6Nk9gZn6EwpD53Ftom3uaoY1aoIfdQnVUYGhyMcb2mXejjYbcg9ppn/5TbkyP
 KYoy3OMd8Hac70ZFiwg==
X-Authority-Analysis: v=2.4 cv=eMoeTXp1 c=1 sm=1 tr=0 ts=69c16461 cx=c_pps
 a=oF/VQ+ItUULfLr/lQ2/icg==:117 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=_glEPmIy2e8OvE2BGh3C:22 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8
 a=dDmFx4qguRSL7zYZr80A:9 a=QEXdDO2ut3YA:10 a=3WC7DwWrALyhR5TkjVHa:22
X-Proofpoint-GUID: mb3WaJTpISRDK1yZlZ-PlBJ9VE7rXswt
X-Proofpoint-ORIG-GUID: mb3WaJTpISRDK1yZlZ-PlBJ9VE7rXswt
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-23_04,2026-03-23_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 suspectscore=0 adultscore=0 lowpriorityscore=0 impostorscore=0
 bulkscore=0 phishscore=0 spamscore=0 clxscore=1015 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603230122

Hi Krzysztof,

On Mon, Mar 23, 2026 at 2:04=E2=80=AFPM Krzysztof Kozlowski <krzk@kernel.or=
g> wrote:
>
> On 23/03/2026 13:58, Loic Poulain wrote:
> > Add Devicetree binding documentation for the Qualcomm Camera Subsystem
> > Offline Processing Engine (OPE) found on platforms such as Agatti.
> > The OPE is a memory-to-memory image processing block which operates
> > on frames read from and written back to system memory.
> >
> > Signed-off-by: Loic Poulain <loic.poulain@oss.qualcomm.com>
>
> I don't see explanation in cover letter why this is RFC, so I assume
> this is not ready, thus not a full review but just few nits to spare you
> resubmits later when this becomes reviewable.
>
> > ---
> >  .../bindings/media/qcom,camss-ope.yaml        | 86 +++++++++++++++++++
> >  1 file changed, 86 insertions(+)
> >  create mode 100644 Documentation/devicetree/bindings/media/qcom,camss-=
ope.yaml
> >
> > diff --git a/Documentation/devicetree/bindings/media/qcom,camss-ope.yam=
l b/Documentation/devicetree/bindings/media/qcom,camss-ope.yaml
> > new file mode 100644
> > index 000000000000..509b4e89a88a
> > --- /dev/null
> > +++ b/Documentation/devicetree/bindings/media/qcom,camss-ope.yaml
>
> Filename must match compatible.

Some bindings (for example clock/qcom,mmcc.yaml) do not strictly
follow this rule and instead use a more generic filename that groups
multiple device-specific compatibles. I mention this because my
intention with a generic filename was to allow the binding to cover
additional compatibles in the future.

As I understand it, in the current state I should either:
- rename the file so that it matches the specific compatible, e.g.
qcom,qcm2290-camss-ope.yaml, or
- keep the generic filename (qcom,camss-ope.yaml) and add a top-level
const: qcom,camss-ope compatible to justify the generic naming.

Any preferred/valid direction?

>
> > @@ -0,0 +1,86 @@
> > +# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
> > +%YAML 1.2
>
> ...
> > +
> > +required:
> > +  - compatible
> > +  - reg
> > +  - reg-names
> > +  - clocks
> > +  - clock-names
> > +  - interrupts
> > +  - interconnects
> > +  - interconnect-names
> > +  - iommus
> > +  - power-domains
> > +  - power-domain-names
> > +
> > +additionalProperties: true
>
> There are no bindings like that. You cannot have here true.

ok.

>
> Also, lack of example is a no-go.

Ouch, yes. Would it make sense to have dt_binding_check catch this
kind of issue?

>
> BTW, also remember about proper versioning of your patchset. b4 would do
> that for you, but since you did not use it, you must handle it.

ack.
