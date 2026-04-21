Received: from mail-lf1-f42.google.com (mail-lf1-f42.google.com [209.85.167.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AE6343451C8
	for <devicetree@vger.kernel.org>; Tue, 21 Apr 2026 12:08:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776773340; cv=none; b=tmIGUUwZ1WFID3ovq3BphzSnIHIEp8/zJ3yNQ3+RmpyCnOWBzqwNJ95EuBoudxMidjDpQjYTzYfnhSAbyIRtMyzaJvU1D9eP8mMkYVgRRecidxy+ByNagCuj27SYKgrx1vJvLheA/AvHP9wp/8BNrCm9iRPlYGT5rgZvXLxR5Tk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776773340; c=relaxed/simple;
	bh=aiFLynpjYl5lQ5FEQIq2RBZ9sUwzrdzIDcRmvW305tE=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:References:Cc:
	 In-Reply-To:Content-Type; b=ndqaYxiipf0sbw8b68ulr9Z7ZLGIe2hIkF1Yv1t3wu3VYGZsJYRbwF0WsCxqbxUNvXmPtObxoYA6VS306c/muEKs5i3sD3IUNSjL/ZQgGqBLNAqildwY7BC6NJx6trffiAL93lPs0mIcWe+hEFroWLK2YU55smzYLcfV4+gEeaQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=PiQOGwyS; arc=none smtp.client-ip=209.85.167.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="PiQOGwyS"
Received: by mail-lf1-f42.google.com with SMTP id 2adb3069b0e04-59e5aa4ca41so4228363e87.2
        for <devicetree@vger.kernel.org>; Tue, 21 Apr 2026 05:08:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776773336; x=1777378136; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:cc:content-language
         :references:to:from:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=GrSOOzfY6QMDP4CMCrmM7To+FW0olg4dJIBSyC0pMd4=;
        b=PiQOGwySKkL02lkLiVwlnvJ12lYuKeCUliLKNR8yw2UDcSIzw/Qmo4YqmH0b7pHQMm
         ANNYUntIqxoyLaj7nwvnWHNPsQC7ZaN8WoJjS5tduobd8dX3Eet91NF8f4TWLwojADTK
         mMWdRUrpRRXtQBXp9YSAC9vN32drBMPgKSYTFlIrb2rsMpPB6XXdtPmmA6/5mKJrmUuI
         X6PLAT6AdUEqxdWRa4DaaD8r0uxfh4Qds3mcNzgtshA7DAH0FPjfAcb+nvgexryXMGjT
         TpLSybDsBIK0/VDqx/xe0Bf2opyGiMX4VYSvMckFYoQSrHeBAzAfOj8KCP9pxTN4FImK
         +xCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776773336; x=1777378136;
        h=content-transfer-encoding:in-reply-to:cc:content-language
         :references:to:from:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=GrSOOzfY6QMDP4CMCrmM7To+FW0olg4dJIBSyC0pMd4=;
        b=c5n2/cJ7/ZinQ8yVEX14Qz41jaDezCNSoAvDz0bdrUJddUuh3szlcQWez5kEP8I1ZY
         Axp4J1bySdSlmFm+F42n0IF48Z3qZEls+VdRucEc+zHMkuZf5O9erSlHi6W7DZmEVKvm
         Uc8uFSEMpFEpIi4jvv2XBm30qislH2S+LXPQAjg/BXVVEb2IOh4ITRKtn/ReIV/lpdHM
         sAHJHtyEwjtbCjRAFui/BfNYFOePV4UEnfHxuwrM9sjbMNxAG6IvHlYRjcMDRQlkcP0s
         gkUcogwZG9lO0YfZjZJoFLsa870UYYWwFMa2U+5bhhdUCE6MrdTsaEmAUk5OVKcLI5fp
         jrCg==
X-Forwarded-Encrypted: i=1; AFNElJ98J6qHdvtDySQg2z0PVMW1+X4eA6PoujTaK4TOxdh+LsWeF7libWO12rSs3mA0wEMoc2/spJBOiqg+@vger.kernel.org
X-Gm-Message-State: AOJu0Yz+eaUq+RGfAGyalf4XLHcP9BZ/OXTFAlycvoj4N7a5nbdvz4E6
	KLCaFTK75S/8ElgsWaaGO0hrOI+9r1LLd4hvGRHSrqa6Wn1PXPgsEeUF
X-Gm-Gg: AeBDiesyxVqlFHg7Stqh/YiWwGx6uEaVSJiVCSlBu6chbcoyGPOEfPMNoeeT/MczPyk
	wv38U+VNBMPCtWEICdSAzaYxbUjhkPeTz/2iS19x9dK516LEpw3Eg31MNwNRKOZqRR1vHmzsl4e
	0ExadMx64HM12KOm1ulscYjUG4hJ+ZZVGGqKMI8pbJWIn+eD05fLD7T6Jan/rBWzkpZUHd65bGP
	Sw528N+HOmCrhZtJcmHNJNXOIF1r/8Fo7FIrG1VdT79ZgqGNKwyZkKYE0XAmNE3lm80j5oqHbQs
	DXLZLYuIgTkVqz9wKOwccZ8yeegtRNyXFIoFIxT5xI0nEzpSWpBrVi3ZP4QhwvdG3X91ex9yth1
	BHvDhZVVFBQ2DwBa3rvqm4IOYV8R5RahY5vKcNEHjiThdvYwtOkONJR1frNySv+9pY9iS97vzdr
	eF/ZSu053C2AqIJtQKWnuIu5l5Hh8Qmu99HKdRqJ6uF2vDWgKEdyADBf53hrCZLZpbMftIkjMG9
	E/OLAlXh/4KtdvVovl1aunFLqg=
X-Received: by 2002:a05:6512:33c8:b0:5a4:8b:a075 with SMTP id 2adb3069b0e04-5a4172cc5e7mr5514712e87.16.1776773334265;
        Tue, 21 Apr 2026 05:08:54 -0700 (PDT)
Received: from ?IPV6:2a02:2698:242a:1c71:d5e3:307:560c:a869? ([2a02:2698:242a:1c71:d5e3:307:560c:a869])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a4185ad343sm3621482e87.2.2026.04.21.05.08.52
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 21 Apr 2026 05:08:52 -0700 (PDT)
Message-ID: <979224ba-eead-475a-b299-d8572d7cbaf5@gmail.com>
Date: Tue, 21 Apr 2026 15:08:50 +0300
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: [PATCH v2 2/2] dt-bindings: sound: cs35l35: fix typo 'overide' ->
 'override'
From: IRRatium <majnkraftiigry7@gmail.com>
To: broonie@kernel.org
References: <8ff364cc-c735-4e42-9d5d-775b76621e48@gmail.com>
Content-Language: en-US
Cc: lgirdwood@gmail.com, robh@kernel.org, krzk+dt@kernel.org,
 conor+dt@kernel.org, david.rhodes@cirrus.com, rf@opensource.cirrus.com,
 linux-sound@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, patches@opensource.cirrus.com
In-Reply-To: <8ff364cc-c735-4e42-9d5d-775b76621e48@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Fix typo in property name, should be 'cirrus,classh-bst-override'.
The driver now accepts both spellings for backward compatibility.

Signed-off-by: Sergey Shatkov <majnkraftiigry7@gmail.com>
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
