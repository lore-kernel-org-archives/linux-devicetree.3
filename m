Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=103.47.186.116
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795517109;
	b=HKBhKnGb9I+X3ntlNMcgTNsyGdAZddf5PdMXepDjC5cYmnutSwZsGbSWtHMZN3qrW2cf
	 VhAsvgcQfi7inXnHkeMFOoG27fqljfX2GOkmlEuzLUxTmeqSx8Vf3H/mxP+Se9JpgKcGc
	 y+S2NBsehgtferevwwLTrClVljh/YysFh/nU2yYu7oWqeoKsRcIFNfw6rWnR25FWdHy7J
	 NdnugC/6B7rDJhfnsmBH6u0Y4/+vKVYFx1F96t6L6iw3CSjfGaWzL0DW24hVNvqJnnH+g
	 QBtjhrD7uVA48l7bj5lw97kD/Ryis4uk7vd2w4ilriyXvkAM9LrSxv1C8IKqePrJKzA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795517109;
	h=DMARC-Filter:Received:From:Subject:Date:Message-Id:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:X-B4-Tracking:X-Change-ID:To:
	 Cc:X-Mailer:X-Developer-Signature:X-Developer-Key;
	bh=QVcpWwBDvLOR3uuhiJ4NpPW4+vnqSVIz1HFeEPmwlOE=;
	b=ZXctgwAFrn3Z2Tf7Qz1qSGS4SO1qMeeX57PiBymsiUxe/4SvETLpATpVJmu4dmpuPC+7
	 jtlhh6aqEGK3MvFg5WWdaqNa+3erep+MylcetO6vBnSdXMFARBMd/4AfQ2JyZ0pRSJYV5
	 WskFn41kEnvCQlBplLoET85TFDUdfNETX5f2sfr1sdCCK3CGFnUOfFn6KkXXwGCmpHbOr
	 aWkxZJji9edAgtTqxup3m8F+wSgBfP2MpowvNMhwkJSoUc2keS4dK/FA6mKCPizW7EaS+
	 DtF6Os+G7h+nSnzZBiS0MnsWcjmu1c7vAM27UnAtRWxJze7pDjgQDeZUYMmRlJAy9wA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=krgm.moe;
	spf=pass smtp.mailfrom=krgm.moe;
	arc=none smtp.remote-ip=103.47.186.116
Received: from krgm.moe (krgm.moe [103.47.186.116])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0EA80606A31E;
	Tue, 24 Nov 2026 10:45:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0EA80606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=krgm.moe
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=krgm.moe
Received: from [10.42.0.96] (unknown [114.242.206.180])
	by krgm.moe (Postfix) with ESMTPSA id E49F8859;
	Tue, 24 Nov 2026 16:15:05 +0530 (IST)
From: SignKirigami <prcups@krgm.moe>
Subject: [PATCH 0/2] Add PM6450 RPMh regulator support
Date: Tue, 24 Nov 2026 18:43:59 +0800
Message-Id: <20261124-netrani-pm6450-v1-v1-0-1914da758d3d@krgm.moe>
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
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/yXMQQqDMBBA0avIrB1wQhq1VxEXMY46haaSqAji3
 Rt1+Rb/HxA5CEd4ZwcE3iTKzydQnoGbrB8ZpU8GVShDpDR6XoL1gvPX6FeBGyGVllWl61IPFlI
 3Bx5kv59N+ziu3Yfdco3gPP9FgSQ3dQAAAA==
X-Change-ID: 20261124-netrani-pm6450-v1-17ae284974fa
To: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Bjorn Andersson <andersson@kernel.org>
Cc: Krzysztof Kozlowski <krzk@kernel.org>, linux-arm-msm@vger.kernel.org, 
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
X-Mailer: b4 0.15.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=703; i=prcups@krgm.moe;
 h=from:subject:message-id; bh=eAooSlsInfQK4l+MyiyxovowUFu6Gwzc9fj6jRCv21M=;
 b=owEBCQL2/ZANAwAIAV0dOJt2umJjAcsmYgBrBWqO8IYLm6e0zhyqrsvckvFOII8RLZAIwwxBp
 JH7cmpqdr6JAc8EAAEIADkWIQRSClJ2zjncUdNU0FFdHTibdrpiYwUCawVqjhsUgAAAAAAEAA5t
 YW51MiwyLjUrMS4xMiwwLDIACgkQXR04m3a6YmMZZQwAqJ+zN+9UcSpdPGPmPaRLdhxiQF3xUAv
 9g9pBaLY0MNtfXpBXW9AmS+EW+gWMWpDXQ7bO2D7MTq0qbikYVIvPANv24NRE8nJq8cksHRC9OE
 27sv8ALJVjskQ9g7BT3XNRGj0eOlbqR4nvLZIrhgT6IRgedahOshrNaa5ya2ATxqfYNg3hmK6n3
 1zzxuOqCdqhaTEB9NNgDW/OhEt/30PdxMUkzKC32tdzDlj7dQGEBd2hlhhXy28JiOZHuUdOe1uh
 B+6IYntsLNeUzKEtF2gloztYrBzsoym8K7rcoofcFtrwKp/U9J9XOBqO3IUvYtQ75HFKRgSdfHe
 xbohoIDSMP8tvdQ0+4A9bsMXdxEnmPyigkqj8aCrbTwHd08mZgsoIan2Vm14XJBe7PjoqlfhM9H
 TFGtiBc5WP8akTFDmxysfPpw4Ti3FeA3YDU5eWOPa99qIP4yff+YmhHJwHmEXzKTuMyJ51Y+FSl
 IiZiqGpWRrxTxdiB7zfvC1weRkUWK1m
X-Developer-Key: i=prcups@krgm.moe; a=openpgp;
 fpr=520A5276CE39DC51D354D0515D1D389B76BA6263

Add PM6450 RPMh regulator resources using the existing PMIC5
NLDO and PLDO models. LDO24 preserves its power-on-selected voltage and only
accepts enable, mode and load votes.

Signed-off-by: SignKirigami <prcups@krgm.moe>
---
SignKirigami (2):
      dt-bindings: regulator: qcom,rpmh: Add PM6450
      regulator: qcom-rpmh: Add PM6450 LDO support

 .../bindings/regulator/qcom,rpmh-regulator.yaml    |  2 ++
 drivers/regulator/qcom-rpmh-regulator.c            | 38 ++++++++++++++++++++++
 2 files changed, 40 insertions(+)
---
base-commit: 6eba525f2c14486c1a8cac2320ab202097212f5c
change-id: 20261124-netrani-pm6450-v1-17ae284974fa

Best regards,
--  
SignKirigami <prcups@krgm.moe>

