Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=103.47.186.116
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795517112;
	b=CqQNR4qbZuAqIGBMqwQ5NAGQjW1jRwrxpHPiQOA3qm/Dq0pwGpM8sfCjNAO+m93Vzs5E
	 SZRY+DlFJpvtorT5c656biiU809USJjJWuJjpfMdx9HSrH4bIWhLHVYutnhULTWp9N6QT
	 IYwsBVDSgZjrKUcjkN2PmILqd8jIHsbvwhpDoyPA0ojW2VNCT68gQokSm426uUS1eS0D2
	 LWHPpPr7epsASJTn33VXqTbtcFTJXlY307v9p/fpNh/CG50mcH3LHXDgr4044MkGoP5e/
	 9DkY9YdB2AIIx7RZ6WzgpUwLpKAkAqPH62LOHJJ7d75QL2zZC9jhYaZsjdA3ZLfUOSQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795517112;
	h=DMARC-Filter:Received:From:Date:Subject:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Message-Id:References:In-Reply-To:To:Cc:
	 X-Mailer:X-Developer-Signature:X-Developer-Key;
	bh=lwHm2eXGQfsQLxAsDpBUxULj2YCIKJh637GLHu4D0yk=;
	b=1bTPam4Z1NRj9d/C3Ki0vIXA5zmDkQ+cvxC/bK7nEyvbhTZgQuv0pc0dWHL/fv2rElIi
	 qJ54r0/dLpnsVNiqnP1t88dbXQliVtnzKzNePX5tQ2OKJv1wwt0e3xuVjrVdfmIjM4swI
	 6HvyiCSlvfeYTP/r3ZAVA5iGrsEeySdyeGB48WAdGjDZMm1rKP9qUMIGMke+27+vjtIwG
	 XUl/NDMdJxKs17Lvnxyi7P/CJELz5U64H10kiOEtj2xZ6arkJSlIn1Z9RgHxX5YpA6AJ7
	 Pi/Ir6XbuFmb16fvebGY9pJKYViwoHDEMcQPQ4+z9dAXXdN03XbQpebCRaOxVG8QDeg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=krgm.moe;
	spf=pass smtp.mailfrom=krgm.moe;
	arc=none smtp.remote-ip=103.47.186.116
Received: from krgm.moe (krgm.moe [103.47.186.116])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8392D606A331;
	Tue, 24 Nov 2026 10:45:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8392D606A331
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=krgm.moe
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=krgm.moe
Received: from [10.42.0.96] (unknown [114.242.206.180])
	by krgm.moe (Postfix) with ESMTPSA id F1E3877B7;
	Tue, 24 Nov 2026 16:15:08 +0530 (IST)
From: SignKirigami <prcups@krgm.moe>
Date: Tue, 24 Nov 2026 18:44:00 +0800
Subject: [PATCH 1/2] dt-bindings: regulator: qcom,rpmh: Add PM6450
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261124-netrani-pm6450-v1-v1-1-1914da758d3d@krgm.moe>
References: <20261124-netrani-pm6450-v1-v1-0-1914da758d3d@krgm.moe>
In-Reply-To: <20261124-netrani-pm6450-v1-v1-0-1914da758d3d@krgm.moe>
To: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Bjorn Andersson <andersson@kernel.org>
Cc: Krzysztof Kozlowski <krzk@kernel.org>, linux-arm-msm@vger.kernel.org, 
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
X-Mailer: b4 0.15.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1322; i=prcups@krgm.moe;
 h=from:subject:message-id; bh=JTcehRhWC5D7m3DhQb5HW5rKAsfVUWSIVzZ4T5udMSM=;
 b=owEBCQL2/ZANAwAIAV0dOJt2umJjAcsmYgBrBWqOQ+ub8AMXs2bjSnkvhRVMjVr0v1bdXyAxq
 +Blz9EqTxOJAc8EAAEIADkWIQRSClJ2zjncUdNU0FFdHTibdrpiYwUCawVqjhsUgAAAAAAEAA5t
 YW51MiwyLjUrMS4xMiwwLDIACgkQXR04m3a6YmOVXwwAmLOwcUeBCkDRpFirR48FVpb4gvkGPwQ
 UA66Kmi4rhcTp3GyyrVF0Lk2jsEW2b+c2iA/4ekvADZa+svT5pMyTnHnkoRmpVYrhc4Pe7FOAK/
 C+s8fV3nDGrRLXq3/JbEGlSSnJ9gMPuaTvdoLWZLm/WItJDhui25wqjiYwAzhRBjsAJh2P4vrpg
 d1jfB6fDYUYh80oMEUxb8abAv91eLDdVYNPCc6CGfn3FNDJKGyPFotMo6okgsKsOFn5pRRqMwc8
 6S7ZzwU9GBzYKnxFnwoK7crSuW5D637ffMmWACSK2N98tug2u8jBd6qLUAN2ZAdkOb/9/YmCx/+
 z71YqgvYW4vMoHyhNlzluru+neahgYE/PktS0hH14k6toDxbpULwnQVgw00KNm8nrcD9UVcNO5v
 mC6n7yhrXrB5BxnZ3a4uXjnaoQdVXaDAs16C2m7J3h0HmqU2DxMvrsK7rq/xtG6NCrew8kAQfa1
 KZRPRnt2g4cBP47ZLHK5NCh0zlnIIcU
X-Developer-Key: i=prcups@krgm.moe; a=openpgp;
 fpr=520A5276CE39DC51D354D0515D1D389B76BA6263

Add the PM6450 compatible and document its supported RPMh LDO
resources.

Signed-off-by: SignKirigami <prcups@krgm.moe>
---
 Documentation/devicetree/bindings/regulator/qcom,rpmh-regulator.yaml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/regulator/qcom,rpmh-regulator.yaml b/Documentation/devicetree/bindings/regulator/qcom,rpmh-regulator.yaml
index 9115885e7985b..ba3f50352773c 100644
--- a/Documentation/devicetree/bindings/regulator/qcom,rpmh-regulator.yaml
+++ b/Documentation/devicetree/bindings/regulator/qcom,rpmh-regulator.yaml
@@ -37,6 +37,7 @@ description: |
       For PM6150, smps1 - smps5, ldo1 - ldo19
       For PM6150L, smps1 - smps8, ldo1 - ldo11, bob
       For PM6350, smps1 - smps5, ldo1 - ldo22
+      For PM6450, ldo5, ldo7, ldo13, ldo16, ldo19, ldo23 - ldo25
       For PM660, smps1 - smps6, ldo1 - ldo3, ldo5 - ldo19
       For PM660L, smps1 - smps3, smps5, ldo1 - ldo8, bob
       For PM7325, smps1 - smps8, ldo1 - ldo19
@@ -72,6 +73,7 @@ properties:
       - qcom,pm6150-rpmh-regulators
       - qcom,pm6150l-rpmh-regulators
       - qcom,pm6350-rpmh-regulators
+      - qcom,pm6450-rpmh-regulators
       - qcom,pm660-rpmh-regulators
       - qcom,pm660l-rpmh-regulators
       - qcom,pm7325-rpmh-regulators

-- 
2.56.0

