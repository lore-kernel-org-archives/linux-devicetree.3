Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=205.220.168.131
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795033274;
	b=bUxFxkMe+Ihfj8c9w87OPP1zTp0oaS/cQgJHhZmC2icbnRykYcUhCzcbxu38ADq53aVw
	 GGtmxgm2z4VgcryUdDZXkLWrC+QfFFEg4pJvHM9pXpqFwjiEcEpifY2l28iAvrvWjb9QW
	 5Nl1eSrl6jJ0fwZA8yq5dP1lDEETSlLpaDx7eslCfNl7iZf2VB9h6uQAuEgD9lwKjx6E1
	 paHBGGVnVug/EkqQDleDPGLywcq0eHKdtYoij6oYk9OLLiXw6uO1X5gzpcvI+SKmqvR4v
	 85Pdd1ZPmLQqCRAv1TqsyhOHq2sWdySNZ/pnFHx2Gy7xWrdH1u9cVa/LMYCx0jn0ATQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795033274;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:MIME-Version:
	 References:In-Reply-To:From:Date:X-Gm-Features:Message-ID:Subject:To:
	 Cc:Content-Type:Content-Transfer-Encoding:X-Proofpoint-ORIG-GUID:
	 X-Authority-Analysis:X-Proofpoint-Spam-Info:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=PhqPn/ICV8v/KU7lWAnokH2D84rMdKB99wdgjfIsDhg=;
	b=F83jqoIWQQU71nZ4NhArTdn1Rx32Rw0aYXMdkou6fUWjZW9kiZ7ZzhUUEZUrsyGQbyPT
	 KwgL0YxYqIVu0GKpBVc26bsBQhZoEJ4DqzuZtrwEfgqgVUGz+sYBQp3nvhhIKTAMxxQeE
	 hIiLonvdId+m77z5SbWyX4KqbNOFpwEvhD1Mgx5qKrDRTfvbqj7R0AIcwY41yn+r9dzEL
	 lX0ng3wCkSA7WmtHsxWuufv+fnNZSCq2ubWOyZvORwq8+Fb+1gKUhL8mvIDc1NwISrP5k
	 EHXPiOCF2uUYa7ghSSEMvL8Jal/jCpdpJ7XXjOSLkOnlZwE9P2QJBGT/ERwtF/Lgn+Q==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=dpAEJXdc;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=KCJfUviT;
	arc=pass header.oldest-pass=0 smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A1200606A32A
	for <devicetree@vger.kernel.org>; Wed, 18 Nov 2026 20:21:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A1200606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=dpAEJXdc;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=KCJfUviT
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AIJMIYa687037
	for <devicetree@vger.kernel.org>; Wed, 18 Nov 2026 20:21:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	PhqPn/ICV8v/KU7lWAnokH2D84rMdKB99wdgjfIsDhg=; b=dpAEJXdcPnatspnA
	S07G/YQ2IRII6ORHQHfRa4t6sTEhkDMP8EzaOYLCCYd8MPoJ7T0kqoWsDfrOtmk7
	6HRVGsbhPx4SZZdnzsxpyOtL5cuXMSV+umJcz0xfn8WFdZfa0jLgci+cgiVjv1dX
	uNPiWEqeZgZuZROeXXlT5I5SmOHz03O4hwfL83+9CzAJ4HQyZotN7hm4OpZez4Cm
	41gcZBYfOp3+UKmBo54LFxe951vllosKAzrmMLMrDNPOcm1M5fqAhLCYknC7k9bx
	C7N2U+d/g43036aqxGdaJYnQ9bjtXCRAngwotBRdDQ3P2cTxjx5zR1NZY92q6SZb
	H/MGDQ==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j1e5qsewd-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 18 Nov 2026 20:21:12 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-94607500fb0so220163485a.2
        for <devicetree@vger.kernel.org>; Wed, 18 Nov 2026 12:21:12 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795033272; cv=none;
        d=google.com; s=arc-20260327;
        b=C1G5TLYNW//vWADLqBXoMNObfZOgfeyNVGEki0q7I5z7sfmx7sIe6jJZdjlr97688a
         eTVTGzVC4gasXnIQr0q/Dd6r6OLHBt11EWDWansW5jzFcjACETHpf03/ytSKW9MSUr/8
         Q4UbMYxXmik19wKyFf7GZ+gcxeeFdjXHdr/Yq0R03WyjJfmWBNjmKohX4qM411HJNZHV
         TQnr1J3CVupoggqr2vHwXVdXCCzgeyrEDcCn/U4/Wzn6iFWdNCxMJSJHsFdPPLqRMcfh
         hsh0t6eb/spmiokG46PFoOzGOK7WstJ1Hd7rD0wcQhLTmkIKHiN/UF3ehR0YFxpW/W+g
         5EIw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=PhqPn/ICV8v/KU7lWAnokH2D84rMdKB99wdgjfIsDhg=;
        fh=pQVFLc+7rTwJ1NxPbHuoUWM15mLw+pojZfZn7M/zodo=;
        b=Aj2vGkHsBzhirodBlsrWLWD3iuP7/PAPQJ3UBqpnVMZTK5lxAS/QXc0iOxVJFSmJLb
         Jr390F93Eh4STh3G7lOL5QISa/L4zFn71VJb+veJ5/aYC4m188i0TlgPf+rE+aW40cg5
         kD0REsVwxxnYrXLmcDmCEmaQjxPqAI2ax+d0+3XvgIx/4KNKJfsQY+mtI72lLjRYQNC6
         RQ12Nhr98ShoMQizhvgitzr4UvheWK0Z3clfwiBydthan6Ew4usMZKQaitiSV7/ia5f8
         NzNd4gjk9j+1y640ZL4vxuXQmyJjtz8rO49S4YBfOTXKyWRr4gZfK8Onmd14pztu2EMg
         3Pqw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795033272; x=1795638072; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=PhqPn/ICV8v/KU7lWAnokH2D84rMdKB99wdgjfIsDhg=;
        b=KCJfUviTRuV0Z7GTWfJz8XO/IdaEFc/kZo7ZFTnhZ/1KdZO7yn8/wBSX339eyWgWSF
         glGlX4CU8lIRL3Hl4kB0HtpSekhmcoHmfiNhCcjenifEds5OwxfvsRSkMlsI0g/7V8nE
         zAQoeSGVX7/oHMJ/l54qXNkkywvWnc7J+j+HHPJOSSOL2lkHcM4UJgTyLh9i5CkPQ4SM
         ZoE9frnyTeBUxy7ppoE0InR7S4C6d372/gp+S6lb9rpeQM31tOlutCjHpd6MI1+okeA/
         YibCvUyoAYFB4JgIg8udrHt0VGmja1RQw4L7EUnWfFsX2dp1w0K6jk+3NCh6ycMYnor9
         8VWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795033272; x=1795638072;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=PhqPn/ICV8v/KU7lWAnokH2D84rMdKB99wdgjfIsDhg=;
        b=ETDeuw8amQmMA5DXL34ZmhLT46KxVv57g15FJlUCfr3WVD9x1z/ieOC33gUNZDF87x
         kQ3srnKcCa9ECTuCHBW6OCSg656G+mXwn5ogftPMA/ARytQsaZkQpwnSm5IuobevXK+T
         RQsH/gSp2u31RB3nEH54p3CDeWvpCSo2mKaLCjQB4NghwVYLpjiKZ6rUMmYmEcnOwZTT
         9Lxw/nBaMojBupip66IU4s7KXF8cw+IRlQ6J7Go4Y9FbaolglW6jhJlXSn5oLJzqy0do
         IZDQAQKvTkaqMW6hOld3bjQ+toA15tNffb7PYYfrMA8m649TkP0PFVk90omRotgiLJym
         6YMw==
X-Forwarded-Encrypted: i=1; AL+hErHok1PEmqzgSwzfkZ+2emkIKldCvhXrPxPJWsY9MY6/7XskDIOhSuRAL08JMbtUWIdHa2Afoh9DU7Yo@vger.kernel.org
X-Gm-Message-State: APuU4Z8qNrSOT8EIk0wHsUgiHhF6S0mQf/Vgrkx2jiN4cdn3ir9Iqc+Q
	VI9gfCf03ef38Kdsc8b7SOX0YcejJhvMp9QFKQcXSTwNIQ6rP/S5ysECF0Qe1bdVzV/FmmVcO3e
	yjSCKQNkkIqpd+m2+Fb12iEYosR0hO8IQlb1UCY9UMhmc7UsMg8u5QvqsxPADj4gjDp1RTyeUIx
	hRGDfT9kSdTzqGjc7KrlHmW5ynxT/S6WW2dlN1c1E=
X-Gm-Gg: AYBFou3Xs2KJMkzCD+bfX6K1oPiTBGheQOGWBqjpv4SMbf/ubL6Pn6wDFB2slBSHinv
	zzPwmXZnWkpzSBaODMKOKgBEcXxeyN/DxTH1rNrw5iQwQ+MmvNq8fSof7Lyu0FKrY5HIwXSTtdH
	c6AUK8iS9jF4Amm0meUCwVrwTexym7BCuF0377Y+Dq40JD+B6X9Hb21CO0XuwfE2cWYQwAp6Vnw
	+w/mCtZnAJPTMmflOUH49KnoPRVZvUadC8KucD54C7bKr1kJ3VH8COKG1kw5oKZAJHtJK3CmIM=
X-Received: by 2002:a05:620a:2b92:b0:93f:3e45:a419 with SMTP id af79cd13be357-949995b362fmr665350285a.38.1795033271712;
        Wed, 18 Nov 2026 12:21:11 -0800 (PST)
X-Received: by 2002:a05:620a:2b92:b0:93f:3e45:a419 with SMTP id
 af79cd13be357-949995b362fmr665343785a.38.1795033270937; Wed, 18 Nov 2026
 12:21:10 -0800 (PST)
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261118-wcnss-series-v1-v1-0-a64d82e151bf@atlr-engineering.com> <20261118-wcnss-series-v1-v1-2-a64d82e151bf@atlr-engineering.com>
In-Reply-To: <20261118-wcnss-series-v1-v1-2-a64d82e151bf@atlr-engineering.com>
From: Loic Poulain <loic.poulain@oss.qualcomm.com>
Date: Wed, 18 Nov 2026 21:20:59 +0100
X-Gm-Features: AclHuK-LczRUNo-ZjKC-18fa_PbQ7l34X57L0f_tADLZJQVkzCFWJzXtV3xPheA
Message-ID: <CAFEp6-0sYs0mEm+4E_zEgXcSjoYKwtW_YJSa601gb=717Gec4A@mail.gmail.com>
Subject: Re: [PATCH 2/3] wifi: wcn36xx: Do not enforce interrupt trigger type
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
X-Proofpoint-ORIG-GUID: uM0YVr_SpZsBjQFM2Gnp7i82Vf2WN7Ke
X-Authority-Analysis: v=2.4 cv=c5Q+0h9l c=1 sm=1 tr=0 ts=6afe08b8 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=Um2Pa8k9VHT-vaBCBUpS:22 a=VwQbUJbxAAAA:8 a=Knk3v0qlAAAA:8
 a=cZ8Ya61OWEQOVQFXRIkA:9 a=QEXdDO2ut3YA:10 a=bTQJ7kPSJx9SKPbeHEYW:22
 a=L2g3GqtBoyQv0ocsUjqh:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTE4MDA3NyBTYWx0ZWRfX1j734GVM2Ta/
 xmCtnuEqqSUMp89PuB8Qd/zBb/l5Qr99sXm1CxPs+poy8hCgZmr7foLwbzmCPgs50lvsQJZMcrH
 b1PImbIlO1gY9DLyxr1/0izZfTKEN8Y=
X-Proofpoint-GUID: uM0YVr_SpZsBjQFM2Gnp7i82Vf2WN7Ke
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTE4MDA3NyBTYWx0ZWRfX7Pyl7a22XYLH
 lQtwY0tMTvMSO6pEhg66xFpn1lyjJ3mc3aLNkkB4FVau2fksFYINEW2d/mwDD2SO94Bo/h69WPM
 wCOr6BODsAcBMsAEgb2VLw9jp/lMEhlywk2tRZJZ7LR64XimQ968mO7QAzjLbDXj8uxP4UI7DFV
 GUwY3TNlPwGs5CQv9AXEo3KpKy8cEQtgO2qU8OE9Se94hL93Y7he3k0hKcua8g/+lreBBSQQr3z
 C7YykvSCsjDpplMCNFA8NGInqO75+F+7jNJ1wo6fXHe1Vje1kkI7bg3++y0iT5Nm6fcAZm6DSLR
 bQ9iYD1W13aadOMb3z0617mmYSlMWGZ9oHwWkAXTY4dGA9j3+dVrcIZ2dEtcNWpQVsc7IP4WlHB
 DPkUzjcIAvE5rEXaPwedO0kiFXC0aINu4mW2DmuYwkAHIWAoVkPOKLQXJ9umrg6ePE7o15BTwJ1
 1bEwfUlhe9/85RImcmQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-18_06,2026-11-16_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 suspectscore=0 bulkscore=0 lowpriorityscore=0 adultscore=0
 phishscore=0 priorityscore=1501 malwarescore=0 spamscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611180077

On Wed, Nov 18, 2026 at 3:58=E2=80=AFPM Alexandre Rapaille via B4 Relay
<devnull+arapaille.atlr-engineering.com@kernel.org> wrote:
>
> From: Alexandre Rapaille <arapaille@atlr-engineering.com>
>
> Forcing IRQF_TRIGGER_HIGH over the DT type makes the re-probe after a WCN=
SS
> restart fail ("type mismatch, failed to map hwirq"). Rely on the DT, as
> commit 1ee6c5abebd3 ("ath10k: do not enforce interrupt trigger type") did=
.

Can you explain why it fails? Is the fix at the right layer here?

>
> Fixes: 8e84c2582169 ("wcn36xx: mac80211 driver for Qualcomm WCN3660/WCN36=
80 hardware")
> Signed-off-by: Alexandre Rapaille <arapaille@atlr-engineering.com>
> ---
>  drivers/net/wireless/ath/wcn36xx/dxe.c | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
>
> diff --git a/drivers/net/wireless/ath/wcn36xx/dxe.c b/drivers/net/wireles=
s/ath/wcn36xx/dxe.c
> index 801f1218ef..7852f71368 100644
> --- a/drivers/net/wireless/ath/wcn36xx/dxe.c
> +++ b/drivers/net/wireless/ath/wcn36xx/dxe.c
> @@ -552,14 +552,14 @@ static int wcn36xx_dxe_request_irqs(struct wcn36xx =
*wcn)
>  {
>         int ret;
>
> -       ret =3D request_irq(wcn->tx_irq, wcn36xx_irq_tx_complete,
> -                         IRQF_TRIGGER_HIGH, "wcn36xx_tx", wcn);
> +       ret =3D request_irq(wcn->tx_irq, wcn36xx_irq_tx_complete, 0,
> +                         "wcn36xx_tx", wcn);
>         if (ret) {
>                 wcn36xx_err("failed to alloc tx irq\n");
>                 goto out_err;
>         }
>
> -       ret =3D request_irq(wcn->rx_irq, wcn36xx_irq_rx_ready, IRQF_TRIGG=
ER_HIGH,
> +       ret =3D request_irq(wcn->rx_irq, wcn36xx_irq_rx_ready, 0,
>                           "wcn36xx_rx", wcn);
>         if (ret) {
>                 wcn36xx_err("failed to alloc rx irq\n");
>
> --
> 2.43.0
>
>
