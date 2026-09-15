Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D11A844B69C
	for <devicetree@vger.kernel.org>; Tue, 15 Sep 2026 07:20:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789456814; cv=none; b=GObEKVhU28fFT3AveiWLE0PMvySZu+CfnANbsU+xf99cFSpbWAtCSWljI4pMmmNTV1Zgx9Cug+qY7KyvXahtnBxbG0+210vmJWVU41KJI/A5Aa0FP3LBMCBl7G/2QsAEyTY5Vtz6y9kme0VXyTF+82UIRKdnhdot7qutZdSxnLU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789456814; c=relaxed/simple;
	bh=01ysVpcOE6R2esRBaW2jUf1jKl/VdIRiVfhxn++neYE=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=XstHYF2ZvYlZ4dynKlGuBtrTApbr3HXzwiEx44WM6e+WfkxgWqOWgFNOEqTO6uHxpBc5oGoAHndbtrjW2W5/irN5NO36RuZ3tJNKIQL8eo9V+pChfWv2Z7jL1UQDsPwNMBuFXtE2d0JhLr4bd4qDWF5a0PNz9mstWOlW+MJCZuw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=fNhLWy3I; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=F975oyLN; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="fNhLWy3I";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="F975oyLN"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68F6Zd1u3824091
	for <devicetree@vger.kernel.org>; Tue, 15 Sep 2026 07:20:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=SehUk9k3CRKJXFemuL5gzZ7zkv1/5zSVASo
	RxDQ27qI=; b=fNhLWy3IXQ6E4lIC3bSqx4X+J76FF6WF61ZA7ngB2xj1xapYeN5
	BfRVHzDqpfQgf4oQ393ZXCI880pwUOmshrlouW9+aNb9qta+hcTjXaloBnLuxkZR
	uebiuNr0IxuP2eNegTY1hPir9w7M9mKhdbF6b++sZP8aWWrR7xzTMtpw3yk9GobQ
	tyFdrJcsmxa506Jrb+jneZvyVq4cYSwIeJ5m9DbjekShQ745+UNTBGIop65sdRCJ
	Wz2uRhDMLHvZYyAJ77cquzv+UbNu+gXdYP30SQNxe7jlhKXmTIGMk5Gm+RFxOT1J
	4Vf06pNo3oC+3h/aiB/JFfBFnJleCTklpgw==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gpn41u16k-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 15 Sep 2026 07:20:12 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-93a1bffc2eeso578583985a.2
        for <devicetree@vger.kernel.org>; Tue, 15 Sep 2026 00:20:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789456811; x=1790061611; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=SehUk9k3CRKJXFemuL5gzZ7zkv1/5zSVASoRxDQ27qI=;
        b=F975oyLN/5UB/QAj4bxzZyTgH5UupvnHqUgJqVXGwMvjfPfP2WdeffxekculILBdgQ
         rZ3i0jn+QOrIoUYDNvRUw9i391Qq9klSmdn7Z7NM6t4zWHKJUxtBdELPx4zy2vw7dQjl
         lrbQqE1LihnrvkchavXBXGo65pQG8DAhHqciOqxOr0BddFnVcVZWLG6NhIZddejxoyGh
         37CW49h8Pha5Tq07582iO8WL0Q4TE8yBn5C+aHO0WDq1pzKD5ozjMAmvDUjSZlvofLMs
         VY2TGF1jcG/h6f2S0YM/o6oQGB+tzI+TQDFEuGcVUohjH43lL0CvmV9HWuBist6CP/o9
         E+tA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789456811; x=1790061611;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=SehUk9k3CRKJXFemuL5gzZ7zkv1/5zSVASoRxDQ27qI=;
        b=z4R8rqW6KJ9M6aGrAyq2AkQF1zuFaw8zu/lTgyoElyV2dk3wehSMRN/yB+mximdr6i
         n73oZjF3DKH3M49OF+sihAF85UoDiGiKp/bu6kVPTA+5F30DCUGwlMg15CNjE/dw5y5r
         VOhY+d4980k7KF4abCrckeTSF9vTWUnET2ODqbmh5OFaxaO+JXlnZbs1ryGi89U+MatF
         r2EqcustgExmXVXrPsurz3eoxnYINphISfN3KWlATPVSVE43llE8Le1PXC5KA5aDf6EQ
         AbUUPxTeyYhi6Nvb0NsY8osJp+v7uW3T9qrB1QfYVWAVYhfMs3a+fKrkZWWYuo/dL0+h
         5V9g==
X-Forwarded-Encrypted: i=1; AKwUvBwTt5mbcj4+9rTaRW3E/7HaxKL04tBqFog3ORYFfRUfqZTGw7A2EA7/pRoXsciXpD3kgIGpUVdngcb0@vger.kernel.org
X-Gm-Message-State: AFuF++lEOKnX4/o0QHew50xggaG+JwqscbZZ8qGpnR6x1nPYbMnQ0ZNP
	mX8hhxYq1pJ90Xd4OJvrgf7xX+IwzJYeAjtP9XIRAjyVPDT/0jRNHMHz5DVZHF8VAbHk1A7Ckx0
	lscgasIEZr1yfpthebQ5tXqeQaUxcjxx93adUU+3Gq3WsVwnF5OwjREXMVhlB+pf8NVQdtFW5
X-Gm-Gg: AYBFou3N0AqffUs34OyH8tfLg+Jit4KlDWnqnXszJy6P9EiOoDtRc+h3czeH/6XG5oN
	kHA9BnMiYVd7twb2BWvAkLeuwVqvZc3fYlqzn9ffNs+ybRWSh11OGLpTstj14YgqWZUtSWVleh0
	Frx1UEO6/7V+9WpKe6LgUVtN54gDkGmNc24RXz8cj95oMNqVMyRzbdT+RiraXhXN+7wW0t9+IRF
	ReUcMcToGDgVdb1WNmdg8WgqpadVCCQqNqNWTPWQb2IQ+slQpAX8hdTyDSYpKU0f30yD+Zs3Lzk
	aIUpMYD1En6AtIYDoMdyQ7EVOOt8lPuK5l36RAJCRuDRTsZdYUdfq7+R6YG+kJWdL0ACNHin5m0
	GSyA9KpMhuNch1gI=
X-Received: by 2002:a05:620a:458e:b0:936:ea0d:ffc3 with SMTP id af79cd13be357-93a29804733mr928466085a.22.1789456806178;
        Tue, 15 Sep 2026 00:20:06 -0700 (PDT)
X-Received: by 2002:a05:620a:458e:b0:936:ea0d:ffc3 with SMTP id af79cd13be357-93a29804733mr928463185a.22.1789456805831;
        Tue, 15 Sep 2026 00:20:05 -0700 (PDT)
Received: from quoll ([178.197.219.214])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49e7d6a9d1dsm52558805e9.10.2026.09.15.00.20.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Sep 2026 00:20:05 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Huacai Chen <chenhuacai@kernel.org>, WANG Xuerui <kernel@xen0n.name>,
        devicetree@vger.kernel.org, loongarch@lists.linux.dev,
        linux-kernel@vger.kernel.org
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: [PATCH] LoongArch: dts: loongson-2k0500: Drop unsupported bus_id in DWMAC
Date: Tue, 15 Sep 2026 09:20:01 +0200
Message-ID: <20260915072000.47367-2-krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=962; i=krzysztof.kozlowski@oss.qualcomm.com;
 h=from:subject; bh=01ysVpcOE6R2esRBaW2jUf1jKl/VdIRiVfhxn++neYE=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBqqPGg79k/3DTgj9mfp6dZvto3S7TYprOl7QaXG
 ycXfC0ly0+JAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCaqjxoAAKCRDBN2bmhouD
 14BJEACIG5O4D6Y/82v5a81YQ+E5215/HHIm2xtpQ7zEcuv0wkf49rvEui48I+d6wIUHtbqWoME
 1x/H1ujHXS+Bl/4g+PjOYTj7wMItPe2JEZC/RhVwVeBFE+nqzN8stsDG9ksJqoedmzguawQqlMp
 y64uLMz4pQniqsbusL/lGrDTGGB4493JCb4b/E4+5pHQwhq7zf38JQg9cSeHNDI+ewKNFR8Rtak
 oSgO5T0fYElXuJ5eTbx3wC1Y8kn+Vvygi1S48BHMPdeNB2299IEVATm4ylvMQluq7fjUvdO5bfd
 /0KcxLu5dJcC51w7QMNtNhaZNJxAWR+1Fxi9ist6h2+RHIJJK0NWFiHBdsuLrBtS9SH7yqv+KNU
 f1/rnLQvRFT+G8sz+egwubfHb31G71Jsli0OvjmdSzFaRWrr+LE7IAb8+1LgYkcmUHwTZG2GkiI
 2YqTpfS4w4CM+FI7LzVIwpQCeYirKUurWvHKteGrOz5/5C/duLVuR5BucJuGJ2PsSr20zJg738z
 9xT+UTclXxUQ/geoCdgyvY1B4N0tZugc4htwidwnI3zc1uG0+5JfQy3Dl4PaAiZ512TBu5Hylc1
 DU96VdffdLvZvIFUVe/GHxOj4YlpvO0j8nOAINitd0bg/unplgLS2llB6Ug8aEaCJ8pQFkJmkw8 UsbaXH3rExc4Jcg==
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp; fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE1MDEwNCBTYWx0ZWRfXwHXbQge/qCyO
 rQNopSuHsALvIRHB6EP+8raHP/DHnCSlW4Q5ukhjlXNVRxskYMwG5IG9HaWRSWU1gXwF6J03QyR
 XSU12asTMLvDehOPhK6kQez6Yekftq+vRqZcfS0+TzEB+M7dnVFNIsGHSJryG/utRuJ440KeIL4
 tnzCoTvp+NRflV4XKp8I0DRHARX30uueb6obNASyWp1WZljZLiR4HcOuOwzw/hRX2fv1QikxoSQ
 k/nUXu7l8KDfWVqC3akvWEgWNsBjQM7VO5BroxC+EokTvXjZGJ2BPOaNIPmNdS4dmu14H3Xk5tW
 P0iCvqlASZJn2ZB3cbIGLe6Kd76RAfSuca3o/tQ7PD4nFszKQNOAhUpRvUuZfi0csGdKWxlJXUW
 4Kh9e37vRIn/n2jED+kJKkslQyZvj5JoWBGRMxT0v88KHtPj1KpEPUn8q1btv4s/7DYi5BhJThA
 m3nlogNZ9/KeQv6ZfsA==
X-Proofpoint-GUID: UD2LZmJ66-abh-ZyCRNdOyGGkDai68px
X-Authority-Analysis: v=2.4 cv=cqQOAF4i c=1 sm=1 tr=0 ts=6aa8f1ac cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=+bKQE0WJfmhK2875HamI0Q==:17
 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22 a=EUspDBNiAAAA:8
 a=RHNxK20dIsJZYvHncwQA:9 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-ORIG-GUID: UD2LZmJ66-abh-ZyCRNdOyGGkDai68px
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE1MDEwNCBTYWx0ZWRfX6ULjho+H9jTj
 xwwhDZXBXHIxOtvLHUOAVeU1frFOtKPb5eC3SdM6IWLXLNymUch2U8Yy0CVRZMR242yhMcYQMzU
 Y6XaOAKNXkJJ+qAk5df+6k5jnALoJ9g=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-15_02,2026-09-14_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 adultscore=0 phishscore=0 priorityscore=1501 malwarescore=0
 suspectscore=0 spamscore=0 lowpriorityscore=0 impostorscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609150104

There is no "bus_id" property at all defined in the bindings and new DTS
is not allowed to bring undocumented properties.  Fix dtbs_check
warning:

  loongson-2k0500-ref.dtb: ethernet@1f020000 (snps,dwmac-3.70a): bus_id: b'\x00\x00\x00\x00' is not of type 'object', 'integer', 'array', 'boolean', 'null'

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
---
 arch/loongarch/boot/dts/loongson-2k0500-ref.dts | 2 --
 1 file changed, 2 deletions(-)

diff --git a/arch/loongarch/boot/dts/loongson-2k0500-ref.dts b/arch/loongarch/boot/dts/loongson-2k0500-ref.dts
index 7ace54c84244..d2a3ed9fa578 100644
--- a/arch/loongarch/boot/dts/loongson-2k0500-ref.dts
+++ b/arch/loongarch/boot/dts/loongson-2k0500-ref.dts
@@ -73,14 +73,12 @@ &gmac0 {
 	status = "okay";
 
 	phy-mode = "rgmii-id";
-	bus_id = <0x0>;
 };
 
 &gmac1 {
 	status = "okay";
 
 	phy-mode = "rgmii-id";
-	bus_id = <0x1>;
 };
 
 &i2c0 {
-- 
2.53.0

