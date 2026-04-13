Received: from mx0a-002e3701.pphosted.com (mx0a-002e3701.pphosted.com [148.163.147.86])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7A11338B7D9;
	Mon, 13 Apr 2026 18:33:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.163.147.86
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776105201; cv=none; b=aIu21JahASu7XUltL2irifJM8OW8zff9WSY+/gfhkfW+bRVZf9z4X4gLozmA16GRxGxqa0PzKH3MHrQd6RkFD930uVl+8dEM0QvRLm0jq1quMONjZ+oSZZy8/a5ah/G/PK9tnLELDDkHORparjMeysWOmFhTn6vaOJJcajJCsIQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776105201; c=relaxed/simple;
	bh=Blc0cyWBGhGHDSw9tT2QTYowMsIPJ6zRh6tG830mZpI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=E94P8OmjrdXpW4VN4EANtnyshc5sIhIw2rdLJHiMSP26zMMZMACa5HU/AMcuA6QfjFPA1mt6gkgj5pUfzF3df6irVJrze61ckdUgTlqw4ewgWlE/PACyTWUzgLObqbAbhTjYYkqrsS4RGhDWQTDb4c7VawVB1S8b9BKRwy0nVA4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=hpe.com; spf=pass smtp.mailfrom=hpe.com; dkim=pass (2048-bit key) header.d=hpe.com header.i=@hpe.com header.b=QPEKKRi3; arc=none smtp.client-ip=148.163.147.86
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=hpe.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=hpe.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=hpe.com header.i=@hpe.com header.b="QPEKKRi3"
Received: from pps.filterd (m0134420.ppops.net [127.0.0.1])
	by mx0b-002e3701.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63DHaw2w2904837;
	Mon, 13 Apr 2026 18:33:03 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=hpe.com; h=cc
	:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=pps0720; bh=vx4SoO1veOTgA
	l5kc7rmMtx8QOzy8eO04ZxK9Zwyi0A=; b=QPEKKRi3j5NzTXYgfmIu2hOKxxi0d
	fiqNN1VnjGp9GXhMC4A2vf39euoDDanP/W/YevrAl4g/uyo+qadyV8aWwoNmzsNU
	NWsAtvyw+Oniiht1CnScrxZbRwSKizNPqrl8j1UJ2aAFQ0zVyvwjnLLLtNSyXu5J
	3CGTvUq4Cz8b8UEJA8ECbMXFVcfjF6eEhCtDA7XfGZjhKfnumCl2yFLQ8gULiSiA
	VZqkO/ZNjwyOD3zaGxDbKtQOzUmLx6CcYfN248b2l9BD5FmOuTvJSqg59ecd2yN+
	+qOHW1NHZ4+QPah0pwX17k9KNn5U44MCCWO7uNu+C8AVkEf15DzhOUKJQ==
Received: from p1lg14878.it.hpe.com (p1lg14878.it.hpe.com [16.230.97.204])
	by mx0b-002e3701.pphosted.com (PPS) with ESMTPS id 4dh51x0jgb-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Mon, 13 Apr 2026 18:33:02 +0000 (GMT)
Received: from p1lg14886.dc01.its.hpecorp.net (unknown [10.119.18.237])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by p1lg14878.it.hpe.com (Postfix) with ESMTPS id 60AE789A;
	Mon, 13 Apr 2026 18:32:59 +0000 (UTC)
Received: from hpe.com (unknown [16.231.227.36])
	by p1lg14886.dc01.its.hpecorp.net (Postfix) with ESMTP id 181D08104A2;
	Mon, 13 Apr 2026 18:32:59 +0000 (UTC)
From: nick.hawkins@hpe.com
To: catalin.marinas@arm.com, will@kernel.org
Cc: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
        krzysztof.kozlowski@oss.qualcomm.com, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        Nick Hawkins <nick.hawkins@hpe.com>
Subject: [PATCH v6 4/4] arm64: defconfig: Enable ARCH_HPE
Date: Mon, 13 Apr 2026 18:32:47 +0000
Message-ID: <20260413183247.1381172-5-nick.hawkins@hpe.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260413183247.1381172-1-nick.hawkins@hpe.com>
References: <20260413183247.1381172-1-nick.hawkins@hpe.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=Ks59H2WN c=1 sm=1 tr=0 ts=69dd36de cx=c_pps
 a=UObrlqRbTUrrdMEdGJ+KZA==:117 a=UObrlqRbTUrrdMEdGJ+KZA==:17
 a=A5OVakUREuEA:10 a=VkNPw1HP01LnGYTKEx00:22 a=gQcMVamqm3wCPoSYhaRC:22
 a=RtSn8ETxjE2H05FtM2s8:22 a=MvuuwTCpAAAA:8 a=EUspDBNiAAAA:8
 a=eJgTY4hZ_eZb3zzOyW4A:9
X-Proofpoint-ORIG-GUID: xl2cr-xhRq8b39bY2fylX4qKVJL4q2zN
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDEzMDE4MiBTYWx0ZWRfX6otUxZ2yas/s
 0wFTcmPxziHYTpQLzdCanz3OMvlqKjfsEA+s/nqVcmCSkXF9wKwgCBL8WBxnvsK6MnTcSOL5nmh
 sjrNYIWNXemT7fJkiUMqMOMtvT47oUH3HeeKPBtdp1Ty0NqERiwBhCG03uf3OejJ1TkRn5Z+Khm
 NPbxSimaB5Mf6jjklcgVhM+m9AYRojecUozecfxyFOC6dqkq1iFNxdo4qcmia/V/6CxirOnLcGk
 n3NwmamM9Ly2cKBoqc1/tKSf2wdWB7l40g/445IlRlv4ycgmjyR8WLONCAqnZS4IFN4HR+VAGFX
 KBnsroOIezFrjfUZxgFJnIqOy0N6j0H8mOXqbJBguqNelNbBy/rHCEV7fVr8hYwUKplw+72zBF1
 s2TDGI9ijl+X7uidl9wxLDnXK0cHdgKUXfDYVJnrQpGinkJDseScJgc0tjI5ipqHTeSg5Ve+/PM
 t1zJ1PEANxbcMSWx/CQ==
X-Proofpoint-GUID: xl2cr-xhRq8b39bY2fylX4qKVJL4q2zN
X-HPE-SCL: -1
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-13_03,2026-04-13_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 impostorscore=0 priorityscore=1501 lowpriorityscore=0
 suspectscore=0 clxscore=1015 adultscore=0 phishscore=0 malwarescore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2604010000
 definitions=main-2604130182

From: Nick Hawkins <nick.hawkins@hpe.com>

Enable ARCH_HPE in the arm64 defconfig to include HPE GSC BMC SoC
support in the default build.

Signed-off-by: Nick Hawkins <nick.hawkins@hpe.com>
Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
---
 arch/arm64/configs/defconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/configs/defconfig b/arch/arm64/configs/defconfig
index xxxxxxxxxxxxxxx..xxxxxxxxxxxxxxx 100644
--- a/arch/arm64/configs/defconfig
+++ b/arch/arm64/configs/defconfig
@@ -xx,6 +xx,7 @@
 CONFIG_ARCH_HISI=y
+CONFIG_ARCH_HPE=y
 CONFIG_ARCH_KEEMBAY=y
-- 
2.34.1
