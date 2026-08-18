Received: from mail-pl1-f171.google.com (mail-pl1-f171.google.com [209.85.214.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DC3C843B4A3
	for <devicetree@vger.kernel.org>; Tue, 18 Aug 2026 09:36:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787045784; cv=none; b=b3fbUM4G3AYJbWe0EvTVm59Ujen5PcBb6dJouNogxoIoqXq0xXHikinbRAKbbz84D+aAepeu2Hj6VmjZEUCEfWZjgvNiHZPxXwv/5r4Xc5XYpQTZZXqZHUCkcvFeovtJxUV4QmSrPKSJ+RIko6VRyUdG2tThb1wk0gLyLCoILsQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787045784; c=relaxed/simple;
	bh=Mza2HwlLWqQRyQkXb1ziFQlfmfW6uf43YGjIlmV4nwo=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=OXuGeqYsmINr5Urw9x1o0tx38DFaQ6K41bNohbK3V7xt6f8f19kaNjGxiZefFHHmsjrh11fdLipWPv6YYzFc8WU/h3g91w1gByfPvP8Cfz5KaBzVcMyUmFyPqbP/6DcA56b/3jqW0p/jNmRa2KaNMNfyHEWvDHuu2XB/ZzEioU8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=cH6/ASkE; arc=none smtp.client-ip=209.85.214.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="cH6/ASkE"
Received: by mail-pl1-f171.google.com with SMTP id d9443c01a7336-2d5cad1a6baso9418325ad.3
        for <devicetree@vger.kernel.org>; Tue, 18 Aug 2026 02:36:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787045782; x=1787650582; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=OZxmP6J0pu/96mrheFiRTnOOfv+FgP/O5o1U6VRpU/0=;
        b=cH6/ASkE5hXb64D11/yrovmMEqgipgTw0z8c1Ohhg1qQ02jv15MmstBtspl322Vxfi
         26Y3Sgr/zVelardZ3Rwif1rAzMwKXbThVZmsA1v0mlVwucR6+BFMAQsR4ybH8eIQYIwa
         QNwjXo1/4SVRLEjmZLghKzafhSekDdSrglJy4qcff4WdwKYVBmfm8rPnFUxuVg9GvEsP
         ggDwnFniTJjLf3Q75yhR/Ax/XE4oRF3jv1TGzE3+K7AVbLuiWzylo6/yUodYTnAkhrNw
         PneBB9mVZpbZOxHQ12XXlHQoxoy1+hXqtyKxa20HxN11m9pMnXP77D9urJOX1YtwlNFe
         mVcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787045782; x=1787650582;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=OZxmP6J0pu/96mrheFiRTnOOfv+FgP/O5o1U6VRpU/0=;
        b=UeAZ34kj0qyWsfJdOMyjaegNseFZjoYrphvUlIbL0iS8FiQ/PL6OZTnScAvpnkYtbD
         AwlvLILZ8Zo4MaCU3Mbddx/Fqe9Y2BtuFuwZlb5fkiHYxifBrasnOzkAlVpm4XgHRFe5
         /glY4UALa/N/Hgb3Vfp1iSp1uJ3JkwCuVDqhqi0McNLocpckIW7VUCOZC/+hKsz8J8nr
         CUzURWXjPBC2LF+qekf0lYvRRHHYcb++mMbTO502mk6FcikWuBU/xdEd0qnB5qvHDvvn
         53/WnN0Il2MiJKDdTth+kT+PBG1FSsl8KQWVZjGoFnJhM3L5FnCMkq22mPvbYUSQIIeJ
         DaBg==
X-Forwarded-Encrypted: i=1; AHgh+Rr/uyQJJZdpB9bkCZuM6tay76YR8KuyDa4VbCrbPdeslZsT50WuT4mxw8yKQIz5S88UIm40p2RvLRNo@vger.kernel.org
X-Gm-Message-State: AOJu0YzNnjWzuEqtaSbNNner8Svjd7qkxn3aFO01c2rVnOYKcPSZVKSN
	1EhytkqukwCjl7enl/dPkKTQvAacTquiKfQpWZ0Oi+hRLB9CnOLSNlr99XUnYg==
X-Gm-Gg: AR+sD12+75hEuQeFG9Qfk90rlosJyjl3VljcF0PApBMvmm0JNlhF1MaHG/Dv05qNNJN
	gZUIRVb6HxfbFwONDSl4lsjXXK3+TjO9YiJ1y13Po6w970aN7d3b4sp4slEWSkEZz+EEKqSTiES
	Xh+XcFSlDq3dD6qpNQNyeE+6cDpxMKpgRCVqaEI0rERAs5hbv+rMFna8BE9GITXiUbeAmDyW2y2
	acJKEEunEFfpp4iTrb2/RwKTRy5a6cg6F0TTBEU8LvJTbC0gDYZwLk+l/kwp3dNbQq76c2zGGxW
	j92fju+mgFdBSrtSBin5Km6Hsb93eCZqvVNieQAV5jQlzNIH+zD5ZmnfZZzmNchS93eaClkQ7t7
	w2txrlVp0oXvxu/RSsI5Rc9w8eL9qeOaZZ0WKHKaF6G6QczbZAMJGt6h0xNsPAQl3MfmqhPs0+K
	WTclIpGQnoJD9WmcPQ3hqArSohA9b9R+yDFnAvirG2Cdytnl8M/c0qM8zsH7E=
X-Received: by 2002:a17:902:f549:b0:2cf:8131:75e8 with SMTP id d9443c01a7336-2d5c514d875mr89918405ad.13.1787045782195;
        Tue, 18 Aug 2026 02:36:22 -0700 (PDT)
Received: from thefoxflat ([125.165.209.166])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2d5bb51e0e5sm15171535ad.32.2026.08.18.02.36.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 18 Aug 2026 02:36:21 -0700 (PDT)
From: Reza Kurniawan <imkyufie@gmail.com>
To: Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Reza Kurniawan <imkyufie@gmail.com>
Subject: [PATCH v3 0/3] arm64: dts: qcom: Refine device support for Xiaomi Redmi 5A
Date: Tue, 18 Aug 2026 16:35:46 +0700
Message-ID: <20260818093548.27803-2-imkyufie@gmail.com>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Changes in v3:
- Add vcc-supply for vibrator

Changes in v2:
- Split the patch into multiple patches.
- Change name in Signed-off-by field.

v2: https://lore.kernel.org/r/20260810105337.855546-1-imkyufie@gmail.com
v1: https://lore.kernel.org/r/20260810062611.735673-2-imkyufie@gmail.com

Reza Kurniawan (3):
  arm64: dts: qcom: Add UART support for Xiaomi Redmi 5A (riva)
  arm64: dts: qcom: Add haptic vibrator support for Xiaomi Redmi 5A
    (riva)
  arm64: dts: qcom: Add notification LED support for Xiaomi Redmi 5A
    (riva)

 .../boot/dts/qcom/msm8917-xiaomi-riva.dts     | 37 +++++++++++++++++++
 1 file changed, 37 insertions(+)


base-commit: 6b8c8af514d739d0335f5579b585e02babe8a727
-- 
2.55.0

