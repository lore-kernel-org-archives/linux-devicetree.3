Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792549884;
	b=ZjdmW2p6Ezek4AIFhfbmIQvEzO37Fe4y6zFxDqyKTw963GRtqeKa+MCiX1/s8ZdEa6ZZ
	 JIjXu2d4LtPbuCAXpNEwxXyW1whaytBP/ww9iqxideQ/19UIrJ4yspUDRYDU/5k/2bYHO
	 /VJ7KvqTZAR1CfxP5gJW+O+bJhi4/59vaVaAAyXYSFtfN0tvS02RPW3odwJy3H7q84t6U
	 e9cyr6NnvUANnqTCkqqx524z3A3wUk+Us3bX/TY7fMZ5YsKYhBqf1Ke5zZrBlu8mR8g2B
	 GGRJl2iGEmbKBmndpdHRzsLREP9QHJwoAdCLl1P/uCdrlaIRCfljlWk3ncG0WtTVeDQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792549884;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:To:Cc:
	 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-Authority-Analysis:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-GUID:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=saQOMBXSCEtK+IXlca1nlW/5mPlZ0IBZFAsLGkEy3l0=;
	b=gGXgoG4rYwPKo4jUsxiDvGLSvBOLiyuDRXIFPqYyCQlroLeX2N6IFrWB9aiuaWc9C60O
	 qk6YoTtjej3F4MNf5F5Ozy4mF4Us2M3AulJMJ98o/xU52j8iZ1Fu1dpKf60C4oLWO5IVf
	 KlSy2BkG87IoQLPa7vSviiYSX+gYRHZ/FWTxNPgGGA+JD7P7qFaz5E9EH94Ez6we2VxMH
	 nth0y9+UxkvVe3wDE7lTdaHZEHe2sSFVkoBUOnWSm6oIR6KvEnHtlZt8z2Asz6JqV7lUt
	 24AYSNPxv0DmzhJy1DMPDUrjaIqeEJQo0ZRFN9frNxzlrxlCWnDTRFRVB7r9Mw3rSHg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=MK1kRLoE;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=GKfXLG74;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C1AC1606A328
	for <devicetree@vger.kernel.org>; Wed, 21 Oct 2026 02:31:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C1AC1606A328
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=MK1kRLoE;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=GKfXLG74
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69L2FCJt3116359
	for <devicetree@vger.kernel.org>; Wed, 21 Oct 2026 02:31:21 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=saQOMBXSCEt
	K+IXlca1nlW/5mPlZ0IBZFAsLGkEy3l0=; b=MK1kRLoEHPf3kVJEjDSlbEodmAi
	EzPFRJk630tWP751H8rJ1wXu+hTqJOH9DirqlK2RW8+Redln8q4oSwRExmFyOY2j
	n3cmnwoZmHuEIGwkytlhxM2l2+sJzNPrd1142VjPZNSe+eaiXDaogtnD7gfNc0dO
	tOfSExYuw7n5uc9Bqwoqhmn4pCLtsFxZdBECVAl8sungyt4gR21LoCJ+I8ZTmGE3
	tDaI4l/nvpcTDh2V0GNyWtx2YLqQpZ0WNAltqfVuTqrzlC/ZJ40VWluqiLHTqdsl
	MyX+9vY52aAK/IrLA9rZmaRi9EELylGyor5uRxQtQOQBwi0Kr0S467s6HLQ==
Received: from mail-dl1-f70.google.com (mail-dl1-f70.google.com [74.125.82.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hed9hsjka-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 21 Oct 2026 02:31:21 +0000 (GMT)
Received: by mail-dl1-f70.google.com with SMTP id a92af1059eb24-18eb2616974so390581c88.1
        for <devicetree@vger.kernel.org>; Tue, 20 Oct 2026 19:31:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792549880; x=1793154680; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=saQOMBXSCEtK+IXlca1nlW/5mPlZ0IBZFAsLGkEy3l0=;
        b=GKfXLG7482SvgylpirL2QVNIEIhPic1Fji1jPf60HfcQn+BL/7GCfgLOkLLIKnZyij
         MJqCGyXs5gmSPocdXUy0sZ15OSwgbOU21d2nmD7+TcT7KCRDM9JFQI5/A5RMswC3FDDv
         LP8t/Y2VvdxmIz+rav2aiPVa8G1kdPkhQky77GvGiOR+2hyfsBDBTPjyhoywsnGx9IUQ
         3QrC2Gp3b5elsG9h5jD0PJtUHPsPjAlv6NOksd5xx5ztCjwvhDZkmgkVGAjSxaTngz31
         a2zs0XNqgpTzhtGd1eREt9Hl80Bq7eGi24XkpHcwfpYD5qEMz9WVDMokH/FL/wcVC2or
         70NA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792549880; x=1793154680;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=saQOMBXSCEtK+IXlca1nlW/5mPlZ0IBZFAsLGkEy3l0=;
        b=1TTdFZpNqLercuJTsAd8EWMkUfDOheoES4rvj/tkrGv+j4KIIU9Zae79Ah0CbHu6lF
         bmVS/s/yHsxUUDUs3kQjvVvqNt0viOX8mjD7ZtLreUwWIg6ugQTJ4T+KNd0PekqCrEeo
         3R1Z1tTrvehLxEXkaOYiUZOQ8IyOiKRI6JqV1vrpl7SUqWT2oCOV1dqwMHnbQG/+dxw0
         QyFEacn40cY89VskJpigaNiV5F2Ah7ant/qq56R9M0xf6hqQNIDHKkjMZrAo7Hfi1JT6
         Z91IxEZlFLTjZeIFU4fU0CCe4oeRK/Ncths6LPPt5flQtmpBls8NVnLwhGCwXhVKU/zK
         wUvg==
X-Forwarded-Encrypted: i=1; AKwUvBxp7t7BJXoK3pI0cmxEyQ+w5W3ADgtZc3y+E0KOeAIWoiqnkfKTqc2ebVGY8QD35xMSFM7ax1y4CoGZ@vger.kernel.org
X-Gm-Message-State: AFq9FYKxLxLHi/07mhzDye62qA3svB6MUtGU1siEx7Tph/fVId9sfC2n
	0fXW01a4ZhhHo1ErRFEf1pZ9W/VFha/OyZkpZ1HDOLPQxtN48b4BvpGkmLbfKqHs1yZ+PITcZ4Z
	rXXMwhH7hsUQgjnMIa+tMw3fNrD2wlDteWPqOluRb58hSzj6Sk6F9J8qyY/NIawt1
X-Gm-Gg: AYBFou2Ahzi0w/jHkScQMml+iwgXf6k7JvYrPUYAxe/v0Z7Is3NXtVR32Th5tEX8d4S
	VSNhiWD5P+sjuF8ngXB1YON6DMBa1eBwGO+KjGm5L1YQpz8LQpuU2H3sozxJDirMOvvqZpQB6Zs
	aUX7qLXCDC5UsDFOB3w3aA7it9FIZBFaS2S+HuZK2vTXhljVdtdIIdK0pAFROJxo9fzSzMfK7r9
	ADCMoJ8SGQcx09J/8hQVADarzx3OeAL0JMdf+H2YUO5LnntQbSG4vlqYg9A88Ii/2feWHTCSpww
	ijhLpUtFqFvXevWiyBIZw4Se3nHW+NwpsbgwDyYRHmZqx1YmOh4uvh5QHJXb6TLAHRSteAw+QQ0
	0VgwokZjl+Swrw8WL0m7uibaiYbL2rWctGiTyEJl4CparpC1ZNG0VcigfVxg=
X-Received: by 2002:a05:7022:4589:b0:141:4a06:ad6f with SMTP id a92af1059eb24-190a465c25bmr1405331c88.8.1792549880430;
        Tue, 20 Oct 2026 19:31:20 -0700 (PDT)
X-Received: by 2002:a05:7022:4589:b0:141:4a06:ad6f with SMTP id a92af1059eb24-190a465c25bmr1405273c88.8.1792549879845;
        Tue, 20 Oct 2026 19:31:19 -0700 (PDT)
Received: from QCOM-aGQu4IUr3Y.qualcomm.com (i-global052.qualcomm.com. [199.106.103.52])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1903e02901fsm2395108c88.22.2026.10.20.19.31.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 Oct 2026 19:31:19 -0700 (PDT)
From: Shawn Guo <shengchao.guo@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>
Cc: Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>,
        Yu Zhang <yu.zhang@oss.qualcomm.com>,
        Shuai Zhang <shuai.zhang@oss.qualcomm.com>, devicetree@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Abel Vesa <abel.vesa@oss.qualcomm.com>,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
        Shawn Guo <shengchao.guo@oss.qualcomm.com>
Subject: [PATCH RFC v3 2/5] arm64: dts: qcom: nord-rrd: Enable PCIe controllers and PHY
Date: Wed, 21 Oct 2026 10:29:17 +0800
Message-ID: <20261021022921.2053957-3-shengchao.guo@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261021022921.2053957-1-shengchao.guo@oss.qualcomm.com>
References: <20261021022921.2053957-1-shengchao.guo@oss.qualcomm.com>
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=YuKa1IYX c=1 sm=1 tr=0 ts=6ad823f9 cx=c_pps
 a=SvEPeNj+VMjHSW//kvnxuw==:117 a=b9+bayejhc3NMeqCNyeLQQ==:17
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22 a=EUspDBNiAAAA:8
 a=f6-OUQb2phOXiqkgZ7QA:9 a=Kq8ClHjjuc5pcCNDwlU0:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIxMDAwOSBTYWx0ZWRfX6UheqWGdt5sF
 0IqEI4szeomZ6Q9vmvdfaEbq4+prtphhosbGXl+NYtgGk3IqW3tSeLq8Ti3jiw3igCDwGRtPHA0
 MwQzL21lx6eHGN1qHkwm2NUeLFr6fTE=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIxMDAwOSBTYWx0ZWRfX2AF2vx529A/w
 Q9qdRdTqBt5OiBFQoqanx9kbqV40Y6VyXYKnp7NbR99DMIo9bIdKu3wo7lazHMK08BWMGwsXlvs
 8FA0q654xxXThLXPL5qa3X6V/q162pkd0/6R7JYgum5rzCwy+PKWIos3WA/VSq6cWJIpso0Wato
 549f3eSvfCqMfX/ToYTauxUtfkLpebCqHP9aY3RWCOF9QnQmvPFKbLd+v4gj++0Yst91O0vXgLO
 SBOmpoNlpZYJqoXTXQACyC0S6hiVOiy38elopXvMgXcRpuczkwOWra0WD4Xa/EBdPcf9AbexEDN
 bO4ow4FjnmwYCsQvrqd04zwj9vzEZGoe8/yogc7PEtE0U2sS7+GQ0rBY79YJwUMd0z3x5Xw3+nN
 hZuWUvs1eKrstksJwCQVXq6JXdQiLbbWswQvzJ0sjXKN4EQ+IZ09SiwDIEh5MAwKIVyhsopfJOX
 yU+9JQDWWCRXxD9Luxg==
X-Proofpoint-GUID: W_wtu7ri6pC5D5nejFh65qqPUFQz2rod
X-Proofpoint-ORIG-GUID: W_wtu7ri6pC5D5nejFh65qqPUFQz2rod
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-21_01,2026-10-19_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 impostorscore=0 suspectscore=0 spamscore=0 clxscore=1015
 phishscore=0 adultscore=0 bulkscore=0 malwarescore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610210009

From: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>

The Nord Robotics Reference Design board routes all four PCIe links, so
enable pcie0-pcie3 and the QMP PHY, supply the per-port PHY and PLL
rails, and describe the PERST# and WAKE# lines of each root port.

Signed-off-by: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
Reviewed-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Signed-off-by: Shawn Guo <shengchao.guo@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/nord-rrd.dts | 49 +++++++++++++++++++++++++++
 1 file changed, 49 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/nord-rrd.dts b/arch/arm64/boot/dts/qcom/nord-rrd.dts
index 47978df0af92..08e73be5857f 100644
--- a/arch/arm64/boot/dts/qcom/nord-rrd.dts
+++ b/arch/arm64/boot/dts/qcom/nord-rrd.dts
@@ -377,6 +377,55 @@ rtc@32 {
 	};
 };
 
+&pcie_phy {
+	vdda-phy-a-supply = <&vreg_l6a_1p2>;
+	vdda-phy-b-supply = <&vreg_l4a_1p2>;
+	vdda-phy-c-supply = <&vreg_l4a_1p2>;
+	vdda-phy-d-supply = <&vreg_l4a_1p2>;
+	vdda-pll-a-supply = <&vreg_l1e_0p9>;
+	vdda-pll-b-supply = <&vreg_l1e_0p9>;
+	vdda-pll-c-supply = <&vreg_l1e_0p9>;
+	vdda-pll-d-supply = <&vreg_l1e_0p9>;
+
+	status = "okay";
+};
+
+&pcie0 {
+	status = "okay";
+};
+
+&pcie0_port0 {
+	reset-gpios = <&tlmm 2 GPIO_ACTIVE_LOW>;
+	wake-gpios = <&tlmm 0 GPIO_ACTIVE_LOW>;
+};
+
+&pcie1 {
+	status = "okay";
+};
+
+&pcie1_port0 {
+	reset-gpios = <&tlmm 5 GPIO_ACTIVE_LOW>;
+	wake-gpios = <&tlmm 3 GPIO_ACTIVE_LOW>;
+};
+
+&pcie2 {
+	status = "okay";
+};
+
+&pcie2_port0 {
+	reset-gpios = <&tlmm 8 GPIO_ACTIVE_LOW>;
+	wake-gpios = <&tlmm 6 GPIO_ACTIVE_LOW>;
+};
+
+&pcie3 {
+	status = "okay";
+};
+
+&pcie3_port0 {
+	reset-gpios = <&tlmm 11 GPIO_ACTIVE_LOW>;
+	wake-gpios = <&tlmm 9 GPIO_ACTIVE_LOW>;
+};
+
 &qupv3_0 {
 	firmware-name = "qcom/nord/qupv3fw.elf";
 
-- 
2.43.0

