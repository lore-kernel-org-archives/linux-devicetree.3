Received: from mail-pl1-f171.google.com (mail-pl1-f171.google.com [209.85.214.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9E96F380FE5
	for <devicetree@vger.kernel.org>; Mon, 10 Aug 2026 10:53:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786359229; cv=none; b=byDK/ihiBU6F2d1xHZS8Avw4iePXWkKe51yvkzYImkLwBjx5XD6NODffa4/bcVC7iiqBTMBzR4SB1UsdCmlvQDKrdumdhSjYVerkRELJDRpooGO/4Q9dqoMznzNWmD9zinDdjQnIRVWsfCajQxmMyuaOATgmTUJYu3JvBPfLmc0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786359229; c=relaxed/simple;
	bh=i1M1E8zijlWdTYpKqBujo4A/2FJRQomdiIDBmP6MVkM=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=XdFdqorpRSk5Xd7i8IWFcH08zrV+4OoDIZmQS7OhU6IlDAxVkbnDWAwdD6GNLk4XlSyQeZ+ukxo+6boyEj6m2ORKDSfpTAhyEdP8a6jwQubEBgyKfIbpnReFyqnWicD76vDaoNZlXF2piMUDbDisDq0sC6P1RljB0h6j8IabtXk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=pPN2QZvY; arc=none smtp.client-ip=209.85.214.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="pPN2QZvY"
Received: by mail-pl1-f171.google.com with SMTP id d9443c01a7336-2cacb8416a1so16432155ad.1
        for <devicetree@vger.kernel.org>; Mon, 10 Aug 2026 03:53:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786359228; x=1786964028; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=NqEE/rlSHqts9Y9z1qNeIyx4k5m9J5U48Lwk2zOBo1Y=;
        b=pPN2QZvYTBjVd/kn9X7pZbAJXxfpsxl7WbbyWyNeUPiavuj1D+uE8zxuFt96zUqT5U
         +2BhQJgyGQFJDx2FIoYCGy16bG89v94jwEW6RejbNNqRxwFswRbCcor2NIN89aWUJmot
         CfUjf7BDDX+FNJIZhF6qC5ClyWCxgzF3BO2PCyUBaySmgyAFjKZelYBKWnSh23+bEOx2
         LBBKZQCZYk/4vq5buC/taRer84POesAb4aW+iuEskKwFQV4Sl/SOVrJ3y2Zt8OEedHqs
         kOjBCAclNlc9Q7s98I4COu23nj9P+InxMeNAglq2p+wq9//Lq+Ux6q/u3NLAgHBcM+ij
         pOgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786359228; x=1786964028;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=NqEE/rlSHqts9Y9z1qNeIyx4k5m9J5U48Lwk2zOBo1Y=;
        b=dZjtLSvvgQLZUb06wDD9ZwCF6e+8Sv+NbYp8vHo6N39vvu3DU8bENEVlkNRqkCwLq6
         rjkFGUym+mcKQtZjUnqayxvCvuV2yEwO2uSfFSJ5dgCec2XYw68pQeFdu4Yxteznbl4I
         iDHi2PA5EfFtWeZMaf5w6FK5wrDDOX/SPeh7pEFBC8VzxnJHRSua+wgHzNbvwdWiyoj5
         kNBPu9GZHU6wdhdiL1fB9Z7Ci8BZNdJ+xRj3939OwOOKw52RMRoKSkQ+K6p3fXOody+R
         hPhe6mlWGUPqmkPTY0+5wh/Gg8Hcce9K4GbfSB07NGKpRAsxklcONQd4xAEs5v8Zqmrz
         yaww==
X-Forwarded-Encrypted: i=1; AHgh+Ro6DPZCo3BRjyJhJMITRmGeWdMlc3iMT9i/xgNIXNFxMfJ///qOBrCc/OrjSjviMjMfxjJA97K5cWQx@vger.kernel.org
X-Gm-Message-State: AOJu0YxKMUXu2ZYoyszYV9uCgBKO4x6GoZekyesSlP9qMR+FdzPgfLAu
	IhmWDzydfSWyAdwGZHW/28TZ3BPM4ZLZ9i1wueU9WbjR26LnL/KZhhNW
X-Gm-Gg: AR+sD11ah63uR2zY9EkW1AcU0bAf0/jbuTVBNXaD664ChMl6n153asb97s55f8ppnUc
	+wBU08JkLqPmG82Gue9XfLQ9FZjYIbpYrIiilfZUCm1FfoGrBhR9+aeoAJ3OKfNmFbmx6Tql7cZ
	a5W6kQzZSfb1F0aXW10FUKEUDg/oWWEdDbLQ6INXN+0DEoDlFZkgu3B24Hj/kMPGu7UfNQKCGcB
	+5BiBdDPkrLUdFlkL7ql+a2+ITgfl6IYIDOSJ2YZhd67/0H2OyunMP/qHYRwbav1ZnLSIT/2vE+
	IMZzuLSB0luAsnE37JL+bn4ZBe+bxKp7L3aOI6k3tW65NN+oTM5ppiwQd9ibAMHSfKsTh1POwLh
	mpamJGqolcoVCvCiUCaQV4CfWMdRsIFs41kI6iuGL6LvZJtu4+PeUDtsnWmdcb/nmXUw3czbRnX
	mdq86EMyq5ci5/vHIxGDvzhLNYv3P2do8/SSnyaQk2q+2J41Hzmwo=
X-Received: by 2002:a17:903:32c5:b0:2ca:ed57:8586 with SMTP id d9443c01a7336-2d2a8fd38b5mr220542295ad.23.1786359227964;
        Mon, 10 Aug 2026 03:53:47 -0700 (PDT)
Received: from thefoxflat ([2404:c0:7028:5cc2:57f2:a6e1:6be7:bb30])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2d15ebfcb2fsm32890075ad.55.2026.08.10.03.53.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 10 Aug 2026 03:53:47 -0700 (PDT)
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
Subject: [PATCH v2 0/3] arm64: dts: qcom: Refine device support for Xiaomi Redmi 5A
Date: Mon, 10 Aug 2026 17:53:34 +0700
Message-ID: <20260810105337.855546-1-imkyufie@gmail.com>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Thank you for the feedback. This is my first contribution and I'm not
quite familiar with the process yet, apologies for the mistakes.

As instructed, I've added my name in the Signed-off-by field. Aside from
that, since the changes are isolated from each other, the patch is split
into multiple patches.

Changes in v2:
- Split the patch into multiple patches.
- Change name in Signed-off-by field.

v1: https://lore.kernel.org/r/20260810062611.735673-2-imkyufie@gmail.com

Reza Kurniawan (3):
  arm64: dts: qcom: Add UART support for Xiaomi Redmi 5A (riva)
  arm64: dts: qcom: Add haptic vibrator support for Xiaomi Redmi 5A
    (riva)
  arm64: dts: qcom: Add notification LED support for Xiaomi Redmi 5A
    (riva)

 .../boot/dts/qcom/msm8917-xiaomi-riva.dts     | 36 +++++++++++++++++++
 1 file changed, 36 insertions(+)


base-commit: 6b8c8af514d739d0335f5579b585e02babe8a727
-- 
2.55.0

