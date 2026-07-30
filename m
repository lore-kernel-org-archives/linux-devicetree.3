Received: from mail-ed1-f41.google.com (mail-ed1-f41.google.com [209.85.208.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3F7F93F9F22
	for <devicetree@vger.kernel.org>; Thu, 30 Jul 2026 09:35:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785404112; cv=none; b=u1SqQIzW7aHtYVpcx0GmIZfiH+DBE4tezUeTm22MbMS2MHJ99KDqYYvyMU1Mynhm+ogMCd62JA2EzhAs9zk+s1ZBvLyk91b3TmuEHeJMtVYi2kt4CHhhpPnmsyRYzgaugfKaQev6QKRlNMW0ZE8XAjqDN9CKYDMiaoHE4QwZASQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785404112; c=relaxed/simple;
	bh=3ReRcSOymyULMja+V0YmUrgeSZE4hXMAgCGFeJtA1uc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=T8U+MuOHYgUx+k45EytzXPmrzeeO5aFlSIGbnd/VZe3JZmSWORMNYF6CD9ZkJD5CwppGREYJHm2QIFJtQJF6+lRaFerkWMYJLS0SCaV8CzlWt3hdlhnJ4oesckzcuDrf9uUnNdPePg5jybZnrlN5XnuAdmkpqI+fs4z3sE7gfwI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=YQkBZbmc; arc=none smtp.client-ip=209.85.208.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="YQkBZbmc"
Received: by mail-ed1-f41.google.com with SMTP id 4fb4d7f45d1cf-69fc856b00eso2002621a12.2
        for <devicetree@vger.kernel.org>; Thu, 30 Jul 2026 02:35:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785404108; x=1786008908; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=wkDRMO/NHA8kCIXBimZ+z8/mCEPuG9r8mSJg/GLK9jA=;
        b=YQkBZbmcRi74GAKtgFKH4HVKrzOiT9W8a3T/5HryZI09u8jbQ4nQhmflf7hsmL1PkY
         2hIs+IV53gFhzcrTZtXU7RLIRsuc9GmPXjvbJI3tFpauw7b+RobAtDDHYNOr2eMoF0be
         DlSaM1/iw6ZeMy2aNV8TLNJvUTJni50Nim/uR/qYLTUOsiNwxDMml1/8RcWommBVN4n5
         Benp2ofuiXoqIs1wHzDdzroleDVAEd83PnSHDxmrU57GMB4DgjlOK4K7NCCfEat7GYBU
         JLfItZFmjoSBx+skQ1ZUhCvWEWorIYbi06Oltyv3J8I0Bs80nRmlw2IJsLxfhMP0n/WQ
         YrYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785404108; x=1786008908;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=wkDRMO/NHA8kCIXBimZ+z8/mCEPuG9r8mSJg/GLK9jA=;
        b=IYpyIn2rrFV4sMra6mhWpk6VGmR6NJ8kpdllkM9tBWLJzJZq393Zwm0xBOBs047cQg
         lexKFi7fsZVo1wnw5/3jfHJT8CvRa6RQjhCI20H6I7/X0gpQeQfUvCRLLXftSmeulu7U
         hqEQkz1sJ/lRWzA8qmegsrWJ3A5/+3H3SmB7pGWFzSscBkALs2//L/awWbGqZuYZl7qW
         sIMuyQ/rkTOMZnUt5x4fl7mmUUXdgl6tOVBFxIWr8XDMNx+eaFDUfSAb5hM31pjRaGmq
         14WaB1UF5FSY4gzcIxWQ4/aQLBleyUQ1g0Qs1UZ+JyFom2Vw5mUxWCcgBjCoRUpnbpfY
         9c7Q==
X-Forwarded-Encrypted: i=1; AHgh+Ro/dpNtxiQwdbmfX3LfcdecRobZillPNkVUSMiV5MmBILh7zNPTXvvjoOVoxI8u7i6nTpLQfT/JRdkB@vger.kernel.org
X-Gm-Message-State: AOJu0YysxE+0LXwgVXz+nxTe496ZuFC+ZyKXyfvN27yW6iMbIDQOaQ56
	yWFxDwMa5fOSu4h8NZcq6uoSQ/J+ncUuDvs1Ry8OwAX3VsEc4tN0lv36
X-Gm-Gg: AR+sD13bya2CUaGaxmizRF1CYEx2rC9xriS3iDPUH+leOG8MzIPV3bkvl1h8eAXPbTk
	25eKaw2AHMmcdw5xjtjjfoEMtO8+VUqiNqbkodKe6oGgDWXyYo0+Awj2EiCLTAw0Sw1nMqXV23S
	Z9ZaKFJXGpluDIUnBS46j2PizB8jgStOEFGOQNp1crrIiOVgnXkfZOKJjbGsE3onnMNfPO469Nb
	+rR4vxitEsu82lbiz4HTORhfjGHrAm934amZscGeybN57FeQTcRw/fycjQwMdRrypd7km1wblGT
	TgF8NQP9A8dvmfV3sUjPFARShwJ0dinU1+FSmaDea1xlKJml0A8YZbbVQtHUuK/RmQ0TCzAOo3c
	KTGkLCMVW5vFzOsmQWD+jaq9MbAabYY7fWVbcvSBq5rq/ob6YN5ROKXFSh/uOHhcNS43ho0sx49
	1j++ZCcSmM9ymFDoAPXmPsQGKfz0840h1nR6CYFtj+Yhs8bSglzRCumldV/JufkQvJdcBCHyjrx
	Csa3Edy/ipdsKnsXnLR/Q==
X-Received: by 2002:a17:906:99cd:b0:c12:979c:5a5e with SMTP id a640c23a62f3a-c1fa50fa7b6mr110666266b.0.1785404108221;
        Thu, 30 Jul 2026 02:35:08 -0700 (PDT)
Received: from workstation (161-53-210-87.ftth.glasoperator.nl. [87.210.53.161])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c1fa8577e78sm46733066b.20.2026.07.30.02.35.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 Jul 2026 02:35:07 -0700 (PDT)
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
Subject: [RFC PATCH 3/3] arm64: dts: qcom: sm7325-xiaomi-taoyao: switch to device-specific pmic-glink compatible
Date: Thu, 30 Jul 2026 11:35:02 +0200
Message-ID: <20260730093502.689505-4-zstaseg@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260730093502.689505-1-zstaseg@gmail.com>
References: <20260730093502.689505-1-zstaseg@gmail.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Switch taoyao to its own compatible so qcom_battmgr can select the
taoyao-specific property mapping added in the previous patch.

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
2.53.0

