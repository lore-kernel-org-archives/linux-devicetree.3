Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 78D2739B4A6;
	Thu, 30 Jul 2026 21:52:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785448337; cv=none; b=auRcvYXODk/ygVLPmTCj/ClOO0Hyg6g/lcufEK4PX4fyEQOJXoE6JziAk+BVtFTfslwKDiKVRtuyaEHcpzz4DKzhwT54WgOAEhjl9S18NLblyIMIW+pO9MDBEog813efIWJUXtvkMP1mro0OqsEDwMkiT0H/JNnzM3ZYEw58yFA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785448337; c=relaxed/simple;
	bh=eal9G28T5whWn85NtRXkvtfPeAVFqFjdK1pHXLc1jvo=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=F/ZmaLazXB4RAhlmZ+RlrOMRN5TrtgKqC8yJkcAVkiwnEiGfgI2DGZBdlonfKUilEUp5s4uUCxkooH/6djNyBhAxQIKQpaZ8tembOxnxJAXmOSgKFOwW0AYcyyE2eXXSzyacL6OuAJemhiQdyFBZMb87awTq1mNtpQgcEuwoyPM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Du/ecM7N; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Du/ecM7N"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 2ADD7C2BCFA;
	Thu, 30 Jul 2026 21:52:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1785448337;
	bh=eal9G28T5whWn85NtRXkvtfPeAVFqFjdK1pHXLc1jvo=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=Du/ecM7NFfx9SdawEhe+Q9BiOXQ4M9+PWCG5NaVkjmiAbCvYgu2pk2lLajG5ria1h
	 Ri1qfLyI7a2QHqfjPL4H17G5hN8qm/1LIyKLbReRBog185OKvO8GtnxcWlUXR4PwiB
	 T102EWxLRRL2weZwGflp7k+4r5AmyCD4VYQC/I63aCqqWmPESb/k3SM1/PHvVCOItA
	 cnzSnPulWPItvhCVWisqTftVEtSuVJlLgnrN3GznbTSb5b4bt1ulqbuZJLMqaxRKD3
	 /UvAxgv4YM9LjcYMoIn4xmgsAkK6ZfoIcLnhkfuu+CuBxrRsWDt8P8X81wQv0ESigV
	 m6gC9v3yxSXPQ==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1556AC55171;
	Thu, 30 Jul 2026 21:52:17 +0000 (UTC)
From: =?utf-8?q?Dawid_Wr=C3=B3bel_via_B4_Relay?= <devnull+me.dawidwrobel.com@kernel.org>
Date: Thu, 30 Jul 2026 23:52:02 +0200
Subject: [PATCH 3/4] arm64: dts: qcom: sm8250-xiaomi-elish: label the WiFi
 node
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260730-sm8250-xiaomi-enuma-v1-3-ed6d8fb99668@dawidwrobel.com>
References: <20260730-sm8250-xiaomi-enuma-v1-0-ed6d8fb99668@dawidwrobel.com>
In-Reply-To: <20260730-sm8250-xiaomi-enuma-v1-0-ed6d8fb99668@dawidwrobel.com>
To: Jianhua Lu <lujianhua000@gmail.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Jessica Zhang <jesszhan0024@gmail.com>, David Airlie <airlied@gmail.com>, 
 Simona Vetter <simona@ffwll.ch>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>
Cc: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
 =?utf-8?q?Dawid_Wr=C3=B3bel?= <me@dawidwrobel.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=793; i=me@dawidwrobel.com;
 h=from:subject:message-id;
 bh=9PgRYneIZ007uPWyIFA5A8vuFZUckwmPT37f8xhISQU=;
 b=owGbwMvMwCV2qrTGfeXVd28ZT6slMWRlH++/dsorLKNw2Qa7Z4y/HeQ5bl3/+Jv71r1Ta5cXH
 3Nb0OPZ2VHKwiDGxSArpsiilxa0xyr45fd3L36Hw8xhZQIZwsDFKQAT+f+ckWF9ewOLn/J69/6Q
 dGvGj/XXUpek5elkuHc8m7CR8e6XyZkM//12//8+w1bI9taWj1fEo6pz/D/8S+tacsdnYe4chdI
 nBjwA
X-Developer-Key: i=me@dawidwrobel.com; a=openpgp;
 fpr=B64A778E0E64049A70C831C8B7B81FA12B282A92
X-Endpoint-Received: by B4 Relay for me@dawidwrobel.com/default with
 auth_id=901
X-Original-From: =?utf-8?q?Dawid_Wr=C3=B3bel?= <me@dawidwrobel.com>
Reply-To: me@dawidwrobel.com

From: Dawid Wróbel <me@dawidwrobel.com>

The Mi Pad 5 Pro 5G shares this device tree but needs its own board data
variant, so give the node a label to allow overriding the property.

Signed-off-by: Dawid Wróbel <me@dawidwrobel.com>
---
 arch/arm64/boot/dts/qcom/sm8250-xiaomi-elish-common.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/qcom/sm8250-xiaomi-elish-common.dtsi b/arch/arm64/boot/dts/qcom/sm8250-xiaomi-elish-common.dtsi
index 19aff83ecf7b..12a2ba48340f 100644
--- a/arch/arm64/boot/dts/qcom/sm8250-xiaomi-elish-common.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm8250-xiaomi-elish-common.dtsi
@@ -817,7 +817,7 @@ &pcie0_phy {
 };
 
 &pcieport0 {
-	wifi@0 {
+	wifi_0: wifi@0 {
 		compatible = "pci17cb,1101";
 		reg = <0x10000 0x0 0x0 0x0 0x0>;
 

-- 
2.55.0


