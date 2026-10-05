Received: from mail-ed2-f29.google.com (mail-ed2-f29.google.com [74.125.228.93])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5C7F14C1516
	for <devicetree@vger.kernel.org>; Mon,  5 Oct 2026 16:43:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.93
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791218606; cv=none; b=OoF7hcrpvUmOXEgPN/YN3Yec73iWxZPV/fFYmd3CYAFJRm+FdOXhUamHPTmRpQjTw0JAIN+UJOK1TWC2G8cYFa6rfcJdfjOF0GmhqsgMtgosQF1OXiSASyBZGa8t/hzi0ShhvmXbgBH8UiIPoVtoMewta2SwzcWHi31ImYUxiwQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791218606; c=relaxed/simple;
	bh=YB+YbwoKBhI3W4nwrDoCGLgvOKJw1wBczHlEC67lwnk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ayhK1+1eRAhDoqOzhWitzXoZH+GT58cfEj1Lwp4O5PAZWJw2J2RylsPnQPIoCJOvnAzbSYxTezgcTFB7WFgaC4MxWKl0m16ihRZ/cnccrqGQ+tnlPSJCXxD4071RsfBNUUPBDZmDvZj+hUx81fvtKOOSuMjU0rX/JDzdHKN5t20=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=CbHxTNn5; arc=none smtp.client-ip=74.125.228.93
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="CbHxTNn5"
Received: by mail-ed2-f29.google.com with SMTP id 4fb4d7f45d1cf-6aa0ee64afdso2542493a12.0
        for <devicetree@vger.kernel.org>; Mon, 05 Oct 2026 09:43:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791218593; x=1791823393; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=K5qqgHu+1fJfvGHmeLfFQndeBQWOkuM18hB+/Gz5BUo=;
        b=CbHxTNn5gouwFLhqX6kvWfffsGp/cjztnVn4iVlCbwlU6rbZPiswRykQK39hwSVH0C
         0vDkum70MIfK8BnpRnZgTTIfVJcg2GABOIXNHlmn0vaV50N95WP12q/7Ep8XJGA+Y8VH
         JmcdahN5MFc9JQEGG1ESLBlfIzw84cRNhRie7uvKlD4jS2/Xr/WvjwRueBUwQGrqnk23
         +DnePaeozkosPPQCkzeNoIUmYUye9/PB6lARqeXHyTYz/6EZI8e8E9Gwn417i6GZZFFu
         IZvmFMiwcJgwkZtupiCdvrhUlAqMVrepnbnhAVsY3swrgzI1WXJ/Nplf0tXwJhsWGf4j
         ucKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791218593; x=1791823393;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=K5qqgHu+1fJfvGHmeLfFQndeBQWOkuM18hB+/Gz5BUo=;
        b=kI3e84z2hYTGGsYHg/YGYsp6oZ2HyD92rFB+aVGWxp+pa+iAhes/neVVQGcC3pgrZE
         HXriAQQbdOJOBhArBkMJieW7uCFWYjJ+XN+AJ75vjzFkPKhsge+BsV5knYK4a3/ZvM7Z
         /Pp0Ro9bVH3DSLapxr9xBsAPVX4QfNMfID5UVMFqiezJMPChfo3p8cUla2sOtITGtdhq
         CCbrkPR658lHnEWcNsivZ34Fcu7oWTvHxYeGyVS8YTIBeHvEcgBprDlPCgqu0WoGJPCa
         /2vwXLHjmJh4NrTvVBiQ2yIW5tpk7auG6JFtHze6aLMSa6KMfUHL7848mIMYvtgqtDMb
         KlNQ==
X-Forwarded-Encrypted: i=1; AKwUvBw061PfG7nxifiog7VKndTfPq7dcxV0iBg+JyF1kT948/qoyVezSSpR3LMqQSPvHuZIHfcDT3cI5pw5@vger.kernel.org
X-Gm-Message-State: AFq9FYINrEYehC3iZLOQ/LsZXlOzZY8+Scq+GgFpmlG0llKrJWy7YZjr
	fh7CmvmatPeHVLUNeHRblXBPQdQlnkrOh/n4NLuOXqSkYC//7x83PZ6v
X-Gm-Gg: AYBFou1aXga6K5XCUKdd9hMUfuMKFrcwsRh5EJz9vTl0UfHTdctzQQy/hqjbmoIVIyZ
	arNk8BAKs3Tqc2yUgDT7nnY67sjGcpiri3ou/eCdrdcGQ2snvO3zW/Xn7FVQFboyFgnufkF75Kw
	I84LIsw87nZ7lc+5WXLqMfjielzVd+GSZJXbvYwzN3Ahn8nf4DBLAqrLaH1yh45Gl7UZJxksmdU
	zNO/hzUx3j6lTOdmUwbdaZwiFU4MV0z0wHQRn+6txtdULPLeGb+ioC217MB8gok97cFXpWxgIH6
	2Z1H93sO6TYa3UVM07ykeZd8szxgkhDmGfzirItriCN2nvrGKtq/S1BBJiF08mswsyG2BGMrBod
	AmQO+wZ00nh3wBN33k4xA8JIaQRTceZZ5Mp8d1D/gGSe0F1a9py8i/LaPhLC8Dv/Y2m2GO3feUe
	sbieqtkZrba/auNcmkZihspVDQ9ty6NJUyp5XBGKs42L4manCRBA0hoPI/lYmO/U3B2BVThNrRx
	6zXI6/yuuDIOaRA8S7FOjk=
X-Received: by 2002:a05:6402:24ce:b0:6aa:734b:1a28 with SMTP id 4fb4d7f45d1cf-6af9e2ecaedmr7014561a12.34.1791218593075;
        Mon, 05 Oct 2026 09:43:13 -0700 (PDT)
Received: from workstation.home (161-53-210-87.ftth.glasoperator.nl. [87.210.53.161])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6afb021af56sm3485851a12.31.2026.10.05.09.43.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 05 Oct 2026 09:43:12 -0700 (PDT)
From: Stanislav Zaikin <zstaseg@gmail.com>
To: Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Sebastian Reichel <sre@kernel.org>
Cc: linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-pm@vger.kernel.org,
	Stanislav Zaikin <zstaseg@gmail.com>
Subject: [PATCH v5 3/3] arm64: dts: qcom: sm7325-xiaomi-taoyao: switch to device-specific pmic-glink compatible
Date: Mon,  5 Oct 2026 18:43:03 +0200
Message-ID: <20261005164303.1208127-4-zstaseg@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261005164303.1208127-1-zstaseg@gmail.com>
References: <20261005164303.1208127-1-zstaseg@gmail.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Switch taoyao to "xiaomi,taoyao-pmic-glink" compatible so
qcom_battmgr can identify the device and apply its taoyao-specific
battery property mapping, required because its firmware shifts
battery property IDs relative to the generic sm7325-pmic-glink
firmware.

Signed-off-by: Stanislav Zaikin <zstaseg@gmail.com>
---
 arch/arm64/boot/dts/qcom/sm7325-xiaomi-taoyao.dts | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/qcom/sm7325-xiaomi-taoyao.dts b/arch/arm64/boot/dts/qcom/sm7325-xiaomi-taoyao.dts
index 6f8bc65bb99b..bc4dfa49ef38 100644
--- a/arch/arm64/boot/dts/qcom/sm7325-xiaomi-taoyao.dts
+++ b/arch/arm64/boot/dts/qcom/sm7325-xiaomi-taoyao.dts
@@ -72,7 +72,7 @@ key-volume-up {
 	};
 
 	pmic-glink {
-		compatible = "qcom,sm7325-pmic-glink",
+		compatible = "xiaomi,taoyao-pmic-glink",
 			     "qcom,qcm6490-pmic-glink",
 			     "qcom,pmic-glink";
 
-- 
2.55.0

