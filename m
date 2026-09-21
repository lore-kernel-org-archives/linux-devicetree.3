Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4B9CA44E046
	for <devicetree@vger.kernel.org>; Mon, 21 Sep 2026 07:59:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=205.220.168.131
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789977591; cv=pass; b=mAqc+T9EbO3s++eH97PPcfObAyli6QraBVFkV+2jC13tpygWBQx/bCBB3s1GhFuLxK5IeDzBVn0dH4Na70TSonKox7V0nnPsOSLa3JdAQGfkVF27uYrv7FmB9YQYE9kZS+oKQLo06jrMafG6VJFmT6jZIgJ39fW/NPoHGhowVX8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789977591; c=relaxed/simple;
	bh=2iSJXvd5bHYJhBZl5zY82J9FKyCivwhSwV/sKgMdm9w=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=mqsTFFh81pjl1PnmLaDJOPllnD5AYzlxeRhme3yGPzJ2LE0hkuuW0u7+Bkv0/3Okk7odR/mpqKKC13m5JnI5DYKLRt9aQj5Zj42AAY6z66Ps3beXw7/BCr7Bh8QGY6Y/vHLg6y5284eCjJScI0C0CyjVErLCR+uNmRCwWHFebg8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=gU46CBAq; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=SRMLTEZe; arc=pass smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="gU46CBAq";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="SRMLTEZe"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68L79pln4143152
	for <devicetree@vger.kernel.org>; Mon, 21 Sep 2026 07:59:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	DnFjfITyZ8jMzv4PyecSLw1qjAk3++tkxcNiz+G5Nv0=; b=gU46CBAqo6ipWGIX
	dJSsS3bGCfSA4CmuXO0kye7uFhg2rT8GnXgIRDHmu44gsxjGvGeKBdFtVlkxSZO1
	YEYkeglY3RP292iElY5uBhYIDlozQMj/bMyghTSELNiaslw2kJKx8cALxTmCeEvQ
	C8FiOvQqG/Aztaz6FYqkUlNAtboYUxSeRD3UsLgTsIMiHgEedJ0dhzY66ucmu3ps
	/N3/pHXIE21o8+PyNCrFGn65LPBhxU4Gi7KO7cOVnNW2pkCDLcqyJII0nUSzuFGm
	3oANYoTCI6GOp2VrK/uB93VOh7apZ1wLi1lZqSnTIJNkq0fnr5v/5c0bu2xX7MBV
	AX30hg==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gtyxq86e7-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 21 Sep 2026 07:59:48 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-93a183a0e93so613896985a.1
        for <devicetree@vger.kernel.org>; Mon, 21 Sep 2026 00:59:48 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1789977587; cv=none;
        d=google.com; s=arc-20260327;
        b=RvnhbVJIx8+GlFPpbo/MQVhav4G3zYhcsuU4MeLHagQXL4O4DL/KsPDbOAC3BSPwrN
         UhsopG8bB63pa/heZM1Vzfl0iEkejG0bHjMcANsEdecBCRupcqpI/UHnQb5rb8y8s6Uv
         Zed/ZBPd9qM7ma8M9W80Q0lqSpGYJcVCXOrO1gbP7HWQ9Qyihcx+DWBlek4f0G2deTOS
         WjeZMC4Cd80NOnm7FJiigJBTLHm2yXZ1D1Wfpo0f4Kn7q/W+VM0PvWr1OQnBEHKDxRU3
         HQ/nkVf63EjjXvACfXZXPGPBSC/Iqh8vzeeNCMRnPp6mCRAbaz/+kOk89HQ6WF0je3Rd
         PJeQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=DnFjfITyZ8jMzv4PyecSLw1qjAk3++tkxcNiz+G5Nv0=;
        fh=S+H4oR02I8iFceqo0I9R3yU213HOJ3vnAl6/kls9ty0=;
        b=erbmYptV2MLfHXn/FajxsaL2427fE675ty8sBdzSRvpojr4fOW+RZzlH+Vi3h1HdYH
         EjVSK+mbnyEN3Ts7A3eQf29DmGYgecOtsmL8gM6smPKfHEhiEo3Mj5NWW4l7Ze8E1IFb
         N/D3fxGOo4s6IZHxCkHmyeDs0Hn/ryIZnYkffcw44CCr8YmryuT1ByoPalXHT9yyW7JR
         n8C4VngRE9Rn7fGlq1VnsagovV+9I17LFmdgcvxjtaHJWf2iy7ghF8fUgaU6wFbbgLQH
         5BYRZ7Uovr3AMcyG8MgbSZf8T/NmnveLiXFtgjZJCTgfy7Ph5+NUnVoxVoG6rEzZ+5Gx
         WHXg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789977587; x=1790582387; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=DnFjfITyZ8jMzv4PyecSLw1qjAk3++tkxcNiz+G5Nv0=;
        b=SRMLTEZepoTrSKahLtHZu9UwYT6t4pOtdzGpvfXhIo7e66BIZ0nDJUfFXORyLBXr/4
         AhU62KQOrbtRIlgRCPIPsVucpGWHZiAXqpKsRaLRZyEAthhSHyoiZ3yQdhfKMiVWr1hH
         qMgQQKPYDj7Gv1VKwTukKi3IS6G5W0+Xwyh06yuf+gdYRLcRVWuUPr7LDyevrOel0XMI
         yBD2Bsy7QIW7LVj1NOzk20uESesQpMSEZrwerab73vFnVYJHmBVagTlq+YGwyN6lFRL7
         2rMCQEX/a73N9m1eGdDFTqlF8rf/cThBPjCGLqqG9icmzcFmCUPqJyXJdiK+VizHp2ku
         Suyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789977587; x=1790582387;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=DnFjfITyZ8jMzv4PyecSLw1qjAk3++tkxcNiz+G5Nv0=;
        b=vtE7bXvpu4xf7rT59nuBE70fJVCkCSRMnJC/1uflE/18X8lo07xx07ckrXdVv+Ucht
         M5Tae/bpER5Ng7DOTeMGN2p/uqzBaFVVhKwU1Mtot8qIUsVtj2GL2qRZ6vvDk7Dz/6BW
         n9y/gNAwi9YBoiZbRFrf5MDv3pMexoMGyU5Z1r6Xzw35Ie2Bo8e6NUSJpVRvbj4LMeh/
         +fXOEnPAahpWnnpsCl/vtoXOX0DfhWNlvLiryL202gu/kEss06C2hh2zIK205GVa5b7m
         8Qy+972uq2orhgsqBMw0psY5qVUZGhxAp2a0DacHi6WUGl+C3HdnkpbaDw+5Pr6nKvGW
         7eeQ==
X-Forwarded-Encrypted: i=1; AKwUvBwKqhdcp39kHSuu8mA9MMg6i+a1S1JdXx12SnShr9evxJfLnCodkgHo4oOIj3O2mNbdzEy/mVBIFQDY@vger.kernel.org
X-Gm-Message-State: AFuF++lX97t+1ggyapC51cgH0eib/AGMu+PunnHzjGZEcuE9x1t5BtP/
	YJ8dVm5VOtfvTM1z4VpWqg6VgRHjkm0Hamh1Wtb8M4eFEOu2oUG8LzbC6jn6AfmueXZ9bHZgf1J
	90jitWXI3SaYuzn3Ep5ZuUi9LerqBz+ifoMihWczx2/wW9lxudtPYEobfytwQEiOH0AwBucXiHC
	9rn7pqOBCXMFlSBXqN5K2RZ3d8gUmA35YVcs34ZCk=
X-Gm-Gg: AYBFou3xZ67SBXdMiHXXTjBO48GmFZ57+C0WcUD3huJd89ODsE8CsUKbgDTWd6+9npu
	hWdwkxUiWWCNz7mFD7/zWGEd0zMk061I15uU6MnW5E7rJnRlU/hSxtZowgYHWG3uZKCEvY2FodG
	c3JjXppTvdtlFVX23cbUaI0AKETC4KhkyPD4jDpCuFjfyt4o1NKciV1iXddMz4znVj9MTsA51iY
	xcYxJiPiS+mp1h2aBv5xv6OqRjst2xR7z0/DedpmyMMZSqerFkQlg1a4FsMd5280kXhjRBV0JEx
X-Received: by 2002:a05:620a:6891:b0:93b:d7a3:45d7 with SMTP id af79cd13be357-93bf57b75afmr887469485a.64.1789977587439;
        Mon, 21 Sep 2026 00:59:47 -0700 (PDT)
X-Received: by 2002:a05:620a:6891:b0:93b:d7a3:45d7 with SMTP id
 af79cd13be357-93bf57b75afmr887466885a.64.1789977587026; Mon, 21 Sep 2026
 00:59:47 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260920-qcom-bam-dmux-vmid-ext-v2-0-ef5ca2178378@oss.qualcomm.com>
 <20260920-qcom-bam-dmux-vmid-ext-v2-2-ef5ca2178378@oss.qualcomm.com>
In-Reply-To: <20260920-qcom-bam-dmux-vmid-ext-v2-2-ef5ca2178378@oss.qualcomm.com>
From: Loic Poulain <loic.poulain@oss.qualcomm.com>
Date: Mon, 21 Sep 2026 09:59:36 +0200
X-Gm-Features: AcwNN1UDu5fOKwjEU58oSkKvJaKyayj8YOeSwK8-nGVckHyNbwt3Z5pQU3x7y2A
Message-ID: <CAFEp6-1zFOnEweiw5apGOc8zZkGXmAAVjFF0JpxhB8DBgakkSQ@mail.gmail.com>
Subject: Re: [PATCH net-next v2 2/2] net: wwan: qcom_bam_dmux: Assign
 restricted DMA pool to remote processor
To: Vishnu Santhosh <vishnu.santhosh@oss.qualcomm.com>
Cc: Stephan Gerhold <stephan@gerhold.net>, Andrew Lunn <andrew+netdev@lunn.ch>,
        "David S. Miller" <davem@davemloft.net>,
        Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
        Paolo Abeni <pabeni@redhat.com>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Sergey Ryazanov <ryazanov.s.a@gmail.com>,
        Johannes Berg <johannes@sipsolutions.net>,
        linux-arm-msm@vger.kernel.org, netdev@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Deepak Kumar Singh <deepak.singh@oss.qualcomm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-GUID: wYusIjJlmol09neUVTxzAWq24aNbEIui
X-Proofpoint-ORIG-GUID: wYusIjJlmol09neUVTxzAWq24aNbEIui
X-Authority-Analysis: v=2.4 cv=OtraWC/t c=1 sm=1 tr=0 ts=6ab0e3f4 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=_K5XuSEh1TEqbUxoQ0s3:22 a=EUspDBNiAAAA:8 a=0Mq51QQeXCmcnqE6Af0A:9
 a=QEXdDO2ut3YA:10 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTIxMDExNCBTYWx0ZWRfXz2KQ33VkP+F1
 PQbA5LXdS5DmSB2FBYPasioMsW5U6ynt3c/Z43uR+WoPqpK1jDaod+fSyjANvbTee7ZqZMO3rFo
 nw3AzdaZxL49ZwNwxNG68+0xv1aKqXFN8E5PSpLhrvRObOvSx8aCOtKoH5fyNRQfNlE73EQITLo
 U7+MZRnOvw7abfKJAqBWZ9AWeu4HJgS33/v+Uj/5UBbJ7O5JVzV2ZqPR4LueqGpCw2bfhYWjPGx
 6srz54vi1XdJXIIm1AFRK1yj+I0P51G73h5BL20jJfRtePU1KnI9pGCWqmgylfXJMv0RxkPpmm/
 qwoJxraOLm2JCet7QBF1n5Ad8Ulo26SgSvvc1GU1FzQONSKfp+Nj+zUfmUVrU7Yk8H3sh2olQMw
 GTrnOfwsKKPp8agHwWAH7vYGus7+qJ8qWkfKTtr3xhbQoVVf7PRoBjXk7tF4QBrPmQpmOomo8OH
 JgTLBmblXyptPHbLTNA==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTIxMDExNCBTYWx0ZWRfXyCyyd/eirfH5
 uj8sjg9Yd8sEv6ps3qj0gG8ymHpkCPNB4IB3xyY6ojC90pXWb18jwOFHQut4d033ptckJzQyBcT
 PQg8HqOgPHF3tHPrNrv+z7OIMihZfns=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-21_03,2026-09-16_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 spamscore=0 lowpriorityscore=0 bulkscore=0 suspectscore=0
 malwarescore=0 adultscore=0 phishscore=0 clxscore=1015 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609210114

Hi Vishnu,

On Sun, Sep 20, 2026 at 5:03=E2=80=AFAM Vishnu Santhosh
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
> released during remove or probe error cleanup.
>
> Fail probing when restricted DMA pool support is unavailable, when the
> VMID property is malformed, or when memory-region does not reference a
> restricted DMA pool.
>
> Co-developed-by: Deepak Kumar Singh <deepak.singh@oss.qualcomm.com>
> Signed-off-by: Deepak Kumar Singh <deepak.singh@oss.qualcomm.com>
> Signed-off-by: Vishnu Santhosh <vishnu.santhosh@oss.qualcomm.com>
> ---
>  drivers/net/wwan/Kconfig         |  1 +
>  drivers/net/wwan/qcom_bam_dmux.c | 95 ++++++++++++++++++++++++++++++++++=
++++++
>  2 files changed, 96 insertions(+)
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
> index cc6ace8d64371eb8d00c638a39b234ee540b83c9..c81e668d4e961a645f7e2d823=
c3136845f086b08 100644
> --- a/drivers/net/wwan/qcom_bam_dmux.c
> +++ b/drivers/net/wwan/qcom_bam_dmux.c
> @@ -9,10 +9,12 @@
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
> @@ -75,6 +77,9 @@ struct bam_dmux {
>         struct completion pc_ack_completion;
>
>         struct dma_chan *rx, *tx;
> +       phys_addr_t dma_pool_base;
> +       size_t dma_pool_size;
> +       u64 dma_pool_perms;
>         struct bam_dmux_skb_dma rx_skbs[BAM_DMUX_NUM_SKB];
>         struct bam_dmux_skb_dma tx_skbs[BAM_DMUX_NUM_SKB];
>         spinlock_t tx_lock; /* Protect tx_skbs, tx_next_skb */
> @@ -762,6 +767,90 @@ static int __maybe_unused bam_dmux_runtime_resume(st=
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
> +       if (!of_device_is_compatible(rmem_np, "restricted-dma-pool")) {
> +               of_node_put(rmem_np);
> +               return dev_err_probe(dev, -EINVAL,
> +                                    "memory-region must reference a rest=
ricted DMA pool\n");
> +       }
> +
> +       rmem =3D of_reserved_mem_lookup(rmem_np);
> +       of_node_put(rmem_np);
> +       if (!rmem)
> +               return dev_err_probe(dev, -EINVAL,
> +                                            "Failed to look up restricte=
d DMA pool\n");
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

This function appears to address a generic Qualcomm platform issue. Is
the VMID allocation pattern and pool management specific to this
hardware/driver, or could this functionality be factored out into a
common helper and reused by other drivers or subsystems?

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
>  static int bam_dmux_probe(struct platform_device *pdev)
>  {
>         struct device *dev =3D &pdev->dev;
> @@ -796,6 +885,10 @@ static int bam_dmux_probe(struct platform_device *pd=
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
> @@ -845,6 +938,7 @@ static int bam_dmux_probe(struct platform_device *pde=
v)
>  err_disable_pm:
>         pm_runtime_disable(dev);
>         pm_runtime_dont_use_autosuspend(dev);
> +       bam_dmux_reclaim_dma_pool(dmux);
>         return ret;
>  }
>
> @@ -879,6 +973,7 @@ static void bam_dmux_remove(struct platform_device *p=
dev)
>         disable_irq(dmux->pc_irq);
>         bam_dmux_power_off(dmux);
>         bam_dmux_free_skbs(dmux->tx_skbs, DMA_TO_DEVICE);
> +       bam_dmux_reclaim_dma_pool(dmux);
>  }
>
>  static const struct dev_pm_ops bam_dmux_pm_ops =3D {
>
> --
> 2.34.1
>
