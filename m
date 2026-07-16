Received: from out12-31.antispamcloud.com (out12-31.antispamcloud.com [185.201.16.31])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 006B32045AD
	for <devicetree@vger.kernel.org>; Thu, 16 Jul 2026 20:46:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.201.16.31
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784234787; cv=none; b=dhbwyOncB47QPwi5iVR4FJmRGyvo/dsB1GBPq2TkzYBKgJPG+DbpDDo6ZLWoc4tSA98HKjFNKOneQtRMiJuOO5WPlQWRCTUqdZKyOrI9fJgX4sfocuzP9eZSON5vDwAjhVEgezYDklMoEypJ50Sd+1WbndiuTqhFDolTFMyppgQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784234787; c=relaxed/simple;
	bh=cwy5jak6g7IxLCa4qCf/N7pTNSufMfG0lYLep0vG5Qg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=aPHh4Z6uWDczPYD3L0NKW4XhWb5Qpevv9t5xXU2HzXZK00H9AymkE2vzBCgdzU1h19AqDUv3FTMvU+0WOraElD6iEZ2u/cPjiqJvjewvMwY4rBwcs1Tv2I9D11Z1PxDicLzujm7E5sqzJcUTfNOhP3ZvZbcZbW0qxKxQQE0B3cw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=reactivated.net; spf=pass smtp.mailfrom=reactivated.net; dkim=pass (2048-bit key) header.d=reactivated.net header.i=@reactivated.net header.b=AEK/Z/83; arc=none smtp.client-ip=185.201.16.31
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=reactivated.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=reactivated.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=reactivated.net header.i=@reactivated.net header.b="AEK/Z/83"
Received: from s1041.use1.mysecurecloudhost.com ([192.250.231.249])
	by mx207.antispamcloud.com with esmtps  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <dan@reactivated.net>)
	id 1wkSy9-00E7gk-I2; Thu, 16 Jul 2026 22:46:12 +0200
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=reactivated.net; s=default; h=Cc:To:Message-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Subject:Date:From:Sender:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=r0dXs11HCmOmgE1CYNxtmBp1gBfnnBb1FnfZZbFBVCs=; b=AEK/Z/83q8nAwQucS87Lkqtcnw
	IuaZeNi4bfwdEFIo4bOxgXOdVoR3mzacyC2VxKP6sDQsYxkJCCX/RuFe8bo5NgnXJ4ckwSoDDg3E6
	/aWZQq3nH05kEaMRMEoXSeHnRSVeYj1xIJ7oVK8UI2Jyo/fiJ3teOaPaNy1/337EDx6eL7La1sEdr
	pAPuztx6h1t8oK8tXBbYvaqglBArL3QxWYx4UEIakZ7Jqi4PVRC0YkPcTfCiUyoUznP5YCD+hhmhC
	JgQNpbQMyQNiDTHQuFbefrgOq0V2PbQCHTtf8j2Kuyo0KOS9b1bS/gelBFJtMOfdLQc/WgJWF0ak7
	cjpo4yow==;
Received: from [188.251.249.2] (port=40258 helo=[192.168.1.123])
	by s1041.use1.mysecurecloudhost.com with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.99.4)
	(envelope-from <dan@reactivated.net>)
	id 1wkSy2-00000002ypb-2ifG;
	Thu, 16 Jul 2026 20:46:03 +0000
From: Daniel Drake <dan@reactivated.net>
Date: Thu, 16 Jul 2026 21:45:27 +0100
Subject: [PATCH v2] arm64: dts: broadcom: bcm2712: Remove non-functional
 EL2 virtual timer
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260716-bcm2712-el2-v2-1-e708f7fb42fa@reactivated.net>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/x3MQQrCQAxA0auUrA10skiLVxEXk2lqA3aURKRQe
 nfHLt/i/x1C3TTg2u3g+rWwV22gSwdlyfWhaFMzUE/cD4lRykpDItQnIRUWnkYeJSVoxdt1tu2
 83e7NkkNRPNey/B9rjo86HMcPoplEfnYAAAA=
X-Change-ID: 20260716-bcm2712-el2-2c6b6d868b11
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Florian Fainelli <florian.fainelli@broadcom.com>, 
 Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, 
 Andrea della Porta <andrea.porta@suse.com>
Cc: devicetree@vger.kernel.org, linux-rpi-kernel@lists.infradead.org, 
 linux-arm-kernel@lists.infradead.org, m.szyprowski@samsung.com, 
 maz@kernel.org, Daniel Drake <dan@reactivated.net>
X-Mailer: b4 0.14.3
X-Get-Message-Sender-Via: s1041.use1.mysecurecloudhost.com: authenticated_id: dan@reactivated.net
X-Authenticated-Sender: s1041.use1.mysecurecloudhost.com: dan@reactivated.net
X-Spampanel-Domain: s1041.use1.mysecurecloudhost.com
X-Spampanel-Username: 192.250.231.249
Authentication-Results: antispamcloud.com; auth=pass smtp.auth=192.250.231.249@s1041.use1.mysecurecloudhost.com
X-Spampanel-Outgoing-Class: ham
X-Spampanel-Outgoing-Evidence: Combined (0.03)
X-Recommended-Action: accept
X-Filter-ID: 9kzQTOBWQUFZTohSKvQbgI7ZDo5ubYELi59AwcWUnuXuz63D7qE6seh89SD71/sumfNGlBYjri2/
 68TdQ1K1kSu2SmbhJN1U9FKs8X3+Nt06bFpPrNOlRAlE9AVLwR4uGVjKNnzF3nQoDoQtBifM84JL
 M0i5ZAms0EHrvcCaVINXa25p4vL37Cn0xGkTDVVkGnT3EFAinyrilm9zau/FuzkQt9Nb4Ml7QXdk
 EetczWCulNo0fvnzmZPW3MC2/ZtQeB7itP8hgjDRserKv4bhb5a9CD46iTOjXEpJEwP3fd9WBb39
 uS1TjWG2Inx+Ts2QrtVmombMJ4e2pn5C0yBMHZ0fE47nEjvubMSTLAkKCKclZzoe+TZdeH39wA4E
 grA4pE2PuLHIFQdBY9qb1rRWgyz0f29FZkQs6Ir87R/YNAumMDSGxKENrQ3THqD2LmX4Fr+ytMGl
 md1ykBz+CAwk9DHwvsZx8077YxTSLSCYrv9P+7TzyBeXTiumzijgutYIoi2K9DeNQTERAxRKXAF7
 QnM6QnDLJoXjpNQbLyDmJtFIuFUyXkP5gG8UcARA02WKFP6BGj1uSv6UexQOhuwZ2ezQu5IqYl3M
 6BKhcK235VcmTWERkrGCV0ms8afq9ChbkvrcPJLRy7DXC8zjd9CYIerzZAZMYr1Qlq22B3cOq0zf
 WGjEg64G/H9xJ2Y/CUkltkYLM45R0PDQHHN05W0o+OWTmxb7WE5T8mLTWk2Qbj9fp2W1/kYdpzcF
 5IJlr+zVD61dj5p7BYnIfUPLdSLTlERz34wLeUqrE+ZzIxncSLTvcu0u7scCwXduTtywRH09mVqG
 pfOQdbkirEL6oCl+e+78JBJQBsZ9onOK+3k+uGPa0TeEmYYYhwjEmZXEzeR1vCrJPmnnTHzVkpyb
 MK7ZTcjS0BktKCLK+lOkK/WEj0VIEqAi0wzqTkXDhL9Md9nbUE2RN8rvsyYrGXJTMg5Y0yoXKI6k
 1yFeXmpEy95koyRa37QZnmyww5QtT8/R8Y596J1fhOzjF0b4LXcjJZ5losHmNKisMdD1GI8Ku1uj
 SE/PBHabh/HM49Vs2KHuwGDIkmVR/qkpHFAQ1wcZ+yl9L0yVYjcvCa4Cb7BaBKdCHJFyzlt+q9pI
 O4FwmoShOvaXRKQ4l66CH/Br2Pdc95xI1lTvxRropESjrQ/b+smFpqdO7dRwwJFaT3e0NfbGrQhE
 dqKBZHgaaea/KhAXtGWM4cjtkeE/GqocQMDlts79IWvdUXynqh9GwTo8Rgrlmg89vls/XYAj/pam
 svSXzk/DQt9OuaiLV/X6Mp9QmJ52x2zJ8snd4IkUZRzQVybDVglI09Tc8yOQMNrkbTA7RMLPFi+5
 uAyot8jVu+tkF5boxY3ZYUiXBJMMRenKbVLqrTlEZm14QQhIJgRzTtghPtkvhyOV7nf+mbEup1oy
 5eEX+RtDSeqScTxpzCldA9VvmFhsDoXq10Atm+XlKGQBdEhfBS+5uAyot8jVu+tkF5boxY3ZYUiX
 BJMMRenKbVLqrTlEXZFkw+/j1+FU/Mubx5UO+Q==
X-Report-Abuse-To: spam@quarantine16.antispamcloud.com
X-Complaints-To: abuse@master.antispamcloud.com

Commit d87773de9efe1 ("clocksource/drivers/arm_arch_timer: Default to EL2
virtual timer when running VHE") causes boot to hang on Raspberry Pi 5.
The newly-selected EL2 virtual timer does not generate any interrupts,
even though the GIC_DIST_ENABLE_SET flag has been confirmed set via
readback.

It is highly unusual that this timer interrupt is non-operational because
this is a standard GIC interrupt corresponding to a standard Cortex-A76
CPU timer. However, Broadcom have confirmed for this SoC:

> the interrupt line was never connected in the first place as this was
> not identified as being a requirement

Remove the corresponding DeviceTree entry.

Reported-by: Marek Szyprowski <m.szyprowski@samsung.com>
Closes: https://lore.kernel.org/all/ea15cce1-b393-43f6-8d58-3d6f90f0c0cd@samsung.com/
Fixes: faa3381267d0 ("arm64: dts: broadcom: Add minimal support for Raspberry Pi 5")
Signed-off-by: Daniel Drake <dan@reactivated.net>
---
v2: adjust commit message now that we received confirmation from Broadcom
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
 

---
base-commit: f4fb100039e96211609dfc44fb24b9e4a8a0f2f9
change-id: 20260716-bcm2712-el2-2c6b6d868b11

Best regards,
-- 
Daniel Drake <dan@reactivated.net>

