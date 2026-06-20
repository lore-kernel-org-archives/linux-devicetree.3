Received: from outbound.st.icloud.com (p-east2-cluster1-host5-snip4-10.eps.apple.com [57.103.76.93])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6550533E37A
	for <devicetree@vger.kernel.org>; Sat, 20 Jun 2026 17:53:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=57.103.76.93
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781977989; cv=none; b=I6FibCn1X8zoitspRe3IsrXnhorkXGFTO5MrK4rIdGvyHPxfr9b486YrOL3Xqs4dOwh8paMI2X4QWnE12riJ3Ha2d3eByprrE1C5LNMGIlubLHtM1PT2Pug9FdEPaV1vCrVfoQrgRUUrzW5mkCxrerVnhD2YKcT8Hj/ZHboOj7g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781977989; c=relaxed/simple;
	bh=UyWb6pnTNSl7FtIUcW9vT2lCEhe5v39Zkl1Oa7kB4ow=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=l0RyPiHOe4wwF17QmX0U3woGlfapt4EL9pHdHD4d1KjU6vubUJ6JYpU7lzlJifE7RFc6Lzu+xQLUWVBOmX5Xtfgp0h4gJmSweDqE2ebQuVvCacZRahkF/97F2LJHQeRxzLzm9KuCuwVdkuSfGMP4wGS+l3xeaEZAlMjDl8UPj0I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=etehtsea.me; spf=pass smtp.mailfrom=etehtsea.me; dkim=pass (2048-bit key) header.d=etehtsea.me header.i=@etehtsea.me header.b=bW+uo7i5; arc=none smtp.client-ip=57.103.76.93
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=etehtsea.me
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=etehtsea.me
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=etehtsea.me header.i=@etehtsea.me header.b="bW+uo7i5"
Received: from outbound.st.icloud.com (unknown [127.0.0.2])
	by p00-icloudmta-asmtp-us-east-1a-60-percent-7 (Postfix) with ESMTPS id 2CAED18000A2;
	Sat, 20 Jun 2026 17:53:06 +0000 (UTC)
X-ICL-Out-Info: HUtFAUMHWwJACUgBTUQeDx5WFlZNRAJCTQ5AHVwDWxxBAFYHXxcOVk1UGVoBdw5GFVEMQAhWRV8VGR5XUFIfVxhNC1YMGQZXUEsbDlQXA1ccVkVcGEMJXQVXHB0eQ0VbE1UXRgkZCF0dGQhHHwowA0IOVgNDB0UALRkcV1BSH1cYTQtWDBkGV1BUEVdQC1kCQg9IBV8HWgVFC0kDQwZSB0YKVQFAWgpbHHkdRwhfH0EVWFZeCAlLRglJHQ4OQhhGH1QnVwJaClse
Dkim-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=etehtsea.me; s=sig1; t=1781977987; x=1784569987; bh=TGsVl2Kgw+QBA+rKXrQefJZSk37XNV5EiJDh4rNKHe4=; h=From:To:Subject:Date:Message-ID:MIME-Version:x-icloud-hme; b=bW+uo7i5aGNOrJYajkGHInjbj3628KP4vVbqxMDolvRkdikgua5lxNIC+AssCXo9YmotMJheGknKFBcObAbfQ+arCLOATPHSDH1yexEvomNDTNnUEubUoSlfbMtUJUxThhqUB0ovmxjUr2efmZiG2RKd61qbG62EvhwjHCs7NbH+uoVYFt7QfOpkxSOtd/kR5hEfujR3Wy3cY1ktgMc+Z5byG+igoyDbTSCzmqR0M5pNoOeWcLdOAvEcCVIPoDhe97g/Xpb56L8ORMYM07z3Sc+Zva/z9O42wEocg9l7TMMdRC7KAGMMA6G5FM3d3ovCYciLtMW2CLpJ2P9mG2PggA==
mail-alias-created-date: 1634905887181
Received: from localhost (unknown [17.42.251.67])
	by p00-icloudmta-asmtp-us-east-1a-60-percent-7 (Postfix) with ESMTPSA id 678E418002BC;
	Sat, 20 Jun 2026 17:53:05 +0000 (UTC)
From: Konstantin Shabanov <mail@etehtsea.me>
To: Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: Konstantin Shabanov <mail@etehtsea.me>,
	linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v3 1/4] dt-bindings: vendor-prefixes: Add HONOR
Date: Sun, 21 Jun 2026 00:51:55 +0700
Message-ID: <20260620175210.19563-2-mail@etehtsea.me>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260620175210.19563-1-mail@etehtsea.me>
References: <20260620175210.19563-1-mail@etehtsea.me>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: QI44P62JVbJ2rAId6x0V1eR9mI7fVp_M
X-Proofpoint-ORIG-GUID: QI44P62JVbJ2rAId6x0V1eR9mI7fVp_M
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjIwMDE4MiBTYWx0ZWRfX8QtlHVnAKH9T
 /7iviqIT7V1561xsjuRW8jwBkWNdGOGv/7gjb5OhFCfF2WIxZNPqxHfCoYkPM48MnnQGu0dlfTC
 uRYKo6Ia6t0EQ828PwpjwZ39oASMk5zIjkZQs0rBNqEfsN30ySCiAzfbqS7M1cqyFJA1xnVL67C
 vTKG2+QZTShUPVQqeHASuJxAcHSqpMVXpkLoQXhpWd+8upkurh5i4YJvq13sBehgMhLXIx0+qG6
 7RrgZi8i9GYmxGveMpwrUw2lWsZC9SCC+ghhGNxwcLNSRLzxH25xPlAHxmBP27jhkiIr1XrEO99
 Vsw8SYjCR53G9TjMQ/o

Add vendor prefix for Honor Device Co., Ltd.
Link: https://www.honor.com/

Signed-off-by: Konstantin Shabanov <mail@etehtsea.me>
Acked-by: Rob Herring (Arm) <robh@kernel.org>
---
 Documentation/devicetree/bindings/vendor-prefixes.yaml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/vendor-prefixes.yaml b/Documentation/devicetree/bindings/vendor-prefixes.yaml
index 6b9fb6a6bf0b..293cbc26deac 100644
--- a/Documentation/devicetree/bindings/vendor-prefixes.yaml
+++ b/Documentation/devicetree/bindings/vendor-prefixes.yaml
@@ -733,6 +733,8 @@ patternProperties:
     description: Honestar Technologies Co., Ltd.
   "^honeywell,.*":
     description: Honeywell
+  "^honor,.*":
+    description: Honor Device Co., Ltd.
   "^hoperf,.*":
     description: Shenzhen Hope Microelectronics Co., Ltd.
   "^hoperun,.*":
-- 
2.54.0

