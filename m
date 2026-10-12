Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1F2B846E01F
	for <devicetree@vger.kernel.org>; Mon, 12 Oct 2026 09:17:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791796640; cv=none; b=cbGGnhvSZQmKZeZ7+vCD9Vy1XHLtBGMEvLGF7b5tyPoV0Xk/AOgQSC6U/FbHCeI/kpltoHafEZOwOFuEmWGcbMsxdR5Fb53hMIq/wcRhG46TjN+pbQ+cey4StAiYNTUGeXiKj24Y7rR7scqxk+jLc90iCzJ3Ih9K/Oq5o41USvM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791796640; c=relaxed/simple;
	bh=t5/mj3Sq7aDs4Mlfmy7kHuVK1DOPLoOZndF1AvJXS5w=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=c6Q57ptA5t8/mhJKHXewf1pHl5mDZLD129g8OFCeiwYGYaO0Uu2XQ1VyBnRGb1XalB5B6+LZbwLPEZoYs0XqgMylLD93VxPZShX7nmwQawdqEE/trGqm70f1SRvZ6epWZdhuvvxm/GwwowRJzYjiePBu27WCmA7D87huCb1OmB0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=JlXAWjGA; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=h0Ta39X7; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="JlXAWjGA";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="h0Ta39X7"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69C8cftg954971
	for <devicetree@vger.kernel.org>; Mon, 12 Oct 2026 09:17:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=2q54VpFxghh
	/r2vqer/NoH9EgB+W1mrhbzT0q1sHPr8=; b=JlXAWjGAkIJvbqx0eMAmUG4J0NY
	63xfw71Sy6OSuW/QXWaiiGGOCj4LhZFJzkieqUJcEbLMJqSm5/S4j4RP46uBkOTU
	PCTvzzBEl+8yIteRDD2H9U9p1bTQXaOtk6TT4alI0+HeBco6G6xQ82eCqJ9dLMxQ
	dJN+ILs1NDsgTFKuR/czSc6B5UhVEuAkBW4iUZ/cWZ+JSNloGhUvVxDB7G/xGi0i
	Y03hC5SMA6Oj0iGk3cOOJ5IcAh1WD4e5QAe6vYxCv9gi0voxoypecTSjrLifLCwL
	8sCev85coLImQvKyHBT+mOYpf9q/1Tx3GxkdNC4D9zNDvgeUeNBx+ZXJscQ==
Received: from mail-dy1-f198.google.com (mail-dy1-f198.google.com [74.125.82.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h8v7kr54p-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 12 Oct 2026 09:17:16 +0000 (GMT)
Received: by mail-dy1-f198.google.com with SMTP id 5a478bee46e88-30bcb065bfdso3626020eec.0
        for <devicetree@vger.kernel.org>; Mon, 12 Oct 2026 02:17:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791796636; x=1792401436; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=2q54VpFxghh/r2vqer/NoH9EgB+W1mrhbzT0q1sHPr8=;
        b=h0Ta39X73DbvU/MhzdX/aBkZsNyuv3zO6okv/CfPt2fEFwmwbwQzekItFdwofWh9cM
         4UNIXcS1QG/wo7J61/O3xIuI6DSdVx/YMSc5k/SiN/AVgkXo2ijH2n3OzVkdXojNEgJd
         L648smcGQRogtkCaK/DY96Ja3qSHPE4hgHzbdEmlIErH8KoGC0YWjzWlZaBa5OlaPybf
         L/Os6p3S3ZXdE9EiHabxnLKjTJRBngYCw2cv6hP8mARAFCmMDLrSqyLgsxxPk6o/p/lf
         odz5lTFyx/qERhX8GnJlZMN4NxX3ww9v1u15hEV9ub+0bwSOTsNtPixnAszXjnMPgWzB
         TYYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791796636; x=1792401436;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=2q54VpFxghh/r2vqer/NoH9EgB+W1mrhbzT0q1sHPr8=;
        b=TT2OFc7Cam1xRs1FwrwA3DDAuPlTbY4S2v7EPmtumCfRd1aLQcpQndAmTBygt0jGX3
         MJ3R/aFs+RWCaYF+mRuZ2odf7XSYxG8lQcHrY8fTWjsQTguTZYRdi5g/AmmhjE/9itLi
         glmhkjvY7ul4FKpYbQgcb8m6yVpS+zBsV2xPa0m4XhTSnTPPECfkgyY87KeuCUNU8bv4
         U3kXPCFhHtfqT35FZ66ddkUJ8bsrEtBnnQ5P6arhaNaW92ciRzT1GKutEM5unlKtyrQ8
         yn4Ab0XdepYRlhiWQ02rVKxDOkYI1p5bHJQazbDf+FAYnrGxZSESX5Odo2/U0Qmc2rUn
         sPUw==
X-Forwarded-Encrypted: i=1; AKwUvBztwdzh0P4LevuVvsV0HA8RDDjvrcmTajvE0BE4ydASPYdP3m1RYzB9SofuXb9jwcaK5XPoSANE+lnI@vger.kernel.org
X-Gm-Message-State: AFq9FYLZEfzgV7kNDTOJqLmqwB/lXZlZZEXuSkopwRf26VsrVzei73di
	gi4wQ1t4jEQ/4PVkr40CSyBGJE2cwxMh5asQZ1iiARsehe5odXXEh95pNze2ZcXMksI9D9Ea4Ql
	zOGREyvluQ8rT3ZYEh3fwQl+lifoal/NiiSwPlSoLTjYtvwRZcgb1QF2GxWbe9EmC
X-Gm-Gg: AYBFou0T2G+3uT8L3U119GNOaWUgHEHKQI77mkI7dyjkxUuW48GoXaZMMF1gMj3UXSy
	wQhqWuCrmNcIaAvrIW8VH+NR8Uj4Yqj4o5VP7a50DqfgR2yfuqn9FWnKVXogfxxo+TlhKwfrd4B
	g7uFbsl3p0xuiEm6Q/PKrq4/yzaK7Aaocg8M2wg9Bl9luKcWgaTsxezXcJqnhqBiMoFtQAIhjSz
	hL1FerCmBrlPsE5PMgnZunYkkkqfc/ksQrFFeHIrFgiqCp+qqn9hT0j3adgnfGpZO4dQP8KcgJZ
	by8z7CzU+9Un0vJtYM1kS/IPNs3QWttH7H+ZU+2U9DvVLwFv2E9QRiBlgi7+MJntYrZdBJRU956
	WBx+snZLTlNFFQnjNzN3Xc+nH4SjC
X-Received: by 2002:a05:7022:ea8e:b0:148:6b82:31c1 with SMTP id a92af1059eb24-16a6081026emr12085371c88.34.1791796635534;
        Mon, 12 Oct 2026 02:17:15 -0700 (PDT)
X-Received: by 2002:a05:7022:ea8e:b0:148:6b82:31c1 with SMTP id a92af1059eb24-16a6081026emr12085340c88.34.1791796634951;
        Mon, 12 Oct 2026 02:17:14 -0700 (PDT)
Received: from hu-akakum-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-169a442956asm34502575c88.16.2026.10.12.02.17.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 Oct 2026 02:17:14 -0700 (PDT)
From: Akash Kumar <akash.kumar@oss.qualcomm.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org
Subject: [PATCH v3 2/2] usb: typec: ucsi_ccg: Add cypd6129/cypd6229 OF device IDs
Date: Mon, 12 Oct 2026 14:46:58 +0530
Message-ID: <20261012091658.635441-3-akash.kumar@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261012091658.635441-1-akash.kumar@oss.qualcomm.com>
References: <20261012091658.635441-1-akash.kumar@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDEyMDAzNiBTYWx0ZWRfX2cjl1zdTywA0
 8mR7RlUgP7JDHT9sNZWx3AJS/sIs06EX4o3zElV1a0ah4l/XGWdnZjLqGWfrG49aKOljorCPCWy
 cz0LiZISwvPYgWHsjDJ47Nie9ReBddqqmcO30DCB7RrqBYZs1WxHGSK4NmiMNnPxv4v7yMtaORd
 J6NAN67opE84E57rrdRsFUdHgsuW+q6yH9JX3GmGr+yzM2r46rpyz3AzvBUaGJ7KOvZ3LimNOLx
 q81s4OeQdQTE+z4JYclp56WJzqHo9ljr+kNML7ox9/1ecwiYSpFAPdXwM3W7X8i+0QrjhZKhOa/
 PISB4UBH5ZtFkcgKI64/4eSYCANVYUHjO37zDx2OXVLbQRHcbSQAl1Qi37jGzlUItBvkQciQteI
 tPVj5NOjrlSFjWqw8MKbyiAfhoBYMwMto0h8Yu0Bt6kjOgSqsXfWgl7luuAZWFap2vtYZLRYbDU
 H5FN0kBii1zlH0Q9zsw==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDEyMDAzNiBTYWx0ZWRfX93ZHHoKJkz+8
 3YEZTgk36FDgMP7OqM9Zwe1xvn5xbBJ2KAPivDYCa0BYZJVJKmPkHcKbjWN9r9bxOiXZoCQTodS
 Wu/wHqV4kTOvTv4RR4RHbPEYYJpXvaM=
X-Authority-Analysis: v=2.4 cv=VOtIDNPX c=1 sm=1 tr=0 ts=6acca59c cx=c_pps
 a=wEP8DlPgTf/vqF+yE6f9lg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22 a=EUspDBNiAAAA:8
 a=YH4mJkl8FC1W5lWNX3cA:9 a=bBxd6f-gb0O0v-kibOvt:22
X-Proofpoint-GUID: prUDmOS7wN-oXz__pQZip2RDI9csm36t
X-Proofpoint-ORIG-GUID: prUDmOS7wN-oXz__pQZip2RDI9csm36t
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-12_03,2026-10-09_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 adultscore=0 clxscore=1015 bulkscore=0 phishscore=0
 spamscore=0 suspectscore=0 priorityscore=1501 impostorscore=0
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610080000
 definitions=main-2610120036

From: Akash Kumar <akakum@qti.qualcomm.com>

Add compatible strings for the Cypress cypd6129 and cypd6229 dual
Type-C PD controllers to the of_device_id match table, matching the
corresponding dt-bindings update.

Signed-off-by: Akash Kumar <akakum@qti.qualcomm.com>
---
 drivers/usb/typec/ucsi/ucsi_ccg.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/usb/typec/ucsi/ucsi_ccg.c b/drivers/usb/typec/ucsi/ucsi_ccg.c
index 3f12db95c7f4..34fde72fe0a6 100644
--- a/drivers/usb/typec/ucsi/ucsi_ccg.c
+++ b/drivers/usb/typec/ucsi/ucsi_ccg.c
@@ -1556,6 +1556,8 @@ static void ucsi_ccg_remove(struct i2c_client *client)
 
 static const struct of_device_id ucsi_ccg_of_match_table[] = {
 		{ .compatible = "cypress,cypd4226", },
+		{ .compatible = "cypress,cypd6129", },
+		{ .compatible = "cypress,cypd6229", },
 		{ /* sentinel */ }
 };
 MODULE_DEVICE_TABLE(of, ucsi_ccg_of_match_table);
-- 
2.43.0

