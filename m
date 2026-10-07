Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 01C8240B383
	for <devicetree@vger.kernel.org>; Wed,  7 Oct 2026 07:27:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791358026; cv=none; b=Lha0M2CmcY5Bbqt+H4UT/3zaEuGzZR+h1qTkxwIKh3xsBkBLGQSfVd6nBSrkipRsOzfFe7XPy1qbnBGFcXVxhhn7CA1UxV9fFxKbLtrWQoc9aAoAY9oYx9zuJ4szJJ9iuZfYuo2S5YfkSZZcCvn0qnT6TSmfz+06GkjCpIP6ZUo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791358026; c=relaxed/simple;
	bh=2yjPX6fzpJbC7tPLZg7fc2fugKPof4O3hf+Ew/c2fd0=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=CwLDPRamOg+3M7jDO9pjqiDMUX6ef2v7R64ULjkfA+tjFvTAle3CUCjaWWWGLHyitHcDs2gKnriGOkvpjCkwvbTJpMmF24pW5b2UVAW2G+lID3h0A9RAfhMklBUQUj877IlUvGTHZeLRihD2N+EyhreK7P80GDsUehsURrOMSLA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=M5VOcB93; arc=none smtp.client-ip=209.85.128.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="M5VOcB93"
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-4a161d9b8c7so10967185e9.3
        for <devicetree@vger.kernel.org>; Wed, 07 Oct 2026 00:27:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791358021; x=1791962821; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=N93zwtvuEjpeUV4U8V8Lc96gQHGtAXTfWSzXg5QBVvo=;
        b=M5VOcB93tL5yhXpPyM9BTllrg6Xbh3x/Iqwb/XDfoAS6Sr7KAuQd60D1tf63mySiIt
         DmqxJ9R/Sf7y8hxeDyO8+nHfAHwL2+hDYsdpUfpCS7cCqwJp/WxARQ1Or33pl5xApyt5
         H6lugRFyuBQzpzBX5Cp5OhW5MSTDXy8qlPWMXRxMmH9QafTjRoqxvX+AXoQXYVW7ggGR
         upNKgAOb7MhmjApc1kLzl3T+Hk7m7M/iI7XmzSeWImEQcb/SBjZFwPkpNYCTnYtGmygn
         vBLjEnAEXM7zUJZFnIYoWSXfg+oCH8Mo7AHCns2LBOnUwMnPB30+Wxzt8mO0LU6uEsPQ
         ByIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791358021; x=1791962821;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=N93zwtvuEjpeUV4U8V8Lc96gQHGtAXTfWSzXg5QBVvo=;
        b=R2y/bSCax2eY9iRE7X+jznNX7jiZFteJfQmmAtAFd/WQes/u+s3Nko3Z6U6c1RvZjj
         PH+koCKEiHZm4zimAkSG9HtKn4tjdRIxzMk53atuhc9KL7ToivdPh5Uj7GbV/u39zfF0
         jkmYBv7aV8luPLHPn2p+NNPZthur+TpZDLozFwPxLLj+jlYkRs4vCv8O5xIuIqN89DbX
         5UOodzGo1f4IRR8J/JXp8uRf2kzW9Ghmzx+Z7dT98eCV1VRO/lOCZ2dG7mFAEoWXIJ86
         cJeh5Dv+mH3OdMIq2Wm3aVsH93iVFWDkwt7NQ0ABC2FybuWnqf64ZsLk+ydKKdJ1jL7+
         KRCQ==
X-Forwarded-Encrypted: i=1; AKwUvBxzJuArxtfSzR1HqU8qEVol92FmU75LUhtLiSy1iKY78NvfybEuFd0wAlZhLyMt/Opvi7OfPoNocuCe@vger.kernel.org
X-Gm-Message-State: AFuF++lruyCb6sZBWcLT6v6aMGEhSL1mQD21yXX0GlAgA8MxCXDy87PH
	/DsV18oAeauiT1sCpDtdD4sHfJo/m0zB16I6fudsMWaQcEmbumOOpZoI
X-Gm-Gg: AYBFou2jG2jKWXs8GsotmPzFYM4zmPQf6FBBFscHMRux8+rktj9h+ambPWJb6LMZa4Z
	LGnrq9xowYh+dHRfcZgzmokplPIqYDA6O22WZrFVxtipLfrOMV0M3rMFtAffO3i/Syu2Dmg3jfX
	NeMEgSsdkrlbqcEJ7tEx6YMVp72ap0zjs9vPh2pBK1f8IFA66W1orxGF0z9R9QysMHsXa0Lgzan
	PfUdopr9Fx3PYAJk/FrQRIZ3KwbQqWgCO7JEDqfHm1O68jOm0gNEAVgApTGYso9bVdvWuP46jPo
	8e43QC7Uab3PCINS711RiAvL2s0r9plXQwGp5a/94dq0aYCbB97WSQFnAWFuB7LgLnwoGuY0MQJ
	Tby/8tGOPHYvwjioHt7V5RrKnNy2BpflgwztD2UphULTuh/fo0thUlXOGDDrlrJk9WMsZYuGJ+m
	Coag+Iq0MD94CO30NZ/RCWBWaPmCXvWbPFO8BUaOL++dcC0hOMibKfJNLxYNJqnu+U5d9CwVoWo
	tPPmz1/Ig==
X-Received: by 2002:a05:600c:4fcb:b0:4a0:eae0:b30e with SMTP id 5b1f17b1804b1-4a180455c5fmr16716805e9.22.1791358021033;
        Wed, 07 Oct 2026 00:27:01 -0700 (PDT)
Received: from taln60.nuvoton.co.il ([212.199.177.18])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a180310c9fsm29912955e9.4.2026.10.07.00.26.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 Oct 2026 00:27:00 -0700 (PDT)
From: Tomer Maimon <tmaimon77@gmail.com>
To: andrew@codeconstruct.com.au,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org
Cc: openbmc@lists.ozlabs.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	avifishman70@gmail.com,
	tmaimon77@gmail.com,
	tali.perry1@gmail.com,
	venture@google.com,
	yuenn@google.com,
	benjaminfair@google.com
Subject: [PATCH RESEND v10 5/6] arm64: dts: nuvoton: npcm845-evb: Fix DTS coding style
Date: Wed,  7 Oct 2026 10:26:44 +0300
Message-Id: <20261007072645.1618147-6-tmaimon77@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261007072645.1618147-1-tmaimon77@gmail.com>
References: <20261007072645.1618147-1-tmaimon77@gmail.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Reorder the pre-existing NPCM845 EVB DTS properties so the base board
file follows strict dt-check-style canonical ordering.

Keep this cleanup separate from the peripheral enablement changes so
the functional EVB additions remain focused.

Signed-off-by: Tomer Maimon <tmaimon77@gmail.com>
---
 arch/arm64/boot/dts/nuvoton/nuvoton-npcm845-evb.dts | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/arch/arm64/boot/dts/nuvoton/nuvoton-npcm845-evb.dts b/arch/arm64/boot/dts/nuvoton/nuvoton-npcm845-evb.dts
index 5edf5d1..2dc1a4f 100644
--- a/arch/arm64/boot/dts/nuvoton/nuvoton-npcm845-evb.dts
+++ b/arch/arm64/boot/dts/nuvoton/nuvoton-npcm845-evb.dts
@@ -5,8 +5,8 @@
 #include "nuvoton-npcm845.dtsi"
 
 / {
-	model = "Nuvoton npcm845 Development Board (Device Tree)";
 	compatible = "nuvoton,npcm845-evb", "nuvoton,npcm845";
+	model = "Nuvoton npcm845 Development Board (Device Tree)";
 
 	aliases {
 		serial0 = &serial0;
@@ -17,14 +17,14 @@
 	};
 
 	memory@0 {
-		device_type = "memory";
 		reg = <0x0 0x0 0x0 0x40000000>;
+		device_type = "memory";
 	};
 
 	refclk: refclk-25mhz {
 		compatible = "fixed-clock";
-		clock-frequency = <25000000>;
 		#clock-cells = <0>;
+		clock-frequency = <25000000>;
 	};
 };
 
-- 
2.34.1

