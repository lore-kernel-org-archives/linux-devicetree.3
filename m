Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.97
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793123502;
	b=Qe1v946asulXupnb9JSp9F6e3bx1u6OJk2KD7ZqAZ2qyaNvJEzhvk12SQPSOLO8CcMsM
	 yBNY5fBsYDsUMowZYwxtQKrJuKMP9SX2rZKl7Be0vcr8u+AL3J6ljOAGBqAq4F1S9ozLp
	 W9ETKZphHXqqdns+wJfNIB8/96ivse56TN1EfXPlvnf2i4ZhnyrS5chaM/JiFzCzpDOk7
	 iDb4dLGSpRK1gM8dRYCFNSLScmp4YXmsdBMIxUPXlA51ZZujkxY4Nv3qzM8whZ5AVdE/F
	 pMzEMda+M2pNdAvCI8Rd5snIt/fk50d7CykJQTTXqQ3xsYgql3loICTeeIefXa2I2vw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793123502;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:X-Relaying-Domain:
	 X-CFilter-Loop:Received:DKIM-Signature:X-Forwarded-Encrypted:
	 X-Received:X-Received:Received:From:To:Cc:Subject:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-DetectorID-Processed;
	bh=QkAGfe/UDsHGvMGKL2L3uZbprb9NTy21LdH6RR7axyA=;
	b=2srGDt6BV68F/IJ62ndOGzjShH13IDQrQxFYk2g+QpZPkOgg8NecfziNDk7aeHh/DEvI
	 BDpIovqVfiChjWwIpO5cHfc11VaexQyVipCalvjZUd+lS5lnHBGXzuSG2etSgVtcar0lw
	 OxtmFo56jHARFRud4SwD1aykqvLg/Ogj+IOROf8EuSQV9C9Vv7triiIU71u7xC08+k3K6
	 dV2u0RpLAzdEQWtOrYgFfA/1+Meutf5YVZZ3PAf3Kgvi8g+HwgKFSZ5bPxTYA3rqsle9m
	 /5oYGQx/pr1NlD6P1ppgUPFl1Zva6pToH7tfUXRix6QJ8aggd3e0c7lDGp+b0OBmJkA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=broadcom.com;
	spf=fail smtp.mailfrom=broadcom.com;
	dkim=pass header.d=broadcom.com header.i=@broadcom.com header.a=rsa-sha256 header.s=google header.b="Qczylg/H";
	arc=none smtp.remote-ip=209.85.216.97
Received: from mail-pj1-f97.google.com (mail-pj1-f97.google.com [209.85.216.97])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BE12E606A324
	for <devicetree@vger.kernel.org>; Tue, 27 Oct 2026 17:51:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BE12E606A324
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=broadcom.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=broadcom.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=broadcom.com header.i=@broadcom.com header.a=rsa-sha256 header.s=google header.b=Qczylg/H
Received: by mail-pj1-f97.google.com with SMTP id 98e67ed59e1d1-3ab2cb8d577so139358a91.1
        for <devicetree@vger.kernel.org>; Tue, 27 Oct 2026 10:51:41 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793123501; x=1793728301;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=QkAGfe/UDsHGvMGKL2L3uZbprb9NTy21LdH6RR7axyA=;
        b=kYYp5jgK21RTKmFKL6/SMUl44XWamG7kySh2HZRW6/6xG+7DMfYHOCdm80mY8nHvsa
         SwKvdScAAxuE6MmP7H42kuHZynqZq8/Qc9HEKXTenp458YV+k8gHsxpWE5Mx+q9HghvW
         Ivpf42pD7XklPZDShPyCKjm9PAPsuuYotqudRiTLByFxC4qNpWBHgtXZ/BlkWicnk15A
         ZiM/9bAQgJs6b498CMpn5f5LxOMQm+mavhfWGgWwbsQidowXZ3hOoTzBXTP6abhp8+Uw
         ISMNKuws0x3gWYA5QmoKWYmz0YLpviA3EnGN0/UrD6Ar4Nlh+lKhLVIyq5GBkkSVfRka
         aw5w==
X-Forwarded-Encrypted: i=1; AKwUvBwSWKVN2hEV7aOtxJJGzcC5kA9xsfo3GR7CpG77w6QkzIDgVY5AfFHj+MBPwrnSn2ClzdHqnE7gcH2i@vger.kernel.org
X-Gm-Message-State: AFq9FYKfYeMbzQ2bCW9mJGpiEJL/DJgtZCDV/VPkouF7lGgoelN1AZNb
	AmheAi2XBNqrLH+qPMVWf953/ct76Jhn4KGqwpez0TE5emEcrOgc/Cm8XoD/pDld4lshkIbWtHz
	jOAHa0otulUMygqlLd5/Yl87aAZBLxQwIWq/odOZlubdCoNfIdav9h38WQY4596+POejI7t0KXo
	Xg1KzyxaB/4IoEd0mxw3T0gEJDeeSz7g5aXdc0LwPI20rmD+ysGi6UOT2rCYqvlKbk8Z2sUuiT3
	jcztmOuAqhecpBbe01sJQ==
X-Gm-Gg: AYBFou32SljIhhiCXiX+Q9n/QH/TjO9erJ4QkC15LzE13BM1aQiIkfA/ehjFbVLReaB
	PS6IVySe5VPjAJvIgSt3cc4iv9NKRFLocAR2FGor8wsKiQxuroVW+iM5UbL82x5HtZsfTuIKJZC
	UdxQ1uC+zGSVYSu4ifPqMciIHb3qHUqnJJeOvXqXmFQlZCrvAYMwDfCMzbKODvLWYekQzzC8ZHI
	l7eomj0/5EHYSFnBgiRjkwtD6geZeFjou3TDm9ZSAN3bLLhc/UjoZym4kFmsxgQNF3y2Uj0FpGQ
	IlTWSBgyuYyFwollPgG7n5qO3YS2xK+bhGV/4yTD2Wb9AAcep47PwZD28Pnag/kRqG2PdeuCpDP
	mYGhnmfx2/5q4yv0A9qjntQf6MAH/4NPU+9S2JbBfeyNJ8/vnmxhTG4z7mytVlRbCp8FaNSuAJI
	mCNIsI6+5wQL71dgIUPWthSelwse98VPn63Q7BVn68
X-Received: by 2002:a17:90b:2645:b0:3a8:878:ebab with SMTP id 98e67ed59e1d1-3adead4c29bmr8882481a91.35.1793123501265;
        Tue, 27 Oct 2026 10:51:41 -0700 (PDT)
Received: from smtp-us-east1-p01-i01-si01.dlp.protect.broadcom.com (address-144-49-247-23.dlp.protect.broadcom.com. [144.49.247.23])
        by smtp-relay.gmail.com with ESMTPS id 98e67ed59e1d1-3ae406dbad7sm2620666a91.2.2026.10.27.10.51.40
        for <devicetree@vger.kernel.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 27 Oct 2026 10:51:41 -0700 (PDT)
X-Relaying-Domain: broadcom.com
X-CFilter-Loop: Reflected
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-533928ef33aso3052341cf.1
        for <devicetree@vger.kernel.org>; Tue, 27 Oct 2026 10:51:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1793123500; x=1793728300; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=QkAGfe/UDsHGvMGKL2L3uZbprb9NTy21LdH6RR7axyA=;
        b=Qczylg/H+JxabyUKQO6+Wf2DSWugEEbAKDOWvySYrn6hpb5ft8XX4RJjP5IP7UFiOB
         dTXQrSXG7Wk6MX2PRDH2ffPJOdtECGQQyL0KqWBiZJxBr8hftLXax6E4dODUW3ZpMtwl
         lbd90VI+GbwwIaaS3WR1UzOc04ZGFLcrwcG/o=
X-Forwarded-Encrypted: i=1; AKwUvByS6tzhlCwQe2wRbUoPdbS0Oag+eRFGUz8flwiexpfulU332WcmgB2EiRuobqlE/Rq/uvDGWj389Ukj@vger.kernel.org
X-Received: by 2002:a05:622a:54c:b0:536:3eef:56f3 with SMTP id d75a77b69052e-53fcc6c1af8mr63471cf.58.1793123499681;
        Tue, 27 Oct 2026 10:51:39 -0700 (PDT)
X-Received: by 2002:a05:622a:54c:b0:536:3eef:56f3 with SMTP id d75a77b69052e-53fcc6c1af8mr62871cf.58.1793123498959;
        Tue, 27 Oct 2026 10:51:38 -0700 (PDT)
Received: from fainelli-desktop.igp.broadcom.net ([192.19.223.252])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-5383970ab61sm83164511cf.17.2026.10.27.10.51.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Oct 2026 10:51:37 -0700 (PDT)
From: Florian Fainelli <florian.fainelli@broadcom.com>
To: linux-kernel@vger.kernel.org
Cc: Florian Fainelli <florian.fainelli@broadcom.com>,
	Hauke Mehrtens <hauke@hauke-m.de>,
	=?UTF-8?q?Rafa=C5=82=20Mi=C5=82ecki?= <zajec5@gmail.com>,
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
	Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Randy Dunlap <rdunlap@infradead.org>,
	Will Deacon <will@kernel.org>,
	Mark Rutland <mark.rutland@arm.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Besar Wicaksono <bwicaksono@nvidia.com>,
	Ilkka Koskinen <ilkka@os.amperecomputing.com>,
	linux-arm-kernel@lists.infradead.org (moderated list:BROADCOM BCM5301X ARM ARCHITECTURE),
	linux-doc@vger.kernel.org (open list:DOCUMENTATION),
	linux-perf-users@vger.kernel.org (open list:ARM PMU PROFILING AND DEBUGGING),
	devicetree@vger.kernel.org (open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS)
Subject: [PATCH v2 3/3] ARM: dts: BCM5301X: Enable AXI PMUs
Date: Tue, 27 Oct 2026 10:51:24 -0700
Message-ID: <20261027175124.3518239-4-florian.fainelli@broadcom.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261027175124.3518239-1-florian.fainelli@broadcom.com>
References: <20261027175124.3518239-1-florian.fainelli@broadcom.com>
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
X-DetectorID-Processed: b00c1d49-9d2e-4205-b15f-d015386d3d5e

Describe the three BCM5301X AXI Trace Modules and enable them on the
BCM5301X base DTS file.

Signed-off-by: Florian Fainelli <florian.fainelli@broadcom.com>
---
 arch/arm/boot/dts/broadcom/bcm5301x.dtsi | 15 +++++++++++++++
 1 file changed, 15 insertions(+)

diff --git a/arch/arm/boot/dts/broadcom/bcm5301x.dtsi b/arch/arm/boot/dts/broadcom/bcm5301x.dtsi
index f06a178a9240..dcae7cba37c4 100644
--- a/arch/arm/boot/dts/broadcom/bcm5301x.dtsi
+++ b/arch/arm/boot/dts/broadcom/bcm5301x.dtsi
@@ -10,6 +10,21 @@
 
 / {
 	mpcore-bus@19000000 {
+		axi_pmu_m0: pmu@3000 {
+			compatible = "brcm,bcm5301x-axi-pmu";
+			reg = <0x3000 0x1000>;
+		};
+
+		axi_pmu_m1: pmu@4000 {
+			compatible = "brcm,bcm5301x-axi-pmu";
+			reg = <0x4000 0x1000>;
+		};
+
+		axi_pmu_acp: pmu@7000 {
+			compatible = "brcm,bcm5301x-axi-pmu";
+			reg = <0x7000 0x1000>;
+		};
+
 		a9pll: arm_clk@0 {
 			#clock-cells = <0>;
 			compatible = "brcm,nsp-armpll";
-- 
2.53.0

