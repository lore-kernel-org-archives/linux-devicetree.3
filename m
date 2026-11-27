Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.161.54
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795771721;
	b=p7zjxGU0Tll6IssH5M2B1Z8dZ6BidItUSBgadtXtPrtHVmfs/D87f9Kd/smsBCQjuOFh
	 ypr0e6ABX5b7Ny7Y8RhE4XK5NJbfDlwjts02uEvrB07iH3qdi/3SfOBU1QFWf9i17bPje
	 yqb5oaOT44CSgPou9pnOB2O9LeCQFboJXgLHk6qq7+BLAekteyajXVyR6c5d6Xk3+CvTl
	 6jFF2okzSphL4V6vN6NEGo0/8YrQQut9h1yJGGHxTodzW9qUQ6RvDuvntiy8oYvIdHc1V
	 wpwEc3Q0zPZQP91qr6ImDzHNFEtv1q9g07vFWm95tfKcZVo/oSUyXRQcUuMxWU/HK/A==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795771721;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 MIME-Version:From:Date:X-Gm-Features:Message-ID:Subject:To:Cc:
	 Content-Type;
	bh=jasLtAoAN2ehO2HUA2d9AgFolPUIbV0VilFvPbWCDQI=;
	b=lmE9V76m63GhDGgTMpP8d5tEtvIUfgH5Hhf7DbHGNlcArQBuPozG/mdIpKUiI4kS1NdG
	 rJdsJSoPUI75j95+woUY6R6cUBOI40vh/q3ZPiWJvqmv4ermYs53AjYYNo5sxvLzQzWEG
	 AcFeZpRfLUSiXFCgKuii0rDNwhZgTIwDsyIq0gbmeQPCd0u4/Bka0JZ1S0ZLLlEmNZuI5
	 hwa/SJGat9KXncscjT6j56FWL/yWJFR+cy17ujC41UaIPUg6cngqwVPkd43eCZFEH4nKM
	 PJ0eFtJEJEXf8aPd4NwsYvYB/coRxVmUBGJsWsMKMWGpQ9hGo9hm7TDCFqa7l21Lr1A==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Rh16fdah;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.161.54
Received: from mail-oo1-f54.google.com (mail-oo1-f54.google.com [209.85.161.54])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 84AF3606A31C
	for <devicetree@vger.kernel.org>; Fri, 27 Nov 2026 09:28:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 84AF3606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Rh16fdah
Received: by mail-oo1-f54.google.com with SMTP id 006d021491bc7-71b47eede22so4711409eaf.2
        for <devicetree@vger.kernel.org>; Fri, 27 Nov 2026 01:28:40 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795771719; cv=none;
        d=google.com; s=arc-20260327;
        b=TZfabA9LVaHrlva89JrCFE68WsmHexGe3GXQ6U6YUOnC9C2od7XDfhAy3XVdSes7cP
         ZpxLdp81vy+JuzMtJt/vO6uqc6YXjFx+j0AY0nGswEN0pzcUFkppEPQSRgAitm5YZRaz
         SE5qJuTrjeKMxpFwlo6C/K54okVIejx1Tt8abXFKzjg0r7Y4tQ2/b+RwtYNAioMqAITJ
         RJkI9TFcmIY5/4IsQoXRZGjzx8m6AFJfBWMzHhQSt0S2fwGcxAaLeYXYcl4+cKEHk2is
         eMtuWJZVSPIBS8DQ9pXfIPt/B0PLKWuMzJehb7Leu4uAWDBS3ZqfXA3ynKKqRlIzkq6E
         hw1g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:mime-version:dkim-signature;
        bh=jasLtAoAN2ehO2HUA2d9AgFolPUIbV0VilFvPbWCDQI=;
        fh=2ptphADYGS6zT2v9C+9XIJEpzZFZJt+LFYRFwYlxVs8=;
        b=U2B2R5mVs+X24S/FVeO4OHrjUo4LyZesdmyxa7t+Zs1JXoMYXzdRJWHtHlRlQr2lTX
         G20sjZr2QEwgoDgFEW9sQi7a2kYIo1jOozMGlXpernO1oE0XsE0Z/AgEwv53qwnSi1sh
         sxVhBMn2fu+1bedey5cj5D+QJgETntlh3mjKvpUnasBx9r87ugBFYF8nBsC3VDOXbl1+
         ec4uJuonkznsojQXqPwJxmf1aAYGQ8Iu+6Ev/3oasF/dydL3rNdAGCjBBJDWFgwcaxIf
         zyk4GFPzHL3lfHccnpvdjcYAMe71eRZSLnfnXPiDSlmfYpvEq6k/plTQpZNlQeCx4fH9
         66jQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795771719; x=1796376519; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:mime-version:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=jasLtAoAN2ehO2HUA2d9AgFolPUIbV0VilFvPbWCDQI=;
        b=Rh16fdahTkQEr2yvVBRJtwyGnSAEFnpmKRuEY4VXO7nsw7zB+ex9qefDx7s0fup7eE
         HfvsT2dDX0gNl3efQY+ztdmRkgDrArOtyNy69FzG+zJGk0KYKOuRWHnJux4l7w1UQs1V
         QQjjBGJPIfb0rn0PQop3avMkjA1j7sSSJ75oGJUS9ur0qpazQ1PyPXv+GrO8iVGds8OO
         8qXtqT34EW3BOo5kmmYx9Z5JuRDIoUY/g7i6q8HXBXnftNXfZo9zQ4kz6Y1LgivYUgUe
         hSixs2u7lgRAWet52bWJjfOHbqaIeieewDhqyDBPZYng4Rk5uzrebQ5B5rhSddKBuyfL
         Psxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795771719; x=1796376519;
        h=content-type:cc:to:subject:message-id:date:from:mime-version
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=jasLtAoAN2ehO2HUA2d9AgFolPUIbV0VilFvPbWCDQI=;
        b=Y/XatdKvz297itf51q5iTZZh8coZsakavOT41dv+Sc/ISYoaA8yRX2fGzA2jIuE22g
         mpoFuC5NXrA08Z8mtZCNWCgWguRKTEAYTSZpI1lj0q4P1oReCXnZAdaeT15wVnanOweX
         X5Sz08jW3MTLVpLAfCFaW54JLzjswjrBxYNxLns3/8pHc7kzo+gbY+NiK8We5cx224ei
         yn9+lEHCaFzEyIGTtqD2awnKygjyci4BpZf+1Uj+hwjODbZXiK9TXN8DoErRi87Y5WUX
         kEB9xNoUOvMNUfLNwvCZNEglCYg4wNfSjf3lp+XEfl/KzPf8OGusiDCYd3hufX2h3VCd
         zUnA==
X-Forwarded-Encrypted: i=1; AL+hErG46979IPtssW3IyzP0ZI9EZcnnXU36DKz2CfutzO/yYPxV9sYIsKPwJmHgFeryLl1nz03aslSUquCf@vger.kernel.org
X-Gm-Message-State: APuU4Z/duC87FHklw8VyKrTi2GbbfrHXkaUJncPWa5/zR4uvcfx8nrXW
	8DuWOE6mpCCvYkBc5/BYucnC+t0QM8v4uNRDIakWEO91yRdcWe2W5Ym7zF9sC2X+wVCRZhOKMIG
	VDfTP2N7glPERi/dDxItVHBdo7H7XIMhk8fs0
X-Gm-Gg: AZFdTZfopYMpr0agRbUX2jYPt383wHyhEz4vjapI0A3zDajyc7pRB7T+D/JKhN/QsS+
	xjaBvnMYOZ/Wsc6lD4IrP1ZFGM5wif6GefScsAEGlSAlR3DRZFqKG+8eac/bLxxif7WzElBW/45
	iZ/hEjeoM4m4JuRyOqOtZrBlG3z6dfRnzsucx525zRQ6TCpd8E7wrnnW21XO/YlPWB1lpo829PB
	2MOiLzRBD9ViTIjgNbuZRG7rIy7MEPgU111gCw+uQjpBQHSl/AUTelhH+530chSPSlv49YsK9uE
	1R5Xv446kbMgdZ3ZOtDhaCJyjuCXRIXsK9/MiT88X0Lsrd2Gh5m/S8NWhs3twe+ZFCLOhj7B7KK
	rBIw3MEFeDmitkd3qPkd9rEn3IVhD8pt0dbnWCK94ahTRUIi6Uzzxe+v9M+wjJqSHjivPCvXLKl
	z8+f7lX9z2SXE=
X-Received: by 2002:a05:6820:5703:20b0:71a:ef4a:8684 with SMTP id
 006d021491bc7-71b395213a7mr14074658eaf.59.1795771719556; Fri, 27 Nov 2026
 01:28:39 -0800 (PST)
Received: from 77377267392 named unknown by gmailapi.google.com with HTTPREST;
 Fri, 27 Nov 2026 04:28:38 -0500
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
From: getfeus@gmail.com
Date: Fri, 27 Nov 2026 04:28:38 -0500
X-Gm-Features: Aa3M54pU1a7yp7wVeaxARQpBCGw-lDvj9PbMOs8vidCd9nBQqqFWYBMApYiimPo
Message-ID: <CA+m4KrB1p2u_y92phm-xpn3up=kebi1OmiVc3X4CCdFzHT9-5Q@mail.gmail.com>
Subject: [PATCH] arm64: dts: qcom: gaokun3: Disable the cluster idle state
To: Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

The Huawei MateBook E Go fails to resume from suspend-to-idle when the
SC8280XP cluster idle state (PSCI parameter 0x4100c344) is available.
In a same-kernel and same-initramfs comparison with the RTC alarm
disabled, the power-button wake led to the boot menu with the state
available. With only the cluster idle state reference removed, the
system resumed in the same boot.

Remove the cluster's domain-idle-states property from the gaokun3
board description. Keep the CPU power-domain topology and per-CPU
idle states. This also removes the shared cluster state from runtime
idle on this board.

Verified on a GK-W7X with firmware 2.18. Using the same local kernel
and a DTB differing only by this property, the system resumed in the
same boot after 5 minutes and 19 minutes on AC power.

Signed-off-by: Lee Youngjoon <getfeus@gmail.com>
---
--- a/arch/arm64/boot/dts/qcom/sc8280xp-huawei-gaokun3.dts
+++ b/arch/arm64/boot/dts/qcom/sc8280xp-huawei-gaokun3.dts
@@ -365,6 +365,14 @@
 	};
 };

+/*
+ * The cluster idle state prevents s2idle resume on this board.
+ * Keep the per-CPU idle states available.
+ */
+&cluster_pd {
+	/delete-property/ domain-idle-states;
+};
+
 &apps_rsc {
 	regulators-0 {
 		compatible = "qcom,pm8350-rpmh-regulators";
