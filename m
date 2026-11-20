Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=205.220.180.131
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795163627;
	b=uoeuMwZY8NiljfX6y4EmjzcirOl/Veh2H0B18ccu5qOoYAAd41BdLMzlvLK1/LADgUFQ
	 GG2dy6QcUMQ0VjQU9cRhqnk3QD9jdx6/5wiYtC3epIwNohQOcMFgtXev1XI4cqcPSbsYT
	 aF0/YvF0eseHtn4bwa+BpjdfzoXx5lh3yZsTG6LGTnoSMYXEubcv2iVEnCiHXpjKSYn1K
	 f8HfKOpXlGrwmwq5Y/PdzIUtm3fw41Lz8tiIqkcO3OujnaKMJMSoShA+uQ+wHNvW0yIzc
	 STiAQjFvre15u9xbJ7hdyAqWwNGWDw6rX8eOIL3W6rXV7E1Ha5R/GVhdl+KhewKProQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795163627;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:MIME-Version:
	 References:In-Reply-To:From:Date:X-Gm-Features:Message-ID:Subject:To:
	 Cc:Content-Type:Content-Transfer-Encoding:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-GUID:
	 X-Proofpoint-ORIG-GUID:X-Authority-Analysis:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=CO5MrNlDL6WSmNqTK5OrmHd7flCAe+glUJQ5amPNrqs=;
	b=x3IDmzBK3MzyQ8nCfN7jAx8twJTRojodsfZPquQmr/DPrFFWvsa73Z4cBvmyhHPa23DF
	 qeNic1qJagmjluY+5LcMfsZSi+OxEZxEd1tSONTn3NRJw6voH2nA712V8VxT5GrZ2jA7a
	 L/sf/d9q75nuF6t6eW/ONfQfXYe9ASZwOOa7FJEvUK04+dCojlPywX0Bilhw7sMghZUKP
	 mW8A4sgQUl7M5UxHdBy1Ifoyj/vp6HVRhowOripMCV63NEdRjChYv2t/uUdkCxlvz0b+Q
	 mpjsn8AHyZCAjLIwujhd074R0oUL5bk6H+Hlhwa5KXMaVWAsre14qXZUZyTH+bbq+aA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=JISZ+Ax8;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=M3ZHQgzu;
	arc=pass header.oldest-pass=0 smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D874C606A326
	for <devicetree@vger.kernel.org>; Fri, 20 Nov 2026 08:33:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D874C606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=JISZ+Ax8;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=M3ZHQgzu
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AK7fFWM758310
	for <devicetree@vger.kernel.org>; Fri, 20 Nov 2026 08:33:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	CO5MrNlDL6WSmNqTK5OrmHd7flCAe+glUJQ5amPNrqs=; b=JISZ+Ax8oTuX7jaO
	v0PaB+7NbZiya6gB5uQvYINZN5FssYtBKhpEbi0BUM9KPoluq5jgWfvN9SIHp+jq
	7fLnoanD4NNLCVslmdodnWDRhq8cB6IjYHkr5B/b3cnYTcpDCRkQwK+e1PonF9Cy
	WoatW7ZS25rbBhhZzh4GY/83XpnQVcFuEIPzyQvirMZPPqh5ldxOnm32ozzP2RB/
	AFxh6t8XfrTjAxPUjy/LLN9bsvq+zVXWDphJUSaos9EQyz4VHdNQmbaz23+uMz7V
	Wch5mHjM890nPFuLdko7cg/hrKF2AIRYD+WPPBCW2WxnTgaUGRzCPPC4mH3kREAN
	4SL74A==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j27b5trm0-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Fri, 20 Nov 2026 08:33:44 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-9308eafb465so152023285a.2
        for <devicetree@vger.kernel.org>; Fri, 20 Nov 2026 00:33:44 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795163624; cv=none;
        d=google.com; s=arc-20260327;
        b=GDMYqxqUM3z3+5WH31zADzYHJPg0mnvb1ToMyG+Vq9SgykRtfSDO81RqTlj9OOeUsQ
         Nroun8F4kinCR7N3c1B9VVv5aNmUe+kI47kQK/hXREvrAADJJwe6UGHQTcJ+MmnvgVHS
         xDCwm74B/VZE/NvIXJH3JgzxVw0OBRHo/T3lcg2/SGMJ/2TQ0imMMBV3IUVCVojJ05fj
         F5gf9xSwWOiwlk0i+KBP9qdm3wgbaVUInTjH+eCqu+VQY1rVcwxF3Nb6xo/A5Sjii/f7
         3vTYwvOuuooi+tjznBNMjXq/rCvmGzvz2/wQVir1ekg2hzvrioBByR+DTBBUHOSIDVZd
         pHlA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=CO5MrNlDL6WSmNqTK5OrmHd7flCAe+glUJQ5amPNrqs=;
        fh=M8nlcX2MJweKbS1o2MWyDEXo8coqDBV28loWpvmvdlE=;
        b=Yl6o2SOB4lZMgrv3tih3Ytjb95v+JJAi+Nme9DA/05FcYO8t/ol5L6KGSVEjCgEzpN
         RVYZM5GAwgJhECeTmGnp5dxNLl/fUN/GVlvDN378N2bxSq1qHCE4vcTBrrUGDOD0qCGD
         +BUWgfM6pfD23wqmu/0zJ3eUF88ufhE3Io/VzCNlm51oa85Fo+9bi1nd0VH+it6P0tEW
         WieY72m+Z3psi7V5TwkMQPXunm3CWNfYAnV7/7PpVWOFed64+ML0tBuFttOxneDhhUyd
         fNFsLvMIhpBunXQbwnLqXHTGcTB/+f15tpGTN8jdpo7b4pikIVjSeSoHBfNKdNzs1iJE
         m4Hg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795163624; x=1795768424; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=CO5MrNlDL6WSmNqTK5OrmHd7flCAe+glUJQ5amPNrqs=;
        b=M3ZHQgzujRMWIHTKPVbFJmTfDHRJfZvi+BVqLtasy9xzVgPMdTGmflTim46GNAlZ5D
         SZG3pXNzhKsMt3i9Ft9W7Ok4HhcgTD1MjEK8HwBCOq+iMCYdPaKyp68RCckh68+/dqdR
         +RHYzCJlYBUoW7q1sF0HX7JrMNXWNQOd3Zlaebx833I1ZxMQjwiAyj5UZdjIy3Muk6Em
         bYAHQ35SJldSf0tspS2qMtP2AQ33RABWPWv3x8H7vGBxFNM8YAMHfFWi1bq3Qb7rUTkK
         ft2SDTvkhAvQugCdS03wNKz99MYWAwXjQaIe/db6t9xxW+WxDFr5ysbtqF34RTseuyqn
         N6sA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795163624; x=1795768424;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=CO5MrNlDL6WSmNqTK5OrmHd7flCAe+glUJQ5amPNrqs=;
        b=OG71cU0iQ8MneYeYklu+bfRjpMweZ2Q4newdoCOjnFwaqVAUp58FBqEKNf3+hgnp3A
         f5ItgT3dycijIUiFMRA+vlJLYx0Onb6NRFD+v2zxCbXaELPnnVZ7ShN1GDHJoK99zhvN
         USX1u9vJ/smgZG3v7AoYnUmumew/ClMNaZLmy8I4bOiJ40Kukyehn8O9THX77Npn0z1M
         3TcgfVMZa1zE+cshDw562yI8bMxn7zwKWRdrBgzQwHeqTbmFgvkdfZvXvgT26+Gst6Fh
         AnKzdCxNrDIsOYUBgmwBxg5iZclgE0NAJdxZnx47JQBKJ0aipEATs7/dqpOIv6DyFGpF
         tCYg==
X-Forwarded-Encrypted: i=1; AL+hErHVJAQW/LYBlMqyM9hom+fCMo82a2ciFH6dcB/61qNw6hAUPXP7ejQQYXYNzQGGR7+fBrDerQbPK1L4@vger.kernel.org
X-Gm-Message-State: APuU4Z8w/L0ga1SKdzYoHicOcXw+3WdgKj4n9Q+ArSXIZcrWqXmazXXm
	RR+EYm5EG53HJA7BkBlmItiH1zdi4G2BKlwgQilbA5IldJI1y/IGczXfW+6CWsyT5VD5slv8zX9
	Tk0TdhifwOsvofXgnWrxWfvezQpETOmJm8T1qG2WEfUSvrgH0Fjkrs6LjeA+BkdS2FKrVraSq3L
	+GbhKGBbcd+Tvzf5WWnT+xNCZxE1452X33k528BKY=
X-Gm-Gg: AYBFou1fQSCnJ7qWEI77hyNVDlc+vfgP6Ddis5T3IvYTCWXOZQ9UXxKbDOREz/WCGtQ
	ro/kufz67xRumivJYBkHKVlj+ozGl8lba53WXEPD6pmBP6oz+Ud9pgOK7rmeUR5ooOdtaS47Hsg
	eNw3CSDhSG57EgLFgw3ogWAhi1YpRuanH+2fRVpg72xIaZYvxt5V2R4Zxw6a/EKf0pdaHjo7zH8
	WJoeMYLrnNSgV5HlpPi5Rn8cTE9MpGdz8uR6wFfu11CVyWYEC8mRWdrRdXq+zZskoBOCNNH9RvK
X-Received: by 2002:a05:620a:40c2:b0:949:723d:f7ce with SMTP id af79cd13be357-949ba9c31bbmr378076585a.30.1795163624167;
        Fri, 20 Nov 2026 00:33:44 -0800 (PST)
X-Received: by 2002:a05:620a:40c2:b0:949:723d:f7ce with SMTP id
 af79cd13be357-949ba9c31bbmr378072885a.30.1795163623658; Fri, 20 Nov 2026
 00:33:43 -0800 (PST)
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261120-wcnss-series-v1-v2-0-3fed518decfb@atlr-engineering.com> <20261120-wcnss-series-v1-v2-2-3fed518decfb@atlr-engineering.com>
In-Reply-To: <20261120-wcnss-series-v1-v2-2-3fed518decfb@atlr-engineering.com>
From: Loic Poulain <loic.poulain@oss.qualcomm.com>
Date: Fri, 20 Nov 2026 09:33:27 +0100
X-Gm-Features: AclHuK_13YVfgPHe00rWHz3MmtX2ZPWjOWt7HTHyfWW_D-cw5T1GuCsPWKT8z54
Message-ID: <CAFEp6-2wAR7SSMP68g25px2-5NA9ppRoWP-R1RtBALnDGi_6Sw@mail.gmail.com>
Subject: Re: [PATCH v2 2/3] wifi: wcn36xx: Do not enforce interrupt trigger type
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
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTIwMDAzMyBTYWx0ZWRfX0WoysIpZlGUU
 tCae11RTm+C/6sGHjlqKfecQSNZUHQZm52YIJMTg83cXzpPD+HUjG1I5I4XWHdMf2xiwj2vM5yV
 6UtZxBA1DDAC5TSr9lD9bCnj1NVdXeQ=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTIwMDAzMyBTYWx0ZWRfX2O7jbTz5qxta
 JQzOpPSn9Sv4Xzrxf+J9cDy0gT5Qn2gpP7XIbtJclADnTof2babkLBVKzdm8+CZ3hBuQsfgKV8l
 +DfTj/DSUH04wyhLkPgEpWpXRF40oGmK+1ucnhJYZzKZhJv69VusDAkujkigaQkBlUn98MG5zek
 e0ZaUBxliv68KLc7KHrSLdnzwONloCpmLAuCxh6/fG6G0icUSg6kLlKZ/wCo/k3eihVK4i4dAJ2
 RX9osa4lLXWhwZQW3EYA6e5DMG05lIyUqaAkXqI4AISsDS7dAFwA5uKd4tYpklWa50cXel/QRNA
 lrCYm2hf/HyGAOiW6InuFWs7AF0hLFJDZwHtCH64m395w2XkfYdoDScE3eZrPFL98UfTYoXhBmO
 UxZxerex+RCYhdEoYjsbfbKDddWtnUHbZfoLtPses0yyGeuPMerE0ZoFAn5sKLE88oEL/B+2yLr
 HBB+UiOvOQz86RUt71A==
X-Proofpoint-GUID: bNMZhtB2tcR4j5L6doAj02DHjiKhNW3R
X-Proofpoint-ORIG-GUID: bNMZhtB2tcR4j5L6doAj02DHjiKhNW3R
X-Authority-Analysis: v=2.4 cv=LPTz05W9 c=1 sm=1 tr=0 ts=6b0005e8 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=ZpdpYltYx_vBUK5n70dp:22 a=VwQbUJbxAAAA:8 a=Knk3v0qlAAAA:8 a=EUspDBNiAAAA:8
 a=laIMyccDeTmSpVvBuxYA:9 a=QEXdDO2ut3YA:10 a=IoWCM6iH3mJn3m4BftBB:22
 a=L2g3GqtBoyQv0ocsUjqh:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-20_03,2026-11-19_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 malwarescore=0 spamscore=0 adultscore=0 lowpriorityscore=0
 phishscore=0 clxscore=1015 priorityscore=1501 bulkscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611200033

On Fri, Nov 20, 2026 at 9:05=E2=80=AFAM Alexandre Rapaille via B4 Relay
<devnull+arapaille.atlr-engineering.com@kernel.org> wrote:
>
> From: Alexandre Rapaille <arapaille@atlr-engineering.com>
>
> request_irq() with IRQF_TRIGGER_HIGH stores level on the IRQ mapping,
> which outlives the driver, so a DT with another type gets "type
> mismatch" and -ENXIO on the next probe. Rely on the DT as ath10k does;
> every in-tree qcom,wcnss-wlan node is level high (msm8974 since the
> previous patch).
>
> Signed-off-by: Alexandre Rapaille <arapaille@atlr-engineering.com>

Reviewed-by: Loic Poulain <loic.poulain@oss.qualcomm.com>

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
