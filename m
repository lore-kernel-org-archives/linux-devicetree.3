Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com [209.85.214.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CD86C4218A4
	for <devicetree@vger.kernel.org>; Wed, 25 Mar 2026 18:08:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774462106; cv=none; b=JDu0FNlVMDBWA8fZi+nQEfJXWKWLnm6+6mOf96LXASZMe+SDXR2wpfpzeaGKMTMLVj/3PXMIm1eZPuuwBAOqwZqc/VwJ/ajIuj0jVYJW1KZ4IpY52Ys5DlKw+MlgxJ5dXjCm7POt5iPx1kmtYJPTFrY5QHM1Vc7TdHrb/C+l4xQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774462106; c=relaxed/simple;
	bh=O5VLqveoT1MLTeYBJSBjiMtqJBUVJFLJ/CLj6h7ZMKI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=FPL8H7cNvPwd2fQ9YtDZE4YTzs/rFeU8CDhOfhw0cov7AsJgEvGa8KcwJ1ez57yYlaB6obPafvTk6TglvgilLwGdgIcbcCe6Rz1VSNLymQ+qhnYcm4Wx9Gvt3FbNZIW6y5qa83VPzfJKifAmpV/k7LqPVzisMP6L7Udse1i3gQM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=BowbVxWU; arc=none smtp.client-ip=209.85.214.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="BowbVxWU"
Received: by mail-pl1-f175.google.com with SMTP id d9443c01a7336-2b04fc8851cso1090045ad.0
        for <devicetree@vger.kernel.org>; Wed, 25 Mar 2026 11:08:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774462100; x=1775066900; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=+rvofdNd3f5+/efY7L/G9vZlRMw7vdhOoBtyFgJOyhQ=;
        b=BowbVxWUsTxPoaN+CY/4SCHwbmKekGCN9oRDlaklsw8SuxO9WJB1c0981LdLlONhPe
         SwaoMB5eTZvLEuRoCMtIwBNJhETQJql2EVD1lAZjnNL/LM9wuIzxfYs2SwBJFhFyYde5
         AF0wkLrb8mZtVsrmgL4EAuEnKBVOuqc+muqxzsjEOQZ2AuCwNnr6W48hiC+JU6CSRMls
         S2uHNUGm7Kr1xi31mTt8mSxNbHxKs3Tj3Ud80pGE/1NC59RITZ+ycot0AHe/7r47fYAP
         LPz6S/9CGGb2ggzK4R5jo6YLTgj7CBrSAZeodDBD4thBFnuAWlTglg755o0YjNqYW+8q
         gsKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774462100; x=1775066900;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=+rvofdNd3f5+/efY7L/G9vZlRMw7vdhOoBtyFgJOyhQ=;
        b=jNGjZmtOxiDAqEMRoTtbv7hOZP4thfCNeqWx03IGKf5++16t0LhIp8ERf2j85Ai9El
         +wmWJ6Jac9lwz+R0le+7Z0fYSLEiR5/cxnPmhpYCENco1bbuJ5ew0uSD3n49cc+Inttv
         8mM89QaZUoZsQ1HXT4Fhf0S8B1jY4UrILw4ZAgR9+uITxwhCNEDrTAQ/AWz1gXMnyuHE
         6JhJESvrSAXMUdaZEdj7+B6HxxA+a9oV6IVZhk8rZo9HWoJgijXDG/I42aoXIhvYGPtM
         mr+h2o4cY3MpQByc+VVa+etITKWdLm8BgfbqFC95Nz+Tl4/nr/sotEi6fN7/K8cMygZe
         OIog==
X-Forwarded-Encrypted: i=1; AJvYcCU+kxT8FVJw6aJG+Jql2AXGEDpqN1jco3d8V+3Ns1ECnl7/LBwiv5CiNDaedG+K/XxojtSBp+YiHeoo@vger.kernel.org
X-Gm-Message-State: AOJu0YzZb5Ujgrzx/pUXvjNrl6WOXW8Su0TEaxPyGRlRdkhD/V6NvPYJ
	GR82h7WBUoIF7M3PQXjeQSJr2D5Z/I9yc3T4C8bskMOL216T8e0+RmVm
X-Gm-Gg: ATEYQzy83VN1FbCMkhJfOuOIJfKVG8u8cW1l1hB8yuPkmYeJcUVMZWcP5/t77rSVxaZ
	fZ41+z+Bc/x8yv3A3it5Jtnjq/XlCPTZ5kqRGgRR8dMnvydptrY472j1bjbJZ88XAe4KsL4WTSi
	TsYxEoRKkZvWQ2eKDr+Vnio3ZGtyePGsqXP6eN1rMJZXUi6HLzBvp4qDlxdtkYWE6fTj6CHJvJj
	xMk6dJWbNc6Tw8dbNTMhcngvdDEwmIPZSwxucvZw2v+ZXmMlBt+ZFtwN0J3m3ub1h1IhqEBeoC1
	tvdqGdCJJkcHrk7/LLoDOBkNukwhQWG/NBgA1q2U8jmb/5gd6vPS59yMy8Q8bPe9DydCRDNOwZ9
	l3g5vZ0y+GyK5Vd/cSJbinp3/kpykRjSP7lO+gYudb2gJmSb2UbPaCKO/N76gPJ6NW3gaR2rOeJ
	SS+pkNKegOyeKr0vyPfmM7gKv6qyyk
X-Received: by 2002:a17:903:3843:b0:2b0:9a61:916 with SMTP id d9443c01a7336-2b0b0a7f831mr49090795ad.31.1774462099766;
        Wed, 25 Mar 2026 11:08:19 -0700 (PDT)
Received: from [192.168.0.102] ([43.251.91.187])
        by smtp.googlemail.com with ESMTPSA id d9443c01a7336-2b0bc773b33sm5687805ad.10.2026.03.25.11.08.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Mar 2026 11:08:19 -0700 (PDT)
From: Biswapriyo Nath <nathbappai@gmail.com>
Date: Wed, 25 Mar 2026 18:07:30 +0000
Subject: [PATCH 7/7] dt-bindings: clock: qcom, dispcc-sm6125: Add
 #reset-cells property
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260325-ginkgo-add-usb-ir-vib-v1-7-446c6e865ad6@gmail.com>
References: <20260325-ginkgo-add-usb-ir-vib-v1-0-446c6e865ad6@gmail.com>
In-Reply-To: <20260325-ginkgo-add-usb-ir-vib-v1-0-446c6e865ad6@gmail.com>
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Lee Jones <lee@kernel.org>, 
 Pavel Machek <pavel@kernel.org>, Sean Young <sean@mess.org>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Martin Botka <martin.botka@somainline.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-leds@vger.kernel.org, 
 linux-clk@vger.kernel.org, ~postmarketos/upstreaming@lists.sr.ht, 
 phone-devel@vger.kernel.org, Biswapriyo Nath <nathbappai@gmail.com>, 
 kernel test robot <lkp@intel.com>
X-Mailer: b4 0.15.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1774462047; l=913;
 i=nathbappai@gmail.com; s=20260118; h=from:subject:message-id;
 bh=O5VLqveoT1MLTeYBJSBjiMtqJBUVJFLJ/CLj6h7ZMKI=;
 b=rUnZtLLz4Xmj0RcCQQLRkTmldWk3RQ1b5aFfulPjR4kYbTcb4NhNVfi/aoK7g8WkEfY0jg3ZZ
 1uXUOvuzSagDL/2aA9WfaTAyKY05yLQdKb4KrPcmZQxOrgym2fPHKNZ
X-Developer-Key: i=nathbappai@gmail.com; a=ed25519;
 pk=slmb/9yXbet+KTiT3EYLCp0p0MEOYa3EdjUXP+HXfjg=

The '#reset-cells' property is permitted for the SM6125 SoC clock
controllers, but not listed as a valid property.

Reported-by: kernel test robot <lkp@intel.com>
Closes: https://lore.kernel.org/oe-kbuild-all/202603150629.GYoouFwZ-lkp@intel.com/
Signed-off-by: Biswapriyo Nath <nathbappai@gmail.com>
---
 Documentation/devicetree/bindings/clock/qcom,dispcc-sm6125.yaml | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/Documentation/devicetree/bindings/clock/qcom,dispcc-sm6125.yaml b/Documentation/devicetree/bindings/clock/qcom,dispcc-sm6125.yaml
index ef2b1e20443..0d467c1f30e 100644
--- a/Documentation/devicetree/bindings/clock/qcom,dispcc-sm6125.yaml
+++ b/Documentation/devicetree/bindings/clock/qcom,dispcc-sm6125.yaml
@@ -45,6 +45,9 @@ properties:
   '#clock-cells':
     const: 1
 
+  '#reset-cells':
+    const: 1
+
   '#power-domain-cells':
     const: 1
 

-- 
2.53.0

