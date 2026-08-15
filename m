Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ABEB43446CE;
	Sat, 15 Aug 2026 01:58:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786759088; cv=none; b=u+s7NXP07hxX2kiQbb4tBdT+IyV9/olvVwFgdOxRWmj8l5TmjW7iBnS6OO0vjkY9pOvPwnmaITOwPlcSDGHCqFYKtYlO0Haxf/fOMFiHOek0PbB1Y64Oo/NhjhvhVCAshjXDVCzhTtMwa2qfE3W5X0j2nWXVz390onmS7eucKbA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786759088; c=relaxed/simple;
	bh=rRgRZg6PDtbIVyoKXwDkLYZ5RcerG7kCb9DUPmpwF20=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=fHyB9HREr74mwvPDi2bkwI/IBTpk6wu2Btnl3lODzbHc7h8glwK/QPbrkYRuei32xUZR6j6iujkIj0iBC0jduUibzf29i9InCr3xDZdz7cLJdLPkFsbVYU1Pey4e4ZyJltBuJl1DbztE2GDsLJeu5kBVD25CB4hQjww7jCE1ylk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=cSBHaE7e; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="cSBHaE7e"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4B6481F000E9;
	Sat, 15 Aug 2026 01:58:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786759085;
	bh=dgce77xdNfitZfY0amw8Yvco94fWO4s0NDx9JQV8Lxg=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=cSBHaE7eO5Vpz80IyRGuFkOmzCm3THDxQ9yyAEbzahHkpJh5wAEwedG2tlKXuZw15
	 bZPZTRG+Md+7sGN7zXW7sNRURkpjc6OnevHM2jZTicDuv/ereL5fBmQ3LJfUNCE8Af
	 rqiawTRg07V2uGyJnei3SqJR81yd8h5gPREeiaRFCyxpPsKy7drB+MC+bLtDyLt70t
	 aH3aQuA0TVnfp7IdEDDkbtndMqDeavhH4gY1gafp8xC3EZKFqxziCTJOFGhsDnghgg
	 pjMVAvAjYPWRgHXsDV8GXg9+9b7DLd4qYDAdi9fjrFTPLNtD4SB7+3q5g/mZ5iK9v/
	 9oTrWcTn78k2g==
From: Guo Ren <guoren@kernel.org>
To: robh@kernel.org
Cc: devicetree@vger.kernel.org,
	guoren@kernel.org,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	robh+dt@kernel.org,
	conor.dooley@microchip.com,
	krzk@kernel.org
Subject: [PATCH 2/2] dt-bindings: riscv: Add Xuantie C906/C908/C910/C920 compatibles
Date: Sat, 15 Aug 2026 01:57:22 +0000
Message-ID: <20260815015722.1736831-3-guoren@kernel.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260815015722.1736831-1-guoren@kernel.org>
References: <20260815015722.1736831-1-guoren@kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: "GUO Ren (XuanTie)" <guoren@kernel.org>

The RISC-V CPU bindings currently use the historical thead vendor
prefix for the XuanTie C906, C908, C910 and C920 processors.

Add equivalent compatibles using the newly defined xuantie vendor
prefix. Keep the existing thead compatibles to preserve compatibility
with existing device trees.

Cc: Conor Dooley <conor.dooley@microchip.com>
Cc: Rob Herring <robh+dt@kernel.org>
Cc: devicetree <devicetree@vger.kernel.org>
Signed-off-by: GUO Ren (XuanTie) <guoren@kernel.org>
---
 Documentation/devicetree/bindings/riscv/cpus.yaml | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/Documentation/devicetree/bindings/riscv/cpus.yaml b/Documentation/devicetree/bindings/riscv/cpus.yaml
index 5feeb2203050..5aba1e8ed195 100644
--- a/Documentation/devicetree/bindings/riscv/cpus.yaml
+++ b/Documentation/devicetree/bindings/riscv/cpus.yaml
@@ -67,6 +67,10 @@ properties:
               - thead,c908
               - thead,c910
               - thead,c920
+              - xuantie,c906
+              - xuantie,c908
+              - xuantie,c910
+              - xuantie,c920
           - const: riscv
       - items:
           - enum:
-- 
2.43.0

