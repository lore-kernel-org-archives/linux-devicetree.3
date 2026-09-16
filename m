Received: from mail-wm2-f12.google.com (mail-wm2-f12.google.com [74.125.225.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4D1BA4B95BD
	for <devicetree@vger.kernel.org>; Wed, 16 Sep 2026 16:06:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789574818; cv=none; b=GLndxFB5Sah/aTImog3o2Fqc96fv+0hH4V9epmdP3E2rLxBDE46dAA/m56jS1jjAkrUJJ+H3zkS8iz9KOtg79DsHNHepw/sHlsRvw8Juw6iVUNzfNBm7A7TY2ijjGnhfvdoGi1BnF+RBLmRXk3xdkRDXY4Q9gB8ZQpscFYCA8R4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789574818; c=relaxed/simple;
	bh=Ff4OmfN8CYUiKKRCKdpGJQ+e0RrDjxCspxN0MFTfbAI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=Q+Wr+OwBqFFUCh1UZibkdOIlTX5UII0KdA1yOLlESzzA5vOSs/zL3XLIYkQf6W5Fig0nVfc8abYSTJkoiUiKpw2us1pWja3ROpq627PsNJRoS9OChql5jBVaZZCRtP3a+hP/lbvBSNEe873/Fzla6jXeOPOd9xeH7ETcdKXop88=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=sBz0CSgW; arc=none smtp.client-ip=74.125.225.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="sBz0CSgW"
Received: by mail-wm2-f12.google.com with SMTP id 5b1f17b1804b1-49ccff31419so9830365e9.3
        for <devicetree@vger.kernel.org>; Wed, 16 Sep 2026 09:06:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789574814; x=1790179614; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=mVlGdYNhNUu9mC7pDXKcspPVWpvSds0uyTHL3WW6nL0=;
        b=sBz0CSgW85z0vdPAc5UqTbhiAWWjIP97iHQhExnt1/aHMeQ1tl4rEHlrDXkypehnow
         dfHgXcs2bdsC+4L64pG4MyewlLxKp8VMxdzb478yuCZi69Lww1piETi5hHzFAWNSiFFY
         8k4GslzwTQEKqvNP/33an/PRzmUm1Aw3PH/uVXOmpFmeI/7m31pkHCQgWEB0Dq2Y3pKT
         oR7w1Ova/etV/KxCViNUMEzbDVZD8Pvxo3NBuVoIl/tD8+bhJWwDdmOSSowFX2WTWif8
         RL1Fw4/XYsnsTJ5DiMyVZKhEANuZghlw1Yk9/KkF7QS3DgoNMFpsy2AQlCayiEH5x3jH
         0pQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789574814; x=1790179614;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=mVlGdYNhNUu9mC7pDXKcspPVWpvSds0uyTHL3WW6nL0=;
        b=pOzOYmALavfnDUs3xuy32VyisYTnv/JKZTeBEiWds720eFgK0h40HBdXXBzzFlp3j8
         c9RJB4P3FJJ49P9AWVpVuPtScAX2+c1pAQroNz0O8sBED1f5ST6PXSn9MrZdYEDhjdQo
         xYROMRZGCs2ihF5TcsVwcntAejGhSTPQmVEocZ7jzvdMyqEnBezDuI3IpoRUoqaQ2NT+
         zbp4oxe/0OcYOS44Fqf42KCsdYhKPVQFdvJr5obcLFRIVTJSxdsvZ/HUB0E4WQdsk6eQ
         TjwomJI36wMHbzddYMeKPpYlJ0GJzXzotFb+B3NTXpiJYkJVZLrtBXMKPzaZntmQ4NDL
         XxCQ==
X-Gm-Message-State: AFuF++kipJmb+XmsDBvrj89/6jKgBN4tx9LftkAtFt6JA8IPZDPRI4tZ
	ZIUienOgCFyAPVgQGy0YB4lWuIo/ZMYJFfDGE4ejlIJXQopiUS5WMKVL
X-Gm-Gg: AYBFou3HWiI/dcnWW9dOVCjIO4QMGyqNnM8+HK5QICcxIcn4dqg13qI7K5w1sdDuuzh
	9nUsrI7L2Ms/z67Zn5ZWjDi+zvYbTVn0VRhmKc5/CwS/SWMTIZsPcPl2PpPSfnGwrf0Fk9ZG65/
	9x/f2Cbc0PLPzIqlc0qqK+YgSq0iogaaDuNTxk7yXy2UvJCF5uXKpJvrfq0ffevmK5qnQ7W1HFY
	iA7vhRPMqsmFIc0gMJyWJ4uHnqv3el2F8yL/mmDQsGvTTDbPBHqruAE35t4LjrwMXnsUQdk3CPy
	QysZJdFJfgrmxLb6+M9D/FYTydrphYCj7scqNe21zy4oNBvMe1y5isEwNoHuXPowEnIsoL7/9C3
	H880mQAohaSg/iIYDM9sgP27XQ25PIpL/605W0waHkCsLXZZ+Hbhj+OLmCJyZ9yD0jlwHwuK3ly
	DUkHcATpfAGjBhBfqeSdrsL2NVegFzmrebpei6YKDvsgElCKGByqzII+VQthJluX4KFp9esSLSn
	giJYo9QD9d9lJJewf7B/70B4dF/j1YPgLtWDshlEAaaw35OximbdA+72yopuxrI1Tga77TI1zWg
	w6Csc9ABy/YUzvdVZdmESKKBGPKs
X-Received: by 2002:a05:600c:4e09:b0:49e:7c83:4733 with SMTP id 5b1f17b1804b1-49eb733ae01mr38851665e9.32.1789574814009;
        Wed, 16 Sep 2026 09:06:54 -0700 (PDT)
Received: from [192.168.0.233] (2a02-8388-e6ca-5780-e161-768d-5c97-84d0.cable.dynamic.v6.surfer.at. [2a02:8388:e6ca:5780:e161:768d:5c97:84d0])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49e84805db6sm49721625e9.3.2026.09.16.09.06.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Sep 2026 09:06:53 -0700 (PDT)
From: Andrei Lalaev <andrey.lalaev@gmail.com>
Date: Wed, 16 Sep 2026 18:06:30 +0200
Subject: [PATCH] riscv: dts: sophgo: sg2000-milkv-duo-s: reserve memory for
 RTOS
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260916-milkv-duo-s-rtos-memory-v1-1-6ca72d5a3924@gmail.com>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/yXMQQ6CMBBA0auQWTsJUMWUqxgXQAcYpdTMAIEQ7
 m6V5Vv8v4OSMCmUyQ5CCyuHMSK7JND01dgRsouGPM2L1GYFeh7eC7o5oKJMQdGTD7LhvbJXawy
 ZW+0g1h+hltf/+fE8rXP9omb67eA4vqhb+xp7AAAA
X-Change-ID: 20260916-milkv-duo-s-rtos-memory-7a94933e35bd
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Paul Walmsley <pjw@kernel.org>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
 Alexandre Ghiti <alex@ghiti.fr>, Chen Wang <chen.wang@linux.dev>, 
 Inochi Amaoto <inochiama@gmail.com>
Cc: devicetree@vger.kernel.org, sophgo@lists.linux.dev, 
 linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Andrei Lalaev <andrey.lalaev@gmail.com>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1789574813; l=1124;
 i=andrey.lalaev@gmail.com; s=20260901; h=from:subject:message-id;
 bh=Ff4OmfN8CYUiKKRCKdpGJQ+e0RrDjxCspxN0MFTfbAI=;
 b=Y+VhV+8jpUiN0h9+sYkxwnw3QWuHK4l02Ho7OkmUrd/LFRd0AdSKS+0TickZEJ4shfLFUJuOO
 2S/41WW+AZJAmJBHe42pAAri1S7qWDmjEQaA/IN1xNTw5NGVNWvhX2r
X-Developer-Key: i=andrey.lalaev@gmail.com; a=ed25519;
 pk=YHk+K3q98GV/1CigmrEAQ+Vc0o+GlFWt3j94jvrEh6o=

The FSBL loads the coprocessor firmware into the last 2 MB of RAM.
Reserve this region to prevent Linux from using it.

Signed-off-by: Andrei Lalaev <andrey.lalaev@gmail.com>
---
 arch/riscv/boot/dts/sophgo/sg2000-milkv-duo-s.dts | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/arch/riscv/boot/dts/sophgo/sg2000-milkv-duo-s.dts b/arch/riscv/boot/dts/sophgo/sg2000-milkv-duo-s.dts
index 78a257839f6f..693c9fd7b771 100644
--- a/arch/riscv/boot/dts/sophgo/sg2000-milkv-duo-s.dts
+++ b/arch/riscv/boot/dts/sophgo/sg2000-milkv-duo-s.dts
@@ -22,6 +22,17 @@ chosen {
 		stdout-path = "serial0:115200n8";
 	};
 
+	reserved-memory {
+		#address-cells = <1>;
+		#size-cells = <1>;
+		ranges;
+
+		coprocessor_rtos: region@9fe00000 {
+			reg = <0x9fe00000 0x200000>;
+			no-map;
+		};
+	};
+
 	wifi_pwrseq: wifi-pwrseq {
 		compatible = "mmc-pwrseq-simple";
 		reset-gpios = <&porta 15 GPIO_ACTIVE_LOW>;

---
base-commit: 9b87fdc9af2fbfcdb5c24a64139685ef80f6573f
change-id: 20260916-milkv-duo-s-rtos-memory-7a94933e35bd

Best regards,
--  
Andrei Lalaev <andrey.lalaev@gmail.com>

