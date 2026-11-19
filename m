Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795128015;
	b=xk3pawaYl3s6TpRxLXaFSl1xsrJMUFy2CgvyBlnBiqdEH2/sKGeDPqKafRxJ0hgKtKCd
	 5j/aJWIbW+ARXK3VzGJ4ziEonGmwW1YLTo1xGlJNMyQYmFZulrNgUBZXUcc13QTJj5vfv
	 wKtCKUgoKAWFcAIbV4LlnwVSRL1JNTiHwBK8RxX2OtyTUXOt48hxIDLJg9opKrthMLeRn
	 hr9h2kbWwlr3EcGoV+hNDfzA7dm4QGYONBDdysMklUja55bJDrtiA2UUObbMt4zoiMTSf
	 LRLnDHnOhuXXH5HQJQ+AOglWp2KgDoz6Vl4wT6uh7JpJPBMIJkbsTTCyYLbVieikr2g==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795128015;
	h=Received:DKIM-Signature:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=Xb9tGlBs/RI/3cYvgIuwT7LwCzWblww6OxyeA8tXJMI=;
	b=NTsSPoQwKXL+UgjbChO8fnVE04gMh6zIp94+X+vEkYH6go4tP34w+e+7jHsOTLCs3LCE
	 NKRR+mg2GqYoYO8o8MOPf05xZ49VfAz0Gn/fNg0MhNzKMczEQRXhOkgboGtKltL73bMIm
	 CaFmUdH8sUFk8MWwDQ+F+lZKOSECHDoiA/q9kfhY8bHqZamIclaDdRocCIIbHFkqkW2g6
	 qc6ggZuK+ss4eW7baY0TPVyRZECCH2BjM8oCixiBQx1cHThPA1Wz+54mTSuaGLLpTHtFH
	 mJ2auMmCgyjE9sJkMTIAxgSWxVP8qrGQycCZcxZabl1owjAypLADx2NOTtclJuL3DgA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=R023IU59;
	arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D68D2606A33B;
	Thu, 19 Nov 2026 22:40:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=R023IU59
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1795128015;
	b=OE2AQVBhNyFXyKAZbg7kL0hrhwepf3se5s8CwtCL6Rxo3GoUk9TuI7j8sFN1pRuS2bMh
	 PSKjznJn8IUoBUwYlYAw2Q3xbx+Ez8BQsedMabtlPOwRCzSpphtmPFGhugC/DIweO8w8N
	 5wDSGq7CATg6fi11w9bdJoHt5+I5IN+xyBoRGKRKJAQZQw+y6mbs75a973DWw1LREyKwk
	 NUHIVes/TZvWXaIBTeqhnIj/FFcdqPRcF1Gk8cdoghe0zY/GHCaNmQImlC3+TAqy/rWVf
	 02hJjcy5FR73DgX6T+VcHvJZlRmzmucMGS8BWatHjYthvTAwqv/x0P/FRhbaXazNsmg==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1795128015;
	h=DKIM-Signature:Received:From:Date:Subject:MIME-Version:Content-Type:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=Xb9tGlBs/RI/3cYvgIuwT7LwCzWblww6OxyeA8tXJMI=;
	b=W7uEUK1MIrvXd2JdkE30vaccPO2HrUtgDN4nol49jh6prJk84WOWINULATO0oKvi7Ogv
	 xX38Vkbr5qZ66GriNTs8LGQm/HhSWfOiPb94FCWfMXh6ZfPvEekUvzeXhDvMXmUstKMlC
	 Lly9+Zwmb/N9yxRnQ5ybhqVbwDOevHTg5iJYi/ZAshIR7ip0gtXrlKQ2rXgRD/nibA1j9
	 HTorINOGLJqJAl7fgREMl8t1M2mZtB0IqNj6k1updlDG/g/Z2RbxgtTh8v/xpDAJY8Tky
	 ovZwEQq1KpK1Jw6CDB68O2IPwE6ay+2om+rz48S5dJVhl6VPmrTvP9/M3It57xqJpXg==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 1E5311F000D8;
	Thu, 19 Nov 2026 22:40:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795128015;
	bh=Xb9tGlBs/RI/3cYvgIuwT7LwCzWblww6OxyeA8tXJMI=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To;
	b=R023IU59D9EYp56SaOKO4PIPeIQg6NxFsa/X85wERpiAl+VvxbAFUC7VU6nIRzR+K
	 6VIvkiV4XFU+3+kejYOeQQitclFM11mF7NC16mi374FRc7q+iB9PkjVZegSQXHfZaY
	 VKQKq13bUVLiFZeZEGHstu4X7W+ZynALUP85fLzOtDQVZadJfn9h3nS69s1w3WuLYP
	 La4KhhXUUMBTC8ZRcRp/kXw9joJTF9bnZu/A8kMMOJcUseZKVF37MNpe5MCYOS62Eo
	 PznUxGFKIX+5ZlGTvQp1JsHP/af3W86NRg0K9P1eSGhG12FOCQMrxAqzthnnrj74dP
	 S1dY99XxxSVNQ==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id 22A2C422D9;
	Thu, 19 Nov 2026 22:40:14 +0000 (UTC)
From: Nizat Mikayilli via B4 Relay <devnull+nacht.dxdmail.cc@kernel.org>
Date: Thu, 19 Nov 2026 23:40:08 +0100
Subject: [PATCH 5/6] arm64: dts: qcom: sm8550-samsung-gts9wifi: Enable
 PM8550VS-C
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
Message-Id: <20261119-b4-gts9wifi-followups-v1-5-2e2388589a62@dxdmail.cc>
References: <20261119-b4-gts9wifi-followups-v1-0-2e2388589a62@dxdmail.cc>
In-Reply-To: <20261119-b4-gts9wifi-followups-v1-0-2e2388589a62@dxdmail.cc>
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Abel Vesa <abelvesa@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Nizat Mikayilli <nacht@dxdmail.cc>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795128013; l=687;
 i=nacht@dxdmail.cc; s=20261004; h=from:subject:message-id;
 bh=euutEXnvvtMe/+gu763/D4wM9tSHPXBePYkghrhgKWA=;
 b=iqF0RUUWMRzsVz0FHsGRx+CEJ+Z0fN32987dHWQBjv1wEquvza99qmUNlb0LuPtAowCpxS7mp
 Y5JlmH6m8oLCN5HAV9omlX32uUrTMzttsHNw1+aozfbD9kDxKteHTEy
X-Developer-Key: i=nacht@dxdmail.cc; a=ed25519;
 pk=Kay3P3pOJq5klUD+0/I8QX8JGOh0CeQXEwRVv7CMm4k=
X-Endpoint-Received: by B4 Relay for nacht@dxdmail.cc/20261004 with
 auth_id=1111
X-Original-From: Nizat Mikayilli <nacht@dxdmail.cc>
Reply-To: nacht@dxdmail.cc
Content-Transfer-Encoding: 7bit

From: Nizat Mikayilli <nacht@dxdmail.cc>

The board has a fourth PM8550VS, at SID 2. Enable it like the other
three.

Signed-off-by: Nizat Mikayilli <nacht@dxdmail.cc>
---
 arch/arm64/boot/dts/qcom/sm8550-samsung-gts9wifi.dts | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sm8550-samsung-gts9wifi.dts b/arch/arm64/boot/dts/qcom/sm8550-samsung-gts9wifi.dts
index 4dc0b7e29db3..8323eb837710 100644
--- a/arch/arm64/boot/dts/qcom/sm8550-samsung-gts9wifi.dts
+++ b/arch/arm64/boot/dts/qcom/sm8550-samsung-gts9wifi.dts
@@ -724,6 +724,10 @@ volume_up_n: volume-up-n-state {
 	};
 };
 
+&pm8550vs_c {
+	status = "okay";
+};
+
 &pm8550vs_d {
 	status = "okay";
 };

-- 
2.56.1


