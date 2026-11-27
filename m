Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.50
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795791277;
	b=U+VTZgeiOiODQD7SpGBBV2DVtzXpkx2SrXUeUf/VLtPljycTs4V6Q0L8vMnHtW0XInt1
	 h4o3o+ZukjIqrdcSncOLMrbIZToIzT9++HKDtlcIIJbp5BCxdvR5S4RX6wsvkxjAymwfS
	 r3u+bnSR/dcxdxEFeVHL3yxa/UxfOESB4nY4y7RlSaH+aOIm3a4qU6P4adXS2K0pdL4qj
	 jKb38Nl1kIi/EIXd5BUGd53mz0R2ARkctBg29NwJuM7Xm6JWWtjnF9i+4kKKq2x/3sAP0
	 st7CiexKSIh1NhU1vyb8fKqIsQNz7Hx8HWZb1/DcuTnr7FioPK4pGLMb8NgSrdlnwxA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795791277;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=B2E3iVg+Y53ku5x5pyq2TwGurqaRpRcncBnG/OPEoGE=;
	b=k6fUcEZDNI/ZKZJIoQ6C/+FqmkoElbfVUpCSRpWcofzZCRd8ts126lI5OJEokLLY+y6o
	 2MHYih0OXeL1vWdorC154VgmVAWy5XDb32ksw1QCX82w89jaqqlHmzZ5c31L3NY9hJgrg
	 BxU/Ad9OVGBXoqlB4BOy75pjp1qKly24hVuvbI8hjizU/qwytYh65E5tT76x8cE8uuN6V
	 J7x+rFRi6LTT/mdRaCCexjASauQ7hwLZ5shu+KzROsz+osSSCRrt49A2/doIXLshcpd5/
	 A729HvLCEqKFJnWpflvA20uJlAbL4CIZgfDKavjSi9FIQflx8rPe0aM8mfmI/6rJPqw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=iixHA0sv;
	arc=none smtp.remote-ip=209.85.128.50
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9B312606A329
	for <devicetree@vger.kernel.org>; Fri, 27 Nov 2026 14:54:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9B312606A329
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=iixHA0sv
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-4bb70074ab2so87148595e9.0
        for <devicetree@vger.kernel.org>; Fri, 27 Nov 2026 06:54:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795791276; x=1796396076; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=B2E3iVg+Y53ku5x5pyq2TwGurqaRpRcncBnG/OPEoGE=;
        b=iixHA0sv88U6GlWaq8WJ6u6F6OD+2Ul2IEc5X29nvNhQV0advhEpIETTKTjyWEOjsZ
         f2rTwAZ70xSLu1rCUSuvra2ZMU1HigrRRj0ail5JxftmZ0v8V5gsNaOgMh7tAymaPg91
         VUKwJPq4/7LeCQf2qcYIo5HtfHMp37YhEqVpRRQSVTQEmfOuaRBPZhagVH418I9AZ+UQ
         2zOANZnGrnPBOpCHr+Rb+gaTtfyMYLAQhwwSzlfzoIQ6oxawUxpqaA3l5ai67yk7c27d
         rR3pmEIriHL1iiy8iLokZ/z4Kn39q3lVDOOA+kYKrkKsVmt+zvm/yiycK3L36PG5dVG0
         X8AQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795791276; x=1796396076;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=B2E3iVg+Y53ku5x5pyq2TwGurqaRpRcncBnG/OPEoGE=;
        b=OYDhxAptTpFcZft0SvnvmfTpg/WYWO4tTmYs8HqmUXt2pIn1s9if5xqJI6ANWCfARR
         E6TY7lEHk/aArlAq/Th+77NCKbXrfwGDsYUIEqDbqzdXjnqt6wb6AqirZiThOkAjs5oR
         O2gjsEBN5hgemgsSGXPi/KQcEnsSZzX/7OTgUZQyp9OuykiTvrSSVxr0uGfN8MhWmpEq
         fGqjkeBzDWrCwXTzsvK6oHt9HCeGCI5KoCiX778wXZ2bcX/mf2AuHk+I+BXptLKsobwv
         s0H4QvMgxsw5pdztCwkzTV7V80qNStKTGWPQgi00fMnzqyvnjYyBzphA1U163rqiPxDv
         B3ZA==
X-Forwarded-Encrypted: i=1; AL+hErHCVBOHR7ef7WDA/4Rl2/lmldoKHsgfiQrHTZvvJhDb6btwMbl7T9STLVVrCjtpqwKHlMsmy4Hegt1S@vger.kernel.org
X-Gm-Message-State: APuU4Z/dZSCs/aY1hHKoLoI0ake1PdkZmBPtuL9OpFtvwUMow/2TlbKH
	FnfvWZlV1aiHytuXizVBMtJWSJuVthj73+A7F+qcs6TjCCio5Sjzyd4U
X-Gm-Gg: AZFdTZdmYeXT8kvhAONDlTaFuSIEABeqxRrbChi48X91rMHIjFsZSYeu6GXqDaCy412
	W+uNEaKKYedb+lO1qbj8pDO3jpfuZL20hgNaQJAc0GluIsv+Zi9nSm6kuF7rjWqJL1cGwWzPhd1
	OV1721ye5dAgZv/SYKk4PPxl+s8wBF7/7CI0Mtvp3WiYi7hCpfb+3zmapKDzH2n+AtYlZwNrH0u
	A54HGSdwe4PTgcYlgHJUEuhLLEa6aNWBdt/K3OmTgE5ktMchef/2VTwKjDJIaC/iMrAzkNkLRkk
	fsCTvz93RGze6e9vnxZJnutksWBCItNnKW13JRYm5aDUqyPu09lLXrQNhv4R5I00lisXxUgmXEs
	jVhfrQoiNYb0wn3mnM6SdpjwkTl168vXqF4Gy4nJ/i1UXGoeUjoDipKWW9KPa7aFmiqI/8RvA/h
	DhqBrj3mwWSsnuuxMO8a6zxWw8TqFNbdOZ4opXg4SzlYhmB8KkTRzRYvJxp4vJcq6YK8DCns+bk
	B6DMZoCHYHpd8kLWDlQfUPAhpZL4uFu+VPMNAvXBhPvNY7J6wHoMLNSPi9YFY5ML5FXnoFmRjUT
	xY+FkQNUrsCi2JVujLgNfZ4NKXd7imRhzw22aY0vfSiBhsiUOsuLyqfO6r18vI6G8p6MHZgNBIw
	6TNk=
X-Received: by 2002:a05:600c:4584:b0:4a7:c366:d791 with SMTP id 5b1f17b1804b1-4bb887e266amr485218485e9.1.1795791275934;
        Fri, 27 Nov 2026 06:54:35 -0800 (PST)
Received: from emanueleg-nb (host-87-4-46-207.retail.telecomitalia.it. [87.4.46.207])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb88442693sm633589105e9.1.2026.11.27.06.54.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Nov 2026 06:54:35 -0800 (PST)
From: Emanuele Ghidoli <ghidoliemanuele@gmail.com>
To: Sebastian Reichel <sre@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Emanuele Ghidoli <ghidoliemanuele@gmail.com>,
	Francesco Dolcini <francesco@dolcini.it>,
	Francesco Dolcini <francesco.dolcini@toradex.com>,
	Rob Herring <robh@kernel.org>
Cc: Emanuele Ghidoli <emanuele.ghidoli@toradex.com>,
	linux-pm@vger.kernel.org,
	devicetree@vger.kernel.org
Subject: [PATCH v1 1/2] dt-bindings: power: reset: Document the Toradex Aquila IQ8 EC
Date: Fri, 27 Nov 2026 15:54:23 +0100
Message-ID: <20261127145429.2060162-2-ghidoliemanuele@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261127145429.2060162-1-ghidoliemanuele@gmail.com>
References: <20261127145429.2060162-1-ghidoliemanuele@gmail.com>
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

From: Emanuele Ghidoli <emanuele.ghidoli@toradex.com>

The Aquila IQ8 EC belongs to the same family as the SMARC ECs and
implements the same I2C programming interface, with the same power-off
and reset commands. The module signals it controls differ, since Aquila
and SMARC define different connector interfaces, but this is not
visible to software.

Add a dedicated compatible with toradex,smarc-ec as fallback and make
the description generic, so that it is not tied to a specific module
family.

Signed-off-by: Emanuele Ghidoli <emanuele.ghidoli@toradex.com>
---
 .../bindings/power/reset/toradex,smarc-ec.yaml        | 11 +++++------
 1 file changed, 5 insertions(+), 6 deletions(-)

diff --git a/Documentation/devicetree/bindings/power/reset/toradex,smarc-ec.yaml b/Documentation/devicetree/bindings/power/reset/toradex,smarc-ec.yaml
index ffcd5f2c2bf6..d59d08c0250f 100644
--- a/Documentation/devicetree/bindings/power/reset/toradex,smarc-ec.yaml
+++ b/Documentation/devicetree/bindings/power/reset/toradex,smarc-ec.yaml
@@ -11,13 +11,11 @@ maintainers:
   - Francesco Dolcini <francesco.dolcini@toradex.com>
 
 description: |
-  The Toradex Embedded Controller (EC) is used on Toradex SMARC modules,
-  primarily to manage power and reset functionalities.
+  The Toradex Embedded Controller (EC) is used on Toradex modules to manage
+  power sequencing and reset.
 
-  The EC provides the following functions:
-    - Reads the SMARC POWER_BTN# and RESET_IN# signals and controls the PMIC accordingly.
-    - Controls the SoC boot mode signals based on the SMARC BOOT_SEL# and FORCE_RECOV# inputs.
-    - Manages the CARRIER_STDBY# signal in response to relevant SoC signals.
+  It handles the power, reset and boot mode signals of the module connector
+  and controls the PMIC and the SoC accordingly.
 
   The EC runs a small firmware, factory programmed into its internal flash, and communicates over I2C.
   It allows software to control power-off and reset functionalities of the module.
@@ -26,6 +24,7 @@ properties:
   compatible:
     items:
       - enum:
+          - toradex,aquila-iq8-ec
           - toradex,smarc-imx95-ec
           - toradex,smarc-imx8mp-ec
       - const: toradex,smarc-ec
-- 
2.53.0

