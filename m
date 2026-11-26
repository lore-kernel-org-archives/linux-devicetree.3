Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=103.47.186.116
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795678819;
	b=thRFe1BJJnXeJYObkqgEg+t7OeJSgv4l/9vbH8PnO9T4ILN0rI6IIcRFSmZ2pnMMGIGz
	 huRd5hzD7/JAt3pvUsVOZA6lUhWRqc/eub/Pakn8Cf0FLYFDQwLH7GyAt6p0vyRLQ7HRm
	 kNiZThm09naMH9pDqteT/wwDDEzC6skXMDg+nZOLwLL+xYyUa6E25lsZ2LqbvQ1KfIfdo
	 dvSvuc1puXoRA7dxKrcVdKIgYpJtiU8n30xuz6L6BzpOQjziKM2fJceIB5aIp8pRBfatd
	 OstiHpBy5aGid70gVySZGV+AXSet/DYIz2OhfoUqxVxQL5YmHlvKa3DwqmCwia+q08g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795678819;
	h=DMARC-Filter:Received:From:Subject:Date:Message-Id:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:X-B4-Tracking:X-Change-ID:To:
	 Cc:X-Mailer:X-Developer-Signature:X-Developer-Key;
	bh=4thhFzUIEKofikFXMJy1xLRGHUUUSp+pHGpAABWa0iw=;
	b=X/0UU9vZDNeRI9HftXeyaMtUz9YCJdc7Mi9Wr7MJjygzoFN/nv5hm4bORepvBngYoqog
	 3bNd3GE882lFi+8d7vemFe6Joee4RJKOsifDo2YxACpaA4VKOu9mK1E1EQIfSLlJ3Kv/J
	 F/u0HNM4DBH1OnZJMZB3QtXGarxDkPC/Zj1KNeK9qhgGbh/+j9s5OqjPvYnCfXxT2OwlX
	 ib3fj5d/54JzPd6IC+ghys+aPZwlZkeCsKrpuREvi5PEREsjUXl8zDsgj5L3Z2UCAFLcG
	 UB+tCwVJAHZcHb+Ojhpqc3djON65cmGtpWkZ7YkcNBX2mQBLScNJOmcRyAnIKkblz7g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=krgm.moe;
	spf=pass smtp.mailfrom=krgm.moe;
	arc=none smtp.remote-ip=103.47.186.116
Received: from krgm.moe (krgm.moe [103.47.186.116])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 35828606A31C;
	Thu, 26 Nov 2026 07:40:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 35828606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=krgm.moe
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=krgm.moe
Received: from [10.42.0.96] (unknown [114.242.206.180])
	by krgm.moe (Postfix) with ESMTPSA id 0282C82E;
	Thu, 26 Nov 2026 13:10:13 +0530 (IST)
From: SignKirigami <prcups@krgm.moe>
Subject: [PATCH v3 0/2] Add partial PM6450 RPMh regulator support
Date: Thu, 26 Nov 2026 15:39:10 +0800
Message-Id: <20261126-netrani-pm6450-v1-v3-0-2343209bbf4c@krgm.moe>
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
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/33NTQ6CMBAF4KuQrq1hhvLnynsYF5UOUA2FtNhoC
 He3xQ0LYzKbl7z3zcIcWU2OnZKFWfLa6dGEkB0S1vTSdMS1CplhigUACm5ottJoPg2FyFPugUM
 pCStRl6KVLOwmS61+bebl+s3uebtTM0coNnrt5tG+t6ceYu+fHy7lUINQsswrlanzw3bDcRiJR
 d7jHih+ARgAzLNaokBEqHbAuq4fYz6nsAQBAAA=
X-Change-ID: 20261124-netrani-pm6450-v1-17ae284974fa
To: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Bjorn Andersson <andersson@kernel.org>
Cc: Krzysztof Kozlowski <krzk@kernel.org>, linux-arm-msm@vger.kernel.org, 
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, 
 SignKirigami <prcups@krgm.moe>
X-Mailer: b4 0.15.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1847; i=prcups@krgm.moe;
 h=from:subject:message-id; bh=/WMPnUcSCax1I5FIgEs9RRrgIJZ7iNEyFAjf/x74CvM=;
 b=owEBCQL2/ZANAwAIAV0dOJt2umJjAcsmYgBrB+Izg3FL1a8lp0ZOpdxbwGC7RRRBzOd3PVJAv
 M8zqchWQk+JAc8EAAEIADkWIQRSClJ2zjncUdNU0FFdHTibdrpiYwUCawfiMxsUgAAAAAAEAA5t
 YW51MiwyLjUrMS4xMiwwLDIACgkQXR04m3a6YmO6DgwAnW/8c7TVwOVPB6q26c+oacZ4V90mmCZ
 mReYSuIF2TkdAqqZN/5VjCEwAlPaC1L02/Q+n5+wdyidm30LOmfGgyNLqcNUUojtBcKq1tg5Lzo
 /mjhC9PwSdK1q7YVGJNQoSoCx1RAFXWcgK+eStzBTJwuSDLAF+gYCL3Ey35VcEU0GRg4kM39lbN
 XxWfinEMDXj8yOLMDRhm0Yb17kmYNtiJeobVd0yMClGzFzt46Y8tTvih5MKUb6LfJisdvZGhhPu
 qtCU1niQlThq+0nWZiYRN9j1AC9/3xv7+c9vb1+Qw6Y5XESSxYIPvu2+krPHluvyLZC/J2qhdlQ
 cQxd0FXfPBLb0+bijaBFGc8/6Twz6vdA9O76K++cbH3TOd2L0hQC22ZGLDfp695ECRl96ZwxIFo
 KvAIA7jI8al73vYUC9L1vEP/Nw3CcSn9mD0MFF6sPOh09/NvOEx0u2M0OEi+CY4VeaG8/yKRP/f
 7BPESr6xcaoVU37/2ezdKVa12n5bQh7
X-Developer-Key: i=prcups@krgm.moe; a=openpgp;
 fpr=520A5276CE39DC51D354D0515D1D389B76BA6263

Add the eight PM6450 RPMh LDO resources used by Motorola Portov
(SM7435): LDO5, LDO7, LDO13, LDO16, LDO19, LDO23, LDO24 and LDO25.
This is the board-used subset, not a complete inventory of PM6450
regulators.

Signed-off-by: SignKirigami <prcups@krgm.moe>
---
Changes in v3:
- Clarify that this series adds the eight board-used LDO resources, not
  a complete PM6450 regulator table.
- Replace the generic vin supply name with the five PM6450 input-pin
  groups used by those LDOs.
- Declare the five matching parent supply properties for the PM6450
  regulator controller in the binding.
- Explain that the PMIC5 voltage-model choices follow the board voltage
  ranges; load and mode requests are supported by all three models.
- Keep the RPMh resource set unchanged.
- Link to v2: https://patch.msgid.link/20261126-netrani-pm6450-v1-v2-0-2539a2422218@krgm.moe

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
      regulator: qcom-rpmh: Add partial PM6450 LDO support

 .../bindings/regulator/qcom,rpmh-regulator.yaml          | 15 +++++++++++++++
 drivers/regulator/qcom-rpmh-regulator.c                  | 16 ++++++++++++++++
 2 files changed, 31 insertions(+)
---
base-commit: 6eba525f2c14486c1a8cac2320ab202097212f5c
change-id: 20261124-netrani-pm6450-v1-17ae284974fa

Best regards,
--  
SignKirigami <prcups@krgm.moe>

