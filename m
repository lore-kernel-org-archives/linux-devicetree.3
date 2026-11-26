Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.51
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795685916;
	b=ht16OJjoNjmkMuZ8+goRSWHUk+EoKNY/eu1hu3+WfgnK0w9WAtNLUPd7G2PsmwJrSRQW
	 UG3GcCVd/QFlFMqdj/3XnZZozvfk5BHb0J/dcc5Tg3lJWXjMXg4qkGiiuXR59M52IrPkF
	 lw00Hw6QRVl8LbWPezlw+Eqe65+itpldQAhEkOvkw7rfZyqZF0ax3oWAqybsa90gLJ5VB
	 075jrGseqJuDlgFS73uAFzeXud4lWIVwtwY6tFBpyghjcZcCMSTMEI+DBglOo4Q24kbkM
	 Wn3FwgziATaSLrxYCP0ONijs+DSNQLAOnAN4hnt/fDon31dRwbP7q5zxQkp+nXpbiaA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795685916;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=OJjcEC6A3l+rkxqAUXBKDBDeimXRqX3a+RszRTJllzk=;
	b=C/IPV/NF7LEe3IOhDti1DTTlMXx6fl7qCkRSze0uB02/kpPVGixN061LTlQxGSSTctDj
	 KBV4k/p/RsKE22uGEep2OgqZwNVOwZkhT58ASjvliHkgND0xlh0dYBBXfxR9N6QElqtJH
	 nd6MArcx9pUoeTmOmqMIHkPZob6g/LHWxj1SQU+nuF0mc7+ab/OTB5u9b30YBzAmMIo5M
	 dToMRV2RksfLk3efWjZC3IW+3KXkeEqtQxLE5Tf7Z2exQ/2eL/7qs3VeA25V450B7p1rf
	 1wuLKS7213j2cTFnTO9cvVF3SW5gGPGqwi8c+Zz69sqsRVUCISZgiZcW7Yi/E/LW+Vw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=mspHNW9F;
	arc=none smtp.remote-ip=74.125.82.51
Received: from mail-dl1-f51.google.com (mail-dl1-f51.google.com [74.125.82.51])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C26DF606A32A
	for <devicetree@vger.kernel.org>; Thu, 26 Nov 2026 09:38:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C26DF606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=mspHNW9F
Received: by mail-dl1-f51.google.com with SMTP id a92af1059eb24-1a2761c69fbso9084603c88.0
        for <devicetree@vger.kernel.org>; Thu, 26 Nov 2026 01:38:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795685915; x=1796290715; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=OJjcEC6A3l+rkxqAUXBKDBDeimXRqX3a+RszRTJllzk=;
        b=mspHNW9FnADo+E1ymBnNgtLq5lsFnyrQ2XEib50gP0GnXtd7/P7RKZZRJCIHL1dQNS
         mO+0RD0rMQKzUf6/Zu4ApJYHNvXF3j9dWnU0LP4vJnYRyCgPM7vT4mWFd3weRA+iYyDz
         z8Z9wjMEBuRwu+qrEP8lSRVjHpYu9lHKQgCWhJKoxtl2B+bWXmc2kJyIkOSf1k5dHLwc
         gkpol3mZs7/WVitJGWL2dVNh5m0WgcbzLBc6g+Hqa3hc5yiaf/eodMUiwKj/ROYddYBh
         dKEXyyYp2ZItKs4wtyqzcH3tZcvHAp163PDcMVwqKXSbW2g0v7a12tu1Dw12eiZUzh7E
         U3dQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795685915; x=1796290715;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=OJjcEC6A3l+rkxqAUXBKDBDeimXRqX3a+RszRTJllzk=;
        b=RRePFjXHA+44rdAax6lEMQ75ycpzOJwBw/8RD+LqCexxjYdmphMxNr0UMG69v0QGvO
         RrqaOdv114jIZ8DQCwe9nXUnbAQRNf/pQCoEWPkD7adVg1wAs7TsPwtoaLOyIGC+cZiU
         N1h0sa+2TCDV6aVy6v2+rVFEMdfCqnH+yJjazTOp3s6xkZte/YbaIeVcdT9D3MDs0Qmi
         xTfpw9Dw+IjB6KA8r3L+ZlSVsA6YhXK9zpFsWIPjRQGg1/pvU0tRzHhn39ffiVB8ZBvW
         YJXiZsiwBPYjlaopI0tPQ3bv1YwbEoDwQwhnRgvQ+EyAJCE/USpiHHR2KOIUQrhTxcrX
         yb9g==
X-Forwarded-Encrypted: i=1; AL+hErHj2gBGtK4xzBf0R1YS524saewYuuffbJFcwPYuNNZrBPxBrXGoDbxt8iB2bLw5hqXCw/Z08T9lGEwg@vger.kernel.org
X-Gm-Message-State: APuU4Z/uYO6k+Q/nFRvwlqBAPqtnf58LEbCAC93JKl+BNyJ/7+I71ZMU
	4Jp8Qjxd/dRBmJ2XXgI3RvB8iTYRsoM8z31nI4naFP1WzQwKmQyxoiyY
X-Gm-Gg: AZFdTZftFU1z4w1iKrEnUQWCy7ficy2tmXzK7rlurGKXcBWUtmsFeOvAOfXzJeLMO02
	djuoA2mKTcUiWpvQ44U/M2hysMcqOk6HZfefFWb1Ryy3tLBw7LD3fmnxOGee9bsFaJ/V9aet01r
	isPkKrc0hKUtAg1xO2qwUoyzh6jNHiIjG87MOQxGqoDkUT0B+kjIcNifh9nFE7GKPdjnX6W3YEX
	IQXGybmSCd5jiMikiBw1PYxNdpemB547Aivwo12DT3tk51es0sfpVoA4ijVRVh/goSW+prs98fo
	Zfuzi5hDbStZpxEPWEMSMWhb8naIGExJT1bpF7IOVYPAJrR3PVQga9/nTcUKMAcXg6IvVHwaSuy
	w/vsE8oaoTwkJhqW7tNebzdwpO5Wm7lLYLqYa0EGpryIaUJboFJce7gQ44Ln7c292+iqJCxZyXG
	UlDQ/DGGS37WX0wLPqUhxJOEh0Rh7xphzPYeE0dF4XyyPMv4XJe85ZGI1nDCg9po3sYG1o74+Md
	XWharnf228eN/L179GVfBAQ6PvM89BYnaeDbeH5uO24ka1Wn0dVxxzBKa0L+RuglQMzBgtNlQeS
	dF9DZZDzsvt4ew3mJr7SluVzKD17tou5erkHaSNd9YsiYq2s9f76
X-Received: by 2002:a05:7300:d401:b0:362:fa87:2aa6 with SMTP id 5a478bee46e88-38569256f32mr18976622eec.0.1795685914859;
        Thu, 26 Nov 2026 01:38:34 -0800 (PST)
Received: from 192.168.1.36 ([2402:a00:163:2ce9:ad38:eaaf:b00d:c452])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-386aa203267sm32600571eec.0.2026.11.26.01.38.30
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Thu, 26 Nov 2026 01:38:34 -0800 (PST)
From: Ajit Singh <blfizzyy@gmail.com>
To: romain.gantois@bootlin.com
Cc: gregkh@linuxfoundation.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	heikki.krogerus@linux.intel.com,
	linux-usb@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Ajit Singh <blfizzyy@gmail.com>
Subject: [PATCH v2 1/2] dt-bindings: usb: ti,tusb1046: Document no-hpd
Date: Thu, 26 Nov 2026 15:08:18 +0530
Message-ID: <20261126093819.76480-2-blfizzyy@gmail.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20261126093819.76480-1-blfizzyy@gmail.com>
References: <20261126093819.76480-1-blfizzyy@gmail.com>
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

Describe boards where the TUSB1046 HPD_IN pin has no usable HPD
signal. In DisplayPort Alt Mode, the device can be configured over
I2C to treat HPD_IN as asserted.

Signed-off-by: Ajit Singh <blfizzyy@gmail.com>
---
 Documentation/devicetree/bindings/usb/ti,tusb1046.yaml | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/Documentation/devicetree/bindings/usb/ti,tusb1046.yaml b/Documentation/devicetree/bindings/usb/ti,tusb1046.yaml
index e1501ea6b50b..a512df1bd6fe 100644
--- a/Documentation/devicetree/bindings/usb/ti,tusb1046.yaml
+++ b/Documentation/devicetree/bindings/usb/ti,tusb1046.yaml
@@ -20,6 +20,13 @@ properties:
   reg:
     maxItems: 1
 
+  no-hpd:
+    type: boolean
+    description:
+      The HPD_IN pin is not connected to a usable HPD signal. When DisplayPort
+      Alt Mode is active, the device is configured over I2C to treat HPD_IN as
+      asserted.
+
 required:
   - compatible
   - reg
-- 
2.50.1 (Apple Git-155)

