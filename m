Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.46
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793645722;
	b=Pj+m5YrwKYY5Ryxs/NL9qINWXmxV0g4T4lxlMkL5/MTSh3Zsoi7wPNlxoV9407lJHMPp
	 uLjavLHqDIM/R1d+DYbQYS65XqHtt4cyH9pbdadCBYX8d01jU15IYx89+IpppdtR9Sp6a
	 LvJdlxcY/Ufj95TrACHqkqTfTLSLZtOVSRT1PPzbfh1aV50IprsXEKo38LeTSws4jEw6a
	 BzP4Vop7ED9psfDSvrWe2R1qki89fqnV41rXg3owBZKz7cltdRheJ2gh3fCb2pguAlVYU
	 0G9LtfYqQSWxvxOomJh1Nj0mS3y0dEQCUhYiyo7vo912d3E2u9upy3kGzH8ErERDn/Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793645722;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:X-Google-Original-From:To:Cc:Subject:Date:Message-ID:X-Mailer:
	 In-Reply-To:References:MIME-Version:Content-Transfer-Encoding;
	bh=CC2o7x8TbRQPLTSxucMf934GUQljaJFM5e5gaMCtH14=;
	b=FfrCbGWuDf909g4dK0CVmimI2aCW7QLCn07+6ZNd5jHm9Sql4TmLjVtwtWdCVlzRpT/K
	 165PSsmlBpuOZtBZitLULkddxOWcTp1+y4xn7SB7AtUmhxZ5Zc3GgrOXPkM9U13aN5PCp
	 p5gy9FS3fwGbO+LHVukHMLLjReItIpC5cLT4OAB7SjkMa4HUWCzyZpKwrIRwKU9ZvfUCb
	 vLM/5gRiQgv/mCpcAU80arcQQIg06JEYQEamjrxGTVrQce7UHYtMFUCtXS5eVhQUi4Ggz
	 lTL6DtRacABY7TVGui08j6NWg/q8Jnc15J7h3bkConC0cMkZMRly7h4wM6JcqHYvqGA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=HOcg7Lnh;
	arc=none smtp.remote-ip=209.85.221.46
Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 775BF606A33E
	for <devicetree@vger.kernel.org>; Mon,  2 Nov 2026 18:55:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 775BF606A33E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=HOcg7Lnh
Received: by mail-wr1-f46.google.com with SMTP id ffacd0b85a97d-48afcfc4bf5so3466664f8f.1
        for <devicetree@vger.kernel.org>; Mon, 02 Nov 2026 10:55:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793645721; x=1794250521; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=CC2o7x8TbRQPLTSxucMf934GUQljaJFM5e5gaMCtH14=;
        b=HOcg7LnhQ9JtZYY6lgNw3Ay2bNRTAxDyemis2WtDzuZhR9YreR15nGz4oH66B84TEd
         2nqQ7Llr9LljeH//XuP0/DvOfn4uwR0p5h97bKAmJQwV6i59Sz6xy/hEXy5Jkscqhzau
         bbvzxkDZUy1vyGaE0dXCWjexFLfm0mwdLer6FO/9AOMr12vK6jjq3ScGhZ4OraL7yEUs
         JDt1VwbaYO7FKKhnqFZa1CLh8mhmEePKT6pA+F9bk2V9gRmTmr+dtDiPV3ES+0FbEi7e
         ZN5Hyv8ccQSV3WN5ojy8lGgB/9nxPOpOw18fka285pimFCz1iOfuV3InujJCE4fIVcI/
         UvKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793645721; x=1794250521;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=CC2o7x8TbRQPLTSxucMf934GUQljaJFM5e5gaMCtH14=;
        b=Hm0bkxi2x7Ju1xWN5bTaKgcgtjpuaqC52CITLqJQmRkZlkOkZQ4D94POvRtnXGRfB6
         JdVH4NyUbjiphjsGa3HvqQYke5xq4sD5ghWOZKkhtE5qouJ7N1hhJZALi+JFR59+2FE2
         Wm1RF6PQ+1+wuRZ76I3zvN2EpEfWI3LR2hTplNkOt7bifRyMHGdPeuY5RSCfBlgifgN5
         /GD+ZujBFesx/WBBNYPJWSi1e9G5bY5WqSXGbEfav40XXIJffMt2xmpjk8SDFh4CO/3a
         UWUe9NCN8RiwSnT67S3zjcKu1u19g5RR1oP+s14HBC9CTGKGbby8SvJjHvX0t0wszjUY
         cvJw==
X-Forwarded-Encrypted: i=1; AKwUvBwhh3CXv1Fog0KDJZplvj8x43TuTqxZLJ5wdMqH1pfY5Ec/QZQT6P0OF9y7dUCRwoQXsGFeYzssCasR@vger.kernel.org
X-Gm-Message-State: APuU4Z9YI7yeVIcOrniQr+FEe3D/LYU7bkrHnFL3FtSWZza+nCCX2eME
	6OB6qjwvYIpzGWs2ijcWBrXHzeFhKv8m4OwsSOuKF739mMf6qn/0vamz
X-Gm-Gg: AYBFou1Wdt9dnSwsHWJZnA9siL3KaWdSDVq2k4eD21JbD271ZEedT0YbdT3k2YygwZn
	U61aVq6HtAv3rvqSsj1lqbDtB1eBMVE4BO3LHhO+qfPm6L18jxR4JqkE1uXt5kEFqaDudFYXx0d
	w2Rk/WHcoGqtCd4PHAFc994I2DNjR4aabw3LW1m6430RNt++dd+y7eyAlidUeQ9JdiI9TQwoQP1
	TCut8jHG9dCfFqBCQd/sWo25PkQryyb9Y6M/Pi5QtSuDHNEPEGpGKUk4GRZhcsX8HuFjqkhv8kK
	RwOpdJChkiRhB0QXTeLqOjddK1Xae1l6qQ+fPvvu05rSTlSI7TsbGEBo11H0iOoJ1+9Txb1Agpz
	PUxywiphifdi6zAx45R2rtQIl9tBPobHFnQElDgF19Xhsohlu/AoZtOb41Rp7Zdo7x3ul3YnXkn
	wBBb8DMsb9Y7VQ6pNMIYzCfOSdYfEeE5ZFUIbGuDgpvaoUwI4TlaQe5LKPXKvE4zmuMPlUDYZvx
	9tciEsodZQzDxqnTo8fJtCgd0vGnh8q+ohLuZvlqL1iBCkwOFIWa5ba2OtLPWYMTYQvZAn9v1ty
	W6j7A9scahoT6gPz1Aq5mRA6IPFGV6K+sfkjppMFWBBScZPliNI62QcvJDdAevO9Ag8TRm5MVnw
	f1k4zzJLQ/N2jq9P4foFXkgraF20czI+x7W5JOdOecqTEi+Q4FZNg
X-Received: by 2002:adf:edcd:0:b0:48b:f08:8159 with SMTP id ffacd0b85a97d-48e6e502fa8mr19192373f8f.40.1793645720777;
        Mon, 02 Nov 2026 10:55:20 -0800 (PST)
Received: from Lord-Beerus.station ([93.66.71.207])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e71b7815fsm21965403f8f.22.2026.11.02.10.55.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Nov 2026 10:55:20 -0800 (PST)
From: Stefano Radaelli <stefano.radaelli21@gmail.com>
X-Google-Original-From: Stefano Radaelli <stefano.r@variscite.com>
To: Frank Li <Frank.Li@nxp.com>,
	linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Cc: pierluigi.p@variscite.com,
	Stefano Radaelli <stefano.r@variscite.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Alifer Moraes <alifer.m@variscite.com>
Subject: [PATCH v1 1/2] arm64: dts: imx93-var-dart-sonata: enable UART wakeup
Date: Mon,  2 Nov 2026 19:55:03 +0100
Message-ID: <b51bef917d08b83bd231a4a228fb2d23c19a858b.1793645417.git.stefano.r@variscite.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1793645417.git.stefano.r@variscite.com>
References: <cover.1793645417.git.stefano.r@variscite.com>
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

From: Stefano Radaelli <stefano.r@variscite.com>

Mark the LPUART1 serial console as a wakeup source to allow it to wake
the system from suspend.

Co-developed-by: Alifer Moraes <alifer.m@variscite.com>
Signed-off-by: Alifer Moraes <alifer.m@variscite.com>
Signed-off-by: Stefano Radaelli <stefano.r@variscite.com>
---
 arch/arm64/boot/dts/freescale/imx93-var-dart-sonata.dts | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/boot/dts/freescale/imx93-var-dart-sonata.dts b/arch/arm64/boot/dts/freescale/imx93-var-dart-sonata.dts
index 1ca3ec8330d0..d368a09dc916 100644
--- a/arch/arm64/boot/dts/freescale/imx93-var-dart-sonata.dts
+++ b/arch/arm64/boot/dts/freescale/imx93-var-dart-sonata.dts
@@ -385,6 +385,7 @@ can0: can@0 {
 &lpuart1 {
 	pinctrl-names = "default";
 	pinctrl-0 = <&pinctrl_uart1>;
+	wakeup-source;
 	status = "okay";
 };
 
-- 
2.47.3

