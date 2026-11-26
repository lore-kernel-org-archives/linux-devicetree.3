Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795686831;
	b=HRnARs0KbaTtEEwr3gBZdrUYUdkyraf+HA+Ui3Uy4A085TXnlpcY6ScyNGHGbHSO5lE+
	 z1iV+qCV1zRSg3bIGXxUtQS+7JmHkj7elWzyvKDWbTOQkS/8FgqRtfD+fuHRwbsVXoFue
	 LvaUH7qLceArrLrULas8gmBf8kCOrxr3LUNJ8h+q+NJTG2xdxtze7WJZotfjSTEqmkbel
	 /MYX6qh4ZZ+n7vZ4b8s5hJWkftPJINswy5aZ4NyXpRBbzxpXwK4ypCLRGrfZWdrCC1cln
	 MG6R6kGERI0mHGaYSjBB/8syhpcJ8TD3EGhzDS0CkXP3EvZ7M6zWFygzuBo5XSpVpmA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795686831;
	h=Received:DKIM-Signature:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=8cDIDFbGuBC/8lO1ZpWSJqXlhRb6S14RvYjUWs4IY68=;
	b=LTWokS4U3tdtu071VT6rm43ryCbtV2erJ3aMKATmp/nO3xqrb6/v0krzKrcI6bjAljPN
	 H19KT4GEzaCX1idcVPC/0WI3h+emLpQ9Bkx67H7GrCzSI4Olz7cCQuL1jrCadC/9iYpeW
	 c11e7hj1EzlUGLQ4kskZ8TMgyC+ATE7t3avapqa9KXe+UF0zKEIDVHA13bAd28IiFK4/R
	 xD9kR+nW/AsBbUYJPa73QCEbJo8QqD9AZkAsTf1yI97O2qRcbWtXRNk83DLigw/atwwTF
	 CbmFaegJR5COfLNgAybKzxgyAIm4xhUv34+bHhJw9t2mgSP4TmEtaCyMfKSdqZRHZ9w==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=I0b4U7+z;
	arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ACF36606A69A;
	Thu, 26 Nov 2026 09:53:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=I0b4U7+z
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1795686831;
	b=mC2Zfft2/9oQKXdaWjFUeEPDYaqrUgtu1R/iuBRyniM6lE7+Myfyp5IW+V/OIsWgE3G6
	 MbJtK9Q0+ji1x2BY4zxhnpQP5FzV6TROoRPce4dSLOD+6I+grbt5XWNThAwa+ascLRiaU
	 5hcRCwT3LDL/CakBgwA6uUN8HKm0alALiqEZaGmKBZFvTGCjcUlFu2iwsgyy0UMomyf1R
	 Q6iJDoDi87sn0nitvCyn5YIDAJq+Wedj2qbt9pZtkQrlCOoz3dPzMC7Cb7sETLpmx4izO
	 eRr5SrdRoU2iN1ZtpwPiwW/aPRbXxZXCxqbYT3cqWJcWKEzE4MUr7wNkEzkhPqeyqGA==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1795686831;
	h=DKIM-Signature:Received:From:Date:Subject:MIME-Version:Content-Type:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=8cDIDFbGuBC/8lO1ZpWSJqXlhRb6S14RvYjUWs4IY68=;
	b=vb9G7HTBSnYIPM7UapR89LFmOWO8lUFrkVOWRpykt+TAmPcDnOVjfmbpD/shIPu1F647
	 2XbOn618zGc+3wj91cE9ii6S8/zpEgq6xjoSUJz244UsBb5OlUOYPyHMmbSZrXy9mY41d
	 FEiUrL6f8g96XuTBboovlX6A/I/49bqmPH6CLyplzp8hWBU1Dc7TbZEAD4FkMyTWOLCEI
	 2ySrBOkrR35tICT012J6T6j9JxjXpvF6GoQGRvffq911AWbOVwBVdMcIBwjWWoDnoC37t
	 q7J5//kJ8U72NsMebdG8+E1T6bijcJFhZdtgw+jbQt1FgDRnrCN9nxXlvbunc7E93Ug==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 6C29D1F000E6;
	Thu, 26 Nov 2026 09:53:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795686831;
	bh=8cDIDFbGuBC/8lO1ZpWSJqXlhRb6S14RvYjUWs4IY68=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To;
	b=I0b4U7+zFAm5ZDR8hcm5BxW1Z/NyHd3zecClrngpJe2iXorchqI7IDTkn/CDJRnEF
	 45v+bfku6939eMVEujRYEKs8GPgYGvivz+kXj6wLCe+vm5gaJjgrwx5lQaHEi1FqzA
	 hXwceuy+ZByycKa53aTLFPz9DmJFSYwt2baVLpDqVpL1plJurOFZsnANCd9O2wGz0x
	 RrsyJKsH6ZQxsZf9L44scthYxhIBjH10oy47rKOQVjTXvfWfuboflUYT8bNpxvu1cg
	 ls+H/yRVSvVwxHGqFGeOcVwnp95lgGo1IiWiJQuiSrcQ90LD8xFAg8MEMOZYot8E++
	 4Do4njmHwfgww==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id EDB724D3C9;
	Thu, 26 Nov 2026 09:53:40 +0000 (UTC)
From: Xianwei Zhao via B4 Relay <devnull+xianwei.zhao.amlogic.com@kernel.org>
Date: Thu, 26 Nov 2026 09:53:39 +0000
Subject: [PATCH v3 2/3] reset: amlogic: Add A9 AO reset controller support
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
Message-Id: <20261126-a9-reset-v3-2-fb9bb01f33d1@amlogic.com>
References: <20261126-a9-reset-v3-0-fb9bb01f33d1@amlogic.com>
In-Reply-To: <20261126-a9-reset-v3-0-fb9bb01f33d1@amlogic.com>
To: Philipp Zabel <p.zabel@pengutronix.de>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Xianwei Zhao <xianwei.zhao@amlogic.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795686819; l=1467;
 i=xianwei.zhao@amlogic.com; s=20251216; h=from:subject:message-id;
 bh=OWsqjX5BEhrTnFs/Fj0tsLvGRnqbrMxArQetg4Ut+Y0=;
 b=QnTQL9ISVQl23/RsYQ9JPNOENIG3HckSM/HnrFoeInV/eQnmD1AKHHhS1qdGZSAiNYLDzUhN4
 oZwBM3oeBefDpYzYVhSD5zcKrvWv95Cm+LyqMQccsDC+EGPCEV/eOMg
X-Developer-Key: i=xianwei.zhao@amlogic.com; a=ed25519;
 pk=dWwxtWCxC6FHRurOmxEtr34SuBYU+WJowV/ZmRJ7H+k=
X-Endpoint-Received: by B4 Relay for xianwei.zhao@amlogic.com/20251216 with
 auth_id=578
X-Original-From: Xianwei Zhao <xianwei.zhao@amlogic.com>
Reply-To: xianwei.zhao@amlogic.com
Content-Transfer-Encoding: 7bit

From: Xianwei Zhao <xianwei.zhao@amlogic.com>

Add the reset configuration and compatible entry for the Amlogic A9 AO
reset controller.

Reviewed-by: Philipp Zabel <p.zabel@pengutronix.de>
Signed-off-by: Xianwei Zhao <xianwei.zhao@amlogic.com>
---
 drivers/reset/amlogic/reset-meson.c | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/drivers/reset/amlogic/reset-meson.c b/drivers/reset/amlogic/reset-meson.c
index c303e8590dd6..5e8afbceaf23 100644
--- a/drivers/reset/amlogic/reset-meson.c
+++ b/drivers/reset/amlogic/reset-meson.c
@@ -49,6 +49,14 @@ static const struct meson_reset_param t7_param = {
 	.level_low_reset = true,
 };
 
+static const struct meson_reset_param a9_ao_param = {
+	.reset_ops	= &meson_reset_ops,
+	.reset_num      = 32,
+	.reset_offset	= 0x0,
+	.level_offset   = 0x4,
+	.level_low_reset = true,
+};
+
 static const struct of_device_id meson_reset_dt_ids[] = {
 	 { .compatible = "amlogic,meson8b-reset",    .data = &meson8b_param},
 	 { .compatible = "amlogic,meson-gxbb-reset", .data = &meson8b_param},
@@ -57,6 +65,7 @@ static const struct of_device_id meson_reset_dt_ids[] = {
 	 { .compatible = "amlogic,meson-s4-reset",   .data = &meson_s4_param},
 	 { .compatible = "amlogic,c3-reset",   .data = &meson_s4_param},
 	 { .compatible = "amlogic,t7-reset",   .data = &t7_param},
+	 { .compatible = "amlogic,a9-ao-reset",      .data = &a9_ao_param},
 	 { /* sentinel */ },
 };
 MODULE_DEVICE_TABLE(of, meson_reset_dt_ids);

-- 
2.52.0


