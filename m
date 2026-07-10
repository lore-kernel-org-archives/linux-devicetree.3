Received: from out162-62-58-211.mail.qq.com (out162-62-58-211.mail.qq.com [162.62.58.211])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E8C5436D51D;
	Fri, 10 Jul 2026 06:23:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=162.62.58.211
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783664641; cv=none; b=N9pWNMcqUrcAACreokqWgcaACsVnif4cB25UUZBLLlGmF6qJU2FP6+4RaoypJsDvnQpsJvxkLzWvqZyLa71Bnh0KWu3Uvsn+umjVNkjet+RMs1HRYQw5FJURhZJ3PRuY30O2aQu2ZPXSpMwcXDL4f0IC+5aCjU2diWrqxoOYN2M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783664641; c=relaxed/simple;
	bh=pYA7SFHbAXcQTt3I+mwCIOPgCLQ7Q50qLoB0rXq15IE=;
	h=Message-ID:From:To:Cc:Subject:Date:MIME-Version; b=PDjNi4Wkm3p4e6zcmm9Y/1MHjXU8HR4NW5ZXjHRT50w4bZRPI02f+CM7hxjy/Gzx2QbQj3/p7HHIuZ5T8UHqB0HvjhvP6gXSkWk+N68qDO3Hyh5EV0NI6KYqYTTXrepInHm3pFHP9EO+SeAGf4L/bHfuaMYQv/CTE/yCkC9Tyso=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=qq.com; spf=pass smtp.mailfrom=qq.com; dkim=pass (1024-bit key) header.d=qq.com header.i=@qq.com header.b=GSEzWxhM; arc=none smtp.client-ip=162.62.58.211
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=qq.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=qq.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=qq.com header.i=@qq.com header.b="GSEzWxhM"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qq.com; s=s201512;
	t=1783664633; bh=2ulrcp+HWNIXsDsvTbF9VUB3tDts/UuB4Jd6DJFom7k=;
	h=From:To:Cc:Subject:Date;
	b=GSEzWxhMk5NpVDEd3ZYXtbV4FSmuieHr9lTPGOI2FPtztCLAaW9PSjoc5MKIv8Gda
	 w9hz1ES9gsMYi/s7SKxkQ96SJCw3CWjWp7NhVAdk49xn2QOkL5pshw6YSv8sA1ZoQ1
	 XEy+H5ycdXnsP3unQ9cQ4HLNtecuNpVZWV/J/tn0=
Received: from 8qyomHQF3vPjMe.lan ([240e:3b3:62d8:f210:1216:88ff:fe19:9e1d])
	by newxmesmtplogicsvrszc50-0.qq.com (NewEsmtp) with SMTP
	id 5A595AA8; Fri, 10 Jul 2026 14:22:37 +0800
X-QQ-mid: xmsmtpt1783664557tex03bv9a
Message-ID: <tencent_AEB4238D8669271E5C1CD19C2C61A45AD108@qq.com>
X-QQ-XMAILINFO: NbgegmlEc3Ju4/bEN42fQu2SmuU+mvE/EkPuljI6oXc0qm9rJL8E4IKkVkDb4o
	 f4qRVhgdHJNevRowCvxMdZ6FJPmRAaAWKQvHmTOOdYzzDwVCrOJWj1KUHMkQQnUjAitgEuTCk3Rv
	 8vfKgao99YXQdLdU50I8tIZaSX3S3XIEAmd1zRCuh3VBo8ILNavZPBzdxzRmfcBDgSWzShJgVV+q
	 W4h4xh2rbw0JhSirdz94XtgvgcZKkb5Cxgsu10UQELP+TRe8kuink3w1ooRQOyc5qJd+kCMpuIfG
	 LzaOb6fvOgyDTk/gFgH6hsBYijuRHY1JFgWafcLWT0fNAqdp5jb2ucxpi0DqyhJsIE7oxZYj2FBd
	 6tLd4g4YeqxorWpi/whLyhfliPreHjnu9z/0PREi6M9kwPlHilj8DGQGyCdUe89hk9AzkPjNw5mJ
	 4yU2dROk6IBVQHHPBjgrRWa7F3pb9yi8GqAGLRyMeEPO9EeQaIlZ8HLAKdgcrJbqMwHvOJE36NhU
	 /h3bxoHl9dkyoG/hFPn4+lIgEKd1e7fKtD6gIKpLa2RKJ7p4jWmQMMX0jdyRdynqYTIfL2/YuURK
	 iwxkibw6O8JyELB04cb9tllJLDeO0AwpjlO6nSy96gfOMQwtv7I8c6+5wRE4FYWvv+9ZL/0nuYRa
	 i55Wmn4tNdgL09Q5yYmqO8QQsohUXrngkcpumvgekeiI+pV2NmhIkAdqYM5+xUqa14UkPHi+8ao4
	 v/UpTEitmwipbQxmAiBoU2YWUQfbJwsIN8h+DFm8l5RnVj5yAO4IkohEzDcTK++FcR7AVcPMyuNw
	 r4bdheOHKATdz/QY0IBXYYSHtLozGiByomWFlrEJ0gBf4xm561JCdUNqOH/NtU8/9npa6NJtQ3Cl
	 N/oc3WKiQgci66+Wj7sK8e1nN/7P56BTdBjFYVvXs+i981awccjMi7XYThRpQNKB74Kmy5uSRdGx
	 nJeT5gOj0PVpQKOUQKpZ57gt0JVTON9POzuXTMZuH9TheAGDc3xqwJ5c+2eABT+hPlo7mH1y1XAc
	 qMXMVcKCL/O0JJy9WvJQTkdc3Tqx2YupZhekhGDw8JNsI7g+BH5+pzhPse7OIjiOkQynURdw==
X-QQ-XMRINFO: NyFYKkN4Ny6FuXrnB5Ye7Aabb3ujjtK+gg==
From: Xin Xu <xxsemail@qq.com>
To: andersson@kernel.org,
	konradybcio@kernel.org
Cc: linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Xin Xu <xxsemail@qq.com>
Subject: [PATCH] arm64: dts: qcom: sm8250-xiaomi-elish: Remove camera_front_active pinctrl
Date: Fri, 10 Jul 2026 14:22:12 +0800
X-OQ-MSGID: <20260710062212.50346-1-xxsemail@qq.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Remove the redundant camera_front_active pinctrl node, as its GPIO 109
configuration duplicates the reset-gpios property.

Signed-off-by: Xin Xu <xxsemail@qq.com>
---
 arch/arm64/boot/dts/qcom/sm8250-xiaomi-elish-common.dtsi | 9 +--------
 1 file changed, 1 insertion(+), 8 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/sm8250-xiaomi-elish-common.dtsi b/arch/arm64/boot/dts/qcom/sm8250-xiaomi-elish-common.dtsi
index 19aff83ecf7b..26801d6a1ec5 100644
--- a/arch/arm64/boot/dts/qcom/sm8250-xiaomi-elish-common.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm8250-xiaomi-elish-common.dtsi
@@ -570,7 +570,7 @@ camera_front: camera@10 {
 
 		reset-gpios = <&tlmm 109 GPIO_ACTIVE_LOW>;
 
-		pinctrl-0 = <&cam_mclk3_default &camera_front_active>;
+		pinctrl-0 = <&cam_mclk3_default>;
 		pinctrl-names = "default";
 
 		orientation = <0>; /* Front facing */
@@ -947,13 +947,6 @@ pm8008_reset_default: pm8008-reset-default-state {
 		bias-pull-up;
 	};
 
-	camera_front_active: camera-front-active-state {
-		pins = "gpio109";
-		function = "gpio";
-		drive-strength = <2>;
-		bias-disable;
-	};
-
 	wlan_en_state: wlan-default-state {
 		pins = "gpio20";
 		function = "gpio";
-- 
2.53.0

