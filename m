Received: from mail-pj1-f42.google.com (mail-pj1-f42.google.com [209.85.216.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3E6B03F44F4
	for <devicetree@vger.kernel.org>; Mon, 17 Aug 2026 09:56:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786960566; cv=none; b=pxzvPmiaa8EGzRH6CmY1UBmQewEOZfuu7vmI+aATAAyrfL58+LF2jjl6uwjbZDaB6Ws+t6u+3aHIBru1VogTc06tDKb4nx0iF+5g5frN3AhrDRz/IoNw2P1l9M2PN9QJVvE/IHswnegiYH9buEN0FdvifgPVjTpseZGp0dsq208=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786960566; c=relaxed/simple;
	bh=14ZJCz1b3PYPlQZdK+J8ksfvy5pPcXd3uJYOzeBcKww=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=exxblbzc6OGeP0EghnyGlgGbEoq2PLTadzjuR4xeoSRy6MUx4tLcMOSUkZud9kPvrhdxKDftqiOT+lUHuWw7cuS+XQUZng7hWPHiTGj+AiecS6xF0LkRXbvbnN6TfjfcdHJ/kpLoxN+lgwxwbtCT8hGR3mC2wgrKz4rZPxHFwb8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=synaptics.corp-partner.google.com; spf=pass smtp.mailfrom=synaptics.corp-partner.google.com; dkim=pass (2048-bit key) header.d=synaptics-corp-partner-google-com.20251104.gappssmtp.com header.i=@synaptics-corp-partner-google-com.20251104.gappssmtp.com header.b=sAv4ak3I; arc=none smtp.client-ip=209.85.216.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=synaptics.corp-partner.google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=synaptics.corp-partner.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=synaptics-corp-partner-google-com.20251104.gappssmtp.com header.i=@synaptics-corp-partner-google-com.20251104.gappssmtp.com header.b="sAv4ak3I"
Received: by mail-pj1-f42.google.com with SMTP id 98e67ed59e1d1-383cb94f742so3866696a91.3
        for <devicetree@vger.kernel.org>; Mon, 17 Aug 2026 02:56:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=synaptics-corp-partner-google-com.20251104.gappssmtp.com; s=20251104; t=1786960563; x=1787565363; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=z4xDj0w3ozT3KZ9ITWnqYhsyzdEsf8N4l5Lp5dY2A10=;
        b=sAv4ak3Iimfc95+jMlHCKWhctgI647FEM5hunmKuRkQM1xslbQPO5MVQ1/BnLW48Xm
         wXvBL4UmHGMi5JdXCuKlyHy3hiR7UFRzJZ9UmQ3463w7EXDClXu4ZDPMpbOxOasch3lz
         MYJP9rC6FInCt5Rdu2jonfKzCxgPwuSO7k4WgG8ntDjMguaMayjBgS+rcy7/7OCF7RMW
         U6Nc4UKYUQ9NAycreHs921fi51S0uc8AbNDgiYoRkJEQd6Mbpl38weW7YwOayOgpdBlI
         fplsOf30o6LdoF+uleWvd4AVLjWRI/xBh/7m2OVHZFkC3QcAO74gMwt2TbPuPkfCzhkP
         fGuw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786960563; x=1787565363;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=z4xDj0w3ozT3KZ9ITWnqYhsyzdEsf8N4l5Lp5dY2A10=;
        b=qIZOoPrmihjojssSV5XGnE/66jK4p021OCOpaFzUQoNrUWDN/4IBwoVKtUx/dyaE/q
         k6cGKPr4qmANBYEoxcFAWjE2NkFAm3520bk0I7hqWEqh9DUImbqVfnNEn3mJNtwFiNQS
         5fE+G/jlnFNz6gtKyfdyOngLksk547lEpE99DviKpAHlKVf+EnZ2c/lmPbwop4Cc+Jyu
         fHYv00jJ9xiCXblt17r8RfZjRMGxPyuJDb4IgnCWAJLAv2jx338Gp7QayieTc1QAYZik
         uTUu3qaV3miSEjXsI8GsqBZJwb8S9t3fMrotAr6zfhkt6klBrwAQ29VW5SRLg50Zpw9W
         d7NA==
X-Forwarded-Encrypted: i=1; AHgh+Rrqm+q8MQBlIS+MJyteWpKKaWwIB3v4MtrBOM0cTfvEfcB86+jT8FMgMcMogmb5OoouxygvixcoX6K+@vger.kernel.org
X-Gm-Message-State: AOJu0YxpjFG8bS+Chmbw8VhptA6jxe0i1LmYkC3b8f50IEDdq17WLsMs
	SnVBYkNpSJBpmsIQ53py4vNM4TCarBHBnAR2RlYW95MUtS/wp9oXBqbc+fAZBGPWdmUdf2nz698
	AL6s=
X-Gm-Gg: AR+sD10waX5ADhvxUDK2KcNzTaTxRFEuHhL13eg6ZocRAQrCGa//3bUf4qt4Ke0hFfI
	jGxhwGPFkYr/lUHRCKbOfj9f1Ic6c2Jz1Dq8BfPNThG6I0LjtXwtvZTma6zVnJWPPLpEVgNV6B2
	PoH635zu9LVLnS3ggYtDt0HN96e9VkezK4/ncrN9vj1ZfVgaFKPqESIxPcwi81i79PXc+EhS8oo
	CeZ96rLCnlxOmh5XExqukFp3Llh6DkJbR6yPZypk/YfAUNg7RRGF6zxetT56we+moaFcZOVEHOk
	h9crB4Pc19LkQjdjaEHw65YNjzjiFwSfnF8nDEgSJjgR02SZ7aZfS1vrYt8HkxDgR8xkY3hr+cn
	p/FP2YrhqmqtmrtZPkdX4loWs4irCMXCV0Sr79jtc3PrOY3V0pvv68CZjVWgY9lumE2h0qZcbTI
	GNo92rcCvAspcaQJ3YaEaEmdnOOnGAqVgasEnEhyR8aV3DJG9RGE6MV/uL5863fy168W6BSNXop
	j9GSoe72t6lK2ZCqlpvI7wif9XdiZa2nUQpYu5nkc3bfMO3Iqrin29FSIVXo11Rfg==
X-Received: by 2002:a17:90a:6089:b0:395:4de4:92c7 with SMTP id 98e67ed59e1d1-3954de49a5fmr1923124a91.3.1786960563390;
        Mon, 17 Aug 2026 02:56:03 -0700 (PDT)
Received: from TPE-build-server-2.synaptics-inc.local (59-124-75-166.hinet-ip.hinet.net. [59.124.75.166])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3954d3b4383sm1692047a91.15.2026.08.17.02.56.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 17 Aug 2026 02:56:02 -0700 (PDT)
From: Kaihsin Chung <kaihsin.chung@synaptics.corp-partner.google.com>
X-Google-Original-From: Kaihsin Chung <kaihsin.chung@synaptics.com>
To: linux-bluetooth@vger.kernel.org
Cc: marcel@holtmann.org,
	luiz.dentz@gmail.com,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	linusw@kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Kaihsin Chung <kaihsin.chung@synaptics.com>
Subject: [PATCH 1/2] dt-bindings: net: bluetooth: add BCM4384
Date: Mon, 17 Aug 2026 17:55:49 +0800
Message-ID: <20260817095550.648774-2-kaihsin.chung@synaptics.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260817095550.648774-1-kaihsin.chung@synaptics.com>
References: <20260817095550.648774-1-kaihsin.chung@synaptics.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add the brcm,bcm4384-bt compatible string to support the
Synaptics BCM4384 Bluetooth controller.

Signed-off-by: Kaihsin Chung <kaihsin.chung@synaptics.com>
---
 .../devicetree/bindings/net/bluetooth/brcm,bluetooth.yaml        | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/net/bluetooth/brcm,bluetooth.yaml b/Documentation/devicetree/bindings/net/bluetooth/brcm,bluetooth.yaml
index 95501e858e6f..612d21123aaa 100644
--- a/Documentation/devicetree/bindings/net/bluetooth/brcm,bluetooth.yaml
+++ b/Documentation/devicetree/bindings/net/bluetooth/brcm,bluetooth.yaml
@@ -31,6 +31,7 @@ properties:
           - brcm,bcm43540-bt
           - brcm,bcm4335a0
           - brcm,bcm4349-bt
+          - brcm,bcm4384-bt
           - cypress,cyw4373a0-bt
           - infineon,cyw55572-bt
 
-- 
2.43.0

