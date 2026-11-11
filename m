Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.52
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794408281;
	b=E2GF6PN0zeCY+3aYIor380iDcLN44y675oYl47pOBfaWoTuLrKgDVjDF8DqRMC8vKhOP
	 MY7ZF0zdxj4wyWQSWjWMx2A5KhUSFjHbxprygxKeRW/vLL4sUb1EJ/BWQIwDRcGjkqjiW
	 3HAGKfDaMrancLprJiXRm55ynM9kIXKOkks0OBNCKZ1cLzqxLHAAOmNYTDHPvtaHRNW0J
	 96lLvZHzHC7/eKoVjEVsnW57H+pLTVmAaAJK35ybB3kVRruyDHQvGiB2sJX6yTSzsRtFR
	 ao56zm0rrudKu9vl5v6kyt5ysUnSZxAHIqNOqqCcrcbUq9eGuRFKQJXtwUpqoHcNTog==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794408281;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-Id:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=LPsq33bOSJgVO/RNV124EKVcCGGrlMvdhjL7wfKrHy8=;
	b=AZ/HfPpisq1KAYqttgS6avc11ajAdRaCnXjkWEmWwiGtC09dThi82MiMJLwbQoAQlZXk
	 Jnr2/ks2gr/gAmqhCnDfqw2YBuUMqliUqZTIq1s/RcZUXnUlt9egNQhPoFfoCGaKUGK+A
	 MK3ynAo3jyZumeNbAV6Hrk6pE33UiGKL16hYASHK/RlT/izRmlrAj9RyG9e/OI/90IPsh
	 nUudNwSJ0HagXg/ysZu2OFhecKFCxkHFqi/q1KOwci6T/e4amyM6USOgCqGg3GfAdwqu6
	 VpwFUUDKwQ1m37XINtsRSTMasjUaL8Haxi+8+WbHld3ZR6NxW9KcYh8wbauVAH95V0A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=k+Swmzkm;
	arc=none smtp.remote-ip=209.85.128.52
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 775D860A380E
	for <devicetree@vger.kernel.org>; Wed, 11 Nov 2026 14:44:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 775D860A380E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=k+Swmzkm
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-4a4d7ae1ae9so30080085e9.1
        for <devicetree@vger.kernel.org>; Wed, 11 Nov 2026 06:44:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794408280; x=1795013080; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=LPsq33bOSJgVO/RNV124EKVcCGGrlMvdhjL7wfKrHy8=;
        b=k+SwmzkmeruMyqeW5z6x/dsExshBytMDpxcO1OU4qU2kAfFNVuzAQtHDrHYdDz8Hvm
         OUTVWbCxynl3CtGFNMp8o95ip7H7qCrf4O6LhRcD83LHbP/PYgnVvUZaJmlWhGa5x4ye
         n61r0y9ZWtacYE/iYoFN16Awu2pzCeBbK6DKAMF0mtTVLikRG4NeubyuQlF5y78PQYbA
         HvE6ncIX0yo6Ivf0fAlIYHFj80507YdfWQS6mwo4eka9u/uBZjTqhRu3dyNjpovlWdeH
         LGurjKJgjfzKrmdes3ZpL4QHaBLzB4aG5TSa3q/Ry1xfjk3b0BtgqZPPlQoCFDt/oENg
         APVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794408280; x=1795013080;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=LPsq33bOSJgVO/RNV124EKVcCGGrlMvdhjL7wfKrHy8=;
        b=u7GPca0JYEWlr5vx3A5Tid0TdbT/aoNt+IpxFWIJaCYXI5kmB0v2nRO4JlX+i/4o+W
         lUYG/kvphyHN15G2gvZtBfK1mmJGm36CNByFtxtVP1ix/5pic3J4bpE7AsNt9BXkyg5Y
         7u79M43lYaguoBOMCZDq3E3A2YeVA/yLNCgwt3qG+xBrO/tlVW0XwxwLfBwUMwxn3PYk
         TEWsInPDckGFZhOinOgM5qttGCWlFj2L6PKSKEmOSKjON/kAemqMkoJgApjlRhwHPspR
         IwMMwSE+SpWIsz1kU1TdQ0zLQJ5NTt3lF22t+DMq8mLnHQNS4TtKyxigF0CWevN/udfD
         0LPg==
X-Forwarded-Encrypted: i=1; AL+hErF5Lc8TmOfZksHHX2rCoOf7zCqzvqnnyyJF6VJIzTV8xG1hUb9eBmabZNab9IapNat6e0GnKePtEKJq@vger.kernel.org
X-Gm-Message-State: APuU4Z8KBl3a2Ydt8OKg2sZENp+al8NJoFwoM48iAXFpCEVnpgddkmCi
	DPuDTtfr1GHItRp9QZ0w0VB1xb6jDt4wSDWD0AByrccEUUBjkrw1dLlR
X-Gm-Gg: AYBFou07Lq8hh0H8jA7fNskk8L/6zrMQCLuedL8hyxV56aLFI/XNi8Fyen+xAZP14E9
	iFaBm0haPIB3XCpb2MkaWWJBn2k7qol5CrzbHTZcWprC+hxeRYRo7H6DkKK3Sp86SXYyZUDJK2s
	Ag9lYrOggpiVYeiE8TuDovb45d4ix7zBB6BbW5joK9Gv49saAabYx/MNbNK20N1wd2mtpEO/yo1
	v49Ojb4gAxRkcLAAKt5dDqtA2VHC/6zgLke0TB5oEX5AQoZpAz65wzOuNxWJags0/TIOAI/vsTZ
	aECGHz51461Zh4BaI2BjzaixNM+R7CuQPTqEgl7qvKopYIGuPvzyz+C8s8mPEp1vmxVo7p11dST
	J7QwKNkCj3pV+nofkqF6c2eTYmj6wAEgIY52iTKC5+jw/j4GRkoJCVobCu16IasAQ6K8GQIXIzV
	oihn0qloT8TuyyT7TcotXLSQo8DU3jzfJtv0cRRNZB/ErW1Lo9gk4YVHACc2o9zrwoSXUa0kAGw
	hNO9z41qQKYHY8luFzyfKYdZEynyQy3NdfUCRKjwpOlt2vp4fs0eoSWYewymVGGcSfQOWW7FKqN
	o41E3zYuHOVHTMW8Y5qYOZFJgZnJufYxVIwfAyJTgORwofhFRQ2zGxwR
X-Received: by 2002:a05:600c:c83:b0:4a2:150f:1605 with SMTP id 5b1f17b1804b1-4ba0936f386mr49865155e9.24.1794408279927;
        Wed, 11 Nov 2026 06:44:39 -0800 (PST)
Received: from dev.Default ([86.127.229.203])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4ba08de826asm46656495e9.0.2026.11.11.06.44.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Nov 2026 06:44:39 -0800 (PST)
From: Agustin Santiago Isasmendi <isasmendi.agus@gmail.com>
To: Navid Ghahremani <ghahramani.navid@gmail.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>
Cc: "David S . Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Junyang Han <han.junyang@zte.com.cn>,
	=?UTF-8?q?Stefan=20D=C3=B6singer?= <stefandoesinger@gmail.com>,
	Felix Fietkau <nbd@nbd.name>,
	netdev@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-wireless@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [RFC PATCH net-next 5/5] net: ethernet: zte: zx279128s: debugfs knobs for the WLAN ring
Date: Wed, 11 Nov 2026 15:44:26 +0100
Message-Id: <20261111144426.1321237-6-isasmendi.agus@gmail.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20261111144426.1321237-1-isasmendi.agus@gmail.com>
References: <20261111144426.1321237-1-isasmendi.agus@gmail.com>
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

wlan_state (counters and port table), wlan_inject_all (inject every
frame of the bound interfaces, as the vendor firmware does, to exercise
the ring and the trap path without flows) and wlan_bind (bind an
interface by name).  Testing aids, kept apart so they can be dropped.

Assisted-by: LLM
Signed-off-by: Agustin Santiago Isasmendi <isasmendi.agus@gmail.com>
---
 drivers/net/ethernet/zte/zx279128s-wlan.c | 34 +++++++++++++++++++++++
 1 file changed, 34 insertions(+)

diff --git a/drivers/net/ethernet/zte/zx279128s-wlan.c b/drivers/net/ethernet/zte/zx279128s-wlan.c
index 6c6f6a36d34f..29970db47a41 100644
--- a/drivers/net/ethernet/zte/zx279128s-wlan.c
+++ b/drivers/net/ethernet/zte/zx279128s-wlan.c
@@ -18,6 +18,7 @@
 #include <linux/platform_device.h>
 #include <linux/seq_file.h>
 #include <linux/tcp.h>
+#include <linux/uaccess.h>
 #include <linux/udp.h>
 #include <net/arp.h>
 #include <net/cfg80211.h>
@@ -751,6 +752,38 @@ static int zx_wlan_state_show(struct seq_file *s, void *data)
 	return 0;
 }
 
+/* Bind an interface by name without waiting for a flow (testing) */
+static ssize_t zx_wlan_bind_write(struct file *file, const char __user *ubuf,
+				  size_t count, loff_t *ppos)
+{
+	struct zx_eth_adapter *adapter = file->private_data;
+	char name[IFNAMSIZ + 1];
+	struct net_device *vif;
+	int ret;
+
+	if (count == 0 || count > IFNAMSIZ)
+		return -EINVAL;
+	if (copy_from_user(name, ubuf, count))
+		return -EFAULT;
+	name[count] = 0;
+	strim(name);
+	vif = dev_get_by_name(dev_net(adapter->wlan->napi.dev), name);
+	if (!vif)
+		return -ENODEV;
+	mutex_lock(&adapter->ppe_lock);
+	ret = zx_wlan_is_ap(vif) ? zx_wlan_port_get(adapter->wlan, vif) : -EINVAL;
+	mutex_unlock(&adapter->ppe_lock);
+	dev_put(vif);
+	return ret < 0 ? ret : count;
+}
+
+static const struct file_operations zx_wlan_bind_fops = {
+	.owner	= THIS_MODULE,
+	.open	= simple_open,
+	.write	= zx_wlan_bind_write,
+	.llseek	= noop_llseek,
+};
+
 void zx_wlan_debugfs_init(struct zx_eth_adapter *adapter, struct dentry *dir)
 {
 	if (!adapter->wlan)
@@ -759,6 +792,7 @@ void zx_wlan_debugfs_init(struct zx_eth_adapter *adapter, struct dentry *dir)
 				    zx_wlan_state_show);
 	debugfs_create_bool("wlan_inject_all", 0600, dir,
 			    &adapter->wlan->inject_all);
+	debugfs_create_file("wlan_bind", 0200, dir, adapter, &zx_wlan_bind_fops);
 }
 
 /* ---- init / fini --------------------------------------------------- */
-- 
2.30.2

