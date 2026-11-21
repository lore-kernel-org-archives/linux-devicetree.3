Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795289170;
	b=Us6OHBVj2QbBHIVVstokpSS9739bRZfilP2zVyCFoty/OVV9CZJwn79D1wz0eazP88Bg
	 JLFCNUOI0AbnbdBmj/mUqgpGFQPpmHo9ZuXzIL+jC6gemHqm055DG5cE1NdHcfX0knWjE
	 c5zh/Uxcrw8P6b/6Iqc5sOHMW3ywCBqmBIY+XoJndeT/FkXPwe2JnllfTzUTIitOwtFpU
	 zXSsvyNYES9Dr/JN/1ro/pyPBzxxf2wju95IYw31qNeyV4D0T/FsIZyVfF2yD/1XaHRmN
	 RRWmZixB+8fLVFIOPOn5kxTMDV+k1aVmQ1wKgqfClyA5TmJDz9aPmN0JMkpfCIkMVXQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795289170;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=4VgQthRtCDUTKQc+MlhvCROWbeiQaB+99GbrW7fcYl0=;
	b=abEDdcqHH1yl0PZdjDjaHNGppMkyjQ0JEeGpKn7zpgndprLQVKqS4Cvah+jGycNKU962
	 kZFQbP39fHiipNvSCHTT1TvPGG6HPTTInHfmK0tY1QqJ76eVous7HOexSjzrq4kf193lA
	 G17s0WFXZpbqj9Tjtybt5u654/9tsf+FctahABi/wUGMxyGXZw95nqoCFT1YlCn1Qq1QM
	 qR6zGWghLGvKxY+omVkP7hr1VjWGU2PVGSPqGbU7rUEFebgl5NYJHL0sBqHlSc/BVbekp
	 S+3YNyfiWDo2zfQU0UU7LJRGQVVfqL7oXeP8KXWUQg2yfcqyEugDNvCemgVf3VWE9WQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=l2d3E1x+;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C44A1606A320
	for <devicetree@vger.kernel.org>; Sat, 21 Nov 2026 19:26:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=l2d3E1x+
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3A9E21F000C4;
	Sat, 21 Nov 2026 19:26:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795289170;
	bh=4VgQthRtCDUTKQc+MlhvCROWbeiQaB+99GbrW7fcYl0=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=l2d3E1x+RfWObZkRLhQQ71TVS2GIubQN06VgoJpDNmCTz3Vj2f2ksnBvYucuCsZL7
	 DJwBhcQrzFUYas44mJbhJ0WxZLtMP4v3nV2Lmtz/vxgU9nnvkrqiSk0DtKqsAt1XJr
	 YybPPlX8KgZo+ntkXitiPns67ghteFSHr+ZHoDqsQ2DYvFVHogNpEP6O200C5kSVbg
	 DYQ5Rg+nISt6IljxClcq4tN9cqj+kJAaDt27erJB11L1BLfV5c4aT/tA7YZCDld0Hf
	 zVpJeeCCz5rEIkRx3hjJEdlcyMwY7n/7SX5o3zlg0Qakehgno4D5oZ0J+2qIb/hssZ
	 pIjP40QLDRnBQ==
Message-ID: <sashiko-outbox-227302@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v3 02/11] dt-bindings: phy: amlogic: Add Meson HDMI TX
 PHY binding
Reply-To: sashiko-reviews@lists.linux.dev
To: "Ronald Claveau" <linux-kernel-dev@aliel.fr>
Cc: devicetree@vger.kernel.org, linux-amlogic@lists.infradead.org, linux-phy@lists.infradead.org, dri-devel@lists.freedesktop.org, robh@kernel.org, conor+dt@kernel.org, neil.armstrong@linaro.org, vkoul@kernel.org, olteanv@gmail.com
In-Reply-To: <20261121-meson-drm-create-hdmitx-phy-v3-2-f8f471788076@aliel.fr>
References: <20261121-meson-drm-create-hdmitx-phy-v3-0-f8f471788076@aliel.fr>
 <20261121-meson-drm-create-hdmitx-phy-v3-2-f8f471788076@aliel.fr>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sat, 21 Nov 2026 19:26:09 +0000
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
- [Low] dt-bindings: phy: amlogic: redundant word binding in commit
  subject
--

commit fbd4563b5cd10db3f75db052197f808e3b36bc55
Author: Ronald Claveau <linux-kernel-dev@aliel.fr>

dt-bindings: phy: amlogic: Add Meson HDMI TX PHY binding

This commit adds a Device Tree binding schema for the HDMI TX PHY found on
Amlogic Meson GXBB, GXL, and G12A SoCs.

> dt-bindings: phy: amlogic: Add Meson HDMI TX PHY binding

[Severity: Low]
The dt-bindings: prefix already indicates that this patch adds a binding,
so repeating "binding" at the end of the subject is redundant ("dt-bindings:
phy: amlogic: Add Meson HDMI TX PHY").

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261121-meson-drm-=
create-hdmitx-phy-v3-0-f8f471788076@aliel.fr?part=3D2
