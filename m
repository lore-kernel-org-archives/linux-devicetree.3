Received: from mail-ed1-f44.google.com (mail-ed1-f44.google.com [209.85.208.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A7B8D3F58CA
	for <devicetree@vger.kernel.org>; Fri, 10 Jul 2026 09:55:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783677313; cv=none; b=oDdKNsJi+q28YeoGSgMQ2vDLbkp00YoKcjvFfBCHXPtdHxu8284X5h+gbElvZyyoFMtlXSCpVFUeHWjO8n1fyzcvb2XX/Qa9ZkHlt93RlvA4jIZfnVY+QRHzp1aRl1AMrfZpPNvwVi3J8BUnWHCa8ue/NxNGZW7X4dFAXCO4Wjk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783677313; c=relaxed/simple;
	bh=PYaQlk7YAPrQ041M/bvdqcr1+tAUHuw1nB/hxRtlWPQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=ALGDRJ/XJLLUrwkGgW7oY6vNfYTMcBCouZn5qE0AsJfXqk+r6H7WgAzr2HyZagaOrpfYFVaz2Y7LU4W0i+aMaF76slVUWXM9GedpaKZraKRZPvR1K646XFCIhhFI74WLIqfkTRqmf7c3WF3XmG67UT6OZ4oqt41ZQYsq1I/W4/I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fairphone.com; spf=pass smtp.mailfrom=fairphone.com; dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b=oJ1OwsRU; arc=none smtp.client-ip=209.85.208.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fairphone.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fairphone.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b="oJ1OwsRU"
Received: by mail-ed1-f44.google.com with SMTP id 4fb4d7f45d1cf-698aa7ba3e6so1330462a12.1
        for <devicetree@vger.kernel.org>; Fri, 10 Jul 2026 02:55:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair; t=1783677309; x=1784282109; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=Au4v6cU7MBsP2sPvCvHMdLpV1qE/Ythj9i6e9ev27jE=;
        b=oJ1OwsRUV46RFfdUQBdY1bFjrXlxV/DcYyafzidK7UlvZnEUC9TMJKqmwLy6iV7Ho9
         I8jflLJjnC7mVyIVQOQCfATIQTjzTXg+vXQ32O0p8afiYWzBEhoVgUL+KPspRGRbjtVf
         J6LOYQ+EXSZX0UcX8bTmjar5497jKhtWAqelMi8Ns5MU5j8ZsKWDHhCJ6mPh5iAZxCN5
         g/Fnc3kSa3+N777cSRfm+vuUIWVXQpH3/FJg3Txb238wZk+3FhZa0bqk5mQlnngA1BXF
         E8WIjMSlfRBGExVgQZuPT36FZ+1M4nYHNBXvMulV0dRGyqBKir6FR0xNqZShjYGraxjE
         +rvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783677309; x=1784282109;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=Au4v6cU7MBsP2sPvCvHMdLpV1qE/Ythj9i6e9ev27jE=;
        b=ZglfgBqAd9asgBkJg2mZ4Lj1YcKvbu1MqI0+JC8c285ZRbuMwNPCwupBQc20xwAt5s
         LZjA1I5eXbfneFJyS+D3jxhEgj0dLKkOS2gIyz6HGW5SgnKmH2/dNdtPty91dL+loRd6
         OsMEKb8+OC4XqIqZlzf/YLrinoPbbBgJ7zKva4ePocP88nz9br6ohzUD5al8ADwqCEPp
         U3D51Eta7QWyY2OuieUxoBc5rufa/s1FYYC/s7EDc2NiD7rmCs1ODyIS6oRcEQENMUT2
         w8PGKeFznaiJle7kSpsfKWcvTu68uMAG3rTuHI+ZJg+v8s2B4t3m5padi6tai8wxjhxY
         ZSUw==
X-Forwarded-Encrypted: i=1; AHgh+RqLpbtGvRoXhB00WAJDkpk9ttqdj9uP7BOkg/yUwaWm+cMJ7jg038bk7+BBrHD7uYcZuKFYy80vzvZe@vger.kernel.org
X-Gm-Message-State: AOJu0Yzjm+BmAttIWK+NfWXKEZ7LWqoF6RY/QBTm6sGzsdiXkn9Y9frt
	0vPf/zI4Hxeb2b9iLt+QTIgZzDmxs+dycpaWxmIeQWWvtZKB76ABd2CGIL4uo+fOPBI=
X-Gm-Gg: AfdE7cl8IIpPIt034a03QTPse2yxOrfQqJRikm+SpV44oOEypzTAocPv5rBjVnTxP+f
	h+ce8z69N88UU59vBhDg+R5tjzT3ZpDj3hUTeza9bC9nYnSeU9enJLg6+8jGyqAtU55PvdI8rrB
	S3871dTdbqgb3lEVlt5rAb44t4hh2TprYMkMH+o7wDYGDeVQhxVJIh8I3WhxT3V0/px9nnxjhCq
	7Yt+PaAAhM++Z7rfk02MntrJTGsI+N2wPqbnZSYrEAd7V/NzafMVpmUD6vyI+krvA6YqksXK/Wq
	OOGn0pV79rHOwsODVC/2Jn45nrQuNWBtLtxdhxBk07/fkWY4I7Kh0wWwCPAewMzvwdkylXMbxQG
	RY9ZGkqZEcDorFzwmr2BdUph0jHstrL6/hyPC74UTCLuu6MR+yZcLDvEc1humYGzwOJJnplD/Ej
	8KLMiF7FOhoPoGAD269PHFc+rEuRjTtIBn0leK1cSKMclBtAT4LvNp0HWcNeRFlmPWRlQ=
X-Received: by 2002:a17:907:a2cb:b0:c06:f67e:ed9 with SMTP id a640c23a62f3a-c15ce06fb21mr479808066b.10.1783677309069;
        Fri, 10 Jul 2026 02:55:09 -0700 (PDT)
Received: from [172.16.220.101] (144-178-202-138.static.ef-service.nl. [144.178.202.138])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c15bb51af39sm502892966b.29.2026.07.10.02.55.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 10 Jul 2026 02:55:08 -0700 (PDT)
From: Luca Weiss <luca.weiss@fairphone.com>
Date: Fri, 10 Jul 2026 11:53:57 +0200
Subject: [PATCH] arm64: dts: qcom: milos: Add reset for sdhc_2
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260710-milos-sdhc2-reset-v1-1-c7a155a517ba@fairphone.com>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/yXMQQqDMBBG4avIrDuQBEylVyld1PG3TmlVMiqCe
 Hdju/wW721kSAqjW7FRwqKmQ5/hLwVJ9+xfYG2yKbgQ3dU7/upnMLamk8AJhokrRO9jKVLWFeV
 uTGh1/T3vj79trt+Q6RzRvh/v8YP/dQAAAA==
X-Change-ID: 20260710-milos-sdhc2-reset-8e61165cc5b8
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org, 
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>, 
 linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Luca Weiss <luca.weiss@fairphone.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1783677308; l=848;
 i=luca.weiss@fairphone.com; s=20250611; h=from:subject:message-id;
 bh=PYaQlk7YAPrQ041M/bvdqcr1+tAUHuw1nB/hxRtlWPQ=;
 b=tBUxYIBAa0gg6mhoBBDXd7hHoXWxfEi7SSUfj8X/YkiBcJKxuJwdW6iSBv023QxwCayIGFH8I
 dmYEDZooJ8cDoA9dMOQgOhPC9SQ2bLu2B8Nr3kg6izhXLzS9N4BAP88
X-Developer-Key: i=luca.weiss@fairphone.com; a=ed25519;
 pk=O1aw+AAust5lEmgrNJ1Bs7PTY0fEsJm+mdkjExA69q8=

Add the missing reset (BCR) for sdhc_2.

Fixes: d9d59d105f98 ("arm64: dts: qcom: Add initial Milos dtsi")
Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
---
 arch/arm64/boot/dts/qcom/milos.dtsi | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/milos.dtsi b/arch/arm64/boot/dts/qcom/milos.dtsi
index 8c9232988953..262fa8801256 100644
--- a/arch/arm64/boot/dts/qcom/milos.dtsi
+++ b/arch/arm64/boot/dts/qcom/milos.dtsi
@@ -1724,6 +1724,8 @@ &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>,
 
 			iommus = <&apps_smmu 0x540 0>;
 
+			resets = <&gcc GCC_SDCC2_BCR>;
+
 			bus-width = <4>;
 
 			qcom,dll-config = <0x0007442c>;

---
base-commit: 8cdeaa50eae8dad34885515f62559ee83e7e8dda
change-id: 20260710-milos-sdhc2-reset-8e61165cc5b8

Best regards,
--  
Luca Weiss <luca.weiss@fairphone.com>

