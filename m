Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 416443E63B1
	for <devicetree@vger.kernel.org>; Fri, 17 Jul 2026 10:21:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=205.220.168.131
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784283707; cv=pass; b=S5bh5cRdEonZ2M7XZ7DezpAlxULaoQA/zdMel9HorD+KUnOAkt6uB2OzWNJ284TsYgBgSTMpETHH6PzfFX3b7Te2RfofVT/a31hXogKPl2hmftYPyaNH2w1IsHJ2gwiSRaWSWOn9NMhE/UbE/Eu1X8TAlIo16YE0tupYRpFzORU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784283707; c=relaxed/simple;
	bh=/G4+gIUlSW9w20eY18zrYk65ITLGo9r3/SZkfk+RMdk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=b+Lb42FpXfVD0WYHutvH4q8RvWJNPUp9jhqEuLQhFPKXHIrSTfpL5Re8bNGCZ7X/yr93EmAcsDvVo+rleXmE/WFXjMvzTopb5NR40xPOWubqUf7zS18H9l/oVNOrqOySUpOxFdQ3gDEnZv0sEPunAGoFTA/5YmoJGHDS4PSO3SA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=cBNifLEv; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ayuTtwXP; arc=pass smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="cBNifLEv";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ayuTtwXP"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66H6d2Lx821098
	for <devicetree@vger.kernel.org>; Fri, 17 Jul 2026 10:21:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	dNQ3xUEu7rEeKDGZoZN4sDPkrMPXqT5TEYjiXqzqNpQ=; b=cBNifLEvBF3dlMDu
	q0RtTkWQW8q/RumeZGb1An4tC1S6kUiqpRwvBJBtoXJs7riIhYJY61Cb/oMK87Oq
	F5+/6CHrkLi//+Apm/3yywZQyFrLmWXCTlAKUtJ6Idm9ALdj3VZNV2Rk3PYeLKxY
	OuOsc+mb6SCrtgt6TodcTK5NJ6wDcP3l1CLCp1+yWOzT50HHTTMiE6LCltGFSpj6
	gJZPzgbLp9SZwmRZVUiQrQXoFD8vIKj+WVINfuRRv4q8anXGChdaQn/BXIZ3Skzl
	qS+SpQsv60MnV6UJkoFiJQ8wog5VCADNVV/uVEHk+R3FFpSmAwDgyT+VQWvYCMOh
	kjeFTg==
Received: from mail-yw1-f198.google.com (mail-yw1-f198.google.com [209.85.128.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fffag8tef-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Fri, 17 Jul 2026 10:21:41 +0000 (GMT)
Received: by mail-yw1-f198.google.com with SMTP id 00721157ae682-81b0c72826eso170366097b3.0
        for <devicetree@vger.kernel.org>; Fri, 17 Jul 2026 03:21:41 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1784283700; cv=none;
        d=google.com; s=arc-20260327;
        b=WOAa6zYVEVov1D+Dzfht39K6tuRlgDwKP6eat9l37VZkF3bbY3A7X/+9lLt1aklmLf
         LJ4XaPdftsGc/VI0C5REfoNhCp/cNQjGsS9DU2oCgUZPDkg3Qb1QqLuOs5FjG5nnGfI1
         7c2cnUFbTV/bDORVOQ8FNQM9OL2/YESB88UgisF7KAa+SuDYhrS7gtpgiy8ZHHGLgvpz
         A9IcJYDIhFh4oRKbVJnlYahiqKjZdkvpShcHTBnVINI1VK0YOyPBxIgHlEHRXK10wNGu
         jAcsL6nGiP1KZcDmzHRDKGJDHR8OJqExrIIwW9qftO52Qn8di2pp/PjZbs2b2wICpLIx
         RfNQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=dNQ3xUEu7rEeKDGZoZN4sDPkrMPXqT5TEYjiXqzqNpQ=;
        fh=8HLGQEs+vjOwRFjh2/CiXMKWUi7jQTCENrq9xr015IY=;
        b=YEbQTrijJ/kBbC+Pas2oZOOUBrKHOR7D59Xyq/WyRS3liJSFrv21TdtAwZx5KYUhEj
         ViEt+dyJTnGCPKTtJ5eOfGLW7O4uJYc8ka7Wo04yhF8fTudmKqbeTjBmXDvGbeWAwvxP
         g/yminbbfTbQBokNPtVTo+m6fdyR69EdX/9yZCCWvjEfouxpVVV8XE2XZKhpH//8rctA
         ZJNjLf+PxUtA6EK2oK3eFnip7W0V4OhjXVCYCAUJtN4EgfFguK6LpCqkIv+s+tbHTP54
         hCYdVPo55ybsKasXKECujd6ISJOMUZXAb0u8+2MfRRH7HaoDaR0KF3KDji/l6a4gS5Cb
         BnDg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784283700; x=1784888500; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=dNQ3xUEu7rEeKDGZoZN4sDPkrMPXqT5TEYjiXqzqNpQ=;
        b=ayuTtwXPhVP+1I8SfKWP5CIBHd7kJl8cntV+xLgBxuGimOyfn+swUULWUiRqONEXFr
         WMcekKtLtajoVsfiiQUJlDSRHW0IzYoCXVzGK4G/DWihTic4D/5k1q6M75VREo8NwSIh
         CeUReBW/XjupqFdlCL/8Ql0C894Skumn+RdR/44wzqqpmxwFQqurdpD40AXX1jQa0Rtz
         aDSG8SliEbb7wPyLE/S3KHNLIaVxvp/O7F5QS/US5WhgBqm1bYmf9BNiRSy7IDwOvi5J
         vQpAkSd4lz1EyLCaKnA1JYErnhHEII9ld8Dmol5sLZbmX2q5IMqk9UfxZ3B3Q+Ic9hC5
         bLbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784283700; x=1784888500;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=dNQ3xUEu7rEeKDGZoZN4sDPkrMPXqT5TEYjiXqzqNpQ=;
        b=ZkoYzmJp0TPSPwSj3FDcQhMFVLE4qE/86v+0lB5JO6p5AxEv3LKP4nz52mCavLhK7F
         Zu1e/PzxA5QH1nKNnT0PmtxjAFZdwLHanAPkygjBQ+sAziLv7AxssmWICRbCljs4V8EZ
         btAqjpetfcXH2N1/xkciHkyJCoUZA3ik4YfbHDDOuZzV/eSyUjwSvsa/ieva163CQvjA
         V2E3n/Lg/gmgOP2AR/xIWFmFfyI8K/hRi5qzZR+xv9yXVnuz7HzeUkVAdNPC9aS9pYwW
         +YLbRqiAslZfPAyo6JjRS4mou/VJ+i7AEQX4PhzMiOSd9nuYzmfs3g7pIR3+qbsUXZrp
         +cAg==
X-Forwarded-Encrypted: i=1; AHgh+Rp8ONN3FNNF9buaLBBjAdsyJOFeBdCg9V/gV0yhovd2G6wP1U87PIqUW24dfgwRfN+EI5ZBeavYDoGW@vger.kernel.org
X-Gm-Message-State: AOJu0YxsiFNzdL3PB90Czskh8oKkxpCDvL9vYlKXXKuMvYjpdpjkB9/u
	VztulPEvE1AR7Nb3LFhB9lSQSxc6/3BZP3cLYe8PGh1D0aqQgu1gGoB263pQk8GYvInHX8pxbyc
	8aNQoXHwMFGEm4SPIscV97XIF1FIIimMpXygcVhAS/3VwZ7JDLu3XpZGgK6eyJPISmes5OZ3W0M
	OvvPbfZZltPLbuyPZgHDP+g75aaGy2HHYLYKItBTY=
X-Gm-Gg: AfdE7ck5TaQKM//6od0V2OvqToa+oeZd17PbqHsFnCtma6DfHwQKwQRPv2ZblRr5s5S
	3EusYPVjCSS+m0gMVHg1y9e5VJLzhTGnTz6CCyeFDkvGXYJKGxT5JrZZiH0cs7NdzRl14tpTxDP
	vA/6Hs8IM+LBMHEdh/o8sWR4DmfXU6bdJ3rPruLfdKyHulH1WWkFm/rdz4Ww==
X-Received: by 2002:a05:690c:eca:b0:80b:968:29ff with SMTP id 00721157ae682-81ef283962fmr4760867b3.53.1784283700289;
        Fri, 17 Jul 2026 03:21:40 -0700 (PDT)
X-Received: by 2002:a05:690c:eca:b0:80b:968:29ff with SMTP id
 00721157ae682-81ef283962fmr4760837b3.53.1784283699924; Fri, 17 Jul 2026
 03:21:39 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260716232641.2659710-1-jm@ti.com> <20260716232641.2659710-2-jm@ti.com>
In-Reply-To: <20260716232641.2659710-2-jm@ti.com>
From: Ulf Hansson <ulf.hansson@oss.qualcomm.com>
Date: Fri, 17 Jul 2026 12:21:27 +0200
X-Gm-Features: AUfX_mzSz06nBydsnL59jdtc7LlWaatmuH2qAmiMtcQw1WWvAMpZ2E_IF3c5_YY
Message-ID: <CAPx+jO-a3+mv2msL+12Ag-xs33es2+Wxbr_uKRMY3rbN7eL-cw@mail.gmail.com>
Subject: Re: [PATCH 1/2] dt-bindings: mmc: Add post-power-off-delay-ms property
To: Judith Mendez <jm@ti.com>
Cc: Ulf Hansson <ulfh@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, linux-mmc@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzE3MDEwMyBTYWx0ZWRfX4UwRpzbUuJm7
 jyMbq1OgDMAZskY1ZzOmFT/6EbnniCjOinREPKkfDps1/it+2VAfeILjwNgLEozvXJwCIc2F4le
 JlcM34D9mZSynKJRD4GTEWU9cmUGJNY9LvQ1dKJIkzGLV7/igcNP2QUWhCB4tZfS19UrNySPaip
 ZFkK1xCPAXdGxDz5rD//ioVNQD+NpB/Hj42RPTmt9awUZFZFX/z47DPEGDeTBujffa2h/+bTxAB
 vdq9jH76WCtkyFBIl4xo0a9H71hysIlQC0O6wYpKZggQst7/nY+2jy2B/sD1w8yOf3P6OrCNPnB
 K7oTZ4T+YARWpYFGLXbW1BjaOlMEKGFfEVJGAdXkhBbU1Su6hsG7G5kIpwg3w+5iuQUACBmVGKI
 EL+AxUxc+i3n60f7soL24U9p1t+qslv4eP91w07JM2ZV+rIwwo0SMUReB2T5XnnqkpDRqyfwLKL
 tq3AZMAge3Ekmg5hi9A==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzE3MDEwMyBTYWx0ZWRfX1JgOE+wONd1/
 NN7lt5R6pviH0VFa8RjIDHv142gNZzFciFhEl8ai8vsa2Ke8mVk+dUlq79TYbe9TT28rnW3IseR
 rZE4yIT5f1OZN9Bf7PE196MakEbch8c=
X-Authority-Analysis: v=2.4 cv=KZfidwYD c=1 sm=1 tr=0 ts=6a5a0235 cx=c_pps
 a=g1v0Z557R90hA0UpD/5Yag==:117 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=_K5XuSEh1TEqbUxoQ0s3:22 a=sozttTNsAAAA:8 a=dMylU1riQLpZtJOQe0IA:9
 a=QEXdDO2ut3YA:10 a=MFSWADHSvvjO3QEy5MdX:22
X-Proofpoint-GUID: Q3AuIbWldXFhpB0C7n520V7qPQbvf6rF
X-Proofpoint-ORIG-GUID: Q3AuIbWldXFhpB0C7n520V7qPQbvf6rF
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-17_02,2026-07-15_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 suspectscore=0 clxscore=1015 malwarescore=0 spamscore=0
 adultscore=0 lowpriorityscore=0 phishscore=0 bulkscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607170103

On Fri, Jul 17, 2026 at 1:26=E2=80=AFAM Judith Mendez <jm@ti.com> wrote:
>
> Add post-power-off-delay-ms property to MMC controller common.
>
> This property shall be used to specify delay if needed after
> deasserting power during MMC power cycles.

Please clarify with some additional information from the cover-letter,
like "specify custom delays after MMC power off to work around
hardware issues such as slow RC circuites on MMC VDD rails."

>
> Signed-off-by: Judith Mendez <jm@ti.com>
> ---
>  .../devicetree/bindings/mmc/mmc-controller-common.yaml    | 8 ++++++++
>  1 file changed, 8 insertions(+)
>
> diff --git a/Documentation/devicetree/bindings/mmc/mmc-controller-common.=
yaml b/Documentation/devicetree/bindings/mmc/mmc-controller-common.yaml
> index 3d7195e9461c3..3ff68d32a308f 100644
> --- a/Documentation/devicetree/bindings/mmc/mmc-controller-common.yaml
> +++ b/Documentation/devicetree/bindings/mmc/mmc-controller-common.yaml
> @@ -275,6 +275,14 @@ properties:
>        not available.
>      default: 10
>
> +  post-power-off-delay-ms:

For mmc-pwrseq-simple we already have "power-off-delay-us", perhaps
better to re-use that name instead.

> +    description:
> +      The presence of this property indicates that the card requires a
> +      delay (in milliseconds) after power off before the next power on.

Again, maybe something to indicate this is specific like "specify
custom delays after MMC power off to work around
hardware issues such as slow RC circuites on MMC VDD rails."

> +    $ref: /schemas/types.yaml#/definitions/uint32
> +    minimum: 0
> +    maximum: 10000

Are the above limits needed at all?

I suggest we add a "default: 1", as that would correspond to the
hardcoded value that the mmc core currently uses for this delay.

> +
>    supports-cqe:
>      $ref: /schemas/types.yaml#/definitions/flag
>      description:
> --
> 2.54.0
>

Kind regards
Uffe
