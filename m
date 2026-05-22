Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4A6AC37F8D9
	for <devicetree@vger.kernel.org>; Fri, 22 May 2026 19:56:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779479771; cv=none; b=uXtEAWdMyzd5E5a1vC9fPjChV96REK48TDzCFm2j8h1CRRZ28M48a6ar0jEajI8sFF/PzM2D8pv5g7Z+h2LMF0zVr25rmROiq8wti24juCrnXhKMZsqTKCIKniNpcQqTQB4smcn0CAjtDzDD2aRmQJ8dTj3Y0G7ByG1EK76llwg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779479771; c=relaxed/simple;
	bh=kBN22TMc/7vjGOVvI692Rr+gDEl0kHxa64ZiwZ8tVD0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=oWyCS7YwVyVR0qqXkcVS7y4tOrRjNlI6B8kGiFjIXvQTkre1MKOvwf4Fd2fYPQyqlOPO+NtBaOE+WWx3ISv6iJKFLQo03mY4WOXZOgVe1fe56A+q6sR7enyrYk9fEnL1GQmA/v8R473OI0rgC1Q3tP1Q+YaWqtyArTu8kNauZws=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=X/dTrkT4; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=jWcWXI+3; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="X/dTrkT4";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="jWcWXI+3"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64MGbrmh3005145
	for <devicetree@vger.kernel.org>; Fri, 22 May 2026 19:56:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	6Kju7bnElF3xvJvgZGFgnbL70Z6TnXx86KxMilu6Zsw=; b=X/dTrkT46pEQ9YzA
	8LnwYWHQ6qxmHR/pt3KCRzIdDVQqL3jKv9VML9FagZR2JK6rqi8z4GNOGsZgUDrr
	wFFJ1Yg1BFlzCewIsrAFRd9W2ibNZ4eNW8Em0RUw3UDwVT10KQLDTMAdC+41cTeP
	oAEJLdzCuxPxjZmw+Eu1vjNexrfMaIrKuanQNfRd8TvuBo8FXQ0FoQUvn+669SCn
	M46M7cqa1cXsRGEPs/6rweY2q1KVMh8dIGhI+bY9s6NTWN8mtRghDUrlKfRy/Oob
	K8ExnvlKCYcCp3PwiaSpMbY6ELjGfSs1pJcXhSZWwGqMZ2fTIxat59HSfPW3km5+
	kj1Fog==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4eafrtbq0x-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Fri, 22 May 2026 19:56:09 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2ba3245a43dso82388665ad.0
        for <devicetree@vger.kernel.org>; Fri, 22 May 2026 12:56:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779479769; x=1780084569; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=6Kju7bnElF3xvJvgZGFgnbL70Z6TnXx86KxMilu6Zsw=;
        b=jWcWXI+35C5cub/nMxaZTBJt5SE+44NCr66VOcAX4pOXeF/+CnSRrgz7E/6jTtoS84
         /Z51iwZbGxtO+H7P4I9IwmXCPkK47mQUCCfCFwhlsr294dUZDXmFKa5AxPm8y76oNjGA
         +h98v5LjfsogO3VSArrbXzvLYOy1yxAbAqLe8GFl5vCfOPNq+u+F0ll8COXFmdVjJ2bx
         oV+sazehbahmEItxxthqiTFVjjdGfvTw1BPPfkDWqq+QkABxe/HHSArisUlhohWTCdYp
         1nIxmdls6F4UW+bMC1JUn4//6lKwlotrOkSMUjsAoEPLRjw8I0rVXI7XMCBZUA5CWGc0
         WDxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779479769; x=1780084569;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=6Kju7bnElF3xvJvgZGFgnbL70Z6TnXx86KxMilu6Zsw=;
        b=XsuRWAU+2+1p9GBTsXmFvLUU3aZY7h/WNt5MBRuUXY18dj9aPuy8/2fFIfGEYrNChD
         EElvpiXIMAstEWSNQNrUtVTkG1stw+e+MpuxF8nAaU9Hm4HQ2zZ9TgkJmrEaoLXUPb/n
         J+7pOj+6YP0gt/QWS4L0yG5lR4eP2XhpDIimPj1k/fLvgD8oPSgVLl1QS5bLcgT/Z85l
         ARX+9mxubot1TZwiem/OqSN31PM60ee/jo/bg21gcgOpJsrgpUbHGPhbUAF5ioOwXUKR
         DHn4s8OnhXZotCZwDXvsyVoAIAuEiuOJKN204eS3EGE1c2+Sx3ErobUGkBMpSqYyshjQ
         IqXQ==
X-Forwarded-Encrypted: i=1; AFNElJ+DgJGzodA/jgGTwdzvDffOtOY4Ul9GA9e9peJc72xQtFTxbvkuwbA3VDMkN0g1dtEz8TuGgAJDC0tv@vger.kernel.org
X-Gm-Message-State: AOJu0YyaHralDRC8/IGClMhJ7WnfIQA+gdWKIBRLSjQDDiQpAFC6neIP
	GSq/tkwdlqzXsVy7Ihwaa1EM1tjLawVNzzJqptGI33gS4MlEUN9alQWSiPYhvPK029W7kYzPM/L
	NxNuJmuhyt6O9PT5ESr1OkTwMUq2Nu2CWa71WL4n4QdahJaIaLBq+dspZszv2wScI
X-Gm-Gg: Acq92OEOxT79LuFoMZosVqs80QsI7WutTtlMdQpWX5AXjXdF36uFCJHbw9QZW1n/I8o
	1xh9D2nKta9sAFtuuxRponQn9+CilAGHlYdj4ARIWGFM3LxVLpDdWLbn1+J3c0zfcEAVzeUAg3a
	BAXNv5aZqPGVkRnbaPwkiQAoX6s5Yc+TPqnrAIX2pmOAOCJ8wqR4VL6CpywhsAAThCVemOUlzQu
	7eZS/VXS+hEBbwTsFy3zP+eR7FrB59PzKguFEIV7fDsO4FHFByQ+FwZ6z2U6QkCbhFM00c04T13
	JmNGeo+nGhakwiY6Rm3AUeS4yA3Owikesrg6dH+dku+88mCo1KsDde8m0sX177TVzkUeQGc/QDf
	54b0jNJjjygbk8Z+H2IRWP7jthS5nFpkcJ0fykg==
X-Received: by 2002:a17:903:2350:b0:2bd:eeb6:ff29 with SMTP id d9443c01a7336-2beb0356a13mr55371905ad.12.1779479768729;
        Fri, 22 May 2026 12:56:08 -0700 (PDT)
X-Received: by 2002:a17:903:2350:b0:2bd:eeb6:ff29 with SMTP id d9443c01a7336-2beb0356a13mr55371495ad.12.1779479767939;
        Fri, 22 May 2026 12:56:07 -0700 (PDT)
Received: from [10.213.96.151] ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2beb5914287sm33389355ad.79.2026.05.22.12.56.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 22 May 2026 12:56:07 -0700 (PDT)
From: Pradyot Kumar Nayak <pradyot.nayak@oss.qualcomm.com>
Date: Sat, 23 May 2026 01:25:38 +0530
Subject: [PATCH v2 2/2] arm64: dts: glymur-crd: Add reset GPIO to
 touchscreen node
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260523-arm64-dts-glymur-crd-add-reset-gpio-to-touchscreen-v2-2-5c333051e5bb@oss.qualcomm.com>
References: <20260523-arm64-dts-glymur-crd-add-reset-gpio-to-touchscreen-v2-0-5c333051e5bb@oss.qualcomm.com>
In-Reply-To: <20260523-arm64-dts-glymur-crd-add-reset-gpio-to-touchscreen-v2-0-5c333051e5bb@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Abel Vesa <abel.vesa@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Benjamin Tissoires <bentiss@kernel.org>,
        Jiri Kosina <jikos@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-input@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        20260519-glymur-mahua-common-nodes-v2-1-9f1b89a3f398@oss.qualcomm.com,
        Pradyot Kumar Nayak <pradyot.nayak@oss.qualcomm.com>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1779479752; l=1445;
 i=pradyot.nayak@oss.qualcomm.com; s=20251128; h=from:subject:message-id;
 bh=kBN22TMc/7vjGOVvI692Rr+gDEl0kHxa64ZiwZ8tVD0=;
 b=Se1fgTQ+cPubFRcspm9htA5pmfOc9MexQnnUVl6jDuilApJkK4SoVp/iLpI6OISWYJD61eXwM
 XzlpjdRBwFsAzC2HXnu4HSyB9lxDagWgmBQIw48R+Y/XIm9HK7/J5Wt
X-Developer-Key: i=pradyot.nayak@oss.qualcomm.com; a=ed25519;
 pk=ZAwwH8thDSb6bq4dCgFHWr80BqB7MmUAKogkd9BsiXM=
X-Authority-Analysis: v=2.4 cv=JN0LdcKb c=1 sm=1 tr=0 ts=6a10b4d9 cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=EUspDBNiAAAA:8 a=lbRSShi60cGz1d_720QA:9 a=QEXdDO2ut3YA:10
 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTIyMDE5OCBTYWx0ZWRfX0Y/lHu6Hd1Zm
 J9yWXyDmNcPTCDQOKCdIMLEvPB7iof3rTcakSgDmTcKD9aIf2fRlbsvetrLIig3TZT44m420cfJ
 T1OADqvKtqLLMSdoLyzodyb4FDpdFKclfxXNdjCxCt00QrkPj3ywb6UCuwXMRphkmv6ZOOuKS5u
 wdoK1k5gR3/KGKaoKH0kKsLASXtPMrZvksLcAoOBZ5qZ+94JGy4op9eMvtZrxaYLnOzls3b4M4D
 ybB3I+qHngalWbA3+sB0YdklJjMR3C9xqIB4xGZ/EQQ6TAapF69peCNkagOx7QVz4sL3OQpi0aj
 utJvcezcqNQQf5lw+qcIYlNwhCpg/Qgy96xIrDVALzzxIJZKTcVI95j4Doj9mNCmPwIzfw/2lHp
 +6TWNF0cBXGEmR0wn/6b8CgpaCN7GrfIOWUGXifnT+F/hxDlVO8EmYP4UBi7cccgs8G/kwHxkey
 oILr31JKMpkG+MrpOdQ==
X-Proofpoint-GUID: yJU8X_-48Jru_TEK4TOidiI1rHhicOOY
X-Proofpoint-ORIG-GUID: yJU8X_-48Jru_TEK4TOidiI1rHhicOOY
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-22_05,2026-05-18_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 lowpriorityscore=0 suspectscore=0 malwarescore=0 impostorscore=0
 phishscore=0 bulkscore=0 clxscore=1015 spamscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605130000 definitions=main-2605220198

The touchscreen module on Glymur/Mahua CRDs is different from the one
used on Hamoa CRDs and requires the reset-gpios to be wired to the device.
Without this in place the reset line will remain permanently asserted
during resume leaving the device offline and causing all I2C transactions
to fail with -ENXIO.

Error Logs:
i2c_hid_of 3-0038: failed to change power setting.
i2c_hid_of 3-0038: PM: dpm_run_callback(): i2c_hid_core_pm_resume [i2c_hid] returns -6
i2c_hid_of 3-0038: PM: failed to resume async: error -6

Add the reset GPIO so the driver can deassert the line on resume,
restoring I2C communication with the device.

Fixes: e6bf559f7eb9 ("arm64: dts: qcom: glymur-crd: Enable keyboard, trackpad and touchscreen")
Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Signed-off-by: Pradyot Kumar Nayak <pradyot.nayak@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/glymur-crd.dtsi | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/glymur-crd.dtsi b/arch/arm64/boot/dts/qcom/glymur-crd.dtsi
index 1de3a49f49e4..2259577b9ae1 100644
--- a/arch/arm64/boot/dts/qcom/glymur-crd.dtsi
+++ b/arch/arm64/boot/dts/qcom/glymur-crd.dtsi
@@ -623,6 +623,8 @@ touchscreen@38 {
 		vdd-supply = <&vreg_misc_3p3>;
 		vddl-supply = <&vreg_l15b_e0_1p8>;
 
+		reset-gpios = <&tlmm 48 GPIO_ACTIVE_LOW>;
+
 		pinctrl-0 = <&ts0_default>;
 		pinctrl-names = "default";
 	};

-- 
2.43.0

