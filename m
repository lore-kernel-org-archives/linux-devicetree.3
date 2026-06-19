Received: from out16-185.antispamcloud.com (out16-185.antispamcloud.com [185.201.18.185])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8C0CA146A66
	for <devicetree@vger.kernel.org>; Fri, 19 Jun 2026 22:17:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.201.18.185
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781907470; cv=none; b=fLo3DGmnCAWNrqiPmnHIjsEjw8IbxQK7Ka7hWPuQ0Yf0brKjIJDQfETy+xtUX7aIE8iVVg/pB3F/ieYerlzFa/W65xXvOJ9yXE8Bkc6KjFJ2R0YY+D7Q/O5Rgs9JfOl29/mZ+yAvqUkblmPwhln2x/DHye/WAEJ7IP20YBVRM1Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781907470; c=relaxed/simple;
	bh=Ijcd6LGlaePLYjfet1XKQXRWzUhtZnk8JHhdn8+GK8w=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=QfH/922kAGC4Ykt8yZxi8LmNrkpiL1I/VxV8AXc6IKSySunYlnCiVIQucMZroqVaM4UzB8QQPx8qSYG0HI5w5Ik2KG77/8HV9BqU/odxaINuy7mLvvjs00jayoBjhNp1lwasiGRXCcjDESHuoa4r8J6Q0qIDF5bVd6whWtDUee4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=reactivated.net; spf=pass smtp.mailfrom=reactivated.net; dkim=pass (2048-bit key) header.d=reactivated.net header.i=@reactivated.net header.b=w4jyc6Uy; arc=none smtp.client-ip=185.201.18.185
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=reactivated.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=reactivated.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=reactivated.net header.i=@reactivated.net header.b="w4jyc6Uy"
Received: from s1041.use1.mysecurecloudhost.com ([192.250.231.249])
	by mx197.antispamcloud.com with esmtps  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <dan@reactivated.net>)
	id 1wag93-00890c-3C; Fri, 19 Jun 2026 22:49:02 +0200
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=reactivated.net; s=default; h=Content-Transfer-Encoding:MIME-Version:
	Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=+39Us0l8jzl2sSkZosAXigE21lGynPqD4B+AFWDahxw=; b=w4jyc6Uyz0ac36MGyhdcAceZ3B
	yP4lSimBquYRufa/0PJjMOABI+YHEAczg2KnLkzVnyoQfUrS6lcCj4D14QQsl71lR8wqA5acz2OM1
	FVqQP3xljDg3rFoA1rtpE4xzyHOcmmoCU1QHGGMRPzPtlBNdBmXv9iyKtNZrLb8pn6pwrlfI9QjSk
	2dcfpKPzvxWiW5IyVGrXhvVcUOQnOVFy/kqhRbkMt0qg1qyoBy3YImSstWEaT3Kgj0OT/BgTPzM3p
	5XBTVo5+iaHZpmxSILssUYvFcIjbzzsU2J7OxCH5j4U6gqcMcEYwrYyCbVds8JRGOQ3S5qvpGKtGh
	QC6R/Jnw==;
Received: from [188.251.249.2] (port=44192 helo=numbers)
	by s1041.use1.mysecurecloudhost.com with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.99.4)
	(envelope-from <dan@reactivated.net>)
	id 1wag8u-00000004qzj-19aO;
	Fri, 19 Jun 2026 20:48:48 +0000
From: Daniel Drake <dan@reactivated.net>
To: maz@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	florian.fainelli@broadcom.com,
	bcm-kernel-feedback-list@broadcom.com
Cc: devicetree@vger.kernel.org,
	linux-rpi-kernel@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	m.szyprowski@samsung.com,
	andrea.porta@suse.com,
	Daniel Drake <dan@reactivated.net>
Subject: [PATCH] arm64: dts: broadcom: bcm2712: Remove non-functional EL2 virtual timer
Date: Fri, 19 Jun 2026 21:48:32 +0100
Message-ID: <20260619204832.586079-1-dan@reactivated.net>
X-Mailer: git-send-email 2.54.0
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Get-Message-Sender-Via: s1041.use1.mysecurecloudhost.com: authenticated_id: dan@reactivated.net
X-Authenticated-Sender: s1041.use1.mysecurecloudhost.com: dan@reactivated.net
X-Spampanel-Domain: s1041.use1.mysecurecloudhost.com
X-Spampanel-Username: 192.250.231.249
Authentication-Results: antispamcloud.com; auth=pass smtp.auth=192.250.231.249@s1041.use1.mysecurecloudhost.com
X-Spampanel-Outgoing-Class: ham
X-Spampanel-Outgoing-Evidence: Combined (0.01)
X-Recommended-Action: accept
X-Filter-ID: 9kzQTOBWQUFZTohSKvQbgI7ZDo5ubYELi59AwcWUnuXx7vJpnF6lBq6hkdASV9+OkedQUW0QyFWx
 GFqKMLRWBiu2SmbhJN1U9FKs8X3+Nt06bFpPrNOlRAlE9AVLwR4uGVjKNnzF3nQoDoQtBifM84JL
 M0i5ZAms0EHrvcCaVIP2mhp3lwZCcR+loQ9rUxFdGnT3EFAinyrilm9zau/FuzkQt9Nb4Ml7QXdk
 EetczWCulNo0fvnzmZPW3MC2/ZtQeB7itP8hgjDRserKv4bhb4U5wM0P14+8nxGHhzXnVJtWBb39
 uS1TjWG2Inx+Ts2QrtVmombMJ4e2pn5C0yBMHZ0fE47nEjvubMSTLAkKCKclZzoe+TZdeH39wA4E
 grA4pE2PuLHIFQdBY9qb1rRWgyz0f29FZkQs6Ir87R/YNAtTbKw/GxYwf231heSaMVJD3jtYeKQZ
 QbovbfYtT7PWp8pdSgmbkvrIIacvajJHtO3S72G/q9ziRoPKvNmo60WYDMXZ5YhhGUSWFJu3WKou
 EwQMVfCztWYwHh5jFD6dTwPfWGjEg64G/H9xJ2Y/CUklmGXi9rEnl1nptmzo1mQZBXsCNnEIDr2r
 S37r3RSowsgpmnyhr47o3f4p0IoMTDhsttxEE84eFRPQDFeOmeRXGFNiLZt/QXQnOBRD+jq1HsLJ
 QaIV/mxT7GP4i/LIyHAmHyxxk8Sjs3o9/k8nLBnptKmIYbwfwINR1tlyGDj4wlKVL5CXNSk/Azmi
 JysF8dLHRyryw85/rAZb27+VZ3biGmceXSkEeDVzkpbfiUL+7qzaJBtZgkO5qAu/YKHH207PElLT
 oU/bGYmMXNUpR96ykJejswBocUyWLb+nt4o5Q7Da0TeEmYYYhwjEmZXEzeR1vCrJPmnnTHzVkpyb
 MK7ZTcjS0BktKCLK+lOkK/WEj0VIEqAi0wzqTkXDhL9Md9nbUE2RN8rvsyYrGXJTMg5Y0yoXKI6k
 1yFeXmpEy95koyRa37QZnmyww5QtT8/R8Y596J1fhOzjF0b4LXcjJZ5lou7aqQiaNW3qhwBx9vcu
 F5G5dCB5dSrZK3Ai42bfKZFGHA0x+xwl3YvXKx4bI5c+WWiFcbBNf9Y5mOHdufFntjUUUv+K3yJx
 eej3LRclw6ozvoGUBjUvvpdX+2T7XXXOS8oCG7c9HKFAousr1fg0ssl+6RlO7s/UIdgWJf6ThYnP
 9TX9YPaVQqjeGKYJQApZcII8LuKYpMHXESnLscDyjGqrGhRTt2THEelqjltfp0dGXPWlFdaGOH19
 1uXjgjQN/afWw0QpVLSzwSAqmb7CWzsSvlypk4kswkWqo94gxix+ipXGdBzoZlVYBe5JAbg73gCe
 IZyBg7HvH2nIa17LbgjKuFO+2mEj3Ei2hTvWconvG7gOvC4mGrn5xNl9tGvdjUoh2dM359Vvgmke
 Sgio/ZYij6tMUpMEVczC0SBn8klXnJ8JIFnbEDUJ7Rx+lCO8WACeIZyBg7HvH2nIa17LbgjKuFO+
 2mEj3Ei2hTvWconvAtuK2cz9C7Kez+6+t8E/BA==
X-Report-Abuse-To: spam@quarantine16.antispamcloud.com
X-Complaints-To: abuse@master.antispamcloud.com

Commit d87773de9efe1 ("clocksource/drivers/arm_arch_timer: Default to
EL2 virtual timer when running VHE") causes boot to hang on
Raspberry Pi 5. The newly-selected EL2 virtual timer does not generate
any interrupts, even though the GIC_DIST_ENABLE_SET flag has been
confirmed set via readback.

The reasons for this failure are unknown, however it is likely that
this timer was never tested. Raspberry Pi's original devicetree did
not include this timer interrupt; it was only introduced via a
suggestion[1] made in code review as part of the upstreaming process.
(Current RPi firmware versions do include this timer, but only because
they rebased on top of the upstreamed devicetree starting with
Linux 6.12)

Until more is known about this non-firing timer interrupt, remove
the devicetree entry to enable RPi5 devices to boot.

[1] https://lore.kernel.org/all/12363be5b11c752b7155cc0c416fdfd2@kernel.org/

Reported-by: Marek Szyprowski <m.szyprowski@samsung.com>
Closes: https://lore.kernel.org/all/ea15cce1-b393-43f6-8d58-3d6f90f0c0cd@samsung.com/
Signed-off-by: Daniel Drake <dan@reactivated.net>
---
 arch/arm64/boot/dts/broadcom/bcm2712.dtsi | 2 --
 1 file changed, 2 deletions(-)

diff --git a/arch/arm64/boot/dts/broadcom/bcm2712.dtsi b/arch/arm64/boot/dts/broadcom/bcm2712.dtsi
index 761c59d90ffc..09ff5e9959d3 100644
--- a/arch/arm64/boot/dts/broadcom/bcm2712.dtsi
+++ b/arch/arm64/boot/dts/broadcom/bcm2712.dtsi
@@ -678,8 +678,6 @@ IRQ_TYPE_LEVEL_LOW)>,
 			     <GIC_PPI 11 (GIC_CPU_MASK_SIMPLE(4) |
 					  IRQ_TYPE_LEVEL_LOW)>,
 			     <GIC_PPI 10 (GIC_CPU_MASK_SIMPLE(4) |
-					  IRQ_TYPE_LEVEL_LOW)>,
-			     <GIC_PPI 12 (GIC_CPU_MASK_SIMPLE(4) |
 					  IRQ_TYPE_LEVEL_LOW)>;
 	};
 
-- 
2.54.0

