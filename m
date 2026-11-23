Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795467365;
	b=FZghvwfkqAv6dOYr8A5vg1gFerIX8coG2o4r78LasootTtEfDMRpTZUyPdfluglele/R
	 bWG0mHEr6Zh7TJgKnwJhpXaNiGuSjnK72XpYvfEMuacL8zyw7e+cXYvx8qPksGa+aQ+6/
	 DyFTwyPoRiSUrmaQQLgG/ZgaY3qZc6yJE0YRDiadTIXZxUAnKin9qnlWEKjFxLSPEJar9
	 44BXcuPepOXE3Dsg1htWwrmL6q7EZIK+wT2FOzodzfiUTl3WTy/5xcjqHP9rtPbTypK7u
	 sn6SX5H7r/dFeZ1AJn2U2EBJZzoOdDdURu+3EzOvmk5+lVunYktKpbrwWbuCn8M6b+Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795467365;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Spam-Details-Enc:
	 X-Authority-Analysis:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=3B0sddGns6tpiivmvUnZfvXMbFjv4i9fbfRQRV48XlE=;
	b=zd7Sp6vVHBl/x1a6NCZqnzKU0/HsxRhSQtS1omAEDpbqAfg+KxjsaGvFe/LgLK8nYWMe
	 W1rz39fFR89LVpbdv4R4YKeO47WcMPTrqfPqqIc+VA2c90R6UBmUelKn6EteK0NgK2VSA
	 t4RNT3xS3Ndxy0uD4hsJ5oKauhnUQsU6OhCy5O07uhveESN5Gh8lvuhKU6YNKF+y1PuNC
	 lhcRD1pQYCqu9mbN8g0MJICUNXvOBd7cdQ/SYpVu0NWpwanmUDJ9WzxHoQnNEtToPwFGL
	 IHXFXpsU5V8YTEMlUylQcYZbAtF6VhenkGg3XoCPdlfmk60JUoZPHlt07MQPCHSSCTw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=jSvXuoSO;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=j3MwRn5L;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7234C606A32E
	for <devicetree@vger.kernel.org>; Mon, 23 Nov 2026 20:56:05 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7234C606A32E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=jSvXuoSO;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=j3MwRn5L
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6ANJuYKK1579777
	for <devicetree@vger.kernel.org>; Mon, 23 Nov 2026 20:56:04 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	3B0sddGns6tpiivmvUnZfvXMbFjv4i9fbfRQRV48XlE=; b=jSvXuoSOUp29r3YP
	UGRAlBHjsoytB7EKyciLou6y6Ceo1/+Vr6tOBvCHevzLQ1PYMCTqYotBKpz/hTXU
	mYpoceh776OjlZHBSmpiCxE0773FZS7pKC3c8cNPBP5fIBaMeEX9KGvp5VevBcf2
	Y/x1AyvfPZqBGS+VTHtSginFptiCkGyOeibs4hRRDuHpU8KzkqhzGl0Y7xN4J6t9
	jnYN9Y8Z0PlGpS/4E+SKkQ1QLLH8MVol1fY0s/ApF0zATZtWPt0KLHFmUbW6yvoR
	cSavC3wKzwPcKJwOwVdZ00SNAEbvhBZkcHz2ca+f7+We3st0L66nyhsCLBHmshNS
	l+ozgA==
Received: from mail-dl1-f69.google.com (mail-dl1-f69.google.com [74.125.82.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j4ma0tbs7-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 23 Nov 2026 20:56:04 +0000 (GMT)
Received: by mail-dl1-f69.google.com with SMTP id a92af1059eb24-1b3b63b9665so2891095c88.1
        for <devicetree@vger.kernel.org>; Mon, 23 Nov 2026 12:56:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795467364; x=1796072164; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=3B0sddGns6tpiivmvUnZfvXMbFjv4i9fbfRQRV48XlE=;
        b=j3MwRn5LXavpEvkUQoKaNkNGPR7CAlr00zMATQ708aeyeBL3pmg57ttO5pcGQNG3if
         vliX8vLl/bcYH//QMkEscw02SOZ/enZl3XAOIVdRCK8/pgxM49PTNAHUHXRX7Uuu1DjB
         FryEj9cGqCtw4F9VbvZ6NMq9TvICAQTDo+zE6i9AW6dNjBuljf85gnwf/yHn5Je15sAv
         CdCzL0VMf4xGWrBLaJKxWP+GCFPwyDazSeKFhyZ4VlGiwQGyeFUekK8b+VNx4clt/ggA
         M8Xsvi6Gt0nykj/KqRVsZTavJSeLcnbx4gkEEkTNQHjOv/IyRLeeZoOf4LcKBqVoFej4
         djmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795467364; x=1796072164;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=3B0sddGns6tpiivmvUnZfvXMbFjv4i9fbfRQRV48XlE=;
        b=deE82N7aLXRo639n0w5gwVT80d7nju/nBdbPr8GBW7HKMVtZVy2IEgbiWuML19hLjc
         P7vMOuo4lhQvpUoNgasBYXcszEve9BucF/3otbpQEMMBQcb1JUTISAfFwJ+o112xz4fh
         FKfGI2c6UBAdomdT37XVS9ot+j1sEesxiJ9kWkIy7fEz5Fg4Nl44rVoHa8jg+KY06hvK
         iSaWkJtvk1GaO7UtTN9Vc66r7irsXFgRQnGTaZfyWj/GbTdSLdHtUym+mJwU5WQDKg7f
         epRkGHhyHYwT8wjDL+AA8iyjCVbx4n/anBQUw6zWMn2Rbvrsdf1Jf1BmlOIxMkmgYX1U
         Fqog==
X-Forwarded-Encrypted: i=1; AL+hErH+sMi70rz78IfFFecWy7PQNe94Ltzyjxhh67D985Wei/wqBwmXdojRaTxx/ycYWMCJG0tp7Yu0X7LA@vger.kernel.org
X-Gm-Message-State: APuU4Z/PPWnjUJCyNOUUV7Vegq649T3pPvsU5xPxzQYXHk3X94WZl36y
	m4DAGHJyQYoVdZ+NTHUpHTWvw5cp/BmehvHqn4wIDpO7qqbQxtWj+vZ0EhCh5SRs1B5fv0fgSWq
	qAfXG+JQB+uRBnzbRJusbN0zUA0IrCkGw52zeSo/GKY2HRdmkIkNgIfqZPekdh1YA
X-Gm-Gg: AZFdTZctW4EzmvvBXWgZ3yS7CeiotHGHtt46Whv+hHiZagyRH3mVeaVybnqHX9GEDcP
	rHrlset83B9b4qBczyJ3te/Q9LWaa9L7gyGADg/gm3cAjWlYyOKnBTrrflBGigny0/tkNnpa2+w
	I6tRkBlD892cVSCMaqG+kAv8cO7kYYhHriQo+uFT5ifwSZGImHTakBpm/8k9PU9jH1P7q8Gw7X5
	MKNcllc7+gGfdENIr/7dKMviD2Ugeft2NbftNJ8ydXEtZjdf5PF57Gqe48VcsODCHuoYqGSUFi3
	M+tuKdhoTS9lvvTQ2FLtlQOHgJCKpFp3BP9pERr1lgtcPCNUFyUbk7YFe0hZltyu9+7P0cadQ6D
	AMC9DweE5NbNu9p38JvSfQSkOuDz5QO2Wa7YPNk3ZjRxbkk+jhBDALqoZyPy1hZ0DA3FiOQ7tgU
	sZ5mFPm50k
X-Received: by 2002:a05:701b:2091:10b0:1b2:366a:e7d1 with SMTP id a92af1059eb24-1b556912a4bmr14463349c88.32.1795467363953;
        Mon, 23 Nov 2026 12:56:03 -0800 (PST)
X-Received: by 2002:a05:701b:2091:10b0:1b2:366a:e7d1 with SMTP id a92af1059eb24-1b556912a4bmr14463318c88.32.1795467363407;
        Mon, 23 Nov 2026 12:56:03 -0800 (PST)
Received: from hu-manafm-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-38567cafec4sm44209077eec.26.2026.11.23.12.55.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Nov 2026 12:56:03 -0800 (PST)
From: Manaf Meethalavalappu Pallikunhi <manaf.pallikunhi@oss.qualcomm.com>
Date: Tue, 24 Nov 2026 02:24:49 +0530
Subject: [PATCH v5 09/12] arm64: dts: qcom: pmh0101: Enable BCL sensor node
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
Message-Id: <20261124-qcom-bcl-hwmon-v5-9-747d5383d538@oss.qualcomm.com>
References: <20261124-qcom-bcl-hwmon-v5-0-747d5383d538@oss.qualcomm.com>
In-Reply-To: <20261124-qcom-bcl-hwmon-v5-0-747d5383d538@oss.qualcomm.com>
To: Guenter Roeck <linux@roeck-us.net>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Lee Jones <lee@kernel.org>,
        Stephen Boyd <sboyd@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Daniel Lezcano <daniel.lezcano@oss.qualcomm.com>,
        Abel Vesa <abelvesa@kernel.org>, Jonathan Corbet <corbet@lwn.net>,
        Shuah Khan <skhan@linuxfoundation.org>,
        Randy Dunlap <rdunlap@infradead.org>
Cc: linux-hwmon@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        mfd@lists.linux.dev, linux-doc@vger.kernel.org,
        Manaf Meethalavalappu Pallikunhi <manaf.pallikunhi@oss.qualcomm.com>,
        Abel Vesa <abel.vesa@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795467299; l=1260;
 i=manaf.pallikunhi@oss.qualcomm.com; s=20260206; h=from:subject:message-id;
 bh=L6nSizHG/y+HmrSiyaptHCLW4K4aN1EFqVoX6vPricw=;
 b=WBO0DXaIYcrZfed6MtS/D0ti+xN8r+XNBuwf+df2d8oFiTs220C7lXXMY9zB482qMtmxdWwxd
 Snsqm69g5abDtBFFihGQduCh2F/DMNTqnj2OanknbZ+y+u2i4FRVODH
X-Developer-Key: i=manaf.pallikunhi@oss.qualcomm.com; a=ed25519;
 pk=oZ3x9jh+FDyPwxHmCbyzEMQHMzKqrH6hUbbL7dEBe2g=
X-Proofpoint-GUID: rgE7yD05OJWYPOvsiIaclPTslaESv29e
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTIzMDA4MyBTYWx0ZWRfX2dTFrUZzxmp+
 WfWXGArujHomHDeiV5zlZOjnEmxZ1XEVG38BbXYDgWDbG5SFn/ifPwc4oEAaM4a3CAxvs8r4ROr
 Az6A+8PVfZbJcKILfCr7lv2e4pM+QUk=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTIzMDA4MyBTYWx0ZWRfX1xGjh2IvoKpL
 YRnlMWEZOaqUVyb2zM8o8MEdQRHdO6t1WkVRURYwOTbZEf6Ca3NphD2mvMUh8o0ekqlyo+nopiu
 /w7jThiS17y/gfv92yxP2wbmX1IqHyMSUs4v3WxJ++kHSt9IHd5J2CT7Mmy+ZqAKKfTs0XKEF/e
 hB+DC21lBslR+4ljcfTP9LAUCie3/vXwdRezFYDPro9Ov3tN1OXLKheyo8WVqO4biRcTxWLk1tQ
 sxf+O2TPi8XRYc8Hdn8Y6LxvtgeqYWQ1+aqCkk3tLyGgalOtRzIz/L2wYQzU9IvkR5+W7rUEc/Z
 qw6bf4n4ZNjPe+M3RGEA7Gr5FW7Vh4ubYXw3+08sxwY42bPgsZxB4XsXLvoPg/BbD8QDYzcTI8t
 orYbXNdc3NQU8NsOZJjWyfDvQlK1P0bSifNhCcQUq0vjXIe8kGRmQ+yt1LV4jNsg1f8uEUpli4f
 n3EJkQDyLx98TuPMemg==
X-Authority-Analysis: v=2.4 cv=Yr+a1IYX c=1 sm=1 tr=0 ts=6b04a864 cx=c_pps
 a=kVLUcbK0zfr7ocalXnG1qA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=EUspDBNiAAAA:8 a=C1EnqVrfhtXmwaaqmQIA:9 a=QEXdDO2ut3YA:10
 a=vr4QvYf-bLy2KjpDp97w:22
X-Proofpoint-ORIG-GUID: rgE7yD05OJWYPOvsiIaclPTslaESv29e
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-23_05,2026-11-23_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 adultscore=0 impostorscore=0 malwarescore=0 suspectscore=0
 clxscore=1015 phishscore=0 spamscore=0 priorityscore=1501 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611230083

Add Battery Current Limiting (BCL) hardware monitor node for pmh0101
PMIC. The BCL monitors battery voltage and current, providing hardware
interrupts when configurable thresholds are violated.

Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Signed-off-by: Manaf Meethalavalappu Pallikunhi <manaf.pallikunhi@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/pmh0101.dtsi | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/pmh0101.dtsi b/arch/arm64/boot/dts/qcom/pmh0101.dtsi
index b1ec41325958..5635ed350f38 100644
--- a/arch/arm64/boot/dts/qcom/pmh0101.dtsi
+++ b/arch/arm64/boot/dts/qcom/pmh0101.dtsi
@@ -43,6 +43,17 @@ pmh0101_temp_alarm: temp-alarm@a00 {
 			#thermal-sensor-cells = <0>;
 		};
 
+		sensor@4700 {
+			compatible = "qcom,pmh0101-bcl";
+			reg = <0x4700>;
+			interrupts = <0x1 0x47 0x0 IRQ_TYPE_EDGE_RISING>,
+				     <0x1 0x47 0x1 IRQ_TYPE_EDGE_RISING>,
+				     <0x1 0x47 0x2 IRQ_TYPE_EDGE_RISING>;
+			interrupt-names = "max-min",
+					  "critical",
+					  "emergency";
+		};
+
 		pmh0101_gpios: gpio@8800 {
 			compatible = "qcom,pmh0101-gpio", "qcom,spmi-gpio";
 			reg = <0x8800>;

-- 
2.43.0

