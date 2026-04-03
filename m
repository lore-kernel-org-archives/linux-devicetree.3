Received: from cstnet.cn (smtp25.cstnet.cn [159.226.251.25])
	(using TLSv1.2 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6C7472D3A60;
	Fri,  3 Apr 2026 04:07:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=159.226.251.25
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775189235; cv=none; b=RO6wMzx+jEYOcOxrBC2fWyvAirRTCk6S3vbaQqalg7gx1FI2/KP0N/Y8BeHtVKQX1nquRJNsuVHUYmsMrueEeLmFl1o70GrnjRrDdR1iQH+wcQYrep8eRCf/9VONT1QYVQt3b0nhkdWOeOBBOwQR+/tuRr2IJ8xMnRzd7ApJzhw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775189235; c=relaxed/simple;
	bh=IuTVe86slATQ9UYGYDQB9CHfQpyqF9HXTDuJSOFfFWc=;
	h=From:Date:Message-ID:To:Cc:Subject; b=I4Do9B6nDxmHwdP5va1RRgvMgWJaZTrLQeC7t2Qd0hLhnGsz1vK/Xk52kLBx28Lrj8JwKBaJsxKRNxrIQ4PqNosMQEnUVqaW8hvhJYf2ysD2EVwi+yVzDZ9g0U2BGp3PjxTukVCKuADKXvMrQDrIgbbGCRKSbauna+04zjji5ow=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iscas.ac.cn; spf=pass smtp.mailfrom=iscas.ac.cn; arc=none smtp.client-ip=159.226.251.25
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iscas.ac.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=iscas.ac.cn
Received: from 0001-drivers-of-fdt.eml (unknown [111.196.245.197])
	by APP-05 (Coremail) with SMTP id zQCowAAXpQjsPM9pEU1XDA--.12296S2;
	Fri, 03 Apr 2026 12:07:08 +0800 (CST)
From: Pengpeng Hou <pengpeng@iscas.ac.cn>
Date: Fri, 3 Apr 2026 11:55:29 +0800
Message-ID: <20260403143001.1-dt-fdt-stdout-pengpeng@iscas.ac.cn>
To: Rob Herring <robh@kernel.org>, Saravana Kannan <saravanak@kernel.org>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, pengpeng@iscas.ac.cn
Subject: [PATCH] drivers/of: fdt: validate stdout-path properties before
 parsing them
X-CM-TRANSID:zQCowAAXpQjsPM9pEU1XDA--.12296S2
X-Coremail-Antispam: 1UD129KBjvdXoWrtFyktr13Jw1DKw48GrykZrb_yoWkurg_W3
	92yrn3Ar17WrsFgr1ftw13ZrW0y39rWF1kZ3yIvw1ayr9Igr15W3WkWrn7GF4UArWfuFyD
	Ar1avw18uFs7WjkaLaAFLSUrUUUUjb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
	9fnUUIcSsGvfJTRUUUbc8FF20E14v26r1j6r4UM7CY07I20VC2zVCF04k26cxKx2IYs7xG
	6rWj6s0DM7CIcVAFz4kK6r1j6r18M28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48ve4kI8w
	A2z4x0Y4vE2Ix0cI8IcVAFwI0_Xr0_Ar1l84ACjcxK6xIIjxv20xvEc7CjxVAFwI0_Gr0_
	Cr1l84ACjcxK6I8E87Iv67AKxVW0oVCq3wA2z4x0Y4vEx4A2jsIEc7CjxVAFwI0_GcCE3s
	1le2I262IYc4CY6c8Ij28IcVAaY2xG8wAqx4xG64xvF2IEw4CE5I8CrVC2j2WlYx0E2Ix0
	cI8IcVAFwI0_Jr0_Jr4lYx0Ex4A2jsIE14v26r1j6r4UMcvjeVCFs4IE7xkEbVWUJVW8Jw
	ACjcxG0xvEwIxGrwACjI8F5VA0II8E6IAqYI8I648v4I1lc7CjxVAaw2AFwI0_JF0_Jw1l
	42xK82IYc2Ij64vIr41l4I8I3I0E4IkC6x0Yz7v_Jr0_Gr1lx2IqxVAqx4xG67AKxVWUJV
	WUGwC20s026x8GjcxK67AKxVWUGVWUWwC2zVAF1VAY17CE14v26r126r1DMIIYrxkI7VAK
	I48JMIIF0xvE2Ix0cI8IcVAFwI0_Jr0_JF4lIxAIcVC0I7IYx2IY6xkF7I0E14v26r1j6r
	4UMIIF0xvE42xK8VAvwI8IcIk0rVWUJVWUCwCI42IY6I8E87Iv67AKxVWUJVW8JwCI42IY
	6I8E87Iv6xkF7I0E14v26r4j6r4UJbIYCTnIWIevJa73UjIFyTuYvjfUehL0UUUUU
X-CM-SenderInfo: pshqw1xhqjqxpvfd2hldfou0/
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

early_init_dt_scan_chosen_stdout() fetches stdout-path and
linux,stdout-path directly from the flat DT and immediately passes the
result to strchrnul(). Flat DT properties are raw firmware-supplied
byte sequences, and this path does not prove that either property is
NUL-terminated within its declared bounds.

Use fdt_stringlist_get() so malformed unterminated stdout-path
properties are rejected before the local parser walks them as C
strings.

Signed-off-by: Pengpeng Hou <pengpeng@iscas.ac.cn>
---
 drivers/of/fdt.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/of/fdt.c b/drivers/of/fdt.c
index 331646d667b9..3dcd20c2fa73 100644
--- a/drivers/of/fdt.c
+++ b/drivers/of/fdt.c
@@ -954,9 +954,9 @@ int __init early_init_dt_scan_chosen_stdout(void)
 	if (offset < 0)
 		return -ENOENT;
 
-	p = fdt_getprop(fdt, offset, "stdout-path", &l);
+	p = fdt_stringlist_get(fdt, offset, "stdout-path", 0, &l);
 	if (!p)
-		p = fdt_getprop(fdt, offset, "linux,stdout-path", &l);
+		p = fdt_stringlist_get(fdt, offset, "linux,stdout-path", 0, &l);
 	if (!p || !l)
 		return -ENOENT;
 
-- 
2.50.1 (Apple Git-155)

