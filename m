Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795028837;
	b=pmceKkNutshhXtrLP206+P1Kkg+HHnDqeYwyZrZFZea6X8zNJ/md0LXGvTYGtOSYqgk+
	 4Kvpg/EdKCdUQBDPkNtLqnuPCARF7XRXXnWjvITkWbLPxe0eE163U6m3SO4Hwd6nvkqbb
	 xrLZ9Fjg1eRj+vm5bNhIai9qWoy72LUBoMhG/VRpobkEHSK83nei22Z34R234fWrITcAz
	 egdwxEjWrEJS0OSWyyCDXBhlSh7ryAmbgO+YvKQHb0IS53XO5nN3HHlIEJebC3VX2OiAQ
	 3/dTSQwd/EaQhfxKfCGojjJrew1klFewPq9JydyTPC4fef46BaaUB46dt9heQ5LxajQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795028837;
	h=Received:DKIM-Signature:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=+k/NWSXV+Gb4kP6pdN6Psw2CRLNz63/ZQKflIA7KPmE=;
	b=CmIinD9jBuZ2fCcTWZSN8BcL6ygLguFictJm3fyHqI1tvNCwV8WtWB7du8Sx9SeenuSw
	 SVVtmhRqZTXH+LTtadT8RdKGZUljqduP80RHe/3+8k3h0lY7fiX5z5oj7ZhkHES4XSyA2
	 YyQGwtNJVHMU48Sa5C0Uv54Y29rUQKzggDYZEXNHQ7Lu5CsP+aS5ZR8NCvMINaPYuRWs6
	 i0EOSzeMqy29/yEpaRKVcS/sF0jItd55NxD4NWpRuxA6HOTDjMpRiIJOj1l5XXxFJaUZe
	 vHNcHKwPpcej7DUJb822m0f6kWkCnVZgLdUvAlSo7h8tORven07fWnQqXrWG0FOddVw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=GPzfuUth;
	arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 284C860A2620;
	Wed, 18 Nov 2026 19:07:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=GPzfuUth
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1795028836;
	b=PBxWD7nSOonEZXHsXBoAvJ+hGThlfm4iYH1ycHhzRYedou4mwbkjmekgnjxCNELCETlD
	 bfkyTTMF5w4400eVlTh8CcKSy89siO2bUQwBBVSP3xsWIrGwiaxtXcIWfBz8vMlWfnhoT
	 JmBDos0LAm2skhOcNcdfckG9jRudm6kWF6TLIRfpWlflnZOJ4er6yr+rgAXqJSS+i/ydr
	 yqW0BbWUCAobFEelNHeu6kduykdGmJLUPKwmDEWr0N2toZKjg5j0znhf2HMdfWMj1899L
	 IchyWBlLwtqKNrb/vXfW7ZAkWH75zSi1+7Hrxk6tK0Y/VssqKr+qF+mceafGdrblRRw==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1795028836;
	h=DKIM-Signature:Received:From:Date:Subject:MIME-Version:Content-Type:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=+k/NWSXV+Gb4kP6pdN6Psw2CRLNz63/ZQKflIA7KPmE=;
	b=OICZsDQs2ZFUz0OvHJxXXiXgV7JpL5TL8ltixFrtbPk/47TRG+QVzqZpyYDbVbK6Cj9z
	 sKc0B0d2oX80hnGsvZ8etlMGQSFRKT1xZODc4HALTpQC4H9Px8ALBwrFw4kqjggc5N6eY
	 nPhozNohlEoUb5s7rAfpBDm7AjzWuhs8u+mIQk6wXv0vMIJMJPP3CnG2yuGcIgUc4dFWU
	 epYI4WsPwkTFnz7+Rdx+q4/5iRYA2VIeqC0UXbOyglTtAn6JjyhHh8iIlxQmEt2ptkTbr
	 d9WjJDFkLcGlafhY789dTHsGhwQxLdSQRE7QukL8v+cVWX3x0+C7nIwpldeI0R2843A==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 671551F000C7;
	Wed, 18 Nov 2026 19:07:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795028836;
	bh=+k/NWSXV+Gb4kP6pdN6Psw2CRLNz63/ZQKflIA7KPmE=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To;
	b=GPzfuUthfXTWFu2YJ2SJdiFEeHUIVHNg3KzuqML5KTotmFsZ8Vx7hKLYkWW6UWAZS
	 qBn0kI/B+0EHPrxX6IkaIsC4qiXKs9OHA+JoB9GTXmmSslLnNkxYkDveWk9FYt+rdb
	 9Vb77hPQKSqKvi0FUI2iEy52rmv5kWC6Ig+IHgz3iiPfmfmdHThAxjjp1YhjUO/+MX
	 yAO0QJFnAs60/FMmDrXgVfKIdhOt6nL308K+m/kNj3nwwSfxqHT5N/IW0uymLDyRw5
	 C3Wa6k5GlOiabY7Uk22umflLQC34UTXAMqjxcFXcVxuilwaC7e6jyczwv3hEbCuCX7
	 uoBXFGcEUZmyA==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id E7B8C4AF46;
	Wed, 18 Nov 2026 19:07:14 +0000 (UTC)
From: =?utf-8?q?Alexandra_=C3=98stermark_via_B4_Relay?= <devnull+alex.cramt.gmail.com@kernel.org>
Date: Wed, 18 Nov 2026 20:07:14 +0100
Subject: [PATCH 2/3] dt-bindings: arm: altera: add Terasic DE25-Nano
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
Message-Id: <20261118-de25-nano-v1-2-473d16131f7a@gmail.com>
References: <20261118-de25-nano-v1-0-473d16131f7a@gmail.com>
In-Reply-To: <20261118-de25-nano-v1-0-473d16131f7a@gmail.com>
To: Dinh Nguyen <dinguyen@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, Mahesh Rao <mahesh.rao@altera.com>, 
 Mohamad Asyraaf Azhar <mohamad.asyraaf.azhar@altera.com>, 
 =?utf-8?q?Alexandra_=C3=98stermark?= <alex.cramt@gmail.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795028833; l=924;
 i=alex.cramt@gmail.com; s=20261118; h=from:subject:message-id;
 bh=q+ynkvnX0dWnC9dNQRmhhqyaPWV3G/Ese9y4dmoLVu8=;
 b=5n2X0zcxAsj5ooWW6SMw304IiTNsQdgp3JXMjiLvZrnhb21CGSlO2AeBnelg1ZIwpFrtGL8P8
 hjLpjpqX1xSA/YUZZwlwXN75kwiDD0sR4O5IGPfJAHyjQj+iOfzpcWh
X-Developer-Key: i=alex.cramt@gmail.com; a=ed25519;
 pk=vQBaXUvFG7cCIaWDKclPMjo3b4XfPEVkuPjaWCkYddc=
X-Endpoint-Received: by B4 Relay for alex.cramt@gmail.com/20261118 with
 auth_id=1561
X-Original-From: =?utf-8?q?Alexandra_=C3=98stermark?= <alex.cramt@gmail.com>
Reply-To: alex.cramt@gmail.com
Content-Transfer-Encoding: 8bit

From: Alexandra Østermark <alex.cramt@gmail.com>

The Terasic DE25-Nano is a development board built around the Agilex 5
A5EB013BB23B SoC FPGA, with 1 GiB of HPS DDR4, a microSD slot, a gigabit
Ethernet port and USB.

Signed-off-by: Alexandra Østermark <alex.cramt@gmail.com>
---
 Documentation/devicetree/bindings/arm/altera.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/arm/altera.yaml b/Documentation/devicetree/bindings/arm/altera.yaml
index ae38ba0dc..75f874e8b 100644
--- a/Documentation/devicetree/bindings/arm/altera.yaml
+++ b/Documentation/devicetree/bindings/arm/altera.yaml
@@ -118,6 +118,7 @@ properties:
               - intel,socfpga-agilex5-socdk-modular
               - intel,socfpga-agilex5-socdk-nand
               - intel,socfpga-agilex5-socdk-tsn-cfg2
+              - terasic,de25-nano
           - const: intel,socfpga-agilex5
 
       - description: Agilex72 boards

-- 
2.56.0


