Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BB8453B42E0;
	Tue, 16 Jun 2026 09:08:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781600937; cv=none; b=nuEoPn6b5rAPPrTkehS23B1CkFvlENKB+Y+DyICBfVHlD1UfMJVnuw8o4JGY4FNU7Vph8TflWmqagSV7EZQGJAFn13POmFVQFBa4nsBzFa0dhaGhAWBycwne9DYcgY7cKTWZHzLk5fWJ0kV9fTNxpCtkEly6/qi/JxhjzMH5i08=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781600937; c=relaxed/simple;
	bh=e2x04y9trWHLVKYSlXxpVFxVMddWeo8Zw5ZRnEUYWQ4=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=WnPvMI2OxCAAhqax4f6dTZGgXq/IUxo08DV1rWEAwS9FWnPUh2F4Db2rjGWGi7q2unfo7uTw4oufdpaZQ1gX+k69Lc223NZYd5HZ39jO781u/lpVxsMXt4UD1KO54aiCfBRT0GWBEJKpmzDzwwaXMx7j4W/12fc4rkPzaxmdUHs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=f91E9B6F; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="f91E9B6F"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1CF211F000E9;
	Tue, 16 Jun 2026 09:08:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781600936;
	bh=ZKc7L7/7ELh1FPQJxElbbQEOdfQLPqnQrns6u7AawPs=;
	h=From:Subject:Date:To:Cc;
	b=f91E9B6FZ0JEKNIEv1zv3yS6IQ9+u6zaUvgoPmTbDRL0frM64mJjXBSvpW1mouhpu
	 S5NKpnhW/7TEH09a0dpM4m1MowJAa8kztMliufzOpPIlCeuSfjGc91xS/TbDK6owGZ
	 2lcgCh+4wOkmyrEzv1H/uy9UOg9bCtJM40q89vQpETfkgTnOHWVqIrIHqIy+2R8kkS
	 cqZ5KsIMgFz7lCf5mr5KzPY1Ayf1XGyBfGALfK7e2KJgnLTQcObRqWqmZ0lY/HfYaa
	 mQKJ3NiDmud5ky4CnOAPVsZ5XRXM8IdsWSzI4UAnVlW3i0hCtWzA5dXmRhpqYYFW3h
	 CancRWTjWfycg==
From: Konrad Dybcio <konradybcio@kernel.org>
Subject: [PATCH v2 0/4] Describe display voltage regulators on SC8180X
 devices
Date: Tue, 16 Jun 2026 11:08:48 +0200
Message-Id: <20260616-topic-8180_disp_power-v2-0-167785993231@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/4WNWw6CMBREt2L6bUlbHjZ+uQ9DCLQXuUZo7QXUE
 PZuwQX4M8lJZuYsjCAgEDsfFhZgRkI3RFDHAzNdPdyAo43MlFCFKGTOR+fRcC21qCySr7x7QeB
 WZrZNc2VNc2Jx6wO0+N5/r+WPaWruYMbtbGt0SKMLn108y633zzFLLrjUNi2aPNMm0xdHlDyn+
 mFc3ycxWLmu6xfpFfOo0wAAAA==
X-Change-ID: 20260615-topic-8180_disp_power-d14df352dcb7
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, 
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Vinod Koul <vkoul@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, 
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1781600932; l=1681;
 i=konrad.dybcio@oss.qualcomm.com; s=20230215; h=from:subject:message-id;
 bh=e2x04y9trWHLVKYSlXxpVFxVMddWeo8Zw5ZRnEUYWQ4=;
 b=KMvJJFl0SszCwr57ZdeJmXXgt+Pkq1fqZ/oWB7v0ZBYkEbzXT5kTs/EVNGHz/3EZe6dDqISxK
 C8S6EjInr8KDhNV69AfoMBI29xuj400t3DHM13nGDlejTzjksSbP6yx
X-Developer-Key: i=konrad.dybcio@oss.qualcomm.com; a=ed25519;
 pk=iclgkYvtl2w05SSXO5EjjSYlhFKsJ+5OSZBjOkQuEms=

Let Linux control these supplies to both ensure a known state and allow
for some power savings.

This series is compile-tested only, but verified against schematics.

Resolves the following kind of DT checker warnings:

sc8180x-lenovo-flex-5g.dtb: panel (edp-panel): 'power-supply' is a required property

Making the SC8180X platform warning-free.

Signed-off-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
---
Changes in v2:
- Fix a typo in the bl_pwr_en pinctrl node name
- Pick up tags
- Link to v1: https://patch.msgid.link/20260615-topic-8180_disp_power-v1-0-18d36b548c48@oss.qualcomm.com

To: Bjorn Andersson <andersson@kernel.org>
To: Konrad Dybcio <konradybcio@kernel.org>
To: Rob Herring <robh@kernel.org>
To: Krzysztof Kozlowski <krzk+dt@kernel.org>
To: Conor Dooley <conor+dt@kernel.org>
To: Vinod Koul <vkoul@kernel.org>
Cc: linux-arm-msm@vger.kernel.org
Cc: devicetree@vger.kernel.org
Cc: linux-kernel@vger.kernel.org

---
Konrad Dybcio (4):
      arm64: dts: qcom: sc8180x-primus: Rename regulator nodes
      arm64: dts: qcom: sc8180x-primus: Describe the display power net
      arm64: dts: qcom: sc8180x-lenovo-flex-5g: Rename regulator nodes
      arm64: dts: qcom: sc8180x-lenovo-flex-5g: Describe the display power net

 .../arm64/boot/dts/qcom/sc8180x-lenovo-flex-5g.dts | 57 ++++++++++++++++++++--
 arch/arm64/boot/dts/qcom/sc8180x-primus.dts        | 56 +++++++++++++++++++--
 2 files changed, 103 insertions(+), 10 deletions(-)
---
base-commit: c425609d6ac4012c8bbf01ec2e10e801b1923a7b
change-id: 20260615-topic-8180_disp_power-d14df352dcb7

Best regards,
--  
Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

