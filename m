Received: from outbound0.mail.transip.nl (outbound0.mail.transip.nl [149.210.149.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AC55D421A09;
	Wed,  3 Jun 2026 08:17:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=149.210.149.69
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780474679; cv=none; b=FhmImLbKOW+9AziS+7WLTJPNASed/YYDPDNrwxFYkcTofmet/1OKq1s0Nf7WfEzCKJPS7EMlQ0RZMcR6vDrgxdKcZhYLoo3l1gQ/x7lFBR/hF6Ba37sg+c1+Ay77b5zJTJofJhMWKyR2lOVjb18aXXYhZ1frhyJ9BkjuvYFbRmE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780474679; c=relaxed/simple;
	bh=oBKV6LyjynghyhkhfEqiKMnROJH+Ew21FK35o5B1ne0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=pL0ImyzJGIV0uemOh/v4RQkOG3AYFB1ufEgbTHmDQ8dkOM7ts7l3Zixj3aGFaLjxWlXLcAjPDZY/oKvx2UGDpOyCJjvV17mLSxxgrqQNrs1Cer0Vbvnnx5yvPaz/yanB7NCscpuDiG56bn+++cxsAbznI9NHRL3FYezyEB6T8QM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=herrie.org; spf=pass smtp.mailfrom=herrie.org; dkim=pass (2048-bit key) header.d=herrie.org header.i=@herrie.org header.b=iHI9q+fQ; arc=none smtp.client-ip=149.210.149.69
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=herrie.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=herrie.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=herrie.org header.i=@herrie.org header.b="iHI9q+fQ"
Received: from submission7.mail.transip.nl (unknown [10.103.8.158])
	by outbound0.mail.transip.nl (Postfix) with ESMTP id 4gVgYR0g7tzxPYv;
	Wed,  3 Jun 2026 10:17:47 +0200 (CEST)
Received: from herrie-desktop.. (180-93-184-31.ftth.glasoperator.nl [31.184.93.180])
	by submission7.mail.transip.nl (Postfix) with ESMTPA id 4gVgYQ3Hqbz3fqYsP;
	Wed,  3 Jun 2026 10:17:46 +0200 (CEST)
From: Herman van Hazendonk <github.com@herrie.org>
To: lee@kernel.org,
	robh@kernel.org
Cc: krzk+dt@kernel.org,
	conor+dt@kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Herman van Hazendonk <github.com@herrie.org>
Subject: Re: [PATCH 1/1] dt-bindings: mfd: add ti,lm8502 combo LED + haptic controller
Date: Wed,  3 Jun 2026 10:17:45 +0200
Message-ID: <20260603081746.932652-1-github.com@herrie.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260603080256.853037-2-github.com@herrie.org>
References: <20260603080256.853037-2-github.com@herrie.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: ClueGetter at submission7.mail.transip.nl
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 s=transip-a; d=herrie.org; t=1780474666; h=from:subject:to:cc:
 references:in-reply-to:date:mime-version:content-type;
 bh=oBKV6LyjynghyhkhfEqiKMnROJH+Ew21FK35o5B1ne0=;
 b=iHI9q+fQrFIjggI7y7Ru+ZqZGGBffQjcOOHfLaQ/DrLxBMXUFsdkuy8M8xrT0vkLpOA+Qd
 5tj4VkeliAQ3BDOLFbY52DUGqEHo0te7oTLfj9//hobwrmHZCt3Qa2Rh+U6WvuHdGxobMw
 LdHQPMXEYUNp6vhAdQpn7xyE/Cuk3O1BVmmYyQ7EjH5mPHYVr971EkIk/4UyRXhdODArFF
 zeD7WMMKnDlF0S2QQKw/tV1L46K7Rcf7EL1leEoScLf7jJaLqEuGDgLmvMB8x7Ig+m6bp4
 iWvPieEsmB3nivzVc/2haL/QTbPJUdbQWEVEPNDRk/IbMCe2hq8IUT/BD9eEHw==
X-Report-Abuse-To: abuse@transip.nl

Thank you for the review feedback.

Acknowledged — the ti,lm8502-leds / ti,lm8502-haptic compatible strings
are a Linux MFD driver artifact rather than a hardware description. The
description text also mentions the OS split, which should be removed.

Before preparing v2 I wanted to ask how you would prefer this structured:

Option A — LP55xx style (no sub-node compatibles):
Individual led@N nodes (reg 0..9 = D1..D10) go directly on the parent,
following leds-lp55xx.yaml. The haptic function is a plain haptic sub-node
(config container for ti,invert-direction) with no compatible. The parent
driver instantiates children via mfd_cells[] keyed on platform device name;
DT parsing is done in the parent driver. This requires companion changes to
the MFD core and child drivers.

Option B — Single flat node:
Fold everything into the parent node. LED channels and haptic described via
properties directly on the I2C device node, no sub-nodes at all. Simpler
binding, but per-LED led-max-microamp config becomes a list property rather
than per-node, which is less readable for a 10-channel device.

My inclination is Option A as it matches the LP55xx precedent, but happy to
follow your preference or any third approach you have in mind.

Signed-off-by: Herman van Hazendonk <github.com@herrie.org>
