Received: from mail-lj1-f170.google.com (mail-lj1-f170.google.com [209.85.208.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7E5D247DD7F
	for <devicetree@vger.kernel.org>; Fri, 15 May 2026 12:00:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778846408; cv=none; b=Cff/m1Vl2rwFFe3UmEJaZgP+Wax6EcbKGyfQZJNh0cOMR5LmTzUJHsrIodayV7Cb6adx3vhXU2wW4Y+2PkG6Xy1Wz1PFcalUs00Gf3l+QW5sN4vZjxTsr6i0HJ9mITrHC/IxqIKUaJnh5rPcn78ShfEtH/5mTUfVXHRsSB/jlCo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778846408; c=relaxed/simple;
	bh=Koh6DTa2UVt8QYQaZVdwPAk+akH42UUP/wLRjRbb7eI=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=YYgtzTNj+IkzumcAjg/xgcCD4IYgNfMgttxIK7YgfR9Gcc31T67xeehN1n5cwxI2UpnQXh8+fvMGQy0J+9y6tU4+uFiZLr8fIBygN5xfXY5+fs7awuAA4ugT7lB0FQajoSsJtPIxbuAvLXNdv80N4JXbljeUYzgmF4NN5WMy0zI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=sartura.hr; spf=pass smtp.mailfrom=sartura.hr; dkim=pass (2048-bit key) header.d=sartura.hr header.i=@sartura.hr header.b=HwSCaLub; arc=none smtp.client-ip=209.85.208.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=sartura.hr
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sartura.hr
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sartura.hr header.i=@sartura.hr header.b="HwSCaLub"
Received: by mail-lj1-f170.google.com with SMTP id 38308e7fff4ca-39394e1e8f3so82508051fa.1
        for <devicetree@vger.kernel.org>; Fri, 15 May 2026 05:00:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sartura.hr; s=sartura; t=1778846405; x=1779451205; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=3t/HTiJglvdzsJ47aN9ASMLT/MJgYi+zd+v25Q1+h+E=;
        b=HwSCaLubA+8PcGwf85ZuUHh3+0Xs+qk1OjpgdM+dlBKv0up793UnkI5RdCJJZU/Obi
         SoDttV7F9mMT5ewRvlT4GIBkEuGzuAf5EIY615Le5bRQ0HPp1eDbDwzIdh2t7UzOi1lG
         8DqhrGYFYf8z3rtRO6MtSN7Ru+aJC5xgKtuuKBZFH+F6CngLwGI36tzxlkMoChaj10k1
         6umMqIxCyJKajZkfRE8p98hbwAyi1WDtlq28cg9VUBU0fFW5hjIPEJB98nRDQibU0Qxp
         YSy9+swhCIvUWLCjyZZsWSejBtdF4drxf7M/aibgrrvfag7xjR5qS1c6jCfyOTLWi7az
         /QjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778846405; x=1779451205;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3t/HTiJglvdzsJ47aN9ASMLT/MJgYi+zd+v25Q1+h+E=;
        b=GEKWQoUrWiQooYptr0i5DbLl837aN8ZQNrQYDpO4VoTcscACj5/IPWYYCy268IRHwe
         izugrebQgGb68AKX6eB+mkP/dNFvCYRoBDjm1f3jJDFi6J1eTNnp+3q5VCkzXaLR7f9J
         V6MpkgSWMtr8zjX1ztoo+127TzGTDsxuQ3Cw9uiE4p5pR6SQPNGHIacIi6bILvphU+lZ
         fw7SDe/USNlpoAj+TtzfBdoQnwWId7JaztbnZMkCXzsAain0BJWD+MZKr8bKeTlQFtjM
         4wTpm1+545ZIxVtEflpetl9wbYoaMKQb3r3P1WhgL6LkaEirl2420U/k7UoZLQj2oxUZ
         anUQ==
X-Forwarded-Encrypted: i=1; AFNElJ9PIKm21ebbDPHa2NhEzhb7lGMHHLgSivTkIfVa4hL+kq0mikOqVmpAKQYr/+SMDS/5qzbYzKTZ6qZ2@vger.kernel.org
X-Gm-Message-State: AOJu0Yxv/Rz7HsANVGysRNfyR0xON8/hlejacjeTnzLq8OhbCKLcAR78
	KhnyuWbznh46evNoJnjHhyu8A/LJVso5vvBOZLBqByx9Vj3GZZ4yhjdiACBAP1ffQWc=
X-Gm-Gg: Acq92OGLJl0aXWvDWLPWI264wg0csw+ZoIfimmh+2GCn35KqeQOtseIyyMeNQmA1QMb
	V3nbF4CMkG+zMzGW9A9hBMYl3KNY8Hxj1+QTHX8lTrvGB9V/fqRWHUiB5R8snAaNDnoJ9kgUmZ4
	R13aV9B1tx1uF35i2OKt9d8oOr+rlWkDN/ky20tvf3l1VEWb7bMduTwraSqQxqjGhoicFUnhK+D
	k5jMkGvi7xLI735wsxyYIE7fiqvbA/qth+/u9xTMPs7r78Ls3KTfUgbyzaec6iAW5qwGSFi0bJ3
	NiU024zV/dKfeT4+fMdKIbci7jr8GR2JOE4yweB9s3cP7L97psF1Sbz8oqA/D+yt7mkv+M01VAR
	tWW0UVI2rIEaC0uYrPh7917cZduWn16IkXnxhLu0pKuiypKJq7oAYQ5ll1F8Qkt/BgICYgmmZl3
	eT3EEk5FkW/FC/JiYV6WA7xwgsSmlbkaOzMTlbIjkic4cPiEYUvINxpLUwRhngGChn49M157kO7
	/gO7lq4yiTx5Y537xyXlNaM/hoBsjLv
X-Received: by 2002:a05:651c:3150:b0:38a:3ad8:6f32 with SMTP id 38308e7fff4ca-39561f26730mr7785271fa.30.1778846405389;
        Fri, 15 May 2026 05:00:05 -0700 (PDT)
Received: from fedora (d-zg2-146.globalnet.hr. [213.149.37.146])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-3945cb015f9sm14679631fa.32.2026.05.15.05.00.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 15 May 2026 05:00:05 -0700 (PDT)
From: Robert Marko <robert.marko@sartura.hr>
X-Google-Original-From: Robert Marko <robimarko@gmail.com>
To: srini@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	nicolas.ferre@microchip.com,
	claudiu.beznea@tuxon.dev,
	horatiu.vultur@microchip.com,
	daniel.machon@microchip.com,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Cc: luka.perkov@sartura.hr,
	Robert Marko <robert.marko@sartura.hr>,
	Conor Dooley <conor.dooley@microchip.com>
Subject: [PATCH v3 1/3] dt-bindings: nvmem: lan9662-otpc: Add LAN969x series
Date: Fri, 15 May 2026 13:59:07 +0200
Message-ID: <20260515115954.701155-1-robimarko@gmail.com>
X-Mailer: git-send-email 2.54.0
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Robert Marko <robert.marko@sartura.hr>

Unlike LAN966x series which has 8K of OTP space, LAN969x series has 16K of
OTP space, so document the compatible.

Acked-by: Conor Dooley <conor.dooley@microchip.com>
Signed-off-by: Robert Marko <robert.marko@sartura.hr>
---
Changes in v3:
* Pick Acked-by from Conor

 .../devicetree/bindings/nvmem/microchip,lan9662-otpc.yaml        | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/nvmem/microchip,lan9662-otpc.yaml b/Documentation/devicetree/bindings/nvmem/microchip,lan9662-otpc.yaml
index f97c6beb4766..c03e96afe564 100644
--- a/Documentation/devicetree/bindings/nvmem/microchip,lan9662-otpc.yaml
+++ b/Documentation/devicetree/bindings/nvmem/microchip,lan9662-otpc.yaml
@@ -25,6 +25,7 @@ properties:
           - const: microchip,lan9662-otpc
       - enum:
           - microchip,lan9662-otpc
+          - microchip,lan9691-otpc
 
   reg:
     maxItems: 1
-- 
2.54.0

