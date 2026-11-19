Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=121.127.44.66
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795101678;
	b=JBaPUW4Qk2hV/0DBuD8skFK8Un8Zmhv7nZvAnCi2VJE3AUdsZ1hBi/ISd461V6+aaDNS
	 uhuviq21ZR1PojeYAQqCpxkPy2rbO2Dni5U6Lx8QxKFFNnvcbw/x7dallCWxGbKmjV9um
	 ygRSFABY+Z1s1v85cGvRvJJNLqJSuBw8j2ioCuAdh9AvAtuCaHc6QlHRxz+gPwKVPSKkE
	 gCXkP6RXf7DQotMJIuSXM0xxk+Xz6mG2enho+Kr/chzkRh5Uz15SpTpRj8DBWxaxCRxlj
	 TJnR6Z5P4AurGytwdL96PLd2Q37AHC0uZBabIJblo/ZW/HV7n3L7Qwi6CVN+HM5PyNg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795101678;
	h=DMARC-Filter:DKIM-Signature:DKIM-Signature:CFBL-Feedback-ID:
	 CFBL-Address:X-Forward-Email-ID:X-Forward-Email-Sender:
	 X-Forward-Email-Version:X-Forward-Email-Website:X-Complaints-To:
	 X-Report-Abuse:X-Report-Abuse-To:From:To:Cc:Subject:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=TAlM5jTVZrM+XUfMxfpCUHKgs3VRnpzXKI3CImjcnWE=;
	b=jsrt6JWGLJeoy4gTvHvAlztCtzBYPgzptn2d0SBWj/tIplqjvKUsMqGwqYsMh/fTTOp8
	 ZQcadZhsUonc4zOmiJ8h0+N4ys2pbC/1UEeeG6mihBUwyRQ6vcBIeXnBl+ajxO3g9fnMt
	 3LFM7dBsyTD8ORq9zNBvnQSYqVwo940OzkdMe+vAs+k7ExSwh9YUw6Ur3BCMyPOy0FC0R
	 +9/FhCIMval9L1q9swRY7gVciJKdFvU6w6Qs9rkmp4VcWRh/xmRdY7uyAV2K4bh8825Gl
	 5HEJG4lyVxQ++JMAF86gd57ba+gQcGG0FyJ5uQukWuIaZh33ysb0mG17iAbW4KTB2WA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=kwiboo.se;
	spf=pass smtp.mailfrom=fe-bounces.kwiboo.se;
	dkim=pass header.d=kwiboo.se header.i=@kwiboo.se header.a=rsa-sha256 header.s=fe-e1b5cab7be header.b=kS+IJVHn;
	dkim=pass header.d=forwardemail.net header.i=@forwardemail.net header.a=rsa-sha256 header.s=default header.b=Usn00CEY;
	arc=none smtp.remote-ip=121.127.44.66
Received: from smtp.forwardemail.net (smtp.forwardemail.net [121.127.44.66])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C9D9C60A2605
	for <devicetree@vger.kernel.org>; Thu, 19 Nov 2026 15:21:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C9D9C60A2605
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=kwiboo.se
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fe-bounces.kwiboo.se
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kwiboo.se header.i=@kwiboo.se header.a=rsa-sha256 header.s=fe-e1b5cab7be header.b=kS+IJVHn;
	dkim=pass (1024-bit key) header.d=forwardemail.net header.i=@forwardemail.net header.a=rsa-sha256 header.s=default header.b=Usn00CEY
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kwiboo.se;
 h=Content-Transfer-Encoding: MIME-Version: References: In-Reply-To:
 Message-ID: Date: Subject: Cc: To: From: CFBL-Address: CFBL-Feedback-ID;
 q=dns/txt; s=fe-e1b5cab7be; t=1795101677;
 bh=TAlM5jTVZrM+XUfMxfpCUHKgs3VRnpzXKI3CImjcnWE=;
 b=kS+IJVHnqvY9+wObki5RzSVCoEUxa4dbEdukgo7Bzvkhr8Ng44A9Lli7b9l39u8W1ieETYCgs
 mBOojmqy0aXopInB1JjAXrc+sem7xrg1KQTTKE3vCmQzWy5Lzx4UVGL/lNn6v/g8Gl7erL41Qt7
 cBhNppzeHJDixe0eZ5J4tE5wByG/8LYUBbXLePAX7H4zsuTholEebjzRtmT8idh5MV9oYKFbIQF
 m+MSlOfDoHWCABi+pxudqAa97CqkIhjsmzC/j++UYnn1fJxC0+Dt6rdDy7zegYf4FdqxDV++OAK
 7Ri/Y/yiGqMsIoz2oziIxgMCvlhkVuBi/l+5i5RAiM6g==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=forwardemail.net;
 h=Content-Transfer-Encoding: MIME-Version: References: In-Reply-To:
 Message-ID: Date: Subject: Cc: To: From: CFBL-Address: CFBL-Feedback-ID;
 q=dns/txt; s=default; t=1795101677;
 bh=TAlM5jTVZrM+XUfMxfpCUHKgs3VRnpzXKI3CImjcnWE=;
 b=Usn00CEYe/2fEeX7e84Bhe57b0BYwTLYRNsUW+HXt3T5AaWoAL8iOCWQ/u9n7FIwZcZgC5BWP
 IenN5Ls24Fk5gGdHYbFh1+mCfaBeh78LeNTzo7tIetj9amxq+lc+MHPMq5O83Nx76BL8eaO3Nn2
 fAYIr9fiIzJgVm5S6n7xJck=
CFBL-Feedback-ID: 6aff13ed83f3cb488062bab9:4c81b50846e028b8ccfa75098b192798
CFBL-Address: abuse@forwardemail.net; report=arf
X-Forward-Email-ID: 6aff13ed83f3cb488062bab9
X-Forward-Email-Sender: rfc822; jonas@kwiboo.se, smtp.forwardemail.net,
 121.127.44.66
X-Forward-Email-Version: 2.19.33
X-Forward-Email-Website: https://forwardemail.net
X-Complaints-To: abuse@forwardemail.net
X-Report-Abuse: abuse@forwardemail.net
X-Report-Abuse-To: abuse@forwardemail.net
From: Jonas Karlman <jonas@kwiboo.se>
To: Heiko Stuebner <heiko@sntech.de>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: devicetree@vger.kernel.org,
	linux-rockchip@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Jonas Karlman <jonas@kwiboo.se>
Subject: [PATCH 5/8] dt-bindings: arm: rockchip: Add Luckfox Lyra Ultra
Date: Thu, 19 Nov 2026 15:20:48 +0000
Message-ID: <20261119152055.556266-6-jonas@kwiboo.se>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <20261119152055.556266-1-jonas@kwiboo.se>
References: <20261119152055.556266-1-jonas@kwiboo.se>
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Luckfox Lyra Ultra is powered by the Rockchip RK3506B SoC, which
integrates three Cortex-A7 cores and one Cortex-M0 core. It includes
512 MB of DDR3 memory, 8 GB of eMMC storage, MIPI DSI, Ethernet, and
IO expansion interfaces.

Signed-off-by: Jonas Karlman <jonas@kwiboo.se>
---
As mentioned in cover letter, unclear if this should use
rockchip,rk3506b instead of rockchip,rk3506.
---
 Documentation/devicetree/bindings/arm/rockchip.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/arm/rockchip.yaml b/Documentation/devicetree/bindings/arm/rockchip.yaml
index 37321e23b087..651da02cfa51 100644
--- a/Documentation/devicetree/bindings/arm/rockchip.yaml
+++ b/Documentation/devicetree/bindings/arm/rockchip.yaml
@@ -865,6 +865,7 @@ properties:
           - enum:
               - luckfox,lyra
               - luckfox,lyra-plus
+              - luckfox,lyra-ultra
           - const: rockchip,rk3506
 
       - description: Lunzn FastRhino R66S / R68S
-- 
2.56.1

