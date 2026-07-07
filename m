Received: from mail-pl1-f176.google.com (mail-pl1-f176.google.com [209.85.214.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ED5C62848A1
	for <devicetree@vger.kernel.org>; Tue,  7 Jul 2026 07:46:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783410400; cv=none; b=RTPrcGsocG9dnT9GVGN30LjDRdCagZPDpLBaRpc/kRN5EWz2IHZb68kUIQ/1TmfLTW9eeTExMtDLpKEtL1I5y2C62k68mxzfu59F8rzFTaJFZqCiTadu9mAccjRBuk4fPVgstkSehySEYg3RMEb/dOapR+h18wvjAATeFmc6zWk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783410400; c=relaxed/simple;
	bh=5MRwzE6CPzDoCIUG8aXQY89HkNiTh8SY3HnOOwqdHWY=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Em2EjzvlxL5ecYsdAFx45A1bkaz1zVzp6VUOSDkZuC5JlYTMa80n69WefFxlwDHoyNKpfaCzW8pvIcxJKlREtiNZEt5S8M6qeDXqCh7iZkFvKkekhcDN8ThH2qO+p7yQfa6Vqo2nENyqq+RcRMM5BEZTyOFF9U8sl84U29bGDTQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=Hj73lNwE; arc=none smtp.client-ip=209.85.214.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="Hj73lNwE"
Received: by mail-pl1-f176.google.com with SMTP id d9443c01a7336-2cae134bdc8so21453445ad.3
        for <devicetree@vger.kernel.org>; Tue, 07 Jul 2026 00:46:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1783410398; x=1784015198; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=MgosZlEeOfsiJYUStxqPTIl9QXRN0/twuXiI0yYS1Jw=;
        b=Hj73lNwE8ReXQcjbfNGG87/kLp+mv9cou4UF7iOz5W3K9kNjtZ8ynzT8lrLvp5gAhV
         zJQRLhKWU19Ds+i44+gbKvmRjOhDriULy3023ObBbFeeIJhkB5Y7gTq0tS6YEhz6tPtD
         UbfPBiDdiOFOlXfBIA/3Vi8DkTtORrVil3Qys=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783410398; x=1784015198;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=MgosZlEeOfsiJYUStxqPTIl9QXRN0/twuXiI0yYS1Jw=;
        b=j0CzF9pu/ED/ElzwoRTPrD85CIb6NqJuSBo6/3DrrshKXqc4pKMGrC+UDIxb/bypK8
         4+RZiyJJg92/+cIDlAoj1Ija3QjqD8kUzKkPbkhiPjBCKXXgcLIyqbuIEz+2K1uy53Oi
         9EOlYZ2Ow3LpxTvLsqwDsLo91qh7cjeh7bBTFhYeK/D3Bm79iWHHh9cgnC71JbB5UVDB
         Iz2Bw0k/tRxIBGVR9WCnzozkvV9OPB+KzOuPSmV53lycXGcbLucH4wu/UffjmffTBjmO
         pBw63dKDacFeXpFOy9nzkJB8jemkKqOL+zd2UUHIdJMlegCaMgibHND+g9rJANRO8Lj7
         i/Nw==
X-Forwarded-Encrypted: i=1; AHgh+Rop/gv5YwLcEHMnCtMUATk8Pb7z3dM0Z/sSQUy0oRYMgg+Ycf5D9YOAMnCkcALShrYrYO/jztSQqRqw@vger.kernel.org
X-Gm-Message-State: AOJu0YzWpnUsbLKWzxa+j3t8Um1KV3rt5ud8WAdX2iAdjKMxMCcvRNro
	JOfssoa5H6sU9Snac4DwAaPBbt23hr+RLnYYxGH+PTEtbCIGlcShcN/AZYWfZrCmSg==
X-Gm-Gg: AfdE7ck3iT6p0565z9BEq8ml6mv/zYR9CqXLhrTbhZyVmtq8XArG778n7o0LyP3Ktkp
	y2zkcQHCk2JL+GE1BaA0pSH9sig+eSt6F0Ax86my/W5JTN+eT8Ltia3UBQIkeqa8dr7efBB03Wo
	yfbpYNg9mCmvoIy9sJTXFvZ5Ch3x/AXuqBrEYjMCkq6g+aqjGFq8ZlqVPOvymWoDC9eRiA35JhV
	cS2mrBf9laSiV8tt39bPuA8kcpImvJgXeGaWM6KzFXiBks/0ZdOMfwZPk61XjDHGoluurHlb179
	PexD60VGlx5z7y5GHbpz5PRlgrLW0zcKo8UN1TYdJODuh5RxY+rdW/tt+3LRX04wZ3rYr6jAt2C
	VIdNJS0nsJS/TBj/rrio9iT4C1RuS/J7mDc2QQTs+3UzBrk5rmX3ENQw9dnSTPpM0yrrsCrMtNQ
	hefsxqT8JdFEoe9z1kgt5n/c4tOqqRAq7c+M5u/Hoy1Yz7yeqdfPbNI/ucen42rRtG8hZWlBwRa
	gr4mdIz
X-Received: by 2002:a17:902:978d:b0:2ca:1594:451e with SMTP id d9443c01a7336-2ccbf056ecemr30615285ad.31.1783410398181;
        Tue, 07 Jul 2026 00:46:38 -0700 (PDT)
Received: from wenstp920.tpe.corp.google.com ([2a00:79e0:201d:8:7f11:6a5d:2014:d98d])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ccc9d1e914sm6975605ad.50.2026.07.07.00.46.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Jul 2026 00:46:37 -0700 (PDT)
From: Chen-Yu Tsai <wenst@chromium.org>
To: Andrew Morton <akpm@linux-foundation.org>,
	Rob Herring <robh@kernel.org>,
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
Subject: [PATCH RESEND v2] checkpatch: Don't emit warnings for ID-base USB & PCI DT compatibles
Date: Tue,  7 Jul 2026 15:46:27 +0800
Message-ID: <20260707074629.3132930-1-wenst@chromium.org>
X-Mailer: git-send-email 2.55.0.rc2.803.g1fd1e6609c-goog
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

Reviewed-by: Brian Norris <briannorris@chromium.org>
Tested-by: Brian Norris <briannorris@chromium.org>
Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>
---
Resending since no one picked it up last cycle.

Changes since v1:
- Moved check earlier and match against full compatible string to avoid
  false positives for undocumented compatibles as well
- Added comma to patterns as they are now matched against the full
  compatible string
- Fixed patterns in commit message to just cover the prefix portion

This is a simplified version of what Brian Norris previously posted [1],
but more comprehensive and more perl-y than what Yingying Tang posted
[2], which only covered the second pattern.

This is based on next-20260706.

Also, odd observation: the other regex patterns in this script escape
the comma ',', but AFAIK this is not needed.

[1] https://lore.kernel.org/all/20190223022440.146915-1-briannorris@chromium.org/
[2] https://lore.kernel.org/all/20251210073812.1380803-1-yingying.tang@oss.qualcomm.com/
---
 scripts/checkpatch.pl | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/scripts/checkpatch.pl b/scripts/checkpatch.pl
index 2b7a42bbdd94..7a846a3ea127 100755
--- a/scripts/checkpatch.pl
+++ b/scripts/checkpatch.pl
@@ -3781,6 +3781,12 @@ sub process {
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
2.55.0.rc2.803.g1fd1e6609c-goog

