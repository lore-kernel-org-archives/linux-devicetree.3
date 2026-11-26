Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=103.47.186.116
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795663787;
	b=sVOkDfdLwXr3jyn24Yx9XFUAHX78dVbwAqnxGr7sEzvRCaVAndAE5sY7UrR17wC0iIWl
	 kxEk3h2KG6lAb6aH0VW9xJkAXYrqWplHvhWErwdOxiQ/HlZhQB865osguiUKCWiqAPnZ+
	 SDVzp0nATyCyVkKt3vMdLe1rYjMj2I3ti2ZgD7h+qAq+olM4XbR98N1ptkSNr886qll1A
	 tgfrxInoj76IfcTDEkCGQCnn7ZwacGw4PdqTV7rWH0EOfVTcip8znfck/7MMcbA2yZfMB
	 d5CAtndQ+1ZScnWVuu1bkSeKn09yV/y7DzDVFXpw2yQWj1wAvwAE/c1X796gvcouUWQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795663787;
	h=DMARC-Filter:Received:From:Subject:Date:Message-Id:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:X-B4-Tracking:X-Change-ID:To:
	 Cc:X-Mailer:X-Developer-Signature:X-Developer-Key;
	bh=uqveYpZAIPX4oyLqBeYJE4Z5XvfPZB/2WvJbeQFEAj4=;
	b=Z1GvcdZNzVQWhiAT7TBIKOFPf0yzncxWCmrFrbewAgoddefyh3WDHQKn3JbwTYeN+PYg
	 yZ0LNIry5IQCC1u0+V8foAbZRukZ6vXfRnLjEQeNAt5c/+mRRBva43LAl4J3I8NyOUb5f
	 0btvXj89ryshzQjyRZ7SKsU8+IQQmBGAv+R37nqw6HikRNwsqWEQcnDw5RzjX7lwDkvb8
	 cg/mb218/fvRYqpvSkUQkD8FUgCGR5J84bq80Y+IF5npBLAzmkE0zOHTHmNk+upjzOkcR
	 lJtDKIZ2P8XGMSfsC1YjaJKkzBfWdWpl5tVHpVTXUJIOypLonBF3EaaUWS9aod2m5sQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=krgm.moe;
	spf=pass smtp.mailfrom=krgm.moe;
	arc=none smtp.remote-ip=103.47.186.116
Received: from krgm.moe (krgm.moe [103.47.186.116])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B9ADF606A32A;
	Thu, 26 Nov 2026 03:29:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B9ADF606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=krgm.moe
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=krgm.moe
Received: from [10.42.0.96] (unknown [114.242.206.180])
	by krgm.moe (Postfix) with ESMTPSA id 9B35582E;
	Thu, 26 Nov 2026 08:59:41 +0530 (IST)
From: SignKirigami <prcups@krgm.moe>
Subject: [PATCH v2 0/2] Add PM6450 RPMh regulator support
Date: Thu, 26 Nov 2026 11:28:36 +0800
Message-Id: <20261126-netrani-pm6450-v1-v2-0-2539a2422218@krgm.moe>
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
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/32NzQ6CMBCEX4Xs2Rq2lt+T72E4VLrAamhJi0RDe
 HcL3k3m8iUz36wQyDMFqJMVPC0c2NkI8pRAO2jbk2ATGWQqc0SphKXZa8tiGnOVpWJBgYUmWaq
 qUJ2GuJs8dfw+nLfmx+F1f1A776K9MXCYnf8cpwvuvX/+mFRghcroIivNxVyfvh/PoyNotm37A
 i5eqXrDAAAA
X-Change-ID: 20261124-netrani-pm6450-v1-17ae284974fa
To: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Bjorn Andersson <andersson@kernel.org>
Cc: Krzysztof Kozlowski <krzk@kernel.org>, linux-arm-msm@vger.kernel.org, 
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, 
 SignKirigami <prcups@krgm.moe>
X-Mailer: b4 0.15.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1457; i=prcups@krgm.moe;
 h=from:subject:message-id; bh=w6wWWt6qcYybsLNCv/CghVZ3LtflD11Zwc9WM0ZEc6c=;
 b=owEBCQL2/ZANAwAIAV0dOJt2umJjAcsmYgBrB6d7uv/YiFWEbxCS4TOWs6Kt399LNVCMP9OXz
 V39Z1e61DSJAc8EAAEIADkWIQRSClJ2zjncUdNU0FFdHTibdrpiYwUCawenexsUgAAAAAAEAA5t
 YW51MiwyLjUrMS4xMiwwLDIACgkQXR04m3a6YmOMMQv/YTGpbSaSlGbTvAsiMkFK9Dshg8Hiu7E
 aSPZyYPAxBWVzpHFs2VtIswfZcxFvSrALqVWH6wMAh3dFYHQB7KwyXLxObZk40aVJaYyo8L+qWa
 +iVJo88cpwPOicZst5JZNkyO3zhUhPOg0/qsP4Fj1bor1bfIohuBCG/DJ2frxaNg19M2Buoz0k0
 /0RpztftpWiQKeCKD60jaG9MUgZuYFgc0Rx+wmTfwjoNPpPryTdRJ0DgtYeqlyMxFxjFJBMD9Rw
 J+qvLVDrL8kzdgHBbPEFotPyVuaIXXXzsAy+8Npe/Bytu7OB9O2eJDe3O0dfn5JhiEOAbJKZEx/
 GytakrsKNGPuBJGerivKtXOJcooTJwf/p7mhXFG4fpuaTsZR7ucyTUU3GoAHaN76ZjWr8WLcZPu
 1OBp2BGZeGKgsZ5NjqPNFE3HeFrqv0hTDaxdAjyqUh6UWKAcjUizoExNOg5zThTOVHMs6F3r92j
 czkmNGIz+GqH5dRyyFknBWUTSngzamk
X-Developer-Key: i=prcups@krgm.moe; a=openpgp;
 fpr=520A5276CE39DC51D354D0515D1D389B76BA6263

Add the PM6450 LDO resources used by Portov. Use the existing PMIC5
NLDO, PLDO-LV and PLDO voltage models, and give each regulator the generic
vin supply name so boards can describe the actual input rail with the
standard per-regulator vin-supply property.

LDO24 uses the PLDO model and retains its power-on-selected voltage when
no voltage request is made. The board devicetree fixes the active rail at
2960 mV and allows UFS to vote load and mode.

Signed-off-by: SignKirigami <prcups@krgm.moe>
---
Changes in v2:
- Keep only the eight PM6450 LDO resources used by Portov.
- Place the PM6450 table after the PM6350 table.
- Use NLDO for the low-voltage rails and PLDO-LV for LDO19 and LDO23.
- Name each LDO's parent supply "vin" and use the standard per-regulator
  vin-supply property.
- Keep LDO24 on PLDO while preserving its firmware-selected power-on voltage.

v1: https://patch.msgid.link/20261124-netrani-pm6450-v1-v1-0-1914da758d3d@krgm.moe

---
SignKirigami (2):
      dt-bindings: regulator: qcom,rpmh: Add PM6450
      regulator: qcom-rpmh: Add PM6450 LDO support

 .../bindings/regulator/qcom,rpmh-regulator.yaml          |  2 ++
 drivers/regulator/qcom-rpmh-regulator.c                  | 16 ++++++++++++++++
 2 files changed, 18 insertions(+)
---
base-commit: 6eba525f2c14486c1a8cac2320ab202097212f5c
change-id: 20261124-netrani-pm6450-v1-17ae284974fa

Best regards,
--  
SignKirigami <prcups@krgm.moe>

