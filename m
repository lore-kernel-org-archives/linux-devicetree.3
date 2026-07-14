Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F0790472794
	for <devicetree@vger.kernel.org>; Tue, 14 Jul 2026 13:06:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784034386; cv=none; b=VS4D560Bd4z0Y8rdPR2STlJSuGoms7aen7TDGOAj3Px10aa9N3C9uPURZNQEj2Zds6T8x8D4bTlqw4cvpETRiW1DjTkP7maS8QGMcS8Z2s3nOjVkKqb/eph33Ml4NhIFGY040hewcaXiGIxEiCSyF+amp3c6FSfYGv8hZYzQNTQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784034386; c=relaxed/simple;
	bh=ad8q6nsg5XR5gFJZLjmNhpkUUdvZwCTtsA9xX/W7JQM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=SQ2kccGlZ8RqR6FE2zU4liH8S5OVwdUe0nbbm7Ghhgn9Hq2hENji7DERfKmabAUAO873SaSCQQHfpGZ3/frU/vhQ+ArrOHPR6/EOma3oifix64FL9ldFChbqpt6QYvGfvaRWeDAvPg7RacLpHuLLpU8HcjoUSIYDvRkrK1Dz8xQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=a4LgA73n; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=iy4W2bCt; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="a4LgA73n";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="iy4W2bCt"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66EBO9AC234387
	for <devicetree@vger.kernel.org>; Tue, 14 Jul 2026 13:06:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	nGInOmivzMPVkLPseyHlX6e4mIIRapTk96h9wvj3+ls=; b=a4LgA73nIGAuIWPi
	ob4zAkQV+/BARVUdLY8xducV22J2f2xzhuDKPzDOi+LFtwEryM4WgpIrmnYgH3xN
	beXUaFeyCJ5ZDk+o5wxBG+McB4UVC3K8UekCQj1wJiptLgMbR1vPflDQMiUiuN9+
	JlEggb79vYCpniYmdKRBedtGLWx4IpC3tJsqlF5OXrcYZ4mCBHr4pmrLZ8PFFPaB
	Jb/KPrh/WCNraholqtmhP/b6rlEgAOBt/JKAC3DNByRo5tXfmJyaQ/QGV5mK3CnE
	HISyXYtViFEMKBL1T+6oENCx9k2+yKq6plFzRn+9Xpcdum5WMzhb/tyHI+LKOIh7
	Dl35YQ==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fdde0a39s-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 14 Jul 2026 13:06:23 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-51a87ef9713so8913961cf.1
        for <devicetree@vger.kernel.org>; Tue, 14 Jul 2026 06:06:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784034383; x=1784639183; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=nGInOmivzMPVkLPseyHlX6e4mIIRapTk96h9wvj3+ls=;
        b=iy4W2bCt7WtgW9SqF3EKH+cbIEpk5pnMz4P70vv35T62xgrApgXuXQtPodQReS9tjd
         sLm9UF/DAqWTRXCKECGdnNO+rmhK5ebURZfnkc0rhLOexZFNwKy5TIBshkRNLmnE+PWu
         CSjdl6s/Rx8gbU+xjXUhGms2WSCB++IivBV+CH6/2s9VXsHItIPMIc2oUFhPHQvDA5VR
         D9F4jKy37zvqNUOpr6h8Tgx9lPH5zzqArWHYrsPSLeYfO6mJ75iRHsXNUnq+qGkyvZIT
         FKkmaRS+WxTl0hpl/57uaFGcV/7hk3kq0VECsTwtVdo5MSGVJ5je3RTf/qw+f1IWqw/w
         2nSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784034383; x=1784639183;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=nGInOmivzMPVkLPseyHlX6e4mIIRapTk96h9wvj3+ls=;
        b=TNLgXP6Y5XdmriT9RRed44476ue9Pm5zIuUWO++f0Z9Ct97VzRBz3iJmXLqMf6XZ1u
         qWOi7jyaHGr8+Mh5oBms7Ysy+CMTR2pWrfgtKG23dHY0yUb2GbqNcFjbyIT/4kKxezxb
         /xS6G1SJz8ptWAGUItGyJQnHtNtDsk5VsDtW7pLxTMkNRRzs0s6ElivHiAGbMMctPU1j
         VHkqvW5CY71sRmcBqLcXm0dp4fUdi3FNG+7MPbMcGYXcrzL3gDR8sIeEvTOAA+JCCL1R
         ZFVfryYgyTI6RTDW/al1J3ucHcs/A+stPoZcIVVB4HWurdRsLlhg2KePrpBXWBqbJwVZ
         0gUg==
X-Forwarded-Encrypted: i=1; AHgh+Rrrtg42ZsAXsT2EFaORCd7ixLSMo5fIUlgkeSiHebpjhcWzFYc8WkacJBkMlqQmYWAiFzTGnWnJxvxU@vger.kernel.org
X-Gm-Message-State: AOJu0YyNSq/i85u2P03SyGdOssZzAMp2jzqB0atRULED+GZFgPU9PGfr
	fVhU3JbwADRJ9c2YTQr/XKOA9iWcuXXdv+ZjBmQu0mBs5OypQMhldJRvIm9DSZaLLEUM9bXaBCh
	RYOruoa5sJPzwcjJLrwDg0td/w0BWYRfKnyfEr5NrpPDeoQfxPiEHy6+Cq7apbBHW
X-Gm-Gg: AfdE7ckqUXOGp/gVU4NBgdJSYzP54ZqkRiG2vNVit3iH0bv69HhCX9/BQamNSFFo3E/
	gi57RKXAIZegzfeByqrzbdbs4c4NJOcCnOublVoVpsIiNBGd6Seh9x/7rEmhTVKo/c5YRC9UzTD
	HY7ITECjOvIDuUpdkUMltXw5X38Rq3pxTtt6u2M95Yt16iCwINNjXIER1S2SPV7imd5Y8vliwRm
	tVX/8sX+bqq7PQF3XQCuH5PXGmwSD8/NbqmLJHHXpmMlZzeP0vShSVstEoaaZaE2TQDXFQgTW32
	xzoibyvWGoOL8dSOy01jJ/H6wt/pdSTbCWtRVdBwytKEYKZuM6cT5zNu3nnIGoe+8y0ybqT1DLq
	/200OPvi3ljTbODU=
X-Received: by 2002:ac8:5f84:0:b0:50e:474a:47e1 with SMTP id d75a77b69052e-51caa0899b2mr173879631cf.10.1784034382837;
        Tue, 14 Jul 2026 06:06:22 -0700 (PDT)
X-Received: by 2002:ac8:5f84:0:b0:50e:474a:47e1 with SMTP id d75a77b69052e-51caa0899b2mr173879201cf.10.1784034382249;
        Tue, 14 Jul 2026 06:06:22 -0700 (PDT)
Received: from hackbox.lan ([5.12.73.156])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47f47688f29sm6323742f8f.21.2026.07.14.06.06.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Jul 2026 06:06:21 -0700 (PDT)
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
Date: Tue, 14 Jul 2026 16:06:08 +0300
Subject: [PATCH 1/3] arm64: dts: qcom: eliza: Describe the CDSP remoteproc
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260714-dts-qcom-eliza-add-cdsp-v1-1-525e757a23b0@oss.qualcomm.com>
References: <20260714-dts-qcom-eliza-add-cdsp-v1-0-525e757a23b0@oss.qualcomm.com>
In-Reply-To: <20260714-dts-qcom-eliza-add-cdsp-v1-0-525e757a23b0@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, Abel Vesa <abel.vesa@oss.qualcomm.com>
X-Mailer: b4 0.15-dev-bc6c4
X-Developer-Signature: v=1; a=openpgp-sha256; l=2537;
 i=abel.vesa@oss.qualcomm.com; h=from:subject:message-id;
 bh=ad8q6nsg5XR5gFJZLjmNhpkUUdvZwCTtsA9xX/W7JQM=;
 b=owEBbQKS/ZANAwAKARtfRMkAlRVWAcsmYgBqVjRG7R7bXfNncWPOW/Ai9ezQ3B+s3QvIisRQP
 yXPI1We4LmJAjMEAAEKAB0WIQRO8+4RTnqPKsqn0bgbX0TJAJUVVgUCalY0RgAKCRAbX0TJAJUV
 VtzOD/9AecuqS0ePHiqLCmIjAgQq2ukJqKUreuL+u8H/A1ux+nQQL7OSJysHmKXKJ//rFpQJn5m
 LeTRoMXhDQByJux7IfndVhxuwngK2bRs1FrXil8ZffFjr9gGr6CkLM7wGrJgJU0qVy0WVIJfg+O
 YXJ7N9IHNVOVkJX3Jje8gouBfrLjyZ5R+sqGP0NPhC9ARZFTO2tJPW/biG6xikeTZcJXB9dp8LC
 6pDY1ghXO2ceoZwE18tQjXYRl56mS0HGZ1p4FuRX/OVyuCuEnsbpgDN9QrKsJslPNmdx5F+6l+w
 hS8Ev77pCy++qn32HkfJcpzyfm4SI+hWYdBOg+wJSlOucbE+TcYo7sOjoqt/Ic8zJmSp5uahTEs
 rAQUJER8zpWO7WRCuAfeIec09WaxJMuDrIbTyg2EXwVjqPISTErJJ7ec1NiU/uK3OOUVur69jDK
 IokVb4ls5Q3WhIuake/cd36dvb2qNCb9ygltcllt0BvdlcDEWo9Z2J2Es2PAVuOdIEflJUSGybf
 iyX07Ouk6sU3OcqT5vp3w7k1KNvK2LGC/LYSg4u+v3J8qIyai4mw1I8oq2NoUi5rcqH0o+eO+1j
 C8QQGfAHZBA1B5Zj0jSH/4m+HD789WiKjIRBGUwyYBV/qUXf7tjuasux8a8sCxeNHXCei23HpHp
 UJRQiBt3autN0JA==
X-Developer-Key: i=abel.vesa@oss.qualcomm.com; a=openpgp;
 fpr=6AFF162D57F4223A8770EF5AF7BF214136F41FAE
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzE0MDEzNiBTYWx0ZWRfXxJqEq4tjt0l+
 waat/q5xajx5TgJ8kK3F1sCmZ3770AlCMHcnb1nuqja1bvjng/OAYQPPGWQzZKaFnpwt/c+fnos
 GAAfQa0W8HJWOB0CYqVhBbqX4OzHAHM=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzE0MDEzNiBTYWx0ZWRfX9g+jnmrdVLEs
 FS//0DspOYXVro3aggxMUUmE/dpVd6gNx8kFxIcJ+yUq9T5FMcsj8owDRWbpwVxD+xkwz1luGJc
 bnq5bf+dp5YeGBBAjfyAMrFLA/DSIQkQILfEpkp++GLJfD4fXKWs8DVBVjt6nBzY4nGaK7jtDMm
 xG57ADJaL7l+m9P3reRcq09TnGt7vtmcA40ZqYFIC4xvu4q+tF/L0vZRGO0J2CLBgLmivDsi30c
 p1DCOMxMbkvRP6pUHdAIRV7wjDoPS+EV746z8KiN5tktjdhyBQ0JJpneiyRy/w5xE/cSPdPd5R9
 Gij6bWUKtOqZbrgySef3wcHJDfJekulwwNqYIfXTKfi+Yk0uEXSFIFHWywIVGTs2gjsrAQjn+Sk
 FWUuxQYAz0+Sw3OEjvaMJFum/Ci3dWTk7Z4vJ3jxm5jLiYkkPmnUsCMUphhcgSSmPaHbyeq/894
 ZNS3/8kibSQeSj8c0Qg==
X-Proofpoint-ORIG-GUID: IXMFWMshc0WODqNaEWPZIgFuz_Lq7lhy
X-Proofpoint-GUID: IXMFWMshc0WODqNaEWPZIgFuz_Lq7lhy
X-Authority-Analysis: v=2.4 cv=F/FnsKhN c=1 sm=1 tr=0 ts=6a56344f cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=qUYP/O48JsHWwiZSxXr1NQ==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=EUspDBNiAAAA:8 a=ka7fFnpjcXfis0az0GAA:9 a=S8MOZktbxV5DdIae:21
 a=QEXdDO2ut3YA:10 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-14_03,2026-07-10_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 priorityscore=1501 malwarescore=0 adultscore=0
 clxscore=1015 suspectscore=0 spamscore=0 phishscore=0 bulkscore=0
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607140136

Describe the CDSP remoteproc along with the related SMP2P.

Signed-off-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/eliza.dtsi | 64 +++++++++++++++++++++++++++++++++++++
 1 file changed, 64 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/eliza.dtsi b/arch/arm64/boot/dts/qcom/eliza.dtsi
index 357e8066c176..0c6fdfc5a4cc 100644
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
 
@@ -3737,6 +3761,46 @@ nsp_noc: interconnect@320c0000 {
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
+		};
 	};
 
 	thermal-zones {

-- 
2.54.0

