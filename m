Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BBCDC47ECEE
	for <devicetree@vger.kernel.org>; Thu,  2 Jul 2026 09:51:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782985884; cv=none; b=jU96UbZMbfiJix3z/UqEVIs3MGRW153yzsAOZ8wXZa/UOxRK7x2+N3Rqhk6lu2gwm7hRg6DaSN+SLii0a+qt5bf7uCMCqs+j+ODYeWkWK+gyEIarhNQkJ5f8nvXaLwvOUaVjZD7JXWWCL2V226jOcWNcsi4/DFWYsnbmiu6C1i4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782985884; c=relaxed/simple;
	bh=e/53ppasmjQDhLX9UrUFxxcmkhukY8WHn0fzriW24gw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=l8RuW2CxosC77J96pq5mgCdvt5q2NOkrLlZS8CW71zSFaET190a99ePWTUC5wcKUSyll6aiQkL8OVkY4hSpZJbYhlLWwltGRx0C/u9G1sPgbta7YRCrkEoijhwJkxfAEdMvnqdYO9qIN+FBXjKmEYdc+LiaLtkqhAxZpcgYE+ko=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Yw3gBxy/; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=NQ8TzKgH; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Yw3gBxy/";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="NQ8TzKgH"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6624iDS03591605
	for <devicetree@vger.kernel.org>; Thu, 2 Jul 2026 09:51:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	SPc/msxlXrCzKPXdcDmMWZb2kXigoey6CgHTW67K1z0=; b=Yw3gBxy/qaFa4dH+
	Tfn1XbJUQ/vttb/ZFYStefXAyLCSxr2woTFbL+YNWsw/elbJaH2L3MP5J1yKYjfk
	n4UCYKKQ5L/fdgF4iEmuzu07cbaeIafazZ6J0nP6If9RVKpJZgCApTzDV6sHeevH
	FVDQzCUSIvfSh51Z6kf2CtpbGuCMY0eEPRLF+oW0BxA2rhtWsCSaK7qQhl9MlebJ
	IyZ/MKn6WCtQ+JumtRE7LgrMxUfZW6CP2bYEukq0hnJxkJC5qoFYMtFMnGPYWyAl
	YDis87WA5zbdA4mHb/hIUUmhwYN2lG+2tavroDzw6tOk6RM+J9u51s1WpEyJVw9b
	w+QuhQ==
Received: from mail-pf1-f199.google.com (mail-pf1-f199.google.com [209.85.210.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f5h7n94jr-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Thu, 02 Jul 2026 09:51:23 +0000 (GMT)
Received: by mail-pf1-f199.google.com with SMTP id d2e1a72fcca58-845bc2e658aso1824538b3a.3
        for <devicetree@vger.kernel.org>; Thu, 02 Jul 2026 02:51:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782985882; x=1783590682; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=SPc/msxlXrCzKPXdcDmMWZb2kXigoey6CgHTW67K1z0=;
        b=NQ8TzKgH4WwbceVmmGgjMfalYmwNsVL8yuAWko2HRLuxIcRkpPhjbU3+FHURjL+n9q
         ulYEFZmVJDLf27L+IU3Abxn5n/gDmsg0Ii5HtqXyjgvrOeH2pmRQ0AdG1nkWN9Q2RREB
         dJutyFBy2zZgqtyy00tOPaYPgvFCPmlZlVC7GKtK5eyUwG8kMT3zn2ZesQGT4poqiPwl
         XRpBRSjYkPgzY9coq1fBqpGRZ0HeQJFqCjl5jOSfcvVR50Krs7IW5GJ/ekkm5RbzBMF/
         Gq7Co+XqCPd6o2NwPsmiHWs4v4RIU4VZ5hO7if3QrAN1wRCcZJjXG4WvbxA4jiM66l/U
         oI7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782985882; x=1783590682;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=SPc/msxlXrCzKPXdcDmMWZb2kXigoey6CgHTW67K1z0=;
        b=NDj+x2H+X8aaWyW05bhUYi7oHSojr02sFrFu9jeO1uBkMIJ3lbFZ+JT8W+ni6Bf01A
         GKBjNSWyElr1PPDlLURp/OBc9+ezsCPTt1CjIyqpD5F5giZcrGFCz6cndPAyam63QOqE
         HyO/+8/FKTp5EPl0DlV4zeRMEZNROgfWH9fHyffN0fuo3+2XLmNY4skHEBetNq+fT7aN
         HCfktir3wsKgj0FFrcsyWyoYdARSp/TYd6MXaka6gQX/C6stye1D0aTI62x0QTKrwrFP
         fVXV7b31XbixxMyuSgD2QUwhgH4iqC4Uye6Rr93zVN+EtEPikUxakXZ9W/u4o+9LNoW7
         kypw==
X-Forwarded-Encrypted: i=1; AFNElJ/zC9N3lWlkodZ2rRqEF3MabC6zuZ1UZbLNNWD7Af3MTtIwCsMFsw5ksE70g4gyDc2jPSAJ3QRerILn@vger.kernel.org
X-Gm-Message-State: AOJu0YzGN9d8MEqefCLW7y2I0sKNd7xvmpQ/lUALA18VJOUvUv5l/9Sf
	PEfgiRCB2TkjdMgXD5TQp/QnAS7UieAMoVo6L5sUysVW0Ov+d1VaP5tTUB5Zj03MNLziySnt58O
	b76SD4rnBDOpQSRioO7rrIhvEFVJEbtiLL+DPMN1ClQNrqqnnoJ5rJAr+aDzxBBxN
X-Gm-Gg: AfdE7ckPTsfJGC582DEY1C0e2RQKtTylQWCRM+IqWDEzgPB4eH87XpibvEgqnbuuV+M
	PCLf9CkG1b0Y+9idi6wFsXwL4O/NnS95ATHMgywEE3HrAoqu9wW2hRt+UtCT1nmTTamboR4gdMZ
	9SDR2zo6VZXHRZmKwQqguptZIGEzNVSE0STDYuXSWbmwrGIMD3b9q46Ia8G7lPUtDNfCJDLyxJf
	ItyEoj4SJ1bxzWx6EI99VABajcF9QWZnDy8W1rG68cox0onBDyYOH8kGBw/NKdll4aPuWjLaTLT
	BABwbIFgOXTfE7SDOQ/bgORaNvoFNj6pcuzjoPxBHSvRW8G4e5zQEEPfozKl8jt/jKr85H4KI3/
	l92R2OsRbb3ACxMzlYGwdIl9L3w==
X-Received: by 2002:a05:6a00:414f:b0:847:70aa:9586 with SMTP id d2e1a72fcca58-847c5039b2dmr3974092b3a.16.1782985882508;
        Thu, 02 Jul 2026 02:51:22 -0700 (PDT)
X-Received: by 2002:a05:6a00:414f:b0:847:70aa:9586 with SMTP id d2e1a72fcca58-847c5039b2dmr3974061b3a.16.1782985881965;
        Thu, 02 Jul 2026 02:51:21 -0700 (PDT)
Received: from [10.213.101.118] ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-847cb78ee2esm1110051b3a.24.2026.07.02.02.51.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 02 Jul 2026 02:51:21 -0700 (PDT)
From: Komal Bajaj <komal.bajaj@oss.qualcomm.com>
Date: Thu, 02 Jul 2026 15:20:47 +0530
Subject: [PATCH v5 05/11] arm64: dts: qcom: shikra: Add SMP2P nodes
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260702-shikra-dt-m1-v5-5-f911ac92720c@oss.qualcomm.com>
References: <20260702-shikra-dt-m1-v5-0-f911ac92720c@oss.qualcomm.com>
In-Reply-To: <20260702-shikra-dt-m1-v5-0-f911ac92720c@oss.qualcomm.com>
To: Vinod Koul <vkoul@kernel.org>, Frank Li <Frank.Li@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Georgi Djakov <djakov@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, dmaengine@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-pm@vger.kernel.org, Komal Bajaj <komal.bajaj@oss.qualcomm.com>,
        Vishnu Santhosh <vishnu.santhosh@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1782985846; l=2278;
 i=komal.bajaj@oss.qualcomm.com; s=20250710; h=from:subject:message-id;
 bh=hmVT5ofK8zwiQvsflk7zqxSXAxUYKjFkgql5IFtSC8w=;
 b=UUSxe3NJLLmIApgaXx5GkBeJaNMHr7bSNKM614yCy+C3BB9RFjpaBNAOSmXHLYDjG69ENhXdO
 JAbwv86STRHCcOZ70kNRZ5XKWhyNLI+BqvFRcgF4VJp7eKEawB5RW+D
X-Developer-Key: i=komal.bajaj@oss.qualcomm.com; a=ed25519;
 pk=wKh8mgDh+ePUZ4IIvpBhQOqf16/KvuQHvSvHK20LXNU=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzAyMDEwMSBTYWx0ZWRfXyvRQkYwzj3YI
 S3k83/1v1+yXn9pdzziaaSJ1Jue0QSZDWwc6tBxF80EWE0ChACGmVyreK1vtsIgHWybIYndq8Ln
 +yCelrYLk3vDcgVUn5MgHOhPRNkRpegDXsbPxTRS/Y+/V5Ncr1EZsPI8HQI4YsMth9c7359rGhc
 6tnQypA+xXXwjXJWWk71cyHI53cqP+9UzqZ5I2VL2weqQ8d9pAE/m8uBk9ynO6B1nu03jLvoCY7
 qPVZ0VoyRnU4NXJ2Y27KxZ7UkHleLXpjnFUBPgclrZtEiFyFWnrjabfWkqusSB50d82TJBDVF9T
 R4j/pTNw0A+dC590AFoI78G+4QDvhC2MD+1qu+7MYEu45xSaLtvySrAmD5h+Tvr+x/TK48nNOlp
 dLFk9iWNih83hhAqgBS/LymydtQ4+nd8D/3Mp3DOTwmZUXLAcYxCabCKVlii18HciACfpxdxdiW
 cPpMSMeMPidj5SP+e1A==
X-Proofpoint-ORIG-GUID: J6mxlhLDc2XQ6SEbw-IYxjuJliKjYe34
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzAyMDEwMSBTYWx0ZWRfX9VDbNfbUjdJK
 OPFalkkTuSq2CqVvZ6aZpxfBpuCJmCAz3T0MZZ1iq7TUDU2s9iGJCCBx3WB6IFPiuIlpXCmPOQ6
 RWT/Dpf9mrZduQZUiQy//sDExZVU9qM=
X-Proofpoint-GUID: J6mxlhLDc2XQ6SEbw-IYxjuJliKjYe34
X-Authority-Analysis: v=2.4 cv=WMBPmHsR c=1 sm=1 tr=0 ts=6a46349b cx=c_pps
 a=WW5sKcV1LcKqjgzy2JUPuA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=EUspDBNiAAAA:8 a=EkeGX7dVun7IgMBPpHMA:9 a=QEXdDO2ut3YA:10
 a=OpyuDcXvxspvyRM73sMx:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-07-02_01,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 phishscore=0 suspectscore=0 lowpriorityscore=0 bulkscore=0
 spamscore=0 priorityscore=1501 adultscore=0 impostorscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607020101

From: Vishnu Santhosh <vishnu.santhosh@oss.qualcomm.com>

Add SMP2P nodes for the cdsp, modem and lmcu subsystems to enable
inter-processor signalling for remoteproc state management.

Signed-off-by: Vishnu Santhosh <vishnu.santhosh@oss.qualcomm.com>
Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Signed-off-by: Komal Bajaj <komal.bajaj@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/shikra.dtsi | 69 ++++++++++++++++++++++++++++++++++++
 1 file changed, 69 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/shikra.dtsi b/arch/arm64/boot/dts/qcom/shikra.dtsi
index 26ae21d4c7e3..53dddf35963e 100644
--- a/arch/arm64/boot/dts/qcom/shikra.dtsi
+++ b/arch/arm64/boot/dts/qcom/shikra.dtsi
@@ -428,6 +428,75 @@ lmcu_dtb_mem: lmcu-dtb@b4702000 {
 		};
 	};
 
+	smp2p-cdsp {
+		compatible = "qcom,smp2p";
+		qcom,smem = <94>, <432>;
+
+		interrupts = <GIC_SPI 263 IRQ_TYPE_EDGE_RISING 0>;
+
+		mboxes = <&apcs_glb 6>;
+
+		qcom,local-pid = <0>;
+		qcom,remote-pid = <5>;
+
+		cdsp_smp2p_out: master-kernel {
+			qcom,entry-name = "master-kernel";
+			#qcom,smem-state-cells = <1>;
+		};
+
+		cdsp_smp2p_in: slave-kernel {
+			qcom,entry-name = "slave-kernel";
+			interrupt-controller;
+			#interrupt-cells = <2>;
+		};
+	};
+
+	smp2p-lmcu {
+		compatible = "qcom,smp2p";
+		qcom,smem = <617>, <616>;
+
+		interrupts = <GIC_SPI 287 IRQ_TYPE_EDGE_RISING 0>;
+
+		mboxes = <&apcs_glb 10>;
+
+		qcom,local-pid = <0>;
+		qcom,remote-pid = <26>;
+
+		lmcu_smp2p_out: master-kernel {
+			qcom,entry-name = "master-kernel";
+			#qcom,smem-state-cells = <1>;
+		};
+
+		lmcu_smp2p_in: slave-kernel {
+			qcom,entry-name = "slave-kernel";
+			interrupt-controller;
+			#interrupt-cells = <2>;
+		};
+	};
+
+	smp2p-mpss {
+		compatible = "qcom,smp2p";
+		qcom,smem = <435>, <428>;
+
+		interrupts = <GIC_SPI 70 IRQ_TYPE_EDGE_RISING 0>;
+
+		mboxes = <&apcs_glb 14>;
+
+		qcom,local-pid = <0>;
+		qcom,remote-pid = <1>;
+
+		modem_smp2p_out: master-kernel {
+			qcom,entry-name = "master-kernel";
+			#qcom,smem-state-cells = <1>;
+		};
+
+		modem_smp2p_in: slave-kernel {
+			qcom,entry-name = "slave-kernel";
+			interrupt-controller;
+			#interrupt-cells = <2>;
+		};
+	};
+
 	soc: soc@0 {
 		compatible = "simple-bus";
 

-- 
2.34.1

