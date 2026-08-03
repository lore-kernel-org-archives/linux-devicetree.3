Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6D86C363C5F
	for <devicetree@vger.kernel.org>; Mon,  3 Aug 2026 03:15:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785726948; cv=none; b=ai6/h9LpENceUoJJswwUusmJ4ATjTdrkIaCgJt8X8HCwuLUIeCP+ecxA6Yln2z4TbL4u453i1tru4pamBWiRb4+Vti5vICp7yJrAnUu2fIWil5XvnA1IM0mAijfrmVVqZ7acy2YP+/WbDyM5Ju9ytamv4yQs6Ysp6Hhg9q8/dzY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785726948; c=relaxed/simple;
	bh=XZLciamH/wbfMlCyMbSXczWHwkmWjTG5jgkd1xDkSi8=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=fTDNK+Fqf3EfTJxr52oEyVvis/PDNICwho/N3TiNXnqjsCuYzV+lcHhWQIqaGjaMi6WCGrNBut7krRKRjZF1YlVdyu72QO3fAae8+d+2+5i/HjPbQtxS5lU8jeDw90PJC/2WspThd17YgXDVg/kgIxK69XvxmV+Gto44y72IOvE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=iqEcxq8y; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=JoPlBDgU; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="iqEcxq8y";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="JoPlBDgU"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 672LWbhf2943257
	for <devicetree@vger.kernel.org>; Mon, 3 Aug 2026 03:15:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=Gexg2OCd5HT
	5LbNBVBev2qK2kO8LY++t9yEzWXMAh38=; b=iqEcxq8y26eonL304FCX5HJOVgB
	lUZcyAwMU3vQzeVHvV3s6vs4rR11E6YvIaCOVrXzMUgR02oUwKUUn8gyoVg4Kkma
	rTe5VWLRX7J04iYSb2h/bb+oPZqrQAj1vlhYlRdnYasE2L5BWTnjQ1dEY8cUuPSJ
	toqqbdE6gK9SvwhjVkFCywtAEIJj+zJut7GgR/G7KwtNvl9ITgav1C2StZ7J6t3u
	KngARDcsX1DxtwcGiLHMWpVuIi2J8Th5fhfv1JgF7sNoXdWfp3DoyRVOfab/20ou
	4WKDYRGFgJMECERcGhF2kUrZvlyMhLQ6GVl9sYVxlllG/u/5pwjneqhv88g==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fs911c852-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 03 Aug 2026 03:15:45 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-38e7621655eso5365753a91.0
        for <devicetree@vger.kernel.org>; Sun, 02 Aug 2026 20:15:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785726945; x=1786331745; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Gexg2OCd5HT5LbNBVBev2qK2kO8LY++t9yEzWXMAh38=;
        b=JoPlBDgUbSSIUWcsc4fiegYI7iMXkMqvgjv7rXOPnBCoaBpd+ve6S1s+yoBjWBzJp3
         Nt/Yq6jvvQ5wojw1llsTkrQgrEDk6rofyOiknK8PJ6hU63vwEBJ18wdUEZd/qNKcZ01/
         8GYEZDQkHToptbRUP3+y/4p2rXA3wwMRMm98G1mHAH62HPRbgnMYUA8ZVgvNOB8+ZjSR
         FEuEkU3APsMRvuz1SSdZDgN+hUoqQQUV8xNYPkU7eEvzRGbn4se1Nvpz0AgTjP2etyLN
         SRUubGpbW31Ikof8ESXd/4+We07PFG5HrCMyyAg2IOKMUcKNN8lzpaqxL5xWsZGKH3uD
         JpZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785726945; x=1786331745;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Gexg2OCd5HT5LbNBVBev2qK2kO8LY++t9yEzWXMAh38=;
        b=tRy6ErsNiqb1Uv6LdmjHHkFHOJhVyd/pz4E+0tRHKICOPB8/KqBwxzrrP7+coT1KgX
         kC85XeA+qrMTpCDYerLwYSb8rhxFRRodQRyYUjQ5H0vOX636AJj+Plc0Qq1yBr1zId19
         1dPWqCS6EbnvFuHqdEBQ+gqyqIdIDpE5r6CYX685yBIatSguLl23fpO95oQMX5d8hbZB
         OOnnZtZHr5sSh/YS430z4PVBfsXbkmV+/JxA9W+YAQ0Iu/awb7CP09gbfRMhMILxGfY6
         mDKTzdgGerdWab9bNinAoAeAEectoe0RTRkmVz5vg4+bcrfmdc4yqf0J/dZkB4M2CVDN
         TAfw==
X-Forwarded-Encrypted: i=1; AHgh+RpmEPy9yAvyEKbojNdTo5g9vgIQ6MnZ/5CwbDsZ7ySTUjS0bxMnDbS0kDI76DuNtpBhWTEoWEM1AfdV@vger.kernel.org
X-Gm-Message-State: AOJu0Yy7VnHqIVwU7VgT1u6b7Rg19ee3Mzb0k3h8xXTmPJnHf/MT/Am+
	1W/+Po17J4zb0aDAXfZT7oy05FAeYoZfsbGV3wTjvmPk0eBkCG6MUp9blyULiQtueIyarf74Tpa
	fHUyabkTMsJVxr8gIlKJs4tGlHIZmhiUo6qwy46vaV671JS93WLUtIk7Xi64NYZwW
X-Gm-Gg: AR+sD115kFJfh+pMTC2KS+LxRrWWnrMMZX5WZfp4M60a6+1rQc0bw7A8bOkZblbL5kj
	53HP0hq1O6J1XWlDNnIzKHQ/t/ySkzg6ePsZzSWRNXvcFM4Fi1emec0syj602Fm+mZ1atBq+YqC
	H6RtplA++ailuuivT397hi7JR7DPRCfolaBO1E+LVvhW50jZdD+g7o9lD36m4Hm75W7bG3BKvSb
	2AgmWFzOGZKxFMluJAE0KEtVhPD5uVnnNudREs6odyIM7lYvcGB0+O1VkHQXmtcsui/oGafOVYo
	Ps+j+DQ03aJ0Rwejbag8s24cJJtDaejbsCCqeu9bJz4jKNO19RWILyTc1mjakBLCqbRj03sRgDz
	OcJsIaJwl9me4FF8+G2IMY1o+wSSt6Jw3klRcrO7GDiPNEyjNtWYEIg==
X-Received: by 2002:a05:6a21:338a:b0:3c3:791e:5e12 with SMTP id adf61e73a8af0-3c92a8e2cedmr8565841637.72.1785726945107;
        Sun, 02 Aug 2026 20:15:45 -0700 (PDT)
X-Received: by 2002:a05:6a21:338a:b0:3c3:791e:5e12 with SMTP id adf61e73a8af0-3c92a8e2cedmr8565806637.72.1785726944641;
        Sun, 02 Aug 2026 20:15:44 -0700 (PDT)
Received: from hu-eserrao-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3153dd9c93dsm32585113eec.8.2026.08.02.20.15.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 02 Aug 2026 20:15:44 -0700 (PDT)
From: Elson Serrao <elson.serrao@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Peter Chen <peter.chen@kernel.org>, Rob Herring <robh@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH v5 8/9] arm64: dts: qcom: kodiak: Describe EUD UTMI path using child node
Date: Sun,  2 Aug 2026 20:15:33 -0700
Message-Id: <20260803031534.2942628-9-elson.serrao@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260803031534.2942628-1-elson.serrao@oss.qualcomm.com>
References: <20260803031534.2942628-1-elson.serrao@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwODAzMDAyNCBTYWx0ZWRfX8uYiZg31zosf
 +hlfejobd2aVAgF/cyAmdO/onwt33kNi1RecTpsJ4G4cDba2Cc5dNgBGc6WkFVNELhx2HMKYZ0j
 o6sQJ8qTu8dc8CKfL+tfbk8N4fH+Pto=
X-Authority-Analysis: v=2.4 cv=PvGjqQM3 c=1 sm=1 tr=0 ts=6a7007e1 cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22 a=EUspDBNiAAAA:8
 a=-Y8wEhFFMILef-Bpc8oA:9 a=mQ_c8vxmzFEMiUWkPHU9:22
X-Proofpoint-GUID: AhCZmNVYXj5w4JwCqspiCGQXH-lYfVCd
X-Proofpoint-ORIG-GUID: AhCZmNVYXj5w4JwCqspiCGQXH-lYfVCd
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODAzMDAyNCBTYWx0ZWRfXyu8wYwnlBtuU
 T1Z6EzkOuiDksJoMxTdH3Xc02qIL04X1SAV9J1O2NqIPSJlOID6KOlt8xahpFFk/fXXaqNtTrf4
 mkvYLI1i53Ats2OwG4P/V7kLCPe1b6KBuwNWoaHXdJazs5D03ohzkljxFQEgg42aHyU7BBeNrVr
 rB+mPFWzah9UDkXUjkqdJ5yqVN66bD/IBPgB8nc4Lqcw7MYZxn6hpwJznIEyPO5h4241/HSBQgw
 TCSMfdpE9hjURJ/vJc2a54E78Y/OSmfWJ2jgtgUkDYqBVbafxnPEzw/PwDb7+nbJ+Zyz8iiEFPU
 0QYd0UgsZkfGRklXHwRAvUPmYyG68Ubx8bqF3yR744PuzLfoGHBlpzeMKkLC+5f3k6FipOPWMaX
 nqrD854os9C4k1WRUFMfyorYmAJPjezodH4wgJOtfhmgCoEwYJxqUCl7e6+zBQS8Wdpxlyi8l0C
 WbuB5NnIiVyCx3QbWjw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-02_06,2026-07-30_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 clxscore=1015 lowpriorityscore=0 bulkscore=0
 priorityscore=1501 adultscore=0 impostorscore=0 phishscore=0 spamscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2608030024

The existing EUD description uses a legacy single-path representation
that assumes uniform UTMI routing. This was sufficient for minimal
configurations where the USB port operated only in device mode and role
switching was not considered.

Update the description to explicitly model the topology using eud path
child node and add a role-switch declaration to reflect role-dependent
UTMI routing. Also on this SoC, the EUD hardware intercepts only the
primary UTMI path. So remove the USB endpoint mapping to the secondary
controller and associate it with the primary controller.

With the UTMI path now accurately described, enable the EUD by default.
The connector side of the path is left unspecified, allowing board-level
DTS files to describe the physical connector mapping.

Signed-off-by: Elson Serrao <elson.serrao@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/kodiak.dtsi | 35 +++++++++++++++++-----------
 1 file changed, 21 insertions(+), 14 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/kodiak.dtsi b/arch/arm64/boot/dts/qcom/kodiak.dtsi
index fa540d8c2615..be9d02760a98 100644
--- a/arch/arm64/boot/dts/qcom/kodiak.dtsi
+++ b/arch/arm64/boot/dts/qcom/kodiak.dtsi
@@ -4404,12 +4404,6 @@ usb_2: usb@8c00000 {
 			phy-names = "usb2-phy";
 			maximum-speed = "high-speed";
 			usb-role-switch;
-
-			port {
-				usb2_role_switch: endpoint {
-					remote-endpoint = <&eud_ep>;
-				};
-			};
 		};
 
 		qspi: spi@88dc000 {
@@ -4736,16 +4730,28 @@ eud: eud@88e0000 {
 			      <0 0x88e2000 0 0x1000>;
 			interrupts-extended = <&pdc 11 IRQ_TYPE_LEVEL_HIGH>;
 
-			status = "disabled";
+			#address-cells = <1>;
+			#size-cells = <0>;
 
-			ports {
-				#address-cells = <1>;
-				#size-cells = <0>;
+			eud0: eud-path@0 {
+				reg = <0>;
+				usb-role-switch;
 
-				port@0 {
-					reg = <0>;
-					eud_ep: endpoint {
-						remote-endpoint = <&usb2_role_switch>;
+				ports {
+					#address-cells = <1>;
+					#size-cells = <0>;
+
+					port@0 {
+						reg = <0>;
+						eud_usb: endpoint {
+							remote-endpoint = <&usb_1_dwc3_hs>;
+						};
+					};
+
+					port@1 {
+						reg = <1>;
+						eud_con: endpoint {
+						};
 					};
 				};
 			};
@@ -4972,6 +4978,7 @@ port@0 {
 					reg = <0>;
 
 					usb_1_dwc3_hs: endpoint {
+						remote-endpoint = <&eud_usb>;
 					};
 				};
 
-- 
2.34.1

