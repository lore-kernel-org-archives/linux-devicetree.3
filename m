Received: from mail-pj1-f46.google.com (mail-pj1-f46.google.com [209.85.216.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 12A403AFD07
	for <devicetree@vger.kernel.org>; Wed, 24 Jun 2026 12:55:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782305707; cv=none; b=nzvAnRtKQXM9i5Rx6k18QXoQ5XKvnwqXe3FSDAhLxcAX9RkhFUzaxtGONXNI0LKdGzKBK9awMPD9Nw1HQoE0q5ZXh5VEqj4Nd4EGLtU06Lx3uW9lF58+L7UZtlT+Awn2ohsPDzErG6GCBBU9AS5P6YCs2o5bVEv0WiqtMxUCPg8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782305707; c=relaxed/simple;
	bh=mvbYsq6s7d7W1oouiNX7rgDJWbcpYrxcLw9VH/gGvVU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=eTtEp5CDfGmuCjfjDCOwjanoHUrBPQ2IQf22K6q5cdT7t8Y0+VsL9Y4iCaPgKM6ZZdBXgMimRbOJP+IRK/ADCqfGF7tHbYAmHXZkOo9kxneZZj7/a1tTE7Xg+8A4166rvkaUDYMxcPDh5T2INg8rzU/Uf4/WRIfB52euWygjTq4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=s7gsLGzi; arc=none smtp.client-ip=209.85.216.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="s7gsLGzi"
Received: by mail-pj1-f46.google.com with SMTP id 98e67ed59e1d1-36dac5d5d05so428343a91.2
        for <devicetree@vger.kernel.org>; Wed, 24 Jun 2026 05:55:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782305705; x=1782910505; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3pKNoUwm+VouMr3Z4tAY1A3s0+1K7EgEZOm34M+sxQY=;
        b=s7gsLGziYNmM1sXjYLpcQj6x8qXaq865frHYkg08d35BtliPQztU+V3kPfTyvjmkZD
         V2kK05sd+UalqPw0HW9aJ+yOekHsHQMAN0Uc0YlkT2bZWt5QpTn4nvux//xbbaK+VSSs
         T7rd65oFyfF6Ue0Zs4rjqdV4bfxgMzVXtibF1AKG9N7vUkwoCZ8ZxkhM+NGzQYfPHugK
         R7cqd+wuE6TIlDHTwuozFdvTw23yXMkMsU/F0OK0rzMGIP37v2vBnBo0MOXvALIhIQHi
         eYa8FC0kwjpan06axJ7x0SXaOHPz1fKqm4Df43QUUQgnRlPEV5sJ5+mVDa5WlAAiZlWC
         4xSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782305705; x=1782910505;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=3pKNoUwm+VouMr3Z4tAY1A3s0+1K7EgEZOm34M+sxQY=;
        b=m85YLchhelBqHdR52kPWDhHZv95hFG9SfwT/Yr2XoFUwZfexPZVYu1HHgt02TtfoMJ
         AxE9nMu4BGrKkX6uSJwutJE9zuUOUovo1oYYEdKkwc0woBRZrM5v9jNliXM4bzNEtowb
         SduEuaOtTFKKQFNAWSwJah3n3EOyMJqL90X5KsIL8felNNrhsxyscaaHskfHX40r33zU
         81RZc5xTG9U3NeHkRTOmtggakLVcCCIZ1//uRsMihhiS6UWfdw9VGB6PLDlaLWbn/322
         S3zpW6oG3a2QXefgQKZSiy6dLKdoGXUWLid18uOqxRe+T2IO85UlF/vy5tqktw43LBgV
         EXFg==
X-Forwarded-Encrypted: i=1; AHgh+Roc7Ac6X6jMgzcGQrfgA/YWalBv5W/MaE+qGCATSV2YBXo+LIudZZpNL81gPD5z3H9uWCrSY9o8K0/N@vger.kernel.org
X-Gm-Message-State: AOJu0Yw0VKKbocM6KlZRUi7XyvBpq1efs3HbBTOvKKrQZGzbvpO+2A3N
	tdO5BFmag8wUKXR2lOPcLzv71eqG8PR4Gw+7LqROLsJ4cnBXavuDF/QR
X-Gm-Gg: AfdE7cl9DIhB4xWL6CbS9NW191dy8Bqz3mqz7zvhesuPhs0mb40rwDXfkmJWtpvTda7
	QLxSIfVVMvvmhSyV/sXykgmF23se9zw/C6RyfRciRblyIr8Kio8GINvfbHD73EusAKjp2oWPXt4
	FKp2MefSSjA9h3ynR42XLGfu/34oGDnRvEIQnHPKNlUlzwM9cI+T3wDWNCGK+XP1XchSeDmbfxG
	2IlrUQYkLItkm0HKzQLUtB9x9Tfpa1lzVVE6B8ydq0igBw4gG3BCwb6ZykS3qaHN87cJNXdkUiO
	utS6do/xhCF5mVdHTR4fhmmpzwh5M/hcGBrx43GXN1NhcDH+5/KqBjf09uFMpd1+iIIbZ5vq2gj
	dGF5ouGfu4+zK5z6gc3S39W2AXbs6isN4hAeFxZd1AO3qG9+o3438ADtVkwkGg+ag/aP7Gyj5sb
	NXFzXX7GgN3QM9ApD5QGqD2YfeqZmM7qChE129/IlgQfmUbAFNMw4=
X-Received: by 2002:a17:90b:1b4c:b0:36d:70c8:3a1 with SMTP id 98e67ed59e1d1-37de425bbd4mr3513950a91.13.1782305705226;
        Wed, 24 Jun 2026 05:55:05 -0700 (PDT)
Received: from localhost.localdomain ([150.107.232.166])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-37de3b839acsm2984870a91.11.2026.06.24.05.55.00
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Wed, 24 Jun 2026 05:55:04 -0700 (PDT)
From: Ajit Singh <blfizzyy@gmail.com>
To: Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Ajit Singh <blfizzyy@gmail.com>,
	Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: [PATCH v5 2/3] dt-bindings: arm: qcom: Add Vicharak Axon Mini
Date: Wed, 24 Jun 2026 18:24:42 +0530
Message-ID: <20260624125443.18729-3-blfizzyy@gmail.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20260624125443.18729-1-blfizzyy@gmail.com>
References: <20260624125443.18729-1-blfizzyy@gmail.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The Vicharak Axon Mini is a single-board computer based on the
Qualcomm QCM6490 platform.

Add the top-level compatible string for this board.

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Signed-off-by: Ajit Singh <blfizzyy@gmail.com>
---
 Documentation/devicetree/bindings/arm/qcom.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/arm/qcom.yaml b/Documentation/devicetree/bindings/arm/qcom.yaml
index d48c625d3fc4..6924bfe7b949 100644
--- a/Documentation/devicetree/bindings/arm/qcom.yaml
+++ b/Documentation/devicetree/bindings/arm/qcom.yaml
@@ -361,6 +361,7 @@ properties:
               - radxa,dragon-q6a
               - shift,otter
               - thundercomm,rubikpi3
+              - vicharak,axon-mini
           - const: qcom,qcm6490
 
       - description: Qualcomm Technologies, Inc. Distributed Unit 1000 platform
-- 
2.50.1 (Apple Git-155)

