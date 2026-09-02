Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B72D5371D13
	for <devicetree@vger.kernel.org>; Wed,  2 Sep 2026 08:13:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788336829; cv=none; b=Q8oXpzQyQ8KJoCRwepQkXmvur9rW/WfrD+V8nLXMUsDehkvKeknWTPAH9zg/TkvUss15GuCDiGbfPs+M34XThEuRjCKrV/hWljPrwR2DoYjmZ6LL/5SRk576QqYAKiWkyafvswgl1ueUoXB2RHc1g5OaUNsRqdnGsd48PXJJzmg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788336829; c=relaxed/simple;
	bh=wPTFUyYCIV3oBIBor1tcJV2n9e7M7X7a3fVGT7srQzs=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=ua8zuP48OhDzJRgVlq2nMoBY7xogPX6FxgNO3BFCEEJ8JQIKGtdroVrHhRATKYR3oHMLSNlkM4T37DTfihspnjesc6V6JBVTZ0n5xuZ2j3AcOMgL6a+sSDf7cMGq7+wYBl6dCCP7qIvjLk/OqdJHo0dDejvD5DBzjmGc/5zL9KI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=pDgbxaRT; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=M4q9GQNw; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="pDgbxaRT";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="M4q9GQNw"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6826VYGj143083
	for <devicetree@vger.kernel.org>; Wed, 2 Sep 2026 08:13:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=JJj9tTcMGmf0OxkdzmALIC
	bP7nDTsOBenYEkzB3H+2g=; b=pDgbxaRTw+6lZqEfjAslvFMagIyL86C74VNZnq
	eVpogTFHN8wOLNUD693FaXKbqd8jGWWtzU9+LgdTEw+BEolWgThUscTEE8/BEbMf
	i9ypOIjf3qsAzEOrecG0UVbReK/I1mxLNPYfIxAu02P/CybXSFoWJ1roXxc5Keh0
	qX8rD6f/8a7qeNHu9hkj52XZOAVJ7ZXuTlQcTmpl9HXz9ittCIY+KsyIhASbLvQi
	M/gn7qpoow+U7+aHEU/UsxRYbOlE5SIsy0zEt+bABlu75oi8i3d2PEj55VXxM/FR
	tH2JWeZTcvAZbTvaYGRZ8Uy/lA+8MMEz1amRNgLZ+3lUQAHQ==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ge397awra-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 02 Sep 2026 08:13:46 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-9390ca1a9abso144071385a.2
        for <devicetree@vger.kernel.org>; Wed, 02 Sep 2026 01:13:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788336826; x=1788941626; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=JJj9tTcMGmf0OxkdzmALICbP7nDTsOBenYEkzB3H+2g=;
        b=M4q9GQNwaPBIjk7+P93Cjb32hziW9zmB3m3G2lPwN58KqvPHXgAn5LK3nTB4tcKhwW
         +11ccbEY4IMRrSzqii4nPrHwRIHxElNe3D7hAiezWFnzMmyzhpPZvBzYeNEANmkL0IFt
         VEWi6zptMDOQGPOuRwfa/Ife9mpofnb5W2AabovpsZx1pT8sbKiZIGwFiqh9eKRJ1kaV
         7B4k1FgxI2CVkw6XkW8/q2S+RAeKfVtP0lVK64lizJhpTTI3E0TPxZ3wNq7Z5WsW/bn+
         B1v3B9fFpOR3jDLZLA5IZ9VyDTimYovWEYwtbEfL7rjzdMYcLobzjEmtD8WKMjyFNKcu
         DkNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788336826; x=1788941626;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=JJj9tTcMGmf0OxkdzmALICbP7nDTsOBenYEkzB3H+2g=;
        b=BfQ/yMZ7QKUkbJMmqeAw2j0c5YMVDDSHfZ5UGawNACBTrGPz16e8iOZ8AlFUhLYFK4
         +IsPAfZmFvH51YY8cOvr2q1RCgx263jbrxjTz8EEWzk8mRjFiC82N/5jpM0d4yK5oD4h
         TrpiPFEGOATMXbB5L3LKURbSmDIXt5RK9fLfW1mGerbXcLyBu7kIDBoesAd6jG6F+NZs
         zgDZKLIrQJGuiZ0TzuV4X3p+MwV2Fg8fuDPlIf9/KVRgyP9M5bg3d01//M3gy2WtX+Tj
         g3UBi6ftEgBuy/zvQMP0vO/eGmKpg3CVIuLnWn/kXl8mxJtQLhPx50922c0KnxM272EP
         Qc/g==
X-Forwarded-Encrypted: i=1; AHgh+RpHFZm/AYEmn2HwNfybEGbY6XYG1S6Hiydx5I8s4Mc8rY4Bfk1xL/5hfIELXVAj3AFR0P/JJt7v91fl@vger.kernel.org
X-Gm-Message-State: AFuF++mhCjpuKDLh5wKji/vgvTP1LTYfgk5jF01jTnqelmT793kmqAN8
	xVSfLVC+FHnAvvqsEk4E6m3gXs3nQIFCuxgUhD7+QS4Ehfvk4Oeebs0f2H3fQTUOxq/mVmR44wl
	myRJiD2y4HbKuFDSA7uACS8wy2caxabFOyMfcJTuH0pI+0Akkd3BY68uFR1dME+952A9tLmEG
X-Gm-Gg: AR+sD12CD/qUU89k6mcVR7WveT397kMwli2yeeoPTeskY4zZw1iOpw3EElYAA8IETQ8
	HypfmQEnos6BtL6u7y7n0+zfcrqm8MytK0Q9Cv+twkxjRk1PEHMA2zsZWRl+lx1QvW4qXDFi1DJ
	uHXPlh/9iLnc0LRkLtsQ+8KgyDMH9wEMKDHCncIN9lgvfb6i0VGjloHMFP4ILQZCUbkwC4gVE8t
	OkLEeMLYgnZF9b5BoJKkMH+9n3VYfqcIbdgulJyipvKIgJj/ZBty6OVA4jsxZS6H6Rv2HX4aoG+
	0bRC3vBeNwTYWnUhM8jl5FbW2VRdw3brJIZ8ydb+ewMapp7yWjMizhvvq322n8e6GfjBrFFjJOk
	5JpL2cCM=
X-Received: by 2002:a05:620a:4415:b0:934:970a:beb2 with SMTP id af79cd13be357-93960f29cc1mr351065985a.26.1788336825566;
        Wed, 02 Sep 2026 01:13:45 -0700 (PDT)
X-Received: by 2002:a05:620a:4415:b0:934:970a:beb2 with SMTP id af79cd13be357-93960f29cc1mr351059985a.26.1788336825001;
        Wed, 02 Sep 2026 01:13:45 -0700 (PDT)
Received: from [127.0.1.1] ([86.121.170.178])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49cdce10153sm139919745e9.4.2026.09.02.01.13.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Sep 2026 01:13:43 -0700 (PDT)
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
Date: Wed, 02 Sep 2026 11:13:35 +0300
Subject: [PATCH v2] arm64: dts: qcom: eliza-cqs-som: Enable Adreno A722 GPU
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260902-dts-qcom-eliza-evk-enable-gpu-v2-1-51b452a460a2@oss.qualcomm.com>
X-B4-Tracking: v=1; b=H4sIAK7al2oC/42OQQ6CMBBFr0K6dggtCsGV9zAs2jJAFSh0oFEJd
 7fgBdz85CV/3vyVETqDxK7Ryhx6Q8YOAcQpYrqVQ4NgqsBMJCJLioRDNRNM2vaAnflIQP8EHKT
 qEJpxgeySCs1TrlFyFhyjw9q8Dv+9/DEt6oF63qV7ozU0W/c+Bni+9/795TlwkLlOayVydcbiZ
 oniaZFdOOnjEKzctu0LzblIf+MAAAA=
X-Change-ID: 20260901-dts-qcom-eliza-evk-enable-gpu-6532c131cea1
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Abel Vesa <abel.vesa@oss.qualcomm.com>
X-Mailer: b4 0.16-dev-0e65f
X-Developer-Signature: v=1; a=openpgp-sha256; l=1335;
 i=abel.vesa@oss.qualcomm.com; h=from:subject:message-id;
 bh=wPTFUyYCIV3oBIBor1tcJV2n9e7M7X7a3fVGT7srQzs=;
 b=owEBbQKS/ZANAwAKARtfRMkAlRVWAcsmYgBql9q2/PWtyCXb1KlnRAVneQFGC5q3a384bnwPT
 N9X8YeDdTCJAjMEAAEKAB0WIQRO8+4RTnqPKsqn0bgbX0TJAJUVVgUCapfatgAKCRAbX0TJAJUV
 Vp8ED/0XXmpS5ipirN2RpywJYeMP3gbOKlOIO/ARV9dlS184j7pTb5MgLSf+A1RGHHmWNm9BAC9
 kYPza6B4R3vgFGgrAvi/iwLRrXA18DAb5vnoNJZ3h9MuvAEofV5eo2PVxQQrTGnkPsEnf6++wuv
 N6enOgs/oul5AkW6hYGsHjffnhs5V5tW7TB9Iamty57Qyzr+5pTRkFYGyIFfDh9xfEgXXxywIDM
 5gjaSjLnaUczSni65rw5fDjLzyunhGAe43Yvflp2p06pNy+x2/A2royxxmMdk/u2JlF7Rae0ujL
 jaR1W5FFzh4HyGBuHU0x+viwNcj6Io8jZ+Jn38S39rJ0KlbivK/rtIuqkW82oMw1G+9m2OV+dTT
 zld2cjgu99eBfor1ZDWMT49cbfixQMrtfmIoZdhOpiyZ98nOAJPx6pDO46EgdWsmuIaFDu3tc+F
 gYo6it2YWT3kw2G5vIZHB2u05v17pyghZVWNSwR6a7GDWSGPEj+7CchUvNe50wuI3RgZqX5Fqt3
 r4zdUP1ZF8SCVbCF540s3YZlvJX6tA4j+Iwz/t8alVHNKtpO4wfUuKV8NqzhNzypN2vh4koltyl
 284cqKEL1gXwAaaUKFdgo8lfsBPU+yW23CV69o3m23j3u61M9J+AkGma1EmkxWW8DTeEH9+KqtQ
 iFUKfjoOQ98SjWw==
X-Developer-Key: i=abel.vesa@oss.qualcomm.com; a=openpgp;
 fpr=6AFF162D57F4223A8770EF5AF7BF214136F41FAE
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTAyMDA3MiBTYWx0ZWRfX54Up9uSoWFvs
 HX6J/h0Mm34v9XeP3F268g+I8IhUNmYeZnH4L98KC5aV9vNeCfoDO08mUCwItXsSVlOL9Hrq3oi
 NzOoMwuQbvLY+ahSPLixesd6LdxJXrp3EC2wkChH8aiTmCRSHbsHX2qno4SmGuVAH0gvOWQjuVr
 aLywMjQkrn+ad3cVWZoyrjhHPopcT8LvgVD/PSJvHrJyhm5s1ciINfU5KpeJOos9GACLCT8VU56
 +bJr5xTWLyyMxuZ0IQGbUcC91Ukvwk5bKg0aZ4yoHxfkU94MKDwuNB6ZVCAucJM6rz5oVN0OpPj
 SO/06OAyYRVcOBR6zpMgHKDMTHfQSYMi8rtUQFbfPMOmGx9ubzSZVx/8oMF+rfbM1hlTWFbg7XR
 0tywDZchIU6GSOnGUGuuN14wdbQfgCopGx3ywKPhhWWF0hxIRgg9u8vHl7Wv6EvO6OOHnUhf3TR
 SlGlHxbq5ZdkmDaeArA==
X-Proofpoint-GUID: I8SrPhqYKB2TtgCUIY4__raaJas6fTAQ
X-Proofpoint-ORIG-GUID: I8SrPhqYKB2TtgCUIY4__raaJas6fTAQ
X-Authority-Analysis: v=2.4 cv=Re6gzVtv c=1 sm=1 tr=0 ts=6a97daba cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=G5ilVN+faPP2Ze1SHB4iFQ==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=bC-a23v3AAAA:8 a=EUspDBNiAAAA:8 a=BoG2368bKbZoxSBLJcsA:9 a=QEXdDO2ut3YA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22 a=FO4_E8m0qiDe52t0p3_H:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTAyMDA3MiBTYWx0ZWRfX/PFZoMpAjBD0
 1tB4FdooPOpphqcJdhJytaRl7yxW9X9NbRO8IhkSaw7YjeM2ccmeVBxsjzhjW5jZDx8V00fYFSp
 sHDOxhsu1Jn0nn16EyUp12dNUKlK+Fc=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-02_01,2026-09-01_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 bulkscore=0 adultscore=0 impostorscore=0 malwarescore=0
 suspectscore=0 lowpriorityscore=0 phishscore=0 clxscore=1015
 priorityscore=1501 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2609020072

Enable the Adreno 722 GPU on the Eliza CQS SoM board and provide the zap
shader firmware path.

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Signed-off-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
---
Changes in v2:
- Rebased on next-20260901.
- Picked up Konrad's R-b tag.
- Reworded commit message as Konrad suggested.
- Fixed the zap shader firmware filename.
- Link to v1: https://patch.msgid.link/20260901-dts-qcom-eliza-evk-enable-gpu-v1-1-a7c3fb27b4e9@oss.qualcomm.com
---
 arch/arm64/boot/dts/qcom/eliza-cqs-som.dtsi | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/eliza-cqs-som.dtsi b/arch/arm64/boot/dts/qcom/eliza-cqs-som.dtsi
index 5ef6c51618bf..918f5289ca45 100644
--- a/arch/arm64/boot/dts/qcom/eliza-cqs-som.dtsi
+++ b/arch/arm64/boot/dts/qcom/eliza-cqs-som.dtsi
@@ -374,6 +374,14 @@ &pm7550ba_eusb2_repeater {
 	vdd3-supply = <&vreg_l17b>;
 };
 
+&gpu {
+	status = "okay";
+};
+
+&gpu_zap_shader {
+	firmware-name = "qcom/eliza/gen71700_zap.mbn";
+};
+
 &remoteproc_adsp {
 	firmware-name = "qcom/eliza/adsp.mbn",
 			"qcom/eliza/adsp_dtb.mbn";

---
base-commit: 8b72f6626dc39b9e7e82b2721d4f7c3b86286012
change-id: 20260901-dts-qcom-eliza-evk-enable-gpu-6532c131cea1

Best regards,
--  
Abel Vesa <abel.vesa@oss.qualcomm.com>

