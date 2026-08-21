Received: from mail-ed1-f54.google.com (mail-ed1-f54.google.com [209.85.208.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 51D4F381E9C
	for <devicetree@vger.kernel.org>; Fri, 21 Aug 2026 04:40:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787287203; cv=none; b=XJst23Y33S43ubv66G79UDZhaCq2NLFiPOegnjhUepofxdvCm2+FjtiNlvRfJHSfJ27We+3ilQqrQy7NQdZZ+SIilD1qV+wSatMOuO67+xXjPRTfuf9BJ5EMnTzkrMTf2St1wmKZgCepKrRmJsDC3IacIdxY5+p4zBAzYacCLUg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787287203; c=relaxed/simple;
	bh=dmm5s5EvKAr7EaMlUMgpNClRMNSBub5q46OgcTbVtOc=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=nbvwAyo+3glynIN8nsznNJq9fYVWkl5JiAlXF3N0hSQxZyb7hVmc92pqcllGCzVkiujwpYvrrhwf+F5BOHksauK7hLNzAqvqHDFbxdZIpNfxLMFOm8DpTTiR1kPMoLaiCs8Qy2O6EhkxJ8ZHB9/ZmZHfSF9U5errcaUlQYlqQw0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=asseily.com; spf=pass smtp.mailfrom=asseily.com; dkim=pass (2048-bit key) header.d=asseily.com header.i=@asseily.com header.b=YOxbLZ7g; arc=none smtp.client-ip=209.85.208.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=asseily.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=asseily.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=asseily.com header.i=@asseily.com header.b="YOxbLZ7g"
Received: by mail-ed1-f54.google.com with SMTP id 4fb4d7f45d1cf-6a3e145e1bfso853639a12.1
        for <devicetree@vger.kernel.org>; Thu, 20 Aug 2026 21:40:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=asseily.com; s=google; t=1787287199; x=1787891999; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=c/TOCQOXC1+dxo3+w71MBVrhrZesKXF/A9anBAhAKsE=;
        b=YOxbLZ7g3lJuM9qDwNZDgl8+cIsQHwVx3Fr72icpMPB2wyS37U282Lq0XvKKe4x7uE
         zlJd8uu3xehFt8IPDcohvCEIxLPLc+OdloEJi/+VtXqdOL6DbHKtdyTiiiWSSVYSF7MU
         efqedVufvin8XoL2cgSM6amxLhKQmPh1lO1eeZ7a8jtgsJ9VtXGsUb5uHkiip+gWJTRr
         Pp2ZwHLcX2Pc544oSyNdBM/sC3J4IDsEOS5GyiiCoLyAt8aMZF8HLVeu6FZX99/LTgQZ
         I8h0NZtWkHhruSHqQOHOJuHXxglFMVjb+gfZf4iPS9IAXAm80roqL81OC/CHv1TVQEXK
         ljnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787287199; x=1787891999;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=c/TOCQOXC1+dxo3+w71MBVrhrZesKXF/A9anBAhAKsE=;
        b=pHgYuMkoUW3jEGEAwKskZSbvZTcdAnzBmvvX6FENvqC5wJ1BhTDpfCdv39wWIb+xRj
         eOA7YvFWVgUuVzvVZ8CeAsFeelNdr29KtoY3VQaa03BVCSBjKML352flsMhUlBgjY1p0
         pdBIE8daa5mFKg1LtmkddsPmBws4xnasoflZOhas6j1tdR4fnUqFDf0eYr4zPanjN0J9
         HyLoNsHY2rP4tRDqtzdcCnmJc8bjK9X9uTvqtRW6wT52SZvXB4MEMzbGnoUBWJDHWjji
         PLsqu/AudvcPPfbV41t28J4z6cHZC2p/qFNt9tnJuSF4IwRpCykMuXZLfH3l40+BSEtR
         T13A==
X-Forwarded-Encrypted: i=1; AHgh+RpGOQJ46FoSRvudeQvji4/m7LYv+8xwV52hAzsnPIOV4GTAxnx62KjmI3MWlFM2sWuaz3XJ4NZn9bAh@vger.kernel.org
X-Gm-Message-State: AOJu0YxfjBCzvAkTqbHn3Xcz9bsx5flYZrFAayyzJJNpF3Uzn7lLgeK8
	TbT8O5I+bpJLv0YDHcAejPtO/b5K7lkgtDIs0t8yYiwBTnW1EPNpHFC+K2Edq9pKpVo=
X-Gm-Gg: AR+sD13twJ3MUykDYm25H7Dg3tyKBF7TGYP+/cY6g3bg+r7g2+YYMitL/Mslie7iv54
	DLchk9vwl8sbk9+n0oOyYcdl20sE/jVjuk+7RyZUpHMSLrRhOg5zuT6QLTRPIkT/X2nCoO6Dknt
	jEHRZQ5GAV25LPhiJUee8kwsClC2V5qs9Kynm5i9NFcfii+NoLOo4SJ+BdthNi8PCUEZ5MzTR/E
	ukEX882P4al62YdGuCocRCT7IGMq6sfreqnPxvZce18uqdU5sWRBtxtrdvjkW4PX15vczduz3ll
	8aUDe4RdDo+LpWDrPGnVj86EeEkugu7TNujwpqi+ka7EuYUd4FVzhBGX2JHLrMx+CcvWlb4LjrM
	PLN049OW7Zb8kcSlB0R8Ris2WRFfNbuvY893lIVBPg88WJ1tZVaAAS86LK9A8SG6OEdcakEMGQf
	X5Yha1eGjGqB9vfvWybUC4JA0miu+NP3HNeuo+O54p42TPddIQhVf3SB+qq8jtfkQYiVP168hdc
	3I=
X-Received: by 2002:a17:907:934d:b0:c20:9447:bd5e with SMTP id a640c23a62f3a-c246a5f6d65mr331787166b.9.1787287199427;
        Thu, 20 Aug 2026 21:39:59 -0700 (PDT)
Received: from Behemoth.triland.local ([178.135.16.43])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c2458b5d438sm268182266b.27.2026.08.20.21.39.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 20 Aug 2026 21:39:58 -0700 (PDT)
From: Karl Asseily <karl@asseily.com>
To: broonie@kernel.org,
	lgirdwood@gmail.com,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	perex@perex.cz,
	tiwai@suse.com
Cc: linux-sound@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Karl Asseily <karl@asseily.com>
Subject: [PATCH v2 1/4] dt-bindings: vendor-prefixes: add ESS Technology
Date: Fri, 21 Aug 2026 07:38:56 +0300
Message-Id: <20260821043859.171871-2-karl@asseily.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260821043859.171871-1-karl@asseily.com>
References: <20260821043859.171871-1-karl@asseily.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add the vendor prefix for ESS Technology, Inc., maker of the SABRE family
of audio DACs. The prefix follows the company's domain, esstech.com.

Assisted-by: Claude:claude-opus-5
Signed-off-by: Karl Asseily <karl@asseily.com>
---

Notes:
    v2: rename the vendor prefix to esstech, after the company domain

 Documentation/devicetree/bindings/vendor-prefixes.yaml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/vendor-prefixes.yaml b/Documentation/devicetree/bindings/vendor-prefixes.yaml
index 396044f368e..7744e4044e8 100644
--- a/Documentation/devicetree/bindings/vendor-prefixes.yaml
+++ b/Documentation/devicetree/bindings/vendor-prefixes.yaml
@@ -549,6 +549,8 @@ patternProperties:
     description: Seiko Epson Corp.
   "^esp,.*":
     description: Espressif Systems Co. Ltd.
+  "^esstech,.*":
+    description: ESS Technology, Inc.
   "^est,.*":
     description: ESTeem Wireless Modems
   "^eswin,.*":
-- 
2.34.1

