Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.176
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792673641;
	b=vUw4dYqUziq8dRP2bQcNnCjHF7Zz18jvpdxU3/02xq9ak3KZLFPnRVpiitpF+KNKwkVN
	 0ymAh0gff8xxW783pMWrPcdOtgWLEbKbggloJ+Y9cbGx9sMudQZyNz3jTTGizZJoz6jX6
	 GNDNWM6S5nC0LbMrQQ1Dg0wVvgfXtNk+CWm1XFJqL150Cc/FVeIeV358UUc7ri0OWuCRi
	 P8gwyrQC0bEf9sYhVp22cf+SYFNJJo5OkIEZSFYISYrjlkyHx7TjfOvzM0QBcwaALuDZf
	 HP6HqoVEVXgLC6I9xxMFEPUo6kVNFkSiEstJMkG2aTFRm8jmKdubnd3HO8itdNn22kg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792673641;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=WUN0wSbCxufL+1zQC0DuNs4VauEfRZkkrTtPoiI3bLQ=;
	b=dacbN85bQ91gL+pR4aDEGKwhogGBBxquiEV+oK+r5Ty2rg8ajlmxAZm81ycCqN2nt678
	 Vxqg1zyptoH1XyMkZXcBOHvZ3SdyLilVKZCDWAQlxpEJw0yp28uH73mJwapTrvrY0tC9F
	 cqD31a3GZIum3AL83I8xTPX8xQYlCa+mzm4bAILBe7wTmNLrtn1xcm2s4ot0Zfuq+Lpxo
	 PCUiYmjJKEKB8HJkUxmQZ4+SDOWfChC4EdsyYGzZb0Fea7H4MixiMP8SBEMkn5C4KhYqu
	 APGXrs/0FWtgj//6+JdQmpC6geHXU+y6zKRdy+66Y2HhD94XE65HkGgFgQEH/p1DNOA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=ZK8QEbjQ;
	arc=none smtp.remote-ip=209.85.214.176
Received: from mail-pl1-f176.google.com (mail-pl1-f176.google.com [209.85.214.176])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2C248606A325
	for <devicetree@vger.kernel.org>; Thu, 22 Oct 2026 12:54:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2C248606A325
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=ZK8QEbjQ
Received: by mail-pl1-f176.google.com with SMTP id d9443c01a7336-2e9400d26b5so2366725ad.3
        for <devicetree@vger.kernel.org>; Thu, 22 Oct 2026 05:54:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792673640; x=1793278440; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=WUN0wSbCxufL+1zQC0DuNs4VauEfRZkkrTtPoiI3bLQ=;
        b=ZK8QEbjQ7+4is+OUrnWk7R35dN/7olNzkaWpzVSAlcXmUnTaQEV3vkMkQ86Fv/jeaZ
         7RjNFwxqNIIoe6MT3QnXVlhpe3cVVsJUaEtcfDuM1SOZH5K5fGaq1QroKufkLP1R+NvD
         pXKSn1THSitcx5mV3N68GwkiKC3/Z+OUJdnpeKObvR3qlsbXMaMpYvFkmelyhtmosQhi
         PCuO0EVq3dyAyHcl/7SdN0Jy+Tkpkj2AvWMc//iHfXl3hyHLjKT91YwmHe9W3YVcuWgl
         afq8Bcoig9m00JUzzDZGCPNEqMj+MswmNlXJyBxnzzbWDLb2ByjuHo8TdatWgP/Cl2gQ
         FLfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792673640; x=1793278440;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=WUN0wSbCxufL+1zQC0DuNs4VauEfRZkkrTtPoiI3bLQ=;
        b=AB8Ph5LlO4RSuVgPvi/OoJP5rYPeXt5QIfeMm5RWEWfDBzqUBONgyXID+qDGEAYXFE
         hSZshSKhRTGFQGSFdSnjbT7g63SsSyD8PgziycvxdnJWPSHRxkeTsHzT93MYQPPGzAkt
         XwiUTesQiJwRv1N4l5ipDYB6NVjbNKpIteVwBNSo4MLc08+W0yBZo0n3ibn1kjxRbGIq
         3BNjqPrBlE82yaG7W4vxwxoQb3VtBNNUTipYYHJP7M9bVjnfCbqs1XgU8njT75kEc9MR
         g8JzvpuchR3rAqHW36JXIjWTb7W62gtA8hURIuKzVs9F4V3iUR/SV0ZAq/wyIsh0dtM3
         FjKw==
X-Forwarded-Encrypted: i=1; AKwUvByHe/20vW+F94sq/0joaZeSurXRmv147OjMsonld1LNYRXKFO85q9oZOYwTYiRlFjxZPq6wbtPhuWpD@vger.kernel.org
X-Gm-Message-State: AFq9FYKFPRbxeQJAsOXluOdTWw8e9O5sRhkfvYWROHYz7NLFQoahlhj6
	Oh986CRvysChFwqFjfnMT201ty0r/9ekPt9a5tLBC+4Ts1ysYXybptP0
X-Gm-Gg: AYBFou1pEIoTCQIvp4JmPwVDH3k/AjbZjnHY6VG9EFylFp0Gr9SccqN/X8b52otGNCT
	WxTpg+WZozRD2O+zJi11olfzT08bMIF6XSwABzKthMrcyBkqkRM4nm3uu8LZ0rgllCZF0Kx0UGa
	VbnbFNMKOGJZjSY6M0815yGcZl4nR071PvG/9X95aVl65dcuYSXh8iwVcItMPfbthg8HJgyO8Lt
	i5W0QXN/dN74o0p+hagewgurm0cfgp6zDic6XuVd8yfULO1lnTbB70gAvmQVHed0drkArTtq9Mn
	Ky3iNHDTc0OeiRo5UBJVTrL+/s3J1mXIa7xw7FHD8x2F5lAw6L5wRK3nc0SFiJilb+l5Kw/IgI6
	xhl7XRr72YlwC8s3Q+eKqOTYRPGWhf+uLDmtzxM1si7Og/cVUOew19SnpHbL2fr3DhICab2jsSE
	ns9I+FMerw9aE+mQW3qzwpDGRzkeahNUxtQDkP6VM84qypq3Ve8PqgE2K8UxliJo047WV3m7yne
	qzWjY7nj5+9mgvP4t2a3oZMb2chFUbRoV6LMA/AWOwyQFwiCWcqevf0enU=
X-Received: by 2002:a17:902:c94d:b0:2e9:65bd:62c7 with SMTP id d9443c01a7336-2ea4321cee8mr68893965ad.0.1792673640404;
        Thu, 22 Oct 2026 05:54:00 -0700 (PDT)
Received: from localhost.localdomain ([240e:36d:b08:2bc0::a60])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ea3b435243sm23704165ad.31.2026.10.22.05.53.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Oct 2026 05:54:00 -0700 (PDT)
From: Jianfeng Liu <liujianfeng1994@gmail.com>
To: linux-rockchip@lists.infradead.org
Cc: Jianfeng Liu <liujianfeng1994@gmail.com>,
	Chris Morgan <macromorgan@hotmail.com>,
	Chukun Pan <amadeus@jmu.edu.cn>,
	Conor Dooley <conor+dt@kernel.org>,
	FUKAUMI Naoki <naoki@radxa.com>,
	Heiko Stuebner <heiko@sntech.de>,
	Hrushiraj Gandhi <hrushirajg23@gmail.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Michael Opdenacker <michael.opdenacker@rootcommit.com>,
	Rob Herring <robh@kernel.org>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	=?UTF-8?q?=E5=AE=89=E5=AE=B9?= <HystericalDragons@proton.me>
Subject: [PATCH 1/3] dt-bindings: arm: rockchip: Add ArmSoM Sige7s
Date: Thu, 22 Oct 2026 20:52:52 +0800
Message-ID: <20261022125339.82746-2-liujianfeng1994@gmail.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261022125339.82746-1-liujianfeng1994@gmail.com>
References: <20261022125339.82746-1-liujianfeng1994@gmail.com>
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

The ArmSoM Sige7s is an RK3588S-based single-board computer which
shares its hardware design with the CoolPi 4B.

Add its board compatible with coolpi,pi-4b as a fallback.

Signed-off-by: Jianfeng Liu <liujianfeng1994@gmail.com>
---

 Documentation/devicetree/bindings/arm/rockchip.yaml | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/rockchip.yaml b/Documentation/devicetree/bindings/arm/rockchip.yaml
index a24949b163cff..1b905a7af8009 100644
--- a/Documentation/devicetree/bindings/arm/rockchip.yaml
+++ b/Documentation/devicetree/bindings/arm/rockchip.yaml
@@ -99,6 +99,12 @@ properties:
           - const: armsom,sige7
           - const: rockchip,rk3588
 
+      - description: ArmSoM Sige7s board
+        items:
+          - const: armsom,sige7s
+          - const: coolpi,pi-4b
+          - const: rockchip,rk3588s
+
       - description: ArmSoM LM7 SoM
         items:
           - enum:
-- 
2.47.3

