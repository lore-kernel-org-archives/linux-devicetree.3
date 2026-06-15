Received: from mail-pg1-f180.google.com (mail-pg1-f180.google.com [209.85.215.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 03318258CCC
	for <devicetree@vger.kernel.org>; Mon, 15 Jun 2026 02:44:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781491468; cv=none; b=o/5ROVsc0a0GynWmrQILshZKeVHiTLHU9+hilXXaqewolf1c3lwnLr/qJSGymL0YWsd5SsM0dH0KcMPHT6swC80JSRUybc9P1h47Pr32Ohlz0fEQCtDM2aFMSDfS2JeQN4bOoirOZvkB97VcXnAsqo52NUkJi2kvafIVCA8IYes=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781491468; c=relaxed/simple;
	bh=J3z5h5jN99f1BFk7jnvt5xoq1tLRgjc3X0kRzaksvsA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=RAHplrHppL186MYZceyVB0bBSVdz5+WAEFPIFkQ70hqb41BL3u9bvDrylsZI8tZNCt4SVDDS/cKf9LDNlo4QhudvOtfpa8x1v7480eYB6aGQAHqENF7vfw6V0ye8NTFqUk0XCvvI+I4Xzl/9gAVRmzOmzMS+ADvAYo0FEIYpzOA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=R4zt167K; arc=none smtp.client-ip=209.85.215.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="R4zt167K"
Received: by mail-pg1-f180.google.com with SMTP id 41be03b00d2f7-c85a2ca7bf7so1009989a12.3
        for <devicetree@vger.kernel.org>; Sun, 14 Jun 2026 19:44:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781491466; x=1782096266; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ctvKOED8Rs2Y8iHtAz2kdUCrMqrD3cqKZ8ykp6Je8z4=;
        b=R4zt167Ke8fjbVtksuqGJ0wP6INdm76MaogcDetu/DxpGa71VHJUXkSyBnJ21TRS55
         RBsNZSwg5ec1YdVJLxrOM9WX/0epiHCPChOlE5zPArtjUITTzY2QfG75Xd6Wo5tw34jS
         dJ0n9jcpYTgCgYLWHN2O5pPyC+71T3XrDnF7jMlOBHS1xfqM9hVHfh+bCc4Uhn7OvAKZ
         qG6/x6jDk71EuqGl6IlMyOjWrNccETIHLK2Smca/XKLMDpcjmpmojBDO+dBV9WP6kd5b
         V1/nfs50AtBLQ+q3RfF6+8eAU5SYzDD6z0aKWCeCexDiUx+MlgpZUGwlimjvjcV5IAu/
         jJ3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781491466; x=1782096266;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=ctvKOED8Rs2Y8iHtAz2kdUCrMqrD3cqKZ8ykp6Je8z4=;
        b=CRD9+qmaRC9xohMJjjnjMd/4OFVNN1zqSkOzoCFgga62qgLJJn9ZPGQ+A78UWiO9O0
         W0wbIifHhZsyspj/qEapjan0qWaNiJgvAbB/pzKB1ss00cEioxVEHka2kMjJPJZjEG+A
         9ldlPopJXuszS9VBcDV8VLlyabqZZknwKMVhgXMIVysjtabCcUjRYt36Hpy/cfq3Fmro
         3jYEwhLm7rN2ixyc2sUs4Q0kIHWrNgJGdDm5WGnFc5KQY76f6hz83GLDurvcqwKNSd9p
         JhuQMskfO/BtC7nu/zmy+q4uR9Ad+SdpDuDwiSWjvyYNY7ARlS/0lcu6utQHCtKz9+GK
         hbMw==
X-Gm-Message-State: AOJu0YzNJ+GQiR3L9iZ8DaTkw1101C7zYh5M2U5RStU8w+DnMHF5ahIq
	4Tq6Pod3fAEtTSYepihAkd63e2ksmQsBk29PkNAeSNoriJDa2pzm9KaJ
X-Gm-Gg: Acq92OGzt07pDBCazlEb2Y9u00a77J+8MvifisXjmpISoQJwQ+oWjzHZunsiWx4POJd
	KqfcaGcNjEMxgNSohQSAqx1KG8Kqnxu0q9+alT9+Z7OrlEvwG5DZGJppfrW+7F2Qr3wEOxlvgEC
	CxqM6YR6Pe2SIcYz4G4MzOPDqr7lA6CogmJl/WAL8MSi9+DRoQmYKiwbhPBuRLPFS9BMBKX1WXA
	o1RKyfBLs/6+8hlvk9nOz/YHq1qeJUUqwIpsXKI+GrPlKAwi4RlcO/naUxtdMX/6CB7+UFzQnhO
	Qm++SMr0kEh5qKQndPpQmzlZuRnN+qoiaEDOoVcHwZnSu8frNtOqodfIRNmntou2O0QNZ9ue8JT
	MGsdzINmj7DJuZ7Tb7IODWwQr5hwE/HxRSmbmvq4MGvFFJHqvgnm2ciNPSgKF0QZjRJuPu1oMoK
	5LacEHL413rtbkJ4GZG3kqor/W1GbdGFASbUnBJhCY4mzPuboItBjrY7E28QRaJLA=
X-Received: by 2002:a05:6a20:7f95:b0:3b4:8880:2089 with SMTP id adf61e73a8af0-3b783bb0448mr14504694637.16.1781491466271;
        Sun, 14 Jun 2026 19:44:26 -0700 (PDT)
Received: from [127.0.1.1] (61-220-246-151.hinet-ip.hinet.net. [61.220.246.151])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c866325d1d3sm7138676a12.11.2026.06.14.19.44.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 14 Jun 2026 19:44:25 -0700 (PDT)
From: Kyle Hsieh <kylehsieh1995@gmail.com>
Date: Mon, 15 Jun 2026 10:46:02 +0800
Subject: [PATCH v8 1/2] dt-bindings: arm: aspeed: add Meta ventura2 board
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260615-ventura2_initial_dts-v8-1-c89f92c80447@gmail.com>
References: <20260615-ventura2_initial_dts-v8-0-c89f92c80447@gmail.com>
In-Reply-To: <20260615-ventura2_initial_dts-v8-0-c89f92c80447@gmail.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Joel Stanley <joel@jms.id.au>, 
 Andrew Jeffery <andrew@codeconstruct.com.au>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-aspeed@lists.ozlabs.org, linux-kernel@vger.kernel.org, 
 Kyle Hsieh <kylehsieh1995@gmail.com>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=909;
 i=kylehsieh1995@gmail.com; h=from:subject:message-id;
 bh=J3z5h5jN99f1BFk7jnvt5xoq1tLRgjc3X0kRzaksvsA=;
 b=owEBbQGS/pANAwAKAaWDQrcJVsSBAcsmYgBqL2ds9BW16ZZQoO1e5JC8M56v9xEAV+IzijHmA
 lB0RGhp+EKJATMEAAEKAB0WIQTJHsaNZOdY+THGqJelg0K3CVbEgQUCai9nbAAKCRClg0K3CVbE
 gXWgCADCprZUJ0z700syJ6zD139+Wivkz9tcUw6CjgrjNq/OnB+mBhvi3Cq6ed/gVHouqFJptUm
 Fd/0phsYrDe5eT8PXBsktLI0Yrueo2W5QvOgi8PDJUnobF+3XSLjb7ob0hVqqhpuBUz5ltN8/oo
 YMLheoIJVMkiOIddANX65rvHiLupttXtwCUKgVEOVIxe5nvs/c+WwudZqdahS4U84GXM2y8RLRf
 kmMb7l+CyL7Jykgj0F/Bmn1MT/yt5EoiuWr3IVXmC24x+YAVRTLR8u2wybRDB62a03VNKv2ZoJt
 xe8D9O4Fl1GiXWnItAKO9oRU9JLnIgtrb/+MWRTzOcq1ffgP
X-Developer-Key: i=kylehsieh1995@gmail.com; a=openpgp;
 fpr=C91EC68D64E758F931C6A897A58342B70956C481

Document the new compatibles used on Facebook ventura2.

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Signed-off-by: Kyle Hsieh <kylehsieh1995@gmail.com>
---
 Documentation/devicetree/bindings/arm/aspeed/aspeed.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/arm/aspeed/aspeed.yaml b/Documentation/devicetree/bindings/arm/aspeed/aspeed.yaml
index 9298c1a75dd1..d48607c86e8e 100644
--- a/Documentation/devicetree/bindings/arm/aspeed/aspeed.yaml
+++ b/Documentation/devicetree/bindings/arm/aspeed/aspeed.yaml
@@ -92,6 +92,7 @@ properties:
               - facebook,harma-bmc
               - facebook,minerva-cmc
               - facebook,santabarbara-bmc
+              - facebook,ventura2-rmc
               - facebook,yosemite4-bmc
               - facebook,yosemite5-bmc
               - ibm,balcones-bmc

-- 
2.34.1

