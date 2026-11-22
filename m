Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795324372;
	b=B9EQA80omCxug7MZYgNu1fe16dsq/n/RZUzLgjnJCwQtW8ycfo8wI35IWjwyRjFVZlUS
	 3R9FVKTtvjUbaWGgZlMubKJUHRe0RSjpeor368O2meq+dfOByZdCTUT/ibkuiTYaw4HOT
	 LzKBKFs6CZBC54cgxAmiSOkVcWGYONT2HIgvxySQhRdJn6zSrZD6TopYjIVdHx95M1iBp
	 zSySR4PxNsmJB9y4Sguu6ABRqn/bF1KFhoykTdV79pwcfG9RlEEc1JdWspTm7ZQf7NmbH
	 Dgb8yFUeaRx+dyPSdWIe8DinLagD5DJxpGmqVHLwAWK3ZiBzSfbwBZYhUpS61d7xAww==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795324372;
	h=Received:DKIM-Signature:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Message-Id:X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=dT9HfJz7U+QbUQyrTE0uZ76gRqURx8XLKtGOYEz6O4E=;
	b=PCjnLq6ZoxHmv1WsbqCVXq8Yf/yWGnGKsLIgm/p+2q126kN9MOKTe1mlylBx6h+QTwL2
	 QRRaD9OkglvwKyVHjQmWw7oC4qFj+SE8WKvxNOpkrP+rJ93HW7mJaL3l7iw1GGvYfQmC5
	 AszwN1zSg9FmOKlPow7h2EYLwBpbQpRS/+j4xVHtKkBTnqRc2VSmL3kJfRqrwhYkVADKA
	 Ft9P6oQnEBArjfvRR2QUEwo+uWJek/i7lNJWL8khKcioqhuBrd4njlj4apUfpFq1xhotv
	 J9dS3WYs/TOU8EheNS40hE1/BEUbSVhW0mSucrDjDNwiawPxHy0MCUawsW/Dc6SltHw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=UR1RZ6K1;
	arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7DFA0606A32C;
	Sun, 22 Nov 2026 05:12:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=UR1RZ6K1
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1795324372;
	b=Sav+Qn8tPlq0yLTxg6FAe6hAovXSrh20Czk8e1njctaSvn0pTpTDzI+DtHBcIxV3srFZ
	 snt3NEng/ZRx/p3tAtLv2a7cR2fdDfD1UWxXvO2TWtlWgQBZtupq/xPLJ/IdIf0oGEiaK
	 UW9ppKqOCBjTrfsrStrU7b5C+QL+CTKBrIy2nDouH9AP8zsuhiTdogEgvpRC1cD95rfns
	 G9oNOzuvuHA4h8A9/HJtCXvuKmTbfqE9ih0U5KZV/h40DvpJ1O3lyhpA8TKSUwe32VKpk
	 s9VFm51p3BZkIkdbGk5+mLVhX1nd+/2ZKkYe9VSw59rtg6ksrKK+vOo4JGuoOrWtwHQ==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1795324372;
	h=DKIM-Signature:Received:From:Date:Subject:MIME-Version:Content-Type:
	 Message-Id:X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=dT9HfJz7U+QbUQyrTE0uZ76gRqURx8XLKtGOYEz6O4E=;
	b=w6YfswGf5r04y33rcg2AZYby630W72MutR6WoLnwvF9aWqlL4PL8/i4l11XZQ1E096sd
	 KGvxpKie6HkSIEnE8otIvI+m4muikDf9QqBAGuNEMGkoJuFRBH/ZpH+ivg/rleUFb8Lfg
	 BPgdjBrQn0yu3KzQOvjTjaP094tT57sF9jo99dg9RWoK6RwGNkFcSVY5bRA31xO8Fqdyi
	 U+V439ZdOs8rcayOB6lax+buAJ1No3ahPtdf6ykcvg0b0ASuZ91YSCGoegvlCrP+X7dAs
	 lzHxaKfXU64EfsUGa9cLAw5qIB2J4c5APK8kAI1kevLPAx9Pku6bjDQPJAS+paREqpA==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id A07701F000C4;
	Sun, 22 Nov 2026 05:12:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795324372;
	bh=dT9HfJz7U+QbUQyrTE0uZ76gRqURx8XLKtGOYEz6O4E=;
	h=From:Date:Subject:To:Cc:Reply-To;
	b=UR1RZ6K1M0XL2q7pLiQ+busDdf+vO14WeG0rv9CIV6aNograG4RjlCMQ4u86LxHNN
	 /FmYNEAbWrggBplDTBhhje2FkqB1eVRadt37LAkhn25Sbr+Pwp588aSm8dAeczq3TZ
	 uWCqrtHOVX8M58QOojXxEuZexOLm5QJUNaplhnNkGqbUKbvOJgw2mHGZqylM0X6Wuc
	 G27xKjeYA+XR8jFMFA32oVsoTy5cXDs6Ow1pLy0XV0yIg4TCKDnueUUQvh+8/2HYDL
	 LpHxWoNHSBt+co6sANsRCWJLTvyJq3IJNTZb82BgZCkJUZdzqpOXP+WcyZEgBn77lU
	 0mCl3IAhR1XtA==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id 303F14BF13;
	Sun, 22 Nov 2026 05:12:51 +0000 (UTC)
From: EMCP333 via B4 Relay <devnull+emcp.enser.io@kernel.org>
Date: Sun, 22 Nov 2026 05:12:49 +0000
Subject: [PATCH] ARM: dts: qcom: msm8974-hammerhead: Link the fuel gauge to
 its charger
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
Message-Id: <20261122-b4-hammerhead-gauge-supply-v1-1-7ea708ee19a7@enser.io>
X-B4-Tracking: v=1; b=H4sIANB5AmsC/yXMQQ7CIBCF4as0s3YUsKmJVzFdDHQoGIsEpNE0v
 bugy+/l5d8gc/Kc4dptkHj12T9DhTx0YByFmdFP1aCEGqRUCnWPjpaFk2OacKZSL7nE+PjgYIS
 xSp6JhYUaiImtf//it/HvXPSdzasV20NTZtSJgnFtajytl2OPySjY9y/8cnaJngAAAA==
X-Change-ID: 20261122-b4-hammerhead-gauge-supply-6c0cf213ae0f
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>
Cc: Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 EMCP333 <emcp@enser.io>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795324369; l=1672;
 i=emcp@enser.io; s=ultron; h=from:subject:message-id;
 bh=G+WXz4mrHdbXmDyYNov98eadKi60GGqvVCOY3Vy/RcE=;
 b=wz3O/8b3kvgzjOkt2rAvMO4D5fgT3zG70BXduDP1yX/lGmhhEPIa6mWv5IdRB28D1cDC5th0e
 TtOz6hy1oWJBjK+i1Gg4oazx38cIGb8cmAquGH9qIgh7KQZbyQoHjrj
X-Developer-Key: i=emcp@enser.io; a=ed25519;
 pk=5sG48Lul+Vn7OzXu3VZrCWk5uvEFPYMXYnAV0TZR/tY=
X-Endpoint-Received: by B4 Relay for emcp@enser.io/ultron with auth_id=1598
X-Original-From: EMCP333 <emcp@enser.io>
Reply-To: emcp@enser.io
Content-Transfer-Encoding: 7bit

From: EMCP333 <emcp@enser.io>

The max17048 fuel gauge takes its STATUS from the power supply that
feeds it, but its node does not say which one that is, so the gauge
reports Unknown however the battery is being charged. Point it at the
bq24192 charger with power-supplies, as the max17040 binding's own
example does.

The driver only reads the property since "power: supply: max17040: pass
the device fwnode to the power supply core", now in the power-supply
tree. Tested on an LG Nexus 5 with that same one-line driver change:
with a charger attached the battery's status reads Charging, as the
charger's does. Without the driver change this patch is harmless and
has no effect.

The code and this changelog were prepared with the help of an AI coding
assistant. The submitter has reviewed both and takes responsibility for
them.

Signed-off-by: EMCP333 <emcp@enser.io>
---
 arch/arm/boot/dts/qcom/qcom-msm8974-lge-nexus5-hammerhead.dts | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm/boot/dts/qcom/qcom-msm8974-lge-nexus5-hammerhead.dts b/arch/arm/boot/dts/qcom/qcom-msm8974-lge-nexus5-hammerhead.dts
index e34d7b864e..48be1f9835 100644
--- a/arch/arm/boot/dts/qcom/qcom-msm8974-lge-nexus5-hammerhead.dts
+++ b/arch/arm/boot/dts/qcom/qcom-msm8974-lge-nexus5-hammerhead.dts
@@ -120,6 +120,7 @@ charger: bq24192@6b {
 	fuelgauge: max17048@36 {
 		compatible = "maxim,max17048";
 		reg = <0x36>;
+		power-supplies = <&charger>;
 
 		maxim,double-soc;
 		maxim,rcomp = /bits/ 8 <0x4d>;

---
base-commit: 7475ea8b58616b33c04afb976cf0fbaad9dd63fb
change-id: 20261122-b4-hammerhead-gauge-supply-6c0cf213ae0f

Best regards,
--  
EMCP333 <emcp@enser.io>


