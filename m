Received: from mail-pl1-f171.google.com (mail-pl1-f171.google.com [209.85.214.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1DDAA440657
	for <devicetree@vger.kernel.org>; Tue,  1 Sep 2026 07:09:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788246549; cv=none; b=A083p2ZjiPBvmKdhmp3dxraWjMWCIy51Bi/gKOBFrqxiLSZolXTX4ZvXaqfDva295RTGKBkMghyjKo2sTUbCslkY1ZTqcsuleeiTqnlGCY9a0eFqQOhYmbDduXVTq3SUmi96LwXpS6LsIcjkpyPvjbjpBzTB7Z7lo5i9vzEwZb4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788246549; c=relaxed/simple;
	bh=gKbqr+JbhugVzrK4haKucfxH1GbAmaJ/63Ra+8PimmQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=l4SvwWR9GSdCchhKE3TRCh8bE2Hi97Zk3F1HQYdDB8yz9ztcDsb8GKBc4eHw4z+OmL/XuzMH2SWpIMOsmz5+oKWjitW42rSqTRZBbr1jI/y2JH3Z8GyEYIj92vgWZk2UXAoNvHE/0iJrA+WDsLW4MXI+paB4pligfoPVf8Rmrdo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Phe2JqIW; arc=none smtp.client-ip=209.85.214.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Phe2JqIW"
Received: by mail-pl1-f171.google.com with SMTP id d9443c01a7336-2d6d28aa26cso3297335ad.2
        for <devicetree@vger.kernel.org>; Tue, 01 Sep 2026 00:09:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788246543; x=1788851343; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=rRyq9W1nPrd5M7AXluKRAa4K58WRzpGWnzgIJ9MVQJI=;
        b=Phe2JqIWVhkcmHMVwV4x2jf2mFz8ddFaX6MdeHWdvR/6x5yIqugoX1/+4DNNjJSft2
         X/SeOAojkzak60UQ4rU5+7jkXN3iHR3Syt+yxmHap99/P6Xy/oS9OVIdxqPPldnh4K/v
         GloILvN2f/iUIKDlNJ1SZipjw1grWQcNMbXC4uZy3W4TfytoHk/NxbYbrq8t6a/nbURt
         3mGjVpq1tJVR1ptSQGyzJPD18OoUvExs5LKZMp2Y9ugzSXVcqzU5mTXJtIjT4qJrb8VM
         SKAUd/t7s2ZGvoHsAKfZWuCzgdIC8fwrxw8G2LeysDcKCEu+K16wWO64xZkqPbZhXGP0
         MCEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788246543; x=1788851343;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=rRyq9W1nPrd5M7AXluKRAa4K58WRzpGWnzgIJ9MVQJI=;
        b=k5L6CF+2WJQ+JEQgtE7M01Zlw3odBNX097023TKWXDX5ng135Ch3yoeAi4EzTP9xbr
         owz4jHwkCUJEyqkQcF2/hj/4SE/KnQaTFyhLIutdTqMkqS+mh2RNMuRio+V/Oombc+kN
         ybiUiBrrmqfxxM7DKTlg9YXqklEb/TKSHqIDy8ID3a1O6MwWcblTjQCOe+T/CrzvCKOp
         3BFyCIwmIFA04u3WozOFB2ZYOxTJ8M5IevWieGx2gtqfi/xQENaeD4A2vvDhloxkoQyr
         mTYQj0WVGmOQApNRakC4v1HJ1ddh+N9A4Kp9yBWWGgxEHrIxAiKlEdt/WXy54p7ffkF3
         qXNg==
X-Forwarded-Encrypted: i=1; AKwUvByWjIm0DW6dVfeHQf2s1a8UQiv+NpdNY7rGX+rtzdGct86gP4YRZi0p/8PKtjhvgwn0aaWFcUB7dtXi@vger.kernel.org
X-Gm-Message-State: AFuF++k9Yr5TMwFzAZTyEc7IK0R6ltxclxZgMlhdvgsaPYOeSQaEstPL
	PC9FyoXSf9Qt6fL47+HYCw5RLNgTFxhoqm/2J+t0EeAuQZ/Yb8G9BjCF
X-Gm-Gg: AYBFou25vDkwFIFLqqqXVXsUiFVoaUGgL3x5LRHisOKVRFdvL1dkkM3UacTTaUr0W3L
	5SldB+YdMo3OJfYSMQvv+AWbOeA8kJfPLPtDbd72hf4B4TkoABJZ+wJ3rFb0ofZSlYsgfBbn6v0
	1DWeCyBwNVwqtgyAbxMgnV/Ms2LN5Ds28lTPJlRrdp4hPyv8Tsx6JQeO3/mO9D3ZlkMfAXqNuJA
	y5p0umYJd4keBBiGjt3WULASlGckDcvI6LjoTqdMrHsCnISUcLUzCkpJnVJNnyfVbyjibFsAiy2
	0YHm69jKdFXLDlnoaLCjZVHXjZdZksWKx1kxBpvmkjCNdEMovwCL9MmEPD8DVeNwLd/FEO1HQHc
	rBdKk//q6A0WD9uV7mI2K2l8nwNpQq7XHoa8MetTNl+wu0hsSSvCgTOXCIp0F7X0/fohRwlrPNl
	vngtSgowmLwpea8Jw2xPT0cAxeITSLgPPl38+ybBJqfx/SXJq7o4yi/2EcRLQwLV/nLhAcuBhsy
	efFLUxkqd0LGA==
X-Received: by 2002:a17:903:3803:b0:2c8:2808:3ec9 with SMTP id d9443c01a7336-2d74df0328amr524510515ad.12.1788246542738;
        Tue, 01 Sep 2026 00:09:02 -0700 (PDT)
Received: from localhost.localdomain ([157.51.207.128])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-32bdfd03e71sm18274680eec.1.2026.09.01.00.08.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Sep 2026 00:09:01 -0700 (PDT)
From: Sreeshankar K <sreeshankar0910@gmail.com>
To: andersson@kernel.org,
	sboyd@kernel.org,
	bmasney+clk@redhat.com,
	jbrunet+clk@baylibre.com,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	rafael@kernel.org,
	viresh.kumar@linaro.org,
	konradybcio@kernel.org,
	tglx@kernel.org,
	ulfh@kernel.org
Cc: radu@rendec.net,
	abel.vesa@oss.qualcomm.com,
	taniya.das@oss.qualcomm.com,
	danila@mainlining.org,
	davidwronek@gmail.com,
	mani@kernel.org,
	robimarko@gmail.com,
	linux@gurudas.dev,
	linux-arm-msm@vger.kernel.org,
	linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-pm@vger.kernel.org,
	Sreeshankar K <sreeshankar0910@gmail.com>,
	Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: [PATCH v8 09/12] dt-bindings: firmware: qcom,scm: Document SM7250 SCM
Date: Tue,  1 Sep 2026 07:07:14 +0000
Message-ID: <20260901070717.20513-10-sreeshankar0910@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260901070717.20513-1-sreeshankar0910@gmail.com>
References: <20260901070717.20513-1-sreeshankar0910@gmail.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Document the SCM compatible for Qualcomm SM7250 SoC.

Signed-off-by: Sreeshankar K <sreeshankar0910@gmail.com>
Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/firmware/qcom,scm.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/firmware/qcom,scm.yaml b/Documentation/devicetree/bindings/firmware/qcom,scm.yaml
index 037d4ad8f..0cbdb3b2f 100644
--- a/Documentation/devicetree/bindings/firmware/qcom,scm.yaml
+++ b/Documentation/devicetree/bindings/firmware/qcom,scm.yaml
@@ -74,6 +74,7 @@ properties:
           - qcom,scm-sm6350
           - qcom,scm-sm6375
           - qcom,scm-sm7150
+          - qcom,scm-sm7250
           - qcom,scm-sm8150
           - qcom,scm-sm8250
           - qcom,scm-sm8350
-- 
2.43.0

