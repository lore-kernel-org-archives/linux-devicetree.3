Received: from mail-ot1-f50.google.com (mail-ot1-f50.google.com [209.85.210.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 584534F799A
	for <devicetree@vger.kernel.org>; Tue, 14 Jul 2026 19:25:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784057163; cv=none; b=nqLy22bU9yxuVJBdXVu942ZAQaEr2nDWizXhOAOdGTDOJ3b04NWMH5KJq8duSZ8w1bpYamL3RBANGJHXx5jKJlIPlTYAITQF8ByVuEXIios8nd5l4/MJZNc398r+LPLnhswyecF/LazTlPvtHmR7UVwwN1h/bJhKx9aHUpmK83E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784057163; c=relaxed/simple;
	bh=J0YKlFtNy4CDBcxTAckyx8hsiYKO7Szf3eJ9mSEdqPM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Ybl6FLGTWoydI7Bnv1LXrJVpjJiiADiLJwI6igj65GIDwpK6Tv0QwN2awjCcg7bpV/oLf6HKejpgI25FmGc2jRl1Cem1L/cCfn7yljHY5SL8dPkKwgghWH5rA88V/Ye1aum5JPpuERhpwNrN6ZdGx6zZaVG3oNQ/kddCqNUFQvA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=Y/fDTTRC; arc=none smtp.client-ip=209.85.210.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="Y/fDTTRC"
Received: by mail-ot1-f50.google.com with SMTP id 46e09a7af769-7e9dc546f40so841879a34.1
        for <devicetree@vger.kernel.org>; Tue, 14 Jul 2026 12:25:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1784057156; x=1784661956; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=4qhLkMDf0+YlirUGcXz6TF2rj0izbPoAZeNkitt1I2g=;
        b=Y/fDTTRCMva/eF737gVO/UTnAjn0atvvXDpMLwMkz08IaRNfV4AcchSgOsrVGVgXp8
         aCmjMl4ENs79AmT4ODlNox/MPUfzE4CgLS+DlxK7oZCREqrNkoRP/F8+Gu4ngKu6Rmh+
         HLtS4w7rdtIO+i/+OLqkafIAs7aAqKPmg0RJo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784057156; x=1784661956;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=4qhLkMDf0+YlirUGcXz6TF2rj0izbPoAZeNkitt1I2g=;
        b=anlnD1tBEas5HAzppwRWM34oLkuZ4W3FXHKcb+p9RORtP90U2rIDOZvjFkonEfVUBD
         rrqfYigN50AeDlwzH8Khe8jiKwIPkWkwtXf2nGOhG0gJEY0wFWNn/uCcGZlCMWwUB03n
         E5UwfaXlSq3ENcaYoYRbQoHtozluD8rP6gzYne1FgzauszHUzr7SrzSTvJaDyg3kcOFW
         d/rvkHwXoLWNt20JjrprEiWQtkCgHhjWAU2BUzJ8E1rs3IjDFEXPmINKr1KzBoKQjfl3
         y42FwGaLxx4xjJRZjMu1/q72Dlog63c7rTuMVWiZFvDE9h1vHvRo3ZNSWrxDrtTEzVpx
         CuiQ==
X-Forwarded-Encrypted: i=1; AFNElJ+Dr9/yyLLqo7xh8bWZjEvbpXtgwoZMl1TxP0Jat4MZ3sDUFB7P546nDUHrTQL72+SqxqqTXwSeAh15@vger.kernel.org
X-Gm-Message-State: AOJu0YxsrwXH9cElXTKK68MK6YkkCyIZrxX0BIsrgpgQDvCHIcaQJMwj
	jggNeX9uk51khtdNgTnOLXXiJ6nKeFfAgw2TvcDmOFOYkg/3WIJKkiQVh26KBPAYWFOXf9jFBhf
	cgjXbYQ==
X-Gm-Gg: AfdE7cl8Jnnvqao2gbpHXhEsHcdJLoaStpERfZ3565UKe5uC0RVZIXlcEPQmOdGiFtX
	liZ+jU69zrl1Y4EOZeG0jwgmp6fwvbem6/UjZ6+ZQWbsgeWh+xo2Y2le8TBtDYC5GaF2mr3SvMj
	eBTzPER5K96SKIf2TgU6pyMkKaB4oir8Z+OFLhKL71WK/0JZDxsWYAoHxEaSnVarRn8O5AFqKDL
	fjUNTKnrsPUHTnwIju51MXSPLAGKoPp7hwaXABgZRUPTX+Ljopg+8tgOWvMh/VNDKsEnJudao3Z
	r+hrbMPDx6V350M6N8bEiI5bwT/R6zJdxFFEu0QBx6I0quskEmXPc1PT/jpII2kIiFuwn91bgqN
	hC0KtnueRMXdVLmtUA4k1Xk6tmPZvkSPnzs5VNEFp6kmomYVkk81Txtyd3BGOzf7xx6Qs0tYUu1
	dSNcZQoe9Wjt2JQx/7oA==
X-Received: by 2002:a05:6820:1b0e:b0:6a1:7af8:a048 with SMTP id 006d021491bc7-6a38b9f1f93mr9540469eaf.33.1784057156624;
        Tue, 14 Jul 2026 12:25:56 -0700 (PDT)
Received: from chromium.org ([174.51.25.52])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-4519d89f7desm15759043fac.7.2026.07.14.12.25.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Jul 2026 12:25:56 -0700 (PDT)
From: Simon Glass <sjg@chromium.org>
To: Linus Walleij <linusw@kernel.org>
Cc: Heiko Stuebner <heiko@sntech.de>,
	Rob Herring <robh@kernel.org>,
	Jonas Karlman <jonas@kwiboo.se>,
	Conor Dooley <conor+dt@kernel.org>,
	linux-gpio@vger.kernel.org,
	linux-rockchip@lists.infradead.org,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org,
	Simon Glass <sjg@chromium.org>,
	Jeffy Chen <jeffy.chen@rock-chips.com>,
	huang lin <hl@rock-chips.com>,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 2/3] dt-bindings: pinctrl: rockchip: Add RV1106 compatible
Date: Tue, 14 Jul 2026 13:25:30 -0600
Message-ID: <20260714132531.v2.2.3a4f9d47d4dba36e14141f8796afe8907028aa9c@changeid>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260714192535.2082729-1-sjg@chromium.org>
References: <20260714192535.2082729-1-sjg@chromium.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add the compatible for the pin controller of the Rockchip RV1106 and
its RV1103 package variant.

Signed-off-by: Simon Glass <sjg@chromium.org>
---

(no changes since v1)

 Documentation/devicetree/bindings/pinctrl/rockchip,pinctrl.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/pinctrl/rockchip,pinctrl.yaml b/Documentation/devicetree/bindings/pinctrl/rockchip,pinctrl.yaml
index 9b3cbeb54fed..81747bb53056 100644
--- a/Documentation/devicetree/bindings/pinctrl/rockchip,pinctrl.yaml
+++ b/Documentation/devicetree/bindings/pinctrl/rockchip,pinctrl.yaml
@@ -51,6 +51,7 @@ properties:
       - rockchip,rk3576-pinctrl
       - rockchip,rk3588-pinctrl
       - rockchip,rv1103b-pinctrl
+      - rockchip,rv1106-pinctrl
       - rockchip,rv1108-pinctrl
       - rockchip,rv1126-pinctrl
 
-- 
2.43.0

