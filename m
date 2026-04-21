Received: from mail-lf1-f54.google.com (mail-lf1-f54.google.com [209.85.167.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 943D615B0EC
	for <devicetree@vger.kernel.org>; Tue, 21 Apr 2026 02:33:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776738784; cv=none; b=Qwboy2C3fHq2793up25T7DZpaTuEmJS1tsvqHfmkTrSdQVWhYybyxp5sioLPc3D4ZK6ojDsokOFzj0oncL19knzk8oEFPAkBCx3AyGW8l0yN2nCSzeWbmHiULSFdJ/tm0WK5x56rx7/I2ZmzOz4Y0NQOdzLnUS2uNyuFfdiCva4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776738784; c=relaxed/simple;
	bh=wFQg19914jtz2XwP2opdWcSfU1TUAdgxAKkGDk7LU18=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:Cc:References:
	 In-Reply-To:Content-Type; b=TQp3Laf32WC0GPWJFHHZxQoO5PRrq6SlsakR5AJlsPISrdZQWR6PCkMgjzWospn3GKzU3GVFia2NwECKFDFLjZnN+zKAGe/+wAJ5qeGqLjpK73UQ54QzHQQtHw4Bq6On4Ezor6FcYZVFVGgKyFMXiuP9Ppu133B4UU2ARb0V1Ig=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=qOQuwzbM; arc=none smtp.client-ip=209.85.167.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="qOQuwzbM"
Received: by mail-lf1-f54.google.com with SMTP id 2adb3069b0e04-59dea72099eso3410075e87.0
        for <devicetree@vger.kernel.org>; Mon, 20 Apr 2026 19:33:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776738781; x=1777343581; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:from:subject:user-agent:mime-version:date:message-id:from:to
         :cc:subject:date:message-id:reply-to;
        bh=ABWs0bWcgbon1Lem/Qfu4QEzbH5Ol1AP1e/CcPVA28g=;
        b=qOQuwzbMlR5h/X524RQUQ/TiaCHN4bwY/9OluG7isCwbdL32ejLOV6AYGu2SA7rch6
         TRXh15sPSqqa1KRB50c2IT2y75aaxp9JexYQ/UBAuvg8l8fVhUB2XoZrs8v4pU2YWtXq
         upcmqyiNSYkyLf3rDlk+Fy6W2ue9BuQ+LMEmKE1+eAQbaE1cb+ETy1BJ2We6RvrksXsd
         /6DVzXUv3yE6nDERlFbFL4n8euhbRRncvfwDig5XpHj9OP5gV1QnDi8paWzMLSMgvvMM
         +t60NaBSSOGmIRrInlLae1aj6M0E735VWmP3OHQNrHlrQ+bTVxFrU0us0BSY9d7nsqhC
         Ezbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776738781; x=1777343581;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:from:subject:user-agent:mime-version:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ABWs0bWcgbon1Lem/Qfu4QEzbH5Ol1AP1e/CcPVA28g=;
        b=foe4MYX4xNBdh6epR0zk6dt7zZkn0nOs5rdB6UERIOpXjdbpktC38Jli9XdOb/0ZOe
         YSk0BqT3zyK8bOlPTxMouf70/DIEd0Gn489JBvIdvz4mkd0TLdRSPdHWrsdVRFszgZRb
         BFPuTCjhb+j8VausWKqgIDdUrfZtqEHmZz7sGQqakPSeAvqXxpD+rQUt1wKtfJBH/sWI
         WzRMg/Qkw6zHNWC47Fxh1CRbNGNdu6N0RYJTKcJ/IHydJ4ABeYINBHl1lx5oO3IBLQ5u
         wAYlNAlSAFnEXDnSsN4cmi1V86EUKezSV0m5lvsZzxJsv1Isk7HRRuqtRjY/JwRA9AuN
         ITZg==
X-Forwarded-Encrypted: i=1; AFNElJ8ycVJ4MRpXvBpU/hDXPlaEyn9Sqn3UsYEJteMqCQ+yMJdLy/C0mmxlYw8439fWn/I1EvzHTJTjP0Yo@vger.kernel.org
X-Gm-Message-State: AOJu0YygPCnfcBeLm1nHVIzoDTUB6dh2nUibv5bJ5oHiXme4nS3AJHF3
	SEYsCpvLm+6pVSHHPJ1L4djvtLlBP1dlrp1l8hwXiRl6oBcD3Qs6jrJA
X-Gm-Gg: AeBDietcHgmkNzUBe+uya40ERU8Riw+CFsOLGGnUJOkNuUo8eou5njOAmgkMyfRWpMF
	yVtrj5O+nDlD+aAkiuDZIN8AKifUoUXQ73vJnLivfMpPkJrTbNLvHkYbBUovvDy6QlF1AMRJ0XS
	xblVQ+xDpOwo0AV6uKax3uWfzF2QW4StOfRrOOS4e2Letd4Z2rKYvoS9yMFCOC5RSzvzpu7CZS2
	ECDsACXYZ7lvP66ZrztUFJeV5NX8XzdmGLhL212qoH5I0YTVndX9Fy1EJRDHJiKZ+lxlJYxnhUo
	1ciD6PNOKC5HvOcKgiiFb2fFtkZrSwcgElEgb/Mhhw7oiFYlcbWkxoYofp9hgad//l+qEmaRwPD
	bWUC4HXemTPuwuazeTsuidpKAYhLd/2f70NibBbHGLLLwvPHRVFrHPmUy7OTwitIuki3teoWS5H
	7leF4Tjn2PwUXHGds6L6C78c5ie4x1YXWLfPRo096/Fo58DPhyDN6oOjAgURlJAM3mkc/8/s8C1
	7vj6bVQSJluOJzo
X-Received: by 2002:a05:6512:3e05:b0:5a3:fcb2:c6aa with SMTP id 2adb3069b0e04-5a4172bfee7mr5120903e87.13.1776738780573;
        Mon, 20 Apr 2026 19:33:00 -0700 (PDT)
Received: from ?IPV6:2a02:2698:242a:1c71:d5e3:307:560c:a869? ([2a02:2698:242a:1c71:d5e3:307:560c:a869])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a4187ebf9bsm3348415e87.81.2026.04.20.19.32.56
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 20 Apr 2026 19:32:58 -0700 (PDT)
Message-ID: <93f16046-ebab-47c0-bf71-fcb4cae147c8@gmail.com>
Date: Tue, 21 Apr 2026 05:32:56 +0300
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: [PATCH 2/2] dt-bindings: sound: cs35l35: fix typo 'overide' ->
 'override'
From: IRRatium <majnkraftiigry7@gmail.com>
To: broonie@kernel.org
Cc: lgirdwood@gmail.com, robh@kernel.org, krzk+dt@kernel.org,
 conor+dt@kernel.org, david.rhodes@cirrus.com, rf@opensource.cirrus.com,
 linux-sound@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, patches@opensource.cirrus.com
References: <5ba3d073-c5fd-431e-afb9-0a0911300aa7@gmail.com>
Content-Language: en-US
In-Reply-To: <5ba3d073-c5fd-431e-afb9-0a0911300aa7@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Fix typo in property name 'cirrus,classh-bst-overide',
should be 'cirrus,classh-bst-override'.

Signed-off-by: IRRatium <majnkraftiigry7@gmail.com>
---
  Documentation/devicetree/bindings/sound/cs35l35.txt | 4 ++--
  1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/sound/cs35l35.txt 
b/Documentation/devicetree/bindings/sound/cs35l35.txt
index e84f30c5c..1d364b3d3 100644
--- a/Documentation/devicetree/bindings/sound/cs35l35.txt
+++ b/Documentation/devicetree/bindings/sound/cs35l35.txt
@@ -82,7 +82,7 @@ Optional H/G Algorithm sub-node:
  Optional properties for the "cirrus,classh-internal-algo" Sub-node

    Section 7.29 Class H Control
-  - cirrus,classh-bst-overide : Boolean
+  - cirrus,classh-bst-override : Boolean
    - cirrus,classh-bst-max-limit
    - cirrus,classh-mem-depth

@@ -155,7 +155,7 @@ cs35l35: cs35l35@20 {
      cirrus,shared-boost;

      cirrus,classh-internal-algo {
-        cirrus,classh-bst-overide;
+        cirrus,classh-bst-override;
          cirrus,classh-bst-max-limit = <0x01>;
          cirrus,classh-mem-depth = <0x01>;
          cirrus,classh-release-rate = <0x08>;
-- 
2.53.0
