Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0B48C352F95
	for <devicetree@vger.kernel.org>; Mon,  3 Aug 2026 03:15:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785726946; cv=none; b=jnrg/bzhAVDvWmeVZ13VOKhH2t+gEHX2BnUwcNKn1afqN4X2y03Ek2uoAQtdUwLzyoN03CehZjlh8mqWqRXeY8r8qliTlQOWc01QP3oAos7WdhM1/fMNWtJKeTj4T4l1Mit1i5/NBVLR6BxzwWw1w2bgqclRR3iY8xNCvbP1rYQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785726946; c=relaxed/simple;
	bh=HpHLnY4+cq26k9bEYWvJsx8FG9JYVOEw8X6TJecOzlk=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=C54sYpRgmwECMW7/R7copYQlZY6sxoMBwNPqTBSQJ+mhObtioJXDUuY3qeNm0wD3oLz28JiZJGAOtuSqepsX/KvXrFzf+JEaHZwfmRL32rPFgvGCChXtLNRKxlotM7lOUcftNzYnTK8yCaClsxlJxVGl/Y9ufaezijxiLkaf798=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ZZ0yOm55; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Orbt4cfB; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ZZ0yOm55";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Orbt4cfB"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 672LWFrf2771433
	for <devicetree@vger.kernel.org>; Mon, 3 Aug 2026 03:15:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=Lh7VPnpiWdW
	yrdblOAW9o/VI9PYxFPN0+cxK+2KPVVg=; b=ZZ0yOm55CmwDCYxS11YV2uc2mNl
	P0om+LSoGl+7c0OTrgyNc5vjgDmMECakEzeAHJbIf4W2qnQ8CpYBqjGveTov+6xd
	TXlaKt3Y8Vo5JC0An4V4qjUL5JsOIi8Retgdk9JC+OI6bLFko84rAaxt+EZlA7kX
	ioR7DeOOKLSs9dKz34oRxs4tMHFVWMkz6x+f+K3QTTyqY9ZrCh8oze3mMF0WXpNR
	t0a+jS5ukJrXtETjBqFzdtj7FCsJ5FzLULGjkNwKiA8vfFOA7Lmk7+CVYjvGbWFf
	eram/IyW6YOoAWnaEUVdR2uWC9AZewVWJ3ySrHmm/9XLXSitWOcxBGsjCBQ==
Received: from mail-pf1-f197.google.com (mail-pf1-f197.google.com [209.85.210.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fs8r6ma9v-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 03 Aug 2026 03:15:42 +0000 (GMT)
Received: by mail-pf1-f197.google.com with SMTP id d2e1a72fcca58-8485d853b08so5744540b3a.1
        for <devicetree@vger.kernel.org>; Sun, 02 Aug 2026 20:15:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785726942; x=1786331742; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Lh7VPnpiWdWyrdblOAW9o/VI9PYxFPN0+cxK+2KPVVg=;
        b=Orbt4cfBsyPjubVLKgROhxYNCbzYaE5GURLGgaPQscmRo7Bg5TxXPQMKF8kt9rS+Tq
         BVXDaGLwgTDSBKJShm69+TIZyUIbAt9cwAEwiBG553Fpqi0Hy3eDK/CYli8lE4jvNnTi
         b/wbDNLenfv6Le5S1QMNKNae62pnatSDC8xzHszj9OLAy7HL0t6TdUMD9+xRagh24/dk
         EI35Ro2iSML3Paf304+1VSbaOlCniv4PuS/9LM4SwX2hmqhkTebMhYUIK0yE9gxPO0Gh
         T1ODBHVgTFb9RMCPmnk3TxCRTdzhAaxGNBcnSCXq9We6AtSF0+3cgOydSMJF38x8BnLS
         OE+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785726942; x=1786331742;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Lh7VPnpiWdWyrdblOAW9o/VI9PYxFPN0+cxK+2KPVVg=;
        b=s6sx+kTDv0G9SgR5VyYNFs5w+WPuCwJmc15v/+FkkGPu3rAQqlhCcArnNzBq7CwSV6
         4vLMq7IzgNXfVKUUrH4LVJ2AqaG9RPT4OzyBS7ukyACOLUowE+x/OlCGFA3atuvT8E19
         48Q3Iar9AyKyZPPe4ZFGVDsAKh2DkFW84bWXg8Nv6GgYAnBq7PQd705XIAMD+GvvJjuz
         3zNBwL7vVxAYtACw/eClGa2ay4x6DGCPh+iJJkNr+3lqnAqUIIDAiMBrh2nUYiVpqtrR
         HzfH/U60Q6ab8yKWDclWq0NReB3UljVz3dciNJvQGGwoOWbE5um2ESNtDXtRzhm/unCS
         kzag==
X-Forwarded-Encrypted: i=1; AHgh+Rq9MoMadhESh5fcMzPH/G+Xupc544eykpJQPhZq6Hdy3xbiBMSE+BZdQlKGRYJC9B4efQwvveaYDWM4@vger.kernel.org
X-Gm-Message-State: AOJu0YxBa8ttXd9t4IelAfw1reZyfoZs8RV4Uyey3+Y+q+1MVWpBrFfo
	SccXPuoN+YqPf3WPlcleNIqOZ9XVY6y5F/yddZtBpJh89Eby/8BL8EdKyQaBJPxRtkWkEmDsJKo
	t5ksU3ykpb5BNSC4ZWNdslBnTO4qWrbz5s9qyY9LaXZ8UpVqWDvSBZxtz37ImL15+
X-Gm-Gg: AR+sD10K9VWcFroI6GB33HOL9HK+40Bbt4sXkLV9Ek5A/PG7iRq0O6XDmwBOkOrPe15
	6440Y9EHqG/S0Pocujb5uyPlH+cKopvnoLaXNBPQrewL1BSK8JfuLkHq75U7GQeElx4bQ26QKet
	f+3TD6CmTFyOraJOHxMuy4V1o3atq0wIWImcJG0/dp35kYP/qO2g8OUX4dMABdsBzEVns6qqZb8
	Q/+chmX4bZ9W0IzjLXVHMY5eaSB0YN9F+gRDioqDylRakAJCMXZv35iVpjHZ16u7YlOA6hzwcVg
	m64SgMfxMPd/zxbXIuygHRi+5EekgcNtmrzghDKWJ/JSMg6r9pJriR4nAfiMOZLVmfwrF04AALI
	QAwnk3LguEQOX653sO8Xm70m7i9Yk9ziVsBqdHgRTgggpneAmIiExlg==
X-Received: by 2002:a05:6300:4045:b0:3c3:a08d:5b44 with SMTP id adf61e73a8af0-3c92a524e22mr8309492637.23.1785726941868;
        Sun, 02 Aug 2026 20:15:41 -0700 (PDT)
X-Received: by 2002:a05:6300:4045:b0:3c3:a08d:5b44 with SMTP id adf61e73a8af0-3c92a524e22mr8309462637.23.1785726941444;
        Sun, 02 Aug 2026 20:15:41 -0700 (PDT)
Received: from hu-eserrao-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3153dd9c93dsm32585113eec.8.2026.08.02.20.15.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 02 Aug 2026 20:15:40 -0700 (PDT)
From: Elson Serrao <elson.serrao@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Peter Chen <peter.chen@kernel.org>, Rob Herring <robh@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: [PATCH v5 5/9] usb: misc: qcom_eud: improve enable_store API
Date: Sun,  2 Aug 2026 20:15:30 -0700
Message-Id: <20260803031534.2942628-6-elson.serrao@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260803031534.2942628-1-elson.serrao@oss.qualcomm.com>
References: <20260803031534.2942628-1-elson.serrao@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwODAzMDAyNCBTYWx0ZWRfX0NuwcLpAUt8x
 ukYjbiaa7Yl5dk0qf6qzU432lZ6a8TaMKGCVT2zKLqWN1DebJVjGC7gf5Na2GdEPRlATa0RTKgt
 /jgo0PKl8pvs2+VytbbvkIL35Vw9lBA=
X-Proofpoint-GUID: pBrsGQB_ckOf95cxGP7m49rvtZm5XdrE
X-Proofpoint-ORIG-GUID: pBrsGQB_ckOf95cxGP7m49rvtZm5XdrE
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODAzMDAyNCBTYWx0ZWRfXzt7FPTVXQ22u
 FNt5eUPaUL1zgDUWXSSVssOnG8d+w2NmrJKMIoZHFLEdfGMyliw6nnaeCH1KFD/dKx7Uclh1d1w
 wWr4WOTgwOZeMI6UKIjxMVNNB9A795W/h7BZFa1hV0m1GqBT2uvmW0I3rA/0U9xmJoQ0lw2syNt
 11V50sVuJwzi/Rnu7O9Fnz20RB62sYFniX/Lt0YHxS3x6KT98qXFTSZkcqyW6ugplz3zSdzze8x
 eRnGOLd+mTHcddqIH+vVyXzKbciuNfZywjr9M61445uEaGse0oHWSmsVcKKTBRD3UODMH9m+F4T
 Eptq5cAQNNMYsMw9cZ39QBw+uVPD597XABy+sg8T/NccRIOZ78FL1XyFNPCMO7xXjNoChaC8UEo
 0NdqNaVKQIcpa1yptqJZQiVb1pwZGYs5FdA97GOsjFcl6PBd3op6vgJc3oJAj8khbxAjP4KBrGM
 TrWkQ0vlJHxoEe1rBwA==
X-Authority-Analysis: v=2.4 cv=Q5ziJY2a c=1 sm=1 tr=0 ts=6a7007de cx=c_pps
 a=rEQLjTOiSrHUhVqRoksmgQ==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22 a=EUspDBNiAAAA:8
 a=VwQbUJbxAAAA:8 a=iEam2xx7WbKG8qDqzoQA:9 a=2VI0MkxyNR6bbpdq8BZq:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-02_06,2026-07-30_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 spamscore=0 clxscore=1015 impostorscore=0
 priorityscore=1501 suspectscore=0 adultscore=0 bulkscore=0 malwarescore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2608030024

Currently enable_store() allows operations irrespective of the EUD state,
which can result in redundant operations. Avoid this by adding duplicate
state checks to skip requests when EUD is already in the desired state.
Additionally, improve error handling with explicit logging to provide
better feedback.

Signed-off-by: Elson Serrao <elson.serrao@oss.qualcomm.com>
Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Reviewed-by: Peter Chen <peter.chen@kernel.org>
---
 drivers/usb/misc/qcom_eud.c | 21 +++++++++++++++------
 1 file changed, 15 insertions(+), 6 deletions(-)

diff --git a/drivers/usb/misc/qcom_eud.c b/drivers/usb/misc/qcom_eud.c
index 48a4441b0c9c..e83a4402e4b8 100644
--- a/drivers/usb/misc/qcom_eud.c
+++ b/drivers/usb/misc/qcom_eud.c
@@ -162,18 +162,27 @@ static ssize_t enable_store(struct device *dev,
 	if (kstrtobool(buf, &enable))
 		return -EINVAL;
 
+	/* Skip operation if already in desired state */
+	if (chip->enabled == enable)
+		return count;
+
 	if (enable) {
 		ret = enable_eud(chip);
-		if (!ret)
-			chip->enabled = enable;
-		else
-			disable_eud(chip);
-
+		if (ret) {
+			dev_err(chip->dev, "failed to enable eud\n");
+			return ret;
+		}
 	} else {
 		ret = disable_eud(chip);
+		if (ret) {
+			dev_err(chip->dev, "failed to disable eud\n");
+			return ret;
+		}
 	}
 
-	return ret < 0 ? ret : count;
+	chip->enabled = enable;
+
+	return count;
 }
 
 static DEVICE_ATTR_RW(enable);
-- 
2.34.1

