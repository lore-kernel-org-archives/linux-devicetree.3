Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=205.220.168.131
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794563684;
	b=EJ8V/cAzTz9uRR2x8/BSeynYIcXjadEZjgkAoi9Ap7HCwvJIDQXr8qUH8PFpXGaSookm
	 uJ2nlLy87O4mpyeY6K4Ibml2CUpx9haS6wvFzsxoDv2V03tajSl2MjWtiOwXLQuwLkP+7
	 G6NRwMpGZflSgL2MCXBQr1e9DYPAlimgdvTktok90An5Z0xf0sBEM1yUSoAmgZgB9cHw2
	 ozCd5OU6udbs1TdBWmf/Z8Q9U5WKJvu7FsHT/UgTm4Ezow+Uo3sWaTJ7x5b2xpED7WD//
	 7FlRs5sMf0W8G2Ltxw6J9e2dDdHIQHzaNmFU6YKFg23b19770V+NlIwYAvG+I0KmhGA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794563684;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:MIME-Version:
	 References:In-Reply-To:From:Date:X-Gm-Features:Message-ID:Subject:To:
	 Cc:Content-Type:Content-Transfer-Encoding:X-Authority-Analysis:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Info:X-Proofpoint-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=MUuHahUXcDaN6PAwfuUtFPiUbcMouajPZQiE1ymbJKg=;
	b=RrSemW54P21aBC9YDnWCnqlByKZUPjU2HtqGE/vDl5r5Pdyid4HkBKKpMdBge2011aZL
	 UHGHSmF7L4/ezHGE85wQwMQp1pqD2/oITYB2/sR3SrHdW0etr/nfJBc+GJIYaGkPapn7u
	 b9i5zw0RUbwE2sbSfdnZs8BE5rj4ujiwyN3IYXC16ip/ThauAZ9HQ7Cv5iVCOIKUNhW/y
	 U0D10kCN6F8zF9dBmSw6WBTxXmJV6C7ZjnglvBfHk9Hv9/zsSuRki25foQ1ZrlfKOTgKM
	 U5uugh7ujEqYtJ6hLDIOCDkYvM/PSZ5LE1er0p3RW7s0p0J4RIq977eaK2fds/3BIeg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b="n/9+4myU";
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=RLBeZ0De;
	arc=pass header.oldest-pass=0 smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9B685606A321
	for <devicetree@vger.kernel.org>; Fri, 13 Nov 2026 09:54:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9B685606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=n/9+4myU;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=RLBeZ0De
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AD8V9qY913716
	for <devicetree@vger.kernel.org>; Fri, 13 Nov 2026 09:54:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	MUuHahUXcDaN6PAwfuUtFPiUbcMouajPZQiE1ymbJKg=; b=n/9+4myUxHJ2L4b3
	pyRYjtpmX9OVXRcZ4u280wcXS0Wh6f2eEI0+P3AfccewIz2022OOhjrNuJYYSAPo
	Pwin2RNBFEMUw85K9fngCx1mpeZXl/my9cxXS/uAkALam5gVWNwJ2+ksOCxZD1rO
	NZeN+ZuRx0jYzszyM5TqB1YFgM2z+0iZT/B7/SQ+sb0TAAbEaZ1oNJxU4C0uH95X
	5LqOoJiRM6tP+8b/8xwi/33ND75GBqiBf5F9ItCeF+ZSI6NpRs+opJRgIab/7/XK
	8fS2QaneQA0RIfIlxcmytR1czXWTIv7vCoGBsoAhN8rKUyD4a9g8yKm+QDih6YAx
	p1q1Uw==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hwbx34hqd-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Fri, 13 Nov 2026 09:54:42 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-93f2c0e6653so15555885a.1
        for <devicetree@vger.kernel.org>; Fri, 13 Nov 2026 01:54:42 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794563682; cv=none;
        d=google.com; s=arc-20260327;
        b=chpzBU9VTZhxDbvsCpAqbY9YgoqEvYzeSD0Y2ft8MSOlUV4mCWfeDQDKdon8STji4s
         8D7SWCQvfu9qDqr7CwosxCe+QmlTgBTlyP38NrTub5W23OW1Np/KDJCJLbqTwdUSZQWY
         67g6L4Xd855vIr7attbLW+ZEFdrJ6whC7g72B2HMcJ/KGsxdslzIVPhhpy9ASieQbrYM
         x5IID4P1gMe82Xw7ilHVIvzLLGJmYiRHVESBWR22bVGrfCegi6AyELL3GiSCDDD5PpXS
         /esk4npEpW7sTcvtfA7zIYXG8MbYw5ZxvGk+ZmxP2SBydbXzXArdS+KFVZqogE5co8rT
         OFxw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=MUuHahUXcDaN6PAwfuUtFPiUbcMouajPZQiE1ymbJKg=;
        fh=5F2iYVlRBNdVDgNgdjdlSC1RZrDH00jLIBaLlv6eel8=;
        b=N8UQFi2912vuSZBquxwGnKiWhjHIXIkvz6p8SsS/Bp6GqoBwQECX2h1H6OYLUqYuZY
         fuHXXZGR58SshGr4InCpF+eT7gtK9Sfg0O/kvkNydksLVGASXwcbmdswR3YPyTwYJiRe
         DGHwbvKPqbBdRLjVtoVypB7nQYpXBrYQmRuu5z1ZgAFz0X2EwQgjdVO4rhiH2f5w9EMe
         6hTYQhOnrJBVpSZEOOFprCdYrGRbwpJNrVt5LlhgAhPfDxDPOgM2S/JNkq/tLPOU3sFh
         ra/S+e27kLc9XoX8R8gVcsDMs9Gg9ZLg5slr5wauI9VZlUSu1zzAwnnbRG2W0Qrfp9ez
         wVPQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794563682; x=1795168482; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=MUuHahUXcDaN6PAwfuUtFPiUbcMouajPZQiE1ymbJKg=;
        b=RLBeZ0De+7RfEvY/cOZx6uuhMrok2LGsjpSfyI9vkMVjG+2kzDGSlBwlDBJuHVYh7i
         Lpw1rdz5m8VFzNV+vd7Y7HOLyeLlfEZu63TB6K1OfXOHJwBigAXiCUFKVMiXK5NYkqKg
         D9a5enkb/wVX2ZstPRP0v3SykFvQASPXZe+RAkKB5UGcwe7YJkj0HRZPG5oC51eeCVUK
         r2COxceOd0Rzvs8eiuuIFDsbxRr+xAxktiPn0tl8o4OSv11iidiApFjZDKOm78ZmWpr+
         8D5e/e3ADFKmQo13eh7G2AjnjWTgMNRumYcgtedVcRy5v0hFgIVJQGSVmfPAiei3xqkw
         wPeg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794563682; x=1795168482;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=MUuHahUXcDaN6PAwfuUtFPiUbcMouajPZQiE1ymbJKg=;
        b=EVR7Z145y+KuLC5YuUR7+W9z1jL6PbHHgA8qO9euk4kBDfCmPuPCogQza9UkiYXd/m
         rzDovyhQ1Ng7K0eWzH59mni2bhnJHELXmgrH5iWjIyf7H4tWfFJy0nh3DWNlzy7qMY0z
         3h/wFJARZNgtqWSHsDCRMFcdoH7qfAKWepIXfD4n+TmkeDkENaEvVDpeoh/JXILcqG/i
         U5sqc9SynEimui8nwsvkFThVF75OP/pqoovgfQcRbsh22KCAtrRsUhxgSYt9XHaT5cIa
         K3zsqOx/Sv3L2E8x895yvtY+gVOFQWz7hpLRJtMPu67uYMFS8m7ZxOHISjVvCwwicsCa
         4HgA==
X-Forwarded-Encrypted: i=1; AL+hErGsgWZkR9eqB15VssEdu4NFF4hvN2IDLKq1Ilo0O7FGyCb9ID7/4zFo8F+SLH19sfsy4Zqv6Fef8xuD@vger.kernel.org
X-Gm-Message-State: APuU4Z/rNezDZ4Ucy7PpDiPvmAumbi6i+czCq0JI1n3MiW5bh5Fxpsdz
	uAVDVUPv4AjmF33dlZ1+exRIHib6XvnMD0GsFmFOvlLGWswC36in6+HDfZYvUe/HIiLAPURqo0c
	BjPkD+UZMQt3UiPCsYyB1sflVi1OSP0DEg4CHt9bsL1ioXceUTDNEKwAWWpY7S49EvLBAymURIC
	ckOb+G7TjWvv+p0RnK/FtWRXtBQc8PpEqMq0yLipo=
X-Gm-Gg: AYBFou0wkWqeP/pj7Jxuu/NFBd4fkq39UV4NjlA8C1e1YQRf+QbKc2otfTuOZ3vDGbS
	w3bm4On8SObqbLkUrP8J39HRU5TSIr/MGH764+vPTzCatcqm+WKxDtxQLuJfToX/9hZiDjVx+7Z
	s1mlPy0LmTHy96OTcFJE6aXTJZjjrsBgv1CuWk8JGyv7F01IWWjuLp9Zw4S+5eErMReK9PC6f7L
	34oYjMe5oN9lWC6gRnMGVih6FbC0OMH4MlplxUt3LXypaiXUT7k3i96+MP5PMyRrid6SRu5xlpY
X-Received: by 2002:a05:620a:1a29:b0:93e:942f:b8a5 with SMTP id af79cd13be357-9494baf6dc6mr335666585a.14.1794563681678;
        Fri, 13 Nov 2026 01:54:41 -0800 (PST)
X-Received: by 2002:a05:620a:1a29:b0:93e:942f:b8a5 with SMTP id
 af79cd13be357-9494baf6dc6mr335664185a.14.1794563681101; Fri, 13 Nov 2026
 01:54:41 -0800 (PST)
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261113-glymur_camss-v2-0-b1b76509c744@oss.qualcomm.com> <20261113-glymur_camss-v2-1-b1b76509c744@oss.qualcomm.com>
In-Reply-To: <20261113-glymur_camss-v2-1-b1b76509c744@oss.qualcomm.com>
From: Loic Poulain <loic.poulain@oss.qualcomm.com>
Date: Fri, 13 Nov 2026 10:54:30 +0100
X-Gm-Features: AclHuK--hQiioKQaB_FA-5QovlmCsdFTukadEaIJn5s3vWyrV73NAS_u6OCE7JU
Message-ID: <CAFEp6-2Twta_X4nyQVBa72zj1uaeGiK=F4j2edZFJrXA3rmtFQ@mail.gmail.com>
Subject: Re: [PATCH v2 1/2] dt-bindings: media: qcom,glymur-camss: Drop port@3
To: Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>
Cc: "Bryan O'Donoghue" <bod@kernel.org>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        "Bryan O'Donoghue" <bryan.odonoghue@linaro.org>,
        linux-arm-msm@vger.kernel.org, linux-media@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Suresh Vankadara <svankada@qti.qualcomm.com>,
        Vikram Sharma <vikram.sharma@oss.qualcomm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Authority-Analysis: v=2.4 cv=S+5MU4sP c=1 sm=1 tr=0 ts=6af6de62 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=eoimf2acIAo5FJnRuUoq:22 a=EUspDBNiAAAA:8 a=x832WoCsc11X-eU8GdcA:9
 a=QEXdDO2ut3YA:10 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTEzMDAzOSBTYWx0ZWRfX1irP6IGB7bo4
 O2drNhUTsMWNp19O4qX5cR13UE6GCxcZB5jiCCb7NLYoKPdkmvAz3lRIK0PO47IhkCpz1czRa5p
 hUhHPDDnnSNSwFcs+7lKqt3+ZriAGK7gwVYACGFfXFuSJwfKZz+w26e4S43RtpZ/xCS727pm+5+
 oJgO11gftAvXttIra2fR/3d8xuy//nvvCTRwPPbxZJdVbtGrhpBHjFWz+Iq7BzOaPO6EvzoBF/4
 zLVo7aSSnRYEQBYwaKUbRpUq0V/KaSgRgXwv2amZY80xhicPlO0qe+8W40o9HrQNNSj65fehsxg
 M2AAD4JonW68VIh+oC8pJo/9n50+u69qbkOsQ9qDa+6ZqBaS1+V94yclTqaGKyH6DYfRKBafcxT
 nnApRB7mUk/eFd3l3DDRzG+0rSMwh8mcA1S6GagvZ5xJ7n69+1IDjMnHrFu3vBGj0TNiSgOr4Id
 v26zoQ5+fa54gp0l41w==
X-Proofpoint-ORIG-GUID: U3xaBtYIqE6-ufiKnwQWsZ33ur2aOHVW
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTEzMDAzOSBTYWx0ZWRfXzUIWDpYBaNDv
 Ci3c5xkF7e+3pNL+RpAE+atkkcpri/YEVyPzcusNE4qExX5qfAXGCJn6eAcXM4Fj+SKB+StYpid
 aSstdw94SKxOIPBx4+q+sr+xjVxtguw=
X-Proofpoint-GUID: U3xaBtYIqE6-ufiKnwQWsZ33ur2aOHVW
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-13_03,2026-11-11_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 bulkscore=0 clxscore=1015 phishscore=0 malwarescore=0
 adultscore=0 spamscore=0 suspectscore=0 impostorscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611130039

On Fri, Nov 13, 2026 at 9:20=E2=80=AFAM Nihal Kumar Gupta
<nihal.gupta@oss.qualcomm.com> wrote:
>
> Glymur has only three CSI2 PHYs, so there is no port@3 in the CAMSS
> binding.
>
> Limit the allowed ports to port@0 through port@2 and update the example
> to use port@2 for the third CSI2 PHY connection.

I know you put this in the cover letter but you should probably
explain here why you think it's ok to break the backward
compatibility.
Even if the binding is recent and we don't have in-tree users yet, you
may encounter pushback on this.

Regards,
Loic

>
> Signed-off-by: Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>
> ---
>  Documentation/devicetree/bindings/media/qcom,glymur-camss.yaml | 6 +++--=
-
>  1 file changed, 3 insertions(+), 3 deletions(-)
>
> diff --git a/Documentation/devicetree/bindings/media/qcom,glymur-camss.ya=
ml b/Documentation/devicetree/bindings/media/qcom,glymur-camss.yaml
> index a0b77edc212319fad69113f3d55ca24f184d4b23..18a38fc4f9025f6b927780f55=
ed4fab194091c02 100644
> --- a/Documentation/devicetree/bindings/media/qcom,glymur-camss.yaml
> +++ b/Documentation/devicetree/bindings/media/qcom,glymur-camss.yaml
> @@ -109,7 +109,7 @@ properties:
>        CSI input ports.
>
>      patternProperties:
> -      "^port@[0-3]$":
> +      "^port@[0-2]$":
>          $ref: /schemas/graph.yaml#/$defs/port-base
>          unevaluatedProperties: false
>
> @@ -288,8 +288,8 @@ examples:
>                      };
>                  };
>
> -                port@3 {
> -                    reg =3D <3>;
> +                port@2 {
> +                    reg =3D <2>;
>                      camss_csiphy4_ep: endpoint {
>                          data-lanes =3D <1 2 3 4>;
>                          remote-endpoint =3D <&csiphy4_out>;
>
> --
> 2.34.1
>
