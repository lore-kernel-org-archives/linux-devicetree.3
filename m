Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 00D12472060
	for <devicetree@vger.kernel.org>; Tue,  1 Sep 2026 08:07:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788250076; cv=none; b=PUEGTgI1KKtLB1uCPhq87zL8rgrcUcGTahSCrWC3SRqNlSbfl8AIIAjmLWH+4zYGbRMeZd+5a8fIiqGdLS5BG28MSBCey2MddQVYCoTkcfaNOHB0wzfbkiGCUWDmaHzASEFh247QxLvetUGChIN+q09JNNHjE8u5w+IC6K1HTqU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788250076; c=relaxed/simple;
	bh=shzWdUzwWey+4jXxXvIXmIwy5xgWoCV3JLd6EWxVgnM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=NMp4YY1Sf4ykvoFwpqI4q8SOM/8G1wULbezrwEvM4SN8OT6C8Pua/LAUZOQIlXjbvdltjV+0v7azw0f/wJey3CMKaTSRRohAY9mBBUgrTxwKl76SVN4lKm4GXBxe1Xbd+pLF02nFdSSjetrv765vo70D1woYhI/3NVh0Ub5dolg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=lut0htKR; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=NQAn7K53; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="lut0htKR";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="NQAn7K53"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68179OEL2321944
	for <devicetree@vger.kernel.org>; Tue, 1 Sep 2026 08:07:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	rLU0ET7XGR/RhGPgsz+MD2O51qa40w85iZNcCKWj3r8=; b=lut0htKR2mPAFO/F
	c0NxpUmtjhklD0osucXFMWnOdJ7ibSCMBHoG3z31aGbv6UaXWgUMnpHnvNGeWMoo
	lQ71RHD8WZj3DikVhZuFN0oXTXjIxR/gpeNovBSTTQ+NCxvymzKmFa20lFzAXt4x
	gw0a0lzXVlTgdVUhkABzOZZG/vIwo8lL3XGI61K3sX2bNGEWutqAWtPP2YNnyRXg
	QP5bFiBpsmRql09fiZ/qLiyrrFqWt9l2g2Gf3DSLCe4XDyd7+rNILxK/L1MkreZ/
	7FW5O9StxPUMI+8nlVFG529r2v7nIM5DiFY360BmuI3iDAaKrebzes1zKAYUUfBD
	drukIQ==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gdfchau44-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 01 Sep 2026 08:07:53 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-93494cce712so802299385a.3
        for <devicetree@vger.kernel.org>; Tue, 01 Sep 2026 01:07:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788250073; x=1788854873; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=rLU0ET7XGR/RhGPgsz+MD2O51qa40w85iZNcCKWj3r8=;
        b=NQAn7K53TV4ULaPVg3eTHKAr4pHvmURt3LVW6616LS5nz1+P7INIKHBr/dh4YWzyXQ
         p1NhLGz0dqCi2CyoKucW7h0nrqv+OESq7VEgGkroMuO9lJyR4HkSR41bI2XUG3I47paH
         yag8clpoXcq90Ln5ETayXCgoGNpnz/IEUmz9wsappkQR+aeMCSnsKI3jSXBop+DjOSdZ
         dCwU9IqeZ9yk5GluGiIfXjyH4qBB+i/ctKJBFwKPHZp8d+QaeuYRVQ63qmDFGIm25IVU
         tafNfv7E2BeqSJmqUOOiQicCeKBrAZQ5o5ix+c0F15vTbolYwhFB1gVdaTUgcs0hlDUS
         YA5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788250073; x=1788854873;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=rLU0ET7XGR/RhGPgsz+MD2O51qa40w85iZNcCKWj3r8=;
        b=IAgqCh5azz48eQ/tGpr85hHBRCd/o0Lm2kwDApvevy2oP3hnzon2g4abYCy32IVdah
         K9SIYD5C0QGd6kEoIUmB17AGhBLuzO5f9bnDGPYPyL1AhCtkzTozOqPVMx1l9i2LB6dn
         cYlr/buoQ3PdiZ5mPmq86oHPvreduHE5dCqPIfFIZWt9ANhtK2AFFYJu7h+cY2TIOvFV
         SPyY7++kjRy7ES/qiGyQas09AZU3HmEeB/dHOnvWFs7VD9c6cRwZDNTAbvMK+R/S8878
         hKptZ/Y+RRlZHyMqPoAimL7LzuNNbpgNE6rUOxG46ZnPTQjQoaD3Kwxz77N+TtvI0qtB
         tHpQ==
X-Forwarded-Encrypted: i=1; AHgh+RoAnyEJoHF58ho48Ym8l9QiRXu2xBjAq/tfU1fTbocM+bhx8hA9Jcb0jL3u+X1NOeOYItjENwFTaRko@vger.kernel.org
X-Gm-Message-State: AFuF++mz7ilWG2Lz4C0VtmYK4O85jpxkuYwj6MfwcDmXWdtkH9mxY3Yg
	2O3ccpmF9yukh2Z4RZox7yj2go/Lo+znU0V+lOCaCGYsbL0fbeFzMb0KVI2Hoaorq30bmKhRE5H
	gDcl4UP6sLjRtTNvP2FF9KdBaQynPX2FXTQLezBZlrApwTZrwNnRA7X1DfXyD+47e
X-Gm-Gg: AR+sD105yjdvaKse6PP89DzAemiX2jsL9aNT5TUn9IH9mtEooHzWXU341vPVtDFL5Qn
	d1G4JrCsWKbK1Uqx2dvNDMZIsKZ5Q2qwu0yv/L/u7Fr6z79MIq/Xa5iCbMk9pFilQ0p1xWtYyBI
	St42VmhKP9E6A/mU7Smnt8/HZhNNOxjmPkWSjU9djsqQIbGqVBDnLWRYU79RTCFAq2gRW6OGFjQ
	gK3hGDXJU+I6n0eQcb1Hxx6RxtboDa1r7sdkX5Brrf7MhHYAGW7bh7CY3Y7Ck22dwAaBRXy/Csj
	lB04wTNcPa45a8VDp4o4cKO2ngrsFdhPhUFBZAceLZZuYuE/VPrUgopixfgZK/E1pTDixgX/bA/
	euyy8ghtf
X-Received: by 2002:a05:620a:6412:b0:937:7890:29b5 with SMTP id af79cd13be357-939481315b7mr918878385a.37.1788250073064;
        Tue, 01 Sep 2026 01:07:53 -0700 (PDT)
X-Received: by 2002:a05:620a:6412:b0:937:7890:29b5 with SMTP id af79cd13be357-939481315b7mr918870585a.37.1788250072360;
        Tue, 01 Sep 2026 01:07:52 -0700 (PDT)
Received: from [127.0.1.1] ([86.121.170.178])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48442d3d2eesm3267776f8f.15.2026.09.01.01.07.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Sep 2026 01:07:51 -0700 (PDT)
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
Date: Tue, 01 Sep 2026 11:07:06 +0300
Subject: [PATCH v2 09/16] arm64: dts: qcom: x1e80100-qcp: Mark the EC reset
 gpio as reserved
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260901-dts-qcom-hamoa-reserve-ec-reset-gpio-v2-9-f4ab7e4bb75d@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1018;
 i=abel.vesa@oss.qualcomm.com; h=from:subject:message-id;
 bh=shzWdUzwWey+4jXxXvIXmIwy5xgWoCV3JLd6EWxVgnM=;
 b=owEBbQKS/ZANAwAKARtfRMkAlRVWAcsmYgBqloezOkVMAQvi4NcePRDi35DoEX4ANm5C37e4F
 fyY0IOW0aSJAjMEAAEKAB0WIQRO8+4RTnqPKsqn0bgbX0TJAJUVVgUCapaHswAKCRAbX0TJAJUV
 VjIPD/9WihE1vjTHrj3fuQr+foPxs+u6pcc9S6LLH26XRueUv22ulpRmq/DGUH8xjWsKHNb6080
 HHzL8CDQZipmtEytkhGQe/CeVqxw1O/aIB/YaD6+Ldhu6VsFh8kip/EtcDg1w3nS9ZY/aUAv4y/
 EVyz6s547cMdR/26qjYQOga9pfevor5qTTrZvAZ06WaGeb0EaHzP2bFM2qarITj/AmxRPoyuzXd
 mjywME3UfqbG0DYP9GW+aLlyfr/OL6gMzhoHj5RgIDiy12UtadIRvPkALkOCH1FLqoWHyAPmL78
 fdEaSbIS2a7mljrhMz2NbVQRs64GTyzlyIjVezlvRgqxJ79TPV2mqASNhWKZgVKPDdqQxA8LH3j
 0eC3YCG22BCgGF+s9lsK0HgghISpAlaKiT23OUd3/j8Vrygq0pJXDOqf6gjh+r1ScVWpkplDubI
 gs3nBo/MadWZYgFlXfxiOC32YH6ObbEfndnHQvx5JaJpvx+WgK4JUmTaUi7n4YTKzEviYjNd8KP
 xfTilLhZiknUC0wzWJo9rDhje3amR4ZYoAxda7R7YKgzPE8n2vJJHl1fdxcqvQbwLZuF42tfhzf
 T6YIi6UGgL1CaVBwtqkUDTcB5MRBYZ1NTM29CydMPOCgm/novf+Ampi6YCjB8qjlGjpU3LOX/bx
 xlFf/eJtiTa9FEQ==
X-Developer-Key: i=abel.vesa@oss.qualcomm.com; a=openpgp;
 fpr=6AFF162D57F4223A8770EF5AF7BF214136F41FAE
X-Proofpoint-ORIG-GUID: REyObvVsk49FuJ-Ik48MWVcWPrtyMhFg
X-Authority-Analysis: v=2.4 cv=G9Ms1dk5 c=1 sm=1 tr=0 ts=6a9687d9 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=G5ilVN+faPP2Ze1SHB4iFQ==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=EUspDBNiAAAA:8 a=Hz9TZkmbOGt6frmL8bMA:9 a=QEXdDO2ut3YA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-GUID: REyObvVsk49FuJ-Ik48MWVcWPrtyMhFg
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTAxMDA3MSBTYWx0ZWRfX3oDpDKnvMOkC
 jYCq6qiQ9/Lx5h/pq4pVitclKp2fyiYqWu3XduFyTuPNooKdLTHTjk9oM+WxvF4p94CW7527Lo/
 yFqrGyqqj1xQ660aZom3fWuPxUtqeNk=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTAxMDA3MSBTYWx0ZWRfXwOymt1UsWH/g
 pZlIWRNqNvnF6neaYITlcN2LZStdHZuNxnZRMxETHR3bm79/st5ne01Rq1q8oDarp/f16cr0jFx
 1xMu8cFtd+OM0D5B30TFqk6TZ5NHBuaIE6rrlu2nS4GQ9aPjsGBi9VNTdIgNqB4p0/ZmgrHKvCa
 pd8GLK3YQfJM2jBLruqC61htTQGdLqyKn46p/XIwBR6ttQJxqZr/BgTrmmyyY9C4d1OAOAFbAa9
 Jhlwv5+bRqdKkmqhlcfwkAL9qgDuQp5KfKPBvMhD/AuogVyAARD0vH0NViGlISMvW6X8M3UeEdI
 NisjIeDJQLU47YatdwJabc6Upu15zC4/XVfcqCrDMv6xqIRCp25fFvZENrLGMcrTHpgKy9MEoXB
 TBJPXLKUD7SmYnGKeRI8WVgkTT5pJ47m2+EtMZKnEcfbeLWqN4j5hJ9Tj34owdSKvmBgBsxkeY7
 y7yOwW5kQs7Rm0i2Lnw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-01_02,2026-08-31_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 suspectscore=0 adultscore=0 phishscore=0 malwarescore=0
 impostorscore=0 spamscore=0 bulkscore=0 clxscore=1015 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2609010071

GPIO 65 from TLMM is used by the embedded controller as its reset line.

On some devices, toggling the embedded controller reset line makes the
device not power up at all, unless the battery is unplugged.

So reserve it in order to prevent Linux from requesting or
reconfiguring it.

Fixes: af16b00578a7 ("arm64: dts: qcom: Add base X1E80100 dtsi and the QCP dts")
Signed-off-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/x1e80100-qcp.dts | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/boot/dts/qcom/x1e80100-qcp.dts b/arch/arm64/boot/dts/qcom/x1e80100-qcp.dts
index 78380fec8839..19ea1add016c 100644
--- a/arch/arm64/boot/dts/qcom/x1e80100-qcp.dts
+++ b/arch/arm64/boot/dts/qcom/x1e80100-qcp.dts
@@ -1180,6 +1180,7 @@ wcd_tx: codec@0,3 {
 &tlmm {
 	gpio-reserved-ranges = <33 3>, /* Unused */
 			       <44 4>, /* SPI (TPM) */
+			       <65 1>, /* EC reset */
 			       <238 1>; /* UFS Reset */
 
 	edp_reg_en: edp-reg-en-state {

-- 
2.54.0

