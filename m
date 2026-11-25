Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.45
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795635425;
	b=Ny/EPxPUBSyZURDpmWlzo3U4N2Lnb3/T/DWEG6EatumzgP/XjkXjDMcGQRmf0REMeWCX
	 eBWBjtjRg8Gjw+Nn8ne/f7HMPcOaR4V0hEfT37uQXym0BJIWLLDoJuKl05y3psa3oKTVf
	 jUK8YtgfGRNx35SJ+bSeoPxc7CGwXb6C38fNpEbaZW1nvbj8kwDYKbXx3SpO2fakHL9Th
	 Lbx7OdzeuQsW/HI2n5KWudQWEMWP5GQ2aLtKtLGL9bKcvTM6f4BT3mb2Qk5hw5dQf/7cz
	 VsZQNChRIOzwUH40e34Gn8KeDOBm5LWCOY9UAuMuF0qW7UZNvrCTI4nSJaqxe0UgnTg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795635425;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key;
	bh=AKIcUxt+msSiiJz1d9kZ/ecSgsFVs8DrJA/QJHIEgRo=;
	b=K+N6PBNrk8Jz6XxhSl6O9OFZfdnGVOdyf/tsPTqSY4d6e9SuRBqCiphPtFFThktXlF9q
	 k/URfz+N8DBal/aMlyqPoHXOSH7W4mrHTqG9mXNKNndehn76v9AsFD2NbJlnJYch+biSf
	 ++H4SRSNTjrhpbnntnL10Cfg/n57ZsBULHiJm0nDEZUe3VxibJLVXgjBg+7blDglln+Te
	 pZId3CHtfvmI5npgJOHpQcQ+3fvqXBO0pUiQm9EVXaVcTpgrg9y4ff6EmhwElZgsdMURu
	 8TuMLIXGe8YM9SCgvDUsGf3RjtbrS87u/m3hc8pKiXr2GAcRIbS/WHyQuco/mLJivBg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=flipper.net;
	spf=pass smtp.mailfrom=flipper.net;
	dkim=pass header.d=flipper.net header.i=@flipper.net header.a=rsa-sha256 header.s=google header.b=emjOuodt;
	arc=none smtp.remote-ip=209.85.221.45
Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 75596606A338
	for <devicetree@vger.kernel.org>; Wed, 25 Nov 2026 19:37:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 75596606A338
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=flipper.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flipper.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=flipper.net header.i=@flipper.net header.a=rsa-sha256 header.s=google header.b=emjOuodt
Received: by mail-wr1-f45.google.com with SMTP id ffacd0b85a97d-490d59c3edaso4231915f8f.1
        for <devicetree@vger.kernel.org>; Wed, 25 Nov 2026 11:37:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=flipper.net; s=google; t=1795635423; x=1796240223; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=AKIcUxt+msSiiJz1d9kZ/ecSgsFVs8DrJA/QJHIEgRo=;
        b=emjOuodt0lrrDxLhVQgd3bESlTwcdaqfkE5AlM5X1r103Fv5cRFsnjDSDIuzQkUSvm
         WZSIsFNnw3nZdEZPmZIROIWvEkuuPj5VBRK8DpJ/VTx/6x9hQ5ueEq3lClxdBFmDQjJC
         EWzKMfRyJ21y9ISENg/ztotTbov2UY2ewEK+prZVzSSPwe80LJCttBKkudMnrQSDNgdq
         s3H6gWHBf8mJGpF6/7fjpFdJKwpT2ONhx/2WDSoBUGTP9bMoiT9SLjg1d1PnELJv/XZo
         DmWZB3EisV8Uw2m5YIcTJFtFxqu5pBgDaKPqhr+dY0sU/e45tmrNwL3boCrIf3Fxc+Er
         KIgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795635423; x=1796240223;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=AKIcUxt+msSiiJz1d9kZ/ecSgsFVs8DrJA/QJHIEgRo=;
        b=I5vO+GDGDXLdoC0mZ9s7peca/w5ucTAV4ZRV1bZeGTzHxdN5O0lo+PYUDBvYWFtqgE
         8t80TxQmkQuT5hUmxSVFSRA4DqJu71Xyer/1TIQflq7o09NA98RcZtroyUncVgOht6Th
         P+iHW5h+lB6UfZQVLesd9HQGEbsTKuD2DOkIQODDFTCZnzUTFdvmOT4AqP0Pf4q+pWps
         Xwm90ZDEIBbhS9x5E8yiCBWHbEfnfpMKGq/0Q7onz77Dt6ndU7ssbpUk+0g/pZA6TaCd
         aWaPc32PwkuT81l++uFlxxpXOyS8MVUiyXRrJQj8wlFOPuj8HcKjC3qAOUnlfLMwY2h2
         JoIQ==
X-Forwarded-Encrypted: i=1; AL+hErFSijg1on/Mtsy8KHLyTUX3vabt9KGjKKCZeJ0qCapnFYYHRZOFx4/2o8d8kfI7LeVNA4Tn9HAp2oBN@vger.kernel.org
X-Gm-Message-State: APuU4Z/GEiQxpoUYV7sGfzjTb/zgWsX7fvskXXiWFJPMNovnamlt+uFn
	B1XMy4qWh5bDRiPrnAC5kqriubX4OFWl1ziLRLXn8fzvezujh6rruNJVpWgSOs1IO60=
X-Gm-Gg: AZFdTZckCkIqvNCsqZratphlV93Oe2DLMru6F6w+6ApgIBZ7HkfcbW3ShVHBIwzxi1c
	yjJBmuedtk6P7/Ifl7T1r1KmIy9qdy2p48zi3t4W1kQ9Q838Y47rH3gueN+XaKyi1np3NzFDaBz
	uqUkmx0JD9b5XZ6m2OUwENQrYMH8kZ9aADZ5oS3a1OCamvz1f9P0I6q2WA/moyu2Ttbb2/x4HPe
	6nVRgF4yCu92ZWVG9UfnNpIcw2JBlKc6UcFJ/3gWAueHjlb+aUr8WBd1s9OFTXBOMED1yeRxrDj
	qV5wIYFUndrpr5uneVxxM0hx/NbO7ZRKK8USJ5lOpLoHW2RguYPOAHbmt4zJh/t1/9hcPx7EYmB
	I3DiwWDjmcmEJ138a3BNXx3G1OcqMc/KV4MzWRE3Vpsg8If4vKZqU9a6rf/6QXpCtZoiNILfYmy
	oOsSegpxPuCRokvb9aoEiAluN0bqRtJDM1qXoFRXCnV8F+2Foxbjx0mQhgkKOqMtJflYU0jRFTt
	7WAA6qzmZ5o6caeVoAgH/IkWxzSaB+PNBSrrpMVa+j19JdgRkvrL/FRO61Pm5Xtnopg8bR5HmEK
	xL055nwOee4MV1J8dm3yRuYMxOnmPKC5wiToPGVbyOCuCva28oNay0euL467dwx+K1YDJQLIscn
	CfEoQ/SMEOQ==
X-Received: by 2002:a05:6000:4310:b0:4a9:6c58:178a with SMTP id ffacd0b85a97d-4aa55bfeb43mr44826785f8f.12.1795635422820;
        Wed, 25 Nov 2026 11:37:02 -0800 (PST)
Received: from alchark-surface.localdomain (bba-86-98-194-229.alshamil.net.ae. [86.98.194.229])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4ab6baa3882sm35614063f8f.49.2026.11.25.11.36.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Nov 2026 11:37:02 -0800 (PST)
From: Alexey Charkov <alchark@flipper.net>
Date: Wed, 25 Nov 2026 23:36:40 +0400
Subject: [PATCH v5 3/5] net: of_net: Derive MAC addresses from a unique
 device ID
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
Message-Id: <20261125-rk3576-otp-cpuid-mac-v5-3-b3125c9a5fc8@flipper.net>
References: <20261125-rk3576-otp-cpuid-mac-v5-0-b3125c9a5fc8@flipper.net>
In-Reply-To: <20261125-rk3576-otp-cpuid-mac-v5-0-b3125c9a5fc8@flipper.net>
To: Srinivas Kandagatla <srini@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>, 
 =?utf-8?q?Rafa=C5=82_Mi=C5=82ecki?= <rafal@milecki.pl>, 
 Andrew Lunn <andrew+netdev@lunn.ch>, 
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@kernel.org>, 
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
 Andrew Lunn <andrew@lunn.ch>, Heiner Kallweit <hkallweit1@gmail.com>, 
 Russell King <linux@armlinux.org.uk>, Willem de Bruijn <willemb@google.com>, 
 Simon Horman <horms@kernel.org>
Cc: Ryan Leung <untilscour@protonmail.com>, 
 Ricardo Pardini <ricardo@pardini.net>, devicetree@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, 
 netdev@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Alexey Charkov <alchark@flipper.net>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=5556; i=alchark@flipper.net;
 h=from:subject:message-id; bh=+mHeuNbPVMSogKiUzepCmrFMa5pw6cOuPMEgrE/36/E=;
 b=owGbwMvMwCW2adGNfoHIK0sZT6slMWSzW5ztWZi1XclPvPDLBJ0+/qO+F6L3d00+eUdB54Cfa
 gzP75WLOyayMIhxMViKKbLM/bbEdqoR36xdHh5fYeawMoEMkRZpYAACFga+3MS8UiMdIz1TbUM9
 QyMdYx0jBi5OAZjqfh1Ghg++hzyqdq7hMnXJCz4VLL09wGPhuZsrLop3898tNlzWs53hr9zCG/d
 6909ueLwulX3HAnNRJ5mwR7E5K1lfej+e9a3ciB8A
X-Developer-Key: i=alchark@flipper.net; a=openpgp;
 fpr=9DF6A43D95320E9ABA4848F5B2A2D88F1059D4A5

Bootloaders on several platforms derive a stable MAC address from an
identifier unique to the chip, such as a SoC serial number in OTP
memory, so that boards without dedicated storage for an address still
get a persistent one. They patch the result into the device tree they
pass on, which leaves kernels started any other way, e.g. straight from
the SPL in Falcon mode, with a random address changing on every boot.

Derive the address in of_get_mac_address() instead, as the last resort
after any stored one, from a "unique-id" NVMEM cell. Doing it here
rather than in individual drivers lets any controller with a device tree
node use it, including PCIe ones. Pick the derivation by the compatible
of the referenced cell, as the algorithms differ between vendors, and
index the addresses by the device's "ethernetN" alias, which is how the
bootloaders assign them to interfaces.

Start with Rockchip, whose bootloaders hash the CPU ID as a lowercase
hex string with SHA-256 and XOR the index into the last octet. Follow
U-Boot's rockchip_setup_macaddr() exactly, so that both yield the same
addresses.

Suggested-by: Andrew Lunn <andrew@lunn.ch>
Signed-off-by: Alexey Charkov <alchark@flipper.net>
---
 net/core/of_net.c | 105 ++++++++++++++++++++++++++++++++++++++++++++++++++++--
 1 file changed, 103 insertions(+), 2 deletions(-)

diff --git a/net/core/of_net.c b/net/core/of_net.c
index 93ea425b9248..1f9858d2d444 100644
--- a/net/core/of_net.c
+++ b/net/core/of_net.c
@@ -4,7 +4,9 @@
  *
  * Initially copied out of arch/powerpc/kernel/prom_parse.c
  */
+#include <crypto/sha2.h>
 #include <linux/etherdevice.h>
+#include <linux/hex.h>
 #include <linux/kernel.h>
 #include <linux/of_net.h>
 #include <linux/of_platform.h>
@@ -97,6 +99,99 @@ int of_get_mac_address_nvmem(struct device_node *np, u8 *addr)
 }
 EXPORT_SYMBOL(of_get_mac_address_nvmem);
 
+#define ROCKCHIP_CPUID_LEN	16
+
+/*
+ * Rockchip bootloaders hash the CPU ID as a lowercase hex string with SHA-256
+ * and XOR the index into the last octet, see rockchip_setup_macaddr() in
+ * U-Boot's arch/arm/mach-rockchip/board.c.
+ */
+static int of_mac_from_rockchip_cpuid(const u8 *id, size_t len, int index,
+				      u8 *addr)
+{
+	char hex[ROCKCHIP_CPUID_LEN * 2];
+	u8 digest[SHA256_DIGEST_SIZE];
+
+	if (len != ROCKCHIP_CPUID_LEN || index > U8_MAX)
+		return -EINVAL;
+
+	bin2hex(hex, id, ROCKCHIP_CPUID_LEN);
+	sha256(hex, sizeof(hex), digest);
+
+	memcpy(addr, digest, ETH_ALEN);
+	addr[0] &= 0xfe;	/* clear the multicast bit */
+	addr[0] |= 0x02;	/* set the locally administered bit */
+	addr[5] ^= index;
+
+	return 0;
+}
+
+struct of_mac_unique_id {
+	const char *compatible;
+	int (*derive)(const u8 *id, size_t len, int index, u8 *addr);
+};
+
+/* Derivations by the compatible of the unique ID cell */
+static const struct of_mac_unique_id of_mac_unique_ids[] = {
+	{ "rockchip,cpuid", of_mac_from_rockchip_cpuid },
+};
+
+/*
+ * Derive a MAC address from a "unique-id" NVMEM cell the way the cell's
+ * binding defines it, indexed by the "ethernetN" alias of the device, as that
+ * is how bootloaders assign the derived addresses to interfaces.
+ */
+static int of_get_mac_address_unique_id(struct device_node *np, u8 *addr)
+{
+	const struct of_mac_unique_id *entry = NULL;
+	struct of_phandle_args cell_spec;
+	struct nvmem_cell *cell;
+	int index, alias, ret, i;
+	size_t len;
+	u8 *id;
+
+	index = of_property_match_string(np, "nvmem-cell-names", "unique-id");
+	if (index < 0)
+		return -ENOENT;
+
+	ret = of_parse_phandle_with_optional_args(np, "nvmem-cells",
+						  "#nvmem-cell-cells",
+						  index, &cell_spec);
+	if (ret)
+		return ret;
+
+	for (i = 0; i < ARRAY_SIZE(of_mac_unique_ids); i++) {
+		if (of_device_is_compatible(cell_spec.np,
+					    of_mac_unique_ids[i].compatible)) {
+			entry = &of_mac_unique_ids[i];
+			break;
+		}
+	}
+	of_node_put(cell_spec.np);
+	if (!entry)
+		return -EOPNOTSUPP;
+
+	alias = of_alias_get_id(np, "ethernet");
+	if (alias < 0)
+		return alias;
+
+	cell = of_nvmem_cell_get(np, "unique-id");
+	if (IS_ERR(cell))
+		return PTR_ERR(cell);
+
+	id = nvmem_cell_read(cell, &len);
+	nvmem_cell_put(cell);
+	if (IS_ERR(id))
+		return PTR_ERR(id);
+
+	ret = entry->derive(id, len, alias, addr);
+	kfree(id);
+	if (ret)
+		return ret;
+
+	return is_valid_ether_addr(addr) ? 0 : -EINVAL;
+}
+
 /**
  * of_get_mac_address()
  * @np:		Caller's Device Node
@@ -108,7 +203,9 @@ EXPORT_SYMBOL(of_get_mac_address_nvmem);
  * because that is the default address. If that isn't set, then the obsolete
  * 'address' is checked, just in case we're using an old device tree. If any
  * of the above isn't set, then try to get MAC address from nvmem cell named
- * 'mac-address'.
+ * 'mac-address'. As the last resort, derive one from an identifier unique to
+ * the device in an nvmem cell named 'unique-id', if the way to do so is known
+ * for that cell.
  *
  * Note that the 'address' property is supposed to contain a virtual address of
  * the register set, but some DTS files have redefined that property to be the
@@ -142,7 +239,11 @@ int of_get_mac_address(struct device_node *np, u8 *addr)
 	if (!ret)
 		return 0;
 
-	return of_get_mac_address_nvmem(np, addr);
+	ret = of_get_mac_address_nvmem(np, addr);
+	if (!ret || ret == -EPROBE_DEFER)
+		return ret;
+
+	return of_get_mac_address_unique_id(np, addr);
 }
 EXPORT_SYMBOL(of_get_mac_address);
 

-- 
2.56.0

