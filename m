Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794538767;
	b=nHZIOCTbi+rwsehA8Mt6+2SEgf3Ya61kDHkyWidKNGsgDjlNgt6Aafuflo6Z5GLd3wK0
	 7a5HsNUli6Vo5b7j5dXYrt91CnqsBvklDaAq7ZG6igPQxb/IUKq4sRyWFTqDB1kWaj8Pc
	 SmVwSdl/fYpfnsrHa8COU7ypdvMnY6jmHfVkAgtf8NBQ7xQqcTowSkbumz9c9qzT1GmWQ
	 eCYTmi5YpZo9Ct1i1btmFSflIcGiOMkScNoWZ6E99fJlWa/O8XmqTLkRHSKSRCScuq7Qw
	 ykwZVL0sDV9gg4UMsKPjCNES26Eb93wB3DK3JkCZ/spEkmTRIpq90CQ2a5a25+cK9Pg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794538767;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=0l2Q/YWIyyS5OcNdAcg9yBMONTySPcmefrcKgVfk0jk=;
	b=mNL9vsIhzlCq6w/+QD+w2uaS/vpdGiDnEDvVG/G0KwAsfIkP5pM/qbLz/5xFrMUC+iVx
	 V1mPXJ20YtenCsucDo5KxJEGKNjOF0PS451xGR4vbAjxpsHeyx7Qw/pKnOmOlRfo12Hcw
	 8I6TdXk4UA4H1zpxkAFsTccZuIRzr4WP2NTg0tFxV3+rRTygjz/OIipjT7h1YCkccQcft
	 kc+FA27UJmfSWqbupl6lWDEE9EKc21KOLkPr6ltfneKE4sg/InYzkZewwAiI0m/q31GCl
	 e4e39rzKufE6SC6CCrvAMHR6P4Hkmnf2YlhKo/CvrtUbjJ7U6zKdPh8FiZbKfQndrNA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=HnYYQbFt;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6AA1A606A31C
	for <devicetree@vger.kernel.org>; Fri, 13 Nov 2026 02:59:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=HnYYQbFt
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C2DAE1F000C4;
	Fri, 13 Nov 2026 02:59:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794538766;
	bh=0l2Q/YWIyyS5OcNdAcg9yBMONTySPcmefrcKgVfk0jk=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=HnYYQbFtHVZHQdr3vSlDPhs0hYX3CkCGNrzTrf0HczgOxISDAcyekOOzLLTdSmacH
	 sSRxnX1z/JbHgnOoNPZpdEqbB65FR0tUqoUTmJJKWrxuPscT1xkJJf5xbzj23Yavx9
	 +mkXzX1NG4SR0KP15IxdBclcsp5VvL86t7A9B918QUKZzVYOF6ovCbiGa5T0jpkIIT
	 wvNI8D7C9v7nbtAeHC5I1h7iNzRFTbGp6Zpu8MufDQDNeY2wagLUDl2QVFQIyr4EjD
	 l/ek5RCHm8v6YcgWUvWRAPxoRxf0JdhacOPLNpFooxlP/oMoLKEDz3yYotjCrfHxvp
	 d1eeIuGu4ZKEA==
Message-ID: <sashiko-outbox-212113@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v17 06/10] qcom-tgu: Add TGU decode support
Reply-To: sashiko-reviews@lists.linux.dev
To: "Songwei Chai" <songwei.chai@oss.qualcomm.com>
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20261113024935.3173715-7-songwei.chai@oss.qualcomm.com>
References: <20261113024935.3173715-1-songwei.chai@oss.qualcomm.com>
 <20261113024935.3173715-7-songwei.chai@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 13 Nov 2026 02:59:26 +0000
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
- [High] qcom-tgu: transposed step_index and operation_index in
  tgu_dataset_rw()
--

commit be12a60019509b692fe89759e5c9e8345578b9d2
Author: Songwei Chai <songwei.chai@oss.qualcomm.com>

qcom-tgu: Add TGU decode support

This commit adds sysfs attributes and register programming for the
per-step condition decode registers on the Qualcomm TGU.

> diff --git a/drivers/hwtracing/qcom/tgu.c b/drivers/hwtracing/qcom/tgu.c
> index c00e95e68214c..72b98a96d7f20 100644
> --- a/drivers/hwtracing/qcom/tgu.c
> +++ b/drivers/hwtracing/qcom/tgu.c
> @@ -18,8 +18,8 @@
> =20
>  struct tgu_attribute {
>  	struct device_attribute attr;
> +	enum operation_index operation_index;
>  	u8 step_index;
> -	u8 priority;
>  	u8 reg_num;
>  };

[Severity: High]
Does placing operation_index before step_index in struct tgu_attribute
transpose the two fields in every attribute initialized by
tgu_dataset_rw()?

tgu_dataset_rw() uses positional initialization and still passes
step_index before the priority/operation argument:

drivers/hwtracing/qcom/tgu.c:
    #define tgu_dataset_rw(name, step_index, priority, reg_num)            =
  \
    	(&((struct tgu_attribute[]){ {                                   \
    		__ATTR(name, 0644, tgu_dataset_show, tgu_dataset_store), \
    		step_index,                                              \
    		priority,                                                \
    		reg_num,                                                 \
    	} })[0].attr.attr)

As a result, operation_index receives step_index (0..7) and step_index
receives the priority or TGU_CONDITION_DECODE (4).  In
tgu_node_visible(), tgu_dataset_show(), and tgu_dataset_store(), this
hides attributes for steps 5..7, maps step[0:3]_condition_decode to
drvdata->priority at step 4, and transposes step and priority indices.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261113024935.3173=
715-1-songwei.chai@oss.qualcomm.com?part=3D6
