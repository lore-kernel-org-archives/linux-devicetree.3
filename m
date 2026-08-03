Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C12943D8103
	for <devicetree@vger.kernel.org>; Mon,  3 Aug 2026 09:14:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785748500; cv=none; b=I5/7NfOVaar6wxwFCRIGXCCGdcR8GuhRzrtJSZ7PivwnPEum8RkgukrgA1U5yh2YzQPUpD1HCmz6VyBC7OCqGwRsEtimkv29IrB18xo9rI/g81RFUau/DhdlcJwDLRPVIkX7lCmZI6GbxP75X8HN6M08GNdFEh/bt8u/oRcNs0A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785748500; c=relaxed/simple;
	bh=NDxcc0/lAnJ4v4Wq+AOH4sMpv05emL/8XS1fsgAmP5E=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=oxlsB390i0HtJgd110mmcaYu0nI2sxjedKGpF60ejhuDu2ZtApjotaIET0K3ptIzyMPMv6pO7npTS36B+iCvI+e++QqJl5LN3KLqktP4Hpon1SZ9hOwE9aDWF58XoKzhN9P5kcsOY/2WZpEGNwdaQ3fqKmkBanUFSgMqmdjOt4k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=dxdqV+lq; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=URwQXtQG; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="dxdqV+lq";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="URwQXtQG"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6736TEs44015164
	for <devicetree@vger.kernel.org>; Mon, 3 Aug 2026 09:14:57 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=VYtjNoonpSK
	8fv0gbNF7iVRMip5FISJFfgPMsjKARKo=; b=dxdqV+lq8HKACT7E5ZdTjdgeYgc
	sfgYQmwJN3EC4cOuFCm3cL+olfJh7fgucLJjne4iQXeg7klBe7kYXK1I4N9uDct/
	SBT70vB3bFne/8kk/yINP+2+S38WTYng2VqF1KdUo3XwPzNw8WBpHeUoh7nvFEAu
	fRQEQ4VGOwtyXbrM0nUS9Kou+sHKMnatoy5YyJGtpqcCHc0Tm2bwKFzy8Mec+rS7
	vIsQ3/ZJkjBReXgrSWR3B06tdVdnziUcaPzq3VuoyneLOacnLf6m3lmi7gA7VNvh
	JVkB2moDIshLyXbEvScPOw4XZ65siFDThZ5GUNIiAUfaRxkED32vRHrqGMQ==
Received: from mail-pf1-f199.google.com (mail-pf1-f199.google.com [209.85.210.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ftnrt8qvb-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 03 Aug 2026 09:14:57 +0000 (GMT)
Received: by mail-pf1-f199.google.com with SMTP id d2e1a72fcca58-84842381150so6328499b3a.3
        for <devicetree@vger.kernel.org>; Mon, 03 Aug 2026 02:14:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785748497; x=1786353297; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=VYtjNoonpSK8fv0gbNF7iVRMip5FISJFfgPMsjKARKo=;
        b=URwQXtQGGPICq1S+K5QjpIMcpCrqmsRLWcdkYMzpsNiVBI9PbUGzpRuDpLbpavkwvp
         JFaXjbBOVmNUhWmG0nSD3DTXeiOkm0cfJylpulni+fp2EFoui/8Za6dvN4i+1Nrl6GqL
         GKqxhzBRHs2BVEJJFxga2tGRr0rY8XD+cZQ/mgwzxnIktwOV8FucjxCxFkyguuCtpG1G
         5wkop1ygtpdLCbkCQ5nZbkAWLCOd/SH/dpXiWCU7prhL46O9b/wMA3Fdxp0JqNRiTVZs
         QARhKRxruM1f6ZQ6pWslaEkGCUcrtKnXa+jwrwzaaOmM1ONue5kmaeD5Rah0NpuKF2Fz
         sBsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785748497; x=1786353297;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=VYtjNoonpSK8fv0gbNF7iVRMip5FISJFfgPMsjKARKo=;
        b=eRozxUub2Te7Ytdirb29ZH+oCZyjIoZ3M/2wWzqSLtm6ds8TH7yp/wBWPPVSENsHvy
         eWNIFj94uMA/tUfZpWytT0cF+fP/ZgRqBAqWtl2f3hUlKUCrkXjNoy1pxfLjnsFk4w1o
         35AhJE7UEtuGRVt+2n5PxI+ZhplPoOMdY43XOZaOkWpvoPBYzUIQyC5NVJefYzkXc2Ah
         GcpYMlgw+kNYh6URqi6jrzxBtGmiKmnZ/z9zF6aOxwFeY2IaTanz6LcdCRZpIb4PhPJH
         63XhgY68WbM27juxWKb7HAXLe3h5SigY1G6NNLAdiqqAOQzroQMmn4UE7p6W1kSrAngS
         ak+A==
X-Forwarded-Encrypted: i=1; AHgh+RrQq11/IwudEF4XwXhXxal8LjSH2ymlL9kbZoNvypd+3KotKAkwrRjieO7lUgPGRkN+7tPRXIPdTVUk@vger.kernel.org
X-Gm-Message-State: AOJu0YwWLnbXcFpNKpdOs+BiU7uV5Dho0DGNN/8fxwJ2fG+i9z5BNu57
	HPxtv9GiLl8baSYyBQUDQHN5y9mO9YXvTZFR9NsjIkvo/X3d3ltkqoIDDFhIa6d0cWJtlrAa8CW
	P7eKIRRKpjj4tI4Fq+8yfon4YKJ+GoVNQ9XRZMKY1NMHTggpkXQ/A+AyFZoXAo4Fg
X-Gm-Gg: AR+sD13KO7fCCoX3Z+apdIkq/hnOYNzzAXLL/UWrpOT/5jm9DPl3MleNggjM6rlD2JJ
	GWeZdIbH+HFdzqWZmHN4JpFTY4waSt3njx9fAgABueycaeB9l18CfKaCFKoM3yAohvYhXn35bWt
	svnZm9yAfVFEq6nyb607VrN45oiXA+3U/pjbok4lLQkKL35s8C/K4qsYC1/HAm+2ZHkgDQFe9Q7
	+mneUVqWfXQN55Vou5edhDLzeNj5WVKDn53YxQbIPGce5qoiFdep8qgxOCcerYH+F6kXECx7sk9
	2KXUJcU9QvGrHvMSu8ulMxxLXNO1i71nNDuRx//VD9xmnPYWZ4pS251zAveMD0flCUbyRHYj0HK
	PLT9CYRFkGyUxNJeF+e74G5Tqc1k=
X-Received: by 2002:a05:6a00:2349:b0:848:2ab3:ddeb with SMTP id d2e1a72fcca58-84ee4777038mr8457273b3a.14.1785748496401;
        Mon, 03 Aug 2026 02:14:56 -0700 (PDT)
X-Received: by 2002:a05:6a00:2349:b0:848:2ab3:ddeb with SMTP id d2e1a72fcca58-84ee4777038mr8457249b3a.14.1785748495924;
        Mon, 03 Aug 2026 02:14:55 -0700 (PDT)
Received: from hu-mojha-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84edbe572d1sm3516376b3a.18.2026.08.03.02.14.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Aug 2026 02:14:55 -0700 (PDT)
From: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
To: Vinod Koul <vkoul@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Wesley Cheng <quic_wcheng@quicinc.com>
Cc: Neil Armstrong <neil.armstrong@linaro.org>, linux-arm-msm@vger.kernel.org,
        linux-phy@lists.infradead.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org,
        Ronak Raheja <ronak.raheja@oss.qualcomm.com>,
        Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
Subject: [PATCH v4 1/4] dt-bindings: phy: qcom,sc8280xp-qmp-usb43dp-phy: Add Hawi QMP PHY
Date: Mon,  3 Aug 2026 14:44:38 +0530
Message-ID: <20260803091441.3040830-2-mukesh.ojha@oss.qualcomm.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260803091441.3040830-1-mukesh.ojha@oss.qualcomm.com>
References: <20260803091441.3040830-1-mukesh.ojha@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODAzMDA4MSBTYWx0ZWRfX7kxwkgriXM2h
 637ZdNMMlGevk3aBjsTyYatSPfzAalMI+LLDTPh0kXv8mfyBafSSW6OpD8VRTxz7bLhlYft4YXx
 rGluCnmQRWtTWRJLhFU0PEfSuSqGuLMPWn/ABcJ6DPx37pc6I0sejcvD7UnNZbOsYheM7/3RDBv
 OUtAW0DvMwHSGDinsUngm2uEeS43b6AW4ScUSp2q0j0oOWLe8zqFjh5+V/odhDrBQMtU95PAhVx
 0zgBm7ms16Zshmkqqn6bP2vjggmIhX8Hu/hSX7ReCviGptXaXn6ArhfsQh+cFCNMHxz/16CAk76
 h/WvbAndnTq/9b1lx7A4sqm56nBCcDQzawyYyvOrf0U66kINM9Yv7Ad3pFzVHZVT7+0Fw7Jof7C
 WRB68SgJajzZFVHVgPAWBOCWkKA3+zqaBhVSwTzaZTZIRoqyZlKUN0OrC9Z+Hdyb159oEBLf3tO
 aRpNCf6Fdr3UTJ3bUUA==
X-Proofpoint-GUID: F8xBOIOZ5ZQ04duj5636YbSejfldmZOv
X-Proofpoint-ORIG-GUID: F8xBOIOZ5ZQ04duj5636YbSejfldmZOv
X-Proofpoint-Spam-Info: AW1haW4tMjYwODAzMDA4MSBTYWx0ZWRfXyGyQKTezBGYp
 GqnII0fYyJVb8IXLUDmV19X17Hm15ITvbxHAYYFk/rXqA3fdMZEeHfPNkcA074wwWt+kUEhk75c
 rGcNGLKCybPGHv8oC41W+KI6/L6j8/c=
X-Authority-Analysis: v=2.4 cv=Ft81OWrq c=1 sm=1 tr=0 ts=6a705c11 cx=c_pps
 a=WW5sKcV1LcKqjgzy2JUPuA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22 a=EUspDBNiAAAA:8
 a=VwQbUJbxAAAA:8 a=8IMiPDtIn6OAJiDpRukA:9 a=OpyuDcXvxspvyRM73sMx:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-02_06,2026-07-30_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 impostorscore=0 lowpriorityscore=0 clxscore=1015 adultscore=0
 phishscore=0 bulkscore=0 suspectscore=0 priorityscore=1501 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608030081

From: Ronak Raheja <ronak.raheja@oss.qualcomm.com>

Document the Hawi compatible string for the QMP combo PHY.

Hawi uses a new QSERDES V10 register layout with a new COM AON module
and hardware-specific PHY init sequences compared to previous targets,
requiring a dedicated compatible string.

Signed-off-by: Ronak Raheja <ronak.raheja@oss.qualcomm.com>
Acked-by: Rob Herring (Arm) <robh@kernel.org>
Signed-off-by: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
---
 .../devicetree/bindings/phy/qcom,sc8280xp-qmp-usb43dp-phy.yaml  | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/phy/qcom,sc8280xp-qmp-usb43dp-phy.yaml b/Documentation/devicetree/bindings/phy/qcom,sc8280xp-qmp-usb43dp-phy.yaml
index 4eff92343ce4..ea3f1699eee8 100644
--- a/Documentation/devicetree/bindings/phy/qcom,sc8280xp-qmp-usb43dp-phy.yaml
+++ b/Documentation/devicetree/bindings/phy/qcom,sc8280xp-qmp-usb43dp-phy.yaml
@@ -26,6 +26,7 @@ properties:
           - const: qcom,sm8750-qmp-usb3-dp-phy
       - enum:
           - qcom,glymur-qmp-usb3-dp-phy
+          - qcom,hawi-qmp-usb3-dp-phy
           - qcom,sar2130p-qmp-usb3-dp-phy
           - qcom,sc7180-qmp-usb3-dp-phy
           - qcom,sc7280-qmp-usb3-dp-phy
@@ -209,6 +210,7 @@ allOf:
           contains:
             enum:
               - qcom,glymur-qmp-usb3-dp-phy
+              - qcom,hawi-qmp-usb3-dp-phy
               - qcom,sar2130p-qmp-usb3-dp-phy
               - qcom,sc8280xp-qmp-usb43dp-phy
               - qcom,sm6350-qmp-usb3-dp-phy
-- 
2.53.0

