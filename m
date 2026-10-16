Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5933B3A16B2
	for <devicetree@vger.kernel.org>; Fri, 16 Oct 2026 06:37:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792132631; cv=none; b=hqH4BMDjVDFwKYZVp/qPoO2kJlCWukGxIkBFsSmI/YBjx1GdeZiH+lce1iBA0DtTcLFed1i0EWDT0d0/fT8DR48kJQMwOzcTDWnVALRCB8WQdDJYFz336JUw3EZ4yioockuxyJEWJQwTg67T4erzQJ9ltowNcsj/z1wbCs6M4ic=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792132631; c=relaxed/simple;
	bh=5Pr03qQhNLRXOGv0RgI7lxb2r0c4i7mfLQhNHQv8TV4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=s7ohgnWJ1i2XEvlKIhcrvHvfJfTsOa+AqqZoj14aw5he/cH6kBNwU44u7njUxP5QAl/WyT3Z6IvftgCRuP8wdi/NSaSHEM0sxxy9vRolPTbc0HJIaNTA9rd+hWus70Ju2ayE2rMyhtPSfSbxAuB4f3/rcsOjixRPwc0Zmrlk56M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ZHwzbViM; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=jULG/hLv; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ZHwzbViM";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="jULG/hLv"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69G6Ultc4126428
	for <devicetree@vger.kernel.org>; Fri, 16 Oct 2026 06:37:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	MH0X6BkiKawAmL+k5dJ4f3ue5wUkyRRRhMdlkV8hsII=; b=ZHwzbViM9nGhb4R1
	Ueos5vlT0Cdsl1AYOAT3XhOIycKZCyzer1zLBAufSu6A+VyVJySERpS9EWv33l8I
	W5Wyt2aYei8VZkJUAu0T84n/My/Rbw3LsVpVfAI0L/13M6eQRnrTqt8rD0Z9IHxX
	TDBWv2ddO09w1PpmRDWGRbd5cSnap3R2j4souLREqhTQRHNewMs/NkULqwUG9D+i
	zLtSfxJtV2vy+TDHQmYQBX/xJ56ZqkrdK9m+vWEiUKcAa0RGiYwYRg/pn+IsKQ3U
	2wcfxHqEd49T4jNTOUBn0Ah3WuGtEi24KhOVFKk7abRmbZHaS0Yo5jXQHQd4K21u
	+7r3BA==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hb19m33r0-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Fri, 16 Oct 2026 06:37:09 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-3a46f0f158dso1002002a91.1
        for <devicetree@vger.kernel.org>; Thu, 15 Oct 2026 23:37:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792132628; x=1792737428; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=MH0X6BkiKawAmL+k5dJ4f3ue5wUkyRRRhMdlkV8hsII=;
        b=jULG/hLvEC4fcToh1C/3iD8EV5nXf/KcP6YyuKvHzUP9lhz6m7k1R4xxIOBn1xr9Jg
         ZKmHeeFYGFHi+WhVhTaObxxdE+05REDzYkYOFJ9oe2FFkmemwm33ATymVjKMt98pyJav
         juxikfSqO3fhp+SpdUOcqOQBv8XrzM1QXFbQHZxlFYN+t0iqeDxWtXRDa0hur0JtyCet
         0+Jq3bPi73Krr76FB/Q4N4vCgnzY6J6Vg7OBt8/Cqp91pOp7Hg8OJ4UPz88aFpmzI62K
         EIzXeDmEI24QPmivsrOiS+QjBHf5DY6AW/YamOMn71z6zXbVo1o4rk0xI5dlW7oPPY3g
         +2eg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792132628; x=1792737428;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=MH0X6BkiKawAmL+k5dJ4f3ue5wUkyRRRhMdlkV8hsII=;
        b=g9gxZfY/1L1jw1/xIoB4UaK2wWAfpJSJQki2J8KALimH1/JoQ1EMcXFb3YD9oqx5Dw
         g0ahLoGF3spjICcq/q+HjfZ6ZjDcHrRMY4Ca5wP1ruS5SFxHP/UrNTXVGFIZAIQi5Is0
         YSarrUR6OSUPopAiFVxDeGY/QvrjdyuDuA1paXllex1n7iWkBFkmX//OGNvCtmeQvurT
         wWlQlGfBZL2tDMFGhWDjHc+e+ojqJXYwKzrWyiGZC1Q+tijY0B2dGLzyB1Q7/EsxSxTI
         TGnN8OB3iaLNN4YyM0AqIAzL50I+pzEUHtFKSOxGgH4SY/SGCqbFb4VnaX1MGKRMZBec
         5zrw==
X-Forwarded-Encrypted: i=1; AKwUvBwN4QT6+HS36RvYDS+fpGPjUoqaHaHte5/G+UlxUhHRkdO+w/P2YeyzU+Xv4LaQWsT1IKl8mokqvpn4@vger.kernel.org
X-Gm-Message-State: AFq9FYIphl2gWJt6i71xFf0lD4slTtgNCSh5kGPy49ci8gUt66vBeacB
	+a37bDUfSgTabcWOX8vX26067DjWo7DlqKDqL2I5QJkonYuQI+2pAc5RL40QWbrDWDfjlGPLB2n
	j4PvgOl6+E36TaQihacr0nbGCZoarL4SpcSXp9hwLfAswqrEORdNwu5F2dicI+wWa
X-Gm-Gg: AYBFou1QQ2nufJ1+uL5Pwd9L1Jrzii3xGeGOkOEavzpzneLbZpl0uERSbhQANCdR0sN
	UwmJ4bA/FiooWRAwfn/JRLylzwyrHo+UoL5K4XX+JYPNl4I+ORXcyrgN1JIFuArn4mihN4HM4UI
	5Nim3FAX8rPonrkb0tEvg62SFkIH+ZCvwi2gIAMDxtHs8/0zbz1rQtzP+S9f+ojGU+lWoSqOdwN
	vdJjr887ZdyIYi+iGdNOdEDBOgsbBQ2RqcaQsGMrECpW5lbOgzBOh0oxMMFxa+sr+idG5rcqamC
	4ouLVARVTgXjlusECf80JWlVy9isiQK/m/xUxsPdmlHB46NAXY4cx9r9l6uXzvgKV8CpdJ8d0mM
	eEnHVhskTlZCxk22MdrJuouY5rplrLa0=
X-Received: by 2002:a17:90b:4a85:b0:3a0:d7f2:5a58 with SMTP id 98e67ed59e1d1-3acbb68a0a3mr1547621a91.3.1792132627844;
        Thu, 15 Oct 2026 23:37:07 -0700 (PDT)
X-Received: by 2002:a17:90b:4a85:b0:3a0:d7f2:5a58 with SMTP id 98e67ed59e1d1-3acbb68a0a3mr1547604a91.3.1792132627331;
        Thu, 15 Oct 2026 23:37:07 -0700 (PDT)
Received: from hu-ekangupt-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3acc43a1e1esm2703298a91.1.2026.10.15.23.37.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 Oct 2026 23:37:06 -0700 (PDT)
From: Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>
Date: Fri, 16 Oct 2026 12:06:47 +0530
Subject: [PATCH v5 2/2] arm64: dts: qcom: glymur: Fix fastrpc compute-cb
 reg values for cdsp
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261016-glymur-dtfix-v5-2-f56a8b94b4a9@oss.qualcomm.com>
References: <20261016-glymur-dtfix-v5-0-f56a8b94b4a9@oss.qualcomm.com>
In-Reply-To: <20261016-glymur-dtfix-v5-0-f56a8b94b4a9@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Sibi Sankar <sibi.sankar@oss.qualcomm.com>,
        Srinivas Kandagatla <srini@kernel.org>
Cc: Bharath Kumar <quic_bkumar@quicinc.com>,
        Chenna Kesava Raju <quic_chennak@quicinc.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
        Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>,
        Mahima Bhattaram <mbhattar@qti.qualcomm.com>,
        Pankaj Patil <pankaj.patil@oss.qualcomm.com>,
        Abel Vesa <abel.vesa@oss.qualcomm.com>,
        Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1792132608; l=2068;
 i=ekansh.gupta@oss.qualcomm.com; s=20260223; h=from:subject:message-id;
 bh=5Pr03qQhNLRXOGv0RgI7lxb2r0c4i7mfLQhNHQv8TV4=;
 b=+vLCPCBS0d1y6CQkVqsFNpndDW6h1mukkd/toByoy/9Bikzv3H3HxDQRWVRkdR503Pzqy44xr
 B/gOI6UVYh5BPaXNooWPIWVZfr4aiXGAjuOJkAwKG9ch35xzCooswlp
X-Developer-Key: i=ekansh.gupta@oss.qualcomm.com; a=ed25519;
 pk=n0SepARizye+pYjhjg1RA5J+Nq4+IJbyRcBybU+/ERQ=
X-Authority-Analysis: v=2.4 cv=aLdlOr9m c=1 sm=1 tr=0 ts=6ad1c615 cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=EUspDBNiAAAA:8 a=50Dod7zhrM_yUD2Akn8A:9 a=QEXdDO2ut3YA:10
 a=mQ_c8vxmzFEMiUWkPHU9:22
X-Proofpoint-ORIG-GUID: UR0VCCvtmF2vtHDpoN2wrB2-NzlzkVCF
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDE2MDAyNiBTYWx0ZWRfX20lR3hYBXvDH
 gwwzKlLH9S+uS9EHDnZ5n+vHa94KqIAxPXQJA0whD3wyymi4ykdIwc4F9znhHC5QwhFPtcb9cbb
 35yZwK2In0U32cHAcQlUME4YcpDx3mI=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDE2MDAyNiBTYWx0ZWRfXzG+ICDM+0DUR
 SiYtWP5dwSfLxdJ2Nhwk6GgDUspsHL54qMDFhqAj1KfoYIK98luCwK0dOLq6Jtea+7Iz/24KWp2
 qiGbGTWZ36DND4+jgqsGNGd7vth4riO84gZ8pZKqRe2mCGlco6LnSPhFWNok6Cwa8vhVYo7rT7u
 FWT/erY9RxfSsuTVNAV5ccJLNxnW05fzCYlzBrOpcK/GBRcqmlNhDcI8ZdcJeBK3NoEh0J6ebrr
 5kIqwKYJA5kUHmhGTxHdTVM+vWSGfU+vj5eaAhfTAKPK8/DvHYy67mBQQOSX0vvEuCjy6B7d6KP
 KUbGbdaOUeMXESV5B6DWUNrBUDIXyAYJt5JaJHpxsxW6+v+PHQLrfVBBfTnGS6QiBH7Kyx4cFAf
 dqVXzOxUusUtXAbg1acaqFqIm5CoJEFB5djYIs1WIa/nBACdaBcJ19f0gd+9/VpRAiBb+SFI3BH
 2A8X2fup+IPBvh10i2A==
X-Proofpoint-GUID: UR0VCCvtmF2vtHDpoN2wrB2-NzlzkVCF
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-14_01,2026-10-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 bulkscore=0 clxscore=1015 malwarescore=0 adultscore=0
 suspectscore=0 spamscore=0 priorityscore=1501 lowpriorityscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610080000 definitions=main-2610160026

The reg value of a compute-cb node must match the SID (the lower
nibble of its IOMMU stream ID) it is associated with. In the cdsp
fastrpc node, compute-cb@10, compute-cb@11 and compute-cb@12 were
mistakenly given reg values of 10, 11 and 12 instead of 0xc, 0xd and
0xe, which don't match their SIDs and leads to SMMU translation errors.
Fix the reg values, and rename the nodes accordingly.

Fixes: cd1d174c75f7 ("arm64: dts: qcom: glymur: Add ADSP and CDSP for Glymur SoC")
Co-developed-by: Mahima Bhattaram <mbhattar@qti.qualcomm.com>
Signed-off-by: Mahima Bhattaram <mbhattar@qti.qualcomm.com>
Reviewed-by: Pankaj Patil <pankaj.patil@oss.qualcomm.com>
Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
Reviewed-by: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
Signed-off-by: Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/glymur.dtsi | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/glymur.dtsi b/arch/arm64/boot/dts/qcom/glymur.dtsi
index de7c395d9c35..42d9ba3d3cb6 100644
--- a/arch/arm64/boot/dts/qcom/glymur.dtsi
+++ b/arch/arm64/boot/dts/qcom/glymur.dtsi
@@ -8471,9 +8471,9 @@ compute-cb@8 {
 
 					/* note: compute-cb@9 is secure */
 
-					compute-cb@10 {
+					compute-cb@c {
 						compatible = "qcom,fastrpc-compute-cb";
-						reg = <10>;
+						reg = <0xc>;
 
 						iommus = <&apps_smmu 0x240c 0x440>,
 							 <&apps_smmu 0x196c 0x0>,
@@ -8481,9 +8481,9 @@ compute-cb@10 {
 						dma-coherent;
 					};
 
-					compute-cb@11 {
+					compute-cb@d {
 						compatible = "qcom,fastrpc-compute-cb";
-						reg = <11>;
+						reg = <0xd>;
 
 						iommus = <&apps_smmu 0x240d 0x440>,
 							 <&apps_smmu 0x196d 0x0>,
@@ -8491,9 +8491,9 @@ compute-cb@11 {
 						dma-coherent;
 					};
 
-					compute-cb@12 {
+					compute-cb@e {
 						compatible = "qcom,fastrpc-compute-cb";
-						reg = <12>;
+						reg = <0xe>;
 
 						iommus = <&apps_smmu 0x240e 0x440>,
 							 <&apps_smmu 0x196e 0x0>,

-- 
2.34.1

