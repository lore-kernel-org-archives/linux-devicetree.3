Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 623FA3EFFCE
	for <devicetree@vger.kernel.org>; Mon, 27 Jul 2026 10:01:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=205.220.168.131
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785146469; cv=pass; b=bOQl3N1HD6FmJwMKSIHjWulsDbhYP+cvCIU6Q1WZoMnBmLdSN5MnCuULtEJDkw3LkBsL+NA7fQPEW80djn8K7U/NtAUEGNalXPs5NdQ+KFfEvOfqP8vfq/qu/SniEhelw2TSd3NlopoNi8Sw/zEQWIounndTNXJ0JxP6K5I0c9M=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785146469; c=relaxed/simple;
	bh=PeyKN0baBhutHLbY8tpY5GwoAhsXPzOWCm1h3cCqBJo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=HyZg2e1tjG91OOAcPqFYncr2cn9NwS08cwhhOtKRNVdRHNhh1qDai8NiSirobWrnfQvrsh7+xH5CmQRMkEdEwta4DzPUQKnpynsfxzWtPdNWbrVfTNsd9IOj3p2vur5KzVA1LZDOTKQ/iXNQO6Q5Im75CD614wqnZ42QClBB+Ck=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=pR4g/VVD; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=cwNo1g9l; arc=pass smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="pR4g/VVD";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="cwNo1g9l"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66R9WtNv3243109
	for <devicetree@vger.kernel.org>; Mon, 27 Jul 2026 10:01:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	fpxga49hr34rpRcBFaAC1QHjhjtKMHjA32E0mhgUj/8=; b=pR4g/VVDUj1stCtg
	quKe4ihAM1gvEsgmlEWtE+21OkUdNfPYciwb+yeHh03cLS28HXTex7gEzog62RaL
	N2d+cDiCvfrdjXDv8RwdHJAPqnMTlDlAy0hkXz0A4ojGe/T2xLeCu/2mk7GLi0ZW
	UrFvVAjMy3d4gC2jrb7+l3RyUUQ7OWlxF76JT8b86VGb1eTfc3nLfUX9X43DLp38
	G3s+8zd4R4gvaQq4q7cW5lhV98s5ca06f27h24pcadY3WichadQZPEJz/PexHuYd
	L93y8Az+sWt+fkf/DiFr9bTxglVYH/hyXM8gz+lEINLIgpczhK8smEgferrZ3EUK
	vAU/MQ==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fp4nbr50r-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 27 Jul 2026 10:01:07 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-92e55721a8cso308696685a.1
        for <devicetree@vger.kernel.org>; Mon, 27 Jul 2026 03:01:07 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1785146466; cv=none;
        d=google.com; s=arc-20260327;
        b=Eo4OEwdR1Dp/6gIn3p9mnAMtEKnyiL2t6Q6nIC90yMBmgddvtVRNy96VI8q4ibPq2H
         leQR142d4by9Z4mxzO9wqY0wZ9PHAveqidi2h0kGswB7mHpIjDhb74CYOrs8YsYOaOqG
         TmaNI8UZ3dGsypINo14YMr4zSt69LEaxkLpZ/9RSPgIKVZ2u6PBCRl3hzpgLXHjKvaFX
         34r15FKKbHnSNo+7ZUf6h9Z+J7J0KBxb9rVmTu8pe2M55yYD1+xSjJRgsDQ9WhgReEUp
         y//mXKrV9TmGyt2BfTNnPUs8+3IYX+XelrovTT7PoyKIxQz3NCEAZXQMVDpmA9GhOgE/
         k5yg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=fpxga49hr34rpRcBFaAC1QHjhjtKMHjA32E0mhgUj/8=;
        fh=SXVYPTw5aio2FarbaQN/Z9K5HvMuRtcsa1bXHZKATDE=;
        b=ZGlAV04kCC6DKcnwmymFrR9GLmdGFY6OPtaD18oKLlMLR+GNIT1gWjItWVG4sE74XL
         4kvXxD5WZH4qoyfbU06E/vCTKEbmaZjrWo4/TiRsBtPaJVkHouqI9l3SGlVLBH4oR38v
         U3qc1TyPg0+oeYijWnm5sSBGdjTnVjkqLfWi5HzQlb25m7Ri3rVQDoKi5M38Uh4Y/4e9
         7Tp7PAzI9Y/c1eomFUJTzAryBdYMJQUmw/KIWp/THVfxVD+iBBjIJ+Z9xeAphrc0YwXR
         3/MFnRh7YlZ2ct0ZIQtxaSIzmUZBP3Gp0fdyQ2hz92CLHJjF+eVPPNn/CDDOL16CWKyp
         I6vA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785146466; x=1785751266; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=fpxga49hr34rpRcBFaAC1QHjhjtKMHjA32E0mhgUj/8=;
        b=cwNo1g9lAfk5jJXK5GVlbQQLjeWiCmTZYD759zdXTON+zAywP5wTT2OWzT0y4ZDWD4
         kUOWP1WQtSYRZOOeO8MBtNXZuC2DZT0kyVntZzH6LPytdltWpkOJ4L/RAr9ZalAdAcnd
         wFJCzlY1Kc46ItQFKMh7W0suQwJKjIhWFOow3hHi5SP9odsAxRcqmCJgQo9MDXFs90MT
         7lFKuapH93Y15lE7T9g9vqkqFiII4kG4p1LYlLhSPbaC35YdGnDo4LrFSGN+RQLq88LW
         RZS6HguUFkyCnUH8dd5/0klEBqYanDDjYowx0Fj3XtIW3H/hYVkbsa8U4qycOTiVzxIQ
         Ul8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785146466; x=1785751266;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=fpxga49hr34rpRcBFaAC1QHjhjtKMHjA32E0mhgUj/8=;
        b=Sy2PK1A+3qfu80Iwq68cZPzguL69zRK4fHFaQZrUwxNhs6Xsg2/Q+9FKOyWUIKzBuT
         pVbL+nJZGnfL+z8ECcJT/W/q/UIWsRqBM1OyvU8rNyLxwePAoXHez8SotkItWnv9D9/j
         bJ2XSgTxQ4ZKaLvo/1RG+oH8/z++aXOVXOQgrW8rXg+snF8oKmYzfKBBBcilXRheoZbW
         ndg03kmpBMtWDM/Gam26VrCwHuucYhnbU17fBg6hdR93MuIRZQrEDHH19szDBNoSlZP9
         X0/aOARgbzzkI8XTVNpu10Ubz1GLa7pvfzBUn+Hi8VHrCoQy+V7IjVp3vXugxAx9nYHE
         FsKw==
X-Forwarded-Encrypted: i=1; AHgh+RpHIKXEK1MsZxpvvv3ZRXv4AEsVI5VVxNFc3Tm2WIv2TQOnNtVyXNGBELnnki6bHb7308qJkkjwQqzM@vger.kernel.org
X-Gm-Message-State: AOJu0YzOGmM7n5kO4FdXTnpcKYhH3km+P5ntzZXO9mgTrnG4tYLe5uqa
	Q0oOskzauXJwvirddpafidlAw8t9kl2kJBjvi6FBB4wzQQWqFT3pJRw54N6cXHK15PtyMXVezxo
	lr4MrGPJ6YybrZ5fBov7Dv9hLQGF/nGlqH19U7bvMaGXkOX4wgBvL+P3IeZlqUSvCmJhtvG5AVh
	3MD0v1mfEDMw8Jd6EIBmY+EsDr23i4aKuwKfCllpY=
X-Gm-Gg: AR+sD12/C6jbf6cbSnWTywP2GhcLCYoOqjz2yYfrP7BCMOP3asPqtIXgJ8AJAz7PhdK
	bTUlDcaH49oTE6Gjq4WHHzO9OFQwWOUPOyUpcpi2fuxRXR+6ENbs1evrSxS+mHkfgl7r7SHMXAn
	toDZc58aFHrZueKCCoPVJdXh8/pYb508GCOw3fSkZrZp4JbLT/F5bXKe86fA==
X-Received: by 2002:a05:620a:2688:b0:92e:745c:6c5a with SMTP id af79cd13be357-932f948144amr15115585a.14.1785146466276;
        Mon, 27 Jul 2026 03:01:06 -0700 (PDT)
X-Received: by 2002:a05:620a:2688:b0:92e:745c:6c5a with SMTP id
 af79cd13be357-932f948144amr15109385a.14.1785146465706; Mon, 27 Jul 2026
 03:01:05 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260723020524.1886806-1-Zhipeng.wang_1@oss.nxp.com>
In-Reply-To: <20260723020524.1886806-1-Zhipeng.wang_1@oss.nxp.com>
From: Ulf Hansson <ulf.hansson@oss.qualcomm.com>
Date: Mon, 27 Jul 2026 12:00:55 +0200
X-Gm-Features: AUfX_myrKTD-P-po5naXNkkd8gbbZmT-1aLEtXL0NN10jCpUSfBDEv1NDisfyg0
Message-ID: <CAPx+jO956WAqXt-zbEyzU5btS7KsXn4fBemaj4r3qQNANNJCKA@mail.gmail.com>
Subject: Re: [PATCH v5 0/3] pmdomain: imx: build the SCU power domain driver
 as a module
To: Zhipeng.wang_1@oss.nxp.com
Cc: robh@kernel.org, saravanak@kernel.org, ulfh@kernel.org, Frank.Li@nxp.com,
        s.hauer@pengutronix.de, kernel@pengutronix.de, festevam@gmail.com,
        peng.fan@nxp.com, aisheng.dong@nxp.com, jindong.yue@nxp.com,
        xuegang.liu@nxp.com, devicetree@vger.kernel.org,
        linux-pm@vger.kernel.org, imx@lists.linux.dev,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-clk@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-ORIG-GUID: j4i9lq9ZBiHDTKv77u44yOCliKjk1Rcv
X-Authority-Analysis: v=2.4 cv=cJjQdFeN c=1 sm=1 tr=0 ts=6a672c63 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=_K5XuSEh1TEqbUxoQ0s3:22 a=8AirrxEcAAAA:8 a=73SNKA1z6Gcgn0qlyfgA:9
 a=QEXdDO2ut3YA:10 a=IoWCM6iH3mJn3m4BftBB:22 a=ST-jHhOKWsTCqRlWije3:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzI3MDA5NyBTYWx0ZWRfX2NjGpTyuwyHk
 EX88Digh48CgMSnBM6uLR9IF7wpiTt126Ocm9oamgBMYlq+t5/oGL6rg2avwXxPWM4VOto6iyHg
 vRx3brHCp/AB35OCYek8YwECJRQEBXI=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzI3MDA5NyBTYWx0ZWRfX2igIealVmHcl
 97DzVXk3RUCB7UVCSO4Bcn7p3ZgErwPlLVYnZQBWMHPo8IdmkyT7GyIF0Ts+2KyTvxl3Pjm52ah
 1aM9akJLikZFPHIwD6z6biH5aFGbpEQAF23/9O+1O3l1ffjscfPp560wm+KswT/sHQoHRrds1fS
 BZa5ZP/Eq2YMcWPxR0GI1uGgupm4UO8AcMZpijzjf3GvPTZsi+rB8ysgtXAtS7xaWPMl4lksFdQ
 GxSSB31VbniYWsOkWUd1Q42fvxZ82CQLM6Eyn6OOLdghTWujxLl+m95poFHXRkvAcyxxyWeswQw
 2+mnO5uXR1/vaJRg4hKFyFtAl0lVD69jkQa4bgD+Bsnj3wIzRMMFp0ZKN6I6zpt7sIHBF/eS5vh
 oUYC49GId25NILmtNrftJMZfgmHSjB3jVAbsHuurhzLkA3mwPcBuVu+4Ocw3s+ztsMKNjauaIIg
 N8Bfjs5B5Bs7JKhRyiw==
X-Proofpoint-GUID: j4i9lq9ZBiHDTKv77u44yOCliKjk1Rcv
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-27_02,2026-07-24_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 phishscore=0 spamscore=0 adultscore=0 suspectscore=0
 clxscore=1015 priorityscore=1501 lowpriorityscore=0 bulkscore=0
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607270097

On Thu, Jul 23, 2026 at 4:05=E2=80=AFAM <Zhipeng.wang_1@oss.nxp.com> wrote:
>
> From: Zhipeng Wang <zhipeng.wang_1@nxp.com>
>
> This series makes the i.MX SCU power domain driver buildable as a
> loadable module, which is required for Android devices using the
> Generic Kernel Image (GKI) where SoC-specific drivers must be modules.
>
> Patch 1 exports of_stdout (which the driver references to find the
> console's power domain) from the OF core with EXPORT_SYMBOL_GPL().
>
> Patch 2 converts CONFIG_IMX_SCU_PD from bool to tristate and adds
> MODULE_DEVICE_TABLE() for autoloading. subsys_initcall() is used so
> that when built-in the provider probes before its consumers (e.g. the
> SCU clock driver at device_initcall level). No module_exit() is
> provided since the provider cannot be safely removed at runtime.
>
> Patch 3 adds MODULE_SOFTDEP("pre: scu_pd") to the i.MX8QXP clock
> driver so that modprobe loads the power domain module first when both
> are built as modules.
>
> Because of the cross-subsystem dependency (patches touch drivers/of,
> drivers/pmdomain, and drivers/clk), I would suggest taking the whole
> series through one tree.
>
> Changes in v5:
> - Fix MODULE_SOFTDEP module name from imx_scu_pd to scu_pd. (Sashiko
>   bot)
> - Add Acked-by from Rob Herring for patch 1.
>
> Changes in v4:
> - Add patch 3: MODULE_SOFTDEP in clk-imx8qxp to guarantee module load
>   order when both drivers are modules. (Sashiko bot)
>
> Changes in v3:
> - Use subsys_initcall() instead of module_init() to fix probe ordering
>   between the power domain provider and the SCU clock consumer when
>   both are built-in. (Sashiko bot)
>
> Changes in v2:
> - Drop module_platform_driver() which provides module_exit() and could
>   lead to use-after-free on module unload. Use module_init() only, so
>   the module cannot be unloaded. (Sashiko bot)
>
> Zhipeng Wang (3):
>   of: export of_stdout symbol
>   pmdomain: imx: scu-pd: allow building as a module
>   clk: imx: imx8qxp: add soft dependency on SCU power domain driver
>
>  drivers/clk/imx/clk-imx8qxp.c | 1 +
>  drivers/of/base.c             | 1 +
>  drivers/pmdomain/imx/Kconfig  | 2 +-
>  drivers/pmdomain/imx/scu-pd.c | 8 +++++++-
>  4 files changed, 10 insertions(+), 2 deletions(-)
>
> --
> 2.34.1

The v5 series applied for next, thanks!

Kind regards
Uffe
