Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B87B7376469
	for <devicetree@vger.kernel.org>; Fri, 15 May 2026 11:39:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778845188; cv=none; b=SPtzR02MIQ8WpZNEXzcrmDNDqt0SYC/0y1zaPIZt/ARcyG0SD1j05izVEA8F8YS0uXcaGYnfONX9XYCFPXvbxKZbYfBiX17R4I5QYXtA01aQfcryYQrqyMT2Ct4xIHWH+bGg1fgz4kZDIKawoi6n/wYCcEneE2iPKhL/+TBQVBs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778845188; c=relaxed/simple;
	bh=EW046zoiuLAPmtsqyP76uePwyQeRVtPiin3oxyUHQ+Y=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=HN/tKFLrht/KHIOew3LooQlOXPfH4EY0VEo2mLZ0trjUHSogHny86+XSPS9Rd3F2xrdAfpIo+NBImcy8wMR0F5FoyNuMBE1yPUV38oOeR8uet7Pu1IPru7Nagj0/7GnJTp+f4vCClmdHSlYkui+i27J1tBVcdf+OS/MGtbfffiQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=B0msKWLf; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=D2YKYtX/; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="B0msKWLf";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="D2YKYtX/"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64FBCUNq656082
	for <devicetree@vger.kernel.org>; Fri, 15 May 2026 11:39:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=QWiz89LQJ5jwc2iwcQq0lt
	DcxqIAHER4VQP56IlfDPY=; b=B0msKWLfOp9IJGyn4BL53e3E0FZ5emaiewtGrw
	mg89UC53M3e48cVl9QDLWwFoSoM7M3yBAQ/yhm2Vet+fcDXkPi+vM2AHiksnp1T+
	+JtA6VsrRzatiG1SgieyCeKngOfGsDIXn2CSIPPHsm7Ay7fehpmGEDwtdZirKf4b
	7nFphzXx19vaa+O/KOroXbpwC8A1/ci8esZSIBS2cFOGHcnQlHr4wnQerBTBkX2j
	V0fPc8LmUbWODsHAq2HyeH8ka2FTEjaMIp9Pbepo9IkT4GKiEpSAupa7O/BruB9j
	4B2j0218IdTrqW6HxInEy5hYsgAVqp1rARiRd+a/87qFds3Q==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e5m1pu4pq-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Fri, 15 May 2026 11:39:47 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-50fb3c7b989so138245091cf.0
        for <devicetree@vger.kernel.org>; Fri, 15 May 2026 04:39:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778845186; x=1779449986; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=QWiz89LQJ5jwc2iwcQq0ltDcxqIAHER4VQP56IlfDPY=;
        b=D2YKYtX/JjpOYVw8ZKNBaMyrUdKVLLlCMrc7gNVoc3KkzjM4fhU6ZQpxY/m32eVTuN
         LjMydgnTgDAVDZSb2ZcSfehj1K5bUBJZLYM0s2Y8XP7lQjSdPrn2h1bpkmTNzc5bPKFd
         e3gCRigzghw1qW4MH10q7o9li8aYJQcgVHVrmdHJ6k5tmfp/viKCQBtNV+Pre2sC8sUK
         VomYQUiwXHjFmXC4IZd3O9gtssQZ7lQw0Dt4nfScthW4WqzXFVBJO5himD6YP2VybUqT
         4Z2MLtp767ZqPZ6TLVtOmuSYiUKdVyuygYXuTK5053WAa7QVNkHDT7iBq3W74OBRn2Ki
         ei7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778845186; x=1779449986;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=QWiz89LQJ5jwc2iwcQq0ltDcxqIAHER4VQP56IlfDPY=;
        b=JrZVfEpFL32qaZi90R0FL7fcOTwtcVFUXtf4eC7vNQnCuRI4eT9zXhLI7QdWer/Zp7
         FsTXU1Hxt/AuuSJTnmaQY7YKV5ligF0aXrUMb0aqF4bUEDmqG65A0MwSeo+GUL6DZ2+X
         H8KbBaKNxW2KYYHFYHn1ij8lkPorHRx5Op2tUgF12n/vPe/PtUbLEMW6VSonVTusEDJ9
         upEygCIz89IKPeW1eBxYkma69dQIL1EoHfoYLGMp54bR1h09uoPHKT+FhBG3PmH0w73Y
         PalIiF7hd+7dp3AJ0dg5PKGAR0F1bTGoAFxoi345oE5w0UWaxK1CXG7u4yr7pOx/F5+1
         qfzQ==
X-Forwarded-Encrypted: i=1; AFNElJ8RrI9K5GonEuimZdCR9gwqnyTJ1PMUb4IifJNQvj7lY9x8lN0PkAxmYC9VpUWFHkXphyC521RaorVg@vger.kernel.org
X-Gm-Message-State: AOJu0YyAFLFwc8Tlcm16YoJx9gbHvBqG3QjKUgB/PbiaBCFTuFamhHJb
	OXbxrjp1+jWSB+9tMh2c8Txj2AJdwe/ZlDj0dedbl5sIg+z+nSen+3SJYhFli9lit3Xbcx51Lj0
	zkVKNoOYnyuspdY5zLq1YFa87lszweejBgJPiSX3jTPfFS4NiYJCOZ1AEk63q7d9m
X-Gm-Gg: Acq92OG1EfrPUQXG8HkTk6EOdNoPYD3WimW/tx9Z8wSq8FJmAOd8AmspCxQihcpBshQ
	h0IPvUMddQgzECW+8262c8nllAL1J+QvCoVLyrg6+qA404+Sx5ZTdEa+9mYcLWJY/n87WRzSgSk
	IDykmW5hGcjqnRDK4l4Y7AC3Fbcdgm4w9zoN1lysJ+j3xlv0du32jqWPV/l1FmQwF62c4NteMs2
	ysNLMstxCOGgBeRO2wNC4HP0LJqX+jAzb6PSDnosb5IIeLn4Qnhser4jb4IJ/FKHKWOyhsFAGHh
	MwsM8wgaS1RlaUSIpZlvT+Gp/HY7N9+kUlSHlA0yCyPFn976/3WSejo8Wnfdc78RwPp5OL1qCYk
	j2vLJQKLazXhhCReT1Bc4TMZqBVPM
X-Received: by 2002:a05:622a:4d44:b0:50f:c65f:a4fc with SMTP id d75a77b69052e-51659ff98afmr43393531cf.10.1778845185979;
        Fri, 15 May 2026 04:39:45 -0700 (PDT)
X-Received: by 2002:a05:622a:4d44:b0:50f:c65f:a4fc with SMTP id d75a77b69052e-51659ff98afmr43393021cf.10.1778845185465;
        Fri, 15 May 2026 04:39:45 -0700 (PDT)
Received: from hackbox.lan ([188.24.162.19])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48febe5821fsm11994135e9.14.2026.05.15.04.39.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 15 May 2026 04:39:43 -0700 (PDT)
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
Date: Fri, 15 May 2026 14:39:36 +0300
Subject: [PATCH v2] dt-bindings: dma: qcom,gpi: Document the Eliza GPI DMA
 engine
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260515-eliza-gpi-dma-v2-1-1255b43d5ca9@oss.qualcomm.com>
X-B4-Tracking: v=1; b=H4sIAPgFB2oC/3WNQQ6CMBBFr0Jm7RDaCqgr72FYlDLAGKHYAlEJd
 7fg2s0kL3n/zQKeHJOHS7SAo5k92z6APERgWt03hFwFBpnILEmFQnrwR2MzMFadxqxM1VHIXNT
 JGcJmcFTza+/dih/7qbyTGbfIZrTsR+ve+8NZbN6/9ixQYHUilddBMCq7Wu/j56QfxnZdHA4U6
 7p+AXFRlNzDAAAA
X-Change-ID: 20260513-eliza-gpi-dma-6b5341271f09
To: Vinod Koul <vkoul@kernel.org>, Frank Li <Frank.Li@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, dmaengine@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
        Abel Vesa <abel.vesa@oss.qualcomm.com>
X-Mailer: b4 0.15-dev-bc6c4
X-Developer-Signature: v=1; a=openpgp-sha256; l=1337;
 i=abel.vesa@oss.qualcomm.com; h=from:subject:message-id;
 bh=EW046zoiuLAPmtsqyP76uePwyQeRVtPiin3oxyUHQ+Y=;
 b=owEBbQKS/ZANAwAKARtfRMkAlRVWAcsmYgBqBwX9WaDMU91MXGkSLVrbuul5VqduX/09wMqkt
 ox6jXyyR32JAjMEAAEKAB0WIQRO8+4RTnqPKsqn0bgbX0TJAJUVVgUCagcF/QAKCRAbX0TJAJUV
 VkwPD/43dMPZqMijRpp9ridMO+U1joOPlrQsRO202nppoQ8seQmdShy62OZ1Px4WHphEMA1IGrL
 7+/dxyUOauT/QTFbTABzmmfDmPe3oucsKF8ra2p9CAh25FXK1rys53T2xz5I4bRZOHGaExuPIro
 hJIRxlnaR83T1YeJRV+V/S3YQGsDgkrp4XGkiPeBSoIBUXlmeoHuO7d3RLHXOIEnv52uL5XvAXM
 0VtxN5x9PI/Hmjwkqal0tJsBMioOuVMiIqqnyM4z9UhThZL8UkZZ2/zJNFn4pzwIQsAKchPetds
 ARMgbTCL+uoC/p9EoA0V5wOiQpqSOMdf3jDzqx6psqmBWAgdn9pTZOU4T1gNyRCDwOOgqQBTQ27
 P9lyqgxzga4BWX3/1yLvNly//EZFvmkI3TMrNTIkdPbPZ0Dk9cju2ZJLw5ll7CQcNn9bPUuHWXn
 RHYACNnBIK6tlJHCaFWahq11oemfaTpI6SQIr3QazhYgxVnYqCS3nxrgvBzjvfyg8tDjMXgyNW5
 tGbBNN7UoJL/Nb9EOjUSFOtEarPpl8Bnq7Re2vOKUaVHgutJL+S2ZNQzAYqsQoSFSiOfs36RxXV
 1eVsfsHDjlcqT98TXEW8yTSwpxGvBTBUu9ciZV1iGTAsS74FIh5CFXnMgLt3pBMhfjDbmcRy13X
 YXbJl3mIhyVoRrA==
X-Developer-Key: i=abel.vesa@oss.qualcomm.com; a=openpgp;
 fpr=6AFF162D57F4223A8770EF5AF7BF214136F41FAE
X-Proofpoint-GUID: ojEGIWLvWosXZ0unRleFturj2UUNP9oT
X-Proofpoint-ORIG-GUID: ojEGIWLvWosXZ0unRleFturj2UUNP9oT
X-Authority-Analysis: v=2.4 cv=GrhyPE1C c=1 sm=1 tr=0 ts=6a070603 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=eYxG+yUyFZr/0hLq1CKHgQ==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=bC-a23v3AAAA:8 a=EUspDBNiAAAA:8 a=fJTFHGPQb36AD_UPoAQA:9 a=QEXdDO2ut3YA:10
 a=uxP6HrT_eTzRwkO_Te1X:22 a=FO4_E8m0qiDe52t0p3_H:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTE1MDExNiBTYWx0ZWRfX9pEtpFFddJoO
 epPQWGPQXB81FmGgdqRYtPGnTu7GbUsRnGiQVaFar9TVHv+FIsSqrqty27VILXInYs/NZBBbEEq
 +AK7kfd1d4W6XwDhYZec5Uoo/zMR6JAx9HV70tTKYSIeLsqhJRp2Irx5o6ZCzTsBQT5OiNBUG/p
 4OJyJjwPOBzKAC/bAXgve1CwZVL0ynrhYgVKxAUnsZXHPiKg5rQiIA5N/CCUgS6Vysd542HIX3/
 D4mUMEoaBzEYU0ju15s69haSZpCfIH9JMi2Jd47vj50RJjxSzZoBLL1s/NT8gwmXOKHgO5sgdAB
 WJWwFjBsGwke5/i0o2EnZaFMswPwGMvJGJS6iAYCphPiel1/09UAVrfRG1dmRNmEk0JVqn2ndgz
 s3nI3e6Z9k5XKaF1QN3XB6Di64OMo9E6gg9ZXq6s+L/GbPe6sc1MfaiSZFU4VTgcbihB5XobNA9
 ZZJDah0rHGAsJMvOV4Q==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-15_02,2026-05-13_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 clxscore=1015 lowpriorityscore=0 adultscore=0 bulkscore=0
 spamscore=0 suspectscore=0 impostorscore=0 phishscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605130000 definitions=main-2605150116

Document the GPI DMA engine found on the Eliza SoC.

It is fully compatible with the GPI DMA engine found on SM6350,
thus using qcom,sm6350-gpi-dma as fallback compatible.

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Signed-off-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
---
Changes in v2:
- Re-worded the commit message to mention the compatibility with SM6350.
- Picked up Krzysztof's A-b tag.
- Link to v1: https://patch.msgid.link/20260513-eliza-gpi-dma-v1-1-d8e37f026c36@oss.qualcomm.com
---
 Documentation/devicetree/bindings/dma/qcom,gpi.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/dma/qcom,gpi.yaml b/Documentation/devicetree/bindings/dma/qcom,gpi.yaml
index fde1df035ad1..d40b0a8dc9e8 100644
--- a/Documentation/devicetree/bindings/dma/qcom,gpi.yaml
+++ b/Documentation/devicetree/bindings/dma/qcom,gpi.yaml
@@ -24,6 +24,7 @@ properties:
           - qcom,sm6350-gpi-dma
       - items:
           - enum:
+              - qcom,eliza-gpi-dma
               - qcom,glymur-gpi-dma
               - qcom,kaanapali-gpi-dma
               - qcom,milos-gpi-dma

---
base-commit: e98d21c170b01ddef366f023bbfcf6b31509fa83
change-id: 20260513-eliza-gpi-dma-6b5341271f09

Best regards,
--  
Abel Vesa <abel.vesa@oss.qualcomm.com>

