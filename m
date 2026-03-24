Received: from mail-qk1-f181.google.com (mail-qk1-f181.google.com [209.85.222.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BA12F371CE1
	for <devicetree@vger.kernel.org>; Tue, 24 Mar 2026 02:01:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774317700; cv=none; b=jlkO3fuuSt1ByUJOCXHhE0KDc5xZls1yvs5s9bxKwSYOfMQVgGq6FgtcdoNMx1PzjCpqhORaP7Xc61ytWHWbXQRglDpGyHxkXisxLOWU2o/3X3iVFke6LPz4xZVDeXeGWfuhwm92LCcUYk9wyuh4LazUPZfeAPF01rb/MP9/grU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774317700; c=relaxed/simple;
	bh=C6pslvwk58QZS/2zykKJiaeBxMWH9ps/RxZto+oATu8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=tPgo/muzp3TchNrwsnu/TU9mMrmtK6KMh4TLe3ovdFbCto8ZS+Qt8bQ9NyOjFmYEXVYiZymfhZFD2/mW/GTGGNlc1N0pXm/AvyMLvgWqiyM4AKh8x0i/3xxvBwgotJ7Fy1SpWewnFiSZfzVhK8uNSURl8x6vx8bov25KWqGMrSs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=SfaYsNmW; arc=none smtp.client-ip=209.85.222.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="SfaYsNmW"
Received: by mail-qk1-f181.google.com with SMTP id af79cd13be357-8cfd44fa075so94486485a.0
        for <devicetree@vger.kernel.org>; Mon, 23 Mar 2026 19:01:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774317699; x=1774922499; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xBs5FO1PS6bEgGJFgn7J/YLM/i8VXi+ZJKbnghNzohk=;
        b=SfaYsNmW0IwfbMzmI4JMhZWzwpvHC8uxEFvsEqOxz/1gOk8+SKiwqrss13qrEnFwfk
         1BKMWDha1de8cgfg8x2L56kwXE/rrzHB05sKXDX8rrb5dIZiQmEYvnpEmin6ktFCF4hS
         ipMsGVaJi67SfAtr+i0N0BXUW5+AB4DBJnKUZtBi7utgbsuYV9U6pvEJzsRleoSKBBVT
         7asajKyI040Y5PMm8XLu6lv9bRAtvJFRPCY+9HSIj1USXl7ZVw9Z9P/PW78Y0Tsh20DU
         fr12HZ2nx8BEtwxoiFIM9FT/SgbVPapLlz1GC00hDBq7XblbqxIjZ117dkWnscqJacuW
         GlGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774317699; x=1774922499;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=xBs5FO1PS6bEgGJFgn7J/YLM/i8VXi+ZJKbnghNzohk=;
        b=BxWj6Cfeo5aoUDQlQb3wtiOnaFneJfMorOn1bBdq9jQTRHIdJzKgqE3EWIwbuQWzc1
         mLggimp6ejz//FpJXa/6uujfAOkTp9N+y8r7TQKkMn5QKVFXnzOK7BVAOuLC+RuDejFh
         ckTVr3aGWH+4TrkZGp0dnTKqSBwdGKd1VhmgyTQZGxKADTDGWZBRGb1V+a+bTGT9xg1w
         w1EL7RK/7O6DFxqF0olQRzovkwJdMcBzNWwAY9rsSGp0F8RnRqqXzl7wMkDDLH+WYm+o
         rQy6JeTcIbB1fp5r1H0PDSrbUmse22XL299tteiTQ0n+gYRc4TKr5tL+zwiGUEpjm56V
         fFoA==
X-Forwarded-Encrypted: i=1; AJvYcCUnydYbs0IVyHinR5EUNA99MCmxh3wi8jMzKjCV5bXcSIjGtVoj0LP9udqb38057My0IQu0NteGGKCg@vger.kernel.org
X-Gm-Message-State: AOJu0YwKU+4FjlNqaG+TRFRePiOubJCzHtZHkJ4Pfg3nnptDbTU39bi/
	yIA6ocdQ2ftFzPgQ7N7ug0QKe5oTSSw5MGexzoGo+fa7bvPjG2jD+0WK
X-Gm-Gg: ATEYQzxzmEaQvuISe6YQpEIAWPluaejUa+DT+B/bnnjfedkOYh8lMST/4MJh4beySGK
	Z+i3R33kYLViFni1gwrCAEez9USjKVmzMjQR2B55f1m0mYS+emIDdMUyQcI3plp7u2k5eg2Ghbc
	oo+bhzng55jJmUWqylSC8DhnjtnrXIqFrVzS+xgrxIfIfczDuoBA34z/7CSHGvPOoai4Z3mP/mx
	2X2x20vXO+wwY5vuwZ6eCYwfFmZo+Wsxzx+v0ZJhC5IOCuD03MsZmG15LAsPgJkn4tLid9tXKbJ
	TEGbkYCl4buWbM9by1I4pTwH0JfgXcPcvlCzj7R9sPUo7QNV8kKhEYD8msn3+llfKGidOS5Kr0q
	BtLn4l0x0YW1PsEL97s53/zQTp46eipERTJnb/xzgLWKhFLxbBWuM0k9CWP6pJCAma5CN81h+tm
	rqN7N6+LZAKU/kEYT9Gt/5Fx6d52G8MrlwMKMPoNU3W3R4Acipe/qNebjKEmpHNINFRxu9fJPp+
	PcGgy4nXAI4YNc=
X-Received: by 2002:a05:620a:44d0:b0:8cf:de1c:edea with SMTP id af79cd13be357-8cfde1cfe37mr1423972085a.13.1774317698665;
        Mon, 23 Mar 2026 19:01:38 -0700 (PDT)
Received: from localhost (bras-base-toroon21-grc-75-184-144-58-243.dsl.bell.ca. [184.144.58.243])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-8cff3119121sm140450585a.16.2026.03.23.19.01.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Mar 2026 19:01:38 -0700 (PDT)
From: Richard Acayan <mailingradian@gmail.com>
To: Mauro Carvalho Chehab <mchehab@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	"Bryan O'Donoghue" <bod@kernel.org>,
	Robert Foss <rfoss@kernel.org>,
	Todor Tomov <todor.too@gmail.com>,
	Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Tianshu Qiu <tian.shu.qiu@intel.com>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	linux-media@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-msm@vger.kernel.org
Cc: Robert Mader <robert.mader@collabora.com>,
	David Heidelberg <david@ixit.cz>,
	phone-devel@vger.kernel.org,
	Richard Acayan <mailingradian@gmail.com>
Subject: [PATCH v11 4/7] media: i2c: imx355: Restrict data lanes to 4
Date: Mon, 23 Mar 2026 22:01:29 -0400
Message-ID: <20260324020132.8683-5-mailingradian@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260324020132.8683-1-mailingradian@gmail.com>
References: <20260324020132.8683-1-mailingradian@gmail.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The IMX355 sensor driver currently supports having 4 data lanes. There
can't be more or less, so check if the firmware specifies 4 lanes.

Suggested-by: Sakari Ailus <sakari.ailus@linux.intel.com>
Link: https://lore.kernel.org/r/aW3uFcT1zmiF4GUP@kekkonen.localdomain
Signed-off-by: Richard Acayan <mailingradian@gmail.com>
---
 drivers/media/i2c/imx355.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/drivers/media/i2c/imx355.c b/drivers/media/i2c/imx355.c
index 9ca87488c933..27a5c212a527 100644
--- a/drivers/media/i2c/imx355.c
+++ b/drivers/media/i2c/imx355.c
@@ -66,6 +66,9 @@
 #define IMX355_EXT_CLK			19200000
 #define IMX355_LINK_FREQ_INDEX		0
 
+/* number of data lanes */
+#define IMX355_DATA_LANES		4
+
 struct imx355_reg {
 	u16 address;
 	u8 val;
@@ -1705,6 +1708,9 @@ static struct imx355_hwcfg *imx355_get_hwcfg(struct device *dev)
 	if (!cfg)
 		goto out_err;
 
+	if (bus_cfg.bus.mipi_csi2.num_data_lanes != IMX355_DATA_LANES)
+		goto out_err;
+
 	ret = v4l2_link_freq_to_bitmap(dev, bus_cfg.link_frequencies,
 				       bus_cfg.nr_of_link_frequencies,
 				       link_freq_menu_items,
-- 
2.53.0

