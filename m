Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3D6EB375ADD;
	Fri, 21 Aug 2026 03:31:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787283068; cv=none; b=c9nQWX/Kiqb8Y6zlhBvhnXCRWx8nxKWsSnOfuJ6Xo8XtrrzpofbFNnqwT/0/gYKgbAws/p+753yvT1jejmlboO3YpFYlt5IlMsc1+ZDlh//NQm+lm6OhE7x6+6Iu353aIoVrYmaQcCPLi6fb9QuNQulWaMZaJB9fcAeHZ2UCT64=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787283068; c=relaxed/simple;
	bh=gtD7QCZF9hwjGwmyNSwmPa2sxD1FgxJxDbkAvsTPfW0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=ahBdd7va0tKwwf4BieXxTt7Li0VPwTTPDF61eKj2/8etMnsVa49kUSGxuN4R/co9mOio6E/IyAKWMD7notZfdan8zDAnMjTe+1JVrmNdT0Zw9s0/zqbIrf67JawEw7LhSpmQO0fRp2/CpcwfT45nYBcBMb51Y0Adh1lLMqdRtok=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=nT9EDfO2; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="nT9EDfO2"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 6A038C2BCFD;
	Fri, 21 Aug 2026 03:31:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1787283067;
	bh=gtD7QCZF9hwjGwmyNSwmPa2sxD1FgxJxDbkAvsTPfW0=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=nT9EDfO2TRea+Yuktdi4G1VDcVv8iC/pK8bBtUzHkfmswOoyzJ6KbEJQVA3ilL0jt
	 XtAjY/ada7xQtlWI7x9PTCYwTfIQgHpZtq8EmYsLj4pLFrXFnIxxynXDyHoi3/FmPd
	 ip5WaXXzLnldWhqxzr/ea4qZRHWj8Zqbcv6DvRJrrmjcdqcIoMVYaKnTPkZICaQsc9
	 3RuyKyO97h/36gi1ZlXN4b6yCopFM2uV4mJWMTEWImeoIliFfM13ICOB6rfY3XLkul
	 xCit6EhWcQfidjKRw7IJ5NPvdOMv0tyfCJUaGqFKoO0zHMqMBXhYK3RDAHOSp0iOpG
	 SIPgUji0i5s0g==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4FE7CC5DF81;
	Fri, 21 Aug 2026 03:31:07 +0000 (UTC)
From: Aaron Kling via B4 Relay <devnull+webgeek1234.gmail.com@kernel.org>
Date: Thu, 20 Aug 2026 22:30:47 -0500
Subject: [PATCH v2 2/4] dt-bindings: arm: qcom: Add Retroid Pocket QCS8550
 Devices
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260820-rp-qcs8550-v2-2-d4ce78fe9385@gmail.com>
References: <20260820-rp-qcs8550-v2-0-d4ce78fe9385@gmail.com>
In-Reply-To: <20260820-rp-qcs8550-v2-0-d4ce78fe9385@gmail.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-msm@vger.kernel.org, Aaron Kling <webgeek1234@gmail.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1787283066; l=736;
 i=webgeek1234@gmail.com; s=20250217; h=from:subject:message-id;
 bh=WxDgKnm+oG3VxyfqzoJMACArjvmJTRv82JY4e2Z0FgY=;
 b=RO7IizmECv9EHIZS4O6M0yEt6VLrK+n6/E1GCc7a/4uEbRuPZDCYpDKcP9rigdCckDYOK+/HS
 O1HiLXb8uepBzlsduzdZ5/bhgnl8x8CDJS2uupW5GZr2PzFVuOZ/AIC
X-Developer-Key: i=webgeek1234@gmail.com; a=ed25519;
 pk=TQwd6q26txw7bkK7B8qtI/kcAohZc7bHHGSD7domdrU=
X-Endpoint-Received: by B4 Relay for webgeek1234@gmail.com/20250217 with
 auth_id=342
X-Original-From: Aaron Kling <webgeek1234@gmail.com>
Reply-To: webgeek1234@gmail.com

From: Aaron Kling <webgeek1234@gmail.com>

Namely:
* Nova
* RP6

Signed-off-by: Aaron Kling <webgeek1234@gmail.com>
---
 Documentation/devicetree/bindings/arm/qcom.yaml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/qcom.yaml b/Documentation/devicetree/bindings/arm/qcom.yaml
index 954be28203017..25d24c36c5e00 100644
--- a/Documentation/devicetree/bindings/arm/qcom.yaml
+++ b/Documentation/devicetree/bindings/arm/qcom.yaml
@@ -1158,6 +1158,8 @@ properties:
               - ayntec,odin2mini
               - ayntec,odin2portal
               - ayntec,thor
+              - retroidpocket,nova
+              - retroidpocket,rp6
           - const: qcom,qcs8550
           - const: qcom,sm8550
 

-- 
2.54.0


