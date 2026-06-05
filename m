Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3A15E37BE74;
	Fri,  5 Jun 2026 21:49:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780696164; cv=none; b=HxkuMPYxTBcKrnBKPpC/a2iOZHaBWMQtRGvm55j/9nNMEPDEA6s2omk4wgjGeN4EnVf7YNFsGrQOphm/+T3y1yhzAGkYIXUXsg4WcEgBK8+mkxdQvIB9Ychc838iJxpp1Y79Mw9zKcgoVKB52n6ZJrmSfX6ZKW6vvxLbx5dO3mk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780696164; c=relaxed/simple;
	bh=OAS4olxbrpvpcUkxuRn6v9A1t3vkU7Qutn4uR3BehGw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=AxH0RsxVQkAbJ5gxL+ZtON9hSo60kJge7Vb5aqbgNwDvqGUO5knF1zop/6HpIHGbkL0OIRqhioIXLk69FKJmgxAevGx8fyeiv2dFP1Jj0nuWPuZ1lHE1uI+F2qSpd6ZQmyYcEzFU6dMLsyWNh9Z4MFZ7cq4rleREna7UPzKqaf0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=OE/5STLP; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="OE/5STLP"
Received: by smtp.kernel.org (Postfix) with ESMTPS id EE990C2BCC9;
	Fri,  5 Jun 2026 21:49:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1780696164;
	bh=OAS4olxbrpvpcUkxuRn6v9A1t3vkU7Qutn4uR3BehGw=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=OE/5STLPngv1vv4/9mJZMj6HJ1+9OWrEhR+rokZ+fE6GV0NK4pc+ymnv3Qrmr2ZFt
	 g09SlxXOjBcSLMmigwrgoXnC7kmuNUlmimeWpmtwClRas0ADcOQKqFIap3dFOJpLHB
	 iR/fhNf2X4hBfEskj4Pv5NCC2DR7b7BKCUHZMot1F+HyrK/3XzMxVRk0USbSLB/ins
	 FNeXXJ+kuQsFIlWPpF68+1ffvQg+JGH8JswpeHyFXZbb/Sl/+ph/yfKqADVOzmlPNX
	 eb+WNnVl4UHx5NPIjHtaZlWf9YZgKvIlNrpQQB/c6StLYjQ6Un4n9bgb2E2ejqvlA6
	 jmNtXBwaxWqRA==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E0D8FCD6E7E;
	Fri,  5 Jun 2026 21:49:23 +0000 (UTC)
From: Aaron Kling via B4 Relay <devnull+webgeek1234.gmail.com@kernel.org>
Date: Fri, 05 Jun 2026 16:49:08 -0500
Subject: [PATCH 2/2] soc: qcom: socinfo: Add CQ8725S SoC ID
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260605-cq8725s-soc-id-v1-2-bb1ef93de649@gmail.com>
References: <20260605-cq8725s-soc-id-v1-0-bb1ef93de649@gmail.com>
In-Reply-To: <20260605-cq8725s-soc-id-v1-0-bb1ef93de649@gmail.com>
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Teguh Sobirin <teguh@sobir.in>, 
 Aaron Kling <webgeek1234@gmail.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1780696163; l=731;
 i=webgeek1234@gmail.com; s=20250217; h=from:subject:message-id;
 bh=wkySf1dgX9Cw4+8ob2ohV1kwlJW81Sedb4xXGiINUAU=;
 b=Vvly/oG1MGvCiurwMdwBi0y5wrzw4aKDl4gtomZNK0IQZPfuJOmP3MUP7ITEyoYD228Wee8Nm
 U7RBv/Zm2sEAlVWIyrFj8dJ8Ux9LYrJYAY4XHnK5Ssh/Wz44f5hsKxu
X-Developer-Key: i=webgeek1234@gmail.com; a=ed25519;
 pk=TQwd6q26txw7bkK7B8qtI/kcAohZc7bHHGSD7domdrU=
X-Endpoint-Received: by B4 Relay for webgeek1234@gmail.com/20250217 with
 auth_id=342
X-Original-From: Aaron Kling <webgeek1234@gmail.com>
Reply-To: webgeek1234@gmail.com

From: Teguh Sobirin <teguh@sobir.in>

Add the ID for the Qualcomm CQ8725S SoC which represents the Pakala
platform.

Signed-off-by: Teguh Sobirin <teguh@sobir.in>
Signed-off-by: Aaron Kling <webgeek1234@gmail.com>
---
 drivers/soc/qcom/socinfo.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/soc/qcom/socinfo.c b/drivers/soc/qcom/socinfo.c
index af418adad7aaf3..2b1395a85af45e 100644
--- a/drivers/soc/qcom/socinfo.c
+++ b/drivers/soc/qcom/socinfo.c
@@ -540,6 +540,7 @@ static const struct soc_id soc_id[] = {
 	{ qcom_board_id(QCS9075) },
 	{ qcom_board_id(QCS615) },
 	{ qcom_board_id(SA8797P) },
+	{ qcom_board_id(CQ8725S) },
 	{ qcom_board_id(CQ7790M) },
 	{ qcom_board_id(CQ7790S) },
 	{ qcom_board_id(CQ2390M) },

-- 
2.53.0


