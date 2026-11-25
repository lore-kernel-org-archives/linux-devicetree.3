Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.208.46
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795605999;
	b=hVyM9vG+AFowDa4vPiLNpWlmYuXWgvifrlSCG3ca9C27IlAKKmipQpfM63HCUXhbrg2+
	 uGfJv1uBhOxxkW/5xzLptBS7WeEPmnpU7jr2neJ4pmEJY45o/8SCqP7/mfOdQPp58giR0
	 0QDzUr+8yn+7grQDFbXpMc4zt5NmI34E5Gr+EhsWrfLohW9UgE3Ydue7VRPUPAMBDhKui
	 MNU1vd3gIakp63pF7bUKmDEJuGE3AuTsRfo6VfI9/Y6D1z6KeJuX3Vs/NaBYwERsx1zV9
	 AQtz2iuykiuEzGQN61vOtc8mzVYU502lMOlP3u8ogvBliAwreKTKdwGAgNMt/vPVSUw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795605999;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=HMJ+dwPb/3PV0iTHWqAgN85Hf/aWfKjSW+f/zVf9g0U=;
	b=a00uUewYECmiMi/HwQyQz3Wna/MsQ49BMLTvgJtaeAycAsaAjNz4oza7NAJCIdpm1V9Q
	 Gc/qoyx0YaXrlL3Tgvikdb0Wy5Au5LpGvX7o82moR43onKdY64CaNncj9oyMvyxYBXQp/
	 5e2XCkdxznByxP3je6G3NtiTpenz1/8thQIvMU9jcEqlEY4TY3YSY4bPhhK6KYO9ovQ7B
	 qUZ1tiPQ556Ik2v50fVbHeUyM5yajGsbvEbjdWse6ewKM3ys4q2A64KLE1ajIZPUJKmgn
	 0esyb5bWlVKzZPlPDN++TOhgK2Y8ecmCemUn1nkXGuKxyUXnhxkX5MXsm5N+EIYCmmw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=RVGQ8Hgq;
	arc=none smtp.remote-ip=209.85.208.46
Received: from mail-ed1-f46.google.com (mail-ed1-f46.google.com [209.85.208.46])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1F2AB60A3827
	for <devicetree@vger.kernel.org>; Wed, 25 Nov 2026 11:26:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1F2AB60A3827
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=RVGQ8Hgq
Received: by mail-ed1-f46.google.com with SMTP id 4fb4d7f45d1cf-6b894a5ce3dso7703205a12.2
        for <devicetree@vger.kernel.org>; Wed, 25 Nov 2026 03:26:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795605997; x=1796210797; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=HMJ+dwPb/3PV0iTHWqAgN85Hf/aWfKjSW+f/zVf9g0U=;
        b=RVGQ8Hgq8nSm+KEOOWBIlYqI+TMl8HVguwqgFXbJguqc0lDwsjLI1kgYrBgUym83sx
         Q+sNBxZzC8ENFnb720pQzCWyGyxn+F1uzf7mKSCZjksGaetzcmbIk2S5bODx01feZ7HA
         5ChvPBgvjQKG4KB4m/LKfTYEFdGg2F+dq9vlr38mJ1ILKgdJ3gc9j753NII4BxpJ/74h
         usfYMs3nixas1jpCb2MvtF+unJNTPEaxxu0lyJr/5jiw4tKpQjbWArt+Nhg5J1Q+heiR
         cbU+T/8vdMOaSh3i850GylT1WTOcm73gCFEqukg7wXkHAZ0c4D9kNucePNH+MDu0cugl
         3cIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795605997; x=1796210797;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=HMJ+dwPb/3PV0iTHWqAgN85Hf/aWfKjSW+f/zVf9g0U=;
        b=LSQMVZq2i/WuzyDFnReTu3GXvKVtr0EEvKfMTyOqEYUUicbLUSAsUp10qK61GjZztJ
         R/xu/WK0HIlnYOBRONrjbqruiCrWFHGzJaf3H4b74SJGc2fvIDFm6FoJh9BrTNV4EJvh
         ySqneEnlEFNhfIo/+IzmVYeaeiooLncxKY+SFqC2Dd2eThhDAZgjXDIuL55Ub2nz5ZyO
         p1SC+6uERDo0MKhruGjsb2zz76BmeGn0cYHUjF7mPbTDbE+QEZgAbIz+vYUTMf6FTEZs
         ZDdARZ5OrUhlwR1CXzCsM+hnlPhtquOp2yKIVM184DSd/D/C2NfswjDD3NT4aGEgwO++
         h3fA==
X-Forwarded-Encrypted: i=1; AL+hErGxO1OJd7hOepqSbacnTQ6Ji4fwfq/+hVT4irWsW7W0rgq19zgZ07TBDOqrZbWmTCPJ8uYZf8/xJOVU@vger.kernel.org
X-Gm-Message-State: APuU4Z9+fxMoCT2pAdZKdOzgzKgNuYt9rZF537sQBPg+Z1UqB12CBg0b
	Wgw92W5oCP180hIOJSAcz0sdSDwDmHsyKAbtLs7c27kWhh9YWHqQd1MS
X-Gm-Gg: AZFdTZcCRuFe5N8bzLfl5RMISoqghMHY7yEFJ0oS9BDt0TbapItoAhio52Gio6hyoE7
	i7sQL7sEt7jcqha7odEuUlNVH2cCOQxu3Ob1ZvGSneS53a1XS3yUiDKDzDnOz1/Fupgd9uYSyh7
	td6xjMbHwxpvhvRLFf431xvjfMgyBD/5OgW0r/+FS7LRUna63UAhAR+kXL3opUxvOuU3+wcyEAO
	SWYkxSSvQjue2z++M7fWNY0gd6w55uZErLPAIqDqTin0x69pCQlbERXJHVhNxWiK69b4qngqi9b
	/2idemRpEZjQMXvfQ61fI095Fz45w8ciXcgnDT+Mn1via/wfPFg0kvcbq2LLBCNn7eyg22WtGi2
	X/X94cb+/UpB4sqNlSqyjhTFyDkLqYqbqBtS5fGUH2jqzdIONvZ2gFJtSY60AzXkFbC4sZcciYe
	s9KgRCYQBq/offXd4IHTyfLvScnBg7i6OiiLhQ940yGjCfinjWARgPNOug1ixKJ3i3V8ub0LqBQ
	Yn1UoRYdC7TX9EUJHifyVKPxGVfif8wiskEF6Wc75tCtwMUoKw+IIiSFR2W5Jwaeiy5FwBom2F8
	rhKCRiyxrVGyp+z2eAZTFpQdO8tM6o0XA2DuW6SHGxTBXBkrAjsFytVIYYeYn7pp22eBZ2YsvJg
	YiDlkn7iQYrSU54id+o2LNQU9SOzW1gk=
X-Received: by 2002:a05:6402:1d4f:b0:6b7:dda4:f72c with SMTP id 4fb4d7f45d1cf-6ba729046bamr8500699a12.44.1795605997391;
        Wed, 25 Nov 2026 03:26:37 -0800 (PST)
Received: from xeon ([188.163.112.54])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6bb1b93a8efsm1202907a12.7.2026.11.25.03.26.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Nov 2026 03:26:36 -0800 (PST)
From: Svyatoslav Ryhel <clamor95@gmail.com>
To: Thierry Reding <thierry.reding@kernel.org>,
	Jonathan Hunter <jonathanh@nvidia.com>,
	Sowjanya Komatineni <skomatineni@nvidia.com>,
	Luca Ceresoli <luca.ceresoli@bootlin.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Svyatoslav Ryhel <clamor95@gmail.com>,
	Mikko Perttunen <mperttunen@nvidia.com>,
	Hans Verkuil <hverkuil+cisco@kernel.org>
Cc: linux-media@vger.kernel.org,
	linux-tegra@vger.kernel.org,
	dri-devel@lists.freedesktop.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-staging@lists.linux.dev
Subject: [PATCH v2 6/7] ARM: tegra: Remove fallback compatible from Tegra30 VI node
Date: Wed, 25 Nov 2026 13:26:12 +0200
Message-ID: <20261125112613.237333-7-clamor95@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261125112613.237333-1-clamor95@gmail.com>
References: <20261125112613.237333-1-clamor95@gmail.com>
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

Tegra30 now has its own specific compatible string for the VI. Remove the
Tegra20 fallback, as it may interfere with the correct configuration of
the device.

Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
---
 arch/arm/boot/dts/nvidia/tegra30.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm/boot/dts/nvidia/tegra30.dtsi b/arch/arm/boot/dts/nvidia/tegra30.dtsi
index 1e51da329f310..e1f66240ae552 100644
--- a/arch/arm/boot/dts/nvidia/tegra30.dtsi
+++ b/arch/arm/boot/dts/nvidia/tegra30.dtsi
@@ -150,7 +150,7 @@ mpe@54040000 {
 		};
 
 		vi@54080000 {
-			compatible = "nvidia,tegra30-vi", "nvidia,tegra20-vi";
+			compatible = "nvidia,tegra30-vi";
 			reg = <0x54080000 0x00000800>;
 			interrupts = <GIC_SPI 69 IRQ_TYPE_LEVEL_HIGH>;
 			clocks = <&tegra_car TEGRA30_CLK_VI>;
-- 
2.53.0

