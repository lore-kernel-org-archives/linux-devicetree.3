Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D28C7427FB8
	for <devicetree@vger.kernel.org>; Fri, 31 Jul 2026 11:41:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785498099; cv=none; b=iXSV8ytk2jeQPefT/Xx7vE5npDDTOTs/PcLZ9QwecEKJ5fPaz6SrL4oHhgmQofd7rnJJYxG7btKL6SQqS3q4X0QrFdBoEN3XoT21w8Bv6KBIZkznxBz73IUFgbdQFcGhWnfoZTjTPa91mFEvnP0unmF8i0VOme9du3wpxDV3YRo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785498099; c=relaxed/simple;
	bh=Q3lDkaOYkbkHbtNIKWgGOeumJP/9Qr2VFUZkFA7SVQ8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=cY6D5cgZP3v4KN3ap0JlQTdcPc4KzyVGRluBv37vSsH9WbUq4cXhONM+811GU4kN02QgC1OAMJs9G/MZndyC4kNytyq0/F+sZm/mUzzTFFo+tDsopGOmEZFOHyBmHSBBbBBQSV2LPl0dRwKTObCOkYXLBodPWyLgbVZ9V+tcLaI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Zv+C7adA; arc=none smtp.client-ip=209.85.221.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Zv+C7adA"
Received: by mail-wr1-f52.google.com with SMTP id ffacd0b85a97d-47f6609c657so444711f8f.2
        for <devicetree@vger.kernel.org>; Fri, 31 Jul 2026 04:41:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785498095; x=1786102895; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=nex6rH5sX+Zb7tHZScdW1Jdevf5eRc6w/3MVUCniJEU=;
        b=Zv+C7adAbUSoBS6GPxm286kZYSUJn5Nbfl8LppsVjj5gGnd/JWk7u2b01lI3zyWzEW
         5RdZq3TueiyGCD9l9v0sUGxwqjs+hWhvzUy3mNiV/6FITtH2bjsmRc3c1S54XmWEZKgw
         gA/oPQtKq1wcP5POCv6KixuDXBqrw+Wq9ydGH9b7feOylAjdor6B5sUu22eUF6JtGdPW
         ZFwB04w7FGYZOvF0LOOMCvlYsjmjpl9WVqKoh9Ne1A7aCPsUWlFdDYKm/Vx+OiUJWy5J
         uwn0Ew40iT8Fy2zqz1BNMl842wVnlVEQ5DRMuO/uytNaMgiriyyer40TUZHXGGDcyLAP
         isdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785498095; x=1786102895;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=nex6rH5sX+Zb7tHZScdW1Jdevf5eRc6w/3MVUCniJEU=;
        b=MLKiCN9/G6+2E6huQIoMxMlLYSPLs0HZ3I4w9VmmUeGl0dTyJr5iONzwQJ1gV4ZQFm
         qfhOu8lSBoWxLaTWgipt7BRPYK2Dcu+D7M7HcVk4f1NA7x2pxBAdSo39g75U3p+aNIql
         qwvTAuJYCMpg8S/PqlQLEnTkERg2pq3+fIHIDZ1iG90gktgeLNdX0NESHvSYWKX6EhEZ
         ME8Ls2l+V3KdV93x/Efa7AjQ1UkULUyj/pePLGTXB6GsljxGlUw4VimayXabFEfKozct
         ZWq97lx1cF5150a8y4rHlGaTYxrq1WVKQryOOPilirW+8v6sFIMxLbCErXuqKi2EesjC
         YgGw==
X-Gm-Message-State: AOJu0YxrGtL38BFMoaEPzw/vd5944y5fsaiEmgNoJUbZmP+6xcamIac/
	hZ0Fdu3PaVRDSUkOUR1WIWNuUYHO/Rtd5EyiNYvmjfZrDtxQGq513ZbO
X-Gm-Gg: AR+sD13m/qP1svQKEYrvloFxlzYnBXSspkIzFszTTyxxVdjHMvHcbdFUOfjAjW/c8Ao
	KnFBxqj8ye54bz5jEc5VFPmnnrqPHPSfJtCx4MBVXuHK5G9zOMvcsuIkl8Z/+wMRjdBkJYq/9uR
	xXTGpBEfF6ugUTMxe4dGvVKUew/Z4RPzyuzF7pdBKyYEJ214AMFq2pEUviVXNWqNCNqby0wptdr
	Gyr4NZKqp1A7hipgKYwEDtD2G8OdvOiDRZfjFyS5QjFVj+v3MyAO9IMGCfoyCqwmWWb2PujP4JQ
	6cU3zL63OoCGoBctLroD/d2UEkMSyVVipvMpjcFM0pTGFPrLAJERbSM2zXm8Px8mdLbdk3HeeNu
	1BBF35ABHuV7RtomMrqO6LlxG2CUtigSYg4QxNyhSMVnQdf0YTBFukDx/ZdjJo/G1578q99OCVS
	txrht+j7ATLMSDAUSZHjtt4iW0Qm1d7mm/XOyOD+xGLc6uEhROLh1Imy5UL+GxYDz1Bx3ZfDHE2
	PvOHqN7WZZsaNCGfGU7
X-Received: by 2002:a05:6000:2989:10b0:47f:93a1:115f with SMTP id ffacd0b85a97d-47fd2b76dcemr3150221f8f.60.1785498095006;
        Fri, 31 Jul 2026 04:41:35 -0700 (PDT)
Received: from xeon ([188.163.112.51])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47fd41d0064sm3769336f8f.5.2026.07.31.04.41.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 31 Jul 2026 04:41:33 -0700 (PDT)
From: Svyatoslav Ryhel <clamor95@gmail.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Thierry Reding <thierry.reding@kernel.org>,
	Jonathan Hunter <jonathanh@nvidia.com>,
	Mikko Perttunen <mperttunen@nvidia.com>,
	Svyatoslav Ryhel <clamor95@gmail.com>
Cc: devicetree@vger.kernel.org,
	linux-tegra@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v3 08/10] ARM: tegra: tf701t: Complete power sensor node
Date: Fri, 31 Jul 2026 14:41:04 +0300
Message-ID: <20260731114106.169398-9-clamor95@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260731114106.169398-1-clamor95@gmail.com>
References: <20260731114106.169398-1-clamor95@gmail.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add missing vs-supply and io-channel-cells.

Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
Reviewed-by: Mikko Perttunen <mperttunen@nvidia.com>
---
 arch/arm/boot/dts/nvidia/tegra114-asus-tf701t.dts | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/arch/arm/boot/dts/nvidia/tegra114-asus-tf701t.dts b/arch/arm/boot/dts/nvidia/tegra114-asus-tf701t.dts
index b71a02b3fd86f..32d55c18c7446 100644
--- a/arch/arm/boot/dts/nvidia/tegra114-asus-tf701t.dts
+++ b/arch/arm/boot/dts/nvidia/tegra114-asus-tf701t.dts
@@ -1391,6 +1391,9 @@ power-sensor@44 {
 			reg = <0x44>;
 
 			shunt-resistor = <5000>;
+
+			vs-supply = <&vdd_3v3_sys>;
+			#io-channel-cells = <1>;
 		};
 	};
 
-- 
2.53.0

