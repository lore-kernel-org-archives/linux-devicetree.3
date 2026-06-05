Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3A2233947AB;
	Fri,  5 Jun 2026 21:49:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780696164; cv=none; b=B9kp5q7jKon9XA4ZGV7Nehp0zQ9+Cb4ZHpSXXGERnNZj7ZCAzh2D3NKt1cnzb+sNXbHGlt/KMiosutREpRxgZaj7Yk6BooVYdBZzmirnjCHadrrb4HGyEpr/jRCVqTGyLnF7fq8k5JMpuZzXpBhKhQVCn2PhA0S9dJvEr7wWI5s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780696164; c=relaxed/simple;
	bh=p+Ek4rtYC2lXzkvKxdIQpewdKguYwiuJOF/vElMhShY=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=ezNUVzMXp6F7HFuKUS7srTRiJjHbcuXtAA7cMKbcD7Y0aHYIro2xkVC8vqpt/WAxysIbtFd3sArykwShroipj6SvTegO90Y6rtykydf9y8WJ6F4iWEEPeeqtDrwupVTVh871yTTLPkVIA2lncxAX/utV0D9uByH3YLZ5TUhNGrw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ONi/qBE2; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ONi/qBE2"
Received: by smtp.kernel.org (Postfix) with ESMTPS id CF021C2BCB9;
	Fri,  5 Jun 2026 21:49:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1780696163;
	bh=p+Ek4rtYC2lXzkvKxdIQpewdKguYwiuJOF/vElMhShY=;
	h=From:Subject:Date:To:Cc:Reply-To:From;
	b=ONi/qBE209+9aYWiTWIBRwgAoqsKmzFrk3GSbjB9GzmipHiuD+RJmcaYRaEVVgc8t
	 bR2joVrqokAFtmOgBE5sQAttjjBnaFCB0nkS0LtZoUEYqpMChH84ov6tPG6nKpjdfD
	 c80qqEsC5g8Ha9AKvPAPda79B0msLz2PtQ2O6uckXTwpRwDhWNf8yC3n8ffLKbfK3f
	 eK+kmrWZi8fGp1G0GgzPzDsI+Z5hDpkUGrgJLVVb5tSNsZAWyGXPrFAQ2sY9ojLk8d
	 ySskjiu5kfYv2a14lI1wr/KW4nqcD9kbET7ECjCN/bLEVmXy+wYLGcco5B5TGqYCzS
	 DL3a4GXEbfYXg==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B35DCCD6E6E;
	Fri,  5 Jun 2026 21:49:23 +0000 (UTC)
From: Aaron Kling via B4 Relay <devnull+webgeek1234.gmail.com@kernel.org>
Subject: [PATCH 0/2] soc: qcom: socinfo: Add CQ8725S SoC ID
Date: Fri, 05 Jun 2026 16:49:06 -0500
Message-Id: <20260605-cq8725s-soc-id-v1-0-bb1ef93de649@gmail.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/x2MQQqAIBAAvxJ7TlCjsr4SHdS22ouWCxGIf086D
 sNMBsZEyDA3GRI+xBRDBdU24E8bDhS0VQYt9SAH2Qt/m1H3LDj6qsSmzSSddd2uDNToSrjT+w+
 XtZQPF92zc2AAAAA=
X-Change-ID: 20260605-cq8725s-soc-id-d2890bab3f18
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Teguh Sobirin <teguh@sobir.in>, 
 Aaron Kling <webgeek1234@gmail.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1780696163; l=480;
 i=webgeek1234@gmail.com; s=20250217; h=from:subject:message-id;
 bh=p+Ek4rtYC2lXzkvKxdIQpewdKguYwiuJOF/vElMhShY=;
 b=4IQGpS/+vWwVGbSvaKXxjk2BzAENzxZcpV3aSiI2I/4sS9LgotzmWo3Z1mGbS0/lDM+oX3OXI
 8o3TSMXH3l5C/rQbrDk3PpARetVSzqW+es6YlSdptswWvMRkKezXhh5
X-Developer-Key: i=webgeek1234@gmail.com; a=ed25519;
 pk=TQwd6q26txw7bkK7B8qtI/kcAohZc7bHHGSD7domdrU=
X-Endpoint-Received: by B4 Relay for webgeek1234@gmail.com/20250217 with
 auth_id=342
X-Original-From: Aaron Kling <webgeek1234@gmail.com>
Reply-To: webgeek1234@gmail.com

Add the ID for the CQ8725S which is a variant of SM8750.

---
Teguh Sobirin (2):
      dt-bindings: arm: qcom,ids: Add SoC ID for CQ8725S
      soc: qcom: socinfo: Add CQ8725S SoC ID

 drivers/soc/qcom/socinfo.c         | 1 +
 include/dt-bindings/arm/qcom,ids.h | 1 +
 2 files changed, 2 insertions(+)
---
base-commit: 6e845bcb78c95af935094040bd4edc3c2b6dd784
change-id: 20260605-cq8725s-soc-id-d2890bab3f18

Best regards,
-- 
Aaron Kling <webgeek1234@gmail.com>


