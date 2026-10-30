Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.41
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793342668;
	b=preaKXe/q/uzDGg1blDHz7TEc5X+JGM0daeZLFmkP8NnyW7JoTV2z7YtN7Z9fAA3g5Ha
	 pWg7mojWJqVIERCpTuUY/ji/Ah0z+N/i5UlfK9iN3FikmHN7LhTrqI30nSP3LpRwpVw4G
	 yxmYAM8Pui+fugxKt7XyyrGlaDHulB9HRWB76V5DmgrfAAv8eReSi9fFrpqmJEVIAp2hT
	 T6i+AyRT9moE6TwSYa68+gC2mRA+nMVVD6+T5o6L9qKOdkuW55JqxLfYYIpBK0yU0fGY5
	 EiyO478H3jZA42AAdB20kaGZFf6ULmW7cGBC62bIQyCUEvvo0ojSJGndR3AMeZMYsiw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793342668;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=Tl6rc3WAxZp+WCBy7XVt8SwSQgu2t3lSHibD43bhBmU=;
	b=dLTgHtOhnGpBMFkRKKlXVBckLR4YLNSGR/6t2NScNS+p7ROnleSbCMWekTq8JsWQtOKu
	 mNgMWBh9GUSe7IFFw8HUWa87qUiJKfvohrJijHhizDJidcrHZcyO2bw96kdhKQBpRBrl8
	 tZ/H0gJXC+rsxXBAMZCbdMuGuiuah5orycVEHSi8CfQ244vMM+TGDq6PJElJEkE6h3d9S
	 dRJ6ZjKyu7oqeVy1wLrVAt0+YzdVB24X/yLZujENTfsVpMjUq6JHsTfigyaOZV/TvbeJu
	 FdN3wRid8dyNWBlAnPtaqSLXlDWwltms3rgT0mu0yFWtMvAnPMYPWiEJPO1DQg3uwwA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=l6aOiKdf;
	arc=none smtp.remote-ip=74.125.82.41
Received: from mail-dl1-f41.google.com (mail-dl1-f41.google.com [74.125.82.41])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 785E2606A31C
	for <devicetree@vger.kernel.org>; Fri, 30 Oct 2026 06:44:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 785E2606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=l6aOiKdf
Received: by mail-dl1-f41.google.com with SMTP id a92af1059eb24-1846bc43c28so407699c88.0
        for <devicetree@vger.kernel.org>; Thu, 29 Oct 2026 23:44:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793342668; x=1793947468; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Tl6rc3WAxZp+WCBy7XVt8SwSQgu2t3lSHibD43bhBmU=;
        b=l6aOiKdfh5XFeZiPLMgQFsiWOQZaspnVbO9s3wGBilkdw6HIvPsZG4QkxbZ2Cr/4e5
         j8GuPaQGW5TjJZVGV0S+qXwvuX0495rstsLHg8WYRnWnYeW0esrhhN8u/zW/VuVyPJ+k
         ga+Eagkq1xpofUHypYwE2yKq9BHbtTMexLizcCPkHv1UVG4ROVTsaA5OAyBiNeOBqdm7
         juCLR/WG/eaW5fcTX9KS5N41SNjOU2oevXI08A+4jQuaScs9Xw0YhUSZcW9jqn0WDnI0
         2zLvX652njLJQbXbWbmu2pPjhDteHUPXUk8694nMvzK/NZrs+uLc1aFcBDl6M/qGe/cJ
         V43Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793342668; x=1793947468;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Tl6rc3WAxZp+WCBy7XVt8SwSQgu2t3lSHibD43bhBmU=;
        b=s3wHFRMTm/yOvxCjX5OIw+hp2CIIdjud2ucrbC+yPd6ami46Qep4lK4rsQ/RiTXbQ1
         Df7BLYqKkH60Wt+1Bna0+XWkIcTMrWTX1miTD9mQf4bZnA6nQxZPDkQybp5XYEHRuFGA
         hf0eTjO/PXFue7i1BhUTbFIbpknRgsCdjn0DaDGR8MqjFQrOhTZ5mJ0DoRf4z3uvbq2J
         pJ+TYX5uHlg1+TJ3fy2wTgc1ngjA/2LMLSdzhX43apchhHjAOeg7CPBzsZAL8OfCfNqC
         IRC5KhxSA+mX9kQpUeH+nSyi0369BUwGGbZNM32fgR6rdM3IBn64iA4r9I7fCcZ05yG4
         IOHg==
X-Gm-Message-State: AFq9FYKRWMreP2/1M0q9bfuro5HzwgxcybZKHFUZqQyhN/s7eBIQu5Ik
	iFMRlmgDBfunK9BKm8CY+xV+ICZHINw4x//rT/9S3fcP3YivIBICL9/G5Qo2fY4R6eM=
X-Gm-Gg: AYBFou0mvL1mhqR875slhiVsxN34UlU3qEMGGpe2pvfm0byR1e6rTf+zR2j0IGNFnTb
	G5aVPsHIhfxcvPsA7vKLO7JHXd8ZlitDrh6I+fxpq9upzEnzIiSqy8GWtamZKxt4RGaiG9y8zDa
	MpkkdbhsT9X/u7o9ByYDOLElPtQ0bf9sdXcq94NfPdMKvYx9GJ4mAIkXkiT5T9sGfoAeFLwohVi
	+f+PhdlA6nTdoEr+3d+y3PQS9Z+8aM7igrMpkzE5vemoux0HHrXw9CAUGXcyx5wNiTjtK8M07Xy
	E9JWunqd7BcUkS6c8/N6VelaIcDrjQMIZyiCtJqTEDxeH3L5Pt74L5LhjSrFfQL7vLihBUy6xnL
	bVyQ4gPUh2y4i4PSM8Fgrv8+8py4leCfRe0HSWyrlvEzjAWsNoIRUejelROeXkC81tWqLKsRVZn
	49pLSnDBkBmYUaQcX+9e0feDYymRZNCKoE1VCrD/wEDyN+5jvpQRlBy3Q2ggf90GJYcylreBoek
	egtgRopyTNTnzojYyrGNX3+GS+4He5Rd0scu7Sn63EgliePK1VPHZbT8bovLwWcIZub6M6GZDPu
	ZKWIl2JazaY3VeQD6iWWAI3VJrQQ9yZmgKrH
X-Received: by 2002:a05:7022:158a:b0:185:869a:8c64 with SMTP id a92af1059eb24-1ac56ca0239mr2183312c88.1.1793342667529;
        Thu, 29 Oct 2026 23:44:27 -0700 (PDT)
Received: from ada.lan (cwgw.codeweavers.com. [4.36.164.2])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1ac1b38ac58sm4173902c88.23.2026.10.29.23.44.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Oct 2026 23:44:27 -0700 (PDT)
From: Kaipeng Zeng <kaipeng94@gmail.com>
To: devicetree@vger.kernel.org
Cc: linux-arm-msm@vger.kernel.org,
	conor+dt@kernel.org,
	krzk+dt@kernel.org,
	robh@kernel.org,
	abelvesa@kernel.org,
	konradybcio@kernel.org,
	andersson@kernel.org,
	Kaipeng Zeng <kaipeng94@gmail.com>
Subject: [PATCH v6 3/3] firmware: qcom: scm: Allow QSEECOM on Acer Swift Go Pro AI
Date: Fri, 30 Oct 2026 14:41:49 +0800
Message-ID: <20261030064149.14736-4-kaipeng94@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261030064149.14736-1-kaipeng94@gmail.com>
References: <20261030064149.14736-1-kaipeng94@gmail.com>
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

Add the Acer Swift Go Pro AI (SFA14-11) to the QSEECOM allowlist to
enable UEFI variable access through uefisecapp.

Signed-off-by: Kaipeng Zeng <kaipeng94@gmail.com>
---
 drivers/firmware/qcom/qcom_scm.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/firmware/qcom/qcom_scm.c b/drivers/firmware/qcom/qcom_scm.c
index 43e250faea75..4552da4284ef 100644
--- a/drivers/firmware/qcom/qcom_scm.c
+++ b/drivers/firmware/qcom/qcom_scm.c
@@ -2225,6 +2225,7 @@ EXPORT_SYMBOL_GPL(qcom_scm_qseecom_app_send);
  + any potential issues with this, only allow validated machines for now.
  */
 static const struct of_device_id qcom_scm_qseecom_allowlist[] __maybe_unused = {
+	{ .compatible = "acer,swift-go-sfa14-11" },
 	{ .compatible = "asus,vivobook-s15" },
 	{ .compatible = "asus,vivobook-s15-x1p4" },
 	{ .compatible = "asus,zenbook-a14-ux3407na" },
-- 
2.53.0

