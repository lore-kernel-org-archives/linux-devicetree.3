Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1AB9A3CB91E
	for <devicetree@vger.kernel.org>; Thu,  8 Oct 2026 06:51:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=205.220.168.131
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791442314; cv=pass; b=i8o9MOLDl+km7KhbjRDWPF+U5MpSfPFtPk0jNOfCFlGVBsj2YBlAZkRAW/kAoiQcUHQQs31qq3vEmj6Eq0TzPfmK7nMiLys8ulsPTMNysVjffxt2iz0huPWBBTCWg2A/PqIhOa3s1Hbq19Sb+8LTD9zCh6z4COzQYW6j5vZGezQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791442314; c=relaxed/simple;
	bh=jRRakiQzbxB2M2wtTcRutA41AXUApRzuFEaJcKBl1ds=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=jyYoLM+457b//zdwgY2YFU0zFcKfw8QxIYlE+MAGzY7K1NNpeHIOpTH+B0axYNFrDZ+YNjKWKRfyoIEQEUkzFCfOMBbAxdEXzuZicFXuzWAG2PjfxnTsv3+0kYbt55ZtHHADiz53R6f1qRyykuIZ6hV+D/mPSNOz5vpmqrjM/QY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=hiG+lgSQ; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=RH7fUGOX; arc=pass smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="hiG+lgSQ";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="RH7fUGOX"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6984BPVr2774900
	for <devicetree@vger.kernel.org>; Thu, 8 Oct 2026 06:51:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	gE1AM6RH/00M3kKji0VqgiEfLBMfl2yFwGbt+ZdOkog=; b=hiG+lgSQw89SYxy5
	kewaEdtiGpvalWXmZYBSE1f1IqZt9Ezd68ft48rtRdzqBsFoyaTBMFOoTJ8comcK
	Rc/1hsyrXJBrgQ2AiWlaxkaYjfD6+kf2LU6e+5L43ZQCUfHBhZJRJc95MJ8c4kWI
	IYBgWFWMlK0IBmE5pu3+g6GhWlNa6Qwi1jT9HGBYyho13pQweKQj7cTekqAIr6WY
	liEjvQmn4SvM3uiiIe2IRBpW8uzZFFSVrP+F5TD+VbmkIgyKaON3yDPt7cYq7TOJ
	N7qIz+dvRusP95EeEsS7OQjTuuRBx8XZRsX647wh7oG/w8RPAju0WtURTD33RNUn
	7NSQbw==
Received: from mail-yx1-f72.google.com (mail-yx1-f72.google.com [74.125.224.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h5xe69jhf-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Thu, 08 Oct 2026 06:51:52 +0000 (GMT)
Received: by mail-yx1-f72.google.com with SMTP id 956f58d0204a3-677b979065fso7332061d50.2
        for <devicetree@vger.kernel.org>; Wed, 07 Oct 2026 23:51:52 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1791442311; cv=none;
        d=google.com; s=arc-20260327;
        b=HiV7XxfTRPLw5m18pJcvBCJf8RqHe9VopFNtQb7ZhpwnPgB7msPSG5HkM8uWdquFx4
         DExGqw7b3HVrYbGgx5tjjIyqPHRtwqcH5PMaWDom0pU5nQkzr77WFyuqDHKVnAZ8xOUB
         qOqaPxcbp0li73lucwt49MOtBwWvOcWj5WDbMJWYwn9dSJfvTyfJ31r5iE1afEM45CxB
         6b3UixDLdsWc8PqjgtA9Q5bBtwo+OfXeN3fyqla0vyP2N95atvrfVaZUM8BR0FgAENkJ
         6DA63spi37NaLOcVQ0sPZ21Am9zFoDc+bikYuRyk62EUH6t5a23s+koTshWK+wcOAfvc
         hLtw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=gE1AM6RH/00M3kKji0VqgiEfLBMfl2yFwGbt+ZdOkog=;
        fh=BkQ0z9q/I1vJs8+/H2S1ql1qKOPOQhAGkkMN6UaCIBc=;
        b=gKSRfpIMeh6ID4TPTE7T0Khl18TFuvQ+WQbj/vTrxqnMTAtSggqJ8RGQvxaG9zT0hn
         A6EY87s2B+OU9Kxwa1E9Ege9Z6Tkire0YhEbv69WEgAqD04ehVzsWpg9Ll7N5EF/ufUt
         NjVr+x+NXP4Ouk8VB1trvsBRkoStu7IqxLsMxgE64EtRxGaqJY3q7B7zvGGQ08IhmQe4
         5vSd00MTL6B9TWC7pt/nOnCXJCnWDAUx4vhdjgvqmmb0UcSb3RFPWY+B/2w4V3P8JykI
         Gx1V8e6mmh9n0ICTaWLbp+s8N4vUyU5kmqWZu2C7NPwhj3+ECPSDIaElAsQuJJNi/Tch
         HKSw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791442311; x=1792047111; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=gE1AM6RH/00M3kKji0VqgiEfLBMfl2yFwGbt+ZdOkog=;
        b=RH7fUGOXrb+yXd/SE54ZjJIPt4EtWN+fqxIU+Nxp4i6MQxQbRt/YtL9q0rzpvbnUqD
         ie6EbrCNGkYdJtXPLK1LzJ5HPBRek4B2QqjdsUM4Jg63KzD7t4In8Irp9HOefuG99wtB
         ytJHTmylg5msvv8qcSaXTI1/KaQ+f49m/dZ5X3dW9TGI7d39MCsNTOe9mEllezsRqPqt
         f6nJ1+Hs8Y5HpVOvGsh2TwRtCCyQtCFtkaPeTH5yaDyZEDV8yHCXHqsugHbiyAf5MZmK
         RDeDaB0gjVEs/rV+m9SOHR8QoG+aPDth7a9jlH09kZry9G7JD9bQnAwTLBsb+EorAQV+
         KPrg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791442311; x=1792047111;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=gE1AM6RH/00M3kKji0VqgiEfLBMfl2yFwGbt+ZdOkog=;
        b=jbQSKSXl/aCrH3bIPK8a/4v7kPQXzHJKqtGyQfdFQkFULCW2TT42U+/IyPygmax9wk
         tNztM40pNokXon7j/jnIYR9EOmK/v2JPbVDb3Gz2RRrZPK5C0As5POe7HEy0MqEkIdm3
         gzwRz1b+QNiRne/3uPXf5KrDlCCJ4APR2RVd/JZ7wtHmpR1boscKmNXYF2aPcoB89DIK
         2fHbCYsOCSyCvG54VqP4opSOZ/jzeqo20By+eW6ZFZTerT95rLIZLMCvfhRshRqARKmg
         ImRDrl6z8yxNJhxlxB25hzusd6uBM7PyxW07gn8ircwemMRi2NIELM4evD745lTDna+H
         DUxQ==
X-Forwarded-Encrypted: i=1; AKwUvByajWSbSaleOKzVjwmUq7grkmFBSuDkOlMVIb8fJVNF2eI/7y/NH0xtB9FXKTj8hfpYAXOhmgYLbY+R@vger.kernel.org
X-Gm-Message-State: AFq9FYIzKXvALqDovU/wqJLzYcNkJEV6uJjpp6kvHDXGi/LBgPLuhgYF
	OClBGsW8UsqZtB8oBwCNppfcbeUVmAjqAa5ddbQsJ5m74ZB3V7DQBzjnbJN5L6B+JQigCmgsZfT
	K1LTGf1NOtEKGs7OYiMif6k5kjO72vqniHErhCDQSlbQUXDL+7qzJu49r4HIFksTnsrXbK+yklL
	HzAFHoib7CfkWH9I4kLoQPvPfaxUvR3ZkSvgPGlUs=
X-Gm-Gg: AYBFou1b6taZ1Tj8CFJ2mG2PO9kL+36Vgu6BioNwlYDxG7yEoOJn8rmT+tvMLVBscwR
	VfiR2/0XrL7lsFkxuJKwXiJZsL9eQfkqgP2VUAXFppCTQxcNJgWdsmTOLnIxUSpd87JrNAmMvCb
	cZsKI88AXGcPV3yb86GeRarwTnHnr5zqA32Ht7tLYrywwotjKaib+Wt7o=
X-Received: by 2002:a05:690e:438d:b0:675:692d:efea with SMTP id 956f58d0204a3-6790a46d64fmr2007755d50.61.1791442311071;
        Wed, 07 Oct 2026 23:51:51 -0700 (PDT)
X-Received: by 2002:a05:690e:438d:b0:675:692d:efea with SMTP id
 956f58d0204a3-6790a46d64fmr2007748d50.61.1791442310437; Wed, 07 Oct 2026
 23:51:50 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20261005-rpmi-tee-service-grp-dev-v2-0-72f222e23ec1@oss.qualcomm.com>
 <20261005-rpmi-tee-service-grp-dev-v2-2-72f222e23ec1@oss.qualcomm.com>
In-Reply-To: <20261005-rpmi-tee-service-grp-dev-v2-2-72f222e23ec1@oss.qualcomm.com>
From: Jens Wiklander <jens.wiklander@oss.qualcomm.com>
Date: Thu, 8 Oct 2026 08:51:39 +0200
X-Gm-Features: AclHuK_BXfrbJuQ243m10CSA8iWapOM_LML7mBAzAL1LKQNptC5Dz8ZbLgglxz8
Message-ID: <CAGgiveUB4ETEbcfCvagfj6q__jsfPmJoeT_w0xA-9NOZpGNwfQ@mail.gmail.com>
Subject: Re: [PATCH RFC v2 2/8] tee: optee: define the RPMI control and
 parcel-reference ABI
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
X-Proofpoint-ORIG-GUID: 7TeXGsXWitcnWhlfA_V3hZkHFoyVCXqX
X-Authority-Analysis: v=2.4 cv=HcWB3SE8 c=1 sm=1 tr=0 ts=6ac73d88 cx=c_pps
 a=VEzVgl358Dq0xwHDEbsOzA==:117 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=Um2Pa8k9VHT-vaBCBUpS:22 a=EUspDBNiAAAA:8 a=y1CmhHYXhqqenl_sZrYA:9
 a=QEXdDO2ut3YA:10 a=uujmmnXaIg8lM0-o0HFK:22
X-Proofpoint-GUID: 7TeXGsXWitcnWhlfA_V3hZkHFoyVCXqX
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDA4MDAyNyBTYWx0ZWRfX7fzZEomqMZHh
 BnK7xSQImOMKVcjD67+7zFHima0wv0o38aBy/i9Mc67X4MnjNbmNjgbKbKJzCw3yUbbDaXhtisd
 v9CZZHTnyTTBHRKbJjC7XQXYcI5dCn9EnBNnzxXJCt98etCdysQwcUpDJ3EUR5CRcYUPc5fNCPn
 ayu7eHaHzw6yxgKqCHZ3vfGOYpR+8PVSckhx1L2frpMNvftDGHlbCEmp/0S8RZbItK2b9vFxRVE
 eIssAZnJMDlJOYxR3FTyffQUtUwmNxY7MChx8sguEBy/Q0BetgdI7BOMsTBe9xjgZ+FKhdc8wuo
 H9NEejGagsvwpY2wU49dM9JNQMGHuMaY6SIolDKQYGuDjSTTEga4u/mw3T2hAS11tJjCbf+hJ9O
 HDqhR0+F6mN/GqSeqgPIeUfSGtZqxfljqnaFRl+jhgJ848OaTOPsQSfez1qP2VU1+/xNszsbQaK
 IWq7UXzmHS1dp+4n7EA==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDA4MDAyNyBTYWx0ZWRfX7P3UZ0RZ6/z+
 pEeQmzJa9iscA4zob013iPIX5utLPJ1dz2tYSQgc/mkI5mpYCHw0n+eBLAiu61L/VnKa8IOEL+x
 SG19cYYJtNxyy3OzZY3L1M7Tx22dfBk=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-08_02,2026-10-06_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1011 malwarescore=0 spamscore=0 bulkscore=0 adultscore=0
 priorityscore=1501 impostorscore=0 suspectscore=0 phishscore=0
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610020000
 definitions=main-2610080027

Hi Amir,

On Tue, Oct 6, 2026 at 2:40=E2=80=AFAM Amirreza Zarrabi
<amirreza.zarrabi@oss.qualcomm.com> wrote:
>
> Define the OP-TEE service protocol carried by RPMI TEE_CALL payloads.
> Add operations for version and capability queries, shared-memory
> unregistration, asynchronous notification enablement, and yielding-call
> start and resume. Use fixed-width little-endian control fields and RPMI
> error codes for control responses.
>
> Add a parcel memory-reference layout to the common message parameter
> union. Identify shared memory by its parcel ID and nonce, with a 64-bit
> byte offset and size, without changing the message parameter size.
> Encode NULL references with a zero parcel ID and nonce, leaving parcel
> ID zero usable with a nonzero nonce.
>
> Document the wire layouts and ownership rules for matching Linux and
> OP-TEE implementations.
>
> Signed-off-by: Amirreza Zarrabi <amirreza.zarrabi@oss.qualcomm.com>
> ---
>  drivers/tee/optee/optee_msg.h  |  38 +++++--
>  drivers/tee/optee/optee_rpmi.h | 234 +++++++++++++++++++++++++++++++++++=
++++++
>  2 files changed, 264 insertions(+), 8 deletions(-)
>
> diff --git a/drivers/tee/optee/optee_msg.h b/drivers/tee/optee/optee_msg.=
h
> index 6c3043f8da33..028f8cd95fdd 100644
> --- a/drivers/tee/optee/optee_msg.h
> +++ b/drivers/tee/optee/optee_msg.h
> @@ -31,6 +31,9 @@
>  #define OPTEE_MSG_ATTR_TYPE_FMEM_INPUT         OPTEE_MSG_ATTR_TYPE_RMEM_=
INPUT
>  #define OPTEE_MSG_ATTR_TYPE_FMEM_OUTPUT                OPTEE_MSG_ATTR_TY=
PE_RMEM_OUTPUT
>  #define OPTEE_MSG_ATTR_TYPE_FMEM_INOUT         OPTEE_MSG_ATTR_TYPE_RMEM_=
INOUT
> +#define OPTEE_MSG_ATTR_TYPE_PMEM_INPUT         OPTEE_MSG_ATTR_TYPE_RMEM_=
INPUT
> +#define OPTEE_MSG_ATTR_TYPE_PMEM_OUTPUT                OPTEE_MSG_ATTR_TY=
PE_RMEM_OUTPUT
> +#define OPTEE_MSG_ATTR_TYPE_PMEM_INOUT         OPTEE_MSG_ATTR_TYPE_RMEM_=
INOUT
>  #define OPTEE_MSG_ATTR_TYPE_TMEM_INPUT         0x9
>  #define OPTEE_MSG_ATTR_TYPE_TMEM_OUTPUT                0xa
>  #define OPTEE_MSG_ATTR_TYPE_TMEM_INOUT         0xb
> @@ -149,6 +152,23 @@ struct optee_msg_param_fmem {
>         u64 global_id;
>  };
>
> +/**
> + * struct optee_msg_param_pmem - RPMI parcel memory reference
> + * @offs: full-width byte offset from the parcel's first byte
> + * @size: logical reference size, or required size for a short-buffer re=
sponse
> + * @parcel_id: firmware-assigned parcel identifier
> + * @nonce: nonzero REE nonce supplied when sharing the parcel
> + *
> + * A zero parcel ID and nonce encode a NULL reference. Its offset must b=
e zero;
> + * its size is preserved. Parcel ID zero remains valid with a nonzero no=
nce.
> + */
> +struct optee_msg_param_pmem {

Without an internal offset like in struct optee_msg_param_fmem, an
explicit register SHM call into OP-TEE is needed before it can be
used. You'd still need the TEE_MEMORY_PARCEL_CREATE, but we can save
one round-trip into the secure world.

> +       u64 offs;
> +       u64 size;
> +       u32 parcel_id;
> +       u32 nonce;

I wonder if parcel_id and nonce wouldn't be better combined into a
single field. They need to be separate when preparing arguments for
the TEE_MEMORY_* calls. Everywhere else, it's only an opaque memory
handle, and one handle is easier to keep track of than two.

> +};
> +
>  /**
>   * struct optee_msg_param_value - opaque value parameter
>   * @a: first opaque value
> @@ -166,18 +186,19 @@ struct optee_msg_param_value {
>  /**
>   * struct optee_msg_param - parameter used together with struct optee_ms=
g_arg
>   * @attr:      attributes
> - * @tmem:      parameter by temporary memory reference
> - * @rmem:      parameter by registered memory reference
> - * @fmem:      parameter by FF-A registered memory reference
> - * @value:     parameter by opaque value
> - * @octets:    parameter by octet string
> + * @u.tmem:    parameter by temporary memory reference
> + * @u.rmem:    parameter by registered memory reference
> + * @u.fmem:    parameter by FF-A registered memory reference
> + * @u.pmem:    parameter by RPMI parcel memory reference
> + * @u.value:   parameter by opaque value
> + * @u.octets:  parameter by octet string
>   * @u:         union holding OP-TEE msg parameter
>   *
>   * @attr & OPTEE_MSG_ATTR_TYPE_MASK indicates if tmem, rmem or value is =
used in
>   * the union. OPTEE_MSG_ATTR_TYPE_VALUE_* indicates value or octets,
> - * OPTEE_MSG_ATTR_TYPE_TMEM_* indicates @tmem and
> - * OPTEE_MSG_ATTR_TYPE_RMEM_* or the alias PTEE_MSG_ATTR_TYPE_FMEM_* ind=
icates
> - * @rmem or @fmem depending on the conduit.
> + * OPTEE_MSG_ATTR_TYPE_TMEM_* indicates @u.tmem. OPTEE_MSG_ATTR_TYPE_RME=
M_*
> + * and its FMEM/PMEM aliases indicate @u.rmem, @u.fmem or @u.pmem depend=
ing
> + * on the conduit.
>   * OPTEE_MSG_ATTR_TYPE_NONE indicates that none of the members are used.
>   */
>  struct optee_msg_param {
> @@ -186,6 +207,7 @@ struct optee_msg_param {
>                 struct optee_msg_param_tmem tmem;
>                 struct optee_msg_param_rmem rmem;
>                 struct optee_msg_param_fmem fmem;
> +               struct optee_msg_param_pmem pmem;
>                 struct optee_msg_param_value value;
>                 u8 octets[24];
>         } u;
> diff --git a/drivers/tee/optee/optee_rpmi.h b/drivers/tee/optee/optee_rpm=
i.h
> new file mode 100644
> index 000000000000..252216aad09b
> --- /dev/null
> +++ b/drivers/tee/optee/optee_rpmi.h
> @@ -0,0 +1,234 @@
> +/* SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause) */
> +/*
> + * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
> + */
> +#ifndef OPTEE_RPMI_H
> +#define OPTEE_RPMI_H
> +
> +#include <linux/bitops.h>
> +#include <linux/types.h>
> +#include <linux/uuid.h>
> +
> +/*
> + * OP-TEE service ABI over RPMI TEE_CALL.
> + *
> + * Requests and responses are carried in the TEE_CALL service payload.
> + * Control fields are little-endian. Response status fields contain sign=
ed
> + * RPMI error codes, distinct from the outer TEE_CALL status and the GP
> + * command result in optee_msg_arg.ret.
> + */
> +#define OPTEE_RPMI_SERVICE_UUID \
> +       UUID_INIT(0x486178e0, 0xe7f8, 0x11e3, \
> +                 0xbc, 0x5e, 0x00, 0x02, 0xa5, 0xd5, 0xc5, 0x1b)
> +
> +#define OPTEE_RPMI_VERSION_MAJOR               1
> +#define OPTEE_RPMI_VERSION_MINOR               0
> +
> +/**
> + * struct optee_rpmi_probe_req - request without operation-specific argu=
ments
> + * @op: GET_API_VERSION, GET_OS_VERSION or EXCHANGE_CAPABILITIES
> + */
> +struct optee_rpmi_probe_req {
> +       __le32 op;
> +} __packed;
> +
> +/**
> + * struct optee_rpmi_status_resp - response carrying only an RPMI status
> + * @status: signed RPMI error code
> + */
> +struct optee_rpmi_status_resp {
> +       __le32 status;
> +} __packed;
> +
> +/*
> + * Return the service API version.
> + *
> + * Request:  struct optee_rpmi_probe_req
> + * Response: struct optee_rpmi_api_resp
> + */
> +#define OPTEE_RPMI_GET_API_VERSION     0
> +
> +/**
> + * struct optee_rpmi_api_resp - GET_API_VERSION response
> + * @status: signed RPMI error code
> + * @major: incompatible protocol revision
> + * @minor: compatible protocol revision
> + */
> +struct optee_rpmi_api_resp {
> +       __le32 status;
> +       __le32 major;
> +       __le32 minor;
> +} __packed;

Why do these communication structs have to be packed? With careful
design of the layout, padding, alignment, etc, it shouldn't be an
issue.

> +
> +/*
> + * Return the trusted OS revision, not the service API revision.
> + *
> + * Request:  struct optee_rpmi_probe_req
> + * Response: struct optee_rpmi_os_resp
> + */
> +#define OPTEE_RPMI_GET_OS_VERSION      1
> +
> +/**
> + * struct optee_rpmi_os_resp - GET_OS_VERSION response
> + * @status: signed RPMI error code
> + * @major: trusted OS major revision
> + * @minor: trusted OS minor revision
> + * @reserved: must be zero
> + * @build_id: trusted OS build identifier, zero if unspecified
> + */
> +struct optee_rpmi_os_resp {
> +       __le32 status;
> +       __le32 major;
> +       __le32 minor;
> +       __le32 reserved;
> +       __le64 build_id;
> +} __packed;
> +
> +/*
> + * Query secure-world capabilities and limits.
> + *
> + * Request:  struct optee_rpmi_probe_req
> + * Response: struct optee_rpmi_caps_resp
> + */
> +#define OPTEE_RPMI_EXCHANGE_CAPABILITIES       2
> +
> +/**
> + * struct optee_rpmi_caps_resp - EXCHANGE_CAPABILITIES response
> + * @status: signed RPMI error code
> + * @secure_caps: reserved for future optional features; zero in version =
1
> + * @rpc_param_count: nonzero parameter capacity of each RPC argument buf=
fer
> + * @notification_count: nonzero logical key count, including synchronous=
 keys
> + *                     Keys range from zero through notification_count -=
 1.
> + *
> + * Version 1 defines no capability bits. Unknown bits are ignored by Lin=
ux
> + * for compatibility with future extensions.

Note that we expect the ABI version to stay at 1.0 for a foreseeable
future. Extensions to the ABI are primarily negotiated using
capabilities.

Cheers,
Jens

> + */
> +struct optee_rpmi_caps_resp {
> +       __le32 status;
> +       __le32 secure_caps;
> +       __le32 rpc_param_count;
> +       __le32 notification_count;
> +} __packed;
> +
> +/*
> + * Unregister a shared parcel from OP-TEE.
> + *
> + * Request:  struct optee_rpmi_unregister_req
> + * Response: struct optee_rpmi_status_resp
> + */
> +#define OPTEE_RPMI_UNREGISTER_SHM      3
> +
> +/**
> + * struct optee_rpmi_unregister_req - retire a shared parcel in OP-TEE
> + * @op: OPTEE_RPMI_UNREGISTER_SHM
> + * @parcel_id: parcel to retire; zero is valid with a nonzero nonce
> + * @nonce: nonzero nonce associated with the parcel
> + *
> + * Success means OP-TEE stopped using the mapping and released its recei=
ver
> + * interest.
> + */
> +struct optee_rpmi_unregister_req {
> +       __le32 op;
> +       __le32 parcel_id;
> +       __le32 nonce;
> +} __packed;
> +
> +/*
> + * Enable asynchronous notification delivery.
> + *
> + * Request:  struct optee_rpmi_enable_notif_req
> + * Response: struct optee_rpmi_status_resp
> + */
> +#define OPTEE_RPMI_ENABLE_ASYNC_NOTIF  4
> +
> +/**
> + * struct optee_rpmi_enable_notif_req - bind an incoming RPMI doorbell
> + * @op: OPTEE_RPMI_ENABLE_ASYNC_NOTIF
> + * @signal_id: allocated TEE-to-REE signal, not a logical notification k=
ey
> + *
> + * Success activates delivery and raises the doorbell for pending work.
> + * Raising the signal requests OPTEE_MSG_CMD_DO_BOTTOM_HALF.
> + * OPTEE_MSG_CMD_STOP_ASYNC_NOTIF stops future doorbell generation, but =
does
> + * not drain already-raised signals or release the signal ID.
> + */
> +struct optee_rpmi_enable_notif_req {
> +       __le32 op;
> +       __le32 signal_id;
> +} __packed;
> +
> +/*
> + * Start a yielding command using shared command and RPC arguments.
> + *
> + * Request:  struct optee_rpmi_call_req
> + * Response: struct optee_rpmi_call_resp
> + */
> +#define OPTEE_RPMI_YIELDING_CALL_WITH_ARG              5
> +
> +#define OPTEE_RPMI_YIELDING_CALL_RETURN_DONE           0
> +#define OPTEE_RPMI_YIELDING_CALL_RETURN_RPC_CMD                1
> +#define OPTEE_RPMI_YIELDING_CALL_RETURN_INTERRUPT      2
> +
> +/**
> + * struct optee_rpmi_call_req - start a yielding command
> + * @op: OPTEE_RPMI_YIELDING_CALL_WITH_ARG
> + * @parcel_id: argument parcel identity
> + * @nonce: nonce associated with the parcel
> + * @flags: zero in version 1
> + * @arg_offset: command argument byte offset from the parcel's first byt=
e
> + * @rpc_offset: RPC argument byte offset from the parcel's first byte
> + * @arg_size: command argument extent in bytes
> + * @rpc_size: RPC argument capacity in bytes
> + *
> + * Firmware validates ownership, RW access, alignment and disjoint range=
s.
> + * RPMI_ERR_BUSY rejects an initial request without acquiring call owner=
ship.
> + */
> +struct optee_rpmi_call_req {
> +       __le32 op;
> +       __le32 parcel_id;
> +       __le32 nonce;
> +       __le32 flags;
> +       __le64 arg_offset;
> +       __le64 rpc_offset;
> +       __le32 arg_size;
> +       __le32 rpc_size;
> +} __packed;
> +
> +/**
> + * struct optee_rpmi_call_resp - yielding command response
> + * @status: signed RPMI error code, distinct from the command's GP resul=
t
> + * @result: OPTEE_RPMI_YIELDING_CALL_RETURN_* value when status is succe=
ss
> + * @resume_token: zero for DONE, nonzero opaque token for a suspended co=
mmand
> + *
> + * DONE releases all access to the call's argument and RPC ranges. RPC_C=
MD
> + * requests RPC command handling; INTERRUPT requests resumption without =
an
> + * RPC command. Tokens belong to one accepted call, service and caller.
> + */
> +struct optee_rpmi_call_resp {
> +       __le32 status;
> +       __le32 result;
> +       __le64 resume_token;
> +} __packed;
> +
> +/*
> + * Resume a suspended yielding command.
> + *
> + * Request:  struct optee_rpmi_resume_req
> + * Response: struct optee_rpmi_call_resp
> + */
> +#define OPTEE_RPMI_YIELDING_CALL_RESUME        6
> +
> +/**
> + * struct optee_rpmi_resume_req - resume a suspended command
> + * @op: OPTEE_RPMI_YIELDING_CALL_RESUME
> + * @reserved: must be zero
> + * @resume_token: token from the preceding response for this call
> + *
> + * Resume must not return RPMI_ERR_BUSY.
> + */
> +struct optee_rpmi_resume_req {
> +       __le32 op;
> +       __le32 reserved;
> +       __le64 resume_token;
> +} __packed;
> +
> +#endif /* OPTEE_RPMI_H */
>
> --
> 2.34.1
>
