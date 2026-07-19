Received: from mail-pg1-f177.google.com (mail-pg1-f177.google.com [209.85.215.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EC1342E7657
	for <devicetree@vger.kernel.org>; Sun, 19 Jul 2026 05:23:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784438594; cv=none; b=ogUX143lnAH0yMiZOWt3zmDQgCcRuswFeOSqV5PvSzC22gCXjYUJc2szYmzCJVLbmkxwMtRhamekqLFyXIrlj/Uu7jzyfG2WUCAPqIYP2aQ60BVatqY+vunuyBVsczo9gC30wrirH/IfZN+TcRaTHr9hl3yF47YFaTJ8uOKSIdo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784438594; c=relaxed/simple;
	bh=UIJA8tptL+r22YrLQm5pE5mPfFlj4ABDgWrCfL7IYR0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=s3uxTQegVmz3dJ+whddABX3YMKmCs6no473P002p4DZlHRpin5Zs1SfmMDDBp5c13dtMut7jXWVhty5TWXt3u8aeIwMHiFPWIRTuyJ/aFU0+lkTNqJy7BRuCCuENXny1DQ2si+SIKGH6XjISaS9NkRAcqdGB+BmBWjdpiEyPJr4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=bw6HLFjg; arc=none smtp.client-ip=209.85.215.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="bw6HLFjg"
Received: by mail-pg1-f177.google.com with SMTP id 41be03b00d2f7-cb5a6aa8cf4so924494a12.3
        for <devicetree@vger.kernel.org>; Sat, 18 Jul 2026 22:23:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784438592; x=1785043392; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=pBC9wGN5WcqQqnbJA19I3YxiEUTegSJ8uL/Ced5d0n8=;
        b=bw6HLFjg9PjWkJdvQMBQSvwQCjzHZ59Nq+PSQPxqvBLDUL59MB91XZYebaImbdwWGg
         MEt//gt1nuC2l/sIRU6D4f0k+2ATv+AVhrPIb/J/TVztSpzaeh+JdJBw1d7DC8itz1X+
         vDpgIC0sDzYDzz3myJXs9SzQRRSN83r7e/p0soCdmnGOBTGwDnTTBjeBDqkgXMAT/bky
         J39qpBNeuTlzLcU+AivBi5J5H+JFzWEpffdB3TUJlmANmyc/OP6vprOpXi6JIZ0TsmrV
         L2eKh1aUgVgJ8dXOlckRizzkPA6SFM4a8SrwvKixR2NWsAN6wit0Rt+3KNrEZaL+8Dme
         VAoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784438592; x=1785043392;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=pBC9wGN5WcqQqnbJA19I3YxiEUTegSJ8uL/Ced5d0n8=;
        b=Qu0wPdYdByxYj4QKewL4NNuEOH6IykE8HU+Bzkk5jeTpAM7XkDCWbZ41CWSMu7WnUO
         AuuSlrY6q49q79zq22QLC3OHLtbX+CQVjQsixfbiUsV4b8Xrdeop33dW4KoX/N0vs5mx
         a0Fn3eyH6WYZMlnjlHZ4PKieuTqm+jY8Arj7ELMf8lCkeUhZhuL+FT2b1szlqcaNHuJU
         g8zWkb2YKTnFqJ+X3Hsp+ER3GFC2tQqyMnYCjLqZUhg+LkTChK2dZ6Y/9MDJNBNXBqxW
         UhF45UFXN1gSsJDqDadQ7CR7yYr5tZR5lejdSnqqbKjfc53GaDuuc/r0mgxJp8r/14fa
         xiOA==
X-Gm-Message-State: AOJu0YwS2BQJbE7bJaQgQN27tDa0efaxNkl2pUKJ2nOVeK9QAL3xkbpR
	ty4esjJDg/7VmBcE/ty23ea5Q8kAE3eORmyzfHEfkaMZw1Y4VXxu8LN9
X-Gm-Gg: AfdE7cktjCf5s/B2RzruJ8AFxvLuedPCwYoI2QAX0I9cU7kpFrmMY9co7LTOv+54Z/X
	Fw7VSrS2FyUJVi+fv9erYlTHJprUmgt+2ifXZdNe7dVVyMW5SwSZxPIiVKzkUWkvwlBkGsu2NFX
	Dk8Gl+lYNsQS8DftoJK/PKpM1TpHIVE/L98GyuYeor1+Ia/S5H1syy4couPxIEdRi1VscoFzHSk
	Elp4grs4FygMwAPMjNSq2B6jrZ0NeKZXSGrUmsJoOAkwqulTJpkNY/Z/Ag8z9dhEW6Eoktjojk7
	MByq0tBD8TIuhNxWBAiNnITq9PJjRtXN1WkzeHPA/ovt8b2HNgdUA3V9rM1HKRhYfXQNDgq+JCE
	C6zHgFVWqrgI8GF/JpKrhc6NX0YDiejpkLO2kf5G5jUyDN8FQvy5jeyw/oHowOcJ1QgYEJ8g+Kw
	jkaUKJgjCij3Zh9u1erVE6u4WBXyp0Yg7xE37T1q8JlfvqKV7hDz/OsV5Pm0AowrJW5A==
X-Received: by 2002:a05:6a21:828c:b0:3c3:7e9c:e292 with SMTP id adf61e73a8af0-3c3ad7ac45dmr9339204637.25.1784438592174;
        Sat, 18 Jul 2026 22:23:12 -0700 (PDT)
Received: from dtor-ws.sjc.corp.google.com ([2a00:79e0:2ebe:8:431d:c6bc:133f:2959])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3142a1bbab9sm25950461eec.15.2026.07.18.22.23.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 18 Jul 2026 22:23:09 -0700 (PDT)
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Date: Sat, 18 Jul 2026 22:22:53 -0700
Subject: [PATCH 1/3] powerpc/dts: mpc5121: Move GPIO controller properties
 to SoC dtsi
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260718-ads7846-pdm360ng-v1-1-f318f85cda57@gmail.com>
References: <20260718-ads7846-pdm360ng-v1-0-f318f85cda57@gmail.com>
In-Reply-To: <20260718-ads7846-pdm360ng-v1-0-f318f85cda57@gmail.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Madhavan Srinivasan <maddy@linux.ibm.com>, 
 Michael Ellerman <mpe@ellerman.id.au>, Nicholas Piggin <npiggin@gmail.com>, 
 "Christophe Leroy (CS GROUP)" <chleroy@kernel.org>, 
 Anatolij Gustschin <agust@denx.de>
Cc: devicetree@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, 
 linux-kernel@vger.kernel.org
X-Mailer: b4 0.16-dev-b242f

Define gpio@1100 with label gpio_pic as a GPIO controller and
interrupt controller directly in mpc5121.dtsi so all MPC5121 boards
inherit the correct controller capabilities.

Remove the redundant local controller property declaration block from
ac14xx.dts.

Assisted-by: Antigravity:gemini-3.5-flash
Signed-off-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>
---
 arch/powerpc/boot/dts/ac14xx.dts   | 13 -------------
 arch/powerpc/boot/dts/mpc5121.dtsi |  6 +++++-
 2 files changed, 5 insertions(+), 14 deletions(-)

diff --git a/arch/powerpc/boot/dts/ac14xx.dts b/arch/powerpc/boot/dts/ac14xx.dts
index 5d8877e1f4ad..05fcf08df1ca 100644
--- a/arch/powerpc/boot/dts/ac14xx.dts
+++ b/arch/powerpc/boot/dts/ac14xx.dts
@@ -148,19 +148,6 @@ clock@f00 {
 			compatible = "fsl,mpc5121rev2-clock", "fsl,mpc5121-clock";
 		};
 
-		/*
-		 * GPIO PIC:
-		 * interrupts cell = <pin nr, sense>
-		 * sense == 8: Level, low assertion
-		 * sense == 2: Edge, high-to-low change
-		 */
-		gpio_pic: gpio@1100 {
-			gpio-controller;
-			#gpio-cells = <2>;
-			interrupt-controller;
-			#interrupt-cells = <2>;
-		};
-
 		sdhc@1500 {
 			cd-gpios = <&gpio_pic 23 0>;	/* card detect */
 			wp-gpios = <&gpio_pic 24 0>;	/* write protect */
diff --git a/arch/powerpc/boot/dts/mpc5121.dtsi b/arch/powerpc/boot/dts/mpc5121.dtsi
index a278fb7b9e71..9c5dacb94b92 100644
--- a/arch/powerpc/boot/dts/mpc5121.dtsi
+++ b/arch/powerpc/boot/dts/mpc5121.dtsi
@@ -146,10 +146,14 @@ pmc@1000 {
 			interrupts = <83 0x8>;
 		};
 
-		gpio@1100 {
+		gpio_pic: gpio@1100 {
 			compatible = "fsl,mpc5121-gpio";
 			reg = <0x1100 0x100>;
 			interrupts = <78 0x8>;
+			gpio-controller;
+			#gpio-cells = <2>;
+			interrupt-controller;
+			#interrupt-cells = <2>;
 		};
 
 		can@1300 {

-- 
2.55.0.229.g6434b31f56-goog

