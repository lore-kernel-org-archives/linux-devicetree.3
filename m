Received: from mail-ej1-f45.google.com (mail-ej1-f45.google.com [209.85.218.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 44AD83E44E7
	for <devicetree@vger.kernel.org>; Thu, 30 Jul 2026 08:54:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785401668; cv=none; b=tb85TsSzX4PK6bepwFAOx12iPv3AGHo088RKAMLlR/FxNwss+jiCeWynUxJp1CDpgyLEJ89ZEuwidaa+zZxsKYMsJoprHSk9QtKlQGrfa0gMtkEAewIYooIB4Oc5gU5T8xJ9KdzKJubT1Blm49yN3al9bfs9GTZG/lQqzIZXWQM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785401668; c=relaxed/simple;
	bh=Kvtuszz3nRa/+IdlvXfvBPOMgtFAA/VHxwZTL40appM=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=JxBPiyNPv6KO9cYYikV2GV4tlkLScZVAn1DrQNLTDJ8FpdNvVNCde2PEFhPWFDnN9eVQq9zD0hPNqOTqHhI7hvhHepibHij2oC1NAHsABJE0kWbVu5nksV2QGZGzPTtoU3Ive87vUof0ZCNNHmwRW9b8ZOTomdL4+CVttDg3UzY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=eVZbkArH; arc=none smtp.client-ip=209.85.218.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="eVZbkArH"
Received: by mail-ej1-f45.google.com with SMTP id a640c23a62f3a-c12614b81c9so336326366b.3
        for <devicetree@vger.kernel.org>; Thu, 30 Jul 2026 01:54:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785401665; x=1786006465; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=216gNUt0ekkJYFeQoQEhN31HOLBnWymhqc9D9IgKUL8=;
        b=eVZbkArHaaw5H2FCbLF59eYWc0giCJQUmhDWt+vsE8RYrH32pBj6a42jWshXl5RcJT
         jhgm1B0QfKsrWk4Djy4mtdSCLy4aLDJgYC0Aj83GIrIwc9bJnGtJbdkj9hO+fhokOWhR
         6+vYy2iLMRIKbNFvRoQoVpj+fQEqKXS58pCIW5YM2vBZLmdGwk6VVXKqywW7zjqt28J/
         C7z9sVg3NYIXaZ88m/u+VIPPgR20nVivd2KQnty+Lubj2MAiwW3eMp9np4h2xp7XyNoV
         ShP9Mc4eUQCH2zyX+XlITP52nCTfXv175h5ehNvZpdhuZxwUXpYpxQnljOFsZSqPWsj7
         HDyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785401665; x=1786006465;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=216gNUt0ekkJYFeQoQEhN31HOLBnWymhqc9D9IgKUL8=;
        b=IuxZF0KsxHu3CxphJLgXIpc8boe4NJtsfknEVFAKGvytFcP534IkX0evN0CHgAUpk4
         RSWZyt504UGGDnHxpU/seNAYsdmu5hLSVQ5jzsmvYdYtJfNzNm3hYUJad/xEfLYXGpUD
         D0Ctq9AF8TUzI8KUa9Zr/pUhz3LuZV9viHmnZpU2H0uDFZg4DYIHIijNJIlONvzbAlev
         edIn2ggp3QOYJXYUR3pK3Clj4u3BBmKQxZY7qNsAdZnn4eGpE1DiKrHcFXsW3k64uU2Z
         nBCghiZbSDy1aVvkS+3IYc0IahU63YpPHngH22zSKWK7fuU3cYjE5jI5WAORej2l4D8w
         I7+Q==
X-Forwarded-Encrypted: i=1; AHgh+RpuAD2mNWKn/1aVEtIqBMcam3mdmA51jmL7ACerrUv6eRek598HQ35OZ7ac4/J0BXLR8Z5HtiRLPqyX@vger.kernel.org
X-Gm-Message-State: AOJu0YwJmOnZMy1dv+5Jb3D7jOyx18N4EWMB0WKPQYJQFCxwm4VlisiV
	/nerhF/FWoG64bpyaQKN5P4P9/Djz314yH7+kuEwOCckwtpqftndbNCrQVJyvppF
X-Gm-Gg: AR+sD12mwGcVb41jYbj9X0ns1RRZ3QJMpTFWn/Cb6GavEdVaRRSTaAwhGF3ng+zciGd
	MPzHtcfJE3Ze0CNvPtBO58JFg6S43hQjuGhQn4FPICb/5GmzCdn87Yl2zcqxp7EYpr16OvaU0Aj
	VabShEf8sNYt26ZV69vwLjAHH9Ve5ydFHWKcb9WrQNyYqfVQBcdzn2L6aTHVPmEPHoqIX+8WEju
	gUSC8uGmKZImG1HuKX3dQgLzXFCuW33PjukgKJSR4k/wVlC+Pn8j5EqQouDXsSM648t7X6DiMo8
	tUh4g2Qs2KaMbtaHD0tmYZSEnZ3Xw2ywfOenmF41bGAmxy4DW7uLH8VM6mbgPpJcOQGf3nfN/zf
	gPiqWQ4vk304PPdCjrfPXfZ9eHfAzEhm3xN1cgg+yCcLj3C+TQYP9IuJmFHpCPuzGQzwdeT7FAI
	IyLi1O3vEqGFdglJYYNjx4Wac9ZW0oAGLBevuu1SJ94vjXldBAtnEucHR1NKXj6kEP9XlROR5Bp
	penFH+7u4Np6BKUdA4Hfg==
X-Received: by 2002:a05:6938:a08a:10b0:c12:96af:acf7 with SMTP id a640c23a62f3a-c1fa574388dmr61198066b.43.1785401665319;
        Thu, 30 Jul 2026 01:54:25 -0700 (PDT)
Received: from workstation (161-53-210-87.ftth.glasoperator.nl. [87.210.53.161])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c1fa8beda56sm41603266b.55.2026.07.30.01.54.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 Jul 2026 01:54:24 -0700 (PDT)
From: Stanislav Zaikin <zstaseg@gmail.com>
To: Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>
Cc: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Stanislav Zaikin <zstaseg@gmail.com>
Subject: [PATCH] arm64: dts: qcom: taoyao: Drop adsp_rpc_remote_heap_mem override
Date: Thu, 30 Jul 2026 10:54:21 +0200
Message-ID: <20260730085422.631896-1-zstaseg@gmail.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

taoyao originally redefined adsp_rpc_remote_heap_mem at a fixed address
to avoid overlapping with cdsp_mem, since kodiak.dtsi's version was a
fixed-address at the time.

kodiak.dtsi now defines adsp_rpc_remote_heap_mem as a dynamically
allocated "shared-dma-pool" region instead, which removes the fixed
address entirely and so cannot overlap with cdsp_mem. This makes the
override unnecessary.

Remove the taoyao-local /delete-node/ and static reg-based redefinition,
and inherit the definition from kodiak.dtsi instead.

Fixes: 28705df5d0df ("arm64: dts: qcom: sm7325: Add Xiaomi 12 Lite 5G (taoyao) DTS")

Signed-off-by: Stanislav Zaikin <zstaseg@gmail.com>
---
 arch/arm64/boot/dts/qcom/sm7325-xiaomi-taoyao.dts | 6 ------
 1 file changed, 6 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/sm7325-xiaomi-taoyao.dts b/arch/arm64/boot/dts/qcom/sm7325-xiaomi-taoyao.dts
index 6f8bc65bb99b..87f267aaeec0 100644
--- a/arch/arm64/boot/dts/qcom/sm7325-xiaomi-taoyao.dts
+++ b/arch/arm64/boot/dts/qcom/sm7325-xiaomi-taoyao.dts
@@ -27,7 +27,6 @@
 
 /* The following reserved memory regions have different addresses or sizes */
 /delete-node/ &adsp_mem;
-/delete-node/ &adsp_rpc_remote_heap_mem;
 /delete-node/ &cdsp_mem;
 /delete-node/ &rmtfs_mem;
 
@@ -203,11 +202,6 @@ neuron_block_1_mem: neuron-block@d7f80000 {
 			no-map;
 		};
 
-		adsp_rpc_remote_heap_mem: adsp-rpc-remote-heap@e0400000 {
-			reg = <0x0 0xe0400000 0x0 0x800000>;
-			no-map;
-		};
-
 		framebuffer_reserved: framebuffer@e1000000 {
 			reg = <0x0 0xe1000000 0x0 (1080 * 2400 * 4)>;
 			no-map;
-- 
2.53.0

