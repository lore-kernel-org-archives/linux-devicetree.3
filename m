Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795430874;
	b=oahz8wG0v4at7xHTLu7EBCT/n9pQDXnlHwu+YDyvjdh1h9PLppfoEnG0mgpfc3iCXI/9
	 VWitayAIvAuKA2CocqP3Rqs7zBA2mv5o3ZWv8RLZIImOZyBbicjd+K8vIPb7evPZYZrkD
	 r4SxOKNK507WRQjalnYk4B3fWgCKJOatIe6SJsnfPfliw9xgpx7D2qv0i2HKADYGmAfV8
	 sWOIUHi7P0uEueYiR00nyr0tbKzkEHgY5dfJqLvsioBLbMU5sRZIjJplHqzjdJD8nt4J/
	 5BrWC5k94Oq2/O7Ducy/qC22vTc81Mg4PxfgwM2f8Gdnp9R+rZzKqztW/xqJXeMUTKQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795430874;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:To:Cc:
	 Subject:Date:Message-Id:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Spam-Info:
	 X-Proofpoint-GUID:X-Authority-Analysis:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=ZkJ+rVwIQ8v5aYjaoNVB1DBIZS3pCEeLSUvciBoYZ0E=;
	b=1eD68l7yjjCGAg//rFoPHKxcb5kUVj12qf0qOM6XXeIx/rZJ6eV/mQjIIwp2tsMaQrIu
	 piX+N3pb1xWqsvgv+KdeoWZPQr54/Lng9iu1onV9AP+3ugRkMn17tA9Ox45e7Q6megpkc
	 fpgl8BQ7M5clCOVP4FNCkYnGLyQposay4kCQvcbCYFzatvU07FhjLrADN1TkxDpknRZwp
	 Ndp40t+ZqxfVhLr0i33EncGWG5cRgrhDbReshH8a3uN5qS8iVVUDREuCwQbXxb3mMQoE+
	 izD0u0GvBfCCY2DuF5NLussV+04n26JMgnqUa4MeAQptiSIVH5TUt08lDmFRwinsUkw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=SvUx0kdM;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=NO3ouOOM;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E049B606A321
	for <devicetree@vger.kernel.org>; Mon, 23 Nov 2026 10:47:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E049B606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=SvUx0kdM;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=NO3ouOOM
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AN9Fnj12785423
	for <devicetree@vger.kernel.org>; Mon, 23 Nov 2026 10:47:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=ZkJ+rVwIQ8v
	5aYjaoNVB1DBIZS3pCEeLSUvciBoYZ0E=; b=SvUx0kdMi1jka39L9W8Ygx88qBU
	NqPK/oy1EnLsd6SqYoGFnI6S81lXgfRHWu+xA370ukTljdIusnvbfPgXHePM3iwz
	7wbwZH+fOz4CYJMuTFpTfOilqY9srRthsQxJSTPzRLvprmC4b4nyxhQzgqiy98Hb
	uqjEqJ1lSs80d/1U9IXQVEWFFxcIDxjnNSClTQewUH6W4xtYFOpV1sW2mxQfMvnE
	ZbM6cZinSO4G/Fr8cO5I4UTPyPuz7x+puL7iqV6DmBXKtyFo4d/xluFz57OvFIYq
	Aa0wNiyDsuxTT7ALOh9qYpf1byG6SiMwjcjTogHTd3Iu7DzYtv/Kf2DfKHg==
Received: from mail-pg1-f200.google.com (mail-pg1-f200.google.com [209.85.215.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j4fyd1124-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 23 Nov 2026 10:47:53 +0000 (GMT)
Received: by mail-pg1-f200.google.com with SMTP id 41be03b00d2f7-cd5ca3840c5so3380643a12.2
        for <devicetree@vger.kernel.org>; Mon, 23 Nov 2026 02:47:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795430872; x=1796035672; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ZkJ+rVwIQ8v5aYjaoNVB1DBIZS3pCEeLSUvciBoYZ0E=;
        b=NO3ouOOMsGAKQqxhs+kP3wMese9Vw+36kTahtMRgUql1+Ipg5oqxJIaRelOEjdreAl
         XmR+le0UZldZSwyY8WJdwl/m792t0NYqvcBX6m0E2YaOqvS3AwtUS8W7cF1I0sRvGRVu
         9vgFlXYvD2WuslI9iDI4SnZ2fgo0QRFsuPWy1sDY4Qk9ZApvZqwUcfFB4jiDzXviTKbG
         Qa42+xteBWBJwPezLIWPYAMrIa6OUOXKzEMSkup7w916LBDoCH5Dg63mNG2Fduq7CT4p
         E0O6+ut5H/KwSN/Q4cBepn9hOP7lzjAtNQBS43XN/6mgLll0qavESVL75GO7SxTV9OC5
         XZLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795430872; x=1796035672;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=ZkJ+rVwIQ8v5aYjaoNVB1DBIZS3pCEeLSUvciBoYZ0E=;
        b=eYW5p9ihc1jRBcjsqcczEEScJjM7MPf0XphxyQJjktxjITEUXYe1g6JXctqN3M0mnP
         HfuTjeUc9FSX9u2J/TiQfhnN+GG/fhPBIEjD5jsASaGZPOG+Eev7noKxwDXz8SJqj1dJ
         D2j7i5ck8gOYcjOQJ+EJG4sb00th95MRoCv8Z5SX2qFr1BM2si6Vi6h/wSAxBwSErYsQ
         arR5gQbdhsHtcN5rGVnfMIeOkuPY3nCcbPT7CNMDhnJTJPE+qGrqwJd4p3PGR2uYJG7f
         ysyD3WUEJuG34tLweaUm4ltw3ycqqFQnOhMxXOTk4E5aNF4RruZ+3zBBLpJOICJHnzbx
         aobA==
X-Forwarded-Encrypted: i=1; AL+hErGRfdu2E2q9c6uUE0jtEgM0S6e0cOYLnz8U1gt2NQ8K7MCygedtbjdER9jIkcbZhLamO+737wjrRH99@vger.kernel.org
X-Gm-Message-State: APuU4Z8fSjsPPavn5UpB/5r0SrYJJ9DvLcO3jS4DH34ugJsHXNPqPNKF
	eR5oNjv2luyktdN14+JpUa1uIT4Y3riAN6uFwP8zChBX1si2qFW8yepJmhx0TqIpSm8P1Gj+VtE
	EPWyAeOM0+OyeOnmvhWHqSMVkBVHmqG+Yehij/dWdbPaKt3kpESpHTILD2B4B4EeC
X-Gm-Gg: AZFdTZeSASiVqfvH411IzPx2VuZsJOxp/38mJL6FqKsn+iLXH9VW+7YhbPYu8kPfWPB
	mNNfJs2mgIou66NoWCzFpLBr3A+OLSxkJRNMIDsSwOn/BTwl31YvbZGRDEy3IFYqOO1Uhf1Eipa
	QOotByXBYE9xrJabflbrCee2LzSqzwBSENCLREw6VyH6XqSFz3xCDPzgACIjIVzxJ/WlD1UkoKm
	qytqxjfsag5rRL+hfYL5J3dKjdzPCgOaQrU+fvQ090/JhfdoQcWZsBg3UfV9ZZFp9NhkhVL/ErH
	qxC/znhxTbsxvEuFJj6BB1+IwBeUsD/IavHT4jT/OUrv6013XsKvDdqHnoHm48TTTAum5zhcd8K
	RVFPTCJ9dLoBggp7UFGgFZS4sziq9bc1TGMv+UcQ0HJpwPIkDK+S1T5QfSwC4KPeAwaj/3oyzUK
	h10LJSLQ==
X-Received: by 2002:a05:6a20:258d:b0:3f9:9897:4bd with SMTP id adf61e73a8af0-4014da5de2emr11243522637.57.1795430872453;
        Mon, 23 Nov 2026 02:47:52 -0800 (PST)
X-Received: by 2002:a05:6a20:258d:b0:3f9:9897:4bd with SMTP id adf61e73a8af0-4014da5de2emr11243503637.57.1795430872028;
        Mon, 23 Nov 2026 02:47:52 -0800 (PST)
Received: from hu-faisalh-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8c873442863sm5413467b3a.43.2026.11.23.02.47.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Nov 2026 02:47:51 -0800 (PST)
From: Faisal Hassan <faisal.hassan@oss.qualcomm.com>
To: Thinh.Nguyen@synopsys.com, gregkh@linuxfoundation.org
Cc: linux-usb@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        krishna.kurapati@oss.qualcomm.com, peter.chen@oss.qualcomm.com,
        krzysztof.kozlowski@oss.qualcomm.com,
        Faisal Hassan <faisal.hassan@oss.qualcomm.com>
Subject: [PATCH v5 03/11] usb: dwc3: qcom: Keep wakeup IRQ enable/disable balanced on failed resume
Date: Mon, 23 Nov 2026 16:17:18 +0530
Message-Id: <20261123104727.1539149-4-faisal.hassan@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261123104727.1539149-1-faisal.hassan@oss.qualcomm.com>
References: <20261123104727.1539149-1-faisal.hassan@oss.qualcomm.com>
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
X-Proofpoint-ORIG-GUID: LtPh3tYdha7INot_9vkmajb4FqWBGuBM
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTIzMDA0MiBTYWx0ZWRfX5c9qTsq4eL0S
 O1tFIjiwSBt2obyEIJjDRDWB6AUj7RvsU040c/of4A7rmGtzPTK2C/V/QxW1rf96PxVSddMWQJT
 NcoyEg/kS+QcfHYY8pzlD6mmKKue0dcV08o1yjaE1aBXJUw9AxMAZMnk6MokFtfsDdlvoumdL9a
 t36bzC4miCTP979Eyc5eBkp2Aihu3kgECC+5AVZ/YJTEL0/DZ2DYjKzmlRcvWeUIqwBnM8Bauvg
 8hErYuGjpUbXKxptvkYKXFYr+Fujfl19/pUnDHeJoi5jqeXtm/Mj5otNG+1of9FJN+XA6JJEE27
 64/Sz01yTAQbMGSURJorOpgpsx3GKdiLybt4LNZfdi3oIxwqge1pDKpI05oyoN5+DKyhugYjVKb
 vQDHAmff6oly5cUnVlHbYZOPccfjLXIbIB3QflWtReKZLlHSoIM0F9ntP+iDA3i+RkswDPiGOt9
 h0MwNfHjElHVyLotr6g==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTIzMDA0MiBTYWx0ZWRfXzp1RUeUjdBQ4
 rdQSWN1sQo6G4+DqYj+LQ9YKSh1ITVmZ5bqsHr2g7EQdF3oiTSxIHevbPKsxTD9AxVgwh4MHl0I
 KGIOW50oFTu9My6NBWm3wxdp120YbRU=
X-Proofpoint-GUID: LtPh3tYdha7INot_9vkmajb4FqWBGuBM
X-Authority-Analysis: v=2.4 cv=Aol7T+9P c=1 sm=1 tr=0 ts=6b0419d9 cx=c_pps
 a=oF/VQ+ItUULfLr/lQ2/icg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22 a=EUspDBNiAAAA:8
 a=zjLylsKXzqFT3lpEvI8A:9 a=3WC7DwWrALyhR5TkjVHa:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-23_02,2026-11-22_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 suspectscore=0 phishscore=0 adultscore=0 lowpriorityscore=0
 spamscore=0 bulkscore=0 malwarescore=0 priorityscore=1501 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611230042

dwc3_qcom_resume() disables the wakeup interrupts before enabling the
clocks. If clk_bulk_prepare_enable() fails, it returns with them
disabled. The next suspend returns early on is_suspended without
re-enabling them, and the next resume disables them again, so every
failed resume leaves the disable depth one level deeper and host-mode
wakeup is lost for good.

Re-enabling them on the error path is not safe either: the
level-triggered ss_phy interrupt can stay asserted, and the handler
can't make progress while the controller is not resumed, so it would
fire continuously.

Track whether the wakeup interrupts are armed and make enabling and
disabling them idempotent. A failed resume now leaves them disarmed and
balanced, and the next suspend arms them again.

Signed-off-by: Faisal Hassan <faisal.hassan@oss.qualcomm.com>
---
 drivers/usb/dwc3/dwc3-qcom.c | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)

diff --git a/drivers/usb/dwc3/dwc3-qcom.c b/drivers/usb/dwc3/dwc3-qcom.c
index 18db19cf2065..e7fadad9a4e1 100644
--- a/drivers/usb/dwc3/dwc3-qcom.c
+++ b/drivers/usb/dwc3/dwc3-qcom.c
@@ -81,6 +81,7 @@ struct dwc3_qcom {
 	enum usb_dr_mode	mode;
 	bool			is_suspended;
 	bool			pm_suspended;
+	bool			wakeup_irqs_armed;
 	struct icc_path		*icc_path_ddr;
 	struct icc_path		*icc_path_apps;
 
@@ -323,16 +324,26 @@ static void dwc3_qcom_disable_interrupts(struct dwc3_qcom *qcom)
 {
 	int i;
 
+	if (!qcom->wakeup_irqs_armed)
+		return;
+
 	for (i = 0; i < qcom->num_ports; i++)
 		dwc3_qcom_disable_port_interrupts(&qcom->ports[i]);
+
+	qcom->wakeup_irqs_armed = false;
 }
 
 static void dwc3_qcom_enable_interrupts(struct dwc3_qcom *qcom)
 {
 	int i;
 
+	if (qcom->wakeup_irqs_armed)
+		return;
+
 	for (i = 0; i < qcom->num_ports; i++)
 		dwc3_qcom_enable_port_interrupts(&qcom->ports[i]);
+
+	qcom->wakeup_irqs_armed = true;
 }
 
 /*
@@ -396,6 +407,11 @@ static int dwc3_qcom_resume(struct dwc3_qcom *qcom, pm_message_t msg)
 	if (!qcom->is_suspended)
 		return 0;
 
+	/*
+	 * If a later step fails, the wakeup interrupts stay disarmed, as a
+	 * level-triggered wakeup line could otherwise keep firing while the
+	 * controller can't be resumed.
+	 */
 	if (dwc3_qcom_is_host(qcom) && wakeup)
 		dwc3_qcom_disable_interrupts(qcom);
 
-- 
2.34.1

