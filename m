Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.44
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795448152;
	b=EdibYvco1SpNOn2uyteTH8i+Lhav6g+6IQHgyalHL9pGN2/aIECqpITWRSjRQGV53Zyi
	 Zw84Jy5hFdOZhETEnV9z1EhVrPiGSE7yhljCqSsFVJzE+8KDdhMk0bIhTPiD3dEBC10k1
	 P8Vwnc12RsfbASRpKWO7VmLlh4pyNflW1SIJktqeR7PSuW6yVkYOuXOLxMcWMIrAIf/HG
	 x4hnfFmFHS45rH8mYkEcD4bjOjfdYqcFBLaZEV4uuC448gJJ2zH8UrwTIAY+/ZLyJWOzf
	 pFBGylo+jEjZTwrqWOOEnfAP0LS1VFqflnZCurQn0QlIzPDoO/91p/D4t3K9ecFTjpg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795448152;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key;
	bh=1sAjlUWvCwhkxG8QQaXDXYVkbIkuGAQ5dlUtzYiRWcA=;
	b=h4qGJEtILx1VThdinhi/8GS1ZamaIexGuiLa1KR59ALfdpqtJ9RbnZyOgmwF0tYVJyXF
	 PgfppuakPEPBoClCWyAMDjrzbrDhB8rPpWUt6Hd+RwI9M3R0BsKw+zb9/OMj1eKGZF05N
	 lBV27mMJbUBpC6YjL8Ijf2+fs9I+BLHW3bUvtglT5PjoABctPV1vDSheqpx03PrWgGj6N
	 LZKjigalRmMur7TgkwTsu55ixqA8ICt1yvNj6rmLovWFyWVUD+TRm6M+1g8a89EptqinA
	 Jnn/zQGRlKLRwDEKX/SsYjfb76KzRBP1ReB6MK4kDUgimP0BA5CzKhxE90V2PbuXT/w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=flipper.net;
	spf=pass smtp.mailfrom=flipper.net;
	dkim=pass header.d=flipper.net header.i=@flipper.net header.a=rsa-sha256 header.s=google header.b=g84LcuDc;
	arc=none smtp.remote-ip=209.85.128.44
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 36B8C606A685
	for <devicetree@vger.kernel.org>; Mon, 23 Nov 2026 15:35:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 36B8C606A685
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=flipper.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flipper.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=flipper.net header.i=@flipper.net header.a=rsa-sha256 header.s=google header.b=g84LcuDc
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-4bb69f5b161so22134145e9.0
        for <devicetree@vger.kernel.org>; Mon, 23 Nov 2026 07:35:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=flipper.net; s=google; t=1795448150; x=1796052950; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=1sAjlUWvCwhkxG8QQaXDXYVkbIkuGAQ5dlUtzYiRWcA=;
        b=g84LcuDc0xnOorf0PQGSftLe8Fhw5ElncG9wp7zz7ldQjEEA0FxrR/Hd80QE9GqTzp
         /vIVmVcMZ6Yd8T/Eop3TM1e2L9prEGc7EbfV+bvX3vFmrGw+DBipH5V0/9y+nnrsXAPn
         Trqozy8WZQ6qLsEq/5K5gpJjGTzC7TC1lgHhqtyG0qQ1oZoNOAERt48elkuNDcVSb1N3
         2OVaxBmth8cNbs1iiDhxJzudm6WHX3tJERBZ7s1cOBVjQ0ft1Ya4QNcZ+yynmHseCxyA
         WPdl8F3BrE9wV7xcHCSECoGcN6YexjsEvJcUYmBvrjgcbDDL8hjuvRZwlTcpy9J6QAIB
         ZGYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795448150; x=1796052950;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=1sAjlUWvCwhkxG8QQaXDXYVkbIkuGAQ5dlUtzYiRWcA=;
        b=ZBga8HsWglmAblJJIZj2LBP42HWjPBvjpG0L3N7ONNPdpsFx+6usoZhVWaRSAVkVdf
         K5wqmpvrAWf/hy6PqoAaRq7F9lWG0bymnBIU0Ncfexs0GP6JQLGg1XLF+ByP03ZVtZB7
         SpBb9XDI2MER3b0qe0XR59i09ZrwnJEhE7gHckh3phf6lcoBh/Ux1845mOs1s11NhMVd
         5N0xvYUGWSbPKYvaeEjlRIxtDQTdAOpaLEG2uLQlK/7VkBrUmG2fkUUSPiMZF9SM0Xcx
         iGOvqPPeXK2Mvnna3+Ns16NZ60GWWg8oLnntuvmlDaMA1Ei9Hkz2iBEZRsVXUGXtpRer
         p5Ew==
X-Forwarded-Encrypted: i=1; AL+hErHwhX+/3gSBiT4efIaHU2I3Dhpz88rY66loLpjjm9s0bsmYudYzVdHIPiDXJXy2aqbWJ3ASQVtVhM0I@vger.kernel.org
X-Gm-Message-State: APuU4Z8rhFpd0JBX03FVpijw2I4wollUwfdvwl9GT5TZ+Pk2CadZeU+r
	IjrLtCDlyDIH7I6v+paeFhRyynS7N+0AE8jpf5huhLFMReU4QSoCvqSiUvmdyXz76Fc=
X-Gm-Gg: AZFdTZejB98tWoTtKm01AcmOCNZQJCtuCzV0Rpm+8umYXRoB719GvcraRlNzsR2pc44
	mpKnLNwcDkIvE+3d2TQzPt0gY4J32ML6RMT9qrwUoFMoePIj7WdlXbgG74amkr17gtPlzkwqn08
	9KZ8+x0AC7GiFAoB0u2VPIq2jjmUAIDh3WjBDPG/f666weAcFBG0Z6zwe2JywKuHXunfe1GiFUX
	QIpbYC642grN1yL1njYJj9VUyaGjh/4c9LkQl+fEXBwt68U+YSnurhNBVWoNB9inMFtaCWMlxWr
	t5WKxf4vtMX5ZEgA2BzKgpfTMMmoNOU06lbPbSyQfD7l6MvwBhEsXZvguL+SuS6YLyZiQa4kjhu
	cSJDcZ1lxhlhQJ3UMM/VY0OzXOc7X11yvcZOEnezOYkSmp/8NdcGPh5fv+k9PaiaC9KO6J5G4Dy
	es7aqnokoHOTK8tzt7q3Pyklw1CPMtojvUYz+YeP4ZMnM0LdU8HRzdafCzfMsAi7QZP3UcoOA3L
	Ye0LisVZfmQ6rwAxP+rqsTqJbZc/9e/kw97fuIQWbjpp+pGc5dTsr5wat29Up/i/VYILiazBXUM
	SvxCqro+2lpyzUhhs7Wj+xYqCHxRwOUhrmBSqKM/tuBtKO8I/Eida7JIOkOiTUKVpeDoCkAtiRo
	gst1w3Yu/gQ==
X-Received: by 2002:a05:600c:46d3:b0:4a3:12fb:1ee7 with SMTP id 5b1f17b1804b1-4bb88812c9dmr250483325e9.25.1795448150650;
        Mon, 23 Nov 2026 07:35:50 -0800 (PST)
Received: from alchark-surface.localdomain (bba-86-98-194-229.alshamil.net.ae. [86.98.194.229])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb853a1e8bsm305917455e9.9.2026.11.23.07.35.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Nov 2026 07:35:50 -0800 (PST)
From: Alexey Charkov <alchark@flipper.net>
Date: Mon, 23 Nov 2026 19:35:37 +0400
Subject: [PATCH v3 3/5] nvmem: rockchip-otp: Derive MAC addresses from the
 CPU ID
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
Content-Transfer-Encoding: 7bit
Message-Id: <20261123-rk3576-otp-cpuid-mac-v3-3-40c756dcf36f@flipper.net>
References: <20261123-rk3576-otp-cpuid-mac-v3-0-40c756dcf36f@flipper.net>
In-Reply-To: <20261123-rk3576-otp-cpuid-mac-v3-0-40c756dcf36f@flipper.net>
To: Srinivas Kandagatla <srini@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>, 
 =?utf-8?q?Rafa=C5=82_Mi=C5=82ecki?= <rafal@milecki.pl>, 
 Michael Walle <michael@walle.cc>, Miquel Raynal <miquel.raynal@bootlin.com>, 
 Finley Xiao <finley.xiao@rock-chips.com>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Ryan Leung <untilscour@protonmail.com>, 
 Ricardo Pardini <ricardo@pardini.net>, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-rockchip@lists.infradead.org, 
 linux-arm-kernel@lists.infradead.org, Alexey Charkov <alchark@flipper.net>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=4534; i=alchark@flipper.net;
 h=from:subject:message-id; bh=Z7QZS1DoRcR6OqeFUfvFEEWGwZQRoyygyNK/LxTYDrk=;
 b=owGbwMvMwCW2adGNfoHIK0sZT6slMWSzxHp9sFp4ZuvlwG1RL5qmePaxqO1ufVIik1ZckV2hc
 y9M2rK3YyILgxgXg6WYIsvcb0tspxrxzdrl4fEVZg4rE8gQaZEGBiBgYeDLTcwrNdIx0jPVNtQz
 NNIx1jFi4OIUgKk+oM3I8FmjJcDHaPrEB868BXpXlWW3ak/YzcwcecMgSs1k6hWBOQz/UyPfVaS
 mfK7lsZDmOHygeZ1eybbt6lM0FR2uNkkozFnIAQA=
X-Developer-Key: i=alchark@flipper.net; a=openpgp;
 fpr=9DF6A43D95320E9ABA4848F5B2A2D88F1059D4A5

Rockchip bootloaders derive stable Ethernet MAC addresses from the CPU
ID in the OTP memory and patch them into the device tree they pass on.
Kernels started any other way, e.g. straight from the SPL in Falcon
mode, end up with random addresses which change on every boot, even
though the CPU ID is just as readable from Linux.

Implement the derivation for cells marked as "rockchip,cpuid", handing
the result to consumers which ask for the cell as "mac-address", such as
of_get_mac_address(). Leave the CPU ID unchanged for any other reader,
so that the same cell keeps serving the ID itself.

Follow U-Boot's rockchip_setup_macaddr() exactly, so that both yield the
same addresses: hash the CPU ID's lowercase hex string with SHA-256,
take the first six octets as a unicast, locally administered address,
and XOR the cell argument into the last octet, which is how U-Boot gets
eth1addr from ethaddr.

Hooking the derivation into the OTP provider rather than a separate
layout means it works with any fixed layout of the OTP cells, and needs
no per-SoC knowledge, as the cell already gives the CPU ID's location.

Signed-off-by: Alexey Charkov <alchark@flipper.net>
---
 drivers/nvmem/Kconfig        |  4 +++-
 drivers/nvmem/rockchip-otp.c | 45 ++++++++++++++++++++++++++++++++++++++++++++
 2 files changed, 48 insertions(+), 1 deletion(-)

diff --git a/drivers/nvmem/Kconfig b/drivers/nvmem/Kconfig
index d2f5bb236663..5776d4e4b391 100644
--- a/drivers/nvmem/Kconfig
+++ b/drivers/nvmem/Kconfig
@@ -448,9 +448,11 @@ config NVMEM_ROCKCHIP_OTP
 	tristate "Rockchip OTP controller support"
 	depends on ARCH_ROCKCHIP || COMPILE_TEST
 	depends on HAS_IOMEM
+	select CRYPTO_LIB_SHA256
 	help
 	  This is a simple driver to dump specified values of Rockchip SoC
-	  from OTP, such as cpu-leakage.
+	  from OTP, such as cpu-leakage. It also derives stable Ethernet MAC
+	  addresses from the CPU ID, as Rockchip bootloaders do.
 
 	  This driver can also be built as a module. If so, the module
 	  will be called nvmem_rockchip_otp.
diff --git a/drivers/nvmem/rockchip-otp.c b/drivers/nvmem/rockchip-otp.c
index 7eb834516ab4..82c87380b2c0 100644
--- a/drivers/nvmem/rockchip-otp.c
+++ b/drivers/nvmem/rockchip-otp.c
@@ -6,9 +6,12 @@
  * Author: Finley Xiao <finley.xiao@rock-chips.com>
  */
 
+#include <crypto/sha2.h>
 #include <linux/clk.h>
 #include <linux/delay.h>
 #include <linux/device.h>
+#include <linux/etherdevice.h>
+#include <linux/hex.h>
 #include <linux/io.h>
 #include <linux/iopoll.h>
 #include <linux/module.h>
@@ -67,6 +70,8 @@
 #define RK3588_AUTO_EN			BIT(0)
 #define RK3588_RD_DONE			BIT(1)
 
+#define ROCKCHIP_CPUID_LEN		16
+
 struct rockchip_data {
 	int size;
 	int read_offset;
@@ -319,6 +324,45 @@ static int rockchip_otp_read(void *context, unsigned int offset,
 	return ret;
 }
 
+/*
+ * Derive a MAC address from the CPU ID the same way Rockchip bootloaders do
+ * (see rockchip_setup_macaddr() in U-Boot's arch/arm/mach-rockchip/board.c),
+ * for consumers asking for one. Everyone else gets the CPU ID unchanged.
+ *
+ * The cell argument is XORed into the last octet rather than added to the
+ * address, matching how U-Boot derives eth1addr from ethaddr.
+ */
+static int rockchip_otp_cpuid_pp(void *priv, const char *id, int index,
+				 unsigned int offset, void *buf, size_t bytes)
+{
+	char cpuid[ROCKCHIP_CPUID_LEN * 2];
+	u8 digest[SHA256_DIGEST_SIZE];
+	u8 *mac = buf;
+
+	if (!id || strcmp(id, "mac-address"))
+		return 0;
+
+	if (bytes != ROCKCHIP_CPUID_LEN || index < 0 || index > U8_MAX)
+		return -EINVAL;
+
+	bin2hex(cpuid, buf, ROCKCHIP_CPUID_LEN);
+	sha256(cpuid, sizeof(cpuid), digest);
+
+	memcpy(mac, digest, ETH_ALEN);
+	mac[0] &= 0xfe;		/* clear the multicast bit */
+	mac[0] |= 0x02;		/* set the locally administered bit */
+	mac[5] ^= index;
+
+	return ETH_ALEN;
+}
+
+static void rockchip_otp_fixup_dt_cell_info(struct nvmem_device *nvmem,
+					    struct nvmem_cell_info *cell)
+{
+	if (of_device_is_compatible(cell->np, "rockchip,cpuid"))
+		cell->read_post_process = rockchip_otp_cpuid_pp;
+}
+
 static struct nvmem_config otp_config = {
 	.name = "rockchip-otp",
 	.owner = THIS_MODULE,
@@ -328,6 +372,7 @@ static struct nvmem_config otp_config = {
 	.stride = 1,
 	.word_size = sizeof(u8),
 	.reg_read = rockchip_otp_read,
+	.fixup_dt_cell_info = rockchip_otp_fixup_dt_cell_info,
 };
 
 static const char * const px30_otp_clocks[] = {

-- 
2.56.0

