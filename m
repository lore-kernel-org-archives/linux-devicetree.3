Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=109.224.244.107
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792840267;
	b=Io5NM1yLoVY9Jha1ifaOHixew3kGtOmmfnrF7pynUZZCqol73+DPat5sIdmpYlFQR380
	 wF4Dc63VDl2ALTqMpoi1FgAjeaOw9cN8j4L+lIQBE2KUEhH7ogaYZsisMpKxJ4EjHAaDn
	 kYKdbnB8iVDuFZgnPetnYYGbUzydyqsRUrb5A61saZtdt2bH2UhvDBG+ee417+onnvMj0
	 dI7xZJP1M0Tj40Xc30sFnXVx36hX7dtToIQr4D+6lOmABeR5vJtAm/QRg9y/ScVeTBA3v
	 x2X6Wtl+Iyh8lycMXBXgpyHof3PZ3RFOcRM8FsX6tt7Gj5gK8Sd00CZVR3cDjJguFaA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792840267;
	h=DMARC-Filter:DKIM-Signature:X-Pm-Submission-Id:From:To:Cc:Date:
	 Subject:Message-ID:In-Reply-To:References:Content-Type:
	 Content-Transfer-Encoding:MIME-Version;
	bh=liW1fhZE4Evx5nrjP3rA8L+dUEbt7gLFFRSoZMl5fGY=;
	b=fciwfZHIdXsLL2mSnpKpg3DXg9Zxy7y1LndDDMo3uMF7Z4ZTl5zDW+vcc7r9KfXUSbgU
	 ma/tNsUP8Jo86geDGT0QGgskCUXcumBwQ7cV7oY8xSMvPweiTrGgdcnxvgw5MdC3pitv5
	 0xFwhorUmgpLrRzJd21rqp1t7YU6LrMWSO3x/JX4B3eA12QBq5xJA7SjhnDO3xcSMAH6a
	 dyqp+yk97b4dQ95eCt/OAcwTVwTQvOOnxw+qjoRqpMHNr7KFNZWFD6c91cSCqpk1Oy6Ug
	 xahXataCal9mDMx5LHhry9bZEdoXf+N6U0MR6m1k340lW8H7dWWu2hREdvyUBtbpVZA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=michaelmcallister.org;
	spf=pass smtp.mailfrom=michaelmcallister.org;
	dkim=pass header.d=michaelmcallister.org header.i=@michaelmcallister.org header.a=rsa-sha256 header.s=protonmail2 header.b=KqtsF4p0;
	arc=none smtp.remote-ip=109.224.244.107
Received: from mail-244107.protonmail.ch (mail-244107.protonmail.ch [109.224.244.107])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 68281606A328;
	Sat, 24 Oct 2026 11:11:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 68281606A328
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=michaelmcallister.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=michaelmcallister.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=michaelmcallister.org header.i=@michaelmcallister.org header.a=rsa-sha256 header.s=protonmail2 header.b=KqtsF4p0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=michaelmcallister.org; s=protonmail2; t=1792840265; x=1793099465;
	bh=liW1fhZE4Evx5nrjP3rA8L+dUEbt7gLFFRSoZMl5fGY=;
	h=From:To:Cc:Date:Subject:Message-ID:In-Reply-To:References:From:To:
	 Cc:Date:Subject:Reply-To:Feedback-ID:Message-ID:BIMI-Selector;
	b=KqtsF4p0RdSLufrMrraPuwF+pOebvoZyyBN+5+Iq+tRIt+vMA7uyYbWrQpD4URoHe
	 s92a9gxTDLoGXJDSpdwR5aNkOxcx+Zr14df7Izcmb1dpIsBmoKhPRocJoOGm2gM4ij
	 A3fWh2xNi/RnnHde67K2ob6qEg1o4MzcFIMrVeOwAzvnfZVgGrGBuUiQk8valpdDMr
	 fYEobm5wAxbOT/gPNT9k56BY5kLurjPEvhsu+91TWWbRWs2aa3Auer/7DUVJkOSauz
	 acyCYaVR9dkYCIg++Q/+i1BFe9sn1FjfpJdoZeZnsxvoL2cYMdNvVFMxVTRJzk7FQv
	 z1/SQXuyu4ZHQ==
X-Pm-Submission-Id: 4jBcdM0bhNz1DFSm
From: Michael McAllister <me@michaelmcallister.org>
To: Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Date: Sat, 24 Oct 2026 12:10:08 +0100
Subject: [PATCH v2 2/3] dt-bindings: arm: qcom: Add Motorola Moto G10
Message-ID: <3fd5ee049e08ab8b98e2f9543a0c7edc237caaf8.1792840208.git.me@michaelmcallister.org>
In-Reply-To: <cover.1792840208.git.me@michaelmcallister.org>
References: <cover.1792840208.git.me@michaelmcallister.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0

Document the Motorola Moto G10 (capri), a smartphone based on the
Qualcomm Snapdragon 460 (SM4250).

Signed-off-by: Michael McAllister <me@michaelmcallister.org>
---
 Documentation/devicetree/bindings/arm/qcom.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/arm/qcom.yaml b/Documentation/devicetree/bindings/arm/qcom.yaml
index 121ca557c..963fd482b 100644
--- a/Documentation/devicetree/bindings/arm/qcom.yaml
+++ b/Documentation/devicetree/bindings/arm/qcom.yaml
@@ -1051,6 +1051,7 @@ properties:
 
       - items:
           - enum:
+              - motorola,capri
               - oneplus,billie2
           - const: qcom,sm4250
 
