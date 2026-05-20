Received: from mail-pf1-f181.google.com (mail-pf1-f181.google.com [209.85.210.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 306B93B6C03
	for <devicetree@vger.kernel.org>; Wed, 20 May 2026 08:44:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779266682; cv=none; b=JNMQVj1ijVHV5oDyR8rRFAlarNtGYEPsrTHPqn67bsdYo5/r0tayM5fasSrhfIccoTiqvhlzsQtQs/y4tQOrody+quaeeB4UKd3iAWYKP2+PGqexcDJNjLswFs1RJ8QwmcWahYo+eUO+tyBHYKQy+zEmQIDVi4vs9Jz5iYkAPZg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779266682; c=relaxed/simple;
	bh=DYrzTa6rU2EWRZnyHhSY6UqODMxPKiCFlFwl6f+ux0I=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=TO8moCJzf3eqUdGwzb7TNaUPsBjHz+A2gUCggmjYCWSCCRUJ8/KmY8MZldVX8dKADvpF5eN5ETKQlyOLG1brl10cBvQTT5dJtW6yJTw5fHd+stGUbIrW3ikrrtQzCrNsuHf6FWlK8zaCaPbo1QuVfgKg5OG3CJmefEHsQ4K4Ves=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=DzLbInai; arc=none smtp.client-ip=209.85.210.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="DzLbInai"
Received: by mail-pf1-f181.google.com with SMTP id d2e1a72fcca58-8383fb7143aso2031869b3a.3
        for <devicetree@vger.kernel.org>; Wed, 20 May 2026 01:44:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1779266679; x=1779871479; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=iPyYWXdv68PW8J3G+OiAfrc+NQLll7mwxfwrGsqJTr8=;
        b=DzLbInaikLdTZ4nBHafxgB3CaDtaxXSd3OinYbLaflynani52H84XdPpIP007uKWwE
         +QBcd6BesICLrDHlP/a4cN1C+J+ctQJZLdzXvVB61qqn1Q4J/fAkiD3CtzQWxado13EB
         p4o/QS2xH+sLulfmFkzK1S5pdKTXBlxI1YtbE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779266679; x=1779871479;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=iPyYWXdv68PW8J3G+OiAfrc+NQLll7mwxfwrGsqJTr8=;
        b=arapm4Swt6sr0S4nW0wx2DerAMAeF0fbid9rHLu7gOuoXvdX0VZlAYaVI+tODU3GYP
         FUILXm6/MgKl63G6uv5/ICfRwfo9rdF29QbBJ18CMeEA05P5tTly9Zv35+VgmxR4lb3q
         KWrhTBPr+F+goJ3bqTBT6q3w6NUUwC0437K4LMfGJ40LPxtaDY9AOH1VcNFczk9/yz99
         kX3W8kPTuUFq/oNUlbXwsvDMQ1vAT48r40qSfxP32pBdPAzTwNPsTRcOPW1YU4S4oCwY
         hI63IHOJzAUk26+2SiyXPLl1NJwFI8v4EnzOljdT1wu78Ml1+EBaEj4X8h/I+73GbIzO
         +uqw==
X-Forwarded-Encrypted: i=1; AFNElJ9i2Z0obYYhT/LZWbWmJwc1vkCvXNeqgpmY4w05/jdkHLIrq8I1rzmwBPboZGSXyGl0VzNP/FUG0iF/@vger.kernel.org
X-Gm-Message-State: AOJu0YwgDvXcQZks+KJ1uYY6tZU0gUllz85lZfE6FIPWrmdr8A3qIwt/
	fgzielAFYdAUcRtTEPeNkPOkV5x6sTnYhbJZUcCfL+0Ly3AktMz4LZlYm/9OR5yvXA==
X-Gm-Gg: Acq92OEkr+YmI+IwQmcaVkSJRnRJOf5vtvIZvkbef9jX0Xysbf/6ZQW33MBZ4vABaiy
	LwML1P8NTrUIJaX26RH9S89yxyy6PW+U2XY86ZLMOKquOO0yWTLyGqmqNfY/A29UrlxIVyc1mkl
	LNsQMkxQ6Wx8XsVuYx9qTudyYlKdkhxOlzOhVIuS6PZjsK1qyvl7H/X8O3YnH/WCS8lNT43Mrpp
	/Ll4Oqk0LgUNSmkPs48maJEpLih6/x0AN95zEDi5f8Kpudcpx29cCE/2CnxQGvbjlYV/64ZBti7
	TIR4XbU7yY0sZDZZhuvHWaJUK23UZabgWY2F/rS1Tn4AYxsXrobODZs1a0e4CyMKYvSITSCQUNQ
	5mnnmC1vL6ATd3Ej9KfWFvkpX9HyYHk52gNdbkMTOK0QycUN37qDls+QCPLJcVDwxD1NIs9s24a
	16MeWtf0H4VjjKz0aKdXg1EV7nSO5+P9qTlyyJiVHGNyc0dEyJijUrJsIfABf0Yyb9kW11wOqVF
	HPP8IwX
X-Received: by 2002:a05:6a20:7491:b0:3a0:b781:4c8b with SMTP id adf61e73a8af0-3b22e815a20mr26839727637.2.1779266679541;
        Wed, 20 May 2026 01:44:39 -0700 (PDT)
Received: from wenstp920.tpe.corp.google.com ([2a00:79e0:201d:8:a6d1:2ed3:6bfb:7704])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c82bb121ccasm18614959a12.29.2026.05.20.01.44.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 20 May 2026 01:44:39 -0700 (PDT)
From: Chen-Yu Tsai <wenst@chromium.org>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Andy Whitcroft <apw@canonical.com>,
	Joe Perches <joe@perches.com>,
	Dwaipayan Ray <dwaipayanray1@gmail.com>,
	Lukas Bulwahn <lukas.bulwahn@gmail.com>
Cc: Chen-Yu Tsai <wenst@chromium.org>,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Brian Norris <briannorris@chromium.org>,
	Yingying Tang <yingying.tang@oss.qualcomm.com>
Subject: [PATCH v2] checkpatch: Don't emit warnings for ID-base USB & PCI DT compatibles
Date: Wed, 20 May 2026 16:44:27 +0800
Message-ID: <20260520084428.257066-1-wenst@chromium.org>
X-Mailer: git-send-email 2.54.0.631.ge1b05301d1-goog
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The USB and PCI device bindings define some compatible patterns based
on device IDs that use the comma to separate vendor and product IDs.

These prefix patterns include:

  - ^usb(if)?[0-9a-f]{1,4},
  - ^pci[0-9a-f]{2,4},
  - ^pciclass,

These are not real vendor prefixes. Don't emit warnings for them.
Instead just skip over the DT compatible check altogether, and leave
the real check to the DT validator. This avoids false positive warnings
about undocumented DT vendor prefixes and compatibles.

Note that the script mostly only checks the first compatible string of
each node, as it processes the source file line-by-line, and the check
only matches on the line with 'compatible = "..."'. Otherwise there
would be more warnings from arch/mips/boot/dts/loongson/ls7a-pch.dtsi
since that file also includes compatibles like "pciclass0c0310" and
"pciclass0c03" which are not accepted either. "pci0014,7a24.0" is not
valid either, but this patch leaves the real check to the DT validator.

Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>
---
Changes since v1:
- Moved check earlier and match against full compatible string to avoid
  false positives for undocumented compatibles as well
- Added comma to patterns as they are now matched against the full
  compatible string
- Fixed patterns in commit message to just cover the prefix portion

This is a simplified version of what Brian Norris previously posted [1],
but more comprehensive and more perl-y than what Yingying Tang posted
[2], which only covered the second pattern.

This is based on next-20260519.

Also, odd observation: the other regex patterns in this script escape
the comma ',', but AFAIK this is not needed.

[1] https://lore.kernel.org/all/20190223022440.146915-1-briannorris@chromium.org/
[2] https://lore.kernel.org/all/20251210073812.1380803-1-yingying.tang@oss.qualcomm.com/
---
 scripts/checkpatch.pl | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/scripts/checkpatch.pl b/scripts/checkpatch.pl
index 0d18771f1b01..d4ee9d88ad07 100755
--- a/scripts/checkpatch.pl
+++ b/scripts/checkpatch.pl
@@ -3783,6 +3783,12 @@ sub process {
 			my $vp_file = $dt_path . "vendor-prefixes.yaml";
 
 			foreach my $compat (@compats) {
+				# Skip ID-based PCI and USB compatible patterns.
+				# DT validation will check them properly.
+				next if $compat =~ /^pciclass,/;
+				next if $compat =~ /^pci[a-f0-9]{2,4},/;
+				next if $compat =~ /^usb(if)?[a-f0-9]{1,4},/;
+
 				my $compat2 = $compat;
 				$compat2 =~ s/\,[a-zA-Z0-9]*\-/\,<\.\*>\-/;
 				my $compat3 = $compat;
-- 
2.54.0.631.ge1b05301d1-goog

