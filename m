Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7AA693BD241
	for <devicetree@vger.kernel.org>; Wed,  9 Sep 2026 13:10:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788959452; cv=none; b=NsWZSkirdKrxYc19tLF1rlPyrDe3jlYYQqaaBO6mirYio0hVFXr4y3pZ3q7O3oE1Q2WFEVK7sI8VuD/dqInxfXqfRoSFKnP/iNAlhT/+H2/oZzbz6uDShMWEzRcpslsi+GDBVx2qjq1dzxjYTIge+EvClHZCCw7fiW9X5tEzXSI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788959452; c=relaxed/simple;
	bh=mUFl0NwquxVSDzph/Jm5z2ZBB8m6nGd4T8WbWI3OEhs=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=oJgFzokzgwjWXLR8ruHAAVxgurj+7KEv/jvhI2tlptMXezhuOip2jB6p0xVDBlsnn12w4LaSVWckzUjrOhlD30JpMesVLcoc6oYwo80mDtI4gfeZl2sJyAYRf0Plx7YDFivz7oVCeOrYts/w4xB5U/d+g7sJbmXtBMaZV9K3AUk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=CXfy1dEu; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=DqCwW1x9; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="CXfy1dEu";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="DqCwW1x9"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 689BUFmg2376133
	for <devicetree@vger.kernel.org>; Wed, 9 Sep 2026 13:10:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=aUS3+wVO1plGRk+rytPkXU
	UtSPRv7/F40Myna706wX0=; b=CXfy1dEuYo8fpja3Bvnk4/1mEEWzYjYUOBA8tU
	1i2DBKJiKbVl2gHv0Yh70kpynKbtVmDh9v5jaFt0kRCQsjTiOX0JXzKwtxvyj54f
	6x3Be6/MB3DX8xuha42TIa27c7QF4C4cA5bWDXiVEgIFgS8837+7yV3zVThyxK7g
	qOK98/tRw2BwZ/JobnqCtDw5adh2Fe7/7xzQ7al5PJ14g9RwqVc/L0TiJYIXzK5r
	F5biwNCf6GrCs9kOO/EY548SJuxt/eqvszU8T6uY0CkDhpXngEqg50Z+a9B3gPbF
	ZFcJes6UK3TeVSZ9t5uNJYfl2VNpGZ8b0FnGH7bZvt/0OeTA==
Received: from mail-vs1-f72.google.com (mail-vs1-f72.google.com [209.85.217.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gk5ru0jf6-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 09 Sep 2026 13:10:50 +0000 (GMT)
Received: by mail-vs1-f72.google.com with SMTP id ada2fe7eead31-75116a48926so4921628137.3
        for <devicetree@vger.kernel.org>; Wed, 09 Sep 2026 06:10:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788959449; x=1789564249; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=aUS3+wVO1plGRk+rytPkXUUtSPRv7/F40Myna706wX0=;
        b=DqCwW1x95RZ6wHfmKGn373ynxtL1OU02+TScC+JNzsHPL8YG+6SKEk2IhFhfHQhDbB
         PuEbKAoYgupmhUNWwHedq3m+P+VA226UCDZqM12CBEF2CSg7zfvGBKgcKU7usd+UsKrn
         XdNNIuaCwyTJyo4co7uiJa9DIAoFYk+0lvDE5SC7+tr1V+eUSJUnD3YcHiimBCmxdbGT
         bp9LrqKGMLXzZMAIhNCZxqU6yH97y3I2KBt9ZE2YrXfp7dWWf4lnZ7o5ljud+t5ZczaK
         Hi3ocqF/xIXL3eK/xi33ZABOXkqLsEcLTGBeeSZHMeuErLfheLYHeIp74wKfux7XJ3aZ
         06sg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788959449; x=1789564249;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=aUS3+wVO1plGRk+rytPkXUUtSPRv7/F40Myna706wX0=;
        b=IZBPWEpdc8u7WQfmTUNkkd1o4Jd6BTSciIEuYh9zcKw146kXRMW7K+ZEEzK3K6UReS
         3oBciaXzVBKH1b1RsjS7Ds7udJy3IBpv29EnJdb7/lvMKcAhhcnFkSAjUWyYCeNAomnz
         c5rp0f09dg3pTxM5dy+mJzKxH5Oryn01kAXkAF3J7A/MxwmI7p0+1ia5YaLEj6UUv/Sy
         YvrSaXGZ9ad2DBXDjrG6wjf4MODFtJvmBcBNSRpToCxY6ygH5KJbJjviVyhyFsdVsPqf
         JLPPad+y7lkFnjGIT+bDLt1ynBnITzY1Wa1A4PasXAOw7WC0HzC0jwTUH97v6J8AeXcU
         43GA==
X-Gm-Message-State: AFuF++n5QBsKpKo4jWBiKTrsm4kmrwpSldwRghhq5ubbVJQBgiYc7qXf
	EUidUC0/muVz1NcU/RS1ZiwqrFO/cz4ZhMGWHHaiSdjo5xfTtcaU5uWb30LZFAwKpPvIGKFJ49b
	/tQrCJp0ExA/6L1/UP8uN4U1QqslquaUQcYPxXMScUD67aM7Q+kKZPslG/N2D0kxL
X-Gm-Gg: AYBFou0l6lI+Q2zyhtJcddm2qoAnZACXboC4xNItTEys8jSEC2925f87t54HAfMl8CN
	f+khEMN2RB+B5Cp9p4lLth04SALXRfXjb6yoVEjlp+oIfZ6gc5jiqsWSncHS4Nur1br9sUcQkFL
	D/+1pWrUKZPER8Z9TblxNhB6eoZ6FwyrAaOKqbGx3h32PGN1pQ+GpP1aIoVuUcuHthA/nB6RCz/
	w/PySFQSFIXO98WyK3TQhDEtE3kG1qSH6Zn4o1w3zrBfIBfcSgUVWBkDK3mUjMl6T2EncGon4ow
	+pG5rp9uIGSpiXYjgzCKIPNrGlBU/B3Nwyrvbi7yB7pHzKj3sgcWl8iTvzH+dd8zqgXTkUcMBGr
	fdKRphzhGJDFQcp48rM/VBwU=
X-Received: by 2002:a05:6102:4bcc:b0:786:dfa:c5ea with SMTP id ada2fe7eead31-79076bcad32mr501461137.5.1788959449489;
        Wed, 09 Sep 2026 06:10:49 -0700 (PDT)
X-Received: by 2002:a05:6102:4bcc:b0:786:dfa:c5ea with SMTP id ada2fe7eead31-79076bcad32mr501334137.5.1788959447227;
        Wed, 09 Sep 2026 06:10:47 -0700 (PDT)
Received: from [127.0.1.1] ([178.197.219.214])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5b8993253b3sm114594e87.52.2026.09.09.06.10.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Sep 2026 06:10:46 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: [PATCH v3 0/7] dtc: dt-check-style: Improvements for handling
 continued lines
Date: Wed, 09 Sep 2026 15:10:34 +0200
Message-Id: <20260909-b4-dts-style-checker-continued-lines-v3-0-474bb324ae53@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/5WOwQ6CMBBEf4X07JIGsbGe/A/DgS6rVKGVbiESw
 79b1MSzl0neZDIzT8EULLE4ZE8RaLJsvUuw3WQC29pdCGyTWBSyUFJLDaaEJjJwnDsCbAlvFAC
 9i9aN1EBnHTGg2uudqdHslRSp6h7obB/vmVP1YR7NlTCu3d9EoGFM+/EXay1HH+b3ualY3T9/T
 AVIwB2aEnWjjVJHz5wPY92h7/s8iaiWZXkBqhUDCQYBAAA=
X-Change-ID: 20260909-b4-dts-style-checker-continued-lines-c6895bacb860
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Saravana Kannan <saravanak@kernel.org>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=3084;
 i=krzysztof.kozlowski@oss.qualcomm.com; h=from:subject:message-id;
 bh=mUFl0NwquxVSDzph/Jm5z2ZBB8m6nGd4T8WbWI3OEhs=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBqoVrL1MVCRGqeJxaEtuSeN+1zHqXQ+PYFljQ2I
 xe2MEuop9yJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCaqFaywAKCRDBN2bmhouD
 181AEACETfakgsrW6oXf9xQiQX9c8ghUe79916rsly7HL6gnYjTOK8eFGJ/XEp+Pzed6Z6/TkCi
 xdc2M34affJhGaCRWohNP2ApRgDUkrdAiGKRjf8zt08c1/hJsFDvH9k43+LnWjwpdWO5VXMv0qR
 aip+eX5KUVNORvyGdbamJbgssgyBFyMDChMvg0auP/PYQ7EUD8ez7Ssg8FwJhcXXz7aWfexOwB3
 0v/uC6ji9+Ws1Danh0xlQx6wMpXhE3QytwP54jPHwNR0P45KeCk2MRlf/DSpOeThuej1kO46SqC
 JZp+8rEYURTZXZRz0PFTyOrLg5TOduVLOmWCW1I9FliatVjex0i8OmdtSKMNSJE9dFhv0PVSmQC
 k+/A0TbJ65elhCtolAmAHiAJtwvenNj9b9e8YgMPOvLxKMg80PRf4yYbLWrtyhu5kJOgNICDC+i
 Ugrv1lwwMFaMqkRfMn60S3UgvFmUukXV/tSJ4mgTuPmmuTNn+yxSsRneJBv71AbWB1kzUWMc8fb
 0w5KH81Y7S/pzShveQyyi2mlmolCrZmIMXu+0o+pbcbeVpsZxNx67yFQG5idYrSy0TEFYLjgZfH
 PcNroLlzMp4fJOpSRjidVzWAZi+OD0wtUt/sX5iCQwR/oK+iHx+wrzoqdlSPXwvQ81vIOrMrawA
 SyllNbMkZtsPwNg==
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
X-Authority-Analysis: v=2.4 cv=M+997Sws c=1 sm=1 tr=0 ts=6aa15ada cx=c_pps
 a=DUEm7b3gzWu7BqY5nP7+9g==:117 a=+bKQE0WJfmhK2875HamI0Q==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=bC-a23v3AAAA:8 a=EUspDBNiAAAA:8 a=VwQbUJbxAAAA:8 a=A1gXvU92uO_6QKaMkjcA:9
 a=QEXdDO2ut3YA:10 a=-aSRE8QhW-JAV6biHavz:22 a=FO4_E8m0qiDe52t0p3_H:22
X-Proofpoint-GUID: U0NsJamFgl0zoY9Gm76FRq5r2FCj9_kk
X-Proofpoint-ORIG-GUID: U0NsJamFgl0zoY9Gm76FRq5r2FCj9_kk
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTA5MDE0NyBTYWx0ZWRfX0i5RLXz+AI1p
 erxSKPdlB2yG1Xtb/JKqZGmVrVBLkJzf+WOgOlx0NtCm9USooa9szIOUy9dcB2+FercI5Azfhoz
 OmHwV05KXD0DE4gBzr2WiEHpY8h1Q6w=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTA5MDE0NyBTYWx0ZWRfX8kkth5GOpWKB
 Acf54vwYjV++/JiKHDxefx2fVBStkcSlD1ycXNyZb5liYZGg/TvH99CnEHJqXKatIsuWKEgWZP+
 S/VswrvwxEXBWovnCJc/4SqzjkbdEAoUo9hvYkl2nMSbBmZ1twkHa8ujVaFa1b1jyjXDNVcyAk0
 SlrxLFF5+wXsRqteiEc27UjY7bcXnpym9+mmP1/RGj84UTnTPNFF0n8h9JR0FKzC6nxUvpQjoFJ
 39WnMKKgKGla84Z9Ggn+i7syeySedshMVWMpZPgfPaKJf2sanY7+VHIngiWQ+oZ6e/srk4AUE4A
 3xyRpajqMD0ckgDxgiQPabC8xU8apiDYBKrph+mD8APbeyPQBvQiClTSX8I9hPWNIdlfPjjhCzE
 rBkpGSdwBiwOOHnFy3UQ60rIdn0q0vmhn6S0G4Om9QRgxkeNIF7zBtIYEdzpOj0zgnMUHKvTyDP
 8v8Rb1W5haujm8EqM/g==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-08_03,2026-09-09_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 bulkscore=0 spamscore=0 phishscore=0 impostorscore=0
 lowpriorityscore=0 suspectscore=0 clxscore=1015 priorityscore=1501
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2609090147

Changes in v3:
- New commit:
  "dtc: dt-check-style: Relax property ordering rules (drop alphabetical)"
- Improve commit msg of "Unduplicate checks in
  check_mixed_indent_chars()" patch.
- Link to v2: https://patch.msgid.link/20260909-b4-dts-style-checker-continued-lines-v2-0-c5cb4c9d9b66@oss.qualcomm.com

Changes in v2:
1. Four new commits 1-4
2. Drop last commit
v1: https://lore.kernel.org/all/20260906180437.166760-6-krzysztof.kozlowski@oss.qualcomm.com/

Best regards,
Krzysztof

---
Krzysztof Kozlowski (7):
      dtc: dt-check-style: Handle continued lines in check_hex_case()
      dtc: dt-check-style: Handle continued lines in check_line_length()
      dtc: dt-check-style: Handle continued lines in check_trailing_whitespace()
      dtc: dt-check-style: Unduplicate checks in check_mixed_indent_chars()
      dtc: dt-check-style: Right strip whitespaces, leftovers before comments
      dtc: dt-check-style: Properly detect comments in multi-line properties
      dtc: dt-check-style: Relax property ordering rules (drop alphabetical)

 .../devicetree/bindings/dts-coding-style.rst       |   5 +-
 scripts/dtc/dt-check-style                         | 240 ++++++++++-----------
 .../dtc/dt-style-selftest/bad/dts-cont-align.dts   |   1 +
 .../dtc/dt-style-selftest/bad/dts-line-length.dts  |   3 +-
 .../dt-style-selftest/bad/dts-property-order.dts   |   3 +
 .../dt-style-selftest/bad/dts-property-order.dtso  |   3 +
 .../dtc/dt-style-selftest/bad/dts-trailing-ws.dts  |   8 +
 .../dtc/dt-style-selftest/bad/yaml-cont-align.yaml |   1 +
 .../dtc/dt-style-selftest/bad/yaml-hex-case.yaml   |   5 +-
 .../dt-style-selftest/bad/yaml-line-length.yaml    |   3 +-
 .../dtc/dt-style-selftest/bad/yaml-prop-order.yaml |   5 +
 .../dt-style-selftest/bad/yaml-trailing-ws.yaml    |   5 +-
 .../expected/dts-cont-align.dts.txt                |  11 +-
 .../expected/dts-line-length.dts.txt               |   1 +
 .../expected/dts-property-order.dts.txt            |   7 +-
 .../expected/dts-property-order.dtso.txt           |   7 +-
 .../expected/dts-property-pairing.dts.txt          |   6 +-
 .../expected/dts-trailing-ws.dts.txt               |   1 +
 .../expected/yaml-cont-align.yaml.txt              |   3 +-
 .../expected/yaml-hex-case.yaml.txt                |   2 +
 .../expected/yaml-line-length.yaml.txt             |   1 +
 .../expected/yaml-prop-order.yaml.txt              |   1 +
 .../expected/yaml-prop-pairing.yaml.txt            |   6 +-
 .../expected/yaml-trailing-ws.yaml.txt             |   2 +
 .../dtc/dt-style-selftest/good/dts-cont-align.dts  |   1 +
 .../dt-style-selftest/good/dts-property-order.dts  |   3 +
 .../dt-style-selftest/good/dts-property-order.dtso |   3 +
 .../dt-style-selftest/good/yaml-cont-align.yaml    |   1 +
 28 files changed, 190 insertions(+), 148 deletions(-)
---
base-commit: 694b801ceb1bea205878f2136e8b25c888e51be7
change-id: 20260909-b4-dts-style-checker-continued-lines-c6895bacb860

Best regards,
--  
Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

