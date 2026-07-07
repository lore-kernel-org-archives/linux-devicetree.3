Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 857DE33CE86
	for <devicetree@vger.kernel.org>; Tue,  7 Jul 2026 14:51:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783435909; cv=none; b=t+PZr4LfeBLO/exngPTzehuBHCSyu9s5TYM1vbwUKWjEWPibG48my0OaS0MnaU/fj7Hq4c13EXGV3Cc9ws4QeCGMRpQ6mTaN2EPS661UvEbEU4X0cksobLXWeeQhjY8Yl6WZkZJocDBJwetKtjShc8T+e/NjN1TldpXeQkENI90=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783435909; c=relaxed/simple;
	bh=yO/cwkvvW57lFL4Ma8QI8Y/z1gUwyT0SmaSmYJtTWwk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=DtGK7PflX7r9BbIqOOaPdIBOFx9i0Mx/Dwn+AI6DqHwlFe1aK3NCkAb5Z+XgDpQukw1Eom5knRpPQgRojGHRPWlRFQSt9tZa2ozUvvFgEME0hfrrlC6DLmeIoEZ7zeIhKnTH+5cljVklzrl+oxTVz/9i6iVoFfPbMqf2pHPzXjI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=hU8g2kq8; arc=none smtp.client-ip=209.85.128.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="hU8g2kq8"
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-493e4cccd8dso790095e9.2
        for <devicetree@vger.kernel.org>; Tue, 07 Jul 2026 07:51:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783435901; x=1784040701; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=w/s86zTxnPOiSyACjOQYgToZnZqdntjQb7k0uoRuZCQ=;
        b=hU8g2kq8/uiJ4yHi9omiHuNpfZndkG1z5RDPkYV++qt9UPrkSC8e+tyvUuTAbUlsvR
         rW7NLNnGDy0did264VfmY63K46kXGqTA+VpAr7fcIQVz1N3QD9ZgGOSfe0/b5QNOPEfC
         8nxVcfy9Y9xyNxBNJRQCI4BkA65GDFrU7FtJ1SW4/FzU5paLIadQejq+OZyZsR1tD8P7
         uaM06uGZyw6PMdPH963gSYsrIGGoq5AHuotqDFenOE42SKOLCGTlfr3ulCjAUCHXWFbH
         N0k88AG3l/AHbDcCzSaHg1GfDCbkr+Wj2l63CzWHKiWVNcZgBn2yZbb8k1FwYOoGdGim
         Nh9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783435901; x=1784040701;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=w/s86zTxnPOiSyACjOQYgToZnZqdntjQb7k0uoRuZCQ=;
        b=Ed34nmhj4btO9FZhBR3CQLHd6VfHq3FaMTv4NbW2au9GOBUS8JMAIwaZYPAikr7Pl4
         8k9cM7KCbqYyvpjreQwMOmo4baoeLH9p4+4B1OQUNFSc56gIj3COfN1+tREkstmFR6xz
         b2nr7OWSSpHVWJAda5uYtS1kCfyHBtROTlUJYFT8MA9+sVTAYWc5t0EduSbXd5oBFadj
         KaQv8pUdqGipZjYy5ajv7gjLe5Rsp6KfOvs2tcgWVLIesSU+WLATNAMnSnsdM14mpw9o
         7AFmypYqYMmwltaXKWp8tY8D0Lmx8dtJG3S9+weF1hz42ZKmw7pZ3geVnULAVn2ce36D
         czHg==
X-Forwarded-Encrypted: i=1; AHgh+RpjqRKUzohSaMWJ1on7G8qtQBg7H4+IUKsVxh6ehkejAH48jm4pomGZN3EBWeUzuNDgouHat+LY/coL@vger.kernel.org
X-Gm-Message-State: AOJu0YxvWWrIaQVrYuas7oZi3xzOCZFAuS2eRN90W88cRcq31gBkHScO
	S8/2bR6TnHZ1aIAOmdig9DJSavkdnB6vxpc4dYOPjlnw77JscsInmuwX
X-Gm-Gg: AfdE7cmRkctZ0NumA7KY7S4ecnuue5ar3JjGH8Vzx8K+kWwudhjqTdy3QUge1FiLnle
	iXx8pTiU16V+ArugjJmINcZWHHUSIqY4WKopYXWY66Flzw9vBYDWKPypu+XCJ77Rp3X24gN7ZA7
	R3oczoiV84wNI2hZo+P/9EzOgHrKh7G2vpYBI0ihe/aOfA0O518JqhLqSMfUyVPFm/ZQzq0vcjE
	Z5pLDiihmgYZfFn8pk4KmR63Dvu0lcBm4cvtNRAatJN1blB7fmjZTrfiLJu1JaPD4PwubtbkkcP
	jT/XmRKStZAks6ALm1xc49UndXCN9c0LCrCfGxEnsKF8uwEVQjBnZUq3T0RrCR5a23XvclykI2b
	NNxQojcDEk1DnDuw7PFfFdXtbPBWesrh/JmB0X5gf4x0z+7CqY1cqayUF0GeI2mJCTLr6/8qg9p
	ZT+1e+ODqWc3pGc0fAyM6FxkTymZNKS7mRcUBdBXCnTGDwJepW
X-Received: by 2002:a7b:c00a:0:b0:493:bfbf:1da4 with SMTP id 5b1f17b1804b1-493df065f71mr44810015e9.22.1783435899133;
        Tue, 07 Jul 2026 07:51:39 -0700 (PDT)
Received: from localhost.localdomain ([2a00:23c4:a702:d301:a4ac:4e7f:194a:852e])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-493e0ec6e64sm105192695e9.0.2026.07.07.07.51.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Jul 2026 07:51:38 -0700 (PDT)
From: Biju <biju.das.au@gmail.com>
X-Google-Original-From: Biju <biju.das.jz@bp.renesas.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>
Cc: Biju Das <biju.das.jz@bp.renesas.com>,
	Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
	linux-usb@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	Biju Das <biju.das.au@gmail.com>
Subject: [PATCH 1/3] dt-bindings: usb: renesas,usbhs: Document RZ/G3L SoC
Date: Tue,  7 Jul 2026 15:51:30 +0100
Message-ID: <20260707145135.247565-2-biju.das.jz@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260707145135.247565-1-biju.das.jz@bp.renesas.com>
References: <20260707145135.247565-1-biju.das.jz@bp.renesas.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Biju Das <biju.das.jz@bp.renesas.com>

The USBHS IP block on RZ/G3L SoC is identitcal to the one found on the
RZ/G3S device. Document the RZ/G3L USBHS IP block.

Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
---
 Documentation/devicetree/bindings/usb/renesas,usbhs.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/usb/renesas,usbhs.yaml b/Documentation/devicetree/bindings/usb/renesas,usbhs.yaml
index dc74e70f1b92..13715b7c94c8 100644
--- a/Documentation/devicetree/bindings/usb/renesas,usbhs.yaml
+++ b/Documentation/devicetree/bindings/usb/renesas,usbhs.yaml
@@ -27,6 +27,7 @@ properties:
               - renesas,usbhs-r9a07g044 # RZ/G2{L,LC}
               - renesas,usbhs-r9a07g054 # RZ/V2L
               - renesas,usbhs-r9a08g045 # RZ/G3S
+              - renesas,usbhs-r9a08g046 # RZ/G3L
               - renesas,usbhs-r9a09g047 # RZ/G3E
               - renesas,usbhs-r9a09g056 # RZ/V2N
               - renesas,usbhs-r9a09g057 # RZ/V2H(P)
-- 
2.43.0

