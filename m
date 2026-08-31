Received: from mail-pj1-f41.google.com (mail-pj1-f41.google.com [209.85.216.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 59F9E3C2774
	for <devicetree@vger.kernel.org>; Mon, 31 Aug 2026 04:49:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788151754; cv=none; b=FgJ8Z8YDoeISRVzBiEmLzryIuUHohIQ6LK5g3384y1KnbwV/k4s8RkdSZcCAEq9/HmFL6P5GGVhcUwNXEEp+uGhk8vXD1ChNNNP0ml2tXiNixkug0zoi0vXlYSS/YCVFrXY+e9R+9S42/hCWAnNDy1l2LCOourK3haPsW9djo1Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788151754; c=relaxed/simple;
	bh=kNo6YdY+tnvG2KdzifeNUva3yG8J1Asl4yyX1fMA87g=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=jnIdDqAQlEL+blkus9IN9UhIa5BaHcKCLqLTqvmyBeV83v184NZl5DXKNbbE1TFIXynypHQJ5KNrNriXgc/bA3n7AFMCN7XQ064lwokSzEz1drPAr6w7sIXGJPRcBNLvuQe6An2ahOZExi6JMwm7tOGB/luTi4Q3ZaKGyjtuqWI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=cDlovnGN; arc=none smtp.client-ip=209.85.216.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="cDlovnGN"
Received: by mail-pj1-f41.google.com with SMTP id 98e67ed59e1d1-38dc4553f62so4323640a91.0
        for <devicetree@vger.kernel.org>; Sun, 30 Aug 2026 21:49:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788151752; x=1788756552; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=bq8iQGfvzt1d+4SYb4LSAR03b7kK3VKsffzTguj8T24=;
        b=cDlovnGN1woY+8zxnTgMNAKSkCK5gnD1q4lwD12BBxTwvvMwafiAeV+q3CfJEi6VUY
         SmOUJ7MrtnA9R2NAD0D0biZ/bLtriI1dInyQgfdQ8m+hMfhlVW3/wN4u3h3P0026WvFO
         t2sdp7rJhSv7nLa/H+rP7WeuZaQBnVdtC0sa9MJxVjxnabvPIXE6IU3o+3R6GZ2oQqk5
         JEMW/ZMGGorJU4PAf8F+rc91NA3xaO42QGs8u/RFSfQYjeiHTBCe3L+z4ARO1NJLUAOg
         kyBQKRbSrOsTTUpeMcc4+l6UDgqyqjHMyTV5Z5+1EUE21ND+tXaOWO5AV845nFb+fN1r
         yGug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788151752; x=1788756552;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=bq8iQGfvzt1d+4SYb4LSAR03b7kK3VKsffzTguj8T24=;
        b=NR2E5/LnyT+BaGmRYbL8Fx9niVvxhOhZsvXlyzeX8LXGb0XS9pH+txO8jmSRJGZTWK
         HLkUZf62YpYmvkwPofrkg0MbFTBUjXtmXu+w9QhGqnp3jscJv4Nmz3mJr8T8foTm/X2R
         t7TZ+K1MVjBSSylUmUXW9bEbDTf4DwH20IeHFcogIYsDwp9OdKFyXmwECRsbnRyzPn0I
         n+RnnRpEf1yGiRia3+N3MVUnGwe36tpxLi8S2LAyyrmeWyFUzn+IHg9RMPnrn2s5tzs2
         lKSPcaKWI61j5mDcgMEusZxlIjHrkVt2KaRwTbDKVdyrY/dYRqZvzaXiINrxjA3ZObUp
         YPSw==
X-Forwarded-Encrypted: i=1; AKwUvBw6CkFW8rZPqZuVWGYrj0Xy5yw0Frr8VuV0f9dX3vXUJTaYM4+mVEkAOvJwpqdoX87rCduYLmBMTAyw@vger.kernel.org
X-Gm-Message-State: AFuF++n/v65FEhjeuY7MwMe4bHwBM+bJt05QetifGUdduyICVzjHkH8A
	+FSVgxTx6njZ0vMLKjF2JbqiDvi0CHsT6AKbpzDXMSCnKNeGdUMgaCyn
X-Gm-Gg: AYBFou12Z5ldwAGIGqfFGKvD+/hwgf9CGiSOreiuu0I9u8qylJf3q+h97RjiHH+mydE
	8S13Qpyu8oqqblXrukGvfy6wx2+MXFLVozWjR+S5bTWFaBZHkjzewy+JejTpm5i1qPP8BPES/v6
	mlHwRv6FoFWID9yWsYG9Oc8WDbTOxm8OEBCU1+NkwEQ49B0QBqBIWjZgAfOvvyMDg45/kQx9Q3w
	busHLWUx8zGWygPXkGGGe1E0dQHQDyxC4HIgMEplQ1pzs1/EtpaZT6KiJmrZoik8Pr0+P6ujO+h
	Ru6vWCrP+MZPrqNELKUwGwnwOJfd5JYG5fMf7hlAmfbs/1py62DS9JYlYSiDbiRTF+XhTlXbhe/
	LVcK3jYqJUkr91kxFwfOOc0TNeIo4oWCRACTsgt7JPjXAe+QmwCHAFZ70O/yEgqpllfvBdSYVtp
	7AXNA5/DjRSgUSX8nnAh3xrLEWPsfeYtrQXWCUUhhxglK3b7li0gIKNoaPGhrCPD1LRLQfrg2mi
	QXINkUwTXsK0g==
X-Received: by 2002:a17:90b:17cd:b0:398:bc52:825b with SMTP id 98e67ed59e1d1-398bc52849emr14859186a91.21.1788151751644;
        Sun, 30 Aug 2026 21:49:11 -0700 (PDT)
Received: from d.home.yangfl.dn42 ([2a09:bac1:76a0:d30::4cf:2e])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-396b0fd5c34sm19345763a91.8.2026.08.30.21.49.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 30 Aug 2026 21:49:11 -0700 (PDT)
From: David Yang <mmyangfl@gmail.com>
To: netdev@vger.kernel.org
Cc: David Yang <mmyangfl@gmail.com>,
	Andrew Lunn <andrew@lunn.ch>,
	Vladimir Oltean <olteanv@gmail.com>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH net-next v11 1/5] net: dsa: yt921x: Check lock status with lockdep_assert_held_once()
Date: Mon, 31 Aug 2026 12:38:54 +0800
Message-ID: <20260831044818.4103477-2-mmyangfl@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260831044818.4103477-1-mmyangfl@gmail.com>
References: <20260831044818.4103477-1-mmyangfl@gmail.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

mutex_is_locked() was used to check the lock status. While it should not
be triggered unless a bug is introduced, it does not warn on lock being
held by another thread. Fix it with lockdep helpers.

Fixes: 186623f4aa72 ("net: dsa: yt921x: Add support for Motorcomm YT921x")
Signed-off-by: David Yang <mmyangfl@gmail.com>
---
 drivers/net/dsa/yt921x.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/net/dsa/yt921x.c b/drivers/net/dsa/yt921x.c
index 159b16606f6c..44fcdd47ffb5 100644
--- a/drivers/net/dsa/yt921x.c
+++ b/drivers/net/dsa/yt921x.c
@@ -198,14 +198,14 @@ static u32 ethaddr_lo2_to_u32(const unsigned char *addr)
 
 static int yt921x_reg_read(struct yt921x_priv *priv, u32 reg, u32 *valp)
 {
-	WARN_ON(!mutex_is_locked(&priv->reg_lock));
+	lockdep_assert_held_once(&priv->reg_lock);
 
 	return priv->reg_ops->read(priv->reg_ctx, reg, valp);
 }
 
 static int yt921x_reg_write(struct yt921x_priv *priv, u32 reg, u32 val)
 {
-	WARN_ON(!mutex_is_locked(&priv->reg_lock));
+	lockdep_assert_held_once(&priv->reg_lock);
 
 	return priv->reg_ops->write(priv->reg_ctx, reg, val);
 }
-- 
2.53.0

