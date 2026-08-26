Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AC9B433ADB1
	for <devicetree@vger.kernel.org>; Wed, 26 Aug 2026 10:06:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=205.220.180.131
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787738783; cv=pass; b=dduO7mEjSiV/Pp7jcJXgV7LdxqsQhOScVQuU5DHIz056N6lXlSZIJie+4vlgsCq0Iy6eHTTg+dAZiKJRFUv42pVPWhWKK/4yN0l8MiK4mwqx7Y3OIcGm7lsrcB2JCvqoBeiGKKp/fHvoKOU3fOjBgxhHt5EWPc0Pq5yorfkif3M=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787738783; c=relaxed/simple;
	bh=nfELzI6wU4evonO0YYA+RMq5+zcUXrzVSFYbXEchPEQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ryKbuwvrW8yCa65+PHPdiUo+Aaub3L98GxI5LQe9oJ6QOSVrNpyhdowDPxa+b9NZrcVGSNXtJMfyKOe89Wcr3kn0rJt9MzAt6mPS/k9UW+Rjap3ClfgQPYYXieNiqH4ZbLgNgMVCt27RwXnl8FGsptu7GsOPQBXH8VVLB+exYaE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=XOs7roEY; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=XzINPo4h; arc=pass smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="XOs7roEY";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="XzINPo4h"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67Q9CfYm500922
	for <devicetree@vger.kernel.org>; Wed, 26 Aug 2026 10:06:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	RbBqoVCT+i35n1aDZvg1l2JvcEYCQIUQpQ62IsExkuY=; b=XOs7roEYF98cF8UA
	EBClHsfAsyb/XmzpzgmQr6MO+65KofxyZJhEjs5s8456kU5/m59bMv7mEUMxJep0
	FK5K8Oycx5yRJz89PpUVs45wx8xVyOvAVdoayJuNPBtCmjPfXryldHfnElMYye3P
	eDZQEkWw2HWKjioth0UlIQa2BNe/JC6ltJ1FQtL8IqcThiHJ0DNqsOzT1nYmydfx
	u2kRxdrp50ypyk/oDIdbD5fnNqwfeh1p7zYQ3NL3zL8OQh8kNMHVe8GHrzTm5hJ/
	YYIlKP/5MKdCNnCFyxRj8YfwI7yLtghOTUL1VJr82RqLJA8Rm4dg5VlVUXI7Ewx8
	IWTkkw==
Received: from mail-yx1-f72.google.com (mail-yx1-f72.google.com [74.125.224.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g9g4mu48e-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 26 Aug 2026 10:06:20 +0000 (GMT)
Received: by mail-yx1-f72.google.com with SMTP id 956f58d0204a3-66cc65a15dfso1010806d50.0
        for <devicetree@vger.kernel.org>; Wed, 26 Aug 2026 03:06:20 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1787738780; cv=none;
        d=google.com; s=arc-20260327;
        b=q2HZu3+KjWKYZ8Fi9rCdkzMBKBGEsgFIsdQmSyjQVteteEBl2dGx2b8YG+sly4lC4p
         w50P0LvbCsBbjmrRVvDHCay7Rj1MYi1koUL2QOBBGqY+FLel9PpwHf64yJ7aiCUucyDP
         5MM4zFpV3SuMJnwOCOCa7meM2mTIYTp1nqDgN+J4nX32bZRD5Y7j2qDgrxFac1Q3qKck
         wYjlZFirssi0bd9a2Sc4nTyaD2+DuRj7RJ5sL09KeAQaBmsXx9TVWDdKIbtNMZtwq3EW
         OOTrwMZYXbwQPZttYFIbt5Q496ZDEjgoEvdiWbk9+fflLA7PQCne4ROx2a1RGAGRtmcx
         gtyw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=RbBqoVCT+i35n1aDZvg1l2JvcEYCQIUQpQ62IsExkuY=;
        fh=LSQrW0T50uC+mQ2phcxjf2kJ/+ev/frqQsKBpjsfPAU=;
        b=DdCVGC5Wi6XaE4LI8oiqau+h3j2RCe/p/aJ0hWoUvFvGt2FFoivNEhFmND6qhMT6L8
         wf55YDigaUNy3IgTFvyuI2BN+G/7+Wom3sxEAsKq4zy8I+xhduGhB9sGGpqWISN6kDKZ
         ypOZ3tJAlXJPFgPH5/ChoobpEoKI3X5TXjso239ng4A6BWcH/63vaeliV5lp4nWIcVEy
         NJYT/tU2GHaysRgAR/RWX7n1V2s4LjEuNqe9/r9VRPsUiDsrmhDHIC7xIa3fkrYyajcM
         Za7DCB9BpanR16bAkBpChjpChdaqbv9QRw5Q4dWMr5BmjGnqCC2hJ0CD1Tn08c/IVx/P
         iarg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1787738780; x=1788343580; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=RbBqoVCT+i35n1aDZvg1l2JvcEYCQIUQpQ62IsExkuY=;
        b=XzINPo4hN6lDWmJ162u7zGQqr7IRys+shJLPCuJqUUunujNdtGHHNIdyAjCUhIR/kC
         gfTK7nc0W02FJWa5GwgvXBtD+LpGjGmU5oMnwHAImQN26fKVQXr7btKe8MVZZlsYDXuQ
         WsO9h3Whg6i334xn/0ttokivVPqQDJRZwOUKQvMnckVe8Cyrq40cdpbHcAgFgdqQUOMn
         7SxCqwibl79vcRho5rg1bfQPmXkhaltSRYB9Xj0u3T7N1gSSWVcy17yEOvBKeavn8Bth
         PqZMOFV/xQ+xrQ8IICPWbvwRU8bIqXGeBxGhmKQV8HpGOPipUtrY9vSCwLqbfbFnq5rK
         KOdg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787738780; x=1788343580;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=RbBqoVCT+i35n1aDZvg1l2JvcEYCQIUQpQ62IsExkuY=;
        b=HDDijAmaiOpBZ8INcDNDLwB6h23yKYm0xhQSwqz4KnBDKOO0KzgwzAKYyNVa5qO1zM
         Phbl65zKxP6ex6kgItl6vXZhKaVDeI5K4HaN4TzQEvgSTM5j4cCpLtoYN3fxaF32OnEB
         vEOAXeFSQbOHRbyNkISXiF/lcEdI82QuspX+64v7WcG7LVXTVDIYBQhVpKXQBt8XMe6r
         dIbignChisHEuLvQVpi/CrQhRW0WwLqaoiFdKl8Kj0US91WWC2X60RYVlPZr2aiVNids
         7lK9HEGU/kSTdpbCwrfEuBJ3/cAJzUBTZirDVY+en6b9dILKOYWpT4oJYsuJAfu+Oibe
         +JGw==
X-Forwarded-Encrypted: i=1; AHgh+Rpm6TG4v4nZgt/kFN0etR1AjB+Hzd2kwKuefbwDwD4X41Prnw+HH5EqkznJoxXZd+WoPfEiEKaqaexB@vger.kernel.org
X-Gm-Message-State: AFuF++mc/r8nLJVj7HdBi2t1fRH8RYBbHLde3JLnm8IduOXFzX7Sxq0I
	ezQlAxspHJydYLzYu/W+DIoOk4BEurjtqg0HhI49wnbL17BMtx0Hq4OWKdmyHCIfPHfdjbXlQKQ
	56i+rf33gJp+d2nCgQHG7RbC3zncx4F/rNY8JB9RIYeZ3fBsZYLZ7et02tbeBRs/uKquJelwpbm
	nf/I67sTEioFsxYiXylz8E7BMP14mKxlx1MeJJJqdSegtiaKA4dA==
X-Gm-Gg: AR+sD11gVsTpLmK9JNk4hRhEzqzuCl+qz/XCD2wwyakGc5rAgJ8KJQxihmw/E9TE52z
	nPp/8CzZXBCGoNuujEIxhnlpB8jNuWDM80jyERDeKNGrrV9mJbauWRlyBMLksJYdqKYOBnBWAll
	1vIDR7jE+wT3xudpy9LrHjP6/Ykh7YIH+kckG+Av4HxfY/QSbCLRVtoHjtJw==
X-Received: by 2002:a53:d642:0:b0:66d:26f2:6e42 with SMTP id 956f58d0204a3-66d26f27338mr1101713d50.30.1787738777871;
        Wed, 26 Aug 2026 03:06:17 -0700 (PDT)
X-Received: by 2002:a53:d642:0:b0:66d:26f2:6e42 with SMTP id
 956f58d0204a3-66d26f27338mr1101703d50.30.1787738777434; Wed, 26 Aug 2026
 03:06:17 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260824063627.3595610-1-harendra.gautam@oss.qualcomm.com>
 <20260824063627.3595610-2-harendra.gautam@oss.qualcomm.com>
 <bf6e42b4-ff21-4b6c-a7d5-024e5b9a7da4@oss.qualcomm.com> <CAC-tS8CaVN8YgkUHJVvLcU1xWB3V5dOgS07CHVOBUnPtMjNxTg@mail.gmail.com>
 <08b6fd88-84b3-4b3f-a8c5-dd6bfd39403f@oss.qualcomm.com> <CAC-tS8CtA+wRuucDskRXSc=AHgNdbuq+khj85pFmCG8dGS3Njw@mail.gmail.com>
 <137d4a06-4542-488d-91e2-d338ffb9d47d@kernel.org>
In-Reply-To: <137d4a06-4542-488d-91e2-d338ffb9d47d@kernel.org>
From: Harendra Gautam <harendra.gautam@oss.qualcomm.com>
Date: Wed, 26 Aug 2026 15:36:06 +0530
X-Gm-Features: AcwNN1UcHyQxyDgxCtp2jNw1Hyii6iQM8K7os2ERH6A2exggOEYymSFD-EPOOdw
Message-ID: <CAC-tS8ACnv2rb0k5u1bLR=EeVtZFXiByke1TFhM_n-WBqJ+dFA@mail.gmail.com>
Subject: Re: [PATCH v3 1/9] ASoC: dt-bindings: qcom,qaif-cpu: Add binding
To: Srinivas Kandagatla <srini@kernel.org>
Cc: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>,
        Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>,
        Mark Brown <broonie@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Jaroslav Kysela <perex@perex.cz>,
        Takashi Iwai <tiwai@suse.com>, linux-sound@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Prasad Kumpatla <prasad.kumpatla@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
        Sarath Ganapathiraju <sarath.ganapathiraju@oss.qualcomm.com>,
        Kumar Anurag Singh <kumar.singh@oss.qualcomm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-Spam-Info: AW1haW4tMjYwODI2MDA4MiBTYWx0ZWRfX1+Qcv7Q+YRXy
 z6B2k3paVB0qZJo52F+aiqhtTWbDZyz8fsHio6v72RgTltSPn35gJTiB1A+2bx/dJa3WCWyPk6V
 MYwHGUYhPtgLo+vcf1IVbc5/KaSLnYo=
X-Proofpoint-ORIG-GUID: g2zYpiD1naJFu9VG6yg5ZlLmn8qW7jqx
X-Authority-Analysis: v=2.4 cv=eYgNubEH c=1 sm=1 tr=0 ts=6a8eba9c cx=c_pps
 a=VEzVgl358Dq0xwHDEbsOzA==:117 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=gowsoOTTUOVcmtlkKump:22 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8
 a=f6IBhYKpExAqpe2A64UA:9 a=QEXdDO2ut3YA:10 a=uujmmnXaIg8lM0-o0HFK:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODI2MDA4MiBTYWx0ZWRfX9PLuDyYv5i1N
 mzn3UEEqW8sss1BDmz5T9YmOzLHBS4MGTeE9er+lj7KzE1ehm8H8e5OaV7d92ZMEQORDuDTPB/h
 Di0Tcvo9Q+3T5Naxl7xRoiiC1NA1mV9IrD11D8d4ovR0S2A3O9GTK1GtHm6HZ5hZF1P7aFFUZZ0
 4+h2scbK5eHqHrR8Zqwn6HvFBow5FzhvVFO2zrja8t3tiE6xxnPdtBow4tJmeqm/H0bFhL2WWG5
 DqhN7VmRlbtGfhe/y7AZCLSUFRXpi1eQ0eDHAlm6bM6FND6JmGYWUHD17t4+SFceNF7EMWEw22h
 7oweMp1xcor2PDdbJeftn+iqoB8QbdJd4XK/TlrlVwKYGRzX23qYgi9cLwvAorwao5PNvYdVimf
 x0Yn+v8OEFQMnR6Vfw0TtnpgdhhmxMiFSTDHi+hq/Ya2mjF6L0AAmlLi8+/yd0Nttq+hd1uYwzN
 Qj5uWSBHe8OE9EO/6SQ==
X-Proofpoint-GUID: g2zYpiD1naJFu9VG6yg5ZlLmn8qW7jqx
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-26_02,2026-08-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 priorityscore=1501 impostorscore=0 suspectscore=0
 clxscore=1015 lowpriorityscore=0 bulkscore=0 phishscore=0 spamscore=0
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2608260082

On Wed, Aug 26, 2026 at 3:31=E2=80=AFPM Srinivas Kandagatla <srini@kernel.o=
rg> wrote:
>
>
>
> On 8/26/26 10:55 AM, Harendra Gautam wrote:
> > On Wed, Aug 26, 2026 at 3:13=E2=80=AFPM Srinivas Kandagatla
> > <srinivas.kandagatla@oss.qualcomm.com> wrote:
> >>
> >>
> >>
> >> On 8/26/26 10:39 AM, Harendra Gautam wrote:
> >>>>> + * CIF (Codec Interface) VA TX DAI IDs -- capture from voice activ=
ity codec.
> >>>>> + * WRDMA channels collect audio from the VA codec and write it to =
memory.
> >>>>> + */
> >>>>> +#define QAIF_CDC_DMA_VA_TX0  246
> >>>>> +#define QAIF_CDC_DMA_VA_TX1  247
> >>>>> +#define QAIF_CDC_DMA_VA_TX2  248
> >>>>> +#define QAIF_CDC_DMA_VA_TX3  249
> >>>>> +#define QAIF_CDC_DMA_VA_TX4  250
> >>>>> +#define QAIF_CDC_DMA_VA_TX5  251
> >>>>> +#define QAIF_CDC_DMA_VA_TX6  252
> >>>>> +#define QAIF_CDC_DMA_VA_TX7  253
> >>>>> +#define QAIF_CDC_DMA_VA_TX8  254
> >>>>> +#define QAIF_CDC_DMA_VA_TX9  255
> >>>>> +
> >>>> These DAI IDs exceed the LPASS_MAX_PORT limit, which will cause soun=
d
> >>>> card registration to fail.
> >>>>
> >>>> Check sound/soc/qcom/common.c, as the current indices (246-255) are
> >>>> beyond the supported LPASS port range.
> >>>>
> >>>> Best Regards,
> >>>> Rafi.
> >>> Thanks for pointing this out. We can either add the range check for
> >>> min/max QAIF DAI IDs in qcom/common.c or introduce a common helper in
> >>> qcom/common.h to validate the supported DAI IDs across Qualcomm
> >>> platforms.
> >>
> >> You should add these ids to
> >> include/dt-bindings/sound/qcom,q6dsp-lpass-ports.h instead to avoid
> >> conflicts with common code.
> >>
> >> --srini
> > Thanks for the suggestion. qcom,q6dsp-lpass-ports.h is specific to Q6
> > DSP/AFE virtual port IDs. Since QAIF is a direct MMIO driver with no
> > Q6 DSP involvement, would adding QAIF IDs there not be misleading?
>
> These are IDs that will be reused across both dsp and non-dsp solution.
> So it makes more sense to keep it in one single place to allow the
> hardware description (DT) unchanged across different software solutions.
>
>
> > would it be better to update the range check in common.c/common.h to
> > accommodate both LPASS and QAIF DAI ID ranges instead?
> No, that does not make sense because these numbering might conflicting
> with other ports in future.
>
> --srini
Thanks for the clarification. Will add QAIF DAI IDs in qcom,q6dsp-lpass-por=
ts.h.
-Harendra
>
>
> THat
> > -Harendra
> >>> -Harendra
> >>
>
