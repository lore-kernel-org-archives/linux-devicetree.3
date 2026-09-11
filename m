Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E1587310645
	for <devicetree@vger.kernel.org>; Fri, 11 Sep 2026 16:47:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789145255; cv=none; b=syUvqZALiCfh4qPkUVi4HohsViANj5vGDTLZc0r2MliNku4WiNtuAtt5eWs6UnMgNXJ6qVd1FSv/LdUgNWXJAEd/8Sgo/p+LyC7Rc95tahAZFvp6I4hPpbXwt1LtBXBLNQJSZ6+IdCKd2TXwXunULOcUGUjYQ/wEsL6SxCJxS/Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789145255; c=relaxed/simple;
	bh=cGF4M7H2BWDSkfXAPdpNOY2HONhPgqyoW2d8CtFkC8M=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=oYT9dW+/rJORu8W+2c3mmFIud2SW2vAj+c2NbVNT9U+wFtysD9YkuyZxk1E4jf7LPFYVDGYVti+Rq/kpuWvaVAedTvEq2PS5LvVfr3ZZOwgxMV1mlhyyc5ydFi8fhgTi79gPuiVHqsOutVCzfxoACuH8AUtGKCAyupzONtAuKNs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=UJyok6/l; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Pe6tq1iC; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="UJyok6/l";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Pe6tq1iC"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68BEm2hN442908
	for <devicetree@vger.kernel.org>; Fri, 11 Sep 2026 16:47:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	uihisGELWKJXs3ghPTChJvWF5WlMaRjqVwCduuDVyXE=; b=UJyok6/lz5rH1yy0
	mHE6FTCwqUrRqNR6Y8heDrqlvVTL6ahujHmMUpR2CW+SgmflvBDrwmhRB0M6SQzp
	+ZkI8MKkdT8WMYmv3g9qlf893zXNSCEruGmsr69KrQWXQZLtFBGpAHLDagDPM5hs
	tWMyExZD3tcYu1Y86VAMk76xHXQlMSMY8JXAlbNqYKJdgli0KqlZADbxd0gqUu9k
	TRTaIDoXMKpP01pI6Ec+g/ebF5BMuAeMaZ6g1bOWZtk+MSGZbhH8No7388K/vcrC
	wg8+7DEj8Oq5lWUSyH21I1mG3TDkXwPaodD2Ii0GiqbvUt/486dZ9vLS8/V9nT3p
	nDZTPg==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gmapg2xh3-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Fri, 11 Sep 2026 16:47:31 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-38e54b6556aso1575914a91.2
        for <devicetree@vger.kernel.org>; Fri, 11 Sep 2026 09:47:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789145250; x=1789750050; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=uihisGELWKJXs3ghPTChJvWF5WlMaRjqVwCduuDVyXE=;
        b=Pe6tq1iCgr6EdxShSP2vGCLkBAC7xslzN3oDJJtrD4zvtD1aDj1c+GeqOXQUeaUM6Z
         M764tMnLq0OFuQhb0qo4gWtYy7fnbIPKzOpkyKXqZpIgm8d4n30hbV5aKf4uF9uNJCSz
         Jy7t1UNpXltx6tvg9rwRzO5UktLYDW7cvKNxnScalKOMEjXuqLFXBS+yzW+8UfIkPIB4
         m+XSnf9vRwp34FI+WiaZOXL4HYnsFvt8OneXrKejWn42K80BW53hHVGz4zAhsxjnQw7k
         aJYlrD7CyQqCbo5C9xbYPyWjhb6xAdHQ2057B4n/wpiKqPdcQvYGwelkguvzO8xNAod4
         Ws0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789145250; x=1789750050;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=uihisGELWKJXs3ghPTChJvWF5WlMaRjqVwCduuDVyXE=;
        b=qZSoQYqCbL6Spw1NcWv7qIfCtWLpjohnlfz5wOWyrJ7YBjJz7wBx510k3Te1xnAhmV
         vR+7eflUOiNvH9Lbn2mS5PHcFDxLAlt+zNVVIyXQ/gde34+O5HtkNgQYjyMO7/ycpLGt
         OWtezNfeUGN9d07iCJoG2u+n/B+ZdyEw6evT+p1cmI9ELjmnrYomCwP+jjJYMa1hPm2O
         wtS8gITc3Gq8TUpTw7x81KvQD9FECPYj+GM4zjVNLJpLCK9N6jEtS+xARBkEcZry/Kpi
         a16zlgFBsn59uBcFSSCcWASP9CcOGC66dlX8XHoSf6NkODk9l2mXfkCE3SlMXjkzcj34
         X7Rg==
X-Forwarded-Encrypted: i=1; AKwUvBxr1GNoeyL03OuXqz61jR94z4JpbT+TkCUT1iyaZIancuEvJ0WLPVKyiOUY0rV3dbD9182GRDhnsgJ8@vger.kernel.org
X-Gm-Message-State: AFuF++kFjKSlh6SANexJQAW8pfhl+KWMheH+c9Ohxo+LCT2B9tOmNS3w
	dtHW/QZeRNHTrTYQoaWzUkB7lPE5swOVfJIZ6u7MEyCKdjFwsMqarYGwqTwaWp/vfjGdzImba9z
	UiIJoB2QCUlwdyahR7S21OfWn9Sjo0aNDdewzJdrHwoNUOSaA9SED9Gm1rfVrLmqB
X-Gm-Gg: AYBFou2IuKXkqUkZAl7Zhl72eLAN/sPMrw0iLtEq274qrCAWI9LD4HvSO89Mw90l+C8
	NgPSk7oTN7WsCWMq6tqIjr0pr+VS1l1arWpdZ3NZDcBwwJaPGIYwAD4gZUpOvvq2j7kxGRrMLKu
	kG/72r4XfUkpqRLKupGuqQXV0G7xOq3eKHrFGPk/HW/CHI3pyGiSY/oUiFAdZRPNgeHFQGoqQb7
	TVL5AfQ7sdDLszJw25O/8uenxEDbFy27NYD5Y63n6r/cK6XUT/AyqSMRxK/W4W1gaT0NJ8JeYE8
	zXzT0u8NpVa58/hokk+Mnbq6IX2gQBVkDl3ZR69SSBh22mgIqNVvrZKHIPvTGxgn+cVSvpnHq8x
	Mm2JfwxxV5OnK2Q94I8O04KHxEQ==
X-Received: by 2002:a17:90b:518f:b0:38e:97f0:aa4b with SMTP id 98e67ed59e1d1-39d9c1bef27mr9067182a91.13.1789145250459;
        Fri, 11 Sep 2026 09:47:30 -0700 (PDT)
X-Received: by 2002:a17:90b:518f:b0:38e:97f0:aa4b with SMTP id 98e67ed59e1d1-39d9c1bef27mr9067137a91.13.1789145249963;
        Fri, 11 Sep 2026 09:47:29 -0700 (PDT)
Received: from [10.213.101.15] ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39da64d4bdfsm944193a91.0.2026.09.11.09.47.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 11 Sep 2026 09:47:29 -0700 (PDT)
From: Pradeep P V K <pradeep.pragallapati@oss.qualcomm.com>
Date: Fri, 11 Sep 2026 22:17:05 +0530
Subject: [PATCH 1/5] dt-bindings: phy: qcom,sc8280xp-qmp-ufs-phy: Document
 Glymur QMP UFS PHY
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260911-glymur_ufs_qcb_enablement-v1-1-b9fc5e2ee99a@oss.qualcomm.com>
References: <20260911-glymur_ufs_qcb_enablement-v1-0-b9fc5e2ee99a@oss.qualcomm.com>
In-Reply-To: <20260911-glymur_ufs_qcb_enablement-v1-0-b9fc5e2ee99a@oss.qualcomm.com>
To: Vinod Koul <vkoul@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>,
        Manivannan Sadhasivam <mani@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Alim Akhtar <alim.akhtar@samsung.com>,
        Avri Altman <avri.altman@sandisk.com>,
        Bart Van Assche <bvanassche@acm.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        gopikrishna.garmidi@oss.qualcomm.com, jagadeesh.kona@oss.qualcomm.com
Cc: linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-scsi@vger.kernel.org, nitin.rawat@oss.qualcomm.com,
        sibi.sankar@oss.qualcomm.com, Taniya Das <taniya.das@oss.qualcomm.com>,
        Pradeep P V K <pradeep.pragallapati@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1789145236; l=1139;
 i=pradeep.pragallapati@oss.qualcomm.com; s=20260911;
 h=from:subject:message-id; bh=cGF4M7H2BWDSkfXAPdpNOY2HONhPgqyoW2d8CtFkC8M=;
 b=ScVpIgOtIpyh+zz/FM85IaQRzpO1CYWvF3zezlK70MQ69qTI3KN7mM03N0ll8YBeXAIO3HOSF
 RmtA9jO4UcZANvQVPYSanKloQKp30VzV5xrSHH+j7kz03E9iCbd84gg
X-Developer-Key: i=pradeep.pragallapati@oss.qualcomm.com; a=ed25519;
 pk=uyRUsge8nQMwf3iW/e/o0U8z9nWLCMm1MGKxEftztic=
X-Proofpoint-ORIG-GUID: u5R5fL_SxqSUHJnYZlBSDWVwjHuoiKoi
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTExMDIzNCBTYWx0ZWRfXyy4p345yaxy7
 duUXxU2tkyckaE7r0u6A0ow5hWZG8kBC1URSH6+H7zcstaKLpIFCHlPG/IQKPrLoGSgjmgg0VCi
 9CypRzzvacQXqEdJMXkKJ3AHAMS9V4Y=
X-Proofpoint-GUID: u5R5fL_SxqSUHJnYZlBSDWVwjHuoiKoi
X-Authority-Analysis: v=2.4 cv=DLoacCNb c=1 sm=1 tr=0 ts=6aa430a3 cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=EUspDBNiAAAA:8 a=BahsdhlD1VgbZ89a8f0A:9 a=QEXdDO2ut3YA:10
 a=iS9zxrgQBfv6-_F4QbHw:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTExMDIzNCBTYWx0ZWRfX8mBrcdrVQjhz
 iU7sT7AgMl5m6abAX20wd2arDU3IcZumJ6kxwp/jZmI52Hj4Z4C7X9/qDBBnapS0VYoqmWzCfvh
 hqPnym70JNO1taIC4oINPR4HYebpLfy3jOZMMN9ZbnkC/lIYKLVrlWeGoEAqCTpemCaGgLRfmnV
 SwdAaurn5F25LfZmBUcSbfkTP5V4TZzOa5l8KpcJztz2yDcBrqfuRU5Pe3ivs439/u43VjxErl0
 nWW86xDbC0GrN2QRas+eIc9bB/Hvafd8qc2lOhll6xC/spzLGxDQ3rTnad8UeOYg0585MhHBSIf
 oAtao1rXfxIqE05ttapKtPInoMYWSKFLKV6YvoQFIxfioGnkKkQMeLJ3WqI4jF+sFePoBge/c13
 yuXT1Z/9ZjRTlG6z/gq7+4VyAiGiYX7L+vOg5L3i1hE3vZcw+k6U/iXWY0NN9o7NQ/s5FJXRmeC
 vaSyphKO8Sr66hltbOw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-11_05,2026-09-11_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 priorityscore=1501 phishscore=0 adultscore=0 suspectscore=0
 spamscore=0 impostorscore=0 bulkscore=0 clxscore=1011 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609110234

Document the QMP UFS PHY on Glymur SoC.

Signed-off-by: Pradeep P V K <pradeep.pragallapati@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/phy/qcom,sc8280xp-qmp-ufs-phy.yaml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/phy/qcom,sc8280xp-qmp-ufs-phy.yaml b/Documentation/devicetree/bindings/phy/qcom,sc8280xp-qmp-ufs-phy.yaml
index 4efe40c0dc97..e1b19ed42542 100644
--- a/Documentation/devicetree/bindings/phy/qcom,sc8280xp-qmp-ufs-phy.yaml
+++ b/Documentation/devicetree/bindings/phy/qcom,sc8280xp-qmp-ufs-phy.yaml
@@ -38,6 +38,7 @@ properties:
               - qcom,kaanapali-qmp-ufs-phy
           - const: qcom,sm8750-qmp-ufs-phy
       - enum:
+          - qcom,glymur-qmp-ufs-phy
           - qcom,hawi-qmp-ufs-phy
           - qcom,milos-qmp-ufs-phy
           - qcom,msm8996-qmp-ufs-phy
@@ -109,6 +110,7 @@ allOf:
         compatible:
           contains:
             enum:
+              - qcom,glymur-qmp-ufs-phy
               - qcom,hawi-qmp-ufs-phy
               - qcom,milos-qmp-ufs-phy
               - qcom,msm8998-qmp-ufs-phy

-- 
2.34.1

