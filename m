Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C0E1634E766
	for <devicetree@vger.kernel.org>; Fri, 24 Jul 2026 15:25:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=205.220.168.131
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784906746; cv=pass; b=JH3cqwndMtiWB9i+GfqALkr5QH5VbX6QwUux7fIaudJisPibR8R/rB98cyCy1WRxZwA6tf0IbWPsk1/Suuie5WtMOJ4s486JSbmxMzn0fJ68TDIQt8W+pzk3VJou/hk68OvFWmVtAsAkq1LD5ojycnCBcPEiTyyJPFK0i40O+3U=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784906746; c=relaxed/simple;
	bh=4yOVodZzM/KR943GEkikdOIdqlRD8ioz3XZaX7Swa2Q=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=jRr2mjmFi7Jcg96yzxJVqR9X96CBB5gt8Mu5X+E0JW2AeWx/3Z8iioalBOFHQZ7BWiP2sLtpWLyNq42Bw4yfVjfwGYzvlVoZAOaYhBT+sYNfQOX1FYXpUE3rgplj6ZbzHAhHITd1Q8YicuANJ45PT3JEp1NQUHpj20zLaPTrtdk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=lUQ69t8r; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=cassZWXr; arc=pass smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="lUQ69t8r";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="cassZWXr"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66ODbBJg2710081
	for <devicetree@vger.kernel.org>; Fri, 24 Jul 2026 15:25:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	gF/UkUqvrY1lcjLFHPeP744pWwMQJ7+CJ8FQ/U44hAw=; b=lUQ69t8r3RQ0hcwP
	F3p3KZcjvfYHlLOc9loUKm351F5eve2wv3d4XMk+XrsMxRN7RlNpFYWE+yjRBWCO
	q+6aOOoQX4zuDIoN4r4Xq65hVaMKtAN1iS8EE0uALs1dS/zO+b+qptb3kY+AGD9L
	iEeHPlz880faD+3qbfF6MXEUko4W/KzCS/irSMbceWx1sGxIRO2sxzfNkhvxRqnu
	FUKnBfB3UkLRGnNJRkm+bvOpHYxTW075adGj6sd51Y1m1QJRj2u1CTMmHGdFGKLx
	PH0wHKNebbZgmaQDL3OiUq8Md+iAS5iGtjFrDWSqlLnnUVqKcYwRr+uWBrXqfcep
	C18zWw==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fm8cggk2x-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Fri, 24 Jul 2026 15:25:44 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-51bec738909so7783721cf.1
        for <devicetree@vger.kernel.org>; Fri, 24 Jul 2026 08:25:43 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1784906743; cv=none;
        d=google.com; s=arc-20260327;
        b=YKpyNFWU2oMhX1V10EBGVYFwuT813qd3098vdglyyQuQouW5GdXarvnm+NBqRuc4tg
         ZNtMYNaUFXmt0YMtDk8EzL17aujTy3sf5Botj0qsiZXNvQp6zhOqHf2TRkzQcaVJywPS
         nqZV4ibNZbMsg+49Q9vlh9CUQ1R4FbQ/rn8sGsArcQUgxy22s3ouEkAzpg/3EQWcBMRb
         Ys4+KQhtarJ3RBy3DBEMqEQfyP0TvsyhPTas3DdR2v5MEoiCaF9hiJ5kBydd+/lpO9TV
         Y2gCYyGELeCCVu00XqW8w+iyocZ6Nh6YZFACZZWYLIVs9jHn0JAFQ23/u35TotFSaBf2
         VQUg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=gF/UkUqvrY1lcjLFHPeP744pWwMQJ7+CJ8FQ/U44hAw=;
        fh=Gh8xCbXaEfLUN/aJ/3YZQvwiE73E9DmWkVT3JcITjpA=;
        b=IkCvlGMhrUgJpkPBtvLL5u+WY1Bv3u/nhDYGhumnrBLd8eXnbVzsXjCB5gawPvfR0Z
         Ms58uE2afiI4mPCmBXCLMHRi6tJDMaG+OlB2JB/2XxR5p4Vsl5kc51tlsnEbD2K5Vqav
         fEU7pANtpZsQ0Y86MBzidWp8sEE2MFChKO0tKYPYYQ11O67+t86BEpsekvqYUq+0IKPm
         3PSVAGAG65mmIFwJkjSRGnAQyZZeF6erZCplJWD+dugTZBQyscRSZGpoBFSXjdDnJgl3
         pbrnvwK2KwJbF1y9NxruaPyLpHpoEswVMBZ1KpF0PqyCEwDK1ou3CnS7cYOm9j+XR4vp
         eC/Q==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784906743; x=1785511543; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=gF/UkUqvrY1lcjLFHPeP744pWwMQJ7+CJ8FQ/U44hAw=;
        b=cassZWXrfw6eiNpEd9F/qND6kD7VKGVX0VhtGODf1WGw4qjvKCuKFx4TCtgOpAPZps
         c8Lh24g7m2l2M5hnWM3NZR7IWFLcslYY+74QjwA4hxqk5rfwSydWojvl3ClwM1PZ5pUi
         fnSI67hwqQa6ChnyTRJI2hI1nAh+GShJuyNUaxdY996HAw1MLfmX95XrTNoRIc3pgrnG
         ySUMq9ndifzrtEP5F0sLlTNVRvtFPXmBaFo7tv5kLI4InrZVG8zDcjzc7wynHqijPhfs
         jgCOGJbO2K2r7Ma/LOuSFA6gsxN0/Xd7gecltDDNSfBHHrFb7uEfanfFFVnQAKaHpBmd
         ddxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784906743; x=1785511543;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=gF/UkUqvrY1lcjLFHPeP744pWwMQJ7+CJ8FQ/U44hAw=;
        b=oUl+w1sYK0+fqVk8BApwwDr0nD+0r5CuvCaZwqoREq5AiXrMoy0xaqNRYHpuG0BmmI
         m1ova8DWLazvj4HxXBw1NSxDOKLbxT/2gtKiYoesXyh2HpCvQy0LsF4jTi9E3ZGYKOlg
         nbNAwlpzpn/Ka7+LxT2eIOXRinq5pTlvkt+6VbT0xisCUzkhLwp/Jthl0RogFdOSex+c
         Frc0pTPvCxsCWA88j4vlLBdsYtPSYRDb8T+UPm/DrLuAbu+0SCJoSkX2pZ+1c8AoNlfy
         +gy+k/Bo9GWFQG/jKe9giHTsYHUnEvKO9mEwXJvroHWtXTffOiU0yh9rGGwnNfNHQV3Y
         V3Bw==
X-Forwarded-Encrypted: i=1; AHgh+RrEprsFF8aJgZrs6ZFv1iJbOstY3yPdhu7uJHBF7Jq4r1oJg4LPOcpdYVYbAVXwZ6omfbmpDL/oPiSb@vger.kernel.org
X-Gm-Message-State: AOJu0YxFg7wH/CDc+nZ3DI2xtZm3ah/1MT6bye6uwzgmeA8dY325wWCn
	WdOe/Ys7IzxAnVk2aaFW70oNvO5RA7JbPv+rcAImFysQB85cDQrkZXcQepFRmqbd73mc2h+JFbb
	PytfaE5u7HGTXIb4X9LDWbziHeagYxZfER25lu0eqfkU/AH7BNdgn0jp05jSmVyoSyiCo+f0NkF
	2bahBiEToRCPp16OLepsFdg0L4ZXPCuKYvMHpeTow=
X-Gm-Gg: AR+sD11cjGKCh8N67PGFreJq0Tn5PB+2IUHTtYsjqLhf1GZMhAFBFd0lEDWWhFypxM2
	65Q363bPonEPeDrHFwxs1q77NdV2sUTtZ9Rjggk5hAH1zKY62HSKqDhmc1gL7/33FV+Lb6LFuE8
	yASQcPkiiMxosuSRVEyZtdQDiOW/HTSOSePcSeKJTqyglualCEx+Cl9i+d5w==
X-Received: by 2002:a05:622a:22c3:10b0:529:a2ed:bcd4 with SMTP id d75a77b69052e-529a2edced5mr2053211cf.50.1784906742994;
        Fri, 24 Jul 2026 08:25:42 -0700 (PDT)
X-Received: by 2002:a05:622a:22c3:10b0:529:a2ed:bcd4 with SMTP id
 d75a77b69052e-529a2edced5mr2052841cf.50.1784906742426; Fri, 24 Jul 2026
 08:25:42 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260720-mt6858-pmdomain-v3-0-8966d8de93c8@jolla.com>
In-Reply-To: <20260720-mt6858-pmdomain-v3-0-8966d8de93c8@jolla.com>
From: Ulf Hansson <ulf.hansson@oss.qualcomm.com>
Date: Fri, 24 Jul 2026 17:25:31 +0200
X-Gm-Features: AUfX_mz33HxJNiHzlKKDq7YYI97h7l3wukc4IVOHOz1B7cIf_lHzlGi_RyWl1W8
Message-ID: <CAPx+jO8gRxfM=pxMjHrJNcexOzDRiHjauVVDbpGutPKaApghdQ@mail.gmail.com>
Subject: Re: [PATCH v3 0/3] pmdomain: mediatek: Add MT6858 support
To: nikolai.burov@jolla.com
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
        Ulf Hansson <ulfh@kernel.org>, Matthias Brugger <mbrugger@suse.com>,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        linux-mediatek@lists.infradead.org, linux-pm@vger.kernel.org,
        Nikolai Burov <nikolai.burov+review@abscue.de>,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Authority-Analysis: v=2.4 cv=JOMLdcKb c=1 sm=1 tr=0 ts=6a6383f8 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=DJpcGTmdVt4CTyJn9g5Z:22 a=bC-a23v3AAAA:8 a=R3Y5_zZgAAAA:8 a=VwQbUJbxAAAA:8
 a=pGLkceISAAAA:8 a=QX4gbG5DAAAA:8 a=iox4zFpeAAAA:8 a=JfrnYn6hAAAA:8
 a=m8CDPgaNMIpP4pNAotQA:9 a=QEXdDO2ut3YA:10 a=uxP6HrT_eTzRwkO_Te1X:22
 a=FO4_E8m0qiDe52t0p3_H:22 a=chadc-dSXXc7PrnZVOv-:22 a=AbAUZ8qAyYyZVLSsDulk:22
 a=WzC6qhA0u3u7Ye7llzcV:22 a=1CNFftbPRP8L7MoqJWF3:22
X-Proofpoint-ORIG-GUID: TUMUm-QmNKRT4fif6LiH6LLsKn2FuifR
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzI0MDEzOCBTYWx0ZWRfXwW3gyfFHJnQM
 IXmC60utGdr+tUpDykau46R093RSOu9f+Fee4uR86ZXQzzHK7QSQ+OCIJJwWXNw2ej+Y0NpPios
 Fk3/fy/B2xJLbk7hHWzTpjFbno/AN/8=
X-Proofpoint-GUID: TUMUm-QmNKRT4fif6LiH6LLsKn2FuifR
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzI0MDEzOCBTYWx0ZWRfX+BxU4oDygaBt
 oAVlX13MvKaDDseB/FKGz25s3VfnJ+TLXvVyHdxNHBh3+jelewXTABl1y9ah1W3Fv1shmP2ZNyI
 wuwCFp03+RGj4dd//vge8jf+kQOkZwcjgB5WzaT1oJeM9wFbKi0Yuh9WG5LB5Ad8fSEhrfzPSc+
 bMHBz+dWaP9gbPLBLifFStYqUWxJc+9K9My0DneWNTJcxsRaQiJOMdkXLxmykydjIrwu7e4DqoF
 LreuCw/W91AgBTMRL2W/Tlneu5ZYuiw7ih2BBo/OX2s/mK1Ccn+M//uY2Y3V+SOeKOCUzpk7buz
 H7UCsW2dYjW3PWJtLYtmjXOclIydEg7q2uVKlH5LxyDnA+lX5ekFQzXkPYaX8J0nIomhEz/gpVS
 p+jqMq9pIf4idpn79Ys3isq/fNgIe6pAirOlxZnlCmS7ZaPASibg8wZdhKF0CP+5BRnV6YWzbpH
 U+QPMIeM91G3HxcghHw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-24_03,2026-07-24_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 suspectscore=0 impostorscore=0 spamscore=0 bulkscore=0
 clxscore=1015 adultscore=0 lowpriorityscore=0 priorityscore=1501
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607240138

On Mon, Jul 20, 2026 at 10:46=E2=80=AFPM Nikolai Burov via B4 Relay
<devnull+nikolai.burov.jolla.com@kernel.org> wrote:
>
> Add power domain driver support for the MediaTek Dimensity 7100 (MT6858)
> SoC. On this SoC, there are some new subsystem-specific bus protection
> blocks, which are listed here in ascending address order:
>
> - IMG_SUB0 at 0x1502f000
> - CAM_SUB1 at 0x1a00c000
> - CAM_SUB0 at 0x1a00d000
> - IPE_SUB0 at 0x1b00e000
>
> The VLPCFG bus configuration registers at 0x1c00c000 are also new.
>
> Additionally, implement the SMC-based power sequence required for
> enabling the modem power domain on this SoC.
>
> Signed-off-by: Nikolai Burov <nikolai.burov@jolla.com>
> ---
> Changes in v3:
> - Fix error path to also skip sram_pdn for MODEM_SECURE_PWRSEQ
>   (discovered in Sashiko report)
> - Link to v2: https://patch.msgid.link/20260715-mt6858-pmdomain-v2-0-6293=
e87fc093@jolla.com
>
> Changes in v2:
> - Rebase
> - MTK_SCPD_MODEM_SECURE -> MTK_SCPD_MODEM_SECURE_PWRSEQ
> - Convert SMC command enum to defines
> - Based on the new SIMPLE_PWRSEQ changes, skip the sram_pdn stage for
>   MODEM_SECURE_PWRSEQ too since it wasn't intended to have an effect
> - Clarify that the SMC call also handles bus protection
> - Simply if/else code based on the assumption *_PWRSEQ are mutually
>   exclusive
> - Add comment explaining that PWR_STA_2ND is skipped for modem
>   (mentioned in Sashiko report)
> - Link to v1: https://patch.msgid.link/20260714-mt6858-pmdomain-v1-0-4f09=
bbb822e0@jolla.com
>
> To: Rob Herring <robh@kernel.org>
> To: Krzysztof Kozlowski <krzk+dt@kernel.org>
> To: Conor Dooley <conor+dt@kernel.org>
> To: Matthias Brugger <matthias.bgg@gmail.com>
> To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
> To: Ulf Hansson <ulfh@kernel.org>
> Cc: Matthias Brugger <mbrugger@suse.com>
> Cc: devicetree@vger.kernel.org
> Cc: linux-kernel@vger.kernel.org
> Cc: linux-arm-kernel@lists.infradead.org
> Cc: linux-mediatek@lists.infradead.org
> Cc: linux-pm@vger.kernel.org
>
> ---
> Nikolai Burov (3):
>       dt-bindings: power: Add MediaTek MT6858 power domain controller
>       pmdomain: mediatek: Add support for secure modem power domain contr=
ol
>       pmdomain: mediatek: Add support for MT6858 SoC
>
>  .../bindings/power/mediatek,power-controller.yaml  |  21 +-
>  drivers/pmdomain/mediatek/mt6858-pm-domains.h      | 466 +++++++++++++++=
++++++
>  drivers/pmdomain/mediatek/mtk-pm-domains.c         |  55 ++-
>  drivers/pmdomain/mediatek/mtk-pm-domains.h         |   6 +
>  include/dt-bindings/power/mediatek,mt6858-power.h  |  23 +
>  include/linux/soc/mediatek/mtk_sip_svc.h           |   3 +
>  6 files changed, 568 insertions(+), 6 deletions(-)
> ---
> base-commit: 3fe08b9796f36ef437ab9328e7dd1e5ff2d66603
> change-id: 20260712-mt6858-pmdomain-b1b456c96675
>
> Best regards,
> --
> Nikolai Burov <nikolai.burov@jolla.com>
>
>

The v3 series applied for next, thanks!

Kind regards
Uffe
