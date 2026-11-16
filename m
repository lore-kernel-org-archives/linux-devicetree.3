Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794835783;
	b=n/uV8aeoMMmlfQ1KAJVx20Z8K5tk/3Kk8teNRV0WLRpMJIHmtyoBlx9j+ZsBqHF279S2
	 oprueevRghLyYELDkVV05uhkqO7D9q7KB8AD7cRgqt+hIOXxSBTmHvhBLTbtpm92ce/6Q
	 3NgDSqPNF8Ie2+FB6NxZJDJ2aaRWB/qGkKNqeJXC32DfwXpjWIdFmTfsO3cjnTWMG1h1j
	 QlqgIaSSXvdEUFDC6sGX3uUDS8DGsLLmhUieF6qcRloerbkqs04xwQg69hK8TaiDj54YS
	 GqIDWZCUTxkWLyeCem8D8+ep8wn0Oa5QnlWjWg7Ntv5qSbYz1Y55vX7SyOycGPiOvmg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794835783;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=ssAcmNAZ6RN1gnXKQZLC1kAwUmpHr5/zWN4C19jJBZM=;
	b=D5EygA/Qh1krj989FLpY0msqZ3FXZcH51O1B+a9rdy3VtKy/DTro+4r2ZBIAL2A+zdhc
	 4G+VqAYNBk2OjSihK0yFWggeBViFq2rwVoTmBYFAiEIlTdESSNxfdOA2O9ztdJmjpzmac
	 eUbdmBJ4Ekzu1r3KhUnpCHBOUaBTcljNynpf4bXPETT8vcuGSGUfLhQyKDl8oYsHdbWop
	 H6qnFR86UjwYd0zNN7YEuiZEp2ZTFuyVCDSoL+tdLzMYAjp2juGL/LzAxLqS7jaqakABr
	 12idXGZQk7qKHDO2udihh6S7dFpqHf0iRm37UAEYTFeNbsrnidZtHsM/D5XR1YdIO9Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=VVAnmS5H;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 87CFE606A31C
	for <devicetree@vger.kernel.org>; Mon, 16 Nov 2026 13:29:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=VVAnmS5H
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 989CB1F000C4;
	Mon, 16 Nov 2026 13:29:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794835783;
	bh=ssAcmNAZ6RN1gnXKQZLC1kAwUmpHr5/zWN4C19jJBZM=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=VVAnmS5HucW555DGB0cnlLirQxX5V21JVSm76suMJtSGcBCCBtFY8iJQ3ffjH51ut
	 2eObnuk99y7Q6LJw3pLygVqKHj0EXSRsjzWW9uyaygIFgDKqpgI3vIpdHRTwdI7AHt
	 ilBpDZm99vZ2K4YGGQhxuvjqQyrNMytihC7kDSXzEq1FuzJ5Ul5E+qhSBNWqc8Br66
	 ZII9/ThWX5SqmEFLy63bvifnPF12r5fU837+TJXaZqQK/Hr1NwEaOcQiBOvMQN3RY8
	 MmnDeVciWx1iVhHwyoXTpCbspwfZSq+PcJA5pYOJBkEuFYkSEg4z3SID7xhVzfjQIC
	 eaUzubUIY3Snw==
Message-ID: <sashiko-outbox-217078@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v3 06/11] drm/msm/dpu: Fix DSI tear interrupts broken by
 adding INTF_9 and INTF_10
Reply-To: sashiko-reviews@lists.linux.dev
To: "Nabige Aala" <nabige.aala@oss.qualcomm.com>
Cc: linux-phy@lists.infradead.org, devicetree@vger.kernel.org, dri-devel@lists.freedesktop.org, robh@kernel.org, conor+dt@kernel.org, vkoul@kernel.org, neil.armstrong@linaro.org, olteanv@gmail.com
In-Reply-To: <20261116-nord-drv-dt-v3-6-e3d3bf0e2c49@oss.qualcomm.com>
References: <20261116-nord-drv-dt-v3-0-e3d3bf0e2c49@oss.qualcomm.com>
 <20261116-nord-drv-dt-v3-6-e3d3bf0e2c49@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 16 Nov 2026 13:29:42 +0000
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
- [Medium] drm/msm/dpu: INTF_9 and INTF_10 added after use in Nord
  catalog
--

commit c5bdfb09c207793f3155b346b39bc8a0210ff8f2
Author: Nabige Aala <nabige.aala@oss.qualcomm.com>

> drm/msm/dpu: Fix DSI tear interrupts broken by adding INTF_9 and INTF_10
>
> Nord requires INTF_9 and INTF_10. However, enum dpu_hw_intr_reg relies
> on all MDP_INTFn_INTR entries being sequential =E2=80=94 MDP_INTFn_INTR()=
 macro
> computes the interrupt index as MDP_INTF0_INTR + (intf - INTF_0).
> Appending INTF_9 and INTF_10 after the tear entries would break this
> assumption, causing DSI tear interrupts on existing platforms to map to
> wrong interrupt registers.
>
> Fix this by inserting MDP_INTF9_INTR and MDP_INTF10_INTR before
> MDP_INTF1_TEAR_INTR and MDP_INTF2_TEAR_INTR, keeping the sequential
> block intact. Add the corresponding register entries to
> dpu_intr_set_7xxx and dpu_intr_set_13xx.
>
> Signed-off-by: Mahadevan P <mahadevan.p@oss.qualcomm.com>
> Signed-off-by: Nabige Aala <nabige.aala@oss.qualcomm.com>

[ ... ]

> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_mdss.h b/drivers/gpu/dr=
m/msm/disp/dpu1/dpu_hw_mdss.h
> index 0e65bf5ddc4a6..7eccb4d2c65ef 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_mdss.h
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_mdss.h
> @@ -226,6 +226,8 @@ enum dpu_intf {
>  	INTF_6,
>  	INTF_7,
>  	INTF_8,
> +	INTF_9,
> +	INTF_10,
>  	INTF_MAX
>  };

[Severity: Medium]
Should this patch come before commit "drm/msm/dpu: Add support for DPU 12.1
on Nord"?

That earlier commit uses INTF_9 and INTF_10 in nord_intf[] before they are
defined here, which breaks the build and git bisect at that point in the
series.

Also, the commit subject and message describe this change as fixing a prior
addition of INTF_9 and INTF_10, whereas this patch introduces INTF_9,
INTF_10, MDP_INTF9_INTR, and MDP_INTF10_INTR for the first time.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261116-nord-drv-d=
t-v3-0-e3d3bf0e2c49@oss.qualcomm.com?part=3D6
