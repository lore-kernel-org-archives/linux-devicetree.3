Received: from mail-qk1-f171.google.com (mail-qk1-f171.google.com [209.85.222.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6239825524C
	for <devicetree@vger.kernel.org>; Tue,  1 Sep 2026 01:37:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788226634; cv=none; b=sVVVeBa3/6wpcB4GraDy6w+OZ0imTo8moQ6mY7czcO5znzUUXabzrQUZEcQXUK1pL/HyaA/ZqZpKrOVBuIY/oNSCXTEG21EV5G5L/utcwpNUuxbksJEmLJpVJ2RH5aQdYrXRWbER5UmFi5PI2pjrP97QFnrKm+SpGusfJaIcSEM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788226634; c=relaxed/simple;
	bh=QInaDatlwxp7NEj4/bdLBqsC3UrTgGWJ6q0lyU7RRsA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=JvCrixSSpeHq9T3vzgBlYnALzEuzmSQjHvafdvAI4O/GUcpTdT8b8uLqNLiZnuVQiNiyT3hsYlSHtEJlKI89nU9jTUDuFA9fLGzVO6igCTi3W/3XNC1oBqWGckjyiTYkc6aER6tLM3mv7p9AO55cySiyz8+Lt1Y7KV6wviHE6b4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com; spf=pass smtp.mailfrom=riscstar.com; dkim=pass (2048-bit key) header.d=riscstar-com.20251104.gappssmtp.com header.i=@riscstar-com.20251104.gappssmtp.com header.b=fk4JzsAM; arc=none smtp.client-ip=209.85.222.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=riscstar.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=riscstar-com.20251104.gappssmtp.com header.i=@riscstar-com.20251104.gappssmtp.com header.b="fk4JzsAM"
Received: by mail-qk1-f171.google.com with SMTP id af79cd13be357-936c02e58dfso36379885a.3
        for <devicetree@vger.kernel.org>; Mon, 31 Aug 2026 18:37:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20251104.gappssmtp.com; s=20251104; t=1788226629; x=1788831429; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=HPcJzHW6TuSLOdHwhvKpqTa7MZ2jOufBeABZfucpX8E=;
        b=fk4JzsAMDPOlXYxqPBYlfYn7Riq7QYWJ83q7GXFWnrjAz9EViiS9mpHtR1m9iAy+pA
         gsjNKwqG4aYdfv+ubvkOgQ7hxFlGIDhCxdVAAQbaq3xs63NwTGODQYy1G1bOvNnl1dgc
         A1X+CeHzM9FzvvtRdpfq5+klzzpxe8p/UVIpixKJCYKLNmdLqAZnOJbEG/pF3Gx5TVs+
         nUQpFZi3rXQRTRCPCxJbf++dJp9ZgGq+TkArnuDcBSCwHxCS83wd1mo9apGIGoD4YLeW
         tABfq5Balmhzn3jwgAaIuMfsArcx894aiKediqYwe3Uul+1OdzYZT+oT0a/ZZSliEWFY
         6wGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788226629; x=1788831429;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=HPcJzHW6TuSLOdHwhvKpqTa7MZ2jOufBeABZfucpX8E=;
        b=J4aupyhHpFlcN/oVCKiS8YkOj3NPh5MdvDGYjfsMwx0TpQ8PPMEM5fA1zC5VGcydY+
         44kc8cd5/4gUiefIPogdF/mTwFNFtd9qp2ArIZyuPMOfFSWUDL/saGTq1gspGRJ0US44
         X4WHudRFbQz6mTQgAuoriBtnA0vwpQZ+zV8CtNMtDu6t8r/2HeeygwXzWlh/m+gohNOU
         F8WB6o2rZg0HqPoCfiKhE4yKY24X//2zN+RUgVYZ1Sjt0sfE4/Ig1KJYtSTog2OvbNxz
         gAhXgq9mYTvJtx2gdBw2LAbO4cpDGDOgdDh4ndigzwhwB6KmNQMXgr09vWjKsWltutuF
         fFkQ==
X-Forwarded-Encrypted: i=1; AHgh+RpgFpxbrE7p7Bb1Cay1dvZdLecMsNFh+lHe837Ndcy2ORaDjnvThszsNkg3m00fHR9bMDwqJc60Dxnx@vger.kernel.org
X-Gm-Message-State: AFuF++lkKyurIO2XKWmvLy2axzXApMnzg5oXkVB4Fl749dLWx/rpYeps
	XvtlQfqIEDxIAZvY2mi7T/1tRBmwOmyU1UPOvF0i6pd+NWeMFWtGZm4I36OuAUxe48M=
X-Gm-Gg: AR+sD11XOm6llTYUFQyjU3URha8hDg8sLT/EAueW+CylSDihgwCdur9fH8dIs3Ou/+t
	h2wkds3Q6fHzEuJBz0IfVZeviHkA24O+PktTFtJynIyCX0XzcyfmUfPB4TalQTQFEcyByM7RHgB
	avCh+1XcQzvbymRQ0aUT/MS6OV8sP0C4tB98glFISIvrI93ONTYoUEcTt7udXIhEo27X4J5IH2J
	whLLd44nA4/4QTFbkABUIRGxtmblmCWI9xyWBQ3vzlSsAHgsxKeHfDVCR0eOv1MQPhFbIbrkJ0N
	9VicpzwOXoHgm2yBfsQ48AH87CKgLjYsS2GWH9jiIUcGY6w0PJrnH4xZHIR7CJbiuGmj5XoKkjc
	FUIaoFrfwKnmL3VIMPLOYEDX5x/1TnU7mwbFX4ul+5fd8Zs5Pds9Uq80SOuJwESjfriR+dPBStq
	sqEJ31sO+RFKQEFSeEHmqv+aDfGYpIHgP9nV6c0DUbQT+p56AtJN3WOPyfH8x+LoIW
X-Received: by 2002:a05:620a:269b:b0:92e:e1d1:49dd with SMTP id af79cd13be357-9391390a15cmr3286256985a.21.1788226629067;
        Mon, 31 Aug 2026 18:37:09 -0700 (PDT)
Received: from zippy.localdomain ([73.62.185.64])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-9391703a918sm919265485a.12.2026.08.31.18.37.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 31 Aug 2026 18:37:08 -0700 (PDT)
From: Alex Elder <elder@riscstar.com>
To: andersson@kernel.org,
	konradybcio@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org
Cc: mani@kernel.org,
	krishna.chundru@oss.qualcomm.com,
	dmitry.baryshkov@oss.qualcomm.com,
	sushrut.trivedi@oss.qualcomm.com,
	umang.chheda@oss.qualcomm.com,
	rosh@debian.org,
	jsandom@axon.com,
	daniel@riscstar.com,
	mohd.anwar@oss.qualcomm.com,
	lorenzo.bianconi@oss.qualcomm.com,
	devicetree@vger.kernel.org,
	linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 6/6] arm64: dts: qcom: qcs8550-rb5gen2: clean up PCI function nodes
Date: Mon, 31 Aug 2026 20:36:53 -0500
Message-ID: <20260901013654.1343537-7-elder@riscstar.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260901013654.1343537-1-elder@riscstar.com>
References: <20260901013654.1343537-1-elder@riscstar.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The Qualcomm RB5gen2 devicetree source file defines a node representing
a TC956x chip which contains a PCIe switch and an embedded endpoint that
implements two PCIe functions.

The devicetree nodes erroneously include a "pci" device_type property
for the two PCIe functions.  That property should only be used for a
PCI device "that implements a PCI bus".  Remove this property for the
two function nodes.

In addition, these nodes define #address-cells, #size-cells, and ranges
properties, which are not normally defined for PCIe endpoints.  Remove
properties as well; they can be added back once they are actually
needed/used.

Fixes: 33cae252054a6 ("arm64: dts: qcom: qcs8550: add QCS8550 RB5Gen2 board support")
Signed-off-by: Alex Elder <elder@riscstar.com>
---
v2: - New patch updating DTS that was not present for v1

 arch/arm64/boot/dts/qcom/qcs8550-rb5gen2.dts | 8 --------
 1 file changed, 8 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/qcs8550-rb5gen2.dts b/arch/arm64/boot/dts/qcom/qcs8550-rb5gen2.dts
index 9df8dcd6c62b6..2c74a1e242ef8 100644
--- a/arch/arm64/boot/dts/qcom/qcs8550-rb5gen2.dts
+++ b/arch/arm64/boot/dts/qcom/qcs8550-rb5gen2.dts
@@ -1128,18 +1128,10 @@ pcie@3,0 {
 
 			pci@0,0 {
 				reg = <0x50000 0x0 0x0 0x0 0x0>;
-				#address-cells = <3>;
-				#size-cells = <2>;
-				device_type = "pci";
-				ranges;
 			};
 
 			pci@0,1 {
 				reg = <0x50100 0x0 0x0 0x0 0x0>;
-				#address-cells = <3>;
-				#size-cells = <2>;
-				device_type = "pci";
-				ranges;
 			};
 		};
 	};
-- 
2.53.0

