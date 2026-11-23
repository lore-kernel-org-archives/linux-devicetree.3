Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795452195;
	b=n5k9wkSsmqvS6k/zrWaTx3zJZJlpsmflSybmdUgSXO7BHgCYGg4dvDAhuCSPg6Pc8aP4
	 DlmtTjNGfFOd9zLD5eN6qFKEtLPZ0pv33atu/G/MbU+vH/0K2JqThn2+Di3JvNYHQa5lO
	 nq3nQg3Ftiv6XyctO/q7GNaXCTwtuyt5tyfKGgYr7UFHDBysPbOYBP+ccOLWrciXNHIe1
	 ztrzcNoth1tz7dKNeV+x8nLFKzAp6XK2otGYlP3sS074uyWvxjADNSEx9uGISY4WFFBXb
	 s4WsvJ8qdNqTWjeDf/rhg6o7S4hC72m4AvxbvSlaLgWjd91cchIGoZTYVc4gslJhWVw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795452195;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Proofpoint-Spam-Details-Enc:X-Authority-Analysis:X-Proofpoint-GUID:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=K/0f/Fx9dcCRSnODkYtK3aiTY3t3xedC0JyO9Aj9vBY=;
	b=piZLNUJQhFzCSqqv92c8VA7aD7vdrNx6k6KqoIkz24QdOcXMY95aXX4aaL8nC248S5cP
	 Tq523zc8gPacr9PZ1HkVw81qePbJI8hnncf5N5Z6/5HfUDTIVQpcS5yndBdNgz/MZ3lfZ
	 BtN56/C47AEEibuNoz8BIW/5pX/r42vnSunxGgZJF0TxZ3Mfyv3bKyzKRDnhCeSe3HxGC
	 X6Xo64pEML8qemGZKBRA3Qpp65YEdir2DCdwwOBWap9N64FD8PzFpxpPJZpPGzpZ7Ixd7
	 wrh3vnyAMc4bYnbditoq3j4V/vwaBWRAuUv+zJCDWefQBxok6P0tI0DUf11bzgXz3sw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=bYi20q5q;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=JSPPntkE;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E5AA5606A6BC
	for <devicetree@vger.kernel.org>; Mon, 23 Nov 2026 16:43:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E5AA5606A6BC
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=bYi20q5q;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=JSPPntkE
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6ANGGpmB2769001
	for <devicetree@vger.kernel.org>; Mon, 23 Nov 2026 16:43:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	K/0f/Fx9dcCRSnODkYtK3aiTY3t3xedC0JyO9Aj9vBY=; b=bYi20q5qmtj+mmQ/
	RBnmM37JL43Sv32HyZV40BcU0nKWzO90dX3rVPBh+1lNie/T/OprsBUPNknFKkxj
	HAPisO4bFdVYDJIVjN32uTjKpmY8b7NIi08EiaH0YgDVTF+TueO6osskrfUVtjoE
	UbNFmfaiU8JN8Dz7tkad+zWVJbi0R52qAuL/t6z3D4d7P2YfPN+fXf4TY0VGSBrt
	antkIZkSepzsRvbrHSlT08UrzekzX5MCOBsuzLtzWO1wrEnF9JzMGEy9ZdjNKxW8
	aq1UQi0B2bvlSR+EI6h+Y35kNgutMEOYsURprvKt629I0/i2wvueMyGfhmIIhvv+
	d5tieg==
Received: from mail-ua1-f71.google.com (mail-ua1-f71.google.com [209.85.222.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j4g1pacet-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 23 Nov 2026 16:43:14 +0000 (GMT)
Received: by mail-ua1-f71.google.com with SMTP id a1e0cc1a2514c-99e0ee0db35so2584354241.2
        for <devicetree@vger.kernel.org>; Mon, 23 Nov 2026 08:43:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795452193; x=1796056993; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=K/0f/Fx9dcCRSnODkYtK3aiTY3t3xedC0JyO9Aj9vBY=;
        b=JSPPntkE/swE6x9ThFFHmU+dc07IYKfAskGaaC/ny6rDJof5n8MNJGyiLBLMDUGaMV
         ZCuAQa0Fgrbc4J8w9CNrYoK6moJVxuGJvwX/vBQ7b/tD8c0ufDC7xGMhwTMhI1pQ6jsP
         2gmL+AiayoJhai+fvrxLj7JeAdMhcMHIA+8zM9Q1ZOZws0kQF2y16RjKNrJJQbmfcdZt
         4GewrfNMcEZf2gVFFaPP9/xsCK//QlpCwLlTgwXEMNYDRny71OaNz4tibu1lyAGQGb9s
         FOm98+b1VpkHqNFEshV60uEiB8ejP7q+wKDsvEPOAvYpmkPiTCuo/7I437h6rJNvX2F5
         9kMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795452193; x=1796056993;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=K/0f/Fx9dcCRSnODkYtK3aiTY3t3xedC0JyO9Aj9vBY=;
        b=qc9QpqijfeR+tbtidco89ncRflmA5+NAZnFfqDk8XUBr2/P48+qfzx71TPgtdu5yE3
         Vu0B6ZPPhZbgztQQKWetnEJaxNIDWZLxB9yWz66odlJagCAproJVrmbQcJBtiobgP5F/
         DvtU94mRLdDplx5m4vznVQTURvwLh5Jz3Q569fG2o5Id8aA25O5hrJky4bJze/+kJpLU
         kVmuzvNiPwhIVYoB173Wu9HnzDs5hBzySJU3TAXAWYOfIqXOTF7mwhtW5rbKS26c1O2J
         G1nhp+Nr68XGre4IsILgFqdxbcJd5w+3Yq+AMDxQPwpt/4OIDrOfYAxuVcC9VKJj0Jrf
         22JQ==
X-Forwarded-Encrypted: i=1; AL+hErEKkcy5vGPqYy1s67Wl+PkNc/u2OAMjP737h0egoMcv6iUuiQ7y6k2E2OATTN/GrUBkjaug00laNCz2@vger.kernel.org
X-Gm-Message-State: APuU4Z+I0sSHX+ijMx0jp2oWYhOuf5As9HQkJTfttiBwFyvtKHmzD3Zs
	wfAW9f6KUrJyPcJaqBJE6WC1xHplSeqwqxuGxVHZdyhBPf3kJy7tt00wSXL6M/NSw8p5RiEq5Ol
	VGPfzuveYha+UDTv5skBrIg4o1pbtkOhniaPDXj3HXkJJ/A7eWex6EvC272UfqidTmbqA/e9A
X-Gm-Gg: AZFdTZcipeWIReXvlrgr8vGNr30CYNRWHrSOt/qv2eq9pS9BMG0+NtrJvp18S3WIy0A
	xuhNHwE0Azwxm+8UfJ8aRrl5KW1488ptyIg+06Y3my+WAoe7sj2Nyj9mBu5TEXhqWKz4mb7Tfkw
	zopHinoKDhw0FOU5UD1PMaqEvZADJxgU1ayJ3YY6PBuVX7AwIUUUOi7K+6UeOnSDKvMb+tb9IOF
	POq7B9ZE5InzRTfoPAmLq4W4LS0Glb1bpvTiPBhDBwsGzFshnIGrzGjNPUk63ncwv6OrQ2xaIqF
	zrNt/MZkkFj4pG/Q6BsT2Wy6B9Lju4qfTzbC2V7+j/Tg09IK8/TkgYMRzijQhD475p0MWH+sbRs
	NaujtNRWO33j8smTb4lMJtTQayZ7ylPD8xIJB2RhElZ2ZAbzDob7hLNau6SriSg5jPpVdIgHrKM
	UZhlRZQx9WDceZ
X-Received: by 2002:a05:6122:1994:b0:5ee:13ad:6c8e with SMTP id 71dfb90a1353d-5ee8af3d2c9mr6205480e0c.17.1795452193259;
        Mon, 23 Nov 2026 08:43:13 -0800 (PST)
X-Received: by 2002:a05:6122:1994:b0:5ee:13ad:6c8e with SMTP id 71dfb90a1353d-5ee8af3d2c9mr6205435e0c.17.1795452192792;
        Mon, 23 Nov 2026 08:43:12 -0800 (PST)
Received: from [127.0.1.1] (93-159-22-70.cgnat.inetia.pl. [93.159.22.70])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c513b00117dsm426725366b.80.2026.11.23.08.43.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Nov 2026 08:43:12 -0800 (PST)
From: Igor Opaniuk <igor.opaniuk@oss.qualcomm.com>
Date: Mon, 23 Nov 2026 17:43:00 +0100
Subject: [PATCH v2 5/5] arm64: dts: qcom: qrb2210-arduino-imola: enable the
 EUD
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
Message-Id: <20261123-qcm2290-eud-v2-5-9bfc432dee07@oss.qualcomm.com>
References: <20261123-qcm2290-eud-v2-0-9bfc432dee07@oss.qualcomm.com>
In-Reply-To: <20261123-qcm2290-eud-v2-0-9bfc432dee07@oss.qualcomm.com>
To: Souradeep Chowdhury <quic_schowdhu@quicinc.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org,
        Elson Serrao <elson.serrao@oss.qualcomm.com>,
        Igor Opaniuk <igor.opaniuk@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTIzMDA2NiBTYWx0ZWRfX4Gl2BSn6Q1SY
 veaVZvmYz3c74XaBE44PZjN4DohgC8oQPUPGEWmqzHTvQaO95fYNVInx3FhEDXCezfieLaCLCeo
 IrOyhiV4zhf9jt/GWtIh9xWYhAqG/0cuXGCkTtm3dkAbuZFzLAPbXKuUqw3Dfx4vrktvvbzmN4a
 g6j6Mzp1X69g2XUeAQib1yb8+T2GsI9F1CVClMS+Gm9q0qWq1C78PrI08frSVRgOlmcYkAV6tu7
 cuz4OThrTuMQ2GPwrLXEGbcQ3NCxZ0DH1/hQ6vO4WBU5qI9OSUaieapI93tMpUekxNRWrUpTtEU
 a4q01i9u0H4suPYZcaUeoV8ilUkfaT3G3wc13XEvYLDBEm9nK2W4KGCbc3tvj+secmi1ycu3MVM
 11+ywQyCaKhqXbJa+PtON9hUxEaQZcOqHL1RU/b/qF7xQesah4dAt1tMpw9WpOawzxL8/xYqNd3
 wJz639yISKz4/v8uSBA==
X-Authority-Analysis: v=2.4 cv=AeIkjHXG c=1 sm=1 tr=0 ts=6b046d22 cx=c_pps
 a=KB4UBwrhAZV1kjiGHFQexw==:117 a=ySe+0nHqNG5yihRO1pIWsw==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=EUspDBNiAAAA:8 a=pvBjvzZ7d9aESBAnF-kA:9 a=QEXdDO2ut3YA:10
 a=o1xkdb1NAhiiM49bd1HK:22
X-Proofpoint-GUID: pu3D-L3AKQxWI9KTKCRyoyKA97DCQftT
X-Proofpoint-ORIG-GUID: pu3D-L3AKQxWI9KTKCRyoyKA97DCQftT
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTIzMDA2NiBTYWx0ZWRfXyNbHjWyHCexY
 Zuxorb5g2uirqzjWX8MjZFlxLe6oQ64nJGbZeJKOxGso/YhLQpGe3KvTMF7gvKdxlnHDuIghTT2
 Y63sIXwNXQFu0YGlVtjObcuLIUzdQOs=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-23_04,2026-11-23_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 lowpriorityscore=0 adultscore=0 clxscore=1015
 suspectscore=0 phishscore=0 impostorscore=0 malwarescore=0 bulkscore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2611040001
 definitions=main-2611230066

The UNO Q exposes the EUD on its USB-C port: with it enabled, a host
sees the EUD hub and its SWD/trace functions, which OpenOCD's EUD
adapter uses to debug the SoC.

Signed-off-by: Igor Opaniuk <igor.opaniuk@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/qrb2210-arduino-imola.dts | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/qrb2210-arduino-imola.dts b/arch/arm64/boot/dts/qcom/qrb2210-arduino-imola.dts
index e99d2a56dc28..a1af2caa5bfc 100644
--- a/arch/arm64/boot/dts/qcom/qrb2210-arduino-imola.dts
+++ b/arch/arm64/boot/dts/qcom/qrb2210-arduino-imola.dts
@@ -226,6 +226,10 @@ vph_pwr: regulator-vph-pwr {
 	};
 };
 
+&eud {
+	status = "okay";
+};
+
 &gpi_dma0 {
 	status = "okay";
 };

-- 
2.53.0

