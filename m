Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=205.220.168.131
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793888480;
	b=Pl411B4f/m33M8INaHi+KZwsjssYfgMW/bsZWiT9yrQwQAqcFDOXffM42lbkCj3iPCxJ
	 9PK43AX5QSN+wXTSWBE3F4pwqrpki2ml/lzC2+Ux0TzVCVs7CtvL9alcOgYMHkhSoHMxe
	 n1vAoPuhnJBxAewhLUjZKm23Daxb54ieEcWj6lNKvxB+n/M7ws9Y3bo5qgmXAzBDJGssH
	 mfOuh7HuCJJnpNEP/j+3mjx4RkkWdCdAWi4K0hf3ktQEnfqBOMs60CYjCP3llekCapEkB
	 3I/iZzC8SaZXxwyebvdfAHxk3qq9CihuvZOeOeQ/Lnzl4xjkQcwhuhU8Re0TFljdo9A==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793888480;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:MIME-Version:
	 References:In-Reply-To:From:Date:X-Gm-Features:Message-ID:Subject:To:
	 Cc:Content-Type:Content-Transfer-Encoding:X-Authority-Analysis:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Info:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=Tl99t14ijDAMsHd9YgT56P7aQig4N3vNDi//2gyq4XE=;
	b=3z0eFCMT+PfI26xOOqd9xmakKiDtH9OmTIA4353lvuSydTwYRnoixuWRVhitGYFNidDE
	 Oo0DLkpWuqoyjqMs1hAoWuaFIW5129LEBdkZOoPq7SNq5fzaiScMW2RHABUynk7ZUx40b
	 mn7auSOaTl9OFtg6fTS2k+keVcHoQLZZqxv/6ufnqIk13ks35hT/dlpV9//zd3YN8TOxU
	 mKXTRb4MbVItY7ufghPONvW8AxkgYQ2+59DikXerqJeDk5mHf0ydTF/n/p7ILMFCiL4b6
	 nJT+bl+fDgZT56BLNkn2UEeYwymhTxegHroP+7IQIcDw4jH/fbuKbJwsZjD92D3jxIw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b="Z2e/SkPu";
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=BcM7wiul;
	arc=pass header.oldest-pass=0 smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DE428606A334
	for <devicetree@vger.kernel.org>; Thu,  5 Nov 2026 14:21:19 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DE428606A334
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Z2e/SkPu;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=BcM7wiul
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A5B3LNh3193502
	for <devicetree@vger.kernel.org>; Thu, 5 Nov 2026 14:21:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Tl99t14ijDAMsHd9YgT56P7aQig4N3vNDi//2gyq4XE=; b=Z2e/SkPu7L2GS05A
	KEF0QoXLTF+tskem44qdFmcQ4m8hGZkbW8eEEabv+0D7LqbedqdXz3z8sBZUJyUh
	l0lO+fl9YewoW+UTadB2HXu0ccd+1uksr7cmPbQzkGSxPh03Cc0x3XAIlsYV3I5+
	Z1rnYjGeJ+O7KubJcNEYQo1TpQhOv+dXdaXi9uxR2lrXfZJxZKw2nt49lvwzJ7XF
	95U43Ak5fWDo385xXMLNTGpKUhJHcBvaZBvDjpc1nuU0Hn1Zb/TbEMldk2uSWI06
	tedjRzvDTuv2rAxCjaSCn2HAWbq+qXD15Djbq6x4ae07C9y0N7mlEv4jcXVAhbUF
	1+/RNw==
Received: from mail-oi1-f197.google.com (mail-oi1-f197.google.com [209.85.167.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hrrkdrucb-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Thu, 05 Nov 2026 14:21:19 +0000 (GMT)
Received: by mail-oi1-f197.google.com with SMTP id 5614622812f47-4ea2c058e67so2458014b6e.1
        for <devicetree@vger.kernel.org>; Thu, 05 Nov 2026 06:21:19 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1793888478; cv=none;
        d=google.com; s=arc-20260327;
        b=KSGnalOb9yNTXXqZJKZCXrRZqejinspXQ3z6en6LL7HXaQp5xu7m3MVhzsm1i4cQDT
         Iqtr4n9P9YY2Aqp9xMozS2NR3dkvdxVBA59SnN5U/OMsTvCSHUuUs3p01ZY4B406AqOa
         VcXjihiPS8P6Od5xeRFIEkzX9+YWce5qah8XuHcM5ryVYnccXECZC7DY8xnCkpAc9qrZ
         8Nw25OIc478dBsZiWwqkXvi2X6WaBXtnSFh3h8d9l7OSLW1cakcp5KatTybAv1NEWaH0
         HmJCmrBySmff05Q+PEO3JwZC+SL2YjTs9PLC3Vca1HKKWQKseFEyI71oO1sBULARsltm
         jh3g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=Tl99t14ijDAMsHd9YgT56P7aQig4N3vNDi//2gyq4XE=;
        fh=5hXZBQyURP6GyAjRRlJcQhEjJp2PrZLLfffqtpxRzg8=;
        b=q4Ncx9UTrH96KZXeHV5WUsjYUq46QBHXBtU5SMVGbXEMZUhcPqqhG4F+TVm9I1QE78
         wRl5tbvyZDpuW3U8uhAsaACt/mgPQASoUIim3DFogaMc1qZfZ4nK4sqTrRqIxjWmVZMv
         JdEfY5D6KivUJKRFhpcQ/HpM5QrsOTFrDVDs/osRDjElye+I63kj0MnWYquu2rOpfYFO
         sjhx7NlXAaHa0AcRsUCauvIWCKOOjC5ya6SGS4v/Qs6u9HaRDRhwRSoqEbPHegjOZQYL
         A4sfydIM+pQfzFyylCLUz1IsTX+J55orFdxsrw9jIvclFgNY5HV8Cn1ekHyMj4lKvUv/
         f2ug==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793888478; x=1794493278; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Tl99t14ijDAMsHd9YgT56P7aQig4N3vNDi//2gyq4XE=;
        b=BcM7wiulN2onL9Stej9lG3ShSmTXjIwEr4GbzZqK+vYk7ePAcOxfGc4tcXXz+EaW2S
         E0aduvygQ7VJ3apN7cyNCiMF9Ui+DSOqd72mrSXF420SSoVw7bem715gtN3uvwM+EZ9S
         0DzskTdefL5B+nrY0DrwLmYtWbqzVaK5IGkXswPhgGQ8OWMG0Xp5rHuLfrwvbNrw0Ic9
         zwwcbS94iSYB6Sis4lJxarOELI8mD6pLqQJskh/hJIh58tmG9K8qgH5zhTO+BD6vMioB
         Ei/D0RdPAE7YlRiO/4n92tFLdnTz9zlHLgqmzRB5Q1lwwN6R0nFmMUAkfVkVj1000iMT
         GZ9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793888478; x=1794493278;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Tl99t14ijDAMsHd9YgT56P7aQig4N3vNDi//2gyq4XE=;
        b=AJZ85jt+sUUKw9mIlOPz/UkNUOfd4JXV4U5gt4nB1xG5NkwSSsHBj1mCkYKvJtEDR2
         JkD3v3XqNzT/+xRiKHKywvZ5smZ9r17vZX6NeJeVJm5fuFBT1xDyJURvuw7pLxLYDY5u
         yxCkC1jdSiPakxxHoIK9r3UKuT8SY2LcNeSOo1dNaYTg9MwRCiFS2YP9H6C1azT2+Qv/
         tLkYocpvxLz68eAezEu/NWvx7RQaPKIWQI72AE5sj7cGbwoggvTlA10cT40mRALsT+cR
         7WADYyz+MtvIaQTXXqxHALmJSpBGJbqW9F4jp2sJSje+Yb3vcUj/r/U6q1YWqksFgpye
         da5A==
X-Forwarded-Encrypted: i=1; AKwUvBzypBxM2sxnnd6vJwfTRsC5bwj1jylYhjd7IlIH5LjgPICQHiY5Dm8c0L6wBWIu1zM7cT0CC2GlDfWv@vger.kernel.org
X-Gm-Message-State: APuU4Z9ye0kv9O3eFT0YXQ/bdhjvUunQW3hqZ9OKFkwcWg4s3Qv5CFPM
	M6cqy29OqKFWcfc1RzG27zIK0XH58DtlM/5qAD+O/Ez7/vZXCB56BwOWTAwxLcYipoth28BPhfl
	7WwvBBxKitLV2Ub8VLV4fP4ADgR/7u/P0OEnbSt2O/jHOnMTj2LaiJD8vf24L8cZxnJCRCyVyrp
	9TWh5IcI+SbPJRTgitdbv9GwCBu75qetXN0pirF6w=
X-Gm-Gg: AYBFou1p8Or+OdYBvWf3ubbqIhvPWloUx/5txpHUS2tJlu6zIKzCoAN00HhXTxoJLN/
	t7dx1+rTbEsy+fW15oPUWIx9eTa/yjrIxQxpwCDFT5y+OuYa0WsdocBni6giDf7HHdsagWKGu9s
	DR/W6ugAZEN5qFiZrq92IqUldWuThXSK3Rxjs36h1RrMc9tU5T9Wq4U7ABe9kmSVzzUmUgY7B/R
	BuWHqEaubKloEr1FSV8gV48cBAxTFW0UvBESZGCDw9jSRZWoMR2vypDPLVtXKwE/mxl1J5qM3M=
X-Received: by 2002:a05:6808:3195:b0:531:3bcd:41a with SMTP id 5614622812f47-5640de0fcb5mr14781263b6e.59.1793888478216;
        Thu, 05 Nov 2026 06:21:18 -0800 (PST)
X-Received: by 2002:a05:6808:3195:b0:531:3bcd:41a with SMTP id
 5614622812f47-5640de0fcb5mr14781235b6e.59.1793888477697; Thu, 05 Nov 2026
 06:21:17 -0800 (PST)
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261105-qcom-bam-dmux-vmid-ext-v5-0-5c7903385b4b@oss.qualcomm.com>
 <20261105-qcom-bam-dmux-vmid-ext-v5-2-5c7903385b4b@oss.qualcomm.com>
In-Reply-To: <20261105-qcom-bam-dmux-vmid-ext-v5-2-5c7903385b4b@oss.qualcomm.com>
From: Loic Poulain <loic.poulain@oss.qualcomm.com>
Date: Thu, 5 Nov 2026 15:21:05 +0100
X-Gm-Features: AclHuK9os0BZqz_kwvxPBwRIVDtXjvDQwiPkF7CAbQf8APB_kH8Yh96-royZqOI
Message-ID: <CAFEp6-3rt8yvTd-mMA6y5SqmzmF0zvrvO_Dc_w7G3QSv7oZWng@mail.gmail.com>
Subject: Re: [PATCH net-next v5 2/2] net: wwan: qcom_bam_dmux: Assign
 restricted DMA pool to remote processor
To: Vishnu Santhosh <vishnu.santhosh@oss.qualcomm.com>
Cc: Stephan Gerhold <stephan@gerhold.net>, Andrew Lunn <andrew+netdev@lunn.ch>,
        "David S. Miller" <davem@davemloft.net>,
        Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Sergey Ryazanov <ryazanov.s.a@gmail.com>,
        Johannes Berg <johannes@sipsolutions.net>,
        Eric Dumazet <edumazet@kernel.org>, linux-arm-msm@vger.kernel.org,
        netdev@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Deepak Kumar Singh <deepak.singh@oss.qualcomm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Authority-Analysis: v=2.4 cv=Xd4cX455 c=1 sm=1 tr=0 ts=6aec90df cx=c_pps
 a=WJcna6AvsNCxL/DJwPP1KA==:117 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=DJpcGTmdVt4CTyJn9g5Z:22 a=EUspDBNiAAAA:8 a=0Mq51QQeXCmcnqE6Af0A:9
 a=QEXdDO2ut3YA:10 a=_Y9Zt4tPzoBS9L09Snn2:22
X-Proofpoint-ORIG-GUID: 6z3_x875GFFAgCvnSQZHxnePDTDeBc2o
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTA1MDA1NyBTYWx0ZWRfX3+TcBMDWOV4R
 xDRRRGJ4fXAVBgXf0VxegzuAsQXYsHUeNYvUsRpgQrIp+AKGPZFz3twg1qd3Mj0F/mDDLx6QhLv
 jKjYWQGC5MnVhsHHPqD2PItoQJLGnWY=
X-Proofpoint-GUID: 6z3_x875GFFAgCvnSQZHxnePDTDeBc2o
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTA1MDA1NyBTYWx0ZWRfX2iF6rUCJAI0k
 LEdciIOfDR7BtqsErH5e65pHwGE5WnzwNjKTICBaOqieVm/Te0fmspNN6Xu37Z/3/TVdfP6yt9e
 PuA5rf4wqOChBOz3AZHOp84FKQQgtfe5DTI67xhkPtVR+VT31UW4S7DqhaVKgNivkb8anPGGKgP
 ZGZaCHVFUkhtNStOPOJMbLm0pb+WRfuu65vcAFVvIWU5a489izFHPLPUZYBmwAmi09b8/gh23JD
 HEHGcPSUIzXJD6h2zEQpfxy2KDT0NSDi50kIsf5nU0ULQcxFRY8GGowKO1U31hZHwJEZUl504b1
 UqomLFlgKKyLZVwgB1vU7r40YuT4C2oAKj+UL7zsIHNJI7H6+4LC1eWOOzxT3xvh1Fgz542etuD
 N9w/duw0JhOhWSyb+w+Es4y7T97vRl6MT1lckhIYqRnUAx7twpDH5yxN7rpIEYUoeRtT+Eu2DIG
 wqfGh7IZJ6Eg7Vtt+AQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-05_03,2026-11-04_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 impostorscore=0 malwarescore=0 phishscore=0 spamscore=0
 clxscore=1015 adultscore=0 lowpriorityscore=0 bulkscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610300000 definitions=main-2611050057

On Thu, Nov 5, 2026 at 11:42=E2=80=AFAM Vishnu Santhosh
<vishnu.santhosh@oss.qualcomm.com> wrote:
>
> Some Qualcomm SoCs, such as Shikra, run the modem in a separate security
> domain with restricted access to system memory. BAM-DMUX DMA mappings
> and BAM descriptor FIFOs must therefore be constrained to a designated
> memory region that can be shared with the modem. Accesses outside that
> region can trigger an XPU violation.
>
> When qcom,vmid is present, require a restricted DMA pool and assign the
> entire pool to both the local and remote execution environments before
> requesting the DMA channels.
>
> This ensures that BAM-DMUX mappings are within the assigned region. When
> the BAM DMA controller references the same pool, its descriptor FIFOs
> are covered by the assignment as well.
>
> Track the assigned execution environments explicitly and reclaim the
> pool for the local environment after DMA channels and mappings are
> released during remove or probe error cleanup. Skip the reclaim and
> leave the pool assigned if the remote side still holds its power vote,
> since it may still access the pool.
>
> Fail probing when restricted DMA pool support is unavailable, when the
> VMID property is malformed, when memory-region is missing, or when the
> restricted DMA pool is not attached to the device.
>
> Co-developed-by: Deepak Kumar Singh <deepak.singh@oss.qualcomm.com>
> Signed-off-by: Deepak Kumar Singh <deepak.singh@oss.qualcomm.com>
> Signed-off-by: Vishnu Santhosh <vishnu.santhosh@oss.qualcomm.com>
> ---
>  drivers/net/wwan/Kconfig         |   1 +
>  drivers/net/wwan/qcom_bam_dmux.c | 108 +++++++++++++++++++++++++++++++++=
+++++-
>  2 files changed, 107 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/net/wwan/Kconfig b/drivers/net/wwan/Kconfig
> index 958dbc7347fa84ee869439bf8b503037faab8bef..1b133c5623161526969814018=
7ca3141dfe48dbf 100644
> --- a/drivers/net/wwan/Kconfig
> +++ b/drivers/net/wwan/Kconfig
> @@ -65,6 +65,7 @@ config MHI_WWAN_MBIM
>  config QCOM_BAM_DMUX
>         tristate "Qualcomm BAM-DMUX WWAN network driver"
>         depends on (DMA_ENGINE && PM && QCOM_SMEM_STATE) || COMPILE_TEST
> +       select QCOM_SCM
>         help
>           The BAM Data Multiplexer provides access to the network data ch=
annels
>           of modems integrated into many older Qualcomm SoCs, e.g. Qualco=
mm
> diff --git a/drivers/net/wwan/qcom_bam_dmux.c b/drivers/net/wwan/qcom_bam=
_dmux.c
> index cc6ace8d64371eb8d00c638a39b234ee540b83c9..0e7ad62f8b4e059264e89837f=
296ee13c0c31c9b 100644
> --- a/drivers/net/wwan/qcom_bam_dmux.c
> +++ b/drivers/net/wwan/qcom_bam_dmux.c
> @@ -9,14 +9,17 @@
>  #include <linux/completion.h>
>  #include <linux/dma-mapping.h>
>  #include <linux/dmaengine.h>
> +#include <linux/firmware/qcom/qcom_scm.h>
>  #include <linux/if_arp.h>
>  #include <linux/interrupt.h>
>  #include <linux/module.h>
>  #include <linux/netdevice.h>
> +#include <linux/of_reserved_mem.h>
>  #include <linux/platform_device.h>
>  #include <linux/pm_runtime.h>
>  #include <linux/soc/qcom/smem_state.h>
>  #include <linux/spinlock.h>
> +#include <linux/swiotlb.h>
>  #include <linux/wait.h>
>  #include <linux/workqueue.h>
>  #include <net/pkt_sched.h>
> @@ -75,6 +78,9 @@ struct bam_dmux {
>         struct completion pc_ack_completion;
>
>         struct dma_chan *rx, *tx;
> +       phys_addr_t dma_pool_base;
> +       size_t dma_pool_size;
> +       u64 dma_pool_perms;
>         struct bam_dmux_skb_dma rx_skbs[BAM_DMUX_NUM_SKB];
>         struct bam_dmux_skb_dma tx_skbs[BAM_DMUX_NUM_SKB];
>         spinlock_t tx_lock; /* Protect tx_skbs, tx_next_skb */
> @@ -762,6 +768,90 @@ static int __maybe_unused bam_dmux_runtime_resume(st=
ruct device *dev)
>         return 0;
>  }
>
> +static int bam_dmux_assign_dma_pool(struct bam_dmux *dmux)
> +{
> +       struct device *dev =3D dmux->dev;
> +       struct device_node *rmem_np;
> +       struct reserved_mem *rmem;
> +       struct qcom_scm_vmperm dst[2];
> +       u64 src =3D BIT_ULL(QCOM_SCM_VMID_HLOS);
> +       u32 vmid;
> +       int ret;
> +
> +       if (!of_property_present(dev->of_node, "qcom,vmid"))
> +               return 0;
> +
> +       ret =3D of_property_read_u32(dev->of_node, "qcom,vmid", &vmid);
> +       if (ret)
> +               return dev_err_probe(dev, ret, "Failed to read qcom,vmid\=
n");
> +       if (vmid =3D=3D QCOM_SCM_VMID_HLOS || vmid >=3D BITS_PER_TYPE(u64=
))
> +               return dev_err_probe(dev, -EINVAL, "Invalid qcom,vmid %u\=
n", vmid);
> +
> +       if (!IS_ENABLED(CONFIG_DMA_RESTRICTED_POOL))
> +               return dev_err_probe(dev, -EOPNOTSUPP,
> +                                    "qcom,vmid requires DMA_RESTRICTED_P=
OOL\n");
> +
> +       rmem_np =3D of_parse_phandle(dev->of_node, "memory-region", 0);
> +       if (!rmem_np)
> +               return dev_err_probe(dev, -EINVAL,
> +                                            "qcom,vmid requires memory-r=
egion\n");
> +
> +       rmem =3D of_reserved_mem_lookup(rmem_np);
> +       of_node_put(rmem_np);
> +       if (!rmem)
> +               return dev_err_probe(dev, -EINVAL,
> +                                            "Failed to look up restricte=
d DMA pool\n");
> +
> +       if (!is_swiotlb_for_alloc(dev))
> +               return dev_err_probe(dev, -EINVAL,
> +                                    "Restricted DMA pool not attached\n"=
);
> +
> +       if (!qcom_scm_is_available())
> +               return -EPROBE_DEFER;
> +
> +       dst[0].vmid =3D QCOM_SCM_VMID_HLOS;
> +       dst[0].perm =3D QCOM_SCM_PERM_RW;
> +       dst[1].vmid =3D vmid;
> +       dst[1].perm =3D QCOM_SCM_PERM_RW;
> +
> +       ret =3D qcom_scm_assign_mem(rmem->base, rmem->size, &src, dst,
> +                                 ARRAY_SIZE(dst));
> +       if (ret)
> +               return dev_err_probe(dev, ret,
> +                                    "SCM assign restricted DMA pool fail=
ed\n");
> +
> +       dmux->dma_pool_base =3D rmem->base;
> +       dmux->dma_pool_size =3D rmem->size;
> +       /* Track the destination VMIDs explicitly for the reclaim operati=
on. */
> +       dmux->dma_pool_perms =3D BIT_ULL(QCOM_SCM_VMID_HLOS) | BIT_ULL(vm=
id);
> +
> +       return 0;
> +}
> +
> +static void bam_dmux_reclaim_dma_pool(struct bam_dmux *dmux)
> +{
> +       struct qcom_scm_vmperm hlos =3D {
> +               .vmid =3D QCOM_SCM_VMID_HLOS,
> +               .perm =3D QCOM_SCM_PERM_RW,
> +       };
> +       u64 src =3D dmux->dma_pool_perms;
> +       int ret;
> +
> +       if (!dmux->dma_pool_perms)
> +               return;
> +
> +       ret =3D qcom_scm_assign_mem(dmux->dma_pool_base, dmux->dma_pool_s=
ize, &src,
> +                                 &hlos, 1);
> +       if (ret) {
> +               dev_err(dmux->dev, "SCM reclaim restricted DMA pool faile=
d: %d\n", ret);
> +               return;
> +       }
> +
> +       dmux->dma_pool_perms =3D 0;
> +}
> +
> +static void bam_dmux_remove(struct platform_device *pdev);
> +
>  static int bam_dmux_probe(struct platform_device *pdev)
>  {
>         struct device *dev =3D &pdev->dev;
> @@ -796,6 +886,10 @@ static int bam_dmux_probe(struct platform_device *pd=
ev)
>                                      "Failed to get pc-ack state\n");
>         dmux->pc_ack_mask =3D BIT(bit);
>
> +       ret =3D bam_dmux_assign_dma_pool(dmux);
> +       if (ret)
> +               return ret;
> +
>         init_waitqueue_head(&dmux->pc_wait);
>         init_completion(&dmux->pc_ack_completion);
>         complete_all(&dmux->pc_ack_completion);
> @@ -829,8 +923,11 @@ static int bam_dmux_probe(struct platform_device *pd=
ev)
>
>         ret =3D irq_get_irqchip_state(dmux->pc_irq, IRQCHIP_STATE_LINE_LE=
VEL,
>                                     &dmux->pc_state);
> -       if (ret)
> -               goto err_disable_pm;
> +       if (ret) {
> +               /* The PC IRQ may already have powered up the RX path */
> +               bam_dmux_remove(pdev);

it's still unclear in the comment and commit message why we can't go
with err_disable_pm?

> +               return ret;
> +       }
>
>         /* Check if remote finished initialization before us */
>         if (dmux->pc_state) {
> @@ -845,6 +942,7 @@ static int bam_dmux_probe(struct platform_device *pde=
v)
>  err_disable_pm:
>         pm_runtime_disable(dev);
>         pm_runtime_dont_use_autosuspend(dev);
> +       bam_dmux_reclaim_dma_pool(dmux);
>         return ret;
>  }
>
> @@ -879,6 +977,12 @@ static void bam_dmux_remove(struct platform_device *=
pdev)
>         disable_irq(dmux->pc_irq);
>         bam_dmux_power_off(dmux);
>         bam_dmux_free_skbs(dmux->tx_skbs, DMA_TO_DEVICE);
> +
> +       /* The remote side may still access the pool if it holds its powe=
r vote */
> +       if (!dmux->pc_state)
> +               bam_dmux_reclaim_dma_pool(dmux);
> +       else if (dmux->dma_pool_perms)
> +               dev_warn(dev, "Leaving restricted DMA pool assigned to re=
mote\n");
>  }
>
>  static const struct dev_pm_ops bam_dmux_pm_ops =3D {
>
> --
> 2.34.1
>
