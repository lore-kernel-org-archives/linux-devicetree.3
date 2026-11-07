Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794074821;
	b=wTsUyKcN3jFtOHZyfQQJ7+wAb/k3SFqxFNY3XRskVaum87gpD6aA+tzN0gal9HctPiGC
	 KQ3ujVnfYQSpOFF6mSOYgOdljnVYZY3ylYpyPgp62WvZPgA9gKFeL5VG6nkQrz2/PRoFW
	 K9d4UlK/GRJgM5kPgVvo0Y8UsjxgrFbIW5KqGJl6gY2vw2BPtz6IWAcjPbbD76KyJWMJR
	 QjoJuMponpyRfOiBKZ6+8cXDWQvhZtyaf6PaCTmf0Z8dM2DQYVCkFuS8beGklDOMEDWS+
	 vppk3anqZ7XxGyNbfc7jFRX+Hc9zPkKwlStlNlsJ5KluN43qDF5jelWgIO9GmQHOanA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794074821;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Info:X-Authority-Analysis:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-GUID:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=2H5Ad90S0fkIwIHF31nqLKj0/QNXL/xbvdffpwYqAhE=;
	b=DFdrXxfS6vQFyxC3RtLmSTzspiB7RACrYeNvLSyaV5Y/U6SE0ZyMU13ZsMBtzueafBTC
	 rhHlsmiazxaOf8/vjRB3N5K5ZAqoo3DFr97DM7jWOp+U+3TFiUuar2tJbr+zPZQlatL/T
	 +NTORsqfhN3kwn6BfrmBds0oM/85cIM4zmjwLkwmNe9TKYZLK9x9/zeToqqJ3hhUdrhT8
	 xxCokNbhm/Le5djMVbeJLCi/uFyE5ACo0ObySuGDQvXHre2VzANqemB7AcSTTJB5AFTne
	 P01Fq/o+hnI1plygZY6R9C8zwn6Jco714N3IAM7PoLQaI+iWg6W5DBJgZWNGuc3msyA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=c+FXOOV4;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=YlVXrR18;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 03EBE606A331
	for <devicetree@vger.kernel.org>; Sat,  7 Nov 2026 18:07:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 03EBE606A331
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=c+FXOOV4;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=YlVXrR18
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A7HtVs2274702
	for <devicetree@vger.kernel.org>; Sat, 7 Nov 2026 18:07:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	2H5Ad90S0fkIwIHF31nqLKj0/QNXL/xbvdffpwYqAhE=; b=c+FXOOV4P8LCuKF8
	9DYVHgim+w3rFMHfQZByV6EWS4my2MLU79ycnaWLfTibNV4kZP6snIGgMcgficp3
	2OWyTSVCusxJScLN093/538olFGoYQj1QjEd/l9wyJNZeDXwvvD9Mf7RjDLSIEog
	BOMLEMwMPduVZh86DZXVs6GGqa58mKk1YGEIcQGQ6FXRsaxeovfvBgSLktGvDpEi
	hn5rl1xW/uraHscCYLqUYqLh0VcNMyhIc3sOfyd7NHwkx6w4O3r0DZiYbg0qa4Vb
	lm5yn3QXem7VZUx8QLiNYi7J9QRDYaxC5CO1IldcdBRj8N26sLrRQ2nlrt5xmbaX
	lav3Mw==
Received: from mail-dy1-f200.google.com (mail-dy1-f200.google.com [74.125.82.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hstxs9kda-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Sat, 07 Nov 2026 18:07:00 +0000 (GMT)
Received: by mail-dy1-f200.google.com with SMTP id 5a478bee46e88-36fa5673fccso4964792eec.1
        for <devicetree@vger.kernel.org>; Sat, 07 Nov 2026 10:07:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794074820; x=1794679620; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=2H5Ad90S0fkIwIHF31nqLKj0/QNXL/xbvdffpwYqAhE=;
        b=YlVXrR18NxkBaSkupYMNuhlH9Tgln//HRUGwg0z8PQTW54gRptnACes8sPbqC1NGn5
         U4Qy9RpyZFuRhUvNORUUX3ZKxHSg3agXbNMF3vtDzaQgPWgNs7Jhfy61PWOjbu1OUX2E
         /+FiPrxOd8nxMu1hvpGAyj4B9Ru7CBNinapIOajlorjdEsUradNfzMPIbWaVgNZSR6KK
         h2fM1moWsOqe0MgfqC4sme0QlI9KhKgs9yzDwmi8wpTBHxt+D2eR3aF5dnPKkA9nCqFK
         tq9Zc7ZT7EAT85Qkhk0nwQ0OzKqApBt63le6x4dX341cimKPsbtH3mZIaVaXyDy1Rjua
         bdFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794074820; x=1794679620;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=2H5Ad90S0fkIwIHF31nqLKj0/QNXL/xbvdffpwYqAhE=;
        b=Wk/iLNYcBrk84ekQ1caBKBG+BY+9xcUGhBVxvIK2hBKShL57QjL9l2XWULSG7kgtYc
         UeqG3Y8/HD7DcOLWho3NlRPYm1WaaoAI8B9G+EsE/dxs8hBEhcOFx6LKAlO/C3CIGpJT
         PGcn7igiZEGBNgKSF1VRS1cH2i3s9+QX+y+U7CQAf2uXPowm0H8/2iHR/IKEGYFdRExq
         HFU+pt3Wb6Jw0sG1Vv+R9HktGWxyOsxFHGuH6B/UbJjCzWhuV4wJuKQ5cWEqEEbA4yeY
         lPbnyKsKjckl8HT31Ez83i9hV17FyuXzPVb8O+AzvJQ8Tg0tqkLtSFFl/JkaBG8i69mB
         20zg==
X-Forwarded-Encrypted: i=1; AL+hErHvLZJ0xLgTlbBSOsONDgWKLZ0LFa/pC9bWtK5z/FZQ+rBR2akQrIup+gHOUTmQ2kh/gQVXXajthdRs@vger.kernel.org
X-Gm-Message-State: APuU4Z9zkyppZ4bsyDA6MnjHhCOLQ44y0y9pt6E2pZ+4QysSNJSgl9Ry
	hWuG7RpoUX39BaV4TyQ2E3CkMWLwaHLS8fBuTL4xLwIRO2yyC4WUsVJI4QV3mvxz5BeiHQ1xcbd
	VBJXY/Wa5VCM8TpYWKOoRsB6mFF7U6vJaaoYp588ZFBi72W5uAjDGceMA8LTb5Mg1
X-Gm-Gg: AYBFou3unDTkPIOYKufsgjE3xGIG1gYIygwqmXXFoZflz0wi5K9dI7YeCqJYPTDeTaw
	M5b+8wwun8eTDXLe4hBR53Hoq2VitG5OXtG2H4uwpnGycSv/fCV7cPgQPEwFNTk9se5ZDDHy/H7
	H5tDf/jTTPHXTTkOImJNGfMEB3UWXp30ctmM/oR2BhEg2FeWkWGaIJXI9TGEiI2z8N0gCM/vP+Z
	THQpzxSBcs39X6UCJSFHbEq/xuROtf/WX1xWe+JGZFMMQGyt4KMfxU/2Q8YocZjzOt37wQp+rJ2
	/2uu0iobwpK4DMfD6Ox2ebqN7cKfn0Ek8Tm1womO/EjAKa1/gkU8bg7A6+Xh4Bu4QOjMFp6VBL3
	xTXxsoailpI86UhD5B6tuHMkXyZPGgNGZ//1hUmcwN+QqO/OI/It12V/tJ0/W/U5X1SD1fH39
X-Received: by 2002:a05:7301:71a8:b0:369:ff7d:840 with SMTP id 5a478bee46e88-36f76c138camr9067093eec.21.1794074819392;
        Sat, 07 Nov 2026 10:06:59 -0800 (PST)
X-Received: by 2002:a05:7301:71a8:b0:369:ff7d:840 with SMTP id 5a478bee46e88-36f76c138camr9067032eec.21.1794074818692;
        Sat, 07 Nov 2026 10:06:58 -0800 (PST)
Received: from hu-tdas-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36fa8e3a47esm24710212eec.6.2026.11.07.10.06.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 07 Nov 2026 10:06:58 -0800 (PST)
From: Taniya Das <taniya.das@oss.qualcomm.com>
Date: Sat, 07 Nov 2026 23:36:36 +0530
Subject: [PATCH 1/2] dt-bindings: clock: qcom: Add I2C and TSC clocks for
 Nord
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
Message-Id: <20261107-gcc_i2c_tsc_support-v1-1-433d02972d7e@oss.qualcomm.com>
References: <20261107-gcc_i2c_tsc_support-v1-0-433d02972d7e@oss.qualcomm.com>
In-Reply-To: <20261107-gcc_i2c_tsc_support-v1-0-433d02972d7e@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>, Abel Vesa <abelvesa@kernel.org>,
        Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>,
        Jerome Brunet <jbrunet+clk@baylibre.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Richard Cochran <richardcochran@gmail.com>
Cc: Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
        Imran Shaik <imran.shaik@oss.qualcomm.com>,
        Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        netdev@vger.kernel.org, Taniya Das <taniya.das@oss.qualcomm.com>
X-Mailer: b4 0.15-dev-aa3f6
X-Proofpoint-ORIG-GUID: 9S35B3czRjG0DmSatRwYhUciMmE05HAq
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTA3MDA3MiBTYWx0ZWRfXwsJmq7F0pTtq
 npLyZSLggtvYq4mr/Q2xYyxeLFR+Hgd1fXNKyeElRdeT52A4AKm0oOAGSG9OOSf5csysCsEUJII
 PTdR4D9m66cA9h+wBhkbXjWD6r+s6SU=
X-Authority-Analysis: v=2.4 cv=dZMVTnXe c=1 sm=1 tr=0 ts=6aef68c4 cx=c_pps
 a=PfFC4Oe2JQzmKTvty2cRDw==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=EUspDBNiAAAA:8 a=OfrIayanZ0Hpx6dNCfcA:9 a=QEXdDO2ut3YA:10
 a=6Ab_bkdmUrQuMsNx7PHu:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTA3MDA3MiBTYWx0ZWRfXxi2MS2GyEIdv
 ul4oAxvGMDOIYjYZZoapRbwV+NGf0KxtdO7S2wGOwFJyvm8lcEOSmmq9JH55fqdHKjeI91yQYlu
 J1PaFZ5aQtpYu5jIbuoYo9GuyGdu8soNRl29dH4I3SQVj8vCn9sL/zB7pCIyv1Pf9Gu9TsTbsjk
 8Hn6e1Tu3SqO9j8j+MDQneNgs9dfC95fLGh2xPlb5PXgV0MLN7LSWgzcTa3KCEpdsGeaP+zuUtN
 hMMX2T12TuUrWd+5HlMcIQRj9tvu2MdxI4Rd6L/1fXGTgVUMyVbCOeRzPfvQnJNWYu1gRbn+gCn
 enp6qInTExO4qey3iaeOF1WdMn3AWsObeeD3mJAhmosEG5JrkSVUl3+dvBOFLn+fHu+60q0N/qS
 782FG/iMkAu8uHdYPFxr3kuVg1SyD+zuo8jWc128ZwVJ112qEbpx4wMNXYaXGaidoPWf6NCF3G3
 TE+nNE6qGdOirA1+BQg==
X-Proofpoint-GUID: 9S35B3czRjG0DmSatRwYhUciMmE05HAq
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-07_06,2026-11-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 malwarescore=0 spamscore=0 priorityscore=1501 adultscore=0
 lowpriorityscore=0 clxscore=1015 bulkscore=0 suspectscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611070072

Expose the I2C slave and TSC subsystem clock and reset IDs used by
Nord SE GCC in device trees.

Signed-off-by: Taniya Das <taniya.das@oss.qualcomm.com>
---
 include/dt-bindings/clock/qcom,nord-segcc.h | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/include/dt-bindings/clock/qcom,nord-segcc.h b/include/dt-bindings/clock/qcom,nord-segcc.h
index de4539b999850294926854a45db2997043c74f2c..921b216103da703818fae4d4a572a6a5288e1513 100644
--- a/include/dt-bindings/clock/qcom,nord-segcc.h
+++ b/include/dt-bindings/clock/qcom,nord-segcc.h
@@ -86,6 +86,15 @@
 #define SE_GCC_QUPV3_WRAP1_S_AHB_CLK				76
 #define SE_GCC_EMAC0_CNOC_APB_CLK				77
 #define SE_GCC_EMAC1_CNOC_APB_CLK				78
+#define SE_GCC_CNOC_I2C_SLAVE_CLK_SRC				79
+#define SE_GCC_I2C_SLAVE_AHB_CLK				80
+#define SE_GCC_I2C_SLAVE_XO_CLK					81
+#define SE_GCC_I2C_SLAVE_XO_CLK_SRC				82
+#define SE_GCC_GPLL1						83
+#define SE_GCC_TSCSS_AHB_CLK					84
+#define SE_GCC_TSCSS_CLK_SRC					85
+#define SE_GCC_TSCSS_CNTR_CLK					86
+#define SE_GCC_TSCSS_ETU_CLK					87
 
 /* SE_GCC power domains */
 #define SE_GCC_EMAC0_GDSC					0
@@ -96,5 +105,7 @@
 #define SE_GCC_EMAC1_BCR					1
 #define SE_GCC_QUPV3_WRAPPER_0_BCR				2
 #define SE_GCC_QUPV3_WRAPPER_1_BCR				3
+#define SE_GCC_I2C_BCR						4
+#define SE_GCC_TSCSS_BCR					5
 
 #endif

-- 
2.34.1

