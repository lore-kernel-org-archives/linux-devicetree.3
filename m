Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E4ABE346E7D
	for <devicetree@vger.kernel.org>; Mon,  6 Jul 2026 10:18:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783333138; cv=none; b=P+KMeVlDAoygIVTKy70co0iab6pam2+samliqV6kk+K/1JkVS884zZQzpIyOAynzTsPikDOBBOMNxDVWL1hFoPWozovqqGn63ZOHYfmQw/ah0q8PwmjWZe3BIH0FA23OZLhnzebVcf+6lVrZYTPlbY3oNGxI50McEvpX1nQ0yR4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783333138; c=relaxed/simple;
	bh=rzcrfrWML2BJ0gMsXtqo1FhFnO4Eq87xgKLk2Ue4Dwg=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=a8UY+9cDCPRcL4iIKHDjjmKN1jPI6lHLuDcl8qwAQl9RqSIviiGcPyMXWHhcAaZfPLXA3/1yg2BOKt+4ChMhTSS/4jttIGEagmaIqIIZnJGs3CJP8ZUXKqtkPEolrb6fT+2RkAnREMYp3udOFiMpjqmPFhJzgoMbDuNaYpu/S20=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=V9rMRWYc; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=BJWFBYH5; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="V9rMRWYc";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="BJWFBYH5"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66693t0h4108055
	for <devicetree@vger.kernel.org>; Mon, 6 Jul 2026 10:18:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=fQ2GFA5H86orDwNKMXkzV5nogt+smM0zeKl
	kT6MOaUU=; b=V9rMRWYcMcbqH+HkNJQnTwp7b4MIoOcJFOk8xJoe/jil3p2ww24
	4Ptl/tjYeblfnrd74NllchoEut1UN8jqK2VNZYrKMejweZ7UcbSW9/SvJ3aZ3f18
	Lz1EUapryrl3z4KX1ILGEud4U5NN7k8eIoL5MW6t3/GDGc5O6KefE34Fcd6V35Z6
	Ypr6F7JgOYvtL+OnZtXx9c21b4e6va0Nwg7oyNyukHLdXBbsYwrzRa8wVN2h+fHL
	M1SOtnvVFPiIJL8CxwyrZKK7CiCL1w1gm3Diy+l1Dzl2mMdEIzBoXOaR0E+C+Jvt
	GdVmHBmn8fTPB2vnRE3MgkW0WhXzLssXf6A==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f87rxrrbx-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 06 Jul 2026 10:18:56 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-92e8004d60eso457464985a.1
        for <devicetree@vger.kernel.org>; Mon, 06 Jul 2026 03:18:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783333135; x=1783937935; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=fQ2GFA5H86orDwNKMXkzV5nogt+smM0zeKlkT6MOaUU=;
        b=BJWFBYH5OwlMoOH3VZzxptW2TzsapRYP1TbvfumMjts/uW6YlHq/IqBt08fRm+8u0e
         YUv3jfQH68h/iMCLUgrz63wjX7i28CEGn1CcM7bqhku4Fj56w31EdkZ1D3J5qjjy5CDZ
         LbKXAmPJf5u4zAoWDVVblFwD+1ub++U8yLTQzRNlxRyDdyq5IlBlsNQpk2amtztSsJPt
         1xlHDmxoFIvwhO9uhnppWB30opX3fhJVUPyIPUrlEJ730H+T2xXRcm9zwoOgmQU0Ejfo
         sGoO+5lkgL3GZVXsYRYJHsTZRmWKtzvYTRYQsA0g6lu6vtF9E1daCg3M9pNnYewuPKAG
         qkCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783333135; x=1783937935;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=fQ2GFA5H86orDwNKMXkzV5nogt+smM0zeKlkT6MOaUU=;
        b=YMjDcbQNniwWX6xfuJNchQuld0YCf+dG963iQ4rug/tOnRWOM6nsulzsIigd1qYRjM
         CLzT7S+t1FTgSjKuh+Km/c14N5qeEo8Y0009sskCfePkEY/Su5D+0BZDXxtcS6G8SkMm
         rTZYSyAFrmGFfq8oZP4mLXPewCfLk5lWNjc6Mb58NZfV81UUxS3lFZxcO8Rh0muiVsx5
         9KBBBMeDM0I33U7jdMfcyrK33dW/9stu//y0pq+JoLgQ+dZ5IofrdmGNKMySFbJIiDxK
         /Uv0URcDoSdqiDIF+vN1RHF0YNtDmoZAWXaBX36TGIy7O5OunJMYnLj2AK2h4ob5UPDJ
         FXQg==
X-Forwarded-Encrypted: i=1; AHgh+Rq3Qu3WeGLGbuDQB48GembqNw5CpEUaTnBq/wf6nxOa7M6JPsQ3ZmBVQSRVvMnLaPfrVgzC+VqoyfvZ@vger.kernel.org
X-Gm-Message-State: AOJu0Yz+7b9CJ+wlSAz/vPzvzhNbIS26Vau/gIKOAHhtMY4Joi97YdOD
	A5as5QF9uMs4zujUpUedWi6o0n8lhkHPvZP4xLL03Z3bI+p0UcsKG/qJYDbcZ9JpH7tcSbtrgCw
	wJwg0VXRbtA2VmNgFomJ2h8wfbEWibBvkYm+D+IeCIYGF+78VPh5M6NRtdUN2ofn3
X-Gm-Gg: AfdE7ckeNcD53X9fPFb93vxsioYVC4hQMUUf/SdzSb4SzyXSiwa7x3NcM+fM/43NJSu
	tI4uBj25bG3rj5MxPEzb5SdpD+XUm+CxPIyPGwT0XLGTCzujgX0qf5a6SsHZPQdI6zSZuyx1MTG
	DKGfb+56P2khYUFY7qmEZVDzJ3X83wyAeDCMe0zlxDyzkCF3bbEI5vssO4MS8zjcwBePL2uqmmU
	DbSqZuclLd3HSFszz0xW2xp29RCbo0lR2iHZYXrWKWtCK6arJ39s6iGPeCtnyn+W2Y5SeGtKjxo
	umbc/2+9UjZewn+tSsU/wMLl46JyT8JF+OZkObYZ6jryCWzodWSziYnuaenQIlzI7R9kV6RFx60
	IIHD2OodMxhyuI9inZiGbG607+Gc=
X-Received: by 2002:a05:620a:a716:b0:92e:9b26:a6a3 with SMTP id af79cd13be357-92e9b26a79cmr1281414285a.49.1783333135399;
        Mon, 06 Jul 2026 03:18:55 -0700 (PDT)
X-Received: by 2002:a05:620a:a716:b0:92e:9b26:a6a3 with SMTP id af79cd13be357-92e9b26a79cmr1281412985a.49.1783333135008;
        Mon, 06 Jul 2026 03:18:55 -0700 (PDT)
Received: from quoll ([178.197.223.174])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47aa039ae4fsm24346278f8f.18.2026.07.06.03.18.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Jul 2026 03:18:54 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        linux-mediatek@lists.infradead.org
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: [PATCH] ARM: dts: mediatek: mt8127: Correct indentation
Date: Mon,  6 Jul 2026 12:18:51 +0200
Message-ID: <20260706101850.341418-2-krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=800; i=krzysztof.kozlowski@oss.qualcomm.com;
 h=from:subject; bh=rzcrfrWML2BJ0gMsXtqo1FhFnO4Eq87xgKLk2Ue4Dwg=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBqS4EKPXfF4cSZKIyPI4Wt9GH830e6lFwLMhVX4
 6zacyVv1zyJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCakuBCgAKCRDBN2bmhouD
 18MqD/9JXuzO5R2siOtzFdqAIN7aZe7fxoM9vJFYVLpPbetTusw4uV4kFaRJzus7ny/Ap/PbaIF
 m0obUJn2cutl5muritFapFA/AJrhllMhiqjPqa3uyDLz6lJ/gqwlxcNR6+d4pgNN+N+6Tozhv2M
 hEO3MFdliaca3XuzT845zY/W3FI2OAz2z/fj052/0DAY+AizmTcqMzakTaYbu69oTp3t0iyDG98
 aAXWnHHEq589hUbgqL74ttJsG2QhqGbNwpwvsgT0HaEyNp3S+ue4kq8r9f7V9BtqQkr4MXktJ5L
 1fWFXjEOXNaITrACWrh2oDSeMLWRWyvd6eGA2aT0J+6XgYSKAtgY3cUqOSpfy7wUZpo0Xy/+8AR
 iuWGR9PtGy+OQtBgLBtp6+y1oqBlqQhnN/72jdVIkMHRXdbUK17VJLeiZIJk7c3eS0GAeZBXTA5
 a/4MXtr+SiZHQmL+QJe2YE8Xu39se/3igEQEw+GzRiICV6dWCFpAK/TbzTCN9RHUmdy1c4MftME
 uo3I6jbkqid4vEytvsvuC6AoxfyPWfqekyALgL52LSgucn47FWKIMF5I10p0qpQCRl4Uzt39jYe
 pnX+GhJ6OakCia4A7tZK0mTA3ntMsHef5hiiDelYRrnZPiBhb/wFcwvfrdULOnXTW/wA3X9Kszk VlBMXavxoTrRHHw==
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp; fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: L9VkDBb49AuVWlwAwXBaNg4VG_L71Rtp
X-Authority-Analysis: v=2.4 cv=Hv1G3UTS c=1 sm=1 tr=0 ts=6a4b8110 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=N6niishs+lR9UBL1FN3Qrw==:17
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22 a=EUspDBNiAAAA:8
 a=tLFoKwMCRvoQtr3NvW8A:9 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA2MDEwNCBTYWx0ZWRfXxav4djAXfBOH
 QYG26Uh/AdJuNHFVmfMHRxE78Hq3wCLYrQdL8aBt7Z1iFceno5RGieqO6MTOcBtbV3IwdRtflzg
 yGy3keTHXbbdgXfG6WauRZX3Yo/N9oU=
X-Proofpoint-GUID: L9VkDBb49AuVWlwAwXBaNg4VG_L71Rtp
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA2MDEwNCBTYWx0ZWRfX5uoxML0vyJxd
 08Dj58GRJjLblsTHDVMDm+ehiXXFoafdU15vKVB0P8jo/633wE4r6YaHpBFtCYRGAMkSce7VKRJ
 BsSk4FWp7cEsq4pz1PRhq0mUv0PmaS5ROt569seg/6oYZlYXvFagsEYGqa2sD/Nk2MiAQirUWDF
 3bO9V1N7TDDqMVWffvn/5oIEyFegap9dG/F06AT7dI44nBxbekNYZqPpJAcOuLZnQDLKSoGFSpf
 0bEkbeH7TZwn3eH47p0HREt/U7T+lfNk5vXEn5jWixhzZY3WSq8+yGmLPkMXnYlJhv6ddCAqQ8z
 ReCdYTTsz0U1bA8Iedb6U/MPoRhiujTe3R5jp2Oit2hwSUF2pp9itFfEJ0SQ/M2Eguh5etgcApf
 ho3nhCDo/pLN0LNnczu05JHVY3eLMclBhFFid3uUPMeFciL2JFlt98bOYhA2SK3WDpcdhcWcUws
 C2tV5/5iorTyKJOl0Kg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-07-06_01,2026-07-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 suspectscore=0 malwarescore=0 adultscore=0 priorityscore=1501
 spamscore=0 bulkscore=0 clxscore=1015 lowpriorityscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607060104

Correct spaces or mix of tabs+spaces into proper tab-indented lines.
No functional impact (same DTB).

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

---

Ongoing bigger work for all bindings and DTS with built-in checker (dt-check-style).
---
 arch/arm/boot/dts/mediatek/mt8127.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm/boot/dts/mediatek/mt8127.dtsi b/arch/arm/boot/dts/mediatek/mt8127.dtsi
index aced173c2a52..bd61ec7e70c0 100644
--- a/arch/arm/boot/dts/mediatek/mt8127.dtsi
+++ b/arch/arm/boot/dts/mediatek/mt8127.dtsi
@@ -75,7 +75,7 @@ uart_clk: dummy26m {
 			compatible = "fixed-clock";
 			clock-frequency = <26000000>;
 			#clock-cells = <0>;
-                };
+		};
 	};
 
 	timer {
-- 
2.53.0

