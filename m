Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=205.220.180.131
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793368847;
	b=4qY5V4B3zC44n0lMt1y/FlkC0tZDzQHShVaeppixLHKKj25uzrkyEgagD0FGcmTG1XkB
	 gC8QItDC/nG0R9YAThVwIsdNGBj4lAi8hNzf9QXF1q+93Sc6dy1GQgiqAUwJE/g6vrlGD
	 l5VpHwOCDl8MoSmrBIFppXEbs+nPEVEJwDHxvqgvy76BUaF/gbvOInwl26EMfoOkKvm9o
	 kWWr76FjuOKB3qGk+jibk7BBmTNVK9vEdCNK1v40S7EYhC06Q5qAtN41DQ/bNTWYZtjmb
	 2Q51BP6M94nXHvcrlwCuHOuSYv6TaoWxuqgai4uNnMF6kkIY7s801FlrZgpTO5MUYSw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793368847;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:MIME-Version:
	 References:In-Reply-To:From:Date:X-Gm-Features:Message-ID:Subject:To:
	 Cc:Content-Type:Content-Transfer-Encoding:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-ORIG-GUID:
	 X-Authority-Analysis:X-Proofpoint-Spam-Info:X-Proofpoint-GUID:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=OuitTymSSoEUqo8wxOrof9T+ZUTGPTidse28qGJb34o=;
	b=pM2tlUp4b4CysnXlGSss6UCvsOva68kCY2R2M6C2QysySsrJNmoU/gEsyOpn8ZDyuWss
	 7KQymW0Zlh8DB98ljaKCQUHQ+NBqowM2pbs6zfK8W6tNIigeqRqYHs/VeOKXwmOCDj8dz
	 wi3CoqAr/nz2LJDlASsf14ES+p42YzYFuJggIcdbS+emxnT+F1F8bOeESn13ehBlSCCSq
	 5kC0Y00fH4GkFhmI0iItNl3KHBisDaybTFXv0P+aNXZkTuedl/CAwi5WR+NzeWoPMIR/6
	 4q+R42ttPmEaIgZZ6J7Of38zNqOj4Wp6v1osB2UDfwR89ekppNRK8Kff/5HyUHK3tQg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=IHDI6toP;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=i3iXP6i5;
	arc=pass header.oldest-pass=0 smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D2830606A32C
	for <devicetree@vger.kernel.org>; Fri, 30 Oct 2026 14:00:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D2830606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=IHDI6toP;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=i3iXP6i5
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69UDnDYf4019634
	for <devicetree@vger.kernel.org>; Fri, 30 Oct 2026 14:00:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	OuitTymSSoEUqo8wxOrof9T+ZUTGPTidse28qGJb34o=; b=IHDI6toPVOYrtJFP
	z1ZskiucSL9zaQF1sOyXvlzXXmXLcY6WxvfQOn8yxwZ/hYxEfwFWQ/xNVWoXwEAw
	pi2RJnDNfhF1UY3r1JVkL39V2aGWfVLebudH4SncyDQbgusv+q053AUMKyXiydcu
	Xuuds3tuDj36SZThVwg7WNX+iTMThoNIdbLdehPh7qg+SsNrAl41CZj8mGPab3aC
	IzSvs1s97jhg8gczI1Lc967TPUvwZW3AZO3Od2RD79WhwlAtEum8sDjTCmqLUOnB
	b2ChyMvzXr5LPhJDFH+YAD9wCpqfVYMRl17krS0QAmuFPTV0YMDCQfCTL3T781mK
	o4VBYw==
Received: from mail-pf1-f200.google.com (mail-pf1-f200.google.com [209.85.210.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hme6qkbwh-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Fri, 30 Oct 2026 14:00:41 +0000 (GMT)
Received: by mail-pf1-f200.google.com with SMTP id d2e1a72fcca58-8a0589ff620so592049b3a.1
        for <devicetree@vger.kernel.org>; Fri, 30 Oct 2026 07:00:41 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1793368840; cv=none;
        d=google.com; s=arc-20260327;
        b=s/NtizMh92wBwG4FRbMzOupHlyvZnsqOzViNcipKS8aD9QoUr0iNg3qNgMlOEJYYGQ
         Fx7RQFGNZAvu6QczywPVlvhRzZHsD3nIvhN5PZKAQr3HbhZOXJ3X7xxDrRWHgwCCY5QG
         fglaHolQIT6wWyBK8hrAmKVl9zk17CS5D8EjnW4Uy3PeamAno0q9EvfgLm4CHaM3Xqhn
         R7tgN/bNCaQRo+YWxFwWyVLm1J+il8IkRkHOKGn25ozPYETpxZJfbprJLoJ5C2LCYCDt
         a2KQO/LXJLAWzIj3F4gKymEFUTmHanxYT30wzSUe2lvvON6nKVLiypq0k9eKnVFbGi3m
         jhDA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=OuitTymSSoEUqo8wxOrof9T+ZUTGPTidse28qGJb34o=;
        fh=BrUO9SkBN/KL+7rzt+NNuTQw8bH1g+NCTdEwgl2teJE=;
        b=OuJAVARb3qVLkZvm9ppSaiM2lrFk32qYn8kQjbnQKUxMRehIYVjqj4nPCq6jPd3G+v
         8FNxJNWQVFJtXqULeQIwyoEQAU4DNYZgFt3wtzkrsiMvC0o+cH7gxTljt9ut2E10O1CC
         evo3avZ8okJsfOJBtmBDFGurur+IEw6aytSvG3Hi0j5Pp7t9RG6adRk9XZ7nNZzeKiwM
         +/WBIDg74/WiXCI8tiC4LngahTk8qEzEoZU0wOU5w7DBa//5TEwfLzqOIRuRe+B+v+3l
         O7qV1h6x09pPEz7QF3oPt9mLnC9iY1ttce78ma6iGa95Dr6NwPdv3KyWQfSqRofdy+ox
         Zgaw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793368840; x=1793973640; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=OuitTymSSoEUqo8wxOrof9T+ZUTGPTidse28qGJb34o=;
        b=i3iXP6i5Dnq+MG41zCTDXZXpim3b/cvIywWhNsZihbG93Pe1jUU/Ey4ooCCkSjVSQc
         CnnwFCMxCHUaamI1WcYCUmajPvbq51uzDV8p1JguGBuO9uDpeZhh3+71/Q2uEg4llRVm
         hrBQyyQZ+WzxRKioK7Ji+UJuZ4fh4erz7Pg/OkUXEeAbb6YhsxAz4M0LG52MD3ikWrPe
         oCo8PwliKXNbNxyjKq0XvYln5PtqPOz5xVsZ45L1wrb5otGw8SVWvBfeMbL+5Jpwc/P8
         DpAdDVAm7xj9SwsBwnZhddAdmxxTLDHQZFq6HSmFny1TgaVgLWdUTCvnyPGve/lDJlec
         knzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793368840; x=1793973640;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=OuitTymSSoEUqo8wxOrof9T+ZUTGPTidse28qGJb34o=;
        b=VmZYpc0Z1iaUhevvkE08mkjTi7y9Vb2Yw1oWE89HWnO593BaGmIRMqYKrogZko9k3h
         TfUEGY6pGEW+Fj4iXSlkEuGaIDOZMX+LyNMplsEkxZUARgdVunBhuK4nY5nFypnbNnVy
         NFfsA2+8o3vREC9FnB37OIChbDtlqp7dsLRpvWa6T3i4Mj9K53U7Kt1JcYk5a3sjn+Ms
         VMKPJZuJ1rmVw7//2ouq3Koz+mg+gGK7mQHUi5aB0Wb3QsVyfNXBHcvmSHssFvlAU2Mw
         goResxq4v73HJt3He54YjpFhpd8zdxcwMlLzLhxtxCdGeCKgrLlfJt6ouY8F69XlsUJY
         T40Q==
X-Forwarded-Encrypted: i=1; AKwUvBx8xvrJr2gkUa453q2tJsQIJmssgxixR3j+xqHUbaSTH+DlLvl6nqceB+CBny6dZA1rvZT5Fr1f0cQD@vger.kernel.org
X-Gm-Message-State: AFq9FYLojDYcWGRE2Dfhptjhx4QnU3v7FXh+gVXBb3eFJegR2jEBGiPm
	XlmxvgYEmyvqzgZO9A6PNQ0nIuJ76FcJlf71F0VEsa1GC2T1d0qtvD4PKLRi8d5vIVtmju1I/Un
	nErKh1DaPKanYXDOkJVUFO+w6laMUHHCkXQ2PItwyv38wRg366QsbIvHeZWjhF7rKvumwFC3fS7
	Esa8Rvj1P2rIpjbUJN13jzrCHp670Td3Itk5rQVao=
X-Gm-Gg: AYBFou0jxHx5xCuD51Kj9FVelj8NrF2OgWxvfQN0ZEBV/xp5odR2Fi0UY9fe1J8b5Zc
	umbyv1cE5p9/nTf1doFArVypbdC6ibATuM4ps1LIf2upPv0cLRvnin17LQqPMGa3xKQxPwmWsAQ
	vbYIs9ywOVrVi9LTw+C+JlQZa3ETnLVYHK4Y5iX40zXYkII0kNJWHQdVgH5Q==
X-Received: by 2002:a05:6a00:1c91:b0:89e:584:bb77 with SMTP id d2e1a72fcca58-8a9c098ab29mr2174848b3a.58.1793368839475;
        Fri, 30 Oct 2026 07:00:39 -0700 (PDT)
X-Received: by 2002:a05:6a00:1c91:b0:89e:584:bb77 with SMTP id
 d2e1a72fcca58-8a9c098ab29mr2174559b3a.58.1793368836406; Fri, 30 Oct 2026
 07:00:36 -0700 (PDT)
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261027144002.10606-1-ansuelsmth@gmail.com>
In-Reply-To: <20261027144002.10606-1-ansuelsmth@gmail.com>
From: Ulf Hansson <ulf.hansson@oss.qualcomm.com>
Date: Fri, 30 Oct 2026 15:00:21 +0100
X-Gm-Features: AclHuK-MTjfwt2OQzyBtwa_iraZJVoORJ1j_v3oQYZTa5jWvtZ6sOZH5C5h4Bak
Message-ID: <CAPx+jO-TT=UAhH5=5DEPuu1XtVvvE_QA_1V=9qw1moZJoPUU-Q@mail.gmail.com>
Subject: Re: [PATCH v2 1/2] dt-bindings: mmc: mtk-sd: Document support for
 Airoha AN7581 SoC
To: Christian Marangi <ansuelsmth@gmail.com>
Cc: Chaotian Jing <chaotian.jing@mediatek.com>, Ulf Hansson <ulfh@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
        Wenbin Mei <wenbin.mei@mediatek.com>, linux-mmc@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        linux-mediatek@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDMwMDA1NCBTYWx0ZWRfX30jTMN4IEQLT
 62OlbAYIK8A/XfuhFDJyaZLzkUJcMbyo10PP66a+G15a4mAjPC33FEIBIG1AZrV+gXaQI9737g7
 hyakkYb9l8ifnxHfKyZKY90PC2Lh+S1o20+Hi0PstGjFkgGxsf8JA8QjLqWnc+YOE7bvFkOuZye
 KZMdPRbE5OJLDOaRcrcEGP1I066ZTLLynw9u/9TMSlVtZyVBDSEbNi2hK6DvVKNvlPUwxMk/BvQ
 m/rLhIB60oIX4apI62oMsdU2kLDmK2DLJHkTB0Y/acB3PC592SW91zPsDaV5bEbtsK3/Vnnq7XZ
 Ui+JGp3e4VKYKUCA7EJqPCb5Hc9JYNgk/oND4NGLZcD1GU0W2FnKQhZOQcdqOc8wJxtq5YUcpNW
 Q+hwZxQlYFkQOh480AWjCDMJHKY8BMaO2tj8LCIS7z13naJ8pyz6Oni0lrbmldPS1WpyXxWdH4A
 BmKRFzqKXD4wpARK4ig==
X-Proofpoint-ORIG-GUID: 3xfl4lF4Bh3bDFvxevdRUl3TixOpMyVG
X-Authority-Analysis: v=2.4 cv=IeoSymqa c=1 sm=1 tr=0 ts=6ae4a309 cx=c_pps
 a=mDZGXZTwRPZaeRUbqKGCBw==:117 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=_glEPmIy2e8OvE2BGh3C:22 a=pGLkceISAAAA:8 a=5vCY4yJ5Sko5zDJxFQEA:9
 a=QEXdDO2ut3YA:10 a=zc0IvFSfCIW2DFIPzwfm:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDMwMDA1NCBTYWx0ZWRfX161I3Bxef032
 fociaad85s0tws0xcxaGYn7vSCFY4UH42gQ3oZGVaULMVYsnyf2f+KaBdtIdidyWRBt8nJ6OCFU
 zeac7f7nIO0PlNmNnDE3tLpGqYQq7gU=
X-Proofpoint-GUID: 3xfl4lF4Bh3bDFvxevdRUl3TixOpMyVG
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-30_04,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 suspectscore=0 adultscore=0 spamscore=0 lowpriorityscore=0
 bulkscore=0 priorityscore=1501 malwarescore=0 impostorscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610300054

On Tue, Oct 27, 2026 at 3:40=E2=80=AFPM Christian Marangi <ansuelsmth@gmail=
.com> wrote:
>
> Add dedicated compatible for Airoha AN7581 SoC integrated MMC controller.
> The MMC controller is based on the MT7988 with the difference that it doe=
s
> have a single clock controlling it.
>
> Add the dedicated compatible to describe the 2 register requirement and
> permit to define only 2 clock (the main one and a fixed clock for HS)
>
> Signed-off-by: Christian Marangi <ansuelsmth@gmail.com>

Applied for next, thanks!

Kind regards
Uffe


> ---
> Changes v2:
> - Also add compatible to restrict clock-names for source and hclk
>  Documentation/devicetree/bindings/mmc/mtk-sd.yaml | 3 +++
>  1 file changed, 3 insertions(+)
>
> diff --git a/Documentation/devicetree/bindings/mmc/mtk-sd.yaml b/Document=
ation/devicetree/bindings/mmc/mtk-sd.yaml
> index a4d032224dce..704d59360bcb 100644
> --- a/Documentation/devicetree/bindings/mmc/mtk-sd.yaml
> +++ b/Documentation/devicetree/bindings/mmc/mtk-sd.yaml
> @@ -14,6 +14,7 @@ properties:
>    compatible:
>      oneOf:
>        - enum:
> +          - airoha,an7581-mmc
>            - mediatek,mt2701-mmc
>            - mediatek,mt2712-mmc
>            - mediatek,mt6779-mmc
> @@ -182,6 +183,7 @@ allOf:
>        properties:
>          compatible:
>            enum:
> +            - airoha,an7581-mmc
>              - mediatek,mt2701-mmc
>              - mediatek,mt6779-mmc
>              - mediatek,mt6795-mmc
> @@ -238,6 +240,7 @@ allOf:
>          compatible:
>            contains:
>              enum:
> +              - airoha,an7581-mmc
>                - mediatek,mt7986-mmc
>                - mediatek,mt7988-mmc
>                - mediatek,mt8183-mmc
> --
> 2.55.0
>
