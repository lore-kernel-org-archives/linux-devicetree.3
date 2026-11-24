Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795541190;
	b=VAw4PzCDwS9FtlSEtafpg3LObU4jvWw3AjiLxbpdDvK16igGm5Udzn081RxDbG5CErbj
	 4ZMC4efSVIq9yxTffRYyoYwUVhvnWommjkwjgSaMTKaF+VNxCMpaGDfgJFbX9pACUurdE
	 995rW80olJ/8GqqYOstWDsXWQanQ3KbNuJBfYistp0eqvzdAIRs37b+RLbvXQIG2DdsYh
	 Qvaqbi+julLUvKPS5pQyMihwnf5Dc3eqLLtLtPuLT8mkDObTduHaP+0TPxVL1Y7mmXNBH
	 HW70iq/+Xl04+QLeu7Pm4+letJnh197rULpDEvk6FFKg29ptEknL9MKZOul0JZEarhA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795541190;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=J2AoWoSjjK8S69y4oOlUF/j+lJvLa8I46KnthgR02Sc=;
	b=xBUekk/fs2zyYFuih0jtewzXwrl4tLhriJlmdTQ4WM+dPoLwakDxBD/Q5h2VxIxGOffJ
	 LtMoLcilNrfjvO/qhpcW77SHMDgIJOg36b9INDYEI7byfyED7x7KvZKY5bBBTA9og5bah
	 yWrMLZMQd4qmEAnbKriCUOF0Ch08U0U1cVpc+9lXVS5yjPs/5MKdaFkS68hYY84FmMnP1
	 nlVMqX4QDl3YVkTszE1rba2XWNVFZIbbW70i/IkVbTaPfNVnHvLeoFNjO5ZbCe7NKP8Sh
	 SVY2CA6fQ/JUBr2geJ/pPOzlLa3OErdJ07+4BI4Y/qXrAu17y8WhzyXBTtysn3/2KgQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Yv2xxhph;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5239B606A32E
	for <devicetree@vger.kernel.org>; Tue, 24 Nov 2026 17:26:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Yv2xxhph
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8874F1F000CF;
	Tue, 24 Nov 2026 17:26:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795541189;
	bh=J2AoWoSjjK8S69y4oOlUF/j+lJvLa8I46KnthgR02Sc=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=Yv2xxhphLbI12TCxMJRHs/YQqaCCRK+wWZCcq+0PfPZ2awBzNaOrnQFbqgsO+ZEmJ
	 7AoiAGLSK+SK0bZTTZ4RFRYwOJ6Dqblb3tFo1n+DBJ2ZyT4EaNOCefNrm2WH9+ztTt
	 C1VCEsQiek5WY5Di/+QdasAmioxMAVCUAZYaTihiXgGjB2H2FLFOY/Z7kc+JTUmCvW
	 97SQScDC0FT45OExO7Z6jCMUcn0Bt7WAPQshPpjv1ZdTxlbmH+wuI7eHS922DID/JX
	 1Qr8YrPSmW4yQIpBCU9VBYru1hhEgw7uP0JMSrFiWgpF2HBekoz5YZK5lVp5Rf42xG
	 0qbWoZc+jD/Ww==
Message-ID: <sashiko-outbox-231703@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 17/24] media: uapi: Add statistics structs to
 mali-c720-config.h
Reply-To: sashiko-reviews@lists.linux.dev
To: "Anthony McGivern" <anthony.mcgivern@arm.com>, devicetree@vger.kernel.org
Cc: robh@kernel.org, conor+dt@kernel.org, media-ci@linuxtv.org
In-Reply-To: <20261124-b4-initial-upstream-candidate-v1-17-0cb9bde1bd30@arm.com>
References: <20261124-b4-initial-upstream-candidate-v1-0-0cb9bde1bd30@arm.com>
 <20261124-b4-initial-upstream-candidate-v1-17-0cb9bde1bd30@arm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 24 Nov 2026 17:26:29 +0000
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
- [Low] media: uapi: undocumented MALI_C720_STATS_MAX in enum
  mali_c720_stats_type
--

commit 69f08e39ef3ea35be2a6109a1c325ef3b69ded6d
Author: Anthony McGivern <Anthony.McGivern@arm.com>

media: uapi: Add statistics structs to mali-c720-config.h

This commit adds the UAPI header definitions describing the 3A statistics
buffer format for the Mali-C720 ISP.

> diff --git a/include/uapi/linux/media/arm/mali-c720-config.h b/include/ua=
pi/linux/media/arm/mali-c720-config.h
> new file mode 100644
> index 0000000000000..445cae09a84cc
> --- /dev/null
> +++ b/include/uapi/linux/media/arm/mali-c720-config.h
> @@ -0,0 +1,184 @@

[ ... ]

> +/**
> + * enum mali_c720_stats_type - Mali-C720 statistics block targets
> + * @MALI_C720_STATS_NOOP: No data; skip the block using its size.
> + * @MALI_C720_STATS_HISTOGRAM_INP: Input histogram statistics.
> + * @MALI_C720_STATS_HISTOGRAM_HV: HV histogram statistics (pre-Iridix).
> + * @MALI_C720_STATS_HISTOGRAM_HV_IRIDIX: HV histogram statistics (post-I=
ridix).
> + * @MALI_C720_STATS_COLOR_HV: HV color statistics.
> + */
> +enum mali_c720_stats_type {
> +	MALI_C720_STATS_NOOP,
> +	MALI_C720_STATS_HISTOGRAM_INP,
> +	MALI_C720_STATS_HISTOGRAM_HV,
> +	MALI_C720_STATS_HISTOGRAM_HV_IRIDIX,
> +	MALI_C720_STATS_COLOR_HV,
> +	MALI_C720_STATS_MAX,
> +};

[Severity: Low]
Should MALI_C720_STATS_MAX be documented in the kernel-doc comment or
marked with /* private: */?  As written, scripts/kernel-doc warns that
MALI_C720_STATS_MAX is not described in enum mali_c720_stats_type.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261124-b4-initial=
-upstream-candidate-v1-0-0cb9bde1bd30@arm.com?part=3D17
