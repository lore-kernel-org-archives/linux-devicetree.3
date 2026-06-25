Received: from mail-dy1-f181.google.com (mail-dy1-f181.google.com [74.125.82.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2E7583E451A
	for <devicetree@vger.kernel.org>; Thu, 25 Jun 2026 12:55:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782392133; cv=none; b=DeGLumUkMtIDg4t2AWTR0YJDBSk0OAns6fofrNx5xzdEtjfBcJNraalBHcSgNgz9xIcI+COGdgCUqTtpwI+NaDY3UdJaj+A5vHVpFw222XU/netZ9Z4YByW/egBUfYrizPz5m0BtM9QDdnKuRq9natWPrEO7gikzu76YlHqJGc8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782392133; c=relaxed/simple;
	bh=fhm+aixP5ECDzq8HdzVVNjUbNQs1gCCo767CoYMygZ0=;
	h=Date:From:To:Cc:Message-ID:Subject:MIME-Version:Content-Type; b=QWghIFkmY3uzBTCYf31dVxxs3Y7PmBYRp53VtSF9FTAvB2i2FGPrAokNG1V/onljbWkxHRN1x3z27nO4z+5VmyqzvUgBsbeHK3yanvYY5ZHK5xbAOUQhX/KyS26CAGZiGlJgm2LjYv37AfnpNuFK95pLLfd0DpwzydlSsB6XtnE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=nfOdw0ec; arc=none smtp.client-ip=74.125.82.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="nfOdw0ec"
Received: by mail-dy1-f181.google.com with SMTP id 5a478bee46e88-30c52f96f60so4204343eec.1
        for <devicetree@vger.kernel.org>; Thu, 25 Jun 2026 05:55:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782392131; x=1782996931; darn=vger.kernel.org;
        h=mime-version:subject:message-id:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=89Ic5OiQ2TxKlY6JX2s9PoYvegkXRGC8cRDRdVhrKkc=;
        b=nfOdw0ecCLsd/mkwITN2pYvc8YGb1h4TjaZFM6HoiQVbK8CNILZNKzaTWhYyhNzlU7
         QoYrIv/ovNVG6ZzXz9GMSMxzIA8318pEhgffBHWNXnOGKYtQPvtarTap/wlVbRu6Y/da
         Lx9JV+OdCAL794UaapRUiMcXXXcIKJww5DdzypsWCOBaf3ik9siE4ZYJH/YN8gP21P/m
         3AwYvTl1COrd7o+IW7QBHbku/CVu6iZqo2/PA8nNsZ6nW3p+wEGWvpQkYXoiBn+K/br0
         AaV3EXtLzgvHD9VZI1OhQ1yzZpJYgdSaZ3idJf1Ug0eEuAP1eADkyOBW4afCFEqaQinG
         0wBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782392131; x=1782996931;
        h=mime-version:subject:message-id:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=89Ic5OiQ2TxKlY6JX2s9PoYvegkXRGC8cRDRdVhrKkc=;
        b=Smm7onnWuoWd6FeTVoN+4BUOUwUOYFQi4Wkmi223IeXxBZZNGrFh4WEjnVHCCgLkf/
         rnGDbBBZbX0YDQVMbDr/eWKP5PPPXsJsemMezuPuhkYJpMEAk9FwoE1geNrZr13sJD2C
         zq8X7u/19rK2YPhYGgnyed9QqG2mjJu8WKuxQC0/kZdFuEmRIka1krKHfUgrQ+sZSERX
         4tSwLIJLevtoImrQtfsHaogaIN2zVpx+OabhPuQL8jVzRjlKjRXPWLrjmCdmDFw2wFAS
         yKlU85HIFeZWpu+hWFRdkDnqC+Ztptp6r0ak101sqYSz2+Ai9Y30eu6hauEHo9Zu7XOZ
         TGrw==
X-Forwarded-Encrypted: i=1; AHgh+RrYjp2TlKOx7cb5z+k+aMz3CrSk9rsagFAj2ZjK3JmxvN4Vgwkg5w85+HrMwq1XualrFRh1J2Nc+ki0@vger.kernel.org
X-Gm-Message-State: AOJu0YweG/MCfZITM9h4jzr34I2CroaWAlmKMDbJ4r/AGzwnkmG50UI1
	wQNlXUpzVhCyb8fK7AI2S4AxK1d+Yr6FCdn9dhegbg49TJyk0Fi1VtJ8
X-Gm-Gg: AfdE7clw2MxJ927pShkl/ErCc9KOHBSASUPtce0kER7d3yw6uKiTkYACTeU4LCXFPZs
	Jyo5bwrztIMpAcjVzjPr9tDF0WHnrNkXUmWoca2yNEzbqNn693upzEU9gWiyA68UhVGq4mkRvNt
	su2VekorqyEF7RWtzO8Hm0LKAkGCbrUopIzCpYAitAm3F30VbH64BPPosojo+kyyUd2TmTKawvI
	I7B8R3fUHmkEFoj1/CG+pBjTQcP2PzMMfzQeghfICGprv5T9h6xCkpDVUhmooJL32cIqIC364qJ
	gwKrcwx2Nf5ptZ44V4wWSSAL9S2NJW81k9ownqM4o67Kcd1iBsGLEphX9pLtegFVbIgU2PG2aJ9
	QFp2Vki84BA9/XOdOIWAagdX79hZI1vYAYcMALhTZTulHCxUOK8Zcv6rvLR2asIwRHsItqxfpOA
	LDhNbMvk+4W4QsR48dZVI=
X-Received: by 2002:a05:7301:600a:b0:305:56a:c38f with SMTP id 5a478bee46e88-30c84d8c4e8mr2777422eec.26.1782392131106;
        Thu, 25 Jun 2026 05:55:31 -0700 (PDT)
Received: from [127.0.0.1] ([177.174.222.21])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-30c7ca87caasm8136463eec.27.2026.06.25.05.55.27
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 25 Jun 2026 05:55:30 -0700 (PDT)
Date: Thu, 25 Jun 2026 09:55:22 -0300
From: Wagner Popov dos Santos <wpopov@gmail.com>
To: AaroKoskinenaaro.koskinen@iki.fi
Cc: AndreasKemnadeandreas@kemnade.info, KevinHilmankhilman@baylibre.com,
	RogerQuadrosrogerq@kernel.org, TonyLindgrentony@atomide.com,
	RobHerringrobh@kernel.org, KrzysztofKozlowskikrzk+dt@kernel.org,
	ConorDooleyconor+dt@kernel.org, linux-omap@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Message-ID: <fec5175f-8533-494e-af5b-1abe26f6d83b@gmail.com>
Subject: [PATCH] ARM: dts: am33xx: avoid invalid OCP device-link for timers
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/mixed; 
	boundary="----=_Part_19_261743831.1782392122149"
X-Correlation-ID: <fec5175f-8533-494e-af5b-1abe26f6d83b@gmail.com>

------=_Part_19_261743831.1782392122149
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit


------=_Part_19_261743831.1782392122149
Content-Type: text/x-diff; charset=us-ascii; 
	name*0=0001-ARM-dts-am33xx-avoid-invalid-OCP-device-link-for-tim.pa; 
	name*1=tch
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; 
	filename*0=0001-ARM-dts-am33xx-avoid-invalid-OCP-device-link-for-tim.pa; 
	filename*1=tch

From 6d482ff72d1a11a5851602717a48eb3e059946d4 Mon Sep 17 00:00:00 2001
From: Wagner Popov dos Santos <wpopov@gmail.com>
Date: Wed, 24 Jun 2026 13:28:02 -0300
Subject: [PATCH] ARM: dts: am33xx: avoid invalid OCP device-link for timers

This patch fixes boot-time fw_devlink errors on AM335x/UCC3 caused
by invalid device-link creation attempts involving timer1/timer2
and supplier ocp.

Observed kernel log messages:

  ti-sysc 44e31000.target-module: Failed to create device link (0x180)
  with supplier ocp for
  /ocp/interconnect@44c00000/segment@200000/target-module@31000/timer@0

  ti-sysc 48040000.target-module: Failed to create device link (0x180)
  with supplier ocp for
  /ocp/interconnect@48000000/segment@0/target-module@40000/timer@0

The change updates dependency handling for timer1 and timer2 so the
kernel no longer attempts this invalid link-creation path during
initialization of supplier ocp.

Impact:

- Removes the two ti-sysc/fw_devlink error messages at boot
- Preserves current timer and clock assignment behavior
- No functional regression observed in boot and timer operation tests

Signed-off-by: Wagner Popov dos Santos <wpopov@gmail.com>
---
 arch/arm/boot/dts/ti/omap/am33xx.dtsi | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/arm/boot/dts/ti/omap/am33xx.dtsi b/arch/arm/boot/dts/ti/omap/am33xx.dtsi
index ca3e7f5d7d0d..760598d5ae1c 100644
--- a/arch/arm/boot/dts/ti/omap/am33xx.dtsi
+++ b/arch/arm/boot/dts/ti/omap/am33xx.dtsi
@@ -708,6 +708,7 @@ &timer1_target {
 	timer@0 {
 		assigned-clocks = <&timer1_fck>;
 		assigned-clock-parents = <&sys_clkin_ck>;
+		post-init-providers = <&ocp>;
 	};
 };
 
@@ -721,5 +722,6 @@ &timer2_target {
 	timer@0 {
 		assigned-clocks = <&timer2_fck>;
 		assigned-clock-parents = <&sys_clkin_ck>;
+		post-init-providers = <&ocp>;
 	};
 };
-- 
2.43.0


------=_Part_19_261743831.1782392122149--
