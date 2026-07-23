Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 244E847884C
	for <devicetree@vger.kernel.org>; Thu, 23 Jul 2026 12:47:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784810869; cv=none; b=GihRHqZ18R/JQHFluoEzyueWeEB7wJPYP368n2pTRE37yEaTT0MeDm2uErXsBvJDaW3Rtp6/mBX2Vce+OAyUl+GGN3AMNxnysUsgfHrOvcELPMOYTL9KJ286cWS76tTSepcJd3DEr0YI0rwfHs72+pjHIVjjvGCyD1rxso7NoeY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784810869; c=relaxed/simple;
	bh=/eRmcbGLD5Z7zb6cJ7VFrcd2+sDww4ph8DEQ4lXRbjU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=SY3bvNcwCSWDagQb3J4d2PhFe2TYEvdgUUuGTz4Fv9zJpWL8aPW9s8UdZAcFHct1RoE4itfUruvTceKvKeQaOx2PhUvK7JXp125syLHrSZb98TFZOUOV7fpkpn2FYqLcUIcsxbX0NqUft+tZTuVAsbQfrExCj2EQAfL9cG8XaJ8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=mCd7p23o; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Tx8kvhF/; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="mCd7p23o";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Tx8kvhF/"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66N8qYx2467215
	for <devicetree@vger.kernel.org>; Thu, 23 Jul 2026 12:47:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	mX/Jdvmv3EVPtmjTwDcYPWmYUu5TaT/TQvtaFNFv0rE=; b=mCd7p23ogVIVrY13
	0KKJjDFmrjyvOuFuieD6SNBmJgCnkGuh+I9qNYRL1gil9tLTeSGjtuzsyK5Y/1F7
	lMO//n+jyGTJFUKJu6evKI0YpEfEV2NhkStF/tUexn1rtVVdS/llz8JD/CluxDV7
	WU7B4w90b5xYJlIztwwxg5WTqRqvzO4PHVHy5PBqmjrx3xC0XooB7ugaF4e0pri8
	+DL323SFkVowzs4kSDyZbOTJCDnhY3gtHscFrao3wQuP0B7Sgv0WZKThV38leR+k
	8Dr5sTbsH5TyJar/yH4z8HvbsdDHvQ5CPKUMEpNvW30W7foOvJGujIt/wc0rjbFC
	Ov8hKA==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fk28xv48w-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Thu, 23 Jul 2026 12:47:45 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-51c26012cd0so10779541cf.0
        for <devicetree@vger.kernel.org>; Thu, 23 Jul 2026 05:47:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784810864; x=1785415664; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=mX/Jdvmv3EVPtmjTwDcYPWmYUu5TaT/TQvtaFNFv0rE=;
        b=Tx8kvhF/a5KFsa92jgD0fElHu5CExBJ93qccKs5IkdMpQQNwg8OyD8zVHc6bjWkxEF
         URfAMIltz4N/RHLervctZtNbtiT+JdMS5U+tmost8lDQPxM/dloQAll3nwWYW3r7BhXc
         LfMYlc4yG7Up2JGyCxC2fwahGKPG57WsAmhvFniTVsHdGVqTfp++hPKbNiaTNC//yh+I
         keaAyS8OY6AY7zIOriEjbEnT1Wj1J9Ocrs07RvHham1cyIH6wBsKN1NNVPsJ+z7HfoBF
         /XmNCFUjikWZfP7NCpQkXyfyoaAslEXzJfyOPcWnElhv4p+mGQZ6nI94WEmAqKa7WPkw
         qSAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784810864; x=1785415664;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=mX/Jdvmv3EVPtmjTwDcYPWmYUu5TaT/TQvtaFNFv0rE=;
        b=As02n4vu1BGBPPQuF0BhmWvSy5mJ9kkregSnhuV361Eroqzr90bSgQfr/Xx6yDpO2z
         rCFW45k3KJbH6IGnrH62Bvyr95S+HDQvJVfStB9x/FmK4g4sftPsxU+oCaRpxM40bltX
         TyMrB23JAwTh/G8+sodrisOqRaDfVMBOzXUGwDB81pnDgOX9dL11LbiK0uEBVDgcHBQL
         RTSL/itpOZjQrYC0EIL0b7pK2Og/1njudp42vU55SG+g3jUdNiEspZ0ucBNJUMwrqAq5
         g4I3N1Yg0NaaRy0iAVHhdgFHK93Jc9M2TrFrhXDVCqGKkjBMTLRMk5jgngnKY1aWTJ1I
         WguQ==
X-Forwarded-Encrypted: i=1; AHgh+RrMczW2yLzGEACBmdIQTalVBIFxA7yhpdzKjWVZB97bNhHnUGLVQ+tCRAktUqN2ijYCeSLQYMZpZ+cg@vger.kernel.org
X-Gm-Message-State: AOJu0YzfsQwzpTDL570akWbFL0UGRGV6ZfuT3mxXUSL+TwYmVc/DatCr
	KUT20C82mJXThFj8+Wp20RBN82zT6d99ZHfwKYvbX62EKqs49e6euZqzWIxNslxe5ACtWwmoKKe
	etJaiolWDxwwKkkQ/wR8b6iEN1V0uTXNn4o9k8lxqBT+K33Ar4bwqWDB+P7TsyF0Z
X-Gm-Gg: AR+sD13CyflZeWLxhTOY8RI/1ic3Ksg8NeJn2NLOwm+Qa5Prl59G/EYDfZm9Bhbld51
	jtdMv/We/Gfl8LzMLj8Sro8VH3l8YhWPCs5r9oBmrKv4T9Ur+iCphyaoN4JPi9fanbySFaoCDlA
	PhdWEZs9lrcyw/b9qluOhSC9HYB171D0mhl6BV1DU0jgafZU8mwFeuikPpp/Ad0wAnjx4yoLVxi
	rqkqwWP62iHFh75HvTAIpq1sISIzjmeKXrFQ7aI23p73jCM7zt5gm9PsTfDI7uisMXRk6vh2fU0
	cckCdkGyq9v+nai41/rN8CetOAaUPHPCvQlL5Wrgdd/IhASBDQ6szIBWhItrHXOP63CvmmcO4FN
	CwWLaxNBI
X-Received: by 2002:a05:622a:283:b0:51c:1408:6c13 with SMTP id d75a77b69052e-5283def0605mr24501201cf.44.1784810863988;
        Thu, 23 Jul 2026 05:47:43 -0700 (PDT)
X-Received: by 2002:a05:622a:283:b0:51c:1408:6c13 with SMTP id d75a77b69052e-5283def0605mr24500821cf.44.1784810863420;
        Thu, 23 Jul 2026 05:47:43 -0700 (PDT)
Received: from hackbox.lan ([86.121.163.114])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47f85c531afsm14814283f8f.24.2026.07.23.05.47.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 Jul 2026 05:47:42 -0700 (PDT)
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
Date: Thu, 23 Jul 2026 15:47:28 +0300
Subject: [PATCH v3 3/3] arm64: dts: qcom: eliza-cqs-som: Enable CDSP
 remoteproc
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260723-dts-qcom-eliza-add-cdsp-v3-3-b535200996ed@oss.qualcomm.com>
References: <20260723-dts-qcom-eliza-add-cdsp-v3-0-b535200996ed@oss.qualcomm.com>
In-Reply-To: <20260723-dts-qcom-eliza-add-cdsp-v3-0-b535200996ed@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, Abel Vesa <abel.vesa@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
X-Mailer: b4 0.16-dev-0e65f
X-Developer-Signature: v=1; a=openpgp-sha256; l=937;
 i=abel.vesa@oss.qualcomm.com; h=from:subject:message-id;
 bh=/eRmcbGLD5Z7zb6cJ7VFrcd2+sDww4ph8DEQ4lXRbjU=;
 b=owEBbQKS/ZANAwAKARtfRMkAlRVWAcsmYgBqYg1mRxxgZh+1+mmMAyxbZr+BB0KfV9+ylQFjg
 dhiA74onHKJAjMEAAEKAB0WIQRO8+4RTnqPKsqn0bgbX0TJAJUVVgUCamINZgAKCRAbX0TJAJUV
 VmMED/93DV4FjcnqlMBE0s8Bwq1L3c/XDdM1dx+ftg82dF4wcwOaLnJqmWWMHMETlDkHhJhnQ7F
 F7IGu2WI5LPBuzKzaVDG1nkaMEMNMzHCBr5fsLyUR5xjJCCT8JpJQk3bkDD20EwzTKNDsM63UU0
 injQ1bBapRw9CDKuffbQ7FAHdsOXgFuM5wMOXSFGcvRHYHi9ptUOnDRiCDW5LV+J5vExtUdxm7X
 KxuNne+JbZgEWeXdWv4pNJr1/c/6MKair77Xsrpd697flXNY5aoj9OvC4cXCHAerySDTccyVwZO
 HRZyewcVCHCMztG7+isrASxzBB1saysySiC1AJHos8IARoknbh29O10HINOtxwvsuYB9lb3gomp
 3gcdvV0sz2UxBwui6LCbNSVilD+muxCJD+yJ71xi0q3daCCpTjA/yNhFpszzMYf/0d/3K2Nz4Cb
 yv2p2JabOkMOVPtXDwnOhARobM7Ter9SxKNoOw+vNSYfyCPxoOtWE/ijogH6h8pCyEhu72BWw8t
 N3gLTPVhW7luOB5qebE1/aImz9n5Zv5yaU/s392hBjntFRO5pbuvHc3KaWueZdGKn86ZBUz+8bZ
 k8fPJ7/SZQejD+JKorDGSlDSfCQaG8P+89xAnrdDw70etk4XRHxfK0HkwqcxPzCA1/nYvD9Ubjg
 bDb/9P0T20aHlTw==
X-Developer-Key: i=abel.vesa@oss.qualcomm.com; a=openpgp;
 fpr=6AFF162D57F4223A8770EF5AF7BF214136F41FAE
X-Proofpoint-ORIG-GUID: Ic9UI3ExB31aNzHqVegLeBuYikrWSiBO
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzIzMDEyNiBTYWx0ZWRfX0fwj8mrmQbKF
 9dhrDOigEgS5e9OWA5uLC34CAjGnX2aDwwaux4BKgNZef0c8loGVf7MgsEAtxfajLl2qdD5ePta
 woyyWY5fBWHVMDt81gwgFh66QvfxtOQ=
X-Proofpoint-GUID: Ic9UI3ExB31aNzHqVegLeBuYikrWSiBO
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzIzMDEyNiBTYWx0ZWRfX+yO6vwJoJYXA
 kh+kz40/mY71Gag/Sh7MvFdnNPNrngc5JiFfXmdJCQF9IAcTlTtLPL2f9ZvisZVWj03005kA7Q6
 WMn/fTIPMh4yWdaPOivb/q+0NRkGeV4dWuyeYSk0+QV9vCzpLxrAj/7nXyZhv7J6Fa0UwG99LW7
 p57qmbgwm58MnAPtLuUmBB0MUBTPnTv08oo1LxWiUucFUZvSXXot8e2dmPY1Y0uwh10p02gAHm0
 b2Jf+agfo5Lqk1J3/OWFXudLwaF6GTVbJRibja51t+UlZwgy+huyZMxWxbtTsmisSDo7Tb4l797
 Vo1C5jPonLN56UlYaf7UWJPa3SaR7Vz1Y64NTR+ZTJTngIo8ROY8enrAiRV6cyfXsW2nr7QKXZx
 WOFJ4clnXSkslNaB03KWyIOEjkwHt6xg78xcr92F86H6VhkJcO791Vjj7GbxWPT17LFqNxfiYoI
 dd2D7dwNqrFS+A5TEJg==
X-Authority-Analysis: v=2.4 cv=WNxPmHsR c=1 sm=1 tr=0 ts=6a620d71 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=6dw9+iwJWV8PcCi9M4lOBg==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=EUspDBNiAAAA:8 a=27Bx3adQT_mWtQqGTPIA:9 a=QEXdDO2ut3YA:10
 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-23_03,2026-07-22_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 bulkscore=0 priorityscore=1501 malwarescore=0 phishscore=0
 impostorscore=0 suspectscore=0 clxscore=1015 spamscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607230126

Enable the CDSP remoteproc node on the Eliza CQS SoM by providing the
firmware names and marking the node as available.

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Signed-off-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/eliza-cqs-som.dtsi | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/eliza-cqs-som.dtsi b/arch/arm64/boot/dts/qcom/eliza-cqs-som.dtsi
index 318ae3c22351..d31267968cad 100644
--- a/arch/arm64/boot/dts/qcom/eliza-cqs-som.dtsi
+++ b/arch/arm64/boot/dts/qcom/eliza-cqs-som.dtsi
@@ -376,6 +376,13 @@ &remoteproc_adsp {
 	status = "okay";
 };
 
+&remoteproc_cdsp {
+	firmware-name = "qcom/eliza/cdsp.mbn",
+			"qcom/eliza/cdsp_dtb.mbn";
+
+	status = "okay";
+};
+
 &sdhc_1 {
 	vmmc-supply = <&vreg_l12b>;
 	vqmmc-supply = <&vreg_l1d>;

-- 
2.54.0

