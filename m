Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=103.47.186.116
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795663790;
	b=rpLTZ5It13mcUx5sls4mu2N7l7YnWvdCikA3nx3tvvbN5x4PgA4uNGcLThV+15S1DYHd
	 A4rQTs88KDtxbj3/Rt3G4hRtYmUlbhsvhkcLzvg1Ks7v96rBh9m9rk7n1g10t5RScXcqK
	 ztINJ5Wmr2Nvhfrpriv7A2YdFUQJC1btG2Bap9wKFSKHvlZPSSoYwNHaX3pPu6tJMdrnp
	 8M2NVIsqSVyrDapMrwWt13Hjky0c9XeKSIYkPUB3ywsxI4mZ0GlEon5+SzSgZoeUOxRXS
	 DH0cWDBHMYcBd7NNugW6faAC8WiD5LkqYv6LQrIJoHkJKbp000HwOTUFrBhizfnO3uQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795663790;
	h=DMARC-Filter:Received:From:Date:Subject:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Message-Id:References:In-Reply-To:To:Cc:
	 X-Mailer:X-Developer-Signature:X-Developer-Key;
	bh=lwHm2eXGQfsQLxAsDpBUxULj2YCIKJh637GLHu4D0yk=;
	b=4u/dhOVU/EdRgciL6AhqosF+oWG6ee73pNdUiEXklfjEjzgMGRssaIeSwnamBkUb4acG
	 3VWmkkxqU/wG6TapaA1L4w5YM/s0rQnu5/T9MqhSeAOBytwYDwLxDeuMEFJ8tBuEpfm9X
	 fQpdH3h6OWBsAKxZlog/7Yn2XT2Hava4H4bq2ZdPiWcKpdiPdcvvdSX9aITNR5gWfjBTz
	 R6F2vmRrcT3fPY8h6G8u45aOnILbRG+sIiDDcQGy7dfioBbh5KqNkNjgxIiAPZ+gC9gIc
	 tPf4fDs1gPgBTKrUEqwiotLLrM+e/bgzz9ZP4LlUssvom/P/5qon3GQoA07+Z5kzeMA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=krgm.moe;
	spf=pass smtp.mailfrom=krgm.moe;
	arc=none smtp.remote-ip=103.47.186.116
Received: from krgm.moe (krgm.moe [103.47.186.116])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2CA9C606A333;
	Thu, 26 Nov 2026 03:29:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2CA9C606A333
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=krgm.moe
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=krgm.moe
Received: from [10.42.0.96] (unknown [114.242.206.180])
	by krgm.moe (Postfix) with ESMTPSA id 0A17283B;
	Thu, 26 Nov 2026 08:59:45 +0530 (IST)
From: SignKirigami <prcups@krgm.moe>
Date: Thu, 26 Nov 2026 11:28:37 +0800
Subject: [PATCH v2 1/2] dt-bindings: regulator: qcom,rpmh: Add PM6450
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
Message-Id: <20261126-netrani-pm6450-v1-v2-1-2539a2422218@krgm.moe>
References: <20261126-netrani-pm6450-v1-v2-0-2539a2422218@krgm.moe>
In-Reply-To: <20261126-netrani-pm6450-v1-v2-0-2539a2422218@krgm.moe>
To: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Bjorn Andersson <andersson@kernel.org>
Cc: Krzysztof Kozlowski <krzk@kernel.org>, linux-arm-msm@vger.kernel.org, 
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, 
 SignKirigami <prcups@krgm.moe>
X-Mailer: b4 0.15.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1322; i=prcups@krgm.moe;
 h=from:subject:message-id; bh=JTcehRhWC5D7m3DhQb5HW5rKAsfVUWSIVzZ4T5udMSM=;
 b=owEBCQL2/ZANAwAIAV0dOJt2umJjAcsmYgBrB6eAgEoeyzKW3VtCVIjVRluv7ucck+EwvlQPr
 tp9mcXvs2WJAc8EAAEIADkWIQRSClJ2zjncUdNU0FFdHTibdrpiYwUCawengBsUgAAAAAAEAA5t
 YW51MiwyLjUrMS4xMiwwLDIACgkQXR04m3a6YmOjqwwAra+aM3HAQeATT43e1VP18t0PqVPuWKH
 XDcoL5LQuckMX/5ArqaGoC4j3auEpl8i3eZOJMO6O7yyX4KwO6jO61djEex5Cql/Y/2Gq9xV7wd
 94V2TIXEkdBIe4x62mr4T4Evd5VnkXgFo/zv1X3i24rVXk5nFZ7dGE0q5sqlMQEPixgtaPkPMZz
 fNoHflsVXxgAjxpzOWA7osaGVHR4t/ZbeM+MCLCMfv0ztuEbQZzfRseDQ7F4dThry0P2W3XAnFn
 e/f2j4E9ynVcPUNHcrGPpjleiPHqLNE6PIy8vfov84Brqe3bGyD4UGxM+gQ0y194xfB2OmrSjlA
 Pyku3HBNH6f7gU5DZHh8eVfNvAzQQQRgD7d9a3j4F/kFqxzIKy5Aa0XhmDjLQQjc15+0yvuoQqV
 7b9TYDNg3TPH43qCRn/Sma76oCplCfFv6RQDR/2ZHwTGGH35g0vgUBrRwJ6k16sGUvoqZQacr4L
 2xMlHXfszn5nF5rvlXLzVN0v+aE/4X5
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

