Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com [209.85.214.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F13D33D9031
	for <devicetree@vger.kernel.org>; Sun, 16 Aug 2026 08:12:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786867957; cv=none; b=oXL9doQ7mZ8LcXeTKlT6ai0AwKpPaVXIJ15me5JoRSX8caRWGBNTDCgh7ZNJqvRfmibKVK6InJKQQKvizFELf96DaqYjEuFxDgsBgj7KqGGWZS/bBnu+5qGOBUwpcVmIQPpnvA2FsEYYKI3OZoy1VUghhsxn6e+XXVb+NIkyPdY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786867957; c=relaxed/simple;
	bh=St8ucU3ojSXInIoaRiplnocZp7Q2Y7UGXGTdomltuLA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=NsyY/BL0M+ItpRO3xZjC/9hi2j26miqkSGSOQXXyKEplcb9KRoX4ybpRAjDzhsvPcDtpT4exUiJguL8cv+VjQkZgFtFrD7+xuVQ12zVW0uvb5W2wLXF7koBJFEfMsEziy0vdK59H/001kOsp0qCZ1LpmgjdW1+2oab8Nyj/OL/0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=HXQxitnu; arc=none smtp.client-ip=209.85.214.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="HXQxitnu"
Received: by mail-pl1-f180.google.com with SMTP id d9443c01a7336-2d0407aedd6so29863125ad.0
        for <devicetree@vger.kernel.org>; Sun, 16 Aug 2026 01:12:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786867955; x=1787472755; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=S/HU2YPUNtFosepQ51+dsKsorbBYkh3zE8nDrxs9nac=;
        b=HXQxitnuADuRiKgdwlteh81QUlGFfLu6IarXKOt0QVGoi4KRUxcXB68IdoMOSgVPth
         5n7vEjm3rd3+OmKafA23hpyELt5B5TXKIBhTAfEC2JlDygm4mK28MXj4Qp72IO4gjnRO
         FEb8RMpWKCoXOAgcLFpbuSW1Y7QGafm8mSLND4uqp0/tY7o1jjHy/nWisSZRDBUAZqX4
         1ptkxVMa/dIQQqWTmYOn+O3Rcr/4SujNkPd4SXjTltq5o+my5xhNReRRiaQyhdAJ++5y
         Lx4tM3bcqTyAYWb7IlLWmtgazONWDe8TReYPQO8th9hFfmkh8ZqCVEft9kDWakz6CiOo
         sEjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786867955; x=1787472755;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=S/HU2YPUNtFosepQ51+dsKsorbBYkh3zE8nDrxs9nac=;
        b=q4RbFXV0POe8El0zZBqJZBn31iUdVc4oox7Qmypu5uf2G9vR3K+KlFPy+V1zuAcCjW
         C0xRzku7YXyZ/9b7RwGeMudV39r4UFGs4e+NcSt7Mf+XxmkvNjfisKuYGq9Y+4k2FaeE
         GcN2W/1kNY8DF4T6E+2W9XHA2UTdO6eYXIc+Uqoz6xntsyYdBy/3qt3lQPSnANv5YVxs
         uMUPVFuja7LAPqs4dc4YHGSQB/pqiiR2KwbMQ8yRHufp7l8DNRi26+FsitXzBxtVqTaE
         cHAeIt6HlngispIlmfSwnTOPqxrQFG3iQD3zM9nxkpVu9TKt/PKISzcnv56zf+8THbS7
         T1wQ==
X-Forwarded-Encrypted: i=1; AHgh+RrHMnFcmj5rxQ4vwD93mFrumR3jVMYZYPRjh4QjNuPLnvd20I+kXV51cBuDhbMBfa/Gs2s5Kx/CpvHh@vger.kernel.org
X-Gm-Message-State: AOJu0YzuXo8nUDZSPflmLvSej9r2C83mfCi70a+r0/6+AOAoi2tcLeHh
	PaPRpsNLe1vVrs+oXr3Lp0vtQqkbegCUiISLFtSdQrxQpbSIogDNqsgz
X-Gm-Gg: AR+sD104SGw+d40ojkmet8LbnSN70qkNm4GIaV66hFQmVOItnTyw42it17tuQmvs1HR
	Bch1rX9CXkmLZOEBIWRL+/azUBc9EH8GdN+yvSqarRCXmkC+b3Pp3av9NbGptwpbJ6zNjbgjEyj
	q+G8mO82lZR5r+eAstUPZm343uffVgUA4lQCSW6y40uXUb4/9uLERYwDvyNyvkbglCrOAILcfPF
	/+CpoEJAp5OoJ9XlmmBsT991y2GLlWddNgWw/m1TCHygy7A6Wc+apuhgXJKiYxUVdeC5+oj3oh5
	qcj+3W0u08joeHNQPcAfaqt7dw1q7tfzxUbYgn3FOcSUwdYXoaKYBorTluCakFadYmPfHKzcJLs
	py9Sf5kEbNzrQc2icokQ7HFTtDuqoWQ50SIbN2F+4pjiaT1vOwLZ8abb3wRE3ilWc3RdVJ9Fuml
	+znrJV4Bs/jm1PFiHadN0TOem9jcqlqATCClaM6nZroD/nTjdQMHgRsRL2rBF6yOE9w+rW/Uh26
	vdWdlBJXNfb
X-Received: by 2002:a17:902:d547:b0:2c9:df1b:e948 with SMTP id d9443c01a7336-2d3b0cdbdcbmr209610275ad.4.1786867955262;
        Sun, 16 Aug 2026 01:12:35 -0700 (PDT)
Received: from localhost.localdomain ([152.58.201.186])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-320ea8fe3cdsm23716838eec.28.2026.08.16.01.12.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 16 Aug 2026 01:12:34 -0700 (PDT)
From: Sreeshankar K <sreeshankar0910@gmail.com>
To: andersson@kernel.org,
	konradybcio@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org
Cc: linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Sreeshankar K <sreeshankar0910@gmail.com>
Subject: [PATCH 1/2] soc: qcom: socinfo: Add SM7250 SoC ID
Date: Sun, 16 Aug 2026 08:12:12 +0000
Message-ID: <20260816081213.5495-2-sreeshankar0910@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260816081213.5495-1-sreeshankar0910@gmail.com>
References: <20260816081213.5495-1-sreeshankar0910@gmail.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add SoC ID for Qualcomm SM7250 SoC.

Signed-off-by: Sreeshankar K <sreeshankar0910@gmail.com>
---
 drivers/soc/qcom/socinfo.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/soc/qcom/socinfo.c b/drivers/soc/qcom/socinfo.c
index af418adad..54b1f8e1b 100644
--- a/drivers/soc/qcom/socinfo.c
+++ b/drivers/soc/qcom/socinfo.c
@@ -449,6 +449,7 @@ static const struct soc_id soc_id[] = {
 	{ qcom_board_id(IPQ8172) },
 	{ qcom_board_id(IPQ8173) },
 	{ qcom_board_id(IPQ8174) },
+	{ qcom_board_id(SM7250) },
 	{ qcom_board_id(IPQ6018) },
 	{ qcom_board_id(IPQ6028) },
 	{ qcom_board_id(SDM429W) },
-- 
2.43.0

