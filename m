Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6AD5836606A
	for <devicetree@vger.kernel.org>; Sat, 29 Aug 2026 19:41:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788032509; cv=none; b=RzUYtXLgvZgOo4vtCQXKZrWzvf++XHhv5h/Yb4QcSEFlOo2pav8k+8lofmlvZhsCFudJjcCWZ75xAsek0TvaLvJ/T9laNGcPE7RexODlaRWgg48Bh8lP5sg7V3JtWN5IiSgy7jbVvNwen7STo+9Ik8RXJeAQW0kA2PKlLHHyqZQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788032509; c=relaxed/simple;
	bh=+6/8xDZthmh634DUqOXAa/rFhX/OfOYHFjYz6AZlfu8=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=lb9gCv6hM0XP370zOztd+VTOQsqT38fgVLGsfF2hbjZx3db+485NpMBldzpL2avvyofGC0CVLfRtoCROR1APqBPD3zL05QRZzLXLL7KVQE04cuBn+Qstao+kRXlgDJ1T1P/gWtGoWFZ9GiUQf3tQ880EaXyssxbgadhgcyesGbk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=nNahYu9c; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=gB74RW+6; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="nNahYu9c";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="gB74RW+6"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67TH05CQ2423826
	for <devicetree@vger.kernel.org>; Sat, 29 Aug 2026 19:41:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=uYY1haxtrXQH+XznnghxF9X9hpKVzJQon3E
	TAsbHsJs=; b=nNahYu9cLblgUCWHqjYUnlACTlZge8G4kcNgam96C+gayxBsNSp
	4pk/qlXEE78hRQD/H16CREyCL6SxGdRAZrA5EQRULRHGDehRJFyYbtTryZdU1knv
	HjaspjKvISxU3hcZ31T9fSBmSfxz8qdmcu5Vkxk3IkznrO4EwRdLO2qHrk6RpWlH
	87VTFc/iMQ6HlSkVnLauk1pYevTL/eqd16o1HETP4r/t23zl/8ZYEV9cernQAPPA
	/7x/9ICWpxUvqzBnzGKq1u7sBnOBQeo8rrVSpRMBoiNNSz071fclPRn3Q6ey6OMS
	fmH82mxT3DCSqVWEzLI5BtQvwjRDK0JhEQg==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gbqn2hmjf-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Sat, 29 Aug 2026 19:41:47 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-52fb2a46cb5so54614791cf.3
        for <devicetree@vger.kernel.org>; Sat, 29 Aug 2026 12:41:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788032507; x=1788637307; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=uYY1haxtrXQH+XznnghxF9X9hpKVzJQon3ETAsbHsJs=;
        b=gB74RW+6kv/EVFF2pWB8DGR/ugesq7BiGAChKm6iqyRJmCg24Jti998YdV7lK7gMYR
         CaBOq7Aw91aY8knoJShOGNworHN01tuaFGx6fJE6kHL6ePzKzDJ74c6H2zcgtowUO++L
         6kr8rECIm9WABHUGhxbgoPir1bzMylAcugKKp90xIjAzdnFe7bmmRvrNKX4fC2CYG5v3
         5BTI/QaqfY7gDkQOmgz7DOaol0Ps5ViR4Eh2GDQHQiRTBs92UqODUGYp02XJTYboNDS5
         teTFt4qVWz6ncfHzOE+zp2bxiZMZEkJDIswua8Q4FS6o2dIjAFrZkd1jaTfPize7yRgi
         pJrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788032507; x=1788637307;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=uYY1haxtrXQH+XznnghxF9X9hpKVzJQon3ETAsbHsJs=;
        b=NB0q8X3fi9ZEGLXRM4SEh6lTsE+zsla3PuFktyBCMIW60YGWOo2RDldRlxKIxZ3gNL
         lQ7rojup9Spjvoxa0nS79Vmd+cLtxvd2qMH4rFfnVlm9MLvHe5bNdqpKCYHbq/N6DGqu
         kZs+xmOWxmrqq3F14hHrVgzm4ma1ygRbvEEJg8qB+822zA2r9k8+h744+hnr8NHS++8j
         WT3CK9iqe2ghtKjob2a9O5pd+8HUlqdN7m1YokK7h73LOt6LIvPtj8Tvtmu9+sEtAoDj
         aEi+blmtVhIfr0JaiDpKZZ0r3aahQTK+1C/xBSr4aVg6BDbKF2M/z9OnL53yZQOjvFBi
         WQoA==
X-Forwarded-Encrypted: i=1; AHgh+Rqkl+lVciL1MPasJImM1leib37XKkXoN36Zmvmt0SSp5S7IeJ0zYeG482HowWZzL+bbEgurmXvKctoN@vger.kernel.org
X-Gm-Message-State: AFuF++nMky7Gd6yKHINcZ7SmiXL6MzqG517scKv/c/WMkMXiPBAUpVVA
	+SEmgDsyVOQ4lU0GScylTrhjapiPJoljmNOXMRMr2v5JfPWpUAtEhOyj4ZCar497cxVThCWgLOr
	PEy28FRt4Z4UIuZurzRMo5O2tJCRxbUX0MgvagoXiib5zy4mLMuRAZ9TOwe461De5
X-Gm-Gg: AR+sD10SzE/xNrTsKM9UBa2SCdzO7kVCoh3CM6tMPbTLQzwQXrB3hB5hAnXdyCg68gL
	yz39BrGmfGyopXYxn3nBkXwDCOhKVpm0PrpJsX954lSCveTP3wxWAm1kpgRnn3YuFA/wq9HqJ02
	0xvrp5GmTrHDLjurr9t8/RnRObXlzyBmjJOe6QgYSdEHoECDYuzr5g3E2i4XGfUiDhFSZELXshU
	mnxWRh9pFBXlxOtBbl9Ut9PBcrJF2pshopc7DJ5Tk1kbX2rornBOUZKrgkwqb5E3GaF0qEA20s+
	RmTbLvqWliUiwwHuEDtSBGUA7+xN+NKdG3wKY4+b2dipovrI6Vc2p8hs3aN+nBj8/cJOAAYdnjt
	JopbqCH/xClmokK4=
X-Received: by 2002:a05:622a:1903:b0:52f:aa3f:947 with SMTP id d75a77b69052e-52fb93d8db3mr191848511cf.13.1788032506831;
        Sat, 29 Aug 2026 12:41:46 -0700 (PDT)
X-Received: by 2002:a05:622a:1903:b0:52f:aa3f:947 with SMTP id d75a77b69052e-52fb93d8db3mr191848201cf.13.1788032506367;
        Sat, 29 Aug 2026 12:41:46 -0700 (PDT)
Received: from quoll ([178.197.219.214])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49b4c321184sm288399155e9.11.2026.08.29.12.41.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 29 Aug 2026 12:41:45 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        =?UTF-8?q?Andreas=20F=C3=A4rber?= <afaerber@suse.de>,
        Manivannan Sadhasivam <mani@kernel.org>, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        linux-actions@lists.infradead.org, linux-kernel@vger.kernel.org
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: [PATCH 1/2] ARM: dts: actions: owl-s500: Replace spaces indentation with tabs
Date: Sat, 29 Aug 2026 21:41:41 +0200
Message-ID: <20260829194140.108124-3-krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1631; i=krzysztof.kozlowski@oss.qualcomm.com;
 h=from:subject; bh=+6/8xDZthmh634DUqOXAa/rFhX/OfOYHFjYz6AZlfu8=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBqkzX0ghEMAMxhTZ5cyy8ymZMj2DHVjHuWWybsl
 sbIs/AvbKmJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCapM19AAKCRDBN2bmhouD
 137yD/42OqxFqymCxRmsIJX1+mJ3UX60exe8tWrVf2CRM6IoEby6+l+1EoL7Q02JPLtIzxO3KCK
 5ZRP3mksme5eHtnjhf66LCgejsns9f5SNhQtKO3oUdKlxQI2saw5vINIqFKkGhe6GX9+emIt69b
 TUV8lex6pjz3M1vPwqS8p/sgjOqi7F6iVF3ZnIFVsLdUp373eziwuVqlROZcJu+y9lk+UNc6Bbu
 3tNV4kgM0epR/XVUmH/jji6jfu2hM7JVA9m8IqpiOXQge/lrZY3g+GOIqJT1fRLnNmZnymPsb8n
 ruhHYoEqeYdQXVy6Ms5zbUS/YwM64fhoQzn3Fx/X5pxHCuwKr/9KX9K5uABS3p7wlUZN5T3686P
 mo4IRIe9iLlIIQYJKXcrSuegzzYPg6IKGOqH4JVED4B5a542Dzc/RVBoC/hWDvmzzpW7GZa10BV
 PFqbeY2h7YITjJEnDHKWwOyhZi1D5GG9nHj4YprNZsxKseJvgb/EBWDnK7afJPmu/k6STYJWmhH
 tqvdE38oYRk98y5b0e8UkvUswLHbX3KzFQxY5lZnnX1eyh7Jvk1+Qx3aj1Ds/OAq4whish3O9bL
 7VlXy6rtf4o2ft/KkhoOPsXpLnuoTA/XzKevWbD1fLNGlKTae8LhaSLWi4KSGreusdQdOfbgJ1W YIGX4a9v4QXwTvA==
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp; fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: iYA7vPE0b_dO5IegieZeeB8cMaRW0EUj
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODI5MDE3MSBTYWx0ZWRfX68+qovVx2yRm
 7AhTtglAKPCvQNYEgR2xUfUq8Bk02hw3Ooy6KNOfxpTFNgxLVQrQoh6c6hlGQJxOU8KRftWwdyl
 fGCeCMoAcjJ9nZPdsWFeTr/dXBAfr3+b2BR1SYX1u/Dzz4klTH1nFz2vr4FKndp9SVOgq/NVrY4
 4LVjqG63fVmhhUwCQVV3C71Lamw7A2yokWqEz2JdxAQFIEAsUPVE2SeKmBWdeu0WNVuNBCXpMUl
 snLB9f8s3bNSuOto8aGWZXhX+b0wsH9/VhzlNsWRxLTnVhRhfxFcinQrUduqBNk8iMYDgiAG/oG
 HHYW8Cg0m3gZB03yhlHwQlbk4F2nKBQgIlvcBJw2CRYSr2CwBgg+iycemZLub4WKcTyOsMJkFaq
 f9C8MD24bA6WaJh4BVMqFA7PzRuvjf/Z4TCeX9ILwQpWsVjUU56XSCmxdqyD9uPv3tt9PrEf5eg
 LeFo+wETJcyr7HkAIzA==
X-Proofpoint-GUID: iYA7vPE0b_dO5IegieZeeB8cMaRW0EUj
X-Proofpoint-Spam-Info: AW1haW4tMjYwODI5MDE3MSBTYWx0ZWRfXwLfqoosEJGI+
 0zBGZs+GctpADPIl7tO4bp0TMqzfbYusC3K3z+nJqfLxr/flZxsBKJDWmP4ikrxpOL1EbuGe0ju
 2gvsen5FdBVTYQ6TPH2R4zUv68joRPM=
X-Authority-Analysis: v=2.4 cv=a5kAM0SF c=1 sm=1 tr=0 ts=6a9335fb cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=+bKQE0WJfmhK2875HamI0Q==:17
 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22 a=EUspDBNiAAAA:8
 a=Ta6ShJ3tCWu1s0TIFCkA:9 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-29_05,2026-08-27_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 bulkscore=0 malwarescore=0 phishscore=0 clxscore=1015
 adultscore=0 priorityscore=1501 spamscore=0 impostorscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608290171

Replace excessive spaces for aligning indentation into tabs.  This will
be reported by dt-style-check ("[mixed-indent-chars] too many space
characters in indent (more than 7)").

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
---
 arch/arm/boot/dts/actions/owl-s500.dtsi | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/arch/arm/boot/dts/actions/owl-s500.dtsi b/arch/arm/boot/dts/actions/owl-s500.dtsi
index 739b4b9cec8c..f921654d318e 100644
--- a/arch/arm/boot/dts/actions/owl-s500.dtsi
+++ b/arch/arm/boot/dts/actions/owl-s500.dtsi
@@ -61,9 +61,9 @@ cpu3: cpu@3 {
 	arm-pmu {
 		compatible = "arm,cortex-a9-pmu";
 		interrupts = <GIC_SPI 4 IRQ_TYPE_LEVEL_HIGH>,
-		             <GIC_SPI 5 IRQ_TYPE_LEVEL_HIGH>,
-		             <GIC_SPI 6 IRQ_TYPE_LEVEL_HIGH>,
-		             <GIC_SPI 7 IRQ_TYPE_LEVEL_HIGH>;
+			     <GIC_SPI 5 IRQ_TYPE_LEVEL_HIGH>,
+			     <GIC_SPI 6 IRQ_TYPE_LEVEL_HIGH>,
+			     <GIC_SPI 7 IRQ_TYPE_LEVEL_HIGH>;
 		interrupt-affinity = <&cpu0>, <&cpu1>, <&cpu2>, <&cpu3>;
 	};
 
@@ -247,9 +247,9 @@ timer: timer@b0168000 {
 			compatible = "actions,s500-timer";
 			reg = <0xb0168000 0x8000>;
 			interrupts = <GIC_SPI  8 IRQ_TYPE_LEVEL_HIGH>,
-			             <GIC_SPI  9 IRQ_TYPE_LEVEL_HIGH>,
-			             <GIC_SPI 10 IRQ_TYPE_LEVEL_HIGH>,
-			             <GIC_SPI 11 IRQ_TYPE_LEVEL_HIGH>;
+				     <GIC_SPI  9 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 10 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 11 IRQ_TYPE_LEVEL_HIGH>;
 			interrupt-names = "2hz0", "2hz1", "timer0", "timer1";
 		};
 
-- 
2.53.0

