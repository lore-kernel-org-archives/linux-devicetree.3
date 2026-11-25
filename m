Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=205.220.180.131
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795620263;
	b=GbnGSwuM1IqdtOncAg3FIIvfx94GPIbOYbAfs+TgAeRS0SdsiMG2MK8u4hJXPfKHH3B1
	 +WgTMLLQc+ItlH9dGnd3NaBBlGJr1VwqKH/Xn83ZP/FHO2pdo2gtTyiS2kEHnoGLIuN62
	 Oob6eWs3IB0cEsiVzTYz1QhxyI7LsQzdnWIo0U1epSf3g6+iVIHnkMi788kmfetWlin56
	 hnD/lwpWKvahyDFKJtog4J4qvCYeUJsLkHWKRHFOrZqUUuZa3UjAMvio6nt4yPM2rEOit
	 DudR0Endg4Eo24jll11Xvdb3Evi0zCQu4ZzDdxLzdaCaeKXHb7Oq5gMzTpStXZTpNmQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795620263;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:MIME-Version:
	 References:In-Reply-To:From:Date:X-Gm-Features:Message-ID:Subject:To:
	 Cc:Content-Type:Content-Transfer-Encoding:X-Proofpoint-GUID:
	 X-Authority-Analysis:X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=cAOpd8pWTb9jYj9oRh4JEDwRl6xgzzqz7YACPIDpZgU=;
	b=cM8i2diK4tugj+gEZpIGNNDYiHYmAWFQz54aUq1Bj0EqP/mTpVn+3cya8yhVXtaIeFH9
	 NZEdMPJ3yo+mK0QepBad4/cltPIsXQF9035kjpdzQ+JshUHPrKpbTwd4qFoRvH3ydGm60
	 sY7fXelhgoB/nnsqDxrQj1wapvqGDzOAHmlKiZIaOFmSmcnjji48fU7W3QyaVMegvRpZN
	 Z9LzTWT0dSmMbYfFFAKvvdiQjmcX5XjoQTaivLH2jFEvh8ekuOb+mSKzIxijfSIAyiqyz
	 yZj1l9VndcJBvvFn3Mx6eOKu8Aj4tXrmA9f4HnxYa+h49SQ6y+AqJ5UD7lke23iitJw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=jpbdRQEC;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=JOUmSRAJ;
	arc=pass header.oldest-pass=0 smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 43969606A32A
	for <devicetree@vger.kernel.org>; Wed, 25 Nov 2026 15:24:23 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 43969606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=jpbdRQEC;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=JOUmSRAJ
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6APEMECB2099771
	for <devicetree@vger.kernel.org>; Wed, 25 Nov 2026 15:24:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	cAOpd8pWTb9jYj9oRh4JEDwRl6xgzzqz7YACPIDpZgU=; b=jpbdRQECJn9dd0rd
	YCzlMvxKh1E2FuxDCRdZgzLYxR58MASQ/lLJbK7mQZPHj1Gv6CsJ0tKvAJ6xMV/M
	gffkkQJSBTkiChotyI1wk1WWAybtK54prCKnQMFZH+eQ8C9VeCjTQScGYlMh0AON
	GmPvD0irgjac0Z0b+QcJN15xfbB9OBHRPmqm+yD2YYvref173bokKukzcTD7iYIr
	nKr2JqhbWduQYUrgWQQgIHZOcB9rEEmQ24/8vdV4MJ/APNNo2e6fRI6+Iz+0oc8I
	MH4oUuVBaeTRylx1QzrZUteb5v4YJcTw2b8S7RnbKVSkU322pPGVZo5XnxMUZQEc
	e0rN5g==
Received: from mail-pg1-f198.google.com (mail-pg1-f198.google.com [209.85.215.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j61arg9hr-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 25 Nov 2026 15:24:22 +0000 (GMT)
Received: by mail-pg1-f198.google.com with SMTP id 41be03b00d2f7-cde9044a96aso2793657a12.3
        for <devicetree@vger.kernel.org>; Wed, 25 Nov 2026 07:24:21 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795620261; cv=none;
        d=google.com; s=arc-20260327;
        b=bYhzJofkmLlmAtIlj87eMYTsqIDg343s5aHhPFdRAkllYmcuWfhZauHZ7kSxCk6hnK
         5sD2jks27/0rbVW0/IyLAUW9JABvCKVcGaKmocrYUzSyHRN2V1LdZ9yGB3LR2fOrfLa5
         xn3b3HUkZQlY7Qo+Zi/h+ILBUil04ieMt8vppDCl9zXG92p0xWnvF80UGifXgeHwExQt
         KmkyDRD/rmF9d1YazroT87kSwwxNjqnsQJDpFQRKdCfUwKngLBXvxF6DAcMwMOUL5CKX
         YF0vAzGiFC3r5ou9w+vApij1qRpb1oxzlS2PsWAGIcjpvMRO66kLJBJ4YkvTE6Du8P8M
         dXCA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=cAOpd8pWTb9jYj9oRh4JEDwRl6xgzzqz7YACPIDpZgU=;
        fh=RDmuOe3kVW+sTjkONsU71w8ZbvoEbBZ4rN9YfSL68NA=;
        b=p12JFR2llnJ05tuvkb3pqMnIbBtDnjxbkVqPS1oaZVu71xdQ1Y5NIM+oSnUD1zJJa/
         X4StvBL7FAPNFkDolovDxOc089BIe/P59vmg2UURlqhDwJ+yEpxrNSIc7vLhibGlEZTM
         qBlSsvWa+qFp0qO6AwKxtUasTG0XB/BDHO/CHKpIkVVEUn6qXWbdyWMAbrasyXm7rlDw
         mThdA3XKx8vDAHOoW87LYxQt6ngPbefxdYv/qyjrnK9t2yO15f0qz+e5Q//qFyIL59O6
         S7DPNBpa9DFq7pdYtNPvEMtZAne4ypZ5P5uVFvnYXuQ/TV7sB8Cyez2umkFxswRSYWSx
         4hAg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795620261; x=1796225061; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=cAOpd8pWTb9jYj9oRh4JEDwRl6xgzzqz7YACPIDpZgU=;
        b=JOUmSRAJMjCviWfrKPzXLdwZgpvlk6WlhGFfT2z/yHl8Ch3saIBnQJiB2SEPcrTvWw
         dR1l1L8pRR+VfSzGt/GizrZxD5DipQDmF9wkPuhlDPAcb3OZBtCcyd5PZE22o6Yvl5rh
         m48o9IR/ddRF+LFx8PQ+tnr92Sb0q6sY20K0nQzVUPz8Dr8XzuLUFP2Q+HltPpoZzekb
         CT44bBAyzjWyhKvoeNgpg6DRqFJOmbPGY3acT+c1AMZ6Tbs5GchHCQiNqn3y5AFmwTK7
         dk+gJfO4Fam2LVYsWc1R+d4o4Rgf5em9/fKI3iCotf3rYydXPz95cUZaLsl7xAsW7Ltv
         CkvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795620261; x=1796225061;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=cAOpd8pWTb9jYj9oRh4JEDwRl6xgzzqz7YACPIDpZgU=;
        b=QA+RqimLtVOV4A+mD/8sUWR+zSINpRJrbBeKYxc4vkSbql7h/fYqfsfi2wOpT/3pAv
         r0xbGbr+CFxcVtUmQcDh4BKFh6vkxVt2wtfpxeBuDT6g7nMfNrx6YKZeZ/wKCMvLlRRh
         ZFPHJWoZ735N1ZcTwCxHpStZLH6TtyzDgKIqtg9FsvuNmTTtqX0a90hinyWWXmWPmRKH
         CwARug69pJkwq1fKom0zzcD5bbxIC82sylyMIvXLH//gMjG4a2XDEmK3nl3Z0mgbSPiD
         n2kH0qyAjo7CFqxgAflkHi67sXETVCzjizhjexAmIJcxFyvHgSMmio2HZcF0YE45oCRX
         cEuQ==
X-Forwarded-Encrypted: i=1; AL+hErG8Wwc1f//DgSoMO+0GL4cfh3etGi3SUNiDMoWZnOGYPK+4q/54ndKn02fBMIBvN7kqp0BbguvIuYb5@vger.kernel.org
X-Gm-Message-State: APuU4Z9Vj4iTIHmOhOB/4D0fQ6YNMReBCqN4baad7ODdhKLjbPQp4AXj
	xCSmp4OxU2G6njM85wCXENU6wIjhM1D1h7sN9Qz5pzEc/+RuQ6jUO37yLdVg1xSOpjVisyowH07
	6g1rXShbF2//XR1OaqefRjq6HjU97fIKluNFIRvn4tWcZ8u7MnZIoDq+JTuy3jUuywVqVHWGEK3
	Gc672m8QhoBwnQg0kHKrDcjF2t8YVr1w7hmF3w/8w=
X-Gm-Gg: AZFdTZeHNsKTJ8mss8cI+SGMGaamlYIa8vn8pG/toFQzYlKbufN3zgZdA0HU8dEqRuU
	OnwE80Mhz1tBI2x2VxnBDTJzwm2nxHyjfOy0tGuYS1psi91PvSWrD7d4sGmyJ822TJjjO56qnVO
	kq+Kq2wW5gm+pX6syARkQHuy51y/4gRUXLe0zzuLYsesQ3yYUSzu4jah8h6w==
X-Received: by 2002:a05:6a20:ef1a:b0:3fa:d354:9708 with SMTP id adf61e73a8af0-4014d35e690mr16693115637.47.1795620260984;
        Wed, 25 Nov 2026 07:24:20 -0800 (PST)
X-Received: by 2002:a05:6a20:ef1a:b0:3fa:d354:9708 with SMTP id
 adf61e73a8af0-4014d35e690mr16693057637.47.1795620260386; Wed, 25 Nov 2026
 07:24:20 -0800 (PST)
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <cover.1795029012.git.geert+renesas@glider.be> <37ddba45a281d2957effe5773c59022835b6144c.1795029012.git.geert+renesas@glider.be>
In-Reply-To: <37ddba45a281d2957effe5773c59022835b6144c.1795029012.git.geert+renesas@glider.be>
From: Ulf Hansson <ulf.hansson@oss.qualcomm.com>
Date: Wed, 25 Nov 2026 16:24:09 +0100
X-Gm-Features: Aa3M54rJMX4qh8HyzUvWFdsjdwQqxq_0OhXrr7tr5X8J3Des22u394yZEZEfoS8
Message-ID: <CAPx+jO9Ao4mR5wq_GTQOegLyYfgf6xpq+zz1tTwU_U7BULeb7A@mail.gmail.com>
Subject: Re: [PATCH v5 08/15] pmdomain: Make genpd_get_from_provider() always
 return on first match
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
        linux-renesas-soc@vger.kernel.org,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-GUID: xPBGyZYwdbxbpAcdJB42oR3G7WFfWqDL
X-Authority-Analysis: v=2.4 cv=OIOyTiaB c=1 sm=1 tr=0 ts=6b06fda6 cx=c_pps
 a=Qgeoaf8Lrialg5Z894R3/Q==:117 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=3WHJM1ZQz_JShphwDgj5:22 a=VwQbUJbxAAAA:8 a=P1BnusSwAAAA:8
 a=iT_-64JVffYfEt0vB_EA:9 a=QEXdDO2ut3YA:10 a=x9snwWr2DeNwDh03kgHS:22
 a=D0XLA9XvdZm18NrgonBM:22
X-Proofpoint-ORIG-GUID: xPBGyZYwdbxbpAcdJB42oR3G7WFfWqDL
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI1MDA2MSBTYWx0ZWRfXxpLrcvYxsfUT
 29eDNFVz9Kl9A6J5HK82MMY0XUQ2XpPN27QhbWiOR7DZChuQ7VIzISIclP1PrPajy6Ayohw/R1z
 qe/jUG6t83smeI8DtA0aOzK3ukum9zU=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI1MDA2MSBTYWx0ZWRfX9fVXTEfPXg++
 WiIdGM136VHkMEynKXmIqj7X/7JS9QvnCys/FKDjI86fyqGV55lrz0gkoGrt+AsUC1dssG1TXFd
 vXhp/+Pkdomi9imw2ouQ+W1IYFkpmdhFJIjQdgJmC7fHmuhCEPw5OHNf7BEJ27zoMPz81K6g9Xr
 vOzhbUhkJIWkj8kFuVeTAO7ytJh0Kof/oMVkmfH4t1eeNvoWc8q9csNnBhWNhsJgWvyb7thll4z
 RYdMY8Evhx8R4zx08+iwpfD9NPKWYeD50Qml67iG19EssLsdwUs4Q+pS9QxYoiQ9FpnjlunCNYS
 y/kyXrHdd9wTyXPuQPbHUC+1WNfSGR1mkhhwlQDZcZ1ddiWfgYWi7+Gp0cNbpg9BVh4U9Lzn/Iy
 X+IOdt40Tsbyn0g9tCv0sGTKxmS7+2SM10Ezd4Xti54p6UIk7szkACHAOwU/cxZCcmj2NOJPsy4
 NwHJHMa0mG7vAfGbIMA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-25_04,2026-11-23_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 malwarescore=0 bulkscore=0 clxscore=1015 phishscore=0
 adultscore=0 suspectscore=0 lowpriorityscore=0 spamscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611250061

On Wed, Nov 18, 2026 at 8:46=E2=80=AFPM Geert Uytterhoeven
<geert+renesas@glider.be> wrote:
>
> The for-loop in genpd_get_from_provider() seems to imply that one can
> have multiple providers for the same node: in case a provider's callback
> fails to map a specifier to a PM domain, the loop continues looking for
> another matching provider.
>
> While technically one can register multiple providers for the same
> device node, one can never safely remove one of them:
> of_genpd_del_provider() just considers the device node, and removes the
> first matching provider.
>
> Use the same logic in genpd_get_from_provider() to avoid confusion.
>
> Reported-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> Link: https://lore.kernel.org/20261019160545.GC3705@killaraus.ideasonboar=
d.com
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>

Applied for next, thanks!

Kind regards
Uffe


> ---
> v5:
>   - New.
> ---
>  drivers/pmdomain/core.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/pmdomain/core.c b/drivers/pmdomain/core.c
> index 964e44c2f78f1d55..ee8075e90852e738 100644
> --- a/drivers/pmdomain/core.c
> +++ b/drivers/pmdomain/core.c
> @@ -3031,10 +3031,10 @@ static struct generic_pm_domain *genpd_get_from_p=
rovider(
>
>         /* Check if we have such a provider in our array */
>         list_for_each_entry(provider, &of_genpd_providers, link) {
> -               if (provider->node =3D=3D genpdspec->np)
> +               if (provider->node =3D=3D genpdspec->np) {
>                         genpd =3D provider->xlate(genpdspec, provider->da=
ta);
> -               if (!IS_ERR(genpd))
>                         break;
> +               }
>         }
>
>         mutex_unlock(&of_genpd_mutex);
> --
> 2.43.0
>
