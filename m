Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 97E882DB789
	for <devicetree@vger.kernel.org>; Tue, 21 Jul 2026 12:46:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784637977; cv=none; b=oOX14d7J5343Q6dtrM1sszhMIg82/3cFlJEiTNlUMBw3vKNMtR0Xu1ltBFQd4sWTdFQlqKXY646ER+I5FNiaevvFM96nfKouSn6kxOc7tVjqbkBi0XWGt7ooqrIfrZQeZRkla3deGXKAdXKclHJxBCVG/Kb0jCtGRmlWMhAfV+0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784637977; c=relaxed/simple;
	bh=HjBkVmiUU/P5vmEBl+OrwDdSuOYE7uInCAohSie5WvA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=kwfzqNLZHGT758qJs99jNgsPtObzFeO1YZS7xAa4IkMlwXiCvMZnndsekoqBZoABoWqitPXGKuvmV+GpWsDsBif4FqvgqqavJN/3OKSGvFJwf/ggF7ogJgU+8USh2r1rN7ZkgSBp0XINg8Nz4MDltHVKPE+m0jvvbqAXP41pfXI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=mFZdtmXH; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=TUP0HDq9; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="mFZdtmXH";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="TUP0HDq9"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66LARTLq1455598
	for <devicetree@vger.kernel.org>; Tue, 21 Jul 2026 12:46:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	i089wZS1+hm/uZCiwjShV9RCkdFlzWrKsI3lK7jIBdc=; b=mFZdtmXHOYI0DsnR
	yPfXavZwe6IQO+7t8le4c/Oum6GApRcXOdDbU/KpTnSN9+x0l/Fk8dIUBTkQ/PzF
	Bk8uR28ugXN0POPQXGI3m5T3reVLKq3UFkK5HZlFSAr7HAxXjVz1sas87V3j5iOX
	piyx1/C5U3Ul9c1YTlAX0flIg7UXTRGGns177DEB14kJW12FbJr21iC9QNgR1dPD
	n/B33OWMK4kmLadFR6uqzMFrUtdWqEwjz28eXJlH9USZWBwAbf9LidTJAg/6vWll
	pcxtpMFQKoAur+7xQbM7iGE7v2IGuJFjtyg4I2TtdpjxEZUFS4KF+rKg9pMfX1Qq
	6/txTQ==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fj1dujc41-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 21 Jul 2026 12:46:15 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2cce14a21faso77614045ad.0
        for <devicetree@vger.kernel.org>; Tue, 21 Jul 2026 05:46:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784637974; x=1785242774; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=i089wZS1+hm/uZCiwjShV9RCkdFlzWrKsI3lK7jIBdc=;
        b=TUP0HDq9wKUYIcE25E+kdZaXeZUIMlJIMLy61nnpVEy4S8RhOXTdcOMqCH1icHBiYO
         74g0TwNbAMfnr7xLpUxHLtn4XCWTInZIcXtW9rsCkMxeAC/skiaFj2N79H0n3C7AG/1n
         MzwciNcgTq8WeEmeDirGqnHXJRatF4C/5pbcyIrbwkpaRHa6AOxwuICfF1OS94H/F0R/
         rvYsS3jnW36Hzrma1ScZKPsupCbTIsZJt25eaVXWWteZ4biPuzZTecJQnxQQTevTRrNU
         NoKU7xL14D0FH9M4iLnPdqm6rI6EDQUor4wviVvUY6jUOD6tTwaexMOZKxmL3GeEehSr
         YDWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784637974; x=1785242774;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=i089wZS1+hm/uZCiwjShV9RCkdFlzWrKsI3lK7jIBdc=;
        b=VFHVvOv6SkyHy6qw69A/L8F/qgLEwt31IoWI4xlXjQ4yslZ/NbF2UmVmmBAYmRcySb
         C06s093QbO2Nc1knZqobfyFAzfsjvFjV8Oq1KK+lTW7AqSOFkLoVcxbXP7wAcYXhLGAW
         4mkXjDshLywsoDHMuGjEGsse8DLoes+qlOerwKX2p0aN/sFKtHXgItd4+wuit4dJeOOF
         ZEXqZAUDA5F1eU/89W2vIaTOS4UpUMzCeakxBAUwt7UwjeTX3rg2VNGSlnpy+/4waOPA
         lgSb9oIMu2DJW/jyiu8ZA639ewDHtOTMbgJ7GStlSHHBfvvmNUOBY3TdpYSXn/1ssG0w
         zP6w==
X-Forwarded-Encrypted: i=1; AHgh+RrtGgv58PMH2z7MpbrA2V+kE5krXHgxnF/+/rPURlW9DsGexb0lQuXu7gWXEq8ZCqTJWwGXp89IbVW+@vger.kernel.org
X-Gm-Message-State: AOJu0YxvyTfmOU45GxGyFughmyNDAFi0Ew/5yaT8ktsGZaJd9odPZeuX
	vdby14lUOea4p68w3HckOIqvZC1XzkfsJW7m7oi3Fjhdbi74EmC6BDydWGiTkh4GoXxiQkKCDMj
	WeDEK6VEGklr5zOECtk3WySkgpK7/w1zS3WNMoBPlQuuhKlEo/5Kzji5bRSt89LVz
X-Gm-Gg: AR+sD11DNN9oQvi3setpVr7Jyi3/kEXeMgHNuy5G7mjv9V6EZY4nnVU3FctUCnhMnlu
	5xZdOoXd9jUHcM0YqtYD0GoQXL00ZryNgTBRLoXgbjYZ1OQLdA7aC+de0KN+dqqffQK8eBfRaf4
	5t9kjcKS9ttqSU7CXId8wH/TNNp1soinsm5Suxe5tCgvAy2Gu9g6phi9EyWmfjXxbuGrtr5qKMd
	n0i0tdw3awA48Q57/EpE6ZiTwx1MYXNmrUWZZUmbzq+45gvSTOKAm9OISnDa3sUJ4w21+lB3uOx
	oH8UpTk3tKFj867t4hgnL3ofhUhbrKM2j0SDyoeL1japySbSJzTn3Dm4sinO5+/jUcwc40h7jBs
	TKuyPMLVcl97nFpHjKAUM3XFx9VvtDmEEw97e3dcliskSc8xv3HEQa5I=
X-Received: by 2002:a17:902:e884:b0:2cc:a08a:7743 with SMTP id d9443c01a7336-2cf1f4f2a94mr237661515ad.20.1784637974367;
        Tue, 21 Jul 2026 05:46:14 -0700 (PDT)
X-Received: by 2002:a17:902:e884:b0:2cc:a08a:7743 with SMTP id d9443c01a7336-2cf1f4f2a94mr237660975ad.20.1784637973742;
        Tue, 21 Jul 2026 05:46:13 -0700 (PDT)
Received: from hu-hangxian-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-31429f9bb62sm45258359eec.2.2026.07.21.05.46.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Jul 2026 05:46:12 -0700 (PDT)
From: Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>
Date: Tue, 21 Jul 2026 05:46:00 -0700
Subject: [PATCH v6 1/7] dt-bindings: phy: qcom,x1e80100-csi2-phy: Add
 SM8750 CSI2 PHY
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260721-add-support-for-camss-on-sm8750-v6-1-a5f841061d18@oss.qualcomm.com>
References: <20260721-add-support-for-camss-on-sm8750-v6-0-a5f841061d18@oss.qualcomm.com>
In-Reply-To: <20260721-add-support-for-camss-on-sm8750-v6-0-a5f841061d18@oss.qualcomm.com>
To: Robert Foss <rfoss@kernel.org>, Todor Tomov <todor.too@gmail.com>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Bryan O'Donoghue <bod@kernel.org>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Vinod Koul <vkoul@kernel.org>,
        Neil Armstrong <neil.armstrong@linaro.org>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-phy@lists.infradead.org,
        jeyaprakash.soundrapandian@oss.qualcomm.com,
        Vijay Kumar Tumati <quic_vtumati@quicinc.com>,
        Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Proofpoint-ORIG-GUID: 6OdqY2HCKXJ-nATeVYXFb9PdAyyJBpVL
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzIxMDEzNCBTYWx0ZWRfXytx48a3WOfXC
 hQkPoG24pMOCnDLpzNBBaZQGfjFvL8gwHPQQtjTT5hUnXwnt0urGIkDVnddIvpD7w2S1B1pHSlx
 slpkIOoNNbV9lgidNNZPXSKgfYRd/0P0ZjPh8Z0HrQYD1Zdj57zwUglOPGJvvPHPkcSszagxFOj
 pRvweGMRokQD6vrGqgBqbTm3MPaeSAh5R/uzbxKB/AGhp516jHVTXttHksY2iDssh7U5Rpb8P3h
 5IrsyOeSWGrrPTDcW/JIqB/qZ+lrycogfsU1wXw224IyIVwij1dT6DUyCqEtNDP/u/0NB150Nxz
 W0rot+6V6XcMF029rjffePKlx5FuFcMY7HcYXButM/YnDqmm/vur6uYLNJvTfwt/GV96MyY6Lkr
 K0l2YrF8owWO+RKmr6CZ0WbmGVA6UwDcGf86jhf3zELOvzv4mlSZFSYJ3pINN+TQ4XEFd/zs+iM
 KgpiDUms/mPfD2CrzIg==
X-Authority-Analysis: v=2.4 cv=I9JVgtgg c=1 sm=1 tr=0 ts=6a5f6a17 cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=EUspDBNiAAAA:8 a=_XPIB_xIY-Pt3-ArhVsA:9 a=QEXdDO2ut3YA:10
 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-GUID: 6OdqY2HCKXJ-nATeVYXFb9PdAyyJBpVL
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzIxMDEzNCBTYWx0ZWRfX9rNY6wxfWRB2
 lfLaQr2eB+3prNNAWZRRFWOttQBOt06HMK/xe/r52FhIYJ8yh9giGiCzXmRdPF9E0iiuwewoFr0
 H/OEslU3h7lUBBKjdF9e0fxcbZtV26M=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-21_01,2026-07-20_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 adultscore=0 spamscore=0 clxscore=1015 suspectscore=0
 lowpriorityscore=0 phishscore=0 priorityscore=1501 impostorscore=0
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607210134

The SM8750 camera subsystem exposes six CSI2 D-PHY blocks that follow the
same programming model as Kaanapali. Describe the SM8750 CSI2 PHY using a
"qcom,sm8750-csi2-phy" compatible with the "qcom,kaanapali-csi2-phy"
fallback, so the CAMSS binding can instantiate the CSIPHY nodes as
separate phy devices.

Signed-off-by: Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>
---
 .../devicetree/bindings/phy/qcom,x1e80100-csi2-phy.yaml        | 10 +++++++---
 1 file changed, 7 insertions(+), 3 deletions(-)

diff --git a/Documentation/devicetree/bindings/phy/qcom,x1e80100-csi2-phy.yaml b/Documentation/devicetree/bindings/phy/qcom,x1e80100-csi2-phy.yaml
index 7943049834f9..95375efb2597 100644
--- a/Documentation/devicetree/bindings/phy/qcom,x1e80100-csi2-phy.yaml
+++ b/Documentation/devicetree/bindings/phy/qcom,x1e80100-csi2-phy.yaml
@@ -16,9 +16,13 @@ description:
 
 properties:
   compatible:
-    enum:
-      - qcom,kaanapali-csi2-phy
-      - qcom,x1e80100-csi2-phy
+    oneOf:
+      - enum:
+          - qcom,kaanapali-csi2-phy
+          - qcom,x1e80100-csi2-phy
+      - items:
+          - const: qcom,sm8750-csi2-phy
+          - const: qcom,kaanapali-csi2-phy
 
   reg:
     maxItems: 1

-- 
2.34.1

