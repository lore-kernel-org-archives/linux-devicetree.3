Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794618822;
	b=YttxwxYBtBKdV9Anc2ilj8t6r64BsSpHYuZcetVBX1xGPsCP5ETBTG2zmjWBIoQYvs/Y
	 EM3SRwLPn/kGNXZ8l6XYamTtkWyQwEOD/b7eknU5DNUwxfzl2nyt8No2mIvDncY3DNYi5
	 iJDDnTtnEbl+3Sj6hVoAumgEWseB6YBISwaI3xukRRPuNF/+RFqOuL1o0H8mJo13eZgGX
	 Log2tIg1AD8U/g4lZwvZJRxwzQLhrIr/SD7XbhZypkhs9rcW9SFsGCaWpiinE7F5Aedf/
	 WJhBv3PjiYzAHffNj0SG7zf8+f8o5+fHMWHLNsXPizBWDLYp67xjnB4M/Sgfw25pLcQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794618822;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-Spam-Info:X-Proofpoint-ORIG-GUID:X-Authority-Analysis:
	 X-Proofpoint-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=JuGhy0DKyNxM9PhxugC/t24NVoa+Yyv9Tqc8WSFHR84=;
	b=myyMNmDRjNHeVABpGeR1Rz3n/SkR6seGhXN41wUlEfgxJm4QTj7WXBIkHFlpH8S0QLIk
	 lIZURye+nYvt7xcFgs7FuXw4fhCgNViwCVNIgksSf9dzdr0Zch+FLFGbDv25t+/d/m/Fp
	 /FUZDs/cOeVEDUCapaqefo2PaNvlz22X6z7w2Crm/zMzT6oOQhSKKAaq6j96CqYZazHvw
	 GcpcRYw2vYe62OlgwJ1g6JV5Y86zvL11CbwXjCIFLuEoZLk4WffMmIzr5EUxCIz7PVHIT
	 q0VdrpkZWIw7BCBH3yglwas+A60HCrnWnJ5WFfYOhC+U7fsWwvyvgoE2scVekVL3ZfA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=eKbRTLLa;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=dIKW+8vs;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0F64F606A8B1
	for <devicetree@vger.kernel.org>; Sat, 14 Nov 2026 01:13:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0F64F606A8B1
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=eKbRTLLa;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=dIKW+8vs
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6ADMcXA11854829
	for <devicetree@vger.kernel.org>; Sat, 14 Nov 2026 01:13:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	JuGhy0DKyNxM9PhxugC/t24NVoa+Yyv9Tqc8WSFHR84=; b=eKbRTLLaM/E7K72s
	RLRxu6Ew6BnHeVkKVdEae4DcWcxKoXXWqPgEDbg3ep0wV9sztd90HXvZnJ0GxWr6
	pJw1EKUwkowhHbftXlFG2Ln70U7OB5G0bCJinSx9U5stW7Re5nhPVA1CsvCGekgj
	HtULtv8K0+WbCFERa0Rrgdo0TpIsEL8Lr7ujCYvfQtaaXdd8CqBxcyqbTN+rJpZi
	TnOG516xdRz4DBZzbskEAIhMiD0+qSAq+qrBqVWDB74vag3TgoEm3zkrdIOYMH+r
	7GTMNX6vHbfgq4zWi6RMx/XoNqcvR8Gs/VFdJ7ze2ErMFz4fExNiICPHSM67DQvn
	d6xGgw==
Received: from mail-dy1-f198.google.com (mail-dy1-f198.google.com [74.125.82.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hxahj0nb8-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Sat, 14 Nov 2026 01:13:39 +0000 (GMT)
Received: by mail-dy1-f198.google.com with SMTP id 5a478bee46e88-33713e5e6daso1450393eec.0
        for <devicetree@vger.kernel.org>; Fri, 13 Nov 2026 17:13:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794618819; x=1795223619; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=JuGhy0DKyNxM9PhxugC/t24NVoa+Yyv9Tqc8WSFHR84=;
        b=dIKW+8vsisI6eXbQaORZYY+50SEcbQHOXuuoeo4LlUlvv9M+x/RZT58ja92Q8EKU41
         6K+kz63iug3vZRULvROVLEUvCW8vftOFOI3IrqqYM9357WqAqEzi20tiuU/oCbAFiRAv
         BlaRGPxdjBzP2egC6XyfrgTR2lNGMf+Drc29n6/KD2igTOV8S7IiQlZ+fWVQks8kV78e
         OdoIZFo+epjYXPjiz6zZLuORPguv8zuhKYW42z2WBVBYjyEh5XXjHIlc89G55glptYuH
         WXTrrb6rJWBa8bdvZPWfORUGdzJNPwDS8M0GhGs+gPQgTyRnpDIF9coCnQZggjjIuqL2
         Dtgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794618819; x=1795223619;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=JuGhy0DKyNxM9PhxugC/t24NVoa+Yyv9Tqc8WSFHR84=;
        b=LGAuc21pPp2He9YK2UavZ22p82CvECKF4uGGLALibJDE61fh5HOuFzy/5/jfTbUFVq
         X2n5euKueKOyQyQuZLaFH0p3InCwLsG3sUtNPaTCpqnqsbl+lLmQJqXi4dP/0xr++WLm
         mjojRXu2u8sY1IAoGbu3IuBtXwWBIhtNyJN34QexZ+GpAnP0lnVoYsvUuPtZtX7d808I
         xgkF5V5GLt7ZwmNMkKeHZIwR9eKjst4tw7lZwyF7KjWhYpXDY/hPm6V0ovd6/HX4up2J
         yBjvkyJXaBI8hNtWvX0D11EPRjFApAl4UbdtW/Mt/ZEI3v7hAbj41xlwsq3JAAa1e3dB
         6TEQ==
X-Forwarded-Encrypted: i=1; AL+hErFQ3Cq247R2EXMKkr2ePCDym5+JySsspPnZ2PIeFJXHS5RQIlE6KWZp2/QgIoSSuPJKreaBOGUdgsNf@vger.kernel.org
X-Gm-Message-State: APuU4Z+PmpffmVCGHrGAzF9nkJbz49+2Euj1YmKOYfyhO3293zsOsq8W
	IgbbM1p+dnYKZxTIQLqI2gG+64hCgRje6H9/Lc7Au8CkoubLNp5Rd79RIyADsFO+vytgqAJyfM3
	e7cy0pcox8xPZmXwd4X7wnACZJAdqladbPka2wdEuepUDS5sY8eahQPeOdw8zhXgd
X-Gm-Gg: AYBFou069SnSdR0iP+j8bu4RupeIu7vXUK/oSh6B1s4B/pMkwTrhCK1ot9aC9oOJcFO
	R4+9A0h2mNIputga1jYKs/61Az6jQ3heyceEtvtyGkef/5ICGNQLv4O5Mf85F+wzplfc8ZEVRlc
	NpAsDbRlFThKBFFFnd+mXtrOXw0TEHHv+vs2CY5XZTdKaV1GvOV8/vRylJ0o6HUe1yWf9yYFrAi
	OMlUfdYIIAQppbRYVAVYVnTu2V56YJxfnymkdtp9DHJJ2A6xORmVu7CwbpsdyYZ9qsWqY88quqM
	1+87ujvUZ9kNGh0ASsQK2KF1MLtVvlDmqdmuvgZH4Enqn+KILAq2wZMXTiV6wXeASHp3IAl997x
	HjU4nXkwZ1XfX/WDlW8v9tzfscukr2SjA5+8zgwFWIqW0sVmGR/qwB+qdJv7haR0yn0HR1WvqdL
	9dVN1jq9pm
X-Received: by 2002:a05:693c:4097:b0:372:7af9:b914 with SMTP id 5a478bee46e88-37967aeb603mr3618788eec.24.1794618818911;
        Fri, 13 Nov 2026 17:13:38 -0800 (PST)
X-Received: by 2002:a05:693c:4097:b0:372:7af9:b914 with SMTP id 5a478bee46e88-37967aeb603mr3618764eec.24.1794618818193;
        Fri, 13 Nov 2026 17:13:38 -0800 (PST)
Received: from hu-krichai-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3795378d7e5sm10952813eec.3.2026.11.13.17.13.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Nov 2026 17:13:37 -0800 (PST)
From: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
Date: Sat, 14 Nov 2026 06:43:06 +0530
Subject: [PATCH v3 4/6] PCI: qcom-ep: Set initial interconnect bandwidth
 before enabling clocks
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261114-monaco_ep-v3-4-7fe227cdfac0@oss.qualcomm.com>
References: <20261114-monaco_ep-v3-0-7fe227cdfac0@oss.qualcomm.com>
In-Reply-To: <20261114-monaco_ep-v3-0-7fe227cdfac0@oss.qualcomm.com>
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
        Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794618790; l=2784;
 i=krishna.chundru@oss.qualcomm.com; s=20230907; h=from:subject:message-id;
 bh=JLeyQVRs1DLYCFaBm/u2gI+HZ0uJrg1UE3jfNR2noLs=;
 b=fvyspk0gNdaY7uQRp393/Q8fpriJSfofzij+hrmrJ3G/mBkegWv16IKlyLq3OaJRr1OYC4lEB
 VVVo8dduRzQB/08Em+w16e3U3EKALc9ZcitS9Kq/wPOJyXd6wwbEAjQ
X-Developer-Key: i=krishna.chundru@oss.qualcomm.com; a=ed25519;
 pk=10CL2pdAKFyzyOHbfSWHCD0X0my7CXxj8gJScmn1FAg=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTE0MDAwNCBTYWx0ZWRfX8wrkL23SasMs
 9tI0Re7/aVPyZFTAe0QYjz4ZjpnQuXJmvzcDfwBAv7NVzUJQR2FUBRez/ZjN91RY7ZBm3z2dTwG
 acP2vBpErL8ZMQpkVa1osE4E48WCqlomALnrPen6Z8KiFLh8L29jij5yumE7j+hgadOJKdAcXbL
 Go/NhUNy1h3K8E9bG6UncDjL/2LDW0qAJHjxQFzIqzgz2KA/HJVXcC+2YeJsT32oId14YDO3USF
 U6iu9Fgqu6NtJodm3FMFmVCe42zssRO/7rvQBAE43XeQix9weZV10HYHoGhAaGlYK0oxpbkHGk+
 DGtKIBXviasfAwDZzXFS940JCvsQ7jbDt+RAYefy2+gdfqmjXg7k3V8/o2wetFtst1hvHzDui4f
 N8jr2PpxQXuTuaSGOd8ZpvISYtVBWS1EARW2GmvGmsEUt6B0eGp1e5Eq2Z2bYPgP4IgSs6MFkxD
 w+A1FTqiPeTxa08Kd7w==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTE0MDAwNCBTYWx0ZWRfX0DKpNXlNmTRg
 d+3721oM5YH5kr+DZSdp0bg4+oVDmbMvdQX9L9zqZh/R55bUJmNSiSIL1Qh17gEtlbj55p6AON8
 7USaw4mAVzVerar8nnDYq9AbHHfbm4Y=
X-Proofpoint-ORIG-GUID: 5CIh--H1cbUwE1LJ784f-3zxIaQyGvW-
X-Authority-Analysis: v=2.4 cv=Kv/YSmWN c=1 sm=1 tr=0 ts=6af7b5c3 cx=c_pps
 a=wEP8DlPgTf/vqF+yE6f9lg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=EUspDBNiAAAA:8 a=kXhGf0cxdCgfIYue-YsA:9 a=QEXdDO2ut3YA:10
 a=bBxd6f-gb0O0v-kibOvt:22
X-Proofpoint-GUID: 5CIh--H1cbUwE1LJ784f-3zxIaQyGvW-
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-13_07,2026-11-11_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 bulkscore=0 impostorscore=0 adultscore=0 clxscore=1015
 spamscore=0 lowpriorityscore=0 malwarescore=0 phishscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611140004

Some Qualcomm platforms require the interconnect bandwidth constraints
to be set before enabling the interconnect clocks, otherwise some
clocks get stuck in the off state.

Move the icc_set_bw() call before clk_bulk_prepare_enable() so the
bandwidth vote is in place first.

Signed-off-by: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
---
 drivers/pci/controller/dwc/pcie-qcom-ep.c | 36 +++++++++++++++----------------
 1 file changed, 18 insertions(+), 18 deletions(-)

diff --git a/drivers/pci/controller/dwc/pcie-qcom-ep.c b/drivers/pci/controller/dwc/pcie-qcom-ep.c
index 2d7ddf8d173f..a753d8870d10 100644
--- a/drivers/pci/controller/dwc/pcie-qcom-ep.c
+++ b/drivers/pci/controller/dwc/pcie-qcom-ep.c
@@ -332,9 +332,23 @@ static int qcom_pcie_enable_resources(struct qcom_pcie_ep *pcie_ep)
 	struct dw_pcie *pci = &pcie_ep->pci;
 	int ret;
 
+	/*
+	 * Some Qualcomm platforms require interconnect bandwidth constraints
+	 * to be set before enabling interconnect clocks.
+	 *
+	 * Set an initial peak bandwidth corresponding to single-lane Gen 1
+	 * for the pcie-mem path.
+	 */
+	ret = icc_set_bw(pcie_ep->icc_mem, 0, QCOM_PCIE_LINK_SPEED_TO_BW(1));
+	if (ret) {
+		dev_err(pci->dev, "failed to set interconnect bandwidth: %d\n",
+			ret);
+		return ret;
+	}
+
 	ret = clk_bulk_prepare_enable(pcie_ep->num_clks, pcie_ep->clks);
 	if (ret)
-		return ret;
+		goto err_disable_icc;
 
 	ret = qcom_pcie_ep_core_reset(pcie_ep);
 	if (ret)
@@ -352,28 +366,14 @@ static int qcom_pcie_enable_resources(struct qcom_pcie_ep *pcie_ep)
 	if (ret)
 		goto err_phy_exit;
 
-	/*
-	 * Some Qualcomm platforms require interconnect bandwidth constraints
-	 * to be set before enabling interconnect clocks.
-	 *
-	 * Set an initial peak bandwidth corresponding to single-lane Gen 1
-	 * for the pcie-mem path.
-	 */
-	ret = icc_set_bw(pcie_ep->icc_mem, 0, QCOM_PCIE_LINK_SPEED_TO_BW(1));
-	if (ret) {
-		dev_err(pci->dev, "failed to set interconnect bandwidth: %d\n",
-			ret);
-		goto err_phy_off;
-	}
-
 	return 0;
 
-err_phy_off:
-	phy_power_off(pcie_ep->phy);
 err_phy_exit:
 	phy_exit(pcie_ep->phy);
 err_disable_clk:
 	clk_bulk_disable_unprepare(pcie_ep->num_clks, pcie_ep->clks);
+err_disable_icc:
+	icc_set_bw(pcie_ep->icc_mem, 0, 0);
 
 	return ret;
 }
@@ -388,10 +388,10 @@ static void qcom_pcie_disable_resources(struct qcom_pcie_ep *pcie_ep)
 	if (pcie_ep->cfg && pcie_ep->cfg->firmware_managed)
 		return;
 
-	icc_set_bw(pcie_ep->icc_mem, 0, 0);
 	phy_power_off(pcie_ep->phy);
 	phy_exit(pcie_ep->phy);
 	clk_bulk_disable_unprepare(pcie_ep->num_clks, pcie_ep->clks);
+	icc_set_bw(pcie_ep->icc_mem, 0, 0);
 }
 
 static int qcom_pcie_perst_deassert(struct dw_pcie *pci)

-- 
2.34.1

