Received: from mail-ej1-f48.google.com (mail-ej1-f48.google.com [209.85.218.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 70F481917CD
	for <devicetree@vger.kernel.org>; Fri, 21 Aug 2026 12:37:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787315839; cv=none; b=MpXA+bZq+mBuOc4ZdJCHfaHMODKrv1OFjiNfUE0sMRnxKIfjG+EFgggy6ilV4kn9rt2F1UKgpnrckwJfss2N/vJddrnidEtxFMltVUMFMifADMOaIbAGW8nMUq2awhsEz513QBQo/R2xRvuc9wVU0HC9k0x3AWrGwSVG6Tz32Dg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787315839; c=relaxed/simple;
	bh=Tjd+qqKRlPATrV03pdQqCuwbNQZAlKYm8gvQMT9w2Dw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=MFzvnwY+ypLsaw41lRujZVRwl2qheN8hN6Upkh/j9PniJxbA10dDKl27QfVIodGat4WF2QdLw2Kcv9mqPtReON63mvhWfOGenpqnFAWFR8mCD4XoV4XA8KiPMeXIewsbnS9gYdC+nsqsVeu1LdnqwuT6g9oQ1TKm0YLZGFrwWmo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=fw7dt/Np; arc=none smtp.client-ip=209.85.218.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="fw7dt/Np"
Received: by mail-ej1-f48.google.com with SMTP id a640c23a62f3a-c167aa9500dso149605066b.3
        for <devicetree@vger.kernel.org>; Fri, 21 Aug 2026 05:37:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787315836; x=1787920636; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Lw0S7j61Xivg5Kyv67PljsWbYXB5K5jcfpwkKzbAMRA=;
        b=fw7dt/Np97B+uB8XF07hJyCi1Z36S4oLLvsm62THffOHSq36iMkpCWgawjDi4wQRWs
         /vOiP7MetJfzyA4CJvfqH9QaaVobqs9S9z+A3HQs3WaMnKZ9OQ9t7CPcgaRbA4YOo4cK
         CYOYu/R3vn6z6kOe9o5zHaFgQvJdplL4BNTM3iiO8bhzCuBk8Na6HQlYca4ENRFKmm1S
         GtQbTF6cTbt1fiVzzRzsvjetGMl+5fSyNRVs5TdsxKmQ7Md0FLjNKZoCMFCmxCYDxVAx
         +ty04xbW5kCvEJ3gqef4FqMD20CVH5O5jTjIexZtKKTTWHOsrR966sygyvZHtZWBJw8u
         xhPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787315836; x=1787920636;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Lw0S7j61Xivg5Kyv67PljsWbYXB5K5jcfpwkKzbAMRA=;
        b=GwTTarauPcXq3vdvEoqz6GYCOndq7raI7mluARH5ODelPijmPKdXMgt0Bcsc34N92O
         VQsgFQEz6iYd+lOxd5eZikaM6KDuy1wWU3U9sbbZZly+J+MizYkIoDTiVLQV/oieeYuR
         ERXQbU+crbu9DKHoqHwWdF7XtsEUWgwUOqQp3ZjrKyM39bLYoKgf1ljxZ50vxnXP7vCN
         k8oYhKCrlS6RkLoENCXc1nR/bRGb7BU0hSxSuZm2Exgbx6MZokuwVCzljo1sJCZ8yM0U
         IJZsHR+wjtpX3qE2mjN7q+XdcAh5HS+IhZhn4wTtEqItoFfiSzBhGc6VDm3HLJqoM5NK
         VWWg==
X-Forwarded-Encrypted: i=1; AHgh+RpKL19DcJ4jUVEI+/7qbW0E5Yp2K5n8OWuf6s+WYghYIpjtT7Tte7Gxm6+WNcR3QqJd6ampjzUZY3u9@vger.kernel.org
X-Gm-Message-State: AFuF++nzwenkNQiQrct39jDRhoMjNBlfzhBznfECIizQNCxvuMMDvHno
	KkhkDKxWhgJAsZWpTpSTOdGQYxzoYwNL/L5NkRdHHcIRVfGS8dbtkzLi
X-Gm-Gg: AR+sD13gHd8vyEZRdUoZAuq4qGvPjXZl6gKlOPnf6uNsrKdvvHdlWXEBhacbp4SNqpF
	zAiy0SLxcE0P3Xv+mNengV/50kmx0uMEY1oRcXgZU4nFiq8nKlrvwVyiwQ0ZDJ2WUJ+Kf6SXaI/
	ASzo6kR70EK+ZsAkBedMrAUsc5d2CCOqCsbc8DWRtus/KdoBoBx9JrnwNeC2ca0EaIy/dFdACUr
	T6V+V7xFpRo3a99KSRUK3a9O/AAJLgdmILkUq1wqP0o5gzhyF1O8bQIS1Z+yWvkEGyUPfiw9hPC
	ME0LlPIg5pop0e1mz2RfDiVVZEt2xke0lV7SQE8/Z3y2DhoBh+ogcNQXUkQu7urQJTFdYE706rk
	Eg96NeLIZ817q2H+tuHr+GgSxkVF2YmmlgKNntskXBcNksiyw8p7jXEfrfdusXuqtyN1ccwR0Q+
	BuR79iUKuqutRXxu5VwHet5nXhskBh+SmwDlFG9GWorq16K1ZEZBAAuWovC1iDLoRb2l9jVXWSv
	nzf1rVMA2/fqbEvQ1y5rzQ=
X-Received: by 2002:a17:907:98d:b0:c12:b2db:873d with SMTP id a640c23a62f3a-c246a2ec634mr725649966b.5.1787315835633;
        Fri, 21 Aug 2026 05:37:15 -0700 (PDT)
Received: from workstation (161-53-210-87.ftth.glasoperator.nl. [87.210.53.161])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c24591e0397sm451194666b.53.2026.08.21.05.37.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 21 Aug 2026 05:37:15 -0700 (PDT)
From: Stanislav Zaikin <zstaseg@gmail.com>
To: Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Sebastian Reichel <sre@kernel.org>
Cc: linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-pm@vger.kernel.org,
	Stanislav Zaikin <zstaseg@gmail.com>
Subject: [RFC PATCH v3 1/3] dt-bindings: soc: qcom: add xiaomi,taoyao-pmic-glink compatible
Date: Fri, 21 Aug 2026 14:37:09 +0200
Message-ID: <20260821123711.1579539-2-zstaseg@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260821123711.1579539-1-zstaseg@gmail.com>
References: <20260821123711.1579539-1-zstaseg@gmail.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add the compatible string used by Xiaomi 12 Lite 5G (taoyao) so its
battery manager can be matched to a device-specific variant in
qcom_battmgr.

Signed-off-by: Stanislav Zaikin <zstaseg@gmail.com>
---
 Documentation/devicetree/bindings/soc/qcom/qcom,pmic-glink.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/soc/qcom/qcom,pmic-glink.yaml b/Documentation/devicetree/bindings/soc/qcom/qcom,pmic-glink.yaml
index 16ad4f5698fc..8ca057c4e3e6 100644
--- a/Documentation/devicetree/bindings/soc/qcom/qcom,pmic-glink.yaml
+++ b/Documentation/devicetree/bindings/soc/qcom/qcom,pmic-glink.yaml
@@ -41,6 +41,7 @@ properties:
       - items:
           - enum:
               - qcom,sm7325-pmic-glink
+              - xiaomi,taoyao-pmic-glink
           - const: qcom,qcm6490-pmic-glink
           - const: qcom,pmic-glink
       - items:
-- 
2.53.0

