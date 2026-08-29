Received: from mail-ed1-f50.google.com (mail-ed1-f50.google.com [209.85.208.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 52B8F35C692
	for <devicetree@vger.kernel.org>; Sat, 29 Aug 2026 05:26:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787981174; cv=none; b=SY6EF7RdqLNHFlSbTNQhqLNdMcX049M/L0HRiDac9q0Kq0WLGhtwif/vld0jA9v+RyJ86JyClF7vefFxl2LTZvM7OEYoKwBOKaqPFYWLMXTqd6VNHyO4AG8ftipK8zQwidMwiQcpixaFoaqvlgaa7jRrs+dPbwdzRmnPu4wODns=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787981174; c=relaxed/simple;
	bh=mReJ0qk+WPzQHug/wzwZgzokeoGyjEKDx1oAK0frKb4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=bISCqhBuzJyigxRy8E55a7Lh17nQY7sCJ4F2hck+p0MptcGnvyhtlaKje7bYqEoRXLUD+HVP+cHrmjsoIGTODfJCDwiLNv21gfVQjWJFDVD/XEcuhkMjfwFuWubSKoHAA9MgZBT1xyqp05nyzECojrtSoZxkd7zxSVLs6M230MA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=lex.la; spf=pass smtp.mailfrom=lex.la; dkim=pass (2048-bit key) header.d=lex.la header.i=@lex.la header.b=asHm3tRA; arc=none smtp.client-ip=209.85.208.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=lex.la
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lex.la
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lex.la header.i=@lex.la header.b="asHm3tRA"
Received: by mail-ed1-f50.google.com with SMTP id 4fb4d7f45d1cf-69c600f76ccso2263900a12.0
        for <devicetree@vger.kernel.org>; Fri, 28 Aug 2026 22:26:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=lex.la; s=google; t=1787981166; x=1788585966; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=puUVl7pjescZC2ZF+/6D0mZfkH713/A5cm+7yIXo/uY=;
        b=asHm3tRAHoiEpC9ghGkTDl5b88n4CecWvpmU0rK2CiOBriP0ooN1Zqlv9WmsI8lNAK
         QtDm3xmrenEQmqFauuN6bK4gbGKNyhllrnCqlKIgrFbc2oz8E3Y1fkhyZE0lC13xC/9P
         pCDPEnY9nsDKbhcUKnLKduN1SOSQIH1MXk74a4dqPjTmIdWQVniUYng0p+sLeOICYqaS
         wtLS9BSogrtu9jzzKoZ+M0A8pw7zkLZZo7/tHMo3bxZoiicfOdeQNOph8/+OazpI/UkI
         D/fSUyvo9U3bBzP5bIqVsvYbFkG3O7AvrauZk6i9bb+yzHIvS0VTq8CJqq9U295beDnL
         WXWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787981166; x=1788585966;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=puUVl7pjescZC2ZF+/6D0mZfkH713/A5cm+7yIXo/uY=;
        b=j7IofnmobXPJMBq9UcfWl0BRuXwV2BPBuJZUWoyFAdi+EDU0ZLJj8JmdQ0n38lGwiZ
         Cdb2/jMP46Boj1lqwjQ3X/BT9Bwy7v4xnsBI6cqsc7WfvUxFek/3U8+AYP58GYxXMpdN
         4tMF1nOD45Tamo3CLYBpyyOlEPjwwUDRHW0TdOmkZ7eyLM0gX8NEZ1gPXB/9odpuKnp8
         c3V9eGcneUXINUQE5UR6jVr0/zPNdUDCkEKge0H14LSW0FDassny73MFguHR1x28MdJ1
         AS0xvdOil2MymhxYcTjAmrthg8pZcWpWVn9pHmnCv9eUi8jgsqIqb/IxXGIg1L3F76r2
         Kodw==
X-Forwarded-Encrypted: i=1; AKwUvBxdchEtMsDF8xe7ODOxgpuLi5na8sKD3F7cfE4Iy/ngfN7PWQPO8hSnK4VIz8JpjYidA4IJoGhaimM7@vger.kernel.org
X-Gm-Message-State: AFuF++n7Mcqi6VojrfYzDGpnGrrs1EJpIbFg1jycSDOI5CYZ4YlCuHx3
	0x2MHaumoO7K65fYYTlhNzNNNt8DTcwMGHcNj2WJjKnU6xC6Rpsr4hmZOLsf/fJaSXU=
X-Gm-Gg: AYBFou0CWGyUojKeZJxymaGFTzi+FG11KKq195CgJ4nMNpdPjYWDiO+DH+RqOhs+Qey
	N4IGm12LdfC0MiJwNoZedQu6mGBOZ5ZOZmT53nXA7QTzpQhUUdKLTUDOPfFJFM016ASA9xQy7a/
	pkqVqawFx0GYZL6PfhTHbiirFyI3tqHbgtW2HMd7TIOQn40IoUZIhrsF7YiZ9I7mNZod4OiX7tO
	w04eJWtnUd1LWHSjBuVTFNorrSWO/BNe4w90nhVAgyLmYh9+HEQwHGOkkAlkH63ZYXmT1mfmiRP
	5pekz9T6cakYTnL4LZr9Q+K/zqkJSj2Xi5TDMdEnWAgmj2rHDrCFeWP1zNk6aRmpGNWtK8B8s2w
	rFD77csRah7oG19JTUIKcp8krQ1wfWOd+lHM7+5pswefdaSkIa3XWtFNG16nTKRAlSVQkgeLKJ2
	f/rM3J2NHuFPkskGp00lu+2AwkU1aJ69o2wa3nINVnAQ==
X-Received: by 2002:a05:6402:e95:b0:6a6:32fa:1e9c with SMTP id 4fb4d7f45d1cf-6a632fa1f14mr123281a12.20.1787981165662;
        Fri, 28 Aug 2026 22:26:05 -0700 (PDT)
Received: from remote-01 ([45.85.105.214])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c255ee75a36sm163750666b.28.2026.08.28.22.26.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 28 Aug 2026 22:26:05 -0700 (PDT)
From: Aleksei Sviridkin <f@lex.la>
To: netdev@vger.kernel.org
Cc: andrew@lunn.ch,
	hkallweit1@gmail.com,
	linux@armlinux.org.uk,
	davem@davemloft.net,
	edumazet@google.com,
	kuba@kernel.org,
	pabeni@redhat.com,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Aleksei Sviridkin <f@lex.la>
Subject: [RFC PATCH net-next 7/9] net: mdio: en8811h: add the nested pass-through bus
Date: Sat, 29 Aug 2026 05:25:44 +0000
Message-ID: <20260829052546.1152446-8-f@lex.la>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260829052546.1152446-1-f@lex.la>
References: <20260829052546.1152446-1-f@lex.la>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Registering the bus is what publishes the PHY, so it must happen only
once the MD32 is running its firmware. Put the PHY on a bus of its
own rather than on the parent so that the device tree can describe it
normally, interrupts included, and so that the MCU keeps ownership of the
reset line the PHY must not touch.

Only the address the MD32 answers on is passed through; every other
address returns -ENODEV, so scanning this bus cannot produce anything but
this chip's PHY. phy_mask would express the same thing but is not usable
here: of_mdiobus_register() overwrites it before walking the children.

Take the parent lock with MDIO_MUTEX_NESTED and use the __mdiobus
accessors, which is how the DSA drivers reach through a child bus into
their parent.

Assisted-by: LLM
Signed-off-by: Aleksei Sviridkin <f@lex.la>
---
 drivers/net/mdio/mdio-airoha-en8811h.c | 128 +++++++++++++++++++++++++
 1 file changed, 128 insertions(+)

diff --git a/drivers/net/mdio/mdio-airoha-en8811h.c b/drivers/net/mdio/mdio-airoha-en8811h.c
index e16211da3d70..b28e116289e6 100644
--- a/drivers/net/mdio/mdio-airoha-en8811h.c
+++ b/drivers/net/mdio/mdio-airoha-en8811h.c
@@ -17,6 +17,8 @@
 #include <linux/mdio.h>
 #include <linux/module.h>
 #include <linux/of.h>
+#include <linux/of_mdio.h>
+#include <linux/phy.h>
 #include <linux/property.h>
 #include <linux/workqueue.h>
 
@@ -47,6 +49,112 @@ struct en8811h_mcu {
 	bool warned;
 };
 
+static int en8811h_mcu_read(struct mii_bus *bus, int addr, int regnum)
+{
+	struct en8811h_mcu *mcu = bus->priv;
+	struct mii_bus *parent = mcu->mdiodev->bus;
+	int ret;
+
+	if (addr != mcu->mdiodev->addr)
+		return -ENODEV;
+
+	mutex_lock_nested(&parent->mdio_lock, MDIO_MUTEX_NESTED);
+	ret = __mdiobus_read(parent, addr, regnum);
+	mutex_unlock(&parent->mdio_lock);
+
+	return ret;
+}
+
+static int en8811h_mcu_write(struct mii_bus *bus, int addr, int regnum, u16 val)
+{
+	struct en8811h_mcu *mcu = bus->priv;
+	struct mii_bus *parent = mcu->mdiodev->bus;
+	int ret;
+
+	if (addr != mcu->mdiodev->addr)
+		return -ENODEV;
+
+	mutex_lock_nested(&parent->mdio_lock, MDIO_MUTEX_NESTED);
+	ret = __mdiobus_write(parent, addr, regnum, val);
+	mutex_unlock(&parent->mdio_lock);
+
+	return ret;
+}
+
+static int en8811h_mcu_read_c45(struct mii_bus *bus, int addr, int devad,
+				int regnum)
+{
+	struct en8811h_mcu *mcu = bus->priv;
+	struct mii_bus *parent = mcu->mdiodev->bus;
+	int ret;
+
+	if (addr != mcu->mdiodev->addr)
+		return -ENODEV;
+
+	mutex_lock_nested(&parent->mdio_lock, MDIO_MUTEX_NESTED);
+	ret = __mdiobus_c45_read(parent, addr, devad, regnum);
+	mutex_unlock(&parent->mdio_lock);
+
+	return ret;
+}
+
+static int en8811h_mcu_write_c45(struct mii_bus *bus, int addr, int devad,
+				 int regnum, u16 val)
+{
+	struct en8811h_mcu *mcu = bus->priv;
+	struct mii_bus *parent = mcu->mdiodev->bus;
+	int ret;
+
+	if (addr != mcu->mdiodev->addr)
+		return -ENODEV;
+
+	mutex_lock_nested(&parent->mdio_lock, MDIO_MUTEX_NESTED);
+	ret = __mdiobus_c45_write(parent, addr, devad, regnum, val);
+	mutex_unlock(&parent->mdio_lock);
+
+	return ret;
+}
+
+static int en8811h_mcu_bus_register(struct en8811h_mcu *mcu)
+{
+	struct device *dev = &mcu->mdiodev->dev;
+	struct mii_bus *parent = mcu->mdiodev->bus;
+	struct device_node *np;
+	struct mii_bus *bus;
+	int ret;
+
+	np = of_get_child_by_name(dev->of_node, "mdio");
+	if (!np) {
+		dev_err(dev, "no mdio node describing the PHY\n");
+		return -ENODEV;
+	}
+
+	bus = devm_mdiobus_alloc(dev);
+	if (!bus) {
+		of_node_put(np);
+		return -ENOMEM;
+	}
+
+	bus->name = "airoha-en8811h";
+	snprintf(bus->id, MII_BUS_ID_SIZE, "%s", dev_name(dev));
+	bus->priv = mcu;
+	bus->parent = dev;
+
+	if (parent->read) {
+		bus->read = en8811h_mcu_read;
+		bus->write = en8811h_mcu_write;
+	}
+	if (parent->read_c45) {
+		bus->read_c45 = en8811h_mcu_read_c45;
+		bus->write_c45 = en8811h_mcu_write_c45;
+	}
+
+	ret = devm_of_mdiobus_register(dev, bus, np);
+	of_node_put(np);
+
+	return ret;
+}
+
 static void en8811h_mcu_fw_poll(struct work_struct *work)
 {
 	struct en8811h_mcu *mcu = container_of(to_delayed_work(work),
@@ -60,6 +168,15 @@ static void en8811h_mcu_fw_poll(struct work_struct *work)
 	if (!ret) {
 		dev_dbg(dev, "firmware %08x running after %ums\n",
 			mcu->fw_version, mcu->waited_ms);
+
+		/* Unlike a missing firmware file, this does not resolve by
+		 * itself, so unlike the poll there is no retry: surface it
+		 * once and stop.
+		 */
+		ret = en8811h_mcu_bus_register(mcu);
+		if (ret)
+			dev_err(dev, "failed to register the PHY's bus: %pe\n",
+				ERR_PTR(ret));
 		return;
 	}
 
@@ -86,6 +203,7 @@ static int en8811h_mcu_probe(struct mdio_device *mdiodev)
 {
 	struct device *dev = &mdiodev->dev;
 	struct en8811h_mcu *mcu;
+	struct device_node *np;
 	u32 deassert_us = 0;
 
 	mcu = devm_kzalloc(dev, sizeof(*mcu), GFP_KERNEL);
@@ -95,6 +213,16 @@ static int en8811h_mcu_probe(struct mdio_device *mdiodev)
 	mcu->mdiodev = mdiodev;
 	mdiodev_set_drvdata(mdiodev, mcu);
 
+	/* The bus registration only needs this once the firmware runs, but
+	 * a DT hole should fail the bind now, not as a work-item error a
+	 * second after probe already returned success.
+	 */
+	np = of_get_child_by_name(dev->of_node, "mdio");
+	if (!np)
+		return dev_err_probe(dev, -ENODEV,
+				     "no mdio node describing the PHY\n");
+	of_node_put(np);
+
 	/*
 	 * The core only claims reset-gpios for devices flagged as PHYs
 	 * (mdiobus_register_device()), so claim it here. Owning it at this
-- 
2.53.0

