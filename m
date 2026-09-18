Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4EC9D49D59B
	for <devicetree@vger.kernel.org>; Fri, 18 Sep 2026 10:39:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789727991; cv=none; b=WkZbXUoO5+5QZO4cOmmL/+g/ygsv/8aF7+z9WlvV7u7w0+HNy5bLbnlrMGsnVzMiYRCtVIa8rzc110dwe8vZcCfHXNbwi4N6kQBs4jLyXV+S4nrI5qOrrCcEIlK8FO2kyEmZamaxTVkivBrGgSp80YoaqHF0HV0VLLIwcdwQpcc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789727991; c=relaxed/simple;
	bh=cGF4M7H2BWDSkfXAPdpNOY2HONhPgqyoW2d8CtFkC8M=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=SqQkqJRg2M25meEaJUjsSc+0USoyBa038SAMugK8fbF/CI7s2FyUbG8TIUneiZ9wqpQ8J4ZmbSke6KzvRdw2ncEp9Ot56H1LT+2+8mjLJ+QIKXC5OFSrPQeIJVC1l8nfkBipqVFXsto7/5/EI2cIoFuCTHV8hynRiBQ5+ORD1EY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=H4JektdX; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=erQRKfh5; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="H4JektdX";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="erQRKfh5"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68IA3boa3208438
	for <devicetree@vger.kernel.org>; Fri, 18 Sep 2026 10:39:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	uihisGELWKJXs3ghPTChJvWF5WlMaRjqVwCduuDVyXE=; b=H4JektdXU7n8uCkQ
	yfPKXqFLy2+aFUSqnCYq48cDfUffZIeqchY87OzqOl4MmpKKidu5KJLq99kUfAQu
	K07rHA3aqYC90CPW4gAkh9ak9BVmucrncoX9HNMJ7DjaHFBYhEnQmRC2SfaTsJXh
	NXzznxTwQiNb40UneBtv5ZLTF/BerqJs+LN11CTMX17fmj7fLV1oflBsayRcFFAW
	3UDk8Jc1I14tBtI5lOlQXBJWfMYoM4NvGtJRquF36icmnDB0XXoDpMTy7tmqcXDY
	30NiAoMPEwZgMoDJ7SEhwEsVdfNdLIW7TX2MENAPiSIqwZaCa6asT9X1Z7bRVtzR
	EavLqQ==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gs37dg3yr-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Fri, 18 Sep 2026 10:39:46 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2d6fed0652bso7854005ad.2
        for <devicetree@vger.kernel.org>; Fri, 18 Sep 2026 03:39:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789727986; x=1790332786; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=uihisGELWKJXs3ghPTChJvWF5WlMaRjqVwCduuDVyXE=;
        b=erQRKfh5VGHlqACKEHWaIkSB/OykxG0ffgngMrIAcjMrwvxSqUtd+bIwTtT98/B8Y6
         dRsuOdFH/CEcvlQip/lMXpw1godRJHu0FrFurWSlhXGW+66IiqYfrdDpQiPnrmde2NoM
         7y2WJst7hUPCOxQ9OZXgBO2QY7s3y7ZqifbnqN9s5CsgF2Wox/hYrDLlAz5SMWdRWU/5
         vkz9XKRcx6zts4Ja64czgwKA4q2P0ijvU0+gyavjUl9d0SZK3KjNsyCOwQ+4ZlQPTP48
         W8uC3FoiAu/hg6p2waigSoKGND9jhVJu7RxC/O0FWfM1LshzNa2z1hNULoebUYtjPs2W
         OiXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789727986; x=1790332786;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=uihisGELWKJXs3ghPTChJvWF5WlMaRjqVwCduuDVyXE=;
        b=ivSyFT4ZTgk2ujeYJ5vDAk583HOo7KLNpNGkxUJDznVG90+KUDd/ZNrL/ZUW+j55tz
         HCv60BlbWZ5gOJN9ott3eTF112xGRk42rG/aN/fHDJlHPthp2EQwRg37GOfiP3jtaJQ4
         EiKbgGVtHGJHCjMhZCbtR3eYBv7/EGRykgCe25RNtc3uBf1mnz43gxDwBB6xhPmL7BcR
         2zlGNHKf65TCFtqY2dpy+PNTpwRg72fZG9MSRiVV6uFW1+vHWr7zk9YbK3qwNXPI1N/C
         YOlruyoi9lJypZxhcMSPcdxQ6RkmlXq2GlKo43E5frpU8bVDtbj2hdhKBX7/Cbkb2Qag
         jSHA==
X-Forwarded-Encrypted: i=1; AKwUvBzbvZSYjDmkfKz0Mv9ZqLGeZfpUGbyDazNPdWIwTAfUiCBqLZHdEcH5pNWGenFMw+xgL7cpqhg2g0Ep@vger.kernel.org
X-Gm-Message-State: AFuF++l7eoKOLe6nErd1CXw+RT9cUxs8nXQjFrRH9sVVRjS0LaFsMLZg
	d+Br0QJScGrYwK2U9zSIepBhubY2dS4CRromYEWupw8DHvX3L04MdEV7zUJxNJvf7YCY8J64o/t
	X08npj2E4XzAsTnU4SCO7PTFBf9RfMEDk1hIQx02We7llXXgUWpjZfADeRNReYrel
X-Gm-Gg: AYBFou13l0oiNVhVZD1uimeSnIFWpTfrc+xpwp9sDHH3erquqSqHuAXi2psNN8G6gVr
	kiZrEw+Oce53n+QN8sS21sznQw2Vd4cDphmmPKeS543fCRJpvKSJEgMQUop40R0D7ljzOsB3o17
	QTJUgiLKMBb2M9h6v++UNUi8cy1/T27ZiLcJb8gYPDCc05S1jc2toGPOS79ioat1UuiRq5hIBW2
	v/+r5tfHpQP1FvwweyTmh9yWhGo8IlVxe69aoY9vvDCZGkFiSB79QVhOdCqXgxuZsLbKbwaS6+d
	Bp0FqwS2KAZn2X7ahFQe1tuocf2acjxscjCYlnRQHFu4bB3jFr5/W0bjI7sQ4Fkewh7rSZfL5VP
	lMBN6uM4nJN11Ir9ZIdd9fuB56A==
X-Received: by 2002:a17:903:2ec3:b0:2cf:9347:f445 with SMTP id d9443c01a7336-2ddb1adf192mr49207505ad.10.1789727986128;
        Fri, 18 Sep 2026 03:39:46 -0700 (PDT)
X-Received: by 2002:a17:903:2ec3:b0:2cf:9347:f445 with SMTP id d9443c01a7336-2ddb1adf192mr49206925ad.10.1789727985688;
        Fri, 18 Sep 2026 03:39:45 -0700 (PDT)
Received: from [10.213.101.15] ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-33c286d98e7sm4020702eec.9.2026.09.18.03.39.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 18 Sep 2026 03:39:45 -0700 (PDT)
From: Pradeep P V K <pradeep.pragallapati@oss.qualcomm.com>
Date: Fri, 18 Sep 2026 16:09:07 +0530
Subject: [PATCH v2 1/5] dt-bindings: phy: qcom,sc8280xp-qmp-ufs-phy:
 Document Glymur QMP UFS PHY
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260918-glymur_ufs_qcb_enablement-v2-1-16619f7e36a6@oss.qualcomm.com>
References: <20260918-glymur_ufs_qcb_enablement-v2-0-16619f7e36a6@oss.qualcomm.com>
In-Reply-To: <20260918-glymur_ufs_qcb_enablement-v2-0-16619f7e36a6@oss.qualcomm.com>
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
        gopikrishna.garmidi@oss.qualcomm.com, jagadeesh.kona@oss.qualcomm.com,
        Abel Vesa <abel.vesa@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-scsi@vger.kernel.org, nitin.rawat@oss.qualcomm.com,
        sibi.sankar@oss.qualcomm.com, Taniya Das <taniya.das@oss.qualcomm.com>,
        Pradeep P V K <pradeep.pragallapati@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1789727970; l=1139;
 i=pradeep.pragallapati@oss.qualcomm.com; s=20260911;
 h=from:subject:message-id; bh=cGF4M7H2BWDSkfXAPdpNOY2HONhPgqyoW2d8CtFkC8M=;
 b=XzF0ig8/4xrWYyFA3Oq5tym/qWpafBD2LB5j9S4Py9tkdaCW4+PyCdSCMH10Q18nc1dRGX3ma
 dR8Y2ZUi7BaACkcHS/z0R8Wqi987zFC9aNVjuj6osBsOUctZec/o2Zk
X-Developer-Key: i=pradeep.pragallapati@oss.qualcomm.com; a=ed25519;
 pk=uyRUsge8nQMwf3iW/e/o0U8z9nWLCMm1MGKxEftztic=
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE4MDE0OSBTYWx0ZWRfX2Nqx/SfiiH9Y
 Y/9i3z//xspnVTH4NHTviUnDPwai+CHSshnoMxFr2itYdXfLWuyzQH0WbnDKxkn+Z4E3po9TYEg
 MI+Qg4c2Ef9669E25ecPU+NuGt8tF3M=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE4MDE0OSBTYWx0ZWRfXyfZIrzFSA2g1
 CoFwjSpIsEFOohjner410yOVyviut7+GsVDHVi6OzgIQ0m9jaVddQup8I3wz+Gr+lGYmF2767FV
 0wS/EmpEDzS/g/6Xux3bMYMqrqr3/wzGd4F9gCymrMmnZZODzolelKbeyBB+2nFmP0hafFxa51H
 Yzy40kUhVVXvnQUm2d5dAYejpcctiYKs3BxNPoFkVhZqW3GSwhcU6MzR4OLLTbnAcAfXpfWUaam
 5eKQvzYFf3of72c2CqfWDMM/z8CCz740u8ncB6cVjuVMfDnC7ojzNx0fZG2EbshBuVw6Tf7l5aL
 TtaQUnaiObRib90oUiLFuRNzHzKrIFDrE2UrKVcMhAMGZCvmBCRSou3AatG83H2YcEcm83r3qv4
 vuRPCjsHogU6mcN0cJpnCfG9g0aZA7eVPW/s6vtV0kG6TFcCPqB1DsjRu6JYGkUeSutiYoSzToo
 vU+YfWGHjzLRqsO3Blw==
X-Proofpoint-GUID: rYETmoF_511a4ml0wAm2CqLVu_MeV-ND
X-Proofpoint-ORIG-GUID: rYETmoF_511a4ml0wAm2CqLVu_MeV-ND
X-Authority-Analysis: v=2.4 cv=R+mWitRX c=1 sm=1 tr=0 ts=6aad14f2 cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=EUspDBNiAAAA:8 a=BahsdhlD1VgbZ89a8f0A:9 a=QEXdDO2ut3YA:10
 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-18_03,2026-09-16_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 adultscore=0 bulkscore=0 impostorscore=0 clxscore=1015
 spamscore=0 suspectscore=0 malwarescore=0 priorityscore=1501 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609180149

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

