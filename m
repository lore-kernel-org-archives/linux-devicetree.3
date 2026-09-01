Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 650A1382365
	for <devicetree@vger.kernel.org>; Tue,  1 Sep 2026 08:07:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788250069; cv=none; b=J6t3WFrjR6G7wUPWbSJIBPwoQqAnT36WgUKGK1r/N9IMvGdT2OQFQOmu6m45mXgRidkEQx8hJvjjabf1MxZuv+UuKndVAkwIc4nN1cyjUz5FtiTcjaSeuKMYUkxgMgX7Wm9ajuvGHQkTLjQRvdROQjG6aNasYpWkHtfiV56BTGs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788250069; c=relaxed/simple;
	bh=+gdh32F69OHw+gDmza32B4GqDY4M+tbbtDhsAUC3FZs=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=pyjU/UrjCa3cBjF1lciYgeF4dGeBTjU0F/R9g8K27Og/dJpX6fYVgg7YIZW90/brnPWGItNs/U8/YHtFgq3KxOMLKVNsuOhjXwKU6/h0Nagnkwo4vkmUw8KY+oKgN9osm4M1L+V/Q4fej+a3AzF7SZKMnMqrtN9/Z/4RlcwUc5I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=RdOcWdG8; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=M/45qbup; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="RdOcWdG8";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="M/45qbup"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68179J081709548
	for <devicetree@vger.kernel.org>; Tue, 1 Sep 2026 08:07:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	x4WVsHeU+3s+biTDWVVpXB2smebPfabTddWsJNC4U3k=; b=RdOcWdG88wADEDzJ
	6dchC921X7kVG2aCmrwBk+7rbKhtb0VYpK08ICqRNdPQImO9GhzeFNnkRIQxQcLn
	14tESxrH7usn0dJO7y7md05Txmu/i8xJEI6EmTSf+xwEBtwjP5m3fLqPIL2r9HSz
	thBLw+RAXHSS9daYd1+qehJG+n01MVrdWDBJ3Iqu4Nia+IxHDHCbwGtsSXplJI+O
	6oB2oTIKccZNs/FZANiuhtF98zqbUoJsAP2uPam3TQ7jSrCPy6s7ISIgfamWhy0X
	P2mRk2ap7zRQcNG0bYC5IzWsD5lSzjXBuyJrHbFSNcZ0p8Y6JHJShc94sh7obGr5
	HcQUPA==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gdp8fs5hc-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 01 Sep 2026 08:07:46 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-930edb4362dso620786385a.3
        for <devicetree@vger.kernel.org>; Tue, 01 Sep 2026 01:07:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788250065; x=1788854865; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=x4WVsHeU+3s+biTDWVVpXB2smebPfabTddWsJNC4U3k=;
        b=M/45qbupyIeOcx1dS3hpuuDBGIklgokcTKnk3aelV4ndDRN/yX5S7GwO6ihKDHyx0m
         jmyzWFPMj00IQW1nGL0nblZiLjiqK/ovjsLf8VEw1aRvlgmFuZ/T4G0SvMZwXap1UYDp
         rpqudzjv+xG63v5ChUp711rx3TF4CCpaH82nzcZawPdQINXzAhQ3WjHcbSf4K4k9MqQ1
         acXqVZhipfq3wesHvWezPer5zHKj/T8sXXkwb21d1NavGXyaIa8Hp0mBgpSetAPsqa57
         uiPMHTyDMQovbBzRBsLJi8qYzVYeAaKT4K11b+jEqFh2xbtpmk7iGurGEthM3bJQmUAv
         jDNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788250065; x=1788854865;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=x4WVsHeU+3s+biTDWVVpXB2smebPfabTddWsJNC4U3k=;
        b=NNgBXkmGVPlGQfvGej+9EpeoF9eSeZxt8jR7b0OrqH4X2Ju6U8q0uU6EoEV3VVQXGP
         jYYGHY5aneFk8Y05NSko3jBVNcrF+q4E7/5kvrw4DFIpBKd35ohErd09HvNZO1CLy0oI
         CIH/gQhoQAtOhO8K9DqSsdgX86wOe7CNtTMhOuEaB+czutP1Y7PWyjLy227WUoj34tsF
         zMpbkx12zAuoovEoZY2j+sfGvPrr7ktY767SuaBnPCRFEBKpDMm1fELLP4a+XUXl2/0m
         8z4CxF1mQiMjDgdMW/idU3FWRCmXMaAmWkxIQPdCPS04LbIlK2x6DPIVpW7CmqpVMgUT
         LH5w==
X-Forwarded-Encrypted: i=1; AHgh+RqQbJ1fyAVf7HG+rckTOGMerqK43Jv4YWoYHQo9q88nECeQLEvo+U3Bi3agfMdzhIHx9pZ658B36Jrc@vger.kernel.org
X-Gm-Message-State: AFuF++l9Qd/Wy+6dUs7y4E/PbTsj3eduB3Si7oICUr7DwgqYkEg818Dv
	vBHUgdY1wRCRdPahjsklThzVfgrE9HTxoiQBq13xYONzmGqFChakEIotOQV81pmTmuy3HNPOwOQ
	NIRkmXsmp7xTExZO9pj1xilnlDAtlXUllOsDXVopnSmXU+rTKlHkQX+dV8JA7vvKi
X-Gm-Gg: AR+sD12fGxVqm0NZlNqoeZVd9iVYNCkH1TXhWHD0X51vdO30wcDtBFWfjnaGqqjEe++
	hE1AN/gFZvQmXshZS3R+DwiSqN7LQtr4CnKovd18bEkPrycPygsnR+azH0s7Rc661XRitvyANTl
	pphzJicAG3vN1KmJ1UFyjKlstQqzf5WQVW8AUwtiGGX5RM+6VbZ0VuTU+9ZsJ2kVKviuX1TlC9s
	gFrxthUEh97PhGqnhFf8HxxzGP+C72GVBSvJKK4DVtWxObMuDfMjUVY/8cJex3mqhy3mkC8cZEz
	FhTGdR92fd27sDjxn3CclmbZS5yuADjyzsfUPF/R3GIJ0vdnCfCHPWaIuAIujFGKbV5iDg44kVR
	uk+XX0Cen
X-Received: by 2002:a05:620a:44c5:b0:939:990:c943 with SMTP id af79cd13be357-939138df236mr3383160385a.32.1788250061583;
        Tue, 01 Sep 2026 01:07:41 -0700 (PDT)
X-Received: by 2002:a05:620a:44c5:b0:939:990:c943 with SMTP id af79cd13be357-939138df236mr3383150785a.32.1788250060819;
        Tue, 01 Sep 2026 01:07:40 -0700 (PDT)
Received: from [127.0.1.1] ([86.121.170.178])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48442d3d2eesm3267776f8f.15.2026.09.01.01.07.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Sep 2026 01:07:39 -0700 (PDT)
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
Date: Tue, 01 Sep 2026 11:07:02 +0300
Subject: [PATCH v2 05/16] arm64: dts: qcom: honor-magicbook-art-14: Mark
 the EC reset gpio as reserved
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260901-dts-qcom-hamoa-reserve-ec-reset-gpio-v2-5-f4ab7e4bb75d@oss.qualcomm.com>
References: <20260901-dts-qcom-hamoa-reserve-ec-reset-gpio-v2-0-f4ab7e4bb75d@oss.qualcomm.com>
In-Reply-To: <20260901-dts-qcom-hamoa-reserve-ec-reset-gpio-v2-0-f4ab7e4bb75d@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Rajendra Nayak <quic_rjendra@quicinc.com>,
        Abel Vesa <abelvesa@kernel.org>,
        Sibi Sankar <sibi.sankar@oss.qualcomm.com>,
        Marc Zyngier <maz@kernel.org>,
        Aleksandrs Vinarskis <alex.vinarskis@gmail.com>,
        Konstantin Shabanov <mail@etehtsea.me>,
        Srinivas Kandagatla <srini@kernel.org>,
        Ettore Chimenti <ettore.chimenti@linaro.org>,
        Georg Gottleuber <ggo@tuxedocomputers.com>,
        Xilin Wu <wuxilin123@gmail.com>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Val Packett <val@packett.cool>,
        Laurentiu Tudor <laurentiu.tudor1@dell.com>,
        Jens Glathe <jens.glathe@oldschoolsolutions.biz>,
        Dale Whinham <daleyo@gmail.com>,
        =?utf-8?q?J=C3=A9r=C3=B4me_de_Bretagne?= <jerome.debretagne@gmail.com>,
        Abel Vesa <abel.vesa@oss.qualcomm.com>,
        Harrison Vanderbyl <harrison.vanderbyl@gmail.com>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Konrad Dybcio <quic_kdybcio@quicinc.com>
X-Mailer: b4 0.16-dev-0e65f
X-Developer-Signature: v=1; a=openpgp-sha256; l=1166;
 i=abel.vesa@oss.qualcomm.com; h=from:subject:message-id;
 bh=+gdh32F69OHw+gDmza32B4GqDY4M+tbbtDhsAUC3FZs=;
 b=owEBbQKS/ZANAwAKARtfRMkAlRVWAcsmYgBqloevNcQK/t7XmRougR0C4w3b4sEY24wEPmPGS
 ZB01EW3NoaJAjMEAAEKAB0WIQRO8+4RTnqPKsqn0bgbX0TJAJUVVgUCapaHrwAKCRAbX0TJAJUV
 Vi1bEACt5IrCNJwjdjzl8KkD2R4MrfBQmby8L2lVdahZbKTkSAGYL3hobjpp/05Cvnk8wVUHSsv
 6pJb/2L+0NcWXXdBNq5AWvw4+HZlVI2YLVDp/h1RG6BQlXLw8z0CdYAfYw0sv4iiewHKtb42fV8
 jOmvfD19nEfHt5kCJRg+TAhrpLzhUEkfPiBcaXxPG6Bz4942AA0DwgGJZ7p31Ok8ZBJzq/+Q/EI
 +u0pfdRQYh4w4bAzxGhqlFDVFCDF/XCH1nlLFIN8hv52TvNSD3QLhyCVi+o8DwLFrwI3yjvKlJi
 xZYY7xWRsqC5XKEpoJ7ZpI1pN1+uuHSYyemeqRvwHhsnTsxVU6JL7A0UtBtAInowc2kFDBqV/3y
 0b7xQlGs9H+/ahyilYMLe96QiEMFseuVGFfqqJxM2AI5ZwLl/cOabwiNboBHT1hXSoaGFnGIhgv
 1tJg/mLlstQ5Py64PgDemQmwz7PKyys378HjI0W4vorpJgr4cooC91uqpJ9V4b/uf+VxkbFUzm6
 bAbLBD1q5Vkvbau0jTUzMX/pAlZAZMtJGKAbrqcTInwf2ZA1bWYLiORGP99QEcFOScfz4TgWYa7
 7LUFo68pojeHWavw/JUa9SwRC3kleyo614MZXpxaHA2sac+p7f9433Uu0iSnXbwg1Dq/FV61Oz9
 dKPkkZgdEKMcVpw==
X-Developer-Key: i=abel.vesa@oss.qualcomm.com; a=openpgp;
 fpr=6AFF162D57F4223A8770EF5AF7BF214136F41FAE
X-Proofpoint-GUID: GpVQPAxuZn-1NJhaeEx19D3Z32wxFPRe
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTAxMDA3MSBTYWx0ZWRfX1oslvF5+3b4k
 lZ5DX+NHaDIFr61Q1pay8qcLG6GFjzZsQS1U7OflKUyKtDx3rdAvEz/XaNJNVLhIXlPP1c/Y62b
 /FLuFkKfTcpRI41deu4FApN6oywt75Q=
X-Proofpoint-ORIG-GUID: GpVQPAxuZn-1NJhaeEx19D3Z32wxFPRe
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTAxMDA3MSBTYWx0ZWRfX42MuNSaFWegA
 /9dIs9x2yofw1iOcfDhla0gSOLcwqAkNwwz1GCD8Gw31gwwGlYnEPZnKtEgUpQ4DdXr5vZ3JFKh
 5bcJXKmcIgf0RSXWjE5Ht9/bRMpgSHFQeWuR47oc5yi9/uJ52hplaI1tDIQprDC8zc2BRHKVBbW
 IVHw+Sk2jX/1JdNK+1crmD6MWjwKax/Wz6S6hI4uZ68ou3T4ALrd6ZN3APLGUmsltyDSLr9KapU
 tt0S52jy426X1SCYj/OdcYjxY+9Q7bzUKgJxFAoyE6z0xVBk2V3w6N436ercYrdnfvfn+v6OWB+
 uNn1KIROprBk8KbsIaaVM9PiFKU6m5mKStZ6wllxUG307+KCIFPre0ggKGQWqok+7x60x5kNm6z
 v0pd6d8p3017TqNlsQ+0+YvwP1Yn6P4ooPJelvIHQfr9AosFI7+wMtGUlDhu5MHg1cbRrOfch2w
 mSQQu6PIp4J44zoNl9A==
X-Authority-Analysis: v=2.4 cv=BPWDalQG c=1 sm=1 tr=0 ts=6a9687d2 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=G5ilVN+faPP2Ze1SHB4iFQ==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=EUspDBNiAAAA:8 a=UFfQ5ueM2aPJ8qDrgdoA:9 a=QEXdDO2ut3YA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-01_02,2026-08-31_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 bulkscore=0 phishscore=0 adultscore=0 spamscore=0
 lowpriorityscore=0 clxscore=1015 priorityscore=1501 malwarescore=0
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2609010071

GPIO 65 from TLMM is used by the embedded controller as its reset line.

On some devices, toggling the embedded controller reset line makes the
device not power up at all, unless the battery is unplugged.

So reserve it in order to prevent Linux from requesting or
reconfiguring it.

Fixes: 21b15fa5f8f4 ("arm64: dts: qcom: Add HONOR MagicBook Art 14 device tree")
Signed-off-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/x1e80100-honor-magicbook-art-14.dts | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/qcom/x1e80100-honor-magicbook-art-14.dts b/arch/arm64/boot/dts/qcom/x1e80100-honor-magicbook-art-14.dts
index b70c1e094bbf..a14f0d0632f0 100644
--- a/arch/arm64/boot/dts/qcom/x1e80100-honor-magicbook-art-14.dts
+++ b/arch/arm64/boot/dts/qcom/x1e80100-honor-magicbook-art-14.dts
@@ -1068,7 +1068,8 @@ right_tweeter: speaker@0,1 {
 
 &tlmm {
 	gpio-reserved-ranges = <34 2>, /* Unused */
-			       <44 4>; /* SPI (TPM) */
+			       <44 4>, /* SPI (TPM) */
+			       <65 1>; /* EC reset */
 
 	tpad_default: tpad-default-state {
 		pins = "gpio3";

-- 
2.54.0

