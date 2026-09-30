Received: from mail-wm2-f13.google.com (mail-wm2-f13.google.com [74.125.225.141])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 892E5448B88
	for <devicetree@vger.kernel.org>; Wed, 30 Sep 2026 07:25:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.141
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790753105; cv=none; b=TLhGYcXptnIYQTMTxOhaRE31cuwZBETUlzw5Mkh2YgAIimXNaVZJq+DVUlChG8y9hwSRtLBG8vKAUk0hsuUngLoKc25hoaXvTNLhygo31plVVelxRZeplgy+JUVMOzNPeXxzWoyv7ZvsDCaIVCTqWg63IJOuAmGaSdIA1P7toyM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790753105; c=relaxed/simple;
	bh=jMyD1jqGz1AaC/ou0E2FfmxGvxgefkJ6CyuNcosYIJw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ZsNZIY11LqFS74qw9Net8TVbIBSS6DB1goalZWWpqvsnyeby/mcGVTdBTIg7zyExS1d9SUxcJIhSiaBb4zfTyp/6EoO8KBLTff53xb+vdUgNNTVUHY6DUYDElWnFkFXeC47bZuqspS8jf7LbRzzT4bvOGTSA5HkAXfteTNLwh2M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=KNwr9+uf; arc=none smtp.client-ip=74.125.225.141
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="KNwr9+uf"
Received: by mail-wm2-f13.google.com with SMTP id 5b1f17b1804b1-49e79a408deso30992305e9.2
        for <devicetree@vger.kernel.org>; Wed, 30 Sep 2026 00:25:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790753102; x=1791357902; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=D46y/6BuhZzAx6HMKm4qk803Zjc4arpmPOdiKp9sksc=;
        b=KNwr9+ufQ1fFKABsEa8PAigkfvzFReVgBzWFUkyuJvqpUuC3VK14f7p/wwq9/uK6Pf
         TBaiIQXxkClqYQBMMFvYezmnm3R2qqsPSCfw2QNFq5I+x7ihbQd3KGXQc4POFFt36Yqd
         3MBStPcyTXqjBE6XUPqneBwNBVZQSD8aDPIznzpZMYsEptvEjcVQHoDLITlqjGWKC5w/
         uBvi1GvN7OsCIk0+aUBNcb/6fwgZWNbtN79gfnVslLJme5+hULEeuTacHjGhS9OCxGc3
         HNjRUwx1b5qlKcmBkLbZ2l2V32FJJdsUDlblv8SlUr1bb+AvtcBkoEboFGnAivSftSHf
         kx1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790753102; x=1791357902;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=D46y/6BuhZzAx6HMKm4qk803Zjc4arpmPOdiKp9sksc=;
        b=maGcbFKEOIDqyRlaEZ/Z5R+6/8wkudud00h6N5Hym89BmslKGBCzU6fcfRpkWxWwe+
         Cgw1By28R0YrPJfVDNpgFfL5BXjyhkkgXnr605jYa8roac9OEQaNoYeUDasORX/z2SFz
         5U1mmwKzcvYQkqC8FkUs8SRc+d2N/OpVQ56uOpezzXxdbqa/Ff0NbiYlzmAI/lXJB+cQ
         +JY1/nTmsYtxuSI5klivH0D+VIXyvNtY6s7+EgmBhoszRKsn2+8TUbDytIC+LioXOx1n
         OcpCEEjBz417TjUDTASteU8PgToxq+95/2sTQSANQje5UU5P+Na/cXmiqeml1sH4rCQd
         rBDw==
X-Forwarded-Encrypted: i=1; AKwUvBy0esEsCT2kJ/Lva4g5hUDdg3uXeayL1PCjDheWWKNTnefAXi34tUK4dtQHQ026KdqlV7xJ4508Hn+R@vger.kernel.org
X-Gm-Message-State: AFuF++mJcaim8z1+rF6F7cSPT6DlQoYm3BaD+CZeC4xFDhHsAxy3MXPW
	ueIrWX+F0C1m8wHA023BSaXQjWWB9xnf9q+W64VNpgDukkRrm/1C/65t
X-Gm-Gg: AYBFou2aHxEz9H83tVorZOCPndSrQnloaUr0WimPu+goNhVAnvicZphvJgEUERMs/NS
	TQrNf+bPczJHL5a5mbO/RwD4p8O68A+cRW+wBnNhu5wgU2naIywszytXkZDbzy7LJNKrhDbHBFP
	HkJiF3IIftFKtHloAjJv1dp3Ao1v/JXFQFYh40FAT/Z04uu/xZ6NwIEfj1omesjSA4lwTTXHhmA
	fzSe9vPX3XWXzt5lcVY/q2YOlBXnOBznYIAq4qA8p9a12K6QCK5dBBajRZ/z+OTG93x1DQ4W9dC
	nz2hhl7zlGKkNkAxPdTyqAwYDNqBmkPR7z7HP3jvXP78CZi1hh5kpvL1rlSAAN3K2AklJiDAIV8
	QG1bGYDDoqN1mbvrnhKuR+zHsiGtnSM/Tr6bX5CaQfRFhCJrS8SSSpb7bfjXXTDC/5yZHvbxLDA
	SvX0yB4nUaqXjxY3gOM7vPRogcF7j/qF7OOmiqb0kKkf7T1JWwkCn7ImcOFeq1p2kZvLwcjbzIk
	AV/rJvjopK5oR3W0OTkRV+ineNW1A==
X-Received: by 2002:a05:600c:4691:b0:49c:fa21:e749 with SMTP id 5b1f17b1804b1-4a01b126e5dmr5753075e9.31.1790753101752;
        Wed, 30 Sep 2026 00:25:01 -0700 (PDT)
Received: from xeon ([188.163.112.76])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48b029fc420sm1267411f8f.28.2026.09.30.00.25.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 30 Sep 2026 00:25:01 -0700 (PDT)
From: Svyatoslav Ryhel <clamor95@gmail.com>
To: Sebastian Reichel <sre@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: linux-pm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v1 1/1] dt-bindings: power: supply: maxim,max8903: Document MAX8922L and RT9524
Date: Wed, 30 Sep 2026 10:24:50 +0300
Message-ID: <20260930072450.61836-2-clamor95@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260930072450.61836-1-clamor95@gmail.com>
References: <20260930072450.61836-1-clamor95@gmail.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Document MAX8922L and RT9524, which use a similar charging control pattern
to the MAX8903. The MAX8903 is set as a fallback for both chips. No driver
changes are required.

Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
---
 .../bindings/power/supply/maxim,max8903.yaml           | 10 +++++++++-
 1 file changed, 9 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/power/supply/maxim,max8903.yaml b/Documentation/devicetree/bindings/power/supply/maxim,max8903.yaml
index b3d8c0a5f2142..11287d07ae898 100644
--- a/Documentation/devicetree/bindings/power/supply/maxim,max8903.yaml
+++ b/Documentation/devicetree/bindings/power/supply/maxim,max8903.yaml
@@ -14,7 +14,15 @@ allOf:
 
 properties:
   compatible:
-    const: maxim,max8903
+    oneOf:
+      - enum:
+          - maxim,max8903
+
+      - items:
+          - enum:
+              - maxim,max8922l
+              - richtek,rt9524
+          - const: maxim,max8903
 
   dok-gpios:
     maxItems: 1
-- 
2.53.0

