Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A2CF735E1CC
	for <devicetree@vger.kernel.org>; Mon,  5 Oct 2026 06:37:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791182224; cv=none; b=dFM3bEmuYEL9kruPOI6X8htRZPhs8poRhPlFcsp9qHUqkpBq7T5ZP5DYmiq3hA33esKEFekcHwd7WSoieBA94hmPzCz60b0U1ossFcr7efduesGOmUJgAqh6vkNYyLipl0junZruDjBMO0/P8EZj/VHqp1jcxyCD0Ab5pMDQ+xg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791182224; c=relaxed/simple;
	bh=r93Jb+RRci5KjslpMwSwutEV/c/USqhXg7qpdeh+1sU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=lkY+Q69qGsh8x33WFYnwttcFaLj2D0/jJQjCoLmCGlgMF7HAEU05IsuEwFJ7bAkMDPMzP4tKwx/9F265qFbOzTdNutglQ3ZaTR39NCrTbsSJWlA8ICXtUDMzxRDBXUx8VIB6A16cTNdGTkuZy4WQGMRTalFMuobReRFhQGH1O2o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=fiJxWS7m; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=KxlxO/xl; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="fiJxWS7m";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="KxlxO/xl"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 695103aF1464832
	for <devicetree@vger.kernel.org>; Mon, 5 Oct 2026 06:37:02 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	jrWr4WEEoDxY2QpPfvYR+d27cAyfCi80wCzqnJN1qlI=; b=fiJxWS7mWMIDfILt
	g91sFCLxVy2KL/tEDQXC9/KK5Vs/jGnUJmIwqATGJhJPOt1UFlROAYz3Ko9AmpYC
	R34G4d4vxXQXV+FilDiAAwlCeh8csRBcM0nJhb8MYHCZvwL3Of7B0qcZfWBmaktZ
	CWzBf6z2m+zc20FLVKor8izYBP1GqPiL5tBSov4qi6/dUKGLiJ7waA3wW3mKeBDv
	8TwlNJbZrpt0ovzRE6qLx7pEwY8Rd2DetScUflkg8We50s6BmlHTPGdheVkLhj5T
	Ib8vhpfSMn0K2Boa9nj+jZplBTFK0LLtbGSWA7hzxjTNVamCWE23rJSL1wBSxMdV
	0zmtmA==
Received: from mail-dy1-f198.google.com (mail-dy1-f198.google.com [74.125.82.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h2sssmpxw-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 05 Oct 2026 06:37:01 +0000 (GMT)
Received: by mail-dy1-f198.google.com with SMTP id 5a478bee46e88-34d84114044so6846890eec.1
        for <devicetree@vger.kernel.org>; Sun, 04 Oct 2026 23:37:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791182221; x=1791787021; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=jrWr4WEEoDxY2QpPfvYR+d27cAyfCi80wCzqnJN1qlI=;
        b=KxlxO/xlUnDrdTtPKn2oZ9pgotFzbzmLq8heYnZXsXGBabibpm/j4znkY4bjNtgzpC
         kKTYjx8o0eNulHj9otWGwFTZMAVxwPtNGKPDfjmVFzW7KlWs0uKi7ypTjn/BvxWA9nU6
         XxpOT3Ig0aohEsxyl6AYCsP1c6qjRtfbvem6sObfmnJbF7WKmNFWcocxkoNJ6blclrgc
         nyfWyehFh1hUZnlt0YU10ZlGCwvsy2LNVkBHjEg9FHYvy8fS45y11JSpnR2nUtIoCOAR
         q8ACIKjkoxmag6k5aQBfI7eYGAFQS9tE+ewHZOZk/iZRogeI1NrdK5M6umX/25R6sZDt
         BKcg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791182221; x=1791787021;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=jrWr4WEEoDxY2QpPfvYR+d27cAyfCi80wCzqnJN1qlI=;
        b=fQyBwl+qkWDFQVDhdxeVTxTS3tHumTc73rCqHviIgVv0d00PQXiOkBF074e4UmGOkT
         Fg2iB7EjgMdjBOkvhVTVlfNVFAoM9+2b8mTkYepo92wyPq+BYnjWhegP/arezj6wN3mF
         5mCxxYAEnbsdYdG+OVLclgWG+/Gc9+ndePVOAiZ5hISJH+aPItN44P8w5ZH92+/FKGKj
         Z0AXkpRZWbTYSR6h+AfdGzsJ+JKllVeTwwnUSSkgpscgYqlr+kC73EAYttDjXil5IXfn
         IHb6Kwwm6W8T39VJy4uXWH/1mRvL1TLAIrEmCJ3AuYc8J9CnFkbXwdU5krKjUvBJV2J8
         rYBw==
X-Forwarded-Encrypted: i=1; AKwUvBw/HQeAhNUo5pe9cB3b3NU5p8X2idARC77ewaq4eJiAWwo/MC9UuCjBvWvatjKzji29eFPe5Z7mhg31@vger.kernel.org
X-Gm-Message-State: AFuF++nwBtQXplSpcRTwYlhaK14GcrTrXtKl79PLGNbkuRBWcPQGN7wT
	CDokyC/HHCvt9EIuYiTbbJLpCYScNue9h4EJWMItvFkr1mrq2OIDK+MItGfi9iF4jmzy/QjT/00
	UMxK5SYBfbznRE+jIbsQqxq57n+YIuRGPcx7Gyj/fHK0hai53AJhBtDSaUdug5oYl
X-Gm-Gg: AYBFou1k4vMAhYhx2pFyGzWLg82jxupOo1lTOwYae1jfKZwowzfShvLQQLxn0tzolVa
	E3P29JZIxa22om/LKAspGaeR3Zsv4ZyJyjuzuJs7yExAzLf/+XV+kMnJlhgkeCgGrrCBlrJS1HK
	QuREX6czsAIinwDhLGMFy44LZKgjO0mSGp7RhIWYmQawZ7KbdcqiWbERkbEKbAlT8xJNnlTquUh
	Fc8iOQ+VEfcWpbfgnx7uV5OshWJyXyR35vOkuq1c2kqo1AJe3ZrpbDHLl0+f8coYjRpvrUlTZ2b
	fL3anfLAcrUIXXai6RUHEDfTLZguXf/kq4PhoUhlWTDLPmRx+Z0GF3uGavegOEZcipX3VXmqAGc
	nX93IjT8r4saBClA5oIMpAtDdnzB5LsqTJCLVQQPT+Xq+T273f8GeH5W/bg2oI/aNTuaI0jkk6D
	dMHU09M3+vgW1D3+yRcdGQ+yl4Z2lk
X-Received: by 2002:a05:7300:ae11:b0:341:225b:d6f with SMTP id 5a478bee46e88-3511167b095mr9141539eec.19.1791182221238;
        Sun, 04 Oct 2026 23:37:01 -0700 (PDT)
X-Received: by 2002:a05:7300:ae11:b0:341:225b:d6f with SMTP id 5a478bee46e88-3511167b095mr9141511eec.19.1791182220622;
        Sun, 04 Oct 2026 23:37:00 -0700 (PDT)
Received: from hu-varada-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3512718d9edsm11185821eec.19.2026.10.04.23.36.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 04 Oct 2026 23:37:00 -0700 (PDT)
From: Varadarajan Narayanan <varadarajan.narayanan@oss.qualcomm.com>
Date: Mon, 05 Oct 2026 12:06:27 +0530
Subject: [PATCH v4 2/6] dt-bindings: phy: qcom,usb-snps-femto-v2: Add
 IPQ9650 compatible
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261005-phy-v4-2-b04c4123ecb3@oss.qualcomm.com>
References: <20261005-phy-v4-0-b04c4123ecb3@oss.qualcomm.com>
In-Reply-To: <20261005-phy-v4-0-b04c4123ecb3@oss.qualcomm.com>
To: Vinod Koul <vkoul@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>,
        Manivannan Sadhasivam <mani@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Wesley Cheng <quic_wcheng@quicinc.com>,
        Manu Gautam <mgautam@codeaurora.org>, Stephen Boyd <sboyd@kernel.org>,
        Philipp Zabel <pza@pengutronix.de>
Cc: linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Varadarajan Narayanan <varadarajan.narayanan@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDA1MDAyNiBTYWx0ZWRfX4biE7l0WrGch
 7gebMtcfaoNzWXk6QKLOqU5o2+FjRm0ydfGGqrmJaefxz4/bQ3Rzm9XNswwiOtfCwmb7+5f2oxF
 0S2vjajEr5xexW8kSNcf9QOrj3yEWl4=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDA1MDAyNiBTYWx0ZWRfX3dqBy/AniD1J
 WrotXU09o5oIYXsitXzQ4Catr5fQZMI+CBFNtdMMUMakUNNbbOMuNAu1/wHB56t2hvMMSnfPqPR
 kR/0kSbhHZ2GljpU1uziQb/I/oVU92ssYm7vvV6+l+bI0wnRypb93PjDingMJuZKUH3Dn3Wb85U
 73YXm1JPavAxCMW+qoEZBXBccZXTSbwTAjlYCcr/3lA24wXaupvIjAiycjiuMm/oSU3u1MTH+9t
 KJt8vQO/Y4ZaF1gh5EuVuy4lU45/5MO9BINxoBvPn4mCyBnI9l+FqLFQRBv9TZj76xk2VWDXpxb
 lUkcyJTY8zE2nQbDSAxPpbPmzW+oMmS6L7mxHaENaNPiucKzYm3AqkxVvQXfVv1eHlXoiKFvnQv
 CRzRR+k+x+gfTXOf/RL6ZkZhTCHVSssMAoBnN72d9Su37E3YUatk6opRpSLeRcHBSZl5v42bPRm
 fbuQjjM9Q3u5MsNtIEA==
X-Proofpoint-GUID: a0_7kyszxko37ofskhanY0CGuZGDVPkn
X-Authority-Analysis: v=2.4 cv=HqjjiETS c=1 sm=1 tr=0 ts=6ac3458d cx=c_pps
 a=wEP8DlPgTf/vqF+yE6f9lg==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=EUspDBNiAAAA:8 a=JwZr8aepJa0OdLIFGX0A:9 a=QEXdDO2ut3YA:10
 a=bBxd6f-gb0O0v-kibOvt:22
X-Proofpoint-ORIG-GUID: a0_7kyszxko37ofskhanY0CGuZGDVPkn
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-05_01,2026-10-02_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 clxscore=1015 phishscore=0 bulkscore=0 adultscore=0
 impostorscore=0 suspectscore=0 spamscore=0 malwarescore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2610050026

Add qcom,ipq9650-usb-hs-phy to the list of supported compatibles.
Unlike the existing SoCs, IPQ9650 does not share a generic
"qcom,usb-snps-hs-*nm-phy" fallback, since it requires its own
tuning/override sequence, so list it as a standalone entry.

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Signed-off-by: Varadarajan Narayanan <varadarajan.narayanan@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/phy/qcom,usb-snps-femto-v2.yaml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/phy/qcom,usb-snps-femto-v2.yaml b/Documentation/devicetree/bindings/phy/qcom,usb-snps-femto-v2.yaml
index 661759b25064..db00f5a99d80 100644
--- a/Documentation/devicetree/bindings/phy/qcom,usb-snps-femto-v2.yaml
+++ b/Documentation/devicetree/bindings/phy/qcom,usb-snps-femto-v2.yaml
@@ -15,6 +15,8 @@ description: |
 properties:
   compatible:
     oneOf:
+      - enum:
+          - qcom,ipq9650-usb-hs-phy
       - items:
           - enum:
               - qcom,sa8775p-usb-hs-phy

-- 
2.34.1

