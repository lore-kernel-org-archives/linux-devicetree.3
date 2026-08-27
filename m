Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 578F948F839
	for <devicetree@vger.kernel.org>; Thu, 27 Aug 2026 16:08:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787846919; cv=none; b=MOseTBdQU7MwiYRQ+V+qBrhEZy9cEY8ay4laLQfQVvMfSkfGObM1vx2+4CIxRF6BRpmNSzqfbTtJPQ/UyF4WVobvs/Xo7kvzKAIaoqa13k6o0VFXsn1Q8xKJnd2zv1giEvmmgqAMSqnAy6weo24BsLPDdeGgfG1KUUjrilIR7Ss=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787846919; c=relaxed/simple;
	bh=64JBdKFV0k5ypJWDkUZi9BoAaRy3vj5flkXzPsq15+c=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Ird4nLCscD52lwmQ9T9F5/IyCK6NWa/Zcd1TXLH8kh9ku/RlziPTuEhvDhwX0eK2AnGBZN3GT/jXWMzLnhGag3ln7OjcUDvSr5hHPTXIJzNhjg8zx1rQF0vIyTqbaozjANyVIjpdBkey50ba25CbYvNmLNAm4NM0no7kWMNT0vI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=pPF1CI7o; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=JYWDEmWH; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="pPF1CI7o";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="JYWDEmWH"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67RFclcl359158
	for <devicetree@vger.kernel.org>; Thu, 27 Aug 2026 16:08:36 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=LltqfmvyZbe
	c4Bgt7eBZwrXubHQDa7pvwd5LerJQc3I=; b=pPF1CI7opY3gmcOEv1Jilno3v2i
	VEBF+as3yqfzBh2zg2eYzZiFmFnDo+X6GsLvOvU9SiT4WmrOfQn5cd5TmzH/Coad
	26DWBpSBcoxynbm9jm2Z/6zxi16RlVDGJkDYtLkCqKJkef2JOLzhoE8jvzBmCxX+
	yxe/HWSTuXXi0lIK8SXphg2qG4dGFy1XZFUoDhLHpVFklJbwQuUrGSVHC7uwxYIz
	mSKLBkCac+xDJ7N12ZlLJUt58yo7UZ28bF58nk5Jfit+2BHfwFaiMuEGZPNK931j
	zNMO0o/W/+OZ4keC04GduHPzR580l37NTVf/9210ndWufByfzcqn+ES0lDw==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ganr68r2f-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Thu, 27 Aug 2026 16:08:35 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2d54187d8b0so112355ad.0
        for <devicetree@vger.kernel.org>; Thu, 27 Aug 2026 09:08:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1787846915; x=1788451715; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=LltqfmvyZbec4Bgt7eBZwrXubHQDa7pvwd5LerJQc3I=;
        b=JYWDEmWHlRL+Qb1Rcs+Av2z4Em6v1OOBCQm1HmzDhlrUlH5bIem6+U5WrYRWpSgy83
         kinxNXz6o5vvMB4nhRjVrMcXXol14A3iywXqi/cE3cISBm1vCKZ5rOcPx0UcbvgchXvS
         REMvo2BwieN1CFBxO2x3Uq1tUxKm3eUfkHc47d8hXd3Jf/gqA15Z3Gqob0kPrf2lXFLO
         s9IPut1gD74U4Xjcr8S50H4haSUYTJTw+fjvHmJXIVtcxL+4t0fol8YAY2+BvskWvIv5
         Jx+eyx0B0el7YuyUpgiDvIX0w0/hyRsdO3gUfLdEgOF9C0a5qbTHTDajsfjxy4ZcTE62
         OQ0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787846915; x=1788451715;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=LltqfmvyZbec4Bgt7eBZwrXubHQDa7pvwd5LerJQc3I=;
        b=RCU+Vf/5N3WgVeT27NPXDHX+Saq3KlMoe6ndJFoPdFHrJ3THzMd2fmwtQELfjlhlUn
         Rq1oUyej5nnoP7O+6VANjPzOobSZdCNgnUabPs6CwnrxmVUS+gXD9h1lWWAFn0tlW5D6
         2OC0zsM/QCED+CGSPkhNq0KJDqSjUZSoyFI5rLsdNYUYbGbo3V+p1Jsb25ppcY6IKH+D
         KFifpwbu3rdZROR4uCUahq0o0rREm5FMXXsjM97c3uLC9nUNu1KF7M7aHr5ThXqF7nnJ
         teTcVRPlLkNiCFuShZ0WDOQKQfjlA/DTXv8NmzJt6PBemDbqXmIMdhjfyXik04TjNodN
         yTAg==
X-Forwarded-Encrypted: i=1; AHgh+RoVCLuwOx/J45KxWWfkyEK4mDpg4kEqn/f9JM5ylad/anSviQX5pt7bvmnHn6BClckcaEXRoSt+FpBw@vger.kernel.org
X-Gm-Message-State: AFuF++lhWOKN1Z+ecpJZnRo+t/XWpxfHoTZDNApJzp5GXFJ3xUTokMam
	A1PyF7zlmOg9t5xi7wXmDvBUuOPUtjguquSr2ObN7v2PgVZvC1Vp2Mv6+TufMktxq7wP3+7JZ4C
	GQCaPivQ4L4HFuN/fgXoHQaG0AIPCXJZBqQjv9IhOV+9C+wXFDMUdUHnD7nsjhwDG
X-Gm-Gg: AR+sD121Nv20GdMXCBzHsFhssll5eNDfuORHIMCp9GzaJ/lamZ+Q50SGOwF5a+H0zgr
	a8KclPDHI+N0zXjcdyOdqZfTAd1DUrL9TxkVpAOo+3Q9LKjlO1gg373lvr+9jgIu++5jOKfoK8M
	YVQSf6WCfOjpO1cHm2hOc/NJneWHVXaL2JyGhZicNAnrK/QkXnu4uXGWmk8rVKfQDeHJvGHIaR/
	45zt4uCI60/T5Ntz7xQQZTi9NFEe2Fi/l9TnPNszYQ3gL5b/azCCsZLlJTMheleSubNAwkPIwxf
	Ob73eTdLCCS0NSZpiynD34iNybsMKFqkFhsk+CwHV9coGHefwLRdE4fAyDtUjQcZaqkdkKAk6yf
	NRq5RCGIkJJe/Xw38h23DCkt5cXzbUtwWHFaGvR+IBTrmlejRA2HIG70UUjU=
X-Received: by 2002:a17:90b:4fcc:b0:38d:ef48:b04 with SMTP id 98e67ed59e1d1-396d0f8fbfemr510643a91.10.1787846914822;
        Thu, 27 Aug 2026 09:08:34 -0700 (PDT)
X-Received: by 2002:a17:90b:4fcc:b0:38d:ef48:b04 with SMTP id 98e67ed59e1d1-396d0f8fbfemr510461a91.10.1787846914243;
        Thu, 27 Aug 2026 09:08:34 -0700 (PDT)
Received: from u24-san1p10108.qualcomm.com (i-global254.qualcomm.com. [199.106.103.254])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-396b0fd9085sm3245892a91.12.2026.08.27.09.08.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 27 Aug 2026 09:08:33 -0700 (PDT)
From: Linlin Zhang <linlin.zhang@oss.qualcomm.com>
To: ebiggers@kernel.org, axboe@kernel.dk, mst@redhat.com, jasowangio@gmail.com,
        James.Bottomley@HansenPartnership.com, martin.petersen@oracle.com,
        robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
        linux-block@vger.kernel.org, linux-crypto@vger.kernel.org,
        linux-scsi@vger.kernel.org, virtualization@lists.linux.dev,
        devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org
Cc: neeraj.soni@oss.qualcomm.com, gaurav.kashyap@oss.qualcomm.com,
        mani@kernel.org, andersson@kernel.org, konradybcio@kernel.org,
        bvanassche@acm.org, alim.akhtar@samsung.com, avri.altman@sandisk.com,
        stefanha@redhat.com, pbonzini@redhat.com, eperezma@redhat.com,
        xuanzhuo@linux.alibaba.com, linux-kernel@vger.kernel.org
Subject: [PATCH v1 06/11] scsi: ufs: core: add slot path to ufshcd_prepare_lrbp_crypto
Date: Thu, 27 Aug 2026 09:07:15 -0700
Message-ID: <20260827160806.1295313-7-linlin.zhang@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260827160806.1295313-1-linlin.zhang@oss.qualcomm.com>
References: <20260827160806.1295313-1-linlin.zhang@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODI3MDEzNiBTYWx0ZWRfX6rRWRgA+naUT
 F23LwtR48eoWfnJEtX5YLoUOnmy+EZui8n+HiLO2XpTlTvlUgyeaGKlvLuhr01SoWG4EgybqUcK
 yvDPZQXGzgox9Dl+cFmIdvtOvRJSXj5oz7D7WlfSTOig3xT53IeaqDfHkjVw8EBVCCqnfcwpz6m
 fzpKTGu0KQtIfI1DJ9YHAtUB/K80MJXaHnD6JRhfY1ZuYxVPYX9x/fne0RzHcRBd1gBYJlpUYzY
 Y3rqf9VRcSpM8Ma9tSPu5LuBc56vnM/9bePEW0oZTCRLJyVI2lGMhffOdJg1FOIAj06Bdoblbes
 S2O7twJ+nYyU/68qO0l8oeMLZ0hCl64zEbB2HhZalYXJZVHoEUcixYT9STbvPZ63o77HcZsS+vu
 8Q1pcLo21eqAAJufsnn7q9Ww8nSPrYogWtr/VxotcyDav53hA11mziwX4kUVaLSKS/whFmyRNSd
 mcjltDOn/n4BYkCx+Eg==
X-Authority-Analysis: v=2.4 cv=d5DFDxjE c=1 sm=1 tr=0 ts=6a906103 cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22 a=EUspDBNiAAAA:8
 a=UfCYJ6Unc3kZa_kcAOwA:9 a=1OuFwYUASf3TG4hYMiVC:22
X-Proofpoint-GUID: K1FCdJWu3lOi8PGfOEAle1iIS7rQPQ0h
X-Proofpoint-ORIG-GUID: K1FCdJWu3lOi8PGfOEAle1iIS7rQPQ0h
X-Proofpoint-Spam-Info: AW1haW4tMjYwODI3MDEzNiBTYWx0ZWRfX/fEFMWlSYs6j
 +mJHNH8mAjuTKYfEcQicicn8yl/ItEIi+9tAr8U9KzJQLsbYOxTirkKlLbQvR/1gh9tw7wPd3k/
 /vOpCdGaOtlX4HO5JOyo7c5WHC5bAxY=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-27_07,2026-08-27_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 malwarescore=0 lowpriorityscore=0 impostorscore=0 clxscore=1015
 priorityscore=1501 spamscore=0 adultscore=0 suspectscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608270136

From: linlzhan <linlin.zhang@oss.qualcomm.com>

ufshcd_prepare_lrbp_crypto() programs crypto_key_slot in the LRB from
rq->crypt_keyslot.  With the blk-crypto slot path a bio can carry a
pre-programmed physical ICE keyslot index in crypt_ctx->bc_slot rather
than a blk_crypto_key pointer.  In that case rq->crypt_keyslot is NULL
and the existing code incorrectly falls through to the "no encryption"
path, leaving crypto_key_slot as -1.

Extend the function to handle both cases: when rq->crypt_keyslot is
set, derive the slot index via blk_crypto_keyslot_index() as before;
when bc_slot.data_unit_size_bits is non-zero, read crypto_key_slot
directly from bc_slot.phy_slot.

Signed-off-by: linlzhan <linlin.zhang@oss.qualcomm.com>
---
 drivers/ufs/core/ufshcd-crypto.h | 14 +++++++++++---
 1 file changed, 11 insertions(+), 3 deletions(-)

diff --git a/drivers/ufs/core/ufshcd-crypto.h b/drivers/ufs/core/ufshcd-crypto.h
index 8f66db94e179..2fc5601c0f76 100644
--- a/drivers/ufs/core/ufshcd-crypto.h
+++ b/drivers/ufs/core/ufshcd-crypto.h
@@ -15,13 +15,21 @@
 static inline void ufshcd_prepare_lrbp_crypto(struct request *rq,
 					      struct ufshcd_lrb *lrbp)
 {
-	if (!rq || !rq->crypt_keyslot) {
+	if (!rq) {
 		lrbp->crypto_key_slot = -1;
 		return;
 	}
 
-	lrbp->crypto_key_slot = blk_crypto_keyslot_index(rq->crypt_keyslot);
-	lrbp->data_unit_num = rq->crypt_ctx->bc_dun[0];
+	if (rq->crypt_keyslot) {
+		lrbp->crypto_key_slot = blk_crypto_keyslot_index(rq->crypt_keyslot);
+		lrbp->data_unit_num = rq->crypt_ctx->bc_dun[0];
+	} else if (rq->crypt_ctx && rq->crypt_ctx->bc_slot.data_unit_size_bits) {
+		lrbp->crypto_key_slot = rq->crypt_ctx->bc_slot.phy_slot;
+		lrbp->data_unit_num = rq->crypt_ctx->bc_dun[0];
+	} else {
+		lrbp->crypto_key_slot = -1;
+	}
+
 }
 
 static inline void
-- 
2.34.1

