Received: from mail-ed1-f48.google.com (mail-ed1-f48.google.com [209.85.208.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 558BA37A4BC
	for <devicetree@vger.kernel.org>; Fri, 10 Apr 2026 07:40:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775806823; cv=none; b=tYq4l4KAF/USI1TNWg79qWjndRCLHT0f+DZkxuZKS/dYZxMktG5EM7ew0K57VLyvlwGaV1d9AY4W6W1pN+8uC0m9u3uL6lYC0uXmRcD5ixUQAWT9GXFK39OS3+UMdq4x7XmpdfMRkB6BFPTdX1ZN8EF9aKdH0tpQygH02rnuk2M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775806823; c=relaxed/simple;
	bh=8UVGLM3tCk8JI921O45NinRZAOpPG+OzGI1sC+NEJG0=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=giarVf8nyHEmt0MI5SUFTb1C+CTTqmcRGRw7y3smQD8mpG51cgjcD4mceutVA43HyWwzwRNJdet5aktjttYgYZHLYIz96d0k2lvacD35STOvybiYYorspeFN20DkQyiVHQ/qvAmpxdhUZ9VsbbU9m+/V/UEpmaxB41f9/VgFikk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fairphone.com; spf=pass smtp.mailfrom=fairphone.com; dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b=DDqneyPw; arc=none smtp.client-ip=209.85.208.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fairphone.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fairphone.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b="DDqneyPw"
Received: by mail-ed1-f48.google.com with SMTP id 4fb4d7f45d1cf-66c17372965so178089a12.1
        for <devicetree@vger.kernel.org>; Fri, 10 Apr 2026 00:40:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair; t=1775806821; x=1776411621; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=CdQm+7qKkQGpWz/x294jzIY9WDuqqRzuW6cUPd5hDXQ=;
        b=DDqneyPw+A19EEwKb72/XWhva+QCysn8VkRNUpuyMzvHReEm8wronogJpULCV29X1a
         dQub90M4DlVhSSTYCWDXFl8sGKt7SlSrmhyZ4pOJUsQuVXU/Ez9J0ZzGXYQbTP+pKyqw
         NDyjoasw/qa/aTE3I1xWz9edsqFsxmbk18+/LGuQFZag8L2lF57F0DnTFl0nSrk/GGib
         M68cO33vggQPkkNeOU7D1hBr9VvcGElUvVZnJemYDgC+gIEAHtmifMjkwbp/Xai3TleD
         wkqPC6FjkyN5I1FF4fWvFa4VWrDO1qyHhxC7tTkG9Iia2DEtayXyShOS8IPqU2GhGJsL
         +vPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775806821; x=1776411621;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=CdQm+7qKkQGpWz/x294jzIY9WDuqqRzuW6cUPd5hDXQ=;
        b=RwzaCAX14BiM0he0IF7dVb/PUESLewl6ZuWpcUIPzn1S9+xvoNXDIOSuA9r7mytBYL
         WGmwSV5L9UCN6JMvL1xGtIIWcRnZ7e+8Cu5a1qik+k2iVD+Ol8aXogxnZ8bba7E7ulVY
         DZr0BjmLCBhD380fV48b6stQQN8cfv2A4weECTpRfQGMWB792m1rUi7OuKZt0edz5mTS
         fzRTAXksBlt0s/JjM2jMCwgcOZg44SGb4X11cXBr5AlolWOZ5hqVuJMi6TsyTATal7pI
         idnu+jeuI78t4+vVbQ7V/r7FN0iJIY5DdR6tO/H/X5Pksa7PVuALTyaiXhPt09+A3ojR
         wdhg==
X-Forwarded-Encrypted: i=1; AJvYcCV8AfnZ0mC0b6+UYZobL+L3gVa6y+ZWITSigB9hgp4SvxYIxrDSANCsHIvREqF/LbCqUnCi1sJcS2as@vger.kernel.org
X-Gm-Message-State: AOJu0YxPgxPKm5mpF241/dufc2kXQkuUBBY9TcKooeW0loq/Hxq9WfHt
	yJwnPnnqg6FyE7gCoPvv3yLd8FgMxZvyXT2MQTF5NmtEqMMfF8LxA20LRmjRm3sINRsrgORFWVD
	TzUuuf2A=
X-Gm-Gg: AeBDietKIVZa+f7gnsH0QEgKyiPtpQOHDGwIFFfkNel0f4BGZRk/Ofgdldq2/VFbc9F
	zUO9bTArjHnRtQ3i+mRUrGItsi7OIh1mQjNkRDeENqddbzxWH0QMJ1w0iAvYZFMHLBuA8LHt8i4
	Ms36bQlPlihRMVME1L+qSkO/FP5DhtYoVhRColsrmWTwE+lWFQtO8RQSCVsSxxWBjMUANBihEk1
	axOb+djQ0WrQoEWY5feriiCk9yDzV2+c6ElRrReHnjln18VkF3cCVyCQwYdEGI507xTS68GO+p8
	N2PC/RXd86EiYabR0rBBmRN+qw9FFwUjgVmGVMjkGL8RoN557NnvMfdAHimGoniNxZ1ioQyivAo
	lig2EX87DV0NZxZ+hWrOsdQ83coakYaIss8qiQGEpdz+pKw8+qqG3XedKcTulDj64cMv+UyD+sb
	9SAAbZGTGSEQmatF5KLpAacnDwe6z+2bMZ74Aam5im7tRnwkniuwwD3QEktjfIOgNmH2OdwtZzQ
	uZFuw==
X-Received: by 2002:a05:6402:4548:b0:66e:44e:3103 with SMTP id 4fb4d7f45d1cf-6707931e447mr686513a12.9.1775806820681;
        Fri, 10 Apr 2026 00:40:20 -0700 (PDT)
Received: from [172.16.240.100] (144-178-202-138.static.ef-service.nl. [144.178.202.138])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-67070815a1dsm400310a12.22.2026.04.10.00.40.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 10 Apr 2026 00:40:20 -0700 (PDT)
From: Luca Weiss <luca.weiss@fairphone.com>
Subject: [PATCH net-next v2 0/2] IPA v5.2 support
Date: Fri, 10 Apr 2026 09:40:06 +0200
Message-Id: <20260410-ipa-v5-2-v2-0-778422a05060@fairphone.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/y2Nyw6DIBREf8XcdUkQUNRfaVzwuLQ0ES2gMTH+e
 2nrcjJnzhyQMHpMMFQHRNx88nMogd0qME8VHki8LRkYZS0VNSV+UWRrCCPWdZIyrTvFNRR8iej
 8/lPdIWAmAfcM479Jq36hyV/TxUZ8r+UtXwOtEhIzT5PPQyWY67UwLbq6R1lbZqTttbPcNJRLK
 xwKLpSVMJ7nBxOCLQTCAAAA
X-Change-ID: 20260410-ipa-v5-2-df8702bb8a3b
To: Andrew Lunn <andrew+netdev@lunn.ch>, 
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Alex Elder <elder@kernel.org>
Cc: ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org, 
 linux-arm-msm@vger.kernel.org, netdev@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>, 
 Luca Weiss <luca.weiss@fairphone.com>, Simon Horman <horms@kernel.org>
X-Mailer: b4 0.15.1
X-Developer-Signature: v=1; a=ed25519-sha256; t=1775806819; l=1265;
 i=luca.weiss@fairphone.com; s=20250611; h=from:subject:message-id;
 bh=8UVGLM3tCk8JI921O45NinRZAOpPG+OzGI1sC+NEJG0=;
 b=e568NAGenV1WUAKn4vo+K9IN+7el7pXrpPW+HhtT5w74qciWXF6gyyTjTzbDTHSh8Coul31XR
 KQx+9WomOv1DP0aQNzeQJd4US2vLaTjWPNIWMMudNGMMW4Hb7pwwlDg
X-Developer-Key: i=luca.weiss@fairphone.com; a=ed25519;
 pk=O1aw+AAust5lEmgrNJ1Bs7PTY0fEsJm+mdkjExA69q8=

Add support for IPA v5.2 which can be found in the Milos SoC.

Note: This series has been split up into two, one for net(-next), one
for the qcom dts bits.

Changes in v2:
- Split the series, drop applied IPA fixes, mark as net-next
- Pick up tags
- Link to v1: https://patch.msgid.link/20260403-milos-ipa-v1-0-01e9e4e03d3e@fairphone.com

---
Luca Weiss (2):
      dt-bindings: net: qcom,ipa: add Milos compatible
      net: ipa: add IPA v5.2 configuration data

 .../devicetree/bindings/net/qcom,ipa.yaml          |   1 +
 drivers/net/ipa/Makefile                           |   2 +-
 drivers/net/ipa/data/ipa_data-v5.2.c               | 452 +++++++++++++++++++++
 drivers/net/ipa/gsi_reg.c                          |   1 +
 drivers/net/ipa/ipa_data.h                         |   1 +
 drivers/net/ipa/ipa_main.c                         |   4 +
 drivers/net/ipa/ipa_reg.c                          |   1 +
 drivers/net/ipa/ipa_sysfs.c                        |   2 +
 drivers/net/ipa/ipa_version.h                      |   2 +
 9 files changed, 465 insertions(+), 1 deletion(-)
---
base-commit: 42f9b4c6ef19e71d2c7d9bfd3c5037d4fe434ad7
change-id: 20260410-ipa-v5-2-df8702bb8a3b

Best regards,
--  
Luca Weiss <luca.weiss@fairphone.com>

