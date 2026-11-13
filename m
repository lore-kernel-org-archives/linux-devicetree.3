Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794538905;
	b=MhvqZ9XFi3HjUMJnhEV2Dx9T7yZzfu0ioUVCvzXc3/9BMbJ2AjIcqvJnFhyQJhQ8qbs9
	 dWqlWUAE4rVzSPfd69JJI+lQKfpPvzV79qnrRs+WUIFm4PgBcDaRvTwHOzbzxoi0gjzhv
	 MKSHY5uEa2SkGYU7ujugpurnccp6bjWxe4GoQ5g4/nRYv4QcPIVmRukvcHOCqqB/rkGbB
	 VcVDpuzFeIMJR55p933pkGgrZcdhAI10VeysLs2QbWVMzoYwlFapVqNc1xV/Dds9pHl1O
	 xVM2Td1/ZbIuAF1b6WekyhUvxVlHg22TQzh522iufN0yFSo3C6xhjVkFYnH8GKmCxHg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794538905;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=/n02ibHdKwNkEIdwqkanqufcvUyspBItGxBhHyb2qw4=;
	b=AIR8BpvnYyJF9FgrIGEUvQAUy4FKeJIF0a5KbBiAx/J+n3vVaWEY+U/eGeQtsVBmCXVI
	 Elkgfv7gI3UexYrF8sSicDMc3nFniqjMybKFnYVDfEh9p/Pp8YI6IodDFEr+jNUlkb4QG
	 PUPyIddHkneXNTnzjpJ2Yk4UJP9Q12PcjcfYmlW7o//xVUFJi4PsWt1oqavl+o5JvpcwW
	 GsZllt6fDRgL8hEeiL3bgr43LeMgFMe6PjnjQlFN77WxWpn05mDzSCCEg9Mh+Llj3J7kq
	 VOWdaHl4QnrwbxCWdv5Sxd+CbXRa8cge19RMOV1bY0qtsTJ0K2T5sA7betWf97saEPg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=ZtVkKqmw;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F2F10606A31C
	for <devicetree@vger.kernel.org>; Fri, 13 Nov 2026 03:01:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=ZtVkKqmw
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 64DB81F000C4;
	Fri, 13 Nov 2026 03:01:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794538904;
	bh=/n02ibHdKwNkEIdwqkanqufcvUyspBItGxBhHyb2qw4=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=ZtVkKqmw3VEoRGKGNoOeOmLrDTvNzx1EPHYQhyFp5BnMIIEa4hOvYHmOU0z09CAub
	 /jgc8SMeU2JkEfbY/6RNyPocg11+0FDxKNlfoVQKHvjTAI1u/FwBa0WekRgPk2Vyzu
	 rGcXCdyav+b9TbDXGl9R1z6+Rq6KCHwSKn++vpfwnxGxZ40HSSaGRRqzxGd9tXDtiL
	 owas5eafLMkqMTQDzMJj1+y/9zar0JJynU8cyCvYT4sda8sDH5J/UJc1xL9kDP3Nta
	 fkkKgfVgAuuebRCEI4Wd14ZXYGXna+2ZZ1ddE6QpACE9CfSMhT/Qsnvq/xV3VWr8b1
	 iAk+Ih1DI96/g==
Message-ID: <sashiko-outbox-212117@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v17 09/10] qcom-tgu: Add timer/counter functionality for
 TGU
Reply-To: sashiko-reviews@lists.linux.dev
To: "Songwei Chai" <songwei.chai@oss.qualcomm.com>
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20261113024935.3173715-10-songwei.chai@oss.qualcomm.com>
References: <20261113024935.3173715-1-songwei.chai@oss.qualcomm.com>
 <20261113024935.3173715-10-songwei.chai@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 13 Nov 2026 03:01:43 +0000
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list

Thank you for your contribution! Sashiko AI review found 1 potential
issue to consider:
- [High] qcom-tgu: swapped step_index and operation_index in
  tgu_dataset_rw()
--

commit 55838204d9ea620c8df4d9d4233a3561aeb9ea39
Author: Songwei Chai <songwei.chai@oss.qualcomm.com>

qcom-tgu: Add timer/counter functionality for TGU

This commit adds per-step timer and counter sysfs attributes and hardware
register programming for the Qualcomm Trigger Generation Unit (TGU).

> diff --git a/drivers/hwtracing/qcom/tgu.c b/drivers/hwtracing/qcom/tgu.c
> index 6e66752a7b8dd..1cb131a3c5213 100644
> --- a/drivers/hwtracing/qcom/tgu.c
> +++ b/drivers/hwtracing/qcom/tgu.c

[ ... ]

> @@ -496,6 +566,38 @@ static const struct attribute_group tgu_common_grp =
=3D {
>  		.name =3D "step" #step "_condition_select" \
>  	})
> =20
> +#define STEP_TIMER(step_index, reg_num) \
> +	tgu_dataset_rw(reg##reg_num, step_index, TGU_TIMER, reg_num)
> +
> +#define STEP_TIMER_LIST(step_index) \
> +	{STEP_TIMER(step_index, 0), \
> +	 STEP_TIMER(step_index, 1), \
> +	 NULL                       \
> +	}
> +
> +#define TIMER_ATTRIBUTE_GROUP_INIT(step)\
> +	(&(const struct attribute_group){\
> +		.attrs =3D (struct attribute*[])STEP_TIMER_LIST(step),\
> +		.is_visible =3D tgu_node_visible,\
> +		.name =3D "step" #step "_timer" \
> +	})
> +
> +#define STEP_COUNTER(step_index, reg_num) \
> +	tgu_dataset_rw(reg##reg_num, step_index, TGU_COUNTER, reg_num)

[Severity: High]
Do STEP_TIMER() and STEP_COUNTER() initialize operation_index and
step_index in the wrong order via tgu_dataset_rw()?

drivers/hwtracing/qcom/tgu.c:
    struct tgu_attribute {
    	struct device_attribute attr;
    	enum operation_index operation_index;
    	u8 step_index;
    	u8 reg_num;
    };
    ...
    #define tgu_dataset_rw(name, step_index, priority, reg_num)            =
  \
    	(&((struct tgu_attribute[]){ {                                   \
    		__ATTR(name, 0644, tgu_dataset_show, tgu_dataset_store), \
    		step_index,                                              \
    		priority,                                                \
    		reg_num,                                                 \
    	} })[0].attr.attr)

Because tgu_dataset_rw() initializes struct tgu_attribute positionally,
every timer and counter attribute gets tgu_attr->operation_index set to
step_index (0..7) and tgu_attr->step_index set to TGU_TIMER (6) or
TGU_COUNTER (7).

In tgu_node_visible(), tgu_attr->step_index >=3D drvdata->num_step hides all
timer groups when num_step <=3D 6 and all counter groups when num_step <=3D=
 7.
When visible, tgu_dataset_show() and tgu_dataset_store() switch on
operation_index and read or write priority, condition_decode, and
condition_select for steps 6 and 7 instead of drvdata->timer and
drvdata->counter.  Conversely, adding TGU_TIMER (6) and TGU_COUNTER (7) to
enum operation_index causes the existing step 6 and step 7 priority,
condition_decode, and condition_select attributes (which also use
tgu_dataset_rw()) to be dispatched as TGU_TIMER and TGU_COUNTER.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261113024935.3173=
715-1-songwei.chai@oss.qualcomm.com?part=3D9
