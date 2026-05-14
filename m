Received: from mail-pj1-f50.google.com (mail-pj1-f50.google.com [209.85.216.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5268F3B47FA
	for <devicetree@vger.kernel.org>; Thu, 14 May 2026 10:52:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778755930; cv=none; b=evhzY0XDUPMeQ0h+Mopw8/mExCW6S1H1pX5gVF+tIFDcw2Kekp0M6/ioaal1HJU84oGaqk6Q6o19qk1AtmPX7P9os7sdKbm/FVCC/ziV1XUbrJaezmRISGryysgSWTE1fk/FMhMYYGrR2dX2nb1QE8Pb2nYlZbZBioF96ualHSU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778755930; c=relaxed/simple;
	bh=wB7S7AhOnSn6Ek3SrFzWWjjyagQiN1ViNC20Nip436g=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=ntu9D0NxV/1aM32Qw6oGIKwel4B0HQXY4gOMoo7+N49kD7UDtpnrjYh5ExE5XQrD9cXHClE+ik4L2tKtgD57ZoR1xWcjwLoNBe2QOX+tgytXgsjiLSzUgPTllGkXOsciwlhYgFvh4AoaDjoqbBIhfqNAkDA9j9/2QPaFRjNXXpU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=HXGYEay4; arc=none smtp.client-ip=209.85.216.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="HXGYEay4"
Received: by mail-pj1-f50.google.com with SMTP id 98e67ed59e1d1-365e20fe3b8so4637921a91.3
        for <devicetree@vger.kernel.org>; Thu, 14 May 2026 03:52:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1778755928; x=1779360728; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=X5Sa2/vj+BE8ys8T+7/Xzc4AP2smOJtHqxOXUV++N94=;
        b=HXGYEay4Xv6mJ+hb1pC+XbDxi6oxDduDAzS9Ku0l+vZbyjmZGpd/iPRz2owOiRWAAK
         lmmIO/PO9elYFuzGPNEPECeeRu3owHi+ZV970N83Fn8t0VG1Ms2W7GFm94JXwo9bqR+4
         soHxVyGCz66EvDTeLsjHRB+duZ201RYS3MEZg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778755928; x=1779360728;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=X5Sa2/vj+BE8ys8T+7/Xzc4AP2smOJtHqxOXUV++N94=;
        b=O8udL4wMfg+eOlxmetOzceQCclSsnTLBDtYAGoSC0i8PNozWY9CxWiwtSWR+aVMcqL
         leICyybV4M9TA+P+Q75h+iVfhoYBKMMAkBAOkCy6t0KYSBryFiIj1q7Qo1qdaUs1crK0
         FfaH2BQj5De+ioXdo7dVI07NfS7bLKkdDxZ/GJWCjtRJs9tFitOjbaMeLI1B4iXR7SAo
         x9lhKR6UCzAPgFmpE27CK00QvcxKpjkzeyrxXFNlxJngGqx/q16Ho3ErR9+5XXviGlCb
         pDyMZ92yTQBtyEH49jJrWLLplb90l9AiTw0YZqriqHadsyIKkz30cZ92iTzx8ydUbWvV
         iSBw==
X-Forwarded-Encrypted: i=1; AFNElJ/NQwzZa/g7oVJND3ZRO69ErP+A+HEjRiLZn8bv5ixpunbdddB0mwl45tCBUHIQcYOcmK7wUsIx7kLE@vger.kernel.org
X-Gm-Message-State: AOJu0YwJ8AOmdigdxdYFi0AZNpzgddh7dpsWYjFkydylaFtR9SmFFtgV
	WZpgEXwBoI4zZ8thHAZSeRqYLa+Yjz9BN7AedKg/HeF98QTzSqdcgMBTCQxYoAy4Vw==
X-Gm-Gg: Acq92OH4+8u6s3MfZaTeiNb23k4q5/4SKMBOe8C9XLnT6TDMuYSu3WLpIaXhYM3XFJR
	L3QqoqK0V+b09piFBPy0tUJ5Af02flKygnTQ+0i4vRTAKHypdJJOAdIRinEdTUfUpzzbABjcxsK
	igFPQO77ScjEz2A9Ep+4H4dYxRrR+4WJKB6K/cHqCdLCPdM0RVxG7VmmuSxE1csZ8MGv3SYQLgP
	b+4FJoqMnNxl7ss7MoUcxdcc6V+vqmJ5aP6zBnloDnXCa7ZMf5aTsfl1ourQJ/sb/t8LuF99PsI
	k6cZXbVZhpWhUxEEA+AaY/iaNWkbriqLZo70KwDWcrqb59Hao7JqLSCrCUqEpTmrhnrmbp1yDl4
	n+aaCSIDoowtaUbbZ1Dvlzoxj/Pn3eoFm9pSz9Fvi7ymnguoLEUX4K55gzv47+ags3P10kn6m6U
	jnmabB4xLIktzrlcsySNGa9JqRmL65RgQuECAu4f3MDjh6HIP2YnLcbizusCJ8eJWaz2LiB1QB4
	WmHZMcQ
X-Received: by 2002:a17:90b:50c6:b0:366:527:3c9a with SMTP id 98e67ed59e1d1-368f3e681b3mr8093778a91.15.1778755928535;
        Thu, 14 May 2026 03:52:08 -0700 (PDT)
Received: from wenstp920.tpe.corp.google.com ([2a00:79e0:201d:8:3a91:2f7b:b635:8285])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-368edf6738bsm7435822a91.8.2026.05.14.03.52.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 14 May 2026 03:52:08 -0700 (PDT)
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
Subject: [PATCH] checkpatch: Don't emit warnings for USB & PCI device DT compatible prefixes
Date: Thu, 14 May 2026 18:51:50 +0800
Message-ID: <20260514105151.2771474-1-wenst@chromium.org>
X-Mailer: git-send-email 2.54.0.563.g4f69b47b94-goog
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The USB and PCI device bindings define some compatible patterns based
on device IDs that use the comma to separate vendor and product IDs.

These patterns include:

  - usb[0-9a-f]{1,4},[0-9a-f]{1,4}
  - pci[0-9a-f]{2,4},[0-9a-f]{1,4}
  - pciclass,[01][0-9a-f]{3}([0-9a-f]{2})?

These are not real vendor prefixes. Don't emit warnings for them.

Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>
---
This is a simplified version of what Brian Norris previously posted [1],
but more comprehensive and more perl-y than what Yingying Tang posted
[2], which only covered the second pattern.

Hopefully everyone likes this version.

This is based on next-20260508.

[1] https://lore.kernel.org/all/20190223022440.146915-1-briannorris@chromium.org/
[2] https://lore.kernel.org/all/20251210073812.1380803-1-yingying.tang@oss.qualcomm.com/

 scripts/checkpatch.pl | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/scripts/checkpatch.pl b/scripts/checkpatch.pl
index 3727156e4cca..ccedf152acfd 100755
--- a/scripts/checkpatch.pl
+++ b/scripts/checkpatch.pl
@@ -3795,6 +3795,9 @@ sub process {
 
 				next if $compat !~ /^([a-zA-Z0-9\-]+)\,/;
 				my $vendor = $1;
+				next if $vendor eq "pciclass";
+				next if $vendor =~ /^pci[a-f0-9]{2,4}$/;
+				next if $vendor =~ /^usb(if)?[a-f0-9]{1,4}$/;
 				`grep -Eq "\\"\\^\Q$vendor\E,\\.\\*\\":" $vp_file`;
 				if ( $? >> 8 ) {
 					WARN("UNDOCUMENTED_DT_STRING",
-- 
2.54.0.563.g4f69b47b94-goog

