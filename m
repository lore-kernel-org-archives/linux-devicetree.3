Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=109.224.244.108
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793052632;
	b=ghsej8gFXo9wNSuPyJ5+y3lBIgmh6xF97hyQRCj/0zMkjj+fS3jfldf2EhvbFXbIungs
	 ePBrLBm333m6NgPZbg4xFReMxKL8baV2uPxzZKHoKmrgaXi4zuuQ4Ou61cpWJVdf/urlg
	 P0zUWdrlrJugzX8n8c/YGxr9y9J9EIHl4SoVA+Xr/FKK4PspM3IIT57AyL1Z6au6KrzUE
	 pHN2784zV/4y0lLV7fa0+ClbAyL3rSLYEShgiG4fS8VbZECdbCshF9qynAAz6Gr+ZYpuh
	 V3jA+9kSdjwIjTm31ArxJH2z61tSd9lit4tMS6n9+WpPEBNt2PcjMvLG+CYK8+3kiPg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793052632;
	h=DMARC-Filter:DKIM-Signature:X-Pm-Submission-Id:From:To:Cc:Date:
	 Subject:Message-ID:In-Reply-To:References:Content-Type:
	 Content-Transfer-Encoding:MIME-Version;
	bh=vrN/hhQMXGkcFSMs0B04j/tOS77VxRcxqT3bC1JP7+Y=;
	b=EdnSDQwCOYeOn1EEnTK4l0pCBs0q7sYmYO+I7dMz7WiKrfpop1k2ParsFGbPmwhkhkdq
	 bdHsskCpfOUJuPHV0e3pZwTBrQP/+O3bVHNRE58t7ssaDRNtIvelN4VysKvYcx9rMd9Bh
	 589bKftyZJM22ucZ4V9pUBT/u1WR4dm/H+E7hDJ6ACn9e1IEPxJA4W8P3AoQXb9rwzfxS
	 mUeuy4F+dTUpu0AD+QOWLemrVP6zk32ccZ0mwT2kS6IprmJnQwfEvm3srezTK2gW6UjLW
	 CEhaNu9tNNFfvE0qkd/SHSyUVhqxstTthJxGa8QhFPWsbDJySiG0d0pgXsF7gS5KCkA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=michaelmcallister.org;
	spf=pass smtp.mailfrom=michaelmcallister.org;
	dkim=pass header.d=michaelmcallister.org header.i=@michaelmcallister.org header.a=rsa-sha256 header.s=protonmail2 header.b=GxJXWp5I;
	arc=none smtp.remote-ip=109.224.244.108
Received: from mail-244108.protonmail.ch (mail-244108.protonmail.ch [109.224.244.108])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9D25E606A335
	for <devicetree@vger.kernel.org>; Mon, 26 Oct 2026 22:10:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9D25E606A335
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=michaelmcallister.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=michaelmcallister.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=michaelmcallister.org header.i=@michaelmcallister.org header.a=rsa-sha256 header.s=protonmail2 header.b=GxJXWp5I
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=michaelmcallister.org; s=protonmail2; t=1793052629; x=1793311829;
	bh=vrN/hhQMXGkcFSMs0B04j/tOS77VxRcxqT3bC1JP7+Y=;
	h=From:To:Cc:Date:Subject:Message-ID:In-Reply-To:References:From:To:
	 Cc:Date:Subject:Reply-To:Feedback-ID:Message-ID:BIMI-Selector;
	b=GxJXWp5IxsO6KxTWyDMyqiGpAkKcpU6SqYtDUGHDiibxKhZ2+EuDB20RvGa31d3Sy
	 5lQmpHfviGTnBFjo8tqkhOoh9AdU3SZa89uT+IKzUySlOf1N9oVj+AaBhZDfT4drKi
	 MMbdfdOxrvzmAD9IT2ZkCFWKSw64YYNsyVqqP1ZwLmjQPWoM595YEZDfGEmzdglxpC
	 Q0VA+xnRU1XuccsKwWedhtWnoS6b91YwCW8mUxyCde/LqqQzR+5M/h7ZhOpXtWm/pR
	 m8hQLLO8JzWHUfRPLqdfxKF8tOpD/dG1uu0TWQGIUqZtxgt3F7x+Fv2kwzT/XK8eKv
	 giKmCEyvAUQEw==
X-Pm-Submission-Id: 4jD79H3jjxz2ScXb
From: Michael McAllister <me@michaelmcallister.org>
To: Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Date: Mon, 26 Oct 2026 22:10:16 +0000
Subject: [PATCH v3 2/3] dt-bindings: arm: qcom: Add Motorola Moto G10
Message-ID: <179305261664.94591.14378868402048469857.capri-dts-v3-2@michaelmcallister.org>
In-Reply-To:
 <179305261663.94591.5491359960257085739.capri-dts-v3-0@michaelmcallister.org>
References: <cover.1792840208.git.me@michaelmcallister.org>
 <179305261663.94591.5491359960257085739.capri-dts-v3-0@michaelmcallister.org>
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
Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
---
Changes in v3:
- Add the received Acked-by tag.

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
 
