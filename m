Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795540807;
	b=UeKLrpVXHPA/1Oj4ena5YOfdrswNwtPtBlFgce5sYUtk/SbmT+zbiDERxhN2SmGD7qIC
	 Bkw6dQLaLdHkH1XwkRIWeM+orD/bLKl43BdOIT2A5eyAHJHcEAQ+gm250YYYLlACYHng+
	 kW4o4XoS9myfMMa0z56evJoa2kLKvulmfZU1lZXRIilfQGXQPHqK9A0OiYsGuAxmNvLxD
	 rRk+hYjrfA8aV2DO0QmOxf1j72kA4NzSIN6InQpQtz9SFOJCIEzXNAKaj+9DdzkY23wgb
	 b3BOTAyjPOSEIdFFPs+uWcqIYF++A0/9s/nNefL75c8JHDRAdCi7cmT7gNWjl75aWiA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795540807;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=D4xZGfl4dCrhY50PM6LNuVrmjcxNmbtxKMhQspfS93I=;
	b=BhOlv2CrCvVC+D7xUtEqzfp4kn1SOSyRprDvZ5jl1HYTl9igYPMtuDLJswoXMx10RjA7
	 shoBxkQwebissGDF3kniCc7XOgaEH17XmHozMk48NmUSt3pBKF3HBShrZs2HYROjeEHAz
	 SSzmAJdxCNCGgJf8o4j37BqoAQSme94Vl9v4nYpRBHKHFj4ieCs8eOM+gvvob8BuPRL7a
	 6beNNquDhU60v2efD9LQGTpMDt//+40D5WI05rldJnfGPAbADB9LMsdPGGFu1XXXgoy3Y
	 oIYzyKwVq5WclmGhPKN/1TmVbtCh42hTWW69vMNBf27nFtWwM2Fx4zdyh0tjnLpBMeQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=OR6NF2Iq;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9A41B606A32D
	for <devicetree@vger.kernel.org>; Tue, 24 Nov 2026 17:20:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=OR6NF2Iq
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2A3FD1F000F4;
	Tue, 24 Nov 2026 17:20:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795540807;
	bh=D4xZGfl4dCrhY50PM6LNuVrmjcxNmbtxKMhQspfS93I=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=OR6NF2IqNkgqSYn4LbL+xvRiOaHqroOQ38ctOQw7cgbFWfQiwdBMcfxYvxbW4rTAd
	 0MMzo0bJJLe4Mgm9YeDdhPZGJPB95zOH5km6Ebduf9dlro8GW1sXw4/n+i9TjbAtCh
	 RyAumQQMgU+jju805q9LpU8yIzK2n9MdaKEjIE8A7qIwo6N3DPpBM34AqM9HZK4buY
	 ukmTd2WxzE/0rOJMc5cH7WnWWOVMp99XCmmm9cXyuLkpGBDU/rwGTvtiHuS/BLWfYQ
	 AFuqxzzkzzrjuRvbonK+7fVx1Hm3WPb382SgBt51l1+G0JdDxKv/p2N55ZyxyVD7iy
	 wBC2+cTdZeieQ==
Message-ID: <sashiko-outbox-231688@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 15/24] media: Documentation: Add Mali-C720 ISP
 documentation
Reply-To: sashiko-reviews@lists.linux.dev
To: "Anthony McGivern" <anthony.mcgivern@arm.com>, devicetree@vger.kernel.org
Cc: robh@kernel.org, conor+dt@kernel.org, media-ci@linuxtv.org
In-Reply-To: <20261124-b4-initial-upstream-candidate-v1-15-0cb9bde1bd30@arm.com>
References: <20261124-b4-initial-upstream-candidate-v1-0-0cb9bde1bd30@arm.com>
 <20261124-b4-initial-upstream-candidate-v1-15-0cb9bde1bd30@arm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 24 Nov 2026 17:20:06 +0000
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list

Thank you for your contribution! Sashiko AI review found 2 potential
issues to consider:
- [Low] media: Documentation: short title underline in mali-c720.rst
- [Low] media: Documentation: unreferenced footnote [3] in mali-c720.rst
--

commit c4c33a88cca59317f92c1365b5db2c5c6579612d
Author: Anthony McGivern <Anthony.McGivern@arm.com>

media: Documentation: Add Mali-C720 ISP documentation

This commit adds admin-guide documentation and a media graph topology
diagram for the Arm Mali-C720 ISP driver.

> diff --git a/Documentation/admin-guide/media/mali-c720.rst b/Documentatio=
n/admin-guide/media/mali-c720.rst
> new file mode 100644
> index 0000000000000..3ff2cb3170f25
> --- /dev/null
> +++ b/Documentation/admin-guide/media/mali-c720.rst
> @@ -0,0 +1,370 @@

[ ... ]

> +Capturing Bayer data and processing it to RGB
> +--------------------------------------------

[Severity: Low]
The hyphen underline here is 44 characters long for a 45-character title,
which triggers a "Title underline too short" warning during make htmldocs.

[ ... ]

> +References
> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> +
> +.. [1] https://git.linuxtv.org/v4l-utils.git/
> +.. [2] https://git.ideasonboard.org/yavta.git/
> +.. [3] https://support.arm.com/compute-ip/mali-c720ae

[Severity: Low]
Is footnote [3] supposed to be referenced in the text above?  Without a
corresponding [3]_ reference, Sphinx emits a "Footnote [3] is not
referenced" warning when building the documentation.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261124-b4-initial=
-upstream-candidate-v1-0-0cb9bde1bd30@arm.com?part=3D15
