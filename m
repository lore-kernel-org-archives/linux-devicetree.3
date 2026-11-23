Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.41
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795448149;
	b=LDkE/1/F/jBTfGVMPyjdwj09sbQS5ybnmaLuNTGUqFu4721p6R+OhVUnBAVkpC8kq4M4
	 lZihRSKUPNHSz4P3O3cVPQH6+P/nXGCPDMV0JYqLKPXxNxNfrVUQV9tbxVHpvmv0DOll8
	 dWaUPX7CqRb4WiVUX/TPt3KEtUi/nFa8dqKVUVBEM3R6lDS/qZ6Yqz59A2Zq4HR6026sG
	 G924uYjsMRDLRnrCQWI124IbBv5nldkSdZCgr34rnThEyYW+ZkiTY5aFxS0Rwhj3l2+7+
	 kSaW/raSw2gf8KeDSHEmUcBUU8WMrf1wrerQ+jEpx2wdjjQSJLF+bQhs8iYdtNhYQZg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795448149;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key;
	bh=aHa4P0YtaZuvv8+v7789rnOLQIKeJc0wIhDUBtVf6zY=;
	b=pr/UQ+c7uNc5/9QCTD/ikGGQLYKW6MDdKburjrNtLVy0PRngEUbfCY834UNvM8juFreT
	 VK1lCm3f8logcRbg/K+F82shGu818ePlAjC2REMz9T+OylDDA4mYMI2KLVxn72HOoSh79
	 IBnWPZVfI1+u6kS8sSiFodR9iyfSWgNi+j1QLjth5bVwwHFGNQ/QShkpTEKCV5nkGsiXx
	 aSY6DsHeTKWlZaUQ9m34nR6gVsfGWMZw1gDnuccNu4YsMPZCS75WiT7BdVyOM2KtRkeY8
	 jzKtqe/OJs5Xpmh39K/xbzwMSxx5atGpPlnjXaSATz5UB7XJcL4rgLQsnf19VtX/4aQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=flipper.net;
	spf=pass smtp.mailfrom=flipper.net;
	dkim=pass header.d=flipper.net header.i=@flipper.net header.a=rsa-sha256 header.s=google header.b=XQonE5Qm;
	arc=none smtp.remote-ip=209.85.128.41
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 397AF606A33A
	for <devicetree@vger.kernel.org>; Mon, 23 Nov 2026 15:35:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 397AF606A33A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=flipper.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flipper.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=flipper.net header.i=@flipper.net header.a=rsa-sha256 header.s=google header.b=XQonE5Qm
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-4bb5b8ef642so28959625e9.1
        for <devicetree@vger.kernel.org>; Mon, 23 Nov 2026 07:35:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=flipper.net; s=google; t=1795448147; x=1796052947; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=aHa4P0YtaZuvv8+v7789rnOLQIKeJc0wIhDUBtVf6zY=;
        b=XQonE5QmTSyDMfonUm0D6odshnwM5tHOIljHA3Fsj/l7JPAQZ6yqeSd0FBeqomnf9p
         2IvE5oSqWzvd0pOwxvL4nJFAQ7W983UufoZYgzJoPuvjghxpFNfAfZ7ANEd6N60lzSpK
         4M9ezOaC/V0jPwP8a8u/KPnz16oBHIZcqc96L4RXOv4O40sM2TfW5/I8tJ98PPypty0n
         OQH1ORTWf7ObcFYZ4mCMk7PMEVTPH221p+hGglE9y18vSSDkcRnr5WiwQ8H4Bgnsiyie
         9CEZcYw4ETZTN08iJXmc3LaxJoTvhTOSm93lmJuiQKIC1S7xrlG10KEhmElWLDZYRmAN
         XFCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795448147; x=1796052947;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=aHa4P0YtaZuvv8+v7789rnOLQIKeJc0wIhDUBtVf6zY=;
        b=eZHs8DEpH8SHds5ilOvZPzBJe4hvuO3L5h1RpRcWx6QwMqkppvZt+GhXRxJ5WhtLXs
         isLljBkHAAOdN6p/pwyPmbr13dhtdKWbQ7uYw5ESdMF2a4L2zIqjw9CvpRtRuwlmblO8
         TZDP5Um+A0lBOVWrIsW6uuOR8L+fHRevcZgtBwzJlzZs3trYNZISI6DLk7lpaSLuJR2p
         5huaNyzbdgQ4oIBMGl8EmywMCZBZvyWVD5C5bjeFT/Pv20O2owHn20RTlD6WwS1zTUif
         rgDsSdtpH071tojgMiUJQA1+/nH+tLNJ9nCoNDKTIvz+H9+lRHPL+D8K4JOmqUSJB8Yi
         3VLw==
X-Forwarded-Encrypted: i=1; AL+hErElHmjaqtew+e4rA5vn/AYibtrjTd/95FjLzcgLvBWsTBSHtY+6b1ZX1q5o3qW0JVR+Jh0HafAQF6SR@vger.kernel.org
X-Gm-Message-State: APuU4Z8AvxmLTXbXna63Olz0lU/omUbGM6S7jpA4/GxX8zaBCpFi0B2V
	aofnZ5Uj45mNjFUcBRU2DFIcu2xc0NSiLorMakLBHUBcZLvbGL5P7ZAjdpO7a2jECcA=
X-Gm-Gg: AZFdTZeen9h3fvkm1RfetkNhPRWbYThL2Fw3MksL0kmrB83Z9LKfuGizqo9xOivQVli
	+DNNxcMmYgr0brZi40j3bz30p1IOiFkREsJTHYMVQ6IDqb9hWhu0ChbImjuh/eBqmlMXUsGnrla
	GUuLmY7Wv7U+VvzTmr26N96B4PLIbEm4lmfnE5R2Mp77XXoBBztsEinIcKclR+hrytuMlMzumWO
	/oCzXI50jyGa8C/a7NTRfrana11JcmnM8f+fOqHhiTp2HHnWjB8a7XnSu0nBcnVC0oQMmcbSE6X
	qruqlPDh3nPUszXgqH2Sqg/HxJ4WDIkYGm1N7NpACigBHWcsbQlJ24ZWhCMSxOZ0N6S+SLRu4Xu
	+LIZmqUBhAv59GBgaSewD2ygPT7WuepwwmrASMRa09StG9tW7LUvn0CGqJyB9jVHQJXS4IG2i3P
	7Mis+4C0zAxGZnUSqOw83YwfpYbhuGJ7KfrRikmT8tUtg3gZ9K45zWIdEkOzmwB9DQrr9xTUSGy
	e2sduHsS4uIY6L/7q7BLNZnASAvuazGt1woO7NrYVEWjC5KaINhY80+LRu1cpAcPbhDqyDtJ3LL
	nIN/3cOSgPQneEjegHl/gNxSXedfwD9RZZNXgbQXFSN+A+faXHGMJm2UjU4xcsacrcjpDSAZhjY
	8ubBMCNP+ZYEAYK2N/aQtT50j8HDkPng=
X-Received: by 2002:a05:600c:64c6:b0:4bb:6a75:d04f with SMTP id 5b1f17b1804b1-4bb88807d96mr234285915e9.8.1795448147605;
        Mon, 23 Nov 2026 07:35:47 -0800 (PST)
Received: from alchark-surface.localdomain (bba-86-98-194-229.alshamil.net.ae. [86.98.194.229])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb853a1e8bsm305917455e9.9.2026.11.23.07.35.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Nov 2026 07:35:47 -0800 (PST)
From: Alexey Charkov <alchark@flipper.net>
Date: Mon, 23 Nov 2026 19:35:36 +0400
Subject: [PATCH v3 2/5] nvmem: core: Let read post-processing return a
 shorter length
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
Message-Id: <20261123-rk3576-otp-cpuid-mac-v3-2-40c756dcf36f@flipper.net>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=3605; i=alchark@flipper.net;
 h=from:subject:message-id; bh=nTVuYbBKOZbvakHzhdzTWG9sbZJz+RCYmADvGAiJs8A=;
 b=owGbwMvMwCW2adGNfoHIK0sZT6slMWSzxHoeiGEsNpDQ2b79kdqy2a6JKx8U5nXE+tYzXI6xP
 M0k6M7XMZGFQYyLwVJMkWXutyW2U434Zu3y8PgKM4eVCWSItEgDAxCwMPDlJuaVGukY6ZlqG+oZ
 GukY6xgxcHEKwFSHWjD8j7pj0Gc8Q0hot/Kan0u63S6+/brq6gyxjsg2JyYvhffL4hkZvkaZS8/
 I0Tpd8L1LgX+fwrR7gSt9plo+E3fbZyMzd2cFCwA=
X-Developer-Key: i=alchark@flipper.net; a=openpgp;
 fpr=9DF6A43D95320E9ABA4848F5B2A2D88F1059D4A5

A cell can hold data from which a provider derives a shorter value for
some of its consumers, while others still need the raw cell content. A
CPU ID which serves as the base for MAC addresses is one example: the
MAC address consumer needs six bytes, whereas anyone after the ID itself
needs all of it. The post-processing hook has no way to express that,
as the reported length is always the full cell size, and consumers such
as of_get_mac_address() reject anything but the exact length they
expect.

Let the hook return the shortened length of its output instead of 0,
and zero the buffer beyond it, so that a caller ignoring the reported
length sees no leftovers of the raw cell. Reject a length beyond the
cell size as a bug in the hook. Every existing hook returns 0 on
success, so their behaviour does not change. Clamp the sysfs cell
attribute read to the reported length, as it can now be shorter than
the attribute size.

Signed-off-by: Alexey Charkov <alchark@flipper.net>
---
 drivers/nvmem/core.c           | 17 ++++++++++++++---
 include/linux/nvmem-provider.h |  8 +++++++-
 2 files changed, 21 insertions(+), 4 deletions(-)

diff --git a/drivers/nvmem/core.c b/drivers/nvmem/core.c
index d976c0d6603b..dde77f78e109 100644
--- a/drivers/nvmem/core.c
+++ b/drivers/nvmem/core.c
@@ -384,7 +384,8 @@ static ssize_t nvmem_cell_attr_read(struct file *filp, struct kobject *kobj,
 		goto destroy_cell;
 	}
 
-	read_len = min_t(unsigned int, cell_sz - pos, count);
+	/* Post-processing may have left less data than the attribute size */
+	read_len = pos < cell_sz ? min_t(size_t, cell_sz - pos, count) : 0;
 	memcpy(buf, content + pos, read_len);
 	kfree(content);
 
@@ -1647,6 +1648,7 @@ static int __nvmem_cell_read(struct nvmem_device *nvmem,
 			     struct nvmem_cell_entry *cell,
 			     void *buf, size_t *len, const char *id, int index)
 {
+	size_t out_len = cell->bytes;
 	int rc;
 
 	rc = nvmem_reg_read(nvmem, cell->offset, buf, cell->raw_len);
@@ -1661,12 +1663,21 @@ static int __nvmem_cell_read(struct nvmem_device *nvmem,
 	if (cell->read_post_process) {
 		rc = cell->read_post_process(cell->priv, id, index,
 					     cell->offset, buf, cell->raw_len);
-		if (rc)
+		if (rc < 0)
 			return rc;
+
+		/* The post-processor may have shrunk the data: drop the rest */
+		if (rc > 0) {
+			if (WARN_ON_ONCE(rc > cell->bytes))
+				return -EINVAL;
+
+			out_len = rc;
+			memset(buf + out_len, 0, cell->bytes - out_len);
+		}
 	}
 
 	if (len)
-		*len = cell->bytes;
+		*len = out_len;
 
 	return 0;
 }
diff --git a/include/linux/nvmem-provider.h b/include/linux/nvmem-provider.h
index 6063fe5b7784..a95529aa3e80 100644
--- a/include/linux/nvmem-provider.h
+++ b/include/linux/nvmem-provider.h
@@ -20,7 +20,13 @@ typedef int (*nvmem_reg_read_t)(void *priv, unsigned int offset,
 				void *val, size_t bytes);
 typedef int (*nvmem_reg_write_t)(void *priv, unsigned int offset,
 				 void *val, size_t bytes);
-/* used for vendor specific post processing of cell data */
+/*
+ * Used for vendor specific post processing of cell data. Returns 0 if the
+ * data keeps the cell size (the cell's bytes, not the raw length passed in),
+ * the length of the processed data if it ends up shorter (1 up to the cell
+ * size), or a negative error code. The core zeroes the buffer beyond a
+ * shortened length. An empty result cannot be reported.
+ */
 typedef int (*nvmem_cell_post_process_t)(void *priv, const char *id, int index,
 					 unsigned int offset, void *buf,
 					 size_t bytes);

-- 
2.56.0

