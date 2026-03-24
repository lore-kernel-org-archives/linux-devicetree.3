Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6D3A3406274
	for <devicetree@vger.kernel.org>; Tue, 24 Mar 2026 15:29:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774366204; cv=none; b=O5JJoFPA5zJRoxzMFVYW2YjIAGK1ADOQHXP2xb73PAROE1nlVDMHaU0G5ImQYcLE+gbKE9kOpC1GS/48r08yleuxj3q98ewxLlrOdjqmVnLT0j7v9m7MM4Ty2VRtDYrLCAIVYnn+KZDdSsk5Dh/G7r/phQtXSvwLA7fe6HuTtho=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774366204; c=relaxed/simple;
	bh=dVXlVPcA04DyP9oUgevgrw/HZIC/ae7SA+cQKGx8Dqw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=qpUaEhEMS6/fH2l5QhaRPdbOsIpQ3ZGkWBSr6tQeAwXBcsI66ObdUsHdlK/Bi6vzJ+qfMaXLv0ogaH3CP6u8gRGB9leMcV3x72iWoE84cMoE5JiSRSHexBG3NmdlExukj/DFss0+7a/OlQ8s7Y/krKI1nmzjR4lG3uqU64nrOIs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=LoPmQ4Ja; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Xbjw6B2l; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="LoPmQ4Ja";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Xbjw6B2l"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62OC39ag1817362
	for <devicetree@vger.kernel.org>; Tue, 24 Mar 2026 15:29:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	HkzJ0T8fa9uK4+3MCKlsnAXadbIsuNrKwWDc/A14Awo=; b=LoPmQ4Ja1bJjyd9c
	Wn7Wcvh5MmIgVBVHBNDxjerqtr+Uw02dBCNeCvbR4RsEECEyq4C9LxVpNLBAjCZE
	Nw7q0TvxP7hBIp/PLxrX283QQ5JkNMBrjEoSkJwCqQkFeD/hXitW53fTiIcbWFHJ
	bz9hvLp5iapaeOjChbzB/wWPPf2gNhn4BfI6LHbVbV7Nm0fGpvPMCg2xUjd9pzRa
	QxXmMhTS1NQLHIlwDu3+F8krH49akoal+/8cX0cpWF82iVTSahHTVO0O0ie0Vhdi
	LsB+CGUA2HGd2cmxW7QY5KP+ddZTb3W6RQpg1787fcP1bkUb60P+n7uOzNfjch6S
	KRI3nQ==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d3t9egu1j-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 24 Mar 2026 15:29:58 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-50b4fe4ff7bso251386131cf.0
        for <devicetree@vger.kernel.org>; Tue, 24 Mar 2026 08:29:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774366197; x=1774970997; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=HkzJ0T8fa9uK4+3MCKlsnAXadbIsuNrKwWDc/A14Awo=;
        b=Xbjw6B2l+K2MRiSqeqTC3Oly5Hmtk4JYcPl3Es2l4t0axLy35ZhcQM/WNq1VxWWYXX
         rbQ4+XtH0LM5/GftDlYwFX7j53EaBuoFSXWWoWWCKDCqjJbbOedjmNaLGRp2cDWZJFoU
         GapflAgy8WPjZjkZXPSG2+19jKVk4/KUaArLqn3vr04/8Ppb13xNzAFZLXovKv5BSmWx
         bHggjJGBbGhO2ONTX5E7rD8TGpuIiQJyzccSsDQp4VTWwT/3upIF25T7hzXi+av4F2a8
         OOPvsGP/76sKOonhL3sOujYuDoORkg8JotjlnApEr6QSnmyB3jBrcM1pn1I1ixSQ8cAh
         0GKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774366197; x=1774970997;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=HkzJ0T8fa9uK4+3MCKlsnAXadbIsuNrKwWDc/A14Awo=;
        b=T33XFmsBM1q/iIaXdYCNh5rxP8qLyiBmjayOKHLfoaw3iIHESyMv2kHy+qtnK+uKUx
         JNbLqTOT5szVTX1DBAhzHBHBLEDcyRmMi/5WLVAWSqpjOY8W4szUll7SsZgMzRnwJvRB
         eqdSPU6kpI+fQOVw2cXPX4yesOvHMX74D5y/0NGNzNhPitQxWx1lJV1kBqnAkH37O3Tb
         WcHTQKRSVt9yVIFNlJ0PbIEwxqBQsL09T+qkZzQIPrqeZiDDvvMVz13iTvYoUbdIWGeN
         J5FaPY+ENHUHnpqAZNJkKWdooAlP1wjQXg7B/BIu2S3dTCEo2+CsA/Abhz0E4qsMgBx7
         koIg==
X-Forwarded-Encrypted: i=1; AJvYcCWw+2EHGBEaLtXFla10dePXAjNTGa2khRFj5suT4E9KGsqzpbxB85SEa12/2A8RIsWIeh3MsnWiOr7f@vger.kernel.org
X-Gm-Message-State: AOJu0YxIh374I5NyLp1HL3HAYAxWS72hw1pmdPX/l0cli2OX03aBf7LP
	5ibCCk1DvFyhyTSwMEJRcRgZkRm/2Ru30KqdWp1DzQ6G0vS0Cb6NXGq1z3WZs+v9M4JqkEA+SGz
	kCXD+XDdVtQpmpiLOk2xC5g5I4mif2m1KXnW7HXOln+R6qQlFjXXflAWiUDJoUMuQNKF6bwGM
X-Gm-Gg: ATEYQzyiwxq8cR1VrPxFTBrpC+8As1FrdMcQ0AVq05bryn6v+4S8TFIn3iaRjl4iHHe
	NGjSywYWz24nwNfadZdoDCNJVtOWSO20q7OPq3w1dJcP2b93BASClkRGIPJfT0bUqMr0WHxOgwW
	XIuigLFdP2edga42UnV+t9X2glSYZmO6aKtUinZ+DhH1zfLaRjq2Qijqm6whh5iK7fpwzooIBfJ
	D4U7Sjc0gKq2ZEFQnGX7uJiJ1xDlmapMW2x+epRTB0nu3EC71QHgmoUYmoqNI9QF5PcONuNOd7H
	UHg+i4OQOjEvpfDspI/FTvD7VStb+z3qV6kGCTBf+J1Ionz4BdF0q9C2Yt38EFPj+4HrAnGX6BM
	kB5WvEhiyRMnwjlXEJqLg0HnVmZE=
X-Received: by 2002:a05:622a:34c:b0:50b:6fbe:62b9 with SMTP id d75a77b69052e-50b6fbe6b75mr41833481cf.28.1774366197155;
        Tue, 24 Mar 2026 08:29:57 -0700 (PDT)
X-Received: by 2002:a05:622a:34c:b0:50b:6fbe:62b9 with SMTP id d75a77b69052e-50b6fbe6b75mr41832971cf.28.1774366196524;
        Tue, 24 Mar 2026 08:29:56 -0700 (PDT)
Received: from hackbox.lan ([82.79.95.133])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4870f6e9ce8sm36943385e9.2.2026.03.24.08.29.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Mar 2026 08:29:55 -0700 (PDT)
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
Date: Tue, 24 Mar 2026 17:29:43 +0200
Subject: [PATCH v3 3/3] arm64: dts: qcom: eliza: Add missing msi-parent for
 UFS
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260324-eliza-base-dt-fixes-v3-3-3a4a03e72f8f@oss.qualcomm.com>
References: <20260324-eliza-base-dt-fixes-v3-0-3a4a03e72f8f@oss.qualcomm.com>
In-Reply-To: <20260324-eliza-base-dt-fixes-v3-0-3a4a03e72f8f@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Nitin Rawat <nitin.rawat@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, Abel Vesa <abel.vesa@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.15-dev-bc6c4
X-Developer-Signature: v=1; a=openpgp-sha256; l=1057;
 i=abel.vesa@oss.qualcomm.com; h=from:subject:message-id;
 bh=dVXlVPcA04DyP9oUgevgrw/HZIC/ae7SA+cQKGx8Dqw=;
 b=owEBbQKS/ZANAwAKARtfRMkAlRVWAcsmYgBpwq3qXP7vmDGr6fzD6NzprXtmQbMOt2GrpkNjj
 i2ICbKrw2mJAjMEAAEKAB0WIQRO8+4RTnqPKsqn0bgbX0TJAJUVVgUCacKt6gAKCRAbX0TJAJUV
 Vs8LEACSe2xuCnISaq92gESLGoa1aKTglu0UN37a3tdiAV4gWeQyrW8iDq5oBPqhiDkQBb9CeTu
 2s24dJ8AzTSRwzOz3WjOdFtAKFFxRBoGcNoFRSaM9lFU5MAaT7d93x88C2nAJw1qNRog/F8J+Ke
 j3AleFQ2SIXmTM1VwXkJClVbG0wHIsKw1QoREHIJIBtfeY5fopp+IF2rg3MarYu9zc4wJurGdLQ
 C7WILrfbi7d3q3EU/o8WS8z+SKAJGBjemsjB50FIUABkml8RjJujEKhY9/K8f3+pQwOhJfn2kRT
 epqK6GwsmFH7Ny5bd50gS+cQRnIWlY4iXmg6KUwxMD+wcVGnD5tWXgf+VarYaMmO6srJKtB0y5D
 WXARM6/8LcLabeZO66HPAl+/oxeMfBdoybhCEpL2DX8cI4mUOsZd7iMOqKNlrdAi3a/tgytknPL
 OADYGmcVsAYgp2AEM6rrLKnoIsp7dWc9resYeNt24T4PHqo3UTVswJq79pScLoOAodTHVjdnaRk
 8ps79HOHbBvgWyPQyEBFIBBM71rPdX4qbMzSgYDOTptYPQN2UA35888QyqblSiDVULGcJXSBWXg
 fbAZmlZ0tI9gBUfPhYsiNjKHGe03s5bnhMxjZdZs2mex0TEOMM7lSXzw6bfC5pKAtaVabHouiR5
 gqiBUkreSRt4LOw==
X-Developer-Key: i=abel.vesa@oss.qualcomm.com; a=openpgp;
 fpr=6AFF162D57F4223A8770EF5AF7BF214136F41FAE
X-Proofpoint-ORIG-GUID: LvBStLz99-i3AT6yyYjIKmzTau7rzggS
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzI0MDEyMCBTYWx0ZWRfXwbcYf1JwCJ5K
 bIdZzDa/9/fHILMG45zOHusA5ooHr2ZxsJWN10sKON16i65CSR80tcLUSu0C1bYuOUWAW6mlhaZ
 Hfa7U1DrMMp9M2rvfNZWEr7JVRwMbH0FtRDc7JK+xJi+SqmNG8SbjRJs2DElfwCHBqz1fXX3bpU
 Uu+hqOkRwb4QBS5+ES8gcqLrcOfw1fZuitmriq6z3O3QWUMHJTAipR5pgR+anuDkPToYR4pacG9
 IZ4eXIEUSZxqYMqfEDcAFghKMfDX61+HhuMyJW3aLDErcLKMrdSyy6CJMtpKpXNcpIAKm2xOT/x
 sQT8ypc/IxVpuuiqvKUJ+ZhtYDPoicn6iltSPIRQFZCZbdHDTfPXEf9CrIMAPqldnPGZSLF7T3c
 5bOYgfQUA+RGGFF1UZQUutoS9UOmno+epwkGiK01w3Zzk/Y9cVWFFuXbNqyiiZAK2BG136ma0G1
 bOqRu0Cpo1VqBvkEZKA==
X-Authority-Analysis: v=2.4 cv=DdAaa/tW c=1 sm=1 tr=0 ts=69c2adf6 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=iKs3dpp2RB4k51ZqCjcyjQ==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=EUspDBNiAAAA:8 a=kG0iW9uiJ9BVmnksB5QA:9 a=QEXdDO2ut3YA:10
 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-GUID: LvBStLz99-i3AT6yyYjIKmzTau7rzggS
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-24_03,2026-03-23_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 suspectscore=0 priorityscore=1501 impostorscore=0 bulkscore=0
 lowpriorityscore=0 phishscore=0 malwarescore=0 clxscore=1015 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603240120

Wire up the UFS controller to the GIC ITS by specifying the
msi-parent property. The UFS host uses MSI and requires a valid
ITS mapping in order to allocate and receive interrupts.

Add the ITS reference along with the device ID to match the SMMU
stream ID.

Fixes: db7fe6963466 ("arm64: dts: qcom: Introduce Eliza Soc base dtsi")
Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Signed-off-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/eliza.dtsi | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/eliza.dtsi b/arch/arm64/boot/dts/qcom/eliza.dtsi
index fab603cd8e42..62fccb43a7e8 100644
--- a/arch/arm64/boot/dts/qcom/eliza.dtsi
+++ b/arch/arm64/boot/dts/qcom/eliza.dtsi
@@ -785,6 +785,8 @@ &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>,
 			iommus = <&apps_smmu 0x60 0x0>;
 			dma-coherent;
 
+			msi-parent = <&gic_its 0x60>;
+
 			lanes-per-direction = <2>;
 			qcom,ice = <&ice>;
 

-- 
2.48.1

