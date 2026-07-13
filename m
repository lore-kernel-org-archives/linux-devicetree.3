Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DE4E0376A15
	for <devicetree@vger.kernel.org>; Mon, 13 Jul 2026 11:06:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=205.220.168.131
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783940795; cv=pass; b=dWKCwwsLn+0MGrxBWC2ArkRIj4LFYedp763HS0zi8zibwl6p4eYi7KN3EyP5gGsaIsNoqTGdIXv2myVWfYxK9+Cyq/63fq5qSJWZ/unRoCWXddQ+h4KFaLz3lVCdM9nrtfCO5xedhRIYPKm3NIPQRNRDnKZ0FF1Jso29AI4TSVI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783940795; c=relaxed/simple;
	bh=MbtmAi+FOchUB5sRsMcx/CuY+j2+KxEpVaWxKhUk2n4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=H92otbSozxYUyZGYgmBvuhbMZe/QELzzSB9O//+gE/T+yOeEJr/8XvoDyv7DgSYDseUb205BPlXuESp+SbMxhDXHdJa7gGCSC7/24uLHf7Sn+I0vBiGXPYriBDOn4acQ6QShd/CXudDbONFgMGVhuyXaFPo+ubH9GM3qU5NO8IQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=DI8Z8pG3; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=AKUUOrqT; arc=pass smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="DI8Z8pG3";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="AKUUOrqT"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66D6NkKu668651
	for <devicetree@vger.kernel.org>; Mon, 13 Jul 2026 11:06:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	U9tA3tFtTdnt2OcqRFhofQ3tr91DLiJW+I+IyBckjI8=; b=DI8Z8pG3wdQMwjdq
	NgShZmtTxQEhxFPIhHzG7Y4XzDgWQeVTDEJ8TOU+sxTGh15y8yWG8xKeHQ49dJj1
	e1p0ChIPIxcRutKhsC56jX3fZi9FPHm94PFL2LzrkVexJq/LKYNIMZkY2kKYcSM4
	3SnKeDl8psgTv6f77tztLtl44Iq0WYPTON+OJaMaolB0PJeRapF/1xLuUCtLfzpH
	k7E/XBBdkNABekqxi15zBOSFJJHU/dWX9lSnwoR6piA+mZOqBdO9SRmCmGIEZTod
	aqUbXvFwWjULYAw2EBIt8TtjflJc4IFAv7Sx01pCYRWASjnU3XysIrGW1Z+sCxVP
	RECV1A==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fcjnm26yq-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 13 Jul 2026 11:06:32 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-92e820609d9so250432985a.2
        for <devicetree@vger.kernel.org>; Mon, 13 Jul 2026 04:06:32 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1783940792; cv=none;
        d=google.com; s=arc-20260327;
        b=ZsAQSZl7cyh5uQBvJFeQDq3C36kGEYFCXlchqOex2C0G6OkLDI8xKH4fc6Uip+1vk8
         YXhEUi19a1R15D5x+u1f7yFFBTKBM29ZhRQrfc3nAXGiQQ3woxod/HFGkJ5hmtHy4tl/
         ozBwKnp8H8WS8NkWu+qQQBPctQ37oGCFa9sY6cQsz9xbMlmyFAQ3uvtHaSxrTc3Agev3
         sjTDTjqkyIeyXEj23M7LX2uvtW+f8iKUtPX7DloMu14SNIYaOyFSGnmZ7ZiJ2chOfwym
         a9E/hMYZL54FSyfF1S2jRIo0aqINBrK4pHvxCwFySgbVEiX4uHBqyaLqJkIt8c/yWcfI
         /tnQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=U9tA3tFtTdnt2OcqRFhofQ3tr91DLiJW+I+IyBckjI8=;
        fh=zcbaGAnguaS/SIeIKBufS+Nr13o1zRwf8K+IlTZYMmw=;
        b=PSUwVUQZ5rWjjTdiur4lJX8oxjrpSI6r6IAGmCaQV2m/Rb2qSAP/a0x12wD3IV+Z20
         UbDpXshXEXW3OBFxXprwGFWhVmn+MDNsD2FqeGADd8fPVOz/pEGxyI6NeqLP0tqriDMH
         W3gyY+7mELIZFk884lQ7XXQf2Viz+4zjj8Mtq3IKK2f4/y8FjiboAb7iHhIayxQD0iK0
         E/WwnIRqj3elaKFgoBE905xAKfN0w5apwfuWc1A3m8WZeGmfwhfBUg5TyJEdGzh2zufo
         GLjMZ8qKKvSbN/EgIjJYJUiLoTDW/hitrIuT+HQHQ6l4S9diCggmetg3h7OehIRfZiEI
         g7cw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783940792; x=1784545592; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=U9tA3tFtTdnt2OcqRFhofQ3tr91DLiJW+I+IyBckjI8=;
        b=AKUUOrqTLJXdRWvkv+DGVWXncK2g9dIjVOkE/mfxGVWPgGipyhRkl/VYKoAu6xoCqD
         elU+slRUNSoXPH33WiFxQoiBM969YW2ggwzSotT5i2zCtvLab4nUnqoEJS2i/3qbl2AO
         AYjMGbjrMd+XclhQ7AtOpQSaUR1gPi6BSIanJHPptfNe5VTwWHFzIraiIJ9kz4XTnQQN
         scHlvn/X5MCWnhRqKuB8Tea/D1I3gNDjWkEoZJMlBX8spoNGkWUz2ZhOMxy6x57PxtSv
         8K4HpwNJSFYK4lMfv9+q314KVISpPbkMt8vEUJhy1EVv9UTNajcRh2n9vFWSVZ/3m+cS
         xTLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783940792; x=1784545592;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=U9tA3tFtTdnt2OcqRFhofQ3tr91DLiJW+I+IyBckjI8=;
        b=eWSPxNQAfYChscNSquxPQH9SeuQcLmnnEJrh4q/ZvFr+r30+7CK7/TnFY4/Ymi2qwG
         0MsWPUlN2kSzqFMKAnQ4/4Gyic83lKxmy4NkNmVnPRx0dFtWGsxLleCz95Nvn+9dIc4s
         2jSMa6YyoPn5XKH7avTbm0EkSif5lJIVhya6lvXSJhIv422rsSsLWAe0nBR/xg22CLPn
         nuUsNu+60fnrUNQDAHJoWyQjE4fLq02Q3mcLRQRIO4PAcoAnAQQTUgCFZFCgBZKAP5LW
         BjSGsu7YSEv4biv/wp9a6dmYqlfmLRxKhNDhmTak1byOSaOT+yhPaMNTG2PN7VdA3UqH
         g2xg==
X-Forwarded-Encrypted: i=1; AHgh+RpEHKVhERRbxgT1uXw3OC9ZEnNS0uHNQ80gDecPCofbZvKWEnW2LFbUQnNMrA2z3DWm2Aw22ZBY1F2Q@vger.kernel.org
X-Gm-Message-State: AOJu0YwSYDqHrSRd30QB0Eoj0Ic0sGFQfVaL7DpUuC0li+AYaIGC6PiT
	+62JgSbDdQrUDcx4IGUwUPqDJhNUTVtZz5eVncviIWHrNuB6dB4Tk6DUBUCs1if5KxGQs0DVpiM
	7XyGHskG7pRcYijhtN4EE2iEuK5oANWFXuwQ039655KNdObOOOkJ/fn3XWaPzqEKHON7hvJzf5/
	ynQlMG/ur8iAXtbIr4ObjUw7FUhers+0IOXg0d4p4=
X-Gm-Gg: AfdE7cl5209FTpqMb/rwkGY11BDd2Sy5C0HbTrSyv3DQ+1IN0KlWA0nxWpyMdhtUsFz
	F0gh/9i+dyMXbf8lDYopMWotktQCDNy+T0g2CmdTtjccFTfj4pbnZtLOirJ6Z1sFH974Wf6c4xg
	raq58yxODbWxXKTzaMnFqBrRuInyH4E6c0mT8ppbtO+JRTiWbUPE+kdpCpNXIhi/wjpJBQ
X-Received: by 2002:a05:620a:2950:b0:92e:cd78:9244 with SMTP id af79cd13be357-92ef2e26c76mr815025285a.84.1783940791846;
        Mon, 13 Jul 2026 04:06:31 -0700 (PDT)
X-Received: by 2002:a05:620a:2950:b0:92e:cd78:9244 with SMTP id
 af79cd13be357-92ef2e26c76mr815022285a.84.1783940791449; Mon, 13 Jul 2026
 04:06:31 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260709084635.24912-1-angelogioacchino.delregno@collabora.com>
In-Reply-To: <20260709084635.24912-1-angelogioacchino.delregno@collabora.com>
From: Ulf Hansson <ulf.hansson@oss.qualcomm.com>
Date: Mon, 13 Jul 2026 13:06:20 +0200
X-Gm-Features: AUfX_myTjQitf9mLWKDNP_7823p7zFAcgW6QTMG2dOgcyWT7UVSwFMCpk7KVrgU
Message-ID: <CAPx+jO-_KLM1Rhu0G=hOx0aLr+XT6X9w9gLui=aHjSBgDkLMoQ@mail.gmail.com>
Subject: Re: [PATCH v3 0/5] pmdomains: Fixes and add support for HFRP Direct
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: ulfh@kernel.org, robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
        matthias.bgg@gmail.com, nfraprado@collabora.com,
        irving-ch.lin@mediatek.com, macpaul.lin@mediatek.com,
        aford173@gmail.com, mbrugger@suse.com, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        linux-mediatek@lists.infradead.org, justin.yeh@mediatek.com,
        kernel@collabora.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-ORIG-GUID: dLzMruuzq1qoLiSDTiGgKHh1nyOfmRjB
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzEzMDExNSBTYWx0ZWRfXxO3ByvX3JTP+
 6COu9DEFiMpK9Serd8v8+/Erc66rSyS1HppuPD6UgvXQH9WQEE7o5KeURTPAFYgq1WkxV3Pm83j
 cEX5kdo5b3tOlpRSrNbXhP7MxrcKaL6qMTHvRFQhmQFddUGHWL5z3kHoHIRdqtiS+5Hv7qxDTBF
 sDqxRo9CZSlUeMih58nHwvOZcvcBAQnoMrif1knYt2sJZtXN326SBhddMoTgNSVrY+wuAIjn2/e
 HnigyhY4+nckj8GbENM1xRTbRWW68r8QfW/++fCAsMntrWnxoIyJo6vVgrRv5+8POXmIPz6sYug
 /tHrRLnnch561Dl8sjNYgpypkryejWFBh3VunU7qsTTC9nxmUgFS1X53LuOz4soXm2OuREh7JEz
 fHC2AFQ/UXyOWQwk+eZimWbTcoFYGimFwRz7hn4aJk0u8q16rtbz60Bksb3BTHzO0ZlXhv5LlUd
 ZXfUTcqB1w1p6Y5mfUA==
X-Proofpoint-GUID: dLzMruuzq1qoLiSDTiGgKHh1nyOfmRjB
X-Authority-Analysis: v=2.4 cv=AfmB2XXG c=1 sm=1 tr=0 ts=6a54c6b9 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=yOCtJkima9RkubShWh1s:22 a=QX4gbG5DAAAA:8 a=1sG5g2DzjvmgYBam1ucA:9
 a=QEXdDO2ut3YA:10 a=IoWCM6iH3mJn3m4BftBB:22 a=AbAUZ8qAyYyZVLSsDulk:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzEzMDExNSBTYWx0ZWRfX9gat5nx0x9j9
 Au7UOSAdKT1HeM8eGy11xvghXj7K8s6kdVQjc5IFeHgxVJ1q8PQ5IqcslWSd/9NWrnI+UjHT6Su
 etO5oY/uCwrkd61DdSL9d6s/hwWxCRw=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-13_02,2026-07-10_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 lowpriorityscore=0 phishscore=0 priorityscore=1501
 impostorscore=0 malwarescore=0 clxscore=1015 suspectscore=0 adultscore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607130115

On Thu, Jul 9, 2026 at 10:46=E2=80=AFAM AngeloGioacchino Del Regno
<angelogioacchino.delregno@collabora.com> wrote:
>
> Changes in v3:
>  - Added new Fixes commit for possible null pointer kp during cleanup
>    of internal on-check
>  - Added proper error state cleanup support for SIMPLE_PWRSEQ domains
>
> Changes in v2:
>  - Fixed return value checking in power off path
>
> This series adds support for the DirectCTL HFRPSYS power domains found
> on the MT8196 SoC (the ones without HW Voter support) and also adds a
> fix to respect the power domain relationships during error cleanup,
> which avoids HW lockups in case probe deferrals in the specific case
> of "almost fully probed" power domains (where most of them probed and
> got set up but a probe deferral happened almost at the end), behavior
> seen on the MT8189 SoC during bringup (but honestly I have no idea how
> are the current ones working fine without this fix...!).
>
> This was tested on MT8173, MT8186, MT8188, MT8189, MT8192, MT8195 and
> also on MT8196, over months of development, both manually and over CI,
> with no regressions detected.
>
>
> AngeloGioacchino Del Regno (5):
>   dt-bindings: power: mediatek: Add support for MT8196 direct HFRP
>   pmdomain: mediatek: Fix possible nullptr KP in HWV cleanup/on-check
>   pmdomain: mediatek: Respect PD relationships during error cleanup
>   pmdomain: mediatek: Add support for Direct CTL simple power sequence
>   pmdomain: mediatek: Add support for MT8196 HFRP DirectCTL domains
>
>  .../power/mediatek,power-controller.yaml      |   1 +
>  drivers/pmdomain/mediatek/mt8196-pm-domains.h |  27 +++
>  drivers/pmdomain/mediatek/mtk-pm-domains.c    | 184 ++++++++++++++----
>  drivers/pmdomain/mediatek/mtk-pm-domains.h    |   1 +
>  .../dt-bindings/power/mediatek,mt8196-power.h |   4 +
>  5 files changed, 184 insertions(+), 33 deletions(-)
>
> --
> 2.54.0
>

The v3 series applied for next, thanks!

Kind regards
Uffe
