Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.54
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794919220;
	b=b+h4TfZrlXEQg5iuGGgsvnoY87klwuDP97aO6FjA4yBJpzQjKl8vJiJyDxPQYej0fQdW
	 FNX1uDTcewgGqyyWSaaqnxLzm7A5IdX1WSwTehlazd/oXFf0RZF9fgnisKTo949+1uptl
	 PDdfmjgby4bt7Vo/gJW1Dz0gcNQTjvHc9EnabjEgymD4+wsZJfjwdDEt5zIR4pvsiY7X1
	 NEbXMGGZlFv3rgaUzKwQV+X0evcPBnGxsiEY8PbEN42nF8C6SkhxhHMsZUh71GJDTxcjD
	 tlPsKzj+AfWQfEBa/0GTNNNtyi3QAio/EfhccT8I62q7p4TD3eC+gBwPo3uNXGpU7zg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794919220;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=dAjpKPDMJcjUB/FWtU0ouqdhsMiA0bngh4+ryluV0wA=;
	b=cPbVhChiOvPINAWZ5DL81a5SQPb2kJZAzDx66DzQyQe92j7edqlVZxgizOrwuIKJgTkD
	 U1pRws+rTR5cEyGIojjo9x0RQJzhorm0QWypbzqCR756XrqJQcGDA0UX/sXM1cCYTKuUO
	 3rrUIP80CpgBckthwcCGvtbEFIyeCpO7ZiccN5qvDEMend7PZn0nDlplJa13JPiDDzdtH
	 7iYFHzYrF0dcmq+n/0q6+7+JDdV3D59AmMlTPN6E2IYRHIjbih1Nobswgqi9xatkYBUJN
	 +YZsrSBlX0ZpZ6WTKjjkXhpxWAUkOT0XjCL1iIYSrHGRtpLqrPM6DEVCKjHp2laML7Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=cD8I7k4x;
	arc=none smtp.remote-ip=209.85.128.54
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AE4C9606C2DE
	for <devicetree@vger.kernel.org>; Tue, 17 Nov 2026 12:40:19 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org AE4C9606C2DE
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=cD8I7k4x
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-4a5177d78c7so47828695e9.2
        for <devicetree@vger.kernel.org>; Tue, 17 Nov 2026 04:40:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794919218; x=1795524018; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=dAjpKPDMJcjUB/FWtU0ouqdhsMiA0bngh4+ryluV0wA=;
        b=cD8I7k4xDGq/qBARL1vrdzp6+zD8+TGMO3ILYOwEhwvbBTbkFKokDA67pD0xhaRcx5
         l25xvG3H1BjIgmcC24KztZzkdeblUuckTV9neVu0CCs8onFLtmVNk+ICrdt6cmtpkfAx
         NTwhd7Rt23vZp79UHXVk/O0zPc6njAMDkXvLrlnq9G0qX5sCBfLbnWTv3ujpFpBl1V2T
         YB2DtCZ2GVP1Lg+cAsrz9UN89V4eZ4eewqaJbKNqLyGONEXdRCynnp2o3mH2KAjCrQsU
         EPZQx5kN2ucNg7FTkd8yi/RSb6yjTIyruRiDvxsjrtKnBnpaUoy6DKRTo2OMMH5CkoWG
         6DZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794919218; x=1795524018;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=dAjpKPDMJcjUB/FWtU0ouqdhsMiA0bngh4+ryluV0wA=;
        b=02y2v4yW/4o0sWs+cqWta0kEyVh9HMu2god61ZWijsY605stzaUXQ3IhPM5JnMKdDi
         7Z2XrhmVhCWx3ZV+tUWkFeqNGWQkoJOQVhKC+Naat9nf6E4b35Z0a2uvwTJLSWfR0mtq
         Glav8SNpDF8e0t/ZiB5kYiyP+nevApK3PyPF6WqFX6hy6l55tn85OT07PEnr2QlDZY14
         STF1c7VYoJNAoTmgJ/23n2TBsV4yGMUEu8pLY6gew4M3+mPSVZtE8VKkWW1TlXpoAme5
         cnF2OpF/kOkYIKZZ3NZME85DJV4MferabtozqIea82bkuaDnIwV6qAvFr4YcNvNQquXD
         HcAQ==
X-Forwarded-Encrypted: i=1; AL+hErHlY5X3qodEm1Hu8RGdy2iqvqSGPwUXhWqr2pAkOcvDup9x7zGMosS7gPgbkna7w1sBAZneG5kCbGPg@vger.kernel.org
X-Gm-Message-State: APuU4Z+51664tTpgIF9/YNpmhsRH9XsBPFlWjj4AFY1iA92UhI8BvTto
	p5+RpLT9SzII6LbB7OQfu/x1M/ycfAjfJQXCkCtqs4lC3MXYgW8ABVmv
X-Gm-Gg: AYBFou16CAwFKI8EU39Z/MTZyub04F8QqndTM200/YeW9voTF6PcGk+BGkVJsdvJ3dR
	rH8BMphiDow3pYqiKbq457lTRMYn1HYj9mfHIjWaYXELkEZEvzT6YEi2F1SJWRw+JrfkILdJ5sw
	mmRxOxyYWq43Mck8KIbwY7YGq61b9znbaW71CCyHNFpj+ifTPU15uNh6gY7ngGR4BNB3WuQFeO8
	TZETKwUjMvVczgfudiL8BwJvOg/kQknnZxVQnLwMuz9wc6O5he9KXph6TznRRyr7RW75rkPqy3O
	BseZcOKhCKCQR0xG/vN/ZDugUAFNCuf4K+0TZx4fFKpuw9TXGmrEzsVilXz9lwk3jYCZMQLUCx9
	avir4fEOnGwKV8s7Ems13O2WUTsLofcnAb5BntyP626zfm3agnfe3MNZToG5VkJ5Bud8MzRZTF6
	EKdRlV4r6IEanj6zy6WOZuIH8PDjV8x/pnM2PyLTTzXIIoM4wvZsbdvPYKkzL3COtHPhBfDwXzO
	4dwbfyYp0yHQLAoEmz2CT5RhBRiEVdmltulF5jOwSQucpiNhsvMCsZ58t7xYJYcnbJq+fKoDROM
	LeSEFgYrmwP6jE3J+O247qIrrJhC6ORYnT0DMVpoW/T0W/w9Z/FvfLKOM7TDP5OhtMm2gjElaz5
	uhbvfSXkCkrwRhYUw5lvQ+1e6p0DePTTiJwo=
X-Received: by 2002:a05:600c:8b81:b0:4bb:5f45:c97f with SMTP id 5b1f17b1804b1-4bb5f4f93f3mr220965765e9.27.1794919218079;
        Tue, 17 Nov 2026 04:40:18 -0800 (PST)
Received: from Ansuel-XPS24.localdomain (93-34-92-103.ip49.fastwebnet.it. [93.34.92.103])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-4bb78386902sm73367065e9.1.2026.11.17.04.40.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Nov 2026 04:40:17 -0800 (PST)
From: Christian Marangi <ansuelsmth@gmail.com>
To: Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Simon Horman <horms@kernel.org>,
	Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Randy Dunlap <rdunlap@infradead.org>,
	Christian Marangi <ansuelsmth@gmail.com>,
	Lorenzo Bianconi <lorenzo@kernel.org>,
	Heiner Kallweit <hkallweit1@gmail.com>,
	Russell King <linux@armlinux.org.uk>,
	Maxime Chevallier <maxime.chevallier@bootlin.com>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Nathan Chancellor <nathan@kernel.org>,
	Nick Desaulniers <ndesaulniers@google.com>,
	Bill Wendling <morbo@google.com>,
	Justin Stitt <justinstitt@google.com>,
	"Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>,
	netdev@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-doc@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	llvm@lists.linux.dev
Subject: [PATCH net-next v22 05/15] net: phylink: save phylink instance fwnode on phylink_create
Date: Tue, 17 Nov 2026 13:39:45 +0100
Message-ID: <20261117123956.11981-6-ansuelsmth@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261117123956.11981-1-ansuelsmth@gmail.com>
References: <20261117123956.11981-1-ansuelsmth@gmail.com>
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

The firmware node associated with the phylink instance might differ from
the device firmware node passed in phylink_config as such device can
reference the parent switch or other platform peripherals.

Some function might need to reference this firmware node after
phylink_create so add a dedicated fwnode entry in phylink internal struct
and save it on phylink_create().

Signed-off-by: Christian Marangi <ansuelsmth@gmail.com>
---
 drivers/net/phy/phylink.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/drivers/net/phy/phylink.c b/drivers/net/phy/phylink.c
index e8ba906cfba6..091c3a79c120 100644
--- a/drivers/net/phy/phylink.c
+++ b/drivers/net/phy/phylink.c
@@ -47,6 +47,7 @@ struct phylink {
 	const struct phylink_mac_ops *mac_ops;
 	struct phylink_config *config;
 	struct phylink_pcs *pcs;
+	struct fwnode_handle *fwnode;
 	struct device *dev;
 	unsigned int old_link_state:1;
 
@@ -2185,6 +2186,7 @@ struct phylink *phylink_create(struct phylink_config *config,
 	INIT_LIST_HEAD(&pl->pcs_list);
 
 	pl->config = config;
+	pl->fwnode = fwnode_handle_get((struct fwnode_handle *)fwnode);
 	if (config->type == PHYLINK_NETDEV) {
 		pl->netdev = to_net_dev(config->dev);
 		netif_carrier_off(pl->netdev);
@@ -2272,6 +2274,7 @@ struct phylink *phylink_create(struct phylink_config *config,
 	list_for_each_entry_safe(pcs, tmp, &pl->pcs_list, list)
 		list_del(&pcs->list);
 free_pl:
+	fwnode_handle_put(pl->fwnode);
 	kfree(pl);
 	return ERR_PTR(ret);
 }
@@ -2311,6 +2314,8 @@ void phylink_destroy(struct phylink *pl)
 	list_for_each_entry_safe(pcs, tmp, &pl->pcs_list, list)
 		list_del(&pcs->list);
 
+	fwnode_handle_put(pl->fwnode);
+
 	kfree(pl);
 }
 EXPORT_SYMBOL_GPL(phylink_destroy);
-- 
2.55.0

