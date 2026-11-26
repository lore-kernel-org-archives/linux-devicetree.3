Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=205.220.180.131
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795694670;
	b=d2uhD8YRxOlqcSWdyXn9iK2+mNM+VQqgtxpwLetJcS0NqpBx3O/znn1SgDDLiBSo7wVh
	 9Ep8WDgjpJc8vUzwIqQgLcbBiv5GcETge6cOKO7EkCTevyZ5kzuHXjl0zBhRzDTZUriCn
	 r0Tn4sfmSZ7aWUkHL7qcSED1aJ/Wo8ZlZl/RlPCv7YCfawNX5oSEvd+Re4u2whdCB18va
	 0icLyhE0jJX7npRKeXtWMjuA2h6vY95+im8A6p03oTeqUs+L+gHzIRVB7c91tyVZvgbOk
	 dvbem0imMBXr7fT72j8gMYATPyGPHSQFUD8OCPfx8uwawzRs/4532X9Zmgb4zUZVv4g==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795694670;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:MIME-Version:
	 References:In-Reply-To:From:Date:X-Gm-Features:Message-ID:Subject:To:
	 Cc:Content-Type:Content-Transfer-Encoding:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-GUID:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-Spam-Info:X-Authority-Analysis:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=jC5fbmrjeahgJSQY/yuWAzz2qq3dYpFpTS3cMwzVOs8=;
	b=ft0FafXZiZLnJidtOkkr98Q2nf4EdL4Drvx1PAcppTIme6ISn/wP/AeNMVErXIk2g2/b
	 GkYTalJQtcDFPzcnN5HFcnxlStm8JhH8WQkUhVPuUNGRt3sqcos7KtbhrXNmy6Cnu37fk
	 OSbsnI3iiewrzaM2zxhjA8C2nW+xOyNkQaGiXPA24iNO5+zIK5CI9SFWBCfU14gvS8qRd
	 YiRIAR/xcafzcBIak4JDPl9qieOc/xd/2eTPLC627aoP56kpY+biuuDghRfgxDF9wOxhV
	 md3Nad3W9i1rhh0fcuFVF7wwyD7WU5D/yVV33FEUOhG+9/3xJ1qgIYZhFfAftY4Pfkw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Nb75Bhnk;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=GaNd2MvI;
	arc=pass header.oldest-pass=0 smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 17708606A31C
	for <devicetree@vger.kernel.org>; Thu, 26 Nov 2026 12:04:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 17708606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Nb75Bhnk;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=GaNd2MvI
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AQBVThZ3278041
	for <devicetree@vger.kernel.org>; Thu, 26 Nov 2026 12:04:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	jC5fbmrjeahgJSQY/yuWAzz2qq3dYpFpTS3cMwzVOs8=; b=Nb75BhnkD+24lshd
	TN3D1/aSnF7vHIpkHWwHrM1kKC6YkQu6oDHCxehUDM21hbKbjJyKXraJpSLvlXam
	gnP48d6B48IUH8DyGbf9NtPmsHJPfx1s+Xvo5g4i/6YSn7IKpv0RiuFj1u1B9HCJ
	nrsS14m61D4eNFRt/O9DQMyuIHBNkyiU42V3jRVb+6Xe3JU1uiB2RiZqWOkGZ5t3
	rUyoTCQJYk9dWVXIeVjI5rchYL8/hXkY9Ti0nM78XMS0H/uKHppIWpJQhPXEUnny
	GUDcDdJMJSAEmIBUWh+5vuzpXWLnzh/Y4mOkufX6bT7G9X80VxDZf+8DGg53esvd
	P3Nrtg==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j6h7g8ub9-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Thu, 26 Nov 2026 12:04:28 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-3b4092b645aso5910106a91.2
        for <devicetree@vger.kernel.org>; Thu, 26 Nov 2026 04:04:28 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795694668; cv=none;
        d=google.com; s=arc-20260327;
        b=CklAkhLVl+K4f1G1OlyAkyswuNhwPsRCwnhx+zBTjyxeSsOL5Ea1rRYQbWpmvuSWEX
         uRgWW67Ixknpjengc0a7q9LtTF5gjGT9UFXQqLIEPEGhZ2dmhs/ENnCoGtv6uEyWQiiW
         PLmFtezB7mpNVVgAEVS/PmlllB9PNFKi+smbsRUe1Ga4QdUYji2nJml7kfeDkandpJ2V
         kyh828GvBD8n9YSx30EoMXFQGmboN1jKErNPdzo1K1ZpCF99yIjn7QzIo033w6fy4icI
         duUmMAvVTc/eZwO8453KT2BVQCqm+mciduiBrQczSUokqGNkwrNCX+ftKkvZQjYuAZ4I
         3VSQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=jC5fbmrjeahgJSQY/yuWAzz2qq3dYpFpTS3cMwzVOs8=;
        fh=TVmU/Fql3WgeW/9B90DdDIvVkGkHZ4ltNaM1ItdDdSo=;
        b=qoEK3nZU3Qx0Ga5jiQJeeX1vD4ZoWrhICzSl95f9ejf6Uva8dVqnGvo6D3KQrIGGYD
         GYbdJ6pKLoGnFUS6oIwmJuYqZ7jSVsWgf2/JJP7uqh7Tr/o5zniOaP/+KGpd1cOPxMj8
         cHowApLsOrn1jP4n7Chzx4LoSGm96OdJCVCrZqmwuoL4YcZCo1e7MbEXhSjZhJDvztKP
         j2pz82/X8fJr96lF0NK7BRjOq7uv6oJ9gkrCbQ0EA8ndsPafCtwZEgabFgoUYCoMwJLD
         NtSc6wkmfw/jlIOqMXA0whg5z90yUPM67M15xtZ66vDTFPI73iq6Gwa2B7wQUW+8gNQB
         Xa3w==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795694668; x=1796299468; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=jC5fbmrjeahgJSQY/yuWAzz2qq3dYpFpTS3cMwzVOs8=;
        b=GaNd2MvIaPG7AmQun4uTXBxkBy7LI3XHtmyJf35B+ZeG4OAxV+v9ESvUk9sTSkOWt2
         Ira1/WbIXEdvbOBd5LCw25+9DONxfO9Uq6aY64SuG73hVCvQa98fOqSUMoBV7nST9HP3
         TDwSsvgPcjvrlySj/YBKZvvIqwuINcR2RVgFt+ItJI3VJvSYh0qftrP4WkH3dgbyklOf
         srUl/1GpVJMbRJxxBf8lsDeYmC7l1JmuXbyUP43uHvZqazM4BDpifA3Hdt9UD3+j81Dd
         8pbAa6QFX8yXukXmFBvAQTbBZ9Bj4bY7+UsG1Go9GXJKFy1Pf5wB+HlQISIau3fIj/FZ
         MFPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795694668; x=1796299468;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=jC5fbmrjeahgJSQY/yuWAzz2qq3dYpFpTS3cMwzVOs8=;
        b=V51l0+JL6VcyLlnJbuvUUDaNbWLJVW9X/rCdQCQcz9Wzrew5xmbGIfm5h+mIaFHHva
         8ynb156kVAiPShTZRMtaAWvi9R4Hdw8r5PDTKRrstFKHNvFln70uJPeACooc7hpHnoz9
         ZuxDywts3W7C5eiP8k8sfM8HLuVoaDYsCqBF96Tv2uByTSRWPmFxP6CVdgh3IpuhQnKN
         29TQ+YJ0Ap2vX3fpB1NVpsIgyQ2vnpGzdrHh/xbxgQuA2eEPQ66JM5tXlW0t8CnjF6Hv
         UZc8/vPPwZ89h7AfOWGVzGzJav3aRDMBjki1bLnVYfz/meHRHGTegz2riHXYJCVUCmQl
         pdng==
X-Forwarded-Encrypted: i=1; AL+hErGIcsyR1b1R+oPbwqaAMVSLf4wnS8k2DIaTU9tpUP1D8rPK1k3mpfBhFLQT/oOBdxHVmY0gUbJc6Ct/@vger.kernel.org
X-Gm-Message-State: APuU4Z9v6sIE+eZgcih9yzlJ0lMuwuuK3L+fW2mjfi57d78OE8y/WjEC
	uVBHbffAKrM5QmwS7lwo8r70kRnvPuYBPNBbt3CqCbH0dlqVkErexReP/b9mbK0uISwOx+wTtD0
	orpNoro1V+INSECiR1wV1vKf8I7G/wMz3Ded1TnVtf2ShWWHOpqEwnS1mJcZ1ZmJd8cKcDMf0SX
	01k5TCVFRNJJ9ir0+/f3xgOGXcEH7e7ufnf3yrXTY=
X-Gm-Gg: AZFdTZcyjdkAk7tjlpFImmKqcvTF5guvt8I2zrETluwSXNiZ8eRm/H0IWvyMJp5UuVc
	l2oL4pRPUH4DqW0B0CfvRL2aEJAoTEWrFROU5uwc/tnzM3p3Esw3o9dh+jApP7kvNsGLcH9hrp5
	4sxJKq9RhNMNWFtofbuaSnlk9aY3lb8kKtxo9U6oxegPxXmPlyr03yQIecog==
X-Received: by 2002:a17:90b:2f8f:b0:3b0:9bfa:72b1 with SMTP id 98e67ed59e1d1-3b41c942d13mr20572873a91.49.1795694667831;
        Thu, 26 Nov 2026 04:04:27 -0800 (PST)
X-Received: by 2002:a17:90b:2f8f:b0:3b0:9bfa:72b1 with SMTP id
 98e67ed59e1d1-3b41c942d13mr20572850a91.49.1795694667362; Thu, 26 Nov 2026
 04:04:27 -0800 (PST)
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261123-meson-drm-create-hdmitx-phy-v4-0-3fb94f5534ca@aliel.fr> <20261123-meson-drm-create-hdmitx-phy-v4-6-3fb94f5534ca@aliel.fr>
In-Reply-To: <20261123-meson-drm-create-hdmitx-phy-v4-6-3fb94f5534ca@aliel.fr>
From: Ulf Hansson <ulf.hansson@oss.qualcomm.com>
Date: Thu, 26 Nov 2026 13:04:16 +0100
X-Gm-Features: Aa3M54pnB9NhEO6Ylxt6lEzs1c2Wp_th_l5IvL7KXYy5McWsZMXy_VANhdE7X6Q
Message-ID: <CAPx+jO_K+sEwm4CCBUdYz0FzJuYNhKizy4VDpQ=Ystm1aPxbZg@mail.gmail.com>
Subject: Re: [PATCH v4 06/11] pmdomain: amlogic: meson-ee-pwrc: power up
 memories for boot-enabled domains
To: linux-kernel-dev@aliel.fr
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Kevin Hilman <khilman@baylibre.com>,
        Jerome Brunet <jbrunet@baylibre.com>,
        Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
        Vinod Koul <vkoul@kernel.org>, Manivannan Sadhasivam <mani@kernel.org>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Ulf Hansson <ulfh@kernel.org>, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-phy@lists.infradead.org, dri-devel@lists.freedesktop.org,
        linux-pm@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-ORIG-GUID: 058YWSCW7xYgre5HxrGS508FOvHGGMwd
X-Proofpoint-GUID: 058YWSCW7xYgre5HxrGS508FOvHGGMwd
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI2MDA0NiBTYWx0ZWRfX3/y4P7HSp1u0
 T8373F8yzg1bE7LcL63pj4p48yltc5N9kTbDvRfRfmVgmoU7V9c2Fe8fRSY/4hu9toaIiH0setL
 KbJubV1VpTImabmkQy0IDMSOvfPH8wRGCVHxA2/utzYzsrqHOA1cXWK/yfB6gav8jeG4HUqa+LV
 zkd++5vTbFH9qGUy9CjjICmwWjF8ANupb5OpL+uOLvAsSVFJTzpjzt2Q4yXHpWzRKQzaiJwsu9F
 pbXc7LFl3tVdjds53mLoBH/ttqULFkUvEYq9DYPTffkkOLzJ2E6ODQ/j80z80aAW4hDWxex6ZW+
 EZdxRmyhuidk6K1ODBWQIVIdEcSD0Dkn8HrkLd3f0PEvGBdIyf867oxEVPEnbWnyoBgIPy+AbCi
 nnJNwOjp3gkkyGB/+23V1CP3A25E3lrUttsozxcRKevEjhRnjD24s3LGWg/6nUgaztj3JNdRoBT
 Gh4EujUndKwLKkSnRUg==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI2MDA0NiBTYWx0ZWRfX/pIzcRKQtiQF
 4wLQpj2tUEab64/be9ahRTCLUFfm4C/MbVfwGjHpm46Ir8V9BzunHX/aWUT/AUBl1HR5vQyI1XD
 VdDf5DtOUaGAaI8GL7lakKOQ2HlMjD8=
X-Authority-Analysis: v=2.4 cv=L4GI0OT8 c=1 sm=1 tr=0 ts=6b08204c cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=gowsoOTTUOVcmtlkKump:22 a=VwQbUJbxAAAA:8 a=zH7TnIvAWWhA1n-d4cAA:9
 a=QEXdDO2ut3YA:10 a=rl5im9kqc5Lf4LNbBjHf:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-26_03,2026-11-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 bulkscore=0 suspectscore=0 malwarescore=0 lowpriorityscore=0
 clxscore=1015 spamscore=0 impostorscore=0 phishscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611260046

On Mon, Nov 23, 2026 at 8:38=E2=80=AFPM Ronald Claveau via B4 Relay
<devnull+linux-kernel-dev.aliel.fr@kernel.org> wrote:
>
> From: Ronald Claveau <linux-kernel-dev@aliel.fr>
>
> When a power domain is found already powered on at probe time (typically
> the VPU domain left enabled by the bootloader), the driver registers the
> genpd in the ON state with GENPD_FLAG_ALWAYS_ON and never calls
> meson_ee_pwrc_on(). As a result, the memory power-down bits of the domain
> are not touched.
>
> pwrc_ee_is_powered_off() only checks the top-level sleep bit, so a
> bootloader that enabled the VPU without waking every memory block
> leaves those memories powered down, and nothing in the genpd framework
> will wake them since pm_runtime_resume_and_get() is a no-op for an
> always-on domain.
>
> This is a preparatory change: a following patch drops the explicit
> HHI_MEM_PD_REG0 write from the meson_dw_hdmi driver, which relies on the
> power domain to power the HDMITX memory.

A question, is the target to drop the GENPD_FLAG_ALWAYS_ON bit for
these PM domains, once the consumer drivers have received proper
support for runtime PM?

In any case, this looks good to me! Do you want me to apply this via
my pmdomain tree?

Kind regards
Uffe

>
> Signed-off-by: Ronald Claveau <linux-kernel-dev@aliel.fr>
> ---
>  drivers/pmdomain/amlogic/meson-ee-pwrc.c | 19 ++++++++++++++-----
>  1 file changed, 14 insertions(+), 5 deletions(-)
>
> diff --git a/drivers/pmdomain/amlogic/meson-ee-pwrc.c b/drivers/pmdomain/=
amlogic/meson-ee-pwrc.c
> index 338f70d77bf0..b3ae5cd7bea8 100644
> --- a/drivers/pmdomain/amlogic/meson-ee-pwrc.c
> +++ b/drivers/pmdomain/amlogic/meson-ee-pwrc.c
> @@ -392,11 +392,21 @@ static int meson_ee_pwrc_off(struct generic_pm_doma=
in *domain)
>         return 0;
>  }
>
> +static void meson_ee_pwrc_mem_power_up(struct meson_ee_pwrc_domain *dom)
> +{
> +       int i;
> +
> +       for (i =3D 0; i < dom->desc.mem_pd_count; i++)
> +               regmap_update_bits(dom->pwrc->regmap_hhi,
> +                                  dom->desc.mem_pd[i].reg,
> +                                  dom->desc.mem_pd[i].mask, 0);
> +}
> +
>  static int meson_ee_pwrc_on(struct generic_pm_domain *domain)
>  {
>         struct meson_ee_pwrc_domain *pwrc_domain =3D
>                 container_of(domain, struct meson_ee_pwrc_domain, base);
> -       int i, ret;
> +       int ret;
>
>         if (pwrc_domain->desc.top_pd)
>                 regmap_update_bits(pwrc_domain->pwrc->regmap_ao,
> @@ -404,10 +414,7 @@ static int meson_ee_pwrc_on(struct generic_pm_domain=
 *domain)
>                                    pwrc_domain->desc.top_pd->sleep_mask, =
0);
>         udelay(20);
>
> -       for (i =3D 0 ; i < pwrc_domain->desc.mem_pd_count ; ++i)
> -               regmap_update_bits(pwrc_domain->pwrc->regmap_hhi,
> -                                  pwrc_domain->desc.mem_pd[i].reg,
> -                                  pwrc_domain->desc.mem_pd[i].mask, 0);
> +       meson_ee_pwrc_mem_power_up(pwrc_domain);
>
>         udelay(20);
>
> @@ -478,6 +485,8 @@ static int meson_ee_pwrc_init_domain(struct platform_=
device *pdev,
>           * prepare/enable counters won't be in sync.
>           */
>         if (dom->num_clks && dom->desc.is_powered_off && !dom->desc.is_po=
wered_off(dom)) {
> +               meson_ee_pwrc_mem_power_up(dom);
> +
>                 ret =3D clk_bulk_prepare_enable(dom->num_clks, dom->clks)=
;
>                 if (ret)
>                         return ret;
>
> --
> 2.56.1
>
>
