Received: from mail-pj1-f53.google.com (mail-pj1-f53.google.com [209.85.216.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 81DFD19CD1D
	for <devicetree@vger.kernel.org>; Fri, 22 May 2026 06:07:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779430044; cv=none; b=fu/JN7jJDBSr7Lt1isdFMS+P6zFDSOcNKI9ZQIevxyE9CeyEu2rdBWlEkmuUiLWjyNrszfK9tUOwhWa3S5mcHSnx6k7u13qb2DfT0ZuojsTxBv8e+/w/ED4VrrtzZruKiPgP/juibgeXu9+NtpPkRN1cyXYRNtyTaGopjSpU8/k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779430044; c=relaxed/simple;
	bh=E0iQhNcseBf9fUV3GBqGktJpy+4e0unmKUUFS541458=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=gyxn8VYfH9A85KjuuJVlGPq96JP/bFurM0T9p6pQZbOvTk4xb9Lpls1GG+r0i0mqBsJanVDCG6Mv76ErDMPw9J9sWvE1MVt+KWbk/njHbkh0edICryFwHHsKqiSDy13hBFG2Rju8Vazez1UhUnz8wTSYnX364NSfHL0tc8QgrLQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=NJBaR5ID; arc=none smtp.client-ip=209.85.216.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="NJBaR5ID"
Received: by mail-pj1-f53.google.com with SMTP id 98e67ed59e1d1-367cbac9cb1so6541810a91.3
        for <devicetree@vger.kernel.org>; Thu, 21 May 2026 23:07:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779430043; x=1780034843; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=erBAyPrO5roYO8QCyIMfGlSqzNtYHdtfH7kgf/9D/qI=;
        b=NJBaR5IDOHC6TdboMCEHZ8VzsjnTRfJiTigvtq6akHwbvGs2f9wWz2G+m5OOI2FbSa
         mYndjqRzndFaHslf8qAji5w6uE1S4kNgLBhvPq6rcNx9ecEe8koksl2BTnWO11USy9Ou
         OTb8k9f2od1e7xWmGMi9nGyAq7+A2ozyxDYXsXsOVKieg/4owMwpNcz0rjyXafW/1I/x
         UrfBCXoG+wftRyPLIv/8s8iCNplYO/MZg5rj8pjn2sKb1aWTnQZ8zibS6gvGFw2j3tdg
         VU3dJOCcaPkpbQ5/hZozi1dI4pXrssznyWk8Nf+U/cABputJJFr6/oOna6AgeYY+hA9W
         k0mA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779430043; x=1780034843;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=erBAyPrO5roYO8QCyIMfGlSqzNtYHdtfH7kgf/9D/qI=;
        b=fxUxZqicJ/mECsmXZBY93RH6dGHMo7AFeSvcvfiHRc5fpNZ2BqruuomvOWJ/cNLz4k
         ANsR0/2WRYF76O+koDvrnKLJqt/cBMJO0BBQ74uJvlzsneZMR8Y/LLhSO9+0cryVG5MA
         iLfdXXClPa/spNw8glAJrUBKOqgjimVjvjN7L4o1Xqdget92seXnKI6o8pIsZKDegyHM
         LPEy7phOMboB8qpGqugsmB8ww5dGH5Zi5ltVIPqKaKv05rewmqifkkc6SVsiXV130+aL
         xeNiqYDjevYm18oF2iWZZ1ICLDbeYgQCjI0EPQK6crinxZrUT/q4t2zkIeCathd6k8qT
         5F6Q==
X-Forwarded-Encrypted: i=1; AFNElJ/S7+w+yrKmGi/2uBcevBReSL9utg9SSsDEQ9Ymn7Dj1GT6HVDpRMsE8ZGmbUV5vrNRJW9tshVN6Xd9@vger.kernel.org
X-Gm-Message-State: AOJu0YzETxDXfGkD1O/HUoCHk8yPaWmvPdP+nQG6wF1SU4hFm3jCMUFT
	Gy9IVrvVuIJbtDaeLvm4Y3cOupcZprvRShlArvh4DK26JBv4eIiXyPiC
X-Gm-Gg: Acq92OGmDQ6VEB7DkyIXsmP3PzHdMlOjeImYdQGf7Iy/Gz+KBIG7vR/g8UC54jT0RY3
	TUCz4oC11DjVoBDn6uMC/CYpxHBC3EUiNlV4PSShwBQSzYRQ41UwXGWhMCYbivS+3C4yL+Y7F4M
	Qqs57Kf90riSBZXzJN7pAetZdXi3j+hJC0BaTvLTzOo9WkEc4mO9NXEccbFIX12o7YPsiqU//Td
	lhVIU5VDTbGyfpWojDsNYOaUzDaJmlUs/l5SzNGL/UoytQFrSF1xrSWJHOhnYEKh+m9nLKOx3Fw
	YwODfKibxMSbFP7CJp0pMbFc087CGC6n1g8sXpIySK/3MOjq/73EPy5rwWy1UBO0hZfhBA5WJtk
	leRV9vXmRhGYG5TQku4I4N7j4uKZJ6VbuL9oYSvCv/I+3iLFDvvULng2Hl0XnVwrZiMnv46ma6r
	r+JCtDWiSIpq/NLK5/9BcbbhVigb6qf5Ym51I9hUOSICdoIa3cSZdsjZ2HV8TL31oGUQ==
X-Received: by 2002:a17:90b:5188:b0:368:ea0c:1b75 with SMTP id 98e67ed59e1d1-36a676dc303mr2283228a91.6.1779430042774;
        Thu, 21 May 2026 23:07:22 -0700 (PDT)
Received: from radxa (122-58-25-162-adsl.sparkbb.co.nz. [122.58.25.162])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-36a7212aa06sm428572a91.3.2026.05.21.23.07.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 21 May 2026 23:07:22 -0700 (PDT)
From: Graham O'Connor <graham.oconnor@gmail.com>
To: linux-arm-msm@vger.kernel.org
Cc: andersson@kernel.org,
	konradybcio@kernel.org,
	robin.clark@oss.qualcomm.com,
	lumag@kernel.org,
	abhinav.kumar@linux.dev,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	dri-devel@lists.freedesktop.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Graham O'Connor <graham.oconnor@gmail.com>
Subject: [PATCH 2/6] firmware: qcom: scm: Allow EFI variable access on Radxa Dragon Q6A
Date: Fri, 22 May 2026 18:06:41 +1200
Message-ID: <20260522060645.4399-3-graham.oconnor@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260522060645.4399-1-graham.oconnor@gmail.com>
References: <20260522060645.4399-1-graham.oconnor@gmail.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add the Radxa Dragon Q6A compatible string to the SCM allowlist to
enable EFI variable access on this platform. Without this entry,
the SCM driver refuses to service EFI variable requests, preventing
the system from reading and writing UEFI variables.

Tested on Radxa Dragon Q6A (QCS6490)

Signed-off-by: Graham O'Connor <graham.oconnor@gmail.com>
---
 drivers/firmware/qcom/qcom_scm.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/firmware/qcom/qcom_scm.c b/drivers/firmware/qcom/qcom_scm.c
index 6b601a4b8..4702ad898 100644
--- a/drivers/firmware/qcom/qcom_scm.c
+++ b/drivers/firmware/qcom/qcom_scm.c
@@ -2320,6 +2320,7 @@ static const struct of_device_id qcom_scm_qseecom_allowlist[] __maybe_unused = {
 	{ .compatible = "qcom,x1e80100-crd" },
 	{ .compatible = "qcom,x1e80100-qcp" },
 	{ .compatible = "qcom,x1p42100-crd" },
+	{ .compatible = "radxa,dragon-q6a" },
 	{ }
 };
 
-- 
2.53.0

