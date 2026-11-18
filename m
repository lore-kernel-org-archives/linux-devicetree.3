Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=205.220.168.131
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795033762;
	b=ISg7FRToDXSfTEMiyBnoo7Pneo/XpwxSbkM3vSy1ls9YbvNqOYEbYh0yJuoJYkS3RO7L
	 MxvsBXq6sI3pC/f8TO3cv2kGYNEhFQWsuoXaJuLuVD30bl/eQN3q1hYWTS8gDRauNWzzf
	 +AaNpHWK8o9YVXU4EV0UMN75KQ9Wa70Vov6/jwfcGpfutGBM3By26DC3K1Dt114+yYoEK
	 gmLHpxvI70puit69f98yRfV5YIEIf5YeVjcnaUe4QTEHFxA0GkAeBN9hX1zgaR+dB/ymQ
	 vqn0FNBBrhzIM6l29NeoB8sdM5q6bR9Gay7AaLl1BV58fEc7A/Ky9FxK5uJ7txJbOfw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795033762;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:MIME-Version:
	 References:In-Reply-To:From:Date:X-Gm-Features:Message-ID:Subject:To:
	 Cc:Content-Type:Content-Transfer-Encoding:X-Authority-Analysis:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-GUID:X-Proofpoint-Spam-Info:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=Uafzx/JmUMCcPdLuNnrhGFghiuTegcyFvb8LVqv/8Rw=;
	b=ZolP5SHAb4y7Jwb4ddZ88iJkmnrhPY4JSeSdHqrFRj+yO8ghX4ntVjVzWDvkoNIKRojh
	 sTv5lPJiavEdZDS6Z1Jq2FWfENkpBhMMU30GULV81yndka6RjhY2otLX6LF7CEH9Y/9at
	 yWw5FvTO24iuPx7ip5YEu0Pj1wz1esGzJ7D0TiuC2/XDDv7vOd3Ymz8LPr6dTDApSa1DM
	 /p/JXHUCtg2kt6sjFoiI2XfHjFPbVitFnSZBGAb8K5dmI9hzq8JKnqb4xXetJKt0h8Avb
	 ofPPA8mVJ173GpMlMJ/K1lUnHyas+8pW/B7A6JaGdPKLHDtF/3u6IGrB2OmsJ6gSr6Q==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=NpI+AOGN;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=i8458eaM;
	arc=pass header.oldest-pass=0 smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 89BBF606A32F
	for <devicetree@vger.kernel.org>; Wed, 18 Nov 2026 20:29:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 89BBF606A32F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=NpI+AOGN;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=i8458eaM
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AIJMmu6034718
	for <devicetree@vger.kernel.org>; Wed, 18 Nov 2026 20:29:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Uafzx/JmUMCcPdLuNnrhGFghiuTegcyFvb8LVqv/8Rw=; b=NpI+AOGNxh4W2ZLD
	HOhzwaT1akLSDIlW3XEsOdjWcgZtMs+ZQzFqVnH0kSism2DrVDPNt7XuhBGa+yBB
	myuAJpnzgpSpvTzVy8zYvhSq2YgsSiiDChItUZvNSWsfkLu3MVtL1jqQuNgSm98N
	5gGsos+cgu+iBbme89DgppbYmsFNawnBS5rWhodvpB3Cl8W/splxREx2A098UykM
	TIirVzER2HS/GCATtoB1oCp2t4ZQHIVGIw/XE2aAW078PdOaQN3OdYh+9KqAU45n
	O7MItB4FTn+ge8u103d/CxOxw3jawwp3ZzYggt+dXCyBeyAcb2fobnZlG7L9rfix
	nxAFqg==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j1dpc9njc-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 18 Nov 2026 20:29:21 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-9495dd0f07eso298327685a.0
        for <devicetree@vger.kernel.org>; Wed, 18 Nov 2026 12:29:21 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795033760; cv=none;
        d=google.com; s=arc-20260327;
        b=JFvzCeZmDc2FsRJ1ehQiB6pbuWoCFWUK4K568fGVD8So2s7T7J8BuAmtl3RDQlYyuz
         un+EvoKI+imQ0RlaFjVD4Y5V+v67+3N57Qrkc06kVxn8tnEyGtIer6TVE6IZdZIL3zyJ
         vc4WVQkkajGQGaaXYwlqbPh+HFpbBj6xGHjaGdb+ybjTQq/Vl6RtYfpdtXGNBjkmH+u+
         HtwfqCZ44b418mvQEWWXrcjGBXbQDxnkU/gP0g2LWc2tl9U87pR2uoRaIOZEetgGmJko
         maOjUoqC7yx9DMdpC3WPQobEutQa3Hg/Lohi0y/hy5AhsA3DQpYu7sWStgjnbeom6zIi
         q8LA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=Uafzx/JmUMCcPdLuNnrhGFghiuTegcyFvb8LVqv/8Rw=;
        fh=8j7GF4IeSnEobUqqs6ZBN4i1qbl9EjSXwaQkmS9pK1Q=;
        b=iYKnPOlsYlPtdF7P9o8IehtZuaE+RcH3+KaVEiKok0KTNJVp8P9k+7Jvw6edWLtktq
         7szUBPso9WfzMGwEJgnhIlCeznlXfQD7/UGm2JzATEAfeHfaTMkmyEJxKkO3eMekfiKL
         n3N45AwKx+9s8mDGZTAr3ZYSpw/rGcuwOcIADSTliQqni8mDkFWF2zh3KF/2xOxEdcva
         QCBOWb0USVVtsJMMZbWDK5VGJYPSwMllLt7TRbu6QIuUl1yIwQaDEkDfMt1UfVctiN1Q
         b0to7QaHrcT7lFkuL8LxfFYMu5kfAV5B/bXAEgXHoogTuknfQ5utl2mrl/GJDMFaCWex
         plsQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795033760; x=1795638560; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Uafzx/JmUMCcPdLuNnrhGFghiuTegcyFvb8LVqv/8Rw=;
        b=i8458eaME8qijPCjB8rMf3haEX5zO9kXHS2/pFcOdj/qJUYKCYc5B9KV99f44W/C96
         +0p0AWaxAtC8eDMiTkCizw/nSkm75K2oOon8wbFwd6l9/DCkZ+g2aSgk6mFHYGARxnEa
         mJmcFw+UEgtDrw4WsFiKjDkacswXaRK5AbWvZERemiPFkkZWvZU0FzK7Rd6wzoj248Sc
         5h+3gfU8rJtBMWn/XY/Hu9HC0GY0Shu3uYIb7ZtO5Bf15djfvE0ihD0CJkXGzCLJY1x8
         +TcAT/64QQ6P50aVokCbS4YfSX89l0l8CacDW+V3boG78bztZ5GJwTnEhXs9xeu41748
         Pz8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795033760; x=1795638560;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Uafzx/JmUMCcPdLuNnrhGFghiuTegcyFvb8LVqv/8Rw=;
        b=F070C2q+NcFHqyP+B3unv1sBpD11CLG0qomBN+zIs5UKtIvO0LYWH51INbfgbvoKwV
         4BNt2x3/4yzZSh8tdtHV6GXNzGc0YYgGEoRQPl3Ep2uOzSGb5CXEpynv9tGDmj/8eLVb
         UTu5EHqLlkfY4Ujtu4FHOf+oHDri+a1iPhiON0XsE/1JT/p/mhGAHe1cYQcouRyjNj7G
         MCMYX9Ik66mthUquN0xq0USHGA+t+LENAIBE1J5hX2BBOFROSqE3S2GCTBMblr/5rS4/
         Vw/e3gEwvd7ccs4XzOBNzzzyZMFugmy04bNCSQAZGv743AFBewbBaOv2KWwpA+NIJehB
         3fZg==
X-Forwarded-Encrypted: i=1; AL+hErFFicO0IBgXSSgw7jLXAfU+RuiTaI69aSegWxv2yN/SJQ2eiHPtuJvq2tbIoAWA/kwzHT2q3Yx3biCW@vger.kernel.org
X-Gm-Message-State: APuU4Z+tdoOG0ecbO4ctmI6Ia3N2C/0ZnUtrC1VPm1Ur8raPqJctaUvf
	A1CRpur9WSk9dJ/HiTkUhAIuw6c2DIshiNgF1blWuIxb6PDWpF58RwpeLPLLXmm0seWHZRlZx7s
	FAYLSktmpyuNqhYdCOCxoaZApVitIya9vjCw4r5vuPU3T9ZpWWmtSxySnr7P3Awr53lLttPuj3e
	XbpK+nXFSSTnFALcIDhMDvixyBArYxHt0Q9u+qVMA=
X-Gm-Gg: AYBFou0l32LF2M8gipo6nBMle+g2qu5m+E7DDb1hQgHE+9QOojEoakrpnuBEazAA9C7
	y+/gWwGmi2zqDk6HjtPP8Wyo+74PIPy81kmCUgvprmTART0Mqjh930Hmh21+Q6m9YbT6RVn68AS
	dwdzqSzXAYcV4sMHLluzUMZ1nywbEcviu8QECPhTsmcqvzk7LG4W5txO3XARC3ja2jV6EVg4iOB
	SOGFoPA+UYH3wYhkgVZyF7cxb901SKJf/EGsja2DbdBr9XaMd7r4+CqGKALw0OiuymSFoTqmt8=
X-Received: by 2002:a05:620a:a194:10b0:949:9f1e:d8b with SMTP id af79cd13be357-9499f1e0ed8mr341707185a.16.1795033760292;
        Wed, 18 Nov 2026 12:29:20 -0800 (PST)
X-Received: by 2002:a05:620a:a194:10b0:949:9f1e:d8b with SMTP id
 af79cd13be357-9499f1e0ed8mr341702985a.16.1795033759630; Wed, 18 Nov 2026
 12:29:19 -0800 (PST)
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261118-wcnss-series-v1-v1-0-a64d82e151bf@atlr-engineering.com> <20261118-wcnss-series-v1-v1-3-a64d82e151bf@atlr-engineering.com>
In-Reply-To: <20261118-wcnss-series-v1-v1-3-a64d82e151bf@atlr-engineering.com>
From: Loic Poulain <loic.poulain@oss.qualcomm.com>
Date: Wed, 18 Nov 2026 21:29:08 +0100
X-Gm-Features: AclHuK8JJhcd52hfVRf5gMzyZMF7wsPFyMwkvy_HKeVTiizUypnXwZQFHaYWU2k
Message-ID: <CAFEp6-1OnG4B_D59fW4WJeTOXAs-Jm-0Qg+yqwzM3j6tvya7ug@mail.gmail.com>
Subject: Re: [PATCH 3/3] wifi: wcn36xx: Stop waiting on a dead firmware during remove
To: arapaille@atlr-engineering.com
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Luca Weiss <luca@lucaweiss.eu>,
        Eugene Krasnikov <k.eugene.e@gmail.com>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        wcn36xx@lists.infradead.org, linux-wireless@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Authority-Analysis: v=2.4 cv=YJ0KWhGx c=1 sm=1 tr=0 ts=6afe0aa1 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=_K5XuSEh1TEqbUxoQ0s3:22 a=VwQbUJbxAAAA:8 a=Knk3v0qlAAAA:8
 a=fXm7JzJIL1tcRaoap_oA:9 a=QEXdDO2ut3YA:10 a=PEH46H7Ffwr30OY-TuGO:22
 a=L2g3GqtBoyQv0ocsUjqh:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTE4MDA3NyBTYWx0ZWRfX7b794DfxfI8+
 A2VAS80uv4g2n+JACiobseIYWJFDGdP1NZRnQvbsEW2IiI/VmaiOBwqHLsxwdFZftELVGXEEAdH
 Sejui5I/f+LvejcFoUWaurnVy2qaZPpbBouDh9l9wyV2myXbqCUxPmekFPi4FzRh9puEwEtXnGQ
 rdFZqneiITlbspNsUqWxOww8fMjehDug6rQK2U03OQL/AqNhPO6vhHgsVsoXNXYweKsb/WDybST
 C3Pcns9AzYHnIpuwG170nYrTv+REMsftuGYf0KcrkzZI2zIMbxvAf3+WkFSP+W82YMSrkQdU0Ff
 nWXYk+xiqGnj0EYon786VirQIKhmvuYaRTs70eL4+9yVR45275bWrwHSkOpGw6nGfANNKAHHpdY
 nulOHisGcn7ovXGi+tHZUYBeYouWZ+36QImR77ADM3XdM1gt6A5YV4A8FYpPdjIo7ugq/Ju5EOu
 DatllTcCGqQyX9LJ0dw==
X-Proofpoint-ORIG-GUID: 9ZhdmxlCXuJSrk-rTaAkdqqaOOUflU_T
X-Proofpoint-GUID: 9ZhdmxlCXuJSrk-rTaAkdqqaOOUflU_T
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTE4MDA3NyBTYWx0ZWRfX7QiMDk0M3prg
 pM6TwjpFxip+iSL+PHO7X9wCr2SusKX5UhS8rH5aJqAMp1JstfkqHmsuqxiMvQOZVO72dd02rHj
 Pc2lDsXWTJghsw8Tcq5GayuUl6F32zo=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-18_06,2026-11-16_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 bulkscore=0 malwarescore=0 priorityscore=1501
 lowpriorityscore=0 suspectscore=0 phishscore=0 spamscore=0 adultscore=0
 clxscore=1015 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2611040001
 definitions=main-2611180077

On Wed, Nov 18, 2026 at 3:58=E2=80=AFPM Alexandre Rapaille via B4 Relay
<devnull+arapaille.atlr-engineering.com@kernel.org> wrote:
>
> From: Alexandre Rapaille <arapaille@atlr-engineering.com>
>
> After a WCNSS crash, remove sends ~16 HAL commands nobody can answer,
> each waiting HAL_MSG_TIMEOUT: recovery took 160 s on msm8974. Once one
> times out during remove, fail the rest at once; recovery now takes ~20 s.
>
> Signed-off-by: Alexandre Rapaille <arapaille@atlr-engineering.com>
> ---
>  drivers/net/wireless/ath/wcn36xx/main.c    | 1 +
>  drivers/net/wireless/ath/wcn36xx/smd.c     | 8 ++++++++
>  drivers/net/wireless/ath/wcn36xx/wcn36xx.h | 4 ++++
>  3 files changed, 13 insertions(+)
>
> diff --git a/drivers/net/wireless/ath/wcn36xx/main.c b/drivers/net/wirele=
ss/ath/wcn36xx/main.c
> index ad8a4bd910..77a1029108 100644
> --- a/drivers/net/wireless/ath/wcn36xx/main.c
> +++ b/drivers/net/wireless/ath/wcn36xx/main.c
> @@ -1651,6 +1651,7 @@ static void wcn36xx_remove(struct platform_device *=
pdev)
>
>         release_firmware(wcn->nv);
>
> +       WRITE_ONCE(wcn->removing, true);
>         ieee80211_unregister_hw(hw);
>
>         qcom_smem_state_put(wcn->tx_enable_state);
> diff --git a/drivers/net/wireless/ath/wcn36xx/smd.c b/drivers/net/wireles=
s/ath/wcn36xx/smd.c
> index c0b4773458..d07ea967ac 100644
> --- a/drivers/net/wireless/ath/wcn36xx/smd.c
> +++ b/drivers/net/wireless/ath/wcn36xx/smd.c
> @@ -427,6 +427,12 @@ static int wcn36xx_smd_send_and_wait(struct wcn36xx =
*wcn, size_t len)
>                 (struct wcn36xx_hal_msg_header *)wcn->hal_buf;
>         u16 req_type =3D hdr->msg_type;
>
> +       /* After a WCNSS crash every teardown command would wait the full
> +        * timeout; one is enough to know nobody will answer.
> +        */
> +       if (wcn->fw_dead)

It's not clear from the commit message why you need two variables
here, why not simply testing  wcn->removing.

> +               return -ETIME;
> +
>         wcn36xx_dbg_dump(WCN36XX_DBG_SMD_DUMP, "HAL >>> ", wcn->hal_buf, =
len);
>
>         init_completion(&wcn->hal_rsp_compl);
> @@ -440,6 +446,8 @@ static int wcn36xx_smd_send_and_wait(struct wcn36xx *=
wcn, size_t len)
>                 msecs_to_jiffies(HAL_MSG_TIMEOUT)) <=3D 0) {
>                 wcn36xx_err("Timeout! No SMD response to req %d in %dms\n=
",
>                             req_type, HAL_MSG_TIMEOUT);
> +               if (READ_ONCE(wcn->removing))
> +                       wcn->fw_dead =3D true;
>                 ret =3D -ETIME;
>                 goto out;
>         }
> diff --git a/drivers/net/wireless/ath/wcn36xx/wcn36xx.h b/drivers/net/wir=
eless/ath/wcn36xx/wcn36xx.h
> index 8c43f67bd7..9e5f3918ca 100644
> --- a/drivers/net/wireless/ath/wcn36xx/wcn36xx.h
> +++ b/drivers/net/wireless/ath/wcn36xx/wcn36xx.h
> @@ -276,6 +276,10 @@ struct wcn36xx {
>         spinlock_t      dxe_lock;
>         bool                    queues_stopped;
>
> +       /* Set in remove; a HAL timeout then means the firmware is gone. =
*/
> +       bool                    removing;
> +       bool                    fw_dead;
> +
>         /* Memory pools */
>         struct wcn36xx_dxe_mem_pool mgmt_mem_pool;
>         struct wcn36xx_dxe_mem_pool data_mem_pool;
>
> --
> 2.43.0
>
>
