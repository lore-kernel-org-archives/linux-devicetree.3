Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.179
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794980916;
	b=zDKqUiJ/Bx3HoOJi+bfnoeu0ykkezV6cKJQGCGghlC7dwroklJcMxEJXO4/fsPTw8dZQ
	 E+HEBwYgC//bIl680nj7BXZoNSEMZ0P1wMZi0qiulwq/u1HMB3c9m7BPsnV5g3wDaW3kv
	 iD7ITNOR2n9kCHqpWZn2CcGnrrsN16bUD0u6CASrwNxJYB/wM1TGsvNwXh3jqXmY+C+e0
	 STV4J+2vJxBY/u4O+/+Rwk/c3vZRgxG3qtFmrMJxMEzGEfIABsLQ5Ls7gH2e/StQEcl/0
	 7ahge+cpLe2Z3hMpyZKcsANjgEMsJVxHskYvEST2ggjfNYsaEQ+H5B4ekIQKm/qmBYA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794980916;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=ImtLOtGTf11APrJzF3AKZQDnZTS9KPs5mJF1gZZY3Ts=;
	b=ZjQU2sDnl5StE7YJ3UD7JA7CWQ9cUWmdPBpyz5R2iD1qec8H/EiUcmX/9DKwcEUWCnBm
	 QNLVc9D6r6Vl5JfRKIN6VkuMVb/uees+pw7ljlPsfnUmH+U8Wy3Qe45fRPk+O30WsizCe
	 qPZDavLKbSxdUM7z6sD/9Z1Rl5pMGA3Xk7BitnQz08ZlagqBAQggmpySdQiIMYwyGYkco
	 kyJu+ldePahL94nqT2gypcl7raPWNutF52RE4ecFYbeK8B5gXozS0iAbvbg/SkzzGINIM
	 xTmJRtT6oRW9kevghYKs8UvGCJ5JpAcg/1w5kELQRQYQ90BdAhgqeXOLNbcpCp3dkOw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ZPBQMRqp;
	arc=none smtp.remote-ip=74.125.82.179
Received: from mail-dy1-f179.google.com (mail-dy1-f179.google.com [74.125.82.179])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 113EB606A895
	for <devicetree@vger.kernel.org>; Wed, 18 Nov 2026 05:48:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 113EB606A895
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ZPBQMRqp
Received: by mail-dy1-f179.google.com with SMTP id 5a478bee46e88-38190551625so1194104eec.1
        for <devicetree@vger.kernel.org>; Tue, 17 Nov 2026 21:48:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794980915; x=1795585715; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ImtLOtGTf11APrJzF3AKZQDnZTS9KPs5mJF1gZZY3Ts=;
        b=ZPBQMRqp2WrhGcMZHuEfFYYrCIY84V5IG+e09qrbI5cdWBzDl1gP/5tzOGrIUN8iyq
         HJ5OQkmMX/ybsoI190C9AVLJ5C7eiM1aWDs1RA8frV4xUelsTPnGdsFI/GWmRgbdsQH8
         n2JW7uy7xeA0speAr4Qbiic4Y47NMguuN8iE4gDCyrWuwAnDqVGjSK4kZ+nQKUF09e4m
         bqsnNFEeeb66Lk8xJd0heH5GoCK+5Cw23DmgLqsT6ipYVSZpuxPiXLkCgKDEt3hGc9Ch
         86g1FrjvOyvlYX0UFbxgSj5F7MGxJnyXmAlOAphJwb6sQddKJnQayMMuhL53VF/El6Eo
         6dyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794980915; x=1795585715;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=ImtLOtGTf11APrJzF3AKZQDnZTS9KPs5mJF1gZZY3Ts=;
        b=bG1GY3JKPDRH26kU/0+zye7mNY8Wzr9bxlN4jSXhyBHuJ9HzlcgBLD1xwpK3R8gRB4
         R3s2MZ+rlM6bSeftZ4frgb6VInj9RwNH9oRJSdVprybxGW63a9u98xadzWX8DePJk1OJ
         svIdDWrkV5U8920aW6AU5E65ncrLGpf0vH/olBTdyH4zdvceOjFK8oUGXqLUK6YGV9yA
         1tUv7S1QPkN6Wf4Xd8yTIqdbOBqEWh4D6d3i8QkaDVn/mXhnyaNDFoygvP3DRVcoJoNf
         CZRP3sPfqp/5EZLIOvIqKakiFAkASWY8FmTfPE3ed9FtEOH43THqhGhNz2Cp69xm8Hms
         DrWw==
X-Forwarded-Encrypted: i=1; AL+hErEGyR8/BXMIhniYz1ugdL53wErkXJIICO3EzSLBHQyyojwOrtmLWVhd8qixBf/j2MaRzHCqpJTOvIhU@vger.kernel.org
X-Gm-Message-State: APuU4Z9Z8htbt0E6WsrOp9uDYy4Td2i5ygT9idk6vPy+WmDk37cSTwsT
	8TrwAFIm0pUG5tuPteK0y/RzgO3ZbSbj0OJC5MGtyob5o2Yxhb4YY7BJYz9VUA==
X-Gm-Gg: AZFdTZf9Cv7/aLYT9Hjrh5ynAFN0Td2ickuseu1jJIqHTRjWaOM8fTzII+Q91Njc6ZF
	cSWw3Pmzfm2Kj8zs+AeeRYPN07Q4qElwRutALPUamCKGME+HJkXeQ835GQPEHAaK9SGceSQgWJA
	zYsdwBnt+aJI8VrdV7uL7Ymzzrk72SHNluMBa7kOqz7g9M/jOii0YzCJVKct8HOpqReCYXguJFu
	X/MjZ1Sp2U7TEGbuhtrJTfPcO/1tk9yYOk5SQOS4we70DyTwvWeEVpk6w36gOxHkhDaN2VEt2bC
	UZFajmtL5rcgAIXKevr6cmKhEJRiJErwtQPDnAe2T/ifD6Yd1MCvmMks+4iZN7KHhKkTPHoHwH9
	xJBFWdZ6TBDPQLm99vJ9fC/ZpUIh2nJZ9FDAowiKpC8J6bXn+VwFuIuZxj3btQRk7HR/ZRmwux1
	JuW/wFbr8/VRktnRkdNPvDNs+MwfFowWuv3VFVVTqUVTC3n2RVlSqWpni3CjOKRm3i4JmgaLUuK
	4pTYSsLv82z1FxQuUQ4dRJhvyjApkpV0GcItJvmmboLnyJ7SX7DGFwk+rc+zB3rScSx0g0gpa9N
	v9x546sSEW9aPd5EBL/yc1sgDRaOyxRboU9WCW8U7AEobfo/v+ec2vrDpUE2q/8xtTYX6EliciP
	JeFDpA2LmfyNb+c+Cmi+V25mKk19N+B0QC3GSNoKDXtzewCo0b3tMJ6gSYkdYmlnxPXq1+Qtra5
	vtHg==
X-Received: by 2002:a05:693c:88d3:20b0:37e:9a3b:76a3 with SMTP id 5a478bee46e88-3827fa88224mr1559279eec.11.1794980915134;
        Tue, 17 Nov 2026 21:48:35 -0800 (PST)
Received: from ryzen.lan ([2601:644:8000:37f::e34])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-382a680032dsm3408116eec.10.2026.11.17.21.48.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Nov 2026 21:48:34 -0800 (PST)
From: Rosen Penev <rosenp@gmail.com>
To: Florian Fainelli <florian.fainelli@broadcom.com>,
	Hauke Mehrtens <hauke@hauke-m.de>,
	=?UTF-8?q?Rafa=C5=82=20Mi=C5=82ecki?= <zajec5@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
	=?UTF-8?q?Rafa=C5=82=20Mi=C5=82ecki?= <rafal@milecki.pl>,
	linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org
Subject: [PATCH 13/17] ARM: dts: BCM5301X: Buffalo: use gmac2
Date: Tue, 17 Nov 2026 21:47:54 -0800
Message-ID: <20261118054758.132233-14-rosenp@gmail.com>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <20261118054758.132233-1-rosenp@gmail.com>
References: <20261118054758.132233-1-rosenp@gmail.com>
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

Use switch port 8 as the CPU port instead of port 5 on the WZR-600DHP2,
WZR-1166DHP and WZR-1166DHP2. Port 8 is the switch's IMP port and
connects to gmac2, which is present on all Northstar SoCs.

Signed-off-by: Rosen Penev <rosenp@gmail.com>
---
 .../boot/dts/broadcom/bcm4708-buffalo-wzr-1166dhp-common.dtsi | 4 ++--
 arch/arm/boot/dts/broadcom/bcm47081-buffalo-wzr-600dhp2.dts   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/arch/arm/boot/dts/broadcom/bcm4708-buffalo-wzr-1166dhp-common.dtsi b/arch/arm/boot/dts/broadcom/bcm4708-buffalo-wzr-1166dhp-common.dtsi
index 9f9084269ef5..2f1d49733f09 100644
--- a/arch/arm/boot/dts/broadcom/bcm4708-buffalo-wzr-1166dhp-common.dtsi
+++ b/arch/arm/boot/dts/broadcom/bcm4708-buffalo-wzr-1166dhp-common.dtsi
@@ -179,7 +179,7 @@ port@4 {
 		};
 
 		port@5 {
-			label = "cpu";
+			status = "disabled";
 		};
 
 		port@7 {
@@ -187,7 +187,7 @@ port@7 {
 		};
 
 		port@8 {
-			status = "disabled";
+			label = "cpu";
 		};
 	};
 };
diff --git a/arch/arm/boot/dts/broadcom/bcm47081-buffalo-wzr-600dhp2.dts b/arch/arm/boot/dts/broadcom/bcm47081-buffalo-wzr-600dhp2.dts
index 192b8db5a89c..47670b9bfb79 100644
--- a/arch/arm/boot/dts/broadcom/bcm47081-buffalo-wzr-600dhp2.dts
+++ b/arch/arm/boot/dts/broadcom/bcm47081-buffalo-wzr-600dhp2.dts
@@ -143,7 +143,7 @@ port@4 {
 		};
 
 		port@5 {
-			label = "cpu";
+			status = "disabled";
 		};
 
 		port@7 {
@@ -151,7 +151,7 @@ port@7 {
 		};
 
 		port@8 {
-			status = "disabled";
+			label = "cpu";
 		};
 	};
 };
-- 
2.56.1

