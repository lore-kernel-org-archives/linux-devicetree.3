Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795558223;
	b=rAtiwHiUab4WbErUufaWXL4YD5W5ZG0J1ni3ULS3pFrojdiXpK1Q9nXv1oZgrzihQuwc
	 dNSOoPoy3qxZfV5fdwOybQDeZERjmIcmozErqUqRF2GlxCso7Kr9ZypKaYS5VJpdiG+NL
	 NTslkIuR5TKNrNNZz8SPsNrMNSsOw9IZFyXYXRUIvFqwHB8XbmkfFHEmwrecxtLXMA0Fg
	 1fIpCLFOxGQffA126KzYWEVKRv6vhTSW3blEPhKTtZX1QJEV7pg/QagjiwtOko6BPBlEQ
	 4c68ZM2hbuogNGVvtRqfjGZ9XLlcCcXBCCjFzKJHY884hTCipVXxrL7onWtkgqRg3YQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795558223;
	h=Received:DKIM-Signature:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=N4KkSHKKVFwpR90cNe57A/tGYh93ruXixpyOWVsNOdY=;
	b=G0VXeXkPtWAQ+/vykZuxQMciyVJVi8DIk44Cei4rmHzIxJPbpUXlxYZ36ss1NCkK3BS7
	 D3XlFxP+hrjFfO7RVxbHZ6rCQoeS0qmqiJGPIOVMW78m9G2ry7GomAb00oKnP3sra9sDE
	 zVMYKi+CRSUE8OXn6tkOELCkbaPCXAb3zDPbLY/nTO71fUae9YEynZ52R74I4vTSe/52f
	 9oX1NsWXCemykpTgKdF4BGFH56aq4i7U4UyhBir44mxtTjR39uQfHWP5KdAuxA8fJ2SIU
	 4zq7DEKGd47fzuKBMlQx36jZ8GyDiniiNO/l4wHpgUI1R5JAif1NzTlkdk7KfECQcUQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=aLmQHOq+;
	arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 261F760A2601;
	Tue, 24 Nov 2026 22:10:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=aLmQHOq+
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1795558222;
	b=N95NtSQtx61TFnulvkWmAiJwCziC1gPjcDii/IZCpVmAULBBD0t+hlVw0sIBlHSS4q08
	 wkME3uGo4c5jDUKQ8TBxiTy4eXvCfRfsROcoU7dGEYysOTJPipQJWLCDVIONbUPMqJqxm
	 1UI4pT8nK3Tn7EZ3BBzrB607UhlBBg9a5HEz7U5LyYe9PPYTAs2qzVJCvMJL0RqFbOw/1
	 e+770yMZVZhFktugE5OHGnI5UQ31KfYezhotkSCTG3Ve5P2u+a+QYtVAvUViOFYUS19r3
	 ysufIusssKKy+6jZGr/+7D06ylkSDOh5PKGM+GIWNCnyOxJrpi9ov2PBjzs06QxKD5Q==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1795558222;
	h=DKIM-Signature:Received:From:Date:Subject:MIME-Version:Content-Type:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=N4KkSHKKVFwpR90cNe57A/tGYh93ruXixpyOWVsNOdY=;
	b=eYxV2vVBR79AYZpV/POEchbUr9NC+wfJHbPYcaJbffZS1Bh8tVF70gKjlUTCvptUVS4y
	 lYFKKtZ6Luh34Qh3uFrtI/z+VV0TZ2R9dGuyVokZ080aYONMaqEPvR11hv9V+wPRXDtGS
	 2GHp6gDllTuitf4YF2O8ITkE9QyYGjYjmmEDHM+axUZYrb7+xWVeH51Z67nfk4zR4+gyv
	 M/pToV4K26UrYZg+o0JClHZ11mG0CLrGCpyYbQdH83F3ooZA7ZmNBUcvyI7nCYIhCmOQ9
	 xmA715IluBPCgkoFejZLUFPq8OtavbMSYPfEvG3Y1NzQIxX6jZIJ8Jo1TPu3we5SxKQ==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 301BA1F000CF;
	Tue, 24 Nov 2026 22:10:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795558222;
	bh=N4KkSHKKVFwpR90cNe57A/tGYh93ruXixpyOWVsNOdY=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To;
	b=aLmQHOq+KyINv1KjvF2lbgI+vbGJ3H5k1dk4PqkIb8/iYaK0Qin3ZmvVrRZ2QCLMr
	 mGeqFsa3g4hHctdnUYiExzIodBU06RdsPAkeCFsWh5f9DaB8PY/7GPk3S+WcWW87xN
	 TenLgjQ7QF+QNJegfCANZn2Ecj47/fBtXmTCJRslwandqgV+sR18OqHayEaiqtOHyw
	 Z77dC+922rb07tfJUYO9HtI0SVMcOxAXHxlZjrSVQ82LQI1BPlE/Yolj2iBwxL370n
	 8sxvukmRKVvHlkvCg8wI54D2I+cEBeNIJ4/SjQPM0KHV7Z0lpKEo+dnjbJ4D1zIJxs
	 46JV60IZg8cVA==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id 2E37F4CBF9;
	Tue, 24 Nov 2026 22:09:58 +0000 (UTC)
From: Selvamani Rajagopal via B4 Relay <devnull+Selvamani.Rajagopal.onsemi.com@kernel.org>
Date: Tue, 24 Nov 2026 14:10:02 -0800
Subject: [PATCH net-next v12 14/15] net: phy: dp83867: Use
 genphy_loopback_no_speed()
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
Message-Id: <20261124-s2500-mac-phy-support-v12-14-3575855d99f9@onsemi.com>
References: <20261124-s2500-mac-phy-support-v12-0-3575855d99f9@onsemi.com>
In-Reply-To: <20261124-s2500-mac-phy-support-v12-0-3575855d99f9@onsemi.com>
To: Andrew Lunn <andrew@lunn.ch>, Heiner Kallweit <hkallweit1@gmail.com>, 
 Russell King <linux@armlinux.org.uk>, 
 "David S. Miller" <davem@davemloft.net>, Jakub Kicinski <kuba@kernel.org>, 
 Paolo Abeni <pabeni@redhat.com>, Andrew Lunn <andrew+netdev@lunn.ch>, 
 Parthiban Veerasooran <parthiban.veerasooran@microchip.com>, 
 Selva Rajagopal <selvamani.rajagopal@onsemi.com>, 
 Richard Cochran <richardcochran@gmail.com>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Simon Horman <horms@kernel.org>, 
 Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>, 
 Randy Dunlap <rdunlap@infradead.org>, Eric Dumazet <edumazet@kernel.org>, 
 Piergiorgio Beruto <piergiorgio.beruto@gmail.com>, 
 Eric Dumazet <edumazet@kernel.org>
Cc: netdev@vger.kernel.org, linux-kernel@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-doc@vger.kernel.org, 
 Jerry Ray <jerry.ray@microchip.com>, 
 Ciprian Regus <ciprian.regus@analog.com>, 
 Selvamani Rajagopal <Selvamani.Rajagopal@onsemi.com>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795558193; l=1403;
 i=Selvamani.Rajagopal@onsemi.com; s=20260531; h=from:subject:message-id;
 bh=716BHQOO0McnTi+YuriATnpGPNHeavbXCK5inp0Y6DU=;
 b=OX8oScDkrSZjp078fFX/AW0h4iTU6a2TNE2ojPL6SoyAE2ACL6VUB6hrlVlAtv/dC6LGEEQAs
 8InTuFwxUuFBlkIma2gVXcx2NMDOSU8kJ2GfRdONkl9D8b63ZfYxqp+
X-Developer-Key: i=Selvamani.Rajagopal@onsemi.com; a=ed25519;
 pk=5QRdM0HS/LGWWcUZZ9hVfZ+qbPQGZCumcTXOiN7Fyug=
X-Endpoint-Received: by B4 Relay for
 Selvamani.Rajagopal@onsemi.com/20260531 with auth_id=803
X-Original-From: Selvamani Rajagopal <Selvamani.Rajagopal@onsemi.com>
Reply-To: Selvamani.Rajagopal@onsemi.com
Content-Transfer-Encoding: 7bit

From: Selvamani Rajagopal <Selvamani.Rajagopal@onsemi.com>

Replace dp83867_loopback() with genphy_loopback_no_speed(), which
does the same. No functional change.

Signed-off-by: Selvamani Rajagopal <Selvamani.Rajagopal@onsemi.com>

---
changes in v12
  - No change
changes in v11
  - Moved the vendor changes into its own patch.
  - New patch in v11.
---
 drivers/net/phy/dp83867.c | 11 +----------
 1 file changed, 1 insertion(+), 10 deletions(-)

diff --git a/drivers/net/phy/dp83867.c b/drivers/net/phy/dp83867.c
index b4b4931c6f8c..dc00484c6c7a 100644
--- a/drivers/net/phy/dp83867.c
+++ b/drivers/net/phy/dp83867.c
@@ -1057,15 +1057,6 @@ static void dp83867_link_change_notify(struct phy_device *phydev)
 	}
 }
 
-static int dp83867_loopback(struct phy_device *phydev, bool enable, int speed)
-{
-	if (enable && speed)
-		return -EOPNOTSUPP;
-
-	return phy_modify(phydev, MII_BMCR, BMCR_LOOPBACK,
-			  enable ? BMCR_LOOPBACK : 0);
-}
-
 static int
 dp83867_led_brightness_set(struct phy_device *phydev,
 			   u8 index, enum led_brightness brightness)
@@ -1291,7 +1282,7 @@ static struct phy_driver dp83867_driver[] = {
 		.resume		= dp83867_resume,
 
 		.link_change_notify = dp83867_link_change_notify,
-		.set_loopback	= dp83867_loopback,
+		.set_loopback	= genphy_loopback_no_speed,
 
 		.led_brightness_set = dp83867_led_brightness_set,
 		.led_hw_is_supported = dp83867_led_hw_is_supported,

-- 
2.43.0


