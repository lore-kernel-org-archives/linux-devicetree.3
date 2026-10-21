Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792590709;
	b=aftPMdkexxHeKL2pyuD9MnrDlECTLnpkVAGMOtqpTO2ox+ptDzQ0GUAjordVb85dGmgU
	 W9vKYJk0OARRrzCRolhjdoxG2iYV1I1B8IV74WBRf43NhY5YlTTd+CnIlHKG4MsIL9Wqa
	 JqhXxkyGLp/jg1Sr2EHAxNGja3GgpCu+kKXWvVgRbZYC5tK3Y/3VLCCwC/BgLEUB3UoQF
	 yllJ01pheq77HfX7GaoTSIARIL+qb+k6Wn0u33tUZvrOejMqOQYKZrm/uldXX/NyFircE
	 NyDtqsdy1MCGr36VUoRzWMPaCpVKmPSHNYuKUO1oFbJEjgvyLgBSWXzgeYJW/UDxE5g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792590709;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Proofpoint-Spam-Info:
	 X-Proofpoint-GUID:X-Proofpoint-ORIG-GUID:X-Authority-Analysis:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=dVWsWBCRMZYjSHMs8vlsyzTh7G+H8wKUyi8fgvNpbTw=;
	b=Q9pLyewjeYybZBAyPIF0NH+R7cYtXk3IX2HsOxhyarVSger8IshHG4GCUGkoHNWXmOh+
	 zXQoAL7pjUaMFEMAwsVzDzkAS5oLUGjLkJqM9DkYVPuMyDdW9gHxaX/TYmvzTIa8sFhAp
	 Kkr+qBLqP687N3fkDvmE2H8m28Bq6Mzft6bTeh4He0kSiGLpHFlSw1jXweVU8hrHY49kw
	 dJvQYfze3TUPuelYnOipjVdqathSLo85apIZ7OL3IKkQeujbk8zjWMXHi4E3I/G1I9hyk
	 KBrJb10f7K963GhOdpWwYJMN7YnKcGxUa3h80IaRpBmO4VL8ptCqQhxPiyulnCnVzmw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=XRpM+auj;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=N6Ak0N8X;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9960160A263A
	for <devicetree@vger.kernel.org>; Wed, 21 Oct 2026 13:51:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9960160A263A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=XRpM+auj;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=N6Ak0N8X
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69LDHSuv4038187
	for <devicetree@vger.kernel.org>; Wed, 21 Oct 2026 13:51:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	dVWsWBCRMZYjSHMs8vlsyzTh7G+H8wKUyi8fgvNpbTw=; b=XRpM+aujYckvOMNn
	5+yu0Juc7EZshslGjkOahJVUO3kw+BGJJapxZTP4nzSvjnpdR2CqwSBaCJkjiJzY
	LhN6m2vUwjdUMpCnIS7Aj59CtnYdIAxyfiXAOgyl0o99la7byAKe/Tg6z7D/MTqt
	Pc8G+pcgwp+za4Zdt0moTyIoD3pa9uUG9jopZx18l6E+uCBILuECexSkucw0QDaU
	fvjBNP9ebEOflRjZuVA0bzlwIaWNUvkA2i1QPFBAHyAkhhHiAhZkLan92YgMXpKY
	y8WAdunXzmyd+DodUh1xg1lg4BH0Fku2s55XVePcCwKxxtCgdXnt5PhNWy5Mtbyi
	jLww0w==
Received: from mail-dy1-f200.google.com (mail-dy1-f200.google.com [74.125.82.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hex5884s3-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 21 Oct 2026 13:51:47 +0000 (GMT)
Received: by mail-dy1-f200.google.com with SMTP id 5a478bee46e88-36696c9f55bso820326eec.1
        for <devicetree@vger.kernel.org>; Wed, 21 Oct 2026 06:51:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792590707; x=1793195507; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=dVWsWBCRMZYjSHMs8vlsyzTh7G+H8wKUyi8fgvNpbTw=;
        b=N6Ak0N8X/KfFSyA9/PFHAryf3Rltd/07WSOoVG/lbuu6WM2NuiX/sSkZgBRV0aKvj9
         /p4MLYqELiZmER9HN/ftkyMJiWehdJjLmiQsWfNJAWkUCB9g6Z4fh7390bGGsbUxyg8N
         TG9MpRKzeeJGqBHRiugjTgQ222rygcxb6ujXEa05kzMmtVwmXPiLegLPaXJBnciX7JvT
         ximpuTFK6j/yi3VEgKbEhQi+0FBUY+ttCXXyYBklPrcdoLgdJiraJtYPgaSvat6grwTr
         9Ulvfxb4MtjgHBxWtpiDpC+hinesN3DUKob1AvMYuKKLY7zdFjqMNG8gk6si2c6oFDMQ
         tRFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792590707; x=1793195507;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=dVWsWBCRMZYjSHMs8vlsyzTh7G+H8wKUyi8fgvNpbTw=;
        b=KvlRTwrNXOCPbr3PTtXmKdFPWvNdOR3+AsFYOmnizvucf97niyZgaifM8bMmkrYxUt
         Zshu+MGM7M8r2lffsL2UTk/GDMy+oIm+XXlJ1Gh41EctT1aanEc/boW+SjkNO4zlzB1+
         sSGXTjvsXd3YpRFhyfqTJSdNogAxiWmcp3JaRnqjIdIWvECoe1bM+beKrY0BS7NxaCfB
         XuWS6cH2R8pGgM3vRB68tjBH/E0nEsXDpbss1r65lllIlqXsg711d8vvrWAeV8RULfaN
         35D6tw3xHciEoJEHVVTTbl24/WhChB2PwNDswQYWvllPPzMJYJJEcOK1/hKNkOUox2yw
         FCeg==
X-Forwarded-Encrypted: i=1; AKwUvBywpYDsKU81YgBexyqXdc0oeITHtXWoDhjXmUuIA4hkauE7vtze6yy1bpwulQ67lXtPHjXCf7RkX0V/@vger.kernel.org
X-Gm-Message-State: AFq9FYL/gEx+jarK8skG9uyXvXjXpECwGCxVrxY72E6rSWw0ef/s5d1X
	r1WNLwDoROVlWit3k3LYefK/jTbdLPzFavkthEVoVOiIgLPtrhgRiiuNOZJiOoEs16kvacJQTbf
	Y5TH/qkKns/iEWEeyUrA4zudkgc9+H0CF0I/+RI06SMWcD4Nf+i4DZM0PxErE3ZGU
X-Gm-Gg: AYBFou0JbehDtjbBkF/HoifuD6bO4349kN1wwEjAF/zfv3PkT+Wj447L7TslzQURlkV
	lMXDrs9pectMRQe/cBfby6bHhzDM1JdmdXTd3eOIh/u0dB4pE3SiUaUM3O37F+f3kBiTLp2HaV6
	5XNXBsOIY+8m146RcILAqkMdwmOU7lgOfM6ProH5jSFPRGYeZ+RFXsFauUZ+ThwDAS3yYMJJvAo
	IZeHdL6AqY9Mwt1yQGtywAmwt+h8zXQfu3PxpRlMial9Bd6/9eHBoQKF3Nr+GeSzmDLAerFY+Z7
	3S0pA7VA2gYtQQUHxGXEI7d8WIcDMjt91oOBq6D6pDZgyFz4i+Z/lUSuasmfCHXTKbWApCuC7vl
	neofssUIZgfiEMkFks8Uodgj+j+/2S6GP4A==
X-Received: by 2002:a05:693c:8801:10b0:353:7f47:8168 with SMTP id 5a478bee46e88-365fb187594mr6216827eec.17.1792590706919;
        Wed, 21 Oct 2026 06:51:46 -0700 (PDT)
X-Received: by 2002:a05:693c:8801:10b0:353:7f47:8168 with SMTP id 5a478bee46e88-365fb187594mr6216804eec.17.1792590706367;
        Wed, 21 Oct 2026 06:51:46 -0700 (PDT)
Received: from hu-krichai-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36740cc848fsm7534332eec.13.2026.10.21.06.51.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 Oct 2026 06:51:45 -0700 (PDT)
From: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
Date: Wed, 21 Oct 2026 19:21:24 +0530
Subject: [PATCH 3/3] arm64: dts: qcom: glymur-crd: Describe the PCIe M.2
 Key B connector
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
Message-Id: <20261021-pcie6_fix-v1-3-ad37134c35a3@oss.qualcomm.com>
References: <20261021-pcie6_fix-v1-0-ad37134c35a3@oss.qualcomm.com>
In-Reply-To: <20261021-pcie6_fix-v1-0-ad37134c35a3@oss.qualcomm.com>
To: Manivannan Sadhasivam <mani@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-pci@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org,
        linux-arm-msm@vger.kernel.org,
        Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1792590686; l=2234;
 i=krishna.chundru@oss.qualcomm.com; s=20230907; h=from:subject:message-id;
 bh=N4sUA81o0uvR6JdRpINVUf4MY/Mr1oj/T6BQ1Wygh9o=;
 b=Mdyqv8Zf06NuraQphLE0x8nVr/anXhWSoGzD68/+GdqDV3SEHuXyw0N0AGK6CGE3tJDTk5X/X
 0f1Bi/Acn5JCklLc75L4R3KL1umI5ACEtsxpwIhEWvgWEfm5OeQcGnm
X-Developer-Key: i=krishna.chundru@oss.qualcomm.com; a=ed25519;
 pk=10CL2pdAKFyzyOHbfSWHCD0X0my7CXxj8gJScmn1FAg=
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIxMDA1NSBTYWx0ZWRfX2BBSiKwD0diF
 HSf5Zfa12t0Ugdps7aS6HndbSTyc/los2b2wrS3Kc95O5EWJhExI3gnrdaM8reeF4FChwsdQMxL
 ryk/WfKsmcZ4os+WU6UAze0snVq7JI0=
X-Proofpoint-GUID: h2ZezqzL6eUJwv6VSyMjIyXT1brE5II7
X-Proofpoint-ORIG-GUID: h2ZezqzL6eUJwv6VSyMjIyXT1brE5II7
X-Authority-Analysis: v=2.4 cv=Ku7YSmWN c=1 sm=1 tr=0 ts=6ad8c373 cx=c_pps
 a=PfFC4Oe2JQzmKTvty2cRDw==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=EUspDBNiAAAA:8 a=bvY3E1ByFFb03tV5gjAA:9 a=QEXdDO2ut3YA:10
 a=6Ab_bkdmUrQuMsNx7PHu:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIxMDA1NSBTYWx0ZWRfX2qDEOUkyPYke
 qe5tjhTmLWjYLIudMLcmojm1nPAGZV/e4t28yO94oguTAUQ5VSDpJjCXdhkT1SrbOSFXhTvUCrM
 GLO8t1HfCkcaWzRM6Kqs0JH7H0sDPatz84unW60Ouhx9kee33Vi0sR89O9DvEhRlpALwy6okpMj
 4anR0scL9B3+LVyMP95E7MNdE0AZmPzcX2EYhcJAAIIMhqRwXSJ+aEonch6e5AuHwCtFQFyRhOQ
 gtv08XioDWb3lL2HucbI2+3L3UQDgov1X4RhX+L25g4ZsyzjqPdwSEmRY4F8DQ148AJWuJRuUx5
 paxPzY075VPTXkqe6OYt3TVvB3xhY6zTraDMDXSxGHsL+84IcRKGOoJJ/NTFnStSez0BcegrQ8n
 pJMkvoJogrpCKGYpUMRj8KDYWR5d1U6n5l3YfMut+1OAF6Jif3EFqv1lK0Cur+eX6JMgxzaKAXN
 kC/WnDvH0Zh7APkyPeQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-21_03,2026-10-21_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 impostorscore=0 malwarescore=0 adultscore=0 clxscore=1015
 priorityscore=1501 spamscore=0 phishscore=0 bulkscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610210055

The Glymur CRD has a WWAN M.2 slot connected to PCIe6. Currently the
vreg_wwan supply is described directly on the PCIe6 host bridge. As a
result, the supply follows the PCIe controller power state and is turned
off when the controller is powered down, regardless of the requirements
of the device connected to the slot.

Move control of the WWAN supply to the generic
pci-pwrctrl-slot/pwrseq-pcie-m2 framework. This allows slot power to be
coordinated with PCI device power-management requirements and keeps the
supply enabled when required by the PCI device, such as for PME-based
wake-up.

Describe the slot as a PCIe M.2 Mechanical Key B connector and link it
to the PCIe6 Root Port using a graph port/endpoint pair, as required by
the pcie-m2-b-connector binding.

Signed-off-by: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/glymur-crd.dtsi | 29 +++++++++++++++++++++++++++--
 1 file changed, 27 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/glymur-crd.dtsi b/arch/arm64/boot/dts/qcom/glymur-crd.dtsi
index e27c697e3170..73de60b0d0e5 100644
--- a/arch/arm64/boot/dts/qcom/glymur-crd.dtsi
+++ b/arch/arm64/boot/dts/qcom/glymur-crd.dtsi
@@ -237,6 +237,27 @@ vreg_wwan: regulator-wwan {
 		pinctrl-names = "default";
 	};
 
+	wwan-connector {
+		compatible = "pcie-m2-b-connector";
+		vpcie3v3-supply = <&vreg_wwan>;
+
+		ports {
+			#address-cells = <1>;
+			#size-cells = <0>;
+
+			port@0 {
+				reg = <0>;
+				#address-cells = <1>;
+				#size-cells = <0>;
+
+				wwan_m2_pcie_ep: endpoint@0 {
+					reg = <0>;
+					remote-endpoint = <&pcie6_port0_ep>;
+				};
+			};
+		};
+	};
+
 	sound {
 		compatible = "qcom,glymur-sndcard";
 		model = "GLYMUR-CRD";
@@ -810,8 +831,6 @@ &pcie5_port0 {
 };
 
 &pcie6 {
-	vddpe-3v3-supply = <&vreg_wwan>;
-
 	pinctrl-0 = <&pcie6_default>;
 	pinctrl-names = "default";
 
@@ -828,6 +847,12 @@ &pcie6_phy {
 &pcie6_port0 {
 	reset-gpios = <&tlmm 149 GPIO_ACTIVE_LOW>;
 	wake-gpios = <&tlmm 151 GPIO_ACTIVE_LOW>;
+
+	port {
+		pcie6_port0_ep: endpoint {
+			remote-endpoint = <&wwan_m2_pcie_ep>;
+		};
+	};
 };
 
 &pmh0110_f_e1_gpios {

-- 
2.34.1

