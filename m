Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.49
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793016573;
	b=2RUz1zCiBcPVnKm9ggmAWahETG49rl7/isZ/y/2L+VoCARMFUuawwzvilXXPrT24GJjd
	 2QBn4q5TfD45VFkfU3IQix70eI5Fol+irzB8RTIM7XvoF9C0qTUraNCBJ/vaEzsgPRL0h
	 HZIJIOdbY7qHde5wc+LuwW+gxfHQxYddjzalpqxfZ4QNBicjtIfon7MuZjY9+KeHDo0Z1
	 iqik8M2oaIAmIDUlN7pQr0XQ73EDOggFKKRGRioj09b9/pi3hnQsa7qYjN75OtClpcTHK
	 5PmnDf/F/UFgezUzgFzOEBCDh9lCJwRc3SUGostVSGj7yog5jaSzOSHafcUvs7EQwtQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793016573;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=1XPOBam7G51rl7n3GTaB7HD60REecu6em+DTE1e8j8E=;
	b=2RAWIfiQm2s6FE1Q43k/O/gATNWkYloXDs1xSqVknfQSIYmqvPNTBkGfDqKkSzioeP8o
	 fUtAUBw8X+Uuo/aNwo3v8kbilN8koKLp28CMfCQaBJntFYuaopbzj/CJTis1K3swL67w7
	 bjlMHGiJp2q31eiDAJEsrsJv6czwU0zVTQ48OWNjl5DRv2QxEyxMY4m27f4nakConJ/Zi
	 WULf0ORy2GEm02fjvpXg4kjHNFHU7lXrgn3Vssxnt2MrlnFhYOwVUN6XPmIFHANVJ8Lfj
	 yb/rGjiX0QxvExAa99HxJnfiH5dALmoggWU6f6xh0sZyitydLCHiSXOEcV+sapn9YBw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=IOOm4Ef4;
	arc=none smtp.remote-ip=209.85.128.49
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 24561606A31D
	for <devicetree@vger.kernel.org>; Mon, 26 Oct 2026 12:09:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 24561606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=IOOm4Ef4
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-4a210470b49so23245335e9.2
        for <devicetree@vger.kernel.org>; Mon, 26 Oct 2026 05:09:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1793016571; x=1793621371; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=1XPOBam7G51rl7n3GTaB7HD60REecu6em+DTE1e8j8E=;
        b=IOOm4Ef4YDTqKiGToDXLmbxqjqQL1TIvvhk4ERP/ch8VUtWXD3OyfF8p+pG1NnZ5es
         1JHByO622WHqoByvRR3qc0KFrjoNSLhPEtS/e6kyE2qtkHRZz+YN2uKJHltG52/MjNXm
         S2Xp1R+AzbvgHiV1DFxRvyUasvOfVknS+PARmwyTg1YfamwiJqi8gNiAv8JQkVbHaD2d
         nSgxiGBhnWjdv/Fh0lRfRyOzDgRES19kECggb9GYwIDWimthSxLb/PxGfdWNh94HkxiM
         Ft3YgjyPk//uVZ32BqWrkLlgSF6k8mLAXe+x4dTxhU3cibtdeFvxARYLlkOUJFBfKfN8
         +VdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793016571; x=1793621371;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=1XPOBam7G51rl7n3GTaB7HD60REecu6em+DTE1e8j8E=;
        b=u55wkKxz9GH4H6oNrzVjVIMHIzuFaq3xAhIlJe5L2sYKXYFXClbgJJZjhNwedNGxoP
         LCuAZzwFkfJK935ENBhLkWkxH2dj8XqQSzQOAE4xwBx7lBEgDIBnU+5NCeLwjLRcnpdG
         YxNooCTAHNxQW7BZzN7fmUFdUafg3JI/sLLpqJHXeFKfpdNU829CiGg3IxV5kMRLWcOE
         63otEzrlRdX0H6M5cncXvwIHx4trXX72jJd/Ie2D/UgrCgMfgGFY9VqaG8QifNN/gWcB
         Tcsx6qySzOhvzWroRVDdht/6eA8IlhOGCv/RUeNqU7yRW4WStc0HmnLNjOIbtNh4fJeb
         mS+A==
X-Forwarded-Encrypted: i=1; AKwUvBwXDr4HklIZFo2Eb54cergKiycNu5iztfp5gMkOincRGvh4QIS7JhwMJbvsq+RgXkFB4GW2Q/Xd3EBf@vger.kernel.org
X-Gm-Message-State: AFq9FYKADxOuYsMDMh+QWhYj4ttdMRgVtDM9302sYTZU/shNDdp8AaP9
	4VO9Xx8XL1ix0sRjRmcQmfbjFsKFVSmUn440GipI5kc1Fc0e1OKco18N
X-Gm-Gg: AYBFou3H06Zu0mQCWDcymo1xjNDKnhCvRvaJvvVWivDjQ7TQd9vcqMnLEr1/ZFvFM3W
	ynb2unPvDnbdwlxn3zvh4eIZmBTesP8VTfKp8XEV7N4IczTgx7xZAY+W6RAyE81XNpv+Jxxavzg
	vo1E+N11P9hj3cHCtey9MwytfbCXsep3qYZnZr9nAigmKCR+S5JcPlR4j5tXT9/JnDWTEQjpvyO
	zkceTu+lS6n1DXWEKD2pR2hbQvnxcYfxbbOSTE0dZWLVr5/wmfa3xWK0F4/rFjn7dmHlOyAE6tw
	c9V4nbMsSv366psbdUA+BHkgtjCpFn1dYk0LicIZ5g15kU3pcquQVTquVpB+8gI0a0IcsU/UJ3B
	89EJkdrwpsSnYjmP8RBu/fHVuCVQAZ3sL10tsdVNIxCTm7NYn5OY8klyTl8/R7BJhw0J/BjW4qx
	GjhAMH5YxM5pgk7Qqz2fL1jVVdNce3FOJ9s12dVdQfXImRfUrbmc+jjdwP6k7Fys2dVj0sBG26J
	ASqTiEH2ZyOduR6kzzyCwjUnuCv/XY8ZnVm3Mcfv9jzZ6E6JsmXXmVAywN6u4/APNm2bOryV35a
	xL1RyTAQuRRlL1jrMLV+FKYgUKf2OUmdtw81ngv5VgGTUlTVgyMbrmclZrglHVfAIhji7tomrpe
	cF3k/
X-Received: by 2002:a05:600c:8b86:b0:4a3:59c9:a754 with SMTP id 5b1f17b1804b1-4a35acb17bfmr117309135e9.22.1793016571251;
        Mon, 26 Oct 2026 05:09:31 -0700 (PDT)
Received: from threadripper-fedora-workstation (dh207-14-234.xnet.hr. [88.207.14.234])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a35a00e1b0sm152200695e9.3.2026.10.26.05.09.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Oct 2026 05:09:30 -0700 (PDT)
From: Robert Marko <robimarko@gmail.com>
To: andersson@kernel.org,
	abelvesa@kernel.org,
	sboyd@kernel.org,
	bmasney+clk@redhat.com,
	jbrunet+clk@baylibre.com,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	konradybcio@kernel.org,
	taniya.das@oss.qualcomm.com,
	ansuelsmth@gmail.com,
	john@phrozen.org,
	linux-arm-msm@vger.kernel.org,
	linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Robert Marko <robimarko@gmail.com>
Subject: [PATCH v2 1/4] clk: qcom: ipq-cmn-pll: Correct IPQ8074 NSS NoC rate
Date: Mon, 26 Oct 2026 13:08:12 +0100
Message-ID: <20261026120920.1667982-1-robimarko@gmail.com>
X-Mailer: git-send-email 2.56.0
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

The IPQ8074 NSS NoC bias output feeds the GCC NSS NoC clock without
a divider.

GCC and SSDK (Qualcomm vendor switch driver from SDK) both configure that
clock for 461.5 MHz, while the CMN PLL driver reports its parent at
416.5 MHz.

Report the 461.5 MHz output rate so consumers see the correct rate.

Fixes: 4e36f8ab45c4 ("clk: qcom: ipq-cmn-pll: Add IPQ8074 SoC support")
Signed-off-by: Robert Marko <robimarko@gmail.com>
---
Changes in v2:
- New patch to correct the IPQ8074 NSS NoC bias clock rate.

 drivers/clk/qcom/ipq-cmn-pll.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/clk/qcom/ipq-cmn-pll.c b/drivers/clk/qcom/ipq-cmn-pll.c
index 74a2043632b7..76678a4d6b7d 100644
--- a/drivers/clk/qcom/ipq-cmn-pll.c
+++ b/drivers/clk/qcom/ipq-cmn-pll.c
@@ -237,7 +237,7 @@ static const struct cmn_pll_fixed_output_clk ipq6018_output_clks[] = {
 
 static const struct cmn_pll_fixed_output_clk ipq8074_output_clks[] = {
 	CLK_PLL_OUTPUT(IPQ8074_BIAS_PLL_CC_CLK, "bias_pll_cc_clk", 300000000UL),
-	CLK_PLL_OUTPUT(IPQ8074_BIAS_PLL_NSS_NOC_CLK, "bias_pll_nss_noc_clk", 416500000UL),
+	CLK_PLL_OUTPUT(IPQ8074_BIAS_PLL_NSS_NOC_CLK, "bias_pll_nss_noc_clk", 461500000UL),
 	{ /* Sentinel */ }
 };
 
-- 
2.56.0

