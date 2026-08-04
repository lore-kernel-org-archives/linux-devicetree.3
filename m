Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 536AE4457CC
	for <devicetree@vger.kernel.org>; Tue,  4 Aug 2026 10:55:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=205.220.180.131
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785840921; cv=pass; b=h2F4bf0tTW6tGL8i8F7q3qDTkYvZcS+vcPGmO8eoNXZW69TUUByTkkkRuSPH5MspcbbSL5K1b/gsfUleC2eWoLAieTZBIImBZ66by8Kh9y5VW6KRAZC39gfE91a+kp/lFBidqIfYXgLAD+lx6BpLSHHHvetO0fePTIR5oYGXFHk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785840921; c=relaxed/simple;
	bh=G1KQ+LVtHy8RC0QnGA0WPBnXR1RfM0037fuPlYYD2aw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Um/6WZ21sxJH2Du2UBYw1BxzPQev8pSppo+w39MrsWOJ9cXDssLk5iXupwm6mpnaSk/8W+We4ANiNUiPpZfoVb4RZIrW8RJNQuhhCuQ3Pk4QTiQnWEYM4JzPI7+eKaMFZIO0j7spvDb84yzBW8ZzrI5bwLc5LzmOy/yN0nB3O20=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Y1ns8Tli; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=eANkwK9V; arc=pass smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Y1ns8Tli";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="eANkwK9V"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6748C15q3016238
	for <devicetree@vger.kernel.org>; Tue, 4 Aug 2026 10:55:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ufWXi06UUaYpOR2ocZYH1DcUH9ePXARaYiL0CTrWXC0=; b=Y1ns8Tliv4Vt8fg5
	n06OE2tVnaiAXIrrFkxkSoAikEz1oaSN9zNiY9PpxPb+v5DrbwCqyWlx94EfHisS
	Df9qQSz6yK0RKQk5pbYgpR7GnKWiXvfK8mRjF155XEC8teVY7k1jY+vn72KHAAQJ
	Cp7P7b0JhzqI0XYwGsLlU8E7FbhnxB6nFz88rju/aALA1fxyzCAVxQgED79DwJ/c
	yuL/zw/wpd1rzzGnXssQFFQLuGvmQlbDHLsSPaLAiGKIzgf5xB0cR2g6kbs4AU9/
	ZVXuwBClcQmDZhIW7tN1QtgK4tU6In7ti3nhzaCqHNlDPnsdbu88ivJ1v87yomXa
	bC3Zhg==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fu7271ymh-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 04 Aug 2026 10:55:16 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-51c1d30035dso30309961cf.2
        for <devicetree@vger.kernel.org>; Tue, 04 Aug 2026 03:55:16 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1785840916; cv=none;
        d=google.com; s=arc-20260327;
        b=sy4CSy4T8xaHMlnIDZIG7XK5fjhmoa5v5LKGsgtpsMJI3VyAFRCfUiix8KsMh+lQEV
         LkSh0U4tlfxeoF0zrqqiDdxGYnuljTAX0eagf1+m0MZRrOevUdCryyhKqDKvmbICbX9c
         Kt791k1rPsabDE1EZdLTrFP0Pv4j9h0dxDQE4ydyvbpL1Lgatybg3um6CQS7wOtlkMnx
         AwNbW8OxAA9bOJJUdujrFGWejZ5nx/SKR0fYPC6sfG7zQOqAjklf6z6oH+NJt2fjz804
         tEadLwHmA8Gm7fy8c0MyiU2RlnfBOOb8moILDXKihYum0RZ+PlkuaP1SrZ+v6tNpnEzh
         y2eA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=ufWXi06UUaYpOR2ocZYH1DcUH9ePXARaYiL0CTrWXC0=;
        fh=NXS7KLM6PekLsTiZoLL0LgiqkZCTHhKPhuTnBcfioNo=;
        b=jBmt9v3yx7VPKkiibhbzDcqGKcwCIlrOQVc/3E3r1CNuaG/KGQjLSodptKXwbwqCu8
         P7oLA2k9zbOe/XSWY6LU18KbkjJgCrgRAv1A5lX4H6gITsJMzFgkXeU7x1MufbjHbxVm
         BvgcjKPGmy5dbQ8wr9R8OYhYpVIWe7uPdy4g3Hr1GhC3oizKId64aOtCZjFGmbo59Hfj
         L2+R4GAHwmkJuJvyaGGmJzBmJVHxJB6uPU9XoZQ+MQ1YB2py+ZoITVdjnC7yvfhNtZTR
         Og99L2rTMofYSMv5I0VIkizSqCcc8eTnU7bSFMmcbNFkId7VdstC+7njH3fd6bjgujfN
         m1zQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785840916; x=1786445716; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=ufWXi06UUaYpOR2ocZYH1DcUH9ePXARaYiL0CTrWXC0=;
        b=eANkwK9VzQixu5jQJhu29WNi5zREerRJmRXkAIAqeYQgNMOXjgvA59W9mpGwmq9/OC
         x6oMtSEm7p3rwk9SpBnltD+vCHoaGlLI4xWmi3uftTmSj5JJKXZbXRHgDRzsZd37GwVS
         EpXWFSDmzlFj4rn0fFl9JQKDDPZOEnaC6YxWzAXpNteVxFXY+qlR6iZ1gOLtjXkL90aS
         KSe07vt4r/MSpS+0yg6O7XXj8jOzsm2S5e7/xVdmmi4pt3KCWZFDQJTdRUE9pqXGI9QX
         kIB6bIPaR7LYmTvdtU185sUaWYtBHGxNy4M51kBes2MSKT2oitJn7T5u+4bX9OkhKg/f
         IA1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785840916; x=1786445716;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ufWXi06UUaYpOR2ocZYH1DcUH9ePXARaYiL0CTrWXC0=;
        b=l8CfhpQ9PErTt7VYy1EC5giSdd8U70ceIhmd2QIRyakBgn8W8uBbuCqPD1+UrUEhsw
         39VqjjzLGFp7entxMvyKIcYTb34MLrMOC5+RmzUQXuQhNCaFT8ku97+8VcoG1x9n0wBQ
         88ViViK4Q4u3dvirHxJhFAx5IXWB1PfVJZl0LnsKbmlzKPTZ68rDyOVp3qTQqERGgGEu
         k15ny+sRlc8T8rUvCrm71dejAl1JA7MU2NdbU0jV4APgihb5DfA8BbitR+PGFW41x/NO
         D6r6YsfcSo6t6cLYVf8qDTMgGNoTS4cGtVc9a31zAuDTlN6onMsdNpriZMoGmY0/p564
         34Ug==
X-Forwarded-Encrypted: i=1; AHgh+RrTq98xrutFZDIno3NPTVdmkZ3sPCaN4mVxWGwg46VAJ1D5WxURXMxHcBQvGY6dhUGac1PzNNyrig+p@vger.kernel.org
X-Gm-Message-State: AOJu0Yx4EXzV4tqrMO2r0JaRRWP6DktlYxtEJETjk43AZxUU192uX4fX
	mw8vfZL5SZ2Me5Vr/bpAtLM9bQwa8/bT1btNmsKQysCtuSMIZywvD5nF/KMEU4XF4qgwyFC7dyL
	K1a08MCOLj/Rsj6k7nh334TdMneD1EiJZIovl3bK8w9Xu/rp1EwWg+GzyPuMmrdWuMEiUcdpDuW
	9yjdCiFTifDkVja517xEM35vGUmGi2Crfv5pej+cU=
X-Gm-Gg: AR+sD10AvxE0pZVauH6bWke6HvyvNBwBhBvJLXr/tiuJSYOx7Qg8X9FFGSAnRXVhO2Y
	3qxUdO8IGc1ZYoeqUc5UXdhDhfpnKIECrijCgJsdcpG4JO13exD1jFfwFN0A3L4Dj26XXpo2xTI
	LJLLD65edCcEbA4aNLCRfuoEcxB/sIdRgKaQxpGOS64nL/YEYu6Wkg2EFzcw==
X-Received: by 2002:a05:622a:230a:b0:51b:f857:cf82 with SMTP id d75a77b69052e-52b5669e087mr269251071cf.8.1785840915607;
        Tue, 04 Aug 2026 03:55:15 -0700 (PDT)
X-Received: by 2002:a05:622a:230a:b0:51b:f857:cf82 with SMTP id
 d75a77b69052e-52b5669e087mr269250711cf.8.1785840915162; Tue, 04 Aug 2026
 03:55:15 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260729201420.4047677-1-kamal.dasu@broadcom.com> <20260729201420.4047677-2-kamal.dasu@broadcom.com>
In-Reply-To: <20260729201420.4047677-2-kamal.dasu@broadcom.com>
From: Ulf Hansson <ulf.hansson@oss.qualcomm.com>
Date: Tue, 4 Aug 2026 12:55:04 +0200
X-Gm-Features: AUfX_my6NQKv03nYfYlqvoSJ9uyhPkd5qHV0OIawzmvKcfyE9Gp_ic94xtc46ow
Message-ID: <CAPx+jO8G=u-D2saEhzoH7WvLH+TYksbkg7sTH5RdnuZx5gGqtw@mail.gmail.com>
Subject: Re: [PATCH v5 1/2] dt-bindings: mmc: Extend keep-power-in-suspend
 beyond SDIO
To: Kamal Dasu <kamal.dasu@broadcom.com>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>
Cc: Ulf Hansson <ulfh@kernel.org>,
        Florian Fainelli <florian.fainelli@broadcom.com>,
        Wolfram Sang <wsa+renesas@sang-engineering.com>,
        Oleksij Rempel <o.rempel@pengutronix.de>,
        Avri Altman <avri.altman@sandisk.com>,
        Pedro Demarchi Gomes <pedrodemargomes@gmail.com>,
        Erick Shepherd <erick.shepherd@ni.com>,
        Adrian Hunter <adrian.hunter@intel.com>, Rob Herring <robh@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, linux-mmc@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-Spam-Info: AW1haW4tMjYwODA0MDA4NiBTYWx0ZWRfXzIVFf9HBJAI8
 VDSYVZf30XXOUgaFc5mNTQaG1TtvDi0vaaF59NbOPfES1gafuQiTSKFghTBZLDeEzTV9I84BKpe
 QSSWOqUeTfGBVQv1WEh5P19XCg4R/tM=
X-Authority-Analysis: v=2.4 cv=Z6Lc2nRA c=1 sm=1 tr=0 ts=6a71c514 cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=yx91gb_oNiZeI1HMLzn7:22 a=Q-fNiiVtAAAA:8 a=EUspDBNiAAAA:8
 a=VTvvGi8E7jVqzfWfbMMA:9 a=QEXdDO2ut3YA:10 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-GUID: iCI-z1g3heTNCr9-MwoooJq53fmvdvO4
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODA0MDA4NiBTYWx0ZWRfXyp+LXQExSdYw
 cdhUIN1kPoN4y2aS2bpy+2FoY2PKvZe4caV/QlqzCezuGVh/ry8xgotsD53WdLQxnew+7qqika4
 iw7HvJeADo8BUv5PFaYx78xsybld/NiuobTOSirHXRvjO80Xwe26OGpjioVzDRk/EDa0e1J+YmX
 yggevLEOUwc00WNN+Xn2H0bcN+7Ve+duwzfqRDEfCN18ict5dLWz3NPTGGeB50fp9isw2t09pFk
 u8L9RgziZJyqD4LV0ToL83+NGKjP8FG2qI2ds9H8rUkB6zWRMZmQ87K+VtWbAa6S0TJUqdo/45b
 3FZtCgkXKkGpQr/gnnqHu36cKSPM0dum21+gxg/Nl6xbEhLRSKj+TOGi8B3WSiomUl6eduv01SI
 kvEJH9gJAH9rsxbs/vnKe+pPBNWFxdKG5ftjft7fgzx6plqQ7NKwEF6GSsDcPort/zw/Dz+30WY
 NwisORE9I2vzefYxJvA==
X-Proofpoint-ORIG-GUID: iCI-z1g3heTNCr9-MwoooJq53fmvdvO4
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-04_02,2026-08-03_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 malwarescore=0 lowpriorityscore=0 clxscore=1015 phishscore=0
 bulkscore=0 priorityscore=1501 adultscore=0 spamscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608040086

On Wed, Jul 29, 2026 at 10:14=E2=80=AFPM Kamal Dasu <kamal.dasu@broadcom.co=
m> wrote:
>
> keep-power-in-suspend already documents exactly the requirement
> needed on (e)MMC platforms where firmware accesses the card directly
> during resume. Rather than add a separate property describing the
> same contract, drop its "SDIO only" restriction and document the
> (e)MMC use case alongside the existing SDIO one.
>
> Signed-off-by: Kamal Dasu <kamal.dasu@broadcom.com>
> Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
> ---
> Changes in v5:
>   - Added Krzysztof's Reviewed-by.
>
> Changes in v4:
>   - Dropped no-mmc-poweroff-suspend entirely and extended
>     keep-power-in-suspend instead, per Krzysztof: the two properties
>     described the same "don't power off across suspend/resume"
>     contract.
>
> Changes in v3:
>   - Renamed from no-mmc-sleep; dropped S_A_TIMEOUT framing per Ulf.
>
> Changes in v2:
>   - New patch, replacing v1's card-level quirk, per Ulf.
>
>  Documentation/devicetree/bindings/mmc/mmc-controller-common.yaml | 7 +++=
+++-
>  1 file changed, 6 insertions(+), 1 deletion(-)
>
> diff --git a/Documentation/devicetree/bindings/mmc/mmc-controller-common.=
yaml b/Documentation/devicetree/bindings/mmc/mmc-controller-common.yaml
> index 3d7195e9461c..f4663b318435 100644
> --- a/Documentation/devicetree/bindings/mmc/mmc-controller-common.yaml
> +++ b/Documentation/devicetree/bindings/mmc/mmc-controller-common.yaml
> @@ -291,7 +291,12 @@ properties:
>    keep-power-in-suspend:
>      $ref: /schemas/types.yaml#/definitions/flag
>      description:
> -      SDIO only. Preserves card power during a suspend/resume cycle.
> +      Preserves card power during a suspend/resume cycle. For SDIO,
> +      this is a request an individual function driver can make at
> +      runtime via sdio_set_host_pm_flags(). For (e)MMC, it is instead
> +      a fixed platform characteristic, needed on boards where firmware
> +      accesses the card directly during system resume, before the
> +      kernel's own resume path runs.

I realized that I responded to an earlier version yesterday, anyway
the comment for v4 applies to v5 as well. So in a new version, please
rephrase the descriptions to mention HW/FW and not software.

Moreover, as I said at v3, I don't think re-using
"keep-power-in-suspend" is sufficient to cover the brcmstb boards.

"keep-power-in-suspend" means that the power for the card must be
preserved during suspend/resume, yet at the moment this is limited to
SDIO cards. I made some more thinking and below is my suggestion for
how to move forward.

To be able to describe the brcmstb boards, I suggest we start by
extending the DT property "keep-power-in-suspend" beyond SDIO, so it
can be used for any type of card (eMMC/SD/SDIO). This should be a
separate patch and the first in the series.

On top, I think we need a new DT property, perhaps something along the
lines of "reset-card-at-resume". In principle, its description should
say "The HW/FW may have accessed the card during suspend/resume,
leaving it in an unknown state. Hence, before the card can be used, it
must be reset."

For the brcmstb boards, we would then need to set both
"keep-power-in-suspend" and "reset-card-at-resume".

Krzysztof, Kamal, does that make sense to you?

>
>    wakeup-source:
>      $ref: /schemas/types.yaml#/definitions/flag
> --
> 2.34.1
>

Kind regards
Uffe
