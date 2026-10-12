Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D1FF73E40F4
	for <devicetree@vger.kernel.org>; Mon, 12 Oct 2026 13:52:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791813134; cv=none; b=I/Uoak2EoChVxdxXraYp742GDoHsLkfWYdp0EJ1mvd713HhH9wzhgjfKQHamj/0eraxAzWgMaN+aYDsAT7+qFKFY61WV8FurYX2TXyZd1c7n8acNLtTw7DRhoKiB2ynWkSswnot8F6fF4rJJU9a1d9oFQijHspLFiLV/rM1v608=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791813134; c=relaxed/simple;
	bh=XW1djT0Vdpsbvd9ni2r7C9RCQFJQ6pGumgwaGDmtYY0=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=K7fB/SLjCoilcdYqQyZs8W6iyDeJ4IpzfIiKtw6yRQEdrsgzRSKqdnUai+K2gBV2jDsmuphiSO7uJ8GR3NglCeGZAnb+EOxGluWZsGaa5K3p5j1S6hbmai+RxGXpd2iKEjE+8zksXFBnx7nStdOFZMQPexJ1oq1PCnpWZCMu8W8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=imd-tec.com; spf=pass smtp.mailfrom=imd-tec.com; dkim=pass (2048-bit key) header.d=imd-tec.com header.i=@imd-tec.com header.b=SQ5ruEkY; arc=none smtp.client-ip=209.85.221.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=imd-tec.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=imd-tec.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=imd-tec.com header.i=@imd-tec.com header.b="SQ5ruEkY"
Received: by mail-wr1-f48.google.com with SMTP id ffacd0b85a97d-48c4649b35bso1783373f8f.3
        for <devicetree@vger.kernel.org>; Mon, 12 Oct 2026 06:52:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=imd-tec.com; s=google; t=1791813131; x=1792417931; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=09LAm3CRdRMlY+AjcF4iVhhVeJyo0GxMWk2sX+iS7gg=;
        b=SQ5ruEkY6qbh9w1Rl7hr7BEzBStb15CQw0+rvVEfHJodvgLk99/5YPeJxBmR2JO/yv
         0MVoM1kTeWQiRXmfEdK4Cqu/394ZU70HaPlw0g3cyXHQaEbrTRrbNn0LULPt84GTS0OA
         Vf8CMY7miG0i9rB0/FrzD4SKWUQZxJTdbOF+lS//8P8zdKnhq8GCbSZokOUt+AV689ed
         Sbxpw/tUrESR8K/ADXAQlOJOtUbj1CFgfO55EbZ/Nl2KKrsY8orNDqWOSJRuMl3GWfbo
         qDzTkpsP5VhGmfSJ8EBjOWE8NcDLukD7KBrWIblHKzxSJKrz2MNoDNNI6W02S9GkdaRk
         lfDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791813131; x=1792417931;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=09LAm3CRdRMlY+AjcF4iVhhVeJyo0GxMWk2sX+iS7gg=;
        b=kZGLLzefxCN78sFEK01j5KMTBMYLB0mRRWH+uL5YDtimw8q9GNnflcWr4dJ/tt0eBz
         mv9R38f83XWMRToRKjmUGfrgmVaXSqYbxPPys6MOVxSMqYAeSSlel0jxypRZ09jC0BdV
         T+iWOJ3fC2trm6F1kV0bWTnC7TBTv/wDR5Phmvy16dkh5k2Piu91q+QWGdHoCQecRBHO
         30GSX+h9BO4LpZh9QU2/3NT6Th155WCZz7giWTXnL76kGCBfZEXVB7XzyLz+uPRFaP0N
         dAxsY4W/cM2HZUhy5fjTo/v+4JeuG8sGLYFq1h+eyj2QYag+dY7ysAHMa886yp+QLPwF
         yP1Q==
X-Forwarded-Encrypted: i=1; AKwUvBzfdXnUU73mxIhxHOWJJtetRIy0Phm9yDGmq+HgOEl2ymy0OUVqG3uC9kjx8sA5AerPZ0XUJWjQBdhw@vger.kernel.org
X-Gm-Message-State: AFq9FYI/q0OpQRX26fDN7h0UbCAt1NED3mMUrx52Tp+k8qm05owtZqaz
	0/woXNVefh6AvpG+33860YeynIpYO7W3xGBYq/VPL4mZ5GWX3LNjQjDQ0VE6FUGO+IY=
X-Gm-Gg: AYBFou0gYTAbgENroNMo7LZS7qTCDHl12yO9cxZ02ia534y9ty42YdvDpp3bgV5hb5d
	DSmf1lgMWZR0jN5NA7hAmOxBXSGtyDXfhgnC/GdrNvlgfnYBTx0l+nSbh4Z48Sa3Mx364PJnD6B
	5qINL6q72VZ7DK96FrRLgWRMvwCXpkBqUTDa/dIf0LsMLBMO+ecGnqUo7d1S70Hp3JA8xJ3Zha9
	S6skeS8O/6Jh/Ob/2wc/59ZD+NgphsEh10I+uukj6g4kFmgzkwdjaIUBNwTiDCzp4DlkdE72oam
	jbk/tn1yBJ6pImeu2G/lXb1x/yD8RxF6BcvEig/mGjWmeOYN7CLbrQu++Tp5EO6kFadCLYrSSG+
	58YtL8xQLGH/5sDHFUwVvC1kz+CPhsTEve59aKGqAPWFbQAAS0CJPmv35pYJ/9kjBTHs0p6vhWy
	VZY1Az7YTOozeRHX5jIRRsX3GXA6Y647B9YuYsDShXPlSRxrLukio51C1/Q/Fe8bzp0hQZDhGGs
	sQLsf/R6Mq2Kz424wr0Ml9lx4cK/wPskrPdt9u453HyS/T1o9QHyt1DklKETZFNmYUNeExFi/Ax
	WwYbRP90/EcziMyJAjQ9J7xzxcsp+lO/
X-Received: by 2002:a05:6000:4313:b0:48c:5358:f999 with SMTP id ffacd0b85a97d-48dbaaf07d4mr17559870f8f.37.1791813129855;
        Mon, 12 Oct 2026 06:52:09 -0700 (PDT)
Received: from [127.0.1.1] ([82.71.135.85])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48db94e3519sm21355523f8f.16.2026.10.12.06.52.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 Oct 2026 06:52:09 -0700 (PDT)
From: William Bright <william.bright@imd-tec.com>
Subject: [PATCH v2 0/3] media: qcom: camss: Add the SM8550 CSI TPGs
Date: Mon, 12 Oct 2026 14:51:59 +0100
Message-Id: <20261012-sm8550-camss-tpg-v2-0-06dbbe36ecd2@imd-tec.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAP/lzGoC/32NQQ6CMBBFr0Jm7ZhOlUZccQ/DAtoCY1IgnUo0h
 LsLuHf5kvffX0B8ZC9wzxaIfmbhcdhAnzKwfT10HtltDFppQ4o0SrjluUJbBxFMU4emcaoo6Hr
 RtoBtNkXf8vtIPqofy6t5epv2zm70LGmMn+Nzpt37k58JFRqt6sa0lJNzJQeHyduzHQNU67p+A
 dWGy7vEAAAA
X-Change-ID: 20261012-sm8550-camss-tpg-6bd0991432c9
To: Bryan O'Donoghue <bryan.odonoghue@linaro.org>, 
 Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>, 
 Loic Poulain <loic.poulain@oss.qualcomm.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Depeng Shao <quic_depengs@quicinc.com>, 
 Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 William Bright <william.bright@imd-tec.com>
X-Mailer: b4 0.15.2

SM8550 has three CSI test pattern generators next to the CSIPHYs. They
report hardware version 2.1.0, the same as the x1e80100 TPGs, so the
existing gen1 TPG ops drive them unchanged.

Describe their register regions in the binding and in sm8550.dtsi and
add them to the SM8550 camss resources.

Signed-off-by: William Bright <william.bright@imd-tec.com>
---
Changes in v2:
- Added commit message to patch 3
- Link to v1: https://patch.msgid.link/20261012-sm8550-camss-tpg-v1-0-620ab6f151dd@imd-tec.com

---
William Bright (3):
      dt-bindings: media: qcom,sm8550-camss: Add the CSI TPG regions
      media: qcom: camss: Add the SM8550 CSI TPGs
      arm64: dts: qcom: sm8550: Add the CSI TPG regions to camss

 .../bindings/media/qcom,sm8550-camss.yaml          |  7 ++-
 arch/arm64/boot/dts/qcom/sm8550.dtsi               | 10 ++++-
 drivers/media/platform/qcom/camss/camss.c          | 50 ++++++++++++++++++++++
 3 files changed, 64 insertions(+), 3 deletions(-)
---
base-commit: ba86f67908354f41f269ca1d64b22e4624766dcf
change-id: 20261012-sm8550-camss-tpg-6bd0991432c9

Best regards,
--  
William Bright <william.bright@imd-tec.com>

