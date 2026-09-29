Received: from mail-wm2-f13.google.com (mail-wm2-f13.google.com [74.125.225.141])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 392BD3D6CDE
	for <devicetree@vger.kernel.org>; Tue, 29 Sep 2026 02:11:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.141
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790647890; cv=none; b=W3xwxyH6+WY2euM9k0EyqqxKBhQvuE8AMNI4bUKO5Y6uZ3tTA0izxR7qebUAfn+Dpz18h34+p4Sb50OxmdGX53vFlnz6Xo4j1CrOBrm6ASQffgk6anx86nn9h8SzZdpqm7dibJRzgbYO6S4GmIJvyjTNbKKyrWqmO49fY5xpVec=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790647890; c=relaxed/simple;
	bh=wR8JJ2pL5QeRqlJm3/ZAagrZ56dstDg3U9pOmu4dPTQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=niQqd7svlCv1/8c9w22f+U6GFe5rteSmfuFnxxR0W8w5hkUaXwnJDCYehmY8GFlykfuUpGUg6HPN9ObAFmnP0VU0YVb3EIs+K76egJbxxdDalb6q1UFWbNjJPTmxZkmZn2XZkLxnJFrMSDegGpPftnJ4W58TKVOSJazjAbkdwoM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=yzuBYBQJ; arc=none smtp.client-ip=74.125.225.141
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="yzuBYBQJ"
Received: by mail-wm2-f13.google.com with SMTP id 5b1f17b1804b1-49e6c0fce17so19167165e9.1
        for <devicetree@vger.kernel.org>; Mon, 28 Sep 2026 19:11:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1790647884; x=1791252684; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=I4XMMwg0nXpx6NtPrekOPsMuFobBMMqkvCqEzIOlP2s=;
        b=yzuBYBQJoZ4PZzAaDWi+N4MfoyBA/53RkZRvqiRH0FO5Pt9e/ydnij8kx5/+ZtbKAD
         TMCKnB3X6OJhMGO2FNiCMuHXrhqiDTqwXrM3si017hiZpjPfuVhtWYB897hCg7Pk7DCB
         dPgi6M99M34Nq7RpRWi2S1VKyVmUx6XhpFEjaX0bcsrO7CInzz4d7VBI0duwI85t6nzG
         Z6bBGExprh7lCHOJYJ9r/IJEuUOC2uwDnY1XafxRQsTQYSx6y901WyT3CaPAVvhRz7rN
         4nWao+iz/jzjtxEROU41vyUjzPA9cOtcdJ511GRDMOxAd0bucY+OPpglizyeKdmdAFwf
         IXNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790647884; x=1791252684;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=I4XMMwg0nXpx6NtPrekOPsMuFobBMMqkvCqEzIOlP2s=;
        b=ecEgBAkTsda3Sz1sATmO3ATFcS9vIg9dH9CvONt84FoWTMuflrisGxJ58aDvE/9ggA
         MexKBA7Kkv+xz3eO+MFfkUZOxmwfoQv3IY/Bcof1DL4uvFislcM12QlkC600XabrX2QB
         nc9LyJVjAShCPMLZWHW1zLBFjmgadcIyV3RSWeqUCxPaNxMb0YNlLjmx3pze5P7hTiru
         A/t3cQATXmOnk5fj8a7XWeRPoFCrWuGREzVSL1a0G/8C2S8RHxidVzEluyV1gCLclrhS
         Dw/OjMWEabWm3MYlhD3NMOIw+obB4AKqcascBAuDZzAw5GcPoedvOJXx7e5sIVnE6hV8
         7vJg==
X-Forwarded-Encrypted: i=1; AKwUvBwH4qZMC0g85/mux9OIuJi+hkxpnSGM35/zrcISujNs1J0VoDvZtzT/b1a/H2iQxVrpPbJ8gQqRbRgi@vger.kernel.org
X-Gm-Message-State: AFuF++k5aMovyb/QU26Dgxx5SWCI8eWSmJfVm7UWdKPEu4YTJRvpovE8
	KSequahkXfY+HkvT1faDeSs4wf2bsJT4KZkyL03I1E+v0xEokER+1YTSb9wIkrK+q3U=
X-Gm-Gg: AYBFou2R9RDuxoVd/Q2mlBiLrBec+f8p/10l3d9Os+Ra5R4VDcE3/45csBC1awtMwaL
	gJEmoQTSKHvajaoDiq+kjmK5nE7c6VcnHSdG67u4LpQkTZLQQdYVzYAvAB/bMMDty6o5C7xF8cQ
	GRS6HOx+xpcCUIFH4N9HFM/6QHHxUG673rLF9Qy7gAWiRDERSI/Xi43JW81alUFGukQFmNwINIb
	nfdT8BXzcvVcdPUmn7kFEOvPRJs3YIqbKh8IIUOnoxU5UQfBkCpAVa/bAmW9xGMLHZOyF/0YlJU
	xGEhqKvEyLzMEi3v+mk+jfrJ+43yzIzPVt5AIYMiLQBOvUnGJISgAysZf5MQvVieOIg+//FV/On
	6vt0pwbpdzju9aP20LGOvw00wKQ9VcP+K2DcH9VPuP61NRhQqUPB1s+n3NJNhDV28Lzdw7z4jMc
	LN2WlZXFiCvkm4Khp4L2LqXbGiFQq7/F8uBy7RyzB5/WJ1faCn1jtQiHi0LDYlvo588OZYleKc1
	yPEtuDc0K0oYB1W56muWwZHPAuf3uv515iM7bJTteOakhi3Ud5zVz96i3p4cg==
X-Received: by 2002:a05:600c:4f45:b0:49f:fed0:fc47 with SMTP id 5b1f17b1804b1-49ffed0fe54mr129390335e9.1.1790647884336;
        Mon, 28 Sep 2026 19:11:24 -0700 (PDT)
Received: from [127.0.1.1] ([94.4.85.166])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a00d0f66cfsm42070145e9.14.2026.09.28.19.11.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Sep 2026 19:11:23 -0700 (PDT)
From: Alexey Klimov <alexey.klimov@linaro.org>
Date: Tue, 29 Sep 2026 03:11:17 +0100
Subject: [PATCH v3 2/2] firmware: samsung: acpm: add Exynos850 support
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260929-exynos850-acpm-firmware-support-v3-2-473a69fc8a3d@linaro.org>
References: <20260929-exynos850-acpm-firmware-support-v3-0-473a69fc8a3d@linaro.org>
In-Reply-To: <20260929-exynos850-acpm-firmware-support-v3-0-473a69fc8a3d@linaro.org>
To: Sam Protsenko <semen.protsenko@linaro.org>, 
 Tudor Ambarus <tudor.ambarus@linaro.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Krzysztof Kozlowski <krzk@kernel.org>, 
 Alim Akhtar <alim.akhtar@samsung.com>, 
 Peter Griffin <peter.griffin@linaro.org>
Cc: Sylwester Nawrocki <s.nawrocki@samsung.com>, 
 Chanwoo Choi <cw00.choi@samsung.com>, Stephen Boyd <sboyd@kernel.org>, 
 Brian Masney <bmasney+clk@redhat.com>, 
 Jerome Brunet <jbrunet+clk@baylibre.com>, linux-samsung-soc@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org
X-Mailer: b4 0.14.3

The Exynos850 SoC contains an APM co-processor. Communication
with this hardware block is established using the ACPM protocol,
which handles IPC messages for clocks, power, thermal management,
and PMIC control.

Add the "samsung,exynos850-acpm-ipc" compatible string along with
its associated match data. This includes the specific initialisation
data base offset (which differs from the GS101 offset) and the
"exynos850-acpm-clk" device name required to properly instantiate
the clock provider.

Reviewed-by: Tudor Ambarus <tudor.ambarus@linaro.org>
Signed-off-by: Alexey Klimov <alexey.klimov@linaro.org>
---
 drivers/firmware/samsung/exynos-acpm.c | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/drivers/firmware/samsung/exynos-acpm.c b/drivers/firmware/samsung/exynos-acpm.c
index 942a2e9f02f5..5a16665e941b 100644
--- a/drivers/firmware/samsung/exynos-acpm.c
+++ b/drivers/firmware/samsung/exynos-acpm.c
@@ -39,6 +39,7 @@
 #define ACPM_POLL_TIMEOUT_US		(100 * USEC_PER_MSEC)
 #define ACPM_TX_TIMEOUT_US		500000
 
+#define ACPM_EXYNOS850_INITDATA_BASE	0x7000
 #define ACPM_GS101_INITDATA_BASE	0xa000
 
 /**
@@ -876,6 +877,11 @@ struct acpm_handle *devm_acpm_get_by_phandle(struct device *dev)
 }
 EXPORT_SYMBOL_GPL(devm_acpm_get_by_phandle);
 
+static const struct acpm_match_data acpm_exynos850 = {
+	.initdata_base = ACPM_EXYNOS850_INITDATA_BASE,
+	.acpm_clk_dev_name = "exynos850-acpm-clk",
+};
+
 static const struct acpm_match_data acpm_gs101 = {
 	.initdata_base = ACPM_GS101_INITDATA_BASE,
 	.acpm_clk_dev_name = "gs101-acpm-clk",
@@ -886,6 +892,10 @@ static const struct of_device_id acpm_match[] = {
 		.compatible = "google,gs101-acpm-ipc",
 		.data = &acpm_gs101,
 	},
+	{
+		.compatible = "samsung,exynos850-acpm-ipc",
+		.data = &acpm_exynos850,
+	},
 	{},
 };
 MODULE_DEVICE_TABLE(of, acpm_match);

-- 
2.51.0

