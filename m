Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 39D2422F388
	for <devicetree@vger.kernel.org>; Thu,  8 Oct 2026 07:10:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=205.220.168.131
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791443458; cv=pass; b=rCWjQut8Qfj6S5AqqREgx6hH6LD23GdtPG3v8aCum76JlmQZADytOvdVr0h46q+dDNB2DDBjKXosLCuM8WgV7oxVU3eDXhIhXy9VqCwBfvl72QxGE+48HWPRZEFIHpjbT3W5wDtsMyr4i8A31QfN1IRHvRkZp08ywZmUqVLl29s=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791443458; c=relaxed/simple;
	bh=ewFQKA8EVN1iM/cG3I8//Pi93DNLwjT2Z/KHl8SWOvE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=eeDiasUCeK0crF7u2JIBayOd/w0+bK1dTAlUoLZFDj+z2FTE7ai5Ej3VALVxghuJccFidOjNakXAGjV+KnxweUbh6vPkW+2QJABaB1g1/l76/el3PKwRd8l/rd9lBYe90EG3xdIIA59O6YEdrvqYssP5RkqjAxGju/zzth/JYpY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=gfRcSYcA; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=TEt2wm3G; arc=pass smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="gfRcSYcA";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="TEt2wm3G"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6984BRQX2895384
	for <devicetree@vger.kernel.org>; Thu, 8 Oct 2026 07:10:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	7nasfACxPHNSVL6ZJxVxYj14HuH85yKrmiZQ9V3XxK8=; b=gfRcSYcArUxOyr4O
	ALtimqIqtizFndC6a+JYtPg8e+czp6+SK6vLyOBYc8eNatJrmTkWWnP93kVNd6CB
	ibdNk/f8WpTfbmZoDaMm/+bOlYkG4OS1qRfy9NvCltmBlZveRah7aMAD7pzw6Z+d
	ACl9OXJ03mc4csooIVnnRoLUVKd8AC/umw082Uq17Sx3zMb7YAef+s/OencD9wiz
	8DBIZNPMv+ciV3MtUQH+obIT6ioea1fdpcsE/QqIdE9wofAmm6tzI985rZv12qzY
	KRgQf+6DQFHZiy0Q5x5n5nDAgys99NqOCJ8syetfNLqmpKRG2fTY/kF5RCYsOoOo
	DjQsvg==
Received: from mail-yx1-f69.google.com (mail-yx1-f69.google.com [74.125.224.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h60sg96yv-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Thu, 08 Oct 2026 07:10:56 +0000 (GMT)
Received: by mail-yx1-f69.google.com with SMTP id 956f58d0204a3-677ada64e84so7412094d50.1
        for <devicetree@vger.kernel.org>; Thu, 08 Oct 2026 00:10:56 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1791443455; cv=none;
        d=google.com; s=arc-20260327;
        b=GwR0YqDnOUDvR5naalqpf5MwoXjw9Yh7IrZOFGXdVQf1EWQti1vSqtCQlsKjVOVepG
         chNMz53FhlaBTAYNjFI5ciS1dt1EG+FFWUTgXRzl9ulW1n1wCHch0sSB30ZIkZ2AhABO
         buNOjdrAeVR8qq5kmXBGbOWS0iSB2890kc1XZrlQvTqv6585lwWCn8N9gXaLQiVXVFwA
         eILA+oSFnkcHlybRdqjA9+BYkKMnoNtYV5ssXBixgFdJnkyT1ciJAwCpgWkzpMdvIegQ
         2Qa0wzOcu6n9J5Oc1uYp1HsjhvK/RcAB7eHFJhRFDjO6ESsN0dbjDgxY7Jp9OOmtCzYA
         HBrA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=7nasfACxPHNSVL6ZJxVxYj14HuH85yKrmiZQ9V3XxK8=;
        fh=We7TqAN4WCaydN4MbxZuoeSJD7+2FOGthYqq1zdC+gk=;
        b=mySFosLXg/7XV+qxyVS4NjCLiHpVTg6H3/xdX91n+dZJA+k/l1wWIwqfLmnl/Eiwe4
         WKypxo//HjFHHOsorseWl0CHXF90e11RLwa15Mo+txpOtJpFRFb/FWP+GHyIIXBSLXRU
         4OZ/I01vueQAbsEKbaHvLxru8u3Pj9EzVGLcsBioa6PrC5dnIsaZeSwvqJ3v8oaTufAm
         I+ssEQ5uxjYAetbZesC9P0eclpm//TT9v2n2OhFQtT3ZnGSqly+5J8pSMGTTtXln0eNI
         w//c+Gphn6NYmy9qgDUjMRYZuilC5ngroXSW6n+L3yF/bTxy+xwyI0vLjrGOL4N0tgBQ
         AviQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791443455; x=1792048255; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=7nasfACxPHNSVL6ZJxVxYj14HuH85yKrmiZQ9V3XxK8=;
        b=TEt2wm3G/h3IWkBShu5RVXY+JRmKNbM51SO6J3NbooblX4IAGjLStnDysTFiTj9EZ0
         7VMIVp+P5a4JDORjB4DPtYZmRgevsQh6X6hfv1Wkw0xqEBjH0SjpbvCWRsu2XRpc9AUR
         n4EPJSgizetXeOJ6+a+L017QhxoxAqWpuyiKTSos+Od1D+B5UB3K5OJ1TNiLVB7PR+xx
         QQPePzHFxgDObWZyjT0TaZvpX3wjRx9/lgtJmpOASGVJCXddruzzlPFdijnlq/0+F1g4
         04jeaQjMXaXnkqUVt7AVsl7j64rkQ+j76MgCm+9N8JhRnkO54xtHtN20wGQRA8W3j2H/
         Rqdg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791443455; x=1792048255;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=7nasfACxPHNSVL6ZJxVxYj14HuH85yKrmiZQ9V3XxK8=;
        b=FsI39JMBdGSkFD6AfeaAs939q8s7Xn7mjg/xAW+Yt0s1Xx5NTvHvSsGg7vJmdAVmil
         rG02z68HaFFQPov73VAFw28EunIB6VwZIAb330fqvbcNGae4hpSljnHc6d449D+KKMUI
         7IAGMYxM17FDD2Qg+HJc15qMf6tp3VAGXPEjj8dwFIOjU0sFjJi/k4d9DJ3+Wkh12kpz
         dxjfDPW0xF1RUwMnGbGnIc4Ula48iH2+0xRvCJtEpUE3wi2TvrlMc5jHJQ8GuOS58QwY
         +cBrOCm67s5LKw8HrH8SM/fcGlVk6nEdtRPbm9NvJ1rewKnnXt3Aid5/Ql0XksaFfiCS
         hBxw==
X-Forwarded-Encrypted: i=1; AKwUvBxKEuMPcX8TUop83n016u9CCTRQkJPpHZ2U0ddul7f766E4a091JuPhNRm+YnCVyaryjkfGwDZ4pQmq@vger.kernel.org
X-Gm-Message-State: AFq9FYIYCWh7Z6tOEigYrEHEAg+UWpfqnZsgVaZ1xQieiz16l69gi5M+
	6Tuq4UtUV+bHk7/J1KtMhXC4ht/47OBOl9thTrerMVM6McwC+CcVCNwfjJDtK6ORHBOlvGJe2QC
	9K6oXnFhrTMez3Y1qGD+Aywhqqig7DjGhuIK1BgNslUdVPioG2bgum+IAuQFn4M/aJU0t0W0fuR
	mfr1rcocMiSy7AxqILteKs26U5uXWiXDocRim5LZ8=
X-Gm-Gg: AYBFou3bSTJwGv0/GVLwGQuL9Udna2FQsAp35vU+cy0NMfA6jyVuplWHH1Ge5BBhzHm
	ERM98n6o8M71m+NcvtYujQATLQiffFmRCNYkuZ4R3E9Rx9wS1MUeP1DdR/IymF5SQeMYa7maCLy
	pDMhHfpjYEZ7K9pXiQuiNyFK8YJIO71Zsdrz1BntXIHm/UTPwu/0w2DJ0=
X-Received: by 2002:a05:690e:813:20b0:674:1f9a:401e with SMTP id 956f58d0204a3-6790a096b1bmr1831091d50.60.1791443454959;
        Thu, 08 Oct 2026 00:10:54 -0700 (PDT)
X-Received: by 2002:a05:690e:813:20b0:674:1f9a:401e with SMTP id
 956f58d0204a3-6790a096b1bmr1831083d50.60.1791443454271; Thu, 08 Oct 2026
 00:10:54 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20261005-rpmi-tee-service-grp-dev-v2-0-72f222e23ec1@oss.qualcomm.com>
 <20261005-rpmi-tee-service-grp-dev-v2-3-72f222e23ec1@oss.qualcomm.com>
In-Reply-To: <20261005-rpmi-tee-service-grp-dev-v2-3-72f222e23ec1@oss.qualcomm.com>
From: Jens Wiklander <jens.wiklander@oss.qualcomm.com>
Date: Thu, 8 Oct 2026 09:10:41 +0200
X-Gm-Features: AclHuK_5_jxpklCZoDI4szBFsh7SnsGl5SOvGOXgGyD9h2gCE4mYnsS8HKGboow
Message-ID: <CAGgiveVHTjDPfRuXwMyQ0kxT7s5V+EgkC_hYgBCOvvvkb2bGvg@mail.gmail.com>
Subject: Re: [PATCH RFC v2 3/8] tee: optee: add RPMI shared-memory and
 parameter support
To: Amirreza Zarrabi <amirreza.zarrabi@oss.qualcomm.com>
Cc: Jens Wiklander <jenswi@kernel.org>, Sumit Garg <sumit.garg@kernel.org>,
        Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>,
        Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
        Rahul Pathak <rahul@summations.net>, Anup Patel <anup@brainfault.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Marouene Boubakri <marouene.boubakri@oss.nxp.com>,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        op-tee@lists.trustedfirmware.org, linux-riscv@lists.infradead.org,
        devicetree@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-GUID: FqvpRgjhwnB2wK5S9ApO6XiZ5xnjflrI
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDA4MDAyOCBTYWx0ZWRfX6aaveDRp0pe8
 IbtEmZSoBzhMb6nZIrJE5cDGELhZcXQqmnzE7XFOQT8ODLREx0CRaiUa/2xL3xMvr2TJ5OZYbYt
 8kL3Q/VWSFGJQAauFp/Y6H/EP0sIXdU=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDA4MDAyOCBTYWx0ZWRfX0D21FZXn+w5S
 YOM+1Bxg4OSZz5LimsYTxk1wAjOxnxK/m1P+pEeZ1m4npYR9gTm5NALMimKkStZiMd+n/GM8Z6r
 yvBqVbWEJz6uPjZWHQR2OXfil5rlDalQIvoE68fK3lEEqMp45JJpgiOE274GjWfJGfOMGnPPAGY
 LUZc9CRPXl9QvOYqavW7zBN8TKht26NXsf12Emr0q6DZCRomwifG3jPxrlqEsS0C9aMpNZM3MvL
 vDkNXNHsZw66xvM4yMmoP553AoG8EJE19JLoQn+9XL3l/IEA79IFnbdB0alktFjRrSHDCYCZUwB
 9LPcwsxfDjDrfLbFi27/0P1Fbbvk5GOqmYMD2oGM17QKC+PHR0KmDQdBOJ3eubIjtHVgWc6fGB0
 wqTT8dRB4ZLBv6CNQFJDUhEJADOS+vsbRKBOdAgPxzGvNOgetZEhEwe4OepZjBzmMIJo9SHqXUg
 r34Pla1TSRrLJTo+Ijw==
X-Authority-Analysis: v=2.4 cv=DfWCOftW c=1 sm=1 tr=0 ts=6ac74200 cx=c_pps
 a=J+5FMm3BkXb42VdG8aMU9w==:117 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=eoimf2acIAo5FJnRuUoq:22 a=EUspDBNiAAAA:8 a=0xFQXAewANoCAR_c-UwA:9
 a=QEXdDO2ut3YA:10 a=Epx66wHExT0cjJnnR-oj:22
X-Proofpoint-ORIG-GUID: FqvpRgjhwnB2wK5S9ApO6XiZ5xnjflrI
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-08_02,2026-10-06_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 malwarescore=0 bulkscore=0 phishscore=0 clxscore=1015
 priorityscore=1501 suspectscore=0 spamscore=0 impostorscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610020000 definitions=main-2610080028

Hi Amir,

On Tue, Oct 6, 2026 at 2:40=E2=80=AFAM Amirreza Zarrabi
<amirreza.zarrabi@oss.qualcomm.com> wrote:
>
> OP-TEE commands and RPCs need shared memory that secure world can
> identify through RPMI parcels.
>
> Register normal-world pages as read-write parcels shared with the
> OP-TEE endpoint. Track each parcel ID and nonce in a hash table and
> store the combined identity in tee_shm.sec_world_id. Use a fixed
> nonzero nonce to distinguish registered memory from NULL references.
>
> Add conversions between TEE parameters and parcel memory references.
>
> On client memory unregistration, ask OP-TEE to release its mapping
> before reclaiming the parcel. Supplicant memory has already been
> released by OP-TEE through its SHM_FREE RPC and only needs reclaiming.
>
> Signed-off-by: Amirreza Zarrabi <amirreza.zarrabi@oss.qualcomm.com>
> ---
>  drivers/tee/optee/Makefile        |   1 +
>  drivers/tee/optee/optee_private.h |  27 +++
>  drivers/tee/optee/rpmi_abi.c      | 417 ++++++++++++++++++++++++++++++++=
++++++
>  3 files changed, 445 insertions(+)
>
> diff --git a/drivers/tee/optee/Makefile b/drivers/tee/optee/Makefile
> index 183cdde1ac04..8576cc73a922 100644
> --- a/drivers/tee/optee/Makefile
> +++ b/drivers/tee/optee/Makefile
> @@ -9,6 +9,7 @@ optee-objs +=3D supp.o
>  optee-objs +=3D device.o
>  optee-$(CONFIG_HAVE_ARM_SMCCC) +=3D smc_abi.o
>  optee-$(CONFIG_ARM_FFA_TRANSPORT) +=3D ffa_abi.o
> +optee-$(CONFIG_RISCV_RPMI_TEE_TRANSPORT) +=3D rpmi_abi.o
>
>  # for tracing framework to find optee_trace.h
>  CFLAGS_smc_abi.o :=3D -I$(src)
> diff --git a/drivers/tee/optee/optee_private.h b/drivers/tee/optee/optee_=
private.h
> index 02d6f79df407..2422caf3c883 100644
> --- a/drivers/tee/optee/optee_private.h
> +++ b/drivers/tee/optee/optee_private.h
> @@ -180,6 +180,28 @@ struct optee_ffa {
>  };
>  #endif
>
> +#if IS_REACHABLE(CONFIG_RISCV_RPMI_TEE_TRANSPORT)
> +struct rpmi_tee_device;
> +
> +/**
> + * struct optee_rpmi - RPMI shared-memory identity state
> + * @rdev: owning RPMI service device
> + * @shm_rht_lock: protects parcel lookup, insertion, removal and publica=
tion
> + * @shm_rht: lookup by the host-endian parcel ID and nonce pair
> + *
> + * Callers keep their tee_shm alive while using its registration. Lookup
> + * returns a raw pointer; the mutex does not protect its lifetime after
> + * unlocking. Never hold @shm_rht_lock across a transport operation, RPC=
 or
> + * thread-availability wait.
> + */
> +struct optee_rpmi {
> +       struct rpmi_tee_device *rdev;
> +       /* Protects parcel lookup, insertion, removal and publication. */
> +       struct mutex shm_rht_lock;
> +       struct rhashtable shm_rht;
> +};
> +#endif
> +
>  struct optee;
>
>  /**
> @@ -240,6 +262,7 @@ struct optee_ops {
>   * @ctx:                       driver internal TEE context
>   * @smc:                       specific to SMC ABI
>   * @ffa:                       specific to FF-A ABI
> + * @rpmi:                      specific to RPMI ABI
>   * @shm_arg_cache:             shared memory cache argument
>   * @call_queue:                        queue of threads waiting to call =
@invoke_fn
>   * @notif:                     notification synchronization struct
> @@ -271,6 +294,9 @@ struct optee {
>  #endif
>  #if IS_REACHABLE(CONFIG_ARM_FFA_TRANSPORT)
>                 struct optee_ffa ffa;
> +#endif
> +#if IS_REACHABLE(CONFIG_RISCV_RPMI_TEE_TRANSPORT)
> +               struct optee_rpmi rpmi;
>  #endif
>         };
>         struct optee_shm_arg_cache shm_arg_cache;
> @@ -464,4 +490,5 @@ static inline void optee_ffa_abi_unregister(void)
>  }
>  #endif
>
> +
>  #endif /*OPTEE_PRIVATE_H*/
> diff --git a/drivers/tee/optee/rpmi_abi.c b/drivers/tee/optee/rpmi_abi.c
> new file mode 100644
> index 000000000000..e7fc853cfb15
> --- /dev/null
> +++ b/drivers/tee/optee/rpmi_abi.c
> @@ -0,0 +1,417 @@
> +// SPDX-License-Identifier: GPL-2.0-only
> +/*
> + * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
> + */
> +
> +#define pr_fmt(fmt) KBUILD_MODNAME ": " fmt
> +
> +#include <linux/cleanup.h>
> +#include <linux/mailbox/riscv-rpmi-message.h>
> +#include <linux/overflow.h>
> +#include <linux/rpmi_tee.h>
> +#include <linux/slab.h>
> +#include <linux/unaligned.h>
> +#include "optee_private.h"
> +#include "optee_rpmi.h"
> +
> +/* Nonzero nonce keeps parcel ID zero distinct from a null reference. */
> +#define OPTEE_RPMI_SHM_NONCE   1
The spec describes this as:

A token nonce which receivers will need to present to the framework,
together with MEM_PARCEL_ID, to accept the memory.
It is intended as a way to reduce the likelihood of accidental
collisions on MEM_PARCEL_ID values, which can be reused by the
framework after they have been destroyed.

Why don't we change the nonce with each new parcel to live up to that?

> +
> +struct optee_rpmi_parcel_key {
> +       u32 parcel_id;
> +       u32 nonce;
> +};
> +
> +struct optee_rpmi_shm_rht_entry {
> +       struct rhash_head node;
> +       struct optee_rpmi_parcel_key key;
> +       struct tee_shm *shm;
> +};
> +
> +static const struct rhashtable_params optee_rpmi_shm_rht_params =3D {
> +       .head_offset =3D offsetof(struct optee_rpmi_shm_rht_entry, node),
> +       .key_offset =3D offsetof(struct optee_rpmi_shm_rht_entry, key),
> +       .key_len =3D sizeof(struct optee_rpmi_parcel_key),
> +       .automatic_shrinking =3D true,
> +};
> +
> +/* Keep transport errors separate from the control status in a response.=
 */
> +static int optee_rpmi_call_with_status(struct optee *optee,
> +                                      const void *req, size_t req_len,
> +                                      void *resp, size_t resp_size,
> +                                      s32 *status)
> +{
> +       struct rpmi_tee_device *rdev =3D optee->rpmi.rdev;
> +       size_t received =3D resp_size;
> +       int ret;
> +
> +       ret =3D rdev->ops->msg_ops->call(rdev, req, req_len, resp, &recei=
ved);
> +       if (ret)
> +               return ret;
> +
> +       if (received !=3D resp_size)
> +               return -EPROTO;
> +
> +       *status =3D get_unaligned_le32(resp);
> +
> +       return 0;
> +}
> +
> +/**
> + * optee_rpmi_call - Send a control request and decode its RPMI status
> + * @optee: OP-TEE instance.
> + * @req: Control request, including the operation number.
> + * @req_len: Request size in bytes.
> + * @resp: Response buffer, beginning with a little-endian RPMI status.
> + * @resp_size: Exact expected response size, including the status field.
> + *
> + * Return: 0 on success, a transport error, -EPROTO for an unexpected re=
sponse
> + * size, or the control status converted to a Linux error code.
> + */
> +static int optee_rpmi_call(struct optee *optee, const void *req, size_t =
req_len,
> +                          void *resp, size_t resp_size)
> +{
> +       s32 status;
> +       int ret;
> +
> +       ret =3D optee_rpmi_call_with_status(optee, req, req_len, resp, re=
sp_size,
> +                                         &status);
> +       if (ret)
> +               return ret;
> +
> +       return rpmi_to_linux_error(status);
> +}
> +
> +static int optee_rpmi_shm_rht_init(struct optee *optee)
> +{
> +       int ret;
> +
> +       mutex_init(&optee->rpmi.shm_rht_lock);
> +       ret =3D rhashtable_init(&optee->rpmi.shm_rht, &optee_rpmi_shm_rht=
_params);
> +       if (ret)
> +               mutex_destroy(&optee->rpmi.shm_rht_lock);
> +
> +       return ret;
> +}
> +
> +static void optee_rpmi_shm_rht_free(void *ptr, void *arg)
> +{
> +       kfree(ptr);
> +}
> +
> +static void optee_rpmi_shm_rht_uninit(struct optee *optee)
> +{
> +       rhashtable_free_and_destroy(&optee->rpmi.shm_rht,
> +                                   optee_rpmi_shm_rht_free, NULL);
> +       mutex_destroy(&optee->rpmi.shm_rht_lock);
> +}
> +
> +/* Allocate and publish a parcel-to-SHM mapping. */
> +static int optee_rpmi_shm_rht_add(struct optee *optee, struct tee_shm *s=
hm,
> +                                 u32 parcel_id, u32 nonce)
> +{
> +       struct optee_rpmi_shm_rht_entry *entry;
> +       int ret;
> +
> +       entry =3D kzalloc_obj(*entry);
> +       if (!entry)
> +               return -ENOMEM;
> +
> +       entry->shm =3D shm;
> +       entry->key.parcel_id =3D parcel_id;
> +       entry->key.nonce =3D nonce;
> +
> +       scoped_guard(mutex, &optee->rpmi.shm_rht_lock)
> +               ret =3D rhashtable_lookup_insert_fast(&optee->rpmi.shm_rh=
t,
> +                                                   &entry->node,
> +                                                   optee_rpmi_shm_rht_pa=
rams);
> +       if (ret)
> +               kfree(entry);
> +
> +       return ret;
> +}
> +
> +/* Remove and free a parcel-to-SHM mapping. */
> +static int optee_rpmi_shm_rht_rm(struct optee *optee, u32 parcel_id, u32=
 nonce)
> +{
> +       struct optee_rpmi_shm_rht_entry *entry;
> +       struct optee_rpmi_parcel_key key =3D {
> +               .parcel_id =3D parcel_id,
> +               .nonce =3D nonce,
> +       };
> +       int ret =3D -ENOENT;
> +
> +       scoped_guard(mutex, &optee->rpmi.shm_rht_lock) {
> +               entry =3D rhashtable_lookup_fast(&optee->rpmi.shm_rht, &k=
ey,
> +                                              optee_rpmi_shm_rht_params)=
;
> +               if (entry)
> +                       ret =3D rhashtable_remove_fast(&optee->rpmi.shm_r=
ht,
> +                                                    &entry->node,
> +                                                    optee_rpmi_shm_rht_p=
arams);
> +       }
> +
> +       if (!ret)
> +               kfree(entry);
> +
> +       return ret;
> +}
> +
> +/* Return a raw pointer; the surrounding call or RPC owns the SHM lifeti=
me. */
> +static struct tee_shm *
> +optee_rpmi_get_shm_for_parcel(struct optee *optee, u32 parcel_id, u32 no=
nce)
> +{
> +       struct optee_rpmi_shm_rht_entry *entry;
> +       struct optee_rpmi_parcel_key key =3D {
> +               .parcel_id =3D parcel_id,
> +               .nonce =3D nonce,
> +       };
> +
> +       guard(mutex)(&optee->rpmi.shm_rht_lock);
> +       entry =3D rhashtable_lookup_fast(&optee->rpmi.shm_rht, &key,
> +                                      optee_rpmi_shm_rht_params);
> +
> +       return entry ? entry->shm : NULL;

Please use a full if statement instead of the ternary operator

> +}
> +
> +/* Extract the parcel ID and nonce stored in the SHM identity. */
> +static void optee_rpmi_shm_get_identity(const struct tee_shm *shm,
> +                                       u32 *parcel_id, u32 *nonce)
> +{
> +       *parcel_id =3D lower_32_bits(shm->sec_world_id);
> +       *nonce =3D upper_32_bits(shm->sec_world_id);

By keeping parcel_id and nonce in separate fields, we add quite a bit
of code only to handle u64 -> u32 + u32 and vice versa. I wonder if it
wouldn't be easier always to keep them in a u64 and say that the upper
32 bits are a nonce, or something. With that, we could make the
optee_shm_rem_ffa_handle() function and friends common helpers in the
optee driver.

> +}
> +
> +static int optee_rpmi_shm_register(struct tee_context *ctx, struct tee_s=
hm *shm,
> +                                  struct page **pages, size_t num_pages,
> +                                  unsigned long start)
> +{
> +       struct optee *optee =3D tee_get_drvdata(ctx->teedev);
> +       struct rpmi_tee_device *rdev =3D optee->rpmi.rdev;
> +       struct rpmi_tee_mem_receiver receiver =3D {
> +               .endpoint_id =3D rdev->endpoint_id,
> +               .access =3D RPMI_TEE_MEM_ACCESS_READ | RPMI_TEE_MEM_ACCES=
S_WRITE,
> +       };
> +       struct rpmi_tee_mem_args args =3D {
> +               .nonce =3D OPTEE_RPMI_SHM_NONCE,
> +               .receivers =3D &receiver,
> +               .receiver_count =3D 1,
> +               .creator_access =3D RPMI_TEE_MEM_ACCESS_READ |
> +                                 RPMI_TEE_MEM_ACCESS_WRITE,
> +       };
> +       struct sg_table sgt;
> +       int ret;
> +
> +       ret =3D optee_check_mem_type(start, num_pages);
> +       if (ret)
> +               return ret;
> +
> +       ret =3D sg_alloc_table_from_pages(&sgt, pages, num_pages, 0,
> +                                       num_pages * PAGE_SIZE, GFP_KERNEL=
);
> +       if (ret)
> +               return ret;
> +
> +       args.sg =3D sgt.sgl;
> +       ret =3D rdev->ops->mem_ops->memory_share(rdev, &args);
> +       sg_free_table(&sgt);
> +       if (ret)
> +               return ret;
> +
> +       ret =3D optee_rpmi_shm_rht_add(optee, shm, args.parcel_id, args.n=
once);
> +       if (ret) {
> +               int reclaim_ret;
> +
> +               reclaim_ret =3D rdev->ops->mem_ops->memory_reclaim(rdev, =
args.parcel_id);
> +               if (reclaim_ret)
> +                       dev_err(&rdev->dev, "reclaim parcel %#x failed: %=
d\n",
> +                               args.parcel_id, reclaim_ret);
> +               return ret;
> +       }
> +
> +       shm->sec_world_id =3D ((u64)args.nonce << 32) | args.parcel_id;
> +
> +       return 0;
> +}
> +
> +static int optee_rpmi_shm_unregister(struct tee_context *ctx,
> +                                    struct tee_shm *shm)
> +{
> +       struct optee *optee =3D tee_get_drvdata(ctx->teedev);
> +       struct rpmi_tee_device *rdev =3D optee->rpmi.rdev;
> +       struct optee_rpmi_unregister_req req;
> +       struct optee_rpmi_status_resp resp;
> +       u32 parcel_id, nonce;
> +       int ret;
> +
> +       optee_rpmi_shm_get_identity(shm, &parcel_id, &nonce);
> +       optee_rpmi_shm_rht_rm(optee, parcel_id, nonce);
> +       shm->sec_world_id =3D 0;
> +
> +       req.op =3D cpu_to_le32(OPTEE_RPMI_UNREGISTER_SHM);
> +       req.parcel_id =3D cpu_to_le32(parcel_id);
> +       req.nonce =3D cpu_to_le32(nonce);
> +       ret =3D optee_rpmi_call(optee, &req, sizeof(req), &resp, sizeof(r=
esp));
> +       if (ret)
> +               dev_err(&rdev->dev, "unregister parcel %#x failed: %d\n",
> +                       parcel_id, ret);
> +
> +       ret =3D rdev->ops->mem_ops->memory_reclaim(rdev, parcel_id);
> +       if (ret)
> +               dev_err(&rdev->dev, "reclaim parcel %#x failed: %d\n",
> +                       parcel_id, ret);
> +
> +       return ret;
> +}
> +
> +static int optee_rpmi_shm_unregister_supp(struct tee_context *ctx,
> +                                         struct tee_shm *shm)
> +{
> +       struct optee *optee =3D tee_get_drvdata(ctx->teedev);
> +       struct rpmi_tee_device *rdev =3D optee->rpmi.rdev;
> +       u32 parcel_id, nonce;
> +       int ret;
> +
> +       optee_rpmi_shm_get_identity(shm, &parcel_id, &nonce);
> +       optee_rpmi_shm_rht_rm(optee, parcel_id, nonce);
> +       shm->sec_world_id =3D 0;
> +       /* OP-TEE has already retired the parcel through SHM_FREE RPC. */
> +       ret =3D rdev->ops->mem_ops->memory_reclaim(rdev, parcel_id);
> +       if (ret)
> +               dev_err(&rdev->dev, "reclaim parcel %#x failed: %d\n",
> +                       parcel_id, ret);
> +
> +       return ret;
> +}
> +
> +/* Convert a memory reference to an OP-TEE RPMI parcel reference. */
> +static int to_msg_param_rpmi_mem(struct optee_msg_param *mp,
> +                                const struct tee_param *p)
> +{
> +       struct tee_shm *shm =3D p->u.memref.shm;
> +
> +       mp->attr =3D OPTEE_MSG_ATTR_TYPE_PMEM_INPUT + p->attr -
> +                  TEE_IOCTL_PARAM_ATTR_TYPE_MEMREF_INPUT;
> +       memset(&mp->u, 0, sizeof(mp->u));
> +       /* For !shm, return parcel_id =3D 0 and nonce =3D 0 to represent =
NULL. */
> +       if (shm) {
> +               if (check_add_overflow((u64)shm->offset,
> +                                      (u64)p->u.memref.shm_offs,
> +                                      &mp->u.pmem.offs))
> +                       return -EINVAL;

By combining the shm->offset with p->u.memref.shm_offs, OP-TEE
requires an explicit call to register the shared memory so it knows
the initial page offset. Compared with the FF-A ABI, which can tell
the initial page offset from mp->u.fmem.internal_offs. See also the
mobj_ffa_get_by_cookie() call in set_fmem_param() in
core/tee/entry_std.c in optee_os.git

> +
> +               optee_rpmi_shm_get_identity(shm, &mp->u.pmem.parcel_id,
> +                                           &mp->u.pmem.nonce);
> +       }
> +
> +       mp->u.pmem.size =3D p->u.memref.size;
> +
> +       return 0;
> +}
> +
> +static int optee_rpmi_to_msg_param(struct optee *optee,
> +                                  struct optee_msg_param *msg_params,
> +                                  size_t num_params,
> +                                  const struct tee_param *params)
> +{
> +       size_t n;
> +
> +       for (n =3D 0; n < num_params; n++) {
> +               const struct tee_param *p =3D params + n;
> +               struct optee_msg_param *mp =3D msg_params + n;

Please add an empty line after the variables.

Cheers,
Jens

> +               switch (p->attr) {
> +               case TEE_IOCTL_PARAM_ATTR_TYPE_NONE:
> +                       mp->attr =3D OPTEE_MSG_ATTR_TYPE_NONE;
> +                       memset(&mp->u, 0, sizeof(mp->u));
> +                       break;
> +               case TEE_IOCTL_PARAM_ATTR_TYPE_VALUE_INPUT:
> +               case TEE_IOCTL_PARAM_ATTR_TYPE_VALUE_OUTPUT:
> +               case TEE_IOCTL_PARAM_ATTR_TYPE_VALUE_INOUT:
> +                       optee_to_msg_param_value(mp, p);
> +                       break;
> +               case TEE_IOCTL_PARAM_ATTR_TYPE_MEMREF_INPUT:
> +               case TEE_IOCTL_PARAM_ATTR_TYPE_MEMREF_OUTPUT:
> +               case TEE_IOCTL_PARAM_ATTR_TYPE_MEMREF_INOUT:
> +                       if (to_msg_param_rpmi_mem(mp, p))
> +                               return -EINVAL;
> +                       break;
> +               default:
> +                       return -EINVAL;
> +               }
> +       }
> +
> +       return 0;
> +}
> +
> +/* Convert an RPMI parcel reference to a memref; callers own SHM lifetim=
e. */
> +static int from_msg_param_rpmi_mem(struct optee *optee, struct tee_param=
 *p,
> +                                  u32 attr, const struct optee_msg_param=
 *mp)
> +{
> +       struct tee_shm *shm;
> +       u64 offset;
> +
> +       p->attr =3D TEE_IOCTL_PARAM_ATTR_TYPE_MEMREF_INPUT + attr -
> +                 OPTEE_MSG_ATTR_TYPE_PMEM_INPUT;
> +
> +       if (mp->u.pmem.size > SIZE_MAX)
> +               return -EOVERFLOW;
> +       p->u.memref.size =3D mp->u.pmem.size;
> +
> +       if (!mp->u.pmem.nonce) {
> +               /* Return NULL shm. */
> +               if (mp->u.pmem.offs || mp->u.pmem.parcel_id)
> +                       return -EINVAL;
> +               p->u.memref.shm =3D NULL;
> +               p->u.memref.shm_offs =3D 0;
> +               return 0;
> +       }
> +
> +       shm =3D optee_rpmi_get_shm_for_parcel(optee, mp->u.pmem.parcel_id=
,
> +                                           mp->u.pmem.nonce);
> +       if (!shm || mp->u.pmem.offs < shm->offset)
> +               return -EINVAL;
> +
> +       offset =3D mp->u.pmem.offs - shm->offset;
> +       if (offset > SIZE_MAX)
> +               return -EOVERFLOW;
> +
> +       p->u.memref.shm =3D shm;
> +       p->u.memref.shm_offs =3D offset;
> +
> +       return 0;
> +}
> +
> +static int optee_rpmi_from_msg_param(struct optee *optee,
> +                                    struct tee_param *params,
> +                                    size_t num_params,
> +                                    const struct optee_msg_param *msg_pa=
rams)
> +{
> +       size_t n;
> +
> +       for (n =3D 0; n < num_params; n++) {
> +               const struct optee_msg_param *mp =3D msg_params + n;
> +               struct tee_param *p =3D params + n;
> +               u32 attr =3D mp->attr & OPTEE_MSG_ATTR_TYPE_MASK;
> +               int ret;
> +
> +               switch (attr) {
> +               case OPTEE_MSG_ATTR_TYPE_NONE:
> +                       p->attr =3D TEE_IOCTL_PARAM_ATTR_TYPE_NONE;
> +                       memset(&p->u, 0, sizeof(p->u));
> +                       break;
> +               case OPTEE_MSG_ATTR_TYPE_VALUE_INPUT:
> +               case OPTEE_MSG_ATTR_TYPE_VALUE_OUTPUT:
> +               case OPTEE_MSG_ATTR_TYPE_VALUE_INOUT:
> +                       optee_from_msg_param_value(p, attr, mp);
> +                       break;
> +               case OPTEE_MSG_ATTR_TYPE_PMEM_INPUT:
> +               case OPTEE_MSG_ATTR_TYPE_PMEM_OUTPUT:
> +               case OPTEE_MSG_ATTR_TYPE_PMEM_INOUT:
> +                       ret =3D from_msg_param_rpmi_mem(optee, p, attr, m=
p);
> +                       if (ret)
> +                               return ret;
> +                       break;
> +               default:
> +                       return -EINVAL;
> +               }
> +       }
> +       return 0;
> +}
>
> --
> 2.34.1
>
