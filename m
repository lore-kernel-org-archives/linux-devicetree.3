Received: from mail-pj1-f44.google.com (mail-pj1-f44.google.com [209.85.216.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 67EFC212554
	for <devicetree@vger.kernel.org>; Sun, 16 Aug 2026 13:17:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786886240; cv=none; b=rEdDcd01wj+3uc8xMhR/p+2Y/X6u+ipObRjXmwTuZckxE3xZXsHBRWt8WBluCJPbXXBxOQSjY/K8Eoz0EDfCk1WKitf5pqooIq8c5GCUl2WvRmZ7ijuzJOcHAh1rrOde5NGvmgkQJ75kEpKbW/F5FOazX4oLdX8dSi/9ieveppA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786886240; c=relaxed/simple;
	bh=9lh6SnLl8V0+6EkqXPMHz3NbVXtbKUgYWv5JtTJxcyA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=LEVTS9hf/zsEfcluYmixvgH+M6zyrX/HU2jYk5vWYNa3DFgGjw+1j/476b3YVfac1Jne1EZJzbZVpJHrv/HNLCJwztaxr78H8TgJljHXeGQG4kbEZSxnLvYUOkDeWf9OfU9N3GZHVg3Oxg1BQLbEcEMlvYDPQeBuStJC9+e1N9c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=bmOz/1gV; arc=none smtp.client-ip=209.85.216.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="bmOz/1gV"
Received: by mail-pj1-f44.google.com with SMTP id 98e67ed59e1d1-381b831d535so3799485a91.0
        for <devicetree@vger.kernel.org>; Sun, 16 Aug 2026 06:17:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786886239; x=1787491039; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=8ovohQRp3uO6IS6H5dgbCzXT2FrwL8JP6NNpNzDBnNU=;
        b=bmOz/1gVcR6ERdXCY4tLCk57ymrS/g98sSiUme3dKv+xQ5sMgoC/EzH4emwO29XxLV
         a36aD09e4/340bdouXhd1ezxag3hdM5p98qZ+6ZTW2Uxp84iliI34IiOG+dXRCFx2mk1
         OiHz43SoEe8B0kZv2sreYJa14qGujKnGqmz8slCKbHNeDDlSi3LmB/mOb+RGJQ/tShxy
         nvO336O4BWx+/lx29a8yNAW6CVzon8n5lcsC0mFwL5DwYY5Bim5TNJaHm6bM2PIN0hZn
         hsWHkT5nsIfNzzAXXUoWL4xmRMpES1mj0Z4WywuTuKZoyBsq0XYV60YXcN87xhR7CWm7
         xVSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786886239; x=1787491039;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=8ovohQRp3uO6IS6H5dgbCzXT2FrwL8JP6NNpNzDBnNU=;
        b=jqyhbV9vHSQMZJqcJjfKvl0nQpSV+BT35xH9mLhzRsTgMYfTnWHHfu3ShXmbb4ZP7Y
         D53fREtXM3TIRwegA0g1RSDb466YZWfwAJXj7yGRLNNWP88h/boRxsLmpWgANhp7Hcw8
         nTDNeupmOZwQe1tshgfXasFL/Ma/GOak0e3Iq5t6mm5m0NbTChJ1RzO6ciq4QsbadwpE
         QP41FAiQCI1ykXyt+3ssEdE1gZzbP4GvScChk8sU+ZJkAeJo1x2sbfXb9PgCK+/Ffyyn
         WQSG68vxAUxIZWg6Qdz8gvXtX0UFyKBmQ0H9dObRQaOQt+NEl6FIkxxZW3dYsTXwJ1RZ
         Y3mg==
X-Forwarded-Encrypted: i=1; AHgh+RrGvzlX1+ZkGfO2XnRSPPgv1KGq3AZuDX+75+sFgZQmiN5onsn6lnRdb1/yfxlelnU8qp3RiRU5BabP@vger.kernel.org
X-Gm-Message-State: AOJu0YzgwhoYc1JnCKTbIRx+m9DPXHGu1PMqFxHW6WOt3sc6PPmE+Aj4
	1goE/HQ1xfdQ6unoYM7EuCEu6luLg1NMHw7J/NpjFgU8dpJDGf1KJRQC
X-Gm-Gg: AR+sD13jD6Xs0XUTeTQTYt/NlVqVSq4PwJX+RhKFyicfQcCMgwq6XiKNDCe9SgAFLe0
	pS9oBN//YX6hjBG8910xFwL2FB69HvlKQknFyyVtmwsAiaAnQzgdEPJe+fL1HXCT1sdV4nzW/l4
	l0YGu+sOiPx+MsyX58SRNgjSknIk6/9UducoxU0QEiW2MWLZJdu4/dF5iVp6Ridc9v3BDQZLKMD
	3n05YxUJe8pW0xYmjRZ1IGSDSEeyJopeXKq+VMjw0qknO+0fUcbIt0LtprHRW21QhYI8P041ltJ
	CPH4uwWBTLk34GpmeLJTeEewFJ8QBjZ8NMTVfXIwryra38+qDFVfCCaJar//bd8Wh0QCZ1poYsj
	ihbfm0BUOmUStvofbRrubLsGiKtR2QjG5KwzCQiTuohxnho5E1cgZMioalAGsUA5wJMJfI7wKFD
	DT/XmJ8EH6DRF53qelJ4j7/twbvaeIsRJqXEOnrtHmc5h6wW7PV9zILfYSjNJoBxEkIAI9t5q0O
	9sP4c87rYk0
X-Received: by 2002:a17:90b:3f50:b0:38e:6f90:eabd with SMTP id 98e67ed59e1d1-3933b7213c9mr19862401a91.5.1786886238756;
        Sun, 16 Aug 2026 06:17:18 -0700 (PDT)
Received: from localhost.localdomain ([157.51.221.131])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1413887e3e7sm29235330c88.9.2026.08.16.06.17.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 16 Aug 2026 06:17:18 -0700 (PDT)
From: Sreeshankar K <sreeshankar0910@gmail.com>
To: andersson@kernel.org,
	mturquette@baylibre.com,
	sboyd@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	quic_tdas@quicinc.com
Cc: bmasney@redhat.com,
	linux-arm-msm@vger.kernel.org,
	linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Sreeshankar K <sreeshankar0910@gmail.com>
Subject: [PATCH 2/2] dt-bindings: clock: qcom,rpmhcc: Document RPMHCC bindings for SM7250
Date: Sun, 16 Aug 2026 13:16:45 +0000
Message-ID: <20260816131646.10551-3-sreeshankar0910@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260816131646.10551-1-sreeshankar0910@gmail.com>
References: <20260816131646.10551-1-sreeshankar0910@gmail.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Document RPMHCC bindings for clock rpmh driver on Qualcomm SM7250 SoC.

Signed-off-by: Sreeshankar K <sreeshankar0910@gmail.com>
---
 Documentation/devicetree/bindings/clock/qcom,rpmhcc.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/clock/qcom,rpmhcc.yaml b/Documentation/devicetree/bindings/clock/qcom,rpmhcc.yaml
index d344b3386..df9e37f90 100644
--- a/Documentation/devicetree/bindings/clock/qcom,rpmhcc.yaml
+++ b/Documentation/devicetree/bindings/clock/qcom,rpmhcc.yaml
@@ -38,6 +38,7 @@ properties:
       - qcom,sdx75-rpmh-clk
       - qcom,sm4450-rpmh-clk
       - qcom,sm6350-rpmh-clk
+      - qcom,sm7250-rpmh-clk
       - qcom,sm8150-rpmh-clk
       - qcom,sm8250-rpmh-clk
       - qcom,sm8350-rpmh-clk
-- 
2.43.0

