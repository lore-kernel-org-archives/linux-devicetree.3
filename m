Received: from mail-pl1-f171.google.com (mail-pl1-f171.google.com [209.85.214.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 48CD9233949
	for <devicetree@vger.kernel.org>; Sun, 16 Aug 2026 13:32:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786887179; cv=none; b=gVu3E2cOoeGEEMgs1PvhTOmMpw0l7PRxPuNYAT7tW7rNcDukTiNOdRJj4acwmgOYnDU3UJ1wm1SEY9UEOD998+ZGpW+rWKuNf2L0ioS+wzzbSSbO1Ptw4X0VO+9yxXI6jNLq5XP6bxDHS5mMz5Q4FpttUfuxr9T/ZqoC1jmw5iI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786887179; c=relaxed/simple;
	bh=Unl00eAfFi9To3aFPzg9GlTfdXTVfm9Q5VowGJ6jvsU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Z1TtbIkbdcjnv0lUMVsFwe9WLcoUQyrr4joA6apa6wrk7KYeuh7DZZy98DLQDB/Yerzj53+I0mAXtp5rmJYag4FoBmDjk0X7tSa24GFjQlYH+5kQ2T+lwJK/tkDfPeic9HldcaeHhtxMDshZsvJtUEoNd5+jhMc4l+tH7oqdTd8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=cwHyiApL; arc=none smtp.client-ip=209.85.214.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="cwHyiApL"
Received: by mail-pl1-f171.google.com with SMTP id d9443c01a7336-2cca0c5799eso22874545ad.0
        for <devicetree@vger.kernel.org>; Sun, 16 Aug 2026 06:32:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786887177; x=1787491977; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=iR99/HU1Sv6a6aJcZCVFplbKZQ+GSq64X/oQnCgwbZk=;
        b=cwHyiApL86sfBhzc1W1MMTBWUe5DncvXyUpCWWhEE/ikaM8rNWNnc81jeSIVmZPtOB
         FeYIjYeiZ4XXzr53n0u67Fz82exFlH+3yt5gtvG99d3BA/3OynUhyzzwmsZgt36s80XU
         +94JcbTMRuYhj4Vdg4OB43niy4XVZgPCMgFTFj7JtzwlnqSxoyC4vFObCpLCkWTgdLZC
         yc11QOjH64hF1tFjRrqU+C2RUE3uxrMz0OaopierBn5nwxE7l9UIwhc8x8350rUNLqSL
         hSqYFt3y2l1uwAvIySxmUiffwy7zIST3ZqtCL35JXNcv+5S8HFxdepZrFHW/1h07iy2H
         zmKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786887177; x=1787491977;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=iR99/HU1Sv6a6aJcZCVFplbKZQ+GSq64X/oQnCgwbZk=;
        b=WeuHERKJySCAx908B9zD5Ik2WdS8oQBAPPJonqMPY1qqzOgEtEpCROVBY7/tx7CFnM
         uakWDF2h+yFcbQkt8s1MjTXaTqxncfUUgyDdvv3V/66xiidt/za+aRRB3ce4DR0shu7Y
         Zv02T9g8swrgk5O5R3/pKGaGh+aF89lRL6e/ENduzvGliwu4QSti7rHLzRfe+VqE7ywu
         zr5+AEbZtAc2vNZh/z51Ac7VDpShoAkwPZHT+VobUzH1Y6rNCCcECfhDegLkSzYfhq2X
         EZi5NkUKN0QbS12cgM/k6NxQysfVglzL1Q3+PV6izwM2rstoef1C2nwmZ9Og7QCX4rUs
         gLDw==
X-Forwarded-Encrypted: i=1; AHgh+RpdmfW/KeheMC6WdsvMTPjSaYxnVGWMTS/I8i0tlrNMa2xf/vLuDKQ88oQbdDTHY3qqVWYXQiq4p88C@vger.kernel.org
X-Gm-Message-State: AOJu0YzP17mGOo+WDsEewHcN/5YYOe65usX9eQxlTQlh3MK7ipp64ckc
	fm/iFTreyt73oBbCBa51nwCvkYO4HD1E/OfO+Wu9t2R2kUYQwz+xylFM
X-Gm-Gg: AR+sD11kN6G6Z/2tYllLZlSKvhqD0QQDfhKi/h6JJUW9dM0m9g9shO99StGaHpoA/cW
	A3sFn0qQjKFmPY/8SRXUZ9WqUUHJix+4cFccmQ9UWPBdUjSzH8o5KK3PG42IoCOnHy9Uyv8QnJ8
	Qnksrq6GNSWxYmgauRTvxtU3MAuR/eh3paVlVB9whXV/hdaA1wAb6tZEA/7IBCNc56iTvaGBDuF
	ZVmhAbF6KQudHW7Fd60NUzCOrs8/WvdKcmTmzHqjvVKyL+gjpRb8KJOZ9lkt7Nf4Ks/MQclcJyE
	G1ytKJ4WIzI8s+BND55J8DSttwxdMHN38oXvB+VHBXdLy0ZButWEL1eeK0WyT98BQzJJ6lUAqV2
	zkps5EyvTjolbat/B+eHxC0OsLm9JepmxbpG8S2aPMpjcCp9p5w2qkoxscqPN5htDpwqgGqrjlx
	J8ospvtH9kw5oF0vuQ4Bgh1mTo6njiepwouhEK9KgYS+LuEWJqFdap3b/8JF1IBrvlxxwAXyLFr
	DypkN+qbNua
X-Received: by 2002:a05:6a21:4cca:b0:3cc:45cc:c401 with SMTP id adf61e73a8af0-3cc71a256bfmr20716588637.13.1786887177481;
        Sun, 16 Aug 2026 06:32:57 -0700 (PDT)
Received: from localhost.localdomain ([157.51.221.131])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-320ea804233sm23599064eec.26.2026.08.16.06.32.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 16 Aug 2026 06:32:57 -0700 (PDT)
From: Sreeshankar K <sreeshankar0910@gmail.com>
To: robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	andersson@kernel.org,
	konradybcio@kernel.org,
	tglx@kernel.org
Cc: lpieralisi@kernel.org,
	robimarko@gmail.com,
	linux@gurudas.dev,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-msm@vger.kernel.org,
	Sreeshankar K <sreeshankar0910@gmail.com>
Subject: [PATCH 2/5] dt-bindings: arm: cpus: Document Kryo 475 CPUs
Date: Sun, 16 Aug 2026 13:32:28 +0000
Message-ID: <20260816133231.10875-3-sreeshankar0910@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260816133231.10875-1-sreeshankar0910@gmail.com>
References: <20260816133231.10875-1-sreeshankar0910@gmail.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Document Kryo 475 CPUs found in Qualcomm SM7250 SoC.

Signed-off-by: Sreeshankar K <sreeshankar0910@gmail.com>
---
 Documentation/devicetree/bindings/arm/cpus.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/arm/cpus.yaml b/Documentation/devicetree/bindings/arm/cpus.yaml
index 5be89c584..2a90af67c 100644
--- a/Documentation/devicetree/bindings/arm/cpus.yaml
+++ b/Documentation/devicetree/bindings/arm/cpus.yaml
@@ -212,6 +212,7 @@ properties:
           - qcom,kryo465
           - qcom,kryo468
           - qcom,kryo470
+          - qcom,kryo475
           - qcom,kryo485
           - qcom,kryo560
           - qcom,kryo570
-- 
2.43.0

