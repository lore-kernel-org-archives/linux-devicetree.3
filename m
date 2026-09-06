Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 645DF3C10B1
	for <devicetree@vger.kernel.org>; Sun,  6 Sep 2026 17:45:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788716755; cv=none; b=QwZC6DCyW2gVfkipNjwRIF1W0LJi1aZId4o/bgpq0ttNL5NAB8MP8ThPvIMGiYSQazvibVzCvakehsvTylHTmoemgRfkDa9tIr1e1sfr4KNZuc6srGpfU8ubQbnuoiGjfMAsFWq36GG1idbnJfRPl7VKCyxHoYcsvfd+hVNbcl4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788716755; c=relaxed/simple;
	bh=K244GoaR/SBN1qTkqznMbdB/qRyg1uAQxHof7eZyYLA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Ggouyb9tGqx5hiq1tb7qsmdVQfMOVGY1+YJG8VymonU7E88MPAi4iC/D0b9HCtI6sU4waS8Znh1Yo2rbwb902PVXyoVgmBeevRrgeDMlkR2qcbpR5tZXn8hitoSS2OtvBALmFs5EL3vtAFh+mmMOzIi5UYzqRnmFQ6cmuX5ULGg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=lex.la; spf=pass smtp.mailfrom=lex.la; dkim=pass (2048-bit key) header.d=lex.la header.i=@lex.la header.b=LZHeNUA8; arc=none smtp.client-ip=209.85.128.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=lex.la
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lex.la
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lex.la header.i=@lex.la header.b="LZHeNUA8"
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-49a97714f5dso24766165e9.0
        for <devicetree@vger.kernel.org>; Sun, 06 Sep 2026 10:45:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=lex.la; s=google; t=1788716751; x=1789321551; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=nwJE/G6DLPhkatwmSaqyq8HEYQKnbZm9tru5auWihS0=;
        b=LZHeNUA8ThlfHJ8IUWW5tpcRcoPmef+VXkClscU0s6ZK6Nj27WWGu17wGcstjFDm7Y
         +tNQrHe0TtDATUG1ZSaXaodU+oo9mxcFBfzTDA596/Ku5NAm2Cg/gClIOcsjQif0wLW1
         7lk+vZAXy8dsa9kPgRrxqi8bQFfGAxmx8frQynJ3fbAMasX8VHmGIdWY2poVhbxD/bja
         xxMbNXpfeXqzqAA2prRe2pzqVm+qA3Jceanbar2QTN/Gs09ACL/QFR/fi3hNGb15f7iV
         vMbpSACLaGiW5eJ7Dn98xtTmVSFytal6qZ8EvOvADUugsxZk5zMjLB86TLOSHjiZsQlT
         in1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788716751; x=1789321551;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=nwJE/G6DLPhkatwmSaqyq8HEYQKnbZm9tru5auWihS0=;
        b=XaolKKlj8ixFQGmFptarVJfulI1Vu9Wwn78cKlC6zLXTP6nFSksZeBVd6az77E/+Zv
         DUnhuK+hgQBffZeN3kCjsmipvYjbr+D/JatOGnvVUaP/eUrdLeDrJMgAOqB0jFdAKuh7
         Y8RDGMOXdkwRTFFFxdRhIU/RANIy7Rnpv1EgvJ/d1K+0Mc3qJYlSpBmb3h7jGOKv4PLc
         ngdbMkOTdKo6tShvStBu18ThyjsO/IyTFM4edqy9/02RwOc8kTWqDbFOTxzZzFPbn/rM
         QPU/rKbIGYbslYUIahvSP0xfVWvz4sxX1sH/w6SiVP4Sb1Y9KTLXkqtFaSq0XQOt5aq0
         dxgw==
X-Forwarded-Encrypted: i=1; AKwUvBxPsb32YJAcOZqXEafkvOjRFytKafs8hptievx4L1iRSb8UawbJc48Bipxn/dIEflFSgxb0qJsguLmI@vger.kernel.org
X-Gm-Message-State: AFuF++n8NMns8kaZBb3lCXaFvxxUedi9c6U0gdhTR1OMvDTRoi/E2jt2
	Zsz68jMVz9lwH/iLiPCPqVv6YHIOufojjdJr5g4LYChODNMQTdwxcasmiR2hvfKqpKA=
X-Gm-Gg: AYBFou3RQ8KDOKFh19PQil69D5Nl8rSLaEfyhNHsq/+tsxE8K4WO/n39QfXDy67zwhW
	YNOUCCbB67/6ySJZ1lh/JSixODC4M6UfbPryWFSB2tx1iJwZa9RZqjjjNwMdV2DjdxzGg7Y+pjs
	t02cK0Ybg+H9wp+j9cA2r6IxRFagHJDk5VFakL/Vp3aJzaE9OffTIevSeGdCkU3KrG5pV/4Ymeq
	7dlGrwdAUl3fcds265KeQpv78+88oNQDZNzJjnue0xYqKtvsqwOV/BfK5fUSe+yVWUEaIb/AaL/
	ChBTqFxPL/AqIJ4FeHFBp4+MAm/i6l6DwTB0FTl3oyyvvks+ziFT3PqNaJ2lzfanr5DzWk9jL4G
	e18UhRjdG1dG3Ocig7gMrqeF40ouJHfUZUsd7DcppVDRtuyzyRNhe8gQa5A7YSTDqYWKivKyDkg
	11Dy0Kw5RNuz8V1JWfbW76alBHVLnoH0Q527zpwNQ=
X-Received: by 2002:a05:600c:314f:b0:49c:ffde:45ff with SMTP id 5b1f17b1804b1-49cffde4629mr130539685e9.17.1788716751586;
        Sun, 06 Sep 2026 10:45:51 -0700 (PDT)
Received: from remote-01 ([84.17.55.227])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49cf755c22esm245418805e9.0.2026.09.06.10.45.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 06 Sep 2026 10:45:51 -0700 (PDT)
From: Aleksei Sviridkin <f@lex.la>
To: andrew@lunn.ch,
	andrew+netdev@lunn.ch,
	hkallweit1@gmail.com,
	linux@armlinux.org.uk,
	davem@davemloft.net,
	edumazet@google.com,
	kuba@kernel.org,
	pabeni@redhat.com,
	horms@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org
Cc: ericwouds@gmail.com,
	netdev@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [RFC PATCH net-next 2/7] net: phy: add mdiodev_lock(), mdiodev_lock_nested() and mdiodev_unlock()
Date: Sun,  6 Sep 2026 17:45:38 +0000
Message-ID: <20260906174548.4106801-2-f@lex.la>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <cover.1788711797.git.f@lex.la>
References: <cover.1788711797.git.f@lex.la>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Code that holds the MDIO bus across a burst of transactions has
phy_lock_mdio_bus(), which needs a phy_device. A library serving a chip
before its phy_device exists has to open-code the same mutex.

Add the mdio_device spelling beside it. The nested form is for a
library whose caller already holds the bus one level up, which is what
the EN8811H MDIO driver later in this series does.

Assisted-by: LLM
Signed-off-by: Aleksei Sviridkin <f@lex.la>
---
 include/linux/phy.h | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)

diff --git a/include/linux/phy.h b/include/linux/phy.h
index 3d8afe6b7f1c..e74a8f5cf5c6 100644
--- a/include/linux/phy.h
+++ b/include/linux/phy.h
@@ -2284,6 +2284,22 @@ static inline void phy_unlock_mdio_bus(struct phy_device *phydev)
 	mutex_unlock(&phydev->mdio.bus->mdio_lock);
 }
 
+static inline void mdiodev_lock(struct mdio_device *mdiodev)
+{
+	mutex_lock(&mdiodev->bus->mdio_lock);
+}
+
+/* For a bus reached through another one, as mdiobus_read_nested() is. */
+static inline void mdiodev_lock_nested(struct mdio_device *mdiodev)
+{
+	mutex_lock_nested(&mdiodev->bus->mdio_lock, MDIO_MUTEX_NESTED);
+}
+
+static inline void mdiodev_unlock(struct mdio_device *mdiodev)
+{
+	mutex_unlock(&mdiodev->bus->mdio_lock);
+}
+
 void phy_attached_print(struct phy_device *phydev, const char *fmt, ...)
 	__printf(2, 3);
 char *phy_attached_info_irq(struct phy_device *phydev)
-- 
2.53.0

