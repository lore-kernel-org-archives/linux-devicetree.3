Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795795666;
	b=Q/J6fMic98PlcC/VU0KZ4Kfc0ZLZLQeyjDo7i3Ko1ASdYXZTUh5UfMEUYvwpuRAzuIB8
	 mZDbM2EcaijXT66F8OoRyNl3uATfeN3IOGN85+zOb84RNw7lvZm+saqAZsGYiCev7EEcb
	 AxJRkvk5DB7g6e6GLAnzbiDFYjjtMKiXGW4yelrv7xA3GQF59ipQPQg8ZT6u737szgi6B
	 I2/bUxXxBzMHGGDZU5UPLNzXXNcE+avqJ0fX4LoqAjnfjpeoM9ldehe+sZDx5mTbdeZsq
	 bcZI87XDqg8MEqjEPAYwym+qSWGfVIph9iOK5FiyuFkG+J9w5j79boM5wvsUCn1IVYg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795795666;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-GUID:X-Proofpoint-Spam-Details-Enc:X-Authority-Analysis:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=LDve/dz+oy8svKtS2MdOS1ixX/cP30Dbme7NV1o9tLY=;
	b=rXgWr1zIVEE7iTGeeHxprvssTZQHll+3aZQ11C9nn/kFOUlTYkIjz9B5qDQN6BtI5xGc
	 P29Rwvlalvo0/Ln/Q9v3tp7k+dz81iCd7XoWDHs2MwRPgFDwB6Aw64e+KPOMnS89Vj1h0
	 qtXPKP5b2MxvVb9Pbd7l1nuvq861iAjlXo0F6Cjlwo/WKJ3fpophvo0SPRQ0mvPlMxIbt
	 k3Ai3DkQgUqqLWL8QC81FjlLnTSiXH30bqZ2EJQH66Q1iV3EyvunUBOdWr16nz8xbSA1A
	 aQwrrR4mKnMDNs67ZGxmvWrQIMQyhJ+JMPc/drnwSIVXWIiJv7bLHpUhjrkubMIl4yQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=fiAXSHT7;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=P2A6T2L5;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 749A6606A33E
	for <devicetree@vger.kernel.org>; Fri, 27 Nov 2026 16:07:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 749A6606A33E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=fiAXSHT7;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=P2A6T2L5
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6ARFp9XS2712069
	for <devicetree@vger.kernel.org>; Fri, 27 Nov 2026 16:07:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	LDve/dz+oy8svKtS2MdOS1ixX/cP30Dbme7NV1o9tLY=; b=fiAXSHT7Y1boPPhF
	Qg23XEUKsfDzWY3hMqhcosHPiUf7YXbZeN74E56z+YS+xLj/2bXojzTgxvwkWuuV
	5/WvVrAcqZ8KTIvCjgKg7+bUJ/aIQTT+dD0DGR6MDoNPCiF1qH9z64mIvKedZEC/
	YW2b6Tdx5kpvxZGyWX6d2k4rFpXWn2MKhyqJpltvnEyeEMr+5WZUBSkmE0vzr7rB
	OVqDkQSPbPLUl49EsYKI2AzE2t6nOrWJ5kCDUn8+/OI/0cl4Qh9QbjMz1Tblr3Jb
	bJ+tT4yxHLcsB5QxsX5FItbc0N9n8zZqS8f1P4igEtFEWoJJjqY79J43+57ColUb
	Wov+/A==
Received: from mail-yw1-f197.google.com (mail-yw1-f197.google.com [209.85.128.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j74gat6cb-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Fri, 27 Nov 2026 16:07:44 +0000 (GMT)
Received: by mail-yw1-f197.google.com with SMTP id 00721157ae682-8b30ffeb2f5so108512157b3.0
        for <devicetree@vger.kernel.org>; Fri, 27 Nov 2026 08:07:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795795664; x=1796400464; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=LDve/dz+oy8svKtS2MdOS1ixX/cP30Dbme7NV1o9tLY=;
        b=P2A6T2L5ISeFsDzTFECAQUrZmshD1ttqWLne6rt6D3ymrV8BzX1JAwgEvSPW5dPZdn
         ml17BA3L3T2j9jlBffahloyD+htYxSTxRllU6z823V2sAG+xnW0RcTr8Tsu6U9oKmySa
         e9sFhvxm+20eS8v0FmsSv7CCfIUpOWc41YVAN+svQAYc9Z7/adRTprw0Fc/61rYaaiR6
         qSP3NVGl8InUImBjqQIMuGaVi+3pive7QTQezh5j4h3SqAAw0dNTiuWBU5h4spEITzRw
         DlPlRVyKp65WvcPfvmVfL7uSS6+ypxx7gsoMSa7Nx3FEysZ6+OzvA1/LZi7a5spJlrMu
         vRCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795795664; x=1796400464;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=LDve/dz+oy8svKtS2MdOS1ixX/cP30Dbme7NV1o9tLY=;
        b=RBgZ0wbB+1XzjPc+VR6NpzQwdVYBH3aWqKyEabuM6MQNGlrRrq0aO4ICN5yDluJWIp
         GMqLzOWsnTLEHuMGkbALmU5h6+SWc45nVEQrhiFmaX50iu3uhhhiVrnVMICOifTGygud
         p/78HH6fRtxbM/85JCaPMwj3cahvlFQjTP1wiDxOy5ZdIsmgnZkDrveOw+zt2W6wlSYD
         3S+tBcGsRfKAU6DEqoiEOufOcncVCf7UKgPEsS4mU6joCZMU9fZJypT7mv8Y0jbAo7Sl
         B/UEh8WhbUZMloi/wNaCTAN/hL9olePZBIpA7SR+l0y0CPMVMVkdmVDVylZhs+4/IMm+
         1Alg==
X-Forwarded-Encrypted: i=1; AL+hErH1jGxU5zAgg67k/1TBqDX1jP58VfYoZy405Xq/GXjrR24aAjtF4rdYt6MgzgqyE9QloATl0+yNN8HO@vger.kernel.org
X-Gm-Message-State: APuU4Z89BOFPpjjZcLah6QfS41r0PbGnZNHtAww8RRRGIdALV9tAX9Iv
	n+FcZ27wOqIFvVJUMk47Yj+5WjZqbwfRPCNiEqkW9Lf+vH6Eomt78rhuy4upx5TRHjlDFOlF6uL
	C6V/tQGF1zPRbahymV6GG190UASNdhaNtTR//BUuXOM0sUJ+aI6XQyYiTJsLowToB
X-Gm-Gg: AZFdTZeV55FUU0nPGkNQHsyN4KdZiA4165EKneR/nrVBF6wFD9qznGKlmKByljUFUtQ
	LibcmzAmnC2oo54AEHBdaPayBsZjnf0yy5Tild41WDKK9EHg3YNHrElq+Obj482psLHhlSJR5QC
	t84C7Ce+h6WttIj3AU+hkBzjD/+nX74pKTHe2z4trbmVLtHGkHAt9fcMwqHz3OM2qXOlTzaOWRi
	SpQBPon3hlYv8zO2eLcDb6jQQ2ebMzLhpT84kCAZ7CYn30VzaFJBW9g95nre4p+qHQrkdRXaXVy
	BODrXynOZrvmRozY/+FJIBKG0wKRZ3nKfJXf/XYU5Kcs4wlC0PUKGEgSswVu5rAUJMCz9+42ZCf
	9aZziH1zDK5CjJNwZzT+6I0BeQD26kmSJK+yx7T0KXh5eKsHXi4C4bEdKmbi59KBTgscmEZkBS2
	l3bsXi5kfLQ7QDHUZ41SG70RJgQClFZKICAd5jH3558gpHbpMCFL0YG1NobcnHOhM=
X-Received: by 2002:a05:690c:a89:b0:8b3:7782:675d with SMTP id 00721157ae682-8b5204d8021mr100633597b3.47.1795795663825;
        Fri, 27 Nov 2026 08:07:43 -0800 (PST)
X-Received: by 2002:a05:690c:a89:b0:8b3:7782:675d with SMTP id 00721157ae682-8b5204d8021mr100632857b3.47.1795795662990;
        Fri, 27 Nov 2026 08:07:42 -0800 (PST)
Received: from brgl-qcom.local (2a01cb1d00dc7e0089167b9b97a26c96.ipv6.abo.wanadoo.fr. [2a01:cb1d:dc:7e00:8916:7b9b:97a2:6c96])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4ab6ae2dd55sm46623137f8f.30.2026.11.27.08.07.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Nov 2026 08:07:42 -0800 (PST)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Date: Fri, 27 Nov 2026 17:07:37 +0100
Subject: [PATCH v4 1/2] arm64: dts: qcom: lemans: fix iommus SID mask for
 ethernet nodes
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
Message-Id: <20261127-sa8255p-emac-dts-v4-1-f0c5a95cc6c0@oss.qualcomm.com>
References: <20261127-sa8255p-emac-dts-v4-0-f0c5a95cc6c0@oss.qualcomm.com>
In-Reply-To: <20261127-sa8255p-emac-dts-v4-0-f0c5a95cc6c0@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Shawn Guo <shengchao.guo@oss.qualcomm.com>,
        Andrew Halaney <ahalaney@redhat.com>,
        Richard Cochran <richardcochran@gmail.com>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, netdev@vger.kernel.org,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1438;
 i=bartosz.golaszewski@oss.qualcomm.com; h=from:subject:message-id;
 bh=5XFVjff/QR80SQLKKFqKe3LuP6yj+0SGfsOuiR06Wa4=;
 b=owEBbQKS/ZANAwAKAQWdLsv/NoTDAcsmYgBrCarKvw9wSH3FLno4NflMnR1+eeMpV13hBh0gb
 u6WX/rlxNaJAjMEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCawmqygAKCRAFnS7L/zaE
 wwryD/4rvgx/F6iajtGvhQ/lg7INvhEWm9d7ZcpEDUtKR4V64LidQ+FH8nRtH/d+BJElALor1JE
 C3yx0ZFQ7ZvDQbQlp4TQsPRzxOCa7TCtbxtsxO447c0utky79Uk2erAlFGY5JbeRb3SEBN+tii+
 zjnCCzWncmrjlGCtd5AkBk1edKUHTkxNeoHGP3J/i8mz848Uzzl45iQF3pEzqedjTsDSPRw/zeC
 09JjAECH9+qNLaNmYFhqO0NxV20oUM9osat+tvXhACZ0XWFGgiVYEM+/HUIt5+83Vd5vVMGWB3Y
 7ORw47S0hxGzBSFzKl1ODV8pNSaIvXcBwR4U3GRwpMUc27UelBUuouyOrqducPyaH3Fc4Et/nJY
 u9vm+b7nAS4U5bmGz9UUA0FEbTVOOi68Ky3jTY6uhoiehiAQJ5q5te7Mq5dtkIK7e+1Q7RSGZaS
 AC/6d4NsgHYtioQ1c/kBQ8WyhuL4XSSt9Q4Nqr78GQZcdwB3goxHYWlnhewdazU3P4fvGo0nL7C
 g+40+bs+Jo3eWd6g2q8uokwshW9bYd8/i8/+w4lPkSLfRPZ5ZXursq3kpLIY1F0PWXRA8X79Xpp
 9Evywv8L6tbmLjtfstTc46H/7+7W3vv5pOXDo3n9KMKU7ZAHP9TYDIXnIQID/1venTFw/EkwO+i
 AmGbi7vUoxKKDMA==
X-Developer-Key: i=bartosz.golaszewski@oss.qualcomm.com; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Proofpoint-ORIG-GUID: 5To4pnA2aqeNeSBhyC9UqZas5iAjbRUS
X-Proofpoint-GUID: 5To4pnA2aqeNeSBhyC9UqZas5iAjbRUS
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI3MDA2NCBTYWx0ZWRfX656q7OtEd1pX
 4zSq/Z6P4gj52wdGLsSZoEjXSFTTM5u2qsSlQQpLQmq7M4RkzL6mv4CcQ1qhDn/u477nJzT72JO
 jUSROg5SgKfqu+hnrnSPmAvZ2pas6/NprmbIKThXO5b8DSYw+1gAsw1q12XL0R1+QcoEpJQi2km
 R5zvheDD45cDw2irOvaW/8E9mdrwNhVoHyEYkExadAW4nKXh4yiYO0HhmVgnOcLDoD7SF9AzW6y
 A3AgJb5XW1xAAJEtUP69q49/0uQKBCqw8uT2VELbgqkDVnv4m28KUDWnvXWojpfXLDu8Ibuuhq7
 s4b9595ndNtfdM8hH34ITD360T4tR7T+370pNMGK355TsbhvvLJw3GlHyMEwzFXxJIYudz1SdVk
 /UJtJGaOoFcXeb7sgb7ZcfqodS/y6KyToWo1gY+Ze9MCiTgd7Zk2yBfbdfWwnhgMi0fhSfjBDN0
 8+fPnQMuP93oXHk/lqA==
X-Authority-Analysis: v=2.4 cv=I5bw19gg c=1 sm=1 tr=0 ts=6b09aad0 cx=c_pps
 a=0mLRTIufkjop4KoA/9S1MA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22 a=EUspDBNiAAAA:8
 a=jHMX-OgH2kBFWhD5V08A:9 a=QEXdDO2ut3YA:10 a=WgItmB6HBUc_1uVUp3mg:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI3MDA2NCBTYWx0ZWRfX/3RXziNz2e+p
 ruBBbi7DGpPd/ysJvLotfkfPUa9EzylY52mTyKGRQ2WQWqWCIs9wFNX08n/gjnFF8WO9CJQixh8
 YwFM0UrgP+mQTuYWKc9GMls7N2v6u58=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-27_03,2026-11-27_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 phishscore=0 suspectscore=0 bulkscore=0 priorityscore=1501
 malwarescore=0 lowpriorityscore=0 clxscore=1015 impostorscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611270064

The iommus mask for ethernet nodes is wrong, it makes the SMMU mask 16
stream IDs per MAC. We should actually only use 8 SIDs. This has
triggered a crash on sa8255p after a boot firmware update. Use the
correct value of 0x7.

Fixes: e952348a7cc7 ("arm64: dts: qcom: sa8775p: add a node for EMAC1")
Fixes: ff499a0fbb23 ("arm64: dts: qcom: sa8775p: add the first 1Gb ethernet interface")
Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/lemans.dtsi | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/lemans.dtsi b/arch/arm64/boot/dts/qcom/lemans.dtsi
index e298747c06bc4519d10f3f0765d0d6a54aac19b3..4e1755a7f2cdce07c454329760cf9a1a2b6b3977 100644
--- a/arch/arm64/boot/dts/qcom/lemans.dtsi
+++ b/arch/arm64/boot/dts/qcom/lemans.dtsi
@@ -4401,7 +4401,7 @@ ethernet1: ethernet@23000000 {
 				     <GIC_SPI 781 IRQ_TYPE_LEVEL_HIGH>;
 			interrupt-names = "macirq", "sfty";
 
-			iommus = <&apps_smmu 0x140 0xf>;
+			iommus = <&apps_smmu 0x140 0x7>;
 			dma-coherent;
 
 			snps,tso;
@@ -4422,7 +4422,7 @@ ethernet0: ethernet@23040000 {
 				     <GIC_SPI 782 IRQ_TYPE_LEVEL_HIGH>;
 			interrupt-names = "macirq", "sfty";
 
-			iommus = <&apps_smmu 0x120 0xf>;
+			iommus = <&apps_smmu 0x120 0x7>;
 			dma-coherent;
 
 			snps,tso;

-- 
2.47.3

