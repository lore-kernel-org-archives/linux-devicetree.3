Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.179
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794980900;
	b=oIlsGqanmWIwhYGMeOhZAvbvSztjpY+qlDI2nsuQKw35rTv0mCFGCXbg5mTrW68Y+gS8
	 isdcblTBF0+virrWKXe1mYHz2K7i28RT8vDI4dOGqHSc9u8rsBDw+ubOqvLwJwDF7JnlK
	 SoP4pFrHVlaj7hWk7O+qx48YkHX6adKq0p+6Sz3zzq6j2KpX2JbgNvhJ8f9JXCHSQvNbx
	 So+mxncy/3x3F8vTLVjImMGg8O875X34xCvs5JSGXiTSCV7EczIXSs9XxXujKF8ZwvOQr
	 a7h9uIXPSzYBEhW0CSmK7wXb8B+SOFyvgRCKRW4WP7wuqUhl6fAs0o7zkrnrCqeM30A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794980900;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=hdM7pfy5fx0fv3SX8+99cZSLyAjio050LadxpfZlP88=;
	b=TK72umLWwyfyDXz4VhPPUKTyigFlqAP+U8ulf26GG/2AbMhiMpqj1ZrJo+Hy6V7pFFE2
	 fwvDyTllowwk7AQ6TyVE8AFkyGSXUgcr8IvxOHsZ9clzr4vXr/U8JXJIQLADNMRJt4I9N
	 xj8LhlMyHSIwlnWQN7yYh6q6dx50+HAyA5nBnGUC6Gy3SVCfT0bE7qq6c+tyl0Iay3OLG
	 pwRfkEvjeIjl7RT6bdqQP3qZSCOZdv5clAFvdc3kaEMa0Q75YNGIxDsUFo+F7KKYShoOK
	 WROoXPXRDtzrAV8GhxYNgqG9bTBj1HJRY/pfF5+PD4z3o7nUZb3aT8yetQSZokfgbIg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Qer7cbtM;
	arc=none smtp.remote-ip=74.125.82.179
Received: from mail-dy1-f179.google.com (mail-dy1-f179.google.com [74.125.82.179])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5A12C606A325
	for <devicetree@vger.kernel.org>; Wed, 18 Nov 2026 05:48:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5A12C606A325
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Qer7cbtM
Received: by mail-dy1-f179.google.com with SMTP id 5a478bee46e88-36f8cdd30beso1459787eec.1
        for <devicetree@vger.kernel.org>; Tue, 17 Nov 2026 21:48:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794980899; x=1795585699; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=hdM7pfy5fx0fv3SX8+99cZSLyAjio050LadxpfZlP88=;
        b=Qer7cbtM41zQvA8ShYmJaV94GaO0+swi1hJ0UIfurzLV/aeb57/hvwAaLwunKM5z+K
         4xE07A1xZWK4OlAx9sTggbcUqdztt3IBlrDNGle6fl3YcRXwIdIALHQ0qWmBCgDxbmmQ
         W/plyc4A5/OwpBFbaxM5sZ443K7SBdtgKvz5tH/kYx0SEhizAny6XugCqfGSgCovD+qD
         OhbxySwsDWL+zj70EnWwN2lzXbbSh7ec1tqPrNvgmE9UnKpG7R11nfFoWItkgqBVzikv
         9HJRfyHxgqLEtshqa/pMyPdP4LZ6OgIP6JyhB06g482BI2usYm1TgIpWZ4xSAgW6MeZ3
         qi+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794980899; x=1795585699;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=hdM7pfy5fx0fv3SX8+99cZSLyAjio050LadxpfZlP88=;
        b=1RfFbhWR5Nxsij3/bnZ2YQLOfwIMb1KoVTfaQmezplmQ+CDuqP/1vThw95JPdM4JEg
         7+ql/3hx0vass9M7TCq0sV4w7skuak6SZKoj2xEONYsfMuc5iASKKvQ5E/T2kEQfsAxw
         WBzwfuydF7sb/ejAoPtDHPqZiwx8SCuRw2amiekoXsD37eSjfN1OxOYmnwxflEpZlZzy
         8ZVIhngPL5zHbBQVxHqdoWguQD3xAuZk5kDTF9qAeJJOnuVQbvJbknRLffLZVzbpweqM
         qPBFpRr5KsM44wnpTs5nGaHzOq614jgp/d8V936phcxbYCnH2aT/hwnDScCAIprWjmf9
         Pu1Q==
X-Forwarded-Encrypted: i=1; AL+hErGioCl+hiDOS5mSzdBmnTCAZil2K6+VP8EiGntZJ3VvKCxZDkaNyp+0E/8d9Zv33Z4gXiiE5A6OHl+9@vger.kernel.org
X-Gm-Message-State: APuU4Z/qscessikqrbiLs5lmf9L/4FS4//R5VVXYSp8PBwBUJ4I3cJHl
	7BTf5JPxCFeoCB5wSBBU8h+Aic1tUqj3gIVAoVKS9Q28oIeT7Riwe5A1
X-Gm-Gg: AZFdTZdL0ICds2S9+UIhwb0OTi6Rz1el3JsxICrIFRRg8mfLuZYQWmNFTkI5+qqvLSY
	RJ+RL0BgyX3m8/MpzcgZcVqS/E948SB9NbLtp3EBkyQqn59hn0f6dWsn2vvUAfZiVWr/CFGCziq
	QLseAHHDNxV++aDZvS/WjkMoVwNwDjfh5p/9KlEQUkArc8+UrAMwdFGJSCoYXEzjqdoyDUMYs+W
	+RRvyKEpCgIRWrmw2vrVl/7MUilX5SRDk05bW29rPj41deTybVwn0f8EydTyZkVOFQjbRbvmXup
	QdHKHyPBgnnHfALvkcE2BISNy2ZCLIDw/6yOxDFbgjVU37sloch2TpS2UKoBdsmihLGJvM01MXz
	PMGOmWSeZrYYDzRUT/lK1VwKxDr0ew695NpWJ+JRJoWKhC/uS2rxGgQeWUyPGQAZu4fvX1zhdX4
	uaqI9usuBQtji5EJ2Z+fq72ouPniu+Mdy+kwgDltjVTsn2gESvd1eaEQsbd5k0PsJLFkdPJLDdi
	BEzUFqD2lHy0y1ZFhpkxSHOF3Cd6o2mKhnxUQ6+NcZ4ygoWmIbw5tFvZepUqPO0WK63GtQTEIRR
	NzBPZpTTB+lXDVgVV1gHeRGeGZHKgDB/XTtPdpe01kzjXSUdbf2lDmgRJ7dViiPvLOKD3n98Sl6
	YZYg9WeiUTWMlCUjC4xryeXLugBaA7uRn/PAjsa76LMcNPBYbNb13yqvkaTuRvE9zyrJZj+Zipa
	GPpFs=
X-Received: by 2002:a05:7300:8246:b0:362:fa87:2aa6 with SMTP id 5a478bee46e88-3827aed49a7mr1623742eec.0.1794980899391;
        Tue, 17 Nov 2026 21:48:19 -0800 (PST)
Received: from ryzen.lan ([2601:644:8000:37f::e34])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-382a680032dsm3408116eec.10.2026.11.17.21.48.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Nov 2026 21:48:18 -0800 (PST)
From: Rosen Penev <rosenp@gmail.com>
To: Florian Fainelli <florian.fainelli@broadcom.com>,
	Hauke Mehrtens <hauke@hauke-m.de>,
	=?UTF-8?q?Rafa=C5=82=20Mi=C5=82ecki?= <zajec5@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
	=?UTF-8?q?Rafa=C5=82=20Mi=C5=82ecki?= <rafal@milecki.pl>,
	linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org
Subject: [PATCH 01/17] ARM: dts: BCM5301X: AC56U: specify switch
Date: Tue, 17 Nov 2026 21:47:42 -0800
Message-ID: <20261118054758.132233-2-rosenp@gmail.com>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <20261118054758.132233-1-rosenp@gmail.com>
References: <20261118054758.132233-1-rosenp@gmail.com>
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

Add labels to clarify which port is what.

Also set WAN MAC from nvram, which is offset by 1. Set in dts to avoid
having to handle this in userspace.

The port mapping is taken from OpenWrt.

Signed-off-by: Rosen Penev <rosenp@gmail.com>
---
 .../dts/broadcom/bcm4708-asus-rt-ac56u.dts    | 37 +++++++++++++++++++
 1 file changed, 37 insertions(+)

diff --git a/arch/arm/boot/dts/broadcom/bcm4708-asus-rt-ac56u.dts b/arch/arm/boot/dts/broadcom/bcm4708-asus-rt-ac56u.dts
index 708599f8c4be..574fc4f76e75 100644
--- a/arch/arm/boot/dts/broadcom/bcm4708-asus-rt-ac56u.dts
+++ b/arch/arm/boot/dts/broadcom/bcm4708-asus-rt-ac56u.dts
@@ -106,3 +106,40 @@ &gmac2 {
 	nvmem-cells = <&et0macaddr 0>;
 	nvmem-cell-names = "mac-address";
 };
+
+&srab {
+	status = "okay";
+
+	ports {
+		port@0 {
+			label = "lan1";
+		};
+
+		port@1 {
+			label = "lan2";
+		};
+
+		port@2 {
+			label = "lan3";
+		};
+
+		port@3 {
+			label = "lan4";
+		};
+
+		port@4 {
+			label = "wan";
+
+			nvmem-cells = <&et0macaddr 1>;
+			nvmem-cell-names = "mac-address";
+		};
+
+		port@5 {
+			status = "disabled";
+		};
+
+		port@7 {
+			status = "disabled";
+		};
+	};
+};
-- 
2.56.1

