Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E538D3B47F6
	for <devicetree@vger.kernel.org>; Thu, 23 Jul 2026 12:47:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784810863; cv=none; b=BZvgCyiWjIIFp9LxsE5ePipoCdpK/OVTJLgeNewWwlZoajXDVKlrRsI3RPS2rGeFZeQ+FFw9JOp0uY4cGOfwLYWkOP8+ntFl/4Ko2W/mY7vGsf6frpp00N5zJKl4FFvLNDXrtlSj18M+P10gsALsrUxEME42fohjMcbMxOQ1XA8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784810863; c=relaxed/simple;
	bh=RuKd6I+SEIvl++KtfhProHr7kAtMUq89Gwuo4zio25s=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=nT9nBboVvyMrymSrJbrYonebdhrwr7Pwv2Hy0jFf+dKH5WQaZQasKq7IKSPf8jEUXphXZMNJBptzv73z7/cMNYqR3zhxmkQISBu2cEPepwFIuwyWh0yeU76YYhtIqMJ5VcAl7PSpgk/MavSKup0u1FqUM3/gfD4mo1QIpAMcjuk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Xm8G/YSB; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=LRG9j2Ih; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Xm8G/YSB";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="LRG9j2Ih"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66N8qYkj467250
	for <devicetree@vger.kernel.org>; Thu, 23 Jul 2026 12:47:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	TA8e9C1CpVZggYts/oGX6GakTmtk0RCSwjXNhQPFiak=; b=Xm8G/YSBU5tAKn2/
	q3tD33HK7DYGubU52bVoiFp37xpqabvI4Uoonw3FtLPpcMZq4R/rgyVE+M1HHKxS
	OpMTNq0Bb0HJi5bgXXz5TudcAlHlIIq9TUNszietzM8ib6cr5Sx+uU6ED7REGKnh
	1tIxS1d7X/Qx4b7Ok/GkqcrV08DknSxdIRcihmDRSULxBJcFO2sLCTFoL/lqGtVz
	UCvvJBaGaA9zg9JKTMsGAH9kKyH1cX/WhKv7pxiqWA6WB+SXV+5y3i1f/jZDX3mQ
	P4+YloIGeRiwMqj4RiOXJC69YOLMYIa7QoXKOB3KlT7YWPjdcgK2kW7rnIYzKx5C
	TLNALw==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fk28xv48h-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Thu, 23 Jul 2026 12:47:41 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-51c12e43b98so12617201cf.1
        for <devicetree@vger.kernel.org>; Thu, 23 Jul 2026 05:47:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784810860; x=1785415660; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=TA8e9C1CpVZggYts/oGX6GakTmtk0RCSwjXNhQPFiak=;
        b=LRG9j2IhdaavklVREWBVZPP+BP2+UsDf9HRBqGiI7Ou7uR44Nuc0ObIIpDRnDEdyLj
         a3YoD9R0gdihRyGeqFP6YDJdL5ur+gJ+3J0VmlNEj/glRVVZ47XY14A5+CokcJ8ObgeX
         TlST1kijdfeZ3QJhFE0572xlVKy7U47qyYutipaOvwsm/ejosQMQ7MColM4EiHPuIemj
         yu1ohDlC7j3qF8ysBHLmi9+Jrzt5f1aVQZrljIUISegBsOIeiiyoTMYmdIcYUvdO+1xW
         W/OwXbqG+ZKJHry64w7rQFhIolQN8IvWIu75CJhxL1eEWGvgYIenB2hH+WyL9E3QpNFf
         aDzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784810860; x=1785415660;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=TA8e9C1CpVZggYts/oGX6GakTmtk0RCSwjXNhQPFiak=;
        b=UKWWSfi3gxFc1G4vKO0s6JbvvqIHaywhTS+zKx9xmT3Z2Rf8mfuVDpdHyKNuUlFfIw
         rORF7NI953IBOg7haNx0ZCfV2V0NifCrjItf9vWeysSRmRTKwDAknjJkiZjFcLBGk4A+
         m3dR65R2OsvN5/shUh9YIiz2PmRQ8LBVrR0SCl6H79no+LEET9v019itPwVmx8EBRqpF
         QzFTXxyqV/gBpyclHEvgDqqxzbJVcqR6RWUy3jiM+6jJZt2IjUdoYFuovsS5Bu8xsjND
         w348Dthi7TVylbiz/nzolHLEiciUp8nd7nFepJKoq/5Xjt37a1iByDG8O3j3y/xqfGEe
         Xzzw==
X-Forwarded-Encrypted: i=1; AHgh+RqKv3RAv/7mEfRs1zzWL4nFYi5YbUIQ0RdONaYWSfmHe0WL+31MtYRkZgRNgiRrpiEzTouDRWRa6Nd8@vger.kernel.org
X-Gm-Message-State: AOJu0Yyqi/17/W5JtNam4E0GOiKlBHPvnmkmeZiJBu9bSLaZ+5XY73cy
	hk7M39gP0fX2iyFtYAaq77LhQBHKgqefEtxW79fZM32gTkijwQVkhCl0aSSEt2wJ54TytRnKCbj
	fFPyHmM5DmrbfbinpBjTGihr1E7kLs/7zULSsX4qw7Na+tOmeWBY1k/yCxc1XiqBx
X-Gm-Gg: AR+sD12q2/k3T0aeVCB2gTRx3udyV4DopieLCAftlawtPcAdgFwK8h3BfYq4J8YqBHo
	plKhZpR6if/7RrhGIBDGKC86NMKRfilCvJn4TDYY2P4ExHXGVUcamVdYIi8DkytrPeHNS8syamw
	viNs59CIXUI8Z880olIhrKrE+we7L3ktWeddJLMZk9Qz9aORyvUerzoM7V2wvH/fJxdYAGjtFua
	rgNo9980VgJKbD1H+l36rvFSZP7NtyB9Ukg9CLsyUsxjMhWeRWosgCymK14+o1wmr4nb3EfbtaA
	gBIGkGabXFZWyvNCbcGQJRpsETr09MKpSUJHJHN4Np7aZR9hx+EmQeG9CAgbS3pPvjKCRg1YXe5
	uhDL7fy9/
X-Received: by 2002:a05:622a:2512:b0:51c:1f97:e852 with SMTP id d75a77b69052e-5283ddb3ec6mr26487481cf.6.1784810860143;
        Thu, 23 Jul 2026 05:47:40 -0700 (PDT)
X-Received: by 2002:a05:622a:2512:b0:51c:1f97:e852 with SMTP id d75a77b69052e-5283ddb3ec6mr26487071cf.6.1784810859523;
        Thu, 23 Jul 2026 05:47:39 -0700 (PDT)
Received: from hackbox.lan ([86.121.163.114])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47f85c531afsm14814283f8f.24.2026.07.23.05.47.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 Jul 2026 05:47:38 -0700 (PDT)
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
Date: Thu, 23 Jul 2026 15:47:26 +0300
Subject: [PATCH v3 1/3] arm64: dts: qcom: eliza: Describe the CDSP
 remoteproc
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260723-dts-qcom-eliza-add-cdsp-v3-1-b535200996ed@oss.qualcomm.com>
References: <20260723-dts-qcom-eliza-add-cdsp-v3-0-b535200996ed@oss.qualcomm.com>
In-Reply-To: <20260723-dts-qcom-eliza-add-cdsp-v3-0-b535200996ed@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, Abel Vesa <abel.vesa@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.16-dev-0e65f
X-Developer-Signature: v=1; a=openpgp-sha256; l=2954;
 i=abel.vesa@oss.qualcomm.com; h=from:subject:message-id;
 bh=RuKd6I+SEIvl++KtfhProHr7kAtMUq89Gwuo4zio25s=;
 b=owEBbQKS/ZANAwAKARtfRMkAlRVWAcsmYgBqYg1kOkSjwoStAHoJXa1dSALkJ2VLXZ3Q/Ns+K
 YeafO98MWiJAjMEAAEKAB0WIQRO8+4RTnqPKsqn0bgbX0TJAJUVVgUCamINZAAKCRAbX0TJAJUV
 Vm0pD/4uc7K2wiKrwtxmGjwg9r4zWGWlKGKaXMdiCcb4qlMi1l+52/h2UFj0VjsPasIW1cbJPpj
 PPyna6cjHdl9H3ILI+Mt2XtcEEOcIQQzB7meQNVwCkU4JsMBbHW8e3DvdeuN9HhtcnP2azmxXkY
 sxFU/OyEWx+zBATQnzcWfgD/mJ6vt6sv7tmAgpy+Hp64Y+0Ob+9jQojJUu04F7ULASBFlHYAwJa
 m7div8XGzerN2VZibRxkcdUkcgn7p5a9mYn02tQUcOx8Tf5NXDSpckqMwcFKGBL2A/Ed6jpESKp
 5ZjCzDlAPUayBmcgI7BZzoUHRR2XZV001Z/LhUzcahfaeGfxol8q/ZifZgPLabNEqzTfbgV79MH
 NC5bOdqeljLqifIMM2lKX6357sPjY0PSvaitGD3R17hfN8+09EsZafZYUiT9OgfWkmFXXq0mFiI
 EpvRoB9ZH48gQxxjhZNxitBoWJMGTVLqxDk/dNWor+e/VgtF87rOKT3LIdgoZwrhvxSWO4uXmFO
 hXKn+pT7LdPVlc4DrK49Aq4eSc/ZrWm97JYEaujvMJR6MNUP0vPZy65UR6hnp+smJpIUFFtszD3
 zGRc6DWZNc/JJF09SpEncIDXdpm003c4jc2p99cNBSBgmjYEkZpTnAk5XdPf2tSospdPEtTehj4
 uYhhPZVf/7cJffg==
X-Developer-Key: i=abel.vesa@oss.qualcomm.com; a=openpgp;
 fpr=6AFF162D57F4223A8770EF5AF7BF214136F41FAE
X-Proofpoint-ORIG-GUID: M3RMJlghf8-zcndRedR81y0UZ3aboOTN
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzIzMDEyNiBTYWx0ZWRfXw8I987ZRik88
 AuXOtPVCbvhiuuRVDPJ3vFIax9vT+WxOLxiwPAYJBkZtyGFnI6wH5/eHX31W6ulnJZNID/uoG18
 Nmj7g+b5ZQmEvxEZ0RKdLOfKpHIvBwA=
X-Proofpoint-GUID: M3RMJlghf8-zcndRedR81y0UZ3aboOTN
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzIzMDEyNiBTYWx0ZWRfX9j4Syi9l6iyJ
 RyJMvHAvae//OWjXvvU0xk30icXgXOS0lFJt04c/P6PQt3rD1Xhh/SvmcLxf5i7WiBQog6t28IT
 fOEqGXUia9iHokOE/EBjaGuhSrHDhXamBailcHWi97PWRyaEMwU5GBzN9tBxOQHYbDGtCPPm3Rp
 RR+omtcNS5au4f2C3GBpy7eP2bj8fgMfrNV7xYk3kv57SJQtoGE8eGmJE6iv7UugAO2O5492Xam
 dMVYW3BUzT8m38I2vVE75VQ+hDOIoEI9qwGqAiRpoGsQJG1iJEUmPamREv4hCQ3n2CkUTwGkUlI
 40LE5MqIV+A+uH2WbWpSjTXwQkeWiM29CjZb8yhmLusiSnTPWM5/fcKJv+2YVGxsHK6ogg9zMb4
 Lhha0O0fN3mu9zVnoB6NZmPI3EM+Qn6TcOoUqUi5RdP2ZJ/qppvz5a136i+7rgSg/Ks04peb3ly
 E/rVBSbzaTeVf5I1sEQ==
X-Authority-Analysis: v=2.4 cv=WNxPmHsR c=1 sm=1 tr=0 ts=6a620d6d cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=6dw9+iwJWV8PcCi9M4lOBg==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=EUspDBNiAAAA:8 a=2GlqV2yqP6Fn-iQxV0EA:9 a=fTrgFlXldL-EUvLj:21
 a=QEXdDO2ut3YA:10 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-23_03,2026-07-22_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 bulkscore=0 priorityscore=1501 malwarescore=0 phishscore=0
 impostorscore=0 suspectscore=0 clxscore=1015 spamscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607230126

Describe the CDSP remoteproc along with the glink-edge subnode and the
related SMP2P. FastRPC subnode will be added later.

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Signed-off-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/eliza.dtsi | 75 +++++++++++++++++++++++++++++++++++++
 1 file changed, 75 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/eliza.dtsi b/arch/arm64/boot/dts/qcom/eliza.dtsi
index 357e8066c176..e38a1d94fbe2 100644
--- a/arch/arm64/boot/dts/qcom/eliza.dtsi
+++ b/arch/arm64/boot/dts/qcom/eliza.dtsi
@@ -626,6 +626,30 @@ smp2p_adsp_in: slave-kernel {
 		};
 	};
 
+	smp2p-cdsp {
+		compatible = "qcom,smp2p";
+		qcom,smem = <94>, <432>;
+		interrupts-extended = <&ipcc IPCC_CLIENT_CDSP
+					     IPCC_MPROC_SIGNAL_SMP2P
+					     IRQ_TYPE_EDGE_RISING>;
+		mboxes = <&ipcc IPCC_CLIENT_CDSP
+				IPCC_MPROC_SIGNAL_SMP2P>;
+
+		qcom,local-pid = <0>;
+		qcom,remote-pid = <5>;
+
+		smp2p_cdsp_out: master-kernel {
+			qcom,entry-name = "master-kernel";
+			#qcom,smem-state-cells = <1>;
+		};
+
+		smp2p_cdsp_in: slave-kernel {
+			qcom,entry-name = "slave-kernel";
+			interrupt-controller;
+			#interrupt-cells = <2>;
+		};
+	};
+
 	soc: soc@0 {
 		compatible = "simple-bus";
 
@@ -3737,6 +3761,57 @@ nsp_noc: interconnect@320c0000 {
 			qcom,bcm-voters = <&apps_bcm_voter>;
 			#interconnect-cells = <2>;
 		};
+
+		remoteproc_cdsp: remoteproc@32300000 {
+			compatible = "qcom,eliza-cdsp-pas";
+			reg = <0x0 0x32300000 0x0 0x10000>;
+
+			interrupts-extended = <&intc GIC_SPI 578 IRQ_TYPE_EDGE_RISING>,
+					      <&smp2p_cdsp_in 0 IRQ_TYPE_EDGE_RISING>,
+					      <&smp2p_cdsp_in 1 IRQ_TYPE_EDGE_RISING>,
+					      <&smp2p_cdsp_in 2 IRQ_TYPE_EDGE_RISING>,
+					      <&smp2p_cdsp_in 3 IRQ_TYPE_EDGE_RISING>,
+					      <&smp2p_cdsp_in 7 IRQ_TYPE_EDGE_RISING>;
+			interrupt-names = "wdog",
+					  "fatal",
+					  "ready",
+					  "handover",
+					  "stop-ack",
+					  "shutdown-ack";
+
+			clocks = <&rpmhcc RPMH_CXO_CLK>;
+			clock-names = "xo";
+
+			power-domains = <&rpmhpd RPMHPD_CX>,
+					<&rpmhpd RPMHPD_MX>,
+					<&rpmhpd RPMHPD_NSP>;
+			power-domain-names = "cx",
+					     "mx",
+					     "nsp";
+
+			interconnects = <&nsp_noc MASTER_CDSP_PROC QCOM_ICC_TAG_ALWAYS
+					 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>;
+
+			memory-region = <&cdsp_mem>, <&q6_cdsp_dtb_mem>, <&global_sync_mem>;
+
+			qcom,qmp = <&aoss_qmp>;
+
+			qcom,smem-states = <&smp2p_cdsp_out 0>;
+			qcom,smem-state-names = "stop";
+
+			status = "disabled";
+
+			glink-edge {
+				interrupts-extended = <&ipcc IPCC_CLIENT_CDSP
+							     IPCC_MPROC_SIGNAL_GLINK_QMP
+							     IRQ_TYPE_EDGE_RISING>;
+				mboxes = <&ipcc IPCC_CLIENT_CDSP
+						IPCC_MPROC_SIGNAL_GLINK_QMP>;
+
+				label = "cdsp";
+				qcom,remote-pid = <5>;
+			};
+		};
 	};
 
 	thermal-zones {

-- 
2.54.0

