Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795794944;
	b=qqdSAB5SRn0NrIxWc05uJZqsXd+LLudj67eFU9Hj1MQjp5AFt22HmBscDZeGd+L4gLm8
	 6vPe24ZW0SzuSbX4SQAgW6j4TCo1nqiPn91rfeUCPUxv+Akp5Qd6SciridWkojH+5/AiA
	 Gr3wvDLcxJfFhNZleZNvf2oID0ax0T9X8WFonXp0K6te1UU7XdAvNq0s5V5y5E81tY68t
	 1vo7yo30e3T6mH8RM1MPKHVXVO1OQnYHvyT9WA/ErrOWrGENDCkETS55QSDH0r6sJTKaA
	 i5YCLOV/LsD04Fo86bvrXRN0yHzCmX5lkulj4QxkNkYe6EKgxdoivAYJexo8xK5+djg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795794944;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:To:Cc:
	 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-Spam-Info:X-Authority-Analysis:X-Proofpoint-GUID:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=9nbCdb+Wkcss33IJ/qGvTsnfbG3mcLCoMRGj4dJScAU=;
	b=J1IBpWKlykF3ywXPdNmUYhzvChn7384Z6agkd5gQqNaknuZ2Oq9hmDIw2fvltBj4W3An
	 eGZzHqZN/6df7DD3ABZ29aJijBVUWpsadAfL6o/Sfnx1cfPaZ9ijRZR2MH3+e7NVP8EdL
	 SQZQ0C6OtxCJOLAE75O3y5R+dOBhOhXk1Mc8fQdfqHN56r7a4GdqMZTZyvgPonxCqU7BH
	 bwed08hzmyigEhqX3m1iQGLoDDOvvYOfkxDmTMNNbGD322NzS6oQejCIXYgiKasQGapLa
	 LUPuJjbEpkBEX25UYl3OzQ0lUXl3Pz8DqPjkLIFgyyxyEuP2vs7IOPIV5yeHMdt6Iig==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=l75Q4gj3;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=K8dAAePz;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 087AB606A688
	for <devicetree@vger.kernel.org>; Fri, 27 Nov 2026 15:55:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 087AB606A688
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=l75Q4gj3;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=K8dAAePz
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6ARFpQqO065562
	for <devicetree@vger.kernel.org>; Fri, 27 Nov 2026 15:55:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=9nbCdb+Wkcs
	s33IJ/qGvTsnfbG3mcLCoMRGj4dJScAU=; b=l75Q4gj3xPtQT6qzP1aWYxQQZz+
	HMqeTl1UvdzXGp13Y3jS95txfQbIsskxTt46zbh+S5OP+g1MsCj+GR593ZbEhk48
	2KN5+kqpgTPelcEWdyiDcLHdw3nvOewFOpryhoGyifCbH9+t/DAwhpH8NSR/jQ7a
	uTZHwHkw/kQdLafjmjZFM9v7VXTDpBzrAjHTTiPPbde53nebF3s2RV+A6LId/EJe
	jtxbQo1KWT/NZ2my+f+JqUHSzh1e+cJlROabOFcekuS0f8G8yLUkYyOE7KPNbl/V
	bFgExzddoN8Y/7pEL/tBHjJLfbCaJog8L/KHTSTGCuRNB1TDl0zfS23Jbgg==
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com [209.85.219.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j73dhac37-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Fri, 27 Nov 2026 15:55:42 +0000 (GMT)
Received: by mail-qv1-f71.google.com with SMTP id 6a1803df08f44-92114c39cadso148476226d6.2
        for <devicetree@vger.kernel.org>; Fri, 27 Nov 2026 07:55:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795794942; x=1796399742; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=9nbCdb+Wkcss33IJ/qGvTsnfbG3mcLCoMRGj4dJScAU=;
        b=K8dAAePzvBVvSMjqRtQIBBSWERR7aNAiZ/yi0iNEEv9o9wafR02hPxRg+3noQfXdXf
         3lM8OHv9QYAcLU+jS7J4VQO4k1loHDQ07NfoSSJAM1HMO2KiGpPIBI1tYHm/dAW9ebQI
         Ro3zPUQcXzGlZsggNDJj0Mp09kV7sH/QDD66z8YfI4WHYBoqTYRg0iZAAsmlGJqJb1Gm
         C+ojV0VU6krxLWpQ6O1vT11WdfTn/Ho3UuF4GM4Wyx7tZh6aVesr3AFFAMsyZPhtGWkT
         V1Q9/R/j6E9w22+8VpouZoDOhs7LykgSg2NezALsHqvoI5C7P173zOsEc085oRV1/Tde
         B/Aw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795794942; x=1796399742;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=9nbCdb+Wkcss33IJ/qGvTsnfbG3mcLCoMRGj4dJScAU=;
        b=zFe6W/PmWyQS6Ve51LUO5KrWDXXA1/1RVPU+4x+s9C5K0Zz5YQRrT4GkLpUg/9rqYt
         FrMFTWobh/8OrY3gwdjdDEgh+yH7EdErUCp5MagNgNAN2m2ODIpQy3Rodkxuf3MhIRpR
         K3M7B/6yglZSEX0yshmPxtvYgbpzK83o0aHe9davbUC4hdJdp4xX1HLXjku4ypn8VkhK
         VRtYn+IIKwghsZ7q5O4cL3vW67NtzZX+zn9k7Uo3rqnvp+o7bkfJ3CYeF+e3srYPRsPU
         mEXx+/fGjFCTjgjDJ2oJWefwP2tJwEm2I4oZL7+k36n+fXG6l1m7tiJYXGiz06HgQlcW
         cdmA==
X-Forwarded-Encrypted: i=1; AL+hErGfa/uScZieyn+PQBmbCI8xZGM48CmjL4Y5T+VxGsRsQm2knKzwDLhfLqwcewP5jl6XKBr4XNfCKryd@vger.kernel.org
X-Gm-Message-State: APuU4Z9HnAl89BR1GHN64GXNr84c7oI3IL/MNyZKkBl68Yp1RiKV6EGE
	xOiV4k9rBTlqbmIlneVxu+V7NDYwJLA7BiHaqaUgGGP0ov7UAl5JQdIBy34KrFbm2QTIOENi/0l
	3kz0FBdQGfCQayqDaGdsMreei4Cm95U2TErT+K65s13PqrUxBPmDT1kcfZAYoUASy
X-Gm-Gg: AZFdTZdh7IxD4n9yK7ryNe5Doqm/8zQTj2Kucgu6z0KM8PHETMTc9+DnlYx6tQbKyxN
	3iv8tDazoBzXEnLD6nTQo8mcQeVGy/p9ndo0L0WMTMAmAwJQ0iXHpokih9A7v+gZ38m5EpYimr0
	QCcd48ZfX8k4fiXydyhpCRhM+QSToyqphjopvfVDQbypa6WB+HLQhWgDwcurcL4hOdRnFp7lJXE
	7hY9fjguvyHQr5fYcQpNeWKuyHd3gvvPU3NlnXTLJZPP93Z2qLXyKJfQKUtXQ1GTu20XSBilwaF
	2953q/t8gvU3ADRCzHXZabx+jRjiYCKERb8yPKLAVrbMhbk/GL/ThD8dnbjJr2NHClLxrR3GGxT
	ysXH0hU1nZjpVa3B852r/AJmuE+DzbNaCGuC4wCIqulcAw024DhagaiFS/zDNecVx
X-Received: by 2002:a05:620a:6f8b:20b0:94a:1db:1639 with SMTP id af79cd13be357-94a01db16e6mr1440883685a.78.1795794942407;
        Fri, 27 Nov 2026 07:55:42 -0800 (PST)
X-Received: by 2002:a05:620a:6f8b:20b0:94a:1db:1639 with SMTP id af79cd13be357-94a01db16e6mr1440879785a.78.1795794941976;
        Fri, 27 Nov 2026 07:55:41 -0800 (PST)
Received: from debian ([5.133.47.210])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4ab69bf6804sm47272636f8f.10.2026.11.27.07.55.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Nov 2026 07:55:41 -0800 (PST)
From: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
To: andersson@kernel.org, konrad.dybcio@oss.qualcomm.com, abel.vesa@linaro.org,
        robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        alsa-devel@alsa-project.org, linux-sound@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
Subject: [PATCH v2 6/7] arm64: dts: qcom: glymur-asus-zenbook-a16: add DisplayPort audio DAI links
Date: Fri, 27 Nov 2026 15:55:19 +0000
Message-ID: <20261127155520.358909-7-srinivas.kandagatla@oss.qualcomm.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261127155520.358909-1-srinivas.kandagatla@oss.qualcomm.com>
References: <20261127155520.358909-1-srinivas.kandagatla@oss.qualcomm.com>
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
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI3MDA2MyBTYWx0ZWRfX1YfOEe4EFQyR
 CiWIgA9QBtZpqil8XP+w4zgVKlPlvMH9ecNqajAZII0EeFkqQJKQJ17Xnjh18Kxe1sfgc/ZhVn0
 OFYu3LflAr+wiZMEHvcSu5GRPjKls0nzDtx8h8JYR+EOcffGP0mZcq2c7Dorpyq0ROmhOwWx/Ly
 F6D6bWLBzeULfmurlxkmYvpjO82rznNnU1HnGhSbBFAdCpOiJ3UP2u0UDJh84GViINUbaUuC4/3
 isC1ZZTa9zvbeH9+70IoI2Jjhjd349MB1SFZx/dgecXSQtdvWYx3Y6xmZwNgtevfvPCTHg/WopE
 hc1SDA7+RTT0T8X8ZV++y+ulG6fzm3Jw5ulTY6svQrhjqWosvU2UyOrHfHWDZbpARsn6b2f7G5C
 Sw4N99BUiMm/N2j8bxcaIyDK9hDTDKuM5Yju5KXKw3iVQkA9IKf9PwGKEGFeajICvUsdRCPH2p2
 rC7JtVz0lvRHrNwGuQQ==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI3MDA2MyBTYWx0ZWRfX8zemMOe/JW65
 BlncFMM2p3gbQdE7guyrGzl3L1kbNfcMy9iDdwRObXox9lvh5c41w7GDVPzxILg6LWyMCwIk/81
 yKx1hZfFTgjrFobLhcCkqCGUFSWM0go=
X-Authority-Analysis: v=2.4 cv=FfiiV5+6 c=1 sm=1 tr=0 ts=6b09a7fe cx=c_pps
 a=UgVkIMxJMSkC9lv97toC5g==:117 a=ZsC4DHZuhs/kKio7QBcDoQ==:17
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22 a=EUspDBNiAAAA:8
 a=HyG63--OPLWJJjisoYgA:9 a=1HOtulTD9v-eNWfpl4qZ:22
X-Proofpoint-GUID: JwkuewxXaIO5sGgQgj1K_YJ_Vs6HQed7
X-Proofpoint-ORIG-GUID: JwkuewxXaIO5sGgQgj1K_YJ_Vs6HQed7
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-27_03,2026-11-27_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 priorityscore=1501 suspectscore=0 lowpriorityscore=0
 clxscore=1015 spamscore=0 impostorscore=0 adultscore=0 bulkscore=0
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2611040001
 definitions=main-2611270063

Enable DisplayPort0/1/2 playback DAIs on the ASUS Zenbook A16.  All
three DP controllers are already enabled on this board.

Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
---
 .../qcom/glymur-asus-zenbook-a16-ux3607oa.dts | 48 +++++++++++++++++++
 1 file changed, 48 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/glymur-asus-zenbook-a16-ux3607oa.dts b/arch/arm64/boot/dts/qcom/glymur-asus-zenbook-a16-ux3607oa.dts
index 3922d3eebdf9..64740ee1e3f9 100644
--- a/arch/arm64/boot/dts/qcom/glymur-asus-zenbook-a16-ux3607oa.dts
+++ b/arch/arm64/boot/dts/qcom/glymur-asus-zenbook-a16-ux3607oa.dts
@@ -343,6 +343,54 @@ platform {
 				sound-dai = <&q6apm>;
 			};
 		};
+
+		displayport-0-dai-link {
+			link-name = "DisplayPort0 Playback";
+
+			cpu {
+				sound-dai = <&q6apmbedai DISPLAY_PORT_RX_0>;
+			};
+
+			codec {
+				sound-dai = <&mdss_dp0>;
+			};
+
+			platform {
+				sound-dai = <&q6apm>;
+			};
+		};
+
+		displayport-1-dai-link {
+			link-name = "DisplayPort1 Playback";
+
+			cpu {
+				sound-dai = <&q6apmbedai DISPLAY_PORT_RX_1>;
+			};
+
+			codec {
+				sound-dai = <&mdss_dp1>;
+			};
+
+			platform {
+				sound-dai = <&q6apm>;
+			};
+		};
+
+		displayport-2-dai-link {
+			link-name = "DisplayPort2 Playback";
+
+			cpu {
+				sound-dai = <&q6apmbedai DISPLAY_PORT_RX_2>;
+			};
+
+			codec {
+				sound-dai = <&mdss_dp2>;
+			};
+
+			platform {
+				sound-dai = <&q6apm>;
+			};
+		};
 	};
 
 	wlan-connector {
-- 
2.53.0

