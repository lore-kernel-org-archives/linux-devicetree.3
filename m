Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 55FDA4B128D
	for <devicetree@vger.kernel.org>; Mon, 19 Oct 2026 09:25:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792401957; cv=none; b=KhNYaz4xGOijnOajZ3eeqL8ntnrq66fSa7Kn2vqH8KJZU1glzZ+C/5LJCXUUUyuhjkh8r1fZ+CEaRqP+SFmNMkrGhXqnRYbGr4RLeg4crIwQ1V+PktGctPm1C6B+7BlxkFwR2sfe0HCfAVZtFIqeoovVuZSxwnuBIz01azNsduk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792401957; c=relaxed/simple;
	bh=lXeO7bP7idTFtUBzuKbosYtATj9Ndsw4dWgt9vtKsn0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=SGtGp01IhD6G4K+d/dhzyTS2eHXKMdY+UG5UxJOdlITX7A7gBpeODEhi8qXIPT5qpHhZNmHpiz59aur1TdRO1t0LzFz5KxdrZzPg6VKENyuNhb/yWnhAloPq/LcxudCfSt6uxzofebSrwYTbjhIFtRyEh3xtRFgq+b/spWxwM+E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=d2FkTV8U; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=UJanArfc; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="d2FkTV8U";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="UJanArfc"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69J8Ouw5723272
	for <devicetree@vger.kernel.org>; Mon, 19 Oct 2026 09:25:55 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ZqNPgcDIDE6Bp0KwMFBvoaExUNRvYuzoKfkIwpxCEXY=; b=d2FkTV8UHXYJiKNw
	Ic9Nf4JeODiAasoFzuWwMZ2q8POGB2MzoXGNxB2LPYUEOcr4YLnaGALtx4pcLPkN
	RtHQiq/SG4xwaloHlwNIRjB68NhAs56o7/1RUAoW2mGs8mtSU8JnPkTARPN9vmjO
	UcvO4SuZHcXwkRDGanA+2h7XFjbIp8qVRWAaOKzfK2vwNj22ILXzmGBz3n2KfMtb
	EBColTIxKBUewnNOgrbMuBbWA8aP6VY6wmYNik4x+zydgu6hMEWfVH74Wme61ZM+
	x8inA8KSoQsiv5k/j/zb9O7klTm/OKORiVzSppyClc9dsofQHonk9WKoGqb2Js6Z
	n1PQww==
Received: from mail-dy1-f200.google.com (mail-dy1-f200.google.com [74.125.82.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hdf65gbs4-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 19 Oct 2026 09:25:55 +0000 (GMT)
Received: by mail-dy1-f200.google.com with SMTP id 5a478bee46e88-357e2bc3b1bso3324871eec.0
        for <devicetree@vger.kernel.org>; Mon, 19 Oct 2026 02:25:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792401955; x=1793006755; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ZqNPgcDIDE6Bp0KwMFBvoaExUNRvYuzoKfkIwpxCEXY=;
        b=UJanArfcctal/2vnX5XxgRfKPjC786lNL+H479l1RmwhfRAFtvWqr02swC39XrKasq
         rjFqf0KrPruLNWxWxzt6crURX9nPIDjDZWHSZf7kOtKKHHNGJVrMYtAGJvj3ydpKFmSx
         WwsSi5aIwLdQdIaAcFmmhpl6BFrphKa02TVgFiLcHOoxwwqijCZ6CHu2mOvhPF/J6Ufx
         jVpRj2n8J9V7c+JfxCUhgbcVcD+nXB66K5AogURo6BcT4U6h34lCJoyV/9gHNt2mUC8R
         enZU+PjOefS8JvIgqtuM1EgRWxVkgEIuMitVNGzN586vfsqo+4Tnb+khUap+1FOM7P8u
         P9FA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792401955; x=1793006755;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ZqNPgcDIDE6Bp0KwMFBvoaExUNRvYuzoKfkIwpxCEXY=;
        b=SC3ZhTtlo5jV8s2ih7p26QBb9AYDAXXLDvkRKwKM61NaxAIwDld5BfL5mDVwEPpdmE
         UwFxtwe6GeH6FbjlWlkWxmtnYgpIopoiDjhpro9eWYKxPPkDYQWhOC6zAtD4AIfT7hAT
         nYcqkNvAx5wo/rIUcyHYoLajHRbWzN9CK9MVvkrjou9LfmOpbTBKJuaaCBKIWIRvQN2s
         YTmwjRLSI9xgvLNnYwXi2FMAMh3FqmOOjwdACymvmoPra2WDbjQKaBLt+kGkj85z7EJv
         hSlG9ciFX2Td0GK2FizmhpU1D3vOSZ+G+oLXtaFpRyiWbzNx/BLKXiynABLe4jpC9C5c
         8EUA==
X-Forwarded-Encrypted: i=1; AKwUvBwhV53wmzr17GAEBv4Vz+ZRld7+RxTssHadFiYAZzQrSYflTw52jsW67oIrrafaDX5wMzfFK4yqW/eM@vger.kernel.org
X-Gm-Message-State: AFq9FYIVCxPGLXJwj9uDsqwfTCgLR/FqwnFketvEiH2y3KzyNijr9R2X
	tDekw2f99yl8pnxWIZN1iAjYFgpfcK9sZPW0551a0E4I/WnaRFIV6Q41BH3Q6CwUT9IaWEeOXUL
	kwVwQGxjkdaWTORJ1nzJFLdNG23B5EpufxtnODm083e+7Rpb40nBev0mwqOMu18mSYoXieQZA
X-Gm-Gg: AYBFou02jNKFgn5uK3Yglv0FhafQ3wwYGTlGL9CJjkZDqY+f3v1yazYXSXrUooanRPT
	sM6SL4jnBdBgOvpWViqnkr35xs4BwMQjeq5VBlfp76t9Y4rwogxLu0h3zBYxOrLYa2MSnXsG5j2
	rH5YPwz1gccnnoNh5Gx1UgHsEfTKtkJG59g9vpi6sWzqEs9RdCaHpHEEbbR6MoCUBy5GqdXnLSQ
	dLcOvsxuoydCucl+32OqbC1GHiHyj5vSV0sl8I9GhK2zPy6OIkYtk10WcEZaW40sGPsxBwinJnY
	fXHgbOMyARgTxlNRGQxGR4X95iZQirYw6xzv0KqOSgeQxB1AFAgw1r84A+5v1L86FIm10PVA/MH
	laWTMLmC4BIRy1NVdHK+dWVgQNFWFuXVjyw==
X-Received: by 2002:a05:7022:170d:b0:154:d06c:e70a with SMTP id a92af1059eb24-1851285ca17mr9769409c88.23.1792401954800;
        Mon, 19 Oct 2026 02:25:54 -0700 (PDT)
X-Received: by 2002:a05:7022:170d:b0:154:d06c:e70a with SMTP id a92af1059eb24-1851285ca17mr9769372c88.23.1792401954201;
        Mon, 19 Oct 2026 02:25:54 -0700 (PDT)
Received: from hu-krichai-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1831c4d4675sm26682584c88.21.2026.10.19.02.25.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Oct 2026 02:25:53 -0700 (PDT)
From: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
Date: Mon, 19 Oct 2026 14:55:13 +0530
Subject: [PATCH v2 5/6] arm64: qcom: monaco: Fix pcie1_phy compatible to
 list qcs8300 first
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261019-monaco_ep-v2-5-852cb9f5d012@oss.qualcomm.com>
References: <20261019-monaco_ep-v2-0-852cb9f5d012@oss.qualcomm.com>
In-Reply-To: <20261019-monaco_ep-v2-0-852cb9f5d012@oss.qualcomm.com>
To: Vinod Koul <vkoul@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>,
        Manivannan Sadhasivam <mani@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Helgaas <bhelgaas@google.com>,
        Lorenzo Pieralisi <lpieralisi@kernel.org>,
        =?utf-8?q?Krzysztof_Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-pci@vger.kernel.org,
        Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1792401919; l=1159;
 i=krishna.chundru@oss.qualcomm.com; s=20230907; h=from:subject:message-id;
 bh=lXeO7bP7idTFtUBzuKbosYtATj9Ndsw4dWgt9vtKsn0=;
 b=sjm+65Ib8YrCBQPt2R/Zbrm5GYLWerivul8CnzzIcez5z+2TGxqbmoQ+cWL8+ZPUBvyxNeUU0
 zbxSJSxjNTFCH4PTwZyc3qwws3KG0sTG5DvGKJYveBomSlQsGmUVvcH
X-Developer-Key: i=krishna.chundru@oss.qualcomm.com; a=ed25519;
 pk=10CL2pdAKFyzyOHbfSWHCD0X0my7CXxj8gJScmn1FAg=
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDE5MDAzNyBTYWx0ZWRfX/iE2ZFBa7h++
 sIL5ym4tbEiThXCNJmvHWT5dbdpWdJPSpNSet7/umhboHasbEtJ27VEm1IEQvqJkmBvgj9fDxeB
 L5DD7mFWrm3xLScU8Jn9MXViaoL2lMM=
X-Proofpoint-ORIG-GUID: 7hj3RQYcMtVBGqNxF_dCVOBzHMUizBb0
X-Authority-Analysis: v=2.4 cv=Y5ptIReN c=1 sm=1 tr=0 ts=6ad5e223 cx=c_pps
 a=PfFC4Oe2JQzmKTvty2cRDw==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=EUspDBNiAAAA:8 a=_k9ig2nQFDp-gxZIyLcA:9 a=QEXdDO2ut3YA:10
 a=6Ab_bkdmUrQuMsNx7PHu:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDE5MDAzNyBTYWx0ZWRfX7tCY3l1C62RY
 O0BYsuJA+CSp8sAPpEe0tl8KfLJoLtaDS402k7Mgfv6j0q4qLelWAdu2EKjZzpINF7V/fYBg+o8
 ARzUp7DgWbGJlnht/fZpHYb+dXI3ujzSGXOasXoZZI4bcSB2bMiA9Hu1FBbftVdhmyN++LTtsNL
 ZeaKYrG1qFMGH/VloeT7D7IZiJEYnhQzBX2THRrYmGRTTqdF7VQaaPI2yN+28zeQ4Zk7qor1X8j
 CoI23C2bTKaYiWyFybdIM2/KOTTT+LyHROm8wEQefpufylN0/GVN1sahTO8K6O0slPSOLg/qCiy
 x19GmChJMnj63yF0RLno/19gudhjwbEPDfNFocMzAIKXlG494EEKhQK/eJ4nUF+CDpnDXyFDqWF
 SF2XlCJLj09V+FlvnTEN7kn1x43n0vVKgiTrlOcNhEYyFZFbYkNLjckvOpfKjN+8kSxlWL+F9ha
 jNlF+ryhd7Wun8la+Ew==
X-Proofpoint-GUID: 7hj3RQYcMtVBGqNxF_dCVOBzHMUizBb0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-19_03,2026-10-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 impostorscore=0 clxscore=1015 priorityscore=1501 malwarescore=0
 phishscore=0 bulkscore=0 adultscore=0 suspectscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610080000 definitions=main-2610190037

The existing pcie1_phy node only listed qcom,sa8775p-qmp-gen4x4-pcie-phy
compatible, since no QCS8300-specific compatible was documented for this
PHY at the time.

Now that qcom,qcs8300-qmp-gen4x4-pcie-phy is documented, list it first
with qcom,sa8775p-qmp-gen4x4-pcie-phy as its fallback, matching the
order used by the pcie0_ep and pcie1_ep nodes.

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Signed-off-by: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/monaco.dtsi | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/qcom/monaco.dtsi b/arch/arm64/boot/dts/qcom/monaco.dtsi
index cfe39f923224..d7d135e87a8c 100644
--- a/arch/arm64/boot/dts/qcom/monaco.dtsi
+++ b/arch/arm64/boot/dts/qcom/monaco.dtsi
@@ -2597,7 +2597,8 @@ pcieport1: pcie@0 {
 		};
 
 		pcie1_phy: phy@1c14000 {
-			compatible = "qcom,sa8775p-qmp-gen4x4-pcie-phy";
+			compatible = "qcom,qcs8300-qmp-gen4x4-pcie-phy",
+				     "qcom,sa8775p-qmp-gen4x4-pcie-phy";
 			reg = <0x0 0x01c14000 0x0 0x4000>;
 
 			clocks = <&gcc GCC_PCIE_1_PHY_AUX_CLK>,

-- 
2.34.1

