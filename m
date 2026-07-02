Received: from mail-pj2-f1.google.com (mail-pj2-f1.google.com [74.125.227.129])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7CFE5335564
	for <devicetree@vger.kernel.org>; Thu,  2 Jul 2026 20:46:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.129
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783025215; cv=none; b=EHCszNE8LW8R5PTY4EazQBS8YWOOUi6CWsYEtgzxv0+LyLdWT2n52I3EHgpeJquq/VdDteJwpCcqMhQCGP3MAeh+FT3cNPUdf3XtOUCSz63I/CMRr5ZKCujMYw2ow+cfgHY3OjolBiTB32j+9chKhHyraRg2Cgf4Trf6lZKrc2g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783025215; c=relaxed/simple;
	bh=Zw/knChAUHj9Wkzt+sMcPlmSO6eUSb1rPhDuLApwHKA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=oatkIC5rOTiLlCk5q/bSZQuW6KddNgCGHMdHzcu6cppatXO4lEqGRtEJ+5+Man/os32oiXgK4I9QyJx/EpxgUpCofHGUjyIpQ0XE5phksAcxmU0w1MX49cQzXdsMl7uVFZ1kq9YrFbk65lY8bhpmFdkuKeDas2OFeyGBb+BSIF0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=VApQ7mpK; arc=none smtp.client-ip=74.125.227.129
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="VApQ7mpK"
Received: by mail-pj2-f1.google.com with SMTP id d9443c01a7336-2cac82afba7so2493595ad.1
        for <devicetree@vger.kernel.org>; Thu, 02 Jul 2026 13:46:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783025212; x=1783630012; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=QEoinIILiTKHyRPgP5StMa4pYa/MZMpin1k/LVPTO6Q=;
        b=VApQ7mpKZxNEhT2XG7dVlhoRqsCoPf7XtMYfoWdQEl/ms3Fbt7MBK0PF9zlMORxrcv
         4/R6M+r+ZVlrRLV1EouDT0rKxckWZsHJaHlikbinc3ZeDg1U8QmNfB8b3TBl77ie5LM4
         r3e1VxcJzkYaPamI0H5ryWTpNKO+23lTd/slKnP2gPO53Sjmu1/DcX2+jkol2LEx/xgr
         n5FkINsT4EYyZe1sdqT5NkQJ+f8WB5PmX719YtID+DGDf5iUCLqF05diQDlj7CiiE/f3
         fdgkyTk22Z396PdpLirMfP5PQQdrmM1uE9Y1xyGRk3110n25NInosKfn28wH2xS1Osn1
         c9kw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783025212; x=1783630012;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=QEoinIILiTKHyRPgP5StMa4pYa/MZMpin1k/LVPTO6Q=;
        b=QxhTA7xmuekyRQvaU5Gvc1lQVy4QOvnyIqWTp9/Fg5ZkxQYgX5ZmaC3TZ3zV2vLKuh
         Mh2rMO69/slgsWI5+LXS5ibP6bsMUd1GvJIjuFPnCoIwMyiGgrMfS3I/OCVbc/cDUt/e
         4G0u9GXVvi7voC3jF8zyLTSeOWKgk4g/BBmsQ0mJFxno8iEZ34XbPWITP2cGTh1mVHPn
         1hiypZA2Nk9V3WgMdBBl6caTheoPjRZ2KZnrFw/IBlUgcLmpuCja83GvJvtYlvGpTqNI
         BfehMMAzuUZ8DDplAKBsvKmEzJalk84Cfz2NkdP5vpXBK9R6/HqXZSlonnSHEKhX0zAQ
         qrgw==
X-Gm-Message-State: AOJu0YxafZOXwFE1581NH8K7ynserJm/Anhj8cD1aYo154BC2NwPrDBU
	TFuUnWnQBG8aEUE4GDGsNWrmtDZQ48qH31UHHg9oX2iFdBI2OlO3MB62
X-Gm-Gg: AfdE7cnNtoAH9v1Mdx7B3Mj/t1lzqLVjTE3ptI86RSGb2gLybZw3xu5gA7p22MdUMRD
	63D9JpSiYpsmmhnGlPzUkdiL7O/llMheyMsbuCy7/PiUJztEB5xESwkfJWMi89hGzaWbF4PtzOD
	h77lpVdzc0scJMlCgsSH9e6LZht+8gxkeQ0tP84TrlQTEWlK/eZsWUhWXDBPVKuv40AeBNj+h7U
	IW+M4DZe6uBK2ay1OrR4KWEYGnyYQRVQliBUPjraGyUBFfCcNVGsjlN2vnhuTe+vh1U/c0WjTXl
	E/vRsbOsxjY5j2Vu3iGOaTN1tnjK3sNNiJ6wbfMIy5tQyDH5C5ypMlfDzKoonBSIbDiPn8eslu3
	SQBV6z6m0FoK+TbH9ATPSzfDNK1HDrbMFZuCdLwaOWulxdXACDMWXjyDp8kJiv7Nq/+HUgLg4B5
	XsjkNAKb6/4xk=
X-Received: by 2002:a17:903:19eb:b0:2ca:1479:d9dc with SMTP id d9443c01a7336-2ca7e739bfamr80838845ad.12.1783025211663;
        Thu, 02 Jul 2026 13:46:51 -0700 (PDT)
Received: from server.lan ([150.230.217.250])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ca9a9004c1sm18654065ad.21.2026.07.02.13.46.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 02 Jul 2026 13:46:51 -0700 (PDT)
From: Coia Prant <coiaprant@gmail.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Heiko Stuebner <heiko@sntech.de>,
	Dragan Simic <dsimic@manjaro.org>,
	Jonas Karlman <jonas@kwiboo.se>
Cc: devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Coia Prant <coiaprant@gmail.com>,
	Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: [PATCH v5 2/3] dt-bindings: arm: rockchip: Add Graperain G3568 series
Date: Fri,  3 Jul 2026 04:46:28 +0800
Message-ID: <20260702204628.2407308-4-coiaprant@gmail.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260702204628.2407308-2-coiaprant@gmail.com>
References: <20260702204628.2407308-2-coiaprant@gmail.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Document the Graperain G3568 v2, which is a development board based on
the Rockchip RK3568 SoC.

Graperain G3568 series also have an SBC series with the suffix "box".

Graperain G3568 v2 belongs to development board series, not SBC series.

Link: https://www.graperain.cn/RK3568/RK3568-Development/ (China)
Link: https://www.graperain.com/ARM-Embedded-RK3568-Development-Board/ (Global)
Link: https://image.chukouplus.com/upload/C_153/product_file/20211022/6daddec9e400458816dd4c57ba807fc3.pdf

Signed-off-by: Coia Prant <coiaprant@gmail.com>
Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/arm/rockchip.yaml | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/rockchip.yaml b/Documentation/devicetree/bindings/arm/rockchip.yaml
index 1a9dde18626d0..9eb2f66ba3856 100644
--- a/Documentation/devicetree/bindings/arm/rockchip.yaml
+++ b/Documentation/devicetree/bindings/arm/rockchip.yaml
@@ -684,6 +684,12 @@ properties:
           - const: google,veyron
           - const: rockchip,rk3288
 
+      - description: Graperain G3568 series board
+        items:
+          - enum:
+              - graperain,g3568-v2
+          - const: rockchip,rk3568
+
       - description: H96 Max V58 TV Box
         items:
           - const: haochuangyi,h96-max-v58
-- 
2.47.3

