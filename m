Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 593F6394788
	for <devicetree@vger.kernel.org>; Mon, 24 Aug 2026 22:51:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787611870; cv=none; b=s8p/C00wnOkfKQntVVsxsw+mMTZQVZL7UZVVmzLjYTyP2ofWBh114pbyIzguF0TVMH/W8LvkKkvj+3GqwyLDMf12+JOQAo7I2wzkpYq36umH0qbfjni+xUml6W6n0GceTR3GcDRpHotEfe+MGzTaBKmLVlHfTwuaFX2tChzaivY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787611870; c=relaxed/simple;
	bh=mmGCJh1+uF66rWrbJCbz5tM1GFDUnys/HytL+GOqZv4=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=Et+Zndp2BusyQJBugAJHrXfKS3hipkDtRfJveTGsb04ZQSq5C6cjcBawRpn/T2pN7TcCSIe4FAIxsKQSRB4d8NK+oXXT0Mzw3PRvREhQak8oxVht2x5wlhbldiXyXnFc/04Ck0w3xZ5SQTBZa0YtFlaffSCyesId9v0U4tcLR2k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Z6dW8C63; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Z6dW8C63"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A85851F000E9;
	Mon, 24 Aug 2026 22:51:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1787611868;
	bh=ZbVphlX7nHILauFpZLGbnK6gFDl7ET10FXthNtKOgQY=;
	h=From:Subject:Date:To:Cc;
	b=Z6dW8C63FFhJUEn5aS/j4KPe/qVrzqv10yaFOcYsMwTz20Jl++0Q/00iHNfFcaxUQ
	 Vu1siwuBXSJ6JwxQJ/skJxSqrTpELIWrsfdnuW6k6C72NkmnvllljPdVVKWCTbr0eC
	 9kgOT6MP5v6vOJI7DGbj3wGbvvHB7Q22Qb3XcWmnIfIT7+42HJxPQt5R/D7TwKhTjG
	 6ASdX/Pzm6/czpW4T9AOGbeJB4QAfH7/g70QZJh4HkhlCpZi29ugmbq6k6FcNprOba
	 DPpBefYUzFRvAgIyD6jbGQDrfWqmH49JJLeGysvT5vF5xcCdG1wMiYZzkzfjqVZsGk
	 dzzqrENO+YHIg==
From: Linus Walleij <linusw@kernel.org>
Subject: [PATCH 0/2] ARM: dts: ux500: Add the Imagis ISA1200 to Janice and
 Gavini
Date: Tue, 25 Aug 2026 00:51:02 +0200
Message-Id: <20260825-ux500-dts-add-imagis-img1200-v1-0-6319ac50e3a3@kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/x2MQQqDQAwAvyI5N5Bd3CL9ivSwmuw2h1rZtCKIf
 zf0NMwc5gCTpmLw6A5osqnpZ3EJtw7mV16qoLI7RIp3GmKPvz0RIX8NMzPqO1c1Rw3RM82lEA8
 pTJLAF2uTovt/Pz7P8wINsRL3bgAAAA==
X-Change-ID: 20260824-ux500-dts-add-imagis-img1200-0cff0d851be5
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, 
 Linus Walleij <linusw@kernel.org>, Linus Walleij <linusw@kernel.org>
X-Mailer: b4 0.14.3

This adds the device tree entries for the newly merged ISA1200
to the Ux500 Janice and Gavini device trees.

Signed-off-by: Linus Walleij <linusw@kernel.org>
---
Linus Walleij (2):
      ARM: dts: ux500: Add the Imagis ISA to Janice DTS
      ARM: dts: ux500: Add the Imagis ISA to Gavini DTS

 arch/arm/boot/dts/st/ste-ux500-samsung-gavini.dts | 56 ++++++++++++++++++++++-
 arch/arm/boot/dts/st/ste-ux500-samsung-janice.dts | 56 ++++++++++++++++++++++-
 2 files changed, 110 insertions(+), 2 deletions(-)
---
base-commit: b6b019a1d9b90ac51174f0ca15b1338b61506bf9
change-id: 20260824-ux500-dts-add-imagis-img1200-0cff0d851be5

Best regards,
-- 
Linus Walleij <linusw@kernel.org>

