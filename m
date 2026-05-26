Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5DF5E3F8883
	for <devicetree@vger.kernel.org>; Tue, 26 May 2026 13:31:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779802304; cv=none; b=lBmuMrNVY2bv9Gof1tJzptj/8E5au/FnxltNcj9t/KXk4lrBnbHClW/W8AHEzaZ+1VcCsDTdVzrMl8FYL0eK0//f5WkveM6YP5bkng3Z5FXWaBschCxsCYNtR2iQDSYI75fcyE2LIqOFXH41MdsBWqogoVSkKUsjk7GT/SOg8PM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779802304; c=relaxed/simple;
	bh=JnLKribf6AOHWDcyQv5gYJuWC2U2xXYnGbnDQ8hOUS4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=neY7uXK1c6onhx3k8lRG+amVCQTALfdeYXF/uZveh1qNUI/nNbwH9bc3HUKubzSiKjP38AjMT793JzYb/+t2pta5WrwT8JVTnRRllW0c2wYFvAKi3uQZ0ouyUDoK2VSP/QRJ2b72mSgmMCb2+s7TEAr9ochukRJMy0VZmJTLJv0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=MkFnESDZ; arc=none smtp.client-ip=209.85.128.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="MkFnESDZ"
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-490426d72f7so39312525e9.3
        for <devicetree@vger.kernel.org>; Tue, 26 May 2026 06:31:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779802296; x=1780407096; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=amBSrb1L86JvC9qeeZudzfDQINj7fZsVpdnG470cOWg=;
        b=MkFnESDZ7DLJ9+quB3dxFSDweMX9dE1XkK7rPHfSbBH1SByaoAfLapOwalTPAFOebE
         6dwiCgT78lSxCDTZGTSW/9w3pf9YTx6xA4E2CLksFQDXRyLfdqVx2eea5wF/xkcYytDu
         CUFrOjhMgTBkllaLKxTCx9cEnug4KR+0ByL+V1c4Cz5leD3ei/lBJ9G5BH9RWz4YWrhe
         EuXqZcfFmRM2O8uuUAbLRNNJ73g8phLPsG9rfX1lRm9szKpVC22HOBkOqk8hdnyGh4of
         49rDKBXFSN5NJee9cCXvW0Lx6U7x9Bma3j+0h1iMf2b2004N/L4QuNKdx8t3ezTnFo9+
         RvHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779802296; x=1780407096;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=amBSrb1L86JvC9qeeZudzfDQINj7fZsVpdnG470cOWg=;
        b=LWSMu4SsehKLXh07xuGYLWYQ+fatAymO9Mq0wCI6JO5vE+7jeDDjpIZfxkhY8QncAp
         2gvKlvFwP7QlJ9ZgjkY8wF3Av5aDq3/9kTQpXvyGGzaGNFzDYkeEVQIIMDTmCNkFxbcE
         KvL+dnx9Yc+jNvjGEQ7ovJUqIZuWhMOdMsWjJ1GXQUssV6lZ7J8GxcAWe2wn15+vkGMB
         OKK/IBYBJplbRmpD+6oscxe/W8aX9L8I01SudMA/0w1Clgfyi035yc5XYD+U6/HvYBrE
         ZZks2F7qC9fSgxFgWZ1KCyqjoDd2eERnGUogRhWoEyHRjRnhG3YwbL1/9VjLsSHY9BP5
         4qEg==
X-Forwarded-Encrypted: i=1; AFNElJ9USnP7MTe7AZpM4LJPTUdOANfSgfzufds6l/6WZ96+y3LhRUXorjCERLkBCMYfLSKjbuUL7s6Reo/j@vger.kernel.org
X-Gm-Message-State: AOJu0Yymn5NfPwU76/1fk7r/IcDkx8DLQCdfBJ3hIsRlj+ZjUAY0ibLO
	SwodeLcT7LrU/4dgkBdVW3gPFb3EbIlo3Vio0DSZ33bEhYV1Rnu4/qSH
X-Gm-Gg: Acq92OF1PfuYPNKcTFOrE0bS7IfmFnBGEGBigKRce6UJosdxMxUo04zuG61sdybMBCn
	SPOAThYhdUsStQhLgIr74Rxw2JwKd1KEbMRIjW2yJZTGUhIJDUnmm2Y7VeRCx3P41d9pzygxk4a
	bOVOHisZWxXlKhQJ0PVsGfM8zMajXst5VFBfohg0vOKFMb2GDlyzZ/nLgGyxkorKOyTyH7juyJX
	1A5x8mypT3zaaSZk5AYXislkqORbrHQN2uPmaul3eSqNPytNBCEe7tkyw/mVfNyc7+hpdpd3En2
	WRSmkjox9gKlJH3/1UFrEMQFjv++Cnmeuvu6TpSrC6bqqO4thFkyeh1yK89GZBv1MPb9M30b7gi
	EucLh30gk+U/Y8xStvXa5ibwtRtJe3xJN22MQj8rwc5jTBuGW51VWWNTN0898h3/WWN7TQOAXtt
	axa9knPwOeJ1YB89mrWhqpq+AOqQ==
X-Received: by 2002:a05:600c:3592:b0:490:44eb:c1d9 with SMTP id 5b1f17b1804b1-49044ebc292mr352432175e9.28.1779802295540;
        Tue, 26 May 2026 06:31:35 -0700 (PDT)
Received: from [192.168.0.39] ([79.133.247.80])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-490452580dfsm170958895e9.1.2026.05.26.06.31.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 26 May 2026 06:31:35 -0700 (PDT)
From: Erikas Bitovtas <xerikasxx@gmail.com>
Date: Tue, 26 May 2026 16:24:25 +0300
Subject: [PATCH v9 2/8] clk: qcom: gcc-msm8939: mark Venus core GDSCs as
 hardware controlled
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260526-msm8939-venus-rfc-v9-2-bb1069f3fe02@gmail.com>
References: <20260526-msm8939-venus-rfc-v9-0-bb1069f3fe02@gmail.com>
In-Reply-To: <20260526-msm8939-venus-rfc-v9-0-bb1069f3fe02@gmail.com>
To: Bryan O'Donoghue <bod@kernel.org>, 
 Vikash Garodia <vikash.garodia@oss.qualcomm.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 =?utf-8?q?Andr=C3=A9_Apitzsch?= <git@apitzsch.eu>, 
 Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-clk@vger.kernel.org, ~postmarketos/upstreaming@lists.sr.ht, 
 phone-devel@vger.kernel.org, Erikas Bitovtas <xerikasxx@gmail.com>
X-Mailer: b4 0.15.2

Allow Venus core GDSCs to have their control passed to hardware, so they
can be powered on by Venus firmware.

Signed-off-by: Erikas Bitovtas <xerikasxx@gmail.com>
---
 drivers/clk/qcom/gcc-msm8939.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/clk/qcom/gcc-msm8939.c b/drivers/clk/qcom/gcc-msm8939.c
index 45193b3d714b..956295289ae8 100644
--- a/drivers/clk/qcom/gcc-msm8939.c
+++ b/drivers/clk/qcom/gcc-msm8939.c
@@ -3664,6 +3664,7 @@ static struct clk_branch gcc_venus0_vcodec0_clk = {
 
 static struct clk_branch gcc_venus0_core0_vcodec0_clk = {
 	.halt_reg = 0x4c02c,
+	.halt_check = BRANCH_HALT,
 	.clkr = {
 		.enable_reg = 0x4c02c,
 		.enable_mask = BIT(0),
@@ -3681,6 +3682,7 @@ static struct clk_branch gcc_venus0_core0_vcodec0_clk = {
 
 static struct clk_branch gcc_venus0_core1_vcodec0_clk = {
 	.halt_reg = 0x4c034,
+	.halt_check = BRANCH_HALT,
 	.clkr = {
 		.enable_reg = 0x4c034,
 		.enable_mask = BIT(0),
@@ -3753,6 +3755,7 @@ static struct gdsc venus_core0_gdsc = {
 	.pd = {
 		.name = "venus_core0",
 	},
+	.flags = HW_CTRL_TRIGGER,
 	.pwrsts = PWRSTS_OFF_ON,
 };
 
@@ -3761,6 +3764,7 @@ static struct gdsc venus_core1_gdsc = {
 	.pd = {
 		.name = "venus_core1",
 	},
+	.flags = HW_CTRL_TRIGGER,
 	.pwrsts = PWRSTS_OFF_ON,
 };
 

-- 
2.54.0

