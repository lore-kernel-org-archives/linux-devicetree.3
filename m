Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.44
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792749850;
	b=U42XWhnB7r8Cs2pJzlK4n1IbE4JDtVjdnkB5UsRn+yFwTHqNU5jAa3NEX6jWnDRjLbt6
	 fnYZYpTKx8zMspm9BpSaKXyYzfbbsQrwVMnECeDJcFtwH+lnziDlc840X5G5Suq+XVo1C
	 yNndco6cNmafPxFXq1itLTFnwrL+6ftVX+I7g0kOXfx9Vzp9jmix98ZjQL1STLMvwAeMy
	 PJ/+ZddW5B3qS15unSwP//1Pgm655k/lgPHRZiNd2KLIz3fFijuyfyW/bIjsHRB4ybRm7
	 Tcp5MSPFVFx+lmfw1ZHfg9l+cumTvlFVmZOWDZiXOuesY5F1D8OaqHr2giYh5td2fNw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792749850;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=cTsNKU2kYOf2rxmtGG/9JRKLpirEPzdL4P8zLLZqK4o=;
	b=CHhJb+CqmDEgxAUemzqTxGqKvkAWnYB/hAecXpoSKIygVh6+qBlm84G3/c4En0ewtFVn
	 bisrZjkpgu1XfbSkxueibqQ1UIAOwtGryN+e42dwt//pZ0MACOMeERsd39018+bQZwcJb
	 q0o/saQjg9eRzZzwxHyr6vuQrpBLrRJtd7VPCNAZMPWFQu84AvOWEtpoISMdk5VoEYSNI
	 iqSdNRRI1BKFZsMKhXsIigiQcfFSMjMHUwwfN+X79XU+eOm1yV9rFD9gXSLaHaMDSFv6L
	 jGBNIZZ3dgfHr27wNe2v6trZE4rP+Gv3buE+nsA1CcHIcsWHQrIwKuvgWSFMD2llCIQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=fail header.from=mgcrea.io;
	spf=pass smtp.mailfrom=mg-crea.com;
	dkim=pass header.d=mg-crea-com.20251104.gappssmtp.com header.i=@mg-crea-com.20251104.gappssmtp.com header.a=rsa-sha256 header.s=20251104 header.b=S2CaE4kk;
	arc=none smtp.remote-ip=209.85.128.44
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 51708606A33B
	for <devicetree@vger.kernel.org>; Fri, 23 Oct 2026 10:04:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 51708606A33B
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=mgcrea.io
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mg-crea.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=mg-crea-com.20251104.gappssmtp.com header.i=@mg-crea-com.20251104.gappssmtp.com header.a=rsa-sha256 header.s=20251104 header.b=S2CaE4kk
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-4a1698ea378so4780725e9.2
        for <devicetree@vger.kernel.org>; Fri, 23 Oct 2026 03:04:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=mg-crea-com.20251104.gappssmtp.com; s=20251104; t=1792749849; x=1793354649; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=cTsNKU2kYOf2rxmtGG/9JRKLpirEPzdL4P8zLLZqK4o=;
        b=S2CaE4kk3jH9Uyh64w6TN6cAvNVq8cP3cD86Qgw3Wvp7NLqwcjeXlsrNpdEthrK9LP
         cwMUkpnwqOJ7XtuW5UskVPPAqZC7ul2fhA7u1hfxzqROmCoDYOCe6T7L8tkQ9A3+Hp19
         ILFlwXibu5I81PDs3tQUCGJuudBc3w7z8lXYHUOpeIpMazDDPk7hwkIDrAHSrDXB7Cj1
         paXDGApq7Ya3IAz4S+nZeu0wYqtzIdMML4Kb9yWksm/qYKPKpk0aFwh15hhDfR21Z9YJ
         Jjq2sWPovpOgvLxYJBsQXmvBGTmwHaTMrWgURM12d/NI2TjW49OPv205Yx4lkAliOw29
         pyCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792749849; x=1793354649;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=cTsNKU2kYOf2rxmtGG/9JRKLpirEPzdL4P8zLLZqK4o=;
        b=n06/sznldyTOWkXX2HTzi1icl96iVWjmXIPzz6fJF46YT4ePYxZE2GWRKkV8kflmk/
         eTVSO8RU49vw0MhGLdN1++vJXn2GUbcEOhfcdv6SCUuSTDn8h1hrt5KJLVIabwiQytNI
         HxdEvMW5sXYTVhZAkpLy0GZjIBkRWpH35gwFZJZwUIaXZdF/GVugmQAK7XtXUYLevzRp
         v6OSNbTZBrrPPj5VZV8FD+4tilUaKt2iReWgXCxskYSgc/wCKdbSrTK5+d1qI+ov4BJK
         fmWnde25bBNqNwLk8NfYHTRzvBTew1B9/08HWflSKiQrkE9XTMsCsjsi7c2Copr86IOX
         gNUg==
X-Forwarded-Encrypted: i=1; AKwUvBzGUOsgEk1gUSWhtDvc4VOaqEbgBqM6wBbkCL9i9leYhKwBFw3TKDpbOWaVmcaRmpcJ4k/JR/M2/TlF@vger.kernel.org
X-Gm-Message-State: AFq9FYJaWdwzDHPZq1uQqLJVf7GL5B78GNms1LhxLJE/tnCiRyEfc9zV
	95jZwLXYRK6ceFX/fABUKieR4NBS9AZ8Wd+bKz3aiKWJNiCMi2u472ECtq1jphvAZ2I=
X-Gm-Gg: AYBFou29eNGtehaOpMAKN/BsBpcyt7mE/I/7sYFv6tsfWVNewVwZYfoHXzx/RdHyedg
	dTR2rH5+hMCURZVxaXhMnGLjr4M8oR7+F1ud31NVwt7UStq0mi2bnaGrTqOFzdEQVG7FFMTyTew
	Qd8r9F/8P95hE0daR3YLnV9iWP/wrucAqbx8s/Ypz48Zi6IMd2B4oxJ2Vm1i3WoeSXZ58HwI6+4
	y67DhFLwdWVEeftXgEXJVVIVNBdoXoH6nFSmONMDfZ3ogbQ7zJ5hoowDoYBHLZh5r5PHvx/oWWr
	BbXcoyuSx2Dcz42n9ZXnynd5Cv7uphBa1QSufOE0QNzbc6GJ7XPRaKwlE1ACMpNHXEkXE9TbRnq
	AQboffyl+Kv1NgsZ2YL8CUCqd7dD9ip/cFUzmTkZlTY8UBS3YwIG8CCCsKyTHPmDh3vTJ7GkPz4
	sBIRqxD6maBnKomVkXZ6x0snGIvIJQwiqsHNQtUp2M8b92Mke6r0Sm+tQmKMmWxp60jCWdg3FQU
	KhnaXzMIXLYwDhZfmqhhiBC091kyiOdHVagM5BbVuESZJ2gVIDr2bQFQmpo91c6YE13+9lvwZy2
	b9/2hH2il8r5YjwTziY5snXIHwQpFx76iw==
X-Received: by 2002:a05:600c:4ecc:b0:49f:e701:51c8 with SMTP id 5b1f17b1804b1-4a211c917e3mr26963135e9.9.1792749847336;
        Fri, 23 Oct 2026 03:04:07 -0700 (PDT)
Received: from localhost.localdomain ([2a01:e0a:9c3:9990:6877:44a0:5297:9502])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a21045df9dsm75761435e9.8.2026.10.23.03.04.06
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Fri, 23 Oct 2026 03:04:07 -0700 (PDT)
From: Olivier Louvignes <olivier@mgcrea.io>
To: Lee Jones <lee@kernel.org>,
	Chen-Yu Tsai <wens@kernel.org>
Cc: Olivier Louvignes <olivier@mgcrea.io>,
	Sebastian Reichel <sre@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	linux-pm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 4/7] dt-bindings: power: supply: axp20x-usb-power: Add the AXP2101
Date: Fri, 23 Oct 2026 12:03:58 +0200
Message-ID: <20261023100401.67592-5-olivier@mgcrea.io>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20261023100401.67592-1-olivier@mgcrea.io>
References: <20261023100401.67592-1-olivier@mgcrea.io>
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

The AXP2101's USB power supply reports whether VBUS is present and the
input current limit, like the AXP717's; its registers differ, so it gets
its own compatible.

Signed-off-by: Olivier Louvignes <olivier@mgcrea.io>
---
 .../bindings/power/supply/x-powers,axp20x-usb-power-supply.yaml  | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/power/supply/x-powers,axp20x-usb-power-supply.yaml b/Documentation/devicetree/bindings/power/supply/x-powers,axp20x-usb-power-supply.yaml
index 2ec036405ae4..1c582aa5e1d0 100644
--- a/Documentation/devicetree/bindings/power/supply/x-powers,axp20x-usb-power-supply.yaml
+++ b/Documentation/devicetree/bindings/power/supply/x-powers,axp20x-usb-power-supply.yaml
@@ -25,6 +25,7 @@ properties:
           - x-powers,axp223-usb-power-supply
           - x-powers,axp717-usb-power-supply
           - x-powers,axp813-usb-power-supply
+          - x-powers,axp2101-usb-power-supply
       - items:
           - const: x-powers,axp803-usb-power-supply
           - const: x-powers,axp813-usb-power-supply
-- 
2.39.5

