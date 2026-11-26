Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795685081;
	b=fbrqu/ssLc0LPa1MJ3j6BFPr58mODejsRVVioMKTyJMvFJawlUjDeWifqx65mQAj6qR4
	 GigmTjMFH1lExJDTL8FH5ahTQVCDugwdjDfnNfskGhpv8RtMIIo49aXdcxaIaY47hqrm1
	 V9dpvkbdjPb1UtceL+LZtrca09K5g+qT+b0e1+AZb1vZu3vc3zyzch2Y2+NkS0wDN+/LC
	 sLQ4NPkn/1mZfLJR4iJhY8YHD04aOf3eQGWfoFcdKdbT4uLaaAvmApvhFxy/SasD+VSFk
	 JwEVYgNlT2ov92B6M4N1qAwCj734CTBtzPgrz1g8DOaNSVpU4minS7DyI4lUsLB6FMA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795685081;
	h=Received:DKIM-Signature:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=pxVs869Ky/tzG5WFDjowEDHv4Ebj83QZWV8ziNXTFhQ=;
	b=psowXJECwnbxPYtTvKMFvtrfz/oZ4fqtZWhmJUfnPfUOCv+n4AjUQyjN0dMyyb7FwJQf
	 T+xIoYtuYCr8TlYx6wcr0ZY4sZ34DKFCsLQBfg0K6rQCgCnEonreKl5QztbnPGa2mWnTy
	 dET4CosuM98hhkJNPlDbKaid2igusV6yXmTcBtAWZN4GrPe2vOEivjHdlH/u5GqAksE+7
	 qFkxajyMuuYWndjd2dFgtS7VSi2OvVn693AazfIwZYm1LGLnZ8BzDfwvXn94sQo+fUUFc
	 tSjSCNRMoCDiEA7Hs/zys/qvZtLrCrBi9X20RYyGAlGcxQ1Z9r5tY77EJsB6G5XV2ug==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b="IJSC/6ph";
	arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 39588606A32A;
	Thu, 26 Nov 2026 09:24:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=IJSC/6ph
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1795685080;
	b=m8KObYglsdnjDyfZrXKglBAU4uuwtf/pHbwDpxy/LPMYT7POCM6lYDGYnVmtTFImYzWf
	 3R7xSpycQ3fjOUw8G26fa+t/3TrD++6o9KhwsrQoOYl/MDPaKeMofiFkT/G/OH7WkU0S7
	 0Il9dbclTijQ/xdu5IlFMgpUtBXrrDPRicu0UPswOEohSHAFZGBuwN60pczrUTJ8J94/I
	 9SHfyEZr5mwpS9cB3aPZRa4z4rUHl5PiP/J46OyMmC+8IiYfeQo1hTGdPca4GxZpkK3kI
	 45ehChLpDLC7/qbxm1kwpInXjXX9QGzPlzW8ua/G/uSz7MPXR5pR9ErC0fKWJ8rm/og==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1795685080;
	h=DKIM-Signature:Received:From:Date:Subject:MIME-Version:Content-Type:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=pxVs869Ky/tzG5WFDjowEDHv4Ebj83QZWV8ziNXTFhQ=;
	b=2JOvxCJcQ0N91JawDxcAetXEN6oSCZlg63DNlVDIbfxngbhBe+tWy6kOvzY9tdaHVtZi
	 y16ClmK0o9gokBF1U3VkByv/lM1GBlUW75g87MWwkkMF9JoUoTulMloavjnNafOU+7Ct7
	 MajXSsXaDMFY57ygJy6/H7vN9SKtu1VHty7W6OvXCAiyQs4O9R9YxCxPwsffW3rYiMeA+
	 bJcg9jR0ur+KsE/uZJUFN2uevB1lW8niTh75STMnd1wXft9AvANyj6yn6ZDkWOhSijnq9
	 hVuY36JhGfauWntBOf6WII6fQZtIikygJ08gX7NZM/QjbuxyAPX4wj6sflCiFIqZGNQ==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 4C7401F000D0;
	Thu, 26 Nov 2026 09:24:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795685080;
	bh=pxVs869Ky/tzG5WFDjowEDHv4Ebj83QZWV8ziNXTFhQ=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To;
	b=IJSC/6phejv1PFX7FT8f4pEnn0xH+2io250f2b3hI1+Yi2rUbdX8Nu4dh5VcXS9wd
	 KDHuTuyRMfiMC3dANvuYoSPFkWrDEWdG81DAd4gbI7NNZPvmXTwr/te9trpdUffK+a
	 AQXRw4OP2tNz4V/2psaFyyOjnNRXIZ4QYtAFO2pRfXnuEKcbFS4TPBdA6tEt+B49aC
	 zYd0TvnRR15nlM18wibKH4sb5fk2+PkZZoF1Kx7aX15XebAV14sWwR4ySOdehhfRSI
	 YOsa9QjHAxIql4Kz1jzQKsaTcKO3pWMK5EtZOI2XJibJV5RF/PtZo7pxr+SjloiAu/
	 EwXddjMsudWxA==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id D16B44D359;
	Thu, 26 Nov 2026 09:24:34 +0000 (UTC)
From: Xianwei Zhao via B4 Relay <devnull+xianwei.zhao.amlogic.com@kernel.org>
Date: Thu, 26 Nov 2026 09:24:18 +0000
Subject: [PATCH RESEND v2 2/3] reset: amlogic: Add A9 AO reset controller
 support
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
Message-Id: <20261126-a9-reset-v2-2-e3d850e68725@amlogic.com>
References: <20261126-a9-reset-v2-0-e3d850e68725@amlogic.com>
In-Reply-To: <20261126-a9-reset-v2-0-e3d850e68725@amlogic.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795685071; l=1414;
 i=xianwei.zhao@amlogic.com; s=20251216; h=from:subject:message-id;
 bh=patSBH/uW6tkb/H97P+dDOJPShFdk5yhMtjXp5whRlQ=;
 b=MHFhPFUHkLDqEv33UPrbcR8spYOwBx0ACgduHP1nFxIhZPgZEQRiTELX5AFyTWTt5MBPzDhJP
 6FYexNy/gc+AFpoSWRliQ6He1ZXbnq4SgZOu+g6dAWo2YkXAG3vrC/P
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


