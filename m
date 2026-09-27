Received: from mail-pj2-f42.google.com (mail-pj2-f42.google.com [74.125.227.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 62D3E3859EC
	for <devicetree@vger.kernel.org>; Sun, 27 Sep 2026 21:35:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790544944; cv=none; b=NAdiF8hr7sYQdt2ztCXbHe7UvLHg6V/u7/WFc722CsojTez/TnIJF5aT0ks5JqUDpCqIkzF6u7w05RJCsjfKBlUDEDzzKmm9lUfuon+KmoV3cY1YjLVEOUjEWmS1HTVq6wh4hAp/LAOfaMrdPnt/UZ4OOnxFFSwyARVlzVyefsU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790544944; c=relaxed/simple;
	bh=kNXLRQ4KxcKgSSIc8oLHK8bxZeaP2Chi8O1a8a0k6TQ=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=oYIJOpD6Ho9vBZkyorfur00ezswgeioPAa8OrBwxVXbKtmLZu8fJy8m656oAmMU/XHJkHEmIzCZsclcshqwZHdnTZLP2FbsFmq6YjtF1AYMII4dd253jiPVcggLRFR9B5nUri4P3EhWXRRJiWRUHykHqmhDnFe3vGWP/ECzL4nE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=NLtCanNo; arc=none smtp.client-ip=74.125.227.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="NLtCanNo"
Received: by mail-pj2-f42.google.com with SMTP id 98e67ed59e1d1-398cb5615deso2016810a91.3
        for <devicetree@vger.kernel.org>; Sun, 27 Sep 2026 14:35:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790544943; x=1791149743; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=AHG5gy18gjuCwzJfjLviwlZCw2IziSSdFW1ln1v/Sk8=;
        b=NLtCanNoEZ/7pC4V8rJqiVnzlNupa3pm8mgsm/JEFeXP8PdeznKl8XuDqz/0Pt+Okc
         88n8HJla2og3QzlKlHc/hOok497KWsm7OA5qGPaDODlb3qF1cuhBpG9YvY0ZLHtpzFdR
         VlPVolPxjL7I8W2/vFUV1d+JrdIx8FB4b6BdDDLAiQuB0Pw80/ttUWZ9S1qNPUXcbr81
         +3/NQxbCK5d3DlA3x3KpejQ0CAqobVq7jAOvkdTVcr9OBdA5HVMAAGhEZ+POaVbUZg0B
         upy+tqsUpYANYIgEXjSmPGQ293CSRRxA7jMXwbYq6drvMGM+Y0mgV1kZ+KsDvzmxy+a/
         eiOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790544943; x=1791149743;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=AHG5gy18gjuCwzJfjLviwlZCw2IziSSdFW1ln1v/Sk8=;
        b=vAXxLodV9y+aW2L5Z518VsAAM04dqEb7zPBLIIYFDqM4Io9mnd+1GLR24/JkrqTzrQ
         tYLC2BhyDlkcuhcySJkVYH9Za3E3v10vFmrroQgRlAtF2eA4An3dUgWH153V/6iI9Ddi
         xuZe3Gg4KuShyFKulWxm+aVzFUTnO5D6kDNjZxBaJdtXOd0Ka9AJezgNwuCKQyI2aT84
         70Y6VfX5/8Zgni41RkMSmmVT+C31JEacz74bRbtGUR0gyMGnwwqfJW6Lz/iy+u5I50C6
         7hWn6qBJ/Od/HMkRUM7FO8BKLbPzB07G3YRHQMzWL/WprWYIB2yqeHkxJyFzZ+BpJ/5t
         sobA==
X-Forwarded-Encrypted: i=1; AKwUvBz671YN2P5fMc1fo2HfzWLTDFsE7JFjLA/9BrzXDPLJrryneEBg/1Xfq5Qm7caYUt/sgtxy5AlZwomC@vger.kernel.org
X-Gm-Message-State: AFq9FYLc8SSn6OQlGVvoeQz7JXhSblWjlZgMkN9aypYjhprm2OIRSdUx
	elwnALU5J4ecWX6gthyOgSbkVCURFIvDkbFBsg+pvF3LPt4FUNSO7zcp
X-Gm-Gg: AYBFou0eVs4cMS+uzLCzsnIAD1OA1epPQ3QyOlt00aB0lSyDiUd3NafuW4nWDiNuV9X
	87asZHyIL+RGyNqZUfQfsR7ITnQrsOrYH6lhtcJJ6KO2IAZuRFa32J8nhvaXePiTfJk0uAa7Wce
	Foly8mcRtHHv5/7DyjQ0hm5Rg1tHtP6qjxT0ocLcp8FVAsfICinS/PSPFyRhgFg2DqJgnyAk62D
	6xNCy7maHbs8wlOXD5EEBNrd5wNl0/wks5DCWIGlS+BDZlorf40ITQLWraw8sHP/c6+wEkbHeZy
	vwRIQdHqME6KnoWpTsjaFSLvL7Dpuus5CeJtObC8qLbPDs8nHWnP2Uc0B3y/n5zNhQyKBi7hUbS
	YZOUHwhozhDYnAd54vToOJWHjwDsdLY7O50XVBC7IwKMI2XAd8VzYZuDlOjm9n/T5j18hZQQo2Y
	6O6mTmdjMNcQ/ePRumeXTcpd/F+AjzeTOjbvjXxpvyvEM+UCydACXG911umlTWukCsCjyTkcq1h
	lDxTfi/plPhsxQxHqEa6n9wRGggVLki9ef2WeYqQKeyR+jicORO00piljgycvf8JPAex57zaimu
	qj0JOhpC/H1dPoBDH+D9s2MnRxttDxX0/xPeZ7ul/dzBbO4A
X-Received: by 2002:a17:90a:ec83:b0:39e:21a7:5dff with SMTP id 98e67ed59e1d1-3a098d453aamr8865147a91.11.1790544942679;
        Sun, 27 Sep 2026 14:35:42 -0700 (PDT)
Received: from ryzen.lan ([2601:644:8000:7a86::e35])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3a0976cacbesm22806038a91.13.2026.09.27.14.35.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 27 Sep 2026 14:35:42 -0700 (PDT)
From: Rosen Penev <rosenp@gmail.com>
To: linuxppc-dev@lists.ozlabs.org
Cc: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Madhavan Srinivasan <maddy@linux.ibm.com>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Nicholas Piggin <npiggin@gmail.com>,
	"Christophe Leroy (CS GROUP)" <chleroy@kernel.org>,
	"Ritesh Harjani (IBM)" <ritesh.list@gmail.com>,
	Shrikanth Hegde <sshegde@linux.ibm.com>,
	devicetree@vger.kernel.org (open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS),
	linux-kernel@vger.kernel.org (open list)
Subject: [PATCH] powerpc: dts: eiger: add placeholder reg to ndfc node
Date: Sun, 27 Sep 2026 14:35:40 -0700
Message-ID: <20260927213540.132854-1-rosenp@gmail.com>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The ndfc node of eiger.dts has no reg property, U-Boot fills it in at
runtime.  The new IBM NDFC binding makes it required, so dtbs_check
now reports

  ndfc@1,0 (ibm,ndfc): 'reg' is a required property

Add a zeroed placeholder, as the nor_flash@0,0 node in the same file
already does.

Assisted-by: LLM
Signed-off-by: Rosen Penev <rosenp@gmail.com>
---
 arch/powerpc/boot/dts/eiger.dts | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/powerpc/boot/dts/eiger.dts b/arch/powerpc/boot/dts/eiger.dts
index dc4d74c523ec..7260cdde281a 100644
--- a/arch/powerpc/boot/dts/eiger.dts
+++ b/arch/powerpc/boot/dts/eiger.dts
@@ -196,7 +196,7 @@ partition@3fa0000 {
 
 				ndfc@1,0 {
 					compatible = "ibm,ndfc";
-					/* reg property is supplied by U-boot */
+					reg = <0x00000000 0x00000000 0x00000000>; /* Filled in by U-Boot */
 					ccr = <0x00003000>;
 					bank-settings = <0x80002222>;
 					#address-cells = <1>;
-- 
2.55.0

