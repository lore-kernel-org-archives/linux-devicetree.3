Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.169
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794764598;
	b=CM13SP6Vlb9YlViWMZFILEC6dfUCOJeE5Jr2FbbNGeZpTqAtn409sWxgmxpkHh+RSxDR
	 CK5V22ZFvm00jb4t5RmTFeZRFpg+kkJXQmkmIvKF3iTzmbOioQn4aV64M26+DJUuUUgQW
	 s6LlaOkUKRHO4Ypfw8B8XaCoDyUwC1a/TxO3EOJpUtOJ+YuUIH6ZqlJsQQmb4Fggk/bfA
	 17RKvePgzjqMdjJaNVY0Gk4RANLN79m6aO1KKSEbbr9urD3k8flLG/4MOHyHd+JaFqqNO
	 Lps0Zxa8Mdj/f230zqjluwj06JQvZDoLIwYXc4Laty3pvM+yAQQb6nmHVHnHJUp2q9A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794764598;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-Id:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=Ny45OBe7md5aOufozmgYkErwn90rLNDQ3eho9bjVilA=;
	b=rzgKgiLYqhPaSaVQwYktrRj3U8ydmcuevgBr5A1U8wFBVvH38oHdCUhMs9rfwED8qEMq
	 j/iW4Lb7eEAakc7ShM3l37YibkGOs5u/91AVrWQy/h1tx0oQu2cAXqaN9Pj4/CdWIwv5Q
	 ytdZTYtTqIgWajblhdJqUUW+utW/NAZn19xd0feXpn5m5REq3YjF19pbMGTlS6V0qQAZ1
	 Dnz4zjurCF6gKS4MF/VR6TNpmbu4VSD5zn9uCFc72k7Ew2lfoe+4QoS33i/9rFeOJk1Rt
	 0jwDQLOOnT0v8lfNpwvpmeFLfsXmM8hJq08FOnXyF79Uk82mEE0Hcd7BeqUHAuENh8A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=j9vPGd20;
	arc=none smtp.remote-ip=74.125.82.169
Received: from mail-dy1-f169.google.com (mail-dy1-f169.google.com [74.125.82.169])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BEE11606A32F
	for <devicetree@vger.kernel.org>; Sun, 15 Nov 2026 17:43:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BEE11606A32F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=j9vPGd20
Received: by mail-dy1-f169.google.com with SMTP id 5a478bee46e88-37000e7234bso1628396eec.1
        for <devicetree@vger.kernel.org>; Sun, 15 Nov 2026 09:43:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794764597; x=1795369397; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Ny45OBe7md5aOufozmgYkErwn90rLNDQ3eho9bjVilA=;
        b=j9vPGd20QA4d1srp3DoZpoHFs2xzS/ViN3RJrX/XK6MGZwKAO+CMxanOpdescGz1Za
         uwzbsVA+H5Lh0x16eM49DuYJp/q66ePhUzxJievnH8PEodeslp9lPe8F78hpjPQSJoPH
         Mjv6OVIzPf2TKxeGcR58vtCzvtB14AIsi1/GYSssX1IWSRfWICjtDZjGIlMaKji1flkO
         4ySJsYSQa9F+i/WvDeNyp4+4vqcwhVE/f3ia58jEDAuSIJ0+Pod0jcJ62K7XKTz5Qril
         Dg1tOxu6DdHKahZersMMAGxydwGy87vTS8Xz4D/hptOR5j2JwfEd3OVD20LwnvAX3yAf
         vZ0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794764597; x=1795369397;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Ny45OBe7md5aOufozmgYkErwn90rLNDQ3eho9bjVilA=;
        b=dhBtjyrWDX4WHDVSz4i0ViZnoGcEzYQezsQf9B1oAsUY9NaJweXySc98s4sQcyB0X8
         yF2F2n5q298PRyIgLyQLIl2ZnPKffaejHRZdKYmuXTsAsdkn6ZQEICCKoISvxkOGuq4U
         RL/mCjnng8SiwIcxxA1xuk6G1oBWMDRlvERFeutTbvgPiHHNG4nzgyH3HeReOBJR/tOb
         5QDbBEUFw9m6VhHzS6MZTGbEGOEcIJebwtzLAFCp+CQmBj5mXODR6dmoAzk2TnXPPfqz
         RIrKAEHJhia0KIaEvQuMpnUnVoNvfkZhddfUZcr4sQH8rVJHP2ykj0x+vA5EgkFJLTi/
         iojw==
X-Forwarded-Encrypted: i=1; AL+hErEfnp3xvXTxjsoqDZIRw/OvllDhaTYAR20kiBesxhjHXXLzRx4qUwoDsyvDRhzoeXhLC4oBn292E7ov@vger.kernel.org
X-Gm-Message-State: APuU4Z/tkv98oRWWgWO56fqRm5uvsjAn7GniTdX5CN+OYuYGNgFFZ834
	NVl3NDGJceUFEguJziSJ56rVSox5TZehfsK27c6ltegaa87hrkgh9bUq
X-Gm-Gg: AYBFou2GajMLnHJHqkIA+RXjgPJyl3kh2OACzFIGU4mwsCWqGbghkCln8ceI3bw0SuA
	92cfaZrUimk005kqY4ZdT2XiNOneUN5wVeFxJ/lymWiDa0O1SeWwfq+ukN/MFsU1PL1NFW1W8hs
	mVTuTbTJ4SmxM+oLoAB1v0xiJCuDt7CjBWIXWN+uX2MxxoKsPW9JPVp1SLKxCW+GFqzGPMdYBYX
	1tIhtCTmt+Y9FOHrzCu6PTcOHK2DC8oBQLX2wkXLAEIWZhhTcdXd1D1aYjTQjVCashmUW+5G9zU
	3XJ4QGC39QuddDJosD+E/fbiO0czGs8ZJp6rk8PCBtbGk2uRFq55wVrzIN0zUqdOlxzkXZ+CzmH
	L0rU0h5jTn8dkpVNy86ABsPsGECBF9pWBrLyy59rjrNEDt+PvwuJgx2gmItpqMRIkr3Y/G+rRmP
	MuOXtgALdRIq7bF594qmUX0S/DVRyvcgN1R75fbSOn6f20xFXDUqDCW0D4Thjvi48f3mbUeEkI6
	imaQrJlYIaPs1hqWR0sQuzceopm4krP71RIunLd4VIz1QfqR8dXfdHWzgPOOTVExZqtgr9K5yt+
	N9uhnwf1Nv5KDHPuBr//GTG3Y+ZcXKs0vzvAEt5YX4z7vXhwjnO7H+FLDMmyGf2nV4LbRFeMAWN
	ZgEkrWU6uTFBzIwdNbDVjSg0aKf5nzFE6obUSjKe9QcRB0pcNfSPDac96R5TY5jqxfqsrBSx7zl
	/yxV4ZhfDOrQGuQG9rVOZfUU7BBQ==
X-Received: by 2002:a05:7301:2024:b0:36a:18e2:64c with SMTP id 5a478bee46e88-379655d3d12mr9335361eec.11.1794764596860;
        Sun, 15 Nov 2026 09:43:16 -0800 (PST)
Received: from suraj-HP-Laptop-15s-fq2xxx.tailee6f87.ts.net ([2402:a00:163:3509:9ac3:b274:12a6:a1c4])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-37956bb0c40sm28204663eec.28.2026.11.15.09.43.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 15 Nov 2026 09:43:16 -0800 (PST)
From: Suraj Sonawane <surajsonawane0215@gmail.com>
To: Bjorn Andersson <andersson@kernel.org>,
	Bartosz Golaszewski <brgl@kernel.org>,
	Linus Walleij <linusw@kernel.org>
Cc: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Srinivas Kandagatla <srini@kernel.org>,
	Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
	linux-arm-msm@vger.kernel.org,
	linux-gpio@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Suraj Sonawane <surajsonawane0215@gmail.com>
Subject: [PATCH v2 1/2] dt-bindings: pinctrl: qcom,sc7280-lpass-lpi: add ext_mclk1_c
Date: Sun, 15 Nov 2026 23:12:36 +0530
Message-Id: <20261115174237.48908-2-surajsonawane0215@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261115174237.48908-1-surajsonawane0215@gmail.com>
References: <20261115174237.48908-1-surajsonawane0215@gmail.com>
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

LPASS LPI gpio5 can mux EXT_MCLK1_C. The SC7280 driver names that
function ext_mclk1_c, matching SC8280XP, but the binding enum does
not allow it.

Add ext_mclk1_c to the function list.

Signed-off-by: Suraj Sonawane <surajsonawane0215@gmail.com>
---
 .../bindings/pinctrl/qcom,sc7280-lpass-lpi-pinctrl.yaml         | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/pinctrl/qcom,sc7280-lpass-lpi-pinctrl.yaml b/Documentation/devicetree/bindings/pinctrl/qcom,sc7280-lpass-lpi-pinctrl.yaml
index bc7b8dda8..5f7870fa6 100644
--- a/Documentation/devicetree/bindings/pinctrl/qcom,sc7280-lpass-lpi-pinctrl.yaml
+++ b/Documentation/devicetree/bindings/pinctrl/qcom,sc7280-lpass-lpi-pinctrl.yaml
@@ -64,7 +64,7 @@ $defs:
                 qua_mi2s_data, swr_rx_clk, swr_rx_data, dmic1_clk, i2s1_clk,
                 dmic1_data, i2s1_ws, dmic2_clk, dmic2_data, i2s1_data,
                 i2s2_clk, wsa_swr_clk, i2s2_ws, wsa_swr_data, dmic3_clk,
-                dmic3_data, i2s2_data ]
+                dmic3_data, i2s2_data, ext_mclk1_c ]
         description:
           Specify the alternative function to be configured for the specified
           pins.
-- 
2.34.1

