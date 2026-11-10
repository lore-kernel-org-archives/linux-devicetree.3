Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794328773;
	b=zeRZOthxWuJxSHJvcj7Zh3m3Ax1d8NuN0dD3hGv+eUW9LgommzgZ8OW8OowpimGWwESU
	 bwdDiumfcMC0KI+yaKQW+hZA1MVM5y2GNmqGJE/b/NRjL3cmH8sKnGuZeoq0nqjSgNlbA
	 aHjqvTyEoBIqb7y6iNAeB/0o0GGBzYKrQ/q/5JUnrcu9Uw8agui4uSUe5j7mI7N1YVixl
	 1/jbVgN4ekBas8T3m/bXak8OV2bmDDxvXliOrTNH3Lm0wT763IVmPVWS9vaZ99iivBYi7
	 TnB6IUY+Ffkt8G1/qnJNn1gn2TR2kLIPTRZWT9CTYXYfaP+GnvbQwDsQ5zYmLAmPBXg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794328773;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:To:Cc:
	 Subject:Date:Message-Id:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-Proofpoint-GUID:X-Proofpoint-Spam-Info:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Details-Enc:
	 X-Authority-Analysis:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=JJCjzDhflBDeCIYW5ftQ/o7ka6RVpdfZz4d2y/Qd5Tk=;
	b=5WidTp3qyfvvnbmEnmu3dzA8QVwmfel/84sUIHt7kIsUATBMOrhJVsXYCZ4WQfxCO+XF
	 xcb6AGR6cvm67GbLFgzYh+DiRNiBXkai6DSK+19V0EFtwQSRTPIVEI6xKH8DtEwr6ImiW
	 LUXJoL6yYJmdfCJKaM3TM+D4X7T4tkeYdsb0SFXxfkNOYgM+nQ/UHxSQxYDq6DH1o8xoT
	 H/HHguGzsiNLm0RnuiYQbqmCYDrCGKapQ7L+5XaLq1Fk0Lco1wXweX44lp7j65wGg70zE
	 7YWw6qzbj5d2ZweFeJ3tlTyqf7OmQgesyO9PC53V+tJUECyTxMo2u5mOfjZEt8fcEpQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=fQj36kj5;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=U7K+6cR+;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 07B8560A2624
	for <devicetree@vger.kernel.org>; Tue, 10 Nov 2026 16:39:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 07B8560A2624
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=fQj36kj5;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=U7K+6cR+
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AAF0CdT3713592
	for <devicetree@vger.kernel.org>; Tue, 10 Nov 2026 16:39:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=JJCjzDhflBD
	eCIYW5ftQ/o7ka6RVpdfZz4d2y/Qd5Tk=; b=fQj36kj5uBANLLz2D8jINo9Px7d
	yfEOpLpDeUnwbeNVsidfvZzn1oRsjnS0/X9Q6hvWo8OrgJtej1IAPSqycWRFgR13
	jekJ+2k55F+kDw4l/hGsTZKdnq0fUmnWlUrYwu2dyLqqDjV9X6uJfsHUF3QoLMeD
	fD69THgU+ODrrvmBSn/wGQBFNBpSVJjESQIq5GoyHuKUaybg84dNOSkBefDGKuJu
	3f9YU+LVKQYlteFsYuESaAi6ULvIwsYx3Z3cp0jgJWe3kvZkT4QhcQSimh8jOo3Q
	DZ5Y05lEbmN+3WcJ3BFfBMtoVGoo7ItNhdatrIWM3+NNGxJtbp8kuQCUNIQ==
Received: from mail-ua1-f70.google.com (mail-ua1-f70.google.com [209.85.222.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4huvtdan03-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 10 Nov 2026 16:39:32 +0000 (GMT)
Received: by mail-ua1-f70.google.com with SMTP id a1e0cc1a2514c-998a2b06e4eso469818241.3
        for <devicetree@vger.kernel.org>; Tue, 10 Nov 2026 08:39:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794328771; x=1794933571; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=JJCjzDhflBDeCIYW5ftQ/o7ka6RVpdfZz4d2y/Qd5Tk=;
        b=U7K+6cR+Jx9hbIuWw7QAX5OWbPuBNN6oQFMCNJZDLh5ObDwNAutsekxUupyP9uYfHk
         P8JY+sIUJQOQn2Vk2POJTPnJg1znZWGlrwX1THXu/m615UUtfjYXRB/c/ziNxcUQxQ3i
         CQGx1W5ND4ErDXAEnjFnZo+lbNrbQf0Y5kVOcUmyVocUa2eWJ2+SXjp1SP4t3i5dCD/t
         FYhPtR/UTgCA9W/Itu6x5Y0MF5cQBW4ALBkiDjCgIm1c56cs+LTS28CCR/oFb7VEHzcu
         JU8WM40YwnAsRS9kejsqCSGTyPqKpOFYL8yTPqm1GZZEYeLeucfcuRVi2Oo7m49MvUpp
         gdlA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794328771; x=1794933571;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=JJCjzDhflBDeCIYW5ftQ/o7ka6RVpdfZz4d2y/Qd5Tk=;
        b=IxzX4Xo6AO0XIOQecd4MSgDL5zJzXrH44Jjrqg70NbcuBuauLjp62hKS7sXULNgS8+
         TBZ7lLuPA56PPY0HYfMTRh+FG8688eZLaSfN42WhcOJ9JcZ0pDV6rakvnpKNtwbF5g1R
         7hEz7B08tJuQwuQAomJrx7ArNagFWvmE9KI72M+IMaP+cPxZieWn7iOy2oOGnBXQgzjf
         GSCZv0infHBlrsN2DJu+cH0MQa6d97R7wkofpSpkbJH4JktUXaXlBbtiuvCLX1VJAFoD
         X7vHnmefi02IVjz754LjSEGOM+Frc/EJmkriSW59zeScq9Eiw3jCA1DEwfds5D18vTxq
         iLVA==
X-Forwarded-Encrypted: i=1; AL+hErHOrL55D31+iM31FWFyxYeg2g36aObNWFA9u0/ljk8XDm0vaah1AJlRoJ1E0K8vFVmW4RXblckCo5Vx@vger.kernel.org
X-Gm-Message-State: APuU4Z+giC0Df30YSlXZog1pEzbDQqTBmE5YEE0RiverSgG42nn9ApQR
	yWwQTcCnamF6l2s3FQ7jp5lXZsF0N+ApzoDgWtz7teCpNo0p1/+jts0MkGD0UZYzxaS5TQFwhd1
	eBnAzMwKVL855ntIjv3znK0p0sYe1dm6dlbhs+4eKJwIs+eDQWwBxWMKmMpCfgUOm
X-Gm-Gg: AYBFou0unePEfiD4JuhH904KUfs4nPY9OJ67EgJq9Hfa9tppArR/AOVZcNglNJm70of
	eAEN9i+xmLV1ZRRg1uerS9UNH7oxAcrmlaQSIMTcybNB7w5MDD0GWf4VMpEVtB0kzZSR0AJIPyx
	xWd4T8/yy88Vhw3MuaklwYQTw4CbQUp8jvG+XoouYTG5zqjfRNo9qihxRD1MBojN1utCsVsTsho
	UkqlKQNFP+AA+bOnNq7ztWghZrouUzc5LEwKaCmjnBn2U4XUK9yTZXb1qR+R+ul9Tl1DYSNNd1X
	QKbIo9CeigidHqeSmbEvPG2ETx7g1wwmx0GEvERGArglV/5xNzq1Hy19YuSfrgd7MEihfkkFChb
	QdeRIYNr5cfynvT1CuCaz4Vk4vOCgYZpGApBbekOmKNKnkUeJ9PzdalCY1C6jUbWyhYCBz4FWkg
	==
X-Received: by 2002:a05:6102:549f:b0:7ca:e2c1:9a09 with SMTP id ada2fe7eead31-7d301be6b4dmr919130137.20.1794328771257;
        Tue, 10 Nov 2026 08:39:31 -0800 (PST)
X-Received: by 2002:a05:6102:549f:b0:7ca:e2c1:9a09 with SMTP id ada2fe7eead31-7d301be6b4dmr919118137.20.1794328770825;
        Tue, 10 Nov 2026 08:39:30 -0800 (PST)
Received: from lin-0772.qualcomm.com ([212.136.9.4])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4ba01ff3428sm85130395e9.15.2026.11.10.08.39.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Nov 2026 08:39:29 -0800 (PST)
From: Atanas Filipov <atanas.filipov@oss.qualcomm.com>
To: linux-media@vger.kernel.org
Cc: bod@kernel.org, mchehab@kernel.org, robh@kernel.org, krzk+dt@kernel.org,
        conor+dt@kernel.org, andersson@kernel.org, konradybcio@kernel.org,
        loic.poulain@linaro.org, dmitry.baryshkov@oss.qualcomm.com,
        gjorgji.rosikopulos@oss.qualcomm.com, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        atanas.filipov@oss.qualcomm.com
Subject: [PATCH v8 8/8] arm64: dts: qcom: qcs6490-rb3gen2: Enable JPEG encoder
Date: Tue, 10 Nov 2026 18:39:09 +0200
Message-Id: <20261110163909.78085-9-atanas.filipov@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261110163909.78085-1-atanas.filipov@oss.qualcomm.com>
References: <20261110163909.78085-1-atanas.filipov@oss.qualcomm.com>
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
X-Proofpoint-GUID: ZzcXEx-MQU0t7kTGC3TPVdYB93GdksIy
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTEwMDA2NiBTYWx0ZWRfX6bEB+AotuCTm
 G8SjLPZNlzul6NDNYILnxsbJPqTOU5J4hPgolmEdPiU+Q1xuJ/d/ZGjVA9+eY8EIpMl5hMSXNqP
 QkQ7Zb+XJ95hxrUuwX77nMRQS1vbfl0=
X-Proofpoint-ORIG-GUID: ZzcXEx-MQU0t7kTGC3TPVdYB93GdksIy
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTEwMDA2NiBTYWx0ZWRfXyd7T5ifoA7KK
 IBAZgIhs1vMG+sGRQ5Rva3SlnjHxqnY01uprlIRIw3Q4i1TKji8qKcObl20Wlt6KYbrpW0Ptys2
 qM0Kb0B8aaGJ/cxqZi60xUB/fh38PcmQW9++xTL1bwgB4OD22DlzrHu+hwqdZZBwT86p8p0GNSL
 tNcgMW/cuu2JkuLd/8xZ4lug7Z0o2lNclHtqfvlMtIStur/IEvvgu+iIbGDxAuOT+CE3BcFIIx9
 EZR0lpnZAF8gNR7fmXxL1slFSn4UTZ7dRNr3nw/5JVt5dlcHcAm3fsfDATm2UinhClYIlm/v1BN
 hwW2XZoS4kZx4MQvoqi1uS53UMzqwiYgY+b8flBL7Z6wdDVyVwTgwX34paRNCfDa+HcDN/dFPxD
 QAXisvsnZ0JaRZhnU2Ay4gJB+MnJSmp+Y9ixmDbE2T31QPMYZVg0bdyXlLCafJnjip0g5Ff5G2a
 h0Ep5/zEyQvgSUNdN3Q==
X-Authority-Analysis: v=2.4 cv=ArR7T+9P c=1 sm=1 tr=0 ts=6af348c4 cx=c_pps
 a=R6oCqFB+Yf/t2GF8e0/dFg==:117 a=dNlqnMcrdpbb+gQrTujlOQ==:17
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22 a=EUspDBNiAAAA:8
 a=ciSP3Gwtf2YLaD0V-lgA:9 a=TD8TdBvy0hsOASGTdmB-:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-10_05,2026-11-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 clxscore=1015 spamscore=0 priorityscore=1501 impostorscore=0
 malwarescore=0 phishscore=0 suspectscore=0 adultscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611100066

Enable the JPEG encoder on the RB3 Gen2 board.

Signed-off-by: Atanas Filipov <atanas.filipov@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/qcs6490-rb3gen2.dts | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/qcs6490-rb3gen2.dts b/arch/arm64/boot/dts/qcom/qcs6490-rb3gen2.dts
index 909039816a216..b96214758ce13 100644
--- a/arch/arm64/boot/dts/qcom/qcs6490-rb3gen2.dts
+++ b/arch/arm64/boot/dts/qcom/qcs6490-rb3gen2.dts
@@ -789,6 +789,10 @@ redriver_usb_con_sbu: endpoint {
 	};
 };
 
+&jpeg_enc {
+	status = "okay";
+};
+
 &lpass_va_macro {
 	status = "okay";
 };
-- 
2.34.1

