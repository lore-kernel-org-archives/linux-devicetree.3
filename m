Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 55C393A6B70;
	Tue, 21 Apr 2026 22:46:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.163.156.1
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776811581; cv=none; b=oCoGmmOc6IrU+5xdje283CY3lVSBlJ6pAapy7KTyuC6O3f5hCUJc1u39FQL6G3p3/8VbmTgHHd4EZDqr59WhfphGBBS3O1cwelLJz0SS3NmRplVfx5i2qk7uQcyDQ0wmKhQw8vsHGVhYCZXEC/dup+JNqPvDqSnC1wgCmNs+Frs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776811581; c=relaxed/simple;
	bh=Wzyk2KEzqB0DKjLvmL71EXnAl2EViL05+5XwEdgIjOI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=nEoJq94vX/F7yxf1b7twsfbcH4nJN/gi0eEuXabSBwLqkhA0bDmEyqWaGlxUgNCHLA1WOBxramjr5tM5TJ8Gg8diD3BMDLDgCh+jUPrbBNrYvds5f64lOV71DAj042HXF0P0mzRM57s5gYQzv3UuA0inO/rM+ImYLiioyNrszZY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; spf=pass smtp.mailfrom=linux.ibm.com; dkim=pass (2048-bit key) header.d=ibm.com header.i=@ibm.com header.b=NjMbMNnX; arc=none smtp.client-ip=148.163.156.1
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.ibm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ibm.com header.i=@ibm.com header.b="NjMbMNnX"
Received: from pps.filterd (m0360083.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63LIlbsf876258;
	Tue, 21 Apr 2026 22:46:04 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=pp1; bh=3pr2V7p2DMACnXKOp
	VS2YP2rhBGwJ5L9hjjDbsr5gyY=; b=NjMbMNnX+JZ/CsGcp2DNX1+TV16LURVRq
	Il9D0WBN9rWh4jnFEH8Fl9vN6zw/uWLSLgY4n2AVKkxn8FumR+vyIVLwT6IB7jMU
	DIF2OUx7WwmfzmkMXOSRID/jLxBByGKMOYIyFaAZ/olPqHzAUCSoNKFa/fiCshGq
	44q6G0PK4oo+dKgnOHTCsFu7VlV8d/XF8sec/lBi8MdNbpZjOqgyStmoi2n7HFMs
	vyigV5RVMo1vwJPUENjcKHIU2ce0Eh2w/qoziUL1RjTNEF6RPbh4XR7kaLRDkV9c
	clrzAckPgo0EFqV2n9JEszcG7FMwfYJ98RFbdfhaAgJjwONJkYnTA==
Received: from ppma22.wdc07v.mail.ibm.com (5c.69.3da9.ip4.static.sl-reverse.com [169.61.105.92])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 4dpeu20qj6-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 21 Apr 2026 22:46:03 +0000 (GMT)
Received: from pps.filterd (ppma22.wdc07v.mail.ibm.com [127.0.0.1])
	by ppma22.wdc07v.mail.ibm.com (8.18.1.7/8.18.1.7) with ESMTP id 63LMZMA4000641;
	Tue, 21 Apr 2026 22:46:02 GMT
Received: from smtprelay03.wdc07v.mail.ibm.com ([172.16.1.70])
	by ppma22.wdc07v.mail.ibm.com (PPS) with ESMTPS id 4dmmnvtr8q-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 21 Apr 2026 22:46:02 +0000 (GMT)
Received: from smtpav06.dal12v.mail.ibm.com (smtpav06.dal12v.mail.ibm.com [10.241.53.105])
	by smtprelay03.wdc07v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 63LMjZHK27460150
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 21 Apr 2026 22:45:35 GMT
Received: from smtpav06.dal12v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 4AFEE58055;
	Tue, 21 Apr 2026 22:46:01 +0000 (GMT)
Received: from smtpav06.dal12v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id B45A758043;
	Tue, 21 Apr 2026 22:46:00 +0000 (GMT)
Received: from pfw153.pfw.tadn.ibm.com (unknown [9.5.7.52])
	by smtpav06.dal12v.mail.ibm.com (Postfix) with ESMTP;
	Tue, 21 Apr 2026 22:46:00 +0000 (GMT)
From: Ninad Palsule <ninad@linux.ibm.com>
To: eajames@linux.ibm.com, robh@kernel.org, krzk+dt@kernel.org,
        conor+dt@kernel.org, joel@jms.id.au, andrew@codeconstruct.com.au,
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-aspeed@lists.ozlabs.org, linux-kernel@vger.kernel.org
Cc: Ninad Palsule <ninad@linux.ibm.com>
Subject: [PATCH v1 4/7] ARM: dts: aspeed: system1: Enable temp sensors
Date: Tue, 21 Apr 2026 17:45:41 -0500
Message-ID: <20260421224551.1611818-5-ninad@linux.ibm.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260421224551.1611818-1-ninad@linux.ibm.com>
References: <20260421224551.1611818-1-ninad@linux.ibm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDIxMDIyMiBTYWx0ZWRfXyZY/22oakJQ8
 Y2eVlfFu3P1sipSIRiUTuxQcGvVfqU16RM12RQ8UNRMcuY9j9FxezsNUMTjaGRYsqlbz2YjU5wK
 g7IMFxWO5rcvuF0N2WL3lNXB1AliX/CUJTpKXQf6pITx9WYAeYFAeu6YEq+k1+C9jjiTEsaHk+8
 5KGrtW0Hv+8883mzraiO04/EHpty1JIvumgtdSou1c5fyvb+LTENHjh3kQ8XlDEuRTo/zT+VceE
 baSdUsvl5VKphNqjQQAVoX6Ot1aD9paG02Hcpq80MkTBso6WE9jJ0Zn9QQmW7d10A3B+eBHZNtF
 1jFtKqUMYhl2AX4tbKlnKYnHjyvTM9SUAF+h5L7LSw5HoIOAtZe12qo9zyAqsGNiTR4SnMFkQ3M
 icJgl2LFTK9Fw0hKVMuF48AKi75ST2xRgc6xAxTlaajf+4z2vkHdOutrptehpB/YAbbv3E33fNq
 POsZzzhVvclR/QoKb0w==
X-Proofpoint-ORIG-GUID: b51q5yOMg0yR4qrcwJLkVCkwwTKNqP9B
X-Proofpoint-GUID: b51q5yOMg0yR4qrcwJLkVCkwwTKNqP9B
X-Authority-Analysis: v=2.4 cv=XMUAjwhE c=1 sm=1 tr=0 ts=69e7fe2c cx=c_pps
 a=5BHTudwdYE3Te8bg5FgnPg==:117 a=5BHTudwdYE3Te8bg5FgnPg==:17
 a=A5OVakUREuEA:10 a=VkNPw1HP01LnGYTKEx00:22 a=RnoormkPH1_aCDwRdu11:22
 a=iQ6ETzBq9ecOQQE5vZCe:22 a=VnNF1IyMAAAA:8 a=dRprF2gspIZmeBmTkj8A:9
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-21_03,2026-04-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 clxscore=1015 priorityscore=1501 impostorscore=0 bulkscore=0
 spamscore=0 lowpriorityscore=0 phishscore=0 adultscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2604210222

Enable temperature sensors for PCIe devices in the system1 BMC machine.
There is mux on each sensor card.

Signed-off-by: Ninad Palsule <ninad@linux.ibm.com>
---
 .../dts/aspeed/aspeed-bmc-ibm-system1.dts     | 496 ++++++++++++++++++
 1 file changed, 496 insertions(+)

diff --git a/arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-system1.dts b/arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-system1.dts
index b0eb1767c485..a5252cec9903 100644
--- a/arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-system1.dts
+++ b/arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-system1.dts
@@ -68,6 +68,38 @@ aliases {
 		i2c69 = &i2c15mux0chn5;
 		i2c70 = &i2c15mux0chn6;
 		i2c71 = &i2c15mux0chn7;
+		i2c72 = &i2c8mux2chn0;
+		i2c73 = &i2c8mux2chn1;
+		i2c74 = &i2c8mux3chn0;
+		i2c75 = &i2c8mux3chn1;
+		i2c76 = &i2c8mux4chn0;
+		i2c77 = &i2c8mux4chn1;
+		i2c78 = &i2c8mux5chn0;
+		i2c79 = &i2c8mux5chn1;
+		i2c80 = &i2c8mux6chn0;
+		i2c81 = &i2c8mux6chn1;
+		i2c82 = &i2c8mux7chn0;
+		i2c83 = &i2c8mux7chn1;
+		i2c84 = &i2c8mux8chn0;
+		i2c85 = &i2c8mux8chn1;
+		i2c86 = &i2c8mux9chn0;
+		i2c87 = &i2c8mux9chn1;
+		i2c88 = &i2c15mux2chn0;
+		i2c89 = &i2c15mux2chn1;
+		i2c90 = &i2c15mux3chn0;
+		i2c91 = &i2c15mux3chn1;
+		i2c92 = &i2c15mux4chn0;
+		i2c93 = &i2c15mux4chn1;
+		i2c94 = &i2c15mux5chn0;
+		i2c95 = &i2c15mux5chn1;
+		i2c96 = &i2c15mux6chn0;
+		i2c97 = &i2c15mux6chn1;
+		i2c98 = &i2c15mux7chn0;
+		i2c99 = &i2c15mux7chn1;
+		i2c100 = &i2c15mux8chn0;
+		i2c101 = &i2c15mux8chn1;
+		i2c102 = &i2c15mux9chn0;
+		i2c103 = &i2c15mux9chn1;
 	};
 
 	chosen {
@@ -1148,48 +1180,280 @@ i2c8mux1chn0: i2c@0 {
 					#address-cells = <1>;
 					#size-cells = <0>;
 					reg = <0>;
+					i2c-mux@76 {
+						compatible = "nxp,pca9548";
+						reg = <0x76>;
+						#address-cells = <1>;
+						#size-cells = <0>;
+						i2c-mux-idle-disconnect;
+
+						i2c8mux2chn0: i2c@0 {
+							#address-cells = <1>;
+							#size-cells = <0>;
+							reg = <0>;
+
+							temperature-sensor@4b {
+								compatible = "ti,tmp112";
+								reg = <0x4b>;
+							};
+						};
+
+						i2c8mux2chn1: i2c@1 {
+							#address-cells = <1>;
+							#size-cells = <0>;
+							reg = <1>;
+
+							temperature-sensor@48 {
+								compatible = "ti,tmp112";
+								reg = <0x48>;
+							};
+						};
+					};
 				};
 
 				i2c8mux1chn1: i2c@1 {
 					#address-cells = <1>;
 					#size-cells = <0>;
 					reg = <1>;
+					i2c-mux@76 {
+						compatible = "nxp,pca9548";
+						reg = <0x76>;
+						#address-cells = <1>;
+						#size-cells = <0>;
+						i2c-mux-idle-disconnect;
+
+						i2c8mux3chn0: i2c@0 {
+							#address-cells = <1>;
+							#size-cells = <0>;
+							reg = <0>;
+
+							temperature-sensor@4b {
+								compatible = "ti,tmp112";
+								reg = <0x4b>;
+							};
+						};
+
+						i2c8mux3chn1: i2c@1 {
+							#address-cells = <1>;
+							#size-cells = <0>;
+							reg = <1>;
+
+							temperature-sensor@48 {
+								compatible = "ti,tmp112";
+								reg = <0x48>;
+							};
+						};
+					};
 				};
 
 				i2c8mux1chn2: i2c@2 {
 					#address-cells = <1>;
 					#size-cells = <0>;
 					reg = <2>;
+					i2c-mux@76 {
+						compatible = "nxp,pca9548";
+						reg = <0x76>;
+						#address-cells = <1>;
+						#size-cells = <0>;
+						i2c-mux-idle-disconnect;
+
+						i2c8mux4chn0: i2c@0 {
+							#address-cells = <1>;
+							#size-cells = <0>;
+							reg = <0>;
+
+							temperature-sensor@4b {
+								compatible = "ti,tmp112";
+								reg = <0x4b>;
+							};
+						};
+
+						i2c8mux4chn1: i2c@1 {
+							#address-cells = <1>;
+							#size-cells = <0>;
+							reg = <1>;
+
+							temperature-sensor@48 {
+								compatible = "ti,tmp112";
+								reg = <0x48>;
+							};
+						};
+					};
 				};
 
 				i2c8mux1chn3: i2c@3 {
 					#address-cells = <1>;
 					#size-cells = <0>;
 					reg = <3>;
+					i2c-mux@76 {
+						compatible = "nxp,pca9548";
+						reg = <0x76>;
+						#address-cells = <1>;
+						#size-cells = <0>;
+						i2c-mux-idle-disconnect;
+
+						i2c8mux5chn0: i2c@0 {
+							#address-cells = <1>;
+							#size-cells = <0>;
+							reg = <0>;
+
+							temperature-sensor@4b {
+								compatible = "ti,tmp112";
+								reg = <0x4b>;
+							};
+						};
+
+						i2c8mux5chn1: i2c@1 {
+							#address-cells = <1>;
+							#size-cells = <0>;
+							reg = <1>;
+
+							temperature-sensor@48 {
+								compatible = "ti,tmp112";
+								reg = <0x48>;
+							};
+						};
+					};
 				};
 
 				i2c8mux1chn4: i2c@4 {
 					#address-cells = <1>;
 					#size-cells = <0>;
 					reg = <4>;
+					i2c-mux@76 {
+						compatible = "nxp,pca9548";
+						reg = <0x76>;
+						#address-cells = <1>;
+						#size-cells = <0>;
+						i2c-mux-idle-disconnect;
+
+						i2c8mux6chn0: i2c@0 {
+							#address-cells = <1>;
+							#size-cells = <0>;
+							reg = <0>;
+
+							temperature-sensor@4b {
+								compatible = "ti,tmp112";
+								reg = <0x4b>;
+							};
+						};
+
+						i2c8mux6chn1: i2c@1 {
+							#address-cells = <1>;
+							#size-cells = <0>;
+							reg = <1>;
+
+							temperature-sensor@48 {
+								compatible = "ti,tmp112";
+								reg = <0x48>;
+							};
+						};
+					};
 				};
 
 				i2c8mux1chn5: i2c@5 {
 					#address-cells = <1>;
 					#size-cells = <0>;
 					reg = <5>;
+					i2c-mux@76 {
+						compatible = "nxp,pca9548";
+						reg = <0x76>;
+						#address-cells = <1>;
+						#size-cells = <0>;
+						i2c-mux-idle-disconnect;
+
+						i2c8mux7chn0: i2c@0 {
+							#address-cells = <1>;
+							#size-cells = <0>;
+							reg = <0>;
+
+							temperature-sensor@4b {
+								compatible = "ti,tmp112";
+								reg = <0x4b>;
+							};
+						};
+
+						i2c8mux7chn1: i2c@1 {
+							#address-cells = <1>;
+							#size-cells = <0>;
+							reg = <1>;
+
+							temperature-sensor@48 {
+								compatible = "ti,tmp112";
+								reg = <0x48>;
+							};
+						};
+					};
 				};
 
 				i2c8mux1chn6: i2c@6 {
 					#address-cells = <1>;
 					#size-cells = <0>;
 					reg = <6>;
+					i2c-mux@76 {
+						compatible = "nxp,pca9548";
+						reg = <0x76>;
+						#address-cells = <1>;
+						#size-cells = <0>;
+						i2c-mux-idle-disconnect;
+
+						i2c8mux8chn0: i2c@0 {
+							#address-cells = <1>;
+							#size-cells = <0>;
+							reg = <0>;
+
+							temperature-sensor@4b {
+								compatible = "ti,tmp112";
+								reg = <0x4b>;
+							};
+						};
+
+						i2c8mux8chn1: i2c@1 {
+							#address-cells = <1>;
+							#size-cells = <0>;
+							reg = <1>;
+
+							temperature-sensor@48 {
+								compatible = "ti,tmp112";
+								reg = <0x48>;
+							};
+						};
+					};
 				};
 
 				i2c8mux1chn7: i2c@7 {
 					#address-cells = <1>;
 					#size-cells = <0>;
 					reg = <7>;
+					i2c-mux@76 {
+						compatible = "nxp,pca9548";
+						reg = <0x76>;
+						#address-cells = <1>;
+						#size-cells = <0>;
+						i2c-mux-idle-disconnect;
+
+						i2c8mux9chn0: i2c@0 {
+							#address-cells = <1>;
+							#size-cells = <0>;
+							reg = <0>;
+
+							temperature-sensor@4b {
+								compatible = "ti,tmp112";
+								reg = <0x4b>;
+							};
+						};
+
+						i2c8mux9chn1: i2c@1 {
+							#address-cells = <1>;
+							#size-cells = <0>;
+							reg = <1>;
+
+							temperature-sensor@48 {
+								compatible = "ti,tmp112";
+								reg = <0x48>;
+							};
+						};
+					};
 				};
 			};
 		};
@@ -1593,48 +1857,280 @@ i2c15mux1chn0: i2c@0 {
 					#address-cells = <1>;
 					#size-cells = <0>;
 					reg = <0>;
+					i2c-mux@76 {
+						compatible = "nxp,pca9548";
+						reg = <0x76>;
+						#address-cells = <1>;
+						#size-cells = <0>;
+						i2c-mux-idle-disconnect;
+
+						i2c15mux2chn0: i2c@0 {
+							#address-cells = <1>;
+							#size-cells = <0>;
+							reg = <0>;
+
+							temperature-sensor@4b {
+								compatible = "ti,tmp112";
+								reg = <0x4b>;
+							};
+						};
+
+						i2c15mux2chn1: i2c@1 {
+							#address-cells = <1>;
+							#size-cells = <0>;
+							reg = <1>;
+
+							temperature-sensor@48 {
+								compatible = "ti,tmp112";
+								reg = <0x48>;
+							};
+						};
+					};
 				};
 
 				i2c15mux1chn1: i2c@1 {
 					#address-cells = <1>;
 					#size-cells = <0>;
 					reg = <1>;
+					i2c-mux@76 {
+						compatible = "nxp,pca9548";
+						reg = <0x76>;
+						#address-cells = <1>;
+						#size-cells = <0>;
+						i2c-mux-idle-disconnect;
+
+						i2c15mux3chn0: i2c@0 {
+							#address-cells = <1>;
+							#size-cells = <0>;
+							reg = <0>;
+
+							temperature-sensor@4b {
+								compatible = "ti,tmp112";
+								reg = <0x4b>;
+							};
+						};
+
+						i2c15mux3chn1: i2c@1 {
+							#address-cells = <1>;
+							#size-cells = <0>;
+							reg = <1>;
+
+							temperature-sensor@48 {
+								compatible = "ti,tmp112";
+								reg = <0x48>;
+							};
+						};
+					};
 				};
 
 				i2c15mux1chn2: i2c@2 {
 					#address-cells = <1>;
 					#size-cells = <0>;
 					reg = <2>;
+					i2c-mux@76 {
+						compatible = "nxp,pca9548";
+						reg = <0x76>;
+						#address-cells = <1>;
+						#size-cells = <0>;
+						i2c-mux-idle-disconnect;
+
+						i2c15mux4chn0: i2c@0 {
+							#address-cells = <1>;
+							#size-cells = <0>;
+							reg = <0>;
+
+							temperature-sensor@4b {
+								compatible = "ti,tmp112";
+								reg = <0x4b>;
+							};
+						};
+
+						i2c15mux4chn1: i2c@1 {
+							#address-cells = <1>;
+							#size-cells = <0>;
+							reg = <1>;
+
+							temperature-sensor@48 {
+								compatible = "ti,tmp112";
+								reg = <0x48>;
+							};
+						};
+					};
 				};
 
 				i2c15mux1chn3: i2c@3 {
 					#address-cells = <1>;
 					#size-cells = <0>;
 					reg = <3>;
+					i2c-mux@76 {
+						compatible = "nxp,pca9548";
+						reg = <0x76>;
+						#address-cells = <1>;
+						#size-cells = <0>;
+						i2c-mux-idle-disconnect;
+
+						i2c15mux5chn0: i2c@0 {
+							#address-cells = <1>;
+							#size-cells = <0>;
+							reg = <0>;
+
+							temperature-sensor@4b {
+								compatible = "ti,tmp112";
+								reg = <0x4b>;
+							};
+						};
+
+						i2c15mux5chn1: i2c@1 {
+							#address-cells = <1>;
+							#size-cells = <0>;
+							reg = <1>;
+
+							temperature-sensor@48 {
+								compatible = "ti,tmp112";
+								reg = <0x48>;
+							};
+						};
+					};
 				};
 
 				i2c15mux1chn4: i2c@4 {
 					#address-cells = <1>;
 					#size-cells = <0>;
 					reg = <4>;
+					i2c-mux@76 {
+						compatible = "nxp,pca9548";
+						reg = <0x76>;
+						#address-cells = <1>;
+						#size-cells = <0>;
+						i2c-mux-idle-disconnect;
+
+						i2c15mux6chn0: i2c@0 {
+							#address-cells = <1>;
+							#size-cells = <0>;
+							reg = <0>;
+
+							temperature-sensor@4b {
+								compatible = "ti,tmp112";
+								reg = <0x4b>;
+							};
+						};
+
+						i2c15mux6chn1: i2c@1 {
+							#address-cells = <1>;
+							#size-cells = <0>;
+							reg = <1>;
+
+							temperature-sensor@48 {
+								compatible = "ti,tmp112";
+								reg = <0x48>;
+							};
+						};
+					};
 				};
 
 				i2c15mux1chn5: i2c@5 {
 					#address-cells = <1>;
 					#size-cells = <0>;
 					reg = <5>;
+					i2c-mux@76 {
+						compatible = "nxp,pca9548";
+						reg = <0x76>;
+						#address-cells = <1>;
+						#size-cells = <0>;
+						i2c-mux-idle-disconnect;
+
+						i2c15mux7chn0: i2c@0 {
+							#address-cells = <1>;
+							#size-cells = <0>;
+							reg = <0>;
+
+							temperature-sensor@4b {
+								compatible = "ti,tmp112";
+								reg = <0x4b>;
+							};
+						};
+
+						i2c15mux7chn1: i2c@1 {
+							#address-cells = <1>;
+							#size-cells = <0>;
+							reg = <1>;
+
+							temperature-sensor@48 {
+								compatible = "ti,tmp112";
+								reg = <0x48>;
+							};
+						};
+					};
 				};
 
 				i2c15mux1chn6: i2c@6 {
 					#address-cells = <1>;
 					#size-cells = <0>;
 					reg = <6>;
+					i2c-mux@76 {
+						compatible = "nxp,pca9548";
+						reg = <0x76>;
+						#address-cells = <1>;
+						#size-cells = <0>;
+						i2c-mux-idle-disconnect;
+
+						i2c15mux8chn0: i2c@0 {
+							#address-cells = <1>;
+							#size-cells = <0>;
+							reg = <0>;
+
+							temperature-sensor@4b {
+								compatible = "ti,tmp112";
+								reg = <0x4b>;
+							};
+						};
+
+						i2c15mux8chn1: i2c@1 {
+							#address-cells = <1>;
+							#size-cells = <0>;
+							reg = <1>;
+
+							temperature-sensor@48 {
+								compatible = "ti,tmp112";
+								reg = <0x48>;
+							};
+						};
+					};
 				};
 
 				i2c15mux1chn7: i2c@7 {
 					#address-cells = <1>;
 					#size-cells = <0>;
 					reg = <7>;
+					i2c-mux@76 {
+						compatible = "nxp,pca9548";
+						reg = <0x76>;
+						#address-cells = <1>;
+						#size-cells = <0>;
+						i2c-mux-idle-disconnect;
+
+						i2c15mux9chn0: i2c@0 {
+							#address-cells = <1>;
+							#size-cells = <0>;
+							reg = <0>;
+
+							temperature-sensor@4b {
+								compatible = "ti,tmp112";
+								reg = <0x4b>;
+							};
+						};
+
+						i2c15mux9chn1: i2c@1 {
+							#address-cells = <1>;
+							#size-cells = <0>;
+							reg = <1>;
+
+							temperature-sensor@48 {
+								compatible = "ti,tmp112";
+								reg = <0x48>;
+							};
+						};
+					};
 				};
 			};
 		};
-- 
2.51.0

