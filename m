Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.181
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795408929;
	b=gvpxpbkTnsaE3wPz5oEy7ii0oRpZg4j1qRUHzXnsmuNk2eQAucPnlRYOO0sAzClr54iZ
	 Xp6c6RZiMbq13ST/R0+eiMgtpI5fKt02FZzSaU6QHX+XYt16FFWMnJqn4p/fUw2T+/kNc
	 3EcqT8Ls1MQJkdNbEe8yv0B1FeAXzHooCzOA8iGFAJbKFYpDRHgPlJAxdI2BOfrYc803B
	 tMTB7vLpOv0C5HoWJ9VC9XPyaU9nH1OUP4TXOP4hrx0uiUTx6J2vkKzPoO7gloZkHWqcP
	 zfDg/0Z0pdDzaW7wBVBoKpz1yBgxpLcaaIoFhFW+4e3jFAHFwG14WM3yknWA+LP9t/w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795408929;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:Content-Type:
	 X-Change-ID:X-Mailer:X-Developer-Signature:X-Developer-Key:
	 Content-Transfer-Encoding;
	bh=YVCntaXptXzPXs2dujESh2ZwQdzejioJ9nbTZWK/igU=;
	b=Q9ajcki8JN1MU5a9EKPwr0mqR9c8L5rZb0amwjYoZXcxbHAhsPC1hJbQqTDXlVdQGPm7
	 Fiyu/sCz7FP6LhAq2T85G8U4O+qCi9H5HEy1p+XoJ9kRSMe5rA9+lCiJlPFuuXpO7299Y
	 GqdvZJCDtZ1T4yqARy4HoXl40w+C51suATk2fYV0n17PTHklI7NHgBdy9hZlsmMS2gPgu
	 AhmAD6erM/DIplYjGHPp6hqdJeI8bSp3igps9iqxF8TuhEbH2ZGeAckkrX70YU991o9R0
	 wi3DASni7lRxOfZD35/tR5K3c+yRhuFaHse7hg2lbKKCj2SYJ9IjimV6OyxMQHWAIGw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=t86VmWUJ;
	arc=none smtp.remote-ip=74.125.82.181
Received: from mail-dy1-f181.google.com (mail-dy1-f181.google.com [74.125.82.181])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 27601606A31E
	for <devicetree@vger.kernel.org>; Mon, 23 Nov 2026 04:42:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 27601606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=t86VmWUJ
Received: by mail-dy1-f181.google.com with SMTP id 5a478bee46e88-38692f62b22so1192695eec.0
        for <devicetree@vger.kernel.org>; Sun, 22 Nov 2026 20:42:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795408927; x=1796013727; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=YVCntaXptXzPXs2dujESh2ZwQdzejioJ9nbTZWK/igU=;
        b=t86VmWUJQrhII/Uf00dc0pqQmRaJ1qtR3husK70yGXr61pGlyOyaHXflkxYhsKkRZf
         eayGknezuGYZOzUL2T/0OJA0G0F9d84kxNUoSUKuXp62rmE5j9ugf5/B/h5CLqJIp5Ws
         05N7RTbg/AjXfisvMKcOyKdIMaR2AKFhmeStwflekWPaOlZ07PusV9A4kqrhqtNwV9yE
         BdjiwG2Y0QOAJAaZexpNUogPk8/YEgts2UNEnmjLVKkm5DXxOIar48lLUPzQ2Yq4CQxv
         dkWeBt9+AsjtMiG1TuMpghAKVF2JekiQUA0O2m/iiPzu1FHG0bo25oPhDIV9UsqPpEtW
         GB4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795408927; x=1796013727;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=YVCntaXptXzPXs2dujESh2ZwQdzejioJ9nbTZWK/igU=;
        b=Jz+N1Z8ZW3LrwD4ci58xKrZ5kdzPgk2MSPw4jNZGx88w5Th4nWKRbHUgj3/X9xOLK3
         AtL2mIbbGyIxg1NmgO6ioRg3c1bUxPYmM31LyCZlCXWH9dPJDOyUQETbXx6fQvZrGlBi
         ulJzF+rM4p0J+Tiysg0mTNleI1vrwTU37/mhDboKoTROlfvMRyEmCZblspW9v8+oOsmo
         nRYdCYADRrD9Q2F0c6eJsWODeOWqdXNYMuzyQwrqrkGk2iTn0Uvg8WJXgth8wS7WV/8r
         nMcJZCNIr1cE3JJvHj4x5Ep8iqCksX7XaBXxmjpQjwGCwWvHBsf854kak2Ufph/v98Zu
         GMHg==
X-Forwarded-Encrypted: i=1; AL+hErGqQtjH+ZNrfbiYa1Kv7IeB856Vg5gpVG80Y8KZ9Zo7VduDp9OVSjLg9wNPI1lDIrHTHOKEaNcVlSV7@vger.kernel.org
X-Gm-Message-State: APuU4Z+X4z7LAePipk+hLQZpB/VE1GKGFfC1Y8zZoP5XA4JCZ0prmXHF
	AYS/PfY0s8+5QBWIdmXs8bPQ+ckZYYycFHcWso2Vjv6jFuZTW9BKq87q
X-Gm-Gg: AZFdTZcZcoT3nUtTZpxEnBnB68UEAXUjvpiGOHpcguEHeDmA9A2/ScI7o1DaDg3Gx9m
	Ao3GG8a9puHm3ZYDOa9J0IwYRul/9VqsbLnrtOpKJo5YMMpPkO3ODaWRZJjzT4bWb1aHfxJzInb
	bvSYO9JIpegkQTaFQe0rbhkbLe48F55+v7MX3SFn1dY/3Yh73LLZmuZydfS0oj8pd/mJdgRrCjQ
	sALz6gX2lz/4IA7+ToqvCDdSYrtG7J+YAZ4TKocX+TrkyYaVIYhYr62dBCM+wAFz5RtOEVvHS1N
	J3CouvE0t1ttLkOmqGrB7NDSoEyyGR4iBkfmRRiRHMUOyGg9bZusybavJPisyrg3/r8Acv64PoW
	G/i5EZk/pL8aMKk5nGbVW2JlrJ0qHRvN6ExWzkyDsvZZ8FhDKO2P1znOa6N04KnsVoZxKmVe9BN
	0muPrwwBrQvI5sr4dDUggkG0d7EZUjOQH0zz8dNPik8tb4GTCmowqY4+1i/k4QhzofJUUb7Dfjq
	LqDpiIcW0n8oV3wi/JjTvQfniKREZnLX2G9O4TjXbbQhy+E83VqEwgIQNHf2O57u9XbGh7PaPY1
	Ytky+osQc31+IKqb32F+1zDV3V0S7snGFmW8hRUSeOJzGQ==
X-Received: by 2002:a05:7300:2728:b0:383:c2f0:e753 with SMTP id 5a478bee46e88-3856c0d0a68mr12512979eec.3.1795408926522;
        Sun, 22 Nov 2026 20:42:06 -0800 (PST)
Received: from morise.tail.syca.top ([20.89.104.82])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3856456e6c6sm28404929eec.2.2026.11.22.20.42.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 22 Nov 2026 20:42:06 -0800 (PST)
From: Zixian Zeng <sycamoremoon376@gmail.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Yixun Lan <dlan@kernel.org>,
	Troy Mitchell <troy.mitchell@linux.spacemit.com>,
	Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Aurelien Jarno <aurelien@aurel32.net>,
	Vivian Wang <wangruikang@iscas.ac.cn>,
	Junhui Liu <junhui.liu@pigmoral.tech>,
	Michael Opdenacker <michael.opdenacker@rootcommit.com>
Cc: Zixian Zeng <sycamoremoon376@gmail.com>,
	devicetree@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	spacemit@lists.linux.dev
Subject: [PATCH] riscv: dts: spacemit: k1: fix the EEPROM page size
Date: Mon, 23 Nov 2026 12:41:58 +0800
Message-ID: <20261123-fix-bpf3-eeprom-v1-1-df8cce6ef2b5@gmail.com>
X-Mailer: git-send-email 2.56.0
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
X-Change-ID: 20261122-fix-bpf3-eeprom-51ba6e0f110a
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795399932; l=3631; i=sycamoremoon376@gmail.com; s=20250113; h=from:subject:message-id; bh=ZpyjTSTFUIhS0d4tphn4fxfvTbp3zPacKqQQgrGQ+so=; b=RvNnAQ77qPUL5wCgqMI0kl7NMSKeS+xd2E3WmHM8XdDNor4jB0xPQE80VkQtY8z2Q6PBXTRUT 1YOHKj+G7HsB/mXpwQGVEf7btPUIUdiskkCZ3EEir7npCKQCDgS9U+z
X-Developer-Key: i=sycamoremoon376@gmail.com; a=ed25519; pk=OYfH6Z2Nx3aU1r0UZdvhskmddV6KC6V1nyFjsQQt4J8=
Content-Transfer-Encoding: 8bit

The bananapi-f3 carries an AT24C02 compatible EEPROM GT24C02B [1]:
256 bytes with an 8-byte write page, which can be found in schematic[2].
The device tree declares pagesize = <16>, which does not match the
eeprom chip datasheet which declares pagesize 8 bytes.
EEPROM pagesize of k1-bananapi-cm6-io[3] and k1-orangepi-rv2[4] changed
together, based on the chip model shown in the schematic diagram.

The TLV EEPROM on this board holds the base MAC address and the MAC count,
so a corrupted write leaves both Ethernet ports without a MAC address,
which is how this was found.

Link: https://www.giantec-semi.com/uploads/20230414/GT24C02B.pdf [1]
Link: https://drive.google.com/file/d/19iLJ5xnCB_oK8VeQjkPGjzAn39WYyylv/view?usp=sharing [2]
Link: https://pan.baidu.com/s/13UTY_qM4gGuVxsZ9U7_Xpw?pwd=8888 [3]
Link: https://drive.google.com/drive/folders/1pcI_U0C3VJKTCg8A1zj08CwNbohnONSR?usp=sharing [4]
Fixes: bfce75e2345f ("riscv: dts: spacemit: add 24c02 eeprom on BPI-F3")
Fixes: 46a8c01700ac ("riscv: dts: spacemit: k1: Add Banana Pi BPI-CM6 IO board")
Fixes: ac436e6879f5 ("riscv: dts: spacemit: enable onboard eeprom for OrangePi")
Signed-off-by: Zixian Zeng <sycamoremoon376@gmail.com>
---
A TLV write through u-boot's i2c_eeprom driver scrambled the EEPROM
contents and left both ports without a MAC address on bananapi-f3.
I checked boards schematic and eeprom chip datasheet of bananapi-f3,
whose links can be found in commit message. After changing pagesize
to 8, TLV write and read works as expected.

Other k1 boards which includes k1-bananapi-cm6-io and k1-orangepi-rv2
changed together. However, I don’t have these two board. Be grateful
if someone could test it. Schematic of k1-orangepi-r2s not found,
so keep it as it is, but true knowledge comes from practice.
---
 arch/riscv/boot/dts/spacemit/k1-bananapi-cm6-io.dts | 2 +-
 arch/riscv/boot/dts/spacemit/k1-bananapi-f3.dts     | 2 +-
 arch/riscv/boot/dts/spacemit/k1-orangepi-rv2.dts    | 2 +-
 3 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/arch/riscv/boot/dts/spacemit/k1-bananapi-cm6-io.dts b/arch/riscv/boot/dts/spacemit/k1-bananapi-cm6-io.dts
index 2c2d78aee98a..23a1323df30d 100644
--- a/arch/riscv/boot/dts/spacemit/k1-bananapi-cm6-io.dts
+++ b/arch/riscv/boot/dts/spacemit/k1-bananapi-cm6-io.dts
@@ -101,7 +101,7 @@ eeprom@54 {
 		compatible = "atmel,24c08";
 		reg = <0x54>;
 		vcc-supply = <&buck3_1v8>;
-		pagesize = <16>;
+		pagesize = <8>;
 		size = <1024>;
 	};
 };
diff --git a/arch/riscv/boot/dts/spacemit/k1-bananapi-f3.dts b/arch/riscv/boot/dts/spacemit/k1-bananapi-f3.dts
index 58035d886bf6..1db896536256 100644
--- a/arch/riscv/boot/dts/spacemit/k1-bananapi-f3.dts
+++ b/arch/riscv/boot/dts/spacemit/k1-bananapi-f3.dts
@@ -195,7 +195,7 @@ eeprom@50 {
 		compatible = "atmel,24c02";
 		reg = <0x50>;
 		vcc-supply = <&buck3_1v8>; /* EEPROM_VCC1V8 */
-		pagesize = <16>;
+		pagesize = <8>;
 		read-only;
 		size = <256>;
 
diff --git a/arch/riscv/boot/dts/spacemit/k1-orangepi-rv2.dts b/arch/riscv/boot/dts/spacemit/k1-orangepi-rv2.dts
index 790234f3550a..8fd95c8f9db2 100644
--- a/arch/riscv/boot/dts/spacemit/k1-orangepi-rv2.dts
+++ b/arch/riscv/boot/dts/spacemit/k1-orangepi-rv2.dts
@@ -185,7 +185,7 @@ &i2c2 {
 	eeprom@50 {
 		compatible = "atmel,24c02";
 		reg = <0x50>;
-		pagesize = <16>;
+		pagesize = <8>;
 		size = <256>;
 		read-only;
 		vcc-supply = <&buck3_1v8>;

---
base-commit: 4843f6873f7c4835e62f2c73ba0fd538e57a2f22
change-id: 20261122-fix-bpf3-eeprom-51ba6e0f110a

Best regards,
--  
Zixian Zeng <sycamoremoon376@gmail.com>

