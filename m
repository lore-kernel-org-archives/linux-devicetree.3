Received: from mail-ed1-f41.google.com (mail-ed1-f41.google.com [209.85.208.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 996CC1F1537
	for <devicetree@vger.kernel.org>; Fri, 21 Aug 2026 12:27:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787315232; cv=none; b=Dl9iw0kFePJmvUSVREVmXrv+3mNPt0lF0wdoRvdpDWbQptIAuJ7xxw3MI00O59l4DthpCh/30Xcnjc2OrJ3uhmfuIFah1dSdy/DZsrpxuxSXiE6sK4MvfFgI0/OtIddlpFeP56tj587ETpuj5rxF4wSXrYTHCxKcnt9y1gm4Mk8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787315232; c=relaxed/simple;
	bh=lvXJIYHg+Za7wwIfyKwrdptP8jCEhBX03Cv8tnpa48U=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=ME6hAEelhqsdSUI5AbeHcalDfZPSH4sJcNcK06tiruRX524cKHVzQhKuF9fA2v8xbdBcQEZZ3SzchYtuP+6i4wjuZg8PWfwSkAQ8pw50zZl4uNHl5U8WAToWL8+Xr24vJ5PCUntLgBQmBxeacQFbalZ1zFgbk2OgG3DLo3HGRz0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=iyHkRCcC; arc=none smtp.client-ip=209.85.208.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="iyHkRCcC"
Received: by mail-ed1-f41.google.com with SMTP id 4fb4d7f45d1cf-69f7fa1c548so1960924a12.2
        for <devicetree@vger.kernel.org>; Fri, 21 Aug 2026 05:27:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787315227; x=1787920027; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Pna/XzfqXxr5JhHe4C9RpqDZzth/Iq1szA4HTr9J/M4=;
        b=iyHkRCcCael8ukhCEkpReKwomUTJYsOYZyNYjUguFh3GPp92yFDWuFBJP7pocirwEZ
         HkEbA7qnnG0dbN9lpyfN02h8eCY6iW3BpPwgoNDqrmoeEfPqTb30UnYcQRfbt0YSZ79Y
         PzOjU0e8gYeLuRT8rrgw+c5i7FULxSbUkJv10rFEAcPnSukQHhLjHPd0QCISUKwpHVFN
         dPIOo/Z+0iyMUSeTRRm4dVModRv+TPxF/+IB7NGlZNbtSkNhD3cUzL/7bNnqBxJgIApQ
         OmZehncGz82pUoXosiyd5XEdgyN5UBBIxdZUmM0IjPQLE/X8sDCsyFTSupFWRajaWuTu
         JNkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787315227; x=1787920027;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Pna/XzfqXxr5JhHe4C9RpqDZzth/Iq1szA4HTr9J/M4=;
        b=QXb8zxI9d/3t0BNkbU2BtTIlGs0JMJg4YoBQvdYJjnTuEEdY3x0tm6FwhZCpyvoMgH
         jUZQmGHD29v2myT4OE33PfSafEcfkU9qYyiDyyPrTS0DwT8T6gkIfzQ0oEKBpAeIMsdt
         91pvpqUAlShIbhVExLIyVCGQFMKn7gK6RJ5MKVfnbQXzPVv+Rtx+il3RbGy59lGzlmRh
         4RG0lTjVEFPG5P6TRo3hOo8TicTGNOOO4hEJzGP+up+9Xwx+coHEuXJCNKRwR0D7oQZ0
         Z7kFPVVK2H0C1FZMQVhMeKUSHm9amMArox+whS7J4k7zEpI9Y0Rb0lHNoH4HGTxtyZdc
         VZOA==
X-Forwarded-Encrypted: i=1; AHgh+Roiwm/hcQxED3EliEi4pORwbgzZ4llIRGjvuH5QX1usGRu7wtrSKelibR4Fo0c2PE7Wav+6vIWhxlKr@vger.kernel.org
X-Gm-Message-State: AFuF++lzcSXbgSx+jprQwbYNH10nrHraDDA50/N/hC1hCcKqMPAhKI49
	fWNXvwUXjgpfnV69IgKiuwSAsvZgIAvo7HAWvlyhK9vyEO/IByJGGbYZ
X-Gm-Gg: AR+sD10HCJY/DUN+Mm+fZQ0pbPc7p6lUxKCrQ5Hrx1B9D7Zty4nqDYMzo7BTHQEbvdP
	En0zlCqy9HLra9lLTNt86HXjp3Nk6uQTv7tpnnQ32oLsKNCYa3w8OohK1Oley+8tgQlWO6a/A9v
	fw2tEPpoSqfYdIZqcoQXvxaOIT5vsCly1vNptt/N8epkTU5d6VgDxp1q0URVQwihY8LS7xUfndh
	rlgktFqnXFbBTRE/pULvJUg/klCm+Re++AepxTNsz/mQCUYt29jonVK5QDMREnYHLRBbet9+Ned
	RqrWeci6ADAUgeIBLQAn2Dt73cFy1bxPpWH/D9jPz9JcxJnFsZszZ2MrURkz0/hglzQ39mPtTiY
	QMEnR3zgdvpoYO2m9KMFIbHS7O0rCMjpxxluNicmrKfz0aNvvaTk8jNRBdnvJU4eqNag+ZuGKbm
	M6B9Fe/HKR2isoOFZMh1YeI8sbYli/ldJmGe4wlZbsxCwRc6f49P8g3OXztSpms9D1E0qkOj7Af
	kVHPAWqGwVC24p9/xWRVak4zow=
X-Received: by 2002:a05:6402:249c:b0:6a3:71fd:4083 with SMTP id 4fb4d7f45d1cf-6a42f1e930dmr562762a12.9.1787315227582;
        Fri, 21 Aug 2026 05:27:07 -0700 (PDT)
Received: from [127.0.1.1] (83.24.178.112.ipv4.supernova.orange.pl. [83.24.178.112])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6a3ff0c315dsm6220262a12.9.2026.08.21.05.27.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 21 Aug 2026 05:27:07 -0700 (PDT)
From: Adam Skladowski <a39.skl@gmail.com>
Date: Fri, 21 Aug 2026 14:27:00 +0200
Subject: [PATCH v5 1/7] dt-bindings: vendor-prefixes: Add LeEco
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260821-next-patches-v5-1-ec81cee63e09@gmail.com>
References: <20260821-next-patches-v5-0-ec81cee63e09@gmail.com>
In-Reply-To: <20260821-next-patches-v5-0-ec81cee63e09@gmail.com>
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Kees Cook <kees@kernel.org>, 
 Tony Luck <tony.luck@intel.com>, 
 "Guilherme G. Piccoli" <gpiccoli@igalia.com>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-hardening@vger.kernel.org, 
 Adam Skladowski <a39.skl@gmail.com>
X-Mailer: b4 0.15.2

Add vendor prefix for now dead ecosystem company LeEco

Signed-off-by: Adam Skladowski <a39.skl@gmail.com>
---
 Documentation/devicetree/bindings/vendor-prefixes.yaml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/vendor-prefixes.yaml b/Documentation/devicetree/bindings/vendor-prefixes.yaml
index 136681412501..dd0762d3334b 100644
--- a/Documentation/devicetree/bindings/vendor-prefixes.yaml
+++ b/Documentation/devicetree/bindings/vendor-prefixes.yaml
@@ -947,6 +947,8 @@ patternProperties:
     description: Shenzen LC Technology Co., Ltd.
   "^leadtek,.*":
     description: Shenzhen Leadtek Technology Co., Ltd.
+  "^leeco,.*":
+    description: Leshi Holding Beijing.
   "^leez,.*":
     description: Leez
   "^lego,.*":

-- 
2.55.0

