Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792670241;
	b=MrI6y5/+yd2BZzhCh+UNI2Srwvdy5D4+VuyDW1kiBouJaRfQAsJs2Ddtprp4mOHNZKh9
	 oLgPjoIudGVGVowusiM2Z5UqP5aVDn6FbqxuhN6ig1IheOZwy3GG8TRKKAVxRY8E4+XGQ
	 O+djyGCcNaUcH2VHOmXkU7iN9ttS3GPWoFlYV51Gx4BeePGL/d/niBp/t/YdLbbs9Ub0j
	 WkUedR+jWUjs2+pZJcml3dHxoJwIFnZizybWQm2cLP1BQn6ycD6vxeJjK3mr0f/o6Fo+C
	 X6oOcmyTkboL5vAC7syCsq71PoRMuAlHEGJAEa6kRQmGnyGwvLDpzdubZ6rB+a3b3mw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792670241;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Proofpoint-Spam-Info:X-Authority-Analysis:X-Proofpoint-GUID:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=S5PZtlf7efPn/xBVQBkmIEFJgvp2IAfOqTLApDxIcg0=;
	b=1D/DgPC9aLfOWwnW5TYx+OBhYsvXyFCZ/0pBa/GqDBVzSwc/z8nOE+KeKnRpkhswZIU2
	 IrKEfdJNLK0gE8Lc7pfp4wBpYSW6EbvCUfR6ho9QwqGTuxDe3VI4n6l7YW785OwUBzojY
	 iRrfp2Fd8knuPlXKPFU3KNG1/hrS48qNeeh/CM1OYM5zdM6kPs0byPs9qMf73BEOWKMNB
	 czXfth8CJfZi0jQq1G+ZG4i6mNGnT+AVx5RQJvQ5C/AML6Xcb8CYBYJXg9TU7YYO/YpHs
	 TFKso8uaeY1+GN3URZskLxkqLBDjeWPohaXRAfIvo6TahCXUOFNdvL6p18Yzo+lt4HQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=VH2k41if;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=gmJHPapv;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B5AD6606A32D
	for <devicetree@vger.kernel.org>; Thu, 22 Oct 2026 11:57:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B5AD6606A32D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=VH2k41if;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=gmJHPapv
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69MBIgWb005782
	for <devicetree@vger.kernel.org>; Thu, 22 Oct 2026 11:57:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	S5PZtlf7efPn/xBVQBkmIEFJgvp2IAfOqTLApDxIcg0=; b=VH2k41ifOq4avR/q
	sFmsrOjEkuf2/RUj1yenFT4TiXUN0tmSIWrPyf2vRS24vK7AFNVRpw7vfGXtaTY2
	dIQTx12zp/ZMS2+WuJjxXNDHAGtKG3STm+YV5q0WnfqpHgSBNcionEI1/b379dSw
	iqrnyh4iAhP5ClnYGOX3XMShFOcdiCV8sCEgrmr6dABSKnkem8utwSWr0DciiVCp
	gDbWPPEKmzk7kzM2YaAYWltH3bm+sOBiNRQZXTqj106MR62V2MO4qvzSP3eqYySP
	HMN+5FBdXHyNsFCPVfeCOb47qeZZwdBnrE0ZnqGynZr/i0uBsVtpGluhzUgIXi/y
	zowj2A==
Received: from mail-dl1-f72.google.com (mail-dl1-f72.google.com [74.125.82.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hf93caxq4-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Thu, 22 Oct 2026 11:57:19 +0000 (GMT)
Received: by mail-dl1-f72.google.com with SMTP id a92af1059eb24-147be78cd56so2041815c88.1
        for <devicetree@vger.kernel.org>; Thu, 22 Oct 2026 04:57:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792670239; x=1793275039; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=S5PZtlf7efPn/xBVQBkmIEFJgvp2IAfOqTLApDxIcg0=;
        b=gmJHPapvJ5KW4orLtMgP6pp8slzIo+1uLqzPogJRMtDaUOEmUcv/K7QPJ5+D+8mlqI
         VwOoppg4xvF9OtjsOx/XC+1se96SkoPclcruwt9YB/9j/voh7mek15haypn6ORqHE1xn
         vVftM0c/Yl8KGb3XOsz/EvTttsoGJ05qdIyTNmYqf8eO7L8xOpKZyUqDDKhAJ9NcWHak
         ZG56mjx7/hNZhWT6oFa8pQGVrdFI/OuGPQo1gonJRFvNf9btfZh4k4d4hiG4a05Vqk+o
         3LY67Rh7DjLzmkyzMyGyNjqrDLFIrHImx87e3bX92jv1IOpb8RUSKuIiNE5dsrH25vR/
         gBrw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792670239; x=1793275039;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=S5PZtlf7efPn/xBVQBkmIEFJgvp2IAfOqTLApDxIcg0=;
        b=kME5gXo6zRdET5V8Gty9EYXXnXiDdLjRQ6e89TJzvE/ngdqJE3LEq36sI8CGP+6eLq
         8YYKUCNW8/xAvLrAn4DCC52LUjJi8amqoTSXwni6DFG14k4tmSHnQiF48mxluAS0Yxiw
         c6uPkBSof5hE/UIi3EcSqIG681CCh7NMx/TPg/38x8L2Jxb1cUm8X5So3Ab3sIaGl+TV
         9lLYZpTit5dSutQOoVPROEhk1ePrj9wHMciV/TuLHbAQQw1Vmv2d1eRUo+3jDjxwg9zN
         21pp/ZuDXPcMe7yfXULRWrLdu9oL66wmaRI7uWKGtVa8UpcYFtpTUXsN9daoxWcGm2/1
         BZxg==
X-Forwarded-Encrypted: i=1; AKwUvBzmQkiMDRUnRWeESC26++bV2rUfsGT+NvBDso6YcW2DQqNa4qCFGnm47P8HRwmfwxPmctSIxWzEnx/U@vger.kernel.org
X-Gm-Message-State: AFq9FYLJXpiiV829eNyOng+ZQ7GQUXV7IYakl3/a2Tq7CWwl7R4JRsXM
	VB7Cqf/8W3Caa5d/j0eDavlGAt+ey57Xv8YdZNex20Asfn4IJC6sLP7pU/LsOI8aKKbtuoq/Dk/
	P2ePPXbaxDVZ9urhEtaGnm7PMaEkcmqdiPOE7suP9pIPeQAgw9A9HeS9NS53T6Z8Y
X-Gm-Gg: AYBFou10Bo3KpMd4d3wMqWpnZlLevRSHyDT+7+zo2hMIPxXz+/FCF4I/iCHtFngy+81
	Iv3r1GNgs2Y00o8yMO4IsOaaf2nk8bm87pi+Cjo3CsSKGJQ/cQlof2uI76VfNN1QVAUYR+ZgYbn
	A3X/AyxGlkQ2ga/x0rVAQygmckPRZx9Fs5iA3A8GkuWqjvY+ufnJy4DIBHkHIExrCzqZNxnRZuh
	qCIy/U3oxkB5iP55rV6GnKKO/njk3pggFE3Q6OB3XlRFFZgbGy8XIJbxQoQTxH2hWaIGbENsBIr
	Rfm4NPe5XQ7O/JrhUEH/TRuDg29uojPDznLNykb6yaH4S5Rc2MYVIWrPyI+EmM1EtQ8r6cU4FMB
	Devsb94KfAOwE+5cBnDVz7L8km3sGGkArnqY=
X-Received: by 2002:a05:701b:454e:10b0:171:a066:938e with SMTP id a92af1059eb24-190a7756cc9mr5990648c88.21.1792670238532;
        Thu, 22 Oct 2026 04:57:18 -0700 (PDT)
X-Received: by 2002:a05:701b:454e:10b0:171:a066:938e with SMTP id a92af1059eb24-190a7756cc9mr5990608c88.21.1792670237767;
        Thu, 22 Oct 2026 04:57:17 -0700 (PDT)
Received: from hu-apateriy-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1903bf5d0a1sm14508007c88.14.2026.10.22.04.57.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Oct 2026 04:57:17 -0700 (PDT)
From: Anurag Pateriya <anurag.pateriya@oss.qualcomm.com>
Date: Thu, 22 Oct 2026 17:27:02 +0530
Subject: [PATCH RFC v3 2/3] arm64: dts: qcom: nord: Add SoCCP on RRD board
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
Message-Id: <20261022-nord-soccp-dt-v3-2-1a69a4d54c42@oss.qualcomm.com>
References: <20261022-nord-soccp-dt-v3-0-1a69a4d54c42@oss.qualcomm.com>
In-Reply-To: <20261022-nord-soccp-dt-v3-0-1a69a4d54c42@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Shawn Guo <shengchao.guo@oss.qualcomm.com>,
        Anurag Pateriya <anurag.pateriya@oss.qualcomm.com>
X-Mailer: b4 0.13.0
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIyMDA0NyBTYWx0ZWRfX+DqVzNC9T5Tw
 d7i+wtyCoj+piYuuw8+1DW+jHd6Tfro+c48sT1mqM41kfKxvwGueG/4KM5RcnooID1J/iGunJdG
 Xwd+10kmyeWzEGEA5qpHZrUm6pY8FjM=
X-Authority-Analysis: v=2.4 cv=ReAFmFtv c=1 sm=1 tr=0 ts=6ad9fa1f cx=c_pps
 a=bS7HVuBVfinNPG3f6cIo3Q==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=EUspDBNiAAAA:8 a=qVuS7nBUJV19qhEaXjMA:9 a=QEXdDO2ut3YA:10
 a=vBUdepa8ALXHeOFLBtFW:22
X-Proofpoint-GUID: S0HP0f8a_KB312Qy5MJdZKO0egJxu1gH
X-Proofpoint-ORIG-GUID: S0HP0f8a_KB312Qy5MJdZKO0egJxu1gH
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIyMDA0NyBTYWx0ZWRfXzpioxR2j18Xu
 Pgrz/y7BIu9FPs6J8F4ncXYnTJ0GaI59nyCrXlRAydzOu34F8gf6h6C6WUY1lskHwi9E3j3skPY
 6sBxLJcHCy2lk+Z7YjipcfZMWuGOoiajIum5MuzIXvDA0Gmv4Jmw7z1ZjUBzcWNVcgaasa5IlqJ
 AKlMXei7IsMqE4RKZxr0SsUX9NO20p5ifxTib6AHjRYqX6NgvJR6aYga8xKBPjiJBCRksWn2/yI
 k09j5hNKAR9DDxE8MDGt3F+bGgNrIDtZMaQr185q/tl8g3pxGleI09VQEhTHlYWvpi371j7dLZs
 fGzFlUDSdxDpFqUHNFYmV2ZJR/J/iSGmDyltkyZ66Vk+nVQHqYFHEEFlmXSY+6c2QPdKvelwNtO
 qVCqa2BTWZF30RjFrlxTJvWet0OmKoctVJwE7ae5/La3I5VAj2Qyt1y08baJlvQ27ts+DxMf5QT
 6OlhctNoryMQpWsZLIA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-22_04,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 spamscore=0 suspectscore=0 adultscore=0 lowpriorityscore=0
 malwarescore=0 bulkscore=0 clxscore=1015 phishscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610220047

Add the SoCCP remoteproc node with its firmware path on the Nord
RRD board.

Signed-off-by: Anurag Pateriya <anurag.pateriya@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/nord-rrd.dts | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/nord-rrd.dts b/arch/arm64/boot/dts/qcom/nord-rrd.dts
index 47978df0af92..6bed47b8c913 100644
--- a/arch/arm64/boot/dts/qcom/nord-rrd.dts
+++ b/arch/arm64/boot/dts/qcom/nord-rrd.dts
@@ -430,6 +430,10 @@ &remoteproc_cdsp3 {
 	status = "okay";
 };
 
+&remoteproc_soccp {
+	firmware-name = "qcom/nord/soccp.mbn";
+};
+
 &spi16 {
 	status = "okay";
 };

-- 
2.43.0

