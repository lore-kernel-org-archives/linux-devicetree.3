Received: from pidgin.makrotopia.org (pidgin.makrotopia.org [185.142.180.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 379BD329C6D;
	Mon, 20 Apr 2026 15:50:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.142.180.65
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776700228; cv=none; b=QQDCWrrUpoGm0NFQoDAkby+c7YFZd9yZC36Uh93hWoWaTIeJOKBGplCi1s9pFsWvCJwVBmoRGwmq3kwVcaa32Wyh7p3CPWXK3kgXmPErbcqdNFDdhwScS/kqdxSjw1UBur5a9yz81BUqXWm5Ib1siZBu9k8fiY4bMN506fSN62s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776700228; c=relaxed/simple;
	bh=E38J4KXKUXyjKrmo8l1ZcnPvVFPsI2mYxlLbLtWzxoA=;
	h=Date:From:To:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=q6PM26RFFWYH3Or1e+nByKRP8a7iSK0EbIwjmOgrBGf3sz/jsjIjvdb2+a7IDseZAWeJIOJALhnF0+AcA/kMxo+oUdm5c6SOZd5L7lo5ScYAXR1dpME+lPQDgWgHJS28+wAMjvx5JhWGEn02lXAerBPFAUIlSqnD2e8AZdZChKQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=makrotopia.org; spf=pass smtp.mailfrom=makrotopia.org; arc=none smtp.client-ip=185.142.180.65
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=makrotopia.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=makrotopia.org
Received: from local
	by pidgin.makrotopia.org with esmtpsa (TLS1.3:TLS_AES_256_GCM_SHA384:256)
	 (Exim 4.99)
	(envelope-from <daniel@makrotopia.org>)
	id 1wEqtD-000000000qI-0kQn;
	Mon, 20 Apr 2026 15:50:23 +0000
Date: Mon, 20 Apr 2026 16:50:19 +0100
From: Daniel Golle <daniel@makrotopia.org>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Saravana Kannan <saravanak@kernel.org>,
	Daniel Golle <daniel@makrotopia.org>, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 0/2] dt-bindings: automated coding style check for DTS
 examples
Message-ID: <cover.1776700167.git.daniel@makrotopia.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Reviewing DTS examples in binding YAML files for coding style is
tedious and repetitive. The rules in dts-coding-style.rst are well
defined but currently not enforced by any tooling -- dtc does not
care about whitespace, and yamllint only sees the YAML structure,
not the DTS content inside literal block scalars.

This series adds a Python script that produces a canonical form of
each DTS example and diffs it against the original. Any difference
is a style violation. The checks cover:

 - 4-space indentation per nesting level
 - property ordering (compatible, reg, ranges, standard, vendor, status)
 - child node ordering by unit address
 - blank line placement (before child nodes and status, nowhere else)
 - no trailing whitespace, no tabs in DTS lines
 - node names using only [a-z0-9-]
 - no unused labels (defined but never &-referenced)

The script uses only ruamel.yaml (already required by dtschema) and
has no other dependencies. It is wired into dt_binding_check_one
with || true, so currently informational.

Running it against the current tree finds issues in roughly 70% of
existing binding files -- mostly indentation (many older bindings
use 2-space indent) and unused labels. These can be cleaned up in
follow-up series; the immediate value is catching problems in new
submissions before reviewers have to.

A --diff flag produces unified diffs showing exactly what needs to
change, making fixes trivial. A future --fix mode could rewrite
examples in-place.

As someone who has repeatedly annoyed DT maintainers with exactly
the kind of mistakes this tool catches, I hope this makes up for
some of that. And since my Python is even much worse than my DTS
coding style, the script was written with generous help from
Claude Opus 4.6.

Daniel Golle (2):
  dt-bindings: add DTS example style checker
  dt-bindings: wire example style check into dt_binding_check

 Documentation/devicetree/bindings/Makefile |  15 +-
 scripts/dtc/dt-check-example-style         | 712 +++++++++++++++++++++
 2 files changed, 725 insertions(+), 2 deletions(-)
 create mode 100755 scripts/dtc/dt-check-example-style

-- 
2.53.0
