Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795542195;
	b=3CwJeV8Ix/zN22cZuc6uzeWE4PNLxRXT9Fmd12VzHovi8INkY48cIt8Ij52/HIgAm1kk
	 xgFYRYIbQdK7Vp2l0T+0eX7WVOjOa1SdoTvwbGg8l8pSOZyJuQIE5nBRTlU1uzxwq+L05
	 tFO8PW9PK33d9sbN6anwnX0+XcEjzu4YQ67jHBK+3TmxIdJyqd8LAI8Oz5FhSdXn8Hi01
	 7g4QUkEtWsspBNcB3dHMtv2pX8RY3+ZfLFNghcqOCCHHsXr9/cgmbEQG4oZtyvtVAqG5c
	 vgx2wgkSJI+5U7C7l8afTZCmZNoQSfBPR8BKi3QY4YZFC5lO5KulVAtmKjZx5uKBjYA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795542195;
	h=Received:DKIM-Signature:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=kIaLyFmWlXu0jjs/ghjuJd5PVRPDSe2ojXPLL1BJp2w=;
	b=LG8L2wUvxzVWfwEzOytskWzPsaPG8gkgTotIZmVU/9QRTQS4dWhZ1EjSUhMuNh8kbvCI
	 2FphUktyVe3Ul6Rv7baCpUtbOjqdFu2TVpEW/Y9ucCkRW/kezH5c6CO1GVK3RDbaxfma5
	 44tBaVNpqO5y/rOS5Q/SfVikqNgApaKbOSPGg/fO4Xxdra7jXVL121F+eyICdxb+ILjmF
	 /4T35Qj0g3xDdb5JfciyeuFn023UEsRhXEetk+lLw+08kKAoDdfYdIc93o7uKq+jRnBHp
	 R9icwe6HatE+2+m0O7bk4ZuBL2dg2T2fP4rCJ3K8ZHdquXMGHzU8qNS/7WP2lefbpqg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=cxjqHsQY;
	arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D101D606A332;
	Tue, 24 Nov 2026 17:43:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=cxjqHsQY
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1795542195;
	b=w7YfSZJoWn7rL8J6DhHNKEVCjUHPgyvfIRRZNTbh15Oeic5idrtyGwTamAyXL1yGvKtQ
	 A4N9w9gqjQScUIzX0CmQMwnTOUTvm0gnct0JV8OCjYpiQBIoVdZHOBJGCeM1Pb/U+ShcU
	 rhxg/mY1M9tBJUyyxnxqVQA/tyrDpYKzwyMHZzmqo1PE1aO8tGsnW6TyxH7OZZOBx5LjG
	 BYFo9I/26TN8EcvTNNAmvjhbfWO2DRXiBMiQ/5PmLFv2kpxlr9JLMWCu3ejPD7bFnylWG
	 IaIySMnn8ofwjCWA5bpe8ebTkCygBoCdYyqpjuW1ExvvGkLOV6oEh9JvAxAQvYCJPkw==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1795542195;
	h=DKIM-Signature:Received:From:Date:Subject:MIME-Version:Content-Type:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=kIaLyFmWlXu0jjs/ghjuJd5PVRPDSe2ojXPLL1BJp2w=;
	b=lZtyggwWYReREm+RtTZf4Ai+uOmjj4CzvaHYkHmPMoogDQgln3hE9D7Py/Q6Td4JAWJH
	 kWsDhLjcxFbsiQnIYvSuJmoI6H9qYfbuAQKqCC1+hoFtCzCM0nmWijihcZhcnT75OhdHp
	 gAtc1oZPNTOBhLeJvVKsWD5Mdi2iUjRyMQj0aHczu+Yn5dJtL8HV5MYJzu8CUfKPCQxIT
	 V4fM2ssCB+b4gQbYGkJf8DAhZu6Y995jtdena99m11Qt9csXYWbfXBk8UMJfLqT+kdIHn
	 NofNgaPgYf5xus1RRV27zPZX2OGknd9ZLC8WUpravqkgwuAvtnxmiwNfhO7fQhlYzZg==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 6FE721F000CF;
	Tue, 24 Nov 2026 17:43:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795542195;
	bh=kIaLyFmWlXu0jjs/ghjuJd5PVRPDSe2ojXPLL1BJp2w=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To;
	b=cxjqHsQYQJbvfDTHrmpdBS4k1ebRIaKn0crxwWUVx9nkz/RuW5Qff2RIAH3t7lVkZ
	 r0JlF1EB+V8QXWp8+cpBECgrPMULyvjxVrMdHGRVs4WNar4iKzEcnrRyo7NKqU/he1
	 0Gq4zUiB7ZOAh5V1zr7ePsn89woIkqExFlgUDMgkj0sSiBAvvCCbbEOBPDoonx9Nx9
	 iYr606NOTQdS9oTMklM75D+0CbJatf0Tlrm4wy5bvV68BPmCxC3vQlCrd8Q835QQZV
	 AE6bcmxiXVWwta4BZJxN7C7MJu8ApxR6Fzc3LrTW7cAZ7sCDYQD1esaJnH5sJEl3jx
	 yH6y7LfszUuyA==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id 015CF4CB1C;
	Tue, 24 Nov 2026 17:43:01 +0000 (UTC)
From: Armandas Kvietkus via B4 Relay <devnull+armandas.kvietkus.proton.me@kernel.org>
Date: Tue, 24 Nov 2026 18:43:01 +0100
Subject: [PATCH 2/4] dt-bindings: vendor-prefixes: Add Fingerprint Cards AB
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
Message-Id: <20261124-fpc1540-tee-v1-2-6c6985f05b06@proton.me>
References: <20261124-fpc1540-tee-v1-0-6c6985f05b06@proton.me>
In-Reply-To: <20261124-fpc1540-tee-v1-0-6c6985f05b06@proton.me>
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Abel Vesa <abelvesa@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Jonathan Corbet <corbet@lwn.net>, 
 Shuah Khan <skhan@linuxfoundation.org>, 
 Randy Dunlap <rdunlap@infradead.org>, Arnd Bergmann <arnd@arndb.de>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-doc@vger.kernel.org, 
 Armandas Kvietkus <armandas.kvietkus@proton.me>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795542180; l=802;
 i=armandas.kvietkus@proton.me; h=from:subject:message-id;
 bh=bb1E4uO7yTmae2IdZoOdJAzIoFi+Onctna6tkTmtNX4=;
 b=IF4dBQyJ2xQca/bjfj3E9mICaY7LIC9mawwx/9jbS+KZ9Sh7CHqidQKi9qdqtWPeJ9WMzSYsa
 Xf+Jj9DMJKUAQenRokC+lCdW6mnLcjoJ1ulQNQBJRxcUDzJQwWF+e/C
X-Developer-Key: i=armandas.kvietkus@proton.me; a=ed25519;
 pk=wuqmImJ9sKlDVcwALOvfGhjj7G8EBjjM4TpCdmlrAf8=
X-Endpoint-Received: by B4 Relay for armandas.kvietkus@proton.me/default
 with auth_id=974
X-Original-From: Armandas Kvietkus <armandas.kvietkus@proton.me>
Reply-To: armandas.kvietkus@proton.me
Content-Transfer-Encoding: 7bit

From: Armandas Kvietkus <armandas.kvietkus@proton.me>

Add the vendor prefix for Fingerprint Cards AB.

Signed-off-by: Armandas Kvietkus <armandas.kvietkus@proton.me>
---
 Documentation/devicetree/bindings/vendor-prefixes.yaml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/vendor-prefixes.yaml b/Documentation/devicetree/bindings/vendor-prefixes.yaml
index 5471a06f93f1..f0153a5f0687 100644
--- a/Documentation/devicetree/bindings/vendor-prefixes.yaml
+++ b/Documentation/devicetree/bindings/vendor-prefixes.yaml
@@ -628,6 +628,8 @@ patternProperties:
     description: Shanghai FourSemi Semiconductor Co.,Ltd.
   "^foxlink,.*":
     description: Foxlink Group
+  "^fpc,.*":
+    description: Fingerprint Cards AB
   "^freebox,.*":
     description: Freebox SAS
   "^freecom,.*":

-- 
2.56.0


