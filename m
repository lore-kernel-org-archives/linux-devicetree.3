Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 48CC43947AC
	for <devicetree@vger.kernel.org>; Fri, 27 Mar 2026 21:22:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=205.220.180.131
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774646539; cv=pass; b=h9EwQPAh7fKxaE+cIa9znUexY4jnvH0iLFPL9lBqWl58a4+aPEGCKzUWK23Yw30MTLj9bRbqUTgdPbGR5MhXwOJ24uxZ4aBBquMRc94w+hujotQXVQo/323ED5wqoTpcT+nA05D3VyM8HKFquQWW2Gzkus0/eXHsPDihnPdx+Cc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774646539; c=relaxed/simple;
	bh=EKd89lwZSQ/xsDQeDeVnhMqnSWOHBwJ1HhYorIEMpOo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=CUNlbLrHCoUUmmoMj+PA2skFoXkPCJjbgPeztbGx71dnCrfIg9YqzbVqotmhLGZqylvB222jlA0uxcYz/m48nh/Ry0stz+4khshmOWUfm/Z40bGg/c4pMq6HKU6w0PN4xsBrksAE2DAL19+NuUIubvkRi0afYLdXX6S8lBidi/c=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ItGHgQWd; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=TU3Tc/qS; arc=pass smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ItGHgQWd";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="TU3Tc/qS"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62RKtRxw3504128
	for <devicetree@vger.kernel.org>; Fri, 27 Mar 2026 21:22:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	zeKQIQllLYW41sCID45frB/eLHlYNGIKXDuo/pPMVtc=; b=ItGHgQWdEC/OotkD
	lYqaBWBVfEN8SJ6MUCVvSS00UXSOu8XmYOg8IzeyNCPpnVxvxKUfSdWenTNIIHhD
	CU2cfZomO7EliK42WXN3RT0NihJFx8578fC7UCIgMtxkVC4BE4VunAF8JSNQRisA
	FcJh33p/JrXf+Xg5QMkw7RzM8hkNwCVXe9ie6iOg40Rf5fwRFThQEoQsIRlwdhIF
	tgkxGhLQ/bljJX4XFidEr9Yz3W5okEiEkk1ia0q0YrJ4jc0ISWFxjdGnLKBEcyTX
	ZnOa6hBta0b9evaUx5ox1NapVJaZFYyEEHD+/htXFvQ51Zze93h9Wtk5EOb163jj
	A3K4xg==
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com [209.85.219.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d60fkr71y-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Fri, 27 Mar 2026 21:22:17 +0000 (GMT)
Received: by mail-qv1-f70.google.com with SMTP id 6a1803df08f44-89e56a8c863so17335416d6.3
        for <devicetree@vger.kernel.org>; Fri, 27 Mar 2026 14:22:17 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1774646537; cv=none;
        d=google.com; s=arc-20240605;
        b=BJgpQyflURS54VaVSR08tvx8VjEuVsx+QThFfc8yaqIH6BUEat4swHGhI+JlFrkp7N
         mh/nL6ffE1pCrmy+pykx7Gl9l/w2dK3nRdk/q1a98qNJO8gHmP9BhQYxT3yNR/bSCyny
         qW51K5oe0NJiRPSO2TGTK7zJPFLJRoECke3ns1kZ0S3VEyARW7FmGjOTN9C+ht67R+Qk
         oKiWvYtAeKusysrOF4r013x5xG6zjBxcrdA450xNWBW2uKaqndQLpIM7pUFoW867HwN5
         ji42EYHhNTJoDx46+GYkpU/egDwPQhyXzkHd1IhWyHJKwmaY414iJZuLnTyfeEqhGpwl
         /v9A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=zeKQIQllLYW41sCID45frB/eLHlYNGIKXDuo/pPMVtc=;
        fh=DxtPC4DHARKxSA7cTUch+CLbxtkYh5kGVYArkQCZFkk=;
        b=K//8Hs8sgce3smkGhUiiXo55B1zodsLTSARiBzJkmy4l2s6GMSm62N3RpcMyFArtuD
         +kcc3xqH2weexl9rmNgEbIsaz/soreexUQFWYbMr+2cwCosK20sDl44KH7VoMt5CkSJa
         MctA007+mBr7laA7PcQ0WN5dEDkUNuYvHBQHju/pR6mtHgSeeTk97LhQIabAM/yzdoAO
         FPC7CWRIo9VGLGnRyTVSbhJtl1ztAw6phX3rmleJQHbVyig5pslOjm+rSddj8W7p4mET
         0Zx3uq8ruxlkwB5zCac7qrc68Zv0B6Zq0Xd5k/qEMmyuprOC7hqFZOte7ePBDjReuofJ
         h+qQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774646537; x=1775251337; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zeKQIQllLYW41sCID45frB/eLHlYNGIKXDuo/pPMVtc=;
        b=TU3Tc/qStrZnr1l5foed5hTU8hBwnFi3YjlkMbLLg91r3MR/axM5A52yVikollEqWM
         3AzK4vs8mZfQPnI+S0kEiWkFfLG8IhRWkxz70jnNL70Pf7rub/lfTupEu6EAdPLjqEPR
         t9VE8z8UEySLYcgzCuOX4cFdDCkVMBqVUdv7qJAu6XhNCbccBQ/Yyq8P3J84yo9XSUcM
         8ISWxnGalREu/klByImrhKVHEoczkrlmPMlbItzEtaXKhEZt2gCiSUr6LIo2psj3Ruz7
         x7LMDxykO7DSKjo3CxPZE/oNjs3R1iiO4f25sb/7nC6XDrrU/fYxjTOxRu8E3cNkGcMy
         9jEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774646537; x=1775251337;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=zeKQIQllLYW41sCID45frB/eLHlYNGIKXDuo/pPMVtc=;
        b=ocVvsW3dE02t0dNlzvEQTcmRExV2WeI3/Bls9jOW3rYHfRBqRa5FTG8yoWruxZMBg5
         aMsmv+UlIMb/Rw3JXghp1LJdXGV1oWeibezu86ae4tZyz06K4qDWCV8lddo4YNMYxsHx
         wB0NoOJ/uEK23rTl36h+3owko5mD9NgDZeV0GkaGYNjIcgtVJzkEWxtrfD4vb9ECGz1t
         MyO/4+9HUarVv4v35l1vo7YUGz7ywLn2FSTxvu5eAh6YT+ZyOSUhAlwUcCVyWSqjiMis
         C/HFcQqnRQYddxasc8/FN9g4MdezUAlX7WfldbAzc1js0/KlDW60BLzTKImAn12uK8GH
         0+VQ==
X-Forwarded-Encrypted: i=1; AJvYcCWQazQEjlX1kVFMZk1Bj0f7cxyj6GZ8ElG1YJYnp7cmzyM7WTYrnaft1saUZsPukgekvtMIdW3Fk3jk@vger.kernel.org
X-Gm-Message-State: AOJu0YxNTIdeC5eqWsGWBmYnWjWWEysklrG9YL3T1PS39CyNeLoBoP5X
	SSjjLpQvGGkLfHd6ia7NuhTeeuALz5XemHsONAvKdh21U9ZFsbZ0wA8YKVXj0qNG5P10YZ5gSxQ
	L36rguA7iUDlMjm4dW5kttE2AUxChcsm22ob0Gi/5pG9tUITaAisN5x4lo2pQ3ZUQdeTCWxnOK9
	wne5aTrx34whCAN5JofmUWREZHVsEK5xqMRDDPCfk=
X-Gm-Gg: ATEYQzzqLFO2pyd93sWdg3pxYOda5SQD+xOfhBtTk6hp/9J9l1msHYXf1+KTqLwJ1U7
	/Wan7S7UuvKX4DGXs64Xul0/RlQw/0174x/07oyxb173qmEpeTyK+sGJQ7NkNOW5jVUpkDl6Ho1
	C0lxZvwJo6+fUi8nlcty0twVlVWkHZdjW2e73TpfDPam+UV6nWAnFo3+1ImCeL0k9iu8W5sWjjp
	UXgLjAjLzXa6nV7ibiGcyEWY3JA8viBxazsK9nIdsX3gL47Ml3VsPSSCDgpufVsSNCC
X-Received: by 2002:a05:6214:4602:b0:899:f820:641a with SMTP id 6a1803df08f44-89ce8ea0959mr54540476d6.30.1774646536615;
        Fri, 27 Mar 2026 14:22:16 -0700 (PDT)
X-Received: by 2002:a05:6214:4602:b0:899:f820:641a with SMTP id
 6a1803df08f44-89ce8ea0959mr54540086d6.30.1774646536246; Fri, 27 Mar 2026
 14:22:16 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260326-b4-linux-next-25-03-13-dtsi-x1e80100-camss-v11-0-5b93415be6dd@linaro.org>
 <20260326-b4-linux-next-25-03-13-dtsi-x1e80100-camss-v11-4-5b93415be6dd@linaro.org>
In-Reply-To: <20260326-b4-linux-next-25-03-13-dtsi-x1e80100-camss-v11-4-5b93415be6dd@linaro.org>
From: Loic Poulain <loic.poulain@oss.qualcomm.com>
Date: Fri, 27 Mar 2026 22:22:04 +0100
X-Gm-Features: AQROBzCYYOuC9NiCmUVBMRzmwgB3BcHsu5HnhoneZ8m-194fkybLeOjKTsh6p1g
Message-ID: <CAFEp6-2s=N9=Z5A3gZZYo+XErBT=gMRHdxB7EQV71wPd3UqYrg@mail.gmail.com>
Subject: Re: [PATCH v11 4/7] media: qcom: camss: Add support to populate sub-devices
To: "Bryan O'Donoghue" <bryan.odonoghue@linaro.org>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Robert Foss <rfoss@kernel.org>,
        Todor Tomov <todor.too@gmail.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        "Bryan O'Donoghue" <bod@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
        Krzysztof Kozlowski <krzk@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Authority-Analysis: v=2.4 cv=U8CfzOru c=1 sm=1 tr=0 ts=69c6f509 cx=c_pps
 a=oc9J++0uMp73DTRD5QyR2A==:117 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=rJkE3RaqiGZ5pbrm-msn:22 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8
 a=_ALasc2Z-pMJxbpW9BwA:9 a=QEXdDO2ut3YA:10 a=iYH6xdkBrDN1Jqds4HTS:22
 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-GUID: T4gEPb0mpjiFhydl2xOHj7l5UmTWB4jh
X-Proofpoint-ORIG-GUID: T4gEPb0mpjiFhydl2xOHj7l5UmTWB4jh
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzI3MDE1MCBTYWx0ZWRfX6Lg6Istymec9
 DZuaZnv860m3CNn5GBLTDEIuCD1JTxAqojZChSG/nzWEmrfWNTglx2dn4+3qJlNS+OOU/zBTh/M
 d2JXt9KYPrqZhSy9ZyzZf1beplu6bWwogoy7wp5rIgLXUwnwhBS3tfQFAP+S2y014d8oFMlmzzB
 yPrSleXVbQ3NYsZTpD9TrOA78JL2SxM2+bqZnRUvI0ODo68KfyX9CVPzWgE8P77KhckHIgR6yLq
 BjM+zQeEy4VctEFHtta/JebykM3tTtnv2s1LOXsj08LeASfW7nSaSMIouQmMdcl8q9L4yVe9gkp
 gnnjsiLnCWeWmiBugLz65pB1khnrMKmdoark0mLruX9KNVsVnbcuL+t8kt3oJBv/E7M0EYaAgQ6
 PnJtkEJofQjQBVp/TGIjZhNUiVVIe/0WI1OM5JkAnDpxraSJsPt2TtebXxFpRg5beP9YRJ9bz9e
 sBbZ9tmEWTEkpj3I7hA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-27_01,2026-03-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 lowpriorityscore=0 adultscore=0 clxscore=1015 priorityscore=1501
 phishscore=0 impostorscore=0 bulkscore=0 malwarescore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603270150

On Thu, Mar 26, 2026 at 2:28=E2=80=AFAM Bryan O'Donoghue
<bryan.odonoghue@linaro.org> wrote:
>
> Use devm_of_platform_populate() to populate subs in the tree.
>
> Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>

Other drivers typically call the populate function at the end of the
probe function. In this case, however, it is invoked before the main
resources are enabled. I assume this is because the CSIPHY device
needs to be available early. Aside from that, it looks good to me.

Reviewed-by: Loic Poulain <loic.poulain@oss.qualcomm.com>


>
> ---
>  drivers/media/platform/qcom/camss/camss.c | 3 +++
>  1 file changed, 3 insertions(+)
>
> diff --git a/drivers/media/platform/qcom/camss/camss.c b/drivers/media/pl=
atform/qcom/camss/camss.c
> index 00b87fd9afbd8..66ea057291f6d 100644
> --- a/drivers/media/platform/qcom/camss/camss.c
> +++ b/drivers/media/platform/qcom/camss/camss.c
> @@ -16,6 +16,7 @@
>  #include <linux/of.h>
>  #include <linux/of_device.h>
>  #include <linux/of_graph.h>
> +#include <linux/of_platform.h>
>  #include <linux/pm_runtime.h>
>  #include <linux/pm_domain.h>
>  #include <linux/slab.h>
> @@ -4964,6 +4965,8 @@ static int camss_probe(struct platform_device *pdev=
)
>         if (!camss)
>                 return -ENOMEM;
>
> +       devm_of_platform_populate(dev);
> +
>         camss->res =3D of_device_get_match_data(dev);
>
>         atomic_set(&camss->ref_count, 0);
>
> --
> 2.52.0
>
>
