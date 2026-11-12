Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.174
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794483530;
	b=cbiZeoHaBWzPE9bfu/Y8GCeM9triAHTMwsFzdC2ilzH18O9azN4wUtpE9hkahXkquRp0
	 SgP+/s90+aU4BMBQeUkCiKOOxi0JSsXWn4xyTKFtumI7Zf2ocxsfaP9omApN0GQOJd45/
	 5hpHg63wGSGKStj0KwGMliZTNYhe0JXY760O+TrOmrH0gWUX0ebPcfEYC6qcZnuMzj3/H
	 ilVnkV049TBzJ7fSxVt6yrwwcQPSwT45JGOfj56ISyOH8T7nmWjwND04mQtCtxi5Kxggk
	 M0AooTQl1Wcpx221mdiMZSHMRYykNOqFxa7xi2Prn+P6D/ay/JKX0Z7J/M+CSjXTZbA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794483530;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=BcHFKzH6PC0hX0kM+WnfYgJDlB7llMNXzNgtx2MFobA=;
	b=HJR0tlJoD3u7/kVZ+7C1S6WQZnkqDSz3X1qbWtJENVFqgJqeFmh9kkOz+KTcjDvo4w4t
	 tiCfmv/3rcQ+ovKd7AJuzHWvbQRgfgl7kyAh+DtHJUOeCeJQQEKAJISnm8qMrCIltjltq
	 FaqcqnhIoTjBndB6ZUzIsw4ydYttwG62ytYhgxAesx1ctxzEmoL0BB71Ct5oRfp+RnnGA
	 UM0Iq7Hsp5dN/6KQMLooQYxzNEn/2wouA3imzAKTr7VC6XNifBJ4xlK+XWXj6BuEPZ2uM
	 shdnoCxvHZ5JFTrYDM0/xQH3iFmzr/QWg0c9m/DWuovSv2mgm4KqVh+M/HMNM2mes0A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=bpc6tjlp;
	arc=none smtp.remote-ip=74.125.82.174
Received: from mail-dy1-f174.google.com (mail-dy1-f174.google.com [74.125.82.174])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A63D3606A331
	for <devicetree@vger.kernel.org>; Thu, 12 Nov 2026 11:38:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A63D3606A331
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=bpc6tjlp
Received: by mail-dy1-f174.google.com with SMTP id 5a478bee46e88-3720addb068so7407555eec.1
        for <devicetree@vger.kernel.org>; Thu, 12 Nov 2026 03:38:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794483529; x=1795088329; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=BcHFKzH6PC0hX0kM+WnfYgJDlB7llMNXzNgtx2MFobA=;
        b=bpc6tjlpFatIpalsJ00zMwHn1GBcqsf3GQV4V2rJbh6LJsquLTd7ybtJh1ijCy47Jb
         c+d1mWb6vX+BpgcenjeNRTpaOEato340SQNSThVZ+mSFA1svcmkV1KNtArFv/4ehxtke
         m6v9iiJVqFBqRwE1AtFHLxr+ti975c+/Z6EzYpOo648IXJoS5U6guDhNGa28v5f9EUt7
         oJV6DlU68pRPghGGxrQOfOoOqssth/ABpw759qlasUmCj5qh6NuOgzYEtoxLMyt3YpDQ
         dzXGK0sJd/4Vy6sj9SEYrLLXWeV/gWrcYhgZQGziUXAScIlS5FNZKiXCg8f/yvO/ZfgC
         N+wA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794483529; x=1795088329;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=BcHFKzH6PC0hX0kM+WnfYgJDlB7llMNXzNgtx2MFobA=;
        b=Dm/kvA8Jd77Lp4LwuQ0CIwjeb65yk1F5a5HlTidEpV4+P4mfvcbFchbQKdaJ7yGo/L
         QJe0fFiEvZ6JZbZy9Fxo+RxvSc1j3XVwxDchn//tAZh6HVbCioo/KscR6LPAJIOKBvIY
         Hx3dp6QLm7EVFWraVpvs56rUWthw05/7xQMhHm2dP0pWbhVvr0zZg1pRH7zLiCgeKjzt
         Ycrb19PBSh79xe1cx3AcvLo9Up3tsrB7UU4N4whqZAyvFdMreIZwyBqZ+7yUILghcVjf
         yJj/0o+DGyBjSkniQQ4TpCPEQK/c2bPXVzvePIfttht2WBTsbZZVbygpZ7/x8rTSnrL9
         Z1LQ==
X-Forwarded-Encrypted: i=1; AL+hErFc3DjYzCSnC5WTNDMwBf8A8MH3AC8ttkQu0myXhhfVF1RfBfsk8Gy6sKR94jHbEeee+vbjuNakclbY@vger.kernel.org
X-Gm-Message-State: APuU4Z+g3xwwydokN+rWRs0/jLwxofN2N2v3yJCwutscJLV6jlp9rybI
	qctGGKLIgafE7CzSsZq3MhiEzW/gfWOKv4I7v6XxQevqom2AJ7ueFTBJ
X-Gm-Gg: AYBFou32G51KxUOtf/N+DxxBPTcODheK7bhwVPd/aLMcjlWpyhL9dKX2DwKYv9ZUXmI
	Uutz//E5F+aMVri4q5RgCUyGdAcVaDtbaI+HeMXADOQ6zomFyrsuxbPYh4oonSjhqKQoD2wxqoW
	TwdV1rm5oU8E0BcK1Q/VmLouWw0xHkWyimuQZyGhTlTL00m+3Ri/zEDv8CS5UgrDG0JiV0+HjH8
	bu0dsACtxi2ZOmrTn/AktKDqKLiH6VNLK1viikE5QM5qpD/xx+nHh8nXweoDM896CyjyHwxctOy
	dmZkXYx/a5I7g7Ey9TAa7Q3YNOmVz37mrYA2so2rAClT12p/od/amd2nIhp2tauXZYvtIET6rac
	3chk12XxtnrYQStA26XsCR+D2USUtwezQb5hmtxiillWSxasQ5vJqx+7YcqwL0o/JghaVohj3yI
	KQpV7SpRJP0pSZ8A6ib52EnDyvewJ0iwBJnbVU0CBfE3oYLCdSQ20i+fupRQN3X2zL/TNxdzw99
	sSQhuLdq7j8/JWIcWPAN2tUK7hU8J/6bDAptnkmBTdzh6irqzx8EgZKZMBAzDPFq6wz46Vny8um
	khX/dX9GaxLq1u+Bl62G+gaBiZVlbUhgxTXwoSDyBg==
X-Received: by 2002:a05:7301:430c:b0:351:7e5d:2de9 with SMTP id 5a478bee46e88-37683189067mr5405543eec.1.1794483528595;
        Thu, 12 Nov 2026 03:38:48 -0800 (PST)
Received: from DESKTOP-NM9EKIA ([180.67.33.100])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-37520cfe07dsm27149036eec.20.2026.11.12.03.38.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Nov 2026 03:38:48 -0800 (PST)
From: Joonhoe Kim <26rote@gmail.com>
To: gregkh@linuxfoundation.org,
	Thinh.Nguyen@synopsys.com,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org
Cc: andersson@kernel.org,
	konradybcio@kernel.org,
	heikki.krogerus@linux.intel.com,
	abel.vesa@oss.qualcomm.com,
	abelvesa@kernel.org,
	wesley.cheng@oss.qualcomm.com,
	krishna.kurapati@oss.qualcomm.com,
	konrad.dybcio@oss.qualcomm.com,
	dmitry.baryshkov@oss.qualcomm.com,
	neil.armstrong@linaro.org,
	val@packett.cool,
	balaji.kalkonda@oss.qualcomm.com,
	tvlad744@gmail.com,
	effeffe99@gmail.com,
	prashanth.k@oss.qualcomm.com,
	yongxing.mou@oss.qualcomm.com,
	linux-arm-msm@vger.kernel.org,
	linux-usb@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v3 1/2] dt-bindings: usb: qcom,snps-dwc3: Add mode-switch
Date: Thu, 12 Nov 2026 20:38:37 +0900
Message-ID: <20261112113838.506-2-26rote@gmail.com>
X-Mailer: git-send-email 2.55.0.windows.5
In-Reply-To: <20261112113838.506-1-26rote@gmail.com>
References: <20261112113838.506-1-26rote@gmail.com>
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The QMP USB3-DP combo PHY stops the USB3 PIPE clock when a Type-C
DisplayPort pin assignment gives it all four lanes for DisplayPort,
while the controller can keep running its USB 2.0 port. The controller
has to move to the UTMI clock before that happens, so it needs to know
the Type-C mode. It does not route any signals itself.

The Type-C class passes the mode only to graph nodes that have the
"mode-switch" property, so allow it on the controller node through
usb-switch.yaml. Orientation and retimer switching do not apply to the
controller.

Signed-off-by: Joonhoe Kim <26rote@gmail.com>
---
v3:
- Drop the mode-switch line, the usb-switch.yaml reference allows it.
  Disallow orientation-switch and retimer-switch (Krzysztof)
- Say in the message that the controller does not route any signals
v2:
- Use the common usb-switch schema instead of a local definition

 Documentation/devicetree/bindings/usb/qcom,snps-dwc3.yaml | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/Documentation/devicetree/bindings/usb/qcom,snps-dwc3.yaml b/Documentation/devicetree/bindings/usb/qcom,snps-dwc3.yaml
index b77c02c64d45..fdc2bc8d3045 100644
--- a/Documentation/devicetree/bindings/usb/qcom,snps-dwc3.yaml
+++ b/Documentation/devicetree/bindings/usb/qcom,snps-dwc3.yaml
@@ -158,6 +158,10 @@ properties:
       HS/FS/LS modes are supported.
     type: boolean
 
+  orientation-switch: false
+
+  retimer-switch: false
+
   wakeup-source: true
 
 required:
@@ -170,6 +174,7 @@ required:
 
 allOf:
   - $ref: snps,dwc3-common.yaml#
+  - $ref: /schemas/usb/usb-switch.yaml#
   - if:
       properties:
         compatible:
-- 
2.43.0

