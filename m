Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A5C8A361965
	for <devicetree@vger.kernel.org>; Mon, 19 Oct 2026 02:16:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792376164; cv=none; b=QkbQMp/pqBqw1PYgNoaYBjtTFZ8oCjItN7hxuQGM4yZ/pJ5YMG/sCBizkfMG/Au7LJ3f9BDDpbo02//Ast4yrVLRKNEGbttjYLIMYuHk9SVmLvVqLLq7srLZy9YhpB8DLy0QSmOug63NkL9XC/OsFWcBoW2LbnQ2rN5kh0EfplY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792376164; c=relaxed/simple;
	bh=9iNBNzF/O/OCk2M+YkQl3DeLvr7QYK389Mps3ejvZS8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=k0TVpQQgE3ebzYr+8jLVEJjxx3qpHsjJ0Vq9d+QCu3adnylSWdQTPzF5M91WJlSlPr73qKKhTqu0zgdnkuaQBgF17uino0vYS5tn/A9420z7nx1XFQxN7YNrgmwoAHjiuwKLLNEfVa1qpznez7gk3dge6C0xFnL7Fi/MYCsBz6g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=BtyK6OcW; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=BQBknROB; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="BtyK6OcW";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="BQBknROB"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69J1FQAf1825567
	for <devicetree@vger.kernel.org>; Mon, 19 Oct 2026 02:16:01 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=pK/JsYFhvVy
	JWwuTEf3AYzE8dP57u1HvP32VitU3Qbw=; b=BtyK6OcW01M8S9FK+Dk4B0rDAkg
	eS5oQ42XLhj1Egh8XUaDLjj5JU+W5i3EIKbXlCdoliX34dB3rUpLIUi3WKm/696W
	5ypMYYoD778qTZfWfLq/+7ktjsWQoUr9hakqaOQrwEAiEI7tIYQiwbR/fEb6IIFz
	siY9IFBefwLraYCi3qwKpPizlA3O67yeMclN5YTzGNEnJC2mkCNFhkjIDTUuxn/W
	9DQtkR6QkKK5zUcn4Ost8x9mw06WXx9P5JFIaSrNSkVqqKJhs4utfgvQinCb4JQh
	DJrg19bUZNeKJO++HdDqf/mQX9UzhMtn7jGpP0f9Q2MzzY+bqWe4xlEsWUA==
Received: from mail-dy1-f197.google.com (mail-dy1-f197.google.com [74.125.82.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hc0kxmhw7-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 19 Oct 2026 02:16:01 +0000 (GMT)
Received: by mail-dy1-f197.google.com with SMTP id 5a478bee46e88-3548cdfd2fbso2581367eec.1
        for <devicetree@vger.kernel.org>; Sun, 18 Oct 2026 19:16:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792376160; x=1792980960; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=pK/JsYFhvVyJWwuTEf3AYzE8dP57u1HvP32VitU3Qbw=;
        b=BQBknROBNI0/ar/t0mCc9t5PulC2X1BzpgjDZWeyhysl7KXtFF3y7WtiL3TxKyVh6z
         4/EwT7ULI+9Kwy1i24VLbPzTl4bUnZvgSPxpsOz7FvFcx23MreH0Vj2BVPCOtZrpmUkq
         lpixd+3RrnOFSRafZpVDHA2LtuWtEpBFGsV7+7RIvAX/EEZYJ1mrAiJ0f2yCWpj0sP2u
         dvfwq/m9zoe3rlt1yP7eH/ZaVG8WfACraJGtq53pCTEnuZQHcfF+j0cNPpFUHxPnQAZr
         NjQ3z4X7AaTurrCYdbmzMsS9RN63Iqn1TZ6kSG5puyiME1ENtwSLrxxcesbwXkvko3tj
         0MwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792376160; x=1792980960;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=pK/JsYFhvVyJWwuTEf3AYzE8dP57u1HvP32VitU3Qbw=;
        b=Q14W/LRVG0xr0bOl4MB8vWM7BW16b5VzqDfq+2qJ6OytgboEEYTqbRm4BT+ly2Hwqe
         wzFbyI5IfNOQinH0qrKgu12vBAfQ8OnnMmEUfgSWGusS2cDLY1ZxBkdwYW6UICYtC28V
         xR/fvhGnWAMJl3cANYd4dJ1ifN5RhwM0uFQsLzopE0kc1hn48my7HY5PCu7T/glI4EQO
         ynhmpLUSYQ1Sr61/YjpKHqin/zYOstC87/omRKEdL25vN+QpOCD6xws4bDS3N6yoABK4
         YZXWwsMIKuQdxoO5jRGFh6XV6TpscVJ7JvUkArkkFaPGnovx7fTWs0S2K1NfX/difW5G
         KftA==
X-Forwarded-Encrypted: i=1; AKwUvBxAhByVKiCuuJF1FtqLkO5MPeo7JYz2Dp3ru/FWEbxla8PPLc8Us7+pIveMznk2mAT62U+XWUiISpPr@vger.kernel.org
X-Gm-Message-State: AFq9FYIkWaR0cOQwY03+pC91Jdafg+JpZaiH5HN65Ui7g3uIik3RgJ5m
	ExZ3I2smsrC4JYpSXpnBu7Ip/f/IzP2Fk738SlR+5MYCY+PiqHzQpaCL1Ev+3qcdX0shFwIywUS
	2uhgNZ5m8VibP7qwiuxjsklEurckQ79bpBFRZ/QNbNALDbmqjUQk257YUwe9bnoLrF0TJFAvY
X-Gm-Gg: AYBFou1YVhHmgwnnPNc3WUEDlsOH4pVBEpaxgv3f9os1AXyCcXB34MbAWvONV72yC7T
	F5q/oguMj479u4oHsH4+5JdwPk0yx4kVV0b0S4hxo2xuMx9znbPytJBukR7/gj2d6CiaAExr48m
	m6rHLD2AlQ3SZdR69m7LCkBHm7wMxBgczNbP3aujW08c6va2jEQfHAubLC8pWktBcBXB6xznKF5
	dEILs+Iwz54JZhE4iwOi6LvXL8Bp77drddh/dIa51z77NtKFmMwUU0k6y4OCxucxzr47vR44MDo
	d9DyfZOwLFUy1UxBz5FDX5s8aeKqq8suTmeATHUjNYBdIichsPHteoGvu8NlBzi3NYblDA+lw1h
	xDb8m3BbPKAAVGgg2DeO+fdjxH/ubqqfZqkhFTOZQmZ5beKUzkg==
X-Received: by 2002:a05:7301:2d2d:b0:35c:89df:812e with SMTP id 5a478bee46e88-361a302a214mr9428309eec.34.1792376160409;
        Sun, 18 Oct 2026 19:16:00 -0700 (PDT)
X-Received: by 2002:a05:7301:2d2d:b0:35c:89df:812e with SMTP id 5a478bee46e88-361a302a214mr9428252eec.34.1792376159644;
        Sun, 18 Oct 2026 19:15:59 -0700 (PDT)
Received: from hu-petche-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3607ee0cab0sm33841550eec.3.2026.10.18.19.15.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 18 Oct 2026 19:15:58 -0700 (PDT)
From: Peter Chen <peter.chen@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Abel Vesa <abel.vesa@oss.qualcomm.com>,
        Wesley Cheng <wesley.cheng@oss.qualcomm.com>,
        Udipto Goswami <udipto.goswami@oss.qualcomm.com>,
        Jack Pham <jack.pham@oss.qualcomm.com>,
        Pratham Pratap <pratham.pratap@oss.qualcomm.com>,
        Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>,
        Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org,
        Peter Chen <peter.chen@oss.qualcomm.com>
Subject: [PATCH v2 3/4] arm64: dts: qcom: kaanapali: Set snps,resume-hs-terminations for USB controller
Date: Sun, 18 Oct 2026 19:15:46 -0700
Message-ID: <20261019021547.1694088-4-peter.chen@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261019021547.1694088-1-peter.chen@oss.qualcomm.com>
References: <20261019021547.1694088-1-peter.chen@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDE5MDAwOCBTYWx0ZWRfXzB6vh5JknvT/
 wf8rovSjTKakXqWvoBturujSP2X50yf65Ufm1eEl2DhdGYNOzsiKsYBAOsyfqtaLSk+pB8ullY5
 Q1oWrp5dOynkpoRij05zfrwYQ4O4Q9A=
X-Authority-Analysis: v=2.4 cv=JpZkP84C c=1 sm=1 tr=0 ts=6ad57d61 cx=c_pps
 a=Uww141gWH0fZj/3QKPojxA==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22 a=EUspDBNiAAAA:8
 a=_PA-CDJEJREJmSlHXOMA:9 a=PxkB5W3o20Ba91AHUih5:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDE5MDAwOCBTYWx0ZWRfX1SNWzZApNtHP
 SHsyg+ZC/Tt3u72v1CXFqyThc08QAT+9m89RSikkXKmZlmzgAtK/gGdhl6Dq1NubsbDAUG54iF7
 my7tyqvwx+cUPUycVHqCnlX+duJMQ0Z5khNz0D4E0TG0V5VfHEbIAqj33lL35HeVmNcwS+uI5IW
 J/xwLypX6w2dymgz0xvzCPF72CBOT0LNM9fMr0Zm57NFd/A2qL0L4+F+Mk9CewoERcqUxEb4QCp
 /UwqFhMoRc9Suv1geWTekDFRUaW5EKvAhKclp3Zn/WvbPp23Nhj5UcCL9KUzSLQOwZPmdIWqxxR
 VnOQZoJN8fpKgpQu0O7WS8JwWSVDzXMmOhaiSFmmHAilY07XXAslPK2C20gLjjO3gb/V0wxa+nF
 c9yHqCyS6TSqYrR1rZl/r8aoY0kbGk41hYWNDZ/KeDbtkZyTUceLo6J0kKMa4jnpiXOlCNHItaT
 xv7IK0vFElo5iGqKi3A==
X-Proofpoint-ORIG-GUID: xckSJteKS8WSo5G-RC8Xdn4C3IdTOPHM
X-Proofpoint-GUID: xckSJteKS8WSo5G-RC8Xdn4C3IdTOPHM
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-19_01,2026-10-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 spamscore=0 phishscore=0 suspectscore=0 malwarescore=0
 clxscore=1015 impostorscore=0 lowpriorityscore=0 bulkscore=0
 priorityscore=1501 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610080000
 definitions=main-2610190008

The DWC3 controller on Kaanapali is paired with the M31 eUSB2 PHY.
According to HPG, host-mode USB2 L2/L1 resume with this PHY, GUCTL1[10]
(RESUME_OPMODE_HS_HOST) must be set.

Set snps,resume-hs-terminations on the Kaanapali USB controller. This makes
dwc3 core set GUCTL1[10].

Fixes: 3d395de80a46 ("arm64: dts: qcom: kaanapali: Add USB support for Kaanapali SoC")
Assisted-by: Claude:claude-opus-5-5
Signed-off-by: Peter Chen <peter.chen@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/kaanapali.dtsi | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/boot/dts/qcom/kaanapali.dtsi b/arch/arm64/boot/dts/qcom/kaanapali.dtsi
index bd51cd3b70c7..60c6c2c09bcf 100644
--- a/arch/arm64/boot/dts/qcom/kaanapali.dtsi
+++ b/arch/arm64/boot/dts/qcom/kaanapali.dtsi
@@ -4347,6 +4347,7 @@ &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>,
 			snps,usb3_lpm_capable;
 			snps,usb2-lpm-disable;
 			snps,has-lpm-erratum;
+			snps,resume-hs-terminations;
 			tx-fifo-resize;
 			dma-coherent;
 
-- 
2.43.0

