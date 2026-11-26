Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.52
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795674671;
	b=V2jr5l+DR62UlPASp2ssKNYwF5DiBNRAbVnEOg+FknUyfrsCbUSmStrvwNq3mZJW2yOF
	 JcPSj407pHk89sGIxK3/JzkAmOHeM5wd1kQzGE0EKnxfp0Uf74KafD137PpBGxktzjd1I
	 YX4dkfLqf+gQpwpaTIqZke6KaIpFSX1Cf/blLl03E4q54JtMJqjkNXPLPtkEWJj/AMtcQ
	 qr6k4WHKcQ2GtjeChBe7SC9Zu+HIvBzuqqdh2xZsUNNWVJsBinW2HFhtRIoHCD6/mElbR
	 Cs9HFH7sS6xFq+G4xGPRjxu3IZqF515YuQ7VqE5CZlPm4OPF5q6aJ9Tkmo11WmTUi2g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795674671;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:MIME-Version:Content-Transfer-Encoding;
	bh=E+IMOor8CoFQ3z7zL5CBrn2YjfbaXVNycgRbuyjfvZA=;
	b=Fw4OSKCaN4uEMb36jeOqDX8jTz9q3L6KMghe0QxofWp072MljddrzlzhiJl5PiDbQxET
	 7iB80/chPjHY6UBEzdpAeRy0G3ZysPdc5z3ZQrzY8MOkvWeKtdmH9ruuUEZBt/hOibG+h
	 /f/8gcarGYewATVDZZYuOBWwF6MEOTVh/kAPmOYP6p+WYv3LtXbowTIPzx2N5sDyzxJYW
	 oZmPWZuUt+Hmv2haQ+izBdH25acIrw+QeUZdzerSHFV9+vXwHrXNhwyRljMVds1ZR1z4T
	 N5ERnkyyD7WEE3lpeWOMzP66TJezTikaxgytj3xWWmoi5cSjtt+GU8CduizwxccTEGA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=C7OAy59f;
	arc=none smtp.remote-ip=209.85.216.52
Received: from mail-pj1-f52.google.com (mail-pj1-f52.google.com [209.85.216.52])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 98B4D606A323
	for <devicetree@vger.kernel.org>; Thu, 26 Nov 2026 06:31:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 98B4D606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=C7OAy59f
Received: by mail-pj1-f52.google.com with SMTP id 98e67ed59e1d1-3b4166b78b7so731191a91.3
        for <devicetree@vger.kernel.org>; Wed, 25 Nov 2026 22:31:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795674670; x=1796279470; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=E+IMOor8CoFQ3z7zL5CBrn2YjfbaXVNycgRbuyjfvZA=;
        b=C7OAy59f1ty7XiouW110bdFWFbkk3pae3O7gZpmMawcFG4Cmt9AGDzwyyrCqbKBDZX
         Hk8HdjELwQy3kJUZREbpyls+3wRxEieE+LIWW96B9wMYU6piHH7r1yFsJgQh+ls6O73n
         tOeZFMj8nPH84IndNs22dWO1k95xM0Wa0HodCC0QXp+nziQJoCJ7ByZQiCf4BpMpZAjs
         9/T5L020ZQPEFlg2jmDgb40W+Q0qXFJGGcr202kRKaBLR6Bfqpq3x31s2E7NqCpuXs4G
         ooxXWjwHn+ZVNcEN7ESo037tXGpMXWXAzZaHvBGXQo7hd3xht8ej4vfHPgAYk7Dm2NKU
         Lk9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795674670; x=1796279470;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=E+IMOor8CoFQ3z7zL5CBrn2YjfbaXVNycgRbuyjfvZA=;
        b=zD4AB83/Qqql52CCZ5xoFVsFm3FlTht0mr/frjfbH/3+0bkCSpU5ZilkE3G5GnYJCE
         Nj2P+zOiD2xlXPJC7nK+pYLu+5S/nejtQPekne40uRYQLtwzH/GgQd+zPgY6Oj/nzxt5
         lLOrn7Iwv+OL3XiQHPTrndu2vh9xIMyIYk/mU9poXaATzQZVLT5jo8ctCigrbIsqUPN1
         GuYd66penUuI5WU7k4tuDylNta7zevDjbXvHNi25MtiyyNJzghUJF7t8HfX7bpAjh9d0
         Yme1EE6PhOlG/8QQ5etZZCIl87l8u8TR+YqpmgUaKrvDaqEcZGoNz8k8XOGVo1vfeb6K
         Prhg==
X-Gm-Message-State: APuU4Z+EllRliyVruTYKzGBjZMn79st5w3Rofcpqf3KjoM1bG5IehDgi
	6822PZFk2Rsz1yvikNdPC4/ERbdj5GY7czTx9XdSc80XBtjGjYTUd57NXw35VN3R
X-Gm-Gg: AZFdTZf3dycuXVgI4LmPVXuCogp71NViFAN9AuuBrQKS+9awSH5H0czeNRgNcGrL6Fz
	h3eQAgT9HImSpyKYcFR6T7Mt/G+OgfCQQDePWcH20AtbyWi1U7aPGnH2IbwJE+gQZFqYPPTklsI
	7wBdLVFerPpYvDmay4leQuOp7QEiuVpai3an7UtVKQwyAl6fCPxlfppHgqVtmAr0anfHqZ9NP09
	krgbFQzOwBnYXoHqoskmLEtyk5LnDAwShrY965X3QsnLyTOqlbxeIc1Rqzz0XplU7JKy/08skiy
	fu/FMp4kFx36YKRu83jbgdtVz1wLqOADymhJnwzZOdsUdQTdfHPtORyi1Gc+4mC3MTHuxh+H7BX
	JQG+FZ6wbkQTiGIYSUYPXKB0mNdAQXzehzDXTR71EywN/kQn/uZHob2rNsvJWAqqkTJtFvphfwp
	I6Wz4knzVngI0zkkaiT83M0S9bVZHh7SL2uzVbVDkPBV2tc227O3yDxAbyiGpP72AwEhlbsd/EC
	u1M9lFbnaYzaPFADJLscVofVIxETNW9jLaCM1f2bs7Ph6+9Dw/S4pYYXs5+e5NmuPv3PqqIkCSv
	1gEeTJeUVOAOxa+NiSWCW5N54W8R1Cp7
X-Received: by 2002:a17:90b:3810:b0:3ac:a11a:7c88 with SMTP id 98e67ed59e1d1-3b41c8f3a38mr32043144a91.3.1795674669957;
        Wed, 25 Nov 2026 22:31:09 -0800 (PST)
Received: from localhost.localdomain ([240e:36d:b08:5b40::a60])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cde7f91c6f5sm7906328a12.27.2026.11.25.22.31.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Nov 2026 22:31:09 -0800 (PST)
From: Jianfeng Liu <liujianfeng1994@gmail.com>
To: devicetree@vger.kernel.org
Cc: Jianfeng Liu <liujianfeng1994@gmail.com>,
	Abel Vesa <abelvesa@kernel.org>,
	Bjorn Andersson <andersson@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Rob Herring <robh@kernel.org>,
	linux-arm-msm@vger.kernel.org
Subject: [PATCH v1 0/2] arm64: dts: qcom: Distinguish Xiaomi elish display panel variants
Date: Thu, 26 Nov 2026 14:30:32 +0800
Message-ID: <20261126063056.2276703-1-liujianfeng1994@gmail.com>
X-Mailer: git-send-email 2.47.3
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit


The Xiaomi Mi Pad 5 Pro (elish) ships with either a BOE or a CSOT display
panel. The two variants already have separate device trees, but their
root compatible lists are identical. Loaders such as Stubble cannot use
those lists to select the device tree for the detected panel.

Document a board compatible for each panel variant, then prepend it to
the corresponding device tree's root compatible list. Keep xiaomi,elish
and qcom,sm8250 as fallbacks, and continue to accept the existing generic
compatible list in the binding.

This series is based on next-20261125. The binding update precedes the
DTS changes.

Validation:
- Strict checkpatch: no errors or warnings.
- dt_binding_check with DT_SCHEMA_FILES=arm/qcom.yaml.
- Both Elish DTBs built and validated against arm/qcom.yaml.
- Existing generic-compatible Elish DTBs accepted by the updated schema.

On-device Stubble boot has been tested using U-Boot firmware.

AI assistance: OpenAI Codex helped adapt the existing downstream patch,
prepare the binding, commit messages and cover letter, and run the local
checks described above.


Jianfeng Liu (2):
  dt-bindings: arm: qcom: Document Xiaomi elish panel variants
  arm64: dts: qcom: sm8250-elish: Distinguish display panel variants

 Documentation/devicetree/bindings/arm/qcom.yaml       | 7 +++++++
 arch/arm64/boot/dts/qcom/sm8250-xiaomi-elish-boe.dts  | 2 +-
 arch/arm64/boot/dts/qcom/sm8250-xiaomi-elish-csot.dts | 2 +-
 3 files changed, 9 insertions(+), 2 deletions(-)

---
base-commit: 9437046953b2fb3bf55b36582450ea0267df82a7
branch: xiaomi-elish-panel-upstream

-- 
2.47.3

