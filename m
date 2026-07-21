Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 720F0480341
	for <devicetree@vger.kernel.org>; Tue, 21 Jul 2026 10:11:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784628683; cv=none; b=NynVwMVVj+KZNaX3qm0Ket4qffO1vboPsELGusTNb5mEQGSDVj+CjHUshtRymD97XPDpbm+g2bUrz/GC3ypO0jP9qQoEced9AeYNuu3Wuya3sz0yyQbY+KDlQHmA1OeDrZtHS+d8TsfIn/DJLmuv0kXPhOEhinEM26pJoL5sFHM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784628683; c=relaxed/simple;
	bh=A6l+WAt/iV+zJkzc8AbsZF5IIolZynYw+uY6h48QsEg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=HOSXkYRiFiynS7avjwtgwBwkfFcvOwObRvx3gI8ATnpehhRwyRf0a5ydXVLJwf1/4LB+nR+/Cz3cbx2FXMVu6qXU9SWCCOdvFcwh2hEiJZFd/qM0bWjhkbutuGeG7O+5xmKzwqNL6r+hvpJ5fUFCas7ErL/ceuX7quNfo1rDkkk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=YabLRbEu; arc=none smtp.client-ip=209.85.128.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="YabLRbEu"
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-4954dff6536so24588285e9.0
        for <devicetree@vger.kernel.org>; Tue, 21 Jul 2026 03:11:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784628678; x=1785233478; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=WyQq8J9mZvpdXLAlP3nVs/VYUqZVy26W3Uq5hIZpY2Q=;
        b=YabLRbEuJxdboNUyeZUQFEok1QI2uc2ogbGomL2AEpxkVhB9Az/8UIfHbPE1lqwBui
         BM2Pp6sBS/rVt1QC7bX1r3yZB0At6ljeGObuRu1G95otZvewNNby7UO2kMXqStFqmz8A
         QQoHvZLnU41eY30Ox7s3Kv4coFkFAjwnv4oBrKIoQxT5aThk6NtIW2YKbvCn8ht4Utag
         3YTfnMOaHOzB1CeJDUw7XgYcEjdZjGCIurDi/pPvC3nTbTqZX9KkEPyoHuSCKAI6usON
         jsmWLtLslp2lLZQUz6a4BfUFJ66goupJNrbeqtcHh2Qmovqmdt51Cxgp7dfnHVSuwsYQ
         82bw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784628678; x=1785233478;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=WyQq8J9mZvpdXLAlP3nVs/VYUqZVy26W3Uq5hIZpY2Q=;
        b=X/6ATejLCiH6MzxaR1hpx1cW0uU/F/gdmVYFpRYu3MQf2oV+PiFt1mvpplTEuSB0Vm
         hyIqfxiBLLugCx4sqmD88pyq31+M4HGa636Dp242c9wrpk4Nl7Q1/NIIDcNTJzQSqmSE
         SyPoGBBHbb8dkS2SAk/nsP9yx/b/H1BBYFD52IXmEZn21z6dlN+ajJuyOlFTdssWFswM
         I30w9J6kfp+FmVg6qM7KkX+0lsmPNhAHSCFH5rJWUa13w9PQKkZNCRZjUhnEmR4ferSU
         cmDPamefenWqLPvYeUURwlj+V445w5EXb8nECKsUF+WdV1sJcSQYUd/lmM8rKVqHQ19u
         kc+w==
X-Gm-Message-State: AOJu0YwnjduiHtQdDYh7baVbqaFuDxGVkALUh+OgXH3eixndlerNBUW6
	9XJfdTcOculjCNZW04z1sb8oKy/bDMf++a7i+p60k/Zs0SWumIT33yss
X-Gm-Gg: AfdE7cnZNtvTRdwcUngS9lN7O8i09jgFkGG6xpKcJjeevf4alVc9uDmNHRpOU1nxwD7
	I3jzFbz+wOHRzLwn1SLoZtngJVfgZV8YnvNfIR6nowavhkV5A3K6tq/ayUYb6wNiW2Bt0ZzejUF
	dkFfaqNYb00mmJ3zskBHilUxMasc6+Mwry6DIFmVywRjvKTThXpk9lOMwtiaVOtCbwJmoDgie4V
	OtlekAKokMrx4sOMnDDV3hZ+agDAOq9yAm65KoZVb4QaEvFBxhiDQOGsRfzqdA2+RyQ4rcOuh8+
	vNoq32QZDollq4TW8SdpcqVGYbcLjY6jBqNZwpxrtH7aSOu/ROJY+9PS6rJ8W9nSg9fJLypSIpb
	Kg7vJQjzOr1VIQPAtanQJJFRUSEkI2T5nfwHJhJ/4et2o8EdteZIZ4iLv3p7dKRunp7VEB+4lL/
	0UEX34PzGwvgsp4lP2N+qh418=
X-Received: by 2002:a05:600c:3587:b0:493:bb0:3b43 with SMTP id 5b1f17b1804b1-4954a3d06d9mr190116565e9.2.1784628678459;
        Tue, 21 Jul 2026 03:11:18 -0700 (PDT)
Received: from xeon ([188.163.112.51])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4956547319dsm57127085e9.5.2026.07.21.03.11.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Jul 2026 03:11:17 -0700 (PDT)
From: Svyatoslav Ryhel <clamor95@gmail.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Thierry Reding <thierry.reding@kernel.org>,
	Jonathan Hunter <jonathanh@nvidia.com>,
	Svyatoslav Ryhel <clamor95@gmail.com>
Cc: devicetree@vger.kernel.org,
	linux-tegra@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 08/10] ARM: tegra: tf701t: Complete power sensor node
Date: Tue, 21 Jul 2026 13:10:57 +0300
Message-ID: <20260721101059.451699-9-clamor95@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260721101059.451699-1-clamor95@gmail.com>
References: <20260721101059.451699-1-clamor95@gmail.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add missing vs-supply and io-channel-cells.

Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
---
 arch/arm/boot/dts/nvidia/tegra114-asus-tf701t.dts | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/arch/arm/boot/dts/nvidia/tegra114-asus-tf701t.dts b/arch/arm/boot/dts/nvidia/tegra114-asus-tf701t.dts
index b71a02b3fd86f..32d55c18c7446 100644
--- a/arch/arm/boot/dts/nvidia/tegra114-asus-tf701t.dts
+++ b/arch/arm/boot/dts/nvidia/tegra114-asus-tf701t.dts
@@ -1391,6 +1391,9 @@ power-sensor@44 {
 			reg = <0x44>;
 
 			shunt-resistor = <5000>;
+
+			vs-supply = <&vdd_3v3_sys>;
+			#io-channel-cells = <1>;
 		};
 	};
 
-- 
2.53.0

