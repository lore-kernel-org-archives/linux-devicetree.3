Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.49
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795690655;
	b=SGp5uPgmjg8h0EYIwKDpJSh4yeTBz6+h8abCu+nVm3B/CZQcL22v851WAstduGrWuFif
	 60TOYPXcCOYHlZ6JOPXdVPOwko+I4paDJNwcmeDjQMaxZ0UjsrjCmzDSAM+7vS73F6mRw
	 09wn0MRTd7g5kR/OKRFfMYrewKQrd458oeemKN73Udm0i6z9PsTZjx2YyMzrs+6lddb+m
	 VJaLwMDFhCX4c+NyPMCvqDS5RUfRNxjEgnGMwYbQ1w2OrJfGVUUyEtE3t9GQxcA+FTFEk
	 1Ymh0uR6kZ5evVdJ6XPAYYOXO0jFfQGTBub4hGHs+o98TloZoE18dzZpXZJgwS2RIqw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795690655;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=fvn3lBMX5MydD9DJQOAImoBkowZi5lJ9awFgwMmdHps=;
	b=XiuKrTvUYWnIgsx4GmfGmwnnw7QDycIrlozCee0Bdrg23pMq7KplDaOiNYeREhoNFUsS
	 NcU+iWnZGVukUwJL43t54EhFB76yRRIEw/1ivBNHt3X9Mj/UQaz/XRLGy00u8d6OhHM7t
	 QpQV7gWVtJ6HbXriAFkpV48mpvRCP0DEAJYVr9BMEmqV3xaGRpBwrGzZJrbBSIa3eDHK4
	 DnnN50O86LuqCP3hq7vU0AOL2nU4j4MJY8qQgoykjlQ3LeRiZBL+y0J4xC2QleJNCe4bc
	 GPcP6Id9ko1xdmXsTpuyTab/nxoKwnScFHAM58u8cap4cMypeEeJkxFOFTduG2uyDjg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ILWTfFbN;
	arc=none smtp.remote-ip=209.85.221.49
Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7B6DF606A31C
	for <devicetree@vger.kernel.org>; Thu, 26 Nov 2026 10:57:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7B6DF606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ILWTfFbN
Received: by mail-wr1-f49.google.com with SMTP id ffacd0b85a97d-4a358881793so3592907f8f.0
        for <devicetree@vger.kernel.org>; Thu, 26 Nov 2026 02:57:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795690654; x=1796295454; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=fvn3lBMX5MydD9DJQOAImoBkowZi5lJ9awFgwMmdHps=;
        b=ILWTfFbNDkkw8+O1yE1aopgD+0hagvJeY+OjE/0gfhxb6kFaB65jSDFoqIhxxCQB4E
         2Wbz3SQSIo8ULJmYiAwyM5M5j79qsgYpJMnmGTTLsZtSuYqJgBFBOJz9LKVjtxgqioTv
         KtWkCchbaXA5abyZbWzbm9ZJyywMGjMlo4e04g65DcO7T3Hn3pkT7JTC3VLq3crW4A/G
         otrk7nakCXceynOyhAGmCyDJ2Hs3h12K4VjRSmzF/1GOqSZKHU4lH1X7CYZ0RXiSQdBv
         LMQz8YsR8auxX0I0p7O1uLcxqJMxVmvzHMvwaDs46P9jkxzY4UCgzcJJJAkqQQ2llJbP
         70/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795690654; x=1796295454;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=fvn3lBMX5MydD9DJQOAImoBkowZi5lJ9awFgwMmdHps=;
        b=Ne8/+EL+BBncb6GpH8Qp7U4KCh+J+aqB+Af0TwpAhytuQe2USc46ffeIWfCoxjk/4Z
         VQnl0wiGZWZLbDVCGa2Kjiv7zZD6VaEKVIcR5LgoCLyBBHrVr+7YWxQ3bRAuVhq9NJZ3
         BfYOpJH9F7KViz4+sMsFpsJJTibI04L8MrHvdtxKl+Jr6U/+BQAeZInGl8QqYEwcH+XW
         k35D++nP5oYGydv+h3GRN06pc5cDPHl1+IYxnrpAkKsXMUdBey1+BuJTgyDkL5zXnatI
         K6EEMdJ4HEGgqg2jInVCQC7h7UUXNX7dwcTU+72j2bCHyPCN/CWMEaSf3GJUlOwGWJgt
         BWeQ==
X-Forwarded-Encrypted: i=1; AL+hErEt2yErIa0I9PxqQBfA+X+b5cn39R4EiBAYgrmzDdEOJtbA14HU5OVs5Dc/8JOhOx06A5m97IBYrYv4@vger.kernel.org
X-Gm-Message-State: APuU4Z/ZWxZ2MzllW8v+wRgc6UDktwGYW6Ya8gTRCGHL5c1lsCrm3aHF
	Y13OTL/sg96ArTkORa2XIqiT6xcTai5hHBFafKvYYUOorfwQin6G3nSK0QaGHVxV/Jg=
X-Gm-Gg: AZFdTZf16vG9MtoyzzRpNB71XMlSZvUN1bmF1zWnvpKD3QZfl4Efvtp5d7FjcY5aRNK
	TOKkiqYqfC+9IUYYe1Qn1joPDKsZvncDd0Aw4ESMuips/BEN+Qg598xrB5hSLrH8YcZTpo9uM65
	KgTyKV346InRYA1ZY+ScVBg7L039xJk78KqNdGbWFshg239Pg8eiM/JbAyj5MGEtCTO5Genjzvc
	CmqNKhUSeq76vvGgng4fdBtA1bMAq4tQwIBf9BOrmXUTAplDk885PkIUAIjCf0sU47KD/ZNzl51
	zfMsYPrPBt0kmcek7xHmmJJ+4H95cefD5s73L8qar8dKswmTAP3xlf5WSjUDx/W3DQYZcFHTY09
	9cIP72Ef77oWfJr7nOXhnPFHNB+QO+AB8VBHvrreZ8JCeNLR05DNU99UTNTQbPmb80biMeZ7vie
	sAhvZIkrOJPl2Rrh2+YskysQ+Fc5nBbmTkJCy/pk0ydTekHKK+hS476V04ulnjYD+mIHXnNW4Vg
	Cse+R5PbyMkSe+ChsomoJvYuJXslKwHCfqJKPP4qCoLv9Ptt6DzX5QXAMxhZWhtQBDD1Rh4lXxV
	6w1RP7Aw8Peg3hw/wH7mtnLcLZGJnvfVmxXXpA8abJFokdQvWj0MDio/PwiYymFxdsu9mXDOMjW
	oKg+UbCdMgjhLD79rgGgNQWw1E+u+Ku0WV7yTBcrpBsXJy5c0GggiFaqIcEQ+VeyK4Jarv7HMPm
	MTzcUqAj2ifNYbcIDEBw==
X-Received: by 2002:a05:6000:288e:b0:49e:4ba2:a775 with SMTP id ffacd0b85a97d-4abb86e50eamr40097978f8f.56.1795690653563;
        Thu, 26 Nov 2026 02:57:33 -0800 (PST)
Received: from threadripper-fedora-workstation (d-zg1-148.globalnet.hr. [213.149.36.162])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4ab6b9add26sm40336850f8f.44.2026.11.26.02.57.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Nov 2026 02:57:33 -0800 (PST)
From: Robert Marko <robimarko@gmail.com>
To: andersson@kernel.org,
	konradybcio@kernel.org,
	abelvesa@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	agross@kernel.org,
	linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org
Cc: Robert Marko <robimarko@gmail.com>
Subject: [PATCH 1/3] dt-bindings: soc: qcom: smp2p: document WCSS restart kick
Date: Thu, 26 Nov 2026 11:56:50 +0100
Message-ID: <20261126105722.188103-1-robimarko@gmail.com>
X-Mailer: git-send-email 2.56.1
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

On IPQ8074 and IPQ6018, WCSS firmware waits for a new outbound
doorbell after its inbound SMP2P entry returns to zero during a
remoteproc restart. Without it, WCSS does not raise the ready
indication on the next boot.

Document qcom,wcss-restart-kick for SMP2P links that require this
additional doorbell.

Signed-off-by: Robert Marko <robimarko@gmail.com>
---
 .../devicetree/bindings/soc/qcom/qcom,smp2p.yaml          | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/Documentation/devicetree/bindings/soc/qcom/qcom,smp2p.yaml b/Documentation/devicetree/bindings/soc/qcom/qcom,smp2p.yaml
index 7862d68c9678..5c90d9db8f73 100644
--- a/Documentation/devicetree/bindings/soc/qcom/qcom,smp2p.yaml
+++ b/Documentation/devicetree/bindings/soc/qcom/qcom,smp2p.yaml
@@ -59,6 +59,14 @@ properties:
     description:
       Two identifiers of the inbound and outbound smem items used for this edge.
 
+  qcom,wcss-restart-kick:
+    type: boolean
+    description:
+      IPQ8074 and IPQ6018 WCSS firmware need another outgoing doorbell when
+      the inbound entry returns to zero during a remote processor restart.
+      Without this kick, WCSS does not raise the ready indication for the
+      next boot.
+
 patternProperties:
   "^master-kernel|slave-kernel|ipa-ap-to-modem|ipa-modem-to-ap|sleepstate|wlan-ap-to-wpss|wlan-wpss-to-ap$":
     type: object
-- 
2.56.1

