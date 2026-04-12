Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E6EF92BE7CD
	for <devicetree@vger.kernel.org>; Sun, 12 Apr 2026 17:57:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=205.220.180.131
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776016632; cv=pass; b=C2Jip/rrAWsxJ/ErfCXGHIIfnUjErvf3+dqQp+/wdqWSB3PJuD7d44LMcZE/Mt/OOflml2vs7Vvd1jKS0+MhPc/ixAHTfoF/T3enzZyJx80tDB4s1Mx/YeSH8Q393O+fbaeG7M+sdrbFy7ITibHX7q7dI3w7hVnuZDj5240GFIs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776016632; c=relaxed/simple;
	bh=HOLZOlV+M7mqQWApb4MkDtQJgVZ7IXsO9qDA1D6A5Us=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=BN+gM14W4zt4mED7fNMO94JgSHpApsMxiayWvv/jcL0SeZ2hYcdDwg2c3S62f/VB+GI6cEBI8+dIUd/RkiS8eTFM0p5ceTCwnRiwDGO0V1MiCjZiXXRnBeDYBIgIGnIRtfduHuG8Sio22M2c3WauJ1v4xrsj6Zp/O42Dq04H5ZA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=OP4YViH4; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Qaxo8b7L; arc=pass smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="OP4YViH4";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Qaxo8b7L"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63CE5SZU1122217
	for <devicetree@vger.kernel.org>; Sun, 12 Apr 2026 17:57:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	thQtqmVfOFcBFGUwZg+zw5IjO7y+NzSjPPe7a716jaw=; b=OP4YViH4gAd2pwHt
	tCOBnwBeu4z5tWAGGf5hAjQhsDSlroquvq4gEIxfEbAa4AnikdfrjQWjeLITouHc
	HiR1zhvIhsXpvEAqxgPANua/Ws8rZzmSJD6zpX3h6wm6uLOCPlIKxDyB8jv7Ey8S
	LQLB9VsgZmJFrXd61XneBjuiAPmECCkuOtgWXsIuWpmybpiaWbLhS925KeFP6YFO
	AlsmhCSMC1Xz6ZyfXgedrg8nbunSYnNM1kMlRGWuvKU7zwpzKJfTtm8/mTHdV9I/
	eZEcDezlQMIw/xEv4ofenUsjDerIFBIB9wNOYNZ+qSrVYJ6aya1LwFNTpFek/5wY
	/woqLA==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dff0jtqph-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Sun, 12 Apr 2026 17:57:08 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-35d92f8408cso4159413a91.3
        for <devicetree@vger.kernel.org>; Sun, 12 Apr 2026 10:57:08 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1776016628; cv=none;
        d=google.com; s=arc-20240605;
        b=cMal10vEJ9GhtsBDgeQcQUGXFtpVFqwHaGVlWtbVMM0ZI/+YEEAnt7+MFZt1CSXOTb
         UN/1eHbHDfxC8H0dnLjI5+fFCbFpNn/y7cKpIAhJY8ZaBNNpY7M1tKRKSIjM0l6GLAX2
         6r8qp6ijXnIrsD51vbtXp8eeMeevGM0vXoWI1gvhZ2amyo4kzykEE5QZNolVtGRq5lBR
         0LRXmj9+86IQX0FKO/jC+KwJq7UxSoADqy/JkXOUn0WXSrCbOYxpxX52T3ywspwVq4Lh
         4vefhNRpFMw7WjzyiowhekVvTJZYNB4zUb4tBm7I2fZVFl4+GlW32QdB3MpmWgIh1cHl
         AOvA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=thQtqmVfOFcBFGUwZg+zw5IjO7y+NzSjPPe7a716jaw=;
        fh=3m89ugqz3JwGx8ibCj4FtolIDwDIv5y7P+9IFoEb4s0=;
        b=RHyTArjyT00WfDHjiAHD+Ru/aWXyMwSDP4XkXqeLNg+b+Dkz5HkjvCMes38U8sVSVt
         e2/6II1NN8P9x1aWRpHOvr22HTks834Fm/J7lZUhAQ+djdutdrTF3b+EuPVK2pDV3w4N
         P/YYUB+yfGmkCjrly9qB/XFzLgQPEunEOHGdLRhil7LztrM5HSPMvnzA09vBpBvskyYX
         5E8UMQfttY9IF9VZzxpxVf32TI9p2t6lHHBXZ/dtkSTGX5WDISY6sAuhDswCaZvCax8q
         TIBdPZmJRAgz+ALO8zFAhGPARAnO6ht0hgoB9JKlt8Rt46RpDXnO+q5oQIpWn1vs+wyu
         PpNQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1776016628; x=1776621428; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=thQtqmVfOFcBFGUwZg+zw5IjO7y+NzSjPPe7a716jaw=;
        b=Qaxo8b7LNAE595vvWVzEqfBL1vW+FdQFmpVYEBhSzuxb7RD/aSgNAwf8FFX2ZfGcO8
         gyjCMxlJVzLftPV7JElexruwUKxCwXMJI1ZudQtfraSpw+ghFhW1f+3IdpkcQIMb3YXv
         WuCDNMf3licJpVcdyCO36Q6UVWr4Z+r/Kdjl7cuFT5Q3meabZTSgKcz/gbWBoPh9PvSw
         M/nCiA7raJ7LZOajcwBGXvM40eAuIy7YXW6BPRi+/JKzdWMWJMGSRdLJ+BuquJcm5Wh5
         5Fbv1lmG173QehD4ov8wU9duNiyBqZkKFECLT8uZEky4Y7BgaqQczbaIz+AuK9Li32EM
         0RFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776016628; x=1776621428;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=thQtqmVfOFcBFGUwZg+zw5IjO7y+NzSjPPe7a716jaw=;
        b=kwWw6BMcX0a00fBcMCx7Rx/deyJFqDiSvPsLJvRk4vUyawYlADwbo6eB64et3UqVuW
         CnfsW0aHD8mYu3fC2MpMj67HAA7jd4HYHP/sDxWfin+eNrd2S3/zHbb+xiM4ng/yLPFL
         pZMZ3m0K+udtOCZUu4ybH27T8DbLR0ekiug6SSrbtt5mbJEFsNp4YuvGIwHhe5fDHtUk
         aTVu63RehuUXCAO26IyeRLk2I2TGcTK6o5panWDTP1ckYQ3d8G9QRd2akMzcGRq0gd7c
         iDcBqUZgCkvE6S3pK8x6AqVxQP2dTb4uVqqqLlT3gyqiTcqmBbe8bSKE3M9vWPfbGYjd
         92Yg==
X-Forwarded-Encrypted: i=1; AFNElJ//1WSMiC0yls6Hmf1CSAEaLHmCJrTH2zusWvHsWGldQ30UBbfeuJIvdCUu5A2B+mPfONF1z0/npQFt@vger.kernel.org
X-Gm-Message-State: AOJu0Yy0t5FT4z/VINThrxA7jriKxo56Io6cHbDL4CTMbD4Zu1yxvQZv
	FUfILDfDQxGVTVK/1xOgzj+wewDSAfdz84PSkZPkYHzKRk7gEoxqnaDG6dXDtW06DTRxTRJttyJ
	czpZLioKBKEFDQPJ9YPVOheNNI9CoXmr8WLTt3/AAZDqhzLckAb2TDtYdpqOQC6vffPouLffpZ9
	v/NSifsYCpNJ4oJu1NrKsY1zyH3zdobcanwFWGANM=
X-Gm-Gg: AeBDiess9Tpnjdfs23bgzowZLgeQYqXKkKkZUuSgSwzARQsSPvyPCZDSCZZhhINJQd/
	zWeeXyKoOYwGwEcpSrB7Spa4ORTC2259FTNinqbeg1bmM7PD3P3o6+pg5y5Ta7n8ZmM7SkBYKNP
	60ApPzYGPhiBMbDdrH3ti1Y/bUlEj7Hn0cYzfQQRc1SWkSliDBpyJjRhOopJ4g01top+1KoE3AS
	OejMpE=
X-Received: by 2002:a17:90b:3c48:b0:35f:b9ea:8fa5 with SMTP id 98e67ed59e1d1-35fb9ea918cmr89853a91.20.1776016627732;
        Sun, 12 Apr 2026 10:57:07 -0700 (PDT)
X-Received: by 2002:a17:90b:3c48:b0:35f:b9ea:8fa5 with SMTP id
 98e67ed59e1d1-35fb9ea918cmr89814a91.20.1776016627186; Sun, 12 Apr 2026
 10:57:07 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260401-waveshare-dsi-touch-v1-0-5e9119b5a014@oss.qualcomm.com>
 <20260401-waveshare-dsi-touch-v1-14-5e9119b5a014@oss.qualcomm.com>
 <CAD++jL=jUd4sQ1bhwcBRYpFFApP6vdJw2BoQwxoWShUKdEb9oA@mail.gmail.com>
 <z3obsnbmdvvlzs3cxm57osbax4ivg2zq2zk6xgp37n4hni7y6i@smwn362nhn6a> <CAD++jLnXJKKv5ghRnCcMTU9g984seJAMHyL6VWWV0Bv+dv01wg@mail.gmail.com>
In-Reply-To: <CAD++jLnXJKKv5ghRnCcMTU9g984seJAMHyL6VWWV0Bv+dv01wg@mail.gmail.com>
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Sun, 12 Apr 2026 20:56:56 +0300
X-Gm-Features: AQROBzBYY7vv1cLFhlrg6piWW1-Z80EzCE2Hx7Xxi4DegOE8nD2ShaZfoDVqJb0
Message-ID: <CAO9ioeUAqG5uPs97ZAgzEfQVTW6OZWsCpAfxmDP4YUhjYt8E1A@mail.gmail.com>
Subject: Re: [PATCH 14/19] drm/panel: jadard-jd9365da-h3: support Waveshare
 DSI panels
To: Linus Walleij <linusw@kernel.org>
Cc: Neil Armstrong <neil.armstrong@linaro.org>,
        Jessica Zhang <jesszhan0024@gmail.com>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Cong Yang <yangcong5@huaqin.corp-partner.google.com>,
        Ondrej Jirman <megi@xff.cz>,
        Javier Martinez Canillas <javierm@redhat.com>,
        Jagan Teki <jagan@edgeble.ai>, Liam Girdwood <lgirdwood@gmail.com>,
        Mark Brown <broonie@kernel.org>, Bartosz Golaszewski <brgl@kernel.org>,
        dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDEyMDE3NiBTYWx0ZWRfX91G1irQTpAEq
 7slG7aqq/XnfSXckBs6U5g9pgek3ogBlghMJVtxYaVS8w7BmKTzk8IqjKajVmWThZ6bdHzVUq0z
 ZkDFk/GlXgspWwPU88V6tdfEBG9gR4yKKbPNFYfLmnhdjWTPJhutId3Ro26g4bT94Fr3qZ1We/J
 F1j64lNAXUNBEFpie8lERLGMkKDhrYQ9xsa0mDMZvRq5/1t4DUlc2j/LD6TNx8aCTn+G1dk1JFc
 nI59HUGLMiD7awW3m0oOiLwPwPlkMX+FjuuwGYUm7hskcnL3OFSZ1M52Qc7CTWCU3mN0CcAOi2c
 GigQBkGrK8oQ4+GT+YKFguEgb0WcngqOmeFNNHRFu0+jLYWi5pdfcyHNAwTGsBDcnfoDf1g8J3x
 Vuy2+qCnxZgaqExAJAsMgACVMOiJoTwWn+sh/veCyl3M8KebDm/R0V9vClX4hOnZ2Lt/SQ2bYC/
 LVL4ItUSZYebvd3Feow==
X-Proofpoint-ORIG-GUID: tiVmYNQmHRb6rJ2cJBX7Fyj2eQfJhZ-C
X-Proofpoint-GUID: tiVmYNQmHRb6rJ2cJBX7Fyj2eQfJhZ-C
X-Authority-Analysis: v=2.4 cv=d/LFDxjE c=1 sm=1 tr=0 ts=69dbdcf4 cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=_glEPmIy2e8OvE2BGh3C:22 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8
 a=xwq5OVEf12Z6bUwLnC4A:9 a=QEXdDO2ut3YA:10 a=mQ_c8vxmzFEMiUWkPHU9:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-12_04,2026-04-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 impostorscore=0 malwarescore=0 phishscore=0 priorityscore=1501
 bulkscore=0 suspectscore=0 adultscore=0 lowpriorityscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604010000 definitions=main-2604120176

On Thu, 9 Apr 2026 at 11:50, Linus Walleij <linusw@kernel.org> wrote:
>
> On Thu, Apr 9, 2026 at 2:49=E2=80=AFAM Dmitry Baryshkov
> <dmitry.baryshkov@oss.qualcomm.com> wrote:
>
> > > But there is also one more thing, this looks like a big "jam table"
> > > with just register+value tuples, so construct something like:
> > >
> > > struct jadard_jam_tbl_entry {
> > >         u8 reg;
> > >         u8 val;
> > > };
> > >
> > > static const struct jadard_jam_tbl_entry jd_3_4_c_init_jam[] =3D {
> > >         {0x00, 0x00}, {0x01, 0x41}, ...};
> > >
> > > (Ideas taken from drivers/net/dsa/realtek/rtl8366rb.c, take a look
> > > for code and all, you get the picture.)
> >
> > Few months ago the code was moved exactly in the opposite direction. We
> > added all _multi() functions and made shure that the code is as
> > efficient as the register tables. On the other hand, having it as a cod=
e
> > allows better control. E.g. handling 2/4 lane case would require extra
> > hacks to the register tables, while the code handles that without extra
> > hacks and without loosing effectiveness.
>
> OK then sorry for the fuzz!

No worries, it's fine to explain it (and also sorry for me not being
able to answer your other questions).

> Reviewed-by: Linus Walleij <linusw@kernel.org>


--=20
With best wishes
Dmitry
