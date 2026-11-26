Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795693069;
	b=Jm18pPC3ETS44HpLJnjzRNxH8PSNO4aEOBunZaZkphZmNPdoDjEEdR5KNev+erVK3ZIB
	 KlCbmNK8nr0Yfif6/0IzbGtHonpuKjuRiuvf6214MnephxFOOt3UTnev2+ZIt5X9SEnO/
	 sOYuDKaUlbX+VuSpsJQ6Q0SbwiWcJtmtA4Cpu7GtTQ+GH8P7vuKUHkO4fO4AeWoD2k721
	 EOgXRERhGGQN9Kl6TCJC/QsE0jFsBZ9bFtoS/dqHp5YTAgjBBI8cnVnUeuN59o+WGDJCM
	 xvlJkokL8MvhGId+Kq+EgWSymyV+hHPjSuqKxNY/vbrBtQ+qa8WF2DbPeSaXm7FgxJA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795693069;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-GUID:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Info:X-Authority-Analysis:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=1H+FE6kLZFrXby5VphVQHarfHz52chCR2U1Jt0HCyW0=;
	b=Zn4qaPJ+sr3H4H3z/53IpMrBboqtjDPTT7/pAzhXK78wfT+CxKd9swE/OAdyYONd1tp4
	 4ra1l7yncJ2q6RAJ01VrkeFrxeQmB29TCWm3vArd7t3sxG+ElcJGOdNbRks+mTZwJ9JQG
	 S/vMZOBPTU2hlHvzsHQn/XD+If/3s/v5K5jUo+qNBqKwkX+uM3rvYCMRs1pX5wgmzzOZo
	 PJrDlnjTiEzw8zQRBt9S9l/8CiyCQ8fwN97DwhTqZCN2JbYKrusyUSlRsdzOQXw/6ZClO
	 MsGXfj4PV/lbjqOOtDhaH7TkjWfwx9U2mS2uxwFGEEh9PCeAJgLghILPkTCuc283wXw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=AXrIv5Gz;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=ARrkrFxh;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EB4A3606A338
	for <devicetree@vger.kernel.org>; Thu, 26 Nov 2026 11:37:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org EB4A3606A338
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=AXrIv5Gz;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=ARrkrFxh
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AQBVigP2263813
	for <devicetree@vger.kernel.org>; Thu, 26 Nov 2026 11:37:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	1H+FE6kLZFrXby5VphVQHarfHz52chCR2U1Jt0HCyW0=; b=AXrIv5Gz8xeLTr/P
	16C6KVD3hjLVUUicfD96RUkcXn0jLCTm6gP02Puti68CDEVli60R8A93EURcJlWN
	cg9ent/Ier0zWYVG2j0SZ9ltdA8RP7/raqEW4Sc+jFbIwNX8P37lGQVBsoKVz9Xx
	7iYX2DSdtf8D+1Y0TPaXbiEkIWyU34we6k6ISzkDPLWqoxPaPpQJAK4KBALgaJv6
	HsJzcc67E6mrhdRRDFw76aeSvWT+OJzQX7CLdxOtt8NtEAjxSUM16ja6Ks1ggb3O
	ddhefQytqkOIV5svPS7RrgUtUweUsAtZIQy5dYg8jkhiwVcs5TSyPFne9XbrbHUP
	LxEF9A==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j62aekx7b-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Thu, 26 Nov 2026 11:37:48 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-944138ed63fso539035585a.3
        for <devicetree@vger.kernel.org>; Thu, 26 Nov 2026 03:37:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795693067; x=1796297867; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=1H+FE6kLZFrXby5VphVQHarfHz52chCR2U1Jt0HCyW0=;
        b=ARrkrFxhxx88VZamemwQPr8Lc8H6wczgJXbxpkPKJDjUSloCDCBcKimQs8QBuj7MKY
         C7yxS8GFbEDcfMT7sm994rlkGcUF6b482Y3HCaEcxB7g6PkKATHGHyHCahgws4CAPcDh
         KwM/PFwRDsdzplYLgfTfxAdR99NM2+dOH9cXHi6OMwdGBSf34C/4JX6HZsBgewuJsS6o
         ttW+uphbX5RGZYAYvLHgvNFVcMFxegdOk0Y/gqeb4mQj0Gmo162DhtmJ/5XbOIsleJmd
         dOFS8PFH2kLcDjkeFx/UlZ6tlbSyDIs4saeKSBguKnuEcmZ5g3uVyHJS/kkfgPTDejen
         JO1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795693067; x=1796297867;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=1H+FE6kLZFrXby5VphVQHarfHz52chCR2U1Jt0HCyW0=;
        b=eUPBPchxov4ul2EMz9xyWC0ML9aytzrFni9NyouwKTb4F+iMf/w7bW2+I8FDDpO0VW
         GMkiNvyziQHebpVoVetEG9Ca+5q/nKQrOc4FV82lbEis8WwsS5lPQhe1AAsn41jKrcVL
         iAHjosM+9M9GsiUDNiPn/zw6W2kD4iXua039FsXQ38Htv6ZmyZX0bvT0IuV28niiuZb+
         rO/nZ256luUgeaxlDseiIBaiHICNyigVpZpdzwKginI0frg+8q+U+I3bOoVyqcZFdMvl
         lRZP8nNFHx8ZPZgpGFZw4WGhxrP+2FF2ISbn2dSsjedXEiI8/+aA9I39obUycD5pWDLw
         KHoQ==
X-Forwarded-Encrypted: i=1; AL+hErFadUP+MQtQG3a+qc6rKMjOHnMtzdcRh+vBR+Tj/8H1Vt3ygvcsbHbrv31Ga75igb8k77U7I0EewcVl@vger.kernel.org
X-Gm-Message-State: APuU4Z9hBpqWadKws5LgZlWlU9b2O/xVDXqf+VEviyh7iddDMMfb+8gS
	ZG0rV3N8uIcLVDjchiiMtYgatmGFx6I1lkK7qMTYMwO7/rmmOzDD1Kji/yu6ECVvJ0dnqY0KDqu
	4aWvJ2Xw1E7aaHmS4bkdQP0tKhOMSLop0q3HjwYWfduyhJluhiz1rhjr/Qyr1gM3PPnKbofwC
X-Gm-Gg: AZFdTZdJ/nZ1W+rFHPTaAbJVSLSrv4GlPm7GQ74JQhdX1meIoTS/Fb2NtBY59WHQf0d
	cNrRObEtqrgiza7ACLuUlVz/L962q64LoGdN2X4yFOHLK2gUq4eSlwnDAsSBqaUcjtUhV267etr
	3YAMofHS0lhwewDqsh7nZshZyiuu3aBxteN6q9vqs672z1/0cZyo+cWneILmoj9JVGZwXTuTedH
	f1jd/5dcos7bbGmWIBAPcJaKlCkLvZHMUgdOzJyJC8XgK/DG0t4H4GCLZQYF2NeJRcFV3qwzPfm
	GQt/E16/BrC2gJV29LRuTy9XLhTMpE3eaH723xLHuMi16YPogqlhcJrjfq2PPtxS/NjHaMRmHPi
	+zWqR1TBWAtj3Ayti/pGPoZwF13ijuEUEO4w+WR45xBQNJEdEDSjUhTIGR5fK+HSY7KanBJhc9T
	PqXhyLjaOE5L9o
X-Received: by 2002:a05:620a:270d:b0:949:8109:8bcd with SMTP id af79cd13be357-949bab6d24dmr3486794485a.77.1795693067233;
        Thu, 26 Nov 2026 03:37:47 -0800 (PST)
X-Received: by 2002:a05:620a:270d:b0:949:8109:8bcd with SMTP id af79cd13be357-949bab6d24dmr3486792285a.77.1795693066781;
        Thu, 26 Nov 2026 03:37:46 -0800 (PST)
Received: from [127.0.1.1] (93-159-22-70.cgnat.inetia.pl. [93.159.22.70])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c513afec08asm748210666b.73.2026.11.26.03.37.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Nov 2026 03:37:46 -0800 (PST)
From: Igor Opaniuk <igor.opaniuk@oss.qualcomm.com>
Date: Thu, 26 Nov 2026 12:36:47 +0100
Subject: [PATCH 1/3] arm64: dts: qcom: qrb2210-arduino-imola: name the QUP
 firmware
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
Message-Id: <20261126-agatti-el2-v1-1-4e25fd64f198@oss.qualcomm.com>
References: <20261126-agatti-el2-v1-0-4e25fd64f198@oss.qualcomm.com>
In-Reply-To: <20261126-agatti-el2-v1-0-4e25fd64f198@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Igor Opaniuk <igor.opaniuk@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI2MDA0NSBTYWx0ZWRfXyMUYfaIPqimy
 HDQrXM2/uUFuSKaGUchTWgiRBw9cSPZkU5MkkXCcuolbWexU7ba00/a+SQUFzb7qc4YD1+UFgVO
 vZ/ljy4ZNtwATQGZR8YC6tPYYK8HieMhNslIrmfND6c+Sg47rO4H9xS5R7o92tQQ+1NrWsoRLxF
 2bdrA1lzeZxDtb16W2OrkroDIER2HlwIavdUjzWVilz1UDRkjOcJvVh30asE/N1KqT2rmQQZEzA
 tluqzblCUI63b72n0VxmDeAj9WTs23DsJ2seFm4EazIS0LCyddTTZnwX/Ip5kDzAMgQZioTJ/Go
 HkDLV5UXNWvP0uN8p99+UceSgxHUlrVe/41p3hirxwD9YyLSYLvgMGdinBAT04bph4TA8qhVEx5
 Zcfn1Ff8NIP0Soos5KlaDP+6YOhIWu4FMXnWIqEn/HeRk3sqVIXF/G2+waPoDCoE8nsz9usypMO
 O5d3kXLId+pso9AAQwQ==
X-Proofpoint-GUID: jKn9NE7oDBqlgU2FzhSIVppraanoIepo
X-Proofpoint-ORIG-GUID: jKn9NE7oDBqlgU2FzhSIVppraanoIepo
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI2MDA0NSBTYWx0ZWRfXx8DVYb0u2ICy
 FqP8APYBaUIlQ3tgHudrJo3XFo9zAzAgxUcwYIbEfZwmxf4L/xVdmvDGeDrbqEPgAT+9uEHKOqx
 kzZl7MC/DenXjc+E8cWpNsD+ZnTbeqY=
X-Authority-Analysis: v=2.4 cv=PqoG/AM3 c=1 sm=1 tr=0 ts=6b081a0c cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=ySe+0nHqNG5yihRO1pIWsw==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=EUspDBNiAAAA:8 a=9bc6S-rvgswZ-E9PJ8YA:9 a=QEXdDO2ut3YA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-26_03,2026-11-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 adultscore=0 malwarescore=0 lowpriorityscore=0 suspectscore=0
 clxscore=1015 priorityscore=1501 impostorscore=0 bulkscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611260045

The geni-se driver loads the QUP firmware into a serial engine that the
boot firmware has left unprogrammed, but only if the wrapper node names
the image. Without the name such engines fail to probe:

  geni_i2c 4a80000.i2c: Failed to read firmware-name property: -22

On the UNO Q this happens for every I2C, SPI and UART controller except
the console when the board boots TF-A and OP-TEE instead of QTEE.

Name the firmware: qupv3fw.elf from the QRB2210 boot binaries release,
the image the stock boot chain loads from the qupfw partition. Engines
that are already programmed are not touched.

Signed-off-by: Igor Opaniuk <igor.opaniuk@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/qrb2210-arduino-imola.dts | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/qrb2210-arduino-imola.dts b/arch/arm64/boot/dts/qcom/qrb2210-arduino-imola.dts
index e99d2a56dc28..f6db8ec25133 100644
--- a/arch/arm64/boot/dts/qcom/qrb2210-arduino-imola.dts
+++ b/arch/arm64/boot/dts/qcom/qrb2210-arduino-imola.dts
@@ -338,6 +338,8 @@ &pm4125_vbus {
 };
 
 &qupv3_id_0 {
+	firmware-name = "qcom/qcm2290/qupv3fw.elf";
+
 	status = "okay";
 };
 

-- 
2.53.0

