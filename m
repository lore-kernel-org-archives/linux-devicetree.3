Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4C9F447D922
	for <devicetree@vger.kernel.org>; Tue, 11 Aug 2026 21:36:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786484182; cv=none; b=PhJ7+jtayu+B5x47KUSX+DQYnVo6SxSzaV6SCCtnRT9zkburkI9UG99q9iLmmamIl9Q+GUl1Q/GTQsbnIv3tABzTofrAgn6AdXLxdYij8eX44R/7Lgd2TLIXuusUCjd5mWWH4tpBO2gBQmsHX8+J+f3+HQ1ZQzU5fBKq8bOaEh8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786484182; c=relaxed/simple;
	bh=+r7CuBFCSOL+IYGJGaj2szhxa9w9Ee0pYXSbBBAU/UQ=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=YhznLhg18toczUPZ3roj/kRdjXCrcAvtV5m1zxkO3ARugrpMzfT3N/CufA3+a4NEDE7O+ZZ8jxyRjM/rjQhfpj8IWE6rTn5wpQsots3WV5lgn/GS+PFYpFGrdXqd5f7vEVHqqfrAwsqyyxaOwfyaWmmCHUcBfgmiUj8UvpalqeI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Uiqwu5lG; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=DK7EJ9P5; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Uiqwu5lG";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="DK7EJ9P5"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67BLQGl01835653
	for <devicetree@vger.kernel.org>; Tue, 11 Aug 2026 21:36:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=ms/DiiyqieY
	P+k6wa6aklT6LJKO+25SptkRHjNhPWoo=; b=Uiqwu5lG0B4rmfTra/5SMQVAYyX
	Wy2IyuykzIrF0y3uwAGDC7nj2hYz+B31FfT4JuWdq0hdcQI5Wa0e/mwU+sEYyEZ9
	ErEzXI3IuaP0BfgIJNq+8xi3OI3/15CrrB+mwJ1GcMn7MmY3zo8SgWg4L+y0DaSI
	q1/1R94sJ0cyEbpQw1mrQcMjm7jq+1VTNJhMT7epjUOLHgDf/l3BHjWvSHtsc/jg
	W5NJEZOJJbROKZgu8gkauIhtOwJiqqHMNR1LaPjJnapCODSnv7L/QFXkSp9UQIJh
	OPIFkVkCMfkFC93KRdT2vJwAdkubgV9RQJeqS/Fniv21JJAJmLNT1AWMkFA==
Received: from mail-pg1-f197.google.com (mail-pg1-f197.google.com [209.85.215.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g01nc2rn4-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 11 Aug 2026 21:36:19 +0000 (GMT)
Received: by mail-pg1-f197.google.com with SMTP id 41be03b00d2f7-cb11535e6a1so224239a12.0
        for <devicetree@vger.kernel.org>; Tue, 11 Aug 2026 14:36:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1786484178; x=1787088978; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ms/DiiyqieYP+k6wa6aklT6LJKO+25SptkRHjNhPWoo=;
        b=DK7EJ9P532yKMNotqcqomrHm4BSdvC4qV0f8KVbZyPOfV4bVww6O0iGRHHziK04dkc
         E+KU5g9sKeAqfRjPKyyZhFoxe6d1Anb1ptSd0F62IML8OfcUGrBWJnUYe+86m0FxzhmT
         n37qRDoWVucZmYkVNgI2lhgx3M2wObFVjRDm/f2EBgLaYQGC7S5OUGSsQFQaTVxkP5U8
         XuatRSLVGSGLKKOok2k0+BQJg1iI6y0L5qwzQXDefsSCI8DxsPwHJk7rp/USrGgbgzdz
         i+BGXt55Frpplp5f+4tZ1rfbf4QHllK9WjtL6As0qQZnWQK9UKCo9JGyMuRbev3PkQLV
         vrfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786484178; x=1787088978;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=ms/DiiyqieYP+k6wa6aklT6LJKO+25SptkRHjNhPWoo=;
        b=kTp9nQUjsLgHknsHNbyrQqCgw+vtVn+ZkNYv89MXOWOlG9ZaDVOCY08U3gS2ufKu6o
         /BDhjCs2DOGwzYhvxfS9oFOyoqDGaT91+DnBpBF5j4lnKkFu0W+Sq8wIJUqhGC7o0dr2
         hKQXr+VflGp2jZZYTI0rL1BbUGl/asfX4APqf9Qrukc/kwHcPc5cmfNLxsKIjAstoWfI
         3LoSN7TNv7KEdQJ1reH3R/Ig/PS+ZLZEcZ0l/f7rqz6toA9wD0mYT4aypy8tOHNl/Z33
         FEjSBf1ncKrYLgAMmMSFu34p4rnI/tWSbvGqnSko02562nrapoQDxLEVddCmgqHDGR6R
         WQ5A==
X-Forwarded-Encrypted: i=1; AHgh+Rrcp9wNWkYfSmM1fyiwyZWMlI9z4H6mnK0JbpNCiwIVEU+vObRwsyomAy7Y9K/c6wa1j+Sqd1vTT4t4@vger.kernel.org
X-Gm-Message-State: AOJu0Yz1xmBslyIdGZU6bCGn+hX/yqNwmd46+eEkWJgWsG7Y9iVj0WHn
	kipCQwkMAxJe/TGam2MWe+HbIg5AHMOo2CU4Ll1zFYTh/sxMeXnuRKfRQe6UNNKsZMQ4eWsSEfe
	CnC+p4Oqsg9PvCe7SsdnlUylO1rLJnY/V7XU2yUpmc8Ndpf3Om0Gq4b8Y3aFek3Le
X-Gm-Gg: AR+sD10HZvaSHuXXZ+iDjkQMEUijK2AAyLxfPH1es9DDfIMbOsTmS0+EOdD+x989fDa
	Jf0i5+jalsxP2xgG+R/qHPYHEdwhvjFx+/5p0/+URSlxN3PiE6wWQGj0Z/bo0tgACoyL18xRUZb
	ZFxTRBVgvevu3xV3dtQjGJDn5h6w+D/zV3MiLEfgvOQDpLOZFwOZjno1L5Ra29Ca3MZxSkJWYh0
	UfReodvF0f6Wz2Htf2Y1OZOwV/msPQ0KI499hA6bVgftvBNRy7q/BhCFt2TRtfWpulVq0apO4i7
	p1la9zSqKWrjRC4+tAkDPRf3kdLeZkzo0sLnS6XxpMWUzpTyINXyuBJl2sji3IeqQ2fG5fEBwyp
	I1K57EbQPuBHJHqFC9G0V+D5yqkryldphR3c1Z9V3WI4LNxVDiTZODQ==
X-Received: by 2002:a05:6a21:4a98:b0:3c3:a9e1:a819 with SMTP id adf61e73a8af0-3cc2bb05982mr9394490637.24.1786484178135;
        Tue, 11 Aug 2026 14:36:18 -0700 (PDT)
X-Received: by 2002:a05:6a21:4a98:b0:3c3:a9e1:a819 with SMTP id adf61e73a8af0-3cc2bb05982mr9394427637.24.1786484177681;
        Tue, 11 Aug 2026 14:36:17 -0700 (PDT)
Received: from hu-eserrao-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-31cf3c08163sm2713563eec.7.2026.08.11.14.36.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 11 Aug 2026 14:36:16 -0700 (PDT)
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
Subject: [PATCH v6 5/9] usb: misc: qcom_eud: improve enable_store API
Date: Tue, 11 Aug 2026 14:36:06 -0700
Message-Id: <20260811213610.2956147-6-elson.serrao@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260811213610.2956147-1-elson.serrao@oss.qualcomm.com>
References: <20260811213610.2956147-1-elson.serrao@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwODExMDE4MiBTYWx0ZWRfX06759fbgyQgr
 lsv15uphoOnpUgkVbHV8xE2y5JrEMESWPJ14wXSBRlUJUScQ2M9f+RNfttjCt6Yilt2GllDb4iQ
 ZfFRK5bUzCoqkKTdqTP163Hv/66t++o=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODExMDE4MiBTYWx0ZWRfXwtKcWKxuymxL
 qURlnI57vKnz3tlrvHYvv+0ZbTxYI8ySrKErYe6ldIXBatw1urfTxdrdKF8uuKVEhctVOAdxtYa
 V6jwmTnM3iXhJ/JHl8FYDi45VqW7Lb25BFXZpZ39qUXEQu396pM5M7MQ9tRntBAP+H0h3wX+uW0
 rN+aP71MmRXX6LU8aYvUARFB3jJyKe/vwZ2hiHy8e/6YFbKrfqws3K3Q5X56WWWAvQQwhOcww5d
 zR+lNa7TIlldq7EbMilmBR7BFFDn0k0gfNXVYmOFp9LjE0gs/zhMpGl1UkfaamEJVU89KsPyKc9
 IscSaLFAtQ/UetGjIl0vci8vfOuPJyRGmxW9JpboHfjTe6+L2l+zHXu2/MFV/UAFOf7dJqiRZlf
 xikpAk5JbgcvgbA8e7fHZLQvNDM78IXZJtDR/BB14sUrLcSxtNG8EdLVYq+z/yCFgy14e0ubn8W
 MXUoc+4mpWxFkURz1NA==
X-Authority-Analysis: v=2.4 cv=RY6gzVtv c=1 sm=1 tr=0 ts=6a7b95d3 cx=c_pps
 a=rz3CxIlbcmazkYymdCej/Q==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22 a=EUspDBNiAAAA:8
 a=VwQbUJbxAAAA:8 a=iEam2xx7WbKG8qDqzoQA:9 a=bFCP_H2QrGi7Okbo017w:22
X-Proofpoint-ORIG-GUID: SWXqmFD3akj_fyNUNZ0xcmMEpyMxgRRe
X-Proofpoint-GUID: SWXqmFD3akj_fyNUNZ0xcmMEpyMxgRRe
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-11_05,2026-08-10_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 phishscore=0 adultscore=0 suspectscore=0 spamscore=0
 malwarescore=0 clxscore=1015 priorityscore=1501 bulkscore=0
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2608110182

Currently enable_store() allows operations irrespective of the EUD state,
which can result in redundant operations. Avoid this by adding duplicate
state checks to skip requests when EUD is already in the desired state.
Additionally, improve error handling with explicit logging to provide
better feedback.

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Reviewed-by: Peter Chen <peter.chen@kernel.org>
Signed-off-by: Elson Serrao <elson.serrao@oss.qualcomm.com>
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

