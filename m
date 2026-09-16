Received: from mail-pz2-f41.google.com (mail-pz2-f41.google.com [74.125.228.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 029054F30F9
	for <devicetree@vger.kernel.org>; Wed, 16 Sep 2026 13:10:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789564206; cv=none; b=L6IMsdV7AAi7eN7+zt6ZIRA8/DZ+d9ir3H4KD/zmpL1p8UaIWkSX60FjsW3zZoarVQEX1w23fmAQ05upkMhZgY3a9fHuBXevGseBrbcbt/c0i32cBsZ0UEF8T+f3WdoKaV2ghEHflsozWlvvcBAJU6gULnXf1DCYOFQuXcIcXgg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789564206; c=relaxed/simple;
	bh=15vrT0yjzU+bYft7+I8HpmMdcGQzELx67Cb5lafi5jE=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=GPXr69TEzF5uYPeFOgjj78xhSNL1s1SPOK9fChC8C0JmqfSRFrAUTFIQjwANjdcIEmitcBboNsnwrFT7eSTC9aJ5zlwwvXPY12F8xW2aDQS78vrgJJ2fiPbzxxiOp+Lu1P0nRc1ZHq1ILC3S8MA5dSb+1KwDR44Tr8GeBHc6pZA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=lJGGB/4n; arc=none smtp.client-ip=74.125.228.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="lJGGB/4n"
Received: by mail-pz2-f41.google.com with SMTP id d2e1a72fcca58-86b51649c7eso22379b3a.2
        for <devicetree@vger.kernel.org>; Wed, 16 Sep 2026 06:10:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789564204; x=1790169004; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=C9r8dgLbj0GWUBjEyVgxWkn6zK87vuTMltoq6jGhYqA=;
        b=lJGGB/4neg/fnWE/EFaXicMNrjhgwFeDXAW6QrlOEUWmVjHBV0cZ+3StJf04Rlxx/x
         b+Ij+WDjI/rkhTLcUxQYLoKRJo3xRzUeUjOuX3FYM82incp8AsjncCMc1TAtODuZQmy2
         MJJV/d6QKQlcWYk7lchRG1eE6sfvoMfBzkgDx9zoG9hTmBU2rYRfkSo7v6pL9c87fU6A
         98hksHXjtqiHeR1hLPI2VFBXdHI/qTdqITNSftVLu5b3gwPTvyPQaqT6bvBQsE66yHaY
         1IUKrcB9E2ffgwX72o0crnj2QdA0WAbwnysGfbg9Hm+6R71zRBFlT9n2TtQsrh9DyZ9E
         qvIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789564204; x=1790169004;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=C9r8dgLbj0GWUBjEyVgxWkn6zK87vuTMltoq6jGhYqA=;
        b=ApqopZVnrmQwSvFtZyNJBLGvFHeK4EEJqu0QBP2UY/LAk52TLqO88zzhU780wkXrOo
         5j4kZHudvc6QymAyzBzyClEqoYeDxEmMn/3s1gVTjCzBl3efmNbzu0KfwNxKQpvF0VTy
         2hOesKsJM+S3y40toNf33cB20eS1BmFxAL/KwElxOWNm4iPmUYcYehuehJJvhEIFDp2W
         n4T7lg0qNLsq6wGIvTuONSKGB0jDVudZanf3pw8x+cCBCxaP6qW5kFWye/JEq+knXLjb
         03mtTmGAINNM/1gSmDAPfV2pimHi6FElrsUIE4xt07VQe1NYdlWh+RA0R/CQXOGxcTkQ
         z1xQ==
X-Forwarded-Encrypted: i=1; AKwUvByz9oX9ZpioLn2yhvhfsdVwcnNAFo3LdChQDzxkfHrypHw6CDSJo3Om8aH9wHlxJdTmE2Z9pmvuv8DZ@vger.kernel.org
X-Gm-Message-State: AFuF++ltbdM88n2S9TQ6Cgd04O263ia+zrWH/NjRo/mpAjLMOnLFZEPy
	+jTKYndZON2RsNQz0ptx3gvgMrga4qP2dqKEYHAWV+EZcvlhmlF2KVDq
X-Gm-Gg: AYBFou3tEyGlckjhpjlPKdrprnRuz+XhTVwqEkSgjBrY1INHUoRpNrLC+utngr7K2oP
	n/Xmsn98e25n6kVsytxzS5qXxiDw41aIOo3dlMcBsZNqwAvxc96zvxMYojhxjvwT2Eoth3Mmfpz
	vSjdElSkjDg6eJpk3yGN9lSl4PzWXokXrcnb+SemcNmSV3k01pe6foWiX1DHc6lB8UQl9Teu2u3
	SuCcnUM6aOTC4j/0gIualjd3DdRKnnmeFl1EgEbWTJcCG6RbiXUqqAPVxzbvpqtF8+wuvViPR6y
	9crT0Ja0oKpwF3CxmgkpsySF0790BhK/DdBWJT3Fjv3tCQIZziK2oa4AHmMYQa45YOPFZqs0I41
	T/73IXJ1vuzQ7o3iP+8lhkDLC9MefYcG1R/2TLxR3D4TJ+1CHG4dB3vhGTcygA/2jupuiJ57+IX
	ykEpOovmh2w4YNf+TJ9kWjv4TNnkh2gckhOuqCoAlHyyGdfWw8Ov9mmWpaZ0f6gf8wh9L4Z88qn
	0FFKKyKaqw=
X-Received: by 2002:a17:90b:2250:b0:39d:e1f2:3400 with SMTP id 98e67ed59e1d1-39e1e5285d8mr3893628a91.5.1789564204084;
        Wed, 16 Sep 2026 06:10:04 -0700 (PDT)
Received: from [10.107.92.252] ([2409:40c2:5413:87f7:9fa7:eb18:a8e7:30a7])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-33bf5ac47cfsm7186272eec.17.2026.09.16.06.09.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Sep 2026 06:10:03 -0700 (PDT)
From: Bhargav Joshi <j.bhargav.u@gmail.com>
Subject: [PATCH v2 0/4] dt-bindings: regulator: Tegra coupling DT
 conversions and cleanup
Date: Wed, 16 Sep 2026 18:39:30 +0530
Message-Id: <20260916-ti-tps6586x-v2-0-31b98eeff7f9@gmail.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/1WNQQ6CMBBFr0JmbQ0zQAFX3sOwoHWEMQqkrQRDu
 LuAceHyJe+/P4NnJ+zhFM3geBQvfbcCHSKwbd01rOS6MlBMOi4IVRAVBq+zQk/KZCnniFhibmF
 dDI5vMu21S/Vl/zJ3tmFLbEYrPvTuvd+NuHm/Mv2VR1SoysSaVJuEDOXn5lnL42j7J1TLsnwAk
 5/tUrgAAAA=
X-Change-ID: 20260821-ti-tps6586x-b54e7111917c
To: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Thierry Reding <thierry.reding@avionic-design.de>, 
 Lee Jones <lee@kernel.org>, Shree Ramamoorthy <s-ramamoorthy@ti.com>, 
 Thierry Reding <thierry.reding@kernel.org>, 
 Jonathan Hunter <jonathanh@nvidia.com>, Dmitry Osipenko <digetx@gmail.com>, 
 Svyatoslav Ryhel <clamor95@gmail.com>, 
 Laxman Dewangan <ldewangan@nvidia.com>
Cc: linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, 
 goledhruva@gmail.com, m-chawdhry@ti.com, daniel.baluta@gmail.com, 
 simona.toaca@nxp.com, j.bhargav.u@gmail.com, mfd@lists.linux.dev, 
 Thierry Reding <treding@nvidia.com>, linux-tegra@vger.kernel.org
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1789564183; l=1796;
 i=j.bhargav.u@gmail.com; h=from:subject:message-id;
 bh=15vrT0yjzU+bYft7+I8HpmMdcGQzELx67Cb5lafi5jE=;
 b=h4Sn/Q8+2ydvx+1ai82bKpETRX2wqt/JMINlNqyzcv8hIJDj4s6LN8xR6iCcdiEifDU+WPAA8
 q+kQJQbpTG8A+Tl4xABPdsdK4NYgXn+qtCJTephF3KBFkOC8QMLm06Y
X-Developer-Key: i=j.bhargav.u@gmail.com; a=ed25519;
 pk=IqNDwUZKECEA+n8wXctFLBbYL9NhFstZNbOznm/nX1k=

This series adds a shared DT schema for Tegra regulator coupling, 
updates relevant PMICs to use it, and converts the TI TPS6586x 
bindings to DT schema.

Summary:
- Patch 1: Fixes existing TPS65910 validation warnings.
- Patch 2: Converts Tegra regulator coupling to DT schema.
- Patch 3: Updates Tegra-related PMICs to reference the new schema.
- Patch 4: Converts TI TPS6586x to DT schema.

Signed-off-by: Bhargav Joshi <j.bhargav.u@gmail.com>
---
Changes in v2:
- Add patch 1 to resolve warnings from TPS65910.
- Add patch 2 to convert nvidia,tegra-regulators-coupling to DT schema.
- Add patch 3 to $ref to shared schema.
- Patch 4: remove individual properties and add $ref to shared schema.
- Link to v1: https://lore.kernel.org/r/20260822-ti-tps6586x-v1-1-93cb46b32b27@gmail.com

---
Bhargav Joshi (4):
      dt-bindings: mfd: ti,tps65910: Add wakeup-source and GPIO hogs
      regulator: dt-bindings: nvidia,tegra-regulators-coupling: Convert to DT schema
      regulator: dt-bindings: Reference Tegra regulator coupling schema
      regulator: dt-bindings: ti,tps6586x: Convert to DT schema

 .../devicetree/bindings/mfd/ti,tps65910.yaml       |  20 ++-
 .../regulator/maxim,max77620-regulator.yaml        |   5 +-
 .../regulator/nvidia,tegra-regulators-coupling.txt |  65 -------
 .../nvidia,tegra-regulators-coupling.yaml          |  76 ++++++++
 .../devicetree/bindings/regulator/ti,tps62360.yaml |   1 +
 .../devicetree/bindings/regulator/ti,tps6586x.yaml | 196 +++++++++++++++++++++
 .../devicetree/bindings/regulator/tps6586x.txt     | 135 --------------
 7 files changed, 294 insertions(+), 204 deletions(-)
---
base-commit: 9f0346dcbea363787186c94ef94dd01aaa215afa
change-id: 20260821-ti-tps6586x-b54e7111917c

Best regards,
-- 
Bhargav

