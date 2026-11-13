Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794538783;
	b=xXrgX3mO0BShQRu2pfOl3JvRr+NW5lN/UuVU2GRLNWYSMxS05Wg3ccV0r2m9/21bSp9R
	 VV9w/t0lz1T6dRb4wRn9wqHAl+oyTggBe/e2U9CdS0V372LrOLYLf1moRHY7QQitVH/gb
	 nn6+CQh24q7Zq9acC0egttLYjPZ0W2IRmvGp67ZBz+1dJDJ3+UHEwfmrlqCJ7ZSBTWXXB
	 1eIve0lLm7ChzIgzGhmT1tEQMzmhIxCyNDOP8C8smML1a762rl+VwW8OmkD/BTSO9muxs
	 6mE7I9deBoFItmRbVG7AdAyMj5tHbRBS8Y5x2TlYylpDsi2sxlN1q8U/KzVRa5hOvEg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794538783;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=PZORG+OoNFXuwkpbneXF8Ax+y3CLXeOAO/yiyXX7Cjo=;
	b=jjgNM1HCYyk9B7yPATNTAeJ5ZM6kJZXa+zAzXOEfvg1maFzsvGsGWAEqs93y/N9948xX
	 QksQXjmfEPGwxdnoeva2RIrSgQ6nMqfzJfYK5eCC8OQyOO2UcMOv+kn91fRkJXNy+5yc0
	 XFGrRkBwZEtXcbO9ddGjteQ0MniuXBgeRrGOxdK4hPJj8y8nP9liMD0r9EoQilidfrDHW
	 768OMwr1OZWabgN/MrepG9P3PCX4QuflcYPg07z8VHKR/i9MDlZIUsVsRW+NmeKCLiRQd
	 uhBc2Nw2ni6Mvlc0qawzywNU3hKDfTHXNqAROGQhHC/L/f1H2ctIj8HbHNlK6dnhpBQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Ev8WL0PF;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 08E42606A321
	for <devicetree@vger.kernel.org>; Fri, 13 Nov 2026 02:59:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Ev8WL0PF
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6BB111F000C4;
	Fri, 13 Nov 2026 02:59:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794538782;
	bh=PZORG+OoNFXuwkpbneXF8Ax+y3CLXeOAO/yiyXX7Cjo=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=Ev8WL0PFawLe4RNRKmiXZsW4vNlE5jg0V0J3K5Fr0BJkkxLmMCiRoQh+Qf1gmShmf
	 /iuV5b34n1u+kE5nWKavbd79/iaMHMNTK2KvD1wlINuSm4eP/vkZcweGR7GzYia4nj
	 wFz11gkbFd7UDafRioaoSJNpcNqUpzIACjzhYRwUCrBH+YYnBNvdgPjCnCpiw9onU/
	 8TGw6f2VSlcUNtqw7oAMztqWrlKVj8Xs4PI5D+ziVJ66hqQHRwU2EHGLD1aaXzEhIQ
	 Kaut64YbsIRjdFwNGsuE98hqyCZ+RM9Olj3wcIjiRCaWLjyl2fGpvWEnPQ+s7VjZdL
	 7vOkUuTAaaDOw==
Message-ID: <sashiko-outbox-212115@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v17 07/10] qcom-tgu: Add support to configure next
 action
Reply-To: sashiko-reviews@lists.linux.dev
To: "Songwei Chai" <songwei.chai@oss.qualcomm.com>
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20261113024935.3173715-8-songwei.chai@oss.qualcomm.com>
References: <20261113024935.3173715-1-songwei.chai@oss.qualcomm.com>
 <20261113024935.3173715-8-songwei.chai@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 13 Nov 2026 02:59:42 +0000
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
- [High] qcom-tgu: swapped operation_index and step_index in
  tgu_dataset_rw()
--

commit 39b03844fdda185e25e4736b4873ab4173c403fb
Author: Songwei Chai <songwei.chai@oss.qualcomm.com>

qcom-tgu: Add support to configure next action

This commit adds per-step condition_select sysfs attribute groups,
including numbered select registers and a default next-action register,
and flushes their staged values to the TGU hardware when enabled.

> diff --git a/drivers/hwtracing/qcom/tgu.c b/drivers/hwtracing/qcom/tgu.c
> index 72b98a96d7f20..6e66752a7b8dd 100644
> --- a/drivers/hwtracing/qcom/tgu.c
> +++ b/drivers/hwtracing/qcom/tgu.c
[ ... ]
> @@ -409,6 +473,29 @@ static const struct attribute_group tgu_common_grp =
=3D {
>  		.name =3D "step" #step "_condition_decode" \
>  	})
> =20
> +#define STEP_SELECT(step_index, reg_num) \
> +	tgu_dataset_rw(reg##reg_num, step_index, TGU_CONDITION_SELECT, reg_num)
> +
> +#define STEP_SELECT_DEFAULT(step_index) \
> +	tgu_dataset_rw(default, step_index, TGU_CONDITION_SELECT, \
> +			TGU_SELECT_DEFAULT_REG)

[Severity: High]
Does STEP_SELECT() initialize tgu_attribute with operation_index and
step_index swapped?

struct tgu_attribute declares operation_index before step_index, whereas
tgu_dataset_rw() uses positional initialization with step_index before the
operation enum:

drivers/hwtracing/qcom/tgu.c:
struct tgu_attribute {
	struct device_attribute attr;
	enum operation_index operation_index;
	u8 step_index;
	u8 reg_num;
};
...
#define tgu_dataset_rw(name, step_index, priority, reg_num)              \
	(&((struct tgu_attribute[]){ {                                   \
		__ATTR(name, 0644, tgu_dataset_show, tgu_dataset_store), \
		step_index,                                              \
		priority,                                                \
		reg_num,                                                 \
	} })[0].attr.attr)

Every step[0:7]_condition_select attribute ends up with operation_index =3D
0..7 and step_index =3D TGU_CONDITION_SELECT (5).  In tgu_node_visible(),
this hides all condition_select groups when drvdata->num_step <=3D 5.  When
drvdata->num_step > 5, the default attributes and step[6:7]_condition_select
remain hidden, accesses to step[0:4]_condition_select/reg[0:3] read and
write drvdata->priority or drvdata->condition_decode for step 5, and
step5_priority[0:3] and step5_condition_decode (which have
operation_index =3D 5) are misrouted to TGU_CONDITION_SELECT for steps 0..4.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261113024935.3173=
715-1-songwei.chai@oss.qualcomm.com?part=3D7
