Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=205.220.168.131
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795604913;
	b=zzqpca6zkkolvyLaDX6DGML9ThZn5sk6/Rd8V0OJxm0G2lBkKbTCPs9t/iu7MJwVXSik
	 Y96YiuEBoSxgW/XTmC6I09GFmu8gLQvDefZtzZySaDEpW/AspUCYMbWIbxL/65urFwiA2
	 UrAMTG6Q1epiy5YQsUNCm50M9/H7YMW0rM1l2MTXQ9elsqsFV2rGF1iBD9KmIDU9URX6e
	 K7zyllunrUCDxjqg106essAMu6qEvFpIhweq7jraIaGpd9LkiwnotIFog2lkv6ATZF0f9
	 YEeM9MPKVGKFgmgm/yaTxHNwygCUV8arSsH56fvyw7Tm8my+nUQP21Oryn7plw8B7wA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795604913;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:MIME-Version:
	 References:In-Reply-To:From:Date:X-Gm-Features:Message-ID:Subject:To:
	 Cc:Content-Type:Content-Transfer-Encoding:X-Proofpoint-Spam-Info:
	 X-Authority-Analysis:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=m7zUToUS1+7RVlBq8lg0DAY2VTgGDQHEGVuEzMquWAQ=;
	b=P43XfM0JLbVJaJ2ok00wwzEeXrhlXEplyZ50jc4wja7Ln72fRT4THi9N/AiHJpcPavbx
	 hAtQL0twk5YIKFbVPwOuexJjISWsXV9QD5R2IUjgYWDA9Ura/iCP9WDWPoIWhJ0FVrCgp
	 daRPVBfP0CZ1etB41Bx4uhjOoJrLuCXJS0LxOkxH2pI1moTp4PiJhIWhNJKk77xMcYsU6
	 S/qLNn6tmAgiPiaWc0i74mdzFEK1ehh7kKiOgYeUcgw8VMK0bkba2Ou4mqLVHXYYzc3r1
	 Q1YXF1jZ5ZYDcrMvWGUb3ha2VEp+hZJiRq97Q0m0OfTDyEBqlv2De0LB2NRNNaF7e5Q==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=nc9uQR+j;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=JooTsSeq;
	arc=pass header.oldest-pass=0 smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D506160A260F
	for <devicetree@vger.kernel.org>; Wed, 25 Nov 2026 11:08:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D506160A260F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=nc9uQR+j;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=JooTsSeq
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AP9mTgq4034198
	for <devicetree@vger.kernel.org>; Wed, 25 Nov 2026 11:08:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	m7zUToUS1+7RVlBq8lg0DAY2VTgGDQHEGVuEzMquWAQ=; b=nc9uQR+jLwGYfJ+v
	wCrebLA8CUnPykqKns+CQ2yrRQX7mBdPXHCMWPqrppNP4EEqU2xz/ZDxv4GlaaV4
	diSFgLYngeA848CL7VUmP79lf0CGvoFe7HMV9ryXoUlJgFCDYVA+vY5YqMNHvOzp
	AP64yguW96k89HPWqInNVzFmbAczwLCAuNLpnN+AtB/co6g5xKucvRnn7YHP17Tt
	nsxQo16Kb9HnPlxBxSSD/axvQB25PQ9cB8UzYqupv/HjZ1aliLqhuH91v4Qctbk2
	zFH/QuxXH5D6PfcOI6atlTGFW72NTj/SQ4NkYR6bvlOtcKnV3kbeDY4jlT8UZFVN
	H9JRJA==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j5mqbjf0r-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 25 Nov 2026 11:08:31 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-3b41f4ca1bfso4457277a91.1
        for <devicetree@vger.kernel.org>; Wed, 25 Nov 2026 03:08:31 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795604911; cv=none;
        d=google.com; s=arc-20260327;
        b=NIRTjuCRsRYmmdrz7i1tPu3SXrglbwGJEBqLTa/hZNzSv+Q/XOFm6JbuiR1ucnq7ux
         Aq4no28F8eJ6OfhaHFon1Ol4aedGHzpGxV4LwVUXOrDGEbZU2KDIo4C642k60/ZzYGt+
         Pq4LkWHO9EtDw+9GygW0XOAXH9aWxATE8eXkZ784IwtMFL4nSt+7dahPPhW1fkyZcoKm
         Jq6QYj4mc6Ha2D+KfaDslZ7r2AhUTaTMZNCCEXLbQTStMxIVYqQ/4r/b3dzG50DLZUDK
         ojCBB+NGXzzplVR4HS8bmlyKc/ezqqmNAiqFCI+YuC0+hM+ce6xegkPdtxpbwiDR59nN
         vumg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=m7zUToUS1+7RVlBq8lg0DAY2VTgGDQHEGVuEzMquWAQ=;
        fh=u4Ku49h1gnhUw6LDUhAwjBjw8Txo9GqivbyEbJqm/lo=;
        b=G1wOhho5iwEtYpULqD2Uixfp6dAxOX1aEksso4iqw0qbJ6FB17KO35Aa0XQEMKxTs0
         ej16s/d7dYtvAZZR3dVbn+Iuny7C7jsUetiuOCvl8MQBz3gcG0SUTDmm9UOPaA1aJG0I
         8D58u1BzNOyQjKDXhuJArFwytCfHMprTctOfPW87Po0k89FgPEYSWyd9vASOgI7dty/f
         G/YEZznBjKmceF5Eu0TDqavT6UBRgh+x27XHH9XzzOivJhqlIZykZJ3ZEpQcpM6MaDZ4
         GOrlMvdq2ocvyRiGBKtxqrQr6DhgLd97hz9jYXRMGwKurLsmWi4ESh3J0MJi1YMBnB3w
         VF+A==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795604911; x=1796209711; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=m7zUToUS1+7RVlBq8lg0DAY2VTgGDQHEGVuEzMquWAQ=;
        b=JooTsSeq2RR1X9kQ7o0BsZFsA8NkAkFKzubTfUrfxs0AoHK0J6gRp/ranL0IYd4DTh
         qTFPTwolI/JQcnvGSgmo+MEX93AyyL2/zTlaOKAMWqGXXu/OU/+e+Nml21uA+/7i/TW3
         AdMpSpQ6HS+75nLtv4n1XMi0n4knpbPsOUxLp7zi+/cFhxR+qTBbpB5FWeoW/wz+mo1E
         L/TIjfPa4lOEIjrqRusrw/DGKvaaCaUSlWcHhH60n6vEOlahEwY4nM7VlyNTUMmgjtSb
         bJhUa4rVDCDmrO92JSSelxDCxWetV8Y/S+s0qvhkkRctw9hA8CuSIPoGQoLr5wa4JDyS
         nBWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795604911; x=1796209711;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=m7zUToUS1+7RVlBq8lg0DAY2VTgGDQHEGVuEzMquWAQ=;
        b=hlwum4IzAfpS+oRQRZURNb7uNLPjEFNuiOw0NjS2bFctTeAbJLap8AEZwtOUUlnVPH
         tn0I9m4IBz9UgdbCoTshDd5dOnW87CUllK3CWRFEbqp8v9iXO5PfkJyUicTkFaigVc6L
         CybxJtHbUIRi1cUQvlA9jei8Bscj3l2qTdmlsL3p7xf84Cb8TAxw0KbquuanK93RZ4di
         gYLY4T9TIUGQddE3ypsz2pw+IrRVTb7YtSJ6JbDuVU4Zwd+/iRspbuHhYKRox9CnG/67
         6D4g2qQWznZzuYbbsP3CIXuUL4eYvJIfcja7BOXpNMGRTfrPWgZ36hHwWyXbnrLlqJkU
         zzWQ==
X-Forwarded-Encrypted: i=1; AL+hErFcMlZ1mrJi0baFcmhichk+8hxz+xL+P8AvVwBMKO5G/jCv3T6qi6sUGzZD3p4eO3U4Z4oqEMWEC3RX@vger.kernel.org
X-Gm-Message-State: APuU4Z+TZB+QHNUCl2P7/EorYbTPSGXJIgg507I8CY33UY2xlMvX6jow
	n89wA2tpI0RPzJi8NmV1Ie+PS5mM9CUvxh4Nre74UFvk39r3H1SmCaVE47B0QEUeuZOpFrMcTzC
	QBjaF/HjGvhL6l88PEoA8pXMjgP5ppnmC+Ya20wb+Yvr4lKjjQSaXX2KayHAXDJwRqkq6/jX7u+
	KHOFUw6OSPdlT/BanFqngIqkm15WgXPCtlsLzrdxQ=
X-Gm-Gg: AZFdTZfQZBgeg4QLlXvVuev6cDyz8ox+Bza9NoNvZyBHNbId3VuS17ujzRVhC6BjD0Y
	M43UyL2qAqyzaHdhC+7quYqMTbLPfWV/IF0R5/+gp6BMCagClC1Ns8IxGN+Ol4x82tKMRdo1jZi
	Ny82Z1GEoXheG6CeG5VbzUS1vwayKwndp/j7kQ7vmxvbE0QM/23lqh18uO5g==
X-Received: by 2002:a17:90a:c10e:b0:3a8:13d6:f740 with SMTP id 98e67ed59e1d1-3b41c911c91mr17608617a91.22.1795604910736;
        Wed, 25 Nov 2026 03:08:30 -0800 (PST)
X-Received: by 2002:a17:90a:c10e:b0:3a8:13d6:f740 with SMTP id
 98e67ed59e1d1-3b41c911c91mr17608576a91.22.1795604910256; Wed, 25 Nov 2026
 03:08:30 -0800 (PST)
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <cover.1795029012.git.geert+renesas@glider.be> <16bd6b25711f0e5a4a8ff7484ad3acba83a2a2fb.1795029012.git.geert+renesas@glider.be>
In-Reply-To: <16bd6b25711f0e5a4a8ff7484ad3acba83a2a2fb.1795029012.git.geert+renesas@glider.be>
From: Ulf Hansson <ulf.hansson@oss.qualcomm.com>
Date: Wed, 25 Nov 2026 12:08:17 +0100
X-Gm-Features: Aa3M54pwdhQzxCyuIzV30L5QTtG5r_OlDFzkU_dedYyzSv3GvUcS-vx6Qv1tWoA
Message-ID: <CAPx+jO9F6MkwODVi10HkGNYCTJHG_0vc8Bc3FMs4go2q9+=_JA@mail.gmail.com>
Subject: Re: [PATCH v5 09/15] pmdomain: Make genpd_get_from_provider() return -EPROBE_DEFER
To: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Stephen Boyd <sboyd@kernel.org>,
        Brian Masney <bmasney+clk@redhat.com>,
        Jerome Brunet <jbrunet+clk@baylibre.com>,
        Ulf Hansson <ulfh@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>,
        "Rafael J . Wysocki" <rafael@kernel.org>,
        Marek Vasut <marek.vasut+renesas@mailbox.org>,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Kevin Hilman <khilman@baylibre.com>, Vinod Koul <vkoul@kernel.org>,
        Wolfram Sang <wsa+renesas@sang-engineering.com>,
        Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
        Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
        Paul Elder <paul.elder+renesas@ideasonboard.com>,
        =?UTF-8?Q?Cl=C3=A9ment_Le_Goffic?= <clegoffic@baylibre.com>,
        Sudeep Holla <sudeep.holla@kernel.org>,
        Cristian Marussi <cristian.marussi@arm.com>, arm-scmi@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
        linux-clk@vger.kernel.org, linux-pm@vger.kernel.org,
        linux-renesas-soc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI1MDA0NCBTYWx0ZWRfX/1LDKB0HnAEC
 D7ZzMLfRGmMTPPYTTs5/N7thqX5iJbcBA929wMa7kqnx/ttoskoGJnJc1QFiFXKRfBfi3MtrmrW
 T7c/TxIvT5ZUZ4x/LnVlDj3kklChi2c=
X-Authority-Analysis: v=2.4 cv=Bb9NQbt2 c=1 sm=1 tr=0 ts=6b06c1af cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=yOCtJkima9RkubShWh1s:22 a=LDBv8-xUAAAA:8 a=wQiWHD2DouBedGx1vnwA:9
 a=QEXdDO2ut3YA:10 a=uKXjsCUrEbL0IQVhDsJ9:22 a=DZeXCJrVpAJBw65Qk4Ds:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI1MDA0NCBTYWx0ZWRfX0Vbd4hu6uuzx
 hTpXYFTqwAc9uqDvsHDnRpEZTJxRal63O9SqmNy/KIVdxJViDLrtSzHhP7NsCaeRbSOaZWR4YQ0
 keZ9hJuWcF26Qq8hHuD1sx4uEyfntJDZiHeKRPGnz/StaurPme0UJ9A/EM13AzhCH2dIXUax5Uy
 OH3ypbdSGArfT+e8zhuuK+Zz8giN1TJSBDqVhfur955/8B0fT6FJa+1QfxpMKy+SSbzRQxdAK01
 0BsX58dOqqahvse1R67I01Lmq5Y5kx5tVclXP+V7fxvc3etn602Z3GqdbP/2rtZvYpVc6ugk8N0
 HbrEUvqRmW4t5Q40OAu/xQvHoqCFEQnpS6K2uRy+lCukjee7CJENvqCbnyv7XdDPlhNd1IaGBsp
 LuqcKFv0EMOaeLctEdHfwngEk6n+d/iKuq7dnl9qOXpBlaK4vO3OVE7n99nczHavYUFKaq6m+t/
 UU5/4R9Kb+EUvtk8KhQ==
X-Proofpoint-ORIG-GUID: Y3h0kN5tjiPNVWOzyt2wPo0sRUVk6e4J
X-Proofpoint-GUID: Y3h0kN5tjiPNVWOzyt2wPo0sRUVk6e4J
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-25_03,2026-11-23_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 adultscore=0 clxscore=1015 priorityscore=1501 impostorscore=0
 malwarescore=0 lowpriorityscore=0 bulkscore=0 phishscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611250044

On Wed, Nov 18, 2026 at 8:46=E2=80=AFPM Geert Uytterhoeven
<geert+renesas@glider.be> wrote:
>
> Unlike provider-based look-up functions in other subsystems[1],
> genpd_get_from_provider() returns -ENOENT instead of -EPROBE_DEFER when
> the provider is not found, thus not supporting probe deferral.
> Currently this is worked around in of_genpd_add_subdomain() by remapping
> -ENOENT[2]; other callsites don't care about the actual error code.

of_genpd_add_subdomain() isn't the only caller of
genpd_get_from_provider(), hence this would change other behaviours
too.

In particular of_genpd_add_child_ids() could suddenly start returning
-EPROBE_DEFER, which seems reasonable to me. My point is, please
extend the commit message so this gets clarified.

Otherwise, the code looks good to me.

Kind regards
Uffe

>
> Fix this for all current and future callers by returning -EPROBE_DEFER
> instead, and drop the no longer needed remapping code.
>
> [1] of_clk_get_hw_from_clkspec(), __fwnode_reset_control_get()),
> [2] Commit 18027d6f392ee8d8 ("PM: domains: Make of_genpd_add_subdomain()
>     return -EPROBE_DEFER").
>
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
> Tested-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
> ---
> v5:
>   - Add Tested-by,
>   - Clarify that all other callsites should be fine.
>
> v4:
>   - New.
> ---
>  drivers/pmdomain/core.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/pmdomain/core.c b/drivers/pmdomain/core.c
> index ee8075e90852e738..c242807f62579e5b 100644
> --- a/drivers/pmdomain/core.c
> +++ b/drivers/pmdomain/core.c
> @@ -3021,7 +3021,7 @@ EXPORT_SYMBOL_GPL(of_genpd_del_provider);
>  static struct generic_pm_domain *genpd_get_from_provider(
>                                         const struct of_phandle_args *gen=
pdspec)
>  {
> -       struct generic_pm_domain *genpd =3D ERR_PTR(-ENOENT);
> +       struct generic_pm_domain *genpd =3D ERR_PTR(-EPROBE_DEFER);
>         struct of_genpd_provider *provider;
>
>         if (!genpdspec)
> @@ -3276,7 +3276,7 @@ int of_genpd_add_subdomain(const struct of_phandle_=
args *parent_spec,
>  out:
>         mutex_unlock(&gpd_list_lock);
>
> -       return ret =3D=3D -ENOENT ? -EPROBE_DEFER : ret;
> +       return ret;
>  }
>  EXPORT_SYMBOL_GPL(of_genpd_add_subdomain);
>
> --
> 2.43.0
>
