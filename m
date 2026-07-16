Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1C62743031C;
	Thu, 16 Jul 2026 17:33:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784223234; cv=none; b=QKNo/00DgN188sYF3VvThlfhWGBT7vVERFVWBTlcjBQ8xh0dfkfokcqC6ifyN1gbJpuBz92ylyhT8UaltGgp8CRAVxPY5R1oJSI7KkUpuJPM4fr3BdReiwYq3K0QeKBgrH4Hm5/teqXwAQtPXQ2IS4qToF0A0e0PbP7cAaGeyTQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784223234; c=relaxed/simple;
	bh=sTbAhlDTe1rTrOdKNpX1eNVtxEP4qyngifgCu1tMiOI=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=rFlsUM01APSlgArblQe2NxbBipUXJnLXED5AL58ULMAWVlwkGS8UkMo8bMoo8DRpkzJBl8RUEC4ERL0DXq3wuDZHQficL6hGOorHkaCg7+AiolJoWokSCq2Fv/UOa9uilaxsZUZeVf4B8GfR+zDz7+nKk2qlMFYr1XNOsrM2rao=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ornGhr6H; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ornGhr6H"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3B4ED1F000E9;
	Thu, 16 Jul 2026 17:33:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784223232;
	bh=3aMs/RNTzbH20VKVqI66z01RsFkIqIJ+oI1CYw9RXHk=;
	h=From:Subject:Date:To:Cc;
	b=ornGhr6HEBAPtkgCh8kA+PufhSAaMh3O+AwDJMlsAizSmLIS0B2BdFvHlXtBRC6YB
	 VZUfXjx3lXyxaKh2pxU7snADgMIT8K627l+sdx76zpQ5h8sg4JMSIfvzqc1d2O/NpM
	 ZhnOnG+Jay6uv/2Ktb/ds56e1uZwRTGDOLbyFsf4/3KizB2SRzBi9zzVLxOqI6SoEl
	 DlFqtHPdgCmGLdqUG9Ule3cNASfEXQz9x/RwihbgdZCABUs3WdLMfgEq60qL1N0GBX
	 msohFpQhFEDGBFcR89NiGVnxM7HMJj0btgFLdGK9uYWbYuNfue81ThpCPdIl/CWtf3
	 2XS/XscJxtewg==
From: Konrad Dybcio <konradybcio@kernel.org>
Subject: [PATCH 0/2] Glymur DT QoL
Date: Thu, 16 Jul 2026 19:33:41 +0200
Message-Id: <20260716-topic-smb2370_port2-v1-0-83d02b2ba4b0@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/yXMQQqDMBBA0avIrBuICSbaqxQRnU7rFGpCJoog3
 r1pu3yL/w8QSkwC1+qARBsLh6WgvlSA87g8SfG9GIw2TvvaqRwio5L3ZKzXQwwpG2V9i42zY9c
 hQSljogfvv+ut/1vW6UWYvys4zw9gSAkjdwAAAA==
X-Change-ID: 20260716-topic-smb2370_port2-378c563a99ce
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, 
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1784223229; l=657;
 i=konrad.dybcio@oss.qualcomm.com; s=20230215; h=from:subject:message-id;
 bh=sTbAhlDTe1rTrOdKNpX1eNVtxEP4qyngifgCu1tMiOI=;
 b=xq9ewIzNfLcg2RhSw4BoDRtaa4anZyalbe7J1CGf+zZhdyAEWQzrl+xuqdNfL/6HnILfCqnav
 nsygJx38cq0A6pTEp9Evmhez04i5V8/StpXns0cbMhgKKR2B0Hlhgzn
X-Developer-Key: i=konrad.dybcio@oss.qualcomm.com; a=ed25519;
 pk=iclgkYvtl2w05SSXO5EjjSYlhFKsJ+5OSZBjOkQuEms=

Two tiny no-dependencies changes that have no business waiting for
other patches to settle.

Signed-off-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
---
Konrad Dybcio (2):
      arm64: dts: qcom: smb2370: Disable SMB2370_2 by default
      arm64: dts: qcom: glymur: Add PCIe port compatibles and ports

 arch/arm64/boot/dts/qcom/glymur.dtsi  | 24 ++++++++++++++++++++++++
 arch/arm64/boot/dts/qcom/smb2370.dtsi |  2 ++
 2 files changed, 26 insertions(+)
---
base-commit: b8809969e1d7a591e0f49dd464a5d04b3cf02ab1
change-id: 20260716-topic-smb2370_port2-378c563a99ce

Best regards,
--  
Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

